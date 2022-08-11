Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2044.outbound.protection.outlook.com [40.107.100.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3643292B8D
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Aug 2022 00:29:29 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 10 Aug 2022 20:29:14 -0400
Message-ID: <20220811002920.32207-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 1/7] lib/amdgpu: improve operations to create
 commands and misc
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

 Add and refactor the following methods to amdgpu_cmd_base:
 - emit_aligned
 - emit_repeat
 - emit_at_offset
 - emit_buf (refactor)

 Added register declarations and access functions.
 We will use MESA registers declarations in future commits.

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_gfx_v8_0.c  | 53 +++++++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_gfx_v8_0.h  | 31 ++++++++++++++++++++++
 lib/amdgpu/amd_gfx_v9_0.c  | 32 ++++++++++++++++++++++
 lib/amdgpu/amd_gfx_v9_0.h  | 29 ++++++++++++++++++++
 lib/amdgpu/amd_ip_blocks.c | 54 +++++++++++++++++++++++++++-----------
 lib/amdgpu/amd_ip_blocks.h | 12 ++++++---
 lib/amdgpu/amd_registers.h | 44 +++++++++++++++++++++++++++++++
 lib/meson.build            |  2 ++
 tests/amdgpu/amd_basic.c   |  4 +--
 9 files changed, 240 insertions(+), 21 deletions(-)
 create mode 100644 lib/amdgpu/amd_gfx_v8_0.c
 create mode 100644 lib/amdgpu/amd_gfx_v8_0.h
 create mode 100644 lib/amdgpu/amd_gfx_v9_0.c
 create mode 100644 lib/amdgpu/amd_gfx_v9_0.h
 create mode 100644 lib/amdgpu/amd_registers.h

