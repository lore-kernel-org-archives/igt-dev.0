Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB7C10E221
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Oct 2023 07:48:40 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 30 Oct 2023 13:28:15 +0530
Message-Id: <20231030075815.26761-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4] tests/kms_frontbuffer_tracking: Extend
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

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 113 +++++++++++++++++++++++--
 1 file changed, 105 insertions(+), 8 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index f90d09f9f..a549a7fea 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -45,6 +45,15 @@
 
 #define TIME SLOW_QUICK(1000, 10000)
 
+/**
+ * SUBTEST: plane-fbc-rte
+ * Description: Sanity test to enable FBC on a plane.
+ * Driver requirement: i915, xe
+ * Functionality: fbc
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ */
+
 IGT_TEST_DESCRIPTION("Test the Kernel's frontbuffer tracking mechanism and "
 		     "its related features: FBC, PSR and DRRS");
 
@@ -381,14 +390,6 @@ static void init_mode_params(struct modeset_params *params,
 	params->cursor.w = 64;
 	params->cursor.h = 64;
 
-	params->sprite.plane = igt_pipe_get_plane_type(&drm.display.pipes[pipe], DRM_PLANE_TYPE_OVERLAY);
-	igt_require(params->sprite.plane);
-	params->sprite.fb = NULL;
-	params->sprite.x = 0;
-	params->sprite.y = 0;
-	params->sprite.w = 64;
-	params->sprite.h = 64;
-
 	free(mode);
 }
 
@@ -888,6 +889,19 @@ static bool fbc_mode_too_large(void)
 	return strstr(buf, "FBC disabled: mode too large for compression\n");
 }
 
+static bool fbc_enable_per_plane(int plane_index, enum pipe pipe)
+{
+	char buf[128];
+	char buf1[128];
+	char pipe_name;
+
+	pipe_name = *kmstest_pipe_name(pipe);
+	sprintf(buf1, "%d%s", plane_index, &pipe_name);
+
+	debugfs_read_crtc("i915_fbc_status", buf);
+	return strstr(buf, buf1);
+}
+
 static bool drrs_wait_until_rr_switch_to_low(void)
 {
 	return igt_wait(is_drrs_low(), 5000, 1);
@@ -1691,6 +1705,32 @@ static void set_region_for_test(const struct test_mode *t,
 	do_assertions(ASSERT_NO_ACTION_CHANGE);
 }
 
+static void set_plane_for_test_fbc(const struct test_mode *t, igt_plane_t *plane)
+{
+	struct igt_fb fb;
+	uint32_t color;
+
+	igt_create_fb(drm.fd, prim_mode_params.mode.hdisplay, prim_mode_params.mode.vdisplay,
+			t->format, DRM_FORMAT_MOD_LINEAR, &fb);
+	color = pick_color(&fb, COLOR_PRIM_BG);
+
+	igt_draw_rect_fb(drm.fd, drm.bops, 0, &fb, IGT_DRAW_BLT,
+			 0, 0, fb.width, fb.height,
+			 color);
+
+	igt_output_override_mode(prim_mode_params.output, &prim_mode_params.mode);
+	igt_output_set_pipe(prim_mode_params.output, prim_mode_params.pipe);
+
+	igt_plane_set_fb(plane, &fb);
+	igt_plane_set_position(plane, 0, 0);
+	igt_plane_set_size(plane, prim_mode_params.mode.hdisplay, prim_mode_params.mode.vdisplay);
+	igt_fb_set_size(&fb, plane, prim_mode_params.mode.hdisplay, prim_mode_params.mode.vdisplay);
+
+	igt_display_commit(&drm.display);
+	igt_require(!fbc_enable_per_plane(plane->index, prim_mode_params.pipe));
+	do_assertions(ASSERT_NO_ACTION_CHANGE);
+}
+
 static bool enable_features_for_test(const struct test_mode *t)
 {
 	bool ret = false;
@@ -1941,6 +1981,49 @@ static void rte_subtest(const struct test_mode *t)
 	}
 }
 
+static bool is_valid_plane(igt_plane_t *plane)
+{
+	int index = plane->index;
+	/*
+	 * Execute test only on first three planes
+	 */
+
+	return index != 0 && index != 1 && index != 2;
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
+ *   A failure here means that every other subtest will probably fail too. It
+ *   probably means that the Kernel is just not enabling the feature we want.
+ */
+
+static void plane_fbc_rte_subtest(const struct test_mode *t)
+{
+	igt_plane_t *plane;
+
+	for_each_plane_on_pipe(&drm.display, t->pipes, plane) {
+
+		if (!is_valid_plane(plane))
+			continue;
+
+		prepare_subtest_data(t, NULL);
+		unset_all_crtcs();
+		do_assertions(ASSERT_FBC_DISABLED);
+		set_plane_for_test_fbc(t, plane);
+	}
+
+}
+
 static void update_wanted_crc(const struct test_mode *t, igt_crc_t *crc)
 {
 	if (t->screen == SCREEN_PRIM)
@@ -4936,6 +5019,20 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
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
