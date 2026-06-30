Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D656C43458
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jun 2026 03:25:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122F810E15B;
	Tue, 30 Jun 2026 03:25:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MovJ+aqi";
	dkim-atps=neutral
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012067.outbound.protection.outlook.com [52.101.43.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE80110E15B
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jun 2026 03:24:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=he5McEbcpptD5cd6qYhwWfZnnH5Xb0wPYJ60G+RTraY9zX/QuKLnQmjTLHjfbLG/nhRSKMRUvIOMAs7fuRPSgS6YoAZnghPtj/DVemohf8oJXPr99fkXbRphFsPCnlHk5AuJuVzr/6h8jmGgZa3pmIlyv0F/Bmw9ca/1pbrg0nwVMnAHUZsoQa3Q7Jv8k5fj6FCsncJEKrZ/JpFSoVNGUSXMe1TPB63MPma1DqR1Jkbj+Tc2aUMPdX7gXY0/I4xdK/ETUa8zOQqo3sU+2cJAjBvBFmN43KbhzbYCilXiU0hKaPMElVYybz7fBaJ3g5enlRkhj1+4TRP5G7FjvAUCSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/6GRsshjguMWzrrZ6HT1odum4UnUMHIwP7e9hL0nYI=;
 b=O3Me47Bl3fCfHXCqGFGhYFFBD8hr68fO5cGKF0F7aUm7jPkvfEj+rI3hAncl47gqQJpOvQnut/dRUSRonD0oT/60g6Fw8mKGJ1cG4rkXeOa+J/2QqU+fK9U2XhqpffjDGEOq48yXVEVMtqXohvc0xd1C7rN+2V2zbw6R2Pp06AcUAA7OBs2klnR6xelU98HA8cCHoNpJhVb4AFwlwsYlr+fACGAkxly6hBEK67x2sNtqtKgpb2Oj7TXf+Ok3F+oG25hBYHy2FnlZKNKbdIFPYeMVnZlhvUrgg1dMzupecQfXYTZ/pqzUdiyqNSeJcdXAPTt1yc/RoRfw36NzdRqfEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/6GRsshjguMWzrrZ6HT1odum4UnUMHIwP7e9hL0nYI=;
 b=MovJ+aqiF93V3muAk34v4MRU6vm+xNIxscfSFIB8i6KRUUE1Iz5TdltNN9wtVBVMWjDVzj4o6oDtmeOTg4r/liQcASV9QChDjmNKcVuO2+tyN6FWu+TOPqn7kUffeiS/GauIcWy4AHtrywaHaJ7K4Eob9D3zA+oTXNpOJbwLqOY=
Received: from BN0PR04CA0137.namprd04.prod.outlook.com (2603:10b6:408:ed::22)
 by BL4PR12MB9506.namprd12.prod.outlook.com (2603:10b6:208:590::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 03:24:46 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:408:ed:cafe::ae) by BN0PR04CA0137.outlook.office365.com
 (2603:10b6:408:ed::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Tue,
 30 Jun 2026 03:24:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 03:24:45 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 22:24:45 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 22:24:45 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 29 Jun 2026 22:24:45 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH 1/7] lib: Add vendor-agnostic platform filtering interface
Date: Mon, 29 Jun 2026 23:23:20 -0400
Message-ID: <20260630032442.200729-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|BL4PR12MB9506:EE_
X-MS-Office365-Filtering-Correlation-Id: 04cac5e3-e4d9-4c99-6f0a-08ded657223c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|56012099006|18002099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: zxzjuLVUYkcM7zXuxMgQVGKr35s42JTZuZWIdkaFrTFRPq/BJggCl+3jdMbZRokLzTrovM5G0cMCdnkaBsYVjPKhLiM8THOJpy30Ag4BglfoDgreyuRXdpAor60EsZpB7/9J+u2YjJtWejBgdf3CijLk+CbsFhldlNPySUcTb25js8aR6gPeAar1pSrE9G7jEcyRYRsCRpu6mcoEojbEZ5CXNBpNZ7WuJ70cAdBTivkQL4VFdRyQU/rVDtQhmjS0VOtNeQkwey/nABgyNEiZeDeeuFeGo5tCuE7RQqCq0dKHzFNF2lmoYrtrPB4n/JokOxz+2QE1g1eJNfmOyXIRShvpkMLjeh72ik5y7s6IVmQBSHeVYlcX4jrPRMrvBu7MxYuMF9aXblJ3Hq4t2BIvDM3CZvi2XZ5qUXPCB7sVRw7Gh7C26P+vxDNZwjrD1Vv2xcGaLZECJ4b/zuzFQFpSu2sLDwydk/orIm22Dz0tRYZV40sZRerW1zaDj51Y6rXomgu3U9G100OcTarLZi6ZlCoYfUY+VscpK9xzY4Oh7VekKPSk+4ALJ6QLfZ7PSORiF0zWNFSMeRw5H3r7vt7oYAb5muzAgnLlqmo9qs/oBi04NwAqdm3U2ZosGUxfnJHC4ua2ytmHdvML649t/6Y/1S7ZNgjuBCFxp1DKY1zUsoHvpEviTbactXQjLtJLfAk+4x2azSCv+bzNc9c4r0aX8w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(56012099006)(18002099003)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: cVfTVDwEz+98GgOHDoY+rqzXZLTw1OmI+8KF1uvl7475vJ/eIvnSfxAOx+P5CHetJnAOtZHg6EmT7hEWvUaZrc4UVgHGHgyGaYbH89VVDT/H1GVxeDnwwn8dyn37ZwHRLerxkEE9jD5/g1q54StcM9Zxw+NL/HYL2p8zOQBGUgJquSFYWgirSBby39U29HZG7XbpO2PPzrdacl/6Ck6mUsKntdcFvxGUfxLZk2W559voSxfF3KVOZq6j5+TbKAEDZXNwid8z3rqSDBCttP3NRxdC3wAnEmzhq2RpSRB+0zeh5nLerC0oMU9UMsmbbtEquZLcCE7hkSoiFDUmyxTNB8/enkcS6A5blufn31CoaoRr5w4T7tcsbLSPQpP9vUvkv6mzyUSufeKJ7O/DK69VWQihSk7wNTIIBZ0N78UtAP3T8Sjyww73+XdJZ3+QPVDc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 03:24:45.7640 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04cac5e3-e4d9-4c99-6f0a-08ded657223c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9506
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
- struct platform_filter_ops: vendor callback interface
- struct platform_skip_entry: vendor-neutral skip rule representation
- enum skip_source: three-tier priority (built-in, config, env)
- API functions: init, should_skip, require, dump

Platform filtering is automatic - tests only need to call
platform_filter_init() once in igt_fixture. The IGT framework
automatically checks each subtest before execution via __igt_run_subtest().

Example usage:
  igt_fixture {
      vendor_platform_filter_init(platform_info);
  }

  igt_subtest("test") {
      // Automatic filtering - no manual call needed!
      test_code();
  }

Addresses feedback from reviewers:

1. Jani Nikula:
   "I would have expected an attempt to make an IGT shared filtering
   system generic enough to plug into any vendor's platforms."

   Resolution: Implemented vendor-agnostic callback-based design via
   platform_filter_ops structure. Any vendor (Intel, AMD, Qualcomm, etc.)
   can provide their own backend without modifying core framework.

2. Kamil Konieczny:
   a) "Add also example with config file as env vars are not convenient
      for large tests lists"

      Resolution: Comprehensive documentation added in commit 6
      (docs/platform_filtering.md) showing config file as RECOMMENDED
      method with real-world examples, wildcards, and best practices.

   b) "imho you can get test name in require, no need to repeat it"

      Resolution: Went further - v3 removes igt_platform_require()
      entirely. Filtering is now automatic via __igt_run_subtest() hook
      in commit 5. Zero manual calls needed in subtests.

   c) Code style (include order, alignment, igt_debug vs igt_info)

      Resolution: Fixed in commits 2 and 4. Includes alphabetically
      ordered, SPDX headers use // style, checkpatch clean.

3. Multi-GPU support (integrated + discrete):
   Current design queries platform once in igt_fixture. For multi-GPU
   scenarios, tests can call platform_filter_init() per-device with
   device-specific platform_info.

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Change-Id: I370aa9f91b9d23e0fb79f3f04d8edb5cd4c57460
---
 lib/igt_platform_filter.h | 123 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 123 insertions(+)
 create mode 100644 lib/igt_platform_filter.h

diff --git a/lib/igt_platform_filter.h b/lib/igt_platform_filter.h
new file mode 100644
index 000000000..e532c6de7
--- /dev/null
+++ b/lib/igt_platform_filter.h
@@ -0,0 +1,123 @@
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
+/* Function prototypes - see igt_platform_filter.c for documentation */
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
-- 
2.54.0