diff --git a/lib/amdgpu/amd_gfx_v8_0.c b/lib/amdgpu/amd_gfx_v8_0.c
new file mode 100644
index 000000000..987d7053a
--- /dev/null
+++ b/lib/amdgpu/amd_gfx_v8_0.c
@@ -0,0 +1,53 @@
+/*
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
+#include "amd_registers.h"
+#include "amd_gfx_v8_0.h"
+#include "igt_core.h"
+
+#define mmCOMPUTE_PGM_LO			0x2e0c
+#define mmCOMPUTE_PGM_RSRC1			0x2e12
+#define mmCOMPUTE_TMPRING_SIZE			0x2e18
+#define mmCOMPUTE_USER_DATA_0			0x2e40
+#define mmCOMPUTE_USER_DATA_1			0x2e41
+#define mmCOMPUTE_RESOURCE_LIMITS		0x2e15
+#define mmCOMPUTE_NUM_THREAD_X			0x2e07
+
+#define	PACKET3_SET_SH_REG_START		0x00002c00
+
+static const struct amd_reg registers[] = {
+	{ COMPUTE_PGM_LO,		mmCOMPUTE_PGM_LO },
+	{ COMPUTE_PGM_RSRC1,		mmCOMPUTE_PGM_RSRC1 },
+	{ COMPUTE_TMPRING_SIZE,		mmCOMPUTE_TMPRING_SIZE },
+	{ COMPUTE_USER_DATA_0,		mmCOMPUTE_USER_DATA_0 },
+	{ COMPUTE_USER_DATA_1,		mmCOMPUTE_USER_DATA_1 },
+	{ COMPUTE_RESOURCE_LIMITS,	mmCOMPUTE_RESOURCE_LIMITS },
+	{ COMPUTE_NUM_THREAD_X,		mmCOMPUTE_NUM_THREAD_X },
+};
+
+int gfx_v8_0_get_reg_offset(enum general_reg reg_name)
+{
+	/* validate correctness of the offset */
+	igt_assert_eq(reg_name, registers[reg_name].reg_name);
+	return registers[reg_name].reg_offset - PACKET3_SET_SH_REG_START;
+}
diff --git a/lib/amdgpu/amd_gfx_v8_0.h b/lib/amdgpu/amd_gfx_v8_0.h
new file mode 100644
index 000000000..52ed418cb
--- /dev/null
+++ b/lib/amdgpu/amd_gfx_v8_0.h
@@ -0,0 +1,31 @@
+/*
+ * Copyright 2014 Advanced Micro Devices, Inc.
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
+#ifndef __AMD_GFX_V8_0_H__
+#define __AMD_GFX_V8_0_H__
+
+int gfx_v8_0_get_reg_offset(enum general_reg reg_name);
+
+#endif
+
diff --git a/lib/amdgpu/amd_gfx_v9_0.c b/lib/amdgpu/amd_gfx_v9_0.c
new file mode 100644
index 000000000..175411795
--- /dev/null
+++ b/lib/amdgpu/amd_gfx_v9_0.c
@@ -0,0 +1,32 @@
+/*
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
+#include "amd_registers.h"
+#include "amd_gfx_v9_0.h"
+#include "amd_gfx_v8_0.h"
+
+int gfx_v9_0_get_reg_offset(enum general_reg reg_name)
+{
+	int ret = gfx_v8_0_get_reg_offset(reg_name);
+	return ret;
+}
diff --git a/lib/amdgpu/amd_gfx_v9_0.h b/lib/amdgpu/amd_gfx_v9_0.h
new file mode 100644
index 000000000..e44a7d944
--- /dev/null
+++ b/lib/amdgpu/amd_gfx_v9_0.h
@@ -0,0 +1,29 @@
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
+#ifndef __AMD_GFX_V9_0_H__
+#define __AMD_GFX_V9_0_H__
+
+int gfx_v9_0_get_reg_offset(enum general_reg reg_name);
+
+#endif
diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 795eb1984..3e11b34d3 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -32,6 +32,7 @@
 #include <amdgpu_drm.h>
 #include "amdgpu_asic_addr.h"
 #include "amd_family.h"
+#include "amd_gfx_v8_0.h"
 
 /*
  * SDMA functions:
@@ -328,10 +329,10 @@ static const struct amdgpu_ip_funcs gfx_v8_x_ip_funcs = {
 	.const_fill = gfx_ring_const_fill,
 	.copy_linear = gfx_ring_copy_linear,
 	.compare = x_compare,
-	.compare_pattern = x_compare_pattern
+	.compare_pattern = x_compare_pattern,
+	.get_reg_offset = gfx_v8_0_get_reg_offset,
 };
 
-
 static const struct amdgpu_ip_funcs sdma_v3_x_ip_funcs = {
 	.family_id = FAMILY_VI,
 	.align_mask = 0xff,
@@ -342,10 +343,10 @@ static const struct amdgpu_ip_funcs sdma_v3_x_ip_funcs = {
 	.const_fill = sdma_ring_const_fill,
 	.copy_linear = sdma_ring_copy_linear,
 	.compare = x_compare,
-	.compare_pattern = x_compare_pattern
+	.compare_pattern = x_compare_pattern,
+	.get_reg_offset = gfx_v8_0_get_reg_offset,
 };
 
-
 const struct amdgpu_ip_block_version gfx_v8_x_ip_block = {
 	.type = AMD_IP_GFX,
 	.major = 8,
@@ -452,13 +453,40 @@ cmd_emit(struct amdgpu_cmd_base  *base, uint32_t value)
 	base->buf[base->cdw++] = value;
 }
 
+static void
+cmd_emit_aligned(struct amdgpu_cmd_base *base, uint32_t mask, uint32_t cmd)
+{
+	while(base->cdw & mask)
+		base->emit(base, cmd);
+}
 static void
 cmd_emit_buf(struct amdgpu_cmd_base  *base, const void *ptr, uint32_t offset_bytes, uint32_t size_bytes)
 {
-	/* we assume that caller knows what is doing and we loose the buffer current index */
-	/* we may do this later abstract the internal index */
-	assert(base->cdw + ((offset_bytes + size_bytes)>>2) <  base->max_dw  );
-	memcpy(base->buf + offset_bytes , ptr, size_bytes);
+	uint32_t total_offset_dw = (offset_bytes + size_bytes) >> 2;
+	uint32_t offset_dw = offset_bytes >> 2;
+	/*TODO read the requirements to fix */
+	assert(size_bytes % 4 == 0); /* no gaps */
+	assert(offset_bytes % 4 == 0);
+	assert(base->cdw + total_offset_dw <  base->max_dw);
+	memcpy(base->buf + base->cdw + offset_dw , ptr, size_bytes);
+	base->cdw += total_offset_dw;
+}
+
+static void
+cmd_emit_repeat(struct amdgpu_cmd_base  *base, uint32_t value, uint32_t number_of_times)
+{
+	while (number_of_times > 0) {
+		assert(base->cdw <  base->max_dw);
+		base->buf[base->cdw++] = value;
+		number_of_times--;
+	}
+}
+
+static void
+cmd_emit_at_offset(struct amdgpu_cmd_base  *base, uint32_t value, uint32_t offset_dwords)
+{
+	assert(base->cdw + offset_dwords <  base->max_dw);
+	base->buf[base->cdw + offset_dwords] = value;
 }
 
 struct amdgpu_cmd_base *
@@ -474,6 +502,9 @@ get_cmd_base(void)
 	base->allocate_buf = cmd_allocate_buf;
 	base->attach_buf = cmd_attach_buf;
 	base->emit = cmd_emit;
+	base->emit_aligned= cmd_emit_aligned;
+	base->emit_repeat = cmd_emit_repeat;
+	base->emit_at_offset = cmd_emit_at_offset;
 	base->emit_buf = cmd_emit_buf;
 
 	return base;
@@ -490,13 +521,6 @@ free_cmd_base(struct amdgpu_cmd_base * base)
 
 }
 
