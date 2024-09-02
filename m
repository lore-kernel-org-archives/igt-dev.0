Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B771CA0ED3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Sep 2024 14:38:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B708A10E049;
	Mon,  2 Sep 2024 14:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h9S6L+tp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0444A10E049
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Sep 2024 14:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725287913; x=1756823913;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qpjIHuy6Jk92GZNsiyxL1L0TWIrhShzHRZ6VgBJ6e7w=;
 b=h9S6L+tp8tC8ej0XTHRlnyJlCLl5sSAydUboe/AaS/8//3YkpCmyLAp/
 03Cs8IhcD2CrHXZDdl7Mx2AmE2x1w5oXZL/FKd+j9sJUlk0aFPblKSUNy
 hd1FYxj2R5E+EI0TEKSCQ+sBc9joidFu3KUVpTaOIf7uCbwbc8IpW920u
 f7oNWxG6ewoRSwhLy7GAC2NaWsduYJSWk9iCGl9UMgjMVYvRBVCEaQb0M
 Go6EUTISVMG/prgbN+2M456JezuJQ3O4C0HvFyMRrB3Wuy4EXl6veCvOq
 fMvk2qDHpKh/Wk9Hz/FlAWMZnD9n4A/k5+cCU513uh/lrGetAta+VJLsZ w==;
X-CSE-ConnectionGUID: LfoXYzlWQ+aso3Omgqt6Jw==
X-CSE-MsgGUID: 2Sy96xYnRxuBKPzSqBeXwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="24009467"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="24009467"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 07:38:33 -0700
X-CSE-ConnectionGUID: gzCnAYw+SL6BxvDtnabMtQ==
X-CSE-MsgGUID: TfhhxfDYSxahQxLkuM0WVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="64639412"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Sep 2024 07:38:31 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 02 Sep 2024 17:38:30 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 11/23] lib/igt_fb: Extract ccs_needs_enginecopy()
Date: Mon,  2 Sep 2024 17:37:46 +0300
Message-ID: <20240902143758.21036-12-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240902143758.21036-1-ville.syrjala@linux.intel.com>
References: <20240902143758.21036-1-ville.syrjala@linux.intel.com>
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

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_fb.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 6c379f6d86ba..52910b68a534 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2501,17 +2501,29 @@ static bool block_copy_ok(const struct igt_fb *fb)
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
@@ -2551,10 +2563,11 @@ static bool use_enginecopy(const struct igt_fb *fb)
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

