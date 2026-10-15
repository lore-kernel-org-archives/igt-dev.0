Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8162ACC6B33
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 13:20:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC3810EBCD;
	Thu, 15 Oct 2026 13:20:05 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1096110E8C2
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 13:16:55 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-3a8adb68d8bso3805740a91.1
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 06:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792070214; x=1792675014; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jMxoM74LfiVRCxFhDcLrKx1L07O2tM7UIea6YomqwS4=;
 b=W/Dfl8PWdC59XCYdoRxm/o6NAngy6h+b/5KeR09blWHSZm7+n0JgI3OAS/Q95Flu0M
 DfLaGTBBqw5dA0AD7AlSTOl2lFb6gnCPNRkUen00qrvov5+sG3bOO3ZtB2pG0C+6n9q+
 Xan2fEqq1Fm3lS9XSfik9zauc/1i0MWpxnI7WtIV2R/3r9writiPnZzVUQvYpMXHX24/
 BqpdiVKqO4tYE/pFwaNSDX98t1Bq2zHhBOX7QHjqCOuTd9G/tMR+0qX2rs5JN4hexitF
 q8aVUo8tpMj6M3dYo160sAa2rQJ60uAJKK9V4c0OKHpnenCtEjURFdXuKUu0wLqTHyDp
 rFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792070214; x=1792675014;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=jMxoM74LfiVRCxFhDcLrKx1L07O2tM7UIea6YomqwS4=;
 b=GLNg4QCT5OVjjfnnJYVOMgGls30yHNzqw42d6HI5bVdvR4iUYV9Miiux4kMiIy5NHX
 Nq7OSwnQ40i1cJ8DQ6SqGBneexzL1B5XTtGIoCo/5P/pCCqaJG0GHwEpP19QBlJvSD/u
 tn8UypQsd8ZozFSVmVgS9q7Smmv3dy3625qEQ1o6q35TVIdsJRijNbeTPnzU6rMPXmd3
 BVD/Xn4IdJ1RkSol8BTaDwdIgktl3E2pU7VayIsi07KXlwv8M2S79gP+3KTHIOcgPDLP
 Xf6laLhvn4NOuw4v0sIoCYy15l0Fqw2TdXktlM4H3issrItxB7fI6kd8laGosA9cHqzE
 2hkg==
X-Gm-Message-State: AFq9FYJEyv6l1hZShGRUp5qco42JrPyAoUuir3tN0UUJYx07863yehhO
 HDGC/NQdwV1VyEz50fIDuWYZCL0vc0wD2w6vnwXmikxIAqhyhvDNiScNWuYXaw==
X-Gm-Gg: AYBFou0qxbMUFgOdVP1pd4kbJg8d66L7JB6VzeD+K1seaEXn2ivkCC/esuhniHOi5FD
 XbYyztMF3eP7UYpHoLRShi8dn8DoZZazd7N2k/aI+8WihT+2GcWbu9N9CcHdSTBpNps+40HN14x
 csbxZ7rMbvoBkSkTsROLV/N2gLLZnk+TZkJSjPD7Ep45rg1qXIT+dHuRc+g5bTbHLR3whf/oiau
 VcUcYU7AS/cRV0ca6HOb9JDPWPkRnfYkTz8IRwtncW6QAA3gbJ7LZD4eFc96zpli0vteWm/RqBA
 K+y6YngX/J6Lc8FflRNKQQvk1Mz48ucBpaGAIS98QnbB7hbgks0QZOg+T19CMfhZ7yW/KaxI7Zt
 mvWSP9gDWFBo1z3ysOJBguoywzl5pOYW6qQMTJT3M77AxNN5pxfvK2pveCGv+U1yINgL3hSx1rP
 QasZY71iRjzhaxqGFm1Hw7NvsGLBs14oAdCziFLTW/0nZuzyzMTq/9LQ2ogdjH3Dn4+Qe7YmJre
 /XpfnmnIon9Y7mF/q5suA3Xb2IB6ZYZwgXl5w==
