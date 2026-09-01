Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A15CC624D3
	for <igt-dev@archiver.kernel.org>; Tue,  1 Sep 2026 17:09:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D9F10EE0A;
	Tue,  1 Sep 2026 17:09:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UxYPwqrg";
	dkim-atps=neutral
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB5C10EDF1
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2026 17:08:09 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-398b3c37877so125192a91.0
 for <igt-dev@lists.freedesktop.org>; Tue, 01 Sep 2026 10:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788282489; x=1788887289; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UzExe0t84z0ilLshP6q0g+rx7Bm4PbHdI09MPuT4Spc=;
 b=UxYPwqrghHYf7cwREeffYiAcdIMEbrFXwdZDAjflls6ngVKzDevzzoRFxNIlgans4S
 lboFI810U8aToEdRcDOrT7kVVYGqybfeFJRv/29oL22GyjPm9uz8qoXosWnhO2CbnSO3
 Fy4ps43Zy+pT5z4Z/d0tk9v/yDdnOx6H+yXFNHxO9EL8ywOCmljf1SDTGeAMKpCUo+wz
 pWTs9lCtEn0MyDO7dq9yQj7o19xb2NPWur+k8LiKv6JOg63CFWMIvr628sboaiPFcA8J
 5fwXYgGsNq5zkd6jixoqdpvHsv31oivHznbwJmNxMcRG3UZOsa32PtsMf+634jnoG2ov
 ZEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788282489; x=1788887289;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=UzExe0t84z0ilLshP6q0g+rx7Bm4PbHdI09MPuT4Spc=;
 b=k8LDE73+Iaepd3xcbALfrDf6SRQnhgnUpWP1yU2qPYUP2ACn3VlYSh9s5cp1gH22I9
 OaSNQTyEC1Iib3RwweJp60aEahET3Govmj1+J9oX8vEMvW0BZUQERkmabFI0A/l5f29l
 FZ+0oPvezEFw7X+PooxGzfMQWbFEmj5ONPFfiWOMI5Gt/hkClIT0klzsC6jVlc2GLu68
 c0SnlrKH3yeUPSafLSQEcBdyMCiQUU4HtM3dDRsIoAp/KHGAsEC7sFTg55fviUfTnv+J
 PPV9CMQCV2GSNH3KBVpbOXr5mbYzd2mhAGLq0Lazi+gurbZkLMugwKyp8HZiEJRd49KY
 +eiA==
X-Gm-Message-State: AFuF++kX6BpN6IQ0GKkCmdJjQlKL/XWv4Dm0JHzpAgQTa1x5UFmCwO2c
 oXVQed+XnTjS0rx9A3Lbuz0L1jSZVy2xx6G1Zzk7JzgD7RJDMCN+UotGkztFkzX5Pkp1pA==
X-Gm-Gg: AYBFou3gjvy94BsBotOTqGdYRZ/dWK8Rhdyt9b5awWn81Y1qrwPZTyS4wGR+J7UKd0b
 N9gS5nbh+PPISMmaQ/qH/DK+ex4DdArqTk8fwoYcuRWc51dZR3LktdKfp5Gi/h899iCgjngYs0A
 5L8gJAgKC+N2y3WESzGzjtN3xkeqt649jVCO8xZ8yrfc0tz1lPHX91IcNYlkPJ1TBTCgqkazy8+
 7QTbLe72Xfqs+Jbok92COHLkfrdolAg8MyekVmjIQDX+aVTcADf8TTdUxDd54VanockbqC4zIPq
 GfDGxNlEfsP7xYzoy8RW0bho5Q2EmhlVpij0/9Pb6lyDXeBUcu6JkbvKKXYvW38Oc4npOUun0so
 bpcETlgEJYdZOWLNrknva4LHBufTIbJD9uEdnetHw0SVbK0ZeYftemzYuJ1mdOsgRgvL8K9oR9I
 5uaqznJcfcO+dwxbP/k4Y1A/uXtYttsO78Q4Q36sEVEqZyGkbJLmu7leESdlXpEE/nw7XFmsTyC
 bnfdPey+vm98KWIuGHaLFbi
X-Received: by 2002:a17:90b:50c6:b0:38e:97f0:aa4b with SMTP id
 98e67ed59e1d1-396d1017316mr55509502a91.13.1788282488417; 
 Tue, 01 Sep 2026 10:08:08 -0700 (PDT)
