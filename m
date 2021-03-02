Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B269F89E0D
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Mar 2021 22:58:13 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Tue,  2 Mar 2021 14:53:32 -0800
Message-Id: <20210302225334.361966-10-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210302225334.361966-1-alan.previn.teres.alexis@intel.com>
References: <20210302225334.361966-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC i-g-t 09/11] Add test to verify session key renewed
 after suspend-resume cycle
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Add a subtest to verify that before and after a suspend-resume
cycle, repeating the same protected rendering operation yields
different encrypted output reflecting updated encryption keys
after auto-teardown.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tests/i915/i915_pxp.c | 107 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 105 insertions(+), 2 deletions(-)

diff --git a/tests/i915/i915_pxp.c b/tests/i915/i915_pxp.c
index 2290fe34..11ca05df 100644
--- a/tests/i915/i915_pxp.c
+++ b/tests/i915/i915_pxp.c
@@ -6,6 +6,8 @@
 #include <sys/ioctl.h>
 
 #include "igt.h"
+#include "igt_device.h"
+#include "igt_sysfs.h"
 #include "i915/gem.h"
 
 IGT_TEST_DESCRIPTION("Test PXP (Protected Xe Path), which is the component "
@@ -32,6 +34,19 @@ IGT_TEST_DESCRIPTION("Test PXP (Protected Xe Path), which is the component "
 #define COPY3D_BASELINE_SRC_TO_DST 1
 #define COPY3D_PROTECTED_SRC_TO_PROTDST 2
 #define COPY3D_PROTECTED_PROTSRC_TO_PROTDST 3
+#define COPY3D_PROTECTED_SRC_TO_PROTDST_SAMPLED 4
+
+/* test-configs for power-management triggered protected session teardown */
+#define SESSION_PMSUSPEND_TEARDOWN_KEY_CHANGE 1
+#define SESSION_PMSUSPEND_TEARDOWN_PROTCTX_BAN_CHK 2
+#define SESSION_PMSUSPEND_TEARDOWN_PROTCTX_BAN_EXEC 3
+#define SESSION_PMSUSPEND_TEARDOWN_PROTBO_BAN_EXEC 4
+
+/* Struct and defintions for power management. */
+struct powermgt_data {
+	int debugfsdir;
+	bool has_runtime_pm;
+};
 
 static bool is_pxp_hw_supported(int i915)
 {
@@ -472,7 +487,8 @@ static uint32_t alloc_and_fill_dest_buff(int i915, bool protected,
 #define TSTSURF_INITCOLOR1  0x12341234
 #define TSTSURF_INITCOLOR2  0x56785678
 #define TSTSURF_INITCOLOR3  0xabcdabcd
-static void test_render_protected_buffer(int i915, uint32_t test_cfg)
+static void __test_render_protected_buffer(int i915, uint32_t test_cfg,
+	uint32_t *outpixels, int outsize)
 {
 	uint32_t ctx, srcbo, dstbo, dstbo2;
 	struct intel_buf *srcbuf, *dstbuf, *dstbuf2;
@@ -532,6 +548,7 @@ static void test_render_protected_buffer(int i915, uint32_t test_cfg)
 
 	case COPY3D_PROTECTED_SRC_TO_PROTDST:
 	case COPY3D_PROTECTED_PROTSRC_TO_PROTDST:
+	case COPY3D_PROTECTED_SRC_TO_PROTDST_SAMPLED:
 		/* Perform a protected render operation but only label
 		 * the dest as protected. After rendering, the content
 		 * should be encrypted
@@ -567,7 +584,12 @@ static void test_render_protected_buffer(int i915, uint32_t test_cfg)
 		assert_bo_content_check(i915, dstbo, COMPARE_COLOR_UNREADIBLE,
 			TSTSURF_SIZE, TSTSURF_FILLCOLOR2, NULL, 0);
 
-		if (test_cfg == COPY3D_PROTECTED_SRC_TO_PROTDST) {
+		if (test_cfg == COPY3D_PROTECTED_SRC_TO_PROTDST_SAMPLED)
+			assert_bo_content_check(i915, dstbo, COPY_BUFFER,
+				TSTSURF_SIZE, 0, outpixels, outsize);
+
+		if ((test_cfg == COPY3D_PROTECTED_SRC_TO_PROTDST) ||
+			(test_cfg == COPY3D_PROTECTED_SRC_TO_PROTDST_SAMPLED)) {
 			intel_bb_destroy(ibb);
 			intel_buf_destroy(srcbuf);
 			gem_close(i915, srcbo);
@@ -627,10 +649,75 @@ static void test_render_protected_buffer(int i915, uint32_t test_cfg)
 	buf_ops_destroy(bops);
 }
 
+static void test_render_protected_buffer(int i915, uint32_t test_cfg)
+{
+	__test_render_protected_buffer(i915, test_cfg, NULL, 0);
+}
+
+static void init_powermgt_resources(int i915, struct powermgt_data *pm)
+{
+	pm->debugfsdir = igt_debugfs_dir(i915);
+	igt_require(pm->debugfsdir != -1);
+	pm->has_runtime_pm = igt_setup_runtime_pm(i915);
+	igt_require(pm->has_runtime_pm);
+
+}
+
+static void trigger_powermgt_suspend_cycle(int i915,
+	struct powermgt_data *pm)
+{
+	igt_pm_enable_sata_link_power_management();
+
+
+	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_DEVICES);
+
+	igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED);
+	gem_test_engine(i915, I915_EXEC_RENDER);
+	while ((!igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE))) {
+		igt_info("Waited 10 secs for resume - kick render again!\n");
+		gem_test_engine(i915, I915_EXEC_RENDER);
+	}
+}
+
+static void test_protected_session_teardown(int i915, uint32_t test_cfg,
+		struct powermgt_data *pm)
+{
+	uint32_t encrypted_pixels_b4[TSTSURF_SIZE/TSTSURF_BYTESPP];
+	uint32_t encrypted_pixels_aft[TSTSURF_SIZE/TSTSURF_BYTESPP];
+	int matched_after_keychange = 0, loop = 0;
+
+	switch (test_cfg) {
+	case SESSION_PMSUSPEND_TEARDOWN_KEY_CHANGE:
+		__test_render_protected_buffer(i915,
+			COPY3D_PROTECTED_SRC_TO_PROTDST_SAMPLED,
+			encrypted_pixels_b4, TSTSURF_SIZE);
+
+		trigger_powermgt_suspend_cycle(i915, pm);
+
+		__test_render_protected_buffer(i915,
+			COPY3D_PROTECTED_SRC_TO_PROTDST_SAMPLED,
+			encrypted_pixels_aft, TSTSURF_SIZE);
+
+		while (loop < (TSTSURF_SIZE/TSTSURF_BYTESPP)) {
+			if (encrypted_pixels_b4[loop] ==
+				encrypted_pixels_aft[loop])
+				++matched_after_keychange;
+			++loop;
+		}
+		igt_assert_eq(matched_after_keychange, 0);
+		break;
+	default:
+		igt_info("Skipping unknown power-mgt test_cfg = %d\n",
+			test_cfg);
+		break;
+	}
+}
+
 igt_main
 {
 	int i915 = -1;
 	bool pxp_supported = false;
+	struct powermgt_data pm = {0};
 	igt_render_copyfunc_t rendercopy = NULL;
 	uint32_t devid = 0;
 
@@ -719,6 +806,22 @@ igt_main
 			test_render_protected_buffer(i915,
 				COPY3D_PROTECTED_PROTSRC_TO_PROTDST);
 	}
+	igt_subtest_group {
+		igt_fixture {
+			igt_require(pxp_supported);
+			devid = intel_get_drm_devid(i915);
+			igt_assert(devid);
+			rendercopy = igt_get_render_copyfunc(devid);
+			igt_require(rendercopy);
+			init_powermgt_resources(i915, &pm);
+		}
+		igt_describe("Verify suspend-resume teardown management:");
+		igt_subtest("verify-pxp-key-change-after-suspend-resume") {
+			test_protected_session_teardown(i915,
+				SESSION_PMSUSPEND_TEARDOWN_KEY_CHANGE,
+				&pm);
+		}
+	}
 
 	igt_fixture {
 		close(i915);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
