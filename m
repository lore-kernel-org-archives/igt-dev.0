Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DD8CA6007
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 15:20:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F1610E8D0;
	Thu,  8 Oct 2026 15:20:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cKvm/qRa";
	dkim-atps=neutral
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F62510E45C
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2026 15:16:38 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-88cfa501c5cso2318730b3a.3
 for <igt-dev@lists.freedesktop.org>; Thu, 08 Oct 2026 08:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791472598; x=1792077398; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MLiVQIyRhwpeR9pfgWcmcGqIQpnGJ9c40Y58lenzMyg=;
 b=cKvm/qRaaFUVJTjM25ZfVoU9NSlzv0PbTM3NxrQCOaQwR0ayakJbNSMdHRDpAGY0Oe
 1sIT5vdy101GVLT1zy87c79ZjCsGbezf50+ezHi0quGKZW9wl2p1rDFDWbN8u/i/XmZk
 7rCx/rLmnmxq8R7LH8R+7haj3+UgnQAyMVUYmK7lMy2hTxVBlGKEudxUogHy0uU8VxM/
 HFREHQbyY/is5Op6pPYyK4oRBuUYTUf4h+n0FpXtFOQZ6tnTPu4ML+VKsRlt6e6SdzXH
 5ayAEr1yN7FZzV5BhsMdjV64JR00p8EqQYNFwrodxqVqMLHidVS1NO8D+PaQAv0QB4Uw
 24eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791472598; x=1792077398;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=MLiVQIyRhwpeR9pfgWcmcGqIQpnGJ9c40Y58lenzMyg=;
 b=VbiHXGtK93REPpR3tHT7NLJuawM7pwWVSppOJ5ef8mm9DZh1w8q/XHZhIq4qi/cthw
 4pKlrFm2NEP+L9vPn1cKb9Qr3kLZcGa5VzaqUN7DfsY3+bcBSaRa0P6DEk1G/j0lJ09y
 TScUluofTMZgHf6Piiol/mCqAWwLNsEj77GKo1wGLlQ3jD3ednDTX7m1BWoySj+cdCHY
 BciqP8/glpTf8iQRK+1a+6r8XjSptMP+q/SBMa6f4gS9A3R6cwip4BcYQwBmyNx2f6uH
 HnQ3dYigrvrpEGQbk93U2V9IjuDBjpWrPIUIJ8NNSc2Q1XGozKPU/afWcVaShXPuf0ha
 yEWg==
X-Gm-Message-State: AFuF++kLu4ED027HjlRxt4vSLyMpP5HzSEDf6B3FVw6gdIVyL95/I/gi
 r6BTvN9jNGGWxoAZ0xx0IaUd5b0R/tWMo/tkHec1OLZ/EN6FBjkj/xLR8DOP+hbNp7k=
X-Gm-Gg: AYBFou3L8EbEELu/WRWu7pFy935vrBqZhoZ705jkYA3P7Sr/lRXQjrJpbr5BNI/+XPL
 g73YoHPrC2ZeOAiseGZcuhCbWKODW/3YujJBDbUOLjEGa81dBFUg5TZpFWU44wxQ/kbfVYPfk6V
 doAvcfX8bDarfeO6Kgqk1VzLqfW+SWbhINicXtv/B8de5Fpzb6DXNBLMQeNz8uSoJZGMm5Tq2DD
 MFF2u1sXw57IOq1WvC6cRrG3HGVdrATeV4kkgQT4eCv0LuK3+kRuPPX+P58nV3SwM3zAHMvrB6U
 oxWEBDHNHL6IQKwu/MxAn9p52BnxSvO/BCUqhG8BLGwiiIzcEOQzd9xQT/LxEJ+fXl4OL9FWHbG
 nzaVil6XelVAJcQ4+a+G5olVeWN5l2K/spHfi5zvZFgwH1Y+KRgeeOWOIt0gOXiu53wiWqaaTqr
 auojsHjkhy4PilIjMQPGvIHxPzoYjnnRLWZTJetmlOIujTqboZ7E6qY271HVJLSHiEPgxOSlMUL
 7FWyXtvoa8U6v/T4lN3JuejzfMyno6BgITmhbEyZd++Rg==
