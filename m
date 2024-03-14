Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12C4C54E68
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 11:06:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365C310FA52;
	Thu, 14 Mar 2024 11:06:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oIL7Ii+6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4326A10FA52
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 11:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710414411; x=1741950411;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ekNUT7eqDdk2UaQd24SL2U0D9BsuCSwdDEIEK1Fv5J0=;
 b=oIL7Ii+6/CJ6nbPioIs1wNonjA9DPARL+rm0643ml1qT99VzsvQ15pH/
 S+HYin0a6zYzkraDI8d4xAojNeZuZWVZErbybxiy3d4HMriafhTSPBq01
 va7yBchkvrsayTGoN7rCh2uZ0HFtUjxJ011ldwf5zXtIayNYNhUwXn9Uf
 gd3+pwo923FsM1kcgej0GjrZnTUDNyJoWGQFRNthSQly4FRlwEL4daWtg
 7OG1ggBCsNSRB0GRpRnrp5dCjNUzxsz2AorNvKqETt1J0jDwD4Egsv8Uf
 QovqAGeb26Q0G0WdWldoaDzLAeMB2rIHKQ+83Xyq6jt12SSCqNpcmzNIQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="30664699"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="30664699"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 04:06:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="16909825"
Received: from unknown (HELO [10.245.244.240]) ([10.245.244.240])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 04:06:49 -0700
Message-ID: <aafe25bd-9463-4e07-8cd9-ff27337d4b9d@intel.com>
Date: Thu, 14 Mar 2024 11:06:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/2] lib/intel_common: Add placeholder for common
 i915 and xe functions
Content-Language: en-GB
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
References: <20240313104520.148338-1-zbigniew.kempczynski@intel.com>
 <20240313104520.148338-2-zbigniew.kempczynski@intel.com>
 <e484330e-d60b-4741-a2d3-7de3eeb6a27f@intel.com>
 <20240314065234.bapdx3plsdndn547@zkempczy-mobl2>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240314065234.bapdx3plsdndn547@zkempczy-mobl2>
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

