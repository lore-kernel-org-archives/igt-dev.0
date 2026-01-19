Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9B2D4A5EB
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 04:48:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465D010E35C;
	Mon, 19 Jan 2026 04:48:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j/Kz7XIJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B1010E359
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 04:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768798087; x=1800334087;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uTOk3zvMr84nroQ5hjofdU2HZvfEgS4AUkhwIaYrSkc=;
 b=j/Kz7XIJYJZuDa2YFWfCtJNiVwT84zLli7/Wfs7zwk2d1etxXl4hRglC
 k6VW67tl94SVd9FeygKyO5wHoeZq+rbHTHdYcF/gGAAEep/f4zEgtkOsm
 Wzub1mT4QqJ4dLaFEh0KqkZzeXEdwg2rBMpY/T9GtFPLBX4yV7nHLH6i/
 HB6Z3pKCOF2H0Um5xllwUN6FWw86heWIVszHJMCVrktiOPTN1r2+G3xoR
 2MLgDyan3EWryZl8l6XY/4POCaytWLRqwFBkTeGV13CEjOhCGThhrgI6F
 T2G/fmGG+LMgrZIZ6N53g3HqjZbYilBu5ypQHXCe9g5zkSymD0toERDDw w==;
X-CSE-ConnectionGUID: cZtboa+8TuuxKioyX+2VAw==
X-CSE-MsgGUID: H50abUfkT++wEMRNLD6npA==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="87581733"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="87581733"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 20:48:06 -0800
X-CSE-ConnectionGUID: ld+2ZAsHQaOXsgjPrtXkUw==
X-CSE-MsgGUID: kfsr5jtsS96WC9drqPQBuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="210271069"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 20:48:05 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v6 2/8] lib/igt_fb: Validate supported formats for crc
 calculation
Date: Mon, 19 Jan 2026 10:37:26 +0530
Message-ID: <20260119050732.110985-3-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119050732.110985-1-sowmiya.s@intel.com>
References: <20260119050732.110985-1-sowmiya.s@intel.com>
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

