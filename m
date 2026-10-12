Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A21CA9ED0
	for <igt-dev@archiver.kernel.org>; Mon, 12 Oct 2026 12:33:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F23210EA7D;
	Mon, 12 Oct 2026 12:33:02 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60FA710F088
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Oct 2026 12:30:06 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-3ab33730821so980752a91.3
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Oct 2026 05:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791808206; x=1792413006; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=aTn8aplVpGBY7aSOdP3Vyk+wdrCKSngpiM3Bz3CIcMM=;
 b=oMsrHmcaBfTSM1WnzVXQLz0zzSB58xo21JDp0hL80FXOqtbEwj7LAg/sTI+hujP+qZ
 ZzZAuDzP5D+IxQu8uyHBXfS63igOvG1TSB9q4DzTj7YWgU2ovu/QNhAmf09ca3ScoLIO
 C/vuOp2zAMisNYFZrllVYIPdbxBal0C7HMIeM6+FAKP3kjAtmrUH5G1lA2csf1GKOHhw
 pUdAnJukEzORUp16tDU+ADMDqzvVMzhenzNEbxhFyqIbqINTyHanP+7/4e9ba3XjFd8z
 zOMMkax1RMV9nav+J+tXjFwRyQGPfy1kIt5uoAuv1iqGs1NoDSr75sm8+bvvc3weuTyV
 sdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791808206; x=1792413006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=aTn8aplVpGBY7aSOdP3Vyk+wdrCKSngpiM3Bz3CIcMM=;
 b=fcPOxXrBaGO1YByp9iv6tyrRv09StpQSD31o0/hCUyYwO1dEf1RuAUWIt48XAB2sEU
 SbreLnP3vVCkiQ9akn3KLbiNSz9qhTl7nmQvFghYtfc1uZdsUfioofk4VLhry8hEFvsk
 ppA/BYSDiKZmpXpNVDSXtIGoziDrhyajKUaVzzttwRmlKXR8kz6rL1tlf4d3/9KlHEcT
 /8p4AEj/3chqK/yto+wVFxx2ZuDri4lFQC0udvI0Z+462zgQhrBAK97vRrggTW2IC43l
 nJKwsKA/DVsTjnSQckDWRTHkpPm2NK227wb5uwxgV7nKtIcAcF5UwWO2VJ42Z3EDPIJE
 YZlg==
X-Gm-Message-State: AFq9FYIh1FEOtC47CPP9VjLSUNSdd1MbAt5Xee95z15skWCAjrisBPtZ
 XtM5YqoVrr4qJXUc17PPsBWgxaRDFgEV8u9jyZ8HEcx9VADuGekF7VgLnClwEO+lyzs=
X-Gm-Gg: AYBFou3Gx3qoKXyWHL+/wt/Cq1OqtNzG7hs4u3Wvs5kyUiI9RSdFbpg2LFA/g8z/iJi
 BZDGN+7iIseIGYXLn4Pn9LQwN6Y0dRuuL6ucueGb7HQ9MCKnaedkXyNmka0JvXLg63hts6BOk8A
 A9y4lVf6ei4NWiMw7h5tcDEdOjlf0/h3F37URJ/9sf9AN/SqnVi0z3XEphoVZEnAOkdrL/+uUNE
 a+HCE9HT90+G71Ew/mDsR7a+LoeWHU8rNLSsFI3OV/CUtJfmhVkXvmNEttHVgp6j3fUGnSkU/NC
 GfcS7RQgIZqMNoS8KTLubEUqSC9Kb3pX5og6rR52HP4Y+BxAO+oy7rg/yatrGj8NY30Q0gniHdC
 YaOlbddCsrODBtwVx06C+GfAfTrcAhnlIpqBC8K276XOvkfqwjxP4Y0DsYIuEMu6FYJKL+t9hso
 Hz+BDAnjmzkFyESJJ7TZ7qMCisHsmKVeUh/WxeSBHT/bRpdaTYfGXXofHKa3IpH1ubGMel/I2JQ
 /JcS+pdnI+3k3fmDXPweExy8ihPJL671ZWsLw==
X-Received: by 2002:a17:90b:4b09:b0:3a8:c0cd:57f9 with SMTP id
 98e67ed59e1d1-3ab3a747cefmr7474500a91.25.1791808205565; 
 Mon, 12 Oct 2026 05:30:05 -0700 (PDT)
Received: from localhost ([134.134.139.73]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3abe588fa31sm6091165a91.14.2026.10.12.05.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 05:30:05 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 5/5] tests/kms_plane_scaling: add plane-upscale-max-crc
 subtest
