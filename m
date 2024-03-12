Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241EDC54E5D
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 12:59:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 948C710F06A;
	Tue, 12 Mar 2024 12:59:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JAUSLd/g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80CF510F06A
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 12:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710248385; x=1741784385;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=GYJ6x5dIu07OJJvuv+q3hoU3zKgw5hGfSNcQoeFOugU=;
 b=JAUSLd/gSeSRMI9RTgVAoVTPBv+ZaXUMm03N7TY5vRV2YixWcuKpr3qL
 7tJ0rSuiJq09udSSCHmns/1tkopcER7TfmGiXA+Ustwm+6Y5mBUvCPZcV
 /KHGBAboWWLlMaH70b3wCKsgiKCXxIdvjBL6sj2y77Z/TIQl/IqO54EBG
 g45lhHgpmiR8cnwWprJVb7grAXUFbzK7aKFcPqqoWhfC3gOzBYqWFNK2I
 oQaTj3Y4aoQiSL1EtftQWapN+WeORF09sJcIcPTqcEl2Opj/H7Ch2gHqO
 FUKOPMWrjVwmH+F7YFsEpre9UDBJt8V7OGHY50EPIEvuedFZXBODvp6B+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="5140974"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5140974"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 05:59:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="16139052"
Received: from unknown (HELO localhost) ([10.245.244.207])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 05:59:43 -0700
Date: Tue, 12 Mar 2024 13:59:40 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/2] lib/intel_common: Add placeholder for common
 i915 and xe functions
Message-ID: <20240312125940.rbh3xc7a5isypal2@zkempczy-mobl2>
References: <20240312122654.73689-1-zbigniew.kempczynski@intel.com>
 <0f8784e3-05bb-4b35-ae56-8e6ac53f5390@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f8784e3-05bb-4b35-ae56-8e6ac53f5390@intel.com>
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

