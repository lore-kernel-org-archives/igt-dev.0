Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B14610E1AE
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Nov 2022 21:52:53 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 11 Nov 2022 16:52:10 -0500
Message-ID: <20221111215213.48679-6-vitaly.prosyak@amd.com>
In-Reply-To: <20221111215213.48679-1-vitaly.prosyak@amd.com>
References: <20221111215213.48679-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 6/9] lib/amdgpu: add memory and reg. access helper
 function
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Pierre-eric
 Pelloux-prayer <Pierre-eric.Pelloux-prayer@amd.com>, marek.olsak@amd.com,
 christian.koenig@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

The helper functions access to invalid memory or register
to trigger GPU reset.

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reviewed-by: Pierre-eric Pelloux-prayer <Pierre-eric.Pelloux-prayer@amd.com>
---
 lib/amdgpu/amd_PM4.h              |  3 ++
 lib/amdgpu/amd_deadlock_helpers.c | 76 +++++++++++++++++++++++++++++++
 lib/amdgpu/amd_deadlock_helpers.h |  3 ++
 3 files changed, 82 insertions(+)

diff --git a/lib/amdgpu/amd_PM4.h b/lib/amdgpu/amd_PM4.h
index 7672da034..32a04c1ac 100644
--- a/lib/amdgpu/amd_PM4.h
+++ b/lib/amdgpu/amd_PM4.h
@@ -212,4 +212,7 @@
 		 * 1 - pfp
 		 * 2 - ce
 		 */
+/* GMC registers */
+#define mmVM_CONTEXT0_PAGE_TABLE_BASE_ADDR                   0x54f
+
 #endif
diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index 98fb23e0e..5ffa39318 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -188,3 +188,79 @@ amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned ip_type)
 	free_cmd_base(base_cmd);
 }
 
+void
+bad_access_helper(amdgpu_device_handle device_handle, int reg_access, unsigned ip_type)
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
+	ibs_request.ip_type = ip_type;
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
+	fence_status.ip_type = ip_type;
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
index 3fc45da36..cc8eba7f7 100644
--- a/lib/amdgpu/amd_deadlock_helpers.h
+++ b/lib/amdgpu/amd_deadlock_helpers.h
@@ -27,5 +27,8 @@
 void
 amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned ip_type);
 
+void
+bad_access_helper(amdgpu_device_handle device_handle, int reg_access, unsigned ip_type);
+
 #endif
 
-- 
2.25.1
