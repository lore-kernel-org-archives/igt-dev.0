Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Tue, 16 Feb 2021 10:50:50 +0000
Message-Id: <20210216105050.309803-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/i915/perf_pmu: Subtest to measure
 sampling error for 100% busy
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Test that periodic reads of engine busyness against a constant 100% load
are within the 5000ppm tolerance when comparing perf timestamp versus
counter values.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 tests/i915/perf_pmu.c | 46 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 41 insertions(+), 5 deletions(-)

diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index 50b5c82bc472..728312be5293 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -26,6 +26,7 @@
 #include <stdio.h>
 #include <string.h>
 #include <fcntl.h>
+#include <float.h>
 #include <inttypes.h>
 #include <errno.h>
 #include <signal.h>
@@ -46,6 +47,7 @@
 #include "igt_perf.h"
 #include "igt_sysfs.h"
 #include "igt_pm.h"
+#include "igt_stats.h"
 #include "sw_sync.h"
 
 IGT_TEST_DESCRIPTION("Test the i915 pmu perf interface");
@@ -278,8 +280,11 @@ static void end_spin(int fd, igt_spin_t *spin, unsigned int flags)
 static void
 single(int gem_fd, const struct intel_execution_engine2 *e, unsigned int flags)
 {
+	unsigned int loops = flags & FLAG_LONG ? 20 : 1;
+	double err_min = DBL_MAX, err_max = -DBL_MAX;
 	unsigned long slept;
 	igt_spin_t *spin;
+	igt_stats_t s;
 	uint64_t val;
 	int fd;
 
@@ -290,11 +295,40 @@ single(int gem_fd, const struct intel_execution_engine2 *e, unsigned int flags)
 	else
 		spin = NULL;
 
-	val = pmu_read_single(fd);
-	slept = measured_usleep(batch_duration_ns / 1000);
-	if (flags & TEST_TRAILING_IDLE)
-		end_spin(gem_fd, spin, flags);
-	val = pmu_read_single(fd) - val;
+	igt_stats_init_with_size(&s, loops);
+
+	while (--loops) {
+		uint64_t ts[2];
+
+		val = __pmu_read_single(fd, &ts[0]);
+		slept = measured_usleep(batch_duration_ns / 1000);
+		if (flags & TEST_TRAILING_IDLE)
+			end_spin(gem_fd, spin, flags);
+		val = __pmu_read_single(fd, &ts[1]) - val;
+
+		if (flags & FLAG_LONG) {
+			unsigned long t = ts[1] - ts[0];
+			double err = (double)((long)val - (long)t) / t * 1e6;
+
+			igt_debug("time=%lu busy=%"PRIu64" error=%.2fppm\n",
+				  t, val, err);
+
+			igt_assert_f(fabs(err) <= 5000, "Error=%.2fppm\n", err);
+
+			if (err > err_max)
+				err_max = err;
+			if (err < err_min)
+				err_min = err;
+
+			igt_stats_push_float(&s, err);
+		}
+	}
+
+	if (flags & FLAG_LONG)
+		igt_info("error min=%.2fppm avg=%.2fppm max=%.2fppm\n",
+			 err_min, igt_stats_get_mean(&s), err_max);
+
+	igt_stats_fini(&s);
 
 	if (flags & FLAG_HANG)
 		igt_force_gpu_reset(gem_fd);
@@ -2126,6 +2160,8 @@ igt_main
 	 */
 	test_each_engine("busy", fd, e)
 		single(fd, e, TEST_BUSY);
+	test_each_engine("busy-accuracy", fd, e)
+		single(fd, e, TEST_BUSY | FLAG_LONG);
 	test_each_engine("busy-idle", fd, e)
 		single(fd, e, TEST_BUSY | TEST_TRAILING_IDLE);
 
-- 
2.27.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
