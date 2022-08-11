Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0688B11BCC2
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Aug 2022 18:41:45 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 11 Aug 2022 14:41:33 -0400
Message-ID: <20220811184134.9565-6-vitaly.prosyak@amd.com>
In-Reply-To: <20220811184134.9565-1-vitaly.prosyak@amd.com>
References: <20220811184134.9565-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 6/7] lib/amdgpu: added draw test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: christian.koenig@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Use UMR to disassemble binary shaders.

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
 lib/amdgpu/amd_draw.c    | 440 +++++++++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_draw.h    |  34 +++
 lib/meson.build          |   3 +-
 tests/amdgpu/amd_basic.c |   4 +
 4 files changed, 480 insertions(+), 1 deletion(-)
 create mode 100644 lib/amdgpu/amd_draw.c
 create mode 100644 lib/amdgpu/amd_draw.h

diff --git a/lib/amdgpu/amd_draw.c b/lib/amdgpu/amd_draw.c
new file mode 100644
index 000000000..542569693
--- /dev/null
+++ b/lib/amdgpu/amd_draw.c
@@ -0,0 +1,440 @@
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
+#include "amd_draw.h"
+#include "amd_draw_helpers.h"
+#include "amd_memory.h"
+#include "amd_dispatch.h"
+#include "amd_shared_dispatch.h"  /*cs_type ps_type*/
+
+
+/**
+ * shared between
+ * amdgpu_dispatch_load_cs_shader
+ * amdgpu_draw_load_ps_shader
+ */
+	/**
+	...
+	s_bcnt0_i32_b32 exec_lo, exec_lo
+	...
+	...
+	s_dcache_inv
+	;;
+	...
+	...
+	...
+	s_waitcnt lgkmcnt(0)
+	image_sample v[0:3], v2, s[4:11], s[0:3] dmask:0xf
+	;;
+	s_not_b32 exec_lo, s12
+	s_waitcnt vmcnt(0)
+	s_nop 0
+	s_nop 0
+	...
+	v_add_f32_e32 v129, v0, v0
+	s_endpgm
+	 */
+unsigned int memcpy_ps_hang[] = {
+        0xFFFFFFFF, 0xBEFE0A7E, 0xBEFC0304, 0xC0C20100,
+        0xC0800300, 0xC8080000, 0xC80C0100, 0xC8090001,
+        0xC80D0101, 0xBF8C007F, 0xF0800F00, 0x00010002,
+        0xBEFE040C, 0xBF8C0F70, 0xBF800000, 0xBF800000,
+        0xF800180F, 0x03020100, 0xBF810000
+};
+
+static int amdgpu_draw_load_ps_shader(uint8_t *ptr, int ps_type, uint32_t version)
+{
+	/**
+	v_mov_b32_e32 v0, s0
+	v_mov_b32_e32 v1, s1
+	v_mov_b32_e32 v2, s2
+	v_mov_b32_e32 v3, s3
+	v_cvt_pkrtz_f16_f32 v0, v0, v1
+	;;
+	v_cvt_pkrtz_f16_f32 v1, v2, v3
+	;;
+	exp mrt0 v0, v0, v1, v1 done compr vm
+	;;
+	s_endpgm
+	 */
+	static const uint32_t ps_const_shader_gfx9[] = {
+	    0x7E000200, 0x7E020201, 0x7E040202, 0x7E060203,
+	    0xD2960000, 0x00020300, 0xD2960001, 0x00020702,
+	    0xC4001C0F, 0x00000100, 0xBF810000
+	};
+	static const uint32_t ps_const_shader_patchinfo_code_size_gfx9 = 6;
+
+	static const uint32_t ps_const_shader_patchinfo_code_gfx9[][10][6] = {
+	    {{ 0xBF800000, 0xBF800000, 0xBF800000, 0xBF800000, 0xC4001890, 0x00000000 },
+	     { 0xBF800000, 0xBF800000, 0xBF800000, 0xBF800000, 0xC4001801, 0x00000000 },
+	     { 0xBF800000, 0xBF800000, 0xBF800000, 0xBF800000, 0xC4001803, 0x00000100 },
+	     { 0xBF800000, 0xBF800000, 0xBF800000, 0xBF800000, 0xC4001803, 0x00000300 },
+	     { 0xD2960000, 0x00020300, 0xD2960001, 0x00020702, 0xC4001C0F, 0x00000100 },
+	     { 0xD2950000, 0x00020300, 0xD2950001, 0x00020702, 0xC4001C0F, 0x00000100 },
+	     { 0xD2940000, 0x00020300, 0xD2940001, 0x00020702, 0xC4001C0F, 0x00000100 },
+	     { 0xD2970000, 0x00020300, 0xD2970001, 0x00020702, 0xC4001C0F, 0x00000100 },
+	     { 0xD2980000, 0x00020300, 0xD2980001, 0x00020702, 0xC4001C0F, 0x00000100 },
+	     { 0xBF800000, 0xBF800000, 0xBF800000, 0xBF800000, 0xC400180F, 0x03020100 }
+	    }
+	};
+
+	static const uint32_t ps_const_shader_patchinfo_offset_gfx9[] = {
+	    0x00000004
+	};
+
+	/**
+	s_mov_b32 m0, s12
+	s_mov_b64 s[14:15], exec
+	s_wqm_b64 exec, exec
+	v_interp_p1_f32_e32 v6, v0, attr0.x
+	v_interp_p2_f32_e32 v6, v1, attr0.x
+	v_interp_p1_f32_e32 v7, v0, attr0.y
+	v_interp_p2_f32_e32 v7, v1, attr0.y
+	image_sample v[2:5], v6, s[0:7], s[8:11] dmask:0xf
+	;;
+	s_mov_b64 exec, s[14:15]
+	s_waitcnt vmcnt(0)
+	v_cvt_pkrtz_f16_f32 v0, v2, v3
+	;;
+	v_cvt_pkrtz_f16_f32 v1, v4, v5
+	;;
+	exp mrt0 v0, v0, v1, v1 done compr vm
+	;;
+	s_endpgm
+	 */
+	static const uint32_t ps_tex_shader_gfx9[] = {
+	    0xBEFC000C, 0xBE8E017E, 0xBEFE077E, 0xD4180000,
+	    0xD4190001, 0xD41C0100, 0xD41D0101, 0xF0800F00,
+	    0x00400206, 0xBEFE010E, 0xBF8C0F70, 0xD2960000,
+	    0x00020702, 0xD2960001, 0x00020B04, 0xC4001C0F,
+	    0x00000100, 0xBF810000
+	};
+
+	static const uint32_t ps_tex_shader_patchinfo_offset_gfx9[] = {
+	    0x0000000B
+	};
+
+	static const uint32_t ps_tex_shader_patchinfo_code_size_gfx9 = 6;
+
+	static const uint32_t ps_tex_shader_patchinfo_code_gfx9[][10][6] = {
+	    {{ 0xBF800000, 0xBF800000, 0xBF800000, 0xBF800000, 0xC4001890, 0x00000000 },
+	     { 0xBF800000, 0xBF800000, 0xBF800000, 0xBF800000, 0xC4001801, 0x00000002 },
+	     { 0xBF800000, 0xBF800000, 0xBF800000, 0xBF800000, 0xC4001803, 0x00000302 },
+	     { 0xBF800000, 0xBF800000, 0xBF800000, 0xBF800000, 0xC4001803, 0x00000502 },
+	     { 0xD2960000, 0x00020702, 0xD2960001, 0x00020B04, 0xC4001C0F, 0x00000100 },
+	     { 0xD2950000, 0x00020702, 0xD2950001, 0x00020B04, 0xC4001C0F, 0x00000100 },
+	     { 0xD2940000, 0x00020702, 0xD2940001, 0x00020B04, 0xC4001C0F, 0x00000100 },
+	     { 0xD2970000, 0x00020702, 0xD2970001, 0x00020B04, 0xC4001C0F, 0x00000100 },
+	     { 0xD2980000, 0x00020702, 0xD2980001, 0x00020B04, 0xC4001C0F, 0x00000100 },
+	     { 0xBF800000, 0xBF800000, 0xBF800000, 0xBF800000, 0xC400180F, 0x05040302 }
+	    }
+	};
+
+	/**
+	v_mov_b32_e32 v0, s0
+	v_mov_b32_e32 v1, s1
+	v_mov_b32_e32 v2, s2
+	v_mov_b32_e32 v3, s3
+	v_max_u16_e32 v0, v0, v1
+	v_max_u16_e32 v1, v2, v3
+	s_nop 0
+	s_nop 0
+	...
+	v_cndmask_b32_e32 v0, v0, v0, vcc
+	s_endpgm
+	 */
+	static const uint32_t ps_const_shader_gfx10[] = {
+	    0x7E000200, 0x7E020201, 0x7E040202, 0x7E060203,
+	    0x5E000300, 0x5E020702, 0xBF800000, 0xBF800000,
+	    0xF8001C0F, 0x00000100, 0xBF810000
+	};
+
+	static const uint32_t ps_const_shader_patchinfo_code_size_gfx10 = 6;
+
+	static const uint32_t ps_const_shader_patchinfo_code_gfx10[][10][6] = {
+	    {{ 0xBF800000, 0xBF800000, 0xBF800000, 0xBF800000, 0xF8001890, 0x00000000 },
+	     { 0xBF800000, 0xBF800000, 0xBF800000, 0xBF800000, 0xF8001801, 0x00000000 },
+	     { 0xBF800000, 0xBF800000, 0xBF800000, 0xBF800000, 0xF8001803, 0x00000100 },
+	     { 0xBF800000, 0xBF800000, 0xBF800000, 0xBF800000, 0xF8001803, 0x00000300 },
+	     { 0x5E000300, 0x5E020702, 0xBF800000, 0xBF800000, 0xF8001C0F, 0x00000100 },
+	     { 0xD7690000, 0x00020300, 0xD7690001, 0x00020702, 0xF8001C0F, 0x00000100 },
+	     { 0xD7680000, 0x00020300, 0xD7680001, 0x00020702, 0xF8001C0F, 0x00000100 },
+	     { 0xD76A0000, 0x00020300, 0xD76A0001, 0x00020702, 0xF8001C0F, 0x00000100 },
+	     { 0xD76B0000, 0x00020300, 0xD76B0001, 0x00020702, 0xF8001C0F, 0x00000100 },
+	     { 0xBF800000, 0xBF800000, 0xBF800000, 0xBF800000, 0xF800180F, 0x03020100 }
+	    }
+	};
+
+	static const uint32_t ps_const_shader_patchinfo_offset_gfx10[] = {
+	    0x00000004
+	};
+
+	/**
+		...
+	s_not_b32 s14, exec_lo
+	s_bcnt0_i32_b32 exec_lo, exec_lo
+	...
+	...
+	...
+	...
+	image_sample v[4:7], v2, s[0:7], s[8:11] dmask:0xf
+	;;
+	v_cndmask_b32_e32 v0, s3, v0, vcc
+	s_not_b32 exec_lo, s14
+	s_waitcnt vmcnt(0)
+	v_max_u16_e32 v0, v4, v5
+	v_max_u16_e32 v1, v6, v7
+	s_nop 0
+	s_nop 0
+	...
+	v_cndmask_b32_e32 v0, v0, v0, vcc
+	s_endpgm
+	 */
+	static const uint32_t ps_tex_shader_gfx10[] = {
+	    0xBEFC030C, 0xBE8E047E, 0xBEFE0A7E, 0xC8080000,
+	    0xC80C0100, 0xC8090001, 0xC80D0101, 0xF0800F0A,
+	    0x00400402, 0x00000003, 0xBEFE040E, 0xBF8C0F70,
+	    0x5E000B04, 0x5E020F06, 0xBF800000, 0xBF800000,
+	    0xF8001C0F, 0x00000100, 0xBF810000
+	};
+
+	static const uint32_t ps_tex_shader_patchinfo_offset_gfx10[] = {
+	    0x0000000C
+	};
+
+	static const uint32_t ps_tex_shader_patchinfo_code_size_gfx10 = 6;
+
+	static const uint32_t ps_tex_shader_patchinfo_code_gfx10[][10][6] = {
+	    {{ 0xBF800000, 0xBF800000, 0xBF800000, 0xBF800000, 0xF8001890, 0x00000000 },
+	     { 0xBF800000, 0xBF800000, 0xBF800000, 0xBF800000, 0xF8001801, 0x00000004 },
+	     { 0xBF800000, 0xBF800000, 0xBF800000, 0xBF800000, 0xF8001803, 0x00000504 },
+	     { 0xBF800000, 0xBF800000, 0xBF800000, 0xBF800000, 0xF8001803, 0x00000704 },
+	     { 0x5E000B04, 0x5E020F06, 0xBF800000, 0xBF800000, 0xF8001C0F, 0x00000100 },
+	     { 0xD7690000, 0x00020B04, 0xD7690001, 0x00020F06, 0xF8001C0F, 0x00000100 },
+	     { 0xD7680000, 0x00020B04, 0xD7680001, 0x00020F06, 0xF8001C0F, 0x00000100 },
+	     { 0xD76A0000, 0x00020B04, 0xD76A0001, 0x00020F06, 0xF8001C0F, 0x00000100 },
+	     { 0xD76B0000, 0x00020B04, 0xD76B0001, 0x00020F06, 0xF8001C0F, 0x00000100 },
+	     { 0xBF800000, 0xBF800000, 0xBF800000, 0xBF800000, 0xF800180F, 0x07060504 }
+	    }
+	};
+
+	int i;
+	uint32_t shader_offset= 256;
+	uint32_t mem_offset, patch_code_offset;
+	uint32_t shader_size, patchinfo_code_size;
+	const uint32_t *shader;
+	const uint32_t *patchinfo_code;
+	const uint32_t *patchcode_offset;
+
+	switch (ps_type) {
+		case PS_CONST:
+			if (version == 9) {
+				shader = ps_const_shader_gfx9;
+				shader_size = sizeof(ps_const_shader_gfx9);
+				patchinfo_code = (const uint32_t *)ps_const_shader_patchinfo_code_gfx9;
+				patchinfo_code_size = ps_const_shader_patchinfo_code_size_gfx9;
+				patchcode_offset = ps_const_shader_patchinfo_offset_gfx9;
+			} else if (version == 10){
+				shader = ps_const_shader_gfx10;
+				shader_size = sizeof(ps_const_shader_gfx10);
+				patchinfo_code = (const uint32_t *)ps_const_shader_patchinfo_code_gfx10;
+				patchinfo_code_size = ps_const_shader_patchinfo_code_size_gfx10;
+				patchcode_offset = ps_const_shader_patchinfo_offset_gfx10;
+			}
+			break;
+		case PS_TEX:
+			if (version == 9) {
+				shader = ps_tex_shader_gfx9;
+				shader_size = sizeof(ps_tex_shader_gfx9);
+				patchinfo_code = (const uint32_t *)ps_tex_shader_patchinfo_code_gfx9;
+				patchinfo_code_size = ps_tex_shader_patchinfo_code_size_gfx9;
+				patchcode_offset = ps_tex_shader_patchinfo_offset_gfx9;
+			} else if (version == 10) {
+				shader = ps_tex_shader_gfx10;
+				shader_size = sizeof(ps_tex_shader_gfx10);
+				patchinfo_code = (const uint32_t *)ps_tex_shader_patchinfo_code_gfx10;
+				patchinfo_code_size = ps_tex_shader_patchinfo_code_size_gfx10;
+				patchcode_offset = ps_tex_shader_patchinfo_offset_gfx10;
+			}
+			break;
+		case PS_HANG:
+			shader = memcpy_ps_hang;
+			shader_size = sizeof(memcpy_ps_hang);
+
+			memcpy(ptr, shader, shader_size);
+			return 0;
+		default:
+			return -1;
+			break;
+	}
+
+	/* write main shader program */
+	for (i = 0 ; i < 10; i++) {
+		mem_offset = i * shader_offset;
+		memcpy(ptr + mem_offset, shader, shader_size);
+	}
+
+	/* overwrite patch codes */
+	for (i = 0 ; i < 10; i++) {
+		mem_offset = i * shader_offset + patchcode_offset[0] * sizeof(uint32_t);
+		patch_code_offset = i * patchinfo_code_size;
+		memcpy(ptr + mem_offset,
+			patchinfo_code + patch_code_offset,
+			patchinfo_code_size * sizeof(uint32_t));
+	}
+
+	return 0;
+}
+
+static void
+amdgpu_memcpy_draw_test(amdgpu_device_handle device_handle, uint32_t ring,
+				    int version, int hang)
+{
+	amdgpu_bo_handle bo_shader_ps, bo_shader_vs;
+	void *ptr_shader_ps;
+	void *ptr_shader_vs;
+	uint64_t mc_address_shader_ps, mc_address_shader_vs;
+	amdgpu_va_handle va_shader_ps, va_shader_vs;
+	int bo_shader_size = 4096;
+	enum ps_type ps_type = hang ? PS_HANG : PS_TEX;
+	int r;
+
+	r = amdgpu_bo_alloc_and_map(device_handle, bo_shader_size, 4096,
+					AMDGPU_GEM_DOMAIN_VRAM, 0,
+					&bo_shader_ps, &ptr_shader_ps,
+					&mc_address_shader_ps, &va_shader_ps);
+	igt_assert_eq(r, 0);
+	memset(ptr_shader_ps, 0, bo_shader_size);
+
+	r = amdgpu_bo_alloc_and_map(device_handle, bo_shader_size, 4096,
+					AMDGPU_GEM_DOMAIN_VRAM, 0,
+					&bo_shader_vs, &ptr_shader_vs,
+					&mc_address_shader_vs, &va_shader_vs);
+	igt_assert_eq(r, 0);
+	memset(ptr_shader_vs, 0, bo_shader_size);
+
+	r = amdgpu_draw_load_ps_shader(ptr_shader_ps, ps_type, version);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_draw_load_vs_shader(ptr_shader_vs, version);
+	igt_assert_eq(r, 0);
+
+	amdgpu_memcpy_draw(device_handle, bo_shader_ps, bo_shader_vs,
+			mc_address_shader_ps, mc_address_shader_vs, ring, version, hang);
+
+	amdgpu_bo_unmap_and_free(bo_shader_ps, va_shader_ps, mc_address_shader_ps, bo_shader_size);
+
+	amdgpu_bo_unmap_and_free(bo_shader_vs, va_shader_vs, mc_address_shader_vs, bo_shader_size);
+}
+
+static void
+amdgpu_memset_draw_test(amdgpu_device_handle device_handle,
+			uint32_t ring, int version)
+{
+	amdgpu_bo_handle bo_shader_ps, bo_shader_vs;
+	void *ptr_shader_ps, *ptr_shader_vs;
+	uint64_t mc_address_shader_ps, mc_address_shader_vs;
+	amdgpu_va_handle va_shader_ps, va_shader_vs;
+	int r;
+	int bo_shader_size = 4096;
+
+	r = amdgpu_bo_alloc_and_map(device_handle, bo_shader_size, 4096,
+					AMDGPU_GEM_DOMAIN_VRAM, 0,
+					&bo_shader_ps, &ptr_shader_ps,
+					&mc_address_shader_ps, &va_shader_ps);
+	igt_assert_eq(r, 0);
+	memset(ptr_shader_ps, 0, bo_shader_size);
+
+	r = amdgpu_bo_alloc_and_map(device_handle, bo_shader_size, 4096,
+					AMDGPU_GEM_DOMAIN_VRAM, 0,
+					&bo_shader_vs, &ptr_shader_vs,
+					&mc_address_shader_vs, &va_shader_vs);
+	igt_assert_eq(r, 0);
+	memset(ptr_shader_vs, 0, bo_shader_size);
+
+	r = amdgpu_draw_load_ps_shader(ptr_shader_ps, PS_CONST, version);//
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_draw_load_vs_shader(ptr_shader_vs, version);//
+	igt_assert_eq(r, 0);
+
+	amdgpu_memset_draw(device_handle, bo_shader_ps, bo_shader_vs,
+			mc_address_shader_ps, mc_address_shader_vs, ring, version);//
+
+	amdgpu_bo_unmap_and_free(bo_shader_ps, va_shader_ps, mc_address_shader_ps, bo_shader_size);
+	amdgpu_bo_unmap_and_free(bo_shader_vs, va_shader_vs, mc_address_shader_vs, bo_shader_size);
+
+}
+
+void
+amdgpu_draw_test(amdgpu_device_handle device_handle)
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
+	/**
+	 *  there are many if 9 else if 10
+	 *  so we should have always 9 or 10
+	 */
+	if (version < 9 )
+		version = 9;
+
+	for (ring_id = 0; (1 << ring_id) & info.available_rings; ring_id++) {
+		amdgpu_memset_draw_test(device_handle, ring_id, version);
+		amdgpu_memcpy_draw_test(device_handle, ring_id, version, 0);
+	}
+}
+
+void
+amdgpu_draw_hang_slow_gfx(amdgpu_device_handle device_handle)
+{
+	struct drm_amdgpu_info_hw_ip info;
+	uint32_t ring_id, version;
+	int r;
+
+	r = amdgpu_query_hw_ip_info(device_handle, AMDGPU_HW_IP_GFX, 0, &info);
+	igt_assert_eq(r, 0);
+
+	version = info.hw_ip_version_major;
+	if (version != 9 && version != 10) {
+		printf("SKIP ... unsupported gfx version %d\n", version);
+		return;
+	}
+
+	for (ring_id = 0; (1 << ring_id) & info.available_rings; ring_id++) {
+		amdgpu_memcpy_draw_test(device_handle, ring_id, version, 0);
+		amdgpu_memcpy_draw_hang_slow_test(device_handle, ring_id, version);
+		amdgpu_memcpy_draw_test(device_handle, ring_id, version, 0);
+	}
+}
diff --git a/lib/amdgpu/amd_draw.h b/lib/amdgpu/amd_draw.h
new file mode 100644
index 000000000..57ffce099
--- /dev/null
+++ b/lib/amdgpu/amd_draw.h
@@ -0,0 +1,34 @@
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
+#ifndef __AMD_DRAW_H__
+#define __AMD_DRAW_H__
+#include <amdgpu.h>
+
+void
+amdgpu_draw_test(amdgpu_device_handle device_handle);
+
+void
+amdgpu_draw_hang_slow_gfx(amdgpu_device_handle device_handle);
+
+#endif
diff --git a/lib/meson.build b/lib/meson.build
index f110d8901..e0bc8a522 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -137,7 +137,8 @@ if libdrm_amdgpu.found()
 		'amdgpu/amd_gfx_v9_0.c',
 		'amdgpu/amd_dispatch_helpers.c',
 		'amdgpu/amd_dispatch.c',
-		'amdgpu/amd_draw_helpers.c'
+		'amdgpu/amd_draw_helpers.c',
+		'amdgpu/amd_draw.c'
 	]
 endif
 
diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 9be034975..891d1674c 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -31,6 +31,7 @@
 #include "lib/amdgpu/amd_gfx.h"
 #include "lib/amdgpu/amd_shaders.h"
 #include "lib/amdgpu/amd_dispatch.h"
+#include "lib/amdgpu/amd_draw.h"
 
 #define BUFFER_SIZE (8 * 1024)
 
@@ -697,6 +698,9 @@ igt_main
 	igt_subtest("amdgpu_gfx_dispatch_test_gfx")
 	amdgpu_gfx_dispatch_test_gfx(device);
 
+	igt_subtest("amdgpu_draw_test")
+	amdgpu_draw_test(device);
+
 	igt_fixture {
 		amdgpu_device_deinitialize(device);
 		close(fd);
-- 
2.25.1
