Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46360CF31AD
	for <igt-dev@archiver.kernel.org>; Wed, 19 Nov 2025 11:32:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D195310E23B;
	Wed, 19 Nov 2025 11:32:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dZBKvjxk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D6310E23B
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Nov 2025 11:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763551971; x=1795087971;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wqZDfdyipWioSP9eNNpbOCFpx+8JqPk379NmI2AehGo=;
 b=dZBKvjxktbJHKNzC7sqSAZLWNIkvHCY3kd7hYhkqYOoHkU5Lwhdwakmu
 4D/mjRjXeM8yFL7Ntv7laXUjunoVYVQNb6YVkzIzOBlWPO/ovDvqqW+vK
 5tVAInah8aGT8C/FQgsaAg0ykCq9by9xW9WTdr/7aLZ4BC461Bu1I2sXQ
 dFnaMrApQxvnxgZbMcSl6GoapCnJILC0nxZjqZsuAbEn37Rt9q1ptQlbi
 +BbN/7BIJ1gMNp4zfo6cv6/Iy9rzOQye/3BPkF/455vn4Xv+iApzHrpFj
 Qst9lj3YRLP+4MxtW4WtbD4UaTwYTqc9BAv/CiYkJvBZSBUwbnnOJ8Qom w==;
X-CSE-ConnectionGUID: ypUC8qPGTgCTBHSk9j3++Q==
X-CSE-MsgGUID: SIn1kekcTn6lw5OdFwVLdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="69207159"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="69207159"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 03:32:51 -0800
X-CSE-ConnectionGUID: Q2w9fZ9USdapEj+Has9lfg==
X-CSE-MsgGUID: nbUBy7QmQkyY5wqLe0EvKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="190833515"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 03:32:48 -0800
Date: Wed, 19 Nov 2025 12:32:31 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, raag.jadav@intel.com, sk.anirban@intel.com
Subject: Re: [PATCH i-g-t v4 1/2] lib/igt_device: Add API to get pci device
 upstream port
Message-ID: <20251119113231.k2jo5phahyirgd74@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik Poosa <karthik.poosa@intel.com>,
 igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, raag.jadav@intel.com, sk.anirban@intel.com
References: <20251119095154.2501720-1-karthik.poosa@intel.com>
 <20251119095154.2501720-2-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251119095154.2501720-2-karthik.poosa@intel.com>
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
On 2025-11-19 at 15:21:53 +0530, Karthik Poosa wrote:
> Add API igt_device_get_pci_usp() to get pci device's upstream port.
> This API returns struct pci_device* of the upstream port that is closest
> to the root port within the device's hierarchy.
> 
> v2: Avoid igt_require in igt_device_get_pci_usp(). (Kamil)
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  lib/igt_device.c | 30 ++++++++++++++++++++++++++++++
>  lib/igt_device.h |  1 +
>  2 files changed, 31 insertions(+)
> 
> diff --git a/lib/igt_device.c b/lib/igt_device.c
> index c24f6a58d..7e4175439 100644
> --- a/lib/igt_device.c
> +++ b/lib/igt_device.c
> @@ -308,3 +308,33 @@ void igt_device_get_pci_slot_name(int fd, char *pci_slot_name)
>  	snprintf(pci_slot_name, NAME_MAX, "%04x:%02x:%02x.%01x",
>  		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
>  }
> +
> +/**
> + * igt_device_get_pci_usp:
> + * @fd: fd of the GPU endpoint.
> + *
> + * Looks up for the pci device's upstream port using libpciaccess.
> + *
> + * Returns:
> + * The pci_device of upstream port of the device referenced by fd, NULL on any failures.
> + */
> +struct pci_device *
> +igt_device_get_pci_usp(int fd)

Now it looks good, looking for other function names imho
this could be better named with:

igt_device_get_pci_upstream_port(int fd)

With above fixed this is
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil 

> +{
> +	struct pci_device *pci_dev, *prev = NULL, *parent;
> +
> +	pci_dev = __igt_device_get_pci_device(fd, 0);
> +	if(!pci_dev)
> +		return NULL;
> +
> +	parent = pci_device_get_parent_bridge(pci_dev);
> +	while (parent) {
> +		igt_debug("PCI device %04x:%02x:%02x.%01x\n",  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
> +		igt_debug("PCI device parent %04x:%02x:%02x.%01x\n", parent->domain, parent->bus, parent->dev, parent->func);
> +		prev = pci_dev;
> +		pci_dev = parent;
> +		parent = pci_device_get_parent_bridge(pci_dev);
> +	}
> +
> +	return prev;
> +}
> diff --git a/lib/igt_device.h b/lib/igt_device.h
> index dad7bb047..7de464c0e 100644
> --- a/lib/igt_device.h
> +++ b/lib/igt_device.h
> @@ -35,6 +35,7 @@ int igt_device_get_card_index(int fd);
>  struct pci_device *igt_device_get_pci_device(int fd);
>  struct pci_device *__igt_device_get_pci_device(int fd, unsigned int vf_id);
>  struct pci_device *igt_device_get_pci_root_port(int fd);
> +struct pci_device *igt_device_get_pci_usp(int fd);
>  
>  void igt_device_get_pci_slot_name(int fd, char *pci_slot_name);
>  #endif /* __IGT_DEVICE_H__ */
> -- 
> 2.25.1
> 
