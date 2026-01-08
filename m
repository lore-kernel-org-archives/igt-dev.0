Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81682D1D47D
	for <igt-dev@archiver.kernel.org>; Thu,  8 Jan 2026 15:28:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3145210E357;
	Thu,  8 Jan 2026 15:28:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ypj0ONiX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D08A10E357
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jan 2026 15:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767886096; x=1799422096;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tp1B4pAI5wjlF6LonhBEpuQ9W7gK7fj1dB+lvIv33yU=;
 b=Ypj0ONiXFQOTLUYhZxq2RJNZWWRQQ7OMW1nzhJQiT+NxsdUfrzgYnDNW
 rRdCvuL6Ujpt9foqQdM+cyDZ+azLuSxLs0TQiQ2TQL7FoAx0cRIObYmDM
 pqKBRi6RDyGmGZujV8Dx/f0UZKiI9xuJWAYF3CfcSSXIwkrEqAO77USS8
 6/rY8u5sCBWB/JAuTggkQYmoFHVPSApnJEN0zNi6BPX96chcU/9jIO+Pk
 LRW7GfjIPBS/N50I9Jvd4vOnC0wiFkZFKR2SnspvWwo+YyjVejVgbJS+/
 P6iWifvHTIJFwYO/6ngxpM9o8iNdU9K+e/Km1/qEYsUfofmmAaVGx1FkZ g==;
X-CSE-ConnectionGUID: XnCMK7g/TwWTuP+/jY/utg==
X-CSE-MsgGUID: p18WgHtISyG2XjJKse9SsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="80374878"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="80374878"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 07:28:15 -0800
X-CSE-ConnectionGUID: CSoNYaYGQT2NFcZ2D6gBuw==
X-CSE-MsgGUID: whRqe35LTyWlQt2s3XIYBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="234402872"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 07:28:14 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, swati2.sharma@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v5 1/6] tests/kms_writeback: Add support for
 intel-specific formats
Date: Thu,  8 Jan 2026 21:18:12 +0530
Message-ID: <20260108154817.48665-2-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260108154817.48665-1-sowmiya.s@intel.com>
References: <20260108154817.48665-1-sowmiya.s@intel.com>
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

Integrate BGR formats supported by intel
into the supported format list and verify
format before test execution.

v4: Reframe commit message. (Suraj)

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_writeback.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 0b968baa2..691774777 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -90,6 +90,15 @@ static data_t data;
 enum {
 	XRGB8888 = 1 << 0,
 	XRGB2101010 = 1 << 1,
+	XBGR8888 = 1 << 2,
+	XBGR2101010 = 1 << 3,
+};
+
+const uint32_t fourcc[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XRGB2101010,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_XBGR2101010,
 };
 
 static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
@@ -101,11 +110,6 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 	int width, height, ret;
 	uint16_t i;
 
-	const uint32_t fourcc[] = {
-		DRM_FORMAT_XRGB8888,
-		DRM_FORMAT_XRGB2101010,
-	};
-
 	igt_output_override_mode(output, &override_mode);
 
 	width = override_mode.hdisplay;
@@ -299,7 +303,10 @@ static void fill_fb(igt_fb_t *fb, uint32_t pixel)
 	uint32_t *ptr;
 	int64_t pixel_count, i;
 
-	igt_assert(fb->drm_format == DRM_FORMAT_XRGB8888 || fb->drm_format == DRM_FORMAT_XRGB2101010);
+	igt_assert(fb->drm_format == DRM_FORMAT_XRGB8888 ||
+		   fb->drm_format == DRM_FORMAT_XRGB2101010 ||
+		   fb->drm_format == DRM_FORMAT_XBGR8888 ||
+		   fb->drm_format == DRM_FORMAT_XBGR2101010);
 
 	ptr = igt_fb_map_buffer(fb->fd, fb);
 	igt_assert(ptr);
@@ -334,7 +341,8 @@ static void writeback_sequence(igt_output_t *output, igt_plane_t *plane,
 	uint32_t clear_color = 0xffffffff;
 	igt_crc_t cleared_crc, out_expected;
 
-	if (fourcc_color == DRM_FORMAT_XRGB2101010)
+	if (fourcc_color == DRM_FORMAT_XRGB2101010 ||
+	    fourcc_color == DRM_FORMAT_XBGR2101010)
 		in_fb_colors = in_fb_colors_10bits;
 	else
 		in_fb_colors = in_fb_colors_8bits;
@@ -420,7 +428,12 @@ static void writeback_check_output(igt_output_t *output, igt_plane_t *plane,
 static void do_single_commit(igt_output_t *output, igt_plane_t *plane, igt_fb_t *in_fb,
 			      igt_fb_t *out_fb)
 {
-	uint32_t in_fb_color = 0xffff0000;
+	uint32_t in_fb_color;
+
+	if (data.format == DRM_FORMAT_XRGB8888 || data.format == DRM_FORMAT_XBGR8888)
+		in_fb_color = 0xffff0000;
+	else
+		in_fb_color = 0x3ff00000;
 
 	fill_fb(in_fb, in_fb_color);
 
-- 
2.43.0

