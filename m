Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E26FED3F2
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 18:52:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A899710E00E;
	Fri, 24 Apr 2026 18:52:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JV02OiHP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD6B10E00E
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 18:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777056764; x=1808592764;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zdG8/iE7y0DfLEfnPCRvRjTO7yx6JNFSoJ9Y6Z5CdIk=;
 b=JV02OiHPg10HlHFdF8UOqPE4/eXAwuGXxntBRLJ0+D3hxzNlaDuCIGdq
 p6v7kMe94QkSSaPr6RIFFhuLxU55OqtRk37Epml3wIQ4pxZCWb1CfsEfv
 y4poVxoe7+8kJH7OoY/SFfzdKRpYJ1SjwdFHkGWV/5f6AKksNaZcEm8Nh
 jhMn+dgxjFNhnd4ccg2/v0CTb0sC26uekCiv9VNZUWzdrCOfcbgrzP2u1
 wlVKvFVjlGF46mLXh0TmSXn2vxqM+FPnGL/Sk73veP3DGXWccUH6tJ6xP
 xQO1VShjut1n3Z2ZYfa95090GYhWaYTUqbkIcSLju2BM/jL+jKLeZtnM0 w==;
X-CSE-ConnectionGUID: cQtuWgbqTtCCa0xEDPK0DQ==
X-CSE-MsgGUID: VqeKe/ZHTkmoPWCn+lKFuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="78060583"
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="78060583"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 11:52:44 -0700
X-CSE-ConnectionGUID: xrmGwNTqQQi6HFOSVvKaSQ==
X-CSE-MsgGUID: K0PP4OOtREWuhs8Pig1CWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="236990237"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 11:52:41 -0700
Date: Fri, 24 Apr 2026 20:52:20 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: vitaly prosyak <vprosyak@amd.com>
Cc: vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org,
 "Petri Latvala <adrinael@adrinael.net> Arkadiusz Hiler" <arek@hiler.eu>,
 "Ashutosh Dixit <ashutosh.dixit@intel.com> Karthik B S"
 <karthik.b.s@intel.com>, Jesse Zhang <jesse.zhang@amd.com>,
 "Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com> Bhanuprakash Modem"
 <bhanuprakash.modem@gmail.com>
Subject: Re: [PATCH 1/2] lib: Add generic platform filtering framework with
 AMD backend
Message-ID: <20260424185220.ikmsxe4ezgfbjwo7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly prosyak <vprosyak@amd.com>, vitaly.prosyak@amd.com,
 igt-dev@lists.freedesktop.org,
 "Petri Latvala <adrinael@adrinael.net> Arkadiusz Hiler" <arek@hiler.eu>,
 "Ashutosh Dixit <ashutosh.dixit@intel.com> Karthik B S"
 <karthik.b.s@intel.com>, Jesse Zhang <jesse.zhang@amd.com>,
 "Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com> Bhanuprakash Modem"
 <bhanuprakash.modem@gmail.com>
References: <20260423031204.5033-1-vitaly.prosyak@amd.com>
 <a7596ecc-d186-4623-acd7-50cf1573acea@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a7596ecc-d186-4623-acd7-50cf1573acea@amd.com>
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

Hi vitaly,
On 2026-04-24 at 13:18:15 -0400, vitaly prosyak wrote:
> Hi all,
> 
> Following up on the platform filtering work and based on the feedback from and earlier discussion with Jani, I’ve reworked the approach to start from a generic IGT framework, with AMD as the first backend implementation.
> 
> The current version separates the core filtering logic from vendor-specific parts via a pluggable backend interface, so the same infrastructure can be reused by other vendors (Intel, etc.) while keeping their platform data isolated.
> 
> These patches also allow us to immediately exercise and validate the feature on the AMD backend, which helps test the framework in a real CI environment while the design is still evolving.
> 
> I would really appreciate a review of this direction, specifically:
> 
>   * Does the generic framework + per-vendor backend split make sense for IGT?
>   * Is the proposed API (platform_filter_ops, config handling, etc.) aligned with IGT expectations?
>   * Any suggestions before expanding this further or adding additional backends?
> 
> The goal at this stage is not to finalize everything, but to establish a reasonable generic foundation and validate the design direction early.
> 
> Thanks a lot for your time — any feedback is very welcome.
> 
> BR,
> Vitaly
> 

Thank you for your effort, could you split it up into smaller pieces?
Also, could you use cover letter and describe there how to use,
what is a usecase, how the workflow in CI will look?
It could help to have one example script for running
few core tests, so they could be tested on other hardware,
not only on AMDGPU.

And last, I will be off early on next week so please give me
and others two or three weeks for full reply.

Regards,
Kamil

