Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC13C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:13:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA9110F824;
	Fri,  3 Jul 2026 14:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="W7spAuEt";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012056.outbound.protection.outlook.com [52.101.48.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A7910F820
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:12:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N2DhBkQ/OWK/jv6p/iw39siF6WVsS5GshFVB3/6jC4ZgpZpHh+TB6voYouXg8mm/dUWCHOQjR2BQ3gAn8BR4ep/pu/K71zmPxKnXhSBAoYrMn+9ZrK5lIAkbRJON1JYk8dLn7vHvE1z7/WfAQ41Y9pYYZdaSyEw/HYX/o/sUY202zPClMzt3M+wRKZbfH7oW9ee1ItYsz+SD/j/X/NT8v2rUj/TevWkY5wFlgmXSprnyYkqQHYSToUj70m9ZFGRHbP3/wzqktTinMFhJhOjFoNBZiax4p++MkLWmDIhyWCeoScVXu0fB/moqBdGFdc15rkDPc7iM6+nuPt1fc97vNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6F2oHX2Pep49geZnbi9rID41jEXZL4S5VQ42BXnAgRQ=;
 b=jVuLaz2jfTCjab3Ma19WyVwsRcG7GVpyg8+msLXyF4fl6VDVoMqvUYubLnsB94JEEJ9O8rEsWj7F3FqNLMMQs2b29LaG0Vgj1CGkB0i1nbvu3wKLdqhBImQW5hb6E4Wz4AmMBW3F7Yg+l/M5WX2ErdMzTFGrMT8ffIyu2QEz9yVMShLZUiA2nTQHjz3XkTJqiPzWD+5MWfHr5fhCNVIOf20yVHi2czA5boUSNlRiuVNoIr7L871N4r56eoL467DLV3zBvfJiWAQ2GXNZmzF80PDl87TIp4xmUzqz6UYJW3saogQtAdqcSLkXjCEV0dx4owmWHg9Fm+cx3bVu88loxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6F2oHX2Pep49geZnbi9rID41jEXZL4S5VQ42BXnAgRQ=;
 b=W7spAuEttTxPrMyDoZsjE7Mdas9CKZesvFvO3Rhnsm1lLaUcGAx/cS71sqrEaSygyrKt8fuOlZD6wIBpCBH/uH453sY4AD1d/q0ZYq1aoNbjgXYn9WeUXjwYOwr3OY8WQCH6woqQ2/3Zn+FEYi368j6uwSeGAi2Kx9j7fCf/GGM=
Received: from BY3PR05CA0017.namprd05.prod.outlook.com (2603:10b6:a03:254::22)
 by PH8PR12MB7025.namprd12.prod.outlook.com (2603:10b6:510:1bc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 14:12:30 +0000
Received: from SJ5PEPF00000206.namprd05.prod.outlook.com
 (2603:10b6:a03:254:cafe::55) by BY3PR05CA0017.outlook.office365.com
 (2603:10b6:a03:254::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Fri, 3
 Jul 2026 14:12:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF00000206.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 3 Jul 2026 14:12:30 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 3 Jul
 2026 09:12:02 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 3 Jul
 2026 09:11:23 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 3 Jul 2026 09:11:22 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Jesse Zhang <jesse.zhang@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH 6/7] docs: Add comprehensive platform filtering documentation
Date: Fri, 3 Jul 2026 10:08:26 -0400
Message-ID: <20260703141115.69015-6-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703141115.69015-1-vitaly.prosyak@amd.com>
References: <20260703141115.69015-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000206:EE_|PH8PR12MB7025:EE_
X-MS-Office365-Filtering-Correlation-Id: ea107f51-84b8-41e4-cf8b-08ded90d1ea8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|1800799024|23010399003|82310400026|11063799006|5023799004|56012099006|6133799003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: L2EKyKCs/I2E3yiQl7HwceBCZ1uyiuRAxRJLlDm3cNQORskkzVuQjHP+spqLNbiNcRYSjPU+4qZXzV2BTw2zUMRNILxLn45nQjtlEPtMGtMDAh2AYNdesSl+D8OatA1wDe/uZlsqTsagTJpOTFfJvF1nNgD3UctSxTz5kkutIeX4QFokw9BNrq4QYy0pcZ9ANr4UHLQ/QvY5TZ2QGpnmL2aA2KIES2uXm+f01lBFqa9Vj4ypbyzOwD01d9y+Nu6fx4uWDpi9IkXn+tS/pA7vTcW9pgsmzJcGIgML/u/3HBJv7cSXxgcK7yaOHTpzOTd2ENgdrZ2wMjbkU2Iq3mzADVyrUJjr0nmjxOTOE4Ue0lgxAEL7xpwCt/lhHpj6laWAhkuTHPAoKeNzqNVjO0DPYVgF6+xZonqcwRg/nLopkmrxyuC/1lOPGip3BWDEneVd0zn+TepT4viincySVxrME6ORtYIvMwFtjJ9d6KQa0Atd+EyWE6z6TR2ua3xXTuet8k4n79yEiC8d8LLp3TwwEolnJWySSjPfAUic26AJR7LKDAqmMIbxQdol5crIQK8oYk1IejYxWj8aPbdy4RD72cdAHvuD5kpnp3Dt5scY0dDBKf6ynPdGdw/N6hkhyuSFW14sDu1WtvZF/dV8Sw5WKin7FBUs/e/Yc3rYykA97pPZLO0Z4Olf14cQtxP2tSrphnzYWHHaYsQMxZZuSBx12Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(11063799006)(5023799004)(56012099006)(6133799003)(3023799007)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: gLO01rQeU7duFgLih6F/7t61Xy+Itgs3Z0BmcdMbDNxs/BCu5IrwpduA/eYNu1g8aKMQlFLTsgvUHhIUl1ujpAPGTdwWiaYpkvR16qI1b41UUNj9DaUhFw2WlKgZCi89xkH3BA801/uPz4ltcG9vYFVwrMKXm/48JEOm7Rjs4paGjtVMQ8Ebt/7Qke3tSc4dLkpaHOlJeL9gBomtBvcR/2j/GcTtMyMfqqzw0rxj9NGtKSJb3fzoyvSbdhi/UHXUJsBCXjLQSd6UzhH8ykV+fNbaxOK8SoEbJ7NfrTgDA5Nf/jSUcwmlHAWwRfq9Lz57YWc4OaUPmZK52MVy6Rh/zgTyhL0txzVSXWlYjVD0SFshTYNdY16jlssXZWLzDaDmJAqvPGPwDrDBvcZuoP80OULuPeiJ8JnbVi/oU7wWP5oAz6VIoRMcITbO0n6Vhu59
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:12:30.4729 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea107f51-84b8-41e4-cf8b-08ded90d1ea8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7025
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

Add comprehensive user-facing documentation for the platform filtering
framework, including:

- Quick start guide with code examples
- Three filtering methods (config file, environment, built-in)
- Detailed format specifications
- Real-world usage examples
- Platform name reference table
- Summary comparison table
- Integration with mkdocs navigation

The documentation is written for test developers who need to skip tests
on specific platforms without modifying test source code.

v2: Address review feedback from Krzysztof Karas:
    - Added clarification that reason field is recommended but can be empty
    - Added use cases section to environment variable method
    - Added note that platform list is partial/example
    - Removed redundant checkmark from summary table
    - Fixed mkdocs.yml title to match How to pattern

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reviewed-by: Jesse Zhang <jesse.zhang@amd.com>
Change-Id: I40c5c5b63a1d5f9c61c3b89e21a2f7a14bb0a75f
---
 docs/platform_filtering.md | 341 +++++++++++++++++++++++++++++++++++++
 mkdocs.yml                 |   1 +
 2 files changed, 342 insertions(+)
 create mode 100644 docs/platform_filtering.md

diff --git a/docs/platform_filtering.md b/docs/platform_filtering.md
new file mode 100644
index 000000000..2d2dab372
--- /dev/null
+++ b/docs/platform_filtering.md
@@ -0,0 +1,341 @@
+# IGT Platform Filtering - Usage Guide
+
+## Overview
+
+The IGT platform filtering framework allows tests to be skipped based on
+platform characteristics without modifying test source code.
+
+**Key Feature**: **Automatic Filtering** - No manual calls needed in subtests!
+
+Tests only need to initialize platform filtering once in `igt_fixture`,
+and the IGT framework automatically checks each subtest before execution.
+
+## Quick Start
+
+### 1. Initialize in Test (One Time)
+
+```c
+#include "lib/amdgpu/amd_platform.h"
+
+int igt_main(void)
+{
+    struct amdgpu_gpu_info gpu_info;
+
+    igt_fixture {
+        fd = drm_open_driver(DRIVER_AMDGPU);
+        amdgpu_query_gpu_info(device, &gpu_info);
+
+        /* Initialize platform filtering - enables automatic filtering */
+        amd_platform_filter_init(&gpu_info);
+    }
+
+    igt_subtest("my-test") {
+        /* No manual filtering call needed - automatic! */
+        test_code();
+    }
+}
+```
+
+### 2. Configure Filtering Rules
+
+Use one of three methods (checked in priority order):
+
+1. **Built-in rules** (highest priority) - Compiled into test
+2. **Config file** (recommended) - `/etc/igt/platform_skip.conf`
+3. **Environment variable** (lowest priority) - `IGT_PLATFORM_SKIP_CONFIG`
+
+---
+
+## Method 1: Config File (RECOMMENDED)
+
+**Best for**: Large test lists, team-wide configuration, CI/CD
+
+**Location**: `/etc/igt/platform_skip.conf`
+
+**Format**: `platform:test:subtest:reason`
+
+**Note**: The reason field is recommended but can be empty. If omitted, "No reason" is automatically inserted.
+
+### Example Config File
+
+```bash
+cat > /etc/igt/platform_skip.conf << 'EOF'
+# Platform filtering configuration
+# Format: platform:test:subtest:reason
+# Use * as wildcard
+
+# Skip all UMQ tests on Navi48 during platform bringup
+navi48:amd_basic:*-UMQ:SWDEV-88888 - UMQ stabilization in progress
+
+# Skip specific tests with ticket references
+navi31:amd_basic:cs-gfx-with-IP-GFX-UMQ:SWDEV-12345
+navi31:amd_basic:cs-compute-with-IP-COMPUTE-UMQ:SWDEV-12345
+navi31:amd_basic:cs-sdma-with-IP-DMA-UMQ:SWDEV-12346
+
+# Skip tests on early samples
+strix_halo:amd_basic:*:Platform not ready - ES samples
+
+# Skip known flaky test across all platforms
+*:amd_basic:eviction-test-with-IP-DMA:SWDEV-99999 - Intermittent failure
+
+# Skip entire test binary on specific platform
+navi10:amd_vcn:*:VCN encoding issues on Navi10 A0
+
+# Skip all tests on discontinued platform
+vega10:*:*:Platform no longer supported
+EOF
+```
+
+### Run Tests
+
+```bash
+# Config file is loaded automatically - no environment variable needed
+./build/tests/amdgpu/amd_basic
+
+# Output shows:
+# Subtest cs-gfx-with-IP-GFX-UMQ: SKIP
+# Platform filtering (config): SWDEV-12345
+```
+
+### Advantages
+
+✅ Persistent across sessions
+✅ Easy to manage many rules (add/remove/edit)
+✅ Team-wide configuration
+✅ CI/CD friendly
+✅ No rebuild required
+✅ No environment variables to remember
+
+---
+
+## Method 2: Environment Variable
+
+**Best for**: Quick testing, temporary overrides, single test skip
+
+**Variable**: `IGT_PLATFORM_SKIP_CONFIG`
+
+**Format**: Same as config file, semicolon-separated
+
+### Example - Skip Single Test
+
+```bash
+export IGT_PLATFORM_SKIP_CONFIG="navi48:amd_basic:cs-compute-with-IP-COMPUTE-UMQ:Testing"
+./build/tests/amdgpu/amd_basic
+```
+
+### Example - Skip Multiple Tests
+
+```bash
+export IGT_PLATFORM_SKIP_CONFIG="navi48:amd_basic:*-UMQ:Testing;navi31:amd_basic:cs-gfx-*:Known issue"
+./build/tests/amdgpu/amd_basic
+```
+
+### Use Cases
+
+- **Quick one-off testing**: Temporarily skip a test without modifying config files
+- **Debugging**: Isolate specific failures by skipping known issues
+- **CI pipeline overrides**: Inject test skips for specific job runs
+- **Developer testing**: Skip tests during development without persistent config
+- **Testing the filter**: Verify filtering system works correctly
+
+### Disadvantages
+
+❌ Not persistent (lost when session ends)
+❌ Inconvenient for large test lists
+❌ Easy to forget it's set
+❌ Hard to manage multiple rules
+
+**Recommendation**: Use config file for managing test exclusions at scale.
+
+---
+
+## Method 3: Built-in Rules
+
+**Best for**: Permanent production exclusions
+
+**Location**: Vendor implementation (e.g., `lib/amdgpu/amd_platform.c`)
+
+### Example
+
+```c
+static const struct platform_skip_entry amd_builtin_rules[] = {
+    {
+        .test_name = "amd_security",
+        .subtest_glob = "secure-bounce",
+        .reason = "Not supported on APUs",
+        .platform_data = &apu_platforms,
+    },
+};
+```
+
+### Advantages
+
+✅ Fast (no file I/O)
+✅ Guaranteed to be applied
+✅ Version controlled with code
+
+### Use Cases
+
+- **Quick one-off testing**: Temporarily skip a test without modifying config files
+- **Debugging**: Isolate specific failures by skipping known issues
+- **CI pipeline overrides**: Inject test skips for specific job runs
+- **Developer testing**: Skip tests during development without persistent config
+- **Testing the filter**: Verify filtering system works correctly
+
+### Disadvantages
+
+❌ Requires rebuild to change
+❌ Not flexible for temporary exclusions
+
+---
+
+## Wildcard Patterns
+
+All methods support wildcards (`*`) for flexible matching:
+
+```
+# Platform wildcards
+*:amd_basic:my-test:Reason           # All platforms
+navi*:amd_basic:my-test:Reason       # All Navi (navi10, navi31, navi48, etc.)
+
+# Test wildcards
+navi48:*:my-subtest:Reason           # All test binaries
+navi48:amd_*:my-subtest:Reason       # All AMD tests
+
+# Subtest wildcards
+navi48:amd_basic:*:Reason            # All subtests in amd_basic
+navi48:amd_basic:*-UMQ:Reason        # All UMQ subtests
+navi48:amd_basic:cs-*:Reason         # All CS tests
+```
+
+---
+
+## Priority System
+
+When multiple rules could match, first match wins (highest to lowest priority):
+
+1. **Built-in rules** (compiled into test)
+2. **Config file** (`/etc/igt/platform_skip.conf`)
+3. **Environment variable** (`IGT_PLATFORM_SKIP_CONFIG`)
+
+Example:
+```
+Built-in: navi48:amd_basic:cs-gfx-*:Production exclusion
+Config:   navi48:amd_basic:*:Config exclusion
+Env:      navi48:amd_basic:cs-compute-*:Env exclusion
+
+Results:
+- cs-gfx-with-IP-GFX → Skipped by built-in rule
+- cs-compute-with-IP-COMPUTE → Skipped by config file
+- cs-sdma-with-IP-DMA → Runs normally
+```
+
+---
+
+## Skip Message Format
+
+Automatic filtering shows the source in skip messages:
+
+```
+Subtest cs-gfx-with-IP-GFX-UMQ: SKIP
+Platform filtering (config): SWDEV-12345 - UMQ unstable on Navi48
+```
+
+Source indicators:
+- `(built-in)` - From vendor's compiled rules
+- `(config)` - From config file
+- `(env)` - From environment variable
+
+---
+
+## Platform Names
+
+**Note:** This is a partial list for examples. See vendor-specific backend files
+(e.g., `lib/amdgpu/amd_platform.c`) for the complete list.
+
+Platform names are vendor-specific. For AMD:
+
+- `vega10`, `vega20` - Vega family
+- `navi10`, `navi14`, `navi21`, `navi22`, `navi23`, `navi24` - RDNA1/2
+- `navi31`, `navi32`, `navi33` - RDNA3
+- `navi48`, `navi44` - RDNA4
+- `strix_halo`, `phoenix` - APUs
+- `arcturus` - MI100
+- `aldebaran` - MI210/MI250
+
+Use `*` to match all platforms.
+
+---
+
+## Best Practices
+
+### For Development - Quick Testing
+
+Use environment variable:
+```bash
+# Temporarily skip broken test
+export IGT_PLATFORM_SKIP_CONFIG="*:amd_basic:broken-test:WIP"
+./build/tests/amdgpu/amd_basic
+unset IGT_PLATFORM_SKIP_CONFIG
+```
+
+### For Teams - Shared Exclusions
+
+Use config file with ticket references:
+```
+# /etc/igt/platform_skip.conf
+# Updated: 2026-06-29
+
+# Navi48 bringup exclusions
+navi48:amd_basic:*-UMQ:SWDEV-88888 - UMQ stabilization
+navi48:amd_vcn:vcn-encoder-*:SWDEV-88889 - VCN bringup
+
+# Cross-platform known issues
+*:amd_basic:eviction-test-with-IP-DMA:SWDEV-77777 - Flaky
+```
+
+### For CI/CD
+
+Deploy config file with test infrastructure:
+```bash
+#!/bin/bash
+# CI pipeline setup
+echo "Deploying test exclusions..."
+scp ci-skip-rules.conf test-machine:/etc/igt/platform_skip.conf
+ssh test-machine "./run-igt-suite.sh"
+```
+
+### For Production
+
+Use built-in rules for permanent exclusions:
+```c
+// In lib/amdgpu/amd_platform.c
+static const struct platform_skip_entry amd_builtin_rules[] = {
+    {
+        .test_name = "amd_basic",
+        .subtest_glob = "*-UMQ",
+        .reason = "User queues not supported in production",
+        .platform_data = &all_platforms,
+    },
+};
+```
+
+---
+
+## Summary
+
+| Method | Use Case | Persistent | Rebuild Required |
+|--------|----------|------------|------------------|
+| **Config file** ✅ | Team/CI exclusions | Yes | No |
+| **Environment** | Quick testing | No | No |
+| **Built-in** | Production rules | Yes | Yes |
+
+**Recommendation**: Use **config file** for managing test exclusions at scale.
+
+---
+
+## See Also
+
+- `lib/igt_platform_filter.h` - API documentation
+- `lib/igt_platform_filter.c` - Framework implementation
+- `lib/amdgpu/amd_platform.c` - AMD backend reference
diff --git a/mkdocs.yml b/mkdocs.yml
index 0abb76704..f220674b3 100644
--- a/mkdocs.yml
+++ b/mkdocs.yml
@@ -29,6 +29,7 @@ nav:
     - How to document tests: 'test_documentation.md'
     - How to categorize tests: 'test_categories.md'
     - How to blocklist tests: 'blocklists.md'
+    - How to filter platforms: 'platform_filtering.md'
     - How to get code coverage: 'code_coverage.md'
     - How to port new IGT driver: 'new_driver.md'
     - How to plan a new test: 'test_plan.md'
-- 
2.54.0

