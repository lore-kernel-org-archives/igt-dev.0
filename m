Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AA5CA0ED3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Sep 2024 14:38:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EBE810E335;
	Mon,  2 Sep 2024 14:38:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H39eUdwh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E176510E335
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Sep 2024 14:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725287922; x=1756823922;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hMWPROP9K6cE5U365tIYJpOli+9Q2zgxMc+RQZUwesM=;
 b=H39eUdwhEQDwH0Rng2bPVofPVlmknRvThYA8veY5Z3JMqWSmqcFbXwgs
 8Zr2wby6JWM51DCOCG4nw7a/EOibJWz+KjqSKuYoBT8zb2oFVVK3aIHNK
 Tjbml+2vUlAyedV8ZSyWrzbkM2YACjeYftivuznj/8dYaZ29k3RNpX2UQ
 /a91FegX7zDbLfPbMwqjiMmGYgj65jI9O7lU9ccAy0wxRLRQJ4pdotYlr
 RNV4qZU5PECRCzsX4y3PjLtiy2PAiDop+CjSScmUdG223qGDHe0VKOX33
 rIM9FVOMn6tkl/sopz7C+ubrXTTTuNFxXPEUPmFA/pQFBbIVpnmyoA2kE Q==;
X-CSE-ConnectionGUID: IIiYeAkXRzq/YMlq1+LcZA==
X-CSE-MsgGUID: +up+mrhSTGCKqsr2PX79Jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="24009488"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="24009488"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 07:38:42 -0700
X-CSE-ConnectionGUID: zODqOmSsQkisKtq+sLcYxg==
X-CSE-MsgGUID: Edy8v/zvThS7Pc8u0kohqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="64639439"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Sep 2024 07:38:39 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 02 Sep 2024 17:38:38 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 14/23] lib/igt_fb: Expose
 igt_fb_is_gen12_rc_ccs_cc_modifier()
Date: Mon,  2 Sep 2024 17:37:49 +0300
Message-ID: <20240902143758.21036-15-ville.syrjala@linux.intel.com>
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

I'm going to need is_gen12_rc_ccs_cc_modifier() outside of
igt_fb.c. Rename it to igt_fb_is_gen12_rc_ccs_cc_modifier()
and expose it to everyone.

v2: Add docs (J-P)

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_fb.c | 16 ++++++++++------
 lib/igt_fb.h |  1 +
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 0cf8691d1d7d..534ed9aa4e55 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -596,7 +596,13 @@ static bool is_gen12_mc_ccs_modifier(uint64_t modifier)
 		modifier == I915_FORMAT_MOD_4_TILED_MTL_MC_CCS;
 }
 
-static bool is_gen12_rc_ccs_cc_modifier(uint64_t modifier)
+/**
+ * igt_fb_is_gen12_rc_ccs_cc_modifier:
+ * @modifier: drm modifier
+ *
+ * This function returns true if @modifier supports clear color.
+ */
+bool igt_fb_is_gen12_rc_ccs_cc_modifier(uint64_t modifier)
 {
 	return modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC ||
 		modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC ||
@@ -606,7 +612,7 @@ static bool is_gen12_rc_ccs_cc_modifier(uint64_t modifier)
 static bool is_gen12_ccs_modifier(uint64_t modifier)
 {
 	return is_gen12_mc_ccs_modifier(modifier) ||
-		is_gen12_rc_ccs_cc_modifier(modifier) ||
+		igt_fb_is_gen12_rc_ccs_cc_modifier(modifier) ||
 		modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS ||
 		modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS ||
 		modifier == I915_FORMAT_MOD_4_TILED_MTL_RC_CCS;
@@ -742,9 +748,7 @@ static int fb_num_planes(const struct igt_fb *fb)
 	    !HAS_FLATCCS(intel_get_drm_devid(fb->fd)))
 		num_planes *= 2;
 
-	if (fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC ||
-	    fb->modifier == I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC ||
-	    fb->modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC)
+	if (igt_fb_is_gen12_rc_ccs_cc_modifier(fb->modifier))
 		num_planes++;
 
 	return num_planes;
@@ -2511,7 +2515,7 @@ static bool block_copy_ok(const struct igt_fb *fb)
 
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

