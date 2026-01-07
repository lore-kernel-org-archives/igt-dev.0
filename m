Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB882CF6C1B
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 09:27:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B89010E57D;
	Wed,  7 Jan 2026 09:27:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cDAz7imq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0581710E579
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 09:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767778043; x=1799314043;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RYdpIfMCK7jCLMJ2lUSrti26gKXQAQtWa7fWnttdEbg=;
 b=cDAz7imqqp7zoprI36SAV0aNBv0tlE1MxTXDBwBUKVEIwaODnyWBFQMa
 DcJL6FmJmbYtjDUHdp0/xW3dOx1A3/nH3N/pLvBDiITymNAat8xsPwGd3
 7WuXiWr+xit6KizrnyWNB3qHFuO4vFtCYYej4HpyGh0AhhwAZnhUcpd5V
 KCvsjTZizJn0Ammeg7wqpK3NzBfzkvIJy332PeKPGdM+X2Pyz5R5gVX6u
 LsTt+25B6nE9E+cyMVpohpzIyPOHMY8ofF1XEvI7tceW+sbGbuPtpJrml
 K2vlli4G5S8u/t60858iiRAhSHPXlDzA6W7j6NIbldPxMxDqoa5XZOIZJ Q==;
X-CSE-ConnectionGUID: /ccx/ihxTguDitj/TlYAAQ==
X-CSE-MsgGUID: FZzBMVAySp6sAuEQ6OeNVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="68337798"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="68337798"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 01:27:22 -0800
X-CSE-ConnectionGUID: NVv/mjJgREarufl+mFHwQQ==
X-CSE-MsgGUID: hmuGtTAvRzCNeUjqg1Q5Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="207412577"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 01:27:21 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pranay Samala <pranay.samala@intel.com>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>
Subject: [PATCH i-g-t,
 v2 5/7] tests/intel/kms_frontbuffer_tracking: Add FBC support to FP16
 formats
Date: Wed,  7 Jan 2026 15:05:33 +0530
Message-Id: <20260107093535.70116-6-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260107093535.70116-1-swati2.sharma@intel.com>
References: <20260107093535.70116-1-swati2.sharma@intel.com>
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

From: Pranay Samala <pranay.samala@intel.com>

Add FBC support to FP16 formats.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 58 +++++++++++++++++++++++---
 1 file changed, 53 insertions(+), 5 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index f2e7c72f6..dee3e898f 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -411,6 +411,8 @@
  *
  * @rgb101010:      FORMAT_RGB101010
  * @rgb565:         FORMAT_RGB565
+ * @argb161616f:    FORMAT_ARGB161616F
+ * @abgr161616f:    FORMAT_ABGR161616F
  *
  * arg[2]:
  *
@@ -444,6 +446,8 @@
  *
  * @rgb101010:      FORMAT_RGB101010
  * @rgb565:         FORMAT_RGB565
+ * @argb161616f:    FORMAT_ARGB161616F
+ * @abgr161616f:    FORMAT_ABGR161616F
  *
  * arg[2]:
  *
@@ -865,6 +869,8 @@ struct test_mode {
 		FORMAT_RGB888 = 0,
 		FORMAT_RGB565,
 		FORMAT_RGB101010,
+		FORMAT_ARGB161616F,
+		FORMAT_ABGR161616F,
 		FORMAT_COUNT,
 		FORMAT_DEFAULT = FORMAT_RGB888,
 	} format;
