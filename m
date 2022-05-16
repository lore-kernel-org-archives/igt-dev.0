Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA1710E3AD
 for <igt-dev@lists.freedesktop.org>; Mon, 16 May 2022 15:13:32 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 16 May 2022 20:42:53 +0530
Message-Id: <20220516151255.13153-9-anshuman.gupta@intel.com>
In-Reply-To: <20220516151255.13153-1-anshuman.gupta@intel.com>
References: <20220516151255.13153-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v6 08/10] i915_pm_rpm: Extend
 gem_exec_stress test with D3Cold
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Added d3cold dynamic subtest to gem_exec_stress with device class
memory region. It test both D3Cold-{VRAM_SR, Off} by using
d3cold_sr_lmem_threshold i915_params debugfs.

v2:
- Two different subtest d3cold-off and d3cold-vrsr. [Rodrigo]
- commit header modification.
v3:
- Move {get, set}_d3cold_sr_lmem_threshold in igt_fixture. [Rodrigo]
- Skip the d3cold-vram-sr test when lmem_threshold is not available.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_rpm.c | 111 +++++++++++++++++++++++++++++++++------
 1 file changed, 96 insertions(+), 15 deletions(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 31f9712a87..b16d616434 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -85,6 +85,7 @@ enum plane_type {
 #define WAIT_PC8_RES	2
 #define WAIT_EXTRA	4
 #define USE_DPMS	8
+#define WAIT_D3COLD	16
 
 int drm_fd, msr_fd, pc8_status_fd;
 int debugfs;
@@ -215,6 +216,21 @@ static bool wait_for_suspended(void)
 	}
 }
 
+static bool wait_for_d3cold(struct pci_device *root)
+{
+	bool d3colded;
+
+	d3colded = igt_wait(igt_pm_get_acpi_real_d_state(root) == IGT_ACPI_D3Cold, 10000, 500);
+
+	if (!d3colded) {
+		igt_info("D3Cold not achieved for root port %04x:%02x:%02x.%01x\n",
+			 root->domain, root->bus, root->dev, root->func);
+		igt_pm_print_pci_card_runtime_status();
+	}
+
+	return d3colded;
+}
+
 static bool wait_for_active(void)
 {
 	if (has_pc8 && !has_runtime_pm)
@@ -744,6 +760,38 @@ static void test_i2c(struct mode_set_data *data)
 			"There is an EDID mismatch between i2c and DRM!\n");
 }
 
+static int get_d3cold_sr_lmem_threshold(int dir)
+{
+	int i915_params, lmem_threshold, ret;
+
+	i915_params = openat(dir, "i915_params", O_RDONLY);
+	igt_assert(i915_params > 0);
+	ret = igt_sysfs_scanf(i915_params, "d3cold_sr_lmem_threshold", "%d", &lmem_threshold);
+	if (ret < 0) {
+		close(i915_params);
+		return ret;
+	}
+
+	close(i915_params);
+	return lmem_threshold;
+}
+
+static int set_d3cold_sr_lmem_threshold(int dir, int val)
+{
+	int i915_params, ret;
+
+	i915_params = openat(dir, "i915_params", O_RDONLY);
+	igt_assert(i915_params > 0);
+	ret = igt_sysfs_printf(i915_params, "d3cold_sr_lmem_threshold", "%d", val);
+	if (ret < 0) {
+		close(i915_params);
+		return ret;
+	}
+
+	close(i915_params);
+	return ret;
+}
+
 static void setup_pc8(void)
 {
 	has_pc8 = false;
@@ -1069,6 +1117,17 @@ static void debugfs_forcewake_user_subtest(void)
 	igt_assert(wait_for_suspended());
 }
 
