Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED09CCF9F8
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 16:21:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E4E10E94A;
	Thu,  6 Nov 2025 16:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m0HygZGW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2365F10E94A
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 16:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762446079; x=1793982079;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=y/6K0krtNr94jzomI6hps6F26Ms+eh0c+tqFISjfPIU=;
 b=m0HygZGWnJmVBZNMk/erXVp/P5+DzJwu6FUhp7qD+p0OtG6jSgtvP9fK
 s7GWyQ407TaKbz7fivlKtbTkhiOp6c6Rv8RxPFiO9SsiZIHNFuAwMYejl
 GCyst3DqZFl6ZPyPOOaiqMEFUMBfvUKwzT55Dc4Ea/LDc1RK3Iv8ixlyW
 pwnDugW3iFzh+BLo298Ahi02WPBE58j/A1qwcs82vIheQHs4SpOmO6v79
 n9JTJ0uBm7dmjNn4QwYMG8AqJV1YunmLhJD5OSA2kR6PM6jIcHQ3U81dN
 j1R5Pkumv+NJfKfo6iOKtGCGVi5AU/QVz7iHtnBj9NVW6eYkEubti0Jtn w==;
X-CSE-ConnectionGUID: vQWZpwTaTC+ZKN1UpvcfeQ==
X-CSE-MsgGUID: BoNp6QxDST2rIo2p2jlniQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="87217771"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="87217771"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 08:21:19 -0800
X-CSE-ConnectionGUID: HKjvWK3JSEmA3nqlPw8OZw==
X-CSE-MsgGUID: BuXPynL9Sequl+3PSWnOOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="191893979"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:21:17 -0800
Date: Thu, 6 Nov 2025 17:20:37 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
Cc: igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 balasubramani.vivekanandan@intel.com
Subject: Re: [PATCH i-g-t v2 1/3] lib: Add NVL-S support
Message-ID: <20251106162037.pyjsqzmryxtrigeb@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 balasubramani.vivekanandan@intel.com
References: <20251106153419.1741989-1-shekhar.chauhan@intel.com>
 <20251106153419.1741989-2-shekhar.chauhan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251106153419.1741989-2-shekhar.chauhan@intel.com>
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
On 2025-11-06 at 21:04:17 +0530, Shekhar Chauhan wrote:
> Add NVL-S device info.
> 
> v2: Fix indentation/spacing for PantherLake and Novalake in
> lib/intel_chipset.h (Kamil)
> 
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

For all patches in this series
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/intel_chipset.h     |  4 +++-
>  lib/intel_device_info.c | 12 ++++++++++++
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> index 2f6bf788a..70ea78464 100644
> --- a/lib/intel_chipset.h
> +++ b/lib/intel_chipset.h
> @@ -93,6 +93,7 @@ struct intel_device_info {
>  	bool is_lunarlake : 1;
>  	bool is_battlemage : 1;
>  	bool is_pantherlake : 1;
> +	bool is_novalake: 1;
>  
>  	const struct intel_cmds_info *cmds_info;
>  	const char *codename;
> @@ -209,7 +210,8 @@ void intel_check_pch(void);
>  #define IS_PONTEVECCHIO(devid)	(intel_get_device_info(devid)->is_pontevecchio)
>  #define IS_LUNARLAKE(devid)	(intel_get_device_info(devid)->is_lunarlake)
>  #define IS_BATTLEMAGE(devid)	(intel_get_device_info(devid)->is_battlemage)
> -#define IS_PANTHERLAKE(devid)  (intel_get_device_info(devid)->is_pantherlake)
> +#define IS_PANTHERLAKE(devid)	(intel_get_device_info(devid)->is_pantherlake)
> +#define IS_NOVALAKE(devid)	(intel_get_device_info(devid)->is_novalake)
>  
>  #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
>  
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index a853f9ab4..fe452d50f 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -539,6 +539,16 @@ static const struct intel_device_info intel_pantherlake_info = {
>  	.cmds_info = &xe2_cmds_info,
>  };
>  
> +static const struct intel_device_info intel_novalake_info = {
> +	.graphics_ver = 30,
> +	.graphics_rel = 04,
> +	.display_ver = 35,
> +	.has_4tile = true,
> +	.is_novalake = true,
> +	.codename = "novalake",
> +	.cmds_info = &xe2_cmds_info,
> +};
> +
>  #define INTEL_PCI_ID_INIT(_id, _info) { \
>  	.vendor_id = 0x8086, .device_id = (_id), \
>  	.subvendor_id = PCI_MATCH_ANY, .subdevice_id = PCI_MATCH_ANY, \
> @@ -657,6 +667,8 @@ static const struct pci_id_match intel_device_match[] = {
>  
>  	INTEL_PTL_IDS(INTEL_PCI_ID_INIT, &intel_pantherlake_info),
>  
> +	INTEL_NVLS_IDS(INTEL_PCI_ID_INIT, &intel_novalake_info),
> +
>  	INTEL_PCI_ID_INIT(PCI_MATCH_ANY, &intel_generic_info),
>  };
>  
> -- 
> 2.51.1
> 
