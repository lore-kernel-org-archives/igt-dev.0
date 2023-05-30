Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B192410E337
 for <igt-dev@lists.freedesktop.org>; Tue, 30 May 2023 04:47:33 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 30 May 2023 10:16:45 +0530
Message-Id: <20230530044645.341877-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] tests/kms_plane_scaling: add
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

Verify the count of supported scalers per CRTC, and proceed with
executing tests if the necessary number of scalers is available.
With the exception of "planes-.*" and "2x-scaler-multi-pipe"
subtests, a minimum of 1 scaler is needed for all other tests,
while these specific tests require a minimum of 2 scalers.

v2: -improved commit message (Kamil)
    -handled get_num_scalers() for non-intel devices (Kamil)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 50 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 0e7cd4a2..4033d2ea 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -368,6 +368,32 @@ const struct {
 	},
 };
 
+/* Returns num_scalers from the crtc debugfs. */
+static int get_num_scalers(data_t *data, enum pipe pipe)
+{
+	char buf[512];
+	char *start_loc;
+	int dir, res;
+	int num_scalers = 0;
+
+	if (is_intel_device(data->drm_fd) &&
+	    intel_display_ver(intel_get_drm_devid(data->drm_fd)) >= 9) {
+
+		dir = igt_debugfs_dir(data->drm_fd);
+		igt_assert(dir >= 0);
+
+		res = igt_debugfs_simple_read(dir, "i915_display_info", buf, sizeof(buf));
+		close(dir);
+		igt_require(res > 0);
+
+		igt_assert(start_loc = strstr(buf, "num_scalers="));
+		igt_assert_eq(sscanf(start_loc, "num_scalers=%d", &num_scalers), 1);
+
+	}
+
+	return num_scalers;
+}
+
 static int get_width(drmModeModeInfo *mode, double scaling_factor)
 {
 	if (scaling_factor == 0.0)
@@ -873,6 +899,9 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
 	igt_output_set_pipe(output1, pipe1);
 	igt_output_set_pipe(output2, pipe2);
 
+	igt_require(get_num_scalers(d, pipe1) >= 2);
+	igt_require(get_num_scalers(d, pipe2) >= 2);
+
 	plane[0] = igt_output_get_plane(output1, 0);
 	igt_require(plane[0]);
 	plane[1] = igt_output_get_plane(output1, 0);
@@ -963,6 +992,8 @@ static void invalid_parameter_tests(data_t *d)
 		igt_output_set_pipe(output, pipe);
 		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
+		igt_require(get_num_scalers(d, pipe) >= 1);
+
 		igt_create_fb(d->drm_fd, 256, 256,
 			      DRM_FORMAT_XRGB8888,
 			      DRM_FORMAT_MOD_LINEAR,
@@ -1138,6 +1169,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 					for_each_valid_output_on_pipe(&data.display, pipe, output) {
 						if (!pipe_output_combo_valid(&data.display, pipe, output))
 							continue;
+						if (get_num_scalers(&data, pipe) < 1)
+							continue;
 
 						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
 							drmModeModeInfo *mode = igt_output_get_mode(output);
@@ -1161,6 +1194,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 					for_each_valid_output_on_pipe(&data.display, pipe, output) {
 						if (!pipe_output_combo_valid(&data.display, pipe, output))
 							continue;
+						if (get_num_scalers(&data, pipe) < 1)
+							continue;
 
 						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
 							drmModeModeInfo *mode = igt_output_get_mode(output);
@@ -1184,6 +1219,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 					for_each_valid_output_on_pipe(&data.display, pipe, output) {
 						if (!pipe_output_combo_valid(&data.display, pipe, output))
 							continue;
+						if (get_num_scalers(&data, pipe) < 1)
+							continue;
 
 						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
 							drmModeModeInfo *mode = igt_output_get_mode(output);
@@ -1206,6 +1243,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				for_each_valid_output_on_pipe(&data.display, pipe, output) {
 					if (!pipe_output_combo_valid(&data.display, pipe, output))
 						continue;
+					if (get_num_scalers(&data, pipe) < 1)
+							continue;
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
 						drmModeModeInfo *mode = igt_output_get_mode(output);
@@ -1224,6 +1263,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				for_each_valid_output_on_pipe(&data.display, pipe, output) {
 					if (!pipe_output_combo_valid(&data.display, pipe, output))
 						continue;
+					if (get_num_scalers(&data, pipe) < 1)
+						continue;
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
 						drmModeModeInfo *mode = igt_output_get_mode(output);
@@ -1242,6 +1283,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				for_each_valid_output_on_pipe(&data.display, pipe, output) {
 					if (!pipe_output_combo_valid(&data.display, pipe, output))
 						continue;
+					if (get_num_scalers(&data, pipe) < 1)
+						continue;
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
 						drmModeModeInfo *mode = igt_output_get_mode(output);
@@ -1260,6 +1303,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				for_each_valid_output_on_pipe(&data.display, pipe, output) {
 					if (!pipe_output_combo_valid(&data.display, pipe, output))
 						continue;
+					if (get_num_scalers(&data, pipe) < 2)
+						continue;
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
 						drmModeModeInfo *mode = igt_output_get_mode(output);
@@ -1282,6 +1327,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			igt_subtest_with_dynamic(intel_paramtests[index].testname) {
 				igt_require_intel(data.drm_fd);
 				for_each_pipe(&data.display, pipe) {
+					if (get_num_scalers(&data, pipe) < 1)
+						continue;
+
 					for_each_valid_output_on_pipe(&data.display, pipe, output) {
 						drmModeModeInfo *mode = NULL;
 						/*
@@ -1307,6 +1355,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			for_each_pipe_with_valid_output(&data.display, pipe, output) {
 				if (!pipe_output_combo_valid(&data.display, pipe, output))
 					continue;
+				if (get_num_scalers(&data, pipe) < 1)
+					continue;
 
 				igt_dynamic_f("pipe-%s-%s-invalid-num-scalers",
 					       kmstest_pipe_name(pipe), igt_output_name(output))
-- 
2.25.1
