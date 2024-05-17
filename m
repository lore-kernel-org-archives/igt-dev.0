Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47EFC04FFE
	for <igt-dev@archiver.kernel.org>; Fri, 17 May 2024 11:46:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC0D10EE87;
	Fri, 17 May 2024 11:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LvzrCqTt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 812C110EE83
 for <igt-dev@lists.freedesktop.org>; Fri, 17 May 2024 11:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715946396; x=1747482396;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6QULw/Dy2Gy6dDuINDijAo1PBDwxpm5SifVyIUA5I/Y=;
 b=LvzrCqTt6T/FapUYY2sPq2SoFKyIp6WaCNV6zaNRbtdONpfno3SVFPki
 VTwcSPavBGa4dXmZpl7GiF6VR0qcMCh2ByjJMFvGyzjTB7cAwDqJLfY9o
 HVWMr5HJ63xpb+sz1SL0czM4hY+eKCjpgqQNRL18HMQiPN4w1NZgCDFSD
 fEFipM/8ydJFlUoDzQEbMfRjad2AKxiZFBpmHyTkhKr1NH6OS34oT+/zY
 +0p1ZEGam8szG3kRQOFAhgI2CB1JCzxJs20w5pAIBWNKVOsgGKTFMhDDq
 RZZOBBsJjkIvrSCmA32q7SwkNkFjaSbjOF1Wg/LivS6eDycLfTNsWOdGx w==;
X-CSE-ConnectionGUID: SWpr59M1QYqYEj0vA0xccw==
X-CSE-MsgGUID: nBXlJAd0QVmHaomjfAHNdA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="29619978"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="29619978"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 04:46:31 -0700
X-CSE-ConnectionGUID: l5ALJn2HSIq4jIYMKz7n3g==
X-CSE-MsgGUID: tjDHhYusQ5Sz+cg0Ts6Txg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="54977275"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by fmviesa002.fm.intel.com with ESMTP; 17 May 2024 04:46:29 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Oak Zeng <oak.zeng@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH i-g-t v3 01/10] lib/xe/xe_util: Introduce helper functions for
 buffer creation and command submission etc
Date: Fri, 17 May 2024 17:16:49 +0530
Message-Id: <20240517114658.810283-2-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240517114658.810283-1-krishnaiah.bommu@intel.com>
References: <20240517114658.810283-1-krishnaiah.bommu@intel.com>
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

Introduce helper functions for buffer creation, binding, command submission, and
destruction, applicable for SVM and other tests.

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 lib/xe/xe_util.c | 151 +++++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_util.h |  33 +++++++++++
 2 files changed, 184 insertions(+)

diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
index 050162b5e..de848b8bc 100644
--- a/lib/xe/xe_util.c
+++ b/lib/xe/xe_util.c
@@ -10,6 +10,157 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_util.h"
+#include "lib/svga/vm_basic_types.h"
+
+/**
+ * Submits a command buffer to the GPU, waits for its completion, and verifies
+ * the user fence value
+ */
+int64_t __xe_submit_cmd(struct xe_buffer *cmdbuf)
+{
+	int64_t timeout = ONE_SEC;
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
+	return __xe_wait_ufence(cmdbuf->fd, xe_cmdbuf_exec_ufence_cpuva(cmdbuf),USER_FENCE_VALUE, cmdbuf->exec_queue, &timeout);
+}
+
+/**
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
+ * Creates a buffer, maps it to both CPU and GPU address spaces, and binds it
+ * to a virtual memory (VM) space.
+ */
+void xe_create_buffer(struct xe_buffer *buffer)
+{
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+			.timeline_value = USER_FENCE_VALUE },
+	};
+
+	buffer->bind_queue = xe_bind_exec_queue_create(buffer->fd, buffer->vm, 0);
+	buffer->bind_ufence = aligned_alloc(xe_get_default_alignment(buffer->fd), PAGE_ALIGN_UFENCE);
+	sync->addr = (uint64_t)buffer->bind_ufence;
+
+	if (!buffer->is_userptr) {
+		buffer->bo = xe_bo_create(buffer->fd, 0, buffer->size, buffer->placement, buffer->flag);
+		buffer->cpu_addr = xe_bo_map(buffer->fd, buffer->bo, buffer->size);
+		xe_vm_bind_async(buffer->fd, buffer->vm, buffer->bind_queue, buffer->bo, 0, (uint64_t)buffer->gpu_addr, buffer->size, sync, 1);
+	} else {
+		buffer->cpu_addr = aligned_alloc(xe_get_default_alignment(buffer->fd), buffer->size);
+		xe_vm_bind_userptr_async(buffer->fd, buffer->vm, buffer->bind_queue, to_user_pointer(buffer->cpu_addr), (uint64_t)buffer->gpu_addr, buffer->size, sync, 1);
+	}
+
+	xe_wait_ufence(buffer->fd, (uint64_t *)buffer->bind_ufence, USER_FENCE_VALUE, buffer->bind_queue, ONE_SEC);
+}
+
+/**
+ * Destroys a buffer created by xe_create_buffer and releases associated
+ * resources.
+ */
+void xe_destroy_buffer(struct xe_buffer *buffer)
+{
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+			.timeline_value = USER_FENCE_VALUE },
+	};
+	sync->addr = (uint64_t)buffer->bind_ufence;
+
+	xe_vm_unbind_async(buffer->fd, buffer->vm, buffer->bind_queue, 0, (uint64_t)buffer->gpu_addr, buffer->size, sync, 1);
+	xe_wait_ufence(buffer->fd, (uint64_t *)buffer->bind_ufence, USER_FENCE_VALUE, buffer->bind_queue, ONE_SEC);
+
+	munmap(buffer->cpu_addr, buffer->size);
+	if (!buffer->is_userptr)
+		gem_close(buffer->fd, buffer->bo);
+	else
+		free(buffer->cpu_addr);
+
+	free(buffer->bind_ufence);
+	xe_exec_queue_destroy(buffer->fd, buffer->bind_queue);
+}
+
+/**
+ * Inserts a MI_STORE_DWORD_IMM_GEN4 command into a batch buffer, which stores
+ * an immediate value to a given destination virtual address.
+ * */
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
+ * Creates a command buffer, fills it with commands using the provided fill
+ * function, and sets up the execution queue for submission.
+ */
+void xe_create_cmdbuf(struct xe_buffer *cmd_buf, cmdbuf_fill_func_t fill_func, uint64_t dst_va, uint32_t val, struct drm_xe_engine_class_instance *eci)
+{
+	//make some room for a exec_ufence, which will be used to sync the
+	//submission of this command....
+
+	cmd_buf->size = xe_bb_size(cmd_buf->fd, cmd_buf->size + PAGE_ALIGN_UFENCE);
+	xe_create_buffer(cmd_buf);
+	cmd_buf->exec_queue = xe_exec_queue_create(cmd_buf->fd, cmd_buf->vm, eci, 0);
+	fill_func(cmd_buf->cpu_addr, dst_va, val);
+}
+
+/**
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
+ * Returns the GPU virtual address of the execution user fence located at the
+ * end of the command buffer.
+ */
+uint64_t xe_cmdbuf_exec_ufence_gpuva(struct xe_buffer *cmd_buf)
+{
+	/* the last 8 bytes of the cmd buffer is used as ufence */
+	return (uint64_t)cmd_buf->gpu_addr + cmd_buf->size - 8;
+}
+
+/**
+ * Returns the CPU virtual address of the execution user fence located at the
+ * end of the command buffer.
+ */
+uint64_t *xe_cmdbuf_exec_ufence_cpuva(struct xe_buffer *cmd_buf)
+{
+	/* the last 8 bytes of the cmd buffer is used as ufence */
+	return cmd_buf->cpu_addr + cmd_buf->size - 8;
+}
 
 static bool __region_belongs_to_regions_type(struct drm_xe_mem_region *region,
 					     uint32_t *mem_regions_type,
diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
index 6480ea01a..c38f79e60 100644
--- a/lib/xe/xe_util.h
+++ b/lib/xe/xe_util.h
@@ -12,6 +12,39 @@
 #include <stdint.h>
 #include <xe_drm.h>
 
+#define USER_FENCE_VALUE        0xdeadbeefdeadbeefull
+#define ONE_SEC MS_TO_NS(1000)
+#define PAGE_ALIGN_UFENCE 4096
+
+struct xe_buffer {
+	void *cpu_addr;
+	void *gpu_addr;
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
2.25.1

