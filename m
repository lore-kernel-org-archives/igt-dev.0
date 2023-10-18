Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2056.outbound.protection.outlook.com [40.107.101.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777C110E380
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Oct 2023 05:33:47 +0000 (UTC)
From: Jesse Zhang <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 18 Oct 2023 13:33:36 +0800
Message-ID: <20231018053336.107138-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH] tests/amd_dispatch: add negative test for SDMA
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tim Huang <tim.huang@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Christian
 Koenig <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Issue corrupted header or slow sdma linear copy
to trigger SDMA hang test.

V2:
  - avoid generating warning,
    and optimize logical code (Vitlaly)

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
Signed-off-by: Tim Huang <tim.huang@amd.com>
---
 lib/amdgpu/amd_deadlock_helpers.c | 148 ++++++++++++++++++++++++++++++
 lib/amdgpu/amd_deadlock_helpers.h |   7 ++
 tests/amdgpu/amd_deadlock.c       |  16 ++++
 3 files changed, 171 insertions(+)

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index a6be5f02a..8f2d63772 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -248,3 +248,151 @@ bad_access_helper(amdgpu_device_handle device_handle, int reg_access, unsigned i
 	free_cmd_base(base_cmd);
 	amdgpu_cs_ctx_free(context_handle);
 }
+
+void
+amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type)
+{
+	const int sdma_write_length = 1024;
+	amdgpu_context_handle context_handle;
+	amdgpu_bo_handle ib_result_handle;
+	amdgpu_bo_handle bo1, bo2;
+	amdgpu_bo_handle resources[3];
+	amdgpu_bo_list_handle bo_list;
+	void *ib_result_cpu;
+	struct amdgpu_cs_ib_info ib_info;
+	struct amdgpu_cs_request ibs_request;
+	struct amdgpu_cs_fence fence_status;
+	uint64_t bo1_mc, bo2_mc;
+	uint64_t ib_result_mc_address;
+	volatile unsigned char *bo1_cpu, *bo2_cpu;
+	amdgpu_va_handle bo1_va_handle, bo2_va_handle;
+	amdgpu_va_handle va_handle;
+	struct drm_amdgpu_info_hw_ip hw_ip_info;
+	int j, r;
+	uint32_t expired, ib_size;
+	struct amdgpu_cmd_base *base_cmd = get_cmd_base();
+
+	r = amdgpu_query_hw_ip_info(device_handle, AMDGPU_HW_IP_DMA, 0, &hw_ip_info);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_cs_ctx_create(device_handle, &context_handle);
+	igt_assert_eq(r, 0);
+
+	if (hang_type == DMA_CORRUPTED_HEADER_HANG)
+		ib_size = 4096;
+	else
+		ib_size = 4096 * 0x20000;
+
+	r = amdgpu_bo_alloc_and_map(device_handle, ib_size, 4096,
+				    AMDGPU_GEM_DOMAIN_GTT, 0,
+				    &ib_result_handle, &ib_result_cpu,
+				    &ib_result_mc_address, &va_handle);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_alloc_and_map(device_handle,
+				    sdma_write_length, 4096,
+				    AMDGPU_GEM_DOMAIN_GTT,
+				    0, &bo1,
+				    (void**)&bo1_cpu, &bo1_mc,
+				    &bo1_va_handle);
+	igt_assert_eq(r, 0);
+
+	/* set bo1 */
+	memset((void*)bo1_cpu, 0xaa, sdma_write_length);
+
+	/* allocate UC bo2 for sDMA use */
+	r = amdgpu_bo_alloc_and_map(device_handle,
+				    sdma_write_length, 4096,
+				    AMDGPU_GEM_DOMAIN_GTT,
+				    0, &bo2,
+				    (void**)&bo2_cpu, &bo2_mc,
+				    &bo2_va_handle);
+	igt_assert_eq(r, 0);
+
+	/* clear bo2 */
+	memset((void*)bo2_cpu, 0, sdma_write_length);
+
+	resources[0] = bo1;
+	resources[1] = bo2;
+	resources[2] = ib_result_handle;
+	r = amdgpu_bo_list_create(device_handle, 3,
+				  resources, NULL, &bo_list);
+
+	/* fulfill PM4: with bad copy linear header */
+	base_cmd->attach_buf(base_cmd, ib_result_cpu, ib_size);
+	if (hang_type == DMA_CORRUPTED_HEADER_HANG) {
+		base_cmd->emit(base_cmd, 0x23decd3d);
+		base_cmd->emit(base_cmd, (sdma_write_length - 1));
+		base_cmd->emit(base_cmd, 0);
+		base_cmd->emit(base_cmd, (0xffffffff & bo1_mc));
+		base_cmd->emit(base_cmd, ((0xffffffff00000000 & bo1_mc) >> 32));
+		base_cmd->emit(base_cmd, (0xffffffff & bo2_mc));
+		base_cmd->emit(base_cmd, ((0xffffffff00000000 & bo2_mc) >> 32));
+	} else {
+		for (j = 1; j < 0x20000; j++) {
+			base_cmd->emit(base_cmd, SDMA_PACKET(SDMA_OPCODE_COPY,
+						SDMA_COPY_SUB_OPCODE_LINEAR,
+						0));
+			base_cmd->emit(base_cmd, (sdma_write_length - 1));
+			base_cmd->emit(base_cmd, 0);
+			base_cmd->emit(base_cmd, (0xffffffff & bo1_mc));
+			base_cmd->emit(base_cmd, ((0xffffffff00000000 & bo1_mc) >> 32));
+			base_cmd->emit(base_cmd, (0xffffffff & bo2_mc));
+			base_cmd->emit(base_cmd, ((0xffffffff00000000 & bo2_mc) >> 32));
+			base_cmd->emit(base_cmd, SDMA_PACKET(SDMA_OPCODE_COPY,
+						SDMA_COPY_SUB_OPCODE_LINEAR,
+						0));
+			base_cmd->emit(base_cmd, (sdma_write_length - 1));
+			base_cmd->emit(base_cmd, 0);
+			base_cmd->emit(base_cmd, (0xffffffff & bo2_mc));
+			base_cmd->emit(base_cmd, ((0xffffffff00000000 & bo2_mc) >> 32));
+			base_cmd->emit(base_cmd, (0xffffffff & bo1_mc));
+			base_cmd->emit(base_cmd, ((0xffffffff00000000 & bo1_mc) >> 32));
+		}
+	}
+
+	/* exec command */
+	memset(&ib_info, 0, sizeof(struct amdgpu_cs_ib_info));
+	ib_info.ib_mc_address = ib_result_mc_address;
+	ib_info.size = base_cmd->cdw;
+
+	memset(&ibs_request, 0, sizeof(struct amdgpu_cs_request));
+	ibs_request.ip_type = AMDGPU_HW_IP_DMA;
+	ibs_request.ring = 0;
+	ibs_request.number_of_ibs = 1;
+	ibs_request.ibs = &ib_info;
+	ibs_request.resources = bo_list;
+	ibs_request.fence_info.handle = NULL;
+
+	r = amdgpu_cs_submit(context_handle, 0, &ibs_request, 1);
+	igt_assert_eq(r, 0);
+
+	memset(&fence_status, 0, sizeof(struct amdgpu_cs_fence));
+	fence_status.context = context_handle;
+	fence_status.ip_type = AMDGPU_HW_IP_DMA;
+	fence_status.ip_instance = 0;
+	fence_status.ring = 0;
+	fence_status.fence = ibs_request.seq_no;
+
+	r = amdgpu_cs_query_fence_status(&fence_status,
+					 AMDGPU_TIMEOUT_INFINITE,
+					 0, &expired);
+	if (r != 0 && r != -ECANCELED && r != -ETIME)
+		igt_assert(0);
+
+	r = amdgpu_bo_list_destroy(bo_list);
+	igt_assert_eq(r, 0);
+
+	amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
+				     ib_result_mc_address, 4096);
+
+	amdgpu_bo_unmap_and_free(bo1, bo1_va_handle, bo1_mc,
+				     sdma_write_length);
+
+	amdgpu_bo_unmap_and_free(bo2, bo2_va_handle, bo2_mc,
+				     sdma_write_length);
+	/* end of test */
+	r = amdgpu_cs_ctx_free(context_handle);
+	igt_assert_eq(r, 0);
+	free_cmd_base(base_cmd);
+}
diff --git a/lib/amdgpu/amd_deadlock_helpers.h b/lib/amdgpu/amd_deadlock_helpers.h
index cc8eba7f7..9c0d245a9 100644
--- a/lib/amdgpu/amd_deadlock_helpers.h
+++ b/lib/amdgpu/amd_deadlock_helpers.h
@@ -24,11 +24,18 @@
 #ifndef __AMD_DEADLOCK_HELPERS_H__
 #define __AMD_DEADLOCK_HELPERS_H__
 
