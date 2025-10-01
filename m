Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867F4CAC5BB
	for <igt-dev@archiver.kernel.org>; Wed,  1 Oct 2025 18:32:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 331EC10E15B;
	Wed,  1 Oct 2025 18:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RsEryv6s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 795D210E15B
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Oct 2025 18:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759343568; x=1790879568;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/se42tENn9I0jOApRz2z0mLrq1nEhPEytv5QXcHW3J8=;
 b=RsEryv6ssKzNYunyAQQSrw9rBdRI49VhKkA94x7vkFxLVZu/kICZlnfl
 zQYcGfjoAwjvAAqRVtRcGlQ1Z8uNrEESn794vfyXcrC6hzHQFGXzVvL/3
 IkXSOpNso+J0iev+uIyhuYd4OwCQhUGj33olI8e0+FTWIWQebFy4r3euj
 PZ7HgE2SNepkE8XM/cHbCavIQIDo7BHnbzuE4oZhyDTJGfK4jaENn0kJ3
 j1DcfbonQMk+r4P4gBw+mr7ayua4n9TkibAbXNFwkeBsZjfM74Vw79wgG
 zigf0G0XtRxeexNY753GnMKOtFlBmaDjcpcelK/WEHc/HJX945lfbxpIj Q==;
X-CSE-ConnectionGUID: CRZqYWLKRTu8/6pNJae/9w==
X-CSE-MsgGUID: z7sIKbQlSCmUbZvhcamW0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61544476"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61544476"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 11:32:48 -0700
X-CSE-ConnectionGUID: TMDi9Dr0R8e8lFjGNZxKOw==
X-CSE-MsgGUID: cEP/+vn/R3qqrw4wYwNFbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; d="scan'208";a="178480255"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2025 11:32:46 -0700
Date: Wed, 1 Oct 2025 20:32:23 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mark Yacoub <markyacoub@google.com>
Cc: igt-dev@lists.freedesktop.org, louis.chauvet@bootlin.com
Subject: Re: [PATCH i-g-t] lib/drmtest: Allow DRIVER_ANY tests to run on VKMS
 when supported.
Message-ID: <20251001183223.dt7rybzbu5bglbeq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mark Yacoub <markyacoub@google.com>, igt-dev@lists.freedesktop.org,
 louis.chauvet@bootlin.com
References: <20251001163635.3353517-1-markyacoub@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251001163635.3353517-1-markyacoub@google.com>
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

Hi Mark,
On 2025-10-01 at 12:36:34 -0400, Mark Yacoub wrote:
> [Why]
> Android's VM use virtio-gpu as its default driver, but VKMS can be
> enabled on top it.
> VKMS is the preferred driver to run IGT.
> 
> [How]
> To maintain the current way to preferring hardware drivers, introduce a
> "PREFER_VKMS" flag which does not remove DRIVER_VKMS from the list of
> drivers to be opened. Android will keep this as always true.
> 
> Also, added explicit support for virtio-gpu to be explictly filtered
> out, making room for VKMS to be the primary driver in use.
> 
> Test: kms_bw on AVD
> Signed-off-by: Mark Yacoub <markyacoub@google.com>
> ---
>  lib/drmtest.c |  1 +
>  lib/drmtest.h | 18 +++++++++++-------
>  2 files changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 551385867..a1fb0b5ba 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -223,6 +223,7 @@ static const struct module {
>  	{ DRIVER_V3D, "v3d" },
>  	{ DRIVER_VC4, "vc4" },
>  	{ DRIVER_VGEM, "vgem" },
> +	{ DRIVER_VIRTIO, "virtio_gpu" },

Please add it properly with a define, like others.

>  	{ DRIVER_VKMS, "vkms" },
>  	{ DRIVER_VMWGFX, "vmwgfx" },
>  	{ DRIVER_XE, "xe" },
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index a9542dde2..32fec584a 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -37,6 +37,7 @@
>  #include <xf86drm.h>
>  
>  #include "igt_core.h"
> +#include "config.h"
>  
>  int __get_drm_device_name(int fd, char *name, int name_size);
>  
> @@ -58,14 +59,17 @@ int __get_drm_device_name(int fd, char *name, int name_size);
>  #define DRIVER_VKMS	(1 << 9)
>  
>  /*
> - * Exclude DRVER_VGEM from DRIVER_ANY since if you run on a system
> - * with vgem as well as a supported driver, you can end up with a
> - * near-100% skip rate if you don't explicitly specify the device,
> - * depending on device-load ordering.
> - *
> - * Exclude VKMS to prefer hardware drivers.
> + * Exclude DRIVER_VGEM and DRIVER_VIRTIO from DRIVER_ANY since if
> + * you run on a system with vgem or virtio-gpu as well as a supported driver,
> + * you can end up with a near-100% skip rate if you don't explicitly specify
> + * the device, depending on device-load ordering.
>   */
> -#define DRIVER_ANY	~(DRIVER_VGEM | DRIVER_VKMS)
> +#ifdef PREFER_VKMS

Please no ifdef's when no needed, if anyone wants that igt test
uses some other driver, it could have IGT_FORCE_DRIVER=some_gpu_driver

> +#define DRIVER_ANY	~(DRIVER_VGEM  | DRIVER_VIRTIO)
> +#else
> +/* Exclude VKMS to prefer hardware drivers if VKMS is not the preferred driver. */
> +#define DRIVER_ANY	~(DRIVER_VGEM | DRIVER_VKMS | DRIVER_VIRTIO)

This should be without any conditional.
Please also send code which compile, see CI report.

Regards,
Kamil

> +#endif
>  
>  /*
>   * Compile friendly enum for i915/xe.
> -- 
> 2.51.0.618.g983fd99d29-goog
> 
