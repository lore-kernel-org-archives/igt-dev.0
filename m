Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Date: Fri, 21 Apr 2023 18:01:01 -0700
Message-Id: <20230422010103.1028886-3-vinay.belgaumkar@intel.com>
In-Reply-To: <20230422010103.1028886-1-vinay.belgaumkar@intel.com>
References: <20230422010103.1028886-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/4] lib: Make SLPC helper function per GT
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

Use default of 0 where GT id is not being used.

Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/8308

v2: Add a helper for GT 0 (Ashutosh)
v3: Additional review comments (Ashutosh)

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/igt_pm.c | 34 +++++++++++++++++++++++++---------
 lib/igt_pm.h |  3 ++-
 2 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 704acf7d..15a9cf81 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1329,21 +1329,37 @@ void igt_pm_print_pci_card_runtime_status(void)
 	}
 }
 
-bool i915_is_slpc_enabled(int fd)
+/**
+ * i915_is_slpc_enabled_gt:
+ * @drm_fd: DRM file descriptor
+ * @gt: GT id
+ * Check if SLPC is enabled on a GT
+ */
+bool i915_is_slpc_enabled_gt(int drm_fd, int gt)
 {
-	int debugfs_fd = igt_debugfs_dir(fd);
+	int debugfs_fd;
 	char buf[4096] = {};
-	int len;
 
-	igt_require(debugfs_fd != -1);
+	debugfs_fd = igt_debugfs_gt_open(drm_fd, gt, "uc/guc_slpc_info", O_RDONLY);
+
+	/* if guc_slpc_info not present then return false */
+	igt_require(debugfs_fd >= 0);
+
+	read(debugfs_fd, buf, sizeof(buf)-1);
 
-	len = igt_debugfs_simple_read(debugfs_fd, "gt/uc/guc_slpc_info", buf, sizeof(buf));
 	close(debugfs_fd);
 
-	if (len < 0)
-		return false;
-	else
-		return strstr(buf, "SLPC state: running");
+	return strstr(buf, "SLPC state: running");
+}
+
+/**
+ * i915_is_slpc_enabled:
+ * @drm_fd: DRM file descriptor
+ * Check if SLPC is enabled for the device
+ */
+bool i915_is_slpc_enabled(int drm_fd)
+{
+	return i915_is_slpc_enabled_gt(drm_fd, 0);
 }
 
 int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev)
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index d0d6d673..448cf42d 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -84,7 +84,8 @@ void igt_pm_set_d3cold_allowed(struct igt_device_card *card, const char *val);
 void igt_pm_setup_pci_card_runtime_pm(struct pci_device *pci_dev);
 void igt_pm_restore_pci_card_runtime_pm(void);
 void igt_pm_print_pci_card_runtime_status(void);
-bool i915_is_slpc_enabled(int fd);
+bool i915_is_slpc_enabled_gt(int drm_fd, int gt);
+bool i915_is_slpc_enabled(int drm_fd);
 int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);
 int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
 
-- 
2.38.1
