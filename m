Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE0E10FC08
 for <igt-dev@lists.freedesktop.org>; Sat, 13 Aug 2022 00:03:15 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 12 Aug 2022 20:03:03 -0400
Message-ID: <20220813000306.4270-4-vitaly.prosyak@amd.com>
In-Reply-To: <20220813000306.4270-1-vitaly.prosyak@amd.com>
References: <20220813000306.4270-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 4/7] lib/amdgpu: added dispatch tests for gfx and
 compute
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
 lib/amdgpu/amd_dispatch.c | 559 ++++++++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_dispatch.h |  42 +++
 lib/meson.build           |   3 +-
 tests/amdgpu/amd_basic.c  |  18 ++
 4 files changed, 621 insertions(+), 1 deletion(-)
 create mode 100644 lib/amdgpu/amd_dispatch.c
 create mode 100644 lib/amdgpu/amd_dispatch.h

diff --git a/lib/amdgpu/amd_dispatch.c b/lib/amdgpu/amd_dispatch.c
new file mode 100644
index 000000000..cf773c309
--- /dev/null
+++ b/lib/amdgpu/amd_dispatch.c
@@ -0,0 +1,559 @@
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
+#include <amdgpu.h>
+#include "amd_memory.h"
+#include "amd_dispatch.h"
+#include "amd_shared_dispatch.h"
+#include "amd_dispatch_helpers.h"
+#include "amd_PM4.h"
+#include "amd_ip_blocks.h"
+#include "amd_shaders.h"
+
+static void
+amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
+			    uint32_t ip_type, uint32_t ring,
+			    uint32_t version)
+{
+	amdgpu_context_handle context_handle;
+	amdgpu_bo_handle bo_dst, bo_shader, bo_cmd, resources[3];
+	volatile unsigned char *ptr_dst;
+	void *ptr_shader;
+	uint32_t *ptr_cmd;
+	uint64_t mc_address_dst, mc_address_shader, mc_address_cmd;
+	amdgpu_va_handle va_dst, va_shader, va_cmd;
+	int i, r;
+	int bo_dst_size = 16384;
+	int bo_shader_size = 4096;
+	int bo_cmd_size = 4096;
+	struct amdgpu_cs_request ibs_request = {0};
+	struct amdgpu_cs_ib_info ib_info= {0};
+	amdgpu_bo_list_handle bo_list;
+	struct amdgpu_cs_fence fence_status = {0};
+	uint32_t expired;
+
+	struct amdgpu_cmd_base * base_cmd = get_cmd_base();
+
+	r = amdgpu_cs_ctx_create(device_handle, &context_handle);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_alloc_and_map(device_handle, bo_cmd_size, 4096,
+					AMDGPU_GEM_DOMAIN_GTT, 0,
+					&bo_cmd, (void **)&ptr_cmd,
+					&mc_address_cmd, &va_cmd);
+	igt_assert_eq(r, 0);
+	memset(ptr_cmd, 0, bo_cmd_size);
+	base_cmd->attach_buf(base_cmd, ptr_cmd, bo_cmd_size);
+
+	r = amdgpu_bo_alloc_and_map(device_handle, bo_shader_size, 4096,
+					AMDGPU_GEM_DOMAIN_VRAM, 0,
+					&bo_shader, &ptr_shader,
+					&mc_address_shader, &va_shader);
+	igt_assert_eq(r, 0);
+	memset(ptr_shader, 0, bo_shader_size);
+
+	r = amdgpu_dispatch_load_cs_shader(ptr_shader, CS_BUFFERCLEAR, version);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_alloc_and_map(device_handle, bo_dst_size, 4096,
+					AMDGPU_GEM_DOMAIN_VRAM, 0,
+					&bo_dst, (void **)&ptr_dst,
+					&mc_address_dst, &va_dst);
+	igt_assert_eq(r, 0);
+	/// TODO helper function for this bloc
+	amdgpu_dispatch_init(ip_type, base_cmd, version);
+
+	/*  Issue commands to set cu mask used in current dispatch */
+	amdgpu_dispatch_write_cumask(base_cmd, version);
+
+	/* Writes shader state to HW */
+	amdgpu_dispatch_write2hw(base_cmd, mc_address_shader, version);
+
+	/* Write constant data */
+	/* Writes the UAV constant data to the SGPRs. */
+	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
+	base_cmd->emit(base_cmd, 0x240);
+
+	base_cmd->emit(base_cmd, mc_address_dst);
+	base_cmd->emit(base_cmd, (mc_address_dst >> 32) | 0x100000);
+
+	base_cmd->emit(base_cmd, 0x400);
+	if (version == 9)
+		base_cmd->emit(base_cmd, 0x74fac);
+	else if (version == 10)
+		base_cmd->emit(base_cmd, 0x1104bfac);
+
+	/* Sets a range of pixel shader constants */
+	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
+	base_cmd->emit(base_cmd, 0x244);
+
+	base_cmd->emit(base_cmd, 0x22222222);
+	base_cmd->emit(base_cmd, 0x22222222);
+	base_cmd->emit(base_cmd, 0x22222222);
+	base_cmd->emit(base_cmd, 0x22222222);
+
+	/* clear mmCOMPUTE_RESOURCE_LIMITS */
+	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
+	base_cmd->emit(base_cmd, 0x215);
+	base_cmd->emit(base_cmd, 0);
+
+	/* dispatch direct command */
+	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PACKET3_DISPATCH_DIRECT,3));
+	base_cmd->emit(base_cmd, 0x10);
+	base_cmd->emit(base_cmd, 1);
+	base_cmd->emit(base_cmd, 1);
+	base_cmd->emit(base_cmd, 1);
+
+	base_cmd->emit_aligned(base_cmd, 7, 0xffff1000);
+	resources[0] = bo_dst;
+	resources[1] = bo_shader;
+	resources[2] = bo_cmd;
+	r = amdgpu_bo_list_create(device_handle, 3, resources, NULL, &bo_list);
+	igt_assert_eq(r, 0);
+
+	ib_info.ib_mc_address = mc_address_cmd;
+	ib_info.size = base_cmd->cdw;
+	ibs_request.ip_type = ip_type;
+	ibs_request.ring = ring;
+	ibs_request.resources = bo_list;
+	ibs_request.number_of_ibs = 1;
+	ibs_request.ibs = &ib_info;
+	ibs_request.fence_info.handle = NULL;
+
+	/* submit CS */
+	r = amdgpu_cs_submit(context_handle, 0, &ibs_request, 1);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_list_destroy(bo_list);
+	igt_assert_eq(r, 0);
+
+	fence_status.ip_type = ip_type;
+	fence_status.ip_instance = 0;
+	fence_status.ring = ring;
+	fence_status.context = context_handle;
+	fence_status.fence = ibs_request.seq_no;
+
+	/* wait for IB accomplished */
+	r = amdgpu_cs_query_fence_status(&fence_status,
+					 AMDGPU_TIMEOUT_INFINITE,
+					 0, &expired);
+	igt_assert_eq(r, 0);
+	igt_assert_eq(expired, true);
+
+	/* verify if memset test result meets with expected */
+	i = 0;
+	while(i < bo_dst_size) {
+		igt_assert_eq(ptr_dst[i++], 0x22);
+	}
+
+	amdgpu_bo_unmap_and_free(bo_dst, va_dst, mc_address_dst, bo_dst_size);
+	amdgpu_bo_unmap_and_free(bo_shader, va_shader, mc_address_shader,
+				 bo_shader_size);
+	amdgpu_bo_unmap_and_free(bo_cmd, va_cmd, mc_address_cmd, bo_cmd_size);
+	amdgpu_cs_ctx_free(context_handle);
+}
+
+void
+amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
+			    uint32_t ip_type, uint32_t ring, uint32_t version,
+			    int hang)
+{
+	amdgpu_context_handle context_handle;
+	amdgpu_bo_handle bo_src, bo_dst, bo_shader, bo_cmd, resources[4];
+	volatile unsigned char *ptr_dst;
+	void *ptr_shader;
+	unsigned char *ptr_src;
+	uint32_t *ptr_cmd;
+	uint64_t mc_address_src, mc_address_dst, mc_address_shader, mc_address_cmd;
+	amdgpu_va_handle va_src, va_dst, va_shader, va_cmd;
+	int i, r;
+	int bo_dst_size = 16384;
+	int bo_shader_size = 4096;
+	int bo_cmd_size = 4096;
+	struct amdgpu_cs_request ibs_request = {0};
+	struct amdgpu_cs_ib_info ib_info= {0};
+	uint32_t expired, hang_state, hangs;
+	enum cs_type cs_type;
+	amdgpu_bo_list_handle bo_list;
+	struct amdgpu_cs_fence fence_status = {0};
+	struct amdgpu_cmd_base * base_cmd = get_cmd_base();
+
+	r = amdgpu_cs_ctx_create(device_handle, &context_handle);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_alloc_and_map(device_handle, bo_cmd_size, 4096,
+				    AMDGPU_GEM_DOMAIN_GTT, 0,
+				    &bo_cmd, (void **)&ptr_cmd,
+				    &mc_address_cmd, &va_cmd);
+	igt_assert_eq(r, 0);
+	memset(ptr_cmd, 0, bo_cmd_size);
+	base_cmd->attach_buf(base_cmd, ptr_cmd, bo_cmd_size);
+
+	r = amdgpu_bo_alloc_and_map(device_handle, bo_shader_size, 4096,
+					AMDGPU_GEM_DOMAIN_VRAM, 0,
+					&bo_shader, &ptr_shader,
+					&mc_address_shader, &va_shader);
+	igt_assert_eq(r, 0);
+	memset(ptr_shader, 0, bo_shader_size);
+
+	cs_type = hang ? CS_HANG : CS_BUFFERCOPY;
+	r = amdgpu_dispatch_load_cs_shader(ptr_shader, cs_type, version);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_alloc_and_map(device_handle, bo_dst_size, 4096,
+					AMDGPU_GEM_DOMAIN_VRAM, 0,
+					&bo_src, (void **)&ptr_src,
+					&mc_address_src, &va_src);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_alloc_and_map(device_handle, bo_dst_size, 4096,
+					AMDGPU_GEM_DOMAIN_VRAM, 0,
+					&bo_dst, (void **)&ptr_dst,
+					&mc_address_dst, &va_dst);
+	igt_assert_eq(r, 0);
+
+	///TODO helper function for this bloc
+	amdgpu_dispatch_init(ip_type, base_cmd,  version);
+	/*  Issue commands to set cu mask used in current dispatch */
+	amdgpu_dispatch_write_cumask(base_cmd, version);
+	/* Writes shader state to HW */
+	amdgpu_dispatch_write2hw(base_cmd, mc_address_shader, version);
+	memset(ptr_src, 0x55, bo_dst_size);
+
+	/* Write constant data */
+	/* Writes the texture resource constants data to the SGPRs */
+	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
+	base_cmd->emit(base_cmd, 0x240);
+	base_cmd->emit(base_cmd, mc_address_src);
+
+	base_cmd->emit(base_cmd, (mc_address_src >> 32) | 0x100000);
+
+	base_cmd->emit(base_cmd, 0x400);
+	if (version == 9)
+		base_cmd->emit(base_cmd,0x74fac);
+	else if (version == 10)
+		base_cmd->emit(base_cmd,0x1104bfac);
+
+	/* Writes the UAV constant data to the SGPRs. */
+	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
+	base_cmd->emit(base_cmd, 0x244);
+	base_cmd->emit(base_cmd, mc_address_dst);
+	base_cmd->emit(base_cmd, (mc_address_dst >> 32) | 0x100000);
+	base_cmd->emit(base_cmd, 0x400);
+	if (version == 9)
+		base_cmd->emit(base_cmd, 0x74fac);
+	else if (version == 10)
+		base_cmd->emit(base_cmd, 0x1104bfac);
+
+	/* clear mmCOMPUTE_RESOURCE_LIMITS */
+	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
+	base_cmd->emit(base_cmd, 0x215);
+	base_cmd->emit(base_cmd, 0);
+
+	/* dispatch direct command */
+	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PACKET3_DISPATCH_DIRECT,3));
+	base_cmd->emit(base_cmd, 0x10);
+	base_cmd->emit(base_cmd, 1);
+	base_cmd->emit(base_cmd, 1);
+	base_cmd->emit(base_cmd, 1);
+
+	base_cmd->emit_aligned(base_cmd, 7, 0xffff1000); /* type3 nop packet */
+
+	resources[0] = bo_shader;
+	resources[1] = bo_src;
+	resources[2] = bo_dst;
+	resources[3] = bo_cmd;
+
+	r = amdgpu_bo_list_create(device_handle, 4, resources, NULL, &bo_list);
+	igt_assert_eq(r, 0);
+
+	ib_info.ib_mc_address = mc_address_cmd;
+	ib_info.size = base_cmd->cdw;
+	ibs_request.ip_type = ip_type;
+	ibs_request.ring = ring;
+	ibs_request.resources = bo_list;
+	ibs_request.number_of_ibs = 1;
+	ibs_request.ibs = &ib_info;
+	ibs_request.fence_info.handle = NULL;
+	r = amdgpu_cs_submit(context_handle, 0, &ibs_request, 1);
+	igt_assert_eq(r, 0);
+
+	fence_status.ip_type = ip_type;
+	fence_status.ip_instance = 0;
+	fence_status.ring = ring;
+	fence_status.context = context_handle;
+	fence_status.fence = ibs_request.seq_no;
+
+	/* wait for IB accomplished */
+	r = amdgpu_cs_query_fence_status(&fence_status,
+					 AMDGPU_TIMEOUT_INFINITE,
+					 0, &expired);
+
+	if (!hang) {
+		igt_assert_eq(r, 0);
+		igt_assert_eq(expired, true);
+
+		/* verify if memcpy test result meets with expected */
+		i = 0;
+		/*it works up to 12287 ? vs required 16384 for gfx 8*/
+		while(i < bo_dst_size) {
+			igt_assert_eq(ptr_dst[i], ptr_src[i]);
+			i++;
+		}
+	} else {
+		r = amdgpu_cs_query_reset_state(context_handle, &hang_state, &hangs);
+		igt_assert_eq(r, 0);
+		igt_assert_eq(hang_state, AMDGPU_CTX_UNKNOWN_RESET);
+	}
+
+	amdgpu_bo_list_destroy(bo_list);
+	amdgpu_bo_unmap_and_free(bo_src, va_src, mc_address_src, bo_dst_size);
+	amdgpu_bo_unmap_and_free(bo_dst, va_dst, mc_address_dst, bo_dst_size);
+	amdgpu_bo_unmap_and_free(bo_cmd, va_cmd, mc_address_cmd, bo_cmd_size);
+	amdgpu_bo_unmap_and_free(bo_shader, va_shader, mc_address_shader,
+				 bo_shader_size);
+	amdgpu_cs_ctx_free(context_handle);
+}
+
+static void
+amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
+				      uint32_t ip_type, uint32_t ring,
+				      int version, uint32_t gpu_reset_status_equel)
+{
+	amdgpu_context_handle context_handle;
+	amdgpu_bo_handle bo_src, bo_dst, bo_shader, bo_cmd, resources[4];
+	volatile unsigned char *ptr_dst;
+	void *ptr_shader;
+	unsigned char *ptr_src;
+	uint32_t *ptr_cmd;
+	uint64_t mc_address_src, mc_address_dst, mc_address_shader, mc_address_cmd;
+	amdgpu_va_handle va_src, va_dst, va_shader, va_cmd;
+	int r;
+
+	int bo_dst_size = 0x4000000;
+	int bo_shader_size = 0x400000;
+	int bo_cmd_size = 4096;
+
+	struct amdgpu_cs_request ibs_request = {0};
+	struct amdgpu_cs_ib_info ib_info= {0};
+	uint32_t hang_state, hangs, expired;
+	struct amdgpu_gpu_info gpu_info = {0};
+	amdgpu_bo_list_handle bo_list;
+	struct amdgpu_cs_fence fence_status = {0};
+
+	struct amdgpu_cmd_base * base_cmd = get_cmd_base();
+
+	r = amdgpu_query_gpu_info(device_handle, &gpu_info);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_cs_ctx_create(device_handle, &context_handle);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_alloc_and_map(device_handle, bo_cmd_size, 4096,
+				    AMDGPU_GEM_DOMAIN_GTT, 0,
+				    &bo_cmd, (void **)&ptr_cmd,
+				    &mc_address_cmd, &va_cmd);
+	igt_assert_eq(r, 0);
+	memset(ptr_cmd, 0, bo_cmd_size);
+	base_cmd->attach_buf(base_cmd, ptr_cmd, bo_cmd_size);
+
+	r = amdgpu_bo_alloc_and_map(device_handle, bo_shader_size, 4096,
+				    AMDGPU_GEM_DOMAIN_VRAM, 0, &bo_shader,
+				    &ptr_shader, &mc_address_shader, &va_shader);
+	igt_assert_eq(r, 0);
+	memset(ptr_shader, 0, bo_shader_size);
+
+	r = amdgpu_dispatch_load_cs_shader_hang_slow(ptr_shader,
+						     gpu_info.family_id);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_alloc_and_map(device_handle, bo_dst_size, 4096,
+				    AMDGPU_GEM_DOMAIN_VRAM, 0, &bo_src,
+				    (void **)&ptr_src, &mc_address_src, &va_src);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_alloc_and_map(device_handle, bo_dst_size, 4096,
+				    AMDGPU_GEM_DOMAIN_VRAM, 0, &bo_dst,
+				    (void **)&ptr_dst, &mc_address_dst, &va_dst);
+	igt_assert_eq(r, 0);
+
+	memset(ptr_src, 0x55, bo_dst_size);
+
+	amdgpu_dispatch_init(ip_type, base_cmd, version );
+
+
+
+	/*  Issue commands to set cu mask used in current dispatch */
+	amdgpu_dispatch_write_cumask(base_cmd, version);
+
+	/* Writes shader state to HW */
+	amdgpu_dispatch_write2hw(base_cmd, mc_address_shader, version);
+
+	/* Write constant data */
+	/* Writes the texture resource constants data to the SGPRs */
+	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
+	base_cmd->emit(base_cmd, 0x240);
+	base_cmd->emit(base_cmd, mc_address_src);
+	base_cmd->emit(base_cmd, (mc_address_src >> 32) | 0x100000);
+	base_cmd->emit(base_cmd, 0x400000);
+	if (version == 9)
+		base_cmd->emit(base_cmd, 0x74fac);
+	else if (version == 10)
+		base_cmd->emit(base_cmd, 0x1104bfac);
+
+
+	/* Writes the UAV constant data to the SGPRs. */
+	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
+	base_cmd->emit(base_cmd, 0x244);
+	base_cmd->emit(base_cmd, mc_address_dst);
+	base_cmd->emit(base_cmd, (mc_address_dst >> 32) | 0x100000);
+	base_cmd->emit(base_cmd, 0x400000);
+	if (version == 9)
+		base_cmd->emit(base_cmd, 0x74fac);
+	else if (version == 10)
+		base_cmd->emit(base_cmd, 0x1104bfac);
+
+
+	/* clear mmCOMPUTE_RESOURCE_LIMITS */
+	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
+	base_cmd->emit(base_cmd, 0x215);
+	base_cmd->emit(base_cmd, 0);
+
+	/* dispatch direct command */
+
+	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PACKET3_DISPATCH_DIRECT, 3));
+	base_cmd->emit(base_cmd, 0x10000);
+	base_cmd->emit(base_cmd, 1);
+	base_cmd->emit(base_cmd, 1);
+	base_cmd->emit(base_cmd, 1);
+
+	base_cmd->emit_aligned(base_cmd, 7, 0xffff1000); /* type3 nop packet */
+
+	resources[0] = bo_shader;
+	resources[1] = bo_src;
+	resources[2] = bo_dst;
+	resources[3] = bo_cmd;
+	r = amdgpu_bo_list_create(device_handle, 4, resources, NULL, &bo_list);
+	igt_assert_eq(r, 0);
+
+	ib_info.ib_mc_address = mc_address_cmd;
+	ib_info.size = base_cmd->cdw;
+	ibs_request.ip_type = ip_type;
+	ibs_request.ring = ring;
+	ibs_request.resources = bo_list;
+	ibs_request.number_of_ibs = 1;
+	ibs_request.ibs = &ib_info;
+	ibs_request.fence_info.handle = NULL;
+	r = amdgpu_cs_submit(context_handle, 0, &ibs_request, 1);
+	igt_assert_eq(r, 0);
+
+	fence_status.ip_type = ip_type;
+	fence_status.ip_instance = 0;
+	fence_status.ring = ring;
+	fence_status.context = context_handle;
+	fence_status.fence = ibs_request.seq_no;
+
+	/* wait for IB accomplished */
+	r = amdgpu_cs_query_fence_status(&fence_status,
+					 AMDGPU_TIMEOUT_INFINITE,
+					 0, &expired);
+
+	r = amdgpu_cs_query_reset_state(context_handle, &hang_state, &hangs);
+	igt_assert_eq(r, 0);
+	igt_assert_eq(hang_state, gpu_reset_status_equel);
+
+	r = amdgpu_bo_list_destroy(bo_list);
+	igt_assert_eq(r, 0);
+
+	amdgpu_bo_unmap_and_free(bo_src, va_src, mc_address_src, bo_dst_size);
+	amdgpu_bo_unmap_and_free(bo_dst, va_dst, mc_address_dst, bo_dst_size);
+	amdgpu_bo_unmap_and_free(bo_cmd, va_cmd, mc_address_cmd, bo_cmd_size);
+	amdgpu_bo_unmap_and_free(bo_shader, va_shader, mc_address_shader,
+				 bo_shader_size);
+	amdgpu_cs_ctx_free(context_handle);
+	free_cmd_base(base_cmd);
+}
+
+void
+amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
+				 uint32_t ip_type)
+{
+	int r;
+	struct drm_amdgpu_info_hw_ip info;
+	uint32_t ring_id, version;
+
+	r = amdgpu_query_hw_ip_info(device_handle, ip_type, 0, &info);
+	igt_assert_eq(r, 0);
+	if (!info.available_rings)
+		printf("SKIP ... as there's no ring for ip %d\n", ip_type);
+
+	version = info.hw_ip_version_major;
+	if (version != 9 && version != 10) {
+		printf("SKIP ... unsupported gfx version %d\n", version);
+		return;
+	}
+	//TODO IGT
+	//if (version < 9)
+	//	version = 9;
+	for (ring_id = 0; (1 << ring_id) & info.available_rings; ring_id++) {
+		amdgpu_memcpy_dispatch_test(device_handle, ip_type,
+					    ring_id,  version, 0);
+		amdgpu_memcpy_dispatch_hang_slow_test(device_handle, ip_type,
+						      ring_id, version,
+						      ip_type == AMDGPU_HW_IP_GFX ?
+				AMDGPU_CTX_UNKNOWN_RESET:AMDGPU_CTX_NO_RESET);
+
+		/* TODO Why reset status is differant? */
+		amdgpu_memcpy_dispatch_test(device_handle, ip_type, ring_id,
+					    version, 0);
+	}
+}
+
+void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_type)
+{
+	int r;
+	struct drm_amdgpu_info_hw_ip info;
+	uint32_t ring_id, version;
+
+	r = amdgpu_query_hw_ip_info(device_handle, AMDGPU_HW_IP_GFX, 0, &info);
+	igt_assert_eq(r, 0);
+	if (!info.available_rings)
+		printf("SKIP ... as there's no graphics ring\n");
+
+	version = info.hw_ip_version_major;
+	if (version != 9 && version != 10) {
+		printf("SKIP ... unsupported gfx version %d\n", version);
+		return;
+	}
+	if (version < 9)
+		version = 9;
+
+	for (ring_id = 0; (1 << ring_id) & info.available_rings; ring_id++) {
+		amdgpu_memset_dispatch_test(device_handle, ip_type, ring_id,
+					    version);
+		amdgpu_memcpy_dispatch_test(device_handle, ip_type, ring_id,
+					    version, 0);
+	}
+}
+
diff --git a/lib/amdgpu/amd_dispatch.h b/lib/amdgpu/amd_dispatch.h
new file mode 100644
index 000000000..1905a5562
--- /dev/null
+++ b/lib/amdgpu/amd_dispatch.h
@@ -0,0 +1,42 @@
+/*
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
+#ifndef AMD_DISPATCH_H
+#define AMD_DISPATCH_H
+
+#include <amdgpu.h>
+
+void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle,
+			      uint32_t ip_type);
+
+void amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
+					uint32_t ip_type,
+					uint32_t ring,
+					uint32_t version,
+					int hang);
+
+void amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
+				      uint32_t ip_type);
+
+
+#endif
diff --git a/lib/meson.build b/lib/meson.build
index 956c73095..9bb0c8410 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -135,7 +135,8 @@ if libdrm_amdgpu.found()
 		'amdgpu/amd_shaders.c',
 		'amdgpu/amd_gfx_v8_0.c',
 		'amdgpu/amd_gfx_v9_0.c',
-		'amdgpu/amd_dispatch_helpers.c'
+		'amdgpu/amd_dispatch_helpers.c',
+		'amdgpu/amd_dispatch.c'
 	]
 endif
 
diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 68a8ac9de..9be034975 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -30,6 +30,7 @@
 #include "lib/amdgpu/amd_compute.h"
 #include "lib/amdgpu/amd_gfx.h"
 #include "lib/amdgpu/amd_shaders.h"
+#include "lib/amdgpu/amd_dispatch.h"
 
 #define BUFFER_SIZE (8 * 1024)
 
@@ -625,6 +626,18 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle)
 	free_cmd_base(base);
 }
 
+static void
+amdgpu_gfx_dispatch_test_gfx(amdgpu_device_handle device_handle)
+{
+	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_GFX);
+}
+
+static void
+amdgpu_gfx_dispatch_test_compute(amdgpu_device_handle device_handle)
+{
+	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE);
+}
+
 igt_main
 {
 	amdgpu_device_handle device;
@@ -678,6 +691,11 @@ igt_main
 	igt_subtest("sync_dependency_test")
 		amdgpu_sync_dependency_test(device);
 
+	igt_subtest("amdgpu_gfx_dispatch_test_compute")
+	amdgpu_gfx_dispatch_test_compute(device);
+
+	igt_subtest("amdgpu_gfx_dispatch_test_gfx")
+	amdgpu_gfx_dispatch_test_gfx(device);
 
 	igt_fixture {
 		amdgpu_device_deinitialize(device);
-- 
2.25.1
