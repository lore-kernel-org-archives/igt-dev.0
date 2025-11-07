Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56B4CCFA05
	for <igt-dev@archiver.kernel.org>; Fri,  7 Nov 2025 13:48:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7646010EACA;
	Fri,  7 Nov 2025 13:48:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TLJA2Qax";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1132310EACA
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Nov 2025 13:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762523291; x=1794059291;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ayuC9Rl4+OZPaVVVrBEUc/yakO84juHM5nN/NDsXal8=;
 b=TLJA2QaxDX6cZmPtOPtdUNgxDkMAg7apW/XfnbbcCdHN8Q8xjP84aQvC
 ejjkMrB/dlIIm+jiG26uZphmbJkb9s3TmfVeVSyrqa7vpLs4FH7u1faSA
 0bP3HdBPmQu/qLCDSt58aSnK0eg5bFdYHztj7QVY7hqiwbfpftBUbVXOe
 u98gCZ5KUPa9TbwT8jWF5mnA/xZoQVM0zzxkM/Orw0m9+0T1n8liMUvbe
 I1KkVnmPw5OT3OfrznxF5wm7a/0Zyul7u+hYm+uCW7/e/Ti1z6wf43IIO
 otKsvyIsGOnbokZavI+dJa6I8PpV0D6GrZihHVNpCeOdel5WdLX4EXPLj Q==;
X-CSE-ConnectionGUID: btsz9r4FSpC9PqxQkJmO6w==
X-CSE-MsgGUID: uX26w+wnSP+lXqajyS1d4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="64554240"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="64554240"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 05:48:10 -0800
X-CSE-ConnectionGUID: 98hK9oiQSCCadKRUcAmWSA==
X-CSE-MsgGUID: hgisbhVhTkOPYIJ4gyYoAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="187882801"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 05:48:09 -0800
Date: Fri, 7 Nov 2025 14:48:07 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
Cc: igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 balasubramani.vivekanandan@intel.com
Subject: Re: [PATCH i-g-t v3 2/3] lib: Add Crescent Island Support
Message-ID: <20251107134807.xq3f75x6hklgugke@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 balasubramani.vivekanandan@intel.com
References: <20251107115040.1756713-1-shekhar.chauhan@intel.com>
 <20251107115040.1756713-3-shekhar.chauhan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251107115040.1756713-3-shekhar.chauhan@intel.com>
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
On 2025-11-07 at 17:20:39 +0530, Shekhar Chauhan wrote:
> From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> 
> Add device info for Crescent Island (CRI).
> 
> v2: Fix indentation/spacing for CrescentIsland in lib/intel_chipset.h
> (Kamil)
> v3: Add has_oam and is_crescentisland flags (Ashutosh)
> 
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/intel_chipset.h     |  2 ++
>  lib/intel_device_info.c | 12 ++++++++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> index 70ea78464..7739f4a84 100644
> --- a/lib/intel_chipset.h
> +++ b/lib/intel_chipset.h
> @@ -94,6 +94,7 @@ struct intel_device_info {
>  	bool is_battlemage : 1;
>  	bool is_pantherlake : 1;
>  	bool is_novalake: 1;
> +	bool is_crescentisland: 1;
>  
>  	const struct intel_cmds_info *cmds_info;
>  	const char *codename;
> @@ -212,6 +213,7 @@ void intel_check_pch(void);
>  #define IS_BATTLEMAGE(devid)	(intel_get_device_info(devid)->is_battlemage)
>  #define IS_PANTHERLAKE(devid)	(intel_get_device_info(devid)->is_pantherlake)
>  #define IS_NOVALAKE(devid)	(intel_get_device_info(devid)->is_novalake)
> +#define IS_CRESCENTISLAND(devid)	(intel_get_device_info(devid)->is_crescentisland)
>  
>  #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
>  
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index fe452d50f..22f19bddf 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -549,6 +549,16 @@ static const struct intel_device_info intel_novalake_info = {
>  	.cmds_info = &xe2_cmds_info,
>  };
>  
> +static const struct intel_device_info intel_crescentisland_info = {
> +	.graphics_ver = 35,
> +	.graphics_rel = 11,
> +	.display_ver = 0,
> +	.has_oam = true,
> +	.is_crescentisland = true,
> +	.codename = "crescentisland",
> +	.cmds_info = &xe2_cmds_info,
> +};
> +
>  #define INTEL_PCI_ID_INIT(_id, _info) { \
>  	.vendor_id = 0x8086, .device_id = (_id), \
>  	.subvendor_id = PCI_MATCH_ANY, .subdevice_id = PCI_MATCH_ANY, \
> @@ -669,6 +679,8 @@ static const struct pci_id_match intel_device_match[] = {
>  
>  	INTEL_NVLS_IDS(INTEL_PCI_ID_INIT, &intel_novalake_info),
>  
> +	INTEL_CRI_IDS(INTEL_PCI_ID_INIT, &intel_crescentisland_info),
> +
>  	INTEL_PCI_ID_INIT(PCI_MATCH_ANY, &intel_generic_info),
>  };
>  
> -- 
> 2.51.1
> 