@@ -909,7 +915,7 @@ struct rect {
 	int y;
 	int w;
 	int h;
-	uint32_t color;
+	uint64_t color;
 };
 
 struct {
@@ -1277,6 +1283,22 @@ static void create_fb(enum pixel_format pformat, int width, int height,
 		else
 			format = DRM_FORMAT_XRGB8888;
 		break;
+	case FORMAT_ARGB161616F:
+		if (plane == PLANE_PRI)
+			format = DRM_FORMAT_ARGB16161616F;
+		else if (plane == PLANE_CUR)
+			format = DRM_FORMAT_ARGB8888;
+		else
+			format = DRM_FORMAT_ARGB16161616F;
+		break;
+	case FORMAT_ABGR161616F:
+		if (plane == PLANE_PRI)
+			format = DRM_FORMAT_ABGR16161616F;
+		else if (plane == PLANE_CUR)
+			format = DRM_FORMAT_ARGB8888;
+		else
+			format = DRM_FORMAT_ABGR16161616F;
+		break;
 	default:
 		igt_assert(false);
 	}
@@ -1288,9 +1310,9 @@ static void create_fb(enum pixel_format pformat, int width, int height,
 	igt_create_fb(drm.fd, width, height, format, modifier, fb);
 }
 
-static uint32_t pick_color(struct igt_fb *fb, enum color ecolor)
+static uint64_t pick_color(struct igt_fb *fb, enum color ecolor)
 {
-	uint32_t color, r, g, b, b2, a;
+	uint64_t color, r, g, b, b2, a;
 	bool alpha = false;
 
 	switch (fb->drm_format) {
@@ -1319,6 +1341,22 @@ static uint32_t pick_color(struct igt_fb *fb, enum color ecolor)
 		b = 0x3FF;
 		b2 = 0x200;
 		break;
+	case DRM_FORMAT_ARGB16161616F:
+		alpha = true;
+		a = 0x3C00ULL << 48;
+		r = 0x3C00ULL << 32;
+		g = 0x3C00ULL << 16;
+		b = 0x3C00ULL;
+		b2 = 0x3800ULL;
+		break;
+	case DRM_FORMAT_ABGR16161616F:
+		alpha = true;
+		a = 0x3C00ULL << 48;
+		b = 0x3C00ULL << 32;
+		g = 0x3C00ULL << 16;
+		r = 0x3C00ULL;
+		b2 = 0x3800ULL;
+		break;
 	default:
 		igt_assert(false);
 	}
@@ -1838,7 +1876,7 @@ static void fill_fb_region(struct fb_region *region,
 			   enum igt_draw_method method,
 			   enum color ecolor)
 {
-	uint32_t color = pick_color(region->fb, ecolor);
+	uint64_t color = pick_color(region->fb, ecolor);
 
 	igt_draw_rect_fb(drm.fd, drm.bops, 0, region->fb, method,
 			 region->x, region->y, region->w, region->h,
@@ -2474,7 +2512,7 @@ static void set_region_for_test(const struct test_mode *t,
 static void set_plane_for_test_fbc(const struct test_mode *t, igt_plane_t *plane)
 {
 	struct igt_fb fb;
-	uint32_t color;
+	uint64_t color;
 
 	igt_info("Testing fbc on plane %i%s\n", plane->index + 1, kmstest_pipe_name(prim_mode_params.pipe));
 
@@ -2950,6 +2988,9 @@ static bool format_is_valid(int feature_flags,
 		return true;
 	case FORMAT_RGB101010:
 		return false;
+	case FORMAT_ARGB161616F:
+	case FORMAT_ABGR161616F:
+		return true;
 	default:
 		igt_assert(false);
 	}
@@ -4021,6 +4062,10 @@ static const char *format_str(enum pixel_format format)
 		return "rgb565";
 	case FORMAT_RGB101010:
 		return "rgb101010";
+	case FORMAT_ARGB161616F:
+		return "argb161616f";
+	case FORMAT_ABGR161616F:
+		return "abgr161616f";
 	default:
 		igt_assert(false);
 	}
@@ -4367,6 +4412,9 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
 				      format_str(t.format),
 				      igt_draw_get_method_name(t.method))
 			{
+				if (t.format == FORMAT_ARGB161616F ||
+				    t.format == FORMAT_ABGR161616F)
+					igt_require(drm.display_ver >= 35);
 				igt_require(igt_draw_supports_method(drm.fd, t.method));
 				format_draw_subtest(&t);
 			}
-- 
2.25.1

