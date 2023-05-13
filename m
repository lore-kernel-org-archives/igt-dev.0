Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0189D10E720
 for <igt-dev@lists.freedesktop.org>; Sat, 13 May 2023 02:22:43 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Fri, 12 May 2023 19:22:24 -0700
Message-Id: <20230513022234.2832233-6-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230513022234.2832233-1-umesh.nerlige.ramappa@intel.com>
References: <20230513022234.2832233-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 05/15] perf_pmu: Use correct pmu config for
 multi-tile
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
index 38bdee650..4f4a616eb 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -1601,8 +1601,8 @@ test_frequency(int gem_fd, unsigned int gt)
 	igt_require(max_freq > min_freq);
 	igt_require(boost_freq > min_freq);
 
-	fd[0] = open_group(gem_fd, I915_PMU_REQUESTED_FREQUENCY, -1);
-	fd[1] = open_group(gem_fd, I915_PMU_ACTUAL_FREQUENCY, fd[0]);
+	fd[0] = open_group(gem_fd, __I915_PMU_REQUESTED_FREQUENCY(gt), -1);
+	fd[1] = open_group(gem_fd, __I915_PMU_ACTUAL_FREQUENCY(gt), fd[0]);
 
 	/*
 	 * Set GPU to min frequency and read PMU counters.
@@ -1695,8 +1695,8 @@ test_frequency_idle(int gem_fd, unsigned int gt)
 
 	/* While parked, our convention is to report the GPU at 0Hz */
 
-	fd[0] = open_group(gem_fd, I915_PMU_REQUESTED_FREQUENCY, -1);
-	fd[1] = open_group(gem_fd, I915_PMU_ACTUAL_FREQUENCY, fd[0]);
+	fd[0] = open_group(gem_fd, __I915_PMU_REQUESTED_FREQUENCY(gt), -1);
+	fd[1] = open_group(gem_fd, __I915_PMU_ACTUAL_FREQUENCY(gt), fd[0]);
 
 	gem_quiescent_gpu(gem_fd); /* Be idle! */
 	measured_usleep(2000); /* Wait for timers to cease */
-- 
2.36.1