> 
> On 2026-04-22 23:10, vitaly.prosyak@amd.com wrote:
> > From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> >
> > Add vendor-agnostic platform filtering system to IGT, with AMD as the
> > first backend implementation. This addresses the need for platform-based
> > test skipping while keeping the framework generic and extensible.
> >
> > Design Philosophy:
> >
> > This implementation follows a "generic first" approach. The core filtering
> > infrastructure is completely vendor-neutral, with vendor-specific logic
> > isolated in pluggable backends via callback operations.
> >
> > Per feedback from Jani Nikula: "I would have expected an attempt to make
> > an IGT shared filtering system generic enough to plug into any vendor's
> > platforms." This design directly addresses that by:
> >
> > 1. Separating generic infrastructure from vendor-specific implementation
> > 2. Making vendor backends pluggable via platform_filter_ops callbacks
> > 3. Providing a clear path for Intel, NVIDIA, and other vendors
> > 4. Reusing common logic (config parsing, env var, priority system)
> >
> > Architecture:
> >
> > Generic Framework (lib/igt_platform_filter.c/h):
> > - Vendor-agnostic filtering infrastructure
> > - Three-tier priority system (built-in, config file, env variable)
> > - Config file parsing (/etc/igt/platform_skip.conf)
> > - Environment variable parsing (IGT_PLATFORM_SKIP_CONFIG)
> > - Generic skip entry structures
> > - Dump functionality
> >
> > AMD Backend (lib/amdgpu/amd_platform.c/h):
> > - AMD-specific ASIC identification (family/chip ranges)
> > - Integration with amdgpu_asic_addr.h definitions
> > - AMD built-in skip rules
> > - ASIC table mapping (navi48, navi10, etc.)
> >
> > Three-Tier Priority System:
> >
> > 1. Built-in array (highest priority, vendor-specific, requires rebuild)
> >    Retrieved via vendor ops->get_builtin_rules()
> >
> > 2. Config file /etc/igt/platform_skip.conf (development, no rebuild)
> >    Format: platform:test:subtest:reason
> >    Works for all vendors
> >
> > 3. Environment variable IGT_PLATFORM_SKIP_CONFIG (runtime, no rebuild)
> >    Same format, semicolon-separated entries
> >
> > Vendor Backend Interface:
> >
> > struct platform_filter_ops {
> >     const char *name;
> >     const char *(*get_platform_name)(const void *platform_info);
> >     bool (*match_platform)(const void *info, const void *data);
> >     bool (*parse_platform_config)(const char *str, void **data_out);
> >     const struct platform_skip_entry *(*get_builtin_rules)(int *count);
> >     void (*dump_platform_data)(const void *data);
> > };
> >
> > Why AMD-Specific Parts Remain:
> >
> > - ASIC family/chip ranges (amdgpu_asic_addr.h definitions)
> > - GPU identification logic (family_id, chip_rev matching)
> > - AMD-specific built-in skip rules
> > - ASIC name table (navi48, arcturus, etc.)
> >
> > All AMD-specific code is isolated in lib/amdgpu/amd_platform.c and
> > accessed through generic callbacks. The core framework has zero
> > AMD-specific knowledge.
> >
> > Path to Genericization for Other Vendors:
> >
> > To add Intel support:
> > 1. Create lib/i915/intel_platform.c/h
> > 2. Implement platform_filter_ops callbacks
> > 3. Define Intel platform data (e.g., platform_id, stepping ranges)
> > 4. Use in Intel tests via intel_platform_filter_init()
> >
> > Same pattern applies for NVIDIA, Qualcomm, or any future vendor.
> >
> > Usage in Tests:
> >
> > AMD tests:
> >     amd_platform_filter_init(&gpu_info);
> >     igt_platform_require(igt_test_name(), "my-test");
> >
> > Future Intel tests:
> >     intel_platform_filter_init(&dev_info);
> >     igt_platform_require(igt_test_name(), "my-test");
> >
> > Implementation Details:
> >
> > - No global variables
> > - All state in struct platform_filter_context
> > - Context accessed via get_filter_context()
> > - Vendor backend data stored as void* (vendor interprets)
> >
> > Benefits:
> >
> > - Generic infrastructure reused across all vendors
> > - Consistent user experience (same config format, env var for all)
> > - Clear separation between generic and vendor-specific code
> > - Easy to add new vendor backends
> > - AMD serves as reference implementation
> >
> > Files Added:
> > - lib/igt_platform_filter.h - Generic framework API
> > - lib/igt_platform_filter.c - Generic implementation
> > - lib/amdgpu/amd_platform.h - AMD backend API
> > - lib/amdgpu/amd_platform.c - AMD backend implementation
> >
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Jesse Zhang <jesse.zhang@amd.com>
> > Cc: Christian König <christian.koenig@amd.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> > Reviewed-by: Jesse Zhang <jesse.zhang@amd.com>
> > ---
> >  lib/amdgpu/amd_platform.c | 318 ++++++++++++++++++++++++
> >  lib/amdgpu/amd_platform.h |  53 ++++
> >  lib/igt_platform_filter.c | 498 ++++++++++++++++++++++++++++++++++++++
> >  lib/igt_platform_filter.h | 196 +++++++++++++++
> >  lib/meson.build           |   2 +
> >  5 files changed, 1067 insertions(+)
> >  create mode 100644 lib/amdgpu/amd_platform.c
> >  create mode 100644 lib/amdgpu/amd_platform.h
> >  create mode 100644 lib/igt_platform_filter.c
> >  create mode 100644 lib/igt_platform_filter.h
> >
> > diff --git a/lib/amdgpu/amd_platform.c b/lib/amdgpu/amd_platform.c
> > new file mode 100644
> > index 000000000..73314a1f6
> > --- /dev/null
> > +++ b/lib/amdgpu/amd_platform.c
> > @@ -0,0 +1,318 @@
> > +/* SPDX-License-Identifier: MIT
> > + * Copyright 2026 Advanced Micro Devices, Inc.
> > + *
> > + * AMD-specific platform filtering backend
> > + *
> > + * This file implements AMD-specific platform filtering logic that plugs
> > + * into the generic IGT platform filter framework. It handles ASIC
> > + * identification, family/chip ranges, and AMD built-in skip rules.
> > + */
> > +
> > +#include <stdlib.h>
> > +#include <string.h>
> > +#include <strings.h>
> > +
> > +#include "igt.h"
> > +#include "igt_platform_filter.h"
> > +#include "amd_platform.h"
> > +#include "amdgpu_asic_addr.h"
> > +
> > +/**
> > + * AMD platform data structures
> > + *
> > + * These structures define how AMD ASICs are matched for filtering.
> > + * They use family/chip ranges similar to amd_queue_reset.c
> > + */
> > +
> > +/* Maximum ASIC family ranges per skip entry */
> > +#define MAX_ASIC_RANGES 4
> > +
> > +/**
> > + * struct amd_asic_range - ASIC family range for matching
> > + *
> > + * Similar to struct used in amd_queue_reset.c for defining ASIC ranges.
> > + * Uses definitions from amdgpu_asic_addr.h
> > + */
> > +struct amd_asic_range {
> > +	int family_id;      /* FAMILY_NV, FAMILY_GFX1200, etc. */
> > +	int chip_id_min;    /* Min chip revision */
> > +	int chip_id_max;    /* Max chip revision */
> > +};
> > +
> > +/**
> > + * struct amd_platform_data - AMD platform matching data
> > + *
> > + * This is stored in platform_skip_entry->platform_data field.
> > + * Contains array of ASIC ranges to match against.
> > + */
> > +struct amd_platform_data {
> > +	struct amd_asic_range ranges[MAX_ASIC_RANGES];
> > +	int num_ranges;
> > +};
> > +
> > +/* ASIC name to family/chip mapping table */
> > +struct asic_info {
> > +	const char *name;
> > +	int family_id;
> > +	int chip_id_min;
> > +	int chip_id_max;
> > +};
> > +
> > +static const struct asic_info asic_table[] = {
> > +	/* GFX12 - using ranges from amdgpu_asic_addr.h */
> > +	{ "navi48", FAMILY_GFX1200, AMDGPU_GFX1200_RANGE },
> > +	{ "navi44", FAMILY_GFX1200, AMDGPU_GFX1200_RANGE },
> > +
> > +	/* GFX11.5 */
> > +	{ "gfx1150", FAMILY_GFX1150, AMDGPU_GFX1150_RANGE },
> > +	{ "gfx1151", FAMILY_GFX1150, AMDGPU_GFX1151_RANGE },
> > +	{ "gfx1152", FAMILY_GFX1150, AMDGPU_GFX1152_RANGE },
> > +	{ "gfx1153", FAMILY_GFX1150, AMDGPU_GFX1153_RANGE },
> > +
> > +	/* GFX11 */
> > +	{ "gfx1100", FAMILY_GFX1100, AMDGPU_GFX1100_RANGE },
> > +	{ "gfx1101", FAMILY_GFX1100, AMDGPU_GFX1101_RANGE },
> > +	{ "gfx1102", FAMILY_GFX1100, AMDGPU_GFX1102_RANGE },
> > +	{ "gfx1103_r1", FAMILY_GFX1103, AMDGPU_GFX1103_R1_RANGE },
> > +	{ "gfx1103_r2", FAMILY_GFX1103, AMDGPU_GFX1103_R2_RANGE },
> > +	{ "navi31", FAMILY_GFX1100, AMDGPU_GFX1100_RANGE },
> > +	{ "navi32", FAMILY_GFX1100, AMDGPU_GFX1101_RANGE },
> > +	{ "navi33", FAMILY_GFX1100, AMDGPU_GFX1102_RANGE },
> > +
> > +	/* GFX10.3 */
> > +	{ "sienna_cichlid", FAMILY_NV, AMDGPU_SIENNA_CICHLID_RANGE },
> > +	{ "navy_flounder", FAMILY_NV, AMDGPU_NAVY_FLOUNDER_RANGE },
> > +	{ "dimgrey_cavefish", FAMILY_NV, AMDGPU_DIMGREY_CAVEFISH_RANGE },
> > +	{ "beige_goby", FAMILY_NV, AMDGPU_BEIGE_GOBY_RANGE },
> > +	{ "yellow_carp", FAMILY_YC, AMDGPU_YELLOW_CARP_RANGE },
> > +	{ "vangogh", FAMILY_VGH, AMDGPU_VANGOGH_RANGE },
> > +
> > +	/* GFX10 */
> > +	{ "navi10", FAMILY_NV, AMDGPU_NAVI10_RANGE },
> > +	{ "navi12", FAMILY_NV, AMDGPU_NAVI12_RANGE },
> > +	{ "navi14", FAMILY_NV, AMDGPU_NAVI14_RANGE },
> > +	{ "navi21", FAMILY_NV, AMDGPU_SIENNA_CICHLID_RANGE },
> > +	{ "navi22", FAMILY_NV, AMDGPU_NAVY_FLOUNDER_RANGE },
> > +	{ "navi23", FAMILY_NV, AMDGPU_DIMGREY_CAVEFISH_RANGE },
> > +	{ "navi24", FAMILY_NV, AMDGPU_BEIGE_GOBY_RANGE },
> > +
> > +	/* CDNA */
> > +	{ "arcturus", FAMILY_AI, AMDGPU_ARCTURUS_RANGE },
> > +	{ "aldebaran", FAMILY_AI, AMDGPU_ALDEBARAN_RANGE },
> > +
> > +	/* GFX9 */
> > +	{ "vega10", FAMILY_AI, AMDGPU_VEGA10_RANGE },
> > +	{ "vega12", FAMILY_AI, AMDGPU_VEGA12_RANGE },
> > +	{ "vega20", FAMILY_AI, AMDGPU_VEGA20_RANGE },
> > +	{ "raven", FAMILY_RV, AMDGPU_RAVEN_RANGE },
> > +	{ "raven2", FAMILY_RV, AMDGPU_RAVEN2_RANGE },
> > +	{ "renoir", FAMILY_RV, AMDGPU_RENOIR_RANGE },
> > +
> > +	/* GFX8 (VI/Polaris) */
> > +	{ "polaris10", FAMILY_VI, AMDGPU_POLARIS10_RANGE },
> > +	{ "polaris11", FAMILY_VI, AMDGPU_POLARIS11_RANGE },
> > +	{ "polaris12", FAMILY_VI, AMDGPU_POLARIS12_RANGE },
> > +	{ "fiji", FAMILY_VI, AMDGPU_FIJI_RANGE },
> > +	{ "tonga", FAMILY_VI, AMDGPU_TONGA_RANGE },
> > +	{ "iceland", FAMILY_VI, AMDGPU_ICELAND_RANGE },
> > +	{ "carrizo", FAMILY_CZ, AMDGPU_CARRIZO_RANGE },
> > +	{ "stoney", FAMILY_CZ, AMDGPU_STONEY_RANGE },
> > +
> > +	{ NULL, 0, 0, 0 }
> > +};
> > +
> > +/* Helper: Get ASIC info by name (case-insensitive) */
> > +static const struct asic_info *get_asic_info(const char *name)
> > +{
> > +	const struct asic_info *info;
> > +
> > +	if (!name)
> > +		return NULL;
> > +
> > +	for (info = asic_table; info->name; info++) {
> > +		if (strcasecmp(info->name, name) == 0)
> > +			return info;
> > +	}
> > +	return NULL;
> > +}
> > +
> > +/* Helper: Get ASIC name by family/chip */
> > +static const char *get_asic_name(int family_id, int chip_rev)
> > +{
> > +	const struct asic_info *info;
> > +
> > +	for (info = asic_table; info->name; info++) {
> > +		if (info->family_id == family_id &&
> > +		    chip_rev >= info->chip_id_min &&
> > +		    chip_rev < info->chip_id_max)
> > +			return info->name;
> > +	}
> > +	return "unknown";
> > +}
> > +
> > +/* ================================================================
> > + * AMD PLATFORM FILTER OPS IMPLEMENTATION
> > + * ================================================================ */
> > +
> > +static const char *amd_get_platform_name(const void *platform_info)
> > +{
> > +	const struct amdgpu_gpu_info *gpu_info = platform_info;
> > +
> > +	if (!gpu_info)
> > +		return "unknown";
> > +
> > +	return get_asic_name(gpu_info->family_id, gpu_info->chip_rev);
> > +}
> > +
> > +static bool amd_match_platform(const void *platform_info, const void *platform_data)
> > +{
> > +	const struct amdgpu_gpu_info *gpu_info = platform_info;
> > +	const struct amd_platform_data *amd_data = platform_data;
> > +	int i;
> > +
> > +	if (!gpu_info || !amd_data)
> > +		return false;
> > +
> > +	/* If no ranges specified, match all platforms */
> > +	if (amd_data->num_ranges == 0)
> > +		return true;
> > +
> > +	/* Check if GPU matches any of the ASIC ranges */
> > +	for (i = 0; i < amd_data->num_ranges && i < MAX_ASIC_RANGES; i++) {
> > +		if (amd_data->ranges[i].family_id == gpu_info->family_id) {
> > +			int chip_rev = gpu_info->chip_rev;
> > +			if (chip_rev >= amd_data->ranges[i].chip_id_min &&
> > +			    chip_rev < amd_data->ranges[i].chip_id_max) {
> > +				return true;
> > +			}
> > +		}
> > +	}
> > +
> > +	return false;
> > +}
> > +
> > +static bool amd_parse_platform_config(const char *platform_str, void **platform_data_out)
> > +{
> > +	const struct asic_info *info;
> > +	struct amd_platform_data *amd_data;
> > +
> > +	info = get_asic_info(platform_str);
> > +	if (!info) {
> > +		igt_warn("Unknown AMD ASIC name: %s\n", platform_str);
> > +		return false;
> > +	}
> > +
> > +	amd_data = malloc(sizeof(*amd_data));
> > +	if (!amd_data)
> > +		return false;
> > +
> > +	memset(amd_data, 0, sizeof(*amd_data));
> > +	amd_data->ranges[0].family_id = info->family_id;
> > +	amd_data->ranges[0].chip_id_min = info->chip_id_min;
> > +	amd_data->ranges[0].chip_id_max = info->chip_id_max;
> > +	amd_data->num_ranges = 1;
> > +
> > +	*platform_data_out = amd_data;
> > +	return true;
> > +}
> > +
> > +static void amd_dump_platform_data(const void *platform_data)
> > +{
> > +	const struct amd_platform_data *amd_data = platform_data;
> > +	int i;
> > +
> > +	if (!amd_data) {
> > +		printf("(all platforms)");
> > +		return;
> > +	}
> > +
> > +	for (i = 0; i < amd_data->num_ranges && i < MAX_ASIC_RANGES; i++) {
> > +		if (i > 0)
> > +			printf(", ");
> > +		printf("{0x%02X, 0x%02X-0x%02X}",
> > +		       amd_data->ranges[i].family_id,
> > +		       amd_data->ranges[i].chip_id_min,
> > +		       amd_data->ranges[i].chip_id_max);
> > +	}
> > +}
> > +
> > +/* ================================================================
> > + * AMD BUILT-IN SKIP RULES
> > + * ================================================================
> > + *
> > + * These are production skip rules. They are checked FIRST before
> > + * config file or environment variable.
> > + *
> > + * To add a skip rule:
> > + * 1. Define platform data with ASIC ranges
> > + * 2. Add entry to builtin_skip_table[]
> > + * 3. Rebuild IGT
> > + *
> > + * Example formats (uncomment to use):
> > + *
> > + * Single ASIC:
> > + *   static struct amd_platform_data navi44_data = {
> > + *       .ranges = { {FAMILY_GFX1200, AMDGPU_GFX1200_RANGE} },
> > + *       .num_ranges = 1
> > + *   };
> > + *   { "amd_basic", "*-UMQ", "UMQ not supported on Navi44", &navi44_data },
> > + *
> > + * Multiple ASICs:
> > + *   static struct amd_platform_data navi10_12_14_data = {
> > + *       .ranges = {
> > + *           {FAMILY_NV, AMDGPU_NAVI10_RANGE},
> > + *           {FAMILY_NV, AMDGPU_NAVI12_RANGE},
> > + *           {FAMILY_NV, AMDGPU_NAVI14_RANGE}
> > + *       },
> > + *       .num_ranges = 3
> > + *   };
> > + *   { "amd_userq_abort", "*", "Queue reset unstable", &navi10_12_14_data },
> > + *
> > + * All platforms (no platform restriction):
> > + *   { "test_name", "subtest", "reason", NULL },
> > + */
> > +
> > +static const struct platform_skip_entry builtin_skip_table[] = {
> > +	/* Add production skip rules here */
> > +
> > +	/* Sentinel */
> > +	{}
> > +};
> > +
> > +static const struct platform_skip_entry *amd_get_builtin_rules(int *count_out)
> > +{
> > +	int count = 0;
> > +
> > +	/* Count entries (stop at sentinel) */
> > +	while (builtin_skip_table[count].test_name ||
> > +	       builtin_skip_table[count].subtest_glob ||
> > +	       builtin_skip_table[count].reason)
> > +		count++;
> > +
> > +	*count_out = count;
> > +	return builtin_skip_table;
> > +}
> > +
> > +/* AMD platform filter operations */
> > +static const struct platform_filter_ops amd_platform_ops = {
> > +	.name = "amd",
> > +	.get_platform_name = amd_get_platform_name,
> > +	.match_platform = amd_match_platform,
> > +	.parse_platform_config = amd_parse_platform_config,
> > +	.get_builtin_rules = amd_get_builtin_rules,
> > +	.dump_platform_data = amd_dump_platform_data,
> > +};
> > +
> > +/* ================================================================
> > + * PUBLIC API
> > + * ================================================================ */
> > +
> > +const struct platform_filter_ops *amd_platform_get_ops(void)
> > +{
> > +	return &amd_platform_ops;
> > +}
> > +
> > +void amd_platform_filter_init(const struct amdgpu_gpu_info *gpu_info)
> > +{
> > +	igt_platform_filter_init(&amd_platform_ops, gpu_info);
> > +}
> > diff --git a/lib/amdgpu/amd_platform.h b/lib/amdgpu/amd_platform.h
> > new file mode 100644
> > index 000000000..570ea7d75
> > --- /dev/null
> > +++ b/lib/amdgpu/amd_platform.h
> > @@ -0,0 +1,53 @@
> > +/* SPDX-License-Identifier: MIT
> > + * Copyright 2026 Advanced Micro Devices, Inc.
> > + */
> > +
> > +#ifndef AMD_PLATFORM_H
> > +#define AMD_PLATFORM_H
> > +
> > +#include "igt_platform_filter.h"
> > +#include "amd_ip_blocks.h"
> > +
> > +/**
> > + * SECTION: amd_platform
> > + * @short_description: AMD-specific platform filtering backend
> > + * @title: AMD Platform
> > + * @include: amd_platform.h
> > + *
> > + * AMD implementation of platform filtering that plugs into the generic
> > + * IGT platform filter framework.
> > + *
> > + * This backend provides:
> > + * - ASIC identification and matching based on family/chip ranges
> > + * - Built-in skip rules for AMD GPUs
> > + * - Integration with amdgpu_asic_addr.h definitions
> > + *
> > + * Usage in AMD tests:
> > + *   igt_fixture() {
> > + *       setup_amdgpu_ip_blocks(...);
> > + *       amd_platform_filter_init(&gpu_info);
> > + *   }
> > + *
> > + *   igt_subtest("my-test") {
> > + *       igt_platform_require(igt_test_name(), "my-test");
> > + *       // test code
> > + *   }
> > + */
> > +
> > +/**
> > + * amd_platform_filter_init - Initialize AMD platform filtering
> > + * @gpu_info: AMDGPU GPU information structure
> > + *
> > + * Convenience wrapper that initializes the generic platform filter
> > + * with AMD-specific operations and GPU info.
> > + */
> > +void amd_platform_filter_init(const struct amdgpu_gpu_info *gpu_info);
> > +
> > +/**
> > + * amd_platform_get_ops - Get AMD platform filter operations
> > + *
> > + * Returns: AMD platform_filter_ops structure
> > + */
> > +const struct platform_filter_ops *amd_platform_get_ops(void);
> > +
> > +#endif /* AMD_PLATFORM_H */
> > diff --git a/lib/igt_platform_filter.c b/lib/igt_platform_filter.c
> > new file mode 100644
> > index 000000000..78744f3ef
> > --- /dev/null
> > +++ b/lib/igt_platform_filter.c
> > @@ -0,0 +1,498 @@
> > +/* SPDX-License-Identifier: MIT
> > + * Copyright 2026 Advanced Micro Devices, Inc.
> > + *
> > + * Generic platform-based test filtering framework
> > + *
> > + * This is a vendor-agnostic filtering system. Vendor-specific logic
> > + * is implemented via platform_filter_ops callbacks.
> > + */
> > +
> > +#include <fnmatch.h>
> > +#include <stdio.h>
> > +#include <stdlib.h>
> > +#include <string.h>
> > +#include <ctype.h>
> > +
> > +#include "igt.h"
> > +#include "igt_platform_filter.h"
> > +
> > +/* Maximum entries from config file and env variable */
> > +#define MAX_CONFIG_ENTRIES 256
> > +#define MAX_ENV_ENTRIES 128
> > +#define MAX_LINE_LENGTH 512
> > +
> > +/* Filter context - holds all runtime state (no globals) */
> > +struct platform_filter_context {
> > +	const struct platform_filter_ops *ops;
> > +	const void *platform_info;
> > +
> > +	struct platform_skip_entry config_entries[MAX_CONFIG_ENTRIES];
> > +	int config_entry_count;
> > +
> > +	struct platform_skip_entry env_entries[MAX_ENV_ENTRIES];
> > +	int env_entry_count;
> > +
> > +	bool initialized;
> > +	char current_platform_name[64];
> > +};
> > +
> > +/* Single static instance - initialized on first use */
> > +static struct platform_filter_context *get_filter_context(void)
> > +{
> > +	static struct platform_filter_context ctx = {0};
> > +	return &ctx;
> > +}
> > +
> > +/* ================================================================
> > + * HELPER FUNCTIONS
> > + * ================================================================ */
> > +
> > +/* Helper: Trim whitespace from string */
> > +static char *trim(char *str)
> > +{
> > +	char *end;
> > +
> > +	while (isspace(*str))
> > +		str++;
> > +
> > +	if (*str == 0)
> > +		return str;
> > +
> > +	end = str + strlen(str) - 1;
> > +	while (end > str && isspace(*end))
> > +		end--;
> > +
> > +	*(end + 1) = 0;
> > +	return str;
> > +}
> > +
> > +/* Helper: Match wildcard or exact string */
> > +static bool match_string(const char *pattern, const char *str)
> > +{
> > +	if (!pattern || !str)
> > +		return false;
> > +
> > +	if (strcmp(pattern, "*") == 0)
> > +		return true;
> > +
> > +	return fnmatch(pattern, str, 0) == 0;
> > +}
> > +
> > +/* Helper: Check if entry matches platform/test/subtest */
> > +static bool entry_matches(const struct platform_filter_context *ctx,
> > +                          const struct platform_skip_entry *entry,
> > +                          const char *test_name,
> > +                          const char *subtest_name)
> > +{
> > +	/* Check platform match using vendor callback */
> > +	if (entry->platform_data && ctx->ops->match_platform) {
> > +		if (!ctx->ops->match_platform(ctx->platform_info, entry->platform_data))
> > +			return false;
> > +	}
> > +
> > +	/* Check test name match */
> > +	if (entry->test_name && strcmp(entry->test_name, "*") != 0) {
> > +		if (!test_name || !match_string(entry->test_name, test_name))
> > +			return false;
> > +	}
> > +
> > +	/* Check subtest glob match */
> > +	if (entry->subtest_glob && strcmp(entry->subtest_glob, "*") != 0) {
> > +		if (!subtest_name || !match_string(entry->subtest_glob, subtest_name))
> > +			return false;
> > +	}
> > +
> > +	return true;
> > +}
> > +
> > +/* ================================================================
> > + * CONFIG FILE PARSER (/etc/igt/platform_skip.conf)
> > + * ================================================================ */
> > +
> > +/* Parse one line from config file */
> > +static bool parse_config_line(struct platform_filter_context *ctx,
> > +                               char *line,
> > +                               struct platform_skip_entry *entry)
> > +{
> > +	char *platform, *test, *subtest, *reason;
> > +
> > +	/* Skip comments and empty lines */
> > +	line = trim(line);
> > +	if (line[0] == '#' || line[0] == 0)
> > +		return false;
> > +
> > +	/* Format: platform:test:subtest:reason */
> > +	platform = strtok(line, ":");
> > +	test = strtok(NULL, ":");
> > +	subtest = strtok(NULL, ":");
> > +	reason = strtok(NULL, "\n");
> > +
> > +	if (!platform || !test || !subtest) {
> > +		igt_warn("Invalid config line format (expected platform:test:subtest:reason)\n");
> > +		return false;
> > +	}
> > +
> > +	/* Allocate and copy strings */
> > +	entry->test_name = strdup(trim(test));
> > +	entry->subtest_glob = strdup(trim(subtest));
> > +	entry->reason = reason ? strdup(trim(reason)) : strdup("No reason");
> > +
> > +	/* Parse platform using vendor callback */
> > +	platform = trim(platform);
> > +	if (strcmp(platform, "*") == 0) {
> > +		/* Wildcard - no platform restriction */
> > +		entry->platform_data = NULL;
> > +	} else if (ctx->ops->parse_platform_config) {
> > +		if (!ctx->ops->parse_platform_config(platform, &entry->platform_data)) {
> > +			igt_warn("Failed to parse platform: %s\n", platform);
> > +			free((void *)entry->test_name);
> > +			free((void *)entry->subtest_glob);
> > +			free((void *)entry->reason);
> > +			return false;
> > +		}
> > +	} else {
> > +		entry->platform_data = NULL;
> > +	}
> > +
> > +	return true;
> > +}
> > +
> > +/* Load config file */
> > +static void load_config_file(struct platform_filter_context *ctx, const char *filename)
> > +{
> > +	FILE *f;
> > +	char line[MAX_LINE_LENGTH];
> > +
> > +	f = fopen(filename, "r");
> > +	if (!f) {
> > +		igt_debug("Config file not found: %s\n", filename);
> > +		return;
> > +	}
> > +
> > +	igt_info("Loading platform skip config from: %s\n", filename);
> > +
> > +	while (fgets(line, sizeof(line), f)) {
> > +		if (ctx->config_entry_count >= MAX_CONFIG_ENTRIES) {
> > +			igt_warn("Config file has too many entries (max %d)\n",
> > +			         MAX_CONFIG_ENTRIES);
> > +			break;
> > +		}
> > +
> > +		if (parse_config_line(ctx, line, &ctx->config_entries[ctx->config_entry_count])) {
> > +			ctx->config_entry_count++;
> > +		}
> > +	}
> > +
> > +	fclose(f);
> > +	igt_info("Loaded %d skip rules from config file\n", ctx->config_entry_count);
> > +}
> > +
> > +/* ================================================================
> > + * ENVIRONMENT VARIABLE PARSER (IGT_PLATFORM_SKIP_CONFIG)
> > + * ================================================================ */
> > +
> > +/* Parse environment variable entries (semicolon-separated) */
> > +static void load_env_variable(struct platform_filter_context *ctx)
> > +{
> > +	char *env, *env_copy, *entry_str, *saveptr;
> > +	const char *env_value;
> > +
> > +	env_value = getenv("IGT_PLATFORM_SKIP_CONFIG");
> > +	if (!env_value || env_value[0] == 0) {
> > +		igt_debug("IGT_PLATFORM_SKIP_CONFIG not set\n");
> > +		return;
> > +	}
> > +
> > +	igt_info("Loading platform skip config from IGT_PLATFORM_SKIP_CONFIG\n");
> > +
> > +	env_copy = strdup(env_value);
> > +	env = env_copy;
> > +
> > +	/* Parse semicolon-separated entries */
> > +	while ((entry_str = strtok_r(env, ";", &saveptr)) != NULL) {
> > +		env = NULL; /* For subsequent strtok_r calls */
> > +
> > +		if (ctx->env_entry_count >= MAX_ENV_ENTRIES) {
> > +			igt_warn("Too many env variable entries (max %d)\n",
> > +			         MAX_ENV_ENTRIES);
> > +			break;
> > +		}
> > +
> > +		if (parse_config_line(ctx, entry_str, &ctx->env_entries[ctx->env_entry_count])) {
> > +			ctx->env_entry_count++;
> > +		}
> > +	}
> > +
> > +	free(env_copy);
> > +	igt_info("Loaded %d skip rules from environment variable\n", ctx->env_entry_count);
> > +}
> > +
> > +/* ================================================================
> > + * PUBLIC API IMPLEMENTATION
> > + * ================================================================ */
> > +
> > +void igt_platform_filter_init(const struct platform_filter_ops *ops,
> > +                               const void *platform_info)
> > +{
> > +	struct platform_filter_context *ctx = get_filter_context();
> > +
> > +	if (ctx->initialized)
> > +		return;
> > +
> > +	if (!ops) {
> > +		igt_warn("Platform filter ops is NULL, filtering disabled\n");
> > +		return;
> > +	}
> > +
> > +	ctx->ops = ops;
> > +	ctx->platform_info = platform_info;
> > +
> > +	igt_info("Initializing platform filter system (3-tier priority) for vendor: %s\n",
> > +	         ops->name ? ops->name : "unknown");
> > +
> > +	/* Get current platform name */
> > +	if (ops->get_platform_name) {
> > +		const char *pname = ops->get_platform_name(platform_info);
> > +		snprintf(ctx->current_platform_name, sizeof(ctx->current_platform_name),
> > +		         "%s", pname ? pname : "unknown");
> > +	}
> > +
> > +	/* Priority 1: Built-in array (vendor-specific) */
> > +	igt_debug("  Priority 1: Built-in array (vendor-specific)\n");
> > +
> > +	/* Priority 2: Config file */
> > +	igt_debug("  Priority 2: Config file /etc/igt/platform_skip.conf\n");
> > +	load_config_file(ctx, "/etc/igt/platform_skip.conf");
> > +
> > +	/* Priority 3: Environment variable */
> > +	igt_debug("  Priority 3: Environment variable IGT_PLATFORM_SKIP_CONFIG\n");
> > +	load_env_variable(ctx);
> > +
> > +	ctx->initialized = true;
> > +	igt_info("Platform filter initialization complete\n");
> > +}
> > +
> > +bool igt_platform_should_skip(const char *test_name,
> > +                               const char *subtest_name,
> > +                               enum skip_source *source,
> > +                               const char **reason)
> > +{
> > +	struct platform_filter_context *ctx = get_filter_context();
> > +	const struct platform_skip_entry *entry;
> > +	int i, count;
> > +
> > +	if (!ctx->initialized) {
> > +		igt_warn("Platform filter not initialized\n");
> > +		if (source)
> > +			*source = SKIP_SOURCE_NONE;
> > +		if (reason)
> > +			*reason = NULL;
> > +		return false;
> > +	}
> > +
> > +	/* Priority 1: Check built-in array FIRST */
> > +	if (ctx->ops->get_builtin_rules) {
> > +		const struct platform_skip_entry *builtin = ctx->ops->get_builtin_rules(&count);
> > +		for (i = 0; i < count; i++) {
> > +			entry = &builtin[i];
> > +			if (entry_matches(ctx, entry, test_name, subtest_name)) {
> > +				if (source)
> > +					*source = SKIP_SOURCE_BUILTIN;
> > +				if (reason)
> > +					*reason = entry->reason;
> > +				igt_debug("Skip (built-in): %s:%s - %s\n",
> > +				          entry->test_name ? entry->test_name : "*",
> > +				          entry->subtest_glob ? entry->subtest_glob : "*",
> > +				          entry->reason ? entry->reason : "no reason");
> > +				return true;
> > +			}
> > +		}
> > +	}
> > +
> > +	/* Priority 2: Check config file */
> > +	for (i = 0; i < ctx->config_entry_count; i++) {
> > +		entry = &ctx->config_entries[i];
> > +		if (entry_matches(ctx, entry, test_name, subtest_name)) {
> > +			if (source)
> > +				*source = SKIP_SOURCE_CONFIG;
> > +			if (reason)
> > +				*reason = entry->reason;
> > +			igt_debug("Skip (config): %s:%s - %s\n",
> > +			          entry->test_name, entry->subtest_glob, entry->reason);
> > +			return true;
> > +		}
> > +	}
> > +
> > +	/* Priority 3: Check environment variable */
> > +	for (i = 0; i < ctx->env_entry_count; i++) {
> > +		entry = &ctx->env_entries[i];
> > +		if (entry_matches(ctx, entry, test_name, subtest_name)) {
> > +			if (source)
> > +				*source = SKIP_SOURCE_ENV;
> > +			if (reason)
> > +				*reason = entry->reason;
> > +			igt_debug("Skip (env): %s:%s - %s\n",
> > +			          entry->test_name, entry->subtest_glob, entry->reason);
> > +			return true;
> > +		}
> > +	}
> > +
> > +	if (source)
> > +		*source = SKIP_SOURCE_NONE;
> > +	if (reason)
> > +		*reason = NULL;
> > +	return false;
> > +}
> > +
> > +void igt_platform_require(const char *test_name, const char *subtest_name)
> > +{
> > +	enum skip_source source;
> > +	const char *reason;
> > +
> > +	if (igt_platform_should_skip(test_name, subtest_name, &source, &reason)) {
> > +		const char *source_str;
> > +
> > +		switch (source) {
> > +		case SKIP_SOURCE_BUILTIN:
> > +			source_str = "built-in array";
> > +			break;
> > +		case SKIP_SOURCE_CONFIG:
> > +			source_str = "config file";
> > +			break;
> > +		case SKIP_SOURCE_ENV:
> > +			source_str = "environment variable";
> > +			break;
> > +		default:
> > +			source_str = "unknown";
> > +		}
> > +
> > +		igt_skip("Skipped on this platform [%s]: %s\n",
> > +		         source_str, reason ? reason : "no reason");
> > +	}
> > +}
> > +
> > +void igt_platform_filter_dump(void)
> > +{
> > +	struct platform_filter_context *ctx = get_filter_context();
> > +	const struct platform_skip_entry *entry;
> > +	int i, total_count, count;
> > +
> > +	if (!ctx->initialized) {
> > +		igt_info("Platform filter not initialized\n");
> > +		return;
> > +	}
> > +
> > +	igt_info("\n");
> > +	igt_info("═══════════════════════════════════════════════════════════════════\n");
> > +	igt_info(" PLATFORM SKIP FILTER CONFIGURATION - THREE-TIER PRIORITY SYSTEM\n");
> > +	igt_info("═══════════════════════════════════════════════════════════════════\n\n");
> > +
> > +	igt_info("Vendor: %s\n", ctx->ops->name ? ctx->ops->name : "unknown");
> > +	if (ctx->current_platform_name[0]) {
> > +		igt_info("Current Platform: %s\n\n", ctx->current_platform_name);
> > +	}
> > +
> > +	/* Priority 1: Built-in array */
> > +	igt_info("───────────────────────────────────────────────────────────────────\n");
> > +	igt_info(" PRIORITY 1: BUILT-IN PRODUCTION ARRAY (VENDOR-SPECIFIC)\n");
> > +	igt_info(" Source: Vendor implementation\n");
> > +	igt_info("───────────────────────────────────────────────────────────────────\n");
> > +
> > +	total_count = 0;
> > +	if (ctx->ops->get_builtin_rules) {
> > +		const struct platform_skip_entry *builtin = ctx->ops->get_builtin_rules(&count);
> > +		for (i = 0; i < count; i++) {
> > +			entry = &builtin[i];
> > +			total_count++;
> > +			igt_info("  %2d. %s : %s\n",
> > +			       total_count,
> > +			       entry->test_name ? entry->test_name : "*",
> > +			       entry->subtest_glob ? entry->subtest_glob : "*");
> > +			igt_info("      Reason: %s\n", entry->reason ? entry->reason : "no reason");
> > +
> > +			/* Print platform data if vendor provides dump callback */
> > +			if (entry->platform_data && ctx->ops->dump_platform_data) {
> > +				igt_info("      Platform: ");
> > +				ctx->ops->dump_platform_data(entry->platform_data);
> > +				igt_info("\n");
> > +			}
> > +			igt_info("\n");
> > +		}
> > +	}
> > +	if (total_count == 0) {
> > +		igt_info("  (No built-in rules)\n\n");
> > +	}
> > +
> > +	/* Priority 2: Config file */
> > +	igt_info("───────────────────────────────────────────────────────────────────\n");
> > +	igt_info(" PRIORITY 2: DEVELOPMENT CONFIG FILE\n");
> > +	igt_info(" Source: /etc/igt/platform_skip.conf\n");
> > +	igt_info("───────────────────────────────────────────────────────────────────\n");
> > +
> > +	if (ctx->config_entry_count > 0) {
> > +		for (i = 0; i < ctx->config_entry_count; i++) {
> > +			entry = &ctx->config_entries[i];
> > +			igt_info("  %2d. %s : %s\n",
> > +			       i + 1,
> > +			       entry->test_name,
> > +			       entry->subtest_glob);
> > +			igt_info("      Reason: %s\n\n", entry->reason);
> > +		}
> > +	} else {
> > +		igt_info("  (No config file rules loaded)\n\n");
> > +	}
> > +
> > +	/* Priority 3: Environment variable */
> > +	igt_info("───────────────────────────────────────────────────────────────────\n");
> > +	igt_info(" PRIORITY 3: RUNTIME ENVIRONMENT VARIABLE\n");
> > +	igt_info(" Source: IGT_PLATFORM_SKIP_CONFIG\n");
> > +	igt_info("───────────────────────────────────────────────────────────────────\n");
> > +
> > +	if (ctx->env_entry_count > 0) {
> > +		for (i = 0; i < ctx->env_entry_count; i++) {
> > +			entry = &ctx->env_entries[i];
> > +			igt_info("  %2d. %s : %s\n",
> > +			       i + 1,
> > +			       entry->test_name,
> > +			       entry->subtest_glob);
> > +			igt_info("      Reason: %s\n\n", entry->reason);
> > +		}
> > +	} else {
> > +		igt_info("  (No environment variable rules)\n\n");
> > +	}
> > +
> > +	igt_info("───────────────────────────────────────────────────────────────────\n");
> > +	igt_info(" SUMMARY\n");
> > +	igt_info("───────────────────────────────────────────────────────────────────\n");
> > +	igt_info("  Built-in rules:     %d\n", total_count);
> > +	igt_info("  Config file rules:  %d\n", ctx->config_entry_count);
> > +	igt_info("  Environment rules:  %d\n", ctx->env_entry_count);
> > +	igt_info("  Total skip rules:   %d\n", total_count + ctx->config_entry_count + ctx->env_entry_count);
> > +	igt_info("\n");
> > +	igt_info("═══════════════════════════════════════════════════════════════════\n\n");
> > +}
> > +
> > +int igt_platform_filter_dump_to_file(const char *filename)
> > +{
> > +	FILE *old_stdout;
> > +	FILE *f;
> > +
> > +	f = fopen(filename, "w");
> > +	if (!f) {
> > +		igt_warn("Failed to open %s for writing\n", filename);
> > +		return -1;
> > +	}
> > +
> > +	/* Redirect stdout to file */
> > +	old_stdout = stdout;
> > +	stdout = f;
> > +
> > +	igt_platform_filter_dump();
> > +
> > +	/* Restore stdout */
> > +	stdout = old_stdout;
> > +	fclose(f);
> > +
> > +	igt_info("Platform filter configuration dumped to: %s\n", filename);
> > +	return 0;
> > +}
> > diff --git a/lib/igt_platform_filter.h b/lib/igt_platform_filter.h
> > new file mode 100644
> > index 000000000..c05c39b7d
> > --- /dev/null
> > +++ b/lib/igt_platform_filter.h
> > @@ -0,0 +1,196 @@
> > +/* SPDX-License-Identifier: MIT
> > + * Copyright 2026 Advanced Micro Devices, Inc.
> > + */
> > +
> > +#ifndef IGT_PLATFORM_FILTER_H
> > +#define IGT_PLATFORM_FILTER_H
> > +
> > +#include <stdbool.h>
> > +
> > +/**
> > + * SECTION: igt_platform_filter
> > + * @short_description: Generic platform-based test filtering framework
> > + * @title: Platform Filter
> > + * @include: igt_platform_filter.h
> > + *
> > + * Generic test filtering system that allows skipping tests/subtests based
> > + * on platform characteristics. Designed to be vendor-agnostic with
> > + * vendor-specific backends.
> > + *
> > + * Three-tier priority system (checked in sequence, first match wins):
> > + *   1. PRODUCTION: Built-in compile-time rules (vendor-specific)
> > + *   2. DEVELOPMENT: Config file /etc/igt/platform_skip.conf
> > + *   3. RUNTIME: Environment variable IGT_PLATFORM_SKIP_CONFIG
> > + *
> > + * Vendor Implementation:
> > + *   Each vendor implements platform_filter_ops callbacks to provide:
> > + *   - Platform identification and matching logic
> > + *   - Platform-specific data structures
> > + *   - Built-in skip rules
> > + *
> > + * Usage in tests:
> > + *   igt_fixture() {
> > + *       igt_platform_filter_init(vendor_ops, platform_info);
> > + *   }
> > + *
> > + *   igt_subtest("my-test") {
> > + *       igt_platform_require(igt_test_name(), "my-test");
> > + *       // test code
> > + *   }
> > + *
> > + * Config file format (/etc/igt/platform_skip.conf):
> > + *   # Lines starting with # are comments
> > + *   # Format: platform:test:subtest:reason
> > + *   # Use * as wildcard
> > + *
> > + *   navi48:*:*:All tests disabled on Navi48
> > + *   alderlake:i915_pm:*:Power management tests broken
> > + *
> > + * Environment variable format (IGT_PLATFORM_SKIP_CONFIG):
> > + *   Same as config file, semicolon-separated entries:
> > + *   export IGT_PLATFORM_SKIP_CONFIG="navi48:*:*:Testing;navi10:amd_basic:*:Broken"
> > + */
> > +
> > +/* Maximum platform ranges per skip entry */
> > +#define MAX_PLATFORM_RANGES 4
> > +
> > +/**
> > + * enum skip_source - Source of skip rule
> > + */
> > +enum skip_source {
> > +	SKIP_SOURCE_BUILTIN,    /* From vendor built-in array */
> > +	SKIP_SOURCE_CONFIG,     /* From /etc/igt/platform_skip.conf */
> > +	SKIP_SOURCE_ENV,        /* From IGT_PLATFORM_SKIP_CONFIG */
> > +	SKIP_SOURCE_NONE,       /* Not skipped */
> > +};
> > +
> > +/**
> > + * struct platform_skip_entry - Generic skip rule entry
> > + *
> > + * Generic structure for skip rules. Vendor-specific data is stored
> > + * in platform_data field and interpreted by vendor callbacks.
> > + */
> > +struct platform_skip_entry {
> > +	const char *test_name;          /* Test binary name or "*" for all */
> > +	const char *subtest_glob;       /* Subtest pattern (fnmatch) or "*" */
> > +	const char *reason;             /* Human-readable reason (required) */
> > +	void *platform_data;            /* Vendor-specific platform matching data */
> > +};
> > +
> > +/**
> > + * struct platform_filter_ops - Vendor-specific operations
> > + *
> > + * Callback structure that vendors implement to provide platform-specific
> > + * filtering logic. This allows the core filtering framework to remain
> > + * vendor-agnostic.
> > + */
> > +struct platform_filter_ops {
> > +	/**
> > +	 * @name: Vendor name (e.g., "amd", "intel", "nvidia")
> > +	 */
> > +	const char *name;
> > +
> > +	/**
> > +	 * @get_platform_name: Get current platform name
> > +	 * @platform_info: Vendor-specific platform information structure
> > +	 *
> > +	 * Returns: Platform name string (e.g., "navi48", "alderlake")
> > +	 */
> > +	const char *(*get_platform_name)(const void *platform_info);
> > +
> > +	/**
> > +	 * @match_platform: Check if skip entry matches current platform
> > +	 * @platform_info: Vendor-specific platform information
> > +	 * @platform_data: Vendor-specific platform matching data from skip entry
> > +	 *
> > +	 * Returns: true if platform matches, false otherwise
> > +	 */
> > +	bool (*match_platform)(const void *platform_info, const void *platform_data);
> > +
> > +	/**
> > +	 * @parse_platform_config: Parse platform string from config file
> > +	 * @platform_str: Platform string from config (e.g., "navi48", "*)
> > +	 * @platform_data_out: Output pointer for parsed platform data
> > +	 *
> > +	 * Returns: true if parse successful, false otherwise
> > +	 */
> > +	bool (*parse_platform_config)(const char *platform_str, void **platform_data_out);
> > +
> > +	/**
> > +	 * @get_builtin_rules: Get vendor-specific built-in skip rules
> > +	 * @count_out: Output pointer for number of rules
> > +	 *
> > +	 * Returns: Array of built-in skip entries
> > +	 */
> > +	const struct platform_skip_entry *(*get_builtin_rules)(int *count_out);
> > +
> > +	/**
> > +	 * @dump_platform_data: Dump platform_data for debugging
> > +	 * @platform_data: Vendor-specific platform data
> > +	 *
> > +	 * Optional callback to print platform_data in vendor-specific format
> > +	 */
> > +	void (*dump_platform_data)(const void *platform_data);
> > +};
> > +
> > +/**
> > + * igt_platform_filter_init - Initialize the filtering system
> > + * @ops: Vendor-specific operations callbacks
> > + * @platform_info: Vendor-specific platform information structure
> > + *
> > + * Loads skip rules from:
> > + *   1. Vendor built-in array (via ops->get_builtin_rules)
> > + *   2. /etc/igt/platform_skip.conf (if exists)
> > + *   3. IGT_PLATFORM_SKIP_CONFIG env variable (if set)
> > + *
> > + * Call once in igt_fixture.
> > + */
> > +void igt_platform_filter_init(const struct platform_filter_ops *ops,
> > +                               const void *platform_info);
> > +
> > +/**
> > + * igt_platform_require - Check if current test should run on this platform
> > + * @test_name: Test binary name (use igt_test_name())
> > + * @subtest_name: Subtest name
> > + *
> > + * Checks all three skip sources in priority order.
> > + * Calls igt_skip() if test should be skipped.
> > + */
> > +void igt_platform_require(const char *test_name, const char *subtest_name);
> > +
> > +/**
> > + * igt_platform_should_skip - Query if test should be skipped (without skipping)
> > + * @test_name: Test binary name
> > + * @subtest_name: Subtest name
> > + * @source: Output parameter for skip source (can be NULL)
> > + * @reason: Output parameter for skip reason (can be NULL)
> > + *
> > + * Returns: true if test should be skipped, false otherwise
> > + */
> > +bool igt_platform_should_skip(const char *test_name,
> > +                               const char *subtest_name,
> > +                               enum skip_source *source,
> > +                               const char **reason);
> > +
> > +/**
> > + * igt_platform_filter_dump - Dump all skip rules from all sources
> > + *
> > + * Prints formatted output showing:
> > + *   - Built-in array rules (vendor-specific)
> > + *   - Config file rules
> > + *   - Environment variable rules
> > + *   - Current platform information
> > + *
> > + * Useful for debugging and verification.
> > + */
> > +void igt_platform_filter_dump(void);
> > +
> > +/**
> > + * igt_platform_filter_dump_to_file - Dump skip rules to file
> > + * @filename: Output file path
> > + *
> > + * Returns: 0 on success, -1 on error
> > + */
> > +int igt_platform_filter_dump_to_file(const char *filename);
> > +
> > +#endif /* IGT_PLATFORM_FILTER_H */
> > diff --git a/lib/meson.build b/lib/meson.build
> > index 0e7efadf3..a8ef72beb 100644
> > --- a/lib/meson.build
> > +++ b/lib/meson.build
> > @@ -113,6 +113,7 @@ lib_sources = [
> >  	'igt_psr.c',
> >  	'igt_amd.c',
> >  	'igt_edid.c',
> > +	'igt_platform_filter.c',
> >  	'igt_eld.c',
> >  	'igt_infoframe.c',
> >  	'igt_color.c',
> > @@ -167,6 +168,7 @@ if libdrm_amdgpu.found()
> >  	lib_deps += libdrm_amdgpu
> >  	lib_sources += [
> >  		'amdgpu/amd_memory.c',
> > +		'amdgpu/amd_platform.c',
> >  		'amdgpu/amd_command_submission.c',
> >  		'amdgpu/amd_compute.c',
> >  		'amdgpu/amd_cs_radv.c',
