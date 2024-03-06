Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBE1C5475B
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 17:28:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30AB113395;
	Wed,  6 Mar 2024 17:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="KYoGudeZ";
	dkim-atps=neutral
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CCC7113395
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 17:28:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B5724E000A;
 Wed,  6 Mar 2024 17:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709746124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tuNNbcbBjwGQ2TZo+A54PuAQErITp8+5JrQc3shbxA8=;
 b=KYoGudeZ++IROwO1qNXDYemyu2cKW4TJBRnvxo1gM+e5oy+oCJg3uGxxBypQDmmEG2VAA9
 KCvs1CZLtDAxXFcx6FzB+RjTcAb1xkVkOS2t4g3xGSCvpvNjTvBqPoBQgTzm0zi855Zi8q
 GJiAYZ7H8Abr67/HHCZubiFdV4oqtNjtAjT7f/YTyEKt0r4s4vb8zvZ4jjbjxbWppU17JL
 79S2uNup5FrTlCAvXQnmwlgKeYeiHaZmyf97llgNnN9SgldD07+Dc1LaU4IjCrxgX6cCwI
 QOgYWJg3tsWMBU5ZdqTnlY2lI4mX0xLN/nj8mEUziM24bJLNtsilxFmbOjcASA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 06 Mar 2024 18:28:38 +0100
Subject: [PATCH i-g-t 4/9] lib/color_encoding: Add support for NV24 and
 NV42 pixel formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240306-b4-kms_tests-v1-4-8fe451efd2ac@bootlin.com>
References: <20240306-b4-kms_tests-v1-0-8fe451efd2ac@bootlin.com>
In-Reply-To: <20240306-b4-kms_tests-v1-0-8fe451efd2ac@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: miquel.raynal@bootlin.com, jeremie.dautheribes@bootlin.com, 
 thomas.petazzoni@bootlin.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4699;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=mEwHjfxVlgtzisrpDQmnWbjBfCI67GjWw1fJS/fFXPE=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl6KfIwhP8DcJ6mWibdo+aX1a65LfCoKaeiiMfNBip
 flOJ6eKJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZeinyAAKCRAgrS7GWxAs4m5MD/
 4+E4t2EAa+GID8HvF+H5KP2DXhXkK4EiC2guky1bYEGf/mBDnKsV71JmGEMrdv0ieV5P6BMkM290x+
 DVEnIjVqBFWLNwBphfVGlvUaoiNI0OQEJ9OeHN5jiL84Ne5QEISoQ7QL5W8JxejE9889BshFOZqaaJ
 drbD5zrqTl/MW9mKD8MaNVij9b0rvxf26ufU5adpbgJJueGfYtOwmt8h+ANelat+gzGRLQw2fgz54K
 wKz/eK0u5BQTbE+WSHEgOLFz8fC9Otjq7tr5L771tjrwewluVqtE8sCbiyNuJ4fTsK1grTaOONqLXz
 l5l+50kJIvvy5F/3b3qDhDQLADnOX6aV79sl8fVyP+BWwVvG77HIGE2s2DTEgjvBh7VNazT4zU+F+W
 XXr+ZXoyck+woEhJKS3+ujvGJFGiJuVpfieqsgpwlJk21uAxzsN9kzYVHD7j9Q0/3ZREcK1d3x9hfb
 hEo98aRbBnhlcWHfvNREdfPP0GrS2LScxT4UhuR3+3olDVpD8BsQkvwyxFyXAr6Aiska8/A/Fnrbvh
 4jpE7asRv+BXXxVV7e7D/uggH0tUUY1REmUEmW/bzm1jbvvqrDi4vwhunIDUVb4bF+nma82lSIl+WQ
 F1X/zY1Z7iDozMGqfCnvVH+fhjsswoW5p0Z87wH2nkGMNRJwRiD8yzM0hhlg==
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

The current conversion algorithm is able to convert NV24 and NV42
formats. Add those format in the list so they can also be tested.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_color_encoding.c |  2 ++
 lib/igt_fb.c             | 22 ++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/lib/igt_color_encoding.c b/lib/igt_color_encoding.c
