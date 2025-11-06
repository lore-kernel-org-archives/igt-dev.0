Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B18ECCFA03
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 11:23:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D475310E8A3;
	Thu,  6 Nov 2025 11:23:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i7PEqwJj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9331A10E8A3
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 11:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762428218; x=1793964218;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=L4lNUVKcmO5Eql/dGajtp+Gyd5vO3CKNyeY4d93/XjQ=;
 b=i7PEqwJj4dEyOcIUF9+weq6Q6NAneqNro8hR9Ba4FgHTDnwrADdC2jeT
 nTAK/kN9/eRVJwqzhkFoz3tZMKjlcXeM3T0SUImn1rWhxZsD8a2eayiqn
 3xQ4CFHl2E/G6tr0i0sEnTbCh+5JnrIN46+IPOQuSxzhSEDYbjq+M3OOZ
 b2Z+PJHlgQb5cz9ZFmL8axGDXZPfIMRbFAtd5+rzpQcJi+doikljc1Ilt
 LUdTlpLyBLcauGxXrTokgLmS86Zppa+/4joPVfJXOki91qg9kCpCCR7th
 wNJz2EbPTzq+t4hzxHpmIgkiqNX6sDUE2ghELxCedfx0YI9RaehubXkJp w==;
X-CSE-ConnectionGUID: i/MpRcpXRYeBWuS7PXNTWg==
X-CSE-MsgGUID: gx6pl7XHRQqYV/lNPgjeUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64596861"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="64596861"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 03:23:38 -0800
X-CSE-ConnectionGUID: p7+wrawwRz2NtBjc2V4rFQ==
X-CSE-MsgGUID: +GGnNrn2S+q19ben1jx21Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="188013994"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 03:23:37 -0800
Date: Thu, 6 Nov 2025 12:23:20 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
Cc: igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 balasubramani.vivekanandan@intel.com
Subject: Re: [PATCH i-g-t v1 1/3] lib: Add NVL-S support
Message-ID: <20251106112320.33tckcnzmznxqwqc@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 balasubramani.vivekanandan@intel.com
References: <20251106053425.1731151-1-shekhar.chauhan@intel.com>
 <20251106053425.1731151-2-shekhar.chauhan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251106053425.1731151-2-shekhar.chauhan@intel.com>
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
On 2025-11-06 at 11:04:23 +0530, Shekhar Chauhan wrote:
> Add NVL-S device info.
> 
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> ---
>  lib/intel_chipset.h     |  2 ++
>  lib/intel_device_info.c | 12 ++++++++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> index 2f6bf788a..93275eac9 100644
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
> @@ -210,6 +211,7 @@ void intel_check_pch(void);
>  #define IS_LUNARLAKE(devid)	(intel_get_device_info(devid)->is_lunarlake)
>  #define IS_BATTLEMAGE(devid)	(intel_get_device_info(devid)->is_battlemage)
>  #define IS_PANTHERLAKE(devid)  (intel_get_device_info(devid)->is_pantherlake)
> +#define IS_NOVALAKE(devid)  (intel_get_device_info(devid)->is_novalake)
---------------------------- ^
This should be one tab, not spaces. While at this please also
correct IS_PANTHERLAKE() in line above, replace spaces with
one tab.

Rest looks ok.

Regards,
Kamil

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
