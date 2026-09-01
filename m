Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C94C61DD3
	for <igt-dev@archiver.kernel.org>; Tue,  1 Sep 2026 17:10:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4A910EDEC;
	Tue,  1 Sep 2026 17:10:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="oNXZPRBq";
	dkim-atps=neutral
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB8F10EDF1
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2026 17:08:08 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-39647184c73so1337533a91.1
 for <igt-dev@lists.freedesktop.org>; Tue, 01 Sep 2026 10:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788282488; x=1788887288; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QDJ+E2qoGGe+Gl21JnTWHunA4zdJpS0XsfksfxyFpIE=;
 b=oNXZPRBqLTivlM9T50jC5x/OwcLvy7t2dd2NAV4JqtcK40bNT5SHiYILRvyzUNweHC
 F3NK1dSTyr4Wg7S9E/R7PSNbw2ofqj8I+ShWaAT0YP3E8qITPe3N3Nmk3UGxpLKhJDDN
 MA8Coe8Fy+DsYf73pYDouPSVKGMmIskCE60ebnhTjB1k1hobBO+D403CD2q7E8Gt/94g
 u8mb3eF6iSpF0O9AsLeUGl3mN5Zz8TUjnhZnTX4gbviyx2782frmdQJl3/4X/NJacIW0
 +F5QNF2Hw4/HKuWGvn9zFEhTpFQromeUWtyfn77tSoX0IktGGdVtwMfe2UkWJWT8Oqgn
 JQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788282488; x=1788887288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=QDJ+E2qoGGe+Gl21JnTWHunA4zdJpS0XsfksfxyFpIE=;
 b=cJ40jdkYRnfgZM/AwhZItcUYHF9CaG93FQ3eJUBG3RoguBvmEFGXPIfNDd05UkvtAH
 bXBzBCe/D/zOt2sVuIyaTYUypPERsRic39WRzn5A/JFORKp8+7V28FXGkIQdSoXnAELc
 WUaFnAbSKceNaUC9cIyDb+cmuqFyHBd31GjyvVY1C+AIdiL/lISgWfyrqOAgBt3U+8Rj
 raR/xalAGjK1BKez3jhiV1LsVUwmlQJJUixhlpWRSa1PZBcAKGn0CB9H3bjbo0cOCVd9
 1aFXz6LlGp9NvDzlBXfL6NBFs3ZYK2d1aT+PudnarTQ+NTsOhfGNpIuCCVN/fgRmpqPG
 xxqg==
X-Gm-Message-State: AFuF++kk4SL2d3U6/YB0EwK3DiXyTux4VsiM0IawVoalqgtbet8wJ+Hh
 CnmwJCdptBCniQLJreIVnqxWqYFxMCDiQs0hSJIkqV+M4E1FE7r7V3CTh7EoSMNlM+fD/Q==
X-Gm-Gg: AYBFou3vm58/RDHf1HFPNWtJlsYT7RZjB5C8GPz4jMOb6sFcHyakjKv89pwGfTZABLl
 Us0FvT5lRhchpmfa4MW33mvQucw8ZNG9cIPiK0P/9Uvdbkk6diDicfS9rLypwtlbbueOHmSQKUd
 KqC9lju/w6aSilHebulGbhBt+G3eW59GfUs2QUCTlgVUY5COBAlWqTfI63IWjQ0rqS9hPPXJsL6
 F7sZzr7SJ7CduxNsdf6GdD/7eC93c2ZqAyuh6X3xoOa86chlXVQYIxBMFmb8GFQtkurVlW301gH
 SXwE83ONPiNmw8dty1+ocvdneMsjiDdVNM9zx17C414VOpQuJl2WVzfTW7/Gn5VuFON3ySwtBe8
 rrMJNUMn6zMCG/9PnSldd8rhnf5KEuTS0EXiyFVXWImKprz4Jd3DcHBNkHsdhoDXP5cBV+cl4rK
 RvgDfV9Fauh+MFxQu+pw2MfDb0XkeTfrws/62F/rBlW8EU1j8NejbkcTpftFlLAd0yOKJW6fKZ1
 2K/tWGR/672ZcOZaSqMmvuQ3us=
