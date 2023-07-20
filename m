Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF66D10E60D
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jul 2023 23:18:04 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 20 Jul 2023 16:17:56 -0700
Message-ID: <20230720231756.3464641-21-ashutosh.dixit@intel.com>
In-Reply-To: <20230720231756.3464641-1-ashutosh.dixit@intel.com>
References: <20230720231756.3464641-1-ashutosh.dixit@intel.com>
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
index 2799d9cfb6b2..027f0d38b60c 100644
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
 igt@xe_create@create-engines-noleak
 igt@xe_create@create-engines-leak
diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index ab3945f76b70..1b4568efd446 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -18,7 +18,6 @@ igt@vmwgfx.*
 igt@api.*
 igt@gem.*
 igt@gen.*
-igt@perf.*
 igt@sysfs_.*
 ##################################################################
 # Exclude kselftest
-- 
2.41.0
