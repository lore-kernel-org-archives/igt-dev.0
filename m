Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBBCCA0ED3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Sep 2024 14:38:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFCC910E330;
	Mon,  2 Sep 2024 14:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ff5WiSoj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E3310E331
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Sep 2024 14:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725287910; x=1756823910;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g81Nb33rgTJSd5POxc3LQ5uAbbKiyqv8SUNhySn3QSA=;
 b=ff5WiSojcOv0VguBQ0WH/M0aaaoutX5IrWpwMT4XP91vRAr2aWM34iZN
 rrBI6YuAjC7oFqbp4LS4c4Cjmfpe+vgc+zx2e6WyH/DQjM/tgMCcLDgDY
 w36VdfGyYdD+y4sKdA4citUtrDFdxUe+M2LL6LXOGcHZBfk32WTIpi6s6
 /diGzizWBFJ4E8dlDmoC7Ff9prErzm4AxMPW7Wm7XRRKWIUdHtRLo2pWy
 2Kv+uPTZbZ4+2xRKNmcajIz8UJiWx0nRY0vGQypu6zLnPGI28V9uV+rtB
 oBfe1K/nL8o6kOLtxze+mL0/MKIFmFDLogYcALzZArZhscuYBdYj09qV2 A==;
X-CSE-ConnectionGUID: gJxhScWAQaeb86y85awQ6g==
X-CSE-MsgGUID: yxK5gAjHSj63tKrhthZnTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="24009458"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="24009458"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 07:38:30 -0700
X-CSE-ConnectionGUID: 1fMg0nPoR/ew/JzdAUmZ/g==
X-CSE-MsgGUID: GOzicXGaQvuA/xUlHuo96Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="64639409"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Sep 2024 07:38:28 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 02 Sep 2024 17:38:27 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 10/23] lib/igt_fb: Extract is_gen12_rc_ccs_cc_modifier()
Date: Mon,  2 Sep 2024 17:37:45 +0300
Message-ID: <20240902143758.21036-11-ville.syrjala@linux.intel.com>
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

Extract a helper to identify the clear color compressed modifiers.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_fb.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 0eb3897d0f8b..6c379f6d86ba 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -596,15 +596,20 @@ static bool is_gen12_mc_ccs_modifier(uint64_t modifier)
 		modifier == I915_FORMAT_MOD_4_TILED_MTL_MC_CCS;
 }
 
+static bool is_gen12_rc_ccs_cc_modifier(uint64_t modifier)
+{
+	return modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC ||
+		modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC ||
+		modifier == I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC;
+}
+
 static bool is_gen12_ccs_modifier(uint64_t modifier)
 {
 	return is_gen12_mc_ccs_modifier(modifier) ||
+		is_gen12_rc_ccs_cc_modifier(modifier) ||
 		modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS ||
-		modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC ||
 		modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS ||
-		modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC ||
-		modifier == I915_FORMAT_MOD_4_TILED_MTL_RC_CCS ||
-		modifier == I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC;
+		modifier == I915_FORMAT_MOD_4_TILED_MTL_RC_CCS;
 }
 
 static bool is_ccs_modifier(uint64_t modifier)
-- 
2.44.2

