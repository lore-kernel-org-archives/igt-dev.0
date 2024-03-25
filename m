Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E9AC6FD1F
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 09:16:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A0510E6C7;
	Mon, 25 Mar 2024 09:16:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NuCigxzG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7263410E6D7
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 09:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711358210; x=1742894210;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uxHoeBOKjFdODVrR/OZ0XthNj9vk57bxxtnkqBkQteM=;
 b=NuCigxzGJSLRzkK36FiffsR1gHfws4sTRf+oe0bZL60S0HrwXqfL6lof
 l36FAV3zdBnvqWV4BdrAkvdL413itWz/1RZXyu8Qa4vXwz7Nar8eIOoCl
 JDwHMFqAUmO8jEsXtMZjz8fB4amTclCmucTIGv8GCHantewjWW5XajA5E
 p42kAINWNtnOZD1RYmv1UCqUaNNLHtEOrlBs6Twm4ycMwgMXlqVvxwQ0m
 FNh3Q5pZUnxr/sJqIc3rkER+U7unh3E3mYcdO8fTL9ZYbKuyqEXkq/n9q
 t9Ltr8HQ/Zr2zrgVR/sMtm/5lmgLBE7FZHOfxrJFRRd5CtPnanElYfsg5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6552972"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="6552972"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 02:16:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; d="scan'208";a="38665924"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 02:16:48 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	jeevan.b@intel.com,
	pranay.samala@intel.com
Subject: [PATCH i-g-t] RFC: Converting subtests of kms_plane into dynamic
 subtests
Date: Mon, 25 Mar 2024 14:46:46 +0530
Message-Id: <20240325091646.194626-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

The pixel-format subtest runs on all the supported pixel formats and modifiers.
By converting the pixel-format subtest into dynamic subtests by performing
permutations and combinations on pixel-formats and modifiers we can reduce
the execution time of each subtest.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_plane.c | 393 +++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 333 insertions(+), 60 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 406aecc04..4a28d3174 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -84,16 +84,58 @@
  *
  * arg[1]:
  *
- * @format:
  * @format-source-clamping:          with source clamping
  */
 
+/**
+ * SUBTEST: pixel-%s-%s
+ * Description: verify the pixel formats for given plane and pipe
+ * Functionality: pixel_formats, plane
+ *
+ * arg[1]:
+ *
+ * @format:
+ *
+ * arg[2]:
+ *
+ * @XR24:
+ * @C8:
+ * @RG16:
+ * @XB24:
+ * @AR24:
+ * @AB24:
+ * @XR30:
+ * @XB30:
+ * @AR30:
+ * @AB30:
+ * @XR4H:
+ * @XB4H:
+ * @AR4H:
+ * @AB4H:
+ * @YUYV:
+ * @YVYU:
+ * @UYVY:
+ * @VYUY:
+ * @NV12:
+ * @P010:
+ * @P012:
+ * @P016:
+ * @Y210:
+ * @Y212:
+ * @Y216:
+ * @XYUV:
+ * @XV30:
+ * @XV36:
+ * @XV48:
+ */
+
 /*
  * Throw away enough lsbs in pixel formats tests
  * to get a match despite some differences between
  * the software and hardware YCbCr<->RGB conversion
  * routines.
  */
+
 #define LUT_MASK 0xf800
 
 /* restricted pipe count */
@@ -129,6 +171,27 @@ static color_t red   = { 1.0f, 0.0f, 0.0f };
 static color_t green = { 0.0f, 1.0f, 0.0f };
 static color_t blue  = { 0.0f, 0.0f, 1.0f };
 
