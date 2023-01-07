Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E25C10E2DF
 for <igt-dev@lists.freedesktop.org>; Sat,  7 Jan 2023 01:11:33 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  6 Jan 2023 17:11:25 -0800
Message-Id: <20230107011127.39537-2-ashutosh.dixit@intel.com>
In-Reply-To: <20230107011127.39537-1-ashutosh.dixit@intel.com>
References: <20230107011127.39537-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] tests/perf_pmu: Compare against
 requested freq in frequency subtest
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

After the i915 commit 95ccf312a1e4f ("drm/i915/guc/slpc: Allow SLPC to use
efficient frequency"), FW uses the requested freq as the efficient freq
which can exceed the max freq set. Therefore, in the "min freq" part of the
igt@perf_pmu@frequency subtest, compare the requested freq reported by PMU
not against the set freq but against the requested freq reported in sysfs.

v2: Remove previously added delays. GuC FW is now updated to set min/max
    freq in top half so delays are not needed
v3: Increase tolerance between measured and requested freq to 10% to
    account for sporadic failures due to dynamically changing efficient
    freq. Also document the changes in code.

Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/6806
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/perf_pmu.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index f363db2ba13..f9ef89fb0b3 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -1546,7 +1546,7 @@ test_interrupts_sync(int gem_fd)
 static void
 test_frequency(int gem_fd)
 {
-	uint32_t min_freq, max_freq, boost_freq;
+	uint32_t min_freq, max_freq, boost_freq, min_req;
 	uint64_t val[2], start[2], slept;
 	double min[2], max[2];
 	igt_spin_t *spin;
@@ -1587,6 +1587,7 @@ test_frequency(int gem_fd)
 
 	min[0] = 1e9*(val[0] - start[0]) / slept;
 	min[1] = 1e9*(val[1] - start[1]) / slept;
+	min_req = igt_sysfs_get_u32(sysfs, "gt_cur_freq_mhz");
 
 	igt_spin_free(gem_fd, spin);
 	gem_quiescent_gpu(gem_fd); /* Don't leak busy bo into the next phase */
@@ -1633,7 +1634,14 @@ test_frequency(int gem_fd)
 	igt_info("Max frequency: requested %.1f, actual %.1f\n",
 		 max[0], max[1]);
 
-	assert_within_epsilon(min[0], min_freq, tolerance);
+	/*
+	 * With GuC SLPC, FW uses requested freq as the efficient freq which can
+	 * exceed the max freq. Therefore compare requested freq measured by the
+	 * PMU not against the set freq's but against the requested freq
+	 * reported in sysfs. Also increase the tolerance a bit to account for
+	 * dynamically changing efficient/requested freq
+	 */
+	assert_within_epsilon(min[0], min_req, 0.1f);
 	/*
 	 * On thermally throttled devices we cannot be sure maximum frequency
 	 * can be reached so use larger tolerance downards.
-- 
2.38.0
