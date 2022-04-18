Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B4510E397
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Apr 2022 12:51:19 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 18 Apr 2022 18:20:46 +0530
Message-Id: <20220418125048.7969-8-anshuman.gupta@intel.com>
In-Reply-To: <20220418125048.7969-1-anshuman.gupta@intel.com>
References: <20220418125048.7969-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 7/9] i915_pm_rpm: Test D3Cold with
 gem_exec_stress
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com, rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Added d3cold dynamic subtest to gem_exec_stress with device class
memory region. It test both D3Cold-{VRAM_SR, Off} by using
d3cold_sr_lmem_threshold i915_params debugfs.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_rpm.c | 95 +++++++++++++++++++++++++++++++++-------
 1 file changed, 78 insertions(+), 17 deletions(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index c30862dc4..8e9ff56ec 100644
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
@@ -744,6 +760,30 @@ static void test_i2c(struct mode_set_data *data)
 			"There is an EDID mismatch between i2c and DRM!\n");
 }
 
+static int get_d3cold_sr_lmem_threshold(int dir)
+{
+	int param_dir, lmem_threshold, ret;
+
+	param_dir = openat(dir, "i915_params", O_RDONLY);
+	ret = igt_sysfs_scanf(param_dir, "d3cold_sr_lmem_threshold", "%d", &lmem_threshold);
+	igt_assert(ret >= 0);
+
+	close(param_dir);
+	return lmem_threshold;
+}
+
+static int set_d3cold_sr_lmem_threshold(int dir, int val)
+{
+	int param_dir, ret;
+
+	param_dir = openat(dir, "i915_params", O_RDONLY);
+	ret = igt_sysfs_printf(param_dir, "d3cold_sr_lmem_threshold", "%d", val);
+	igt_assert(ret > 0);
+
+	close(param_dir);
+	return ret;
+}
+
 static void setup_pc8(void)
 {
 	has_pc8 = false;
@@ -1069,6 +1109,19 @@ static void debugfs_forcewake_user_subtest(void)
 	igt_assert(wait_for_suspended());
 }
 
+static struct pci_device *setup_d3cold_and_get_root_port(void)
+{
+	struct pci_device *root;
+
+	/* igfx does not support d3cold */
+	igt_require(IS_DGFX(ms_data.devid));
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
@@ -1392,6 +1445,7 @@ gem_execbuf_stress_subtest(int rounds, int wait_flags,
 	int i;
 	int batch_size = 4 * sizeof(uint32_t);
 	uint32_t batch_buf[batch_size];
+	struct pci_device *root;
 	uint32_t handle;
 	struct drm_i915_gem_execbuffer2 execbuf = {};
 	struct drm_i915_gem_exec_object2 objs[1] = {{}};
@@ -1408,6 +1462,9 @@ gem_execbuf_stress_subtest(int rounds, int wait_flags,
 	batch_buf[i++] = MI_NOOP;
 	igt_assert(i * sizeof(uint32_t) == batch_size);
 
+	if (wait_flags & WAIT_D3COLD)
+		root = setup_d3cold_and_get_root_port();
+
 	disable_all_screens_and_wait(&ms_data);
 
 	/* PC8 test is only applicable to igfx  */
@@ -1433,6 +1490,9 @@ gem_execbuf_stress_subtest(int rounds, int wait_flags,
 			/* clean up idle work */
 			igt_drop_caches_set(drm_fd, DROP_IDLE);
 			igt_assert(wait_for_suspended());
+			if (wait_flags & WAIT_D3COLD)
+				igt_assert(wait_for_d3cold(root));
+
 		}
 		if (wait_flags & WAIT_PC8_RES)
 			igt_assert(pc8_plus_residency_changed(30));
@@ -1440,6 +1500,9 @@ gem_execbuf_stress_subtest(int rounds, int wait_flags,
 			sleep(5);
 	}
 
+	if (wait_flags & WAIT_D3COLD)
+		igt_pm_restore_pci_card_runtime_pm();
+
 	gem_close(drm_fd, handle);
 }
 
@@ -1537,25 +1600,10 @@ __noreturn static void stay_subtest(void)
 static void d3cold_basic_subtest(void)
 {
 	struct pci_device *root;
-	bool result;
 
-	/* igfx does not support d3cold */
-	igt_require(IS_DGFX(ms_data.devid));
-
-	root = igt_device_get_pci_root_port(drm_fd);
+	root = setup_d3cold_and_get_root_port();
 	disable_all_screens_and_wait(&ms_data);
-	igt_require(igt_pm_acpi_d3cold_supported(root));
-	igt_pm_setup_pci_card_runtime_pm(root);
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
 
@@ -2213,6 +2261,19 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 				gem_execbuf_stress_subtest(rounds, WAIT_STATUS, &r->ci);
 			igt_dynamic_f("%s-%s", "extra-wait", r->name)
 				gem_execbuf_stress_subtest(rounds, WAIT_STATUS | WAIT_EXTRA, &r->ci);
+			if (r->ci.memory_class == I915_MEMORY_CLASS_SYSTEM)
+				continue;
+			igt_dynamic_f("%s-%s", "d3cold", r->name) {
+				int lmem_threshold;
+
+				lmem_threshold = get_d3cold_sr_lmem_threshold(debugfs);
+				/* Test D3Cold-Off */
+				gem_execbuf_stress_subtest(rounds, WAIT_STATUS | WAIT_D3COLD, &r->ci);
+				/* Test D3Cold-VRAM_SR */
+				set_d3cold_sr_lmem_threshold(debugfs, 0);
+				gem_execbuf_stress_subtest(rounds, WAIT_STATUS | WAIT_D3COLD, &r->ci);
+				set_d3cold_sr_lmem_threshold(debugfs, lmem_threshold);
+			}
 		}
 	}
 
-- 
2.26.2
