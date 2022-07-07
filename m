Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD8C812BBBA
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Jul 2022 18:28:23 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 7 Jul 2022 14:28:11 -0400
Message-ID: <20220707182811.3805-7-vitaly.prosyak@amd.com>
In-Reply-To: <20220707182811.3805-1-vitaly.prosyak@amd.com>
References: <20220707182811.3805-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 7/7] tests/amdgpu: add sync dependency test
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

The second command is waiting for shader rendering to complete

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_basic.c | 178 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 177 insertions(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 679a8b0f..ae424e81 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -29,7 +29,7 @@
 #include "lib/amdgpu/amd_command_submission.h"
 #include "lib/amdgpu/amd_compute.h"
 #include "lib/amdgpu/amd_gfx.h"
-
+#include "lib/amdgpu/amd_shaders.h"
 
 #define BUFFER_SIZE (8 * 1024)
 
@@ -451,6 +451,178 @@ amdgpu_bo_eviction_test(amdgpu_device_handle device_handle)
 	free(ring_context);
 }
 
+static void
+amdgpu_sync_dependency_test(amdgpu_device_handle device_handle)
+{
+	const unsigned const_size = 8192;
+	const unsigned const_alignment = 4096;
+
+	amdgpu_context_handle context_handle[2];
+
+	amdgpu_bo_handle ib_result_handle;
+	void *ib_result_cpu;
+	uint64_t ib_result_mc_address;
+	struct amdgpu_cs_request ibs_request;
+	struct amdgpu_cs_ib_info ib_info;
+	struct amdgpu_cs_fence fence_status;
+	uint32_t expired;
+	int r;
+	amdgpu_bo_list_handle bo_list;
+	amdgpu_va_handle va_handle;
+	uint64_t seq_no;
+
+	uint32_t cdw_old;
+
+	uint32_t size_bytes, code_offset, data_offset;
+	const uint32_t *shader;
+
+	struct amdgpu_cmd_base * base = get_cmd_base();
+
+	r = amdgpu_cs_ctx_create(device_handle, &context_handle[0]);
+	igt_assert_eq(r, 0);
+	r = amdgpu_cs_ctx_create(device_handle, &context_handle[1]);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_alloc_and_map(device_handle, const_size, const_alignment,
+			AMDGPU_GEM_DOMAIN_GTT, 0,
+			&ib_result_handle, &ib_result_cpu,
+			&ib_result_mc_address, &va_handle);
+
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_get_bo_list(device_handle, ib_result_handle, NULL,
+			       &bo_list);
+	igt_assert_eq(r, 0);
+
+	shader = get_shader_bin(&size_bytes, &code_offset, &data_offset);
+
+	/* assign cmd buffer */
+	base->attach_buf(base, ib_result_cpu, const_size);
+
+	base->emit(base, PACKET3(PKT3_CONTEXT_CONTROL, 1));
+	base->emit(base, 0x80000000);
+	base->emit(base, 0x80000000);
+
+	base->emit(base, PACKET3(PKT3_CLEAR_STATE, 0));
+	base->emit(base, 0x80000000);
+
+	/* Program compute regs */
+	/* TODO ASIC registers do based on predefined offsets */
+	base->emit(base, PACKET3(PKT3_SET_SH_REG, 2));
+	base->emit(base, mmCOMPUTE_PGM_LO - PACKET3_SET_SH_REG_START);
+	base->emit(base, (ib_result_mc_address + code_offset * 4) >> 8);
+	base->emit(base, (ib_result_mc_address + code_offset * 4) >> 40);
+
+	base->emit(base,PACKET3(PKT3_SET_SH_REG, 2));
+	base->emit(base, mmCOMPUTE_PGM_RSRC1 - PACKET3_SET_SH_REG_START);
+
+	base->emit(base, 0x002c0040);
+	base->emit(base, 0x00000010);
+
+	base->emit(base, PACKET3(PKT3_SET_SH_REG, 1));
+	base->emit(base, mmCOMPUTE_TMPRING_SIZE - PACKET3_SET_SH_REG_START);
+	base->emit(base, 0x00000100);
+
+	base->emit(base, PACKET3(PKT3_SET_SH_REG, 2));
+	base->emit(base, mmCOMPUTE_USER_DATA_0 - PACKET3_SET_SH_REG_START);
+	base->emit(base, 0xffffffff & (ib_result_mc_address + data_offset * 4));
+	base->emit(base, (0xffffffff00000000 & (ib_result_mc_address + data_offset * 4)) >> 32);
+
+	base->emit(base, PACKET3(PKT3_SET_SH_REG, 1));
+	base->emit(base, mmCOMPUTE_RESOURCE_LIMITS - PACKET3_SET_SH_REG_START);
+	base->emit(base, 0);
+
+	base->emit(base, PACKET3(PKT3_SET_SH_REG, 3));
+	base->emit(base, mmCOMPUTE_NUM_THREAD_X - PACKET3_SET_SH_REG_START);
+	base->emit(base, 1);
+	base->emit(base, 1);
+	base->emit(base, 1);
+
+	/* Dispatch */
+	base->emit(base, PACKET3(PACKET3_DISPATCH_DIRECT, 3));
+	base->emit(base, 1);
+	base->emit(base, 1);
+	base->emit(base, 1);
+	base->emit(base, 0x00000045);
+	append_cmd_base(base, 7, GFX_COMPUTE_NOP);
+
+	base->emit_buf(base, shader, code_offset,size_bytes);
+
+	memset(&ib_info, 0, sizeof(struct amdgpu_cs_ib_info));
+	ib_info.ib_mc_address = ib_result_mc_address;
+	ib_info.size = base->cdw;;
+
+	memset(&ibs_request, 0, sizeof(struct amdgpu_cs_request));
+	ibs_request.ip_type = AMDGPU_HW_IP_GFX;
+	ibs_request.ring = 0;
+	ibs_request.number_of_ibs = 1;
+	ibs_request.ibs = &ib_info;
+	ibs_request.resources = bo_list;
+	ibs_request.fence_info.handle = NULL;
+
+	r = amdgpu_cs_submit(context_handle[1], 0,&ibs_request, 1);
+	igt_assert_eq(r, 0);
+	seq_no = ibs_request.seq_no;
+
+	cdw_old = base->cdw;
+
+	base->emit(base, PACKET3(PACKET3_WRITE_DATA, 3));
+	base->emit(base, WRITE_DATA_DST_SEL(5) | WR_CONFIRM);
+	base->emit(base,  0xfffffffc & (ib_result_mc_address + data_offset * 4));
+	base->emit(base,  (0xffffffff00000000 & (ib_result_mc_address + data_offset * 4)) >> 32);
+	base->emit(base,  99);
+	append_cmd_base(base, 7, GFX_COMPUTE_NOP);
+
+	memset(&ib_info, 0, sizeof(struct amdgpu_cs_ib_info));
+	ib_info.ib_mc_address = ib_result_mc_address + cdw_old * 4;
+	ib_info.size = base->cdw - cdw_old;
+
+	memset(&ibs_request, 0, sizeof(struct amdgpu_cs_request));
+	ibs_request.ip_type = AMDGPU_HW_IP_GFX;
+	ibs_request.ring = 0;
+	ibs_request.number_of_ibs = 1;
+	ibs_request.ibs = &ib_info;
+	ibs_request.resources = bo_list;
+	ibs_request.fence_info.handle = NULL;
+
+	ibs_request.number_of_dependencies = 1;
+
+	ibs_request.dependencies = calloc(1, sizeof(*ibs_request.dependencies));
+	ibs_request.dependencies[0].context = context_handle[1];
+	ibs_request.dependencies[0].ip_instance = 0;
+	ibs_request.dependencies[0].ring = 0;
+	ibs_request.dependencies[0].fence = seq_no;
+
+	r = amdgpu_cs_submit(context_handle[0], 0,&ibs_request, 1);
+	igt_assert_eq(r, 0);
+
+	memset(&fence_status, 0, sizeof(struct amdgpu_cs_fence));
+	fence_status.context = context_handle[0];
+	fence_status.ip_type = AMDGPU_HW_IP_GFX;
+	fence_status.ip_instance = 0;
+	fence_status.ring = 0;
+	fence_status.fence = ibs_request.seq_no;
+
+	r = amdgpu_cs_query_fence_status(&fence_status,
+		       AMDGPU_TIMEOUT_INFINITE,0, &expired);
+	igt_assert_eq(r, 0);
+
+	/* Expect the second command to wait for shader to complete */
+	igt_assert_eq(base->buf[data_offset], 99);
+
+	r = amdgpu_bo_list_destroy(bo_list);
+	igt_assert_eq(r, 0);
+
+	 amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
+				     ib_result_mc_address, const_alignment);
+
+	amdgpu_cs_ctx_free(context_handle[0]);
+	amdgpu_cs_ctx_free(context_handle[1]);
+
+	free(ibs_request.dependencies);
+	free_cmd_base(base);
+}
+
 igt_main
 {
 	amdgpu_device_handle device;
@@ -501,6 +673,10 @@ igt_main
 	igt_subtest("eviction_test")
 		amdgpu_bo_eviction_test(device);
 
+	igt_subtest("sync_dependency_test")
+		amdgpu_sync_dependency_test(device);
+
+
 	igt_fixture {
 		amdgpu_device_deinitialize(device);
 		close(fd);
-- 
2.25.1
