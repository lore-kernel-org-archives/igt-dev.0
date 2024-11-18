Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88A3D591B7
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 20:58:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B3710E293;
	Mon, 18 Nov 2024 20:58:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EHoWpzHg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF6010E293
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 20:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731963522; x=1763499522;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=uxwSF8Mc8JD6VQromLzInqAFBBLHD4XzjvrpeUclH30=;
 b=EHoWpzHgZ1g4u1n19e08g2AXV5m4f8rJK8e3d89aOpWVIjz+2F3c9fvt
 6DM5WmhiP4XGjGIGAiYWlEQ0od/aCXyuf+3+mRieL4aawUSv3uv4lapyH
 oM85245hvJQOItfTNvqpKoBhNzTnz109cmAK+AzcD1exaQvWPJ003Y0tY
 n1zeT03W5XwNz0jKbyUQQlK4M1fY3F4MxU/llghz/FLm4MbiuvpahNdd3
 ePYla7hCnm+zJuASAzICsHEj8gNhcQ/n+HWUxJ0GZHcNAjERaMUkFN4Xd
 ylukismYMi5H7efDWMpmZDMAnDUfVsE1DJ+CrGcgwMG7iOUR9D60SdXF2 Q==;
X-CSE-ConnectionGUID: +9bJQ0JwRA2BvHqDa8OVNw==
X-CSE-MsgGUID: Suc3tyiSSpeguCvxvK3QXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31877927"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="31877927"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 12:58:41 -0800
X-CSE-ConnectionGUID: Yx7kMLcUR8W0wSkVT6QVgQ==
X-CSE-MsgGUID: KVT93Co9TV6WCXOmhMWQ5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="94277881"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 12:58:41 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 1/2] drm-uapi/xe: Update uAPI for UMD direct submission
Date: Mon, 18 Nov 2024 12:59:13 -0800
Message-Id: <20241118205914.2339782-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118205914.2339782-1-matthew.brost@intel.com>
References: <20241118205914.2339782-1-matthew.brost@intel.com>
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

Experimental uAPI being sent to list for public checkout. Do not review.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/drm-uapi/xe_drm.h | 153 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 149 insertions(+), 4 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 56163eb913..0c88ad760e 100644
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
 
