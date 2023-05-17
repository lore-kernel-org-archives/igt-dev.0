Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE1810E49B
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 21:25:47 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 17 May 2023 14:25:32 -0700
Message-Id: <20230517212542.3681862-6-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230517212542.3681862-1-umesh.nerlige.ramappa@intel.com>
References: <20230517212542.3681862-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 05/15] perf_pmu: Use correct pmu config
 for multi-tile
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

From: Riana Tauro <riana.tauro@intel.com>

Use the correct perf_pmu config for actual and requested frequency in
multi-tile frequency test.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/i915/perf_pmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index 6c9cd5ca8..358a2e7ac 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -1739,8 +1739,8 @@ test_frequency(int gem_fd, unsigned int gt)
 	igt_require(max_freq > min_freq);
 	igt_require(boost_freq > min_freq);
 
-	fd[0] = open_group(gem_fd, I915_PMU_REQUESTED_FREQUENCY, -1);
-	fd[1] = open_group(gem_fd, I915_PMU_ACTUAL_FREQUENCY, fd[0]);
+	fd[0] = open_group(gem_fd, __I915_PMU_REQUESTED_FREQUENCY(gt), -1);
+	fd[1] = open_group(gem_fd, __I915_PMU_ACTUAL_FREQUENCY(gt), fd[0]);
 
 	/*
 	 * Set GPU to min frequency and read PMU counters.
@@ -1833,8 +1833,8 @@ test_frequency_idle(int gem_fd, unsigned int gt)
 
 	/* While parked, our convention is to report the GPU at 0Hz */
 
-	fd[0] = open_group(gem_fd, I915_PMU_REQUESTED_FREQUENCY, -1);
-	fd[1] = open_group(gem_fd, I915_PMU_ACTUAL_FREQUENCY, fd[0]);
+	fd[0] = open_group(gem_fd, __I915_PMU_REQUESTED_FREQUENCY(gt), -1);
+	fd[1] = open_group(gem_fd, __I915_PMU_ACTUAL_FREQUENCY(gt), fd[0]);
 
 	gem_quiescent_gpu(gem_fd); /* Be idle! */
 	measured_usleep(2000); /* Wait for timers to cease */
-- 
2.36.1
