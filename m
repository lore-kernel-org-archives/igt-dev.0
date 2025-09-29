Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BA1CAC5B0
	for <igt-dev@archiver.kernel.org>; Mon, 29 Sep 2025 19:07:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA3FE10E48A;
	Mon, 29 Sep 2025 19:07:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QLBW1q9z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FFA10E48A
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Sep 2025 19:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759172853; x=1790708853;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=lXb1enMoy8a6N+yqGPGEXcsZ+nA3Gu2J5Jx2CHMFErE=;
 b=QLBW1q9zc/jrcUCvngjVyNp+D9tSh49RSzMrbU5F7BoFZE5BfOKBxqlK
 Ax1hpe4aDbxy2tNikG88KkCQoNyTUyEYCyj2GmUkLrNvOhj1OKWrM0iia
 fFXn5tccPUqYy5VVqLMW/ygbYzlKHbmyZ77VD5P7LlR/bFsp4zVwkBIL/
 2RWjeE4hEQm/7Fhgm4EQk+Qx+FOzq4QeYmCDi46BlK+fmmgoMtv7l+deg
 Qu1yc5Ixkz8aZt8CydbEKsfb+FuB0IWZRwitqcT1hcaDhL8uaO/pzXPVN
 Pjlkq7v3JfzMkj/rnuVAtI7O1AFIziHk9kO6grIlDO8cem4FEQyeSiVny w==;
X-CSE-ConnectionGUID: Jjex4HTJRPmzaUeO5CnVCA==
X-CSE-MsgGUID: 48ScVYJNRKaKpabYv+wMqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="65058565"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="65058565"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 12:07:33 -0700
X-CSE-ConnectionGUID: IVMqc67+Q3ev2+zyJVNCjA==
X-CSE-MsgGUID: jgpu9BEBQ6WRDqKK2odLpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="178120768"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.198])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 12:07:32 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/6] tools/intel_vbt_decode: Use to_str() more
Date: Mon, 29 Sep 2025 22:07:17 +0300
Message-ID: <20250929190721.29997-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250929190721.29997-1-ville.syrjala@linux.intel.com>
References: <20250929190721.29997-1-ville.syrjala@linux.intel.com>
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

Convert all the naked string array dereferences to to_str()
instead. Not strictly necessary in these cases (since the
VBT bitfields doen't have unused values) but it seems better
to stick to the same formula for all decoding.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index dbcba3b9cd3b..2f228fcd14b7 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -655,7 +655,7 @@ static int decode_ssc_freq(struct context *context, bool alternate)
 	}
 }
 
