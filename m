Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2ABC43458
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 22:04:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118CD10E0E4;
	Thu,  9 Jul 2026 22:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KAxNuKnv";
	dkim-atps=neutral
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011000.outbound.protection.outlook.com [52.101.62.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BBD310E0DC
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 22:02:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MFtChmcOOWYS/daabdWCiQzT72q8LiYnPYyu/d56nRRAw71wGlvSA/SBSeOqgNufEaZ/KQza+CEKtAeW2vM9y1lM7SxrXU8gcvJ8f08T9j7uSGJW92mzGWz4TbpEw79VNyv77trPs5xw1Qet145aWZDxvVTvCAaMx4D4+g0DUiKXADJLG7mD4NQdORqiuqFresbGLjxXnu36Lhn2/UoRwqVlJ12uVt1sIRcVUNQmbw6OGrXxiY+4Qj7gYnIlBRjctYtbSfj8y/DqT2+GwZ3RD4eYlyYlwxru6Dwn42qi2/oz/PflZ58CbRl2xeM3Wu/BzmB5snK5CHkyzTvhFgNk7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jn+QzXo+xdlN4cHvFQkCWVq0WXWfEU1c0y+BWKM2B8I=;
 b=N+zOII3MHKS8d2iIt7jy1VaIxM66R4jdh6PEGxIiCHyyCiCXK5uhw1jymGie/tEiGvELsKB3wX5453CWdO183zAmt5jy7RQoZuWfpgDYw1KB4eoXEjFISB6Z4xmlcLWWgm4EQ+vYWJjaOX1if9Ero/1UltWcAd7V2thZEF0/vOBb/6CQsEfMmcM6sKuaND1V374a8E1CraYtpshjzSGyl1NIrwsZSVHbIpZRscI/DIqOWnNI6BoseotoYGXVyhhf4TJgs5pVkWKpYqhIedoiureceuKasMpCaWRj4Nvalezu1++dMrkMtDqy8rSzjOYrmYNtkGu55DZgSOR6vE8z0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jn+QzXo+xdlN4cHvFQkCWVq0WXWfEU1c0y+BWKM2B8I=;
 b=KAxNuKnvCGWMIufy6w7nY5G1slPEscwJ1wGvcl+CwdE4CQ0wfmvJqx7zZZztxNwYgPnVSObVQDSTHm85FmwJYByJED7rsZzJsT29OCtKehxCXWM9QDtXeYqTfElVGAv93iyGzSO2Ib49Dlx59vTgHwryAphkg3LFV7Rym5SQNSg=
Received: from SN7PR04CA0057.namprd04.prod.outlook.com (2603:10b6:806:120::32)
 by IA1PR12MB9061.namprd12.prod.outlook.com (2603:10b6:208:3ab::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 22:02:50 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:806:120:cafe::a6) by SN7PR04CA0057.outlook.office365.com
 (2603:10b6:806:120::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.11 via Frontend Transport; Thu, 9
 Jul 2026 22:02:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 22:02:50 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 17:02:47 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 17:02:46 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 9 Jul 2026 17:02:46 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Jesse Zhang <jesse.zhang@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 6/6] docs: Update platform filtering documentation per review
 feedback
Date: Thu, 9 Jul 2026 18:02:17 -0400
Message-ID: <20260709220240.132893-6-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709220240.132893-1-vitaly.prosyak@amd.com>
References: <20260709220240.132893-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|IA1PR12MB9061:EE_
X-MS-Office365-Filtering-Correlation-Id: d87efcee-bfa2-4c7a-f68a-08dede05d1b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|36860700016|376014|82310400026|1800799024|3023799007|6133799003|22082099003|18002099003|5023799004|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 7Ug9G1zMywHvpsmIDkADU6Keex6Jvw4uL3CTYapK9sKcOb5IcbBfQv6Q8NFTHx68GwdzcJzc7/5hjIa+k8B3Afta514BCPvcvtImf3KVYYJvTAMgkihUTvD9Mkbe4mArKwqUQDrl46ZU0+4O4AOXY30RVGihmXOn4ChPiZvV/8JCW1hxYzw/bfShERfNOkRV7rLSq85xHy3WKupHy6NSSuzKSam6loV8je1IXtt9nITgFCuO2dQseN/skkbtfvgPppKXTEPAEYc2I75pSy9Tsw/2O7/I7wdZUUCBAtN2gm3e2/y1sbzNRS9Tt/SxTONAcSHmR2ef2KOep8p1FL8LCH2pOD1UVPUn057dlyVqshRimJ6b79dcI0WViwWyMEKq4q1MVxapXXXAkn/AiGoVb8YxvhCEaTq87nXYUKu60W498EzMlxy+Y0ThIhxgP2GC12SH9hxXNe/M0ZQdY5/rj9C/r2apv+i66gQ/c+YUoIreF4mXMXpB4p1LB9QY9pHodaThouPifghlj0Z49xzdLAB4jmowmHKaG/50knLy1x28nMNePNoWcUh2rCp4kxwt490lz+bee6blmxwHQ/Dpt+ZZ1hffe1/GwVH3z+3fo5tvEGD9yu5V+gbuKmMVaMpQTpE5n5F9Qovpr6mc+ryquzkYgkAUGZfQQniMmkW8aecT4zRIyAr7ghAAt2IzynIB1GCA0d6C0VY8CWkDltLBgQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(3023799007)(6133799003)(22082099003)(18002099003)(5023799004)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3aXvpf8NexUEaGJNtYvCQFkH4lzlUqpD0EfArQH8QzrYlgk95tfmfSQzYXo/SWyEEynNfrfZWynbF61g5UAI+PuFdtAskBcMV5l380rfV3v/vimmCReK9C4WPRWurKtfvE6gJmpZePufM5xa5RSn5cRRYN5e5jdSJM1rpt0nGK1tEv+SljFndSAiODs8xmg0xZQKNY8whs0ix92kdgolurnB3BGJHjHJSu6S5mm8tfVdZe8bYBLHzb5I8iLFMIBS38AC5GgwjBlxtLCKUA+1hrhOsBwH7W1RdrLM5xUDAsswqLARAWyBA0k6qTl1/Zd2rdYiHvXAjesIPbiHz2Yqwm5h169ag03YuGv8RQuanUmUTJjqJczbhTzrjYXiAx6u3jFE0aRhxGWjPCDLFbomG3ovFiQ8dFGEJ6pLFJQ1yJ6yRPHp84HYQGWhIACOs3v3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 22:02:50.7159 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d87efcee-bfa2-4c7a-f68a-08dede05d1b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9061
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

Address review comments from Krzysztof Kozlowski:

1. Reordered documentation methods to match priority order:
   - Method 1: Built-in Rules (highest priority) - was listed last
   - Method 2: Config File (recommended)
   - Method 3: Environment Variable (lowest priority)

2. Replaced "Advantages/Disadvantages" sections with "When to Use" and
   "Trade-offs" to better reflect that each method has valid use cases
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

5. Removed redundant checkmark (?) from summary table next to
   "Config file" entry

6. Updated mkdocs.yml title from "How to filter platforms" to
   "How to filter tests per platform" to match "How to" style
   of other documentation entries

v4 changes:
 - Addressed all review comments from Krzysztof Kozlowski
 - No functional code changes from v3

Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Change-Id: I5a618ef84b09f57c5c06136bde01a7df77424720
---
 docs/platform_filtering.md | 212 +++++++++++++++++++------------------
 mkdocs.yml                 |   2 +-
 2 files changed, 112 insertions(+), 102 deletions(-)

diff --git a/docs/platform_filtering.md b/docs/platform_filtering.md
index 2d2dab372..ab4fc9cd9 100644
--- a/docs/platform_filtering.md
+++ b/docs/platform_filtering.md
@@ -46,9 +46,40 @@ Use one of three methods (checked in priority order):
 
 ---
 
-## Method 1: Config File (RECOMMENDED)
+## Method 1: Built-in Rules (Highest Priority)
 
-**Best for**: Large test lists, team-wide configuration, CI/CD
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
+- ✅ Fast (no file I/O at runtime)
+- ✅ Guaranteed to be applied
+- ✅ Version controlled with code
+- ❌ Requires rebuild to change
+- ❌ Not flexible for temporary exclusions
+
+---
+
+## Method 2: Config File (RECOMMENDED)
 
 **Location**: `/etc/igt/platform_skip.conf`
 
@@ -97,20 +128,18 @@ EOF
 # Platform filtering (config): SWDEV-12345
 ```
 
-### Advantages
+### When to Use Config File
 
-✅ Persistent across sessions
-✅ Easy to manage many rules (add/remove/edit)
-✅ Team-wide configuration
-✅ CI/CD friendly
-✅ No rebuild required
-✅ No environment variables to remember
+- Managing multiple test exclusions
+- Team-wide or CI/CD configurations
+- Persistent filtering rules across sessions
+- Easy add/remove/edit without rebuilding
+- No need to remember environment variables
+- Sharing skip rules across test infrastructure
 
 ---
 
-## Method 2: Environment Variable
-
-**Best for**: Quick testing, temporary overrides, single test skip
+## Method 3: Environment Variable (Lowest Priority)
 
 **Variable**: `IGT_PLATFORM_SKIP_CONFIG`
 
@@ -130,62 +159,22 @@ export IGT_PLATFORM_SKIP_CONFIG="navi48:amd_basic:*-UMQ:Testing;navi31:amd_basic
 ./build/tests/amdgpu/amd_basic
 ```
 
-### Use Cases
-
-- **Quick one-off testing**: Temporarily skip a test without modifying config files
-- **Debugging**: Isolate specific failures by skipping known issues
-- **CI pipeline overrides**: Inject test skips for specific job runs
-- **Developer testing**: Skip tests during development without persistent config
-- **Testing the filter**: Verify filtering system works correctly
-
-### Disadvantages
-
-❌ Not persistent (lost when session ends)
-❌ Inconvenient for large test lists
-❌ Easy to forget it's set
-❌ Hard to manage multiple rules
-
-**Recommendation**: Use config file for managing test exclusions at scale.
-
----
-
-## Method 3: Built-in Rules
-
-**Best for**: Permanent production exclusions
-
-**Location**: Vendor implementation (e.g., `lib/amdgpu/amd_platform.c`)
-
-### Example
-
-```c
-static const struct platform_skip_entry amd_builtin_rules[] = {
-    {
-        .test_name = "amd_security",
-        .subtest_glob = "secure-bounce",
-        .reason = "Not supported on APUs",
-        .platform_data = &apu_platforms,
-    },
-};
-```
-
-### Advantages
-
-✅ Fast (no file I/O)
-✅ Guaranteed to be applied
-✅ Version controlled with code
+### When to Use Environment Variable
 
-### Use Cases
+- Quick one-off testing without editing files
+- Temporary overrides during debugging sessions
+- Testing filter patterns before adding to config file
+- Single test runs where config file would be overkill
+- Overriding config file rules for specific test runs
+- CI pipeline job-specific overrides
 
-- **Quick one-off testing**: Temporarily skip a test without modifying config files
-- **Debugging**: Isolate specific failures by skipping known issues
-- **CI pipeline overrides**: Inject test skips for specific job runs
-- **Developer testing**: Skip tests during development without persistent config
-- **Testing the filter**: Verify filtering system works correctly
-
-### Disadvantages
-
-❌ Requires rebuild to change
-❌ Not flexible for temporary exclusions
+**Trade-offs:**
+- ✅ No file editing required
+- ✅ Quick to set and unset
+- ✅ Can override config file for testing
+- ❌ Not persistent (lost when session ends)
+- ❌ Easy to forget it's set
+- ❌ Inconvenient for large test lists
 
 ---
 
@@ -199,37 +188,47 @@ All methods support wildcards (`*`) for flexible matching:
 navi*:amd_basic:my-test:Reason       # All Navi (navi10, navi31, navi48, etc.)
 
 # Test wildcards
-navi48:*:my-subtest:Reason           # All test binaries
-navi48:amd_*:my-subtest:Reason       # All AMD tests
+navi48:amd_*:my-test:Reason          # All amd_* tests
 
 # Subtest wildcards
-navi48:amd_basic:*:Reason            # All subtests in amd_basic
-navi48:amd_basic:*-UMQ:Reason        # All UMQ subtests
-navi48:amd_basic:cs-*:Reason         # All CS tests
+navi48:amd_basic:*-UMQ:Reason        # All subtests ending with -UMQ
+navi48:amd_basic:cs-*:Reason         # All subtests starting with cs-
+
+# Combined wildcards
+*:*:*-UMQ:Reason                     # All UMQ tests on all platforms
 ```
 
----
+### Wildcard Examples
 
-## Priority System
+```bash
+# Skip all user queue tests during bringup
+navi48:*:*-UMQ:Platform bringup - UMQ not ready
 
-When multiple rules could match, first match wins (highest to lowest priority):
+# Skip all VCN tests on specific platform
+navi10:amd_vcn:*:Known VCN issues
 
-1. **Built-in rules** (compiled into test)
-2. **Config file** (`/etc/igt/platform_skip.conf`)
-3. **Environment variable** (`IGT_PLATFORM_SKIP_CONFIG`)
+# Skip specific test pattern across all platforms
+*:amd_basic:eviction-*:Intermittent failures
 
-Example:
-```
-Built-in: navi48:amd_basic:cs-gfx-*:Production exclusion
-Config:   navi48:amd_basic:*:Config exclusion
-Env:      navi48:amd_basic:cs-compute-*:Env exclusion
-
-Results:
-- cs-gfx-with-IP-GFX → Skipped by built-in rule
-- cs-compute-with-IP-COMPUTE → Skipped by config file
-- cs-sdma-with-IP-DMA → Runs normally
+# Skip all tests on EOL platform
+vega10:*:*:Platform no longer supported
 ```
 
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
 ---
 
 ## Skip Message Format
@@ -250,20 +249,31 @@ Source indicators:
 
 ## Platform Names
 
-**Note:** This is a partial list for examples. See vendor-specific backend files
-(e.g., `lib/amdgpu/amd_platform.c`) for the complete list.
+Platform names are vendor-specific and defined in vendor backend code.
 
-Platform names are vendor-specific. For AMD:
+**For AMD platforms**, see `lib/amdgpu/amd_platform.c` for the complete list.
 
-- `vega10`, `vega20` - Vega family
-- `navi10`, `navi14`, `navi21`, `navi22`, `navi23`, `navi24` - RDNA1/2
-- `navi31`, `navi32`, `navi33` - RDNA3
-- `navi48`, `navi44` - RDNA4
-- `strix_halo`, `phoenix` - APUs
-- `arcturus` - MI100
-- `aldebaran` - MI210/MI250
+**Examples:**
+- RDNA2/3 discrete GPUs: `navi21`, `navi31`, `navi33`
+- RDNA4: `navi48`, `navi44`
+- APUs: `strix_halo`, `phoenix`
+- Data center: `aldebaran` (MI250)
 
-Use `*` to match all platforms.
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
 
 ---
 
@@ -284,7 +294,7 @@ unset IGT_PLATFORM_SKIP_CONFIG
 Use config file with ticket references:
 ```
 # /etc/igt/platform_skip.conf
-# Updated: 2026-06-29
+# Updated: 2026-07-09
 
 # Navi48 bringup exclusions
 navi48:amd_basic:*-UMQ:SWDEV-88888 - UMQ stabilization
@@ -326,9 +336,9 @@ static const struct platform_skip_entry amd_builtin_rules[] = {
 
 | Method | Use Case | Persistent | Rebuild Required |
 |--------|----------|------------|------------------|
-| **Config file** ✅ | Team/CI exclusions | Yes | No |
-| **Environment** | Quick testing | No | No |
 | **Built-in** | Production rules | Yes | Yes |
+| **Config file** | Team/CI exclusions | Yes | No |
+| **Environment** | Quick testing | No | No |
 
 **Recommendation**: Use **config file** for managing test exclusions at scale.
 
diff --git a/mkdocs.yml b/mkdocs.yml
index f220674b3..1819b7b6c 100644
--- a/mkdocs.yml
+++ b/mkdocs.yml
@@ -29,7 +29,7 @@ nav:
     - How to document tests: 'test_documentation.md'
     - How to categorize tests: 'test_categories.md'
     - How to blocklist tests: 'blocklists.md'
-    - How to filter platforms: 'platform_filtering.md'
+    - How to filter tests per platform: 'platform_filtering.md'
     - How to get code coverage: 'code_coverage.md'
     - How to port new IGT driver: 'new_driver.md'
     - How to plan a new test: 'test_plan.md'
-- 
2.54.0

