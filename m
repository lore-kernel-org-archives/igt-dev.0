Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 214D49725E
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Aug 2022 00:29:31 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 10 Aug 2022 20:29:16 -0400
Message-ID: <20220811002920.32207-3-vitaly.prosyak@amd.com>
In-Reply-To: <20220811002920.32207-1-vitaly.prosyak@amd.com>
References: <20220811002920.32207-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 3/7] lib/amdgpu: added dispatch helper functions
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

 Refactor amdgpu_sync_dependency_test to use new
 approach for registers offset.

 Refactor amd_PM4.h

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_PM4.h              |  16 +---
 lib/amdgpu/amd_dispatch_helpers.c | 146 ++++++++++++++++++++++++++++++
 lib/amdgpu/amd_dispatch_helpers.h |  37 ++++++++
 lib/meson.build                   |   1 +
 tests/amdgpu/amd_basic.c          |  18 ++--
 5 files changed, 195 insertions(+), 23 deletions(-)
 create mode 100644 lib/amdgpu/amd_dispatch_helpers.c
 create mode 100644 lib/amdgpu/amd_dispatch_helpers.h

diff --git a/lib/amdgpu/amd_PM4.h b/lib/amdgpu/amd_PM4.h
index dec70c1a4..0588b4258 100644
--- a/lib/amdgpu/amd_PM4.h
+++ b/lib/amdgpu/amd_PM4.h
@@ -49,6 +49,7 @@
 			 (((op) & 0xFF) << 8) |				\
 			 ((n) & 0x3FFF) << 16)
 
+#define PACKET3_COMPUTE(op, n) PACKET3(op, n) | (1 << 1)
 /* Packet 3 types */
 #define	PACKET3_NOP					0x10
 
@@ -137,7 +138,6 @@
 #              define PACKET3_DMA_DATA_CMD_DAIC    (1 << 29)
 #              define PACKET3_DMA_DATA_CMD_RAW_WAIT  (1 << 30)
 
-
 #define	PACKET3_ATOMIC_MEM				0x1E
 #define     TC_OP_ATOMIC_CMPSWAP_RTN_32          0x00000008
 #define     ATOMIC_MEM_COMMAND(x)               ((x) << 8)
@@ -151,8 +151,6 @@
 #define     ATOMIC_MEM_ENGINESEL(x)             ((x) << 30)
             /* 0 - micro_engine.*/
 
-
-
 #define PKT3_CONTEXT_CONTROL                   0x28
 #define     CONTEXT_CONTROL_LOAD_ENABLE(x)     (((unsigned)(x) & 0x1) << 31)
 #define     CONTEXT_CONTROL_LOAD_CE_RAM(x)     (((unsigned)(x) & 0x1) << 28)
@@ -161,7 +159,6 @@
 #define PKT3_CLEAR_STATE			0x12
 
 #define PKT3_SET_SH_REG				0x76
-#define	PACKET3_SET_SH_REG_START		0x00002c00
 
 #define PKT3_SET_SH_REG_INDEX			0x9B
 
@@ -172,15 +169,4 @@
 #define PACKET3_SET_UCONFIG_REG			0x79
 #define PACKET3_DRAW_INDEX_AUTO			0x2D
 
-/*TODO organize as iit is in MESA*/
-/* gfx 8 */
-#define mmCOMPUTE_PGM_LO			0x2e0c
-#define mmCOMPUTE_PGM_RSRC1			0x2e12
-#define mmCOMPUTE_TMPRING_SIZE			0x2e18
-#define mmCOMPUTE_USER_DATA_0			0x2e40
-#define mmCOMPUTE_USER_DATA_1			0x2e41
-#define mmCOMPUTE_RESOURCE_LIMITS		0x2e15
-#define mmCOMPUTE_NUM_THREAD_X			0x2e07
-
-
 #endif