+/*
+ * format_num represents each format supported 
+ */
+int format_num[29] = {875713112, 538982467, 909199186, 875709016, 875713089, 875708993,
+        808669784, 808665688, 808669761, 808665665, 1211388504, 1211384408, 1211388481,
+        1211384385, 1448695129, 1431918169, 1498831189, 1498765654, 842094158, 808530000,
+        842084432, 909193296, 808530521, 842084953, 909193817, 1448434008, 808670808,
+        909334104, 942954072};
+
+/*
+ * mod_num represents each modifier supported
+ */
+long int mod_num[3] = {0, 72057594037927945, 72057594037927937};
+
+char dyna_names[3][8] = {"linear","4","x"};
+
+const char *sub_names[29] = {"XR24", "C8", "RG16", "XB24", "AR24", "AB24", "XR30", "XB30",
+        "AR30", "AB30", "XR4H", "XB4H", "AR4H", "AB4H", "YUYV", "YVYU", "UYVY", "VYUY",
+        "NV12", "P010", "P012", "P016", "Y210", "Y212", "Y216", "XYUV", "XV30", "XV36",
+        "XV48"};
+
 /*
  * Common code across all tests, acting on data_t
  */
@@ -999,8 +1062,143 @@ static void check_allowed_plane_size_64x64(data_t *data, igt_plane_t *plane,
 	igt_remove_fb(data->drm_fd, &test_fb);
 }
 
