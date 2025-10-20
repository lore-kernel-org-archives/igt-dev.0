Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9C0CCD199
	for <igt-dev@archiver.kernel.org>; Mon, 20 Oct 2025 06:44:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A6710E266;
	Mon, 20 Oct 2025 06:44:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a2378AJU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 240DF10E263
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Oct 2025 06:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760942668; x=1792478668;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pCXWdPJY7hzd5hI3uVSIbrI0ceyHlrDFdSs34uCJz14=;
 b=a2378AJUpGYBA9Oemp5g1BY5NS0a8npDOdm1p3F2Z7gc6RUeerDqnZ7B
 ngxVGY8PPiq/DuB5H+EN8vPyv/cQEgkEd+n1jtp6ZqlSobN7li+5zKCdv
 HUo8gwXVMNSkPmxdl0smuJcI6gazpzwOJjH8RVxCAOqHlxpUa41u7vTL+
 bk+YK2dCqiLSzCHSqPs3Qb93RVBa/StnqnsocnPtkxKdOLtzScAExs8oX
 WhfWiKKLwLndp2pCsYtX2z09y+BoXgZSrBq9ZMBeCMZ0fKpe/3/vxu4Kc
 UgHusliATPIsgIC/6sYJmUSoMtsg6hi4VY8xTgfVPOH8XAP8f5h48jP18 Q==;
X-CSE-ConnectionGUID: xgsd2fCqTfiqyangIKd8FA==
X-CSE-MsgGUID: EcHk2tH/S6enPj7HPQj7YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66889780"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66889780"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2025 23:44:27 -0700
X-CSE-ConnectionGUID: 7ldPQRfxQPOrejBv1sQSbw==
X-CSE-MsgGUID: ATWnXeh8T5C5GpBfzue1PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="187520904"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.220])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2025 23:44:25 -0700
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t v11 4/6] docs: Initialize MkDocs documentation structure
Date: Mon, 20 Oct 2025 08:40:48 +0200
Message-ID: <20251020064053.1050025-5-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020064053.1050025-1-pawel.sikora@intel.com>
References: <20251020064053.1050025-1-pawel.sikora@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

This commit establishes the groundwork for a comprehensive
documentation site, enhancing accessibility and organization.

 * Move detailed documentation into the docs directory,
   splitting content across multiple markdown files.
 * Set up the structure for automatic site generation using
   MkDocs,facilitating easier navigation and maintenance.
 * Moved some content from README.md to docs/overview.md,
   docs/building.md

Co-developed-by: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
---
 docs/api.md                          |  29 ++
 docs/blocklists.md                   | 354 ++++++++++++++++++++++++
 docs/building.md                     |  27 ++
 docs/{chamelium.txt => chamelium.md} |   2 +-
 docs/ci_infrastructure.md            | 390 +++++++++++++++++++++++++++
 docs/code_coverage.md                |  68 +++--
 docs/cross-building.md               | 260 +++++++++++++-----
 docs/download.md                     |  25 ++
 docs/faq.md                          |  92 +++++++
 docs/how_to_build_docs.md            |  54 ++++
 docs/issues.md                       |  31 +++
 docs/new_driver.md                   | 231 ++++++++++++++++
 docs/overview.md                     | 159 +++++++++++
 docs/patchwork.md                    |  18 ++
 docs/running_tests.md                | 130 +++++++++
 docs/test_categories.md              | 266 ++++++++++++++++++
 docs/test_documentation.md           |  66 +++--
 docs/test_plan.md                    | 216 +++++++++++++++
 18 files changed, 2277 insertions(+), 141 deletions(-)
 create mode 100644 docs/api.md
 create mode 100644 docs/blocklists.md
 create mode 100644 docs/building.md
 rename docs/{chamelium.txt => chamelium.md} (99%)
 create mode 100644 docs/ci_infrastructure.md
 create mode 100644 docs/download.md
 create mode 100644 docs/faq.md
 create mode 100644 docs/how_to_build_docs.md
 create mode 100644 docs/issues.md
 create mode 100644 docs/new_driver.md
 create mode 100644 docs/overview.md
 create mode 100644 docs/patchwork.md
 create mode 100644 docs/running_tests.md
 create mode 100644 docs/test_categories.md
 create mode 100644 docs/test_plan.md

