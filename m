Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2806C30658
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 23:29:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F7C10E08E;
	Tue,  2 Jul 2024 23:29:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l2UYt7mk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F71510E704
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 23:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719962941; x=1751498941;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=oHA8Sy9A7uPs+fJ0r+jEmZX0zP81xfrPwIuiTKNWsXE=;
 b=l2UYt7mkRrM79iGxuGasI1hj5VSZIm7SvIDPuF5gpsESBgadlOSSIu6e
 2b4ziy8Duqwz8pGI+Ju2jP0WnAOP499BcW4rmaWdTBjVw8dW8kLKfi+Oh
 1AvHIWDQmG6rlIdX0IpRbAiZrtIO5GvlS1lI1j3nuSHfimhFQVVs6jVgZ
 7B/BTRp9YiuBUC5oYgIzDSXe3Hixk2aN2NFr3W3wERg50gBwj4UuB5xT7
 PAXOTzTKGBOMmrSBevNhGx9wSv3gdHV3CV5e/KMvR6UfzCnfDA/L2woBJ
 Mc3cG3GACFmDtMUZS6SUrLNzK2g0uyRTeWE4AF9yRueklDzW+uIYAOkwE A==;
X-CSE-ConnectionGUID: OpoJIds9SlqyADKYbgb/lA==
X-CSE-MsgGUID: Y89oaELjSlipLGSxBgKLWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28559564"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="28559564"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 16:29:00 -0700
X-CSE-ConnectionGUID: RHA+veSxRLqe/OpnBKQPEg==
X-CSE-MsgGUID: wbOEFNf3RmK8PkvrMh6oBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46043823"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Jul 2024 16:28:58 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 02:28:57 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 14/37] lib/igt_fb: Extract is_gen12_rc_ccs_cc_modifier()
Date: Wed,  3 Jul 2024 02:27:54 +0300
Message-ID: <20240702232817.31147-15-ville.syrjala@linux.intel.com>
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

Extract a helper to identify the clear color compressed modifiers.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_fb.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 857ffb6547a3..c48a61b5f148 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -594,15 +594,20 @@ static bool is_gen12_mc_ccs_modifier(uint64_t modifier)
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

