Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D718510E0E7
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Apr 2022 17:27:54 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 13 Apr 2022 10:27:47 -0700
Message-Id: <56489bfdb52ce5391b51f1e2b3f3bbd9a08e47cf.1649870633.git.ashutosh.dixit@intel.com>
In-Reply-To: <deb07be64c3930945a0e7bd17989fda4ed2e5ece.1649870633.git.ashutosh.dixit@intel.com>
References: <deb07be64c3930945a0e7bd17989fda4ed2e5ece.1649870633.git.ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/i915_pm_disag_freq: New test for
 media freq factor
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

XEHPSDV and DG2/ATS-M allow media IP blocks to run at frequencies different
from the GT frequency. i915 exposes sysfs controls for this frequency
"disaggregation". IGT's introduced in this patch exercise and verify these
per-gt (gt/gtN) sysfs attributes.

Further, RPS defaults exposed in gt/gtN/.defaults sysfs directory are used
in the test to start and complete in the known default state.

Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/i915_pm_disag_freq.c | 182 ++++++++++++++++++++++++++++++++
 tests/meson.build               |   8 ++
 2 files changed, 190 insertions(+)
 create mode 100644 tests/i915/i915_pm_disag_freq.c

diff --git a/tests/i915/i915_pm_disag_freq.c b/tests/i915/i915_pm_disag_freq.c
new file mode 100644
index 000000000000..596ac9e8fd24
--- /dev/null
+++ b/tests/i915/i915_pm_disag_freq.c
@@ -0,0 +1,182 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <fcntl.h>
+
+#include "i915/gem.h"
+#include "igt.h"
+#include "igt_sysfs.h"
+
+#define FREQ_SCALE_FACTOR	0.00390625f	/* 1.0f / 256 */
+
+/*
+ * Firmware interfaces are not completely synchronous, a delay is needed
+ * before the requested freq is actually set.
+ * Media ratio read back after set will mismatch if this value is too small
+ */
+#define wait_freq_set()	usleep(100000)
+
+static int i915 = -1;
+const intel_ctx_t *ctx;
+uint64_t ahnd;
+
+static void spin_all(void)
+{
+	igt_spin_t *spin = igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx, .engine = ALL_ENGINES,
+					.flags = IGT_SPIN_POLL_RUN);
+
+	/* Wait till at least one spinner starts */
+	igt_spin_busywait_until_started(spin);
+}
+
+static void restore_rps_defaults(int dir)
+{
+	int def, min, max, media;
+
+	/* Read from gt/gtN/.defaults/ write to gt/gtN/ */
+	def = openat(dir, ".defaults", O_RDONLY);
+	if (def <= 0)
+		return;
+
+	max = igt_sysfs_get_u32(def, "rps_max_freq_mhz");
+	igt_sysfs_set_u32(dir, "rps_max_freq_mhz", max);
+
+	min = igt_sysfs_get_u32(def, "rps_min_freq_mhz");
+	igt_sysfs_set_u32(dir, "rps_min_freq_mhz", min);
+
+	if (igt_sysfs_has_attr(dir, "media_freq_factor")) {
+		media = igt_sysfs_get_u32(def, "media_freq_factor");
+		igt_sysfs_set_u32(dir, "media_freq_factor", media);
+	}
+
+	close(def);
+}
+
+static void __restore_rps_defaults(int sig)
+{
+	int dir, gt;
+
+	for_each_sysfs_gt_dirfd(i915, dir, gt)
+		restore_rps_defaults(dir);
+}
+
+static void setup_freq(int gt, int dir)
+{
+	int rp0, rp1, rpn, min, max, act, media;
+
+	ctx = intel_ctx_create_all_physical(i915);
+	ahnd = get_reloc_ahnd(i915, ctx->id);
+
+	/* Reset to known state */
+	restore_rps_defaults(dir);
+
+	/* Spin on all engines to jack freq up to max */
+	spin_all();
+	wait_freq_set();
+
+	/* Print some debug information */
+	rp0 = igt_sysfs_get_u32(dir, "rps_RP0_freq_mhz");
+	rp1 = igt_sysfs_get_u32(dir, "rps_RP1_freq_mhz");
+	rpn = igt_sysfs_get_u32(dir, "rps_RPn_freq_mhz");
+	min = igt_sysfs_get_u32(dir, "rps_min_freq_mhz");
+	max = igt_sysfs_get_u32(dir, "rps_max_freq_mhz");
+	act = igt_sysfs_get_u32(dir, "rps_act_freq_mhz");
+
+	igt_info("RP0 mhz: %d, RP1 mhz: %d, RPn mhz: %d, min mhz: %d, max mhz: %d, act mhz: %d\n", rp0, rp1, rpn, min, max, act);
+
+	if (igt_sysfs_has_attr(dir, "media_freq_factor")) {
+		media = igt_sysfs_get_u32(dir, "media_freq_factor");
+		igt_info("media ratio: %.2f\n", media * FREQ_SCALE_FACTOR);
+	}
+}
+
+static void cleanup(int dir)
+{
+	igt_free_spins(i915);
+	put_ahnd(ahnd);
+	intel_ctx_destroy(i915, ctx);
+	restore_rps_defaults(dir);
+	gem_quiescent_gpu(i915);
+}
+
+static void media_freq(int gt, int dir)
+{
+	float scale;
+
+	igt_require(igt_sysfs_has_attr(dir, "media_freq_factor"));
+
+	igt_sysfs_scanf(dir, "media_freq_factor.scale", "%g", &scale);
+	igt_assert_eq(scale, FREQ_SCALE_FACTOR);
+
+	setup_freq(gt, dir);
+
+	igt_info("media RP0 mhz: %d, media RPn mhz: %d\n",
+		 igt_sysfs_get_u32(dir, "media_RP0_freq_mhz"),
+		 igt_sysfs_get_u32(dir, "media_RPn_freq_mhz"));
+	igt_info("media ratio value 0.0 represents dynamic mode\n");
+
+	/*
+	 * Media freq ratio modes supported are: dynamic (0), 1:2 (128) and
+	 * 1:1 (256). Setting dynamic (0) can return any of the three
+	 * modes. Fixed ratio modes should return the same value.
+	 */
+	for (int v = 256; v >= 0; v -= 64) {
+		int getv, ret;
+
+		/*
+		 * Check that we can set the mode. Ratios other than 1:2
+		 * and 1:1 are not supported.
+		 */
+		ret = igt_sysfs_printf(dir, "media_freq_factor", "%u", v);
+		if (ret <= 0) {
+			igt_info("Media ratio %.2f is not supported\n", v * scale);
+			continue;
+		}
+
+		wait_freq_set();
+
+		getv = igt_sysfs_get_u32(dir, "media_freq_factor");
+
+		igt_info("media ratio set: %.2f, media ratio get: %.2f\n",
+			 v * scale, getv * scale);
+
+		/*
+		 * Skip validation in dynamic mode since the returned media
+		 * ratio and freq are platform dependent and not clearly defined
+		 */
+		if (!v)
+			continue;
+
+		igt_assert_eq(getv, v);
+	}
+
+	cleanup(dir);
+}
+
+igt_main
+{
+	int dir, gt;
+
+	igt_fixture {
+		i915 = drm_open_driver(DRIVER_INTEL);
+
+		/* Disag multipliers (aka "frequency factors") are not simulated. */
+		igt_require(!igt_run_in_simulation());
+		igt_install_exit_handler(__restore_rps_defaults);
+	}
+
+	igt_subtest_with_dynamic("media-freq") {
+		for_each_sysfs_gt_dirfd(i915, dir, gt) {
+			igt_dynamic_f("gt%d", gt)
+				media_freq(gt, dir);
+		}
+	}
+
+	igt_fixture {
+		close(i915);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 7261e9aa2950..cd89defbb418 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -356,6 +356,14 @@ test_executables += executable('gem_mmap_offset',
 	   install : true)
 test_list += 'gem_mmap_offset'
 
+test_executables += executable('i915_pm_disag_freq',
+	   join_paths('i915', 'i915_pm_disag_freq.c'),
+	   dependencies : test_deps + [ lib_igt_perf ],
+	   install_dir : libexecdir,
+	   install_rpath : libexecdir_rpathdir,
+	   install : true)
+test_list += 'i915_pm_disag_freq'
+
 test_executables += executable('i915_pm_rc6_residency',
 	   join_paths('i915', 'i915_pm_rc6_residency.c'),
 	   dependencies : test_deps + [ lib_igt_perf ],
-- 
2.34.1
