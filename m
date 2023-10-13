Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ADB910E5D4
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Oct 2023 10:23:09 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 13 Oct 2023 15:53:46 +0530
Message-Id: <20231013102346.95872-4-swati2.sharma@intel.com>
In-Reply-To: <20231013102346.95872-1-swati2.sharma@intel.com>
References: <20231013102346.95872-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/kms_plane_scaling: use
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
v3: -fixed get_num_scalers() (JP)
    -added get_num_scalers() to lib (JP)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 25a57e6f1..720e82d38 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -1093,6 +1093,9 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
 	igt_output_set_pipe(output1, pipe1);
 	igt_output_set_pipe(output2, pipe2);
 
+	igt_require(get_num_scalers(d->drm_fd, pipe1) >= 2);
+	igt_require(get_num_scalers(d->drm_fd, pipe2) >= 2);
+
 	plane[0] = igt_output_get_plane(output1, 0);
 	igt_require(plane[0]);
 	plane[1] = igt_output_get_plane(output1, 0);
@@ -1191,6 +1194,8 @@ static void invalid_parameter_tests(data_t *d)
 		igt_output_set_pipe(output, pipe);
 		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
+		igt_require(get_num_scalers(d->drm_fd, pipe) >= 1);
+
 		igt_create_fb(d->drm_fd, 256, 256,
 			      DRM_FORMAT_XRGB8888,
 			      DRM_FORMAT_MOD_LINEAR,
@@ -1375,6 +1380,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 					for_each_valid_output_on_pipe(&data.display, pipe, output) {
 						if (!pipe_output_combo_valid(&data.display, pipe, output))
 							continue;
+						if (get_num_scalers(data.drm_fd, pipe) < 1)
+							continue;
 
 						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
 							drmModeModeInfo *mode = igt_output_get_mode(output);
@@ -1398,6 +1405,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 					for_each_valid_output_on_pipe(&data.display, pipe, output) {
 						if (!pipe_output_combo_valid(&data.display, pipe, output))
 							continue;
+						if (get_num_scalers(data.drm_fd, pipe) < 1)
+							continue;
 
 						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
 							drmModeModeInfo *mode = igt_output_get_mode(output);
@@ -1421,6 +1430,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 					for_each_valid_output_on_pipe(&data.display, pipe, output) {
 						if (!pipe_output_combo_valid(&data.display, pipe, output))
 							continue;
+						if (get_num_scalers(data.drm_fd, pipe) < 1)
+							continue;
 
 						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
 							drmModeModeInfo *mode = igt_output_get_mode(output);
@@ -1443,6 +1454,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				for_each_valid_output_on_pipe(&data.display, pipe, output) {
 					if (!pipe_output_combo_valid(&data.display, pipe, output))
 						continue;
+					if (get_num_scalers(data.drm_fd, pipe) < 1)
+						continue;
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
 						drmModeModeInfo *mode = igt_output_get_mode(output);
@@ -1461,6 +1474,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				for_each_valid_output_on_pipe(&data.display, pipe, output) {
 					if (!pipe_output_combo_valid(&data.display, pipe, output))
 						continue;
+					if (get_num_scalers(data.drm_fd, pipe) < 1)
+						continue;
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
 						drmModeModeInfo *mode = igt_output_get_mode(output);
@@ -1479,6 +1494,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				for_each_valid_output_on_pipe(&data.display, pipe, output) {
 					if (!pipe_output_combo_valid(&data.display, pipe, output))
 						continue;
+					if (get_num_scalers(data.drm_fd, pipe) < 1)
+						continue;
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
 						drmModeModeInfo *mode = igt_output_get_mode(output);
@@ -1497,6 +1514,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				for_each_valid_output_on_pipe(&data.display, pipe, output) {
 					if (!pipe_output_combo_valid(&data.display, pipe, output))
 						continue;
+					if (get_num_scalers(data.drm_fd, pipe) < 2)
+						continue;
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
 						drmModeModeInfo *mode = igt_output_get_mode(output);
@@ -1521,6 +1540,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				for_each_pipe(&data.display, pipe) {
 					for_each_valid_output_on_pipe(&data.display, pipe, output) {
 						drmModeModeInfo *mode = NULL;
+
+						if (get_num_scalers(data.drm_fd, pipe) < 1)
+							continue;
 						/*
 						 * Need to find mode with lowest vrefresh else
 						 * we can exceed cdclk limits.
@@ -1544,6 +1566,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			for_each_pipe_with_valid_output(&data.display, pipe, output) {
 				if (!pipe_output_combo_valid(&data.display, pipe, output))
 					continue;
+				if (get_num_scalers(data.drm_fd, pipe) < 1)
+						continue;
 
 				igt_dynamic_f("pipe-%s-%s-invalid-num-scalers",
 					       kmstest_pipe_name(pipe), igt_output_name(output))
-- 
2.25.1
