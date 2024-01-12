Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B12410E6D1
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jan 2024 02:20:48 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH] tests/intel/perf_pmu: Add a test to repro NPD during FLR
Date: Fri, 12 Jan 2024 02:20:38 +0000
Message-Id: <20240112022038.16485-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Open a PMU event (actual-frequency) and then do an unbind, followed by a bind.
This is causing NPD during bind.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/perf_pmu.c | 60 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index c6e6a8b77..06b02e18a 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -249,6 +249,11 @@
  * Description: Test the i915 pmu perf interface
  * Feature: i915 pmu perf interface, pmu
  * Test category: Perf
+ *
+ * SUBTEST: npd
+ * Description: Test null pointer dereference case
+ * Feature: i915 pmu perf interface, pmu
+ * Test category: Perf
  */
 
 IGT_TEST_DESCRIPTION("Test the i915 pmu perf interface");
@@ -2417,6 +2422,58 @@ static void test_unload(unsigned int num_engines)
 	igt_assert_eq(__igt_i915_driver_unload(NULL), 0);
 }
 
+static int sysfs_driver(int i915)
+{
+	int dir, drv;
+
+	dir = igt_sysfs_open(i915);
+	igt_assert(dir != -1);
+
+	drv = openat(dir, "device/driver", O_DIRECTORY);
+	close(dir);
+
+	igt_assert(drv != -1);
+	return drv;
+}
+
+static void test_npd(void)
+{
+	struct pci_device *pdev;
+	int fd, i915, drv;
+	char *snd = NULL;
+	char addr[80];
+	uint64_t val;
+
+	i915 = __drm_open_driver(DRIVER_INTEL);
+	pdev = igt_device_get_pci_device(i915);
+
+	snprintf(addr, sizeof(addr), "%04x:%02x:%02x.%d",
+		 pdev->domain, pdev->bus, pdev->dev, pdev->func);
+	igt_debug("Opened %s\n", addr);
+
+	fd = open_pmu(i915, I915_PMU_ACTUAL_FREQUENCY);
+
+	drv = sysfs_driver(i915);
+	close(i915);
+
+	igt_audio_driver_unload(&snd);
+
+	val = pmu_read_single(fd);
+
+	igt_set_timeout(30, "Driver unbind timeout!");
+	igt_assert_f(igt_sysfs_set(drv, "unbind", addr),
+		     "Driver unbind failure (%s)!\n", addr);
+	igt_reset_timeout();
+
+	igt_set_timeout(30, "Driver bind timeout!");
+	igt_assert_f(igt_sysfs_set(drv, "bind", addr),
+		     "Driver bind failure (%s)!\n", addr);
+	igt_reset_timeout();
+
+	close(drv);
+	close(fd);
+}
+
 static void pmu_read(int i915)
 {
 	char val[128];
@@ -2745,6 +2802,9 @@ igt_main
 		free(drpc);
 	}
 
+	igt_subtest("npd")
+		test_npd();
+
 	igt_subtest("module-unload") {
 		igt_require(igt_i915_driver_unload() == 0);
 		for (int pass = 0; pass < 3; pass++)
-- 
2.34.1
