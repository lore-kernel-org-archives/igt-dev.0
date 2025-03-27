Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26852C3600B
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 17:08:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC81510E928;
	Thu, 27 Mar 2025 17:08:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O+PwUr3K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F141110E12D
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 17:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743095284; x=1774631284;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HPVDSW6pgj33qvWJ+Yj7mXoOxABTw0kEqQdCCVJbXGw=;
 b=O+PwUr3KAo5FStSkN5YfN4akFGP+EEeM/0uunbqxxwZBBFtCxIaauYwU
 UGuj+XKqi8B/nmajKjllhcguI9h8/F6YPbHMxhEDxuvvNnuRXsujzLDRW
 nT9rKuh5lKSKPZLjBgkXbaiVzm6p0aQ7rc3Dlx8Y72IAp5mE321z8v2IY
 w7dcxRYo/y9EYhvtAkQUi9h8ldW6WQfssAXJuHv39+m7U28iMItanNILi
 qmkFnqXbH0sWDvKAn0lfuI7KD+tFiywyP768zsjddioOQVh+fmlYNDkIq
 q92TAAElIngVL2g1CsgjnsSLKs97sv676oyLjwTPh0Sdq53UcREXu7Z/W g==;
X-CSE-ConnectionGUID: WyOFvBILQk+SapqEf6IcyQ==
X-CSE-MsgGUID: B3lR0PydRXqCB13Oxv7aJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44332460"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="44332460"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 10:08:04 -0700
X-CSE-ConnectionGUID: MYHrXOPTQWmwo/M50TvZ0g==
X-CSE-MsgGUID: gdiZ16pCQl2rv1S25z1jhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="156202630"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 10:08:02 -0700
Date: Thu, 27 Mar 2025 18:07:59 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com,
 anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Subject: Re: [PATCH 'i-g-t' v2 1/2] lib/igt_device_scan: Add driver field to
 igt_device_card struct
Message-ID: <20250327170759.eyqef6m7ezwhqyaq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com,
 anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com
References: <20250327014827.1829635-1-soham.purkait@intel.com>
 <20250327014827.1829635-2-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250327014827.1829635-2-soham.purkait@intel.com>
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

Hi Soham,
On 2025-03-27 at 07:18:26 +0530, Soham Purkait wrote:
> Add driver field to igt_device_card structure
> for storing driver names.
> 
> v1 : Add driver field to igt_device_card struct
> 
> v2 : Reorder commit sequence (Riana)
>      Include sign-off
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_device_scan.c | 4 ++++
>  lib/igt_device_scan.h | 1 +
>  2 files changed, 5 insertions(+)
> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index 711bedc5c..3f26a1737 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -774,6 +774,10 @@ __copy_dev_to_card(struct igt_device *dev, struct igt_device_card *card)
>  		safe_strncpy(card->render, dev->drm_render,
>  			     sizeof(card->render));
>  
> +	if (dev->driver != NULL)
> +		safe_strncpy(card->driver, dev->driver,
> +			     sizeof(card->driver));
> +
>  	if (dev->pci_slot_name != NULL)
>  		safe_strncpy(card->pci_slot_name, dev->pci_slot_name,
>  			     sizeof(card->pci_slot_name));
> diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
> index 92741fe3c..f1cd3b1e9 100644
> --- a/lib/igt_device_scan.h
> +++ b/lib/igt_device_scan.h
> @@ -59,6 +59,7 @@ struct igt_device_card {
>  	char subsystem[NAME_MAX];
>  	char card[NAME_MAX];
>  	char render[NAME_MAX];
> +	char driver[NAME_MAX];
>  	char pci_slot_name[PCI_SLOT_NAME_SIZE+1];
>  	uint16_t pci_vendor, pci_device;
>  };
> -- 
> 2.34.1
> 
