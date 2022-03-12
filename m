Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC6910E38A
 for <igt-dev@lists.freedesktop.org>; Sat, 12 Mar 2022 05:29:31 +0000 (UTC)
From: David Zhang <dingchen.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Sat, 12 Mar 2022 00:29:08 -0500
Message-ID: <20220312052910.357949-4-dingchen.zhang@amd.com>
In-Reply-To: <20220312052910.357949-1-dingchen.zhang@amd.com>
References: <20220312052910.357949-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH v3 3/5] lib/igt_amd: add helpers to check PSR state
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

[why]
For AMDGPU devices, we'd check the PSR state via reading from the
debugfs interface for a given eDP connector, where the debugfs
interface path locates at
  <debugfs_root>/dri/0/eDP-X/psr_state
where 'X' is the eDP connector index.

[how]
define and add the helper to check if PSR state debugfs interface
is supported in driver, and the helper to read PSR state from the
debugfs interface.

changes in v3:
------------------------
* separate the code refactoring, this commit is only for PSR state
  debugfs reading, and split the code refactor to next commit.

Cc: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Wayne Lin <wayne.lin@amd.com>

Signed-off-by: David Zhang <dingchen.zhang@amd.com>
Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 lib/igt_amd.c          | 68 ++++++++++++++++++++++++++++++++++++++++++
 lib/igt_amd.h          |  3 ++
 tests/amdgpu/amd_psr.c |  1 +
 3 files changed, 72 insertions(+)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index 577a8612..59e503a2 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -250,6 +250,38 @@ bool igt_amd_is_tiled(uint64_t modifier)
 		return false;
 }
 
+/**
+ * @brief generic helper to check if the debugfs entry of given connector has the
+ *        debugfs interface defined.
+ * @param drm_fd: DRM file descriptor
+ * @param connector_name: The connector's name, on which we're reading the status
+ * @param interface_name: The debugfs interface name to check
+ * @return true if <debugfs_root>/connector_name/interface_name exists and defined
+ * @return false otherwise
+ */
+static bool igt_amd_output_has_debugfs(int drm_fd, char *connector_name, const char *interface_name)
+{
+	int fd;
+	int res;
+	struct stat stat;
+
+	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
+	if (fd < 0) {
+		igt_info("output %s: debugfs not found\n", connector_name);
+		return false;
+	}
+
+	res = fstatat(fd, interface_name, &stat, 0);
+	if (res != 0) {
+		igt_info("output %s: %s debugfs not supported\n", connector_name, interface_name);
+		close(fd);
+		return false;
+	}
+
+	close(fd);
+	return true;
+}
+
 /**
  * igt_amd_output_has_dsc: check if connector has dsc debugfs entry
  * @drm_fd: DRM file descriptor
@@ -1097,3 +1129,39 @@ bool igt_amd_psr_support_drv(int drm_fd, char *connector_name, enum psr_mode mod
 	else
 		return strstr(buf, "Driver support: yes [0x01]");
 }
+
+/**
+ * igt_amd_output_has_psr_state: check if eDP connector has psr_state debugfs entry
+ * @drm_fd: DRM file descriptor
+ * @connector_name: The connector's name, on which we're reading the status
+ */
+bool igt_amd_output_has_psr_state(int drm_fd, char *connector_name)
+{
+	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_EDP_PSR_STATE);
+}
+
+/**
+ * @brief Read PSR State from debugfs interface
+ * @param drm_fd DRM file descriptor
+ * @param connector_name The connector's name, on which we're reading the status
+ * @return PSR state as integer
+ */
+int igt_amd_read_psr_state(int drm_fd, char *connector_name)
+{
+	char buf[4];
+	int fd, ret;
+
+	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
+	if (fd < 0) {
+		igt_info("Couldn't open connector %s debugfs directory\n", connector_name);
+		return false;
+	}
+
+	ret = igt_debugfs_simple_read(fd, DEBUGFS_EDP_PSR_STATE, buf, sizeof(buf));
+	close(fd);
+
+	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
+		     DEBUGFS_EDP_PSR_STATE, connector_name);
+
+	return strtol(buf, NULL, 10);
+}
diff --git a/lib/igt_amd.h b/lib/igt_amd.h
index 6e465817..f87c1991 100644
--- a/lib/igt_amd.h
+++ b/lib/igt_amd.h
@@ -47,6 +47,7 @@
 #define DEBUGFS_EDP_ILR_SETTING "ilr_setting"
 #define MAX_SUPPORTED_ILR 8
 #define DEBUGFS_EDP_PSR_CAP	"psr_capability"
+#define DEBUGFS_EDP_PSR_STATE	"psr_state"
 
 enum amd_dsc_clock_force {
 	DSC_AUTOMATIC = 0,
@@ -143,5 +144,7 @@ bool igt_amd_output_has_ilr_setting(int drm_fd, char *connector_name);
 bool igt_amd_output_has_psr_cap(int drm_fd, char *connector_name);
 bool igt_amd_psr_support_sink(int drm_fd, char *connector_name, enum psr_mode mode);
 bool igt_amd_psr_support_drv(int drm_fd, char *connector_name, enum psr_mode mode);
+bool igt_amd_output_has_psr_state(int drm_fd, char *connector_name);
+int  igt_amd_read_psr_state(int drm_fd, char *connector_name);
 
 #endif /* IGT_AMD_H */
diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
index 732eab25..865511d0 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -24,6 +24,7 @@
 #include "igt.h"
 #include "igt_core.h"
 #include "igt_kms.h"
+#include "igt_amd.h"
 #include <stdint.h>
 #include <fcntl.h>
 #include <xf86drmMode.h>
-- 
2.25.1
