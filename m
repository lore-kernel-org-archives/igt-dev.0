Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31C5C30658
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 23:29:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6305710E709;
	Tue,  2 Jul 2024 23:29:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WhKPVqXS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F052510E704
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 23:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719962951; x=1751498951;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=+REA+P3dVGfGHT4fxDXH0GGE55zxdWutN0omIo4felo=;
 b=WhKPVqXSOoJUsgV7uWYB0C5fMTbyWCjJf7Q4fDzt7U1pyUkhEPYJBd5d
 RKbneq0yr0D8RuZAWRBTHjrw2PtqxApozpP+cHkhaRY7n9t56pNQMRCLu
 tdeiEVZXW9bHEQ9gvPcbW1la7K4Js1RirXlTglscc+GujruPEIkKYsyf9
 GlseNpB1FtDwa4GM2nMoifAqnXsddselyRSEJxnF7odRiCUGG7ziZKkuw
 vJcMiHVuM/Ws+kO/80UhTvoQoHSOrLfLHXhcLC+8hphwLJuOyKfqpzmu+
 bd9I63BTtOBPbKrUUQKlUowPeLet/l8RTNnkaRESt1oWm06Qbf2cpIA60 g==;
X-CSE-ConnectionGUID: 54EmLsIjSN2pX+Wp5XwMAg==
X-CSE-MsgGUID: v0HtJBnJQ4CGTePEvJIsmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28559593"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="28559593"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 16:29:11 -0700
X-CSE-ConnectionGUID: RtJdfO4NRSuR1N9oTQP/Rw==
X-CSE-MsgGUID: MG6FWNgzReqQqYqOY9O8/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46043856"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Jul 2024 16:29:09 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 02:29:08 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 18/37] lib/igt_fb: Expose
 igt_fb_is_gen12_rc_ccs_cc_modifier()
Date: Wed,  3 Jul 2024 02:27:58 +0300
Message-ID: <20240702232817.31147-19-ville.syrjala@linux.intel.com>
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

I'm going to need is_gen12_rc_ccs_cc_modifier() outside of
igt_fb.c. Rename it to igt_fb_is_gen12_rc_ccs_cc_modifier()
and expose it to everyone.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_fb.c | 10 ++++------
 lib/igt_fb.h |  1 +
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index bcb418e0f7be..b95dc3278f23 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -594,7 +594,7 @@ static bool is_gen12_mc_ccs_modifier(uint64_t modifier)
 		modifier == I915_FORMAT_MOD_4_TILED_MTL_MC_CCS;
 }
 
-static bool is_gen12_rc_ccs_cc_modifier(uint64_t modifier)
+bool igt_fb_is_gen12_rc_ccs_cc_modifier(uint64_t modifier)
 {
 	return modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC ||
 		modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC ||
@@ -604,7 +604,7 @@ static bool is_gen12_rc_ccs_cc_modifier(uint64_t modifier)
 static bool is_gen12_ccs_modifier(uint64_t modifier)
 {
 	return is_gen12_mc_ccs_modifier(modifier) ||
-		is_gen12_rc_ccs_cc_modifier(modifier) ||
+		igt_fb_is_gen12_rc_ccs_cc_modifier(modifier) ||
 		modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS ||
 		modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS ||
 		modifier == I915_FORMAT_MOD_4_TILED_MTL_RC_CCS;
@@ -734,9 +734,7 @@ static int fb_num_planes(const struct igt_fb *fb)
 	    !HAS_FLATCCS(intel_get_drm_devid(fb->fd)))
 		num_planes *= 2;
 
-	if (fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC ||
-	    fb->modifier == I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC ||
-	    fb->modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC)
+	if (igt_fb_is_gen12_rc_ccs_cc_modifier(fb->modifier))
 		num_planes++;
 
 	return num_planes;
@@ -2498,7 +2496,7 @@ static bool block_copy_ok(const struct igt_fb *fb)
 
 static bool ccs_needs_enginecopy(const struct igt_fb *fb)
 {
-	if (is_gen12_rc_ccs_cc_modifier(fb->modifier))
+	if (igt_fb_is_gen12_rc_ccs_cc_modifier(fb->modifier))
 		return true;
 
 	if (is_gen12_mc_ccs_modifier(fb->modifier))
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index b1b40b858610..12c9574827f2 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -182,6 +182,7 @@ uint64_t igt_fb_mod_to_tiling(uint64_t modifier);
 uint64_t igt_fb_tiling_to_mod(uint64_t tiling);
 
 bool igt_fb_is_ccs_modifier(uint64_t modifier);
+bool igt_fb_is_gen12_rc_ccs_cc_modifier(uint64_t modifier);
 bool igt_fb_is_ccs_plane(const struct igt_fb *fb, int plane);
 bool igt_fb_is_gen12_ccs_cc_plane(const struct igt_fb *fb, int plane);
 int igt_fb_ccs_to_main_plane(const struct igt_fb *fb, int ccs_plane);
-- 
2.44.2

