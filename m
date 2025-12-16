Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9163D609C2
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 17:09:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB2A10E239;
	Tue, 16 Dec 2025 17:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FoHZ0b/H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9071710E239
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Dec 2025 17:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765904985; x=1797440985;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fWB8tbwCjUbGn+qMvwFooMyA8IwtQpfbs9Ky+5Gszvc=;
 b=FoHZ0b/He2GHLb//IZTsxjUhdVPAuZcCMTIbmMOcOJRjRWs+VNyuasUl
 BDD3xYX29oJk+6rKyKhKPr6+DXOu/FnOIn1T6LPFHAIUQ88x8x6iTE0BZ
 o6CW72SKRb/WM/QlaUh8mvYrToNMqoSvZE+2Sc8JvoepwdlXEdHDqHd89
 pUJkxzX7C2Y+by/gsB0HlkCaA4YDTDm3PWGLctpLbylukUqu5kiZCWFS6
 O/t9ft3xdyyy8PZzUHVc6sSEM6qDEBaD5xYn7HBwkyd8Yeck2rW5k6DFF
 cbupGPPX97yHoA24caawyINeNLcny2G6WVmyv99Y51jozQGqyoaX0eQeB g==;
X-CSE-ConnectionGUID: +VULUh3gRc2C+H6/9qr2zw==
X-CSE-MsgGUID: w76XwbCdRVSmbkxFdswVWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="70407142"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="70407142"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 09:09:44 -0800
X-CSE-ConnectionGUID: gqnA1HasSFGORjlLozsBPQ==
X-CSE-MsgGUID: gVxKLM/8TKSsxSBVCvSLlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="235462444"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 09:09:43 -0800
Date: Tue, 16 Dec 2025 18:09:40 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com, rodrigo.vivi@intel.com
Subject: Re: [PATCH i-g-t v7 1/2] lib/igt_device: Add API to get pci device
 upstream port
Message-ID: <20251216170940.par7caxx3lrnuljx@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik Poosa <karthik.poosa@intel.com>,
 igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com
References: <20251212165830.28286-1-karthik.poosa@intel.com>
 <20251212165830.28286-2-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251212165830.28286-2-karthik.poosa@intel.com>
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

Hi Karthik,
On 2025-12-12 at 22:28:29 +0530, Karthik Poosa wrote:
> Add API igt_device_get_pci_usp() to get pci device's upstream port.

You renamed this function, so imho

s/Add API igt_device_get_pci_usp()/Add function/

> This API returns struct pci_device* of the upstream port that is closest

s/This API returns/It will return/

> to the root port within the device's hierarchy.
> 
> v2: Avoid igt_require in igt_device_get_pci_usp(). (Kamil)
> 
> v3: Rename igt_device_get_pci_usp() to igt_device_get_pci_upstream_port(). (Kamil)
> 
> v4: Use device type from pci express capability of pci config space
>     to identify upstream port. (Badal)
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/igt_device.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_device.h |  1 +
>  lib/igt_pci.h    |  2 ++
>  3 files changed, 45 insertions(+)
> 
> diff --git a/lib/igt_device.c b/lib/igt_device.c
> index c24f6a58d..fda261d8b 100644
> --- a/lib/igt_device.c
> +++ b/lib/igt_device.c
> @@ -32,6 +32,7 @@
>  #include "igt.h"
>  #include "igt_device.h"
>  #include "igt_sysfs.h"
> +#include "igt_pci.h"

Move this up before igt_sysfs.h (keep it in alphabetical order).

>  
>  int __igt_device_set_master(int fd)
>  {
> @@ -308,3 +309,44 @@ void igt_device_get_pci_slot_name(int fd, char *pci_slot_name)
>  	snprintf(pci_slot_name, NAME_MAX, "%04x:%02x:%02x.%01x",
>  		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
>  }
> +
> +/**
> + * igt_device_get_pci_upstream_port:
> + * @fd: fd of the GPU endpoint.
> + *
> + * Looks up for the pci device's upstream port using libpciaccess.
> + *
> + * Returns:
> + * The pci_device of upstream port of the device referenced by fd, NULL on any failures.
> + */
> +struct pci_device *
> +igt_device_get_pci_upstream_port(int fd)
> +{
> +	struct pci_device *pci_dev = NULL;
> +	uint8_t device_type = 0;
> +	int offset = 0;
> +
> +	pci_dev = __igt_device_get_pci_device(fd, 0);
> +	if(!pci_dev) {
> +		igt_warn("Couldn't get pci device for fg %d\n", fd);

s/fg/fd/

Please remove this warning from here or replace it with igt_debug.
Btw do we need printing fd here?

> +		return NULL;
> +	}
> +
> +	pci_dev = pci_device_get_parent_bridge(pci_dev);
> +	while (pci_dev) {
> +		igt_debug("PCI device %04x:%02x:%02x.%01x\n",  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
> +
> +		offset = find_pci_cap_offset(pci_dev, PCI_EXPRESS_CAP_ID);
> +		if (offset <= 0) {
> +			igt_warn("PCI Express Capability not found\n");

Same here, remove or replace with igt_debug.

> +			return NULL;
> +		}

Add newline.

> +		igt_assert(!pci_device_cfg_read_u8(pci_dev, &device_type, offset + PCI_DEVICE_TYPE_OFFSET));

imho it should be better to not have any assert in lib function,
so better would be to print debug and return NULL.

> +		if((device_type >> 4) == PCI_DEVICE_TYPE_UPSTREAM_PORT)
> +			return pci_dev;
> +
> +		pci_dev = pci_device_get_parent_bridge(pci_dev);
> +	}
> +

Should we free pci_dev here and return NULL?
Your explicit check few lines above looks more reliable.

Regards,
Kamil

> +	return pci_dev;
> +}
> diff --git a/lib/igt_device.h b/lib/igt_device.h
> index dad7bb047..781a72235 100644
> --- a/lib/igt_device.h
> +++ b/lib/igt_device.h
> @@ -35,6 +35,7 @@ int igt_device_get_card_index(int fd);
>  struct pci_device *igt_device_get_pci_device(int fd);
>  struct pci_device *__igt_device_get_pci_device(int fd, unsigned int vf_id);
>  struct pci_device *igt_device_get_pci_root_port(int fd);
> +struct pci_device *igt_device_get_pci_upstream_port(int fd);
>  
>  void igt_device_get_pci_slot_name(int fd, char *pci_slot_name);
>  #endif /* __IGT_DEVICE_H__ */
> diff --git a/lib/igt_pci.h b/lib/igt_pci.h
> index 92b9cc392..84355e9dd 100644
> --- a/lib/igt_pci.h
> +++ b/lib/igt_pci.h
> @@ -20,6 +20,8 @@ enum pci_cap_id {
>  	PCI_EXPRESS_CAP_ID = 0x10
>  };
>  
> +#define PCI_DEVICE_TYPE_OFFSET 0x2
> +#define PCI_DEVICE_TYPE_UPSTREAM_PORT	0x5
>  #define PCI_SLOT_CAP_OFFSET 0x14
>  #define  PCI_SLOT_PWR_CTRL_PRESENT (1 << 1)
>  
> -- 
> 2.25.1
> 
