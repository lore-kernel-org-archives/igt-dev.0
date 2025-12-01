Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6D5D116F1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 22:31:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60EC510E4A8;
	Mon,  1 Dec 2025 22:31:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T+3m8o8x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D415210E4A8
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 22:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764628291; x=1796164291;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uSE/VsJvZmapP7bkcRQvX9LRjEikxvJNq2bW+OPvjIM=;
 b=T+3m8o8xyQJ4jxtKWP43RC223j8gBRhtfb5lAEmH7C0kZJj71x/HYcte
 ckYP+dGjDLcrbvG+eI12iwFdWAmvLtHtEInSvrtENfVb28W5S9s+XEYDi
 IZ1RoCnBoM/IAcqu8ADSdaG6vYR+2vKFqhffqW8v65JQqJTM2JviLRrsp
 p4dkFgsdOeoLgVTc2Vm8yiynJeg1Yu03NqL70kObvvVa9asoPWyVlVaA0
 3wMjBC/GLhp+6qF+IvwADWN9I1G0PqRHq0u834hyXWwi5CmOywuPas4ty
 AkPm2kzv5xiLYkCdkd3BOZ/iRuUZ2DbxBsLBh/ODFlsALV6bA2/ED4j4W A==;
X-CSE-ConnectionGUID: +WSSG97HQBetLkmHLtNcew==
X-CSE-MsgGUID: KCbZOGSAQkyeymy7+i6iQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66468968"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="66468968"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 14:31:30 -0800
X-CSE-ConnectionGUID: isKVn82rRAKqlwY3AzC+pg==
X-CSE-MsgGUID: U8v8B7C3TH+5oqdKvj5ByQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="199129340"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 14:31:30 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm-uapi/xe: Sync with exec queue replay interface
Date: Mon,  1 Dec 2025 14:31:25 -0800
Message-Id: <20251201223126.863042-1-matthew.brost@intel.com>
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
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
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

