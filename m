Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2045.outbound.protection.outlook.com [40.107.92.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB32D10E12B
 for <igt-dev@lists.freedesktop.org>; Sat,  1 Jul 2023 23:48:11 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Sat, 1 Jul 2023 19:47:59 -0400
Message-ID: <20230701234759.354827-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH] lib/amdgpu: correct the fence status check
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jesse
 Zhang <Jesse.Zhang@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

When waiting for the fence to time out, the fence status will return
-ETIME instead of 0. It is a negative test, the -ETIME should be
expected error.

v2.  Fix formatting warnings and issues.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_deadlock_helpers.c | 60 ++++++++++++-------------------
 1 file changed, 22 insertions(+), 38 deletions(-)

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index bef70893c..a6be5f02a 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -1,27 +1,8 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
  * Copyright 2022 Advanced Micro Devices, Inc.
- *  *
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
  */
+
 #include <amdgpu.h>
 #include "amdgpu_drm.h"
 #include "amd_PM4.h"
@@ -48,7 +29,7 @@ use_uc_mtype = 1;
 static void*
 write_mem_address(void *data)
 {
-	int sig ,r;
+	int sig, r;
 	struct thread_param *param = data;
 
 	/* send ready signal to main thread */
@@ -63,7 +44,7 @@ write_mem_address(void *data)
 }
 
 void
-amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned ip_type)
+amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int ip_type)
 {
 	amdgpu_context_handle context_handle;
 	amdgpu_bo_handle ib_result_handle;
@@ -82,7 +63,7 @@ amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned ip_type)
 	pthread_t stress_thread = {0};
 	struct thread_param param = {0};
 	int job_count = 0;
-	struct amdgpu_cmd_base * base_cmd = get_cmd_base();
+	struct amdgpu_cmd_base *base_cmd = get_cmd_base();
 
 	r = amdgpu_cs_ctx_create(device_handle, &context_handle);
 	igt_assert_eq(r, 0);
@@ -155,7 +136,7 @@ amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned ip_type)
 		/* before GPU hung */
 		r = amdgpu_cs_submit(context_handle, 0, &ibs_request, 1);
 		job_count++;
-	} while( r == 0 && job_count < MAX_JOB_COUNT);
+	} while (r == 0 && job_count < MAX_JOB_COUNT);
 
 	if (r != 0 && r != -ECANCELED)
 		igt_assert(0);
@@ -169,8 +150,8 @@ amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned ip_type)
 	fence_status.ring = 0;
 	fence_status.fence = ibs_request.seq_no;
 
-	r = amdgpu_cs_query_fence_status(&fence_status,
-			AMDGPU_TIMEOUT_INFINITE ,0, &expired);
+	r = amdgpu_cs_query_fence_status(&fence_status, AMDGPU_TIMEOUT_INFINITE, 0,
+			&expired);
 	if (r != 0 && r != -ECANCELED)
 		igt_assert(0);
 
@@ -189,7 +170,7 @@ amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned ip_type)
 }
 
 void
-bad_access_helper(amdgpu_device_handle device_handle, int reg_access, unsigned ip_type)
+bad_access_helper(amdgpu_device_handle device_handle, int reg_access, unsigned int ip_type)
 {
 	amdgpu_context_handle context_handle;
 	amdgpu_bo_handle ib_result_handle;
@@ -199,12 +180,13 @@ bad_access_helper(amdgpu_device_handle device_handle, int reg_access, unsigned i
 	struct amdgpu_cs_ib_info ib_info;
 	struct amdgpu_cs_fence fence_status;
 	uint32_t expired;
-	const unsigned bo_cmd_size = 4096;
-	const unsigned alignment = 4096;
+	const unsigned int bo_cmd_size = 4096;
+	const unsigned int alignment = 4096;
 	int r;
 	amdgpu_bo_list_handle bo_list;
 	amdgpu_va_handle va_handle;
-	struct amdgpu_cmd_base * base_cmd;
+	struct amdgpu_cmd_base *base_cmd;
+
 	r = amdgpu_cs_ctx_create(device_handle, &context_handle);
 	igt_assert_eq(r, 0);
 
@@ -221,12 +203,12 @@ bad_access_helper(amdgpu_device_handle device_handle, int reg_access, unsigned i
 
 	base_cmd->emit(base_cmd, PACKET3(PACKET3_WRITE_DATA, 3));
 	base_cmd->emit(base_cmd, (reg_access ? WRITE_DATA_DST_SEL(0) :
-										   WRITE_DATA_DST_SEL(5))| WR_CONFIRM);
+										   WRITE_DATA_DST_SEL(5)) | WR_CONFIRM);
 
 	base_cmd->emit(base_cmd, reg_access ? mmVM_CONTEXT0_PAGE_TABLE_BASE_ADDR :
 					0xdeadbee0);
-	base_cmd->emit(base_cmd, 0 );
-	base_cmd->emit(base_cmd, 0xdeadbeef );
+	base_cmd->emit(base_cmd, 0);
+	base_cmd->emit(base_cmd, 0xdeadbeef);
 	base_cmd->emit_repeat(base_cmd, GFX_COMPUTE_NOP, 16 - base_cmd->cdw);
 
 	memset(&ib_info, 0, sizeof(struct amdgpu_cs_ib_info));
@@ -241,8 +223,10 @@ bad_access_helper(amdgpu_device_handle device_handle, int reg_access, unsigned i
 	ibs_request.resources = bo_list;
 	ibs_request.fence_info.handle = NULL;
 
-	r = amdgpu_cs_submit(context_handle, 0,&ibs_request, 1);
-	if (r != 0 && r != -ECANCELED)
+	r = amdgpu_cs_submit(context_handle, 0, &ibs_request, 1);
+	/* see kernel change */
+	/* https://lists.freedesktop.org/archives/amd-gfx/2023-May/092770.html */
+	if (r != 0 && r != -ECANCELED && r != -ETIME)
 		igt_assert(0);
 
 
@@ -254,8 +238,8 @@ bad_access_helper(amdgpu_device_handle device_handle, int reg_access, unsigned i
 	fence_status.fence = ibs_request.seq_no;
 
 	r = amdgpu_cs_query_fence_status(&fence_status,
-			AMDGPU_TIMEOUT_INFINITE,0, &expired);
-	if (r != 0 && r != -ECANCELED)
+			AMDGPU_TIMEOUT_INFINITE, 0, &expired);
+	if (r != 0 && r != -ECANCELED && r != -ETIME)
 		igt_assert(0);
 
 	amdgpu_bo_list_destroy(bo_list);
-- 
2.25.1
