Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0FCC36013
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 08:24:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F7E10E9A1;
	Fri, 28 Mar 2025 08:24:31 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42CCA10E2F3
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 08:24:31 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 52S8OQRL1469936; Fri, 28 Mar 2025 13:54:26 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 52S8OQxf1469935;
 Fri, 28 Mar 2025 13:54:26 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: igt-dev@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v3 04/19] lib/amdgpu: Add support of amd user queues
Date: Fri, 28 Mar 2025 13:54:01 +0530
Message-Id: <20250328082416.1469810-4-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250328082416.1469810-1-sunil.khatri@amd.com>
References: <20250328082416.1469810-1-sunil.khatri@amd.com>
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

This is the first patch set to add support of
UMQ(User mode queues) submission in IGT.

UMQ allows users to directly create a user queue and
submit workload to the GPU h/w to directly instead
of sending the workload to kernel and then to GPU h/w.

This will be used by test cases which will be testing
the UMQ queues for gfx/compute and sdma to start with.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 lib/amdgpu/amd_PM4.h        |   3 +
 lib/amdgpu/amd_ip_blocks.h  |   5 +
 lib/amdgpu/amd_user_queue.c | 418 ++++++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_user_queue.h |  48 +++++
 lib/meson.build             |   3 +-
 5 files changed, 476 insertions(+), 1 deletion(-)
 create mode 100644 lib/amdgpu/amd_user_queue.c
 create mode 100644 lib/amdgpu/amd_user_queue.h

diff --git a/lib/amdgpu/amd_PM4.h b/lib/amdgpu/amd_PM4.h
index 5bc3cb783..8f59b4223 100644
--- a/lib/amdgpu/amd_PM4.h
+++ b/lib/amdgpu/amd_PM4.h
@@ -192,6 +192,9 @@
 		 * 1 - pfp
 		 */
 
+#define PACKET3_INDIRECT_BUFFER                         0x3F
+#define PACKET3_PROTECTED_FENCE_SIGNAL                  0xd0
+
 #define	PACKET3_WRITE_DATA				0x37
 #define		WRITE_DATA_DST_SEL(x)                   ((x) << 8)
 		/* 0 - register
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 577b38387..85d69f5c6 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -27,6 +27,11 @@
 #define AMDGPU_RESET_TYPE_PER_QUEUE (1 << 2) /* per queue */
 #define AMDGPU_RESET_TYPE_PER_PIPE (1 << 3) /* per pipe */
 