X-Received: by 2002:a17:90a:2ca6:b0:3ac:8897:7ba9 with SMTP id
 98e67ed59e1d1-3ac88978367mr2419527a91.56.1792070214351; 
 Thu, 15 Oct 2026 06:16:54 -0700 (PDT)
Received: from localhost ([134.134.137.74]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3ac94798212sm4554266a91.14.2026.10.15.06.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 06:16:53 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 5/9] tests/kms_plane_scaling: add plane-upscale-max-crc
 subtest
Date: Thu, 15 Oct 2026 16:16:12 +0300
Message-ID: <20261015131616.3172918-5-juhapekka.heikkila@gmail.com>
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

Add the upscaling counterpart to plane-downscale-max-crc. The
destination is a thin band spanning the scaled axis and the source is
a crop of that same framebuffer, shrunk by a binary search until the
kernel stops accepting the configuration. The maximally upscaled solid
colour fill must produce the same crc as an unscaled crop of exactly
the destination size.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_plane_scaling.c | 291 +++++++++++++++++++++++---------------
 1 file changed, 178 insertions(+), 113 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 3b187220f..4118f0dd1 100644
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
+
+		mid = (dir == SCALE_DOWN) ? ALIGN_DOWN(mid, align) :
+					    ALIGN(mid, align);
 
