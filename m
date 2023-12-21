Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A710110E6F3
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Dec 2023 20:26:40 +0000 (UTC)
From: Pallavi Mishra <pallavi.mishra@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 1/2] drm-uapi/xe_drm: Add support for CLOS interface
Date: Fri, 22 Dec 2023 02:04:18 +0530
Message-Id: <20231221203419.3924552-2-pallavi.mishra@intel.com>
In-Reply-To: <20231221203419.3924552-1-pallavi.mishra@intel.com>
References: <20231221203419.3924552-1-pallavi.mishra@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Class of Service(CLOS) feature allows apps to reserve
portions of the GPU caches for exclusive use.
This helps to separate latency/bandwidth sensitive

CLOS allows XEKMD to define which portions of a cache
may be used for a given allocation through a set of
Waymask controls grouped into multiple sets.

Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
---
 include/drm-uapi/xe_drm.h | 70 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index bacdca787..a87dbc153 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -100,6 +100,10 @@ extern "C" {
 #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x08
 #define DRM_XE_EXEC			0x09
 #define DRM_XE_WAIT_USER_FENCE		0x0a
+#define DRM_XE_CLOS_RESERVE             0x0b
+#define DRM_XE_CLOS_FREE                0x0c
+#define DRM_XE_CACHE_RESERVE            0x0d
+
 /* Must be kept compact -- no holes */
 
 #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
@@ -113,6 +117,9 @@ extern "C" {
 #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
 #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
+#define DRM_IOCTL_XE_CLOS_RESERVE               DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_CLOS_RESERVE, struct drm_xe_clos_reserve)
+#define DRM_IOCTL_XE_CLOS_FREE                  DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_CLOS_FREE, struct drm_xe_clos_free)
+#define DRM_IOCTL_XE_CACHE_RESERVE              DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_CACHE_RESERVE, struct drm_xe_cache_reserve)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -1340,6 +1347,69 @@ struct drm_xe_wait_user_fence {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_clos_reserve
+ *
+ * Allows clients to request reservation of one free CLOS, to use in subsequent
+ * Cache Reservations.
+ *
+ */
+struct drm_xe_clos_reserve {
+        /** @clos_index: clos index for reservation */
+        __u16 clos_index;
+
+       /** @pad: MBZ */
+        __u16 pad16;
+};
+
+/**
+ * struct drm_xe_clos_free
+ *
+ * Free off a previously reserved CLOS set. Any corresponding Cache Reservations
+ * that are active for the CLOS are automatically dropped and returned to the
+ * Shared set.
+ *
+ * The clos_index indicates the CLOS set which is being released and must
+ * correspond to a CLOS index previously reserved.
+ *
+ */
+struct drm_xe_clos_free {
+        /** clos_index: free clos index */
+        __u16 clos_index;
+
+       /** @pad: MBZ */
+        __u16 pad16;
+};
+
+/**
+ * struct drm_xe_cache_reserve
+ *
+ * Allows clients to request, or release, reservation of one or more cache ways,
+ * within a previously reserved CLOS set.
+ *
+ * If num_ways = 0, KMD will drop any existing Reservation for the specified
+ * clos_index and cache_level. The requested clos_index and cache_level Waymasks
+ * will then track the Shared set once again.
+ *
+ * Otherwise, the requested number of Ways will be removed from the Shared set
+ * for the requested cache level, and assigned to the Cache and CLOS specified
+ * by cache_level/clos_index.
+ *
+ */
+struct drm_xe_cache_reserve {
+        /** @clos_index: reserved clos index */
+        __u16 clos_index;
+
+       /** @cache_level: level of cache  */
+        __u16 cache_level; /* e.g. 3 for L3 */
+
+       /** @num_ways: cache ways */
+        __u16 num_ways;
+
+       /** @pad: MBZ */
+        __u16 pad16;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.25.1