diff --git a/docs/api.md b/docs/api.md
new file mode 100644
index 000000000..fdc70cd4b
--- /dev/null
+++ b/docs/api.md
@@ -0,0 +1,29 @@
+# IGT GPU Tools API
+
+**IGT GPU Tools** provides a set of C libraries and helper macros for writing and
+running test cases targeting the Linux graphics stack.
+
+Generated documentation is available at:
+[API Reference](https://drm.pages.freedesktop.org/igt-gpu-tools/api_reference/index.html)
+
+## Purpose
+
+The API is designed to:
+
+ - Simplify interaction with kernel graphics drivers (e.g., via DRM ioctls)
+ - Provide reusable infrastructure for writing test cases
+ - Offer abstractions for managing displays, buffers, events, and execution contexts
+
+## Key Components
+
+ - `igt_assert`, `igt_skip`, `igt_require`: Macros for managing test flow
+ - `igt_fixture`, `igt_subtest`: Infrastructure for setup/teardown and subtest isolation
+
+Helper modules for:
+  - Buffer objects (e.g., `intel_buf`)
+  - Display configuration (e.g., `kmstest`, `igt_display`)
+  - Memory mapping, fences, command streams, and performance counters
+
+##  Examples
+
+For code examples, browse the `tests/` and `lib/` directories.
diff --git a/docs/blocklists.md b/docs/blocklists.md
new file mode 100644
index 000000000..265a1e240
--- /dev/null
+++ b/docs/blocklists.md
@@ -0,0 +1,354 @@
+# :material-block-helper: Blocklists
+
+## :material-information-outline: Overview
+
+Blocklists in IGT GPU Tools are essential mechanisms for
+excluding problematic, unstable, or inappropriate tests from automated CI runs. They help
+maintain CI stability by filtering out tests that are known to cause issues, while still
+preserving the tests in the codebase for manual execution or future fixing.
+
+!!! info "Purpose"
+    Blocklists allow CI systems to run comprehensive test suites while automatically
+    excluding tests that:
+
+    - Are known to be flaky or unstable
+    - Require specific hardware configurations not available in CI
+    - Are under development and not ready for production testing
+    - Cause system hangs or crashes
+    - Coverage for older generations—not in active use but required to maintain
+      historical continuity.
+
+## :material-file-outline: Blocklist Files
+
+### Driver-Specific Blocklists
+
+IGT maintains separate blocklists for different GPU drivers and testing scenarios:
+
+| File | Purpose | Usage |
+|||--|
+| **`blocklist.txt`** | i915 driver test exclusions | Full IGT runs on i915 hardware |
+| **`xe.blocklist.txt`** | Xe driver test exclusions | Full IGT runs on Xe hardware |
+| **Test lists** | Positive inclusion lists | BAT and fast-feedback testing |
+
+### File Locations
+
+```
+tests/intel-ci/
+├── blocklist.txt              # i915 driver blocklist
+├── xe.blocklist.txt          # Xe driver blocklist
+├── fast-feedback.testlist    # i915 BAT test list
+└── xe-fast-feedback.testlist # Xe BAT test list
+```
+
+## :material-format-text: Blocklist Format and Syntax
+
+### Basic Pattern Matching
+
+Blocklists use pattern matching to exclude tests flexibly:
+
+```bash
+# Exact test match
+igt@i915_module_load@load
+
+# Wildcard patterns
+igt@gem_caching@.*              # All gem_caching subtests
+igt@kms_prime@.*               # All kms_prime subtests
+igt@prime_vgem@coherency-.*    # All coherency subtests
+
+# Binary-level exclusions
+igt@gem_workarounds@.*         # Entire gem_workarounds test binary
+```
+
+### Pattern Types
+
+| Pattern | Description | Example |
+||-||
+| **Exact Match** | Specific test/subtest | `igt@core_auth@getclient-simple` |
+| **Wildcard (.*)**| All subtests in a test | `igt@gem_exec_nop@.*` |
+| **Partial Match** | Tests matching prefix | `igt@kms_.*@basic` |
+| **Regex Support** | Advanced pattern matching | `igt@.*@.*-suspend` |
+
+### Comment Syntax
+
+```bash
+# Full line comments start with #
+igt@problematic_test@.*
+
+# Inline comments after patterns
+igt@flaky_test@.* # Known to be unstable
+
+############################################
+# Section separators for organization
+############################################
+```
+
+## :material-cog: Driver-Specific Blocklists
+
+### i915 Driver Blocklist (`blocklist.txt`)
+
+**Purpose:** Exclude tests from Full IGT runs on i915 hardware
+
+**Common Exclusion Categories:**
+
+```bash
+# Hardware-specific exclusions
+igt@gem_caching@.*              # Requires specific cache coherency
+igt@gem_userptr_blits@.*        # Userptr functionality issues
+
+# Display-specific exclusions
+igt@kms_cursor_legacy@.*        # Legacy cursor compatibility
+igt@kms_scaling_modes@.*        # Scaling mode limitations
+
+# Performance/stability exclusions
+igt@gem_exec_whisper@.*         # Resource-intensive stress tests
+igt@gem_concurrent_blit@.*      # Concurrent operation stability
+```
+
+### Xe Driver Blocklist (`xe.blocklist.txt`)
+
+**Purpose:** Exclude tests from Full IGT runs on Xe hardware
+
+**Xe-Specific Exclusions:**
+
+```bash
+# KMS tests requiring i915-specific features
+igt@kms_prime@.*               # Prime buffer sharing limitations
+igt@kms_cursor_legacy@.*       # Legacy API compatibility
+
+# Memory management differences
+igt@gem_caching@.*             # Different memory architecture
+igt@gem_mmap_gtt@.*           # GTT mapping not applicable
+
+# SR-IOV test management
+igt@sriov_basic@.*            # Controlled SR-IOV test execution
+```
+
+## :material-lightning-bolt: Dynamic Blocklist Management
+
+### Adding Tests to Blocklists
+
+**For systematic exclusions:**
+```bash
+# Include issue tracking and reasoning
+# In blocklist file:
+############################################
+# Blocked due to hardware incompatibility
+# See: https://gitlab.freedesktop.org/drm/intel/-/issues/XXXX
+############################################
+igt@hardware_specific_test@.*
+```
+
+!!! warning "Use this for exceptional use-cases only"
+
+**For urgent CI stability:**
+```bash
+# Add to appropriate blocklist file
+echo "igt@problematic_test@.*" >> tests/intel-ci/blocklist.txt
+
+# Commit with clear justification
+git commit -m "intel-ci: Blocklist problematic_test due to [issue]"
+```
+
+
+### Removing Tests from Blocklists
+
+**When issues are resolved:**
+
+1. **Verify fix** - Ensure the underlying issue is resolved
+2. **Test locally** - Run the test on affected hardware
+3. **Remove from blocklist** - Delete the line from appropriate file
+4. **Monitor CI** - Watch for regressions after removal
+
+## :material-timeline-check: Blocklist Categories
+
+### By Test Stability
+
+| Category | Description | Examples |
+|-|-|-|
+| **Flaky Tests** | Intermittent failures | Tests with timing dependencies |
+| **Hardware-Specific** | Requires unavailable hardware | Specific GPU generations only |
+| **Environment-Dependent** | Needs special configuration | Display connection requirements |
+| **Under Development** | Work-in-progress features | New functionality testing |
+
+### By Impact Level
+
+| Level | Description | Action |
+|-|-|--|
+| **Critical** | Causes system hangs/crashes | Immediate blocklisting |
+| **High** | Consistent CI failures | Blocklist until fixed |
+| **Medium** | Intermittent issues | Monitor and consider blocklisting |
+| **Low** | Minor failures | Keep in CI with issue tracking |
+
+## :material-chart-timeline: CI Integration
+
+### How Blocklists Are Applied
+
+**During CI Execution:**
+
+1. **Test Discovery** - CI enumerates all available IGT tests
+2. **Blocklist Filtering** - Excludes tests matching blocklist patterns
+3. **Test Execution** - Runs remaining tests in filtered set
+4. **Result Reporting** - Reports only on tests that were attempted
+
+**CI Run Types:**
+
+| Run Type | Blocklist Used | Test Scope |
+|-|-||
+| **BAT (Basic Acceptance)** | Test lists (positive) | Curated fast tests |
+| **Full IGT** | Blocklists (negative) | All tests minus blocked |
+| **Idle Runs** | Blocklists (negative) | Extended coverage |
+
+### Integration with Intel GFX CI
+
+**Automatic Application:**
+
+- **i915 Full IGT:** All IGT tests filtered by `blocklist.txt`
+- **Xe Full IGT:** All IGT tests filtered by `xe.blocklist.txt`
+- **Cross-platform:** Same blocklist patterns across different hardware
+
+**Result Filtering:**
+
+- Blocked tests don't appear in CI results
+- No false positives from known problematic tests
+- Focus on real regressions and new issues
+
+## :material-bug: Issue Tracking Integration
+
+### Linking Blocklists to Issues
+
+**Best Practices:**
+```bash
+# Include issue references in blocklist comments
+############################################
+# Blocked due to regression in foo feature
+# See: https://gitlab.freedesktop.org/drm/intel/-/issues/1234
+# Remove when fixed
+############################################
+igt@affected_test@.*
+```
+
+**Issue Lifecycle Management:**
+
+1. **Issue Reported** - Problem identified in CI or manual testing
+2. **Temporary Blocklist** - Add to blocklist to stabilize CI
+3. **Issue Investigation** - Development team investigates root cause
+4. **Fix Implementation** - Code changes to resolve issue
+5. **Blocklist Removal** - Remove from blocklist after verification
+6. **Monitoring** - Watch for regressions
+
+### Automated Issue Tracking
+
+**CI Bug Log Integration:**
+
+- Links blocklist entries to GitLab issues
+- Tracks issue lifecycle and resolution
+- Automatic notifications when issues are resolved
+- Historical data on blocklist effectiveness
+
+## :material-wrench: Maintenance and Best Practices
+
+### Regular Maintenance Tasks
+
+**Periodic Review:**
+```bash
+# Review blocklist contents quarterly
+# Check for resolved issues
+# Remove outdated entries
+# Update issue references
+```
+
+**Validation Procedures:**
+
+1. **Test Removal Candidates** - Try removing old entries
+2. **Hardware Updates** - Review when new hardware is added
+3. **Driver Updates** - Check blocklists after major driver changes
+4. **CI Infrastructure Changes** - Verify patterns after CI updates
+
+### Best Practices for Contributors
+
+**Adding Blocklist Entries:**
+
+- ✅ Include clear justification and issue references
+- ✅ Use minimal patterns (specific as possible)
+- ✅ Add comments explaining the exclusion reason
+- ✅ Link to tracking issues when available
+
+**Pattern Guidelines:**
+
+- Use `.*` for all subtests in a test binary
+- Use specific subtest names when only some subtests fail
+- Avoid overly broad patterns that exclude working tests
+- Test patterns locally before committing
+
+**Documentation Requirements:**
+```bash
+# Good blocklist entry:
+############################################
+# gem_caching tests require coherent memory
+# Not supported on DG2 hardware - see issue #1234
+############################################
+igt@gem_caching@.*
+
+# Poor blocklist entry:
+igt@gem_caching@.*  # broken
+```
+
+## :material-file-code: Example Blocklist Configurations
+
+### Complete i915 Blocklist Example
+
+```bash
+############################################
+# i915 Driver Test Blocklist
+# Last Updated: 2024-XX-XX
+############################################
+
+# Memory management tests requiring specific hardware
+igt@gem_caching@.*              # Cache coherency not universal
+igt@gem_userptr_blits@.*        # Userptr stability issues
+
+# Display tests with hardware dependencies
+igt@kms_cursor_legacy@.*        # Legacy cursor compatibility
+igt@kms_scaling_modes@.*        # Hardware scaling limitations
+
+# Resource-intensive stress tests
+igt@gem_exec_whisper@.*         # CPU/memory intensive
+igt@gem_concurrent_blit@.*      # Concurrent stability
+
+############################################
+# Module loading tests - BAT only
+# See: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6227
+############################################
+igt@i915_module_load@load       # Requires unloaded i915 module
+```
+
+### Complete Xe Blocklist Example
+
+```bash
+############################################
+# Xe Driver Test Blocklist
+# Last Updated: 2025-XX-XX
+############################################
+
+# KMS tests requiring i915-specific features
+igt@kms_prime@.*               # Prime implementation differences
+igt@kms_cursor_legacy@.*       # Legacy API not supported
+
+# Memory architecture differences
+igt@gem_caching@.*             # Different memory subsystem
+igt@gem_mmap_gtt@.*           # GTT not applicable to Xe
+
+############################################
+# SR-IOV test management
+# Only specific subtests should run in CI
+############################################
+igt@sriov_basic@enable-vfs-autoprobe-off.*
+igt@sriov_basic@enable-vfs-bind-unbind-each.*
+igt@sriov_basic@bind-unbind-vf.*
+
+############################################
+# Platform-specific exclusions
+############################################
+igt@xe_wedged@.*              # Controlled error injection
+```
+
diff --git a/docs/building.md b/docs/building.md
new file mode 100644
index 000000000..12b1b4f44
--- /dev/null
+++ b/docs/building.md
@@ -0,0 +1,27 @@
+## :material-hammer-wrench: Tests
+
+To get started quickly and build tests:
+
+```bash
+meson setup build && ninja -C build
+```
+
+!!! info "Meson requires that builds be done in a separate directory from the source tree!"
+
+To run self-tests from `lib/tests` and `tests/`:
+
+```bash
+ninja -C build test
+```
+## :material-book: Documentation
+
+To build the documentation:
+
+```bash
+ninja -C build igt-gpu-tools-doc
+```
+
+!!! info "Missing documentation for a new test?"
+    Some drivers (e.g., Xe, i915) and KMS tests require proper documentation in a
+    **test plan**. The build will fail if documentation is missing! See
+    [`test_documentation.md`](test_documentation.md) for details.
diff --git a/docs/chamelium.txt b/docs/chamelium.md
similarity index 99%
rename from docs/chamelium.txt
rename to docs/chamelium.md
index 64f851c28..240c8e2c8 100644
--- a/docs/chamelium.txt
+++ b/docs/chamelium.md
@@ -41,7 +41,7 @@ While the FPGA is used for logic control, the CPU runs daemons that allow the
 board to be controlled over the network via a XMLRPC interface.
 
 [Current limitation] Cv3 hardware uses an ITE chip which allows only 1 port to
-be plugged in a time. This limitation will be fixed in the upcoming iteration. 
+be plugged in a time. This limitation will be fixed in the upcoming iteration.
 
 Chamelium V2 Documentation
 --------------------------
diff --git a/docs/ci_infrastructure.md b/docs/ci_infrastructure.md
new file mode 100644
index 000000000..29f232562
--- /dev/null
+++ b/docs/ci_infrastructure.md
@@ -0,0 +1,390 @@
+# :material-cloud-cog: CI Infrastructure
+
+## :material-information-outline: Overview
+
+IGT GPU Tools employs a comprehensive Continuous Integration (CI) infrastructure to ensure
+code quality, prevent regressions, and maintain driver stability. The CI system operates
+across multiple platforms and architectures, providing automated testing for both pre-merge
+and post-merge scenarios.
+
+The infrastructure consists of a main component:
+
+- **GitLab CI** (Freedesktop.org) - Build validation and cross-platform testing
+
+There are CI infrastructures which focus on specific HW platforms:
+
+- **Intel GFX CI** - Comprehensive hardware testing on real Intel GPU systems
+
+## 
+## :material-gitlab: GitLab CI (Freedesktop.org)
+
+### Infrastructure Overview
+
+IGT uses GitLab CI hosted at `gitlab.freedesktop.org` for:
+
+- **Build validation** across multiple architectures
+- **Container-based testing** for reproducible environments
+- **Cross-platform compatibility** checks
+- **Documentation generation** and validation
+
+### Container Infrastructure
+
+IGT leverages containerized builds for consistency and reliability:
+
+```bash
+# Pre-built containers available at:
+registry.freedesktop.org/drm/igt-gpu-tools/igt:master
+
+# Run IGT in container:
+podman run --rm --privileged registry.freedesktop.org/drm/igt-gpu-tools/igt:master
+```
+
+### Build Matrix
+
+| Platform | Architecture | Purpose |
+|-|-||
+| **Debian** | x86_64 | Primary build and test platform |
+| **Fedora** | x86_64 | Alternative distro validation |
+| **Debian Minimal** | x86_64 | Minimal dependency testing |
+| **Multi-arch** | arm64, mips | Cross-platform compatibility |
+
+## :material-cpu-64-bit: Intel GFX CI
+
+### Mission-Critical Testing
+
+Intel GFX CI provides the backbone for Intel GPU driver validation:
+
+!!! quote "Intel GFX CI Mission"
+    "Test each patch that goes into i915, Intel Xe, or IGT GPU Tools **before** it lands
+    in the repository, comparing results with post-merge baselines to catch regressions
+    early."
+
+### Hardware Infrastructure
+
+**Diverse GPU Coverage:**
+
+- Multiple Intel GPU generations (Gen7 through latest)
+- Various form factors (desktop, mobile, server)
+- Different display configurations (HDMI, DP, eDP, VGA)
+- Specialized hardware for specific features
+
+**Sample Hardware Types:**
+
+- `bat-apl-1` - Apollo Lake platform
+- `bat-jsl-3` - Jasper Lake system
+- `bat-rpls-1` - Raptor Lake S
+- `bat-mtlp-8` - Meteor Lake P
+- `shard-tglb1` - Tiger Lake (sharded testing)
+
+### Test Execution Tiers
+
+#### 1. Basic Acceptance Tests (BAT)
+**Purpose:** Fast feedback and gating mechanism
+
+**Duration:** ~1 hour
+
+**Test List:** `tests/intel-ci/fast-feedback.testlist`
+
+```bash
+# Example BAT tests:
+igt@core_auth@getclient-simple
+igt@i915_module_load@load
+igt@kms_busy@basic@modeset
+igt@debugfs_test@read_all_entries
+```
+
+**Key Characteristics:**
+
+- Ensures testing configuration is working
+- Gates all further testing (sharded runs)
+- Fast-feedback tests for quick validation
+- Must pass before proceeding to full testing
+
+#### 2. Full IGT (Sharded Runs)
+**Purpose:** Comprehensive validation
+**Duration:** ~6 hours
+**Scope:** All IGT tests (filtered by blocklists)
+
+**Driver-Specific Execution:**
+
+- **i915:** All IGT tests filtered by `blocklist.txt`
+- **Xe:** All IGT tests filtered by `xe.blocklist.txt`
+
+**Sharding Strategy:**
+Tests are distributed across multiple machines for parallel execution:
+
+- `shard-tglb1`, `shard-tglb2` - Tiger Lake systems
+- `shard-dg2` - DG2/Arc GPU systems
+- Multiple concurrent executions for faster results
+
+#### 3. Specialized Runs
+
+| Run Type | Purpose | Characteristics |
+|-||--|
+| **Idle Runs** | Extra coverage during quiet periods | Run when CI is idle |
+| **KASAN Runs** | Memory safety validation | Kernel Address Sanitizer enabled |
+| **100 Re-runs** | Flaky test detection | Same test 100 times for statistics |
+| **Resume Runs** | Suspend/resume validation | Single machine, resume capability |
+| **drmtip Runs** | Extended coverage | Full IGT on BAT hardware |
+
+## :material-email-fast: Pre-Merge Testing Workflow
+
+### Patch Submission Process
+
+ 1. **Mailing List Submission**
+   ```bash
+   # IGT patches should include i-g-t tag:
+   git config --local format.subjectPrefix "PATCH i-g-t"
+   # Example subject:
+   [PATCH i-g-t] tests/kms_atomic: Add new subtest for cursor planes
+   ```
+ 2. **Automatic CI Triggering**
+    - CI automatically detects patches on mailing lists
+    - Both BAT and Full IGT are scheduled
+    - Results sent as email replies to original patch
+
+ 3. **Result Timeline**
+    - BAT Results: ~1 hour
+    - Full IGT Results: ~6 hours
+    - All results emailed even on success
+
+### Forcing Custom Test Configurations
+
+For specific testing needs, developers can override CI behavior:
+
+```bash
+# Force specific tests in BAT (mark with HAX):
+[PATCH i-g-t HAX] tests/intel-ci: Add kms_example to fast-feedback
+
+# Change kernel configuration:
+[PATCH HAX] kernel: Enable CONFIG_EXAMPLE for testing
+
+# Force IGT test list changes:
+# Modify tests/intel-ci/fast-feedback.testlist in a HAX patch
+```
+
+### Trybot System
+
+!!! info "Works for i915 only"
+**Purpose:** Test changes before formal review
+
+**Usage:**
+
+- Submit to trybot mailing list
+- Get CI feedback without formal patch review
+- Useful for experimental changes
+
+## :material-bug: Results and Bug Tracking
+
+### Result Categories
+
+| Result | Description | Action Required |
+|--|-|--|
+| **PASS** | Test completed successfully | None |
+| **SKIP** | Test skipped (missing hardware/feature) | Generally acceptable |
+| **FAIL** | Test failed | Investigation required |
+| **Dmesg-Warn** | Kernel warnings detected | Review warnings |
+| **Incomplete** | Test didn't complete | Infrastructure issue |
+
+### Bug Tracking Integration
+
+**Automated Bug Filtering:**
+
+- Known issues are filtered out using pattern matching
+- New failures automatically trigger investigation
+- Results tied to specific dmesg patterns and hardware
+
+**Bug Trackers:**
+
+- **freedesktop GitLab** - Kernel, Xe, and IGT issues
+- **Hardware-specific filters** - Machine type patterns
+- **Pattern-based matching** - dmesg output analysis
+
+## :material-git: Repository Integration
+
+### CI-Tagged Repositories
+
+**IGT CI Tags:** `https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags.git`
+
+- Contains CI-specific tags and metadata
+- Used for tracking tested versions
+- Integration with kernel development
+
+**Kernel Integration:** `git://anongit.freedesktop.org/gfx-ci/linux`
+
+- Kernel tree with CI integration
+- Automated testing of kernel + IGT combinations
+- Firmware coordination
+
+### Firmware Management
+
+**Firmware Repositories:**
+
+- **intel-staging** - Upcoming firmware blobs ready for merge
+- **intel-for-ci** - CI-specific firmware with intel-ci directory
+- **Automatic deployment** - Firmware updated on test machines
+
+**Firmware Deployment Process:**
+
+1. New pushes detected on firmware branches
+2. Extract i915 and xe directories from intel-staging
+3. Extract intel-ci from intel-for-ci
+4. Deploy all three directories to test machines
+5. Integrate with base OS firmware tree (Ubuntu)
+
+## :material-docker: Container Registry
+
+### Available Images
+
+**Primary IGT Container:**
+```bash
+registry.freedesktop.org/drm/igt-gpu-tools/igt:master
+```
+
+**Build Images:**
+
+- Debian-based development environment
+- Fedora-based testing environment
+- Multi-architecture build support
+- Documentation generation environment
+
+### Usage Examples
+
+```bash
+# Run tests in container:
+podman run --rm --privileged \
+  registry.freedesktop.org/drm/igt-gpu-tools/igt:master \
+  /usr/libexec/igt-gpu-tools/core_auth
+
+# Build IGT in container:
+podman run --rm -v $(pwd):/workspace \
+  registry.freedesktop.org/drm/igt-gpu-tools/igt:master \
+  bash -c "cd /workspace && meson build && ninja -C build"
+```
+
+## :material-chart-timeline-variant: CI Configuration Files
+
+### GitLab CI Configuration
+
+**Primary Configuration:** `.gitlab-ci.yml`
+
+- Multi-stage pipeline definition
+- Container build and test stages
+- Cross-architecture build matrix
+- Documentation generation jobs
+
+**Key Configuration Sections:**
+```yaml
+# Build stage example:
+build:
+  stage: build
+  script:
+    - meson build
+    - ninja -C build
+  artifacts:
+    paths:
+      - build/
+
+# Test stage example:
+test:
+  stage: test
+  script:
+    - cd build && meson test
+```
+
+### Intel CI Configuration
+
+**Test Lists:**
+
+- `tests/intel-ci/fast-feedback.testlist` - BAT test definitions
+- `tests/intel-ci/xe-fast-feedback.testlist` - Xe-specific BAT tests
+- `tests/intel-ci/blocklist.txt` - i915 test exclusions
+- `tests/intel-ci/xe.blocklist.txt` - Xe test exclusions
+
+**Hardware Configuration:**
+
+- Platform-specific test routing
+- Display configuration requirements
+- GPU generation compatibility matrices
+
+## :material-monitor-dashboard: Monitoring and Maintenance
+
+### Performance Metrics
+
+**CI Health Indicators:**
+
+- Queue depth and processing time
+- Success/failure rates by platform
+- Hardware utilization statistics
+- Container build performance
+
+**Continuous Monitoring:**
+
+- Real-time queue status
+- Historical trend analysis
+- Capacity planning metrics
+- Infrastructure reliability tracking
+
+### Maintenance Operations
+
+**Regular Tasks:**
+
+- Container image updates
+- Hardware firmware updates
+- Test list maintenance
+- Bug filter updates
+
+**Scaling Operations:**
+
+- Hardware addition/retirement
+- Load balancing adjustments
+- Performance optimization
+- Capacity expansion
+
+## :material-account-group: Development Integration
+
+### Developer Workflow
+
+1. **Local Development**
+   ```bash
+   # Test locally with containers:
+   podman run --rm --privileged \
+     -v $(pwd):/workspace \
+     registry.freedesktop.org/drm/igt-gpu-tools/igt:master
+   ```
+
+2. **Patch Submission**:
+
+    - Email patches to mailing lists
+    - CI automatically triggered
+    - Results delivered via email
+
+3. **Result Analysis**
+
+    - Review BAT results first (~1 hour)
+    - Full results available later (~6 hours)
+    - Investigate any failures or warnings
+
+### Best Practices
+
+**For Contributors:**
+
+- Test patches locally before submission
+- Use appropriate subject line tags ([PATCH i-g-t])
+- Mark experimental patches with HAX
+- Monitor CI results and respond to failures
+
+**For Maintainers:**
+
+- Review CI results before merging
+- Update test lists as needed
+- Maintain bug filters
+- Coordinate with hardware teams
+
+## :material-link-variant: Resources and References
+
+### CI Infrastructure Links
+
+- **[Freedesktop Gitlab CI Pipelines](https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/pipelines)**
+- **[Container Registry](https://gitlab.freedesktop.org/drm/igt-gpu-tools/container_registry)**
+- **[CI Tags Repository](https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags)**
diff --git a/docs/code_coverage.md b/docs/code_coverage.md
index 8c4857412..fdfab5a7f 100644
--- a/docs/code_coverage.md
+++ b/docs/code_coverage.md
@@ -16,24 +16,22 @@ is available at the Linux Kernel since 2009.
 
 Enabling GCOV at the Linux Kernel requires two steps:
 
-1. Enable GCOV_KERNEL:
+ 1. Enable GCOV_KERNEL:
 
    ```
    ./scripts/config -e DEBUG_FS -e GCOV_KERNEL
    ```
+ 2. Enable per-driver or per-makefile GCOV support. In order to enable support
+    for all DRM drivers:
 
+    ```
+    for i in $(find drivers/gpu/drm/ -name Makefile); do
+        sed '1 a GCOV_PROFILE := y' -i $i
+    done
+    ```
 
-2. Enable per-driver or per-makefile GCOV support. In order to enable support
-   for all DRM drivers:
-
-   ```
-   for i in $(find drivers/gpu/drm/ -name Makefile); do
-       sed '1 a GCOV_PROFILE := y' -i $i
-   done
-   ```
-
-When gcov is enabled for a given driver or directory, GCC will generate
-some special object files, like:
+    When gcov is enabled for a given driver or directory, GCC will generate
+    some special object files, like:
 
 ```
 ...
@@ -96,16 +94,16 @@ and store on some file.
 Enabling code coverage data collect can be done either per test or as
 a hole for an entire test list, by using those command line options:
 
-- `--collect-code-cov`
+`--collect-code-cov`
 
   Enables gcov-based collect of code coverage for tests.
 
-- `--coverage-per-test`
+`--coverage-per-test`
 
   Stores code coverage results per each test. This option implies
   `--collect-code-cov`.
 
-For those options to work, it is mandatory to specifiy what script will
+For those options to work, it is mandatory to specify what script will
 be used to collect the data with `--collect-script` _file_name_.
 
 ### calling `./scripts/run-tests.sh` script
@@ -113,15 +111,15 @@ be used to collect the data with `--collect-script` _file_name_.
 The `run-tests.sh` script can used instead as a frontend for igt_runner.
 It has the following options:
 
-- `-c <capture_script>`
+`-c <capture_script>`
 
   Capture gcov code coverage using the _capture_script_
 
-- `-P`
+`-P`
 
   Store code coverage results per each test.
 
-- `-k` _kernel_dir_
+`-k` _kernel_dir_
 
   Linux Kernel source code directory used to generate code coverage builds.
   This is passed through the capture script via the `IGT_KERNEL_TREE`
@@ -155,7 +153,7 @@ under the IGT's `scripts/` source directory:
   Generates a gzipped tarbal with the code coverage counters in
   binary format. Such kind of output should then be parsed at
   the same machine where the Kernel as built, as its content is not
-  ony dependent on the Kernel source, but also on the Kernel output
+  only dependent on the Kernel source, but also on the Kernel output
   objects.
 
 For each script, the igt_runner passes just one parameter: the results
@@ -199,7 +197,7 @@ The `code_cov_parse_info` script has some logic on it that allows
 printing the called functions stored inside the `*.info` file. It can also
 optionally apply the following filters. Its main options are:
 
-- `--stat` or `--statistics`
+`--stat` or `--statistics`
 
   Prints code coverage statistics.
 
@@ -207,7 +205,7 @@ optionally apply the following filters. Its main options are:
 
   The statistics report is affected by the applied filters.
 
-- `--print-coverage`, `--print` or `-p`
+`--print-coverage`, `--print` or `-p`
 
 
   Prints the functions that were executed in runtime and how many times
@@ -215,29 +213,29 @@ optionally apply the following filters. Its main options are:
 
   The function coverage report is affected by the applied filters.
 
-- `--print-unused` or `-u`
+`--print-unused` or `-u`
 
   Prints the functions that were never reached.
 
   The function coverage report is affected by the applied filters.
 
-- `--show-lines` or `--show_lines`
+`--show-lines` or `--show_lines`
 
   When printing per-function code coverage data, always output the source
   file and the line number where the function is defined.
 
-- `--output` *output file* or `-o` *output file*
+`--output` *output file* or `-o` *output file*
 
   Produces an output file merging all input files.
 
   The generated output file is affected by the applied filters.
 
-- `--show-files` or `--show_files`
+`--show-files` or `--show_files`
 
    Shows the list of files that were useed to produce the code coverage
    results.
 
-- It also has a set of parameters that filters the code coverage results:
+  It also has a set of parameters that filters the code coverage results:
   `--only-drm`, `--only-i915`, `--func-filters`, `--source-filters`,
   `--ignore-unused`.
   When used, all coverage displayed reports, and the stored output file
@@ -323,39 +321,39 @@ used when generating the HTML reports.
 
 It requires the following arguments:
 
-- `--read`  _file or dir_ (or `-r` _file or dir_)
+`--read`  _file or dir_ (or `-r` _file or dir_)
 
   File or directory where the code coverage capture file(s) is(are) located.
 
-- `--kernel-source` _dir_ (or `-k` _dir_)
+`--kernel-source` _dir_ (or `-k` _dir_)
 
   Kernel source directory.
 
-- `--kernel-object` _dir_ (or `-O` _dir_)
+`--kernel-object` _dir_ (or `-O` _dir_)
 
   Kernel object directory. Only needed when Kernel was built with `make O=dir`.
 
-- `--output-dir` _dir_ (or `-o` _dir)
+`--output-dir` _dir_ (or `-o` _dir)
 
   Directory where the html output will be stored. By default, the script
   won't let re-use an already existing directory.
 
-- `--info`
+`--info`
 
   The files specified by `--read` parameter are at lcov's `*.info` format.
 
-- `--tar`
+`--tar`
 
   The files specified by `--read` are gzipped tarballs containing all
   `*.gcno` files and all `*.gcda` softlinks from the `/sys/kernel/debug/gcov/`
   directory at the test machine, created by `code_cov_gather_on_test` script.
 
-- `--force-override`
+`--force-override`
 
   Allow using a non-empty directory for `--output-dir`.
 
-- It also accepts `--print`, `--only-drm`, `--only-i915` and `--ignore-unused`
-  options from `code_cov_parse_info`.
+It also accepts `--print`, `--only-drm`, `--only-i915` and `--ignore-unused`
+options from `code_cov_parse_info`.
 
 `--info` and `--tar` are mutually exclusive and at least one of them should
 be specified.
diff --git a/docs/cross-building.md b/docs/cross-building.md
index 2c0e3caf3..b14182878 100644
--- a/docs/cross-building.md
+++ b/docs/cross-building.md
@@ -1,97 +1,185 @@
-Producing an IGT for another architecture
-=========================================
+# :material-hammer-screwdriver: Cross-Building IGT
 
-Cross-build toolchain
----------------------
+## :material-information-outline: Overview
 
-Producing cross-builds require installing a toolchain with support
-to the target architecture, or a toolchain built for the target,
-plus an emulator (like qemu). In the case of IGT, the minimal toolchain
-is GCC and binutils. For instance, on Fedora, to cross-build with arm64
-as the target architecture, those packages are needed:
+Producing an IGT build for another architecture requires setting up a cross-compilation
+environment with the appropriate toolchain, system root directory, and Meson
+configuration. This guide covers the essential steps for cross-building IGT GPU Tools
+for different target architectures.
 
-	binutils-aarch64-linux-gnu
-	gcc-aarch64-linux-gnu
+## :material-wrench-cog: Cross-Build Toolchain
 
-There are also tarballs with cross-compiler chains that can be used
-instead, like:
+### Required Components
 
-	https://toolchains.bootlin.com/
+Cross-building requires installing a toolchain with support for the target architecture,
+or a toolchain built specifically for the target, plus an emulator (like QEMU). For IGT,
+the minimal toolchain consists of GCC and binutils.
 
-System root directory (sysroot)
--------------------------------
+**Example: ARM64 on Fedora**
 
-Besides a toolchain, a system root directory containing the libraries
-used by IGT pre-compiled to the target architecture is required.
+For cross-building with ARM64 as the target architecture, install these packages:
 
-This can be obtained by either cross-building a distribution using
-Yocto, buildroot or similar, or by copying the system root from
-an existing installation for the desired architecture, containing
-the IGT needed build time and runtime library dependencies.
+```bash
+# Fedora packages for ARM64 cross-compilation
+binutils-aarch64-linux-gnu
+gcc-aarch64-linux-gnu
+```
 
-Please notice that cross-build toolchains may require some
-dependent object files and libraries used by it to also be copied
-to the system root directory. For instance, in the case of Fedora,
-the files are located  under /usr/aarch64-linux-gnu/sys-root/
-(for aarch64 architecture) shall also be stored at the sysroot
-directory used by Meson, as otherwise the preparation step will fail.
+### Alternative Toolchain Sources
 
-Meson preparation
------------------
+Pre-built cross-compiler toolchain tarballs are also available:
 
-Meson requires an extra configuration file to be used for
-non-native builds. This is passed via --cross-file parameter to it.
+- **Bootlin Toolchains**: https://toolchains.bootlin.com/
+- Various distribution-specific cross-compilation packages
+- Custom-built toolchains for specific targets
 
-Such file contains details about the target OS/architecture, about
-the host (native) OS/architecture and declares the location of
-sysroot:
+## :material-folder-cog: System Root Directory (sysroot)
 
-- the [host_machine] section defines the system and architecture from
-  the native OS;
-  At the example below, the native OS is Linux x86_64 architecture.
-- the [target_machine] section contains details about the target
-  OS/architecture.
-  At the example below, the target is aarch64 (arm 64 bits architecture).
-- the [constants] section is optional, but it helps to use the sysroot
-  path directory on multiple keys at the [properties] section;
-- the [properties] section contains arguments to be used by the
-  the binaries;
-- the [binaries] section contains the binaries to be used during the
-  build. It can either be a native or a target toolchain.
-  If a target toolchan is used, an exe_wrapper key pointing to an arch
-  emulalor like qemu-arm is needed.
+### Purpose
 
-The sysroot directory is where IGT dependent libraries and header
-files, compiled for a given architecture, are stored. At the example
-below, the sysroot is /aarch64-sysroot.
+Besides a toolchain, a system root directory containing the libraries used by IGT
+pre-compiled to the target architecture is required.
 
-Preparing for cross compilation is done by calling meson with the
-cross-compilation config file name, plus a build directory:
+### Obtaining a Sysroot
 
-	meson --cross-file arm64_cross.txt build
+The sysroot can be obtained through several methods:
 
-The actual compilation can then be done using ninja:
+1. **Cross-building a distribution** using Yocto, buildroot, or similar tools
+2. **Copying the system root** from an existing installation for the desired architecture
+3. **Building dependencies** manually for the target architecture
 
-	ninja -C build
+The sysroot must contain all IGT build-time and runtime library dependencies compiled
+for the target architecture.
 
-Please notice that some parts of the IGT build are disabled during
-cross-compilation, like testlist file creation and documentation,
-as such steps depend on running the generated code at the native
-machine.
+### Important Considerations
 
-The IGT root directory has already 3 examples that uses qemu to
-run a target-OS machine toolchain:
+!!! warning "Toolchain Dependencies"
+    Cross-build toolchains may require some dependent object files and libraries to
+    also be copied to the system root directory. For instance, with Fedora, files
+    located under `/usr/aarch64-linux-gnu/sys-root/` (for aarch64 architecture) should
+    also be stored in the sysroot directory used by Meson, otherwise the preparation
+    step will fail.
 
-	meson-cross-arm64.txt
-	meson-cross-armhf.txt
-	meson-cross-mips.txt
+## :material-cog-outline: Meson Configuration
 
-The example below contains cross-build instructions when using
-a native cross-build toolchain.
+### Cross-File Requirement
 
-Example: arm64_cross.txt with a native cross-builder toolchain
---------------------------------------------------------------
+Meson requires an extra configuration file for non-native builds, passed via the
+`--cross-file` parameter. This file contains details about:
 
+- Target OS/architecture specifications
+- Host (native) OS/architecture information
+- Sysroot location and compiler configurations
+- Binary locations and execution wrappers
+
+### Configuration Sections
+
+#### `[host_machine]` Section
+Defines the system and architecture of the native OS.
+
+**Example:** Native OS is Linux x86_64 architecture
+```ini
+[host_machine]
+system = 'linux'
+cpu_family = 'x86_64'
+cpu = 'x86_64'
+endian = 'little'
+```
+
+#### `[target_machine]` Section
+Contains details about the target OS/architecture.
+
+**Example:** Target is aarch64 (ARM 64-bit architecture)
+```ini
+[target_machine]
+system = 'linux'
+cpu_family = 'aarch64'
+cpu = 'aarch64'
+endian = 'little'
+```
+
+#### `[constants]` Section (Optional)
+Helps define reusable paths and arguments for use in other sections.
+
+```ini
+[constants]
+sysroot = '/aarch64-sysroot'
+common_args = ['--sysroot=' + sysroot]
+```
+
+#### `[properties]` Section
+Contains arguments to be used by the build binaries.
+
+```ini
+[properties]
+sys_root = sysroot
+c_args = common_args
+c_link_args = common_args
+pkg_config_libdir = [
+    sysroot + '/usr/lib64/pkgconfig',
+    sysroot + '/usr/share/pkgconfig',
+    sysroot + '/usr/local/lib/pkgconfig'
+]
+```
+
+#### `[binaries]` Section
+Contains the binaries to be used during the build.
+
+- Can use either native or target toolchain
+- If using target toolchain, requires `exe_wrapper` pointing to an architecture
+  emulator like `qemu-arm`
+
+```ini
+[binaries]
+c = '/usr/bin/aarch64-linux-gnu-gcc'
+ar = '/usr/bin/aarch64-linux-gnu-gcc-ar'
+ld = '/usr/bin/aarch64-linux-gnu-ld'
+strip = '/usr/bin/aarch64-linux-gnu-strip'
+pkgconfig = 'pkg-config'
+```
+
+## :material-play-circle-outline: Build Process
+
+### Preparation
+
+Prepare for cross-compilation by calling Meson with the cross-compilation config file
+and build directory:
+
+```bash
+meson --cross-file arm64_cross.txt build
+```
+
+### Compilation
+
+Execute the actual compilation using Ninja:
+
+```bash
+ninja -C build
+```
+
+### Build Limitations
+
+!!! info "Cross-Compilation Limitations"
+    Some parts of the IGT build are disabled during cross-compilation, including:
+
+    - Testlist file creation
+    - Documentation generation
+    - Other steps that depend on running generated code on the native machine
+
+## :material-file-code: Pre-configured Examples
+
+The IGT root directory contains pre-configured cross-compilation examples using QEMU
+to run target-OS machine toolchains:
+
+- `meson-cross-arm64.txt` - ARM64 architecture
+- `meson-cross-armhf.txt` - ARM hard-float architecture
+- `meson-cross-mips.txt` - MIPS architecture
+
+## :material-script-text: Complete Example Configuration
+
+### Native Cross-Builder Toolchain: `arm64_cross.txt`
+
+```ini
 [constants]
 sysroot = '/aarch64-sysroot'
 common_args = ['--sysroot=' + sysroot]
@@ -100,7 +188,11 @@ common_args = ['--sysroot=' + sysroot]
 sys_root = sysroot
 c_args = common_args
 c_link_args = common_args
-pkg_config_libdir = [sysroot + '/usr/lib64/pkgconfig', sysroot +'/usr/share/pkgconfig', sysroot +'/usr/local/lib/pkgconfig']
+pkg_config_libdir = [
+    sysroot + '/usr/lib64/pkgconfig',
+    sysroot + '/usr/share/pkgconfig',
+    sysroot + '/usr/local/lib/pkgconfig'
+]
 
 [binaries]
 c = '/usr/bin/aarch64-linux-gnu-gcc'
@@ -120,3 +212,29 @@ system = 'linux'
 cpu_family = 'aarch64'
 cpu = 'aarch64'
 endian = 'little'
+```
+
+## :material-lightbulb-outline: Best Practices
+
+### Sysroot Management
+
+- Ensure all required dependencies are present in the sysroot
+- Verify library paths match the target architecture
+- Include both runtime and development packages
+
+### Toolchain Verification
+
+- Test the cross-compilation toolchain independently before building IGT
+- Verify that the toolchain can produce working binaries for the target
+- Check that all required tools (gcc, binutils, etc.) are available
+
+### Build Validation
+
+- Use emulation (QEMU) to test cross-compiled binaries when possible
+- Validate that the cross-compiled IGT works on actual target hardware
+- Compare functionality with native builds to ensure completeness
+
+## :material-link: References
+
+- [Meson Cross-compilation Documentation](https://mesonbuild.com/Cross-compilation.html)
+- [Bootlin Toolchains](https://toolchains.bootlin.com/)
diff --git a/docs/download.md b/docs/download.md
new file mode 100644
index 000000000..02af2290e
--- /dev/null
+++ b/docs/download.md
@@ -0,0 +1,25 @@
+# Download
+
+Below you can find an archive with the corresponding release version.
+
+This archive contains source code, so it means you need to build and install it in order to use it.
+
+Every package has a PGP signature ('.sig') file, where you can check against the hash.
+
+## Latest
+
+Full release message: [lore.kernel.org](https://lore.kernel.org/igt-dev/5834caf0533d4acbb68ffc8b76762606.kamil.konieczny@linux.intel.com/)
+
+**File**: [igt-gpu-tools-2.2.tar.xz](https://xorg.freedesktop.org/archive/individual/app/igt-gpu-tools-2.2.tar.xz)
+
+**PGP**: [igt-gpu-tools-2.1.tar.xz.sig](https://xorg.freedesktop.org/archive/individual/app/igt-gpu-tools-2.2.tar.xz.sig)
+
+**MD5**: db699c641409097041af91accbc35a91
+
+**SHA1**: 698bc96cea6d88a711bf43a4cf82b0b7dbab4a23
+
+**SHA256**: 88178558b352a5e8a287954cb2eef05d775aedfacf43b88251509ea014b6182d
+
+## Archive
+
+You can find older versions [HERE](https://xorg.freedesktop.org/archive/individual/app/)
diff --git a/docs/faq.md b/docs/faq.md
new file mode 100644
index 000000000..48e754c56
--- /dev/null
+++ b/docs/faq.md
@@ -0,0 +1,92 @@
+# Frequently Asked Questions (FAQ)
+
+This FAQ covers common questions about using, building, and contributing to
+**IGT GPU Tools**.
+
+### What is IGT GPU Tools?
+
+IGT GPU Tools is a collection of low-level tests and utilities used to validate and
+debug Linux DRM (Direct Rendering Manager) graphics drivers. It focuses primarily on
+Intel GPUs but supports other platforms in varying degrees.
+
+### How do I build IGT?
+
+You can build IGT using [Meson](https://mesonbuild.com/) and Ninja. Here's a quick
+example:
+
+```sh
+meson setup build && ninja -C build
+```
+
+Make sure required dependencies are installed. You can refer to:
+
+- `Dockerfile.build-fedora`
+- `Dockerfile.build-debian` or `Dockerfile.build-debian-minimal`
+
+They contain up-to-date package lists for common distros.
+
+### How do I run tests?
+
+Tests are located in the `tests/` directory and can be run directly. For example:
+
+```sh
+sudo ./build/tests/core_auth
+```
+
+Use `--list-subtests` to list available subtests and `--run-subtest` to run a specific
+one:
+
+```sh
+sudo ./build/tests/core_auth --list-subtests
+sudo ./build/tests/core_auth --run-subtest basic-auth
+```
+
+You can also run tests using the `scripts/run-tests.sh` wrapper, which supports
+filtering and batch execution.
+
+### Do I need to run as root?
+
+Most tests require root privileges and a system without a running graphical session
+(X or Wayland). Some tools may work without root, especially those that only inspect
+or decode state.
+
+### What platforms are supported?
+
+IGT primarily targets Intel GPUs (Gen9+), but partial support exists for:
+
+- AMD (amdgpu)
+- NVIDIA (nouveau)
+- Virtual GPUs (e.g., virtio-gpu in QEMU/KVM/AVD)
+
+Hardware coverage may vary by test.
+
+### What's the difference between `tests/`, `tools/`, and `benchmarks/`?
+
+- `tests/` – Automated functional tests, designed for CI and driver validation
+- `tools/` – Debugging and inspection utilities (e.g., checking GPU state)
+- `benchmarks/` – Performance-oriented microbenchmarks (e.g., memory or rendering speed)
+
+### Where do I report security issues?
+
+Do **not** report vulnerabilities in public issues or mailing lists.
+Instead, contact a maintainer directly. See the `MAINTAINERS` file for contact
+information.
+
+### How do I submit a patch?
+
+Use `git send-email` to send your patch to:
+
+```
+igt-dev@lists.freedesktop.org
+```
+
+Prefix your subject with `PATCH i-g-t`. You can track submissions at:
+
+- [Patchwork](https://patchwork.freedesktop.org/project/igt/series/)
+- [Lore Archive](https://lore.kernel.org/igt-dev/)
+
+More details are in [CONTRIBUTING.md](CONTRIBUTING.md).
+
+If your question isn't answered here, feel free to ask on the
+[igt-dev mailing list](mailto:igt-dev@lists.freedesktop.org) or open an issue on GitLab.
+
diff --git a/docs/how_to_build_docs.md b/docs/how_to_build_docs.md
new file mode 100644
index 000000000..86285f6b3
--- /dev/null
+++ b/docs/how_to_build_docs.md
@@ -0,0 +1,54 @@
+# How to Build the IGT GPU Tools Documentation
+
+This guide provides instructions on how to build the documentation
+for the IGT GPU Tools project using MkDocs.
+This effort aims to enhance the organization and presentation of our documentation,
+making it easier for users and contributors to navigate and understand the project.
+
+## Prerequisites
+
+Before you begin, ensure you have Python installed on your system.
+It is strongly recommended to use a virtual environment for the local installation
+of required packages. 
+Please refer to your OS/distro instructions for setting up a virtual environment.
+
+## Setting Up the Virtual Environment
+
+1. **Create a virtual environment:**
+
+   ```bash
+   $ python3 -m venv venv
+   ```
+
+2. **Activate the virtual environment:**
+
+   ```bash
+   $ source ./venv/bin/activate
+   ```
+
+## Installing Requirements
+
+Install the necessary packages required to build the documentation:
+
+```bash
+$ pip3 install -r ./docs/requirements-docs.txt
+```
+
+## Building the Documentation
+
+To build the documentation, execute the following command:
+
+```bash
+$ mkdocs build
+```
+
+## Hosting Locally
+
+To host the documentation locally and review it in your browser, start the MkDocs server:
+
+```bash
+$ mkdocs serve
+```
+
+Then, open your favorite browser and navigate to: 
+[http://127.0.0.1:8000/](http://127.0.0.1:8000/)
diff --git a/docs/issues.md b/docs/issues.md
new file mode 100644
index 000000000..5eeeb9ced
--- /dev/null
+++ b/docs/issues.md
@@ -0,0 +1,31 @@
+# Reporting Issues
+
+!!! info "**IGT GPU Tools** is a testing framework for Linux graphics drivers."
+    We welcome bug reports, notes on regressions, and information about test failures –
+    your input helps us improve reliability and coverage across platforms.
+
+### How to Report an Issue
+
+You can report issues in either of the following ways:
+
+ - **Open a GitLab issue** in the **[IGT project repository](https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues)**.
+   Please provide clear details, including logs, test steps, and system information.
+
+ - **Send an email** to the development mailing list:
+   **[igt-dev@lists.freedesktop.org](mailto:igt-dev@lists.freedesktop.org)**
+
+   Email reports are recommended if your issue is part of an ongoing patch discussion
+   or relates closely to a test or CI behavior.
+
+When reporting, be sure to include:
+
+ - Steps to reproduce the issue
+ - Platform, hardware, and kernel version
+ - Logs or output from relevant test runs
+ - Any CI job links (if applicable)
+
+You can view current discussions and threads via:
+
+ - [GitLab Issues](https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues)
+ - [Patchwork](https://patchwork.freedesktop.org/project/igt/series/)
+ - [Lore Archive](https://lore.kernel.org/igt-dev/)
diff --git a/docs/new_driver.md b/docs/new_driver.md
new file mode 100644
index 000000000..f6c934a96
--- /dev/null
+++ b/docs/new_driver.md
@@ -0,0 +1,231 @@
+# :material-plus-circle: Add support for new driver in IGT
+
+Here is a detailed procedure to support a new driver in IGT, using Intel's "XE" driver as
+an example.
+
+## Detect the Driver
+
+Add support in IGT lib to detect the driver, so that IGT will recognize the driver. The
+device name should match with the DRIVER_NAME configured in the Linux Kernel Module.
+
+Example: 
+[drm/xe/kernel/-/blob/drm-xe-next/drivers/gpu/drm/xe/xe_drv.h#L11](https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-next/drivers/gpu/drm/xe/xe_drv.h#L11)
+
+### KMD Changes:
+
+```c
+#define DRIVER_NAME     "xe"
+
+#define DRIVER_DESC     "Intel Xe Graphics"
+
+#define DRIVER_DATE     "20201103"
+```
+
+### IGT Changes:
+
+```diff
+diff --git a/lib/drmtest.c b/lib/drmtest.c
+
+index 8e2d1ac50b..0ceab10389 100644
+
+--- a/lib/drmtest.c
+
++++ b/lib/drmtest.c
+
+@@ -189,6 +189,7 @@  static const struct module {
+
+ 	{ DRIVER_V3D, "v3d" },
+
+ 	{ DRIVER_VC4, "vc4" },
+
+ 	{ DRIVER_VGEM, "vgem" },
+
++	{ DRIVER_XE, "xe" },
+
+ 	{}
+
+ };
+
+
+
+@@ -547,6 +548,8 @@  static const char *chipset_to_str(int chipset)
+
+ 		return "panfrost";
+
+ 	case DRIVER_MSM:
+
+ 		return "msm";
+
++	case DRIVER_XE:
+
++		return "xe";
+
+ 	case DRIVER_ANY:
+
+ 		return "any";
+
+ 	default:
+
+diff --git a/lib/drmtest.h b/lib/drmtest.h
+
+index b5debd44b3..448ac03b49 100644
+
+--- a/lib/drmtest.h
+
++++ b/lib/drmtest.h
+
+@@ -51,6 +51,7 @@
+
+ #define DRIVER_V3D	(1 << 4)
+
+ #define DRIVER_PANFROST	(1 << 5)
+
+ #define DRIVER_MSM	(1 << 6)
+
++#define DRIVER_XE	(1 << 7)
+```
+
+
+With the above changes, the simple IGT snippet `int fd = drm_open_driver_master(DRIVER_XE);`
+can open the "XE" driver.
+
+## :material-code-braces: UAPI Changes to Support Driver-Specific IOCTLs
+
+Import UAPI headers: https://gitlab.freedesktop.org/drm/igt-gpu-tools#includedrm-uapi
+
+## :material-wrench: Develop IGT Helpers
+
+Now we can develop driver-specific IGT helpers based on DRM_IOCTL_VERSION.
+
+Example:
+
+```diff
++++ b/lib/drmtest.c
+
+@@ -139,6 +139,16 @@  bool is_vc4_device(int fd)
+
+ 	return __is_device(fd, "vc4");
+
+ }
+
+
+
++bool is_xe_device(int fd)
+
++{
+
++	return __is_device(fd, "xe");
+
++}
+
+
+
++++ b/lib/intel_chipset.c
+
+@@ -125,22 +163,18 @@  intel_get_pci_device(void)
+
+ uint32_t
+
+ intel_get_drm_devid(int fd)
+
+ {
+
+
+
++	if (is_xe_device(fd))
+
++		return __xe_get_drm_devid(fd);
+
++	else
+
++		return __i915_get_drm_devid(fd);
+
+}
+```
+
+## :material-monitor: Porting All Display IGTs to Support XE Driver
+
+The task of porting all display-specific IGTs to support the XE driver is significant and
+critical. This process involves several steps.
+
+### :material-eye: Understanding the Current IGTs
+
+The existing codebase must be thoroughly understood. This involves reviewing the code for
+all display IGTs, understanding their functionality, and identifying any potential issues
+that may arise when porting to the XE driver.
+
+!!! info "Challenges"
+    As there are several hundreds of display subtests, it's always a challenge to
+    read/review the codebase.
+
+### :material-chip: Understanding the XE Driver
+
+The XE driver's specifications and capabilities must be understood. This will allow for
+the identification of any features that the IGTs can take advantage of, as well as any
+limitations that must be worked around.
+
+!!! info "Challenges"
+    Identify all i915 display-specific ioctls and find the corresponding ioctl in XE.
+
+    Different approach of using modparams and missing debugfs.
+
+### :material-map: Mapping the IGTs to the XE Driver
+
+Once we understand both the IGTs and the XE driver, we can start mapping the functionality
+of the IGTs to the XE driver. This involves identifying which tests can be supported by
+the XE driver, which ones need to be modified, and which ones cannot be supported.
+
+### :material-library: Modifying IGT Libraries
+
+Start modifying the IGT libraries to support the XE driver and try to make the APIs as
+unified (to support both i915 and XE). To achieve this, collaborate and contribute with
+the core-mm and other development teams.
+
+!!! info "Challenges"
+    Make the core team understand the display use cases to write unified APIs
+    (Ex: VM bind, GPU HANG, and BUSY).
+
+    Integrate XE-specific APIs with existing IGT display libraries (Ex: BO creation).
+
+**Notable contributions by Bhanu:**
+
+- Add IGT helpers to check for the XE driver
+- Add an interface to query dev_id
+- Get and cache the XE_config at driver opening level and uncache at driver closing level
+- Support to create a BO for display framebuffers
+- Add rendercopy support for display tests
+- Add tiling support for XE
+- API support to get the pipe index
+
+### :material-code-tags: Modifying the IGTs
+
+Based on the mapping, we can start modifying the IGTs to support the XE driver. This
+could involve changing the code, adding new lib helpers, adding new tests, or removing
+unsupported tests. This process involves the following steps:
+
+- Modify test initialization code to open the XE driver instead of Intel where applicable
+- Update any Intel-specific code/defines in the tests to use equivalent XE APIs
+- Ensure all relevant XE driver features are properly exercised by the tests. Add any
+  missing test coverage
+- Update documentation like man pages, comments, etc. to cover XE driver usage
+
+!!! info "Challenges"
+    Some KMS tests are complex and very difficult to update.
+
+### :material-test-tube: Testing the Ported IGTs
+
+After the IGTs have been modified, they need to be tested to ensure they work correctly
+with the XE driver. This involves running the tests, analyzing the results, and fixing
+any issues that are identified.
+
+## :material-file-document: Test-Plan Documentation
+
+With the addition of the Xe driver, a new way to document tests was added. It is based on
+special comment-like annotation inside the C code. We need to update each and every IGT
+with this new style of documentation.
+
+!!! info "Challenges"
+    - Time-consuming process, as we have several hundreds of subtests
+    - Add missing documentation in existing legacy way
+    - Identify different features and align with several internal tools like
+      feature-mapping, Grafana, etc.
diff --git a/docs/overview.md b/docs/overview.md
new file mode 100644
index 000000000..aedfdc9b0
--- /dev/null
+++ b/docs/overview.md
@@ -0,0 +1,159 @@
+# :material-clipboard-check-outline: General
+
+
+
+!!! info "IGT GPU Tools"
+
+    **IGT GPU Tools** is a collection of low-level tools and tests for developing and testing
+    DRM(Direct Rendering Manager) drivers.
+    IGT focuses on targeted, low-level testing that's easier to build,
+    debug, and trace to the kernel.
+
+:material-book-outline: Latest API documentation:
+[API Reference](https://drm.pages.freedesktop.org/igt-gpu-tools/api_reference/index.html)
+
+## :material-cog-outline: Requirements
+
+- Fedora users: see `Dockerfile.build-fedora` for package dependencies.
+- Debian-based systems: check `Dockerfile.build-debian` or `Dockerfile.build-debian-minimal`.
+
+If IGT is available in your distro's package manager:
+
+```bash
+dnf builddep igt-gpu-tools
+```
+
+:material-alert-circle-outline: **Note:** Package dependencies may be outdated compared to
+`master` branch requirements.
+
+## :material-folder-outline: Directory Overview
+
+This section explains the purpose of each major directory in the IGT GPU Tools project.
+Understanding the structure will help new contributors and users navigate the codebase
+more effectively.
+
+### :material-file-tree-outline: `tests/`
+
+Contains test cases and subtests – the core of IGT validation.
+
+- Each test is a standalone executable built from a `.c` file.
+- Tests follow naming conventions and are managed by `igt_runner`.
+- Subtests are organized using `igt_subtest` and described using `igt_describe()`.
+- Certain tests may be specific to `i915` or `Xe` drivers and follow respective
+  documentation requirements.
+
+### :material-puzzle-outline: `lib/`
+
+Shared helper libraries used across tests.
+
+- Provides wrappers for kernel interactions, memory management, and display configuration.
+- Contains useful macros like `igt_assert`, `igt_require`, and `igt_info`.
+- Some helpers are hardware-specific (e.g., Intel platform tools).
+
+### :material-tools: `tools/`
+
+Standalone utilities that use IGT libraries but aren't part of the test suite.
+
+- Often used for debugging or GPU state inspection.
+- May require root access depending on functionality.
+
+### :material-database-outline: `data/`
+
+Contains test data files and reference materials used by IGT tests.
+
+- **Reference images and frames**: Used for visual comparison tests and CRC validation
+- **Test configuration files**: Standard test data and expected outputs for validation
+- **Binary test data**: GPU-specific test patterns, EDID data, and hardware configurations
+- **Frame dump data**: Reference frames for display testing and Chamelium validation
+
+**Key features:**
+
+- Accessed via `igt_fopen_data(filename)` helper function
+- Automatic fallback search: installation directory → build directory → current directory
+- Used for frame comparison tests, display validation, and hardware-specific test data
+- Essential for tests that require known-good reference data or specific input patterns
+
+**Common use cases:**
+
+```c
+// Open a reference frame for comparison
+FILE *ref_file = igt_fopen_data("reference_frame_1080p.raw");
+
+// Load test pattern data
+FILE *pattern = igt_fopen_data("test_patterns/gradient.bin");
+```
+
+### :material-book-open-outline: `docs/`
+
+Contains developer documentation, test plan tools, and API references.
+
+- Some content is generated via `gtk-doc`.
+- Tests for `i915` and `Xe` drivers are subject to test plan validation.
+  Documentation must be kept in sync – see `docs/test_documentation.md`.
+
+To regenerate:
+
+```bash
+ninja -C build igt-gpu-tools-doc
+```
+
+### :material-play-circle-outline: `runner/`
+
+The `igt_runner` test harness manages batch execution and filtering.
+
+- Supports result summaries, filtering by subtest, and dry-run modes.
+- Used heavily in CI and automation.
+
+### :material-file-document-outline: `include/`
+
+Public headers and UAPI headers:
+
+- Includes types and APIs exposed by IGT.
+- Subdirectories such as `drm-uapi/` and `linux-uapi/` are synced from upstream kernel
+  headers (e.g., `drm-next`).
+
+### :material-chart-box-outline: `benchmarks/`
+
+Microbenchmarks for evaluating GPU performance.
+
+- Focus on throughput, memory speed, and latency.
+- Useful for low-level tuning and regression checks.
+
+### :material-script-text-outline: `scripts/`
+
+Helper scripts for CI, patch formatting, and test orchestration.
+
+- Not always cross-platform.
+- Includes the `run-tests.sh` script to simplify test execution.
+
+## :material-console-line: Build Files
+
+- `meson.build`, `configure.ac`, `Makefile.am`: Build system support.
+- Autotools and Meson support may coexist but Meson is preferred for modern development.
+
+## :material-lan: Special Testing Scenarios
+
+- **Multi-GPU testing:** Useful for scenarios involving iGPU + dGPU switching.
+- **Display testing:** EDID dongles or connected screens required.
+- **Power management:** Laptops or devices with sensors give better PM insights.
+- **Virtualization:** Run in KVM/QEMU to emulate certain configurations.
+
+## :material-wrench-clock: Optional Tools
+
+- **EDID dongles** – simulate display hotplug events.
+- **Serial/UART debug cables** – capture early boot logs.
+- **Power meters (RAPL, Watts Up Pro)** – validate runtime PM and energy use.
+- **CI hardware** – watchdog-capable systems with remote boot and serial access.
+- **Chamelium** - automates external display testing across VGA, HDMI, and DisplayPort
+  (DP). More: [External Tools -> Chamelium](chamelium.md) or [The Chromium Projects - Chamelium](https://www.chromium.org/chromium-os/developer-library/guides/hardware-schematics/chamelium/)
+
+## :material-cloud-outline: CI and Development Tips
+
+- Ensure **firmware can be updated** easily on your test hardware.
+- Be prepared to **compile and switch kernels** frequently.
+- Run tests on a **known-good setup** to rule out config or version issues.
+
+And refer to [ci_infrastructure.md](ci_infrastructure.md), [platforms.md](platforms.md) and to the platform-specific driver documentation for more details.
+
+:material-email-outline: Questions? Reach out via
+[igt-dev@lists.freedesktop.org](mailto:igt-dev@lists.freedesktop.org)
diff --git a/docs/patchwork.md b/docs/patchwork.md
new file mode 100644
index 000000000..248ea1592
--- /dev/null
+++ b/docs/patchwork.md
@@ -0,0 +1,18 @@
+# Patchwork for IGT GPU Tools
+
+**Patchwork** is used to track patches submitted to the IGT GPU Tools mailing list.
+
+- View submitted patches: [IGT Patchwork](https://patchwork.freedesktop.org/project/igt/series/)
+- Patch status archive: [Lore: igt-dev](https://lore.kernel.org/igt-dev/)
+
+##  What it is
+
+Patchwork collects patches sent to: :material-email-outline:
+[igt-dev@lists.freedesktop.org](mailto:igt-dev@lists.freedesktop.org)
+
+It helps maintainers and contributors:
+
+ - Track patch series
+ - See review status
+ - Check CI results
+ - Organize accepted, rejected, or pending changes
diff --git a/docs/running_tests.md b/docs/running_tests.md
new file mode 100644
index 000000000..b0f22ca64
--- /dev/null
+++ b/docs/running_tests.md
@@ -0,0 +1,130 @@
+## :material-play-circle-outline: General
+
+Tests are located in the `tests/` directory.
+
+- List available subtests:
+
+```bash
+build/tests/core_auth --list-subtests
+```
+
+- Run a specific subtest:
+
+```bash
+build/tests/core_auth --run-subtest getclient-simple
+```
+
+- If `--run-subtest` is not used, all subtests will be executed.
+
+!!! info "Most tests must be run as **root** and with **no X or Wayland compositor** running."
+
+Example output:
+
+```
+# build/tests/core_auth
+IGT-Version: 1.24 (x86_64) (Linux: 5.3.0 x86_64)
+Starting subtest: getclient-simple
+Subtest getclient-simple: SUCCESS (0.001s)
+...
+
+```
+
+### Dynamic Subtests
+
+IGT supports dynamic subtests using `igt_subtest_with_dynamic` for cases where the full
+set of possible subtests is too large or impossible to know beforehand. Dynamic subtests
+are useful for operations like testing each KMS pipe separately.
+
+**Key characteristics of dynamic subtests:**
+
+- Used when reporting several aspects separately is desired
+- Useful when the full possible set is too big or impossible to know beforehand
+- Each dynamic subtest runs within a parent subtest block
+- Results are aggregated: SKIP if no dynamic subtests run, PASS if all pass, FAIL if
+  any fail
+
+**Example use case:** Testing KMS pipes where the number of available pipes varies by
+hardware:
+```c
+igt_subtest_with_dynamic("pipe-tests") {
+    igt_require(is_kms_available(fd));
+    for_each_pipe(display, pipe) {
+        igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+            test_pipe_operation(pipe);
+        }
+    }
+}
+```
+
+**Running dynamic subtests:**
+
+- List dynamic subtests: `--list-subtests` shows both parent and dynamic subtests
+- Run specific dynamic subtest: `--run-subtest parent-subtest@dynamic-name`
+- Run all dynamic subtests under a parent: `--run-subtest parent-subtest`
+
+**Dynamic subtest naming:**
+
+- Parent subtest name followed by `@` and dynamic name
+- Example: `pipe-tests@pipe-A`, `pipe-tests@pipe-B`
+- Dynamic names are generated at runtime based on available hardware
+
+**Example listing dynamic subtests:**
+```bash
+# List all subtests including dynamic ones
+build/tests/kms_atomic --list-subtests
+atomic-commits
+atomic-commits@pipe-A-HDMI-1
+atomic-commits@pipe-B-DP-1
+atomic-commits@pipe-C-eDP-1
+```
+
+**Example running dynamic subtests:**
+```bash
+# Run all dynamic subtests under atomic-commits
+build/tests/kms_atomic --run-subtest atomic-commits
+
+# Run specific dynamic subtest
+build/tests/kms_atomic --run-subtest atomic-commits@pipe-A-HDMI-1
+```
+
+### Using `run-tests.sh`
+
+You can also use the `scripts/run-tests.sh` wrapper script:
+
+```bash
+meson -Drunner=enabled build && ninja -C build
+```
+
+Run tests with filters:
+
+```bash
+scripts/run-tests.sh -t <regex>       # Include tests matching regex
+scripts/run-tests.sh -x <regex>       # Exclude tests matching regex
+```
+
+- List all tests and subtests:
+
+```bash
+scripts/run-tests.sh -l
+```
+
+- Get help on options:
+
+```bash
+scripts/run-tests.sh -h
+```
+
+Test results are saved as a JSON file.
+
+For the tests API reference please look at: [API Reference Documentation](api_reference/index.html)
+
+
+## :material-docker: Running via Container
+
+You can run IGT in a container using `podman` or `docker`:
+
+```bash
+podman run --rm --privileged registry.freedesktop.org/drm/igt-gpu-tools/igt:master
+```
+
+This avoids installing build dependencies locally.
diff --git a/docs/test_categories.md b/docs/test_categories.md
new file mode 100644
index 000000000..4bba9e521
--- /dev/null
+++ b/docs/test_categories.md
@@ -0,0 +1,266 @@
+# IGT GPU Tools Test Documentation Categories
+
+This document explains the different types of test categorization and documentation markup
+used in the IGT GPU Tools project for organizing and documenting test cases.
+
+## Overview
+
+IGT GPU Tools uses a structured documentation system with various categories and
+subcategories to organize tests. The project has been evolving its documentation markup
+to make it more precise and maintainable, with recent changes removing some deprecated
+fields like 'Functionality' and 'Test category' that were dependent on developer
+interpretation.
+
+!!! warning "Deprecated fields"
+    Some tests (e.g. for Core sub-category) have still deprecated fields like
+    'Functionality', 'Test category'. There is a work in progress to remove them.
+
+## Primary Documentation Fields
+
+### 1. **Sub-category**
+The Sub-category field is the primary organizational unit for grouping related tests.
+This field has been actively maintained and expanded with new subcategories being
+introduced regularly.
+
+Recent Sub-categories include:
+
+- **Core** : Basic DRM functionality tests
+- **Synchronization** : Tests for synchronization mechanisms
+- **CMD submission** : Command submission related tests
+- **Blitter** : Blitter engine tests (unified for i915 and Xe)
+- **GPGPU** : General Purpose GPU compute tests
+- **Compute** : Computational workload tests
+- **Performance** : Performance measurement tests
+- **Memory management** : Memory allocation and management tests
+- **Power management** : Power-related functionality tests
+- **Display** : Display/KMS related tests
+- **Firmware** : Firmware interaction tests
+- **Media** : Media processing tests
+- **Render copy** : Render copy operation tests
+- **Debugging** : Debug and diagnostic tests
+- **Workarounds** : Hardware workaround tests
+- **Obsolete** : Deprecated or legacy tests
+- **SysMan** : System management tests
+- **FDinfo** : File descriptor information tests
+- **Flat-ccs** : Flat CCS (Color Compression Surface) tests
+
+### 2. **Mega-feature**
+While not explicitly detailed in the current documentation, mega-feature appears to be a
+higher-level categorization that groups multiple related sub-categories under broader
+functional areas.
+
+### 3. **Test Description**
+IGT uses the `igt_describe()` macro to attach descriptions to subtests. The description
+should complement the test/subtest name and provide context on what is being tested. It
+should explain the idea of the test without mentioning implementation details.
+
+**Best practices for descriptions:**
+
+- Focus on the userspace perspective
+- Capture the reason for the test's existence
+- Be brief and avoid implementation details
+- Don't translate code into English
+
+**Good examples:**
+
+- "make sure that legacy cursor updates do not stall atomic commits"
+- "check that atomic updates of many planes are indeed atomic and take effect
+  immediately after the commit"
+- "make sure that the meta-data exposed by the kernel to the userspace is correct and
+  matches the used EDID"
+
+## Deprecated Fields
+
+### **Test Category**
+The 'Test category' field has been removed from KMS tests documentation as it was not
+being used consistently.
+
+### **Functionality**
+The 'Functionality' field has also been removed as it "solely depends upon developer's
+interpretation" and was making documentation maintenance difficult.
+
+### **Run Type**
+The 'Run type' documentation field has been removed from recent versions.
+
+## Documentation Structure
+
+### **Test Organization**
+Tests can be organized using `igt_subtest_group` blocks, where the resulting subtest
+documentation is a concatenation of its own description and all parenting subtest group
+descriptions, starting from the outermost one.
+
+### **Dynamic Subtests**
+IGT supports dynamic subtests using `igt_subtest_with_dynamic` for cases where the full
+set of possible subtests is too large or impossible to know beforehand. Dynamic subtests
+are useful for operations like testing each KMS pipe separately.
+
+## Driver-Specific Categories
+
+### **Intel Tests**
+The Intel-specific tests have their own subcategory system:
+
+- **i915** driver tests
+- **Xe** driver tests (newer Intel GPU architecture)
+- **DRM** general Direct Rendering Manager tests
+
+### **Vendor-Specific**
+
+- **AMDGPU** - AMD GPU specific tests
+- **intel-nouveau** - Intel and Nouveau driver interaction tests
+
+## Documentation Generation
+
+The test documentation is automatically generated and can be accessed via the `--describe`
+command line switch. The IGT framework also supports `--list-subtests` to enumerate
+available subtests and `--run-subtest` to execute specific subtests.
+
+## Recent Changes and Evolution
+
+The IGT project has been actively refining its documentation system, with version 1.29
+introducing numerous subcategory additions and removing inconsistent documentation fields.
+The focus has shifted toward more precise categorization that is easier to maintain.
+
+### Key Improvements:
+
+- Unification of Blitter subcategory across i915 and Xe
+- Standardization of Sub-category/Functionality naming
+- Removal of developer-dependent interpretation fields
+- Addition of missing documentation fields for SRIOV and Display tests
+
+## Usage
+
+When adding new tests to IGT, developers should:
+
+1. Use appropriate Sub-category classification
+2. Provide clear, implementation-agnostic descriptions using `igt_describe()`
+3. Follow the established naming conventions
+4. Avoid using deprecated documentation fields
+5. Ensure consistency with existing test organization
+
+This categorization system helps maintain the large IGT test suite by providing clear
+organization and making it easier for developers to find relevant tests and understand
+their purpose.
+
+## Documentation Fields and Values Table
+
+Based on the current IGT GPU Tools codebase, here are the documented fields and their
+possible values:
+
+### Primary Documentation Fields
+
+| Field | Status | Description | Possible Values |
+|-------|--------|-------------|-----------------|
+| **Sub-category** | Active | Primary organizational unit for grouping related tests | See detailed list below |
+| **Test Description** | Active | Human-readable description using `igt_describe()` | Free text (implementation-agnostic) |
+| **Mega-feature** | Active | High-level categorization grouping multiple sub-categories | Driver-specific groupings |
+
+### Main Test Categories (Top-level)
+
+| Category | Description | Examples |
+|----------|-------------|----------|
+| **Core Tests** | Tests for core DRM ioctls and behaviour | Authentication, basic operations |
+| **KMS Tests** | Tests for kernel mode setting | Display functionality, connectors |
+| **GEM Tests** | Tests for graphics execution manager | Memory management, buffer operations |
+| **i915 Tests** | Tests for overall i915 driver behaviour | Intel-specific functionality |
+| **Display Tests** | Tests for display validation | Panel fitting, CRC validation |
+| **Perf Tests** | Tests for performance metrics | GPU performance counters |
+| **PM Tests** | Tests for power management features | Suspend/resume, power states |
+| **Prime Tests** | Tests for buffer sharing | Inter-device buffer sharing |
+| **Debugfs Tests** | Tests for debugfs behaviour | Debug filesystem functionality |
+| **DRM Tests** | Tests for libdrm behaviour | Library functionality |
+| **Meta Tests** | Tests for the CI system itself | Test infrastructure validation |
+| **SW Sync Tests** | Tests for software sync (fencing) | Synchronization primitives |
+| **vGEM Tests** | Tests for virtual graphics execution manager | Virtual GPU functionality |
+| **Tools Tests** | Tests for IGT tools behaviour | Tool validation |
+
+### Sub-category Values (Detailed)
+
+#### Core Infrastructure
+| Sub-category | Description |
+|--------------|-------------|
+| **Core** | Basic DRM functionality tests |
+| **Synchronization** | Tests for synchronization mechanisms |
+| **Device** | Device enumeration and management |
+| **Authentication** | DRM authentication mechanisms |
+
+#### Intel-Specific Sub-categories
+| Sub-category | Description |
+|--------------|-------------|
+| **CMD submission** | Command submission related tests |
+| **Blitter** | Blitter engine tests (unified for i915 and Xe) |
+| **GPGPU** | General Purpose GPU compute tests |
+| **Compute** | Computational workload tests |
+| **Performance** | Performance measurement tests |
+| **Memory management** | Memory allocation and management tests |
+| **Power management** | Power-related functionality tests |
+| **Firmware** | Firmware interaction tests |
+| **Media** | Media processing tests |
+| **Render copy** | Render copy operation tests |
+| **Debugging** | Debug and diagnostic tests |
+| **Workarounds** | Hardware workaround tests |
+| **SysMan** | System management tests |
+| **FDinfo** | File descriptor information tests |
+| **Flat-ccs** | Flat CCS (Color Compression Surface) tests |
+
+#### Display Sub-categories
+| Sub-category | Description |
+|--------------|-------------|
+| **Display** | General display functionality |
+| **KMS** | Kernel Mode Setting tests |
+| **Chamelium** | External test device integration |
+| **Panel** | Panel-specific functionality |
+| **HDMI** | HDMI interface tests |
+| **DisplayPort** | DisplayPort interface tests |
+| **VGA** | VGA interface tests |
+
+#### Vendor-Specific Sub-categories
+| Sub-category | Description |
+|--------------|-------------|
+| **AMDGPU** | AMD GPU specific tests |
+| **intel-nouveau** | Intel and Nouveau driver interaction |
+| **i915** | Intel i915 driver tests |
+| **Xe** | Intel Xe driver tests |
+
+#### Legacy/Deprecated Sub-categories
+| Sub-category | Description |
+|--------------|-------------|
+| **Obsolete** | Deprecated or legacy tests |
+
+### Deprecated Fields
+
+| Field | Status | Reason for Deprecation |
+|-------|--------|----------------------|
+| **Test Category** | WIP | Not used consistently |
+| **Functionality** | WIP | Developer-dependent interpretation |
+| **Run Type** | WIP | Unclear usage patterns |
+
+### Driver-Specific Mega-features
+
+| Driver | Mega-feature Examples |
+|--------|---------------------|
+| **i915** | Display, GEM, Performance, Power Management |
+| **Xe** | Compute, CMD Submission, Memory Management |
+| **AMDGPU** | Display, Compute, Performance |
+
+### Documentation Markup Examples
+
+```c
+/**
+ * SUBTEST: %s
+ * Description: %s
+ * Sub-category: %s
+ */
+
+// Example usage:
+igt_describe("check that atomic updates are indeed atomic");
+igt_subtest_with_dynamic("atomic-plane-updates") {
+    // Test implementation
+}
+```
+
+### Field Usage Guidelines
+
+1. **Sub-category**: Always required, must match established categories
+2. **Test Description**: Should be implementation-agnostic and focus on what is tested
+3. **Mega-feature**: Used for high-level organization, typically driver-specific
+4. **Avoid deprecated fields**: Do not use Test Category, Functionality, or Run Type
diff --git a/docs/test_documentation.md b/docs/test_documentation.md
index 5c33b0c2a..43313d667 100644
--- a/docs/test_documentation.md
+++ b/docs/test_documentation.md
@@ -1,28 +1,6 @@
-IGT Test documentation
-======================
+# IGT Test documentation
 
-Legacy way
-----------
-
-IGT has been providing a way to document tests in runtime by using tree macros:
-
-    - IGT_TEST_DESCRIPTION(test_file_description)
-    - igt_describe(subtest_description) and igt_describe_f(format, args...)
-
-This is limited, as:
-    - Each test/subtest has just one “field”: description. It doesn't
-      allow specifying what features are tested and/or special requirements;
-    - It is meant to produce a very concise documentation;
-    - Integration with external platforms to group tests per category
-      is not possible, as there's no way to tell what category each test
-      belongs;
-    - Format is not easily expansible;
-    - The build system doesn’t verify if all tests are documented.
-      As time passes, documentation tends to be outdated or forgotten,
-      as new patches modify the test set.
-
-Documentation via structured comments (testplan)
-------------------------------------------------
+## Documentation via structured comments (testplan)
 
 With the addition of Xe driver, a new way to document tests was added.
 It is based on special comment-like annotation inside the C code.
@@ -39,15 +17,14 @@ if needed.
 The build system can also optionally enforce a check at build time to
 verify if the documentation is in place.
 
-testplan configuration file
----------------------------
+## Testplan configuration file
 
 The configuration file contains the fields to be used for documenting
 tests and test names. It may also mark a property as mandatory.
 
 A typical example is:
 
-```
+```json
 {
     "description": "JSON example file",
     "name": "Tests for XYZ Driver",
@@ -68,11 +45,11 @@ A typical example is:
 }
 ```
 
