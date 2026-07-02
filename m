Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81425C43458
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jul 2026 13:43:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1283B10F377;
	Thu,  2 Jul 2026 13:43:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ESwv+niw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D43510F377
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jul 2026 13:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782999776; x=1814535776;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=SwKoJUN9Tafnt2KS/jJQgD2xThlROMyWwEyO5L8AnhY=;
 b=ESwv+niwWICmDFLMGmQj8aE0Mzbf9TmbLE21OBcz8sxmHKIMWt4ei5jY
 L4IpLEgJK5ABtUUOEWw30CVUYExs6i7gMfVWNuHiFLM6+wUcM+ZaR/ViG
 K49EkOAdfavdoDLLTqh0oOL9ZYBHgVgRS56bkCUKsjODipC8QFlogGoWK
 mda5DYMV1YZGtC+Q42BGvFBQNSpkTMXi6V0JZkXJWPR7DNIl64i2py68g
 MXn3Fjqny6lsAaU8hOFV7O7fxL7XTU6etep93WlNetFpu9HqJTEu14VTt
 LyUwaXwPJhRyIV4ICMYdoTQmdh5Vf+STUAGW7bzmCQzb7f2zVODCgUZw9 A==;
X-CSE-ConnectionGUID: jphjd79pQBiiNFFtd6vy0w==
X-CSE-MsgGUID: G41bNzBnRTeTlKK/xkCgeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="87669595"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="87669595"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 06:42:55 -0700
X-CSE-ConnectionGUID: 2Tim+o5MQDWINOt2CnBafg==
X-CSE-MsgGUID: GrDvFaPBTZG9tbMGV+1e0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="249516841"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 06:42:53 -0700
Date: Thu, 2 Jul 2026 15:42:33 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Jesse Zhang <jesse.zhang@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH 3/7] lib/amdgpu: Add AMD platform filtering backend
Message-ID: <20260702134233.joyngzudno5jenk7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jesse Zhang <jesse.zhang@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20260630032442.200729-1-vitaly.prosyak@amd.com>
 <20260630032442.200729-3-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260630032442.200729-3-vitaly.prosyak@amd.com>
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

Hi vitaly.prosyak,
On 2026-06-29 at 23:23:22 -0400, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> Implement the AMD-specific backend for the generic platform filtering
> framework, providing:
> 
> - ASIC identification via amdgpu family_id and chip_rev ranges
> - ASIC name table mapping (navi10, navi48, arcturus, etc.)
> - AMD-specific built-in skip rules
> - amd_platform_filter_init() convenience function for AMD tests
> 
> This is a pluggable backend accessed through platform_filter_ops
> callbacks. The core framework has zero AMD-specific knowledge.
> 
> To add support for another vendor (e.g., Intel):
> 1. Create lib/i915/intel_platform.c/h
> 2. Implement platform_filter_ops callbacks
> 3. Define Intel platform data (platform_id, stepping ranges)
> 4. Call intel_platform_filter_init() from Intel tests
> 
> Usage in AMD tests:
>     amd_platform_filter_init(&gpu_info);
>     igt_platform_require(igt_test_name(), "my-subtest");
> 
> Example skip via environment variable:
>     export IGT_PLATFORM_SKIP_CONFIG=navi48:amd_basic:*-UMQ:unstable
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Reviewed-by: Jesse Zhang <jesse.zhang@amd.com>
> ---
>  lib/amdgpu/amd_platform.c | 318 ++++++++++++++++++++++++++++++++++++++
>  lib/amdgpu/amd_platform.h |  53 +++++++
>  lib/meson.build           |   1 +
>  3 files changed, 372 insertions(+)
>  create mode 100644 lib/amdgpu/amd_platform.c
>  create mode 100644 lib/amdgpu/amd_platform.h

Please make sure that you patch series compile patch after patch,
so it will not break bisecting. For example run:

git rebase origin -x ./compile.sh

with script which will remove build folder before each build.

Regards,
Kamil


