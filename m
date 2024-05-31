Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7ADC41513
	for <igt-dev@archiver.kernel.org>; Fri, 31 May 2024 14:24:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F279E10E0D3;
	Fri, 31 May 2024 14:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O1G1DfUv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5140410E21E
 for <igt-dev@lists.freedesktop.org>; Fri, 31 May 2024 14:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717165497; x=1748701497;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=bgWEnuwCCvBUdOem3r4sMPTvtPnhcB2Axj2atuRSNbQ=;
 b=O1G1DfUv9wkEHLk/5vUJ+r0PNVm5cXTduns+u5HMjVJeRqwq26cWta0B
 YFxGSNrrTk9gjweHaC4wQ5cIrqIxSxSkSFsahvD0lFggrYleuJ2lp8LZF
 s0Nu9VtzQIXONlQPUZrzrnlWFxXkvFhagljlv+GAY6VaiEsf+KHTpkriJ
 UuAI+8R5GOM+8YBZMpaD9XzqaXwnnvMmWJ7E8lslfUztWNogyNVhWnlWx
 JZmcRwMuEScTMECNg06d7FgAg8/w+TsVTfnaoeZHPjQJFnwwObwNmbTqo
 L/Y5M/QfBLj3vChSGFBC4t6vGD/fKSwX8csH3YSMtfRNKaUcwyygimnlt g==;
X-CSE-ConnectionGUID: MRrxwpFNRSW/7lysAgQ5+A==
X-CSE-MsgGUID: xsvb8To0T3iUFfqsE3UrfA==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="25113650"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="25113650"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 07:24:00 -0700
X-CSE-ConnectionGUID: oEKY2d6eSl6JpjaSGTrqYQ==
X-CSE-MsgGUID: I2A1XBT2Qfayht/tE7o8rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="36160796"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 31 May 2024 07:23:57 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 31 May 2024 17:23:56 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 01/20] tools/intel_vbt_decode: Finish the s/lvds/lfp/
 rename
Date: Fri, 31 May 2024 17:23:35 +0300
Message-ID: <20240531142354.16528-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240531142354.16528-1-ville.syrjala@linux.intel.com>
References: <20240531142354.16528-1-ville.syrjala@linux.intel.com>
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

The structs were renamed from lvds to lfp, but a bunch of other
stuff is still using the old inaccuarate name. Finish the move
to the new naming scheme.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 54 ++++++++++++++++++++--------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 6b63bcf0bc7c..9d05de3f9975 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -205,8 +205,8 @@ static size_t lfp_data_min_size(const struct context *context)
 	return size;
 }
 
