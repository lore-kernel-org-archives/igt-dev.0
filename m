Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED388CA0EED
	for <igt-dev@archiver.kernel.org>; Thu, 28 Aug 2025 16:58:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A930F10EA57;
	Thu, 28 Aug 2025 16:58:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Udn7kfmI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2475710EA57
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Aug 2025 16:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756400302; x=1787936302;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Fg+bmx5gSRawbFlRaa+pP7xHdTrIlTw9vQ5ibZLmm6E=;
 b=Udn7kfmIZOdX0k3c/+hqwgIjhPA17OKzlCbjPYuxrKwarPTEjOTsIXGT
 2Go3nxJR8mQ6bVIP8uO27Zi5NPqM0Id6+ZwY3WmDsTj5615uprjWjkgPJ
 mhxBred+4RfY4lr+hYp0o0otI6DTH/lQa9fgK2lYxMgsvmxIz2syguuDK
 ZBrAtKeeJ5ovhqhVgwc4kLwhmNpoT87BUI+KGBYX0maKEyR25vm/OHa0h
 5pwRjRTm1GZXFqnFB9FNnIflIfSOaGUArTQbaQWXPkOJwohQaoWDEpEEL
 f+UmeAbK9dzE2cIIUIuJNzaOcwV2vafrvUovk9DHnIAPbWfrfq2tWvNJv w==;
X-CSE-ConnectionGUID: kzd41+N3S5S7gxfE3XY+hA==
X-CSE-MsgGUID: FIEa2dqwSD64CgT6lNsLWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="58388081"
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="58388081"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 09:58:22 -0700
X-CSE-ConnectionGUID: 7QMmKcxZTrul3QmXQuubDw==
X-CSE-MsgGUID: tU14nEmZQe67xveCn6k8AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="169685209"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.68])
 by fmviesa007.fm.intel.com with ESMTP; 28 Aug 2025 09:58:20 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, pravalika.gurram@intel.com,
 himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t 1/5] DO-NOT-MERGE: include/drm-uapi: Add drm_xe_madvise
 structure
Date: Thu, 28 Aug 2025 16:58:13 +0000
Message-ID: <20250828165817.97661-2-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250828165817.97661-1-nishit.sharma@intel.com>
References: <20250828165817.97661-1-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Nishit Sharma <nishit.sharma@intel.com>

Defined IOCTL number for madvise operation. Added drm_xe_madvise
which is passed as Input to MADVISE IOCTL.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 include/drm-uapi/xe_drm.h | 289 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 281 insertions(+), 8 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index a52f95593..e9a27a844 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -3,8 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
-#ifndef _XE_DRM_H_
-#define _XE_DRM_H_
+#ifndef _UAPI_XE_DRM_H_
+#define _UAPI_XE_DRM_H_
 
 #include "drm.h"
 
