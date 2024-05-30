Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F84C27C43
	for <igt-dev@archiver.kernel.org>; Thu, 30 May 2024 15:26:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF3910F07B;
	Thu, 30 May 2024 15:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ITWoWT+E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 829D710F7FE
 for <igt-dev@lists.freedesktop.org>; Thu, 30 May 2024 15:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717082788; x=1748618788;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EJAvRyepnU1WLZNiTKDaOq9HLNKPe7LuqFeTY8B+dls=;
 b=ITWoWT+EVwwLUBwAoBbkdPJaF3zIlIlCIfLCh54PwDoFRa1yd5pxZKli
 IJOiNKylI12gYe0QrmDIsngODPh3gFdDlhn82cshdn6vSjLsmrtmSBO9d
 wjCdt5/++rqGSEnsXw3JrrJeBuH49I9YQMQiSbuoJQYSwkBW0l8wy8lqN
 9UjE6k/uoVVnRiavuEwIuTt+ef0XGqBEBnGfFXAogKwfcrAAGzzZ6UuDz
 w1Oy1GeBCTsxNXS+6lBLqqlzpc28BIkmD1FTX+/YecMJrDeNvunz6fY8x
 F7jL6x5gIT3zvBB4luo7KwCIXts1okOiVHf5agLiyOVPrXoxEa2zow2rI Q==;
X-CSE-ConnectionGUID: QokOjBocS4++12+7AB9ESA==
X-CSE-MsgGUID: +nKd1wahTmyrwHMJdK0mTQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24697833"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="24697833"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 08:26:27 -0700
X-CSE-ConnectionGUID: dxjguD8SSPCd5yzGFi4JcA==
X-CSE-MsgGUID: 48PgR/e2R9uCEA7RGmP+5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="36328225"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 08:26:26 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 3/5] tools/intel_vbt_decode: sync intel_vbt_defs.h with
 kernel commit 6ac67ccf4c89
Date: Thu, 30 May 2024 18:26:06 +0300
Message-Id: <bff70c9839bbe6c6cdf85779a5e1f106ecfa4c54.1717082630.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1717082630.git.jani.nikula@intel.com>
References: <cover.1717082630.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

Synchronize intel_vbt_defs.h with kernel commit:

6ac67ccf4c89 ("drm/i915/bios: Get rid of "LVDS" from all LFP data stuff")

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tools/intel_vbt_decode.c | 98 ++++++++++++++++++++--------------------
 tools/intel_vbt_defs.h   | 46 +++++++++----------
 2 files changed, 72 insertions(+), 72 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index b9681f568517..bcec7eb54503 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -185,27 +185,27 @@ static struct bdb_block *find_section(const struct context *context, int section
 
 static size_t lfp_data_min_size(const struct context *context)
 {
-	const struct bdb_lvds_lfp_data_ptrs *ptrs;
+	const struct bdb_lfp_data_ptrs *ptrs;
 	struct bdb_block *ptrs_block;
 	size_t size;
 
-	ptrs_block = find_section(context, BDB_LVDS_LFP_DATA_PTRS);
+	ptrs_block = find_section(context, BDB_LFP_DATA_PTRS);
 	if (!ptrs_block)
 		return 0;
 
 	ptrs = block_data(ptrs_block);
 
-	size = sizeof(struct bdb_lvds_lfp_data);
+	size = sizeof(struct bdb_lfp_data);
 	if (ptrs->panel_name.table_size)
 		size = max(size, ptrs->panel_name.offset +
-			   sizeof(struct bdb_lvds_lfp_data_tail));
+			   sizeof(struct bdb_lfp_data_tail));
 
 	free(ptrs_block);
 
 	return size;
 }
 
