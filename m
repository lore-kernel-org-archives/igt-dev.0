Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7886BC53200
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 15:46:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29FCB10ECBE;
	Wed, 29 Jul 2026 15:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SLTnZWcu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0767889A1E
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 15:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785339932; x=1816875932;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5HYtvJ71T5Gkc1rS0J8e69e5ZT8Ym+jPlRXH+i271z0=;
 b=SLTnZWcumq86SikI9PWfWneWJaFhXfl2Gun9AKCSBMy0lGLJgf38c6md
 lNjOd39siretmDKR4Kb4mnIi3ltfWqM2N5xGmtF9OR0q3QcAe7KerzDUF
 qNLQjXm7WdpVG6tqMdIE/y9a0EjqOh3Ue/KTY5tlDXyW+FQKrqcbXnUjR
 gQuV/yVJvk53/lWL6wzb4iStqxYKpc8xYROgSEWig+yWZG0RplFmMDDi3
 bX+E+IMo7nLVD1l1P5W3+PvNh6MZZD1KQsy/uqTnqm0g41/K7zaRXjBVl
 8pSSlaVpTz5kCt7+u6cVuqdEoJnRexKvCX1OqhE9Fc4etWY+IdmKnidO8 A==;
X-CSE-ConnectionGUID: DOUytykhRBa+DmwY6i0fPw==
X-CSE-MsgGUID: c1Xb8ZsnTzuPrG50UbYWaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86140380"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="86140380"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 08:45:31 -0700
X-CSE-ConnectionGUID: 6LILW/N5QcCHcp6Dlmd9Nw==
X-CSE-MsgGUID: Bd3RSbFpTeCGB57gaHr3cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="259453284"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 08:45:29 -0700
Date: Wed, 29 Jul 2026 17:45:26 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Jesse Zhang <jesse.zhang@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: Re: [PATCH v4 1/5] lib: Add generic platform filtering framework
Message-ID: <20260729154526.zlv4zztpvi7yxybc@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jesse Zhang <jesse.zhang@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
References: <20260722022150.191615-1-vitaly.prosyak@amd.com>
 <20260722022150.191615-2-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260722022150.191615-2-vitaly.prosyak@amd.com>
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
On 2026-07-21 at 22:21:34 -0400, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> Implement vendor-agnostic platform filtering system that allows any
> vendor to plug in platform-specific test skipping logic via callbacks.
> 
> **IMPORTANT**: This commit is generic and vendor-agnostic, containing
> NO AMD-specific implementation. The AMD backend is in a separate commit
> (patch 2/6 "lib/amdgpu: Add AMD platform filtering backend").

Please move this paragraph after '---'.

> 
> This combines both the interface (header) and implementation in a
> single commit as requested by Kamil Konieczny.

Same here.

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

Add here

---

