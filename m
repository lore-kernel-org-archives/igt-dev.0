Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095BCE9D419
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 16:58:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C1610E6E7;
	Wed,  4 Feb 2026 16:58:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y0pD9rPT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A51810E6E7
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 16:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770224286; x=1801760286;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uTOk3zvMr84nroQ5hjofdU2HZvfEgS4AUkhwIaYrSkc=;
 b=Y0pD9rPTyKiIJ+gXs0DnfUv6kvbU7TXmrK31ph2WBtgv89tPvtiSyaKN
 TkuB/3z49KDYeLOLUIvqb62/q4gc6ieCNCZjfxjjqCDNj59LObN3ax5H4
 fSykRvxkIuteFeIeECLKOTq2EBwjAHcJaKojIlcVtC7DgiGjnINUGkPaX
 PoachBJinIVtVPJ5OAY6cGVq4/loJLhN+eodkN4KFM7kjmy4YhwCHQNxC
 0e4pua5uRwI3MDVaIyIPVM8ssG7QThW8aHtkzWWLXIY9M9WbbZ2Z50qKe
 z457n5GtkSydtzc9MZpQL6tkh1mRsUtkm7sXId3H1QCg5tkN6LJ90wIiq A==;
X-CSE-ConnectionGUID: QLz+pJOfSJeEZ6GEm25wAw==
X-CSE-MsgGUID: ixI9btoORYun86v1bc1eRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71580030"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="71580030"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 08:57:47 -0800
X-CSE-ConnectionGUID: xtXWqTn9RuuoZ/OKMSJ09g==
X-CSE-MsgGUID: kkIYkTqKQN6P/ngdi4AVhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="210252899"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 08:57:46 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v8 2/9] lib/igt_fb: Validate supported formats for crc
 calculation
Date: Wed,  4 Feb 2026 22:48:11 +0530
Message-ID: <20260204171819.292327-3-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204171819.292327-1-sowmiya.s@intel.com>
References: <20260204171819.292327-1-sowmiya.s@intel.com>
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

