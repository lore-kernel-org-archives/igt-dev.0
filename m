Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85038CD98CC
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jun 2026 19:23:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C6210EBBB;
	Wed, 10 Jun 2026 19:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3oI42LL+";
	dkim-atps=neutral
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013017.outbound.protection.outlook.com
 [40.93.201.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AEF010EBBB
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2026 19:22:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=adtorw2LgXgIv1zkO/E5Wnq+bXz3Shp8T/whvowe7PutYrI/1vt9OuqNZoZjI5ysU3Q9damSAAoEuqN1jLjVL1yNk/BikXiWcH54YZ+fhIjPxu/MQRRA1OI4aFB4fqQLh4mXgg0RNCvIUkECbSkrhQuOPEXOphlN8v/nhD2YDHJsVn+1F+mdGjlrSXMMWaNlLMs4sTu/XnsAi235iAyk/2R1RLutSvT0aBTr1pS9GdyIcxPRRh10H7DN68Ys3HHwrc77apG1a60qBDw/F0e5owaUYn78xq6pLBHO4DyK4A1X3LdnL3WOtUoYWNy05k1j+EO+VpXK7izM75laWUTggg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u8yi3CNQzZh8sRDcNrsRi9dhbl9Yen1UvtVvwwE0VGg=;
 b=X8Ope/yvUCCJIePLFqmCdWAYNBNTgDh4oEuFsDfbJ9akx9kFXLjO4mckRmPN9kxBMU0ywJCpRcx5dgyDlaekjdmSOiwF572/SVqbCTWkobDdeJwUjir4VpUFYm89DcHDUnziFNoHyDjV9AXIpp8qKHa3PRSjKfnE+WfkvX4VicQWr8okTz9KerMOd79Mvx4BfGfy2swQNpzBwKV6yQapwQWqHbQBfccEuRnhlvBSYDgQ3HxgoYyAdKyCG7uS+L1vjjduw9ZOYGUd4NQgGwCn6iGk4iJFmCLHK7hj/JtIdRdCRd1XTk0CJy8guBEfrUnkDWoavjsIx2RMRTrHIMvqtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u8yi3CNQzZh8sRDcNrsRi9dhbl9Yen1UvtVvwwE0VGg=;
 b=3oI42LL++XAXShPAZqMZ7PpwA+US3rlIYDCvklyIPisf8ubNEWN9+gCMJcCwhfe0/aaPSvXrSqhJlvb5aJx1MTy4Jm1qWpKdGzAkDIT/05pNj6rIEVrRV6TKvZ9cvDC6kjzr9almi6l+tOECrEgyMerioMUCFcmF7vaz+DS4RGM=
Received: from SA1P222CA0079.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:35e::16)
 by DS5PPF1ADAD2878.namprd12.prod.outlook.com (2603:10b6:f:fc00::646)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Wed, 10 Jun
 2026 19:22:16 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:806:35e:cafe::a6) by SA1P222CA0079.outlook.office365.com
 (2603:10b6:806:35e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.13 via Frontend Transport; Wed,
 10 Jun 2026 19:22:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 19:22:15 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 10 Jun
 2026 14:22:11 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 10 Jun
 2026 12:22:10 -0700
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 10 Jun 2026 14:22:10 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Jesse Zhang <jesse.zhang@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 1/4] lib: Add vendor-agnostic platform filtering interface
Date: Wed, 10 Jun 2026 15:21:24 -0400
Message-ID: <20260610192208.88992-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|DS5PPF1ADAD2878:EE_
X-MS-Office365-Filtering-Correlation-Id: bf79bd12-4897-4c1d-9046-08dec72594d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|82310400026|23010399003|1800799024|3023799007|56012099006|11063799006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: wzEa71w7KIM76ST6FMBw/FNLw2d8ce7OQ45tGjJbHknfZiVAEnbkYWWRXx73lR1UqED/rHgzFcwAMfdyU1ZzPBCqf6q2mUwdm20eVyk9TlHKJHXV9GNRb5TtYubCHKWIO8phSjtElGAZN4R6IOmOkra7uxDyS6szJ3MgjPZX4C3z2Fld5rav4iq6w7PdfSpmzi4tNta2s2vRyE4ia7/Gnk1dIJ2gSn+2NsT5Ypvh9hnQNO/zvRimQMfF3hbLa6Bma+BvxpCD/QT3wHwh5FDRoN7QQyYra0aMK/l/WA5ljHa81f6RiQP6qwWT9ohynbAAQg4PEiHCFEeM53JXi18gqoKCQJm2JfGFm3zecHX50ddyEfQoevfU8AqUCk8S7HsJNXAdh5NPuDm7mfuj62yM6QBaCaD2+j2dHoWc+uXo7R0Xc+j6r03dIaFFYiFTMH0cVqSUygnr4CPQy548PAFkVNpfUAZwoTvz6t6nQdKF5cR8wr9IV/e3qdYJt3kdf1QGJi9YyrxzFn79CF0ZQJQpGkJyr8YknXoW7hM4WEtJU/J2tyt41D6WySeT/OvPaWNHzBoZbe+AD2g8yG9AHF7R3TW4YzC5rr72klDkw513CuXgX0mT0G3jRkeRfgimc+HSIyxH8so4t/p2Rpr+tFeEv08sIy0Wmf+98zVutfv3QTLzW7S6dpHsliAF46doGft0J6OgzuILrx8pkH3NnytEGqGJ1WLli3hSxVcZ/ErnM70=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(3023799007)(56012099006)(11063799006)(6133799003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: pFGPrDNMuYymIk/tmfc5SMnGWcI83PeqPvO8ydKExHycX2wz2z9qCEpNjyz05G9/GdU2bya/3gZcvyl2o3rA5dCRJW+vSMBGc0RJh4OZyAcRhCKIrkdvXKHELs06zNlBNHxArsLMtTwwLc8c23n+/zPfU0f3XsZZLwJ6rH+gmvQWFFcww34bQIR4d2GtSPTKJVrgWELx23V/uHMRDIm8t4Qs73j8w0ljxBBP3xL+X6L/T8JRsULN2QHRpD3g6mWbLAb/fT807DxADIEtyjUaZRe0GsLF182Thbjzk+77nal5YQcnLW/TG1PtHbVf3EHsoPBg/kWlM1yDcd6AIOBTYWZfqXZuVMjlmGLUmhqS9aapqY7bB6t75Irn2MNBEBt89kDw1p/rS46jMqpmsdFb8bsgvCtoDYJowy0+nHLmzMBi6iGkmUZ59Zn/IoLO3XKC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 19:22:15.7011 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf79bd12-4897-4c1d-9046-08dec72594d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF1ADAD2878
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

Define the generic platform filtering API that allows any vendor to
plug in platform-specific test skipping logic via callbacks.

Key design elements:

- struct platform_filter_ops: vendor callback interface with operations
  for platform identification, matching, config parsing, and built-in
  rules retrieval
- struct platform_skip_entry: vendor-neutral skip rule representation
- enum skip_source: three-tier priority system (built-in, config, env)
- API functions: init, should_skip, require, dump

This addresses feedback from Jani Nikula: "I would have expected an
attempt to make an IGT shared filtering system generic enough to plug
into any vendor's platforms."

The interface is designed so that any vendor (Intel, AMD, Qualcomm,
ARM, VMware, etc.) can implement their own backend by providing
platform_filter_ops callbacks, without modifying the core framework.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reviewed-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/igt_platform_filter.h | 196 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 196 insertions(+)
 create mode 100644 lib/igt_platform_filter.h

diff --git a/lib/igt_platform_filter.h b/lib/igt_platform_filter.h
new file mode 100644
index 000000000..c05c39b7d
--- /dev/null
+++ b/lib/igt_platform_filter.h
@@ -0,0 +1,196 @@
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
+ *       igt_platform_require(igt_test_name(), "my-test");
+ *       // test code
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
+	/**
+	 * @name: Vendor name (e.g., "amd", "intel", "nvidia")
+	 */
+	const char *name;
+
+	/**
+	 * @get_platform_name: Get current platform name
+	 * @platform_info: Vendor-specific platform information structure
+	 *
+	 * Returns: Platform name string (e.g., "navi48", "alderlake")
+	 */
+	const char *(*get_platform_name)(const void *platform_info);
+
+	/**
+	 * @match_platform: Check if skip entry matches current platform
+	 * @platform_info: Vendor-specific platform information
+	 * @platform_data: Vendor-specific platform matching data from skip entry
+	 *
+	 * Returns: true if platform matches, false otherwise
+	 */
+	bool (*match_platform)(const void *platform_info, const void *platform_data);
+
+	/**
+	 * @parse_platform_config: Parse platform string from config file
+	 * @platform_str: Platform string from config (e.g., "navi48", "*)
+	 * @platform_data_out: Output pointer for parsed platform data
+	 *
+	 * Returns: true if parse successful, false otherwise
+	 */
+	bool (*parse_platform_config)(const char *platform_str, void **platform_data_out);
+
+	/**
+	 * @get_builtin_rules: Get vendor-specific built-in skip rules
+	 * @count_out: Output pointer for number of rules
+	 *
+	 * Returns: Array of built-in skip entries
+	 */
+	const struct platform_skip_entry *(*get_builtin_rules)(int *count_out);
+
+	/**
+	 * @dump_platform_data: Dump platform_data for debugging
+	 * @platform_data: Vendor-specific platform data
+	 *
+	 * Optional callback to print platform_data in vendor-specific format
+	 */
+	void (*dump_platform_data)(const void *platform_data);
+};
+
+/**
+ * igt_platform_filter_init - Initialize the filtering system
+ * @ops: Vendor-specific operations callbacks
+ * @platform_info: Vendor-specific platform information structure
+ *
+ * Loads skip rules from:
+ *   1. Vendor built-in array (via ops->get_builtin_rules)
+ *   2. /etc/igt/platform_skip.conf (if exists)
+ *   3. IGT_PLATFORM_SKIP_CONFIG env variable (if set)
+ *
+ * Call once in igt_fixture.
+ */
+void igt_platform_filter_init(const struct platform_filter_ops *ops,
+                               const void *platform_info);
+
+/**
+ * igt_platform_require - Check if current test should run on this platform
+ * @test_name: Test binary name (use igt_test_name())
+ * @subtest_name: Subtest name
+ *
+ * Checks all three skip sources in priority order.
+ * Calls igt_skip() if test should be skipped.
+ */
+void igt_platform_require(const char *test_name, const char *subtest_name);
+
+/**
+ * igt_platform_should_skip - Query if test should be skipped (without skipping)
+ * @test_name: Test binary name
+ * @subtest_name: Subtest name
+ * @source: Output parameter for skip source (can be NULL)
+ * @reason: Output parameter for skip reason (can be NULL)
+ *
+ * Returns: true if test should be skipped, false otherwise
+ */
+bool igt_platform_should_skip(const char *test_name,
+                               const char *subtest_name,
+                               enum skip_source *source,
+                               const char **reason);
+
+/**
+ * igt_platform_filter_dump - Dump all skip rules from all sources
+ *
+ * Prints formatted output showing:
+ *   - Built-in array rules (vendor-specific)
+ *   - Config file rules
+ *   - Environment variable rules
+ *   - Current platform information
+ *
+ * Useful for debugging and verification.
+ */
+void igt_platform_filter_dump(void);
+
+/**
+ * igt_platform_filter_dump_to_file - Dump skip rules to file
+ * @filename: Output file path
+ *
+ * Returns: 0 on success, -1 on error
+ */
+int igt_platform_filter_dump_to_file(const char *filename);
+
+#endif /* IGT_PLATFORM_FILTER_H */
-- 
2.54.0

