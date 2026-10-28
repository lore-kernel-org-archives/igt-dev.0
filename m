Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB3A606A31C
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 14:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aWy/bMh+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 814DD10FD11;
	Wed, 28 Oct 2026 14:56:54 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACBA510E0B5
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 14:53:05 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-3adf5f6833cso655139a91.0
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 07:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793199185; x=1793803985; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=H6M6S0cRddFxEYE44PkRAe9O9Az3kKrCN7qW4eHMt/Y=;
 b=aWy/bMh+ycwLqjzI9MqkDO1xDZlcnKR9W4WIG6Fl/C/NE/tDAyWt1NnHcrRiIf1+Gl
 ZRjlu/ZEDKMl9TepVRWlyvc82eXWVvsPnJRt/V/MXDdkM4GZ5zqTscfHOSQsdwR2XSW7
 W0Q/IsxDrAGOWneUwMVUTr2jxk2w22Yq0Bo5dKhLjaypBoDDxe+IFOF+/H0dVH6hn9/w
 AcpImVwLqxU8N31cf32QyYauh+EqDKRbGj3VGu3ZyaoISKN8JydflCvqsPCZoEa8IWxc
 IN4MOSGk/sCRmAtewgn+JvQFXIm3yKP6fjm2y3Sf2OPE1ZdCc7SSQTVTQhJkdkp0IIxQ
 hmuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793199185; x=1793803985;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=H6M6S0cRddFxEYE44PkRAe9O9Az3kKrCN7qW4eHMt/Y=;
 b=KaNYFcBgR4Rtzk82kjyc0k80useTtn7WEbcgJ4DFItL88xXYN0hdbmv0YCIzGQccwG
 bve5fx3kGKML8l7GsOOK+7j76QGUYv2m+r8rFrFXieGOpUQi/HxHQguxFzlSqdNQV/co
 xRBb4/PpFjwUdjhddYTCBzpjqUXUJep8GBEtmQKAiLvBNQQ9wqXgOkTbWteRwQ7UjJde
 eGsgZ+oSHfblGgq23mrsapFtg0IdoQIuka18TvITSVOOPPkCt8h+GHGXwjYghO2dO0gn
 5/zHz866zPwA5lGICFtNQymYyBREIIwGTpx2lWO9e6Dpz1nsHCobJJxf608zBQAgnNkt
 OoOg==
X-Gm-Message-State: AFq9FYITZsSSnJjEAJeJfo90in9oOL916Uznpk3fP4BFDaMUtsxlwFDd
 HTMibH0g8zcU3WVUVYbGLPyyfn5/imtkLnmH7BkECVzlaplPjmZ16k1VfItCvw==
X-Gm-Gg: AYBFou2+Ezs3VxvMGIo/C3imH+P+WYg2RYYp+RXwtOt34YbWXWL8fv0Z1NpS5uImaIz
 +gTGSNIxp/UMabD4RDiTQ/Wjaq9ZmYEb2gK55mAPD4vwnRoBUvXRI8Dq6zuWCCbjz4iFlqhYMwm
 8ggjaMEkVv0NTTg06Y7gPj5nWH+uMoWJrVc5FElqSh96Rn0hztrGgXJ8D8T9eO6oWMpAPbtA8tQ
 nNy/ibeXHEihisIwhiulbOnyRhi+IWZQVG24BHlb1SXgcJduQT5VW/xGZUuEIhjk8Om6gEnJXva
 2VDyx5XCbhAkQe+9+tzn0iTAlQ09bWfQ3BoPOt5Mx6JmyZ1Zn2vcyiux+zpLyzYShpS0TEqg3MQ
 LbNtayzIBPWNEa4nMAMKonI0xOB7rbic92yEEj368mdnT/GzPGvM/w8PczkUXwtN+5NT4l0VwK+
 wIG66oYiuPYrPjNE8bfsgAQmuPXvbz7jx28Wa+v2qt+DsVMlndkzu+iRUkmDK6GiqVpG5dpozsT
 TmpOCrMaW8y6+Gev4I3C3u0WV3IPCwn6tiVfA1gOysChmg3av2mKsgSTXz9EzbpwaQUpLqoGaS9
 PeBgsl2km6VGK6KM65SEqdqkYQIyCOMIrwutnRWTRWVAoouiULCNK6WBFQFOpA7GhqpzGvwN0lj
 Mujsm1NJkcPQ=
X-Received: by 2002:a17:90a:ec8e:b0:3a4:e934:e85c with SMTP id
 98e67ed59e1d1-3ae5817938amr1823238a91.41.1793199184936; 
 Wed, 28 Oct 2026 07:53:04 -0700 (PDT)
