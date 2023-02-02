Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A3810E459
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Feb 2023 05:09:34 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  2 Feb 2023 10:45:08 +0530
Message-Id: <20230202051509.28983-7-nidhi1.gupta@intel.com>
In-Reply-To: <20230202051509.28983-1-nidhi1.gupta@intel.com>
References: <20230202051509.28983-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v4 6/7] tests/kms_plane_scaling: Limit the
 execution to two pipes/planes
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

From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

As the execution is taking more time, limit the execution of
clipping-clamping-[rotation | pixel-formats] tests to two (first
& last) pipes and two (first & last) planes.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_plane_scaling.c | 47 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 887a55e6..c32ea9d4 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -485,6 +485,8 @@ static void test_scaler_with_rotation_pipe(data_t *d,
 	unsigned format = DRM_FORMAT_XRGB8888;
 	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 	igt_plane_t *plane;
+	int first_plane = -1;
+	int last_plane = -1;
 
 	cleanup_crtc(d);
 
@@ -494,6 +496,19 @@ static void test_scaler_with_rotation_pipe(data_t *d,
 		if (plane->type == DRM_PLANE_TYPE_CURSOR)
 			continue;
 
+		if (first_plane < 0)
+			first_plane = j__;
+
+		last_plane = j__;
+	}
+
+	for_each_plane_on_pipe(display, pipe, plane) {
+		if (plane->type == DRM_PLANE_TYPE_CURSOR)
+			continue;
+
+		if (!d->extended && j__ != first_plane && j__ != last_plane)
+			continue;
+
 		for (int i = 0; i < ARRAY_SIZE(rotations); i++) {
 			igt_rotation_t rot = rotations[i];
 
@@ -514,17 +529,32 @@ static void test_scaler_with_pixel_format_pipe(data_t *d, int width, int height,
 	igt_display_t *display = &d->display;
 	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 	igt_plane_t *plane;
+	int first_plane = -1;
+	int last_plane = -1;
 
 	cleanup_crtc(d);
 
 	igt_output_set_pipe(output, pipe);
 
+	for_each_plane_on_pipe(display, pipe, plane) {
+		if (plane->type == DRM_PLANE_TYPE_CURSOR)
+			continue;
+
+		if (first_plane < 0)
+			first_plane = j__;
+
+		last_plane = j__;
+	}
+
 	for_each_plane_on_pipe(display, pipe, plane) {
 		struct igt_vec tested_formats;
 
 		if (plane->type == DRM_PLANE_TYPE_CURSOR)
 			continue;
 
+		if (!d->extended && j__ != first_plane && j__ != last_plane)
+			continue;
+
 		igt_vec_init(&tested_formats, sizeof(uint32_t));
 
 		for (int j = 0; j < plane->drm_plane->count_formats; j++) {
@@ -845,6 +875,8 @@ static data_t data;
 igt_main_args("", long_opts, help_str, opt_handler, &data)
 {
 	enum pipe pipe;
+	enum pipe active_pipes[IGT_MAX_PIPES];
+	uint32_t last_pipe = 0;
 
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
@@ -852,6 +884,11 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		data.devid = is_i915_device(data.drm_fd) ?
 			intel_get_drm_devid(data.drm_fd) : 0;
 		igt_require(data.display.is_atomic);
+
+		/* Get active pipes. */
+		for_each_pipe(&data.display, pipe)
+			active_pipes[last_pipe++] = pipe;
+		last_pipe--;
 	}
 
 	igt_subtest_group {
@@ -916,6 +953,11 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			for_each_pipe_with_single_output(&data.display, pipe, output) {
 				drmModeModeInfo *mode;
 
+				if (igt_run_in_simulation() &&
+				    pipe != active_pipes[0] &&
+				    pipe != active_pipes[last_pipe])
+					continue;
+
 				mode = igt_output_get_mode(output);
 
 				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
@@ -929,6 +971,11 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			for_each_pipe_with_single_output(&data.display, pipe, output) {
 				drmModeModeInfo *mode;
 
+				if (igt_run_in_simulation() &&
+				    pipe != active_pipes[0] &&
+				    pipe != active_pipes[last_pipe])
+					continue;
+
 				mode = igt_output_get_mode(output);
 
 				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
-- 
2.39.0
