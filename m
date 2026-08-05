Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEBBC55174
	for <igt-dev@archiver.kernel.org>; Wed,  5 Aug 2026 20:37:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 116B010EFEB;
	Wed,  5 Aug 2026 20:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JdRb8hGE";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011037.outbound.protection.outlook.com [52.101.52.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B02910E25C
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Aug 2026 20:36:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j2Lv6y6LM+2hdCB9U6jf04238pmALTexx1AhCNdYqy83x8Z+Ft3h7LdMDqpV0reIlVIKjj1uPhwe1+AoZrwnE2iyDUB9XZYwTrs/CR4vazMlINTa5JFc+PjywHO+HX4mMI0Ch0tyhkuAiVKWhzXarN60L2m4L1cst44hauOJ2xcSIIXcPW0bFHQiNmhRwuDE6x1YYqhluH9jVkJ2D39uWAw6irZ33tGfRxtV4XDHQJqaEuwJy8En7qLYGHfZnJDCJEZq30dyM3+FbbskQPPRdMjMrFhNvdgiOyj4RcBgy60wL8KeSDbICpE95ZxsoBT8n1zYk4i4JvhbET2CJKAYbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6ezTnpHUqtXZXySDOhaHVl5gbsQ6iNPJhyo0ZJoyjQ=;
 b=Cj9b3B4KKAk/DFSuY3R6yL2gLkbjy/ISDc8hYQRhd3YVGXVd5/gKswj361O7X5Ylu5txYuGMGsYnKO+Rn08+HO2TQaMJKyhvoaOpt5ung0kXKlnJJpiuqslpkDlo/eS0LofWUnD7eg8ENWBIWSmzvLORPHZtFtlvYdmd3zELtSl3F8zRc2SplEqx1dwMuQUv+Wt3MNyoU0oTTR4GOSOK+nR7mkfEjMlhhvc9tH+mTWxOF2Mbw19J7WQnLlFAbnKEye0kXR6Afx5Vj9oZ/vVUukzrammlUOWQCA3IsSJcGX6nsIkW86DpmmmOZk5HWkGxJe8KirDuDse6SA35iIHHCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6ezTnpHUqtXZXySDOhaHVl5gbsQ6iNPJhyo0ZJoyjQ=;
 b=JdRb8hGElc+wF3mTL4G5VkD6ldgBI34sJAhNLBNESCiyzxLn6G5jH5SWKHcj3Hkh1XPowVF6l4H8EirUsLpuQM5nvXsZVCeI/aQn/gnVBZbI+IF45bYm4uTOsA/IWUj8uebZOqvMFJHovQDC4nynlq10FDkVBaXa323ONscOHU4=
