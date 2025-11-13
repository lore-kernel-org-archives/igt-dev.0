Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D29CD4F50
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 08:18:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD9710E34C;
	Thu, 13 Nov 2025 08:18:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jmoYSix5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C599910E34C
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 08:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763021896; x=1794557896;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ed+8nrKcxMdZBIv/2FiRlIpYz1ateWc9lAxWPZjbkqs=;
 b=jmoYSix5MEPfMh7izVkhdgLKQgy+/LSOrK0FhrV6hXI2QW4pEfsz0Mbo
 unaMknU3V2LtVIhpMUQsSjqYKn4YBvOf++mUrdffJ8sZtPFBH8v4EQc6D
 QHJV6MPmLX8//sX1gU+fZHjv0sJIMJLpAkxqVOLyb7ie6aacALviJQwB5
 qYUxDCfh30H0fMyYsP7jn+fA7pwpgs/Y+FY87mJANiF/EdmmOLWmVsiDC
 QD/Cv10J/EmjJAKZ4dMDIvUj0fFZiFlqFxslpIoqh0p94SaFBgCeqgGkW
 AGBTGzIL076ajmCC6NUo8R2ZX9jFeNgp8MuiTN5Ej9um9o+J5gQYJS6rv Q==;
X-CSE-ConnectionGUID: msZpqQIWRz2GvX+oXu2Gug==
X-CSE-MsgGUID: BC0v9hrXRfGncGHy/gccng==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="65000517"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="65000517"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 00:18:15 -0800
X-CSE-ConnectionGUID: 4SNDcF2CRaOviq7qzR0OdQ==
X-CSE-MsgGUID: Xa7bzG0mTnmVskR1R8GBcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="212822326"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 00:18:14 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v2 2/9] lib/igt_fb: Validate supported formats for crc
 calculation
Date: Thu, 13 Nov 2025 14:05:48 +0530
Message-ID: <20251113083555.3088873-3-sowmiya.s@intel.com>
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