index a7bd2b22f73b..43105de34889 100644
--- a/lib/igt_color_encoding.c
+++ b/lib/igt_color_encoding.c
@@ -138,8 +138,10 @@ static const struct color_encoding_format {
 	{ IGT_FORMAT_FLOAT, 1.f, },
 	{ DRM_FORMAT_NV12, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
 	{ DRM_FORMAT_NV16, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
+	{ DRM_FORMAT_NV24, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
 	{ DRM_FORMAT_NV21, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
 	{ DRM_FORMAT_NV61, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
+	{ DRM_FORMAT_NV42, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
 	{ DRM_FORMAT_YUV420, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
 	{ DRM_FORMAT_YUV422, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
 	{ DRM_FORMAT_YVU420, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 0ac2a76b0c52..b6f28cf3ee52 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -252,6 +252,11 @@ static const struct format_desc_struct {
 	  .num_planes = 2, .plane_bpp = { 8, 16, },
 	  .hsub = 2, .vsub = 1,
 	},
+	{ .name = "NV24", .depth = -1, .drm_id = DRM_FORMAT_NV24,
+		.cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
+		.num_planes = 2, .plane_bpp = { 8, 16, },
+		.hsub = 1, .vsub = 1,
+	},
 	{ .name = "NV21", .depth = -1, .drm_id = DRM_FORMAT_NV21,
 	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
 	  .num_planes = 2, .plane_bpp = { 8, 16, },
@@ -262,6 +267,11 @@ static const struct format_desc_struct {
 	  .num_planes = 2, .plane_bpp = { 8, 16, },
 	  .hsub = 2, .vsub = 1,
 	},
+	{ .name = "NV42", .depth = -1, .drm_id = DRM_FORMAT_NV24,
+		.cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
+		.num_planes = 2, .plane_bpp = { 8, 16, },
+		.hsub = 1, .vsub = 1,
+	},
 	{ .name = "YUYV", .depth = -1, .drm_id = DRM_FORMAT_YUYV,
 	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
 	  .num_planes = 1, .plane_bpp = { 16, },
@@ -3398,8 +3408,10 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
 	switch (fb->drm_format) {
 	case DRM_FORMAT_NV12:
 	case DRM_FORMAT_NV16:
+	case DRM_FORMAT_NV24:
 	case DRM_FORMAT_NV21:
 	case DRM_FORMAT_NV61:
+	case DRM_FORMAT_NV42:
 	case DRM_FORMAT_P010:
 	case DRM_FORMAT_P012:
 	case DRM_FORMAT_P016:
@@ -3439,8 +3451,10 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
 	switch (fb->drm_format) {
 	case DRM_FORMAT_NV12:
 	case DRM_FORMAT_NV16:
+	case DRM_FORMAT_NV24:
 	case DRM_FORMAT_NV21:
 	case DRM_FORMAT_NV61:
+	case DRM_FORMAT_NV42:
 	case DRM_FORMAT_YUV420:
 	case DRM_FORMAT_YUV422:
 	case DRM_FORMAT_YVU420:
@@ -3472,6 +3486,7 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
 	switch (fb->drm_format) {
 	case DRM_FORMAT_NV12:
 	case DRM_FORMAT_NV16:
+	case DRM_FORMAT_NV24:
 		params->y_offset = fb->offsets[0];
 		params->u_offset = fb->offsets[1];
 		params->v_offset = fb->offsets[1] + 1;
@@ -3479,6 +3494,7 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
 
 	case DRM_FORMAT_NV21:
 	case DRM_FORMAT_NV61:
+	case DRM_FORMAT_NV42:
 		params->y_offset = fb->offsets[0];
 		params->u_offset = fb->offsets[1] + 1;
 		params->v_offset = fb->offsets[1];
@@ -4224,9 +4240,11 @@ static void fb_convert(struct fb_convert *cvt)
 		switch (cvt->src.fb->drm_format) {
 		case DRM_FORMAT_XYUV8888:
 		case DRM_FORMAT_NV12:
+		case DRM_FORMAT_NV24:
 		case DRM_FORMAT_NV16:
 		case DRM_FORMAT_NV21:
 		case DRM_FORMAT_NV61:
+		case DRM_FORMAT_NV42:
 		case DRM_FORMAT_UYVY:
 		case DRM_FORMAT_VYUY:
 		case DRM_FORMAT_YUV420:
@@ -4243,8 +4261,10 @@ static void fb_convert(struct fb_convert *cvt)
 		case DRM_FORMAT_XYUV8888:
 		case DRM_FORMAT_NV12:
 		case DRM_FORMAT_NV16:
+		case DRM_FORMAT_NV24:
 		case DRM_FORMAT_NV21:
 		case DRM_FORMAT_NV61:
+		case DRM_FORMAT_NV42:
 		case DRM_FORMAT_UYVY:
 		case DRM_FORMAT_VYUY:
 		case DRM_FORMAT_YUV420:
@@ -4823,8 +4843,10 @@ bool igt_format_is_yuv(uint32_t drm_format)
 	switch (drm_format) {
 	case DRM_FORMAT_NV12:
 	case DRM_FORMAT_NV16:
+	case DRM_FORMAT_NV24:
 	case DRM_FORMAT_NV21:
 	case DRM_FORMAT_NV61:
+	case DRM_FORMAT_NV42:
 	case DRM_FORMAT_YUV420:
 	case DRM_FORMAT_YUV422:
 	case DRM_FORMAT_YVU420:

-- 
2.43.0

