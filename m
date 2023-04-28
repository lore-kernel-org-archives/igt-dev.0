Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85AF310EC8F
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Apr 2023 07:19:22 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 28 Apr 2023 12:43:45 +0530
Message-Id: <20230428071350.2561575-43-bhanuprakash.modem@intel.com>
In-Reply-To: <20230428071350.2561575-1-bhanuprakash.modem@intel.com>
References: <20230428071350.2561575-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V5 42/47] tests/kms_plane_scaling: Add XE support
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

Add XE driver support for kms tests.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_plane_scaling.c | 41 ++++++++++++++++++++++-----------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 19528a405..a37abd16d 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -52,9 +52,9 @@ struct invalid_paramtests {
 	} params[8];
 };
 
-static const struct invalid_paramtests i915_paramtests[] = {
+static const struct invalid_paramtests intel_paramtests[] = {
 	{
-		.testname = "i915-max-src-size",
+		.testname = "intel-max-src-size",
 		.planesize = {3840, 2160},
 	},
 };
@@ -463,7 +463,7 @@ static const igt_rotation_t rotations[] = {
 
 static bool can_scale(data_t *d, unsigned format)
 {
-	if (!is_i915_device(d->drm_fd))
+	if (!is_intel_device(d->drm_fd))
 		return true;
 
 	switch (format) {
@@ -488,7 +488,7 @@ static bool test_format(data_t *data,
 	if (!igt_fb_supported_format(format))
 		return false;
 
-	if (!is_i915_device(data->drm_fd) ||
+	if (!is_intel_device(data->drm_fd) ||
 	    data->extended)
 		return true;
 
@@ -505,7 +505,7 @@ static bool test_format(data_t *data,
 
 static bool test_pipe_iteration(data_t *data, enum pipe pipe, int iteration)
 {
-	if (!is_i915_device(data->drm_fd) ||
+	if (!is_intel_device(data->drm_fd) ||
 	    data->extended)
 		return true;
 
@@ -544,6 +544,10 @@ static void test_scaler_with_modifier_pipe(data_t *d,
 		for (int i = 0; i < ARRAY_SIZE(modifiers); i++) {
 			uint64_t modifier = modifiers[i];
 
+			if (is_xe_device(d->drm_fd) &&
+			    modifier != DRM_FORMAT_MOD_LINEAR)
+				continue;
+
 			if (igt_plane_has_format_mod(plane, format, modifier))
 				check_scaling_pipe_plane_rot(d, plane,
 							     format, modifier,
@@ -829,11 +833,12 @@ test_invalid_num_scalers(data_t *d, enum pipe pipe, igt_output_t *output)
 	igt_plane_set_size(plane[1], mode->hdisplay, mode->vdisplay);
 	igt_plane_set_size(plane[2], mode->hdisplay, mode->vdisplay);
 
-	/* This commit is expected to fail for i915 devices. i915 devices support
+	/*
+	 * This commit is expected to fail for intel devices. intel devices support
 	 * max 2 scalers/pipe. In dmesg we can find: Too many scaling requests 3 > 2.
-	 * For devices (non-i915, or possible future i915) that are able to perform this
-	 * amount of scaling; handle that case aswell.
-	 * */
+	 * For devices (non-intel, or possible future intel) that are able to perform
+	 * this amount of scaling; handle that case aswell.
+	 */
 	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 	igt_skip_on_f(ret == 0, "Cannot test handling of too many scaling ops, the device supports a large amount.\n");
 	igt_assert(ret == -EINVAL || ret == -ERANGE);
@@ -1010,7 +1015,7 @@ static drmModeModeInfo *find_mode(data_t *data, igt_output_t *output, const uint
 }
 
 /*
- *	Max source/destination width/height for i915 driver.
+ *	Max source/destination width/height for intel driver.
  *	These numbers are coming from
  *	drivers/gpu/drm/i915/display/skl_scaler.c in kernel sources.
  *
@@ -1038,8 +1043,8 @@ static drmModeModeInfo *find_mode(data_t *data, igt_output_t *output, const uint
  *		max_dst_w = 8192
  *		max_dst_h = 8192
  */
-static void i915_max_source_size_test(data_t *d, enum pipe pipe, igt_output_t *output,
-				      drmModeModeInfo *mode, const uint32_t planesize[])
+static void intel_max_source_size_test(data_t *d, enum pipe pipe, igt_output_t *output,
+				       drmModeModeInfo *mode, const uint32_t planesize[])
 {
 	igt_fb_t fb;
 	igt_plane_t *plane;
@@ -1117,7 +1122,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		igt_display_require(&data.display, data.drm_fd);
-		data.devid = is_i915_device(data.drm_fd) ?
+		data.devid = is_intel_device(data.drm_fd) ?
 			intel_get_drm_devid(data.drm_fd) : 0;
 		igt_require(data.display.is_atomic);
 	}
@@ -1271,9 +1276,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			}
 		}
 
-		for (int index = 0; index < ARRAY_SIZE(i915_paramtests); index++) {
+		for (int index = 0; index < ARRAY_SIZE(intel_paramtests); index++) {
 			igt_describe("Test for validating max source size.");
-			igt_subtest_with_dynamic(i915_paramtests[index].testname) {
+			igt_subtest_with_dynamic(intel_paramtests[index].testname) {
 				igt_require_intel(data.drm_fd);
 				for_each_pipe(&data.display, pipe) {
 					for_each_valid_output_on_pipe(&data.display, pipe, output) {
@@ -1282,12 +1287,12 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 						 * Need to find mode with lowest vrefresh else
 						 * we can exceed cdclk limits.
 						 */
-						mode = find_mode(&data, output, i915_paramtests[index].planesize);
+						mode = find_mode(&data, output, intel_paramtests[index].planesize);
 						if (mode) {
 							igt_dynamic_f("pipe-%s-%s",
 								       kmstest_pipe_name(pipe), igt_output_name(output))
-								i915_max_source_size_test(&data, pipe, output, mode,
-											  i915_paramtests[index].planesize);
+								intel_max_source_size_test(&data, pipe, output, mode,
+											   intel_paramtests[index].planesize);
 						}
 						continue;
 					}
-- 
2.40.0
