Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B46810E8A8
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Jan 2023 05:05:04 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 18 Jan 2023 21:01:47 -0800
Message-Id: <20230119050147.174098-1-ashutosh.dixit@intel.com>
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
Cc: Badal Nilawar <badal.nilawar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

In several instances (e.g. when investigating GPU power limits) it is very
useful to be able to measure GPU power easily. Since we already have all
ingredients for doing so, add a tool to measure Intel GPU power when idle
and power under load.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tools/intel_gpu_power.c | 73 +++++++++++++++++++++++++++++++++++++++++
 tools/meson.build       |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 tools/intel_gpu_power.c

diff --git a/tools/intel_gpu_power.c b/tools/intel_gpu_power.c
new file mode 100644
index 00000000000..3f73e10bf60
--- /dev/null
+++ b/tools/intel_gpu_power.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#include "igt.h"
+#include "i915/gem.h"
+#include "igt_power.h"
+
+static int measure_power(int i915, const char *domain, bool load)
+{
+	const intel_ctx_t *ctx = intel_ctx_create_all_physical(i915);
+	int ret, sleep_duration_sec = 2;
+	struct power_sample sample[2];
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
+	ret = igt_power_open(i915, &pwr, domain);
+	if (ret)
+		return ret;
+	igt_power_get_energy(&pwr, &sample[0]);
+	usleep(sleep_duration_sec * USEC_PER_SEC);
+	igt_power_get_energy(&pwr, &sample[1]);
+	igt_info("Measured power: %g mW\n", igt_power_get_mW(&pwr, &sample[0], &sample[1]));
+
+	igt_power_close(&pwr);
+	igt_free_spins(i915);
+	intel_ctx_destroy(i915, ctx);
+
+	return 0;
+}
+
+static void usage(const char *name)
+{
+	igt_info("Usage: %s [options]\n", name);
+	igt_info("-i/--idle  Measure idle power\n");
+	igt_info("-b/--busy  Measure power under load\n");
+}
+
+int main(int argc, char *argv[])
+{
+	int i915 = drm_open_driver_master(DRIVER_INTEL);
+	static struct option long_options[] = {
+		{"idle", 0, 0, 'i'},
+		{"busy", 0, 0, 'b'},
+		{ 0, 0, 0, 0 }
+	};
+	int opt = getopt_long(argc, argv, "ib", long_options, NULL);
+	int ret = 0;
+
+	switch (opt) {
+	case 'i':
+		ret = measure_power(i915, "gpu", false);
+		break;
+	case 'b':
+		ret = measure_power(i915, "gpu", true);
+		break;
+	default:
+		usage(argv[0]);
+		break;
+	}
+
+	close(i915);
+	return ret;
+}
diff --git a/tools/meson.build b/tools/meson.build
index d2defec8703..4bbbd993cac 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -22,6 +22,7 @@ tools_progs = [
 	'intel_error_decode',
 	'intel_forcewaked',
 	'intel_gpu_frequency',
+	'intel_gpu_power',
 	'intel_firmware_decode',
 	'intel_framebuffer_dump',
 	'intel_gpu_time',
-- 
2.38.0
