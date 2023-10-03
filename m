Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CCD010E04C
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Oct 2023 05:45:00 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  3 Oct 2023 11:20:42 +0530
Message-Id: <20231003055042.2011886-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] RFC: tests/intel/kms_pm_dc: Add new test to
 validate PKGC-8
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add new test to valdiate deep sleep state (PKGC-8) for extended vblank
scenario.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 72 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 66 insertions(+), 6 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 1e9ca5d6c..5739dc432 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -95,6 +95,13 @@
  * Functionality: dpms, pm_dc
  * Mega feature: Display Power
  * Test category: functionality test
+ *
+ * SUBTEST: pkgc-8
+ * Description: This test validatess display engine entry to PKGC-8 state
+ * Driver requirement: i915, xe
+ * Functionality: dpms, pm_dc
+ * Mega feature: Display Power
+ * Test category: functionality test
  */
 
 /* DC State Flags */
@@ -171,7 +178,7 @@ static void cleanup_dc_psr(data_t *data)
 	igt_remove_fb(data->drm_fd, &data->fb_white);
 }
 
-static void cleanup_dc3co_fbs(data_t *data)
+static void cleanup_vpb_fbs(data_t *data)
 {
 	igt_plane_t *primary;
 
@@ -190,17 +197,17 @@ static void paint_rectangles(data_t *data,
 			     igt_fb_t *fb)
 {
 	cairo_t *cr = igt_get_cairo_ctx(data->drm_fd, fb);
-	int i, l = mode->hdisplay / 3;
-	int rows_remaining = mode->hdisplay % 3;
+	int i, l = mode->vdisplay / 3;
+	int rows_remaining = mode->vdisplay % 3;
 
 	/* Paint 3 solid rectangles. */
 	for (i = 0 ; i < 3; i++) {
-		igt_paint_color(cr, i * l, 0, l, mode->vdisplay,
+		igt_paint_color(cr, i * l, 0, l, mode->hdisplay,
 				colors[i].r, colors[i].g, colors[i].b);
 	}
 
 	if (rows_remaining > 0)
-		igt_paint_color(cr, i * l, 0, rows_remaining, mode->vdisplay,
+		igt_paint_color(cr, i * l, 0, rows_remaining, mode->hdisplay,
 				colors[i - 1].r, colors[i - 1].g,
 				colors[i - 1].b);
 
@@ -393,7 +400,7 @@ static void test_dc3co_vpb_simulation(data_t *data)
 	setup_dc3co(data);
 	setup_videoplayback(data);
 	check_dc3co_with_videoplayback_like_load(data);
-	cleanup_dc3co_fbs(data);
+	cleanup_vpb_fbs(data);
 }
 
 static void psr_dpms(data_t *data, int mode)
@@ -601,6 +608,49 @@ static unsigned int read_pkgc_counter(int debugfs_root_fd)
 	return get_dc_counter(str);
 }
 
+static unsigned int read_pkgc8_counter(int debugfs_root_fd)
+{
+        char buf[4096];
+        char *str;
+        int len;
+
+        len = igt_sysfs_read(debugfs_root_fd, PACKAGE_CSTATE_PATH, buf, sizeof(buf) - 1);
+        igt_skip_on_f(len < 0, "PKGC state file not found\n");
+        buf[len] = '\0';
+        str = strstr(buf, "Package C8");
+        igt_skip_on_f(!str, "PKGC8 is not supported.\n");
+
+        return get_dc_counter(str);
+}
+
+static void test_deep_pkgc_state(data_t *data)
+{
+	igt_plane_t *primary;
+	int pre_val, cur_val;
+	time_t secs = 6;
+        time_t startTime = time(NULL);
+
+	pre_val = read_pkgc8_counter(data->debugfs_root_fd);
+	psr_dpms(data, DRM_MODE_DPMS_OFF);
+	setup_videoplayback(data);
+        primary = igt_output_get_plane_type(data->output,
+                                            DRM_PLANE_TYPE_PRIMARY);
+        igt_plane_set_fb(primary, NULL);
+
+        while (time(NULL) - startTime < secs) {
+                igt_plane_set_fb(primary, &data->fb_rgb);
+                igt_display_commit(&data->display);
+
+                igt_plane_set_fb(primary, &data->fb_rgr);
+                igt_display_commit(&data->display);
+        }
+
+	cur_val = read_pkgc8_counter(data->debugfs_root_fd);
+	psr_dpms(data, DRM_MODE_DPMS_ON);
+	igt_assert_f(cur_val > pre_val, "PKGC8 is not achieved.\n");
+	cleanup_vpb_fbs(data);
+}
+
 static void test_pkgc_state_dpms(data_t *data)
 {
 	unsigned int timeout_sec = 6;
@@ -736,6 +786,16 @@ igt_main
 		test_dc9_dpms(&data);
 	}
 
+	igt_describe("This test validates display engine entry to PKGC8 state");
+	igt_subtest("pkgc-8") {
+		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
+			      "PC8+ residencies not supported\n");
+		if (intel_display_ver(data.devid) >= 14)
+			test_deep_pkgc_state(&data);
+		else
+			igt_skip("PKGC Not supported on this platform");
+	}
+
 	igt_fixture {
 		free(data.debugfs_dump);
 		close(data.debugfs_fd);
-- 
2.25.1
