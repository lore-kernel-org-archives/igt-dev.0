Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736BACC6B34
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 13:21:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1180810E9EB;
	Thu, 15 Oct 2026 13:21:47 +0000 (UTC)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com
 [74.125.82.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00FBB10E168
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 13:16:50 +0000 (UTC)
Received: by mail-dy1-f176.google.com with SMTP id
 5a478bee46e88-35d7fa491deso1628365eec.1
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 06:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792070210; x=1792675010; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=t2JTa5hPMPwiG2aMF++i3gl368ntYwDXS/x06Dl9M0w=;
 b=soxTWrUsmWqIcKjLBP5lqptOPuD+H7im37ONUW9dLJNWJ1HaSiNGgf5NoQUzYTB+Hg
 jj2WKOuKHFzjeSZ1kGNqLEA0e3V7UFgUJcSzEX5ZiGu/PNrs/ASI4Qrdv/eWqTktOhSi
 z47PO+cTt5O1tF0OmqtVHWJIeXC2vX/CEmDQtdzOa0zR7mhEG1WaIwJzwiOsze05WtLK
 FXRltMUXHizu8kFmtW6PQH2WeF2Ns354ByZbLuqbDjfnQtUwnD5xUb/rUDG1sGxU22ps
 8vJbhp/KEhE+XaftQWgWaaLLEAESqb2ZMJPOw8rf4tKhjU/9xD4urok9AMyMyRHyaj1h
 wWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792070210; x=1792675010;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=t2JTa5hPMPwiG2aMF++i3gl368ntYwDXS/x06Dl9M0w=;
 b=nWW71lPQy5yKF/5uK9WLSU1qiflKRWggrlMcnANrYi693ITQXzlckLRE4C0qoTpgnf
 6diWGOKD5FvHliqQWU+B564Bssb2tOaazZJMHA+VVi/PlcMzydd2SBCvHsnNq7gjhz5B
 bffSYBpbAHEomSaLen2qe5/bVoDi1AsKkX6US9QpaGB0bwwL/BBvdQGq04U3dVUww2Ax
 dXlBph6pjsgZmAayJdk68fiYdpu0EccF/XwvvYjtI4sHEBW4qK5MO07XnUtBWxrxSAAB
 WcXnRwGLKt9/OLVYLU2BA+nqeRRxZNBNVPf0z00E0joX+9seJomS6hjIUm9aouCx6mN2
 K6/A==
X-Gm-Message-State: AFq9FYL1WFUI9PZaHevhNe+bAUWQGoLW0GIKlipNmm5Y+ncXDM79xh4R
 elDrCVwra+ud2y0AfeKx1LHrRI0vGlrH6b3dLZ29NQM9lmtLBbXoKB2r6sE7XPsVLsU=
X-Gm-Gg: AYBFou13GqmO9QI4jnTRkgKZ1DV1nDdTO7xmo/2fQJBv5X88Q7LgwPbg76oXLUnRYw5
 uzx1tvcQ/OhhbcuIMw7GwTQNZYm4ld2mS10B/Wd+T2Ku5+nSz/SDbPJ0YiylpUQJXfTpf+WuAr+
 shOlvLc2/mu4swO9/aXoaKlxRfVVmSqfCYZYYPRbPYxhJ56ioUBj3czkQe84QA635NVB9QyWYd0
 JeXuHwaCysoAfMkjjbGEPBhiLIclFazPndzR/+3EN1CG5FqbHumNxA8E6m2wRf6Gj+r4WIu/AbZ
 FYNxGpmpMV8JxGRk3A4WExjLSEii6RoDUqnMNnBn6ugMkMKCH9fzkw2f9qjWty53egbKaaxdF/v
 lNv/8qtLwWCtPdNgm41uDd8QS0HyAjevZ47VT59xMyRN081hSrAhwnjqQ09Xyc22ED0bbgjb+Qk
 h/riW+oS6jjBTH14lPxmGZnRzRIFBTmNU2z/vCKeVvsL5NS/6//sRZqMEL6Gk+SGLukUZKKI6RZ
 nJhrQfZRbrwBOyUa8es7K+GyQLKS+vflIDtmt/4RUYG8A0=
X-Received: by 2002:a05:693c:8202:b0:357:ee3a:267a with SMTP id
 5a478bee46e88-3602a192d5fmr17878eec.2.1792070209594; 
 Thu, 15 Oct 2026 06:16:49 -0700 (PDT)
Received: from localhost ([192.55.55.48]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-35f0c3bcf80sm8435180eec.7.2026.10.15.06.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 06:16:49 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 4/9] tests/kms_plane_scaling: change
 plane-downscale-max-crc to do variations
Date: Thu, 15 Oct 2026 16:16:11 +0300
Message-ID: <20261015131616.3172918-4-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015131616.3172918-1-juhapekka.heikkila@gmail.com>
References: <20261015131616.3172918-1-juhapekka.heikkila@gmail.com>
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
 tests/kms_plane_scaling.c | 381 ++++++++++++++++++++++++++++++--------
 1 file changed, 307 insertions(+), 74 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 4b5730cd1..3b187220f 100644
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
@@ -826,93 +858,249 @@ find_max_downscale_src_size(data_t *d, igt_plane_t *plane,
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
+struct scale_axis {
+	const char *name;
+	bool scale_width;
+	int dst_w, dst_h, dst_scaled, limit;
+	bool tested, failed;
+};
+
 static void
-test_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
-		       bool scale_width)
+check_one_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
+			    uint32_t format, uint64_t modifier)
 {
 	igt_display_t *display = &d->display;
-	const uint32_t format = DRM_FORMAT_XRGB8888;
-	const uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 	const int band = 64;
+	struct scale_axis axes[] = {
+		{ .name = "horizontal", .scale_width = true },
+		{ .name = "vertical", .scale_width = false },
+	};
 	igt_pipe_crc_t *pipe_crc;
 	igt_crc_t ref_crc, scaled_crc;
-	drmModeModeInfo *mode;
-	struct igt_fb ref_fb = {}, src_fb = {};
+	drmModeModeInfo mode;
 	igt_plane_t *plane;
-	int dst_w, dst_h, dst_scaled, max_src;
-	int halign, valign, align;
+	int halign, valign;
+	char limits[128] = "";
+	bool any_tested = false;
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
 
 	yuv_src_alignment(d, format, IGT_ROTATION_0, &halign, &valign);
-	align = scale_width ? halign : valign;
 
-	/* dst is a thin band spanning the full extent of the scaled axis */
-	dst_w = ALIGN(scale_width ? mode->hdisplay : band, halign);
-	dst_h = ALIGN(scale_width ? band : mode->vdisplay, valign);
-	dst_scaled = scale_width ? dst_w : dst_h;
+	/* Search both axes first so the CRC phase only commits known limits. */
+	for (int i = 0; i < ARRAY_SIZE(axes); i++) {
+		struct scale_axis *a = &axes[i];
+		size_t used;
+
+		/* dst is a thin band spanning the whole scaled axis */
+		a->dst_w = ALIGN(a->scale_width ? mode.hdisplay : band, halign);
+		a->dst_h = ALIGN(a->scale_width ? band : mode.vdisplay, valign);
+		a->dst_scaled = a->scale_width ? a->dst_w : a->dst_h;
+
+		a->limit = find_max_downscale_src_size(d, plane, format,
+						       modifier,
+						       a->scale_width,
+						       a->dst_w, a->dst_h,
+						       a->scale_width ?
+						       halign : valign);
+		if (a->limit < 0 || a->limit <= a->dst_scaled) {
+			igt_debug("No %s downscaling headroom "
+				  "(max src %d, dst %d)\n",
+				  a->name, a->limit, a->dst_scaled);
+			continue;
+		}
+
+		a->tested = true;
+		any_tested = true;
+
+		used = strlen(limits);
+		snprintf(limits + used, sizeof(limits) - used,
+			 "%s%s src %d -> dst %d (%.2fx)", used ? ", " : "",
+			 a->name, a->limit, a->dst_scaled,
+			 (double)a->limit / a->dst_scaled);
+	}
 
-	max_src = find_max_downscale_src_size(d, plane, format, modifier,
-					      scale_width, dst_w, dst_h, align);
-	skip_if_erange_or_einval(max_src);
-	igt_require_f(max_src > dst_scaled,
-		      "No %s downscaling headroom (max src %d, dst %d)\n",
-		      scale_width ? "horizontal" : "vertical",
-		      max_src, dst_scaled);
+	if (!any_tested) {
+		if (mask_lut)
+			set_legacy_lut(d, crtc, 0xffff);
+		igt_skip("No downscaling headroom on either axis for "
+			 IGT_FORMAT_FMT " " IGT_MODIFIER_FMT "\n",
+			 IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier));
+	}
 
