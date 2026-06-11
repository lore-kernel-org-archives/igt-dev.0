Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550A6CD98CE
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jun 2026 14:42:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EECE310E7D2;
	Thu, 11 Jun 2026 14:42:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hhgexUlq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D11AB10E7D2
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jun 2026 14:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781188946; x=1812724946;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QbbUui0xCSfGbck0p8jXjwucefIaavXRFYMVmlkPBPw=;
 b=hhgexUlqQ8fcoHfq9jxXGl7g9mcxGPg3X3jolLjQPpzU504l5LEgG7v6
 EzurGPVSpzGDzCp14Zf1leYVtWiCklQsnxQejEFApzgg5/oUFuzknDO9K
 mAjCJhiZEXPhDPRcSBsiP5+mmwU5a+A6czc6m1bJsPputauGNB6M5fzcT
 zpLS2dHqxtUz/qnAHONlvfjH39o5GSQkPEZ7iezWpp93KGxvk6AVmDs+e
 ncu6feHadwr5mUQYMWEXM1+E/EFHxdRxCsA/egpx7dzQDMXBh+exlVO2f
 x21Gf6s7/85n2TJ4BE8qwEQgYjLFiy4d4xy9TMx3N2vWskQFwr2BredSn A==;
X-CSE-ConnectionGUID: S3ug9HMnQVyml8I7LBjBqA==
X-CSE-MsgGUID: exwTNCrhQ9iisECYu/4LfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81985449"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="81985449"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 07:42:25 -0700
X-CSE-ConnectionGUID: lMosZW+3Re6l0hlfDT1OMw==
X-CSE-MsgGUID: GyFHggn2R7a7sqJThA2r2Q==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 07:42:23 -0700
Date: Thu, 11 Jun 2026 16:42:21 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Jesse Zhang <jesse.zhang@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH 2/4] lib: Implement generic platform filtering framework
Message-ID: <20260611144221.jkmpzxtrfsvjrmqn@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jesse Zhang <jesse.zhang@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20260610192208.88992-1-vitaly.prosyak@amd.com>
 <20260610192208.88992-2-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260610192208.88992-2-vitaly.prosyak@amd.com>
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
On 2026-06-10 at 15:21:25 -0400, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> Implement the vendor-agnostic platform filtering core that provides:
> 
> - Three-tier priority system:
>   1. Built-in rules (highest, vendor-specific, requires rebuild)
>   2. Config file /etc/igt/platform_skip.conf (no rebuild needed)
>   3. Environment variable IGT_PLATFORM_SKIP_CONFIG (runtime)
> 
> - Config file parsing with format: platform:test:subtest:reason
> - Environment variable parsing (semicolon-separated entries)
> - Wildcard/glob matching for test and subtest names
> - igt_platform_require() integration with igt_skip()
> - Dump functionality for debugging filter state
> 
> All state is held in struct platform_filter_context (no globals).
> Vendor backends are accessed exclusively through platform_filter_ops
> callbacks, keeping this code completely vendor-neutral.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Reviewed-by: Jesse Zhang <jesse.zhang@amd.com>
> ---
>  lib/igt_platform_filter.c | 498 ++++++++++++++++++++++++++++++++++++++
>  lib/meson.build           |   1 +
>  2 files changed, 499 insertions(+)
>  create mode 100644 lib/igt_platform_filter.c
> 
> diff --git a/lib/igt_platform_filter.c b/lib/igt_platform_filter.c
> new file mode 100644
> index 000000000..78744f3ef
> --- /dev/null
> +++ b/lib/igt_platform_filter.c
> @@ -0,0 +1,498 @@
> +/* SPDX-License-Identifier: MIT
> + * Copyright 2026 Advanced Micro Devices, Inc.
> + *
> + * Generic platform-based test filtering framework
> + *
> + * This is a vendor-agnostic filtering system. Vendor-specific logic
> + * is implemented via platform_filter_ops callbacks.
> + */
> +
> +#include <fnmatch.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <ctype.h>

ctype.h shuld be first.

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
> +/* ================================================================
> + * HELPER FUNCTIONS
> + * ================================================================ */
> +
> +/* Helper: Trim whitespace from string */
> +static char *trim(char *str)

imho such helpers should land in other headers, if they are
used in other places.

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
> +
> +	return fnmatch(pattern, str, 0) == 0;
> +}
> +
> +/* Helper: Check if entry matches platform/test/subtest */
> +static bool entry_matches(const struct platform_filter_context *ctx,
> +                          const struct platform_skip_entry *entry,
> +                          const char *test_name,
> +                          const char *subtest_name)
> +{
> +	/* Check platform match using vendor callback */
> +	if (entry->platform_data && ctx->ops->match_platform) {
> +		if (!ctx->ops->match_platform(ctx->platform_info, entry->platform_data))
> +			return false;
> +	}
> +
> +	/* Check test name match */
> +	if (entry->test_name && strcmp(entry->test_name, "*") != 0) {
> +		if (!test_name || !match_string(entry->test_name, test_name))
> +			return false;
> +	}
> +
> +	/* Check subtest glob match */
> +	if (entry->subtest_glob && strcmp(entry->subtest_glob, "*") != 0) {
> +		if (!subtest_name || !match_string(entry->subtest_glob, subtest_name))
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
> +/* ================================================================
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
> +	if (strcmp(platform, "*") == 0) {
> +		/* Wildcard - no platform restriction */
> +		entry->platform_data = NULL;
> +	} else if (ctx->ops->parse_platform_config) {
> +		if (!ctx->ops->parse_platform_config(platform, &entry->platform_data)) {
> +			igt_warn("Failed to parse platform: %s\n", platform);
> +			free((void *)entry->test_name);
> +			free((void *)entry->subtest_glob);
> +			free((void *)entry->reason);
> +			return false;
> +		}
> +	} else {
> +		entry->platform_data = NULL;
> +	}
> +
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
> +		return;
> +	}
> +
> +	igt_info("Loading platform skip config from: %s\n", filename);

Please keep igt_info() to mninimum, you have one at end
so imho igt_debug() here.

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
> +/* ================================================================
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
> +/* ================================================================
> + * PUBLIC API IMPLEMENTATION
> + * ================================================================ */
> +
> +void igt_platform_filter_init(const struct platform_filter_ops *ops,
> +                               const void *platform_info)
> +{
> +	struct platform_filter_context *ctx = get_filter_context();
> +
> +	if (ctx->initialized)
> +		return;
> +
> +	if (!ops) {
> +		igt_warn("Platform filter ops is NULL, filtering disabled\n");
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
> +void igt_platform_require(const char *test_name, const char *subtest_name)

What about integrated GPU and discrete GPU? For which one
you will apply this rule? Imho you need at least fd, for
new Intel platform there should also be GT id (int), so

void igt_platform_require(const char *name, int fd, ...)?

Regards,
Kamil

> +{
> +	enum skip_source source;
> +	const char *reason;
> +
> +	if (igt_platform_should_skip(test_name, subtest_name, &source, &reason)) {
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
> +void igt_platform_filter_dump(void)
> +{
> +	struct platform_filter_context *ctx = get_filter_context();
> +	const struct platform_skip_entry *entry;
> +	int i, total_count, count;
> +
> +	if (!ctx->initialized) {
> +		igt_info("Platform filter not initialized\n");
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
> diff --git a/lib/meson.build b/lib/meson.build
> index a8d6566ae..89edeb560 100644
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
