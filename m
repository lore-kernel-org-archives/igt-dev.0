Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 217FD11ACC8
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jun 2022 11:07:47 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 17 Jun 2022 16:38:27 +0530
Message-Id: <20220617110828.26508-2-swati2.sharma@intel.com>
In-Reply-To: <20220617110828.26508-1-swati2.sharma@intel.com>
References: <20220617110828.26508-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/i915/kms_flip_scaled_crc: Convert
 tests to dynamic
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

Convert the existing subtests to dynamic subtests at pipe/output level.

v2: Refactored code in such a manner that once test has been run
    successfully on chosen pipe this pipe will not be tested again
    as this test is testing pipe feature. No need to be run
    separately for each connector using all pipes.

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/i915/kms_flip_scaled_crc.c | 117 +++++++++++++------------------
 1 file changed, 50 insertions(+), 67 deletions(-)

diff --git a/tests/i915/kms_flip_scaled_crc.c b/tests/i915/kms_flip_scaled_crc.c
index 9740715f..8d995d00 100644
--- a/tests/i915/kms_flip_scaled_crc.c
+++ b/tests/i915/kms_flip_scaled_crc.c
@@ -163,8 +163,6 @@ const struct {
 	},
 };
 
-enum subrval {CONNECTORFAIL, CONNECTORSUCCESS, TESTSKIP, NOREQUESTEDFORMATONPIPE};
-
 static void setup_fb(data_t *data, struct igt_fb *newfb, uint32_t width,
 		     uint32_t height, uint64_t format, uint64_t modifier)
 {
@@ -220,12 +218,12 @@ static void clear_lut(data_t *data, enum pipe pipe)
 	igt_pipe_obj_set_prop_value(pipe_obj, IGT_CRTC_GAMMA_LUT, 0);
 }
 
