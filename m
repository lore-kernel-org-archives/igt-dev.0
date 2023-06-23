Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A0210E69D
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jun 2023 18:20:38 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 23 Jun 2023 11:20:32 -0700
Message-Id: <20230623182032.923337-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 i-g-t] drm-uapi/xe_drm: Sync from drm-xe-next
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

Our include/drm-uapi/xe_drm.h is from March. Pull in the latest xe_drm.h
from drm-xe-next kernel branch. Generated after 'make headers_install'.

v2: Fix build break in tests/xe/xe_vm.c
v3: Pull in xe_drm.h updated again in the kernel

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 include/drm-uapi/xe_drm.h | 391 ++++++++++++++++++++++++++++----------
 tests/xe/xe_vm.c          |   2 +-
 2 files changed, 290 insertions(+), 103 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 593b01ba5919..432bd87ca401 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -1,26 +1,6 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * Copyright 2021 Intel Corporation. All Rights Reserved.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the
- * "Software"), to deal in the Software without restriction, including
- * without limitation the rights to use, copy, modify, merge, publish,
- * distribute, sub license, and/or sell copies of the Software, and to
- * permit persons to whom the Software is furnished to do so, subject to
- * the following conditions:
- *
- * The above copyright notice and this permission notice (including the
- * next paragraph) shall be included in all copies or substantial portions
- * of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
- * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
- * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT.
- * IN NO EVENT SHALL TUNGSTEN GRAPHICS AND/OR ITS SUPPLIERS BE LIABLE FOR
- * ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
- * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
- * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
- *
+ * Copyright © 2023 Intel Corporation
  */
 
 #ifndef _UAPI_XE_DRM_H_
