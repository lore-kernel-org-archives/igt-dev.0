Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F0810E05A
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Jul 2022 20:25:32 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 15 Jul 2022 23:25:09 +0300
Message-Id: <20220715202520.23677-4-ville.syrjala@linux.intel.com>
In-Reply-To: <20220715202520.23677-1-ville.syrjala@linux.intel.com>
References: <20220715202520.23677-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 03/14] tools/intel_vbt_decode: update vbt
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
<fixme>
and adjust the actual code to match.

Note that 'slave_port' is gone now, so we'll just throw it out,
and the DP redriver stuff is now defined as bitfields which need
to be properly decoded.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_bios.h       |   8 -
 tools/intel_vbt_decode.c |  27 +++-
 tools/intel_vbt_defs.h   | 342 ++++++++++++++++++++++-----------------
 3 files changed, 215 insertions(+), 162 deletions(-)

diff --git a/tools/intel_bios.h b/tools/intel_bios.h
index 78a96d977536..fdc3308f3d38 100644
--- a/tools/intel_bios.h
+++ b/tools/intel_bios.h
@@ -30,14 +30,6 @@
 
 #include <stdint.h>
 
-#define DEVICE_HANDLE_CRT	0x01
-#define DEVICE_HANDLE_EFP1	0x04
-#define DEVICE_HANDLE_EFP2	0x40
-#define DEVICE_HANDLE_EFP3	0x20
-#define DEVICE_HANDLE_EFP4	0x10
-#define DEVICE_HANDLE_LPF1	0x08
-#define DEVICE_HANDLE_LFP2	0x80
-
 #define DEVICE_TYPE_DP_DVI		0x68d6
 #define DEVICE_TYPE_DVI			0x68d2
 #define DEVICE_TYPE_MIPI		0x7cc2
diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 13e927edd17f..4bb8437bffb0 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -720,7 +720,7 @@ static const struct {
 	{ DEVICE_HANDLE_EFP2, "EFP 2 (HDMI/DVI/DP)" },
 	{ DEVICE_HANDLE_EFP3, "EFP 3 (HDMI/DVI/DP)" },
 	{ DEVICE_HANDLE_EFP4, "EFP 4 (HDMI/DVI/DP)" },
-	{ DEVICE_HANDLE_LPF1, "LFP 1 (eDP)" },
+	{ DEVICE_HANDLE_LFP1, "LFP 1 (eDP)" },
 	{ DEVICE_HANDLE_LFP2, "LFP 2 (eDP)" },
 };
 static const int num_child_device_handles =
