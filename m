Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33BCCA0EE4
	for <igt-dev@archiver.kernel.org>; Mon, 18 Aug 2025 16:36:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6265310E4A1;
	Mon, 18 Aug 2025 16:36:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f6Yiygap";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F38E10E4A3
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Aug 2025 16:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755534965; x=1787070965;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EfGz+Vr4/Iu4y0hwCnLRNFZTLO8oxBPxOoY6b6cGs7Q=;
 b=f6YiygapD+mwjSm0uxIX9+m/2R+a4fGRorKrz3iF74XTZ3BjpHmkcnEN
 7Pn03QG/ZYpZ9F26vlKMDJsl/yZ5CBarhMt29EausNace/23AbEEjLz9x
 WRnKwUV+iPJ+0GdhpujOlhmE6gvwJSJ5O838E8USQpZcHZSdJnA8OTxsS
 zv32UA51RN2XIiCGc+ZTuOxF7nrKTyBO9UvFlRiGq38rjNnwfoh7n3arO
 7QfX2JGh/Tz6mzY/QEY6LHhbqovsDCxXnaPKvc1Ro/Pz3rHc3ka0xE8Bw
 4dZhn4nCXuBzD0HrAckZS56t/UlQ0y6o9w8Z4JcZoyj65dP9eFYkfKI4k Q==;
X-CSE-ConnectionGUID: mNCz+BEsR6mKjTuMKyOzjw==
X-CSE-MsgGUID: XDsz5CXVSbCvOfdaMPOSNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="75332047"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="75332047"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 09:36:05 -0700
X-CSE-ConnectionGUID: LbtYc4A7T/CqbbXsMcMIOA==
X-CSE-MsgGUID: zbqHLyovTDylfeRrWuGOtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="172954530"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 09:36:04 -0700
Date: Mon, 18 Aug 2025 18:36:01 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 3/5] tools/intel_vbt_decode: Add anonymous structs
 to group DSI VBT defs
Message-ID: <20250818163601.smxednwmbmopc3dx@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org
References: <cover.1755175663.git.jani.nikula@intel.com>
 <bb3a01d122893a65c0cb9cccb20db2ad1738c28e.1755175663.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bb3a01d122893a65c0cb9cccb20db2ad1738c28e.1755175663.git.jani.nikula@intel.com>
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

