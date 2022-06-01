Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2041.outbound.protection.outlook.com [40.107.100.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F24410E835
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Jun 2022 15:49:53 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 1 Jun 2022 11:49:27 -0400
Message-ID: <20220601154927.4254-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/amdgpu: refactoring and update
 amd_basic tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

1. Create auxiliary directory amdgpu into igt-gpu-tools/lib
   Put all helpers and reusable functions into this directory using
   the following assumptions:
   - group memory alloc/free functions into separate file amd_memory.c and h.
   - group command submissions helper functions for GFX, COMPUTE and SDMA into
     separate file amd_command_submission.c and h.
   - for compute put nop command submission into separate file amd_compute.c and h.
   - for graphics put command submission into separate file amd_gfx.c and h.
   - for fence put command submission into separate file amd_fence.c and h.

2. Simplify implementation and reduce the number of local variables and allocations.

3. The file igt-gpu-tools/tests/amdgpu/amd_basic.c has only functions responsible
   for single sub test:
   - amdgpu_memory_alloc
   - amdgpu_userptr_test
   - amdgpu_command_submission_gfx
   - amdgpu_command_submission_compute
   - amdgpu_command_submission_multi_fence
   - amdgpu_command_submission_sdma
   - amdgpu_semaphore_test

4. No helper functions into amd_basic.c file.

5. Updated command submissions for secure buffer.

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

Reviewed-by: Christian Koenig <christian.koenig@amd.com>
Reviewed-by: Alexander Deucher <alexander.deucher@amd.com>
---
 lib/amdgpu/amd_PM4.h                |  175 ++++
 lib/amdgpu/amd_command_submission.c |  355 ++++++++
 lib/amdgpu/amd_command_submission.h |   43 +
 lib/amdgpu/amd_compute.c            |  107 +++
 lib/amdgpu/amd_compute.h            |   31 +
 lib/amdgpu/amd_family.h             |  161 ++++
 lib/amdgpu/amd_gfx.c                |  196 +++++
 lib/amdgpu/amd_gfx.h                |   35 +
 lib/amdgpu/amd_ip_blocks.c          |  555 ++++++++++++
 lib/amdgpu/amd_ip_blocks.h          |  114 +++
 lib/amdgpu/amd_memory.c             |  293 +++++++
 lib/amdgpu/amd_memory.h             |   65 ++
 lib/amdgpu/amd_sdma.h               |  102 +++
 lib/amdgpu/amdgpu_asic_addr.h       |  172 ++++
 lib/meson.build                     |   11 +
 tests/amdgpu/amd_basic.c            | 1240 +++------------------------
 16 files changed, 2527 insertions(+), 1128 deletions(-)
 create mode 100644 lib/amdgpu/amd_PM4.h
 create mode 100644 lib/amdgpu/amd_command_submission.c
 create mode 100644 lib/amdgpu/amd_command_submission.h
 create mode 100644 lib/amdgpu/amd_compute.c
 create mode 100644 lib/amdgpu/amd_compute.h
 create mode 100644 lib/amdgpu/amd_family.h
 create mode 100644 lib/amdgpu/amd_gfx.c
 create mode 100644 lib/amdgpu/amd_gfx.h
 create mode 100644 lib/amdgpu/amd_ip_blocks.c
 create mode 100644 lib/amdgpu/amd_ip_blocks.h
 create mode 100644 lib/amdgpu/amd_memory.c
 create mode 100644 lib/amdgpu/amd_memory.h
 create mode 100644 lib/amdgpu/amd_sdma.h
 create mode 100644 lib/amdgpu/amdgpu_asic_addr.h

diff --git a/lib/amdgpu/amd_PM4.h b/lib/amdgpu/amd_PM4.h
new file mode 100644
index 00000000..7de115c8
--- /dev/null
+++ b/lib/amdgpu/amd_PM4.h
@@ -0,0 +1,175 @@
+/*
+ * Copyright 2014 Advanced Micro Devices, Inc.
+ * Copyright 2022 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ *
+ */
+
+#ifndef AMD_PM4_H
+#define AMD_PM4_H
+
+/* PM4 */
+#define	PACKET_TYPE0	0
+#define	PACKET_TYPE1	1
+#define	PACKET_TYPE2	2
+#define	PACKET_TYPE3	3
+
+#define CP_PACKET_GET_TYPE(h) (((h) >> 30) & 3)
+#define CP_PACKET_GET_COUNT(h) (((h) >> 16) & 0x3FFF)
+#define CP_PACKET0_GET_REG(h) ((h) & 0xFFFF)
+#define CP_PACKET3_GET_OPCODE(h) (((h) >> 8) & 0xFF)
+#define PACKET0(reg, n)	((PACKET_TYPE0 << 30) |				\
+			 ((reg) & 0xFFFF) |			\
+			 ((n) & 0x3FFF) << 16)
+#define CP_PACKET2			0x80000000
+#define		PACKET2_PAD_SHIFT		0
+#define		PACKET2_PAD_MASK		(0x3fffffff << 0)
+
+#define PACKET2(v)	(CP_PACKET2 | REG_SET(PACKET2_PAD, (v)))
+
+#define PACKET3(op, n)	((PACKET_TYPE3 << 30) |				\
+			 (((op) & 0xFF) << 8) |				\
+			 ((n) & 0x3FFF) << 16)
+
+/* Packet 3 types */
+#define	PACKET3_NOP					0x10
+
+#define	PACKET3_WRITE_DATA				0x37
+#define		WRITE_DATA_DST_SEL(x)                   ((x) << 8)
+		/* 0 - register
+		 * 1 - memory (sync - via GRBM)
+		 * 2 - gl2
+		 * 3 - gds
+		 * 4 - reserved
+		 * 5 - memory (async - direct)
+		 */
+#define		WR_ONE_ADDR                             (1 << 16)
+#define		WR_CONFIRM                              (1 << 20)
+#define		WRITE_DATA_CACHE_POLICY(x)              ((x) << 25)
+		/* 0 - LRU
+		 * 1 - Stream
+		 */
+#define		WRITE_DATA_ENGINE_SEL(x)                ((x) << 30)
+		/* 0 - me
+		 * 1 - pfp
+		 * 2 - ce
+		 */
+
+#define	PACKET3_DMA_DATA				0x50
+/* 1. header
+ * 2. CONTROL
+ * 3. SRC_ADDR_LO or DATA [31:0]
+ * 4. SRC_ADDR_HI [31:0]
+ * 5. DST_ADDR_LO [31:0]
+ * 6. DST_ADDR_HI [7:0]
+ * 7. COMMAND [30:21] | BYTE_COUNT [20:0]
+ */
+/* CONTROL */
+#              define PACKET3_DMA_DATA_ENGINE(x)     ((x) << 0)
+		/* 0 - ME
+		 * 1 - PFP
+		 */
+#              define PACKET3_DMA_DATA_SRC_CACHE_POLICY(x) ((x) << 13)
+		/* 0 - LRU
+		 * 1 - Stream
+		 * 2 - Bypass
+		 */
+#              define PACKET3_DMA_DATA_SRC_VOLATILE (1 << 15)
+#              define PACKET3_DMA_DATA_DST_SEL(x)  ((x) << 20)
+		/* 0 - DST_ADDR using DAS
+		 * 1 - GDS
+		 * 3 - DST_ADDR using L2
+		 */
+#              define PACKET3_DMA_DATA_DST_CACHE_POLICY(x) ((x) << 25)
+		/* 0 - LRU
+		 * 1 - Stream
+		 * 2 - Bypass
+		 */
+#              define PACKET3_DMA_DATA_DST_VOLATILE (1 << 27)
+#              define PACKET3_DMA_DATA_SRC_SEL(x)  ((x) << 29)
+		/* 0 - SRC_ADDR using SAS
+		 * 1 - GDS
+		 * 2 - DATA
+		 * 3 - SRC_ADDR using L2
+		 */
+#              define PACKET3_DMA_DATA_CP_SYNC     (1 << 31)
+/* COMMAND */
+#              define PACKET3_DMA_DATA_DIS_WC      (1 << 21)
+#              define PACKET3_DMA_DATA_CMD_SRC_SWAP(x) ((x) << 22)
+		/* 0 - none
+		 * 1 - 8 in 16
+		 * 2 - 8 in 32
+		 * 3 - 8 in 64
+		 */
+#              define PACKET3_DMA_DATA_CMD_DST_SWAP(x) ((x) << 24)
+		/* 0 - none
+		 * 1 - 8 in 16
+		 * 2 - 8 in 32
+		 * 3 - 8 in 64
+		 */
+#              define PACKET3_DMA_DATA_CMD_SAS     (1 << 26)
+		/* 0 - memory
+		 * 1 - register
+		 */
+#              define PACKET3_DMA_DATA_CMD_DAS     (1 << 27)
+		/* 0 - memory
+		 * 1 - register
+		 */
+#              define PACKET3_DMA_DATA_CMD_SAIC    (1 << 28)
+#              define PACKET3_DMA_DATA_CMD_DAIC    (1 << 29)
+#              define PACKET3_DMA_DATA_CMD_RAW_WAIT  (1 << 30)
+
+
+#define	PACKET3_ATOMIC_MEM				0x1E
+#define     TC_OP_ATOMIC_CMPSWAP_RTN_32          0x00000008
+#define     ATOMIC_MEM_COMMAND(x)               ((x) << 8)
+            /* 0 - single_pass_atomic.
+             * 1 - loop_until_compare_satisfied.
+             */
+#define     ATOMIC_MEM_CACHEPOLICAY(x)          ((x) << 25)
+            /* 0 - lru.
+             * 1 - stream.
+             */
+#define     ATOMIC_MEM_ENGINESEL(x)             ((x) << 30)
+            /* 0 - micro_engine.*/
+
+
+
+#define PKT3_CONTEXT_CONTROL                   0x28
+#define     CONTEXT_CONTROL_LOAD_ENABLE(x)     (((unsigned)(x) & 0x1) << 31)
+#define     CONTEXT_CONTROL_LOAD_CE_RAM(x)     (((unsigned)(x) & 0x1) << 28)
+#define     CONTEXT_CONTROL_SHADOW_ENABLE(x)   (((unsigned)(x) & 0x1) << 31)
+
+#define PKT3_CLEAR_STATE                       0x12
+
+#define PKT3_SET_SH_REG                        0x76
+#define		PACKET3_SET_SH_REG_START			0x00002c00
+
+#define PKT3_SET_SH_REG_INDEX			0x9B
+
+#define	PACKET3_DISPATCH_DIRECT				0x15
+#define PACKET3_EVENT_WRITE				0x46
+#define PACKET3_ACQUIRE_MEM				0x58
+#define PACKET3_SET_CONTEXT_REG				0x69
+#define PACKET3_SET_UCONFIG_REG				0x79
+#define PACKET3_DRAW_INDEX_AUTO				0x2D
+
+#endif
diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
new file mode 100644
index 00000000..4dc4df95
--- /dev/null
+++ b/lib/amdgpu/amd_command_submission.c
@@ -0,0 +1,355 @@
+/*
+ * Copyright 2014 Advanced Micro Devices, Inc.
+ * Copyright 2022 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ *
+ */
+#include "lib/amdgpu/amd_memory.h"
+#include "lib/amdgpu/amd_sdma.h"
+#include "lib/amdgpu/amd_PM4.h"
+#include "lib/amdgpu/amd_command_submission.h"
+
+/*
+ *
+ * Caller need create/release:
+ * pm4_src, resources, ib_info, and ibs_request
+ * submit command stream described in ibs_request and wait for this IB accomplished
+ */
+
+void amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned ip_type,
+				struct amdgpu_ring_context *ring_context)
+{
+	int r;
+	uint32_t expired;
+	uint32_t *ring_ptr;
+	amdgpu_bo_handle ib_result_handle;
+	void *ib_result_cpu;
+	uint64_t ib_result_mc_address;
+	struct amdgpu_cs_fence fence_status = {0};
+	amdgpu_va_handle va_handle;
+
+	amdgpu_bo_handle *all_res = alloca(sizeof(ring_context->resources[0]) * (ring_context->res_cnt + 1));
+
+
+	/* prepare CS */
+	igt_assert(ring_context->pm4_dw <= 1024);
+
+	/* allocate IB */
+	r = amdgpu_bo_alloc_and_map(device, 4096, 4096,
+				    AMDGPU_GEM_DOMAIN_GTT, 0,
+				    &ib_result_handle, &ib_result_cpu,
+				    &ib_result_mc_address, &va_handle);
+	igt_assert_eq(r, 0);
+
+	/* copy PM4 packet to ring from caller */
+	ring_ptr = ib_result_cpu;
+	memcpy(ring_ptr, ring_context->pm4, ring_context->pm4_dw * sizeof(*ring_context->pm4));
+
+	ring_context->ib_info.ib_mc_address = ib_result_mc_address;
+	ring_context->ib_info.size = ring_context->pm4_dw;
+	if (ring_context->secure)
+		ring_context->ib_info.flags |= AMDGPU_IB_FLAGS_SECURE;
+
+	ring_context->ibs_request.ip_type = ip_type;
+	ring_context->ibs_request.ring = ring_context->ring_id;
+	ring_context->ibs_request.number_of_ibs = 1;
+	ring_context->ibs_request.ibs = &ring_context->ib_info;
+	ring_context->ibs_request.fence_info.handle = NULL;
+
+	memcpy(all_res, ring_context->resources, sizeof(ring_context->resources[0]) * ring_context->res_cnt);
+	all_res[ring_context->res_cnt] = ib_result_handle;
+
+	r = amdgpu_bo_list_create(device, ring_context->res_cnt+1, all_res,
+				  NULL, &ring_context->ibs_request.resources);
+	igt_assert_eq(r, 0);
+
+	/* submit CS */
+	r = amdgpu_cs_submit(ring_context->context_handle, 0, &ring_context->ibs_request, 1);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_list_destroy(ring_context->ibs_request.resources);
+	igt_assert_eq(r, 0);
+
+	fence_status.ip_type = ip_type;
+	fence_status.ip_instance = 0;
+	fence_status.ring = ring_context->ibs_request.ring;
+	fence_status.context = ring_context->context_handle;
+	fence_status.fence = ring_context->ibs_request.seq_no;
+
+	/* wait for IB accomplished */
+	r = amdgpu_cs_query_fence_status(&fence_status,
+					 AMDGPU_TIMEOUT_INFINITE,
+					 0, &expired);
+	igt_assert_eq(r, 0);
+	igt_assert_eq(expired, true);
+
+	amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
+				 ib_result_mc_address, 4096);
+}
+
+void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
+						   const struct amdgpu_ip_block_version *ip_block,
+						   bool secure)
+
+{
+
+	const int sdma_write_length = 128;
+	const int pm4_dw = 256;
+
+	struct amdgpu_ring_context *ring_context;
+	int i, r, loop, ring_id;
+
+	uint64_t gtt_flags[2] = {0, AMDGPU_GEM_CREATE_CPU_GTT_USWC};
+
+	ring_context = calloc(1, sizeof(*ring_context));
+	igt_assert(ring_context);
+	/* setup parameters */
+	ring_context->write_length =  sdma_write_length;
+	ring_context->pm4 = calloc(pm4_dw, sizeof(*ring_context->pm4));
+	ring_context->secure = secure;
+	ring_context->pm4_size = pm4_dw;
+	ring_context->res_cnt = 1;
+	igt_assert(ring_context->pm4);
+
+	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &ring_context->hw_ip_info);
+	igt_assert_eq(r, 0);
+
+	for (i = 0; secure && (i < 2); i++)
+		gtt_flags[i] |= AMDGPU_GEM_CREATE_ENCRYPTED;
+
+	r = amdgpu_cs_ctx_create(device, &ring_context->context_handle);
+
+	igt_assert_eq(r, 0);
+
+	for (ring_id = 0; (1 << ring_id) & ring_context->hw_ip_info.available_rings; ring_id++) {
+		loop = 0;
+		while(loop < 2) {
+			/* allocate UC bo for sDMA use */
+			r = amdgpu_bo_alloc_and_map(device,
+						    ring_context->write_length * sizeof(uint32_t),
+						    4096, AMDGPU_GEM_DOMAIN_GTT,
+						    gtt_flags[loop], &ring_context->bo,
+						    (void**)&ring_context->bo_cpu,
+						    &ring_context->bo_mc,
+						    &ring_context->va_handle);
+			igt_assert_eq(r, 0);
+
+			/* clear bo */
+			memset((void*)ring_context->bo_cpu, 0, ring_context->write_length * sizeof(uint32_t));
+
+			ring_context->resources[0] = ring_context->bo;
+
+			ip_block->funcs->write_linear(ip_block->funcs, ring_context, &ring_context->pm4_dw);
+
+			ring_context->ring_id = ring_id;
+
+			 amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context);
+
+			/* verify if SDMA test result meets with expected */
+			i = 0;
+			if (!secure) {
+				r = ip_block->funcs->compare(ip_block->funcs, ring_context, 1);
+				igt_assert_eq(r, 0);
+			} else if (ip_block->type == AMDGPU_HW_IP_GFX) {
+				ip_block->funcs->write_linear(ip_block->funcs, ring_context, &ring_context->pm4_dw);
+
+				amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context);
+
+			} else if (ip_block->type == AMDGPU_HW_IP_DMA) {
+				/* restore the bo_cpu to compare */
+				ring_context->bo_cpu_origin = ring_context->bo_cpu[0];
+				ip_block->funcs->write_linear(ip_block->funcs, ring_context, &ring_context->pm4_dw);
+
+				amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context);
+
+				/* restore again, here dest_data should be */
+				ring_context->bo_cpu_origin = ring_context->bo_cpu[0];
+				ip_block->funcs->write_linear(ip_block->funcs, ring_context, &ring_context->pm4_dw);
+
+				amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context);
+				/* here bo_cpu[0] should be unchanged, still is 0x12345678, otherwise failed*/
+				igt_assert_eq(ring_context->bo_cpu[0], ring_context->bo_cpu_origin);
+			}
+
+			amdgpu_bo_unmap_and_free(ring_context->bo, ring_context->va_handle, ring_context->bo_mc,
+						 ring_context->write_length * sizeof(uint32_t));
+			loop++;
+		}
+	}
+	/* clean resources */
+	free(ring_context->pm4);
+	free(ring_context);
+	/* end of test */
+	r = amdgpu_cs_ctx_free(ring_context->context_handle);
+	igt_assert_eq(r, 0);
+}
+
+
+/**
+ *
+ * @param device
+ * @param ip_type
+ */
+void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
+						 const struct amdgpu_ip_block_version *ip_block)
+{
+	const int sdma_write_length = 1024 * 1024;
+	const int pm4_dw = 256;
+
+	struct amdgpu_ring_context *ring_context;
+	int r, loop;
+
+	uint64_t gtt_flags[2] = {0, AMDGPU_GEM_CREATE_CPU_GTT_USWC};
+
+	ring_context = calloc(1, sizeof(*ring_context));
+	ring_context->write_length =  sdma_write_length;
+	ring_context->pm4 = calloc(pm4_dw, sizeof(*ring_context->pm4));
+	ring_context->secure = false;
+	ring_context->pm4_size = pm4_dw;
+	ring_context->res_cnt = 1;
+	igt_assert(ring_context->pm4);
+
+	r = amdgpu_cs_ctx_create(device, &ring_context->context_handle);
+	igt_assert_eq(r, 0);
+
+	/* prepare resource */
+	loop = 0;
+	while(loop < 2) {
+		/* allocate UC bo for sDMA use */
+		r = amdgpu_bo_alloc_and_map(device,
+					    ring_context->write_length, 4096,
+					    AMDGPU_GEM_DOMAIN_GTT,
+					    gtt_flags[loop], &ring_context->bo, (void**)&ring_context->bo_cpu,
+					    &ring_context->bo_mc, &ring_context->va_handle);
+		igt_assert_eq(r, 0);
+
+		/* clear bo */
+		memset((void*)ring_context->bo_cpu, 0, ring_context->write_length);
+
+		ring_context->resources[0] = ring_context->bo;
+
+		/* fulfill PM4: test DMA const fill */
+		ip_block->funcs->const_fill(ip_block->funcs, ring_context, &ring_context->pm4_dw);
+
+		amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context);
+
+		/* verify if SDMA test result meets with expected */
+		r = ip_block->funcs->compare(ip_block->funcs, ring_context, 4);
+		igt_assert_eq(r, 0);
+
+		amdgpu_bo_unmap_and_free(ring_context->bo, ring_context->va_handle, ring_context->bo_mc,
+					 ring_context->write_length);
+		loop++;
+	}
+	/* clean resources */
+	free(ring_context->pm4);
+
+	/* end of test */
+	r = amdgpu_cs_ctx_free(ring_context->context_handle);
+	igt_assert_eq(r, 0);
+	free(ring_context);
+}
+
+/**
+ *
+ * @param device
+ * @param ip_type
+ */
+void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
+						  const struct amdgpu_ip_block_version *ip_block)
+{
+	const int sdma_write_length = 1024;
+	const int pm4_dw = 256;
+
+	struct amdgpu_ring_context *ring_context;
+	int r, loop1, loop2;
+
+	uint64_t gtt_flags[2] = {0, AMDGPU_GEM_CREATE_CPU_GTT_USWC};
+
+
+	ring_context = calloc(1, sizeof(*ring_context));
+	ring_context->write_length =  sdma_write_length;
+	ring_context->pm4 = calloc(pm4_dw, sizeof(*ring_context->pm4));
+	ring_context->secure = false;
+	ring_context->pm4_size = pm4_dw;
+	ring_context->res_cnt = 2;
+	igt_assert(ring_context->pm4);
+
+
+	r = amdgpu_cs_ctx_create(device, &ring_context->context_handle);
+	igt_assert_eq(r, 0);
+
+
+	loop1 = loop2 = 0;
+	/* run 9 circle to test all mapping combination */
+	while(loop1 < 2) {
+		while(loop2 < 2) {
+			/* allocate UC bo1for sDMA use */
+			r = amdgpu_bo_alloc_and_map(device,
+						    ring_context->write_length, 4096,
+						    AMDGPU_GEM_DOMAIN_GTT,
+						    gtt_flags[loop1], &ring_context->bo,
+						    (void**)&ring_context->bo_cpu, &ring_context->bo_mc,
+						    &ring_context->va_handle);
+			igt_assert_eq(r, 0);
+
+			/* set bo_cpu */
+			memset((void*)ring_context->bo_cpu, ip_block->funcs->pattern, ring_context->write_length);
+
+			/* allocate UC bo2 for sDMA use */
+			r = amdgpu_bo_alloc_and_map(device,
+						    ring_context->write_length, 4096,
+						    AMDGPU_GEM_DOMAIN_GTT,
+						    gtt_flags[loop2], &ring_context->bo2,
+						    (void**)&ring_context->bo2_cpu, &ring_context->bo_mc2,
+						    &ring_context->va_handle2);
+			igt_assert_eq(r, 0);
+
+			/* clear bo2_cpu */
+			memset((void*)ring_context->bo2_cpu, 0, ring_context->write_length);
+
+			ring_context->resources[0] = ring_context->bo;
+			ring_context->resources[1] = ring_context->bo2;
+
+			ip_block->funcs->copy_linear(ip_block->funcs, ring_context, &ring_context->pm4_dw);
+
+			amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context);
+
+			/* verify if SDMA test result meets with expected */
+			r = ip_block->funcs->compare_pattern(ip_block->funcs, ring_context, 4);
+			igt_assert_eq(r, 0);
+
+			amdgpu_bo_unmap_and_free(ring_context->bo, ring_context->va_handle, ring_context->bo_mc,
+						 ring_context->write_length);
+			amdgpu_bo_unmap_and_free(ring_context->bo2, ring_context->va_handle2, ring_context->bo_mc2,
+						 ring_context->write_length);
+			loop2++;
+		}
+		loop1++;
+	}
+	/* clean resources */
+	free(ring_context->pm4);
+
+	/* end of test */
+	r = amdgpu_cs_ctx_free(ring_context->context_handle);
+	igt_assert_eq(r, 0);
+	free(ring_context);
+}
diff --git a/lib/amdgpu/amd_command_submission.h b/lib/amdgpu/amd_command_submission.h
new file mode 100644
index 00000000..0df7c2c1
--- /dev/null
+++ b/lib/amdgpu/amd_command_submission.h
@@ -0,0 +1,43 @@
+/*
+ * Copyright 2012 Advanced Micro Devices, Inc.
+ * Copyright 2022 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ *
+ */
+
+#ifndef AMD_COMMAND_SUBMISSION
+#define AMD_COMMAND_SUBMISSION
+
+#include "amd_ip_blocks.h"
+
+void amdgpu_test_exec_cs_helper(amdgpu_device_handle device,
+				unsigned ip_type, struct amdgpu_ring_context *ring_context);
+
+void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
+						   const struct amdgpu_ip_block_version *ip_block,
+						   bool secure);
+
+void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
+						 const struct amdgpu_ip_block_version *ip_block);
+
+void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
+						 const struct amdgpu_ip_block_version *ip_block);
+#endif
diff --git a/lib/amdgpu/amd_compute.c b/lib/amdgpu/amd_compute.c
new file mode 100644
index 00000000..5a7fa27e
--- /dev/null
+++ b/lib/amdgpu/amd_compute.c
@@ -0,0 +1,107 @@
+/*
+ * Copyright 2014 Advanced Micro Devices, Inc.
+ * Copyright 2022 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ *
+ */
+#include "amd_PM4.h"
+#include "amd_memory.h"
+#include "amd_compute.h"
+
+/**
+ *
+ * @param device
+ */
+void amdgpu_command_submission_compute_nop(amdgpu_device_handle device)
+{
+	amdgpu_context_handle context_handle;
+	amdgpu_bo_handle ib_result_handle;
+	void *ib_result_cpu;
+	uint64_t ib_result_mc_address;
+	struct amdgpu_cs_request ibs_request;
+	struct amdgpu_cs_ib_info ib_info;
+	struct amdgpu_cs_fence fence_status;
+	struct drm_amdgpu_info_hw_ip info;
+	uint32_t *ptr;
+	uint32_t expired;
+	int r, instance;
+	amdgpu_bo_list_handle bo_list;
+	amdgpu_va_handle va_handle;
+
+	r = amdgpu_query_hw_ip_info(device, AMDGPU_HW_IP_COMPUTE, 0, &info);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_cs_ctx_create(device, &context_handle);
+	igt_assert_eq(r, 0);
+
+	for (instance = 0; info.available_rings & (1 << instance); instance++) {
+		r = amdgpu_bo_alloc_and_map(device, 4096, 4096,
+					    AMDGPU_GEM_DOMAIN_GTT, 0,
+					    &ib_result_handle, &ib_result_cpu,
+					    &ib_result_mc_address, &va_handle);
+		igt_assert_eq(r, 0);
+
+		r = amdgpu_get_bo_list(device, ib_result_handle, NULL,
+				       &bo_list);
+		igt_assert_eq(r, 0);
+
+		ptr = ib_result_cpu;
+		memset(ptr, 0, 16);
+		ptr[0] = PACKET3(PACKET3_NOP, 14);
+
+		memset(&ib_info, 0, sizeof(struct amdgpu_cs_ib_info));
+		ib_info.ib_mc_address = ib_result_mc_address;
+		ib_info.size = 16;
+
+		memset(&ibs_request, 0, sizeof(struct amdgpu_cs_request));
+		ibs_request.ip_type = AMDGPU_HW_IP_COMPUTE;
+		ibs_request.ring = instance;
+		ibs_request.number_of_ibs = 1;
+		ibs_request.ibs = &ib_info;
+		ibs_request.resources = bo_list;
+		ibs_request.fence_info.handle = NULL;
+
+		memset(&fence_status, 0, sizeof(struct amdgpu_cs_fence));
+		r = amdgpu_cs_submit(context_handle, 0,&ibs_request, 1);
+		igt_assert_eq(r, 0);
+
+		fence_status.context = context_handle;
+		fence_status.ip_type = AMDGPU_HW_IP_COMPUTE;
+		fence_status.ip_instance = 0;
+		fence_status.ring = instance;
+		fence_status.fence = ibs_request.seq_no;
+
+		r = amdgpu_cs_query_fence_status(&fence_status,
+						 AMDGPU_TIMEOUT_INFINITE,
+						 0, &expired);
+		igt_assert_eq(r, 0);
+
+		r = amdgpu_bo_list_destroy(bo_list);
+		igt_assert_eq(r, 0);
+
+		amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
+					 ib_result_mc_address, 4096);
+	}
+
+	r = amdgpu_cs_ctx_free(context_handle);
+	igt_assert_eq(r, 0);
+}
+
diff --git a/lib/amdgpu/amd_compute.h b/lib/amdgpu/amd_compute.h
new file mode 100644
index 00000000..01eee606
--- /dev/null
+++ b/lib/amdgpu/amd_compute.h
@@ -0,0 +1,31 @@
+/*
+ * Copyright 2014 Advanced Micro Devices, Inc.
+ * Copyright 2022 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ *
+ */
+#ifndef AMD_COMPUTE_H
+#define AMD_COMPUTE_H
+
+
+void amdgpu_command_submission_compute_nop(amdgpu_device_handle device);
+
+#endif
diff --git a/lib/amdgpu/amd_family.h b/lib/amdgpu/amd_family.h
new file mode 100644
index 00000000..20682483
--- /dev/null
+++ b/lib/amdgpu/amd_family.h
@@ -0,0 +1,161 @@
+/*
+ * Copyright 2008 Corbin Simpson <MostAwesomeDude@gmail.com>
+ * Copyright 2010 Marek Olšák <maraeo@gmail.com>
+ * Copyright 2022 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * on the rights to use, copy, modify, merge, publish, distribute, sub
+ * license, and/or sell copies of the Software, and to permit persons to whom
+ * the Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHOR(S) AND/OR THEIR SUPPLIERS BE LIABLE FOR ANY CLAIM,
+ * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
+ * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
+ * USE OR OTHER DEALINGS IN THE SOFTWARE. */
+
+#ifndef AMD_FAMILY_H
+#define AMD_FAMILY_H
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+enum radeon_family
+{
+   CHIP_UNKNOWN = 0,
+   CHIP_R300, /* R3xx-based cores. (GFX2) */
+   CHIP_R350,
+   CHIP_RV350,
+   CHIP_RV370,
+   CHIP_RV380,
+   CHIP_RS400,
+   CHIP_RC410,
+   CHIP_RS480,
+   CHIP_R420, /* R4xx-based cores. (GFX2) */
+   CHIP_R423,
+   CHIP_R430,
+   CHIP_R480,
+   CHIP_R481,
+   CHIP_RV410,
+   CHIP_RS600,
+   CHIP_RS690,
+   CHIP_RS740,
+   CHIP_RV515, /* R5xx-based cores. (GFX2) */
+   CHIP_R520,
+   CHIP_RV530,
+   CHIP_R580,
+   CHIP_RV560,
+   CHIP_RV570,
+   CHIP_R600, /* GFX3 (R6xx) */
+   CHIP_RV610,
+   CHIP_RV630,
+   CHIP_RV670,
+   CHIP_RV620,
+   CHIP_RV635,
+   CHIP_RS780,
+   CHIP_RS880,
+   CHIP_RV770, /* GFX3 (R7xx) */
+   CHIP_RV730,
+   CHIP_RV710,
+   CHIP_RV740,
+   CHIP_CEDAR, /* GFX4 (Evergreen) */
+   CHIP_REDWOOD,
+   CHIP_JUNIPER,
+   CHIP_CYPRESS,
+   CHIP_HEMLOCK,
+   CHIP_PALM,
+   CHIP_SUMO,
+   CHIP_SUMO2,
+   CHIP_BARTS,
+   CHIP_TURKS,
+   CHIP_CAICOS,
+   CHIP_CAYMAN, /* GFX5 (Northern Islands) */
+   CHIP_ARUBA,
+   CHIP_TAHITI, /* GFX6 (Southern Islands) */
+   CHIP_PITCAIRN,
+   CHIP_VERDE,
+   CHIP_OLAND,
+   CHIP_HAINAN,
+   CHIP_BONAIRE, /* GFX7 (Sea Islands) */
+   CHIP_KAVERI,
+   CHIP_KABINI,
+   CHIP_HAWAII,
+   CHIP_TONGA, /* GFX8 (Volcanic Islands & Polaris) */
+   CHIP_ICELAND,
+   CHIP_CARRIZO,
+   CHIP_FIJI,
+   CHIP_STONEY,
+   CHIP_POLARIS10,
+   CHIP_POLARIS11,
+   CHIP_POLARIS12,
+   CHIP_VEGAM,
+   CHIP_VEGA10, /* GFX9 (Vega) */
+   CHIP_VEGA12,
+   CHIP_VEGA20,
+   CHIP_RAVEN,
+   CHIP_RAVEN2,
+   CHIP_RENOIR,
+   CHIP_ARCTURUS,
+   CHIP_ALDEBARAN,
+   CHIP_NAVI10,
+   CHIP_NAVI12,
+   CHIP_NAVI14,
+   CHIP_SIENNA_CICHLID,
+   CHIP_NAVY_FLOUNDER,
+   CHIP_VANGOGH,
+   CHIP_DIMGREY_CAVEFISH,
+   CHIP_BEIGE_GOBY,
+   CHIP_YELLOW_CARP,
+   CHIP_LAST,
+};
+
+enum chip_class
+{
+   CLASS_UNKNOWN = 0,
+   R300,
+   R400,
+   R500,
+   R600,
+   R700,
+   EVERGREEN,
+   CAYMAN,
+   GFX6,
+   GFX7,
+   GFX8,
+   GFX9,
+   GFX10,
+   GFX10_3,
+
+   NUM_GFX_VERSIONS,
+};
+
+enum ring_type
+{
+   RING_GFX = 0,
+   RING_COMPUTE,
+   RING_DMA,
+   RING_UVD,
+   RING_VCE,
+   RING_UVD_ENC,
+   RING_VCN_DEC,
+   RING_VCN_ENC,
+   RING_VCN_JPEG,
+   NUM_RING_TYPES,
+};
+
+const char *ac_get_family_name(enum radeon_family family);
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif
diff --git a/lib/amdgpu/amd_gfx.c b/lib/amdgpu/amd_gfx.c
new file mode 100644
index 00000000..a89ff753
--- /dev/null
+++ b/lib/amdgpu/amd_gfx.c
@@ -0,0 +1,196 @@
+/*
+ * Copyright 2014 Advanced Micro Devices, Inc.
+ * Copyright 2022 Advanced Micro Devices, Inc.
+ *  *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ *
+ */
+
+#include "amd_memory.h"
+#include "amd_gfx.h"
+
+/**
+ *
+ * @param device
+ */
+void amdgpu_command_submission_gfx_separate_ibs(amdgpu_device_handle device)
+{
+	amdgpu_context_handle context_handle;
+	amdgpu_bo_handle ib_result_handle, ib_result_ce_handle;
+	void *ib_result_cpu, *ib_result_ce_cpu;
+	uint64_t ib_result_mc_address, ib_result_ce_mc_address;
+	struct amdgpu_cs_request ibs_request = {0};
+	struct amdgpu_cs_ib_info ib_info[2];
+	struct amdgpu_cs_fence fence_status = {0};
+	uint32_t *ptr;
+	uint32_t expired;
+	amdgpu_bo_list_handle bo_list;
+	amdgpu_va_handle va_handle, va_handle_ce;
+	int r;
+
+	r = amdgpu_cs_ctx_create(device, &context_handle);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_alloc_and_map(device, 4096, 4096,
+				    AMDGPU_GEM_DOMAIN_GTT, 0,
+				    &ib_result_handle, &ib_result_cpu,
+				    &ib_result_mc_address, &va_handle);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_alloc_and_map(device, 4096, 4096,
+				    AMDGPU_GEM_DOMAIN_GTT, 0,
+				    &ib_result_ce_handle, &ib_result_ce_cpu,
+				    &ib_result_ce_mc_address, &va_handle_ce);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_get_bo_list(device, ib_result_handle,
+			       ib_result_ce_handle, &bo_list);
+	igt_assert_eq(r, 0);
+
+	memset(ib_info, 0, 2 * sizeof(struct amdgpu_cs_ib_info));
+
+	/* IT_SET_CE_DE_COUNTERS */
+	ptr = ib_result_ce_cpu;
+	ptr[0] = 0xc0008900;
+	ptr[1] = 0;
+	ptr[2] = 0xc0008400;
+	ptr[3] = 1;
+	ib_info[0].ib_mc_address = ib_result_ce_mc_address;
+	ib_info[0].size = 4;
+	ib_info[0].flags = AMDGPU_IB_FLAG_CE;
+
+	/* IT_WAIT_ON_CE_COUNTER */
+	ptr = ib_result_cpu;
+	ptr[0] = 0xc0008600;
+	ptr[1] = 0x00000001;
+	ib_info[1].ib_mc_address = ib_result_mc_address;
+	ib_info[1].size = 2;
+
+	ibs_request.ip_type = AMDGPU_HW_IP_GFX;
+	ibs_request.number_of_ibs = 2;
+	ibs_request.ibs = ib_info;
+	ibs_request.resources = bo_list;
+	ibs_request.fence_info.handle = NULL;
+
+	r = amdgpu_cs_submit(context_handle, 0,&ibs_request, 1);
+
+	igt_assert_eq(r, 0);
+
+	fence_status.context = context_handle;
+	fence_status.ip_type = AMDGPU_HW_IP_GFX;
+	fence_status.ip_instance = 0;
+	fence_status.fence = ibs_request.seq_no;
+
+	r = amdgpu_cs_query_fence_status(&fence_status,
+					 AMDGPU_TIMEOUT_INFINITE,
+					 0, &expired);
+	igt_assert_eq(r, 0);
+
+	amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
+				 ib_result_mc_address, 4096);
+	amdgpu_bo_unmap_and_free(ib_result_ce_handle, va_handle_ce,
+				 ib_result_ce_mc_address, 4096);
+
+	r = amdgpu_bo_list_destroy(bo_list);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_cs_ctx_free(context_handle);
+	igt_assert_eq(r, 0);
+}
+
+/**
+ *
+ * @param device
+ */
+void amdgpu_command_submission_gfx_shared_ib(amdgpu_device_handle device)
+{
+	amdgpu_context_handle context_handle;
+	amdgpu_bo_handle ib_result_handle;
+	void *ib_result_cpu;
+	uint64_t ib_result_mc_address;
+	struct amdgpu_cs_request ibs_request = {0};
+	struct amdgpu_cs_ib_info ib_info[2];
+	struct amdgpu_cs_fence fence_status = {0};
+	uint32_t *ptr;
+	uint32_t expired;
+	amdgpu_bo_list_handle bo_list;
+	amdgpu_va_handle va_handle;
+	int r;
+
+	r = amdgpu_cs_ctx_create(device, &context_handle);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_alloc_and_map(device, 4096, 4096,
+				    AMDGPU_GEM_DOMAIN_GTT, 0,
+				    &ib_result_handle, &ib_result_cpu,
+				    &ib_result_mc_address, &va_handle);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_get_bo_list(device, ib_result_handle, NULL,
+			       &bo_list);
+	igt_assert_eq(r, 0);
+	r = sizeof(ib_info);
+	memset(ib_info, 0, 2 * sizeof(struct amdgpu_cs_ib_info));
+
+	/* IT_SET_CE_DE_COUNTERS */
+	ptr = ib_result_cpu;
+	ptr[0] = 0xc0008900;
+	ptr[1] = 0;
+	ptr[2] = 0xc0008400;
+	ptr[3] = 1;
+	ib_info[0].ib_mc_address = ib_result_mc_address;
+	ib_info[0].size = 4;
+	ib_info[0].flags = AMDGPU_IB_FLAG_CE;
+
+	ptr = (uint32_t *)ib_result_cpu + 4;
+	ptr[0] = 0xc0008600;
+	ptr[1] = 0x00000001;
+	ib_info[1].ib_mc_address = ib_result_mc_address + 16;
+	ib_info[1].size = 2;
+
+	ibs_request.ip_type = AMDGPU_HW_IP_GFX;
+	ibs_request.number_of_ibs = 2;
+	ibs_request.ibs = ib_info;
+	ibs_request.resources = bo_list;
+	ibs_request.fence_info.handle = NULL;
+
+	r = amdgpu_cs_submit(context_handle, 0, &ibs_request, 1);
+
+	igt_assert_eq(r, 0);
+
+	fence_status.context = context_handle;
+	fence_status.ip_type = AMDGPU_HW_IP_GFX;
+	fence_status.ip_instance = 0;
+	fence_status.fence = ibs_request.seq_no;
+
+	r = amdgpu_cs_query_fence_status(&fence_status,
+					 AMDGPU_TIMEOUT_INFINITE,
+					 0, &expired);
+	igt_assert_eq(r, 0);
+
+	amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
+				 ib_result_mc_address, 4096);
+
+	r = amdgpu_bo_list_destroy(bo_list);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_cs_ctx_free(context_handle);
+	igt_assert_eq(r, 0);
+}
diff --git a/lib/amdgpu/amd_gfx.h b/lib/amdgpu/amd_gfx.h
new file mode 100644
index 00000000..d9da8594
--- /dev/null
+++ b/lib/amdgpu/amd_gfx.h
@@ -0,0 +1,35 @@
+/*
+ * Copyright 2014 Advanced Micro Devices, Inc.
+ * Copyright 2022 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ *
+ */
+#ifndef AMD_GFX_H
+#define AMD_GFX_H
+
+#include "amd_ip_blocks.h"
+
+
+void amdgpu_command_submission_gfx_separate_ibs(amdgpu_device_handle device);
+
+void amdgpu_command_submission_gfx_shared_ib(amdgpu_device_handle device);
+
+#endif
diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
new file mode 100644
index 00000000..89b19e39
--- /dev/null
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -0,0 +1,555 @@
+/*
+ * Copyright 2014 Advanced Micro Devices, Inc.
+ * Copyright 2022 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ *
+ */
+#include "amd_memory.h"
+#include "amd_ip_blocks.h"
+#include "amd_PM4.h"
+#include "amd_sdma.h"
+#include <amdgpu.h>
+
+
+#include <amdgpu_drm.h>
+#include "amdgpu_asic_addr.h"
+#include "amd_family.h"
+
+/*
+ * SDMA functions:
+ * - write_linear
+ * - const_fill
+ * - copy_linear
+ */
+static int
+sdma_ring_write_linear(const struct amdgpu_ip_funcs *func,
+		       const struct amdgpu_ring_context *ring_context,
+		       uint32_t *pm4_dw)
+{
+	uint32_t i, j;
+
+	i = 0;
+	j = 0;
+	if (ring_context->secure == false) {
+		if (func->family_id == AMDGPU_FAMILY_SI)
+			ring_context->pm4[i++] = SDMA_PACKET_SI(SDMA_OPCODE_WRITE, 0, 0, 0,
+						 ring_context->write_length);
+		else
+			ring_context->pm4[i++] = SDMA_PACKET(SDMA_OPCODE_WRITE,
+						 SDMA_WRITE_SUB_OPCODE_LINEAR,
+						 ring_context->secure ? SDMA_ATOMIC_TMZ(1) : 0);
+
+		ring_context->pm4[i++] = 0xfffffffc & ring_context->bo_mc;
+		ring_context->pm4[i++] = (0xffffffff00000000 & ring_context->bo_mc) >> 32;
+		if (func->family_id >= AMDGPU_FAMILY_AI)
+			ring_context->pm4[i++] = ring_context->write_length - 1;
+		else
+			ring_context->pm4[i++] = ring_context->write_length;
+
+		while(j++ < ring_context->write_length)
+			ring_context->pm4[i++] = func->deadbeaf;
+	} else {
+		memset(ring_context->pm4, 0, ring_context->pm4_size * sizeof(uint32_t));
+
+		/* atomic opcode for 32b w/ RTN and ATOMIC_SWAPCMP_RTN
+		 * loop, 1-loop_until_compare_satisfied.
+		 * single_pass_atomic, 0-lru
+		 */
+		ring_context->pm4[i++] = SDMA_PACKET(SDMA_OPCODE_ATOMIC,
+					       0,
+					       SDMA_ATOMIC_LOOP(1) |
+					       SDMA_ATOMIC_TMZ(1) |
+					       SDMA_ATOMIC_OPCODE(TC_OP_ATOMIC_CMPSWAP_RTN_32));
+		ring_context->pm4[i++] = 0xfffffffc & ring_context->bo_mc;
+		ring_context->pm4[i++] = (0xffffffff00000000 & ring_context->bo_mc) >> 32;
+		ring_context->pm4[i++] = 0x12345678;
+		ring_context->pm4[i++] = 0x0;
+		ring_context->pm4[i++] = func->deadbeaf;
+		ring_context->pm4[i++] = 0x0;
+		ring_context->pm4[i++] = 0x100;
+	}
+
+ 	*pm4_dw = i;
+
+	return 0;
+}
+
+static int
+sdma_ring_const_fill(const struct amdgpu_ip_funcs *func,
+		     const struct amdgpu_ring_context *context,
+		     uint32_t *pm4_dw)
+{
+	uint32_t i;
+
+	i = 0;
+	if (func->family_id == AMDGPU_FAMILY_SI) {
+		context->pm4[i++] = SDMA_PACKET_SI(SDMA_OPCODE_CONSTANT_FILL_SI,
+						   0, 0, 0, context->write_length / 4);
+		context->pm4[i++] = 0xfffffffc & context->bo_mc;
+		context->pm4[i++] = 0xdeadbeaf;
+		context->pm4[i++] = (0xffffffff00000000 & context->bo_mc) >> 16;
+	} else {
+		context->pm4[i++] = SDMA_PACKET(SDMA_OPCODE_CONSTANT_FILL, 0,
+						SDMA_CONSTANT_FILL_EXTRA_SIZE(2));
+		context->pm4[i++] = 0xffffffff & context->bo_mc;
+		context->pm4[i++] = (0xffffffff00000000 & context->bo_mc) >> 32;
+		context->pm4[i++] = func->deadbeaf;
+
+		if (func->family_id >= AMDGPU_FAMILY_AI)
+			context->pm4[i++] = context->write_length - 1;
+		else
+			context->pm4[i++] = context->write_length;
+	}
+	*pm4_dw = i;
+
+	return 0;
+}
+
+static int
+sdma_ring_copy_linear(const struct amdgpu_ip_funcs *func,
+		      const struct amdgpu_ring_context *context,
+		      uint32_t *pm4_dw)
+{
+	uint32_t i;
+
+	i = 0;
+	if (func->family_id == AMDGPU_FAMILY_SI) {
+		context->pm4[i++] = SDMA_PACKET_SI(SDMA_OPCODE_COPY_SI,
+					  0, 0, 0,
+					  context->write_length);
+		context->pm4[i++] = 0xffffffff & context->bo_mc;
+		context->pm4[i++] = (0xffffffff00000000 & context->bo_mc) >> 32;
+		context->pm4[i++] = 0xffffffff & context->bo_mc2;
+		context->pm4[i++] = (0xffffffff00000000 & context->bo_mc2) >> 32;
+	} else {
+		context->pm4[i++] = SDMA_PACKET(SDMA_OPCODE_COPY,
+				       SDMA_COPY_SUB_OPCODE_LINEAR,
+				       0);
+		if (func->family_id >= AMDGPU_FAMILY_AI)
+			context->pm4[i++] = context->write_length - 1;
+		else
+			context->pm4[i++] = context->write_length;
+		context->pm4[i++] = 0;
+		context->pm4[i++] = 0xffffffff & context->bo_mc;
+		context->pm4[i++] = (0xffffffff00000000 & context->bo_mc) >> 32;
+		context->pm4[i++] = 0xffffffff & context->bo_mc2;
+		context->pm4[i++] = (0xffffffff00000000 & context->bo_mc2) >> 32;
+	}
+
+ 	*pm4_dw = i;
+
+	return 0;
+}
+
+/*
+ * GFX and COMPUTE functions:
+ * - write_linear
+ * - const_fill
+ * - copy_linear
+ */
+
+
+static int
+gfx_ring_write_linear(const struct amdgpu_ip_funcs *func,
+		      const struct amdgpu_ring_context *ring_context,
+		      uint32_t *pm4_dw)
+ {
+ 	uint32_t i, j;
+
+ 	i = 0;
+ 	j = 0;
+
+ 	if (ring_context->secure == false) {
+ 		ring_context->pm4[i++] = PACKET3(PACKET3_WRITE_DATA, 2 +  ring_context->write_length);
+ 		ring_context->pm4[i++] = WRITE_DATA_DST_SEL(5) | WR_CONFIRM;
+ 		ring_context->pm4[i++] = 0xfffffffc & ring_context->bo_mc;
+ 		ring_context->pm4[i++] = (0xffffffff00000000 & ring_context->bo_mc) >> 32;
+ 		while(j++ < ring_context->write_length)
+ 			ring_context->pm4[i++] = func->deadbeaf;
+ 	} else {
+		memset(ring_context->pm4, 0, ring_context->pm4_size * sizeof(uint32_t));
+		ring_context->pm4[i++] = PACKET3(PACKET3_ATOMIC_MEM, 7);
+
+		/* atomic opcode for 32b w/ RTN and ATOMIC_SWAPCMP_RTN
+		 * command, 1-loop_until_compare_satisfied.
+		 * single_pass_atomic, 0-lru
+		 * engine_sel, 0-micro_engine
+		 */
+		ring_context->pm4[i++] = (TC_OP_ATOMIC_CMPSWAP_RTN_32 |
+					ATOMIC_MEM_COMMAND(1) |
+					ATOMIC_MEM_CACHEPOLICAY(0) |
+					ATOMIC_MEM_ENGINESEL(0));
+		ring_context->pm4[i++] = 0xfffffffc & ring_context->bo_mc;
+		ring_context->pm4[i++] = (0xffffffff00000000 & ring_context->bo_mc) >> 32;
+		ring_context->pm4[i++] = 0x12345678;
+		ring_context->pm4[i++] = 0x0;
+		ring_context->pm4[i++] = 0xdeadbeaf;
+		ring_context->pm4[i++] = 0x0;
+		ring_context->pm4[i++] = 0x100;
+ 	}
+
+ 	*pm4_dw = i;
+
+ 	return 0;
+ }
+
+ static int
+ gfx_ring_const_fill(const struct amdgpu_ip_funcs *func,
+		     const struct amdgpu_ring_context *ring_context,
+		     uint32_t *pm4_dw)
+ {
+ 	uint32_t i;
+
+ 	i = 0;
+	if (func->family_id == AMDGPU_FAMILY_SI) {
+		ring_context->pm4[i++] = PACKET3(PACKET3_DMA_DATA_SI, 4);
+		ring_context->pm4[i++] = func->deadbeaf;
+		ring_context->pm4[i++] = PACKET3_DMA_DATA_SI_ENGINE(0) |
+					 PACKET3_DMA_DATA_SI_DST_SEL(0) |
+					 PACKET3_DMA_DATA_SI_SRC_SEL(2) |
+					 PACKET3_DMA_DATA_SI_CP_SYNC;
+		ring_context->pm4[i++] = 0xffffffff & ring_context->bo_mc;
+		ring_context->pm4[i++] = (0xffffffff00000000 & ring_context->bo_mc) >> 32;
+		ring_context->pm4[i++] = ring_context->write_length;
+	} else {
+		ring_context->pm4[i++] = PACKET3(PACKET3_DMA_DATA, 5);
+		ring_context->pm4[i++] = PACKET3_DMA_DATA_ENGINE(0) |
+					 PACKET3_DMA_DATA_DST_SEL(0) |
+					 PACKET3_DMA_DATA_SRC_SEL(2) |
+					 PACKET3_DMA_DATA_CP_SYNC;
+		ring_context->pm4[i++] = func->deadbeaf;
+		ring_context->pm4[i++] = 0;
+		ring_context->pm4[i++] = 0xfffffffc & ring_context->bo_mc;
+		ring_context->pm4[i++] = (0xffffffff00000000 & ring_context->bo_mc) >> 32;
+		ring_context->pm4[i++] = ring_context->write_length;
+	}
+ 	*pm4_dw = i;
+
+ 	return 0;
+ }
+
+static int
+gfx_ring_copy_linear(const struct amdgpu_ip_funcs *func,
+		     const struct amdgpu_ring_context *context,
+		     uint32_t *pm4_dw)
+{
+ 	uint32_t i;
+
+ 	i = 0;
+	if (func->family_id == AMDGPU_FAMILY_SI) {
+		context->pm4[i++] = PACKET3(PACKET3_DMA_DATA_SI, 4);
+		context->pm4[i++] = 0xfffffffc & context->bo_mc;
+		context->pm4[i++] = PACKET3_DMA_DATA_SI_ENGINE(0) |
+			   PACKET3_DMA_DATA_SI_DST_SEL(0) |
+			   PACKET3_DMA_DATA_SI_SRC_SEL(0) |
+			   PACKET3_DMA_DATA_SI_CP_SYNC |
+			   (0xffff00000000 & context->bo_mc) >> 32;
+		context->pm4[i++] = 0xfffffffc & context->bo_mc2;
+		context->pm4[i++] = (0xffffffff00000000 & context->bo_mc2) >> 32;
+		context->pm4[i++] = context->write_length;
+	} else {
+		context->pm4[i++] = PACKET3(PACKET3_DMA_DATA, 5);
+		context->pm4[i++] = PACKET3_DMA_DATA_ENGINE(0) |
+			   PACKET3_DMA_DATA_DST_SEL(0) |
+			   PACKET3_DMA_DATA_SRC_SEL(0) |
+			   PACKET3_DMA_DATA_CP_SYNC;
+		context->pm4[i++] = 0xfffffffc & context->bo_mc;
+		context->pm4[i++] = (0xffffffff00000000 & context->bo_mc) >> 32;
+		context->pm4[i++] = 0xfffffffc & context->bo_mc2;
+		context->pm4[i++] = (0xffffffff00000000 & context->bo_mc2) >> 32;
+		context->pm4[i++] = context->write_length;
+	}
+
+ 	*pm4_dw = i;
+
+	return 0;
+}
+
+/* we may cobine these two functions later */
+static int
+x_compare(const struct amdgpu_ip_funcs *func,
+	  const struct amdgpu_ring_context *ring_context, int div)
+{
+	int i = 0, ret = 0;
+
+	int num_compare = ring_context->write_length/div;
+
+	while(i < num_compare) {
+		if (ring_context->bo_cpu[i++] != func->deadbeaf) {
+			ret = -1;
+			break;
+		}
+	}
+	return ret;
+}
+
+static int
+x_compare_pattern(const struct amdgpu_ip_funcs *func,
+	  const struct amdgpu_ring_context *ring_context, int div)
+{
+	int i = 0, ret = 0;
+
+	int num_compare = ring_context->write_length/div;
+
+	while(i < num_compare) {
+		if (ring_context->bo_cpu[i++] != func->pattern) {
+			ret = -1;
+			break;
+		}
+	}
+	return ret;
+}
+
+static const struct amdgpu_ip_funcs gfx_v8_x_ip_funcs = {
+	.family_id = FAMILY_VI,
+	.align_mask = 0xff,
+	.nop = 0x80000000,
+	.deadbeaf = 0xdeadbeaf,
+	.pattern = 0xaaaaaaaa,
+	.write_linear = gfx_ring_write_linear,
+	.const_fill = gfx_ring_const_fill,
+	.copy_linear = gfx_ring_copy_linear,
+	.compare = x_compare,
+	.compare_pattern = x_compare_pattern
+};
+
+
+static const struct amdgpu_ip_funcs sdma_v3_x_ip_funcs = {
+	.family_id = FAMILY_VI,
+	.align_mask = 0xff,
+	.nop = 0x80000000,
+	.deadbeaf = 0xdeadbeaf,
+	.pattern = 0xaaaaaaaa,
+	.write_linear = sdma_ring_write_linear,
+	.const_fill = sdma_ring_const_fill,
+	.copy_linear = sdma_ring_copy_linear,
+	.compare = x_compare,
+	.compare_pattern = x_compare_pattern
+};
+
+
+const struct amdgpu_ip_block_version gfx_v8_x_ip_block = {
+	.type = AMD_IP_GFX,
+	.major = 8,
+	.minor = 0,
+	.rev = 0,
+	.funcs = &gfx_v8_x_ip_funcs
+};
+
+const struct amdgpu_ip_block_version compute_v8_x_ip_block = {
+	.type = AMD_IP_COMPUTE,
+	.major = 8,
+	.minor = 0,
+	.rev = 0,
+	.funcs = &gfx_v8_x_ip_funcs
+};
+
+const struct amdgpu_ip_block_version sdma_v3_x_ip_block = {
+	.type = AMD_IP_DMA,
+	.major = 3,
+	.minor = 0,
+	.rev = 0,
+	.funcs = &sdma_v3_x_ip_funcs
+};
+
+struct chip_info {
+	  const char *name;
+	  enum radeon_family family;
+	  enum chip_class chip_class;
+	  amdgpu_device_handle dev;
+};
+
+/* we may improve later */
+struct amdgpu_ip_blocks_device amdgpu_ips;
+struct chip_info g_chip;
+
+static int
+amdgpu_device_ip_block_add(const struct amdgpu_ip_block_version *ip_block_version)
+{
+	if (amdgpu_ips.num_ip_blocks >= AMD_IP_MAX)
+		return -1;
+
+	amdgpu_ips.ip_blocks[amdgpu_ips.num_ip_blocks++] = ip_block_version;
+
+	return 0;
+}
+
+const struct amdgpu_ip_block_version *
+get_ip_block(amdgpu_device_handle device, enum amd_ip_block_type type)
+{
+	int i;
+
+	if (g_chip.dev != device)
+		return NULL;
+
+	for(i = 0; i <  amdgpu_ips.num_ip_blocks; i++)
+		if (amdgpu_ips.ip_blocks[i]->type == type)
+			return amdgpu_ips.ip_blocks[i];
+	return NULL;
+}
+
+
+
+
+
+/*
+ * GFX: 8.x
+ * COMPUTE: 8.x
+ * SDMA 3.x
+ *
+ * GFX9:
+ * COMPUTE: 9.x
+ * SDMA 4.x
+ *
+ * GFX10.1:
+ * COMPUTE: 10.1
+ * SDMA 5.0
+ *
+ * GFX10.3:
+ * COMPUTE: 10.3
+ * SDMA 5.2
+ *
+ * copy function from mesa
+ *  should be called once per test
+ */
+int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_info *amdinfo,
+			   amdgpu_device_handle device)
+{
+#define identify_chip2(asic, chipname)			\
+   if (ASICREV_IS(amdinfo->chip_external_rev, asic)) {	\
+      info->family = CHIP_##chipname;			\
+      info->name = #chipname;				\
+   }
+#define identify_chip(chipname) identify_chip2(chipname, chipname)
+
+	struct chip_info *info = &g_chip;
+
+	switch (amdinfo->family_id) {
+	case AMDGPU_FAMILY_SI:
+		identify_chip(TAHITI);
+		identify_chip(PITCAIRN);
+		identify_chip2(CAPEVERDE, VERDE);
+		identify_chip(OLAND);
+		identify_chip(HAINAN);
+		break;
+	case FAMILY_CI:
+		identify_chip(BONAIRE);//tested
+		identify_chip(HAWAII);
+		break;
+	case FAMILY_KV:
+		identify_chip2(SPECTRE, KAVERI);
+		identify_chip2(SPOOKY, KAVERI);
+		identify_chip2(KALINDI, KABINI);
+		identify_chip2(GODAVARI, KABINI);
+		break;
+	case FAMILY_VI:
+		identify_chip(ICELAND);
+		identify_chip(TONGA);
+		identify_chip(FIJI);
+		identify_chip(POLARIS10);
+		identify_chip(POLARIS11);//tested
+		identify_chip(POLARIS12);
+		identify_chip(VEGAM);
+		break;
+	case FAMILY_CZ:
+		identify_chip(CARRIZO);
+		identify_chip(STONEY);
+		break;
+	case FAMILY_AI:
+		identify_chip(VEGA10);
+		identify_chip(VEGA12);
+		identify_chip(VEGA20);
+		identify_chip(ARCTURUS);
+		identify_chip(ALDEBARAN);
+		break;
+	case FAMILY_RV:
+		identify_chip(RAVEN);
+		identify_chip(RAVEN2);
+		identify_chip(RENOIR);
+		break;
+	case FAMILY_NV:
+		identify_chip(NAVI10); //tested
+		identify_chip(NAVI12);
+		identify_chip(NAVI14);
+		identify_chip(SIENNA_CICHLID);
+		identify_chip(NAVY_FLOUNDER);
+		identify_chip(DIMGREY_CAVEFISH);
+		identify_chip(BEIGE_GOBY);
+		break;
+	case FAMILY_VGH:
+		identify_chip(VANGOGH);
+		break;
+	case FAMILY_YC:
+		identify_chip(YELLOW_CARP);
+		break;
+	}
+	if (!info->name) {
+		igt_info("amdgpu: unknown (family_id, chip_external_rev): (%u, %u)\n",
+			 amdinfo->family_id, amdinfo->chip_external_rev);
+		return -1;
+	}
+
+	if (info->family >= CHIP_SIENNA_CICHLID)
+		info->chip_class = GFX10_3;
+	else if (info->family >= CHIP_NAVI10)
+		info->chip_class = GFX10;
+	else if (info->family >= CHIP_VEGA10)
+		info->chip_class = GFX9;
+	else if (info->family >= CHIP_TONGA)
+		info->chip_class = GFX8;
+	else if (info->family >= CHIP_BONAIRE)
+		info->chip_class = GFX7;
+	else if (info->family >= CHIP_TAHITI)
+		info->chip_class = GFX6;
+	else {
+		igt_info("amdgpu: Unknown family.\n");
+		return -1;
+	}
+
+	switch(info->chip_class) {
+	case GFX6:
+		break;
+	case GFX7: /* tested */
+	case GFX8: /* tested */
+	case GFX10:/* tested */
+		amdgpu_device_ip_block_add(&gfx_v8_x_ip_block);
+		amdgpu_device_ip_block_add(&compute_v8_x_ip_block);
+		amdgpu_device_ip_block_add(&sdma_v3_x_ip_block);
+		/* extra precaution if re-factor again */
+		igt_assert_eq(gfx_v8_x_ip_block.major, 8);
+		igt_assert_eq(compute_v8_x_ip_block.major, 8);
+		igt_assert_eq(sdma_v3_x_ip_block.major, 3);
+
+		igt_assert_eq(gfx_v8_x_ip_block.funcs->family_id, FAMILY_VI);
+		igt_assert_eq(sdma_v3_x_ip_block.funcs->family_id, FAMILY_VI);
+		break;
+	case GFX9:
+		break;
+	case GFX10_3:
+		break;
+	default:
+		igt_info("amdgpu: GFX or old.\n");
+		return -1;
+	 }
+	info->dev = device;
+
+	return 0;
+}
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
new file mode 100644
index 00000000..cb7d1474
--- /dev/null
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -0,0 +1,114 @@
+/*
+ * Copyright 2014 Advanced Micro Devices, Inc.
+ * Copyright 2022 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ *
+ */
+#ifndef AMD_IP_BLOCKS_H
+#define AMD_IP_BLOCKS_H
+
+enum amd_ip_block_type {
+	AMD_IP_GFX,
+	AMD_IP_COMPUTE,
+	AMD_IP_DMA,
+	AMD_IP_UVD,
+	AMD_IP_VCE,
+	AMD_IP_MAX,
+};
+
+
+/* aux struct to hold misc parameters for convenience to maintain */
+struct amdgpu_ring_context {
+
+	int ring_id; /* ring_id from amdgpu_query_hw_ip_info */
+	int res_cnt; /* num of bo in amdgpu_bo_handle resources[2] */
+
+	uint32_t write_length;  /* length of data */
+	uint32_t *pm4; 		/* data of the packet */
+	uint32_t pm4_size; 	/* max allocated packet size */
+	bool secure; 		/* secure or not */
+
+	uint64_t bo_mc;		/* result from amdgpu_bo_alloc_and_map */
+	uint64_t bo_mc2;	/* result from amdgpu_bo_alloc_and_map */
+
+	uint32_t pm4_dw;	/* actual size of pm4 */
+
+	volatile uint32_t *bo_cpu;
+	volatile uint32_t *bo2_cpu;
+
+	uint32_t bo_cpu_origin;
+
+	amdgpu_bo_handle bo;
+	amdgpu_bo_handle bo2;
+
+	amdgpu_context_handle context_handle;
+	struct drm_amdgpu_info_hw_ip hw_ip_info;  /* result of amdgpu_query_hw_ip_info */
+
+	amdgpu_bo_handle resources[2]; /* amdgpu_bo_alloc_and_map */
+	amdgpu_va_handle va_handle;    /* amdgpu_bo_alloc_and_map */
+	amdgpu_va_handle va_handle2;   /* amdgpu_bo_alloc_and_map */
+
+	struct amdgpu_cs_ib_info ib_info;     /* amdgpu_bo_list_create */
+	struct amdgpu_cs_request ibs_request; /* amdgpu_cs_query_fence_status */
+};
+
+struct amdgpu_ip_funcs {
+	uint32_t	family_id;
+	uint32_t	align_mask;
+	uint32_t	nop;
+	uint32_t	deadbeaf;
+	uint32_t	pattern;
+	/* functions */
+	int (*write_linear)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, uint32_t *pm4_dw);
+	int (*const_fill)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, uint32_t *pm4_dw);
+	int (*copy_linear)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, uint32_t *pm4_dw);
+	int (*compare)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, int div);
+	int (*compare_pattern)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, int div);
+};
+
+extern const struct amdgpu_ip_block_version gfx_v6_0_ip_block;
+
+struct amdgpu_ip_block_version {
+	const enum amd_ip_block_type type;
+	const int major;
+	const int minor;
+	const int rev;
+	const struct amdgpu_ip_funcs *funcs;
+};
+
+/* global holder for the array of in use ip blocks */
+
+struct amdgpu_ip_blocks_device {
+	const struct amdgpu_ip_block_version *ip_blocks[AMD_IP_MAX];
+	int			num_ip_blocks;
+};
+
+extern  struct amdgpu_ip_blocks_device amdgpu_ips;
+
+int
+setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_info *amdinfo,
+		       amdgpu_device_handle device);
+
+const struct amdgpu_ip_block_version *
+get_ip_block(amdgpu_device_handle device, enum amd_ip_block_type type);
+
+
+#endif
diff --git a/lib/amdgpu/amd_memory.c b/lib/amdgpu/amd_memory.c
new file mode 100644
index 00000000..b0fa18c6
--- /dev/null
+++ b/lib/amdgpu/amd_memory.c
@@ -0,0 +1,293 @@
+/*
+ * Copyright 2014 Advanced Micro Devices, Inc.
+ * Copyright 2022 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ *
+ */
+
+#include "amd_memory.h"
+
+/**
+ *
+ * @param device_handle
+ * @param size
+ * @param alignment
+ * @param type
+ * @param flags
+ * @param vmc_addr
+ * @param va_handle
+ * @return
+ */
+ amdgpu_bo_handle
+ gpu_mem_alloc(amdgpu_device_handle device_handle,
+				      uint64_t size,
+				      uint64_t alignment,
+				      uint32_t type,
+				      uint64_t flags,
+				      uint64_t *vmc_addr,
+				      amdgpu_va_handle *va_handle)
+{
+	struct amdgpu_bo_alloc_request req = {
+		.alloc_size = size,
+		.phys_alignment = alignment,
+		.preferred_heap = type,
+		.flags = flags,
+	};
+	amdgpu_bo_handle buf_handle;
+	int r;
+
+	r = amdgpu_bo_alloc(device_handle, &req, &buf_handle);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_va_range_alloc(device_handle,
+				  amdgpu_gpu_va_range_general,
+				  size, alignment, 0, vmc_addr,
+				  va_handle, 0);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_va_op(buf_handle, 0, size, *vmc_addr, 0, AMDGPU_VA_OP_MAP);
+	igt_assert_eq(r, 0);
+
+	return buf_handle;
+}
+
+ /**
+  *
+  * @param bo
+  * @param va_handle
+  * @param vmc_addr
+  * @param size
+  */
+ void
+ gpu_mem_free(amdgpu_bo_handle bo,
+			 amdgpu_va_handle va_handle,
+			 uint64_t vmc_addr,
+			 uint64_t size)
+{
+	int r;
+
+	r = amdgpu_bo_va_op(bo, 0, size, vmc_addr, 0, AMDGPU_VA_OP_UNMAP);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_va_range_free(va_handle);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_free(bo);
+	igt_assert_eq(r, 0);
+}
+
+/**
+ *
+ * @param dev
+ * @param size
+ * @param alignment
+ * @param heap
+ * @param flags
+ * @param bo
+ * @param cpu
+ * @param mc_address
+ * @param va_handle
+ * @return
+ */
+int
+amdgpu_bo_alloc_and_map(amdgpu_device_handle dev, unsigned size,
+			unsigned alignment, unsigned heap, uint64_t flags,
+			amdgpu_bo_handle *bo, void **cpu, uint64_t *mc_address,
+			amdgpu_va_handle *va_handle)
+{
+	struct amdgpu_bo_alloc_request request = {
+		.alloc_size = size,
+		.phys_alignment = alignment,
+		.preferred_heap = heap,
+		.flags = flags,
+	};
+	amdgpu_bo_handle buf_handle;
+	amdgpu_va_handle handle;
+	uint64_t vmc_addr;
+	int r;
+
+	r = amdgpu_bo_alloc(dev, &request, &buf_handle);
+	if (r)
+		return r;
+
+	r = amdgpu_va_range_alloc(dev,
+				  amdgpu_gpu_va_range_general,
+				  size, alignment, 0, &vmc_addr,
+				  &handle, 0);
+	if (r)
+		goto error_va_alloc;
+
+	r = amdgpu_bo_va_op(buf_handle, 0, size, vmc_addr, 0, AMDGPU_VA_OP_MAP);
+	if (r)
+		goto error_va_map;
+
+	r = amdgpu_bo_cpu_map(buf_handle, cpu);
+	if (r)
+		goto error_cpu_map;
+
+	*bo = buf_handle;
+	*mc_address = vmc_addr;
+	*va_handle = handle;
+
+	return 0;
+
+error_cpu_map:
+	amdgpu_bo_cpu_unmap(buf_handle);
+
+error_va_map:
+	amdgpu_bo_va_op(buf_handle, 0, size, vmc_addr, 0, AMDGPU_VA_OP_UNMAP);
+
+error_va_alloc:
+	amdgpu_bo_free(buf_handle);
+	return r;
+}
+
+/**
+ *
+ * @param bo
+ * @param va_handle
+ * @param mc_addr
+ * @param size
+ */
+void
+amdgpu_bo_unmap_and_free(amdgpu_bo_handle bo, amdgpu_va_handle va_handle,
+			 uint64_t mc_addr, uint64_t size)
+{
+	amdgpu_bo_cpu_unmap(bo);
+	amdgpu_bo_va_op(bo, 0, size, mc_addr, 0, AMDGPU_VA_OP_UNMAP);
+	amdgpu_va_range_free(va_handle);
+	amdgpu_bo_free(bo);
+}
+
+/**
+ *
+ * @param dev
+ * @param bo1
+ * @param bo2
+ * @param list
+ * @return
+ */
+int
+amdgpu_get_bo_list(amdgpu_device_handle dev, amdgpu_bo_handle bo1,
+		   amdgpu_bo_handle bo2, amdgpu_bo_list_handle *list)
+{
+	amdgpu_bo_handle resources[] = {bo1, bo2};
+
+	return amdgpu_bo_list_create(dev, bo2 ? 2 : 1, resources, NULL, list);
+}
+
+/**
+ * MULTI FENCE
+ * @param device
+ * @param wait_all
+ */
+void amdgpu_command_submission_multi_fence_wait_all(amdgpu_device_handle device,
+						    bool wait_all)
+{
+	amdgpu_context_handle context_handle;
+	amdgpu_bo_handle ib_result_handle, ib_result_ce_handle;
+	void *ib_result_cpu, *ib_result_ce_cpu;
+	uint64_t ib_result_mc_address, ib_result_ce_mc_address;
+	struct amdgpu_cs_request ibs_request[2] = {};
+	struct amdgpu_cs_ib_info ib_info[2];
+	struct amdgpu_cs_fence fence_status[2] = {};
+	uint32_t *ptr;
+	uint32_t expired;
+	amdgpu_bo_list_handle bo_list;
+	amdgpu_va_handle va_handle, va_handle_ce;
+	int r;
+	int i, ib_cs_num = 2;
+
+	r = amdgpu_cs_ctx_create(device, &context_handle);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_alloc_and_map(device, 4096, 4096,
+				    AMDGPU_GEM_DOMAIN_GTT, 0,
+				    &ib_result_handle, &ib_result_cpu,
+				    &ib_result_mc_address, &va_handle);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_alloc_and_map(device, 4096, 4096,
+				    AMDGPU_GEM_DOMAIN_GTT, 0,
+				    &ib_result_ce_handle, &ib_result_ce_cpu,
+				    &ib_result_ce_mc_address, &va_handle_ce);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_get_bo_list(device, ib_result_handle,
+			       ib_result_ce_handle, &bo_list);
+	igt_assert_eq(r, 0);
+
+	memset(ib_info, 0, 2 * sizeof(struct amdgpu_cs_ib_info));
+
+	/* IT_SET_CE_DE_COUNTERS */
+	ptr = ib_result_ce_cpu;
+	ptr[0] = 0xc0008900;
+	ptr[1] = 0;
+	ptr[2] = 0xc0008400;
+	ptr[3] = 1;
+	ib_info[0].ib_mc_address = ib_result_ce_mc_address;
+	ib_info[0].size = 4;
+	ib_info[0].flags = AMDGPU_IB_FLAG_CE;
+
+	/* IT_WAIT_ON_CE_COUNTER */
+	ptr = ib_result_cpu;
+	ptr[0] = 0xc0008600;
+	ptr[1] = 0x00000001;
+	ib_info[1].ib_mc_address = ib_result_mc_address;
+	ib_info[1].size = 2;
+
+	for (i = 0; i < ib_cs_num; i++) {
+		ibs_request[i].ip_type = AMDGPU_HW_IP_GFX;
+		ibs_request[i].number_of_ibs = 2;
+		ibs_request[i].ibs = ib_info;
+		ibs_request[i].resources = bo_list;
+		ibs_request[i].fence_info.handle = NULL;
+	}
+
+	r = amdgpu_cs_submit(context_handle, 0,ibs_request, ib_cs_num);
+
+	igt_assert_eq(r, 0);
+
+	for (i = 0; i < ib_cs_num; i++) {
+		fence_status[i].context = context_handle;
+		fence_status[i].ip_type = AMDGPU_HW_IP_GFX;
+		fence_status[i].fence = ibs_request[i].seq_no;
+	}
+
+	r = amdgpu_cs_wait_fences(fence_status, ib_cs_num, wait_all,
+				  AMDGPU_TIMEOUT_INFINITE,
+				  &expired, NULL);
+	igt_assert_eq(r, 0);
+
+	amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
+				 ib_result_mc_address, 4096);
+
+	amdgpu_bo_unmap_and_free(ib_result_ce_handle, va_handle_ce,
+				 ib_result_ce_mc_address, 4096);
+
+	r = amdgpu_bo_list_destroy(bo_list);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_cs_ctx_free(context_handle);
+	igt_assert_eq(r, 0);
+}
+
+
diff --git a/lib/amdgpu/amd_memory.h b/lib/amdgpu/amd_memory.h
new file mode 100644
index 00000000..d7f32926
--- /dev/null
+++ b/lib/amdgpu/amd_memory.h
@@ -0,0 +1,65 @@
+/*
+ * Copyright 2014 Advanced Micro Devices, Inc.
+ * Copyright 2022 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ *
+ */
+#ifndef AMD_MEMORY_H
+#define AMD_MEMORY_H
+
+#include "drmtest.h"
+#include <amdgpu.h>
+#include <amdgpu_drm.h>
+
+
+amdgpu_bo_handle
+gpu_mem_alloc(amdgpu_device_handle device_handle,
+				      uint64_t size,
+				      uint64_t alignment,
+				      uint32_t type,
+				      uint64_t flags,
+				      uint64_t *vmc_addr,
+				      amdgpu_va_handle *va_handle);
+
+void
+gpu_mem_free(amdgpu_bo_handle bo,
+			 amdgpu_va_handle va_handle,
+			 uint64_t vmc_addr,
+			 uint64_t size);
+
+int
+amdgpu_bo_alloc_and_map(amdgpu_device_handle dev, unsigned size,
+			unsigned alignment, unsigned heap, uint64_t flags,
+			amdgpu_bo_handle *bo, void **cpu, uint64_t *mc_address,
+			amdgpu_va_handle *va_handle);
+
+void
+amdgpu_bo_unmap_and_free(amdgpu_bo_handle bo, amdgpu_va_handle va_handle,
+			 uint64_t mc_addr, uint64_t size);
+
+int
+amdgpu_get_bo_list(amdgpu_device_handle dev, amdgpu_bo_handle bo1,
+		   amdgpu_bo_handle bo2, amdgpu_bo_list_handle *list);
+
+void amdgpu_command_submission_multi_fence_wait_all(amdgpu_device_handle device,
+						    bool wait_all);
+
+#endif
diff --git a/lib/amdgpu/amd_sdma.h b/lib/amdgpu/amd_sdma.h
new file mode 100644
index 00000000..b8ed93aa
--- /dev/null
+++ b/lib/amdgpu/amd_sdma.h
@@ -0,0 +1,102 @@
+/*
+ * Copyright 2014 Advanced Micro Devices, Inc.
+ * Copyright 2022 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ *
+ */
+
+#ifndef AMD_SDMA_H
+#define AMD_SDMA_H
+
+#define SDMA_PKT_HEADER_op_offset 0
+#define SDMA_PKT_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_HEADER_op_shift  0
+#define SDMA_PKT_HEADER_OP(x) (((x) & SDMA_PKT_HEADER_op_mask) << SDMA_PKT_HEADER_op_shift)
+#define SDMA_OPCODE_CONSTANT_FILL  11
+#       define SDMA_CONSTANT_FILL_EXTRA_SIZE(x)           ((x) << 14)
+	/* 0 = byte fill
+	 * 2 = DW fill
+	 */
+#define SDMA_PACKET(op, sub_op, e)	((((e) & 0xFFFF) << 16) |	\
+					(((sub_op) & 0xFF) << 8) |	\
+					(((op) & 0xFF) << 0))
+#define	SDMA_OPCODE_WRITE				  2
+#       define SDMA_WRITE_SUB_OPCODE_LINEAR               0
+#       define SDMA_WRTIE_SUB_OPCODE_TILED                1
+
+#define	SDMA_OPCODE_COPY				  1
+#       define SDMA_COPY_SUB_OPCODE_LINEAR                0
+
+#define SDMA_NOP  0x0
+
+
+
+/* taken from basic_tests.c and amdgpu_stress.c */
+
+#define SDMA_PACKET_SI(op, b, t, s, cnt)	((((op) & 0xF) << 28) | \
+						(((b) & 0x1) << 26) |	\
+						(((t) & 0x1) << 23) |	\
+						(((s) & 0x1) << 22) |	\
+						(((cnt) & 0xFFFFF) << 0))
+#define SDMA_OPCODE_COPY_SI     3
+
+
+#define	SDMA_OPCODE_ATOMIC				  10
+#		define SDMA_ATOMIC_LOOP(x)               ((x) << 0)
+        /* 0 - single_pass_atomic.
+         * 1 - loop_until_compare_satisfied.
+         */
+#		define SDMA_ATOMIC_TMZ(x)                ((x) << 2)
+		/* 0 - non-TMZ.
+		 * 1 - TMZ.
+	     */
+#		define SDMA_ATOMIC_OPCODE(x)             ((x) << 9)
+		/* TC_OP_ATOMIC_CMPSWAP_RTN_32 0x00000008
+		 * same as Packet 3
+		 */
+#define SDMA_PACKET_SI(op, b, t, s, cnt)	((((op) & 0xF) << 28) |	\
+						(((b) & 0x1) << 26) |		\
+						(((t) & 0x1) << 23) |		\
+						(((s) & 0x1) << 22) |		\
+						(((cnt) & 0xFFFFF) << 0))
+#define	SDMA_OPCODE_COPY_SI	3
+#define SDMA_OPCODE_CONSTANT_FILL_SI	13
+#define SDMA_NOP_SI  0xf
+#define GFX_COMPUTE_NOP_SI 0x80000000
+#define	PACKET3_DMA_DATA_SI	0x41
+#              define PACKET3_DMA_DATA_SI_ENGINE(x)     ((x) << 27)
+		/* 0 - ME
+		 * 1 - PFP
+		 */
+#              define PACKET3_DMA_DATA_SI_DST_SEL(x)  ((x) << 20)
+		/* 0 - DST_ADDR using DAS
+		 * 1 - GDS
+		 * 3 - DST_ADDR using L2
+		 */
+#              define PACKET3_DMA_DATA_SI_SRC_SEL(x)  ((x) << 29)
+		/* 0 - SRC_ADDR using SAS
+		 * 1 - GDS
+		 * 2 - DATA
+		 * 3 - SRC_ADDR using L2
+		 */
+#              define PACKET3_DMA_DATA_SI_CP_SYNC     (1 << 31)
+
+#endif
diff --git a/lib/amdgpu/amdgpu_asic_addr.h b/lib/amdgpu/amdgpu_asic_addr.h
new file mode 100644
index 00000000..d147efb8
--- /dev/null
+++ b/lib/amdgpu/amdgpu_asic_addr.h
@@ -0,0 +1,172 @@
+/**
+***********************************************************************************************************************
+*
+* Copyright © 2007-2021 Advanced Micro Devices, Inc.
+* Copyright 2022 Advanced Micro Devices, Inc.
+* All Rights Reserved.
+*
+* Permission is hereby granted, free of charge, to any person obtaining a
+* copy of this software and associated documentation files (the "Software"),
+* to deal in the Software without restriction, including without limitation
+* the rights to use, copy, modify, merge, publish, distribute, sublicense,
+* and/or sell copies of the Software, and to permit persons to whom the
+* Software is furnished to do so, subject to the following conditions:
+*
+* The above copyright notice and this permission notice shall be included in
+* all copies or substantial portions of the Software.
+*
+* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+* THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+* OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+* ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+* OTHER DEALINGS IN THE SOFTWARE
+*
+***********************************************************************************************************************
+*/
+
+#ifndef _AMDGPU_ASIC_ADDR_H
+#define _AMDGPU_ASIC_ADDR_H
+
+#define ATI_VENDOR_ID         0x1002
+#define AMD_VENDOR_ID         0x1022
+
+// AMDGPU_VENDOR_IS_AMD(vendorId)
+#define AMDGPU_VENDOR_IS_AMD(v) ((v == ATI_VENDOR_ID) || (v == AMD_VENDOR_ID))
+
+#define FAMILY_UNKNOWN 0x00
+#define FAMILY_TN      0x69
+#define FAMILY_SI      0x6E
+#define FAMILY_CI      0x78
+#define FAMILY_KV      0x7D
+#define FAMILY_VI      0x82
+#define FAMILY_POLARIS 0x82
+#define FAMILY_CZ      0x87
+#define FAMILY_AI      0x8D
+#define FAMILY_RV      0x8E
+#define FAMILY_NV      0x8F
+#define FAMILY_VGH     0x90
+#define FAMILY_YC      0x92
+
+// AMDGPU_FAMILY_IS(familyId, familyName)
+#define FAMILY_IS(f, fn)     (f == FAMILY_##fn)
+#define FAMILY_IS_TN(f)      FAMILY_IS(f, TN)
+#define FAMILY_IS_SI(f)      FAMILY_IS(f, SI)
+#define FAMILY_IS_CI(f)      FAMILY_IS(f, CI)
+#define FAMILY_IS_KV(f)      FAMILY_IS(f, KV)
+#define FAMILY_IS_VI(f)      FAMILY_IS(f, VI)
+#define FAMILY_IS_POLARIS(f) FAMILY_IS(f, POLARIS)
+#define FAMILY_IS_CZ(f)      FAMILY_IS(f, CZ)
+#define FAMILY_IS_AI(f)      FAMILY_IS(f, AI)
+#define FAMILY_IS_RV(f)      FAMILY_IS(f, RV)
+#define FAMILY_IS_NV(f)      FAMILY_IS(f, NV)
+#define FAMILY_IS_YC(f)      FAMILY_IS(f, YC)
+
+#define AMDGPU_UNKNOWN          0xFF
+
+#define AMDGPU_TAHITI_RANGE     0x05, 0x14
+#define AMDGPU_PITCAIRN_RANGE   0x15, 0x28
+#define AMDGPU_CAPEVERDE_RANGE  0x29, 0x3C
+#define AMDGPU_OLAND_RANGE      0x3C, 0x46
+#define AMDGPU_HAINAN_RANGE     0x46, 0xFF
+
+#define AMDGPU_BONAIRE_RANGE    0x14, 0x28
+#define AMDGPU_HAWAII_RANGE     0x28, 0x3C
+
+#define AMDGPU_SPECTRE_RANGE    0x01, 0x41
+#define AMDGPU_SPOOKY_RANGE     0x41, 0x81
+#define AMDGPU_KALINDI_RANGE    0x81, 0xA1
+#define AMDGPU_GODAVARI_RANGE   0xA1, 0xFF
+
+#define AMDGPU_ICELAND_RANGE    0x01, 0x14
+#define AMDGPU_TONGA_RANGE      0x14, 0x28
+#define AMDGPU_FIJI_RANGE       0x3C, 0x50
+#define AMDGPU_POLARIS10_RANGE  0x50, 0x5A
+#define AMDGPU_POLARIS11_RANGE  0x5A, 0x64
+#define AMDGPU_POLARIS12_RANGE  0x64, 0x6E
+#define AMDGPU_VEGAM_RANGE      0x6E, 0xFF
+
+#define AMDGPU_CARRIZO_RANGE    0x01, 0x21
+#define AMDGPU_STONEY_RANGE     0x61, 0xFF
+
+#define AMDGPU_VEGA10_RANGE     0x01, 0x14
+#define AMDGPU_VEGA12_RANGE     0x14, 0x28
+#define AMDGPU_VEGA20_RANGE     0x28, 0x32
+#define AMDGPU_ARCTURUS_RANGE   0x32, 0x3C
+#define AMDGPU_ALDEBARAN_RANGE  0x3C, 0xFF
+
+#define AMDGPU_RAVEN_RANGE      0x01, 0x81
+#define AMDGPU_RAVEN2_RANGE     0x81, 0x91
+#define AMDGPU_RENOIR_RANGE     0x91, 0xFF
+
+#define AMDGPU_NAVI10_RANGE     0x01, 0x0A
+#define AMDGPU_NAVI12_RANGE     0x0A, 0x14
+#define AMDGPU_NAVI14_RANGE     0x14, 0x28
+#define AMDGPU_SIENNA_CICHLID_RANGE     0x28, 0x32
+#define AMDGPU_NAVY_FLOUNDER_RANGE      0x32, 0x3C
+#define AMDGPU_DIMGREY_CAVEFISH_RANGE   0x3C, 0x46
+#define AMDGPU_BEIGE_GOBY_RANGE         0x46, 0x50
+
+#define AMDGPU_VANGOGH_RANGE    0x01, 0xFF
+
+#define AMDGPU_YELLOW_CARP_RANGE 0x01, 0xFF
+
+#define AMDGPU_EXPAND_FIX(x) x
+#define AMDGPU_RANGE_HELPER(val, min, max) ((val >= min) && (val < max))
+#define AMDGPU_IN_RANGE(val, ...)   AMDGPU_EXPAND_FIX(AMDGPU_RANGE_HELPER(val, __VA_ARGS__))
+
+
+// ASICREV_IS(eRevisionId, revisionName)
+#define ASICREV_IS(r, rn)              AMDGPU_IN_RANGE(r, AMDGPU_##rn##_RANGE)
+#define ASICREV_IS_TAHITI_P(r)         ASICREV_IS(r, TAHITI)
+#define ASICREV_IS_PITCAIRN_PM(r)      ASICREV_IS(r, PITCAIRN)
+#define ASICREV_IS_CAPEVERDE_M(r)      ASICREV_IS(r, CAPEVERDE)
+#define ASICREV_IS_OLAND_M(r)          ASICREV_IS(r, OLAND)
+#define ASICREV_IS_HAINAN_V(r)         ASICREV_IS(r, HAINAN)
+
+#define ASICREV_IS_BONAIRE_M(r)        ASICREV_IS(r, BONAIRE)
+#define ASICREV_IS_HAWAII_P(r)         ASICREV_IS(r, HAWAII)
+
+#define ASICREV_IS_SPECTRE(r)          ASICREV_IS(r, SPECTRE)
+#define ASICREV_IS_SPOOKY(r)           ASICREV_IS(r, SPOOKY)
+#define ASICREV_IS_KALINDI(r)          ASICREV_IS(r, KALINDI)
+#define ASICREV_IS_KALINDI_GODAVARI(r) ASICREV_IS(r, GODAVARI)
+
+#define ASICREV_IS_ICELAND_M(r)        ASICREV_IS(r, ICELAND)
+#define ASICREV_IS_TONGA_P(r)          ASICREV_IS(r, TONGA)
+#define ASICREV_IS_FIJI_P(r)           ASICREV_IS(r, FIJI)
+
+#define ASICREV_IS_POLARIS10_P(r)      ASICREV_IS(r, POLARIS10)
+#define ASICREV_IS_POLARIS11_M(r)      ASICREV_IS(r, POLARIS11)
+#define ASICREV_IS_POLARIS12_V(r)      ASICREV_IS(r, POLARIS12)
+#define ASICREV_IS_VEGAM_P(r)          ASICREV_IS(r, VEGAM)
+
+#define ASICREV_IS_CARRIZO(r)          ASICREV_IS(r, CARRIZO)
+#define ASICREV_IS_STONEY(r)           ASICREV_IS(r, STONEY)
+
+#define ASICREV_IS_VEGA10_M(r)         ASICREV_IS(r, VEGA10)
+#define ASICREV_IS_VEGA10_P(r)         ASICREV_IS(r, VEGA10)
+#define ASICREV_IS_VEGA12_P(r)         ASICREV_IS(r, VEGA12)
+#define ASICREV_IS_VEGA12_p(r)         ASICREV_IS(r, VEGA12)
+#define ASICREV_IS_VEGA20_P(r)         ASICREV_IS(r, VEGA20)
+#define ASICREV_IS_ARCTURUS(r)         ASICREV_IS(r, ARCTURUS)
+#define ASICREV_IS_ALDEBARAN(r)        ASICREV_IS(r, ALDEBARAN)
+
+#define ASICREV_IS_RAVEN(r)            ASICREV_IS(r, RAVEN)
+#define ASICREV_IS_RAVEN2(r)           ASICREV_IS(r, RAVEN2)
+#define ASICREV_IS_RENOIR(r)           ASICREV_IS(r, RENOIR)
+
+#define ASICREV_IS_NAVI10_P(r)         ASICREV_IS(r, NAVI10)
+#define ASICREV_IS_NAVI12_P(r)         ASICREV_IS(r, NAVI12)
+#define ASICREV_IS_NAVI14_M(r)         ASICREV_IS(r, NAVI14)
+#define ASICREV_IS_SIENNA_CICHLID(r)   ASICREV_IS(r, SIENNA_CICHLID)
+#define ASICREV_IS_NAVY_FLOUNDER(r)    ASICREV_IS(r, NAVY_FLOUNDER)
+#define ASICREV_IS_DIMGREY_CAVEFISH(r) ASICREV_IS(r, DIMGREY_CAVEFISH)
+#define ASICREV_IS_BEIGE_GOBY(r)       ASICREV_IS(r, BEIGE_GOBY)
+
+#define ASICREV_IS_VANGOGH(r)          ASICREV_IS(r, VANGOGH)
+
+#define ASICREV_IS_YELLOW_CARP(r)      ASICREV_IS(r, YELLOW_CARP)
+
+#endif // _AMDGPU_ASIC_ADDR_H
diff --git a/lib/meson.build b/lib/meson.build
index 793d399d..0a173c1f 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -122,6 +122,17 @@ if libdrm_nouveau.found()
 	]
 endif
 
