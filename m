Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B09C021A4
	for <igt-dev@archiver.kernel.org>; Thu, 13 Feb 2025 22:11:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3138D10E151;
	Thu, 13 Feb 2025 22:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lfN59nKU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B8810E14B
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2025 22:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739484691; x=1771020691;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fDXIr2ABTK8tnnyU939UD3CnHW4iog+fpV+j9BS9kg4=;
 b=lfN59nKUG6gnvY4mGacK3RvshmbZ/VATN6zkIJJWtlAm/2EkfnJLnl4J
 BFCIzPsGIV97ZbWgaXgPOBwqwX0Nz+VANmB2Ii0cB78GdWku+HF0QMlgm
 kg2j2nljNAJlsUCMcEv2yOjFnk5X7EV/TxoCwMhqxMTbDqqMDLdx5XxVb
 Lm3woKxQGgICuIv5RE4N3Hlj85pviIiqsNHydhmZnC82GTFHiBB/gGpKB
 Cepatr2dDuZQMb5fJyjhv6rLonDYvVu/SR5yBEMPrYjIBA/zQjKKXCa5i
 r03kaIFIDsAkf+OrbX+DZnBhPfTwvVefFLk+fMnPHXYtZQMM0P0uimlQu A==;
X-CSE-ConnectionGUID: HeK8UUDrTUC68JAoOPgMNw==
X-CSE-MsgGUID: iO/FlZXyShKJDWBoEbwhMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="39920734"
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; d="scan'208";a="39920734"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 14:11:30 -0800
X-CSE-ConnectionGUID: trDiDsThQIWzJvOrWhk2eg==
X-CSE-MsgGUID: mapJI1N+Rwi0gF2XsaH0vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="136509086"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 14:11:29 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com,
	matthew.brost@intel.com
Subject: [i-g-t 2/4] lib/xe/xe_util: Introduce helper functions
Date: Thu, 13 Feb 2025 17:27:03 -0500
Message-Id: <20250213222705.275364-2-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20250213222705.275364-1-oak.zeng@intel.com>
References: <20250213222705.275364-1-oak.zeng@intel.com>
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

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 lib/xe/xe_util.c | 201 +++++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_util.h |  33 ++++++++
 2 files changed, 234 insertions(+)

diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
index 06b378ce0..b4215f273 100644
--- a/lib/xe/xe_util.c
+++ b/lib/xe/xe_util.c
@@ -13,6 +13,207 @@
 #include "xe/xe_query.h"
 #include "xe/xe_util.h"
 