On Tue, Mar 12, 2024 at 12:43:41PM +0000, Matthew Auld wrote:
> On 12/03/2024 12:26, Zbigniew Kempczyński wrote:
> > Some constructs like querying if device is discrete or getting memory
> > region origin are common so add new file to place those functions into.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > ---
> >   lib/intel_common.c | 91 ++++++++++++++++++++++++++++++++++++++++++++++
> >   lib/intel_common.h | 25 +++++++++++++
> >   lib/meson.build    |  1 +
> >   3 files changed, 117 insertions(+)
> >   create mode 100644 lib/intel_common.c
> >   create mode 100644 lib/intel_common.h
> > 
> > diff --git a/lib/intel_common.c b/lib/intel_common.c
> > new file mode 100644
> > index 0000000000..3cc7b7f2be
> > --- /dev/null
> > +++ b/lib/intel_common.c
> > @@ -0,0 +1,91 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +
> > +#include "drmtest.h"
> > +#include "intel_chipset.h"
> > +#include "intel_common.h"
> > +#include "i915/intel_memory_region.h"
> > +#include "xe/xe_query.h"
> > +
> > +/**
> > + * is_intel_dgfx:
> > + * @fd: drm fd
> > + *
> > + * Check if Intel device opened at @fd is discrete regardless driver (i915/xe).
> > + *
> > + * Returns: True if device is Intel discrete, false otherwise
> > + */
> > +bool is_intel_dgfx(int fd)
> > +{
> > +	return get_intel_driver(fd) == INTEL_DRIVER_XE ? xe_has_vram(fd) :
> > +							 gem_has_lmem(fd);
> > +}
> > +
> > +/**
> > + * is_intel_system_region:
> > + * @fd: drm fd
> > + * @region: region id
> > + *
> > + * Check if @region is system region on @fd opened Intel device.
> > + *
> > + * Returns: True if @region is system memory, false otherwise
> > + */
> > +bool is_intel_system_region(int fd, uint64_t region)
> > +{
> > +	enum intel_driver driver = get_intel_driver(fd);
> > +	bool is_system;
> > +
> > +	if (driver == INTEL_DRIVER_I915)
> > +		is_system = IS_SYSTEM_MEMORY_REGION(region);
> > +	else
> > +		is_system = (region == system_memory(fd));
> > +
> > +	return is_system;
> > +}
> > +
> > +/**
> > + * is_intel_vram_region:
> > + * @fd: drm fd
> > + * @region: region id
> > + *
> > + * Check if @region is vram (device memory) region on @fd opened Intel device.
> > + *
> > + * Returns: True if @region is vram, false otherwise
> > + */
> > +bool is_intel_vram_region(int fd, uint64_t region)
> > +{
> 
> return !is_intel_system_region(fd, region)

I thought about it but what if user will pass 'region == 0'?
This is not system and not vram, so I assumed both functions
on xe will return false. I may assert on region == 0 on xe
to make sure user won't pass invalid region.

> 
> ?
> 
> > +	enum intel_driver driver = get_intel_driver(fd);
> > +	bool is_vram;
> > +
> > +	if (driver == INTEL_DRIVER_I915)
> > +		is_vram = IS_DEVICE_MEMORY_REGION(region);
> > +	else
> > +		is_vram = (region & (all_memory_regions(fd) & (~system_memory(fd))));
> > +
> > +	return is_vram;
> > +}
> > +
> > +/**
> > + * is_intel_region_compressible:
> > + * @fd: drm fd
> > + * @region: region id
> > + *
> > + * Check if @region is compressible on @fd opened Intel device.
> > + *
> > + * Returns: True if @region is compressible, false otherwise
> > + */
> > +bool is_intel_region_compressible(int fd, uint64_t region)
> > +{
> > +	bool is_dgfx = is_intel_dgfx(fd);
> > +	bool is_vram = is_intel_vram_region(fd, region);
> > +
> > +	if (is_dgfx && is_vram)
> > +		return true;
> > +
> > +	if (AT_LEAST_GEN(intel_get_drm_devid(fd), 20) && !is_dgfx)
> > +		return true;
> > +
> > +	return false;
> > +}
> 
> Just thinking about DG1. It's dgpu but I don't think it has flat-ccs, so I
> assume it is using aux-ccs and therefore anything is compressible? But here
> we return true for vram only? We also also have older igpu platforms that
> use aux-ccs, but we return false here. Perhaps we mean
> is_intel_region_flat_ccs_compressible() ? Or we need to check if the
> platform has_flatccs() && is_dgfx ?

Agree, I silently bypassed DG1 and aux-ccs platforms. I think it makes
sense to have dedicated helpers for flatccs and aux-ccs grouping in
is_intel_region_compressible(). I'm going to slightly reshape and
respin.

Thanks for the review.

--
Zbigniew

> 
> Otherwise I think looks good.
> 
> > diff --git a/lib/intel_common.h b/lib/intel_common.h
> > new file mode 100644
> > index 0000000000..924802473b
> > --- /dev/null
> > +++ b/lib/intel_common.h
> > @@ -0,0 +1,25 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +
> > +#ifndef __INTEL_COMMON_H__
> > +#define __INTEL_COMMON_H__
> > +
> > +/**
> > + * SECTION:intel_common
> > + * @short_description: i915/xe common library code
> > + * @title: Intel library
> > + * @include: intel_common.h
> > + *
> > + */
> > +
> > +#include <stdbool.h>
> > +#include <stdint.h>
> > +
> > +bool is_intel_dgfx(int fd);
> > +bool is_intel_system_region(int fd, uint64_t region);
> > +bool is_intel_vram_region(int fd, uint64_t region);
> > +bool is_intel_region_compressible(int fd, uint64_t region);
> > +
> > +#endif
> > diff --git a/lib/meson.build b/lib/meson.build
> > index 6122861d8b..934bac5c67 100644
> > --- a/lib/meson.build
> > +++ b/lib/meson.build
> > @@ -59,6 +59,7 @@ lib_sources = [
> >   	'intel_bufops.c',
> >   	'intel_chipset.c',
> >   	'intel_cmds_info.c',
> > +	'intel_common.c',
> >   	'intel_compute.c',
> >   	'intel_compute_square_kernels.c',
> >   	'intel_ctx.c',