+if libdrm_amdgpu.found()
+	lib_deps += libdrm_amdgpu
+	lib_sources += [
+		'amdgpu/amd_memory.c',
+		'amdgpu/amd_command_submission.c',
+		'amdgpu/amd_compute.c',
+		'amdgpu/amd_gfx.c',
+		'amdgpu/amd_ip_blocks.c',
+	]
+endif
+
 if libunwind.found()
 	lib_deps += libunwind
 else
diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 6c9609b9..db531f29 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -1,5 +1,6 @@
 /*
  * Copyright 2014 Advanced Micro Devices, Inc.
+ * Copyright 2022 Advanced Micro Devices, Inc.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the "Software"),
@@ -22,282 +23,24 @@
  * Based on libdrm/tests/amdgpu/basic_tests.c
  */
 
-#include "config.h"
+#include "lib/amdgpu/amd_memory.h"
+#include "lib/amdgpu/amd_sdma.h"
+#include "lib/amdgpu/amd_PM4.h"
+#include "lib/amdgpu/amd_command_submission.h"
+#include "lib/amdgpu/amd_compute.h"
+#include "lib/amdgpu/amd_gfx.h"
 
-#include <stdio.h>
-#include <stdlib.h>
-#include <unistd.h>
-#ifdef HAVE_ALLOCA_H
-# include <alloca.h>
-#endif
-
-#include "drmtest.h"
-
-#include <amdgpu.h>
-#include <amdgpu_drm.h>
-
-static amdgpu_device_handle device;
-
-static void amdgpu_command_submission_write_linear_helper(unsigned ip_type);
-static void amdgpu_command_submission_const_fill_helper(unsigned ip_type);
-static void amdgpu_command_submission_copy_linear_helper(unsigned ip_type);
 
 #define BUFFER_SIZE (8 * 1024)
