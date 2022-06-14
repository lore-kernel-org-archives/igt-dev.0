Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86F61135EF
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jun 2022 23:31:06 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Jun 2022 02:30:38 +0300
Message-Id: <20220614233100.13834-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
References: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 01/23] tools/intel_vbt_decode: update vbt
 defs from kernel
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Sync up the the VBT definitions from kernel commit
24b8b74eb2eb ("drm/i915: Parse max link rate from the eDP BDB block")
and adjust the actual code to match.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c |   6 +-
 tools/intel_vbt_defs.h   | 254 +++++++++++++++++++++++++++++++--------
 2 files changed, 207 insertions(+), 53 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index b063af8469db..2419ee10bca9 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -460,7 +460,7 @@ static void dump_child_device(struct context *context,
 		printf("\t\tOffset to DTD buffer for edidless CHILD: 0x%02x\n", child->dtd_buf_ptr);
 		printf("\t\tEdidless EFP: %s\n", YESNO(child->edidless_efp));
 		printf("\t\tCompression enable: %s\n", YESNO(child->compression_enable));
-		printf("\t\tCompression method CPS: %s\n", YESNO(child->compression_method));
+		printf("\t\tCompression method CPS: %s\n", YESNO(child->compression_method_cps));
 		printf("\t\tDual pipe ganged eDP: %s\n", YESNO(child->ganged_edp));
 		printf("\t\tCompression structure index: 0x%02x)\n", child->compression_structure_index);
 		printf("\t\tSlave DDI port: 0x%02x (%s)\n", child->slave_port, dvo_port(child->slave_port));
@@ -634,9 +634,9 @@ static void dump_lvds_data(struct context *context,
 	ptrs = ptrs_block->data;
 
 	lfp_data_size =
-	    ptrs->ptr[1].fp_timing_offset - ptrs->ptr[0].fp_timing_offset;
+	    ptrs->ptr[1].fp_timing.offset - ptrs->ptr[0].fp_timing.offset;
 	dvo_offset =
-	    ptrs->ptr[0].dvo_timing_offset - ptrs->ptr[0].fp_timing_offset;
+	    ptrs->ptr[0].dvo_timing.offset - ptrs->ptr[0].fp_timing.offset;
 
 	num_entries = block->size / lfp_data_size;
 
diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
index 69a7cb1fa121..f8e5097222f2 100644
--- a/tools/intel_vbt_defs.h
+++ b/tools/intel_vbt_defs.h
@@ -111,10 +111,11 @@ enum bdb_block_id {
 	BDB_LVDS_LFP_DATA_PTRS		= 41,
 	BDB_LVDS_LFP_DATA		= 42,
 	BDB_LVDS_BACKLIGHT		= 43,
-	BDB_LVDS_POWER			= 44,
+	BDB_LFP_POWER			= 44,
 	BDB_MIPI_CONFIG			= 52,
 	BDB_MIPI_SEQUENCE		= 53,
 	BDB_COMPRESSION_PARAMETERS	= 56,
+	BDB_GENERIC_DTD			= 58,
 	BDB_SKIP			= 254, /* VBIOS private block, ignore */
 };
 
@@ -161,6 +162,14 @@ struct bdb_general_features {
 	u8 dp_ssc_freq:1;	/* SSC freq for PCH attached eDP */
 	u8 dp_ssc_dongle_supported:1;
 	u8 rsvd11:2; /* finish byte */
+
+	/* bits 6 */
+	u8 tc_hpd_retry_timeout:7; /* 242 */
+	u8 rsvd12:1;
+
+	/* bits 7 */
+	u8 afc_startup_config:2;/* 249 */
+	u8 rsvd13:6;
 } __packed;
 
 /*
@@ -225,32 +234,6 @@ struct bdb_general_features {
 #define DEVICE_TYPE_DIGITAL_OUTPUT	(1 << 1)
 #define DEVICE_TYPE_ANALOG_OUTPUT	(1 << 0)
 
-/*
- * Bits we care about when checking for DEVICE_TYPE_eDP. Depending on the
- * system, the other bits may or may not be set for eDP outputs.
- */
-#define DEVICE_TYPE_eDP_BITS \
-	(DEVICE_TYPE_INTERNAL_CONNECTOR |	\
-	 DEVICE_TYPE_MIPI_OUTPUT |		\
-	 DEVICE_TYPE_COMPOSITE_OUTPUT |		\
-	 DEVICE_TYPE_DUAL_CHANNEL |		\
-	 DEVICE_TYPE_LVDS_SIGNALING |		\
-	 DEVICE_TYPE_TMDS_DVI_SIGNALING |	\
-	 DEVICE_TYPE_VIDEO_SIGNALING |		\
-	 DEVICE_TYPE_DISPLAYPORT_OUTPUT |	\
-	 DEVICE_TYPE_ANALOG_OUTPUT)
-
-#define DEVICE_TYPE_DP_DUAL_MODE_BITS \
-	(DEVICE_TYPE_INTERNAL_CONNECTOR |	\
-	 DEVICE_TYPE_MIPI_OUTPUT |		\
-	 DEVICE_TYPE_COMPOSITE_OUTPUT |		\
-	 DEVICE_TYPE_LVDS_SIGNALING |		\
-	 DEVICE_TYPE_TMDS_DVI_SIGNALING |	\
-	 DEVICE_TYPE_VIDEO_SIGNALING |		\
-	 DEVICE_TYPE_DISPLAYPORT_OUTPUT |	\
-	 DEVICE_TYPE_DIGITAL_OUTPUT |		\
-	 DEVICE_TYPE_ANALOG_OUTPUT)
-
 #define DEVICE_CFG_NONE		0x00
 #define DEVICE_CFG_12BIT_DVOB	0x01
 #define DEVICE_CFG_12BIT_DVOC	0x02
@@ -292,8 +275,12 @@ struct bdb_general_features {
 #define DVO_PORT_HDMIE		12				/* 193 */
 #define DVO_PORT_DPF		13				/* N/A */
 #define DVO_PORT_HDMIF		14				/* N/A */
-#define DVO_PORT_DPG		15
-#define DVO_PORT_HDMIG		16
+#define DVO_PORT_DPG		15				/* 217 */
+#define DVO_PORT_HDMIG		16				/* 217 */
+#define DVO_PORT_DPH		17				/* 217 */
+#define DVO_PORT_HDMIH		18				/* 217 */
+#define DVO_PORT_DPI		19				/* 217 */
+#define DVO_PORT_HDMII		20				/* 217 */
 #define DVO_PORT_MIPIA		21				/* 171 */
 #define DVO_PORT_MIPIB		22				/* 171 */
 #define DVO_PORT_MIPIC		23				/* 171 */
@@ -302,6 +289,9 @@ struct bdb_general_features {
 #define HDMI_MAX_DATA_RATE_PLATFORM	0			/* 204 */
 #define HDMI_MAX_DATA_RATE_297		1			/* 204 */
 #define HDMI_MAX_DATA_RATE_165		2			/* 204 */
+#define HDMI_MAX_DATA_RATE_594		3			/* 249 */
+#define HDMI_MAX_DATA_RATE_340		4			/* 249 */
+#define HDMI_MAX_DATA_RATE_300		5			/* 249 */
 
 #define LEGACY_CHILD_DEVICE_CONFIG_SIZE		33
 
@@ -314,12 +304,23 @@ enum vbt_gmbus_ddi {
 	ICL_DDC_BUS_DDI_A = 0x1,
 	ICL_DDC_BUS_DDI_B,
 	TGL_DDC_BUS_DDI_C,
+	RKL_DDC_BUS_DDI_D = 0x3,
+	RKL_DDC_BUS_DDI_E,
 	ICL_DDC_BUS_PORT_1 = 0x4,
 	ICL_DDC_BUS_PORT_2,
 	ICL_DDC_BUS_PORT_3,
 	ICL_DDC_BUS_PORT_4,
 	TGL_DDC_BUS_PORT_5,
 	TGL_DDC_BUS_PORT_6,
+	ADLS_DDC_BUS_PORT_TC1 = 0x2,
+	ADLS_DDC_BUS_PORT_TC2,
+	ADLS_DDC_BUS_PORT_TC3,
+	ADLS_DDC_BUS_PORT_TC4,
+	ADLP_DDC_BUS_PORT_TC1 = 0x3,
+	ADLP_DDC_BUS_PORT_TC2,
+	ADLP_DDC_BUS_PORT_TC3,
+	ADLP_DDC_BUS_PORT_TC4
+
 };
 
 #define DP_AUX_A 0x40
@@ -329,11 +330,24 @@ enum vbt_gmbus_ddi {
 #define DP_AUX_E 0x50
 #define DP_AUX_F 0x60
 #define DP_AUX_G 0x70
+#define DP_AUX_H 0x80
+#define DP_AUX_I 0x90
 
-#define VBT_DP_MAX_LINK_RATE_HBR3	0
-#define VBT_DP_MAX_LINK_RATE_HBR2	1
-#define VBT_DP_MAX_LINK_RATE_HBR	2
-#define VBT_DP_MAX_LINK_RATE_LBR	3
+/* DP max link rate 216+ */
+#define BDB_216_VBT_DP_MAX_LINK_RATE_HBR3	0
+#define BDB_216_VBT_DP_MAX_LINK_RATE_HBR2	1
+#define BDB_216_VBT_DP_MAX_LINK_RATE_HBR	2
+#define BDB_216_VBT_DP_MAX_LINK_RATE_LBR	3
+
+/* DP max link rate 230+ */
+#define BDB_230_VBT_DP_MAX_LINK_RATE_DEF	0
+#define BDB_230_VBT_DP_MAX_LINK_RATE_LBR	1
+#define BDB_230_VBT_DP_MAX_LINK_RATE_HBR	2
+#define BDB_230_VBT_DP_MAX_LINK_RATE_HBR2	3
+#define BDB_230_VBT_DP_MAX_LINK_RATE_HBR3	4
+#define BDB_230_VBT_DP_MAX_LINK_RATE_UHBR10	5
+#define BDB_230_VBT_DP_MAX_LINK_RATE_UHBR13P5	6
+#define BDB_230_VBT_DP_MAX_LINK_RATE_UHBR20	7
 
 /*
  * The child device config, aka the display device data structure, provides a
@@ -368,7 +382,7 @@ struct child_device_config {
 			u16 dtd_buf_ptr;			/* 161 */
 			u8 edidless_efp:1;			/* 161 */
 			u8 compression_enable:1;		/* 198 */
-			u8 compression_method:1;		/* 198 */
+			u8 compression_method_cps:1;		/* 198 */
 			u8 ganged_edp:1;			/* 202 */
 			u8 reserved0:4;
 			u8 compression_structure_index:4;	/* 198 */
@@ -432,8 +446,8 @@ struct child_device_config {
 	u16 dp_gpio_pin_num;					/* 195 */
 	u8 dp_iboost_level:4;					/* 196 */
 	u8 hdmi_iboost_level:4;					/* 196 */
-	u8 dp_max_link_rate:2;					/* 216 CNL+ */
-	u8 dp_max_link_rate_reserved:6;				/* 216 */
+	u8 dp_max_link_rate:3;					/* 216/230 GLK+ */
+	u8 dp_max_link_rate_reserved:5;				/* 216/230 */
 } __packed;
 
 struct bdb_general_definitions {
@@ -461,7 +475,7 @@ struct bdb_general_definitions {
 	 * number = (block_size - sizeof(bdb_general_definitions))/
 	 *	     defs->child_dev_size;
 	 */
-	u8 devices[0];
+	u8 devices[];
 } __packed;
 
 /*
@@ -550,7 +564,9 @@ struct bdb_driver_features {
 	u16 tbt_enabled:1;
 	u16 psr_enabled:1;
 	u16 ips_enabled:1;
-	u16 reserved3:4;
+	u16 reserved3:1;
+	u16 dmrrs_enabled:1;
+	u16 reserved4:2;
 	u16 pc_feature_valid:1;
 } __packed;
 
@@ -622,6 +638,7 @@ struct bdb_sdvo_panel_dtds {
 #define EDP_30BPP	2
 #define EDP_RATE_1_62	0
 #define EDP_RATE_2_7	1
+#define EDP_RATE_5_4	2
 #define EDP_LANE_1	0
 #define EDP_LANE_2	1
 #define EDP_LANE_4	3
@@ -652,6 +669,16 @@ struct edp_full_link_params {
 	u8 vswing:4;
 } __packed;
 
+struct edp_apical_params {
+	u32 panel_oui;
+	u32 dpcd_base_address;
+	u32 dpcd_idridix_control_0;
+	u32 dpcd_option_select;
+	u32 dpcd_backlight;
+	u32 ambient_light;
+	u32 backlight_scale;
+} __packed;
+
 struct bdb_edp {
 	struct edp_power_seq power_seqs[16];
 	u32 color_depth;
@@ -667,6 +694,10 @@ struct bdb_edp {
 	struct edp_pwm_delays pwm_delays[16];			/* 186 */
 	u16 full_link_params_provided;				/* 199 */
 	struct edp_full_link_params full_link_params[16];	/* 199 */
+	u16 apical_enable;					/* 203 */
+	struct edp_apical_params apical_params[16];		/* 203 */
+	u16 edp_fast_link_training_rate[16];			/* 224 */
+	u16 edp_max_port_link_rate[16];				/* 244 */
 } __packed;
 
 /*
@@ -703,25 +734,28 @@ struct bdb_lvds_options {
 
 	u16 lcdvcc_s0_enable;					/* 200 */
 	u32 rotation;						/* 228 */
+	u32 position;						/* 240 */
 } __packed;
 
 /*
  * Block 41 - LFP Data Table Pointers
  */
+struct lvds_lfp_data_ptr_table {
+	u16 offset; /* offsets are from start of bdb */
+	u8 table_size;
+} __packed;
 
 /* LFP pointer table contains entries to the struct below */
 struct lvds_lfp_data_ptr {
-	u16 fp_timing_offset; /* offsets are from start of bdb */
-	u8 fp_table_size;
-	u16 dvo_timing_offset;
-	u8 dvo_table_size;
-	u16 panel_pnp_id_offset;
-	u8 pnp_table_size;
+	struct lvds_lfp_data_ptr_table fp_timing;
+	struct lvds_lfp_data_ptr_table dvo_timing;
+	struct lvds_lfp_data_ptr_table panel_pnp_id;
 } __packed;
 
 struct bdb_lvds_lfp_data_ptrs {
-	u8 lvds_entries; /* followed by one or more lvds_data_ptr structs */
+	u8 lvds_entries;
 	struct lvds_lfp_data_ptr ptr[16];
+	struct lvds_lfp_data_ptr_table panel_name; /* 156-163? */
 } __packed;
 
 /*
@@ -753,6 +787,11 @@ struct lvds_pnp_id {
 	u8 mfg_year;
 } __packed;
 
+/*
+ * For reference only. fp_timing has variable size so
+ * the data must be accessed using the data table pointers.
+ * Do not use this directly!
+ */
 struct lvds_lfp_data_entry {
 	struct lvds_fp_timing fp_timing;
 	struct lvds_dvo_timing dvo_timing;
@@ -763,6 +802,27 @@ struct bdb_lvds_lfp_data {
 	struct lvds_lfp_data_entry data[16];
 } __packed;
 
+struct lvds_lfp_panel_name {
+	u8 name[13];
+} __packed;
+
+struct lvds_lfp_black_border {
+	u8 top; /* 227 */
+	u8 bottom; /* 227 */
+	u8 left; /* 238 */
+	u8 right; /* 238 */
+} __packed;
+
+struct bdb_lvds_lfp_data_tail {
+	struct lvds_lfp_panel_name panel_name[16]; /* 156-163? */
+	u16 scaling_enable; /* 187 */
+	u8 seamless_drrs_min_refresh_rate[16]; /* 188 */
+	u8 pixel_overlap_count[16]; /* 208 */
+	struct lvds_lfp_black_border black_border[16]; /* 227 */
+	u16 dual_lfp_port_sync_enable; /* 231 */
+	u16 gpu_dithering_for_banding_artifacts; /* 245 */
+} __packed;
+
 /*
  * Block 43 - LFP Backlight Control Data Block
  */
@@ -775,7 +835,7 @@ struct lfp_backlight_data_entry {
 	u8 active_low_pwm:1;
 	u8 obsolete1:5;
 	u16 pwm_freq_hz;
-	u8 min_brightness;
+	u8 min_brightness; /* Obsolete from 234+ */
 	u8 obsolete2;
 	u8 obsolete3;
 } __packed;
@@ -785,11 +845,73 @@ struct lfp_backlight_control_method {
 	u8 controller:4;
 } __packed;
 
+struct lfp_brightness_level {
+	u16 level;
+	u16 reserved;
+} __packed;
+
+#define EXP_BDB_LFP_BL_DATA_SIZE_REV_191 \
+	offsetof(struct bdb_lfp_backlight_data, brightness_level)
+#define EXP_BDB_LFP_BL_DATA_SIZE_REV_234 \
+	offsetof(struct bdb_lfp_backlight_data, brightness_precision_bits)
+
 struct bdb_lfp_backlight_data {
 	u8 entry_size;
 	struct lfp_backlight_data_entry data[16];
-	u8 level[16];
+	u8 level[16]; /* Obsolete from 234+ */
 	struct lfp_backlight_control_method backlight_control[16];
+	struct lfp_brightness_level brightness_level[16];		/* 234+ */
+	struct lfp_brightness_level brightness_min_level[16];		/* 234+ */
+	u8 brightness_precision_bits[16];				/* 236+ */
+	u16 hdr_dpcd_refresh_timeout[16];				/* 239+ */
+} __packed;
+
+/*
+ * Block 44 - LFP Power Conservation Features Block
+ */
+struct lfp_power_features {
+	u8 reserved1:1;
+	u8 power_conservation_pref:3;
+	u8 reserved2:1;
+	u8 lace_enabled_status:1;
+	u8 lace_support:1;
+	u8 als_enable:1;
+} __packed;
+
+struct als_data_entry {
+	u16 backlight_adjust;
+	u16 lux;
+} __packed;
+
+struct aggressiveness_profile_entry {
+	u8 dpst_aggressiveness : 4;
+	u8 lace_aggressiveness : 4;
+} __packed;
+
+struct aggressiveness_profile2_entry {
+	u8 opst_aggressiveness : 4;
+	u8 elp_aggressiveness : 4;
+} __packed;
+
+struct bdb_lfp_power {
+	struct lfp_power_features features;
+	struct als_data_entry als[5];
+	u8 lace_aggressiveness_profile:3;
+	u8 reserved1:5;
+	u16 dpst;
+	u16 psr;
+	u16 drrs;
+	u16 lace_support;
+	u16 adt;
+	u16 dmrrs;
+	u16 adb;
+	u16 lace_enabled_status;
+	struct aggressiveness_profile_entry aggressiveness[16];
+	u16 hobl; /* 232+ */
+	u16 vrr_feature_enabled; /* 233+ */
+	u16 elp; /* 247+ */
+	u16 opst; /* 247+ */
+	struct aggressiveness_profile2_entry aggressiveness2[16]; /* 247+ */
 } __packed;
 
 /*
@@ -799,8 +921,10 @@ struct bdb_lfp_backlight_data {
 #define MAX_MIPI_CONFIGURATIONS	6
 
 struct bdb_mipi_config {
-	struct mipi_config config[MAX_MIPI_CONFIGURATIONS];
-	struct mipi_pps_data pps[MAX_MIPI_CONFIGURATIONS];
+	struct mipi_config config[MAX_MIPI_CONFIGURATIONS]; /* 175 */
+	struct mipi_pps_data pps[MAX_MIPI_CONFIGURATIONS]; /* 177 */
+	struct edp_pwm_delays pwm_delays[MAX_MIPI_CONFIGURATIONS]; /* 186 */
+	u8 pmic_i2c_bus_number[MAX_MIPI_CONFIGURATIONS]; /* 190 */
 } __packed;
 
 /*
@@ -809,7 +933,7 @@ struct bdb_mipi_config {
 
 struct bdb_mipi_sequence {
 	u8 version;
-	u8 data[0]; /* up to 6 variable length blocks */
+	u8 data[]; /* up to 6 variable length blocks */
 } __packed;
 
 /*
@@ -863,4 +987,34 @@ struct bdb_compression_parameters {
 	struct dsc_compression_parameters_entry data[16];
 } __packed;
 
+/*
+ * Block 58 - Generic DTD Block
+ */
+
+struct generic_dtd_entry {
+	u32 pixel_clock;
+	u16 hactive;
+	u16 hblank;
+	u16 hfront_porch;
+	u16 hsync;
+	u16 vactive;
+	u16 vblank;
+	u16 vfront_porch;
+	u16 vsync;
+	u16 width_mm;
+	u16 height_mm;
+
+	/* Flags */
+	u8 rsvd_flags:6;
+	u8 vsync_positive_polarity:1;
+	u8 hsync_positive_polarity:1;
+
+	u8 rsvd[3];
+} __packed;
+
+struct bdb_generic_dtd {
+	u16 gdtd_size;
+	struct generic_dtd_entry dtd[];	/* up to 24 DTD's */
+} __packed;
+
 #endif /* _INTEL_VBT_DEFS_H_ */
-- 
2.35.1
