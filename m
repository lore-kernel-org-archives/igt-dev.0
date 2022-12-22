Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2BE810E5BA
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Dec 2022 22:55:02 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 22 Dec 2022 14:47:47 -0800
Message-Id: <20221222224747.34894-2-matthew.brost@intel.com>
In-Reply-To: <20221222224747.34894-1-matthew.brost@intel.com>
References: <20221222224747.34894-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC PATCH 1/1] Xe: Introduce initial tests for the new
 Intel Xe GPU driver.
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

Xe, is a new driver for Intel GPUs that supports both integrated and
discrete platforms starting with Tiger Lake (first Intel Xe Architecture).

This initial work is a collaboration of many people and unfortunately
the big squashed patch won't fully honor the proper credits. But let's
get some git quick stats so we can at least try to preserve some of the
credits:

Co-developed-by: Matthew Brost <matthew.brost@intel.com>
[commits: 90 / lines changed: 12580]
Co-developed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
[commits: 4 / lines changed: 33]
Co-developed-by: Francois Dugast <francois.dugast@intel.com>
[commits: 7 / lines changed: 820]
Co-developed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
[commits: 2 / lines changed: 774]
Co-developed-by: Philippe Lecluse <philippe.lecluse@intel.com>
[commits: 4 / lines changed: 417]
Co-developed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
[commits: 13 / lines changed: 1090]
Co-developed-by: Ryszard Knop <ryszard.knop@intel.com>
[commits: 1 / lines changed: 12]
Co-developed-by: Jason Ekstrand <jason@jlekstrand.net>
[commits: 14 / lines changed: 1418]
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/drm-uapi/xe_drm.h       |  786 +++++++++++++++
 lib/drmtest.c                   |    3 +
 lib/drmtest.h                   |    1 +
 lib/meson.build                 |    4 +
 lib/xe/xe_compute.c             |  327 +++++++
 lib/xe/xe_compute.h             |   93 ++
 lib/xe/xe_ioctl.c               |  441 +++++++++
 lib/xe/xe_ioctl.h               |  107 +++
 lib/xe/xe_query.c               |  267 ++++++
 lib/xe/xe_query.h               |   76 ++
 lib/xe/xe_spin.c                |  157 +++
 lib/xe/xe_spin.h                |   66 ++
 meson.build                     |    8 +
 tests/meson.build               |    1 +
 tests/xe/meson.build            |   30 +
 tests/xe/xe_compute.c           |  130 +++
 tests/xe/xe_dma_buf_sync.c      |  226 +++++
 tests/xe/xe_evict.c             |  619 ++++++++++++
 tests/xe/xe_exec_balancer.c     |  620 ++++++++++++
 tests/xe/xe_exec_basic.c        |  294 ++++++
 tests/xe/xe_exec_compute_mode.c |  303 ++++++
 tests/xe/xe_exec_fault_mode.c   |  471 +++++++++
 tests/xe/xe_exec_reset.c        |  806 ++++++++++++++++
 tests/xe/xe_exec_threads.c      | 1148 ++++++++++++++++++++++
 tests/xe/xe_guc_pc.c            |  424 +++++++++
 tests/xe/xe_huc_copy.c          |  187 ++++
 tests/xe/xe_live_ktest.c        |   17 +
 tests/xe/xe_mmap.c              |   57 ++
 tests/xe/xe_pm.c                |  384 ++++++++
 tests/xe/xe_prime_self_import.c |  462 +++++++++
 tests/xe/xe_query.c             |  431 +++++++++
 tests/xe/xe_vm.c                | 1577 +++++++++++++++++++++++++++++++
 tests/xe/xe_waitfence.c         |   88 ++
 tools/meson.build               |    1 +
 tools/xe_reg.c                  |  366 +++++++
 35 files changed, 10978 insertions(+)
 create mode 100644 include/drm-uapi/xe_drm.h
 create mode 100644 lib/xe/xe_compute.c
 create mode 100644 lib/xe/xe_compute.h
 create mode 100644 lib/xe/xe_ioctl.c
 create mode 100644 lib/xe/xe_ioctl.h
 create mode 100644 lib/xe/xe_query.c
 create mode 100644 lib/xe/xe_query.h
 create mode 100644 lib/xe/xe_spin.c
 create mode 100644 lib/xe/xe_spin.h
 create mode 100644 tests/xe/meson.build
 create mode 100644 tests/xe/xe_compute.c
 create mode 100644 tests/xe/xe_dma_buf_sync.c
 create mode 100644 tests/xe/xe_evict.c
 create mode 100644 tests/xe/xe_exec_balancer.c
 create mode 100644 tests/xe/xe_exec_basic.c
 create mode 100644 tests/xe/xe_exec_compute_mode.c
 create mode 100644 tests/xe/xe_exec_fault_mode.c
 create mode 100644 tests/xe/xe_exec_reset.c
 create mode 100644 tests/xe/xe_exec_threads.c
 create mode 100644 tests/xe/xe_guc_pc.c
 create mode 100644 tests/xe/xe_huc_copy.c
 create mode 100644 tests/xe/xe_live_ktest.c
 create mode 100644 tests/xe/xe_mmap.c
 create mode 100644 tests/xe/xe_pm.c
 create mode 100644 tests/xe/xe_prime_self_import.c
 create mode 100644 tests/xe/xe_query.c
 create mode 100644 tests/xe/xe_vm.c
 create mode 100644 tests/xe/xe_waitfence.c
 create mode 100644 tools/xe_reg.c

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
new file mode 100644
index 00000000..d26621b5
--- /dev/null
+++ b/include/drm-uapi/xe_drm.h
@@ -0,0 +1,786 @@
+/*
+ * Copyright 2021 Intel Corporation. All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sub license, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portions
+ * of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
+ * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT.
+ * IN NO EVENT SHALL TUNGSTEN GRAPHICS AND/OR ITS SUPPLIERS BE LIABLE FOR
+ * ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
+ * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
+ * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+#ifndef _UAPI_XE_DRM_H_
+#define _UAPI_XE_DRM_H_
+
+#include "drm.h"
+
+#if defined(__cplusplus)
+extern "C" {
+#endif
+
+/* Please note that modifications to all structs defined here are
+ * subject to backwards-compatibility constraints.
+ */
+
+/**
+ * struct i915_user_extension - Base class for defining a chain of extensions
+ *
+ * Many interfaces need to grow over time. In most cases we can simply
+ * extend the struct and have userspace pass in more data. Another option,
+ * as demonstrated by Vulkan's approach to providing extensions for forward
+ * and backward compatibility, is to use a list of optional structs to
+ * provide those extra details.
+ *
+ * The key advantage to using an extension chain is that it allows us to
+ * redefine the interface more easily than an ever growing struct of
+ * increasing complexity, and for large parts of that interface to be
+ * entirely optional. The downside is more pointer chasing; chasing across
+ * the __user boundary with pointers encapsulated inside u64.
+ *
+ * Example chaining:
+ *
+ * .. code-block:: C
+ *
+ *	struct i915_user_extension ext3 {
+ *		.next_extension = 0, // end
+ *		.name = ...,
+ *	};
+ *	struct i915_user_extension ext2 {
+ *		.next_extension = (uintptr_t)&ext3,
+ *		.name = ...,
+ *	};
+ *	struct i915_user_extension ext1 {
+ *		.next_extension = (uintptr_t)&ext2,
+ *		.name = ...,
+ *	};
+ *
+ * Typically the struct i915_user_extension would be embedded in some uAPI
+ * struct, and in this case we would feed it the head of the chain(i.e ext1),
+ * which would then apply all of the above extensions.
+ *
+ */
+struct xe_user_extension {
+	/**
+	 * @next_extension:
+	 *
+	 * Pointer to the next struct i915_user_extension, or zero if the end.
+	 */
+	__u64 next_extension;
+	/**
+	 * @name: Name of the extension.
+	 *
+	 * Note that the name here is just some integer.
+	 *
+	 * Also note that the name space for this is not global for the whole
+	 * driver, but rather its scope/meaning is limited to the specific piece
+	 * of uAPI which has embedded the struct i915_user_extension.
+	 */
+	__u32 name;
+	/**
+	 * @flags: MBZ
+	 *
+	 * All undefined bits must be zero.
+	 */
+	__u32 pad;
+};
+
+/*
+ * i915 specific ioctls.
+ *
+ * The device specific ioctl range is [DRM_COMMAND_BASE, DRM_COMMAND_END) ie
+ * [0x40, 0xa0) (a0 is excluded). The numbers below are defined as offset
+ * against DRM_COMMAND_BASE and should be between [0x0, 0x60).
+ */
+#define DRM_XE_DEVICE_QUERY		0x00
+#define DRM_XE_GEM_CREATE		0x01
+#define DRM_XE_GEM_MMAP_OFFSET		0x02
+#define DRM_XE_VM_CREATE		0x03
+#define DRM_XE_VM_DESTROY		0x04
+#define DRM_XE_VM_BIND			0x05
+#define DRM_XE_ENGINE_CREATE		0x06
+#define DRM_XE_ENGINE_DESTROY		0x07
+#define DRM_XE_EXEC			0x08
+#define DRM_XE_MMIO			0x09
+#define DRM_XE_ENGINE_SET_PROPERTY	0x0a
+#define DRM_XE_WAIT_USER_FENCE		0x0b
+#define DRM_XE_VM_MADVISE		0x0c
+
+/* Must be kept compact -- no holes */
+#define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
+#define DRM_IOCTL_XE_GEM_CREATE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_GEM_CREATE, struct drm_xe_gem_create)
+#define DRM_IOCTL_XE_GEM_MMAP_OFFSET		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_GEM_MMAP_OFFSET, struct drm_xe_gem_mmap_offset)
+#define DRM_IOCTL_XE_VM_CREATE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_CREATE, struct drm_xe_vm_create)
+#define DRM_IOCTL_XE_VM_DESTROY			DRM_IOW( DRM_COMMAND_BASE + DRM_XE_VM_DESTROY, struct drm_xe_vm_destroy)
+#define DRM_IOCTL_XE_VM_BIND			DRM_IOW( DRM_COMMAND_BASE + DRM_XE_VM_BIND, struct drm_xe_vm_bind)
+#define DRM_IOCTL_XE_ENGINE_CREATE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_ENGINE_CREATE, struct drm_xe_engine_create)
+#define DRM_IOCTL_XE_ENGINE_DESTROY		DRM_IOW( DRM_COMMAND_BASE + DRM_XE_ENGINE_DESTROY, struct drm_xe_engine_destroy)
+#define DRM_IOCTL_XE_EXEC			DRM_IOW( DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
+#define DRM_IOCTL_XE_MMIO			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MMIO, struct drm_xe_mmio)
+#define DRM_IOCTL_XE_ENGINE_SET_PROPERTY	DRM_IOW( DRM_COMMAND_BASE + DRM_XE_ENGINE_SET_PROPERTY, struct drm_xe_engine_set_property)
+#define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
+#define DRM_IOCTL_XE_VM_MADVISE			DRM_IOW( DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
+
+struct drm_xe_engine_class_instance {
+	__u16 engine_class;
+
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
+
+	__u16 engine_instance;
+	__u16 gt_id;
+};
+
+#define XE_MEM_REGION_CLASS_SYSMEM	0
+#define XE_MEM_REGION_CLASS_VRAM	1
+
+struct drm_xe_query_mem_usage {
+	__u32 num_regions;
+	__u32 pad;
+
+	struct drm_xe_query_mem_region {
+		__u16 mem_class;
+		__u16 instance;	/* unique ID even among different classes */
+		__u32 pad;
+		__u32 min_page_size;
+		__u32 max_page_size;
+		__u64 total_size;
+		__u64 used;
+		__u64 reserved[8];
+	} regions[];
+};
+
+struct drm_xe_query_config {
+	__u32 num_params;
+	__u32 pad;
+#define XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
+#define XE_QUERY_CONFIG_FLAGS			1
+	#define XE_QUERY_CONFIG_FLAGS_HAS_VRAM		(0x1 << 0)
+	#define XE_QUERY_CONFIG_FLAGS_USE_GUC		(0x1 << 1)
+#define XE_QUERY_CONFIG_MIN_ALIGNEMENT		2
+#define XE_QUERY_CONFIG_VA_BITS			3
+#define XE_QUERY_CONFIG_GT_COUNT		4
+#define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
+#define XE_QUERY_CONFIG_NUM_PARAM		XE_QUERY_CONFIG_MEM_REGION_COUNT + 1
+	__u64 info[];
+};
+
+struct drm_xe_query_gts {
+	__u32 num_gt;
+	__u32 pad;
+
+	/*
+	 * TODO: Perhaps info about every mem region relative to this GT? e.g.
+	 * bandwidth between this GT and remote region?
+	 */
+
+	struct drm_xe_query_gt {
+#define XE_QUERY_GT_TYPE_MAIN		0
+#define XE_QUERY_GT_TYPE_REMOTE		1
+#define XE_QUERY_GT_TYPE_MEDIA		2
+		__u16 type;
+		__u16 instance;
+		__u32 clock_freq;
+		__u64 features;
+		__u64 native_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
+		__u64 slow_mem_regions;		/* bit mask of instances from drm_xe_query_mem_usage */
+		__u64 inaccessible_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
+		__u64 reserved[8];
+	} gts[];
+};
+
+struct drm_xe_query_topology_mask {
+	/** @gt_id: GT ID the mask is associated with */
+	__u16 gt_id;
+
+	/** @type: type of mask */
+	__u16 type;
+#define XE_TOPO_DSS_GEOMETRY	(1 << 0)
+#define XE_TOPO_DSS_COMPUTE	(1 << 1)
+#define XE_TOPO_EU_PER_DSS	(1 << 2)
+
+	/** @num_bytes: number of bytes in requested mask */
+	__u32 num_bytes;
+
+	/** @mask: little-endian mask of @num_bytes */
+	__u8 mask[];
+};
+
+struct drm_xe_device_query {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @query: The type of data to query */
+	__u32 query;
+
+#define DRM_XE_DEVICE_QUERY_ENGINES	0
+#define DRM_XE_DEVICE_QUERY_MEM_USAGE	1
+#define DRM_XE_DEVICE_QUERY_CONFIG	2
+#define DRM_XE_DEVICE_QUERY_GTS		3
+#define DRM_XE_DEVICE_QUERY_HWCONFIG	4
+#define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY	5
+
+	/** @size: Size of the queried data */
+	__u32 size;
+
+	/** @data: Queried data is placed here */
+	__u64 data;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
+struct drm_xe_gem_create {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/**
+	 * @size: Requested size for the object
+	 *
+	 * The (page-aligned) allocated size for the object will be returned.
+	 */
+	__u64 size;
+
+	/**
+	 * @flags: Flags, currently a mask of memory instances of where BO can
+	 * be placed
+	 */
+#define XE_GEM_CREATE_FLAG_DEFER_BACKING	(0x1 << 24)
+	__u32 flags;
+
+	/**
+	 * @vm_id: Attached VM, if any
+	 *
+	 * If a VM is specified, this BO must:
+	 *
+	 *  1. Only ever be bound to that VM.
+	 *
+	 *  2. Cannot be exported as a PRIME fd.
+	 */
+	__u32 vm_id;
+
+	/**
+	 * @handle: Returned handle for the object.
+	 *
+	 * Object handles are nonzero.
+	 */
+	__u32 handle;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
+struct drm_xe_gem_mmap_offset {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @handle: Handle for the object being mapped. */
+	__u32 handle;
+
+	/** @flags: Must be zero */
+	__u32 flags;
+
+	/** @offset: The fake offset to use for subsequent mmap call */
+	__u64 offset;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
+/**
+ * struct drm_xe_vm_bind_op_error_capture - format of VM bind op error capture
+ */
+struct drm_xe_vm_bind_op_error_capture {
+	/** @error: errno that occured */
+	__s32 error;
+	/** @op: operation that encounter an error */
+	__u32 op;
+	/** @addr: address of bind op */
+	__u64 addr;
+	/** @size: size of bind */
+	__u64 size;
+};
+
+/** struct drm_xe_ext_vm_set_property - VM set property extension */
+struct drm_xe_ext_vm_set_property {
+	/** @base: base user extension */
+	struct xe_user_extension base;
+
+	/** @property: property to set */
+#define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
+	__u32 property;
+
+	/** @value: property value */
+	__u64 value;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
+struct drm_xe_vm_create {
+	/** @extensions: Pointer to the first extension struct, if any */
+#define XE_VM_EXTENSION_SET_PROPERTY	0
+	__u64 extensions;
+
+	/** @flags: Flags */
+	__u32 flags;
+
+#define DRM_XE_VM_CREATE_SCRATCH_PAGE	(0x1 << 0)
+#define DRM_XE_VM_CREATE_COMPUTE_MODE	(0x1 << 1)
+#define DRM_XE_VM_CREATE_ASYNC_BIND_OPS	(0x1 << 2)
+#define DRM_XE_VM_CREATE_FAULT_MODE	(0x1 << 3)
+
+	/** @vm_id: Returned VM ID */
+	__u32 vm_id;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
+struct drm_xe_vm_destroy {
+	/** @vm_id: VM ID */
+	__u32 vm_id;
+
+	/** @pad: MBZ */
+	__u32 pad;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
+struct drm_xe_vm_bind_op {
+	/**
+	 * @obj: GEM object to operate on, MBZ for MAP_USERPTR, MBZ for UNMAP
+	 */
+	__u32 obj;
+
+	union {
+		/**
+		 * @obj_offset: Offset into the object, MBZ for CLEAR_RANGE,
+		 * ignored for unbind
+		 */
+		__u64 obj_offset;
+		/** @userptr: user pointer to bind on */
+		__u64 userptr;
+	};
+
+	/**
+	 * @range: Number of bytes from the object to bind to addr, MBZ for UNMAP_ALL
+	 */
+	__u64 range;
+
+	/** @addr: Address to operate on, MBZ for UNMAP_ALL */
+	__u64 addr;
+
+	/**
+	 * @gt_mask: Mask for which GTs to create binds for, 0 == All GTs,
+	 * only applies to creating new VMAs
+	 */
+	__u64 gt_mask;
+
+	/** @op: Operation to perform (lower 16 bits) and flags (upper 16 bits) */
+	__u32 op;
+
+	/** @mem_region: Memory region to prefetch VMA to, instance not a mask */
+	__u32 region;
+
+#define XE_VM_BIND_OP_MAP		0x0
+#define XE_VM_BIND_OP_UNMAP		0x1
+#define XE_VM_BIND_OP_MAP_USERPTR	0x2
+#define XE_VM_BIND_OP_RESTART		0x3
+#define XE_VM_BIND_OP_UNMAP_ALL		0x4
+#define XE_VM_BIND_OP_PREFETCH		0x5
+
+#define XE_VM_BIND_FLAG_READONLY	(0x1 << 16)
+	/*
+	 * A bind ops completions are always async, hence the support for out
+	 * sync. This flag indicates the allocation of the memory for new page
+	 * tables and the job to program the pages tables is asynchronous
+	 * relative to the IOCTL. That part of a bind operation can fail under
+	 * memory pressure, the job in practice can't fail unless the system is
+	 * totally shot.
+	 *
+	 * If this flag is clear and the IOCTL doesn't return an error, in
+	 * practice the bind op is good and will complete.
+	 *
+	 * If this flag is set and doesn't return return an error, the bind op
+	 * can still fail and recovery is needed. If configured, the bind op that
+	 * caused the error will be captured in drm_xe_vm_bind_op_error_capture.
+	 * Once the user sees the error (via a ufence +
+	 * XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS), it should free memory
+	 * via non-async unbinds, and then restart all queue'd async binds op via
+	 * XE_VM_BIND_OP_RESTART. Or alternatively the user should destroy the
+	 * VM.
+	 *
+	 * This flag is only allowed when DRM_XE_VM_CREATE_ASYNC_BIND_OPS is
+	 * configured in the VM and must be set if the VM is configured with
+	 * DRM_XE_VM_CREATE_ASYNC_BIND_OPS and not in an error state.
+	 */
+#define XE_VM_BIND_FLAG_ASYNC		(0x1 << 17)
+	/*
+	 * Valid on a faulting VM only, do the MAP operation immediately rather
+	 * than differing the MAP to the page fault handler.
+	 */
+#define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 18)
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
+struct drm_xe_vm_bind {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @vm_id: The ID of the VM to bind to */
+	__u32 vm_id;
+
+	/**
+	 * @engine_id: engine_id, must be of class DRM_XE_ENGINE_CLASS_VM_BIND
+	 * and engine must have same vm_id. If zero, the default VM bind engine
+	 * is used.
+	 */
+	__u32 engine_id;
+
+	/** @num_binds: number of binds in this IOCTL */
+	__u32 num_binds;
+
+	union {
+		/** @bind: used if num_binds == 1 */
+		struct drm_xe_vm_bind_op bind;
+		/**
+		 * @vector_of_binds: userptr to array of struct
+		 * drm_xe_vm_bind_op if num_binds > 1
+		 */
+		__u64 vector_of_binds;
+	};
+
+	/** @num_syncs: amount of syncs to wait on */
+	__u32 num_syncs;
+
+	/** @syncs: pointer to struct drm_xe_sync array */
+	__u64 syncs;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
+/** struct drm_xe_ext_engine_set_property - engine set property extension */
+struct drm_xe_ext_engine_set_property {
+	/** @base: base user extension */
+	struct xe_user_extension base;
+
+	/** @property: property to set */
+	__u32 property;
+
+	/** @value: property value */
+	__u64 value;
+};
+
+/**
+ * struct drm_xe_engine_set_property - engine set property
+ *
+ * Same namespace for extensions as drm_xe_engine_create
+ */
+struct drm_xe_engine_set_property {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @engine_id: Engine ID */
+	__u32 engine_id;
+
+	/** @property: property to set */
+#define XE_ENGINE_PROPERTY_PRIORITY			0
+#define XE_ENGINE_PROPERTY_TIMESLICE			1
+#define XE_ENGINE_PROPERTY_PREEMPTION_TIMEOUT		2
+	/*
+	 * Long running or ULLS engine mode. DMA fences not allowed in this
+	 * mode. Must match the value of DRM_XE_VM_CREATE_COMPUTE_MODE, serves
+	 * as a sanity check the UMD knows what it is doing. Can only be set at
+	 * engine create time.
+	 */
+#define XE_ENGINE_PROPERTY_COMPUTE_MODE			3
+#define XE_ENGINE_PROPERTY_PERSISTENCE			4
+#define XE_ENGINE_PROPERTY_JOB_TIMEOUT			5
+#define XE_ENGINE_PROPERTY_ACC_TRIGGER			6
+#define XE_ENGINE_PROPERTY_ACC_NOTIFY			7
+#define XE_ENGINE_PROPERTY_ACC_GRANULARITY		8
+	__u32 property;
+
+	/** @value: property value */
+	__u64 value;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
+struct drm_xe_engine_create {
+	/** @extensions: Pointer to the first extension struct, if any */
+#define XE_ENGINE_EXTENSION_SET_PROPERTY               0
+	__u64 extensions;
+
+	/** @width: submission width (number BB per exec) for this engine */
+	__u16 width;
+
+	/** @num_placements: number of valid placements for this engine */
+	__u16 num_placements;
+
+	/** @vm_id: VM to use for this engine */
+	__u32 vm_id;
+
+	/** @flags: MBZ */
+	__u32 flags;
+
+	/** @engine_id: Returned engine ID */
+	__u32 engine_id;
+
+	/**
+	 * @instances: user pointer to a 2-d array of struct
+	 * drm_xe_engine_class_instance
+	 *
+	 * length = width (i) * num_placements (j)
+	 * index = j + i * width
+	 */
+	__u64 instances;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
+struct drm_xe_engine_destroy {
+	/** @vm_id: VM ID */
+	__u32 engine_id;
+
+	/** @pad: MBZ */
+	__u32 pad;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
+struct drm_xe_sync {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	__u32 flags;
+
+#define DRM_XE_SYNC_SYNCOBJ		0x0
+#define DRM_XE_SYNC_TIMELINE_SYNCOBJ	0x1
+#define DRM_XE_SYNC_DMA_BUF		0x2
+#define DRM_XE_SYNC_USER_FENCE		0x3
+#define DRM_XE_SYNC_SIGNAL		0x10
+
+	union {
+		__u32 handle;
+		/**
+		 * @addr: Address of user fence. When sync passed in via exec
+		 * IOCTL this a GPU address in the VM. When sync passed in via
+		 * VM bind IOCTL this is a user pointer. In either case, it is
+		 * the users responsibility that this address is present and
+		 * mapped when the user fence is signalled. Must be qword
+		 * aligned.
+		 */
+		__u64 addr;
+	};
+
+	__u64 timeline_value;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
+struct drm_xe_exec {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @vm_id: VM ID to run batch buffer in */
+	__u32 engine_id;
+
+	/** @num_syncs: Amount of struct drm_xe_sync in array. */
+	__u32 num_syncs;
+
+	/** @syncs: Pointer to struct drm_xe_sync array. */
+	__u64 syncs;
+
+	/**
+	  * @address: address of batch buffer if num_batch_buffer == 1 or an
+	  * array of batch buffer addresses
+	  */
+	__u64 address;
+
+	/**
+	 * @num_batch_buffer: number of batch buffer in this exec, must match
+	 * the width of the engine
+	 */
+	__u16 num_batch_buffer;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
+struct drm_xe_mmio {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	__u32 addr;
+
+	__u32 flags;
+
+#define DRM_XE_MMIO_8BIT	0x0
+#define DRM_XE_MMIO_16BIT	0x1
+#define DRM_XE_MMIO_32BIT	0x2
+#define DRM_XE_MMIO_64BIT	0x3
+#define DRM_XE_MMIO_BITS_MASK	0x3
+#define DRM_XE_MMIO_READ	0x4
+#define DRM_XE_MMIO_WRITE	0x8
+
+	__u64 value;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
+/**
+ * struct drm_xe_wait_user_fence - wait user fence
+ *
+ * Wait on user fence, XE will wakeup on every HW engine interrupt in the
+ * instances list and check if user fence is complete:
+ * (*addr & MASK) OP (VALUE & MASK)
+ *
+ * Returns to user on user fence completion or timeout.
+ */
+struct drm_xe_wait_user_fence {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+	union {
+		/**
+		 * @addr: user pointer address to wait on, must qword aligned
+		 */
+		__u64 addr;
+		/**
+		 * @vm_id: The ID of the VM which encounter an error used with
+		 * DRM_XE_UFENCE_WAIT_VM_ERROR. Upper 32 bits must be clear.
+		 */
+		__u64 vm_id;
+	};
+	/** @op: wait operation (type of comparison) */
+#define DRM_XE_UFENCE_WAIT_EQ	0
+#define DRM_XE_UFENCE_WAIT_NEQ	1
+#define DRM_XE_UFENCE_WAIT_GT	2
+#define DRM_XE_UFENCE_WAIT_GTE	3
+#define DRM_XE_UFENCE_WAIT_LT	4
+#define DRM_XE_UFENCE_WAIT_LTE	5
+	__u16 op;
+	/** @flags: wait flags */
+#define DRM_XE_UFENCE_WAIT_SOFT_OP	(1 << 0)	/* e.g. Wait on VM bind */
+#define DRM_XE_UFENCE_WAIT_ABSTIME	(1 << 1)
+#define DRM_XE_UFENCE_WAIT_VM_ERROR	(1 << 2)
+	__u16 flags;
+	/** @value: compare value */
+	__u64 value;
+	/** @mask: comparison mask */
+#define DRM_XE_UFENCE_WAIT_U8		0xffu
+#define DRM_XE_UFENCE_WAIT_U16		0xffffu
+#define DRM_XE_UFENCE_WAIT_U32		0xffffffffu
+#define DRM_XE_UFENCE_WAIT_U64		0xffffffffffffffffu
+	__u64 mask;
+	/** @timeout: how long to wait before bailing, value in jiffies */
+	__s64 timeout;
+	/**
+	 * @num_engines: number of engine instances to wait on, must be zero
+	 * when DRM_XE_UFENCE_WAIT_SOFT_OP set
+	 */
+	__u64 num_engines;
+	/**
+	 * @instances: user pointer to array of drm_xe_engine_class_instance to
+	 * wait on, must be NULL when DRM_XE_UFENCE_WAIT_SOFT_OP set
+	 */
+	__u64 instances;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
+struct drm_xe_vm_madvise {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @vm_id: The ID VM in which the VMA exists */
+	__u32 vm_id;
+
+	/** @range: Number of bytes in the VMA */
+	__u64 range;
+
+	/** @addr: Address of the VMA to operation on */
+	__u64 addr;
+
+	/*
+	 * Setting the preferred location will trigger a migrate of the VMA
+	 * backing store to new location if the backing store is already
+	 * allocated.
+	 */
+#define DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS	0
+#define DRM_XE_VM_MADVISE_PREFERRED_GT		1
+	/*
+	 * In this case lower 32 bits are mem class, upper 32 are GT.
+	 * Combination provides a single IOCTL plus migrate VMA to preferred
+	 * location.
+	 */
+#define DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS_GT	2
+	/*
+	 * The CPU will do atomic memory operations to this VMA. Must be set on
+	 * some devices for atomics to behave correctly.
+	 */
+#define DRM_XE_VM_MADVISE_CPU_ATOMIC		3
+	/*
+	 * The device will do atomic memory operations to this VMA. Must be set
+	 * on some devices for atomics to behave correctly.
+	 */
+#define DRM_XE_VM_MADVISE_DEVICE_ATOMIC		4
+	/*
+	 * Priority WRT to eviction (moving from preferred memory location due
+	 * to memory pressure). The lower the priority, the more likely to be
+	 * evicted.
+	 */
+#define DRM_XE_VM_MADVISE_PRIORITY		5
+#define		DRM_XE_VMA_PRIORITY_LOW		0
+#define		DRM_XE_VMA_PRIORITY_NORMAL	1	/* Default */
+#define		DRM_XE_VMA_PRIORITY_HIGH	2	/* Must be elevated user */
+	/* Pin the VMA in memory, must be elevated user */
+#define DRM_XE_VM_MADVISE_PIN			6
+
+	/** @property: property to set */
+	__u32 property;
+
+	/** @value: property value */
+	__u64 value;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
+#if defined(__cplusplus)
+}
+#endif
+
+#endif /* _UAPI_XE_DRM_H_ */
diff --git a/lib/drmtest.c b/lib/drmtest.c
index 16e80bdf..859f66ff 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -189,6 +189,7 @@ static const struct module {
 	{ DRIVER_V3D, "v3d" },
 	{ DRIVER_VC4, "vc4" },
 	{ DRIVER_VGEM, "vgem" },
+	{ DRIVER_XE, "xe" },
 	{}
 };
 
@@ -547,6 +548,8 @@ static const char *chipset_to_str(int chipset)
 		return "panfrost";
 	case DRIVER_MSM:
 		return "msm";
+	case DRIVER_XE:
+		return "xe";
 	case DRIVER_ANY:
 		return "any";
 	default:
diff --git a/lib/drmtest.h b/lib/drmtest.h
index b5debd44..448ac03b 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -51,6 +51,7 @@
 #define DRIVER_V3D	(1 << 4)
 #define DRIVER_PANFROST	(1 << 5)
 #define DRIVER_MSM	(1 << 6)
+#define DRIVER_XE	(1 << 7)
 
 /*
  * Exclude DRVER_VGEM from DRIVER_ANY since if you run on a system
diff --git a/lib/meson.build b/lib/meson.build
index c79e3e95..e9da2024 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -96,6 +96,10 @@ lib_sources = [
 	'igt_infoframe.c',
 	'veboxcopy_gen12.c',
 	'igt_msm.c',
+	'xe/xe_compute.c',
+	'xe/xe_ioctl.c',
+	'xe/xe_query.c',
+	'xe/xe_spin.c'
 ]
 
 lib_deps = [
diff --git a/lib/xe/xe_compute.c b/lib/xe/xe_compute.c
new file mode 100644
index 00000000..d9d9e4a4
--- /dev/null
+++ b/lib/xe/xe_compute.c
@@ -0,0 +1,327 @@
+/*
+ * Copyright © 2022 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.	IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *		Francois Dugast <francois.dugast@intel.com>
+ */
+
+#include <stdint.h>
+
+#include "xe_compute.h"
+
+#define PIPE_CONTROL			0x7a000004
+#define MI_LOAD_REGISTER_IMM		0x11000001
+#define PIPELINE_SELECT			0x69040302
+#define MEDIA_VFE_STATE			0x70000007
+#define STATE_BASE_ADDRESS		0x61010014
+#define MEDIA_STATE_FLUSH		0x0
+#define MEDIA_INTERFACE_DESCRIPTOR_LOAD	0x70020002
+#define GPGPU_WALKER			0x7105000d
+#define MI_BATCH_BUFFER_END		(0xA << 23)
+
+void tgllp_create_indirect_data(uint32_t *addr_bo_buffer_batch, uint64_t addr_input, uint64_t addr_output) {
+        int b = 0;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000200;
+	addr_bo_buffer_batch[b++] = 0x00000001;
+	addr_bo_buffer_batch[b++] = 0x00000001;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = addr_input & 0xffffffff;
+	addr_bo_buffer_batch[b++] = addr_input >> 32;
+	addr_bo_buffer_batch[b++] = addr_output & 0xffffffff;
+	addr_bo_buffer_batch[b++] = addr_output >> 32;
+	addr_bo_buffer_batch[b++] = 0x00000400;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000200;
+	addr_bo_buffer_batch[b++] = 0x00000001;
+	addr_bo_buffer_batch[b++] = 0x00000001;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00010000;
+	addr_bo_buffer_batch[b++] = 0x00030002;
+	addr_bo_buffer_batch[b++] = 0x00050004;
+	addr_bo_buffer_batch[b++] = 0x00070006;
+	addr_bo_buffer_batch[b++] = 0x00090008;
+	addr_bo_buffer_batch[b++] = 0x000B000A;
+	addr_bo_buffer_batch[b++] = 0x000D000C;
+	addr_bo_buffer_batch[b++] = 0x000F000E;
+	addr_bo_buffer_batch[b++] = 0x00110010;
+	addr_bo_buffer_batch[b++] = 0x00130012;
+	addr_bo_buffer_batch[b++] = 0x00150014;
+	addr_bo_buffer_batch[b++] = 0x00170016;
+	addr_bo_buffer_batch[b++] = 0x00190018;
+	addr_bo_buffer_batch[b++] = 0x001B001A;
+	addr_bo_buffer_batch[b++] = 0x001D001C;
+	addr_bo_buffer_batch[b++] = 0x001F001E;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00210020;
+	addr_bo_buffer_batch[b++] = 0x00230022;
+	addr_bo_buffer_batch[b++] = 0x00250024;
+	addr_bo_buffer_batch[b++] = 0x00270026;
+	addr_bo_buffer_batch[b++] = 0x00290028;
+	addr_bo_buffer_batch[b++] = 0x002B002A;
+	addr_bo_buffer_batch[b++] = 0x002D002C;
+	addr_bo_buffer_batch[b++] = 0x002F002E;
+	addr_bo_buffer_batch[b++] = 0x00310030;
+	addr_bo_buffer_batch[b++] = 0x00330032;
+	addr_bo_buffer_batch[b++] = 0x00350034;
+	addr_bo_buffer_batch[b++] = 0x00370036;
+	addr_bo_buffer_batch[b++] = 0x00390038;
+	addr_bo_buffer_batch[b++] = 0x003B003A;
+	addr_bo_buffer_batch[b++] = 0x003D003C;
+	addr_bo_buffer_batch[b++] = 0x003F003E;
+}
+
+void tgllp_create_surface_state(uint32_t *addr_bo_buffer_batch, uint64_t addr_input, uint64_t addr_output) {
+        int b = 0;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x87FD4000;
+	addr_bo_buffer_batch[b++] = 0x04000000;
+	addr_bo_buffer_batch[b++] = 0x001F007F;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00004000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = addr_input & 0xffffffff;
+	addr_bo_buffer_batch[b++] = addr_input >> 32;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x87FD4000;
+	addr_bo_buffer_batch[b++] = 0x04000000;
+	addr_bo_buffer_batch[b++] = 0x001F007F;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00004000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = addr_output & 0xffffffff;
+	addr_bo_buffer_batch[b++] = addr_output >> 32;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000040;
+	addr_bo_buffer_batch[b++] = 0x00000080;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+}
+
+void tgllp_create_dynamic_state(uint32_t *addr_bo_buffer_batch, uint64_t offset_kernel) {
+        int b = 0;
+	addr_bo_buffer_batch[b++] = offset_kernel;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00180000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x000000C0;
+	addr_bo_buffer_batch[b++] = 0x00060000;
+	addr_bo_buffer_batch[b++] = 0x00000010;
+	addr_bo_buffer_batch[b++] = 0x00000003;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+}
+
+void tgllp_create_batch_compute(uint32_t *addr_bo_buffer_batch,
+	uint64_t addr_surface_state_base, uint64_t addr_dynamic_state_base,
+	uint64_t addr_indirect_object_base, uint64_t offset_indirect_data_start) {
+        int b = 0;
+	addr_bo_buffer_batch[b++] = MI_LOAD_REGISTER_IMM;
+	addr_bo_buffer_batch[b++] = 0x00002580;
+	addr_bo_buffer_batch[b++] = 0x00060002;
+	addr_bo_buffer_batch[b++] = PIPELINE_SELECT;
+	addr_bo_buffer_batch[b++] = MI_LOAD_REGISTER_IMM;
+	addr_bo_buffer_batch[b++] = 0x00007034;
+	addr_bo_buffer_batch[b++] = 0x60000321;
+	addr_bo_buffer_batch[b++] = PIPE_CONTROL;
+	addr_bo_buffer_batch[b++] = 0x00100000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = MI_LOAD_REGISTER_IMM;
+	addr_bo_buffer_batch[b++] = 0x0000E404;
+	addr_bo_buffer_batch[b++] = 0x00000100;
+	addr_bo_buffer_batch[b++] = PIPE_CONTROL;
+	addr_bo_buffer_batch[b++] = 0x00101021;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = MEDIA_VFE_STATE;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00A70100;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x07820000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = PIPE_CONTROL;
+	addr_bo_buffer_batch[b++] = 0x00100420;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = STATE_BASE_ADDRESS;
+	addr_bo_buffer_batch[b++] = 0x00000001;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00040000;
+	addr_bo_buffer_batch[b++] = (addr_surface_state_base & 0xffffffff) | 0x1;
+	addr_bo_buffer_batch[b++] = addr_surface_state_base >> 32;
+	addr_bo_buffer_batch[b++] = (addr_dynamic_state_base & 0xffffffff) | 0x1;
+	addr_bo_buffer_batch[b++] = addr_dynamic_state_base >> 32;
+	addr_bo_buffer_batch[b++] = (addr_indirect_object_base & 0xffffffff) | 0x1;
+	addr_bo_buffer_batch[b++] = (addr_indirect_object_base >> 32) | 0xffff0000;
+	addr_bo_buffer_batch[b++] = (addr_indirect_object_base & 0xffffffff) | 0x41;
+	addr_bo_buffer_batch[b++] = addr_indirect_object_base >> 32;
+	addr_bo_buffer_batch[b++] = 0xFFFFF001;
+	addr_bo_buffer_batch[b++] = 0x00010001;
+	addr_bo_buffer_batch[b++] = 0xFFFFF001;
+	addr_bo_buffer_batch[b++] = 0xFFFFF001;
+	addr_bo_buffer_batch[b++] = (addr_surface_state_base & 0xffffffff) | 0x1;
+	addr_bo_buffer_batch[b++] = addr_surface_state_base >> 32;
+	addr_bo_buffer_batch[b++] = 0x003BF000;
+	addr_bo_buffer_batch[b++] = 0x00000041;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = PIPE_CONTROL;
+	addr_bo_buffer_batch[b++] = 0x00100000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = PIPE_CONTROL;
+	addr_bo_buffer_batch[b++] = 0x00100000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = MEDIA_STATE_FLUSH;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = MEDIA_INTERFACE_DESCRIPTOR_LOAD;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000020;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = GPGPU_WALKER;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000c80;
+	addr_bo_buffer_batch[b++] = offset_indirect_data_start;
+	addr_bo_buffer_batch[b++] = 0x8000000f;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000002;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000001;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000001;
+	addr_bo_buffer_batch[b++] = 0xffffffff;
+	addr_bo_buffer_batch[b++] = 0xffffffff;
+	addr_bo_buffer_batch[b++] = MEDIA_STATE_FLUSH;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = PIPE_CONTROL;
+	addr_bo_buffer_batch[b++] = 0x00100000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = PIPE_CONTROL;
+	addr_bo_buffer_batch[b++] = 0x00100120;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = MI_BATCH_BUFFER_END;
+}
diff --git a/lib/xe/xe_compute.h b/lib/xe/xe_compute.h
new file mode 100644
index 00000000..52b0aa51
--- /dev/null
+++ b/lib/xe/xe_compute.h
@@ -0,0 +1,93 @@
+/*
+ * Copyright © 2022 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.	IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *		Francois Dugast <francois.dugast@intel.com>
+ */
+
+#ifndef XE_COMPUTE_H
+#define XE_COMPUTE_H
+
+void tgllp_create_indirect_data(uint32_t *addr_bo_buffer_batch, uint64_t addr_input, uint64_t addr_output);
+void tgllp_create_surface_state(uint32_t *addr_bo_buffer_batch, uint64_t addr_input, uint64_t addr_output);
+void tgllp_create_dynamic_state(uint32_t *addr_bo_buffer_batch, uint64_t offset_kernel);
+void tgllp_create_batch_compute(
+	uint32_t *addr_bo_buffer_batch,
+	uint64_t addr_surface_state_base,
+	uint64_t addr_dynamic_state_base,
+	uint64_t addr_indirect_object_base,
+	uint64_t offset_indirect_data_start);
+
+// generated with: ocloc -file kernel.cl -device tgllp && xxd -i kernel_Gen12LPlp.gen
+unsigned char tgllp_kernel_square_bin[] = {
+	0x61, 0x00, 0x03, 0x80, 0x20, 0x02, 0x05, 0x03, 0x04, 0x00, 0x10, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x66, 0x01, 0x00, 0x80, 0x20, 0x82, 0x01, 0x80,
+	0x00, 0x80, 0x00, 0x01, 0xc0, 0x04, 0xc0, 0x04, 0x41, 0x01, 0x20, 0x22,
+	0x16, 0x09, 0x11, 0x03, 0x49, 0x00, 0x04, 0xa2, 0x12, 0x09, 0x11, 0x03,
+	0x40, 0x01, 0x04, 0x00, 0x60, 0x06, 0x05, 0x05, 0x04, 0x04, 0x00, 0x01,
+	0x05, 0x01, 0x58, 0x00, 0x40, 0x00, 0x24, 0x00, 0x60, 0x06, 0x05, 0x0a,
+	0x04, 0x04, 0x00, 0x01, 0x05, 0x02, 0x58, 0x00, 0x40, 0x02, 0x0c, 0xa0,
+	0x02, 0x05, 0x10, 0x07, 0x40, 0x02, 0x0e, 0xa6, 0x02, 0x0a, 0x10, 0x07,
+	0x70, 0x02, 0x04, 0x00, 0x60, 0x02, 0x01, 0x00, 0x05, 0x0c, 0x46, 0x52,
+	0x84, 0x08, 0x00, 0x00, 0x70, 0x02, 0x24, 0x00, 0x60, 0x02, 0x01, 0x00,
+	0x05, 0x0e, 0x46, 0x52, 0x84, 0x08, 0x00, 0x00, 0x72, 0x00, 0x02, 0x80,
+	0x50, 0x0d, 0x04, 0x00, 0x05, 0x00, 0x05, 0x1d, 0x05, 0x00, 0x05, 0x00,
+	0x22, 0x00, 0x05, 0x01, 0x00, 0xc0, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00,
+	0x90, 0x00, 0x00, 0x00, 0x69, 0x00, 0x10, 0x60, 0x02, 0x0c, 0x20, 0x00,
+	0x69, 0x00, 0x12, 0x66, 0x02, 0x0e, 0x20, 0x00, 0x40, 0x02, 0x14, 0xa0,
+	0x32, 0x10, 0x10, 0x08, 0x40, 0x02, 0x16, 0xa6, 0x32, 0x12, 0x10, 0x08,
+	0x31, 0xa0, 0x04, 0x00, 0x00, 0x00, 0x14, 0x18, 0x14, 0x14, 0x00, 0xcc,
+	0x00, 0x00, 0x16, 0x00, 0x31, 0x91, 0x24, 0x00, 0x00, 0x00, 0x14, 0x1a,
+	0x14, 0x16, 0x00, 0xcc, 0x00, 0x00, 0x16, 0x00, 0x40, 0x00, 0x10, 0xa0,
+	0x4a, 0x10, 0x10, 0x08, 0x40, 0x00, 0x12, 0xa6, 0x4a, 0x12, 0x10, 0x08,
+	0x41, 0x20, 0x18, 0x20, 0x00, 0x18, 0x00, 0x18, 0x41, 0x21, 0x1a, 0x26,
+	0x00, 0x1a, 0x00, 0x1a, 0x31, 0xa2, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x14, 0x10, 0x02, 0xcc, 0x14, 0x18, 0x96, 0x00, 0x31, 0x93, 0x24, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x14, 0x12, 0x02, 0xcc, 0x14, 0x1a, 0x96, 0x00,
+	0x25, 0x00, 0x05, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x10, 0x00, 0x00, 0x00, 0x61, 0x00, 0x7f, 0x64, 0x00, 0x03, 0x10, 0x00,
+	0x31, 0x44, 0x03, 0x80, 0x00, 0x00, 0x0c, 0x1c, 0x0c, 0x03, 0x00, 0xa0,
+	0x00, 0x00, 0x78, 0x02, 0x61, 0x24, 0x03, 0x80, 0x20, 0x02, 0x01, 0x00,
+	0x05, 0x1c, 0x46, 0x00, 0x00, 0x00, 0x00, 0x00, 0x61, 0x00, 0x04, 0x80,
+	0xa0, 0x4a, 0x01, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x31, 0x01, 0x03, 0x80, 0x04, 0x00, 0x00, 0x00, 0x0c, 0x7f, 0x20, 0x70,
+	0x00, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
+};
+unsigned int tgllp_kernel_square_length = 576;
+
+#endif	/* XE_COMPUTE_H */
diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
new file mode 100644
index 00000000..6cfa7d04
--- /dev/null
+++ b/lib/xe/xe_ioctl.c
@@ -0,0 +1,441 @@
+/*
+ * Copyright © 2022 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *    Jason Ekstrand <jason@jlekstrand.net>
+ *    Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+ *    Matthew Brost <matthew.brost@intel.com>
+ */
+
+#ifdef HAVE_LIBGEN_H
+#include <libgen.h>
+#endif
+#include <stdio.h>
+#include <fcntl.h>
+#include <sys/stat.h>
+#include <sys/ioctl.h>
+#include <string.h>
+#include <sys/mman.h>
+#include <signal.h>
+#include <pciaccess.h>
+#include <getopt.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <sys/wait.h>
+#include <sys/types.h>
+#include <sys/syscall.h>
+#include <sys/utsname.h>
+#include <termios.h>
+#include <errno.h>
+
+#include "drmtest.h"
+#include "config.h"
+
+#ifdef HAVE_VALGRIND
+#include <valgrind/valgrind.h>
+#include <valgrind/memcheck.h>
+
+#define VG(x) x
+#else
+#define VG(x) do {} while (0)
+#endif
+
+#include "xe_ioctl.h"
+#include "xe_query.h"
+#include "igt_syncobj.h"
+#include "ioctl_wrappers.h"
+
+uint32_t
+xe_cs_prefetch_size(int fd)
+{
+	return 512;
+}
+
+uint32_t
+xe_vm_create(int fd, uint32_t flags, uint64_t ext)
+{
+	struct drm_xe_vm_create create = {
+		.extensions = ext,
+		.flags = flags,
+	};
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create), 0);
+
+	return create.vm_id;
+}
+
+void xe_vm_unbind_all_async(int fd, uint32_t vm, uint32_t engine,
+			    uint32_t bo, struct drm_xe_sync *sync,
+			    uint32_t num_syncs)
+{
+	__xe_vm_bind_assert(fd, vm, engine, bo, 0, 0, 0,
+			    XE_VM_BIND_OP_UNMAP_ALL | XE_VM_BIND_FLAG_ASYNC,
+			    sync, num_syncs, 0, 0);
+}
+
+void xe_vm_bind_array(int fd, uint32_t vm, uint32_t engine,
+		      struct drm_xe_vm_bind_op *bind_ops,
+		      uint32_t num_bind, struct drm_xe_sync *sync,
+		      uint32_t num_syncs)
+{
+	struct drm_xe_vm_bind bind = {
+		.vm_id = vm,
+		.num_binds = num_bind,
+		.vector_of_binds = (uintptr_t)bind_ops,
+		.num_syncs = num_syncs,
+		.syncs = (uintptr_t)sync,
+		.engine_id = engine,
+	};
+
+	igt_assert(num_bind > 1);
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind), 0);
+}
+
+int  __xe_vm_bind(int fd, uint32_t vm, uint32_t engine, uint32_t bo,
+		  uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
+		  struct drm_xe_sync *sync, uint32_t num_syncs, uint32_t region,
+		  uint64_t ext)
+{
+	struct drm_xe_vm_bind bind = {
+		.extensions = ext,
+		.vm_id = vm,
+		.num_binds = 1,
+		.bind.obj = bo,
+		.bind.obj_offset = offset,
+		.bind.range = size,
+		.bind.addr = addr,
+		.bind.op = op,
+		.bind.region = region,
+		.num_syncs = num_syncs,
+		.syncs = (uintptr_t)sync,
+		.engine_id = engine,
+	};
+
+	if (igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind))
+		return -errno;
+
+	return 0;
+}
+
+void  __xe_vm_bind_assert(int fd, uint32_t vm, uint32_t engine, uint32_t bo,
+			  uint64_t offset, uint64_t addr, uint64_t size,
+			  uint32_t op, struct drm_xe_sync *sync,
+			  uint32_t num_syncs, uint32_t region, uint64_t ext)
+{
+	igt_assert_eq(__xe_vm_bind(fd, vm, engine, bo, offset, addr, size,
+				   op, sync, num_syncs, region, ext), 0);
+}
+
+void xe_vm_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
+		uint64_t addr, uint64_t size,
+		struct drm_xe_sync *sync, uint32_t num_syncs)
+{
+	__xe_vm_bind_assert(fd, vm, 0, bo, offset, addr, size,
+			    XE_VM_BIND_OP_MAP, sync, num_syncs, 0, 0);
+}
+
+void xe_vm_unbind(int fd, uint32_t vm, uint64_t offset,
+		  uint64_t addr, uint64_t size,
+		  struct drm_xe_sync *sync, uint32_t num_syncs)
+{
+	__xe_vm_bind_assert(fd, vm, 0, 0, offset, addr, size,
+			    XE_VM_BIND_OP_UNMAP, sync, num_syncs, 0, 0);
+}
+
+void xe_vm_prefetch_async(int fd, uint32_t vm, uint32_t engine, uint64_t offset,
+			  uint64_t addr, uint64_t size,
+			  struct drm_xe_sync *sync, uint32_t num_syncs,
+			  uint32_t region)
+{
+	__xe_vm_bind_assert(fd, vm, engine, 0, offset, addr, size,
+			    XE_VM_BIND_OP_PREFETCH | XE_VM_BIND_FLAG_ASYNC,
+			    sync, num_syncs, region, 0);
+}
+
+void xe_vm_bind_async(int fd, uint32_t vm, uint32_t engine, uint32_t bo,
+		      uint64_t offset, uint64_t addr, uint64_t size,
+		      struct drm_xe_sync *sync, uint32_t num_syncs)
+{
+	__xe_vm_bind_assert(fd, vm, engine, bo, offset, addr, size,
+			    XE_VM_BIND_OP_MAP | XE_VM_BIND_FLAG_ASYNC, sync,
+			    num_syncs, 0, 0);
+}
+
+void xe_vm_bind_async_flags(int fd, uint32_t vm, uint32_t engine, uint32_t bo,
+			    uint64_t offset, uint64_t addr, uint64_t size,
+			    struct drm_xe_sync *sync, uint32_t num_syncs,
+			    uint32_t flags)
+{
+	__xe_vm_bind_assert(fd, vm, engine, bo, offset, addr, size,
+			    XE_VM_BIND_OP_MAP | XE_VM_BIND_FLAG_ASYNC | flags,
+			    sync, num_syncs, 0, 0);
+}
+
+void xe_vm_bind_userptr_async(int fd, uint32_t vm, uint32_t engine,
+			      uint64_t userptr, uint64_t addr, uint64_t size,
+			      struct drm_xe_sync *sync, uint32_t num_syncs)
+{
+	__xe_vm_bind_assert(fd, vm, engine, 0, userptr, addr, size,
+			    XE_VM_BIND_OP_MAP_USERPTR | XE_VM_BIND_FLAG_ASYNC,
+			    sync, num_syncs, 0, 0);
+}
+
+void xe_vm_bind_userptr_async_flags(int fd, uint32_t vm, uint32_t engine,
+				    uint64_t userptr, uint64_t addr,
+				    uint64_t size, struct drm_xe_sync *sync,
+				    uint32_t num_syncs, uint32_t flags)
+{
+	__xe_vm_bind_assert(fd, vm, engine, 0, userptr, addr, size,
+			    XE_VM_BIND_OP_MAP_USERPTR | XE_VM_BIND_FLAG_ASYNC |
+			    flags, sync, num_syncs, 0, 0);
+}
+
+void xe_vm_unbind_async(int fd, uint32_t vm, uint32_t engine,
+			uint64_t offset, uint64_t addr, uint64_t size,
+			struct drm_xe_sync *sync, uint32_t num_syncs)
+{
+	__xe_vm_bind_assert(fd, vm, engine, 0, offset, addr, size,
+			    XE_VM_BIND_OP_UNMAP | XE_VM_BIND_FLAG_ASYNC, sync,
+			    num_syncs, 0, 0);
+}
+
+static void __xe_vm_bind_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
+			      uint64_t addr, uint64_t size, uint32_t op)
+{
+	struct drm_xe_sync sync = {
+		.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
+		.handle = syncobj_create(fd, 0),
+	};
+
+	__xe_vm_bind_assert(fd, vm, 0, bo, offset, addr, size, op, &sync, 1, 0,
+			    0);
+
+	igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
+	syncobj_destroy(fd, sync.handle);
+}
+
+void xe_vm_bind_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
+		     uint64_t addr, uint64_t size)
+{
+	__xe_vm_bind_sync(fd, vm, bo, offset, addr, size, XE_VM_BIND_OP_MAP);
+}
+
+void xe_vm_unbind_sync(int fd, uint32_t vm, uint64_t offset,
+		       uint64_t addr, uint64_t size)
+{
+	__xe_vm_bind_sync(fd, vm, 0, offset, addr, size, XE_VM_BIND_OP_UNMAP);
+}
+
+void xe_vm_destroy(int fd, uint32_t vm)
+{
+	struct drm_xe_vm_destroy destroy = {
+		.vm_id = vm,
+	};
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_DESTROY, &destroy), 0);
+}
+
+uint32_t xe_bo_create_flags(int fd, uint32_t vm, uint64_t size, uint32_t flags)
+{
+	struct drm_xe_gem_create create = {
+		.vm_id = vm,
+		.size = size,
+		.flags = flags,
+	};
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_GEM_CREATE, &create), 0);
+
+	return create.handle;
+}
+
+uint32_t xe_bo_create(int fd, int gt, uint32_t vm, uint64_t size)
+{
+	struct drm_xe_gem_create create = {
+		.vm_id = vm,
+		.size = size,
+		.flags = vram_if_possible(gt),
+	};
+	int err;
+
+	err = igt_ioctl(fd, DRM_IOCTL_XE_GEM_CREATE, &create);
+	igt_assert_eq(err, 0);
+
+	return create.handle;
+}
+
+uint32_t xe_bind_engine_create(int fd, uint32_t vm, uint64_t ext)
+{
+	struct drm_xe_engine_class_instance instance = {
+		.engine_class = DRM_XE_ENGINE_CLASS_VM_BIND,
+	};
+	struct drm_xe_engine_create create = {
+		.extensions = ext,
+		.vm_id = vm,
+		.width = 1,
+		.num_placements = 1,
+		.instances = to_user_pointer(&instance),
+	};
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_ENGINE_CREATE, &create), 0);
+
+	return create.engine_id;
+}
+
+uint32_t xe_engine_create(int fd, uint32_t vm,
+			  struct drm_xe_engine_class_instance *instance,
+			  uint64_t ext)
+{
+	struct drm_xe_engine_create create = {
+		.extensions = ext,
+		.vm_id = vm,
+		.width = 1,
+		.num_placements = 1,
+		.instances = to_user_pointer(instance),
+	};
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_ENGINE_CREATE, &create), 0);
+
+	return create.engine_id;
+}
+
+uint32_t xe_engine_create_class(int fd, uint32_t vm, uint16_t class)
+{
+	struct drm_xe_engine_class_instance instance = {
+		.engine_class = class,
+		.engine_instance = 0,
+		.gt_id = 0,
+	};
+	struct drm_xe_engine_create create = {
+		.vm_id = vm,
+		.width = 1,
+		.num_placements = 1,
+		.instances = to_user_pointer(&instance),
+	};
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_ENGINE_CREATE, &create), 0);
+
+	return create.engine_id;
+}
+
+void xe_engine_destroy(int fd, uint32_t engine)
+{
+	struct drm_xe_engine_destroy destroy = {
+		.engine_id = engine,
+	};
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_ENGINE_DESTROY, &destroy), 0);
+}
+
+uint64_t xe_bo_mmap_offset(int fd, uint32_t bo)
+{
+	struct drm_xe_gem_mmap_offset mmo = {
+		.handle = bo,
+	};
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo), 0);
+
+	return mmo.offset;
+}
+
+void *xe_bo_map(int fd, uint32_t bo, size_t size)
+{
+	uint64_t mmo;
+	void *map;
+
+	mmo = xe_bo_mmap_offset(fd, bo);
+	map = mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo);
+	igt_assert(map != MAP_FAILED);
+
+	return map;
+}
+
+void __xe_exec_assert(int fd, struct drm_xe_exec *exec)
+{
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC, exec), 0);
+}
+
+void xe_exec(int fd, uint32_t engine, uint64_t addr, struct drm_xe_sync *sync,
+	     uint32_t num_syncs)
+{
+	struct drm_xe_exec exec = {
+		.engine_id = engine,
+		.syncs = (uintptr_t)sync,
+		.num_syncs = num_syncs,
+		.address = addr,
+		.num_batch_buffer = 1,
+	};
+
+	__xe_exec_assert(fd, &exec);
+}
+
+void xe_exec_wait(int fd, uint32_t engine, uint64_t addr)
+{
+	struct drm_xe_sync sync = {
+		.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
+		.handle = syncobj_create(fd, 0),
+	};
+
+	xe_exec(fd, engine, addr, &sync, 1);
+
+	igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
+	syncobj_destroy(fd, sync.handle);
+}
+
+void xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
+		    struct drm_xe_engine_class_instance *eci,
+		    int64_t timeout)
+{
+	struct drm_xe_wait_user_fence wait = {
+		.addr = to_user_pointer(addr),
+		.op = DRM_XE_UFENCE_WAIT_EQ,
+		.flags = !eci ? DRM_XE_UFENCE_WAIT_SOFT_OP : 0,
+		.value = value,
+		.mask = DRM_XE_UFENCE_WAIT_U64,
+		.timeout = timeout,
+		.num_engines = eci ? 1 :0,
+		.instances = eci ? to_user_pointer(eci) : 0,
+	};
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait), 0);
+}
+
+void xe_force_gt_reset(int fd, int gt)
+{
+	char reset_string[128];
+
+	sprintf(reset_string, "cat /sys/kernel/debug/dri/0/gt%d/force_reset", gt);
+	system(reset_string);
+}
+
+void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t size,
+		   uint32_t property, uint32_t value)
+{
+	struct drm_xe_vm_madvise madvise = {
+		.vm_id = vm,
+		.range = size,
+		.addr = addr,
+		.property = property,
+		.value = value,
+	};
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_MADVISE, &madvise), 0);
+}
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
new file mode 100644
index 00000000..240f3bb3
--- /dev/null
+++ b/lib/xe/xe_ioctl.h
@@ -0,0 +1,107 @@
+/*
+ * Copyright © 2022 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *    Jason Ekstrand <jason@jlekstrand.net>
+ *    Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+ *    Matthew Brost <matthew.brost@intel.com>
+ */
+
+#ifndef XE_IOCTL_H
+#define XE_IOCTL_H
+
+#include <stdint.h>
+#include <stdbool.h>
+#include <sys/mman.h>
+#include <xe_drm.h>
+
+uint32_t xe_cs_prefetch_size(int fd);
+uint32_t xe_vm_create(int fd, uint32_t flags, uint64_t ext);
+int  __xe_vm_bind(int fd, uint32_t vm, uint32_t engine, uint32_t bo,
+		  uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
+		  struct drm_xe_sync *sync, uint32_t num_syncs, uint32_t region,
+		  uint64_t ext);
+void  __xe_vm_bind_assert(int fd, uint32_t vm, uint32_t engine, uint32_t bo,
+			  uint64_t offset, uint64_t addr, uint64_t size,
+			  uint32_t op, struct drm_xe_sync *sync,
+			  uint32_t num_syncs, uint32_t region, uint64_t ext);
+void xe_vm_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
+		uint64_t addr, uint64_t size,
+		struct drm_xe_sync *sync, uint32_t num_syncs);
+void xe_vm_unbind(int fd, uint32_t vm, uint64_t offset,
+		  uint64_t addr, uint64_t size,
+		  struct drm_xe_sync *sync, uint32_t num_syncs);
+void xe_vm_prefetch_async(int fd, uint32_t vm, uint32_t engine,
+			  uint64_t offset, uint64_t addr, uint64_t size,
+			  struct drm_xe_sync *sync, uint32_t num_syncs,
+			  uint32_t region);
+void xe_vm_bind_async(int fd, uint32_t vm, uint32_t engine, uint32_t bo,
+		      uint64_t offset, uint64_t addr, uint64_t size,
+		      struct drm_xe_sync *sync, uint32_t num_syncs);
+void xe_vm_bind_userptr_async(int fd, uint32_t vm, uint32_t engine,
+			      uint64_t userptr, uint64_t addr, uint64_t size,
+			      struct drm_xe_sync *sync, uint32_t num_syncs);
+void xe_vm_bind_async_flags(int fd, uint32_t vm, uint32_t engine, uint32_t bo,
+			    uint64_t offset, uint64_t addr, uint64_t size,
+			    struct drm_xe_sync *sync, uint32_t num_syncs,
+			    uint32_t flags);
+void xe_vm_bind_userptr_async_flags(int fd, uint32_t vm, uint32_t engine,
+				    uint64_t userptr, uint64_t addr,
+				    uint64_t size, struct drm_xe_sync *sync,
+				    uint32_t num_syncs, uint32_t flags);
+void xe_vm_unbind_async(int fd, uint32_t vm, uint32_t engine,
+			uint64_t offset, uint64_t addr, uint64_t size,
+			struct drm_xe_sync *sync, uint32_t num_syncs);
+void xe_vm_bind_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
+		     uint64_t addr, uint64_t size);
+void xe_vm_unbind_sync(int fd, uint32_t vm, uint64_t offset,
+		       uint64_t addr, uint64_t size);
+void xe_vm_bind_array(int fd, uint32_t vm, uint32_t engine,
+		      struct drm_xe_vm_bind_op *bind_ops,
+		      uint32_t num_bind, struct drm_xe_sync *sync,
+		      uint32_t num_syncs);
+void xe_vm_unbind_all_async(int fd, uint32_t vm, uint32_t engine,
+			    uint32_t bo, struct drm_xe_sync *sync,
+			    uint32_t num_syncs);
+void xe_vm_destroy(int fd, uint32_t vm);
+uint32_t xe_bo_create_flags(int fd, uint32_t vm, uint64_t size, uint32_t flags);
+uint32_t xe_bo_create(int fd, int gt, uint32_t vm, uint64_t size);
+uint32_t xe_engine_create(int fd, uint32_t vm,
+			  struct drm_xe_engine_class_instance *instance,
+			  uint64_t ext);
+uint32_t xe_bind_engine_create(int fd, uint32_t vm, uint64_t ext);
+uint32_t xe_engine_create_class(int fd, uint32_t vm, uint16_t class);
+void xe_engine_destroy(int fd, uint32_t engine);
+uint64_t xe_bo_mmap_offset(int fd, uint32_t bo);
+void *xe_bo_map(int fd, uint32_t bo, size_t size);
+void __xe_exec_assert(int fd, struct drm_xe_exec *exec);
+void xe_exec(int fd, uint32_t engine, uint64_t addr, struct drm_xe_sync *sync,
+	     uint32_t num_syncs);
+void xe_exec_wait(int fd, uint32_t engine, uint64_t addr);
+void xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
+		    struct drm_xe_engine_class_instance *eci,
+		    int64_t timeout);
+void xe_force_gt_reset(int fd, int gt);
+void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t size,
+		   uint32_t property, uint32_t value);
+
+#endif /* XE_IOCTL_H */
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
new file mode 100644
index 00000000..b2fd35bc
--- /dev/null
+++ b/lib/xe/xe_query.c
@@ -0,0 +1,267 @@
+/*
+ * Copyright © 2022 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *    Matthew Brost <matthew.brost@intel.com>
+ */
+
+#include <stdlib.h>
+
+#include "drmtest.h"
+#include "ioctl_wrappers.h"
+
+#include "xe_query.h"
+#include "xe_ioctl.h"
+
+/* FIXME: This is a bit of mess, let's try to clean this up soon */
+
+struct drm_xe_engine_class_instance *__hw_engines;
+int __number_hw_engines;
+int __default_alignment = XE_DEFAULT_ALIGNMENT;
+int __number_gt = 1;
+bool __has_vram = false;
+bool __supports_faults = false;
+uint64_t __memory_regions = 0;
+
+/* FIXME: If we ever have inaccessible_mem_regions, all IGTs need to be updated */
+void xe_query_memory_regions(int fd)
+{
+	struct drm_xe_query_gts *gts;
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_GTS,
+		.size = 0,
+		.data = 0,
+	};
+	int i;
+	static int once = 1;
+
+	if (once) {
+		once = 0;
+		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY,
+					&query), 0);
+
+		gts = malloc(query.size);
+		igt_assert(gts);
+
+		query.data = to_user_pointer(gts);
+		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY,
+					&query), 0);
+
+		for (i = 0; i < gts->num_gt; i++) {
+			__memory_regions |= gts->gts[i].native_mem_regions |
+				gts->gts[i].slow_mem_regions;
+		}
+	}
+}
+
+void xe_query_gt(int fd)
+{
+	struct drm_xe_query_config *config;
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_CONFIG,
+		.size = 0,
+		.data = 0,
+	};
+	static int once = 1;
+
+	if (once) {
+		once = 0;
+
+		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY,
+					&query), 0);
+
+		config = malloc(query.size);
+		igt_assert(config);
+
+		query.data = to_user_pointer(config);
+		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY,
+					&query), 0);
+
+		igt_assert(config->num_params > 0);
+
+		__number_gt = config->info[XE_QUERY_CONFIG_GT_COUNT];
+	}
+}
+
+void xe_query_engines(int fd)
+{
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_ENGINES,
+		.size = 0,
+		.data = 0,
+	};
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	__hw_engines = malloc(query.size);
+	igt_assert(__hw_engines);
+
+	query.data = to_user_pointer(__hw_engines);
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	__number_hw_engines = query.size /
+		sizeof(struct drm_xe_engine_class_instance);
+}
+
+bool xe_has_vram(int fd)
+{
+	struct drm_xe_query_mem_usage *mem_usage;
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_MEM_USAGE,
+		.size = 0,
+		.data = 0,
+	};
+	int i;
+	static int once = 1;
+
+	if (once) {
+		once = 0;
+		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY,
+					&query), 0);
+
+		mem_usage = malloc(query.size);
+		igt_assert(mem_usage);
+
+		query.data = to_user_pointer(mem_usage);
+		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY,
+					&query), 0);
+
+		for (i = 0; i < mem_usage->num_regions; i++) {
+			if (mem_usage->regions[i].mem_class ==
+			    XE_MEM_REGION_CLASS_VRAM) {
+				__has_vram = true;
+				break;
+			}
+		}
+	}
+
+	return __has_vram;
+}
+
+/* FIXME: Make generic / multi-GT aware */
+uint64_t xe_vram_size(int fd)
+{
+	struct drm_xe_query_mem_usage *mem_usage;
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_MEM_USAGE,
+		.size = 0,
+		.data = 0,
+	};
+	int i;
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	mem_usage = malloc(query.size);
+	igt_assert(mem_usage);
+
+	query.data = to_user_pointer(mem_usage);
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	for (i = 0; i < mem_usage->num_regions; i++) {
+		if (mem_usage->regions[i].mem_class ==
+		    XE_MEM_REGION_CLASS_VRAM)
+			return mem_usage->regions[i].total_size;
+	}
+
+	return 0;
+}
+
+uint32_t xe_get_default_alignment(int fd)
+{
+	struct drm_xe_query_mem_usage *mem_usage;
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_MEM_USAGE,
+		.size = 0,
+		.data = 0,
+	};
+	int i;
+	static int once = 1;
+
+	if (once) {
+		once = 0;
+		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY,
+					&query), 0);
+
+		mem_usage = malloc(query.size);
+		igt_assert(mem_usage);
+
+		query.data = to_user_pointer(mem_usage);
+		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY,
+					&query), 0);
+
+		for (i = 0; i < mem_usage->num_regions; i++) {
+			if (mem_usage->regions[i].mem_class ==
+			    XE_MEM_REGION_CLASS_VRAM) {
+				__default_alignment =
+					mem_usage->regions[i].min_page_size;
+				break;
+			}
+		}
+	}
+
+	return __default_alignment;
+}
+
+bool xe_supports_faults(int fd)
+{
+	static int once = 1;
+
+	/* FIXME: This likely should be reported via query IOCTL */
+
+	if (once) {
+		struct drm_xe_vm_create create = {
+			.flags = DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
+				DRM_XE_VM_CREATE_FAULT_MODE,
+		};
+
+		__supports_faults = !igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE,
+					       &create);
+		once = 0;
+		if (__supports_faults)
+			xe_vm_destroy(fd, create.vm_id);
+	}
+
+	return __supports_faults;
+}
+
+const char* xe_engine_class_string(uint32_t engine_class)
+{
+	switch (engine_class) {
+		case DRM_XE_ENGINE_CLASS_RENDER:
+			return "DRM_XE_ENGINE_CLASS_RENDER";
+		case DRM_XE_ENGINE_CLASS_COPY:
+			return "DRM_XE_ENGINE_CLASS_COPY";
+		case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
+			return "DRM_XE_ENGINE_CLASS_VIDEO_DECODE";
+		case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
+			return "DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE";
+		case DRM_XE_ENGINE_CLASS_COMPUTE:
+			return "DRM_XE_ENGINE_CLASS_COMPUTE";
+		default: return "?";
+	}
+}
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
new file mode 100644
index 00000000..772613a1
--- /dev/null
+++ b/lib/xe/xe_query.h
@@ -0,0 +1,76 @@
+/*
+ * Copyright © 2022 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *    Matthew Brost <matthew.brost@intel.com>
+ */
+
+#ifndef XE_QUERY_H
+#define XE_QUERY_H
+
+#include <xe_drm.h>
+
+#define XE_DEFAULT_ALIGNMENT           0x1000
+#define XE_DEFAULT_ALIGNMENT_64K       0x10000
+
+extern struct drm_xe_engine_class_instance *__hw_engines;
+extern int __number_hw_engines;
+extern int __number_gt;
+extern bool __has_vram;
+extern uint64_t __memory_regions;
+
+#define for_each_hw_engine(hwe) \
+	for (int __i = 0; __i < __number_hw_engines && \
+	     (hwe = &__hw_engines[__i]); ++__i)
+#define for_each_hw_engine_class(class) \
+	for (class = 0; class < DRM_XE_ENGINE_CLASS_COMPUTE + 1; \
+	     ++class)
+#define for_each_gt(gt) \
+	for (gt = 0; gt < __number_gt; ++gt)
+
+#define has_vram()	(__has_vram)
+#define all_memory_regions()	(__memory_regions)
+#define system_memory()		(__memory_regions & 0x1)
+#define vram_memory(gt)		(__memory_regions & (0x2 << gt))
+#define vram_if_possible(gt)	\
+	(vram_memory(gt) ? vram_memory(gt) : system_memory())
+
+void xe_query_gt(int fd);
+void xe_query_engines(int fd);
+bool xe_has_vram(int fd);
+uint64_t xe_vram_size(int fd);
+uint32_t xe_get_default_alignment(int fd);
+void xe_query_memory_regions(int fd);
+bool xe_supports_faults(int fd);
+const char* xe_engine_class_string(uint32_t engine_class);
+
+static inline void xe_query_all(int fd)
+{
+	xe_query_gt(fd);
+	xe_query_engines(fd);
+	xe_has_vram(fd);
+	xe_vram_size(fd);
+	xe_get_default_alignment(fd);
+	xe_query_memory_regions(fd);
+}
+
+#endif	/* XE_QUERY_H */
diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
new file mode 100644
index 00000000..a6cc52b9
--- /dev/null
+++ b/lib/xe/xe_spin.c
@@ -0,0 +1,157 @@
+/*
+ * Copyright © 2022 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *    Matthew Brost <matthew.brost@intel.com>
+ */
+
+#include <string.h>
+
+#include "drmtest.h"
+#include "igt.h"
+#include "igt_core.h"
+#include "igt_syncobj.h"
+#include "intel_reg.h"
+#include "xe_ioctl.h"
+#include "xe_spin.h"
+
+void xe_spin_init(struct xe_spin *spin, uint64_t addr, bool preempt)
+{
+	uint64_t batch_offset = (char *)&spin->batch - (char *)spin;
+	uint64_t batch_addr = addr + batch_offset;
+	uint64_t start_offset = (char *)&spin->start - (char *)spin;
+	uint64_t start_addr = addr + start_offset;
+	uint64_t end_offset = (char *)&spin->end - (char *)spin;
+	uint64_t end_addr = addr + end_offset;
+	int b = 0;
+
+	spin->start = 0;
+	spin->end = 0xffffffff;
+
+	spin->batch[b++] = MI_STORE_DWORD_IMM;
+	spin->batch[b++] = start_addr;
+	spin->batch[b++] = start_addr >> 32;
+	spin->batch[b++] = 0xc0ffee;
+
+	if (preempt)
+		spin->batch[b++] = (0x5 << 23);
+
+	spin->batch[b++] = MI_COND_BATCH_BUFFER_END | MI_DO_COMPARE | 2;
+	spin->batch[b++] = 0;
+	spin->batch[b++] = end_addr;
+	spin->batch[b++] = end_addr >> 32;
+
+	spin->batch[b++] = MI_BATCH_BUFFER_START | 1 << 8 | 1;
+	spin->batch[b++] = batch_addr;
+	spin->batch[b++] = batch_addr >> 32;
+
+	igt_assert(b <= ARRAY_SIZE(spin->batch));
+}
+
+bool xe_spin_started(struct xe_spin *spin)
+{
+	return spin->start != 0;
+}
+
+void xe_spin_wait_started(struct xe_spin *spin)
+{
+	while(!xe_spin_started(spin));
+}
+
+void xe_spin_end(struct xe_spin *spin)
+{
+	spin->end = 0;
+}
+
+void xe_cork_init(int fd, struct drm_xe_engine_class_instance *hwe,
+		  struct xe_cork *cork)
+{
+	uint64_t addr = xe_get_default_alignment(fd);
+	size_t bo_size = xe_get_default_alignment(fd);
+	uint32_t vm, bo, engine, syncobj;
+	struct xe_spin *spin;
+	struct drm_xe_sync sync = {
+		.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync),
+	};
+
+	vm = xe_vm_create(fd, 0, 0);
+
+	bo = xe_bo_create(fd, hwe->gt_id, vm, bo_size);
+	spin = xe_bo_map(fd, bo, 0x1000);
+
+	xe_vm_bind_sync(fd, vm, bo, 0, addr, bo_size);
+
+	engine = xe_engine_create(fd, vm, hwe, 0);
+	syncobj = syncobj_create(fd, 0);
+
+	xe_spin_init(spin, addr, true);
+	exec.engine_id = engine;
+	exec.address = addr;
+	sync.handle = syncobj;
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec), 0);
+
+	cork->spin = spin;
+	cork->fd = fd;
+	cork->vm = vm;
+	cork->bo = bo;
+	cork->engine = engine;
+	cork->syncobj = syncobj;
+}
+
+bool xe_cork_started(struct xe_cork *cork)
+{
+	return xe_spin_started(cork->spin);
+}
+
+void xe_cork_wait_started(struct xe_cork *cork)
+{
+	xe_spin_wait_started(cork->spin);
+}
+
+void xe_cork_end(struct xe_cork *cork)
+{
+	xe_spin_end(cork->spin);
+}
+
+void xe_cork_wait_done(struct xe_cork *cork)
+{
+	igt_assert(syncobj_wait(cork->fd, &cork->syncobj, 1, INT64_MAX, 0,
+				NULL));
+}
+
+void xe_cork_fini(struct xe_cork *cork)
+{
+	syncobj_destroy(cork->fd, cork->syncobj);
+	xe_engine_destroy(cork->fd, cork->engine);
+	xe_vm_destroy(cork->fd, cork->vm);
+	gem_close(cork->fd, cork->bo);
+}
+
+uint32_t xe_cork_sync_handle(struct xe_cork *cork)
+{
+	return cork->syncobj;
+}
diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
new file mode 100644
index 00000000..cf5747f5
--- /dev/null
+++ b/lib/xe/xe_spin.h
@@ -0,0 +1,66 @@
+/*
+ * Copyright © 2022 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *    Matthew Brost <matthew.brost@intel.com>
+ */
+
+#ifndef XE_SPIN_H
+#define XE_SPIN_H
+
+#include <stdint.h>
+#include <stdbool.h>
+
+#include "xe_query.h"
+
+/* Mapped GPU object */
+struct xe_spin {
+	uint32_t batch[16];
+	uint64_t pad;
+	uint32_t start;
+	uint32_t end;
+};
+
+void xe_spin_init(struct xe_spin *spin, uint64_t addr, bool preempt);
+bool xe_spin_started(struct xe_spin *spin);
+void xe_spin_wait_started(struct xe_spin *spin);
+void xe_spin_end(struct xe_spin *spin);
+
+struct xe_cork {
+	struct xe_spin *spin;
+	int fd;
+	uint32_t vm;
+	uint32_t bo;
+	uint32_t engine;
+	uint32_t syncobj;
+};
+
+void xe_cork_init(int fd, struct drm_xe_engine_class_instance *hwe,
+		  struct xe_cork *cork);
+bool xe_cork_started(struct xe_cork *cork);
+void xe_cork_wait_started(struct xe_cork *cork);
+void xe_cork_end(struct xe_cork *cork);
+void xe_cork_wait_done(struct xe_cork *cork);
+void xe_cork_fini(struct xe_cork *cork);
+uint32_t xe_cork_sync_handle(struct xe_cork *cork);
+
+#endif	/* XE_SPIN_H */
diff --git a/meson.build b/meson.build
index f5e30827..691a8036 100644
--- a/meson.build
+++ b/meson.build
@@ -262,6 +262,7 @@ libexecdir = join_paths(get_option('libexecdir'), 'igt-gpu-tools')
 amdgpudir = join_paths(libexecdir, 'amdgpu')
 v3ddir = join_paths(libexecdir, 'v3d')
 vc4dir = join_paths(libexecdir, 'vc4')
+xedir = join_paths(libexecdir, 'xe')
 mandir = get_option('mandir')
 pkgconfigdir = join_paths(libdir, 'pkgconfig')
 python3 = find_program('python3', required : true)
@@ -309,12 +310,19 @@ if get_option('use_rpath')
 		vc4_rpathdir = join_paths(vc4_rpathdir, '..')
 	endforeach
 	vc4_rpathdir = join_paths(vc4_rpathdir, libdir)
+
+	xedir_rpathdir = '$ORIGIN'
+	foreach p : xedir.split('/')
+		xedir_rpathdir = join_paths(xedir_rpathdir, '..')
+	endforeach
+	xedir_rpathdir = join_paths(xedir_rpathdir, libdir)
 else
 	bindir_rpathdir = ''
 	libexecdir_rpathdir = ''
 	amdgpudir_rpathdir = ''
 	v3d_rpathdir = ''
 	vc4_rpathdir = ''
+	xedir_rpathdir = ''
 endif
 
 subdir('lib')
diff --git a/tests/meson.build b/tests/meson.build
index cb428998..9b3b5a46 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -442,6 +442,7 @@ test_executables += executable('sw_sync', 'sw_sync.c',
 test_list += 'sw_sync'
 
 subdir('amdgpu')
+subdir('xe')
 
 subdir('v3d')
 
diff --git a/tests/xe/meson.build b/tests/xe/meson.build
new file mode 100644
index 00000000..455e7804
--- /dev/null
+++ b/tests/xe/meson.build
@@ -0,0 +1,30 @@
+xe_progs = [
+	'xe_compute',
+	'xe_dma_buf_sync',
+	'xe_evict',
+	'xe_exec_balancer',
+	'xe_exec_basic',
+	'xe_exec_compute_mode',
+	'xe_exec_fault_mode',
+	'xe_exec_reset',
+	'xe_exec_threads',
+	'xe_guc_pc',
+	'xe_huc_copy',
+	'xe_live_ktest',
+	'xe_mmap',
+	'xe_pm',
+	'xe_prime_self_import',
+	'xe_query',
+	'xe_vm',
+	'xe_waitfence',
+]
+xe_deps = test_deps
+
+foreach prog : xe_progs
+	test_executables += executable(prog, prog + '.c',
+				       dependencies : xe_deps,
+				       install_dir : xedir,
+				       install_rpath : xedir_rpathdir,
+				       install : true)
+	test_list += join_paths('xe', prog)
+endforeach
diff --git a/tests/xe/xe_compute.c b/tests/xe/xe_compute.c
new file mode 100644
index 00000000..89134373
--- /dev/null
+++ b/tests/xe/xe_compute.c
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#include <string.h>
+
+#include "igt.h"
+#include "lib/igt_syncobj.h"
+#include "xe_drm.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include "xe/xe_compute.h"
+
+#define MAX(X, Y)			(((X) > (Y)) ? (X) : (Y))
+#define SIZE_DATA			64
+#define SIZE_BATCH			0x1000
+#define SIZE_KERNEL			0x1000
+#define SIZE_BUFFER_INPUT		MAX(sizeof(float)*SIZE_DATA, 0x1000)
+#define SIZE_BUFFER_OUTPUT		MAX(sizeof(float)*SIZE_DATA, 0x1000)
+#define ADDR_BATCH			0x100000
+#define ADDR_INPUT			(unsigned long)0x200000
+#define ADDR_OUTPUT			(unsigned long)0x300000
+#define ADDR_SURFACE_STATE_BASE		(unsigned long)0x400000
+#define ADDR_DYNAMIC_STATE_BASE		(unsigned long)0x500000
+#define ADDR_INDIRECT_OBJECT_BASE	0x800100000000
+#define OFFSET_INDIRECT_DATA_START	0xFFFDF000
+#define OFFSET_KERNEL			0xFFFEF000
+
+struct bo_dict_entry {
+	uint64_t addr;
+	uint32_t size;
+	void *data;
+};
+
+static void
+test_compute(int fd)
+{
+	uint32_t vm, engine;
+	float *dinput;
+	struct drm_xe_sync sync = { 0 };
+
+#define BO_DICT_ENTRIES 7
+	struct bo_dict_entry bo_dict[BO_DICT_ENTRIES] = {
+		{ .addr = ADDR_INDIRECT_OBJECT_BASE + OFFSET_KERNEL, .size = SIZE_KERNEL }, // kernel
+		{ .addr = ADDR_DYNAMIC_STATE_BASE, .size =  0x1000}, // dynamic state
+		{ .addr = ADDR_SURFACE_STATE_BASE, .size =  0x1000}, // surface state
+		{ .addr = ADDR_INDIRECT_OBJECT_BASE + OFFSET_INDIRECT_DATA_START, .size =  0x10000}, // indirect data
+		{ .addr = ADDR_INPUT, .size = SIZE_BUFFER_INPUT }, // input
+		{ .addr = ADDR_OUTPUT, .size = SIZE_BUFFER_OUTPUT }, // output
+		{ .addr = ADDR_BATCH, .size = SIZE_BATCH }, // batch
+	};
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	engine = xe_engine_create_class(fd, vm, DRM_XE_ENGINE_CLASS_RENDER);
+	sync.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL;
+	sync.handle = syncobj_create(fd, 0);
+
+	for(int i = 0; i < BO_DICT_ENTRIES; i++) {
+		bo_dict[i].data = aligned_alloc(xe_get_default_alignment(fd), bo_dict[i].size);
+		xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(bo_dict[i].data), bo_dict[i].addr, bo_dict[i].size, &sync, 1);
+		syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL);
+		memset(bo_dict[i].data, 0, bo_dict[i].size);
+	}
+	memcpy(bo_dict[0].data, tgllp_kernel_square_bin, tgllp_kernel_square_length);
+	tgllp_create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
+	tgllp_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
+	tgllp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT);
+	dinput = (float *)bo_dict[4].data;
+	srand(time(NULL));
+	for(int i=0; i < SIZE_DATA; i++) {
+		((float*) dinput)[i] = rand()/(float)RAND_MAX;
+	}
+	tgllp_create_batch_compute(bo_dict[6].data, ADDR_SURFACE_STATE_BASE, ADDR_DYNAMIC_STATE_BASE, ADDR_INDIRECT_OBJECT_BASE, OFFSET_INDIRECT_DATA_START);
+
+	xe_exec_wait(fd, engine, ADDR_BATCH);
+	for(int i = 0; i < SIZE_DATA; i++) {
+		igt_assert(((float*) bo_dict[5].data)[i] == ((float*) bo_dict[4].data)[i] * ((float*) bo_dict[4].data)[i]);
+	}
+
+	for(int i = 0; i < BO_DICT_ENTRIES; i++) {
+		xe_vm_unbind_async(fd, vm, 0, 0, bo_dict[i].addr, bo_dict[i].size, &sync, 1);
+		syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL);
+		free(bo_dict[i].data);
+	}
+
+	syncobj_destroy(fd, sync.handle);
+	xe_engine_destroy(fd, engine);
+	xe_vm_destroy(fd, vm);
+}
+
+static bool
+is_device_supported(int fd)
+{
+	struct drm_xe_query_config *config;
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_CONFIG,
+		.size = 0,
+		.data = 0,
+	};
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	config = malloc(query.size);
+	igt_assert(config);
+
+	query.data = to_user_pointer(config);
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	return (config->info[XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff) == 0x9a49;
+}
+
+igt_main
+{
+	int xe;
+
+	igt_fixture {
+		xe = drm_open_driver(DRIVER_XE);
+		xe_query_all(xe);
+	}
+
+	igt_subtest("compute") {
+		igt_skip_on(!is_device_supported(xe));
+		test_compute(xe);
+	}
+
+	igt_fixture
+		close(xe);
+}
diff --git a/tests/xe/xe_dma_buf_sync.c b/tests/xe/xe_dma_buf_sync.c
new file mode 100644
index 00000000..aa0ce52d
--- /dev/null
+++ b/tests/xe/xe_dma_buf_sync.c
@@ -0,0 +1,226 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include "igt.h"
+#include "lib/igt_syncobj.h"
+#include "lib/intel_reg.h"
+#include "xe_drm.h"
+
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include "xe/xe_spin.h"
+#include <string.h>
+#include <linux/dma-buf.h>
+#include <sys/poll.h>
+
+#define MAX_N_BO	16
+#define N_FD		2
+
+#define READ_SYNC	(0x1 << 0)
+
+struct igt_dma_buf_sync_file {
+	__u32 flags;
+	__s32 fd;
+};
+
+#define IGT_DMA_BUF_IOCTL_EXPORT_SYNC_FILE \
+	_IOWR(DMA_BUF_BASE, 2, struct igt_dma_buf_sync_file)
+
+static int dmabuf_export_sync_file(int dmabuf, uint32_t flags)
+{
+	struct igt_dma_buf_sync_file arg;
+
+	arg.flags = flags;
+	arg.fd = -1;
+	do_ioctl(dmabuf, IGT_DMA_BUF_IOCTL_EXPORT_SYNC_FILE, &arg);
+
+	return arg.fd;
+}
+
+static bool dmabuf_busy(int dmabuf, uint32_t flags)
+{
+	struct pollfd pfd = { .fd = dmabuf };
+
+	/* If DMA_BUF_SYNC_WRITE is set, we don't want to set POLLIN or
+	 * else poll() may return a non-zero value if there are only read
+	 * fences because POLLIN is ready even if POLLOUT isn't.
+	 */
+	if (flags & DMA_BUF_SYNC_WRITE)
+		pfd.events |= POLLOUT;
+	else if (flags & DMA_BUF_SYNC_READ)
+		pfd.events |= POLLIN;
+
+	return poll(&pfd, 1, 0) == 0;
+}
+
+static bool sync_file_busy(int sync_file)
+{
+	struct pollfd pfd = { .fd = sync_file, .events = POLLIN };
+	return poll(&pfd, 1, 0) == 0;
+}
+
+static void
+test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
+		    struct drm_xe_engine_class_instance *hwe1,
+		    int n_bo, int flags)
+{
+	uint64_t addr = 0x1a0000, base_addr = 0x1a0000;
+	int fd[N_FD];
+	uint32_t bo[MAX_N_BO];
+	int dma_buf_fd[MAX_N_BO];
+	uint32_t import_bo[MAX_N_BO];
+	uint32_t vm[N_FD];
+	uint32_t engine[N_FD];
+	size_t bo_size;
+	struct {
+		struct xe_spin spin;
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data [MAX_N_BO];
+	int i;
+
+	igt_assert(n_bo <= MAX_N_BO);
+
+	for (i = 0; i < N_FD; ++i) {
+		fd[i] = drm_open_driver(DRIVER_XE);
+		vm[i] = xe_vm_create(fd[i], 0, 0);
+		engine[i] = xe_engine_create(fd[i], vm[i], !i ? hwe0 : hwe1, 0);
+	}
+
+	bo_size = sizeof(*data[0]) * N_FD;
+	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd[0]),
+			xe_get_default_alignment(fd[0]));
+	for (i = 0; i < n_bo; ++i) {
+		bo[i] = xe_bo_create(fd[0], hwe0->gt_id, 0, bo_size);
+		dma_buf_fd[i] = prime_handle_to_fd(fd[0], bo[i]);
+		import_bo[i] = prime_fd_to_handle(fd[1], dma_buf_fd[i]);
+
+		if (i & 1)
+			data[i] = xe_bo_map(fd[1], import_bo[i], bo_size);
+		else
+			data[i] = xe_bo_map(fd[0], bo[i], bo_size);
+		memset(data[i], 0, bo_size);
+
+		xe_vm_bind_sync(fd[0], vm[0], bo[i], 0, addr, bo_size);
+		xe_vm_bind_sync(fd[1], vm[1], import_bo[i], 0, addr, bo_size);
+		addr += bo_size;
+	}
+	addr = base_addr;
+
+	for (i = 0; i < n_bo; ++i) {
+		uint64_t batch_offset = (char *)&data[i]->batch -
+			(char *)data[i];
+		uint64_t batch_addr = addr + batch_offset;
+		uint64_t sdi_offset = (char *)&data[i]->data - (char *)data[i];
+		uint64_t sdi_addr = addr + sdi_offset;
+		uint64_t spin_offset = (char *)&data[i]->spin - (char *)data[i];
+		uint64_t spin_addr = addr + spin_offset;
+		struct drm_xe_sync sync[2] = {
+			{ .flags = DRM_XE_SYNC_SYNCOBJ, },
+			{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		};
+		struct drm_xe_exec exec = {
+			.num_batch_buffer = 1,
+			.syncs = to_user_pointer(&sync),
+		};
+		uint32_t syncobj;
+		int b = 0;
+		int sync_fd;
+
+		/* Write spinner on FD[0] */
+		xe_spin_init(&data[i]->spin, spin_addr, true);
+		exec.engine_id = engine[0];
+		exec.address = spin_addr;
+		__xe_exec_assert(fd[0], &exec);
+
+		/* Export prime BO as sync file and veify business */
+		if (flags & READ_SYNC)
+			sync_fd = dmabuf_export_sync_file(dma_buf_fd[i],
+							  DMA_BUF_SYNC_READ);
+		else
+			sync_fd = dmabuf_export_sync_file(dma_buf_fd[i],
+							  DMA_BUF_SYNC_WRITE);
+		xe_spin_wait_started(&data[i]->spin);
+		igt_assert(sync_file_busy(sync_fd));
+		igt_assert(dmabuf_busy(dma_buf_fd[i], DMA_BUF_SYNC_READ));
+
+		/* Convert sync file to syncobj */
+		syncobj = syncobj_create(fd[1], 0);
+		syncobj_import_sync_file(fd[1], syncobj, sync_fd);
+
+		/* Do an exec with syncobj as in fence on FD[1] */
+		data[i]->batch[b++] = MI_STORE_DWORD_IMM;
+		data[i]->batch[b++] = sdi_addr;
+		data[i]->batch[b++] = sdi_addr >> 32;
+		data[i]->batch[b++] = 0xc0ffee;
+		data[i]->batch[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b <= ARRAY_SIZE(data[i]->batch));
+		sync[0].handle = syncobj;
+		sync[1].handle = syncobj_create(fd[1], 0);
+		exec.engine_id = engine[1];
+		exec.address = batch_addr;
+		exec.num_syncs = 2;
+		__xe_exec_assert(fd[1], &exec);
+
+		/* Verify exec blocked on spinner / prime BO */
+		usleep(5000);
+		igt_assert(!syncobj_wait(fd[1], &sync[1].handle, 1, 1, 0,
+					 NULL));
+		igt_assert_eq(data[i]->data, 0x0);
+
+		/* End spinner and verify exec complete */
+		xe_spin_end(&data[i]->spin);
+		igt_assert(syncobj_wait(fd[1], &sync[1].handle, 1, INT64_MAX,
+					0, NULL));
+		igt_assert_eq(data[i]->data, 0xc0ffee);
+
+		/* Clean up */
+		syncobj_destroy(fd[1], sync[0].handle);
+		syncobj_destroy(fd[1], sync[1].handle);
+		close(sync_fd);
+		addr += bo_size;
+	}
+
+	for (i = 0; i < n_bo; ++i) {
+		munmap(data[i], bo_size);
+		gem_close(fd[0], bo[i]);
+		close(dma_buf_fd[i]);
+	}
+}
+
+igt_main
+{
+	struct drm_xe_engine_class_instance *hwe, *hwe0 = NULL, *hwe1;
+	int fd;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		xe_query_all(fd);
+	}
+
+	for_each_hw_engine(hwe)
+		if (hwe0 == NULL) {
+			hwe0 = hwe;
+		} else {
+			hwe1 = hwe;
+			break;
+		}
+
+	igt_subtest("export-dma-buf-once")
+		test_export_dma_buf(hwe0, hwe1, 1, 0);
+
+	igt_subtest("export-dma-buf-many")
+		test_export_dma_buf(hwe0, hwe1, 16, 0);
+
+	igt_subtest("export-dma-buf-once-read-sync")
+		test_export_dma_buf(hwe0, hwe1, 1, READ_SYNC);
+
+	igt_subtest("export-dma-buf-many-read-sync")
+		test_export_dma_buf(hwe0, hwe1, 16, READ_SYNC);
+
+	igt_fixture
+		close(fd);
+}
diff --git a/tests/xe/xe_evict.c b/tests/xe/xe_evict.c
new file mode 100644
index 00000000..36a3846f
--- /dev/null
+++ b/tests/xe/xe_evict.c
@@ -0,0 +1,619 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include "igt.h"
+#include "lib/igt_syncobj.h"
+#include "lib/intel_reg.h"
+#include "xe_drm.h"
+
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include <string.h>
+
+#define MAX_N_ENGINES 16
+#define MULTI_VM	(0x1 << 0)
+#define THREADED	(0x1 << 1)
+#define MIXED_THREADS	(0x1 << 2)
+#define LEGACY_THREAD	(0x1 << 3)
+#define COMPUTE_THREAD	(0x1 << 4)
+#define EXTERNAL_OBJ	(0x1 << 5)
+#define BIND_ENGINE	(0x1 << 6)
+
+static void
+test_evict(int fd, struct drm_xe_engine_class_instance *eci,
+	   int n_engines, int n_execs, size_t bo_size,
+	   unsigned long flags, pthread_barrier_t *barrier)
+{
+	uint32_t vm, vm2, vm3;
+	uint32_t bind_engines[3] = { 0, 0, 0 };
+	uint64_t addr = 0x100000000, base_addr = 0x100000000;
+	struct drm_xe_sync sync[2] = {
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 2,
+		.syncs = to_user_pointer(&sync),
+	};
+	uint32_t engines[MAX_N_ENGINES];
+	uint32_t syncobjs[MAX_N_ENGINES];
+	uint32_t *bo;
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data;
+	int i, b;
+
+	igt_assert(n_engines <= MAX_N_ENGINES);
+
+	bo = calloc(n_execs / 2, sizeof(*bo));
+	igt_assert(bo);
+
+	fd = drm_open_driver(DRIVER_XE);
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	if (flags & BIND_ENGINE)
+		bind_engines[0] = xe_bind_engine_create(fd, vm, 0);
+	if (flags & MULTI_VM) {
+		vm2 = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+		vm3 = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+		if (flags & BIND_ENGINE) {
+			bind_engines[1] = xe_bind_engine_create(fd, vm2, 0);
+			bind_engines[2] = xe_bind_engine_create(fd, vm3, 0);
+		}
+	}
+
+	for (i = 0; i < n_engines; i++) {
+		if (flags & MULTI_VM)
+			engines[i] = xe_engine_create(fd, i & 1 ? vm2 : vm ,
+						      eci, 0);
+		else
+			engines[i] = xe_engine_create(fd, vm, eci, 0);
+		syncobjs[i] = syncobj_create(fd, 0);
+	};
+
+	for (i = 0; i < n_execs; i++) {
+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_addr = addr + batch_offset;
+		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
+		uint64_t sdi_addr = addr + sdi_offset;
+		uint32_t __bo;
+		int e = i % n_engines;
+
+		if (i < n_execs / 2) {
+                        uint32_t _vm = (flags & EXTERNAL_OBJ) &&
+                                i < n_execs / 8 ? 0 : vm;
+
+			if (flags & MULTI_VM) {
+				__bo = bo[i] = xe_bo_create(fd, eci->gt_id, 0,
+							    bo_size);
+			} else if (flags & THREADED) {
+				__bo = bo[i] = xe_bo_create(fd, eci->gt_id, vm,
+							    bo_size);
+			} else {
+				__bo = bo[i] = xe_bo_create_flags(fd, _vm,
+								  bo_size,
+								  vram_memory(eci->gt_id) |
+								  system_memory());
+			}
+		} else {
+			__bo = bo[i % (n_execs / 2)];
+		}
+		if (i)
+			munmap(data, ALIGN(sizeof(*data) * n_execs, 0x1000));
+		data = xe_bo_map(fd, __bo,
+				 ALIGN(sizeof(*data) * n_execs, 0x1000));
+
+		if (i < n_execs / 2) {
+			sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+			sync[0].handle = syncobj_create(fd, 0);
+			if (flags & MULTI_VM) {
+				xe_vm_bind_async(fd, vm3, bind_engines[2], __bo,
+						 0, addr,
+						 bo_size, sync, 1);
+				igt_assert(syncobj_wait(fd, &sync[0].handle, 1,
+							INT64_MAX, 0, NULL));
+				xe_vm_bind_async(fd, i & 1 ? vm2 : vm,
+						 i & 1 ? bind_engines[1] :
+						 bind_engines[0], __bo,
+						 0, addr, bo_size, sync, 1);
+			} else {
+				xe_vm_bind_async(fd, vm, bind_engines[0],
+						 __bo, 0, addr, bo_size,
+						 sync, 1);
+			}
+		}
+		addr += bo_size;
+
+		b = 0;
+		data[i].batch[b++] = MI_STORE_DWORD_IMM;
+		data[i].batch[b++] = sdi_addr;
+		data[i].batch[b++] = sdi_addr >> 32;
+		data[i].batch[b++] = 0xc0ffee;
+		data[i].batch[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+		if (i >= n_engines)
+			syncobj_reset(fd, &syncobjs[e], 1);
+		sync[1].handle = syncobjs[e];
+
+		exec.engine_id = engines[e];
+		exec.address = batch_addr;
+		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec), 0);
+
+		if (i + 1 == n_execs / 2) {
+			addr = base_addr;
+			exec.num_syncs = 1;
+			exec.syncs = to_user_pointer(sync + 1);
+			if (barrier)
+				pthread_barrier_wait(barrier);
+		}
+	}
+	munmap(data, ALIGN(sizeof(*data) * n_execs, 0x1000));
+
+	for (i = 0; i < n_engines; i++)
+		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
+					NULL));
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	for (i = 0; i < n_execs; i++) {
+		uint32_t __bo;
+
+		__bo = bo[i % (n_execs / 2)];
+		if (i)
+			munmap(data, ALIGN(sizeof(*data) * n_execs, 0x1000));
+		data = xe_bo_map(fd, __bo,
+				 ALIGN(sizeof(*data) * n_execs, 0x1000));
+		igt_assert_eq(data[i].data, 0xc0ffee);
+	}
+	munmap(data, ALIGN(sizeof(*data) * n_execs, 0x1000));
+
+	syncobj_destroy(fd, sync[0].handle);
+	for (i = 0; i < n_engines; i++) {
+		syncobj_destroy(fd, syncobjs[i]);
+		xe_engine_destroy(fd, engines[i]);
+	}
+
+	for (i = 0; i < 3; i++)
+		if (bind_engines[i])
+			xe_engine_destroy(fd, bind_engines[i]);
+
+	for (i = 0; i < n_execs / 2; i++)
+		gem_close(fd, bo[i]);
+
+	xe_vm_destroy(fd, vm);
+	if (flags & MULTI_VM) {
+		xe_vm_destroy(fd, vm2);
+		xe_vm_destroy(fd, vm3);
+	}
+	close(fd);
+}
+
+static void
+test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
+	      int n_engines, int n_execs, size_t bo_size, unsigned long flags,
+	      pthread_barrier_t *barrier)
+{
+	uint32_t vm, vm2;
+	uint32_t bind_engines[2] = { 0, 0 };
+	uint64_t addr = 0x100000000, base_addr = 0x100000000;
+#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
+	struct drm_xe_sync sync[1] = {
+		{ .flags = DRM_XE_SYNC_USER_FENCE | DRM_XE_SYNC_SIGNAL,
+		  .timeline_value = USER_FENCE_VALUE },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync),
+	};
+	uint32_t engines[MAX_N_ENGINES];
+	uint32_t *bo;
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+		uint64_t vm_sync;
+		uint64_t exec_sync;
+	} *data;
+	int i, b;
+
+	igt_assert(n_engines <= MAX_N_ENGINES);
+
+	bo = calloc(n_execs / 2, sizeof(*bo));
+	igt_assert(bo);
+
+	fd = drm_open_driver(DRIVER_XE);
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
+			  DRM_XE_VM_CREATE_COMPUTE_MODE, 0);
+	if (flags & BIND_ENGINE)
+		bind_engines[0] = xe_bind_engine_create(fd, vm, 0);
+	if (flags & MULTI_VM) {
+		vm2 = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
+				   DRM_XE_VM_CREATE_COMPUTE_MODE, 0);
+		if (flags & BIND_ENGINE)
+			bind_engines[1] = xe_bind_engine_create(fd, vm2, 0);
+	}
+
+	for (i = 0; i < n_engines; i++) {
+		struct drm_xe_ext_engine_set_property ext = {
+			.base.next_extension = 0,
+			.base.name = XE_ENGINE_EXTENSION_SET_PROPERTY,
+			.property = XE_ENGINE_PROPERTY_COMPUTE_MODE,
+			.value = 1,
+		};
+
+		if (flags & MULTI_VM)
+			engines[i] = xe_engine_create(fd, i & 1 ? vm2 : vm, eci,
+						      to_user_pointer(&ext));
+		else
+			engines[i] = xe_engine_create(fd, vm, eci,
+						      to_user_pointer(&ext));
+	}
+
+	for (i = 0; i < n_execs; i++) {
+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_addr = addr + batch_offset;
+		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
+		uint64_t sdi_addr = addr + sdi_offset;
+		uint32_t __bo;
+		int e = i % n_engines;
+
+		if (i < n_execs / 2) {
+                        uint32_t _vm = (flags & EXTERNAL_OBJ) &&
+                                i < n_execs / 8 ? 0 : vm;
+
+			if (flags & MULTI_VM) {
+				__bo = bo[i] = xe_bo_create(fd, eci->gt_id,
+							    0, bo_size);
+			} else if (flags & THREADED) {
+				__bo = bo[i] = xe_bo_create(fd, eci->gt_id,
+							    vm, bo_size);
+			} else {
+				__bo = bo[i] = xe_bo_create_flags(fd, _vm,
+								  bo_size,
+								  vram_memory(eci->gt_id) |
+								  system_memory());
+			}
+		} else {
+			__bo = bo[i % (n_execs / 2)];
+		}
+		if (i)
+			munmap(data, ALIGN(sizeof(*data) * n_execs, 0x1000));
+		data = xe_bo_map(fd, __bo,
+				 ALIGN(sizeof(*data) * n_execs, 0x1000));
+		if (i < n_execs / 2)
+			memset(data, 0, ALIGN(sizeof(*data) * n_execs, 0x1000));
+
+		if (i < n_execs / 2) {
+			sync[0].addr = to_user_pointer(&data[i].vm_sync);
+			if (flags & MULTI_VM) {
+				xe_vm_bind_async(fd, i & 1 ? vm2 : vm,
+						 i & 1 ? bind_engines[1] :
+						 bind_engines[0], __bo,
+						 0, addr, bo_size, sync, 1);
+			} else {
+				xe_vm_bind_async(fd, vm, bind_engines[0], __bo,
+						 0, addr, bo_size, sync, 1);
+			}
+#define TWENTY_SEC	20000
+			xe_wait_ufence(fd, &data[i].vm_sync, USER_FENCE_VALUE,
+				       NULL, TWENTY_SEC);
+		}
+		sync[0].addr = addr + (char *)&data[i].exec_sync -
+			(char *)data;
+		addr += bo_size;
+
+		b = 0;
+		data[i].batch[b++] = MI_STORE_DWORD_IMM;
+		data[i].batch[b++] = sdi_addr;
+		data[i].batch[b++] = sdi_addr >> 32;
+		data[i].batch[b++] = 0xc0ffee;
+		data[i].batch[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+		exec.engine_id = engines[e];
+		exec.address = batch_addr;
+		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec), 0);
+
+		if (i + 1 == n_execs / 2) {
+			addr = base_addr;
+			if (barrier)
+				pthread_barrier_wait(barrier);
+		}
+	}
+	munmap(data, ALIGN(sizeof(*data) * n_execs, 0x1000));
+
+	for (i = 0; i < n_execs; i++) {
+		uint32_t __bo;
+
+		__bo = bo[i % (n_execs / 2)];
+		if (i)
+			munmap(data, ALIGN(sizeof(*data) * n_execs, 0x1000));
+		data = xe_bo_map(fd, __bo,
+				 ALIGN(sizeof(*data) * n_execs, 0x1000));
+		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
+			       NULL, TWENTY_SEC);
+		igt_assert_eq(data[i].data, 0xc0ffee);
+	}
+	munmap(data, ALIGN(sizeof(*data) * n_execs, 0x1000));
+
+	for (i = 0; i < n_engines; i++)
+		xe_engine_destroy(fd, engines[i]);
+
+	for (i = 0; i < 2; i++)
+		if (bind_engines[i])
+			xe_engine_destroy(fd, bind_engines[i]);
+
+	for (i = 0; i < n_execs / 2; i++)
+		gem_close(fd, bo[i]);
+
+	xe_vm_destroy(fd, vm);
+	if (flags & MULTI_VM)
+		xe_vm_destroy(fd, vm2);
+	close(fd);
+}
+
+struct thread_data {
+	pthread_t thread;
+	pthread_mutex_t *mutex;
+	pthread_cond_t *cond;
+	pthread_barrier_t *barrier;
+	int fd;
+	struct drm_xe_engine_class_instance *eci;
+	int n_engines;
+	int n_execs;
+	uint64_t bo_size;
+	int flags;
+	bool *go;
+};
+
+static void *thread(void *data)
+{
+	struct thread_data *t = data;
+
+	pthread_mutex_lock(t->mutex);
+	while (*t->go == 0)
+		pthread_cond_wait(t->cond, t->mutex);
+	pthread_mutex_unlock(t->mutex);
+
+	if (t->flags & COMPUTE_THREAD)
+		test_evict_cm(t->fd, t->eci, t->n_engines, t->n_execs,
+			      t->bo_size, t->flags, t->barrier);
+	else
+		test_evict(t->fd, t->eci, t->n_engines, t->n_execs,
+			   t->bo_size, t->flags, t->barrier);
+
+	return NULL;
+}
+
+static void
+threads(int fd, struct drm_xe_engine_class_instance *eci,
+	int n_threads, int n_engines, int n_execs, size_t bo_size,
+	unsigned long flags)
+{
+	pthread_barrier_t barrier;
+	bool go = false;
+	struct thread_data *threads_data;
+	pthread_mutex_t mutex;
+	pthread_cond_t cond;
+	int i;
+
+	threads_data = calloc(n_threads, sizeof(*threads_data));
+	igt_assert(threads_data);
+
+	pthread_mutex_init(&mutex, 0);
+	pthread_cond_init(&cond, 0);
+	pthread_barrier_init(&barrier, NULL, n_threads);
+
+	for (i = 0; i < n_threads; ++i) {
+		threads_data[i].mutex = &mutex;
+		threads_data[i].cond = &cond;
+		threads_data[i].barrier = &barrier;
+		threads_data[i].fd = fd;
+		threads_data[i].eci = eci;
+		threads_data[i].n_engines = n_engines;
+		threads_data[i].n_execs = n_execs;
+		threads_data[i].bo_size = bo_size;
+		threads_data[i].flags = flags;
+		if ((i & 1 && flags & MIXED_THREADS) || flags & COMPUTE_THREAD)
+			threads_data[i].flags |= COMPUTE_THREAD;
+		else
+			threads_data[i].flags |= LEGACY_THREAD;
+		threads_data[i].go = &go;
+
+		pthread_create(&threads_data[i].thread, 0, thread,
+			       &threads_data[i]);
+	}
+
+	pthread_mutex_lock(&mutex);
+	go = true;
+	pthread_cond_broadcast(&cond);
+	pthread_mutex_unlock(&mutex);
+
+	for (i = 0; i < n_threads; ++i)
+		pthread_join(threads_data[i].thread, NULL);
+}
+
+static uint64_t calc_bo_size(uint64_t vram_size, int mul, int div)
+{
+	return (ALIGN(vram_size, 0x40000000)  * mul) / div;
+}
+
+/*
+ * Table driven test that attempts to cover all possible scenarios of eviction
+ * (small / large objects, compute mode vs non-compute VMs, external BO or BOs
+ * tied to VM, multiple VMs using over 51% of the VRAM, evicting BOs from your
+ * own VM, and using a user bind or kernel VM engine to do the binds). All of
+ * these options are attempted to be mixed via different table entries. Single
+ * threaded sections exists for both compute and non-compute VMs, and thread
+ * sections exists which cover multiple compute VM, multiple non-compute VMs,
+ * and mixing of VMs.
+ */
+igt_main
+{
+	struct drm_xe_engine_class_instance *hwe;
+	const struct section {
+		const char *name;
+		int n_engines;
+		int n_execs;
+		int mul;
+		int div;
+		unsigned int flags;
+	} sections[] = {
+		{ "small", 16, 448, 1, 128, 0 },
+		{ "small-external", 16, 448, 1, 128, EXTERNAL_OBJ },
+		{ "small-multi-vm", 16, 256, 1, 128, MULTI_VM },
+		{ "large", 4, 16, 1, 4, 0 },
+		{ "large-external", 4, 16, 1, 4, EXTERNAL_OBJ },
+		{ "large-multi-vm", 4, 8, 3, 8, MULTI_VM },
+		{ "beng-small", 16, 448, 1, 128, BIND_ENGINE },
+		{ "beng-small-external", 16, 448, 1, 128, BIND_ENGINE |
+			EXTERNAL_OBJ },
+		{ "beng-small-multi-vm", 16, 256, 1, 128, BIND_ENGINE |
+			MULTI_VM },
+		{ "beng-large", 4, 16, 1, 4, 0 },
+		{ "beng-large-external", 4, 16, 1, 4, BIND_ENGINE |
+			EXTERNAL_OBJ },
+		{ "beng-large-multi-vm", 4, 8, 3, 8, BIND_ENGINE | MULTI_VM },
+		{ NULL },
+	};
+	const struct section_cm {
+		const char *name;
+		int n_engines;
+		int n_execs;
+		int mul;
+		int div;
+		unsigned int flags;
+	} sections_cm[] = {
+		{ "small-cm", 16, 448, 1, 128, 0 },
+		{ "small-external-cm", 16, 448, 1, 128, EXTERNAL_OBJ },
+		{ "small-multi-vm-cm", 16, 256, 1, 128, MULTI_VM },
+		{ "large-cm", 4, 16, 1, 4, 0 },
+		{ "large-external-cm", 4, 16, 1, 4, EXTERNAL_OBJ },
+		{ "large-multi-vm-cm", 4, 8, 3, 8, MULTI_VM },
+		{ "beng-small-cm", 16, 448, 1, 128, BIND_ENGINE },
+		{ "beng-small-external-cm", 16, 448, 1, 128, BIND_ENGINE |
+			EXTERNAL_OBJ },
+		{ "beng-small-multi-vm-cm", 16, 256, 1, 128, BIND_ENGINE |
+			MULTI_VM },
+		{ "beng-large-cm", 4, 16, 1, 4, BIND_ENGINE },
+		{ "beng-large-external-cm", 4, 16, 1, 4, BIND_ENGINE |
+			EXTERNAL_OBJ },
+		{ "beng-large-multi-vm-cm", 4, 8, 3, 8, BIND_ENGINE |
+			MULTI_VM },
+		{ NULL },
+	};
+	const struct section_threads {
+		const char *name;
+		int n_threads;
+		int n_engines;
+		int n_execs;
+		int mul;
+		int div;
+		unsigned int flags;
+	} sections_threads[] = {
+		{ "threads-small", 2, 16, 128, 1, 128,
+			THREADED },
+		{ "cm-threads-small", 2, 16, 128, 1, 128,
+			COMPUTE_THREAD | THREADED },
+		{ "mixed-threads-small", 2, 16, 128, 1, 128,
+			MIXED_THREADS | THREADED },
+		{ "mixed-many-threads-small", 3, 16, 128, 1, 128,
+			THREADED },
+		{ "threads-large", 2, 2, 4, 3, 8,
+			THREADED },
+		{ "cm-threads-large", 2, 2, 4, 3, 8,
+			COMPUTE_THREAD | THREADED },
+		{ "mixed-threads-large", 2, 2, 4, 3, 8,
+			MIXED_THREADS | THREADED },
+		{ "mixed-many-threads-large", 3, 2, 4, 3, 8,
+			THREADED },
+		{ "threads-small-multi-vm", 2, 16, 128, 1, 128,
+			MULTI_VM | THREADED },
+		{ "cm-threads-small-multi-vm", 2, 16, 128, 1, 128,
+			COMPUTE_THREAD | MULTI_VM | THREADED },
+		{ "mixed-threads-small-multi-vm", 2, 16, 128, 1, 128,
+			MIXED_THREADS | MULTI_VM | THREADED },
+		{ "threads-large-multi-vm", 2, 2, 4, 3, 8,
+			MULTI_VM | THREADED },
+		{ "cm-threads-large-multi-vm", 2, 2, 4, 3, 8,
+			COMPUTE_THREAD | MULTI_VM | THREADED },
+		{ "mixed-threads-large-multi-vm", 2, 2, 4, 3, 8,
+			MIXED_THREADS | MULTI_VM | THREADED },
+		{ "beng-threads-small", 2, 16, 128, 1, 128,
+			THREADED | BIND_ENGINE },
+		{ "beng-cm-threads-small", 2, 16, 128, 1, 128,
+			COMPUTE_THREAD | THREADED | BIND_ENGINE },
+		{ "beng-mixed-threads-small", 2, 16, 128, 1, 128,
+			MIXED_THREADS | THREADED | BIND_ENGINE },
+		{ "beng-mixed-many-threads-small", 3, 16, 128, 1, 128,
+			THREADED | BIND_ENGINE },
+		{ "beng-threads-large", 2, 2, 4, 3, 8,
+			THREADED | BIND_ENGINE },
+		{ "beng-cm-threads-large", 2, 2, 4, 3, 8,
+			COMPUTE_THREAD | THREADED | BIND_ENGINE },
+		{ "beng-mixed-threads-large", 2, 2, 4, 3, 8,
+			MIXED_THREADS | THREADED | BIND_ENGINE },
+		{ "beng-mixed-many-threads-large", 3, 2, 4, 3, 8,
+			THREADED | BIND_ENGINE },
+		{ "beng-threads-small-multi-vm", 2, 16, 128, 1, 128,
+			MULTI_VM | THREADED | BIND_ENGINE },
+		{ "beng-cm-threads-small-multi-vm", 2, 16, 128, 1, 128,
+			COMPUTE_THREAD | MULTI_VM | THREADED | BIND_ENGINE },
+		{ "beng-mixed-threads-small-multi-vm", 2, 16, 128, 1, 128,
+			MIXED_THREADS | MULTI_VM | THREADED | BIND_ENGINE },
+		{ "beng-threads-large-multi-vm", 2, 2, 4, 3, 8,
+			MULTI_VM | THREADED | BIND_ENGINE },
+		{ "beng-cm-threads-large-multi-vm", 2, 2, 4, 3, 8,
+			COMPUTE_THREAD | MULTI_VM | THREADED | BIND_ENGINE },
+		{ "beng-mixed-threads-large-multi-vm", 2, 2, 4, 3, 8,
+			MIXED_THREADS | MULTI_VM | THREADED | BIND_ENGINE },
+		{ NULL },
+	};
+	uint64_t vram_size;
+	int fd;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		igt_require(xe_has_vram(fd));
+		xe_query_all(fd);
+		vram_size = xe_vram_size(fd);
+		igt_assert(vram_size);
+	}
+
+	for_each_hw_engine(hwe)
+		if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COPY)
+			break;
+
+	for (const struct section *s = sections; s->name; s++) {
+		igt_subtest_f("evict-%s", s->name)
+			test_evict(-1, hwe, s->n_engines, s->n_execs,
+				   calc_bo_size(vram_size, s->mul, s->div),
+				   s->flags, NULL);
+	}
+
+	for (const struct section_cm *s = sections_cm; s->name; s++) {
+		igt_subtest_f("evict-%s", s->name)
+			test_evict_cm(-1, hwe, s->n_engines, s->n_execs,
+				      calc_bo_size(vram_size, s->mul, s->div),
+				      s->flags, NULL);
+	}
+
+	for (const struct section_threads *s = sections_threads; s->name; s++) {
+		igt_subtest_f("evict-%s", s->name)
+			threads(-1, hwe, s->n_threads, s->n_engines,
+				 s->n_execs,
+				 calc_bo_size(vram_size, s->mul, s->div),
+				 s->flags);
+	}
+
+	igt_fixture
+		close(fd);
+}
diff --git a/tests/xe/xe_exec_balancer.c b/tests/xe/xe_exec_balancer.c
new file mode 100644
index 00000000..ee84a574
--- /dev/null
+++ b/tests/xe/xe_exec_balancer.c
@@ -0,0 +1,620 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include <fcntl.h>
+
+#include "igt.h"
+#include "lib/igt_syncobj.h"
+#include "lib/intel_reg.h"
+#include "xe_drm.h"
+
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include "xe/xe_spin.h"
+#include <string.h>
+
+#define MAX_INSTANCE 9
+
+static void test_all_active(int fd, int gt, int class)
+{
+	uint32_t vm;
+	uint64_t addr = 0x1a0000;
+	struct drm_xe_sync sync[2] = {
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 2,
+		.syncs = to_user_pointer(&sync),
+	};
+	uint32_t engines[MAX_INSTANCE];
+	uint32_t syncobjs[MAX_INSTANCE];
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct {
+		struct xe_spin spin;
+	} *data;
+	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
+	int i, num_placements = 0;
+
+	for_each_hw_engine(hwe) {
+		if (hwe->engine_class != class || hwe->gt_id != gt)
+			continue;
+
+		eci[num_placements++] = *hwe;
+	}
+	if (num_placements < 2)
+		return;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	bo_size = sizeof(*data) * num_placements;
+	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
+
+	bo = xe_bo_create(fd, gt, vm, bo_size);
+	data = xe_bo_map(fd, bo, bo_size);
+
+	for (i = 0; i < num_placements; i++) {
+		struct drm_xe_engine_create create = {
+			.vm_id = vm,
+			.width = 1,
+			.num_placements = num_placements,
+			.instances = to_user_pointer(eci),
+		};
+
+		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_ENGINE_CREATE,
+					&create), 0);
+		engines[i] = create.engine_id;
+		syncobjs[i] = syncobj_create(fd, 0);
+	};
+
+	sync[0].handle = syncobj_create(fd, 0);
+	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
+
+	for (i = 0; i < num_placements; i++) {
+		uint64_t spin_offset = (char *)&data[i].spin - (char *)data;
+		uint64_t spin_addr = addr + spin_offset;
+
+		xe_spin_init(&data[i].spin, spin_addr, false);
+		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+		sync[1].handle = syncobjs[i];
+
+		exec.engine_id = engines[i];
+		exec.address = spin_addr;
+		__xe_exec_assert(fd, &exec);
+		xe_spin_wait_started(&data[i].spin);
+	}
+
+	for (i = 0; i < num_placements; i++) {
+		xe_spin_end(&data[i].spin);
+		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
+					NULL));
+	}
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	syncobj_destroy(fd, sync[0].handle);
+	for (i = 0; i < num_placements; i++) {
+		syncobj_destroy(fd, syncobjs[i]);
+		xe_engine_destroy(fd, engines[i]);
+	}
+
+	munmap(data, bo_size);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
+#define MAX_N_ENGINES 16
+#define USERPTR		(0x1 << 0)
+#define REBIND		(0x1 << 1)
+#define INVALIDATE	(0x1 << 2)
+#define RACE		(0x1 << 3)
+#define VIRTUAL		(0x1 << 4)
+#define PARALLEL	(0x1 << 5)
+
+static void
+test_exec(int fd, int gt, int class, int n_engines, int n_execs,
+	  unsigned int flags)
+{
+	uint32_t vm;
+	uint64_t addr = 0x1a0000;
+	struct drm_xe_sync sync[2] = {
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+	};
+	struct drm_xe_exec exec = {
+		.num_syncs = 2,
+		.syncs = to_user_pointer(&sync),
+	};
+	uint32_t engines[MAX_N_ENGINES];
+	uint32_t syncobjs[MAX_N_ENGINES];
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data;
+	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
+	int i, j, b, num_placements = 0;
+
+	igt_assert(n_engines <= MAX_N_ENGINES);
+
+	for_each_hw_engine(hwe) {
+		if (hwe->engine_class != class || hwe->gt_id != gt)
+			continue;
+
+		eci[num_placements++] = *hwe;
+	}
+	if (num_placements < 2)
+		return;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	bo_size = sizeof(*data) * n_execs;
+	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
+
+	if (flags & USERPTR) {
+#define	MAP_ADDRESS	0x00007fadeadbe000
+		if (flags & INVALIDATE) {
+			data = mmap((void *)MAP_ADDRESS, bo_size, PROT_READ |
+				    PROT_WRITE, MAP_SHARED | MAP_FIXED |
+				    MAP_ANONYMOUS, -1, 0);
+			igt_assert(data != MAP_FAILED);
+		} else {
+			data = aligned_alloc(xe_get_default_alignment(fd), bo_size);
+			igt_assert(data);
+		}
+		memset(data, 0, bo_size);
+	} else {
+		bo = xe_bo_create(fd, gt, vm, bo_size);
+		data = xe_bo_map(fd, bo, bo_size);
+	}
+
+	for (i = 0; i < n_engines; i++) {
+		struct drm_xe_engine_create create = {
+			.vm_id = vm,
+			.width = flags & PARALLEL ? num_placements : 1,
+			.num_placements = flags & PARALLEL ? 1 : num_placements,
+			.instances = to_user_pointer(eci),
+		};
+
+		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_ENGINE_CREATE,
+					&create), 0);
+		engines[i] = create.engine_id;
+		syncobjs[i] = syncobj_create(fd, 0);
+	};
+	exec.num_batch_buffer = flags & PARALLEL ? num_placements : 1;
+
+	sync[0].handle = syncobj_create(fd, 0);
+	if (bo)
+		xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
+	else
+		xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(data), addr,
+					 bo_size, sync, 1);
+
+	for (i = 0; i < n_execs; i++) {
+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_addr = addr + batch_offset;
+		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
+		uint64_t sdi_addr = addr + sdi_offset;
+		uint64_t batches[MAX_INSTANCE];
+		int e = i % n_engines;
+
+		for (j = 0; j < num_placements && flags & PARALLEL; ++j)
+			batches[j] = batch_addr;
+
+		b = 0;
+		data[i].batch[b++] = MI_STORE_DWORD_IMM;
+		data[i].batch[b++] = sdi_addr;
+		data[i].batch[b++] = sdi_addr >> 32;
+		data[i].batch[b++] = 0xc0ffee;
+		data[i].batch[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+		sync[1].handle = syncobjs[e];
+
+		exec.engine_id = engines[e];
+		exec.address = flags & PARALLEL ?
+			to_user_pointer(batches) : batch_addr;
+		if (e != i)
+			 syncobj_reset(fd, &syncobjs[e], 1);
+		__xe_exec_assert(fd, &exec);
+
+		if (flags & REBIND && i + 1 != n_execs) {
+			sync[1].flags &= ~DRM_XE_SYNC_SIGNAL;
+			xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size,
+					   sync + 1, 1);
+
+			sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+			addr += bo_size;
+			if (bo)
+				xe_vm_bind_async(fd, vm, 0, bo, 0, addr,
+						 bo_size, sync, 1);
+			else
+				xe_vm_bind_userptr_async(fd, vm, 0,
+							 to_user_pointer(data),
+							 addr, bo_size, sync,
+							 1);
+		}
+
+		if (flags & INVALIDATE && i + 1 != n_execs) {
+			if (!(flags & RACE)) {
+				/*
+				 * Wait for exec completion and check data as
+				 * userptr will likely change to different
+				 * physical memory on next mmap call triggering
+				 * an invalidate.
+				 */
+				igt_assert(syncobj_wait(fd, &syncobjs[e], 1,
+							INT64_MAX, 0, NULL));
+				igt_assert_eq(data[i].data, 0xc0ffee);
+			} else if (i * 2 != n_execs) {
+				/*
+				 * We issue 1 mmap which races against running
+				 * jobs. No real check here aside from this test
+				 * not faulting on the GPU.
+				 */
+				continue;
+			}
+
+			data = mmap((void *)MAP_ADDRESS, bo_size, PROT_READ |
+				    PROT_WRITE, MAP_SHARED | MAP_FIXED |
+				    MAP_ANONYMOUS, -1, 0);
+			igt_assert(data != MAP_FAILED);
+		}
+	}
+
+	for (i = 0; i < n_engines && n_execs; i++)
+		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
+					NULL));
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	for (i = (flags & INVALIDATE && n_execs) ? n_execs - 1 : 0;
+	     i < n_execs; i++)
+		igt_assert_eq(data[i].data, 0xc0ffee);
+
+	syncobj_destroy(fd, sync[0].handle);
+	for (i = 0; i < n_engines; i++) {
+		syncobj_destroy(fd, syncobjs[i]);
+		xe_engine_destroy(fd, engines[i]);
+	}
+
+	if (bo) {
+		munmap(data, bo_size);
+		gem_close(fd, bo);
+	} else if (!(flags & INVALIDATE)) {
+		free(data);
+	}
+	xe_vm_destroy(fd, vm);
+}
+
+static void
+test_cm(int fd, int gt, int class, int n_engines, int n_execs,
+	unsigned int flags)
+{
+	uint32_t vm;
+	uint64_t addr = 0x1a0000;
+#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
+	struct drm_xe_sync sync[1] = {
+		{ .flags = DRM_XE_SYNC_USER_FENCE | DRM_XE_SYNC_SIGNAL,
+	          .timeline_value = USER_FENCE_VALUE },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync),
+	};
+	uint32_t engines[MAX_N_ENGINES];
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint64_t vm_sync;
+		uint64_t exec_sync;
+		uint32_t data;
+	} *data;
+	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
+	int i, j, b, num_placements = 0;
+	int map_fd = -1;
+
+	igt_assert(n_engines <= MAX_N_ENGINES);
+
+	for_each_hw_engine(hwe) {
+		if (hwe->engine_class != class || hwe->gt_id != gt)
+			continue;
+
+		eci[num_placements++] = *hwe;
+	}
+	if (num_placements < 2)
+		return;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
+			  DRM_XE_VM_CREATE_COMPUTE_MODE, 0);
+	bo_size = sizeof(*data) * n_execs;
+	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
+			xe_get_default_alignment(fd));
+
+	if (flags & USERPTR) {
+#define	MAP_ADDRESS	0x00007fadeadbe000
+		if (flags & INVALIDATE) {
+			data = mmap((void *)MAP_ADDRESS, bo_size, PROT_READ |
+				    PROT_WRITE, MAP_SHARED | MAP_FIXED |
+				    MAP_ANONYMOUS, -1, 0);
+			igt_assert(data != MAP_FAILED);
+		} else {
+			data = aligned_alloc(xe_get_default_alignment(fd),
+					     bo_size);
+			igt_assert(data);
+		}
+	} else {
+		bo = xe_bo_create(fd, gt, vm, bo_size);
+		data = xe_bo_map(fd, bo, bo_size);
+	}
+	memset(data, 0, bo_size);
+
+	for (i = 0; i < n_engines; i++) {
+		struct drm_xe_ext_engine_set_property ext = {
+			.base.next_extension = 0,
+			.base.name = XE_ENGINE_EXTENSION_SET_PROPERTY,
+			.property = XE_ENGINE_PROPERTY_COMPUTE_MODE,
+			.value = 1,
+		};
+		struct drm_xe_engine_create create = {
+			.vm_id = vm,
+			.width = 1,
+			.num_placements = num_placements,
+			.instances = to_user_pointer(eci),
+			.extensions = to_user_pointer(&ext),
+		};
+
+		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_ENGINE_CREATE,
+					&create), 0);
+		engines[i] = create.engine_id;
+	}
+
+	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	if (bo)
+		xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
+	else
+		xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(data), addr,
+					 bo_size, sync, 1);
+
+#define ONE_SEC	1000
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, ONE_SEC);
+	data[0].vm_sync = 0;
+
+	for (i = 0; i < n_execs; i++) {
+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_addr = addr + batch_offset;
+		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
+		uint64_t sdi_addr = addr + sdi_offset;
+		int e = i % n_engines;
+
+		b = 0;
+		data[i].batch[b++] = MI_STORE_DWORD_IMM;
+		data[i].batch[b++] = sdi_addr;
+		data[i].batch[b++] = sdi_addr >> 32;
+		data[i].batch[b++] = 0xc0ffee;
+		data[i].batch[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+		sync[0].addr = addr + (char *)&data[i].exec_sync - (char *)data;
+
+		exec.engine_id = engines[e];
+		exec.address = batch_addr;
+		__xe_exec_assert(fd, &exec);
+
+		if (flags & REBIND && i + 1 != n_execs) {
+			xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
+				       NULL, ONE_SEC);
+			xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, NULL,
+					   0);
+
+			sync[0].addr = to_user_pointer(&data[0].vm_sync);
+			addr += bo_size;
+			if (bo)
+				xe_vm_bind_async(fd, vm, 0, bo, 0, addr,
+						 bo_size, sync, 1);
+			else
+				xe_vm_bind_userptr_async(fd, vm, 0,
+							 to_user_pointer(data),
+							 addr, bo_size, sync,
+							 1);
+			xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
+				       NULL, ONE_SEC);
+			data[0].vm_sync = 0;
+		}
+
+		if (flags & INVALIDATE && i + 1 != n_execs) {
+			if (!(flags & RACE)) {
+				/*
+				 * Wait for exec completion and check data as
+				 * userptr will likely change to different
+				 * physical memory on next mmap call triggering
+				 * an invalidate.
+				 */
+				xe_wait_ufence(fd, &data[i].exec_sync,
+					       USER_FENCE_VALUE, NULL, ONE_SEC);
+				igt_assert_eq(data[i].data, 0xc0ffee);
+			} else if (i * 2 != n_execs) {
+				/*
+				 * We issue 1 mmap which races against running
+				 * jobs. No real check here aside from this test
+				 * not faulting on the GPU.
+				 */
+				continue;
+			}
+
+			if (flags & RACE) {
+				map_fd = open("/tmp", O_TMPFILE | O_RDWR,
+					      0x666);
+				write(map_fd, data, bo_size);
+				data = mmap((void *)MAP_ADDRESS, bo_size,
+					    PROT_READ | PROT_WRITE, MAP_SHARED |
+					    MAP_FIXED, map_fd, 0);
+			} else {
+				data = mmap((void *)MAP_ADDRESS, bo_size,
+					    PROT_READ | PROT_WRITE, MAP_SHARED |
+					    MAP_FIXED | MAP_ANONYMOUS, -1, 0);
+			}
+			igt_assert(data != MAP_FAILED);
+		}
+	}
+
+	j = flags & INVALIDATE && n_execs ? n_execs - 1 : 0;
+	for (i = j; i < n_execs; i++)
+		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE, NULL,
+			       ONE_SEC);
+
+	/* Wait for all execs to complete */
+	if (flags & INVALIDATE)
+		usleep(250000);
+
+	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, ONE_SEC);
+
+	for (i = (flags & INVALIDATE && n_execs) ? n_execs - 1 : 0;
+	     i < n_execs; i++)
+		igt_assert_eq(data[i].data, 0xc0ffee);
+
+	for (i = 0; i < n_engines; i++)
+		xe_engine_destroy(fd, engines[i]);
+
+	if (bo) {
+		munmap(data, bo_size);
+		gem_close(fd, bo);
+	} else if (!(flags & INVALIDATE)) {
+		free(data);
+	}
+	xe_vm_destroy(fd, vm);
+}
+
+
+igt_main
+{
+	const struct section {
+		const char *name;
+		unsigned int flags;
+	} sections[] = {
+		{ "virtual-basic", VIRTUAL },
+		{ "virtual-userptr", VIRTUAL | USERPTR },
+		{ "virtual-rebind", VIRTUAL | REBIND },
+		{ "virtual-userptr-rebind", VIRTUAL | USERPTR | REBIND },
+		{ "virtual-userptr-invalidate", VIRTUAL | USERPTR |
+			INVALIDATE },
+		{ "virtual-userptr-invalidate-race", VIRTUAL | USERPTR |
+			INVALIDATE | RACE },
+		{ "parallel-basic", PARALLEL },
+		{ "parallel-userptr", PARALLEL | USERPTR },
+		{ "parallel-rebind", PARALLEL | REBIND },
+		{ "parallel-userptr-rebind", PARALLEL | USERPTR | REBIND },
+		{ "parallel-userptr-invalidate", PARALLEL | USERPTR |
+			INVALIDATE },
+		{ "parallel-userptr-invalidate-race", PARALLEL | USERPTR |
+			INVALIDATE | RACE },
+		{ NULL },
+	};
+	int gt;
+	int class;
+	int fd;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		xe_query_all(fd);
+	}
+
+	igt_subtest("virtual-all-active")
+		for_each_gt(gt)
+			for_each_hw_engine_class(class)
+				test_all_active(fd, gt, class);
+
+	for (const struct section *s = sections; s->name; s++) {
+		igt_subtest_f("once-%s", s->name)
+			for_each_gt(gt)
+				for_each_hw_engine_class(class)
+					test_exec(fd, gt, class, 1, 1,
+						  s->flags);
+
+		igt_subtest_f("twice-%s", s->name)
+			for_each_gt(gt)
+				for_each_hw_engine_class(class)
+					test_exec(fd, gt, class, 1, 2,
+						  s->flags);
+
+		igt_subtest_f("many-%s", s->name)
+			for_each_gt(gt)
+				for_each_hw_engine_class(class)
+					test_exec(fd, gt, class, 1,
+						  s->flags & (REBIND | INVALIDATE) ?
+						  64 : 1024,
+						  s->flags);
+
+		igt_subtest_f("many-engines-%s", s->name)
+			for_each_gt(gt)
+				for_each_hw_engine_class(class)
+					test_exec(fd, gt, class, 16,
+						  s->flags & (REBIND | INVALIDATE) ?
+						  64 : 1024,
+						  s->flags);
+
+		igt_subtest_f("no-exec-%s", s->name)
+			for_each_gt(gt)
+				for_each_hw_engine_class(class)
+					test_exec(fd, gt, class, 1, 0,
+						  s->flags);
+
+		if (s->flags & PARALLEL)
+			continue;
+
+		igt_subtest_f("once-cm-%s", s->name)
+			for_each_gt(gt)
+				for_each_hw_engine_class(class)
+					test_cm(fd, gt, class, 1, 1, s->flags);
+
+		igt_subtest_f("twice-cm-%s", s->name)
+			for_each_gt(gt)
+				for_each_hw_engine_class(class)
+					test_cm(fd, gt, class, 1, 2, s->flags);
+
+		igt_subtest_f("many-cm-%s", s->name)
+			for_each_gt(gt)
+				for_each_hw_engine_class(class)
+					test_cm(fd, gt, class, 1,
+						s->flags & (REBIND | INVALIDATE) ?
+						64 : 1024,
+						s->flags);
+
+		igt_subtest_f("many-engines-cm-%s", s->name)
+			for_each_gt(gt)
+				for_each_hw_engine_class(class)
+					test_cm(fd, gt, class, 16,
+						s->flags & (REBIND | INVALIDATE) ?
+						64 : 1024,
+						s->flags);
+
+		igt_subtest_f("no-exec-cm-%s", s->name)
+			for_each_gt(gt)
+				for_each_hw_engine_class(class)
+					test_cm(fd, gt, class, 1, 0, s->flags);
+	}
+
+	igt_fixture
+		close(fd);
+}
diff --git a/tests/xe/xe_exec_basic.c b/tests/xe/xe_exec_basic.c
new file mode 100644
index 00000000..106d4864
--- /dev/null
+++ b/tests/xe/xe_exec_basic.c
@@ -0,0 +1,294 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include "igt.h"
+#include "lib/igt_syncobj.h"
+#include "lib/intel_reg.h"
+#include "xe_drm.h"
+
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include <string.h>
+
+#define MAX_N_ENGINES 16
+#define USERPTR		(0x1 << 0)
+#define REBIND		(0x1 << 1)
+#define INVALIDATE	(0x1 << 2)
+#define RACE		(0x1 << 3)
+#define BIND_ENGINE	(0x1 << 4)
+#define DEFER_ALLOC	(0x1 << 5)
+#define DEFER_BIND	(0x1 << 6)
+
+static void
+test_exec(int fd, struct drm_xe_engine_class_instance *eci,
+	  int n_engines, int n_execs, int n_vm, unsigned int flags)
+{
+	struct drm_xe_sync sync[2] = {
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 2,
+		.syncs = to_user_pointer(&sync),
+	};
+	uint64_t addr[MAX_N_ENGINES];
+	uint32_t vm[MAX_N_ENGINES];
+	uint32_t engines[MAX_N_ENGINES];
+	uint32_t bind_engines[MAX_N_ENGINES];
+	uint32_t syncobjs[MAX_N_ENGINES];
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data;
+	int i, b;
+
+	igt_assert(n_engines <= MAX_N_ENGINES);
+	igt_assert(n_vm <= MAX_N_ENGINES);
+
+	for (i = 0; i < n_vm; ++i)
+		vm[i] = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	bo_size = sizeof(*data) * n_execs;
+	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
+			xe_get_default_alignment(fd));
+
+	addr[0] = 0x1a0000;
+	for (i = 1; i < MAX_N_ENGINES; ++i)
+		addr[i] = addr[i - 1] + (0x1ull << 32);
+
+	if (flags & USERPTR) {
+#define	MAP_ADDRESS	0x00007fadeadbe000
+		if (flags & INVALIDATE) {
+			data = mmap((void *)MAP_ADDRESS, bo_size, PROT_READ |
+				    PROT_WRITE, MAP_SHARED | MAP_FIXED |
+				    MAP_ANONYMOUS, -1, 0);
+			igt_assert(data != MAP_FAILED);
+		} else {
+			data = aligned_alloc(xe_get_default_alignment(fd), bo_size);
+			igt_assert(data);
+		}
+		memset(data, 0, bo_size);
+	} else {
+		if (flags & DEFER_ALLOC) {
+			bo = xe_bo_create_flags(fd, n_vm == 1 ? vm[0] : 0,
+						bo_size,
+						vram_if_possible(eci->gt_id) |
+						XE_GEM_CREATE_FLAG_DEFER_BACKING);
+		} else {
+			bo = xe_bo_create(fd, eci->gt_id, n_vm == 1 ? vm[0] : 0,
+					  bo_size);
+		}
+		if (!(flags & DEFER_BIND))
+			data = xe_bo_map(fd, bo, bo_size);
+	}
+
+	for (i = 0; i < n_engines; i++) {
+		uint32_t __vm = vm[i % n_vm];
+
+		engines[i] = xe_engine_create(fd, __vm, eci, 0);
+		if (flags & BIND_ENGINE)
+			bind_engines[i] = xe_bind_engine_create(fd, __vm, 0);
+		else
+			bind_engines[i] = 0;
+		syncobjs[i] = syncobj_create(fd, 0);
+	};
+
+	sync[0].handle = syncobj_create(fd, 0);
+	for (i = 0; i < n_vm; ++i) {
+		if (bo)
+			xe_vm_bind_async(fd, vm[i], bind_engines[i], bo, 0,
+					 addr[i], bo_size, sync, 1);
+		else
+			xe_vm_bind_userptr_async(fd, vm[i], bind_engines[i],
+						 to_user_pointer(data), addr[i],
+						 bo_size, sync, 1);
+	}
+
+	if (flags & DEFER_BIND)
+		data = xe_bo_map(fd, bo, bo_size);
+
+	for (i = 0; i < n_execs; i++) {
+		uint64_t __addr = addr[i % n_vm];
+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_addr = __addr + batch_offset;
+		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
+		uint64_t sdi_addr = __addr + sdi_offset;
+		int e = i % n_engines;
+
+		b = 0;
+		data[i].batch[b++] = MI_STORE_DWORD_IMM;
+		data[i].batch[b++] = sdi_addr;
+		data[i].batch[b++] = sdi_addr >> 32;
+		data[i].batch[b++] = 0xc0ffee;
+		data[i].batch[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+		sync[1].handle = syncobjs[e];
+
+		exec.engine_id = engines[e];
+		exec.address = batch_addr;
+		if (e != i)
+			 syncobj_reset(fd, &syncobjs[e], 1);
+		__xe_exec_assert(fd, &exec);
+
+		if (flags & REBIND && i + 1 != n_execs) {
+			uint32_t __vm = vm[i % n_vm];
+
+			sync[1].flags &= ~DRM_XE_SYNC_SIGNAL;
+			xe_vm_unbind_async(fd, __vm, bind_engines[e], 0,
+					   __addr, bo_size, sync + 1, 1);
+
+			sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+			addr[i % n_vm] += bo_size;
+			__addr = addr[i % n_vm];
+			if (bo)
+				xe_vm_bind_async(fd, __vm, bind_engines[e], bo,
+						 0, __addr, bo_size, sync, 1);
+			else
+				xe_vm_bind_userptr_async(fd, __vm,
+							 bind_engines[e],
+							 to_user_pointer(data),
+							 __addr, bo_size, sync,
+							 1);
+		}
+
+		if (flags & INVALIDATE && i + 1 != n_execs) {
+			if (!(flags & RACE)) {
+				/*
+				 * Wait for exec completion and check data as
+				 * userptr will likely change to different
+				 * physical memory on next mmap call triggering
+				 * an invalidate.
+				 */
+				igt_assert(syncobj_wait(fd, &syncobjs[e], 1,
+							INT64_MAX, 0, NULL));
+				igt_assert_eq(data[i].data, 0xc0ffee);
+			} else if (i * 2 != n_execs) {
+				/*
+				 * We issue 1 mmap which races against running
+				 * jobs. No real check here aside from this test
+				 * not faulting on the GPU.
+				 */
+				continue;
+			}
+
+			data = mmap((void *)MAP_ADDRESS, bo_size, PROT_READ |
+				    PROT_WRITE, MAP_SHARED | MAP_FIXED |
+				    MAP_ANONYMOUS, -1, 0);
+			igt_assert(data != MAP_FAILED);
+		}
+	}
+
+	for (i = 0; i < n_engines && n_execs; i++)
+		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
+					NULL));
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+	for (i = 0; i < n_vm; ++i) {
+		syncobj_reset(fd, &sync[0].handle, 1);
+		xe_vm_unbind_async(fd, vm[i], bind_engines[i], 0, addr[i],
+				   bo_size, sync, 1);
+		igt_assert(syncobj_wait(fd, &sync[0].handle, 1,
+					INT64_MAX, 0, NULL));
+	}
+
+	for (i = (flags & INVALIDATE && n_execs) ? n_execs - 1 : 0;
+	     i < n_execs; i++)
+		igt_assert_eq(data[i].data, 0xc0ffee);
+
+	syncobj_destroy(fd, sync[0].handle);
+	for (i = 0; i < n_engines; i++) {
+		syncobj_destroy(fd, syncobjs[i]);
+		xe_engine_destroy(fd, engines[i]);
+		if (bind_engines[i])
+			xe_engine_destroy(fd, bind_engines[i]);
+	}
+
+	if (bo) {
+		munmap(data, bo_size);
+		gem_close(fd, bo);
+	} else if (!(flags & INVALIDATE)) {
+		free(data);
+	}
+	for (i = 0; i < n_vm; ++i)
+		xe_vm_destroy(fd, vm[i]);
+}
+
+igt_main
+{
+	struct drm_xe_engine_class_instance *hwe;
+	const struct section {
+		const char *name;
+		unsigned int flags;
+	} sections[] = {
+		{ "basic", 0 },
+		{ "basic-defer-mmap", DEFER_ALLOC },
+		{ "basic-defer-bind", DEFER_ALLOC | DEFER_BIND },
+		{ "userptr", USERPTR },
+		{ "rebind", REBIND },
+		{ "userptr-rebind", USERPTR | REBIND },
+		{ "userptr-invalidate", USERPTR | INVALIDATE },
+		{ "userptr-invalidate-race", USERPTR | INVALIDATE | RACE },
+		{ "bindengine", BIND_ENGINE },
+		{ "bindengine-userptr", BIND_ENGINE | USERPTR },
+		{ "bindengine-rebind", BIND_ENGINE | REBIND },
+		{ "bindengine-userptr-rebind", BIND_ENGINE | USERPTR | REBIND },
+		{ "bindengine-userptr-invalidate", BIND_ENGINE | USERPTR |
+			INVALIDATE },
+		{ "bindengine-userptr-invalidate-race", BIND_ENGINE | USERPTR |
+			INVALIDATE | RACE },
+		{ NULL },
+	};
+	int fd;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		xe_query_all(fd);
+	}
+
+	for (const struct section *s = sections; s->name; s++) {
+		igt_subtest_f("once-%s", s->name)
+			for_each_hw_engine(hwe)
+				test_exec(fd, hwe, 1, 1, 1, s->flags);
+
+		igt_subtest_f("twice-%s", s->name)
+			for_each_hw_engine(hwe)
+				test_exec(fd, hwe, 1, 2, 1, s->flags);
+
+		igt_subtest_f("many-%s", s->name)
+			for_each_hw_engine(hwe)
+				test_exec(fd, hwe, 1,
+					  s->flags & (REBIND | INVALIDATE) ?
+					  64 : 1024, 1,
+					  s->flags);
+
+		igt_subtest_f("many-engines-%s", s->name)
+			for_each_hw_engine(hwe)
+				test_exec(fd, hwe, 16,
+					  s->flags & (REBIND | INVALIDATE) ?
+					  64 : 1024, 1,
+					  s->flags);
+
+		igt_subtest_f("many-engines-many-vm-%s", s->name)
+			for_each_hw_engine(hwe)
+				test_exec(fd, hwe, 16,
+					  s->flags & (REBIND | INVALIDATE) ?
+					  64 : 1024, 16,
+					  s->flags);
+
+		igt_subtest_f("no-exec-%s", s->name)
+			for_each_hw_engine(hwe)
+				test_exec(fd, hwe, 1, 0, 1, s->flags);
+	}
+
+	igt_fixture
+		close(fd);
+}
diff --git a/tests/xe/xe_exec_compute_mode.c b/tests/xe/xe_exec_compute_mode.c
new file mode 100644
index 00000000..a264f523
--- /dev/null
+++ b/tests/xe/xe_exec_compute_mode.c
@@ -0,0 +1,303 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include <fcntl.h>
+
+#include "igt.h"
+#include "lib/igt_syncobj.h"
+#include "lib/intel_reg.h"
+#include "xe_drm.h"
+
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include <string.h>
+
+#define MAX_N_ENGINES 16
+#define USERPTR		(0x1 << 0)
+#define REBIND		(0x1 << 1)
+#define INVALIDATE	(0x1 << 2)
+#define RACE		(0x1 << 3)
+#define BIND_ENGINE	(0x1 << 4)
+#define VM_FOR_BO	(0x1 << 5)
+#define ENGINE_EARLY	(0x1 << 6)
+
+static void
+test_exec(int fd, struct drm_xe_engine_class_instance *eci,
+	  int n_engines, int n_execs, unsigned int flags)
+{
+	uint32_t vm;
+	uint64_t addr = 0x1a0000;
+#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
+	struct drm_xe_sync sync[1] = {
+		{ .flags = DRM_XE_SYNC_USER_FENCE | DRM_XE_SYNC_SIGNAL,
+	          .timeline_value = USER_FENCE_VALUE },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync),
+	};
+	uint32_t engines[MAX_N_ENGINES];
+	uint32_t bind_engines[MAX_N_ENGINES];
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint64_t vm_sync;
+		uint64_t exec_sync;
+		uint32_t data;
+	} *data;
+	int i, j, b;
+	int map_fd = -1;
+
+	igt_assert(n_engines <= MAX_N_ENGINES);
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
+			  DRM_XE_VM_CREATE_COMPUTE_MODE, 0);
+	bo_size = sizeof(*data) * n_execs;
+	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
+			xe_get_default_alignment(fd));
+
+	for (i = 0; (flags & ENGINE_EARLY) && i < n_engines; i++) {
+		struct drm_xe_ext_engine_set_property ext = {
+			.base.next_extension = 0,
+			.base.name = XE_ENGINE_EXTENSION_SET_PROPERTY,
+			.property = XE_ENGINE_PROPERTY_COMPUTE_MODE,
+			.value = 1,
+		};
+
+		engines[i] = xe_engine_create(fd, vm, eci,
+					      to_user_pointer(&ext));
+		if (flags & BIND_ENGINE)
+			bind_engines[i] =
+				xe_bind_engine_create(fd, vm, 0);
+		else
+			bind_engines[i] = 0;
+	};
+
+	if (flags & USERPTR) {
+#define	MAP_ADDRESS	0x00007fadeadbe000
+		if (flags & INVALIDATE) {
+			data = mmap((void *)MAP_ADDRESS, bo_size, PROT_READ |
+				    PROT_WRITE, MAP_SHARED | MAP_FIXED |
+				    MAP_ANONYMOUS, -1, 0);
+			igt_assert(data != MAP_FAILED);
+		} else {
+			data = aligned_alloc(xe_get_default_alignment(fd),
+					     bo_size);
+			igt_assert(data);
+		}
+	} else {
+		bo = xe_bo_create(fd, eci->gt_id, flags & VM_FOR_BO ? vm : 0,
+				  bo_size);
+		data = xe_bo_map(fd, bo, bo_size);
+	}
+	memset(data, 0, bo_size);
+
+	for (i = 0; !(flags & ENGINE_EARLY) && i < n_engines; i++) {
+		struct drm_xe_ext_engine_set_property ext = {
+			.base.next_extension = 0,
+			.base.name = XE_ENGINE_EXTENSION_SET_PROPERTY,
+			.property = XE_ENGINE_PROPERTY_COMPUTE_MODE,
+			.value = 1,
+		};
+
+		engines[i] = xe_engine_create(fd, vm, eci,
+					      to_user_pointer(&ext));
+		if (flags & BIND_ENGINE)
+			bind_engines[i] =
+				xe_bind_engine_create(fd, vm, 0);
+		else
+			bind_engines[i] = 0;
+	};
+
+	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	if (bo)
+		xe_vm_bind_async(fd, vm, bind_engines[0], bo, 0, addr,
+				 bo_size, sync, 1);
+	else
+		xe_vm_bind_userptr_async(fd, vm, bind_engines[0],
+					 to_user_pointer(data), addr,
+					 bo_size, sync, 1);
+#define ONE_SEC	1000
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, ONE_SEC);
+	data[0].vm_sync = 0;
+
+	for (i = 0; i < n_execs; i++) {
+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_addr = addr + batch_offset;
+		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
+		uint64_t sdi_addr = addr + sdi_offset;
+		int e = i % n_engines;
+
+		b = 0;
+		data[i].batch[b++] = MI_STORE_DWORD_IMM;
+		data[i].batch[b++] = sdi_addr;
+		data[i].batch[b++] = sdi_addr >> 32;
+		data[i].batch[b++] = 0xc0ffee;
+		data[i].batch[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+		sync[0].addr = addr + (char *)&data[i].exec_sync - (char *)data;
+
+		exec.engine_id = engines[e];
+		exec.address = batch_addr;
+		__xe_exec_assert(fd, &exec);
+
+		if (flags & REBIND && i + 1 != n_execs) {
+			xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
+				       NULL, ONE_SEC);
+			xe_vm_unbind_async(fd, vm, bind_engines[e], 0,
+					   addr, bo_size, NULL, 0);
+
+			sync[0].addr = to_user_pointer(&data[0].vm_sync);
+			addr += bo_size;
+			if (bo)
+				xe_vm_bind_async(fd, vm, bind_engines[e], bo,
+						 0, addr, bo_size, sync, 1);
+			else
+				xe_vm_bind_userptr_async(fd, vm,
+							 bind_engines[e],
+							 to_user_pointer(data),
+							 addr, bo_size, sync,
+							 1);
+			xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
+				       NULL, ONE_SEC);
+			data[0].vm_sync = 0;
+		}
+
+		if (flags & INVALIDATE && i + 1 != n_execs) {
+			if (!(flags & RACE)) {
+				/*
+				 * Wait for exec completion and check data as
+				 * userptr will likely change to different
+				 * physical memory on next mmap call triggering
+				 * an invalidate.
+				 */
+				xe_wait_ufence(fd, &data[i].exec_sync,
+					       USER_FENCE_VALUE, NULL, ONE_SEC);
+				igt_assert_eq(data[i].data, 0xc0ffee);
+			} else if (i * 2 != n_execs) {
+				/*
+				 * We issue 1 mmap which races against running
+				 * jobs. No real check here aside from this test
+				 * not faulting on the GPU.
+				 */
+				continue;
+			}
+
+			if (flags & RACE) {
+				map_fd = open("/tmp", O_TMPFILE | O_RDWR,
+					      0x666);
+				write(map_fd, data, bo_size);
+				data = mmap((void *)MAP_ADDRESS, bo_size,
+					    PROT_READ | PROT_WRITE, MAP_SHARED |
+					    MAP_FIXED, map_fd, 0);
+			} else {
+				data = mmap((void *)MAP_ADDRESS, bo_size,
+					    PROT_READ | PROT_WRITE, MAP_SHARED |
+					    MAP_FIXED | MAP_ANONYMOUS, -1, 0);
+			}
+			igt_assert(data != MAP_FAILED);
+		}
+	}
+
+	j = flags & INVALIDATE ? n_execs - 1 : 0;
+	for (i = j; i < n_execs; i++)
+		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE, NULL,
+			       ONE_SEC);
+
+	/* Wait for all execs to complete */
+	if (flags & INVALIDATE)
+		usleep(250000);
+
+	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	xe_vm_unbind_async(fd, vm, bind_engines[0], 0, addr, bo_size,
+			   sync, 1);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, ONE_SEC);
+
+	for (i = j; i < n_execs; i++)
+		igt_assert_eq(data[i].data, 0xc0ffee);
+
+	for (i = 0; i < n_engines; i++) {
+		xe_engine_destroy(fd, engines[i]);
+		if (bind_engines[i])
+			xe_engine_destroy(fd, bind_engines[i]);
+	}
+
+	if (bo) {
+		munmap(data, bo_size);
+		gem_close(fd, bo);
+	} else if (!(flags & INVALIDATE)) {
+		free(data);
+	}
+	xe_vm_destroy(fd, vm);
+	if (map_fd != -1)
+		close(map_fd);
+}
+
+igt_main
+{
+	struct drm_xe_engine_class_instance *hwe;
+	const struct section {
+		const char *name;
+		unsigned int flags;
+	} sections[] = {
+		{ "basic", 0 },
+		{ "preempt-fence-early", VM_FOR_BO | ENGINE_EARLY },
+		{ "userptr", USERPTR },
+		{ "rebind", REBIND },
+		{ "userptr-rebind", USERPTR | REBIND },
+		{ "userptr-invalidate", USERPTR | INVALIDATE },
+		{ "userptr-invalidate-race", USERPTR | INVALIDATE | RACE },
+		{ "bindengine", BIND_ENGINE },
+		{ "bindengine-userptr", BIND_ENGINE | USERPTR },
+		{ "bindengine-rebind",  BIND_ENGINE | REBIND },
+		{ "bindengine-userptr-rebind",  BIND_ENGINE | USERPTR |
+			REBIND },
+		{ "bindengine-userptr-invalidate",  BIND_ENGINE | USERPTR |
+			INVALIDATE },
+		{ "bindengine-userptr-invalidate-race", BIND_ENGINE | USERPTR |
+			INVALIDATE | RACE },
+		{ NULL },
+	};
+	int fd;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		xe_query_all(fd);
+	}
+
+	for (const struct section *s = sections; s->name; s++) {
+		igt_subtest_f("once-%s", s->name)
+			for_each_hw_engine(hwe)
+				test_exec(fd, hwe, 1, 1, s->flags);
+
+		igt_subtest_f("twice-%s", s->name)
+			for_each_hw_engine(hwe)
+				test_exec(fd, hwe, 1, 2, s->flags);
+
+		igt_subtest_f("many-%s", s->name)
+			for_each_hw_engine(hwe)
+				test_exec(fd, hwe, 1,
+					  s->flags & (REBIND | INVALIDATE) ?
+					  64 : 128,
+					  s->flags);
+
+		if (s->flags & RACE)
+			continue;
+
+		igt_subtest_f("many-engines-%s", s->name)
+			for_each_hw_engine(hwe)
+				test_exec(fd, hwe, 16,
+					  s->flags & (REBIND | INVALIDATE) ?
+					  64 : 128,
+					  s->flags);
+	}
+
+	igt_fixture
+		close(fd);
+}
diff --git a/tests/xe/xe_exec_fault_mode.c b/tests/xe/xe_exec_fault_mode.c
new file mode 100644
index 00000000..440f8397
--- /dev/null
+++ b/tests/xe/xe_exec_fault_mode.c
@@ -0,0 +1,471 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include <fcntl.h>
+
+#include "igt.h"
+#include "lib/igt_syncobj.h"
+#include "lib/intel_reg.h"
+#include "xe_drm.h"
+
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include <string.h>
+
+#define MAX_N_ENGINES 16
+#define USERPTR		(0x1 << 0)
+#define REBIND		(0x1 << 1)
+#define INVALIDATE	(0x1 << 2)
+#define RACE		(0x1 << 3)
+#define BIND_ENGINE	(0x1 << 4)
+#define WAIT_ATOMIC	(0x1 << 5)
+#define IMMEDIATE	(0x1 << 6)
+#define PREFETCH	(0x1 << 7)
+#define INVALID_FAULT	(0x1 << 8)
+
+static void
+test_exec(int fd, struct drm_xe_engine_class_instance *eci,
+	  int n_engines, int n_execs, unsigned int flags)
+{
+	uint32_t vm;
+	uint64_t addr = 0x1a0000;
+#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
+	struct drm_xe_sync sync[1] = {
+		{ .flags = DRM_XE_SYNC_USER_FENCE | DRM_XE_SYNC_SIGNAL,
+	          .timeline_value = USER_FENCE_VALUE },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync),
+	};
+	uint32_t engines[MAX_N_ENGINES];
+	uint32_t bind_engines[MAX_N_ENGINES];
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint64_t vm_sync;
+		uint64_t exec_sync;
+		uint32_t data;
+	} *data;
+	int i, j, b;
+	int map_fd = -1;
+
+	igt_assert(n_engines <= MAX_N_ENGINES);
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
+			  DRM_XE_VM_CREATE_FAULT_MODE, 0);
+	bo_size = sizeof(*data) * n_execs;
+	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
+			xe_get_default_alignment(fd));
+
+	if (flags & USERPTR) {
+#define	MAP_ADDRESS	0x00007fadeadbe000
+		if (flags & INVALIDATE) {
+			data = mmap((void *)MAP_ADDRESS, bo_size, PROT_READ |
+				    PROT_WRITE, MAP_SHARED | MAP_FIXED |
+				    MAP_ANONYMOUS, -1, 0);
+			igt_assert(data != MAP_FAILED);
+		} else {
+			data = aligned_alloc(xe_get_default_alignment(fd),
+					     bo_size);
+			igt_assert(data);
+		}
+	} else {
+		if (flags & PREFETCH)
+			bo = xe_bo_create_flags(fd, 0, bo_size,
+						all_memory_regions());
+		else
+			bo = xe_bo_create(fd, eci->gt_id, 0, bo_size);
+		data = xe_bo_map(fd, bo, bo_size);
+	}
+	memset(data, 0, bo_size);
+
+	for (i = 0; i < n_engines; i++) {
+		engines[i] = xe_engine_create(fd, vm, eci, 0);
+		if (flags & BIND_ENGINE)
+			bind_engines[i] =
+				xe_bind_engine_create(fd, vm, 0);
+		else
+			bind_engines[i] = 0;
+	};
+
+	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	if (flags & IMMEDIATE) {
+		if (bo)
+			xe_vm_bind_async_flags(fd, vm, bind_engines[0], bo, 0,
+					       addr, bo_size, sync, 1,
+					       XE_VM_BIND_FLAG_IMMEDIATE);
+		else
+			xe_vm_bind_userptr_async_flags(fd, vm, bind_engines[0],
+						       to_user_pointer(data),
+						       addr, bo_size, sync, 1,
+						       XE_VM_BIND_FLAG_IMMEDIATE);
+	} else {
+		if (bo)
+			xe_vm_bind_async(fd, vm, bind_engines[0], bo, 0, addr,
+					 bo_size, sync, 1);
+		else
+			xe_vm_bind_userptr_async(fd, vm, bind_engines[0],
+						 to_user_pointer(data), addr,
+						 bo_size, sync, 1);
+	}
+
+#define ONE_SEC	1000
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, ONE_SEC);
+	data[0].vm_sync = 0;
+
+	if (flags & PREFETCH) {
+		/* Should move to system memory */
+		xe_vm_prefetch_async(fd, vm, bind_engines[0], 0, addr,
+				     bo_size, sync, 1, 0);
+		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL,
+			       ONE_SEC);
+		data[0].vm_sync = 0;
+	}
+
+	for (i = 0; i < n_execs; i++) {
+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_addr = addr + batch_offset;
+		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
+		uint64_t sdi_addr = addr + sdi_offset;
+		int e = i % n_engines;
+
+		b = 0;
+		data[i].batch[b++] = MI_STORE_DWORD_IMM;
+		data[i].batch[b++] = sdi_addr;
+		data[i].batch[b++] = sdi_addr >> 32;
+		data[i].batch[b++] = 0xc0ffee;
+		data[i].batch[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+		sync[0].addr = addr + (char *)&data[i].exec_sync - (char *)data;
+
+		exec.engine_id = engines[e];
+		exec.address = batch_addr;
+		__xe_exec_assert(fd, &exec);
+
+		if (flags & REBIND && i + 1 != n_execs) {
+			xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
+				       NULL, ONE_SEC);
+			xe_vm_unbind_async(fd, vm, bind_engines[e], 0,
+					   addr, bo_size, NULL, 0);
+
+			sync[0].addr = to_user_pointer(&data[0].vm_sync);
+			addr += bo_size;
+			if (bo)
+				xe_vm_bind_async(fd, vm, bind_engines[e], bo,
+						 0, addr, bo_size, sync, 1);
+			else
+				xe_vm_bind_userptr_async(fd, vm,
+							 bind_engines[e],
+							 to_user_pointer(data),
+							 addr, bo_size, sync,
+							 1);
+			xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
+				       NULL, ONE_SEC);
+			data[0].vm_sync = 0;
+		}
+
+		if (flags & INVALIDATE && i + 1 != n_execs) {
+			if (!(flags & RACE)) {
+				/*
+				 * Wait for exec completion and check data as
+				 * userptr will likely change to different
+				 * physical memory on next mmap call triggering
+				 * an invalidate.
+				 */
+				xe_wait_ufence(fd, &data[i].exec_sync,
+					       USER_FENCE_VALUE, NULL, ONE_SEC);
+				igt_assert_eq(data[i].data, 0xc0ffee);
+			} else if (i * 2 != n_execs) {
+				/*
+				 * We issue 1 mmap which races against running
+				 * jobs. No real check here aside from this test
+				 * not faulting on the GPU.
+				 */
+				continue;
+			}
+
+			if (flags & RACE) {
+				map_fd = open("/tmp", O_TMPFILE | O_RDWR,
+					      0x666);
+				write(map_fd, data, bo_size);
+				data = mmap((void *)MAP_ADDRESS, bo_size,
+					    PROT_READ | PROT_WRITE, MAP_SHARED |
+					    MAP_FIXED, map_fd, 0);
+			} else {
+				data = mmap((void *)MAP_ADDRESS, bo_size,
+					    PROT_READ | PROT_WRITE, MAP_SHARED |
+					    MAP_FIXED | MAP_ANONYMOUS, -1, 0);
+			}
+			igt_assert(data != MAP_FAILED);
+		}
+	}
+
+	if (!(flags & INVALID_FAULT)) {
+		j = flags & INVALIDATE ? n_execs - 1 : 0;
+		for (i = j; i < n_execs; i++)
+			xe_wait_ufence(fd, &data[i].exec_sync,
+				       USER_FENCE_VALUE, NULL, ONE_SEC);
+	}
+
+	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	xe_vm_unbind_async(fd, vm, bind_engines[0], 0, addr, bo_size,
+			   sync, 1);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, ONE_SEC);
+
+	if (!(flags & INVALID_FAULT)) {
+		for (i = j; i < n_execs; i++)
+			igt_assert_eq(data[i].data, 0xc0ffee);
+	}
+
+	for (i = 0; i < n_engines; i++) {
+		xe_engine_destroy(fd, engines[i]);
+		if (bind_engines[i])
+			xe_engine_destroy(fd, bind_engines[i]);
+	}
+
+	if (bo) {
+		munmap(data, bo_size);
+		gem_close(fd, bo);
+	} else if (!(flags & INVALIDATE)) {
+		free(data);
+	}
+	xe_vm_destroy(fd, vm);
+	if (map_fd != -1)
+		close(map_fd);
+}
+
+#define   MI_ATOMIC_INLINE_DATA         (1 << 18)
+#define   MI_ATOMIC_ADD                 (0x7 << 8)
+
+static void
+test_atomic(int fd, struct drm_xe_engine_class_instance *eci,
+	    int n_atomic, unsigned int flags)
+{
+	uint32_t vm;
+	uint64_t addr = 0x1a0000, addr_wait;
+#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
+	struct drm_xe_sync sync[1] = {
+		{ .flags = DRM_XE_SYNC_USER_FENCE | DRM_XE_SYNC_SIGNAL,
+	          .timeline_value = USER_FENCE_VALUE },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync),
+	};
+	uint32_t engine;
+	size_t bo_size;
+	uint32_t bo, bo_wait;
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint64_t vm_sync;
+		uint64_t exec_sync;
+		uint32_t data;
+	} *data;
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint64_t vm_sync;
+		uint64_t exec_sync;
+		uint32_t data;
+	} *wait;
+	uint32_t *ptr;
+	int i, b, wait_idx = 0;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
+			  DRM_XE_VM_CREATE_FAULT_MODE, 0);
+	bo_size = sizeof(*data) * n_atomic;
+	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
+			xe_get_default_alignment(fd));
+	addr_wait = addr + bo_size;
+
+	bo = xe_bo_create_flags(fd, vm, bo_size,
+				all_memory_regions());
+	bo_wait = xe_bo_create(fd, eci->gt_id, vm, bo_size);
+	data = xe_bo_map(fd, bo, bo_size);
+	wait = xe_bo_map(fd, bo_wait, bo_size);
+	ptr = &data[0].data;
+	memset(data, 0, bo_size);
+	memset(wait, 0, bo_size);
+
+	engine = xe_engine_create(fd, vm, eci, 0);
+
+	sync[0].addr = to_user_pointer(&wait[wait_idx].vm_sync);
+	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
+	xe_wait_ufence(fd, &wait[wait_idx++].vm_sync, USER_FENCE_VALUE, NULL,
+		       ONE_SEC);
+
+	sync[0].addr = to_user_pointer(&wait[wait_idx].vm_sync);
+	xe_vm_bind_async(fd, vm, 0, bo_wait, 0, addr_wait, bo_size, sync, 1);
+	xe_wait_ufence(fd, &wait[wait_idx++].vm_sync, USER_FENCE_VALUE, NULL,
+		       ONE_SEC);
+
+	xe_vm_madvise(fd, vm, addr, bo_size, DRM_XE_VM_MADVISE_CPU_ATOMIC, 1);
+	xe_vm_madvise(fd, vm, addr, bo_size, DRM_XE_VM_MADVISE_DEVICE_ATOMIC, 1);
+
+	for (i = 0; i < n_atomic; i++) {
+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_addr = addr + batch_offset;
+		uint64_t sdi_offset = (char *)&data[0].data - (char *)data;
+		uint64_t sdi_addr = addr + sdi_offset;
+
+		b = 0;
+		data[i].batch[b++] = MI_ATOMIC | MI_ATOMIC_INLINE_DATA |
+			MI_ATOMIC_ADD;
+		data[i].batch[b++] = sdi_addr;
+		data[i].batch[b++] = sdi_addr >> 32;
+		data[i].batch[b++] = 1;
+		data[i].batch[b++] = MI_BATCH_BUFFER_END;
+
+		sync[0].addr = addr_wait +
+			(char *)&wait[i].exec_sync - (char *)wait;
+
+		exec.engine_id = engine;
+		exec.address = batch_addr;
+		__xe_exec_assert(fd, &exec);
+
+		if (flags & WAIT_ATOMIC)
+			xe_wait_ufence(fd, &wait[i].exec_sync, USER_FENCE_VALUE,
+				       NULL, ONE_SEC);
+		__atomic_add_fetch(ptr, 1, __ATOMIC_SEQ_CST);
+	}
+
+	xe_wait_ufence(fd, &wait[n_atomic - 1].exec_sync, USER_FENCE_VALUE,
+		       NULL, ONE_SEC);
+	igt_assert(*ptr == n_atomic * 2);
+
+	sync[0].addr = to_user_pointer(&wait[wait_idx].vm_sync);
+	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
+	xe_wait_ufence(fd, &wait[wait_idx++].vm_sync, USER_FENCE_VALUE, NULL,
+		       ONE_SEC);
+
+	sync[0].addr = to_user_pointer(&wait[wait_idx].vm_sync);
+	xe_vm_unbind_async(fd, vm, 0, 0, addr_wait, bo_size, sync, 1);
+	xe_wait_ufence(fd, &wait[wait_idx++].vm_sync, USER_FENCE_VALUE, NULL,
+		       ONE_SEC);
+
+	xe_engine_destroy(fd, engine);
+	munmap(data, bo_size);
+	munmap(wait, bo_size);
+	gem_close(fd, bo);
+	gem_close(fd, bo_wait);
+	xe_vm_destroy(fd, vm);
+}
+
+igt_main
+{
+	struct drm_xe_engine_class_instance *hwe;
+	const struct section {
+		const char *name;
+		unsigned int flags;
+	} sections[] = {
+		{ "basic", 0 },
+		{ "userptr", USERPTR },
+		{ "rebind", REBIND },
+		{ "userptr-rebind", USERPTR | REBIND },
+		{ "userptr-invalidate", USERPTR | INVALIDATE },
+		{ "userptr-invalidate-race", USERPTR | INVALIDATE | RACE },
+		{ "bindengine", BIND_ENGINE },
+		{ "bindengine-userptr", BIND_ENGINE | USERPTR },
+		{ "bindengine-rebind",  BIND_ENGINE | REBIND },
+		{ "bindengine-userptr-rebind", BIND_ENGINE | USERPTR |
+			REBIND },
+		{ "bindengine-userptr-invalidate", BIND_ENGINE | USERPTR |
+			INVALIDATE },
+		{ "bindengine-userptr-invalidate-race", BIND_ENGINE | USERPTR |
+			INVALIDATE | RACE },
+		{ "basic-imm", IMMEDIATE },
+		{ "userptr-imm", IMMEDIATE | USERPTR },
+		{ "rebind-imm", IMMEDIATE | REBIND },
+		{ "userptr-rebind-imm", IMMEDIATE | USERPTR | REBIND },
+		{ "userptr-invalidate-imm", IMMEDIATE | USERPTR | INVALIDATE },
+		{ "userptr-invalidate-race-imm", IMMEDIATE | USERPTR |
+			INVALIDATE | RACE },
+		{ "bindengine-imm", IMMEDIATE | BIND_ENGINE },
+		{ "bindengine-userptr-imm", IMMEDIATE | BIND_ENGINE | USERPTR },
+		{ "bindengine-rebind-imm", IMMEDIATE | BIND_ENGINE | REBIND },
+		{ "bindengine-userptr-rebind-imm", IMMEDIATE | BIND_ENGINE |
+			USERPTR | REBIND },
+		{ "bindengine-userptr-invalidate-imm", IMMEDIATE | BIND_ENGINE |
+			USERPTR | INVALIDATE },
+		{ "bindengine-userptr-invalidate-race-imm", IMMEDIATE |
+			BIND_ENGINE | USERPTR | INVALIDATE | RACE },
+		{ "basic-prefetch", PREFETCH },
+		{ "userptr-prefetch", PREFETCH | USERPTR },
+		{ "rebind-prefetch", PREFETCH | REBIND },
+		{ "userptr-rebind-prefetch", PREFETCH | USERPTR | REBIND },
+		{ "userptr-invalidate-prefetch", PREFETCH | USERPTR | INVALIDATE },
+		{ "userptr-invalidate-race-prefetch", PREFETCH | USERPTR |
+			INVALIDATE | RACE },
+		{ "bindengine-prefetch", PREFETCH | BIND_ENGINE },
+		{ "bindengine-userptr-prefetch", PREFETCH | BIND_ENGINE | USERPTR },
+		{ "bindengine-rebind-prefetch", PREFETCH | BIND_ENGINE | REBIND },
+		{ "bindengine-userptr-rebind-prefetch", PREFETCH | BIND_ENGINE |
+			USERPTR | REBIND },
+		{ "bindengine-userptr-invalidate-prefetch", PREFETCH | BIND_ENGINE |
+			USERPTR | INVALIDATE },
+		{ "bindengine-userptr-invalidate-race-prefetch", PREFETCH |
+			BIND_ENGINE | USERPTR | INVALIDATE | RACE },
+		{ "invalid-fault", INVALID_FAULT },
+		{ "invalid-userptr-fault", INVALID_FAULT | USERPTR },
+		{ NULL },
+	};
+	int fd;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		xe_query_all(fd);
+		igt_require(xe_supports_faults(fd));
+	}
+
+	for (const struct section *s = sections; s->name; s++) {
+		igt_subtest_f("once-%s", s->name)
+			for_each_hw_engine(hwe)
+				test_exec(fd, hwe, 1, 1, s->flags);
+
+		igt_subtest_f("twice-%s", s->name)
+			for_each_hw_engine(hwe)
+				test_exec(fd, hwe, 1, 2, s->flags);
+
+		igt_subtest_f("many-%s", s->name)
+			for_each_hw_engine(hwe)
+				test_exec(fd, hwe, 1,
+					  s->flags & (REBIND | INVALIDATE) ?
+					  64 : 128,
+					  s->flags);
+
+		igt_subtest_f("many-engines-%s", s->name)
+			for_each_hw_engine(hwe)
+				test_exec(fd, hwe, 16,
+					  s->flags & (REBIND | INVALIDATE) ?
+					  64 : 128,
+					  s->flags);
+	}
+
+	igt_subtest("atomic-once")
+		for_each_hw_engine(hwe)
+			test_atomic(fd, hwe, 1, 0);
+
+	igt_subtest("atomic-once-wait")
+		for_each_hw_engine(hwe)
+			test_atomic(fd, hwe, 1, WAIT_ATOMIC);
+
+	igt_subtest("atomic-many")
+		for_each_hw_engine(hwe)
+			test_atomic(fd, hwe, 8, 0);
+
+	igt_subtest("atomic-many-wait")
+		for_each_hw_engine(hwe)
+			test_atomic(fd, hwe, 8, WAIT_ATOMIC);
+
+	igt_fixture
+		close(fd);
+}
diff --git a/tests/xe/xe_exec_reset.c b/tests/xe/xe_exec_reset.c
new file mode 100644
index 00000000..96ce5bb7
--- /dev/null
+++ b/tests/xe/xe_exec_reset.c
@@ -0,0 +1,806 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include "igt.h"
+#include "lib/igt_syncobj.h"
+#include "lib/intel_reg.h"
+#include "xe_drm.h"
+
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include "xe/xe_spin.h"
+#include <string.h>
+
+static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
+{
+	uint32_t vm;
+	uint64_t addr = 0x1a0000;
+	struct drm_xe_sync sync[2] = {
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 2,
+		.syncs = to_user_pointer(&sync),
+	};
+	uint32_t engine;
+	uint32_t syncobj;
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct xe_spin *spin;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	bo_size = sizeof(*spin);
+	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
+			xe_get_default_alignment(fd));
+
+	bo = xe_bo_create(fd, eci->gt_id, vm, bo_size);
+	spin = xe_bo_map(fd, bo, bo_size);
+
+	engine = xe_engine_create(fd, vm, eci, 0);
+	syncobj = syncobj_create(fd, 0);
+
+	sync[0].handle = syncobj_create(fd, 0);
+	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
+
+	xe_spin_init(spin, addr, false);
+
+	sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+	sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+	sync[1].handle = syncobj;
+
+	exec.engine_id = engine;
+	exec.address = addr;
+	__xe_exec_assert(fd, &exec);
+
+	xe_spin_wait_started(spin);
+	usleep(50000);
+	igt_assert(!syncobj_wait(fd, &syncobj, 1, 1, 0, NULL));
+	xe_spin_end(spin);
+
+	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	syncobj_destroy(fd, sync[0].handle);
+	syncobj_destroy(fd, syncobj);
+	xe_engine_destroy(fd, engine);
+
+	munmap(spin, bo_size);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
+#define MAX_N_ENGINES 16
+#define MAX_INSTANCE 9
+#define CANCEL		(0x1 << 0)
+#define ENGINE_RESET	(0x1 << 1)
+#define GT_RESET	(0x1 << 2)
+#define CLOSE_FD	(0x1 << 3)
+#define CLOSE_ENGINES	(0x1 << 4)
+#define VIRTUAL		(0x1 << 5)
+#define PARALLEL	(0x1 << 6)
+#define CAT_ERROR	(0x1 << 7)
+
+static void
+test_balancer(int fd, int gt, int class, int n_engines, int n_execs,
+	      unsigned int flags)
+{
+	uint32_t vm;
+	uint64_t addr = 0x1a0000;
+	struct drm_xe_sync sync[2] = {
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+	};
+	struct drm_xe_exec exec = {
+		.num_syncs = 2,
+		.syncs = to_user_pointer(&sync),
+	};
+	uint32_t engines[MAX_N_ENGINES];
+	uint32_t syncobjs[MAX_N_ENGINES];
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct {
+		struct xe_spin spin;
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data;
+	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
+	int i, j, b, num_placements = 0, bad_batches = 1;
+
+	igt_assert(n_engines <= MAX_N_ENGINES);
+
+	if (flags & CLOSE_FD)
+		fd = drm_open_driver(DRIVER_XE);
+
+	for_each_hw_engine(hwe) {
+		if (hwe->engine_class != class || hwe->gt_id != gt)
+			continue;
+
+		eci[num_placements++] = *hwe;
+	}
+	if (num_placements < 2)
+		return;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	bo_size = sizeof(*data) * n_execs;
+	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
+			xe_get_default_alignment(fd));
+
+	bo = xe_bo_create(fd, gt, vm, bo_size);
+	data = xe_bo_map(fd, bo, bo_size);
+
+	for (i = 0; i < n_engines; i++) {
+		struct drm_xe_ext_engine_set_property job_timeout = {
+			.base.next_extension = 0,
+			.base.name = XE_ENGINE_EXTENSION_SET_PROPERTY,
+			.property = XE_ENGINE_PROPERTY_JOB_TIMEOUT,
+			.value = 50,
+		};
+		struct drm_xe_ext_engine_set_property preempt_timeout = {
+			.base.next_extension = 0,
+			.base.name = XE_ENGINE_EXTENSION_SET_PROPERTY,
+			.property = XE_ENGINE_PROPERTY_PREEMPTION_TIMEOUT,
+			.value = 1000,
+		};
+		struct drm_xe_engine_create create = {
+			.vm_id = vm,
+			.width = flags & PARALLEL ? num_placements : 1,
+			.num_placements = flags & PARALLEL ? 1 : num_placements,
+			.instances = to_user_pointer(eci),
+		};
+
+		if (flags & CANCEL)
+			create.extensions = to_user_pointer(&job_timeout);
+		else if (flags & ENGINE_RESET)
+			create.extensions = to_user_pointer(&preempt_timeout);
+
+		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_ENGINE_CREATE,
+					&create), 0);
+		engines[i] = create.engine_id;
+		syncobjs[i] = syncobj_create(fd, 0);
+	};
+	exec.num_batch_buffer = flags & PARALLEL ? num_placements : 1;
+
+	sync[0].handle = syncobj_create(fd, 0);
+	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
+
+	if (flags & VIRTUAL && (flags & CAT_ERROR || flags & ENGINE_RESET ||
+				flags & GT_RESET))
+		bad_batches = num_placements;
+
+	for (i = 0; i < n_execs; i++) {
+		uint64_t base_addr = flags & CAT_ERROR && i < bad_batches ?
+			addr + bo_size * 128 : addr;
+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_addr = base_addr + batch_offset;
+		uint64_t spin_offset = (char *)&data[i].spin - (char *)data;
+		uint64_t spin_addr = base_addr + spin_offset;
+		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
+		uint64_t sdi_addr = base_addr + sdi_offset;
+		uint64_t exec_addr;
+		uint64_t batches[MAX_INSTANCE];
+		int e = i % n_engines;
+
+		for (j = 0; j < num_placements && flags & PARALLEL; ++j)
+			batches[j] = batch_addr;
+
+		if (i < bad_batches) {
+			xe_spin_init(&data[i].spin, spin_addr, false);
+			exec_addr = spin_addr;
+		} else {
+			b = 0;
+			data[i].batch[b++] = MI_STORE_DWORD_IMM;
+			data[i].batch[b++] = sdi_addr;
+			data[i].batch[b++] = sdi_addr >> 32;
+			data[i].batch[b++] = 0xc0ffee;
+			data[i].batch[b++] = MI_BATCH_BUFFER_END;
+			igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+			exec_addr = batch_addr;
+		}
+
+		for (j = 0; j < num_placements && flags & PARALLEL; ++j)
+			batches[j] = exec_addr;
+
+		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+		sync[1].handle = syncobjs[e];
+
+		exec.engine_id = engines[e];
+		exec.address = flags & PARALLEL ?
+			to_user_pointer(batches) : exec_addr;
+		if (e != i)
+			 syncobj_reset(fd, &syncobjs[e], 1);
+		__xe_exec_assert(fd, &exec);
+	}
+
+	if (flags & GT_RESET)
+		xe_force_gt_reset(fd, gt);
+
+	if (flags & CLOSE_FD) {
+		if (flags & CLOSE_ENGINES) {
+			for (i = 0; i < n_engines; i++)
+				xe_engine_destroy(fd, engines[i]);
+		}
+		close(fd);
+		/* FIXME: wait for idle */
+		usleep(150000);
+		return;
+	}
+
+	for (i = 0; i < n_engines && n_execs; i++)
+		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
+					NULL));
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	for (i = bad_batches; i < n_execs; i++)
+		igt_assert_eq(data[i].data, 0xc0ffee);
+
+	syncobj_destroy(fd, sync[0].handle);
+	for (i = 0; i < n_engines; i++) {
+		syncobj_destroy(fd, syncobjs[i]);
+		xe_engine_destroy(fd, engines[i]);
+	}
+
+	munmap(data, bo_size);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
+static void
+test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
+		 int n_engines, int n_execs, unsigned int flags)
+{
+	uint32_t vm;
+	uint64_t addr = 0x1a0000;
+	struct drm_xe_sync sync[2] = {
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 2,
+		.syncs = to_user_pointer(&sync),
+	};
+	uint32_t engines[MAX_N_ENGINES];
+	uint32_t syncobjs[MAX_N_ENGINES];
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct {
+		struct xe_spin spin;
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data;
+	int i, b;
+
+	igt_assert(n_engines <= MAX_N_ENGINES);
+
+	if (flags & CLOSE_FD)
+		fd = drm_open_driver(DRIVER_XE);
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	bo_size = sizeof(*data) * n_execs;
+	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
+			xe_get_default_alignment(fd));
+
+	bo = xe_bo_create(fd, eci->gt_id, vm, bo_size);
+	data = xe_bo_map(fd, bo, bo_size);
+
+	for (i = 0; i < n_engines; i++) {
+		struct drm_xe_ext_engine_set_property job_timeout = {
+			.base.next_extension = 0,
+			.base.name = XE_ENGINE_EXTENSION_SET_PROPERTY,
+			.property = XE_ENGINE_PROPERTY_JOB_TIMEOUT,
+			.value = 50,
+		};
+		struct drm_xe_ext_engine_set_property preempt_timeout = {
+			.base.next_extension = 0,
+			.base.name = XE_ENGINE_EXTENSION_SET_PROPERTY,
+			.property = XE_ENGINE_PROPERTY_PREEMPTION_TIMEOUT,
+			.value = 1000,
+		};
+		uint64_t ext = 0;
+
+		if (flags & CANCEL)
+			ext = to_user_pointer(&job_timeout);
+		else if (flags & ENGINE_RESET)
+			ext = to_user_pointer(&preempt_timeout);
+
+		engines[i] = xe_engine_create(fd, vm, eci, ext);
+		syncobjs[i] = syncobj_create(fd, 0);
+	};
+
+	sync[0].handle = syncobj_create(fd, 0);
+	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
+
+	for (i = 0; i < n_execs; i++) {
+		uint64_t base_addr = flags & CAT_ERROR && !i ?
+			addr + bo_size * 128 : addr;
+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_addr = base_addr + batch_offset;
+		uint64_t spin_offset = (char *)&data[i].spin - (char *)data;
+		uint64_t spin_addr = base_addr + spin_offset;
+		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
+		uint64_t sdi_addr = base_addr + sdi_offset;
+		uint64_t exec_addr;
+		int e = i % n_engines;
+
+		if (!i) {
+			xe_spin_init(&data[i].spin, spin_addr, false);
+			exec_addr = spin_addr;
+		} else {
+			b = 0;
+			data[i].batch[b++] = MI_STORE_DWORD_IMM;
+			data[i].batch[b++] = sdi_addr;
+			data[i].batch[b++] = sdi_addr >> 32;
+			data[i].batch[b++] = 0xc0ffee;
+			data[i].batch[b++] = MI_BATCH_BUFFER_END;
+			igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+			exec_addr = batch_addr;
+		}
+
+		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+		sync[1].handle = syncobjs[e];
+
+		exec.engine_id = engines[e];
+		exec.address = exec_addr;
+		if (e != i)
+			 syncobj_reset(fd, &syncobjs[e], 1);
+		__xe_exec_assert(fd, &exec);
+	}
+
+	if (flags & GT_RESET)
+		xe_force_gt_reset(fd, eci->gt_id);
+
+	if (flags & CLOSE_FD) {
+		if (flags & CLOSE_ENGINES) {
+			for (i = 0; i < n_engines; i++)
+				xe_engine_destroy(fd, engines[i]);
+		}
+		close(fd);
+		/* FIXME: wait for idle */
+		usleep(150000);
+		return;
+	}
+
+	for (i = 0; i < n_engines && n_execs; i++)
+		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
+					NULL));
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	for (i = 1; i < n_execs; i++)
+		igt_assert_eq(data[i].data, 0xc0ffee);
+
+	syncobj_destroy(fd, sync[0].handle);
+	for (i = 0; i < n_engines; i++) {
+		syncobj_destroy(fd, syncobjs[i]);
+		xe_engine_destroy(fd, engines[i]);
+	}
+
+	munmap(data, bo_size);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
+static void
+test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
+		  int n_engines, int n_execs, unsigned int flags)
+{
+	uint32_t vm;
+	uint64_t addr = 0x1a0000;
+#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
+	struct drm_xe_sync sync[1] = {
+		{ .flags = DRM_XE_SYNC_USER_FENCE | DRM_XE_SYNC_SIGNAL,
+	          .timeline_value = USER_FENCE_VALUE },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync),
+	};
+	uint32_t engines[MAX_N_ENGINES];
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct {
+		struct xe_spin spin;
+		uint32_t batch[16];
+		uint64_t pad;
+		uint64_t vm_sync;
+		uint64_t exec_sync;
+		uint32_t data;
+	} *data;
+	int i, b;
+
+	igt_assert(n_engines <= MAX_N_ENGINES);
+
+	if (flags & CLOSE_FD)
+		fd = drm_open_driver(DRIVER_XE);
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
+			  DRM_XE_VM_CREATE_COMPUTE_MODE, 0);
+	bo_size = sizeof(*data) * n_execs;
+	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
+			xe_get_default_alignment(fd));
+
+	bo = xe_bo_create(fd, eci->gt_id, vm, bo_size);
+	data = xe_bo_map(fd, bo, bo_size);
+	memset(data, 0, bo_size);
+
+	for (i = 0; i < n_engines; i++) {
+		struct drm_xe_ext_engine_set_property compute = {
+			.base.next_extension = 0,
+			.base.name = XE_ENGINE_EXTENSION_SET_PROPERTY,
+			.property = XE_ENGINE_PROPERTY_COMPUTE_MODE,
+			.value = 1,
+		};
+		struct drm_xe_ext_engine_set_property preempt_timeout = {
+			.base.next_extension = to_user_pointer(&compute),
+			.base.name = XE_ENGINE_EXTENSION_SET_PROPERTY,
+			.property = XE_ENGINE_PROPERTY_PREEMPTION_TIMEOUT,
+			.value = 1000,
+		};
+		uint64_t ext = 0;
+
+		if (flags & ENGINE_RESET)
+			ext = to_user_pointer(&preempt_timeout);
+		else
+			ext = to_user_pointer(&compute);
+
+		engines[i] = xe_engine_create(fd, vm, eci, ext);
+	};
+
+	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
+
+#define THREE_SEC	3000
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, THREE_SEC);
+	data[0].vm_sync = 0;
+
+	for (i = 0; i < n_execs; i++) {
+		uint64_t base_addr = flags & CAT_ERROR && !i ?
+			addr + bo_size * 128 : addr;
+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_addr = base_addr + batch_offset;
+		uint64_t spin_offset = (char *)&data[i].spin - (char *)data;
+		uint64_t spin_addr = base_addr + spin_offset;
+		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
+		uint64_t sdi_addr = base_addr + sdi_offset;
+		uint64_t exec_addr;
+		int e = i % n_engines;
+
+		if (!i) {
+			xe_spin_init(&data[i].spin, spin_addr, false);
+			exec_addr = spin_addr;
+		} else {
+			b = 0;
+			data[i].batch[b++] = MI_STORE_DWORD_IMM;
+			data[i].batch[b++] = sdi_addr;
+			data[i].batch[b++] = sdi_addr >> 32;
+			data[i].batch[b++] = 0xc0ffee;
+			data[i].batch[b++] = MI_BATCH_BUFFER_END;
+			igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+			exec_addr = batch_addr;
+		}
+
+		sync[0].addr = base_addr +
+			(char *)&data[i].exec_sync - (char *)data;
+
+		exec.engine_id = engines[e];
+		exec.address = exec_addr;
+		__xe_exec_assert(fd, &exec);
+	}
+
+	if (flags & GT_RESET)
+		xe_force_gt_reset(fd, eci->gt_id);
+
+	if (flags & CLOSE_FD) {
+		if (flags & CLOSE_ENGINES) {
+			for (i = 0; i < n_engines; i++)
+				xe_engine_destroy(fd, engines[i]);
+		}
+		close(fd);
+		/* FIXME: wait for idle */
+		usleep(150000);
+		return;
+	}
+
+	for (i = 1; i < n_execs; i++)
+		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
+			       NULL, THREE_SEC);
+
+	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, THREE_SEC);
+
+	for (i = 1; i < n_execs; i++)
+		igt_assert_eq(data[i].data, 0xc0ffee);
+
+	for (i = 0; i < n_engines; i++)
+		xe_engine_destroy(fd, engines[i]);
+
+	munmap(data, bo_size);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
+struct gt_thread_data {
+	pthread_t thread;
+	pthread_mutex_t *mutex;
+	pthread_cond_t *cond;
+	int fd;
+	int gt;
+	int *go;
+	int *exit;
+	int *num_reset;
+	bool do_reset;
+};
+
+static void do_resets(struct gt_thread_data *t)
+{
+	while (!*(t->exit)) {
+		usleep(250000);	/* 250 ms */
+		(*t->num_reset)++;
+		xe_force_gt_reset(t->fd, t->gt);
+	}
+}
+
+static void submit_jobs(struct gt_thread_data *t)
+{
+	int fd = t->fd;
+	uint32_t vm = xe_vm_create(fd, 0, 0);
+	uint64_t addr = 0x1a0000;
+	size_t bo_size = xe_get_default_alignment(fd);
+	uint32_t bo;
+	uint32_t *data;
+
+	bo = xe_bo_create(fd, 0, vm, bo_size);
+	data = xe_bo_map(fd, bo, bo_size);
+	data[0] = MI_BATCH_BUFFER_END;
+
+	xe_vm_bind_sync(fd, vm, bo, 0, addr, bo_size);
+
+	while (!*(t->exit)) {
+		struct drm_xe_engine_class_instance instance = {
+			.engine_class = DRM_XE_ENGINE_CLASS_COPY,
+			.engine_instance = 0,
+			.gt_id = 0,
+		};
+		struct drm_xe_engine_create create = {
+			.vm_id = vm,
+			.width = 1,
+			.num_placements = 1,
+			.instances = to_user_pointer(&instance),
+		};
+		struct drm_xe_exec exec;
+		int ret;
+
+		/* GuC IDs can get exhausted */
+		ret = igt_ioctl(fd, DRM_IOCTL_XE_ENGINE_CREATE, &create);
+		if (ret)
+			continue;
+
+		exec.engine_id = create.engine_id;
+		exec.address = addr;
+		exec.num_batch_buffer = 1;
+		__xe_exec_assert(fd, &exec);
+		xe_engine_destroy(fd, create.engine_id);
+	}
+
+	munmap(data, bo_size);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
+static void *gt_reset_thread(void *data)
+{
+	struct gt_thread_data *t = data;
+
+	pthread_mutex_lock(t->mutex);
+	while (*t->go == 0)
+		pthread_cond_wait(t->cond, t->mutex);
+	pthread_mutex_unlock(t->mutex);
+
+	if (t->do_reset)
+		do_resets(t);
+	else
+		submit_jobs(t);
+
+	return NULL;
+}
+
+static void
+gt_reset(int fd, int n_threads, int n_sec)
+{
+	struct gt_thread_data *threads;
+	pthread_mutex_t mutex;
+	pthread_cond_t cond;
+	int go = 0, exit = 0, num_reset = 0, i;
+
+	threads = calloc(n_threads, sizeof(struct gt_thread_data));
+	igt_assert(threads);
+
+	pthread_mutex_init(&mutex, 0);
+	pthread_cond_init(&cond, 0);
+
+	for (i = 0; i < n_threads; ++i) {
+		threads[i].mutex = &mutex;
+		threads[i].cond = &cond;
+		threads[i].fd = fd;
+		threads[i].gt = 0;
+		threads[i].go = &go;
+		threads[i].exit = &exit;
+		threads[i].num_reset = &num_reset;
+		threads[i].do_reset = (i == 0);
+
+		pthread_create(&threads[i].thread, 0, gt_reset_thread,
+			       &threads[i]);
+	}
+
+	pthread_mutex_lock(&mutex);
+	go = 1;
+	pthread_cond_broadcast(&cond);
+	pthread_mutex_unlock(&mutex);
+
+	sleep(n_sec);
+	exit = 1;
+
+	for (i = 0; i < n_threads; i++)
+		pthread_join(threads[i].thread, NULL);
+
+	printf("number of resets %d\n", num_reset);
+
+	free(threads);
+}
+
+igt_main
+{
+	struct drm_xe_engine_class_instance *hwe;
+	const struct section {
+		const char *name;
+		unsigned int flags;
+	} sections[] = {
+		{ "virtual", VIRTUAL },
+		{ "parallel", PARALLEL },
+		{ NULL },
+	};
+	int gt;
+	int class;
+	int fd;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		xe_query_all(fd);
+	}
+
+	igt_subtest("spin")
+		for_each_hw_engine(hwe)
+			test_spin(fd, hwe);
+
+	igt_subtest("cancel")
+		for_each_hw_engine(hwe)
+			test_legacy_mode(fd, hwe, 1, 1, CANCEL);
+
+	igt_subtest("engine-reset")
+		for_each_hw_engine(hwe)
+			test_legacy_mode(fd, hwe, 2, 2, ENGINE_RESET);
+
+	igt_subtest("cat-error")
+		for_each_hw_engine(hwe)
+			test_legacy_mode(fd, hwe, 2, 2, CAT_ERROR);
+
+	igt_subtest("gt-reset")
+		for_each_hw_engine(hwe)
+			test_legacy_mode(fd, hwe, 2, 2, GT_RESET);
+
+	igt_subtest("close-fd-no-exec")
+		for_each_hw_engine(hwe)
+			test_legacy_mode(-1, hwe, 16, 0, CLOSE_FD);
+
+	igt_subtest("close-fd")
+		for_each_hw_engine(hwe)
+			test_legacy_mode(-1, hwe, 16, 256, CLOSE_FD);
+
+	igt_subtest("close-engines-close-fd")
+		for_each_hw_engine(hwe)
+			test_legacy_mode(-1, hwe, 16, 256, CLOSE_FD |
+					 CLOSE_ENGINES);
+
+	igt_subtest("cm-engine-reset")
+		for_each_hw_engine(hwe)
+			test_compute_mode(fd, hwe, 2, 2, ENGINE_RESET);
+
+	igt_subtest("cm-cat-error")
+		for_each_hw_engine(hwe)
+			test_compute_mode(fd, hwe, 2, 2, CAT_ERROR);
+
+	igt_subtest("cm-gt-reset")
+		for_each_hw_engine(hwe)
+			test_compute_mode(fd, hwe, 2, 2, GT_RESET);
+
+	igt_subtest("cm-close-fd-no-exec")
+		for_each_hw_engine(hwe)
+			test_compute_mode(-1, hwe, 16, 0, CLOSE_FD);
+
+	igt_subtest("cm-close-fd")
+		for_each_hw_engine(hwe)
+			test_compute_mode(-1, hwe, 16, 256, CLOSE_FD);
+
+	igt_subtest("cm-close-engines-close-fd")
+		for_each_hw_engine(hwe)
+			test_compute_mode(-1, hwe, 16, 256, CLOSE_FD |
+					  CLOSE_ENGINES);
+
+	for (const struct section *s = sections; s->name; s++) {
+		igt_subtest_f("%s-cancel", s->name)
+			for_each_gt(gt)
+				for_each_hw_engine_class(class)
+					test_balancer(fd, gt, class, 1, 1,
+						      CANCEL | s->flags);
+
+		igt_subtest_f("%s-engine-reset", s->name)
+			for_each_gt(gt)
+				for_each_hw_engine_class(class)
+					test_balancer(fd, gt, class, MAX_INSTANCE + 1,
+						      MAX_INSTANCE + 1,
+						      ENGINE_RESET | s->flags);
+
+		igt_subtest_f("%s-cat-error", s->name)
+			for_each_gt(gt)
+				for_each_hw_engine_class(class)
+					test_balancer(fd, gt, class, MAX_INSTANCE + 1,
+						      MAX_INSTANCE + 1,
+						      CAT_ERROR | s->flags);
+
+		igt_subtest_f("%s-gt-reset", s->name)
+			for_each_gt(gt)
+				for_each_hw_engine_class(class)
+					test_balancer(fd, gt, class, MAX_INSTANCE + 1,
+						      MAX_INSTANCE + 1,
+						      GT_RESET | s->flags);
+
+		igt_subtest_f("%s-close-fd-no-exec", s->name)
+			for_each_gt(gt)
+				for_each_hw_engine_class(class)
+					test_balancer(-1, gt, class, 16, 0,
+						      CLOSE_FD | s->flags);
+
+		igt_subtest_f("%s-close-fd", s->name)
+			for_each_gt(gt)
+				for_each_hw_engine_class(class)
+					test_balancer(-1, gt, class, 16, 256,
+						      CLOSE_FD | s->flags);
+
+		igt_subtest_f("%s-close-engines-close-fd", s->name)
+			for_each_gt(gt)
+				for_each_hw_engine_class(class)
+					test_balancer(-1, gt, class, 16, 256, CLOSE_FD |
+						      CLOSE_ENGINES | s->flags);
+	}
+
+	igt_subtest("gt-reset-stress")
+		gt_reset(fd, 4, 1);
+
+	igt_fixture
+		close(fd);
+}
diff --git a/tests/xe/xe_exec_threads.c b/tests/xe/xe_exec_threads.c
new file mode 100644
index 00000000..41be8b4b
--- /dev/null
+++ b/tests/xe/xe_exec_threads.c
@@ -0,0 +1,1148 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include <fcntl.h>
+
+#include "igt.h"
+#include "lib/igt_syncobj.h"
+#include "lib/intel_reg.h"
+#include "xe_drm.h"
+
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include "xe/xe_spin.h"
+#include <string.h>
+
+#define MAX_N_ENGINES	16
+#define MAX_INSTANCE	9
+#define USERPTR		(0x1 << 0)
+#define REBIND		(0x1 << 1)
+#define INVALIDATE	(0x1 << 2)
+#define RACE		(0x1 << 3)
+#define SHARED_VM	(0x1 << 4)
+#define FD		(0x1 << 5)
+#define COMPUTE_MODE	(0x1 << 6)
+#define MIXED_MODE	(0x1 << 7)
+#define BALANCER	(0x1 << 8)
+#define PARALLEL	(0x1 << 9)
+#define VIRTUAL		(0x1 << 10)
+#define HANG		(0x1 << 11)
+#define REBIND_ERROR	(0x1 << 12)
+#define BIND_ENGINE	(0x1 << 13)
+
+pthread_barrier_t barrier;
+
+static void
+test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
+	      int class, int n_engines, int n_execs, unsigned int flags)
+{
+	struct drm_xe_sync sync[2] = {
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+	};
+	struct drm_xe_sync sync_all[MAX_N_ENGINES];
+	struct drm_xe_exec exec = {
+		.num_syncs = 2,
+		.syncs = to_user_pointer(&sync),
+	};
+	uint32_t engines[MAX_N_ENGINES];
+	uint32_t syncobjs[MAX_N_ENGINES];
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data;
+	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
+	int i, j, b, num_placements = 0;
+	bool owns_vm = false, owns_fd = false;
+
+	igt_assert(n_engines <= MAX_N_ENGINES);
+
+	if (!fd) {
+		fd = drm_open_driver(DRIVER_XE);
+		owns_fd = true;
+	}
+
+	if (!vm) {
+		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+		owns_vm = true;
+	}
+
+	for_each_hw_engine(hwe) {
+		if (hwe->engine_class != class || hwe->gt_id != gt)
+			continue;
+
+		eci[num_placements++] = *hwe;
+	}
+	igt_assert(num_placements > 1);
+
+	bo_size = sizeof(*data) * n_execs;
+	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
+			xe_get_default_alignment(fd));
+
+	if (flags & USERPTR) {
+		if (flags & INVALIDATE) {
+			data = mmap((void *)userptr, bo_size, PROT_READ |
+				    PROT_WRITE, MAP_SHARED | MAP_FIXED |
+				    MAP_ANONYMOUS, -1, 0);
+			igt_assert(data != MAP_FAILED);
+		} else {
+			data = aligned_alloc(xe_get_default_alignment(fd),
+					     bo_size);
+			igt_assert(data);
+		}
+	} else {
+		bo = xe_bo_create(fd, gt, vm, bo_size);
+		data = xe_bo_map(fd, bo, bo_size);
+	}
+	memset(data, 0, bo_size);
+
+	memset(sync_all, 0, sizeof(sync_all));
+	for (i = 0; i < n_engines; i++) {
+		struct drm_xe_engine_create create = {
+			.vm_id = vm,
+			.width = flags & PARALLEL ? num_placements : 1,
+			.num_placements = flags & PARALLEL ? 1 : num_placements,
+			.instances = to_user_pointer(eci),
+		};
+
+		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_ENGINE_CREATE,
+					&create), 0);
+		engines[i] = create.engine_id;
+		syncobjs[i] = syncobj_create(fd, 0);
+		sync_all[i].flags = DRM_XE_SYNC_SYNCOBJ;
+		sync_all[i].handle = syncobjs[i];
+	};
+	exec.num_batch_buffer = flags & PARALLEL ? num_placements : 1;
+
+	pthread_barrier_wait(&barrier);
+
+	sync[0].handle = syncobj_create(fd, 0);
+	if (bo)
+		xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
+	else
+		xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(data), addr,
+					 bo_size, sync, 1);
+
+	for (i = 0; i < n_execs; i++) {
+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_addr = addr + batch_offset;
+		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
+		uint64_t sdi_addr = addr + sdi_offset;
+		uint64_t batches[MAX_INSTANCE];
+		int e = i % n_engines;
+
+		for (j = 0; j < num_placements && flags & PARALLEL; ++j)
+			batches[j] = batch_addr;
+
+		b = 0;
+		data[i].batch[b++] = MI_STORE_DWORD_IMM;
+		data[i].batch[b++] = sdi_addr;
+		data[i].batch[b++] = sdi_addr >> 32;
+		data[i].batch[b++] = 0xc0ffee;
+		data[i].batch[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+		sync[1].handle = syncobjs[e];
+
+		exec.engine_id = engines[e];
+		exec.address = flags & PARALLEL ?
+			to_user_pointer(batches) : batch_addr;
+		if (e != i)
+			 syncobj_reset(fd, &syncobjs[e], 1);
+		__xe_exec_assert(fd, &exec);
+
+		if (flags & REBIND && i && !(i & 0x1f)) {
+			xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size,
+					   sync_all, n_engines);
+
+			sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+			addr += bo_size;
+			if (bo)
+				xe_vm_bind_async(fd, vm, 0, bo, 0, addr,
+						 bo_size, sync, 1);
+			else
+				xe_vm_bind_userptr_async(fd, vm, 0,
+							 to_user_pointer(data),
+							 addr, bo_size, sync,
+							 1);
+		}
+
+		if (flags & INVALIDATE && i && !(i & 0x1f)) {
+			if (!(flags & RACE)) {
+				/*
+				 * Wait for exec completion and check data as
+				 * userptr will likely change to different
+				 * physical memory on next mmap call triggering
+				 * an invalidate.
+				 */
+				for (j = 0; j < n_engines; ++j)
+					igt_assert(syncobj_wait(fd,
+								&syncobjs[j], 1,
+								INT64_MAX, 0,
+								NULL));
+				igt_assert_eq(data[i].data, 0xc0ffee);
+			} else if (i * 2 != n_execs) {
+				/*
+				 * We issue 1 mmap which races against running
+				 * jobs. No real check here aside from this test
+				 * not faulting on the GPU.
+				 */
+				continue;
+			}
+
+			data = mmap((void *)userptr, bo_size, PROT_READ |
+				    PROT_WRITE, MAP_SHARED | MAP_FIXED |
+				    MAP_ANONYMOUS, -1, 0);
+			igt_assert(data != MAP_FAILED);
+		}
+	}
+
+	for (i = 0; i < n_engines; i++)
+		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
+					NULL));
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	for (i = (flags & INVALIDATE && n_execs) ? n_execs - 1 : 0;
+	     i < n_execs; i++)
+		igt_assert_eq(data[i].data, 0xc0ffee);
+
+	syncobj_destroy(fd, sync[0].handle);
+	for (i = 0; i < n_engines; i++) {
+		syncobj_destroy(fd, syncobjs[i]);
+		xe_engine_destroy(fd, engines[i]);
+	}
+
+	if (bo) {
+		munmap(data, bo_size);
+		gem_close(fd, bo);
+	} else if (!(flags & INVALIDATE)) {
+		free(data);
+	}
+	if (owns_vm)
+		xe_vm_destroy(fd, vm);
+	if (owns_fd)
+		close(fd);
+}
+
+static void
+test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
+		  struct drm_xe_engine_class_instance *eci,
+		  int n_engines, int n_execs, unsigned int flags)
+{
+#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
+	struct drm_xe_sync sync[1] = {
+		{ .flags = DRM_XE_SYNC_USER_FENCE | DRM_XE_SYNC_SIGNAL,
+	          .timeline_value = USER_FENCE_VALUE },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync),
+	};
+	uint32_t engines[MAX_N_ENGINES];
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint64_t vm_sync;
+		uint64_t exec_sync;
+		uint32_t data;
+	} *data;
+	int i, j, b;
+	int map_fd = -1;
+	bool owns_vm = false, owns_fd = false;
+
+	igt_assert(n_engines <= MAX_N_ENGINES);
+
+	if (!fd) {
+		fd = drm_open_driver(DRIVER_XE);
+		owns_fd = true;
+	}
+
+	if (!vm) {
+		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
+				  XE_ENGINE_PROPERTY_COMPUTE_MODE, 0);
+		owns_vm = true;
+	}
+
+	bo_size = sizeof(*data) * n_execs;
+	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
+			xe_get_default_alignment(fd));
+
+	if (flags & USERPTR) {
+		if (flags & INVALIDATE) {
+			data = mmap((void *)userptr, bo_size, PROT_READ |
+				    PROT_WRITE, MAP_SHARED | MAP_FIXED |
+				    MAP_ANONYMOUS, -1, 0);
+			igt_assert(data != MAP_FAILED);
+		} else {
+			data = aligned_alloc(xe_get_default_alignment(fd),
+					     bo_size);
+			igt_assert(data);
+		}
+	} else {
+		bo = xe_bo_create(fd, eci->gt_id, 0, bo_size);
+		data = xe_bo_map(fd, bo, bo_size);
+	}
+	memset(data, 0, bo_size);
+
+	for (i = 0; i < n_engines; i++) {
+		struct drm_xe_ext_engine_set_property ext = {
+			.base.next_extension = 0,
+			.base.name = XE_ENGINE_EXTENSION_SET_PROPERTY,
+			.property = XE_ENGINE_PROPERTY_COMPUTE_MODE,
+			.value = 1,
+		};
+
+		engines[i] = xe_engine_create(fd, vm, eci,
+					      to_user_pointer(&ext));
+	};
+
+	pthread_barrier_wait(&barrier);
+
+	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	if (bo)
+		xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
+	else
+		xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(data), addr,
+					 bo_size, sync, 1);
+#define THREE_SEC	3000
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, THREE_SEC);
+	data[0].vm_sync = 0;
+
+	for (i = 0; i < n_execs; i++) {
+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_addr = addr + batch_offset;
+		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
+		uint64_t sdi_addr = addr + sdi_offset;
+		int e = i % n_engines;
+
+		b = 0;
+		data[i].batch[b++] = MI_STORE_DWORD_IMM;
+		data[i].batch[b++] = sdi_addr;
+		data[i].batch[b++] = sdi_addr >> 32;
+		data[i].batch[b++] = 0xc0ffee;
+		data[i].batch[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+		sync[0].addr = addr + (char *)&data[i].exec_sync - (char *)data;
+
+		exec.engine_id = engines[e];
+		exec.address = batch_addr;
+		__xe_exec_assert(fd, &exec);
+
+		if (flags & REBIND && i && !(i & 0x1f)) {
+			for (j = i - 0x20; j <= i; ++j)
+				xe_wait_ufence(fd, &data[j].exec_sync,
+					       USER_FENCE_VALUE,
+					       NULL, THREE_SEC);
+			xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size,
+					   NULL, 0);
+
+			sync[0].addr = to_user_pointer(&data[0].vm_sync);
+			addr += bo_size;
+			if (bo)
+				xe_vm_bind_async(fd, vm, 0, bo, 0, addr,
+						 bo_size, sync, 1);
+			else
+				xe_vm_bind_userptr_async(fd, vm, 0,
+							 to_user_pointer(data),
+							 addr, bo_size, sync,
+							 1);
+			xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
+				       NULL, THREE_SEC);
+			data[0].vm_sync = 0;
+		}
+
+		if (flags & INVALIDATE && i && !(i & 0x1f)) {
+			if (!(flags & RACE)) {
+				/*
+				 * Wait for exec completion and check data as
+				 * userptr will likely change to different
+				 * physical memory on next mmap call triggering
+				 * an invalidate.
+				 */
+				for (j = i == 0x20 ? 0 : i - 0x1f; j <= i; ++j)
+					xe_wait_ufence(fd, &data[j].exec_sync,
+						       USER_FENCE_VALUE,
+						       NULL, THREE_SEC);
+				igt_assert_eq(data[i].data, 0xc0ffee);
+			} else if (i * 2 != n_execs) {
+				/*
+				 * We issue 1 mmap which races against running
+				 * jobs. No real check here aside from this test
+				 * not faulting on the GPU.
+				 */
+				continue;
+			}
+
+			if (flags & RACE) {
+				map_fd = open("/tmp", O_TMPFILE | O_RDWR,
+					      0x666);
+				write(map_fd, data, bo_size);
+				data = mmap((void *)userptr, bo_size,
+					    PROT_READ | PROT_WRITE, MAP_SHARED |
+					    MAP_FIXED, map_fd, 0);
+			} else {
+				data = mmap((void *)userptr, bo_size,
+					    PROT_READ | PROT_WRITE, MAP_SHARED |
+					    MAP_FIXED | MAP_ANONYMOUS, -1, 0);
+			}
+			igt_assert(data != MAP_FAILED);
+		}
+	}
+
+	j = flags & INVALIDATE ?
+		(flags & RACE ? n_execs / 2 + 1 : n_execs - 1) : 0;
+	for (i = j; i < n_execs; i++)
+		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE, NULL,
+			       THREE_SEC);
+
+	/* Wait for all execs to complete */
+	if (flags & INVALIDATE)
+		sleep(1);
+
+	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, THREE_SEC);
+
+	for (i = j; i < n_execs; i++)
+		igt_assert_eq(data[i].data, 0xc0ffee);
+
+	for (i = 0; i < n_engines; i++)
+		xe_engine_destroy(fd, engines[i]);
+
+	if (bo) {
+		munmap(data, bo_size);
+		gem_close(fd, bo);
+	} else if (!(flags & INVALIDATE)) {
+		free(data);
+	}
+	if (map_fd != -1)
+		close(map_fd);
+	if (owns_vm)
+		xe_vm_destroy(fd, vm);
+	if (owns_fd)
+		close(fd);
+}
+
+static void
+test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
+		 struct drm_xe_engine_class_instance *eci, int n_engines,
+		 int n_execs, int rebind_error_inject, unsigned int flags)
+{
+	struct drm_xe_sync sync[2] = {
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+	};
+	struct drm_xe_sync sync_all[MAX_N_ENGINES];
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 2,
+		.syncs = to_user_pointer(&sync),
+	};
+	uint32_t engines[MAX_N_ENGINES];
+	uint32_t bind_engines[MAX_N_ENGINES];
+	uint32_t syncobjs[MAX_N_ENGINES];
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct {
+		struct xe_spin spin;
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data;
+	int i, j, b, hang_engine = n_engines / 2;
+	bool owns_vm = false, owns_fd = false;
+
+	igt_assert(n_engines <= MAX_N_ENGINES);
+
+	if (!fd) {
+		fd = drm_open_driver(DRIVER_XE);
+		owns_fd = true;
+	}
+
+	if (!vm) {
+		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+		owns_vm = true;
+	}
+
+	bo_size = sizeof(*data) * n_execs;
+	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
+			xe_get_default_alignment(fd));
+
+	if (flags & USERPTR) {
+		if (flags & INVALIDATE) {
+			data = mmap((void *)userptr, bo_size, PROT_READ |
+				    PROT_WRITE, MAP_SHARED | MAP_FIXED |
+				    MAP_ANONYMOUS, -1, 0);
+			igt_assert(data != MAP_FAILED);
+		} else {
+			data = aligned_alloc(xe_get_default_alignment(fd),
+					     bo_size);
+			igt_assert(data);
+		}
+	} else {
+		bo = xe_bo_create(fd, eci->gt_id, vm, bo_size);
+		data = xe_bo_map(fd, bo, bo_size);
+	}
+	memset(data, 0, bo_size);
+
+	memset(sync_all, 0, sizeof(sync_all));
+	for (i = 0; i < n_engines; i++) {
+		struct drm_xe_ext_engine_set_property preempt_timeout = {
+			.base.next_extension = 0,
+			.base.name = XE_ENGINE_EXTENSION_SET_PROPERTY,
+			.property = XE_ENGINE_PROPERTY_PREEMPTION_TIMEOUT,
+			.value = 1000,
+		};
+		uint64_t ext = to_user_pointer(&preempt_timeout);
+
+		if (flags & HANG && i == hang_engine)
+			engines[i] = xe_engine_create(fd, vm, eci, ext);
+		else
+			engines[i] = xe_engine_create(fd, vm, eci, 0);
+		if (flags & BIND_ENGINE)
+			bind_engines[i] = xe_bind_engine_create(fd, vm, 0);
+		else
+			bind_engines[i] = 0;
+		syncobjs[i] = syncobj_create(fd, 0);
+		sync_all[i].flags = DRM_XE_SYNC_SYNCOBJ;
+		sync_all[i].handle = syncobjs[i];
+	};
+
+	pthread_barrier_wait(&barrier);
+
+	sync[0].handle = syncobj_create(fd, 0);
+	if (bo)
+		xe_vm_bind_async(fd, vm, bind_engines[0], bo, 0, addr,
+				 bo_size, sync, 1);
+	else
+		xe_vm_bind_userptr_async(fd, vm, bind_engines[0],
+					 to_user_pointer(data), addr,
+					 bo_size, sync, 1);
+
+	for (i = 0; i < n_execs; i++) {
+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_addr = addr + batch_offset;
+		uint64_t spin_offset = (char *)&data[i].spin - (char *)data;
+		uint64_t spin_addr = addr + spin_offset;
+		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
+		uint64_t sdi_addr = addr + sdi_offset;
+		uint64_t exec_addr;
+		int e = i % n_engines;
+
+		if (flags & HANG && e == hang_engine && i == e) {
+			xe_spin_init(&data[i].spin, spin_addr, false);
+			exec_addr = spin_addr;
+		} else {
+			b = 0;
+			data[i].batch[b++] = MI_STORE_DWORD_IMM;
+			data[i].batch[b++] = sdi_addr;
+			data[i].batch[b++] = sdi_addr >> 32;
+			data[i].batch[b++] = 0xc0ffee;
+			data[i].batch[b++] = MI_BATCH_BUFFER_END;
+			igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+			exec_addr = batch_addr;
+		}
+
+		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+		sync[1].handle = syncobjs[e];
+
+		exec.engine_id = engines[e];
+		exec.address = exec_addr;
+		if (e != i && !(flags & HANG))
+			 syncobj_reset(fd, &syncobjs[e], 1);
+		if ((flags & HANG && e == hang_engine) ||
+		    rebind_error_inject > 0) {
+			int err;
+
+			do {
+				err = igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec);
+			} while (err && errno == ENOMEM);
+		} else {
+			__xe_exec_assert(fd, &exec);
+		}
+
+		if (flags & REBIND && i &&
+		    (!(i & 0x1f) || rebind_error_inject == i)) {
+#define INJECT_ERROR	(0x1 << 31)
+			if (rebind_error_inject == i)
+				__xe_vm_bind_assert(fd, vm, bind_engines[e],
+						    0, 0, addr, bo_size,
+						    XE_VM_BIND_OP_UNMAP |
+						    XE_VM_BIND_FLAG_ASYNC |
+						    INJECT_ERROR, sync_all,
+						    n_engines, 0, 0);
+			else
+				xe_vm_unbind_async(fd, vm, bind_engines[e],
+						   0, addr, bo_size,
+						   sync_all, n_engines);
+
+			sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+			addr += bo_size;
+			if (bo)
+				xe_vm_bind_async(fd, vm, bind_engines[e],
+						 bo, 0, addr, bo_size, sync, 1);
+			else
+				xe_vm_bind_userptr_async(fd, vm,
+							 bind_engines[e],
+							 to_user_pointer(data),
+							 addr, bo_size, sync,
+							 1);
+		}
+
+		if (flags & INVALIDATE && i && !(i & 0x1f)) {
+			if (!(flags & RACE)) {
+				/*
+				 * Wait for exec completion and check data as
+				 * userptr will likely change to different
+				 * physical memory on next mmap call triggering
+				 * an invalidate.
+				 */
+				for (j = 0; j < n_engines; ++j)
+					igt_assert(syncobj_wait(fd,
+								&syncobjs[j], 1,
+								INT64_MAX, 0,
+								NULL));
+				if (!(flags & HANG && e == hang_engine))
+					igt_assert_eq(data[i].data, 0xc0ffee);
+			} else if (i * 2 != n_execs) {
+				/*
+				 * We issue 1 mmap which races against running
+				 * jobs. No real check here aside from this test
+				 * not faulting on the GPU.
+				 */
+				continue;
+			}
+
+			data = mmap((void *)userptr, bo_size, PROT_READ |
+				    PROT_WRITE, MAP_SHARED | MAP_FIXED |
+				    MAP_ANONYMOUS, -1, 0);
+			igt_assert(data != MAP_FAILED);
+		}
+	}
+
+	for (i = 0; i < n_engines; i++)
+		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
+					NULL));
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+	xe_vm_unbind_async(fd, vm, bind_engines[0], 0, addr,
+			   bo_size, sync, 1);
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	for (i = flags & INVALIDATE ? n_execs - 1 : 0;
+	     i < n_execs; i++) {
+		int e = i % n_engines;
+
+		if (flags & HANG && e == hang_engine)
+			igt_assert_eq(data[i].data, 0x0);
+		else
+			igt_assert_eq(data[i].data, 0xc0ffee);
+	}
+
+	syncobj_destroy(fd, sync[0].handle);
+	for (i = 0; i < n_engines; i++) {
+		syncobj_destroy(fd, syncobjs[i]);
+		xe_engine_destroy(fd, engines[i]);
+		if (bind_engines[i])
+			xe_engine_destroy(fd, bind_engines[i]);
+	}
+
+	if (bo) {
+		munmap(data, bo_size);
+		gem_close(fd, bo);
+	} else if (!(flags & INVALIDATE)) {
+		free(data);
+	}
+	if (owns_vm)
+		xe_vm_destroy(fd, vm);
+	if (owns_fd)
+		close(fd);
+}
+
+struct thread_data {
+	pthread_t thread;
+	pthread_mutex_t *mutex;
+	pthread_cond_t *cond;
+	uint64_t addr;
+	uint64_t userptr;
+	int class;
+	int fd;
+	int gt;
+	uint32_t vm_legacy_mode;
+	uint32_t vm_compute_mode;
+	struct drm_xe_engine_class_instance *eci;
+	int n_engine;
+	int n_exec;
+	int flags;
+	int rebind_error_inject;
+	bool *go;
+};
+
+static void *thread(void *data)
+{
+	struct thread_data *t = data;
+
+	pthread_mutex_lock(t->mutex);
+	while (*t->go == 0)
+		pthread_cond_wait(t->cond, t->mutex);
+	pthread_mutex_unlock(t->mutex);
+
+	if (t->flags & PARALLEL || t->flags & VIRTUAL)
+		test_balancer(t->fd, t->gt, t->vm_legacy_mode, t->addr,
+			      t->userptr, t->class, t->n_engine, t->n_exec,
+			      t->flags);
+	else if (t->flags & COMPUTE_MODE)
+		test_compute_mode(t->fd, t->vm_compute_mode, t->addr,
+				  t->userptr, t->eci, t->n_engine, t->n_exec,
+				  t->flags);
+	else
+		test_legacy_mode(t->fd, t->vm_legacy_mode, t->addr, t->userptr,
+				 t->eci, t->n_engine, t->n_exec,
+				 t->rebind_error_inject, t->flags);
+
+	return NULL;
+}
+
+struct vm_thread_data {
+	pthread_t thread;
+	struct drm_xe_vm_bind_op_error_capture *capture;
+	int fd;
+	int vm;
+};
+
+static void *vm_async_ops_err_thread(void *data)
+{
+	struct vm_thread_data *args = data;
+	int fd = args->fd;
+	int ret;
+
+	struct drm_xe_wait_user_fence wait = {
+		.vm_id = args->vm,
+		.op = DRM_XE_UFENCE_WAIT_NEQ,
+		.flags = DRM_XE_UFENCE_WAIT_VM_ERROR,
+		.mask = DRM_XE_UFENCE_WAIT_U32,
+#define BASICALLY_FOREVER	0xffffffffffff
+		.timeout = BASICALLY_FOREVER,
+	};
+
+	ret = igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait);
+
+	while (!ret) {
+		struct drm_xe_vm_bind bind = {
+			.vm_id = args->vm,
+			.num_binds = 1,
+			.bind.op = XE_VM_BIND_OP_RESTART,
+		};
+
+		/* Restart and wait for next error */
+		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND,
+					&bind), 0);
+		args->capture->error = 0;
+		ret = igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait);
+	}
+
+	return NULL;
+}
+
+static void threads(int fd, int flags)
+{
+	struct thread_data *threads_data;
+	struct drm_xe_engine_class_instance *hwe;
+	uint64_t addr = 0x1a0000;
+	uint64_t userptr = 0x00007000eadbe000;
+	pthread_mutex_t mutex;
+	pthread_cond_t cond;
+	int n_hw_engines = 0, class;
+	uint64_t i = 0;
+	uint32_t vm_legacy_mode = 0, vm_compute_mode = 0;
+	struct drm_xe_vm_bind_op_error_capture capture = {};
+	struct vm_thread_data vm_err_thread = {};
+	bool go = false;
+	int n_threads = 0;
+	int gt;
+
+	for_each_hw_engine(hwe)
+		++n_hw_engines;
+
+	if (flags & BALANCER) {
+		for_each_gt(gt)
+			for_each_hw_engine_class(class) {
+				int num_placements = 0;
+
+				for_each_hw_engine(hwe) {
+					if (hwe->engine_class != class ||
+					    hwe->gt_id != gt)
+						continue;
+					++num_placements;
+				}
+
+				if (num_placements > 1)
+					n_hw_engines += 2;
+			}
+	}
+
+	threads_data = calloc(n_hw_engines, sizeof(*threads_data));
+	igt_assert(threads_data);
+
+	pthread_mutex_init(&mutex, 0);
+	pthread_cond_init(&cond, 0);
+
+	if (flags & SHARED_VM) {
+		struct drm_xe_ext_vm_set_property ext = {
+			.base.next_extension = 0,
+			.base.name = XE_VM_EXTENSION_SET_PROPERTY,
+			.property =
+				XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS,
+			.value = to_user_pointer(&capture),
+		};
+
+		vm_legacy_mode = xe_vm_create(fd,
+					      DRM_XE_VM_CREATE_ASYNC_BIND_OPS,
+					      to_user_pointer(&ext));
+		vm_compute_mode = xe_vm_create(fd,
+					       DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
+					       XE_ENGINE_PROPERTY_COMPUTE_MODE,
+					       0);
+
+		vm_err_thread.capture = &capture;
+		vm_err_thread.fd = fd;
+		vm_err_thread.vm = vm_legacy_mode;
+		pthread_create(&vm_err_thread.thread, 0,
+			       vm_async_ops_err_thread, &vm_err_thread);
+
+	}
+
+	for_each_hw_engine(hwe) {
+		threads_data[i].mutex = &mutex;
+		threads_data[i].cond = &cond;
+#define ADDRESS_SHIFT	39
+		threads_data[i].addr = addr | (i << ADDRESS_SHIFT);
+		threads_data[i].userptr = userptr | (i << ADDRESS_SHIFT);
+		if (flags & FD)
+			threads_data[i].fd = 0;
+		else
+			threads_data[i].fd = fd;
+		threads_data[i].vm_legacy_mode = vm_legacy_mode;
+		threads_data[i].vm_compute_mode = vm_compute_mode;
+		threads_data[i].eci = hwe;
+#define N_ENGINE	16
+		threads_data[i].n_engine = N_ENGINE;
+#define N_EXEC		1024
+		threads_data[i].n_exec = N_EXEC;
+		if (flags & REBIND_ERROR)
+			threads_data[i].rebind_error_inject =
+				(N_EXEC / (n_hw_engines + 1)) * (i + 1);
+		else
+			threads_data[i].rebind_error_inject = -1;
+		threads_data[i].flags = flags;
+		if (flags & MIXED_MODE) {
+			threads_data[i].flags &= ~MIXED_MODE;
+			if (i & 1)
+				threads_data[i].flags |= COMPUTE_MODE;
+		}
+		threads_data[i].go = &go;
+
+		++n_threads;
+		pthread_create(&threads_data[i].thread, 0, thread,
+			       &threads_data[i]);
+		++i;
+	}
+
+	if (flags & BALANCER) {
+		for_each_gt(gt)
+			for_each_hw_engine_class(class) {
+				int num_placements = 0;
+
+				for_each_hw_engine(hwe) {
+					if (hwe->engine_class != class ||
+					    hwe->gt_id != gt)
+						continue;
+					++num_placements;
+				}
+
+				if (num_placements > 1) {
+					threads_data[i].mutex = &mutex;
+					threads_data[i].cond = &cond;
+					if (flags & SHARED_VM)
+						threads_data[i].addr = addr |
+							(i << ADDRESS_SHIFT);
+					else
+						threads_data[i].addr = addr;
+					threads_data[i].userptr = userptr |
+						(i << ADDRESS_SHIFT);
+					if (flags & FD)
+						threads_data[i].fd = 0;
+					else
+						threads_data[i].fd = fd;
+					threads_data[i].gt = gt;
+					threads_data[i].vm_legacy_mode =
+						vm_legacy_mode;
+					threads_data[i].class = class;
+					threads_data[i].n_engine = N_ENGINE;
+					threads_data[i].n_exec = N_EXEC;
+					threads_data[i].flags = flags;
+					threads_data[i].flags &= ~BALANCER;
+					threads_data[i].flags |= VIRTUAL;
+					threads_data[i].go = &go;
+
+					++n_threads;
+					pthread_create(&threads_data[i].thread, 0,
+						       thread, &threads_data[i]);
+					++i;
+
+					threads_data[i].mutex = &mutex;
+					threads_data[i].cond = &cond;
+					if (flags & SHARED_VM)
+						threads_data[i].addr = addr |
+							(i << ADDRESS_SHIFT);
+					else
+						threads_data[i].addr = addr;
+					threads_data[i].userptr = userptr |
+						(i << ADDRESS_SHIFT);
+					if (flags & FD)
+						threads_data[i].fd = 0;
+					else
+						threads_data[i].fd = fd;
+					threads_data[i].vm_legacy_mode =
+						vm_legacy_mode;
+					threads_data[i].class = class;
+					threads_data[i].n_engine = N_ENGINE;
+					threads_data[i].n_exec = N_EXEC;
+					threads_data[i].flags = flags;
+					threads_data[i].flags &= ~BALANCER;
+					threads_data[i].flags |= PARALLEL;
+					threads_data[i].go = &go;
+
+					++n_threads;
+					pthread_create(&threads_data[i].thread, 0,
+						       thread, &threads_data[i]);
+					++i;
+				}
+			}
+	}
+
+	pthread_barrier_init(&barrier, NULL, n_threads);
+
+	pthread_mutex_lock(&mutex);
+	go = true;
+	pthread_cond_broadcast(&cond);
+	pthread_mutex_unlock(&mutex);
+
+	for (i = 0; i < n_hw_engines; ++i)
+		pthread_join(threads_data[i].thread, NULL);
+
+	if (vm_legacy_mode)
+		xe_vm_destroy(fd, vm_legacy_mode);
+	if (vm_compute_mode)
+		xe_vm_destroy(fd, vm_compute_mode);
+	free(threads_data);
+	if (flags & SHARED_VM)
+		pthread_join(vm_err_thread.thread, NULL);
+	pthread_barrier_destroy(&barrier);
+}
+
+igt_main
+{
+	const struct section {
+		const char *name;
+		unsigned int flags;
+	} sections[] = {
+		{ "basic", 0 },
+		{ "userptr", USERPTR },
+		{ "rebind", REBIND },
+		{ "rebind-bindengine", REBIND | BIND_ENGINE },
+		{ "userptr-rebind", USERPTR | REBIND },
+		{ "userptr-invalidate", USERPTR | INVALIDATE },
+		{ "userptr-invalidate-race", USERPTR | INVALIDATE | RACE },
+		{ "shared-vm-basic", SHARED_VM },
+		{ "shared-vm-userptr", SHARED_VM | USERPTR },
+		{ "shared-vm-rebind", SHARED_VM | REBIND },
+		{ "shared-vm-rebind-bindengine", SHARED_VM | REBIND |
+			BIND_ENGINE },
+		{ "shared-vm-userptr-rebind", SHARED_VM | USERPTR | REBIND },
+		{ "shared-vm-rebind-err", SHARED_VM | REBIND | REBIND_ERROR },
+		{ "shared-vm-userptr-rebind-err", SHARED_VM | USERPTR |
+			REBIND | REBIND_ERROR},
+		{ "shared-vm-userptr-invalidate", SHARED_VM | USERPTR |
+			INVALIDATE },
+		{ "shared-vm-userptr-invalidate-race", SHARED_VM | USERPTR |
+			INVALIDATE | RACE },
+		{ "fd-basic", FD },
+		{ "fd-userptr", FD | USERPTR },
+		{ "fd-rebind", FD | REBIND },
+		{ "fd-userptr-rebind", FD | USERPTR | REBIND },
+		{ "fd-userptr-invalidate", FD | USERPTR | INVALIDATE },
+		{ "fd-userptr-invalidate-race", FD | USERPTR | INVALIDATE |
+			RACE },
+		{ "hang-basic", HANG | 0 },
+		{ "hang-userptr", HANG | USERPTR },
+		{ "hang-rebind", HANG | REBIND },
+		{ "hang-userptr-rebind", HANG | USERPTR | REBIND },
+		{ "hang-userptr-invalidate", HANG | USERPTR | INVALIDATE },
+		{ "hang-userptr-invalidate-race", HANG | USERPTR | INVALIDATE |
+			RACE },
+		{ "hang-shared-vm-basic", HANG | SHARED_VM },
+		{ "hang-shared-vm-userptr", HANG | SHARED_VM | USERPTR },
+		{ "hang-shared-vm-rebind", HANG | SHARED_VM | REBIND },
+		{ "hang-shared-vm-userptr-rebind", HANG | SHARED_VM | USERPTR |
+			REBIND },
+		{ "hang-shared-vm-rebind-err", HANG | SHARED_VM | REBIND |
+			REBIND_ERROR },
+		{ "hang-shared-vm-userptr-rebind-err", HANG | SHARED_VM |
+			USERPTR | REBIND | REBIND_ERROR },
+		{ "hang-shared-vm-userptr-invalidate", HANG | SHARED_VM |
+			USERPTR | INVALIDATE },
+		{ "hang-shared-vm-userptr-invalidate-race", HANG | SHARED_VM |
+			USERPTR | INVALIDATE | RACE },
+		{ "hang-fd-basic", HANG | FD },
+		{ "hang-fd-userptr", HANG | FD | USERPTR },
+		{ "hang-fd-rebind", HANG | FD | REBIND },
+		{ "hang-fd-userptr-rebind", HANG | FD | USERPTR | REBIND },
+		{ "hang-fd-userptr-invalidate", HANG | FD | USERPTR |
+			INVALIDATE },
+		{ "hang-fd-userptr-invalidate-race", HANG | FD | USERPTR |
+			INVALIDATE | RACE },
+		{ "bal-basic", BALANCER },
+		{ "bal-userptr", BALANCER | USERPTR },
+		{ "bal-rebind", BALANCER | REBIND },
+		{ "bal-userptr-rebind", BALANCER | USERPTR | REBIND },
+		{ "bal-userptr-invalidate", BALANCER | USERPTR | INVALIDATE },
+		{ "bal-userptr-invalidate-race", BALANCER | USERPTR |
+			INVALIDATE | RACE },
+		{ "bal-shared-vm-basic", BALANCER | SHARED_VM },
+		{ "bal-shared-vm-userptr", BALANCER | SHARED_VM | USERPTR },
+		{ "bal-shared-vm-rebind", BALANCER | SHARED_VM | REBIND },
+		{ "bal-shared-vm-userptr-rebind", BALANCER | SHARED_VM |
+			USERPTR | REBIND },
+		{ "bal-shared-vm-userptr-invalidate", BALANCER | SHARED_VM |
+			USERPTR | INVALIDATE },
+		{ "bal-shared-vm-userptr-invalidate-race", BALANCER |
+			SHARED_VM | USERPTR | INVALIDATE | RACE },
+		{ "bal-fd-basic", BALANCER | FD },
+		{ "bal-fd-userptr", BALANCER | FD | USERPTR },
+		{ "bal-fd-rebind", BALANCER | FD | REBIND },
+		{ "bal-fd-userptr-rebind", BALANCER | FD | USERPTR | REBIND },
+		{ "bal-fd-userptr-invalidate", BALANCER | FD | USERPTR |
+			INVALIDATE },
+		{ "bal-fd-userptr-invalidate-race", BALANCER | FD | USERPTR |
+			INVALIDATE | RACE },
+		{ "cm-basic", COMPUTE_MODE },
+		{ "cm-userptr", COMPUTE_MODE | USERPTR },
+		{ "cm-rebind", COMPUTE_MODE | REBIND },
+		{ "cm-userptr-rebind", COMPUTE_MODE | USERPTR | REBIND },
+		{ "cm-userptr-invalidate", COMPUTE_MODE | USERPTR |
+			INVALIDATE },
+		{ "cm-userptr-invalidate-race", COMPUTE_MODE | USERPTR |
+			INVALIDATE | RACE },
+		{ "cm-shared-vm-basic", COMPUTE_MODE | SHARED_VM },
+		{ "cm-shared-vm-userptr", COMPUTE_MODE | SHARED_VM | USERPTR },
+		{ "cm-shared-vm-rebind", COMPUTE_MODE | SHARED_VM | REBIND },
+		{ "cm-shared-vm-userptr-rebind", COMPUTE_MODE | SHARED_VM |
+			USERPTR | REBIND },
+		{ "cm-shared-vm-userptr-invalidate", COMPUTE_MODE | SHARED_VM |
+			USERPTR | INVALIDATE },
+		{ "cm-shared-vm-userptr-invalidate-race", COMPUTE_MODE |
+			SHARED_VM | USERPTR | INVALIDATE | RACE },
+		{ "cm-fd-basic", COMPUTE_MODE | FD },
+		{ "cm-fd-userptr", COMPUTE_MODE | FD | USERPTR },
+		{ "cm-fd-rebind", COMPUTE_MODE | FD | REBIND },
+		{ "cm-fd-userptr-rebind", COMPUTE_MODE | FD | USERPTR |
+			REBIND },
+		{ "cm-fd-userptr-invalidate", COMPUTE_MODE | FD |
+			USERPTR | INVALIDATE },
+		{ "cm-fd-userptr-invalidate-race", COMPUTE_MODE | FD |
+			USERPTR | INVALIDATE | RACE },
+		{ "mixed-basic", MIXED_MODE },
+		{ "mixed-userptr", MIXED_MODE | USERPTR },
+		{ "mixed-rebind", MIXED_MODE | REBIND },
+		{ "mixed-userptr-rebind", MIXED_MODE | USERPTR | REBIND },
+		{ "mixed-userptr-invalidate", MIXED_MODE | USERPTR |
+			INVALIDATE },
+		{ "mixed-userptr-invalidate-race", MIXED_MODE | USERPTR |
+			INVALIDATE | RACE },
+		{ "mixed-shared-vm-basic", MIXED_MODE | SHARED_VM },
+		{ "mixed-shared-vm-userptr", MIXED_MODE | SHARED_VM |
+			USERPTR },
+		{ "mixed-shared-vm-rebind", MIXED_MODE | SHARED_VM | REBIND },
+		{ "mixed-shared-vm-userptr-rebind", MIXED_MODE | SHARED_VM |
+			USERPTR | REBIND },
+		{ "mixed-shared-vm-userptr-invalidate", MIXED_MODE |
+			SHARED_VM | USERPTR | INVALIDATE },
+		{ "mixed-shared-vm-userptr-invalidate-race", MIXED_MODE |
+			SHARED_VM | USERPTR | INVALIDATE | RACE },
+		{ "mixed-fd-basic", MIXED_MODE | FD },
+		{ "mixed-fd-userptr", MIXED_MODE | FD | USERPTR },
+		{ "mixed-fd-rebind", MIXED_MODE | FD | REBIND },
+		{ "mixed-fd-userptr-rebind", MIXED_MODE | FD | USERPTR |
+			REBIND },
+		{ "mixed-fd-userptr-invalidate", MIXED_MODE | FD |
+			USERPTR | INVALIDATE },
+		{ "mixed-fd-userptr-invalidate-race", MIXED_MODE | FD |
+			USERPTR | INVALIDATE | RACE },
+		{ "bal-mixed-basic", BALANCER | MIXED_MODE },
+		{ "bal-mixed-userptr", BALANCER | MIXED_MODE | USERPTR },
+		{ "bal-mixed-rebind", BALANCER | MIXED_MODE | REBIND },
+		{ "bal-mixed-userptr-rebind", BALANCER | MIXED_MODE | USERPTR |
+			REBIND },
+		{ "bal-mixed-userptr-invalidate", BALANCER | MIXED_MODE |
+			USERPTR | INVALIDATE },
+		{ "bal-mixed-userptr-invalidate-race", BALANCER | MIXED_MODE |
+			USERPTR | INVALIDATE | RACE },
+		{ "bal-mixed-shared-vm-basic", BALANCER | MIXED_MODE |
+			SHARED_VM },
+		{ "bal-mixed-shared-vm-userptr", BALANCER | MIXED_MODE |
+			SHARED_VM | USERPTR },
+		{ "bal-mixed-shared-vm-rebind", BALANCER | MIXED_MODE |
+			SHARED_VM | REBIND },
+		{ "bal-mixed-shared-vm-userptr-rebind", BALANCER | MIXED_MODE |
+			SHARED_VM | USERPTR | REBIND },
+		{ "bal-mixed-shared-vm-userptr-invalidate", BALANCER |
+			MIXED_MODE | SHARED_VM | USERPTR | INVALIDATE },
+		{ "bal-mixed-shared-vm-userptr-invalidate-race", BALANCER |
+			MIXED_MODE | SHARED_VM | USERPTR | INVALIDATE | RACE },
+		{ "bal-mixed-fd-basic", BALANCER | MIXED_MODE | FD },
+		{ "bal-mixed-fd-userptr", BALANCER | MIXED_MODE | FD |
+			USERPTR },
+		{ "bal-mixed-fd-rebind", BALANCER | MIXED_MODE | FD | REBIND },
+		{ "bal-mixed-fd-userptr-rebind", BALANCER | MIXED_MODE | FD |
+			USERPTR | REBIND },
+		{ "bal-mixed-fd-userptr-invalidate", BALANCER | MIXED_MODE |
+			FD | USERPTR | INVALIDATE },
+		{ "bal-mixed-fd-userptr-invalidate-race", BALANCER |
+			MIXED_MODE | FD | USERPTR | INVALIDATE | RACE },
+		{ NULL },
+	};
+	int fd;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		xe_query_all(fd);
+	}
+
+	for (const struct section *s = sections; s->name; s++) {
+		igt_subtest_f("threads-%s", s->name)
+			threads(fd, s->flags);
+	}
+
+	igt_fixture
+		close(fd);
+}
diff --git a/tests/xe/xe_guc_pc.c b/tests/xe/xe_guc_pc.c
new file mode 100644
index 00000000..bafbc6f0
--- /dev/null
+++ b/tests/xe/xe_guc_pc.c
@@ -0,0 +1,424 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#include "igt.h"
+#include "lib/igt_syncobj.h"
+#include "igt_sysfs.h"
+
+#include "xe_drm.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
+#include <string.h>
+#include <sys/time.h>
+
+#define MAX_N_ENGINES 16
+
+/*
+ * Too many intermediate components and steps before freq is adjusted
+ * Specially if workload is under execution, so let's wait 100 ms.
+ */
+#define ACT_FREQ_LATENCY_US 100000
+
+static void exec_basic(int fd, struct drm_xe_engine_class_instance *eci,
+		       int n_engines, int n_execs)
+{
+	uint32_t vm;
+	uint64_t addr = 0x1a0000;
+	struct drm_xe_sync sync[2] = {
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 2,
+		.syncs = to_user_pointer(&sync),
+	};
+	uint32_t engines[MAX_N_ENGINES];
+	uint32_t bind_engines[MAX_N_ENGINES];
+	uint32_t syncobjs[MAX_N_ENGINES];
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data;
+	int i, b;
+
+	igt_assert(n_engines <= MAX_N_ENGINES);
+	igt_assert(n_execs > 0);
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	bo_size = sizeof(*data) * n_execs;
+	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
+			xe_get_default_alignment(fd));
+
+	bo = xe_bo_create(fd, eci->gt_id, vm, bo_size);
+	data = xe_bo_map(fd, bo, bo_size);
+
+	for (i = 0; i < n_engines; i++) {
+		engines[i] = xe_engine_create(fd, vm, eci, 0);
+		bind_engines[i] = 0;
+		syncobjs[i] = syncobj_create(fd, 0);
+	};
+
+	sync[0].handle = syncobj_create(fd, 0);
+
+	xe_vm_bind_async(fd, vm, bind_engines[0], bo, 0, addr,
+			 bo_size, sync, 1);
+
+	for (i = 0; i < n_execs; i++) {
+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_addr = addr + batch_offset;
+		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
+		uint64_t sdi_addr = addr + sdi_offset;
+		int e = i % n_engines;
+
+		b = 0;
+		data[i].batch[b++] = MI_STORE_DWORD_IMM;
+		data[i].batch[b++] = sdi_addr;
+		data[i].batch[b++] = sdi_addr >> 32;
+		data[i].batch[b++] = 0xc0ffee;
+		data[i].batch[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+		sync[1].handle = syncobjs[e];
+
+		exec.engine_id = engines[e];
+		exec.address = batch_addr;
+
+		if (e != i)
+			syncobj_reset(fd, &syncobjs[e], 1);
+
+		__xe_exec_assert(fd, &exec);
+
+		igt_assert(syncobj_wait(fd, &syncobjs[e], 1,
+					INT64_MAX, 0, NULL));
+		igt_assert_eq(data[i].data, 0xc0ffee);
+	}
+
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+	xe_vm_unbind_async(fd, vm, bind_engines[0], 0, addr,
+			   bo_size, sync, 1);
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	for (i = 0; i < n_execs; i++)
+		igt_assert_eq(data[i].data, 0xc0ffee);
+
+	syncobj_destroy(fd, sync[0].handle);
+	for (i = 0; i < n_engines; i++) {
+		syncobj_destroy(fd, syncobjs[i]);
+		xe_engine_destroy(fd, engines[i]);
+		if (bind_engines[i])
+			xe_engine_destroy(fd, bind_engines[i]);
+	}
+
+	munmap(data, bo_size);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
+static int set_freq(int sysfs, int gt_id, const char *freq_name, uint32_t freq)
+{
+	int ret = -EAGAIN;
+	char path[32];
+
+	sprintf(path, "device/gt%d/freq_%s", gt_id, freq_name);
+	while (ret == -EAGAIN)
+		ret = igt_sysfs_printf(sysfs, path, "%u", freq);
+	return ret;
+}
+
+static uint32_t get_freq(int sysfs, int gt_id, const char *freq_name)
+{
+	uint32_t freq;
+	int err = -EAGAIN;
+	char path[32];
+	sprintf(path, "device/gt%d/freq_%s", gt_id, freq_name);
+	while (err == -EAGAIN)
+		err = igt_sysfs_scanf(sysfs, path, "%u", &freq);
+	return freq;
+}
+
+static void test_freq_basic_api(int sysfs, int gt_id)
+{
+	uint32_t rpn = get_freq(sysfs, gt_id, "rpn");
+	uint32_t rpe = get_freq(sysfs, gt_id, "rpe");
+	uint32_t rp0 = get_freq(sysfs, gt_id, "rp0");
+
+	/*
+	 * Negative bound tests
+	 * RPn is the floor
+	 * RP0 is the ceiling
+	 */
+	igt_assert(set_freq(sysfs, gt_id, "min", rpn - 1) < 0);
+	igt_assert(set_freq(sysfs, gt_id, "min", rp0 + 1) < 0);
+	igt_assert(set_freq(sysfs, gt_id, "max", rpn - 1) < 0);
+	igt_assert(set_freq(sysfs, gt_id, "max", rp0 + 1) < 0);
+
+	/* Assert min requests are respected from rp0 to rpn */
+	igt_assert(set_freq(sysfs, gt_id, "min", rp0) > 0);
+	igt_assert(get_freq(sysfs, gt_id, "min") == rp0);
+	igt_assert(set_freq(sysfs, gt_id, "min", rpe) > 0);
+	igt_assert(get_freq(sysfs, gt_id, "min") == rpe);
+	igt_assert(set_freq(sysfs, gt_id, "min", rpn) > 0);
+	igt_assert(get_freq(sysfs, gt_id, "min") == rpn);
+
+	/* Assert max requests are respected from rpn to rp0 */
+	igt_assert(set_freq(sysfs, gt_id, "max", rpn) > 0);
+	igt_assert(get_freq(sysfs, gt_id, "max") == rpn);
+	igt_assert(set_freq(sysfs, gt_id, "max", rpe) > 0);
+	igt_assert(get_freq(sysfs, gt_id, "max") == rpe);
+	igt_assert(set_freq(sysfs, gt_id, "max", rp0) > 0);
+	igt_assert(get_freq(sysfs, gt_id, "max") == rp0);
+}
+
+static void test_freq_fixed(int sysfs, int gt_id)
+{
+	uint32_t rpn = get_freq(sysfs, gt_id, "rpn");
+	uint32_t rpe = get_freq(sysfs, gt_id, "rpe");
+	uint32_t rp0 = get_freq(sysfs, gt_id, "rp0");
+
+	igt_debug("Starting testing fixed request\n");
+
+	/*
+	 * For Fixed freq we need to set both min and max to the desired value
+	 * Then we check if hardware is actually operating at the desired freq
+	 * And let's do this for all the 3 known Render Performance (RP) values.
+	 */
+	igt_assert(set_freq(sysfs, gt_id, "min", rpn) > 0);
+	igt_assert(set_freq(sysfs, gt_id, "max", rpn) > 0);
+	usleep(ACT_FREQ_LATENCY_US);
+	igt_assert(get_freq(sysfs, gt_id, "cur") == rpn);
+	igt_assert(get_freq(sysfs, gt_id, "act") == rpn);
+
+	igt_assert(set_freq(sysfs, gt_id, "min", rpe) > 0);
+	igt_assert(set_freq(sysfs, gt_id, "max", rpe) > 0);
+	usleep(ACT_FREQ_LATENCY_US);
+	igt_assert(get_freq(sysfs, gt_id, "cur") == rpe);
+	igt_assert(get_freq(sysfs, gt_id, "act") == rpe);
+
+	igt_assert(set_freq(sysfs, gt_id, "min", rp0) > 0);
+	igt_assert(set_freq(sysfs, gt_id, "max", rp0) > 0);
+	usleep(ACT_FREQ_LATENCY_US);
+	/*
+	 * It is unlikely that PCODE will *always* respect any request above RPe
+	 * So for this level let's only check if GuC PC is doing its job
+	 * and respecting our request, by propagating it to the hardware.
+	 */
+	igt_assert(get_freq(sysfs, gt_id, "cur") == rp0);
+
+	igt_debug("Finished testing fixed request\n");
+}
+
+static void test_freq_range(int sysfs, int gt_id)
+{
+	uint32_t rpn = get_freq(sysfs, gt_id, "rpn");
+	uint32_t rpe = get_freq(sysfs, gt_id, "rpe");
+	uint32_t cur, act;
+
+	igt_debug("Starting testing range request\n");
+
+	igt_assert(set_freq(sysfs, gt_id, "min", rpn) > 0);
+	igt_assert(set_freq(sysfs, gt_id, "max", rpe) > 0);
+	usleep(ACT_FREQ_LATENCY_US);
+	cur = get_freq(sysfs, gt_id, "cur");
+	igt_assert(rpn <= cur && cur <= rpe);
+	act = get_freq(sysfs, gt_id, "act");
+	igt_assert(rpn <= act && act <= rpe);
+
+	igt_debug("Finished testing range request\n");
+}
+
+static void test_freq_low_max(int sysfs, int gt_id)
+{
+	uint32_t rpn = get_freq(sysfs, gt_id, "rpn");
+	uint32_t rpe = get_freq(sysfs, gt_id, "rpe");
+
+	/*
+	 *  When max request < min request, max is ignored and min works like
+	 * a fixed one. Let's assert this assumption
+	 */
+	igt_assert(set_freq(sysfs, gt_id, "min", rpe) > 0);
+	igt_assert(set_freq(sysfs, gt_id, "max", rpn) > 0);
+	usleep(ACT_FREQ_LATENCY_US);
+	igt_assert(get_freq(sysfs, gt_id, "cur") == rpe);
+	igt_assert(get_freq(sysfs, gt_id, "act") == rpe);
+}
+
+static void test_suspend(int sysfs, int gt_id)
+{
+	uint32_t rpn = get_freq(sysfs, gt_id, "rpn");
+
+	igt_assert(set_freq(sysfs, gt_id, "min", rpn) > 0);
+	igt_assert(set_freq(sysfs, gt_id, "max", rpn) > 0);
+	usleep(ACT_FREQ_LATENCY_US);
+	igt_assert(get_freq(sysfs, gt_id, "cur") == rpn);
+
+	igt_system_suspend_autoresume(SUSPEND_STATE_S3,
+				      SUSPEND_TEST_NONE);
+
+	igt_assert(get_freq(sysfs, gt_id, "min") == rpn);
+	igt_assert(get_freq(sysfs, gt_id, "max") == rpn);
+}
+
+static void test_reset(int fd, int sysfs, int gt_id, int cycles)
+{
+	uint32_t rpn = get_freq(sysfs, gt_id, "rpn");
+
+	for (int i = 0; i < cycles; i++) {
+		igt_assert_f(set_freq(sysfs, gt_id, "min", rpn) > 0,
+			     "Failed after %d good cycles\n", i);
+		igt_assert_f(set_freq(sysfs, gt_id, "max", rpn) > 0,
+			     "Failed after %d good cycles\n", i);
+		usleep(ACT_FREQ_LATENCY_US);
+		igt_assert_f(get_freq(sysfs, gt_id, "cur") == rpn,
+			     "Failed after %d good cycles\n", i);
+
+		xe_force_gt_reset(fd, gt_id);
+
+		igt_assert_f(get_freq(sysfs, gt_id, "min") == rpn,
+			     "Failed after %d good cycles\n", i);
+		igt_assert_f(get_freq(sysfs, gt_id, "max") == rpn,
+			     "Failed after %d good cycles\n", i);
+	}
+}
+
+static bool in_rc6(int sysfs, int gt_id)
+{
+	char path[32];
+	char rc[8];
+	sprintf(path, "device/gt%d/rc_status", gt_id);
+	if (igt_sysfs_scanf(sysfs, path, "%s", rc) < 0)
+		return false;
+	return strcmp(rc, "rc6") == 0;
+}
+
+igt_main
+{
+	struct drm_xe_engine_class_instance *hwe;
+	int fd;
+	int gt;
+	static int sysfs = -1;
+	int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
+	uint32_t stash_min;
+	uint32_t stash_max;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		xe_query_all(fd);
+
+		sysfs = igt_sysfs_open(fd);
+		igt_assert(sysfs != -1);
+
+		/* The defaults are the same. Stashing the gt0 is enough */
+		stash_min = get_freq(sysfs, 0, "min");
+		stash_max = get_freq(sysfs, 0, "max");
+	}
+
+	igt_subtest("freq_basic_api") {
+		for_each_gt(gt)
+			test_freq_basic_api(sysfs, gt);
+	}
+
+	igt_subtest("freq_fixed_idle") {
+		for_each_gt(gt) {
+			test_freq_fixed(sysfs, gt);
+		}
+	}
+
+	igt_subtest("freq_fixed_exec") {
+		for_each_gt(gt) {
+			for_each_hw_engine(hwe)
+				igt_fork(child, ncpus) {
+					igt_debug("Execution Started\n");
+					exec_basic(fd, hwe, MAX_N_ENGINES, 16);
+					igt_debug("Execution Finished\n");
+				}
+			/* While exec in threads above, let's check the freq */
+			test_freq_fixed(sysfs, gt);
+			igt_waitchildren();
+		}
+	}
+
+	igt_subtest("freq_range_idle") {
+		for_each_gt(gt) {
+			test_freq_range(sysfs, gt);
+		}
+	}
+
+	igt_subtest("freq_range_exec") {
+		for_each_gt(gt) {
+			for_each_hw_engine(hwe)
+				igt_fork(child, ncpus) {
+					igt_debug("Execution Started\n");
+					exec_basic(fd, hwe, MAX_N_ENGINES, 16);
+					igt_debug("Execution Finished\n");
+				}
+			/* While exec in threads above, let's check the freq */
+			test_freq_range(sysfs, gt);
+			igt_waitchildren();
+		}
+	}
+
+	igt_subtest("freq_low_max") {
+		for_each_gt(gt) {
+			test_freq_low_max(sysfs, gt);
+		}
+	}
+
+	igt_subtest("freq_suspend") {
+		for_each_gt(gt) {
+			test_suspend(sysfs, gt);
+		}
+	}
+
+	igt_subtest("freq_reset") {
+		for_each_gt(gt) {
+			test_reset(fd, sysfs, gt, 1);
+		}
+	}
+
+	igt_subtest("freq_reset_multiple") {
+		for_each_gt(gt) {
+			test_reset(fd, sysfs, gt, 50);
+		}
+	}
+
+	igt_subtest("rc6_on_idle") {
+		for_each_gt(gt) {
+			assert(igt_wait(in_rc6(sysfs, gt), 1000, 1));
+		}
+	}
+
+	igt_subtest("rc0_on_exec") {
+		for_each_gt(gt) {
+			assert(igt_wait(in_rc6(sysfs, gt), 1000, 1));
+			for_each_hw_engine(hwe)
+				igt_fork(child, ncpus) {
+					igt_debug("Execution Started\n");
+					exec_basic(fd, hwe, MAX_N_ENGINES, 16);
+					igt_debug("Execution Finished\n");
+				}
+			/* While exec in threads above, let's check rc_status */
+			assert(igt_wait(!in_rc6(sysfs, gt), 1000, 1));
+			igt_waitchildren();
+		}
+	}
+
+	igt_fixture {
+		for_each_gt(gt) {
+			set_freq(sysfs, gt, "min", stash_min);
+			set_freq(sysfs, gt, "max", stash_max);
+		}
+		close(sysfs);
+		close(fd);
+	}
+}
diff --git a/tests/xe/xe_huc_copy.c b/tests/xe/xe_huc_copy.c
new file mode 100644
index 00000000..aedb0bc2
--- /dev/null
+++ b/tests/xe/xe_huc_copy.c
@@ -0,0 +1,187 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright Â© 2022 Intel Corporation
+ */
+
+#include <string.h>
+
+#include "igt.h"
+#include "lib/igt_syncobj.h"
+#include "xe_drm.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
+#define SIZE_DATA           0x1000
+#define SIZE_BATCH          0x1000
+#define SIZE_BUFFER_INPUT   SIZE_DATA
+#define SIZE_BUFFER_OUTPUT  SIZE_DATA
+#define ADDR_INPUT          0x200000
+#define ADDR_OUTPUT         0x400000
+#define ADDR_BATCH          0x600000
+
+#define PARALLEL_VIDEO_PIPE     (0x3<<29)
+#define MFX_WAIT                (PARALLEL_VIDEO_PIPE|(0x1<<27)|(0x1<<8))
+#define HUC_IMEM_STATE          (PARALLEL_VIDEO_PIPE|(0x2<<27)|(0xb<<23)|(0x1<<16)|0x3)
+#define HUC_PIPE_MODE_SELECT    (PARALLEL_VIDEO_PIPE|(0x2<<27)|(0xb<<23)|0x1)
+#define HUC_START               (PARALLEL_VIDEO_PIPE|(0x2<<27)|(0xb<<23)|(0x21<<16))
+#define HUC_VIRTUAL_ADDR_STATE  (PARALLEL_VIDEO_PIPE|(0x2<<27)|(0xb<<23)|(0x4<<16)|0x2f)
+#define HUC_VIRTUAL_ADDR_REGION_NUM 16
+#define HUC_VIRTUAL_ADDR_REGION_SRC 0
+#define HUC_VIRTUAL_ADDR_REGION_DST 14
+
+struct bo_dict_entry {
+	uint64_t addr;
+	uint32_t size;
+	void *data;
+};
+
+static void
+gen12_emit_huc_virtual_addr_state(uint64_t src_addr,
+	uint64_t dst_addr,
+	uint32_t *batch,
+	int *i) {
+	batch[(*i)++] = HUC_VIRTUAL_ADDR_STATE;
+
+	for (int j = 0; j < HUC_VIRTUAL_ADDR_REGION_NUM; j++) {
+		if (j == HUC_VIRTUAL_ADDR_REGION_SRC) {
+			batch[(*i)++] = src_addr;
+		} else if (j == HUC_VIRTUAL_ADDR_REGION_DST) {
+			batch[(*i)++] = dst_addr;
+		} else {
+			batch[(*i)++] = 0;
+		}
+		batch[(*i)++] = 0;
+		batch[(*i)++] = 0;
+	}
+}
+
+static void
+gen12_create_batch_huc_copy(uint32_t *batch,
+	uint64_t src_addr,
+	uint64_t dst_addr) {
+	int i = 0;
+
+	batch[i++] = HUC_IMEM_STATE;
+	batch[i++] = 0;
+	batch[i++] = 0;
+	batch[i++] = 0;
+	batch[i++] = 0x3;
+
+	batch[i++] = MFX_WAIT;
+	batch[i++] = MFX_WAIT;
+
+	batch[i++] = HUC_PIPE_MODE_SELECT;
+	batch[i++] = 0;
+	batch[i++] = 0;
+
+	batch[i++] = MFX_WAIT;
+
+	gen12_emit_huc_virtual_addr_state(src_addr, dst_addr, batch, &i);
+
+	batch[i++] = HUC_START;
+	batch[i++] = 1;
+
+	batch[i++] = MI_BATCH_BUFFER_END;
+}
+
+static void
+test_huc_copy(int fd)
+{
+	uint32_t vm, engine;
+	char *dinput;
+	struct drm_xe_sync sync = { 0 };
+
+#define BO_DICT_ENTRIES 3
+	struct bo_dict_entry bo_dict[BO_DICT_ENTRIES] = {
+		{ .addr = ADDR_INPUT, .size = SIZE_BUFFER_INPUT }, // input
+		{ .addr = ADDR_OUTPUT, .size = SIZE_BUFFER_OUTPUT }, // output
+		{ .addr = ADDR_BATCH, .size = SIZE_BATCH }, // batch
+	};
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	engine = xe_engine_create_class(fd, vm, DRM_XE_ENGINE_CLASS_VIDEO_DECODE);
+	sync.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL;
+	sync.handle = syncobj_create(fd, 0);
+
+	for(int i = 0; i < BO_DICT_ENTRIES; i++) {
+		bo_dict[i].data = aligned_alloc(xe_get_default_alignment(fd), bo_dict[i].size);
+		xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(bo_dict[i].data), bo_dict[i].addr, bo_dict[i].size, &sync, 1);
+		syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL);
+		memset(bo_dict[i].data, 0, bo_dict[i].size);
+	}
+	dinput = (char *)bo_dict[0].data;
+	srand(time(NULL));
+	for(int i=0; i < SIZE_DATA; i++) {
+		((char*) dinput)[i] = rand()/256;
+	}
+	gen12_create_batch_huc_copy(bo_dict[2].data, bo_dict[0].addr, bo_dict[1].addr);
+
+	xe_exec_wait(fd, engine, ADDR_BATCH);
+	for(int i = 0; i < SIZE_DATA; i++) {
+		igt_assert(((char*) bo_dict[1].data)[i] == ((char*) bo_dict[0].data)[i]);
+	}
+
+	for(int i = 0; i < BO_DICT_ENTRIES; i++) {
+		xe_vm_unbind_async(fd, vm, 0, 0, bo_dict[i].addr, bo_dict[i].size, &sync, 1);
+		syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL);
+		free(bo_dict[i].data);
+	}
+
+	syncobj_destroy(fd, sync.handle);
+	xe_engine_destroy(fd, engine);
+	xe_vm_destroy(fd, vm);
+}
+
+static bool
+is_device_supported(int fd)
+{
+	struct drm_xe_query_config *config;
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_CONFIG,
+		.size = 0,
+		.data = 0,
+	};
+	uint16_t devid;
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	config = malloc(query.size);
+	igt_assert(config);
+
+	query.data = to_user_pointer(config);
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	devid = config->info[XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff;
+	return (
+			devid == 0x9A60 ||
+			devid == 0x9A68 ||
+			devid == 0x9A70 ||
+			devid == 0x9A40 ||
+			devid == 0x9A49 ||
+			devid == 0x9A59 ||
+			devid == 0x9A78 ||
+			devid == 0x9AC0 ||
+			devid == 0x9AC9 ||
+			devid == 0x9AD9 ||
+			devid == 0x9AF8
+		);
+}
+
+igt_main
+{
+	int xe;
+
+	igt_fixture {
+		xe = drm_open_driver(DRIVER_XE);
+		xe_query_all(xe);
+	}
+
+	igt_subtest("huc_copy") {
+		igt_skip_on(!is_device_supported(xe));
+		test_huc_copy(xe);
+	}
+
+	igt_fixture
+		close(xe);
+}
diff --git a/tests/xe/xe_live_ktest.c b/tests/xe/xe_live_ktest.c
new file mode 100644
index 00000000..1a37f3ec
--- /dev/null
+++ b/tests/xe/xe_live_ktest.c
@@ -0,0 +1,17 @@
+#include "igt.h"
+#include "igt_kmod.h"
+
+IGT_TEST_DESCRIPTION("XE driver live kunit tests");
+
+igt_main
+{
+	igt_subtest("dma-buf")
+		igt_kunit("xe_dma_buf_test", NULL);
+
+	igt_subtest("bo")
+		igt_kunit("xe_bo_test", NULL);
+
+	igt_subtest("migrate")
+		igt_kunit("xe_migrate_test", NULL);
+}
+
diff --git a/tests/xe/xe_mmap.c b/tests/xe/xe_mmap.c
new file mode 100644
index 00000000..0199d8be
--- /dev/null
+++ b/tests/xe/xe_mmap.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include "igt.h"
+
+#include "xe_drm.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
+#include <string.h>
+
+static void
+test_mmap(int fd, uint32_t flags)
+{
+	uint32_t bo;
+	uint64_t mmo;
+	void *map;
+
+	if (flags & vram_memory(0))
+		igt_require(xe_has_vram(fd));
+
+	bo = xe_bo_create_flags(fd, 0, 4096, flags);
+	mmo = xe_bo_mmap_offset(fd, bo);
+
+	map = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED, fd, mmo);
+	igt_assert(map != MAP_FAILED);
+
+	strcpy(map, "Write some data to the BO!");
+
+	munmap(map, 4096);
+
+	gem_close(fd, bo);
+}
+
+igt_main
+{
+	int fd;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		xe_query_all(fd);
+	}
+
+	igt_subtest("system")
+		test_mmap(fd, system_memory());
+
+	igt_subtest("vram")
+		test_mmap(fd, vram_memory(0));
+
+	igt_subtest("vram-system")
+		test_mmap(fd, vram_memory(0) | system_memory());
+
+	igt_fixture
+		close(fd);
+}
diff --git a/tests/xe/xe_pm.c b/tests/xe/xe_pm.c
new file mode 100644
index 00000000..e74d0d2d
--- /dev/null
+++ b/tests/xe/xe_pm.c
@@ -0,0 +1,384 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#include <limits.h>
+#include <fcntl.h>
+#include <string.h>
+
+#include "igt.h"
+#include "lib/igt_device.h"
+#include "lib/igt_pm.h"
+#include "lib/igt_syncobj.h"
+#include "lib/intel_reg.h"
+
+#include "xe_drm.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
+#define MAX_N_ENGINES 16
+#define NO_SUSPEND -1
+#define NO_RPM -1
+
+typedef struct {
+	int fd_xe;
+	struct pci_device *pci_xe;
+	struct pci_device *pci_root;
+} device_t;
+
+/* runtime_usage is only available if kernel build CONFIG_PM_ADVANCED_DEBUG */
+static bool runtime_usage_available(struct pci_device *pci)
+{
+	char name[PATH_MAX];
+	snprintf(name, PATH_MAX, "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/runtime_usage",
+		 pci->domain, pci->bus, pci->dev, pci->func);
+	return access(name, F_OK) == 0;
+}
+
+static int open_d3cold_allowed(struct pci_device *pci)
+{
+	char name[PATH_MAX];
+	int fd;
+
+	snprintf(name, PATH_MAX, "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/d3cold_allowed",
+		 pci->domain, pci->bus, pci->dev, pci->func);
+
+	fd = open(name, O_RDWR);
+	igt_assert_f(fd >= 0, "Can't open %s\n", name);
+
+	return fd;
+}
+
+static void get_d3cold_allowed(struct pci_device *pci, char *d3cold_allowed)
+{
+	int fd = open_d3cold_allowed(pci);
+
+	igt_assert(read(fd, d3cold_allowed, 2));
+	close(fd);
+}
+
+static void set_d3cold_allowed(struct pci_device *pci,
+			       const char *d3cold_allowed)
+{
+	int fd = open_d3cold_allowed(pci);
+
+	igt_assert(write(fd, d3cold_allowed, 2));
+	close(fd);
+}
+
+static bool setup_d3(device_t device, enum igt_acpi_d_state state)
+{
+	switch (state) {
+	case IGT_ACPI_D3Cold:
+		igt_require(igt_pm_acpi_d3cold_supported(device.pci_root));
+		igt_pm_enable_pci_card_runtime_pm(device.pci_root, NULL);
+		set_d3cold_allowed(device.pci_xe, "1\n");
+		return true;
+	case IGT_ACPI_D3Hot:
+		set_d3cold_allowed(device.pci_xe, "0\n");
+		return true;
+	default:
+		igt_debug("Invalid D3 Selection\n");
+	}
+
+	return false;
+}
+
+static bool in_d3(device_t device, enum igt_acpi_d_state state)
+{
+	uint16_t val;
+
+	/* We need to wait for the autosuspend to kick in before we can check */
+	if (!igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED))
+		return false;
+
+	if (runtime_usage_available(device.pci_xe) &&
+	    igt_pm_get_runtime_usage(device.pci_xe) != 0)
+		return false;
+
+	switch (state) {
+	case IGT_ACPI_D3Hot:
+		igt_assert_eq(pci_device_cfg_read_u16(device.pci_xe,
+						      &val, 0xd4), 0);
+		return (val & 0x3) == 0x3;
+	case IGT_ACPI_D3Cold:
+		return igt_wait(igt_pm_get_acpi_real_d_state(device.pci_root) ==
+				IGT_ACPI_D3Cold, 10000, 100);
+	default:
+		igt_info("Invalid D3 State\n");
+		igt_assert(0);
+	}
+
+	return true;
+}
+
+static bool out_of_d3(device_t device, enum igt_acpi_d_state state)
+{
+	uint16_t val;
+
+	/* Runtime resume needs to be immediate action without any wait */
+	if (runtime_usage_available(device.pci_xe) &&
+	    igt_pm_get_runtime_usage(device.pci_xe) <= 0)
+		return false;
+
+	if (igt_get_runtime_pm_status() != IGT_RUNTIME_PM_STATUS_ACTIVE)
+		return false;
+
+	switch (state) {
+	case IGT_ACPI_D3Hot:
+		igt_assert_eq(pci_device_cfg_read_u16(device.pci_xe,
+						      &val, 0xd4), 0);
+		return (val & 0x3) == 0;
+	case IGT_ACPI_D3Cold:
+		return igt_pm_get_acpi_real_d_state(device.pci_root) ==
+			IGT_ACPI_D0;
+	default:
+		igt_info("Invalid D3 State\n");
+		igt_assert(0);
+	}
+
+	return true;
+}
+
+static void
+test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
+	  int n_engines, int n_execs, enum igt_suspend_state s_state,
+	  enum igt_acpi_d_state d_state)
+{
+	uint32_t vm;
+	uint64_t addr = 0x1a0000;
+	struct drm_xe_sync sync[2] = {
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 2,
+		.syncs = to_user_pointer(&sync),
+	};
+	uint32_t engines[MAX_N_ENGINES];
+	uint32_t bind_engines[MAX_N_ENGINES];
+	uint32_t syncobjs[MAX_N_ENGINES];
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data;
+	int i, b, rpm_usage;
+	bool check_rpm = (d_state == IGT_ACPI_D3Hot ||
+			  d_state == IGT_ACPI_D3Cold);
+
+	igt_assert(n_engines <= MAX_N_ENGINES);
+	igt_assert(n_execs > 0);
+
+	if (check_rpm)
+		igt_assert(in_d3(device, d_state));
+
+	vm = xe_vm_create(device.fd_xe, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+
+	if (check_rpm)
+		igt_assert(out_of_d3(device, d_state));
+
+	bo_size = sizeof(*data) * n_execs;
+	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(device.fd_xe),
+			xe_get_default_alignment(device.fd_xe));
+
+	if (check_rpm && runtime_usage_available(device.pci_xe))
+		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
+
+	bo = xe_bo_create(device.fd_xe, eci->gt_id, vm, bo_size);
+	data = xe_bo_map(device.fd_xe, bo, bo_size);
+
+	for (i = 0; i < n_engines; i++) {
+		engines[i] = xe_engine_create(device.fd_xe, vm, eci, 0);
+		bind_engines[i] = 0;
+		syncobjs[i] = syncobj_create(device.fd_xe, 0);
+	};
+
+	sync[0].handle = syncobj_create(device.fd_xe, 0);
+
+	xe_vm_bind_async(device.fd_xe, vm, bind_engines[0], bo, 0, addr,
+			 bo_size, sync, 1);
+
+	if (check_rpm && runtime_usage_available(device.pci_xe))
+		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) > rpm_usage);
+
+	for (i = 0; i < n_execs; i++) {
+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_addr = addr + batch_offset;
+		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
+		uint64_t sdi_addr = addr + sdi_offset;
+		int e = i % n_engines;
+
+		b = 0;
+		data[i].batch[b++] = MI_STORE_DWORD_IMM;
+		data[i].batch[b++] = sdi_addr;
+		data[i].batch[b++] = sdi_addr >> 32;
+		data[i].batch[b++] = 0xc0ffee;
+		data[i].batch[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+		sync[1].handle = syncobjs[e];
+
+		exec.engine_id = engines[e];
+		exec.address = batch_addr;
+
+		if (e != i)
+			syncobj_reset(device.fd_xe, &syncobjs[e], 1);
+
+		__xe_exec_assert(device.fd_xe, &exec);
+
+		igt_assert(syncobj_wait(device.fd_xe, &syncobjs[e], 1,
+					INT64_MAX, 0, NULL));
+		igt_assert_eq(data[i].data, 0xc0ffee);
+
+		if (i == n_execs / 2 && s_state != NO_SUSPEND)
+			igt_system_suspend_autoresume(s_state,
+						      SUSPEND_TEST_NONE);
+	}
+
+	igt_assert(syncobj_wait(device.fd_xe, &sync[0].handle, 1, INT64_MAX, 0,
+				NULL));
+
+	if (check_rpm && runtime_usage_available(device.pci_xe))
+		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
+
+	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+	xe_vm_unbind_async(device.fd_xe, vm, bind_engines[0], 0, addr,
+			   bo_size, sync, 1);
+	igt_assert(syncobj_wait(device.fd_xe, &sync[0].handle, 1, INT64_MAX, 0,
+NULL));
+
+	for (i = 0; i < n_execs; i++)
+		igt_assert_eq(data[i].data, 0xc0ffee);
+
+	syncobj_destroy(device.fd_xe, sync[0].handle);
+	for (i = 0; i < n_engines; i++) {
+		syncobj_destroy(device.fd_xe, syncobjs[i]);
+		xe_engine_destroy(device.fd_xe, engines[i]);
+		if (bind_engines[i])
+			xe_engine_destroy(device.fd_xe, bind_engines[i]);
+	}
+
+	munmap(data, bo_size);
+
+	gem_close(device.fd_xe, bo);
+
+	if (check_rpm && runtime_usage_available(device.pci_xe))
+		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) < rpm_usage);
+	if (check_rpm)
+		igt_assert(out_of_d3(device, d_state));
+
+	xe_vm_destroy(device.fd_xe, vm);
+
+	if (check_rpm)
+		igt_assert(in_d3(device, d_state));
+}
+
+igt_main
+{
+	struct drm_xe_engine_class_instance *hwe;
+	device_t device;
+	char d3cold_allowed[2];
+	const struct s_state {
+		const char *name;
+		enum igt_suspend_state state;
+	} s_states[] = {
+		{ "s2idle", SUSPEND_STATE_FREEZE },
+		{ "s3", SUSPEND_STATE_S3 },
+		{ "s4", SUSPEND_STATE_DISK },
+		{ NULL },
+	};
+	const struct d_state {
+		const char *name;
+		enum igt_acpi_d_state state;
+	} d_states[] = {
+		{ "d3hot", IGT_ACPI_D3Hot },
+		{ "d3cold", IGT_ACPI_D3Cold },
+		{ NULL },
+	};
+
+	igt_fixture {
+		memset(&device, 0, sizeof(device));
+		device.fd_xe = drm_open_driver(DRIVER_XE);
+		device.pci_xe = igt_device_get_pci_device(device.fd_xe);
+		device.pci_root = igt_device_get_pci_root_port(device.fd_xe);
+
+		xe_query_all(device.fd_xe);
+
+		/* Always perform initial once-basic exec checking for health */
+		for_each_hw_engine(hwe)
+			test_exec(device, hwe, 1, 1, NO_SUSPEND, NO_RPM);
+
+		get_d3cold_allowed(device.pci_xe, d3cold_allowed);
+		igt_assert(igt_setup_runtime_pm(device.fd_xe));
+	}
+
+	for (const struct s_state *s = s_states; s->name; s++) {
+		igt_subtest_f("%s-basic", s->name) {
+			igt_system_suspend_autoresume(s->state,
+						      SUSPEND_TEST_NONE);
+		}
+
+		igt_subtest_f("%s-basic-exec", s->name) {
+			for_each_hw_engine(hwe)
+				test_exec(device, hwe, 1, 2, s->state,
+					  NO_RPM);
+		}
+
+		igt_subtest_f("%s-exec-after", s->name) {
+			igt_system_suspend_autoresume(s->state,
+						      SUSPEND_TEST_NONE);
+			for_each_hw_engine(hwe)
+				test_exec(device, hwe, 1, 2, NO_SUSPEND,
+					  NO_RPM);
+		}
+
+		igt_subtest_f("%s-multiple-execs", s->name) {
+			for_each_hw_engine(hwe)
+				test_exec(device, hwe, 16, 32, s->state,
+					  NO_RPM);
+		}
+
+		for (const struct d_state *d = d_states; d->name; d++) {
+			igt_subtest_f("%s-%s-basic-exec", s->name, d->name) {
+				igt_assert(setup_d3(device, d->state));
+				for_each_hw_engine(hwe)
+					test_exec(device, hwe, 1, 2, s->state,
+						  NO_RPM);
+			}
+		}
+	}
+
+	for (const struct d_state *d = d_states; d->name; d++) {
+		igt_subtest_f("%s-basic", d->name) {
+			igt_assert(setup_d3(device, d->state));
+			igt_assert(in_d3(device, d->state));
+		}
+
+		igt_subtest_f("%s-basic-exec", d->name) {
+			igt_assert(setup_d3(device, d->state));
+			for_each_hw_engine(hwe)
+				test_exec(device, hwe, 1, 1,
+					  NO_SUSPEND, d->state);
+		}
+
+		igt_subtest_f("%s-multiple-execs", d->name) {
+			igt_assert(setup_d3(device, d->state));
+			for_each_hw_engine(hwe)
+				test_exec(device, hwe, 16, 32,
+					  NO_SUSPEND, d->state);
+		}
+	}
+
+	igt_fixture {
+		set_d3cold_allowed(device.pci_xe, d3cold_allowed);
+		igt_restore_runtime_pm();
+		close(device.fd_xe);
+	}
+}
diff --git a/tests/xe/xe_prime_self_import.c b/tests/xe/xe_prime_self_import.c
new file mode 100644
index 00000000..557fa3b0
--- /dev/null
+++ b/tests/xe/xe_prime_self_import.c
@@ -0,0 +1,462 @@
+/*
+ * Copyright © 2012-2013 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *    Daniel Vetter <daniel.vetter@ffwll.ch>
+ *    Matthew Brost <matthew.brost@intel.com>
+ */
+
+/*
+ * Testcase: Check whether prime import/export works on the same device
+ *
+ * ... but with different fds, i.e. the wayland usecase.
+ */
+
+#include "igt.h"
+#include <unistd.h>
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <fcntl.h>
+#include <inttypes.h>
+#include <errno.h>
+#include <sys/stat.h>
+#include <sys/ioctl.h>
+#include <pthread.h>
+
+#include "drm.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
+IGT_TEST_DESCRIPTION("Check whether prime import/export works on the same"
+		     " device... but with different fds.");
+
+#define BO_SIZE (16*1024)
+
+static char counter;
+volatile int pls_die = 0;
+
+static void
+check_bo(int fd1, uint32_t handle1, int fd2, uint32_t handle2)
+{
+	char *ptr1, *ptr2;
+	int i;
+
+
+	ptr1 = xe_bo_map(fd1, handle1, BO_SIZE);
+	ptr2 = xe_bo_map(fd2, handle2, BO_SIZE);
+
+	/* TODO: Export fence for both and wait on them */
+	usleep(1000);
+
+	/* check whether it's still our old object first. */
+	for (i = 0; i < BO_SIZE; i++) {
+		igt_assert(ptr1[i] == counter);
+		igt_assert(ptr2[i] == counter);
+	}
+
+	counter++;
+
+	memset(ptr1, counter, BO_SIZE);
+	igt_assert(memcmp(ptr1, ptr2, BO_SIZE) == 0);
+
+	munmap(ptr1, BO_SIZE);
+	munmap(ptr2, BO_SIZE);
+}
+
+static void test_with_fd_dup(void)
+{
+	int fd1, fd2;
+	uint32_t handle, handle_import;
+	int dma_buf_fd1, dma_buf_fd2;
+
+	counter = 0;
+
+	fd1 = drm_open_driver(DRIVER_XE);
+	fd2 = drm_open_driver(DRIVER_XE);
+
+	handle = xe_bo_create(fd1, 0, 0, BO_SIZE);
+
+	dma_buf_fd1 = prime_handle_to_fd(fd1, handle);
+	gem_close(fd1, handle);
+
+	dma_buf_fd2 = dup(dma_buf_fd1);
+	close(dma_buf_fd1);
+	handle_import = prime_fd_to_handle(fd2, dma_buf_fd2);
+	check_bo(fd2, handle_import, fd2, handle_import);
+
+	close(dma_buf_fd2);
+	check_bo(fd2, handle_import, fd2, handle_import);
+
+	close(fd1);
+	close(fd2);
+}
+
+static void test_with_two_bos(void)
+{
+	int fd1, fd2;
+	uint32_t handle1, handle2, handle_import;
+	int dma_buf_fd;
+
+	counter = 0;
+
+	fd1 = drm_open_driver(DRIVER_XE);
+	fd2 = drm_open_driver(DRIVER_XE);
+
+	handle1 = xe_bo_create(fd1, 0, 0, BO_SIZE);
+	handle2 = xe_bo_create(fd1, 0, 0, BO_SIZE);
+
+	dma_buf_fd = prime_handle_to_fd(fd1, handle1);
+	handle_import = prime_fd_to_handle(fd2, dma_buf_fd);
+
+	close(dma_buf_fd);
+	gem_close(fd1, handle1);
+
+	dma_buf_fd = prime_handle_to_fd(fd1, handle2);
+	handle_import = prime_fd_to_handle(fd2, dma_buf_fd);
+	check_bo(fd1, handle2, fd2, handle_import);
+
+	gem_close(fd1, handle2);
+	close(dma_buf_fd);
+
+	check_bo(fd2, handle_import, fd2, handle_import);
+
+	close(fd1);
+	close(fd2);
+}
+
+static void test_with_one_bo_two_files(void)
+{
+	int fd1, fd2;
+	uint32_t handle_import, handle_open, handle_orig, flink_name;
+	int dma_buf_fd1, dma_buf_fd2;
+
+	fd1 = drm_open_driver(DRIVER_XE);
+	fd2 = drm_open_driver(DRIVER_XE);
+
+	handle_orig = xe_bo_create(fd1, 0, 0, BO_SIZE);
+	dma_buf_fd1 = prime_handle_to_fd(fd1, handle_orig);
+
+	flink_name = gem_flink(fd1, handle_orig);
+	handle_open = gem_open(fd2, flink_name);
+
+	dma_buf_fd2 = prime_handle_to_fd(fd2, handle_open);
+	handle_import = prime_fd_to_handle(fd2, dma_buf_fd2);
+
+	/* dma-buf self importing an flink bo should give the same handle */
+	igt_assert_eq_u32(handle_import, handle_open);
+
+	close(fd1);
+	close(fd2);
+	close(dma_buf_fd1);
+	close(dma_buf_fd2);
+}
+
+static void test_with_one_bo(void)
+{
+	int fd1, fd2;
+	uint32_t handle, handle_import1, handle_import2, handle_selfimport;
+	int dma_buf_fd;
+
+	fd1 = drm_open_driver(DRIVER_XE);
+	fd2 = drm_open_driver(DRIVER_XE);
+
+	handle = xe_bo_create(fd1, 0, 0, BO_SIZE);
+
+	dma_buf_fd = prime_handle_to_fd(fd1, handle);
+	handle_import1 = prime_fd_to_handle(fd2, dma_buf_fd);
+
+	check_bo(fd1, handle, fd2, handle_import1);
+
+	/* reimport should give us the same handle so that userspace can check
+	 * whether it has that bo already somewhere. */
+	handle_import2 = prime_fd_to_handle(fd2, dma_buf_fd);
+	igt_assert_eq_u32(handle_import1, handle_import2);
+
+	/* Same for re-importing on the exporting fd. */
+	handle_selfimport = prime_fd_to_handle(fd1, dma_buf_fd);
+	igt_assert_eq_u32(handle, handle_selfimport);
+
+	/* close dma_buf, check whether nothing disappears. */
+	close(dma_buf_fd);
+	check_bo(fd1, handle, fd2, handle_import1);
+
+	gem_close(fd1, handle);
+	check_bo(fd2, handle_import1, fd2, handle_import1);
+
+	/* re-import into old exporter */
+	dma_buf_fd = prime_handle_to_fd(fd2, handle_import1);
+	/* but drop all references to the obj in between */
+	gem_close(fd2, handle_import1);
+	handle = prime_fd_to_handle(fd1, dma_buf_fd);
+	handle_import1 = prime_fd_to_handle(fd2, dma_buf_fd);
+	check_bo(fd1, handle, fd2, handle_import1);
+
+	/* Completely rip out exporting fd. */
+	close(fd1);
+	check_bo(fd2, handle_import1, fd2, handle_import1);
+}
+
+static void *thread_fn_reimport_vs_close(void *p)
+{
+	struct drm_gem_close close_bo;
+	int *fds = p;
+	int fd = fds[0];
+	int dma_buf_fd = fds[1];
+	uint32_t handle;
+
+	while (!pls_die) {
+		handle = prime_fd_to_handle(fd, dma_buf_fd);
+
+		close_bo.handle = handle;
+		ioctl(fd, DRM_IOCTL_GEM_CLOSE, &close_bo);
+	}
+
+	return (void *)0;
+}
+
+static void test_reimport_close_race(void)
+{
+	pthread_t *threads;
+	int r, i, num_threads;
+	int fds[2];
+	int obj_count;
+	void *status;
+	uint32_t handle;
+	int fake;
+
+	/* Allocate exit handler fds in here so that we dont screw
+	 * up the counts */
+	fake = drm_open_driver(DRIVER_XE);
+
+	/* TODO: Read object count */
+	obj_count = 0;
+
+	num_threads = sysconf(_SC_NPROCESSORS_ONLN);
+
+	threads = calloc(num_threads, sizeof(pthread_t));
+
+	fds[0] = drm_open_driver(DRIVER_XE);
+
+	handle = xe_bo_create(fds[0], 0, 0, BO_SIZE);
+
+	fds[1] = prime_handle_to_fd(fds[0], handle);
+
+	for (i = 0; i < num_threads; i++) {
+		r = pthread_create(&threads[i], NULL,
+				   thread_fn_reimport_vs_close,
+				   (void *)(uintptr_t)fds);
+		igt_assert_eq(r, 0);
+	}
+
+	sleep(5);
+
+	pls_die = 1;
+
+	for (i = 0;  i < num_threads; i++) {
+		pthread_join(threads[i], &status);
+		igt_assert(status == 0);
+	}
+
+	close(fds[0]);
+	close(fds[1]);
+
+	/* TODO: Read object count */
+	obj_count = 0;
+
+	igt_info("leaked %i objects\n", obj_count);
+
+	close(fake);
+
+	igt_assert_eq(obj_count, 0);
+}
+
+static void *thread_fn_export_vs_close(void *p)
+{
+	struct drm_prime_handle prime_h2f;
+	struct drm_gem_close close_bo;
+	int fd = (uintptr_t)p;
+	uint32_t handle;
+
+	while (!pls_die) {
+		/* We want to race gem close against prime export on handle one.*/
+		handle = xe_bo_create(fd, 0, 0, 4096);
+		if (handle != 1)
+			gem_close(fd, handle);
+
+		/* raw ioctl since we expect this to fail */
+
+		/* WTF: for gem_flink_race I've unconditionally used handle == 1
+		 * here, but with prime it seems to help a _lot_ to use
+		 * something more random. */
+		prime_h2f.handle = 1;
+		prime_h2f.flags = DRM_CLOEXEC;
+		prime_h2f.fd = -1;
+
+		ioctl(fd, DRM_IOCTL_PRIME_HANDLE_TO_FD, &prime_h2f);
+
+		close_bo.handle = 1;
+		ioctl(fd, DRM_IOCTL_GEM_CLOSE, &close_bo);
+
+		close(prime_h2f.fd);
+	}
+
+	return (void *)0;
+}
+
+static void test_export_close_race(void)
+{
+	pthread_t *threads;
+	int r, i, num_threads;
+	int fd;
+	int obj_count;
+	void *status;
+	int fake;
+
+	num_threads = sysconf(_SC_NPROCESSORS_ONLN);
+
+	threads = calloc(num_threads, sizeof(pthread_t));
+
+	/* Allocate exit handler fds in here so that we dont screw
+	 * up the counts */
+	fake = drm_open_driver(DRIVER_XE);
+
+	/* TODO: Read object count */
+	obj_count = 0;
+
+	fd = drm_open_driver(DRIVER_XE);
+
+	for (i = 0; i < num_threads; i++) {
+		r = pthread_create(&threads[i], NULL,
+				   thread_fn_export_vs_close,
+				   (void *)(uintptr_t)fd);
+		igt_assert_eq(r, 0);
+	}
+
+	sleep(5);
+
+	pls_die = 1;
+
+	for (i = 0;  i < num_threads; i++) {
+		pthread_join(threads[i], &status);
+		igt_assert(status == 0);
+	}
+
+	close(fd);
+
+	/* TODO: Read object count */
+	obj_count = 0;
+
+	igt_info("leaked %i objects\n", obj_count);
+
+	close(fake);
+
+	igt_assert_eq(obj_count, 0);
+}
+
+static void test_llseek_size(void)
+{
+	int fd, i;
+	uint32_t handle;
+	int dma_buf_fd;
+
+	counter = 0;
+
+	fd = drm_open_driver(DRIVER_XE);
+
+
+	for (i = 0; i < 10; i++) {
+		int bufsz = 4096 << i;
+
+		handle = xe_bo_create(fd, 0, 0, bufsz);
+		dma_buf_fd = prime_handle_to_fd(fd, handle);
+
+		gem_close(fd, handle);
+
+		igt_assert(prime_get_size(dma_buf_fd) == bufsz);
+
+		close(dma_buf_fd);
+	}
+
+	close(fd);
+}
+
+static void test_llseek_bad(void)
+{
+	int fd;
+	uint32_t handle;
+	int dma_buf_fd;
+
+	counter = 0;
+
+	fd = drm_open_driver(DRIVER_XE);
+
+
+	handle = xe_bo_create(fd, 0, 0, BO_SIZE);
+	dma_buf_fd = prime_handle_to_fd(fd, handle);
+
+	gem_close(fd, handle);
+
+	igt_require(lseek(dma_buf_fd, 0, SEEK_END) >= 0);
+
+	igt_assert(lseek(dma_buf_fd, -1, SEEK_END) == -1 && errno == EINVAL);
+	igt_assert(lseek(dma_buf_fd, 1, SEEK_SET) == -1 && errno == EINVAL);
+	igt_assert(lseek(dma_buf_fd, BO_SIZE, SEEK_SET) == -1 && errno == EINVAL);
+	igt_assert(lseek(dma_buf_fd, BO_SIZE + 1, SEEK_SET) == -1 && errno == EINVAL);
+	igt_assert(lseek(dma_buf_fd, BO_SIZE - 1, SEEK_SET) == -1 && errno == EINVAL);
+
+	close(dma_buf_fd);
+
+	close(fd);
+}
+
+igt_main
+{
+	struct {
+		const char *name;
+		void (*fn)(void);
+	} tests[] = {
+		{ "basic-with_one_bo", test_with_one_bo },
+		{ "basic-with_one_bo_two_files", test_with_one_bo_two_files },
+		{ "basic-with_two_bos", test_with_two_bos },
+		{ "basic-with_fd_dup", test_with_fd_dup },
+		{ "export-vs-gem_close-race", test_export_close_race },
+		{ "reimport-vs-gem_close-race", test_reimport_close_race },
+		{ "basic-llseek-size", test_llseek_size },
+		{ "basic-llseek-bad", test_llseek_bad },
+	};
+	int i;
+	int fd;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		xe_query_all(fd);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(tests); i++) {
+		igt_subtest(tests[i].name)
+			tests[i].fn();
+	}
+
+	igt_fixture
+		close(fd);
+}
diff --git a/tests/xe/xe_query.c b/tests/xe/xe_query.c
new file mode 100644
index 00000000..906d5495
--- /dev/null
+++ b/tests/xe/xe_query.c
@@ -0,0 +1,431 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#include <string.h>
+
+#include "igt.h"
+#include "xe_drm.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include "intel_hwconfig_types.h"
+
+void dump_hex(void *buffer, int len);
+void dump_hex_debug(void *buffer, int len);
+const char *get_hwconfig_name(int param);
+const char *get_topo_name(int value);
+void process_hwconfig(void *data, uint32_t len);
+
+void dump_hex(void *buffer, int len)
+{
+	unsigned char *data = (unsigned char*)buffer;
+	int k = 0;
+	for (int i = 0; i < len; i++) {
+		igt_info(" %02x", data[i]);
+		if (++k > 15) {
+			k = 0;
+			igt_info("\n");
+		}
+	}
+	if (k)
+		igt_info("\n");
+}
+
+void dump_hex_debug(void *buffer, int len)
+{
+	if (igt_log_level == IGT_LOG_DEBUG)
+		dump_hex(buffer, len);
+}
+
+/* Please reflect intel_hwconfig_types.h changes below
+ * static_asserti_value + get_hwconfig_name
+ *   Thanks :-) */
+static_assert(INTEL_HWCONFIG_MAX_MESH_URB_ENTRIES+1 == __INTEL_HWCONFIG_KEY_LIMIT);
+
+#define CASE_STRINGIFY(A) case INTEL_HWCONFIG_##A: return #A;
+const char* get_hwconfig_name(int param)
+{
+	switch(param) {
+	CASE_STRINGIFY(MAX_SLICES_SUPPORTED);
+	CASE_STRINGIFY(MAX_DUAL_SUBSLICES_SUPPORTED);
+	CASE_STRINGIFY(MAX_NUM_EU_PER_DSS);
+	CASE_STRINGIFY(NUM_PIXEL_PIPES);
+	CASE_STRINGIFY(DEPRECATED_MAX_NUM_GEOMETRY_PIPES);
+	CASE_STRINGIFY(DEPRECATED_L3_CACHE_SIZE_IN_KB);
+	CASE_STRINGIFY(DEPRECATED_L3_BANK_COUNT);
+	CASE_STRINGIFY(L3_CACHE_WAYS_SIZE_IN_BYTES);
+	CASE_STRINGIFY(L3_CACHE_WAYS_PER_SECTOR);
+	CASE_STRINGIFY(MAX_MEMORY_CHANNELS);
+	CASE_STRINGIFY(MEMORY_TYPE);
+	CASE_STRINGIFY(CACHE_TYPES);
+	CASE_STRINGIFY(LOCAL_MEMORY_PAGE_SIZES_SUPPORTED);
+	CASE_STRINGIFY(DEPRECATED_SLM_SIZE_IN_KB);
+	CASE_STRINGIFY(NUM_THREADS_PER_EU);
+	CASE_STRINGIFY(TOTAL_VS_THREADS);
+	CASE_STRINGIFY(TOTAL_GS_THREADS);
+	CASE_STRINGIFY(TOTAL_HS_THREADS);
+	CASE_STRINGIFY(TOTAL_DS_THREADS);
+	CASE_STRINGIFY(TOTAL_VS_THREADS_POCS);
+	CASE_STRINGIFY(TOTAL_PS_THREADS);
+	CASE_STRINGIFY(DEPRECATED_MAX_FILL_RATE);
+	CASE_STRINGIFY(MAX_RCS);
+	CASE_STRINGIFY(MAX_CCS);
+	CASE_STRINGIFY(MAX_VCS);
+	CASE_STRINGIFY(MAX_VECS);
+	CASE_STRINGIFY(MAX_COPY_CS);
+	CASE_STRINGIFY(DEPRECATED_URB_SIZE_IN_KB);
+	CASE_STRINGIFY(MIN_VS_URB_ENTRIES);
+	CASE_STRINGIFY(MAX_VS_URB_ENTRIES);
+	CASE_STRINGIFY(MIN_PCS_URB_ENTRIES);
+	CASE_STRINGIFY(MAX_PCS_URB_ENTRIES);
+	CASE_STRINGIFY(MIN_HS_URB_ENTRIES);
+	CASE_STRINGIFY(MAX_HS_URB_ENTRIES);
+	CASE_STRINGIFY(MIN_GS_URB_ENTRIES);
+	CASE_STRINGIFY(MAX_GS_URB_ENTRIES);
+	CASE_STRINGIFY(MIN_DS_URB_ENTRIES);
+	CASE_STRINGIFY(MAX_DS_URB_ENTRIES);
+	CASE_STRINGIFY(PUSH_CONSTANT_URB_RESERVED_SIZE);
+	CASE_STRINGIFY(POCS_PUSH_CONSTANT_URB_RESERVED_SIZE);
+	CASE_STRINGIFY(URB_REGION_ALIGNMENT_SIZE_IN_BYTES);
+	CASE_STRINGIFY(URB_ALLOCATION_SIZE_UNITS_IN_BYTES);
+	CASE_STRINGIFY(MAX_URB_SIZE_CCS_IN_BYTES);
+	CASE_STRINGIFY(VS_MIN_DEREF_BLOCK_SIZE_HANDLE_COUNT);
+	CASE_STRINGIFY(DS_MIN_DEREF_BLOCK_SIZE_HANDLE_COUNT);
+	CASE_STRINGIFY(NUM_RT_STACKS_PER_DSS);
+	CASE_STRINGIFY(MAX_URB_STARTING_ADDRESS);
+	CASE_STRINGIFY(MIN_CS_URB_ENTRIES);
+	CASE_STRINGIFY(MAX_CS_URB_ENTRIES);
+	CASE_STRINGIFY(L3_ALLOC_PER_BANK_URB);
+	CASE_STRINGIFY(L3_ALLOC_PER_BANK_REST);
+	CASE_STRINGIFY(L3_ALLOC_PER_BANK_DC);
+	CASE_STRINGIFY(L3_ALLOC_PER_BANK_RO);
+	CASE_STRINGIFY(L3_ALLOC_PER_BANK_Z);
+	CASE_STRINGIFY(L3_ALLOC_PER_BANK_COLOR);
+	CASE_STRINGIFY(L3_ALLOC_PER_BANK_UNIFIED_TILE_CACHE);
+	CASE_STRINGIFY(L3_ALLOC_PER_BANK_COMMAND_BUFFER);
+	CASE_STRINGIFY(L3_ALLOC_PER_BANK_RW);
+	CASE_STRINGIFY(MAX_NUM_L3_CONFIGS);
+	CASE_STRINGIFY(BINDLESS_SURFACE_OFFSET_BIT_COUNT);
+	CASE_STRINGIFY(RESERVED_CCS_WAYS);
+	CASE_STRINGIFY(CSR_SIZE_IN_MB);
+	CASE_STRINGIFY(GEOMETRY_PIPES_PER_SLICE);
+	CASE_STRINGIFY(L3_BANK_SIZE_IN_KB);
+	CASE_STRINGIFY(SLM_SIZE_PER_DSS);
+	CASE_STRINGIFY(MAX_PIXEL_FILL_RATE_PER_SLICE);
+	CASE_STRINGIFY(MAX_PIXEL_FILL_RATE_PER_DSS);
+	CASE_STRINGIFY(URB_SIZE_PER_SLICE_IN_KB);
+	CASE_STRINGIFY(URB_SIZE_PER_L3_BANK_COUNT_IN_KB);
+	CASE_STRINGIFY(MAX_SUBSLICE);
+	CASE_STRINGIFY(MAX_EU_PER_SUBSLICE);
+	CASE_STRINGIFY(RAMBO_L3_BANK_SIZE_IN_KB);
+	CASE_STRINGIFY(SLM_SIZE_PER_SS_IN_KB);
+	CASE_STRINGIFY(NUM_HBM_STACKS_PER_TILE);
+	CASE_STRINGIFY(NUM_CHANNELS_PER_HBM_STACK);
+	CASE_STRINGIFY(HBM_CHANNEL_WIDTH_IN_BYTES);
+	CASE_STRINGIFY(MIN_TASK_URB_ENTRIES);
+	CASE_STRINGIFY(MAX_TASK_URB_ENTRIES);
+	CASE_STRINGIFY(MIN_MESH_URB_ENTRIES);
+	CASE_STRINGIFY(MAX_MESH_URB_ENTRIES);
+	}
+	return "?? Please fix "__FILE__;
+}
+#undef CASE_STRINGIFY
+
+void process_hwconfig(void *data, uint32_t len)
+{
+
+	uint32_t *d = (uint32_t*)data;
+	uint32_t l = len / 4;
+	uint32_t pos = 0;
+	while (pos + 2 < l) {
+		if (d[pos+1] == 1) {
+			igt_info("%-37s (%3d) L:%d V: %d/0x%x\n",
+				 get_hwconfig_name(d[pos]), d[pos], d[pos+1],
+				 d[pos+2], d[pos+2]);
+		} else {
+			igt_info("%-37s (%3d) L:%d\n", get_hwconfig_name(d[pos]), d[pos], d[pos+1]);
+			dump_hex(&d[pos+2], d[pos+1]);
+		}
+		pos += 2 + d[pos+1];
+	}
+}
+
+
+const char *get_topo_name(int value)
+{
+	switch(value) {
+	case XE_TOPO_DSS_GEOMETRY: return "DSS_GEOMETRY";
+	case XE_TOPO_DSS_COMPUTE: return "DSS_COMPUTE";
+	case XE_TOPO_EU_PER_DSS: return "EU_PER_DSS";
+	}
+	return "??";
+}
+
+static void
+test_query_engines(int fd)
+{
+	struct drm_xe_engine_class_instance *hwe;
+	int i = 0;
+
+	xe_query_engines(fd);
+	for_each_hw_engine(hwe) {
+		igt_assert(hwe);
+		igt_info("engine %d: %s\n", i++,
+			xe_engine_class_string(hwe->engine_class));
+	}
+
+	igt_assert(i > 0);
+}
+
+static void
+test_query_mem_usage(int fd)
+{
+	struct drm_xe_query_mem_usage *mem_usage;
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_MEM_USAGE,
+		.size = 0,
+		.data = 0,
+	};
+	int i;
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+	igt_assert_neq(query.size, 0);
+
+	mem_usage = malloc(query.size);
+	igt_assert(mem_usage);
+
+	query.data = to_user_pointer(mem_usage);
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	for (i = 0; i < mem_usage->num_regions; i++) {
+		igt_info("mem region %d: %s\t%#llx / %#llx\n", i,
+			mem_usage->regions[i].mem_class ==
+			XE_MEM_REGION_CLASS_SYSMEM ? "SYSMEM"
+			:mem_usage->regions[i].mem_class ==
+			XE_MEM_REGION_CLASS_VRAM ? "VRAM" : "?",
+			mem_usage->regions[i].used,
+			mem_usage->regions[i].total_size
+		);
+		igt_info("min_page_size=0x%x, max_page_size=0x%x\n",
+		       mem_usage->regions[i].min_page_size,
+		       mem_usage->regions[i].max_page_size);
+	}
+	dump_hex_debug(mem_usage, query.size);
+	free(mem_usage);
+}
+
+static void
+test_query_gts(int fd)
+{
+	struct drm_xe_query_gts *gts;
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_GTS,
+		.size = 0,
+		.data = 0,
+	};
+	int i;
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+	igt_assert_neq(query.size, 0);
+
+	gts = malloc(query.size);
+	igt_assert(gts);
+
+	query.data = to_user_pointer(gts);
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	for (i = 0; i < gts->num_gt; i++) {
+		igt_info("type: %d\n", gts->gts[i].type);
+		igt_info("instance: %d\n", gts->gts[i].instance);
+		igt_info("clock_freq: %u\n", gts->gts[i].clock_freq);
+		igt_info("features: 0x%016llx\n", gts->gts[i].features);
+		igt_info("native_mem_regions: 0x%016llx\n",
+		       gts->gts[i].native_mem_regions);
+		igt_info("slow_mem_regions: 0x%016llx\n",
+		       gts->gts[i].slow_mem_regions);
+		igt_info("inaccessible_mem_regions: 0x%016llx\n",
+		       gts->gts[i].inaccessible_mem_regions);
+	}
+}
+
+static void
+test_query_gt_topology(int fd)
+{
+	struct drm_xe_query_topology_mask *topology;
+	int pos = 0;
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_GT_TOPOLOGY,
+		.size = 0,
+		.data = 0,
+	};
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+	igt_assert_neq(query.size, 0);
+
+	topology = malloc(query.size);
+	igt_assert(topology);
+
+	query.data = to_user_pointer(topology);
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	igt_info("size: %d\n", query.size);
+	dump_hex_debug(topology, query.size);
+
+	while (query.size >= sizeof(struct drm_xe_query_topology_mask)) {
+		struct drm_xe_query_topology_mask *topo = (struct drm_xe_query_topology_mask*)((unsigned char*)topology + pos);
+		int sz = sizeof(struct drm_xe_query_topology_mask) + topo->num_bytes;
+		igt_info(" gt_id: %2d type: %-12s (%d) n:%d [%d] ", topo->gt_id,
+			 get_topo_name(topo->type), topo->type, topo->num_bytes, sz);
+		for (int j=0; j< topo->num_bytes; j++)
+			igt_info(" %02x", topo->mask[j]);
+		igt_info("\n");
+		query.size -= sz;
+		pos += sz;
+	}
+
+	free(topology);
+}
+
+static void
+test_query_config(int fd)
+{
+	struct drm_xe_query_config *config;
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_CONFIG,
+		.size = 0,
+		.data = 0,
+	};
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+	igt_assert_neq(query.size, 0);
+
+	config = malloc(query.size);
+	igt_assert(config);
+
+	query.data = to_user_pointer(config);
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	igt_assert(config->num_params > 0);
+
+	igt_info("XE_QUERY_CONFIG_REV_AND_DEVICE_ID\t%#llx\n",
+		config->info[XE_QUERY_CONFIG_REV_AND_DEVICE_ID]);
+	igt_info("  REV_ID\t\t\t\t%#llx\n",
+		config->info[XE_QUERY_CONFIG_REV_AND_DEVICE_ID] >> 16);
+	igt_info("  DEVICE_ID\t\t\t\t%#llx\n",
+		config->info[XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff);
+	igt_info("XE_QUERY_CONFIG_FLAGS\t\t\t%#llx\n",
+		config->info[XE_QUERY_CONFIG_FLAGS]);
+	igt_info("  XE_QUERY_CONFIG_FLAGS_HAS_VRAM\t%s\n",
+		config->info[XE_QUERY_CONFIG_FLAGS] & 
+		XE_QUERY_CONFIG_FLAGS_HAS_VRAM ? "ON":"OFF");
+	igt_info("  XE_QUERY_CONFIG_FLAGS_USE_GUC\t\t%s\n",
+		config->info[XE_QUERY_CONFIG_FLAGS] & 
+		XE_QUERY_CONFIG_FLAGS_USE_GUC ? "ON":"OFF");
+	igt_info("XE_QUERY_CONFIG_MIN_ALIGNEMENT\t\t%#llx\n",
+		config->info[XE_QUERY_CONFIG_MIN_ALIGNEMENT]);
+	igt_info("XE_QUERY_CONFIG_VA_BITS\t\t\t%llu\n",
+		config->info[XE_QUERY_CONFIG_VA_BITS]);
+	igt_info("XE_QUERY_CONFIG_GT_COUNT\t\t%llu\n",
+		config->info[XE_QUERY_CONFIG_GT_COUNT]);
+	igt_info("XE_QUERY_CONFIG_MEM_REGION_COUNT\t%llu\n",
+		config->info[XE_QUERY_CONFIG_MEM_REGION_COUNT]);
+	dump_hex_debug(config, query.size);
+
+	free(config);
+}
+
+static void
+test_query_hwconfig(int fd)
+{
+	void *hwconfig;
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_HWCONFIG,
+		.size = 0,
+		.data = 0,
+	};
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	igt_info("HWCONFIG_SIZE\t%u\n", query.size);
+	if (!query.size)
+		return;
+
+	hwconfig = malloc(query.size);
+	igt_assert(hwconfig);
+
+	query.data = to_user_pointer(hwconfig);
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	dump_hex_debug(hwconfig, query.size);
+	process_hwconfig(hwconfig, query.size);
+
+	free(hwconfig);
+}
+
+static void
+test_query_invalid_query(int fd)
+{
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = UINT32_MAX,
+		.size = 0,
+		.data = 0,
+	};
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), -1);
+}
+
+static void
+test_query_invalid_size(int fd)
+{
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_CONFIG,
+		.size = UINT32_MAX,
+		.data = 0,
+	};
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), -1);
+}
+
+igt_main
+{
+	int xe;
+
+	igt_fixture {
+		xe = drm_open_driver(DRIVER_XE);
+	}
+
+	igt_subtest("query-engines")
+		test_query_engines(xe);
+
+	igt_subtest("query-mem-usage")
+		test_query_mem_usage(xe);
+
+	igt_subtest("query-gts")
+		test_query_gts(xe);
+
+	igt_subtest("query-config")
+		test_query_config(xe);
+
+	igt_subtest("query-hwconfig")
+		test_query_hwconfig(xe);
+
+	igt_subtest("query-topology")
+		test_query_gt_topology(xe);
+
+	igt_subtest("query-invalid-query")
+		test_query_invalid_query(xe);
+
+	igt_subtest("query-invalid-size")
+		test_query_invalid_size(xe);
+
+	igt_fixture
+		close(xe);
+}
diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
new file mode 100644
index 00000000..32c40474
--- /dev/null
+++ b/tests/xe/xe_vm.c
@@ -0,0 +1,1577 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include "igt.h"
+#include "lib/igt_syncobj.h"
+#include "lib/intel_reg.h"
+#include "xe_drm.h"
+
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include "xe/xe_spin.h"
+#include <string.h>
+
+static uint32_t
+addr_low(uint64_t addr)
+{
+	return addr;
+}
+
+static uint32_t
+addr_high(uint64_t addr)
+{
+	igt_assert_eq(addr >> 48, 0);
+	return (int64_t)(addr << 16) >> 48;
+}
+
+static uint32_t
+hash_addr(uint64_t addr)
+{
+	return (addr * 7229) ^ ((addr >> 32) * 5741);
+}
+
+static void
+write_dwords(int fd, uint32_t vm, int n_dwords, uint64_t *addrs)
+{
+	uint32_t batch_size, batch_bo, *batch_map, engine;
+	uint64_t batch_addr = 0x1a0000;
+	int i, b = 0;
+
+	batch_size = (n_dwords * 4 + 1) * sizeof(uint32_t);
+	batch_size = ALIGN(batch_size + xe_cs_prefetch_size(fd), 4096);
+	batch_bo = xe_bo_create(fd, 0, vm, batch_size);
+	batch_map = xe_bo_map(fd, batch_bo, batch_size);
+
+	for (i = 0; i < n_dwords; i++) {
+		/* None of the addresses can land in our batch */
+		igt_assert(addrs[i] + sizeof(uint32_t) <= batch_addr ||
+			   batch_addr + batch_size <= addrs[i]);
+
+		batch_map[b++] = MI_STORE_DWORD_IMM;
+		batch_map[b++] = addr_low(addrs[i]);
+		batch_map[b++] = addr_high(addrs[i]);
+		batch_map[b++] = hash_addr(addrs[i]);
+
+	}
+	batch_map[b++] = MI_BATCH_BUFFER_END;
+	igt_assert_lte(&batch_map[b] - batch_map, batch_size);
+	munmap(batch_map, batch_size);
+
+	xe_vm_bind_sync(fd, vm, batch_bo, 0, batch_addr, batch_size);
+	engine = xe_engine_create_class(fd, vm, DRM_XE_ENGINE_CLASS_COPY);
+	xe_exec_wait(fd, engine, batch_addr);
+	xe_vm_unbind_sync(fd, vm, 0, batch_addr, batch_size);
+
+	gem_close(fd, batch_bo);
+	xe_engine_destroy(fd, engine);
+}
+
+static void
+test_scratch(int fd)
+{
+	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_SCRATCH_PAGE, 0);
+	uint64_t addrs[] = {
+		0x000000000000ull,
+		0x7ffdb86402d8ull,
+		0x7ffffffffffcull,
+		0x800000000000ull,
+		0x3ffdb86402d8ull,
+		0xfffffffffffcull,
+	};
+
+	write_dwords(fd, vm, ARRAY_SIZE(addrs), addrs);
+
+	xe_vm_destroy(fd, vm);
+}
+
+static void
+__test_bind_one_bo(int fd, uint32_t vm, int n_addrs, uint64_t *addrs)
+{
+	uint32_t bo, bo_size = 4096;
+	uint32_t *vms;
+	void *map;
+	int i;
+
+	if (!vm) {
+		vms = malloc(sizeof(*vms) * n_addrs);
+		igt_assert(vms);
+	}
+	bo = xe_bo_create(fd, 0, vm, bo_size);
+	map = xe_bo_map(fd, bo, bo_size);
+	memset(map, 0, bo_size);
+
+	for (i = 0; i < n_addrs; i++) {
+		uint64_t bind_addr = addrs[i] & ~(uint64_t)(bo_size - 1);
+
+		if (!vm)
+			vms[i] = xe_vm_create(fd, DRM_XE_VM_CREATE_SCRATCH_PAGE,
+					      0);
+		igt_debug("Binding addr %"PRIx64"\n", addrs[i]);
+		xe_vm_bind_sync(fd, vm ? vm : vms[i], bo, 0,
+				bind_addr, bo_size);
+	}
+
+	if (vm)
+		write_dwords(fd, vm, n_addrs, addrs);
+	else
+		for (i = 0; i < n_addrs; i++)
+			write_dwords(fd, vms[i], 1, addrs + i);
+
+	for (i = 0; i < n_addrs; i++) {
+		uint32_t *dw = map + (addrs[i] & (bo_size - 1));
+		uint64_t bind_addr = addrs[i] & ~(uint64_t)(bo_size - 1);
+
+		igt_debug("Testing addr %"PRIx64"\n", addrs[i]);
+		igt_assert_eq(*dw, hash_addr(addrs[i]));
+
+		xe_vm_unbind_sync(fd, vm ? vm : vms[i], 0,
+				  bind_addr, bo_size);
+
+		/* clear dw, to ensure same execbuf after unbind fails to write */
+		*dw = 0;
+	}
+
+	if (vm)
+		write_dwords(fd, vm, n_addrs, addrs);
+	else
+		for (i = 0; i < n_addrs; i++)
+			write_dwords(fd, vms[i], 1, addrs + i);
+
+	for (i = 0; i < n_addrs; i++) {
+		uint32_t *dw = map + (addrs[i] & (bo_size - 1));
+
+		igt_debug("Testing unbound addr %"PRIx64"\n", addrs[i]);
+		igt_assert_eq(*dw, 0);
+	}
+
+	munmap(map, bo_size);
+
+	gem_close(fd, bo);
+	if (vm) {
+		xe_vm_destroy(fd, vm);
+	} else {
+		for (i = 0; i < n_addrs; i++)
+			xe_vm_destroy(fd, vms[i]);
+		free(vms);
+	}
+}
+
+static void
+test_bind_once(int fd)
+{
+	uint64_t addr = 0x7ffdb86402d8ull;
+
+	__test_bind_one_bo(fd,
+			   xe_vm_create(fd, DRM_XE_VM_CREATE_SCRATCH_PAGE, 0),
+			   1, &addr);
+}
+
+static void
+test_bind_one_bo_many_times(int fd)
+{
+	uint64_t addrs[] = {
+		0x000000000000ull,
+		0x0000b86402d4ull,
+		0x0001b86402d8ull,
+		0x7ffdb86402dcull,
+		0x7fffffffffecull,
+		0x800000000004ull,
+		0x3ffdb86402e8ull,
+		0xfffffffffffcull,
+	};
+
+	__test_bind_one_bo(fd,
+			   xe_vm_create(fd, DRM_XE_VM_CREATE_SCRATCH_PAGE, 0),
+			   ARRAY_SIZE(addrs), addrs);
+}
+
+static void
+test_bind_one_bo_many_times_many_vm(int fd)
+{
+	uint64_t addrs[] = {
+		0x000000000000ull,
+		0x0000b86402d4ull,
+		0x0001b86402d8ull,
+		0x7ffdb86402dcull,
+		0x7fffffffffecull,
+		0x800000000004ull,
+		0x3ffdb86402e8ull,
+		0xfffffffffffcull,
+	};
+
+	__test_bind_one_bo(fd, 0, ARRAY_SIZE(addrs), addrs);
+}
+
+static void unbind_all(int fd, int n_vmas)
+{
+	uint32_t bo, bo_size = xe_get_default_alignment(fd);
+	uint64_t addr = 0x1a0000;
+	uint32_t vm;
+	int i;
+	struct drm_xe_sync sync[1] = {
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+	};
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	bo = xe_bo_create(fd, 0, vm, bo_size);
+
+	for (i = 0; i < n_vmas; ++i)
+		xe_vm_bind_async(fd, vm, 0, bo, 0, addr + i * bo_size,
+				 bo_size, NULL, 0);
+
+	sync[0].handle = syncobj_create(fd, 0);
+	xe_vm_unbind_all_async(fd, vm, 0, bo, sync, 1);
+
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+	syncobj_destroy(fd, sync[0].handle);
+
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
+struct vm_thread_data {
+	pthread_t thread;
+	struct drm_xe_vm_bind_op_error_capture *capture;
+	int fd;
+	int vm;
+	uint32_t bo;
+	size_t bo_size;
+	bool destroy;
+};
+
+static void *vm_async_ops_err_thread(void *data)
+{
+	struct vm_thread_data *args = data;
+	int fd = args->fd;
+	uint64_t addr = 0x201a0000;
+	int num_binds = 0;
+	int ret;
+
+	struct drm_xe_wait_user_fence wait = {
+		.vm_id = args->vm,
+		.op = DRM_XE_UFENCE_WAIT_NEQ,
+		.flags = DRM_XE_UFENCE_WAIT_VM_ERROR,
+		.mask = DRM_XE_UFENCE_WAIT_U32,
+		.timeout = 1000,
+	};
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE,
+				&wait), 0);
+	if (args->destroy) {
+		usleep(5000);	/* Wait other binds to queue up */
+		xe_vm_destroy(fd, args->vm);
+		return NULL;
+	}
+
+	while (!ret) {
+		struct drm_xe_vm_bind bind = {
+			.vm_id = args->vm,
+			.num_binds = 1,
+			.bind.op = XE_VM_BIND_OP_RESTART,
+		};
+
+		/* VM sync ops should work */
+		if (!(num_binds++ % 2)) {
+			xe_vm_bind_sync(fd, args->vm, args->bo, 0, addr,
+					args->bo_size);
+		} else {
+			xe_vm_unbind_sync(fd, args->vm, 0, addr,
+					  args->bo_size);
+			addr += args->bo_size * 2;
+		}
+
+		/* Restart and wait for next error */
+		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND,
+					&bind), 0);
+		args->capture->error = 0;
+		ret = igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait);
+	}
+
+	return NULL;
+}
+
+static void vm_async_ops_err(int fd, bool destroy)
+{
+	uint32_t vm;
+	uint64_t addr = 0x1a0000;
+	struct drm_xe_sync sync = {
+		.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
+	};
+#define N_BINDS		32
+	struct drm_xe_vm_bind_op_error_capture capture = {};
+	struct drm_xe_ext_vm_set_property ext = {
+		.base.next_extension = 0,
+		.base.name = XE_VM_EXTENSION_SET_PROPERTY,
+		.property = XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS,
+		.value = to_user_pointer(&capture),
+	};
+	struct vm_thread_data thread = {};
+	uint32_t syncobjs[N_BINDS];
+	size_t bo_size = 0x1000 * 32;
+	uint32_t bo;
+	int i, j;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS,
+			  to_user_pointer(&ext));
+	bo = xe_bo_create(fd, 0, vm, bo_size);
+
+	thread.capture = &capture;
+	thread.fd = fd;
+	thread.vm = vm;
+	thread.bo = bo;
+	thread.bo_size = bo_size;
+	thread.destroy = destroy;
+	pthread_create(&thread.thread, 0, vm_async_ops_err_thread, &thread);
+
+	for (i = 0; i < N_BINDS; i++)
+		syncobjs[i] = syncobj_create(fd, 0);
+
+	for (j = 0, i = 0; i < N_BINDS / 4; i++, j++) {
+		sync.handle = syncobjs[j];
+#define INJECT_ERROR	(0x1 << 31)
+		if (i == N_BINDS / 8)	/* Inject error on this bind */
+			__xe_vm_bind_assert(fd, vm, 0, bo, 0,
+					    addr + i * bo_size * 2,
+					    bo_size, XE_VM_BIND_OP_MAP |
+					    XE_VM_BIND_FLAG_ASYNC |
+					    INJECT_ERROR, &sync, 1, 0, 0);
+		else
+			xe_vm_bind_async(fd, vm, 0, bo, 0,
+					 addr + i * bo_size * 2,
+					 bo_size, &sync, 1);
+	}
+
+	for (i = 0; i < N_BINDS / 4; i++, j++) {
+		sync.handle = syncobjs[j];
+		if (i == N_BINDS / 8)
+			__xe_vm_bind_assert(fd, vm, 0, 0, 0,
+					    addr + i * bo_size * 2,
+					    bo_size, XE_VM_BIND_OP_UNMAP |
+					    XE_VM_BIND_FLAG_ASYNC |
+					    INJECT_ERROR, &sync, 1, 0, 0);
+		else
+			xe_vm_unbind_async(fd, vm, 0, 0,
+					   addr + i * bo_size * 2,
+					   bo_size, &sync, 1);
+	}
+
+	for (i = 0; i < N_BINDS / 4; i++, j++) {
+		sync.handle = syncobjs[j];
+		if (i == N_BINDS / 8)
+			__xe_vm_bind_assert(fd, vm, 0, bo, 0,
+					    addr + i * bo_size * 2,
+					    bo_size, XE_VM_BIND_OP_MAP |
+					    XE_VM_BIND_FLAG_ASYNC |
+					    INJECT_ERROR, &sync, 1, 0, 0);
+		else
+			xe_vm_bind_async(fd, vm, 0, bo, 0,
+					 addr + i * bo_size * 2,
+					 bo_size, &sync, 1);
+	}
+
+	for (i = 0; i < N_BINDS / 4; i++, j++) {
+		sync.handle = syncobjs[j];
+		if (i == N_BINDS / 8)
+			__xe_vm_bind_assert(fd, vm, 0, 0, 0,
+					    addr + i * bo_size * 2,
+					    bo_size, XE_VM_BIND_OP_UNMAP |
+					    XE_VM_BIND_FLAG_ASYNC |
+					    INJECT_ERROR, &sync, 1, 0, 0);
+		else
+			xe_vm_unbind_async(fd, vm, 0, 0,
+					   addr + i * bo_size * 2,
+					   bo_size, &sync, 1);
+	}
+
+	for (i = 0; i < N_BINDS; i++)
+		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
+					NULL));
+
+	if (!destroy)
+		xe_vm_destroy(fd, vm);
+
+	pthread_join(thread.thread, NULL);
+}
+
+struct shared_pte_page_data {
+	uint32_t batch[16];
+	uint64_t pad;
+	uint32_t data;
+};
+
+#define MAX_N_ENGINES 4
+
+static void
+shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
+		uint64_t addr_stride)
+{
+	uint32_t vm;
+	uint64_t addr = 0x1000 * 512;
+	struct drm_xe_sync sync[2] = {
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+	};
+	struct drm_xe_sync sync_all[MAX_N_ENGINES + 1];
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 2,
+		.syncs = to_user_pointer(&sync),
+	};
+	uint32_t engines[MAX_N_ENGINES];
+	uint32_t syncobjs[MAX_N_ENGINES];
+	size_t bo_size;
+	uint32_t *bo;
+	struct shared_pte_page_data **data;
+	int n_engines = n_bo, n_execs = n_bo;
+	int i, b;
+
+	igt_assert(n_engines <= MAX_N_ENGINES);
+
+	bo = malloc(sizeof(*bo) * n_bo);
+	igt_assert(bo);
+
+	data = malloc(sizeof(*data) * n_bo);
+	igt_assert(data);
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	bo_size = sizeof(struct shared_pte_page_data);
+	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
+			xe_get_default_alignment(fd));
+
+	for (i = 0; i < n_bo; ++i) {
+		bo[i] = xe_bo_create(fd, 0, vm, bo_size);
+		data[i] = xe_bo_map(fd, bo[i], bo_size);
+	}
+
+	memset(sync_all, 0, sizeof(sync_all));
+	for (i = 0; i < n_engines; i++) {
+		engines[i] = xe_engine_create(fd, vm, eci, 0);
+		syncobjs[i] = syncobj_create(fd, 0);
+		sync_all[i].flags = DRM_XE_SYNC_SYNCOBJ;
+		sync_all[i].handle = syncobjs[i];
+	};
+
+	sync[0].handle = syncobj_create(fd, 0);
+	for (i = 0; i < n_bo; ++i)
+		xe_vm_bind_async(fd, vm, 0, bo[i], 0, addr + i * addr_stride,
+				 bo_size, sync, i == n_bo - 1 ? 1 : 0);
+
+	for (i = 0; i < n_execs; i++) {
+		uint64_t batch_offset = (char *)&data[i]->batch -
+			(char *)data[i];
+		uint64_t batch_addr = addr + i * addr_stride + batch_offset;
+		uint64_t sdi_offset = (char *)&data[i]->data - (char *)data[i];
+		uint64_t sdi_addr = addr + i * addr_stride + sdi_offset;
+		int e = i % n_engines;
+
+		b = 0;
+		data[i]->batch[b++] = MI_STORE_DWORD_IMM;
+		data[i]->batch[b++] = sdi_addr;
+		data[i]->batch[b++] = sdi_addr >> 32;
+		data[i]->batch[b++] = 0xc0ffee;
+		data[i]->batch[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b <= ARRAY_SIZE(data[i]->batch));
+
+		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+		sync[1].handle = syncobjs[e];
+
+		exec.engine_id = engines[e];
+		exec.address = batch_addr;
+		__xe_exec_assert(fd, &exec);
+	}
+
+	for (i = 0; i < n_bo; ++i) {
+		if (i % 2)
+			continue;
+
+		sync_all[n_execs].flags = DRM_XE_SYNC_SIGNAL;
+		sync_all[n_execs].handle = sync[0].handle;
+		xe_vm_unbind_async(fd, vm, 0, 0, addr + i * addr_stride,
+				   bo_size, sync_all, n_execs + 1);
+		igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0,
+					NULL));
+	}
+
+	for (i = 0; i < n_execs; i++)
+		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
+					NULL));
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	for (i = 0; i < n_execs; i++)
+		igt_assert_eq(data[i]->data, 0xc0ffee);
+
+	for (i = 0; i < n_execs; i++) {
+		uint64_t batch_offset = (char *)&data[i]->batch -
+			(char *)data[i];
+		uint64_t batch_addr = addr + i * addr_stride + batch_offset;
+		uint64_t sdi_offset = (char *)&data[i]->data - (char *)data[i];
+		uint64_t sdi_addr = addr + i * addr_stride + sdi_offset;
+		int e = i % n_engines;
+
+		if (!(i % 2))
+			continue;
+
+		b = 0;
+		memset(data[i], 0, sizeof(struct shared_pte_page_data));
+		data[i]->batch[b++] = MI_STORE_DWORD_IMM;
+		data[i]->batch[b++] = sdi_addr;
+		data[i]->batch[b++] = sdi_addr >> 32;
+		data[i]->batch[b++] = 0xc0ffee;
+		data[i]->batch[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b <= ARRAY_SIZE(data[i]->batch));
+
+		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+		sync[1].handle = syncobjs[e];
+
+		exec.engine_id = engines[e];
+		exec.address = batch_addr;
+		syncobj_reset(fd, &syncobjs[e], 1);
+		__xe_exec_assert(fd, &exec);
+	}
+
+	for (i = 0; i < n_bo; ++i) {
+		if (!(i % 2))
+			continue;
+
+		sync_all[n_execs].flags = DRM_XE_SYNC_SIGNAL;
+		sync_all[n_execs].handle = sync[0].handle;
+		xe_vm_unbind_async(fd, vm, 0, 0, addr + i * addr_stride,
+				   bo_size, sync_all, n_execs + 1);
+		igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0,
+					NULL));
+	}
+
+	for (i = 0; i < n_execs; i++) {
+		if (!(i % 2))
+			continue;
+		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
+					NULL));
+	}
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	for (i = 0; i < n_execs; i++)
+		igt_assert_eq(data[i]->data, 0xc0ffee);
+
+	syncobj_destroy(fd, sync[0].handle);
+	for (i = 0; i < n_engines; i++) {
+		syncobj_destroy(fd, syncobjs[i]);
+		xe_engine_destroy(fd, engines[i]);
+	}
+
+	for (i = 0; i < n_bo; ++i) {
+		munmap(data[i], bo_size);
+		gem_close(fd, bo[i]);
+	}
+	free(data);
+	xe_vm_destroy(fd, vm);
+}
+
+static void
+test_bind_engines_independent(int fd, struct drm_xe_engine_class_instance *eci)
+{
+	uint32_t vm;
+	uint64_t addr = 0x1a0000;
+	struct drm_xe_sync sync[2] = {
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 2,
+		.syncs = to_user_pointer(&sync),
+	};
+#define N_ENGINES	2
+	uint32_t engines[N_ENGINES];
+	uint32_t bind_engines[N_ENGINES];
+	uint32_t syncobjs[N_ENGINES + 1];
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct {
+		struct xe_spin spin;
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data;
+	int i, b;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	bo_size = sizeof(*data) * N_ENGINES;
+	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
+			xe_get_default_alignment(fd));
+	bo = xe_bo_create(fd, 0, vm, bo_size);
+	data = xe_bo_map(fd, bo, bo_size);
+
+	for (i = 0; i < N_ENGINES; i++) {
+		engines[i] = xe_engine_create(fd, vm, eci, 0);
+		bind_engines[i] = xe_bind_engine_create(fd, vm, 0);
+		syncobjs[i] = syncobj_create(fd, 0);
+	}
+	syncobjs[N_ENGINES] = syncobj_create(fd, 0);
+
+	/* Initial bind, needed for spinner */
+	sync[0].handle = syncobj_create(fd, 0);
+	xe_vm_bind_async(fd, vm, bind_engines[0], bo, 0, addr, bo_size,
+			 sync, 1);
+
+	for (i = 0; i < N_ENGINES; i++) {
+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_addr = addr + batch_offset;
+		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
+		uint64_t sdi_addr = addr + sdi_offset;
+		uint64_t spin_offset = (char *)&data[i].spin - (char *)data;
+		uint64_t spin_addr = addr + spin_offset;
+		int e = i;
+
+		if (i == 0) {
+			/* Cork 1st engine with a spinner */
+			xe_spin_init(&data[i].spin, spin_addr, true);
+			exec.engine_id = engines[e];
+			exec.address = spin_addr;
+			sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+			sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+			sync[1].handle = syncobjs[e];
+			__xe_exec_assert(fd, &exec);
+			xe_spin_wait_started(&data[i].spin);
+
+			/* Do bind to 1st engine blocked on cork */
+			addr += bo_size;
+			sync[1].flags &= ~DRM_XE_SYNC_SIGNAL;
+			sync[1].handle = syncobjs[e];
+			xe_vm_bind_async(fd, vm, bind_engines[e], bo, 0, addr,
+					 bo_size, sync + 1, 1);
+			addr += bo_size;
+		} else {
+			/* Do bind to 2nd engine which blocks write below */
+			sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+			xe_vm_bind_async(fd, vm, bind_engines[e], bo, 0, addr,
+					 bo_size, sync, 1);
+		}
+
+		/*
+		 * Write to either engine, 1st blocked on spinner + bind, 2nd
+		 * just blocked on bind. The 2nd should make independent
+		 * progress.
+		 */
+		b = 0;
+		data[i].batch[b++] = MI_STORE_DWORD_IMM;
+		data[i].batch[b++] = sdi_addr;
+		data[i].batch[b++] = sdi_addr >> 32;
+		data[i].batch[b++] = 0xc0ffee;
+		data[i].batch[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+		sync[1].handle = syncobjs[!i ? N_ENGINES : e];
+
+		exec.num_syncs = 2;
+		exec.engine_id = engines[e];
+		exec.address = batch_addr;
+		__xe_exec_assert(fd, &exec);
+	}
+
+	/* Verify initial bind, bind + write to 2nd engine done */
+	igt_assert(syncobj_wait(fd, &syncobjs[1], 1, INT64_MAX, 0, NULL));
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+	igt_assert_eq(data[1].data, 0xc0ffee);
+
+	/* Verify bind + write to 1st engine still inflight */
+	igt_assert(!syncobj_wait(fd, &syncobjs[0], 1, 1, 0, NULL));
+	igt_assert(!syncobj_wait(fd, &syncobjs[N_ENGINES], 1, 1, 0, NULL));
+
+	/* Verify bind + write to 1st engine done after ending spinner */
+	xe_spin_end(&data[0].spin);
+	igt_assert(syncobj_wait(fd, &syncobjs[0], 1, INT64_MAX, 0, NULL));
+	igt_assert(syncobj_wait(fd, &syncobjs[N_ENGINES], 1, INT64_MAX, 0,
+				NULL));
+	igt_assert_eq(data[0].data, 0xc0ffee);
+
+	syncobj_destroy(fd, sync[0].handle);
+	for (i = 0; i < N_ENGINES; i++) {
+		syncobj_destroy(fd, syncobjs[i]);
+		xe_engine_destroy(fd, engines[i]);
+		xe_engine_destroy(fd, bind_engines[i]);
+	}
+
+	munmap(data, bo_size);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
+#define BIND_ARRAY_BIND_ENGINE_FLAG	(0x1 << 0)
+
+static void
+test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
+		unsigned int flags)
+{
+	uint32_t vm;
+	uint64_t addr = 0x1a0000, base_addr = 0x1a0000;
+	struct drm_xe_sync sync[2] = {
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.syncs = to_user_pointer(&sync),
+	};
+	uint32_t engine, bind_engine = 0;
+#define BIND_ARRAY_MAX_N_EXEC	16
+	struct drm_xe_vm_bind_op bind_ops[BIND_ARRAY_MAX_N_EXEC];
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data;
+	int i, b;
+
+	igt_assert(n_execs <= BIND_ARRAY_MAX_N_EXEC);
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	bo_size = sizeof(*data) * n_execs;
+	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
+			xe_get_default_alignment(fd));
+
+	bo = xe_bo_create(fd, 0, vm, bo_size);
+	data = xe_bo_map(fd, bo, bo_size);
+
+	if (flags & BIND_ARRAY_BIND_ENGINE_FLAG)
+		bind_engine = xe_bind_engine_create(fd, vm, 0);
+	engine = xe_engine_create(fd, vm, eci, 0);
+
+	for (i = 0; i < n_execs; ++i) {
+		bind_ops[i].obj = bo;
+		bind_ops[i].obj_offset = 0;
+		bind_ops[i].range = bo_size;
+		bind_ops[i].addr = addr;
+		bind_ops[i].gt_mask = 0x1 << eci->gt_id;
+		bind_ops[i].op = XE_VM_BIND_OP_MAP | XE_VM_BIND_FLAG_ASYNC;
+		bind_ops[i].region = 0;
+		bind_ops[i].reserved[0] = 0;
+		bind_ops[i].reserved[1] = 0;
+
+		addr += bo_size;
+	}
+
+	sync[0].handle = syncobj_create(fd, 0);
+	xe_vm_bind_array(fd, vm, bind_engine, bind_ops, n_execs, sync, 1);
+
+	addr = base_addr;
+	for (i = 0; i < n_execs; i++) {
+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_addr = addr + batch_offset;
+		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
+		uint64_t sdi_addr = addr + sdi_offset;
+
+		b = 0;
+		data[i].batch[b++] = MI_STORE_DWORD_IMM;
+		data[i].batch[b++] = sdi_addr;
+		data[i].batch[b++] = sdi_addr >> 32;
+		data[i].batch[b++] = 0xc0ffee;
+		data[i].batch[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+		if (i == n_execs - 1) {
+			sync[1].handle = syncobj_create(fd, 0);
+			exec.num_syncs = 2;
+		} else {
+			exec.num_syncs = 1;
+		}
+
+		exec.engine_id = engine;
+		exec.address = batch_addr;
+		__xe_exec_assert(fd, &exec);
+
+		addr += bo_size;
+	}
+
+	for (i = 0; i < n_execs; ++i) {
+		bind_ops[i].obj = 0;
+		bind_ops[i].op = XE_VM_BIND_OP_UNMAP | XE_VM_BIND_FLAG_ASYNC;
+	}
+
+	syncobj_reset(fd, &sync[0].handle, 1);
+	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+	sync[1].flags &= ~DRM_XE_SYNC_SIGNAL;
+	xe_vm_bind_array(fd, vm, bind_engine, bind_ops, n_execs, sync, 2);
+
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+	igt_assert(syncobj_wait(fd, &sync[1].handle, 1, INT64_MAX, 0, NULL));
+
+	for (i = 0; i < n_execs; i++)
+		igt_assert_eq(data[i].data, 0xc0ffee);
+
+	syncobj_destroy(fd, sync[0].handle);
+	syncobj_destroy(fd, sync[1].handle);
+	xe_engine_destroy(fd, engine);
+	if (bind_engine)
+		xe_engine_destroy(fd, bind_engine);
+
+	munmap(data, bo_size);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
+#define LARGE_BIND_FLAG_MISALIGNED	(0x1 << 0)
+#define LARGE_BIND_FLAG_SPLIT		(0x1 << 1)
+#define LARGE_BIND_FLAG_USERPTR		(0x1 << 2)
+
+static void
+test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
+		 int n_engines, int n_execs, size_t bo_size,
+		 unsigned int flags)
+{
+	struct drm_xe_sync sync[2] = {
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 2,
+		.syncs = to_user_pointer(&sync),
+	};
+	uint64_t addr = 0x1ull << 30, base_addr = 0x1ull << 30;
+	uint32_t vm;
+	uint32_t engines[MAX_N_ENGINES];
+	uint32_t syncobjs[MAX_N_ENGINES];
+	uint32_t bo = 0;
+	void *map;
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data;
+	int i, b;
+
+	if (flags & LARGE_BIND_FLAG_MISALIGNED) {
+		addr -= xe_get_default_alignment(fd);
+		base_addr -= xe_get_default_alignment(fd);
+	}
+
+	igt_assert(n_engines <= MAX_N_ENGINES);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+
+	if (flags & LARGE_BIND_FLAG_USERPTR) {
+		map = aligned_alloc(xe_get_default_alignment(fd), bo_size);
+		igt_assert(map);
+	} else {
+		bo = xe_bo_create(fd, 0, vm, bo_size);
+		map = xe_bo_map(fd, bo, bo_size);
+	}
+
+	for (i = 0; i < n_engines; i++) {
+		engines[i] = xe_engine_create(fd, vm, eci, 0);
+		syncobjs[i] = syncobj_create(fd, 0);
+	};
+
+	sync[0].handle = syncobj_create(fd, 0);
+	if (flags & LARGE_BIND_FLAG_USERPTR) {
+		if (flags & LARGE_BIND_FLAG_SPLIT) {
+			xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(map),
+						 addr, bo_size / 2, NULL, 0);
+			xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(map) + bo_size / 2,
+						 addr + bo_size / 2, bo_size / 2,
+						 sync, 1);
+		} else {
+			xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(map),
+						 addr, bo_size, sync, 1);
+		}
+	} else {
+		if (flags & LARGE_BIND_FLAG_SPLIT) {
+			xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size / 2, NULL, 0);
+			xe_vm_bind_async(fd, vm, 0, bo, bo_size / 2, addr + bo_size / 2,
+					 bo_size / 2, sync, 1);
+		} else {
+			xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
+		}
+	}
+
+	for (i = 0; i < n_execs; i++) {
+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_addr = addr + batch_offset;
+		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
+		uint64_t sdi_addr = addr + sdi_offset;
+		int e = i % n_engines;
+
+		data = map + (addr - base_addr);
+		b = 0;
+		data[i].batch[b++] = MI_STORE_DWORD_IMM;
+		data[i].batch[b++] = sdi_addr;
+		data[i].batch[b++] = sdi_addr >> 32;
+		data[i].batch[b++] = 0xc0ffee;
+		data[i].batch[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+		sync[1].handle = syncobjs[e];
+
+		if (i != e)
+			syncobj_reset(fd, &sync[1].handle, 1);
+
+		exec.engine_id = engines[e];
+		exec.address = batch_addr;
+		__xe_exec_assert(fd, &exec);
+
+		if (i + 1 != n_execs)
+			addr += bo_size / n_execs;
+		else
+			addr = base_addr + bo_size - 0x1000;
+	}
+
+	for (i = 0; i < n_engines; i++)
+		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
+					NULL));
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	syncobj_reset(fd, &sync[0].handle, 1);
+	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+	if (flags & LARGE_BIND_FLAG_SPLIT) {
+		xe_vm_unbind_async(fd, vm, 0, 0, base_addr,
+				   bo_size / 2, NULL, 0);
+		xe_vm_unbind_async(fd, vm, 0, 0, base_addr + bo_size / 2,
+				   bo_size / 2, sync, 1);
+	} else {
+		xe_vm_unbind_async(fd, vm, 0, 0, base_addr, bo_size,
+				   sync, 1);
+	}
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	addr = base_addr;
+	for (i = 0; i < n_execs; i++) {
+		data = map + (addr - base_addr);
+		igt_assert_eq(data[i].data, 0xc0ffee);
+
+		if (i + 1 != n_execs)
+			addr += bo_size / n_execs;
+		else
+			addr = base_addr + bo_size - 0x1000;
+	}
+
+	syncobj_destroy(fd, sync[0].handle);
+	for (i = 0; i < n_engines; i++) {
+		syncobj_destroy(fd, syncobjs[i]);
+		xe_engine_destroy(fd, engines[i]);
+	}
+
+	if (bo) {
+		munmap(map, bo_size);
+		gem_close(fd, bo);
+	} else {
+		free(map);
+	}
+	xe_vm_destroy(fd, vm);
+}
+
+struct thread_data {
+	pthread_t thread;
+	pthread_barrier_t *barrier;
+	int fd;
+	uint32_t vm;
+	uint64_t addr;
+	struct drm_xe_engine_class_instance *eci;
+	void *map;
+	int *exit;
+};
+
+static void *hammer_thread(void *tdata)
+{
+	struct thread_data *t = tdata;
+	struct drm_xe_sync sync[1] = {
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync),
+	};
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data = t->map;
+	uint32_t engine = xe_engine_create(t->fd, t->vm, t->eci, 0);
+	int b;
+	int i = 0;
+
+	sync[0].handle = syncobj_create(t->fd, 0);
+	pthread_barrier_wait(t->barrier);
+
+	while (!*t->exit) {
+		uint64_t batch_offset = (char *)&data->batch - (char *)data;
+		uint64_t batch_addr = t->addr + batch_offset;
+		uint64_t sdi_offset = (char *)&data->data - (char *)data;
+		uint64_t sdi_addr = t->addr + sdi_offset;
+
+		b = 0;
+		data->batch[b++] = MI_STORE_DWORD_IMM;
+		data->batch[b++] = sdi_addr;
+		data->batch[b++] = sdi_addr >> 32;
+		data->batch[b++] = 0xc0ffee;
+		data->batch[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b <= ARRAY_SIZE(data->batch));
+
+		exec.engine_id = engine;
+		exec.address = batch_addr;
+		if (i % 32) {
+			exec.num_syncs = 0;
+			__xe_exec_assert(t->fd, &exec);
+		} else {
+			exec.num_syncs = 1;
+			__xe_exec_assert(t->fd, &exec);
+			igt_assert(syncobj_wait(t->fd, &sync[0].handle, 1,
+						INT64_MAX, 0, NULL));
+			syncobj_reset(t->fd, &sync[0].handle, 1);
+		}
+		++i;
+	}
+
+	syncobj_destroy(t->fd, sync[0].handle);
+	xe_engine_destroy(t->fd, engine);
+
+	return NULL;
+}
+
+#define MUNMAP_FLAG_USERPTR		(0x1 << 0)
+#define MUNMAP_FLAG_INVALIDATE		(0x1 << 1)
+#define MUNMAP_FLAG_HAMMER_FIRST_PAGE	(0x1 << 2)
+
+static void
+test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
+			 int bo_n_pages, int n_binds,
+			 int unbind_n_page_offfset, int unbind_n_pages,
+			 unsigned int flags)
+{
+	struct drm_xe_sync sync[2] = {
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 2,
+		.syncs = to_user_pointer(&sync),
+	};
+	uint64_t addr = 0x1a0000, base_addr = 0x1a0000;
+	uint32_t vm;
+	uint32_t engine;
+	size_t bo_size;
+	uint32_t bo = 0;
+	uint64_t bind_size;
+	uint64_t page_size = xe_get_default_alignment(fd);
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data;
+	void *map;
+	int i, b;
+	int invalidate = 0;
+	struct thread_data t;
+	pthread_barrier_t barrier;
+	int exit = 0;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	bo_size = page_size * bo_n_pages;
+
+	if (flags & MUNMAP_FLAG_USERPTR) {
+		map = mmap((void *)addr, bo_size, PROT_READ |
+			    PROT_WRITE, MAP_SHARED | MAP_FIXED |
+			    MAP_ANONYMOUS, -1, 0);
+		igt_assert(data != MAP_FAILED);
+	} else {
+		bo = xe_bo_create(fd, 0, vm, bo_size);
+		map = xe_bo_map(fd, bo, bo_size);
+	}
+	memset(map, 0, bo_size);
+
+	engine = xe_engine_create(fd, vm, eci, 0);
+
+	sync[0].handle = syncobj_create(fd, 0);
+	sync[1].handle = syncobj_create(fd, 0);
+
+	/* Do initial binds */
+	bind_size = (page_size * bo_n_pages) / n_binds;
+	for (i = 0; i < n_binds; ++i) {
+		if (flags & MUNMAP_FLAG_USERPTR)
+			xe_vm_bind_userptr_async(fd, vm, 0, addr, addr,
+						 bind_size, sync, 1);
+		else
+			xe_vm_bind_async(fd, vm, 0, bo, i * bind_size,
+					 addr, bind_size, sync, 1);
+		addr += bind_size;
+	}
+	addr = base_addr;
+
+	/*
+	 * Kick a thread to write the first page continously to ensure we can't
+	 * cause a fault if a rebind occurs during munmap style VM unbind
+	 * (partial VMAs unbound).
+	 */
+	if (flags & MUNMAP_FLAG_HAMMER_FIRST_PAGE) {
+		t.fd = fd;
+		t.vm = vm;
+#define PAGE_SIZE	4096
+		t.addr = addr + PAGE_SIZE / 2;
+		t.eci = eci;
+		t.exit = &exit;
+		t.map = map + PAGE_SIZE / 2;
+		t.barrier = &barrier;
+		pthread_barrier_init(&barrier, NULL, 2);
+		pthread_create(&t.thread, 0, hammer_thread, &t);
+		pthread_barrier_wait(&barrier);
+	}
+
+	/* Verify we can use every page */
+	for (i = 0; i < n_binds; ++i) {
+		uint64_t batch_offset = (char *)&data->batch - (char *)data;
+		uint64_t batch_addr = addr + batch_offset;
+		uint64_t sdi_offset = (char *)&data->data - (char *)data;
+		uint64_t sdi_addr = addr + sdi_offset;
+		data = map + i * page_size;
+
+		b = 0;
+		data->batch[b++] = MI_STORE_DWORD_IMM;
+		data->batch[b++] = sdi_addr;
+		data->batch[b++] = sdi_addr >> 32;
+		data->batch[b++] = 0xc0ffee;
+		data->batch[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+		if (i)
+			syncobj_reset(fd, &sync[1].handle, 1);
+		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+
+		exec.engine_id = engine;
+		exec.address = batch_addr;
+		__xe_exec_assert(fd, &exec);
+
+		addr += page_size;
+	}
+	addr = base_addr;
+
+	/* Unbind some of the pages */
+	syncobj_reset(fd, &sync[0].handle, 1);
+	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+	sync[1].flags &= ~DRM_XE_SYNC_SIGNAL;
+	xe_vm_unbind_async(fd, vm, 0, 0,
+			   addr + unbind_n_page_offfset * page_size,
+			   unbind_n_pages * page_size, sync, 2);
+
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+	igt_assert(syncobj_wait(fd, &sync[1].handle, 1, INT64_MAX, 0, NULL));
+
+	/* Verify all pages written */
+	for (i = 0; i < n_binds; ++i) {
+		data = map + i * page_size;
+		igt_assert_eq(data->data, 0xc0ffee);
+	}
+	if (flags & MUNMAP_FLAG_HAMMER_FIRST_PAGE) {
+		memset(map, 0, PAGE_SIZE / 2);
+		memset(map + PAGE_SIZE, 0, bo_size - PAGE_SIZE);
+	} else {
+		memset(map, 0, bo_size);
+	}
+
+try_again_after_invalidate:
+	/* Verify we can use every page still bound */
+	for (i = 0; i < n_binds; ++i) {
+		uint64_t batch_offset = (char *)&data->batch - (char *)data;
+		uint64_t batch_addr = addr + batch_offset;
+		uint64_t sdi_offset = (char *)&data->data - (char *)data;
+		uint64_t sdi_addr = addr + sdi_offset;
+
+		data = map + i * page_size;
+		addr += page_size;
+
+		if (i < unbind_n_page_offfset ||
+		    i + 1 > unbind_n_page_offfset + unbind_n_pages) {
+			b = 0;
+			data->batch[b++] = MI_STORE_DWORD_IMM;
+			data->batch[b++] = sdi_addr;
+			data->batch[b++] = sdi_addr >> 32;
+			data->batch[b++] = 0xc0ffee;
+			data->batch[b++] = MI_BATCH_BUFFER_END;
+			igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+			sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+			syncobj_reset(fd, &sync[1].handle, 1);
+			sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+
+			exec.engine_id = engine;
+			exec.address = batch_addr;
+			__xe_exec_assert(fd, &exec);
+		}
+	}
+	addr = base_addr;
+
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+	igt_assert(syncobj_wait(fd, &sync[1].handle, 1, INT64_MAX, 0, NULL));
+
+	/* Verify all pages still bound written */
+	for (i = 0; i < n_binds; ++i) {
+		if (i < unbind_n_page_offfset ||
+		    i + 1 > unbind_n_page_offfset + unbind_n_pages) {
+			data = map + i * page_size;
+			igt_assert_eq(data->data, 0xc0ffee);
+		}
+	}
+	if (flags & MUNMAP_FLAG_HAMMER_FIRST_PAGE) {
+		memset(map, 0, PAGE_SIZE / 2);
+		memset(map + PAGE_SIZE, 0, bo_size - PAGE_SIZE);
+	} else {
+		memset(map, 0, bo_size);
+	}
+
+	/*
+	 * The munmap style VM unbind can create new VMAs, make sure those are
+	 * in the bookkeeping for another rebind after a userptr invalidate.
+	 */
+	if (flags & MUNMAP_FLAG_INVALIDATE && !invalidate++) {
+		map = mmap((void *)addr, bo_size, PROT_READ |
+			    PROT_WRITE, MAP_SHARED | MAP_FIXED |
+			    MAP_ANONYMOUS, -1, 0);
+		igt_assert(data != MAP_FAILED);
+		goto try_again_after_invalidate;
+	}
+
+	/* Confirm unbound region can be rebound */
+	syncobj_reset(fd, &sync[0].handle, 1);
+	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+	if (flags & MUNMAP_FLAG_USERPTR)
+		xe_vm_bind_userptr_async(fd, vm, 0,
+					 addr + unbind_n_page_offfset * page_size,
+					 addr + unbind_n_page_offfset * page_size,
+					 unbind_n_pages * page_size, sync, 1);
+	else
+		xe_vm_bind_async(fd, vm, 0, bo,
+				 unbind_n_page_offfset * page_size,
+				 addr + unbind_n_page_offfset * page_size,
+				 unbind_n_pages * page_size, sync, 1);
+
+	/* Verify we can use every page */
+	for (i = 0; i < n_binds; ++i) {
+		uint64_t batch_offset = (char *)&data->batch - (char *)data;
+		uint64_t batch_addr = addr + batch_offset;
+		uint64_t sdi_offset = (char *)&data->data - (char *)data;
+		uint64_t sdi_addr = addr + sdi_offset;
+		data = map + i * page_size;
+
+		b = 0;
+		data->batch[b++] = MI_STORE_DWORD_IMM;
+		data->batch[b++] = sdi_addr;
+		data->batch[b++] = sdi_addr >> 32;
+		data->batch[b++] = 0xc0ffee;
+		data->batch[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+		syncobj_reset(fd, &sync[1].handle, 1);
+		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+
+		exec.engine_id = engine;
+		exec.address = batch_addr;
+		__xe_exec_assert(fd, &exec);
+
+		addr += page_size;
+	}
+	addr = base_addr;
+
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+	igt_assert(syncobj_wait(fd, &sync[1].handle, 1, INT64_MAX, 0, NULL));
+
+	/* Verify all pages written */
+	for (i = 0; i < n_binds; ++i) {
+		data = map + i * page_size;
+		igt_assert_eq(data->data, 0xc0ffee);
+	}
+
+	if (flags & MUNMAP_FLAG_HAMMER_FIRST_PAGE) {
+		exit = 1;
+		pthread_join(t.thread, NULL);
+		pthread_barrier_destroy(&barrier);
+	}
+
+	syncobj_destroy(fd, sync[0].handle);
+	syncobj_destroy(fd, sync[1].handle);
+	xe_engine_destroy(fd, engine);
+	munmap(map, bo_size);
+	if (bo)
+		gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
+igt_main
+{
+	struct drm_xe_engine_class_instance *hwe;
+	uint64_t bind_size;
+	int fd;
+	const struct section {
+		const char *name;
+		int bo_n_pages;
+		int n_binds;
+		int unbind_n_page_offfset;
+		int unbind_n_pages;
+		unsigned int flags;
+	} sections[] = {
+		{ "all", 4, 2, 0, 4, 0 },
+		{ "one-partial", 4, 1, 1, 2, 0 },
+		{ "either-side-partial", 4, 2, 1, 2, 0 },
+		{ "either-side-partial-hammer", 4, 2, 1, 2,
+			MUNMAP_FLAG_HAMMER_FIRST_PAGE },
+		{ "either-side-full", 4, 4, 1, 2, 0 },
+		{ "end", 4, 2, 0, 3, 0 },
+		{ "front", 4, 2, 1, 3, 0 },
+		{ "many-all", 4 * 8, 2 * 8, 0 * 8, 4 * 8, 0 },
+		{ "many-either-side-partial", 4 * 8, 2 * 8, 1, 4 * 8 - 2, 0 },
+		{ "many-either-side-partial-hammer", 4 * 8, 2 * 8, 1, 4 * 8 - 2,
+			MUNMAP_FLAG_HAMMER_FIRST_PAGE },
+		{ "many-either-side-full", 4 * 8, 4 * 8, 1 * 8, 2 * 8, 0 },
+		{ "many-end", 4 * 8, 4, 0 * 8, 3 * 8 + 2, 0 },
+		{ "many-front", 4 * 8, 4, 1 * 8 - 2, 3 * 8 + 2, 0 },
+		{ "userptr-all", 4, 2, 0, 4, MUNMAP_FLAG_USERPTR },
+		{ "userptr-one-partial", 4, 1, 1, 2, MUNMAP_FLAG_USERPTR },
+		{ "userptr-either-side-partial", 4, 2, 1, 2,
+			MUNMAP_FLAG_USERPTR },
+		{ "userptr-either-side-full", 4, 4, 1, 2,
+			MUNMAP_FLAG_USERPTR },
+		{ "userptr-end", 4, 2, 0, 3, MUNMAP_FLAG_USERPTR },
+		{ "userptr-front", 4, 2, 1, 3, MUNMAP_FLAG_USERPTR },
+		{ "userptr-many-all", 4 * 8, 2 * 8, 0 * 8, 4 * 8,
+			MUNMAP_FLAG_USERPTR },
+		{ "userptr-many-either-side-full", 4 * 8, 4 * 8, 1 * 8, 2 * 8,
+			MUNMAP_FLAG_USERPTR },
+		{ "userptr-many-end", 4 * 8, 4, 0 * 8, 3 * 8 + 2,
+			MUNMAP_FLAG_USERPTR },
+		{ "userptr-many-front", 4 * 8, 4, 1 * 8 - 2, 3 * 8 + 2,
+			MUNMAP_FLAG_USERPTR },
+		{ "userptr-inval-either-side-full", 4, 4, 1, 2,
+			MUNMAP_FLAG_USERPTR | MUNMAP_FLAG_INVALIDATE },
+		{ "userptr-inval-end", 4, 2, 0, 3, MUNMAP_FLAG_USERPTR |
+			MUNMAP_FLAG_INVALIDATE },
+		{ "userptr-inval-front", 4, 2, 1, 3, MUNMAP_FLAG_USERPTR |
+			MUNMAP_FLAG_INVALIDATE },
+		{ "userptr-inval-many-all", 4 * 8, 2 * 8, 0 * 8, 4 * 8,
+			MUNMAP_FLAG_USERPTR | MUNMAP_FLAG_INVALIDATE },
+		{ "userptr-inval-many-either-side-partial", 4 * 8, 2 * 8, 1,
+			4 * 8 - 2, MUNMAP_FLAG_USERPTR |
+				MUNMAP_FLAG_INVALIDATE },
+		{ "userptr-inval-many-either-side-full", 4 * 8, 4 * 8, 1 * 8,
+			2 * 8, MUNMAP_FLAG_USERPTR | MUNMAP_FLAG_INVALIDATE },
+		{ "userptr-inval-many-end", 4 * 8, 4, 0 * 8, 3 * 8 + 2,
+			MUNMAP_FLAG_USERPTR | MUNMAP_FLAG_INVALIDATE },
+		{ "userptr-inval-many-front", 4 * 8, 4, 1 * 8 - 2, 3 * 8 + 2,
+			MUNMAP_FLAG_USERPTR | MUNMAP_FLAG_INVALIDATE },
+		{ NULL },
+	};
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		xe_query_all(fd);
+	}
+
+	igt_subtest("bind-once")
+		test_bind_once(fd);
+
+	igt_subtest("bind-one-bo-many-times")
+		test_bind_one_bo_many_times(fd);
+
+	igt_subtest("bind-one-bo-many-times-many-vm")
+		test_bind_one_bo_many_times_many_vm(fd);
+
+	igt_subtest("scratch")
+		test_scratch(fd);
+
+	igt_subtest("unbind-all-2-vmas")
+		unbind_all(fd, 2);
+
+	igt_subtest("unbind-all-8-vmas")
+		unbind_all(fd, 8);
+
+	igt_subtest("vm-async-ops-err")
+		vm_async_ops_err(fd, false);
+
+	igt_subtest("vm-async-ops-err-destroy")
+		vm_async_ops_err(fd, true);
+
+	igt_subtest("shared-pte-page")
+		for_each_hw_engine(hwe)
+			shared_pte_page(fd, hwe, 4,
+					xe_get_default_alignment(fd));
+
+	igt_subtest("shared-pde-page")
+		for_each_hw_engine(hwe)
+			shared_pte_page(fd, hwe, 4, 0x1000ul * 512);
+
+	igt_subtest("shared-pde2-page")
+		for_each_hw_engine(hwe)
+			shared_pte_page(fd, hwe, 4, 0x1000ul * 512 * 512);
+
+	igt_subtest("shared-pde3-page")
+		for_each_hw_engine(hwe)
+			shared_pte_page(fd, hwe, 4, 0x1000ul * 512 * 512 * 512);
+
+	igt_subtest("bind-engines-independent")
+		for_each_hw_engine(hwe)
+			test_bind_engines_independent(fd, hwe);
+
+	igt_subtest("bind-array-twice")
+		for_each_hw_engine(hwe)
+			test_bind_array(fd, hwe, 2, 0);
+
+	igt_subtest("bind-array-many")
+		for_each_hw_engine(hwe)
+			test_bind_array(fd, hwe, 16, 0);
+
+	igt_subtest("bind-array-engine-twice")
+		for_each_hw_engine(hwe)
+			test_bind_array(fd, hwe, 2,
+					BIND_ARRAY_BIND_ENGINE_FLAG);
+
+	igt_subtest("bind-array-engine-many")
+		for_each_hw_engine(hwe)
+			test_bind_array(fd, hwe, 16,
+					BIND_ARRAY_BIND_ENGINE_FLAG);
+
+	for (bind_size = 0x1ull << 21; bind_size <= 0x1ull << 31;
+	     bind_size = bind_size << 1) {
+		igt_subtest_f("large-binds-%ld", bind_size)
+			for_each_hw_engine(hwe) {
+				test_large_binds(fd, hwe, 4, 16, bind_size, 0);
+				break;
+			}
+		igt_subtest_f("large-split-binds-%ld", bind_size)
+			for_each_hw_engine(hwe) {
+				test_large_binds(fd, hwe, 4, 16, bind_size,
+						 LARGE_BIND_FLAG_SPLIT);
+				break;
+			}
+		igt_subtest_f("large-misaligned-binds-%ld", bind_size)
+			for_each_hw_engine(hwe) {
+				test_large_binds(fd, hwe, 4, 16, bind_size,
+						 LARGE_BIND_FLAG_MISALIGNED);
+				break;
+			}
+		igt_subtest_f("large-split-misaligned-binds-%ld", bind_size)
+			for_each_hw_engine(hwe) {
+				test_large_binds(fd, hwe, 4, 16, bind_size,
+						 LARGE_BIND_FLAG_SPLIT |
+						 LARGE_BIND_FLAG_MISALIGNED);
+				break;
+			}
+		igt_subtest_f("large-userptr-binds-%ld", bind_size)
+			for_each_hw_engine(hwe) {
+				test_large_binds(fd, hwe, 4, 16, bind_size,
+						 LARGE_BIND_FLAG_USERPTR);
+				break;
+			}
+		igt_subtest_f("large-userptr-split-binds-%ld", bind_size)
+			for_each_hw_engine(hwe) {
+				test_large_binds(fd, hwe, 4, 16, bind_size,
+						 LARGE_BIND_FLAG_SPLIT |
+						 LARGE_BIND_FLAG_USERPTR);
+				break;
+			}
+		igt_subtest_f("large-userptr-misaligned-binds-%ld", bind_size)
+			for_each_hw_engine(hwe) {
+				test_large_binds(fd, hwe, 4, 16, bind_size,
+						 LARGE_BIND_FLAG_MISALIGNED |
+						 LARGE_BIND_FLAG_USERPTR);
+				break;
+			}
+		igt_subtest_f("large-userptr-split-misaligned-binds-%ld",
+			      bind_size)
+			for_each_hw_engine(hwe) {
+				test_large_binds(fd, hwe, 4, 16, bind_size,
+						 LARGE_BIND_FLAG_SPLIT |
+						 LARGE_BIND_FLAG_MISALIGNED |
+						 LARGE_BIND_FLAG_USERPTR);
+				break;
+			}
+	}
+
+	bind_size = (0x1ull << 21) + (0x1ull << 20);
+	igt_subtest_f("mixed-binds-%ld", bind_size)
+		for_each_hw_engine(hwe) {
+			test_large_binds(fd, hwe, 4, 16, bind_size, 0);
+			break;
+		}
+
+	igt_subtest_f("mixed-misaligned-binds-%ld", bind_size)
+		for_each_hw_engine(hwe) {
+			test_large_binds(fd, hwe, 4, 16, bind_size,
+					 LARGE_BIND_FLAG_MISALIGNED);
+			break;
+		}
+
+	bind_size = (0x1ull << 30) + (0x1ull << 29) + (0x1ull << 20);
+	igt_subtest_f("mixed-binds-%ld", bind_size)
+		for_each_hw_engine(hwe) {
+			test_large_binds(fd, hwe, 4, 16, bind_size, 0);
+			break;
+		}
+
+	bind_size = (0x1ull << 30) + (0x1ull << 29) + (0x1ull << 20);
+	igt_subtest_f("mixed-misaligned-binds-%ld", bind_size)
+		for_each_hw_engine(hwe) {
+			test_large_binds(fd, hwe, 4, 16, bind_size,
+					 LARGE_BIND_FLAG_MISALIGNED);
+			break;
+		}
+
+	bind_size = (0x1ull << 21) + (0x1ull << 20);
+	igt_subtest_f("mixed-userptr-binds-%ld", bind_size)
+		for_each_hw_engine(hwe) {
+			test_large_binds(fd, hwe, 4, 16, bind_size,
+					 LARGE_BIND_FLAG_USERPTR);
+			break;
+		}
+
+	igt_subtest_f("mixed-userptr-misaligned-binds-%ld", bind_size)
+		for_each_hw_engine(hwe) {
+			test_large_binds(fd, hwe, 4, 16, bind_size,
+					 LARGE_BIND_FLAG_MISALIGNED |
+					 LARGE_BIND_FLAG_USERPTR);
+			break;
+		}
+
+	bind_size = (0x1ull << 30) + (0x1ull << 29) + (0x1ull << 20);
+	igt_subtest_f("mixed-userptr-binds-%ld", bind_size)
+		for_each_hw_engine(hwe) {
+			test_large_binds(fd, hwe, 4, 16, bind_size,
+					 LARGE_BIND_FLAG_USERPTR);
+			break;
+		}
+
+	bind_size = (0x1ull << 30) + (0x1ull << 29) + (0x1ull << 20);
+	igt_subtest_f("mixed-userptr-misaligned-binds-%ld", bind_size)
+		for_each_hw_engine(hwe) {
+			test_large_binds(fd, hwe, 4, 16, bind_size,
+					 LARGE_BIND_FLAG_MISALIGNED |
+					 LARGE_BIND_FLAG_USERPTR);
+			break;
+		}
+
+	for_each_hw_engine(hwe)
+		if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COPY)
+			break;
+
+	for (const struct section *s = sections; s->name; s++) {
+		igt_subtest_f("munmap-style-unbind-%s", s->name)
+			test_munmap_style_unbind(fd, hwe, s->bo_n_pages,
+						 s->n_binds,
+						 s->unbind_n_page_offfset,
+						 s->unbind_n_pages,
+						 s->flags);
+	}
+
+	igt_fixture
+		close(fd);
+}
diff --git a/tests/xe/xe_waitfence.c b/tests/xe/xe_waitfence.c
new file mode 100644
index 00000000..48a00362
--- /dev/null
+++ b/tests/xe/xe_waitfence.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright Â© 2021 Intel Corporation
+ */
+
+#include "igt.h"
+#include "lib/igt_syncobj.h"
+#include "lib/intel_reg.h"
+#include "xe_drm.h"
+
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include "xe/xe_spin.h"
+#include <string.h>
+
+#define MY_FLAG	vram_if_possible(0)
+
+uint64_t wait_fence = 0;
+
+static void do_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
+		    uint64_t addr, uint64_t size, uint64_t val)
+{
+	struct drm_xe_sync sync[1] = {};
+	sync[0].flags = DRM_XE_SYNC_USER_FENCE | DRM_XE_SYNC_SIGNAL;
+
+	sync[0].addr = to_user_pointer(&wait_fence);
+	sync[0].timeline_value = val;
+	xe_vm_bind(fd, vm, bo, offset, addr, size, sync, 1);
+}
+
+static void
+test(int fd)
+{
+	uint32_t bo_1;
+	uint32_t bo_2;
+	uint32_t bo_3;
+	uint32_t bo_4;
+	uint32_t bo_5;
+	uint32_t bo_6;
+	uint32_t bo_7;
+
+	uint32_t vm = xe_vm_create(fd, 0, 0);
+	bo_1 = xe_bo_create_flags(fd, vm, 0x40000, MY_FLAG);
+	do_bind(fd, vm, bo_1, 0, 0x200000, 0x40000, 1);
+	bo_2 = xe_bo_create_flags(fd, vm, 0x40000, MY_FLAG);
+	do_bind(fd, vm, bo_2, 0, 0xc0000000, 0x40000, 2);
+	bo_3 = xe_bo_create_flags(fd, vm, 0x40000, MY_FLAG);
+	do_bind(fd, vm, bo_3, 0, 0x180000000, 0x40000, 3);
+	bo_4 = xe_bo_create_flags(fd, vm, 0x10000, MY_FLAG);
+	do_bind(fd, vm, bo_4, 0, 0x140000000, 0x10000, 4);
+	bo_5 = xe_bo_create_flags(fd, vm, 0x100000, MY_FLAG);
+	do_bind(fd, vm, bo_5, 0, 0x100000000, 0x100000, 5);
+	bo_6 = xe_bo_create_flags(fd, vm, 0x1c0000, MY_FLAG);
+	do_bind(fd, vm, bo_6, 0, 0xc0040000, 0x1c0000, 6);
+	bo_7 = xe_bo_create_flags(fd, vm, 0x10000, MY_FLAG);
+	do_bind(fd, vm, bo_7, 0, 0xeffff0000, 0x10000, 7);
+	xe_wait_ufence(fd, &wait_fence, 7, NULL, 2000);
+	xe_vm_unbind_sync(fd, vm, 0, 0x200000, 0x40000);
+	xe_vm_unbind_sync(fd, vm, 0, 0xc0000000, 0x40000);
+	xe_vm_unbind_sync(fd, vm, 0, 0x180000000, 0x40000);
+	xe_vm_unbind_sync(fd, vm, 0, 0x140000000, 0x10000);
+	xe_vm_unbind_sync(fd, vm, 0, 0x100000000, 0x100000);
+	xe_vm_unbind_sync(fd, vm, 0, 0xc0040000, 0x1c0000);
+	xe_vm_unbind_sync(fd, vm, 0, 0xeffff0000, 0x10000);
+	gem_close(fd, bo_7);
+	gem_close(fd, bo_6);
+	gem_close(fd, bo_5);
+	gem_close(fd, bo_4);
+	gem_close(fd, bo_3);
+	gem_close(fd, bo_2);
+	gem_close(fd, bo_1);
+}
+
+igt_main
+{
+        int fd;
+
+        igt_fixture {
+                fd = drm_open_driver(DRIVER_XE);
+                xe_query_all(fd);
+        }
+
+        igt_subtest("test")
+                test(fd);
+
+        igt_fixture
+                close(fd);
+}
diff --git a/tools/meson.build b/tools/meson.build
index d2defec8..4c45f16b 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -42,6 +42,7 @@ tools_progs = [
 	'intel_gvtg_test',
 	'dpcd_reg',
 	'lsgpu',
+	'xe_reg',
 ]
 tool_deps = igt_deps
 tool_deps += zlib
diff --git a/tools/xe_reg.c b/tools/xe_reg.c
new file mode 100644
index 00000000..1f7b384d
--- /dev/null
+++ b/tools/xe_reg.c
@@ -0,0 +1,366 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include "igt.h"
+#include "igt_device_scan.h"
+
+#include "xe_drm.h"
+
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+
+#define DECL_XE_MMIO_READ_FN(bits) \
+static inline uint##bits##_t \
+xe_mmio_read##bits(int fd, uint32_t reg) \
+{ \
+	struct drm_xe_mmio mmio = { \
+		.addr = reg, \
+		.flags = DRM_XE_MMIO_READ | DRM_XE_MMIO_##bits##BIT, \
+	}; \
+\
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_MMIO, &mmio), 0); \
+\
+	return mmio.value;\
+}\
+static inline void \
+xe_mmio_write##bits(int fd, uint32_t reg, uint##bits##_t value) \
+{ \
+	struct drm_xe_mmio mmio = { \
+		.addr = reg, \
+		.flags = DRM_XE_MMIO_WRITE | DRM_XE_MMIO_##bits##BIT, \
+		.value = value, \
+	}; \
+\
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_MMIO, &mmio), 0); \
+}
+
+DECL_XE_MMIO_READ_FN(8)
+DECL_XE_MMIO_READ_FN(16)
+DECL_XE_MMIO_READ_FN(32)
+DECL_XE_MMIO_READ_FN(64)
+
+static void print_help(FILE *fp)
+{
+	fprintf(fp, "usage: xe_reg read REG1 [REG2]...\n");
+	fprintf(fp, "       xe_reg write REG VALUE\n");
+}
+
+enum ring {
+	RING_UNKNOWN = -1,
+	RING_RCS0,
+	RING_BCS0,
+};
+
+static const struct ring_info {
+	enum ring ring;
+	const char *name;
+	uint32_t mmio_base;
+} ring_info[] = {
+	{RING_RCS0, "rcs0", 0x02000, },
+	{RING_BCS0, "bcs0", 0x22000, },
+};
+
+static const struct ring_info *ring_info_for_name(const char *name)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ring_info); i++)
+		if (strcmp(name, ring_info[i].name) == 0)
+			return &ring_info[i];
+
+	return NULL;
+}
+
+struct reg_info {
+	const char *name;
+	bool is_ring;
+	uint32_t addr_low;
+	uint32_t addr_high;
+} reg_info[] = {
+#define REG32(name, addr) { #name, false, addr }
+#define REG64(name, low, high) { #name, false, low, high }
+#define RING_REG32(name, addr) { #name, true, addr }
+#define RING_REG64(name, low, high) { #name, true, low, high }
+
+	RING_REG64(ACTHD, 0x74, 0x5c),
+	RING_REG32(BB_ADDR_DIFF, 0x154),
+	RING_REG64(BB_ADDR, 0x140, 0x168),
+	RING_REG32(BB_PER_CTX_PTR, 0x2c0),
+	RING_REG64(EXECLIST_STATUS, 0x234, 0x238),
+	RING_REG64(EXECLIST_SQ0, 0x510, 0x514),
+	RING_REG64(EXECLIST_SQ1, 0x518, 0x51c),
+	RING_REG32(HWS_PGA, 0x80),
+	RING_REG32(INDIRECT_CTX, 0x1C4),
+	RING_REG32(INDIRECT_CTX_OFFSET, 0x1C8),
+	RING_REG32(NOPID, 0x94),
+	RING_REG64(PML4E, 0x270, 0x274),
+	RING_REG32(RING_BUFFER_CTL, 0x3c),
+	RING_REG32(RING_BUFFER_HEAD, 0x34),
+	RING_REG32(RING_BUFFER_START, 0x38),
+	RING_REG32(RING_BUFFER_TAIL, 0x30),
+	RING_REG64(SBB_ADDR, 0x114, 0x11c),
+	RING_REG32(SBB_STATE, 0x118),
+
+#undef REG32
+#undef REG64
+#undef RING_REG32
+#undef RING_REG64
+};
+
+static const struct reg_info *reg_info_for_name(const char *name)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(reg_info); i++)
+		if (strcmp(name, reg_info[i].name) == 0)
+			return &reg_info[i];
+
+	return NULL;
+}
+
+static int print_reg_for_info(int xe, FILE *fp, const struct reg_info *reg,
+			      const struct ring_info *ring)
+{
+	if (reg->is_ring) {
+		if (!ring) {
+			fprintf(stderr, "%s is a ring register but --ring "
+					"not set\n", reg->name);
+			return EXIT_FAILURE;
+		}
+
+		if (reg->addr_high) {
+			uint32_t low = xe_mmio_read32(xe, reg->addr_low +
+							  ring->mmio_base);
+			uint32_t high = xe_mmio_read32(xe, reg->addr_high +
+							   ring->mmio_base);
+
+			fprintf(fp, "%s[%s] = 0x%08x %08x\n", reg->name,
+				ring->name, high, low);
+		} else {
+			uint32_t value = xe_mmio_read32(xe, reg->addr_low +
+							    ring->mmio_base);
+
+			fprintf(fp, "%s[%s] = 0x%08x\n", reg->name,
+				ring->name, value);
+		}
+	} else {
+		if (reg->addr_high) {
+			uint32_t low = xe_mmio_read32(xe, reg->addr_low);
+			uint32_t high = xe_mmio_read32(xe, reg->addr_high);
+
+			fprintf(fp, "%s = 0x%08x %08x\n", reg->name, high, low);
+		} else {
+			uint32_t value = xe_mmio_read32(xe, reg->addr_low);
+
+			fprintf(fp, "%s = 0x%08x\n", reg->name, value);
+		}
+	}
+
+	return 0;
+}
+
+static void print_reg_for_addr(int xe, FILE *fp, uint32_t addr)
+{
+	uint32_t value = xe_mmio_read32(xe, addr);
+
+	fprintf(fp, "MMIO[0x%05x] = 0x%08x\n", addr, value);
+}
+
+enum opt {
+	OPT_UNKNOWN = '?',
+	OPT_END = -1,
+	OPT_DEVICE,
+	OPT_RING,
+	OPT_ALL,
+};
+
+static int read_reg(int argc, char *argv[])
+{
+	int xe, i, err, index;
+	unsigned long reg_addr;
+	char *endp = NULL;
+	const struct ring_info *ring = NULL;
+	enum opt opt;
+	bool dump_all = false;
+
+	static struct option options[] = {
+		{ "device",	required_argument,	NULL,	OPT_DEVICE },
+		{ "ring",	required_argument,	NULL,	OPT_RING },
+		{ "all",	no_argument,		NULL,	OPT_ALL },
+	};
+
+	for (opt = 0; opt != OPT_END; ) {
+		opt = getopt_long(argc, argv, "", options, &index);
+
+		switch (opt) {
+		case OPT_DEVICE:
+			igt_device_filter_add(optarg);
+			break;
+		case OPT_RING:
+			ring = ring_info_for_name(optarg);
+			if (!ring) {
+				fprintf(stderr, "invalid ring: %s\n", optarg);
+				return EXIT_FAILURE;
+			}
+			break;
+		case OPT_ALL:
+			dump_all = true;
+			break;
+		case OPT_END:
+			break;
+		case OPT_UNKNOWN:
+			return EXIT_FAILURE;
+		}
+	}
+
+	argc -= optind;
+	argv += optind;
+
+	xe = drm_open_driver(DRIVER_XE);
+	if (dump_all) {
+		for (i = 0; i < ARRAY_SIZE(reg_info); i++) {
+			if (reg_info[i].is_ring != !!ring)
+				continue;
+
+			print_reg_for_info(xe, stdout, &reg_info[i], ring);
+		}
+	} else {
+		for (i = 0; i < argc; i++) {
+			const struct reg_info *reg = reg_info_for_name(argv[i]);
+			if (reg) {
+				err = print_reg_for_info(xe, stdout, reg, ring);
+				if (err)
+					return err;
+				continue;
+			}
+			reg_addr = strtoul(argv[i], &endp, 16);
+			if (!reg_addr || reg_addr >= (4 << 20) || *endp) {
+				fprintf(stderr, "invalid reg address '%s'\n",
+					argv[i]);
+				return EXIT_FAILURE;
+			}
+			print_reg_for_addr(xe, stdout, reg_addr);
+		}
+	}
+
+	return 0;
+}
+
+static int write_reg_for_info(int xe, const struct reg_info *reg,
+			      const struct ring_info *ring,
+			      uint64_t value)
+{
+	if (reg->is_ring) {
+		if (!ring) {
+			fprintf(stderr, "%s is a ring register but --ring "
+					"not set\n", reg->name);
+			return EXIT_FAILURE;
+		}
+
+		xe_mmio_write32(xe, reg->addr_low + ring->mmio_base, value);
+		if (reg->addr_high) {
+			xe_mmio_write32(xe, reg->addr_high + ring->mmio_base,
+					value >> 32);
+		}
+	} else {
+		xe_mmio_write32(xe, reg->addr_low, value);
+		if (reg->addr_high)
+			xe_mmio_write32(xe, reg->addr_high, value >> 32);
+	}
+
+	return 0;
+}
+
+static void write_reg_for_addr(int xe, uint32_t addr, uint32_t value)
+{
+	xe_mmio_write32(xe, addr, value);
+}
+
+static int write_reg(int argc, char *argv[])
+{
+	int xe, index;
+	unsigned long reg_addr;
+	char *endp = NULL;
+	const struct ring_info *ring = NULL;
+	enum opt opt;
+	const char *reg_name;
+	const struct reg_info *reg;
+	uint64_t value;
+
+	static struct option options[] = {
+		{ "device",	required_argument,	NULL,	OPT_DEVICE },
+		{ "ring",	required_argument,	NULL,	OPT_RING },
+	};
+
+	for (opt = 0; opt != OPT_END; ) {
+		opt = getopt_long(argc, argv, "", options, &index);
+
+		switch (opt) {
+		case OPT_DEVICE:
+			igt_device_filter_add(optarg);
+			break;
+		case OPT_RING:
+			ring = ring_info_for_name(optarg);
+			if (!ring) {
+				fprintf(stderr, "invalid ring: %s\n", optarg);
+				return EXIT_FAILURE;
+			}
+			break;
+		case OPT_END:
+			break;
+		case OPT_UNKNOWN:
+			return EXIT_FAILURE;
+		default:
+			break;
+		}
+	}
+
+	argc -= optind;
+	argv += optind;
+
+	if (argc != 2) {
+		print_help(stderr);
+		return EXIT_FAILURE;
+	}
+
+	reg_name = argv[0];
+	value = strtoull(argv[1], &endp, 0);
+	if (*endp) {
+		fprintf(stderr, "Invalid register value: %s\n", argv[1]);
+		return EXIT_FAILURE;
+	}
+
+	xe = drm_open_driver(DRIVER_XE);
+
+	reg = reg_info_for_name(reg_name);
+	if (reg)
+		return write_reg_for_info(xe, reg, ring, value);
+
+	reg_addr = strtoul(reg_name, &endp, 16);
+	if (!reg_addr || reg_addr >= (4 << 20) || *endp) {
+		fprintf(stderr, "invalid reg address '%s'\n", reg_name);
+		return EXIT_FAILURE;
+	}
+	write_reg_for_addr(xe, reg_addr, value);
+
+	return 0;
+}
+
+int main(int argc, char *argv[])
+{
+	if (argc < 2) {
+		print_help(stderr);
+		return EXIT_FAILURE;
+	}
+
+	if (strcmp(argv[1], "read") == 0)
+		return read_reg(argc - 1, argv + 1);
+	else if (strcmp(argv[1], "write") == 0)
+		return write_reg(argc - 1, argv + 1);
+
+	fprintf(stderr, "invalid sub-command: %s", argv[1]);
+	return EXIT_FAILURE;
+}
-- 
2.37.3