-#define SDMA_PKT_HEADER_op_offset 0
-#define SDMA_PKT_HEADER_op_mask   0x000000FF
-#define SDMA_PKT_HEADER_op_shift  0
-#define SDMA_PKT_HEADER_OP(x) (((x) & SDMA_PKT_HEADER_op_mask) << SDMA_PKT_HEADER_op_shift)
-#define SDMA_OPCODE_CONSTANT_FILL  11
-#       define SDMA_CONSTANT_FILL_EXTRA_SIZE(x)           ((x) << 14)
-	/* 0 = byte fill
-	 * 2 = DW fill
-	 */
-#define SDMA_PACKET(op, sub_op, e)	((((e) & 0xFFFF) << 16) |	\
-					(((sub_op) & 0xFF) << 8) |	\
-					(((op) & 0xFF) << 0))
-#define	SDMA_OPCODE_WRITE				  2
-#       define SDMA_WRITE_SUB_OPCODE_LINEAR               0
-#       define SDMA_WRTIE_SUB_OPCODE_TILED                1
-
-#define	SDMA_OPCODE_COPY				  1
-#       define SDMA_COPY_SUB_OPCODE_LINEAR                0
 
 #define GFX_COMPUTE_NOP  0xffff1000
-#define SDMA_NOP  0x0
-
-/* PM4 */
-#define	PACKET_TYPE0	0
-#define	PACKET_TYPE1	1
-#define	PACKET_TYPE2	2
-#define	PACKET_TYPE3	3
-
-#define CP_PACKET_GET_TYPE(h) (((h) >> 30) & 3)
-#define CP_PACKET_GET_COUNT(h) (((h) >> 16) & 0x3FFF)
-#define CP_PACKET0_GET_REG(h) ((h) & 0xFFFF)
-#define CP_PACKET3_GET_OPCODE(h) (((h) >> 8) & 0xFF)
-#define PACKET0(reg, n)	((PACKET_TYPE0 << 30) |				\
-			 ((reg) & 0xFFFF) |			\
-			 ((n) & 0x3FFF) << 16)
-#define CP_PACKET2			0x80000000
-#define		PACKET2_PAD_SHIFT		0
-#define		PACKET2_PAD_MASK		(0x3fffffff << 0)
-
-#define PACKET2(v)	(CP_PACKET2 | REG_SET(PACKET2_PAD, (v)))
-
-#define PACKET3(op, n)	((PACKET_TYPE3 << 30) |				\
-			 (((op) & 0xFF) << 8) |				\
-			 ((n) & 0x3FFF) << 16)
-
-/* Packet 3 types */
-#define	PACKET3_NOP					0x10
-
-#define	PACKET3_WRITE_DATA				0x37
-#define		WRITE_DATA_DST_SEL(x)                   ((x) << 8)
-		/* 0 - register
-		 * 1 - memory (sync - via GRBM)
-		 * 2 - gl2
-		 * 3 - gds
-		 * 4 - reserved
-		 * 5 - memory (async - direct)
-		 */
-#define		WR_ONE_ADDR                             (1 << 16)
-#define		WR_CONFIRM                              (1 << 20)
-#define		WRITE_DATA_CACHE_POLICY(x)              ((x) << 25)
-		/* 0 - LRU
-		 * 1 - Stream
-		 */
-#define		WRITE_DATA_ENGINE_SEL(x)                ((x) << 30)
-		/* 0 - me
-		 * 1 - pfp
-		 * 2 - ce
-		 */
-
-#define	PACKET3_DMA_DATA				0x50
-/* 1. header
- * 2. CONTROL
- * 3. SRC_ADDR_LO or DATA [31:0]
- * 4. SRC_ADDR_HI [31:0]
- * 5. DST_ADDR_LO [31:0]
- * 6. DST_ADDR_HI [7:0]
- * 7. COMMAND [30:21] | BYTE_COUNT [20:0]
- */
-/* CONTROL */
-#              define PACKET3_DMA_DATA_ENGINE(x)     ((x) << 0)
-		/* 0 - ME
-		 * 1 - PFP
-		 */
-#              define PACKET3_DMA_DATA_SRC_CACHE_POLICY(x) ((x) << 13)
-		/* 0 - LRU
-		 * 1 - Stream
-		 * 2 - Bypass
-		 */
-#              define PACKET3_DMA_DATA_SRC_VOLATILE (1 << 15)
-#              define PACKET3_DMA_DATA_DST_SEL(x)  ((x) << 20)
-		/* 0 - DST_ADDR using DAS
-		 * 1 - GDS
-		 * 3 - DST_ADDR using L2
-		 */
-#              define PACKET3_DMA_DATA_DST_CACHE_POLICY(x) ((x) << 25)
-		/* 0 - LRU
-		 * 1 - Stream
-		 * 2 - Bypass
-		 */
-#              define PACKET3_DMA_DATA_DST_VOLATILE (1 << 27)
-#              define PACKET3_DMA_DATA_SRC_SEL(x)  ((x) << 29)
-		/* 0 - SRC_ADDR using SAS
-		 * 1 - GDS
-		 * 2 - DATA
-		 * 3 - SRC_ADDR using L2
-		 */
-#              define PACKET3_DMA_DATA_CP_SYNC     (1 << 31)
-/* COMMAND */
-#              define PACKET3_DMA_DATA_DIS_WC      (1 << 21)
-#              define PACKET3_DMA_DATA_CMD_SRC_SWAP(x) ((x) << 22)
-		/* 0 - none
-		 * 1 - 8 in 16
-		 * 2 - 8 in 32
-		 * 3 - 8 in 64
-		 */
-#              define PACKET3_DMA_DATA_CMD_DST_SWAP(x) ((x) << 24)
-		/* 0 - none
-		 * 1 - 8 in 16
-		 * 2 - 8 in 32
-		 * 3 - 8 in 64
-		 */
-#              define PACKET3_DMA_DATA_CMD_SAS     (1 << 26)
-		/* 0 - memory
-		 * 1 - register
-		 */
-#              define PACKET3_DMA_DATA_CMD_DAS     (1 << 27)
-		/* 0 - memory
-		 * 1 - register
-		 */
-#              define PACKET3_DMA_DATA_CMD_SAIC    (1 << 28)
-#              define PACKET3_DMA_DATA_CMD_DAIC    (1 << 29)
-#              define PACKET3_DMA_DATA_CMD_RAW_WAIT  (1 << 30)
-
-static amdgpu_bo_handle gpu_mem_alloc(amdgpu_device_handle device_handle,
-				      uint64_t size,
-				      uint64_t alignment,
-				      uint32_t type,
-				      uint64_t flags,
-				      uint64_t *vmc_addr,
-				      amdgpu_va_handle *va_handle)
-{
-	struct amdgpu_bo_alloc_request req = {
-		.alloc_size = size,
-		.phys_alignment = alignment,
-		.preferred_heap = type,
-		.flags = flags,
-	};
-	amdgpu_bo_handle buf_handle;
-	int r;
-
-	r = amdgpu_bo_alloc(device_handle, &req, &buf_handle);
-	igt_assert_eq(r, 0);
-
-	r = amdgpu_va_range_alloc(device_handle,
-				  amdgpu_gpu_va_range_general,
-				  size, alignment, 0, vmc_addr,
-				  va_handle, 0);
-	igt_assert_eq(r, 0);
-
-	r = amdgpu_bo_va_op(buf_handle, 0, size, *vmc_addr, 0, AMDGPU_VA_OP_MAP);
-	igt_assert_eq(r, 0);
-
-	return buf_handle;
-}
-
-static void gpu_mem_free(amdgpu_bo_handle bo,
-			 amdgpu_va_handle va_handle,
-			 uint64_t vmc_addr,
-			 uint64_t size)
-{
-	int r;
-
-	r = amdgpu_bo_va_op(bo, 0, size, vmc_addr, 0, AMDGPU_VA_OP_UNMAP);
-	igt_assert_eq(r, 0);
-
-	r = amdgpu_va_range_free(va_handle);
-	igt_assert_eq(r, 0);
-
-	r = amdgpu_bo_free(bo);
-	igt_assert_eq(r, 0);
-}
-
-static int
-amdgpu_bo_alloc_and_map(amdgpu_device_handle dev, unsigned size,
-			unsigned alignment, unsigned heap, uint64_t flags,
-			amdgpu_bo_handle *bo, void **cpu, uint64_t *mc_address,
-			amdgpu_va_handle *va_handle)
-{
-	struct amdgpu_bo_alloc_request request = {
-		.alloc_size = size,
-		.phys_alignment = alignment,
-		.preferred_heap = heap,
-		.flags = flags,
-	};
-	amdgpu_bo_handle buf_handle;
-	amdgpu_va_handle handle;
-	uint64_t vmc_addr;
-	int r;
-
-	r = amdgpu_bo_alloc(dev, &request, &buf_handle);
-	if (r)
-		return r;
-
-	r = amdgpu_va_range_alloc(dev,
-				  amdgpu_gpu_va_range_general,
-				  size, alignment, 0, &vmc_addr,
-				  &handle, 0);
-	if (r)
-		goto error_va_alloc;
-
-	r = amdgpu_bo_va_op(buf_handle, 0, size, vmc_addr, 0, AMDGPU_VA_OP_MAP);
-	if (r)
-		goto error_va_map;
-
-	r = amdgpu_bo_cpu_map(buf_handle, cpu);
-	if (r)
-		goto error_cpu_map;
-
-	*bo = buf_handle;
-	*mc_address = vmc_addr;
-	*va_handle = handle;
-
-	return 0;
-
-error_cpu_map:
-	amdgpu_bo_cpu_unmap(buf_handle);
-
-error_va_map:
-	amdgpu_bo_va_op(buf_handle, 0, size, vmc_addr, 0, AMDGPU_VA_OP_UNMAP);
 
-error_va_alloc:
-	amdgpu_bo_free(buf_handle);
-	return r;
-}
-
-static void
-amdgpu_bo_unmap_and_free(amdgpu_bo_handle bo, amdgpu_va_handle va_handle,
-			 uint64_t mc_addr, uint64_t size)
-{
-	amdgpu_bo_cpu_unmap(bo);
-	amdgpu_bo_va_op(bo, 0, size, mc_addr, 0, AMDGPU_VA_OP_UNMAP);
-	amdgpu_va_range_free(va_handle);
-	amdgpu_bo_free(bo);
-}
-
-static int
-amdgpu_get_bo_list(amdgpu_device_handle dev, amdgpu_bo_handle bo1,
-		   amdgpu_bo_handle bo2, amdgpu_bo_list_handle *list)
-{
-	amdgpu_bo_handle resources[] = {bo1, bo2};
-
-	return amdgpu_bo_list_create(dev, bo2 ? 2 : 1, resources, NULL, list);
-}
 
