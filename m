Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B16ED60D06
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 23:36:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B7D10E57D;
	Mon, 18 Nov 2024 23:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aTcw74p4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C0B10E574
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 23:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731972959; x=1763508959;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=CB/UAMQz/584WOERxoPhXPZsBITEWPivbuUiVFlOkiU=;
 b=aTcw74p4kl9MfALYhz8zkcB8GKlsDm8Az5cqrjtS98mjjKOQugj+blKN
 wOaUvBkyR70nmdNAvMgMGJxzr338c3X/WCvHxOh7S15qymRcQvdNuucdr
 3HGwo4CFuH/VvdfrZIbF/xy0nPlJYB5t4A9ymfWWQgOHWmZKnvGZuQh7C
 u1hUcpKcdeebaPhTqxG7xUT7Y4LuhdzXNxXPebmH2mX8O3aKgt2srcIDb
 yZzRTDs6lcJb9mbQ+6L8dG1oKhaxvff+mpDoD+0ZDOux7JdZ1PuNLr8Ut
 47OYmXi3Xrb6rgQMq0NpsOMry7asjJixWlsfkiHA1gT+vB5aqRfOtvQfn Q==;
X-CSE-ConnectionGUID: T4P7zV46SXCvSk/RMhrYeQ==
X-CSE-MsgGUID: ipEzNOtiQ7qpLm/+TUQYkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="54451250"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="54451250"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:35:58 -0800
X-CSE-ConnectionGUID: buSdXO+aQC2isu37rdluLw==
X-CSE-MsgGUID: v2NLtd9wSkywYtn8JyMLmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="120245243"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:35:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [RFC PATCH 22/29] drm/xe/uapi: Add uAPI to convert user semaphore to
 / from drm syncobj
Date: Mon, 18 Nov 2024 15:36:13 -0800
Message-Id: <20241118233620.2373819-23-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118233620.2373819-1-matthew.brost@intel.com>
References: <20241118233620.2373819-1-matthew.brost@intel.com>
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

Simple interface to allow user space to share user syncs with kernel
syncs (dma-fences). The idea also is when user syncs are converted to
kernel syncs, preemption is guarded against until the kernel sync
signals. This is required to adhere to dma-fencing rules (no memory
allocates done in path of dma-fence, resume after preemption requires
memory allocations).

FIXME: uAPI likely to change, perhaps in drm generic way. Currently
enough for a PoC and enable initial Mesa development.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/uapi/drm/xe_drm.h | 62 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 9356a714a2e0..0cd473d2d91b 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
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
@@ -1796,6 +1798,66 @@ struct drm_xe_oa_stream_info {
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
-- 
2.34.1

