Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A5BD3B7E2
	for <igt-dev@archiver.kernel.org>; Mon,  8 Dec 2025 18:57:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B38B10E49D;
	Mon,  8 Dec 2025 18:57:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hijy9TDs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2633B10E23A
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Dec 2025 18:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765220265; x=1796756265;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SBgQggByAoUs9+nbhmASZgE0Ws+wR4fKTeb60omsnCA=;
 b=Hijy9TDs3tWrVwcZYFDt8kEa5jGARCU+stmHBYo7FWzf4gPUSlMgH3eh
 cBglhkos62WaF3eExNrYk8U66hz8uVF/67eM7LhVhhM4T7Ti8IIBjH3Kc
 3FmhLL7cgVEhEtUS2ZMs//JHd/qOXRLkZ1rMnrY8ob0VcqrL63hgLGAFE
 Jl176J1owrnSpBAo0QIefJdorTMwmuYvbD9JWZDZbqIIL+yk0CvLmbSSD
 BhDOoG4nmpDTRYG4ZY1pY+VAYxNRWQoR5K8WujWesJxo29TT3wpxB3GfD
 ONLVAs409yQTtcsA33LZRmUomkhFs3nzlaXj9jVND5trjA8ZHzaTmdEZg Q==;
X-CSE-ConnectionGUID: +g271xRDTwuO0El8+Mz8pg==
X-CSE-MsgGUID: pcudb8LnRQmFDEcXnAqLjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67219734"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="67219734"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 10:57:45 -0800
X-CSE-ConnectionGUID: 5Gr7U7JtQO6BpEz4EeZDag==
X-CSE-MsgGUID: 2s4AO8qdSMKsMnYrW2x+QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="233384670"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 10:57:44 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 1/5] drm-uapi/xe: Sync with DRM_XE_OA_UNIT_TYPE_MERT
 definition
Date: Mon,  8 Dec 2025 10:57:33 -0800
Message-ID: <20251208185737.966218-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251208185737.966218-1-ashutosh.dixit@intel.com>
References: <20251208185737.966218-1-ashutosh.dixit@intel.com>
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

