Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD4E10E0E1
 for <igt-dev@lists.freedesktop.org>; Mon,  1 May 2023 23:04:18 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  1 May 2023 16:04:12 -0700
Message-Id: <20230501230416.3210262-2-matthew.brost@intel.com>
In-Reply-To: <20230501230416.3210262-1-matthew.brost@intel.com>
References: <20230501230416.3210262-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/5] xe: Update to latest uAPI
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

Includes NULL bindings support.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/drm-uapi/xe_drm.h | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 593b01ba5..27c51946f 100644
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
@@ -87,7 +87,7 @@ struct xe_user_extension {
 	 *
 	 * Also note that the name space for this is not global for the whole
 	 * driver, but rather its scope/meaning is limited to the specific piece
-	 * of uAPI which has embedded the struct i915_user_extension.
+	 * of uAPI which has embedded the struct xe_user_extension.
 	 */
 	__u32 name;
 	/**
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
 
@@ -446,6 +447,14 @@ struct drm_xe_vm_bind_op {
 	 * than differing the MAP to the page fault handler.
 	 */
 #define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 18)
+	/*
+	 * When the NULL flag is set, the page tables are setup with a special
+	 * bit which indicates writes are dropped and all reads return zero. The
+	 * NULL flags is only valid for XE_VM_BIND_OP_MAP operations, the BO
+	 * handle MBZ, and the BO offset MBZ. This flag is intended to implement
+	 * VK sparse bindings.
+	 */
+#define XE_VM_BIND_FLAG_NULL		(0x1 << 19)
 
 	/** @reserved: Reserved */
 	__u64 reserved[2];
-- 
2.34.1
