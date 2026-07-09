Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24535C43458
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 22:04:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C572010E2C8;
	Thu,  9 Jul 2026 22:04:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fXSbnCsL";
	dkim-atps=neutral
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012042.outbound.protection.outlook.com [40.107.209.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC4D10E0DC
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 22:02:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qf28WB3FGAg8XpNbdrfgW1GbW7zNx808peWmQDbNu2GXMJngBLxvCg67Wdr4/7OgdRY/tLvepyWTgnzCu9c8ol9+BtcRjJRnvGMv4cHanCllMDy6FzKrnX8n/o1AU+MImFgKO/ppVFScgllSVkkNTGn+U8PtzjIhY47XT26+O1+u0PqJUW90r3HMLFEST2Uzxi9GBs956KQp5OvmMpDMDhO+L9aAdcoJS2w2SW7wvLtrqB4I/gQP03LlDxitCTjWUYDU7jNCi0rk79ySzo+nT/gb/wcRYUSmPn6WHM8SoBjgmE5T4O3pa1R8Ygswmw594MVOI8avX4oHyNswTh2bnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PLd9sfDTuSmARkbJBdwQmmtB3Uq6oP2hpuVCEcPLrY4=;
 b=MmIBFd69YsmMVkpblsBU/D2IA1EtLjaEFi1VEoS9DfndDO9uJUBXFGbeYtK3Simn8K6IKtrGD3w9/NBSEEF9iTiEzRoVMO1pLnTvvSf+B35stuibLy6djZ681KN8mFvoMM+zXyDA8RCmhzM9u3e4cCZNdFQNqyeuvhS1BeTtsePsOFAzJZmQrDg2f8Osi2vL4MY1HmezTBHiMV/WS0uCpjZo1ei/laRSB89hhgTPnLY1JMCn5VUwdeE7Dz0/I3rtmTU2AP5Z/IpelRHlLncEIod0OfMYinA8WGCLRG+FvGjTXHFBzIXN18INtFbOKKhv/ke7JvD/yhKHx8JmrYx5NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PLd9sfDTuSmARkbJBdwQmmtB3Uq6oP2hpuVCEcPLrY4=;
 b=fXSbnCsL4b1jq7vUB6elmsKVrgCz0dU6Rmm1zuVc2kSz5/+/MIZmirD/Q0+H477eW4NsWyzhhYBBT/4rcF2uCZzsbYX/Aus1KQEFPZCiQt3Td7zcucYxXg1B1lUaDlK5AEL0KYke3OWCkOwslUJEp1LLu53BIVJ5NvFEh945iYQ=
Received: from SA0PR11CA0001.namprd11.prod.outlook.com (2603:10b6:806:d3::6)
 by SA5PPFCAFD069B8.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8e1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Thu, 9 Jul
 2026 22:02:48 +0000
Received: from SN1PEPF00026369.namprd02.prod.outlook.com
 (2603:10b6:806:d3:cafe::19) by SA0PR11CA0001.outlook.office365.com
 (2603:10b6:806:d3::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.11 via Frontend Transport; Thu, 9
 Jul 2026 22:02:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00026369.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 22:02:47 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 17:02:45 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 9 Jul 2026 17:02:44 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Jesse Zhang <jesse.zhang@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH 4/6] docs: Add comprehensive platform filtering documentation
Date: Thu, 9 Jul 2026 18:02:15 -0400
Message-ID: <20260709220240.132893-4-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709220240.132893-1-vitaly.prosyak@amd.com>
References: <20260709220240.132893-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026369:EE_|SA5PPFCAFD069B8:EE_
X-MS-Office365-Filtering-Correlation-Id: 7898d52e-798f-4804-301c-08dede05cff4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|36860700016|82310400026|376014|5023799004|56012099006|11063799006|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: OchSev9t717Ajs2nivxNri95AjzDBe0N+PV1bQr+yc2Y+jm3h4Xy2VIJqp65KUypSqH/WWv68JuQp1OoReA8d0LZyd8nqAMRU00Jk07H/to5qYwwANwRYpfoDyDTcfmB6gxCdezKssdLS4MRU8vD84NAvZZVRNQRPQ4x9dx2Cr9LOvJvwj/Y1B6dSIl4au02Hy9/1D0tR12bwvu941VwEutNdxbdYYKQVxwfTQWHV+ueUImW9I4H1JBCkPXr6qZs+ZV1R7L4xwyBMbBF0HeLh0xxFjQx5yAzKuwAvFWwhMB3KXV4RMJPrFvXaiu6qUnvSA42ZxyHKmiJXgSLSB4C4wwQ2RaMLzl6IwS5uA23rC5axS+gC+gIuvH/aBjakyVf+i+k9EPhyx/bwJ04e2gIVgtTF9LvzkxNspssuQjPDlAtOyPNHY2Bc/XgF5l7m3cCDFD4IRkO84GimV6e6qAZABT5h2A45FZtkzbi9omFyzPDzFZlHohfePBDzIliL6j2Hxlde5MdxaD4h2N0/cb21QvKYy7TUcdf4vhSe4VxUFmCpCb1vu5qhAEF3c1BuYMbbP3V/oH73L5mlO+RS6b++uiLiTaYWRnIfRFIBu6a2Ha5XOBCWp2syz3KyQ2tuEp6Io9XgeaWUZ4SYD9UJMVohsTRP083yljTwWlvxRJkO6CKzMtfN6+OBSU1n8KyejhfnW8r/NyM3EJHp8bZizBfrA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(36860700016)(82310400026)(376014)(5023799004)(56012099006)(11063799006)(22082099003)(18002099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: m1EYsW3Qr1eBZ4Y9WLEf+fbKcvtIdRh6pggZOAC+zdObpNKETDueT4MByFB0jOP25X5RwmoI0gMbYK8ixHalwA5orUh+L4pU0+ktFLRoufVZ/Prl6yh/SH//eOi3FOMCOmlIWXBIWNW5096gDvR4QWkZsYzlOuIH5Zf/moxHGW3HRIpTizJbIZuZaEOSkzi9G/nKBPo9+MP94IPBOhDmEM1fNIg5BZeWnqgU4d9U8deNGAiUSaNRjLl55lRdD/22qyaUMOK16eqVjhdZ1IskY3jAXZC7gnktcjAhjNy7mhJHUjP/1EtA4/J9zVreUwc5i7rbSiT3tfMOS8wf6dTLK1BOVJQMAg2oNVWPbl5yPL/uBRD6TNd+twu0Zcl7HsQYoWTpJaAnS4nqD+Tq2o3G9UXk8NKc5lo2PwuvZ3sfn7igyLMxVKq9O0J/IuXm4m05
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 22:02:47.7926 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7898d52e-798f-4804-301c-08dede05cff4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026369.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFCAFD069B8
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
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
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

