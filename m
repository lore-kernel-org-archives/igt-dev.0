Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCDFD1266D
	for <igt-dev@archiver.kernel.org>; Wed,  3 Dec 2025 09:24:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A4D010E2D5;
	Wed,  3 Dec 2025 09:24:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jeMunMcu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D2E10E2D5
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Dec 2025 09:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764753895; x=1796289895;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=plyOPSVoFUPTWu4IfRmcbNXGPLQKcUJVmFojCvPTQ1M=;
 b=jeMunMcuHHLuGnoPzSn13iQpoivAUnSP2rOrXhl0cp/kFA8AOOVpH4pK
 9b6j0FdAfbL5CLDp+QmltcJlARegj2UPQG6DYgSjb/ZzDdZon5EqWgY2F
 Zt4f3ldhusT4HIH/aXSfgM/x8dPihH0AytuuCmeXKX2Mh3al0SXfJ+fuU
 FWoKzJoZZlrgVes2QxIWhw3qeYEPwzhDOf09ic9rdSFF7rINU6zh3V64W
 oASwWEb5PY/VHW1Ls4dlHqzKr2VJ72rbUcdaNbC1ouY3YAlXVTIVDc4ov
 tKmPQEpNaRe3QfOWN0t/RbLwX760V2Ca58wpuMs39ZekIxsOzgznHgYab g==;
X-CSE-ConnectionGUID: M/5rrtNxSFKZ47+XbjHjVg==
X-CSE-MsgGUID: WD5nB9g9S7aKSDEPotMDQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66783629"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="66783629"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 01:24:54 -0800
X-CSE-ConnectionGUID: qNV6PwjjTxKLtxLU3t3daA==
X-CSE-MsgGUID: CJYZzyDkST2YHOZjp8USGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="199569579"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 01:24:53 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v4 1/6] tests/kms_writeback: Add support for
 intel-specific formats
Date: Wed,  3 Dec 2025 15:13:02 +0530
Message-ID: <20251203094307.3187669-2-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251203094307.3187669-1-sowmiya.s@intel.com>
References: <20251203094307.3187669-1-sowmiya.s@intel.com>
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

v4: Reframe commit message.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_writeback.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 2fdb5bc16..15917d2e1 100644
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
@@ -298,7 +302,10 @@ static void fill_fb(igt_fb_t *fb, uint32_t pixel)
 	uint32_t *ptr;
 	int64_t pixel_count, i;
 
-	igt_assert(fb->drm_format == DRM_FORMAT_XRGB8888 || fb->drm_format == DRM_FORMAT_XRGB2101010);
+	igt_assert(fb->drm_format == DRM_FORMAT_XRGB8888 ||
+		   fb->drm_format == DRM_FORMAT_XRGB2101010 ||
+		   fb->drm_format == DRM_FORMAT_XBGR8888 ||
+		   fb->drm_format == DRM_FORMAT_XBGR2101010);
 
 	ptr = igt_fb_map_buffer(fb->fd, fb);
 	igt_assert(ptr);
@@ -333,7 +340,8 @@ static void writeback_sequence(igt_output_t *output, igt_plane_t *plane,
 	uint32_t clear_color = 0xffffffff;
 	igt_crc_t cleared_crc, out_expected;
 
-	if (fourcc_color == DRM_FORMAT_XRGB2101010)
+	if (fourcc_color == DRM_FORMAT_XRGB2101010 ||
+	    fourcc_color == DRM_FORMAT_XBGR2101010)
 		in_fb_colors = in_fb_colors_10bits;
 	else
 		in_fb_colors = in_fb_colors_8bits;
@@ -419,7 +427,12 @@ static void writeback_check_output(igt_output_t *output, igt_plane_t *plane,
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

