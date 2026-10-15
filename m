Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316A9CC6B33
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 13:25:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C711D10EBCD;
	Thu, 15 Oct 2026 13:25:05 +0000 (UTC)
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE54D10E168
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 13:17:06 +0000 (UTC)
Received: by mail-dl1-f46.google.com with SMTP id
 a92af1059eb24-17bc533fda3so2201800c88.1
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 06:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792070226; x=1792675026; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9vQTkbo4C9jq9CH9lFMQXifHp5Ly/ssKCcic7sY+KZc=;
 b=aQGYNdXQCt9j1dJ/vOHBa99vFdLcXcRmQJKEyVpURzAsI9QDSBVSSk2avmZfiaPXdi
 FLGDXTbzpQVsb+5f+tPHx8QPT6iVESe2hw2HLArbLB0rDiRSafmQgZUacUidec916Agm
 zPTUxASi3sfJH42uCQVz0mmtFKs8DN5zqDkrvP//7CKXg4TkCmo0/TzFGJNsMbHyakmi
 YKtu1b1bDO+ONqNomP7CPTOfpknDnHu3W7RFeAAbUJ6qvyG0aGjEqh0FZ4EvNTY26hNW
 749+DMpyeDnq5Ktv9830b6hYl1+6UMpnVLKRhtMePTuSFw3vTzKkw+Ezf7dtFCxeaT7F
 O81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792070226; x=1792675026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9vQTkbo4C9jq9CH9lFMQXifHp5Ly/ssKCcic7sY+KZc=;
 b=aLBEdGVks3XuzMN6uAc7MH1VutwHI3aWC3XSv5WCym5AhSyf2Cu2eVBg8/IzbD5Q7B
 OZvTJDo0ezRleQP2/Pe40vm2D4tBjSfDES2gAz3tGkONtCJEWoJEppWCBE2TcHwgTzKc
 2ZgKOF6VB5IjgzNIJwALgAxba2TGb7DnY3miAhASVAgs5sOSYQSjgopnGuF7UOm9KOl/
 R54WLSi6QNm1+yJnxQxRZnMjVVLTRRr0BTMAGd7hLO6rEzYAD+sokYNTip1mYUUkIGnM
 9gOo5xd3FbGTErPucEpBNBNPCM36LyPBhhZc5rVTTNnUf/sVuk4yl8G4+FmMWs17MPLB
 hk9Q==
X-Gm-Message-State: AFq9FYJ+p5N+NaSSV4mm0ZcRhjNerQFfUc58wJuhOd/989/LxwaVN43N
 4nS7eUEkikd0j0INxmHzOyKS6YG/i+2Gd2np7eXv4LVBLsX5ffQfiqhyA0AI7lzw8lo=
X-Gm-Gg: AYBFou35KkL7Rp6vyRYuAd2dfwehBMg+M0ie36b0zob450tPn+SlIDtRuZOCSC1WUNd
 /FSs+JcEUwoLAvGd2sUzaKZc4ZaGSZvjXdjTR/OPJcEMuQaEvujmqMHJ3bNjBxPVrqc9/Z9yfEb
 /YlaKc89RvQ6EHyZCGxJ/aeDjVuSwt7sMN+TR8YQ9nUU4A+DWDEZxSMPTxKovMQCLQbNLUiCTUI
 kJZXUizTtZ9uQpiDQtEJPlCRPKaBKNHwdWX+pYw5AkYC80H2qDGXeTJFEqD7AQr56X3K0mwPfqk
 g8da9WPFMkk07PMPu5+2iQQLiBv7GgHZ0IugVFHD3x7FbeRe7rbc+GPgM/Fr36kUS7QnCiU+mr9
 2ZbX+8ORkrGWNCE2XrPTP8lXl3Pq56qrJUPD5b3wCv2uEvGujA7WbN2e8mte8Qlp+YHVMU/MBhj
 /jAYFYCaNKBq/vFGc5xBeX1oj4Jcx93VmCFu3At9Y6r0MVQDKp9Xc+Em8VfrC1affunbKWzo4A6
 AN2JWPCEO0KIoBKurim9LfK97OIqZZAClY=
X-Received: by 2002:a05:701b:4546:20b0:14e:7162:2ab3 with SMTP id
 a92af1059eb24-16a5e49fd10mr24528622c88.8.1792070225660; 
 Thu, 15 Oct 2026 06:17:05 -0700 (PDT)
Received: from localhost ([192.55.55.48]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-169a1dd57d0sm56458515c88.8.2026.10.15.06.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 06:17:05 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 7/9] tests/kms_plane_scaling: add rotated
 plane-*-max-crc subtests