-Documenting tests via testplan
-------------------------------
+## Documenting tests via testplan
 
 A typical documentation markup at the test source code looks like:
-```
+
+```c
 /**
  * TEST: Check if new IGT test documentation logic functionality is working
  * Mega-feature: IGT test documentation
@@ -95,7 +72,7 @@ A typical documentation markup at the test source code looks like:
 
 It is also possible to add variables to the documentation with:
 
-```
+```c
 /**
  * SUBTEST: test-%s-binds-with-%ld-size-%s
  * Description: Test arg[3] arg[1] binds with arg[2] size
@@ -117,7 +94,7 @@ It is also possible to add variables to the documentation with:
  * @misaligned-binds:           misaligned
  * @userptr-binds:              user pointer
  */
- ```
+```
 
 The first "%s" will be replaced by the values of arg[1] for the subtest
 name. At the description, arg[1] will be replaced by the string after
@@ -126,7 +103,7 @@ the field description. The same applies to the subsequent wildcards.
 The above will produce the following output (using the example
 configuration file described at the past session:
 
-```
+```c
 ``igt@test@test-large-<buffer size>-size``
 
 :Description: Test large something with <buffer size> size
@@ -155,13 +132,14 @@ configuration file described at the past session:
 ``igt@test@test-small-binds-with-<buffer size>-size-userptr-binds``
 
 :Description: Test user pointer small something binds with <buffer size> size
+
 ```
 
 Wildcard replacement can also be used to maintain an argument with the
 same name at the replaced description. That makes easy to document
 numeric arguments with a fixed testset, like:
 
-```
+```c
 /**
  * SUBTEST: unbind-all-%d-vmas
  * Description: unbind all with %arg[1] VMAs
@@ -177,3 +155,23 @@ numeric arguments with a fixed testset, like:
  * arg[1].values: 64, 128
  */
 ```
+
+## Legacy way
+
+IGT has been providing a way to document tests in runtime by using tree macros:
+
+- IGT_TEST_DESCRIPTION(test_file_description)
+- igt_describe(subtest_description) and igt_describe_f(format, args...)
+
+This is limited, as:
+
+- Each test/subtest has just one “field”: description. It doesn't
+  allow specifying what features are tested and/or special requirements;
+- It is meant to produce a very concise documentation;
+- Integration with external platforms to group tests per category
+  is not possible, as there's no way to tell what category each test
+  belongs;
+- Format is not easily expansible;
+- The build system doesn’t verify if all tests are documented.
+  As time passes, documentation tends to be outdated or forgotten,
+  as new patches modify the test set.
diff --git a/docs/test_plan.md b/docs/test_plan.md
new file mode 100644
index 000000000..edda50f4b
--- /dev/null
+++ b/docs/test_plan.md
@@ -0,0 +1,216 @@
+# :material-clipboard-text: Test Plan
+
+## :material-information-outline: Overview
+
+IGT GPU Tools implements a comprehensive test plan system to ensure proper documentation
+and validation of all tests. The test plan is particularly important for maintaining
+quality and consistency across different GPU drivers and test categories.
+
+!!! warning "Build Requirement"
+    **Some drivers and test sets require that all tests be properly documented via
+    testplan.** By default, the build will fail if documentation is missing or outdated.
+    This is currently enabled for:
+
+    - **Xe driver tests**
+    - **i915 driver tests**
+    - **KMS (Kernel Mode Setting) tests**
+
+For more details, see `docs/test_documentation.md` in the IGT source tree.
+
+## :material-file-document-outline: Test Plan Structure
+
+### Documentation Requirements
+
+Every test that falls under test plan validation must include proper documentation using
+the IGT documentation system:
+
+```c
+/**
+ * TEST: test_name
+ * Category: Display|Core|Performance|etc
+ * Description: Brief description of what the test validates
+ * Sub-category: Specific functional area
+ */
+
+/**
+ * SUBTEST: subtest_name
+ * Description: What this specific subtest validates
+ */
+```
+
+## :material-cog-outline: Test Plan Validation
+
+### Build-Time Validation
+
+The IGT build system automatically validates test documentation:
+
+```bash
+# Build will fail if documentation is missing
+meson build
+ninja -C build
+
+# Error example:
+# ERROR: Test 'kms_example' is missing required documentation
+# Please add proper TEST and SUBTEST documentation blocks
+```
+
+### Documentation Generation
+
+IGT provides tools to generate and validate test documentation:
+
+```bash
+# Generate test documentation
+./scripts/igt_doc.py --config=tests/kms_test_config.json
+
+# Filter by functionality
+./scripts/igt_doc.py --config=tests/kms_test_config.json \
+    --filter-field=Functionality=~'kms_core,synchronization'
+
+# Validate specific test categories
+./scripts/igt_doc.py --config=tests/intel_test_config.json \
+    --filter-field=Category=Display
+```
+
+## :material-script-text-outline: Documentation Examples
+
+### Basic Test Documentation
+
+```c
+/**
+ * TEST: kms_atomic
+ * Category: Display
+ * Description: Test atomic modesetting functionality
+ * Sub-category: Atomic
+ */
+
+/**
+ * SUBTEST: plane-cursor-legacy
+ * Description: Test interaction between cursor plane and legacy cursor API
+ */
+igt_subtest("plane-cursor-legacy") {
+    igt_describe("Verify cursor plane behavior when mixing atomic and legacy APIs");
+    test_cursor_interaction();
+}
+```
+
+### Advanced Documentation with Dynamic Subtests
+
+```c
+/**
+ * TEST: kms_pipe_operations
+ * Category: Display
+ * Description: Validate operations across different display pipes
+ * Sub-category: Core
+ */
+
+/**
+ * SUBTEST: pipe-%s-basic-modeset
+ * Description: Basic modeset validation for pipe %arg[1]
+ */
+igt_subtest_with_dynamic("pipe-basic-modeset") {
+    for_each_pipe(display, pipe) {
+        igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+            igt_describe("Verify basic modeset functionality on a single pipe");
+            test_basic_modeset(pipe);
+        }
+    }
+}
+```
+
+## :material-check-circle-outline: Test Plan Compliance
+
+### Mandatory Requirements
+
+For Xe, i915, and KMS tests:
+
+1. **Complete Documentation**: Every test and subtest must have proper documentation blocks
+2. **Accurate Descriptions**: Descriptions must be implementation-agnostic and focus on
+   what is tested
+3. **Proper Categorization**: Tests must use established categories and sub-categories
+4. **Build Validation**: Documentation is validated at build time
+
+### Best Practices
+
+1. **Descriptive Names**: Use clear, descriptive test and subtest names
+2. **Consistent Categories**: Follow established category hierarchies
+3. **Implementation-Agnostic**: Avoid describing how tests work, focus on what they
+   validate
+4. **Regular Updates**: Keep documentation in sync with test changes
+
+### Common Documentation Issues
+
+❌ **Bad Documentation:**
+```c
+// Too implementation-specific
+"spawn 10 threads, each pinning cpu core with a busy loop..."
+
+// Too vague
+"test stuff"
+
+// Missing required fields
+/**
+ * TEST: example
+ * Description: Some test
+ */
+// Missing Category and Sub-category
+```
+
+✅ **Good Documentation:**
+```c
+/**
+ * TEST: kms_cursor_legacy
+ * Category: Display
+ * Description: Test legacy cursor interface functionality and compatibility
+ * Sub-category: Cursor
+ */
+
+/**
+ * SUBTEST: basic-flip-before-cursor
+ * Description: Verify cursor updates work correctly after page flips
+ */
+```
+
+
+## :material-tools: Validation Tools
+
+### igt_doc.py Script
+
+The main tool for test plan validation and generation:
+
+```bash
+# Basic validation
+./scripts/igt_doc.py --config=tests/kms_test_config.json
+
+# Generate HTML documentation
+./scripts/igt_doc.py --config=tests/kms_test_config.json --output-dir=docs/
+
+# Validate specific functionality
+./scripts/igt_doc.py --filter-field=Sub-category=Synchronization
+
+# Check for missing documentation
+./scripts/igt_doc.py --validate-only
+```
+
+### Configuration Files
+
+Test configurations are stored in JSON files:
+
+- `tests/kms_test_config.json` - KMS test configuration
+- `tests/intel_test_config.json` - Intel driver test configuration
+- `tests/xe_test_config.json` - Xe driver test configuration
+
+### CI Integration
+
+Test plan validation is integrated into CI systems:
+
+- **Pre-merge testing**: Documentation is validated before patches are merged
+- **Post-merge validation**: Ensures documentation stays up-to-date
+- **Automated reporting**: Missing documentation triggers build failures
+
+
+## :material-link: References
+
+- `docs/test_documentation.md` - Detailed documentation requirements
+- IGT source tree test files - Examples of proper documentation
+- CI system logs - Build validation feedback
+- `scripts/igt_doc.py` - Documentation generation tool
-- 
2.51.0