X-Received: by 2002:a05:6a20:1446:b0:3dd:a197:736f with SMTP id
 adf61e73a8af0-3e1341729damr5191517637.72.1791472593226; 
 Thu, 08 Oct 2026 08:16:33 -0700 (PDT)
Received: from localhost ([192.55.55.44]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-895ea74a7f9sm83588b3a.3.2026.10.08.08.16.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2026 08:16:32 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 5/5] tests/kms_plane_scaling: add plane-upscale-max-crc
 subtest
Date: Thu,  8 Oct 2026 18:16:04 +0300
Message-ID: <20261008151604.2657835-5-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008151604.2657835-1-juhapekka.heikkila@gmail.com>
References: <20261008151604.2657835-1-juhapekka.heikkila@gmail.com>
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

Add the upscaling counterpart to plane-downscale-max-crc. The
destination is a thin band spanning the scaled axis and the source is
a crop of that same framebuffer, shrunk by a binary search until the
kernel stops accepting the configuration. The maximally upscaled solid
colour fill must produce the same crc as an unscaled crop of exactly
the destination size.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_plane_scaling.c | 280 ++++++++++++++++++++++++--------------
 1 file changed, 175 insertions(+), 105 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 24be55861..4a2adea20 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -205,6 +205,21 @@
  * @4-tiled:    4-tiled
  */
 
