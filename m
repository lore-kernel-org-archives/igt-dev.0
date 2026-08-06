Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902E9C55ABA
	for <igt-dev@archiver.kernel.org>; Thu,  6 Aug 2026 02:39:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15AFF10E167;
	Thu,  6 Aug 2026 02:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IcZj7kg9";
	dkim-atps=neutral
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012044.outbound.protection.outlook.com [40.107.209.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA2B10E27D
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Aug 2026 02:37:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJsRAtU1oyXBp0/VlQOHVDrEhtzBLOcQ3Ih/tVjteB5Ycq4+cvTpAi0lYoJC+iECM4cta036bAWzNCP//j47v81qWTnuP4sWnq/5G5BY1corwlkMCu5IQj0eomZvtAx6YhS3yIav3Qyb1vdyZZOgaJ3Cmb+YHuOhFcN0dZBIKnD2cbCWa/IuLfvGphZD5yNkH6wbrMDuWmPtJp8SjrS5yKNzpfeoRyQiFmRG49dXJco+V3paNX4yeU6TVLC+X2HNXSQbnKrK4Bxg64Hdyv1HXi+t2/oDq2RLaXr6IdXrkCyJhM0VHkhUuzi8fOeKeeAZXqWIy+bzpgHxCwu+20a5Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4/vVeJYREWsVlo92Ihd5e1NwGev6kL2osrNWoXieT0=;
 b=B3poQZ9FYy2vuep7rdd3ySdHOSFVheV1voIUWY/X53GowJf0qVYrdDZ3DAJPOWicU45g9r7FhhbHo+fDADnTISmuo1CfqYnttWyRTaqdUhHCbY97lyzJu3V6W2dWQmby8xGC1EbHGrp7BLyvomMUDSLCWtCpYXZxmT6+yicFGkCvDnMWe97yXh053LcDQwO92NhIu/7zyUe7m/JXsZjBoPLj5Uc9mncAd5wxQH+q1+nZuNZodCBdEzRNiHURqnu3rDU+z0cKBZxWW7+LLSUObH3APno6pbMpXZekDDKw8K9RFakeg+pp55i8UYosaSSpGoidOaIV5KP9e+ID1o3ZeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4/vVeJYREWsVlo92Ihd5e1NwGev6kL2osrNWoXieT0=;
 b=IcZj7kg9mYR35t1pwCdv/YYNmcRbRUtiva58QkaiGbLGNJ+jsyYvgb0UtA9kLm2mQfSgiwu2zQE2YMwu2drG/dGduckhc4jjNshFZol1ItwaiurQt3enG8LpWyL87Rzapf26Y0qLAxhMtDdpYPNu1YiLBLbft1QcCYKrnynYv2c=
Received: from MN2PR18CA0012.namprd18.prod.outlook.com (2603:10b6:208:23c::17)
 by DS7PR12MB8081.namprd12.prod.outlook.com (2603:10b6:8:e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 02:37:28 +0000
Received: from BL02EPF0002992D.namprd02.prod.outlook.com
 (2603:10b6:208:23c:cafe::66) by MN2PR18CA0012.outlook.office365.com
 (2603:10b6:208:23c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.19 via Frontend Transport; Thu, 6
 Aug 2026 02:37:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0002992D.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Thu, 6 Aug 2026 02:37:27 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 5 Aug
 2026 21:37:26 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 5 Aug 2026 21:37:26 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <jani.nikula@linux.intel.com>,
 <krzysztof.karas@intel.com>, <krzysztof.kozlowski@canonical.com>,
 <jesse.zhang@amd.com>, <christian.koenig@amd.com>,
 <alexander.deucher@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH v5 1/4] lib: Add generic platform filtering framework
Date: Wed, 5 Aug 2026 22:36:10 -0400
Message-ID: <20260806023718.204279-2-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260806023718.204279-1-vitaly.prosyak@amd.com>
References: <20260806023718.204279-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992D:EE_|DS7PR12MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c0321fe-e47d-4787-8357-08def363a7ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|23010399003|376014|82310400026|11063799006|10067099003|6133799003|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 6z5OvaKfBrIE7IhmSJYe/nekPPq62uo8XFq0TuNNWg2lJaU08md8outXEbfGPIIaLXcMaPhW8/aBVgQBkb2+W5TNOjoezL/7radUVQ3RqSul84lV25BnBx2SV/ARUc/37ZyvIMu2ByMidQaQYPogFTcN0qpME7ChvDyLHP1ZB2Z0enoLcU6UUuKUjd5w3vkhsxKK1+QwgGDSQ+x87AO9Y0yHWLzK14IUC0k1WH37N/xETf6QawxOrAdntTxgl//o+ThejTmzDAFBLp/q2OPEZVveyqIzla+EOwbMMA7J4MrVN78qVAHB4PUH9DvOKHeLmFT+8f85O7zMvva4sp2ANcy4mZAaU+pMq3Td8BfjSKWux6nfyTUqA+GDajyaNmR9lvQO3zTgKgNlc5I0W4/2HnXRZbqyPYQfJbNgtxSEDbdciI+WluQfgYnHJPCN7OTOFuvJ9CFZS/Fy4qAMdWphiO8ixHkiwzIjhaYi1uHzhEQFDfhQiIOeo5KzTLWh27NYh+5CrLmkDtAybZ1gnEXYwQmZfVuo8ENS6pt4mN6BDKAkVygf3fwTJEwqbv/A8tmA4atVwiNlY/OHwe+bGzVEBkteyK5okaIJsOsRi+ozsqNOPFsYnTh3WCqa8Tq8V0G7nx6SKpNynlExXy5+63mM2M+9Cy/qrfjWHTs4edmmlwJf8QsaSSoxPC7zdCbueodjqlEkL/S6rL4Yr+gqOFAG9A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(23010399003)(376014)(82310400026)(11063799006)(10067099003)(6133799003)(56012099006)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: SAhchOcGD3Pedy12XCnwtNiw7GG3WPvL0yXfQk8QCh4XM/DNkIr4nJgQtDUk4W5GJzJPU07Ao8sxDzRzqaUMfqsXRHpj1SaCoix1FSVc4nB9a/GGwtbIMHXdsbWYfmB02eK5q+zCXZygmnLzC4pXvXCX45vWeN7jImsiv78PwQF0kc9JFJqTJjqmqVrYVMJkDrqzhQqpC4NsKnTTfnVhQC0P3PK//uR0TVWLRSOq9YARNl0ixq7sPDTtIpgO+r22jgiPy2aPPu83M396U4VGWASl87bOmNN09x10FS6vqURFf1X4uy2zhF0VSJy1RaW3TZyseYpEYlpqPSQSKdXS7x3a7Vw/jL+Hfh8NAEc8YngJ0/fTRaB4ud2wUMmL8l4y4a+iaL33KPqK2sWzcEdmjUFS+aXNgAPPtNwiUP8i4uQvTOn9qwV4QWSyFxnK7XaY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 02:37:27.3296 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c0321fe-e47d-4787-8357-08def363a7ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0002992D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8081
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

Implement vendor-agnostic platform filtering system that allows any
vendor to plug in platform-specific test skipping logic via callbacks.

Key design elements:
- struct platform_filter_ops: vendor callback interface
- struct platform_skip_entry: vendor-neutral skip rule representation
- enum skip_source: three-tier priority (built-in, config, env)
- API functions: init, should_skip, require, dump

Platform filtering is automatic - tests only need to call
platform_filter_init() once in igt_fixture. The IGT framework
automatically checks each subtest before execution via
__igt_run_subtest().

Example usage:
  igt_fixture {
      vendor_platform_filter_init(platform_info);
  }

  igt_subtest("test") {
      // Automatic filtering - no manual call needed!
      test_code();
  }

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
v5 changes (addressing Kamil Konieczny's review):
 - Combines interface (header) and implementation in a single commit
   as requested by Kamil Konieczny
 - Reorganized and improved commit content
 - Squashed patch 3: Add platform filter initialization check to fix
   incremental compilation

v4 changes (addressing Krzysztof Karas detailed review of v3):
 - Fixed documentation comment placement - ALL moved before functions
 - Reorganized commit message for clarity
 - Added prominent note that this is generic (no vendor code)
 - Proper [PATCH v4 X/Y] format using git format-patch --subject-prefix

v3 changes (addressing Kamil Konieczny's review):
 - Squashed header and implementation into single commit
 - Removed unnecessary comment "Function prototypes..." from header
 - Comprehensive documentation in separate commit
 - Automatic filtering via __igt_run_subtest() hook
 - Fixed code style: include order, SPDX style, checkpatch clean
 - Removed unnecessary newlines before single-statement returns


 lib/igt_platform_filter.c | 574 ++++++++++++++++++++++++++++++++++++++
 lib/igt_platform_filter.h | 124 ++++++++
 lib/meson.build           |   1 +
 3 files changed, 699 insertions(+)
 create mode 100644 lib/igt_platform_filter.c
 create mode 100644 lib/igt_platform_filter.h

diff --git a/lib/igt_platform_filter.c b/lib/igt_platform_filter.c
new file mode 100644
index 000000000..0b9452c40
--- /dev/null
+++ b/lib/igt_platform_filter.c
@@ -0,0 +1,574 @@
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
+	return fnmatch(pattern, str, 0) == 0;
+}
+
+/* Helper: Check if entry matches platform/test/subtest */
+static bool entry_matches(const struct platform_filter_context *ctx,
+			  const struct platform_skip_entry *entry,
+			  const char *test_name,
+			  const char *subtest_name)
+{
+	if (entry->platform_data && ctx->ops->match_platform) {
+		if (!ctx->ops->match_platform(ctx->platform_info, entry->platform_data))
+			return false;
+	}
+
+	if (entry->test_name && strcmp(entry->test_name, "*") != 0) {
+		if (!test_name || !match_string(entry->test_name, test_name))
+			return false;
+	}
+
+	if (entry->subtest_glob && strcmp(entry->subtest_glob, "*") != 0) {
+		if (!subtest_name || !match_string(entry->subtest_glob, subtest_name))
+			return false;
+	}
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
+			      char *line,
+			       struct platform_skip_entry *entry)
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
+	if (ctx->ops->parse_platform_config && strcmp(platform, "*") != 0) {
+		/* Vendor-specific platform string */
+		if (!ctx->ops->parse_platform_config(platform, &entry->platform_data)) {
+			igt_warn("Failed to parse platform: %s\n", platform);
+			free((void *)entry->test_name);
+			free((void *)entry->subtest_glob);
+			free((void *)entry->reason);
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
+				 MAX_CONFIG_ENTRIES);
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
+				 MAX_ENV_ENTRIES);
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
+			      const void *platform_info)
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
+		 ops->name ? ops->name : "unknown");
+
+	/* Get current platform name */
+
+	if (ops->get_platform_name) {
+		const char *pname = ops->get_platform_name(platform_info);
+
+		snprintf(ctx->current_platform_name, sizeof(ctx->current_platform_name),
+			 "%s", pname ? pname : "unknown");
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
+/**
+ * igt_platform_should_skip:
+ * @test_name: Name of the test
+ * @subtest_name: Name of the subtest (or NULL for test-level check)
+ *
+ * Check if a test/subtest should be skipped based on platform filtering rules.
+ *
+ * Returns: true if the test should be skipped, false otherwise
+ */
+bool igt_platform_should_skip(const char *test_name,
+			      const char *subtest_name,
+			       enum skip_source *source,
+			       const char **reason)
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
+
+		for (i = 0; i < count; i++) {
+			entry = &builtin[i];
+			if (entry_matches(ctx, entry, test_name, subtest_name)) {
+				if (source)
+					*source = SKIP_SOURCE_BUILTIN;
+				if (reason)
+					*reason = entry->reason;
+				igt_debug("Skip (built-in): %s:%s - %s\n",
+					  entry->test_name ? entry->test_name : "*",
+					  entry->subtest_glob ? entry->subtest_glob : "*",
+					  entry->reason ? entry->reason : "no reason");
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
+				  entry->test_name, entry->subtest_glob, entry->reason);
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
+				  entry->test_name, entry->subtest_glob, entry->reason);
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
+void igt_platform_require(const char *subtest_name)
+{
+	enum skip_source source;
+	const char *test_name = igt_test_name();
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
+			 source_str, reason ? reason : "no reason");
+	}
+}
+
+/**
+ * igt_platform_filter_dump:
+ *
+ * Dump the current platform filtering configuration to stdout.
+ * Shows all loaded skip rules from built-in, config file, and environment
+ * variable sources. Useful for debugging which rules are active.
+ */
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
+
+		for (i = 0; i < count; i++) {
+			entry = &builtin[i];
+			total_count++;
+			igt_info("  %2d. %s : %s\n",
+				 total_count,
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
+				 i + 1,
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
+			igt_info("  %2d. %s : %s\n",
+				 i + 1,
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
+/**
+ * igt_platform_filter_dump_to_file:
+ * @filename: Path to output file
+ *
+ * Dump platform filtering configuration to a file.
+ *
+ * Returns: 0 on success, -1 on error
+ */
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
+
+/**
+ * igt_platform_filter_is_initialized:
+ *
+ * Check if platform filtering has been initialized.
+ *
+ * Returns: true if initialized, false otherwise
+ */
+bool igt_platform_filter_is_initialized(void)
+{
+	struct platform_filter_context *ctx = get_filter_context();
+
+	return ctx && ctx->initialized;
+}
diff --git a/lib/igt_platform_filter.h b/lib/igt_platform_filter.h
new file mode 100644
index 000000000..b83440514
--- /dev/null
+++ b/lib/igt_platform_filter.h
@@ -0,0 +1,124 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright 2026 Advanced Micro Devices, Inc.
+ */
+
+#ifndef IGT_PLATFORM_FILTER_H
+#define IGT_PLATFORM_FILTER_H
+
+#include <stdbool.h>
+
+/**
+ * SECTION: igt_platform_filter
+ * @short_description: Generic platform-based test filtering framework
+ * @title: Platform Filter
+ * @include: igt_platform_filter.h
+ *
+ * Generic test filtering system that allows skipping tests/subtests based
+ * on platform characteristics. Designed to be vendor-agnostic with
+ * vendor-specific backends.
+ *
+ * Three-tier priority system (checked in sequence, first match wins):
+ *   1. PRODUCTION: Built-in compile-time rules (vendor-specific)
+ *   2. DEVELOPMENT: Config file /etc/igt/platform_skip.conf
+ *   3. RUNTIME: Environment variable IGT_PLATFORM_SKIP_CONFIG
+ *
+ * Vendor Implementation:
+ *   Each vendor implements platform_filter_ops callbacks to provide:
+ *   - Platform identification and matching logic
+ *   - Platform-specific data structures
+ *   - Built-in skip rules
+ *
+ * Usage in tests:
+ *   igt_fixture() {
+ *       igt_platform_filter_init(vendor_ops, platform_info);
+ *   }
+ *
+ *   igt_subtest("my-test") {
+ *       // Automatic filtering - no manual call needed!
+ *       test_code();
+ *   }
+ *
+ * Config file format (/etc/igt/platform_skip.conf):
+ *   # Lines starting with # are comments
+ *   # Format: platform:test:subtest:reason
+ *   # Use * as wildcard
+ *
+ *   navi48:*:*:All tests disabled on Navi48
+ *   alderlake:i915_pm:*:Power management tests broken
+ *
+ * Environment variable format (IGT_PLATFORM_SKIP_CONFIG):
+ *   Same as config file, semicolon-separated entries:
+ *   export IGT_PLATFORM_SKIP_CONFIG="navi48:*:*:Testing;navi10:amd_basic:*:Broken"
+ */
+
+/* Maximum platform ranges per skip entry */
+#define MAX_PLATFORM_RANGES 4
+
+/**
+ * enum skip_source - Source of skip rule
+ */
+enum skip_source {
+	SKIP_SOURCE_BUILTIN,    /* From vendor built-in array */
+	SKIP_SOURCE_CONFIG,     /* From /etc/igt/platform_skip.conf */
+	SKIP_SOURCE_ENV,        /* From IGT_PLATFORM_SKIP_CONFIG */
+	SKIP_SOURCE_NONE,       /* Not skipped */
+};
+
+/**
+ * struct platform_skip_entry - Generic skip rule entry
+ *
+ * Generic structure for skip rules. Vendor-specific data is stored
+ * in platform_data field and interpreted by vendor callbacks.
+ */
+struct platform_skip_entry {
+	const char *test_name;          /* Test binary name or "*" for all */
+	const char *subtest_glob;       /* Subtest pattern (fnmatch) or "*" */
+	const char *reason;             /* Human-readable reason (required) */
+	void *platform_data;            /* Vendor-specific platform matching data */
+};
+
+/**
+ * struct platform_filter_ops - Vendor-specific operations
+ *
+ * Callback structure that vendors implement to provide platform-specific
+ * filtering logic. This allows the core filtering framework to remain
+ * vendor-agnostic.
+ */
+struct platform_filter_ops {
+	/** @name: Vendor name (e.g., "amd", "intel") */
+
+	const char *name;
+
+	/** @get_platform_name: Get current platform name */
+	const char *(*get_platform_name)(const void *platform_info);
+
+	/** @match_platform: Check if skip entry matches current platform */
+	bool (*match_platform)(const void *platform_info, const void *platform_data);
+
+	/** @parse_platform_config: Parse platform string from config file */
+	bool (*parse_platform_config)(const char *platform_str, void **platform_data_out);
+
+	/** @get_builtin_rules: Get vendor-specific built-in skip rules */
+	const struct platform_skip_entry *(*get_builtin_rules)(int *count_out);
+
+	/** @dump_platform_data: Dump platform_data for debugging (optional) */
+	void (*dump_platform_data)(const void *platform_data);
+};
+
+bool igt_platform_filter_is_initialized(void);
+
+void igt_platform_filter_init(const struct platform_filter_ops *ops,
+			       const void *platform_info);
+
+void igt_platform_require(const char *subtest_name);
+
+bool igt_platform_should_skip(const char *test_name,
+			       const char *subtest_name,
+			       enum skip_source *source,
+			       const char **reason);
+
+void igt_platform_filter_dump(void);
+
+int igt_platform_filter_dump_to_file(const char *filename);
+
+#endif /* IGT_PLATFORM_FILTER_H */
diff --git a/lib/meson.build b/lib/meson.build
index 3001b473e..1c04ee813 100644
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

