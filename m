Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BDACA9ED2
	for <igt-dev@archiver.kernel.org>; Mon, 12 Oct 2026 12:33:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E561110F05F;
	Mon, 12 Oct 2026 12:33:47 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F381410E34E
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Oct 2026 12:30:01 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-3ab2cb8d577so1476506a91.1
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Oct 2026 05:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791808201; x=1792413001; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FQEL+OcDkfYgxL1PzlljgtzIdLTELk6BX0J8OtcT/do=;
 b=To7XgEIMjkHqcBW0Rkg8cvZH57AfcrnlLZSyfKrkAPh7M84bUSLDvDAjO+V7uAnqiY
 lMsjdDPgeGPkMzSjXcPo7K7VfjttBtv1goCRZVJCG5C2gL1f20r6gwH1DyvFa9bOk8zL
 psiG/sJCD3cM1OQs+MmqmChXjuX6cfUe7xZMLISvolGZbkw3CWP24f6U5kWxhMEeoPuC
 4Bg6WPD3Mi4ZSrRVrRQVMCw0vZ2QkKBjkl5nH15vNHRnnRquWmRz3RS9hSi7FWnRPt60
 Nxcp6Ru8F+3dRU6tOkB4oRs4YcsX3X/O6AicJX+PxShcnI6CRaDt59wK1b3fkVqxVKnh
 TWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791808201; x=1792413001;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=FQEL+OcDkfYgxL1PzlljgtzIdLTELk6BX0J8OtcT/do=;
 b=2VoOVwTF0DpFWcCfCRnDSjMBcC206NYNp2u1roTt4z2CM74K1SLlMdK2FXzV0zptn4
 RG/tVy3mYztjtjyM/y7aQEMd0RxE10qCAzXwju/8/HT7Sl38+cS7YkZcAAt9i6NCW4Qk
 uxM9GgU9AqEbeiFjHv82V6Xh8jbyJPYslEkgon2SjatEOnQhiV/oueXGTyQ/pwJDcFdC
 ELo8oetmL90XCedHiEQgIKwVudwFCHHrBBFq0AFifdUNcx3Xy9MqYAzoKAFfe3w9RWYz
 ULnzU/kfkcrWhqkvo9kHglmQos+q1vTcx70JqdYufmgis0M1LqjVa6FvECZmdEhzYX4z
 7B1w==
X-Gm-Message-State: AFq9FYLXdDEgQOg74kw9nE1hzeZl41XQTiaalALEWUnM1CRdEa+2RSXM
 g2EU8J1F/kqlF1MYuYNiT/ozEm+Sne16MYWd2yCEh14T9+6POQiC6/1gp2Ex9jI/y8I=
X-Gm-Gg: AYBFou33yEJpAh7laIesxCXSHWoYP6pawiT3QbzURSjWPpQn1eQSXVusX2pI1c+Wrtn
 MAvhk6Y1NBFdx6RXVr3NAEAcqW6wIRR0UBLzk4DUO/eOpDjfSivzcdq9i4MQnTW6yQk6ePiYVeX
 Ct5o9nVkOvdkjFf4xOcBpVfTKfJKwPu96nAocqTn9esnroQwNcxzKz2pbbw1Yo1Jc9Q08ScqYQH
 POG9jikV8RruY1Unk0bMG65fdQ9iiV6oNH/nJ2V+LJNbFC/q85gfCI2cF6cDGzp/nsFg+4AYV0k
 FlA42fFe1tpF946afqf6vpbka/WbXyoYBi+xKiF4qGOeOEqgnBcVHRhBaFQ5dpjZBlEnSGD/JKK
 WVOvVm7HiQywSi68JJ84szIBUrDGDJfkEmIoa52br+YHquQU0n69ZByH8m5SiLtOrVjoOF21VRx
 S6+5M1PA/N0XkAlyP5u/pIWSSv/EfyXrn1Zjj3vIfnynAXTvo5Yb1GLyvrfUf8hBf9O9y4c2T4c
 WbsdJO0Z1ZqsPuzD9GAakJS4iFO+wmbpRuSmw==
X-Received: by 2002:a17:90b:3c8c:b0:3aa:6b5d:a018 with SMTP id
 98e67ed59e1d1-3ab3af94c34mr7279972a91.67.1791808201338; 
 Mon, 12 Oct 2026 05:30:01 -0700 (PDT)
