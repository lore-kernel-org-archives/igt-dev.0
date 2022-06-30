Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232F310F262
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jun 2022 10:15:21 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id b19so9711958ljf.6
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jun 2022 03:15:21 -0700 (PDT)
Received: from localhost.localdomain (d13t31k5fs-hc7m1cn8-4.rev.dnainternet.fi.
 [2001:14bb:ad:e17a:a324:7fcc:2daa:a25f])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a197511000000b0047f6590af3asm3019363lfe.107.2022.06.30.03.15.17
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 03:15:18 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 30 Jun 2022 13:15:13 +0300
Message-Id: <20220630101513.24054-4-juhapekka.heikkila@gmail.com>
In-Reply-To: <20220630101513.24054-1-juhapekka.heikkila@gmail.com>
References: <20220630101513.24054-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/4] tests/kms_flip_scaled_crc: Validate NN
 scaling filter
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
v6:(juha): -Don't skip on missng property, assert on where
     expect to find it.
    - Allow test to run correctly on all gen9 upwards paltforms.
    - run default and NN filters on same test.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/i915/kms_flip_scaled_crc.c | 47 ++++++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 11 deletions(-)

diff --git a/tests/i915/kms_flip_scaled_crc.c b/tests/i915/kms_flip_scaled_crc.c
index 88640da2..764eb70f 100644
--- a/tests/i915/kms_flip_scaled_crc.c
+++ b/tests/i915/kms_flip_scaled_crc.c
@@ -37,6 +37,7 @@ typedef struct {
 	igt_pipe_crc_t *pipe_crc;
 	uint32_t attemptmodewidth;
 	uint32_t attemptmodeheight;
+	drmModeModeInfo mode;
 } data_t;
 
 const struct {
@@ -476,7 +477,7 @@ static void clear_lut(data_t *data, enum pipe pipe)
 
 static void test_flip_to_scaled(data_t *data, uint32_t index,
 				enum pipe pipe, igt_output_t *output,
-				drmModeModeInfoPtr modetoset)
+				drmModeModeInfoPtr modetoset, int flags)
 {
 	igt_plane_t *primary;
 	igt_crc_t small_crc, big_crc;
@@ -510,14 +511,20 @@ static void test_flip_to_scaled(data_t *data, uint32_t index,
 
 	if (modetoset)
 		igt_output_override_mode(output, modetoset);
-	/*
-	 * Setting a pipe invalidates the modetoset pointer.
-	 * So, mode is overriden first and then pipe is set.
-	 * Don't change this sequence.
-	 */
+
 	igt_output_set_pipe(output, pipe);
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+	if (data->gen >= 11) {
+		igt_assert_f(igt_plane_has_prop(primary, IGT_PLANE_SCALING_FILTER),
+			     "Plane scaling filter prop not supported!\n");
+		igt_plane_set_prop_enum(primary, IGT_PLANE_SCALING_FILTER,
+					kmstest_scaling_filter_str(flags));
+	} else {
+		igt_debug("Plane scaling filter prop not supported on gen < 11, running with default\n");
+	}
+
 	igt_skip_on_f(!igt_plane_has_format_mod(primary, data->small_fb.drm_format, data->small_fb.modifier) ||
 		      !igt_plane_has_format_mod(primary, data->big_fb.drm_format,
 		      data->big_fb.modifier), "No requested format/modifier on pipe %s\n", kmstest_pipe_name(pipe));
@@ -539,7 +546,8 @@ static void test_flip_to_scaled(data_t *data, uint32_t index,
 	ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
 	igt_skip_on_f(ret == -ERANGE, "Platform scaling limits exceeded, skipping.\n");
-	igt_skip_on_f((ret == -EINVAL) && (!modetoset || modetoset->vrefresh > 90), "Valid/default mode too big, cdclk limits exceeded. Check next connector\n");
+	igt_skip_on_f((ret == -EINVAL) && (!modetoset || modetoset->vrefresh > 90),
+		      "Valid/default mode too big, cdclk limits exceeded. Check next connector\n");
 	igt_assert_eq(ret, 0);
 
 	igt_pipe_crc_start(data->pipe_crc);
@@ -553,7 +561,8 @@ static void test_flip_to_scaled(data_t *data, uint32_t index,
 					    DRM_MODE_PAGE_FLIP_EVENT, NULL);
 
 	igt_skip_on_f(ret == -ERANGE, "Platform scaling limits exceeded, skipping.\n");
-	igt_skip_on_f((ret == -EINVAL) && (!modetoset || modetoset->vrefresh > 90), "Valid/default mode too big, cdclk limits exceeded. Check next connector\n");
+	igt_skip_on_f((ret == -EINVAL) && (!modetoset || modetoset->vrefresh > 90),
+		      "Valid/default mode too big, cdclk limits exceeded. Check next connector\n");
 	igt_assert_eq(ret, 0);
 
 	igt_assert(read(data->drm_fd, &ev, sizeof(ev)) == sizeof(ev));
@@ -584,13 +593,28 @@ static drmModeModeInfoPtr find_mode(data_t *data, igt_output_t *output)
 			    modetoset->vrefresh < output->config.connector->modes[i].vrefresh)
 				continue;
 
-			modetoset = &output->config.connector->modes[i];
+			data->mode = output->config.connector->modes[i];
+			modetoset = &data->mode;
 		}
 	}
 
 	return modetoset;
 }
 
+static void run_tests(data_t *data, uint32_t index, enum pipe pipe,
+		      igt_output_t * output, drmModeModeInfoPtr modetoset)
+{
+	test_flip_to_scaled(data, index, pipe, output, modetoset, 0);
+
+	/*
+	 * test Nearest Neighbor filter. For scaler indexes see
+	 * scaling_filter_names structure in igt_kms.c
+	 * Platform scaling filter property is supported only gen >= 11.
+	 */
+	if (data->gen >= 11)
+		test_flip_to_scaled(data, index, pipe, output, modetoset, 1);
+}
+
 igt_main
 {
 	enum pipe pipe;
@@ -616,6 +640,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Tests scaler using default and nearest neighbor plane scaling filters");
 	for (int index = 0; index < ARRAY_SIZE(flip_scenario_test); index++) {
 		igt_describe(flip_scenario_test[index].describe);
 		igt_subtest_with_dynamic(flip_scenario_test[index].name) {
@@ -627,14 +652,14 @@ igt_main
 					if (modetoset) {
 						found = true;
 						igt_dynamic_f("pipe-%s-valid-mode", kmstest_pipe_name(pipe))
-							test_flip_to_scaled(&data, index, pipe, output, modetoset);
+							run_tests(&data, index, pipe, output, modetoset);
 						break;
 					}
 				}
 				if (!found) {
 					for_each_valid_output_on_pipe(&data.display, pipe, output) {
 						igt_dynamic_f("pipe-%s-default-mode", kmstest_pipe_name(pipe))
-							test_flip_to_scaled(&data, index, pipe, output, NULL);
+							run_tests(&data, index, pipe, output, modetoset);
 					}
 				}
 				break;
-- 
2.25.1