-static void amdgpu_memory_alloc(void)
+/**
+ * MEM ALLOC TEST
+ * @param device
+ */
+static void amdgpu_memory_alloc(amdgpu_device_handle device)
 {
 	amdgpu_bo_handle bo;
 	amdgpu_va_handle va_handle;
@@ -339,197 +82,57 @@ static void amdgpu_memory_alloc(void)
 	gpu_mem_free(bo, va_handle, bo_mc, 4096);
 }
 
-static void amdgpu_command_submission_gfx_separate_ibs(void)
-{
-	amdgpu_context_handle context_handle;
-	amdgpu_bo_handle ib_result_handle, ib_result_ce_handle;
-	void *ib_result_cpu, *ib_result_ce_cpu;
-	uint64_t ib_result_mc_address, ib_result_ce_mc_address;
-	struct amdgpu_cs_request ibs_request = {0};
-	struct amdgpu_cs_ib_info ib_info[2];
-	struct amdgpu_cs_fence fence_status = {0};
-	uint32_t *ptr;
-	uint32_t expired;
-	amdgpu_bo_list_handle bo_list;
-	amdgpu_va_handle va_handle, va_handle_ce;
-	int r;
-
-	r = amdgpu_cs_ctx_create(device, &context_handle);
-	igt_assert_eq(r, 0);
-
-	r = amdgpu_bo_alloc_and_map(device, 4096, 4096,
-				    AMDGPU_GEM_DOMAIN_GTT, 0,
-				    &ib_result_handle, &ib_result_cpu,
-				    &ib_result_mc_address, &va_handle);
-	igt_assert_eq(r, 0);
-
-	r = amdgpu_bo_alloc_and_map(device, 4096, 4096,
-				    AMDGPU_GEM_DOMAIN_GTT, 0,
-				    &ib_result_ce_handle, &ib_result_ce_cpu,
-				    &ib_result_ce_mc_address, &va_handle_ce);
-	igt_assert_eq(r, 0);
-
-	r = amdgpu_get_bo_list(device, ib_result_handle,
-			       ib_result_ce_handle, &bo_list);
-	igt_assert_eq(r, 0);
-
-	memset(ib_info, 0, 2 * sizeof(struct amdgpu_cs_ib_info));
-
-	/* IT_SET_CE_DE_COUNTERS */
-	ptr = ib_result_ce_cpu;
-	ptr[0] = 0xc0008900;
-	ptr[1] = 0;
-	ptr[2] = 0xc0008400;
-	ptr[3] = 1;
-	ib_info[0].ib_mc_address = ib_result_ce_mc_address;
-	ib_info[0].size = 4;
-	ib_info[0].flags = AMDGPU_IB_FLAG_CE;
-
-	/* IT_WAIT_ON_CE_COUNTER */
-	ptr = ib_result_cpu;
-	ptr[0] = 0xc0008600;
-	ptr[1] = 0x00000001;
-	ib_info[1].ib_mc_address = ib_result_mc_address;
-	ib_info[1].size = 2;
-
-	ibs_request.ip_type = AMDGPU_HW_IP_GFX;
-	ibs_request.number_of_ibs = 2;
-	ibs_request.ibs = ib_info;
-	ibs_request.resources = bo_list;
-	ibs_request.fence_info.handle = NULL;
-
-	r = amdgpu_cs_submit(context_handle, 0,&ibs_request, 1);
-
-	igt_assert_eq(r, 0);
-
-	fence_status.context = context_handle;
-	fence_status.ip_type = AMDGPU_HW_IP_GFX;
-	fence_status.ip_instance = 0;
-	fence_status.fence = ibs_request.seq_no;
 
-	r = amdgpu_cs_query_fence_status(&fence_status,
-					 AMDGPU_TIMEOUT_INFINITE,
-					 0, &expired);
-	igt_assert_eq(r, 0);
-
-	amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
-				 ib_result_mc_address, 4096);
-	amdgpu_bo_unmap_and_free(ib_result_ce_handle, va_handle_ce,
-				 ib_result_ce_mc_address, 4096);
-
-	r = amdgpu_bo_list_destroy(bo_list);
-	igt_assert_eq(r, 0);
-
-	r = amdgpu_cs_ctx_free(context_handle);
-	igt_assert_eq(r, 0);
-}
-
-static void amdgpu_command_submission_gfx_shared_ib(void)
-{
-	amdgpu_context_handle context_handle;
-	amdgpu_bo_handle ib_result_handle;
-	void *ib_result_cpu;
-	uint64_t ib_result_mc_address;
-	struct amdgpu_cs_request ibs_request = {0};
-	struct amdgpu_cs_ib_info ib_info[2];
-	struct amdgpu_cs_fence fence_status = {0};
-	uint32_t *ptr;
-	uint32_t expired;
-	amdgpu_bo_list_handle bo_list;
-	amdgpu_va_handle va_handle;
-	int r;
-
-	r = amdgpu_cs_ctx_create(device, &context_handle);
-	igt_assert_eq(r, 0);
-
-	r = amdgpu_bo_alloc_and_map(device, 4096, 4096,
-				    AMDGPU_GEM_DOMAIN_GTT, 0,
-				    &ib_result_handle, &ib_result_cpu,
-				    &ib_result_mc_address, &va_handle);
-	igt_assert_eq(r, 0);
-
-	r = amdgpu_get_bo_list(device, ib_result_handle, NULL,
-			       &bo_list);
-	igt_assert_eq(r, 0);
-
-	memset(ib_info, 0, 2 * sizeof(struct amdgpu_cs_ib_info));
-
-	/* IT_SET_CE_DE_COUNTERS */
-	ptr = ib_result_cpu;
-	ptr[0] = 0xc0008900;
-	ptr[1] = 0;
-	ptr[2] = 0xc0008400;
-	ptr[3] = 1;
-	ib_info[0].ib_mc_address = ib_result_mc_address;
-	ib_info[0].size = 4;
-	ib_info[0].flags = AMDGPU_IB_FLAG_CE;
-
-	ptr = (uint32_t *)ib_result_cpu + 4;
-	ptr[0] = 0xc0008600;
-	ptr[1] = 0x00000001;
-	ib_info[1].ib_mc_address = ib_result_mc_address + 16;
-	ib_info[1].size = 2;
-
-	ibs_request.ip_type = AMDGPU_HW_IP_GFX;
-	ibs_request.number_of_ibs = 2;
-	ibs_request.ibs = ib_info;
-	ibs_request.resources = bo_list;
-	ibs_request.fence_info.handle = NULL;
-
-	r = amdgpu_cs_submit(context_handle, 0, &ibs_request, 1);
-
-	igt_assert_eq(r, 0);
-
-	fence_status.context = context_handle;
-	fence_status.ip_type = AMDGPU_HW_IP_GFX;
-	fence_status.ip_instance = 0;
-	fence_status.fence = ibs_request.seq_no;
-
-	r = amdgpu_cs_query_fence_status(&fence_status,
-					 AMDGPU_TIMEOUT_INFINITE,
-					 0, &expired);
-	igt_assert_eq(r, 0);
-
-	amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
-				 ib_result_mc_address, 4096);
-
-	r = amdgpu_bo_list_destroy(bo_list);
-	igt_assert_eq(r, 0);
-
-	r = amdgpu_cs_ctx_free(context_handle);
-	igt_assert_eq(r, 0);
-}
-
-static void amdgpu_command_submission_gfx_cp_write_data(void)
-{
-	amdgpu_command_submission_write_linear_helper(AMDGPU_HW_IP_GFX);
-}
-
-static void amdgpu_command_submission_gfx_cp_const_fill(void)
-{
-	amdgpu_command_submission_const_fill_helper(AMDGPU_HW_IP_GFX);
-}
-
-static void amdgpu_command_submission_gfx_cp_copy_data(void)
+/**
+ * AMDGPU_HW_IP_GFX
+ * @param device
+ */
+static void amdgpu_command_submission_gfx(amdgpu_device_handle device)
 {
-	amdgpu_command_submission_copy_linear_helper(AMDGPU_HW_IP_GFX);
+	/* write data using the CP */
+	amdgpu_command_submission_write_linear_helper(device, get_ip_block(device, AMDGPU_HW_IP_GFX), false);
+	/* const fill using the CP */
+	amdgpu_command_submission_const_fill_helper(device, get_ip_block(device, AMDGPU_HW_IP_GFX));
+	/* copy data using the CP */
+	amdgpu_command_submission_copy_linear_helper(device, get_ip_block(device, AMDGPU_HW_IP_GFX));
+	/* separate IB buffers for multi-IB submission */
+	amdgpu_command_submission_gfx_separate_ibs(device);
+	/* shared IB buffer for multi-IB submission */
+	amdgpu_command_submission_gfx_shared_ib(device);
 }
 