Received: from localhost ([134.134.139.73]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3ab36ca0033sm16193157a91.2.2026.10.12.05.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 05:30:00 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 4/5] tests/kms_plane_scaling: change
 plane-downscale-max-crc to do variations
Date: Mon, 12 Oct 2026 15:29:38 +0300
Message-ID: <20261012122939.233749-4-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012122939.233749-1-juhapekka.heikkila@gmail.com>
References: <20261012122939.233749-1-juhapekka.heikkila@gmail.com>
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

Probe the maximum horizontal and vertical plane downscaling
factor for modifiers for each supported pixel format and verify
downscaled framebuffer renders correctly using crc.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_plane_scaling.c | 266 ++++++++++++++++++++++++++++++++------
 1 file changed, 230 insertions(+), 36 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 4b5730cd1..5511dab0a 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -32,6 +32,7 @@
 
 #include "igt.h"
 #include "igt_vec.h"
+#include <ctype.h>
 #include <math.h>
 
 /**
@@ -190,10 +191,18 @@
  */
 
 /**
- * SUBTEST: plane-downscale-max-crc
+ * SUBTEST: plane-downscale-max-crc-%s
  * Description: Probe the maximum horizontal and vertical plane downscaling
- *              factor and verify the downscaled framebuffer render correctly
- *              by verifying via crc.
+ *              factor for %arg[1] for each supported pixel format and verify
+ *              the downscaled framebuffer renders correctly via crc.
+ *
+ * arg[1]:
+ *
+ * @linear:     linear
+ * @x-tiled:    X-tiled
+ * @y-tiled:    Y-tiled
+ * @yf-tiled:   Yf-tiled
+ * @4-tiled:    4-tiled
  */
 
 IGT_TEST_DESCRIPTION("Test display plane scaling");
@@ -716,6 +725,29 @@ static const uint64_t modifiers[] = {
 	I915_FORMAT_MOD_4_TILED
 };
 
+static const struct {
+	uint64_t modifier;
+	const char *name;
+} downscale_modifiers[] = {
+	{ DRM_FORMAT_MOD_LINEAR,	"linear" },
+	{ I915_FORMAT_MOD_X_TILED,	"x-tiled" },
+	{ I915_FORMAT_MOD_Y_TILED,	"y-tiled" },
+	{ I915_FORMAT_MOD_Yf_TILED,	"yf-tiled" },
+	{ I915_FORMAT_MOD_4_TILED,	"4-tiled" },
+};
+
+static const char *format_name_lower(uint32_t format, char *buf, size_t len)
+{
+	const char *name = igt_format_str(format);
+	size_t i;
+
+	for (i = 0; i < len - 1 && name[i]; i++)
+		buf[i] = tolower(name[i]);
+	buf[i] = '\0';
+
+	return buf;
+}
+
 static void yuv_src_alignment(data_t *d, uint32_t format, igt_rotation_t rot,
 			      int *halign, int *valign)
 {
@@ -826,31 +858,96 @@ find_max_downscale_src_size(data_t *d, igt_plane_t *plane,
 	return best;
 }
 
+static bool downscale_format_wanted(data_t *d, igt_plane_t *plane,
+				    uint32_t format, uint64_t modifier,
+				    struct igt_vec *tested_formats)
+{
+	uint32_t reduced;
+
+	if (!igt_fb_supported_format(format))
+		return false;
+
+	if (!igt_plane_has_format_mod(plane, format, modifier))
+		return false;
+
+	if (!can_scale(d, format))
+		return false;
+
+	/* Test each format "class" only once unless --extended was given. */
+	if (!d->extended) {
+		reduced = igt_reduce_format(format);
+
+		if (igt_vec_index(tested_formats, &reduced) >= 0)
+			return false;
+
+		igt_vec_push(tested_formats, &reduced);
+	}
+
+	return true;
+}
+
+#define LUT_MASK 0xf800
+
+static void set_legacy_lut(data_t *data, igt_crtc_t *crtc,
+			   uint16_t mask)
+{
+	drmModeCrtc *drm_crtc;
+	uint16_t *lut;
+	int i, lut_size;
+
+	drm_crtc = drmModeGetCrtc(data->drm_fd, crtc->crtc_id);
+	lut_size = drm_crtc->gamma_size;
+	drmModeFreeCrtc(drm_crtc);
+
+	/* Skip if legacy LUT is not supported: */
+	if (!lut_size)
+		return;
+
+	lut = malloc(sizeof(uint16_t) * lut_size);
+
+	for (i = 0; i < lut_size; i++)
+		lut[i] = (i * 0xffff / (lut_size - 1)) & mask;
+
+	igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, crtc->crtc_id,
+					  lut_size, lut, lut, lut), 0);
+
+	free(lut);
+}
+
 static void