Received: from SA9PR13CA0039.namprd13.prod.outlook.com (2603:10b6:806:22::14)
 by CH0PR12MB8549.namprd12.prod.outlook.com (2603:10b6:610:182::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 20:36:22 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:806:22:cafe::78) by SA9PR13CA0039.outlook.office365.com
 (2603:10b6:806:22::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.8 via Frontend Transport; Wed, 5
 Aug 2026 20:36:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Wed, 5 Aug 2026 20:36:22 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 5 Aug
 2026 15:36:21 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 5 Aug
 2026 13:36:21 -0700
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 5 Aug 2026 15:36:20 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <pawel.sikora@intel.com>,
 <jani.nikula@linux.intel.com>, <jesse.zhang@amd.com>,
 <christian.koenig@amd.com>, <alexander.deucher@amd.com>, Vitaly Prosyak
 <vitaly.prosyak@amd.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>
Subject: [PATCH v5 4/4] docs: Update platform filtering documentation per
 review feedback
Date: Wed, 5 Aug 2026 16:35:29 -0400
Message-ID: <20260805203608.148375-5-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260805203608.148375-1-vitaly.prosyak@amd.com>
References: <20260805203608.148375-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|CH0PR12MB8549:EE_
X-MS-Office365-Filtering-Correlation-Id: cbc3ecfa-5418-47ad-a3ef-08def3313634
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|6133799003|10067099003|5023799004|11063799006|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: KTMY9seXAaBA0S1BSGxBC79S0s2FL6qXVDpcGUOHXoouw9cPcC4LRoQtuW9PVt4Cp66c0/yGiteGiwx314+ZA27rcoymiE/aLmFuZ9CrANOGcqFaqtpX1hFdY5bWp66/tf5Iu10QRlwxKCeE/BVwfDVMg4pM24zW1s+Cbfy/VHtnYqfq+LUnPXk3LmtD54aRwXabSPCwpvaq6034/AnnRpZDuEiHL5jMqQltDdJwFlz8FFPjZ11L0YEWqvLkhw0C3uLC46RS2WHLIB90Ca7659vmJxwbuv1/c9hA/B9NdbGEO8ukwD+Jd+kseMPRcuKVr1B19dXMFNV69XOeOwTRKiWpGdibq8zy3ruwMFuZoUEiusmz2L2Hqx2e4H/0paa79ue4RWpcSsTKztrQdJWXadBAkGAvPXSa+XcxuecBZqtxTuY9lehxziG4T7zMd7LLP25qDtQma4ARwEAoVUSE8dgJRP3K8uxaO8944+v0iSGVQA9tswBp5vanb3Qs7cw0wMIMGaslKGny79rsOirBMj2CqE2V/dOW1bzqHpcrj5O+yhF6vsHdGYnlRI7qQekPEpd/enG/rnyYTZlaOKP/AVyUBzaiKcysgu9UbLfQjOv5SCJvqMFBjdxSapAu/Rzh/S7A8lE7reOq9iVp7QHJkpZ7Wd0PsddqDVLp4drITVIla5aWxQsi4cdLxafZ6E9d5ldjtJ87BNkOR2PyXr76cQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(6133799003)(10067099003)(5023799004)(11063799006)(56012099006)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VmrrH8Jwa+Al/O6zfqTEx7vHn1GgrtJIGPdrl/GpShT9mRrPT1TfU8p5G0ZNBVUIxFibLBqNXY8a9ZHreK74FwH2XTOyAw4BYRSOUFVMlSe+QmHdPvwSVBdFLnPkHQMMtgSkedNx2wgCFuglPEG+kHu1kEsYq1roeQjhD7LFzUedq8NNXMnAObce4wr+MXq4VJz5O0B2B8zMCZ2BT84VHSXmtuIbva/SB6uW4wou39+c/fP5+6JVMMd4lm71sLQ0vr8x9va+ICK93n1kKepOkw0tQ0tZu1d1vuIUGjxZN0KIy2v//JSLcTIxj1XM+wg1VbxEjiIrHWd3wSl5gfHQeHfpVxvgA2hTrrY9+sOAL6iJwn8AAgQOt10czpTaZxrvS3AfWtN4V7cFoP+OxHAybsZrgninTuXPxftgxUQ+2jHMO0EQB/ICxuUL3zbucQaX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 20:36:22.1292 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc3ecfa-5418-47ad-a3ef-08def3313634
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8549
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

Update the platform filtering usage guide to clarify method priority
ordering, replace Advantages/Disadvantages with When-to-Use/Trade-offs,
and add runtime methods for discovering platform names.

Address review comments from Krzysztof Kozlowski:

1. Reordered documentation methods to match priority order:
   - Method 1: Built-in Rules (highest priority) - was listed last
   - Method 2: Config File (recommended)
   - Method 3: Environment Variable (lowest priority)

2. Replaced Advantages/Disadvantages sections with When to Use and
   Trade-offs to better reflect that each method has valid use cases
   rather than suggesting one is universally better

3. Added positive use cases for environment variable method:
   - Quick one-off testing without editing files
   - Temporary overrides during debugging
   - Testing filter patterns before committing to config
   - Was showing only disadvantages before

4. Made platform names list generic with code reference:
   - Changed from hardcoded exhaustive list to examples
   - Added reference to lib/amdgpu/amd_platform.c for complete list
   - Added methods to discover platform name at runtime
   - Noted that list may change with new hardware generations

5. Removed redundant checkmark from summary table

6. Updated mkdocs.yml title from "How to filter platforms" to
   "How to filter tests per platform" to match "How to" style
   of other documentation entries

v5: Address review from Kamil Konieczny:
   - Replaced emoji with ASCII [+]/[-] in docs/platform_filtering.md
   - Removed Gerrit Change-Id from commit message
   - Moved detail below --- separator (not in git log)
   - Added Cc: Pawel Sikora per Kamil's request

Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Pawel Sikora <pawel.sikora@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 docs/platform_filtering.md | 351 +++++++++++++++++++++++++++++++++++++
 mkdocs.yml                 |   1 +
 2 files changed, 352 insertions(+)
 create mode 100644 docs/platform_filtering.md

diff --git a/docs/platform_filtering.md b/docs/platform_filtering.md
new file mode 100644
index 000000000..7d3202a94
--- /dev/null
+++ b/docs/platform_filtering.md
@@ -0,0 +1,351 @@
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
+## Method 1: Built-in Rules (Highest Priority)
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
+### When to Use Built-in Rules
+
+- Permanent production exclusions that should never run
+- Platform limitations known at development time
+- Tests that fundamentally cannot work on certain hardware
+- Vendor-specific restrictions that apply globally
+
+**Trade-offs:**
+- [+] Fast (no file I/O at runtime)
+- [+] Guaranteed to be applied
+- [+] Version controlled with code
+- [-] Requires rebuild to change
+- [-] Not flexible for temporary exclusions
+
+---
+
+## Method 2: Config File (RECOMMENDED)
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
+### When to Use Config File
+
+- Managing multiple test exclusions
+- Team-wide or CI/CD configurations
+- Persistent filtering rules across sessions
+- Easy add/remove/edit without rebuilding
+- No need to remember environment variables
+- Sharing skip rules across test infrastructure
+
+---
+
+## Method 3: Environment Variable (Lowest Priority)
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
+### When to Use Environment Variable
+
+- Quick one-off testing without editing files
+- Temporary overrides during debugging sessions
+- Testing filter patterns before adding to config file
+- Single test runs where config file would be overkill
+- Overriding config file rules for specific test runs
+- CI pipeline job-specific overrides
+
+**Trade-offs:**
+- [+] No file editing required
+- [+] Quick to set and unset
+- [+] Can override config file for testing
+- [-] Not persistent (lost when session ends)
+- [-] Easy to forget it's set
+- [-] Inconvenient for large test lists
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
+navi48:amd_*:my-test:Reason          # All amd_* tests
+
+# Subtest wildcards
+navi48:amd_basic:*-UMQ:Reason        # All subtests ending with -UMQ
+navi48:amd_basic:cs-*:Reason         # All subtests starting with cs-
+
+# Combined wildcards
+*:*:*-UMQ:Reason                     # All UMQ tests on all platforms
+```
+
+### Wildcard Examples
+
+```bash
+# Skip all user queue tests during bringup
+navi48:*:*-UMQ:Platform bringup - UMQ not ready
+
+# Skip all VCN tests on specific platform
+navi10:amd_vcn:*:Known VCN issues
+
+# Skip specific test pattern across all platforms
+*:amd_basic:eviction-*:Intermittent failures
+
+# Skip all tests on EOL platform
+vega10:*:*:Platform no longer supported
+```
+
+### Pattern Matching Rules
+
+- `*` matches zero or more characters
+- Patterns are case-sensitive
+- Empty field is NOT a wildcard (use `*` explicitly)
+- Priority order: Built-in > Config file > Environment variable
+
+### Example Subtest Matching
+
+Given config: `navi48:amd_basic:*-UMQ:Testing`
+
+- cs-gfx-with-IP-GFX-UMQ → **Skipped** (matches)
+- cs-compute-with-IP-COMPUTE-UMQ → **Skipped** (matches)
+- cs-sdma-with-IP-DMA → Runs normally (doesn't match)
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
+Platform names are vendor-specific and defined in vendor backend code.
+
+**For AMD platforms**, see `lib/amdgpu/amd_platform.c` for the complete list.
+
+**Examples:**
+- RDNA2/3 discrete GPUs: `navi21`, `navi31`, `navi33`
+- RDNA4: `navi48`, `navi44`
+- APUs: `strix_halo`, `phoenix`
+- Data center: `aldebaran` (MI250)
+
+**To find your platform name:**
+
+```bash
+# Method 1: Run any test with debug output
+./build/tests/amdgpu/amd_basic --debug
+# Look for: "Platform detected: <name>"
+
+# Method 2: Check dmesg for GPU info
+dmesg | grep -i amdgpu | grep -i asic
+
+# Method 3: Check /sys
+cat /sys/class/drm/card0/device/asic_name  # If available
+```
+
+**Note:** Platform names may change with new hardware generations. Check vendor backend code for current platform definitions. The list above is provided as examples only.
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
+# Updated: 2026-07-09
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
+| **Built-in** | Production rules | Yes | Yes |
+| **Config file** | Team/CI exclusions | Yes | No |
+| **Environment** | Quick testing | No | No |
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
index 0abb76704..1819b7b6c 100644
--- a/mkdocs.yml
+++ b/mkdocs.yml
@@ -29,6 +29,7 @@ nav:
     - How to document tests: 'test_documentation.md'
     - How to categorize tests: 'test_categories.md'
     - How to blocklist tests: 'blocklists.md'
+    - How to filter tests per platform: 'platform_filtering.md'
     - How to get code coverage: 'code_coverage.md'
     - How to port new IGT driver: 'new_driver.md'
     - How to plan a new test: 'test_plan.md'
-- 
2.43.0

