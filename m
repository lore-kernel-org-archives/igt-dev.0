Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::610])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C6610E9A2
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Nov 2023 20:00:14 +0000 (UTC)
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 2 Nov 2023 15:59:58 -0400
Message-ID: <20231102200000.969208-2-aurabindo.pillai@amd.com>
In-Reply-To: <20231102200000.969208-1-aurabindo.pillai@amd.com>
References: <20231102200000.969208-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t 2/4] lib/amd: Add check for SubVP feature
 status
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

Add an API to check whether Subviewport feature is supported and enabled

Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 lib/igt_amd.c | 30 ++++++++++++++++++++++++++++++
 lib/igt_amd.h |  1 +
 2 files changed, 31 insertions(+)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index 85afec99e..e0c9d6a6d 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -51,6 +51,9 @@
 #define MALL_SUPP "mall " SUPP
 #define MALL_EN MALL_SUPP EN
 
+#define SUBVP_SUPP "sub-viewport " SUPP
+#define SUBVP_EN SUBVP_SUPP EN
+
 struct dim2d
 {
     int w;
@@ -1212,6 +1215,33 @@ void igt_amd_get_mall_status(int drm_fd, bool *supported, bool *enabled)
 		*enabled = true;
 }
 
+/**
+ * @brief check if AMDGPU sub-viewport support exists
+ *
+ * @param drm_fd DRM file descriptor
+ * @return true if dm capabilities interface exists and SubVP is supported
+ * @return false if capabilities could not be read.
+ */
+void igt_amd_get_subvp_status(int drm_fd, bool *supported, bool *enabled)
+{
+	char buf[1024];
+	char *subvp_loc;
+
+	*supported = false;
+	*enabled = false;
+
+	if (!get_dm_capabilities(drm_fd, buf, 1024))
+		return;
+
+	subvp_loc = strstr(buf, SUBVP_SUPP);
+	if (subvp_loc)
+		*supported = true;
+
+	subvp_loc = strstr(buf, SUBVP_EN);
+	if (subvp_loc && *supported)
+		*enabled = true;
+}
+
 /**
  * @brief check if AMDGPU DM visual confirm debugfs interface entry exist and defined
  *
diff --git a/lib/igt_amd.h b/lib/igt_amd.h
index de992ac4f..1e66348ad 100644
--- a/lib/igt_amd.h
+++ b/lib/igt_amd.h
@@ -200,5 +200,6 @@ int  igt_amd_get_visual_confirm(int drm_fd);
 bool igt_amd_set_visual_confirm(int drm_fd, enum amdgpu_debug_visual_confirm option);
 
 void igt_amd_get_mall_status(int drm_fd, bool *supported, bool *enabled);
+void igt_amd_get_subvp_status(int drm_fd, bool *supported, bool *enabled);
 bool igt_amd_output_has_odm_combine_segments(int drm_fd, char *connector_name);
 #endif /* IGT_AMD_H */
-- 
2.39.2
