Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE333CD98CE
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jun 2026 16:07:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A36C10EA75;
	Fri, 12 Jun 2026 16:07:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gMWAREjg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6B210EA75
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jun 2026 16:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781280435; x=1812816435;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AYUtTb2nsBHgoqXxzGB7GMKHjyKtfxX5mfA3JljSBWg=;
 b=gMWAREjg8QP1nwQQwsKs0muiJEr4x1t8X9N4VaNe9btYb2rm2JR+zPHL
 QsSdkqFY58Jt6vewjjDHSRke2s3lGMOqljE5AjcaKyW9fEoWI8KtpUUlv
 uKFrlBzpPGWf0dQU5+3Q5lc0ZQ7HkgOsgzpC/AOwb1emV0Eo6crh26gQ+
 OgbEujr1021zaWHg0Szehb4vOhGA81GkrTuPULObZb9AOnO81c6B4Jwas
 qovBTwSMfZ1W7ljkuFlNsfztCqFf5qclwHvlRMxZ+vPVIRfiP3rXDTPtL
 9lPF1MkQRwOTo3kkMfQx4Bqbg9Eg16OIP3HUog54+6jsRy36WOPjuTVic Q==;
X-CSE-ConnectionGUID: XPIDHANxQ2S3jT2LTIcYdw==
X-CSE-MsgGUID: 60c1CpCsRBCJLoI8YEe6Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="92790119"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="92790119"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 09:07:15 -0700
X-CSE-ConnectionGUID: rFlcGB6ASrW8WD5F9PFU0w==
X-CSE-MsgGUID: IBHjW8xrSeu8KbajJ4130g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="240505936"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 09:07:13 -0700
Date: Fri, 12 Jun 2026 18:06:57 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>,
 janusz.krzysztofik@linux.intel.com, lukasz.laguna@intel.com
Subject: Re: [PATCH i-g-t] lib/intel_chipset: Extend intel_get_pci_device to
 PCI accelerator class
Message-ID: <20260612160657.c6v7wziphesemzr7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>,
 janusz.krzysztofik@linux.intel.com, lukasz.laguna@intel.com
References: <20260611202801.3945761-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260611202801.3945761-1-ashutosh.dixit@intel.com>
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

Hi Ashutosh,
On 2026-06-11 at 13:28:01 -0700, Ashutosh Dixit wrote:
> In addition to PCI display class devices, Intel devices can also be PCI
> accelerator class devices. Extend intel_get_pci_device() to also find these
> devices.
> 

Could you create a new function for it? Which tools need it?

intel_get_pci_device(void) should stay as is, then add

intel_get_pci_device_by_class(uint8 class) - not sure about name

then with new functionality:

intel_get_pci_device_gpu(void)
intel_get_pci_device_accel(void)
intel_get_pci_device_gpu_or_accel(void)

Then any tool which will require it could be migrated to using
this new function.

Regards,
Kamil

> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  lib/intel_chipset.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/intel_chipset.c b/lib/intel_chipset.c
> index 760faede24..3265fa778b 100644
> --- a/lib/intel_chipset.c
> +++ b/lib/intel_chipset.c
> @@ -86,20 +86,21 @@ intel_get_pci_device(void)
>  	pci_dev = pci_device_find_by_slot(0, 0, 2, 0);
>  	if (pci_dev == NULL || pci_dev->vendor_id != 0x8086) {
>  		struct pci_device_iterator *iter;
> -		struct pci_id_match match;
> +		struct pci_id_match match = {};
>  
>  		match.vendor_id = 0x8086; /* Intel */
>  		match.device_id = PCI_MATCH_ANY;
>  		match.subvendor_id = PCI_MATCH_ANY;
>  		match.subdevice_id = PCI_MATCH_ANY;
>  
> -		match.device_class = 0x3 << 16;
> -		match.device_class_mask = 0xff << 16;
> -
> -		match.match_data = 0;
> -
>  		iter = pci_id_match_iterator_create(&match);
> -		pci_dev = pci_device_next(iter);
> +		while ((pci_dev = pci_device_next(iter))) {
> +			uint8_t device_class = (pci_dev->device_class >> 16) & 0xff;
> +
> +			/* PCI display (0x03) or accelerator (0x12) class devices */
> +			if (device_class == 0x03 || device_class == 0x12)
> +				break;
> +		}
>  		pci_iterator_destroy(iter);
>  	}
>  	igt_require_f(pci_dev, "Couldn't find Intel graphics card\n");
> -- 
> 2.54.0
> 
