Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001A4C36001
	for <igt-dev@archiver.kernel.org>; Wed, 19 Mar 2025 22:26:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A297F10E266;
	Wed, 19 Mar 2025 22:26:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dXOusjiQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3BC710E25D
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Mar 2025 22:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742423159; x=1773959159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lsfID4ou3iOk2QTwFiqNftDRuBky7b/Wh0d4gHjSwZw=;
 b=dXOusjiQ2XA1zYWUJnVO52SUl7h2w5lRyMVW0EC3phrfvw4MakylBCO9
 KKfS40aR3wAcnIFTGApzRlVvmQJLYHUatPMRM4Z6mcJOaiuDV2q52txl5
 V3YhAUiolyo0AFELvK6pOXidQfw/suXw1IMODqFbQRPoeTNoo4lvQg6/U
 oePFRSxLuFljgbMnUTJJwhucpf86gxhp/wQGGUTzm3IzVbmFT/9zIe+WI
 GB1NoJ3XUGZ5h/L9ZLANVx4kzsof7vjLrasD5A05OfCTXZme0xcmkxT+8
 TA6X93lnmumfvVf9xMtjy/v+Loft6wECD3x9WoVTUbzhL4cAX4G4U4RTM A==;
X-CSE-ConnectionGUID: lyYFf6SGRLWKFBkPouJ/Nw==
X-CSE-MsgGUID: TKO2BNLkQs6DbyxbAdEfQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43510777"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="43510777"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 15:25:58 -0700
X-CSE-ConnectionGUID: RR2LGXGCQTGHncA/tWr4ow==
X-CSE-MsgGUID: O/n4bez/Tw60f1D3zrGUzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="122540400"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 15:25:58 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, matthew.brost@intel.com,
 zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com
Subject: [i-g-t v7 2/4] lib/xe/xe_util: Introduce helper functions
Date: Wed, 19 Mar 2025 18:42:29 -0400
Message-Id: <20250319224231.1909393-3-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20250319224231.1909393-1-oak.zeng@intel.com>
References: <20250319224231.1909393-1-oak.zeng@intel.com>
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

From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>

Introduce helper functions for buffer creation, binding,
destruction and command submission etc. With those helpers,
writing a xe igt test will be much easier, which will be
showed in a coming example.

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/xe/xe_util.c | 239 +++++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_util.h |  39 ++++++++
 2 files changed, 278 insertions(+)

diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
index 06b378ce0..3dda32ebb 100644
--- a/lib/xe/xe_util.c
+++ b/lib/xe/xe_util.c
@@ -13,6 +13,245 @@
 #include "xe/xe_query.h"
 #include "xe/xe_util.h"
 
