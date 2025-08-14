Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE9CCA0EE4
	for <igt-dev@archiver.kernel.org>; Thu, 14 Aug 2025 12:49:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7833F10E885;
	Thu, 14 Aug 2025 12:49:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WjjFq0fz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BEBF10E885
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Aug 2025 12:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755175752; x=1786711752;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lIcd6+Q1xkkJYr2FXhcLzfnvS0XA7ZiErK2takkLWQg=;
 b=WjjFq0fzffJq+ZGfSzuoMHRdy5A+t1scXwNikQVQ1OQN9xcbZydA0v+R
 WfB0gr7S6b527jMOnKrZ+5603In13T8B57CkYT8mmxvQcdwch3vfoMO3e
 1/O3l0VTSbJCUhsVCxC8ZBwTBFrdjk9uqdUqhiQwlOYlV04onu1azbVRQ
 FaOWhE37WgDWuEbwOzQtjrcox7ybeWWNdQFHFtWjv0TcoLSa6bPtw1AIi
 dk6+6sJ+JbgPkS/1nhmwKpoSDIo5mfIlKiJkcFLnISkw8KY2SmUiRo7FE
 uz89yu5scWZy5RyhbszYb62vAWn7YzZ+cDVOpF99mB3frGgC/D+ANsobN g==;
X-CSE-ConnectionGUID: mYLIrv0kTBOupMhRN3AF6A==
X-CSE-MsgGUID: vpxc08IgTDaTAP1YPQHg/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="56697203"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="56697203"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 05:49:11 -0700
X-CSE-ConnectionGUID: mOZFanJ2TMWCoJsuwK4pXw==
X-CSE-MsgGUID: 3YyyRRmkTJGdBQFUoMAVMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="197606016"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.100])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 05:49:09 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 1/5] tools/intel_vbt_decode: Split up DSI VBT defs to a
 separate file
Date: Thu, 14 Aug 2025 15:48:52 +0300
Message-ID: <d22624e2bd28cf074708b9ca76dada6438422e9d.1755175663.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1755175663.git.jani.nikula@intel.com>
References: <cover.1755175663.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Synchronize intel_vbt_defs.h with kernel commit:

f3c65a8e9b09 ("drm/i915/vbt: split up DSI VBT defs to a separate file")

and copy over the new intel_dsi_vbt_defs.h, replacing similar
definitions in intel_bios.h. A handful of struct members have changed,
update accordingly.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tools/intel_bios.h         | 153 -------------------------------
 tools/intel_dsi_vbt_defs.h | 183 +++++++++++++++++++++++++++++++++++++
 tools/intel_vbt_decode.c   |  23 ++---
 tools/intel_vbt_defs.h     |   2 +-
 4 files changed, 196 insertions(+), 165 deletions(-)
 create mode 100644 tools/intel_dsi_vbt_defs.h