X-Received: by 2002:a17:90b:4c84:b0:398:9bd3:d6d6 with SMTP id
 98e67ed59e1d1-3990f8d58e8mr4458580a91.16.1788282483359; 
 Tue, 01 Sep 2026 10:08:03 -0700 (PDT)
Received: from localhost ([134.134.139.73]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39ae380d726sm539657a91.9.2026.09.01.10.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2026 10:08:02 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 4/5] tests/kms_plane_scaling: change
 plane-downscale-max-crc to do variations
Date: Tue,  1 Sep 2026 20:07:39 +0300
Message-ID: <20260901170740.1079715-4-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901170740.1079715-1-juhapekka.heikkila@gmail.com>
References: <20260901170740.1079715-1-juhapekka.heikkila@gmail.com>
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
 tests/kms_plane_scaling.c | 284 ++++++++++++++++++++++++++++++++------
 1 file changed, 245 insertions(+), 39 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 59ec309ba..d81ef3637 100644
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
@@ -826,31 +858,70 @@ find_max_downscale_src_size(data_t *d, igt_plane_t *plane,
 	return best;
 }
 
-static void
-test_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
-		       bool scale_width)
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
+enum downscale_result {
+	DOWNSCALE_SKIP = 0,
+	DOWNSCALE_PASS,
+	DOWNSCALE_FAIL,
+};
+
+static enum downscale_result
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
+	drmModeModeInfo *highres, mode;
 	struct igt_fb ref_fb = {}, src_fb = {};
 	igt_plane_t *plane;
 	int dst_w, dst_h, dst_scaled, max_src;
 	int halign, valign, align;
+	bool equal;
 
 	cleanup_crtc(d);
+	/*
+	 * commit below will significantly slow the test down but is required
+	 * to make the test show all possible expected problems.
+	 */
+	igt_display_commit2(display, COMMIT_ATOMIC);
 
 	igt_require_pipe_crc(d->drm_fd);
 
 	igt_output_set_crtc(output, crtc);
 
-	mode = igt_output_get_highres_mode(output);
-	igt_require(mode);
-	igt_output_override_mode(output, mode);
+	highres = igt_output_get_highres_mode(output);
+	igt_require(highres);
+	mode = *highres;
+	igt_output_override_mode(output, &mode);
 
 	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_require(plane);
@@ -859,21 +930,26 @@ test_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
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
+		igt_debug("No %s downscaling headroom for " IGT_FORMAT_FMT
+			  " " IGT_MODIFIER_FMT " (max src %d, dst %d)\n",
+			  scale_width ? "horizontal" : "vertical",
+			  IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
+			  max_src, dst_scaled);
+		return DOWNSCALE_SKIP;
+	}
 
-	igt_info("Max %s downscale: src %d -> dst %d (band %d)\n",
+	igt_info("Max %s downscale for " IGT_FORMAT_FMT " " IGT_MODIFIER_FMT
+		 ": src %d -> dst %d (%.2fx, band %d, align %d)\n",
 		 scale_width ? "horizontal" : "vertical",
-		 max_src, dst_scaled, band);
+		 IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
+		 max_src, dst_scaled, (double)max_src / dst_scaled, band, align);
 
 	pipe_crc = igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
 
@@ -908,11 +984,90 @@ test_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 
 	igt_reset_fifo_underrun_reporting(display->drm_fd);
 
+	equal = igt_check_crc_equal(&ref_crc, &scaled_crc);
+
 	igt_pipe_crc_free(pipe_crc);
 	igt_remove_fb(display->drm_fd, &ref_fb);
 	igt_remove_fb(display->drm_fd, &src_fb);
 
