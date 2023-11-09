Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C44210E8DB
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 15:54:50 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:53:17 +0000
Message-Id: <20231109155410.7-5-francois.dugast@intel.com>
In-Reply-To: <20231109155410.7-1-francois.dugast@intel.com>
References: <20231109155410.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 04/57] drm-uapi/xe: Add uAPI to query
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

Align with commit ("drm/xe/uapi: Add uAPI to query micro-controler firmware version ")

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h | 43 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 52aef5ea9..d3ce6aa1d 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -466,6 +466,48 @@ struct drm_xe_query_topology_mask {
 	__u8 mask[];
 };
 
+/**
+ * struct drm_xe_query_uc_fw_version - query a micro-controller firmware version
+ *
+ * Given a uc_type this will return the major, minor, patch and branch version
+ * of the micro-controller firmware.
+ *
+ * The @uc_type can be:
+ *  - %DRM_XE_QUERY_UC_TYPE_GUC_SUBMISSION - This is the GuC Submission Version,
+ * a.k.a 'VF version'. It is not the actual GuC blob version. A running GuC can
+ * support multiple VF APIs with different Submission Versions. This version is
+ * negotiated by the VF KMD with GuC during VF initialization. In most of the
+ * current available GuC blobs, this is a 1-1 relationship where the Submission
+ * version could be inferred from the running version and vice-versa. However,
+ * the submission version is the most useful information for the user space
+ * perspective and needs.
+ *  - %DRM_XE_QUERY_TYPE_HUC - The actual HuC blob that is currently running
+ * in the platform. It returns 0 when HuC is not currently loaded.
+ */
+struct drm_xe_query_uc_fw_version {
+	/** @uc_type: The micro-controller type to query firmware version */
+#define DRM_XE_QUERY_UC_TYPE_GUC_SUBMISSION	0
+	__u16 uc_type;
+
+	/** @reserved: Reserved */
+	__u16 reserved;
+
+	/** @major_ver: major uc fw version */
+	__u32 major_ver;
+	/** @minor_ver: minor uc fw version */
+	__u32 minor_ver;
+	/** @patch_ver: patch uc fw version */
+	__u32 patch_ver;
+	/** @branch_ver: branch uc fw version */
+	__u32 branch_ver;
+
+	/** @pad2: MBZ */
+	__u32 pad2;
+
+	/** @reserved2: Reserved */
+	__u64 reserved2;
+};
+
 /**
  * struct drm_xe_device_query - main structure to query device information
  *
@@ -518,6 +560,7 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
 #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
 #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
+#define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
 	/** @query: The type of data to query */
 	__u32 query;
 
-- 
2.34.1