+static bool test_format_plane_sc(data_t *data, enum pipe pipe,
+                              igt_output_t *output, igt_plane_t *plane, igt_fb_t *primary_fb)
+{
+        struct igt_fb fb = {};
+        struct igt_fb *clear_fb = plane->type == DRM_PLANE_TYPE_PRIMARY ? primary_fb : NULL;
+        drmModeModeInfo *mode;
+        uint64_t width, height;
+        igt_crc_t ref_crc[MAX_CRC_SET][ARRAY_SIZE(colors_extended)];
+        struct igt_vec tested_formats;
+        struct format_mod ref = {};
+        igt_crc_t* crcset;
+        bool result = true;
+
+        /*
+         * No clamping test for cursor plane
+         */
+        if (data->crop != 0 && plane->type == DRM_PLANE_TYPE_CURSOR)
+                return true;
+
+        igt_vec_init(&tested_formats, sizeof(struct format_mod));
+
+        mode = igt_output_get_mode(output);
+        if (plane->type != DRM_PLANE_TYPE_CURSOR) {
+                width = mode->hdisplay;
+                height = mode->vdisplay;
+                ref.format = DRM_FORMAT_XRGB8888;
+                ref.modifier = DRM_FORMAT_MOD_LINEAR;
+        } else {
+                if (!plane->drm_plane) {
+                        igt_debug("Only legacy cursor ioctl supported, skipping cursor plane\n");
+                        return true;
+                }
+                do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_WIDTH, &width));
+                do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_HEIGHT, &height));
+                ref.format = DRM_FORMAT_ARGB8888;
+                ref.modifier = DRM_FORMAT_MOD_LINEAR;
+        }
+
+        igt_debug("Testing connector %s on %s plane %s.%u\n",
+                  igt_output_name(output), kmstest_plane_type_name(plane->type),
+                  kmstest_pipe_name(pipe), plane->index);
+
+        igt_pipe_crc_start(data->pipe_crc);
+
+        igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
+                 IGT_FORMAT_ARGS(ref.format), IGT_MODIFIER_ARGS(ref.modifier),
+                 kmstest_pipe_name(pipe), plane->index);
+
+        check_allowed_plane_size_64x64(data, plane, &width, &height, ref.format);
+
+        capture_format_crcs_single(data, pipe, plane, ref.format, ref.modifier,
+                                   width, height, IGT_COLOR_YCBCR_BT709,
+                                   IGT_COLOR_YCBCR_LIMITED_RANGE,
+                                   ref_crc[SINGLE_CRC_SET], &fb);
+
+        capture_format_crcs_multiple(data, pipe, plane, ref.format, ref.modifier,
+                                     width, height, IGT_COLOR_YCBCR_BT709,
+                                     IGT_COLOR_YCBCR_LIMITED_RANGE,
+                                     ref_crc[MULTIPLE_CRC_SET], &fb);
+
+        /*
+         * Make sure we have some difference between the colors. This
+         * at least avoids claiming success when everything is just
+         * black all the time (eg. if the plane is never even on).
+         */
+        igt_require(num_unique_crcs(ref_crc[MULTIPLE_CRC_SET], data->num_colors) > 1);
+	
+	for (int i = 0; i < plane->format_mod_count; i++) {
+                struct format_mod f = {
+                        .format = plane->formats[i],
+                        .modifier = plane->modifiers[i],
+                };
+
+                /* igt doesn't know how to sw generate UBWC: */
+                if (is_msm_device(data->drm_fd) &&
+                    f.modifier == DRM_FORMAT_MOD_QCOM_COMPRESSED)
+                        continue;
+
+                if (f.format == ref.format &&
+                    f.modifier == ref.modifier)
+                        continue;
+
+                /* test each format "class" only once in non-extended tests */
+                if (!data->extended && f.modifier != DRM_FORMAT_MOD_LINEAR) {
+                        struct format_mod rf = {
+                                .format = igt_reduce_format(f.format),
+                                .modifier = f.modifier,
+                        };
+
+                        if (igt_vec_index(&tested_formats, &rf) >= 0) {
+                                igt_info("Skipping format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
+                                         IGT_FORMAT_ARGS(f.format), IGT_MODIFIER_ARGS(f.modifier),
+                                         kmstest_pipe_name(pipe), plane->index);
+                                continue;
+                        }
+
+                        igt_vec_push(&tested_formats, &rf);
+                }
+
+                if (f.format == DRM_FORMAT_C8) {
+                        if (!set_c8_legacy_lut(data, pipe, LUT_MASK))
+                                continue;
+                } else {
+                        if (!igt_fb_supported_format(f.format))
+                                continue;
+                }
+
+                crcset = ref_crc[use_multiple_colors(data, f.format) ?
+                                 MULTIPLE_CRC_SET : SINGLE_CRC_SET];
+
+                if (igt_format_is_yuv(f.format))
+                        result &= test_format_plane_yuv(data, pipe, plane,
+                                                        f.format, f.modifier,
+                                                        width, height,
+                                                        crcset, &fb);
+                else
+                        result &= test_format_plane_rgb(data, pipe, plane,
+                                                        f.format, f.modifier,
+                                                        width, height,
+                                                        crcset, &fb);
+
+                if (f.format == DRM_FORMAT_C8)
+                        set_legacy_lut(data, pipe, LUT_MASK);
+        }
+	
+	igt_pipe_crc_stop(data->pipe_crc);
+
+        igt_plane_set_fb(plane, clear_fb);
+        igt_remove_fb(data->drm_fd, &fb);
+
+        igt_vec_fini(&tested_formats);
+
+        return result;
+}
+
 static bool test_format_plane(data_t *data, enum pipe pipe,
-			      igt_output_t *output, igt_plane_t *plane, igt_fb_t *primary_fb)
+			      igt_output_t *output, igt_plane_t *plane, igt_fb_t *primary_fb, int i, int p)
 {
 	struct igt_fb fb = {};
 	struct igt_fb *clear_fb = plane->type == DRM_PLANE_TYPE_PRIMARY ? primary_fb : NULL;
@@ -1043,10 +1241,6 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 
 	igt_pipe_crc_start(data->pipe_crc);
 
-	igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
-		 IGT_FORMAT_ARGS(ref.format), IGT_MODIFIER_ARGS(ref.modifier),
-		 kmstest_pipe_name(pipe), plane->index);
-
 	check_allowed_plane_size_64x64(data, plane, &width, &height, ref.format);
 
 	capture_format_crcs_single(data, pipe, plane, ref.format, ref.modifier,
@@ -1066,64 +1260,67 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 	 */
 	igt_require(num_unique_crcs(ref_crc[MULTIPLE_CRC_SET], data->num_colors) > 1);
 
-	for (int i = 0; i < plane->format_mod_count; i++) {
-		struct format_mod f = {
-			.format = plane->formats[i],
-			.modifier = plane->modifiers[i],
-		};
+	struct format_mod f = {
+		.format = format_num[p],
+		.modifier = mod_num[i],
+	};
 
-		/* igt doesn't know how to sw generate UBWC: */
-		if (is_msm_device(data->drm_fd) &&
-		    f.modifier == DRM_FORMAT_MOD_QCOM_COMPRESSED)
-			continue;
+	int flag = 0;
+	for (int l = 0; l < plane->format_mod_count; l++) {
+		if (f.format == plane->formats[l] && f.modifier == plane->modifiers[l])
+                        flag++;
+        }
 
-		if (f.format == ref.format &&
-		    f.modifier == ref.modifier)
-			continue;
+	if (flag == 0)
+		return true;
 
-		/* test each format "class" only once in non-extended tests */
-		if (!data->extended && f.modifier != DRM_FORMAT_MOD_LINEAR) {
-			struct format_mod rf = {
-				.format = igt_reduce_format(f.format),
-				.modifier = f.modifier,
-			};
-
-			if (igt_vec_index(&tested_formats, &rf) >= 0) {
-				igt_info("Skipping format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
-					 IGT_FORMAT_ARGS(f.format), IGT_MODIFIER_ARGS(f.modifier),
-					 kmstest_pipe_name(pipe), plane->index);
-				continue;
-			}
+	/* igt doesn't know how to sw generate UBWC: */
+	if (is_msm_device(data->drm_fd) &&
+	    f.modifier == DRM_FORMAT_MOD_QCOM_COMPRESSED)
+		return true;
 
-			igt_vec_push(&tested_formats, &rf);
-		}
+	/* test each format "class" only once in non-extended tests */
+	if (!data->extended && f.modifier != DRM_FORMAT_MOD_LINEAR) {
+		struct format_mod rf = {
+			.format = igt_reduce_format(f.format),
+			.modifier = f.modifier,
+		};
 
-		if (f.format == DRM_FORMAT_C8) {
-			if (!set_c8_legacy_lut(data, pipe, LUT_MASK))
-				continue;
-		} else {
-			if (!igt_fb_supported_format(f.format))
-				continue;
+		if (igt_vec_index(&tested_formats, &rf) >= 0) {
+			igt_info("Skipping format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
+				 IGT_FORMAT_ARGS(f.format), IGT_MODIFIER_ARGS(f.modifier),
+				 kmstest_pipe_name(pipe), plane->index);
+			return true;
 		}
 
-		crcset = ref_crc[use_multiple_colors(data, f.format) ?
-				 MULTIPLE_CRC_SET : SINGLE_CRC_SET];
-
-		if (igt_format_is_yuv(f.format))
-			result &= test_format_plane_yuv(data, pipe, plane,
-							f.format, f.modifier,
-							width, height,
-							crcset, &fb);
-		else
-			result &= test_format_plane_rgb(data, pipe, plane,
-							f.format, f.modifier,
-							width, height,
-							crcset, &fb);
-
-		if (f.format == DRM_FORMAT_C8)
-			set_legacy_lut(data, pipe, LUT_MASK);
+		igt_vec_push(&tested_formats, &rf);
 	}
 
+	if (f.format == DRM_FORMAT_C8) {
+		if (!set_c8_legacy_lut(data, pipe, LUT_MASK))
+			return true;
+	} else {
+		if (!igt_fb_supported_format(f.format))
+			return true;
+	}
+
+	crcset = ref_crc[use_multiple_colors(data, f.format) ?
+			 MULTIPLE_CRC_SET : SINGLE_CRC_SET];
+
+	if (igt_format_is_yuv(f.format))
+		result &= test_format_plane_yuv(data, pipe, plane,
+						f.format, f.modifier,
+						width, height,
+						crcset, &fb);
+	else
+		result &= test_format_plane_rgb(data, pipe, plane,
+						f.format, f.modifier,
+						width, height,
+						crcset, &fb);
+
+	if (f.format == DRM_FORMAT_C8)
+		set_legacy_lut(data, pipe, LUT_MASK);
+
 	igt_pipe_crc_stop(data->pipe_crc);
 
 	igt_plane_set_fb(plane, clear_fb);
@@ -1172,7 +1369,63 @@ static bool skip_plane(data_t *data, igt_plane_t *plane)
 }
 
 static void
-test_pixel_formats(data_t *data, enum pipe pipe)
+test_pixel_formats_sc(data_t *data, enum pipe pipe)
+{
+        struct igt_fb primary_fb;
+        igt_plane_t *primary;
+        drmModeModeInfo *mode;
+        bool result;
+        igt_output_t *output = data->output;
+        igt_plane_t *plane;
+
+        if (data->extended) {
+                data->colors = colors_extended;
+                data->num_colors = ARRAY_SIZE(colors_extended);
+        } else {
+                data->colors = colors_reduced;
+                data->num_colors = ARRAY_SIZE(colors_reduced);
+        }
+
+        igt_info("Using (pipe %s + %s) to run the subtest.\n",
+                 kmstest_pipe_name(pipe), igt_output_name(output));
+
+        test_init(data, pipe);
+
+        mode = igt_output_get_mode(output);
+
+        igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
+                      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &primary_fb);
+
+        igt_output_set_pipe(output, pipe);
+        primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+        igt_plane_set_fb(primary, &primary_fb);
+
+        igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+
+        set_legacy_lut(data, pipe, LUT_MASK);
+
+        result = true;
+        for_each_plane_on_pipe(&data->display, pipe, plane) {
+                if (skip_plane(data, plane))
+                        continue;
+                result &= test_format_plane_sc(data, pipe, output, plane, &primary_fb);
+        }
+
+        test_fini(data);
+
+        set_legacy_lut(data, pipe, 0xffff);
+
+        igt_plane_set_fb(primary, NULL);
+        igt_output_set_pipe(output, PIPE_NONE);
+        igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+
+        igt_remove_fb(data->drm_fd, &primary_fb);
+
+        igt_assert_f(result, "At least one CRC mismatch happened\n");
+}
+
+static void
+test_pixel_formats(data_t *data, enum pipe pipe, int i, int p)
 {
 	struct igt_fb primary_fb;
 	igt_plane_t *primary;
@@ -1211,7 +1464,7 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 	for_each_plane_on_pipe(&data->display, pipe, plane) {
 		if (skip_plane(data, plane))
 			continue;
-		result &= test_format_plane(data, pipe, output, plane, &primary_fb);
+		result &= test_format_plane(data, pipe, output, plane, &primary_fb, i, p);
 	}
 
 	test_fini(data);
@@ -1329,13 +1582,33 @@ static void
 run_tests_for_pipe_plane(data_t *data)
 {
 	igt_describe("verify the pixel formats for given plane and pipe");
-	igt_subtest_with_dynamic_f("pixel-format")
-		run_test(data, test_pixel_formats);
+	for (int p = 0; p < 29; p++) {
+                igt_subtest_with_dynamic_f("pixel-format-%s", sub_names[p]) {
+                        enum pipe pipe;
+                        int count = 0;
+                        for_each_pipe_with_single_output(&data->display, pipe, data->output) {
+                                igt_display_reset(&data->display);
+
+                                igt_output_set_pipe(data->output, pipe);
+                                if (!intel_pipe_output_combo_valid(&data->display))
+                                        continue;
+
+                                igt_output_set_pipe(data->output, PIPE_NONE);
+                                for (int i = 0; i < 3; i++) {
+                                        igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), dyna_names[i])
+                                                test_pixel_formats(data, pipe, i, p);
+                                }
+
+                                if (is_pipe_limit_reached(++count))
+                                        break;
+                        }
+                }
+        }
 
 	igt_describe("verify the pixel formats for given plane and pipe with source clamping");
 	igt_subtest_with_dynamic_f("pixel-format-source-clamping") {
 		data->crop = 4;
-		run_test(data, test_pixel_formats);
+		run_test(data, test_pixel_formats_sc);
 	}
 
 	data->crop = 0;
-- 
2.34.1

