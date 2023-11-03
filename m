Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B5F610E052
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 05:05:01 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Nov 2023 10:44:37 +0530
Message-Id: <20231103051438.19342-2-nidhi1.gupta@intel.com>
In-Reply-To: <20231103051438.19342-1-nidhi1.gupta@intel.com>
References: <20231103051438.19342-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/kms_frontbuffer_tracking: Extend
 the test to enable FBC for each plane
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Added a new subtest to validate FBC on each plane, this new subtest
will first disable the fbc feature on all pipes and planes and then
enable it on all plane one by one and confirm.

v2: Modify tests to disable primary and enable other plane
    to check fbc is enabled or not. <Bhanu>

v3: Implemented design changes as suggested <Bhanu>

v4: Fixed nitpicks (Bhanu)

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 106 +++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index f90d09f9f..61c0dd0fd 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -43,6 +43,15 @@
 #include "igt_sysfs.h"
 #include "igt_psr.h"
 
+/**
+ * SUBTEST: plane-fbc-rte
+ * Description: Sanity test to enable FBC on a plane.
+ * Driver requirement: i915, xe
+ * Functionality: fbc
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ */
+
 #define TIME SLOW_QUICK(1000, 10000)
 
 IGT_TEST_DESCRIPTION("Test the Kernel's frontbuffer tracking mechanism and "
@@ -888,6 +897,17 @@ static bool fbc_mode_too_large(void)
 	return strstr(buf, "FBC disabled: mode too large for compression\n");
 }
 
+static bool fbc_enable_per_plane(int plane_index, enum pipe pipe)
+{
+	char buf[128];
+	char buf_plane[128];
+
+	sprintf(buf_plane, "%d%s", plane_index, kmstest_pipe_name(pipe));
+
+	debugfs_read_crtc("i915_fbc_status", buf);
+	return strstr(strstr(buf, "*"), buf_plane);
+}
+
 static bool drrs_wait_until_rr_switch_to_low(void)
 {
 	return igt_wait(is_drrs_low(), 5000, 1);
@@ -1691,6 +1711,27 @@ static void set_region_for_test(const struct test_mode *t,
 	do_assertions(ASSERT_NO_ACTION_CHANGE);
 }
 
+static void set_plane_for_test_fbc(const struct test_mode *t, igt_plane_t *plane)
+{
+	struct igt_fb fb;
+	uint32_t color;
+
+	create_fb(t->format, prim_mode_params.mode.hdisplay, prim_mode_params.mode.vdisplay, t->tiling, t->plane, &fb);
+	color = pick_color(&fb, COLOR_PRIM_BG);
+	igt_draw_rect_fb(drm.fd, drm.bops, 0, &fb, IGT_DRAW_BLT,
+			 0, 0, fb.width, fb.height,
+			 color);
+	igt_plane_set_fb(plane, &fb);
+	igt_plane_set_position(plane, 0, 0);
+	igt_plane_set_size(plane, prim_mode_params.mode.hdisplay, prim_mode_params.mode.vdisplay);
+	igt_fb_set_size(&fb, plane, prim_mode_params.mode.hdisplay, prim_mode_params.mode.vdisplay);
+	igt_display_commit_atomic(&drm.display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	wanted_crc = &blue_crcs[t->format].crc;
+	fbc_update_last_action();
+	do_assertions(ASSERT_FBC_ENABLED);
+	igt_assert_f(fbc_enable_per_plane(plane->index, prim_mode_params.pipe), "FBC disabled\n");
+}
+
 static bool enable_features_for_test(const struct test_mode *t)
 {
 	bool ret = false;
@@ -1941,6 +1982,57 @@ static void rte_subtest(const struct test_mode *t)
 	}
 }
 
+static bool is_valid_plane(igt_plane_t *plane)
+{
+	int index = plane->index;
+
+	if (plane->type == DRM_PLANE_TYPE_CURSOR)
+		return false;
+	/*
+	 * Execute test only on first three planes
+	 */
+	return ((index >= 0) && (index < 3));
+}
+
+/**
+ * plane-fbc-rte - the basic sanity test
+ *
+ * METHOD
+ *   Just disable primary screen, assert everything is disabled, then enable single
+ *   screens and single plane one by one  and assert that the tested fbc is enabled
+ *   for the particular plane.
+ *
+ * EXPECTED RESULTS
+ *   Blue screens and t->feature enabled.
+ *
+ * FAILURES
+ *   A failure here means that fbc is not getting enabled for requested plane. It means
+ *   kernel is not able to enable fbc on the requested plane.
+ */
+
+static void plane_fbc_rte_subtest(const struct test_mode *t)
+{
+	int ver;
+	igt_plane_t *plane;
+
+	ver = intel_display_ver(intel_get_drm_devid(drm.fd));
+	igt_require_f((ver >= 20), "Can't test fbc for each plane\n");
+	prepare_subtest_data(t, NULL);
+	unset_all_crtcs();
+	do_assertions(ASSERT_FBC_DISABLED | DONT_ASSERT_CRC);
+	igt_output_override_mode(prim_mode_params.output, &prim_mode_params.mode);
+	igt_output_set_pipe(prim_mode_params.output, prim_mode_params.pipe);
+
+	for_each_plane_on_pipe(&drm.display, prim_mode_params.pipe, plane) {
+		if (!is_valid_plane(plane))
+			continue;
+		set_plane_for_test_fbc(t, plane);
+	}
+
+	plane = NULL;
+	igt_display_reset(&drm.display);
+}
+
 static void update_wanted_crc(const struct test_mode *t, igt_crc_t *crc)
 {
 	if (t->screen == SCREEN_PRIM)
@@ -4936,6 +5028,20 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		}
 	}
 
+	t.pipes = PIPE_SINGLE;
+	t.feature = FEATURE_FBC;
+	t.screen = SCREEN_PRIM;
+	t.fbs = FBS_INDIVIDUAL;
+	t.format = FORMAT_DEFAULT;
+	/* Make sure nothing is using these values. */
+	t.flip = -1;
+	t.method = -1;
+	t.tiling = opt.tiling;
+
+	igt_subtest_f("plane-fbc-rte") {
+		plane_fbc_rte_subtest(&t);
+	}
+
 	TEST_MODE_ITER_BEGIN(t)
 
 		igt_subtest_f("%s-%s-%s-%s-%s-draw-%s",
-- 
2.39.0
