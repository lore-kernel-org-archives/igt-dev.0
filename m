Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A7DCA0EE4
	for <igt-dev@archiver.kernel.org>; Mon, 18 Aug 2025 16:41:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E4210E4A3;
	Mon, 18 Aug 2025 16:41:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TYnw24gE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F85410E4A3
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Aug 2025 16:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755535295; x=1787071295;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fpypfkeojrsdqv1oY/dTB2k/O0/IewOIDP45OBTk304=;
 b=TYnw24gERSQKdCk3es4DpQHHSDtxc9Lb5XBaeWUsglrol7lNbOtu76Bl
 qOQVnWMt/nuL2QxiY+GFZb6HSoL+8BfVWlbXqVjHOTFujJsx3MkAdNl/u
 lBbTma4gZJfwfAvpP7prc1kJPhvMH2xhqXvp1ZIb72VsF4g9mAzQ7mqMy
 3OfMD05g+ak+Lwm99qk0BVZR0/cWvuOrrlX1CsxhTj2rUYsI5iz97l/8o
 D88tPVrAOhUuFIV5UGNDr/yBZ2dMF+xUv/kt9VY5AtfbDV24ijtXH3hGE
 kwHlMLlXoZVxzzkEwnPrzuKNwXlL7wwLdPbS7SKqCJrY8hq5rFgvMKGZj Q==;
X-CSE-ConnectionGUID: xaimLkFeRb6v6VrU4dsHSQ==
X-CSE-MsgGUID: 78NvJszgTvaonCVhDUJqnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="68474037"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="68474037"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 09:40:36 -0700
X-CSE-ConnectionGUID: UpVPffVPSzO5rgHqR8EK+Q==
X-CSE-MsgGUID: NadjMHoNS6ymf0MQp+7+lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="198473745"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 09:40:35 -0700
Date: Mon, 18 Aug 2025 18:40:32 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 5/5] tools/intel_vbt_decode: Add missing DSI VBT defs
Message-ID: <20250818164032.ryvdqq5caxhtdm4n@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org
References: <cover.1755175663.git.jani.nikula@intel.com>
 <4a1271e36ed9bfc70afec1e4e41f1c204aab8b5d.1755175663.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4a1271e36ed9bfc70afec1e4e41f1c204aab8b5d.1755175663.git.jani.nikula@intel.com>
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
On 2025-08-14 at 15:48:56 +0300, Jani Nikula wrote:
> Synchronize intel_dsi_vbt_defs.h with kernel commit:
> 
> 906cbdc1fffa ("drm/i915/vbt: add missing DSI VBT defs")
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tools/intel_dsi_vbt_defs.h | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/intel_dsi_vbt_defs.h b/tools/intel_dsi_vbt_defs.h
> index 3f9b9ed6592c..edc7331dcca2 100644
> --- a/tools/intel_dsi_vbt_defs.h
> +++ b/tools/intel_dsi_vbt_defs.h
> @@ -94,10 +94,15 @@ struct mipi_config {
>  #define DL_DCS_PORT_A_AND_C		0x02
>  		u16 dl_dcs_cabc_ports:2;
>  		u16 dl_dcs_backlight_ports:2;
> -		u16 rsvd3:4;
> +		u16 port_sync:1;				/* 219-230 */
> +		u16 rsvd3:3;
>  	} __packed;
>  
> -	u16 rsvd4;
> +	/* DSI Controller Parameters */
> +	struct {
> +		u16 dsi_usage:1;
> +		u16 rsvd4:15;
> +	} __packed;
>  
>  	u8 rsvd5;
>  	u32 target_burst_mode_freq;
> @@ -118,7 +123,9 @@ struct mipi_config {
>  		u16 dphy_param_valid:1;
>  		u16 eot_pkt_disabled:1;
>  		u16 enable_clk_stop:1;
> -		u16 rsvd7:13;
> +		u16 blanking_packets_during_bllp:1;		/* 219+ */
> +		u16 lp_clock_during_lpm:1;			/* 219+ */
> +		u16 rsvd7:11;
>  	} __packed;
>  
>  	u32 hs_tx_timeout;
> -- 
> 2.47.2
> 
