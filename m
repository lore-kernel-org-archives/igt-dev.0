Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E3111399F
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jun 2022 18:50:36 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 29 Jun 2022 00:21:28 +0530
Message-Id: <20220628185128.19692-5-swati2.sharma@intel.com>
In-Reply-To: <20220628185128.19692-1-swati2.sharma@intel.com>
References: <20220628185128.19692-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v5 PATCH i-g-t 4/4] tests/kms_flip_scaled_crc: Validate
 NN scaling filter
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

SCALING_FILTER can be used either as plane scaler property
or CRTC scaler property.
The value of this property can be one of the following:
    Default:
             Driver's default scaling filter
    Nearest Neighbor:
             Nearest Neighbor scaling filter
If NN is used for scaling, sharpness is preserved
whereas if we use default scaling we can see blurriness
at edges.

v2: -no need to set pipe scaler filter property
v3: -addition of new lines to improve readability
    -use of SPDX licence placeholder
    -close(data.drm_fd)
v4: -instead of creating new i-g-t, tweaked kms_flip_scaled_crc
     to validate both default and nn scaling filters
v5: -removed duplicate block
    -added platform check for nn

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/i915/kms_flip_scaled_crc.c | 48 ++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 21 deletions(-)

diff --git a/tests/i915/kms_flip_scaled_crc.c b/tests/i915/kms_flip_scaled_crc.c
index 88640da2..f241806d 100644
--- a/tests/i915/kms_flip_scaled_crc.c
+++ b/tests/i915/kms_flip_scaled_crc.c
@@ -476,7 +476,7 @@ static void clear_lut(data_t *data, enum pipe pipe)
 
 static void test_flip_to_scaled(data_t *data, uint32_t index,
 				enum pipe pipe, igt_output_t *output,
-				drmModeModeInfoPtr modetoset)
+				drmModeModeInfoPtr modetoset, int flags)
 {
 	igt_plane_t *primary;
 	igt_crc_t small_crc, big_crc;
@@ -518,6 +518,7 @@ static void test_flip_to_scaled(data_t *data, uint32_t index,
 	igt_output_set_pipe(output, pipe);
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_skip_on_f(!igt_plane_has_prop(primary, IGT_PLANE_SCALING_FILTER), "Plane scaling filter prop not supported");
 	igt_skip_on_f(!igt_plane_has_format_mod(primary, data->small_fb.drm_format, data->small_fb.modifier) ||
 		      !igt_plane_has_format_mod(primary, data->big_fb.drm_format,
 		      data->big_fb.modifier), "No requested format/modifier on pipe %s\n", kmstest_pipe_name(pipe));
@@ -532,6 +533,8 @@ static void test_flip_to_scaled(data_t *data, uint32_t index,
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
 					  INTEL_PIPE_CRC_SOURCE_AUTO);
 
+	igt_plane_set_prop_enum(primary, IGT_PLANE_SCALING_FILTER, kmstest_scaling_filter_str(flags));
+
 	igt_plane_set_position(primary, 0, 0);
 	igt_plane_set_fb(primary, &data->small_fb);
 	igt_plane_set_size(primary, data->attemptmodewidth,
@@ -601,7 +604,6 @@ igt_main
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
 		data.gen = intel_display_ver(intel_get_drm_devid(data.drm_fd));
-		igt_require(data.gen >= 9);
 		igt_display_require(&data.display, data.drm_fd);
 		igt_require(data.display.is_atomic);
 		igt_require_pipe_crc(data.drm_fd);
@@ -616,28 +618,32 @@ igt_main
 		}
 	}
 
-	for (int index = 0; index < ARRAY_SIZE(flip_scenario_test); index++) {
-		igt_describe(flip_scenario_test[index].describe);
-		igt_subtest_with_dynamic(flip_scenario_test[index].name) {
-			free_fbs(&data);
-			for_each_pipe(&data.display, pipe) {
-				bool found = false;
-				for_each_valid_output_on_pipe(&data.display, pipe, output) {
-					modetoset = find_mode(&data, output);
-					if (modetoset) {
-						found = true;
-						igt_dynamic_f("pipe-%s-valid-mode", kmstest_pipe_name(pipe))
-							test_flip_to_scaled(&data, index, pipe, output, modetoset);
-						break;
-					}
-				}
-				if (!found) {
+	igt_describe("Tests scaler using default and nearest neighbor plane scaling filters");
+	for (int filter = 0; filter < 2; filter++) {
+		for (int index = 0; index < ARRAY_SIZE(flip_scenario_test); index++) {
+			igt_describe(flip_scenario_test[index].describe);
+			igt_require(filter ? data.gen >= 10 : data.gen >= 9);
+			igt_subtest_with_dynamic_f("%s-%s", filter ? "nn" : "default", flip_scenario_test[index].name) {
+				free_fbs(&data);
+				for_each_pipe(&data.display, pipe) {
+					bool found = false;
 					for_each_valid_output_on_pipe(&data.display, pipe, output) {
-						igt_dynamic_f("pipe-%s-default-mode", kmstest_pipe_name(pipe))
-							test_flip_to_scaled(&data, index, pipe, output, NULL);
+						modetoset = find_mode(&data, output);
+						if (modetoset) {
+							found = true;
+							igt_dynamic_f("pipe-%s-valid-mode", kmstest_pipe_name(pipe))
+								test_flip_to_scaled(&data, index, pipe, output, modetoset, filter);
+							break;
+						}
+					}
+					if (!found) {
+						for_each_valid_output_on_pipe(&data.display, pipe, output) {
+							igt_dynamic_f("pipe-%s-default-mode", kmstest_pipe_name(pipe))
+								test_flip_to_scaled(&data, index, pipe, output, NULL, filter);
+						}
 					}
+					break;
 				}
-				break;
 			}
 		}
 	}
-- 
2.25.1