-test_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
-		       bool scale_width)
+check_one_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
+			    uint32_t format, uint64_t modifier, bool scale_width)
 {
 	igt_display_t *display = &d->display;
-	const uint32_t format = DRM_FORMAT_XRGB8888;
-	const uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 	const int band = 64;
 	igt_pipe_crc_t *pipe_crc;
 	igt_crc_t ref_crc, scaled_crc;
-	drmModeModeInfo *mode;
+	drmModeModeInfo mode;
 	struct igt_fb ref_fb = {}, src_fb = {};
 	igt_plane_t *plane;
 	int dst_w, dst_h, dst_scaled, max_src;
 	int halign, valign, align;
+	/* Pre-ver14 scalers round planar YUV differently from 1:1. */
+	bool mask_lut = is_intel_device(d->drm_fd) &&
+			intel_display_ver(d->devid) < 14;
 
 	cleanup_crtc(d);
+	/*
+	 * commit below will significantly slow the test down but is required
+	 * to make the test show all possible expected problems.
+	 */
+	igt_display_commit2(display, COMMIT_ATOMIC);
 
 	igt_require_pipe_crc(d->drm_fd);
 
 	igt_output_set_crtc(output, crtc);
 
+	if (mask_lut)
+		set_legacy_lut(d, crtc, LUT_MASK);
+
 	/* Preferred mode; the largest advertised one may not be usable. */
-	mode = &output->config.default_mode;
-	igt_output_override_mode(output, mode);
+	mode = output->config.default_mode;
+	igt_output_override_mode(output, &mode);
 
 	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_require(plane);
@@ -859,21 +956,27 @@ test_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 	align = scale_width ? halign : valign;
 
 	/* dst is a thin band spanning the full extent of the scaled axis */
-	dst_w = ALIGN(scale_width ? mode->hdisplay : band, halign);
-	dst_h = ALIGN(scale_width ? band : mode->vdisplay, valign);
+	dst_w = ALIGN(scale_width ? mode.hdisplay : band, halign);
+	dst_h = ALIGN(scale_width ? band : mode.vdisplay, valign);
 	dst_scaled = scale_width ? dst_w : dst_h;
 
 	max_src = find_max_downscale_src_size(d, plane, format, modifier,
 					      scale_width, dst_w, dst_h, align);
-	skip_if_erange_or_einval(max_src);
-	igt_require_f(max_src > dst_scaled,
-		      "No %s downscaling headroom (max src %d, dst %d)\n",
-		      scale_width ? "horizontal" : "vertical",
-		      max_src, dst_scaled);
+	if (max_src == -ERANGE || max_src == -EINVAL || max_src <= dst_scaled) {
+		if (mask_lut)
+			set_legacy_lut(d, crtc, 0xffff);
+		igt_skip("No %s downscaling headroom for " IGT_FORMAT_FMT
+			 " " IGT_MODIFIER_FMT " (max src %d, dst %d)\n",
+			 scale_width ? "horizontal" : "vertical",
+			 IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
+			 max_src, dst_scaled);
+	}
 
-	igt_info("Max %s downscale: src %d -> dst %d (band %d)\n",
+	igt_info("Max %s downscale for " IGT_FORMAT_FMT " " IGT_MODIFIER_FMT
+		 ": src %d -> dst %d (%.2fx, band %d, align %d)\n",
 		 scale_width ? "horizontal" : "vertical",
-		 max_src, dst_scaled, band);
+		 IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
+		 max_src, dst_scaled, (double)max_src / dst_scaled, band, align);
 
 	pipe_crc = igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
 
@@ -912,9 +1015,55 @@ test_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 	igt_remove_fb(display->drm_fd, &ref_fb);
 	igt_remove_fb(display->drm_fd, &src_fb);
 
+	if (mask_lut)
+		set_legacy_lut(d, crtc, 0xffff);
+
 	igt_assert_crc_equal(&ref_crc, &scaled_crc);
 }
 