-static void amdgpu_command_submission_gfx(void)
+/**
+ * AMDGPU_HW_IP_COMPUTE
+ * @param device
+ */
+static void amdgpu_command_submission_compute(amdgpu_device_handle device)
 {
 	/* write data using the CP */
-	amdgpu_command_submission_gfx_cp_write_data();
+	amdgpu_command_submission_write_linear_helper(device, get_ip_block(device, AMDGPU_HW_IP_COMPUTE), false);
 	/* const fill using the CP */
-	amdgpu_command_submission_gfx_cp_const_fill();
+	amdgpu_command_submission_const_fill_helper(device, get_ip_block(device, AMDGPU_HW_IP_COMPUTE));
 	/* copy data using the CP */
-	amdgpu_command_submission_gfx_cp_copy_data();
-	/* separate IB buffers for multi-IB submission */
-	amdgpu_command_submission_gfx_separate_ibs();
-	/* shared IB buffer for multi-IB submission */
-	amdgpu_command_submission_gfx_shared_ib();
+	amdgpu_command_submission_copy_linear_helper(device, get_ip_block(device, AMDGPU_HW_IP_COMPUTE));
+	/* nop test */
+	amdgpu_command_submission_compute_nop(device);
 }
 
-static void amdgpu_semaphore_test(void)
+/**
+ * AMDGPU_HW_IP_DMA
+ * @param device
+ */
+static void amdgpu_command_submission_sdma(amdgpu_device_handle device)
+{
+	amdgpu_command_submission_write_linear_helper(device,  get_ip_block(device, AMDGPU_HW_IP_DMA), false);
+	amdgpu_command_submission_const_fill_helper(device,  get_ip_block(device, AMDGPU_HW_IP_DMA));
+	amdgpu_command_submission_copy_linear_helper(device,  get_ip_block(device, AMDGPU_HW_IP_DMA));
+}
+
+/**
+ * SEMAPHORE
+ * @param device
+ */
+static void amdgpu_semaphore_test(amdgpu_device_handle device)
 {
 	amdgpu_context_handle context_handle[2];
 	amdgpu_semaphore_handle sem;
@@ -658,717 +261,92 @@ static void amdgpu_semaphore_test(void)
 	igt_assert_eq(r, 0);
 }
 
