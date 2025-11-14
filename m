Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796EBCE8D47
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 15:35:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB0810EAAF;
	Fri, 14 Nov 2025 15:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KmHR5jh0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B03D310EAAF
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Nov 2025 15:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763134534; x=1794670534;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=U6kHaNlq0LFfEQW+ZM0tTCJ/y4rxqScogIMQpvuNguI=;
 b=KmHR5jh0bP5bzZ3jNUsfRiZBituUFXWjJQ9PnoN/dlw0MjHI2QNpz3C5
 0YpqNa92agIVDEeDt2hVc9599l/xR0Nva2b5KkOHpBOUusWxcPw2rijlC
 5bS9BT45d4zAqCGVWEMaHrIgkAkCve1TuDgbQfcRFrTIC3JcjkBX8Be5T
 KzrbYgaJuut+d/rHNokB8TurhDt7AS3VnPASxkTntzkD7BqTD7NwRp9U6
 3yfqnIhuBHxz9ba7wmZNgS55XOqsjvlHwuKPA+WnLWhcAy84ndeLzwpXu
 u16UmGfIdW8cIPInzEwA8EtKGxd3xa6AEsmmLmtb+VBOH8gp1P7+f0OXh w==;
X-CSE-ConnectionGUID: 8QRTB/xjTx6xDWnbMZP4eA==
X-CSE-MsgGUID: wI2WaQCLRf6gXoKm2oy3ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="76576701"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="76576701"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 07:35:31 -0800
X-CSE-ConnectionGUID: BVrN6sosSdmyfB5/pUN/Pw==
X-CSE-MsgGUID: 5kyW2UfUQ7Gsq8+oqVN3YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="220678887"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 07:35:30 -0800
Date: Fri, 14 Nov 2025 16:35:28 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
Cc: igt-dev@lists.freedesktop.org, ashutosh.dixit@intel.com
Subject: Re: [PATCH] lib: Replace NVL with NVL-S
Message-ID: <20251114153528.7b3dusuru2fx4quf@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 igt-dev@lists.freedesktop.org, ashutosh.dixit@intel.com
References: <20251114062042.1853554-1-shekhar.chauhan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251114062042.1853554-1-shekhar.chauhan@intel.com>
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

Hi Shekhar,
On 2025-11-14 at 11:50:42 +0530, Shekhar Chauhan wrote:
> Fix NVL-S' definition, by replacing Novalake with Novalake-S.

Remove \' char after S.

> 
> Fixes: 480fa21b8 lib: Add NVL-S support

This should follow convention: 12+ chars for hash and ("title"),
here:

Fixes: 480fa21b82c2 ("lib: Add NVL-S support")
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

With above fixed this is
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  lib/intel_chipset.h     | 4 ++--
>  lib/intel_device_info.c | 8 ++++----
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> index 7739f4a84..cc2225110 100644
> --- a/lib/intel_chipset.h
> +++ b/lib/intel_chipset.h
> @@ -93,7 +93,7 @@ struct intel_device_info {
>  	bool is_lunarlake : 1;
>  	bool is_battlemage : 1;
>  	bool is_pantherlake : 1;
> -	bool is_novalake: 1;
> +	bool is_novalake_s: 1;
>  	bool is_crescentisland: 1;
>  
>  	const struct intel_cmds_info *cmds_info;
> @@ -212,7 +212,7 @@ void intel_check_pch(void);
>  #define IS_LUNARLAKE(devid)	(intel_get_device_info(devid)->is_lunarlake)
>  #define IS_BATTLEMAGE(devid)	(intel_get_device_info(devid)->is_battlemage)
>  #define IS_PANTHERLAKE(devid)	(intel_get_device_info(devid)->is_pantherlake)
> -#define IS_NOVALAKE(devid)	(intel_get_device_info(devid)->is_novalake)
> +#define IS_NOVALAKE_S(devid)	(intel_get_device_info(devid)->is_novalake_s)
>  #define IS_CRESCENTISLAND(devid)	(intel_get_device_info(devid)->is_crescentisland)
>  
>  #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index d33bf39d4..20147479a 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -539,14 +539,14 @@ static const struct intel_device_info intel_pantherlake_info = {
>  	.cmds_info = &xe2_cmds_info,
>  };
>  
> -static const struct intel_device_info intel_novalake_info = {
> +static const struct intel_device_info intel_novalake_s_info = {
>  	.graphics_ver = 30,
>  	.graphics_rel = 04,
>  	.display_ver = 35,
>  	.has_4tile = true,
>  	.has_oam = true,
> -	.is_novalake = true,
> -	.codename = "novalake",
> +	.is_novalake_s = true,
> +	.codename = "novalake_s",
>  	.cmds_info = &xe2_cmds_info,
>  };
>  
> @@ -678,7 +678,7 @@ static const struct pci_id_match intel_device_match[] = {
>  
>  	INTEL_PTL_IDS(INTEL_PCI_ID_INIT, &intel_pantherlake_info),
>  
> -	INTEL_NVLS_IDS(INTEL_PCI_ID_INIT, &intel_novalake_info),
> +	INTEL_NVLS_IDS(INTEL_PCI_ID_INIT, &intel_novalake_s_info),
>  
>  	INTEL_CRI_IDS(INTEL_PCI_ID_INIT, &intel_crescentisland_info),
>  
> -- 
> 2.51.1
> 