-static int make_lvds_data_ptr(struct lfp_data_ptr_table *table,
-			      int table_size, int total_size)
+static int make_lfp_data_ptr(struct lfp_data_ptr_table *table,
+			     int table_size, int total_size)
 {
 	if (total_size < table_size)
 		return total_size;
@@ -217,15 +217,15 @@ static int make_lvds_data_ptr(struct lfp_data_ptr_table *table,
 	return total_size - table_size;
 }
 
-static void next_lvds_data_ptr(struct lfp_data_ptr_table *next,
-			       const struct lfp_data_ptr_table *prev,
-			       int size)
+static void next_lfp_data_ptr(struct lfp_data_ptr_table *next,
+			      const struct lfp_data_ptr_table *prev,
+			      int size)
 {
 	next->table_size = prev->table_size;
 	next->offset = prev->offset + size;
 }
 
-static void *generate_lvds_data_ptrs(const struct context *context)
+static void *generate_lfp_data_ptrs(const struct context *context)
 {
 	int size, table_size, block_size, offset, fp_timing_size;
 	const void *block;
@@ -265,13 +265,13 @@ static void *generate_lvds_data_ptrs(const struct context *context)
 	ptrs = ptrs_block + 3;
 
 	table_size = sizeof(struct bdb_edid_pnp_id);
-	size = make_lvds_data_ptr(&ptrs->ptr[0].panel_pnp_id, table_size, size);
+	size = make_lfp_data_ptr(&ptrs->ptr[0].panel_pnp_id, table_size, size);
 
 	table_size = sizeof(struct bdb_edid_dtd);
-	size = make_lvds_data_ptr(&ptrs->ptr[0].dvo_timing, table_size, size);
+	size = make_lfp_data_ptr(&ptrs->ptr[0].dvo_timing, table_size, size);
 
 	table_size = fp_timing_size;
-	size = make_lvds_data_ptr(&ptrs->ptr[0].fp_timing, table_size, size);
+	size = make_lfp_data_ptr(&ptrs->ptr[0].fp_timing, table_size, size);
 
 	if (ptrs->ptr[0].fp_timing.table_size)
 		ptrs->num_entries++;
@@ -286,9 +286,9 @@ static void *generate_lvds_data_ptrs(const struct context *context)
 	size = fp_timing_size + sizeof(struct bdb_edid_dtd) +
 		sizeof(struct bdb_edid_pnp_id);
 	for (int i = 1; i < 16; i++) {
-		next_lvds_data_ptr(&ptrs->ptr[i].fp_timing, &ptrs->ptr[i-1].fp_timing, size);
-		next_lvds_data_ptr(&ptrs->ptr[i].dvo_timing, &ptrs->ptr[i-1].dvo_timing, size);
-		next_lvds_data_ptr(&ptrs->ptr[i].panel_pnp_id, &ptrs->ptr[i-1].panel_pnp_id, size);
+		next_lfp_data_ptr(&ptrs->ptr[i].fp_timing, &ptrs->ptr[i-1].fp_timing, size);
+		next_lfp_data_ptr(&ptrs->ptr[i].dvo_timing, &ptrs->ptr[i-1].dvo_timing, size);
+		next_lfp_data_ptr(&ptrs->ptr[i].panel_pnp_id, &ptrs->ptr[i-1].panel_pnp_id, size);
 	}
 
 	table_size = sizeof(struct bdb_edid_product_name);
@@ -488,8 +488,8 @@ static struct bdb_block *find_section(const struct context *context, int section
 
 	data = find_raw_section(context, section_id);
 	if (!data && section_id == BDB_LFP_DATA_PTRS) {
-		fprintf(stderr, "Generating LVDS data table pointers\n");
-		temp_block = generate_lvds_data_ptrs(context);
+		fprintf(stderr, "Generating LFP data table pointers\n");
+		temp_block = generate_lfp_data_ptrs(context);
 		if (temp_block)
 			data = temp_block + 3;
 	}
@@ -1261,8 +1261,8 @@ static const char * const pos_type[] = {
 	[3] = "reserved",
 };
 
-static void dump_lvds_options(struct context *context,
-			      const struct bdb_block *block)
+static void dump_lfp_options(struct context *context,
+			     const struct bdb_block *block)
 {
 	const struct bdb_lfp_options *options = block_data(block);
 
@@ -1343,7 +1343,7 @@ static void dump_lvds_options(struct context *context,
 	}
 }
 
-static void dump_lvds_ptr_data(struct context *context,
+static void dump_lfp_data_ptrs(struct context *context,
 			       const struct bdb_block *block)
 {
 	const struct bdb_lfp_data_ptrs *ptrs = block_data(block);
@@ -1396,8 +1396,8 @@ static char *decode_pnp_id(u16 mfg_name, char str[4])
 	return str;
 }
 
-static void dump_lvds_data(struct context *context,
-			   const struct bdb_block *block)
+static void dump_lfp_data(struct context *context,
+			  const struct bdb_block *block)
 {
 	struct bdb_block *ptrs_block;
 	const struct bdb_lfp_data_ptrs *ptrs;
@@ -2627,7 +2627,7 @@ static int get_panel_type_pnpid(const struct context *context,
 	return best;
 }
 
-/* get panel type from lvds options block, or -1 if block not found */
+/* get panel type from lfp options block, or -1 if block not found */
 static int get_panel_type(struct context *context, bool is_panel_type2)
 {
 	struct bdb_block *block;
@@ -2694,22 +2694,22 @@ struct dumper dumpers[] = {
 	},
 	{
 		.id = BDB_LFP_OPTIONS,
-		.name = "LVDS options block",
-		.dump = dump_lvds_options,
+		.name = "LFP options block",
+		.dump = dump_lfp_options,
 	},
 	{
 		.id = BDB_LFP_DATA_PTRS,
-		.name = "LVDS timing pointer data",
-		.dump = dump_lvds_ptr_data,
+		.name = "LFP data table pointers",
+		.dump = dump_lfp_data_ptrs,
 	},
 	{
 		.id = BDB_LFP_DATA,
-		.name = "LVDS panel data block",
-		.dump = dump_lvds_data,
+		.name = "LFP data table block",
+		.dump = dump_lfp_data,
 	},
 	{
 		.id = BDB_LFP_BACKLIGHT,
-		.name = "Backlight info block",
+		.name = "LFP backlight info block",
 		.dump = dump_backlight_info,
 	},
 	{
-- 
2.44.1

