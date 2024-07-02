Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037D8C31D97
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 23:29:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B986910E2AA;
	Tue,  2 Jul 2024 23:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GyMAW4e3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46CB10E2AA
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 23:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719962943; x=1751498943;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Nb0E7sCDIoyvgDJIRTtmZLSy2rC2n9FljMqaJE/Ouv8=;
 b=GyMAW4e3lZeWQ+uzL1ft16+iHHH4E/Xz0ko2fN5dJ6+djZeVcDTGE5Jd
 o0XTpIoqx0RkKPBImuI3aqKPKAnHeewVujW1NDW7vhmQYasIYEXQ/VGdL
 2wVZVb5ALYxWA08d4djofOonr7yDc42jv/v6z1F3BzHpxQ+AjGIi3kNXy
 wJFXWdZ0bm0zSpM0U5FqA2EaSdzKK9eMFZdYv1Dy5xZh//OhIogTYdXbI
 2Vx83czBXj3yzYtVpy4TdVx3xWUqr0mvPqC5ykwTnHeGSrfjrfZIbkjtu
 /WP887YLPQrA+BrZ25oWE6hr0kkQB3KGrx7FaFf+7LNDrtlT8P/D57HHF g==;
X-CSE-ConnectionGUID: YiMi0z2TQzuxuh1ps2HQSA==
X-CSE-MsgGUID: SH4KH/d3ToK1439jTRLihg==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28559568"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="28559568"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 16:29:03 -0700
X-CSE-ConnectionGUID: E3O7JjUYT5u02cmYSnaSVQ==
X-CSE-MsgGUID: vio9JsFAQFem3QPxc1CLzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46043824"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Jul 2024 16:29:00 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 02:29:00 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 15/37] lib/igt_fb: Extract ccs_needs_enginecopy()
Date: Wed,  3 Jul 2024 02:27:55 +0300
Message-ID: <20240702232817.31147-16-ville.syrjala@linux.intel.com>
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

We have two copies of the code to determine if CCS needs to
use enginecopy. Extract the code to a helper.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_fb.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index c48a61b5f148..6c9b4b7f3107 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2494,17 +2494,29 @@ static bool block_copy_ok(const struct igt_fb *fb)
 					       fb_tile_to_blt_tile(fb->modifier));
 }
 
+static bool ccs_needs_enginecopy(const struct igt_fb *fb)
+{
+	if (is_gen12_mc_ccs_modifier(fb->modifier))
+		return true;
+
+	if (is_ccs_modifier(fb->modifier) &&
+	    !HAS_FLATCCS(intel_get_drm_devid(fb->fd)))
+		return true;
+
+	return false;
+}
+
 static bool blitter_ok(const struct igt_fb *fb)
 {
 	if (!is_intel_device(fb->fd))
 		return false;
 
-	if ((!HAS_FLATCCS(intel_get_drm_devid(fb->fd)) &&
-	    is_ccs_modifier(fb->modifier)) ||
-	    is_gen12_mc_ccs_modifier(fb->modifier) ||
-	    (!blt_uses_extended_block_copy(fb->fd) &&
+	if (ccs_needs_enginecopy(fb))
+		return false;
+
+	if (!blt_uses_extended_block_copy(fb->fd) &&
 	    fb->modifier == I915_FORMAT_MOD_X_TILED &&
-	    is_xe_device(fb->fd)))
+	    is_xe_device(fb->fd))
 		return false;
 
 	if (is_xe_device(fb->fd))
@@ -2544,10 +2556,11 @@ static bool use_enginecopy(const struct igt_fb *fb)
 	if (blitter_ok(fb))
 		return false;
 
+	if (ccs_needs_enginecopy(fb))
+		return true;
+
 	return fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
-	       fb->modifier == I915_FORMAT_MOD_X_TILED ||
-	       (!HAS_FLATCCS(intel_get_drm_devid(fb->fd)) && is_ccs_modifier(fb->modifier)) ||
-	       is_gen12_mc_ccs_modifier(fb->modifier);
+		fb->modifier == I915_FORMAT_MOD_X_TILED;
 }
 
 static bool use_blitter(const struct igt_fb *fb)
-- 
2.44.2

