Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8393C021AD
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 23:42:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A802A10E157;
	Tue, 18 Feb 2025 23:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c86f//UP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E6B10E782
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 23:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739922130; x=1771458130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MAonb97OybbBNnOaXL4mDh4Viibu6b5B13eepBwX10o=;
 b=c86f//UPUnRmiU8NisKicX98CrauHJIuUGvxWKGL6lzTMDW0mt6mHKug
 clYJwMLUr6WmuSnvpjon6IcXRcMJW1mHXX9raPxh8FKbt022AD8o/zTwU
 r9RIJE0T5piYsiVV/k3b61KNHFm3hW0RimgsME2QysjQdV+oy3Ru/E4Ya
 ULOQdkf78RExi6UM69oTj3cXs7tTfMgI0Jz/U3KmwBDDvx/VykxJuGgg9
 jP9U5ERc5CVvII7me5peh121bYVwlBP4oAxm00JqxZy5M+whNJ3+UDBDe
 bmjCO+8xP8ioCS5JhF6XSX4YAV0SbiQmabkIXLCwUiWAcs0LMtPH+gcMb w==;
X-CSE-ConnectionGUID: Z/BTClRZQn2z0508QmZwxQ==
X-CSE-MsgGUID: a4fU0+bAT/q5CzKnlPUPFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="52048313"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="52048313"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 15:42:10 -0800
X-CSE-ConnectionGUID: s3OJIhQGS92c2l+qS5Yjgg==
X-CSE-MsgGUID: b8yKNdtURdSdQlA0l5Qi5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="114724049"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 15:42:09 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com, matthew.brost@intel.com,
 kamil.konieczny@intel.com, zbigniew.kempczynski@intel.com,
 ashutosh.dixit@intel.com, juha-pekka.heikkila@intel.com,
 rodrigo.vivi@intel.com
Subject: [i-g-t v3 2/4] lib/xe/xe_util: Introduce helper functions
Date: Tue, 18 Feb 2025 18:57:53 -0500
Message-Id: <20250218235755.360264-3-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20250218235755.360264-1-oak.zeng@intel.com>
References: <20250218235755.360264-1-oak.zeng@intel.com>
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

From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>

Introduce helper functions for buffer creation, binding,
destruction and command submission etc. With those helpers,
writing a xe igt test will be much easier, which will be
showed in a coming example.

v2: use to_user_pointer to cast a pointer (Kamil)
    s/insert_store/xe_insert_store (Kamil)
    s/cmdbuf_fill_func_t/xe_cmdbuf_fill_func_t (Kamil)
v3: refactor command buffer fill interface (Zbigniew)

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 lib/xe/xe_util.c | 239 +++++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_util.h |  47 ++++++++++
 2 files changed, 286 insertions(+)

diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
index 06b378ce0..891316ecd 100644
--- a/lib/xe/xe_util.c
+++ b/lib/xe/xe_util.c
@@ -13,6 +13,245 @@
 #include "xe/xe_query.h"
 #include "xe/xe_util.h"
 
