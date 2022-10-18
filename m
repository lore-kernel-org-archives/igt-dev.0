Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2084.outbound.protection.outlook.com [40.107.212.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6218810E747
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Oct 2022 03:01:11 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Mon, 17 Oct 2022 23:00:52 -0400
Message-ID: <20221018030055.73636-4-vitaly.prosyak@amd.com>
In-Reply-To: <20221018030055.73636-1-vitaly.prosyak@amd.com>
References: <20221018030055.73636-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 4/7] lib/amdgpu: add memory and reg.access helper
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: pierre-eric.pelloux-prayer@amd.com, marek.olsak@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_PM4.h              |  4 ++
 lib/amdgpu/amd_deadlock_helpers.c | 92 +++++++++++++++++++++++++++++--
 lib/amdgpu/amd_deadlock_helpers.h |  3 +
 3 files changed, 93 insertions(+), 6 deletions(-)

diff --git a/lib/amdgpu/amd_PM4.h b/lib/amdgpu/amd_PM4.h
index 2c2152c49..54d001532 100644
--- a/lib/amdgpu/amd_PM4.h
+++ b/lib/amdgpu/amd_PM4.h
@@ -212,4 +212,8 @@
 		 * 1 - pfp
 		 * 2 - ce
 		 */
+
+/* GMC registers */
+#define mmVM_CONTEXT0_PAGE_TABLE_BASE_ADDR                   0x54f
+
 #endif
diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index c6528c6ad..49602320a 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -169,7 +169,8 @@ amdgpu_deadlock_sdma(amdgpu_device_handle device_handle, bool with_thread)
 	struct drm_amdgpu_info_hw_ip info;
 	uint32_t ring_id;
 	pthread_t stress_thread = {0};
-	int bo_cmd_size = 4096;
+	const unsigned bo_cmd_size = 4096;
+	const unsigned alignment = 4096;
 	struct amdgpu_cmd_base * base_cmd;
 
 	r = amdgpu_query_hw_ip_info(device_handle, AMDGPU_HW_IP_DMA, 0, &info);
@@ -180,14 +181,16 @@ amdgpu_deadlock_sdma(amdgpu_device_handle device_handle, bool with_thread)
 
 	for (ring_id = 0; (1 << ring_id) & info.available_rings; ring_id++) {
 
-		r = amdgpu_bo_alloc_and_map_raw(device_handle, 4096, 4096,
-				AMDGPU_GEM_DOMAIN_GTT, 0, use_uc_mtype ? AMDGPU_VM_MTYPE_UC : 0,
-							    &ib_result_handle, &ib_result_cpu,
-							    &ib_result_mc_address, &va_handle);
+		r = amdgpu_bo_alloc_and_map_raw(device_handle, bo_cmd_size, alignment,
+										AMDGPU_GEM_DOMAIN_GTT, 0, use_uc_mtype ?
+										AMDGPU_VM_MTYPE_UC : 0, &ib_result_handle,
+										&ib_result_cpu, &ib_result_mc_address,
+										&va_handle);
 		igt_assert_eq(r, 0);
 
 		if (with_thread) {
-			r = pthread_create(&stress_thread, NULL, &write_mem_address, ib_result_cpu);
+			r = pthread_create(&stress_thread, NULL, &write_mem_address,
+							   ib_result_cpu);
 			igt_assert_eq(r, 0);
 		}
 
@@ -258,3 +261,80 @@ amdgpu_deadlock_sdma(amdgpu_device_handle device_handle, bool with_thread)
 	}
 	amdgpu_cs_ctx_free(context_handle);
 }
