Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A41EC47DD9
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 16:32:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9CFF1125D9;
	Fri, 22 Mar 2024 16:32:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cgyuD8K9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D6A1125D9
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 16:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711125177; x=1742661177;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=lLBlNqVtEslJzkgxbMbYKKpYk5c5TajPjGh6/cKUFXA=;
 b=cgyuD8K9L6C/aO9Fu3cNSXptJ73sTh+768w/p9gViA19FWvw8itOm+f9
 JADuIBbTKCpNQboDdQfK0ndGRC1ZNKYir1yymvhz5q6FA6WXsqe2mjPSG
 JCTEPsuUvr0TeP9a7L/FQSCrM0709F39XokIyY3Y7Dcpdvu5ss/Kiipfb
 RymJB1MJJbfr51iAi++ffy18ToKnz0Hu9qK5zfl3cD1TEOzGDTgHdiIyF
 QTKy0xqqjrY7RmTD8uZALcEhyAygwpM+vTtUrdwCBpJhRz5Wz6Val2qnS
 4jNjwdJtArHY6mAjDpST8vTQhx1FNewen+rYv0S+hXRqb5LRHrgW9ZFjG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="17575005"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="17575005"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 09:32:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="827783530"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="827783530"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 22 Mar 2024 09:32:55 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Mar 2024 18:32:54 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/5] tools/intel_vbt_decode: Extract dump_panel()
Date: Fri, 22 Mar 2024 18:32:47 +0200
Message-ID: <20240322163251.11102-2-ville.syrjala@linux.intel.com>
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

Pull the repeated "dump this panel?" expression
into a small helper.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index fd8118772845..9a65a67b42bf 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -84,6 +84,12 @@ struct context {
 	bool hexdump;
 };
 
+static bool dump_panel(const struct context *context, int panel_type)
+{
+	return panel_type == context->panel_type ||
+		context->dump_all_panel_types;
+}
+
 /* Get BDB block size given a pointer to Block ID. */
 static uint32_t _get_blocksize(const uint8_t *block_base)
 {
@@ -607,7 +613,7 @@ static void dump_backlight_info(struct context *context,
 	}
 
 	for (i = 0; i < ARRAY_SIZE(backlight->data); i++) {
-		if (i != context->panel_type && !context->dump_all_panel_types)
+		if (!dump_panel(context, i))
 			continue;
 
 		printf("\tPanel %d%s\n", i,
@@ -1222,7 +1228,7 @@ static void dump_lvds_options(struct context *context,
 	for (int i = 0; i < 16; i++) {
 		unsigned int val;
 
-		if (i != context->panel_type && !context->dump_all_panel_types)
+		if (!dump_panel(context, i))
 			continue;
 
 		printf("\tPanel %d%s\n", i, context->panel_type == i ? " *" : "");
@@ -1289,7 +1295,7 @@ static void dump_lvds_ptr_data(struct context *context,
 	printf("\tNumber of entries: %d\n", ptrs->lvds_entries);
 
 	for (int i = 0; i < 16; i++) {
-		if (i != context->panel_type && !context->dump_all_panel_types)
+		if (!dump_panel(context, i))
 			continue;
 
 		printf("\tPanel %d%s\n", i, context->panel_type == i ? " *" : "");
@@ -1361,7 +1367,7 @@ static void dump_lvds_data(struct context *context,
 			block_data(block) + ptrs->panel_name.offset;
 		char mfg[4];
 
-		if (i != context->panel_type && !context->dump_all_panel_types)
+		if (!dump_panel(context, i))
 			continue;
 
 		hdisplay = _H_ACTIVE(timing_data);
@@ -1571,7 +1577,7 @@ static void dump_edp(struct context *context,
 	int i;
 
 	for (i = 0; i < 16; i++) {
-		if (i != context->panel_type && !context->dump_all_panel_types)
+		if (!dump_panel(context, i))
 			continue;
 
 		printf("\tPanel %d%s\n", i, context->panel_type == i ? " *" : "");
@@ -1714,7 +1720,7 @@ static void dump_psr(struct context *context,
 	for (i = 0; i < 16; i++) {
 		const struct psr_table *psr = &psr_block->psr_table[i];
 
-		if (i != context->panel_type && !context->dump_all_panel_types)
+		if (!dump_panel(context, i))
 			continue;
 
 		printf("\tPanel %d%s\n", i, context->panel_type == i ? " *" : "");
@@ -1791,7 +1797,7 @@ static void dump_lfp_power(struct context *context,
 		return;
 
 	for (i = 0; i < 16; i++) {
-		if (i != context->panel_type && !context->dump_all_panel_types)
+		if (!dump_panel(context, i))
 			continue;
 
 		printf("\tPanel %d%s\n", i, context->panel_type == i ? " *" : "");
@@ -1923,7 +1929,7 @@ static void dump_mipi_config(struct context *context,
 		const struct edp_pwm_delays *pwm_delays =
 			&start->pwm_delays[context->panel_type];
 
-		if (i != context->panel_type && !context->dump_all_panel_types)
+		if (!dump_panel(context, i))
 			continue;
 
 		printf("\tPanel %d%s\n", i,
@@ -2372,7 +2378,7 @@ static void dump_mipi_sequence(struct context *context,
 		uint32_t seq_size;
 		int index = 0;
 
-		if (i != context->panel_type && !context->dump_all_panel_types)
+		if (!dump_panel(context, i))
 			continue;
 
 		data = find_panel_sequence_block(sequence, i,
@@ -2467,7 +2473,7 @@ static void dump_compression_parameters(struct context *context,
 		/* FIXME: need to handle sizeof(*data) != dsc->entry_size */
 		data = &dsc->data[i];
 
-		if (i != context->panel_type && !context->dump_all_panel_types)
+		if (!dump_panel(context, i))
 			continue;
 
 		printf("\tDSC block %d%s\n", i,
-- 
2.43.2