+/* User queue */
+#define   S_3F3_INHERIT_VMID_MQD_GFX(x)        (((unsigned int)(x)&0x1) << 22)/* userqueue only */
+#define   S_3F3_VALID_COMPUTE(x)		(((unsigned int)(x)&0x1) << 23)/* userqueue only */
+#define   S_3F3_INHERIT_VMID_MQD_COMPUTE(x)	(((unsigned int)(x)&0x1) << 30)/* userqueue only */
+
 enum amd_ip_block_type {
 	AMD_IP_GFX = 0,
 	AMD_IP_COMPUTE,
diff --git a/lib/amdgpu/amd_user_queue.c b/lib/amdgpu/amd_user_queue.c
new file mode 100644
index 000000000..9412a37e8
--- /dev/null
+++ b/lib/amdgpu/amd_user_queue.c
@@ -0,0 +1,418 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2025 Advanced Micro Devices, Inc.
+ */
+
+#include "amd_user_queue.h"
+#include "amd_memory.h"
+#include "amd_PM4.h"
+#include "ioctl_wrappers.h"
+
+void amdgpu_alloc_doorbell(amdgpu_device_handle device_handle, struct amdgpu_userq_bo *doorbell_bo,
+			   unsigned int size, unsigned int domain)
+{
+	struct amdgpu_bo_alloc_request req = {0};
+	amdgpu_bo_handle buf_handle;
+	int r;
+
+	req.alloc_size = ALIGN(size, PAGE_SIZE);
+	req.preferred_heap = domain;
+	r = amdgpu_bo_alloc(device_handle, &req, &buf_handle);
+	igt_assert_eq(r, 0);
+
+	doorbell_bo->handle = buf_handle;
+	doorbell_bo->size = req.alloc_size;
+
+	r = amdgpu_bo_cpu_map(doorbell_bo->handle,
+			      (void **)&doorbell_bo->ptr);
+	igt_assert_eq(r, 0);
+}
+
+int
+amdgpu_bo_alloc_and_map_uq(amdgpu_device_handle device_handle, unsigned int size,
+			   unsigned int alignment, unsigned int heap, uint64_t alloc_flags,
+			   uint64_t mapping_flags, amdgpu_bo_handle *bo, void **cpu,
+			   uint64_t *mc_address, amdgpu_va_handle *va_handle,
+			   uint32_t timeline_syncobj_handle, uint64_t point)
+{
+	struct amdgpu_bo_alloc_request request = {};
+	amdgpu_bo_handle buf_handle;
+	uint64_t vmc_addr;
+	int r;
+
+	request.alloc_size = size;
+	request.phys_alignment = alignment;
+	request.preferred_heap = heap;
+	request.flags = alloc_flags;
+
+	r = amdgpu_bo_alloc(device_handle, &request, &buf_handle);
+	if (r)
+		return r;
+
+	r = amdgpu_va_range_alloc(device_handle,
+				  amdgpu_gpu_va_range_general,
+				  size, alignment, 0, &vmc_addr,
+				  va_handle, 0);
+	if (r)
+		goto error_va_alloc;
+
+	r = amdgpu_bo_va_op_raw2(device_handle, buf_handle, 0,
+				 ALIGN(size, getpagesize()), vmc_addr,
+				 AMDGPU_VM_PAGE_READABLE |
+				 AMDGPU_VM_PAGE_WRITEABLE |
+				 AMDGPU_VM_PAGE_EXECUTABLE |
+				 mapping_flags,
+				 AMDGPU_VA_OP_MAP,
+				 timeline_syncobj_handle,
+				 point, 0, 0);
+	if (r)
+		goto error_va_map;
+
+	if (cpu) {
+		r = amdgpu_bo_cpu_map(buf_handle, cpu);
+		if (r)
+			goto error_cpu_map;
+	}
+
+	*bo = buf_handle;
+	*mc_address = vmc_addr;
+
+	return 0;
+
+error_cpu_map:
+	amdgpu_bo_va_op(buf_handle, 0, size, vmc_addr, 0, AMDGPU_VA_OP_UNMAP);
+error_va_map:
+	amdgpu_va_range_free(*va_handle);
+error_va_alloc:
+	amdgpu_bo_free(buf_handle);
+	return r;
+}
+
+void amdgpu_bo_unmap_and_free_uq(amdgpu_device_handle device_handle, amdgpu_bo_handle bo,
+			    amdgpu_va_handle va_handle, uint64_t mc_addr, uint64_t size,
+			    uint32_t timeline_syncobj_handle, uint64_t point,
+			    uint64_t syncobj_handles_array, uint32_t num_syncobj_handles)
+{
+	amdgpu_bo_cpu_unmap(bo);
+	amdgpu_bo_va_op_raw2(device_handle, bo, 0, size, mc_addr, 0, AMDGPU_VA_OP_UNMAP,
+				  timeline_syncobj_handle, point,
+				  syncobj_handles_array, num_syncobj_handles);
+	amdgpu_va_range_free(va_handle);
+	amdgpu_bo_free(bo);
+}
+
+int amdgpu_timeline_syncobj_wait(amdgpu_device_handle device_handle,
+				 uint32_t timeline_syncobj_handle, uint64_t point)
+{
+	uint32_t flags = DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED;
+	int r;
+
+	r = amdgpu_cs_syncobj_query2(device_handle, &timeline_syncobj_handle,
+				     &point, 1, flags);
+	if (r)
+		return r;
+
+	r = amdgpu_cs_syncobj_timeline_wait(device_handle, &timeline_syncobj_handle,
+					    &point, 1, INT64_MAX,
+					    DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL |
+					    DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT,
+					    NULL);
+	if (r)
+		igt_warn("Timeline timed out\n");
+	return r;
+}
+
+void amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context,
+			      unsigned int ip_type, uint64_t mc_address)
+{
+	int r;
+	uint32_t *npkt = &ring_context->npkt;
+	uint32_t *queue_cpu = ring_context->queue_cpu;
+	uint32_t control = ring_context->pm4_dw;
+	uint32_t syncarray[1];
+
+	struct drm_amdgpu_userq_signal signal_data;
+
+	/* Prepare the Indirect IB to submit the IB to user queue */
+	queue_cpu[(*npkt)++] = PACKET3(PACKET3_INDIRECT_BUFFER, 2);
+	queue_cpu[(*npkt)++] = lower_32_bits(mc_address);
+	queue_cpu[(*npkt)++] = upper_32_bits(mc_address);
+
+	if (ip_type == AMD_IP_GFX)
+		queue_cpu[(*npkt)++] = control | S_3F3_INHERIT_VMID_MQD_GFX(1);
+	else
+		queue_cpu[(*npkt)++] = control | S_3F3_VALID_COMPUTE(1)
+					       | S_3F3_INHERIT_VMID_MQD_COMPUTE(1);
+
+	queue_cpu[(*npkt)++] = PACKET3(PACKET3_PROTECTED_FENCE_SIGNAL, 0);
+	/* empty dword is needed for fence signal pm4 */
+	++*npkt;
+
+	*ring_context->wptr_cpu = *npkt;
+	ring_context->doorbell_cpu[DOORBELL_INDEX] = *npkt;
+
+	/* Add a fence packet for signal */
+	syncarray[0] = ring_context->timeline_syncobj_handle;
+	signal_data.queue_id = ring_context->queue_id;
+	signal_data.syncobj_handles = (uintptr_t)syncarray;
+	signal_data.num_syncobj_handles = 1;
+	signal_data.bo_read_handles = 0;
+	signal_data.bo_write_handles = 0;
+	signal_data.num_bo_read_handles = 0;
+	signal_data.num_bo_write_handles = 0;
+
+	r = amdgpu_userq_signal(device, &signal_data);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_cs_syncobj_wait(device, &ring_context->timeline_syncobj_handle, 1, INT64_MAX,
+				   DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL, NULL);
+	igt_assert_eq(r, 0);
+}
+
+void amdgpu_user_queue_destroy(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt,
+			       unsigned int type)
+{
+	int r;
+
+	if (type > AMD_IP_DMA) {
+		igt_info("Invalid IP not supported for UMQ Submission\n");
+		return;
+	}
+
+	/* Free the Usermode Queue */
+	r = amdgpu_free_userqueue(device_handle, ctxt->queue_id);
+	igt_assert_eq(r, 0);
+
+	switch (type) {
+	case AMD_IP_GFX:
+		amdgpu_bo_unmap_and_free_uq(device_handle, ctxt->csa.handle,
+					    ctxt->csa.va_handle,
+					    ctxt->csa.mc_addr, ctxt->dev_info.csa_size,
+					    ctxt->timeline_syncobj_handle, ++ctxt->point,
+					    0, 0);
+
+		amdgpu_bo_unmap_and_free_uq(device_handle, ctxt->shadow.handle,
+					    ctxt->shadow.va_handle,
+					    ctxt->shadow.mc_addr, ctxt->dev_info.shadow_size,
+					    ctxt->timeline_syncobj_handle, ++ctxt->point,
+					    0, 0);
+
+		r = amdgpu_timeline_syncobj_wait(device_handle, ctxt->timeline_syncobj_handle,
+						 ctxt->point);
+		igt_assert_eq(r, 0);
+		break;
+
+	case AMD_IP_COMPUTE:
+		amdgpu_bo_unmap_and_free_uq(device_handle, ctxt->eop.handle,
+					    ctxt->eop.va_handle,
+					    ctxt->eop.mc_addr, 256,
+					    ctxt->timeline_syncobj_handle, ++ctxt->point,
+					    0, 0);
+
+		r = amdgpu_timeline_syncobj_wait(device_handle, ctxt->timeline_syncobj_handle,
+						 ctxt->point);
+		igt_assert_eq(r, 0);
+		break;
+
+	case AMD_IP_DMA:
+		amdgpu_bo_unmap_and_free_uq(device_handle, ctxt->csa.handle,
+					    ctxt->csa.va_handle,
+					    ctxt->csa.mc_addr, ctxt->dev_info.csa_size,
+					    ctxt->timeline_syncobj_handle, ++ctxt->point,
+					    0, 0);
+
+		r = amdgpu_timeline_syncobj_wait(device_handle, ctxt->timeline_syncobj_handle,
+						 ctxt->point);
+		igt_assert_eq(r, 0);
+		break;
+
+	default:
+		igt_info("IP invalid for cleanup\n");
+	}
+
+	r = amdgpu_cs_destroy_syncobj(device_handle, ctxt->timeline_syncobj_handle);
+	igt_assert_eq(r, 0);
+
+	/* Clean up doorbell*/
+	r = amdgpu_bo_cpu_unmap(ctxt->doorbell.handle);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_free(ctxt->doorbell.handle);
+	igt_assert_eq(r, 0);
+
+	/* Clean up rptr wptr queue */
+	amdgpu_bo_unmap_and_free(ctxt->rptr.handle, ctxt->rptr.va_handle,
+				 ctxt->rptr.mc_addr, 8);
+
+	amdgpu_bo_unmap_and_free(ctxt->wptr.handle, ctxt->wptr.va_handle,
+				 ctxt->wptr.mc_addr, 8);
+
+	amdgpu_bo_unmap_and_free(ctxt->queue.handle, ctxt->queue.va_handle,
+				 ctxt->queue.mc_addr, USERMODE_QUEUE_SIZE);
+}
+
+void amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt,
+			      unsigned int type)
+{
+	int r;
+	uint64_t gtt_flags = 0;
+	struct drm_amdgpu_userq_mqd_gfx11 gfx_mqd;
+	struct drm_amdgpu_userq_mqd_sdma_gfx11 sdma_mqd;
+	struct drm_amdgpu_userq_mqd_compute_gfx11 compute_mqd;
+	void *mqd;
+
+	if (type > AMD_IP_DMA) {
+		igt_info("Invalid IP not supported for UMQ Submission\n");
+		return;
+	}
+
+	r = amdgpu_query_info(device_handle, AMDGPU_INFO_DEV_INFO,
+			      sizeof(ctxt->dev_info), &ctxt->dev_info);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_cs_create_syncobj2(device_handle, 0, &ctxt->timeline_syncobj_handle);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_alloc_and_map_uq(device_handle, USERMODE_QUEUE_SIZE,
+				       ALIGNMENT,
+				       AMDGPU_GEM_DOMAIN_GTT,
+				       gtt_flags,
+				       AMDGPU_VM_MTYPE_UC,
+				       &ctxt->queue.handle, &ctxt->queue.ptr,
+				       &ctxt->queue.mc_addr, &ctxt->queue.va_handle,
+				       ctxt->timeline_syncobj_handle, ++ctxt->point);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_alloc_and_map_uq(device_handle, 8,
+				       ALIGNMENT,
+				       AMDGPU_GEM_DOMAIN_GTT,
+				       gtt_flags,
+				       AMDGPU_VM_MTYPE_UC,
+				       &ctxt->wptr.handle, &ctxt->wptr.ptr,
+				       &ctxt->wptr.mc_addr, &ctxt->wptr.va_handle,
+				       ctxt->timeline_syncobj_handle, ++ctxt->point);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_alloc_and_map_uq(device_handle, 8,
+				       ALIGNMENT,
+				       AMDGPU_GEM_DOMAIN_GTT,
+				       gtt_flags,
+				       AMDGPU_VM_MTYPE_UC,
+				       &ctxt->rptr.handle, &ctxt->rptr.ptr,
+				       &ctxt->rptr.mc_addr, &ctxt->rptr.va_handle,
+				       ctxt->timeline_syncobj_handle, ++ctxt->point);
+	igt_assert_eq(r, 0);
+
+	switch (type) {
+	case AMD_IP_GFX:
+		r = amdgpu_bo_alloc_and_map_uq(device_handle, ctxt->dev_info.shadow_size,
+					       ctxt->dev_info.shadow_alignment,
+					       AMDGPU_GEM_DOMAIN_GTT,
+					       gtt_flags,
+					       AMDGPU_VM_MTYPE_UC,
+					       &ctxt->shadow.handle, NULL,
+					       &ctxt->shadow.mc_addr, &ctxt->shadow.va_handle,
+					       ctxt->timeline_syncobj_handle, ++ctxt->point);
+		igt_assert_eq(r, 0);
+
+		r = amdgpu_bo_alloc_and_map_uq(device_handle, ctxt->dev_info.csa_size,
+					       ctxt->dev_info.csa_alignment,
+					       AMDGPU_GEM_DOMAIN_GTT,
+					       gtt_flags,
+					       AMDGPU_VM_MTYPE_UC,
+					       &ctxt->csa.handle, NULL,
+					       &ctxt->csa.mc_addr, &ctxt->csa.va_handle,
+					       ctxt->timeline_syncobj_handle, ++ctxt->point);
+		igt_assert_eq(r, 0);
+
+		gfx_mqd.shadow_va = ctxt->shadow.mc_addr;
+		gfx_mqd.csa_va = ctxt->csa.mc_addr;
+		mqd = &gfx_mqd;
+		break;
+
+	case AMD_IP_COMPUTE:
+		r = amdgpu_bo_alloc_and_map_uq(device_handle, 256,
+					       ALIGNMENT,
+					       AMDGPU_GEM_DOMAIN_GTT,
+					       gtt_flags,
+					       AMDGPU_VM_MTYPE_UC,
+					       &ctxt->eop.handle, NULL,
+					       &ctxt->eop.mc_addr, &ctxt->eop.va_handle,
+					       ctxt->timeline_syncobj_handle, ++ctxt->point);
+		igt_assert_eq(r, 0);
+		compute_mqd.eop_va = ctxt->eop.mc_addr;
+		mqd = &compute_mqd;
+		break;
+
+	case AMD_IP_DMA:
+		r = amdgpu_bo_alloc_and_map_uq(device_handle, ctxt->dev_info.csa_size,
+					       ctxt->dev_info.csa_alignment,
+					       AMDGPU_GEM_DOMAIN_GTT,
+					       gtt_flags,
+					       AMDGPU_VM_MTYPE_UC,
+					       &ctxt->csa.handle, NULL,
+					       &ctxt->csa.mc_addr, &ctxt->csa.va_handle,
+					       ctxt->timeline_syncobj_handle, ++ctxt->point);
+		igt_assert_eq(r, 0);
+		sdma_mqd.csa_va = ctxt->csa.mc_addr;
+		mqd = &sdma_mqd;
+		break;
+
+	default:
+		igt_info("Unsupported IP for UMQ submission\n");
+		return;
+
+	}
+
+	r = amdgpu_timeline_syncobj_wait(device_handle, ctxt->timeline_syncobj_handle,
+					 ctxt->point);
+	igt_assert_eq(r, 0);
+
+	amdgpu_alloc_doorbell(device_handle, &ctxt->doorbell, PAGE_SIZE,
+			      AMDGPU_GEM_DOMAIN_DOORBELL);
+
+	ctxt->doorbell_cpu = (uint64_t *)ctxt->doorbell.ptr;
+
+	ctxt->wptr_cpu = (uint64_t *)ctxt->wptr.ptr;
+
+	ctxt->queue_cpu = (uint32_t *)ctxt->queue.ptr;
+	memset(ctxt->queue_cpu, 0, USERMODE_QUEUE_SIZE);
+
+	/* get db bo handle */
+	amdgpu_bo_export(ctxt->doorbell.handle, amdgpu_bo_handle_type_kms, &ctxt->db_handle);
+
+	/* Create the Usermode Queue */
+	switch (type) {
+	case AMD_IP_GFX:
+		r = amdgpu_create_userqueue(device_handle, AMDGPU_HW_IP_GFX,
+					    ctxt->db_handle, DOORBELL_INDEX,
+					    ctxt->queue.mc_addr, USERMODE_QUEUE_SIZE,
+					    ctxt->wptr.mc_addr, ctxt->rptr.mc_addr,
+					    mqd, &ctxt->queue_id);
+		igt_assert_eq(r, 0);
+		break;
+
+	case AMD_IP_COMPUTE:
+		r = amdgpu_create_userqueue(device_handle, AMDGPU_HW_IP_COMPUTE,
+					    ctxt->db_handle, DOORBELL_INDEX,
+					    ctxt->queue.mc_addr, USERMODE_QUEUE_SIZE,
+					    ctxt->wptr.mc_addr, ctxt->rptr.mc_addr,
+					    mqd, &ctxt->queue_id);
+		igt_assert_eq(r, 0);
+		break;
+
+	case AMD_IP_DMA:
+		r = amdgpu_create_userqueue(device_handle, AMDGPU_HW_IP_DMA,
+					    ctxt->db_handle, DOORBELL_INDEX,
+					    ctxt->queue.mc_addr, USERMODE_QUEUE_SIZE,
+					    ctxt->wptr.mc_addr, ctxt->rptr.mc_addr,
+					    mqd, &ctxt->queue_id);
+		igt_assert_eq(r, 0);
+		break;
+
+	default:
+		igt_info("Unsupported IP, failed to create user queue\n");
+		return;
+
+	}
+}
diff --git a/lib/amdgpu/amd_user_queue.h b/lib/amdgpu/amd_user_queue.h
new file mode 100644
index 000000000..355f16f19
--- /dev/null
+++ b/lib/amdgpu/amd_user_queue.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright 2025 Advanced Micro Devices, Inc.
+ */
+
+#ifndef _AMD_USER_QUEUE_
+#define _AMD_USER_QUEUE_
+
+#include <amdgpu_drm.h>
+#include <amdgpu.h>
+#include <time.h>
+#include "amd_ip_blocks.h"
+
+
+#ifndef PAGE_SIZE
+#define PAGE_SIZE 4096
+#endif
+
+#define USERMODE_QUEUE_SIZE		(PAGE_SIZE * 256)   //In bytes
+#define ALIGNMENT			4096
+#define DOORBELL_INDEX			4
+
+void amdgpu_alloc_doorbell(amdgpu_device_handle device_handle, struct amdgpu_userq_bo *doorbell_bo,
+			   unsigned int size, unsigned int domain);
+
+int amdgpu_bo_alloc_and_map_uq(amdgpu_device_handle device_handle, unsigned int size,
+			       unsigned int alignment, unsigned int heap, uint64_t alloc_flags,
+			       uint64_t mapping_flags, amdgpu_bo_handle *bo, void **cpu,
+			       uint64_t *mc_address, amdgpu_va_handle *va_handle,
+			       uint32_t timeline_syncobj_handle, uint64_t point);
+
+void amdgpu_bo_unmap_and_free_uq(amdgpu_device_handle device_handle, amdgpu_bo_handle bo,
+				 amdgpu_va_handle va_handle, uint64_t mc_addr, uint64_t size,
+				 uint32_t timeline_syncobj_handle, uint64_t point,
+				 uint64_t syncobj_handles_array, uint32_t num_syncobj_handles);
+
+int amdgpu_timeline_syncobj_wait(amdgpu_device_handle device_handle,
+				 uint32_t timeline_syncobj_handle, uint64_t point);
+
+void amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt,
+			      unsigned int ip_type);
+
+void amdgpu_user_queue_destroy(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt,
+			       unsigned int ip_type);
+
+void amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context,
+			      unsigned int ip_type, uint64_t mc_address);
+
+#endif
diff --git a/lib/meson.build b/lib/meson.build
index d01c90df9..d7bb72c57 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -165,7 +165,8 @@ if libdrm_amdgpu.found()
 		'amdgpu/xalloc.h',
 		'amdgpu/amd_cp_dma.c',
 		'amdgpu/amd_mem_leak.c',
-		'amdgpu/amd_mmd_shared.c'
+		'amdgpu/amd_mmd_shared.c',
+		'amdgpu/amd_user_queue.c'
 	]
 	if libdrm_amdgpu.version().version_compare('> 2.4.99')
 		lib_sources +=[ 'amdgpu/amd_dispatch.c',]
-- 
2.43.0