Date: Thu, 15 Oct 2026 16:16:14 +0300
Message-ID: <20261015131616.3172918-7-juhapekka.heikkila@gmail.com>
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

Add rotation as a parameter to the max scaling crc tests. Rotation 180
is tested for all modifiers; 90 and 270 only for Y tiling as that is
the only modifier here that is scanned out rotated by 90/270 on any
platform. With 90/270 the source axes are swapped, so the source
dimension that is searched for each destination axis is swapped too.

Rotated subtests get their own names so a failure tells directly which
rotation broke.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_plane_scaling.c | 239 +++++++++++++++++++++++++-------------
 1 file changed, 159 insertions(+), 80 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 14298df3c..336dd46d2 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -220,6 +220,44 @@
  * @4-tiled:    4-tiled
  */
 
+/**
+ * SUBTEST: plane-%s-max-crc-rotation-180-%s
+ * Description: Probe the maximum horizontal and vertical plane %arg[1]
+ *              factor with the plane rotated by 180 degrees for %arg[2] for
+ *              each supported pixel format and verify the result via crc.
+ *
+ * arg[1]:
+ *
+ * @downscale:  downscaling
+ * @upscale:    upscaling
+ *
+ * arg[2]:
+ *
+ * @linear:     linear
+ * @x-tiled:    X-tiled
+ * @y-tiled:    Y-tiled
+ * @yf-tiled:   Yf-tiled
+ * @4-tiled:    4-tiled
+ */
+
+/**
+ * SUBTEST: plane-%s-max-crc-rotation-%s-y-tiled
+ * Description: Probe the maximum horizontal and vertical plane %arg[1]
+ *              factor with the plane rotated by %arg[2] degrees for Y-tiled
+ *              for each supported pixel format and verify the result via
+ *              crc.
+ *
+ * arg[1]:
+ *
+ * @downscale:  downscaling
+ * @upscale:    upscaling
+ *
+ * arg[2]:
+ *
+ * @90:         90
+ * @270:        270
+ */
+
 IGT_TEST_DESCRIPTION("Test display plane scaling");
 
 enum scaler_combo_test_type {
@@ -751,6 +789,16 @@ static const struct {
 	{ I915_FORMAT_MOD_4_TILED,	"4-tiled" },
 };
 
+static const struct {
+	igt_rotation_t rot;
+	const char *name;
+} scale_rotations[] = {
+	{ IGT_ROTATION_0,	"" },
+	{ IGT_ROTATION_90,	"rotation-90-" },
+	{ IGT_ROTATION_180,	"rotation-180-" },
+	{ IGT_ROTATION_270,	"rotation-270-" },
+};
+
 static const char *format_name_lower(uint32_t format, char *buf, size_t len)
 {
 	const char *name = igt_format_str(format);
@@ -830,7 +878,7 @@ static const char *scale_dir_name(enum scale_dir dir)
 	return dir == SCALE_DOWN ? "downscale" : "upscale";
 }
 
-static int scale_src_cap(data_t *d, enum scale_dir dir, bool scale_width,
+static int scale_src_cap(data_t *d, enum scale_dir dir, bool src_width,
 			 int dst_scaled, int align)
 {
 	drmModeRes *res;
@@ -841,43 +889,63 @@ static int scale_src_cap(data_t *d, enum scale_dir dir, bool scale_width,
 
 	res = drmModeGetResources(d->drm_fd);
 	igt_assert(res);
-	cap = ALIGN_DOWN(scale_width ? res->max_width : res->max_height, align);
+	cap = ALIGN_DOWN(src_width ? res->max_width : res->max_height, align);
 	drmModeFreeResources(res);
 
 	return cap;
 }
 
+struct scale_axis {
+	const char *name;
+	bool scale_width;
+	struct igt_fb fb;
+	int dst_w, dst_h, dst_scaled, limit;
+	bool tested, failed;
+};
+
+/* 90/270 rotation swaps which source axis lands on the scaled dst axis. */
+static bool scale_src_width(const struct scale_axis *a, igt_rotation_t rot)
+{
+	return a->scale_width != igt_rotation_90_or_270(rot);
+}
+
+static void scale_src_size(const struct scale_axis *a, igt_rotation_t rot,
+			   int len, int *w, int *h)
+{
+	int fixed = a->scale_width ? a->dst_h : a->dst_w;
+
+	*w = scale_src_width(a, rot) ? len : fixed;
+	*h = scale_src_width(a, rot) ? fixed : len;
+}
+
 static int
 find_scale_src_limit(data_t *d, igt_plane_t *plane, struct igt_fb *fb,
-		     enum scale_dir dir, bool scale_width,
-		     int dst_w, int dst_h, int align, int cap)
+		     enum scale_dir dir, const struct scale_axis *a,
+		     igt_rotation_t rot, int align, int cap)
 {
 	igt_display_t *display = &d->display;
-	int fixed = scale_width ? dst_h : dst_w;
-	int dst = scale_width ? dst_w : dst_h;
-	int lo, hi, best;
+	int lo, hi, best, w, h;
 	int ret;
 
 	igt_assert(align >= 1);
 
 	igt_plane_set_fb(plane, fb);
+	igt_plane_set_rotation(plane, rot);
 	igt_plane_set_position(plane, 0, 0);
-	igt_plane_set_size(plane, dst_w, dst_h);
+	igt_plane_set_size(plane, a->dst_w, a->dst_h);
 
 	/* Baseline: the unscaled 1:1 source must be accepted. */
-	best = ALIGN(dst, align);
+	best = ALIGN(a->dst_scaled, align);
+	scale_src_size(a, rot, best, &w, &h);
 	igt_fb_set_position(fb, plane, 0, 0);
-	igt_fb_set_size(fb, plane,
-			scale_width ? best : fixed,
-			scale_width ? fixed : best);
+	igt_fb_set_size(fb, plane, w, h);
 	ret = igt_display_try_commit_atomic(display,
 					    DRM_MODE_ATOMIC_TEST_ONLY |
 					    DRM_MODE_ATOMIC_ALLOW_MODESET,
 					    NULL);
 	if (ret) {
 		igt_debug("Unscaled %dx%d source rejected (ret=%d)\n",
-			  scale_width ? best : fixed,
-			  scale_width ? fixed : best, ret);
+			  w, h, ret);
 		igt_plane_set_fb(plane, NULL);
 		return ret;
 	}
@@ -896,10 +964,9 @@ find_scale_src_limit(data_t *d, igt_plane_t *plane, struct igt_fb *fb,
 		mid = (dir == SCALE_DOWN) ? ALIGN_DOWN(mid, align) :
 					    ALIGN(mid, align);
 
+		scale_src_size(a, rot, mid, &w, &h);
 		igt_fb_set_position(fb, plane, 0, 0);
-		igt_fb_set_size(fb, plane,
-				scale_width ? mid : fixed,
-				scale_width ? fixed : mid);
+		igt_fb_set_size(fb, plane, w, h);
 
 		ret = igt_display_try_commit_atomic(display,
 						    DRM_MODE_ATOMIC_TEST_ONLY |
@@ -919,9 +986,9 @@ find_scale_src_limit(data_t *d, igt_plane_t *plane, struct igt_fb *fb,
 		}
 	}
 
-	igt_debug("%s limit source %s for dst %dx%d: %d (fixed axis %d)\n",
-		  scale_dir_name(dir), scale_width ? "width" : "height",
-		  dst_w, dst_h, best, fixed);
+	igt_debug("%s %s limit for dst %dx%d rotation %s: %d\n",
+		  a->name, scale_dir_name(dir), a->dst_w, a->dst_h,
+		  igt_plane_rotation_name(rot), best);
 
 	igt_plane_set_fb(plane, NULL);
 
@@ -956,17 +1023,10 @@ static void set_legacy_lut(data_t *data, igt_crtc_t *crtc,
 	free(lut);
 }
 
-struct scale_axis {
-	const char *name;
-	bool scale_width;
-	struct igt_fb fb;
-	int dst_w, dst_h, dst_scaled, limit;
-	bool tested, failed;
-};
-
 static void
 check_one_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
-			uint32_t format, uint64_t modifier, enum scale_dir dir)
+			uint32_t format, uint64_t modifier, enum scale_dir dir,
+			igt_rotation_t rot)
 {
 	igt_display_t *display = &d->display;
 	const int band = 64;
@@ -978,7 +1038,7 @@ check_one_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 	igt_crc_t ref_crc, scaled_crc;
 	drmModeModeInfo mode;
 	igt_plane_t *plane;
-	int halign, valign;
+	int halign, valign, dalign;
 	char limits[128] = "";
 	bool any_tested = false;
 	/* Pre-ver14 scalers round planar YUV differently from 1:1. */
@@ -1006,32 +1066,32 @@ check_one_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_require(plane);
 
-	yuv_src_alignment(d, format, IGT_ROTATION_0, &halign, &valign);
+	yuv_src_alignment(d, format, rot, &halign, &valign);
+	/* Each dst side is also a source side at 1:1, possibly rotated. */
+	dalign = max(halign, valign);
 
 	/* Search both axes first so the CRC phase only commits known limits. */
 	for (int i = 0; i < ARRAY_SIZE(axes); i++) {
 		struct scale_axis *a = &axes[i];
-		int align = a->scale_width ? halign : valign;
-		int cap;
+		bool src_width = scale_src_width(a, rot);
+		int align = src_width ? halign : valign;
+		int cap, w, h;
 		size_t used;
 
 		/* dst is a thin band spanning the whole scaled axis */
-		a->dst_w = ALIGN(a->scale_width ? mode.hdisplay : band, halign);
-		a->dst_h = ALIGN(a->scale_width ? band : mode.vdisplay, valign);
+		a->dst_w = ALIGN(a->scale_width ? mode.hdisplay : band, dalign);
+		a->dst_h = ALIGN(a->scale_width ? band : mode.vdisplay, dalign);
 		a->dst_scaled = a->scale_width ? a->dst_w : a->dst_h;
 
-		cap = scale_src_cap(d, dir, a->scale_width, a->dst_scaled,
-				    align);
+		cap = scale_src_cap(d, dir, src_width, a->dst_scaled, align);
 
 		/* Every probed and committed source is a crop of this fb. */
-		igt_create_color_fb(display->drm_fd,
-				    a->scale_width ? cap : a->dst_w,
-				    a->scale_width ? a->dst_h : cap,
-				    format, modifier, 0.0, 1.0, 0.0, &a->fb);
-
-		a->limit = find_scale_src_limit(d, plane, &a->fb, dir,
-						a->scale_width, a->dst_w,
-						a->dst_h, align, cap);
+		scale_src_size(a, rot, cap, &w, &h);
+		igt_create_color_fb(display->drm_fd, w, h, format, modifier,
+				    0.0, 1.0, 0.0, &a->fb);
+
+		a->limit = find_scale_src_limit(d, plane, &a->fb, dir, a, rot,
+						align, cap);
 		if (a->limit < 0 ||
 		    (dir == SCALE_DOWN ? a->limit <= a->dst_scaled :
 					 a->limit >= a->dst_scaled)) {
@@ -1062,32 +1122,35 @@ check_one_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 			 IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier));
 	}
 
-	igt_info("Max %s for " IGT_FORMAT_FMT " " IGT_MODIFIER_FMT ": %s\n",
-		 scale_dir_name(dir), IGT_FORMAT_ARGS(format),
-		 IGT_MODIFIER_ARGS(modifier), limits);
+	igt_info("Max %s for " IGT_FORMAT_FMT " " IGT_MODIFIER_FMT
+		 " rotation %s: %s\n", scale_dir_name(dir),
+		 IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
+		 igt_plane_rotation_name(rot), limits);
 
 	pipe_crc = igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
 
 	for (int i = 0; i < ARRAY_SIZE(axes); i++) {
 		struct scale_axis *a = &axes[i];
+		int w, h;
 
 		if (!a->tested)
 			continue;
 
 		/* Reference: unscaled crop of exactly the destination size. */
+		scale_src_size(a, rot, a->dst_scaled, &w, &h);
 		igt_plane_set_fb(plane, &a->fb);
+		igt_plane_set_rotation(plane, rot);
 		igt_fb_set_position(&a->fb, plane, 0, 0);
-		igt_fb_set_size(&a->fb, plane, a->dst_w, a->dst_h);
+		igt_fb_set_size(&a->fb, plane, w, h);
 		igt_plane_set_position(plane, 0, 0);
 		igt_plane_set_size(plane, a->dst_w, a->dst_h);
 		igt_display_commit2(display, COMMIT_ATOMIC);
 		igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
 
 		/* Test: limit sized crop scaled into the same rectangle. */
+		scale_src_size(a, rot, a->limit, &w, &h);
 		igt_fb_set_position(&a->fb, plane, 0, 0);
-		igt_fb_set_size(&a->fb, plane,
-				a->scale_width ? a->limit : a->dst_w,
-				a->scale_width ? a->dst_h : a->limit);
+		igt_fb_set_size(&a->fb, plane, w, h);
 		igt_display_commit2(display, COMMIT_ATOMIC);
 		igt_pipe_crc_collect_crc(pipe_crc, &scaled_crc);
 
@@ -1120,14 +1183,14 @@ check_one_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 
 static void
 test_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
-		   uint64_t modifier, enum scale_dir dir)
+		   uint64_t modifier, enum scale_dir dir, igt_rotation_t rot)
 {
 	igt_plane_t *plane;
 	struct igt_vec tested_formats;
 	uint32_t format;
 
 	plane = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
-	if (!plane)
+	if (!plane || !igt_plane_has_rotation(plane, rot))
 		return;
 
 	igt_vec_init(&tested_formats, sizeof(uint32_t));
@@ -1145,7 +1208,7 @@ test_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 		igt_dynamic_f("pipe-%s-%s-%s", igt_crtc_name(crtc),
 			      igt_output_name(output), fname)
 			check_one_scale_max_crc(d, crtc, output, format,
-						modifier, dir);
+						modifier, dir, rot);
 	}
 
 	igt_vec_fini(&tested_formats);
