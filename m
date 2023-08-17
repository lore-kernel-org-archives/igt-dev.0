Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF1A10E3F7
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Aug 2023 05:47:53 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 17 Aug 2023 11:23:00 +0530
Message-Id: <20230817055301.855960-3-riana.tauro@intel.com>
In-Reply-To: <20230817055301.855960-1-riana.tauro@intel.com>
References: <20230817055301.855960-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] tests/xe: Add a test to toggle GT C
 states and validate power
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

Add a test that toggles GT C states by checking if GT is in C0 when
forcewake is acquired and in C6 once released.
This test also validates power consumed by GPU in GT C6 is lesser
than GT C0.

v2: change test name (Suja, Anshuman)
v3: add exit handler for closing forcewake handle
    define a macro for number of repetitions (Vinay)
    change forcewake open to readonly (Anshuman)
    modify test to validate power

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/xe/xe_pm_residency.c | 67 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/tests/xe/xe_pm_residency.c b/tests/xe/xe_pm_residency.c
index fd4876eaf..3a6611fac 100644
--- a/tests/xe/xe_pm_residency.c
+++ b/tests/xe/xe_pm_residency.c
@@ -14,14 +14,17 @@
 
 #include "igt.h"
 #include "igt_device.h"
+#include "igt_power.h"
 #include "igt_sysfs.h"
 
 #include "xe/xe_query.h"
 #include "xe/xe_util.h"
 
+#define NUM_REPS 16 /* No of Repetitions */
 #define SLEEP_DURATION 3000 /* in milliseconds */
 
 const double tolerance = 0.1;
+int forcewake_handle = -1;
 
 #define assert_within_epsilon(x, ref, tol) \
 	igt_assert_f((double)(x) <= (1.0 + (tol)) * (double)(ref) && \
@@ -50,9 +53,19 @@ enum test_type {
  * Description: Validate idle residency measured over suspend(s2idle)
  *              is greater than suspend time or within tolerance
  * Run type: FULL
+ *
+ * SUBTEST: toggle-gt-c6
+ * Description: toggles GT C states by acquiring/releasing forcewake,
+ *		also validates power consumed by GPU in GT C6 is lesser than that of GT C0.
+ * Run type: FULL
  */
 IGT_TEST_DESCRIPTION("Tests for gtidle properties");
 
+static void restore(int sig)
+{
+	close(forcewake_handle);
+}
+
 static unsigned int measured_usleep(unsigned int usec)
 {
 	struct timespec ts = { };
@@ -117,6 +130,54 @@ static void test_idle_residency(int fd, int gt, enum test_type flag)
 	assert_within_epsilon(residency_end - residency_start, elapsed_ms, tolerance);
 }
 
+static void measure_power(struct igt_power *gpu, double *power)
+{
+	struct power_sample power_sample[2];
+
+	igt_power_get_energy(gpu, &power_sample[0]);
+	measured_usleep(SLEEP_DURATION * 1000);
+	igt_power_get_energy(gpu, &power_sample[1]);
+	*power = igt_power_get_mW(gpu, &power_sample[0], &power_sample[1]);
+}
+
+static void toggle_gt_c6(int fd, int n)
+{
+	double gt_c0_power, gt_c6_power;
+	int gt;
+	struct igt_power gpu;
+
+	igt_power_open(fd, &gpu, "gpu");
+
+	do {
+		forcewake_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
+		igt_assert(forcewake_handle >= 0);
+		/* check if all gts are in C0 after forcewake is acquired */
+		xe_for_each_gt(fd, gt)
+			igt_assert_f(!xe_is_gt_in_c6(fd, gt),
+				     "Forcewake acquired, GT should be in C0\n");
+
+		if (n == NUM_REPS)
+			measure_power(&gpu, &gt_c0_power);
+
+		close(forcewake_handle);
+		/* check if all gts are in C6 after forcewake is released */
+		xe_for_each_gt(fd, gt)
+			igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 1),
+				     "Forcewake released, GT should be in C6\n");
+
+		if (n == NUM_REPS)
+			measure_power(&gpu, &gt_c6_power);
+	} while (n--);
+
+	igt_power_close(&gpu);
+	igt_info("GPU consumed %fmW in GT C6 and %fmW in GT C0\n", gt_c6_power, gt_c0_power);
+
+	/* FIXME: Remove dgfx check after hwmon is added */
+	if (!xe_has_vram(fd))
+		igt_assert_f(gt_c6_power < gt_c0_power,
+			     "Power consumed in GT C6 should be lower than GT C0\n");
+}
+
 igt_main
 {
 	uint32_t d3cold_allowed;
@@ -152,6 +213,12 @@ igt_main
 		xe_for_each_gt(fd, gt)
 			test_idle_residency(fd, gt, TEST_IDLE);
 
+	igt_describe("Toggle GT C states by acquiring/releasing forcewake and validate power measured");
+	igt_subtest("toggle-gt-c6") {
+		igt_install_exit_handler(restore);
+		toggle_gt_c6(fd, NUM_REPS);
+	}
+
 	igt_fixture {
 		close(fd);
 	}
-- 
2.40.0
