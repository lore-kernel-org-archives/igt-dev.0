Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA3CC54E69
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 12:44:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C3110F40C;
	Tue, 12 Mar 2024 12:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eVEJ8ASc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCDF410F40C
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 12:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710247488; x=1741783488;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=LAvk39Nk1ZCoK+gvYUg1xo4W/TPks+VwtfhzavZgYyk=;
 b=eVEJ8AScxSJNHmFfHalM+kzLPmmJ0Qn5E6SMA3ROergB1V/3yaTuYChc
 1vkL8hy4IOgk20XCmfg9cOp2YDtKeiA3HW8xJ1BMDEPcR4SWGapON3CFd
 00BywEfFcS3IYLj173hFntRkCABDPKHoUObmHDlrCgQXp2XXu9RSw9OLK
 5+0/bIIg5ABkHwe0nCBPqy0JmyrnPR9SxryA5I0k5M4tMQJvnrX+vAiDJ
 MILloQWuS8eTmR2mfVMu2MJ+V2Mp4yq7qYdW98LeArcPKJ1Rho2utndgs
 YqEOUTEFZ4nssPP6M8N57idlATisikEOE0K/3OmK0lFtw7zJT4Lkvf3LB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="15680552"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="15680552"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 05:43:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11590853"
Received: from unknown (HELO [10.245.244.217]) ([10.245.244.217])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 05:43:43 -0700
Message-ID: <0f8784e3-05bb-4b35-ae56-8e6ac53f5390@intel.com>
Date: Tue, 12 Mar 2024 12:43:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/intel_common: Add placeholder for common
 i915 and xe functions
Content-Language: en-GB
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240312122654.73689-1-zbigniew.kempczynski@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240312122654.73689-1-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 12/03/2024 12:26, Zbigniew Kempczyński wrote:
> Some constructs like querying if device is discrete or getting memory
> region origin are common so add new file to place those functions into.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> ---
>   lib/intel_common.c | 91 ++++++++++++++++++++++++++++++++++++++++++++++
>   lib/intel_common.h | 25 +++++++++++++
>   lib/meson.build    |  1 +
>   3 files changed, 117 insertions(+)
>   create mode 100644 lib/intel_common.c
>   create mode 100644 lib/intel_common.h
> 
> diff --git a/lib/intel_common.c b/lib/intel_common.c
> new file mode 100644
> index 0000000000..3cc7b7f2be
> --- /dev/null
> +++ b/lib/intel_common.c
> @@ -0,0 +1,91 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include "drmtest.h"
> +#include "intel_chipset.h"
> +#include "intel_common.h"
> +#include "i915/intel_memory_region.h"
> +#include "xe/xe_query.h"
> +
> +/**
> + * is_intel_dgfx:
> + * @fd: drm fd
> + *
> + * Check if Intel device opened at @fd is discrete regardless driver (i915/xe).
> + *
> + * Returns: True if device is Intel discrete, false otherwise
> + */
> +bool is_intel_dgfx(int fd)
> +{
> +	return get_intel_driver(fd) == INTEL_DRIVER_XE ? xe_has_vram(fd) :
> +							 gem_has_lmem(fd);
> +}
> +
> +/**
> + * is_intel_system_region:
> + * @fd: drm fd
> + * @region: region id
> + *
> + * Check if @region is system region on @fd opened Intel device.
> + *
> + * Returns: True if @region is system memory, false otherwise
> + */
> +bool is_intel_system_region(int fd, uint64_t region)
> +{
> +	enum intel_driver driver = get_intel_driver(fd);
> +	bool is_system;
> +
> +	if (driver == INTEL_DRIVER_I915)
> +		is_system = IS_SYSTEM_MEMORY_REGION(region);
> +	else
> +		is_system = (region == system_memory(fd));
> +
> +	return is_system;
> +}
> +
> +/**
> + * is_intel_vram_region:
> + * @fd: drm fd
> + * @region: region id
> + *
> + * Check if @region is vram (device memory) region on @fd opened Intel device.
> + *
> + * Returns: True if @region is vram, false otherwise
> + */
> +bool is_intel_vram_region(int fd, uint64_t region)
> +{

return !is_intel_system_region(fd, region)

?

> +	enum intel_driver driver = get_intel_driver(fd);
> +	bool is_vram;
> +
> +	if (driver == INTEL_DRIVER_I915)
> +		is_vram = IS_DEVICE_MEMORY_REGION(region);
> +	else
> +		is_vram = (region & (all_memory_regions(fd) & (~system_memory(fd))));
> +
> +	return is_vram;
> +}
> +
> +/**
> + * is_intel_region_compressible:
> + * @fd: drm fd
> + * @region: region id
> + *
> + * Check if @region is compressible on @fd opened Intel device.
> + *
> + * Returns: True if @region is compressible, false otherwise
> + */
> +bool is_intel_region_compressible(int fd, uint64_t region)
> +{
> +	bool is_dgfx = is_intel_dgfx(fd);
> +	bool is_vram = is_intel_vram_region(fd, region);
> +
> +	if (is_dgfx && is_vram)
> +		return true;
> +
> +	if (AT_LEAST_GEN(intel_get_drm_devid(fd), 20) && !is_dgfx)
> +		return true;
> +
> +	return false;
> +}

Just thinking about DG1. It's dgpu but I don't think it has flat-ccs, so 
I assume it is using aux-ccs and therefore anything is compressible? But 
here we return true for vram only? We also also have older igpu 
platforms that use aux-ccs, but we return false here. Perhaps we mean 
is_intel_region_flat_ccs_compressible() ? Or we need to check if the 
platform has_flatccs() && is_dgfx ?

Otherwise I think looks good.

> diff --git a/lib/intel_common.h b/lib/intel_common.h
> new file mode 100644
> index 0000000000..924802473b
> --- /dev/null
> +++ b/lib/intel_common.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef __INTEL_COMMON_H__
> +#define __INTEL_COMMON_H__
> +
> +/**
> + * SECTION:intel_common
> + * @short_description: i915/xe common library code
> + * @title: Intel library
> + * @include: intel_common.h
> + *
> + */
> +
> +#include <stdbool.h>
> +#include <stdint.h>
> +
> +bool is_intel_dgfx(int fd);
> +bool is_intel_system_region(int fd, uint64_t region);
> +bool is_intel_vram_region(int fd, uint64_t region);
> +bool is_intel_region_compressible(int fd, uint64_t region);
> +
> +#endif
> diff --git a/lib/meson.build b/lib/meson.build
> index 6122861d8b..934bac5c67 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -59,6 +59,7 @@ lib_sources = [
>   	'intel_bufops.c',
>   	'intel_chipset.c',
>   	'intel_cmds_info.c',
> +	'intel_common.c',
>   	'intel_compute.c',
>   	'intel_compute_square_kernels.c',
>   	'intel_ctx.c',
