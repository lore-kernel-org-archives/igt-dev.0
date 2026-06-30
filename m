Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40938C43458
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jun 2026 03:28:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D3010E15B;
	Tue, 30 Jun 2026 03:28:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EBqO34pc";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011048.outbound.protection.outlook.com [52.101.52.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC3010E15B
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jun 2026 03:25:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iEZJBLjJSiZZayoj4cH4t9fnu2bs9nJ7oVXp4CunpspG5xWXNh3nRc+McGRO9sZ8pFs3CaJlr6uztAta9yAJjQRHZq4EqH+qzFXfzRhNwF9H5PU5023xV+bRBjle0UsHsIzughU5RKMAxZRWB2APL8UwSRt1pyax5ib8E//lC7CJPynO3CnQmLBLLLttF3vTmP0iZBBpLYQhzrr/AIWjoPZpgH4mzNcWa03ACxvw6N3CQ8qcUL8z0YzT43LXbrU7sIwXRYOmeixzwlxEqdqyWsY7RP+Hp9TNFG8uYx95LwwDt1lNP5GxatyOFgOB4I+h1OkkfbkrsWr3Bf6+fv2Teg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b2g8On7dpaLZBJnL1u0XhXAOJoZ1RjBALxKe7vUf7Rs=;
 b=yy+A1OEF1JlxSBj6ThBGLo0YLAzrF/pTMOoikUE+SyDVsdEQc8P/ZOiYfoIEkpEvnXpSvXkTQY3pDy7lqt7e1wRs5NCmvwdMHm8Kdw8E6+aemZ0eMz2fOb6fYHxiv4OQUmV+G2zl/Ee2YYzegM8S5WtbxQg8kQukd6oOo5mgtM9LImZVuizR88BCJSXG8rgKNcsD7Ed19IccZNZ5a26OKdVKh46viCI2rDa/z66WZJC+nPguEAYH90gJIzNSJ6FkiIPRlWN2TszprlYdeXS1Lu+4dtDSFie9rNTBwvOFQ4PJsl2JV6/DNvTP+Ng4Pqi1SNRK5uBI0+b+XKlhKqP1PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2g8On7dpaLZBJnL1u0XhXAOJoZ1RjBALxKe7vUf7Rs=;
 b=EBqO34pc8boLeNH/ERLOOKRnbECT7KnwfYx3ipY/wGKU6U8XiT8fRmgHvo2KqcclLjxQz10RMVJbl8cMEVpGNEDy+lCR/f2gHagduvHSfevjx18kd+lVBUqqtjk4rchN1MeKNMlq1bjPquFZlqUDVRlTOuXhWO0UypLZHAIWnd0=
