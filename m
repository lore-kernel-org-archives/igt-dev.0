Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D8810E328
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jun 2023 10:00:58 +0000 (UTC)
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Jun 2023 15:35:01 +0530
Message-Id: <20230606100501.2990928-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] [RFC 1/1] Support querying number of tiles for xe
 device.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Patch is based on uapi changes introduced in:
https://patchwork.freedesktop.org/series/118918/

With tile and GT seperation in KMD, we need to query
number of tiles supported by platform.
We will need to access tile associated properties from IGT.
Hence adding iterator for all supported tiles.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 include/drm-uapi/xe_drm.h | 58 +++++++++++++++++++++++++++++++--------
 lib/xe/xe_query.c         |  9 ++++++
 lib/xe/xe_query.h         |  6 ++++
 3 files changed, 61 insertions(+), 12 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 593b01ba..8e552aa5 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -37,7 +37,7 @@ extern "C" {
  */
 
 /**
- * struct i915_user_extension - Base class for defining a chain of extensions
+ * struct xe_user_extension - Base class for defining a chain of extensions
  *
  * Many interfaces need to grow over time. In most cases we can simply
  * extend the struct and have userspace pass in more data. Another option,
@@ -55,20 +55,20 @@ extern "C" {
  *
  * .. code-block:: C
  *
- *	struct i915_user_extension ext3 {
+ *	struct xe_user_extension ext3 {
  *		.next_extension = 0, // end
  *		.name = ...,
  *	};
- *	struct i915_user_extension ext2 {
+ *	struct xe_user_extension ext2 {
  *		.next_extension = (uintptr_t)&ext3,
  *		.name = ...,
  *	};
- *	struct i915_user_extension ext1 {
+ *	struct xe_user_extension ext1 {
  *		.next_extension = (uintptr_t)&ext2,
  *		.name = ...,
  *	};
  *
- * Typically the struct i915_user_extension would be embedded in some uAPI
+ * Typically the struct xe_user_extension would be embedded in some uAPI
  * struct, and in this case we would feed it the head of the chain(i.e ext1),
  * which would then apply all of the above extensions.
  *
@@ -77,7 +77,7 @@ struct xe_user_extension {
 	/**
 	 * @next_extension:
 	 *
-	 * Pointer to the next struct i915_user_extension, or zero if the end.
+	 * Pointer to the next struct xe_user_extension, or zero if the end.
 	 */
 	__u64 next_extension;
 	/**
@@ -87,11 +87,11 @@ struct xe_user_extension {
 	 *
 	 * Also note that the name space for this is not global for the whole
 	 * driver, but rather its scope/meaning is limited to the specific piece
-	 * of uAPI which has embedded the struct i915_user_extension.
+	 * of uAPI which has embedded the struct xe_user_extension.
 	 */
 	__u32 name;
 	/**
-	 * @flags: MBZ
+	 * @pad: MBZ
 	 *
 	 * All undefined bits must be zero.
 	 */
@@ -99,7 +99,7 @@ struct xe_user_extension {
 };
 
 /*
- * i915 specific ioctls.
+ * xe specific ioctls.
  *
  * The device specific ioctl range is [DRM_COMMAND_BASE, DRM_COMMAND_END) ie
  * [0x40, 0xa0) (a0 is excluded). The numbers below are defined as offset
@@ -184,7 +184,9 @@ struct drm_xe_query_config {
 #define XE_QUERY_CONFIG_VA_BITS			3
 #define XE_QUERY_CONFIG_GT_COUNT		4
 #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
-#define XE_QUERY_CONFIG_NUM_PARAM		XE_QUERY_CONFIG_MEM_REGION_COUNT + 1
+#define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
+#define XE_QUERY_CONFIG_TILE_COUNT		7
+#define XE_QUERY_CONFIG_NUM_PARAM		XE_QUERY_CONFIG_TILE_COUNT + 1
 	__u64 info[];
 };
 
@@ -290,6 +292,9 @@ struct drm_xe_gem_create {
 	 */
 	__u32 handle;
 
+	/** @pad: MBZ */
+	__u32 pad;
+
 	/** @reserved: Reserved */
 	__u64 reserved[2];
 };
