Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/perf_pmu: Set defaults before frequency test
Date: Thu, 11 Jan 2024 14:20:54 -0800
Message-Id: <20240111222054.2403101-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Seeing random issues where this test skips due to invalid
boost freq at the start. Also ensure that we restore the frequencies at the end.

v2: Use save/restore functions instead of exit_handler. Adding an
exit_handler necessitated moving drm_close() into the handler. However,
the module-reload subtest at the end expects drm-fd to be closed.
Also setup expected frequencies (Kamil) and address other nits (Kamil)

Link: https://gitlab.freedesktop.org/drm/intel/-/issues/9432
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 tests/intel/perf_pmu.c | 62 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 61 insertions(+), 1 deletion(-)

diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index c6e6a8b77..4ae2b60ae 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -2454,12 +2454,69 @@ static void pmu_read(int i915)
 		for_each_if((e)->class == I915_ENGINE_CLASS_RENDER) \
 			igt_dynamic_f("%s", e->name)
 
+int fd = -1;
+uint32_t *stash_min, *stash_max, *stash_boost;
+
+static void save_sysfs_freq(int i915)
+{
+	int gt, num_gts, sysfs, tmp;
+	uint32_t rpn_freq, rp0_freq;
+
+	num_gts = igt_sysfs_get_num_gt(i915);
+
+	stash_min = (uint32_t *)malloc(sizeof(uint32_t) * num_gts);
+	stash_max = (uint32_t *)malloc(sizeof(uint32_t) * num_gts);
+	stash_boost = (uint32_t *)malloc(sizeof(uint32_t) * num_gts);
+
+	/* Save boost, min and max across GTs */
+	i915_for_each_gt(i915, tmp, gt) {
+		sysfs = igt_sysfs_gt_open(i915, gt);
+		igt_require(sysfs >= 0);
+
+		stash_min[gt] = igt_sysfs_get_u32(sysfs, "rps_min_freq_mhz");
+		stash_max[gt] = igt_sysfs_get_u32(sysfs, "rps_max_freq_mhz");
+		stash_boost[gt] = igt_sysfs_get_u32(sysfs, "rps_boost_freq_mhz");
+		igt_debug("GT: %d, min: %d, max: %d, boost:%d\n",
+			  gt, stash_min[gt], stash_max[gt], stash_boost[gt]);
+
+		rpn_freq = igt_sysfs_get_u32(sysfs, "rps_RPn_freq_mhz");
+		rp0_freq = igt_sysfs_get_u32(sysfs, "rps_RP0_freq_mhz");
+
+		/* Set pre-conditions, in case frequencies are in non-default state */
+		igt_require(__igt_sysfs_set_u32(sysfs, "rps_max_freq_mhz", rp0_freq));
+		igt_require(__igt_sysfs_set_u32(sysfs, "rps_boost_freq_mhz", rp0_freq));
+		igt_require(__igt_sysfs_set_u32(sysfs, "rps_min_freq_mhz", rpn_freq));
+
+		close(sysfs);
+	}
+}
+
+static void restore_sysfs_freq(int i915)
+{
+	int sysfs, gt, tmp;
+
+	/* Restore frequencies */
+	i915_for_each_gt(fd, tmp, gt) {
+		sysfs = igt_sysfs_gt_open(fd, gt);
+		igt_require(sysfs >= 0);
+
+		igt_require(__igt_sysfs_set_u32(sysfs, "rps_max_freq_mhz", stash_max[gt]));
+		igt_require(__igt_sysfs_set_u32(sysfs, "rps_min_freq_mhz", stash_min[gt]));
+		igt_require(__igt_sysfs_set_u32(sysfs, "rps_boost_freq_mhz", stash_boost[gt]));
+
+		close(sysfs);
+	}
+	free(stash_min);
+	free(stash_max);
+	free(stash_boost);
+}
+
 igt_main
 {
 	const struct intel_execution_engine2 *e;
 	unsigned int num_engines = 0;
 	const intel_ctx_t *ctx = NULL;
-	int gt, tmp, fd = -1;
+	int gt, tmp;
 	int num_gt = 0;
 
 	/**
@@ -2664,12 +2721,15 @@ igt_main
 	 * Test GPU frequency.
 	 */
 	igt_subtest_with_dynamic("frequency") {
+		save_sysfs_freq(fd);
+
 		i915_for_each_gt(fd, tmp, gt) {
 			igt_dynamic_f("gt%u", gt)
 				test_frequency(fd, gt);
 			igt_dynamic_f("idle-gt%u", gt)
 				test_frequency_idle(fd, gt);
 		}
+		restore_sysfs_freq(fd);
 	}
 
 	/**
-- 
2.38.1
