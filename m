Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A1410E564
 for <igt-dev@lists.freedesktop.org>; Wed, 24 May 2023 03:36:48 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-64d2ca9ef0cso257334b3a.1
 for <igt-dev@lists.freedesktop.org>; Tue, 23 May 2023 20:36:48 -0700 (PDT)
From: Christopher Snowhill <kode54@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 23 May 2023 20:36:39 -0700
Message-Id: <20230524033640.2006028-2-kode54@gmail.com>
In-Reply-To: <20230524033640.2006028-1-kode54@gmail.com>
References: <20230524033640.2006028-1-kode54@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/1] drm-uapi/xe_drm: Update Xe uAPI
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

Update the uAPI contract for Xe IGT to rename relevant sections
and comments s/i915/xe/, add a few newer properties, and introduce
padding sections so that 32-bit compat arch is aligned identical
to 64-bit arch, which would allow interoperability with multilib
on 64-bit hosts. Minimally invasive changes for the padding, as it
does not involve changing the sizes of any existing fields, or
their general layout and order. The only breaking change is 32-bit
on 32-bit hosts, but generally, most will not be using 32-bit
kernels with such large memory devices.

Signed-off-by: Christopher Snowhill <kode54@gmail.com>
---
 include/drm-uapi/xe_drm.h | 53 +++++++++++++++++++++++++++++++--------
 1 file changed, 43 insertions(+), 10 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 593b01ba..d5fc54b5 100644
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
@@ -184,7 +184,8 @@ struct drm_xe_query_config {
 #define XE_QUERY_CONFIG_VA_BITS			3
 #define XE_QUERY_CONFIG_GT_COUNT		4
 #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
-#define XE_QUERY_CONFIG_NUM_PARAM		XE_QUERY_CONFIG_MEM_REGION_COUNT + 1
+#define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
+#define XE_QUERY_CONFIG_NUM_PARAM		XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1
 	__u64 info[];
 };
 
@@ -290,6 +291,9 @@ struct drm_xe_gem_create {
 	 */
 	__u32 handle;
 
+	/** @pad: MBZ */
+	__u32 pad;
+
 	/** @reserved: Reserved */
 	__u64 reserved[2];
 };
@@ -334,6 +338,9 @@ struct drm_xe_ext_vm_set_property {
 #define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
 	__u32 property;
 
+	/** @pad: MBZ */
+	__u32 pad;
+
 	/** @value: property value */
 	__u64 value;
 
@@ -378,6 +385,9 @@ struct drm_xe_vm_bind_op {
 	 */
 	__u32 obj;
 
+	/** @pad: MBZ */
+	__u32 pad;
+
 	union {
 		/**
 		 * @obj_offset: Offset into the object, MBZ for CLEAR_RANGE,
@@ -468,6 +478,9 @@ struct drm_xe_vm_bind {
 	/** @num_binds: number of binds in this IOCTL */
 	__u32 num_binds;
 
+	/** @pad: MBZ */
+	__u32 pad;
+
 	union {
 		/** @bind: used if num_binds == 1 */
 		struct drm_xe_vm_bind_op bind;
@@ -481,6 +494,9 @@ struct drm_xe_vm_bind {
 	/** @num_syncs: amount of syncs to wait on */
 	__u32 num_syncs;
 
+	/** @pad2: MBZ */
+	__u32 pad2;
+
 	/** @syncs: pointer to struct drm_xe_sync array */
 	__u64 syncs;
 
@@ -496,6 +512,9 @@ struct drm_xe_ext_engine_set_property {
 	/** @property: property to set */
 	__u32 property;
 
+	/** @pad: MBZ */
+	__u32 pad;
+
 	/** @value: property value */
 	__u64 value;
 };
@@ -611,6 +630,9 @@ struct drm_xe_sync {
 #define DRM_XE_SYNC_USER_FENCE		0x3
 #define DRM_XE_SYNC_SIGNAL		0x10
 
+	/** @pad: MBZ */
+	__u32 pad;
+
 	union {
 		__u32 handle;
 		/**
@@ -655,6 +677,9 @@ struct drm_xe_exec {
 	 */
 	__u16 num_batch_buffer;
 
+	/** @pad: MBZ */
+	__u16 pad[3];
+
 	/** @reserved: Reserved */
 	__u64 reserved[2];
 };
@@ -717,6 +742,8 @@ struct drm_xe_wait_user_fence {
 #define DRM_XE_UFENCE_WAIT_ABSTIME	(1 << 1)
 #define DRM_XE_UFENCE_WAIT_VM_ERROR	(1 << 2)
 	__u16 flags;
+	/** @pad: MBZ */
+	__u32 pad;
 	/** @value: compare value */
 	__u64 value;
 	/** @mask: comparison mask */
@@ -749,6 +776,9 @@ struct drm_xe_vm_madvise {
 	/** @vm_id: The ID VM in which the VMA exists */
 	__u32 vm_id;
 
+	/** @pad: MBZ */
+	__u32 pad;
+
 	/** @range: Number of bytes in the VMA */
 	__u64 range;
 
@@ -793,6 +823,9 @@ struct drm_xe_vm_madvise {
 	/** @property: property to set */
 	__u32 property;
 
+	/** @pad2: MBZ */
+	__u32 pad2;
+
 	/** @value: property value */
 	__u64 value;
 
-- 
2.40.1