+enum  hang_type {
+	DMA_CORRUPTED_HEADER_HANG,
+	DMA_SLOW_LINEARCOPY_HANG
+};
+
 void
 amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned ip_type);
 
 void
 bad_access_helper(amdgpu_device_handle device_handle, int reg_access, unsigned ip_type);
 
+void
+amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type);
 #endif
 
diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index 6147b7636..dc7ec4366 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -77,6 +77,22 @@ igt_main
 		}
 	}
 
+	igt_describe("Test-GPU-reset-by-sdma-corrupted-header-with-jobs");
+	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-corrupted-header-test") {
+		if (arr_cap[AMD_IP_DMA]) {
+			igt_dynamic_f("amdgpu-deadlock-sdma-corrupted-header-test")
+			amdgpu_hang_sdma_helper(device, DMA_CORRUPTED_HEADER_HANG);
+		}
+	}
+
+	igt_describe("Test-GPU-reset-by-sdma-slow-linear-copy-with-jobs");
+	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-slow-linear-copy") {
+		if (arr_cap[AMD_IP_DMA]) {
+			igt_dynamic_f("amdgpu-deadlock-sdma-slow-linear-copy")
+			amdgpu_hang_sdma_helper(device, DMA_SLOW_LINEARCOPY_HANG);
+		}
+	}
+
 	igt_fixture {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
-- 
2.25.1
