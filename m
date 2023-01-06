Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2081.outbound.protection.outlook.com [40.107.237.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B15C10E829
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Jan 2023 02:48:37 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 5 Jan 2023 21:48:11 -0500
Message-ID: <20230106024812.102077-3-vitaly.prosyak@amd.com>
In-Reply-To: <20230106024812.102077-1-vitaly.prosyak@amd.com>
References: <20230106024812.102077-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 3/4] lib/amdgpu: add cp dma helper functions
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: christian.koenig@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

P2P dma-buf support allows drivers to share device memory
(e.g., gtt, vram) with other devices using the dma-buf framework.
The DMA is capable of performing mem-to-mem, mem-to-reg, reg-to-mem
or reg-to-reg transfers.

CP DMA tests are executed between GTT and VRAM of a single chip
and also between separate ASICs.

Port cp dma tests from drm_lib with the following improvements:
 - remove any global variables which restrict scalability and readability
 - reuse memory allocation helpers vs new helpers as in the original test
 - use helper structs to reduce the number of parameters in functions.

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/amdgpu/amd_cp_dma.c | 437 ++++++++++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_cp_dma.h |  24 +++
 lib/meson.build         |   3 +-
 3 files changed, 463 insertions(+), 1 deletion(-)
 create mode 100644 lib/amdgpu/amd_cp_dma.c
 create mode 100644 lib/amdgpu/amd_cp_dma.h

