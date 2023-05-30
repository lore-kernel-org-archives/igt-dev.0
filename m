Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1175010E1E8
 for <igt-dev@lists.freedesktop.org>; Tue, 30 May 2023 17:16:46 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 30 May 2023 22:54:02 +0530
Message-Id: <20230530172402.19999-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC,
 i-g-t] tests/kms_vrr: Add a new subtest to validate different VRR
 modes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>, mitulkumar.ajitkumar.golani@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Test switch from base VRR mode to various VRR supported modes
without triggering modeset.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_vrr.c | 142 +++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 127 insertions(+), 15 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index d2d79c4e..173d7010 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -46,6 +46,7 @@ enum {
 	TEST_SUSPEND = 1 << 2,
 	TEST_FLIPLINE = 1 << 3,
 	TEST_NEGATIVE = 1 << 4,
+	TEST_BASE_MODE_TO_VARIOUS_VRR_MODE = 1 << 5,
 };
 
 typedef struct range {
@@ -56,10 +57,17 @@ typedef struct range {
 typedef struct data {
 	igt_display_t display;
 	int drm_fd;
+	int count_modes;
+	uint32_t hdisplay;
+	uint32_t vdisplay;
 	igt_plane_t *primary;
 	igt_fb_t fb0;
 	igt_fb_t fb1;
 	range_t range;
+	drmModeConnector *connector;
+	drmModeModeInfo *modes;
+	uint32_t base_mode_index;
+	uint32_t preferred_mode_index;
 } data_t;
 
 typedef struct vtest_ns {
@@ -168,6 +176,77 @@ get_vrr_range(data_t *data, igt_output_t *output)
 	return range;
 }
 
+static bool is_variable_video_mode(data_t *data, drmModeModeInfo *mode)
+{
+	drmModeModeInfo *base_mode = &data->modes[data->base_mode_index];
+	uint32_t bm_clock = base_mode->clock;
+
+	if (mode->hdisplay == data->hdisplay &&
+	    mode->vdisplay == data->vdisplay &&
+	    mode->clock == bm_clock &&
+	    mode->type & DRM_MODE_TYPE_DRIVER) {
+		return true;
+	}
+
+	return false;
+}
+
+static void init_data(data_t *data, igt_output_t *output)
+{
+	int i;
+	uint32_t pm_hdisplay, pm_vdisplay, max_clk = 0;
+	drmModeModeInfo *preferred_mode;
+	drmModeConnector *connector;
+
+	connector = data->connector = output->config.connector;
+	data->count_modes = connector->count_modes;
+	data->modes = (drmModeModeInfo *)malloc(sizeof(drmModeModeInfo) * data->count_modes);
+
+	for (i = 0; i < data->count_modes; i++) {
+		data->modes[i] = connector->modes[i];
+#ifdef FSV_DEBUG
+		igt_info("mode %d:", i);
+		kmstest_dump_mode(&data->modes[i]);
+#endif
+	}
+
+	/* searching the preferred mode */
+	for (i = 0; i < connector->count_modes; i++) {
+		drmModeModeInfo *mode = &connector->modes[i];
+
+		if (mode->type & DRM_MODE_TYPE_PREFERRED) {
+			data->preferred_mode_index = i;
+			data->hdisplay = mode->hdisplay;
+			data->vdisplay = mode->vdisplay;
+			pm_hdisplay = preferred_mode->hdisplay;
+			pm_vdisplay = preferred_mode->vdisplay;
+			break;
+		}
+	}
+
+	/* searching the base mode; */
+	for (i = 0; i < connector->count_modes; i++) {
+		drmModeModeInfo *mode = &connector->modes[i];
+
+		if (mode->hdisplay == pm_hdisplay && mode->vdisplay == pm_vdisplay) {
+			if (mode->clock > max_clk) {
+				max_clk = mode->clock;
+				data->base_mode_index = i;
+			}
+		}
+	}
+	igt_info("preferred=%d, base=%d\n", data->preferred_mode_index, data->base_mode_index);
+
+	for (i = 0; i < connector->count_modes; i++) {
+		drmModeModeInfo *mode = &connector->modes[i];
+
+		if (is_variable_video_mode(data, mode))
+			igt_debug("mode[%d] is variable video mode.\n", i);
+	}
+
+	data->range = get_vrr_range(data, output);
+}
+
 /* Returns vrr test frequency for min, mid & max range. */
 static vtest_ns_t get_test_rate_ns(range_t range)
 {
@@ -201,39 +280,42 @@ static void set_vrr_on_pipe(data_t *data, enum pipe pipe, bool enabled)
 }
 
 /* Prepare the display for testing on the given pipe. */
-static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
+static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe, drmModeModeInfo *mode)
 {
-	drmModeModeInfo mode;
 	cairo_t *cr;
 
 	/* Reset output */
 	igt_display_reset(&data->display);
 	igt_output_set_pipe(output, pipe);
 
+	igt_output_override_mode(output, mode);
+
 	/* Capture VRR range */
 	data->range = get_vrr_range(data, output);
 
-	/* Override mode with max vrefresh.
-	 *   - vrr_min range should be less than the override mode vrefresh.
-	 *   - Limit the vrr_max range with the override mode vrefresh.
-	 */
-	mode = output_mode_with_maxrate(output, data->range.max);
-	igt_require(mode.vrefresh > data->range.min);
-	data->range.max = mode.vrefresh;
-	igt_output_override_mode(output, &mode);
+	if (mode == NULL) {
+		/* Override mode with max vrefresh.
+		 *   - vrr_min range should be less than the override mode vrefresh.
+		 *   - Limit the vrr_max range with the override mode vrefresh.
+		 */
+		*mode = output_mode_with_maxrate(output, data->range.max);
+		igt_require(mode->vrefresh > data->range.min);
+		data->range.max = mode->vrefresh;
+		igt_output_override_mode(output, mode);
+	}
 
 	/* Prepare resources */
-	igt_create_color_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
+	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
 			    0.50, 0.50, 0.50, &data->fb0);
 
-	igt_create_color_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
+	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
 			    0.50, 0.50, 0.50, &data->fb1);
 
 	cr = igt_get_cairo_ctx(data->drm_fd, &data->fb0);
 
