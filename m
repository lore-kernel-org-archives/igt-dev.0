Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EBB010E234
 for <igt-dev@lists.freedesktop.org>; Sat, 14 Jan 2023 05:04:20 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 13 Jan 2023 21:04:15 -0800
Message-Id: <20230114050415.554933-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] i915/i915_hwmon: Measure dGfx power with
 hwmon
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

In several instances (e.g. when investigating GPU power limits) it is very
useful to be able to measure GPU power easily. Since we already have all
ingridients for doing so, add a couple of hwmon tests to measure dGfx power
when idle and power under load.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/i915_hwmon.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tests/i915/i915_hwmon.c b/tests/i915/i915_hwmon.c
index 6d9937e99dc..111a589bd91 100644
--- a/tests/i915/i915_hwmon.c
+++ b/tests/i915/i915_hwmon.c
@@ -6,11 +6,40 @@
 #include <dirent.h>
 #include <sys/stat.h>
 #include "igt.h"
+#include "i915/gem.h"
+#include "igt_power.h"
 #include "igt_hwmon.h"
 #include "igt_sysfs.h"
 
 IGT_TEST_DESCRIPTION("Tests for i915 hwmon");
 
+static void hwmon_power(int i915, bool load)
+{
+	const intel_ctx_t *ctx = intel_ctx_create_all_physical(i915);
+	struct power_sample sample[2];
+	int sleep_duration_sec = 3;
+	struct igt_power gpu;
+	igt_spin_t *spin;
+
+	gem_quiescent_gpu(i915);
+	if (load) {
+		spin = igt_spin_new(i915, .ctx = ctx, .engine = ALL_ENGINES,
+				    .flags = IGT_SPIN_POLL_RUN);
+		/* Wait till at least one spinner starts */
+		igt_spin_busywait_until_started(spin);
+	}
+
+	igt_assert(!igt_power_open(i915, &gpu, "gpu"));
+	igt_power_get_energy(&gpu, &sample[0]);
+	usleep(sleep_duration_sec * USEC_PER_SEC);
+	igt_power_get_energy(&gpu, &sample[1]);
+	igt_info("Measured power: %g mW\n", igt_power_get_mW(&gpu, &sample[0], &sample[1]));
+
+	igt_power_close(&gpu);
+	igt_free_spins(i915);
+	intel_ctx_destroy(i915, ctx);
+}
+
 static void hwmon_read(int hwm)
 {
 	struct dirent *de;
@@ -81,6 +110,16 @@ igt_main
 		hwmon_write(hwm);
 	}
 
+	igt_describe("Measure idle power using hwmon");
+	igt_subtest("hwmon-power-idle") {
+		hwmon_power(fd, false);
+	}
+
+	igt_describe("Measure power with load using hwmon");
+	igt_subtest("hwmon-power-busy") {
+		hwmon_power(fd, true);
+	}
+
 	igt_fixture {
 		close(hwm);
 		close(fd);
-- 
2.38.0
