Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D342C10E32A
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jan 2023 19:03:26 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 Jan 2023 11:03:17 -0800
Message-Id: <20230117190317.17728-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] i915/i915_power: Measure GPU idle/busy power
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
ingredients for doing so, add a couple of tests to measure GPU power when
idle and power under load.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/i915_power.c | 60 +++++++++++++++++++++++++++++++++++++++++
 tests/meson.build       |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 tests/i915/i915_power.c

diff --git a/tests/i915/i915_power.c b/tests/i915/i915_power.c
new file mode 100644
index 00000000000..74c5a4ba4af
--- /dev/null
+++ b/tests/i915/i915_power.c
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#include "igt.h"
+#include "i915/gem.h"
+#include "igt_power.h"
+
+IGT_TEST_DESCRIPTION("i915 power measurement/tests");
+
+static void measure_power(int i915, const char *domain, bool load)
+{
+	const intel_ctx_t *ctx = intel_ctx_create_all_physical(i915);
+	struct power_sample sample[2];
+	int sleep_duration_sec = 3;
+	struct igt_power pwr;
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
+	igt_require(!igt_power_open(i915, &pwr, domain));
+	igt_power_get_energy(&pwr, &sample[0]);
+	usleep(sleep_duration_sec * USEC_PER_SEC);
+	igt_power_get_energy(&pwr, &sample[1]);
+	igt_info("Measured power: %g mW\n", igt_power_get_mW(&pwr, &sample[0], &sample[1]));
+
+	igt_power_close(&pwr);
+	igt_free_spins(i915);
+	intel_ctx_destroy(i915, ctx);
+}
+
+igt_main
+{
+	int i915;
+
+	igt_fixture {
+		i915 = drm_open_driver_master(DRIVER_INTEL);
+	}
+
+	igt_describe("Measure idle gpu power");
+	igt_subtest("gpu-idle") {
+		measure_power(i915, "gpu", false);
+	}
+
+	igt_describe("Measure gpu power with load");
+	igt_subtest("gpu-busy") {
+		measure_power(i915, "gpu", true);
+	}
+
+	igt_fixture {
+		close(i915);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index e20a864035b..e0f41e9e6a1 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -212,6 +212,7 @@ i915_progs = [
 	'i915_pm_dc',
 	'i915_pm_rps',
 	'i915_pm_sseu',
+	'i915_power',
 	'i915_query',
 	'i915_selftest',
 	'i915_suspend',
-- 
2.38.0