Sync with kernel commit 3c7a501744ba ("drm/xe/oa/uapi: Expose MERT OA
unit") to bring in all changes till DRM_XE_OA_UNIT_TYPE_MERT definition.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 include/drm-uapi/xe_drm.h | 58 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 54 insertions(+), 4 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 89ab549354..40cd463c9f 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -210,8 +210,12 @@ struct drm_xe_ext_set_property {
 	/** @pad: MBZ */
 	__u32 pad;
 
-	/** @value: property value */
-	__u64 value;
+	union {
+		/** @value: property value */
+		__u64 value;
+		/** @ptr: pointer to user value */
+		__u64 ptr;
+	};
 
 	/** @reserved: Reserved */
 	__u64 reserved[2];
@@ -403,6 +407,9 @@ struct drm_xe_query_mem_regions {
  *      has low latency hint support
  *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR - Flag is set if the
  *      device has CPU address mirroring support
+ *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT - Flag is set if the
+ *      device supports the userspace hint %DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION.
+ *      This is exposed only on Xe2+.
  *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
  *    required by this device, typically SZ_4K or SZ_64K
  *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
@@ -421,6 +428,7 @@ struct drm_xe_query_config {
 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 << 1)
 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR	(1 << 2)
+	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT (1 << 3)
 #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 #define DRM_XE_QUERY_CONFIG_VA_BITS			3
 #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
@@ -771,7 +779,11 @@ struct drm_xe_device_query {
  *    until the object is either bound to a virtual memory region via
  *    VM_BIND or accessed by the CPU. As a result, no backing memory is
  *    reserved at the time of GEM object creation.
- *  - %DRM_XE_GEM_CREATE_FLAG_SCANOUT
+ *  - %DRM_XE_GEM_CREATE_FLAG_SCANOUT - Indicates that the GEM object is
+ *    intended for scanout via the display engine. When set, kernel ensures
+ *    that the allocation is placed in a memory region compatible with the
+ *    display engine requirements. This may impose restrictions on tiling,
+ *    alignment, and memory placement to guarantee proper display functionality.
  *  - %DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM - When using VRAM as a
  *    possible placement, ensure that the corresponding VRAM allocation
  *    will always use the CPU accessible part of VRAM. This is important
@@ -787,6 +799,17 @@ struct drm_xe_device_query {
  *    need to use VRAM for display surfaces, therefore the kernel requires
  *    setting this flag for such objects, otherwise an error is thrown on
  *    small-bar systems.
+ *  - %DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION - Allows userspace to
+ *    hint that compression (CCS) should be disabled for the buffer being
+ *    created. This can avoid unnecessary memory operations and CCS state
+ *    management.
+ *    On pre-Xe2 platforms, this flag is currently rejected as compression
+ *    control is not supported via PAT index. On Xe2+ platforms, compression
+ *    is controlled via PAT entries. If this flag is set, the driver will reject
+ *    any VM bind that requests a PAT index enabling compression for this BO.
+ *    Note: On dGPU platforms, there is currently no change in behavior with
+ *    this flag, but future improvements may leverage it. The current benefit is
+ *    primarily applicable to iGPU platforms.
  *
  * @cpu_caching supports the following values:
  *  - %DRM_XE_GEM_CPU_CACHING_WB - Allocate the pages with write-back
@@ -833,6 +856,7 @@ struct drm_xe_gem_create {
 #define DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING		(1 << 0)
 #define DRM_XE_GEM_CREATE_FLAG_SCANOUT			(1 << 1)
 #define DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(1 << 2)
+#define DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION		(1 << 3)
 	/**
 	 * @flags: Flags, currently a mask of memory instances of where BO can
 	 * be placed
@@ -1013,6 +1037,20 @@ struct drm_xe_vm_destroy {
  *    valid on VMs with DRM_XE_VM_CREATE_FLAG_FAULT_MODE set. The CPU address
  *    mirror flag are only valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
  *    handle MBZ, and the BO offset MBZ.
+ *  - %DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET - Can be used in combination with
+ *    %DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR to reset madvises when the underlying
+ *    CPU address space range is unmapped (typically with munmap(2) or brk(2)).
+ *    The madvise values set with &DRM_IOCTL_XE_MADVISE are reset to the values
+ *    that were present immediately after the &DRM_IOCTL_XE_VM_BIND.
+ *    The reset GPU virtual address range is the intersection of the range bound
+ *    using &DRM_IOCTL_XE_VM_BIND and the virtual CPU address space range
+ *    unmapped.
+ *    This functionality is present to mimic the behaviour of CPU address space
+ *    madvises set using madvise(2), which are typically reset on unmap.
+ *    Note: free(3) may or may not call munmap(2) and/or brk(2), and may thus
+ *    not invoke autoreset. Neither will stack variables going out of scope.
+ *    Therefore it's recommended to always explicitly reset the madvises when
+ *    freeing the memory backing a region used in a &DRM_IOCTL_XE_MADVISE call.
  *
  * The @prefetch_mem_region_instance for %DRM_XE_VM_BIND_OP_PREFETCH can also be:
  *  - %DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC, which ensures prefetching occurs in
@@ -1119,6 +1157,7 @@ struct drm_xe_vm_bind_op {
 #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
 #define DRM_XE_VM_BIND_FLAG_CHECK_PXP	(1 << 4)
 #define DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR	(1 << 5)
+#define DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET	(1 << 6)
 	/** @flags: Bind flags */
 	__u32 flags;
 
@@ -1273,6 +1312,7 @@ struct drm_xe_exec_queue_create {
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
+#define   DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE		3
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
@@ -1635,6 +1675,9 @@ enum drm_xe_oa_unit_type {
 
 	/** @DRM_XE_OA_UNIT_TYPE_OAM_SAG: OAM_SAG OA unit */
 	DRM_XE_OA_UNIT_TYPE_OAM_SAG,
+
+	/** @DRM_XE_OA_UNIT_TYPE_MERT: MERT OA unit */
+	DRM_XE_OA_UNIT_TYPE_MERT,
 };
 
 /**
@@ -1657,12 +1700,19 @@ struct drm_xe_oa_unit {
 #define DRM_XE_OA_CAPS_OA_BUFFER_SIZE	(1 << 2)
 #define DRM_XE_OA_CAPS_WAIT_NUM_REPORTS	(1 << 3)
 #define DRM_XE_OA_CAPS_OAM		(1 << 4)
+#define DRM_XE_OA_CAPS_OA_UNIT_GT_ID	(1 << 5)
 
 	/** @oa_timestamp_freq: OA timestamp freq */
 	__u64 oa_timestamp_freq;
 
+	/** @gt_id: gt id for this OA unit */
+	__u16 gt_id;
+
+	/** @reserved1: MBZ */
+	__u16 reserved1[3];
+
 	/** @reserved: MBZ */
-	__u64 reserved[4];
+	__u64 reserved[3];
 
 	/** @num_engines: number of engines in @eci array */
 	__u64 num_engines;
-- 
2.48.1

