Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBA0FD4F23
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 19:11:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B38F210E167;
	Tue, 10 Mar 2026 19:11:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PRtwA4dR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E97DC10E167
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 19:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773169886; x=1804705886;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jFpZX8Cqnzis6rY0cB/F7Dj3xIrVoKnhYleSLbPNUHY=;
 b=PRtwA4dRI0Xsw+/L2lLKBJTKhE8vmoFqkorxe1JJXVJ+HNH6iW/UZL7l
 +trVJDFtprN7ui5/4dKUbsBAu0FqZYeEDEOZCkCvQ1eUOK6dLMcWtcXh8
 vEaWFW+YsvommbhBqEe6AuSqobgIQlNV1G6hZ9LXGM3vZxKPzvYFdWhha
 xvxla/meJRZF5cB/Zqcq1WIeeOpdK7J5N23r+Ek+aVtdej0o8ATPW3f13
 rn1WKcHme/E1hA3uxlo/9fEMqNC48sijCNKg/aYu4UOlsx632OOyHUOPh
 pUTNc0aEflo2Nu7YIiuxGZmbQOBf0JcASluQgZ/mbdZpcDKQA3+MS68gL A==;
X-CSE-ConnectionGUID: Dsw9wruAR8CmAVEBEy9WnQ==
X-CSE-MsgGUID: GZq5mkclRPSdHh2704eg3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="96845219"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="96845219"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 12:11:25 -0700
X-CSE-ConnectionGUID: B56w9YtiQI6EZw0E8q1XBg==
X-CSE-MsgGUID: NEzLIrOmT1yfrLQEOdm83w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="224673953"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 12:11:24 -0700
Date: Tue, 10 Mar 2026 20:11:20 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: himanshu.girotra@intel.com
Cc: ramadevi.gandi@intel.com, aditya.chauhan@intel.com,
 shekhar.chauhan@intel.com, kamil.konieczny@intel.com,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/2] lib: Add NVL-P support
Message-ID: <20260310191120.cymeau47o4araw4w@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 himanshu.girotra@intel.com, ramadevi.gandi@intel.com,
 aditya.chauhan@intel.com, shekhar.chauhan@intel.com,
 kamil.konieczny@intel.com, igt-dev@lists.freedesktop.org
References: <20260310165113.8994-1-himanshu.girotra@intel.com>
 <20260310165113.8994-3-himanshu.girotra@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310165113.8994-3-himanshu.girotra@intel.com>
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
On 2026-03-10 at 22:21:13 +0530, himanshu.girotra@intel.com wrote:
> From: Himanshu Girotra <himanshu.girotra@intel.com>
> 
> Add NVL-P device info.
> 
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> ---
>  lib/intel_chipset.h     |  2 ++
>  lib/intel_device_info.c | 14 ++++++++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> index cc2225110..5df7349df 100644
> --- a/lib/intel_chipset.h
> +++ b/lib/intel_chipset.h
> @@ -94,6 +94,7 @@ struct intel_device_info {
>  	bool is_battlemage : 1;
>  	bool is_pantherlake : 1;
>  	bool is_novalake_s: 1;
> +	bool is_novalake_p : 1;
>  	bool is_crescentisland: 1;
>  
>  	const struct intel_cmds_info *cmds_info;
> @@ -213,6 +214,7 @@ void intel_check_pch(void);
>  #define IS_BATTLEMAGE(devid)	(intel_get_device_info(devid)->is_battlemage)
>  #define IS_PANTHERLAKE(devid)	(intel_get_device_info(devid)->is_pantherlake)
>  #define IS_NOVALAKE_S(devid)	(intel_get_device_info(devid)->is_novalake_s)
> +#define IS_NOVALAKE_P(devid)	(intel_get_device_info(devid)->is_novalake_p)
>  #define IS_CRESCENTISLAND(devid)	(intel_get_device_info(devid)->is_crescentisland)
>  
>  #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index 89fa6788f..b44b24223 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -551,6 +551,18 @@ static const struct intel_device_info intel_novalake_s_info = {
>  	.cmds_info = &xe2_cmds_info,
>  };
>  
> +static const struct intel_device_info intel_novalake_p_info = {
> +	.graphics_ver = 35,
> +	.graphics_rel = 10,
> +	.display_ver = 35,
> +	.has_4tile = true,
> +	.has_oam = true,
> +	.has_flatccs = true,
> +	.is_novalake_p = true,
> +	.codename = "novalake_p",
> +	.cmds_info = &xe2_cmds_info,
> +};
> +
>  static const struct intel_device_info intel_crescentisland_info = {
>  	.graphics_ver = 35,
>  	.graphics_rel = 11,
> @@ -681,6 +693,8 @@ static const struct pci_id_match intel_device_match[] = {
>  
>  	INTEL_NVLS_IDS(INTEL_PCI_ID_INIT, &intel_novalake_s_info),
>  
> +	INTEL_NVLP_IDS(INTEL_PCI_ID_INIT, &intel_novalake_p_info),
> +

imho we should also add WildcatLake, it was previously
a part of PantherLake but now is a separate pciid. Maybe in
a separate commit.

Regards,
Kamil

>  	INTEL_CRI_IDS(INTEL_PCI_ID_INIT, &intel_crescentisland_info),
>  
>  	INTEL_PCI_ID_INIT(PCI_MATCH_ANY, &intel_generic_info),
> -- 
> 2.50.1
> 