+static void
+test_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
+		       uint64_t modifier)
+{
+	igt_plane_t *plane;
+	struct igt_vec tested_formats;
+	uint32_t format;
+
+	plane = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
+	igt_require(plane);
+
+	igt_vec_init(&tested_formats, sizeof(uint32_t));
+
+	for_each_plane_format(plane, format) {
+		char fname[32];
+
+		if (!downscale_format_wanted(d, plane, format, modifier,
+					     &tested_formats))
+			continue;
+
+		format_name_lower(format, fname, sizeof(fname));
+
+		/*
+		 * One dynamic subtest per format and axis keeps each one's
+		 * log output (incl. dmesg) within the runner's per-dynamic
+		 * subtest disk usage budget.
+		 */
+		for (int axis = 0; axis < 2; axis++) {
+			bool scale_width = (axis == 0);
+
+			igt_dynamic_f("pipe-%s-%s-%s-%s",
+				      igt_crtc_name(crtc),
+				      igt_output_name(output), fname,
+				      scale_width ? "horizontal" : "vertical")
+				check_one_downscale_max_crc(d, crtc, output,
+							    format, modifier,
+							    scale_width);
+		}
+	}
+
+	igt_vec_fini(&tested_formats);
+}
+
 static uint32_t
 test_scaler_with_modifier_crtc(data_t *d,
 			       double sf_plane,
@@ -1533,6 +1682,49 @@ crtc_output_combo_valid(igt_display_t *display, igt_crtc_t *crtc,
 	return ret;
 }
 
+static bool
+find_native_res_crtc_output(data_t *d, igt_crtc_t **found_crtc,
+			    igt_output_t **found_output)
+{
+	igt_display_t *display = &d->display;
+	igt_crtc_t *crtc;
+	igt_output_t *output;
+	uint64_t best_area = 0;
+
+	*found_crtc = NULL;
+	*found_output = NULL;
+
+	for_each_crtc_with_valid_output(display, crtc, output) {
+		drmModeModeInfo *mode;
+		uint64_t area;
+
+		if (!crtc_output_combo_valid(display, crtc, output))
+			continue;
+		if (igt_crtc_num_scalers(crtc) < 1)
+			continue;
+
+		mode = &output->config.default_mode;
+		area = (uint64_t)mode->hdisplay * mode->vdisplay;
+		if (area <= best_area)
+			continue;
+
+		best_area = area;
+		*found_crtc = crtc;
+		*found_output = output;
+	}
+
+	if (!*found_crtc)
+		return false;
+
+	igt_debug("Selected pipe %s output %s (native mode %dx%d) for "
+		  "downscale testing\n",
+		  igt_crtc_name(*found_crtc), igt_output_name(*found_output),
+		  (*found_output)->config.default_mode.hdisplay,
+		  (*found_output)->config.default_mode.vdisplay);
+
+	return true;
+}
+
 static int opt_handler(int opt, int opt_index, void *_data)
 {
 	data_t *data = _data;
@@ -1828,23 +2020,25 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 			}
 		}
 
-		igt_describe("Probe the maximum horizontal and vertical plane "
-			     "downscaling factor and verify the downscaled output "
-			     "matches an unscaled reference using CRCs.");
-		igt_subtest_with_dynamic("plane-downscale-max-crc") {
-			for_each_crtc_with_valid_output(&data.display, crtc, output) {
-				if (!crtc_output_combo_valid(&data.display, crtc, output))
-					continue;
-				if (igt_crtc_num_scalers(crtc) < 1)
-					continue;
-
-				igt_dynamic_f("pipe-%s-%s-horizontal",
-					      igt_crtc_name(crtc), igt_output_name(output))
-					test_downscale_max_crc(&data, crtc, output, true);
-
-				igt_dynamic_f("pipe-%s-%s-vertical",
-					      igt_crtc_name(crtc), igt_output_name(output))
-					test_downscale_max_crc(&data, crtc, output, false);
+		for (int m = 0; m < ARRAY_SIZE(downscale_modifiers); m++) {
+			uint64_t modifier = downscale_modifiers[m].modifier;
+
+			igt_describe("Probe the maximum horizontal and vertical "
+				     "plane downscaling factor for each supported "
+				     "pixel format and verify the downscaled "
+				     "output matches an unscaled reference using "
+				     "CRCs.");
+			igt_subtest_with_dynamic_f("plane-downscale-max-crc-%s",
+						   downscale_modifiers[m].name) {
+				igt_crtc_t *sel_crtc;
+				igt_output_t *sel_output;
+
+				igt_require(find_native_res_crtc_output(&data,
+									&sel_crtc,
+									&sel_output));
+
+				test_downscale_max_crc(&data, sel_crtc,
+						       sel_output, modifier);
 			}
 		}
 	}
-- 
2.43.0