-	igt_paint_color(cr, 0, 0, mode.hdisplay / 10, mode.vdisplay / 10,
+	igt_paint_color(cr, 0, 0, mode->hdisplay / 10, mode->vdisplay / 10,
 			1.00, 0.00, 0.00);
 
 	igt_put_cairo_ctx(cr);
@@ -353,19 +435,27 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 	return total_flip ? ((total_pass * 100) / total_flip) : 0;
 }
 
+/* Returns the rate duration in nanoseconds for the given refresh rate. */
+static uint64_t nsec_per_frame(uint64_t refresh)
+{
+	return NSECS_PER_SEC / refresh;
+}
+
 /* Basic VRR flip functionality test - enable, measure, disable, measure */
 static void
 test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 {
 	uint32_t result;
+	int index;
 	vtest_ns_t vtest_ns;
 	range_t range;
 	uint64_t rate;
+	drmModeModeInfo *mode;
 
-	prepare_test(data, output, pipe);
 	range = data->range;
 	vtest_ns = get_test_rate_ns(range);
 	rate = vtest_ns.mid;
+	mode = NULL;
 
 	igt_info("VRR Test execution on %s, PIPE_%s with VRR range: (%u-%u) Hz\n",
 		 output->name, kmstest_pipe_name(pipe), range.min, range.max);
@@ -380,6 +470,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	flip_and_measure(data, output, pipe, rate, 250000000ull);
 
 	if (flags & TEST_DPMS) {
+		prepare_test(data, output, pipe, mode);
 		kmstest_set_connector_dpms(output->display->drm_fd,
 					   output->config.connector,
 					   DRM_MODE_DPMS_OFF);
@@ -388,9 +479,11 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 					   DRM_MODE_DPMS_ON);
 	}
 
-	if (flags & TEST_SUSPEND)
+	if (flags & TEST_SUSPEND) {
+		prepare_test(data, output, pipe, mode);
 		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
 					      SUSPEND_TEST_NONE);
+	}
 
 	/*
 	 * Check flipline mode by making sure that flips happen at flipline
@@ -408,6 +501,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	 *      next Vmin.
 	 */
 	if (flags & TEST_FLIPLINE) {
+		prepare_test(data, output, pipe, NULL);
 		rate = rate_from_refresh(range.max + 5);
 		result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
 		igt_assert_f(result > 75,
@@ -416,6 +510,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	}
 
 	if (flags & ~TEST_NEGATIVE) {
+		prepare_test(data, output, pipe, NULL);
 		rate = vtest_ns.mid;
 		result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
 		igt_assert_f(result > 75,
@@ -423,7 +518,20 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 			     ((range.max + range.min) / 2), rate, result);
 	}
 
+	if (flags & TEST_BASE_MODE_TO_VARIOUS_VRR_MODE) {
+		init_data(data, output);
+		index = data->base_mode_index;
+		mode = &data->modes[index];
+		prepare_test(data, output, pipe, NULL);
+		rate = nsec_per_frame(mode->vrefresh);
+		result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
+		igt_assert_f(result > 75,
+			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
+			     ((range.max + range.min) / 2), rate, result);
+	}
+
 	if (flags & TEST_FLIPLINE) {
+		prepare_test(data, output, pipe, NULL);
 		rate = rate_from_refresh(range.min - 5);
 		result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
 		igt_assert_f(result < 50,
@@ -526,6 +634,10 @@ igt_main
 	igt_subtest_with_dynamic("negative-basic")
 		run_vrr_test(&data, test_basic, TEST_NEGATIVE);
 
+	igt_describe("Test switch from base VRR mode to various VRR modes");
+	igt_subtest("vrr-base-to-various-vrr-modes")
+		run_vrr_test(&data, test_basic, TEST_BASE_MODE_TO_VARIOUS_VRR_MODE);
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 	}
-- 
2.39.0