+/**
+ * xe_cmdbuf_exec_ufence_gpuva:
+ * @cmdbuf Pointer to the xe_cmdbuf structure representing the command buffer.
+ *
+ * Returns the GPU virtual address of the execution user fence located at the
+ * end of the command buffer.
+ */
+static uint64_t xe_cmdbuf_exec_ufence_gpuva(struct xe_cmdbuf *cmdbuf)
+{
+	/* the last 8 bytes of the cmd buffer is used as ufence */
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
+	/* the last 8 bytes of the cmd buffer is used as ufence */
+	return (char *)cmdbuf->buf.cpu_addr + cmdbuf->buf.size - UFENCE_LENGTH;
+}
+
+
+/**
+ * __xe_submit_cmd:
+ * @cmdbuf Pointer to the command buffer structure
+ *
+ * Submits a command buffer to the GPU, waits for its completion, and verifies
+ * the user fence value
+ *
+ * Return: The result of waiting for the user fence value
+ */
+int64_t __xe_submit_cmd(struct xe_cmdbuf *cmdbuf)
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
+	xe_exec(cmdbuf->buf.fd, &exec);
+	ret = __xe_wait_ufence(cmdbuf->buf.fd,
+			       (uint64_t *)xe_cmdbuf_exec_ufence_cpuva(cmdbuf),
+			       USER_FENCE_VALUE, cmdbuf->exec_queue, &timeout);
+	/* Reset the fence so the exec ufence can be reused */
+	memset((char *)xe_cmdbuf_exec_ufence_cpuva(cmdbuf), 0, UFENCE_LENGTH);
+	return ret;
+}
+
+/**
+ * xe_submit_cmd:
+ * @cmdbuf Pointer to the command buffer structure
+ *
+ * Wrapper function to submit a command buffer and assert its successful
+ * execution.
+ */
+void xe_submit_cmd(struct xe_cmdbuf *cmdbuf)
+{
+	int64_t ret;
+
+	ret = __xe_submit_cmd(cmdbuf);
+	igt_assert_eq(ret, 0);
+}
+
+/**
+ *xe_create_buffer:
+ * @buffer Pointer to the xe_buf structure containing buffer details.
+ *
+ * Creates a buffer, maps it to both CPU and GPU address spaces, and binds it
+ * to a virtual memory (VM) space.
+ */
+void xe_create_buffer(struct xe_buf *buffer)
+{
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		  .timeline_value = USER_FENCE_VALUE },
+	};
+
+	buffer->bind_queue = xe_bind_exec_queue_create(buffer->fd,
+						       buffer->vm, 0);
+	buffer->bind_ufence = aligned_alloc(xe_get_default_alignment(buffer->fd),
+					    PAGE_ALIGN_UFENCE);
+	sync->addr = to_user_pointer(buffer->bind_ufence);
+
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
+}
+
+/**
+ * xe_destroy_buffer:
+ * @buffer Pointer to the xe_buf structure containing buffer details
+ *
+ * Destroys a buffer created by xe_create_buffer and releases associated
+ * resources.
+ */
+void xe_destroy_buffer(struct xe_buf *buffer)
+{
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		  .timeline_value = USER_FENCE_VALUE },
+	};
+	sync->addr = to_user_pointer(buffer->bind_ufence);
+
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
+	igt_assert(!cmdbuf->closed);
+
+	batch[cmdbuf->write_index++] = MI_STORE_DWORD_IMM_GEN4;
+	batch[cmdbuf->write_index++] = dst_va;
+	batch[cmdbuf->write_index++] = dst_va >> 32;
+	batch[cmdbuf->write_index++] = val;
+
+	/* Leaves at least one dword for MI_BATCH_BUFFER_END */
+	igt_assert(cmdbuf->write_index <= cmdbuf->cmd_size/sizeof(uint32_t) - 2);
+}
+
+/**
+ * xe_create_cmdbuf:
+ * @cmdbuf Pointer to the xe_cmdbuf structure representing the command buffer.
+ * @eci Pointer to the engine class instance for execution.
+ *
+ * Creates a command buffer, fills it with commands using the provided fill
+ * function, and sets up the execution queue for submission.
+ */
+void xe_create_cmdbuf(struct xe_cmdbuf *cmdbuf,
+		       struct drm_xe_engine_class_instance *eci)
+{
+	struct xe_buf *buf = &cmdbuf->buf;
+	/*
+	 * make some room for a exec_ufence, which will be used to sync the
+	 * submission of this command....
+	 */
+	buf->size = xe_bb_size(buf->fd,
+			       cmdbuf->cmd_size + PAGE_ALIGN_UFENCE);
+	xe_create_buffer(buf);
+	cmdbuf->exec_queue = xe_exec_queue_create(buf->fd, buf->vm, eci, 0);
+	cmdbuf->write_index = 0;
+	cmdbuf->closed = false;
+}
+
+/**
+ * xe_fill_cmdbuf:
+ * @cmdbuf Pointer to the xe_cmdbuf structure representing the command buffer.
+ * @fill_func Pointer to the function that fills the command buffer.
+ * @dst_gpu_va Destination GPU virtual address to store the value.
+ * @val Value to be stored.
+ *
+ * Fills the command buffer with commands using the provided fill function.
+ */
+void xe_fill_cmdbuf(struct xe_cmdbuf *cmdbuf,
+			xe_cmdbuf_fill_func_t fill_func,
+			uint64_t dst_gpu_va, uint32_t val)
+{
+	igt_assert(!cmdbuf->closed);
+	fill_func(cmdbuf, dst_gpu_va, val);
+}
+
+/**
+ * xe_close_cmdbuf:
+ * @cmdbuf command buffer to be closed.
+ *
+ * After this function is called, no more commands can be added to the
+ * command buffer.
+ */
+void xe_close_cmdbuf(struct xe_cmdbuf *cmdbuf)
+{
+	uint32_t *batch = cmdbuf->buf.cpu_addr;
+
+	igt_assert(!cmdbuf->closed);
+	batch[cmdbuf->write_index++] = MI_BATCH_BUFFER_END;
+	cmdbuf->closed = true;
+	igt_assert(cmdbuf->write_index <= cmdbuf->cmd_size/sizeof(uint32_t) - 1);
+}
+
+/**
+ * xe_destroy_cmdbuf:
+ * @cmdbuf Pointer to the xe_buf structure representing the command buffer.
+ *
+ * Destroys a command buffer created by xe_create_cmdbuf and releases
+ * associated resources.
+ */
+void xe_destroy_cmdbuf(struct xe_cmdbuf *cmdbuf)
+{
+	xe_exec_queue_destroy(cmdbuf->buf.fd, cmdbuf->exec_queue);
+	xe_destroy_buffer(&cmdbuf->buf);
+}
+
 static bool __region_belongs_to_regions_type(struct drm_xe_mem_region *region,
 					     uint32_t *mem_regions_type,
 					     int num_regions)
diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
index 06ebd3c2a..26321f957 100644
--- a/lib/xe/xe_util.h
+++ b/lib/xe/xe_util.h
@@ -14,6 +14,53 @@
 
 #include "xe_query.h"
 
+#define USER_FENCE_VALUE        0xdeadbeefdeadbeefull
+#define PAGE_ALIGN_UFENCE	4096
+#define UFENCE_LENGTH		8
+
+struct xe_buf {
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
+	struct xe_buf buf;
+	/* command size in bytes, not including exec_ufence */
+	uint64_t cmd_size;
+	uint32_t exec_queue;
+	/* Dword index to writ to command buffer */
+	uint32_t write_index;
+	bool closed;
+};
+
+typedef void (*xe_cmdbuf_fill_func_t) (struct xe_cmdbuf *cmdbuf,
+				       uint64_t dst_gpu_va, uint32_t val);
+
+void xe_create_buffer(struct xe_buf *buffer);
+void xe_destroy_buffer(struct xe_buf *buffer);
+
+void xe_create_cmdbuf(struct xe_cmdbuf *cmdbuf,
+		      struct drm_xe_engine_class_instance *eci);
+void xe_fill_cmdbuf(struct xe_cmdbuf *cmdbuf,
+			xe_cmdbuf_fill_func_t fill_func,
+			uint64_t dst_gpu_va, uint32_t val);
+void xe_close_cmdbuf(struct xe_cmdbuf *cmdbuf);
+void xe_cmdbuf_insert_store(struct xe_cmdbuf *cmdbuf, uint64_t dst_va,
+			    uint32_t val);
+void xe_submit_cmd(struct xe_cmdbuf *cmdbuf);
+int64_t __xe_submit_cmd(struct xe_cmdbuf *cmdbuf);
+void xe_destroy_cmdbuf(struct xe_cmdbuf *cmdbuf);
+
 #define XE_IS_SYSMEM_MEMORY_REGION(fd, region) \
 	(xe_region_class(fd, region) == DRM_XE_MEM_REGION_CLASS_SYSMEM)
 #define XE_IS_VRAM_MEMORY_REGION(fd, region) \
-- 
2.26.3