@@ -1795,7 +1858,8 @@ scale_output_for_crtc(data_t *d, igt_crtc_t *crtc)
 }
 
 static void
-test_scale_max_crc_pipes(data_t *d, uint64_t modifier, enum scale_dir dir)
+test_scale_max_crc_pipes(data_t *d, uint64_t modifier, enum scale_dir dir,
+			 igt_rotation_t rot)
 {
 	igt_crtc_t *crtc;
 
@@ -1803,7 +1867,43 @@ test_scale_max_crc_pipes(data_t *d, uint64_t modifier, enum scale_dir dir)
 		igt_output_t *output = scale_output_for_crtc(d, crtc);
 
 		if (output)
-			test_scale_max_crc(d, crtc, output, modifier, dir);
+			test_scale_max_crc(d, crtc, output, modifier, dir,
+					   rot);
+	}
+}
+
+static void scale_max_crc_subtests(data_t *d, int r)
+{
+	igt_rotation_t rot = scale_rotations[r].rot;
+
+	for (int m = 0; m < ARRAY_SIZE(scale_modifiers); m++) {
+		uint64_t modifier = scale_modifiers[m].modifier;
+
+		/* Of these modifiers only Y tiling does 90/270 in practice. */
+		if (igt_rotation_90_or_270(rot) &&
+		    modifier != I915_FORMAT_MOD_Y_TILED)
+			continue;
+
+		igt_describe_f("Probe the maximum horizontal and vertical "
+			       "plane downscaling factor at rotation %s for "
+			       "each supported pixel format and verify the "
+			       "downscaled output matches an unscaled "
+			       "reference using CRCs.",
+			       igt_plane_rotation_name(rot));
+		igt_subtest_with_dynamic_f("plane-downscale-max-crc-%s%s",
+					   scale_rotations[r].name,
+					   scale_modifiers[m].name)
+			test_scale_max_crc_pipes(d, modifier, SCALE_DOWN, rot);
+
+		igt_describe_f("Probe the maximum horizontal and vertical "
+			       "plane upscaling factor at rotation %s for "
+			       "each supported pixel format and verify the "
+			       "upscaled output matches an unscaled reference "
+			       "using CRCs.", igt_plane_rotation_name(rot));
+		igt_subtest_with_dynamic_f("plane-upscale-max-crc-%s%s",
+					   scale_rotations[r].name,
+					   scale_modifiers[m].name)
+			test_scale_max_crc_pipes(d, modifier, SCALE_UP, rot);
 	}
 }
 
