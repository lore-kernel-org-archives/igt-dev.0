Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B9F10E895
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Jan 2023 03:43:28 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 18 Jan 2023 19:43:17 -0800
Message-Id: <20230119034317.172000-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tools/intel_gpu_power: Intel GPU idle/busy
 power measurement
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

In several instances (e.g. when investigating GPU power limits) it is very
useful to be able to measure GPU power easily. Since we already have all
ingredients for doing so, add a tool to measure Intel GPU power when idle
and power under load.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tools/intel_gpu_power.c | 60 +++++++++++++++++++++++++++++++++++++++++
 tools/meson.build       |  5 ++++
 2 files changed, 65 insertions(+)
 create mode 100644 tools/intel_gpu_power.c

diff --git a/tools/intel_gpu_power.c b/tools/intel_gpu_power.c
new file mode 100644
index 00000000000..ae5285e1a85
--- /dev/null
+++ b/tools/intel_gpu_power.c
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
+IGT_TEST_DESCRIPTION("Intel gpu power measurement");
+
+static void measure_power(int i915, const char *domain, bool load)
+{
+	const intel_ctx_t *ctx = intel_ctx_create_all_physical(i915);
+	struct power_sample sample[2];
+	int sleep_duration_sec = 2;
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
+	igt_subtest("idle") {
+		measure_power(i915, "gpu", false);
+	}
+
+	igt_describe("Measure gpu power with load");
+	igt_subtest("busy") {
+		measure_power(i915, "gpu", true);
+	}
+
+	igt_fixture {
+		close(i915);
+	}
+}
diff --git a/tools/meson.build b/tools/meson.build
index d2defec8703..e0058940ce0 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -84,6 +84,11 @@ install_data('intel_gpu_abrt', install_dir : bindir)
 
 install_subdir('registers', install_dir : datadir)
 
+executable('intel_gpu_power', 'intel_gpu_power.c',
+	   install : true,
+	   install_rpath : bindir_rpathdir,
+	   dependencies : [lib_igt,cairo])
+
 executable('intel_gpu_top', 'intel_gpu_top.c',
 	   install : true,
 	   install_rpath : bindir_rpathdir,
-- 
2.38.0