Date: Mon, 12 Oct 2026 15:29:39 +0300
Message-ID: <20261012122939.233749-5-juhapekka.heikkila@gmail.com>
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
index 5511dab0a..33a57fbd5 100644
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
 
@@ -843,49 +907,27 @@ find_max_downscale_src_size(data_t *d, igt_plane_t *plane,
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
 #define LUT_MASK 0xf800
 
 static void set_legacy_lut(data_t *data, igt_crtc_t *crtc,
@@ -915,17 +957,18 @@ static void set_legacy_lut(data_t *data, igt_crtc_t *crtc,
 }
 
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
 	drmModeModeInfo mode;
-	struct igt_fb ref_fb = {}, src_fb = {};
+	struct igt_fb fb = {};
 	igt_plane_t *plane;
-	int dst_w, dst_h, dst_scaled, max_src;
+	int dst_w, dst_h, dst_scaled, cap, limit;
 	int halign, valign, align;
 	/* Pre-ver14 scalers round planar YUV differently from 1:1. */
 	bool mask_lut = is_intel_device(d->drm_fd) &&
@@ -960,47 +1003,57 @@ check_one_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 	dst_h = ALIGN(scale_width ? band : mode.vdisplay, valign);
 	dst_scaled = scale_width ? dst_w : dst_h;
 
-	max_src = find_max_downscale_src_size(d, plane, format, modifier,
-					      scale_width, dst_w, dst_h, align);
-	if (max_src == -ERANGE || max_src == -EINVAL || max_src <= dst_scaled) {
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
 		if (mask_lut)
 			set_legacy_lut(d, crtc, 0xffff);
-		igt_skip("No %s downscaling headroom for " IGT_FORMAT_FMT
-			 " " IGT_MODIFIER_FMT " (max src %d, dst %d)\n",
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
@@ -1012,8 +1065,7 @@ check_one_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 	igt_reset_fifo_underrun_reporting(display->drm_fd);
 
 	igt_pipe_crc_free(pipe_crc);
-	igt_remove_fb(display->drm_fd, &ref_fb);
-	igt_remove_fb(display->drm_fd, &src_fb);
+	igt_remove_fb(display->drm_fd, &fb);
 
 	if (mask_lut)
 		set_legacy_lut(d, crtc, 0xffff);
@@ -1022,8 +1074,8 @@ check_one_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 }
 
 static void
-test_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
-		       uint64_t modifier)
+test_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
+		   uint64_t modifier, enum scale_dir dir)
 {
 	igt_plane_t *plane;
 	struct igt_vec tested_formats;
@@ -1037,8 +1089,8 @@ test_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 	for_each_plane_format(plane, format) {
 		char fname[32];
 
-		if (!downscale_format_wanted(d, plane, format, modifier,
-					     &tested_formats))
+		if (!scale_format_wanted(d, plane, format, modifier,
+					 &tested_formats))
 			continue;
 
 		format_name_lower(format, fname, sizeof(fname));
@@ -1055,9 +1107,9 @@ test_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
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
 
@@ -1717,7 +1769,7 @@ find_native_res_crtc_output(data_t *d, igt_crtc_t **found_crtc,
 		return false;
 
 	igt_debug("Selected pipe %s output %s (native mode %dx%d) for "
-		  "downscale testing\n",
+		  "max scaling testing\n",
 		  igt_crtc_name(*found_crtc), igt_output_name(*found_output),
 		  (*found_output)->config.default_mode.hdisplay,
 		  (*found_output)->config.default_mode.vdisplay);
@@ -2020,8 +2072,8 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 			}
 		}
 
-		for (int m = 0; m < ARRAY_SIZE(downscale_modifiers); m++) {
-			uint64_t modifier = downscale_modifiers[m].modifier;
+		for (int m = 0; m < ARRAY_SIZE(scale_modifiers); m++) {
+			uint64_t modifier = scale_modifiers[m].modifier;
 
 			igt_describe("Probe the maximum horizontal and vertical "
 				     "plane downscaling factor for each supported "
@@ -2029,7 +2081,25 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 				     "output matches an unscaled reference using "
 				     "CRCs.");
 			igt_subtest_with_dynamic_f("plane-downscale-max-crc-%s",
-						   downscale_modifiers[m].name) {
+						   scale_modifiers[m].name) {
+				igt_crtc_t *sel_crtc;
+				igt_output_t *sel_output;
+
+				igt_require(find_native_res_crtc_output(&data,
+									&sel_crtc,
+									&sel_output));
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
 
@@ -2037,8 +2107,8 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
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

