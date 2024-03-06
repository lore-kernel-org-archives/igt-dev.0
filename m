Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3BFC5475B
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 17:28:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8392D113393;
	Wed,  6 Mar 2024 17:28:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="GiHxvJ63";
	dkim-atps=neutral
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD4C10E086
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 17:28:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B6EEAE0007;
 Wed,  6 Mar 2024 17:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709746125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pVN5YuSdMkazDXVpUxhWnLjqEo7Is7BPb+BsurgDqOQ=;
 b=GiHxvJ63tzLYKTXx1ma1CY6DE1EBWneih6UL6uSUH97d4kJnF5eMIR0cOg4yVSXVWUD4Hm
 zGOXuH/B5evdJbxHgmdeZlg42EeySLyvRIBwl3cgbYnIZ3dBrzYLbIJb2OUA6FgEbNDNdg
 fPDLSdXI5bMVznYtq+SmFqNYQMS1/B23Ojzk7DsFPfQa8YP0QfHHHSbgwe+akVa59zU935
 H6DrS/hyMedl2wJ+MrZYxq5uGIr9kBgSvhz6jVJst7ntgqYUhnyJGtiCEuIWAJFJXGh8xC
 dOvQOUXcsOMZ3JHTuUN2OU9fPBx06edQ7dc344PdQrrC9QUHfJRBWDOpfwYRMg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 06 Mar 2024 18:28:41 +0100
Subject: [PATCH i-g-t 7/9] lib/igt_fb: Add DRM_FORMAT_R1 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240306-b4-kms_tests-v1-7-8fe451efd2ac@bootlin.com>
References: <20240306-b4-kms_tests-v1-0-8fe451efd2ac@bootlin.com>
In-Reply-To: <20240306-b4-kms_tests-v1-0-8fe451efd2ac@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: miquel.raynal@bootlin.com, jeremie.dautheribes@bootlin.com, 
 thomas.petazzoni@bootlin.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5731;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=MGyaCk8cPVvlfODmEP6BN0yiZmVoLDfYKAONG7LlEG8=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl6KfJe2+0gqPc+M3mZqMIpnhbaoRmnsqEIZUkBi45
 AQxDLReJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZeinyQAKCRAgrS7GWxAs4my7EA
 CM9gUZpwapoFw8kDufZL9BeUPoLazQVrQsIBMCTuioczZRejpVxEL/e1wc/Eu8P2JgxoMdeEdWZg2D
 Oymmj5nkoqSaZytPEeQ9GaLaPLBcj6sG8qxgGRsQCPqSTmcaBz22rZaraWm4u+mAZPdnQHogmhdty/
 juFUPiIaat8zY52ShK9LJxGnPaUkDI1jyMp2xB7XGn621Fs7J7PVtOW7HGKrjpt/eX8mc2fE8WR4xF
 YeHHDeCsJngPDYF44VscpQjhvyZOV1S7zikxJXh5pvt9Od0psHX3mqQDzVaTxUtrNPbK5P6KG3UuU5
 QxsdJZ9otuAK8sFsr3iR5tH8zFxZJW5dw/3b+l6u2nk6jbc6jMFR8/zGWCnLQxPo7q9rjyQetl9pkX
 nKsEIA1/wRh6Tb0+TzfQNMsiKjeCUEkfTWkGBcKa/+StIOgvm7CUBmORrOCIip5YCqH5a2gBhezIDc
 MZxbKgFhvuKRd0j5YryPWUZBLvUPPabqGGHVd4FReQFrX4tGGwQlRoy6wBDn2ek2kgS3P8bbhTniiD
 w+wqGMpWRXENrLUcB7+zB70IscrFGPfTCRUF2QcD7UlZ17cFvyd9EMHfKs+1i7Tp1jP7TAL7pqgDaK
 I04SCut7xBIvxrOdgjtfQmQuKJwe2VYcbwTm/foSgPRMGFQBvtU/mromDN3w==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

Add the DRM_FORMAT_R1 to rgb24 conversion to allow this format in tests.

Introduce a small helper to be able to filter the black and white formats.

Use this new helper to skip black and white format in tests/kms_plane to
avoid pointless tests (testing black and white format with something else
than black or white will always be a failure).

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_fb.c      | 105 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_fb.h      |   1 +
 tests/kms_plane.c |   3 ++
 3 files changed, 109 insertions(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index b6f28cf3ee52..65342e6a4df8 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -377,6 +377,10 @@ static const struct format_desc_struct {
 	  .pixman_id = PIXMAN_rgba_float,
 	  .num_planes = 1, .plane_bpp = { 128 },
 	},
+	{ .name = "R1", .depth = -1, .drm_id = DRM_FORMAT_R1,
+		.cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
+		.num_planes=1, .plane_bpp = { 1 },
+	},
 };
 #define for_each_format(f)	\
 	for (f = format_desc; f - format_desc < ARRAY_SIZE(format_desc); f++)
@@ -3572,6 +3576,51 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
 	}
 }
 
