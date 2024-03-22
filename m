Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E213BC47DD9
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 16:33:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5561125DB;
	Fri, 22 Mar 2024 16:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LPqV3ehH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CBAA1125DC
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 16:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711125180; x=1742661180;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=5G4kUAgxZMdhsv6y6xaFZtHPpyWy5wEJyGZAL0H1k+A=;
 b=LPqV3ehHgO8hMjmbH4MD9FYYciNIVs4v9DPeYse2nDgZxK8gNXHRfXMY
 V0/ebPNKaUzL5+/9p/G2iTxujJbncUQTnpjELiaON4ByWSLcXo6FHv2mG
 M4EXlibKzWoC5BFx75V8FqS9CbWsx/3TghXGZ1hwVkx7vkdgRkUtavdQq
 kOeozp+9EisRuakaPshJ9Sxu0krsK2Q1kFKa8h0kOKBrAist+amXfLrcb
 Lq0N23NbG54wkxTQwol/EX6j/04uEMCqAKhVmG+4AzvSd0bKYOLkG42BS
 swhcY730rS1bbDPVkv52N36BYH9Hp/aJOFGSl/3WVCwqB1a+sBwUxKp/k Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="17575016"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="17575016"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 09:33:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="827783531"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="827783531"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 22 Mar 2024 09:32:58 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Mar 2024 18:32:57 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/5] tools/intel_vbt_decode: Extract panel_str()
Date: Fri, 22 Mar 2024 18:32:48 +0200
Message-ID: <20240322163251.11102-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240322163251.11102-1-ville.syrjala@linux.intel.com>
References: <20240322163251.11102-1-ville.syrjala@linux.intel.com>
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

Extract the code to generate the palen==panel_type indicator
string to a small helper.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 9a65a67b42bf..2473812cca6d 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -90,6 +90,11 @@ static bool dump_panel(const struct context *context, int panel_type)
 		context->dump_all_panel_types;
 }
 
+static const char *panel_str(const struct context *context, int panel_type)
+{
+	return panel_type == context->panel_type ? " *" : "";
+}
+
 /* Get BDB block size given a pointer to Block ID. */
 static uint32_t _get_blocksize(const uint8_t *block_base)
 {
@@ -616,8 +621,7 @@ static void dump_backlight_info(struct context *context,
 		if (!dump_panel(context, i))
 			continue;
 
-		printf("\tPanel %d%s\n", i,
-		       context->panel_type == i ? " *" : "");
+		printf("\tPanel %d%s\n", i, panel_str(context, i));
 
 		blc = &backlight->data[i];
 
@@ -1231,7 +1235,7 @@ static void dump_lvds_options(struct context *context,
 		if (!dump_panel(context, i))
 			continue;
 
-		printf("\tPanel %d%s\n", i, context->panel_type == i ? " *" : "");
+		printf("\tPanel %d%s\n", i, panel_str(context, i));
 
 		val = panel_bits(options->lvds_panel_channel_bits, i, 2);
 		printf("\t\tChannel type: %s (0x%x)\n",
@@ -1298,7 +1302,7 @@ static void dump_lvds_ptr_data(struct context *context,
 		if (!dump_panel(context, i))
 			continue;
 
-		printf("\tPanel %d%s\n", i, context->panel_type == i ? " *" : "");
+		printf("\tPanel %d%s\n", i, panel_str(context, i));
 
 		if (ptrs->lvds_entries >= 1) {
 			printf("\t\tFP timing offset: %d\n",
@@ -1381,7 +1385,7 @@ static void dump_lvds_data(struct context *context,
 		vtotal = vdisplay + _V_BLANK(timing_data);
 		clock = _PIXEL_CLOCK(timing_data) / 1000;
 
-		printf("\tPanel %d%s\n", i, context->panel_type == i ? " *" : "");
+		printf("\tPanel %d%s\n", i, panel_str(context, i));
 		printf("\t\t%dx%d clock %d\n",
 		       fp_timing->x_res, fp_timing->y_res,
 		       _PIXEL_CLOCK(timing_data));
@@ -1580,7 +1584,7 @@ static void dump_edp(struct context *context,
 		if (!dump_panel(context, i))
 			continue;
 
-		printf("\tPanel %d%s\n", i, context->panel_type == i ? " *" : "");
+		printf("\tPanel %d%s\n", i, panel_str(context, i));
 
 		printf("\t\tPower Sequence: T3 %d T7 %d T9 %d T10 %d T12 %d\n",
 		       edp->power_seqs[i].t3,
@@ -1723,7 +1727,7 @@ static void dump_psr(struct context *context,
 		if (!dump_panel(context, i))
 			continue;
 
-		printf("\tPanel %d%s\n", i, context->panel_type == i ? " *" : "");
+		printf("\tPanel %d%s\n", i, panel_str(context, i));
 
 		printf("\t\tFull link: %s\n", YESNO(psr->full_link));
 		printf("\t\tRequire AUX to wakeup: %s\n", YESNO(psr->require_aux_to_wakeup));
@@ -1800,7 +1804,7 @@ static void dump_lfp_power(struct context *context,
 		if (!dump_panel(context, i))
 			continue;
 
-		printf("\tPanel %d%s\n", i, context->panel_type == i ? " *" : "");
+		printf("\tPanel %d%s\n", i, panel_str(context, i));
 
 		printf("\t\tDisplay Power Saving Technology (DPST): %s\n",
 		       YESNO(panel_bool(lfp_block->dpst, i)));
@@ -1932,8 +1936,7 @@ static void dump_mipi_config(struct context *context,
 		if (!dump_panel(context, i))
 			continue;
 
-		printf("\tPanel %d%s\n", i,
-		       context->panel_type == i ? " *" : "");
+		printf("\tPanel %d%s\n", i, panel_str(context, i));
 
 		printf("\t\tGeneral Param\n");
 		printf("\t\t\t BTA disable: %s\n", config->bta ? "Disabled" : "Enabled");
@@ -2386,8 +2389,7 @@ static void dump_mipi_sequence(struct context *context,
 		if (!data)
 			return;
 
-		printf("\tPanel %d%s\n", i,
-		       context->panel_type == i ? " *" : "");
+		printf("\tPanel %d%s\n", i, panel_str(context, i));
 
 		/* Parse the sequences. Corresponds to VBT parsing in the kernel. */
 		for (;;) {
@@ -2476,8 +2478,7 @@ static void dump_compression_parameters(struct context *context,
 		if (!dump_panel(context, i))
 			continue;
 
-		printf("\tDSC block %d%s\n", i,
-		       i == context->panel_type ? " *" : "");
+		printf("\tDSC block %d%s\n", i, panel_str(context, i));
 		printf("\t\tDSC version: %u.%u\n", data->version_major,
 		       data->version_minor);
 		printf("\t\tActual buffer size: %d\n",
-- 
2.43.2

