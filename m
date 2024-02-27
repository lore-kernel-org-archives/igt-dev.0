Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B17FC54798
	for <igt-dev@archiver.kernel.org>; Tue, 27 Feb 2024 05:27:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED6F910F01A;
	Tue, 27 Feb 2024 05:27:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T552XCXS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 676CE10F01A
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Feb 2024 05:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709011667; x=1740547667;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jFj8WRyKPyCWCBZB9zn5UVwOYIRLPlzZDGWPbOuPois=;
 b=T552XCXS6yLSu/mi+mcHUTd/RvJj5CI5Ta9y6V2RPzKatlKepMvHY0gN
 jmLgEh1NQOhC2NE/YxLOfcp6T9cD3gkMsrCwyKIALqSBLdGsEO0wUtBVx
 d81gyYgjavtHQRJOtT8Rk29sZesqpot14fTIa+Vk2hiiOy9NvzjHLYhcU
 mXd/k+N7BjtcwD3cT4BWwXhU5RfD/0gw/alrjc7zQFZYNq7MX+830rJ7N
 nV069F+Sfw3K/Q06A5MnO5EegCjGqJIAO2CGKnsswGuGd13R/vIZ1gl2m
 updY/WkCP5d8w5Ceh7iMTks8dWqYktUVc7/8RqHq9bVSTJj+LtJKpbzv/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3500517"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="3500517"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 21:27:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="6881016"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 21:27:45 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] drm-uapi: sync with drm-next f112b68f273f
Date: Mon, 26 Feb 2024 21:27:40 -0800
Message-ID: <20240227052740.1811860-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
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

Sync with drm-next commit 'f112b68f273f ("Merge v6.8-rc6 into drm-next")'.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 include/drm-uapi/i915_drm.h    | 24 +++++++++---
 include/drm-uapi/nouveau_drm.h | 70 ++++++++++++++++++++--------------
 include/drm-uapi/xe_drm.h      | 51 +++++++++++++++++++++++++
 3 files changed, 110 insertions(+), 35 deletions(-)

diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
index ce9fa2812e..fe3cf9bca5 100644
--- a/include/drm-uapi/i915_drm.h
+++ b/include/drm-uapi/i915_drm.h
@@ -693,7 +693,7 @@ typedef struct drm_i915_irq_wait {
 #define I915_PARAM_HAS_EXEC_FENCE	 44
 
 /* Query whether DRM_I915_GEM_EXECBUFFER2 supports the ability to capture
- * user specified bufffers for post-mortem debugging of GPU hangs. See
+ * user-specified buffers for post-mortem debugging of GPU hangs. See
  * EXEC_OBJECT_CAPTURE.
  */
 #define I915_PARAM_HAS_EXEC_CAPTURE	 45
@@ -1606,7 +1606,7 @@ struct drm_i915_gem_busy {
 	 * is accurate.
 	 *
 	 * The returned dword is split into two fields to indicate both
-	 * the engine classess on which the object is being read, and the
+	 * the engine classes on which the object is being read, and the
 	 * engine class on which it is currently being written (if any).
 	 *
 	 * The low word (bits 0:15) indicate if the object is being written
@@ -1815,7 +1815,7 @@ struct drm_i915_gem_madvise {
 	__u32 handle;
 
 	/* Advice: either the buffer will be needed again in the near future,
-	 *         or wont be and could be discarded under memory pressure.
+	 *         or won't be and could be discarded under memory pressure.
 	 */
 	__u32 madv;
 
@@ -3013,6 +3013,7 @@ struct drm_i915_query_item {
 	 *  - %DRM_I915_QUERY_MEMORY_REGIONS (see struct drm_i915_query_memory_regions)
 	 *  - %DRM_I915_QUERY_HWCONFIG_BLOB (see `GuC HWCONFIG blob uAPI`)
 	 *  - %DRM_I915_QUERY_GEOMETRY_SUBSLICES (see struct drm_i915_query_topology_info)
+	 *  - %DRM_I915_QUERY_GUC_SUBMISSION_VERSION (see struct drm_i915_query_guc_submission_version)
 	 */
 	__u64 query_id;
 #define DRM_I915_QUERY_TOPOLOGY_INFO		1
@@ -3021,6 +3022,7 @@ struct drm_i915_query_item {
 #define DRM_I915_QUERY_MEMORY_REGIONS		4
 #define DRM_I915_QUERY_HWCONFIG_BLOB		5
 #define DRM_I915_QUERY_GEOMETRY_SUBSLICES	6
+#define DRM_I915_QUERY_GUC_SUBMISSION_VERSION	7
 /* Must be kept compact -- no holes and well documented */
 
 	/**
@@ -3246,7 +3248,7 @@ struct drm_i915_query_topology_info {
  * 	// enough to hold our array of engines. The kernel will fill out the
  * 	// item.length for us, which is the number of bytes we need.
  * 	//
- * 	// Alternatively a large buffer can be allocated straight away enabling
+ *	// Alternatively a large buffer can be allocated straightaway enabling
  * 	// querying in one pass, in which case item.length should contain the
  * 	// length of the provided buffer.
  * 	err = ioctl(fd, DRM_IOCTL_I915_QUERY, &query);
@@ -3256,7 +3258,7 @@ struct drm_i915_query_topology_info {
  * 	// Now that we allocated the required number of bytes, we call the ioctl
  * 	// again, this time with the data_ptr pointing to our newly allocated
  * 	// blob, which the kernel can then populate with info on all engines.
- * 	item.data_ptr = (uintptr_t)&info,
+ *	item.data_ptr = (uintptr_t)&info;
  *
  * 	err = ioctl(fd, DRM_IOCTL_I915_QUERY, &query);
  * 	if (err) ...
@@ -3286,7 +3288,7 @@ struct drm_i915_query_topology_info {
 /**
  * struct drm_i915_engine_info
  *
- * Describes one engine and it's capabilities as known to the driver.
+ * Describes one engine and its capabilities as known to the driver.
  */
 struct drm_i915_engine_info {
 	/** @engine: Engine class and instance. */
@@ -3566,6 +3568,16 @@ struct drm_i915_query_memory_regions {
 	struct drm_i915_memory_region_info regions[];
 };
 
+/**
+ * struct drm_i915_query_guc_submission_version - query GuC submission interface version
+ */
+struct drm_i915_query_guc_submission_version {
+	__u32 branch;
+	__u32 major;
+	__u32 minor;
+	__u32 patch;
+};
+
 /**
  * DOC: GuC HWCONFIG blob uAPI
  *
diff --git a/include/drm-uapi/nouveau_drm.h b/include/drm-uapi/nouveau_drm.h
index 0bade1592f..cd84227f1b 100644
--- a/include/drm-uapi/nouveau_drm.h
+++ b/include/drm-uapi/nouveau_drm.h
@@ -54,6 +54,20 @@ extern "C" {
  */
 #define NOUVEAU_GETPARAM_EXEC_PUSH_MAX   17
 
+/*
+ * NOUVEAU_GETPARAM_VRAM_BAR_SIZE - query bar size
+ *
+ * Query the VRAM BAR size.
+ */
+#define NOUVEAU_GETPARAM_VRAM_BAR_SIZE 18
+
+/*
+ * NOUVEAU_GETPARAM_VRAM_USED
+ *
+ * Get remaining VRAM size.
+ */
+#define NOUVEAU_GETPARAM_VRAM_USED 19
+
 struct drm_nouveau_getparam {
 	__u64 param;
 	__u64 value;
@@ -238,34 +252,32 @@ struct drm_nouveau_vm_init {
 struct drm_nouveau_vm_bind_op {
 	/**
 	 * @op: the operation type
+	 *
+	 * Supported values:
+	 *
+	 * %DRM_NOUVEAU_VM_BIND_OP_MAP - Map a GEM object to the GPU's VA
+	 * space. Optionally, the &DRM_NOUVEAU_VM_BIND_SPARSE flag can be
+	 * passed to instruct the kernel to create sparse mappings for the
+	 * given range.
+	 *
+	 * %DRM_NOUVEAU_VM_BIND_OP_UNMAP - Unmap an existing mapping in the
+	 * GPU's VA space. If the region the mapping is located in is a
+	 * sparse region, new sparse mappings are created where the unmapped
+	 * (memory backed) mapping was mapped previously. To remove a sparse
+	 * region the &DRM_NOUVEAU_VM_BIND_SPARSE must be set.
 	 */
 	__u32 op;
-/**
- * @DRM_NOUVEAU_VM_BIND_OP_MAP:
- *
- * Map a GEM object to the GPU's VA space. Optionally, the
- * &DRM_NOUVEAU_VM_BIND_SPARSE flag can be passed to instruct the kernel to
- * create sparse mappings for the given range.
- */
 #define DRM_NOUVEAU_VM_BIND_OP_MAP 0x0
-/**
- * @DRM_NOUVEAU_VM_BIND_OP_UNMAP:
- *
- * Unmap an existing mapping in the GPU's VA space. If the region the mapping
- * is located in is a sparse region, new sparse mappings are created where the
- * unmapped (memory backed) mapping was mapped previously. To remove a sparse
- * region the &DRM_NOUVEAU_VM_BIND_SPARSE must be set.
- */
 #define DRM_NOUVEAU_VM_BIND_OP_UNMAP 0x1
 	/**
 	 * @flags: the flags for a &drm_nouveau_vm_bind_op
+	 *
+	 * Supported values:
+	 *
+	 * %DRM_NOUVEAU_VM_BIND_SPARSE - Indicates that an allocated VA
+	 * space region should be sparse.
 	 */
 	__u32 flags;
-/**
- * @DRM_NOUVEAU_VM_BIND_SPARSE:
- *
- * Indicates that an allocated VA space region should be sparse.
- */
 #define DRM_NOUVEAU_VM_BIND_SPARSE (1 << 8)
 	/**
 	 * @handle: the handle of the DRM GEM object to map
@@ -301,17 +313,17 @@ struct drm_nouveau_vm_bind {
 	__u32 op_count;
 	/**
 	 * @flags: the flags for a &drm_nouveau_vm_bind ioctl
+	 *
+	 * Supported values:
+	 *
+	 * %DRM_NOUVEAU_VM_BIND_RUN_ASYNC - Indicates that the given VM_BIND
+	 * operation should be executed asynchronously by the kernel.
+	 *
+	 * If this flag is not supplied the kernel executes the associated
+	 * operations synchronously and doesn't accept any &drm_nouveau_sync
+	 * objects.
 	 */
 	__u32 flags;
-/**
- * @DRM_NOUVEAU_VM_BIND_RUN_ASYNC:
- *
- * Indicates that the given VM_BIND operation should be executed asynchronously
- * by the kernel.
- *
- * If this flag is not supplied the kernel executes the associated operations
- * synchronously and doesn't accept any &drm_nouveau_sync objects.
- */
 #define DRM_NOUVEAU_VM_BIND_RUN_ASYNC 0x1
 	/**
 	 * @wait_count: the number of wait &drm_nouveau_syncs
diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 2417a9654d..0d2ff6efd1 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -574,6 +574,36 @@ struct drm_xe_query_engine_cycles {
 	__u64 cpu_delta;
 };
 
+/**
+ * struct drm_xe_query_uc_fw_version - query a micro-controller firmware version
+ *
+ * Given a uc_type this will return the branch, major, minor and patch version
+ * of the micro-controller firmware.
+ */
+struct drm_xe_query_uc_fw_version {
+	/** @uc_type: The micro-controller type to query firmware version */
+#define XE_QUERY_UC_TYPE_GUC_SUBMISSION 0
+	__u16 uc_type;
+
+	/** @pad: MBZ */
+	__u16 pad;
+
+	/** @branch_ver: branch uc fw version */
+	__u32 branch_ver;
+	/** @major_ver: major uc fw version */
+	__u32 major_ver;
+	/** @minor_ver: minor uc fw version */
+	__u32 minor_ver;
+	/** @patch_ver: patch uc fw version */
+	__u32 patch_ver;
+
+	/** @pad2: MBZ */
+	__u32 pad2;
+
+	/** @reserved: Reserved */
+	__u64 reserved;
+};
+
 /**
  * struct drm_xe_device_query - Input of &DRM_IOCTL_XE_DEVICE_QUERY - main
  * structure to query device information
@@ -643,6 +673,7 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
 #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
 #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
+#define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
 	/** @query: The type of data to query */
 	__u32 query;
 
@@ -831,6 +862,10 @@ struct drm_xe_vm_destroy {
  *  - %DRM_XE_VM_BIND_OP_PREFETCH
  *
  * and the @flags can be:
+ *  - %DRM_XE_VM_BIND_FLAG_READONLY
+ *  - %DRM_XE_VM_BIND_FLAG_IMMEDIATE - Valid on a faulting VM only, do the
+ *    MAP operation immediately rather than deferring the MAP to the page
+ *    fault handler.
  *  - %DRM_XE_VM_BIND_FLAG_NULL - When the NULL flag is set, the page
  *    tables are setup with a special bit which indicates writes are
  *    dropped and all reads return zero. In the future, the NULL flags
@@ -923,7 +958,10 @@ struct drm_xe_vm_bind_op {
 	/** @op: Bind operation to perform */
 	__u32 op;
 
+#define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
+#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
 #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
+#define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
 	/** @flags: Bind flags */
 	__u32 flags;
 
@@ -1038,6 +1076,19 @@ struct drm_xe_exec_queue_create {
 #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY	7
+/* Monitor 128KB contiguous region with 4K sub-granularity */
+#define     DRM_XE_ACC_GRANULARITY_128K				0
+/* Monitor 2MB contiguous region with 64KB sub-granularity */
+#define     DRM_XE_ACC_GRANULARITY_2M				1
+/* Monitor 16MB contiguous region with 512KB sub-granularity */
+#define     DRM_XE_ACC_GRANULARITY_16M				2
+/* Monitor 64MB contiguous region with 2M sub-granularity */
+#define     DRM_XE_ACC_GRANULARITY_64M				3
 
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
-- 
2.41.0