+
+void
+bad_access_helper(amdgpu_device_handle device_handle, int reg_access)
+{
+	amdgpu_context_handle context_handle;
+	amdgpu_bo_handle ib_result_handle;
+	void *ib_result_cpu;
+	uint64_t ib_result_mc_address;
+	struct amdgpu_cs_request ibs_request;
+	struct amdgpu_cs_ib_info ib_info;
+	struct amdgpu_cs_fence fence_status;
+	uint32_t expired;
+	const unsigned bo_cmd_size = 4096;
+	const unsigned alignment = 4096;
+	int r;
+	amdgpu_bo_list_handle bo_list;
+	amdgpu_va_handle va_handle;
+	struct amdgpu_cmd_base * base_cmd;
+	r = amdgpu_cs_ctx_create(device_handle, &context_handle);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_alloc_and_map_raw(device_handle, bo_cmd_size, alignment,
+									AMDGPU_GEM_DOMAIN_GTT, 0, 0,
+									&ib_result_handle, &ib_result_cpu,
+									&ib_result_mc_address, &va_handle);
+	igt_assert_eq(r, 0);
+	base_cmd = get_cmd_base();
+	base_cmd->attach_buf(base_cmd, ib_result_cpu, bo_cmd_size);
+
+	r = amdgpu_get_bo_list(device_handle, ib_result_handle, NULL, &bo_list);
+	igt_assert_eq(r, 0);
+
+	base_cmd->emit(base_cmd, PACKET3(PACKET3_WRITE_DATA, 3));
+	base_cmd->emit(base_cmd, (reg_access ? WRITE_DATA_DST_SEL(0) :
+										   WRITE_DATA_DST_SEL(5))| WR_CONFIRM);
+
+	base_cmd->emit(base_cmd, reg_access ? mmVM_CONTEXT0_PAGE_TABLE_BASE_ADDR :
+					0xdeadbee0);
+	base_cmd->emit(base_cmd, 0 );
+	base_cmd->emit(base_cmd, 0xdeadbeef );
+	base_cmd->emit_repeat(base_cmd, 0xffff1000, 16 - base_cmd->cdw);
+
+	memset(&ib_info, 0, sizeof(struct amdgpu_cs_ib_info));
+	ib_info.ib_mc_address = ib_result_mc_address;
+	ib_info.size = base_cmd->cdw;
+
+	memset(&ibs_request, 0, sizeof(struct amdgpu_cs_request));
+	ibs_request.ip_type = AMDGPU_HW_IP_GFX;
+	ibs_request.ring = 0;
+	ibs_request.number_of_ibs = 1;
+	ibs_request.ibs = &ib_info;
+	ibs_request.resources = bo_list;
+	ibs_request.fence_info.handle = NULL;
+
+	r = amdgpu_cs_submit(context_handle, 0,&ibs_request, 1);
+	if (r != 0 && r != -ECANCELED)
+		igt_assert(0);
+
+
+	memset(&fence_status, 0, sizeof(struct amdgpu_cs_fence));
+	fence_status.context = context_handle;
+	fence_status.ip_type = AMDGPU_HW_IP_GFX;
+	fence_status.ip_instance = 0;
+	fence_status.ring = 0;
+	fence_status.fence = ibs_request.seq_no;
+
+	r = amdgpu_cs_query_fence_status(&fence_status,
+			AMDGPU_TIMEOUT_INFINITE,0, &expired);
+	if (r != 0 && r != -ECANCELED)
+		igt_assert(0);
+
+	amdgpu_bo_list_destroy(bo_list);
+	amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
+					 ib_result_mc_address, 4096);
+	free_cmd_base(base_cmd);
+	amdgpu_cs_ctx_free(context_handle);
+}
diff --git a/lib/amdgpu/amd_deadlock_helpers.h b/lib/amdgpu/amd_deadlock_helpers.h
index 91dcf8bb2..0f2471321 100644
--- a/lib/amdgpu/amd_deadlock_helpers.h
+++ b/lib/amdgpu/amd_deadlock_helpers.h
@@ -30,5 +30,8 @@ amdgpu_deadlock_helper(amdgpu_device_handle device_handle, unsigned ip_type, boo
 void
 amdgpu_deadlock_sdma(amdgpu_device_handle device_handle, bool with_thread);
 
+void
+bad_access_helper(amdgpu_device_handle device_handle, int reg_access);
+
 #endif
 
-- 
2.25.1