diff --git a/tools/intel_bios.h b/tools/intel_bios.h
index 01de2246e147..0bb4455d1f26 100644
--- a/tools/intel_bios.h
+++ b/tools/intel_bios.h
@@ -44,157 +44,4 @@ struct bdb_legacy_child_devices {
 #define BDB_DRIVER_SDVO_LVDS	2
 #define BDB_DRIVER_EDP		3
 
-/* Block 52 contains MiPi Panel info
- * 6 such enteries will there. Index into correct
- * entery is based on the panel_index in #40 LFP
- */
-#define MAX_MIPI_CONFIGURATIONS        6
-struct mipi_config {
-	uint16_t panel_id;
-
-	/* General Params */
-	uint32_t dithering:1;
-	uint32_t rsvd1:1;
-	uint32_t panel_type:1;
-	uint32_t panel_arch_type:2;
-	uint32_t cmd_mode:1;
-	uint32_t vtm:2;
-	uint32_t cabc:1;
-	uint32_t pwm_blc:1;
-
-	/* Bit 13:10
-	 * 000 - Reserved, 001 - RGB565, 002 - RGB666,
-	 * 011 - RGB666Loosely packed, 100 - RGB888,
-	 * others - rsvd
-	 */
-	uint32_t videomode_color_format:4;
-
-	/* Bit 15:14
-	 * 0 - No rotation, 1 - 90 degree
-	 * 2 - 180 degree, 3 - 270 degree
-	 */
-	uint32_t rotation:2;
-	uint32_t bta:1;
-	uint32_t rsvd2:15;
-
-	/* 2 byte Port Description */
-	uint16_t dual_link:2;
-	uint16_t lane_cnt:2;
-	uint16_t pixel_overlap:3;
-	uint16_t rsvd3:9;
-
-	/* 2 byte DSI COntroller params */
-	/* 0 - Using DSI PHY, 1 - TE usage */
-	uint16_t dsi_usage:1;
-	uint16_t rsvd4:15;
-
-	uint8_t rsvd5[5];
-	uint32_t dsi_ddr_clk;
-	uint32_t bridge_ref_clk;
-
-	uint8_t byte_clk_sel:2;
-	uint8_t rsvd6:6;
-
-	/* DPHY Flags */
-	uint16_t dphy_param_valid:1;
-	uint16_t eot_disabled:1;
-	uint16_t clk_stop:1;
-	uint16_t rsvd7:13;
-
-	uint32_t hs_tx_timeout;
-	uint32_t lp_rx_timeout;
-	uint32_t turn_around_timeout;
-	uint32_t device_reset_timer;
-	uint32_t master_init_timer;
-	uint32_t dbi_bw_timer;
-	uint32_t lp_byte_clk_val;
-
-	/*  4 byte Dphy Params */
-	uint32_t prepare_cnt:6;
-	uint32_t rsvd8:2;
-	uint32_t clk_zero_cnt:8;
-	uint32_t trail_cnt:5;
-	uint32_t rsvd9:3;
-	uint32_t exit_zero_cnt:6;
-	uint32_t rsvd10:2;
-
-	uint32_t clk_lane_switch_cnt;
-	uint32_t hl_switch_cnt;
-
-	uint32_t rsvd11[6];
-
-	/* timings based on dphy spec */
-	uint8_t tclk_miss;
-	uint8_t tclk_post;
-	uint8_t rsvd12;
-	uint8_t tclk_pre;
-	uint8_t tclk_prepare;
-	uint8_t tclk_settle;
-	uint8_t tclk_term_enable;
-	uint8_t tclk_trail;
-	uint16_t tclk_prepare_clkzero;
-	uint8_t rsvd13;
-	uint8_t td_term_enable;
-	uint8_t teot;
-	uint8_t ths_exit;
-	uint8_t ths_prepare;
-	uint16_t ths_prepare_hszero;
-	uint8_t rsvd14;
-	uint8_t ths_settle;
-	uint8_t ths_skip;
-	uint8_t ths_trail;
-	uint8_t tinit;
-	uint8_t tlpx;
-	uint8_t rsvd15[3];
-
-	/* GPIOs */
-	uint8_t panel_enable;
-	uint8_t bl_enable;
-	uint8_t pwm_enable;
-	uint8_t reset_r_n;
-	uint8_t pwr_down_r;
-	uint8_t stdby_r_n;
-
-} __attribute__ ((packed));
-
-/* Block 52 contains MiPi configuration block
- * 6 * bdb_mipi_config, followed by 6 pps data
- * block below
- */
-struct mipi_pps_data {
-	uint16_t panel_on_delay;
-	uint16_t bl_enable_delay;
-	uint16_t bl_disable_delay;
-	uint16_t panel_off_delay;
-	uint16_t panel_power_cycle_delay;
-} __attribute__ ((packed));
-
-/* MIPI Sequence Block definitions */
-enum mipi_seq {
-	MIPI_SEQ_END = 0,
-	MIPI_SEQ_ASSERT_RESET,
-	MIPI_SEQ_INIT_OTP,
-	MIPI_SEQ_DISPLAY_ON,
-	MIPI_SEQ_DISPLAY_OFF,
-	MIPI_SEQ_DEASSERT_RESET,
-	MIPI_SEQ_BACKLIGHT_ON,		/* sequence block v2+ */
-	MIPI_SEQ_BACKLIGHT_OFF,		/* sequence block v2+ */
-	MIPI_SEQ_TEAR_ON,		/* sequence block v2+ */
-	MIPI_SEQ_TEAR_OFF,		/* sequence block v3+ */
-	MIPI_SEQ_POWER_ON,		/* sequence block v3+ */
-	MIPI_SEQ_POWER_OFF,		/* sequence block v3+ */
-	MIPI_SEQ_MAX
-};
-
-enum mipi_seq_element {
-	MIPI_SEQ_ELEM_END = 0,
-	MIPI_SEQ_ELEM_SEND_PKT,
-	MIPI_SEQ_ELEM_DELAY,
-	MIPI_SEQ_ELEM_GPIO,
-	MIPI_SEQ_ELEM_I2C,		/* sequence block v2+ */
-	MIPI_SEQ_ELEM_SPI,		/* sequence block v3+ */
-	MIPI_SEQ_ELEM_PMIC,		/* sequence block v3+ */
-	MIPI_SEQ_ELEM_MAX
-};
-
 #endif /* _INTEL_BIOS_H_ */
diff --git a/tools/intel_dsi_vbt_defs.h b/tools/intel_dsi_vbt_defs.h
new file mode 100644
index 000000000000..f83d42ed0c5a
--- /dev/null
+++ b/tools/intel_dsi_vbt_defs.h
@@ -0,0 +1,183 @@
+/* SPDX-License-Identifier: MIT */
+/* Copyright © 2025 Intel Corporation */
+
+#ifndef __INTEL_DSI_VBT_DEFS_H__
+#define __INTEL_DSI_VBT_DEFS_H__
+
+#include <linux/types.h>
+
+/*
+ * MIPI Sequence Block definitions
+ *
+ * Note the VBT spec has AssertReset / DeassertReset swapped from their
+ * usual naming, we use the proper names here to avoid confusion when
+ * reading the code.
+ */
+enum mipi_seq {
+	MIPI_SEQ_END = 0,
+	MIPI_SEQ_DEASSERT_RESET,	/* Spec says MipiAssertResetPin */
+	MIPI_SEQ_INIT_OTP,
+	MIPI_SEQ_DISPLAY_ON,
+	MIPI_SEQ_DISPLAY_OFF,
+	MIPI_SEQ_ASSERT_RESET,		/* Spec says MipiDeassertResetPin */
+	MIPI_SEQ_BACKLIGHT_ON,		/* sequence block v2+ */
+	MIPI_SEQ_BACKLIGHT_OFF,		/* sequence block v2+ */
+	MIPI_SEQ_TEAR_ON,		/* sequence block v2+ */
+	MIPI_SEQ_TEAR_OFF,		/* sequence block v3+ */
+	MIPI_SEQ_POWER_ON,		/* sequence block v3+ */
+	MIPI_SEQ_POWER_OFF,		/* sequence block v3+ */
+	MIPI_SEQ_MAX
+};
+
+enum mipi_seq_element {
+	MIPI_SEQ_ELEM_END = 0,
+	MIPI_SEQ_ELEM_SEND_PKT,
+	MIPI_SEQ_ELEM_DELAY,
+	MIPI_SEQ_ELEM_GPIO,
+	MIPI_SEQ_ELEM_I2C,		/* sequence block v2+ */
+	MIPI_SEQ_ELEM_SPI,		/* sequence block v3+ */
+	MIPI_SEQ_ELEM_PMIC,		/* sequence block v3+ */
+	MIPI_SEQ_ELEM_MAX
+};
+
+#define MIPI_DSI_UNDEFINED_PANEL_ID	0
+#define MIPI_DSI_GENERIC_PANEL_ID	1
+
+struct mipi_config {
+	u16 panel_id;
+
+	/* General Params */
+	u32 enable_dithering:1;
+	u32 rsvd1:1;
+	u32 is_bridge:1;
+
+	u32 panel_arch_type:2;
+	u32 is_cmd_mode:1;
+
+#define NON_BURST_SYNC_PULSE	0x1
+#define NON_BURST_SYNC_EVENTS	0x2
+#define BURST_MODE		0x3
+	u32 video_transfer_mode:2;
+
+	u32 cabc_supported:1;
+#define PPS_BLC_PMIC   0
+#define PPS_BLC_SOC    1
+	u32 pwm_blc:1;
+
+	/* Bit 13:10 */
+#define PIXEL_FORMAT_RGB565			0x1
+#define PIXEL_FORMAT_RGB666			0x2
+#define PIXEL_FORMAT_RGB666_LOOSELY_PACKED	0x3
+#define PIXEL_FORMAT_RGB888			0x4
+	u32 videomode_color_format:4;
+
+	/* Bit 15:14 */
+#define ENABLE_ROTATION_0	0x0
+#define ENABLE_ROTATION_90	0x1
+#define ENABLE_ROTATION_180	0x2
+#define ENABLE_ROTATION_270	0x3
+	u32 rotation:2;
+	u32 bta_enabled:1;
+	u32 rsvd2:15;
+
+	/* 2 byte Port Description */
+#define DUAL_LINK_NOT_SUPPORTED	0
+#define DUAL_LINK_FRONT_BACK	1
+#define DUAL_LINK_PIXEL_ALT	2
+	u16 dual_link:2;
+	u16 lane_cnt:2;
+	u16 pixel_overlap:3;
+	u16 rgb_flip:1;
+#define DL_DCS_PORT_A			0x00
+#define DL_DCS_PORT_C			0x01
+#define DL_DCS_PORT_A_AND_C		0x02
+	u16 dl_dcs_cabc_ports:2;
+	u16 dl_dcs_backlight_ports:2;
+	u16 rsvd3:4;
+
+	u16 rsvd4;
+
+	u8 rsvd5;
+	u32 target_burst_mode_freq;
+	u32 dsi_ddr_clk;
+	u32 bridge_ref_clk;
+
+#define  BYTE_CLK_SEL_20MHZ		0
+#define  BYTE_CLK_SEL_10MHZ		1
+#define  BYTE_CLK_SEL_5MHZ		2
+	u8 byte_clk_sel:2;
+
+	u8 rsvd6:6;
+
+	/* DPHY Flags */
+	u16 dphy_param_valid:1;
+	u16 eot_pkt_disabled:1;
+	u16 enable_clk_stop:1;
+	u16 rsvd7:13;
+
+	u32 hs_tx_timeout;
+	u32 lp_rx_timeout;
+	u32 turn_around_timeout;
+	u32 device_reset_timer;
+	u32 master_init_timer;
+	u32 dbi_bw_timer;
+	u32 lp_byte_clk_val;
+
+	/*  4 byte Dphy Params */
+	u32 prepare_cnt:6;
+	u32 rsvd8:2;
+	u32 clk_zero_cnt:8;
+	u32 trail_cnt:5;
+	u32 rsvd9:3;
+	u32 exit_zero_cnt:6;
+	u32 rsvd10:2;
+
+	u32 clk_lane_switch_cnt;
+	u32 hl_switch_cnt;
+
+	u32 rsvd11[6];
+
+	/* timings based on dphy spec */
+	u8 tclk_miss;
+	u8 tclk_post;
+	u8 rsvd12;
+	u8 tclk_pre;
+	u8 tclk_prepare;
+	u8 tclk_settle;
+	u8 tclk_term_enable;
+	u8 tclk_trail;
+	u16 tclk_prepare_clkzero;
+	u8 rsvd13;
+	u8 td_term_enable;
+	u8 teot;
+	u8 ths_exit;
+	u8 ths_prepare;
+	u16 ths_prepare_hszero;
+	u8 rsvd14;
+	u8 ths_settle;
+	u8 ths_skip;
+	u8 ths_trail;
+	u8 tinit;
+	u8 tlpx;
+	u8 rsvd15[3];
+
+	/* GPIOs */
+	u8 panel_enable;
+	u8 bl_enable;
+	u8 pwm_enable;
+	u8 reset_r_n;
+	u8 pwr_down_r;
+	u8 stdby_r_n;
+
+} __packed;
+
+/* all delays have a unit of 100us */
+struct mipi_pps_data {
+	u16 panel_on_delay;
+	u16 bl_enable_delay;
+	u16 bl_disable_delay;
+	u16 panel_off_delay;
+	u16 panel_power_cycle_delay;
+} __packed;
+
+#endif /* __INTEL_DSI_VBT_DEFS_H__ */
diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 7bb3c19c3340..f7dee8646b4a 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -40,8 +40,9 @@
 
 #include "igt_aux.h"
 #include "igt_halffloat.h"
-#include "intel_io.h"
+#include "intel_bios.h"
 #include "intel_chipset.h"
+#include "intel_io.h"
 #include "drmtest.h"
 
 /* kernel types for intel_vbt_defs.h */
@@ -2842,7 +2843,7 @@ static void dump_mipi_config(struct context *context,
 		printf("\tPanel %d%s\n", i, panel_str(context, i));
 
 		printf("\t\tGeneral Param\n");
-		printf("\t\t\t BTA disable: %s\n", config->bta ? "Disabled" : "Enabled");
+		printf("\t\t\t BTA disable: %s\n", config->bta_enabled ? "Disabled" : "Enabled");
 		printf("\t\t\t Panel Rotation: %d degrees\n", config->rotation * 90);
 
 		printf("\t\t\t Video Mode Color Format: ");
@@ -2859,16 +2860,16 @@ static void dump_mipi_config(struct context *context,
 		printf("\t\t\t PPS GPIO Pins: %s \n",
 		       config->pwm_blc ? "Using SOC" : "Using PMIC");
 		printf("\t\t\t CABC Support: %s\n",
-		       config->cabc ? "supported" : "not supported");
+		       config->cabc_supported ? "supported" : "not supported");
 		printf("\t\t\t Mode: %s\n",
-		       config->cmd_mode ? "COMMAND" : "VIDEO");
+		       config->is_cmd_mode ? "COMMAND" : "VIDEO");
 		printf("\t\t\t Video transfer mode: %s (0x%x)\n",
-		       config->vtm == 1 ? "non-burst with sync pulse" :
-		       config->vtm == 2 ? "non-burst with sync events" :
-		       config->vtm == 3 ? "burst" : "<unknown>",
-		       config->vtm);
+		       config->video_transfer_mode == 1 ? "non-burst with sync pulse" :
+		       config->video_transfer_mode == 2 ? "non-burst with sync events" :
+		       config->video_transfer_mode == 3 ? "burst" : "<unknown>",
+		       config->video_transfer_mode);
 		printf("\t\t\t Dithering: %s\n",
-		       config->dithering ? "done in Display Controller" : "done in Panel Controller");
+		       config->enable_dithering ? "done in Display Controller" : "done in Panel Controller");
 
 		printf("\t\tPort Desc\n");
 		printf("\t\t\t Pixel overlap: %d\n", config->pixel_overlap);