> v4 changes (addressing Krzysztof Karas detailed review of v3):
>  - Fixed documentation comment placement - ALL moved before functions
>  - Reorganized commit message for clarity (v4 changes first)
>  - Added prominent note that this is generic (no vendor code)
>  - Proper [PATCH v4 X/Y] format using git format-patch --subject-prefix
> 
> v3 changes (addressing Kamil Konieczny's review):
>  - Squashed header and implementation into single commit
>  - Removed unnecessary comment "Function prototypes..." from header
>  - Comprehensive documentation in separate commit
>    (docs/platform_filtering.md)
>  - Automatic filtering via __igt_run_subtest() hook (no manual require
>    calls)
>  - Fixed code style: include order, SPDX style, checkpatch clean
>  - Removed unnecessary newlines before single-statement returns
> 
> Design rationale (addresses feedback from original RFC discussion):
> 
> This implementation addresses feedback from multiple reviewers on the
> original RFC patch series.
> 
> 1. Jani Nikula requested vendor-agnostic design:
>    "I would have expected an attempt to make an IGT shared filtering
>    system generic enough to plug into any vendor's platforms."
> 
>    Resolution: Implemented vendor-agnostic callback-based design via
>    platform_filter_ops structure. Any vendor (Intel, AMD, Qualcomm, etc.)
>    can provide their own backend without modifying core framework.
> 
> 2. Kamil Konieczny requested config file support:
>    a) "Add also example with config file as env vars are not convenient
>       for large tests lists"
> 
>       Resolution: Comprehensive documentation added in patch 5/6
>       (docs/platform_filtering.md) showing config file as RECOMMENDED
>       method with real-world examples, wildcards, and best practices.
> 
>    b) "imho you can get test name in require, no need to repeat it"
> 
>       Resolution: Went further - v3 removes igt_platform_require()
>       entirely. Filtering is now automatic via __igt_run_subtest() hook
>       in patch 4/6. Zero manual calls needed in subtests.
> 
>    c) Code style (include order, alignment, igt_debug vs igt_info)
> 
>       Resolution: Fixed in v3. Includes alphabetically ordered, SPDX
>       headers use // style, checkpatch clean.
> 
>    d) "No need for this comment" (function prototypes comment)
> 
>       Resolution: Removed unnecessary comment from header file.
> 
>    e) "Please squash this into second patch"
> 
>       Resolution: Header and implementation now in single commit.
> 
> 3. Multi-GPU support (integrated + discrete):
>    Current design queries platform once in igt_fixture. For multi-GPU
>    scenarios, tests can call platform_filter_init() per-device with
>    device-specific platform_info.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

Lines with Cc and your s-o-b should be above '---'

> Change-Id: I389d8a4e5bd67cdd00ac625c64b24e4d9b092e17

Please do not use Change-Id from gerrit, remove this line.

Please also use chechpatch.pl script and align your code.
You could ingore some, for example long linesi, camel case and
missing change in MAINTAINERS are ok in igt.

Regards,
Kamil