-void
-append_cmd_base(struct amdgpu_cmd_base *base, uint32_t mask, uint32_t cmd)
-{
-	while(base->cdw & mask)
-		base->emit(base, cmd);
-}
-
 /*
  * GFX: 8.x
  * COMPUTE: 8.x
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 83809efee..9c24eba2a 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -25,6 +25,8 @@
 #ifndef AMD_IP_BLOCKS_H
 #define AMD_IP_BLOCKS_H
 
+#include "amd_registers.h"
+
 enum amd_ip_block_type {
 	AMD_IP_GFX,
 	AMD_IP_COMPUTE,
@@ -34,7 +36,6 @@ enum amd_ip_block_type {
 	AMD_IP_MAX,
 };
 
-
 /* aux struct to hold misc parameters for convenience to maintain */
 struct amdgpu_ring_context {
 
@@ -72,6 +73,7 @@ struct amdgpu_ring_context {
 	struct amdgpu_cs_request ibs_request; /* amdgpu_cs_query_fence_status */
 };
 
+
 struct amdgpu_ip_funcs {
 	uint32_t	family_id;
 	uint32_t	align_mask;
@@ -84,6 +86,8 @@ struct amdgpu_ip_funcs {
 	int (*copy_linear)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, uint32_t *pm4_dw);
 	int (*compare)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, int div);
 	int (*compare_pattern)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, int div);
+	int (*get_reg_offset)(enum general_reg reg);
+
 };
 
 extern const struct amdgpu_ip_block_version gfx_v6_0_ip_block;
@@ -122,6 +126,9 @@ struct amdgpu_cmd_base {
 	int (*allocate_buf)(struct amdgpu_cmd_base  *base, uint32_t size);
 	int (*attach_buf)(struct amdgpu_cmd_base  *base, void *ptr, uint32_t size_bytes);
 	void (*emit)(struct amdgpu_cmd_base  *base, uint32_t value);
+	void (*emit_aligned)(struct amdgpu_cmd_base  *base,uint32_t mask, uint32_t value);
+	void (*emit_repeat)(struct amdgpu_cmd_base  *base, uint32_t value, uint32_t number_of_times);
+	void (*emit_at_offset)(struct amdgpu_cmd_base  *base, uint32_t value, uint32_t offset_dwords);
 	void (*emit_buf)(struct amdgpu_cmd_base  *base, const void *ptr, uint32_t offset_bytes, uint32_t size_bytes);
 };
 
@@ -129,7 +136,4 @@ struct amdgpu_cmd_base* get_cmd_base(void);
 
 void free_cmd_base(struct amdgpu_cmd_base *base);
 
-void
-append_cmd_base(struct amdgpu_cmd_base *base, uint32_t mask, uint32_t cmd);
-
 #endif
diff --git a/lib/amdgpu/amd_registers.h b/lib/amdgpu/amd_registers.h
new file mode 100644
index 000000000..a01c9a84f
--- /dev/null
+++ b/lib/amdgpu/amd_registers.h
@@ -0,0 +1,44 @@
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
+#ifndef __AMD_REGISTERS_H
+#define __AMD_REGISTERS_H
+
+enum general_reg {
+	COMPUTE_PGM_LO,
+	COMPUTE_PGM_RSRC1,
+	COMPUTE_TMPRING_SIZE,
+	COMPUTE_USER_DATA_0,
+	COMPUTE_USER_DATA_1,
+	COMPUTE_RESOURCE_LIMITS,
+	COMPUTE_NUM_THREAD_X,
+};
+
+struct amd_reg {
+	enum general_reg reg_name;
+	int 	 reg_offset;
+};
+
+
+
+#endif
diff --git a/lib/meson.build b/lib/meson.build
index 98c2803b9..7339bf98b 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -133,6 +133,8 @@ if libdrm_amdgpu.found()
 		'amdgpu/amd_gfx.c',
 		'amdgpu/amd_ip_blocks.c',
 		'amdgpu/amd_shaders.c',
+		'amdgpu/amd_gfx_v8_0.c',
+		'amdgpu/amd_gfx_v9_0.c',
 	]
 endif
 
diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index ae424e819..82964016a 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -544,7 +544,7 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle)
 	base->emit(base, 1);
 	base->emit(base, 1);
 	base->emit(base, 0x00000045);
-	append_cmd_base(base, 7, GFX_COMPUTE_NOP);
+	base->emit_aligned(base, 7, GFX_COMPUTE_NOP);
 
 	base->emit_buf(base, shader, code_offset,size_bytes);
 
@@ -571,7 +571,7 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle)
 	base->emit(base,  0xfffffffc & (ib_result_mc_address + data_offset * 4));
 	base->emit(base,  (0xffffffff00000000 & (ib_result_mc_address + data_offset * 4)) >> 32);
 	base->emit(base,  99);
-	append_cmd_base(base, 7, GFX_COMPUTE_NOP);
+	base->emit_aligned(base, 7, GFX_COMPUTE_NOP);
 
 	memset(&ib_info, 0, sizeof(struct amdgpu_cs_ib_info));
 	ib_info.ib_mc_address = ib_result_mc_address + cdw_old * 4;
-- 
2.25.1
