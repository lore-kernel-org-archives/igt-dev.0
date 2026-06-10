Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99419CD98C7
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jun 2026 19:22:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4908210EBC3;
	Wed, 10 Jun 2026 19:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="03rKVoJn";
	dkim-atps=neutral
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011015.outbound.protection.outlook.com [52.101.62.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6EA10EBB9
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2026 19:22:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nc/vmo1ua4bB61Bwb1s3DGHKww4Yj+UCHwVQvTPoo/Q0XODXzlG0Y3UvvHKDP83jiRS/i/h9ej0o7IEFJKF84sZOMaSlvjpkXdKfWWaU4sA2h2ZwL32YnzQ+oMfblqHU/YTxE4QZJYkQEXHWJQqeKrg4uRWBKNsyP400roLe7ZvSeVeCNsJHEXiK10teOChC+ZPJIBBvaWxODSUze3d8rNuNwALxolhMVD0MpHMzjlbNKIRnDa8AV9wNVrWwWhfUsso6DBKiFyhKLF3aO3FLZvM9aoL9OAAFzYhd4B8A702syXIrJ2+rwKQpI3fDmZ97G3h18VJnD63+PB62dzvHMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SDj1cSWmgPa7Ks6eLy2bd+jxer3VrOWl0buuSNEbhNc=;
 b=eV6/YN03TtLhxxMlgtEHS2glMu1WWbfb2aRvUsjd1llmYKtQxorXL2ZqEsd7VYBj6g+IpIFp5JUrb6XFML3lbtSGp8rM0iWgz+WfJvJl17jI7XzTQNWfBfL8E60QA0YLKHEdC85jzsbuwh4XTSTTpvv9WT5IE+o3IOVZF3ptj5vnC7UFzqyX8aMdkOvkkDckSZcY7Nf/BoMQL2yDlspddYdkGUV008eLFkkjKeHclo8gX55iKshzqqSrSaUCC33//VzOYKgZPKE0DqwPel62oPad3ZAI96+Rq26CECeLdoVGoeiAxm0rmpm3sv5htx+3g1wRO3nroanVVb+UfhKF9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SDj1cSWmgPa7Ks6eLy2bd+jxer3VrOWl0buuSNEbhNc=;
 b=03rKVoJnapl88Lu4RXM+zBMsh9LjjaBiNLblmSVnnyWHHYD+Yazo+VFlbdFo+OLCdf7X9M7OZuIjO1XJ0wbM0r3zzY0RGi989Bw4CWLNl0I1qBA1/rVEs+GHf2bqqYKx1IiB+upERjQaT08ts7W9gvG8d2nImd6D5LEqfaTFhPY=
Received: from MN0P222CA0030.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::32)
 by CH2PR12MB4119.namprd12.prod.outlook.com (2603:10b6:610:aa::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Wed, 10 Jun
 2026 19:22:12 +0000
Received: from BN1PEPF00004688.namprd05.prod.outlook.com
 (2603:10b6:208:531:cafe::10) by MN0P222CA0030.outlook.office365.com
 (2603:10b6:208:531::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.12 via Frontend Transport; Wed,
 10 Jun 2026 19:22:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00004688.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 19:22:12 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 10 Jun
 2026 14:22:11 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 10 Jun 2026 14:22:11 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Jesse Zhang <jesse.zhang@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 2/4] lib: Implement generic platform filtering framework
Date: Wed, 10 Jun 2026 15:21:25 -0400
Message-ID: <20260610192208.88992-2-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260610192208.88992-1-vitaly.prosyak@amd.com>
References: <20260610192208.88992-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004688:EE_|CH2PR12MB4119:EE_
X-MS-Office365-Filtering-Correlation-Id: 62342d64-11ad-4211-105c-08dec72592b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700016|23010399003|6133799003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: wrh6IjjQB5PeI6QpoZ1rpq4HDjRFZSaxsJ4Q8iORbZhZKEI7vPGpyfMOr2RcSXIjxm+oU6Lq0f9fC2oEpbplsJ7ahSAWx28pNk2wWth/DsdJk84eRadSm4SiTwEmTD+eDOFSK0UPHoD1c16Y5R0NwEui5auO3HYg3ajL+19gnONbrADjsfsy4h76Qjl6+Ofa1Y/c5slqibeWcWH4wz5YM2IMv5l01javYi9umr4oDBZl2bXs5ABLzvH4zscY+i8nU7tGAH/CD5DM41HxQbqor1gH58QNOYjnSPfOgdnpOYnK0wwJ+e+L4oUw2noqsydCuV5Gm4E/U2FVLjEpo2XeieVLh8I5yEcefgybpP4r+tBHNoJ6wQFJQfrZampfjPcYJDYrAruOoPGebT5694DGh53vjP4tXlzeP3gnLoTLhmTwvq9Sc0JSp2Ps0qSGbKZdDULuRjTKkbq8bH0QFeanvKmt48/kTqxjczv/eICFitDkiI6kDX5BrTUrCuCyc2a0GlXSHwdQAaPt4PzBoTumah4SakcrpVpGJ0vt0fFncuK/KvxdiwDl8nmGGYU28tt7hPVcCwZ6mf/S8E8H0xUSFn9xmmygq19QhIlyc3wm8891Ic8o+ubPIoBe61SnrboTk8OOzDWbvHH3lHhGwwvayCOlk1QpcjsRQxT2dwrG3YqF1spJesZheWeoOQwDfOC23xlousn4JoEoCoshrpLowoc580Abjuhez8Tap7lFIKs=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(23010399003)(6133799003)(11063799006)(18002099003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: IQMeXn3khpJuNZKYXWu3VKvbzh0tZl2ZuMHWqAU2F7qYbs7ENVeJElvXe5UylhB/RDt1tm3dGvott5FuRiKRZCFcMHVAfbri89lADZkpOita0lDxFYbcR7W5ZwDVCbQBmYK3hO1poxSFi2qMm5a/NYg9QrtQAozU0Ox2hJkYth9ApA7KyD4fTfQydExLfck7Zm9LnGgNCHMFlRo+9jzWdKQOm1HdyVUv4/uKZtfGD3HxpiBgfw/8yc8gXqKtIMJCEqN6GwAhcjN9n7WdagCYr9J43RZeHw2BEUSej6XP/ngBz+hFJ8/bSomd42cA241V6gakF8WSFZNySQib2zhN6LEWjI2NHh4UUnmmDMy7V/XXwagIsfEuqS2jolOfXfN4EHlfJy53G9cWIdRsy9Cu2YId4V20AedSjTKNyub/JZH8WtPKn0Wm5qEo1/5pw5b1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 19:22:12.1911 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62342d64-11ad-4211-105c-08dec72592b7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004688.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4119
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

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Implement the vendor-agnostic platform filtering core that provides:

- Three-tier priority system:
  1. Built-in rules (highest, vendor-specific, requires rebuild)
  2. Config file /etc/igt/platform_skip.conf (no rebuild needed)
  3. Environment variable IGT_PLATFORM_SKIP_CONFIG (runtime)

- Config file parsing with format: platform:test:subtest:reason
- Environment variable parsing (semicolon-separated entries)
- Wildcard/glob matching for test and subtest names
- igt_platform_require() integration with igt_skip()
- Dump functionality for debugging filter state

All state is held in struct platform_filter_context (no globals).
Vendor backends are accessed exclusively through platform_filter_ops
callbacks, keeping this code completely vendor-neutral.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reviewed-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/igt_platform_filter.c | 498 ++++++++++++++++++++++++++++++++++++++
 lib/meson.build           |   1 +
 2 files changed, 499 insertions(+)
 create mode 100644 lib/igt_platform_filter.c

diff --git a/lib/igt_platform_filter.c b/lib/igt_platform_filter.c
new file mode 100644
index 000000000..78744f3ef
--- /dev/null
+++ b/lib/igt_platform_filter.c
@@ -0,0 +1,498 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright 2026 Advanced Micro Devices, Inc.
+ *
+ * Generic platform-based test filtering framework
+ *
+ * This is a vendor-agnostic filtering system. Vendor-specific logic
+ * is implemented via platform_filter_ops callbacks.
+ */
+
+#include <fnmatch.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <ctype.h>
+
+#include "igt.h"
+#include "igt_platform_filter.h"
+
+/* Maximum entries from config file and env variable */
+#define MAX_CONFIG_ENTRIES 256
+#define MAX_ENV_ENTRIES 128
+#define MAX_LINE_LENGTH 512
+
+/* Filter context - holds all runtime state (no globals) */
+struct platform_filter_context {
+	const struct platform_filter_ops *ops;
+	const void *platform_info;
+
+	struct platform_skip_entry config_entries[MAX_CONFIG_ENTRIES];
+	int config_entry_count;
+
+	struct platform_skip_entry env_entries[MAX_ENV_ENTRIES];
+	int env_entry_count;
+
+	bool initialized;
+	char current_platform_name[64];
+};
+
+/* Single static instance - initialized on first use */
+static struct platform_filter_context *get_filter_context(void)
+{
+	static struct platform_filter_context ctx = {0};
+	return &ctx;
+}
+
+/* ================================================================
+ * HELPER FUNCTIONS
+ * ================================================================ */
+
+/* Helper: Trim whitespace from string */
+static char *trim(char *str)
+{
+	char *end;
+
+	while (isspace(*str))
+		str++;
+
+	if (*str == 0)
+		return str;
+
+	end = str + strlen(str) - 1;
+	while (end > str && isspace(*end))
+		end--;
+
+	*(end + 1) = 0;
+	return str;
+}
+
+/* Helper: Match wildcard or exact string */
+static bool match_string(const char *pattern, const char *str)
+{
+	if (!pattern || !str)
+		return false;
+
+	if (strcmp(pattern, "*") == 0)
+		return true;
+
+	return fnmatch(pattern, str, 0) == 0;
+}
+
+/* Helper: Check if entry matches platform/test/subtest */
+static bool entry_matches(const struct platform_filter_context *ctx,
+                          const struct platform_skip_entry *entry,
+                          const char *test_name,
+                          const char *subtest_name)
+{
+	/* Check platform match using vendor callback */
+	if (entry->platform_data && ctx->ops->match_platform) {
+		if (!ctx->ops->match_platform(ctx->platform_info, entry->platform_data))
+			return false;
+	}
+
+	/* Check test name match */
+	if (entry->test_name && strcmp(entry->test_name, "*") != 0) {
+		if (!test_name || !match_string(entry->test_name, test_name))
+			return false;
+	}
+
+	/* Check subtest glob match */
+	if (entry->subtest_glob && strcmp(entry->subtest_glob, "*") != 0) {
+		if (!subtest_name || !match_string(entry->subtest_glob, subtest_name))
+			return false;
+	}
+
+	return true;
+}
+
+/* ================================================================
+ * CONFIG FILE PARSER (/etc/igt/platform_skip.conf)
+ * ================================================================ */
+
+/* Parse one line from config file */
+static bool parse_config_line(struct platform_filter_context *ctx,
+                               char *line,
+                               struct platform_skip_entry *entry)
+{
+	char *platform, *test, *subtest, *reason;
+
+	/* Skip comments and empty lines */
+	line = trim(line);
+	if (line[0] == '#' || line[0] == 0)
+		return false;
+
+	/* Format: platform:test:subtest:reason */
+	platform = strtok(line, ":");
+	test = strtok(NULL, ":");
+	subtest = strtok(NULL, ":");
+	reason = strtok(NULL, "\n");
+
+	if (!platform || !test || !subtest) {
+		igt_warn("Invalid config line format (expected platform:test:subtest:reason)\n");
+		return false;
+	}
+
+	/* Allocate and copy strings */
+	entry->test_name = strdup(trim(test));
+	entry->subtest_glob = strdup(trim(subtest));
+	entry->reason = reason ? strdup(trim(reason)) : strdup("No reason");
+
+	/* Parse platform using vendor callback */
+	platform = trim(platform);
+	if (strcmp(platform, "*") == 0) {
+		/* Wildcard - no platform restriction */
+		entry->platform_data = NULL;
+	} else if (ctx->ops->parse_platform_config) {
+		if (!ctx->ops->parse_platform_config(platform, &entry->platform_data)) {
+			igt_warn("Failed to parse platform: %s\n", platform);
+			free((void *)entry->test_name);
+			free((void *)entry->subtest_glob);
+			free((void *)entry->reason);
+			return false;
+		}
+	} else {
+		entry->platform_data = NULL;
+	}
+
+	return true;
+}
+
+/* Load config file */
+static void load_config_file(struct platform_filter_context *ctx, const char *filename)
+{
+	FILE *f;
+	char line[MAX_LINE_LENGTH];
+
+	f = fopen(filename, "r");
+	if (!f) {
+		igt_debug("Config file not found: %s\n", filename);
+		return;
+	}
+
+	igt_info("Loading platform skip config from: %s\n", filename);
+
+	while (fgets(line, sizeof(line), f)) {
+		if (ctx->config_entry_count >= MAX_CONFIG_ENTRIES) {
+			igt_warn("Config file has too many entries (max %d)\n",
+			         MAX_CONFIG_ENTRIES);
+			break;
+		}
+
+		if (parse_config_line(ctx, line, &ctx->config_entries[ctx->config_entry_count])) {
+			ctx->config_entry_count++;
+		}
+	}
+
+	fclose(f);
+	igt_info("Loaded %d skip rules from config file\n", ctx->config_entry_count);
+}
+
+/* ================================================================
+ * ENVIRONMENT VARIABLE PARSER (IGT_PLATFORM_SKIP_CONFIG)
+ * ================================================================ */
+
+/* Parse environment variable entries (semicolon-separated) */
+static void load_env_variable(struct platform_filter_context *ctx)
+{
+	char *env, *env_copy, *entry_str, *saveptr;
+	const char *env_value;
+
+	env_value = getenv("IGT_PLATFORM_SKIP_CONFIG");
+	if (!env_value || env_value[0] == 0) {
+		igt_debug("IGT_PLATFORM_SKIP_CONFIG not set\n");
+		return;
+	}
+
+	igt_info("Loading platform skip config from IGT_PLATFORM_SKIP_CONFIG\n");
+
+	env_copy = strdup(env_value);
+	env = env_copy;
+
+	/* Parse semicolon-separated entries */
+	while ((entry_str = strtok_r(env, ";", &saveptr)) != NULL) {
+		env = NULL; /* For subsequent strtok_r calls */
+
+		if (ctx->env_entry_count >= MAX_ENV_ENTRIES) {
+			igt_warn("Too many env variable entries (max %d)\n",
+			         MAX_ENV_ENTRIES);
+			break;
+		}
+
+		if (parse_config_line(ctx, entry_str, &ctx->env_entries[ctx->env_entry_count])) {
+			ctx->env_entry_count++;
+		}
+	}
+
+	free(env_copy);
+	igt_info("Loaded %d skip rules from environment variable\n", ctx->env_entry_count);
+}
+
+/* ================================================================
+ * PUBLIC API IMPLEMENTATION
+ * ================================================================ */
+
+void igt_platform_filter_init(const struct platform_filter_ops *ops,
+                               const void *platform_info)
+{
+	struct platform_filter_context *ctx = get_filter_context();
+
+	if (ctx->initialized)
+		return;
+
+	if (!ops) {
+		igt_warn("Platform filter ops is NULL, filtering disabled\n");
+		return;
+	}
+
+	ctx->ops = ops;
+	ctx->platform_info = platform_info;
+
+	igt_info("Initializing platform filter system (3-tier priority) for vendor: %s\n",
+	         ops->name ? ops->name : "unknown");
+
+	/* Get current platform name */
+	if (ops->get_platform_name) {
+		const char *pname = ops->get_platform_name(platform_info);
+		snprintf(ctx->current_platform_name, sizeof(ctx->current_platform_name),
+		         "%s", pname ? pname : "unknown");
+	}
+
+	/* Priority 1: Built-in array (vendor-specific) */
+	igt_debug("  Priority 1: Built-in array (vendor-specific)\n");
+
+	/* Priority 2: Config file */
+	igt_debug("  Priority 2: Config file /etc/igt/platform_skip.conf\n");
+	load_config_file(ctx, "/etc/igt/platform_skip.conf");
+
+	/* Priority 3: Environment variable */
+	igt_debug("  Priority 3: Environment variable IGT_PLATFORM_SKIP_CONFIG\n");
+	load_env_variable(ctx);
+
+	ctx->initialized = true;
+	igt_info("Platform filter initialization complete\n");
+}
+
+bool igt_platform_should_skip(const char *test_name,
+                               const char *subtest_name,
+                               enum skip_source *source,
+                               const char **reason)
+{
+	struct platform_filter_context *ctx = get_filter_context();
+	const struct platform_skip_entry *entry;
+	int i, count;
+
+	if (!ctx->initialized) {
+		igt_warn("Platform filter not initialized\n");
+		if (source)
+			*source = SKIP_SOURCE_NONE;
+		if (reason)
+			*reason = NULL;
+		return false;
+	}
+
+	/* Priority 1: Check built-in array FIRST */
+	if (ctx->ops->get_builtin_rules) {
+		const struct platform_skip_entry *builtin = ctx->ops->get_builtin_rules(&count);
+		for (i = 0; i < count; i++) {
+			entry = &builtin[i];
+			if (entry_matches(ctx, entry, test_name, subtest_name)) {
+				if (source)
+					*source = SKIP_SOURCE_BUILTIN;
+				if (reason)
+					*reason = entry->reason;
+				igt_debug("Skip (built-in): %s:%s - %s\n",
+				          entry->test_name ? entry->test_name : "*",
+				          entry->subtest_glob ? entry->subtest_glob : "*",
+				          entry->reason ? entry->reason : "no reason");
+				return true;
+			}
+		}
+	}
+
+	/* Priority 2: Check config file */
+	for (i = 0; i < ctx->config_entry_count; i++) {
+		entry = &ctx->config_entries[i];
+		if (entry_matches(ctx, entry, test_name, subtest_name)) {
+			if (source)
+				*source = SKIP_SOURCE_CONFIG;
+			if (reason)
+				*reason = entry->reason;
+			igt_debug("Skip (config): %s:%s - %s\n",
+			          entry->test_name, entry->subtest_glob, entry->reason);
+			return true;
+		}
+	}
+
+	/* Priority 3: Check environment variable */
+	for (i = 0; i < ctx->env_entry_count; i++) {
+		entry = &ctx->env_entries[i];
+		if (entry_matches(ctx, entry, test_name, subtest_name)) {
+			if (source)
+				*source = SKIP_SOURCE_ENV;
+			if (reason)
+				*reason = entry->reason;
+			igt_debug("Skip (env): %s:%s - %s\n",
+			          entry->test_name, entry->subtest_glob, entry->reason);
+			return true;
+		}
+	}
+
+	if (source)
+		*source = SKIP_SOURCE_NONE;
+	if (reason)
+		*reason = NULL;
+	return false;
+}
+
+void igt_platform_require(const char *test_name, const char *subtest_name)
+{
+	enum skip_source source;
+	const char *reason;
+
+	if (igt_platform_should_skip(test_name, subtest_name, &source, &reason)) {
+		const char *source_str;
+
+		switch (source) {
+		case SKIP_SOURCE_BUILTIN:
+			source_str = "built-in array";
+			break;
+		case SKIP_SOURCE_CONFIG:
+			source_str = "config file";
+			break;
+		case SKIP_SOURCE_ENV:
+			source_str = "environment variable";
+			break;
+		default:
+			source_str = "unknown";
+		}
+
+		igt_skip("Skipped on this platform [%s]: %s\n",
+		         source_str, reason ? reason : "no reason");
+	}
+}
+
+void igt_platform_filter_dump(void)
+{
+	struct platform_filter_context *ctx = get_filter_context();
+	const struct platform_skip_entry *entry;
+	int i, total_count, count;
+
+	if (!ctx->initialized) {
+		igt_info("Platform filter not initialized\n");
+		return;
+	}
+
+	igt_info("\n");
+	igt_info("═══════════════════════════════════════════════════════════════════\n");
+	igt_info(" PLATFORM SKIP FILTER CONFIGURATION - THREE-TIER PRIORITY SYSTEM\n");
+	igt_info("═══════════════════════════════════════════════════════════════════\n\n");
+
+	igt_info("Vendor: %s\n", ctx->ops->name ? ctx->ops->name : "unknown");
+	if (ctx->current_platform_name[0]) {
+		igt_info("Current Platform: %s\n\n", ctx->current_platform_name);
+	}
+
+	/* Priority 1: Built-in array */
+	igt_info("───────────────────────────────────────────────────────────────────\n");
+	igt_info(" PRIORITY 1: BUILT-IN PRODUCTION ARRAY (VENDOR-SPECIFIC)\n");
+	igt_info(" Source: Vendor implementation\n");
+	igt_info("───────────────────────────────────────────────────────────────────\n");
+
+	total_count = 0;
+	if (ctx->ops->get_builtin_rules) {
+		const struct platform_skip_entry *builtin = ctx->ops->get_builtin_rules(&count);
+		for (i = 0; i < count; i++) {
+			entry = &builtin[i];
+			total_count++;
+			igt_info("  %2d. %s : %s\n",
+			       total_count,
+			       entry->test_name ? entry->test_name : "*",
+			       entry->subtest_glob ? entry->subtest_glob : "*");
+			igt_info("      Reason: %s\n", entry->reason ? entry->reason : "no reason");
+
+			/* Print platform data if vendor provides dump callback */
+			if (entry->platform_data && ctx->ops->dump_platform_data) {
+				igt_info("      Platform: ");
+				ctx->ops->dump_platform_data(entry->platform_data);
+				igt_info("\n");
+			}
+			igt_info("\n");
+		}
+	}
+	if (total_count == 0) {
+		igt_info("  (No built-in rules)\n\n");
+	}
+
+	/* Priority 2: Config file */
+	igt_info("───────────────────────────────────────────────────────────────────\n");
+	igt_info(" PRIORITY 2: DEVELOPMENT CONFIG FILE\n");
+	igt_info(" Source: /etc/igt/platform_skip.conf\n");
+	igt_info("───────────────────────────────────────────────────────────────────\n");
+
+	if (ctx->config_entry_count > 0) {
+		for (i = 0; i < ctx->config_entry_count; i++) {
+			entry = &ctx->config_entries[i];
+			igt_info("  %2d. %s : %s\n",
+			       i + 1,
+			       entry->test_name,
+			       entry->subtest_glob);
+			igt_info("      Reason: %s\n\n", entry->reason);
+		}
+	} else {
+		igt_info("  (No config file rules loaded)\n\n");
+	}
+
+	/* Priority 3: Environment variable */
+	igt_info("───────────────────────────────────────────────────────────────────\n");
+	igt_info(" PRIORITY 3: RUNTIME ENVIRONMENT VARIABLE\n");
+	igt_info(" Source: IGT_PLATFORM_SKIP_CONFIG\n");
+	igt_info("───────────────────────────────────────────────────────────────────\n");
+
+	if (ctx->env_entry_count > 0) {
+		for (i = 0; i < ctx->env_entry_count; i++) {
+			entry = &ctx->env_entries[i];
+			igt_info("  %2d. %s : %s\n",
+			       i + 1,
+			       entry->test_name,
+			       entry->subtest_glob);
+			igt_info("      Reason: %s\n\n", entry->reason);
+		}
+	} else {
+		igt_info("  (No environment variable rules)\n\n");
+	}
+
+	igt_info("───────────────────────────────────────────────────────────────────\n");
+	igt_info(" SUMMARY\n");
+	igt_info("───────────────────────────────────────────────────────────────────\n");
+	igt_info("  Built-in rules:     %d\n", total_count);
+	igt_info("  Config file rules:  %d\n", ctx->config_entry_count);
+	igt_info("  Environment rules:  %d\n", ctx->env_entry_count);
+	igt_info("  Total skip rules:   %d\n", total_count + ctx->config_entry_count + ctx->env_entry_count);
+	igt_info("\n");
+	igt_info("═══════════════════════════════════════════════════════════════════\n\n");
+}
+
+int igt_platform_filter_dump_to_file(const char *filename)
+{
+	FILE *old_stdout;
+	FILE *f;
+
+	f = fopen(filename, "w");
+	if (!f) {
+		igt_warn("Failed to open %s for writing\n", filename);
+		return -1;
+	}
+
+	/* Redirect stdout to file */
+	old_stdout = stdout;
+	stdout = f;
+
+	igt_platform_filter_dump();
+
+	/* Restore stdout */
+	stdout = old_stdout;
+	fclose(f);
+
+	igt_info("Platform filter configuration dumped to: %s\n", filename);
+	return 0;
+}
diff --git a/lib/meson.build b/lib/meson.build
index a8d6566ae..89edeb560 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -38,6 +38,7 @@ lib_sources = [
 	'igt_params.c',
 	'igt_perf.c',
 	'igt_pipe_crc.c',
+	'igt_platform_filter.c',
 	'igt_power.c',
 	'igt_primes.c',
 	'igt_pci.c',
-- 
2.54.0

