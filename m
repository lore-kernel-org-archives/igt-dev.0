Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E2A410E495
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 02:55:08 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 9 Aug 2023 22:54:54 -0400
Message-ID: <20230810025454.194484-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH] tests/amdgpu: misc fixes for basic tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: alexander.deucher@amd.com, luben.tuikov@amd.com, christian.koenig@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

1. Some ASICs may not have GFX IP. Added  function
   is_rings_available and use IGT dynamic features.
2. In functions amdgpu_command_submission_const_fill_helper
   and amdgpu_command_submission_copy_linear_helper were
   missing an outer FOR loop for iterating of each ring.
3. Properly formatted code to meet IGT guidelines.

Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_command_submission.c | 111 ++++++++++--------
 lib/amdgpu/amd_ip_blocks.c          | 144 +++++++++++------------
 lib/amdgpu/amd_ip_blocks.h          |  42 +++----
 tests/amdgpu/amd_basic.c            | 173 ++++++++++++++++++----------
 4 files changed, 257 insertions(+), 213 deletions(-)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index de393209b..3f3b190ef 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -34,7 +34,7 @@
  * submit command stream described in ibs_request and wait for this IB accomplished
  */
 
-void amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned ip_type,
+void amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_type,
 				struct amdgpu_ring_context *ring_context)
 {
 	int r;
@@ -141,19 +141,20 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
 
 	for (ring_id = 0; (1 << ring_id) & ring_context->hw_ip_info.available_rings; ring_id++) {
 		loop = 0;
-		while(loop < 2) {
+		ring_context->ring_id = ring_id;
+		while (loop < 2) {
 			/* allocate UC bo for sDMA use */
 			r = amdgpu_bo_alloc_and_map(device,
 						    ring_context->write_length * sizeof(uint32_t),
 						    4096, AMDGPU_GEM_DOMAIN_GTT,
 						    gtt_flags[loop], &ring_context->bo,
-						    (void**)&ring_context->bo_cpu,
+						    (void **)&ring_context->bo_cpu,
 						    &ring_context->bo_mc,
 						    &ring_context->va_handle);
 			igt_assert_eq(r, 0);
 
 			/* clear bo */
-			memset((void*)ring_context->bo_cpu, 0, ring_context->write_length * sizeof(uint32_t));
+			memset((void *)ring_context->bo_cpu, 0, ring_context->write_length * sizeof(uint32_t));
 
 			ring_context->resources[0] = ring_context->bo;
 
@@ -215,7 +216,7 @@ void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
 	const int pm4_dw = 256;
 
 	struct amdgpu_ring_context *ring_context;
-	int r, loop;
+	int r, loop, ring_id;
 
 	uint64_t gtt_flags[2] = {0, AMDGPU_GEM_CREATE_CPU_GTT_USWC};
 
@@ -226,38 +227,42 @@ void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
 	ring_context->pm4_size = pm4_dw;
 	ring_context->res_cnt = 1;
 	igt_assert(ring_context->pm4);
+	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &ring_context->hw_ip_info);
+	igt_assert_eq(r, 0);
 
 	r = amdgpu_cs_ctx_create(device, &ring_context->context_handle);
 	igt_assert_eq(r, 0);
-
-	/* prepare resource */
-	loop = 0;
-	while(loop < 2) {
-		/* allocate UC bo for sDMA use */
-		r = amdgpu_bo_alloc_and_map(device,
+	for (ring_id = 0; (1 << ring_id) & ring_context->hw_ip_info.available_rings; ring_id++) {
+		/* prepare resource */
+		loop = 0;
+		ring_context->ring_id = ring_id;
+		while (loop < 2) {
+			/* allocate UC bo for sDMA use */
+			r = amdgpu_bo_alloc_and_map(device,
 					    ring_context->write_length, 4096,
 					    AMDGPU_GEM_DOMAIN_GTT,
-					    gtt_flags[loop], &ring_context->bo, (void**)&ring_context->bo_cpu,
+					    gtt_flags[loop], &ring_context->bo, (void **)&ring_context->bo_cpu,
 					    &ring_context->bo_mc, &ring_context->va_handle);
-		igt_assert_eq(r, 0);
+			igt_assert_eq(r, 0);
 
-		/* clear bo */
-		memset((void*)ring_context->bo_cpu, 0, ring_context->write_length);
+			/* clear bo */
+			memset((void *)ring_context->bo_cpu, 0, ring_context->write_length);
 
-		ring_context->resources[0] = ring_context->bo;
+			ring_context->resources[0] = ring_context->bo;
 
-		/* fulfill PM4: test DMA const fill */
-		ip_block->funcs->const_fill(ip_block->funcs, ring_context, &ring_context->pm4_dw);
+			/* fulfill PM4: test DMA const fill */
+			ip_block->funcs->const_fill(ip_block->funcs, ring_context, &ring_context->pm4_dw);
 
-		amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context);
+			amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context);
 
-		/* verify if SDMA test result meets with expected */
-		r = ip_block->funcs->compare(ip_block->funcs, ring_context, 4);
-		igt_assert_eq(r, 0);
+			/* verify if SDMA test result meets with expected */
+			r = ip_block->funcs->compare(ip_block->funcs, ring_context, 4);
+			igt_assert_eq(r, 0);
 
-		amdgpu_bo_unmap_and_free(ring_context->bo, ring_context->va_handle, ring_context->bo_mc,
+			amdgpu_bo_unmap_and_free(ring_context->bo, ring_context->va_handle, ring_context->bo_mc,
 					 ring_context->write_length);
-		loop++;
+			loop++;
+		}
 	}
 	/* clean resources */
 	free(ring_context->pm4);
@@ -280,7 +285,7 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
 	const int pm4_dw = 256;
 
 	struct amdgpu_ring_context *ring_context;
-	int r, loop1, loop2;
+	int r, loop1, loop2, ring_id;
 
 	uint64_t gtt_flags[2] = {0, AMDGPU_GEM_CREATE_CPU_GTT_USWC};
 
@@ -292,58 +297,62 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
 	ring_context->pm4_size = pm4_dw;
 	ring_context->res_cnt = 2;
 	igt_assert(ring_context->pm4);
+	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &ring_context->hw_ip_info);
+	igt_assert_eq(r, 0);
 
 
 	r = amdgpu_cs_ctx_create(device, &ring_context->context_handle);
 	igt_assert_eq(r, 0);
 
-
-	loop1 = loop2 = 0;
+	for (ring_id = 0; (1 << ring_id) & ring_context->hw_ip_info.available_rings; ring_id++) {
+		loop1 = loop2 = 0;
+		ring_context->ring_id = ring_id;
 	/* run 9 circle to test all mapping combination */
-	while(loop1 < 2) {
-		while(loop2 < 2) {
+		while (loop1 < 2) {
+			while (loop2 < 2) {
 			/* allocate UC bo1for sDMA use */
-			r = amdgpu_bo_alloc_and_map(device,
+				r = amdgpu_bo_alloc_and_map(device,
 						    ring_context->write_length, 4096,
 						    AMDGPU_GEM_DOMAIN_GTT,
 						    gtt_flags[loop1], &ring_context->bo,
-						    (void**)&ring_context->bo_cpu, &ring_context->bo_mc,
+						    (void **)&ring_context->bo_cpu, &ring_context->bo_mc,
 						    &ring_context->va_handle);
-			igt_assert_eq(r, 0);
+				igt_assert_eq(r, 0);
 
-			/* set bo_cpu */
-			memset((void*)ring_context->bo_cpu, ip_block->funcs->pattern, ring_context->write_length);
+				/* set bo_cpu */
+				memset((void *)ring_context->bo_cpu, ip_block->funcs->pattern, ring_context->write_length);
 
-			/* allocate UC bo2 for sDMA use */
-			r = amdgpu_bo_alloc_and_map(device,
+				/* allocate UC bo2 for sDMA use */
+				r = amdgpu_bo_alloc_and_map(device,
 						    ring_context->write_length, 4096,
 						    AMDGPU_GEM_DOMAIN_GTT,
 						    gtt_flags[loop2], &ring_context->bo2,
-						    (void**)&ring_context->bo2_cpu, &ring_context->bo_mc2,
+						    (void **)&ring_context->bo2_cpu, &ring_context->bo_mc2,
 						    &ring_context->va_handle2);
-			igt_assert_eq(r, 0);
+				igt_assert_eq(r, 0);
 
-			/* clear bo2_cpu */
-			memset((void*)ring_context->bo2_cpu, 0, ring_context->write_length);
+				/* clear bo2_cpu */
+				memset((void *)ring_context->bo2_cpu, 0, ring_context->write_length);
 
-			ring_context->resources[0] = ring_context->bo;
-			ring_context->resources[1] = ring_context->bo2;
+				ring_context->resources[0] = ring_context->bo;
+				ring_context->resources[1] = ring_context->bo2;
 
-			ip_block->funcs->copy_linear(ip_block->funcs, ring_context, &ring_context->pm4_dw);
+				ip_block->funcs->copy_linear(ip_block->funcs, ring_context, &ring_context->pm4_dw);
 
-			amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context);
+				amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context);
 
-			/* verify if SDMA test result meets with expected */
-			r = ip_block->funcs->compare_pattern(ip_block->funcs, ring_context, 4);
-			igt_assert_eq(r, 0);
+				/* verify if SDMA test result meets with expected */
+				r = ip_block->funcs->compare_pattern(ip_block->funcs, ring_context, 4);
+				igt_assert_eq(r, 0);
 
-			amdgpu_bo_unmap_and_free(ring_context->bo, ring_context->va_handle, ring_context->bo_mc,
+				amdgpu_bo_unmap_and_free(ring_context->bo, ring_context->va_handle, ring_context->bo_mc,
 						 ring_context->write_length);
-			amdgpu_bo_unmap_and_free(ring_context->bo2, ring_context->va_handle2, ring_context->bo_mc2,
+				amdgpu_bo_unmap_and_free(ring_context->bo2, ring_context->va_handle2, ring_context->bo_mc2,
 						 ring_context->write_length);
-			loop2++;
+				loop2++;
+			}
+			loop1++;
 		}
-		loop1++;
 	}
 	/* clean resources */
 	free(ring_context->pm4);
diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 44768ba64..67bba8e84 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -1,27 +1,10 @@
-/* SPDX-License-Identifier: MIT
+// SPDX-License-Identifier: MIT
+/*
  * Copyright 2014 Advanced Micro Devices, Inc.
  * Copyright 2022 Advanced Micro Devices, Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- *
+ * Copyright 2023 Advanced Micro Devices, Inc.
  */
+
 #include <fcntl.h>
 
 #include "amd_memory.h"
@@ -67,7 +50,7 @@ sdma_ring_write_linear(const struct amdgpu_ip_funcs *func,
 		else
 			ring_context->pm4[i++] = ring_context->write_length;
 
-		while(j++ < ring_context->write_length)
+		while (j++ < ring_context->write_length)
 			ring_context->pm4[i++] = func->deadbeaf;
 	} else {
 		memset(ring_context->pm4, 0, ring_context->pm4_size * sizeof(uint32_t));
@@ -90,7 +73,7 @@ sdma_ring_write_linear(const struct amdgpu_ip_funcs *func,
 		ring_context->pm4[i++] = 0x100;
 	}
 
- 	*pm4_dw = i;
+	*pm4_dw = i;
 
 	return 0;
 }
@@ -157,7 +140,7 @@ sdma_ring_copy_linear(const struct amdgpu_ip_funcs *func,
 		context->pm4[i++] = (0xffffffff00000000 & context->bo_mc2) >> 32;
 	}
 
- 	*pm4_dw = i;
+	*pm4_dw = i;
 
 	return 0;
 }
@@ -174,20 +157,20 @@ static int
 gfx_ring_write_linear(const struct amdgpu_ip_funcs *func,
 		      const struct amdgpu_ring_context *ring_context,
 		      uint32_t *pm4_dw)
- {
- 	uint32_t i, j;
-
- 	i = 0;
- 	j = 0;
-
- 	if (ring_context->secure == false) {
- 		ring_context->pm4[i++] = PACKET3(PACKET3_WRITE_DATA, 2 +  ring_context->write_length);
- 		ring_context->pm4[i++] = WRITE_DATA_DST_SEL(5) | WR_CONFIRM;
- 		ring_context->pm4[i++] = 0xfffffffc & ring_context->bo_mc;
- 		ring_context->pm4[i++] = (0xffffffff00000000 & ring_context->bo_mc) >> 32;
- 		while(j++ < ring_context->write_length)
- 			ring_context->pm4[i++] = func->deadbeaf;
- 	} else {
+{
+	uint32_t i, j;
+
+	i = 0;
+	j = 0;
+
+	if (ring_context->secure == false) {
+		ring_context->pm4[i++] = PACKET3(PACKET3_WRITE_DATA, 2 +  ring_context->write_length);
+		ring_context->pm4[i++] = WRITE_DATA_DST_SEL(5) | WR_CONFIRM;
+		ring_context->pm4[i++] = 0xfffffffc & ring_context->bo_mc;
+		ring_context->pm4[i++] = (0xffffffff00000000 & ring_context->bo_mc) >> 32;
+		while (j++ < ring_context->write_length)
+			ring_context->pm4[i++] = func->deadbeaf;
+	} else {
 		memset(ring_context->pm4, 0, ring_context->pm4_size * sizeof(uint32_t));
 		ring_context->pm4[i++] = PACKET3(PACKET3_ATOMIC_MEM, 7);
 
@@ -207,21 +190,21 @@ gfx_ring_write_linear(const struct amdgpu_ip_funcs *func,
 		ring_context->pm4[i++] = 0xdeadbeaf;
 		ring_context->pm4[i++] = 0x0;
 		ring_context->pm4[i++] = 0x100;
- 	}
+	}
 
- 	*pm4_dw = i;
+	*pm4_dw = i;
 
- 	return 0;
- }
+	return 0;
+}
 
- static int
- gfx_ring_const_fill(const struct amdgpu_ip_funcs *func,
+static int
+gfx_ring_const_fill(const struct amdgpu_ip_funcs *func,
 		     const struct amdgpu_ring_context *ring_context,
 		     uint32_t *pm4_dw)
- {
- 	uint32_t i;
+{
+	uint32_t i;
 
- 	i = 0;
+	i = 0;
 	if (func->family_id == AMDGPU_FAMILY_SI) {
 		ring_context->pm4[i++] = PACKET3(PACKET3_DMA_DATA_SI, 4);
 		ring_context->pm4[i++] = func->deadbeaf;
@@ -244,19 +227,19 @@ gfx_ring_write_linear(const struct amdgpu_ip_funcs *func,
 		ring_context->pm4[i++] = (0xffffffff00000000 & ring_context->bo_mc) >> 32;
 		ring_context->pm4[i++] = ring_context->write_length;
 	}
- 	*pm4_dw = i;
+	*pm4_dw = i;
 
- 	return 0;
- }
+	return 0;
+}
 
 static int
 gfx_ring_copy_linear(const struct amdgpu_ip_funcs *func,
 		     const struct amdgpu_ring_context *context,
 		     uint32_t *pm4_dw)
 {
- 	uint32_t i;
+	uint32_t i;
 
- 	i = 0;
+	i = 0;
 	if (func->family_id == AMDGPU_FAMILY_SI) {
 		context->pm4[i++] = PACKET3(PACKET3_DMA_DATA_SI, 4);
 		context->pm4[i++] = 0xfffffffc & context->bo_mc;
@@ -281,7 +264,7 @@ gfx_ring_copy_linear(const struct amdgpu_ip_funcs *func,
 		context->pm4[i++] = context->write_length;
 	}
 
- 	*pm4_dw = i;
+	*pm4_dw = i;
 
 	return 0;
 }
@@ -295,7 +278,7 @@ x_compare(const struct amdgpu_ip_funcs *func,
 
 	int num_compare = ring_context->write_length/div;
 
-	while(i < num_compare) {
+	while (i < num_compare) {
 		if (ring_context->bo_cpu[i++] != func->deadbeaf) {
 			ret = -1;
 			break;
@@ -312,7 +295,7 @@ x_compare_pattern(const struct amdgpu_ip_funcs *func,
 
 	int num_compare = ring_context->write_length/div;
 
-	while(i < num_compare) {
+	while (i < num_compare) {
 		if (ring_context->bo_cpu[i++] != func->pattern) {
 			ret = -1;
 			break;
@@ -374,9 +357,9 @@ const struct amdgpu_ip_block_version sdma_v3_x_ip_block = {
 };
 
 struct chip_info {
-	  const char *name;
-	  enum radeon_family family;
-	  enum chip_class chip_class;
+	const char *name;
+	enum radeon_family family;
+	enum chip_class chip_class;
 	  amdgpu_device_handle dev;
 };
 
@@ -403,7 +386,7 @@ get_ip_block(amdgpu_device_handle device, enum amd_ip_block_type type)
 	if (g_chip.dev != device)
 		return NULL;
 
-	for(i = 0; i <  amdgpu_ips.num_ip_blocks; i++)
+	for (i = 0; i <  amdgpu_ips.num_ip_blocks; i++)
 		if (amdgpu_ips.ip_blocks[i]->type == type)
 			return amdgpu_ips.ip_blocks[i];
 	return NULL;
@@ -451,14 +434,14 @@ cmd_attach_buf(struct amdgpu_cmd_base  *base, void *ptr, uint32_t size_bytes)
 static void
 cmd_emit(struct amdgpu_cmd_base  *base, uint32_t value)
 {
-	assert(base->cdw <  base->max_dw  );
+	assert(base->cdw <  base->max_dw);
 	base->buf[base->cdw++] = value;
 }
 
 static void
 cmd_emit_aligned(struct amdgpu_cmd_base *base, uint32_t mask, uint32_t cmd)
 {
-	while(base->cdw & mask)
+	while (base->cdw & mask)
 		base->emit(base, cmd);
 }
 static void
@@ -470,7 +453,7 @@ cmd_emit_buf(struct amdgpu_cmd_base  *base, const void *ptr, uint32_t offset_byt
 	assert(size_bytes % 4 == 0); /* no gaps */
 	assert(offset_bytes % 4 == 0);
 	assert(base->cdw + total_offset_dw <  base->max_dw);
-	memcpy(base->buf + base->cdw + offset_dw , ptr, size_bytes);
+	memcpy(base->buf + base->cdw + offset_dw, ptr, size_bytes);
 	base->cdw += total_offset_dw;
 }
 
@@ -494,7 +477,7 @@ cmd_emit_at_offset(struct amdgpu_cmd_base  *base, uint32_t value, uint32_t offse
 struct amdgpu_cmd_base *
 get_cmd_base(void)
 {
-	struct amdgpu_cmd_base *base = calloc(1 ,sizeof(*base));
+	struct amdgpu_cmd_base *base = calloc(1, sizeof(*base));
 
 	base->cdw = 0;
 	base->max_dw = 0;
@@ -504,7 +487,7 @@ get_cmd_base(void)
 	base->allocate_buf = cmd_allocate_buf;
 	base->attach_buf = cmd_attach_buf;
 	base->emit = cmd_emit;
-	base->emit_aligned= cmd_emit_aligned;
+	base->emit_aligned = cmd_emit_aligned;
 	base->emit_repeat = cmd_emit_repeat;
 	base->emit_at_offset = cmd_emit_at_offset;
 	base->emit_buf = cmd_emit_buf;
@@ -513,7 +496,7 @@ get_cmd_base(void)
 }
 
 void
-free_cmd_base(struct amdgpu_cmd_base * base)
+free_cmd_base(struct amdgpu_cmd_base *base)
 {
 	if (base) {
 		if (base->buf && base->is_assigned_buf == false)
@@ -546,11 +529,14 @@ free_cmd_base(struct amdgpu_cmd_base * base)
 int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_info *amdinfo,
 			   amdgpu_device_handle device)
 {
-#define identify_chip2(asic, chipname)			\
-   if (ASICREV_IS(amdinfo->chip_external_rev, asic)) {	\
-      info->family = CHIP_##chipname;			\
-      info->name = #chipname;				\
-   }
+#define identify_chip2(asic, chipname)	\
+	do {\
+		if (ASICREV_IS(amdinfo->chip_external_rev, asic)) {\
+			info->family = CHIP_##chipname;	\
+			info->name = #chipname;	\
+		} \
+	} while (0)
+
 #define identify_chip(chipname) identify_chip2(chipname, chipname)
 
 	const struct chip_class_arr {
@@ -662,7 +648,7 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
 	igt_assert_eq(chip_class_arr[info->chip_class].class, info->chip_class);
 	igt_info("amdgpu: chip_class %s\n", chip_class_arr[info->chip_class].name);
 
-	switch(info->chip_class) {
+	switch (info->chip_class) {
 	case GFX6:
 		break;
 	case GFX7: /* tested */
@@ -684,7 +670,7 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
 	default:
 		igt_info("amdgpu: GFX or old.\n");
 		return -1;
-	 }
+	}
 	info->dev = device;
 
 	return 0;
@@ -759,3 +745,17 @@ amdgpu_open_devices(bool open_render_node, int  max_cards_supported, int drm_amd
 	drmFreeDevices(devices, drm_count);
 	return amd_index;
 }
+
+bool
+is_rings_available(amdgpu_device_handle device_handle, uint32_t mask,
+		enum amd_ip_block_type type)
+{
+	struct drm_amdgpu_info_hw_ip hw_ip_info = {0};
+	int r;
+	bool ret = false;
+
+	r = amdgpu_query_hw_ip_info(device_handle, type, 0, &hw_ip_info);
+	igt_assert_eq(r, 0);
+	ret = hw_ip_info.available_rings & mask;
+	return ret;
+}
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 14e33c423..dcba8a380 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -1,27 +1,9 @@
 /* SPDX-License-Identifier: MIT
  * Copyright 2014 Advanced Micro Devices, Inc.
  * Copyright 2022 Advanced Micro Devices, Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- *
+ * Copyright 2023 Advanced Micro Devices, Inc.
  */
+
 #ifndef AMD_IP_BLOCKS_H
 #define AMD_IP_BLOCKS_H
 
@@ -30,11 +12,15 @@
 #define MAX_CARDS_SUPPORTED 4
 
 enum amd_ip_block_type {
-	AMD_IP_GFX,
+	AMD_IP_GFX = 0,
 	AMD_IP_COMPUTE,
 	AMD_IP_DMA,
 	AMD_IP_UVD,
 	AMD_IP_VCE,
+	AMD_IP_UVD_ENC,
+	AMD_IP_VCN_DEC,
+	AMD_IP_VCN_ENC,
+	AMD_IP_VCN_JPEG,
 	AMD_IP_MAX,
 };
 
@@ -45,9 +31,9 @@ struct amdgpu_ring_context {
 	int res_cnt; /* num of bo in amdgpu_bo_handle resources[2] */
 
 	uint32_t write_length;  /* length of data */
-	uint32_t *pm4; 		/* data of the packet */
-	uint32_t pm4_size; 	/* max allocated packet size */
-	bool secure; 		/* secure or not */
+	uint32_t *pm4;		/* data of the packet */
+	uint32_t pm4_size;	/* max allocated packet size */
+	bool secure;		/* secure or not */
 
 	uint64_t bo_mc;		/* result from amdgpu_bo_alloc_and_map */
 	uint64_t bo_mc2;	/* result from amdgpu_bo_alloc_and_map */
@@ -128,17 +114,21 @@ struct amdgpu_cmd_base {
 	int (*allocate_buf)(struct amdgpu_cmd_base  *base, uint32_t size);
 	int (*attach_buf)(struct amdgpu_cmd_base  *base, void *ptr, uint32_t size_bytes);
 	void (*emit)(struct amdgpu_cmd_base  *base, uint32_t value);
-	void (*emit_aligned)(struct amdgpu_cmd_base  *base,uint32_t mask, uint32_t value);
+	void (*emit_aligned)(struct amdgpu_cmd_base  *base, uint32_t mask, uint32_t value);
 	void (*emit_repeat)(struct amdgpu_cmd_base  *base, uint32_t value, uint32_t number_of_times);
 	void (*emit_at_offset)(struct amdgpu_cmd_base  *base, uint32_t value, uint32_t offset_dwords);
 	void (*emit_buf)(struct amdgpu_cmd_base  *base, const void *ptr, uint32_t offset_bytes, uint32_t size_bytes);
 };
 
-struct amdgpu_cmd_base* get_cmd_base(void);
+struct amdgpu_cmd_base *get_cmd_base(void);
 
 void free_cmd_base(struct amdgpu_cmd_base *base);
 
 int
 amdgpu_open_devices(bool open_render_node, int max_cards_supported, int drm_amdgpu_fds[]);
 
+bool
+is_rings_available(amdgpu_device_handle device_handle, uint32_t mask,
+		enum amd_ip_block_type type);
+
 #endif
diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index f7d7f036f..6e54a0e4f 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -1,26 +1,8 @@
-/* SPDX-License-Identifier: MIT
+// SPDX-License-Identifier: MIT
+/*
  * Copyright 2014 Advanced Micro Devices, Inc.
  * Copyright 2022 Advanced Micro Devices, Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- * Based on libdrm/tests/amdgpu/basic_tests.c
+ * Copyright 2023 Advanced Micro Devices, Inc.
  */
 
 #include "lib/amdgpu/amd_memory.h"
@@ -174,7 +156,7 @@ static void amdgpu_semaphore_test(amdgpu_device_handle device)
 	ibs_request[0].ibs = &ib_info[0];
 	ibs_request[0].resources = bo_list[0];
 	ibs_request[0].fence_info.handle = NULL;
-	r = amdgpu_cs_submit(context_handle[0], 0,&ibs_request[0], 1);
+	r = amdgpu_cs_submit(context_handle[0], 0, &ibs_request[0], 1);
 	igt_assert_eq(r, 0);
 	r = amdgpu_cs_signal_semaphore(context_handle[0], AMDGPU_HW_IP_DMA, 0, 0, sem);
 	igt_assert_eq(r, 0);
@@ -192,7 +174,7 @@ static void amdgpu_semaphore_test(amdgpu_device_handle device)
 	ibs_request[1].resources = bo_list[1];
 	ibs_request[1].fence_info.handle = NULL;
 
-	r = amdgpu_cs_submit(context_handle[0], 0,&ibs_request[1], 1);
+	r = amdgpu_cs_submit(context_handle[0], 0, &ibs_request[1], 1);
 	igt_assert_eq(r, 0);
 
 	fence_status.context = context_handle[0];
@@ -215,7 +197,7 @@ static void amdgpu_semaphore_test(amdgpu_device_handle device)
 	ibs_request[0].ibs = &ib_info[0];
 	ibs_request[0].resources = bo_list[0];
 	ibs_request[0].fence_info.handle = NULL;
-	r = amdgpu_cs_submit(context_handle[0], 0,&ibs_request[0], 1);
+	r = amdgpu_cs_submit(context_handle[0], 0, &ibs_request[0], 1);
 	igt_assert_eq(r, 0);
 	r = amdgpu_cs_signal_semaphore(context_handle[0], AMDGPU_HW_IP_GFX, 0, 0, sem);
 	igt_assert_eq(r, 0);
@@ -232,7 +214,7 @@ static void amdgpu_semaphore_test(amdgpu_device_handle device)
 	ibs_request[1].ibs = &ib_info[1];
 	ibs_request[1].resources = bo_list[1];
 	ibs_request[1].fence_info.handle = NULL;
-	r = amdgpu_cs_submit(context_handle[1], 0,&ibs_request[1], 1);
+	r = amdgpu_cs_submit(context_handle[1], 0, &ibs_request[1], 1);
 
 	igt_assert_eq(r, 0);
 
@@ -278,7 +260,8 @@ static void amdgpu_userptr_test(amdgpu_device_handle device)
 	struct amdgpu_ring_context *ring_context;
 	int r;
 
-	const struct amdgpu_ip_block_version * ip_block = get_ip_block(device, AMDGPU_HW_IP_DMA);
+	const struct amdgpu_ip_block_version *ip_block = get_ip_block(device, AMDGPU_HW_IP_DMA);
+
 	igt_assert(ip_block);
 	ring_context = calloc(1, sizeof(*ring_context));
 	igt_assert(ring_context);
@@ -295,12 +278,12 @@ static void amdgpu_userptr_test(amdgpu_device_handle device)
 	r = amdgpu_cs_ctx_create(device, &ring_context->context_handle);
 	igt_assert_eq(r, 0);
 
-	posix_memalign((void**)&ring_context->bo_cpu, sysconf(_SC_PAGE_SIZE), BUFFER_SIZE);
+	posix_memalign((void **)&ring_context->bo_cpu, sysconf(_SC_PAGE_SIZE), BUFFER_SIZE);
 	igt_assert(ring_context->bo_cpu);
-	memset((void*)ring_context->bo_cpu, 0, BUFFER_SIZE);
+	memset((void *)ring_context->bo_cpu, 0, BUFFER_SIZE);
 
 	r = amdgpu_create_bo_from_user_mem(device,
-					   (void*)ring_context->bo_cpu,
+					   (void *)ring_context->bo_cpu,
 					   BUFFER_SIZE, &ring_context->bo);
 	igt_assert_eq(r, 0);
 
@@ -352,7 +335,8 @@ amdgpu_bo_eviction_test(amdgpu_device_handle device_handle)
 
 	uint64_t gtt_flags[2] = {0, AMDGPU_GEM_CREATE_CPU_GTT_USWC};
 
-	const struct amdgpu_ip_block_version * ip_block = get_ip_block(device_handle, AMDGPU_HW_IP_DMA);
+	const struct amdgpu_ip_block_version *ip_block = get_ip_block(device_handle, AMDGPU_HW_IP_DMA);
+
 	igt_assert(ip_block);
 
 	ring_context = calloc(1, sizeof(*ring_context));
@@ -392,31 +376,31 @@ amdgpu_bo_eviction_test(amdgpu_device_handle device_handle)
 
 	loop1 = loop2 = 0;
 	/* run 9 circle to test all mapping combination */
-	while(loop1 < 2) {
-		while(loop2 < 2) {
+	while (loop1 < 2) {
+		while (loop2 < 2) {
 			/* allocate UC bo1for sDMA use */
 			r = amdgpu_bo_alloc_and_map(device_handle,
 						    sdma_write_length, 4096,
 						    AMDGPU_GEM_DOMAIN_GTT,
 						    gtt_flags[loop1],  &ring_context->bo,
-						    (void**)&ring_context->bo_cpu, &ring_context->bo_mc,
+						    (void **)&ring_context->bo_cpu, &ring_context->bo_mc,
 						    &ring_context->va_handle);
 			igt_assert_eq(r, 0);
 
 			/* set bo1 */
-			memset((void*)ring_context->bo_cpu, ip_block->funcs->pattern, ring_context->write_length);
+			memset((void *)ring_context->bo_cpu, ip_block->funcs->pattern, ring_context->write_length);
 
 			/* allocate UC bo2 for sDMA use */
 			r = amdgpu_bo_alloc_and_map(device_handle,
 						    sdma_write_length, 4096,
 						    AMDGPU_GEM_DOMAIN_GTT,
 						    gtt_flags[loop2], &ring_context->bo2,
-						    (void**)&ring_context->bo2_cpu, &ring_context->bo_mc2,
+						    (void **)&ring_context->bo2_cpu, &ring_context->bo_mc2,
 						    &ring_context->va_handle2);
 			igt_assert_eq(r, 0);
 
 			/* clear bo2 */
-			memset((void*)ring_context->bo2_cpu, 0, ring_context->write_length);
+			memset((void *)ring_context->bo2_cpu, 0, ring_context->write_length);
 
 			ring_context->resources[0] = ring_context->bo;
 			ring_context->resources[1] = ring_context->bo2;
@@ -474,8 +458,8 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle)
 	uint32_t size_bytes, code_offset, data_offset;
 	const uint32_t *shader;
 
-	struct amdgpu_cmd_base * base = get_cmd_base();
-	const struct amdgpu_ip_block_version * ip_block = get_ip_block(device_handle, AMD_IP_GFX);
+	struct amdgpu_cmd_base *base = get_cmd_base();
+	const struct amdgpu_ip_block_version *ip_block = get_ip_block(device_handle, AMD_IP_GFX);
 
 	r = amdgpu_cs_ctx_create(device_handle, &context_handle[0]);
 	igt_assert_eq(r, 0);
@@ -513,7 +497,7 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle)
 	base->emit(base, (ib_result_mc_address + code_offset * 4) >> 8);
 	base->emit(base, (ib_result_mc_address + code_offset * 4) >> 40);
 
-	base->emit(base,PACKET3(PKT3_SET_SH_REG, 2));
+	base->emit(base, PACKET3(PKT3_SET_SH_REG, 2));
 	base->emit(base, ip_block->funcs->get_reg_offset(COMPUTE_PGM_RSRC1));
 
 	base->emit(base, 0x002c0040);
@@ -546,7 +530,7 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle)
 	base->emit(base, 0x00000045);
 	base->emit_aligned(base, 7, GFX_COMPUTE_NOP);
 
-	memcpy(base->buf + code_offset , shader, size_bytes);
+	memcpy(base->buf + code_offset, shader, size_bytes);
 
 	memset(&ib_info, 0, sizeof(struct amdgpu_cs_ib_info));
 	ib_info.ib_mc_address = ib_result_mc_address;
@@ -560,7 +544,7 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle)
 	ibs_request.resources = bo_list;
 	ibs_request.fence_info.handle = NULL;
 
-	r = amdgpu_cs_submit(context_handle[1], 0,&ibs_request, 1);
+	r = amdgpu_cs_submit(context_handle[1], 0, &ibs_request, 1);
 	igt_assert_eq(r, 0);
 	seq_no = ibs_request.seq_no;
 
@@ -593,7 +577,7 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle)
 	ibs_request.dependencies[0].ring = 0;
 	ibs_request.dependencies[0].fence = seq_no;
 
-	r = amdgpu_cs_submit(context_handle[0], 0,&ibs_request, 1);
+	r = amdgpu_cs_submit(context_handle[0], 0, &ibs_request, 1);
 	igt_assert_eq(r, 0);
 
 	memset(&fence_status, 0, sizeof(struct amdgpu_cs_fence));
@@ -604,7 +588,7 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle)
 	fence_status.fence = ibs_request.seq_no;
 
 	r = amdgpu_cs_query_fence_status(&fence_status,
-		       AMDGPU_TIMEOUT_INFINITE,0, &expired);
+		       AMDGPU_TIMEOUT_INFINITE, 0, &expired);
 	igt_assert_eq(r, 0);
 
 	/* Expect the second command to wait for shader to complete */
@@ -635,12 +619,23 @@ amdgpu_gfx_dispatch_test_compute(amdgpu_device_handle device_handle)
 	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE);
 }
 
+static void
+amdgpu_asic_rings_caps(amdgpu_device_handle device_handle, bool *arr, uint32_t mask)
+{
+	enum amd_ip_block_type ip;
+	int i;
+
+	for (i = 0, ip = AMD_IP_GFX; ip < AMD_IP_MAX; ip++)
+		arr[i++] = is_rings_available(device_handle, mask, ip);
+}
+
 igt_main
 {
 	amdgpu_device_handle device;
 	struct amdgpu_gpu_info gpu_info = {0};
 	int fd = -1;
 	int r;
+	bool arr_cap[AMD_IP_MAX] = {0};
 
 	igt_fixture {
 		uint32_t major, minor;
@@ -656,43 +651,93 @@ igt_main
 
 		r = amdgpu_query_gpu_info(device, &gpu_info);
 		igt_assert_eq(r, 0);
-		r = setup_amdgpu_ip_blocks( major, minor,  &gpu_info, device);
+		r = setup_amdgpu_ip_blocks(major, minor,  &gpu_info, device);
 		igt_assert_eq(r, 0);
+		amdgpu_asic_rings_caps(device, arr_cap, 1);
 
 	}
-
 	igt_subtest("memory-alloc")
 		amdgpu_memory_alloc(device);
 
-	igt_subtest("userptr")
-		amdgpu_userptr_test(device);
+	igt_describe("userptr");
+	igt_subtest_with_dynamic("userptr-with-IP-DMA") {
+		if (arr_cap[AMD_IP_DMA]) {
+			igt_dynamic_f("userptr")
+			amdgpu_userptr_test(device);
+		}
+	}
 
-	igt_subtest("cs-gfx")
-		amdgpu_command_submission_gfx(device);
+	igt_describe("cs-gfx");
+	igt_subtest_with_dynamic("cs-gfx-with-IP-GFX") {
+		if (arr_cap[AMD_IP_GFX]) {
+			igt_dynamic_f("cs-gfx")
+			amdgpu_command_submission_gfx(device);
+		}
+	}
 
-	igt_subtest("cs-compute")
-		amdgpu_command_submission_compute(device);
+	igt_describe("cs-compute");
+	igt_subtest_with_dynamic("cs-compute-with-IP-COMPUTE") {
+		if (arr_cap[AMD_IP_COMPUTE]) {
+			igt_dynamic_f("cs-compute")
+			amdgpu_command_submission_compute(device);
+		}
+	}
 
-	igt_subtest("cs-multi-fence")
+	igt_describe("cs-multi-fence");
+	igt_subtest_with_dynamic("cs-multi-fence-with-IP-GFX") {
+		if (arr_cap[AMD_IP_GFX]) {
+			igt_dynamic_f("cs-multi-fence")
 		amdgpu_command_submission_multi_fence(device);
+		}
+	}
 
-	igt_subtest("cs-sdma")
-		amdgpu_command_submission_sdma(device);
+	igt_describe("cs-sdma");
+	igt_subtest_with_dynamic("cs-sdma-with-IP-DMA") {
+		if (arr_cap[AMD_IP_DMA]) {
+			igt_dynamic_f("cs-sdma")
+			amdgpu_command_submission_sdma(device);
+		}
+	}
 
-	igt_subtest("semaphore")
-		amdgpu_semaphore_test(device);
+	igt_describe("semaphore");
+	igt_subtest_with_dynamic("semaphore-with-IP-GFX-and-IP-DMA") {
+		if (arr_cap[AMD_IP_GFX] && arr_cap[AMD_IP_DMA]) {
+			igt_dynamic_f("semaphore")
+			amdgpu_semaphore_test(device);
+		}
+	}
 
-	igt_subtest("eviction_test")
-		amdgpu_bo_eviction_test(device);
+	igt_describe("eviction-test");
+	igt_subtest_with_dynamic("eviction-test-with-IP-DMA") {
+		if (arr_cap[AMD_IP_DMA]) {
+			igt_dynamic_f("eviction_test")
+			amdgpu_bo_eviction_test(device);
+		}
+	}
 
-	igt_subtest("sync_dependency_test")
-		amdgpu_sync_dependency_test(device);
+	igt_describe("sync-dependency-test");
+	igt_subtest_with_dynamic("sync-dependency-test-with-IP-GFX") {
+		if (arr_cap[AMD_IP_GFX]) {
+			igt_dynamic_f("sync-dependency-test")
+			amdgpu_sync_dependency_test(device);
+		}
+	}
 
-	igt_subtest("amdgpu_gfx_dispatch_test_compute")
-	amdgpu_gfx_dispatch_test_compute(device);
+	igt_describe("amdgpu-dispatch-test-compute");
+	igt_subtest_with_dynamic("amdgpu-dispatch-test-compute-with-IP-COMPUTE") {
+		if (arr_cap[AMD_IP_COMPUTE]) {
+			igt_dynamic_f("amdgpu-dispatch-test-compute")
+			amdgpu_gfx_dispatch_test_compute(device);
+		}
+	}
 
-	igt_subtest("amdgpu_gfx_dispatch_test_gfx")
-	amdgpu_gfx_dispatch_test_gfx(device);
+	igt_describe("amdgpu-dispatch-test-gfx");
+	igt_subtest_with_dynamic("amdgpu-dispatch-test-gfx-with-IP-GFX") {
+		if (arr_cap[AMD_IP_GFX]) {
+			igt_dynamic_f("amdgpu-dispatch-test-gfx")
+			amdgpu_gfx_dispatch_test_gfx(device);
+		}
+	}
 
 	igt_fixture {
 		amdgpu_device_deinitialize(device);
-- 
2.25.1