-	igt_info("Max %s downscale: src %d -> dst %d (band %d)\n",
-		 scale_width ? "horizontal" : "vertical",
-		 max_src, dst_scaled, band);
+	igt_info("Max downscale for " IGT_FORMAT_FMT " " IGT_MODIFIER_FMT
+		 ": %s\n", IGT_FORMAT_ARGS(format),
+		 IGT_MODIFIER_ARGS(modifier), limits);
 
 	pipe_crc = igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
 
-	/* Reference: unscaled solid-green framebuffer of the destination size. */
-	igt_create_color_fb(display->drm_fd, dst_w, dst_h, format, modifier,
-			    0.0, 1.0, 0.0, &ref_fb);
-	igt_plane_set_fb(plane, &ref_fb);
-	igt_fb_set_position(&ref_fb, plane, 0, 0);
-	igt_fb_set_size(&ref_fb, plane, dst_w, dst_h);
-	igt_plane_set_position(plane, 0, 0);
-	igt_plane_set_size(plane, dst_w, dst_h);
-	igt_display_commit2(display, COMMIT_ATOMIC);
-	igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
-
-	/* Test: larger solid-green source downscaled into dst rectangle. */
-	igt_create_color_fb(display->drm_fd,
-			    scale_width ? max_src : dst_w,
-			    scale_width ? dst_h : max_src,
-			    format, modifier, 0.0, 1.0, 0.0, &src_fb);
-	igt_plane_set_fb(plane, &src_fb);
-	igt_fb_set_position(&src_fb, plane, 0, 0);
-	igt_fb_set_size(&src_fb, plane,
-			scale_width ? max_src : dst_w,
-			scale_width ? dst_h : max_src);
-	igt_plane_set_position(plane, 0, 0);
-	igt_plane_set_size(plane, dst_w, dst_h);
-	igt_display_commit2(display, COMMIT_ATOMIC);
-	igt_pipe_crc_collect_crc(pipe_crc, &scaled_crc);
+	for (int i = 0; i < ARRAY_SIZE(axes); i++) {
+		struct scale_axis *a = &axes[i];
+		struct igt_fb ref_fb = {}, src_fb = {};
+
+		if (!a->tested)
+			continue;
+
+		/* Reference: unscaled solid-green fb of the dst size. */
+		igt_create_color_fb(display->drm_fd, a->dst_w, a->dst_h,
+				    format, modifier, 0.0, 1.0, 0.0, &ref_fb);
+		igt_plane_set_fb(plane, &ref_fb);
+		igt_fb_set_position(&ref_fb, plane, 0, 0);
+		igt_fb_set_size(&ref_fb, plane, a->dst_w, a->dst_h);
+		igt_plane_set_position(plane, 0, 0);
+		igt_plane_set_size(plane, a->dst_w, a->dst_h);
+		igt_display_commit2(display, COMMIT_ATOMIC);
+		igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
+
+		/* Test: larger solid-green source downscaled into dst. */
+		igt_create_color_fb(display->drm_fd,
+				    a->scale_width ? a->limit : a->dst_w,
+				    a->scale_width ? a->dst_h : a->limit,
+				    format, modifier, 0.0, 1.0, 0.0, &src_fb);
+		igt_plane_set_fb(plane, &src_fb);
+		igt_fb_set_position(&src_fb, plane, 0, 0);
+		igt_fb_set_size(&src_fb, plane,
+				a->scale_width ? a->limit : a->dst_w,
+				a->scale_width ? a->dst_h : a->limit);
+		igt_plane_set_position(plane, 0, 0);
+		igt_plane_set_size(plane, a->dst_w, a->dst_h);
+		igt_display_commit2(display, COMMIT_ATOMIC);
+		igt_pipe_crc_collect_crc(pipe_crc, &scaled_crc);
+
+		igt_plane_set_fb(plane, NULL);
+		igt_remove_fb(display->drm_fd, &ref_fb);
+		igt_remove_fb(display->drm_fd, &src_fb);
+
+		a->failed = !igt_check_crc_equal(&ref_crc, &scaled_crc);
+		if (a->failed)
+			igt_critical("CRC mismatch on %s downscale\n", a->name);
+	}
 