> 
> diff --git a/lib/amdgpu/amd_platform.c b/lib/amdgpu/amd_platform.c
> new file mode 100644
> index 000000000..e52da159f
> --- /dev/null
> +++ b/lib/amdgpu/amd_platform.c
> @@ -0,0 +1,318 @@
> +// SPDX-License-Identifier: MIT
> +// Copyright 2026 Advanced Micro Devices, Inc.
> +/*
> + * AMD-specific platform filtering backend
> + *
> + * Implements platform_filter_ops callbacks for AMD GPUs, providing
> + * platform identification and matching logic based on ASIC family/chip.
> + */
> + */
> +
> +#include <stdlib.h>
> +#include <string.h>
> +#include <strings.h>
> +
> +#include "igt.h"
> +#include "igt_platform_filter.h"
> +#include "amd_platform.h"
> +#include "amdgpu_asic_addr.h"
> +
> +/**
> + * AMD platform data structures
> + *
> + * These structures define how AMD ASICs are matched for filtering.
> + * They use family/chip ranges similar to amd_queue_reset.c
> + */
> +
> +/* Maximum ASIC family ranges per skip entry */
> +#define MAX_ASIC_RANGES 4
> +
> +/**
> + * struct amd_asic_range - ASIC family range for matching
> + *
> + * Similar to struct used in amd_queue_reset.c for defining ASIC ranges.
> + * Uses definitions from amdgpu_asic_addr.h
> + */
> +struct amd_asic_range {
> +	int family_id;      /* FAMILY_NV, FAMILY_GFX1200, etc. */
> +	int chip_id_min;    /* Min chip revision */
> +	int chip_id_max;    /* Max chip revision */
> +};
> +
> +/**
> + * struct amd_platform_data - AMD platform matching data
> + *
> + * This is stored in platform_skip_entry->platform_data field.
> + * Contains array of ASIC ranges to match against.
> + */
> +struct amd_platform_data {
> +	struct amd_asic_range ranges[MAX_ASIC_RANGES];
> +	int num_ranges;
> +};
> +
> +/* ASIC name to family/chip mapping table */
> +struct asic_info {
> +	const char *name;
> +	int family_id;
> +	int chip_id_min;
> +	int chip_id_max;
> +};
> +
> +static const struct asic_info asic_table[] = {
> +	/* GFX12 - using ranges from amdgpu_asic_addr.h */
> +	{ "navi48", FAMILY_GFX1200, AMDGPU_GFX1200_RANGE },
> +	{ "navi44", FAMILY_GFX1200, AMDGPU_GFX1200_RANGE },
> +
> +	/* GFX11.5 */
> +	{ "gfx1150", FAMILY_GFX1150, AMDGPU_GFX1150_RANGE },
> +	{ "gfx1151", FAMILY_GFX1150, AMDGPU_GFX1151_RANGE },
> +	{ "gfx1152", FAMILY_GFX1150, AMDGPU_GFX1152_RANGE },
> +	{ "gfx1153", FAMILY_GFX1150, AMDGPU_GFX1153_RANGE },
> +
> +	/* GFX11 */
> +	{ "gfx1100", FAMILY_GFX1100, AMDGPU_GFX1100_RANGE },
> +	{ "gfx1101", FAMILY_GFX1100, AMDGPU_GFX1101_RANGE },
> +	{ "gfx1102", FAMILY_GFX1100, AMDGPU_GFX1102_RANGE },
> +	{ "gfx1103_r1", FAMILY_GFX1103, AMDGPU_GFX1103_R1_RANGE },
> +	{ "gfx1103_r2", FAMILY_GFX1103, AMDGPU_GFX1103_R2_RANGE },
> +	{ "navi31", FAMILY_GFX1100, AMDGPU_GFX1100_RANGE },
> +	{ "navi32", FAMILY_GFX1100, AMDGPU_GFX1101_RANGE },
> +	{ "navi33", FAMILY_GFX1100, AMDGPU_GFX1102_RANGE },
> +
> +	/* GFX10.3 */
> +	{ "sienna_cichlid", FAMILY_NV, AMDGPU_SIENNA_CICHLID_RANGE },
> +	{ "navy_flounder", FAMILY_NV, AMDGPU_NAVY_FLOUNDER_RANGE },
> +	{ "dimgrey_cavefish", FAMILY_NV, AMDGPU_DIMGREY_CAVEFISH_RANGE },
> +	{ "beige_goby", FAMILY_NV, AMDGPU_BEIGE_GOBY_RANGE },
> +	{ "yellow_carp", FAMILY_YC, AMDGPU_YELLOW_CARP_RANGE },
> +	{ "vangogh", FAMILY_VGH, AMDGPU_VANGOGH_RANGE },
> +
> +	/* GFX10 */
> +	{ "navi10", FAMILY_NV, AMDGPU_NAVI10_RANGE },
> +	{ "navi12", FAMILY_NV, AMDGPU_NAVI12_RANGE },
> +	{ "navi14", FAMILY_NV, AMDGPU_NAVI14_RANGE },
> +	{ "navi21", FAMILY_NV, AMDGPU_SIENNA_CICHLID_RANGE },
> +	{ "navi22", FAMILY_NV, AMDGPU_NAVY_FLOUNDER_RANGE },
> +	{ "navi23", FAMILY_NV, AMDGPU_DIMGREY_CAVEFISH_RANGE },
> +	{ "navi24", FAMILY_NV, AMDGPU_BEIGE_GOBY_RANGE },
> +
> +	/* CDNA */
> +	{ "arcturus", FAMILY_AI, AMDGPU_ARCTURUS_RANGE },
> +	{ "aldebaran", FAMILY_AI, AMDGPU_ALDEBARAN_RANGE },
> +
> +	/* GFX9 */
> +	{ "vega10", FAMILY_AI, AMDGPU_VEGA10_RANGE },
> +	{ "vega12", FAMILY_AI, AMDGPU_VEGA12_RANGE },
> +	{ "vega20", FAMILY_AI, AMDGPU_VEGA20_RANGE },
> +	{ "raven", FAMILY_RV, AMDGPU_RAVEN_RANGE },
> +	{ "raven2", FAMILY_RV, AMDGPU_RAVEN2_RANGE },
> +	{ "renoir", FAMILY_RV, AMDGPU_RENOIR_RANGE },
> +
> +	/* GFX8 (VI/Polaris) */
> +	{ "polaris10", FAMILY_VI, AMDGPU_POLARIS10_RANGE },
> +	{ "polaris11", FAMILY_VI, AMDGPU_POLARIS11_RANGE },
> +	{ "polaris12", FAMILY_VI, AMDGPU_POLARIS12_RANGE },
> +	{ "fiji", FAMILY_VI, AMDGPU_FIJI_RANGE },
> +	{ "tonga", FAMILY_VI, AMDGPU_TONGA_RANGE },
> +	{ "iceland", FAMILY_VI, AMDGPU_ICELAND_RANGE },
> +	{ "carrizo", FAMILY_CZ, AMDGPU_CARRIZO_RANGE },
> +	{ "stoney", FAMILY_CZ, AMDGPU_STONEY_RANGE },
> +
> +	{ NULL, 0, 0, 0 }
> +};
> +
> +/* Helper: Get ASIC info by name (case-insensitive) */
> +static const struct asic_info *get_asic_info(const char *name)
> +{
> +	const struct asic_info *info;
> +
> +	if (!name)
> +		return NULL;
> +
> +	for (info = asic_table; info->name; info++) {
> +		if (strcasecmp(info->name, name) == 0)
> +			return info;
> +	}
> +	return NULL;
> +}
> +
> +/* Helper: Get ASIC name by family/chip */
> +static const char *get_asic_name(int family_id, int chip_rev)
> +{
> +	const struct asic_info *info;
> +
> +	for (info = asic_table; info->name; info++) {
> +		if (info->family_id == family_id &&
> +		    chip_rev >= info->chip_id_min &&
> +		    chip_rev < info->chip_id_max)
> +			return info->name;
> +	}
> +	return "unknown";
> +}
> +
> +/* ================================================================
> + * AMD PLATFORM FILTER OPS IMPLEMENTATION
> + * ================================================================ */
> +
> +static const char *amd_get_platform_name(const void *platform_info)
> +{
> +	const struct amdgpu_gpu_info *gpu_info = platform_info;
> +
> +	if (!gpu_info)
> +		return "unknown";
> +
> +	return get_asic_name(gpu_info->family_id, gpu_info->chip_rev);
> +}
> +
> +static bool amd_match_platform(const void *platform_info, const void *platform_data)
> +{
> +	const struct amdgpu_gpu_info *gpu_info = platform_info;
> +	const struct amd_platform_data *amd_data = platform_data;
> +	int i;
> +
> +	if (!gpu_info || !amd_data)
> +		return false;
> +
> +	/* If no ranges specified, match all platforms */
> +	if (amd_data->num_ranges == 0)
> +		return true;
> +
> +	/* Check if GPU matches any of the ASIC ranges */
> +	for (i = 0; i < amd_data->num_ranges && i < MAX_ASIC_RANGES; i++) {
> +		if (amd_data->ranges[i].family_id == gpu_info->family_id) {
> +			int chip_rev = gpu_info->chip_rev;
> +			if (chip_rev >= amd_data->ranges[i].chip_id_min &&
> +			    chip_rev < amd_data->ranges[i].chip_id_max) {
> +				return true;
> +			}
> +		}
> +	}
> +
> +	return false;
> +}
> +
> +static bool amd_parse_platform_config(const char *platform_str, void **platform_data_out)
> +{
> +	const struct asic_info *info;
> +	struct amd_platform_data *amd_data;
> +
> +	info = get_asic_info(platform_str);
> +	if (!info) {
> +		igt_warn("Unknown AMD ASIC name: %s\n", platform_str);
> +		return false;
> +	}
> +
> +	amd_data = malloc(sizeof(*amd_data));
> +	if (!amd_data)
> +		return false;
> +
> +	memset(amd_data, 0, sizeof(*amd_data));
> +	amd_data->ranges[0].family_id = info->family_id;
> +	amd_data->ranges[0].chip_id_min = info->chip_id_min;
> +	amd_data->ranges[0].chip_id_max = info->chip_id_max;
> +	amd_data->num_ranges = 1;
> +
> +	*platform_data_out = amd_data;
> +	return true;
> +}
> +
> +static void amd_dump_platform_data(const void *platform_data)
> +{
> +	const struct amd_platform_data *amd_data = platform_data;
> +	int i;
> +
> +	if (!amd_data) {
> +		printf("(all platforms)");
> +		return;
> +	}
> +
> +	for (i = 0; i < amd_data->num_ranges && i < MAX_ASIC_RANGES; i++) {
> +		if (i > 0)
> +			printf(", ");
> +		printf("{0x%02X, 0x%02X-0x%02X}",
> +		       amd_data->ranges[i].family_id,
> +		       amd_data->ranges[i].chip_id_min,
> +		       amd_data->ranges[i].chip_id_max);
> +	}
> +}
> +
> +/* ================================================================
> + * AMD BUILT-IN SKIP RULES
> + * ================================================================
> + *
> + * These are production skip rules. They are checked FIRST before
> + * config file or environment variable.
> + *
> + * To add a skip rule:
> + * 1. Define platform data with ASIC ranges
> + * 2. Add entry to builtin_skip_table[]
> + * 3. Rebuild IGT
> + *
> + * Example formats (uncomment to use):
> + *
> + * Single ASIC:
> + *   static struct amd_platform_data navi44_data = {
> + *       .ranges = { {FAMILY_GFX1200, AMDGPU_GFX1200_RANGE} },
> + *       .num_ranges = 1
> + *   };
> + *   { "amd_basic", "*-UMQ", "UMQ not supported on Navi44", &navi44_data },
> + *
> + * Multiple ASICs:
> + *   static struct amd_platform_data navi10_12_14_data = {
> + *       .ranges = {
> + *           {FAMILY_NV, AMDGPU_NAVI10_RANGE},
> + *           {FAMILY_NV, AMDGPU_NAVI12_RANGE},
> + *           {FAMILY_NV, AMDGPU_NAVI14_RANGE}
> + *       },
> + *       .num_ranges = 3
> + *   };
> + *   { "amd_userq_abort", "*", "Queue reset unstable", &navi10_12_14_data },
> + *
> + * All platforms (no platform restriction):
> + *   { "test_name", "subtest", "reason", NULL },
> + */
> +
> +static const struct platform_skip_entry builtin_skip_table[] = {
> +	/* Add production skip rules here */
> +
> +	/* Sentinel */
> +	{}
> +};
> +
> +static const struct platform_skip_entry *amd_get_builtin_rules(int *count_out)
> +{
> +	int count = 0;
> +
> +	/* Count entries (stop at sentinel) */
> +	while (builtin_skip_table[count].test_name ||
> +	       builtin_skip_table[count].subtest_glob ||
> +	       builtin_skip_table[count].reason)
> +		count++;
> +
> +	*count_out = count;
> +	return builtin_skip_table;
> +}
> +
> +/* AMD platform filter operations */
> +static const struct platform_filter_ops amd_platform_ops = {
> +	.name = "amd",
> +	.get_platform_name = amd_get_platform_name,
> +	.match_platform = amd_match_platform,
> +	.parse_platform_config = amd_parse_platform_config,
> +	.get_builtin_rules = amd_get_builtin_rules,
> +	.dump_platform_data = amd_dump_platform_data,
> +};
> +
> +/* ================================================================
> + * PUBLIC API
> + * ================================================================ */
> +
> +const struct platform_filter_ops *amd_platform_get_ops(void)
> +{
> +	return &amd_platform_ops;
> +}
> +
> +void amd_platform_filter_init(const struct amdgpu_gpu_info *gpu_info)
> +{
> +	igt_platform_filter_init(&amd_platform_ops, gpu_info);
> +}
> diff --git a/lib/amdgpu/amd_platform.h b/lib/amdgpu/amd_platform.h
> new file mode 100644
> index 000000000..fd233a053
> --- /dev/null
> +++ b/lib/amdgpu/amd_platform.h
> @@ -0,0 +1,53 @@
> +/* SPDX-License-Identifier: MIT
> + * Copyright 2026 Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef AMD_PLATFORM_H
> +#define AMD_PLATFORM_H
> +
> +#include "igt_platform_filter.h"
> +#include "amd_ip_blocks.h"
> +
> +/**
> + * SECTION: amd_platform
> + * @short_description: AMD-specific platform filtering backend
> + * @title: AMD Platform
> + * @include: amd_platform.h
> + *
> + * AMD implementation of platform filtering that plugs into the generic
> + * IGT platform filter framework.
> + *
> + * This backend provides:
> + * - ASIC identification and matching based on family/chip ranges
> + * - Built-in skip rules for AMD GPUs
> + * - Integration with amdgpu_asic_addr.h definitions
> + *
> + * Usage in AMD tests:
> + *   igt_fixture() {
> + *       setup_amdgpu_ip_blocks(...);
> + *       amd_platform_filter_init(&gpu_info);
> + *   }
> + *
> + *   igt_subtest("my-test") {
> + *       // Automatic filtering - no manual call needed!
> + *       test_code();
> + *   }
> + */
> +
> +/**
> + * amd_platform_filter_init - Initialize AMD platform filtering
> + * @gpu_info: AMDGPU GPU information structure
> + *
> + * Convenience wrapper that initializes the generic platform filter
> + * with AMD-specific operations and GPU info.
> + */
> +void amd_platform_filter_init(const struct amdgpu_gpu_info *gpu_info);
> +
> +/**
> + * amd_platform_get_ops - Get AMD platform filter operations
> + *
> + * Returns: AMD platform_filter_ops structure
> + */
> +const struct platform_filter_ops *amd_platform_get_ops(void);
> +
> +#endif /* AMD_PLATFORM_H */
> diff --git a/lib/meson.build b/lib/meson.build
> index ba0683995..1318f9a38 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -179,6 +179,7 @@ if libdrm_amdgpu.found()
>  	lib_deps += libdrm_amdgpu
>  	lib_sources += [
>  		'amdgpu/amd_memory.c',
> +		'amdgpu/amd_platform.c',
>  		'amdgpu/amd_command_submission.c',
>  		'amdgpu/amd_compute.c',
>  		'amdgpu/amd_cs_radv.c',
> -- 
> 2.54.0
> 