-static int make_lvds_data_ptr(struct lvds_lfp_data_ptr_table *table,
+static int make_lvds_data_ptr(struct lfp_data_ptr_table *table,
 			      int table_size, int total_size)
 {
 	if (total_size < table_size)
@@ -217,8 +217,8 @@ static int make_lvds_data_ptr(struct lvds_lfp_data_ptr_table *table,
 	return total_size - table_size;
 }
 
-static void next_lvds_data_ptr(struct lvds_lfp_data_ptr_table *next,
-			       const struct lvds_lfp_data_ptr_table *prev,
+static void next_lvds_data_ptr(struct lfp_data_ptr_table *next,
+			       const struct lfp_data_ptr_table *prev,
 			       int size)
 {
 	next->table_size = prev->table_size;
@@ -229,7 +229,7 @@ static void *generate_lvds_data_ptrs(const struct context *context)
 {
 	int size, table_size, block_size, offset, fp_timing_size;
 	const void *block;
-	struct bdb_lvds_lfp_data_ptrs *ptrs;
+	struct bdb_lfp_data_ptrs *ptrs;
 	void *ptrs_block;
 
 	/*
@@ -243,7 +243,7 @@ static void *generate_lvds_data_ptrs(const struct context *context)
 
 	fp_timing_size = 38;
 
-	block = find_raw_section(context, BDB_LVDS_LFP_DATA);
+	block = find_raw_section(context, BDB_LFP_DATA);
 	if (!block)
 		return NULL;
 
@@ -260,7 +260,7 @@ static void *generate_lvds_data_ptrs(const struct context *context)
 	if (!ptrs_block)
 		return NULL;
 
-	*(uint8_t *)(ptrs_block + 0) = BDB_LVDS_LFP_DATA_PTRS;
+	*(uint8_t *)(ptrs_block + 0) = BDB_LFP_DATA_PTRS;
 	*(uint16_t *)(ptrs_block + 1) = sizeof(*ptrs);
 	ptrs = ptrs_block + 3;
 
@@ -274,13 +274,13 @@ static void *generate_lvds_data_ptrs(const struct context *context)
 	size = make_lvds_data_ptr(&ptrs->ptr[0].fp_timing, table_size, size);
 
 	if (ptrs->ptr[0].fp_timing.table_size)
-		ptrs->lvds_entries++;
+		ptrs->num_entries++;
 	if (ptrs->ptr[0].dvo_timing.table_size)
-		ptrs->lvds_entries++;
+		ptrs->num_entries++;
 	if (ptrs->ptr[0].panel_pnp_id.table_size)
-		ptrs->lvds_entries++;
+		ptrs->num_entries++;
 
-	if (size != 0 || ptrs->lvds_entries != 3)
+	if (size != 0 || ptrs->num_entries != 3)
 		return NULL;
 
 	size = fp_timing_size + sizeof(struct bdb_edid_dtd) +
@@ -331,14 +331,14 @@ static size_t block_min_size(const struct context *context, int section_id)
 		return 0;
 	case BDB_EDP:
 		return sizeof(struct bdb_edp);
-	case BDB_LVDS_OPTIONS:
-		return sizeof(struct bdb_lvds_options);
-	case BDB_LVDS_LFP_DATA_PTRS:
-		return sizeof(struct bdb_lvds_lfp_data_ptrs);
-	case BDB_LVDS_LFP_DATA:
+	case BDB_LFP_OPTIONS:
+		return sizeof(struct bdb_lfp_options);
+	case BDB_LFP_DATA_PTRS:
+		return sizeof(struct bdb_lfp_data_ptrs);
+	case BDB_LFP_DATA:
 		return lfp_data_min_size(context);
-	case BDB_LVDS_BACKLIGHT:
-		return sizeof(struct bdb_lfp_backlight_data);
+	case BDB_LFP_BACKLIGHT:
+		return sizeof(struct bdb_lfp_backlight);
 	case BDB_LFP_POWER:
 		return sizeof(struct bdb_lfp_power);
 	case BDB_MIPI_CONFIG:
@@ -356,14 +356,14 @@ static size_t block_min_size(const struct context *context, int section_id)
 }
 
 static bool validate_lfp_data_ptrs(const struct context *context,
-				   const struct bdb_lvds_lfp_data_ptrs *ptrs)
+				   const struct bdb_lfp_data_ptrs *ptrs)
 {
 	int fp_timing_size, dvo_timing_size, panel_pnp_id_size, panel_name_size;
 	int data_block_size, lfp_data_size;
 	const void *block;
 	int i;
 
-	block = find_raw_section(context, BDB_LVDS_LFP_DATA);
+	block = find_raw_section(context, BDB_LFP_DATA);
 	if (!block)
 		return false;
 
@@ -372,7 +372,7 @@ static bool validate_lfp_data_ptrs(const struct context *context,
 		return false;
 
 	/* always 3 indicating the presence of fp_timing+dvo_timing+panel_pnp_id */
-	if (ptrs->lvds_entries != 3)
+	if (ptrs->num_entries != 3)
 		return false;
 
 	fp_timing_size = ptrs->ptr[0].fp_timing.table_size;
@@ -451,11 +451,11 @@ static bool validate_lfp_data_ptrs(const struct context *context,
 static bool fixup_lfp_data_ptrs(const struct context *context,
 				void *ptrs_block)
 {
-	struct bdb_lvds_lfp_data_ptrs *ptrs = ptrs_block;
+	struct bdb_lfp_data_ptrs *ptrs = ptrs_block;
 	u32 offset;
 	int i;
 
-	offset = raw_block_offset(context, BDB_LVDS_LFP_DATA);
+	offset = raw_block_offset(context, BDB_LFP_DATA);
 
 	for (i = 0; i < 16; i++) {
 		if (ptrs->ptr[i].fp_timing.offset < offset ||
@@ -487,7 +487,7 @@ static struct bdb_block *find_section(const struct context *context, int section
 	size_t size;
 
 	data = find_raw_section(context, section_id);
-	if (!data && section_id == BDB_LVDS_LFP_DATA_PTRS) {
+	if (!data && section_id == BDB_LFP_DATA_PTRS) {
 		fprintf(stderr, "Generating LVDS data table pointers\n");
 		temp_block = generate_lvds_data_ptrs(context);
 		if (temp_block)
@@ -526,7 +526,7 @@ static struct bdb_block *find_section(const struct context *context, int section
 
 	free(temp_block);
 
-	if (section_id == BDB_LVDS_LFP_DATA_PTRS &&
+	if (section_id == BDB_LFP_DATA_PTRS &&
 	    !fixup_lfp_data_ptrs(context, 3 + block->data)) {
 		fprintf(stderr, "VBT has malformed LFP data table pointers\n");
 		free(block);
@@ -644,7 +644,7 @@ static const char *i2c_speed(u8 i2c_speed)
 static void dump_backlight_info(struct context *context,
 				const struct bdb_block *block)
 {
-	const struct bdb_lfp_backlight_data *backlight = block_data(block);
+	const struct bdb_lfp_backlight *backlight = block_data(block);
 	const struct lfp_backlight_data_entry *blc;
 	const struct lfp_backlight_control_method *control;
 	int i;
@@ -1264,7 +1264,7 @@ static const char * const pos_type[] = {
 static void dump_lvds_options(struct context *context,
 			      const struct bdb_block *block)
 {
-	const struct bdb_lvds_options *options = block_data(block);
+	const struct bdb_lfp_options *options = block_data(block);
 
 	printf("\tPanel type: %d\n", options->panel_type);
 	if (context->bdb->version >= 212)
@@ -1346,9 +1346,9 @@ static void dump_lvds_options(struct context *context,
 static void dump_lvds_ptr_data(struct context *context,
 			       const struct bdb_block *block)
 {
-	const struct bdb_lvds_lfp_data_ptrs *ptrs = block_data(block);
+	const struct bdb_lfp_data_ptrs *ptrs = block_data(block);
 
-	printf("\tNumber of entries: %d\n", ptrs->lvds_entries);
+	printf("\tNumber of entries: %d\n", ptrs->num_entries);
 
 	for (int i = 0; i < 16; i++) {
 		if (!dump_panel(context, i))
@@ -1356,19 +1356,19 @@ static void dump_lvds_ptr_data(struct context *context,
 
 		printf("\tPanel %d%s\n", i, panel_str(context, i));
 
-		if (ptrs->lvds_entries >= 1) {
+		if (ptrs->num_entries >= 1) {
 			printf("\t\tFP timing offset: %d\n",
 			       ptrs->ptr[i].fp_timing.offset);
 			printf("\t\tFP timing table size: %d\n",
 			       ptrs->ptr[i].fp_timing.table_size);
 		}
-		if (ptrs->lvds_entries >= 2) {
+		if (ptrs->num_entries >= 2) {
 			printf("\t\tDVO timing offset: %d\n",
 			       ptrs->ptr[i].dvo_timing.offset);
 			printf("\t\tDVO timing table size: %d\n",
 			       ptrs->ptr[i].dvo_timing.table_size);
 		}
-		if (ptrs->lvds_entries >= 3) {
+		if (ptrs->num_entries >= 3) {
 			printf("\t\tPanel PnP ID offset: %d\n",
 			       ptrs->ptr[i].panel_pnp_id.offset);
 			printf("\t\tPanel PnP ID table size: %d\n",
@@ -1400,26 +1400,26 @@ static void dump_lvds_data(struct context *context,
 			   const struct bdb_block *block)
 {
 	struct bdb_block *ptrs_block;
-	const struct bdb_lvds_lfp_data_ptrs *ptrs;
+	const struct bdb_lfp_data_ptrs *ptrs;
 	int i;
 	int hdisplay, hsyncstart, hsyncend, htotal;
 	int vdisplay, vsyncstart, vsyncend, vtotal;
 	float clock;
 
-	ptrs_block = find_section(context, BDB_LVDS_LFP_DATA_PTRS);
+	ptrs_block = find_section(context, BDB_LFP_DATA_PTRS);
 	if (!ptrs_block)
 		return;
 
 	ptrs = block_data(ptrs_block);
 
 	for (i = 0; i < 16; i++) {
-		const struct lvds_fp_timing *fp_timing =
+		const struct fp_timing *fp_timing =
 			block_data(block) + ptrs->ptr[i].fp_timing.offset;
 		const uint8_t *timing_data =
 			block_data(block) + ptrs->ptr[i].dvo_timing.offset;
 		const struct bdb_edid_pnp_id *pnp_id =
 			block_data(block) + ptrs->ptr[i].panel_pnp_id.offset;
-		const struct bdb_lvds_lfp_data_tail *tail =
+		const struct bdb_lfp_data_tail *tail =
 			block_data(block) + ptrs->panel_name.offset;
 		char mfg[4];
 
@@ -2571,8 +2571,8 @@ static int get_panel_type_pnpid(const struct context *context,
 				const char *edid_file)
 {
 	struct bdb_block *ptrs_block, *data_block;
-	const struct bdb_lvds_lfp_data *data;
-	const struct bdb_lvds_lfp_data_ptrs *ptrs;
+	const struct bdb_lfp_data *data;
+	const struct bdb_lfp_data_ptrs *ptrs;
 	struct bdb_edid_pnp_id edid_id, edid_id_nodate;
 	const struct edid *edid;
 	int fd, best = -1;
@@ -2596,11 +2596,11 @@ static int get_panel_type_pnpid(const struct context *context,
 	edid_id_nodate.mfg_week = 0;
 	edid_id_nodate.mfg_year = 0;
 
-	ptrs_block = find_section(context, BDB_LVDS_LFP_DATA_PTRS);
+	ptrs_block = find_section(context, BDB_LFP_DATA_PTRS);
 	if (!ptrs_block)
 		return -1;
 
-	data_block = find_section(context, BDB_LVDS_LFP_DATA);
+	data_block = find_section(context, BDB_LFP_DATA);
 	if (!data_block)
 		return -1;
 
@@ -2631,10 +2631,10 @@ static int get_panel_type_pnpid(const struct context *context,
 static int get_panel_type(struct context *context, bool is_panel_type2)
 {
 	struct bdb_block *block;
-	const struct bdb_lvds_options *options;
+	const struct bdb_lfp_options *options;
 	int panel_type = -1;
 
-	block = find_section(context, BDB_LVDS_OPTIONS);
+	block = find_section(context, BDB_LFP_OPTIONS);
 	if (!block)
 		return -1;
 
@@ -2693,22 +2693,22 @@ struct dumper dumpers[] = {
 		.dump = dump_legacy_child_devices,
 	},
 	{
-		.id = BDB_LVDS_OPTIONS,
+		.id = BDB_LFP_OPTIONS,
 		.name = "LVDS options block",
 		.dump = dump_lvds_options,
 	},
 	{
-		.id = BDB_LVDS_LFP_DATA_PTRS,
+		.id = BDB_LFP_DATA_PTRS,
 		.name = "LVDS timing pointer data",
 		.dump = dump_lvds_ptr_data,
 	},
 	{
-		.id = BDB_LVDS_LFP_DATA,
+		.id = BDB_LFP_DATA,
 		.name = "LVDS panel data block",
 		.dump = dump_lvds_data,
 	},
 	{
-		.id = BDB_LVDS_BACKLIGHT,
+		.id = BDB_LFP_BACKLIGHT,
 		.name = "Backlight info block",
 		.dump = dump_backlight_info,
 	},
diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
index 32a6cd01cfbe..c02d808d9e35 100644
--- a/tools/intel_vbt_defs.h
+++ b/tools/intel_vbt_defs.h
@@ -165,10 +165,10 @@ enum bdb_block_id {
 	BDB_SDVO_LVDS_POWER_SEQ		= 25,
 	BDB_TV_OPTIONS			= 26,
 	BDB_EDP				= 27,
-	BDB_LVDS_OPTIONS		= 40,
-	BDB_LVDS_LFP_DATA_PTRS		= 41,
-	BDB_LVDS_LFP_DATA		= 42,
-	BDB_LVDS_BACKLIGHT		= 43,
+	BDB_LFP_OPTIONS			= 40,
+	BDB_LFP_DATA_PTRS		= 41,
+	BDB_LFP_DATA			= 42,
+	BDB_LFP_BACKLIGHT		= 43,
 	BDB_LFP_POWER			= 44,
 	BDB_MIPI_CONFIG			= 52,
 	BDB_MIPI_SEQUENCE		= 53,
@@ -769,7 +769,7 @@ struct bdb_edp {
  * Block 40 - LFP Data Block
  */
 
-struct bdb_lvds_options {
+struct bdb_lfp_options {
 	u8 panel_type;
 	u8 panel_type2;						/* 212+ */
 	/* LVDS capabilities, stored in a dword */
@@ -802,22 +802,22 @@ struct bdb_lvds_options {
 /*
  * Block 41 - LFP Data Table Pointers
  */
-struct lvds_lfp_data_ptr_table {
+struct lfp_data_ptr_table {
 	u16 offset; /* offsets are from start of bdb */
 	u8 table_size;
 } __packed;
 
 /* LFP pointer table contains entries to the struct below */
-struct lvds_lfp_data_ptr {
-	struct lvds_lfp_data_ptr_table fp_timing;
-	struct lvds_lfp_data_ptr_table dvo_timing;
-	struct lvds_lfp_data_ptr_table panel_pnp_id;
+struct lfp_data_ptr {
+	struct lfp_data_ptr_table fp_timing;
+	struct lfp_data_ptr_table dvo_timing;
+	struct lfp_data_ptr_table panel_pnp_id;
 } __packed;
 
-struct bdb_lvds_lfp_data_ptrs {
-	u8 lvds_entries;
-	struct lvds_lfp_data_ptr ptr[16];
-	struct lvds_lfp_data_ptr_table panel_name;		/* (156-163?)+ */
+struct bdb_lfp_data_ptrs {
+	u8 num_entries;
+	struct lfp_data_ptr ptr[16];
+	struct lfp_data_ptr_table panel_name;		/* (156-163?)+ */
 } __packed;
 
 /*
@@ -825,7 +825,7 @@ struct bdb_lvds_lfp_data_ptrs {
  */
 
 /* LFP data has 3 blocks per entry */
-struct lvds_fp_timing {
+struct fp_timing {
 	u16 x_res;
 	u16 y_res;
 	u32 lvds_reg;
@@ -846,29 +846,29 @@ struct lvds_fp_timing {
  * the data must be accessed using the data table pointers.
  * Do not use this directly!
  */
-struct lvds_lfp_data_entry {
-	struct lvds_fp_timing fp_timing;
+struct lfp_data_entry {
+	struct fp_timing fp_timing;
 	struct bdb_edid_dtd dvo_timing;
 	struct bdb_edid_pnp_id pnp_id;
 } __packed;
 
-struct bdb_lvds_lfp_data {
-	struct lvds_lfp_data_entry data[16];
+struct bdb_lfp_data {
+	struct lfp_data_entry data[16];
 } __packed;
 
-struct lvds_lfp_black_border {
+struct lfp_black_border {
 	u8 top;		/* 227+ */
 	u8 bottom;	/* 227+ */
 	u8 left;	/* 238+ */
 	u8 right;	/* 238+ */
 } __packed;
 
-struct bdb_lvds_lfp_data_tail {
+struct bdb_lfp_data_tail {
 	struct bdb_edid_product_name panel_name[16];		/* (156-163?)+ */
 	u16 scaling_enable;					/* 187+ */
 	u8 seamless_drrs_min_refresh_rate[16];			/* 188+ */
 	u8 pixel_overlap_count[16];				/* 208+ */
-	struct lvds_lfp_black_border black_border[16];		/* 227+ */
+	struct lfp_black_border black_border[16];		/* 227+ */
 	u16 dual_lfp_port_sync_enable;				/* 231+ */
 	u16 gpu_dithering_for_banding_artifacts;		/* 245+ */
 } __packed;
@@ -901,7 +901,7 @@ struct lfp_brightness_level {
 	u16 reserved;
 } __packed;
 
-struct bdb_lfp_backlight_data {
+struct bdb_lfp_backlight {
 	u8 entry_size;
 	struct lfp_backlight_data_entry data[16];
 	u8 level[16];							/* 162-233 */
-- 
2.39.2