Received: from localhost ([192.55.54.43]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1430e9ec9a3sm77008c88.3.2026.09.01.10.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2026 10:08:07 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 5/5] tests/kms_plane_scaling: add plane-upscale-max-crc
 subtest
Date: Tue,  1 Sep 2026 20:07:40 +0300
Message-ID: <20260901170740.1079715-5-juhapekka.heikkila@gmail.com>
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

Add the upscaling counterpart to plane-downscale-max-crc. The
destination is a thin band spanning the scaled axis and the source is
a crop of that same framebuffer, shrunk by a binary search until the
kernel stops accepting the configuration. The maximally upscaled solid
colour fill must produce the same crc as an unscaled crop of exactly
the destination size.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_plane_scaling.c | 321 ++++++++++++++++++++++++--------------
 1 file changed, 200 insertions(+), 121 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index d81ef3637..9150fe0e6 100644
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
@@ -777,41 +792,88 @@ static void yuv_src_alignment(data_t *d, uint32_t format, igt_rotation_t rot,
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
+enum scale_result {
+	SCALE_SKIP = 0,
+	SCALE_PASS,
+	SCALE_FAIL,
+};
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
@@ -823,17 +885,25 @@ find_max_downscale_src_size(data_t *d, igt_plane_t *plane,
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
+
+		mid = (dir == SCALE_DOWN) ? ALIGN_DOWN(mid, align) :
+					    ALIGN(mid, align);
 
-		igt_fb_set_position(&probe_fb, plane, 0, 0);
-		igt_fb_set_size(&probe_fb, plane,
+		igt_fb_set_position(fb, plane, 0, 0);
+		igt_fb_set_size(fb, plane,
 				scale_width ? mid : fixed,
 				scale_width ? fixed : mid);
 
@@ -843,67 +913,46 @@ find_max_downscale_src_size(data_t *d, igt_plane_t *plane,
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
 enum downscale_result {
 	DOWNSCALE_SKIP = 0,
 	DOWNSCALE_PASS,
 	DOWNSCALE_FAIL,
 };
 
-static enum downscale_result
-check_one_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
-			    uint32_t format, uint64_t modifier, bool scale_width)
+static enum scale_result
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
 	bool equal;
 
@@ -934,46 +983,56 @@ check_one_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 	dst_h = ALIGN(scale_width ? band : mode.vdisplay, valign);
 	dst_scaled = scale_width ? dst_w : dst_h;
 
-	max_src = find_max_downscale_src_size(d, plane, format, modifier,
-					      scale_width, dst_w, dst_h, align);
-	if (max_src == -ERANGE || max_src == -EINVAL || max_src <= dst_scaled) {
-		igt_debug("No %s downscaling headroom for " IGT_FORMAT_FMT
-			  " " IGT_MODIFIER_FMT " (max src %d, dst %d)\n",
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
+		igt_debug("No %s %s headroom for " IGT_FORMAT_FMT
+			  " " IGT_MODIFIER_FMT " (limit src %d, dst %d)\n",
 			  scale_width ? "horizontal" : "vertical",
+			  scale_dir_name(dir),
 			  IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
-			  max_src, dst_scaled);
-		return DOWNSCALE_SKIP;
+			  limit, dst_scaled);
+		igt_remove_fb(display->drm_fd, &fb);
+		return SCALE_SKIP;
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
@@ -987,16 +1046,15 @@ check_one_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 	equal = igt_check_crc_equal(&ref_crc, &scaled_crc);
 
 	igt_pipe_crc_free(pipe_crc);
-	igt_remove_fb(display->drm_fd, &ref_fb);
-	igt_remove_fb(display->drm_fd, &src_fb);
+	igt_remove_fb(display->drm_fd, &fb);
 
 	/* --skip-crc-compare forces a pass, matching igt_assert_crc_equal(). */
-	return (equal || igt_skip_crc_compare) ? DOWNSCALE_PASS : DOWNSCALE_FAIL;
+	return (equal || igt_skip_crc_compare) ? SCALE_PASS : SCALE_FAIL;
 }
 
 static void
-test_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
-		       uint64_t modifier)
+test_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
+		   uint64_t modifier, enum scale_dir dir)
 {
 	igt_plane_t *plane;
 	struct igt_vec tested_formats;
@@ -1011,45 +1069,45 @@ test_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 	for_each_plane_format(plane, format) {
 		char fname[32];
 
-		if (!downscale_format_wanted(d, plane, format, modifier,
-					     &tested_formats))
+		if (!scale_format_wanted(d, plane, format, modifier,
+					 &tested_formats))
 			continue;
 
 		format_name_lower(format, fname, sizeof(fname));
 
 		for (int axis = 0; axis < 2; axis++) {
 			bool scale_width = (axis == 0);
-			enum downscale_result r;
+			const char *axis_name = scale_width ? "horizontal" :
+							      "vertical";
+			enum scale_result r;
 
-			igt_debug("Testing %s downscale of format %s ("
+			igt_debug("Testing %s %s of format %s ("
 				  IGT_FORMAT_FMT ") modifier " IGT_MODIFIER_FMT
 				  " on pipe %s output %s\n",
-				  scale_width ? "horizontal" : "vertical",
-				  fname, IGT_FORMAT_ARGS(format),
+				  axis_name, scale_dir_name(dir), fname,
+				  IGT_FORMAT_ARGS(format),
 				  IGT_MODIFIER_ARGS(modifier),
 				  igt_crtc_name(crtc), igt_output_name(output));
 
-			r = check_one_downscale_max_crc(d, crtc, output, format,
-							modifier, scale_width);
-			if (r == DOWNSCALE_SKIP) {
-				igt_debug("Skipped %s downscale of format %s\n",
-					  scale_width ? "horizontal" : "vertical",
-					  fname);
+			r = check_one_scale_max_crc(d, crtc, output, format,
+						    modifier, dir, scale_width);
+			if (r == SCALE_SKIP) {
+				igt_debug("Skipped %s %s of format %s\n",
+					  axis_name, scale_dir_name(dir), fname);
 				continue;
 			}
 
 			tested++;
-			if (r == DOWNSCALE_PASS) {
+			if (r == SCALE_PASS) {
 				passed++;
-				igt_debug("Passed %s downscale of format %s\n",
-					  scale_width ? "horizontal" : "vertical",
-					  fname);
+				igt_debug("Passed %s %s of format %s\n",
+					  axis_name, scale_dir_name(dir), fname);
 			} else {
 				failed++;
-				igt_critical("CRC mismatch on %s downscale of "
+				igt_critical("CRC mismatch on %s %s of "
 					     "format %s (" IGT_FORMAT_FMT ") "
 					     "modifier " IGT_MODIFIER_FMT "\n",
-					     scale_width ? "horizontal" : "vertical",
+					     axis_name, scale_dir_name(dir),
 					     fname, IGT_FORMAT_ARGS(format),
 					     IGT_MODIFIER_ARGS(modifier));
 			}
@@ -1059,11 +1117,9 @@ test_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 	igt_vec_fini(&tested_formats);
 
 	igt_require_f(tested > 0,
-		      "No format had downscaling headroom for modifier "
-		      IGT_MODIFIER_FMT "\n", IGT_MODIFIER_ARGS(modifier));
-
-	igt_info("Downscale CRC sweep: %d passed, %d failed of %d format/axis "
-		 "combinations\n", passed, failed, tested);
+		      "No format had %s headroom for modifier "
+		      IGT_MODIFIER_FMT "\n", scale_dir_name(dir),
+		      IGT_MODIFIER_ARGS(modifier));
 
 	igt_assert_f(failed == 0,
 		     "%d of %d format/axis combinations failed CRC\n",
@@ -2049,8 +2105,31 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 				igt_dynamic_f("pipe-%s-%s",
 					      igt_crtc_name(sel_crtc),
 					      igt_output_name(sel_output))
-					test_downscale_max_crc(&data, sel_crtc,
-							       sel_output, modifier);
+					test_scale_max_crc(&data, sel_crtc,
+							   sel_output, modifier,
+							   SCALE_DOWN);
+			}
+
+			igt_describe("Probe the maximum horizontal and vertical "
+				     "plane upscaling factor for each supported "
+				     "pixel format and verify the upscaled "
+				     "output matches an unscaled reference using "
+				     "CRCs.");
+			igt_subtest_with_dynamic_f("plane-upscale-max-crc-%s",
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
+					test_scale_max_crc(&data, sel_crtc,
+							   sel_output, modifier,
+							   SCALE_UP);
 			}
 		}
 	}
-- 
2.43.0