+/**
+ * __xe_submit_cmd:
+ * @cmdbuf Pointer to the command buffer structure
+ *
+ * Submits a command buffer to the GPU, waits for its completion, and verifies
+ * the user fence value
+ *
+ * Return: The result of waiting for the user fence value
+ */
+int64_t __xe_submit_cmd(struct xe_buffer *cmdbuf)
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
+		.syncs = to_user_pointer(&sync),
+		.exec_queue_id = cmdbuf->exec_queue,
+		.address = (uint64_t)cmdbuf->gpu_addr,
+	};
+
+	xe_exec(cmdbuf->fd, &exec);
+	ret = __xe_wait_ufence(cmdbuf->fd, xe_cmdbuf_exec_ufence_cpuva(cmdbuf),
+			       USER_FENCE_VALUE, cmdbuf->exec_queue, &timeout);
+	/* Reset the fence so next fence wait won't return immediately */
+	memset(xe_cmdbuf_exec_ufence_cpuva(cmdbuf), 0, UFENCE_LENGTH);
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
+void xe_submit_cmd(struct xe_buffer *cmdbuf)
+{
+	int64_t ret;
+
+	ret = __xe_submit_cmd(cmdbuf);
+	igt_assert_eq(ret, 0);
+}
+
+/**
+ *xe_create_buffer:
+ * @buffer Pointer to the xe_buffer structure containing buffer details.
+ *
+ * Creates a buffer, maps it to both CPU and GPU address spaces, and binds it
+ * to a virtual memory (VM) space.
+ */
+void xe_create_buffer(struct xe_buffer *buffer)
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
+	sync->addr = (uint64_t)buffer->bind_ufence;
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
+	xe_wait_ufence(buffer->fd, (uint64_t *)buffer->bind_ufence,
+		       USER_FENCE_VALUE, buffer->bind_queue, NSEC_PER_SEC);
+	memset(buffer->bind_ufence, 0, PAGE_ALIGN_UFENCE);
+}
+
+/**
+ * xe_destroy_buffer:
+ * @buffer Pointer to the xe_buffer structure containing buffer details
+ *
+ * Destroys a buffer created by xe_create_buffer and releases associated
+ * resources.
+ */
+void xe_destroy_buffer(struct xe_buffer *buffer)
+{
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		  .timeline_value = USER_FENCE_VALUE },
+	};
+	sync->addr = (uint64_t)buffer->bind_ufence;
+
+	xe_vm_unbind_async(buffer->fd, buffer->vm, buffer->bind_queue,
+			   0, buffer->gpu_addr, buffer->size, sync, 1);
+	xe_wait_ufence(buffer->fd, (uint64_t *)buffer->bind_ufence,
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
+ * insert_store:
+ * @batch Pointer to the batch buffer where commands will be inserted.
+ * @dst_va Destination virtual address to store the value.
+ * @val Value to be stored.
+ *
+ * Inserts a MI_STORE_DWORD_IMM_GEN4 command into a batch buffer, which stores
+ * an immediate value to a given destination virtual address.
+ */
+void insert_store(uint32_t *batch, uint64_t dst_va, uint32_t val)
+{
+	int i = 0;
+
+	batch[i] = MI_STORE_DWORD_IMM_GEN4;
+	batch[++i] = dst_va;
+	batch[++i] = dst_va >> 32;
+	batch[++i] = val;
+	batch[++i] = MI_BATCH_BUFFER_END;
+}
+
+/**
+ * xe_create_cmdbuf:
+ * @cmd_buf Pointer to the xe_buffer structure representing the command buffer.
+ * @fill_func Pointer to the function that fills the command buffer.
+ * @dst_va Virtual address of the memory location where val need to store.
+ * @val Value to be written to the memory locations.
+ * @eci Pointer to the engine class instance for execution.
+ *
+ * Creates a command buffer, fills it with commands using the provided fill
+ * function, and sets up the execution queue for submission.
+ */
+void xe_create_cmdbuf(struct xe_buffer *cmd_buf, cmdbuf_fill_func_t fill_func,
+		      uint64_t dst_va, uint32_t val,
+		      struct drm_xe_engine_class_instance *eci)
+{
+	/*
+	 * make some room for a exec_ufence, which will be used to sync the
+	 * submission of this command....
+	 */
+	cmd_buf->size = xe_bb_size(cmd_buf->fd,
+				   cmd_buf->size + PAGE_ALIGN_UFENCE);
+	xe_create_buffer(cmd_buf);
+	cmd_buf->exec_queue = xe_exec_queue_create(cmd_buf->fd,
+						   cmd_buf->vm, eci, 0);
+	fill_func(cmd_buf->cpu_addr, dst_va, val);
+}
+
+/**
+ * xe_destroy_cmdbuf:
+ * @cmd_buf Pointer to the xe_buffer structure representing the command buffer.
+ *
+ * Destroys a command buffer created by xe_create_cmdbuf and releases
+ * associated resources.
+ */
+void xe_destroy_cmdbuf(struct xe_buffer *cmd_buf)
+{
+	xe_exec_queue_destroy(cmd_buf->fd, cmd_buf->exec_queue);
+	xe_destroy_buffer(cmd_buf);
+}
+
+/**
+ * xe_cmdbuf_exec_ufence_gpuva:
+ * @cmd_buf Pointer to the xe_buffer structure representing the command buffer.
+ *
+ * Returns the GPU virtual address of the execution user fence located at the
+ * end of the command buffer.
+ */
+uint64_t xe_cmdbuf_exec_ufence_gpuva(struct xe_buffer *cmd_buf)
+{
+	/* the last 8 bytes of the cmd buffer is used as ufence */
+	return (uint64_t)cmd_buf->gpu_addr + cmd_buf->size - UFENCE_LENGTH;
+}
+
+/**
+ * xe_cmdbuf_exec_ufence_cpuva:
+ * @cmd_buf Pointer to the xe_buffer structure representing the command buffer.
+ *
+ * Returns the CPU virtual address of the execution user fence located at the
+ * end of the command buffer.
+ */
+uint64_t *xe_cmdbuf_exec_ufence_cpuva(struct xe_buffer *cmd_buf)
+{
+	/* the last 8 bytes of the cmd buffer is used as ufence */
+	return cmd_buf->cpu_addr + cmd_buf->size - UFENCE_LENGTH;
+}
+
 static bool __region_belongs_to_regions_type(struct drm_xe_mem_region *region,
 					     uint32_t *mem_regions_type,
 					     int num_regions)
diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
index 06ebd3c2a..54f25619f 100644
--- a/lib/xe/xe_util.h
+++ b/lib/xe/xe_util.h
@@ -14,6 +14,39 @@
 
 #include "xe_query.h"
 
+#define USER_FENCE_VALUE        0xdeadbeefdeadbeefull
+#define PAGE_ALIGN_UFENCE	4096
+#define UFENCE_LENGTH		8
+
+struct xe_buffer {
+	void *cpu_addr;
+	uint64_t gpu_addr;
+	/*the user fence used to vm bind this buffer*/
+	uint32_t *bind_ufence;
+	uint64_t size;
+	uint32_t flag;
+	uint32_t vm;
+	uint32_t bo;
+	uint32_t placement;
+	uint32_t bind_queue;
+	/*only a cmd buffer has a exec queue*/
+	uint32_t exec_queue;
+	int fd;
+	bool is_userptr;
+};
+
+typedef void (*cmdbuf_fill_func_t) (uint32_t *batch, uint64_t dst_gpu_va, uint32_t val);
+void xe_create_buffer(struct xe_buffer *buffer);
+void xe_create_cmdbuf(struct xe_buffer *cmd_buf, cmdbuf_fill_func_t fill_func,
+		uint64_t dst_va, uint32_t val, struct drm_xe_engine_class_instance *eci);
+uint64_t xe_cmdbuf_exec_ufence_gpuva(struct xe_buffer *cmd_buf);
+uint64_t *xe_cmdbuf_exec_ufence_cpuva(struct xe_buffer *cmd_buf);
+void insert_store(uint32_t *batch, uint64_t dst_va, uint32_t val);
+void xe_submit_cmd(struct xe_buffer *cmdbuf);
+int64_t __xe_submit_cmd(struct xe_buffer *cmdbuf);
+void xe_destroy_buffer(struct xe_buffer *buffer);
+void xe_destroy_cmdbuf(struct xe_buffer *cmd_buf);
+
 #define XE_IS_SYSMEM_MEMORY_REGION(fd, region) \
 	(xe_region_class(fd, region) == DRM_XE_MEM_REGION_CLASS_SYSMEM)
 #define XE_IS_VRAM_MEMORY_REGION(fd, region) \
-- 
2.26.3

