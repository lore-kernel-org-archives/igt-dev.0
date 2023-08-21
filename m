Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A231610E26F
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Aug 2023 14:07:41 +0000 (UTC)
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Mon, 21 Aug 2023 10:07:11 -0400
Message-ID: <20230821140712.1034591-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH v4 1/2] lib/amdgpu: Add check for ODM combine
 segments debugfs endpoint
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: hersenxs.wu@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 lib/igt_amd.c | 10 ++++++++++
 lib/igt_amd.h |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index 83011e8ca..1a720ff56 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -325,6 +325,16 @@ static bool igt_amd_output_has_dsc(int drm_fd, char *connector_name)
 	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_DSC_CLOCK_EN);
 }
 
+/**
+ * igt_amd_output_has_odm_combine_segments: check if connector has dsc debugfs entry
+ * @drm_fd: DRM file descriptor
+ * @connector_name: The connector's name, on which we're reading the status
+ */
+bool igt_amd_output_has_odm_combine_segments(int drm_fd, char *connector_name)
+{
+	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_ODM_COMBINE_SEG);
+}
+
 /**
  * is_dp_dsc_supported: Checks if connector is DSC capable
  * @display: A pointer to an #igt_display_t structure
diff --git a/lib/igt_amd.h b/lib/igt_amd.h
index 6f538a195..c05b4b730 100644
--- a/lib/igt_amd.h
+++ b/lib/igt_amd.h
@@ -54,6 +54,9 @@
 #define DEBUGFS_DM_VISUAL_CONFIRM "amdgpu_dm_visual_confirm"
 #define DEBUGFS_DM_CAPABILITIES "amdgpu_dm_capabilities"
 
+/* ODM Combine */
+#define DEBUGFS_ODM_COMBINE_SEG "odm_combine_segments"
+
 enum amd_dsc_clock_force {
 	DSC_AUTOMATIC = 0,
 	DSC_FORCE_ON,
@@ -197,4 +200,5 @@ int  igt_amd_get_visual_confirm(int drm_fd);
 bool igt_amd_set_visual_confirm(int drm_fd, enum amdgpu_debug_visual_confirm option);
 
 bool igt_amd_is_mall_capable(int drm_fd);
+bool igt_amd_output_has_odm_combine_segments(int drm_fd, char *connector_name);
 #endif /* IGT_AMD_H */
-- 
2.41.0
