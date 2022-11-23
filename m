Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A55F10E63C
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Nov 2022 21:18:34 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 23 Nov 2022 13:18:30 -0800
Message-Id: <20221123211830.630263-3-ashutosh.dixit@intel.com>
In-Reply-To: <20221123211830.630263-1-ashutosh.dixit@intel.com>
References: <20221123211830.630263-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/gem_ctx_freq: Compare against
 requested freq
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

With SLPC, even when we set the same min and max freq's, the requested and
actual freq's can differ from the min/max freq set. For example "efficient
freq" (when in effect) can override set min/max freq. In general FW is the
final arbiter in determining freq and can override set values.

Therefore compare the requested freq reported by PMU not against the set
freq's but against the requested freq reported in sysfs. Also add a delay
after setting freq's to account for messaging delays in setting freq's in
GuC.

Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/6786
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_ctx_freq.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/tests/i915/gem_ctx_freq.c b/tests/i915/gem_ctx_freq.c
index a29fe68b72e..cc2e0505a41 100644
--- a/tests/i915/gem_ctx_freq.c
+++ b/tests/i915/gem_ctx_freq.c
@@ -104,23 +104,28 @@ static void triangle_fill(uint32_t *t, unsigned int nstep,
 	}
 }
 
+/* Wait for GuC SLPC freq changes to take effect */
+#define wait_freq_set()		usleep(100000)
+
 static void set_sysfs_freq(uint32_t min, uint32_t max)
 {
 	igt_sysfs_printf(sysfs, "gt_min_freq_mhz", "%u", min);
 	igt_sysfs_printf(sysfs, "gt_max_freq_mhz", "%u", max);
+	wait_freq_set();
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
@@ -133,7 +138,7 @@ static void sysfs_range(int i915)
 	 * constriained sysfs range.
 	 */
 
-	igt_require(get_sysfs_freq(&sys_min, &sys_max));
+	igt_require(get_sysfs_freq(&sys_min, &sys_max, &req));
 	igt_info("System min freq: %dMHz; max freq: %dMHz\n", sys_min, sys_max);
 
 	triangle_fill(frequencies, N_STEPS, sys_min, sys_max);
@@ -150,7 +155,7 @@ static void sysfs_range(int i915)
 		usleep(10000);
 
 		set_sysfs_freq(sys_freq, sys_freq);
-		get_sysfs_freq(&cur, &discard);
+		get_sysfs_freq(&cur, &discard, &req);
 
 		measured = measure_frequency(pmu, SAMPLE_PERIOD);
 		igt_debugfs_dump(i915, "i915_rps_boost_info");
@@ -159,8 +164,8 @@ static void sysfs_range(int i915)
 		__igt_spin_free_idle(i915, spin);
 
 		igt_info("sysfs: Measured %.1fMHz, expected %dMhz\n",
-			 measured, cur);
-		pmu_assert(measured, cur);
+			 measured, req);
+		pmu_assert(measured, req);
 	}
 	gem_quiescent_gpu(i915);
 
-- 
2.38.0
