Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D5DC36010
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 08:35:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8F510E063;
	Fri, 28 Mar 2025 08:35:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OBN77Cze";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F75710E2F3
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 08:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743150953; x=1774686953;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Pr6OvL9EcDbAtAzKCn+Im2V5ELOA5Ep4MYTUxEw7Uy4=;
 b=OBN77Cze+9p2vDKNFWiC23reLIQNJtL6spzi8vKxl678sQ+7AlRCNEQ+
 Lc4zFFvZZlZiwg1q0Nlo+0mTUwZ9N4BPJgo4J1+6Nq2Jlj0DSc7BD1nQk
 Kb8tu7dguArh/K+2/gYX2gRJm9GcU2yuVM1sSSPiZ5Yt5V6YUAF/OewLg
 g8pl1A9sgrSYMpBwSFvzMkaBiSPqAvWt8YmkinAe9LWcFJ9XWW+UVPpPG
 epoFyf6pV3dKFPWIFSJM/zizSilICfqFQv00Do2113zfxB+MajjA2eejt
 XZcyp0xoMxolofH9/LglIbmZq0RcPuXHVe4NEtG2yU4mRqeT5ahIEM9c6 g==;
X-CSE-ConnectionGUID: wzok99+dS/29VGm9apNuMA==
X-CSE-MsgGUID: qhz1ZdNpSTS7R2mfUyELgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="43753725"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="43753725"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 01:35:52 -0700
X-CSE-ConnectionGUID: YBRpi7gdTlOHd3S9kld8LA==
X-CSE-MsgGUID: ruRxaDJTRMqGJptTJEmQsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="130103227"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.235])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 01:35:50 -0700
Date: Fri, 28 Mar 2025 09:35:48 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com
Subject: Re: [PATCH 'i-g-t' v2 1/2] lib/igt_device_scan: Add driver field to
 igt_device_card struct
Message-ID: <20250328083548.7ekznzo5bk3sdpim@zkempczy-mobl2>
References: <20250327014827.1829635-1-soham.purkait@intel.com>
 <20250327014827.1829635-2-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

On Thu, Mar 27, 2025 at 07:18:26AM +0530, Soham Purkait wrote:
> Add driver field to igt_device_card structure
> for storing driver names.
> 
> v1 : Add driver field to igt_device_card struct
> 
> v2 : Reorder commit sequence (Riana)
>      Include sign-off
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
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

This code is also part of your device filter patch, it would
be good to merge this and get rid of there.

--
Zbigniew
