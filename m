Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCB9CD4F50
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 08:40:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70EBC10E686;
	Thu, 13 Nov 2025 08:40:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SMxguseF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B1710E66C
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 08:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763023209; x=1794559209;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ed+8nrKcxMdZBIv/2FiRlIpYz1ateWc9lAxWPZjbkqs=;
 b=SMxguseFvMa0VRdguc9v7U7aU5rc2Wl9/siZP3P1zfxyE0xCmwG/7dBs
 J3Wht4uzd29sQ8dCaEGLVMOmZhVFbs+2XdQaSUsmjL84lj/Vj3dx1lIbp
 7ErTsUmfXZ+FL6zRew/+rf6th+iGMtA7zcqhR4VJxOL2XO37MMgpJFP0r
 ew1dg1zCJmmiICUhbR3EYQ0zzXkqmz0wfH5tk53YgyNxkK3/ayCGgrR6c
 UHESKr1MXsSSi9V0p3XZCPqFhK14BqQCCPFxj9mzdBzDlGNIltIx5HXVq
 7L0n0XsVgTWTWANJ4u6YRUlxl/Fzph6I1LUiDo4Deo//8KfOsIjhyH0TN A==;
X-CSE-ConnectionGUID: MhJMAof5RlGacj7FMob6+A==
X-CSE-MsgGUID: 6J0ByIc5SfS0Z/h6feYg8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="67696670"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="67696670"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 00:40:08 -0800
X-CSE-ConnectionGUID: tGFq9wS3SGe6b/5JLenNdQ==
X-CSE-MsgGUID: UkAgIUN9TSC4/+3+aWuhqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="194434739"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 00:40:07 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v2 2/9] lib/igt_fb: Validate supported formats for crc
 calculation
Date: Thu, 13 Nov 2025 14:27:54 +0530
Message-ID: <20251113085801.3088957-3-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113085801.3088957-1-sowmiya.s@intel.com>
References: <20251113085801.3088957-1-sowmiya.s@intel.com>
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
are supported before proceeding with test
execution for crc calculation

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 lib/igt_fb.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 60853b0af..844f13e5c 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -4960,7 +4960,8 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc)
 	if (fb->num_planes != 1)
 		return -EINVAL;
 
-	if (fb->drm_format != DRM_FORMAT_XRGB8888 && fb->drm_format != DRM_FORMAT_XRGB2101010)
+	if (fb->drm_format != DRM_FORMAT_XRGB8888 && fb->drm_format != DRM_FORMAT_XRGB2101010 &&
+	    fb->drm_format != DRM_FORMAT_XBGR8888 && fb->drm_format != DRM_FORMAT_XBGR2101010)
 		return -EINVAL;
 
 	ptr = igt_fb_map_buffer(fb->fd, fb);
@@ -4987,9 +4988,11 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc)
 		for (x = 0; x < fb->width; x++) {
 			uint32_t pixel = le32_to_cpu(line[x]);
 
-			if (fb->drm_format == DRM_FORMAT_XRGB8888)
+			if (fb->drm_format == DRM_FORMAT_XRGB8888 ||
+			    fb->drm_format == DRM_FORMAT_XBGR8888)
 				pixel &= 0x00ffffff;
-			else if (fb->drm_format == DRM_FORMAT_XRGB2101010)
+			else if (fb->drm_format == DRM_FORMAT_XRGB2101010 ||
+				 fb->drm_format == DRM_FORMAT_XBGR2101010)
 				pixel &= 0x3fffffff;
 
 			hash ^= pixel;
-- 
2.43.0