+/**
+ * SUBTEST: plane-upscale-max-crc-%s
+ * Description: Probe the maximum horizontal and vertical plane upscaling
+ *              factor for %arg[1] for each supported pixel format and verify
+ *              the upscaled framebuffer renders correctly via crc.
+ *
+ * arg[1]:
+ *
+ * @linear:     linear
+ * @x-tiled:    X-tiled
+ * @y-tiled:    Y-tiled
+ * @yf-tiled:   Yf-tiled
+ * @4-tiled:    4-tiled
+ */
+
 IGT_TEST_DESCRIPTION("Test display plane scaling");
 
 enum scaler_combo_test_type {
@@ -728,7 +743,7 @@ static const uint64_t modifiers[] = {
 static const struct {
 	uint64_t modifier;
 	const char *name;
-} downscale_modifiers[] = {
+} scale_modifiers[] = {
 	{ DRM_FORMAT_MOD_LINEAR,	"linear" },
 	{ I915_FORMAT_MOD_X_TILED,	"x-tiled" },
 	{ I915_FORMAT_MOD_Y_TILED,	"y-tiled" },
@@ -777,41 +792,82 @@ static void yuv_src_alignment(data_t *d, uint32_t format, igt_rotation_t rot,
 	*valign = vsub;
 }
 
+static bool scale_format_wanted(data_t *d, igt_plane_t *plane,
+				uint32_t format, uint64_t modifier,
+				struct igt_vec *tested_formats)
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
+enum scale_dir {
+	SCALE_DOWN = 0,
+	SCALE_UP,
+};
+
+static const char *scale_dir_name(enum scale_dir dir)
+{
+	return dir == SCALE_DOWN ? "downscale" : "upscale";
+}
+
+static int scale_src_cap(data_t *d, enum scale_dir dir, bool scale_width,
+			 int dst_scaled, int align)
+{
+	drmModeRes *res;
+	int cap;
+
+	if (dir == SCALE_UP)
+		return ALIGN(dst_scaled, align);
+
+	res = drmModeGetResources(d->drm_fd);
+	igt_assert(res);
+	cap = ALIGN_DOWN(scale_width ? res->max_width : res->max_height, align);
+	drmModeFreeResources(res);
+
+	return cap;
+}
+
 static int
-find_max_downscale_src_size(data_t *d, igt_plane_t *plane,
-			    uint32_t format, uint64_t modifier,
-			    bool scale_width, int dst_w, int dst_h,
-			    int align)
+find_scale_src_limit(data_t *d, igt_plane_t *plane, struct igt_fb *fb,
+		     enum scale_dir dir, bool scale_width,
+		     int dst_w, int dst_h, int align, int cap)
 {
 	igt_display_t *display = &d->display;
-	struct igt_fb probe_fb = {};
-	drmModeRes *res;
 	int fixed = scale_width ? dst_h : dst_w;
 	int dst = scale_width ? dst_w : dst_h;
-	int fb_cap;
 	int lo, hi, best;
 	int ret;
 
 	igt_assert(align >= 1);
 
-	res = drmModeGetResources(display->drm_fd);
-	igt_assert(res);
-	fb_cap = ALIGN_DOWN(scale_width ? res->max_width : res->max_height, align);
-	drmModeFreeResources(res);
-
-	igt_create_fb(display->drm_fd,
-		      scale_width ? fb_cap : fixed,
-		      scale_width ? fixed : fb_cap,
-		      format, modifier, &probe_fb);
-
-	igt_plane_set_fb(plane, &probe_fb);
+	igt_plane_set_fb(plane, fb);
 	igt_plane_set_position(plane, 0, 0);
 	igt_plane_set_size(plane, dst_w, dst_h);
 
 	/* Baseline: the unscaled 1:1 source must be accepted. */
 	best = ALIGN(dst, align);
-	igt_fb_set_position(&probe_fb, plane, 0, 0);
-	igt_fb_set_size(&probe_fb, plane,
+	igt_fb_set_position(fb, plane, 0, 0);
+	igt_fb_set_size(fb, plane,
 			scale_width ? best : fixed,
 			scale_width ? fixed : best);
 	ret = igt_display_try_commit_atomic(display,
@@ -823,17 +879,25 @@ find_max_downscale_src_size(data_t *d, igt_plane_t *plane,
 			  scale_width ? best : fixed,
 			  scale_width ? fixed : best, ret);
 		igt_plane_set_fb(plane, NULL);
-		igt_remove_fb(display->drm_fd, &probe_fb);
 		return ret;
 	}
 
-	lo = best + align;
-	hi = fb_cap;
+	if (dir == SCALE_DOWN) {
+		lo = best + align;
+		hi = cap;
+	} else {
+		lo = align;
+		hi = best - align;
+	}
+
 	while (lo <= hi) {
-		int mid = ALIGN_DOWN(lo + (hi - lo) / 2, align);
+		int mid = lo + (hi - lo) / 2;
 
-		igt_fb_set_position(&probe_fb, plane, 0, 0);
-		igt_fb_set_size(&probe_fb, plane,
+		mid = (dir == SCALE_DOWN) ? ALIGN_DOWN(mid, align) :
+					    ALIGN(mid, align);
+
+		igt_fb_set_position(fb, plane, 0, 0);
+		igt_fb_set_size(fb, plane,
 				scale_width ? mid : fixed,
 				scale_width ? fixed : mid);
 
@@ -843,61 +907,40 @@ find_max_downscale_src_size(data_t *d, igt_plane_t *plane,
 						    NULL);
 		if (ret == 0) {
 			best = mid;
-			lo = mid + align;
+			if (dir == SCALE_DOWN)
+				lo = mid + align;
+			else
+				hi = mid - align;
 		} else {
-			hi = mid - align;
+			if (dir == SCALE_DOWN)
+				hi = mid - align;
+			else
+				lo = mid + align;
 		}
 	}
 
-	igt_debug("Max downscale source %s for dst %dx%d: %d (fixed axis %d)\n",
-		  scale_width ? "width" : "height", dst_w, dst_h, best, fixed);
+	igt_debug("%s limit source %s for dst %dx%d: %d (fixed axis %d)\n",
+		  scale_dir_name(dir), scale_width ? "width" : "height",
+		  dst_w, dst_h, best, fixed);
 
 	igt_plane_set_fb(plane, NULL);
-	igt_remove_fb(display->drm_fd, &probe_fb);
 
 	return best;
 }
 
-static bool downscale_format_wanted(data_t *d, igt_plane_t *plane,
-				    uint32_t format, uint64_t modifier,
-				    struct igt_vec *tested_formats)
-{
-	uint32_t reduced;
-
-	if (!igt_fb_supported_format(format))
-		return false;
-
-	if (!igt_plane_has_format_mod(plane, format, modifier))
-		return false;
-
-	if (!can_scale(d, format))
-		return false;
-
-	/* Test each format "class" only once unless --extended was given. */
-	if (!d->extended) {
-		reduced = igt_reduce_format(format);
-
-		if (igt_vec_index(tested_formats, &reduced) >= 0)
-			return false;
-
-		igt_vec_push(tested_formats, &reduced);
-	}
-
-	return true;
-}
-
 static void
-check_one_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
-			    uint32_t format, uint64_t modifier, bool scale_width)
+check_one_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
+			uint32_t format, uint64_t modifier,
+			enum scale_dir dir, bool scale_width)
 {
 	igt_display_t *display = &d->display;
 	const int band = 64;
 	igt_pipe_crc_t *pipe_crc;
 	igt_crc_t ref_crc, scaled_crc;
 	drmModeModeInfo *highres, mode;
-	struct igt_fb ref_fb = {}, src_fb = {};
+	struct igt_fb fb = {};
 	igt_plane_t *plane;
-	int dst_w, dst_h, dst_scaled, max_src;
+	int dst_w, dst_h, dst_scaled, cap, limit;
 	int halign, valign, align;
 
 	cleanup_crtc(d);
@@ -927,45 +970,55 @@ check_one_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 	dst_h = ALIGN(scale_width ? band : mode.vdisplay, valign);
 	dst_scaled = scale_width ? dst_w : dst_h;
 
-	max_src = find_max_downscale_src_size(d, plane, format, modifier,
-					      scale_width, dst_w, dst_h, align);
-	if (max_src == -ERANGE || max_src == -EINVAL || max_src <= dst_scaled) {
-		igt_skip("No %s downscaling headroom for " IGT_FORMAT_FMT
-			 " " IGT_MODIFIER_FMT " (max src %d, dst %d)\n",
+	cap = scale_src_cap(d, dir, scale_width, dst_scaled, align);
+
+	/*
+	 * One solid colour framebuffer, sized to the largest crop the search
+	 * can ask for, so every probed and committed configuration is a crop
+	 * of this exact buffer.
+	 */
+	igt_create_color_fb(display->drm_fd,
+			    scale_width ? cap : dst_w,
+			    scale_width ? dst_h : cap,
+			    format, modifier, 0.0, 1.0, 0.0, &fb);
+
+	limit = find_scale_src_limit(d, plane, &fb, dir, scale_width,
+				     dst_w, dst_h, align, cap);
+	if (limit < 0 ||
+	    (dir == SCALE_DOWN ? limit <= dst_scaled : limit >= dst_scaled)) {
+		igt_remove_fb(display->drm_fd, &fb);
+		igt_skip("No %s %s headroom for " IGT_FORMAT_FMT
+			 " " IGT_MODIFIER_FMT " (limit src %d, dst %d)\n",
 			 scale_width ? "horizontal" : "vertical",
+			 scale_dir_name(dir),
 			 IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
-			 max_src, dst_scaled);
+			 limit, dst_scaled);
 	}
 
-	igt_info("Max %s downscale for " IGT_FORMAT_FMT " " IGT_MODIFIER_FMT
-		 ": src %d -> dst %d (%.2fx, band %d, align %d)\n",
-		 scale_width ? "horizontal" : "vertical",
+	igt_info("Max %s %s for " IGT_FORMAT_FMT " " IGT_MODIFIER_FMT
+		 ": src %d -> dst %d (%.2fx)\n",
+		 scale_width ? "horizontal" : "vertical", scale_dir_name(dir),
 		 IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
-		 max_src, dst_scaled, (double)max_src / dst_scaled, band, align);
+		 limit, dst_scaled,
+		 dir == SCALE_DOWN ? (double)limit / dst_scaled :
+				     (double)dst_scaled / limit);
 
 	pipe_crc = igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
 
-	/* Reference: unscaled solid-green framebuffer of the destination size. */
-	igt_create_color_fb(display->drm_fd, dst_w, dst_h, format, modifier,
-			    0.0, 1.0, 0.0, &ref_fb);
-	igt_plane_set_fb(plane, &ref_fb);
-	igt_fb_set_position(&ref_fb, plane, 0, 0);
-	igt_fb_set_size(&ref_fb, plane, dst_w, dst_h);
+	/* Reference: unscaled crop of exactly the destination size. */
+	igt_plane_set_fb(plane, &fb);
+	igt_fb_set_position(&fb, plane, 0, 0);
+	igt_fb_set_size(&fb, plane, dst_w, dst_h);
 	igt_plane_set_position(plane, 0, 0);
 	igt_plane_set_size(plane, dst_w, dst_h);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 	igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
 
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
+	/* Test: limit sized crop scaled into the same destination rectangle. */
+	igt_fb_set_position(&fb, plane, 0, 0);
+	igt_fb_set_size(&fb, plane,
+			scale_width ? limit : dst_w,
+			scale_width ? dst_h : limit);
 	igt_plane_set_position(plane, 0, 0);
 	igt_plane_set_size(plane, dst_w, dst_h);
 	igt_display_commit2(display, COMMIT_ATOMIC);
@@ -977,15 +1030,14 @@ check_one_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 	igt_reset_fifo_underrun_reporting(display->drm_fd);
 
 	igt_pipe_crc_free(pipe_crc);
-	igt_remove_fb(display->drm_fd, &ref_fb);
-	igt_remove_fb(display->drm_fd, &src_fb);
+	igt_remove_fb(display->drm_fd, &fb);
 
 	igt_assert_crc_equal(&ref_crc, &scaled_crc);
 }
 
 static void
-test_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
-		       uint64_t modifier)
+test_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
+		   uint64_t modifier, enum scale_dir dir)
 {
 	igt_plane_t *plane;
 	struct igt_vec tested_formats;
@@ -999,8 +1051,8 @@ test_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 	for_each_plane_format(plane, format) {
 		char fname[32];
 
-		if (!downscale_format_wanted(d, plane, format, modifier,
-					     &tested_formats))
+		if (!scale_format_wanted(d, plane, format, modifier,
+					 &tested_formats))
 			continue;
 
 		format_name_lower(format, fname, sizeof(fname));
@@ -1017,9 +1069,9 @@ test_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 				      igt_crtc_name(crtc),
 				      igt_output_name(output), fname,
 				      scale_width ? "horizontal" : "vertical")
-				check_one_downscale_max_crc(d, crtc, output,
-							    format, modifier,
-							    scale_width);
+				check_one_scale_max_crc(d, crtc, output, format,
+							modifier, dir,
+							scale_width);
 		}
 	}
 
@@ -1682,7 +1734,7 @@ find_highest_res_crtc_output(data_t *d, igt_crtc_t **found_crtc,
 		return false;
 
 	igt_debug("Selected pipe %s output %s (highest mode %dx%d) for "
-		  "downscale testing\n",
+		  "max scaling testing\n",
 		  igt_crtc_name(*found_crtc), igt_output_name(*found_output),
 		  igt_output_get_highres_mode(*found_output)->hdisplay,
 		  igt_output_get_highres_mode(*found_output)->vdisplay);
@@ -1985,8 +2037,8 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 			}
 		}
 
