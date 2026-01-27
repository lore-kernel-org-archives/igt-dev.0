Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D810D25932
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 04:12:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216F310E1FD;
	Tue, 27 Jan 2026 04:12:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JfSk5IAH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E9110E1FD
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 04:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769487137; x=1801023137;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uTOk3zvMr84nroQ5hjofdU2HZvfEgS4AUkhwIaYrSkc=;
 b=JfSk5IAH4qwgfhNHNQJvqC7yqS+N5Rhprcz6tH4JxvdjcBCiea/3K0IP
 COOaTLfrnA6nMwLzZZNqG9ADcu3JjQVoMx8V3RtuquqFfGZKaA4cxvigc
 w2Pu0xK1EvbrqE8fbFWwiUc6ivvTbqlDFfiM8/ZsqfZ4RbnpiDLN0Ysmz
 R52fcGAllyLqVrqQ2nBzgGndGlHJwMcwtrulP2xCRKW7ZuyWzPrVvQGN4
 uAZs+0Zx6ijPDlhaleh7cFpOwMHq2KmCqtti5iwe2caeKiyX/2HUoYtiK
 ZUB9kuIMAlrobjmJE8IjcEtwHWkxn6vXBgCqPWYuqG3W6dMKYsDOC7fmo g==;
X-CSE-ConnectionGUID: gB7pfildQT2bmPeFcGL4xw==
X-CSE-MsgGUID: ldJELFg1Rb6S+m6AevqHHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81783912"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="81783912"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 20:12:16 -0800
X-CSE-ConnectionGUID: u0MX3jhJTWavH/TmdrN8Eg==
X-CSE-MsgGUID: TG+oChXSQNS3XXRjs4+ZxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="212724481"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 20:12:15 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v7 2/9] lib/igt_fb: Validate supported formats for crc
 calculation
Date: Tue, 27 Jan 2026 10:02:26 +0530
Message-ID: <20260127043233.254107-3-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260127043233.254107-1-sowmiya.s@intel.com>
References: <20260127043233.254107-1-sowmiya.s@intel.com>
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

v2: Reframe commit message (Kamil)
    Separate lib changes in single commit (Kamil)
v4: Remove BGR2101010 format verification from
    fnv1a function (Suraj)

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 lib/igt_fb.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index d59fe133b..3a1553d48 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -5035,7 +5035,8 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc)
 	if (fb->num_planes != 1)
 		return -EINVAL;
 
-	if (fb->drm_format != DRM_FORMAT_XRGB8888 && fb->drm_format != DRM_FORMAT_XRGB2101010)
+	if (fb->drm_format != DRM_FORMAT_XRGB8888 && fb->drm_format != DRM_FORMAT_XRGB2101010 &&
+	    fb->drm_format != DRM_FORMAT_XBGR8888)
 		return -EINVAL;
 
 	ptr = igt_fb_map_buffer(fb->fd, fb);
@@ -5062,7 +5063,8 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc)
 		for (x = 0; x < fb->width; x++) {
 			uint32_t pixel = le32_to_cpu(line[x]);
 
-			if (fb->drm_format == DRM_FORMAT_XRGB8888)
+			if (fb->drm_format == DRM_FORMAT_XRGB8888 ||
+			    fb->drm_format == DRM_FORMAT_XBGR8888)
 				pixel &= 0x00ffffff;
 			else if (fb->drm_format == DRM_FORMAT_XRGB2101010)
 				pixel &= 0x3fffffff;
-- 
2.43.0

