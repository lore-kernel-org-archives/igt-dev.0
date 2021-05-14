Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB0306EE0E
 for <igt-dev@lists.freedesktop.org>; Fri, 14 May 2021 06:50:10 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Thu, 13 May 2021 23:49:47 -0700
Message-Id: <20210514064953.1644250-11-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210514064953.1644250-1-alan.previn.teres.alexis@intel.com>
References: <20210514064953.1644250-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 10/16] Verify PXP teardown occured through
 suspend-resume
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

During a suspend-resume cycle, the hardware and driver shall
ensure the PXP session and keys are torn down and re-
established. Verify that key change did occur by repeating
the 3d rendercopy operation before and after a suspend cycle
and ensuring that the encrypted output is different.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tests/i915/gem_pxp.c | 96 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 92 insertions(+), 4 deletions(-)

diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
index 22a2d09a..37c38016 100644
--- a/tests/i915/gem_pxp.c
+++ b/tests/i915/gem_pxp.c
@@ -6,6 +6,8 @@
 #include <sys/ioctl.h>
 
 #include "igt.h"
+#include "igt_device.h"
+#include "igt_sysfs.h"
 #include "i915/gem.h"
 
 IGT_TEST_DESCRIPTION("Test PXP that manages protected content through arbitrated HW-PXP-session");
@@ -31,6 +33,16 @@ IGT_TEST_DESCRIPTION("Test PXP that manages protected content through arbitrated
 #define COPY3D_BASELINE_SRC_TO_DST 1
 #define COPY3D_PROTECTED_SRC_TO_PROTDST 2
 #define COPY3D_PROTECTED_PROTSRC_TO_PROTDST 3
+#define COPY3D_PROTECTED_SRC_TO_PROTDST_SAMPLED 4
+
+/* test-configs for power-management triggered protected session teardown */
+#define SESSION_PMSUSPEND_TEARDOWN_KEY_CHANGE 1
+
+/* Struct and defintions for power management. */
+struct powermgt_data {
+	int debugfsdir;
+	bool has_runtime_pm;
+};
 
 static bool is_pxp_hw_supported(int i915)
 {
@@ -438,7 +450,7 @@ static uint32_t alloc_and_fill_dest_buff(int i915, bool protected, uint32_t size
 #define TSTSURF_INITCOLOR2  0x56785678
 #define TSTSURF_INITCOLOR3  0xabcdabcd
 
-static void test_render_protected_buffer(int i915, uint32_t test_cfg)
+static void __test_render_protected_buffer(int i915, uint32_t test_cfg, uint32_t *outpixels, int outsize)
 {
 	uint32_t ctx, srcbo, dstbo, dstbo2;
 	struct intel_buf *srcbuf, *dstbuf, *dstbuf2;
@@ -486,6 +498,7 @@ static void test_render_protected_buffer(int i915, uint32_t test_cfg)
 
 	case COPY3D_PROTECTED_SRC_TO_PROTDST:
 	case COPY3D_PROTECTED_PROTSRC_TO_PROTDST:
+	case COPY3D_PROTECTED_SRC_TO_PROTDST_SAMPLED:
 		/* Perform a protected render operation but only label
 		 * the dest as protected. After rendering, the content
 		 * should be encrypted
@@ -513,7 +526,12 @@ static void test_render_protected_buffer(int i915, uint32_t test_cfg)
 		assert_bo_content_check(i915, dstbo, COMPARE_COLOR_UNREADIBLE,
 					TSTSURF_SIZE, TSTSURF_FILLCOLOR2, NULL, 0);
 
-		if (test_cfg == COPY3D_PROTECTED_SRC_TO_PROTDST) {
+		if (test_cfg == COPY3D_PROTECTED_SRC_TO_PROTDST_SAMPLED)
+			assert_bo_content_check(i915, dstbo, COPY_BUFFER,
+						TSTSURF_SIZE, 0, outpixels, outsize);
+
+		if ((test_cfg == COPY3D_PROTECTED_SRC_TO_PROTDST) ||
+			(test_cfg == COPY3D_PROTECTED_SRC_TO_PROTDST_SAMPLED)) {
 			intel_bb_destroy(ibb);
 			intel_buf_destroy(srcbuf);
 			gem_close(i915, srcbo);
@@ -534,7 +552,7 @@ static void test_render_protected_buffer(int i915, uint32_t test_cfg)
 		 * going into new-dest
 		 */
 		assert_bo_content_check(i915, dstbo, COPY_BUFFER,
-			TSTSURF_SIZE, 0, encrypted, TSTSURF_SIZE);
+					TSTSURF_SIZE, 0, encrypted, TSTSURF_SIZE);
 
 		dstbo2 = alloc_and_fill_dest_buff(i915, false, TSTSURF_SIZE, TSTSURF_INITCOLOR3);
 		dstbuf2 = intel_buf_create_using_handle(bops, dstbo2, TSTSURF_WIDTH, TSTSURF_HEIGHT,
@@ -548,7 +566,8 @@ static void test_render_protected_buffer(int i915, uint32_t test_cfg)
 		gen12_render_copyfunc(ibb, dstbuf, 0, 0, TSTSURF_WIDTH, TSTSURF_HEIGHT, dstbuf2, 0, 0);
 		gem_sync(i915, dstbo2);
 
-		assert_bo_content_check(i915, dstbo2, COMPARE_BUFFER_READIBLE, TSTSURF_SIZE, 0, encrypted, TSTSURF_SIZE);
+		assert_bo_content_check(i915, dstbo2, COMPARE_BUFFER_READIBLE,
+					TSTSURF_SIZE, 0, encrypted, TSTSURF_SIZE);
 
 		intel_bb_destroy(ibb);
 		intel_buf_destroy(srcbuf);
@@ -568,11 +587,66 @@ static void test_render_protected_buffer(int i915, uint32_t test_cfg)
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
+	igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED);
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
+		__test_render_protected_buffer(i915, COPY3D_PROTECTED_SRC_TO_PROTDST_SAMPLED,
+					       encrypted_pixels_b4, TSTSURF_SIZE);
+
+		trigger_powermgt_suspend_cycle(i915, pm);
+
+		__test_render_protected_buffer(i915, COPY3D_PROTECTED_SRC_TO_PROTDST_SAMPLED,
+					       encrypted_pixels_aft, TSTSURF_SIZE);
+
+		while (loop < (TSTSURF_SIZE/TSTSURF_BYTESPP)) {
+			if (encrypted_pixels_b4[loop] == encrypted_pixels_aft[loop])
+				++matched_after_keychange;
+			++loop;
+		}
+		igt_assert_eq(matched_after_keychange, 0);
+		break;
+
+	default:
+		igt_info("Skipping unknown power-mgt test_cfg = %d\n", test_cfg);
+		break;
+	}
+}
 
 igt_main
 {
 	int i915 = -1;
 	bool pxp_supported = false;
+	struct powermgt_data pm = {0};
 	igt_render_copyfunc_t rendercopy = NULL;
 	uint32_t devid = 0;
 
@@ -645,6 +719,20 @@ igt_main
 		igt_subtest("protected-encrypted-src-copy-not-readible")
 			test_render_protected_buffer(i915, COPY3D_PROTECTED_PROTSRC_TO_PROTDST);
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
+			test_protected_session_teardown(i915, SESSION_PMSUSPEND_TEARDOWN_KEY_CHANGE, &pm);
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
