Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5112C30658
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 23:29:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB3D10E705;
	Tue,  2 Jul 2024 23:29:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N70W1TIk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF2110E714
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 23:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719962992; x=1751498992;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=lgGSm0ed3BWeu+KeV37WXP0Hlnod2lb94HiE2YhdOX4=;
 b=N70W1TIkMZRI9HXLzJ+9KmIpbnF8oROni8rgOFuwuTgAXgo7oACY3U6t
 8LCoQeGIuXnoKcnZ6sgD/VA4UA1LnieDHAa6As3lK48h5+mVgZ7MbIw4w
 v8alN35iGcWyEemsU1lbmJUtQuWGQjfgOClt5ckycAFSB31ydILwuj9ZY
 sogX6sXQabV1Znzz915uSXpu3IHBEI2PsB0CaWaVFoStBR0Bd5mmwU+zB
 tLkRBpu1EU9TCSzbG+yqif3qqlbR8MgnoYHt45qfi4nPmv+jdAk/iGKTM
 aPs39TmwXxKrC+brG6OvJxkRW1DdFqP9Aj/L7PYrKzmi2TezLTt7Pbi4t g==;
X-CSE-ConnectionGUID: 7z5DXcI4QBSw0ZIpXiAQ5g==
X-CSE-MsgGUID: PAyTwDzPSdu2jDKgSg8CTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28559696"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="28559696"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 16:29:52 -0700
X-CSE-ConnectionGUID: zVjPqfBMSjmUz3AaMa/Uvg==
X-CSE-MsgGUID: hy8iJEwAQN61uicwGlPCMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46043928"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Jul 2024 16:29:49 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 02:29:49 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 33/37] tests/kms_ccs: Correctly check clear color for
 10bpc formats
Date: Wed,  3 Jul 2024 02:28:13 +0300
Message-ID: <20240702232817.31147-34-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The hardware generated clear color will be in the native
pixel format. Generate the reference correctly for 10bpc
formats.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_ccs.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 30b61f132834..4c1c78ee4e58 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -321,7 +321,7 @@ static void check_ccs_cc_plane(int drm_fd, igt_fb_t *fb, int plane, const float
 		uint32_t d;
 	} *cc_p;
 	void *map;
-	uint32_t native_color;
+	uint32_t native_color = 0;
 
 	if (is_i915_device(drm_fd)) {
 		gem_set_domain(drm_fd, fb->gem_handle, I915_GEM_DOMAIN_CPU, 0);
@@ -336,10 +336,22 @@ static void check_ccs_cc_plane(int drm_fd, igt_fb_t *fb, int plane, const float
 		   cc_color[2] == cc_p[2].f &&
 		   cc_color[3] == cc_p[3].f);
 
-	native_color = (uint8_t)(cc_color[3] * 0xff) << 24 |
-		       (uint8_t)(cc_color[0] * 0xff) << 16 |
-		       (uint8_t)(cc_color[1] * 0xff) << 8 |
-		       (uint8_t)(cc_color[2] * 0xff);
+	switch (fb->drm_format) {
+	case DRM_FORMAT_XRGB8888:
+		native_color = (uint32_t)(cc_color[3] * 0xff) << 24 |
+			(uint32_t)(cc_color[0] * 0xff) << 16 |
+			(uint32_t)(cc_color[1] * 0xff) << 8 |
+			(uint32_t)(cc_color[2] * 0xff);
+		break;
+	case DRM_FORMAT_XRGB2101010:
+		native_color = (uint32_t)(cc_color[3] * 0x3) << 30 |
+			(uint32_t)(cc_color[0] * 0x3ff) << 20 |
+			(uint32_t)(cc_color[1] * 0x3ff) << 10 |
+			(uint32_t)(cc_color[2] * 0x3ff);
+		break;
+	default:
+		break;
+	}
 
 	igt_assert(native_color == cc_p[4].d);
 
-- 
2.44.2