> ---
>  lib/igt_platform_filter.c | 572 ++++++++++++++++++++++++++++++++++++++
>  lib/igt_platform_filter.h | 122 ++++++++
>  lib/meson.build           |   1 +
>  3 files changed, 695 insertions(+)
>  create mode 100644 lib/igt_platform_filter.c
>  create mode 100644 lib/igt_platform_filter.h
> 
> diff --git a/lib/igt_platform_filter.c b/lib/igt_platform_filter.c
> new file mode 100644
> index 000000000..28a8a0185
> --- /dev/null
> +++ b/lib/igt_platform_filter.c
> @@ -0,0 +1,572 @@
> +// SPDX-License-Identifier: MIT
> +// Copyright 2026 Advanced Micro Devices, Inc.
> +/*
> + * Generic platform-based test filtering framework
> + *
> + * This is a vendor-agnostic filtering system. Vendor-specific logic
> + * is implemented via platform_filter_ops callbacks.
> + */
> +
> +#include <ctype.h>
> +#include <fnmatch.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +
> +#include "igt.h"
> +#include "igt_platform_filter.h"
> +
> +/* Maximum entries from config file and env variable */
> +#define MAX_CONFIG_ENTRIES 256
> +#define MAX_ENV_ENTRIES 128
> +#define MAX_LINE_LENGTH 512
> +
> +/* Filter context - holds all runtime state (no globals) */
> +struct platform_filter_context {
> +	const struct platform_filter_ops *ops;
> +	const void *platform_info;
> +
> +	struct platform_skip_entry config_entries[MAX_CONFIG_ENTRIES];
> +	int config_entry_count;
> +
> +	struct platform_skip_entry env_entries[MAX_ENV_ENTRIES];
> +	int env_entry_count;
> +
> +	bool initialized;
> +	char current_platform_name[64];
> +};
> +
> +/* Single static instance - initialized on first use */
> +static struct platform_filter_context *get_filter_context(void)
> +{
> +	static struct platform_filter_context ctx = {0};
> +	return &ctx;
> +}
> +
> +/*
> + * ================================================================
> + * HELPER FUNCTIONS
> + * ================================================================ */
> +
> +/* Helper: Trim whitespace from string */
> +static char *trim(char *str)
> +{
> +	char *end;
> +
> +	while (isspace(*str))
> +		str++;
> +
> +	if (*str == 0)
> +		return str;
> +
> +	end = str + strlen(str) - 1;
> +	while (end > str && isspace(*end))
> +		end--;
> +
> +	*(end + 1) = 0;
> +	return str;
> +}
> +
> +/* Helper: Match wildcard or exact string */
> +static bool match_string(const char *pattern, const char *str)
> +{
> +	if (!pattern || !str)
> +		return false;
> +
> +	if (strcmp(pattern, "*") == 0)
> +		return true;
> +	return fnmatch(pattern, str, 0) == 0;
> +}
> +
> +/* Helper: Check if entry matches platform/test/subtest */
> +static bool entry_matches(const struct platform_filter_context *ctx,
> +                          const struct platform_skip_entry *entry,
> +                          const char *test_name,
> +                          const char *subtest_name)
> +{
> +	if (entry->platform_data && ctx->ops->match_platform) {
> +		if (!ctx->ops->match_platform(ctx->platform_info, entry->platform_data))
> +			return false;
> +	}
> +
> +	if (entry->test_name && strcmp(entry->test_name, "*") != 0) {
> +		if (!test_name || !match_string(entry->test_name, test_name))
> +			return false;
> +	}
> +
> +	if (entry->subtest_glob && strcmp(entry->subtest_glob, "*") != 0) {
> +		if (!subtest_name || !match_string(entry->subtest_glob, subtest_name))
> +			return false;
> +	}
> +	return true;
> +}
> +
> +/*
> + * ================================================================
> + * CONFIG FILE PARSER (/etc/igt/platform_skip.conf)
> + * ================================================================ */
> +
> +/* Parse one line from config file */
> +static bool parse_config_line(struct platform_filter_context *ctx,
> +                               char *line,
> +                               struct platform_skip_entry *entry)
> +{
> +	char *platform, *test, *subtest, *reason;
> +
> +	/* Skip comments and empty lines */
> +	line = trim(line);
> +	if (line[0] == '#' || line[0] == 0)
> +		return false;
> +
> +	/* Format: platform:test:subtest:reason */
> +	platform = strtok(line, ":");
> +	test = strtok(NULL, ":");
> +	subtest = strtok(NULL, ":");
> +	reason = strtok(NULL, "\n");
> +
> +	if (!platform || !test || !subtest) {
> +		igt_warn("Invalid config line format (expected platform:test:subtest:reason)\n");
> +		return false;
> +	}
> +
> +	/* Allocate and copy strings */
> +	entry->test_name = strdup(trim(test));
> +	entry->subtest_glob = strdup(trim(subtest));
> +	entry->reason = reason ? strdup(trim(reason)) : strdup("No reason");
> +
> +	/* Parse platform using vendor callback */
> +	platform = trim(platform);
> +	if (ctx->ops->parse_platform_config && strcmp(platform, "*") != 0) {
> +		/* Vendor-specific platform string */
> +		if (!ctx->ops->parse_platform_config(platform, &entry->platform_data)) {
> +			igt_warn("Failed to parse platform: %s\n", platform);
> +			free((void *)entry->test_name);
> +			free((void *)entry->subtest_glob);
> +			free((void *)entry->reason);
> +			return false;
> +		}
> +	} else {
> +		/* Wildcard or no vendor-specific parsing available */
> +		entry->platform_data = NULL;
> +	}
> +	return true;
> +}
> +
> +/* Load config file */
> +static void load_config_file(struct platform_filter_context *ctx, const char *filename)
> +{
> +	FILE *f;
> +	char line[MAX_LINE_LENGTH];
> +
> +	f = fopen(filename, "r");
> +	if (!f) {
> +		igt_debug("Config file not found: %s\n", filename);
> +
> +		return;
> +	}
> +
> +	igt_info("Loading platform skip config from: %s\n", filename);
> +
> +	while (fgets(line, sizeof(line), f)) {
> +		if (ctx->config_entry_count >= MAX_CONFIG_ENTRIES) {
> +			igt_warn("Config file has too many entries (max %d)\n",
> +			         MAX_CONFIG_ENTRIES);
> +			break;
> +		}
> +
> +		if (parse_config_line(ctx, line, &ctx->config_entries[ctx->config_entry_count])) {
> +			ctx->config_entry_count++;
> +		}
> +	}
> +
> +	fclose(f);
> +	igt_info("Loaded %d skip rules from config file\n", ctx->config_entry_count);
> +}
> +
> +/*
> + * ================================================================
> + * ENVIRONMENT VARIABLE PARSER (IGT_PLATFORM_SKIP_CONFIG)
> + * ================================================================ */
> +
> +/* Parse environment variable entries (semicolon-separated) */
> +static void load_env_variable(struct platform_filter_context *ctx)
> +{
> +	char *env, *env_copy, *entry_str, *saveptr;
> +	const char *env_value;
> +
> +	env_value = getenv("IGT_PLATFORM_SKIP_CONFIG");
> +	if (!env_value || env_value[0] == 0) {
> +		igt_debug("IGT_PLATFORM_SKIP_CONFIG not set\n");
> +
> +		return;
> +	}
> +
> +	igt_info("Loading platform skip config from IGT_PLATFORM_SKIP_CONFIG\n");
> +
> +	env_copy = strdup(env_value);
> +	env = env_copy;
> +
> +	/* Parse semicolon-separated entries */
> +	while ((entry_str = strtok_r(env, ";", &saveptr)) != NULL) {
> +		env = NULL; /* For subsequent strtok_r calls */
> +
> +		if (ctx->env_entry_count >= MAX_ENV_ENTRIES) {
> +			igt_warn("Too many env variable entries (max %d)\n",
> +			         MAX_ENV_ENTRIES);
> +			break;
> +		}
> +
> +		if (parse_config_line(ctx, entry_str, &ctx->env_entries[ctx->env_entry_count])) {
> +			ctx->env_entry_count++;
> +		}
> +	}
> +
> +	free(env_copy);
> +	igt_info("Loaded %d skip rules from environment variable\n", ctx->env_entry_count);
> +}
> +
> +/*
> + * ================================================================
> + * PUBLIC API IMPLEMENTATION
> + * ================================================================ */
> +
> +
> +/**
> + * igt_platform_filter_init:
> + * @ops: Platform-specific operation callbacks
> + * @platform_info: Vendor-specific platform identification data
> + *
> + * Initialize the platform filtering system with vendor-specific backend.
> + * This sets up the filter context and loads skip rules from three sources
> + * in priority order:
> + * 1. Built-in rules (highest priority, vendor-provided)
> + * 2. Config file /etc/igt/platform_skip.conf
> + * 3. Environment variable IGT_PLATFORM_SKIP_CONFIG (lowest priority)
> + *
> + * The filtering system is vendor-agnostic. Platform matching logic is
> + * provided through the @ops callbacks, allowing each vendor to implement
> + * their own identification scheme (e.g., AMD uses family_id/chip_rev,
> + * Intel could use platform_id/stepping).
> + *
> + * Must be called once before using igt_platform_require().
> + */
> +void igt_platform_filter_init(const struct platform_filter_ops *ops,
> +                               const void *platform_info)
> +{
> +	struct platform_filter_context *ctx = get_filter_context();
> +
> +	if (ctx->initialized)
> +
> +		return;
> +
> +	if (!ops) {
> +		igt_warn("Platform filter ops is NULL, filtering disabled\n");
> +
> +		return;
> +	}
> +
> +	ctx->ops = ops;
> +	ctx->platform_info = platform_info;
> +
> +	igt_info("Initializing platform filter system (3-tier priority) for vendor: %s\n",
> +	         ops->name ? ops->name : "unknown");
> +
> +	/* Get current platform name */
> +
> +	if (ops->get_platform_name) {
> +		const char *pname = ops->get_platform_name(platform_info);
> +		snprintf(ctx->current_platform_name, sizeof(ctx->current_platform_name),
> +		         "%s", pname ? pname : "unknown");
> +	}
> +
> +	/* Priority 1: Built-in array (vendor-specific) */
> +	igt_debug("  Priority 1: Built-in array (vendor-specific)\n");
> +
> +	/* Priority 2: Config file */
> +	igt_debug("  Priority 2: Config file /etc/igt/platform_skip.conf\n");
> +	load_config_file(ctx, "/etc/igt/platform_skip.conf");
> +
> +	/* Priority 3: Environment variable */
> +	igt_debug("  Priority 3: Environment variable IGT_PLATFORM_SKIP_CONFIG\n");
> +	load_env_variable(ctx);
> +
> +	ctx->initialized = true;
> +	igt_info("Platform filter initialization complete\n");
> +}
> +
> +/**
> + * igt_platform_should_skip:
> + * @test_name: Name of the test
> + * @subtest_name: Name of the subtest (or NULL for test-level check)
> + *
> + * Check if a test/subtest should be skipped based on platform filtering rules.
> + *
> + * Returns: true if the test should be skipped, false otherwise
> + */
> +bool igt_platform_should_skip(const char *test_name,
> +                               const char *subtest_name,
> +                               enum skip_source *source,
> +                               const char **reason)
> +{
> +	struct platform_filter_context *ctx = get_filter_context();
> +	const struct platform_skip_entry *entry;
> +	int i, count;
> +
> +	if (!ctx->initialized) {
> +		igt_warn("Platform filter not initialized\n");
> +		if (source)
> +			*source = SKIP_SOURCE_NONE;
> +		if (reason)
> +			*reason = NULL;
> +		return false;
> +	}
> +
> +	/* Priority 1: Check built-in array FIRST */
> +	if (ctx->ops->get_builtin_rules) {
> +		const struct platform_skip_entry *builtin = ctx->ops->get_builtin_rules(&count);
> +		for (i = 0; i < count; i++) {
> +			entry = &builtin[i];
> +			if (entry_matches(ctx, entry, test_name, subtest_name)) {
> +				if (source)
> +					*source = SKIP_SOURCE_BUILTIN;
> +				if (reason)
> +					*reason = entry->reason;
> +				igt_debug("Skip (built-in): %s:%s - %s\n",
> +				          entry->test_name ? entry->test_name : "*",
> +				          entry->subtest_glob ? entry->subtest_glob : "*",
> +				          entry->reason ? entry->reason : "no reason");
> +				return true;
> +			}
> +		}
> +	}
> +
> +	/* Priority 2: Check config file */
> +	for (i = 0; i < ctx->config_entry_count; i++) {
> +		entry = &ctx->config_entries[i];
> +		if (entry_matches(ctx, entry, test_name, subtest_name)) {
> +			if (source)
> +				*source = SKIP_SOURCE_CONFIG;
> +			if (reason)
> +				*reason = entry->reason;
> +			igt_debug("Skip (config): %s:%s - %s\n",
> +			          entry->test_name, entry->subtest_glob, entry->reason);
> +			return true;
> +		}
> +	}
> +
> +
> +	/* Priority 3: Check environment variable */
> +	for (i = 0; i < ctx->env_entry_count; i++) {
> +		entry = &ctx->env_entries[i];
> +		if (entry_matches(ctx, entry, test_name, subtest_name)) {
> +			if (source)
> +				*source = SKIP_SOURCE_ENV;
> +			if (reason)
> +				*reason = entry->reason;
> +			igt_debug("Skip (env): %s:%s - %s\n",
> +			          entry->test_name, entry->subtest_glob, entry->reason);
> +			return true;
> +		}
> +	}
> +
> +	if (source)
> +		*source = SKIP_SOURCE_NONE;
> +	if (reason)
> +		*reason = NULL;
> +	return false;
> +}
> +
> +/**
> + * igt_platform_require:
> + * @subtest_name: Name of the subtest to check
> + *
> + * Check if current subtest should be skipped and call igt_skip() if matched.
> + * This integrates platform filtering with IGT's standard skip mechanism.
> + *
> + * The function automatically determines the test name from igt_test_name().
> + * If a skip rule matches, calls igt_skip() with the configured reason.
> + */
> +void igt_platform_require(const char *subtest_name)
> +{
> +	enum skip_source source;
> +	const char *test_name = igt_test_name();
> +	const char *reason;
> +
> +	if (igt_platform_should_skip(test_name, subtest_name, &source, &reason)) {
> +
> +		const char *source_str;
> +
> +		switch (source) {
> +		case SKIP_SOURCE_BUILTIN:
> +			source_str = "built-in array";
> +			break;
> +		case SKIP_SOURCE_CONFIG:
> +			source_str = "config file";
> +			break;
> +		case SKIP_SOURCE_ENV:
> +			source_str = "environment variable";
> +			break;
> +		default:
> +			source_str = "unknown";
> +		}
> +
> +		igt_skip("Skipped on this platform [%s]: %s\n",
> +		         source_str, reason ? reason : "no reason");
> +	}
> +}
> +
> +/**
> + * igt_platform_filter_dump:
> + *
> + * Dump the current platform filtering configuration to stdout.
> + * Shows all loaded skip rules from built-in, config file, and environment
> + * variable sources. Useful for debugging which rules are active.
> + */
> +void igt_platform_filter_dump(void)
> +{
> +	struct platform_filter_context *ctx = get_filter_context();
> +	const struct platform_skip_entry *entry;
> +	int i, total_count, count;
> +
> +	if (!ctx->initialized) {
> +		igt_info("Platform filter not initialized\n");
> +
> +		return;
> +	}
> +
> +	igt_info("\n");
> +	igt_info("═══════════════════════════════════════════════════════════════════\n");
> +	igt_info(" PLATFORM SKIP FILTER CONFIGURATION - THREE-TIER PRIORITY SYSTEM\n");
> +	igt_info("═══════════════════════════════════════════════════════════════════\n\n");
> +
> +	igt_info("Vendor: %s\n", ctx->ops->name ? ctx->ops->name : "unknown");
> +	if (ctx->current_platform_name[0]) {
> +		igt_info("Current Platform: %s\n\n", ctx->current_platform_name);
> +	}
> +
> +	/* Priority 1: Built-in array */
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +	igt_info(" PRIORITY 1: BUILT-IN PRODUCTION ARRAY (VENDOR-SPECIFIC)\n");
> +	igt_info(" Source: Vendor implementation\n");
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +
> +	total_count = 0;
> +	if (ctx->ops->get_builtin_rules) {
> +		const struct platform_skip_entry *builtin = ctx->ops->get_builtin_rules(&count);
> +		for (i = 0; i < count; i++) {
> +			entry = &builtin[i];
> +			total_count++;
> +			igt_info("  %2d. %s : %s\n",
> +			       total_count,
> +			       entry->test_name ? entry->test_name : "*",
> +			       entry->subtest_glob ? entry->subtest_glob : "*");
> +			igt_info("      Reason: %s\n", entry->reason ? entry->reason : "no reason");
> +
> +			/* Print platform data if vendor provides dump callback */
> +			if (entry->platform_data && ctx->ops->dump_platform_data) {
> +				igt_info("      Platform: ");
> +				ctx->ops->dump_platform_data(entry->platform_data);
> +				igt_info("\n");
> +			}
> +			igt_info("\n");
> +		}
> +	}
> +	if (total_count == 0) {
> +		igt_info("  (No built-in rules)\n\n");
> +	}
> +
> +	/* Priority 2: Config file */
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +	igt_info(" PRIORITY 2: DEVELOPMENT CONFIG FILE\n");
> +	igt_info(" Source: /etc/igt/platform_skip.conf\n");
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +
> +	if (ctx->config_entry_count > 0) {
> +		for (i = 0; i < ctx->config_entry_count; i++) {
> +			entry = &ctx->config_entries[i];
> +			igt_info("  %2d. %s : %s\n",
> +			       i + 1,
> +			       entry->test_name,
> +			       entry->subtest_glob);
> +			igt_info("      Reason: %s\n\n", entry->reason);
> +		}
> +	} else {
> +		igt_info("  (No config file rules loaded)\n\n");
> +	}
> +
> +	/* Priority 3: Environment variable */
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +	igt_info(" PRIORITY 3: RUNTIME ENVIRONMENT VARIABLE\n");
> +	igt_info(" Source: IGT_PLATFORM_SKIP_CONFIG\n");
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +
> +	if (ctx->env_entry_count > 0) {
> +		for (i = 0; i < ctx->env_entry_count; i++) {
> +			entry = &ctx->env_entries[i];
> +
> +			igt_info("  %2d. %s : %s\n",
> +			       i + 1,
> +			       entry->test_name,
> +			       entry->subtest_glob);
> +			igt_info("      Reason: %s\n\n", entry->reason);
> +		}
> +	} else {
> +		igt_info("  (No environment variable rules)\n\n");
> +	}
> +
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +	igt_info(" SUMMARY\n");
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +	igt_info("  Built-in rules:     %d\n", total_count);
> +	igt_info("  Config file rules:  %d\n", ctx->config_entry_count);
> +	igt_info("  Environment rules:  %d\n", ctx->env_entry_count);
> +	igt_info("  Total skip rules:   %d\n", total_count + ctx->config_entry_count + ctx->env_entry_count);
> +	igt_info("\n");
> +	igt_info("═══════════════════════════════════════════════════════════════════\n\n");
> +}
> +
> +/**
> + * igt_platform_filter_dump_to_file:
> + * @filename: Path to output file
> + *
> + * Dump platform filtering configuration to a file.
> + *
> + * Returns: 0 on success, -1 on error
> + */
> +int igt_platform_filter_dump_to_file(const char *filename)
> +{
> +	FILE *old_stdout;
> +	FILE *f;
> +
> +	f = fopen(filename, "w");
> +	if (!f) {
> +		igt_warn("Failed to open %s for writing\n", filename);
> +		return -1;
> +	}
> +
> +	/* Redirect stdout to file */
> +	old_stdout = stdout;
> +	stdout = f;
> +
> +	igt_platform_filter_dump();
> +
> +	/* Restore stdout */
> +	stdout = old_stdout;
> +	fclose(f);
> +
> +	igt_info("Platform filter configuration dumped to: %s\n", filename);
> +	return 0;
> +}
> +
> +/**
> + * igt_platform_filter_is_initialized:
> + *
> + * Check if platform filtering has been initialized.
> + *
> + * Returns: true if initialized, false otherwise
> + */
> +bool igt_platform_filter_is_initialized(void)
> +{
> +	struct platform_filter_context *ctx = get_filter_context();
> +	return ctx && ctx->initialized;
> +}
> diff --git a/lib/igt_platform_filter.h b/lib/igt_platform_filter.h
> new file mode 100644
> index 000000000..d64450489
> --- /dev/null
> +++ b/lib/igt_platform_filter.h
> @@ -0,0 +1,122 @@
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
> +void igt_platform_filter_init(const struct platform_filter_ops *ops,
> +			       const void *platform_info);
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
> diff --git a/lib/meson.build b/lib/meson.build
> index 8db9fffde..807049954 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -38,6 +38,7 @@ lib_sources = [
>  	'igt_params.c',
>  	'igt_perf.c',
>  	'igt_pipe_crc.c',
> +	'igt_platform_filter.c',
>  	'igt_power.c',
>  	'igt_primes.c',
>  	'igt_pci.c',
> -- 
> 2.54.0
> 