Received: from localhost ([192.55.54.47]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3ae55d64c0bsm2109856a91.1.2026.10.28.07.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 07:53:04 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Luca Coelho <luciano.coelho@intel.com>
Subject: [PATCH i-g-t 07/10] tests/kms_plane_scaling: add rotated
 plane-*-max-crc subtests
Date: Wed, 28 Oct 2026 16:51:59 +0200
Message-ID: <20261028145202.3128915-7-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028145202.3128915-1-juhapekka.heikkila@gmail.com>
References: <20261028145202.3128915-1-juhapekka.heikkila@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add rotation as a parameter to the max scaling crc tests. Rotation 180
is tested for all modifiers; 90 and 270 only for Y tiling as that is
the only modifier here that is scanned out rotated by 90/270 on any
platform. With 90/270 the source axes are swapped, so the source
dimension that is searched for each destination axis is swapped too.

Rotated subtests get their own names so a failure tells directly which
rotation broke.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Reviewed-by: Luca Coelho <luciano.coelho@intel.com>
---
 tests/kms_plane_scaling.c | 242 +++++++++++++++++++++++++-------------
 1 file changed, 163 insertions(+), 79 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 2e7434b7e..506c03393 100644
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
@@ -831,7 +879,7 @@ static const char *scale_dir_name(enum scale_dir dir)
 	return dir == SCALE_DOWN ? "downscale" : "upscale";
 }
 
-static int scale_src_cap(data_t *d, enum scale_dir dir, bool scale_width,
+static int scale_src_cap(data_t *d, enum scale_dir dir, bool src_width,
 			 int dst_scaled, int align)
 {
 	drmModeRes *res;
@@ -842,43 +890,63 @@ static int scale_src_cap(data_t *d, enum scale_dir dir, bool scale_width,
 
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
@@ -897,10 +965,9 @@ find_scale_src_limit(data_t *d, igt_plane_t *plane, struct igt_fb *fb,
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
@@ -920,9 +987,9 @@ find_scale_src_limit(data_t *d, igt_plane_t *plane, struct igt_fb *fb,
 		}
 	}
 
-	igt_debug("%s limit source %s for dst %dx%d: %d (fixed axis %d)\n",
-		  scale_dir_name(dir), scale_width ? "width" : "height",
-		  dst_w, dst_h, best, fixed);
+	igt_debug("%s %s limit for dst %dx%d rotation %s: %d\n",
+		  a->name, scale_dir_name(dir), a->dst_w, a->dst_h,
+		  igt_plane_rotation_name(rot), best);
 
 	igt_plane_set_fb(plane, NULL);
 
@@ -957,17 +1024,10 @@ static void set_legacy_lut(data_t *data, igt_crtc_t *crtc,
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
@@ -979,7 +1039,7 @@ check_one_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 	igt_crc_t ref_crc, scaled_crc;
 	drmModeModeInfo mode;
 	igt_plane_t *plane;
-	int halign, valign;
+	int halign, valign, dalign;
 	char limits[128] = "";
 	bool any_tested = false;
 	/* Pre-ver14 scalers round planar YUV differently from 1:1. */
@@ -1007,32 +1067,32 @@ check_one_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
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
@@ -1063,32 +1123,35 @@ check_one_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
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
 
@@ -1121,13 +1184,18 @@ check_one_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 
 static void
 test_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
-		   uint64_t modifier, enum scale_dir dir)
+		   uint64_t modifier, enum scale_dir dir, igt_rotation_t rot)
 {
 	igt_plane_t *plane;
 	struct igt_vec tested_formats;
 	uint32_t format;
 
 	plane = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
+	if (!igt_plane_has_rotation(plane, rot)) {
+		igt_info("Pipe %s primary plane has no rotation %s, skipping\n",
+			 igt_crtc_name(crtc), igt_plane_rotation_name(rot));
+		return;
+	}
 
 	igt_vec_init(&tested_formats, sizeof(uint32_t));
 
@@ -1144,7 +1212,7 @@ test_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 		igt_dynamic_f("pipe-%s-%s-%s", igt_crtc_name(crtc),
 			      igt_output_name(output), fname)
 			check_one_scale_max_crc(d, crtc, output, format,
-						modifier, dir);
+						modifier, dir, rot);
 	}
 
 	igt_vec_fini(&tested_formats);
@@ -1794,7 +1862,8 @@ scale_output_for_crtc(data_t *d, igt_crtc_t *crtc)
 }
 
 static void
-test_scale_max_crc_pipes(data_t *d, uint64_t modifier, enum scale_dir dir)
+test_scale_max_crc_pipes(data_t *d, uint64_t modifier, enum scale_dir dir,
+			 igt_rotation_t rot)
 {
 	igt_crtc_t *crtc;
 
@@ -1802,7 +1871,43 @@ test_scale_max_crc_pipes(data_t *d, uint64_t modifier, enum scale_dir dir)
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
 
@@ -2101,29 +2206,8 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
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

