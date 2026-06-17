Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94B7CD98E2
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 13:25:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C69010EA2B;
	Wed, 17 Jun 2026 13:25:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DHRG75SG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1106610EA1F
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 13:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781702706; x=1813238706;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WadtyaWx9j6vIlc+bym9g39nWlU8HxmmLgnO38dxSoo=;
 b=DHRG75SGfG+EcoecMIzpvBfDNclt+gHptnFvoan6NI5H68A0MpykKF8N
 A7qxB34anYgXT9jSMVx3ql2FKRHAhmng8HLf9zXUHbs6qJxdXdioCW7jB
 4kNboJJ+1YgmQts7VRHK97o8SMDG9CpEIP2wuGMI73Zsb0LYYZqBGiCTo
 sgLP4BKUTiiFri6CWr9Zew9rvCLJzgq8OhDRRdTzc2fLoxiMZeQsycMG2
 o75eaCgEL7S/q0RTNDZz0lv9ISnN7jhc6I5bfAe/funzwFVHDxHTTSeE1
 NCxaicWVZXQHGS5oEaLgZnVJ5FtF4vWaHIVVszCAGeQgetfTrx40rkqbD Q==;
X-CSE-ConnectionGUID: qa4dnfklS4SLU79H0R0BZg==
X-CSE-MsgGUID: ES7s/rzgSt6vdVZSL7IOrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="86335258"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="86335258"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 06:25:06 -0700
X-CSE-ConnectionGUID: lH3F6Sy3Q9WQJspSVWOy5Q==
X-CSE-MsgGUID: m+eVG6GOQC6K7spFKVQxvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="253185806"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 06:25:03 -0700
Date: Wed, 17 Jun 2026 15:25:00 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: vitaly.prosyak@amd.com
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Jesse Zhang <jesse.zhang@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH 1/4] lib: Add vendor-agnostic platform filtering interface
Message-ID: <20260617132500.36byg636garru756@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly.prosyak@amd.com,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 igt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jesse Zhang <jesse.zhang@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20260610192208.88992-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260610192208.88992-1-vitaly.prosyak@amd.com>
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

Hi Vitaly,
On 2026-06-10 at 15:21:24 -0400, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> Define the generic platform filtering API that allows any vendor to
> plug in platform-specific test skipping logic via callbacks.
> 
> Key design elements:
> 
> - struct platform_filter_ops: vendor callback interface with operations
>   for platform identification, matching, config parsing, and built-in
>   rules retrieval
> - struct platform_skip_entry: vendor-neutral skip rule representation
> - enum skip_source: three-tier priority system (built-in, config, env)
> - API functions: init, should_skip, require, dump
> 
> This addresses feedback from Jani Nikula: "I would have expected an
> attempt to make an IGT shared filtering system generic enough to plug
> into any vendor's platforms."
> 
> The interface is designed so that any vendor (Intel, AMD, Qualcomm,
> ARM, VMware, etc.) can implement their own backend by providing
> platform_filter_ops callbacks, without modifying the core framework.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>

+cc Karthik, J-P, Swati

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>

> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Reviewed-by: Jesse Zhang <jesse.zhang@amd.com>
> ---
>  lib/igt_platform_filter.h | 196 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 196 insertions(+)
>  create mode 100644 lib/igt_platform_filter.h
> 
> diff --git a/lib/igt_platform_filter.h b/lib/igt_platform_filter.h
> new file mode 100644
> index 000000000..c05c39b7d
> --- /dev/null
> +++ b/lib/igt_platform_filter.h
> @@ -0,0 +1,196 @@
> +/* SPDX-License-Identifier: MIT
> + * Copyright 2026 Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef IGT_PLATFORM_FILTER_H
> +#define IGT_PLATFORM_FILTER_H
> +
> +#include <stdbool.h>
> +
> +/**
> + * SECTION: igt_platform_filter
> + * @short_description: Generic platform-based test filtering framework
> + * @title: Platform Filter
> + * @include: igt_platform_filter.h
> + *
> + * Generic test filtering system that allows skipping tests/subtests based
> + * on platform characteristics. Designed to be vendor-agnostic with
> + * vendor-specific backends.
> + *
> + * Three-tier priority system (checked in sequence, first match wins):
> + *   1. PRODUCTION: Built-in compile-time rules (vendor-specific)
> + *   2. DEVELOPMENT: Config file /etc/igt/platform_skip.conf
> + *   3. RUNTIME: Environment variable IGT_PLATFORM_SKIP_CONFIG
> + *
> + * Vendor Implementation:
> + *   Each vendor implements platform_filter_ops callbacks to provide:
> + *   - Platform identification and matching logic
> + *   - Platform-specific data structures
> + *   - Built-in skip rules
> + *
> + * Usage in tests:
> + *   igt_fixture() {
> + *       igt_platform_filter_init(vendor_ops, platform_info);
> + *   }
> + *
> + *   igt_subtest("my-test") {
> + *       igt_platform_require(igt_test_name(), "my-test");
> + *       // test code
> + *   }
> + *
> + * Config file format (/etc/igt/platform_skip.conf):
> + *   # Lines starting with # are comments
> + *   # Format: platform:test:subtest:reason
> + *   # Use * as wildcard
> + *
> + *   navi48:*:*:All tests disabled on Navi48
> + *   alderlake:i915_pm:*:Power management tests broken
> + *
> + * Environment variable format (IGT_PLATFORM_SKIP_CONFIG):
> + *   Same as config file, semicolon-separated entries:
> + *   export IGT_PLATFORM_SKIP_CONFIG="navi48:*:*:Testing;navi10:amd_basic:*:Broken"
> + */
> +
> +/* Maximum platform ranges per skip entry */
> +#define MAX_PLATFORM_RANGES 4
> +
> +/**
> + * enum skip_source - Source of skip rule
> + */
> +enum skip_source {
> +	SKIP_SOURCE_BUILTIN,    /* From vendor built-in array */
> +	SKIP_SOURCE_CONFIG,     /* From /etc/igt/platform_skip.conf */
> +	SKIP_SOURCE_ENV,        /* From IGT_PLATFORM_SKIP_CONFIG */
> +	SKIP_SOURCE_NONE,       /* Not skipped */
> +};
> +
> +/**
> + * struct platform_skip_entry - Generic skip rule entry
> + *
> + * Generic structure for skip rules. Vendor-specific data is stored
> + * in platform_data field and interpreted by vendor callbacks.
> + */
> +struct platform_skip_entry {
> +	const char *test_name;          /* Test binary name or "*" for all */
> +	const char *subtest_glob;       /* Subtest pattern (fnmatch) or "*" */
> +	const char *reason;             /* Human-readable reason (required) */
> +	void *platform_data;            /* Vendor-specific platform matching data */
> +};
> +
> +/**
> + * struct platform_filter_ops - Vendor-specific operations
> + *
> + * Callback structure that vendors implement to provide platform-specific
> + * filtering logic. This allows the core filtering framework to remain
> + * vendor-agnostic.
> + */
> +struct platform_filter_ops {
> +	/**
> +	 * @name: Vendor name (e.g., "amd", "intel", "nvidia")
> +	 */
> +	const char *name;
> +
> +	/**
> +	 * @get_platform_name: Get current platform name
> +	 * @platform_info: Vendor-specific platform information structure
> +	 *
> +	 * Returns: Platform name string (e.g., "navi48", "alderlake")
> +	 */
> +	const char *(*get_platform_name)(const void *platform_info);
> +
> +	/**
> +	 * @match_platform: Check if skip entry matches current platform
> +	 * @platform_info: Vendor-specific platform information
> +	 * @platform_data: Vendor-specific platform matching data from skip entry
> +	 *
> +	 * Returns: true if platform matches, false otherwise
> +	 */
> +	bool (*match_platform)(const void *platform_info, const void *platform_data);
> +
> +	/**
> +	 * @parse_platform_config: Parse platform string from config file
> +	 * @platform_str: Platform string from config (e.g., "navi48", "*)
> +	 * @platform_data_out: Output pointer for parsed platform data
> +	 *
> +	 * Returns: true if parse successful, false otherwise
> +	 */
> +	bool (*parse_platform_config)(const char *platform_str, void **platform_data_out);
> +
> +	/**
> +	 * @get_builtin_rules: Get vendor-specific built-in skip rules
> +	 * @count_out: Output pointer for number of rules
> +	 *
> +	 * Returns: Array of built-in skip entries
> +	 */
> +	const struct platform_skip_entry *(*get_builtin_rules)(int *count_out);
> +
> +	/**
> +	 * @dump_platform_data: Dump platform_data for debugging
> +	 * @platform_data: Vendor-specific platform data
> +	 *
> +	 * Optional callback to print platform_data in vendor-specific format
> +	 */
> +	void (*dump_platform_data)(const void *platform_data);
> +};
> +
> +/**
> + * igt_platform_filter_init - Initialize the filtering system
> + * @ops: Vendor-specific operations callbacks
> + * @platform_info: Vendor-specific platform information structure
> + *
> + * Loads skip rules from:
> + *   1. Vendor built-in array (via ops->get_builtin_rules)
> + *   2. /etc/igt/platform_skip.conf (if exists)
> + *   3. IGT_PLATFORM_SKIP_CONFIG env variable (if set)
> + *
> + * Call once in igt_fixture.
> + */

We usally keep function descriptions near C source, not in
headers.

> +void igt_platform_filter_init(const struct platform_filter_ops *ops,
> +                               const void *platform_info);

Please fix code style here and below, also at other patches.
Checkpatch is complaining:

code indent should use tabs where possible
Alignment should match open parenthesis
please, no spaces at the start of a line

If it is usable as is for your CI feel free to merge it after
a code style cleanup.

If it will need any changes for Intel, they could be done later.

Regards,
Kamil

> +
> +/**
> + * igt_platform_require - Check if current test should run on this platform
> + * @test_name: Test binary name (use igt_test_name())
> + * @subtest_name: Subtest name
> + *
> + * Checks all three skip sources in priority order.
> + * Calls igt_skip() if test should be skipped.
> + */
> +void igt_platform_require(const char *test_name, const char *subtest_name);
> +
> +/**
> + * igt_platform_should_skip - Query if test should be skipped (without skipping)
> + * @test_name: Test binary name
> + * @subtest_name: Subtest name
> + * @source: Output parameter for skip source (can be NULL)
> + * @reason: Output parameter for skip reason (can be NULL)
> + *
> + * Returns: true if test should be skipped, false otherwise
> + */
> +bool igt_platform_should_skip(const char *test_name,
> +                               const char *subtest_name,
> +                               enum skip_source *source,
> +                               const char **reason);
> +
> +/**
> + * igt_platform_filter_dump - Dump all skip rules from all sources
> + *
> + * Prints formatted output showing:
> + *   - Built-in array rules (vendor-specific)
> + *   - Config file rules
> + *   - Environment variable rules
> + *   - Current platform information
> + *
> + * Useful for debugging and verification.
> + */
> +void igt_platform_filter_dump(void);
> +
> +/**
> + * igt_platform_filter_dump_to_file - Dump skip rules to file
> + * @filename: Output file path
> + *
> + * Returns: 0 on success, -1 on error
> + */
> +int igt_platform_filter_dump_to_file(const char *filename);
> +
> +#endif /* IGT_PLATFORM_FILTER_H */
> -- 
> 2.54.0
> 