@@ -102,6 +102,7 @@ extern "C" {
 #define DRM_XE_EXEC			0x09
 #define DRM_XE_WAIT_USER_FENCE		0x0a
 #define DRM_XE_OBSERVATION		0x0b
+#define DRM_XE_VM_CONVERT_FENCE		0x0c
 
 /* Must be kept compact -- no holes */
 
@@ -117,6 +118,7 @@ extern "C" {
 #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
+#define DRM_IOCTL_XE_VM_CONVERT_FENCE		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_CONVERT_FENCE, struct drm_xe_vm_convert_fence)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -811,6 +813,32 @@ struct drm_xe_gem_create {
 
 /**
  * struct drm_xe_gem_mmap_offset - Input of &DRM_IOCTL_XE_GEM_MMAP_OFFSET
+ *
+ * The @flags can be:
+ *  - %DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER - For user to query special offset
+ *  for use in mmap ioctl. Writing to the returned mmap address will generate a
+ *  PCI memory barrier with low overhead (avoiding IOCTL call as well as writing
+ *  to VRAM which would also add overhead), acting like an MI_MEM_FENCE
+ *  instruction.
+ *
+ *  Note: The mmap size can be at most 4K, due to HW limitations. As a result
+ *  this interface is only supported on CPU architectures that support 4K page
+ *  size. The mmap_offset ioctl will detect this and gracefully return an
+ *  error, where userspace is expected to have a different fallback method for
+ *  triggering a barrier.
+ *
+ *  Roughly the usage would be as follows:
+ *
+ *  .. code-block:: C
+ *
+ *  struct drm_xe_gem_mmap_offset mmo = {
+ *	.handle = 0, // must be set to 0
+ *	.flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
+ *  };
+ *
+ *  err = ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
+ *  map = mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo.offset);
+ *  map[i] = 0xdeadbeaf; // issue barrier
  */
 struct drm_xe_gem_mmap_offset {
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -819,7 +847,8 @@ struct drm_xe_gem_mmap_offset {
 	/** @handle: Handle for the object being mapped. */
 	__u32 handle;
 
-	/** @flags: Must be zero */
+#define DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER     (1 << 0)
+	/** @flags: Flags */
 	__u32 flags;
 
 	/** @offset: The fake offset to use for subsequent mmap call */
@@ -1084,6 +1113,61 @@ struct drm_xe_vm_bind {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_exec_queue_ext_usermap
+ */
+struct drm_xe_exec_queue_ext_usermap {
+	/** @base: base user extension */
+	struct drm_xe_user_extension base;
+
+	/** @flags: MBZ */
+	__u32 flags;
+
+	/** @version: Version of usermap */
+#define DRM_XE_EXEC_QUEUE_USERMAP_VERSION_XE2_REV0	0
+	__u32 version;
+
+	/**
+	 * @ring_size: The ring size. 16k-128k valid, must be power of 2. User
+	 * space has pad allocation / mapping to avoid prefetch faults. Prefetch
+	 * size is platform dependent.
+	 */
+	__u32 ring_size;
+
+	/** @pad: MBZ */
+	__u32 pad;
+
+	/**
+	 * @ring_addr: Ring address mapped within the VM, should be mapped as
+	 * UC.
+	 */
+	__u64 ring_addr;
+
+	/**
+	 * @indirect_ring_state_offset: The fake indirect ring state offset to
+	 * use for subsequent mmap call. Always 4k in size.
+	 */
+	__u64 indirect_ring_state_offset;
+
+	/**
+	 * @doorbell_offset: The fake doorbell offset to use for subsequent mmap
+	 * call. Always 4k in size.
+	 */
+	__u64 doorbell_offset;
+
+	/** @doorbell_page_offset: The doorbell offset within the mmapped page */
+	__u32 doorbell_page_offset;
+
+	/**
+	  * @indirect_ring_state_handle: Indirect ring state buffer object
+	  * handle. Allocated by KMD and must be closed by user.
+	 */
+	__u32 indirect_ring_state_handle;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
 /**
  * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
  *
@@ -1111,6 +1195,7 @@ struct drm_xe_exec_queue_create {
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
 
+#define DRM_XE_EXEC_QUEUE_EXTENSION_USERMAP			1
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
@@ -1713,8 +1798,68 @@ struct drm_xe_oa_stream_info {
 	__u64 reserved[3];
 };
 
+/**
+ * struct drm_xe_semaphore - Semaphore
+ */
+struct drm_xe_semaphore {
+	/**
+	 * @handle: Handle for the semaphore. Must be bound to the VM when
+	 * passed into drm_xe_vm_convert_fence.
+	 */
+	__u32 handle;
+
+	/** @offset: Offset in BO for semaphore, must QW aligned */
+	__u32 offset;
+
+	/** @seqno: Sequence number of semaphore */
+	__u64 seqno;
+
+	/** @token: Semaphore token - MBZ as not supported yet */
+	__u64 token;
+
+	/** @reserved: reserved for future use */
+	__u64 reserved[2];
+};
+
+/**
+ * struct drm_xe_vm_convert_fence - Convert semaphore to / from syncobj
+ *
+ * DRM_XE_SYNC_FLAG_SIGNAL set indicates semaphore -> syncobj
+ * DRM_XE_SYNC_FLAG_SIGNAL clear indicates syncobj -> semaphore
+ */
+struct drm_xe_vm_convert_fence {
+	/**
+	 * @extensions: Pointer to the first extension struct, if any
+	 */
+	__u64 extensions;
+
+	/** @vm_id: VM ID */
+	__u32 vm_id;
+
+	/** @flags: Flags - MBZ */
+	__u32 flags;
+
+	/** @pad: MBZ */
+	__u32 pad;
+
+	/**
+	 * @num_syncs: Number of struct drm_xe_sync and struct drm_xe_semaphore
+	 * in arrays.
+	 */
+	__u32 num_syncs;
+
+	/** @syncs: Pointer to struct drm_xe_sync array. */
+	__u64 syncs;
+
+	/** @semaphores: Pointer to struct drm_xe_semaphore array. */
+	__u64 semaphores;
+
+	/** @reserved: reserved for future use */
+	__u64 reserved[2];
+};
+
 #if defined(__cplusplus)
 }
 #endif
 
-#endif /* _XE_DRM_H_ */
+#endif /* _UAPI_XE_DRM_H_ */
-- 
2.34.1

