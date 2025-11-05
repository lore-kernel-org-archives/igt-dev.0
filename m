Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F02B5CCFA0D
	for <igt-dev@archiver.kernel.org>; Wed,  5 Nov 2025 10:22:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 970DC10E280;
	Wed,  5 Nov 2025 10:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E5oveW6V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A167D10E280
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Nov 2025 10:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762338155; x=1793874155;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8HLuq+pH7YNWgUnH1zWxO32aA3b2TTksdai/5Z+G6Xk=;
 b=E5oveW6VAz93EiJcSk975xJr/6CsefySxAHcEnJNdWuQNmDeJpARh0RW
 FU8/bMNPKTwUt/qpnOxRzV9RyppBlrRfP5dtjWw0rdShl2sg/jYz078nb
 KgA7ZuCzyrGTvaRQDbOVgxUMVdaqx4iIvOzxB8Xf5dI56dN+hiCS6zGo0
 pqkCzbyE4sP/z4yZIoPfp8XtbpWyABsm1UhrM7hJcYttCKj2VGAoj/0VQ
 LpvLl0XockxUDlK9Oy/ef56lRjQkfiJyUPUUDdSlr+VcMRw3dZBiEU+kA
 +y/K36DCPPAoJ6KM0I4C8YIx9MYswebS+KnYhm8wjVm1x0taVVEnifjYo g==;
X-CSE-ConnectionGUID: PlsUvvLoQy6gZe3bI4KQww==
X-CSE-MsgGUID: KKLHKNH8SIeJPv0VVKraXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64364013"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="64364013"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 02:22:34 -0800
X-CSE-ConnectionGUID: lbpeG5F+Ssi/HmGEK1KtZg==
X-CSE-MsgGUID: I1Q9R2TLRsye18UjuaLSmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="218062393"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 02:22:32 -0800
Date: Wed, 5 Nov 2025 11:22:16 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, raag.jadav@intel.com, sk.anirban@intel.com
Subject: Re: [PATCH i-g-t v3 1/2] lib/igt_device: Add API to get pci device
 upstream port
Message-ID: <20251105102216.a65meobsq4utimbo@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik Poosa <karthik.poosa@intel.com>,
 igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, raag.jadav@intel.com, sk.anirban@intel.com
References: <20251105084426.601123-1-karthik.poosa@intel.com>
 <20251105084426.601123-2-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251105084426.601123-2-karthik.poosa@intel.com>
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
On 2025-11-05 at 14:14:25 +0530, Karthik Poosa wrote:
> Add API igt_device_get_pci_usp() to get pci device's upstream port.
> This API returns struct pci_device* of the upstream port that is closest
> to the root port within the device's hierarchy.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  lib/igt_device.c | 27 +++++++++++++++++++++++++++
>  lib/igt_device.h |  1 +
>  2 files changed, 28 insertions(+)
> 
> diff --git a/lib/igt_device.c b/lib/igt_device.c
> index c24f6a58d..17b6c578a 100644
> --- a/lib/igt_device.c
> +++ b/lib/igt_device.c
> @@ -308,3 +308,30 @@ void igt_device_get_pci_slot_name(int fd, char *pci_slot_name)
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
> +{
> +	struct pci_device *pci_dev, *prev = NULL, *parent;
> +
> +	pci_dev = igt_device_get_pci_device(fd);

Please use __igt_device_get_pci_device(fd) here and check
for NULL like:
	if (!pci_dev)
		return NULL;

Overall looks good.

Regards,
Kamil

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
