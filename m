Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEEF606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 19:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=hB6P71iV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6213A1126C9;
	Thu, 26 Nov 2026 19:55:21 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253DA1126AC
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 19:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1795722695;
 bh=66zMt+FOaNa1m5MNegWZes1duN8yMICrPVbvgfpv40Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hB6P71iV133MeAh/Q8LmX+5DUT+oRXqR/IWVDb8fMPWVb239yNFPMyc4JU/OgZJNY
 PhmxiqjpnEOT1kSd73v7EpA6EoJsr00zE6Gsw2bDX9kpsFa4lttstJAsCNeCACjcr5
 hJapp6kdFqdIY1Y0P6/cM7c2hO+0jcIsAcCDAfSz2xp1s00ga75OK+4jumJ+3oXKUH
 lW+A0K503lZt48WomQIJJA2h2xJJyzUB2/whazc4jQ4kTfyM0KVwNonCLyX1KnxMIp
 j0wLeaCDxbpfZ1UcAASrihLnSOS8Qi9fkCIMQloMXC1lahCrw/hJvyFu3xfORk0FPr
 MdQa1UfjELU6Q==
Received: from vileplume (unknown [100.64.0.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: simonz)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 710B817E0311;
 Thu, 26 Nov 2026 20:51:35 +0100 (CET)
From: simon.zeni@collabora.com
To: igt-dev@lists.freedesktop.org
Cc: Simon Zeni <simon.zeni@collabora.com>
Subject: [PATCH i-g-t v2 2/3] lib/igt_fb: add support for DRM_FORMAT_Y8
Date: Thu, 26 Nov 2026 14:50:58 -0500
Message-ID: <20261126195103.53198-2-simon.zeni@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126195103.53198-1-simon.zeni@collabora.com>
References: <20261126195103.53198-1-simon.zeni@collabora.com>
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Simon Zeni <simon.zeni@collabora.com>

This adds support for the greyscale format DRM_FORMAT_Y8 along with dedicated functions to convert
pixels in this format to RGB24 and vice-versa. The function `convert_y_to_rgb24` assumes a neutral
chroma value of 128 for both the U and V components.

Signed-off-by: Simon Zeni <simon.zeni@collabora.com>
---
 lib/igt_color_encoding.c |   1 +
 lib/igt_fb.c             | 117 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 118 insertions(+)

diff --git a/lib/igt_color_encoding.c b/lib/igt_color_encoding.c
index 1d01c7eb0..479e5478c 100644
--- a/lib/igt_color_encoding.c
+++ b/lib/igt_color_encoding.c
@@ -151,6 +151,7 @@ static const struct color_encoding_format {
 	{ DRM_FORMAT_YVU420, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
 	{ DRM_FORMAT_YVU422, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
 	{ DRM_FORMAT_YVU444, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
+	{ DRM_FORMAT_Y8, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f},
 	{ DRM_FORMAT_YUYV, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
 	{ DRM_FORMAT_YVYU, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
 	{ DRM_FORMAT_UYVY, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 3d15f0595..370a947a1 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -347,6 +347,11 @@ static const struct format_desc_struct {
 	  .num_planes = 1, .plane_bpp = { 64, },
 	  .hsub = 1, .vsub = 1,
 	},
+	{ .name = "Y8", .depth = 8, .drm_id = DRM_FORMAT_Y8,
+	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
+	  .num_planes = 1, .plane_bpp = { 8, },
+	  .hsub = 1, .vsub = 1,
+	},
 	{ .name = "XV30", .depth = -1, .drm_id = DRM_FORMAT_XVYU2101010,
 	  .cairo_id = CAIRO_FORMAT_RGB96F, .convert = true,
 	  .num_planes = 1, .plane_bpp = { 32, },
@@ -1215,6 +1220,11 @@ static void clear_yuv_buffer(struct igt_fb *fb)
 		       0x80,
 		       plane_size[2]);
 		break;
+	case DRM_FORMAT_Y8:
+		memset(ptr + fb->offsets[0],
+		       full_range ? 0x00 : 0x10,
+		       plane_size[0]);
+		break;
 	}
 
 	igt_fb_unmap_buffer(fb, ptr);
@@ -3772,6 +3782,10 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
 	igt_assert(igt_format_is_yuv(fb->drm_format));
 
 	switch (fb->drm_format) {
+	case DRM_FORMAT_Y8:
+		params->ay_inc = 1;
+		break;
+
 	case DRM_FORMAT_NV12:
 	case DRM_FORMAT_NV16:
 	case DRM_FORMAT_NV21:
@@ -3819,6 +3833,10 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
 	}
 
 	switch (fb->drm_format) {
+	case DRM_FORMAT_Y8:
+		params->ay_stride = fb->strides[0];
+		break;
+
 	case DRM_FORMAT_NV12:
 	case DRM_FORMAT_NV16:
 	case DRM_FORMAT_NV21:
@@ -3858,6 +3876,10 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
 	}
 
 	switch (fb->drm_format) {
+	case DRM_FORMAT_Y8:
+		params->y_offset = fb->offsets[0];
+		break;
+
 	case DRM_FORMAT_NV12:
 	case DRM_FORMAT_NV16:
 		params->y_offset = fb->offsets[0];
@@ -4099,6 +4121,94 @@ static void convert_rgb24_to_yuv(struct fb_convert *cvt)
 	}
 }
 
+static void convert_y_to_rgb24(struct fb_convert *cvt)
+{
+	int i, j;
+	uint8_t bpp = 4;
+	uint8_t *y;
+	uint8_t *rgb24 = cvt->dst.ptr;
+	unsigned int rgb24_stride = cvt->dst.fb->strides[0];
+	struct igt_mat4 m = igt_ycbcr_to_rgb_matrix(cvt->src.fb->drm_format,
+						    cvt->dst.fb->drm_format,
+						    cvt->src.fb->color_encoding,
+						    cvt->src.fb->color_range);
+	uint8_t *buf;
+	struct yuv_parameters params = { };
+
+	igt_assert(cvt->dst.fb->drm_format == DRM_FORMAT_XRGB8888 &&
+		   cvt->src.fb->drm_format == DRM_FORMAT_Y8);
+
+	buf = convert_src_get(cvt);
+	get_yuv_parameters(cvt->src.fb, &params);
+	y = buf + params.y_offset;
+
+	for (i = 0; i < cvt->dst.fb->height; i++) {
+		const uint8_t *y_tmp = y;
+		uint8_t *rgb_tmp = rgb24;
+
+		for (j = 0; j < cvt->dst.fb->width; j++) {
+			struct igt_vec4 rgb, yuv;
+
+			yuv.d[0] = *y_tmp;
+			yuv.d[1] = 128.f;
+			yuv.d[2] = 128.f;
+			yuv.d[3] = 1.0f;
+
+			rgb = igt_matrix_transform(&m, &yuv);
+			write_rgb(rgb_tmp, &rgb);
+
+			rgb_tmp += bpp;
+			y_tmp += params.ay_inc;
+		}
+
+		rgb24 += rgb24_stride;
+		y += params.ay_stride;
+	}
+
+	convert_src_put(cvt, buf);
+}
+
+static void convert_rgb24_to_y(struct fb_convert *cvt)
+{
+	int i, j;
+	uint8_t *y;
+	const uint8_t *rgb24 = cvt->src.ptr;
+	uint8_t bpp = 4;
+	unsigned rgb24_stride = cvt->src.fb->strides[0];
+	struct igt_mat4 m = igt_rgb_to_ycbcr_matrix(cvt->src.fb->drm_format,
+						    cvt->dst.fb->drm_format,
+						    cvt->dst.fb->color_encoding,
+						    cvt->dst.fb->color_range);
+	struct yuv_parameters params = { };
+
+	igt_assert(cvt->src.fb->drm_format == DRM_FORMAT_XRGB8888 &&
+		   cvt->dst.fb->drm_format == DRM_FORMAT_Y8);
+
+	get_yuv_parameters(cvt->dst.fb, &params);
+	y = cvt->dst.ptr + params.y_offset;
+
+	for (i = 0; i < cvt->dst.fb->height; i++) {
+		const uint8_t *rgb_tmp = rgb24;
+		uint8_t *y_tmp = y;
+
+		for (j = 0; j < cvt->dst.fb->width; j++) {
+			struct igt_vec4 rgb;
+			struct igt_vec4 yuv;
+
+			read_rgb(&rgb, rgb_tmp);
+			yuv = igt_matrix_transform(&m, &rgb);
+
+			rgb_tmp += bpp;
+
+			*y_tmp = clamp8(yuv.d[0]);
+			y_tmp += params.ay_inc;
+		}
+
+		rgb24 += rgb24_stride;
+		y += params.ay_stride;
+	}
+}
+
 static void read_rgbf(struct igt_vec4 *rgb, const float *rgb24)
 {
 	rgb->d[0] = rgb24[0];
@@ -4637,6 +4747,9 @@ static void fb_convert(struct fb_convert *cvt)
 		case DRM_FORMAT_YVYU:
 			convert_yuv_to_rgb24(cvt);
 			return;
+		case DRM_FORMAT_Y8:
+			convert_y_to_rgb24(cvt);
+			return;
 		}
 	} else if (cvt->src.fb->drm_format == DRM_FORMAT_XRGB8888) {
 		switch (cvt->dst.fb->drm_format) {
@@ -4661,6 +4774,9 @@ static void fb_convert(struct fb_convert *cvt)
 		case DRM_FORMAT_YVYU:
 			convert_rgb24_to_yuv(cvt);
 			return;
+		case DRM_FORMAT_Y8:
+			convert_rgb24_to_y(cvt);
+			return;
 		}
 	} else if (cvt->dst.fb->drm_format == IGT_FORMAT_FLOAT) {
 		switch (cvt->src.fb->drm_format) {
@@ -5259,6 +5375,7 @@ bool igt_format_is_yuv(uint32_t drm_format)
 	case DRM_FORMAT_UYVY:
 	case DRM_FORMAT_VYUY:
 	case DRM_FORMAT_XYUV8888:
+	case DRM_FORMAT_Y8:
 		return true;
 	default:
 		return false;
-- 
2.53.0