@@ -894,8 +894,24 @@ static void dump_child_device(struct context *context,
 		printf("\t\tSignature: %.*s\n", (int)sizeof(child->device_id), child->device_id);
 	} else {
 		printf("\t\tI2C speed: 0x%02x\n", child->i2c_speed);
-		printf("\t\tDP onboard redriver: 0x%02x\n", child->dp_onboard_redriver);
-		printf("\t\tDP ondock redriver: 0x%02x\n", child->dp_ondock_redriver);
+		printf("\t\tDP onboard redriver:\n");
+		printf("\t\t\tpresent: %s\n",
+		       YESNO((child->dp_onboard_redriver_present)));
+		printf("\t\t\tvswing: %s (0x%x)\n",
+		       dp_vswing(child->dp_onboard_redriver_vswing),
+		       child->dp_onboard_redriver_vswing);
+		printf("\t\t\tpre-emphasis: %s (0x%x)\n",
+		       dp_preemph(child->dp_onboard_redriver_preemph),
+		       child->dp_onboard_redriver_preemph);
+		printf("\t\tDP ondock redriver:\n");
+		printf("\t\t\tpresent: %s\n",
+		       YESNO((child->dp_ondock_redriver_present)));
+		printf("\t\t\tvswing: %s (0x%x)\n",
+		       dp_vswing(child->dp_ondock_redriver_vswing),
+		       child->dp_ondock_redriver_vswing);
+		printf("\t\t\tpre-emphasis: %s (0x%x)\n",
+		       dp_preemph(child->dp_ondock_redriver_preemph),
+		       child->dp_ondock_redriver_preemph);
 		printf("\t\tHDMI level shifter value: 0x%02x\n", child->hdmi_level_shifter_value);
 		dump_hmdi_max_data_rate(child->hdmi_max_data_rate);
 		printf("\t\tOffset to DTD buffer for edidless CHILD: 0x%02x\n", child->dtd_buf_ptr);
@@ -904,7 +920,6 @@ static void dump_child_device(struct context *context,
 		printf("\t\tCompression method CPS: %s\n", YESNO(child->compression_method_cps));
 		printf("\t\tDual pipe ganged eDP: %s\n", YESNO(child->ganged_edp));
 		printf("\t\tCompression structure index: 0x%02x)\n", child->compression_structure_index);
-		printf("\t\tSlave DDI port: 0x%02x (%s)\n", child->slave_port, dvo_port(child->slave_port));
 	}
 
 	printf("\t\tAIM offset: %d\n", child->addin_offset);
@@ -1323,9 +1338,9 @@ static void dump_driver_feature(struct context *context,
 	printf("\tBoot Device Algorithm: %s\n", feature->boot_dev_algorithm ?
 	       "driver default" : "os default");
 	printf("\tBlock display switching when DVD active: %s\n",
-	       YESNO(feature->block_display_switch));
+	       YESNO(feature->allow_display_switch_dvd));
 	printf("\tAllow display switching when in Full Screen DOS: %s\n",
-	       YESNO(feature->allow_display_switch));
+	       YESNO(feature->allow_display_switch_dos));
 	printf("\tHot Plug DVO: %s\n", YESNO(feature->hotplug_dvo));
 	printf("\tDual View Zoom: %s\n", YESNO(feature->dual_view_zoom));
 	printf("\tDriver INT 15h hook: %s\n", YESNO(feature->int15h_hook));
diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
index f8e5097222f2..62183c6bdc10 100644
--- a/tools/intel_vbt_defs.h
+++ b/tools/intel_vbt_defs.h
@@ -75,6 +75,20 @@ struct bdb_header {
 	u16 bdb_size;
 } __packed;
 
+/*
+ * BDB version number dependencies are documented as:
+ *
+ * <start>+
+ *    indicates the field was introduced in version <start>
+ *    and is still valid
+ *
+ * <start>-<end>
+ *    indicates the field was introduced in version <start>
+ *    and obsoleted in version <end>+1.
+ *
+ * ??? indicates the specific version number is unknown
+ */
+
 /*
  * There are several types of BIOS data blocks (BDBs), each block has
  * an ID and size in the first 3 bytes (ID in first, size in next 2).
@@ -144,12 +158,12 @@ struct bdb_general_features {
         /* bits 3 */
 	u8 disable_smooth_vision:1;
 	u8 single_dvi:1;
-	u8 rotate_180:1;					/* 181 */
+	u8 rotate_180:1;					/* 181+ */
 	u8 fdi_rx_polarity_inverted:1;
-	u8 vbios_extended_mode:1;				/* 160 */
-	u8 copy_ilfp_dtd_to_sdvo_lvds_dtd:1;			/* 160 */
-	u8 panel_best_fit_timing:1;				/* 160 */
-	u8 ignore_strap_state:1;				/* 160 */
+	u8 vbios_extended_mode:1;				/* 160+ */
+	u8 copy_ilfp_dtd_to_sdvo_lvds_dtd:1;			/* 160+ */
+	u8 panel_best_fit_timing:1;				/* 160+ */
+	u8 ignore_strap_state:1;				/* 160+ */
 
         /* bits 4 */
 	u8 legacy_monitor_detect;
@@ -164,11 +178,11 @@ struct bdb_general_features {
 	u8 rsvd11:2; /* finish byte */
 
 	/* bits 6 */
-	u8 tc_hpd_retry_timeout:7; /* 242 */
+	u8 tc_hpd_retry_timeout:7;				/* 242+ */
 	u8 rsvd12:1;
 
 	/* bits 7 */
-	u8 afc_startup_config:2;/* 249 */
+	u8 afc_startup_config:2;				/* 249+ */
 	u8 rsvd13:6;
 } __packed;
 