@@ -2102,29 +2202,8 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 			}
 		}
 
-		for (int m = 0; m < ARRAY_SIZE(scale_modifiers); m++) {
-			uint64_t modifier = scale_modifiers[m].modifier;
-
-			igt_describe("Probe the maximum horizontal and vertical "
-				     "plane downscaling factor for each supported "
-				     "pixel format and verify the downscaled "
-				     "output matches an unscaled reference using "
-				     "CRCs.");
-			igt_subtest_with_dynamic_f("plane-downscale-max-crc-%s",
-						   scale_modifiers[m].name)
-				test_scale_max_crc_pipes(&data, modifier,
-							 SCALE_DOWN);
-
-			igt_describe("Probe the maximum horizontal and vertical "
-				     "plane upscaling factor for each supported "
-				     "pixel format and verify the upscaled "
-				     "output matches an unscaled reference using "
-				     "CRCs.");
-			igt_subtest_with_dynamic_f("plane-upscale-max-crc-%s",
-						   scale_modifiers[m].name)
-				test_scale_max_crc_pipes(&data, modifier,
-							 SCALE_UP);
-		}
+		for (int r = 0; r < ARRAY_SIZE(scale_rotations); r++)
+			scale_max_crc_subtests(&data, r);
 	}
 
 	igt_subtest_group()
-- 
2.43.0

