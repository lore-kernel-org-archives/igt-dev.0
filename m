Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17AC510ED1C
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jun 2022 10:15:17 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id i18so32862437lfu.8
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jun 2022 03:15:17 -0700 (PDT)
Received: from localhost.localdomain (d13t31k5fs-hc7m1cn8-4.rev.dnainternet.fi.
 [2001:14bb:ad:e17a:a324:7fcc:2daa:a25f])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a197511000000b0047f6590af3asm3019363lfe.107.2022.06.30.03.15.14
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 03:15:14 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 30 Jun 2022 13:15:10 +0300
Message-Id: <20220630101513.24054-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/4] tests/i915/kms_flip_scaled_crc: Convert
 tests to dynamic
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

From: Swati Sharma <swati2.sharma@intel.com>

Convert the existing subtests to dynamic subtests at pipe/output level.

v2: Refactored code in such a manner that once test has been run
    successfully on chosen pipe that pipe will not be tested again
    as this test is testing pipe feature. No need to run separately
    for each connector using all pipes.
v3: Changed seq to avoid modetoset as a dangling ptr
v4: On eDP 1080p with 144Hz vrefresh, test fails with cdclk
    lim, however it passes with 90Hz vrefresh. Added the check
    to handle this scenario.
v5: Minor fixes

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Acked-by: Petri Latvala <petri.latvala@intel.com>
Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/i915/kms_flip_scaled_crc.c | 129 ++++++++++++++-----------------
 1 file changed, 57 insertions(+), 72 deletions(-)

diff --git a/tests/i915/kms_flip_scaled_crc.c b/tests/i915/kms_flip_scaled_crc.c
index 9740715f..d6edb01c 100644
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
 
@@ -254,18 +252,23 @@ static enum subrval test_flip_to_scaled(data_t *data, uint32_t index,
 				data->big_fb.height);
 	}
 
+	if (modetoset)
+		igt_output_override_mode(output, modetoset);
+	/*
+	 * Setting a pipe invalidates the modetoset pointer.
+	 * So, mode is overriden first and then pipe is set.
+	 * Don't change this sequence.
+	 */
 	igt_output_set_pipe(output, pipe);
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-	if (!igt_plane_has_format_mod(primary, data->small_fb.drm_format,
-				      data->small_fb.modifier) ||
-	    !igt_plane_has_format_mod(primary, data->big_fb.drm_format,
-				      data->big_fb.modifier))
-		return NOREQUESTEDFORMATONPIPE;
+	igt_skip_on_f(!igt_plane_has_format_mod(primary, data->small_fb.drm_format, data->small_fb.modifier) ||
+		      !igt_plane_has_format_mod(primary, data->big_fb.drm_format,
+		      data->big_fb.modifier), "No requested format/modifier on pipe %s\n", kmstest_pipe_name(pipe));
 
 	set_lut(data, pipe);
-	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET,
-				  NULL);
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
 	if (data->pipe_crc) {
 		igt_pipe_crc_stop(data->pipe_crc);
 		igt_pipe_crc_free(data->pipe_crc);
@@ -273,42 +276,15 @@ static enum subrval test_flip_to_scaled(data_t *data, uint32_t index,
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
-		igt_output_override_mode(output, modetoset);
-
 	igt_plane_set_position(primary, 0, 0);
 	igt_plane_set_fb(primary, &data->small_fb);
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
+	igt_skip_on_f((ret == -EINVAL) && (!modetoset || modetoset->vrefresh > 90), "Valid/default mode too big, cdclk limits exceeded. Check next connector\n");
+	igt_assert_eq(ret, 0);
 
 	igt_pipe_crc_start(data->pipe_crc);
 	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &small_crc);
@@ -320,20 +296,9 @@ static enum subrval test_flip_to_scaled(data_t *data, uint32_t index,
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
+	igt_skip_on_f((ret == -EINVAL) && (!modetoset || modetoset->vrefresh > 90), "Valid/default mode too big, cdclk limits exceeded. Check next connector\n");
+	igt_assert_eq(ret, 0);
 
 	igt_assert(read(data->drm_fd, &ev, sizeof(ev)) == sizeof(ev));
 
@@ -346,11 +311,28 @@ static enum subrval test_flip_to_scaled(data_t *data, uint32_t index,
 
 	clear_lut(data, pipe);
 
+	modetoset = NULL;
 	igt_output_set_pipe(output, PIPE_NONE);
 	igt_plane_set_fb(primary, NULL);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+}
+
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
 
-	return CONNECTORSUCCESS;
+			modetoset = &output->config.connector->modes[i];
+		}
+	}
+
+	return modetoset;
 }
 
 igt_main
@@ -358,6 +340,7 @@ igt_main
 	enum pipe pipe;
 	data_t data = {};
 	igt_output_t *output;
+	drmModeModeInfoPtr modetoset = NULL;
 
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
@@ -379,28 +362,30 @@ igt_main
 
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
