Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6058D10E4D4
 for <igt-dev@lists.freedesktop.org>; Thu, 18 May 2023 05:31:16 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 18 May 2023 11:00:24 +0530
Message-Id: <20230518053024.249956-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: add
 get_num_scalers()
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

Check no. of scalers supported per crtc and execute tests if
we have required no. of scalers supported.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 47 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 0e7cd4a2..592b1b52 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -368,6 +368,29 @@ const struct {
 	},
 };
 
+/* Returns num_scalers from the crtc debugfs. */
+static int get_num_scalers(data_t *data, enum pipe pipe)
+{
+	char buf[512];
+	char *start_loc;
+	int dir, res;
+	int num_scalers;
+
+	dir = igt_debugfs_dir(data->drm_fd);
+	igt_assert(dir >= 0);
+
+	igt_require_intel(data->drm_fd);
+
+	res = igt_debugfs_simple_read(dir, "i915_display_info", buf, sizeof(buf));
+	igt_require(res > 0);
+	close(dir);
+
+	igt_assert(start_loc = strstr(buf, "num_scalers="));
+	igt_assert_eq(sscanf(start_loc, "num_scalers=%d", &num_scalers), 1);
+
+	return num_scalers;
+}
+
 static int get_width(drmModeModeInfo *mode, double scaling_factor)
 {
 	if (scaling_factor == 0.0)
@@ -873,6 +896,9 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
 	igt_output_set_pipe(output1, pipe1);
 	igt_output_set_pipe(output2, pipe2);
 
+	igt_require(get_num_scalers(d, pipe1) >= 2);
+	igt_require(get_num_scalers(d, pipe2) >= 2);
+
 	plane[0] = igt_output_get_plane(output1, 0);
 	igt_require(plane[0]);
 	plane[1] = igt_output_get_plane(output1, 0);
@@ -963,6 +989,8 @@ static void invalid_parameter_tests(data_t *d)
 		igt_output_set_pipe(output, pipe);
 		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
+		igt_require(get_num_scalers(d, pipe) >= 1);
+
 		igt_create_fb(d->drm_fd, 256, 256,
 			      DRM_FORMAT_XRGB8888,
 			      DRM_FORMAT_MOD_LINEAR,
@@ -1138,6 +1166,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 					for_each_valid_output_on_pipe(&data.display, pipe, output) {
 						if (!pipe_output_combo_valid(&data.display, pipe, output))
 							continue;
+						if (get_num_scalers(&data, pipe) <= 1)
+							continue;
 
 						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
 							drmModeModeInfo *mode = igt_output_get_mode(output);
@@ -1161,6 +1191,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 					for_each_valid_output_on_pipe(&data.display, pipe, output) {
 						if (!pipe_output_combo_valid(&data.display, pipe, output))
 							continue;
+						if (get_num_scalers(&data, pipe) <= 1)
+							continue;
 
 						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
 							drmModeModeInfo *mode = igt_output_get_mode(output);
@@ -1184,6 +1216,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 					for_each_valid_output_on_pipe(&data.display, pipe, output) {
 						if (!pipe_output_combo_valid(&data.display, pipe, output))
 							continue;
+						if (get_num_scalers(&data, pipe) <= 1)
+							continue;
 
 						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
 							drmModeModeInfo *mode = igt_output_get_mode(output);
@@ -1206,6 +1240,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				for_each_valid_output_on_pipe(&data.display, pipe, output) {
 					if (!pipe_output_combo_valid(&data.display, pipe, output))
 						continue;
+					if (get_num_scalers(&data, pipe) <= 1)
+							continue;
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
 						drmModeModeInfo *mode = igt_output_get_mode(output);
@@ -1224,6 +1260,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				for_each_valid_output_on_pipe(&data.display, pipe, output) {
 					if (!pipe_output_combo_valid(&data.display, pipe, output))
 						continue;
+					if (get_num_scalers(&data, pipe) <= 1)
+						continue;
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
 						drmModeModeInfo *mode = igt_output_get_mode(output);
@@ -1242,6 +1280,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				for_each_valid_output_on_pipe(&data.display, pipe, output) {
 					if (!pipe_output_combo_valid(&data.display, pipe, output))
 						continue;
+					if (get_num_scalers(&data, pipe) <= 1)
+						continue;
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
 						drmModeModeInfo *mode = igt_output_get_mode(output);
@@ -1260,6 +1300,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				for_each_valid_output_on_pipe(&data.display, pipe, output) {
 					if (!pipe_output_combo_valid(&data.display, pipe, output))
 						continue;
+					if (get_num_scalers(&data, pipe) <= 2)
+						continue;
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
 						drmModeModeInfo *mode = igt_output_get_mode(output);
@@ -1282,6 +1324,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			igt_subtest_with_dynamic(intel_paramtests[index].testname) {
 				igt_require_intel(data.drm_fd);
 				for_each_pipe(&data.display, pipe) {
+					if (get_num_scalers(&data, pipe) <= 1)
+						continue;
+
 					for_each_valid_output_on_pipe(&data.display, pipe, output) {
 						drmModeModeInfo *mode = NULL;
 						/*
@@ -1307,6 +1352,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			for_each_pipe_with_valid_output(&data.display, pipe, output) {
 				if (!pipe_output_combo_valid(&data.display, pipe, output))
 					continue;
+				if (get_num_scalers(&data, pipe) <= 1)
+					continue;
 
 				igt_dynamic_f("pipe-%s-%s-invalid-num-scalers",
 					       kmstest_pipe_name(pipe), igt_output_name(output))
-- 
2.25.1