Hi Jani,
On 2025-08-14 at 15:48:54 +0300, Jani Nikula wrote:
> Synchronize intel_dsi_vbt_defs.h with kernel commit:
> 
> aa0c02f04369 ("drm/i915/vbt: add anonymous structs to group DSI VBT defs")
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tools/intel_dsi_vbt_defs.h | 87 ++++++++++++++++++++------------------
>  1 file changed, 47 insertions(+), 40 deletions(-)
> 
> diff --git a/tools/intel_dsi_vbt_defs.h b/tools/intel_dsi_vbt_defs.h
> index f83d42ed0c5a..7ac872dbba8d 100644
> --- a/tools/intel_dsi_vbt_defs.h
> +++ b/tools/intel_dsi_vbt_defs.h
> @@ -47,53 +47,55 @@ struct mipi_config {
>  	u16 panel_id;
>  
>  	/* General Params */
> -	u32 enable_dithering:1;
> -	u32 rsvd1:1;
> -	u32 is_bridge:1;
> +	struct {
> +		u32 enable_dithering:1;
> +		u32 rsvd1:1;
> +		u32 is_bridge:1;
>  
> -	u32 panel_arch_type:2;
> -	u32 is_cmd_mode:1;
> +		u32 panel_arch_type:2;
> +		u32 is_cmd_mode:1;
>  
>  #define NON_BURST_SYNC_PULSE	0x1
>  #define NON_BURST_SYNC_EVENTS	0x2
>  #define BURST_MODE		0x3
> -	u32 video_transfer_mode:2;
> +		u32 video_transfer_mode:2;
>  
> -	u32 cabc_supported:1;
> +		u32 cabc_supported:1;
>  #define PPS_BLC_PMIC   0
>  #define PPS_BLC_SOC    1
> -	u32 pwm_blc:1;
> +		u32 pwm_blc:1;
>  
> -	/* Bit 13:10 */
>  #define PIXEL_FORMAT_RGB565			0x1
>  #define PIXEL_FORMAT_RGB666			0x2
>  #define PIXEL_FORMAT_RGB666_LOOSELY_PACKED	0x3
>  #define PIXEL_FORMAT_RGB888			0x4
> -	u32 videomode_color_format:4;
> +		u32 videomode_color_format:4;
>  
> -	/* Bit 15:14 */
>  #define ENABLE_ROTATION_0	0x0
>  #define ENABLE_ROTATION_90	0x1
>  #define ENABLE_ROTATION_180	0x2
>  #define ENABLE_ROTATION_270	0x3
> -	u32 rotation:2;
> -	u32 bta_enabled:1;
> -	u32 rsvd2:15;
> +		u32 rotation:2;
> +		u32 bta_enabled:1;
> +		u32 rsvd2:15;
> +	} __packed;
>  
> -	/* 2 byte Port Description */
> +	/* Port Desc */
> +	struct {
>  #define DUAL_LINK_NOT_SUPPORTED	0
>  #define DUAL_LINK_FRONT_BACK	1
>  #define DUAL_LINK_PIXEL_ALT	2
> -	u16 dual_link:2;
> -	u16 lane_cnt:2;
> -	u16 pixel_overlap:3;
> -	u16 rgb_flip:1;
> +		u16 dual_link:2;
> +		u16 lane_cnt:2;
> +		u16 pixel_overlap:3;
> +		u16 rgb_flip:1;
>  #define DL_DCS_PORT_A			0x00
>  #define DL_DCS_PORT_C			0x01
>  #define DL_DCS_PORT_A_AND_C		0x02
> -	u16 dl_dcs_cabc_ports:2;
> -	u16 dl_dcs_backlight_ports:2;
> -	u16 rsvd3:4;
> +		u16 dl_dcs_cabc_ports:2;
> +		u16 dl_dcs_backlight_ports:2;
> +		u16 rsvd3:4;
> +	} __packed;
>  
>  	u16 rsvd4;
>  
> @@ -102,18 +104,22 @@ struct mipi_config {
>  	u32 dsi_ddr_clk;
>  	u32 bridge_ref_clk;
>  
> +	/* LP Byte Clock */
> +	struct {
>  #define  BYTE_CLK_SEL_20MHZ		0
>  #define  BYTE_CLK_SEL_10MHZ		1
>  #define  BYTE_CLK_SEL_5MHZ		2
> -	u8 byte_clk_sel:2;
> -
> -	u8 rsvd6:6;
> -
> -	/* DPHY Flags */
> -	u16 dphy_param_valid:1;
> -	u16 eot_pkt_disabled:1;
> -	u16 enable_clk_stop:1;
> -	u16 rsvd7:13;
> +		u8 byte_clk_sel:2;
> +		u8 rsvd6:6;
> +	} __packed;
> +
> +	/* DPhy Flags */
> +	struct {
> +		u16 dphy_param_valid:1;
> +		u16 eot_pkt_disabled:1;
> +		u16 enable_clk_stop:1;
> +		u16 rsvd7:13;
> +	} __packed;
>  
>  	u32 hs_tx_timeout;
>  	u32 lp_rx_timeout;
> @@ -123,14 +129,16 @@ struct mipi_config {
>  	u32 dbi_bw_timer;
>  	u32 lp_byte_clk_val;
>  
> -	/*  4 byte Dphy Params */
> -	u32 prepare_cnt:6;
> -	u32 rsvd8:2;
> -	u32 clk_zero_cnt:8;
> -	u32 trail_cnt:5;
> -	u32 rsvd9:3;
> -	u32 exit_zero_cnt:6;
> -	u32 rsvd10:2;
> +	/*  DPhy Params */
> +	struct {
> +		u32 prepare_cnt:6;
> +		u32 rsvd8:2;
> +		u32 clk_zero_cnt:8;
> +		u32 trail_cnt:5;
> +		u32 rsvd9:3;
> +		u32 exit_zero_cnt:6;
> +		u32 rsvd10:2;
> +	} __packed;
>  
>  	u32 clk_lane_switch_cnt;
>  	u32 hl_switch_cnt;
> @@ -168,7 +176,6 @@ struct mipi_config {
>  	u8 reset_r_n;
>  	u8 pwr_down_r;
>  	u8 stdby_r_n;
> -
>  } __packed;
>  
>  /* all delays have a unit of 100us */
> -- 
> 2.47.2
> 
