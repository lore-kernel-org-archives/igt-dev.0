Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DE2CAC5B9
	for <igt-dev@archiver.kernel.org>; Mon, 29 Sep 2025 19:21:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EFC810E48F;
	Mon, 29 Sep 2025 19:21:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ORf/ILy6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 085B510E499
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Sep 2025 19:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759173701; x=1790709701;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=tuyNZQIV2hprlaUqRveEvzNVuZiBJOmHtx0pdMTho7o=;
 b=ORf/ILy6rY7UUMJUrRd0D+VXRmvCoVvUXZJnKzUTKbif30CI/tqhFbTc
 W5f59wt62PUZZHOKZV2cTmzMwDAT15SC0WWgbxI4YMwCwLdQCv7iAiyCd
 ENFGPdm7NfaC3SK5IIJfiHlm0mw6NdW7yWuxFyTIc+ubXtSGC8EzmCM/L
 mwu0ESznwmIYhoryAvd2h+UJBVO4YlswAytdKjk6n6sSUu+wOF7wwLe4I
 IlCewd+0F1GcQr09qphG4IlfiRiZ/DjTfMY9rmXOXLlIab64lLsPODgX1
 oSgzD7fNtA+AbDLjrEQVMGKO3cbsf0MC6yB5gvz/eTidv2s22KAdfZuQY w==;
X-CSE-ConnectionGUID: V+eog+SoQAq9eM7K+OhVZQ==
X-CSE-MsgGUID: XX+EeQxUSTexXb8NL/Agug==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61589842"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="61589842"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 12:21:41 -0700
X-CSE-ConnectionGUID: P7aHzT12RMmqSJZF11+kjg==
X-CSE-MsgGUID: EoYADzRoSL6Th88fEMPbZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="178250187"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.198])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 12:21:40 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 3/6] tools/intel_vbt_decode: Convert eDP deocding to use
 to_str()
Date: Mon, 29 Sep 2025 22:21:23 +0300
Message-ID: <20250929192127.5865-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250929192127.5865-1-ville.syrjala@linux.intel.com>
References: <20250929192127.5865-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Use to_str() when decoding a bunch of eDP related fields.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 68 +++++++++++++++-------------------------
 1 file changed, 25 insertions(+), 43 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 2f228fcd14b7..9fece741840b 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -2347,6 +2347,23 @@ static void dump_tv_options(struct context *context,
 	       to_str(underscan_overscan_str, tv->underscan_overscan_hdtv_component));
 }
 
+static const char * const edp_bpp_str[] = {
+	[EDP_18BPP] = "18 bpp",
+	[EDP_24BPP] = "24 bpp",
+	[EDP_30BPP] = "30 bpp",
+};
+
+static const char * const edp_rate_str[] = {
+	[EDP_RATE_1_62] = "1.62Gbps",
+	[EDP_RATE_2_7] = "2.7Gbps",
+	[EDP_RATE_5_4] = "5.4Gbps",
+};
+
+static const char * const edp_preemph_str[] = {
+	[0] = "Low power (200 mV)",
+	[1] = "Default (400 mV)",
+};
+
 static void dump_edp(struct context *context,
 		     const struct bdb_block *block)
 {
@@ -2369,42 +2386,17 @@ static void dump_edp(struct context *context,
 
 		bpp = panel_bits(edp->color_depth, i, 2);
 
-		printf("\t\tPanel color depth: ");
-		switch (bpp) {
-		case EDP_18BPP:
-			printf("18 bpp\n");
-			break;
-		case EDP_24BPP:
-			printf("24 bpp\n");
-			break;
-		case EDP_30BPP:
-			printf("30 bpp\n");
-			break;
-		default:
-			printf("(unknown value %d)\n", bpp);
-			break;
-		}
+		printf("\t\tPanel color depth: %s (0x%x)\n",
+		       to_str(edp_bpp_str, bpp), bpp);
 
 		msa = panel_bits(edp->sdrrs_msa_timing_delay, i, 2);
 		printf("\t\teDP sDRRS MSA Delay: Lane %d\n", msa + 1);
 
 		printf("\t\tFast link params:\n");
-		printf("\t\t\trate: ");
-		switch (edp->fast_link_params[i].rate) {
-		case EDP_RATE_1_62:
-			printf("1.62Gbps\n");
-			break;
-		case EDP_RATE_2_7:
-			printf("2.7Gbpc\n");
-			break;
-		case EDP_RATE_5_4:
-			printf("5.4Gbps\n");
-			break;
-		default:
-			printf("(unknonn value %d)\n",
-			       edp->fast_link_params[i].rate);
-			break;
-		}
+		printf("\t\t\trate: %s (0x%x)\n",
+		       to_str(edp_rate_str, edp->fast_link_params[i].rate),
+		       edp->fast_link_params[i].rate);
+
 		printf("\t\t\tlanes: X%d\n",
 		       edp->fast_link_params[i].lanes + 1);
 		printf("\t\t\tpre-emphasis: %s (0x%x)\n",
@@ -2425,18 +2417,8 @@ static void dump_edp(struct context *context,
 		if (context->bdb->version >= 173) {
 			int val = (edp->edp_vswing_preemph >> (i * 4)) & 0xf;
 
-			printf("\t\tVswing/preemphasis table selection: ");
-			switch (val) {
-			case 0:
-				printf("Low power (200 mV)\n");
-				break;
-			case 1:
-				printf("Default (400 mV)\n");
-				break;
-			default:
-				printf("(unknown value %d)\n", val);
-				break;
-			}
+			printf("\t\tVswing/preemphasis table selection: %s (0x%x)\n",
+			       to_str(edp_preemph_str, val), val);
 		}
 
 		if (context->bdb->version >= 182)
-- 
2.49.1

