Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9390CCFA04
	for <igt-dev@archiver.kernel.org>; Mon,  3 Nov 2025 10:21:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADD210E3A5;
	Mon,  3 Nov 2025 10:21:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BSIdf8bm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3226E10E3A5
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Nov 2025 10:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762165263; x=1793701263;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JFR7ZfzQpKEGsGTcIB5/+N0DpTzqQDKPhTLwkvfVSAo=;
 b=BSIdf8bms+sPI1enNooPdj39LQ/w3gGiDVPy+WIujWDO8pr+rpY/gHZq
 eX2KvCNc/fu5WHK7g68CebWQVAwuDmi88/IOvsKdzNtwHJ1Y05W8/XWVY
 DcO5Cum4PvLk0YMMZ/qzxty1pGxWEnzDqobzj9PtsjtYRvjl0sUOP6wYZ
 /cGwalJ9PQWCjBbPCAVx0znwUfjwTzc8z6MR6ZOQbk9sEYHUsOqWMWnzJ
 Y6Aq0a6Wr7v2FLXidI5mrwKDet14I7fqF8iEcSgAlAmKmoS4wMVJg9bHd
 54bNtRsTvUdnY5jMxN8FtuWP1dLefPGclsGLKbSMkxm/DDraCeBa1txp4 w==;
X-CSE-ConnectionGUID: oVmMhimkS1mMr/axBm3ljA==
X-CSE-MsgGUID: uXs7gKuCRH6eHqrHYdMEpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64162515"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64162515"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 02:21:02 -0800
X-CSE-ConnectionGUID: +g0e1kTIS+aaR4e+BVw9Ew==
X-CSE-MsgGUID: 7BdQYo7iRZqA0OkOCVHYDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="186120154"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 02:21:00 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 2/8] tests/kms_writeback: Validate supported formats
 lib/igt_fb: Validate supported formats for crc calculation
Date: Mon,  3 Nov 2025 16:08:36 +0530
Message-ID: <20251103103842.3025204-3-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251103103842.3025204-1-sowmiya.s@intel.com>
References: <20251103103842.3025204-1-sowmiya.s@intel.com>
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
 lib/igt_fb.c          |  6 ++++--
 tests/kms_writeback.c | 12 ++++++++++--
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 60853b0af..e97b31889 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -4960,7 +4960,8 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc)
 	if (fb->num_planes != 1)
 		return -EINVAL;
 
-	if (fb->drm_format != DRM_FORMAT_XRGB8888 && fb->drm_format != DRM_FORMAT_XRGB2101010)
+	if (fb->drm_format != DRM_FORMAT_XRGB8888 && fb->drm_format != DRM_FORMAT_XRGB2101010 &&
+	    fb->drm_format != DRM_FORMAT_XBGR8888)
 		return -EINVAL;
 
 	ptr = igt_fb_map_buffer(fb->fd, fb);
@@ -4987,7 +4988,8 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc)
 		for (x = 0; x < fb->width; x++) {
 			uint32_t pixel = le32_to_cpu(line[x]);
 
-			if (fb->drm_format == DRM_FORMAT_XRGB8888)
+			if (fb->drm_format == DRM_FORMAT_XRGB8888 ||
+			    fb->drm_format == DRM_FORMAT_XBGR8888)
 				pixel &= 0x00ffffff;
 			else if (fb->drm_format == DRM_FORMAT_XRGB2101010)
 				pixel &= 0x3fffffff;
diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index de0f67a58..9523c24b8 100644
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
@@ -420,7 +423,12 @@ static void writeback_check_output(igt_output_t *output, igt_plane_t *plane,
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

