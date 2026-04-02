Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFED6D3941D
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 13:40:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB6210EE14;
	Thu,  2 Apr 2026 13:40:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ldCgfRiJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84FFC10EE1C
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 13:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775137207; x=1806673207;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GAuqP1MT/jbmL1uZvuVLFvilPIZ85MQfGffSspj8jBU=;
 b=ldCgfRiJD7xhCKkNAz0/Ioj+UG9X99qIP8dpjT0N4tKJQl4Fqu8+NZ5J
 tz0bmWsWJEMzu18jt3prbE3u5vsSteOxniQJ0V73Bvl/ECVHPnZl+AqPa
 qxDPmdfCzeTZDfuZE9wWURO6aGcwEC2/2+iekYxyzSDBB4aQYBN8apN9r
 BMeGbDmD0GmEXyJmavU9apEGrVmuBL4sNOqkKa5nuaeSduply3M0DbWB/
 vZH34iFSkR3GAnXDXfgIpqWJ3CVUn+jbG1xiUZ6IuCxz8+MYVsGNoxzlR
 xD6UJT3JQAlJokKb2+LyoPcqHYFiVo85ZlHvrO5ZnUY2osoDw2BEymj2H g==;
X-CSE-ConnectionGUID: pOWXGR2MRIq8HYyziuHq7A==
X-CSE-MsgGUID: WtN8+ngKQIyhwNcR1s/TyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76082212"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="76082212"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 06:40:07 -0700
X-CSE-ConnectionGUID: azbSC5R7QT2fyi8dtSc9GQ==
X-CSE-MsgGUID: K2k6XMaUQ5CufeR3rU5hsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="231908670"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.63])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 06:40:04 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Ivan Briano <ivan.briano@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Nishit Sharma <nishit.sharma@intel.com>
Subject: [PATCH i-g-t] drm-uapi/xe: sync with kernel f99a05cc0b85
Date: Thu,  2 Apr 2026 15:39:58 +0200
Message-ID: <20260402134000.100432-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Sync Xe drm uapi with drm-next up to commit f99a05cc0b85, this
will bring following changes:

f99a05cc0b85 ("drm/xe/uapi: Add UAPI support for purgeable buffer objects")
716c11d462c5 ("drm/xe/uapi: Define drm_xe_vm_get_property")
4f39a194d41e ("drm/xe/xe3p_lpg: Restrict UAPI to enable L2 flush optimization")
341a2c99c87c ("drm/xe/uapi: Fix kernel-doc for DRM_XE_VM_BIND_FLAG_DECOMPRESS")
2270bd7124f4 ("drm/xe: add VM_BIND DECOMPRESS uapi flag")
0e07b16371b6 ("drm/xe: Allow per queue programming of COMMON_SLICE_CHICKEN3 bit13")
b40db12b542f ("drm/xe/xe_drm_ras: Add support for XE DRM RAS")
369cc8804985 ("drm/xe/uapi: Introduce a flag to disallow vm overcommit in fault mode")
dc90ead44054 ("drm/xe/uapi: update used tracking kernel-doc")

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Ivan Briano <ivan.briano@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Nishit Sharma <nishit.sharma@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 include/drm-uapi/xe_drm.h | 276 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 264 insertions(+), 12 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 077e66a68..5a96a7910 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -3,8 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
-#ifndef _UAPI_XE_DRM_H_
-#define _UAPI_XE_DRM_H_
+#ifndef _XE_DRM_H_
+#define _XE_DRM_H_
 
 #include "drm.h"
 
