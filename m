Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BED6C44500
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jul 2026 12:31:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3057C10F355;
	Thu,  2 Jul 2026 12:31:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mBrWUWrY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C810810F367
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jul 2026 12:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782995456; x=1814531456;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=GQUNN+TPRdcIaTtPfFt7pWL7Wqbj8zTAigp1GsvSVa0=;
 b=mBrWUWrYQmKQjBmkoe/QM6QM6qvPDOb2j6TNIM8APRIRE9nQ9TYp5PZB
 iY2p2BKaQXTPcTQYOKazODq48WREjrYyo3aFuchdpaHpP68dGTxDHGDxs
 S+fOqNl+bjs9udBhmloKg/EyWDZY+q70OcTABXJdge8OZ9HwFFPFeZq4D
 HzR7jlLv/NyLuRh839u4pT7T9Cywfagx6fEEkXDXrLT/0bmmR4aIcomLJ
 ZvoHKQq8DEkg1vi7+Er9BcJ4EJG+k4XaTLJdHr2zHOv4xybZVVlyydMZM
 VMii9SAPVOOFqJr4vXPZCBr/wNvcgMqbsteSqG53mEMbC88zAcpBtksI4 g==;
X-CSE-ConnectionGUID: CIz2D61YSXKzu15UbNS5jg==
X-CSE-MsgGUID: Nx0hsQ7UTSWNPkqIPbwejA==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="95252474"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="95252474"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 05:30:55 -0700
X-CSE-ConnectionGUID: F9gr9Tt8TQ6qWKC6p1ohHw==
X-CSE-MsgGUID: wWAx4Z5BQlqyqoAjEJzdsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="256759435"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 05:30:54 -0700
Date: Thu, 2 Jul 2026 14:30:51 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Jesse Zhang <jesse.zhang@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: Re: [PATCH 2/7] lib: Implement generic platform filtering framework
Message-ID: <20260702123051.ukssy2wopsijz5p4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jesse Zhang <jesse.zhang@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
References: <20260630032442.200729-1-vitaly.prosyak@amd.com>
 <20260630032442.200729-2-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260630032442.200729-2-vitaly.prosyak@amd.com>
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
On 2026-06-29 at 23:23:21 -0400, vitaly.prosyak@amd.com wrote:
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
> Change-Id: I0a6ce532c2ef9913e68c9a23c8b9e642443a367e
> ---
>  lib/igt_platform_filter.c | 499 ++++++++++++++++++++++++++++++++++++++
>  lib/meson.build           |   1 +
>  2 files changed, 500 insertions(+)
>  create mode 100644 lib/igt_platform_filter.c
> 
> diff --git a/lib/igt_platform_filter.c b/lib/igt_platform_filter.c
> new file mode 100644
> index 000000000..4ae0d6df9
> --- /dev/null
> +++ b/lib/igt_platform_filter.c
> @@ -0,0 +1,499 @@
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

Add neline before return, here and in other places.

> +	return &ctx;
> +}
> +
> +/* ================================================================
> + * HELPER FUNCTIONS
> + * ================================================================ */

Use C-style:
  * ================================================================
  */

Same applies to other '===' lines.

You can catch this and other whitespace/align problems with
the help of checkpatch.pl script.

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

Here also add newline before return.

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

Add documentation here and to all other public lib functions.

> +void igt_platform_filter_init(const struct platform_filter_ops *ops,
> +                               const void *platform_info)
> +{
> +	struct platform_filter_context *ctx = get_filter_context();
> +
[cut]

Regards,
Kamil
