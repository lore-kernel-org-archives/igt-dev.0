Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8001CA601E
	for <igt-dev@archiver.kernel.org>; Fri,  9 Oct 2026 16:39:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A7ED10EA56;
	Fri,  9 Oct 2026 16:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="sCTNvEcI";
	dkim-atps=neutral
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5854210E192
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Oct 2026 16:38:01 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-886e61fa30fso1981242b3a.1
 for <igt-dev@lists.freedesktop.org>; Fri, 09 Oct 2026 09:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791563881; x=1792168681; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=z1Yj9lR2Owrsf3lumIwQ5j78b6rIPQx2NSXCzsNyDeQ=;
 b=sCTNvEcIHw0zEBDJ5o0Lg+BdEXvSjzdWH0Y9L8scdu3mAUW2L3fI7QOSYAfzKsGWG2
 gbRIoZ59sZMfyDJirKDjvcSTVjCz2PzGuU1Sh53kDLNUzZ5tCmfq1JtD+l/ku3O0WVIz
 Ily5EsrxpKwvMLvYmkCRLLdp8VHZfPDc/ZM9WvCx1bUSBKMSJlt0v6ioLre9Wp77G8Hh
 Ylj+HmMZCmsM54+T9xvUE910E7G8bdUtA7Flcfg0CCa+gLedB9j9o4MK6ekPKhiT4XgR
 8o55hNB/e/eRgqyUeDCvaGM82GcQtCdfEUjX8zUR/59+x9rSGAKmcNXxXlCEE9/6IMqM
 ENJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791563881; x=1792168681;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=z1Yj9lR2Owrsf3lumIwQ5j78b6rIPQx2NSXCzsNyDeQ=;
 b=s1aKs3rOs7jqWSxts8tDr/UFEDilRHAttL3CU66R+E+UmAHzkmQmdRCT0jS7+V0n1x
 QVQcoo0MO0XFbquyPobj6XWICn4GETcgU9zagK2gBvp1IOH8A+q9g/NJ7O3/34uoQ/Mb
 hva4dQjIoGmPtFTm+M6BWzPkuW+D9UySUNlcGKeuAYUMy1D296A57EonTEyRn8AYWHbs
 wJsqml/gFwCQRyGFpNykdOGARq1+sAc7unaw+CoRWCza7zAzC6YScWuMyPi9gXLq62yU
 z7jCGfXcnwH6du3jkWb9Dilfds4lZHGJkt6hkaPhKe7eAp5+lHc2mXQ6COjCsgiClJGn
 oByQ==
X-Gm-Message-State: AFq9FYJsO8at2S+JPPnukF7n29LK55bAFJFQBZHqN07UJD+9KKXcz+bE
 LcJLI0rDh5OOoBIPfEZliXvgodPBG0XdnNVeTd0b4Vtnq1altl1gSZFyEsA1edMH0ok=
X-Gm-Gg: AYBFou3V2IcHyMgx7uTX3DUee7OKHKyBm3vdGAJGH1DApv326iIeePOiapi/ALss7ec
 GfOQosthKQbDJUbi6sZSZ3g2bB8CF7IujAuA89sA4eRvhZTFTGniyANA2S2ORn2GVKu0LEESUkD
 q7OU1OeWnVjorMSorQZGKyr4kU7j//I+Xv9aVHVkZDRk3C7QnwsjXIiJef2hm7d4VSINJjqKbBs
 UIv+gGR14gKvU81zCipQwv19kJydNHV0A1yF7L0N/uaAaUUE2XQanRFK8tRJ6od5A73bSTYVwEs
 f6yHc0LGzWC8JhOFUf+WyQ9qNgWqKkzAtbUB5425134q9lAV/PG8m44pNNQcEHgdV4CiPe49LIa
 zTopPhNUNqTEYogcXKsKx28V4odfQcVYsT5wseCFWLiCXMsEIDC/a/zxHjMhXCY2uOgCu9xiBxj
 xSKRt+DFqaen6dD7ZnCbuBfqTmxZfXuGFdjwg401ibEvYCt2KfAMJiKy+l7zQj1FDhpS/m/NYq5
 IbHN9dBp7O3GHCdp03WiKaB/r6eCvPuS+te
X-Received: by 2002:a05:6a00:4b49:b0:880:dfaa:a6d5 with SMTP id
 d2e1a72fcca58-897c72f63a6mr2053576b3a.33.1791563880591; 
 Fri, 09 Oct 2026 09:38:00 -0700 (PDT)
Received: from localhost ([134.134.137.72]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-897fb87c459sm1060213b3a.50.2026.10.09.09.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2026 09:38:00 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 5/5] tests/kms_plane_scaling: add plane-upscale-max-crc
 subtest
Date: Fri,  9 Oct 2026 19:37:14 +0300
Message-ID: <20261009163714.3809917-5-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009163714.3809917-1-juhapekka.heikkila@gmail.com>
References: <20261009163714.3809917-1-juhapekka.heikkila@gmail.com>
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
index 00822e2a6..14c3c4de3 100644
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
 	drmModeModeInfo mode;
-	struct igt_fb ref_fb = {}, src_fb = {};
+	struct igt_fb fb = {};
 	igt_plane_t *plane;
-	int dst_w, dst_h, dst_scaled, max_src;
+	int dst_w, dst_h, dst_scaled, cap, limit;
 	int halign, valign, align;
 
 	cleanup_crtc(d);
@@ -926,45 +969,55 @@ check_one_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
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
@@ -976,15 +1029,14 @@ check_one_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
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
@@ -998,8 +1050,8 @@ test_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 	for_each_plane_format(plane, format) {
 		char fname[32];
 
-		if (!downscale_format_wanted(d, plane, format, modifier,
-					     &tested_formats))
+		if (!scale_format_wanted(d, plane, format, modifier,
+					 &tested_formats))
 			continue;
 
 		format_name_lower(format, fname, sizeof(fname));
@@ -1016,9 +1068,9 @@ test_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
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
 
@@ -1678,7 +1730,7 @@ find_native_res_crtc_output(data_t *d, igt_crtc_t **found_crtc,
 		return false;
 
 	igt_debug("Selected pipe %s output %s (native mode %dx%d) for "
-		  "downscale testing\n",
+		  "max scaling testing\n",
 		  igt_crtc_name(*found_crtc), igt_output_name(*found_output),
 		  (*found_output)->config.default_mode.hdisplay,
 		  (*found_output)->config.default_mode.vdisplay);
@@ -1981,8 +2033,8 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 			}
 		}
 
-		for (int m = 0; m < ARRAY_SIZE(downscale_modifiers); m++) {
-			uint64_t modifier = downscale_modifiers[m].modifier;
+		for (int m = 0; m < ARRAY_SIZE(scale_modifiers); m++) {
+			uint64_t modifier = scale_modifiers[m].modifier;
 
 			igt_describe("Probe the maximum horizontal and vertical "
 				     "plane downscaling factor for each supported "
@@ -1990,7 +2042,25 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
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
 
@@ -1998,8 +2068,8 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
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

