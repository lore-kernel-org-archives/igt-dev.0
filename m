Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD69EEE273
	for <igt-dev@archiver.kernel.org>; Fri, 13 Sep 2024 00:49:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECFEB10EC5E;
	Fri, 13 Sep 2024 00:49:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="f8nEB4CU";
	dkim-atps=neutral
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D75310EC5E
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2024 00:49:56 +0000 (UTC)
Received: from mx0.riseup.net (mx0-pn.riseup.net [10.0.1.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4X4b7P39K5zDqsr
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2024 00:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1726188017; bh=bD5dq3XG/f4mXXGYZ5YGH20i5lEr6sQKl3XIuNc5T/4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=f8nEB4CUsBcR9GAkAu9pXTspJT1CUirP/lzb1qqapfsp6h6q9qVmJK+W9cYUZcfu/
 SLXZgcQbiH9DPgv2NLV2v2rOGCh3tfJLpko2RgIrKm54HiTU13Ii63dRZQzaEhF/Ln
 vw1bhXPCP/1rNcnVSbOagg2fps8CDvDY863v4/XQ=
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4X4b7P0hdHz9tLw;
 Fri, 13 Sep 2024 00:40:17 +0000 (UTC)
X-Riseup-User-ID: 560465E1867200BE85C5B20FBBF9A026FBDAD51C74CA1FC40FDD55266DAA0AD0
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4X4b7L56qNzFrsx;
 Fri, 13 Sep 2024 00:40:14 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Thu, 12 Sep 2024 21:39:36 -0300
Subject: [PATCH i-g-t v6 12/12] lib/igt_fb: Add non sub-sampled YUV formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240912-kms_fb_stress-dev-v6-12-71e9a65397e9@riseup.net>
References: <20240912-kms_fb_stress-dev-v6-0-71e9a65397e9@riseup.net>
In-Reply-To: <20240912-kms_fb_stress-dev-v6-0-71e9a65397e9@riseup.net>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Arthur Grillo <arthurgrillo@riseup.net>
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

This adds support for the formats:
- NV24
- NV42
- YU24
- YU42

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 lib/igt_fb.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 7f87d40ed3d6..b1301d08d9f8 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -257,6 +257,16 @@ static const struct format_desc_struct {
 	  .num_planes = 2, .plane_bpp = { 8, 16, },
 	  .hsub = 2, .vsub = 2,
 	},
+	{ .name = "NV24", .depth = -1, .drm_id = DRM_FORMAT_NV24,
+	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
+	  .num_planes = 2, .plane_bpp = { 8, 16, },
+	  .hsub = 1, .vsub = 1,
+	},
+	{ .name = "NV42", .depth = -1, .drm_id = DRM_FORMAT_NV42,
+	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
+	  .num_planes = 2, .plane_bpp = { 8, 16, },
+	  .hsub = 1, .vsub = 1,
+	},
 	{ .name = "NV61", .depth = -1, .drm_id = DRM_FORMAT_NV61,
 	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
 	  .num_planes = 2, .plane_bpp = { 8, 16, },
@@ -292,6 +302,11 @@ static const struct format_desc_struct {
 	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
 	  .hsub = 2, .vsub = 1,
 	},
+	{ .name = "YU24", .depth = -1, .drm_id = DRM_FORMAT_YUV444,
+	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
+	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
+	  .hsub = 1, .vsub = 1,
+	},
 	{ .name = "YV12", .depth = -1, .drm_id = DRM_FORMAT_YVU420,
 	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
 	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
@@ -302,6 +317,11 @@ static const struct format_desc_struct {
 	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
 	  .hsub = 2, .vsub = 1,
 	},
+	{ .name = "YV24", .depth = -1, .drm_id = DRM_FORMAT_YVU444,
+	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
+	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
+	  .hsub = 1, .vsub = 1,
+	},
 	{ .name = "Y410", .depth = -1, .drm_id = DRM_FORMAT_Y410,
 	  .cairo_id = CAIRO_FORMAT_RGBA128F, .convert = true,
 	  .num_planes = 1, .plane_bpp = { 32, },
@@ -1166,8 +1186,10 @@ static void clear_yuv_buffer(struct igt_fb *fb)
 		break;
 	case DRM_FORMAT_YUV420:
 	case DRM_FORMAT_YUV422:
+	case DRM_FORMAT_YUV444:
 	case DRM_FORMAT_YVU420:
 	case DRM_FORMAT_YVU422:
+	case DRM_FORMAT_YVU444:
 		igt_assert(ARRAY_SIZE(plane_size) == 3);
 		memset(ptr + fb->offsets[0],
 		       full_range ? 0x00 : 0x10,
@@ -3495,6 +3517,8 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
 	case DRM_FORMAT_NV12:
 	case DRM_FORMAT_NV16:
 	case DRM_FORMAT_NV21:
+	case DRM_FORMAT_NV24:
+	case DRM_FORMAT_NV42:
 	case DRM_FORMAT_NV61:
 	case DRM_FORMAT_P010:
 	case DRM_FORMAT_P012:
@@ -3505,8 +3529,10 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
 
 	case DRM_FORMAT_YUV420:
 	case DRM_FORMAT_YUV422:
+	case DRM_FORMAT_YUV444:
 	case DRM_FORMAT_YVU420:
 	case DRM_FORMAT_YVU422:
+	case DRM_FORMAT_YVU444:
 		params->ay_inc = 1;
 		params->uv_inc = 1;
 		break;
@@ -3536,11 +3562,15 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
 	case DRM_FORMAT_NV12:
 	case DRM_FORMAT_NV16:
 	case DRM_FORMAT_NV21:
+	case DRM_FORMAT_NV24:
+	case DRM_FORMAT_NV42:
 	case DRM_FORMAT_NV61:
 	case DRM_FORMAT_YUV420:
 	case DRM_FORMAT_YUV422:
+	case DRM_FORMAT_YUV444:
 	case DRM_FORMAT_YVU420:
 	case DRM_FORMAT_YVU422:
+	case DRM_FORMAT_YVU444:
 	case DRM_FORMAT_P010:
 	case DRM_FORMAT_P012:
 	case DRM_FORMAT_P016:
@@ -3568,12 +3598,14 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
 	switch (fb->drm_format) {
 	case DRM_FORMAT_NV12:
 	case DRM_FORMAT_NV16:
+	case DRM_FORMAT_NV24:
 		params->y_offset = fb->offsets[0];
 		params->u_offset = fb->offsets[1];
 		params->v_offset = fb->offsets[1] + 1;
 		break;
 
 	case DRM_FORMAT_NV21:
+	case DRM_FORMAT_NV42:
 	case DRM_FORMAT_NV61:
 		params->y_offset = fb->offsets[0];
 		params->u_offset = fb->offsets[1] + 1;
@@ -3582,6 +3614,7 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
 
 	case DRM_FORMAT_YUV420:
 	case DRM_FORMAT_YUV422:
+	case DRM_FORMAT_YUV444:
 		params->y_offset = fb->offsets[0];
 		params->u_offset = fb->offsets[1];
 		params->v_offset = fb->offsets[2];
@@ -3589,6 +3622,7 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
 
 	case DRM_FORMAT_YVU420:
 	case DRM_FORMAT_YVU422:
+	case DRM_FORMAT_YVU444:
 		params->y_offset = fb->offsets[0];
 		params->u_offset = fb->offsets[2];
 		params->v_offset = fb->offsets[1];
@@ -4322,14 +4356,18 @@ static void fb_convert(struct fb_convert *cvt)
 		case DRM_FORMAT_NV12:
 		case DRM_FORMAT_NV16:
 		case DRM_FORMAT_NV21:
+		case DRM_FORMAT_NV24:
+		case DRM_FORMAT_NV42:
 		case DRM_FORMAT_NV61:
 		case DRM_FORMAT_UYVY:
 		case DRM_FORMAT_VYUY:
 		case DRM_FORMAT_YUV420:
 		case DRM_FORMAT_YUV422:
+		case DRM_FORMAT_YUV444:
 		case DRM_FORMAT_YUYV:
 		case DRM_FORMAT_YVU420:
 		case DRM_FORMAT_YVU422:
+		case DRM_FORMAT_YVU444:
 		case DRM_FORMAT_YVYU:
 			convert_yuv_to_rgb24(cvt);
 			return;
@@ -4340,14 +4378,18 @@ static void fb_convert(struct fb_convert *cvt)
 		case DRM_FORMAT_NV12:
 		case DRM_FORMAT_NV16:
 		case DRM_FORMAT_NV21:
+		case DRM_FORMAT_NV24:
+		case DRM_FORMAT_NV42:
 		case DRM_FORMAT_NV61:
 		case DRM_FORMAT_UYVY:
 		case DRM_FORMAT_VYUY:
 		case DRM_FORMAT_YUV420:
 		case DRM_FORMAT_YUV422:
+		case DRM_FORMAT_YUV444:
 		case DRM_FORMAT_YUYV:
 		case DRM_FORMAT_YVU420:
 		case DRM_FORMAT_YVU422:
+		case DRM_FORMAT_YVU444:
 		case DRM_FORMAT_YVYU:
 			convert_rgb24_to_yuv(cvt);
 			return;
@@ -4921,11 +4963,15 @@ bool igt_format_is_yuv(uint32_t drm_format)
 	case DRM_FORMAT_NV12:
 	case DRM_FORMAT_NV16:
 	case DRM_FORMAT_NV21:
+	case DRM_FORMAT_NV24:
+	case DRM_FORMAT_NV42:
 	case DRM_FORMAT_NV61:
 	case DRM_FORMAT_YUV420:
 	case DRM_FORMAT_YUV422:
+	case DRM_FORMAT_YUV444:
 	case DRM_FORMAT_YVU420:
 	case DRM_FORMAT_YVU422:
+	case DRM_FORMAT_YVU444:
 	case DRM_FORMAT_P010:
 	case DRM_FORMAT_P012:
 	case DRM_FORMAT_P016:

-- 
2.46.0