@@ -37,7 +17,7 @@ extern "C" {
  */
 
 /**
- * struct i915_user_extension - Base class for defining a chain of extensions
+ * struct xe_user_extension - Base class for defining a chain of extensions
  *
  * Many interfaces need to grow over time. In most cases we can simply
  * extend the struct and have userspace pass in more data. Another option,
@@ -55,20 +35,20 @@ extern "C" {
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
@@ -77,9 +57,10 @@ struct xe_user_extension {
 	/**
 	 * @next_extension:
 	 *
-	 * Pointer to the next struct i915_user_extension, or zero if the end.
+	 * Pointer to the next struct xe_user_extension, or zero if the end.
 	 */
 	__u64 next_extension;
+
 	/**
 	 * @name: Name of the extension.
 	 *
@@ -87,11 +68,12 @@ struct xe_user_extension {
 	 *
 	 * Also note that the name space for this is not global for the whole
 	 * driver, but rather its scope/meaning is limited to the specific piece
-	 * of uAPI which has embedded the struct i915_user_extension.
+	 * of uAPI which has embedded the struct xe_user_extension.
 	 */
 	__u32 name;
+
 	/**
-	 * @flags: MBZ
+	 * @pad: MBZ
 	 *
 	 * All undefined bits must be zero.
 	 */
@@ -99,7 +81,7 @@ struct xe_user_extension {
 };
 
 /*
- * i915 specific ioctls.
+ * xe specific ioctls.
  *
  * The device specific ioctl range is [DRM_COMMAND_BASE, DRM_COMMAND_END) ie
  * [0x40, 0xa0) (a0 is excluded). The numbers below are defined as offset
@@ -125,57 +107,113 @@ struct xe_user_extension {
 #define DRM_IOCTL_XE_GEM_CREATE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_GEM_CREATE, struct drm_xe_gem_create)
 #define DRM_IOCTL_XE_GEM_MMAP_OFFSET		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_GEM_MMAP_OFFSET, struct drm_xe_gem_mmap_offset)
 #define DRM_IOCTL_XE_VM_CREATE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_CREATE, struct drm_xe_vm_create)
-#define DRM_IOCTL_XE_VM_DESTROY			DRM_IOW( DRM_COMMAND_BASE + DRM_XE_VM_DESTROY, struct drm_xe_vm_destroy)
-#define DRM_IOCTL_XE_VM_BIND			DRM_IOW( DRM_COMMAND_BASE + DRM_XE_VM_BIND, struct drm_xe_vm_bind)
+#define DRM_IOCTL_XE_VM_DESTROY			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_DESTROY, struct drm_xe_vm_destroy)
+#define DRM_IOCTL_XE_VM_BIND			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_BIND, struct drm_xe_vm_bind)
 #define DRM_IOCTL_XE_ENGINE_CREATE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_ENGINE_CREATE, struct drm_xe_engine_create)
 #define DRM_IOCTL_XE_ENGINE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_ENGINE_GET_PROPERTY, struct drm_xe_engine_get_property)
-#define DRM_IOCTL_XE_ENGINE_DESTROY		DRM_IOW( DRM_COMMAND_BASE + DRM_XE_ENGINE_DESTROY, struct drm_xe_engine_destroy)
-#define DRM_IOCTL_XE_EXEC			DRM_IOW( DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
+#define DRM_IOCTL_XE_ENGINE_DESTROY		 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_ENGINE_DESTROY, struct drm_xe_engine_destroy)
+#define DRM_IOCTL_XE_EXEC			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
 #define DRM_IOCTL_XE_MMIO			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MMIO, struct drm_xe_mmio)
-#define DRM_IOCTL_XE_ENGINE_SET_PROPERTY	DRM_IOW( DRM_COMMAND_BASE + DRM_XE_ENGINE_SET_PROPERTY, struct drm_xe_engine_set_property)
+#define DRM_IOCTL_XE_ENGINE_SET_PROPERTY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_ENGINE_SET_PROPERTY, struct drm_xe_engine_set_property)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
-#define DRM_IOCTL_XE_VM_MADVISE			DRM_IOW( DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
+#define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
 
-struct drm_xe_engine_class_instance {
-	__u16 engine_class;
-
-#define DRM_XE_ENGINE_CLASS_RENDER		0
-#define DRM_XE_ENGINE_CLASS_COPY		1
-#define DRM_XE_ENGINE_CLASS_VIDEO_DECODE	2
-#define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
-#define DRM_XE_ENGINE_CLASS_COMPUTE		4
-	/*
-	 * Kernel only class (not actual hardware engine class). Used for
-	 * creating ordered queues of VM bind operations.
+/**
+ * enum drm_xe_memory_class - Supported memory classes.
+ */
+enum drm_xe_memory_class {
+	/** @XE_MEM_REGION_CLASS_SYSMEM: Represents system memory. */
+	XE_MEM_REGION_CLASS_SYSMEM = 0,
+	/**
+	 * @XE_MEM_REGION_CLASS_VRAM: On discrete platforms, this
+	 * represents the memory that is local to the device, which we
+	 * call VRAM. Not valid on integrated platforms.
 	 */
-#define DRM_XE_ENGINE_CLASS_VM_BIND		5
-
-	__u16 engine_instance;
-	__u16 gt_id;
+	XE_MEM_REGION_CLASS_VRAM
 };
 
-#define XE_MEM_REGION_CLASS_SYSMEM	0
-#define XE_MEM_REGION_CLASS_VRAM	1
+/**
+ * struct drm_xe_query_mem_region - Describes some region as known to
+ * the driver.
+ */
+struct drm_xe_query_mem_region {
+	/**
+	 * @mem_class: The memory class describing this region.
+	 *
+	 * See enum drm_xe_memory_class for supported values.
+	 */
+	__u16 mem_class;
+	/**
+	 * @instance: The instance for this region.
+	 *
+	 * The @mem_class and @instance taken together will always give
+	 * a unique pair.
+	 */
+	__u16 instance;
+	/** @pad: MBZ */
+	__u32 pad;
+	/**
+	 * @min_page_size: Min page-size in bytes for this region.
+	 *
+	 * When the kernel allocates memory for this region, the
+	 * underlying pages will be at least @min_page_size in size.
+	 *
+	 * Important note: When userspace allocates a GTT address which
+	 * can point to memory allocated from this region, it must also
+	 * respect this minimum alignment. This is enforced by the
+	 * kernel.
+	 */
+	__u32 min_page_size;
+	/**
+	 * @max_page_size: Max page-size in bytes for this region.
+	 */
+	__u32 max_page_size;
+	/**
+	 * @total_size: The usable size in bytes for this region.
+	 */
+	__u64 total_size;
+	/**
+	 * @used: Estimate of the memory used in bytes for this region.
+	 *
+	 * Requires CAP_PERFMON or CAP_SYS_ADMIN to get reliable
+	 * accounting.  Without this the value here will always equal
+	 * zero.
+	 */
+	__u64 used;
+	/** @reserved: MBZ */
+	__u64 reserved[8];
+};
 
+/**
+ * struct drm_xe_query_mem_usage - describe memory regions and usage
+ *
+ * If a query is made with a struct drm_xe_device_query where .query
+ * is equal to DRM_XE_DEVICE_QUERY_MEM_USAGE, then the reply uses
+ * struct drm_xe_query_mem_usage in .data.
+ */
 struct drm_xe_query_mem_usage {
+	/** @num_regions: number of memory regions returned in @regions */
 	__u32 num_regions;
+	/** @pad: MBZ */
 	__u32 pad;
-
-	struct drm_xe_query_mem_region {
-		__u16 mem_class;
-		__u16 instance;	/* unique ID even among different classes */
-		__u32 pad;
-		__u32 min_page_size;
-		__u32 max_page_size;
-		__u64 total_size;
-		__u64 used;
-		__u64 reserved[8];
-	} regions[];
+	/** @regions: The returned regions for this device */
+	struct drm_xe_query_mem_region regions[];
 };
 
+/**
+ * struct drm_xe_query_config - describe the device configuration
+ *
+ * If a query is made with a struct drm_xe_device_query where .query
+ * is equal to DRM_XE_DEVICE_QUERY_CONFIG, then the reply uses
+ * struct drm_xe_query_config in .data.
+ */
 struct drm_xe_query_config {
+	/** @num_params: number of parameters returned in info */
 	__u32 num_params;
+
+	/** @pad: MBZ */
 	__u32 pad;
+
 #define XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
 #define XE_QUERY_CONFIG_FLAGS			1
 	#define XE_QUERY_CONFIG_FLAGS_HAS_VRAM		(0x1 << 0)
@@ -184,12 +222,24 @@ struct drm_xe_query_config {
 #define XE_QUERY_CONFIG_VA_BITS			3
 #define XE_QUERY_CONFIG_GT_COUNT		4
 #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
-#define XE_QUERY_CONFIG_NUM_PARAM		XE_QUERY_CONFIG_MEM_REGION_COUNT + 1
+#define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
+#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1)
+	/** @info: array of elements containing the config info */
 	__u64 info[];
 };
 
+/**
+ * struct drm_xe_query_gts - describe GTs
+ *
+ * If a query is made with a struct drm_xe_device_query where .query
+ * is equal to DRM_XE_DEVICE_QUERY_GTS, then the reply uses struct
+ * drm_xe_query_gts in .data.
+ */
 struct drm_xe_query_gts {
+	/** @num_gt: number of GTs returned in gts */
 	__u32 num_gt;
+
+	/** @pad: MBZ */
 	__u32 pad;
 
 	/*
@@ -212,15 +262,46 @@ struct drm_xe_query_gts {
 	} gts[];
 };
 
+/**
+ * struct drm_xe_query_topology_mask - describe the topology mask of a GT
+ *
+ * This is the hardware topology which reflects the internal physical
+ * structure of the GPU.
+ *
+ * If a query is made with a struct drm_xe_device_query where .query
+ * is equal to DRM_XE_DEVICE_QUERY_GT_TOPOLOGY, then the reply uses
+ * struct drm_xe_query_topology_mask in .data.
+ */
 struct drm_xe_query_topology_mask {
 	/** @gt_id: GT ID the mask is associated with */
 	__u16 gt_id;
 
-	/** @type: type of mask */
-	__u16 type;
+	/*
+	 * To query the mask of Dual Sub Slices (DSS) available for geometry
+	 * operations. For example a query response containing the following
+	 * in mask:
+	 *   DSS_GEOMETRY    ff ff ff ff 00 00 00 00
+	 * means 32 DSS are available for geometry.
+	 */
 #define XE_TOPO_DSS_GEOMETRY	(1 << 0)
+	/*
+	 * To query the mask of Dual Sub Slices (DSS) available for compute
+	 * operations. For example a query response containing the following
+	 * in mask:
+	 *   DSS_COMPUTE    ff ff ff ff 00 00 00 00
+	 * means 32 DSS are available for compute.
+	 */
 #define XE_TOPO_DSS_COMPUTE	(1 << 1)
+	/*
+	 * To query the mask of Execution Units (EU) available per Dual Sub
+	 * Slices (DSS). For example a query response containing the following
+	 * in mask:
+	 *   EU_PER_DSS    ff ff 00 00 00 00 00 00
+	 * means each DSS has 16 EU.
+	 */
 #define XE_TOPO_EU_PER_DSS	(1 << 2)
+	/** @type: type of mask */
+	__u16 type;
 
 	/** @num_bytes: number of bytes in requested mask */
 	__u32 num_bytes;
@@ -229,19 +310,53 @@ struct drm_xe_query_topology_mask {
 	__u8 mask[];
 };
 
+/**
+ * struct drm_xe_device_query - main structure to query device information
+ *
+ * If size is set to 0, the driver fills it with the required size for the
+ * requested type of data to query. If size is equal to the required size,
+ * the queried information is copied into data.
+ *
+ * For example the following code snippet allows retrieving and printing
+ * information about the device engines with DRM_XE_DEVICE_QUERY_ENGINES:
+ *
+ * .. code-block:: C
+ *
+ *	struct drm_xe_engine_class_instance *hwe;
+ *	struct drm_xe_device_query query = {
+ *		.extensions = 0,
+ *		.query = DRM_XE_DEVICE_QUERY_ENGINES,
+ *		.size = 0,
+ *		.data = 0,
+ *	};
+ *	ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
+ *	hwe = malloc(query.size);
+ *	query.data = (uintptr_t)hwe;
+ *	ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
+ *	int num_engines = query.size / sizeof(*hwe);
+ *	for (int i = 0; i < num_engines; i++) {
+ *		printf("Engine %d: %s\n", i,
+ *			hwe[i].engine_class == DRM_XE_ENGINE_CLASS_RENDER ? "RENDER":
+ *			hwe[i].engine_class == DRM_XE_ENGINE_CLASS_COPY ? "COPY":
+ *			hwe[i].engine_class == DRM_XE_ENGINE_CLASS_VIDEO_DECODE ? "VIDEO_DECODE":
+ *			hwe[i].engine_class == DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE ? "VIDEO_ENHANCE":
+ *			hwe[i].engine_class == DRM_XE_ENGINE_CLASS_COMPUTE ? "COMPUTE":
+ *			"UNKNOWN");
+ *	}
+ *	free(hwe);
+ */
 struct drm_xe_device_query {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-	/** @query: The type of data to query */
-	__u32 query;
-
 #define DRM_XE_DEVICE_QUERY_ENGINES	0
 #define DRM_XE_DEVICE_QUERY_MEM_USAGE	1
 #define DRM_XE_DEVICE_QUERY_CONFIG	2
 #define DRM_XE_DEVICE_QUERY_GTS		3
 #define DRM_XE_DEVICE_QUERY_HWCONFIG	4
 #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY	5
+	/** @query: The type of data to query */
+	__u32 query;
 
 	/** @size: Size of the queried data */
 	__u32 size;
@@ -264,12 +379,12 @@ struct drm_xe_gem_create {
 	 */
 	__u64 size;
 
+#define XE_GEM_CREATE_FLAG_DEFER_BACKING	(0x1 << 24)
+#define XE_GEM_CREATE_FLAG_SCANOUT		(0x1 << 25)
 	/**
 	 * @flags: Flags, currently a mask of memory instances of where BO can
 	 * be placed
 	 */
-#define XE_GEM_CREATE_FLAG_DEFER_BACKING	(0x1 << 24)
-#define XE_GEM_CREATE_FLAG_SCANOUT		(0x1 << 25)
 	__u32 flags;
 
 	/**
@@ -290,6 +405,9 @@ struct drm_xe_gem_create {
 	 */
 	__u32 handle;
 
+	/** @pad: MBZ */
+	__u32 pad;
+
 	/** @reserved: Reserved */
 	__u64 reserved[2];
 };
@@ -317,10 +435,13 @@ struct drm_xe_gem_mmap_offset {
 struct drm_xe_vm_bind_op_error_capture {
 	/** @error: errno that occured */
 	__s32 error;
+
 	/** @op: operation that encounter an error */
 	__u32 op;
+
 	/** @addr: address of bind op */
 	__u64 addr;
+
 	/** @size: size of bind */
 	__u64 size;
 };
@@ -330,10 +451,13 @@ struct drm_xe_ext_vm_set_property {
 	/** @base: base user extension */
 	struct xe_user_extension base;
 
-	/** @property: property to set */
 #define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
+	/** @property: property to set */
 	__u32 property;
 
+	/** @pad: MBZ */
+	__u32 pad;
+
 	/** @value: property value */
 	__u64 value;
 
@@ -342,17 +466,16 @@ struct drm_xe_ext_vm_set_property {
 };
 
 struct drm_xe_vm_create {
-	/** @extensions: Pointer to the first extension struct, if any */
 #define XE_VM_EXTENSION_SET_PROPERTY	0
+	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-	/** @flags: Flags */
-	__u32 flags;
-
 #define DRM_XE_VM_CREATE_SCRATCH_PAGE	(0x1 << 0)
 #define DRM_XE_VM_CREATE_COMPUTE_MODE	(0x1 << 1)
 #define DRM_XE_VM_CREATE_ASYNC_BIND_OPS	(0x1 << 2)
 #define DRM_XE_VM_CREATE_FAULT_MODE	(0x1 << 3)
+	/** @flags: Flags */
+	__u32 flags;
 
 	/** @vm_id: Returned VM ID */
 	__u32 vm_id;
@@ -378,12 +501,16 @@ struct drm_xe_vm_bind_op {
 	 */
 	__u32 obj;
 
+	/** @pad: MBZ */
+	__u32 pad;
+
 	union {
 		/**
 		 * @obj_offset: Offset into the object, MBZ for CLEAR_RANGE,
 		 * ignored for unbind
 		 */
 		__u64 obj_offset;
+
 		/** @userptr: user pointer to bind on */
 		__u64 userptr;
 	};
@@ -397,16 +524,10 @@ struct drm_xe_vm_bind_op {
 	__u64 addr;
 
 	/**
-	 * @gt_mask: Mask for which GTs to create binds for, 0 == All GTs,
+	 * @tile_mask: Mask for which tiles to create binds for, 0 == All tiles,
 	 * only applies to creating new VMAs
 	 */
-	__u64 gt_mask;
-
-	/** @op: Operation to perform (lower 16 bits) and flags (upper 16 bits) */
-	__u32 op;
-
-	/** @mem_region: Memory region to prefetch VMA to, instance not a mask */
-	__u32 region;
+	__u64 tile_mask;
 
 #define XE_VM_BIND_OP_MAP		0x0
 #define XE_VM_BIND_OP_UNMAP		0x1
@@ -427,8 +548,8 @@ struct drm_xe_vm_bind_op {
 	 * If this flag is clear and the IOCTL doesn't return an error, in
 	 * practice the bind op is good and will complete.
 	 *
-	 * If this flag is set and doesn't return return an error, the bind op
-	 * can still fail and recovery is needed. If configured, the bind op that
+	 * If this flag is set and doesn't return an error, the bind op can
+	 * still fail and recovery is needed. If configured, the bind op that
 	 * caused the error will be captured in drm_xe_vm_bind_op_error_capture.
 	 * Once the user sees the error (via a ufence +
 	 * XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS), it should free memory
@@ -446,6 +567,19 @@ struct drm_xe_vm_bind_op {
 	 * than differing the MAP to the page fault handler.
 	 */
 #define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 18)
+	/*
+	 * When the NULL flag is set, the page tables are setup with a special
+	 * bit which indicates writes are dropped and all reads return zero.  In
+	 * the future, the NULL flags will only be valid for XE_VM_BIND_OP_MAP
+	 * operations, the BO handle MBZ, and the BO offset MBZ. This flag is
+	 * intended to implement VK sparse bindings.
+	 */
+#define XE_VM_BIND_FLAG_NULL		(0x1 << 19)
+	/** @op: Operation to perform (lower 16 bits) and flags (upper 16 bits) */
+	__u32 op;
+
+	/** @mem_region: Memory region to prefetch VMA to, instance not a mask */
+	__u32 region;
 
 	/** @reserved: Reserved */
 	__u64 reserved[2];
@@ -468,9 +602,13 @@ struct drm_xe_vm_bind {
 	/** @num_binds: number of binds in this IOCTL */
 	__u32 num_binds;
 
+	/** @pad: MBZ */
+	__u32 pad;
+
 	union {
 		/** @bind: used if num_binds == 1 */
 		struct drm_xe_vm_bind_op bind;
+
 		/**
 		 * @vector_of_binds: userptr to array of struct
 		 * drm_xe_vm_bind_op if num_binds > 1
@@ -481,6 +619,9 @@ struct drm_xe_vm_bind {
 	/** @num_syncs: amount of syncs to wait on */
 	__u32 num_syncs;
 
+	/** @pad2: MBZ */
+	__u32 pad2;
+
 	/** @syncs: pointer to struct drm_xe_sync array */
 	__u64 syncs;
 
@@ -496,6 +637,9 @@ struct drm_xe_ext_engine_set_property {
 	/** @property: property to set */
 	__u32 property;
 
+	/** @pad: MBZ */
+	__u32 pad;
+
 	/** @value: property value */
 	__u64 value;
 };
@@ -512,7 +656,6 @@ struct drm_xe_engine_set_property {
 	/** @engine_id: Engine ID */
 	__u32 engine_id;
 
-	/** @property: property to set */
 #define XE_ENGINE_SET_PROPERTY_PRIORITY			0
 #define XE_ENGINE_SET_PROPERTY_TIMESLICE		1
 #define XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
@@ -528,6 +671,7 @@ struct drm_xe_engine_set_property {
 #define XE_ENGINE_SET_PROPERTY_ACC_TRIGGER		6
 #define XE_ENGINE_SET_PROPERTY_ACC_NOTIFY		7
 #define XE_ENGINE_SET_PROPERTY_ACC_GRANULARITY		8
+	/** @property: property to set */
 	__u32 property;
 
 	/** @value: property value */
@@ -537,9 +681,27 @@ struct drm_xe_engine_set_property {
 	__u64 reserved[2];
 };
 
+/** struct drm_xe_engine_class_instance - instance of an engine class */
+struct drm_xe_engine_class_instance {
+#define DRM_XE_ENGINE_CLASS_RENDER		0
+#define DRM_XE_ENGINE_CLASS_COPY		1
+#define DRM_XE_ENGINE_CLASS_VIDEO_DECODE	2
+#define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
+#define DRM_XE_ENGINE_CLASS_COMPUTE		4
+	/*
+	 * Kernel only class (not actual hardware engine class). Used for
+	 * creating ordered queues of VM bind operations.
+	 */
+#define DRM_XE_ENGINE_CLASS_VM_BIND		5
+	__u16 engine_class;
+
+	__u16 engine_instance;
+	__u16 gt_id;
+};
+
 struct drm_xe_engine_create {
-	/** @extensions: Pointer to the first extension struct, if any */
 #define XE_ENGINE_EXTENSION_SET_PROPERTY               0
+	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
 	/** @width: submission width (number BB per exec) for this engine */
@@ -577,8 +739,8 @@ struct drm_xe_engine_get_property {
 	/** @engine_id: Engine ID */
 	__u32 engine_id;
 
-	/** @property: property to get */
 #define XE_ENGINE_GET_PROPERTY_BAN			0
+	/** @property: property to get */
 	__u32 property;
 
 	/** @value: property value */
@@ -603,16 +765,19 @@ struct drm_xe_sync {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-	__u32 flags;
-
 #define DRM_XE_SYNC_SYNCOBJ		0x0
 #define DRM_XE_SYNC_TIMELINE_SYNCOBJ	0x1
 #define DRM_XE_SYNC_DMA_BUF		0x2
 #define DRM_XE_SYNC_USER_FENCE		0x3
 #define DRM_XE_SYNC_SIGNAL		0x10
+	__u32 flags;
+
+	/** @pad: MBZ */
+	__u32 pad;
 
 	union {
 		__u32 handle;
+
 		/**
 		 * @addr: Address of user fence. When sync passed in via exec
 		 * IOCTL this a GPU address in the VM. When sync passed in via
@@ -644,9 +809,9 @@ struct drm_xe_exec {
 	__u64 syncs;
 
 	/**
-	  * @address: address of batch buffer if num_batch_buffer == 1 or an
-	  * array of batch buffer addresses
-	  */
+	 * @address: address of batch buffer if num_batch_buffer == 1 or an
+	 * array of batch buffer addresses
+	 */
 	__u64 address;
 
 	/**
@@ -655,6 +820,9 @@ struct drm_xe_exec {
 	 */
 	__u16 num_batch_buffer;
 
+	/** @pad: MBZ */
+	__u16 pad[3];
+
 	/** @reserved: Reserved */
 	__u64 reserved[2];
 };
@@ -665,8 +833,6 @@ struct drm_xe_mmio {
 
 	__u32 addr;
 
-	__u32 flags;
-
 #define DRM_XE_MMIO_8BIT	0x0
 #define DRM_XE_MMIO_16BIT	0x1
 #define DRM_XE_MMIO_32BIT	0x2
@@ -674,6 +840,7 @@ struct drm_xe_mmio {
 #define DRM_XE_MMIO_BITS_MASK	0x3
 #define DRM_XE_MMIO_READ	0x4
 #define DRM_XE_MMIO_WRITE	0x8
+	__u32 flags;
 
 	__u64 value;
 
@@ -693,45 +860,57 @@ struct drm_xe_mmio {
 struct drm_xe_wait_user_fence {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
+
 	union {
 		/**
 		 * @addr: user pointer address to wait on, must qword aligned
 		 */
 		__u64 addr;
+
 		/**
 		 * @vm_id: The ID of the VM which encounter an error used with
 		 * DRM_XE_UFENCE_WAIT_VM_ERROR. Upper 32 bits must be clear.
 		 */
 		__u64 vm_id;
 	};
-	/** @op: wait operation (type of comparison) */
+
 #define DRM_XE_UFENCE_WAIT_EQ	0
 #define DRM_XE_UFENCE_WAIT_NEQ	1
 #define DRM_XE_UFENCE_WAIT_GT	2
 #define DRM_XE_UFENCE_WAIT_GTE	3
 #define DRM_XE_UFENCE_WAIT_LT	4
 #define DRM_XE_UFENCE_WAIT_LTE	5
+	/** @op: wait operation (type of comparison) */
 	__u16 op;
-	/** @flags: wait flags */
+
 #define DRM_XE_UFENCE_WAIT_SOFT_OP	(1 << 0)	/* e.g. Wait on VM bind */
 #define DRM_XE_UFENCE_WAIT_ABSTIME	(1 << 1)
 #define DRM_XE_UFENCE_WAIT_VM_ERROR	(1 << 2)
+	/** @flags: wait flags */
 	__u16 flags;
+
+	/** @pad: MBZ */
+	__u32 pad;
+
 	/** @value: compare value */
 	__u64 value;
-	/** @mask: comparison mask */
+
 #define DRM_XE_UFENCE_WAIT_U8		0xffu
 #define DRM_XE_UFENCE_WAIT_U16		0xffffu
 #define DRM_XE_UFENCE_WAIT_U32		0xffffffffu
 #define DRM_XE_UFENCE_WAIT_U64		0xffffffffffffffffu
+	/** @mask: comparison mask */
 	__u64 mask;
+
 	/** @timeout: how long to wait before bailing, value in jiffies */
 	__s64 timeout;
+
 	/**
 	 * @num_engines: number of engine instances to wait on, must be zero
 	 * when DRM_XE_UFENCE_WAIT_SOFT_OP set
 	 */
 	__u64 num_engines;
+
 	/**
 	 * @instances: user pointer to array of drm_xe_engine_class_instance to
 	 * wait on, must be NULL when DRM_XE_UFENCE_WAIT_SOFT_OP set
@@ -749,6 +928,9 @@ struct drm_xe_vm_madvise {
 	/** @vm_id: The ID VM in which the VMA exists */
 	__u32 vm_id;
 
+	/** @pad: MBZ */
+	__u32 pad;
+
 	/** @range: Number of bytes in the VMA */
 	__u64 range;
 
@@ -759,6 +941,9 @@ struct drm_xe_vm_madvise {
 	 * Setting the preferred location will trigger a migrate of the VMA
 	 * backing store to new location if the backing store is already
 	 * allocated.
+	 *
+	 * For DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS usage, see enum
+	 * drm_xe_memory_class.
 	 */
 #define DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS	0
 #define DRM_XE_VM_MADVISE_PREFERRED_GT		1
@@ -789,10 +974,12 @@ struct drm_xe_vm_madvise {
 #define		DRM_XE_VMA_PRIORITY_HIGH	2	/* Must be elevated user */
 	/* Pin the VMA in memory, must be elevated user */
 #define DRM_XE_VM_MADVISE_PIN			6
-
 	/** @property: property to set */
 	__u32 property;
 
+	/** @pad2: MBZ */
+	__u32 pad2;
+
 	/** @value: property value */
 	__u64 value;
 
diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
index 479ded70f29b..3c26e1ed799d 100644
--- a/tests/xe/xe_vm.c
+++ b/tests/xe/xe_vm.c
@@ -892,7 +892,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 		bind_ops[i].obj_offset = 0;
 		bind_ops[i].range = bo_size;
 		bind_ops[i].addr = addr;
-		bind_ops[i].gt_mask = 0x1 << eci->gt_id;
+		bind_ops[i].tile_mask = 0x1 << eci->gt_id;
 		bind_ops[i].op = XE_VM_BIND_OP_MAP | XE_VM_BIND_FLAG_ASYNC;
 		bind_ops[i].region = 0;
 		bind_ops[i].reserved[0] = 0;
-- 
2.38.0
