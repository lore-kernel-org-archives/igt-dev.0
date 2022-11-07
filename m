Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C7110E050
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Nov 2022 06:23:34 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun,  6 Nov 2022 22:23:29 -0800
Message-Id: <20221107062329.1927534-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/perf_pmu: Compare against requested
 freq in frequency subtest
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

In igt@perf_pmu@frequency subtest, compare the requested freq reported by
PMU not against the set freq but against the requested freq reported in
sysfs. If requested freq differs from the set freq (even when min == max
freq) for whatever reason, the sysfs requested freq should be closer to the
PMU measured requested freq which should minimize sporadic failures.

Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/6806
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/perf_pmu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index f363db2ba13..42b5b7bd6f2 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -1546,7 +1546,7 @@ test_interrupts_sync(int gem_fd)
 static void
 test_frequency(int gem_fd)
 {
-	uint32_t min_freq, max_freq, boost_freq;
+	uint32_t min_freq, max_freq, boost_freq, min_req, max_req;
 	uint64_t val[2], start[2], slept;
 	double min[2], max[2];
 	igt_spin_t *spin;
@@ -1587,6 +1587,7 @@ test_frequency(int gem_fd)
 
 	min[0] = 1e9*(val[0] - start[0]) / slept;
 	min[1] = 1e9*(val[1] - start[1]) / slept;
+	min_req = igt_sysfs_get_u32(sysfs, "gt_cur_freq_mhz");
 
 	igt_spin_free(gem_fd, spin);
 	gem_quiescent_gpu(gem_fd); /* Don't leak busy bo into the next phase */
@@ -1613,6 +1614,7 @@ test_frequency(int gem_fd)
 
 	max[0] = 1e9*(val[0] - start[0]) / slept;
 	max[1] = 1e9*(val[1] - start[1]) / slept;
+	max_req = igt_sysfs_get_u32(sysfs, "gt_cur_freq_mhz");
 
 	igt_spin_free(gem_fd, spin);
 	gem_quiescent_gpu(gem_fd);
@@ -1633,12 +1635,12 @@ test_frequency(int gem_fd)
 	igt_info("Max frequency: requested %.1f, actual %.1f\n",
 		 max[0], max[1]);
 
-	assert_within_epsilon(min[0], min_freq, tolerance);
+	assert_within_epsilon(min[0], min_req, tolerance);
 	/*
 	 * On thermally throttled devices we cannot be sure maximum frequency
 	 * can be reached so use larger tolerance downards.
 	 */
-	__assert_within_epsilon(max[0], max_freq, tolerance, 0.15f);
+	__assert_within_epsilon(max[0], max_req, tolerance, 0.15f);
 }
 
 static void
-- 
2.38.0
