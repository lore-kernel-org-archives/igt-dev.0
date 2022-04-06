Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2077.outbound.protection.outlook.com [40.107.243.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203AB10E15D
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Apr 2022 14:48:55 +0000 (UTC)
From: David Zhang <dingchen.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 6 Apr 2022 10:48:38 -0400
Message-ID: <20220406144838.418086-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH] lib/igt_amd: add helper to R/W DM visual confirm
 debug option
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

[why & how]
AMDGPU DM exposure a debugfs interface entry of visual confirm
debug option which is configured for debugging like surface
programming. It also supports the PSR feature visual confirm
debugging. We'd add helpers to read/write visual confirm debug
option from/to such interface entry.

The interface entry "amdgpu_dm_visual_confirm" is located in the
debugfs directory. We'd add the enumeration of visual confirm
option which is aligned to the amdgpu kernel driver.

Changes in v2:
--------------------
- close the file descriptor before return in helper of setting
  visual confirm
- drop the '_dm_' from helpers to check visual confirm debugfs
  existence, get/set option from/to the debugfs entry.

Cc: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Wayne Lin <wayne.lin@amd.com>

Signed-off-by: David Zhang <dingchen.zhang@amd.com>
Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 lib/igt_amd.c | 100 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_amd.h |  20 ++++++++++
 2 files changed, 120 insertions(+)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index 888da44a..a23371fa 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -25,6 +25,7 @@
 
 #include "igt_amd.h"
 #include "igt.h"
+#include "igt_sysfs.h"
 #include <amdgpu_drm.h>
 
 #define X0 1
@@ -250,6 +251,38 @@ bool igt_amd_is_tiled(uint64_t modifier)
 		return false;
 }
 
+/**
+ * @brief generic helper to check if the amdgpu dm debugfs entry defined
+ *
+ * @param drm_fd DRM file descriptor
+ * @param interface_name The debugfs interface entry name with prefix "amdgpu_"
+ * @return true if <debugfs_root>/interface_name exists and defined
+ * @return false otherwise
+ */
+static bool amd_has_debugfs(int drm_fd, const char *interface_name)
+{
+	int fd;
+	int res;
+	struct stat stat;
+
+	fd = igt_debugfs_dir(drm_fd);
+	if (fd < 0) {
+		igt_info("Couldn't open debugfs dir!\n");
+		return false;
+	}
+
+	res = fstatat(fd, interface_name, &stat, 0);
+	if (res != 0) {
+		igt_info("debugfs %s not supported\n", interface_name);
+		close(fd);
+		return false;
+	}
+
+	close(fd);
+	return true;
+}
+
+
 /**
  * @brief generic helper to check if the debugfs entry of given connector has the
  *        debugfs interface defined.
@@ -1075,3 +1108,70 @@ int igt_amd_read_psr_state(int drm_fd, char *connector_name)
 
 	return strtol(buf, NULL, 10);
 }
+
+/**
+ * @brief check if AMDGPU DM visual confirm debugfs interface entry exist and defined
+ * 
+ * @param drm_fd DRM file descriptor
+ * @return true if visual confirm debugfs interface exists and defined
+ * @return false otherwise
+ */
+bool igt_amd_has_visual_confirm(int drm_fd)
+{
+	return amd_has_debugfs(drm_fd, DEBUGFS_DM_VISUAL_CONFIRM);
+}
+
+/**
+ * @brief Read amdgpu DM visual confirm debugfs interface
+ *
+ * @param drm_fd DRM file descriptor
+ * @return int visual confirm debug option as integer
+ */
+int  igt_amd_get_visual_confirm(int drm_fd)
+{
+	char buf[4];	/* current 4 bytes are enough */
+	int fd, ret;
+
+	fd = igt_debugfs_dir(drm_fd);
+	if (fd < 0) {
+		igt_info("Couldn't open debugfs dir!\n");
+		return -1;
+	}
+
+	ret = igt_debugfs_simple_read(fd, DEBUGFS_DM_VISUAL_CONFIRM, buf, sizeof(buf));
+	close(fd);
+
+	igt_assert_f(ret >= 0, "Reading %s failed.\n",
+		     DEBUGFS_DM_VISUAL_CONFIRM);
+
+	return strtol(buf, NULL, 10);
+}
+
+/**
+ * @brief Write amdgpu DM visual confirm debug option to debugfs interface
+ *
+ * @param drm_fd DRM file descriptor
+ * @param option amdgpu DC visual confirm debug option
+ * @return true if set visual confirm option success
+ * @return false otherwise
+ */
+bool igt_amd_set_visual_confirm(int drm_fd, enum amdgpu_debug_visual_confirm option)
+{
+	char buf[4];
+	int fd;
+	bool res;
+
+	fd = igt_debugfs_dir(drm_fd);
+	if (fd < 0) {
+		igt_info("Couldn't open debugfs dir!\n");
+		return false;
+	}
+
+	memset(buf, '\0', sizeof(buf));
+	snprintf(buf, sizeof(buf), "%d\n", option);
+
+	res = igt_sysfs_set(fd, DEBUGFS_DM_VISUAL_CONFIRM, buf);
+	close(fd);
+
+	return res;
+}
diff --git a/lib/igt_amd.h b/lib/igt_amd.h
index e4e12ce5..428bfe6f 100644
--- a/lib/igt_amd.h
+++ b/lib/igt_amd.h
@@ -49,6 +49,9 @@
 #define DEBUGFS_EDP_PSR_CAP	"psr_capability"
 #define DEBUGFS_EDP_PSR_STATE	"psr_state"
 
+/* amdgpu DM interface entries */
+#define DEBUGFS_DM_VISUAL_CONFIRM "amdgpu_dm_visual_confirm"
+
 enum amd_dsc_clock_force {
 	DSC_AUTOMATIC = 0,
 	DSC_FORCE_ON,
@@ -115,6 +118,19 @@ enum amdgpu_psr_state {
 	PSR_STATE_INVALID = 0xFF
 };
 
+/*
+ * enumeration of amdgpu DC visual confirm debug option
+ * aligned to the upstreamed amdgpu kernel driver 'enum visual_confirm' in dc.h
+ */
+enum amdgpu_debug_visual_confirm {
+	VISUAL_CONFIRM_DISABLE	= 0,
+	VISUAL_CONFIRM_SURFACE	= 1,
+	VISUAL_CONFIRM_HDR	= 2,
+	VISUAL_CONFIRM_MPCTREE	= 4,
+	VISUAL_CONFIRM_PSR	= 5,
+	VISUAL_CONFIRM_SWIZZLE	= 9
+};
+
 uint32_t igt_amd_create_bo(int fd, uint64_t size);
 void *igt_amd_mmap_bo(int fd, uint32_t handle, uint64_t size, int prot);
 unsigned int igt_amd_compute_offset(unsigned int* swizzle_pattern,
@@ -172,4 +188,8 @@ bool igt_amd_psr_support_drv(int drm_fd, char *connector_name, enum psr_mode mod
 bool igt_amd_output_has_psr_state(int drm_fd, char *connector_name);
 int  igt_amd_read_psr_state(int drm_fd, char *connector_name);
 
+/* DM interface helpers */
+bool igt_amd_has_visual_confirm(int drm_fd);
+int  igt_amd_get_visual_confirm(int drm_fd);
+bool igt_amd_set_visual_confirm(int drm_fd, enum amdgpu_debug_visual_confirm option);
 #endif /* IGT_AMD_H */
-- 
2.25.1