-		for (int m = 0; m < ARRAY_SIZE(downscale_modifiers); m++) {
-			uint64_t modifier = downscale_modifiers[m].modifier;
+		for (int m = 0; m < ARRAY_SIZE(scale_modifiers); m++) {
+			uint64_t modifier = scale_modifiers[m].modifier;
 
 			igt_describe("Probe the maximum horizontal and vertical "
 				     "plane downscaling factor for each supported "
@@ -1994,7 +2046,25 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 				     "output matches an unscaled reference using "
 				     "CRCs.");
 			igt_subtest_with_dynamic_f("plane-downscale-max-crc-%s",
-						   downscale_modifiers[m].name) {
+						   scale_modifiers[m].name) {
+				igt_crtc_t *sel_crtc;
+				igt_output_t *sel_output;
+
+				igt_require(find_highest_res_crtc_output(&data,
+									 &sel_crtc,
+									 &sel_output));
+
+				test_scale_max_crc(&data, sel_crtc, sel_output,
+						   modifier, SCALE_DOWN);
+			}
+
+			igt_describe("Probe the maximum horizontal and vertical "
+				     "plane upscaling factor for each supported "
+				     "pixel format and verify the upscaled "
+				     "output matches an unscaled reference using "
+				     "CRCs.");
+			igt_subtest_with_dynamic_f("plane-upscale-max-crc-%s",
+						   scale_modifiers[m].name) {
 				igt_crtc_t *sel_crtc;
 				igt_output_t *sel_output;
 
@@ -2002,8 +2072,8 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 									 &sel_crtc,
 									 &sel_output));
 
-				test_downscale_max_crc(&data, sel_crtc,
-						       sel_output, modifier);
+				test_scale_max_crc(&data, sel_crtc, sel_output,
+						   modifier, SCALE_UP);
 			}
 		}
 	}
-- 
2.43.0

