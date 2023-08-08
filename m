Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE77710E1AA
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 15:24:26 +0000 (UTC)
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Tue, 8 Aug 2023 11:24:18 -0400
Message-ID: <20230808152419.1454608-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH v3 1/2] lib/amdgpu: Add helper functions to return
 MALL support
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

Reads the debugfs file exposed by AMDGPU DM that can be used to find out
whether the hardware supports certain features, like MALL (Memory access
at last level)

Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 lib/igt_amd.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_amd.h |  3 +++
 2 files changed, 55 insertions(+)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index 8da405649..a4dba6bad 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -1144,6 +1144,57 @@ void igt_amd_allow_edp_hotplug_detect(int drm_fd, char *connector_name, bool ena
 	close(hpd_fd);
 }
 
+static bool get_dm_capabilites(int drm_fd, char *buf, size_t size) {
+	int ret, fd;
+	bool has_capablities = amd_has_debugfs(drm_fd, DEBUGFS_DM_CAPABILITIES);
+
+	if (!has_capablities)
+		return false;
+
+	fd = igt_debugfs_dir(drm_fd);
+	if (fd < 0) {
+		igt_warn("Couldn't open debugfs directory\n");
+		return -1;
+	}
+
+	ret = igt_debugfs_simple_read(fd, DEBUGFS_DM_CAPABILITIES, buf, (int) size);
+	igt_assert_f(ret >= 0, "Reading %s failed.\n", DEBUGFS_DM_CAPABILITIES);
+
+	close(fd);
+
+	if (ret < 0)
+		return false;
+
+	return true;
+}
+
+/**
+ * @brief check if AMDGPU mall_capable interface entry exist and defined
+ *
+ * @param drm_fd DRM file descriptor
+ * @return true if mall_capable debugfs interface exists and defined
+ * @return false otherwise
+ */
+bool igt_amd_is_mall_capable(int drm_fd)
+{
+	char buf[1024], mall_read[10];
+	char *mall_loc;
+
+	if (!get_dm_capabilites(drm_fd, buf, 1024))
+		return false;
+
+	mall_loc = strstr(buf,"mall: ");
+	if (!mall_loc)
+		return false;
+
+	sscanf(mall_loc, "mall: %s", mall_read);
+
+	if (!strcmp(mall_read, "yes"))
+		return true;
+
+	return false;
+}
+
 /**
  * @brief check if AMDGPU DM visual confirm debugfs interface entry exist and defined
  *
@@ -1156,6 +1207,7 @@ bool igt_amd_has_visual_confirm(int drm_fd)
 	return amd_has_debugfs(drm_fd, DEBUGFS_DM_VISUAL_CONFIRM);
 }
 
+
 /**
  * @brief Read amdgpu DM visual confirm debugfs interface
  *
diff --git a/lib/igt_amd.h b/lib/igt_amd.h
index d57390405..6f538a195 100644
--- a/lib/igt_amd.h
+++ b/lib/igt_amd.h
@@ -52,6 +52,7 @@
 
 /* amdgpu DM interface entries */
 #define DEBUGFS_DM_VISUAL_CONFIRM "amdgpu_dm_visual_confirm"
+#define DEBUGFS_DM_CAPABILITIES "amdgpu_dm_capabilities"
 
 enum amd_dsc_clock_force {
 	DSC_AUTOMATIC = 0,
@@ -194,4 +195,6 @@ void igt_amd_allow_edp_hotplug_detect(int drm_fd, char *connector_name, bool ena
 bool igt_amd_has_visual_confirm(int drm_fd);
 int  igt_amd_get_visual_confirm(int drm_fd);
 bool igt_amd_set_visual_confirm(int drm_fd, enum amdgpu_debug_visual_confirm option);
+
+bool igt_amd_is_mall_capable(int drm_fd);
 #endif /* IGT_AMD_H */
-- 
2.41.0
