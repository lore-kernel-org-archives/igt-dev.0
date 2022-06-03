Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C17C10F415
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jun 2022 16:11:54 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Jun 2022 21:42:04 +0530
Message-Id: <20220603161204.6202-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/kms_cdclk: Add new subtest
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

Driver still works in such a way that CDCLK is never decreased, but
always increase. This is done in order to avoid continuous CDCLK
switching.

So, in case if new CDCLK(after transition from low to high mode)
is same as reference CDCLK i.e. reference = new because of
above stated driver optimization; the current mode-transition test
is passed else ref < new condition is checked (as we expect CDCLK
will bump after mode transition from low to high mode). This is done
in current mode-transition subtest where we are checking mode
transition on each valid output.

In this patch, a new subtest is added which lowers modes of
all valid outputs simultaneously and then switches to highest
mode to get proper DVFS behavior along with the above mentioned
driver policy. In this case, we should expect CDCLK switch from low
to high.

Along with this, few cleanups have been done.

Cc: Uma Shankar<uma.shankar@intel.com>
Cc: Mika Kahola <mika.kahola@intel.com>

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/i915/kms_cdclk.c | 109 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 101 insertions(+), 8 deletions(-)

diff --git a/tests/i915/kms_cdclk.c b/tests/i915/kms_cdclk.c
index 818cbfd5..08750e25 100644
--- a/tests/i915/kms_cdclk.c
+++ b/tests/i915/kms_cdclk.c
@@ -26,12 +26,12 @@
 
 #include "igt.h"
 
-IGT_TEST_DESCRIPTION("Test cdclk features : crawling");
+IGT_TEST_DESCRIPTION("Test cdclk features : crawling and squashing");
 
-#define HDISPLAY_4K     3840
-#define VDISPLAY_4K     2160
+#define HDISPLAY_4K	3840
+#define VDISPLAY_4K	2160
 #define VREFRESH	60
-#define MAX_CDCLK_4K    307200
+#define MAX_CDCLK_4K	307200
 
 /* Test flags */
 enum {
@@ -237,6 +237,94 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
 	igt_remove_fb(display->drm_fd, &fb);
 }
 
+static void test_mode_transition_on_all_outputs(data_t *data)
+{
+	igt_display_t *display = &data->display;
+	int debugfs_fd = data->debugfs_fd;
+	drmModeModeInfo *mode, *mode_hi, *mode_lo;
+	igt_output_t *output;
+	int valid_outputs = 0;
+	int cdclk_ref, cdclk_new;
+	uint16_t width = 0, height = 0;
+	struct igt_fb fb;
+	igt_pipe_t *pipe;
+	igt_plane_t *plane;
+	int i = 0, j = 0;
+
+	do_cleanup_display(display);
+	igt_display_reset(display);
+
+	for_each_connected_output(&data->display, output)
+		valid_outputs++;
+
+	for_each_connected_output(display, output) {
+		mode = igt_output_get_mode(output);
+		igt_assert(mode);
+
+		igt_output_set_pipe(output, PIPE_NONE);
+
+		width = max(width, mode->hdisplay);
+		height = max(height, mode->vdisplay);
+	}
+
+	igt_create_pattern_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
+			      DRM_FORMAT_MOD_LINEAR, &fb);
+	i = 0;
+	for_each_connected_output(display, output) {
+		pipe = &display->pipes[i];
+		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+
+		mode = NULL;
+
+		igt_output_set_pipe(output, i);
+		mode = igt_output_get_mode(output);
+		igt_assert(mode);
+
+		mode_lo = get_lowres_mode(output);
+
+		igt_output_override_mode(output, mode_lo);
+		igt_plane_set_fb(plane, &fb);
+		igt_fb_set_size(&fb, plane, mode_lo->hdisplay, mode_lo->vdisplay);
+		igt_plane_set_size(plane, mode_lo->hdisplay, mode_lo->vdisplay);
+		i++;
+	}
+
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	cdclk_ref = get_current_cdclk_freq(debugfs_fd);
+
+	j = 0;
+	for_each_connected_output(display, output) {
+		pipe = &display->pipes[j];
+		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+
+		mode = NULL;
+
+		igt_output_set_pipe(output, j);
+		mode = igt_output_get_mode(output);
+		igt_assert(mode);
+
+		mode_hi = get_highres_mode(output);
+		igt_require(mode_hi != NULL);
+
+		igt_output_override_mode(output, mode_hi);
+		igt_plane_set_fb(plane, &fb);
+		igt_fb_set_size(&data->fb, plane, mode_hi->hdisplay, mode_hi->vdisplay);
+		igt_plane_set_size(plane, mode_hi->hdisplay, mode_hi->vdisplay);
+		j++;
+	}
+
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	cdclk_new = get_current_cdclk_freq(debugfs_fd);
+	igt_info("CD clock frequency %d -> %d\n", cdclk_ref, cdclk_new);
+
+	/* cdclk should bump */
+	igt_assert_lt(cdclk_ref, cdclk_new);
+
+	igt_plane_set_fb(plane, NULL);
+	do_cleanup_display(display);
+	igt_remove_fb(data->drm_fd, &fb);
+}
+
 static void run_cdclk_test(data_t *data, uint32_t flags)
 {
 	igt_display_t *display = &data->display;
@@ -244,7 +332,7 @@ static void run_cdclk_test(data_t *data, uint32_t flags)
 	enum pipe pipe;
 
 	for_each_pipe_with_valid_output(display, pipe, output) {
-		igt_dynamic_f("%s-pipe-%s", output->name, kmstest_pipe_name(pipe))
+		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
 			if (igt_pipe_connector_valid(pipe, output)) {
 				if (flags & TEST_PLANESCALING)
 					test_plane_scaling(data, pipe, output);
@@ -266,18 +354,23 @@ igt_main
 		kmstest_set_vt_graphics_mode();
 		data.devid = intel_get_drm_devid(data.drm_fd);
 		igt_require_f(hardware_supported(&data),
-			      "Hardware doesn't support crawling.\n");
+			      "Hardware doesn't support crawling/squashing.\n");
 		igt_display_require(&data.display, data.drm_fd);
 		igt_display_require_output(&data.display);
 	}
 
-	igt_describe("Plane scaling test to validate cdclk frequency change");
+	igt_describe("Plane scaling test to validate cdclk frequency change.");
 	igt_subtest_with_dynamic("plane-scaling")
 		run_cdclk_test(&data, TEST_PLANESCALING);
-	igt_describe("Mode transition (low to high) test to validate cdclk frequency change");
+	igt_describe("Mode transition (low to high) test to validate cdclk frequency change.");
 	igt_subtest_with_dynamic("mode-transition")
 		run_cdclk_test(&data, TEST_MODETRANSITION);
 
+	igt_describe("Mode transition (low to high) test to validate cdclk frequency change "
+		     "by simultaneous modesets on all pipes with valid outputs.");
+	igt_subtest("mode-transition-all-outputs")
+		test_mode_transition_on_all_outputs(&data);
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 	}
-- 
2.25.1