On 14/03/2024 06:52, Zbigniew Kempczyński wrote:
> On Wed, Mar 13, 2024 at 04:32:53PM +0000, Matthew Auld wrote:
>> On 13/03/2024 10:45, Zbigniew Kempczyński wrote:
>>> Some constructs like querying if device is discrete or getting memory
>>> region origin are common so add new file to place those functions into.
>>>
>>> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>
>>> ---
>>> v2: Add gen12 (integrated + dg1) support in querying is region
>>>       compressible (Matt)
>>>       Small code restructure.
>>> ---
>>>    lib/intel_common.c | 102 +++++++++++++++++++++++++++++++++++++++++++++
>>>    lib/intel_common.h |  25 +++++++++++
>>>    lib/meson.build    |   1 +
>>>    3 files changed, 128 insertions(+)
>>>    create mode 100644 lib/intel_common.c
>>>    create mode 100644 lib/intel_common.h
>>>
>>> diff --git a/lib/intel_common.c b/lib/intel_common.c
>>> new file mode 100644
>>> index 0000000000..4cee70c53a
>>> --- /dev/null
>>> +++ b/lib/intel_common.c
>>> @@ -0,0 +1,102 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2024 Intel Corporation
>>> + */
>>> +
>>> +#include "drmtest.h"
>>> +#include "intel_chipset.h"
>>> +#include "intel_common.h"
>>> +#include "i915/intel_memory_region.h"
>>> +#include "xe/xe_query.h"
>>> +
>>> +/**
>>> + * is_intel_dgfx:
>>> + * @fd: drm fd
>>> + *
>>> + * Check if Intel device opened at @fd is discrete regardless driver (i915/xe).
>>> + *
>>> + * Returns: True if device is Intel discrete, false otherwise
>>> + */
>>> +bool is_intel_dgfx(int fd)
>>> +{
>>> +	return get_intel_driver(fd) == INTEL_DRIVER_XE ? xe_has_vram(fd) :
>>> +							 gem_has_lmem(fd);
>>> +}
>>> +
>>> +/**
>>> + * is_intel_system_region:
>>> + * @fd: drm fd
>>> + * @region: region id
>>> + *
>>> + * Check if @region is system region on @fd opened Intel device.
>>> + *
>>> + * Returns: True if @region is system memory, false otherwise
>>> + */
>>> +bool is_intel_system_region(int fd, uint64_t region)
>>> +{
>>> +	enum intel_driver driver = get_intel_driver(fd);
>>> +	bool is_system;
>>> +
>>> +	if (driver == INTEL_DRIVER_I915) {
>>> +		is_system = IS_SYSTEM_MEMORY_REGION(region);
>>> +	} else {
>>> +		igt_assert_neq(region, 0);
>>> +		is_system = (region == system_memory(fd));
>>> +	}
>>> +
>>> +	return is_system;
>>> +}
>>> +
>>> +/**
>>> + * is_intel_vram_region:
>>> + * @fd: drm fd
>>> + * @region: region id
>>> + *
>>> + * Check if @region is vram (device memory) region on @fd opened Intel device.
>>> + *
>>> + * Returns: True if @region is vram, false otherwise
>>> + */
>>> +bool is_intel_vram_region(int fd, uint64_t region)
>>> +{
>>> +	enum intel_driver driver = get_intel_driver(fd);
>>> +	bool is_vram;
>>> +
>>> +	if (driver == INTEL_DRIVER_I915) {
>>> +		is_vram = IS_DEVICE_MEMORY_REGION(region);
>>> +	} else {
>>> +		igt_assert_neq(region, 0);
>>> +		is_vram = (region & (all_memory_regions(fd) & (~system_memory(fd))));
>>> +	}
>>> +
>>> +	return is_vram;
>>> +}
>>> +
>>> +/**
>>> + * is_intel_region_compressible:
>>> + * @fd: drm fd
>>> + * @region: region id
>>> + *
>>> + * Check if @region is compressible on @fd opened Intel device.
>>> + *
>>> + * Returns: True if @region is compressible, false otherwise
>>> + */
>>> +bool is_intel_region_compressible(int fd, uint64_t region)
>>> +{
>>> +	uint32_t devid = intel_get_drm_devid(fd);
>>> +	bool is_dgfx = is_intel_dgfx(fd);
>>> +	bool has_flatccs = HAS_FLATCCS(devid);
>>> +
>>> +	/* Integrated or DG1 with aux-ccs */
>>> +	if (IS_GEN12(devid) && !has_flatccs)
>>> +		return true;
>>> +
>>> +	/* Integrated Xe2+ supports compression on system memory */
>>> +	if (AT_LEAST_GEN(devid, 20) && !is_dgfx && is_intel_system_region(fd, region))
>>> +		return true;
>>> +
>>> +	/* Discrete supports compression on vram */
>>> +	if (is_dgfx && is_intel_vram_region(fd, region))
>>> +		return true;
>>> +
>>> +	return false;
>>
>> So does pre-gen12 not support aux-ccs ?
> 
> IIRC aux-ccs occured on gen12. I didn't find much information about
> compression on pre-gen12 and I don't see any code in IGT which is
> related to compression on pre-gen12. If I'm wrong we may alter
> this condition later (when appropriate code client will need to
> use it).

For the series,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>


> 
> --
> Zbigniew
> 
>>
>>> +}
>>> diff --git a/lib/intel_common.h b/lib/intel_common.h
>>> new file mode 100644
>>> index 0000000000..924802473b
>>> --- /dev/null
>>> +++ b/lib/intel_common.h
>>> @@ -0,0 +1,25 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2024 Intel Corporation
>>> + */
>>> +
>>> +#ifndef __INTEL_COMMON_H__
>>> +#define __INTEL_COMMON_H__
>>> +
>>> +/**
>>> + * SECTION:intel_common
>>> + * @short_description: i915/xe common library code
>>> + * @title: Intel library
>>> + * @include: intel_common.h
>>> + *
>>> + */
>>> +
>>> +#include <stdbool.h>
>>> +#include <stdint.h>
>>> +
>>> +bool is_intel_dgfx(int fd);
>>> +bool is_intel_system_region(int fd, uint64_t region);
>>> +bool is_intel_vram_region(int fd, uint64_t region);
>>> +bool is_intel_region_compressible(int fd, uint64_t region);
>>> +
>>> +#endif
>>> diff --git a/lib/meson.build b/lib/meson.build
>>> index 6122861d8b..934bac5c67 100644
>>> --- a/lib/meson.build
>>> +++ b/lib/meson.build
>>> @@ -59,6 +59,7 @@ lib_sources = [
>>>    	'intel_bufops.c',
>>>    	'intel_chipset.c',
>>>    	'intel_cmds_info.c',
>>> +	'intel_common.c',
>>>    	'intel_compute.c',
>>>    	'intel_compute_square_kernels.c',
>>>    	'intel_ctx.c',
