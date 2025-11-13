Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F25DCD4F57
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 08:18:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1685C10E358;
	Thu, 13 Nov 2025 08:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ARDV3AYA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 125A110E34C
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 08:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763021897; x=1794557897;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mUZTHL7Ok44ltkY3YvBWiwiZVxBexs2bX54EctI4Syw=;
 b=ARDV3AYAT+FIXdXkeO9KePEkfY4kRJufgZMQUS8Iaxq71iAF/lowOUNc
 CGqsQozlMsUGaEo8VFuHsXx2X7eurOw9K10EvPoIpgHZKCbx6nA/eNpN4
 AtHI1ABYAb5H9w8qlfbjxyMUi7zF6FAvQ46ePKMDb4d1A7CuO1KS47Bex
 0uagdyWwAIBv02MNKIFVcpyiMY7k7dPS6V18MAplyCByh/i7dnTMgPLq1
 75tRT58MbpRertHiQUYFIxxAcyaOsYwwT1TEMAtSGyrevgSzol75psjYP
 LwmLwFyP5qXB5VS8PPqGfthRbCaCi6ZnGDjYlpTf918sdOkaUnH8nZb7w w==;
X-CSE-ConnectionGUID: WlhavmG/SvumDfHOTgVQbw==
X-CSE-MsgGUID: InhtYaPwRxmO9XiTc0vOvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="65000523"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="65000523"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 00:18:17 -0800
X-CSE-ConnectionGUID: ZWgDuQXzRW+M3jTGoqMYfw==
X-CSE-MsgGUID: BC5L7DFYT0WrUHSadOsfCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="212822342"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 00:18:16 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v2 3/9] tests/kms_writeback: Validate supported formats
Date: Thu, 13 Nov 2025 14:05:49 +0530
Message-ID: <20251113083555.3088873-4-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113083555.3088873-1-sowmiya.s@intel.com>
References: <20251103103842.3025204-1-sowmiya.s@intel.com>
 <20251113083555.3088873-1-sowmiya.s@intel.com>
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

Add logic to verify that provided formats
are supported before proceeding with test execution

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_writeback.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index de0f67a58..e9173ea4a 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -299,7 +299,10 @@ static void fill_fb(igt_fb_t *fb, uint32_t pixel)
 	uint32_t *ptr;
 	int64_t pixel_count, i;
 
-	igt_assert(fb->drm_format == DRM_FORMAT_XRGB8888 || fb->drm_format == DRM_FORMAT_XRGB2101010);
+	igt_assert(fb->drm_format == DRM_FORMAT_XRGB8888 ||
+		   fb->drm_format == DRM_FORMAT_XRGB2101010 ||
+		   fb->drm_format == DRM_FORMAT_XBGR8888 ||
+		   fb->drm_format == DRM_FORMAT_XBGR2101010);
 
 	ptr = igt_fb_map_buffer(fb->fd, fb);
 	igt_assert(ptr);
@@ -334,7 +337,8 @@ static void writeback_sequence(igt_output_t *output, igt_plane_t *plane,
 	uint32_t clear_color = 0xffffffff;
 	igt_crc_t cleared_crc, out_expected;
 
-	if (fourcc_color == DRM_FORMAT_XRGB2101010)
+	if (fourcc_color == DRM_FORMAT_XRGB2101010 ||
+	    fourcc_color == DRM_FORMAT_XBGR2101010)
 		in_fb_colors = in_fb_colors_10bits;
 	else
 		in_fb_colors = in_fb_colors_8bits;
@@ -420,7 +424,12 @@ static void writeback_check_output(igt_output_t *output, igt_plane_t *plane,
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

