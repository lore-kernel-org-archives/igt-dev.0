Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF26B10E8DF
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 15:54:49 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:53:15 +0000
Message-Id: <20231109155410.7-3-francois.dugast@intel.com>
In-Reply-To: <20231109155410.7-1-francois.dugast@intel.com>
References: <20231109155410.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 02/57] drm-uapi/xe: Add documentation for query
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

Align with commit ("drm/xe/uapi: Add documentation for query")

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h | 41 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 66658d76c..2b710ed3b 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -321,14 +321,43 @@ struct drm_xe_query_config {
 	/** @pad: MBZ */
 	__u32 pad;
 
+	/*
+	 * Device ID (lower 16 bits) and the device revision (next
+	 * 8 bits)
+	 */
 #define XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
+	/*
+	 * Flags describing the device configuration, see list below
+	 */
 #define XE_QUERY_CONFIG_FLAGS			1
+	/*
+	 * Flag is set if the device has usable VRAM
+	 */
 	#define XE_QUERY_CONFIG_FLAGS_HAS_VRAM		(0x1 << 0)
+	/*
+	 * Minimal memory alignment required by this device,
+	 * typically SZ_4K or SZ_64K
+	 */
 #define XE_QUERY_CONFIG_MIN_ALIGNMENT		2
+	/*
+	 * Maximum bits of a virtual address
+	 */
 #define XE_QUERY_CONFIG_VA_BITS			3
+	/*
+	 * Total number of GTs for the entire device
+	 */
 #define XE_QUERY_CONFIG_GT_COUNT		4
+	/*
+	 * Total number of accessible memory regions
+	 */
 #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
+	/*
+	 * Value of the highest available exec queue priority
+	 */
 #define XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	6
+	/*
+	 * Number of elements in the info array
+	 */
 #define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY + 1)
 	/** @info: array of elements containing the config info */
 	__u64 info[];
@@ -440,9 +469,15 @@ struct drm_xe_query_topology_mask {
 /**
  * struct drm_xe_device_query - main structure to query device information
  *
- * If size is set to 0, the driver fills it with the required size for the
- * requested type of data to query. If size is equal to the required size,
- * the queried information is copied into data.
+ * The user selects the type of data to query among DRM_XE_DEVICE_QUERY_*
+ * and sets the value in the query member. This determines the type of
+ * the structure provided by the driver in data, among struct drm_xe_query_*.
+ *
+ * If size is set to 0, the driver fills it with the required size for
+ * the requested type of data to query. If size is equal to the required
+ * size, the queried information is copied into data. If size is set to
+ * a value different from 0 and different from the required size, the
+ * IOCTL call returns -EINVAL.
  *
  * For example the following code snippet allows retrieving and printing
  * information about the device engines with DRM_XE_DEVICE_QUERY_ENGINES:
-- 
2.34.1