@@ -2883,9 +2884,9 @@ static void dump_mipi_config(struct context *context,
 
 		printf("\t\tDphy Flags\n");
 		printf("\t\t\t Clock Stop: %s\n",
-		       config->clk_stop ? "ENABLED" : "DISABLED");
+		       config->enable_clk_stop ? "ENABLED" : "DISABLED");
 		printf("\t\t\t EOT disabled: %s\n\n",
-		       config->eot_disabled ? "EOT not to be sent" : "EOT to be sent");
+		       config->eot_pkt_disabled ? "EOT not to be sent" : "EOT to be sent");
 
 		printf("\t\tHSTxTimeOut: 0x%x\n", config->hs_tx_timeout);
 		printf("\t\tLPRXTimeOut: 0x%x\n", config->lp_rx_timeout);
diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
index 92c04811aa28..6612d3a4ec49 100644
--- a/tools/intel_vbt_defs.h
+++ b/tools/intel_vbt_defs.h
@@ -37,7 +37,7 @@
 #ifndef _INTEL_VBT_DEFS_H_
 #define _INTEL_VBT_DEFS_H_
 
-#include "intel_bios.h"
+#include "intel_dsi_vbt_defs.h"
 
 /* EDID derived structures */
 struct bdb_edid_pnp_id {
-- 
2.47.2

