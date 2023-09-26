Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE6310E3D7
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 13:01:29 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 26 Sep 2023 13:00:48 +0000
Message-Id: <20230926130054.6-19-francois.dugast@intel.com>
In-Reply-To: <20230926130054.6-1-francois.dugast@intel.com>
References: <20230926130054.6-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 18/24] drm-uapi/xe: Align with uAPI to query
 micro-controler firmware version
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

Align with commit ("drm/xe: Add uAPI to query micro-controler firmware version")

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h | 45 +++++++++++++++++++++++++++++++++------
 1 file changed, 38 insertions(+), 7 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index f07694111..e0e202e4a 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -467,6 +467,36 @@ struct drm_xe_query_topology_mask {
 	__u8 mask[];
 };
 
+/**
+ * struct drm_xe_query_uc_fw_version - query a micro-controller firmware version
+ *
+ * Given a uc_type this will return the major, minor, patch and branch version
+ * of the micro-controller firmware.
+ */
+struct drm_xe_query_uc_fw_version {
+	/** @uc: The micro-controller type to query firmware version */
+#define XE_QUERY_UC_TYPE_GUC 0
+	__u16 uc_type;
+
+	/** @pad: MBZ */
+	__u16 pad;
+
+	/* @major_ver: major uc fw version */
+	__u32 major_ver;
+	/* @minor_ver: minor uc fw version */
+	__u32 minor_ver;
+	/* @patch_ver: patch uc fw version */
+	__u32 patch_ver;
+	/* @branch_ver: branch uc fw version */
+	__u32 branch_ver;
+
+	/** @pad2: MBZ */
+	__u32 pad2;
+
+	/** @reserved: Reserved */
+	__u64 reserved;
+};
+
 /**
  * struct drm_xe_device_query - main structure to query device information
  *
@@ -512,13 +542,14 @@ struct drm_xe_device_query {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-#define DRM_XE_DEVICE_QUERY_ENGINES	0
-#define DRM_XE_DEVICE_QUERY_MEM_USAGE	1
-#define DRM_XE_DEVICE_QUERY_CONFIG	2
-#define DRM_XE_DEVICE_QUERY_GT_LIST	3
-#define DRM_XE_DEVICE_QUERY_HWCONFIG	4
-#define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY	5
-#define DRM_XE_QUERY_CS_CYCLES		6
+#define DRM_XE_DEVICE_QUERY_ENGINES		0
+#define DRM_XE_DEVICE_QUERY_MEM_USAGE		1
+#define DRM_XE_DEVICE_QUERY_CONFIG		2
+#define DRM_XE_DEVICE_QUERY_GT_LIST		3
+#define DRM_XE_DEVICE_QUERY_HWCONFIG		4
+#define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
+#define DRM_XE_QUERY_CS_CYCLES			6
+#define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
 	/** @query: The type of data to query */
 	__u32 query;
 
-- 
2.34.1
