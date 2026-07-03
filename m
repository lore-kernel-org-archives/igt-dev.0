Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3534DC43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:11:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D415110F81E;
	Fri,  3 Jul 2026 14:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QfISjhkj";
	dkim-atps=neutral
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011060.outbound.protection.outlook.com [52.101.57.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FDEB10F820
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:11:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mWcmF9mtzkctyqUbfJXAU3Kjyfovhtee+7794nYYY4XaVmJk5BQ+OHPs2j2MdDo1jkCquuYKJvWAJqR+iozULAMBYIIOs0qCpCN7Rg7O7tQBTGDwzZPagnbSJCCDbSsTCjq0y48Cygd9JGmEzQRp7iR0q4qO9wgAecLmVHZfH65YY8k9BFTLfHVeNC5FOSpZusVl8UMzse+/xqxh7AsMqjOt74DpQ5eb1/2vDk1vJvx4QNgKxPASOeCBGRmkC+01VYRRJhyqAgp+wtRB2zDLwoOanWBEEEcn7TfDSVOdYAALcNSBB3RH5V6gy7aIhEhdV2W2Ehj3yBBdSP2jLHoESw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9EYY7ia1DdrlE48tKV7J/I6EEuej6St8DOYJBofDVDE=;
 b=vo0XLTlQtLhNK/9Pknx6JnKd/NzD9ix0JFYI+4N6J++9N4uJrCdJKMSXTKQ08dMoXXx9HhqhNvjzj21ZhSZ5UuPnH/gVyJFfgiE/BaRXvxnbQihI9LxzPYUHcZJvF60TwcG4BMj/2KDoFH+oZbdUPFGsC/BwYF5SUHulm8SzRdOACVIaMx71/QivWY7VqmCaK1zxikqdRRyf8AYcm/0oa1kEsHmrrC+1j72vj8RS4tNJ8PKeEswqaURKte3yze+TzPmjCXkGGou54kN0CeAwLU2b1ppONSUsYxSOWfFrvo/zHrQft92zPH+hoBLD4GWJmhbHuzmfyQZ1fiV5sCPHVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9EYY7ia1DdrlE48tKV7J/I6EEuej6St8DOYJBofDVDE=;
 b=QfISjhkjm8us22a1YpPmr1Osth2D9t3UcGNjorVXZfWhDynyjrVdGtkOoW/A5NxflAu2QPsa6F7t2UFWN2/0VO+w/JTTlkUO8UNDO3rV4DxD5oVlHCFKOW6peT5xA4o5A01awC/wGHOfXqqZ1B9XgSgAp2tYFzkMjUZMR1EtuvE=
Received: from CH0PR04CA0059.namprd04.prod.outlook.com (2603:10b6:610:77::34)
 by MN2PR12MB4318.namprd12.prod.outlook.com (2603:10b6:208:1d8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 14:11:20 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:77:cafe::98) by CH0PR04CA0059.outlook.office365.com
 (2603:10b6:610:77::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.11 via Frontend Transport; Fri, 3
 Jul 2026 14:11:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 3 Jul 2026 14:11:20 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 3 Jul
 2026 09:11:20 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 3 Jul
 2026 09:11:20 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 3 Jul 2026 09:11:19 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Jesse Zhang <jesse.zhang@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH 2/7] lib: Implement generic platform filtering framework
Date: Fri, 3 Jul 2026 10:08:22 -0400
Message-ID: <20260703141115.69015-2-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703141115.69015-1-vitaly.prosyak@amd.com>
References: <20260703141115.69015-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|MN2PR12MB4318:EE_
X-MS-Office365-Filtering-Correlation-Id: 367ab854-4324-42dc-c665-08ded90cf4f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|82310400026|376014|1800799024|36860700016|6133799003|56012099006|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: +JI58ZXM3e382KKPt6DRmimwiaaJmg//nbdHiHQ7OxYsXF83KVWqE+gIR0ZRGae4nle1tF0fgaDvVY1cmAtCeWPataURmGUSHHHdpd7ABarmkTgTf9rQy+BL11HQYJCwRAmuQbJZfL9LULRAFXczdsTnkMX2kaeE+5NTekf+ldqELuF+DVsMgZ623t9/9E0DTG3F8KAjjUFeKD5AhV5mDHmclHT9nm8TZkTptSBj1y8rjW5zdO6R9FqD6ctgz1qw17e7csbNCGIRvk60niUlkljucXIL71B1R8V69tf+uHjOMwgd1JGfzozfC3+3iLnPKWe5/6Ax8jcKKksN2RoKJizq5soLeAxLcDOR9vnlKEcltnB6pgtNstbLi8GS7m7TPI29KNfHkTqkvYPDrrB2Uv6AwBr8+K/KhjI/U6cC9rPGCMZ6EZ05m2wWboRV2j7rB73bA2VfNIl72N7ksWk71y9GPC84R/OfKc5gQ5OM1K44GrNMgpeRzKMDfWudKZiQgkce4G2Is5aIG5WPqU7bWlJJ4Rg+Kx7pFUldRBdriZsv0CPjJPQgvEXhwdzEPaMtmnJb2CbzJuL/8xejB+RQWErD6Wp82nTd4p6b43h4nI+7Ca+Om5xGrhYE+s8tmVSomNCODeaJPc7BEKmPqdC0phkbvD/daXBp8TkgwhiZKr4DZVnqWZPbUdHRoLq+FrcbJoz4+JmT6psJ1uFaaIpxLw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(82310400026)(376014)(1800799024)(36860700016)(6133799003)(56012099006)(11063799006)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7Z8alTJ1v1XivF4acBIKJUudz5QausxM7Q6Hyiqay8MAqLoSIU42n4C9PVMwH+gWo2latKYx6bEl/eUnFDz6T14G16/rvN4z1BktQt/lcE0OCOUSkyMQkfDN1JeZ7e6pIwXZYURNPbQ9gjJPsKbIkMut1up8X9z0jNpsoDFmm89oQk/UAi01GWJZ6m9TLKK5ey2Q3nthkQpjexsVIc6GO+F+g/xoALPcJOI/csdeszy+nkYbyICeaVn0HySxvXevfsrLCOSBBTNezEmZ+ZUuc8DAq+nVOrQBIdNOAE2xMiLg28991cew/Cx3M5FnCrMRxucmtsw6BJfy242SS6f7tVVzX9hrJkUamLkS1ITNw8Z2VXK7wNV6Se2Anj6ou/Lyq8aJGniqLHjHV1+yt1+I4RvT8uGQF0Z3j/3gl7J4SkGFPhmNIrtvzHPbfu2qGCN+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:11:20.5326 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 367ab854-4324-42dc-c665-08ded90cf4f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4318
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

v2: Address review feedback (2 comments from Kamil Konieczny, 3 from Krzysztof Karas):
    - Added comprehensive kernel-doc to all 5 public API functions (Kamil Konieczny)
    - Fixed comment style for section headers (Kamil Konieczny)
    - Fixed parse_config_line() code duplication (Krzysztof Karas)
    - Removed superfluous comments in entry_matches() (Krzysztof Karas)
    - Re-added (void*) casts to free() calls - required to avoid const qualifier
      warnings on some compilers, despite initial suggestion to remove them
    - Added newlines before return statements (both reviewers)

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reviewed-by: Jesse Zhang <jesse.zhang@amd.com>
Change-Id: I0a6ce532c2ef9913e68c9a23c8b9e642443a367e
---
 lib/igt_platform_filter.c | 579 ++++++++++++++++++++++++++++++++++++++
 lib/meson.build           |   1 +
 2 files changed, 580 insertions(+)
 create mode 100644 lib/igt_platform_filter.c

diff --git a/lib/igt_platform_filter.c b/lib/igt_platform_filter.c
new file mode 100644
index 000000000..5e2e7c744
--- /dev/null
+++ b/lib/igt_platform_filter.c
@@ -0,0 +1,579 @@
+// SPDX-License-Identifier: MIT
+// Copyright 2026 Advanced Micro Devices, Inc.
+/*
+ * Generic platform-based test filtering framework
+ *
+ * This is a vendor-agnostic filtering system. Vendor-specific logic
+ * is implemented via platform_filter_ops callbacks.
+ */
+
+#include <ctype.h>
+#include <fnmatch.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
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
+
+	return &ctx;
+}
+
+/*
+ * ================================================================
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
+
+		return str;
+
+	end = str + strlen(str) - 1;
+	while (end > str && isspace(*end))
+		end--;
+
+	*(end + 1) = 0;
+
+	return str;
+}
+
+/* Helper: Match wildcard or exact string */
+static bool match_string(const char *pattern, const char *str)
+{
+	if (!pattern || !str)
+
+		return false;
+
+	if (strcmp(pattern, "*") == 0)
+
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
+	if (entry->platform_data && ctx->ops->match_platform) {
+		if (!ctx->ops->match_platform(ctx->platform_info, entry->platform_data))
+
+			return false;
+	}
+
+	if (entry->test_name && strcmp(entry->test_name, "*") != 0) {
+		if (!test_name || !match_string(entry->test_name, test_name))
+
+			return false;
+	}
+
+	if (entry->subtest_glob && strcmp(entry->subtest_glob, "*") != 0) {
+		if (!subtest_name || !match_string(entry->subtest_glob, subtest_name))
+
+			return false;
+	}
+
+	return true;
+}
+
+/*
+ * ================================================================
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
+
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
+
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
+	if (ctx->ops->parse_platform_config && strcmp(platform, "*") != 0) {
+		/* Vendor-specific platform string */
+		if (!ctx->ops->parse_platform_config(platform, &entry->platform_data)) {
+			igt_warn("Failed to parse platform: %s\n", platform);
+			free((void *)entry->test_name);
+			free((void *)entry->subtest_glob);
+			free((void *)entry->reason);
+
+			return false;
+		}
+	} else {
+		/* Wildcard or no vendor-specific parsing available */
+		entry->platform_data = NULL;
+	}
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
+
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
+/*
+ * ================================================================
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
+
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
+/*
+ * ================================================================
+ * PUBLIC API IMPLEMENTATION
+ * ================================================================ */
+
+
+/**
+ * igt_platform_filter_init:
+ * @ops: Platform-specific operation callbacks
+ * @platform_info: Vendor-specific platform identification data
+ *
+ * Initialize the platform filtering system with vendor-specific backend.
+ * This sets up the filter context and loads skip rules from three sources
+ * in priority order:
+ * 1. Built-in rules (highest priority, vendor-provided)
+ * 2. Config file /etc/igt/platform_skip.conf
+ * 3. Environment variable IGT_PLATFORM_SKIP_CONFIG (lowest priority)
+ *
+ * The filtering system is vendor-agnostic. Platform matching logic is
+ * provided through the @ops callbacks, allowing each vendor to implement
+ * their own identification scheme (e.g., AMD uses family_id/chip_rev,
+ * Intel could use platform_id/stepping).
+ *
+ * Must be called once before using igt_platform_require().
+ */
+void igt_platform_filter_init(const struct platform_filter_ops *ops,
+                               const void *platform_info)
+{
+	struct platform_filter_context *ctx = get_filter_context();
+
+	if (ctx->initialized)
+
+		return;
+
+	if (!ops) {
+		igt_warn("Platform filter ops is NULL, filtering disabled\n");
+
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
+
+/**
+ * igt_platform_should_skip:
+ * @test_name: Name of the test
+ * @subtest_name: Name of the subtest (or NULL for test-level check)
+ *
+ * Check if a test/subtest should be skipped based on platform filtering rules.
+ *
+ * Returns: true if the test should be skipped, false otherwise
+ */
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
+
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
+
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
+
+			return true;
+		}
+	}
+
+
+/**
+ * igt_platform_require:
+ * @subtest_name: Name of the subtest to check
+ *
+ * Check if current subtest should be skipped and call igt_skip() if matched.
+ * This integrates platform filtering with IGT's standard skip mechanism.
+ *
+ * The function automatically determines the test name from igt_test_name().
+ * If a skip rule matches, calls igt_skip() with the configured reason.
+ */
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
+
+			return true;
+		}
+	}
+
+	if (source)
+		*source = SKIP_SOURCE_NONE;
+	if (reason)
+		*reason = NULL;
+
+	return false;
+}
+
+void igt_platform_require(const char *subtest_name)
+{
+	enum skip_source source;
+	const char *test_name = igt_test_name();
+	const char *reason;
+
+	if (igt_platform_should_skip(test_name, subtest_name, &source, &reason)) {
+
+/**
+ * igt_platform_filter_dump:
+ *
+ * Dump the current platform filtering configuration to stdout.
+ * Shows all loaded skip rules from built-in, config file, and environment
+ * variable sources. Useful for debugging which rules are active.
+ */
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
+
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
+
+/**
+ * igt_platform_filter_dump_to_file:
+ * @filename: Path to output file
+ *
+ * Dump platform filtering configuration to a file.
+ *
+ * Returns: 0 on success, -1 on error
+ */
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
+
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
+
+	return 0;
+}
diff --git a/lib/meson.build b/lib/meson.build
index d1289a5e0..ba0683995 100644
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

