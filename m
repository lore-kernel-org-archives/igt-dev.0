Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198FD10E084
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 01:00:25 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  7 Aug 2023 18:00:17 -0700
Message-ID: <20230808010017.37819-21-ashutosh.dixit@intel.com>
In-Reply-To: <20230808010017.37819-1-ashutosh.dixit@intel.com>
References: <20230808010017.37819-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 20/20] HAX: Add OA tests to
 xe-fast-feedback.testlist
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 43 ++++++++++++++++++++++++
 tests/intel-ci/xe.blocklist.txt          |  1 -
 2 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index f7c6b62f5f08..fe2f19012413 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -1,6 +1,49 @@
 # Should be the first test
 igt@xe_module_load@load
 
+# oa tests
+igt@perf@i915-ref-count
+igt@perf@sysctl-defaults
+igt@perf@non-system-wide-paranoid
+igt@perf@invalid-open-flags
+igt@perf@invalid-oa-metric-set-id
+igt@perf@invalid-oa-format-id
+igt@perf@missing-sample-flags
+igt@perf@oa-formats
+igt@perf@invalid-oa-exponent
+igt@perf@low-oa-exponent-permissions
+igt@perf@oa-exponents
+igt@perf@per-context-mode-unprivileged
+igt@perf@buffer-fill
+igt@perf@non-zero-reason
+igt@perf@disabled-read-error
+igt@perf@non-sampling-read-error
+igt@perf@enable-disable
+igt@perf@blocking
+igt@perf@blocking-parameterized
+igt@perf@polling
+igt@perf@polling-parameterized
+igt@perf@polling-small-buf
+igt@perf@short-reads
+igt@perf@mi-rpc
+igt@perf@unprivileged-single-ctx-counters
+igt@perf@gen8-unprivileged-single-ctx-counters
+igt@perf@gen12-mi-rpc
+igt@perf@gen12-oa-tlb-invalidate
+igt@perf@gen12-unprivileged-single-ctx-counters
+igt@perf@gen12-invalid-class-instance
+igt@perf@gen12-group-exclusive-stream-sample-oa
+igt@perf@gen12-group-exclusive-stream-ctx-handle
+igt@perf@gen12-group-concurrent-oa-buffer-read
+igt@perf@rc6-disable
+igt@perf@stress-open-close
+igt@perf@global-sseu-config-invalid
+igt@perf@global-sseu-config
+igt@perf@invalid-create-userspace-config
+igt@perf@invalid-remove-userspace-config
+igt@perf@create-destroy-userspace-config
+igt@perf@whitelisted-registers-userspace-config
+
 igt@xe_compute@compute-square
 igt@xe_create@create-execqueues-noleak
 igt@xe_create@create-execqueues-leak
diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 1778e91f12a1..387418d6ac1f 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -18,7 +18,6 @@ igt@vmwgfx.*
 igt@api.*
 igt@gem.*
 igt@gen.*
-igt@perf.*
 igt@sysfs_.*
 ##################################################################
 # Exclude mock DRM KUnit from IGT, as those already run at build
-- 
2.41.0
