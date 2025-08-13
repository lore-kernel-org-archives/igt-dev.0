Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC33DCA0EE0
	for <igt-dev@archiver.kernel.org>; Wed, 13 Aug 2025 14:12:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8248210E734;
	Wed, 13 Aug 2025 14:12:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IPJWRVeJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5825410E734
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Aug 2025 14:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755094344; x=1786630344;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5orVxLJWR1wZF4KL7VDTxS/gUcYoy3AJ/pwm7QsSn8M=;
 b=IPJWRVeJosM6DveAYbCxEwEr3CxfQHhEtiJgzveETZI9dxXcVZE3oWAN
 H5b+g6QHUpB1u18U/lQ8O5bP4g59X2Kgdh5ZvuMH1twl6FpsxvvJr9iwM
 O+VUhOA6MzoCZTZKWJOHwKtJ455DWQHtKhEFj3XdkaIqVzchvb3LZNSIJ
 c40EjKsNRgIyo2Jjk7XOZerybpWGG4Bxwtq62I3p8ma41kq72Hq/zjYkn
 vCVdqPLqDdIqaVH8qKzWC2kv6p4tsaXz58JhIXhQ94UALDv2IQUZdTPYi
 Twk4aqXqh59fMmLH5WMFg342/PpZtFwgaEOV5Xavsn/YJ8qNvNlyshvF2 Q==;
X-CSE-ConnectionGUID: dlNsLH5JSbuJh6ojNoU7ZA==
X-CSE-MsgGUID: /QNf4nbKT72AOPd3PD2rKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="67993007"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="67993007"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 07:12:20 -0700
X-CSE-ConnectionGUID: Be2JeD5gQJ6JXPHPoWQTww==
X-CSE-MsgGUID: 1sL9n2RmQsOWZzI+wYaH9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="166120427"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 07:12:19 -0700
Date: Wed, 13 Aug 2025 16:12:16 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 3/4] tools/intel_vbt_decode: sync intel_vbt_defs.h
 with kernel commit dac2ec8d3ba2
Message-ID: <20250813141216.sdgsqacssdreates@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org
References: <cover.1754916577.git.jani.nikula@intel.com>
 <70a2d775f5b41ec5edb5d3cf3d4f433d56fbc503.1754916577.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <70a2d775f5b41ec5edb5d3cf3d4f433d56fbc503.1754916577.git.jani.nikula@intel.com>
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
On 2025-08-11 at 15:50:25 +0300, Jani Nikula wrote:

please change subject, for example into:

Subject: Re: [PATCH i-g-t 3/4] tools/intel_vbt_decode: Update eDP power suquence

> Synchronize intel_vbt_defs.h with kernel commit:
> 
> dac2ec8d3ba2 ("drm/i915/pps: Decouple pps delays from VBT struct definition")
> 
> Modify the tool accordingly.

Write here that struct edp_power_seq was moved from intel_bios.h
into more appropriate header.

With this
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

PS. same here, no need for resend, could be done at merge time.

> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  tools/intel_bios.h       | 8 --------
>  tools/intel_vbt_decode.c | 8 ++++----
>  tools/intel_vbt_defs.h   | 8 ++++++++
>  3 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/tools/intel_bios.h b/tools/intel_bios.h
> index fdc3308f3d38..01de2246e147 100644
> --- a/tools/intel_bios.h
> +++ b/tools/intel_bios.h
> @@ -44,14 +44,6 @@ struct bdb_legacy_child_devices {
>  #define BDB_DRIVER_SDVO_LVDS	2
>  #define BDB_DRIVER_EDP		3
>  
> -struct edp_power_seq {
> -	uint16_t t3;
> -	uint16_t t7;
> -	uint16_t t9;
> -	uint16_t t10;
> -	uint16_t t12;
> -} __attribute__ ((packed));
> -
>  /* Block 52 contains MiPi Panel info
>   * 6 such enteries will there. Index into correct
>   * entery is based on the panel_index in #40 LFP
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index 85a160e08b44..7bb3c19c3340 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -2367,12 +2367,12 @@ static void dump_edp(struct context *context,
>  
>  		printf("\tPanel %d%s\n", i, panel_str(context, i));
>  
> -		printf("\t\tPower Sequence: T3 %d T7 %d T9 %d T10 %d T12 %d\n",
> -		       edp->power_seqs[i].t3,
> -		       edp->power_seqs[i].t7,
> +		printf("\t\tPower Sequence: T1-T3 %d T8 %d T9 %d T10 %d T11-T12 %d\n",
> +		       edp->power_seqs[i].t1_t3,
> +		       edp->power_seqs[i].t8,
>  		       edp->power_seqs[i].t9,
>  		       edp->power_seqs[i].t10,
> -		       edp->power_seqs[i].t12);
> +		       edp->power_seqs[i].t11_t12);
>  
>  		bpp = panel_bits(edp->color_depth, i, 2);
>  
> diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
> index 42022756bbd5..e9b809568cd4 100644
> --- a/tools/intel_vbt_defs.h
> +++ b/tools/intel_vbt_defs.h
> @@ -1014,6 +1014,14 @@ struct bdb_tv_options {
>   * Block 27 - eDP VBT Block
>   */
>  
> +struct edp_power_seq {
> +	u16 t1_t3;
> +	u16 t8;
> +	u16 t9;
> +	u16 t10;
> +	u16 t11_t12;
> +} __packed;
> +
>  #define EDP_18BPP	0
>  #define EDP_24BPP	1
>  #define EDP_30BPP	2
> -- 
> 2.47.2
> 
