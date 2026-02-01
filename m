Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3EBE8305D
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 08:00:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F1410E54C;
	Tue,  3 Feb 2026 08:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=foxmail.com header.i=@foxmail.com header.b="YaN6qb/A";
	dkim-atps=neutral
X-Greylist: delayed 1814 seconds by postgrey-1.36 at gabe;
 Sun, 01 Feb 2026 03:17:13 UTC
Received: from out203-205-221-240.mail.qq.com (out203-205-221-240.mail.qq.com
 [203.205.221.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F3710E009
 for <igt-dev@lists.freedesktop.org>; Sun,  1 Feb 2026 03:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1769915830;
 bh=zTlUCWeRK2FU+unX1x6WRCY8IdqLeOH6/7kTZJKr4O0=;
 h=From:To:Cc:Subject:Date;
 b=YaN6qb/A08f9QgoyaUeukl7Q7IbnOFvIaiRik3x9id3nvzj9sgQj3RgpXpkdjbLbA
 03djqk9b6djf5M5FfpCkykA8ISn8RezBuxMNsv8VImricrKt6x/9e8D/1DEYxjm6Q8
 bxPC7ulO3zKD0TtzXNrQUpkIvtzXmrRecMQDb7NY=
Received: from localhost.localdomain ([171.223.89.62])
 by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
 id B718B213; Sun, 01 Feb 2026 10:45:49 +0800
X-QQ-mid: xmsmtpt1769913949tza2dio7n
Message-ID: <tencent_C9CEB3AD0E497CB0B666DD6B2E9389C56708@qq.com>
X-QQ-XMAILINFO: ORmE8plt8QkE2X03U9q/xgpGxjekmbNX36HLj10XWAu3Ll8DrGGx2GxdJMmX3j
 yfaPrpOUR33xEmchhulxKTuDtQROEuTAF/oaY9ZxzZTB/bwUluEJsSteg3g2LZmbs0tYcccp5Y/P
 VNCQVS/XYHEOItUA13nGm3Y5IMJ2w7GHuh6uD0WeYQvoCd6l4+CNfyMjbIlYV3+C+kpITgELQ+Cz
 LUkvL1edq8wdadUc2W2vF4SKtJM+IPjuM5Ip3YLPJfGEfIH+h02p2h8wh4k4KfsTVW2lNVAQ9HfT
 rzGOiYfvZ5FhGe/Gs3Chrn+bsoHDUmWDz4+jdpd0oHTRx+P+HVQ+M9LQMOfz1DJCLwmtEt1eEq78
 V0TlXzgfxg0PfcChaJ0KFhu4Z42Sux23WzieVipV35seSg+7OVSHb1wvae1bYuMmDFImxVhnIm7a
 btmCY2pteddIR8f/n5XfXwyTu1haYxx6xRTVFg8XgW8l0tJQW9aC7dX1Zs4RjmKUS9o+G9FVIRsJ
 STvImoY0wMZqltXXdcPcXJXQbalUJrYH2c+qPycOHkvEOuIdllSY2GJ808aeRzJB3tbGHCtQ2lPL
 TUgB5N3MEEmtvyT3gkZ2pYqgQajpVytevdIxp/Iwz1DmLN393sgLMRQSEx0L4fabX9+x1648LoPx
 SVlZMmQ8K3yuTcTFE5nqkCTeKY1ZUdjkEYO6UQqm4RpshJaRSmibJikOD8T7pNQmOf/hVTWZpnle
 fqoDbtpjdMGBGbggWXL2QAMCBR1fl7k3iDNxoRFR6fpH1gkSop3syLPPFKxECDKLXfjsxLdpCaVM
 QFelzWLxvy8WhNQ+K/ZZa0qiJ10UXRp0gGmNDwhEX1p7RWGHHiep60BgK45mj9/ibc6mKRW/L6P0
 fM1ZDK+UJGZdMbKQDY9/iHqb3aY+54gYHbbiGue10Tg3oaMJKx8DbdPwYdwtIYQzgVfNbZa8DU2I
 SDryaeDxBB3ffX7ORFPUCuaUQHI+huOb+fNZaRJ8iHAsW2Wc/IIzv+2UNNHr2jor3XruIEDsv+j4
 28DhwLVAs3IUqJKATv9M0we4umr3QONj/7cOV/sQ==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Renjun Wang <renjunw0@foxmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Renjun Wang <renjunw0@foxmail.com>
Subject: [PATCH i-g-t] lib/igt_fb: add YUV410 YUV411 YUV444 YVU410 YVU411
 YVU444 formats
Date: Sun,  1 Feb 2026 10:45:42 +0800
X-OQ-MSGID: <20260201024542.16714-1-renjunw0@foxmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 03 Feb 2026 08:00:46 +0000
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

Add support for additional YUV format variants in framebuffer and color
encoding handling. Extend format descriptors, color encoding configuration,
YUV buffer clearing, parameter calculation, and format conversions to support
4:1:0, 4:1:1, and 4:4:4 chroma subsampling formats.

Signed-off-by: Renjun Wang <renjunw0@foxmail.com>
---
 lib/igt_color_encoding.c |  6 ++++
 lib/igt_fb.c             | 72 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/lib/igt_color_encoding.c b/lib/igt_color_encoding.c
index a7bd2b22f..da56b2b10 100644
--- a/lib/igt_color_encoding.c
+++ b/lib/igt_color_encoding.c
@@ -140,10 +140,16 @@ static const struct color_encoding_format {
 	{ DRM_FORMAT_NV16, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
 	{ DRM_FORMAT_NV21, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
 	{ DRM_FORMAT_NV61, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
+	{ DRM_FORMAT_YUV410, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
+	{ DRM_FORMAT_YUV411, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
 	{ DRM_FORMAT_YUV420, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
 	{ DRM_FORMAT_YUV422, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
+	{ DRM_FORMAT_YUV444, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
+	{ DRM_FORMAT_YVU410, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
+	{ DRM_FORMAT_YVU411, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
 	{ DRM_FORMAT_YVU420, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
 	{ DRM_FORMAT_YVU422, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
+	{ DRM_FORMAT_YVU444, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
 	{ DRM_FORMAT_YUYV, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
 	{ DRM_FORMAT_YVYU, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
 	{ DRM_FORMAT_UYVY, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index d59fe133b..fa9220953 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -282,6 +282,16 @@ static const struct format_desc_struct {
 	  .num_planes = 1, .plane_bpp = { 16, },
 	  .hsub = 2, .vsub = 1,
 	},
+	{ .name = "YU10", .depth = -1, .drm_id = DRM_FORMAT_YUV410,
+	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
+	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
+	  .hsub = 4, .vsub = 4,
+	},
+	{ .name = "YU11", .depth = -1, .drm_id = DRM_FORMAT_YUV411,
+	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
+	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
+	  .hsub = 4, .vsub = 1,
+	},
 	{ .name = "YU12", .depth = -1, .drm_id = DRM_FORMAT_YUV420,
 	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
 	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
@@ -292,6 +302,21 @@ static const struct format_desc_struct {
 	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
 	  .hsub = 2, .vsub = 1,
 	},
+	{ .name = "YU24", .depth = -1, .drm_id = DRM_FORMAT_YUV444,
+	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
+	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
+	  .hsub = 1, .vsub = 1,
+	},
+	{ .name = "YV10", .depth = -1, .drm_id = DRM_FORMAT_YVU410,
+	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
+	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
+	  .hsub = 4, .vsub = 4,
+	},
+	{ .name = "YV11", .depth = -1, .drm_id = DRM_FORMAT_YVU411,
+	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
+	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
+	  .hsub = 4, .vsub = 1,
+	},
 	{ .name = "YV12", .depth = -1, .drm_id = DRM_FORMAT_YVU420,
 	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
 	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
@@ -302,6 +327,11 @@ static const struct format_desc_struct {
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
@@ -1164,10 +1194,16 @@ static void clear_yuv_buffer(struct igt_fb *fb)
 			 full_range ? 0x800000008000ULL : 0x800010008000ULL,
 			 plane_size[0] / sizeof(uint64_t));
 		break;
+	case DRM_FORMAT_YUV410:
+	case DRM_FORMAT_YUV411:
 	case DRM_FORMAT_YUV420:
 	case DRM_FORMAT_YUV422:
+	case DRM_FORMAT_YUV444:
+	case DRM_FORMAT_YVU410:
+	case DRM_FORMAT_YVU411:
 	case DRM_FORMAT_YVU420:
 	case DRM_FORMAT_YVU422:
+	case DRM_FORMAT_YVU444:
 		igt_assert(ARRAY_SIZE(plane_size) == 3);
 		memset(ptr + fb->offsets[0],
 		       full_range ? 0x00 : 0x10,
@@ -3675,10 +3711,16 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
 		params->uv_inc = 2;
 		break;
 
+	case DRM_FORMAT_YUV410:
+	case DRM_FORMAT_YUV411:
 	case DRM_FORMAT_YUV420:
 	case DRM_FORMAT_YUV422:
+	case DRM_FORMAT_YUV444:
+	case DRM_FORMAT_YVU410:
+	case DRM_FORMAT_YVU411:
 	case DRM_FORMAT_YVU420:
 	case DRM_FORMAT_YVU422:
+	case DRM_FORMAT_YVU444:
 		params->ay_inc = 1;
 		params->uv_inc = 1;
 		break;
@@ -3709,10 +3751,16 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
 	case DRM_FORMAT_NV16:
 	case DRM_FORMAT_NV21:
 	case DRM_FORMAT_NV61:
+	case DRM_FORMAT_YUV410:
+	case DRM_FORMAT_YUV411:
 	case DRM_FORMAT_YUV420:
 	case DRM_FORMAT_YUV422:
+	case DRM_FORMAT_YUV444:
+	case DRM_FORMAT_YVU410:
+	case DRM_FORMAT_YVU411:
 	case DRM_FORMAT_YVU420:
 	case DRM_FORMAT_YVU422:
+	case DRM_FORMAT_YVU444:
 	case DRM_FORMAT_P010:
 	case DRM_FORMAT_P012:
 	case DRM_FORMAT_P016:
@@ -3752,15 +3800,21 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
 		params->v_offset = fb->offsets[1];
 		break;
 
+	case DRM_FORMAT_YUV410:
+	case DRM_FORMAT_YUV411:
 	case DRM_FORMAT_YUV420:
 	case DRM_FORMAT_YUV422:
+	case DRM_FORMAT_YUV444:
 		params->y_offset = fb->offsets[0];
 		params->u_offset = fb->offsets[1];
 		params->v_offset = fb->offsets[2];
 		break;
 
+	case DRM_FORMAT_YVU410:
+	case DRM_FORMAT_YVU411:
 	case DRM_FORMAT_YVU420:
 	case DRM_FORMAT_YVU422:
+	case DRM_FORMAT_YVU444:
 		params->y_offset = fb->offsets[0];
 		params->u_offset = fb->offsets[2];
 		params->v_offset = fb->offsets[1];
@@ -4497,11 +4551,17 @@ static void fb_convert(struct fb_convert *cvt)
 		case DRM_FORMAT_NV61:
 		case DRM_FORMAT_UYVY:
 		case DRM_FORMAT_VYUY:
+		case DRM_FORMAT_YUV410:
+		case DRM_FORMAT_YUV411:
 		case DRM_FORMAT_YUV420:
 		case DRM_FORMAT_YUV422:
+		case DRM_FORMAT_YUV444:
 		case DRM_FORMAT_YUYV:
+		case DRM_FORMAT_YVU410:
+		case DRM_FORMAT_YVU411:
 		case DRM_FORMAT_YVU420:
 		case DRM_FORMAT_YVU422:
+		case DRM_FORMAT_YVU444:
 		case DRM_FORMAT_YVYU:
 			convert_yuv_to_rgb24(cvt);
 			return;
@@ -4515,11 +4575,17 @@ static void fb_convert(struct fb_convert *cvt)
 		case DRM_FORMAT_NV61:
 		case DRM_FORMAT_UYVY:
 		case DRM_FORMAT_VYUY:
+		case DRM_FORMAT_YUV410:
+		case DRM_FORMAT_YUV411:
 		case DRM_FORMAT_YUV420:
 		case DRM_FORMAT_YUV422:
+		case DRM_FORMAT_YUV444:
 		case DRM_FORMAT_YUYV:
+		case DRM_FORMAT_YVU410:
+		case DRM_FORMAT_YVU411:
 		case DRM_FORMAT_YVU420:
 		case DRM_FORMAT_YVU422:
+		case DRM_FORMAT_YVU444:
 		case DRM_FORMAT_YVYU:
 			convert_rgb24_to_yuv(cvt);
 			return;
@@ -5095,9 +5161,15 @@ bool igt_format_is_yuv(uint32_t drm_format)
 	case DRM_FORMAT_NV21:
 	case DRM_FORMAT_NV61:
 	case DRM_FORMAT_YUV420:
+	case DRM_FORMAT_YUV410:
+	case DRM_FORMAT_YUV411:
 	case DRM_FORMAT_YUV422:
+	case DRM_FORMAT_YUV444:
 	case DRM_FORMAT_YVU420:
+	case DRM_FORMAT_YVU410:
+	case DRM_FORMAT_YVU411:
 	case DRM_FORMAT_YVU422:
+	case DRM_FORMAT_YVU444:
 	case DRM_FORMAT_P010:
 	case DRM_FORMAT_P012:
 	case DRM_FORMAT_P016:
-- 
2.47.3

