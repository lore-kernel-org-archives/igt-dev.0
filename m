Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BAC710E760
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Sep 2023 06:02:43 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  7 Sep 2023 11:36:37 +0530
Message-Id: <20230907060638.2317485-2-riana.tauro@intel.com>
In-Reply-To: <20230907060638.2317485-1-riana.tauro@intel.com>
References: <20230907060638.2317485-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/intel/xe_guc_pc: Add freq_power
 test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

An assumption is that at lower frequencies,
not only do we run slower, but we save power compared to
higher frequencies.

This test runs a spinner and sets the min and max frequencies
to rp0 and rpn respectively. It then checks if power measured
at lower frequencies is lesser.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_guc_pc.c | 88 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/tests/intel/xe_guc_pc.c b/tests/intel/xe_guc_pc.c
index 032816921..cea7b56fd 100644
--- a/tests/intel/xe_guc_pc.c
+++ b/tests/intel/xe_guc_pc.c
@@ -13,6 +13,7 @@
 
 #include "igt.h"
 #include "lib/igt_syncobj.h"
+#include "igt_power.h"
 #include "igt_sysfs.h"
 
 #include "xe_drm.h"
@@ -387,6 +388,82 @@ static void test_reset(int fd, int gt_id, int cycles)
 	}
 }
 
+static int cmp_u64(const void *a, const void *b)
+{
+	return (*(u64 *)a - *(u64 *)b);
+}
+
+static uint64_t measure_power(int fd, struct igt_power *gpu)
+{
+	struct power_sample sample[2];
+	uint64_t power[5];
+
+	for (int i = 0; i < 5; i++) {
+		igt_power_get_energy(gpu, &sample[0]);
+		usleep(10000); /* 10 ms */
+		igt_power_get_energy(gpu, &sample[1]);
+
+		power[i] = igt_power_get_mW(gpu, &sample[0], &sample[1]);
+	}
+	/* Sort in ascending order and use a triangular filter */
+	qsort(power, 5, sizeof(*power), cmp_u64);
+	return DIV_ROUND_UP(power[1] + 2 * power[2] + power[3], 4);
+}
+
+/**
+ * SUBTEST: freq_power
+ * Description: Validates if running at lower frequencies saves power
+ * Run type: FULL
+ */
+static void test_freq_power(int fd, int gt_id, struct drm_xe_engine_class_instance *hwe)
+{
+	uint32_t rp0, rpn, vm;
+	uint64_t ahnd;
+	struct igt_power gpu;
+	struct {
+		uint64_t power;
+		uint32_t freq;
+	} min, max;
+	igt_spin_t *spin;
+
+	/* Run for engines belonging to the gt */
+	if (gt_id != hwe->gt_id)
+		return;
+
+	igt_power_open(fd, &gpu, "gpu");
+
+	rpn = get_freq(fd, gt_id, "rpn");
+	rp0 = get_freq(fd, gt_id, "rp0");
+
+	vm = xe_vm_create(fd, 0, 0);
+	ahnd = intel_allocator_open(fd, vm, INTEL_ALLOCATOR_RELOC);
+	spin = igt_spin_new(fd, .ahnd = ahnd, .vm = vm, .hwe = hwe);
+
+	igt_assert(set_freq(fd, gt_id, "min", rpn) > 0);
+	igt_assert(set_freq(fd, gt_id, "max", rpn) > 0);
+	min.freq = get_freq(fd, gt_id, "act");
+	min.power = measure_power(fd, &gpu);
+
+	igt_assert(set_freq(fd, gt_id, "min", rp0) > 0);
+	igt_assert(set_freq(fd, gt_id, "max", rp0) > 0);
+	max.freq = get_freq(fd, gt_id, "act");
+	max.power = measure_power(fd, &gpu);
+
+	igt_info("Engine %s:%d  min:%lumW @ %uMHz, max:%lumW @ %uMHz\n",
+		 xe_engine_class_string(hwe->engine_class), hwe->engine_instance,
+		 min.power, min.freq, max.power, max.freq);
+
+	igt_spin_free(fd, spin);
+	put_ahnd(ahnd);
+	xe_vm_destroy(fd, vm);
+	igt_power_close(&gpu);
+
+	/* Max power should be greater than min power + 10% of min power */
+	igt_assert_f((11 * min.power < 10 * max.power),
+		     "%s:%d did not conserve power when setting lower frequency!\n",
+		     xe_engine_class_string(hwe->engine_class), hwe->engine_instance);
+}
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -475,6 +552,17 @@ igt_main
 		}
 	}
 
+	igt_describe("Validates power measured at lower frequencies");
+	igt_subtest("freq_power") {
+		/* FIXME: Remove skip once hwmon is added */
+		igt_skip_on(xe_has_vram(fd));
+		xe_for_each_gt(fd, gt) {
+			xe_for_each_hw_engine(fd, hwe) {
+				test_freq_power(fd, gt, hwe);
+			}
+		}
+	}
+
 	igt_fixture {
 		xe_for_each_gt(fd, gt) {
 			set_freq(fd, gt, "min", stash_min);
-- 
2.40.0
