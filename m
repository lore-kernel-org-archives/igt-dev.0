Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94DB510E1B2
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Nov 2022 21:52:42 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 11 Nov 2022 16:52:08 -0500
Message-ID: <20221111215213.48679-4-vitaly.prosyak@amd.com>
In-Reply-To: <20221111215213.48679-1-vitaly.prosyak@amd.com>
References: <20221111215213.48679-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 4/9] lib/amdgpu: add deadlock helper
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

Add wait_memory_helper to submit the jobs where wait for the register
in memory to be modified, but we change the value after we request the
fence of the job status to create a condition that GPU hung is detected
and GPU reset is executed.
The helper function is flexible and could be used for gfx, compute and
sdma.

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reviewed-by: Pierre-eric Pelloux-prayer <Pierre-eric.Pelloux-prayer@amd.com>
---
 lib/amdgpu/amd_deadlock_helpers.c | 190 ++++++++++++++++++++++++++++++
 lib/amdgpu/amd_deadlock_helpers.h |  31 +++++
 lib/meson.build                   |   3 +-
 3 files changed, 223 insertions(+), 1 deletion(-)
 create mode 100644 lib/amdgpu/amd_deadlock_helpers.c
 create mode 100644 lib/amdgpu/amd_deadlock_helpers.h

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
new file mode 100644
index 000000000..98fb23e0e
--- /dev/null
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -0,0 +1,190 @@
+/*
+ * SPDX-License-Identifier: MIT
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
+#include <amdgpu.h>
+#include "amdgpu_drm.h"
+#include "amd_PM4.h"
+#include "amd_sdma.h"
+#include <unistd.h>
+#include <pthread.h>
+#include <signal.h>
+#include "amd_memory.h"
+#include "amd_deadlock_helpers.h"
+#include "amd_ip_blocks.h"
+
+#define MAX_JOB_COUNT 200
+
+#define MEMORY_OFFSET 256 /* wait for this memory to change */
+struct thread_param {
+	sigset_t set_ready; /* thread is ready and signal to change memory */
+	pthread_t main_thread;
+	uint32_t *ib_result_cpu;
+};
+
+static int
+use_uc_mtype = 1;
+
+static void*
+write_mem_address(void *data)
+{
+	int sig ,r;
+	struct thread_param *param = data;
+
+	/* send ready signal to main thread */
+	pthread_kill(param->main_thread, SIGUSR1);
+
+	/* wait until job is submitted */
+	r = sigwait(&param->set_ready, &sig);
+	igt_assert_eq(r, 0);
+	igt_assert_eq(sig, SIGUSR2);
+	param->ib_result_cpu[MEMORY_OFFSET] = 0x1;
+	return 0;
+}
+
+void
+amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned ip_type)
+{
+	amdgpu_context_handle context_handle;
+	amdgpu_bo_handle ib_result_handle;
+	void *ib_result_cpu;
+	uint32_t *ib_result_cpu2;
+	uint64_t ib_result_mc_address;
+	struct amdgpu_cs_request ibs_request;
+	struct amdgpu_cs_ib_info ib_info;
+	struct amdgpu_cs_fence fence_status;
+	uint32_t expired;
+	int r;
+	amdgpu_bo_list_handle bo_list;
+	amdgpu_va_handle va_handle;
+	int bo_cmd_size = 4096;
+	int sig = 0;
+	pthread_t stress_thread = {0};
+	struct thread_param param = {0};
+	int job_count = 0;
+	struct amdgpu_cmd_base * base_cmd = get_cmd_base();
+
+	r = amdgpu_cs_ctx_create(device_handle, &context_handle);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_alloc_and_map_raw(device_handle, bo_cmd_size, bo_cmd_size,
+			AMDGPU_GEM_DOMAIN_GTT, 0, use_uc_mtype ? AMDGPU_VM_MTYPE_UC : 0,
+						    &ib_result_handle, &ib_result_cpu,
+						    &ib_result_mc_address, &va_handle);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_get_bo_list(device_handle, ib_result_handle, NULL, &bo_list);
+	igt_assert_eq(r, 0);
+
+	base_cmd->attach_buf(base_cmd, ib_result_cpu, bo_cmd_size);
+
+	if (ip_type == AMDGPU_HW_IP_DMA) {
+		base_cmd->emit(base_cmd, SDMA_PKT_HEADER_OP(SDMA_OP_POLL_REGMEM) |
+					(0 << 26) | /* WAIT_REG_MEM */(4 << 28) | /* != */(1 << 31)
+					/* memory */);
+	} else {
+		base_cmd->emit(base_cmd, PACKET3(PACKET3_WAIT_REG_MEM, 5));
+		base_cmd->emit(base_cmd, (WAIT_REG_MEM_MEM_SPACE(1)  /* memory */|
+							  WAIT_REG_MEM_FUNCTION(4) /* != */|
+							  WAIT_REG_MEM_ENGINE(0)/* me */));
+	}
+
+	base_cmd->emit(base_cmd, (ib_result_mc_address + MEMORY_OFFSET * 4) & 0xfffffffc);
+	base_cmd->emit(base_cmd, ((ib_result_mc_address + MEMORY_OFFSET * 4) >> 32) & 0xffffffff);
+
+	base_cmd->emit(base_cmd, 0);/* reference value */
+	base_cmd->emit(base_cmd, 0xffffffff); /* and mask */
+	base_cmd->emit(base_cmd, 0x00000004);/* poll interval */
+	base_cmd->emit_repeat(base_cmd, 0xffff1000, 16 - base_cmd->cdw);
+
+	ib_result_cpu2 = ib_result_cpu;
+	ib_result_cpu2[MEMORY_OFFSET] = 0x0; /* the memory we wait on to change */
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
+	/* setup thread parameters and signals of readiness */
+	sigemptyset(&param.set_ready);
+	sigaddset(&param.set_ready, SIGUSR1);
+	sigaddset(&param.set_ready, SIGUSR2);
+	r = pthread_sigmask(SIG_BLOCK, &param.set_ready, NULL);
+	param.ib_result_cpu = ib_result_cpu;
+	param.main_thread = pthread_self();
+
+	r = pthread_create(&stress_thread, NULL, &write_mem_address, &param);
+	igt_assert_eq(r, 0);
+
+	/* wait until thread is ready */
+	r = sigwait(&param.set_ready, &sig);
+	igt_assert_eq(r, 0);
+	igt_assert_eq(sig, SIGUSR1);
+	/* thread is ready, now submit jobs */
+	do {
+		/* kernel error failed to initialize parse */
+		/* GPU hung is detected becouse we wait for register value*/
+		/* submit jobs until it is cancelled , it is about 33 jobs for gfx */
+		/* before GPU hung */
+		r = amdgpu_cs_submit(context_handle, 0, &ibs_request, 1);
+		job_count++;
+	} while( r == 0 && job_count < MAX_JOB_COUNT);
+
+	if (r != 0 && r != -ECANCELED)
+		igt_assert(0);
+
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
+			AMDGPU_TIMEOUT_INFINITE ,0, &expired);
+	if (r != 0 && r != -ECANCELED)
+		igt_assert(0);
+
+	/* send signal to modify the memory we wait for */
+	pthread_kill(stress_thread, SIGUSR2);
+
+	pthread_join(stress_thread, NULL);
+
+	amdgpu_bo_list_destroy(bo_list);
+
+	amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
+							 ib_result_mc_address, 4096);
+
+	amdgpu_cs_ctx_free(context_handle);
+	free_cmd_base(base_cmd);
+}
+
diff --git a/lib/amdgpu/amd_deadlock_helpers.h b/lib/amdgpu/amd_deadlock_helpers.h
new file mode 100644
index 000000000..3fc45da36
--- /dev/null
+++ b/lib/amdgpu/amd_deadlock_helpers.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: MIT
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
+#ifndef __AMD_DEADLOCK_HELPERS_H__
+#define __AMD_DEADLOCK_HELPERS_H__
+
+void
+amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned ip_type);
+
+#endif
+
diff --git a/lib/meson.build b/lib/meson.build
index ac7126fbf..3f758e98c 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -140,7 +140,8 @@ if libdrm_amdgpu.found()
 		'amdgpu/amd_gfx_v8_0.c',
 		'amdgpu/amd_gfx_v9_0.c',
 		'amdgpu/amd_dispatch_helpers.c',
-		'amdgpu/amd_dispatch.c'
+		'amdgpu/amd_dispatch.c',
+		'amdgpu/amd_deadlock_helpers.c'
 	]
 endif
 
-- 
2.25.1
