Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481ADCA0EE0
	for <igt-dev@archiver.kernel.org>; Fri, 15 Aug 2025 08:05:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3CAA10E365;
	Fri, 15 Aug 2025 08:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="le4PV2a2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE1210E365
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Aug 2025 08:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755245116; x=1786781116;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B3sO1Itk4pCTnYCtvZv2uAmYatEP4qWmYl4IIufGKpQ=;
 b=le4PV2a23mJPozEXZzHE7Im7kbWSTSAYy9f1WyiIFKjslGXzLxPR53VZ
 WBUZiS6Zwj+FfPoeWCOa8pSa+jMRI1iS4kWwozlcytJUq1PuIm2ko+Pix
 lJ/t1RVzgVyPZ4Cj280QaxDUZzQ1O73fEn3pHH9Wrp2mt8/fn1qC2530w
 QLRZB1EH35lLp57gR4Q7hhr8WSIvQN5BMmW/GkEmgZU4aOrcv82Zk694d
 9Y2Z7tPuKwfru5tePDlGJrmJYqearY9w3xOCmUvX9xmdxuoTaEzNEgpAk
 1dKhhwARn6TTODBESxaAP0TKzFkr7IlJwf5ZNWttiL1CyNS3twF6Pp/sw Q==;
X-CSE-ConnectionGUID: Olbiyf+YQXONVh8s331NBw==
X-CSE-MsgGUID: lRfSmczMSCqQD3iPDsDQXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57494985"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="57494985"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 01:05:16 -0700
X-CSE-ConnectionGUID: NDX9Tq1CQ+ObL7j1Uwg8CA==
X-CSE-MsgGUID: nx8zQK9hT9KWGXJVvYUXDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="166882091"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.142])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 01:05:15 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [RESEND i-g-t 3/5] tools/intel_vbt_decode: Add anonymous structs to
 group DSI VBT defs
Date: Fri, 15 Aug 2025 11:04:53 +0300
Message-ID: <bb3a01d122893a65c0cb9cccb20db2ad1738c28e.1755245038.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1755245038.git.jani.nikula@intel.com>
References: <cover.1755245038.git.jani.nikula@intel.com>
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

Synchronize intel_dsi_vbt_defs.h with kernel commit:

aa0c02f04369 ("drm/i915/vbt: add anonymous structs to group DSI VBT defs")

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tools/intel_dsi_vbt_defs.h | 87 ++++++++++++++++++++------------------
 1 file changed, 47 insertions(+), 40 deletions(-)

