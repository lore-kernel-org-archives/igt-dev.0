Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FA1C43458
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jul 2026 23:52:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55BA710E28C;
	Mon,  6 Jul 2026 23:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MU37Ea8e";
	dkim-atps=neutral
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010061.outbound.protection.outlook.com [52.101.61.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51AE710E28C
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jul 2026 23:51:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lYJ5g79fLMjwwmtxHTzHf6wCJ5tYgoYy1sok7by17IZQi1HwfbbW7pAgfzWndg5I3Sybp3VdwcNaQktKmj3FKVIgYd3rmJ2ymQsfFuEGWcum/cL4+8A/2gxQOg8awNp7TFqE2NIaYv0XUJ1TKuyjd+z5rIyj9hjUVBnYreESqksBPo4eHE6dwuvO5jZvoRpE3o/+L751/a3qBtMR6sgEHpmBR8R7wWWO78OfTyHUMSF3ZET7aRL3ma4aJVm+bnnbJHdTQbx1RvUwHiTwD53t7H8c2PaU/5YM9Fa7Nsg0m4AUiiyqJJprzJRYKJeUlqg6q1/e7l/nn3Ko3Hi6+4l7Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iF0GUB05HWKWW+NFNSbYPDDWdnwwzXX/y3k1EEN6uks=;
 b=LziJySPrqjQbv2l4TDg9Nzka4YjqvINzMHE3QUH6y0X3WfnrrWei8wN8D3gDPYcQJY515yay1Gkc/zZuLo1JC5RoshYpGubY1+4rTFejDOL5EuZ7iVJkSbT02f0qUbl4I1Zc4aCTt7SwfN5pk+QiVNPfwgfu8A+JALkFijbwhKNLbztU3rQkQzqCpvlwDcfRbryaZZdXiw3o68LgboNrG1qeponfYRljN+pWmxfBvSDfwKX12ILkgECXbEnvU9wfYhAWUElcFKWEsjpNviQ81pSF0N3PT59zXto+a4pvV0/hg+niXHnz1Oxn9sw3g4cfVd0bMD083nTaYH9TYv3k5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iF0GUB05HWKWW+NFNSbYPDDWdnwwzXX/y3k1EEN6uks=;
 b=MU37Ea8enSbJIYOnZ/FTneBZN85wiJtovJACcYIMDjGi3qmLbSV4kiw4Ci+jF/Haau8Wckq5yojfUji3od8oPGgQHHgtf8lVxQV5sRy8FIA+DGbxxOLzRjRtnTQYLBq0dexlS+HnSb1U0Xx7apzzqxXJAu5dtZ7ZpMOsXLJpf7s=
Received: from CY5PR19CA0046.namprd19.prod.outlook.com (2603:10b6:930:1a::20)
 by PH7PR12MB6788.namprd12.prod.outlook.com (2603:10b6:510:1ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 23:51:37 +0000
Received: from CY4PEPF0000E9CD.namprd03.prod.outlook.com
 (2603:10b6:930:1a:cafe::11) by CY5PR19CA0046.outlook.office365.com
 (2603:10b6:930:1a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Mon, 6
 Jul 2026 23:51:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9CD.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 6 Jul 2026 23:51:37 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 6 Jul
 2026 18:51:36 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 6 Jul
 2026 18:51:36 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 6 Jul 2026 18:51:35 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Jesse Zhang <jesse.zhang@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 5/6] docs: Add comprehensive platform filtering documentation
Date: Mon, 6 Jul 2026 19:50:17 -0400
Message-ID: <20260706235130.157557-5-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260706235130.157557-1-vitaly.prosyak@amd.com>
References: <20260706235130.157557-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CD:EE_|PH7PR12MB6788:EE_
X-MS-Office365-Filtering-Correlation-Id: 734778e0-a393-4bd1-0421-08dedbb984e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|22082099003|18002099003|6133799003|11063799006|5023799004|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: QrXUTl8EsapzT350wHSYva4WoGAGFa4NY50gMQ0J2+rSwgqfqwlxjD3fBDR8hPXaB/1t+cukzi1uk4cm8qB9dV1LZIfHSBihnifaEoG0OkuhKkjWKnLnp6KF7UFGQENIAC6jQd/VPm9wM4LMH7FwNEdamcOx4Va+uu7ZNeKcEhYK/Zqy66eMqoUJVV0R1rGkeH/RN74J4PvyGv/lkqMz4pbIBCgdgVCotnm8N9zdNyQ3CfTaFunMMeyiv/RRzne95Lg0IbOWeyXns+T1RBBANK5DZoDU7NFh6vyMqp/dAp/3NcjHkgFKXVJdbVokhDAcc0BhnbTCB24IGRqUrlIpryKR+mlBi2YHmoKJVx2F9Szl9X3pK5EUKRODr2fnfm848RavKjdsYnnKwgOhpHxLfAKmhsdZ49sFP/FrwnrvIWcfk2J1L7caHy6wDtCPsO+knAwXy2dDQGnnkc82wJCHdGN4WCjUVjFlspHEDPiaxTWXJN3+pMmgSkeXzj8J37jZjCnXhgGd5i1yGYf8KtLLe8uIVC/QKJMMtbiqwMJFSWJCjvynyku40Uv/x203ML0WbouamiUgGoCc40vm2idiqpSt5gFjNVVpFkcTlkd4VbBIllSyNBqxgptmls24cqhNKDm4dcWlL8HWKB6s2Dmoj/bVRSpbDgb/34PBHhwi8uLQ+UgQ2smNlbA9ofhbQVwsLqMPMpW5wcnlle+nQW13MQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(22082099003)(18002099003)(6133799003)(11063799006)(5023799004)(56012099006)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: DjoPkujce4T5gJ10Nba4JeK0mYCABvQPxaeI0GSns8Lo6XpD7MRMjuKgR9AV14cCUJuKgLkFK4FwapPFTkccV87+lSHpf8qpe/nkToXfgmOjpEHEw5WZWtRJkbv+zwKThafkypshIGn3c0Y/e0r1tfMJqpMJImxc56FIQcpM8XKLRSM/QdW66fOX4bJhn3hpqwgOuFlRSLDrokUEXCg8sFrsTnH5hZ48fetJtX2Ky6AQYM7+zdUw8rkJmW4E8ViSax+VwUfTP+cLyrYim24WR7cxAcNoIqieHPbEUtXIN0JF2LGc/bzakHoe3hyU6ofdTOU6cUOIOeG24+gJF5fdy35tyzVVQLCb/7+Az4YfAvvE4SBt2FDuScZCd0EYkvX++wu3huXA4M/vPEbMa/du4sIrMeZrDcCf2oxZB5fJDO/NWiKLaFYwyohBapzQI798
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 23:51:37.7540 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 734778e0-a393-4bd1-0421-08dedbb984e7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6788
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

Provide complete documentation for the platform filtering framework
including:

- Overview and design rationale
- Configuration file format (RECOMMENDED method)
- Environment variable usage
- Wildcard patterns and syntax
- Real-world examples for AMD platforms
- How to add support for new vendors

The config file approach is recommended over environment variables for
managing large numbers of skip rules, as requested by Kamil Konieczny.

Example config file:
  # ~/.config/igt/platform_filter.conf
  [navi48]
  skip = amd_basic:*-UMQ:unstable hardware
  skip = amd_color:hdr-*:known ASIC limitation

v3 changes:
 - This is now patch 5/6 (was 6/7 in v2) due to squashing of patches 1+2
   per Kamil Konieczny's review feedback
 - No code changes from v2

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Change-Id: I3b4c5d6e7f8g9h0i1j2k3l4m5n6o7p8q9r0s1t2u
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