@@ -81,6 +81,8 @@ extern "C" {
  *  - &DRM_IOCTL_XE_EXEC
  *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
  *  - &DRM_IOCTL_XE_OBSERVATION
+ *  - &DRM_IOCTL_XE_MADVISE
+ *  - &DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS
  */
 
 /*
@@ -102,6 +104,8 @@ extern "C" {
 #define DRM_XE_EXEC			0x09
 #define DRM_XE_WAIT_USER_FENCE		0x0a
 #define DRM_XE_OBSERVATION		0x0b
+#define DRM_XE_MADVISE			0x0c
+#define DRM_XE_VM_QUERY_MEM_REGION_ATTRS	0x0d
 
 /* Must be kept compact -- no holes */
 
@@ -117,6 +121,8 @@ extern "C" {
 #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
+#define DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
+#define DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_MEM_REGION_ATTRS, struct drm_xe_vm_query_mem_range_attr)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -134,7 +140,7 @@ extern "C" {
  * redefine the interface more easily than an ever growing struct of
  * increasing complexity, and for large parts of that interface to be
  * entirely optional. The downside is more pointer chasing; chasing across
- * the boundary with pointers encapsulated inside u64.
+ * the __user boundary with pointers encapsulated inside u64.
  *
  * Example chaining:
  *
@@ -925,9 +931,9 @@ struct drm_xe_gem_mmap_offset {
  *  - %DRM_XE_VM_CREATE_FLAG_LR_MODE - An LR, or Long Running VM accepts
  *    exec submissions to its exec_queues that don't have an upper time
  *    limit on the job execution time. But exec submissions to these
- *    don't allow any of the flags DRM_XE_SYNC_FLAG_SYNCOBJ,
- *    DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ, DRM_XE_SYNC_FLAG_DMA_BUF,
- *    used as out-syncobjs, that is, together with DRM_XE_SYNC_FLAG_SIGNAL.
+ *    don't allow any of the sync types DRM_XE_SYNC_TYPE_SYNCOBJ,
+ *    DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ, used as out-syncobjs, that is,
+ *    together with sync flag DRM_XE_SYNC_FLAG_SIGNAL.
  *    LR VMs can be created in recoverable page-fault mode using
  *    DRM_XE_VM_CREATE_FLAG_FAULT_MODE, if the device supports it.
  *    If that flag is omitted, the UMD can not rely on the slightly
@@ -1003,6 +1009,10 @@ struct drm_xe_vm_destroy {
  *    valid on VMs with DRM_XE_VM_CREATE_FLAG_FAULT_MODE set. The CPU address
  *    mirror flag are only valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
  *    handle MBZ, and the BO offset MBZ.
+ *
+ * The @prefetch_mem_region_instance for %DRM_XE_VM_BIND_OP_PREFETCH can also be:
+ *  - %DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC, which ensures prefetching occurs in
+ *    the memory region advised by madvise.
  */
 struct drm_xe_vm_bind_op {
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -1108,6 +1118,7 @@ struct drm_xe_vm_bind_op {
 	/** @flags: Bind flags */
 	__u32 flags;
 
+#define DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC	-1
 	/**
 	 * @prefetch_mem_region_instance: Memory region to prefetch VMA to.
 	 * It is a region instance, not a mask.
@@ -1394,7 +1405,7 @@ struct drm_xe_sync {
 
 	/**
 	 * @timeline_value: Input for the timeline sync object. Needs to be
-	 * different than 0 when used with %DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ.
+	 * different than 0 when used with %DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ.
 	 */
 	__u64 timeline_value;
 
@@ -1974,8 +1985,270 @@ struct drm_xe_query_eu_stall {
 	__u64 sampling_rates[];
 };
 
+/**
+ * struct drm_xe_madvise - Input of &DRM_IOCTL_XE_MADVISE
+ *
+ * This structure is used to set memory attributes for a virtual address range
+ * in a VM. The type of attribute is specified by @type, and the corresponding
+ * union member is used to provide additional parameters for @type.
+ *
+ * Supported attribute types:
+ * - DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC: Set preferred memory location.
+ * - DRM_XE_MEM_RANGE_ATTR_ATOMIC: Set atomic access policy.
+ * - DRM_XE_MEM_RANGE_ATTR_PAT: Set page attribute table index.
+ *
+ * Example:
+ *
+ * .. code-block:: C
+ *
+ * struct drm_xe_madvise madvise = {
+ *          .vm_id = vm_id,
+ *          .start = 0x100000,
+ *          .range = 0x2000,
+ *          .type = DRM_XE_MEM_RANGE_ATTR_ATOMIC,
+ *          .atomic_val = DRM_XE_ATOMIC_DEVICE,
+ *          .pad = 0,
+ *         };
+ *
+ * ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise);
+ *
+ */
+struct drm_xe_madvise {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @start: start of the virtual address range */
+	__u64 start;
+
+	/** @range: size of the virtual address range */
+	__u64 range;
+
+	/** @vm_id: vm_id of the virtual range */
+	__u32 vm_id;
+
+#define DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC	0
+#define DRM_XE_MEM_RANGE_ATTR_ATOMIC		1
+#define DRM_XE_MEM_RANGE_ATTR_PAT		2
+	/** @type: type of attribute */
+	__u32 type;
+
+	union {
+		/**
+		 * @preferred_mem_loc: preferred memory location
+		 *
+		 * Used when @type == DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC
+		 *
+		 * Supported values for @preferred_mem_loc.devmem_fd:
+		 * - DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE: set vram of faulting tile as preferred loc
+		 * - DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM: set smem as preferred loc
+		 *
+		 * Supported values for @preferred_mem_loc.migration_policy:
+		 * - DRM_XE_MIGRATE_ALL_PAGES
+		 * - DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES
+		 */
+		struct {
+#define DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE	0
+#define DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM	-1
+			/** @preferred_mem_loc.devmem_fd: fd for preferred loc */
+			__u32 devmem_fd;
+
+#define DRM_XE_MIGRATE_ALL_PAGES		0
+#define DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES	1
+			/** @preferred_mem_loc.migration_policy: Page migration policy */
+			__u16 migration_policy;
+
+			/** @preferred_mem_loc.pad : MBZ */
+			__u16 pad;
+
+			/** @preferred_mem_loc.reserved : Reserved */
+			__u64 reserved;
+		} preferred_mem_loc;
+
+		/**
+		 * @atomic: Atomic access policy
+		 *
+		 * Used when @type == DRM_XE_MEM_RANGE_ATTR_ATOMIC.
+		 *
+		 * Supported values for @atomic.val:
+		 * - DRM_XE_ATOMIC_UNDEFINED: Undefined or default behaviour
+		 *   Support both GPU and CPU atomic operations for system allocator
+		 *   Support GPU atomic operations for normal(bo) allocator
+		 * - DRM_XE_ATOMIC_DEVICE: Support GPU atomic operations
+		 * - DRM_XE_ATOMIC_GLOBAL: Support both GPU and CPU atomic operations
+		 * - DRM_XE_ATOMIC_CPU: Support CPU atomic
+		 */
+		struct {
+#define DRM_XE_ATOMIC_UNDEFINED	0
+#define DRM_XE_ATOMIC_DEVICE	1
+#define DRM_XE_ATOMIC_GLOBAL	2
+#define DRM_XE_ATOMIC_CPU	3
+			/** @atomic.val: value of atomic operation */
+			__u32 val;
+
+			/** @atomic.pad: MBZ */
+			__u32 pad;
+
+			/** @atomic.reserved: Reserved */
+			__u64 reserved;
+		} atomic;
+
+		/**
+		 * @pat_index: Page attribute table index
+		 *
+		 * Used when @type == DRM_XE_MEM_RANGE_ATTR_PAT.
+		 */
+		struct {
+			/** @pat_index.val: PAT index value */
+			__u32 val;
+
+			/** @pat_index.pad: MBZ */
+			__u32 pad;
+
+			/** @pat_index.reserved: Reserved */
+			__u64 reserved;
+		} pat_index;
+	};
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
+/**
+ * struct drm_xe_mem_range_attr - Output of &DRM_IOCTL_XE_VM_QUERY_MEM_RANGES_ATTRS
+ *
+ * This structure is provided by userspace and filled by KMD in response to the
+ * DRM_IOCTL_XE_VM_QUERY_MEM_RANGES_ATTRS ioctl. It describes memory attributes of
+ * a memory ranges within a user specified address range in a VM.
+ *
+ * The structure includes information such as atomic access policy,
+ * page attribute table (PAT) index, and preferred memory location.
+ * Userspace allocates an array of these structures and passes a pointer to the
+ * ioctl to retrieve attributes for each memory ranges
+ *
+ * @extensions: Pointer to the first extension struct, if any
+ * @start: Start address of the memory range
+ * @end: End address of the virtual memory range
+ *
+ */
+struct drm_xe_mem_range_attr {
+	 /** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @start: start of the memory range */
+	__u64 start;
+
+	/** @end: end of the memory range */
+	__u64 end;
+
+	/** @preferred_mem_loc: preferred memory location */
+	struct {
+		/** @preferred_mem_loc.devmem_fd: fd for preferred loc */
+		__u32 devmem_fd;
+
+		/** @preferred_mem_loc.migration_policy: Page migration policy */
+		__u32 migration_policy;
+	} preferred_mem_loc;
+
+	struct {
+		/** @atomic.val: atomic attribute */
+		__u32 val;
+
+		/** @atomic.reserved: Reserved */
+		__u32 reserved;
+	} atomic;
+
+	struct {
+		/** @pat_index.val: PAT index */
+		__u32 val;
+
+		/** @pat_index.reserved: Reserved */
+		__u32 reserved;
+	} pat_index;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
+/**
+ * struct drm_xe_vm_query_mem_range_attr - Input of &DRM_IOCTL_XE_VM_QUERY_MEM_ATTRIBUTES
+ *
+ * This structure is used to query memory attributes of memory regions
+ * within a user specified address range in a VM. It provides detailed
+ * information about each memory range, including atomic access policy,
+ * page attribute table (PAT) index, and preferred memory location.
+ *
+ * Userspace first calls the ioctl with @num_mem_ranges = 0,
+ * @sizeof_mem_ranges_attr = 0 and @vector_of_vma_mem_attr = NULL to retrieve
+ * the number of memory regions and size of each memory range attribute.
+ * Then, it allocates a buffer of that size and calls the ioctl again to fill
+ * the buffer with memory range attributes.
+ *
+ * If second call fails with -ENOSPC, it means memory ranges changed between
+ * first call and now, retry IOCTL again with @num_mem_ranges = 0,
+ * @sizeof_mem_ranges_attr = 0 and @vector_of_vma_mem_attr = NULL followed by
+ * Second ioctl call.
+ *
+ * Example:
+ *
+ * .. code-block:: C
+ *    struct drm_xe_vm_query_mem_range_attr query = {
+ *         .vm_id = vm_id,
+ *         .start = 0x100000,
+ *         .range = 0x2000,
+ *     };
+ *
+ *    // First ioctl call to get num of mem regions and sizeof each attribute
+ *    ioctl(fd, DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS, &query);
+ *
+ *    // Allocate buffer for the memory region attributes
+ *    void *ptr = malloc(query.num_mem_ranges * query.sizeof_mem_range_attr);
+ *
+ *    query.vector_of_mem_attr = (uintptr_t)ptr;
+ *
+ *    // Second ioctl call to actually fill the memory attributes
+ *    ioctl(fd, DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS, &query);
+ *
+ *    // Iterate over the returned memory region attributes
+ *    for (unsigned int i = 0; i < query.num_mem_ranges; ++i) {
+ *       struct drm_xe_mem_range_attr *attr = (struct drm_xe_mem_range_attr *)ptr;
+ *
+ *       // Do something with attr
+ *
+ *       // Move pointer by one entry
+ *       ptr += query.sizeof_mem_range_attr;
+ *     }
+ *
+ *    free(ptr);
+ */
+struct drm_xe_vm_query_mem_range_attr {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @vm_id: vm_id of the virtual range */
+	__u32 vm_id;
+
+	/** @num_mem_ranges: number of mem_ranges in range */
+	__u32 num_mem_ranges;
+
+	/** @start: start of the virtual address range */
+	__u64 start;
+
+	/** @range: size of the virtual address range */
+	__u64 range;
+
+	/** @sizeof_mem_range_attr: size of struct drm_xe_mem_range_attr */
+	__u64 sizeof_mem_range_attr;
+
+	/** @vector_of_ops: userptr to array of struct drm_xe_mem_range_attr */
+	__u64 vector_of_mem_attr;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+
+};
+
 #if defined(__cplusplus)
 }
 #endif
 
-#endif /* _XE_DRM_H_ */
+#endif /* _UAPI_XE_DRM_H_ */
-- 
2.43.0