-	igt_assert_crc_equal(&ref_crc, &scaled_crc);
+	/* --skip-crc-compare forces a pass, matching igt_assert_crc_equal(). */
+	return (equal || igt_skip_crc_compare) ? DOWNSCALE_PASS : DOWNSCALE_FAIL;
+}
+
+static void
+test_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
+		       uint64_t modifier)
+{
+	igt_plane_t *plane;
+	struct igt_vec tested_formats;
+	uint32_t format;
+	int tested = 0, passed = 0, failed = 0;
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
+		for (int axis = 0; axis < 2; axis++) {
+			bool scale_width = (axis == 0);
+			enum downscale_result r;
+
+			igt_debug("Testing %s downscale of format %s ("
+				  IGT_FORMAT_FMT ") modifier " IGT_MODIFIER_FMT
+				  " on pipe %s output %s\n",
+				  scale_width ? "horizontal" : "vertical",
+				  fname, IGT_FORMAT_ARGS(format),
+				  IGT_MODIFIER_ARGS(modifier),
+				  igt_crtc_name(crtc), igt_output_name(output));
+
+			r = check_one_downscale_max_crc(d, crtc, output, format,
+							modifier, scale_width);
+			if (r == DOWNSCALE_SKIP) {
+				igt_debug("Skipped %s downscale of format %s\n",
+					  scale_width ? "horizontal" : "vertical",
+					  fname);
+				continue;
+			}
+
+			tested++;
+			if (r == DOWNSCALE_PASS) {
+				passed++;
+				igt_debug("Passed %s downscale of format %s\n",
+					  scale_width ? "horizontal" : "vertical",
+					  fname);
+			} else {
+				failed++;
+				igt_critical("CRC mismatch on %s downscale of "
+					     "format %s (" IGT_FORMAT_FMT ") "
+					     "modifier " IGT_MODIFIER_FMT "\n",
+					     scale_width ? "horizontal" : "vertical",
+					     fname, IGT_FORMAT_ARGS(format),
+					     IGT_MODIFIER_ARGS(modifier));
+			}
+		}
+	}
+
+	igt_vec_fini(&tested_formats);
+
+	igt_require_f(tested > 0,
+		      "No format had downscaling headroom for modifier "
+		      IGT_MODIFIER_FMT "\n", IGT_MODIFIER_ARGS(modifier));
+
+	igt_info("Downscale CRC sweep: %d passed, %d failed of %d format/axis "
+		 "combinations\n", passed, failed, tested);
+
+	igt_assert_f(failed == 0,
+		     "%d of %d format/axis combinations failed CRC\n",
+		     failed, tested);
 }
 
 static uint32_t
@@ -1533,6 +1688,52 @@ crtc_output_combo_valid(igt_display_t *display, igt_crtc_t *crtc,
 	return ret;
 }
 
+static bool
+find_highest_res_crtc_output(data_t *d, igt_crtc_t **found_crtc,
+			     igt_output_t **found_output)
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
+		mode = igt_output_get_highres_mode(output);
+		if (!mode)
+			continue;
+
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
+	igt_debug("Selected pipe %s output %s (highest mode %dx%d) for "
+		  "downscale testing\n",
+		  igt_crtc_name(*found_crtc), igt_output_name(*found_output),
+		  igt_output_get_highres_mode(*found_output)->hdisplay,
+		  igt_output_get_highres_mode(*found_output)->vdisplay);
+
+	return true;
+}
+
 static int opt_handler(int opt, int opt_index, void *_data)
 {
 	data_t *data = _data;
@@ -1828,23 +2029,28 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
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
+				igt_require(find_highest_res_crtc_output(&data,
+									 &sel_crtc,
+									 &sel_output));
+
+				igt_dynamic_f("pipe-%s-%s",
+					      igt_crtc_name(sel_crtc),
+					      igt_output_name(sel_output))
+					test_downscale_max_crc(&data, sel_crtc,
+							       sel_output, modifier);
 			}
 		}
 	}
-- 
2.43.0

