Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Date: Thu, 18 Aug 2022 13:51:13 -0700
Message-Id: <20220818205113.21212-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] i915/guc: Disable i915_pm_rps when SLPC is
 enabled
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

These tests were specifically designed for host Turbo. Skip
them when SLPC is enabled as they fail frequently. We will look
to keep adding to SLPC test coverage with these scenarios.

Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/3963
Bug: https://gitlab.freedesktop.org/drm/intel/issues/4016
Bug: https://gitlab.freedesktop.org/drm/intel/issues/5468
Bug: https://gitlab.freedesktop.org/drm/intel/issues/5831

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 lib/igt_pm.c             | 15 +++++++++++++++
 lib/igt_pm.h             |  1 +
 tests/i915/i915_pm_rps.c | 29 ++++++++++++++++++++++++-----
 3 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 6ebbad33..79bd6e2a 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1202,3 +1202,18 @@ void igt_pm_print_pci_card_runtime_status(void)
 		igt_pm_print_pci_dev_runtime_status(__pci_dev_pwrattr[i].pci_dev);
 	}
 }
+
+bool i915_is_slpc_enabled(int fd)
+{
+	int debugfs_fd = igt_debugfs_dir(fd);
+	char buf[4096];
+	int len;
+
+	igt_require(debugfs_fd != -1);
+
+	len = igt_debugfs_simple_read(debugfs_fd, "gt/uc/guc_slpc_info", buf, sizeof(buf));
+	if (len < 0)
+		return false;
+	else
+		return strstr(buf, "SLPC state: running");
+}
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index f28b6ebf..cbbde12b 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -79,5 +79,6 @@ void igt_pm_enable_pci_card_runtime_pm(struct pci_device *root,
 void igt_pm_setup_pci_card_runtime_pm(struct pci_device *pci_dev);
 void igt_pm_restore_pci_card_runtime_pm(void);
 void igt_pm_print_pci_card_runtime_status(void);
+bool i915_is_slpc_enabled(int fd);
 
 #endif /* IGT_PM_H */
diff --git a/tests/i915/i915_pm_rps.c b/tests/i915/i915_pm_rps.c
index d06ade27..cce07009 100644
--- a/tests/i915/i915_pm_rps.c
+++ b/tests/i915/i915_pm_rps.c
@@ -914,35 +914,54 @@ igt_main
 		igt_install_exit_handler(pm_rps_exit_handler);
 	}
 
-	igt_subtest("basic-api")
+	igt_subtest("basic-api") {
+		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
+			      "This subtest is not supported when SLPC is enabled");
 		min_max_config(basic_check, false);
+	}
 
 	/* Verify the constraints, check if we can reach idle */
-	igt_subtest("min-max-config-idle")
+	igt_subtest("min-max-config-idle") {
+		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
+			      "This subtest is not supported when SLPC is enabled");
 		min_max_config(idle_check, true);
+	}
 
 	/* Verify the constraints with high load, check if we can reach max */
 	igt_subtest("min-max-config-loaded") {
+		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
+			      "This subtest is not supported when SLPC is enabled");
 		load_helper_run(HIGH);
 		min_max_config(loaded_check, false);
 		load_helper_stop();
 	}
 
 	/* Checks if we achieve boost using gem_wait */
-	igt_subtest("waitboost")
+	igt_subtest("waitboost") {
+		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
+			      "This subtest is not supported when SLPC is enabled");
 		waitboost(drm_fd, false);
+	}
 
 	igt_describe("Check if the order of fences does not affect waitboosting");
-	igt_subtest("fence-order")
+	igt_subtest("fence-order") {
+		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
+			      "This subtest is not supported when SLPC is enabled");
 		fence_order(drm_fd);
+	}
 
 	igt_describe("Check if context reuse does not affect waitboosting");
-	igt_subtest("engine-order")
+	igt_subtest("engine-order") {
+		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
+			      "This subtest is not supported when SLPC is enabled");
 		engine_order(drm_fd);
+	}
 
 	/* Test boost frequency after GPU reset */
 	igt_subtest("reset") {
 		igt_hang_t hang = igt_allow_hang(drm_fd, 0, 0);
+		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
+			      "This subtest is not supported when SLPC is enabled");
 		waitboost(drm_fd, true);
 		igt_disallow_hang(drm_fd, hang);
 	}
-- 
2.35.1
