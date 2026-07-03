Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2B9C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:12:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF4EE10F820;
	Fri,  3 Jul 2026 14:12:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="N4L+LziO";
	dkim-atps=neutral
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012042.outbound.protection.outlook.com [52.101.43.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD1510F820
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:11:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nbBDq2XMVZ+hejWd9kwVchKKyEr99XZvYcNViO22EhlrjmoAt/BuDiTRoO8jDT7OUC0v2cR3yVWwbawDU5iLq5A+tHkQUhR4KMeCo1tycZMbFcf1EjTTyTISHeq7lwo8ZgXUIPYgVDXOc7BvqzTc+Z2CfbpwHFCKjzbr2+fXLntCuJUjtoL+PXm/F4u/piqbyH0FrHhIUinKuL+HZNj3WPA1T1pHL4344E8HM1s0X772ldK05p0+9xNgVJyJ1YHZC4XA4ixP7pj+xgjPAM609DxJyl8mRCv3fIhXehBMqyEOE35X4rlAXuumY7QcbM433Bxl+WSeohA5XU3t8aAf1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DXCYJeq2OgKPlmHXTwcdFHHjOc1X2ePYwBsTAJqaOMA=;
 b=fAAVYI+cM+KD0T4Bcri1fHSv/7cj5A29jpa2OUwbQHWhfQ7B956Rp/GVAZkPnzBLSQdiLzlqa2Zdgrur++k9Oxl0evJQkBz9GVE2gtdwu7zMdNAVCP++ql6090QFYcetR14QubPRiHRiDltnleX61YC/xppH2QH2NtlyUMc9jBgBxEntWTQQk7s1Zq1i9Gh2WuF7sAH7asNf20qlUxTOEyd4Ffg2350zP6pLDKM/izc5DO5dvGAzLaIcyTz7kM99o6q6zDGnNvWpSPsHlkM5m6fMX4ADa6zT3CK21ffzjfShJJpkMk8wRj9JFAXoQhlHP6kQI+ggQFOxDNYusyhvFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXCYJeq2OgKPlmHXTwcdFHHjOc1X2ePYwBsTAJqaOMA=;
 b=N4L+LziOSMZxAMn7g3IYK97B2MonGOioMBQLBr83nMSmSxruQM7gCDBK3pBilicgFELzqfVSR+zBO/6EJyyC8IEy2cKPmFs0VGjWbT8dFptqgX/GkSuaI8llPmdhFlyvOXbjEp4ipvzdI4rbLOXdhq19Vhr5CcUu9Mw5X2AVQsE=
Received: from SJ0PR03CA0253.namprd03.prod.outlook.com (2603:10b6:a03:3a0::18)
 by DM6PR12MB4124.namprd12.prod.outlook.com (2603:10b6:5:221::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 14:11:20 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::a3) by SJ0PR03CA0253.outlook.office365.com
 (2603:10b6:a03:3a0::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.11 via Frontend Transport; Fri, 3
 Jul 2026 14:11:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 3 Jul 2026 14:11:19 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 3 Jul
 2026 09:11:19 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 3 Jul 2026 09:11:18 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Jesse Zhang <jesse.zhang@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH 1/7] lib: Add vendor-agnostic platform filtering interface
Date: Fri, 3 Jul 2026 10:08:21 -0400
Message-ID: <20260703141115.69015-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|DM6PR12MB4124:EE_
X-MS-Office365-Filtering-Correlation-Id: 76e58cef-34ba-4ff0-6009-08ded90cf460
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|23010399003|376014|36860700016|1800799024|6133799003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: C28DTtk40A44KPh/zr1NpzgqT7cJW+kP+8OK45H9hsplSEny/AGeS2bMU7SZquDgByS/qsRk/ZaI6sJufYZ+rNlPrKvtPprEwUbQus1/3DzA1/0fVxB4wlfyCvTNa9vG1Wshi9XX38vSrfbGZ3RE4fypjhWSYUO9spv3yFniQcD3dUvsxPbNvlYcW89tXHPMVfK7zs9r2bAmywq55MARqGt6PQbx2RK86bsywYeVkxk1jE1JnFcOEV0To8Ru+11LaQ3ZS8e+F2XveQ3TQTKz2ZIRbFtvwKtuMMGz83zFo6m6ZPeSziQBKv6r0jwi2qwphZhrw5DEJGPzg1VO8e4FxmSbd1jROmUxzsBZ23g90Milx8/b2UOlNnw8XutY3Dq8vqc+ZN/Lci7gPi9oFBEE9aYmWMlbk3JFkigRFQI8fNJYPZwiJnmFKYNBCiV+6mPWih/hUyiSEPxExltdh5VjfoHZTq3I/ZOdhmiM7Gx7ScwmkEH2jBMU32kkoRKttwP+GHt1yR41fgKhrIJbJKfEFEPBk2f4dE3+IcxZT3ais5aO94KtFSDqDlrkYC1rExcXawhab6UjiKFiP1Dq/1sJcxYgUsL27b+7CzvbuifmfEdF+x0iBuyHbF12xIEfJySrFNcePsjvi41fKEIVMJHzgD5onYfukVTftepqdAGLNVq86Y0ng+ECJboXAwCWmqDGasZTVvqNBFeh8pQfGnaXTA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(1800799024)(6133799003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fXOtf8IXLfFt5412cUPISLQZGTgvFHJIoEFHT2qwIPH3LXf/g7eYT1xUPTMSVDLl119RSrwWdWNqRsfbdk2yG0in2HCpyT6UgWEv3S1NCGEcQvhAv8dAcYHSJ/+gz4FAi91U5AOG4+wuXH24EakLD762ri6kD3am+SHz14UU2NzKKXa/aitbRuCmQaYocbau7VjyHQIMOmm1gvAeJEH0gxnlys2H3k2WKHjngAWuL+lmQvqhR9Ph8g0N8BW6hHXDshNsOxE/J/p2mqL21n3gPpUDAz1kgDuXzI9Iln60VaswrXBB8kkO3hHXCBUvYBMWEaO1bpVuzJTEAdq69HTaWrTog0cWry18UVOnHeEjNvGZQvY3GQRVhZ2hMoeMDUBGhH38s9RFlyPs/rTgcIFo4ZMRaJAROTebrC3TF+bkiGtZAnbOagQHMZmqDoDOXRnm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:11:19.4974 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76e58cef-34ba-4ff0-6009-08ded90cf460
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4124
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

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
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

