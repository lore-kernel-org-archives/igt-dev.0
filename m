Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB5AC25B74
	for <igt-dev@archiver.kernel.org>; Thu, 30 May 2024 15:26:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 801CF10F346;
	Thu, 30 May 2024 15:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jszm/lj/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E65710F346
 for <igt-dev@lists.freedesktop.org>; Thu, 30 May 2024 15:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717082795; x=1748618795;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LsFpPIeJX9Ss5EQRcdIF36kL40PN276uVWPcnyJmAn4=;
 b=jszm/lj/UiMmhfyS463i1UBao5faDosDTpMd5kwiKbULPmci/mHqVKvG
 NDp0JiS7jNW/CSegOHhrL0HnJy8/FKl1yV8tFM4kvKBl2m7Wq2UdV/79e
 BlFwCYnnrWpOoAwbvDVorCTbx7W4EaMGI0G9U0IBjogswdqxf5sMOczkd
 zJ47I5B0kyd9Vjy9p6u7BWhx47PTYjUE0Bm7g4IoqADwyzLWit83kf+9Z
 V/51Qq7Ol/zFZ7BraqtFYl8UfKwQQJMzT0yq4t+rQOL86Hnt692bmQTEI
 gySx64sp+3yYzfH5WFFn2bhB285jRF8JUS11z5DBXfyy0lbt8Cf5NVUoo g==;
X-CSE-ConnectionGUID: DMa+pSRGT0WiMfScbxEuvw==
X-CSE-MsgGUID: 4OAA9klOSNm1Ubfaa+RF+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="17372962"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="17372962"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 08:26:35 -0700
X-CSE-ConnectionGUID: fjo0xo6+RgS5GB+vFza6Gw==
X-CSE-MsgGUID: x5IAxfJeTQCr189rXovZEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="35836873"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 08:26:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 5/5] tools/intel_vbt_decode: sync intel_vbt_defs.h with
 kernel commit cd6891f8e371
Date: Thu, 30 May 2024 18:26:08 +0300
Message-Id: <47d0ef823e093e0ad58ee17d1693da5776a050b9.1717082630.git.jani.nikula@intel.com>
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

cd6891f8e371 ("drm/i915/bios: Define VBT block 253 (PRD Table) contents")

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tools/intel_vbt_defs.h | 560 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 547 insertions(+), 13 deletions(-)

diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
index 038f489d034c..862c5923b83d 100644
--- a/tools/intel_vbt_defs.h
+++ b/tools/intel_vbt_defs.h
@@ -141,22 +141,24 @@ struct bdb_header {
 enum bdb_block_id {
 	BDB_GENERAL_FEATURES		= 1,
 	BDB_GENERAL_DEFINITIONS		= 2,
-	BDB_OLD_TOGGLE_LIST		= 3,
+	BDB_DISPLAY_TOGGLE		= 3,
 	BDB_MODE_SUPPORT_LIST		= 4,
 	BDB_GENERIC_MODE_TABLE		= 5,
-	BDB_EXT_MMIO_REGS		= 6,
-	BDB_SWF_IO			= 7,
-	BDB_SWF_MMIO			= 8,
-	BDB_PSR				= 9,
+	BDB_EXT_MMIO_REGS		= 6, /* VBIOS only */
+	BDB_SWF_IO			= 7, /* VBIOS only */
+	BDB_SWF_MMIO			= 8, /* VBIOS only */
+	BDB_DOT_CLOCK_OVERRIDE_ALM	= 9,
+	BDB_PSR				= 9, /* 165+ */
 	BDB_MODE_REMOVAL_TABLE		= 10,
 	BDB_CHILD_DEVICE_TABLE		= 11,
 	BDB_DRIVER_FEATURES		= 12,
 	BDB_DRIVER_PERSISTENCE		= 13,
-	BDB_EXT_TABLE_PTRS		= 14,
+	BDB_EXT_TABLE_PTRS		= 14, /* VBIOS only */
 	BDB_DOT_CLOCK_OVERRIDE		= 15,
-	BDB_DISPLAY_SELECT		= 16,
+	BDB_DISPLAY_SELECT_OLD		= 16,
+	BDB_SV_TEST_FUNCTIONS		= 17,
 	BDB_DRIVER_ROTATION		= 18,
-	BDB_DISPLAY_REMOVE		= 19,
+	BDB_DISPLAY_REMOVE_OLD		= 19,
 	BDB_OEM_CUSTOM			= 20,
 	BDB_EFP_LIST			= 21, /* workarounds for VGA hsync/vsync */
 	BDB_SDVO_LVDS_OPTIONS		= 22,
@@ -165,16 +167,30 @@ enum bdb_block_id {
 	BDB_SDVO_LVDS_PPS		= 25,
 	BDB_TV_OPTIONS			= 26,
 	BDB_EDP				= 27,
+	BDB_EFP_DTD			= 28, /* 161+ */
+	BDB_DISPLAY_SELECT_IVB		= 29, /* 164+ */
+	BDB_DISPLAY_REMOVE_IVB		= 30, /* 164+ */
+	BDB_DISPLAY_SELECT_HSW		= 31, /* 166+ */
+	BDB_DISPLAY_REMOVE_HSW		= 32, /* 166+ */
 	BDB_LFP_OPTIONS			= 40,
 	BDB_LFP_DATA_PTRS		= 41,
 	BDB_LFP_DATA			= 42,
 	BDB_LFP_BACKLIGHT		= 43,
 	BDB_LFP_POWER			= 44,
-	BDB_MIPI_CONFIG			= 52,
-	BDB_MIPI_SEQUENCE		= 53,
-	BDB_COMPRESSION_PARAMETERS	= 56,
-	BDB_GENERIC_DTD			= 58,
-	BDB_SKIP			= 254, /* VBIOS private block, ignore */
+	BDB_EDP_BFI			= 45, /* 160+ */
+	BDB_CHROMATICITY		= 46, /* 169+ */
+	BDB_MIPI			= 50, /* 170-172 */
+	BDB_FIXED_SET_MODE		= 51, /* 172+ */
+	BDB_MIPI_CONFIG			= 52, /* 175+ */
+	BDB_MIPI_SEQUENCE		= 53, /* 177+ */
+	BDB_RGB_PALETTE			= 54, /* 180+ */
+	BDB_COMPRESSION_PARAMETERS_OLD	= 55, /* 198-212 */
+	BDB_COMPRESSION_PARAMETERS	= 56, /* 213+ */
+	BDB_VSWING_PREEMPH		= 57, /* 218+ */
+	BDB_GENERIC_DTD			= 58, /* 229+ */
+	BDB_INT15_HOOK			= 252, /* VBIOS only */
+	BDB_PRD_TABLE			= 253,
+	BDB_SKIP			= 254, /* VBIOS only */
 };
 
 /*
@@ -242,6 +258,7 @@ struct bdb_general_features {
 
 /* Device handle */
 #define DEVICE_HANDLE_CRT	0x0001
+#define DEVICE_HANDLE_TV	0x0002 /* ???-214 */
 #define DEVICE_HANDLE_EFP1	0x0004
 #define DEVICE_HANDLE_EFP2	0x0040
 #define DEVICE_HANDLE_EFP3	0x0020
@@ -560,6 +577,114 @@ struct bdb_general_definitions {
 	u8 devices[];
 } __packed;
 
+/*
+ * Block 3 - Display Toggle Option Block
+ */
+
+struct bdb_display_toggle {
+	u8 feature_bits;
+	u16 num_entries;					/* ALM only */
+	u16 list[];						/* ALM only */
+} __packed;
+
+/*
+ * Block 4 - Mode Support List
+ */
+
+struct bdb_mode_support_list {
+	u8 intel_mode_number[0];
+	u16 mode_list_length;
+} __packed;
+
+/*
+ * Block 5 - Generic Mode Table
+ */
+
+struct generic_mode_table {
+	u16 x_res;
+	u16 y_res;
+	u8 color_depths;
+	u8 refresh_rate[3];
+	u8 reserved;
+	u8 text_cols;
+	u8 text_rows;
+	u8 font_height;
+	u16 page_size;
+	u8 misc;
+} __packed;
+
+struct generic_mode_timings {
+	u32 dotclock_khz;
+	u16 hdisplay;
+	u16 htotal;
+	u16 hblank_start;
+	u16 hblank_end;
+	u16 hsync_start;
+	u16 hsync_end;
+	u16 vdisplay;
+	u16 vtotal;
+	u16 vblank_start;
+	u16 vblank_end;
+	u16 vsync_start;
+	u16 vsync_end;
+} __packed;
+
+struct generic_mode_timings_alm {
+	struct generic_mode_timings timings;
+	u8 wm_8bpp;
+	u8 burst_8bpp;
+	u8 wm_16bpp;
+	u8 burst_16bpp;
+	u8 wm_32bpp;
+	u8 burst_32bpp;
+} __packed;
+
+struct bdb_generic_mode_table_alm {
+	struct generic_mode_table table;
+	struct generic_mode_timings_alm timings[3];
+} __packed;
+
+struct bdb_generic_mode_table_mgm {
+	u16 mode_flag;
+	struct generic_mode_table table;
+	struct generic_mode_timings timings[3];
+} __packed;
+
+/*
+ * Block 6 - Extended MMIO Register Table, VBIOS only
+ * Block 7 - IO Software Flag Table, VBIOS only
+ * Block 8 - MMIO SWF Register Table, VBIOS only
+ */
+struct bdb_reg_table {
+	u16 table_id;
+	u8 data_access_size;
+	/*
+	 * offset,value tuples:
+	 * data_access_size==0xce -> u8,u8
+	 * data_access_size==0x02 -> u32,u32
+	 */
+	/* u16 table_end_marker; */
+} __packed;
+
+/*
+ * Block 9 - Undocumented table (ALM only)
+ */
+
+struct dot_clock_override_entry_gen2 {
+	u32 dotclock;
+	u8 n;
+	u8 m1;
+	u8 m2;
+	u8 p1:5;
+	u8 p1_div_by_2:1;
+	u8 reserved:1;
+	u8 p2_div_by_4:1;
+} __packed;
+
+struct bdb_dot_clock_override_alm {
+	struct dot_clock_override_entry_gen2 t[0];
+} __packed;
+
 /*
  * Block 9 - SRD Feature Block
  */
@@ -587,6 +712,29 @@ struct bdb_psr {
 	u32 psr2_tp2_tp3_wakeup_time;				/* 226+ */
 } __packed;
 
+/*
+ * Block 10 - Mode Removal Table
+ */
+
+struct mode_removal_table {
+	u16 x_res;
+	u16 y_res;
+	u8 bpp;
+	u16 refresh_rate;
+	u8 removal_flags;
+	u16 panel_flags;
+} __packed;
+
+struct bdb_mode_removal {
+	u8 row_size; /* 8 or 10 bytes */
+	/*
+	 * VBT spec says this is always 20 entries,
+	 * but ALM seems to have only 15 entries.
+	 */
+	struct mode_removal_table modes[];
+	/* u16 terminator; 0x0000 */
+} __packed;
+
 /*
  * Block 12 - Driver Features Data Block
  */
@@ -665,6 +813,139 @@ struct bdb_driver_features {
 	u16 pc_feature_valid:1;					/* 159+ */
 } __packed;
 
+/*
+ * Block 13 - Driver Persistent Algorithm
+ */
+
+struct bdb_driver_persistence {
+	u16 hotkey_persistent_algorithm:1;
+	u16 lid_switch_persistent_algorithm:1;
+	u16 power_management_persistent_algorithm:1;
+	u16 hotkey_persistent_on_mds_twin:1;
+	u16 hotkey_persistent_on_refresh_rate:1;
+	u16 hotkey_persistent_on_restore_pipe:1;
+	u16 hotkey_persistent_on_mode:1;
+	u16 edid_persistent_on_mode:1;
+	u16 dvo_hotplug_persistent_on_mode:1;
+	u16 docking_persistent_algorithm:1;
+	u16 rsvd:6;
+	u8 persistent_max_config;
+} __packed;
+
+/*
+ * Block 15 - Dot Clock Override Table
+ */
+
+struct dot_clock_override_entry_gen3 {
+	u32 dotclock;
+	u8 n;
+	u8 m1;
+	u8 m2;
+	u8 p1;
+	u8 p2;
+} __packed;
+
+struct bdb_dot_clock_override {
+	u8 row_size; /* 8 == gen2, 9 == gen3+ */
+	u8 num_rows;
+	struct dot_clock_override_entry_gen3 table[]; /* or _gen2 */
+} __packed;
+
+/*
+ * Block 16 - Toggle List Block (pre-HSW)
+ */
+
+struct toggle_list_entry_old {
+	u8 display_select_pipe_a;
+	u8 display_select_pipe_b;
+	u8 caps;
+} __packed;
+
+struct toggle_list_table_old {
+	u16 num_entries;
+	u8 entry_size;
+	struct toggle_list_entry_old list[];
+} __packed;
+
+struct bdb_display_select_old {
+	/* each table has variable size! */
+	struct toggle_list_table_old tables[4];
+} __packed;
+
+/*
+ * Block 17 - SV Test Functions
+ */
+
+struct bdb_sv_test_functions {
+	u8 sv_bits[8];
+} __packed;
+
+/*
+ * Block 18 - Driver Rotation
+ */
+
+struct bdb_driver_rotation {
+	u8 rotation_enable;
+	u8 rotation_flags_1;
+	u16 rotation_flags_2;
+	u32 rotation_flags_3;
+	u32 rotation_flags_4;
+} __packed;
+
+/*
+ * Block 19 - Display Configuration Removal Table (pre-IVB)
+ */
+
+struct display_remove_entry_old {
+	u8 display_select_pipe_a;
+	u8 display_select_pipe_b;
+} __packed;
+
+struct bdb_display_remove_old {
+	u8 num_entries;
+	u8 entry_size;
+	struct display_remove_entry_old table[];
+} __packed;
+
+/*
+ * Block 20 - OEM Customizable Modes
+ */
+
+struct oem_mode {
+	u8 enable_in_vbios:1;
+	u8 enable_in_os:1;
+	u8 enable_in_gop:1;					/* 207+ */
+	u8 reserved:5;
+	u8 display_flags;					/* ???-216 */
+	u16 x_res;
+	u16 y_res;
+	u8 color_depth;
+	u8 refresh_rate;
+	struct bdb_edid_dtd dtd;
+	u16 display_flags_2;					/* 217+ */
+} __packed;
+
+struct bdb_oem_custom {
+	u8 num_entries;
+	u8 entry_size;
+	struct oem_mode modes[];
+} __packed;
+
+/*
+ * Block 21 - EFP List
+ */
+
+struct efp_entry {
+	u16 mfg_name;
+	u16 product_code;
+} __packed;
+
+struct bdb_efp_list {
+	u8 num_entries;
+	u8 entry_size;
+	struct efp_entry efp[];
+} __packed;
+
 /*
  * Block 22 - SDVO LVDS General Options
  */
@@ -693,6 +974,42 @@ struct bdb_sdvo_lvds_dtd {
 	struct bdb_edid_dtd dtd[4];
 } __packed;
 
+/*
+ * Block 24 - SDVO LVDS PnP ID
+ */
+
+struct bdb_sdvo_lvds_pnp_id {
+	struct bdb_edid_pnp_id pnp_id[4];
+} __packed;
+
+/*
+ * Block 25 - SDVO LVDS PPS
+ */
+
+struct sdvo_lvds_pps {
+	u16 t0; /* power on */
+	u16 t1; /* backlight on */
+	u16 t2; /* backlight off */
+	u16 t3; /* power off */
+	u16 t4; /* power cycle */
+} __packed;
+
+struct bdb_sdvo_lvds_pps {
+	struct sdvo_lvds_pps pps[4];
+} __packed;
+
+/*
+ * Block 26 - TV Options Block
+ */
+
+struct bdb_tv_options {
+	u16 underscan_overscan_hdtv_component:2;
+	u16 rsvd1:10;
+	u16 underscan_overscan_hdtv_dvi:2;
+	u16 add_modes_to_avoid_overscan_issue:1;
+	u16 d_connector_support:1;
+} __packed;
+
 /*
  * Block 27 - eDP VBT Block
  */
@@ -765,6 +1082,80 @@ struct bdb_edp {
 	u16 edp_dsc_disable;					/* 251+ */
 } __packed;
 
+/*
+ * Block 28 - EFP DTD Block
+ */
+
+struct bdb_efp_dtd {
+	struct bdb_edid_dtd dtd[3];
+} __packed;
+
+/*
+ * Block 29 - Toggle List Block (IVB)
+ */
+
+struct toggle_list_entry_ivb {
+	u8 display_select;
+} __packed;
+
+struct toggle_list_table_ivb {
+	u16 num_entries;
+	u8 entry_size;
+	struct toggle_list_entry_ivb list[];
+} __packed;
+
+struct bdb_display_select_ivb {
+	/* each table has variable size! */
+	struct toggle_list_table_ivb tables[4];
+} __packed;
+
+/*
+ * Block 30 - Display Configuration Removal Table (IVB)
+ */
+
+struct display_remove_entry_ivb {
+	u8 display_select;
+} __packed;
+
+struct bdb_display_remove_ivb {
+	u8 num_entries;
+	u8 entry_size;
+	struct display_remove_entry_ivb table[];
+} __packed;
+
+/*
+ * Block 31 - Toggle List Block (HSW+)
+ */
+
+struct toggle_list_entry_hsw {
+	u16 display_select;
+} __packed;
+
+struct toggle_list_table_hsw {
+	u16 num_entries;
+	u8 entry_size;
+	struct toggle_list_entry_hsw list[];
+} __packed;
+
+struct bdb_display_select_hsw {
+	/* each table has variable size! */
+	struct toggle_list_table_hsw tables[4];
+} __packed;
+
+/*
+ * Block 32 - Display Configuration Removal Table (HSW+)
+ */
+
+struct display_remove_entry_hsw {
+	u16 display_select;
+} __packed;
+
+struct bdb_display_remove_hsw {
+	u8 num_entries;
+	u8 entry_size;
+	struct display_remove_entry_hsw table[];
+} __packed;
+
 /*
  * Block 40 - LFP Data Block
  */
@@ -960,6 +1351,103 @@ struct bdb_lfp_power {
 	struct aggressiveness_profile2_entry aggressiveness2[16];	/* 247+ */
 } __packed;
 
+/*
+ * Block 45 - eDP BFI Block
+ */
+
+struct edp_bfi {
+	u8 enable_bfi_in_driver:1;
+	u8 enable_brightness_control_in_cui:1;
+	u8 reserved:6;
+	u8 brightness_percentage_when_bfi_disabled;
+} __packed;
+
+struct bdb_edp_bfi {
+	u8 bfi_structure_size;
+	struct edp_bfi bfi[16];
+} __packed;
+
+/*
+ * Block 46 - Chromaticity For Narrow Gamut Panel Configuration Block
+ */
+
+struct chromaticity {
+	u8 chromaticity_enable:1;
+	u8 chromaticity_from_edid_base_block:1;
+	u8 rsvd:6;
+
+	u8 red_green;
+	u8 blue_white;
+	u8 red_x;
+	u8 red_y;
+	u8 green_x;
+	u8 green_y;
+	u8 blue_x;
+	u8 blue_y;
+	u8 white_x;
+	u8 white_y;
+} __packed;
+
+struct bdb_chromaticity {
+	struct chromaticity chromaticity[16];
+} __packed;
+
+/*
+ * Block 50 - MIPI Block
+ */
+
+struct mipi_data {
+	u16 panel_identifier;
+	u16 bridge_revision;
+
+	u32 dithering:1;
+	u32 pixel_format_18bpp:1;
+	u32 reserved1:1;
+	u32 dphy_params_valid:1;
+	u32 reserved2:28;
+
+	u16 port_info;
+
+	u16 reserved3:2;
+	u16 num_lanes:2;
+	u16 reserved4:12;
+
+	u16 virtual_channel_num:2;
+	u16 video_transfer_mode:2;
+	u16 reserved5:12;
+
+	u32 dsi_ddr_clock;
+	u32 renesas_bridge_ref_clock;
+	u16 power_conservation;
+
+	u32 prepare_count:5;
+	u32 reserved6:3;
+	u32 clk_zero_count:8;
+	u32 trail_count:5;
+	u32 reserved7:3;
+	u32 exit_zero_count:6;
+	u32 reserved8:2;
+
+	u32 high_low_switch_count;
+	u32 lp_byte_clock;
+	u32 clock_lane_switch_time_counter;
+	u32 panel_color_depth;
+} __packed;
+
+struct bdb_mipi {
+	struct mipi_data mipi[16];
+} __packed;
+
+/*
+ * Block 51 - Fixed Set Mode Table
+ */
+
+struct bdb_fixed_set_mode {
+	u8 enable;
+	u32 x_res;
+	u32 y_res;
+} __packed;
+
 /*
  * Block 52 - MIPI Configuration Block
  */
@@ -982,6 +1470,17 @@ struct bdb_mipi_sequence {
 	u8 data[]; /* up to 6 variable length blocks */
 } __packed;
 
+/*
+ * Block 55 - RGB Palette Table
+ */
+
+struct bdb_rgb_palette {
+	u8 is_enabled;
+	u8 red[256];
+	u8 blue[256];
+	u8 green[256];
+} __packed;
+
 /*
  * Block 56 - Compression Parameters
  */
@@ -1033,6 +1532,16 @@ struct bdb_compression_parameters {
 	struct dsc_compression_parameters_entry data[16];
 } __packed;
 
+/*
+ * Block 57 -  Vswing PreEmphasis Table
+ */
+
+struct bdb_vswing_preemph {
+	u8 num_tables;
+	u8 num_columns;
+	u32 tables[];
+} __packed;
+
 /*
  * Block 58 - Generic DTD Block
  */
@@ -1063,4 +1572,29 @@ struct bdb_generic_dtd {
 	struct generic_dtd_entry dtd[];	/* up to 24 DTD's */
 } __packed;
 
+/*
+ * Block 253 - PRD Table
+ */
+
+struct prd_entry_old {
+	u8 displays_attached;
+	u8 display_in_pipe_a;
+	u8 display_in_pipe_b;
+} __packed;
+
+struct bdb_prd_table_old {
+	struct prd_entry_old list[0];				/* ???-216 */
+	u16 num_entries;					/* ???-216 */
+} __packed;
+
+struct prd_entry_new {
+	u16 primary_display;
+	u16 secondary_display;
+} __packed;
+
+struct bdb_prd_table_new {
+	u16 num_entries;					/* 217+ */
+	struct prd_entry_new list[];				/* 217+ */
+} __packed;
+
 #endif /* _INTEL_VBT_DEFS_H_ */
-- 
2.39.2