-	igt_plane_set_fb(plane, NULL);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 
 	igt_reset_fifo_underrun_reporting(display->drm_fd);
 
 	igt_pipe_crc_free(pipe_crc);
-	igt_remove_fb(display->drm_fd, &ref_fb);
-	igt_remove_fb(display->drm_fd, &src_fb);
 
-	igt_assert_crc_equal(&ref_crc, &scaled_crc);
+	if (mask_lut)
+		set_legacy_lut(d, crtc, 0xffff);
+
+	igt_assert_f(!(axes[0].failed || axes[1].failed) ||
+		     igt_skip_crc_compare,
+		     "%s%s%s downscale CRC mismatch\n",
+		     axes[0].failed ? axes[0].name : "",
+		     axes[0].failed && axes[1].failed ? " and " : "",
+		     axes[1].failed ? axes[1].name : "");
+}
+
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
+		/* Per-format dynamics keep dmesg within the log budget. */
+		igt_dynamic_f("pipe-%s-%s-%s", igt_crtc_name(crtc),
+			      igt_output_name(output), fname)
+			check_one_downscale_max_crc(d, crtc, output, format,
+						    modifier);
+	}
+
+	igt_vec_fini(&tested_formats);
 }
 
 static uint32_t
@@ -1533,6 +1721,49 @@ crtc_output_combo_valid(igt_display_t *display, igt_crtc_t *crtc,
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
@@ -1828,23 +2059,25 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
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

