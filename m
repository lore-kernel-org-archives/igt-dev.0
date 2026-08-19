Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82A9C5DF85
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 18:59:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567D110EE7F;
	Wed, 19 Aug 2026 18:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UxakyM5o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB2910EE7F
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 18:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787165926; x=1818701926;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=POizDkvS6T1IO3Hh7GjTBT77+8oJvf3byJbx7UMN5jU=;
 b=UxakyM5oYCNcJBC9CG2jPAg8i8IvwRnUWoaFmkuTX9YQobZM3esUYsVt
 R2j9dqr5+u5xPUxp9N+r3gloMrJZFzN8UyujPr5Ay9eVBUNv+Mgz30bpl
 tSy6vWFZ27nnmDOCChWjTzc7mm6c/6ttVTNjTs6C/gvyl2JdGbv26qHDk
 OD5Qp6eZNiYSAXr7QRT/adFYoO8ASjVsPqdXv0S7WEsvU+LBUVBiMptfO
 sw+6LeG1LfTfhGhDVxsh27EWcv3bzH/NpBXH3Uz8zJJc23D+6vnGHIlTa
 +R9Ud8twgciDwHFw7qDPMW7gWjlR0ZPzOuE9YK9HIg4oypZ2oh4few5Ig g==;
X-CSE-ConnectionGUID: oMore91bRrq7jNYz2EG/ag==
X-CSE-MsgGUID: arZEILCmRzOK5SkCQvCbiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87455596"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="87455596"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 11:58:46 -0700
X-CSE-ConnectionGUID: t64ggrvtRfyMAA5LpnEu3Q==
X-CSE-MsgGUID: Lfc9hHKKT2GxaZN186MUAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="269153683"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 11:58:44 -0700
Date: Wed, 19 Aug 2026 20:58:41 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org, pawel.sikora@intel.com,
 jani.nikula@linux.intel.com, jesse.zhang@amd.com,
 christian.koenig@amd.com, alexander.deucher@amd.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v5 4/4] docs: Update platform filtering documentation per
 review feedback
Message-ID: <20260819185841.r2tzif7mrcctoxgt@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org,
 pawel.sikora@intel.com, jani.nikula@linux.intel.com,
 jesse.zhang@amd.com, christian.koenig@amd.com,
 alexander.deucher@amd.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
References: <20260805202856.147163-1-vitaly.prosyak@amd.com>
 <20260805202856.147163-5-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260805202856.147163-5-vitaly.prosyak@amd.com>
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

Hi Vitaly,
On 2026-08-05 at 16:28:48 -0400, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> Update the platform filtering usage guide to clarify method priority
> ordering, replace Advantages/Disadvantages with When-to-Use/Trade-offs,
> and add runtime methods for discovering platform names.

Add here any signed-off, cc, acks and/or r-b. After that
place at beginning of line '---' so following do not enter
git log history.