-static const char * const panel_fitting[] = {
+static const char * const panel_fitting_str[] = {
 	[0] = "disabled",
 	[1] = "text only",
 	[2] = "graphics only",
@@ -668,7 +668,7 @@ static void dump_general_features(struct context *context,
 	const struct bdb_general_features *features = block_data(block);
 
 	printf("\tPanel fitting: %s (0x%x)\n",
-	       panel_fitting[features->panel_fitting], features->panel_fitting);
+	       to_str(panel_fitting_str, features->panel_fitting), features->panel_fitting);
 	printf("\tFlexaim: %s\n", YESNO(features->flexaim));
 	printf("\tMessage: %s\n", YESNO(features->msg_enable));
 	printf("\tClear screen: %d\n", features->clear_screen);
@@ -1504,28 +1504,28 @@ static void dump_legacy_child_devices(struct context *context,
 			   child_dev_num, defs->child_dev_size);
 }
 
-static const char * const channel_type[] = {
+static const char * const channel_type_str[] = {
 	[0] = "automatic",
 	[1] = "single",
 	[2] = "dual",
 	[3] = "reserved",
 };
 
-static const char * const dps_type[] = {
+static const char * const dps_type_str[] = {
 	[0] = "static DRRS",
 	[1] = "D2PO",
 	[2] = "seamless DRRS",
 	[3] = "reserved",
 };
 
-static const char * const blt_type[] = {
+static const char * const blt_type_str[] = {
 	[0] = "default",
 	[1] = "CCFL",
 	[2] = "LED",
 	[3] = "reserved",
 };
 
-static const char * const pos_type[] = {
+static const char * const pos_type_str[] = {
 	[0] = "inside shell",
 	[1] = "outside shell",
 	[2] = "reserved",
@@ -1562,7 +1562,7 @@ static void dump_lfp_options(struct context *context,
 
 		val = panel_bits(options->lvds_panel_channel_bits, i, 2);
 		printf("\t\tChannel type: %s (0x%x)\n",
-		       channel_type[val], val);
+		       to_str(channel_type_str, val), val);
 
 		printf("\t\tSSC: %s\n",
 		       YESNO(panel_bool(options->ssc_bits, i)));
@@ -1586,11 +1586,11 @@ static void dump_lfp_options(struct context *context,
 
 		val = panel_bits(options->dps_panel_type_bits, i, 2);
 		printf("\t\tDPS type: %s (0x%x)\n",
-		       dps_type[val], val);
+		       to_str(dps_type_str, val), val);
 
 		val = panel_bits(options->blt_control_type_bits, i, 2);
 		printf("\t\tBacklight type: %s (0x%x)\n",
-		       blt_type[val], val);
+		       to_str(blt_type_str, val), val);
 
 		if (context->bdb->version < 200)
 			continue;
@@ -1610,7 +1610,7 @@ static void dump_lfp_options(struct context *context,
 
 		val = panel_bits((options->position), i, 2);
 		printf("\t\tPanel position: %s (0x%x)\n",
-		       pos_type[val], val);
+		       to_str(pos_type_str, val), val);
 	}
 }
 
@@ -1807,7 +1807,7 @@ static void dump_lfp_data(struct context *context,
 	free(ptrs_block);
 }
 
-static const char * const lvds_config[] = {
+static const char * const lvds_config_str[] = {
 	[BDB_DRIVER_FEATURE_NO_LVDS] = "No LVDS",
 	[BDB_DRIVER_FEATURE_INT_LVDS] = "Integrated LVDS",
 	[BDB_DRIVER_FEATURE_SDVO_LVDS] = "SDVO LVDS",
@@ -1869,7 +1869,7 @@ static void dump_driver_feature(struct context *context,
 	printf("\tCRT hotplug: %s\n", YESNO(feature->crt_hotplug));
 
 	printf("\tLVDS config: %s (0x%x)\n",
-	       lvds_config[feature->lvds_config], feature->lvds_config);
+	       to_str(lvds_config_str, feature->lvds_config), feature->lvds_config);
 	printf("\tTV hotplug: %s\n",
 	       YESNO(feature->tv_hotplug));
 
@@ -2325,11 +2325,11 @@ static void dump_efp_list(struct context *context,
 	}
 }
 
-static const char * const underscan_overscan[] = {
-	"Neither",
-	"Underscan/Overscan",
-	"Overscan only",
-	"Underscan only",
+static const char * const underscan_overscan_str[] = {
+	[0] = "Neither",
+	[1] = "Underscan/Overscan",
+	[2] = "Overscan only",
+	[3] = "Underscan only",
 };
 
 static void dump_tv_options(struct context *context,
@@ -2342,9 +2342,9 @@ static void dump_tv_options(struct context *context,
 	printf("\tAdd modes to avoid overscan issue: %s\n",
 	       YESNO(tv->add_modes_to_avoid_overscan_issue));
 	printf("\tUndescan/Overscan for HDTV via DVI: %s\n",
-	       underscan_overscan[tv->underscan_overscan_hdtv_dvi]);
+	       to_str(underscan_overscan_str, tv->underscan_overscan_hdtv_dvi));
 	printf("\tUndescan/Overscan for HDTV via component: %s\n",
-	       underscan_overscan[tv->underscan_overscan_hdtv_component]);
+	       to_str(underscan_overscan_str, tv->underscan_overscan_hdtv_component));
 }
 
 static void dump_edp(struct context *context,
-- 
2.49.1