+static void convert_r1_to_rgb24(struct fb_convert *cvt)
+{
+	const struct format_desc_struct *src_fmt =
+		lookup_drm_format(cvt->src.fb->drm_format);
+	uint8_t *buf;
+	int i, j;
+	unsigned int rgb24_stride = cvt->dst.fb->strides[0];
+	unsigned int gray_stride = cvt->src.fb->strides[0];
+	uint8_t *rgb24 = cvt->dst.ptr;
+	uint8_t *gray = cvt->src.ptr;
+	igt_assert(cvt->dst.fb->drm_format == DRM_FORMAT_XRGB8888 &&
+		   cvt->src.fb->drm_format == DRM_FORMAT_R1);
+
+	buf = convert_src_get(cvt);
+	for (i = 0; i < cvt->dst.fb->height; i++) {
+		uint8_t *rgb_tmp = rgb24;
+		uint8_t *gray_tmp = gray;
+		size_t bit_offset = 0;
+
+		for (j = 0; j < cvt->dst.fb->width; j++) {
+			struct igt_vec4 rgb;
+			float v = 0.0f;
+			if (*gray_tmp & (0x1 << bit_offset)) {
+				v = 1.0f;
+			}
+
+			rgb.d[0] = v;
+			rgb.d[1] = v;
+			rgb.d[2] = v;
+			rgb.d[3] = 1.0f;
+			write_rgb(rgb_tmp, &rgb);
+
+			bit_offset += 1;
+			if (bit_offset >= 8) {
+				bit_offset = 0;
+				gray_tmp += 1;
+			}
+		}
+
+		rgb24 += rgb24_stride;
+		gray += gray_stride;
+	}
+	convert_src_put(cvt, buf);
+}
+
 static void convert_yuv_to_rgb24(struct fb_convert *cvt)
 {
 	const struct format_desc_struct *src_fmt =
@@ -3635,6 +3684,45 @@ static void convert_yuv_to_rgb24(struct fb_convert *cvt)
 	convert_src_put(cvt, buf);
 }
 
+static void convert_rgb24_to_r1(struct fb_convert *cvt)
+{
+	int i, j;
+	unsigned int rgb24_stride = cvt->src.fb->strides[0];
+	unsigned int gray_stride = cvt->dst.fb->strides[0];
+	uint8_t *gray = cvt->dst.ptr;
+	uint8_t *rgb24 = cvt->src.ptr;
+	igt_assert(cvt->src.fb->drm_format == DRM_FORMAT_XRGB8888 &&
+		   cvt->dst.fb->drm_format == DRM_FORMAT_R1);
+
+	for (i = 0; i < cvt->dst.fb->height; i++) {
+		uint8_t *rgb_tmp = rgb24;
+		uint8_t *gray_tmp = gray;
+		size_t bit_offset = 0;
+
+		for (j = 0; j < cvt->dst.fb->width; j++) {
+			struct igt_vec4 rgb;
+			uint8_t val = 0;
+			read_rgb(&rgb, rgb_tmp);
+			float mean = rgb.d[0] + rgb.d[1] + rgb.d[2];
+			if (mean >= (255.0 * 3.0) / 2.0) {
+				val = 1;
+			}
+			*gray_tmp |= (*gray_tmp & 0x1 << bit_offset) | val << bit_offset;
+
+			bit_offset += 1;
+			if (bit_offset >= 8) {
+				bit_offset = 0;
+				gray_tmp += 1;
+			}
+			rgb_tmp += 4;
+		}
+
+
+		rgb24 += rgb24_stride;
+		gray += gray_stride;
+	}
+}
+
 static void convert_rgb24_to_yuv(struct fb_convert *cvt)
 {
 	const struct format_desc_struct *dst_fmt =
@@ -4255,6 +4343,9 @@ static void fb_convert(struct fb_convert *cvt)
 		case DRM_FORMAT_YVYU:
 			convert_yuv_to_rgb24(cvt);
 			return;
+		case DRM_FORMAT_R1:
+			convert_r1_to_rgb24(cvt);
+			return;
 		}
 	} else if (cvt->src.fb->drm_format == DRM_FORMAT_XRGB8888) {
 		switch (cvt->dst.fb->drm_format) {
@@ -4275,6 +4366,9 @@ static void fb_convert(struct fb_convert *cvt)
 		case DRM_FORMAT_YVYU:
 			convert_rgb24_to_yuv(cvt);
 			return;
+		case DRM_FORMAT_R1:
+			convert_rgb24_to_r1(cvt);
+			return;
 		}
 	} else if (cvt->dst.fb->drm_format == IGT_FORMAT_FLOAT) {
 		switch (cvt->src.fb->drm_format) {
@@ -4874,6 +4968,17 @@ bool igt_format_is_yuv(uint32_t drm_format)
 	}
 }
 
+bool igt_format_is_black_white(uint32_t drm_format)
+{
+	switch (drm_format) {
+	case DRM_FORMAT_R1:
+	case DRM_FORMAT_D1:
+		return true;
+	default:
+		return false;
+	}
+}
+
 /**
  * igt_format_is_fp16
  * @drm_format: drm fourcc
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index 834aaef54dea..a4315233eb7e 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -214,6 +214,7 @@ uint32_t igt_drm_format_to_bpp(uint32_t drm_format);
 const char *igt_format_str(uint32_t drm_format);
 bool igt_fb_supported_format(uint32_t drm_format);
 bool igt_format_is_yuv(uint32_t drm_format);
+bool igt_format_is_black_white(uint32_t drm_format);
 bool igt_format_is_yuv_semiplanar(uint32_t format);
 
 uint32_t igt_drm_format_str_to_format(const char *drm_format);
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index bb8229124b8c..2baaeef7bbc8 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1091,6 +1091,9 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 		    f.modifier == ref.modifier)
 			continue;
 
+		if (igt_format_is_black_white(f.format))
+			continue;
+
 		/* test each format "class" only once in non-extended tests */
 		if (!data->extended && f.modifier != DRM_FORMAT_MOD_LINEAR) {
 			struct format_mod rf = {

-- 
2.43.0

