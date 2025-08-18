Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7B9CA0ED1
	for <igt-dev@archiver.kernel.org>; Mon, 18 Aug 2025 16:38:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E561610E4A3;
	Mon, 18 Aug 2025 16:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I26tbMWk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0053910E4A3
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Aug 2025 16:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755535134; x=1787071134;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5x4Bf3xPO2iotr2FVY4+FmH4BNQrXrqlEV/EZj8di3Q=;
 b=I26tbMWkXw+4whXbu8hsbRmpnhujSuYoZlAHEcwRCPtzsLxZrRTFl3ME
 xTpP+jmIxvzygZl+4tAhrknl/wfsJSlpy39LO8t515buP4IoXdFXxJNse
 s5rRQY/OcEhwTAZ6NIExUiaBZsipLAT77NmHifDKkJi93DnL8G3nPwV+l
 QDH0k3OMx6c6E7wwdvvtiqbNh54QVSazoi6Wu636mOhKUrKPohsaS3lgo
 dZGC66UckjPtU9zhZ/0cVi29TtJpBPwdKZt5o7jkqBl9Se6wtzIQObuRi
 MLg91LkgvSD0pBHk7VW6A9lzI5J4IwvSjUhmQMEwh4G1PMeh8LRZMwNlj w==;
X-CSE-ConnectionGUID: ZlHVlYyjTnGZTSUn0MCmMw==
X-CSE-MsgGUID: GA3bw17ITJmst6vkxMp7Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="68029898"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="68029898"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 09:38:53 -0700
X-CSE-ConnectionGUID: 1Xdfdu0RTt6Vb1Wfla8coA==
X-CSE-MsgGUID: /d4Q9m1aQ5yRqrp4a3Ue/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="168423755"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 09:38:52 -0700
Date: Mon, 18 Aug 2025 18:38:50 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 4/5] tools/intel_vbt_decode: Flip bta_enabled to
 bta_disable
Message-ID: <20250818163850.jwocwvp7pbbmzlvw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org
References: <cover.1755175663.git.jani.nikula@intel.com>
 <335bfe64fb01ba488ed666142b3e092bc2a9c4ee.1755175663.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <335bfe64fb01ba488ed666142b3e092bc2a9c4ee.1755175663.git.jani.nikula@intel.com>
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
On 2025-08-14 at 15:48:55 +0300, Jani Nikula wrote:
> Synchronize intel_dsi_vbt_defs.h with kernel commit:
> 
> 745b597a7930 ("drm/i915/vbt: flip bta_enabled to bta_disable")
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tools/intel_dsi_vbt_defs.h | 2 +-
>  tools/intel_vbt_decode.c   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/intel_dsi_vbt_defs.h b/tools/intel_dsi_vbt_defs.h
> index 7ac872dbba8d..3f9b9ed6592c 100644
> --- a/tools/intel_dsi_vbt_defs.h
> +++ b/tools/intel_dsi_vbt_defs.h
> @@ -76,7 +76,7 @@ struct mipi_config {
>  #define ENABLE_ROTATION_180	0x2
>  #define ENABLE_ROTATION_270	0x3
>  		u32 rotation:2;
> -		u32 bta_enabled:1;
> +		u32 bta_disable:1;
>  		u32 rsvd2:15;
>  	} __packed;
>  
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index 307c4da14843..6882ae1d2f63 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -2852,7 +2852,7 @@ static void dump_mipi_config(struct context *context,
>  		printf("\tPanel %d%s\n", i, panel_str(context, i));
>  
>  		printf("\t\tGeneral Param\n");
> -		printf("\t\t\t BTA disable: %s\n", config->bta_enabled ? "Disabled" : "Enabled");
> +		printf("\t\t\t BTA disable: %s\n", config->bta_disable ? "Disabled" : "Enabled");
>  		printf("\t\t\t Panel Rotation: %d degrees\n", config->rotation * 90);
>  
>  		printf("\t\t\t Video Mode Color Format: ");
> -- 
> 2.47.2
> 