-static void amdgpu_command_submission_compute_nop(void)
-{
-	amdgpu_context_handle context_handle;
-	amdgpu_bo_handle ib_result_handle;
-	void *ib_result_cpu;
-	uint64_t ib_result_mc_address;
-	struct amdgpu_cs_request ibs_request;
-	struct amdgpu_cs_ib_info ib_info;
-	struct amdgpu_cs_fence fence_status;
-	struct drm_amdgpu_info_hw_ip info;
-	uint32_t *ptr;
-	uint32_t expired;
-	int r, instance;
-	amdgpu_bo_list_handle bo_list;
-	amdgpu_va_handle va_handle;
-
-	r = amdgpu_query_hw_ip_info(device, AMDGPU_HW_IP_COMPUTE, 0, &info);
-	igt_assert_eq(r, 0);
 
-	r = amdgpu_cs_ctx_create(device, &context_handle);
-	igt_assert_eq(r, 0);
-
-	for (instance = 0; info.available_rings & (1 << instance); instance++) {
-		r = amdgpu_bo_alloc_and_map(device, 4096, 4096,
-					    AMDGPU_GEM_DOMAIN_GTT, 0,
-					    &ib_result_handle, &ib_result_cpu,
-					    &ib_result_mc_address, &va_handle);
-		igt_assert_eq(r, 0);
-
-		r = amdgpu_get_bo_list(device, ib_result_handle, NULL,
-				       &bo_list);
-		igt_assert_eq(r, 0);
-
-		ptr = ib_result_cpu;
-		memset(ptr, 0, 16);
-		ptr[0] = PACKET3(PACKET3_NOP, 14);
-
-		memset(&ib_info, 0, sizeof(struct amdgpu_cs_ib_info));
-		ib_info.ib_mc_address = ib_result_mc_address;
-		ib_info.size = 16;
-
-		memset(&ibs_request, 0, sizeof(struct amdgpu_cs_request));
-		ibs_request.ip_type = AMDGPU_HW_IP_COMPUTE;
-		ibs_request.ring = instance;
-		ibs_request.number_of_ibs = 1;
-		ibs_request.ibs = &ib_info;
-		ibs_request.resources = bo_list;
-		ibs_request.fence_info.handle = NULL;
-
-		memset(&fence_status, 0, sizeof(struct amdgpu_cs_fence));
-		r = amdgpu_cs_submit(context_handle, 0,&ibs_request, 1);
-		igt_assert_eq(r, 0);
-
-		fence_status.context = context_handle;
-		fence_status.ip_type = AMDGPU_HW_IP_COMPUTE;
-		fence_status.ip_instance = 0;
-		fence_status.ring = instance;
-		fence_status.fence = ibs_request.seq_no;
-
-		r = amdgpu_cs_query_fence_status(&fence_status,
-						 AMDGPU_TIMEOUT_INFINITE,
-						 0, &expired);
-		igt_assert_eq(r, 0);
-
-		r = amdgpu_bo_list_destroy(bo_list);
-		igt_assert_eq(r, 0);
-
-		amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
-					 ib_result_mc_address, 4096);
-	}
-
-	r = amdgpu_cs_ctx_free(context_handle);
-	igt_assert_eq(r, 0);
-}
-
-static void amdgpu_command_submission_compute_cp_write_data(void)
-{
-	amdgpu_command_submission_write_linear_helper(AMDGPU_HW_IP_COMPUTE);
-}
-
-static void amdgpu_command_submission_compute_cp_const_fill(void)
-{
-	amdgpu_command_submission_const_fill_helper(AMDGPU_HW_IP_COMPUTE);
-}
-
-static void amdgpu_command_submission_compute_cp_copy_data(void)
-{
-	amdgpu_command_submission_copy_linear_helper(AMDGPU_HW_IP_COMPUTE);
-}
-
-static void amdgpu_command_submission_compute(void)
-{
-	/* write data using the CP */
-	amdgpu_command_submission_compute_cp_write_data();
-	/* const fill using the CP */
-	amdgpu_command_submission_compute_cp_const_fill();
-	/* copy data using the CP */
-	amdgpu_command_submission_compute_cp_copy_data();
-	/* nop test */
-	amdgpu_command_submission_compute_nop();
-}
-
-/*
- * caller need create/release:
- * pm4_src, resources, ib_info, and ibs_request
- * submit command stream described in ibs_request and wait for this IB accomplished
+/**
+ * MULTI FENCE
+ * @param device
  */