diff --git a/tools/intel_dsi_vbt_defs.h b/tools/intel_dsi_vbt_defs.h
index f83d42ed0c5a..7ac872dbba8d 100644
--- a/tools/intel_dsi_vbt_defs.h
+++ b/tools/intel_dsi_vbt_defs.h
@@ -47,53 +47,55 @@ struct mipi_config {
 	u16 panel_id;
 
 	/* General Params */
-	u32 enable_dithering:1;
-	u32 rsvd1:1;
-	u32 is_bridge:1;
+	struct {
+		u32 enable_dithering:1;
+		u32 rsvd1:1;
+		u32 is_bridge:1;
 
-	u32 panel_arch_type:2;
-	u32 is_cmd_mode:1;
+		u32 panel_arch_type:2;
+		u32 is_cmd_mode:1;
 
 #define NON_BURST_SYNC_PULSE	0x1
 #define NON_BURST_SYNC_EVENTS	0x2
 #define BURST_MODE		0x3
-	u32 video_transfer_mode:2;
+		u32 video_transfer_mode:2;
 
-	u32 cabc_supported:1;
+		u32 cabc_supported:1;
 #define PPS_BLC_PMIC   0
 #define PPS_BLC_SOC    1
-	u32 pwm_blc:1;
+		u32 pwm_blc:1;
 
-	/* Bit 13:10 */
 #define PIXEL_FORMAT_RGB565			0x1
 #define PIXEL_FORMAT_RGB666			0x2
 #define PIXEL_FORMAT_RGB666_LOOSELY_PACKED	0x3
 #define PIXEL_FORMAT_RGB888			0x4
-	u32 videomode_color_format:4;
+		u32 videomode_color_format:4;
 
-	/* Bit 15:14 */
 #define ENABLE_ROTATION_0	0x0
 #define ENABLE_ROTATION_90	0x1
 #define ENABLE_ROTATION_180	0x2
 #define ENABLE_ROTATION_270	0x3
-	u32 rotation:2;
-	u32 bta_enabled:1;
-	u32 rsvd2:15;
+		u32 rotation:2;
+		u32 bta_enabled:1;
+		u32 rsvd2:15;
+	} __packed;
 
-	/* 2 byte Port Description */
+	/* Port Desc */
+	struct {
 #define DUAL_LINK_NOT_SUPPORTED	0
 #define DUAL_LINK_FRONT_BACK	1
 #define DUAL_LINK_PIXEL_ALT	2
-	u16 dual_link:2;
-	u16 lane_cnt:2;
-	u16 pixel_overlap:3;
-	u16 rgb_flip:1;
+		u16 dual_link:2;
+		u16 lane_cnt:2;
+		u16 pixel_overlap:3;
+		u16 rgb_flip:1;
 #define DL_DCS_PORT_A			0x00
 #define DL_DCS_PORT_C			0x01
 #define DL_DCS_PORT_A_AND_C		0x02
-	u16 dl_dcs_cabc_ports:2;
-	u16 dl_dcs_backlight_ports:2;
-	u16 rsvd3:4;
+		u16 dl_dcs_cabc_ports:2;
+		u16 dl_dcs_backlight_ports:2;
+		u16 rsvd3:4;
+	} __packed;
 
 	u16 rsvd4;
 
@@ -102,18 +104,22 @@ struct mipi_config {
 	u32 dsi_ddr_clk;
 	u32 bridge_ref_clk;
 
+	/* LP Byte Clock */
+	struct {
 #define  BYTE_CLK_SEL_20MHZ		0
 #define  BYTE_CLK_SEL_10MHZ		1
 #define  BYTE_CLK_SEL_5MHZ		2
-	u8 byte_clk_sel:2;
-
-	u8 rsvd6:6;
-
-	/* DPHY Flags */
-	u16 dphy_param_valid:1;
-	u16 eot_pkt_disabled:1;
-	u16 enable_clk_stop:1;
-	u16 rsvd7:13;
+		u8 byte_clk_sel:2;
+		u8 rsvd6:6;
+	} __packed;
+
+	/* DPhy Flags */
+	struct {
+		u16 dphy_param_valid:1;
+		u16 eot_pkt_disabled:1;
+		u16 enable_clk_stop:1;
+		u16 rsvd7:13;
+	} __packed;
 
 	u32 hs_tx_timeout;
 	u32 lp_rx_timeout;
@@ -123,14 +129,16 @@ struct mipi_config {
 	u32 dbi_bw_timer;
 	u32 lp_byte_clk_val;
 
-	/*  4 byte Dphy Params */
-	u32 prepare_cnt:6;
-	u32 rsvd8:2;
-	u32 clk_zero_cnt:8;
-	u32 trail_cnt:5;
-	u32 rsvd9:3;
-	u32 exit_zero_cnt:6;
-	u32 rsvd10:2;
+	/*  DPhy Params */
+	struct {
+		u32 prepare_cnt:6;
+		u32 rsvd8:2;
+		u32 clk_zero_cnt:8;
+		u32 trail_cnt:5;
+		u32 rsvd9:3;
+		u32 exit_zero_cnt:6;
+		u32 rsvd10:2;
+	} __packed;
 
 	u32 clk_lane_switch_cnt;
 	u32 hl_switch_cnt;
@@ -168,7 +176,6 @@ struct mipi_config {
 	u8 reset_r_n;
 	u8 pwr_down_r;
 	u8 stdby_r_n;
-
 } __packed;
 
 /* all delays have a unit of 100us */
-- 
2.47.2