-static enum subrval test_flip_to_scaled(data_t *data, uint32_t index,
-					enum pipe pipe, igt_output_t *output)
+static void test_flip_to_scaled(data_t *data, uint32_t index,
+				enum pipe pipe, igt_output_t *output,
+				drmModeModeInfoPtr modetoset)
 {
 	igt_plane_t *primary;
 	igt_crc_t small_crc, big_crc;
-	drmModeModeInfoPtr modetoset = NULL;
 	struct drm_event_vblank ev;
 	int ret;
 
@@ -257,11 +255,10 @@ static enum subrval test_flip_to_scaled(data_t *data, uint32_t index,
 	igt_output_set_pipe(output, pipe);
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-	if (!igt_plane_has_format_mod(primary, data->small_fb.drm_format,
+	igt_skip_on_f (!igt_plane_has_format_mod(primary, data->small_fb.drm_format,
 				      data->small_fb.modifier) ||
-	    !igt_plane_has_format_mod(primary, data->big_fb.drm_format,
-				      data->big_fb.modifier))
-		return NOREQUESTEDFORMATONPIPE;
+		       !igt_plane_has_format_mod(primary, data->big_fb.drm_format,
+				      data->big_fb.modifier), "No requested format/modifier on pipe %s\n", kmstest_pipe_name(pipe));
 
 	set_lut(data, pipe);
 	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET,
@@ -273,21 +270,7 @@ static enum subrval test_flip_to_scaled(data_t *data, uint32_t index,
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
 					  INTEL_PIPE_CRC_SOURCE_AUTO);
 
-	for (int i = 0; i < output->config.connector->count_modes; i++) {
-		if (output->config.connector->modes[i].hdisplay == data->attemptmodewidth &&
-		   output->config.connector->modes[i].vdisplay == data->attemptmodeheight) {
-			if (modetoset &&
-			    modetoset->vrefresh < output->config.connector->modes[i].vrefresh)
-				continue;
-
-			modetoset = &output->config.connector->modes[i];
-		}
-	}
-
-	if (!modetoset)
-		igt_debug("%dp mode was not found from connector, will try with default. This may cause cdclk to fail this test on this connector.\n",
-			  data->attemptmodeheight);
-	else
+	if (modetoset)
 		igt_output_override_mode(output, modetoset);
 
 	igt_plane_set_position(primary, 0, 0);
@@ -295,20 +278,11 @@ static enum subrval test_flip_to_scaled(data_t *data, uint32_t index,
 	igt_plane_set_size(primary, data->attemptmodewidth,
 			   data->attemptmodeheight);
 	ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	switch (ret) {
-	case -ERANGE:
-		igt_debug("Platform scaling limits exceeded, skipping.\n");
-		return TESTSKIP;
-	case -EINVAL:
-		if (!modetoset) {
-			igt_debug("No %dp and default mode too big, cdclk limits exceeded. Check next connector\n",
-				  data->attemptmodeheight);
-			return CONNECTORFAIL;
-		}
-		/* fallthrough */
-	default:
-		igt_assert_eq(ret, 0);
-	}
+
+	igt_skip_on_f(ret == -ERANGE, "Platform scaling limits exceeded, skipping.\n");
+	igt_skip_on_f((ret == -EINVAL) && !modetoset, "No %dp and default mode too big, cdclk limits exceeded. Check next connector\n",
+			data->attemptmodeheight);
+	igt_assert_eq(ret, 0);
 
 	igt_pipe_crc_start(data->pipe_crc);
 	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &small_crc);
@@ -320,20 +294,10 @@ static enum subrval test_flip_to_scaled(data_t *data, uint32_t index,
 					    DRM_MODE_ATOMIC_ALLOW_MODESET  |
 					    DRM_MODE_PAGE_FLIP_EVENT, NULL);
 
-	switch (ret) {
-	case -ERANGE:
-		igt_debug("Platform scaling limits exceeded, skipping.\n");
-		return TESTSKIP;
-	case -EINVAL:
-		if (!modetoset) {
-			igt_debug("No %dp and default mode too big, cdclk limits exceeded. Check next connector\n",
-				  data->attemptmodeheight);
-			return CONNECTORFAIL;
-		}
-		/* fallthrough */
-	default:
-		igt_assert_eq(ret, 0);
-	}
+	igt_skip_on_f(ret == -ERANGE, "Platform scaling limits exceeded, skipping.\n");
+	igt_skip_on_f((ret == -EINVAL) && !modetoset, "No %dp and default mode too big, cdclk limits exceeded. Check next connector\n",
+			data->attemptmodeheight);
+	igt_assert_eq(ret, 0);
 
 	igt_assert(read(data->drm_fd, &ev, sizeof(ev)) == sizeof(ev));
 
@@ -349,8 +313,24 @@ static enum subrval test_flip_to_scaled(data_t *data, uint32_t index,
 	igt_output_set_pipe(output, PIPE_NONE);
 	igt_plane_set_fb(primary, NULL);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+}
 
-	return CONNECTORSUCCESS;
+static drmModeModeInfoPtr find_mode(data_t *data, igt_output_t *output)
+{
+	drmModeModeInfoPtr modetoset = NULL;
+
+	for (int i = 0; i < output->config.connector->count_modes; i++) {
+		if (output->config.connector->modes[i].hdisplay == data->attemptmodewidth &&
+		    output->config.connector->modes[i].vdisplay == data->attemptmodeheight) {
+			if (modetoset &&
+			    modetoset->vrefresh < output->config.connector->modes[i].vrefresh)
+				continue;
+
+			modetoset = &output->config.connector->modes[i];
+		}
+	}
+
+	return modetoset;
 }
 
 igt_main
@@ -358,6 +338,7 @@ igt_main
 	enum pipe pipe;
 	data_t data = {};
 	igt_output_t *output;
+	drmModeModeInfoPtr modetoset = NULL;
 
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
@@ -379,28 +360,30 @@ igt_main
 
 	for (int index = 0; index < ARRAY_SIZE(flip_scenario_test); index++) {
 		igt_describe(flip_scenario_test[index].describe);
-		igt_subtest(flip_scenario_test[index].name) {
-			int validtests = 0;
+		igt_subtest_with_dynamic(flip_scenario_test[index].name) {
 			free_fbs(&data);
-			for_each_pipe_static(pipe) {
-				enum subrval rval = CONNECTORSUCCESS;
+			for_each_pipe(&data.display, pipe) {
+				bool found = false;
 				for_each_valid_output_on_pipe(&data.display, pipe, output) {
-					rval = test_flip_to_scaled(&data, index, pipe, output);
-
-					igt_require(rval != TESTSKIP);
-
-					// break out to test next pipe
-					if (rval == CONNECTORSUCCESS) {
-						validtests++;
+					modetoset = find_mode(&data, output);
+					if (modetoset) {
+						found = true;
+						igt_dynamic_f("pipe-%s-valid-mode", kmstest_pipe_name(pipe))
+							test_flip_to_scaled(&data, index, pipe, output, modetoset);
 						break;
 					}
 				}
-				if (rval == NOREQUESTEDFORMATONPIPE)
-					igt_debug("No requested format/modifier on pipe %s\n", kmstest_pipe_name(pipe));
+				if (!found) {
+					for_each_valid_output_on_pipe(&data.display, pipe, output) {
+						igt_dynamic_f("pipe-%s-default-mode", kmstest_pipe_name(pipe))
+							test_flip_to_scaled(&data, index, pipe, output, NULL);
+					}
+				}
+				break;
 			}
-			igt_require_f(validtests > 0, "No valid pipe/connector/format/mod combination found\n");
 		}
 	}
+
 	igt_fixture {
 		free_fbs(&data);
 		if (data.pipe_crc) {
-- 
2.25.1