-static void amdgpu_test_exec_cs_helper(amdgpu_context_handle context_handle,
-				       unsigned ip_type,
-				       int instance, int pm4_dw, uint32_t *pm4_src,
-				       int res_cnt, amdgpu_bo_handle *resources,
-				       struct amdgpu_cs_ib_info *ib_info,
-				       struct amdgpu_cs_request *ibs_request)
-{
-	int r;
-	uint32_t expired;
-	uint32_t *ring_ptr;
-	amdgpu_bo_handle ib_result_handle;
-	void *ib_result_cpu;
-	uint64_t ib_result_mc_address;
-	struct amdgpu_cs_fence fence_status = {0};
-	amdgpu_bo_handle *all_res = alloca(sizeof(resources[0]) * (res_cnt + 1));
-	amdgpu_va_handle va_handle;
-
-	/* prepare CS */
-	igt_assert(pm4_dw <= 1024);
-
-	/* allocate IB */
-	r = amdgpu_bo_alloc_and_map(device, 4096, 4096,
-				    AMDGPU_GEM_DOMAIN_GTT, 0,
-				    &ib_result_handle, &ib_result_cpu,
-				    &ib_result_mc_address, &va_handle);
-	igt_assert_eq(r, 0);
-
-	/* copy PM4 packet to ring from caller */
-	ring_ptr = ib_result_cpu;
-	memcpy(ring_ptr, pm4_src, pm4_dw * sizeof(*pm4_src));
-
-	ib_info->ib_mc_address = ib_result_mc_address;
-	ib_info->size = pm4_dw;
-
-	ibs_request->ip_type = ip_type;
-	ibs_request->ring = instance;
-	ibs_request->number_of_ibs = 1;
-	ibs_request->ibs = ib_info;
-	ibs_request->fence_info.handle = NULL;
-
-	memcpy(all_res, resources, sizeof(resources[0]) * res_cnt);
-	all_res[res_cnt] = ib_result_handle;
-
-	r = amdgpu_bo_list_create(device, res_cnt+1, all_res,
-				  NULL, &ibs_request->resources);
-	igt_assert_eq(r, 0);
-
-	/* submit CS */
-	r = amdgpu_cs_submit(context_handle, 0, ibs_request, 1);
-	igt_assert_eq(r, 0);
-
-	r = amdgpu_bo_list_destroy(ibs_request->resources);
-	igt_assert_eq(r, 0);
-
-	fence_status.ip_type = ip_type;
-	fence_status.ip_instance = 0;
-	fence_status.ring = ibs_request->ring;
-	fence_status.context = context_handle;
-	fence_status.fence = ibs_request->seq_no;
-
-	/* wait for IB accomplished */
-	r = amdgpu_cs_query_fence_status(&fence_status,
-					 AMDGPU_TIMEOUT_INFINITE,
-					 0, &expired);
-	igt_assert_eq(r, 0);
-	igt_assert_eq(expired, true);
-
-	amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
-				 ib_result_mc_address, 4096);
-}
-
-static void amdgpu_command_submission_write_linear_helper(unsigned ip_type)
-{
-	const int sdma_write_length = 128;
-	const int pm4_dw = 256;
-	amdgpu_context_handle context_handle;
-	amdgpu_bo_handle bo;
-	amdgpu_bo_handle *resources;
-	uint32_t *pm4;
-	struct amdgpu_cs_ib_info *ib_info;
-	struct amdgpu_cs_request *ibs_request;
-	struct amdgpu_gpu_info gpu_info = {0};
-	uint64_t bo_mc;
-	volatile uint32_t *bo_cpu;
-	int i, j, r, loop;
-	uint64_t gtt_flags[2] = {0, AMDGPU_GEM_CREATE_CPU_GTT_USWC};
-	amdgpu_va_handle va_handle;
-
-	r = amdgpu_query_gpu_info(device, &gpu_info);
-	igt_assert_eq(r, 0);
-
-	pm4 = calloc(pm4_dw, sizeof(*pm4));
-	igt_assert(pm4);
-
-	ib_info = calloc(1, sizeof(*ib_info));
-	igt_assert(ib_info);
-
-	ibs_request = calloc(1, sizeof(*ibs_request));
-	igt_assert(ibs_request);
-
-	r = amdgpu_cs_ctx_create(device, &context_handle);
-	igt_assert_eq(r, 0);
-
-	/* prepare resource */
-	resources = calloc(1, sizeof(amdgpu_bo_handle));
-	igt_assert(resources);
-
-	loop = 0;
-	while(loop < 2) {
-		/* allocate UC bo for sDMA use */
-		r = amdgpu_bo_alloc_and_map(device,
-					    sdma_write_length * sizeof(uint32_t),
-					    4096, AMDGPU_GEM_DOMAIN_GTT,
-					    gtt_flags[loop], &bo, (void**)&bo_cpu,
-					    &bo_mc, &va_handle);
-		igt_assert_eq(r, 0);
-
-		/* clear bo */
-		memset((void*)bo_cpu, 0, sdma_write_length * sizeof(uint32_t));
-
-
-		resources[0] = bo;
-
-		/* fulfill PM4: test DMA write-linear */
-		i = j = 0;
-		if (ip_type == AMDGPU_HW_IP_DMA) {
-			pm4[i++] = SDMA_PACKET(SDMA_OPCODE_WRITE,
-					       SDMA_WRITE_SUB_OPCODE_LINEAR, 0);
-			pm4[i++] = 0xffffffff & bo_mc;
-			pm4[i++] = (0xffffffff00000000 & bo_mc) >> 32;
-			if (gpu_info.family_id >= AMDGPU_FAMILY_AI)
-				pm4[i++] = sdma_write_length - 1;
-			else
-				pm4[i++] = sdma_write_length;
-			while(j++ < sdma_write_length)
-				pm4[i++] = 0xdeadbeaf;
-		} else if ((ip_type == AMDGPU_HW_IP_GFX) ||
-			   (ip_type == AMDGPU_HW_IP_COMPUTE)) {
-			pm4[i++] = PACKET3(PACKET3_WRITE_DATA, 2 + sdma_write_length);
-			pm4[i++] = WRITE_DATA_DST_SEL(5) | WR_CONFIRM;
-			pm4[i++] = 0xfffffffc & bo_mc;
-			pm4[i++] = (0xffffffff00000000 & bo_mc) >> 32;
-			while(j++ < sdma_write_length)
-				pm4[i++] = 0xdeadbeaf;
-		}
-
-		amdgpu_test_exec_cs_helper(context_handle,
-					   ip_type, 0,
-					   i, pm4,
-					   1, resources,
-					   ib_info, ibs_request);
-
-		/* verify if SDMA test result meets with expected */
-		i = 0;
-		while(i < sdma_write_length) {
-			igt_assert_eq(bo_cpu[i++], 0xdeadbeaf);
-		}
-
-		amdgpu_bo_unmap_and_free(bo, va_handle, bo_mc,
-					 sdma_write_length * sizeof(uint32_t));
-		loop++;
-	}
-	/* clean resources */
-	free(resources);
-	free(ibs_request);
-	free(ib_info);
-	free(pm4);
-
-	/* end of test */
-	r = amdgpu_cs_ctx_free(context_handle);
-	igt_assert_eq(r, 0);
-}
-
-static void amdgpu_command_submission_sdma_write_linear(void)
-{
-	amdgpu_command_submission_write_linear_helper(AMDGPU_HW_IP_DMA);
-}
-
-static void amdgpu_command_submission_const_fill_helper(unsigned ip_type)
-{
-	const int sdma_write_length = 1024 * 1024;
-	const int pm4_dw = 256;
-	amdgpu_context_handle context_handle;
-	amdgpu_bo_handle bo;
-	amdgpu_bo_handle *resources;
-	uint32_t *pm4;
-	struct amdgpu_cs_ib_info *ib_info;
-	struct amdgpu_cs_request *ibs_request;
-	struct amdgpu_gpu_info gpu_info = {0};
-	uint64_t bo_mc;
-	volatile uint32_t *bo_cpu;
-	int i, j, r, loop;
-	uint64_t gtt_flags[2] = {0, AMDGPU_GEM_CREATE_CPU_GTT_USWC};
-	amdgpu_va_handle va_handle;
-
-	r = amdgpu_query_gpu_info(device, &gpu_info);
-	igt_assert_eq(r, 0);
-
-	pm4 = calloc(pm4_dw, sizeof(*pm4));
-	igt_assert(pm4);
-
-	ib_info = calloc(1, sizeof(*ib_info));
-	igt_assert(ib_info);
-
-	ibs_request = calloc(1, sizeof(*ibs_request));
-	igt_assert(ibs_request);
-
-	r = amdgpu_cs_ctx_create(device, &context_handle);
-	igt_assert_eq(r, 0);
-
-	/* prepare resource */
-	resources = calloc(1, sizeof(amdgpu_bo_handle));
-	igt_assert(resources);
-
-	loop = 0;
-	while(loop < 2) {
-		/* allocate UC bo for sDMA use */
-		r = amdgpu_bo_alloc_and_map(device,
-					    sdma_write_length, 4096,
-					    AMDGPU_GEM_DOMAIN_GTT,
-					    gtt_flags[loop], &bo, (void**)&bo_cpu,
-					    &bo_mc, &va_handle);
-		igt_assert_eq(r, 0);
-
-		/* clear bo */
-		memset((void*)bo_cpu, 0, sdma_write_length);
-
-		resources[0] = bo;
-
-		/* fulfill PM4: test DMA const fill */
-		i = j = 0;
-		if (ip_type == AMDGPU_HW_IP_DMA) {
-			pm4[i++] = SDMA_PACKET(SDMA_OPCODE_CONSTANT_FILL, 0,
-					       SDMA_CONSTANT_FILL_EXTRA_SIZE(2));
-			pm4[i++] = 0xffffffff & bo_mc;
-			pm4[i++] = (0xffffffff00000000 & bo_mc) >> 32;
-			pm4[i++] = 0xdeadbeaf;
-			if (gpu_info.family_id >= AMDGPU_FAMILY_AI)
-				pm4[i++] = sdma_write_length - 1;
-			else
-				pm4[i++] = sdma_write_length;
-		} else if ((ip_type == AMDGPU_HW_IP_GFX) ||
-			   (ip_type == AMDGPU_HW_IP_COMPUTE)) {
-			pm4[i++] = PACKET3(PACKET3_DMA_DATA, 5);
-			pm4[i++] = PACKET3_DMA_DATA_ENGINE(0) |
-				PACKET3_DMA_DATA_DST_SEL(0) |
-				PACKET3_DMA_DATA_SRC_SEL(2) |
-				PACKET3_DMA_DATA_CP_SYNC;
-			pm4[i++] = 0xdeadbeaf;
-			pm4[i++] = 0;
-			pm4[i++] = 0xfffffffc & bo_mc;
-			pm4[i++] = (0xffffffff00000000 & bo_mc) >> 32;
-			pm4[i++] = sdma_write_length;
-		}
-
-		amdgpu_test_exec_cs_helper(context_handle,
-					   ip_type, 0,
-					   i, pm4,
-					   1, resources,
-					   ib_info, ibs_request);
-
-		/* verify if SDMA test result meets with expected */
-		i = 0;
-		while(i < (sdma_write_length / 4)) {
-			igt_assert_eq(bo_cpu[i++], 0xdeadbeaf);
-		}
-
-		amdgpu_bo_unmap_and_free(bo, va_handle, bo_mc,
-					 sdma_write_length);
-		loop++;
-	}
-	/* clean resources */
-	free(resources);
-	free(ibs_request);
-	free(ib_info);
-	free(pm4);
-
-	/* end of test */
-	r = amdgpu_cs_ctx_free(context_handle);
-	igt_assert_eq(r, 0);
-}
-
-static void amdgpu_command_submission_sdma_const_fill(void)
+static void amdgpu_command_submission_multi_fence(amdgpu_device_handle device)
 {
-	amdgpu_command_submission_const_fill_helper(AMDGPU_HW_IP_DMA);
+	amdgpu_command_submission_multi_fence_wait_all(device, true);
+	amdgpu_command_submission_multi_fence_wait_all(device, false);
 }
 
