Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10EC910E3F6
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Jan 2023 06:25:08 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 26 Jan 2023 22:25:01 -0800
Message-Id: <20230127062502.134917-2-ashutosh.dixit@intel.com>
In-Reply-To: <20230127062502.134917-1-ashutosh.dixit@intel.com>
References: <20230127062502.134917-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] i915/i915_power: Sanity check power
 measurement
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

Add a test to sanity check power measurement on integrated/discrete by
requiring power under load to be > 0 and >= idle power.

v2: Code reorganization (Kamil K)

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/i915/i915_power.c | 80 +++++++++++++++++++++++++++++++++++++++++
 tests/meson.build       |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 tests/i915/i915_power.c

diff --git a/tests/i915/i915_power.c b/tests/i915/i915_power.c
new file mode 100644
index 00000000000..00993cdc846
--- /dev/null
+++ b/tests/i915/i915_power.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "igt.h"
+#include "i915/gem.h"
+#include "igt_power.h"
+
+IGT_TEST_DESCRIPTION("i915 power measurement tests");
+
+static double get_power(struct igt_power *pwr, const char *domain)
+{
+	const int sleep_duration_sec = 2;
+	struct power_sample sample[2];
+
+	igt_power_get_energy(pwr, &sample[0]);
+	usleep(sleep_duration_sec * USEC_PER_SEC);
+	igt_power_get_energy(pwr, &sample[1]);
+
+	return igt_power_get_mW(pwr, &sample[0], &sample[1]);
+}
+
+static double measure_power(int i915, struct igt_power *pwr,
+			    const char *domain, bool load)
+{
+	const intel_ctx_t *ctx = intel_ctx_create_all_physical(i915);
+	uint64_t ahnd = get_reloc_ahnd(i915, ctx->id);
+	igt_spin_t *spin;
+	double mW;
+
+	gem_quiescent_gpu(i915);
+	if (load) {
+		spin = igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
+				    .engine = ALL_ENGINES,
+				    .flags = IGT_SPIN_POLL_RUN);
+		/* Wait till at least one spinner starts */
+		igt_spin_busywait_until_started(spin);
+	}
+
+	mW = get_power(pwr, domain);
+	igt_info("Domain: %s, Load: %d, Measured power: %g mW\n", domain, load, mW);
+
+	igt_free_spins(i915);
+	put_ahnd(ahnd);
+	intel_ctx_destroy(i915, ctx);
+
+	return mW;
+}
+
+static void sanity(int i915, const char *domain)
+{
+	struct igt_power pwr;
+	double idle, busy;
+
+	igt_require(!igt_power_open(i915, &pwr, domain));
+	idle = measure_power(i915, &pwr, domain, false);
+	busy = measure_power(i915, &pwr, domain, true);
+	igt_power_close(&pwr);
+
+	igt_assert(idle >= 0 && busy > 0 && busy >= idle);
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
+	igt_describe("Sanity check power measurement");
+	igt_subtest("sanity") {
+		sanity(i915, "gpu");
+	}
+
+	igt_fixture {
+		close(i915);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index cce9d89e1c8..d93a07c9ed6 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -213,6 +213,7 @@ i915_progs = [
 	'i915_pm_dc',
 	'i915_pm_rps',
 	'i915_pm_sseu',
+	'i915_power',
 	'i915_query',
 	'i915_selftest',
 	'i915_suspend',
-- 
2.38.0
