Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 675036E875
 for <igt-dev@lists.freedesktop.org>; Tue, 18 May 2021 10:33:49 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Tue, 18 May 2021 03:33:38 -0700
Message-Id: <20210518103344.2264397-12-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210518103344.2264397-1-alan.previn.teres.alexis@intel.com>
References: <20210518103344.2264397-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 11/17] Verify PXP teardown occurred through
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
 tests/i915/gem_pxp.c | 67 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 66 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
index 2f2d2716..10134604 100644
--- a/tests/i915/gem_pxp.c
+++ b/tests/i915/gem_pxp.c
@@ -9,6 +9,12 @@
 IGT_TEST_DESCRIPTION("Test PXP that manages protected content through arbitrated HW-PXP-session");
 /* Note: PXP = "Protected Xe Path" */
 
+/* Struct and definitions for power management. */
+struct powermgt_data {
+	int debugfsdir;
+	bool has_runtime_pm;
+};
+
 static bool is_pxp_hw_supported(int i915)
 {
 	uint32_t devid = intel_get_drm_devid(i915);
@@ -465,7 +471,7 @@ static void test_render_baseline(int i915)
 	buf_ops_destroy(bops);
 }
 
-static void test_render_pxp_src_to_protdest(int i915)
+static void __test_render_pxp_src_to_protdest(int i915, uint32_t *outpixels, int outsize)
 {
 	uint32_t ctx, srcbo, dstbo;
 	struct intel_buf *srcbuf, *dstbuf;
@@ -507,6 +513,10 @@ static void test_render_pxp_src_to_protdest(int i915)
 	assert_bo_content_check(i915, dstbo, COMPARE_COLOR_UNREADIBLE,
 				TSTSURF_SIZE, TSTSURF_FILLCOLOR2, NULL, 0);
 
+	if (outpixels)
+		assert_bo_content_check(i915, dstbo, COPY_BUFFER,
+					TSTSURF_SIZE, 0, outpixels, outsize);
+
 	intel_bb_destroy(ibb);
 	intel_buf_destroy(srcbuf);
 	gem_close(i915, srcbo);
@@ -516,6 +526,11 @@ static void test_render_pxp_src_to_protdest(int i915)
 	buf_ops_destroy(bops);
 }
 
+static void test_render_pxp_src_to_protdest(int i915)
+{
+	__test_render_pxp_src_to_protdest(i915, NULL, 0);
+}
+
 static void test_render_pxp_protsrc_to_protdest(int i915)
 {
 	uint32_t ctx, srcbo, dstbo, dstbo2;
@@ -595,10 +610,47 @@ static void test_render_pxp_protsrc_to_protdest(int i915)
 	buf_ops_destroy(bops);
 }
 
+static void init_powermgt_resources(int i915, struct powermgt_data *pm)
+{
+	pm->debugfsdir = igt_debugfs_dir(i915);
+	igt_require(pm->debugfsdir != -1);
+	pm->has_runtime_pm = igt_setup_runtime_pm(i915);
+	igt_require(pm->has_runtime_pm);
+}
+
+static void trigger_powermgt_suspend_cycle(int i915,
+	struct powermgt_data *pm)
+{
+	igt_pm_enable_sata_link_power_management();
+	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_DEVICES);
+	igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED);
+}
+
+static void test_pxp_pwrcycle_teardown_keychange(int i915, struct powermgt_data *pm)
+{
+	uint32_t encrypted_pixels_b4[TSTSURF_SIZE/TSTSURF_BYTESPP];
+	uint32_t encrypted_pixels_aft[TSTSURF_SIZE/TSTSURF_BYTESPP];
+	int matched_after_keychange = 0, loop = 0;
+
+	__test_render_pxp_src_to_protdest(i915, encrypted_pixels_b4, TSTSURF_SIZE);
+
+	trigger_powermgt_suspend_cycle(i915, pm);
+
+	__test_render_pxp_src_to_protdest(i915, encrypted_pixels_aft, TSTSURF_SIZE);
+
+	while (loop < (TSTSURF_SIZE/TSTSURF_BYTESPP)) {
+		if (encrypted_pixels_b4[loop] == encrypted_pixels_aft[loop])
+			++matched_after_keychange;
+		++loop;
+	}
+	igt_assert_eq(matched_after_keychange, 0);
+}
+
 igt_main
 {
 	int i915 = -1;
 	bool pxp_supported = false;
+	struct powermgt_data pm = {0};
 	igt_render_copyfunc_t rendercopy = NULL;
 	uint32_t devid = 0;
 
@@ -671,6 +723,19 @@ igt_main
 		igt_subtest("protected-encrypted-src-copy-not-readible")
 			test_render_pxp_protsrc_to_protdest(i915);
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
+		igt_subtest("verify-pxp-key-change-after-suspend-resume")
+			test_pxp_pwrcycle_teardown_keychange(i915, &pm);
+	}
 
 	igt_fixture {
 		close(i915);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