@@ -334,6 +339,9 @@ struct drm_xe_ext_vm_set_property {
 #define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
 	__u32 property;
 
+	/** @pad: MBZ */
+	__u32 pad;
+
 	/** @value: property value */
 	__u64 value;
 
@@ -378,6 +386,9 @@ struct drm_xe_vm_bind_op {
 	 */
 	__u32 obj;
 
+	/** @pad: MBZ */
+	__u32 pad;
+
 	union {
 		/**
 		 * @obj_offset: Offset into the object, MBZ for CLEAR_RANGE,
@@ -397,10 +408,10 @@ struct drm_xe_vm_bind_op {
 	__u64 addr;
 
 	/**
-	 * @gt_mask: Mask for which GTs to create binds for, 0 == All GTs,
+	 * @tile_mask: Mask for which tiles to create binds for, 0 == All tiles,
 	 * only applies to creating new VMAs
 	 */
-	__u64 gt_mask;
+	__u64 tile_mask;
 
 	/** @op: Operation to perform (lower 16 bits) and flags (upper 16 bits) */
 	__u32 op;
@@ -468,6 +479,9 @@ struct drm_xe_vm_bind {
 	/** @num_binds: number of binds in this IOCTL */
 	__u32 num_binds;
 
+	/** @pad: MBZ */
+	__u32 pad;
+
 	union {
 		/** @bind: used if num_binds == 1 */
 		struct drm_xe_vm_bind_op bind;
@@ -481,6 +495,9 @@ struct drm_xe_vm_bind {
 	/** @num_syncs: amount of syncs to wait on */
 	__u32 num_syncs;
 
+	/** @pad2: MBZ */
+	__u32 pad2;
+
 	/** @syncs: pointer to struct drm_xe_sync array */
 	__u64 syncs;
 
@@ -496,6 +513,9 @@ struct drm_xe_ext_engine_set_property {
 	/** @property: property to set */
 	__u32 property;
 
+	/** @pad: MBZ */
+	__u32 pad;
+
 	/** @value: property value */
 	__u64 value;
 };
@@ -611,6 +631,9 @@ struct drm_xe_sync {
 #define DRM_XE_SYNC_USER_FENCE		0x3
 #define DRM_XE_SYNC_SIGNAL		0x10
 
+	/** @pad: MBZ */
+	__u32 pad;
+
 	union {
 		__u32 handle;
 		/**
@@ -655,6 +678,9 @@ struct drm_xe_exec {
 	 */
 	__u16 num_batch_buffer;
 
+	/** @pad: MBZ */
+	__u16 pad[3];
+
 	/** @reserved: Reserved */
 	__u64 reserved[2];
 };
@@ -717,6 +743,8 @@ struct drm_xe_wait_user_fence {
 #define DRM_XE_UFENCE_WAIT_ABSTIME	(1 << 1)
 #define DRM_XE_UFENCE_WAIT_VM_ERROR	(1 << 2)
 	__u16 flags;
+	/** @pad: MBZ */
+	__u32 pad;
 	/** @value: compare value */
 	__u64 value;
 	/** @mask: comparison mask */
@@ -749,6 +777,9 @@ struct drm_xe_vm_madvise {
 	/** @vm_id: The ID VM in which the VMA exists */
 	__u32 vm_id;
 
+	/** @pad: MBZ */
+	__u32 pad;
+
 	/** @range: Number of bytes in the VMA */
 	__u64 range;
 
@@ -793,6 +824,9 @@ struct drm_xe_vm_madvise {
 	/** @property: property to set */
 	__u32 property;
 
+	/** @pad2: MBZ */
+	__u32 pad2;
+
 	/** @value: property value */
 	__u64 value;
 
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 47be8f30..64b3aacb 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -239,6 +239,7 @@ struct xe_device *xe_device_get(int fd)
 	xe_dev->fd = fd;
 	xe_dev->config = xe_query_config_new(fd);
 	xe_dev->number_gt = xe_dev->config->info[XE_QUERY_CONFIG_GT_COUNT];
+	xe_dev->number_tiles =  xe_dev->config->info[XE_QUERY_CONFIG_TILE_COUNT];
 	xe_dev->va_bits = xe_dev->config->info[XE_QUERY_CONFIG_VA_BITS];
 	xe_dev->dev_id = xe_dev->config->info[XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff;
 	xe_dev->gts = xe_query_gts_new(fd);
@@ -344,6 +345,14 @@ _TYPE _NAME(int fd)			\
  */
 xe_dev_FN(xe_number_gt, number_gt, unsigned int);
 
+/**
+ * xe_number_tiles:
+ * @fd: xe device fd
+ *
+ * Return number of tiles for xe device fd.
+ */
+xe_dev_FN(xe_number_tiles, number_tiles, unsigned int);
+
 /**
  * all_memory_regions:
  * @fd: xe device fd
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 943ca558..4c975afc 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -32,6 +32,9 @@ struct xe_device {
 	/** @number_gt: number of gt */
 	unsigned int number_gt;
 
+	/** @number_tiles: number of tiles */
+	unsigned int number_tiles;
+
 	/** @gts: bitmask of all memory regions */
 	uint64_t memory_regions;
 
@@ -68,6 +71,9 @@ struct xe_device {
 	     ++__class)
 #define xe_for_each_gt(__fd, __gt) \
 	for (__gt = 0; __gt < xe_number_gt(__fd); ++__gt)
+#define xe_for_each_tile(__fd, __tile) \
+	for (__tile = 0; __tile < xe_number_tiles(__fd); ++__tile)
+
 
 #define xe_for_each_mem_region(__fd, __memreg, __r) \
 	for (uint64_t __i = 0; __i < igt_fls(__memreg); __i++) \
-- 
2.25.1
