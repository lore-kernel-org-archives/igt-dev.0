Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8566810E76A
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Nov 2023 18:46:15 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 30 Nov 2023 18:45:36 +0000
Message-Id: <20231130184536.7-22-francois.dugast@intel.com>
In-Reply-To: <20231130184536.7-1-francois.dugast@intel.com>
References: <20231130184536.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v5 21/21] drm-uapi/xe: Kill exec_queue_set_property
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

Align with commit ("drm/xe/uapi: Kill exec_queue_set_property")

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h | 48 +++++++++++----------------------------
 1 file changed, 13 insertions(+), 35 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index e2cce951c..590f7b7af 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -105,10 +105,9 @@ struct xe_user_extension {
 #define DRM_XE_VM_BIND			0x05
 #define DRM_XE_EXEC_QUEUE_CREATE	0x06
 #define DRM_XE_EXEC_QUEUE_DESTROY	0x07
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x08
-#define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x09
-#define DRM_XE_EXEC			0x0a
-#define DRM_XE_WAIT_USER_FENCE		0x0b
+#define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x08
+#define DRM_XE_EXEC			0x09
+#define DRM_XE_WAIT_USER_FENCE		0x0a
 /* Must be kept compact -- no holes */
 
 #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
@@ -860,38 +859,17 @@ struct drm_xe_vm_bind {
 /* Monitor 64MB contiguous region with 2M sub-granularity */
 #define DRM_XE_ACC_GRANULARITY_64M 3
 
-/**
- * struct drm_xe_exec_queue_set_property - exec queue set property
- *
- * Same namespace for extensions as drm_xe_exec_queue_create
- */
-struct drm_xe_exec_queue_set_property {
-	/** @extensions: Pointer to the first extension struct, if any */
-	__u64 extensions;
-
-	/** @exec_queue_id: Exec queue ID */
-	__u32 exec_queue_id;
-
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY			0
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY		7
-	/** @property: property to set */
-	__u32 property;
-
-	/** @value: property value */
-	__u64 value;
-
-	/** @reserved: Reserved */
-	__u64 reserved[2];
-};
-
 struct drm_xe_exec_queue_create {
-#define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY               0
+#define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY	7
+
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-- 
2.34.1