diff --git a/lib/amdgpu/amd_dispatch_helpers.c b/lib/amdgpu/amd_dispatch_helpers.c
new file mode 100644
index 000000000..3eddae968
--- /dev/null
+++ b/lib/amdgpu/amd_dispatch_helpers.c
@@ -0,0 +1,146 @@
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
+
+#include "amd_dispatch_helpers.h"
+#include <amdgpu_drm.h>
+#include "amd_PM4.h"
+#include "amd_ip_blocks.h"
+#include "igt.h"
+
+ int amdgpu_dispatch_init(uint32_t ip_type, struct amdgpu_cmd_base * base, uint32_t version)
+{
+	int i = base->cdw;
+
+	/* Write context control and load shadowing register if necessary */
+	if (ip_type == AMDGPU_HW_IP_GFX) {
+		base->emit(base, PACKET3(PKT3_CONTEXT_CONTROL, 1));
+		base->emit(base, 0x80000000);
+		base->emit(base, 0x80000000);
+	}
+
+	/* Issue commands to set default compute state. */
+	/* clear mmCOMPUTE_START_Z - mmCOMPUTE_START_X */
+	base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 3));
+	base->emit(base, 0x204);
+	base->emit(base, 0);
+	base->emit(base, 0);
+	base->emit(base, 0);
+
+	/* clear mmCOMPUTE_TMPRING_SIZE */
+	base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
+	base->emit(base, 0x218);
+	base->emit(base, 0);
+	if (version == 10) {
+		/* mmCOMPUTE_SHADER_CHKSUM */
+		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
+		base->emit(base, 0x22a);
+		base->emit(base, 0);
+		/* mmCOMPUTE_REQ_CTRL */
+		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 6));
+		base->emit(base, 0x222);
+		base->emit(base, 0x222);
+		base->emit(base, 0x222);
+		base->emit(base, 0x222);
+		base->emit(base, 0x222);
+		base->emit(base, 0x222);
+		base->emit(base, 0x222);
+		/* mmCP_COHER_START_DELAY */
+		base->emit(base, PACKET3(PACKET3_SET_UCONFIG_REG, 1));
+		base->emit(base, 0x7b);
+		base->emit(base, 0x20);
+	}
+
+	return base->cdw - i;
+}
+
+int amdgpu_dispatch_write_cumask(struct amdgpu_cmd_base * base, uint32_t version)
+ {
+ 	int offset_prev = base->cdw;
+ 	if (version == 9) {
+ 	/*  Issue commands to set cu mask used in current dispatch */
+ 	/* set mmCOMPUTE_STATIC_THREAD_MGMT_SE1 - mmCOMPUTE_STATIC_THREAD_MGMT_SE0 */
+ 		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 2));
+ 		base->emit(base, 0x216);
+ 		base->emit(base, 0xffffffff);
+ 		base->emit(base, 0xffffffff);
+ 	} else if(version == 10) {
+		/* set mmCOMPUTE_STATIC_THREAD_MGMT_SE1 - mmCOMPUTE_STATIC_THREAD_MGMT_SE0 */
+ 		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG_INDEX, 2));
+ 		base->emit(base, 0x30000216);
+ 		base->emit(base, 0xffffffff);
+ 		base->emit(base, 0xffffffff);
+		/* set mmCOMPUTE_STATIC_THREAD_MGMT_SE3 - mmCOMPUTE_STATIC_THREAD_MGMT_SE2 */
+ 		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG_INDEX, 2));
+ 		base->emit(base, 0x30000219);
+ 		base->emit(base, 0xffffffff);
+ 		base->emit(base, 0xffffffff);
+	}
+
+
+ 	/* set mmCOMPUTE_STATIC_THREAD_MGMT_SE3 - mmCOMPUTE_STATIC_THREAD_MGMT_SE2 */
+ 	base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 2));
+ 	base->emit(base, 0x219);
+ 	base->emit(base, 0xffffffff);
+ 	base->emit(base, 0xffffffff);
+
+ 	return base->cdw - offset_prev;
+ }
+
+
+int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base * base, uint64_t shader_addr, uint32_t version)
+{
+	static const uint32_t bufferclear_cs_shader_registers_gfx9[][2] = {
+		{0x2e12, 0x000C0041},	//{ mmCOMPUTE_PGM_RSRC1,	0x000C0041 },
+		{0x2e13, 0x00000090},	//{ mmCOMPUTE_PGM_RSRC2,	0x00000090 },
+		{0x2e07, 0x00000040},	//{ mmCOMPUTE_NUM_THREAD_X,	0x00000040 },
+		{0x2e08, 0x00000001},	//{ mmCOMPUTE_NUM_THREAD_Y,	0x00000001 },
+		{0x2e09, 0x00000001},	//{ mmCOMPUTE_NUM_THREAD_Z,	0x00000001 }
+	};
+
+	static const uint32_t bufferclear_cs_shader_registers_num_gfx9 = ARRAY_SIZE(bufferclear_cs_shader_registers_gfx9);
+	int offset_prev = base->cdw;
+	int j;
+
+	/* Writes shader state to HW */
+	/* set mmCOMPUTE_PGM_HI - mmCOMPUTE_PGM_LO */
+	base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 2));
+	base->emit(base, 0x20c);
+	base->emit(base, shader_addr >> 8);
+	base->emit(base, shader_addr >> 40);
+	/* write sh regs */
+	for (j = 0; j < bufferclear_cs_shader_registers_num_gfx9; j++) {
+		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
+		/* - Gfx9ShRegBase */
+		base->emit(base,bufferclear_cs_shader_registers_gfx9[j][0] - 0x2c00);
+		base->emit(base,bufferclear_cs_shader_registers_gfx9[j][1]);
+	}
+	if (version == 10) {
+		/* mmCOMPUTE_PGM_RSRC3 */
+		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
+		base->emit(base,0x228);
+		base->emit(base, 0 );
+	}
+	return base->cdw - offset_prev;
+}
diff --git a/lib/amdgpu/amd_dispatch_helpers.h b/lib/amdgpu/amd_dispatch_helpers.h
new file mode 100644
index 000000000..bea0c4248
--- /dev/null
+++ b/lib/amdgpu/amd_dispatch_helpers.h
@@ -0,0 +1,37 @@
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
+#ifndef AMD_DISPATCH_HELPERS_H
+#define AMD_DISPATCH_HELPERS_H
+
+#include <amdgpu.h>
+
+struct amdgpu_cmd_base;
+
+int amdgpu_dispatch_init( uint32_t ip_type,struct amdgpu_cmd_base *base_cmd, uint32_t version);
+
+int amdgpu_dispatch_write_cumask(struct amdgpu_cmd_base *base_cmd, uint32_t version);
+
+int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base *base_cmd, uint64_t shader_addr, uint32_t version);
+
+#endif
diff --git a/lib/meson.build b/lib/meson.build
index 7339bf98b..956c73095 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -135,6 +135,7 @@ if libdrm_amdgpu.found()
 		'amdgpu/amd_shaders.c',
 		'amdgpu/amd_gfx_v8_0.c',
 		'amdgpu/amd_gfx_v9_0.c',
