Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97998D116F3
	for <igt-dev@archiver.kernel.org>; Wed,  3 Dec 2025 09:24:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47BD010E5C2;
	Wed,  3 Dec 2025 09:24:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k+HCWI/r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9369710E5C2
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Dec 2025 09:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764753896; x=1796289896;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bxUERaFj+y9xIMx/BnFlmAttQAX6AC2FqwQTjLl+MbY=;
 b=k+HCWI/r0rVjpJzQEqxBFljnfwLQQ5jIIBJ3xfmZon31WOfMkqTqSJPE
 8o4pJIxUj9KsxE0znZaDSX803KsC7sgnRKacEfa7KqurqGFFVc+WjLu3l
 wbk+cMuuIqJwV7fuD6CXbb23+4+6abFsM44hokV4L3GL6+Bsk/0hFs33s
 baH0n0ffzmjmBfSbcxdx2hCzez8lV+My5uTSxDSwFlJN3Dl4Tg7uhgtvw
 RSbCsiqCoNxmtiGuH3BJCdboZJ/7P2eXCzxsgtzK+6yjb9JJ9FSH42JgR
 0T28nEWVsFwYxDGwinrfVyykM/w5kqFJjlaTUu/+wvAb9ROqk8hRP8yW0 A==;
X-CSE-ConnectionGUID: a98btHCqT+uH02u3FFqSig==
X-CSE-MsgGUID: IP3q1KLxS761zn1BiLEATA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66783630"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="66783630"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 01:24:56 -0800
X-CSE-ConnectionGUID: JJc5nd+iTmyrwlKgD2+YrQ==
X-CSE-MsgGUID: lCeCwxjpTIi3F8cdr7wtPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="199569584"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 01:24:55 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v4 2/6] lib/igt_fb: Validate supported formats for crc
 calculation
Date: Wed,  3 Dec 2025 15:13:03 +0530
Message-ID: <20251203094307.3187669-3-sowmiya.s@intel.com>
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

Add logic to verify that provided formats
are supported before proceeding with test
execution for crc calculation

v4: Remove BGR2101010 format verification from
    fnv1a function

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 lib/igt_fb.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 0a8299d26..80695a0d8 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -5000,7 +5000,8 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc)
 	if (fb->num_planes != 1)
 		return -EINVAL;
 
-	if (fb->drm_format != DRM_FORMAT_XRGB8888 && fb->drm_format != DRM_FORMAT_XRGB2101010)
+	if (fb->drm_format != DRM_FORMAT_XRGB8888 && fb->drm_format != DRM_FORMAT_XRGB2101010 &&
+	    fb->drm_format != DRM_FORMAT_XBGR8888)
 		return -EINVAL;
 
 	ptr = igt_fb_map_buffer(fb->fd, fb);
@@ -5027,7 +5028,8 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc)
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

