Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32675D116F3
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 18:21:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D737810E453;
	Mon,  1 Dec 2025 18:21:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NBGvnaFF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D73E610E454
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 18:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764613279; x=1796149279;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g6cTt7oUXn/GXGC5Nbob0tQ8fuYmAbOK/LNVJJXAQ3M=;
 b=NBGvnaFFq4Js3uPQ95p1pPZtZnJA26SmSHK2A+mrXXLIoCA/Fj19ovmY
 WftmItmlcaDr9d0eUue+IaKBCAV5lpjaaQTpN564CeuAkuf5JY8dZwTId
 aMmpFMJxR2GkC4t5wgL3vzoO6uYubktyywoJbYqcca0IzfVAFH9iF9/G8
 OtVbOez/4XaoBMyfxOpmMfIlWDCSiJF6usVdfGitH/s95PLthmm6kjjpU
 LsULBjpIpmI9AgoPX6Sij89Livz6aJeiLvNNveGOE5X4qog8CkR4IhqAY
 FgAnHVbpjcHCYEaE8kucj1rVD24H1HRFwYJ6DVtx2btMX9zGCiE5pb1UB A==;
X-CSE-ConnectionGUID: GjA6X4DNQVa9HSTwmSfpKA==
X-CSE-MsgGUID: pKaeJLSmSRmjpGuoefnlPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="89210573"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="89210573"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 10:21:19 -0800
X-CSE-ConnectionGUID: 3kZYaQihQzWFMn9uk9vwRw==
X-CSE-MsgGUID: bmPjJ8+4Q/yKPex2yJUiBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="193968529"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 10:21:18 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 1/2] drm-uapi/xe: Sync with exec queue replay interface
Date: Mon,  1 Dec 2025 10:21:13 -0800
Message-Id: <20251201182114.851967-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Align with kernel commit  b80961a86b40 ("drm/xe/uapi: Add
DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE"). This is to bring in exec
queue replay interface changes from KMD.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/drm-uapi/xe_drm.h | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 89ab549354..e56b77542e 100644
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
@@ -771,7 +775,11 @@ struct drm_xe_device_query {
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
@@ -1013,6 +1021,20 @@ struct drm_xe_vm_destroy {
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
@@ -1119,6 +1141,7 @@ struct drm_xe_vm_bind_op {
 #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
 #define DRM_XE_VM_BIND_FLAG_CHECK_PXP	(1 << 4)
 #define DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR	(1 << 5)
+#define DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET	(1 << 6)
 	/** @flags: Bind flags */
 	__u32 flags;
 
@@ -1273,6 +1296,7 @@ struct drm_xe_exec_queue_create {
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
+#define   DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE		3
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-- 
2.34.1

