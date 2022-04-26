Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E89410E4D3
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Apr 2022 19:41:20 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 26 Apr 2022 12:41:11 -0700
Message-Id: <20220426194111.5990-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915_pm_freq_mult: New test for media
 freq factor
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

XEHPSDV and DG2/ATS-M allow media IP blocks to run at frequencies different
from the GT frequency. i915 exposes sysfs controls for these frequency
multipliers. IGT's introduced in this patch exercise and verify these
per-gt (gt/gtN) sysfs controls starting with the media freq factor (factor
and multiplier terms are used interchangeably).

v2: Added igt_describe's and s/igt_info/igt_debug/  (Kamil)
v3: Change test name from i915_pm_disag_freq to i915_pm_freq_mult (Kamil)
    Remove .defaults and media_RPx sysfs controls for first merege

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/i915_pm_freq_mult.c | 146 +++++++++++++++++++++++++++++++++
 tests/meson.build              |   8 ++
 2 files changed, 154 insertions(+)
 create mode 100644 tests/i915/i915_pm_freq_mult.c

diff --git a/tests/i915/i915_pm_freq_mult.c b/tests/i915/i915_pm_freq_mult.c
new file mode 100644
index 000000000000..f7ec74a9f897
--- /dev/null
+++ b/tests/i915/i915_pm_freq_mult.c
@@ -0,0 +1,146 @@
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
+IGT_TEST_DESCRIPTION(
+	"Tests for sysfs controls (or multipliers) for IP blocks which run at "
+	"frequencies different from the main GT frequency."
+);
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
+static void setup_freq(int gt, int dir)
+{
+	int rp0, rp1, rpn, min, max, act, media;
+
+	ctx = intel_ctx_create_all_physical(i915);
+	ahnd = get_reloc_ahnd(i915, ctx->id);
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
+	igt_debug("RP0 MHz: %d, RP1 MHz: %d, RPn MHz: %d, min MHz: %d, max MHz: %d, act MHz: %d\n", rp0, rp1, rpn, min, max, act);
+
+	if (igt_sysfs_has_attr(dir, "media_freq_factor")) {
+		media = igt_sysfs_get_u32(dir, "media_freq_factor");
+		igt_debug("media ratio: %.2f\n", media * FREQ_SCALE_FACTOR);
+	}
+}
+
+static void cleanup(int dir)
+{
+	igt_free_spins(i915);
+	put_ahnd(ahnd);
+	intel_ctx_destroy(i915, ctx);
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
+	igt_debug("media ratio value 0.0 represents dynamic mode\n");
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
+			igt_debug("Media ratio %.2f is not supported\n", v * scale);
+			continue;
+		}
+
+		wait_freq_set();
+
+		getv = igt_sysfs_get_u32(dir, "media_freq_factor");
+
+		igt_debug("media ratio set: %.2f, media ratio get: %.2f\n",
+			  v * scale, getv * scale);
+
+		/*
+		 * Skip validation in dynamic mode since the returned media
+		 * ratio and freq are platform dependent and not clearly defined
+		 */
+		if (v)
+			igt_assert_eq(getv, v);
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
+		/* Frequency multipliers are not simulated. */
+		igt_require(!igt_run_in_simulation());
+	}
+
+	igt_describe("Tests for media frequency factor sysfs");
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
index fb0f1e37f633..70c3c9118c3b 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -368,6 +368,14 @@ test_executables += executable('gem_mmap_offset',
 	   install : true)
 test_list += 'gem_mmap_offset'
 
+test_executables += executable('i915_pm_freq_mult',
+	   join_paths('i915', 'i915_pm_freq_mult.c'),
+	   dependencies : test_deps + [ lib_igt_perf ],
+	   install_dir : libexecdir,
+	   install_rpath : libexecdir_rpathdir,
+	   install : true)
+test_list += 'i915_pm_freq_mult'
+
 test_executables += executable('i915_pm_rc6_residency',
 	   join_paths('i915', 'i915_pm_rc6_residency.c'),
 	   dependencies : test_deps + [ lib_igt_perf ],
-- 
2.34.1