+static struct pci_device *setup_d3cold_and_get_root_port(void)
+{
+	struct pci_device *root;
+
+	root = igt_device_get_pci_root_port(drm_fd);
+	igt_require(igt_pm_acpi_d3cold_supported(root));
+	igt_pm_setup_pci_card_runtime_pm(root);
+
+	return root;
+}
+
 static void gem_mmap_args(const struct mmap_offset *t,
 			  struct drm_i915_gem_memory_class_instance *mem_regions)
 {
@@ -1392,6 +1451,7 @@ gem_execbuf_stress_subtest(int rounds, int wait_flags,
 	int i;
 	int batch_size = 4 * sizeof(uint32_t);
 	uint32_t batch_buf[batch_size];
+	struct pci_device *root;
 	uint32_t handle;
 	struct drm_i915_gem_execbuffer2 execbuf = {};
 	struct drm_i915_gem_exec_object2 objs[1] = {{}};
@@ -1408,6 +1468,9 @@ gem_execbuf_stress_subtest(int rounds, int wait_flags,
 	batch_buf[i++] = MI_NOOP;
 	igt_assert(i * sizeof(uint32_t) == batch_size);
 
+	if (wait_flags & WAIT_D3COLD)
+		root = setup_d3cold_and_get_root_port();
+
 	disable_all_screens_and_wait(&ms_data);
 
 	/* PC8 test is only applicable to igfx  */
@@ -1433,6 +1496,9 @@ gem_execbuf_stress_subtest(int rounds, int wait_flags,
 			/* clean up idle work */
 			igt_drop_caches_set(drm_fd, DROP_IDLE);
 			igt_assert(wait_for_suspended());
+			if (wait_flags & WAIT_D3COLD)
+				igt_assert(wait_for_d3cold(root));
+
 		}
 		if (wait_flags & WAIT_PC8_RES)
 			igt_assert(pc8_plus_residency_changed(30));
@@ -1440,6 +1506,9 @@ gem_execbuf_stress_subtest(int rounds, int wait_flags,
 			sleep(5);
 	}
 
+	if (wait_flags & WAIT_D3COLD)
+		igt_pm_restore_pci_card_runtime_pm();
+
 	gem_close(drm_fd, handle);
 }
 
@@ -1537,22 +1606,10 @@ __noreturn static void stay_subtest(void)
 static void d3cold_basic_subtest(void)
 {
 	struct pci_device *root;
-	bool result;
 
-	root = igt_device_get_pci_root_port(drm_fd);
-	igt_require(igt_pm_acpi_d3cold_supported(root));
-	igt_pm_setup_pci_card_runtime_pm(root);
+	root = setup_d3cold_and_get_root_port();
 	disable_all_screens_and_wait(&ms_data);
-
-	result = igt_wait(igt_pm_get_acpi_real_d_state(root) == IGT_ACPI_D3Cold, 10000, 500);
-
-	if (!result) {
-		igt_info("D3Cold not achieved for root port %04x:%02x:%02x.%01x\n",
-			 root->domain, root->bus, root->dev, root->func);
-		igt_pm_print_pci_card_runtime_status();
-	}
-
-	igt_assert(result);
+	igt_assert(wait_for_d3cold(root));
 	igt_pm_restore_pci_card_runtime_pm();
 }
 
@@ -2071,6 +2128,8 @@ static struct option long_options[] = {
 
 igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
+	int lmem_threshold;
+
 	igt_subtest("basic-rte") {
 		igt_assert(setup_environment(false));
 		basic_subtest();
@@ -2081,6 +2140,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	 * not properly configured. */
 	igt_fixture {
 		igt_require(setup_environment(false));
+		lmem_threshold = get_d3cold_sr_lmem_threshold(debugfs);
 	}
 
 	if (stay)
@@ -2211,6 +2271,24 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 				gem_execbuf_stress_subtest(rounds, WAIT_STATUS, &r->ci);
 			igt_dynamic_f("%s-%s", "extra-wait", r->name)
 				gem_execbuf_stress_subtest(rounds, WAIT_STATUS | WAIT_EXTRA, &r->ci);
+
+			if (r->ci.memory_class == I915_MEMORY_CLASS_SYSTEM)
+				continue;
+
+			igt_dynamic_f("%s-%s", "d3cold-off", r->name) {
+				if (lmem_threshold >= 0)
+					set_d3cold_sr_lmem_threshold(debugfs, 300);
+
+				gem_execbuf_stress_subtest(rounds, WAIT_STATUS | WAIT_D3COLD,
+							   &r->ci);
+			}
+
+			igt_dynamic_f("%s-%s", "d3cold-vrsr", r->name) {
+				igt_require(lmem_threshold >= 0);
+				set_d3cold_sr_lmem_threshold(debugfs, 0);
+				gem_execbuf_stress_subtest(rounds, WAIT_STATUS | WAIT_D3COLD,
+							   &r->ci);
+			}
 		}
 	}
 
@@ -2227,8 +2305,11 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		pm_test_caching();
 	}
 
-	igt_fixture
+	igt_fixture {
+		if (lmem_threshold >= 0)
+			set_d3cold_sr_lmem_threshold(debugfs, lmem_threshold);
 		teardown_environment(false);
+	}
 
 	igt_subtest("module-reload") {
 		igt_debug("Reload w/o display\n");
-- 
2.26.2