-		igt_fb_set_position(&probe_fb, plane, 0, 0);
-		igt_fb_set_size(&probe_fb, plane,
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
@@ -917,13 +959,14 @@ static void set_legacy_lut(data_t *data, igt_crtc_t *crtc,
 struct scale_axis {
 	const char *name;
 	bool scale_width;
+	struct igt_fb fb;
 	int dst_w, dst_h, dst_scaled, limit;
 	bool tested, failed;
 };
 
 static void
-check_one_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
-			    uint32_t format, uint64_t modifier)
+check_one_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
+			uint32_t format, uint64_t modifier, enum scale_dir dir)
 {
 	igt_display_t *display = &d->display;
 	const int band = 64;
@@ -968,6 +1011,8 @@ check_one_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 	/* Search both axes first so the CRC phase only commits known limits. */
 	for (int i = 0; i < ARRAY_SIZE(axes); i++) {
 		struct scale_axis *a = &axes[i];
+		int align = a->scale_width ? halign : valign;
+		int cap;
 		size_t used;
 
 		/* dst is a thin band spanning the whole scaled axis */
@@ -975,16 +1020,25 @@ check_one_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 		a->dst_h = ALIGN(a->scale_width ? band : mode.vdisplay, valign);
 		a->dst_scaled = a->scale_width ? a->dst_w : a->dst_h;
 
-		a->limit = find_max_downscale_src_size(d, plane, format,
-						       modifier,
-						       a->scale_width,
-						       a->dst_w, a->dst_h,
-						       a->scale_width ?
-						       halign : valign);
-		if (a->limit < 0 || a->limit <= a->dst_scaled) {
-			igt_debug("No %s downscaling headroom "
-				  "(max src %d, dst %d)\n",
-				  a->name, a->limit, a->dst_scaled);
+		cap = scale_src_cap(d, dir, a->scale_width, a->dst_scaled,
+				    align);
+
+		/* Every probed and committed source is a crop of this fb. */
+		igt_create_color_fb(display->drm_fd,
+				    a->scale_width ? cap : a->dst_w,
+				    a->scale_width ? a->dst_h : cap,
+				    format, modifier, 0.0, 1.0, 0.0, &a->fb);
+
+		a->limit = find_scale_src_limit(d, plane, &a->fb, dir,
+						a->scale_width, a->dst_w,
+						a->dst_h, align, cap);
+		if (a->limit < 0 ||
+		    (dir == SCALE_DOWN ? a->limit <= a->dst_scaled :
+					 a->limit >= a->dst_scaled)) {
+			igt_debug("No %s %s headroom (limit src %d, dst %d)\n",
+				  a->name, scale_dir_name(dir),
+				  a->limit, a->dst_scaled);
+			igt_remove_fb(display->drm_fd, &a->fb);
 			continue;
 		}
 
@@ -995,85 +1049,78 @@ check_one_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 		snprintf(limits + used, sizeof(limits) - used,
 			 "%s%s src %d -> dst %d (%.2fx)", used ? ", " : "",
 			 a->name, a->limit, a->dst_scaled,
-			 (double)a->limit / a->dst_scaled);
+			 dir == SCALE_DOWN ?
+			 (double)a->limit / a->dst_scaled :
+			 (double)a->dst_scaled / a->limit);
 	}
 
 	if (!any_tested) {
 		if (mask_lut)
 			set_legacy_lut(d, crtc, 0xffff);
-		igt_skip("No downscaling headroom on either axis for "
-			 IGT_FORMAT_FMT " " IGT_MODIFIER_FMT "\n",
+		igt_skip("No %s headroom on either axis for " IGT_FORMAT_FMT
+			 " " IGT_MODIFIER_FMT "\n", scale_dir_name(dir),
 			 IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier));
 	}
 
-	igt_info("Max downscale for " IGT_FORMAT_FMT " " IGT_MODIFIER_FMT
-		 ": %s\n", IGT_FORMAT_ARGS(format),
+	igt_info("Max %s for " IGT_FORMAT_FMT " " IGT_MODIFIER_FMT ": %s\n",
+		 scale_dir_name(dir), IGT_FORMAT_ARGS(format),
 		 IGT_MODIFIER_ARGS(modifier), limits);
 
 	pipe_crc = igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
 
 	for (int i = 0; i < ARRAY_SIZE(axes); i++) {
 		struct scale_axis *a = &axes[i];
-		struct igt_fb ref_fb = {}, src_fb = {};
 
 		if (!a->tested)
 			continue;
 
-		/* Reference: unscaled solid-green fb of the dst size. */
-		igt_create_color_fb(display->drm_fd, a->dst_w, a->dst_h,
-				    format, modifier, 0.0, 1.0, 0.0, &ref_fb);
-		igt_plane_set_fb(plane, &ref_fb);
-		igt_fb_set_position(&ref_fb, plane, 0, 0);
-		igt_fb_set_size(&ref_fb, plane, a->dst_w, a->dst_h);
+		/* Reference: unscaled crop of exactly the destination size. */
+		igt_plane_set_fb(plane, &a->fb);
+		igt_fb_set_position(&a->fb, plane, 0, 0);
+		igt_fb_set_size(&a->fb, plane, a->dst_w, a->dst_h);
 		igt_plane_set_position(plane, 0, 0);
 		igt_plane_set_size(plane, a->dst_w, a->dst_h);
 		igt_display_commit2(display, COMMIT_ATOMIC);
 		igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
 
-		/* Test: larger solid-green source downscaled into dst. */
-		igt_create_color_fb(display->drm_fd,
-				    a->scale_width ? a->limit : a->dst_w,
-				    a->scale_width ? a->dst_h : a->limit,
-				    format, modifier, 0.0, 1.0, 0.0, &src_fb);
-		igt_plane_set_fb(plane, &src_fb);
-		igt_fb_set_position(&src_fb, plane, 0, 0);
-		igt_fb_set_size(&src_fb, plane,
+		/* Test: limit sized crop scaled into the same rectangle. */
+		igt_fb_set_position(&a->fb, plane, 0, 0);
+		igt_fb_set_size(&a->fb, plane,
 				a->scale_width ? a->limit : a->dst_w,
 				a->scale_width ? a->dst_h : a->limit);
-		igt_plane_set_position(plane, 0, 0);
-		igt_plane_set_size(plane, a->dst_w, a->dst_h);
 		igt_display_commit2(display, COMMIT_ATOMIC);
 		igt_pipe_crc_collect_crc(pipe_crc, &scaled_crc);
 
-		igt_plane_set_fb(plane, NULL);
-		igt_remove_fb(display->drm_fd, &ref_fb);
-		igt_remove_fb(display->drm_fd, &src_fb);
-
 		a->failed = !igt_check_crc_equal(&ref_crc, &scaled_crc);
 		if (a->failed)
-			igt_critical("CRC mismatch on %s downscale\n", a->name);
+			igt_critical("CRC mismatch on %s %s\n",
+				     a->name, scale_dir_name(dir));
 	}
 
+	igt_plane_set_fb(plane, NULL);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 
 	igt_reset_fifo_underrun_reporting(display->drm_fd);
 
 	igt_pipe_crc_free(pipe_crc);
+	for (int i = 0; i < ARRAY_SIZE(axes); i++)
+		igt_remove_fb(display->drm_fd, &axes[i].fb);
 
 	if (mask_lut)
 		set_legacy_lut(d, crtc, 0xffff);
 
 	igt_assert_f(!(axes[0].failed || axes[1].failed) ||
 		     igt_skip_crc_compare,
-		     "%s%s%s downscale CRC mismatch\n",
+		     "%s%s%s %s CRC mismatch\n",
 		     axes[0].failed ? axes[0].name : "",
 		     axes[0].failed && axes[1].failed ? " and " : "",
-		     axes[1].failed ? axes[1].name : "");
+		     axes[1].failed ? axes[1].name : "",
+		     scale_dir_name(dir));
 }
 
 static void
-test_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
-		       uint64_t modifier)
+test_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
+		   uint64_t modifier, enum scale_dir dir)
 {
 	igt_plane_t *plane;
 	struct igt_vec tested_formats;
@@ -1087,8 +1134,8 @@ test_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 	for_each_plane_format(plane, format) {
 		char fname[32];
 
-		if (!downscale_format_wanted(d, plane, format, modifier,
-					     &tested_formats))
+		if (!scale_format_wanted(d, plane, format, modifier,
+					 &tested_formats))
 			continue;
 
 		format_name_lower(format, fname, sizeof(fname));
@@ -1096,8 +1143,8 @@ test_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 		/* Per-format dynamics keep dmesg within the log budget. */
 		igt_dynamic_f("pipe-%s-%s-%s", igt_crtc_name(crtc),
 			      igt_output_name(output), fname)
-			check_one_downscale_max_crc(d, crtc, output, format,
-						    modifier);
+			check_one_scale_max_crc(d, crtc, output, format,
+						modifier, dir);
 	}
 
 	igt_vec_fini(&tested_formats);
@@ -1756,7 +1803,7 @@ find_native_res_crtc_output(data_t *d, igt_crtc_t **found_crtc,
 		return false;
 
 	igt_debug("Selected pipe %s output %s (native mode %dx%d) for "
-		  "downscale testing\n",
+		  "max scaling testing\n",
 		  igt_crtc_name(*found_crtc), igt_output_name(*found_output),
 		  (*found_output)->config.default_mode.hdisplay,
 		  (*found_output)->config.default_mode.vdisplay);
@@ -2059,8 +2106,8 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 			}
 		}
 
-		for (int m = 0; m < ARRAY_SIZE(downscale_modifiers); m++) {
-			uint64_t modifier = downscale_modifiers[m].modifier;
+		for (int m = 0; m < ARRAY_SIZE(scale_modifiers); m++) {
+			uint64_t modifier = scale_modifiers[m].modifier;
 
 			igt_describe("Probe the maximum horizontal and vertical "
 				     "plane downscaling factor for each supported "
@@ -2068,7 +2115,25 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
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
 
@@ -2076,8 +2141,8 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
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

