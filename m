Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C608D11AD38
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Jul 2022 18:22:26 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 7 Jul 2022 14:22:03 -0400
Message-ID: <20220707182207.3736-3-vitaly.prosyak@amd.com>
In-Reply-To: <20220707182207.3736-1-vitaly.prosyak@amd.com>
References: <20220707182207.3736-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 3/7] tests/amdgpu: add memory eviction test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: alexander.deucher@amd.com, marek.olsak@amd.com, christian.koenig@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Allocate max possible VRAM and GTT memory and
then do DMA transfer between buffers combinations
which causes the evictions.

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_basic.c | 113 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index db531f29..679a8b0f 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -341,6 +341,116 @@ static void amdgpu_userptr_test(amdgpu_device_handle device)
 	free(ring_context);
 }
 
+static void
+amdgpu_bo_eviction_test(amdgpu_device_handle device_handle)
+{
+	const int sdma_write_length = 1024;
+	const int pm4_dw = 256;
+
+	struct amdgpu_ring_context *ring_context;
+	struct amdgpu_heap_info vram_info, gtt_info;
+	int r, loop1, loop2;
+
+
+	uint64_t gtt_flags[2] = {0, AMDGPU_GEM_CREATE_CPU_GTT_USWC};
+
+	const struct amdgpu_ip_block_version * ip_block = get_ip_block(device_handle, AMDGPU_HW_IP_DMA);
+	igt_assert(ip_block);
+
+	ring_context = calloc(1, sizeof(*ring_context));
+	ring_context->write_length =  sdma_write_length;
+	ring_context->pm4 = calloc(pm4_dw, sizeof(*ring_context->pm4));
+	ring_context->secure = false;
+	ring_context->pm4_size = pm4_dw;
+	ring_context->res_cnt = 4;
+	igt_assert(ring_context->pm4);
+
+	r = amdgpu_cs_ctx_create(device_handle, &ring_context->context_handle);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_query_heap_info(device_handle, AMDGPU_GEM_DOMAIN_VRAM,
+				   0, &vram_info);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_alloc_wrap(device_handle, vram_info.max_allocation, 4096,
+				 AMDGPU_GEM_DOMAIN_VRAM, 0, &ring_context->boa_vram[0]);
+	igt_assert_eq(r, 0);
+	r = amdgpu_bo_alloc_wrap(device_handle, vram_info.max_allocation, 4096,
+				 AMDGPU_GEM_DOMAIN_VRAM, 0, &ring_context->boa_vram[1]);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_query_heap_info(device_handle, AMDGPU_GEM_DOMAIN_GTT,
+				   0, &gtt_info);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_alloc_wrap(device_handle, gtt_info.max_allocation, 4096,
+				 AMDGPU_GEM_DOMAIN_GTT, 0, &ring_context->boa_gtt[0]);
+	igt_assert_eq(r, 0);
+	r = amdgpu_bo_alloc_wrap(device_handle, gtt_info.max_allocation, 4096,
+				 AMDGPU_GEM_DOMAIN_GTT, 0, &ring_context->boa_gtt[1]);
+	igt_assert_eq(r, 0);
+
+
+
+	loop1 = loop2 = 0;
+	/* run 9 circle to test all mapping combination */
+	while(loop1 < 2) {
+		while(loop2 < 2) {
+			/* allocate UC bo1for sDMA use */
+			r = amdgpu_bo_alloc_and_map(device_handle,
+						    sdma_write_length, 4096,
+						    AMDGPU_GEM_DOMAIN_GTT,
+						    gtt_flags[loop1],  &ring_context->bo,
+						    (void**)&ring_context->bo_cpu, &ring_context->bo_mc,
+						    &ring_context->va_handle);
+			igt_assert_eq(r, 0);
+
+			/* set bo1 */
+			memset((void*)ring_context->bo_cpu, ip_block->funcs->pattern, ring_context->write_length);
+
+			/* allocate UC bo2 for sDMA use */
+			r = amdgpu_bo_alloc_and_map(device_handle,
+						    sdma_write_length, 4096,
+						    AMDGPU_GEM_DOMAIN_GTT,
+						    gtt_flags[loop2], &ring_context->bo2,
+						    (void**)&ring_context->bo2_cpu, &ring_context->bo_mc2,
+						    &ring_context->va_handle2);
+			igt_assert_eq(r, 0);
+
+			/* clear bo2 */
+			memset((void*)ring_context->bo2_cpu, 0, ring_context->write_length);
+
+			ring_context->resources[0] = ring_context->bo;
+			ring_context->resources[1] = ring_context->bo2;
+
+			ring_context->resources[2] = ring_context->boa_vram[loop2];
+			ring_context->resources[3] = ring_context->boa_gtt[loop2];
+			ip_block->funcs->copy_linear(ip_block->funcs, ring_context, &ring_context->pm4_dw);
+			amdgpu_test_exec_cs_helper(device_handle, ip_block->type, ring_context);
+			/* fulfill PM4: test DMA copy linear */
+			r = ip_block->funcs->compare_pattern(ip_block->funcs, ring_context, sdma_write_length);
+			amdgpu_bo_unmap_and_free(ring_context->bo, ring_context->va_handle, ring_context->bo_mc,
+						 ring_context->write_length);
+			amdgpu_bo_unmap_and_free(ring_context->bo2, ring_context->va_handle2, ring_context->bo_mc2,
+						 ring_context->write_length);
+
+			loop2++;
+		}
+		loop2 = 0;
+		loop1++;
+	}
+	amdgpu_bo_free(ring_context->boa_vram[0]);
+	amdgpu_bo_free(ring_context->boa_vram[1]);
+	amdgpu_bo_free(ring_context->boa_gtt[0]);
+	amdgpu_bo_free(ring_context->boa_gtt[1]);
+	/* clean resources */
+
+	/* end of test */
+	r = amdgpu_cs_ctx_free(ring_context->context_handle);
+	igt_assert_eq(r, 0);
+	free(ring_context);
+}
+
 igt_main
 {
 	amdgpu_device_handle device;
@@ -388,6 +498,9 @@ igt_main
 	igt_subtest("semaphore")
 		amdgpu_semaphore_test(device);
 
+	igt_subtest("eviction_test")
+		amdgpu_bo_eviction_test(device);
+
 	igt_fixture {
 		amdgpu_device_deinitialize(device);
 		close(fd);
-- 
2.25.1
