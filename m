Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225F4CFA474
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 05:40:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB1F10E058;
	Fri, 21 Nov 2025 05:40:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Biegj98X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A5A410E058
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 05:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763703652; x=1795239652;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r8NyLyxckssl0e/wPpp4SeHlemFasFMWAOs8v7rtVwg=;
 b=Biegj98X6QZDBUimbEoWwx7pldpV99HZJC9VMTwdE5fO5lMQkycA9CTJ
 8qkb6KPAv/MVIzYgoGJBZJsWYK/7H4J3LopSrW/tFBj6wGwxFgtmm/LGr
 vhrOSk27bPAPVdr7E3gmgLHqAofOre1gCEjrImVaxSDV0M6FX4f9Iollx
 aG1d/e8r+EO2gPtw7lRITq1ELosUHoq5vfxAIUlkfCbg0wpaHt5roOa1w
 /xsHb7+qyWeqXoWCOx2k0KopI+dqZ3nLpOxdNLYsEkJqEg30paz97I5Jq
 5Z8fCOiUmfBXuE4RbRdGVvtR3SPeejVgtpMOMT4mNXsfFRS2LxmpVrs/d A==;
X-CSE-ConnectionGUID: Kua2wyH5SiWFcSgUZrXiWA==
X-CSE-MsgGUID: pEvradfnQDSo4quZO11L0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="69658145"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="69658145"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 21:40:52 -0800
X-CSE-ConnectionGUID: bAOtjxHQRvCdbwToJ0LQag==
X-CSE-MsgGUID: neJLlQT7RYmJ53ICfVm9kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="214961796"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 21:40:51 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v3 02/12] lib/igt_fb: Validate supported formats for crc
 calculation
Date: Fri, 21 Nov 2025 11:28:29 +0530
Message-ID: <20251121055839.3116906-3-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121055839.3116906-1-sowmiya.s@intel.com>
References: <20251121055839.3116906-1-sowmiya.s@intel.com>
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
index 92883a618..d802235cd 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -4961,7 +4961,8 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc)
 	if (fb->num_planes != 1)
 		return -EINVAL;
 
-	if (fb->drm_format != DRM_FORMAT_XRGB8888 && fb->drm_format != DRM_FORMAT_XRGB2101010)
+	if (fb->drm_format != DRM_FORMAT_XRGB8888 && fb->drm_format != DRM_FORMAT_XRGB2101010 &&
+	    fb->drm_format != DRM_FORMAT_XBGR8888 && fb->drm_format != DRM_FORMAT_XBGR2101010)
 		return -EINVAL;
 
 	ptr = igt_fb_map_buffer(fb->fd, fb);
@@ -4988,9 +4989,11 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc)
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

