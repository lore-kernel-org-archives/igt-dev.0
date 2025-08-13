Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F83C87FCF
	for <igt-dev@archiver.kernel.org>; Wed, 13 Aug 2025 14:05:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF6510E731;
	Wed, 13 Aug 2025 14:05:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GG8MGz2e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DCFA10E731
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Aug 2025 14:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755093943; x=1786629943;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=80PUiRhJZW/r33KTBKCzhbCj4PdwqNFwD91X1RZavb4=;
 b=GG8MGz2e7dQQY+LoF4PQyaQhbrw3dFmUMjMk6pU8TsnAWsjqqZB038OG
 CLRNJ0lqivrQPtzsMcujVYEJeLH6r/G7eUpi/OoH5e/752hMyVJEdMwJP
 1GzvnV2KfdniUXuCmjl/nJWe52aEzlWzO2ci+IF+a67PBFaQDTfSbrdqO
 K/2gAe4X0ZAROuhDVcDoNBuLWgnJ1EGq5OdyH7ooDOr9aYP2cI1zdAKn3
 BGYsumR6ICZ62rtNlKDgDH0rs4QcCQEid+/hdPx4NYTaZ9HEXNj3K8FzB
 Yg54hjjPvzBevnpVGuRC0gJssWV6ZZ0jyjwdUBy6gUgsFMPpXQosBFE/r Q==;
X-CSE-ConnectionGUID: EOCNlCbQTNWWKYl+zMpsEA==
X-CSE-MsgGUID: Bh0U5Cv2SNqF3P1VJ6Lm9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68764281"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="68764281"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 07:05:36 -0700
X-CSE-ConnectionGUID: AVbRBqpvRK+14f8YzuO1nA==
X-CSE-MsgGUID: +u3mFesZTFajBmhI8LfeJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="171806083"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 07:05:35 -0700
Date: Wed, 13 Aug 2025 16:05:32 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/4] tools/intel_vbt_decode: sync intel_vbt_defs.h
 with kernel commit 70c33a2710cd
Message-ID: <20250813140532.wvlyvh5supxyxfpo@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org
References: <cover.1754916577.git.jani.nikula@intel.com>
 <983d3adaab5169aa196a3cf0519e0b3b6013b186.1754916577.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <983d3adaab5169aa196a3cf0519e0b3b6013b186.1754916577.git.jani.nikula@intel.com>
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
On 2025-08-11 at 15:50:24 +0300, Jani Nikula wrote:

please change subject for example into:

[PATCH i-g-t 2/4] tools/intel_vbt_decode: Update entries in VBT BDB

This could be done without resend (also for patch 1 and others in this series)
when merging, with this:

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> Synchronize intel_vbt_defs.h with kernel commit:
> 
> 70c33a2710cd ("drm/i915/bios: Update new entries in VBT BDB block definitions")
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  tools/intel_vbt_defs.h | 37 +++++++++++++++++++++++++++++++------
>  1 file changed, 31 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
> index e613288937e4..42022756bbd5 100644
> --- a/tools/intel_vbt_defs.h
> +++ b/tools/intel_vbt_defs.h
> @@ -1080,6 +1080,8 @@ struct bdb_edp {
>  	u16 edp_fast_link_training_rate[16];			/* 224+ */
>  	u16 edp_max_port_link_rate[16];				/* 244+ */
>  	u16 edp_dsc_disable;					/* 251+ */
> +	u16 t6_delay_support;					/* 260+ */
> +	u16 link_idle_time[16];					/* 260+ */
>  } __packed;
>  
>  /*
> @@ -1321,7 +1323,7 @@ struct als_data_entry {
>  } __packed;
>  
>  struct aggressiveness_profile_entry {
> -	u8 dpst_aggressiveness : 4;
> +	u8 dpst_aggressiveness : 4;		/* (228/252)-256 */
>  	u8 lace_aggressiveness : 4;
>  } __packed;
>  
> @@ -1330,12 +1332,27 @@ struct aggressiveness_profile2_entry {
>  	u8 elp_aggressiveness : 4;
>  } __packed;
>  
> +struct aggressiveness_profile3_entry {
> +	u8 apd_aggressiveness:4;
> +	u8 pixoptix_aggressiveness:4;
> +} __packed;
> +
> +struct aggressiveness_profile4_entry {
> +	u8 xpst_aggressiveness:4;
> +	u8 tcon_aggressiveness:4;
> +} __packed;
> +
> +struct panel_identification {
> +	u8 panel_technology:4;
> +	u8 reserved:4;
> +} __packed;
> +
>  struct bdb_lfp_power {
>  	struct lfp_power_features features;				/* ???-227 */
>  	struct als_data_entry als[5];
>  	u8 lace_aggressiveness_profile:3;				/* 210-227 */
>  	u8 reserved1:5;
> -	u16 dpst;							/* 228+ */
> +	u16 dpst;							/* 228-256 */
>  	u16 psr;							/* 228+ */
>  	u16 drrs;							/* 228+ */
>  	u16 lace_support;						/* 228+ */
> @@ -1343,12 +1360,20 @@ struct bdb_lfp_power {
>  	u16 dmrrs;							/* 228+ */
>  	u16 adb;							/* 228+ */
>  	u16 lace_enabled_status;					/* 228+ */
> -	struct aggressiveness_profile_entry aggressiveness[16];		/* 228+ */
> +	struct aggressiveness_profile_entry aggressiveness[16];
>  	u16 hobl;							/* 232+ */
>  	u16 vrr_feature_enabled;					/* 233+ */
> -	u16 elp;							/* 247+ */
> -	u16 opst;							/* 247+ */
> -	struct aggressiveness_profile2_entry aggressiveness2[16];	/* 247+ */
> +	u16 elp;							/* 247-256 */
> +	u16 opst;							/* 247-256 */
> +	struct aggressiveness_profile2_entry aggressiveness2[16];	/* 247-256 */
> +	u16 apd;							/* 253-256 */
> +	u16 pixoptix;							/* 253-256 */
> +	struct aggressiveness_profile3_entry aggressiveness3[16];	/* 253-256 */
> +	struct panel_identification panel_identification[16];		/* 257+ */
> +	u16 xpst_support;						/* 257+ */
> +	u16 tcon_based_backlight_optimization;				/* 257+ */
> +	struct aggressiveness_profile4_entry aggressiveness4[16];	/* 257+ */
> +	u16 tcon_backlight_xpst_coexistence;				/* 257+ */
>  } __packed;
>  
>  /*
> -- 
> 2.47.2
> 
