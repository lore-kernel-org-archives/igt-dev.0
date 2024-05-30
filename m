Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1AAC25B74
	for <igt-dev@archiver.kernel.org>; Thu, 30 May 2024 15:26:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E95D11A288;
	Thu, 30 May 2024 15:26:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="laWpx1w1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6CD10F07B
 for <igt-dev@lists.freedesktop.org>; Thu, 30 May 2024 15:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717082783; x=1748618783;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MXPo6WIWpFXpdoz1CgWyNwHOrLvQQC6aDaeFAS2HFa4=;
 b=laWpx1w1/NZwNSmocYQw9+Tng/znJsTZPhpT3JPmOM7FW13LcG5TfQiF
 f0vGTGirqLnoxZxqinsQIC/p589eJ7Yn1RzQac3Xoo1Yl0K9EvC6Enkd1
 ZTs4BDI4nSGEHrreVJka3b5Xqu/ZbNJgjfk/3o0012Eew2yfQOak+TYRH
 4TUcnH5DWlfz7ri8bZAUTg4Jl2RCqxRY+V4Zws9Nz7OViXHeagdn0pDvu
 d2bHgEkJjMChhLK7scxbJI2AGuDOEWHIDZIzx+9pKZMtfRj6b9UEv9xgL
 9auC+YaziVH5c5qjSZTMoZnTLQmKrj/cIWxsFZ2Lc0dLouwvUCUdpzzFq g==;
X-CSE-ConnectionGUID: H85b87LZTFmFMB/c+V8LbA==
X-CSE-MsgGUID: OpKZrJvzRja6lXDQVj4OXA==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24697821"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="24697821"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 08:26:22 -0700
X-CSE-ConnectionGUID: rhwn/Z2RT/yoo9nUCRe+ig==
X-CSE-MsgGUID: 9girjXWqTzOXGBh37LBGJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="36328199"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 08:26:20 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 2/5] tools/intel_vbt_decode: sync intel_vbt_defs.h with
 kernel commit 7234f948b58b
Date: Thu, 30 May 2024 18:26:05 +0300
Message-Id: <9397da4cda38ca731515250338181c582b2c0c7e.1717082630.git.jani.nikula@intel.com>
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

