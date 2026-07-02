Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B06C43458
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jul 2026 12:24:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD71610F332;
	Thu,  2 Jul 2026 12:24:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WcoSkhM5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCBE10F338
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jul 2026 12:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782995037; x=1814531037;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Lbz79Fd9iXLVJ/8kpnJ7YTEaMq76XGqtth9kXURhLsg=;
 b=WcoSkhM5uBE73hNFzFdtAjwksTQl8Ug5x5djt9h4xhbkI5vFyk5NWpU9
 jQCdLY++c/dXXdg79SdLHM5SvDvR4KmJTbzpJZc9ZKsXy5n67S/3EN54r
 sVOdiUVQAAcnh0e8AMlq3veIFqO0mK14moRy7BCAIsPxs9gX6R+V09DNL
 4+6G42fCIAVFmblOy48nXRr5Y9jNuRxIjYo9+75DOkzcesu5QxFQAXdhI
 KqoxatPwOoQy2Tp28Ntw8aH8ulX7iES/E7eY4N5ZiPXtk+odilTXFNDm9
 6mrei7yOXb5qggE5mMS37+vmOnKkcbNTSnQvJ6PIxwq8y3sWL/KqZaKYN w==;
X-CSE-ConnectionGUID: dM7H8EtlSgW4SH4i33GXyw==
X-CSE-MsgGUID: f9kEr4NnTOe78C12HlPmJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83839194"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="83839194"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 05:23:57 -0700
X-CSE-ConnectionGUID: aWvrAih4Qcmu1hikWJHHPw==
X-CSE-MsgGUID: /+vKoHffRUuSDLe7YBvcJw==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 05:23:56 -0700
Date: Thu, 2 Jul 2026 14:23:53 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH 1/7] lib: Add vendor-agnostic platform filtering interface
Message-ID: <20260702122353.pslum4vcofigzadg@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org
References: <20260630032442.200729-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630032442.200729-1-vitaly.prosyak@amd.com>
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
On 2026-06-29 at 23:23:20 -0400, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> Define the generic platform filtering API that allows any vendor to
> plug in platform-specific test skipping logic via callbacks.
> 
> Key design elements:
> - struct platform_filter_ops: vendor callback interface
> - struct platform_skip_entry: vendor-neutral skip rule representation
> - enum skip_source: three-tier priority (built-in, config, env)
> - API functions: init, should_skip, require, dump
> 
> Platform filtering is automatic - tests only need to call
> platform_filter_init() once in igt_fixture. The IGT framework
> automatically checks each subtest before execution via __igt_run_subtest().
> 
> Example usage:
>   igt_fixture {
>       vendor_platform_filter_init(platform_info);
>   }
> 
>   igt_subtest("test") {
>       // Automatic filtering - no manual call needed!
>       test_code();
>   }
> 
> Addresses feedback from reviewers:
> 
> 1. Jani Nikula:
>    "I would have expected an attempt to make an IGT shared filtering
>    system generic enough to plug into any vendor's platforms."
> 
>    Resolution: Implemented vendor-agnostic callback-based design via
>    platform_filter_ops structure. Any vendor (Intel, AMD, Qualcomm, etc.)
>    can provide their own backend without modifying core framework.
> 
> 2. Kamil Konieczny:
>    a) "Add also example with config file as env vars are not convenient
>       for large tests lists"
> 
>       Resolution: Comprehensive documentation added in commit 6
>       (docs/platform_filtering.md) showing config file as RECOMMENDED
>       method with real-world examples, wildcards, and best practices.
> 
>    b) "imho you can get test name in require, no need to repeat it"
> 
>       Resolution: Went further - v3 removes igt_platform_require()
>       entirely. Filtering is now automatic via __igt_run_subtest() hook
>       in commit 5. Zero manual calls needed in subtests.
> 
>    c) Code style (include order, alignment, igt_debug vs igt_info)
> 
>       Resolution: Fixed in commits 2 and 4. Includes alphabetically
>       ordered, SPDX headers use // style, checkpatch clean.
> 
> 3. Multi-GPU support (integrated + discrete):
>    Current design queries platform once in igt_fixture. For multi-GPU
>    scenarios, tests can call platform_filter_init() per-device with
>    device-specific platform_info.
> 
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Change-Id: I370aa9f91b9d23e0fb79f3f04d8edb5cd4c57460
> ---
>  lib/igt_platform_filter.h | 123 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 123 insertions(+)
>  create mode 100644 lib/igt_platform_filter.h
> 
> diff --git a/lib/igt_platform_filter.h b/lib/igt_platform_filter.h
> new file mode 100644
> index 000000000..e532c6de7
> --- /dev/null
> +++ b/lib/igt_platform_filter.h
> @@ -0,0 +1,123 @@
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
> + *       // Automatic filtering - no manual call needed!
> + *       test_code();
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
> +	/** @name: Vendor name (e.g., "amd", "intel") */
> +
> +	const char *name;
> +
> +	/** @get_platform_name: Get current platform name */
> +	const char *(*get_platform_name)(const void *platform_info);
> +
> +	/** @match_platform: Check if skip entry matches current platform */
> +	bool (*match_platform)(const void *platform_info, const void *platform_data);
> +
> +	/** @parse_platform_config: Parse platform string from config file */
> +	bool (*parse_platform_config)(const char *platform_str, void **platform_data_out);
> +
> +	/** @get_builtin_rules: Get vendor-specific built-in skip rules */
> +	const struct platform_skip_entry *(*get_builtin_rules)(int *count_out);
> +
> +	/** @dump_platform_data: Dump platform_data for debugging (optional) */
> +	void (*dump_platform_data)(const void *platform_data);
> +};
> +
> +/* Function prototypes - see igt_platform_filter.c for documentation */

No need for this comment.

> +void igt_platform_filter_init(const struct platform_filter_ops *ops,
> +			       const void *platform_info);

Please squash this into second patch,

Regards,
Kamil

> +
> +void igt_platform_require(const char *subtest_name);
> +
> +bool igt_platform_should_skip(const char *test_name,
> +			       const char *subtest_name,
> +			       enum skip_source *source,
> +			       const char **reason);
> +
> +void igt_platform_filter_dump(void);
> +
> +int igt_platform_filter_dump_to_file(const char *filename);
> +
> +#endif /* IGT_PLATFORM_FILTER_H */
> -- 
> 2.54.0
> 