@@ -182,6 +196,19 @@ struct bdb_general_features {
 #define GPIO_PIN_ADD_DDC	0x04 /* "ADDCARD DDC GPIO pins" */
 #define GPIO_PIN_ADD_DDC_I2C	0x06 /* "ADDCARD DDC/I2C GPIO pins" */
 
+/* Device handle */
+#define DEVICE_HANDLE_CRT	0x0001
+#define DEVICE_HANDLE_EFP1	0x0004
+#define DEVICE_HANDLE_EFP2	0x0040
+#define DEVICE_HANDLE_EFP3	0x0020
+#define DEVICE_HANDLE_EFP4	0x0010 /* 194+ */
+#define DEVICE_HANDLE_EFP5	0x0002 /* 215+ */
+#define DEVICE_HANDLE_EFP6	0x0001 /* 217+ */
+#define DEVICE_HANDLE_EFP7	0x0100 /* 217+ */
+#define DEVICE_HANDLE_EFP8	0x0200 /* 217+ */
+#define DEVICE_HANDLE_LFP1	0x0008
+#define DEVICE_HANDLE_LFP2	0x0080
+
 /* Pre 915 */
 #define DEVICE_TYPE_NONE	0x00
 #define DEVICE_TYPE_CRT		0x01
@@ -271,27 +298,27 @@ struct bdb_general_features {
 #define DVO_PORT_DPC		8
 #define DVO_PORT_DPD		9
 #define DVO_PORT_DPA		10
-#define DVO_PORT_DPE		11				/* 193 */
-#define DVO_PORT_HDMIE		12				/* 193 */
+#define DVO_PORT_DPE		11				/* 193+ */
+#define DVO_PORT_HDMIE		12				/* 193+ */
 #define DVO_PORT_DPF		13				/* N/A */
 #define DVO_PORT_HDMIF		14				/* N/A */
-#define DVO_PORT_DPG		15				/* 217 */
-#define DVO_PORT_HDMIG		16				/* 217 */
-#define DVO_PORT_DPH		17				/* 217 */
-#define DVO_PORT_HDMIH		18				/* 217 */
-#define DVO_PORT_DPI		19				/* 217 */
-#define DVO_PORT_HDMII		20				/* 217 */
-#define DVO_PORT_MIPIA		21				/* 171 */
-#define DVO_PORT_MIPIB		22				/* 171 */
-#define DVO_PORT_MIPIC		23				/* 171 */
-#define DVO_PORT_MIPID		24				/* 171 */
-
-#define HDMI_MAX_DATA_RATE_PLATFORM	0			/* 204 */
-#define HDMI_MAX_DATA_RATE_297		1			/* 204 */
-#define HDMI_MAX_DATA_RATE_165		2			/* 204 */
-#define HDMI_MAX_DATA_RATE_594		3			/* 249 */
-#define HDMI_MAX_DATA_RATE_340		4			/* 249 */
-#define HDMI_MAX_DATA_RATE_300		5			/* 249 */
+#define DVO_PORT_DPG		15				/* 217+ */
+#define DVO_PORT_HDMIG		16				/* 217+ */
+#define DVO_PORT_DPH		17				/* 217+ */
+#define DVO_PORT_HDMIH		18				/* 217+ */
+#define DVO_PORT_DPI		19				/* 217+ */
+#define DVO_PORT_HDMII		20				/* 217+ */
+#define DVO_PORT_MIPIA		21				/* 171+ */
+#define DVO_PORT_MIPIB		22				/* 171+ */
+#define DVO_PORT_MIPIC		23				/* 171+ */
+#define DVO_PORT_MIPID		24				/* 171+ */
+
+#define HDMI_MAX_DATA_RATE_PLATFORM	0			/* 204+ */
+#define HDMI_MAX_DATA_RATE_297		1			/* 204+ */
+#define HDMI_MAX_DATA_RATE_165		2			/* 204+ */
+#define HDMI_MAX_DATA_RATE_594		3			/* 249+ */
+#define HDMI_MAX_DATA_RATE_340		4			/* 249+ */
+#define HDMI_MAX_DATA_RATE_300		5			/* 249+ */
 
 #define LEGACY_CHILD_DEVICE_CONFIG_SIZE		33
 
@@ -375,20 +402,29 @@ struct child_device_config {
 		u8  device_id[10]; /* ascii string */
 		struct {
 			u8 i2c_speed;
-			u8 dp_onboard_redriver;			/* 158 */
-			u8 dp_ondock_redriver;			/* 158 */
-			u8 hdmi_level_shifter_value:5;		/* 169 */
-			u8 hdmi_max_data_rate:3;		/* 204 */
-			u16 dtd_buf_ptr;			/* 161 */
-			u8 edidless_efp:1;			/* 161 */
-			u8 compression_enable:1;		/* 198 */
-			u8 compression_method_cps:1;		/* 198 */
-			u8 ganged_edp:1;			/* 202 */
-			u8 reserved0:4;
-			u8 compression_structure_index:4;	/* 198 */
-			u8 reserved1:4;
-			u8 slave_port;				/* 202 */
-			u8 reserved2;
+			u8 dp_onboard_redriver_preemph:3;	/* 158+ */
+			u8 dp_onboard_redriver_vswing:3;	/* 158+ */
+			u8 dp_onboard_redriver_present:1;	/* 158+ */
+			u8 reserved0:1;
+			u8 dp_ondock_redriver_preemph:3;	/* 158+ */
+			u8 dp_ondock_redriver_vswing:3;		/* 158+ */
+			u8 dp_ondock_redriver_present:1;	/* 158+ */
+			u8 reserved1:1;
+			u8 hdmi_level_shifter_value:5;		/* 158+ */
+			u8 hdmi_max_data_rate:3;		/* 204+ */
+			u16 dtd_buf_ptr;			/* 161+ */
+			u8 edidless_efp:1;			/* 161+ */
+			u8 compression_enable:1;		/* 198+ */
+			u8 compression_method_cps:1;		/* 198+ */
+			u8 ganged_edp:1;			/* 202+ */
+			u8 lttpr_non_transparent:1;		/* 235+ */
+			u8 reserved2:3;
+			u8 compression_structure_index:4;	/* 198+ */
+			u8 reserved3:4;
+			u8 hdmi_max_frl_rate:4;			/* 237+ */
+			u8 hdmi_max_frl_rate_valid:1;		/* 237+ */
+			u8 reserved4:3;				/* 237+ */
+			u8 reserved5;
 		} __packed;
 	} __packed;
 
@@ -408,16 +444,16 @@ struct child_device_config {
 			u8 ddc2_pin;
 		} __packed;
 		struct {
-			u8 efp_routed:1;			/* 158 */
-			u8 lane_reversal:1;			/* 184 */
-			u8 lspcon:1;				/* 192 */
-			u8 iboost:1;				/* 196 */
-			u8 hpd_invert:1;			/* 196 */
-			u8 use_vbt_vswing:1;			/* 218 */
-			u8 flag_reserved:2;
-			u8 hdmi_support:1;			/* 158 */
-			u8 dp_support:1;			/* 158 */
-			u8 tmds_support:1;			/* 158 */
+			u8 efp_routed:1;			/* 158+ */
+			u8 lane_reversal:1;			/* 184+ */
+			u8 lspcon:1;				/* 192+ */
+			u8 iboost:1;				/* 196+ */
+			u8 hpd_invert:1;			/* 196+ */
+			u8 use_vbt_vswing:1;			/* 218+ */
+			u8 dp_max_lane_count:2;			/* 244+ */
+			u8 hdmi_support:1;			/* 158+ */
+			u8 dp_support:1;			/* 158+ */
+			u8 tmds_support:1;			/* 158+ */
 			u8 support_reserved:5;
 			u8 aux_channel;
 			u8 dongle_detect;
@@ -425,7 +461,7 @@ struct child_device_config {
 	} __packed;
 
 	u8 pipe_cap:2;
-	u8 sdvo_stall:1;					/* 158 */
+	u8 sdvo_stall:1;					/* 158+ */
 	u8 hpd_status:2;
 	u8 integrated_encoder:1;
 	u8 capabilities_reserved:2;
@@ -433,21 +469,21 @@ struct child_device_config {
 
 	union {
 		u8 dvo2_wiring;
-		u8 mipi_bridge_type;				/* 171 */
+		u8 mipi_bridge_type;				/* 171+ */
 	} __packed;
 
 	u16 extended_type;
 	u8 dvo_function;
-	u8 dp_usb_type_c:1;					/* 195 */
-	u8 tbt:1;						/* 209 */
-	u8 flags2_reserved:2;					/* 195 */
-	u8 dp_port_trace_length:4;				/* 209 */
-	u8 dp_gpio_index;					/* 195 */
-	u16 dp_gpio_pin_num;					/* 195 */
-	u8 dp_iboost_level:4;					/* 196 */
-	u8 hdmi_iboost_level:4;					/* 196 */
-	u8 dp_max_link_rate:3;					/* 216/230 GLK+ */
-	u8 dp_max_link_rate_reserved:5;				/* 216/230 */
+	u8 dp_usb_type_c:1;					/* 195+ */
+	u8 tbt:1;						/* 209+ */
+	u8 flags2_reserved:2;					/* 195+ */
+	u8 dp_port_trace_length:4;				/* 209+ */
+	u8 dp_gpio_index;					/* 195+ */
+	u16 dp_gpio_pin_num;					/* 195+ */
+	u8 dp_iboost_level:4;					/* 196+ */
+	u8 hdmi_iboost_level:4;					/* 196+ */
+	u8 dp_max_link_rate:3;					/* 216+ */
+	u8 dp_max_link_rate_reserved:5;				/* 216+ */
 } __packed;
 
 struct bdb_general_definitions {
@@ -484,25 +520,25 @@ struct bdb_general_definitions {
 
 struct psr_table {
 	/* Feature bits */
-	u8 full_link:1;
-	u8 require_aux_to_wakeup:1;
+	u8 full_link:1;						/* 165+ */
+	u8 require_aux_to_wakeup:1;				/* 165+ */
 	u8 feature_bits_rsvd:6;
 
 	/* Wait times */
-	u8 idle_frames:4;
-	u8 lines_to_wait:3;
+	u8 idle_frames:4;					/* 165+ */
+	u8 lines_to_wait:3;					/* 165+ */
 	u8 wait_times_rsvd:1;
 
 	/* TP wake up time in multiple of 100 */
-	u16 tp1_wakeup_time;
-	u16 tp2_tp3_wakeup_time;
+	u16 tp1_wakeup_time;					/* 165+ */
+	u16 tp2_tp3_wakeup_time;				/* 165+ */
 } __packed;
 
 struct bdb_psr {
 	struct psr_table psr_table[16];
 
 	/* PSR2 TP2/TP3 wakeup time for 16 panels */
-	u32 psr2_tp2_tp3_wakeup_time;
+	u32 psr2_tp2_tp3_wakeup_time;				/* 226+ */
 } __packed;
 
 /*
@@ -515,9 +551,10 @@ struct bdb_psr {
 #define BDB_DRIVER_FEATURE_INT_SDVO_LVDS	3
 
 struct bdb_driver_features {
+	/* Driver bits */
 	u8 boot_dev_algorithm:1;
-	u8 block_display_switch:1;
-	u8 allow_display_switch:1;
+	u8 allow_display_switch_dvd:1;
+	u8 allow_display_switch_dos:1;
 	u8 hotplug_dvo:1;
 	u8 dual_view_zoom:1;
 	u8 int15h_hook:1;
@@ -529,6 +566,7 @@ struct bdb_driver_features {
 	u8 boot_mode_bpp;
 	u8 boot_mode_refresh;
 
+	/* Extended Driver Bits 1 */
 	u16 enable_lfp_primary:1;
 	u16 selective_mode_pruning:1;
 	u16 dual_frequency:1;
@@ -544,29 +582,40 @@ struct bdb_driver_features {
 	u16 tv_hotplug:1;
 	u16 hdmi_config:2;
 
-	u8 static_display:1;
-	u8 reserved2:7;
+	/* Driver Flags 1 */
+	u8 static_display:1;					/* 163+ */
+	u8 embedded_platform:1;					/* 163+ */
+	u8 display_subsystem_enable:1;				/* 163+ */
+	u8 reserved0:5;
+
 	u16 legacy_crt_max_x;
 	u16 legacy_crt_max_y;
 	u8 legacy_crt_max_refresh;
 
-	u8 hdmi_termination;
-	u8 custom_vbt_version;
-	/* Driver features data block */
-	u16 rmpm_enabled:1;
-	u16 s2ddt_enabled:1;
-	u16 dpst_enabled:1;
-	u16 bltclt_enabled:1;
-	u16 adb_enabled:1;
-	u16 drrs_enabled:1;
-	u16 grs_enabled:1;
-	u16 gpmt_enabled:1;
-	u16 tbt_enabled:1;
-	u16 psr_enabled:1;
-	u16 ips_enabled:1;
-	u16 reserved3:1;
-	u16 dmrrs_enabled:1;
-	u16 reserved4:2;
+	/* Extended Driver Bits 2 */
+	u8 hdmi_termination:1;
+	u8 cea861d_hdmi_support:1;
+	u8 self_refresh_enable:1;
+	u8 reserved1:5;
+
+	u8 custom_vbt_version;					/* 165+ */
+
+	/* Driver Feature Flags */
+	u16 rmpm_enabled:1;					/* 165+ */
+	u16 s2ddt_enabled:1;					/* 165+ */
+	u16 dpst_enabled:1;					/* 165-227 */
+	u16 bltclt_enabled:1;					/* 165+ */
+	u16 adb_enabled:1;					/* 165-227 */
+	u16 drrs_enabled:1;					/* 165-227 */
+	u16 grs_enabled:1;					/* 165+ */
+	u16 gpmt_enabled:1;					/* 165+ */
+	u16 tbt_enabled:1;					/* 165+ */
+	u16 psr_enabled:1;					/* 165-227 */
+	u16 ips_enabled:1;					/* 165+ */
+	u16 dpfs_enabled:1;					/* 165+ */
+	u16 dmrrs_enabled:1;					/* 174-227 */
+	u16 adt_enabled:1;					/* ???-228 */
+	u16 hpd_wake:1;						/* 201-240 */
 	u16 pc_feature_valid:1;
 } __packed;
 
@@ -653,7 +702,7 @@ struct bdb_sdvo_panel_dtds {
 
 
 struct edp_fast_link_params {
-	u8 rate:4;
+	u8 rate:4;						/* ???-223 */
 	u8 lanes:4;
 	u8 preemphasis:4;
 	u8 vswing:4;
@@ -686,37 +735,34 @@ struct bdb_edp {
 	u32 sdrrs_msa_timing_delay;
 
 	/* ith bit indicates enabled/disabled for (i+1)th panel */
-	u16 edp_s3d_feature;					/* 162 */
-	u16 edp_t3_optimization;				/* 165 */
-	u64 edp_vswing_preemph;					/* 173 */
-	u16 fast_link_training;					/* 182 */
-	u16 dpcd_600h_write_required;				/* 185 */
-	struct edp_pwm_delays pwm_delays[16];			/* 186 */
-	u16 full_link_params_provided;				/* 199 */
-	struct edp_full_link_params full_link_params[16];	/* 199 */
-	u16 apical_enable;					/* 203 */
-	struct edp_apical_params apical_params[16];		/* 203 */
-	u16 edp_fast_link_training_rate[16];			/* 224 */
-	u16 edp_max_port_link_rate[16];				/* 244 */
+	u16 edp_s3d_feature;					/* 162+ */
+	u16 edp_t3_optimization;				/* 165+ */
+	u64 edp_vswing_preemph;					/* 173+ */
+	u16 fast_link_training;					/* 182+ */
+	u16 dpcd_600h_write_required;				/* 185+ */
+	struct edp_pwm_delays pwm_delays[16];			/* 186+ */
+	u16 full_link_params_provided;				/* 199+ */
+	struct edp_full_link_params full_link_params[16];	/* 199+ */
+	u16 apical_enable;					/* 203+ */
+	struct edp_apical_params apical_params[16];		/* 203+ */
+	u16 edp_fast_link_training_rate[16];			/* 224+ */
+	u16 edp_max_port_link_rate[16];				/* 244+ */
 } __packed;
 
 /*
  * Block 40 - LFP Data Block
  */
 
-/* Mask for DRRS / Panel Channel / SSC / BLT control bits extraction */
-#define MODE_MASK		0x3
-
 struct bdb_lvds_options {
 	u8 panel_type;
-	u8 panel_type2;						/* 212 */
+	u8 panel_type2;						/* 212+ */
 	/* LVDS capabilities, stored in a dword */
 	u8 pfit_mode:2;
 	u8 pfit_text_mode_enhanced:1;
 	u8 pfit_gfx_mode_enhanced:1;
 	u8 pfit_ratio_auto:1;
 	u8 pixel_dither:1;
-	u8 lvds_edid:1;
+	u8 lvds_edid:1;						/* ???-240 */
 	u8 rsvd2:1;
 	u8 rsvd4;
 	/* LVDS Panel channel bits stored here */
@@ -730,11 +776,11 @@ struct bdb_lvds_options {
 	/* LVDS panel type bits stored here */
 	u32 dps_panel_type_bits;
 	/* LVDS backlight control type bits stored here */
-	u32 blt_control_type_bits;
+	u32 blt_control_type_bits;				/* ???-240 */
 
-	u16 lcdvcc_s0_enable;					/* 200 */
-	u32 rotation;						/* 228 */
-	u32 position;						/* 240 */
+	u16 lcdvcc_s0_enable;					/* 200+ */
+	u32 rotation;						/* 228+ */
+	u32 position;						/* 240+ */
 } __packed;
 
 /*
@@ -755,7 +801,7 @@ struct lvds_lfp_data_ptr {
 struct bdb_lvds_lfp_data_ptrs {
 	u8 lvds_entries;
 	struct lvds_lfp_data_ptr ptr[16];
-	struct lvds_lfp_data_ptr_table panel_name; /* 156-163? */
+	struct lvds_lfp_data_ptr_table panel_name;		/* (156-163?)+ */
 } __packed;
 
 /*
@@ -807,20 +853,20 @@ struct lvds_lfp_panel_name {
 } __packed;
 
 struct lvds_lfp_black_border {
-	u8 top; /* 227 */
-	u8 bottom; /* 227 */
-	u8 left; /* 238 */
-	u8 right; /* 238 */
+	u8 top;		/* 227+ */
+	u8 bottom;	/* 227+ */
+	u8 left;	/* 238+ */
+	u8 right;	/* 238+ */
 } __packed;
 
 struct bdb_lvds_lfp_data_tail {
-	struct lvds_lfp_panel_name panel_name[16]; /* 156-163? */
-	u16 scaling_enable; /* 187 */
-	u8 seamless_drrs_min_refresh_rate[16]; /* 188 */
-	u8 pixel_overlap_count[16]; /* 208 */
-	struct lvds_lfp_black_border black_border[16]; /* 227 */
-	u16 dual_lfp_port_sync_enable; /* 231 */
-	u16 gpu_dithering_for_banding_artifacts; /* 245 */
+	struct lvds_lfp_panel_name panel_name[16];		/* (156-163?)+ */
+	u16 scaling_enable;					/* 187+ */
+	u8 seamless_drrs_min_refresh_rate[16];			/* 188+ */
+	u8 pixel_overlap_count[16];				/* 208+ */
+	struct lvds_lfp_black_border black_border[16];		/* 227+ */
+	u16 dual_lfp_port_sync_enable;				/* 231+ */
+	u16 gpu_dithering_for_banding_artifacts;		/* 245+ */
 } __packed;
 
 /*
@@ -835,7 +881,7 @@ struct lfp_backlight_data_entry {
 	u8 active_low_pwm:1;
 	u8 obsolete1:5;
 	u16 pwm_freq_hz;
-	u8 min_brightness; /* Obsolete from 234+ */
+	u8 min_brightness;					/* ???-233 */
 	u8 obsolete2;
 	u8 obsolete3;
 } __packed;
@@ -858,7 +904,7 @@ struct lfp_brightness_level {
 struct bdb_lfp_backlight_data {
 	u8 entry_size;
 	struct lfp_backlight_data_entry data[16];
-	u8 level[16]; /* Obsolete from 234+ */
+	u8 level[16];							/* ???-233 */
 	struct lfp_backlight_control_method backlight_control[16];
 	struct lfp_brightness_level brightness_level[16];		/* 234+ */
 	struct lfp_brightness_level brightness_min_level[16];		/* 234+ */
@@ -873,8 +919,8 @@ struct lfp_power_features {
 	u8 reserved1:1;
 	u8 power_conservation_pref:3;
 	u8 reserved2:1;
-	u8 lace_enabled_status:1;
-	u8 lace_support:1;
+	u8 lace_enabled_status:1;					/* 210+ */
+	u8 lace_support:1;						/* 210+ */
 	u8 als_enable:1;
 } __packed;
 
@@ -894,24 +940,24 @@ struct aggressiveness_profile2_entry {
 } __packed;
 
 struct bdb_lfp_power {
-	struct lfp_power_features features;
+	struct lfp_power_features features;				/* ???-227 */
 	struct als_data_entry als[5];
-	u8 lace_aggressiveness_profile:3;
+	u8 lace_aggressiveness_profile:3;				/* 210-227 */
 	u8 reserved1:5;
-	u16 dpst;
-	u16 psr;
-	u16 drrs;
-	u16 lace_support;
-	u16 adt;
-	u16 dmrrs;
-	u16 adb;
-	u16 lace_enabled_status;
-	struct aggressiveness_profile_entry aggressiveness[16];
-	u16 hobl; /* 232+ */
-	u16 vrr_feature_enabled; /* 233+ */
-	u16 elp; /* 247+ */
-	u16 opst; /* 247+ */
-	struct aggressiveness_profile2_entry aggressiveness2[16]; /* 247+ */
+	u16 dpst;							/* 228+ */
+	u16 psr;							/* 228+ */
+	u16 drrs;							/* 228+ */
+	u16 lace_support;						/* 228+ */
+	u16 adt;							/* 228+ */
+	u16 dmrrs;							/* 228+ */
+	u16 adb;							/* 228+ */
+	u16 lace_enabled_status;					/* 228+ */
+	struct aggressiveness_profile_entry aggressiveness[16];		/* 228+ */
+	u16 hobl;							/* 232+ */
+	u16 vrr_feature_enabled;					/* 233+ */
+	u16 elp;							/* 247+ */
+	u16 opst;							/* 247+ */
+	struct aggressiveness_profile2_entry aggressiveness2[16];	/* 247+ */
 } __packed;
 
 /*
@@ -921,10 +967,10 @@ struct bdb_lfp_power {
 #define MAX_MIPI_CONFIGURATIONS	6
 
 struct bdb_mipi_config {
-	struct mipi_config config[MAX_MIPI_CONFIGURATIONS]; /* 175 */
-	struct mipi_pps_data pps[MAX_MIPI_CONFIGURATIONS]; /* 177 */
-	struct edp_pwm_delays pwm_delays[MAX_MIPI_CONFIGURATIONS]; /* 186 */
-	u8 pmic_i2c_bus_number[MAX_MIPI_CONFIGURATIONS]; /* 190 */
+	struct mipi_config config[MAX_MIPI_CONFIGURATIONS];		/* 175+ */
+	struct mipi_pps_data pps[MAX_MIPI_CONFIGURATIONS];		/* 177+ */
+	struct edp_pwm_delays pwm_delays[MAX_MIPI_CONFIGURATIONS];	/* 186+ */
+	u8 pmic_i2c_bus_number[MAX_MIPI_CONFIGURATIONS];		/* 190+ */
 } __packed;
 
 /*
-- 
2.35.1
