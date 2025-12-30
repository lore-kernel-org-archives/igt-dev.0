Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8B1E95A8B
	for <igt-dev@archiver.kernel.org>; Tue, 30 Dec 2025 13:01:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19AD210E8E2;
	Tue, 30 Dec 2025 13:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K2LieuBE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46AE10E8E2
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Dec 2025 13:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767099683; x=1798635683;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=F5sYv6mGPd6q/rt73rTBClGTB1DQgpECofcwkiqr0zY=;
 b=K2LieuBEePTGDjU9vJXLx7mBKh2kqoweF9sfNR3P3OQCP68dTlfp65/O
 Rpny5Yx1ELa54ewuiNMXDV42CHYNnHEGoImyOTQshYiEz2AodZlmN5fZm
 O/CEGfZiGgLolOpJbzBVBnamGCmqJ1bv9+Px5zbQc7Ya1+1+Jiph1TiVZ
 XtJoZDVjWZYfbKcL6R1BJEuZzo+N4JZRzxPPMaNIsYFgEaB+OxN9pPV3v
 XIeEMp3y3iRjToYcd2Wh8tOIpe6d8aYKzIJIKGOEdWEWmMvYP9ndzrduT
 4rMTmgmFxvHZC+oi9/ieRiuZm2MYNcta5qi8px1R+1UHyKM1iDwUgpnf0 A==;
X-CSE-ConnectionGUID: TfULwfGwTcy7yLELAHQjxA==
X-CSE-MsgGUID: Vx+cAs/6SU+gtdOuGH9ZMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="56261849"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; d="scan'208";a="56261849"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 05:01:22 -0800
X-CSE-ConnectionGUID: Vk6RyIQRRmKRydi5xvq0Ew==
X-CSE-MsgGUID: rlS+zlebSHmCYbcO01Og8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; d="scan'208";a="200353881"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:01:20 -0800
Date: Tue, 30 Dec 2025 14:01:05 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com, rodrigo.vivi@intel.com
Subject: Re: [PATCH i-g-t v9 1/2] lib/igt_device: Add API to get pci device
 upstream port
Message-ID: <20251230130105.l2vfslaptuunoxf2@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik Poosa <karthik.poosa@intel.com>,
 igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com
References: <20251219112620.273174-1-karthik.poosa@intel.com>
 <20251219112620.273174-2-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251219112620.273174-2-karthik.poosa@intel.com>
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
On 2025-12-19 at 16:56:19 +0530, Karthik Poosa wrote:
> Add API igt_device_get_pci_upstream_port() to get pci device's upstream port.
> This API returns struct pci_device* of the upstream port that is closest
> to the root port within the device's hierarchy.
> 
> v2: Avoid igt_require in igt_device_get_pci_usp(). (Kamil)
> 
> v3: Rename igt_device_get_pci_usp() to igt_device_get_pci_upstream_port(). (Kamil)
> 
> v4: Use device type from pci express capability of pci config space
>     to identify upstream port. (Badal)
> 
> v5:
>  - Search for upstream port only two levels up of the endpoint as we want to
>    verify ASPM only on PCIe link on which GPU card is present.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  lib/igt_device.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  lib/igt_device.h |  1 +
>  lib/igt_pci.h    |  2 ++
>  3 files changed, 44 insertions(+)
> 
> diff --git a/lib/igt_device.c b/lib/igt_device.c
> index c24f6a58d..d6c3f924d 100644
> --- a/lib/igt_device.c
> +++ b/lib/igt_device.c
> @@ -32,6 +32,7 @@
>  #include "igt.h"
>  #include "igt_device.h"
>  #include "igt_sysfs.h"
> +#include "igt_pci.h"
>  
>  int __igt_device_set_master(int fd)
>  {
> @@ -308,3 +309,43 @@ void igt_device_get_pci_slot_name(int fd, char *pci_slot_name)
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
> +	int level = 0;
> +
> +	pci_dev = __igt_device_get_pci_device(fd, 0);
> +	if(!pci_dev) {

Add space after 'if':
	if (!pci_dev) {

> +		igt_warn("Couldn't get pci device for fd %d\n", fd);
> +		return NULL;
> +	}
> +
> +	for(pci_dev = pci_device_get_parent_bridge(pci_dev); (pci_dev && (level < 2));

Add space after 'for':
	for (pci_dev = ...

> +	    pci_dev = pci_device_get_parent_bridge(pci_dev), level++) {
> +

Remove ampty line.

> +		igt_debug("PCI device %04x:%02x:%02x.%01x\n",  pci_dev->domain, pci_dev->bus,
> +			  pci_dev->dev, pci_dev->func);
> +		offset = find_pci_cap_offset(pci_dev, PCI_EXPRESS_CAP_ID);
> +		if (offset <= 0) {
> +			igt_warn("PCI Express Capability not found\n");
> +			return NULL;
> +		}

Add newline.

> +		igt_assert(!pci_device_cfg_read_u8(pci_dev, &device_type, offset + PCI_DEVICE_TYPE_OFFSET));
> +		if ((device_type >> 4) == PCI_DEVICE_TYPE_UPSTREAM_PORT)
> +			return pci_dev;
> +	}

Add newline.

Regards,
Kamil

> +	return NULL;
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