With this fixed
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> 
> Address review comments from Krzysztof Kozlowski:
> 
> 1. Reordered documentation methods to match priority order:
>    - Method 1: Built-in Rules (highest priority) - was listed last
>    - Method 2: Config File (recommended)
>    - Method 3: Environment Variable (lowest priority)
> 
> 2. Replaced Advantages/Disadvantages sections with When to Use and
>    Trade-offs to better reflect that each method has valid use cases
>    rather than suggesting one is universally better
> 
> 3. Added positive use cases for environment variable method:
>    - Quick one-off testing without editing files
>    - Temporary overrides during debugging
>    - Testing filter patterns before committing to config
>    - Was showing only disadvantages before
> 
> 4. Made platform names list generic with code reference:
>    - Changed from hardcoded exhaustive list to examples
>    - Added reference to lib/amdgpu/amd_platform.c for complete list
>    - Added methods to discover platform name at runtime
>    - Noted that list may change with new hardware generations
> 
> 5. Removed redundant checkmark from summary table
> 
> 6. Updated mkdocs.yml title from "How to filter platforms" to
>    "How to filter tests per platform" to match "How to" style
>    of other documentation entries
> 
> v5: Address review from Kamil Konieczny:
>    - Replaced emoji with ASCII [+]/[-] in docs/platform_filtering.md
>    - Removed Gerrit Change-Id from commit message
>    - Moved detail below --- separator (not in git log)
>    - Added Cc: Pawel Sikora per Kamil's request
> 
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Pawel Sikora <pawel.sikora@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  docs/platform_filtering.md | 351 +++++++++++++++++++++++++++++++++++++
>  mkdocs.yml                 |   1 +
>  2 files changed, 352 insertions(+)
>  create mode 100644 docs/platform_filtering.md
> 
> diff --git a/docs/platform_filtering.md b/docs/platform_filtering.md
> new file mode 100644
> index 000000000..7d3202a94
> --- /dev/null
> +++ b/docs/platform_filtering.md
> @@ -0,0 +1,351 @@
> +# IGT Platform Filtering - Usage Guide
> +
> +## Overview
> +
> +The IGT platform filtering framework allows tests to be skipped based on
> +platform characteristics without modifying test source code.
> +
> +**Key Feature**: **Automatic Filtering** - No manual calls needed in subtests!
> +
> +Tests only need to initialize platform filtering once in `igt_fixture`,
> +and the IGT framework automatically checks each subtest before execution.
> +
> +## Quick Start
> +
> +### 1. Initialize in Test (One Time)
> +
> +```c
> +#include "lib/amdgpu/amd_platform.h"
> +
> +int igt_main(void)
> +{
> +    struct amdgpu_gpu_info gpu_info;
> +
> +    igt_fixture {
> +        fd = drm_open_driver(DRIVER_AMDGPU);
> +        amdgpu_query_gpu_info(device, &gpu_info);
> +
> +        /* Initialize platform filtering - enables automatic filtering */
> +        amd_platform_filter_init(&gpu_info);
> +    }
> +
> +    igt_subtest("my-test") {
> +        /* No manual filtering call needed - automatic! */
> +        test_code();
> +    }
> +}
> +```
> +
> +### 2. Configure Filtering Rules
> +
> +Use one of three methods (checked in priority order):
> +
> +1. **Built-in rules** (highest priority) - Compiled into test
> +2. **Config file** (recommended) - `/etc/igt/platform_skip.conf`
> +3. **Environment variable** (lowest priority) - `IGT_PLATFORM_SKIP_CONFIG`
> +
> +---
> +
> +## Method 1: Built-in Rules (Highest Priority)
> +
> +**Location**: Vendor implementation (e.g., `lib/amdgpu/amd_platform.c`)
> +
> +### Example
> +
> +```c
> +static const struct platform_skip_entry amd_builtin_rules[] = {
> +    {
> +        .test_name = "amd_security",
> +        .subtest_glob = "secure-bounce",
> +        .reason = "Not supported on APUs",
> +        .platform_data = &apu_platforms,
> +    },
> +};
> +```
> +
> +### When to Use Built-in Rules
> +
> +- Permanent production exclusions that should never run
> +- Platform limitations known at development time
> +- Tests that fundamentally cannot work on certain hardware
> +- Vendor-specific restrictions that apply globally
> +
> +**Trade-offs:**
> +- [+] Fast (no file I/O at runtime)
> +- [+] Guaranteed to be applied
> +- [+] Version controlled with code
> +- [-] Requires rebuild to change
> +- [-] Not flexible for temporary exclusions
> +
> +---
> +
> +## Method 2: Config File (RECOMMENDED)
> +
> +**Location**: `/etc/igt/platform_skip.conf`
> +
> +**Format**: `platform:test:subtest:reason`
> +
> +**Note**: The reason field is recommended but can be empty. If omitted, "No reason" is automatically inserted.
> +
> +### Example Config File
> +
> +```bash
> +cat > /etc/igt/platform_skip.conf << 'EOF'
> +# Platform filtering configuration
> +# Format: platform:test:subtest:reason
> +# Use * as wildcard
> +
> +# Skip all UMQ tests on Navi48 during platform bringup
> +navi48:amd_basic:*-UMQ:SWDEV-88888 - UMQ stabilization in progress
> +
> +# Skip specific tests with ticket references
> +navi31:amd_basic:cs-gfx-with-IP-GFX-UMQ:SWDEV-12345
> +navi31:amd_basic:cs-compute-with-IP-COMPUTE-UMQ:SWDEV-12345
> +navi31:amd_basic:cs-sdma-with-IP-DMA-UMQ:SWDEV-12346
> +
> +# Skip tests on early samples
> +strix_halo:amd_basic:*:Platform not ready - ES samples
> +
> +# Skip known flaky test across all platforms
> +*:amd_basic:eviction-test-with-IP-DMA:SWDEV-99999 - Intermittent failure
> +
> +# Skip entire test binary on specific platform
> +navi10:amd_vcn:*:VCN encoding issues on Navi10 A0
> +
> +# Skip all tests on discontinued platform
> +vega10:*:*:Platform no longer supported
> +EOF
> +```
> +
> +### Run Tests
> +
> +```bash
> +# Config file is loaded automatically - no environment variable needed
> +./build/tests/amdgpu/amd_basic
> +
> +# Output shows:
> +# Subtest cs-gfx-with-IP-GFX-UMQ: SKIP
> +# Platform filtering (config): SWDEV-12345
> +```
> +
> +### When to Use Config File
> +
> +- Managing multiple test exclusions
> +- Team-wide or CI/CD configurations
> +- Persistent filtering rules across sessions
> +- Easy add/remove/edit without rebuilding
> +- No need to remember environment variables
> +- Sharing skip rules across test infrastructure
> +
> +---
> +
> +## Method 3: Environment Variable (Lowest Priority)
> +
> +**Variable**: `IGT_PLATFORM_SKIP_CONFIG`
> +
> +**Format**: Same as config file, semicolon-separated
> +
> +### Example - Skip Single Test
> +
> +```bash
> +export IGT_PLATFORM_SKIP_CONFIG="navi48:amd_basic:cs-compute-with-IP-COMPUTE-UMQ:Testing"
> +./build/tests/amdgpu/amd_basic
> +```
> +
> +### Example - Skip Multiple Tests
> +
> +```bash
> +export IGT_PLATFORM_SKIP_CONFIG="navi48:amd_basic:*-UMQ:Testing;navi31:amd_basic:cs-gfx-*:Known issue"
> +./build/tests/amdgpu/amd_basic
> +```
> +
> +### When to Use Environment Variable
> +
> +- Quick one-off testing without editing files
> +- Temporary overrides during debugging sessions
> +- Testing filter patterns before adding to config file
> +- Single test runs where config file would be overkill
> +- Overriding config file rules for specific test runs
> +- CI pipeline job-specific overrides
> +
> +**Trade-offs:**
> +- [+] No file editing required
> +- [+] Quick to set and unset
> +- [+] Can override config file for testing
> +- [-] Not persistent (lost when session ends)
> +- [-] Easy to forget it's set
> +- [-] Inconvenient for large test lists
> +
> +---
> +
> +## Wildcard Patterns
> +
> +All methods support wildcards (`*`) for flexible matching:
> +
> +```
> +# Platform wildcards
> +*:amd_basic:my-test:Reason           # All platforms
> +navi*:amd_basic:my-test:Reason       # All Navi (navi10, navi31, navi48, etc.)
> +
> +# Test wildcards
> +navi48:amd_*:my-test:Reason          # All amd_* tests
> +
> +# Subtest wildcards
> +navi48:amd_basic:*-UMQ:Reason        # All subtests ending with -UMQ
> +navi48:amd_basic:cs-*:Reason         # All subtests starting with cs-
> +
> +# Combined wildcards
> +*:*:*-UMQ:Reason                     # All UMQ tests on all platforms
> +```
> +
> +### Wildcard Examples
> +
> +```bash
> +# Skip all user queue tests during bringup
> +navi48:*:*-UMQ:Platform bringup - UMQ not ready
> +
> +# Skip all VCN tests on specific platform
> +navi10:amd_vcn:*:Known VCN issues
> +
> +# Skip specific test pattern across all platforms
> +*:amd_basic:eviction-*:Intermittent failures
> +
> +# Skip all tests on EOL platform
> +vega10:*:*:Platform no longer supported
> +```
> +
> +### Pattern Matching Rules
> +
> +- `*` matches zero or more characters
> +- Patterns are case-sensitive
> +- Empty field is NOT a wildcard (use `*` explicitly)
> +- Priority order: Built-in > Config file > Environment variable
> +
> +### Example Subtest Matching
> +
> +Given config: `navi48:amd_basic:*-UMQ:Testing`
> +
> +- cs-gfx-with-IP-GFX-UMQ → **Skipped** (matches)
> +- cs-compute-with-IP-COMPUTE-UMQ → **Skipped** (matches)
> +- cs-sdma-with-IP-DMA → Runs normally (doesn't match)
> +
> +---
> +
> +## Skip Message Format
> +
> +Automatic filtering shows the source in skip messages:
> +
> +```
> +Subtest cs-gfx-with-IP-GFX-UMQ: SKIP
> +Platform filtering (config): SWDEV-12345 - UMQ unstable on Navi48
> +```
> +
> +Source indicators:
> +- `(built-in)` - From vendor's compiled rules
> +- `(config)` - From config file
> +- `(env)` - From environment variable
> +
> +---
> +
> +## Platform Names
> +
> +Platform names are vendor-specific and defined in vendor backend code.
> +
> +**For AMD platforms**, see `lib/amdgpu/amd_platform.c` for the complete list.
> +
> +**Examples:**
> +- RDNA2/3 discrete GPUs: `navi21`, `navi31`, `navi33`
> +- RDNA4: `navi48`, `navi44`
> +- APUs: `strix_halo`, `phoenix`
> +- Data center: `aldebaran` (MI250)
> +
> +**To find your platform name:**
> +
> +```bash
> +# Method 1: Run any test with debug output
> +./build/tests/amdgpu/amd_basic --debug
> +# Look for: "Platform detected: <name>"
> +
> +# Method 2: Check dmesg for GPU info
> +dmesg | grep -i amdgpu | grep -i asic
> +
> +# Method 3: Check /sys
> +cat /sys/class/drm/card0/device/asic_name  # If available
> +```
> +
> +**Note:** Platform names may change with new hardware generations. Check vendor backend code for current platform definitions. The list above is provided as examples only.
> +
> +---
> +
> +## Best Practices
> +
> +### For Development - Quick Testing
> +
> +Use environment variable:
> +```bash
> +# Temporarily skip broken test
> +export IGT_PLATFORM_SKIP_CONFIG="*:amd_basic:broken-test:WIP"
> +./build/tests/amdgpu/amd_basic
> +unset IGT_PLATFORM_SKIP_CONFIG
> +```
> +
> +### For Teams - Shared Exclusions
> +
> +Use config file with ticket references:
> +```
> +# /etc/igt/platform_skip.conf
> +# Updated: 2026-07-09
> +
> +# Navi48 bringup exclusions
> +navi48:amd_basic:*-UMQ:SWDEV-88888 - UMQ stabilization
> +navi48:amd_vcn:vcn-encoder-*:SWDEV-88889 - VCN bringup
> +
> +# Cross-platform known issues
> +*:amd_basic:eviction-test-with-IP-DMA:SWDEV-77777 - Flaky
> +```
> +
> +### For CI/CD
> +
> +Deploy config file with test infrastructure:
> +```bash
> +#!/bin/bash
> +# CI pipeline setup
> +echo "Deploying test exclusions..."
> +scp ci-skip-rules.conf test-machine:/etc/igt/platform_skip.conf
> +ssh test-machine "./run-igt-suite.sh"
> +```
> +
> +### For Production
> +
> +Use built-in rules for permanent exclusions:
> +```c
> +// In lib/amdgpu/amd_platform.c
> +static const struct platform_skip_entry amd_builtin_rules[] = {
> +    {
> +        .test_name = "amd_basic",
> +        .subtest_glob = "*-UMQ",
> +        .reason = "User queues not supported in production",
> +        .platform_data = &all_platforms,
> +    },
> +};
> +```
> +
> +---
> +
> +## Summary
> +
> +| Method | Use Case | Persistent | Rebuild Required |
> +|--------|----------|------------|------------------|
> +| **Built-in** | Production rules | Yes | Yes |
> +| **Config file** | Team/CI exclusions | Yes | No |
> +| **Environment** | Quick testing | No | No |
> +
> +**Recommendation**: Use **config file** for managing test exclusions at scale.
> +
> +---
> +
> +## See Also
> +
> +- `lib/igt_platform_filter.h` - API documentation
> +- `lib/igt_platform_filter.c` - Framework implementation
> +- `lib/amdgpu/amd_platform.c` - AMD backend reference
> diff --git a/mkdocs.yml b/mkdocs.yml
> index 0abb76704..1819b7b6c 100644
> --- a/mkdocs.yml
> +++ b/mkdocs.yml
> @@ -29,6 +29,7 @@ nav:
>      - How to document tests: 'test_documentation.md'
>      - How to categorize tests: 'test_categories.md'
>      - How to blocklist tests: 'blocklists.md'
> +    - How to filter tests per platform: 'platform_filtering.md'
>      - How to get code coverage: 'code_coverage.md'
>      - How to port new IGT driver: 'new_driver.md'
>      - How to plan a new test: 'test_plan.md'
> -- 
> 2.43.0
> 