@@ -83,6 +83,7 @@ extern "C" {
  *  - &DRM_IOCTL_XE_OBSERVATION
  *  - &DRM_IOCTL_XE_MADVISE
  *  - &DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS
+ *  - &DRM_IOCTL_XE_VM_GET_PROPERTY
  */
 
 /*
@@ -107,6 +108,7 @@ extern "C" {
 #define DRM_XE_MADVISE			0x0c
 #define DRM_XE_VM_QUERY_MEM_RANGE_ATTRS	0x0d
 #define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x0e
+#define DRM_XE_VM_GET_PROPERTY		0x0f
 
 /* Must be kept compact -- no holes */
 
@@ -125,6 +127,7 @@ extern "C" {
 #define DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
 #define DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_MEM_RANGE_ATTRS, struct drm_xe_vm_query_mem_range_attr)
 #define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
+#define DRM_IOCTL_XE_VM_GET_PROPERTY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_GET_PROPERTY, struct drm_xe_vm_get_property)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -142,7 +145,7 @@ extern "C" {
  * redefine the interface more easily than an ever growing struct of
  * increasing complexity, and for large parts of that interface to be
  * entirely optional. The downside is more pointer chasing; chasing across
- * the __user boundary with pointers encapsulated inside u64.
+ * the boundary with pointers encapsulated inside u64.
  *
  * Example chaining:
  *
@@ -335,10 +338,6 @@ struct drm_xe_mem_region {
 	__u64 total_size;
 	/**
 	 * @used: Estimate of the memory used in bytes for this region.
-	 *
-	 * Requires CAP_PERFMON or CAP_SYS_ADMIN to get reliable
-	 * accounting.  Without this the value here will always equal
-	 * zero.
 	 */
 	__u64 used;
 	/**
@@ -363,9 +362,7 @@ struct drm_xe_mem_region {
 	 * @cpu_visible_used: Estimate of CPU visible memory used, in
 	 * bytes.
 	 *
-	 * Requires CAP_PERFMON or CAP_SYS_ADMIN to get reliable
-	 * accounting. Without this the value here will always equal
-	 * zero.  Note this is only currently tracked for
+	 * Note this is only currently tracked for
 	 * DRM_XE_MEM_REGION_CLASS_VRAM regions (for other types the value
 	 * here will always be zero).
 	 */
@@ -412,6 +409,9 @@ struct drm_xe_query_mem_regions {
  *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT - Flag is set if the
  *      device supports the userspace hint %DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION.
  *      This is exposed only on Xe2+.
+ *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_STATE_CACHE_PERF_FIX - Flag is set
+ *      if a queue can be creaed with
+ *      %DRM_XE_EXEC_QUEUE_SET_DISABLE_STATE_CACHE_PERF_FIX
  *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
  *    required by this device, typically SZ_4K or SZ_64K
  *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
@@ -431,6 +431,8 @@ struct drm_xe_query_config {
 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 << 1)
 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR	(1 << 2)
 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT (1 << 3)
+	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_STATE_CACHE_PERF_FIX	(1 << 4)
+	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_PURGING_SUPPORT    (1 << 5)
 #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 #define DRM_XE_QUERY_CONFIG_VA_BITS			3
 #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
@@ -975,6 +977,11 @@ struct drm_xe_gem_mmap_offset {
  *    demand when accessed, and also allows per-VM overcommit of memory.
  *    The xe driver internally uses recoverable pagefaults to implement
  *    this.
+ *  - %DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT - Requires also
+ *    DRM_XE_VM_CREATE_FLAG_FAULT_MODE. This disallows per-VM overcommit
+ *    but only during a &DRM_IOCTL_XE_VM_BIND operation with the
+ *    %DRM_XE_VM_BIND_FLAG_IMMEDIATE flag set. This may be useful for
+ *    user-space naively probing the amount of available memory.
  */
 struct drm_xe_vm_create {
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -983,6 +990,7 @@ struct drm_xe_vm_create {
 #define DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE	(1 << 0)
 #define DRM_XE_VM_CREATE_FLAG_LR_MODE	        (1 << 1)
 #define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 2)
+#define DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT  (1 << 3)
 	/** @flags: Flags */
 	__u32 flags;
 
@@ -1053,6 +1061,13 @@ struct drm_xe_vm_destroy {
  *    not invoke autoreset. Neither will stack variables going out of scope.
  *    Therefore it's recommended to always explicitly reset the madvises when
  *    freeing the memory backing a region used in a &DRM_IOCTL_XE_MADVISE call.
+ *  - %DRM_XE_VM_BIND_FLAG_DECOMPRESS - Request on-device decompression for a MAP.
+ *    When set on a MAP bind operation, request the driver schedule an on-device
+ *    in-place decompression (via the migrate/resolve path) for the GPU mapping
+ *    created by this bind. Only valid for DRM_XE_VM_BIND_OP_MAP; usage on
+ *    other ops is rejected. The bind's pat_index must select the device's
+ *    "no-compression" PAT. Only meaningful for VRAM-backed BOs on devices that
+ *    support Flat CCS and the required HW generation XE2+.
  *
  * The @prefetch_mem_region_instance for %DRM_XE_VM_BIND_OP_PREFETCH can also be:
  *  - %DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC, which ensures prefetching occurs in
@@ -1103,7 +1118,9 @@ struct drm_xe_vm_bind_op {
 	 * incoherent GT access is possible.
 	 *
 	 * Note: For userptr and externally imported dma-buf the kernel expects
-	 * either 1WAY or 2WAY for the @pat_index.
+	 * either 1WAY or 2WAY for the @pat_index. Starting from NVL-P, for
+	 * userptr, svm, madvise and externally imported dma-buf the kernel expects
+	 * either 2WAY or 1WAY and XA @pat_index.
 	 *
 	 * For DRM_XE_VM_BIND_FLAG_NULL bindings there are no KMD restrictions
 	 * on the @pat_index. For such mappings there is no actual memory being
@@ -1160,6 +1177,7 @@ struct drm_xe_vm_bind_op {
 #define DRM_XE_VM_BIND_FLAG_CHECK_PXP	(1 << 4)
 #define DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR	(1 << 5)
 #define DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET	(1 << 6)
+#define DRM_XE_VM_BIND_FLAG_DECOMPRESS (1 << 7)
 	/** @flags: Bind flags */
 	__u32 flags;
 
@@ -1249,6 +1267,89 @@ struct drm_xe_vm_bind {
 	__u64 reserved[2];
 };
 
+/** struct xe_vm_fault - Describes faults for %DRM_XE_VM_GET_PROPERTY_FAULTS */
+struct xe_vm_fault {
+	/** @address: Canonical address of the fault */
+	__u64 address;
+	/** @address_precision: Precision of faulted address */
+	__u32 address_precision;
+	/** @access_type: Type of address access that resulted in fault */
+#define FAULT_ACCESS_TYPE_READ		0
+#define FAULT_ACCESS_TYPE_WRITE		1
+#define FAULT_ACCESS_TYPE_ATOMIC	2
+	__u8 access_type;
+	/** @fault_type: Type of fault reported */
+#define FAULT_TYPE_NOT_PRESENT		0
+#define FAULT_TYPE_WRITE_ACCESS		1
+#define FAULT_TYPE_ATOMIC_ACCESS	2
+	__u8 fault_type;
+	/** @fault_level: fault level of the fault */
+#define FAULT_LEVEL_PTE		0
+#define FAULT_LEVEL_PDE		1
+#define FAULT_LEVEL_PDP		2
+#define FAULT_LEVEL_PML4	3
+#define FAULT_LEVEL_PML5	4
+	__u8 fault_level;
+	/** @pad: MBZ */
+	__u8 pad;
+	/** @reserved: MBZ */
+	__u64 reserved[4];
+};
+
+/**
+ * struct drm_xe_vm_get_property - Input of &DRM_IOCTL_XE_VM_GET_PROPERTY
+ *
+ * The user provides a VM and a property to query among DRM_XE_VM_GET_PROPERTY_*,
+ * and sets the values in the vm_id and property members, respectively.  This
+ * determines both the VM to get the property of, as well as the property to
+ * report.
+ *
+ * If size is set to 0, the driver fills it with the required size for the
+ * requested property.  The user is expected here to allocate memory for the
+ * property structure and to provide a pointer to the allocated memory using the
+ * data member.  For some properties, this may be zero, in which case, the
+ * value of the property will be saved to the value member and size will remain
+ * zero on return.
+ *
+ * If size is not zero, then the IOCTL will attempt to copy the requested
+ * property into the data member.
+ *
+ * The IOCTL will return -ENOENT if the VM could not be identified from the
+ * provided VM ID, or -EINVAL if the IOCTL fails for any other reason, such as
+ * providing an invalid size for the given property or if the property data
+ * could not be copied to the memory allocated to the data member.
+ *
+ * The property member can be:
+ *  - %DRM_XE_VM_GET_PROPERTY_FAULTS
+ */
+struct drm_xe_vm_get_property {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @vm_id: The ID of the VM to query the properties of */
+	__u32 vm_id;
+
+#define DRM_XE_VM_GET_PROPERTY_FAULTS		0
+	/** @property: property to get */
+	__u32 property;
+
+	/** @size: Size to allocate for @data */
+	__u32 size;
+
+	/** @pad: MBZ */
+	__u32 pad;
+
+	union {
+		/** @data: Pointer to user-defined array of flexible size and type */
+		__u64 data;
+		/** @value: Return value for scalar queries */
+		__u64 value;
+	};
+
+	/** @reserved: MBZ */
+	__u64 reserved[3];
+};
+
 /**
  * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
  *
@@ -1285,6 +1386,9 @@ struct drm_xe_vm_bind {
  *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY - Set the queue
  *    priority within the multi-queue group. Current valid priority values are 0–2
  *    (default is 1), with higher values indicating higher priority.
+ *  - %DRM_XE_EXEC_QUEUE_SET_DISABLE_STATE_CACHE_PERF_FIX - Set the queue to
+ *    enable render color cache keying on BTP+BTI instead of just BTI
+ *    (only valid for render queues).
  *
  * The example below shows how to use @drm_xe_exec_queue_create to create
  * a simple exec_queue (no parallel submission) of class
@@ -1329,6 +1433,7 @@ struct drm_xe_exec_queue_create {
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		4
 #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	5
+#define   DRM_XE_EXEC_QUEUE_SET_DISABLE_STATE_CACHE_PERF_FIX	6
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
@@ -2067,6 +2172,7 @@ struct drm_xe_query_eu_stall {
  *  - DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC: Set preferred memory location.
  *  - DRM_XE_MEM_RANGE_ATTR_ATOMIC: Set atomic access policy.
  *  - DRM_XE_MEM_RANGE_ATTR_PAT: Set page attribute table index.
+ *  - DRM_XE_VMA_ATTR_PURGEABLE_STATE: Set purgeable state for BOs.
  *
  * Example:
  *
@@ -2099,6 +2205,7 @@ struct drm_xe_madvise {
 #define DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC	0
 #define DRM_XE_MEM_RANGE_ATTR_ATOMIC		1
 #define DRM_XE_MEM_RANGE_ATTR_PAT		2
+#define DRM_XE_VMA_ATTR_PURGEABLE_STATE		3
 	/** @type: type of attribute */
 	__u32 type;
 
@@ -2189,6 +2296,72 @@ struct drm_xe_madvise {
 			/** @pat_index.reserved: Reserved */
 			__u64 reserved;
 		} pat_index;
+
+		/**
+		 * @purge_state_val: Purgeable state configuration
+		 *
+		 * Used when @type == DRM_XE_VMA_ATTR_PURGEABLE_STATE.
+		 *
+		 * Configures the purgeable state of buffer objects in the specified
+		 * virtual address range. This allows applications to hint to the kernel
+		 * about bo's usage patterns for better memory management.
+		 *
+		 * By default all VMAs are in WILLNEED state.
+		 *
+		 * Supported values for @purge_state_val.val:
+		 *  - DRM_XE_VMA_PURGEABLE_STATE_WILLNEED (0): Marks BO as needed.
+		 *    If the BO was previously purged, the kernel sets the __u32 at
+		 *    @retained_ptr to 0 (backing store lost) so the application knows
+		 *    it must recreate the BO.
+		 *
+		 *  - DRM_XE_VMA_PURGEABLE_STATE_DONTNEED (1): Marks BO as not currently
+		 *    needed. Kernel may purge it under memory pressure to reclaim memory.
+		 *    Only applies to non-shared BOs. The kernel sets the __u32 at
+		 *    @retained_ptr to 1 if the backing store still exists (not yet purged),
+		 *    or 0 if it was already purged.
+		 *
+		 *    Important: Once marked as DONTNEED, touching the BO's memory
+		 *    is undefined behavior. It may succeed temporarily (before the
+		 *    kernel purges the backing store) but will suddenly fail once
+		 *    the BO transitions to PURGED state.
+		 *
+		 *    To transition back: use WILLNEED and check @retained_ptr —
+		 *    if 0, backing store was lost and the BO must be recreated.
+		 *
+		 *    The following operations are blocked in DONTNEED state to
+		 *    prevent the BO from being re-mapped after madvise:
+		 *    - New mmap() calls: Fail with -EBUSY
+		 *    - VM_BIND operations: Fail with -EBUSY
+		 *    - New dma-buf exports: Fail with -EBUSY
+		 *    - CPU page faults (existing mmap): Fail with SIGBUS
+		 *    - GPU page faults (fault-mode VMs): Fail with -EACCES
+		 */
+		struct {
+#define DRM_XE_VMA_PURGEABLE_STATE_WILLNEED	0
+#define DRM_XE_VMA_PURGEABLE_STATE_DONTNEED	1
+			/** @purge_state_val.val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE */
+			__u32 val;
+
+			/** @purge_state_val.pad: MBZ */
+			__u32 pad;
+			/**
+			 * @purge_state_val.retained_ptr: Pointer to a __u32 output
+			 * field for backing store status.
+			 *
+			 * Userspace must initialize the __u32 value at this address
+			 * to 0 before the ioctl. Kernel writes a __u32 after the
+			 * operation:
+			 * - 1 if backing store exists (not purged)
+			 * - 0 if backing store was purged
+			 *
+			 * If userspace fails to initialize to 0, ioctl returns -EINVAL.
+			 * This ensures a safe default (0 = assume purged) if kernel
+			 * cannot write the result.
+			 *
+			 * Similar to i915's drm_i915_gem_madvise.retained field.
+			 */
+			__u64 retained_ptr;
+		} purge_state_val;
 	};
 
 	/** @reserved: Reserved */
@@ -2357,8 +2530,87 @@ struct drm_xe_exec_queue_set_property {
 	__u64 reserved[2];
 };
 
+/**
+ * DOC: Xe DRM RAS
+ *
+ * The enums and strings defined below map to the attributes of the DRM RAS Netlink Interface.
+ * Refer to Documentation/netlink/specs/drm_ras.yaml for complete interface specification.
+ *
+ * Node Registration
+ * =================
+ *
+ * The driver registers DRM RAS nodes for each error severity level.
+ * enum drm_xe_ras_error_severity defines the node-id, while DRM_XE_RAS_ERROR_SEVERITY_NAMES maps
+ * node-id to node-name.
+ *
+ * Error Classification
+ * ====================
+ *
+ * Each node contains a list of error counters. Each error is identified by a error-id and
+ * an error-name. enum drm_xe_ras_error_component defines the error-id, while
+ * DRM_XE_RAS_ERROR_COMPONENT_NAMES maps error-id to error-name.
+ *
+ * User Interface
+ * ==============
+ *
+ * To retrieve error values of a error counter, userspace applications should
+ * follow the below steps:
+ *
+ * 1. Use command LIST_NODES to enumerate all available nodes
+ * 2. Select node by node-id or node-name
+ * 3. Use command GET_ERROR_COUNTERS to list errors of specific node
+ * 4. Query specific error values using either error-id or error-name
+ *
+ * .. code-block:: C
+ *
+ *	// Lookup tables for ID-to-name resolution
+ *	static const char *nodes[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
+ *	static const char *errors[] = DRM_XE_RAS_ERROR_COMPONENT_NAMES;
+ *
+ */
+
+/**
+ * enum drm_xe_ras_error_severity - DRM RAS error severity.
+ */
+enum drm_xe_ras_error_severity {
+	/** @DRM_XE_RAS_ERR_SEV_CORRECTABLE: Correctable Error */
+	DRM_XE_RAS_ERR_SEV_CORRECTABLE = 0,
+	/** @DRM_XE_RAS_ERR_SEV_UNCORRECTABLE: Uncorrectable Error */
+	DRM_XE_RAS_ERR_SEV_UNCORRECTABLE,
+	/** @DRM_XE_RAS_ERR_SEV_MAX: Max severity */
+	DRM_XE_RAS_ERR_SEV_MAX /* non-ABI */
+};
+
+/**
+ * enum drm_xe_ras_error_component - DRM RAS error component.
+ */
+enum drm_xe_ras_error_component {
+	/** @DRM_XE_RAS_ERR_COMP_CORE_COMPUTE: Core Compute Error */
+	DRM_XE_RAS_ERR_COMP_CORE_COMPUTE = 1,
+	/** @DRM_XE_RAS_ERR_COMP_SOC_INTERNAL: SoC Internal Error */
+	DRM_XE_RAS_ERR_COMP_SOC_INTERNAL,
+	/** @DRM_XE_RAS_ERR_COMP_MAX: Max Error */
+	DRM_XE_RAS_ERR_COMP_MAX	/* non-ABI */
+};
+
+/*
+ * Error severity to name mapping.
+ */
+#define DRM_XE_RAS_ERROR_SEVERITY_NAMES {				\
+	[DRM_XE_RAS_ERR_SEV_CORRECTABLE] = "correctable-errors",	\
+	[DRM_XE_RAS_ERR_SEV_UNCORRECTABLE] = "uncorrectable-errors",	\
+}
+
+/*
+ * Error component to name mapping.
+ */
+#define DRM_XE_RAS_ERROR_COMPONENT_NAMES {				\
+	[DRM_XE_RAS_ERR_COMP_CORE_COMPUTE] = "core-compute",		\
+	[DRM_XE_RAS_ERR_COMP_SOC_INTERNAL] = "soc-internal"		\
+}
+
 #if defined(__cplusplus)
 }
 #endif
 
-#endif /* _UAPI_XE_DRM_H_ */
+#endif /* _XE_DRM_H_ */
-- 
2.53.0