diff --git a/lib/amdgpu/amd_cp_dma.c b/lib/amdgpu/amd_cp_dma.c
new file mode 100644
index 000000000..52924fdb3
--- /dev/null
+++ b/lib/amdgpu/amd_cp_dma.c
@@ -0,0 +1,437 @@
+// SPDX-License-Identifier: MIT
+// Copyright 2023 Advanced Micro Devices, Inc.
+
+#include <unistd.h>
+#include <amdgpu.h>
+
+#include "amdgpu_drm.h"
+#include "amd_memory.h"
+#include "amd_cp_dma.h"
+
+#define IB_SIZE 4096
+#define MAX_RESOURCES 3
+
+#define DMA_SIZE 4097
+#define DMA_DATA_BYTE 0xea
+#define DMA_SIZE_MAX (1<<26)
+
+struct amdgpu_cp_dma_bo {
+	amdgpu_bo_handle buf_handle;
+	amdgpu_va_handle va_handle;
+	uint64_t gpu_va;
+	uint64_t size;
+};
+
+struct amdgpu_cp_dma_ib {
+	amdgpu_bo_handle ib_handle;
+	uint32_t *ib_cpu;
+	uint64_t ib_mc_address;
+	amdgpu_va_handle ib_va_handle;
+};
+
+struct amdgpu_cp_dma_contex {
+	amdgpu_bo_handle resources[MAX_RESOURCES];
+	unsigned int num_resources;
+	uint32_t num_dword;
+	uint8_t *reference_data;
+};
+
+static int
+import_dma_buf_to_bo(amdgpu_device_handle dev, int dmabuf_fd,
+					 struct amdgpu_cp_dma_bo *bo)
+{
+	amdgpu_va_handle va_handle;
+	uint64_t vmc_addr;
+	int r;
+	struct amdgpu_bo_import_result bo_import_result = {};
+
+	r = amdgpu_bo_import(dev, amdgpu_bo_handle_type_dma_buf_fd,
+						 dmabuf_fd, &bo_import_result);
+	if (r)
+		goto error_bo_import;
+
+	r = amdgpu_va_range_alloc(dev, amdgpu_gpu_va_range_general,
+							  bo_import_result.alloc_size, 0, 0,
+							  &vmc_addr, &va_handle, 0);
+	if (r)
+		goto error_va_alloc;
+
+	r = amdgpu_bo_va_op(bo_import_result.buf_handle, 0,
+			bo_import_result.alloc_size, vmc_addr,
+			AMDGPU_VM_PAGE_READABLE | AMDGPU_VM_PAGE_WRITEABLE |
+			AMDGPU_VM_PAGE_EXECUTABLE,
+			AMDGPU_VA_OP_MAP);
+	if (r)
+		goto error_va_map;
+
+	bo->buf_handle = bo_import_result.buf_handle;
+	bo->va_handle = va_handle;
+	bo->gpu_va = vmc_addr;
+	bo->size = bo_import_result.alloc_size;
+
+	return 0;
+
+error_va_map:
+	amdgpu_bo_va_op(bo_import_result.buf_handle, 0,
+			bo_import_result.alloc_size, vmc_addr, 0, AMDGPU_VA_OP_UNMAP);
+
+error_va_alloc:
+	amdgpu_va_range_free(va_handle);
+
+error_bo_import:
+	amdgpu_bo_free(bo_import_result.buf_handle);
+
+	return r;
+}
+
+static int
+free_bo(struct amdgpu_cp_dma_bo bo)
+{
+	int r;
+
+	r = amdgpu_bo_va_op(bo.buf_handle, 0, bo.size, bo.gpu_va, 0, AMDGPU_VA_OP_UNMAP);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_va_range_free(bo.va_handle);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_free(bo.buf_handle);
+	igt_assert_eq(r, 0);
+
+	return r;
+}
+
+static int
+submit_and_sync(amdgpu_device_handle device_handle, unsigned int ip_type,
+				amdgpu_context_handle context_handle, uint64_t ib_mc_address,
+				struct amdgpu_cp_dma_contex *dma_contex)
+{
+	struct amdgpu_cs_request ibs_request = {0};
+	struct amdgpu_cs_ib_info ib_info = {0};
+	struct amdgpu_cs_fence fence_status = {0};
+	uint32_t expired;
+	int r;
+
+	r = amdgpu_bo_list_create(device_handle, dma_contex->num_resources,
+							  dma_contex->resources,
+							  NULL, &ibs_request.resources);
+	igt_assert_eq(r, 0);
+
+	ib_info.ib_mc_address = ib_mc_address;
+	ib_info.size = dma_contex->num_dword;
+
+	ibs_request.ip_type = ip_type;
+	ibs_request.number_of_ibs = 1;
+	ibs_request.ibs = &ib_info;
+	ibs_request.fence_info.handle = NULL;
+
+	r = amdgpu_cs_submit(context_handle, 0, &ibs_request, 1);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_list_destroy(ibs_request.resources);
+	igt_assert_eq(r, 0);
+
+	fence_status.context = context_handle;
+	fence_status.ip_type = ip_type;
+	fence_status.fence = ibs_request.seq_no;
+
+	r = amdgpu_cs_query_fence_status(&fence_status, AMDGPU_TIMEOUT_INFINITE,
+									 0, &expired);
+	return r;
+}
+
+static void
+cp_dma_cmd(const struct amdgpu_cp_dma_ib *ib, struct amdgpu_cp_dma_contex *dma_contex,
+		   const struct amdgpu_cp_dma_bo *src_bo, const struct amdgpu_cp_dma_bo *dst_bo)
+{
+	/* TODO use spec defines */
+	ib->ib_cpu[0] = 0xc0055000;
+	ib->ib_cpu[1] = 0x80000000;
+	ib->ib_cpu[2] = src_bo->gpu_va & 0x00000000ffffffff;
+	ib->ib_cpu[3] = (src_bo->gpu_va & 0xffffffff00000000) >> 32;
+	ib->ib_cpu[4] = dst_bo->gpu_va & 0x00000000ffffffff;
+	ib->ib_cpu[5] = (dst_bo->gpu_va & 0xffffffff00000000) >> 32;
+	// size is read from the lower 26bits.
+	ib->ib_cpu[6] = ((1 << 26) - 1) & DMA_SIZE;
+	ib->ib_cpu[7] = 0xffff1000;
+
+	dma_contex->num_dword = 8;
+
+	dma_contex->resources[0] = src_bo->buf_handle;
+	dma_contex->resources[1] = dst_bo->buf_handle;
+	dma_contex->resources[2] = ib->ib_handle;
+	dma_contex->num_resources = 3;
+}
+
+static int
+amdgpu_cp_dma(amdgpu_device_handle device_handle, unsigned int ip_type,
+			  amdgpu_context_handle context_handle,
+			  const struct amdgpu_cp_dma_ib *ib,
+			  struct amdgpu_cp_dma_contex *dma_contex,
+			  uint32_t src_heap, uint32_t dst_heap)
+{
+	int r;
+	struct amdgpu_cp_dma_bo src_bo = {0};
+	struct amdgpu_cp_dma_bo dst_bo = {0};
+	void *src_bo_cpu;
+	void *dst_bo_cpu;
+
+	/* allocate the src bo, set its data to DMA_DATA_BYTE */
+	src_bo.buf_handle = gpu_mem_alloc(device_handle, DMA_SIZE, 4096,
+						src_heap, AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED,
+						&src_bo.gpu_va, &src_bo.va_handle);
+
+	r = amdgpu_bo_cpu_map(src_bo.buf_handle, (void **)&src_bo_cpu);
+	igt_assert_eq(r, 0);
+	memset(src_bo_cpu, DMA_DATA_BYTE, DMA_SIZE);
+
+	r = amdgpu_bo_cpu_unmap(src_bo.buf_handle);
+	igt_assert_eq(r, 0);
+
+	/* allocate the dst bo and clear its content to all 0 */
+	dst_bo.buf_handle = gpu_mem_alloc(device_handle, DMA_SIZE, 4096, dst_heap,
+							AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED,
+							&dst_bo.gpu_va, &dst_bo.va_handle);
+
+	r = amdgpu_bo_cpu_map(dst_bo.buf_handle, (void **)&dst_bo_cpu);
+	igt_assert_eq(r, 0);
+
+	memset(dst_bo_cpu, 0, DMA_SIZE);
+
+	/* record CP DMA command and dispatch the command */
+	cp_dma_cmd(ib, dma_contex, &src_bo, &dst_bo);
+
+	r = submit_and_sync(device_handle, ip_type, context_handle,
+						ib->ib_mc_address, dma_contex);
+	igt_assert_eq(r, 0);
+
+	/* verify the dst bo is filled with DMA_DATA_BYTE */
+	r = memcmp(dst_bo_cpu, dma_contex->reference_data, DMA_SIZE);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_cpu_unmap(dst_bo.buf_handle);
+	igt_assert_eq(r, 0);
+
+	r = free_bo(src_bo);
+	igt_assert_eq(r, 0);
+
+	r = free_bo(dst_bo);
+	igt_assert_eq(r, 0);
+
+	return r;
+}
+
+static int
+amdgpu_cp_dma_p2p(amdgpu_device_handle device_handle,
+				  amdgpu_device_handle exporting_device_handle,
+				  unsigned int ip_type, amdgpu_context_handle context_handle,
+				  uint32_t src_heap, uint32_t dst_heap,
+				  const struct amdgpu_cp_dma_ib *ib,
+				  struct amdgpu_cp_dma_contex *dma_contex)
+{
+	int r;
+	struct amdgpu_cp_dma_bo exported_bo = {0};
+	int dma_buf_fd;
+	int dma_buf_fd_dup;
+	struct amdgpu_cp_dma_bo src_bo = {0};
+	struct amdgpu_cp_dma_bo imported_dst_bo = {0};
+
+	void *exported_bo_cpu;
+	void *src_bo_cpu;
+
+	/* allocate a bo on the peer device and export it to dma-buf */
+	exported_bo.buf_handle = gpu_mem_alloc(exporting_device_handle,
+			DMA_SIZE, 4096, src_heap,
+			AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED,
+			&exported_bo.gpu_va, &exported_bo.va_handle);
+
+	/* map the exported bo and clear its content to 0 */
+	r = amdgpu_bo_cpu_map(exported_bo.buf_handle, (void **)&exported_bo_cpu);
+	igt_assert_eq(r, 0);
+	memset(exported_bo_cpu, 0, DMA_SIZE);
+
+	r = amdgpu_bo_export(exported_bo.buf_handle,
+			amdgpu_bo_handle_type_dma_buf_fd, (uint32_t *)&dma_buf_fd);
+	igt_assert_eq(r, 0);
+
+    // According to amdgpu_drm:
+	// "Buffer must be "imported" only using new "fd"
+	// (different from one used by "exporter")"
+	dma_buf_fd_dup = dup(dma_buf_fd);
+	r = close(dma_buf_fd);
+	igt_assert_eq(r, 0);
+
+	/* import the dma-buf to the executing device, imported bo is the DMA destination */
+	r = import_dma_buf_to_bo(device_handle, dma_buf_fd_dup, &imported_dst_bo);
+	igt_assert_eq(r, 0);
+
+	r = close(dma_buf_fd_dup);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_cs_ctx_create(device_handle, &context_handle);
+	/* allocate the src bo and set its content to DMA_DATA_BYTE */
+
+	src_bo.buf_handle = gpu_mem_alloc(device_handle, DMA_SIZE, 4096,
+						dst_heap, AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED,
+						&src_bo.gpu_va, &src_bo.va_handle);
+
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_cpu_map(src_bo.buf_handle, (void **)&src_bo_cpu);
+	igt_assert_eq(r, 0);
+
+	memset(src_bo_cpu, DMA_DATA_BYTE, DMA_SIZE);
+
+	r = amdgpu_bo_cpu_unmap(src_bo.buf_handle);
+	igt_assert_eq(r, 0);
+
+	/* record CP DMA command and dispatch the command */
+	cp_dma_cmd(ib, dma_contex, &src_bo, &imported_dst_bo);
+
+	r = submit_and_sync(device_handle, ip_type, context_handle,
+						ib->ib_mc_address, dma_contex);
+
+	igt_assert_eq(r, 0);
+
+	/* verify the exported_bo_cpu is filled with DMA_DATA_BYTE */
+	r = memcmp(exported_bo_cpu, dma_contex->reference_data, DMA_SIZE);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_cpu_unmap(exported_bo.buf_handle);
+	igt_assert_eq(r, 0);
+
+	r = free_bo(exported_bo);
+	igt_assert_eq(r, 0);
+
+	r = free_bo(imported_dst_bo);
+	igt_assert_eq(r, 0);
+
+	r = free_bo(src_bo);
+	igt_assert_eq(r, 0);
+
+	return r;
+}
+
+static int
+amdgpu_cp_dma_misc(amdgpu_device_handle device_handle, unsigned int ip_type,
+				  uint32_t src_heap, uint32_t dst_heap)
+{
+	amdgpu_context_handle context_handle;
+	struct amdgpu_cp_dma_contex dma_contex = {};
+	struct amdgpu_cp_dma_ib dma_ib = {};
+	int r;
+
+	r = amdgpu_cs_ctx_create(device_handle, &context_handle);
+	igt_assert_eq(r, 0);
+	r = amdgpu_bo_alloc_and_map(device_handle, IB_SIZE, 4096,
+					AMDGPU_GEM_DOMAIN_GTT, 0,
+					&dma_ib.ib_handle, (void **)&dma_ib.ib_cpu,
+					&dma_ib.ib_mc_address, &dma_ib.ib_va_handle);
+	igt_assert_eq(r, 0);
+
+	dma_contex.reference_data = (uint8_t *)malloc(DMA_SIZE);
+	memset(dma_contex.reference_data, DMA_DATA_BYTE, DMA_SIZE);
+
+	r = amdgpu_cp_dma(device_handle, ip_type, context_handle, &dma_ib,
+					  &dma_contex, src_heap, dst_heap);
+	igt_assert_eq(r, 0);
+
+	amdgpu_cs_ctx_free(context_handle);
+	free(dma_contex.reference_data);
+	amdgpu_bo_unmap_and_free(dma_ib.ib_handle, dma_ib.ib_va_handle,
+						dma_ib.ib_mc_address, IB_SIZE);
+
+	return r;
+}
+
+static int
+amdgpu_cp_dma_misc_p2p(amdgpu_device_handle device_handle,
+					   amdgpu_device_handle exporting_device_handle,
+					   unsigned int ip_type,
+					   uint32_t src_heap, uint32_t dst_heap)
+{
+	amdgpu_context_handle context_handle;
+	struct amdgpu_cp_dma_contex dma_contex = {};
+	struct amdgpu_cp_dma_ib dma_ib = {};
+	int r;
+
+	/* create context */
+	r = amdgpu_cs_ctx_create(device_handle, &context_handle);
+	igt_assert_eq(r, 0);
+
+	/* init dma_ib */
+	r = amdgpu_bo_alloc_and_map(device_handle, IB_SIZE, 4096,
+			AMDGPU_GEM_DOMAIN_GTT, 0,
+			&dma_ib.ib_handle, (void **)&dma_ib.ib_cpu,
+			&dma_ib.ib_mc_address, &dma_ib.ib_va_handle);
+	igt_assert_eq(r, 0);
+
+	/* init dma context */
+	dma_contex.reference_data = (uint8_t *)malloc(DMA_SIZE);
+	memset(dma_contex.reference_data, DMA_DATA_BYTE, DMA_SIZE);
+
+	r = amdgpu_cp_dma_p2p(device_handle, exporting_device_handle, ip_type,
+				context_handle, src_heap, dst_heap, &dma_ib, &dma_contex);
+	igt_assert_eq(r, 0);
+
+	amdgpu_cs_ctx_free(context_handle);
+	free(dma_contex.reference_data);
+	amdgpu_bo_unmap_and_free(dma_ib.ib_handle, dma_ib.ib_va_handle,
+					dma_ib.ib_mc_address, IB_SIZE);
+
+	return r;
+}
+
+bool
+amdgpu_cp_dma_misc_is_supported(const struct amdgpu_gpu_info *gpu_info)
+{
+	//if (!(gpu_info->family_id >= AMDGPU_FAMILY_AI &&
+	//		gpu_info->family_id <= AMDGPU_FAMILY_NV)) {
+	//	return false;
+	//}
+	return true;
+}
+
+bool
+asic_is_gfx_pipe_removed(const struct amdgpu_gpu_info *gpu_info)
+{
+	int chip_id;
+
+	if (gpu_info->family_id != AMDGPU_FAMILY_AI)
+		return false;
+
+	chip_id = gpu_info->chip_external_rev - gpu_info->chip_rev;
+
+	switch (chip_id) {
+	/* Arcturus */
+	case 0x32:
+	/* Aldebaran */
+	case 0x3c:
+		return true; /* the gfx pipe is removed */
+	}
+	return false;
+}
+
+bool
+amdgpu_cp_dma_misc_p2p_is_supported(const struct amdgpu_gpu_info *gpu_info)
+{
+	bool ret = amdgpu_cp_dma_misc_is_supported(gpu_info);
+	return ret;
+}
+
+int
+amdgpu_cp_dma_generic(amdgpu_device_handle device_handle,
+			amdgpu_device_handle exporting_device_handle, unsigned int ip_type,
+			uint32_t src_heap, uint32_t dst_heap)
+{
+	int r;
+
+	if (exporting_device_handle != NULL)
+		r = amdgpu_cp_dma_misc_p2p(device_handle, exporting_device_handle,
+							ip_type, src_heap, dst_heap);
+	else
+		amdgpu_cp_dma_misc(device_handle, ip_type, src_heap, dst_heap);
+
+	return r;
+}
+
diff --git a/lib/amdgpu/amd_cp_dma.h b/lib/amdgpu/amd_cp_dma.h
new file mode 100644
index 000000000..798cea235
--- /dev/null
+++ b/lib/amdgpu/amd_cp_dma.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright 2023 Advanced Micro Devices, Inc.
+ *
+ */
+
+#ifndef __AMD_CP_DMA_H__
+#define __AMD_CP_DMA_H__
+
+int
+amdgpu_cp_dma_generic(amdgpu_device_handle device_handle,
+				amdgpu_device_handle exporting_device_handle,
+				unsigned int ip_type,
+				uint32_t src_heap, uint32_t dst_heap);
+
+bool
+amdgpu_cp_dma_misc_is_supported(const struct amdgpu_gpu_info *gpu_info);
+
+bool
+amdgpu_cp_dma_misc_p2p_is_supported(const struct amdgpu_gpu_info *gpu_info);
+
+bool
+asic_is_gfx_pipe_removed(const struct amdgpu_gpu_info *gpu_info);
+
+#endif
diff --git a/lib/meson.build b/lib/meson.build
index c79e3e952..cc7846869 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -138,7 +138,8 @@ if libdrm_amdgpu.found()
 		'amdgpu/amd_dispatch.c',
 		'amdgpu/amd_deadlock_helpers.c',
 		'amdgpu/amd_pci_unplug.c',
-		'amdgpu/xalloc.h'
+		'amdgpu/xalloc.h',
+		'amdgpu/amd_cp_dma.c'
 	]
 endif
 
-- 
2.25.1
