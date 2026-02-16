Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8D5E83821
	for <igt-dev@archiver.kernel.org>; Mon, 16 Feb 2026 18:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CFAA10E06E;
	Mon, 16 Feb 2026 18:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hYbdeLcz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2865310E06E
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Feb 2026 18:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771265782; x=1802801782;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=05UoUZ0yDCfYqfezHkXQiClIvrUauW93C20pyP2DqlE=;
 b=hYbdeLcztNzQVvdlnJDXSnvdKaa2WeU5hyglDz59T2UCkZEVkppB88WO
 Rzw7qx8/D9hOLwGcrkY1gNer0sAsQM4EZtGzqzqWJELhku7J33jtWtsX/
 5V9SaQx4hg1eIMAJcMPF18sFIWyNrZ1DsNoclNp4jNvOvvBhS6MVbwrX0
 FGk8mam/1ANMR6Pyi1Ar2dHHRFIQZBOutr9M1C7r4FFC5s9pHK3xdCrPk
 Xp6sY5HKzJYc4IL9iT7CzL85XdWk1qM9mYPoHcWjiA7X8zRr1yUQhhTtQ
 m7pIWICHJDBtNY2DYrnIUrbwPfOS+/ciLpnAWkmdzrNDsyeGpaCh9js9Y Q==;
X-CSE-ConnectionGUID: uQaQyECMTnG5MePc2S4oEw==
X-CSE-MsgGUID: RTdfA5msQC6XFStdVNbTKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="83448456"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="83448456"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 10:16:21 -0800
X-CSE-ConnectionGUID: Szx/WaSzROu32JFCBpOM+A==
X-CSE-MsgGUID: ERNG6UGvRq6XUEjA5anZMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="218205270"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.237])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 10:16:20 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Renjun Wang <renjunw0@foxmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] lib/igt_fb: add YUV|YVU-410|411|444 formats
Date: Mon, 16 Feb 2026 19:16:10 +0100
Message-ID: <20260216181610.129209-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.53.0
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

From: Renjun Wang <renjunw0@foxmail.com>

Add support for additional YUV and YVU format variants in
framebuffer and color encoding handling. Extend format
descriptors, color encoding configuration, YUV|YVU buffer
clearing, parameter calculation, and format conversions to
support 4:1:0, 4:1:1, and 4:4:4 chroma subsampling formats.

Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Renjun Wang <renjunw0@foxmail.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
Reformatted subject, added Cc [Kamil]

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
2.53.0

