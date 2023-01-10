Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EEEA10E244
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Jan 2023 19:47:24 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 10 Jan 2023 11:47:19 -0800
Message-Id: <20230110194720.190515-3-ashutosh.dixit@intel.com>
In-Reply-To: <20230110194720.190515-1-ashutosh.dixit@intel.com>
References: <20230110194720.190515-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] tests/gem_ctx_freq: Compare against
 requested freq
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

After the i915 commit 95ccf312a1e4f ("drm/i915/guc/slpc: Allow SLPC to use
efficient frequency"), FW uses the requested freq as the efficient freq
which can exceed the max freq set. Therefore compare the requested freq
reported by PMU not against the set freq's but against the requested freq
reported in sysfs.

v2: Remove previously added delays. GuC FW is now updated to set min/max
    freq in top half so delays are not needed
v3: Document comparison against requested freq in the code.

Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/6786
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_ctx_freq.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/tests/i915/gem_ctx_freq.c b/tests/i915/gem_ctx_freq.c
index a29fe68b72e..9f9ed8cccbf 100644
--- a/tests/i915/gem_ctx_freq.c
+++ b/tests/i915/gem_ctx_freq.c
@@ -110,17 +110,18 @@ static void set_sysfs_freq(uint32_t min, uint32_t max)
 	igt_sysfs_printf(sysfs, "gt_max_freq_mhz", "%u", max);
 }
 
-static bool get_sysfs_freq(uint32_t *min, uint32_t *max)
+static bool get_sysfs_freq(uint32_t *min, uint32_t *max, uint32_t *req)
 {
 	return (igt_sysfs_scanf(sysfs, "gt_min_freq_mhz", "%u", min) == 1 &&
-		igt_sysfs_scanf(sysfs, "gt_max_freq_mhz", "%u", max) == 1);
+		igt_sysfs_scanf(sysfs, "gt_max_freq_mhz", "%u", max) == 1 &&
+		igt_sysfs_scanf(sysfs, "gt_cur_freq_mhz", "%u", req) == 1);
 }
 
 static void sysfs_range(int i915)
 {
 #define N_STEPS 10
 	uint32_t frequencies[TRIANGLE_SIZE(N_STEPS)];
-	uint32_t sys_min, sys_max;
+	uint32_t sys_min, sys_max, req;
 	igt_spin_t *spin;
 	double measured;
 	int pmu;
@@ -133,7 +134,7 @@ static void sysfs_range(int i915)
 	 * constriained sysfs range.
 	 */
 
-	igt_require(get_sysfs_freq(&sys_min, &sys_max));
+	igt_require(get_sysfs_freq(&sys_min, &sys_max, &req));
 	igt_info("System min freq: %dMHz; max freq: %dMHz\n", sys_min, sys_max);
 
 	triangle_fill(frequencies, N_STEPS, sys_min, sys_max);
@@ -150,7 +151,8 @@ static void sysfs_range(int i915)
 		usleep(10000);
 
 		set_sysfs_freq(sys_freq, sys_freq);
-		get_sysfs_freq(&cur, &discard);
+		usleep(10000);
+		get_sysfs_freq(&cur, &discard, &req);
 
 		measured = measure_frequency(pmu, SAMPLE_PERIOD);
 		igt_debugfs_dump(i915, "i915_rps_boost_info");
@@ -158,9 +160,15 @@ static void sysfs_range(int i915)
 		set_sysfs_freq(sys_min, sys_max);
 		__igt_spin_free_idle(i915, spin);
 
-		igt_info("sysfs: Measured %.1fMHz, expected %dMhz\n",
-			 measured, cur);
-		pmu_assert(measured, cur);
+		igt_info("sysfs: Set %dMhz, measured %.1fMHz, expected %dMhz\n",
+			 sys_freq, measured, req);
+		/*
+		 * With GuC SLPC, FW uses requested freq as the efficient freq
+		 * which can exceed the max freq. Therefore compare requested
+		 * freq measured by the PMU not against the set freq's but
+		 * against the requested freq reported in sysfs
+		 */
+		pmu_assert(measured, req);
 	}
 	gem_quiescent_gpu(i915);
 
-- 
2.38.0