Received: from BN9PR03CA0797.namprd03.prod.outlook.com (2603:10b6:408:13f::22)
 by SJ0PR12MB6989.namprd12.prod.outlook.com (2603:10b6:a03:448::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 03:24:49 +0000
Received: from BN2PEPF000044A4.namprd02.prod.outlook.com
 (2603:10b6:408:13f:cafe::73) by BN9PR03CA0797.outlook.office365.com
 (2603:10b6:408:13f::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Tue,
 30 Jun 2026 03:24:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000044A4.mail.protection.outlook.com (10.167.243.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 03:24:48 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 22:24:48 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 22:24:48 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 29 Jun 2026 22:24:48 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH 6/7] docs: Add comprehensive platform filtering documentation
Date: Mon, 29 Jun 2026 23:23:25 -0400
Message-ID: <20260630032442.200729-6-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630032442.200729-1-vitaly.prosyak@amd.com>
References: <20260630032442.200729-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A4:EE_|SJ0PR12MB6989:EE_
X-MS-Office365-Filtering-Correlation-Id: b645c302-7d7d-41f2-7cba-08ded6572418
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|3023799007|6133799003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: PyYBMINs6alNX5MkzpPkp8/118E1NNosoVPrUWRkFR/koieW0N3G1kp9XE0Xc2hlx94w6sL8e0lUYc/SQOTICt/GjqoGpZFiVYL9kVKzdYbF2fKc1y9RykKXwGo24vBknBmylaD29H8pkkt2nyGtERWDFzYWbCNor9DCQGuRd2IfpYhHaefc9N+ikWXdFzgv7PTq96XuJ1AyJVxRl89QqCzitmqp4ZHBQmDPn+O+Wy+NXnez2yXXOt/AVbAeq6Sp5my/WY5BA3kRsdFmM1CFQqGRzqHvDpkrhj2lwhBOam7uZ+93sJiibE4NczWoomRhT8YBG4+evITrZv0MswBe9KIStMZ4IWjbTSRmbP6X44tmmyheBe8x8jMRuuiWXlP2CWmKcnCtgC0kbCXzjV4XNk+Bw21gpolTZz27MWXjU7Bw7dwPnTXkiD32JvA5C7k1j0KmW1J1hzjEnB9nDT5r5YuXvplhcKoMvycj0XkJvEL6pEfDFhUEpUv11JfOnmQ/NK5o71UtsF/VZyBKr2XN4H4cltSWE+YLcDxhM1ymTpZ3zo9iT+Oc06Eduv078LzAXMqdAoGLZ64gpXcqjb/7A6fIdKDBTa6Nd5pAqHk6hMZPLxYNrVq+UKaDOEso6OuM4v01B1mauEpUEzxT3a3tANh+/iKA/2hgvsNg5We18l1CEVQ5UXu4lYz2HjNfaLk2vSdktT4Y4cCqWeLkCoW4OQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(3023799007)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: o3pL5ESHELDZB8O/FWs6UDoN7iBQPbO9yE1rqxDJOBc4kLamxzK/CW50+xJkuSfl+oVrp9Fu2uhC+ab5eNaVsxlT/qfvScOhBMg6daDPE3ugWQ30/wmfW4QYl1NifYmFSaMn1gXmiSpGJm5M66NGv3ENbzlFKRLk9PCNKPmY3+cVDKQuufpCmteLeVcZ1E8lKRcmFsC8Q05/F44X8uCRMRBwi+ncaNeCM+FkdVDojNPNxp4ljnoZMVpvkLwRjUGYu34ixpQcE/ajd++BMchQt+KGxfzaSCPVm9IPw91cch168lWmz17T5nJAvkUlyEeK1KHPjbvDsxloTPXLHbc3+7G74a5eUE2kbKOGRyf+jy0Jvo4Oi3wdfWLe0+Jo2KTcmPjYoihsRuWM1Shy6WJk3loWe7MjFCzBderm2tyV3M+L56mRra/aqkyX6ioXiCtn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 03:24:48.8843 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b645c302-7d7d-41f2-7cba-08ded6572418
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6989
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

Add complete platform filtering usage guide demonstrating all three
filtering methods with emphasis on config file approach as recommended
by Kamil.

Documentation includes:
- Automatic filtering explanation (no manual calls needed)
- Config file examples (RECOMMENDED for large test lists)
- Environment variable examples (quick testing)
- Built-in rules examples (production)
- Wildcard patterns and priority system
- Real-world examples with ticket references
- Best practices for dev/team/CI/production use

Addresses Kamil feedback: "Add also example with config file as env vars
are not convenient for large tests lists."

File location: docs/platform_filtering.md (integrated with MkDocs)

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 docs/platform_filtering.md | 320 +++++++++++++++++++++++++++++++++++++
 mkdocs.yml                 |   1 +
 2 files changed, 321 insertions(+)
 create mode 100644 docs/platform_filtering.md

diff --git a/docs/platform_filtering.md b/docs/platform_filtering.md
new file mode 100644
index 000000000..5c64fa49b
--- /dev/null
+++ b/docs/platform_filtering.md
@@ -0,0 +1,320 @@
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
index 0abb76704..6f427b20f 100644
--- a/mkdocs.yml
+++ b/mkdocs.yml
@@ -29,6 +29,7 @@ nav:
     - How to document tests: 'test_documentation.md'
     - How to categorize tests: 'test_categories.md'
     - How to blocklist tests: 'blocklists.md'
+    - Platform filtering: 'platform_filtering.md'
     - How to get code coverage: 'code_coverage.md'
     - How to port new IGT driver: 'new_driver.md'
     - How to plan a new test: 'test_plan.md'
-- 
2.54.0

