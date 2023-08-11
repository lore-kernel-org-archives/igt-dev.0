Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71DD910E700
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 21:28:13 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 11 Aug 2023 17:28:01 -0400
Message-ID: <20230811212801.85404-2-vitaly.prosyak@amd.com>
In-Reply-To: <20230811212801.85404-1-vitaly.prosyak@amd.com>
References: <20230811212801.85404-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 2/2] tests/amdgpu: misc fixes for basic tests
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

1. Some ASICs may not have GFX IP. For such ASIC the test
   would be skipped and the reason would be printed.
   Added  function is_rings_available and use IGT dynamic
   features.
2. In functions amdgpu_command_submission_const_fill_helper
   and amdgpu_command_submission_copy_linear_helper were
   missing an outer FOR loop for iterating of each ring.

   v2
    - Split formatting code into separate patch (Kamil)

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Acked-by: Christian Koenig <christian.koenig@amd.com>
---
 lib/amdgpu/amd_command_submission.c |  98 +++++++++++++++------------
 lib/amdgpu/amd_ip_blocks.c          |  23 +++++--
 lib/amdgpu/amd_ip_blocks.h          |  10 ++-
 tests/amdgpu/amd_basic.c            | 101 ++++++++++++++++++++++------
 4 files changed, 163 insertions(+), 69 deletions(-)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index dbf68d4d0..02cf9357b 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -2,6 +2,7 @@
 /*
  * Copyright 2014 Advanced Micro Devices, Inc.
  * Copyright 2022 Advanced Micro Devices, Inc.
+ * Copyright 2023 Advanced Micro Devices, Inc.
  */
 
 #include "lib/amdgpu/amd_memory.h"
@@ -123,6 +124,7 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
 
 	for (ring_id = 0; (1 << ring_id) & ring_context->hw_ip_info.available_rings; ring_id++) {
 		loop = 0;
+		ring_context->ring_id = ring_id;
 		while (loop < 2) {
 			/* allocate UC bo for sDMA use */
 			r = amdgpu_bo_alloc_and_map(device,
@@ -197,7 +199,7 @@ void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
 	const int pm4_dw = 256;
 
 	struct amdgpu_ring_context *ring_context;
-	int r, loop;
+	int r, loop, ring_id;
 
 	uint64_t gtt_flags[2] = {0, AMDGPU_GEM_CREATE_CPU_GTT_USWC};
 
@@ -208,38 +210,42 @@ void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
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
-	while (loop < 2) {
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
 					    gtt_flags[loop], &ring_context->bo, (void **)&ring_context->bo_cpu,
 					    &ring_context->bo_mc, &ring_context->va_handle);
-		igt_assert_eq(r, 0);
+			igt_assert_eq(r, 0);
 
-		/* clear bo */
-		memset((void *)ring_context->bo_cpu, 0, ring_context->write_length);
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
@@ -262,7 +268,7 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
 	const int pm4_dw = 256;
 
 	struct amdgpu_ring_context *ring_context;
-	int r, loop1, loop2;
+	int r, loop1, loop2, ring_id;
 
 	uint64_t gtt_flags[2] = {0, AMDGPU_GEM_CREATE_CPU_GTT_USWC};
 
@@ -274,58 +280,62 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
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
-	while (loop1 < 2) {
-		while (loop2 < 2) {
+		while (loop1 < 2) {
+			while (loop2 < 2) {
 			/* allocate UC bo1for sDMA use */
-			r = amdgpu_bo_alloc_and_map(device,
+				r = amdgpu_bo_alloc_and_map(device,
 						    ring_context->write_length, 4096,
 						    AMDGPU_GEM_DOMAIN_GTT,
 						    gtt_flags[loop1], &ring_context->bo,
 						    (void **)&ring_context->bo_cpu, &ring_context->bo_mc,
 						    &ring_context->va_handle);
-			igt_assert_eq(r, 0);
+				igt_assert_eq(r, 0);
 
-			/* set bo_cpu */
-			memset((void *)ring_context->bo_cpu, ip_block->funcs->pattern, ring_context->write_length);
+				/* set bo_cpu */
+				memset((void *)ring_context->bo_cpu, ip_block->funcs->pattern, ring_context->write_length);
 
-			/* allocate UC bo2 for sDMA use */
-			r = amdgpu_bo_alloc_and_map(device,
+				/* allocate UC bo2 for sDMA use */
+				r = amdgpu_bo_alloc_and_map(device,
 						    ring_context->write_length, 4096,
 						    AMDGPU_GEM_DOMAIN_GTT,
 						    gtt_flags[loop2], &ring_context->bo2,
 						    (void **)&ring_context->bo2_cpu, &ring_context->bo_mc2,
 						    &ring_context->va_handle2);
-			igt_assert_eq(r, 0);
+				igt_assert_eq(r, 0);
 
-			/* clear bo2_cpu */
-			memset((void *)ring_context->bo2_cpu, 0, ring_context->write_length);
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
index b07695714..67bba8e84 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -152,10 +152,11 @@ sdma_ring_copy_linear(const struct amdgpu_ip_funcs *func,
  * - copy_linear
  */
 
+
 static int
 gfx_ring_write_linear(const struct amdgpu_ip_funcs *func,
-				const struct amdgpu_ring_context *ring_context,
-				uint32_t *pm4_dw)
+		      const struct amdgpu_ring_context *ring_context,
+		      uint32_t *pm4_dw)
 {
 	uint32_t i, j;
 
@@ -198,8 +199,8 @@ gfx_ring_write_linear(const struct amdgpu_ip_funcs *func,
 
 static int
 gfx_ring_const_fill(const struct amdgpu_ip_funcs *func,
-				const struct amdgpu_ring_context *ring_context,
-				uint32_t *pm4_dw)
+		     const struct amdgpu_ring_context *ring_context,
+		     uint32_t *pm4_dw)
 {
 	uint32_t i;
 
@@ -744,3 +745,17 @@ amdgpu_open_devices(bool open_render_node, int  max_cards_supported, int drm_amd
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
index ad7ffd4e6..dcba8a380 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -12,11 +12,15 @@
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
 
@@ -123,4 +127,8 @@ void free_cmd_base(struct amdgpu_cmd_base *base);
 int
 amdgpu_open_devices(bool open_render_node, int max_cards_supported, int drm_amdgpu_fds[]);
 
+bool
+is_rings_available(amdgpu_device_handle device_handle, uint32_t mask,
+		enum amd_ip_block_type type);
+
 #endif
diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 31e67647d..6e54a0e4f 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -619,12 +619,23 @@ amdgpu_gfx_dispatch_test_compute(amdgpu_device_handle device_handle)
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
@@ -642,41 +653,91 @@ igt_main
 		igt_assert_eq(r, 0);
 		r = setup_amdgpu_ip_blocks(major, minor,  &gpu_info, device);
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