7234f948b58b ("drm/i915/bios: Indicate which VBT structures are based on EDID")

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tools/intel_vbt_decode.c | 34 +++++++-------
 tools/intel_vbt_defs.h   | 95 ++++++++++++++++++++--------------------
 2 files changed, 65 insertions(+), 64 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index eba7d7403639..b9681f568517 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -86,7 +86,7 @@ struct context {
 
 struct edid {
 	uint8_t header[8];
-	struct lvds_pnp_id pnpid;
+	struct bdb_edid_pnp_id pnpid;
 	/* ... */
 } __packed;
 
@@ -251,8 +251,8 @@ static void *generate_lvds_data_ptrs(const struct context *context)
 
 	size = block_size;
 
-	size = fp_timing_size + sizeof(struct lvds_dvo_timing) +
-		sizeof(struct lvds_pnp_id);
+	size = fp_timing_size + sizeof(struct bdb_edid_dtd) +
+		sizeof(struct bdb_edid_pnp_id);
 	if (size * 16 > block_size)
 		return NULL;
 
@@ -264,10 +264,10 @@ static void *generate_lvds_data_ptrs(const struct context *context)
 	*(uint16_t *)(ptrs_block + 1) = sizeof(*ptrs);
 	ptrs = ptrs_block + 3;
 
-	table_size = sizeof(struct lvds_pnp_id);
+	table_size = sizeof(struct bdb_edid_pnp_id);
 	size = make_lvds_data_ptr(&ptrs->ptr[0].panel_pnp_id, table_size, size);
 
-	table_size = sizeof(struct lvds_dvo_timing);
+	table_size = sizeof(struct bdb_edid_dtd);
 	size = make_lvds_data_ptr(&ptrs->ptr[0].dvo_timing, table_size, size);
 
 	table_size = fp_timing_size;
@@ -283,15 +283,15 @@ static void *generate_lvds_data_ptrs(const struct context *context)
 	if (size != 0 || ptrs->lvds_entries != 3)
 		return NULL;
 
-	size = fp_timing_size + sizeof(struct lvds_dvo_timing) +
-		sizeof(struct lvds_pnp_id);
+	size = fp_timing_size + sizeof(struct bdb_edid_dtd) +
+		sizeof(struct bdb_edid_pnp_id);
 	for (int i = 1; i < 16; i++) {
 		next_lvds_data_ptr(&ptrs->ptr[i].fp_timing, &ptrs->ptr[i-1].fp_timing, size);
 		next_lvds_data_ptr(&ptrs->ptr[i].dvo_timing, &ptrs->ptr[i-1].dvo_timing, size);
 		next_lvds_data_ptr(&ptrs->ptr[i].panel_pnp_id, &ptrs->ptr[i-1].panel_pnp_id, size);
 	}
 
-	table_size = sizeof(struct lvds_lfp_panel_name);
+	table_size = sizeof(struct bdb_edid_product_name);
 
 	if (16 * (size + table_size) <= block_size) {
 		ptrs->panel_name.table_size = table_size;
@@ -382,13 +382,13 @@ static bool validate_lfp_data_ptrs(const struct context *context,
 
 	/* fp_timing has variable size */
 	if (fp_timing_size < 32 ||
-	    dvo_timing_size != sizeof(struct lvds_dvo_timing) ||
-	    panel_pnp_id_size != sizeof(struct lvds_pnp_id))
+	    dvo_timing_size != sizeof(struct bdb_edid_dtd) ||
+	    panel_pnp_id_size != sizeof(struct bdb_edid_pnp_id))
 		return false;
 
 	/* panel_name is not present in old VBTs */
 	if (panel_name_size != 0 &&
-	    panel_name_size != sizeof(struct lvds_lfp_panel_name))
+	    panel_name_size != sizeof(struct bdb_edid_product_name))
 		return false;
 
 	lfp_data_size = ptrs->ptr[1].fp_timing.offset - ptrs->ptr[0].fp_timing.offset;
@@ -1417,7 +1417,7 @@ static void dump_lvds_data(struct context *context,
 			block_data(block) + ptrs->ptr[i].fp_timing.offset;
 		const uint8_t *timing_data =
 			block_data(block) + ptrs->ptr[i].dvo_timing.offset;
-		const struct lvds_pnp_id *pnp_id =
+		const struct bdb_edid_pnp_id *pnp_id =
 			block_data(block) + ptrs->ptr[i].panel_pnp_id.offset;
 		const struct bdb_lvds_lfp_data_tail *tail =
 			block_data(block) + ptrs->panel_name.offset;
@@ -1922,7 +1922,7 @@ static void dump_lfp_power(struct context *context,
 }
 
 static void
-print_detail_timing_data(const struct lvds_dvo_timing *dvo_timing)
+print_detail_timing_data(const struct bdb_edid_dtd *dvo_timing)
 {
 	int display, sync_start, sync_end, total;
 
@@ -1956,10 +1956,10 @@ print_detail_timing_data(const struct lvds_dvo_timing *dvo_timing)
 static void dump_sdvo_panel_dtds(struct context *context,
 				 const struct bdb_block *block)
 {
-	const struct lvds_dvo_timing *dvo_timing = block_data(block);
+	const struct bdb_edid_dtd *dvo_timing = block_data(block);
 	int n, count;
 
-	count = block->size / sizeof(struct lvds_dvo_timing);
+	count = block->size / sizeof(struct bdb_edid_dtd);
 	for (n = 0; n < count; n++) {
 		printf("%d:\n", n);
 		print_detail_timing_data(dvo_timing++);
@@ -2573,7 +2573,7 @@ static int get_panel_type_pnpid(const struct context *context,
 	struct bdb_block *ptrs_block, *data_block;
 	const struct bdb_lvds_lfp_data *data;
 	const struct bdb_lvds_lfp_data_ptrs *ptrs;
-	struct lvds_pnp_id edid_id, edid_id_nodate;
+	struct bdb_edid_pnp_id edid_id, edid_id_nodate;
 	const struct edid *edid;
 	int fd, best = -1;
 
@@ -2608,7 +2608,7 @@ static int get_panel_type_pnpid(const struct context *context,
 	data = block_data(data_block);
 
 	for (int i = 0; i < 16; i++) {
-		const struct lvds_pnp_id *vbt_id =
+		const struct bdb_edid_pnp_id *vbt_id =
 			(const void*)data + ptrs->ptr[i].panel_pnp_id.offset;
 
 		/* full match? */
diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
index 6600a8cf8464..32a6cd01cfbe 100644
--- a/tools/intel_vbt_defs.h
+++ b/tools/intel_vbt_defs.h
@@ -39,6 +39,50 @@
 
 #include "intel_bios.h"
 
+/* EDID derived structures */
+struct bdb_edid_pnp_id {
+	u16 mfg_name;
+	u16 product_code;
+	u32 serial;
+	u8 mfg_week;
+	u8 mfg_year;
+} __packed;
+
+struct bdb_edid_product_name {
+	char name[13];
+} __packed;
+
+struct bdb_edid_dtd {
+	u16 clock;		/**< In 10khz */
+	u8 hactive_lo;
+	u8 hblank_lo;
+	u8 hblank_hi:4;
+	u8 hactive_hi:4;
+	u8 vactive_lo;
+	u8 vblank_lo;
+	u8 vblank_hi:4;
+	u8 vactive_hi:4;
+	u8 hsync_off_lo;
+	u8 hsync_pulse_width_lo;
+	u8 vsync_pulse_width_lo:4;
+	u8 vsync_off_lo:4;
+	u8 vsync_pulse_width_hi:2;
+	u8 vsync_off_hi:2;
+	u8 hsync_pulse_width_hi:2;
+	u8 hsync_off_hi:2;
+	u8 himage_lo;
+	u8 vimage_lo;
+	u8 vimage_hi:4;
+	u8 himage_hi:4;
+	u8 h_border;
+	u8 v_border;
+	u8 rsvd1:3;
+	u8 digital:2;
+	u8 vsync_positive:1;
+	u8 hsync_positive:1;
+	u8 non_interlaced:1;
+} __packed;
+
 /**
  * struct vbt_header - VBT Header structure
  * @signature:		VBT signature, always starts with "$VBT"
@@ -645,39 +689,8 @@ struct bdb_sdvo_lvds_options {
  * Block 23 - SDVO LVDS Panel DTDs
  */
 
-struct lvds_dvo_timing {
-	u16 clock;		/**< In 10khz */
-	u8 hactive_lo;
-	u8 hblank_lo;
-	u8 hblank_hi:4;
-	u8 hactive_hi:4;
-	u8 vactive_lo;
-	u8 vblank_lo;
-	u8 vblank_hi:4;
-	u8 vactive_hi:4;
-	u8 hsync_off_lo;
-	u8 hsync_pulse_width_lo;
-	u8 vsync_pulse_width_lo:4;
-	u8 vsync_off_lo:4;
-	u8 vsync_pulse_width_hi:2;
-	u8 vsync_off_hi:2;
-	u8 hsync_pulse_width_hi:2;
-	u8 hsync_off_hi:2;
-	u8 himage_lo;
-	u8 vimage_lo;
-	u8 vimage_hi:4;
-	u8 himage_hi:4;
-	u8 h_border;
-	u8 v_border;
-	u8 rsvd1:3;
-	u8 digital:2;
-	u8 vsync_positive:1;
-	u8 hsync_positive:1;
-	u8 non_interlaced:1;
-} __packed;
-
 struct bdb_sdvo_panel_dtds {
-	struct lvds_dvo_timing dtds[4];
+	struct bdb_edid_dtd dtds[4];
 } __packed;
 
 /*
@@ -828,14 +841,6 @@ struct lvds_fp_timing {
 	u16 terminator;
 } __packed;
 
-struct lvds_pnp_id {
-	u16 mfg_name;
-	u16 product_code;
-	u32 serial;
-	u8 mfg_week;
-	u8 mfg_year;
-} __packed;
-
 /*
  * For reference only. fp_timing has variable size so
  * the data must be accessed using the data table pointers.
@@ -843,18 +848,14 @@ struct lvds_pnp_id {
  */
 struct lvds_lfp_data_entry {
 	struct lvds_fp_timing fp_timing;
-	struct lvds_dvo_timing dvo_timing;
-	struct lvds_pnp_id pnp_id;
+	struct bdb_edid_dtd dvo_timing;
+	struct bdb_edid_pnp_id pnp_id;
 } __packed;
 
 struct bdb_lvds_lfp_data {
 	struct lvds_lfp_data_entry data[16];
 } __packed;
 
-struct lvds_lfp_panel_name {
-	u8 name[13];
-} __packed;
-
 struct lvds_lfp_black_border {
 	u8 top;		/* 227+ */
 	u8 bottom;	/* 227+ */
@@ -863,7 +864,7 @@ struct lvds_lfp_black_border {
 } __packed;
 
 struct bdb_lvds_lfp_data_tail {
-	struct lvds_lfp_panel_name panel_name[16];		/* (156-163?)+ */
+	struct bdb_edid_product_name panel_name[16];		/* (156-163?)+ */
 	u16 scaling_enable;					/* 187+ */
 	u8 seamless_drrs_min_refresh_rate[16];			/* 188+ */
 	u8 pixel_overlap_count[16];				/* 208+ */
-- 
2.39.2