+		'amdgpu/amd_dispatch_helpers.c'
 	]
 endif
 
diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 82964016a..68a8ac9de 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -477,6 +477,7 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle)
 	const uint32_t *shader;
 
 	struct amdgpu_cmd_base * base = get_cmd_base();
+	const struct amdgpu_ip_block_version * ip_block = get_ip_block(device_handle, AMD_IP_GFX);
 
 	r = amdgpu_cs_ctx_create(device_handle, &context_handle[0]);
 	igt_assert_eq(r, 0);
@@ -499,6 +500,7 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle)
 	/* assign cmd buffer */
 	base->attach_buf(base, ib_result_cpu, const_size);
 
+
 	base->emit(base, PACKET3(PKT3_CONTEXT_CONTROL, 1));
 	base->emit(base, 0x80000000);
 	base->emit(base, 0x80000000);
@@ -509,31 +511,31 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle)
 	/* Program compute regs */
 	/* TODO ASIC registers do based on predefined offsets */
 	base->emit(base, PACKET3(PKT3_SET_SH_REG, 2));
-	base->emit(base, mmCOMPUTE_PGM_LO - PACKET3_SET_SH_REG_START);
+	base->emit(base, ip_block->funcs->get_reg_offset(COMPUTE_PGM_LO));
 	base->emit(base, (ib_result_mc_address + code_offset * 4) >> 8);
 	base->emit(base, (ib_result_mc_address + code_offset * 4) >> 40);
 
 	base->emit(base,PACKET3(PKT3_SET_SH_REG, 2));
-	base->emit(base, mmCOMPUTE_PGM_RSRC1 - PACKET3_SET_SH_REG_START);
+	base->emit(base, ip_block->funcs->get_reg_offset(COMPUTE_PGM_RSRC1));
 
 	base->emit(base, 0x002c0040);
 	base->emit(base, 0x00000010);
 
 	base->emit(base, PACKET3(PKT3_SET_SH_REG, 1));
-	base->emit(base, mmCOMPUTE_TMPRING_SIZE - PACKET3_SET_SH_REG_START);
+	base->emit(base, ip_block->funcs->get_reg_offset(COMPUTE_TMPRING_SIZE));
 	base->emit(base, 0x00000100);
 
 	base->emit(base, PACKET3(PKT3_SET_SH_REG, 2));
-	base->emit(base, mmCOMPUTE_USER_DATA_0 - PACKET3_SET_SH_REG_START);
+	base->emit(base, ip_block->funcs->get_reg_offset(COMPUTE_USER_DATA_0));
 	base->emit(base, 0xffffffff & (ib_result_mc_address + data_offset * 4));
 	base->emit(base, (0xffffffff00000000 & (ib_result_mc_address + data_offset * 4)) >> 32);
 
 	base->emit(base, PACKET3(PKT3_SET_SH_REG, 1));
-	base->emit(base, mmCOMPUTE_RESOURCE_LIMITS - PACKET3_SET_SH_REG_START);
+	base->emit(base, ip_block->funcs->get_reg_offset(COMPUTE_RESOURCE_LIMITS));
 	base->emit(base, 0);
 
 	base->emit(base, PACKET3(PKT3_SET_SH_REG, 3));
-	base->emit(base, mmCOMPUTE_NUM_THREAD_X - PACKET3_SET_SH_REG_START);
+	base->emit(base, ip_block->funcs->get_reg_offset(COMPUTE_NUM_THREAD_X));
 	base->emit(base, 1);
 	base->emit(base, 1);
 	base->emit(base, 1);
@@ -546,11 +548,11 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle)
 	base->emit(base, 0x00000045);
 	base->emit_aligned(base, 7, GFX_COMPUTE_NOP);
 
-	base->emit_buf(base, shader, code_offset,size_bytes);
+	memcpy(base->buf + code_offset , shader, size_bytes);
 
 	memset(&ib_info, 0, sizeof(struct amdgpu_cs_ib_info));
 	ib_info.ib_mc_address = ib_result_mc_address;
-	ib_info.size = base->cdw;;
+	ib_info.size = base->cdw;
 
 	memset(&ibs_request, 0, sizeof(struct amdgpu_cs_request));
 	ibs_request.ip_type = AMDGPU_HW_IP_GFX;
-- 
2.25.1
