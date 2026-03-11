Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B0551125806
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 13:17:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A327A10E23C;
	Wed, 11 Mar 2026 13:17:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AEmWDS8E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 043B510E23C
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 13:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773235035; x=1804771035;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sV8J6mYStLhF+P/T6B2k/4XVI0QIh0DPM3HrLTO2Zcs=;
 b=AEmWDS8EIHW5UkNIwxwjTLwUn3ObJO+9x3cOkSWuU1tJsdwaH4MSqLOB
 PM2tIUcy06qQB8Ib/8+o9bsb9PxBobbKvZoSWFofez2FolCQgWRPnUcRp
 ihregRalSEZ/R71SI5sqx4os9Pxo519qT73sxUQfpx5E79unUoDFgJVUk
 9YnXauNkMgGH3SWOG3ERYpm8bbLZJuwQnrD/RMJweVOIoh3QKiWXr9PuZ
 ic+BzZ/pTt4yNEsfs625ogg1WYxw9Zgs4e+ufDRVPpZ4+1xusU/BSpS0B
 TWO/CJPaqC+JJEZU9HFDLT+boE0QJsagJnk5mcIU5DU3568UfVPt2mo0Q w==;
X-CSE-ConnectionGUID: BgNtMxt5QY6Wzm+kcbjN9Q==
X-CSE-MsgGUID: me4CJvKUTjuXj3wL/HWLtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="77906472"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="77906472"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 06:17:14 -0700
X-CSE-ConnectionGUID: JAbfA8hkSN200uURMO7sBw==
X-CSE-MsgGUID: L12SapKAT5mCOCSC/SzFfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="250963260"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 06:17:14 -0700
Date: Wed, 11 Mar 2026 14:17:11 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: himanshu.girotra@intel.com
Cc: kamil.konieczny@intel.com, shekhar.chauhan@intel.com,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH v2 i-g-t 3/3] lib: Add WildcatLake support
Message-ID: <20260311131711.gntc2nuwjnld6tif@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 himanshu.girotra@intel.com, kamil.konieczny@intel.com,
 shekhar.chauhan@intel.com, igt-dev@lists.freedesktop.org
References: <20260311073430.17421-1-himanshu.girotra@intel.com>
 <20260311073430.17421-4-himanshu.girotra@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260311073430.17421-4-himanshu.girotra@intel.com>
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

Hi himanshu.girotra,
On 2026-03-11 at 13:04:30 +0530, himanshu.girotra@intel.com wrote:
> From: Himanshu Girotra <himanshu.girotra@intel.com>
> 
> WildcatLake was previously consumed under INTEL_PTL_IDS but now
> has dedicated PCI IDs following kernel commit 32620e176443
> ("drm/pcids: Split PTL pciids group to make wcl subplatform").
> 
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  lib/intel_chipset.h     |  2 ++
>  lib/intel_device_info.c | 13 +++++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> index 5df7349df..3fcc5b18d 100644
> --- a/lib/intel_chipset.h
> +++ b/lib/intel_chipset.h
> @@ -93,6 +93,7 @@ struct intel_device_info {
>  	bool is_lunarlake : 1;
>  	bool is_battlemage : 1;
>  	bool is_pantherlake : 1;
> +	bool is_wildcatlake : 1;
>  	bool is_novalake_s: 1;
>  	bool is_novalake_p : 1;
>  	bool is_crescentisland: 1;
> @@ -213,6 +214,7 @@ void intel_check_pch(void);
>  #define IS_LUNARLAKE(devid)	(intel_get_device_info(devid)->is_lunarlake)
>  #define IS_BATTLEMAGE(devid)	(intel_get_device_info(devid)->is_battlemage)
>  #define IS_PANTHERLAKE(devid)	(intel_get_device_info(devid)->is_pantherlake)
> +#define IS_WILDCATLAKE(devid)	(intel_get_device_info(devid)->is_wildcatlake)
>  #define IS_NOVALAKE_S(devid)	(intel_get_device_info(devid)->is_novalake_s)
>  #define IS_NOVALAKE_P(devid)	(intel_get_device_info(devid)->is_novalake_p)
>  #define IS_CRESCENTISLAND(devid)	(intel_get_device_info(devid)->is_crescentisland)
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index b44b24223..da0b9f398 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -539,6 +539,18 @@ static const struct intel_device_info intel_pantherlake_info = {
>  	.cmds_info = &xe2_cmds_info,
>  };
>  
> +static const struct intel_device_info intel_wildcatlake_info = {
> +	.graphics_ver = 30,
> +	.graphics_rel = 3,
> +	.display_ver = 30,
> +	.has_4tile = true,
> +	.has_flatccs = true,
> +	.has_oam = true,
> +	.is_wildcatlake = true,
> +	.codename = "wildcatlake",
> +	.cmds_info = &xe2_cmds_info,
> +};
> +
>  static const struct intel_device_info intel_novalake_s_info = {
>  	.graphics_ver = 30,
>  	.graphics_rel = 04,
> @@ -690,6 +702,7 @@ static const struct pci_id_match intel_device_match[] = {
>  	INTEL_BMG_IDS(INTEL_PCI_ID_INIT, &intel_battlemage_info),
>  
>  	INTEL_PTL_IDS(INTEL_PCI_ID_INIT, &intel_pantherlake_info),
> +	INTEL_WCL_IDS(INTEL_PCI_ID_INIT, &intel_wildcatlake_info),
>  
>  	INTEL_NVLS_IDS(INTEL_PCI_ID_INIT, &intel_novalake_s_info),
>  
> -- 
> 2.50.1
> 
