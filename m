Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45FA10E736
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Oct 2023 03:06:40 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 26 Oct 2023 08:46:10 +0530
Message-Id: <20231026031610.21625-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5] tests/kms_frontbuffer_tracking: Extend
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

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 95 ++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index f90d09f9f..a3dd3f63b 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -224,6 +224,8 @@ struct fb_region {
 	int h;
 };
 
+struct igt_fb default_fb;
+
 struct draw_pattern_info {
 	bool frames_stack;
 	int n_rects;
@@ -888,6 +890,14 @@ static bool fbc_mode_too_large(void)
 	return strstr(buf, "FBC disabled: mode too large for compression\n");
 }
 
+static bool fbc_enable_per_plane(void)
+{
+	char buf[128];
+
+	debugfs_read_crtc("i915_fbc_status", buf);
+	return strstr(buf, "*");
+}
+
 static bool drrs_wait_until_rr_switch_to_low(void)
 {
 	return igt_wait(is_drrs_low(), 5000, 1);
@@ -1691,6 +1701,31 @@ static void set_region_for_test(const struct test_mode *t,
 	do_assertions(ASSERT_NO_ACTION_CHANGE);
 }
 
+static void set_plane_for_test_fbc(const struct test_mode *t, igt_plane_t *plane)
+{
+	//create_fb
+	struct igt_fb fb;
+	uint32_t color;
+
+	igt_create_fb(drm.fd, prim_mode_params.mode.hdisplay, prim_mode_params.mode.vdisplay,
+			t->format, DRM_FORMAT_MOD_LINEAR, &fb);
+	//fill_fb_region
+	color = pick_color(&fb, COLOR_PRIM_BG);
+
+	igt_draw_rect_fb(drm.fd, drm.bops, 0, &fb, IGT_DRAW_BLT,
+			 0, 0, fb.width, fb.height,
+			 color);
+	set_mode_for_params(&prim_mode_params);
+	igt_plane_set_fb(plane, &fb);
+	igt_plane_set_position(plane, 0, 0);
+	igt_plane_set_size(plane, prim_mode_params.mode.hdisplay, prim_mode_params.mode.vdisplay);
+	igt_fb_set_size(&fb, plane, prim_mode_params.mode.hdisplay, prim_mode_params.mode.vdisplay);
+
+	igt_display_commit(&drm.display);
+	igt_require(!fbc_enable_per_plane());
+	do_assertions(ASSERT_NO_ACTION_CHANGE);
+}
+
 static bool enable_features_for_test(const struct test_mode *t)
 {
 	bool ret = false;
@@ -1940,6 +1975,39 @@ static void rte_subtest(const struct test_mode *t)
 		set_region_for_test(t, &scnd_mode_params.sprite);
 	}
 }
+/**
+ * SUBTEST: plane-fbc-rte
+ * Description: Sanity test to enable FBC on a plane.
+ * Driver requirement: i915, xe
+ * Functionality: fbc
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ */
+
+/**
+ * plane-fbc-rte - the basic sanity test
+ *
+ * METHOD
+ *   Just disable all screens, assert everything is disabled, then enable all
+ *   screens  and planes  and assert that the tested feature is enabled.
+ *
+ * EXPECTED RESULTS
+ *   Blue screens and t->feature enabled.
+ *
+ * FAILURES
+ *   A failure here means that every other subtest will probably fail too. It
+ *   probably means that the Kernel is just not enabling the feature we want.
+ */
+static void plane_fbc_rte_subtest(const struct test_mode *t, igt_plane_t *plane)
+{
+	do_assertions(ASSERT_FBC_DISABLED);
+
+	if (plane->index == 0)
+		enable_prim_screen_and_wait(t);
+	if (plane->index > 0)
+		set_plane_for_test_fbc(t, plane);
+
+}
 
 static void update_wanted_crc(const struct test_mode *t, igt_crc_t *crc)
 {
@@ -4910,6 +4978,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
 	struct test_mode t;
 	int devid;
+	igt_plane_t *plane;
 
 	igt_fixture {
 		setup_environment();
@@ -4936,6 +5005,32 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		}
 	}
 
+	igt_subtest_with_dynamic("plane-fbc-rte") {
+
+		int n_planes = 0;
+
+		t.pipes = PIPE_SINGLE;
+		t.feature = FEATURE_FBC;
+		t.screen = SCREEN_PRIM;
+		t.fbs = FBS_INDIVIDUAL;
+		t.format = FORMAT_DEFAULT;
+		/* Make sure nothing is using these values. */
+		t.flip = -1;
+		t.method = -1;
+		t.tiling = opt.tiling;
+
+		for_each_plane_on_pipe(&drm.display, prim_mode_params.pipe, plane) {
+			n_planes++;
+			if (n_planes == 4)
+				break;
+			igt_dynamic_f("plane-%u-fbc-rte", plane->index) {
+				prepare_subtest_data(&t, NULL);
+				unset_all_crtcs();
+				plane_fbc_rte_subtest(&t, plane);
+			}
+		}
+	}
+
 	TEST_MODE_ITER_BEGIN(t)
 
 		igt_subtest_f("%s-%s-%s-%s-%s-draw-%s",
-- 
2.39.0