-static void amdgpu_command_submission_copy_linear_helper(unsigned ip_type)
+static void amdgpu_userptr_test(amdgpu_device_handle device)
 {
-	const int sdma_write_length = 1024;
 	const int pm4_dw = 256;
-	amdgpu_context_handle context_handle;
-	amdgpu_bo_handle bo1, bo2;
-	amdgpu_bo_handle *resources;
-	uint32_t *pm4;
-	struct amdgpu_cs_ib_info *ib_info;
-	struct amdgpu_cs_request *ibs_request;
-	struct amdgpu_gpu_info gpu_info = {0};
-	uint64_t bo1_mc, bo2_mc;
-	volatile unsigned char *bo1_cpu, *bo2_cpu;
-	int i, j, r, loop1, loop2;
-	uint64_t gtt_flags[2] = {0, AMDGPU_GEM_CREATE_CPU_GTT_USWC};
-	amdgpu_va_handle bo1_va_handle, bo2_va_handle;
-
-	r = amdgpu_query_gpu_info(device, &gpu_info);
-	igt_assert_eq(r, 0);
-
-	pm4 = calloc(pm4_dw, sizeof(*pm4));
-	igt_assert(pm4);
+	const int sdma_write_length = 4;
 
-	ib_info = calloc(1, sizeof(*ib_info));
-	igt_assert(ib_info);
-
-	ibs_request = calloc(1, sizeof(*ibs_request));
-	igt_assert(ibs_request);
-
-	r = amdgpu_cs_ctx_create(device, &context_handle);
-	igt_assert_eq(r, 0);
-
-	/* prepare resource */
-	resources = calloc(2, sizeof(amdgpu_bo_handle));
-	igt_assert(resources);
-
-	loop1 = loop2 = 0;
-	/* run 9 circle to test all mapping combination */
-	while(loop1 < 2) {
-		while(loop2 < 2) {
-			/* allocate UC bo1for sDMA use */
-			r = amdgpu_bo_alloc_and_map(device,
-						    sdma_write_length, 4096,
-						    AMDGPU_GEM_DOMAIN_GTT,
-						    gtt_flags[loop1], &bo1,
-						    (void**)&bo1_cpu, &bo1_mc,
-						    &bo1_va_handle);
-			igt_assert_eq(r, 0);
-
-			/* set bo1 */
-			memset((void*)bo1_cpu, 0xaa, sdma_write_length);
-
-			/* allocate UC bo2 for sDMA use */
-			r = amdgpu_bo_alloc_and_map(device,
-						    sdma_write_length, 4096,
-						    AMDGPU_GEM_DOMAIN_GTT,
-						    gtt_flags[loop2], &bo2,
-						    (void**)&bo2_cpu, &bo2_mc,
-						    &bo2_va_handle);
-			igt_assert_eq(r, 0);
-
-			/* clear bo2 */
-			memset((void*)bo2_cpu, 0, sdma_write_length);
-
-			resources[0] = bo1;
-			resources[1] = bo2;
-
-			/* fulfill PM4: test DMA copy linear */
-			i = j = 0;
-			if (ip_type == AMDGPU_HW_IP_DMA) {
-				pm4[i++] = SDMA_PACKET(SDMA_OPCODE_COPY, SDMA_COPY_SUB_OPCODE_LINEAR, 0);
-				if (gpu_info.family_id >= AMDGPU_FAMILY_AI)
-					pm4[i++] = sdma_write_length - 1;
-				else
-					pm4[i++] = sdma_write_length;
-				pm4[i++] = 0;
-				pm4[i++] = 0xffffffff & bo1_mc;
-				pm4[i++] = (0xffffffff00000000 & bo1_mc) >> 32;
-				pm4[i++] = 0xffffffff & bo2_mc;
-				pm4[i++] = (0xffffffff00000000 & bo2_mc) >> 32;
-			} else if ((ip_type == AMDGPU_HW_IP_GFX) ||
-				   (ip_type == AMDGPU_HW_IP_COMPUTE)) {
-				pm4[i++] = PACKET3(PACKET3_DMA_DATA, 5);
-				pm4[i++] = PACKET3_DMA_DATA_ENGINE(0) |
-					PACKET3_DMA_DATA_DST_SEL(0) |
-					PACKET3_DMA_DATA_SRC_SEL(0) |
-					PACKET3_DMA_DATA_CP_SYNC;
-				pm4[i++] = 0xfffffffc & bo1_mc;
-				pm4[i++] = (0xffffffff00000000 & bo1_mc) >> 32;
-				pm4[i++] = 0xfffffffc & bo2_mc;
-				pm4[i++] = (0xffffffff00000000 & bo2_mc) >> 32;
-				pm4[i++] = sdma_write_length;
-			}
-
-			amdgpu_test_exec_cs_helper(context_handle,
-						   ip_type, 0,
-						   i, pm4,
-						   2, resources,
-						   ib_info, ibs_request);
-
-			/* verify if SDMA test result meets with expected */
-			i = 0;
-			while(i < sdma_write_length) {
-				igt_assert_eq(bo2_cpu[i++], 0xaa);
-			}
-
-			amdgpu_bo_unmap_and_free(bo1, bo1_va_handle, bo1_mc,
-						 sdma_write_length);
-			amdgpu_bo_unmap_and_free(bo2, bo2_va_handle, bo2_mc,
-						 sdma_write_length);
-			loop2++;
-		}
-		loop1++;
-	}
-	/* clean resources */
-	free(resources);
-	free(ibs_request);
-	free(ib_info);
-	free(pm4);
-
-	/* end of test */
-	r = amdgpu_cs_ctx_free(context_handle);
-	igt_assert_eq(r, 0);
-}
-
-static void amdgpu_command_submission_sdma_copy_linear(void)
-{
-	amdgpu_command_submission_copy_linear_helper(AMDGPU_HW_IP_DMA);
-}
-
-static void amdgpu_command_submission_sdma(void)
-{
-	amdgpu_command_submission_sdma_write_linear();
-	amdgpu_command_submission_sdma_const_fill();
-	amdgpu_command_submission_sdma_copy_linear();
-}
-
-static void amdgpu_command_submission_multi_fence_wait_all(bool wait_all)
-{
-	amdgpu_context_handle context_handle;
-	amdgpu_bo_handle ib_result_handle, ib_result_ce_handle;
-	void *ib_result_cpu, *ib_result_ce_cpu;
-	uint64_t ib_result_mc_address, ib_result_ce_mc_address;
-	struct amdgpu_cs_request ibs_request[2] = {};
-	struct amdgpu_cs_ib_info ib_info[2];
-	struct amdgpu_cs_fence fence_status[2] = {};
-	uint32_t *ptr;
-	uint32_t expired;
-	amdgpu_bo_list_handle bo_list;
-	amdgpu_va_handle va_handle, va_handle_ce;
+	struct amdgpu_ring_context *ring_context;
 	int r;
-	int i, ib_cs_num = 2;
 
-	r = amdgpu_cs_ctx_create(device, &context_handle);
-	igt_assert_eq(r, 0);
+	const struct amdgpu_ip_block_version * ip_block = get_ip_block(device, AMDGPU_HW_IP_DMA);
+	igt_assert(ip_block);
+	ring_context = calloc(1, sizeof(*ring_context));
+	igt_assert(ring_context);
 
-	r = amdgpu_bo_alloc_and_map(device, 4096, 4096,
-				    AMDGPU_GEM_DOMAIN_GTT, 0,
-				    &ib_result_handle, &ib_result_cpu,
-				    &ib_result_mc_address, &va_handle);
-	igt_assert_eq(r, 0);
-
-	r = amdgpu_bo_alloc_and_map(device, 4096, 4096,
-				    AMDGPU_GEM_DOMAIN_GTT, 0,
-				    &ib_result_ce_handle, &ib_result_ce_cpu,
-				    &ib_result_ce_mc_address, &va_handle_ce);
-	igt_assert_eq(r, 0);
-
-	r = amdgpu_get_bo_list(device, ib_result_handle,
-			       ib_result_ce_handle, &bo_list);
-	igt_assert_eq(r, 0);
+	/* setup parameters */
 
-	memset(ib_info, 0, 2 * sizeof(struct amdgpu_cs_ib_info));
-
-	/* IT_SET_CE_DE_COUNTERS */
-	ptr = ib_result_ce_cpu;
-	ptr[0] = 0xc0008900;
-	ptr[1] = 0;
-	ptr[2] = 0xc0008400;
-	ptr[3] = 1;
-	ib_info[0].ib_mc_address = ib_result_ce_mc_address;
-	ib_info[0].size = 4;
-	ib_info[0].flags = AMDGPU_IB_FLAG_CE;
-
-	/* IT_WAIT_ON_CE_COUNTER */
-	ptr = ib_result_cpu;
-	ptr[0] = 0xc0008600;
-	ptr[1] = 0x00000001;
-	ib_info[1].ib_mc_address = ib_result_mc_address;
-	ib_info[1].size = 2;
-
-	for (i = 0; i < ib_cs_num; i++) {
-		ibs_request[i].ip_type = AMDGPU_HW_IP_GFX;
-		ibs_request[i].number_of_ibs = 2;
-		ibs_request[i].ibs = ib_info;
-		ibs_request[i].resources = bo_list;
-		ibs_request[i].fence_info.handle = NULL;
-	}
-
-	r = amdgpu_cs_submit(context_handle, 0,ibs_request, ib_cs_num);
+	ring_context->write_length =  sdma_write_length;
+	ring_context->pm4 = calloc(pm4_dw, sizeof(*ring_context->pm4));
+	ring_context->secure = false;
+	ring_context->pm4_size = pm4_dw;
+	ring_context->res_cnt = 1;
+	igt_assert(ring_context->pm4);
 
+	r = amdgpu_cs_ctx_create(device, &ring_context->context_handle);
 	igt_assert_eq(r, 0);
 
-	for (i = 0; i < ib_cs_num; i++) {
-		fence_status[i].context = context_handle;
-		fence_status[i].ip_type = AMDGPU_HW_IP_GFX;
-		fence_status[i].fence = ibs_request[i].seq_no;
-	}
+	posix_memalign((void**)&ring_context->bo_cpu, sysconf(_SC_PAGE_SIZE), BUFFER_SIZE);
+	igt_assert(ring_context->bo_cpu);
+	memset((void*)ring_context->bo_cpu, 0, BUFFER_SIZE);
 
-	r = amdgpu_cs_wait_fences(fence_status, ib_cs_num, wait_all,
-				  AMDGPU_TIMEOUT_INFINITE,
-				  &expired, NULL);
+	r = amdgpu_create_bo_from_user_mem(device,
+					   (void*)ring_context->bo_cpu,
+					   BUFFER_SIZE, &ring_context->bo);
 	igt_assert_eq(r, 0);
 
-	amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
-				 ib_result_mc_address, 4096);
+	ring_context->resources[0] = ring_context->bo;
 
-	amdgpu_bo_unmap_and_free(ib_result_ce_handle, va_handle_ce,
-				 ib_result_ce_mc_address, 4096);
 
-	r = amdgpu_bo_list_destroy(bo_list);
-	igt_assert_eq(r, 0);
+	r = amdgpu_va_range_alloc(device,
+				  amdgpu_gpu_va_range_general,
+				  BUFFER_SIZE, 1, 0, &ring_context->bo_mc,
+				  &ring_context->va_handle, 0);
 
-	r = amdgpu_cs_ctx_free(context_handle);
 	igt_assert_eq(r, 0);
-}
 
-static void amdgpu_command_submission_multi_fence(void)
-{
-	amdgpu_command_submission_multi_fence_wait_all(true);
-	amdgpu_command_submission_multi_fence_wait_all(false);
-}
-
-static void amdgpu_userptr_test(void)
-{
-	int i, r, j;
-	uint32_t *pm4 = NULL;
-	uint64_t bo_mc;
-	void *ptr = NULL;
-	int pm4_dw = 256;
-	int sdma_write_length = 4;
-	amdgpu_bo_handle handle;
-	amdgpu_context_handle context_handle;
-	struct amdgpu_cs_ib_info *ib_info;
-	struct amdgpu_cs_request *ibs_request;
-	amdgpu_bo_handle buf_handle;
-	amdgpu_va_handle va_handle;
+	r = amdgpu_bo_va_op(ring_context->bo, 0, BUFFER_SIZE, ring_context->bo_mc, 0, AMDGPU_VA_OP_MAP);
 
-	pm4 = calloc(pm4_dw, sizeof(*pm4));
-	igt_assert(pm4);
-
-	ib_info = calloc(1, sizeof(*ib_info));
-	igt_assert(ib_info);
-
-	ibs_request = calloc(1, sizeof(*ibs_request));
-	igt_assert(ibs_request);
-
-	r = amdgpu_cs_ctx_create(device, &context_handle);
 	igt_assert_eq(r, 0);
 
-	posix_memalign(&ptr, sysconf(_SC_PAGE_SIZE), BUFFER_SIZE);
-	igt_assert(ptr);
-	memset(ptr, 0, BUFFER_SIZE);
+	ip_block->funcs->write_linear(ip_block->funcs, ring_context, &ring_context->pm4_dw);
 
-	r = amdgpu_create_bo_from_user_mem(device,
-					   ptr, BUFFER_SIZE, &buf_handle);
-	igt_assert_eq(r, 0);
-
-	r = amdgpu_va_range_alloc(device,
-				  amdgpu_gpu_va_range_general,
-				  BUFFER_SIZE, 1, 0, &bo_mc,
-				  &va_handle, 0);
-	igt_assert_eq(r, 0);
+	 amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context);
 
-	r = amdgpu_bo_va_op(buf_handle, 0, BUFFER_SIZE, bo_mc, 0, AMDGPU_VA_OP_MAP);
+	r = ip_block->funcs->compare(ip_block->funcs, ring_context, 1);
 	igt_assert_eq(r, 0);
 
-	handle = buf_handle;
-
-	j = i = 0;
-	pm4[i++] = SDMA_PACKET(SDMA_OPCODE_WRITE,
-			       SDMA_WRITE_SUB_OPCODE_LINEAR, 0);
-	pm4[i++] = 0xffffffff & bo_mc;
-	pm4[i++] = (0xffffffff00000000 & bo_mc) >> 32;
-	pm4[i++] = sdma_write_length;
-
-	while (j++ < sdma_write_length)
-		pm4[i++] = 0xdeadbeaf;
-
-	amdgpu_test_exec_cs_helper(context_handle,
-				   AMDGPU_HW_IP_DMA, 0,
-				   i, pm4,
-				   1, &handle,
-				   ib_info, ibs_request);
-	i = 0;
-	while (i < sdma_write_length) {
-		igt_assert_eq(((int*)ptr)[i++], 0xdeadbeaf);
-	}
-	free(ibs_request);
-	free(ib_info);
-	free(pm4);
-
-	r = amdgpu_bo_va_op(buf_handle, 0, BUFFER_SIZE, bo_mc, 0, AMDGPU_VA_OP_UNMAP);
+	r = amdgpu_bo_va_op(ring_context->bo, 0, BUFFER_SIZE, ring_context->bo_mc, 0, AMDGPU_VA_OP_UNMAP);
 	igt_assert_eq(r, 0);
-	r = amdgpu_va_range_free(va_handle);
+	r = amdgpu_va_range_free(ring_context->va_handle);
 	igt_assert_eq(r, 0);
-	r = amdgpu_bo_free(buf_handle);
+	r = amdgpu_bo_free(ring_context->bo);
 	igt_assert_eq(r, 0);
-	free(ptr);
 
-	r = amdgpu_cs_ctx_free(context_handle);
+	r = amdgpu_cs_ctx_free(ring_context->context_handle);
 	igt_assert_eq(r, 0);
+
+	free(ring_context->pm4);
+	free(ring_context);
 }
 
 igt_main
 {
+	amdgpu_device_handle device;
+	struct amdgpu_gpu_info gpu_info = {0};
 	int fd = -1;
+	int r;
 
 	igt_fixture {
 		uint32_t major, minor;
@@ -1381,28 +359,34 @@ igt_main
 
 		igt_info("Initialized amdgpu, driver version %d.%d\n",
 			 major, minor);
+
+		r = amdgpu_query_gpu_info(device, &gpu_info);
+		igt_assert_eq(r, 0);
+		r = setup_amdgpu_ip_blocks( major, minor,  &gpu_info, device);
+		igt_assert_eq(r, 0);
+
 	}
 
 	igt_subtest("memory-alloc")
-		amdgpu_memory_alloc();
+		amdgpu_memory_alloc(device);
 
 	igt_subtest("userptr")
-		amdgpu_userptr_test();
+		amdgpu_userptr_test(device);
 
 	igt_subtest("cs-gfx")
-		amdgpu_command_submission_gfx();
+		amdgpu_command_submission_gfx(device);
 
 	igt_subtest("cs-compute")
-		amdgpu_command_submission_compute();
+		amdgpu_command_submission_compute(device);
 
 	igt_subtest("cs-multi-fence")
-		amdgpu_command_submission_multi_fence();
+		amdgpu_command_submission_multi_fence(device);
 
 	igt_subtest("cs-sdma")
-		amdgpu_command_submission_sdma();
+		amdgpu_command_submission_sdma(device);
 
 	igt_subtest("semaphore")
-		amdgpu_semaphore_test();
+		amdgpu_semaphore_test(device);
 
 	igt_fixture {
 		amdgpu_device_deinitialize(device);
-- 
2.25.1
