Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04B110E442
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 15:13:25 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.15.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 28FA1580BF0
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 08:11:14 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pzIo4-007AzB-0a
 for igt-dev@lists.freedesktop.org; Wed, 17 May 2023 17:11:12 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 17 May 2023 17:11:09 +0200
Message-Id: <20230517151110.1710407-6-mauro.chehab@linux.intel.com>
In-Reply-To: <20230517151110.1710407-1-mauro.chehab@linux.intel.com>
References: <20230517151110.1710407-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 5/6] i915/perf_*: better document tests
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Merge data from some ancillary internal documentation to improve
i915 perf test descriptions.

This patch was auto-generated via script.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/i915/perf.c     | 126 +++++++++++++++++++++++++------
 tests/i915/perf_pmu.c | 171 +++++++++++++++++++++++++++++++++---------
 2 files changed, 238 insertions(+), 59 deletions(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 1b1c39aafb8b..f22be7f6eaba 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -49,23 +49,39 @@
  * TEST: perf
  * Description: Test the i915 perf metrics streaming interface
  * Run type: FULL
+ * Test category: Perf
  *
  * SUBTEST: blocking
  * Description: Test blocking read with default hrtimer frequency
- * Feature: oa
+ * Feature:
+ *   oa
+ *   i915 streaming interface
+ * Functionality: Test blocking read with default hrtimer frequency
  *
  * SUBTEST: blocking-parameterized
  * Description: Test blocking read with different hrtimer frequencies
- * Feature: oa
+ * Feature:
+ *   oa
+ *   i915 streaming interface
+ * Functionality: Test blocking read with different hrtimer frequencies
  *
  * SUBTEST: buffer-fill
- * Feature: oa
+ * Feature:
+ *   oa
+ *   i915 streaming interface
+ * Functionality: Test the i915 perf metrics streaming interface
  *
  * SUBTEST: create-destroy-userspace-config
- * Feature: oa
+ * Feature:
+ *   oa
+ *   i915 streaming interface
+ * Functionality: Test the i915 perf metrics streaming interface
  *
  * SUBTEST: disabled-read-error
- * Feature: oa
+ * Feature:
+ *   oa
+ *   i915 streaming interface
+ * Functionality: Test the i915 perf metrics streaming interface
  *
  * SUBTEST: enable-disable
  * Feature: oa
@@ -84,7 +100,10 @@
  *
  * SUBTEST: gen12-invalid-class-instance
  * Description: Verify invalid class instance
- * Feature: oa
+ * Feature:
+ *   oa
+ *   i915 streaming interface
+ * Functionality: Verify invalid class instance
  *
  * SUBTEST: gen12-mi-rpc
  * Description: Test MI REPORT PERF COUNT for Gen 12
@@ -92,7 +111,10 @@
  *
  * SUBTEST: gen12-oa-tlb-invalidate
  * Description: Test OA TLB invalidate
- * Feature: oa
+ * Feature:
+ *   oa
+ *   i915 streaming interface
+ * Functionality: Test OA TLB invalidate
  *
  * SUBTEST: gen12-unprivileged-single-ctx-counters
  * Description: Measure performance for a specific context using OAR in Gen 12
@@ -110,84 +132,138 @@
  * Feature: oa
  *
  * SUBTEST: i915-ref-count
- * Feature: oa
+ * Feature:
+ *   oa
+ *   i915 streaming interface
+ * Functionality: Test the i915 perf metrics streaming interface
  *
  * SUBTEST: invalid-create-userspace-config
- * Feature: oa
+ * Feature:
+ *   oa
+ *   i915 streaming interface
+ * Functionality: Test the i915 perf metrics streaming interface
  *
  * SUBTEST: invalid-oa-exponent
- * Feature: oa
+ * Feature:
+ *   oa
+ *   i915 streaming interface
+ * Functionality: Test the i915 perf metrics streaming interface
  *
  * SUBTEST: invalid-oa-format-id
- * Feature: oa
+ * Feature:
+ *   oa
+ *   i915 streaming interface
+ * Functionality: Test the i915 perf metrics streaming interface
  *
  * SUBTEST: invalid-oa-metric-set-id
- * Feature: oa
+ * Feature:
+ *   oa
+ *   i915 streaming interface
+ * Functionality: Test the i915 perf metrics streaming interface
  *
  * SUBTEST: invalid-open-flags
- * Feature: oa
+ * Feature:
+ *   oa
+ *   i915 streaming interface
+ * Functionality: Test the i915 perf metrics streaming interface
  *
  * SUBTEST: invalid-remove-userspace-config
- * Feature: oa
+ * Feature:
+ *   oa
+ *   i915 streaming interface
+ * Functionality: Test the i915 perf metrics streaming interface
  *
  * SUBTEST: low-oa-exponent-permissions
- * Feature: oa
+ * Feature:
+ *   oa
+ *   i915 streaming interface
+ * Functionality: Test the i915 perf metrics streaming interface
  *
  * SUBTEST: mi-rpc
  * Feature: oa
  *
  * SUBTEST: missing-sample-flags
- * Feature: oa
+ * Feature:
+ *   oa
+ *   i915 streaming interface
+ * Functionality: Test the i915 perf metrics streaming interface
  *
  * SUBTEST: non-sampling-read-error
- * Feature: oa
+ * Feature:
+ *   oa
+ *   i915 streaming interface
+ * Functionality: Test the i915 perf metrics streaming interface
  *
  * SUBTEST: non-system-wide-paranoid
  * Feature: oa
  *
  * SUBTEST: non-zero-reason
  * Description: Test that reason field in OA reports is never 0 on Gen8+
- * Feature: oa
+ * Feature:
+ *   oa
+ *   i915 streaming interface
+ * Functionality: Test that reason field in OA reports is never 0 on Gen8+
  *
  * SUBTEST: oa-exponents
  * Feature: oa
  *
  * SUBTEST: oa-formats
- * Feature: oa
+ * Feature:
+ *   oa
+ *   i915 streaming interface
+ * Functionality: Test the i915 perf metrics streaming interface
  *
  * SUBTEST: per-context-mode-unprivileged
  * Feature: oa, obsolete
  *
  * SUBTEST: polling
  * Description: Test polled read with default hrtimer frequency
- * Feature: oa
+ * Feature:
+ *   oa
+ *   i915 streaming interface
+ * Functionality: Test polled read with default hrtimer frequency
  *
  * SUBTEST: polling-parameterized
  * Description: Test polled read with different hrtimer frequencies
- * Feature: oa
+ * Feature:
+ *   oa
+ *   i915 streaming interface
+ * Functionality: Test polled read with different hrtimer frequencies
  *
  * SUBTEST: polling-small-buf
  * Description: Test polled read with buffer size smaller than available data
- * Feature: oa
+ * Feature:
+ *   oa
+ *   i915 streaming interface
+ * Functionality: Test polled read with buffer size smaller than available data
  *
  * SUBTEST: rc6-disable
  * Feature: oa
  *
  * SUBTEST: short-reads
- * Feature: oa
+ * Feature:
+ *   oa
+ *   i915 streaming interface
+ * Functionality: Test the i915 perf metrics streaming interface
  *
  * SUBTEST: stress-open-close
  * Description: Stress tests opening & closing the i915-perf stream in a busy loop
  * Feature: oa
  *
  * SUBTEST: sysctl-defaults
- * Feature: oa
+ * Feature:
+ *   oa
+ *   i915 streaming interface
+ * Functionality: Test the i915 perf metrics streaming interface
  *
  * SUBTEST: unprivileged-single-ctx-counters
  * Feature: oa, obsolete
  *
  * SUBTEST: whitelisted-registers-userspace-config
- * Feature: oa
+ * Feature:
+ *   oa
+ *   i915 streaming interface
+ * Functionality: Test the i915 perf metrics streaming interface
  */
 
 IGT_TEST_DESCRIPTION("Test the i915 perf metrics streaming interface");
diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index bedadbe92797..653b5e99c78c 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -53,54 +53,103 @@
  * TEST: perf pmu
  * Description: Test the i915 pmu perf interface
  * Run type: FULL
+ * Test category: Perf
  *
  * SUBTEST: all-busy-check-all
- * Feature: pmu
+ * Feature:
+ *   pmu
+ *   i915 pmu perf interface
+ * Functionality: Test the i915 pmu perf interface
  *
  * SUBTEST: all-busy-idle-check-all
- * Feature: pmu
+ * Feature:
+ *   pmu
+ *   i915 pmu perf interface
+ * Functionality: Test the i915 pmu perf interface
  *
  * SUBTEST: busy
- * Feature: pmu
+ * Feature:
+ *   pmu
+ *   i915 pmu perf interface
+ * Functionality: Test to ensure gpu is busy when there a workload by reading engine busyness pmu counters
  *
  * SUBTEST: busy-accuracy-2
- * Feature: pmu
+ * Feature:
+ *   pmu
+ *   i915 pmu perf interface
+ * Functionality: Test the i915 pmu perf interface
  *
  * SUBTEST: busy-accuracy-50
- * Feature: pmu
+ * Feature:
+ *   pmu
+ *   i915 pmu perf interface
+ * Functionality: Test the i915 pmu perf interface
  *
  * SUBTEST: busy-accuracy-98
- * Feature: pmu
+ * Feature:
+ *   pmu
+ *   i915 pmu perf interface
+ * Functionality: Test the i915 pmu perf interface
  *
  * SUBTEST: busy-check-all
- * Feature: pmu
+ * Feature:
+ *   pmu
+ *   i915 pmu perf interface
+ * Functionality: Test to ensure gpu all engines report busy when there is a workload by reading engine busyness pmu counters
  *
  * SUBTEST: busy-double-start
- * Feature: pmu
+ * Feature:
+ *   pmu
+ *   i915 pmu perf interface
+ * Functionality: Test the i915 pmu perf interface
  *
  * SUBTEST: busy-hang
- * Feature: pmu
+ * Feature:
+ *   pmu
+ *   i915 pmu perf interface
+ * Functionality: Test to ensure there is no hanf when all engines are busy
  *
  * SUBTEST: busy-idle
- * Feature: pmu
+ * Feature:
+ *   pmu
+ *   i915 pmu perf interface
+ * Functionality: Test to ensure gpu engine reports idle when there is no workload
  *
  * SUBTEST: busy-idle-check-all
- * Feature: pmu
+ * Feature:
+ *   pmu
+ *   i915 pmu perf interface
+ * Functionality: Test to ensure gpu all engine reports idle when there is no workload
  *
  * SUBTEST: busy-idle-no-semaphores
- * Feature: pmu
+ * Feature:
+ *   pmu
+ *   i915 pmu perf interface
+ * Functionality: Test to verify gpu idle through engine business pmu counters
  *
  * SUBTEST: busy-no-semaphores
- * Feature: pmu
+ * Feature:
+ *   pmu
+ *   i915 pmu perf interface
+ * Functionality: Test to verify gpu busyness through engine business pmu counters
  *
  * SUBTEST: busy-start
- * Feature: pmu
+ * Feature:
+ *   pmu
+ *   i915 pmu perf interface
+ * Functionality: Test to verify gpu busyness through engine business pmu counters
  *
  * SUBTEST: cpu-hotplug
- * Feature: pmu
+ * Feature:
+ *   pmu
+ *   i915 pmu perf interface
+ * Functionality: Test the i915 pmu perf interface
  *
  * SUBTEST: enable-race
- * Feature: pmu
+ * Feature:
+ *   pmu
+ *   i915 pmu perf interface
+ * Functionality: Test the i915 pmu perf interface
  *
  * SUBTEST: event-wait
  * Feature: obsolete, pmu
@@ -109,52 +158,97 @@
  * Feature: pmu
  *
  * SUBTEST: frequency
- * Feature: pmu
+ * Feature:
+ *   pmu
+ *   i915 pmu perf interface
+ * Functionality: Read requested freq and actual frequency via PMU within specified time interval for any given workload changes
  *
  * SUBTEST: frequency-idle
  * Feature: pmu
  *
  * SUBTEST: gt-awake
- * Feature: pmu
+ * Feature:
+ *   pmu
+ *   i915 pmu perf interface
+ * Functionality: Setup workload on all engines,measure gt awake time via pmu
  *
  * SUBTEST: idle
- * Feature: pmu
+ * Feature:
+ *   pmu
+ *   i915 pmu perf interface
+ * Functionality: Test to ensure gpu is idle when there is no workload by reading engine busyness pmu counters
  *
  * SUBTEST: idle-no-semaphores
- * Feature: pmu
+ * Feature:
+ *   pmu
+ *   i915 pmu perf interface
+ * Functionality: Test to ensure gpu is idle when there is no workload by reading engine busyness pmu counters
  *
  * SUBTEST: init-busy
- * Feature: pmu
+ * Feature:
+ *   pmu
+ *   i915 pmu perf interface
+ * Functionality: Test to verify gpu busyness init through pmu perf interface
  *
  * SUBTEST: init-sema
- * Feature: pmu
+ * Feature:
+ *   pmu
+ *   i915 pmu perf interface
+ * Functionality: Test to verify gpu busyness init through pmu perf interface
  *
  * SUBTEST: init-wait
- * Feature: pmu
+ * Feature:
+ *   pmu
+ *   i915 pmu perf interface
+ * Functionality: Test to verify gpu busyness init through pmu perf interface
  *
  * SUBTEST: interrupts
- * Feature: pmu
+ * Feature:
+ *   pmu
+ *   i915 pmu perf interface
+ * Functionality: Test the i915 pmu perf interface
  *
  * SUBTEST: interrupts-sync
- * Feature: pmu
+ * Feature:
+ *   pmu
+ *   i915 pmu perf interface
+ * Functionality: Test the i915 pmu perf interface
  *
  * SUBTEST: invalid-init
- * Feature: pmu
+ * Feature:
+ *   pmu
+ *   i915 pmu perf interface
+ * Functionality: Tests that i915 PMU corectly errors out in invalid initialization
  *
  * SUBTEST: invalid-open
- * Feature: pmu
+ * Feature:
+ *   pmu
+ *   i915 pmu perf interface
+ * Functionality: Test the i915 pmu perf interface
  *
  * SUBTEST: module-unload
- * Feature: pmu
+ * Feature:
+ *   pmu
+ *   i915 pmu perf interface
+ * Functionality: Test the i915 pmu perf interface
  *
  * SUBTEST: most-busy-check-all
- * Feature: pmu
+ * Feature:
+ *   pmu
+ *   i915 pmu perf interface
+ * Functionality: Test the i915 pmu perf interface
  *
  * SUBTEST: most-busy-idle-check-all
- * Feature: pmu
+ * Feature:
+ *   pmu
+ *   i915 pmu perf interface
+ * Functionality: Test the i915 pmu perf interface
  *
  * SUBTEST: multi-client
- * Feature: pmu
+ * Feature:
+ *   pmu
+ *   i915 pmu perf interface
+ * Functionality: Test the i915 pmu perf interface
  *
  * SUBTEST: pmu-read
  * Description: Verify i915 pmu dir exists and read all events
@@ -179,13 +273,22 @@
  * Feature: pmu
  *
  * SUBTEST: semaphore-busy
- * Feature: pmu
+ * Feature:
+ *   pmu
+ *   i915 pmu perf interface
+ * Functionality: Test the i915 pmu perf interface
  *
  * SUBTEST: semaphore-wait
- * Feature: pmu
+ * Feature:
+ *   pmu
+ *   i915 pmu perf interface
+ * Functionality: Test the i915 pmu perf interface
  *
  * SUBTEST: semaphore-wait-idle
- * Feature: pmu
+ * Feature:
+ *   pmu
+ *   i915 pmu perf interface
+ * Functionality: Test the i915 pmu perf interface
  */
 
 IGT_TEST_DESCRIPTION("Test the i915 pmu perf interface");
-- 
2.40.1