+#define UFENCE_LENGTH		sizeof(((struct drm_xe_sync *)0)->timeline_value)
+
+/**
+ * xe_cmdbuf_exec_ufence_gpuva:
+ * @cmdbuf Pointer to the xe_cmdbuf structure representing the command buffer.
+ *
+ * Returns the GPU virtual address of the execution user fence located at the
+ * end of the command buffer.
+ */
+static uint64_t xe_cmdbuf_exec_ufence_gpuva(struct xe_cmdbuf *cmdbuf)
+{
+	igt_assert(cmdbuf);
+
+	return cmdbuf->buf.gpu_addr + cmdbuf->buf.size - UFENCE_LENGTH;
+}
+
+/**
+ * xe_cmdbuf_exec_ufence_cpuva:
+ * @cmdbuf Pointer to the xe_cmdbuf structure representing the command buffer.
+ *
+ * Returns the CPU virtual address of the execution user fence located at the
+ * end of the command buffer.
+ */
+static void *xe_cmdbuf_exec_ufence_cpuva(struct xe_cmdbuf *cmdbuf)
+{
+	igt_assert(cmdbuf);
+
+	return (char *)cmdbuf->buf.cpu_addr + cmdbuf->buf.size - UFENCE_LENGTH;
+}
+
+/**
+ *xe_buffer_create:
+ * @buffer Pointer to the xe_buffer structure containing buffer details.
+ *
+ * Creates a buffer, maps it to both CPU and GPU address spaces.
+ */
+int xe_buffer_create(struct xe_buffer *buffer)
+{
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		  .timeline_value = USER_FENCE_VALUE },
+	};
+
+	igt_assert(buffer);
+
+	if (buffer->fd < 0)
+		return -EINVAL;
+
+	if (buffer->size == 0)
+		return -EINVAL;
+
+	if (!(buffer->placement & all_memory_regions(buffer->fd)))
+		return -EINVAL;
+
+	buffer->bind_queue = xe_bind_exec_queue_create(buffer->fd,
+						       buffer->vm, 0);
+	buffer->bind_ufence = aligned_alloc(xe_get_default_alignment(buffer->fd),
+					    PAGE_ALIGN_UFENCE);
+	sync->addr = to_user_pointer(buffer->bind_ufence);
+
+	/* create and bind the buffer->bo */
+	buffer->bo = xe_bo_create(buffer->fd, 0, buffer->size,
+				  buffer->placement, buffer->flag);
+	buffer->cpu_addr = xe_bo_map(buffer->fd, buffer->bo, buffer->size);
+	xe_vm_bind_async(buffer->fd, buffer->vm, buffer->bind_queue,
+			 buffer->bo, 0, buffer->gpu_addr,
+			 buffer->size, sync, 1);
+
+	xe_wait_ufence(buffer->fd, buffer->bind_ufence,
+		       USER_FENCE_VALUE, buffer->bind_queue, NSEC_PER_SEC);
+	memset(buffer->bind_ufence, 0, PAGE_ALIGN_UFENCE);
+
+	return 0;
+}
+
+/**
+ * xe_buffer_destroy:
+ * @buffer Pointer to the xe_buffer structure containing buffer details
+ *
+ * Destroys a buffer created by xe_buffer_create and releases associated
+ * resources.
+ */
+void xe_buffer_destroy(struct xe_buffer *buffer)
+{
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		  .timeline_value = USER_FENCE_VALUE },
+	};
+
+	igt_assert(buffer);
+
+	sync->addr = to_user_pointer(buffer->bind_ufence);
+	xe_vm_unbind_async(buffer->fd, buffer->vm, buffer->bind_queue,
+			   0, buffer->gpu_addr, buffer->size, sync, 1);
+	xe_wait_ufence(buffer->fd, buffer->bind_ufence,
+		       USER_FENCE_VALUE, buffer->bind_queue, NSEC_PER_SEC);
+	memset(buffer->bind_ufence, 0, PAGE_ALIGN_UFENCE);
+
+	munmap(buffer->cpu_addr, buffer->size);
+	gem_close(buffer->fd, buffer->bo);
+
+	free(buffer->bind_ufence);
+	xe_exec_queue_destroy(buffer->fd, buffer->bind_queue);
+}
+
+/**
+ * __xe_cmdbuf_submit:
+ * @cmdbuf Pointer to the command buffer structure
+ *
+ * Submits a command buffer to the GPU, waits for its completion, and verifies
+ * the user fence value
+ *
+ * Return: The result of waiting for the user fence value
+ */
+int64_t __xe_cmdbuf_submit(struct xe_cmdbuf *cmdbuf)
+{
+	int64_t timeout = NSEC_PER_SEC;
+	int ret;
+
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
+			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+			.timeline_value = USER_FENCE_VALUE,
+			.addr = xe_cmdbuf_exec_ufence_gpuva(cmdbuf),},
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(sync),
+		.exec_queue_id = cmdbuf->exec_queue,
+		.address = cmdbuf->buf.gpu_addr,
+	};
+
+	igt_assert(cmdbuf);
+
+	ret = __xe_exec(cmdbuf->buf.fd, &exec);
+	if (ret)
+		return ret;
+
+	ret = __xe_wait_ufence(cmdbuf->buf.fd,
+			       (uint64_t *)xe_cmdbuf_exec_ufence_cpuva(cmdbuf),
+			       USER_FENCE_VALUE, cmdbuf->exec_queue, &timeout);
+	/* Reset the fence so the exec ufence can be reused */
+	memset((char *)xe_cmdbuf_exec_ufence_cpuva(cmdbuf), 0, UFENCE_LENGTH);
+
+	return ret;
+}
+
+/**
+ * xe_cmdbuf_submit:
+ * @cmdbuf Pointer to the command buffer structure
+ *
+ * Wrapper function to submit a command buffer and assert its successful
+ * execution.
+ */
+void xe_cmdbuf_submit(struct xe_cmdbuf *cmdbuf)
+{
+	igt_assert(cmdbuf);
+	igt_assert_eq(__xe_cmdbuf_submit(cmdbuf), 0);
+}
+
+/**
+ * xe_cmdbuf_insert_store:
+ * @cmdbuf: command buffer where commands will be inserted.
+ * @dst_va Destination virtual address to store the value.
+ * @val Value to be stored.
+ *
+ * Inserts a MI_STORE_DWORD_IMM_GEN4 command into a command  buffer, which stores
+ * an immediate value to a given destination virtual address.
+ */
+void xe_cmdbuf_insert_store(struct xe_cmdbuf *cmdbuf,
+			    uint64_t dst_va, uint32_t val)
+{
+	uint32_t *batch = cmdbuf->buf.cpu_addr;
+
+	igt_assert(cmdbuf);
+	/* Leaves at least one dword for MI_BATCH_BUFFER_END */
+	igt_assert(cmdbuf->write_index + 4 <=
+		   cmdbuf->cmd_size/sizeof(uint32_t) - 1);
+
+	batch[cmdbuf->write_index++] = MI_STORE_DWORD_IMM_GEN4;
+	batch[cmdbuf->write_index++] = dst_va;
+	batch[cmdbuf->write_index++] = dst_va >> 32;
+	batch[cmdbuf->write_index++] = val;
+}
+
+void xe_cmdbuf_insert_bbe(struct xe_cmdbuf *cmdbuf)
+{
+	uint32_t *batch = cmdbuf->buf.cpu_addr;
+
+	igt_assert(cmdbuf);
+	igt_assert(cmdbuf->write_index <= cmdbuf->cmd_size/sizeof(uint32_t) - 1);
+
+	batch[cmdbuf->write_index++] = MI_BATCH_BUFFER_END;
+}
+
+/**
+ * xe_cmdbuf_create:
+ * @cmdbuf Pointer to the xe_cmdbuf structure representing the command buffer.
+ * @eci Pointer to the engine class instance for execution.
+ *
+ * Creates a command buffer, fills it with commands using the provided fill
+ * function, and sets up the execution queue for submission.
+ */
+void xe_cmdbuf_create(struct xe_cmdbuf *cmdbuf,
+		       struct drm_xe_engine_class_instance *eci)
+{
+	struct xe_buffer *buf = &cmdbuf->buf;
+
+	igt_assert(cmdbuf);
+
+	/*
+	 * make some room for a exec_ufence, which will be used to sync the
+	 * submission of this command....
+	 */
+	buf->size = xe_bb_size(buf->fd,
+			       cmdbuf->cmd_size + PAGE_ALIGN_UFENCE);
+	xe_buffer_create(buf);
+	cmdbuf->exec_queue = xe_exec_queue_create(buf->fd, buf->vm, eci, 0);
+	cmdbuf->write_index = 0;
+}
+
+/**
+ * xe_cmdbuf_destroy:
+ * @cmdbuf Pointer to the xe_buffer structure representing the command buffer.
+ *
+ * Destroys a command buffer created by xe_cmdbuf_create and releases
+ * associated resources.
+ */
+void xe_cmdbuf_destroy(struct xe_cmdbuf *cmdbuf)
+{
+	igt_assert(cmdbuf);
+
+	xe_exec_queue_destroy(cmdbuf->buf.fd, cmdbuf->exec_queue);
+	xe_buffer_destroy(&cmdbuf->buf);
+}
+
 static bool __region_belongs_to_regions_type(struct drm_xe_mem_region *region,
 					     uint32_t *mem_regions_type,
 					     int num_regions)
diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
index 06ebd3c2a..a81bd11f7 100644
--- a/lib/xe/xe_util.h
+++ b/lib/xe/xe_util.h
@@ -14,6 +14,45 @@
 
 #include "xe_query.h"
 
+#define USER_FENCE_VALUE        0xdeadbeefdeadbeefull
+#define PAGE_ALIGN_UFENCE	SZ_4K
+
+struct xe_buffer {
+	void *cpu_addr;
+	uint64_t gpu_addr;
+	/*the user fence used to vm bind this buffer*/
+	uint64_t *bind_ufence;
+	uint64_t size;
+	uint32_t flag;
+	uint32_t vm;
+	uint32_t bo;
+	uint32_t placement;
+	uint32_t bind_queue;
+	int fd;
+	bool is_userptr;
+};
+
+struct xe_cmdbuf {
+	struct xe_buffer buf;
+	/* command size in bytes, not including exec_ufence */
+	uint64_t cmd_size;
+	uint32_t exec_queue;
+	/* Dword index to writ to command buffer */
+	uint32_t write_index;
+};
+
+int xe_buffer_create(struct xe_buffer *buffer);
+void xe_buffer_destroy(struct xe_buffer *buffer);
+
+void xe_cmdbuf_create(struct xe_cmdbuf *cmdbuf,
+		      struct drm_xe_engine_class_instance *eci);
+void xe_cmdbuf_insert_store(struct xe_cmdbuf *cmdbuf, uint64_t dst_va,
+			    uint32_t val);
+void xe_cmdbuf_insert_bbe(struct xe_cmdbuf *cmdbuf);
+void xe_cmdbuf_submit(struct xe_cmdbuf *cmdbuf);
+int64_t __xe_cmdbuf_submit(struct xe_cmdbuf *cmdbuf);
+void xe_cmdbuf_destroy(struct xe_cmdbuf *cmdbuf);
+
 #define XE_IS_SYSMEM_MEMORY_REGION(fd, region) \
 	(xe_region_class(fd, region) == DRM_XE_MEM_REGION_CLASS_SYSMEM)
 #define XE_IS_VRAM_MEMORY_REGION(fd, region) \
-- 
2.26.3

