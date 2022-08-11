Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 619BC18A9E2
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Aug 2022 00:29:56 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 10 Aug 2022 20:29:18 -0400
Message-ID: <20220811002920.32207-5-vitaly.prosyak@amd.com>
In-Reply-To: <20220811002920.32207-1-vitaly.prosyak@amd.com>
References: <20220811002920.32207-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 5/7] lib/amdgpu: added draw helper functions
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

Use UMR to dissamble  binary shaders.

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_draw_helpers.c | 1498 +++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_draw_helpers.h |   50 ++
 lib/meson.build               |    3 +-
 3 files changed, 1550 insertions(+), 1 deletion(-)
 create mode 100644 lib/amdgpu/amd_draw_helpers.c
 create mode 100644 lib/amdgpu/amd_draw_helpers.h

diff --git a/lib/amdgpu/amd_draw_helpers.c b/lib/amdgpu/amd_draw_helpers.c
new file mode 100644
index 000000000..29d247105
--- /dev/null
+++ b/lib/amdgpu/amd_draw_helpers.c
@@ -0,0 +1,1498 @@
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
+#include "amd_draw_helpers.h"
+#include "amd_memory.h"
+#include "amd_PM4.h"
+#include "amd_shared_dispatch.h"  /*cs_type ps_type*/
+#include "amd_shaders.h"
+#include "amd_ip_blocks.h"
+
+static int
+amdgpu_draw_draw(struct amdgpu_cmd_base *base, uint32_t version)
+{
+	int i = base->cdw;
+
+	if (version == 9) {
+		/* mmIA_MULTI_VGT_PARAM */
+		base->emit(base, PACKET3(PACKET3_SET_UCONFIG_REG, 1));
+		base->emit(base,  0x40000258);
+		base->emit(base,  0xd00ff);
+
+		/* mmVGT_PRIMITIVE_TYPE */
+		base->emit(base, PACKET3(PACKET3_SET_UCONFIG_REG, 1));
+		base->emit(base,  0x10000242);
+		base->emit(base,  0x11);
+
+	} else if (version == 10) {
+		/* mmGE_CNTL */
+		base->emit(base, PACKET3(PACKET3_SET_UCONFIG_REG, 1));
+		base->emit(base,  0x25b);
+		base->emit(base,  0xff);
+
+		/* mmVGT_PRIMITIVE_TYPE */
+		base->emit(base, PACKET3(PACKET3_SET_UCONFIG_REG, 1));
+		base->emit(base,  0x242);
+		base->emit(base,  0x11);
+
+	}
+	base->emit(base, PACKET3(PACKET3_DRAW_INDEX_AUTO, 1));
+	base->emit(base,  3);
+	base->emit(base,  2);
+
+	return base->cdw - i;
+}
+
+static int
+amdgpu_draw_ps_write2hw(struct amdgpu_cmd_base *base,
+				   int ps_type,
+				   uint64_t shader_addr,
+				   uint32_t version)
+{
+	static const uint32_t ps_num_context_registers_gfx9 = 7;
+
+	static const uint32_t ps_const_context_reg_gfx9[][2] = {
+	    {0xA1B4, 0x00000002}, //{ mmSPI_PS_INPUT_ADDR,       0x00000002 },
+	    {0xA1B6, 0x00000000}, //{ mmSPI_PS_IN_CONTROL,       0x00000000 },
+	    {0xA08F, 0x0000000F}, //{ mmCB_SHADER_MASK,          0x0000000F },
+	    {0xA203, 0x00000010}, //{ mmDB_SHADER_CONTROL,       0x00000010 },
+	    {0xA1C4, 0x00000000}, //{ mmSPI_SHADER_Z_FORMAT,     0x00000000 },
+	    {0xA1B8, 0x00000000}, //{ mmSPI_BARYC_CNTL,          0x00000000 /* Always 0 for now */},
+	    {0xA1C5, 0x00000004}, //{ mmSPI_SHADER_COL_FORMAT,   0x00000004 }
+	};
+
+	static const uint32_t ps_num_sh_registers_gfx9 = 2;
+
+	static const uint32_t ps_const_sh_registers_gfx9[][2] = {
+	    {0x2C0A, 0x000C0040},//{ mmSPI_SHADER_PGM_RSRC1_PS, 0x000C0040 },
+	    {0x2C0B, 0x00000008}, //{ mmSPI_SHADER_PGM_RSRC2_PS, 0x00000008 }
+	};
+	static const uint32_t ps_num_sh_registers_gfx10 = 2;
+
+	static const uint32_t ps_const_sh_registers_gfx10[][2] = {
+	    {0x2C0A, 0x000C0000},//{ mmSPI_SHADER_PGM_RSRC1_PS, 0x000C0000 },
+	    {0x2C0B, 0x00000008}, //{ mmSPI_SHADER_PGM_RSRC2_PS, 0x00000008 }
+	};
+	static const uint32_t ps_tex_sh_registers_gfx9[][2] = {
+	    {0x2C0A, 0x000C0081},//{ mmSPI_SHADER_PGM_RSRC1_PS, 0x000C0081 },
+	    {0x2C0B, 0x00000018}, //{ mmSPI_SHADER_PGM_RSRC2_PS, 0x00000018 }
+	};
+
+	static const uint32_t ps_tex_context_reg_gfx9[][2] = {
+	    {0xA1B4, 0x00000002}, //{ mmSPI_PS_INPUT_ADDR,       0x00000002 },
+	    {0xA1B6, 0x00000001}, //{ mmSPI_PS_IN_CONTROL,       0x00000001 },
+	    {0xA08F, 0x0000000F}, //{ mmCB_SHADER_MASK,          0x0000000F },
+	    {0xA203, 0x00000010}, //{ mmDB_SHADER_CONTROL,       0x00000010 },
+	    {0xA1C4, 0x00000000}, //{ mmSPI_SHADER_Z_FORMAT,     0x00000000 },
+	    {0xA1B8, 0x00000000}, //{ mmSPI_BARYC_CNTL,          0x00000000 /* Always 0 for now */},
+	    {0xA1C5, 0x00000004}, //{ mmSPI_SHADER_COL_FORMAT,   0x00000004  }
+	};
+
+
+	int j;
+	const uint32_t *sh_registers;
+	const uint32_t *context_registers;
+	uint32_t num_sh_reg, num_context_reg;
+	int i = base->cdw;
+
+	if (ps_type == PS_CONST) {
+		if (version == 9) {
+			sh_registers = (const uint32_t *)ps_const_sh_registers_gfx9;
+			num_sh_reg = ps_num_sh_registers_gfx9;
+		} else if (version == 10) {
+			sh_registers = (const uint32_t *)ps_const_sh_registers_gfx10;
+			num_sh_reg = ps_num_sh_registers_gfx10;
+		}
+		context_registers = (const uint32_t *)ps_const_context_reg_gfx9;
+		num_context_reg = ps_num_context_registers_gfx9;
+	} else if (ps_type == PS_TEX) {
+		sh_registers = (const uint32_t *)ps_tex_sh_registers_gfx9;
+		context_registers = (const uint32_t *)ps_tex_context_reg_gfx9;
+		num_sh_reg = ps_num_sh_registers_gfx9;
+		num_context_reg = ps_num_context_registers_gfx9;
+	}
+
+	i = 0;
+
+	if (version == 9) {
+		/* 0x2c07   SPI_SHADER_PGM_RSRC3_PS
+		   0x2c08   SPI_SHADER_PGM_LO_PS
+		   0x2c09   SPI_SHADER_PGM_HI_PS */
+		/* multiplicator 9 is from  SPI_SHADER_COL_FORMAT */
+		shader_addr += 256 * 9;
+		base->emit(base,  PACKET3(PKT3_SET_SH_REG, 3));
+		base->emit(base, 0x7);
+		base->emit(base, 0xffff);
+		base->emit(base, shader_addr >> 8);
+		base->emit(base, shader_addr >> 40);
+	} else if (version == 10) {
+		shader_addr += 256 * 9;
+		/* 0x2c08  SPI_SHADER_PGM_LO_PS
+		0x2c09	   SPI_SHADER_PGM_HI_PS */
+
+		base->emit(base,  PACKET3(PKT3_SET_SH_REG, 2));
+		base->emit(base, 0x8);
+		base->emit(base, shader_addr >> 8);
+		base->emit(base, shader_addr >> 40);
+
+		/* mmSPI_SHADER_PGM_RSRC3_PS */
+		base->emit(base, PACKET3(PKT3_SET_SH_REG_INDEX, 1));
+		base->emit(base, 0x30000007);
+		base->emit(base, 0xffff);
+		/* mmSPI_SHADER_PGM_RSRC4_PS */
+		base->emit(base, PACKET3(PKT3_SET_SH_REG_INDEX, 1));
+		base->emit(base, 0x30000001);
+		base->emit(base, 0xffff);
+	}
+
+	for (j = 0; j < num_sh_reg; j++) {
+		base->emit(base, PACKET3(PKT3_SET_SH_REG, 1));
+		base->emit(base, sh_registers[j * 2] - 0x2c00);
+		base->emit(base, sh_registers[j * 2 + 1]);
+	}
+
+	for (j = 0; j < num_context_reg; j++) {
+		if (context_registers[j * 2] != 0xA1C5) {
+			base->emit(base, PACKET3(PACKET3_SET_CONTEXT_REG, 1));
+			base->emit(base, context_registers[j * 2] - 0xa000);
+			base->emit(base, context_registers[j * 2 + 1]);
+		}
+
+		if (context_registers[j * 2] == 0xA1B4) {
+			base->emit(base, PACKET3(PACKET3_SET_CONTEXT_REG, 1));
+			base->emit(base, 0x1b3);
+			base->emit(base, 2);
+		}
+	}
+
+	return base->cdw - i;
+}
+
+static int amdgpu_draw_vs_RectPosTexFast_write2hw(struct amdgpu_cmd_base * base,
+						  int ps_type,
+						  uint64_t shader_addr,
+						  uint32_t version,
+						  int hang_slow)
+{
+	int i = base->cdw;
+
+	/* mmPA_CL_VS_OUT_CNTL */
+	base->emit(base, PACKET3(PACKET3_SET_CONTEXT_REG, 1));
+	base->emit(base, 0x207);
+	base->emit(base, 0);
+
+	if (version == 9) {
+		/* mmSPI_SHADER_PGM_RSRC3_VS */
+		base->emit(base, PACKET3(PKT3_SET_SH_REG, 1));
+		base->emit(base, 0x46);
+		base->emit(base, 0xffff);
+	} else if (version == 10) {
+		/* mmSPI_SHADER_PGM_RSRC3_VS */
+		base->emit(base, PACKET3(PKT3_SET_SH_REG_INDEX, 1));
+		base->emit(base, 0x30000046);
+		base->emit(base, 0xffff);
+		/* mmSPI_SHADER_PGM_RSRC4_VS */
+		base->emit(base, PACKET3(PKT3_SET_SH_REG_INDEX, 1));
+		base->emit(base, 0x30000041);
+		base->emit(base, 0xffff);
+	}
+
+	/* mmSPI_SHADER_PGM_LO_VS...mmSPI_SHADER_PGM_HI_VS */
+	base->emit(base, PACKET3(PKT3_SET_SH_REG, 2));
+	base->emit(base, 0x48);
+	base->emit(base, shader_addr >> 8);
+	base->emit(base, shader_addr >> 40);
+
+	/* mmSPI_SHADER_PGM_RSRC1_VS */
+	base->emit(base, PACKET3(PKT3_SET_SH_REG, 1));
+	base->emit(base, 0x4a);
+	if (version == 9)
+		base->emit(base, 0xc0081);
+	else if (version == 10)
+		base->emit(base, 0xc0041);
+	/* mmSPI_SHADER_PGM_RSRC2_VS */
+	base->emit(base, PACKET3(PKT3_SET_SH_REG, 1));
+	base->emit(base, 0x4b);
+	base->emit(base, 0x18);
+
+	/* mmSPI_VS_OUT_CONFIG */
+	base->emit(base, PACKET3(PACKET3_SET_CONTEXT_REG, 1));
+	base->emit(base, 0x1b1);
+	base->emit(base, 2);
+
+	/* mmSPI_SHADER_POS_FORMAT */
+	base->emit(base, PACKET3(PACKET3_SET_CONTEXT_REG, 1));
+	base->emit(base, 0x1c3);
+	base->emit(base, 4);
+
+	base->emit(base, PACKET3(PKT3_SET_SH_REG, 4));
+	base->emit(base, 0x4c);
+	base->emit_repeat(base, 0, 2);
+	base->emit_repeat(base, hang_slow ? 0x45000000 : 0x42000000, 2);
+
+	base->emit(base,PACKET3(PKT3_SET_SH_REG, 4));
+	base->emit(base, 0x50);
+	base->emit_repeat(base, 0, 2);
+	if (ps_type == PS_CONST) {
+		base->emit_repeat(base, 0, 2);
+	} else if (ps_type == PS_TEX) {
+		base->emit_repeat(base, 0x3f800000, 2);
+	}
+
+	base->emit(base,PACKET3(PKT3_SET_SH_REG, 4));
+	base->emit(base,0x54);
+	base->emit_repeat(base, 0, 4);
+
+	return base->cdw - i;
+}
+
+static int
+amdgpu_draw_setup_and_write_drawblt_state(struct amdgpu_cmd_base * base,
+					  uint32_t version, int hang_slow)
+{
+	/**
+	 * s_load_dword s36, s[0:1], s0 glc
+	 * ;;
+	 * v_cndmask_b32_e32 v0, s0, v0, vcc
+	 * s_load_dword s36, s[0:1], 0x3
+	 * ;;
+	 * v_cndmask_b32_e32 v0, s42, v0, vcc
+	 * v_cndmask_b32_e32 v0, s0, v0, vcc
+	 * s_load_dwordx2 s[36:37], s[0:1], s10
+	 * ;;
+	 * v_cndmask_b32_e32 v0, s0, v0, vcc
+	 * v_cndmask_b32_e32 v0, s0, v0, vcc
+	 * v_cndmask_b32_e32 v0, s0, v0, vcc
+	 * v_cndmask_b32_e32 v16, s32, v0, vcc
+	 * s_load_dword s36, s[0:1], s3 glc
+	 * ;;
+	 * v_cndmask_b32_e32 v0, v255, v127, vcc
+	 * s_load_dword s36, s[0:1], 0x8e
+	 * ;;
+	 * v_cndmask_b32_e32 v0, s15, v0, vcc
+	 * v_cndmask_b32_e32 v0, s15, v0, vcc
+	 * s_load_dwordx2 s[36:37], s[0:1], s5 glc
+	 * ;;
+	 * v_cndmask_b32_e32 v0, s0, v0, vcc
+	 * v_cndmask_b32_e32 v0, s0, v0, vcc
+	 * v_cndmask_b32_e32 v0, s0, v0, vcc
+	 * v_cndmask_b32_e32 v0, s0, v0, vcc
+	 * v_cndmask_b32_e32 v0, s18, v0, vcc
+	 * s_load_dword s36, s[0:1], 0x10b
+	 * ;;
+	 * v_cndmask_b32_e32 v0, s0, v0, vcc
+	 * v_cndmask_b32_e32 v0, s0, v0, vcc
+	 * s_load_dword s36, s[0:1], s96 glc
+	 * ;;
+	 * v_cndmask_b32_e32 v0, s0, v0, vcc
+	 * s_load_dword s36, s[0:1], 0x200 glc
+	 * ;;
+	 * v_cndmask_b32_e32 v0, s0, v0, vcc
+	 * v_cndmask_b32_e32 v0, s0, v128, vcc
+	 * v_cndmask_b32_e32 v102, s17, v0, vcc
+	 * s_load_dword s36, s[0:1], 0x292
+	 * ;;
+	 * v_cndmask_b32_e32 v0, s32, v0, vcc
+	 * v_subrev_f32_e32 v1, v184, v0
+	 * s_load_dword s36, s[0:1], 0x2b0
+	 * ;;
+	 * v_cndmask_b32_e32 v0, s0, v0, vcc
+	 * v_cndmask_b32_e32 v0, s0, v0, vcc
+	 * s_load_dword s36, s[0:1], ttmp8 glc
+	 * ;;
+	 * v_cndmask_b32_e32 v0, s0, v0, vcc
+	 */
+	static const uint32_t cached_cmd_gfx9[] = {
+		0xc0016900, 0x0, 0x0, 0xc0026900, 0x3, 0x2a, 0x0,
+		0xc0046900, 0xa, 0x0, 0x0, 0x0, 0x200020,
+		0xc0016900, 0x83, 0xffff, 0xc0026900, 0x8e, 0xf, 0xf,
+		0xc0056900, 0x105, 0x0, 0x0,  0x0, 0x0, 0x12,
+		0xc0026900, 0x10b, 0x0, 0x0, 0xc0016900, 0x1e0, 0x0,
+		0xc0036900, 0x200, 0x0, 0x10000, 0xcc0011,
+		0xc0026900, 0x292, 0x20, 0x60201b8,
+		0xc0026900, 0x2b0, 0x0, 0x0, 0xc0016900, 0x2f8, 0x0
+	};
+
+	/**
+	 * same as above, but not checked using memcmp
+	 */
+	static const uint32_t cached_cmd_gfx10[] = {
+		0xc0016900, 0x0, 0x0, 0xc0026900, 0x3, 0x2a, 0x0,
+		0xc0046900, 0xa, 0x0, 0x0, 0x0, 0x200020,
+		0xc0016900, 0x83, 0xffff, 0xc0026900, 0x8e, 0xf, 0xf,
+		0xc0056900, 0x105, 0x0, 0x0, 0x0, 0x0, 0x18,
+		0xc0026900, 0x10b, 0x0, 0x0, 0xc0016900, 0x1e0, 0x0,
+		0xc0036900, 0x200, 0x0, 0x10000, 0xcc0011,
+		0xc0026900, 0x292, 0x20, 0x6020000,
+		0xc0026900, 0x2b0, 0x0, 0x0, 0xc0016900, 0x2f8, 0x0
+	};
+
+	int i = base->cdw;
+	const uint32_t *cached_cmd_ptr;
+	uint32_t cached_cmd_size;
+
+	/* mmPA_SC_TILE_STEERING_OVERRIDE */
+	base->emit(base, PACKET3(PACKET3_SET_CONTEXT_REG, 1));
+	base->emit(base, 0xd7);
+	base->emit(base, 0);
+
+	base->emit(base, 0xffff1000);
+	base->emit(base, 0xc0021000);
+
+	base->emit(base, PACKET3(PACKET3_SET_CONTEXT_REG, 1));
+	base->emit(base, 0xd7);
+	if (version == 9)
+		base->emit(base, 1);
+	else if (version == 10)
+		base->emit(base, 0);
+
+	/* mmPA_SC_AA_SAMPLE_LOCS_PIXEL_X0Y0_0 */
+	base->emit(base, PACKET3(PACKET3_SET_CONTEXT_REG, 16));
+	base->emit(base, 0x2fe);
+	base->emit_repeat(base, 0,16);
+
+	/* mmPA_SC_CENTROID_PRIORITY_0 */
+	base->emit(base, PACKET3(PACKET3_SET_CONTEXT_REG, 2));
+	base->emit(base, 0x2f5);
+	base->emit_repeat(base, 0, 2);
+
+	if (version == 9) {
+		cached_cmd_ptr = cached_cmd_gfx9;
+		cached_cmd_size = sizeof(cached_cmd_gfx9);
+	} else if (version == 10) {
+		cached_cmd_ptr = cached_cmd_gfx10;
+		cached_cmd_size = sizeof(cached_cmd_gfx10);
+	}
+
+	base->emit_buf(base, cached_cmd_ptr, 0, cached_cmd_size);
+	if (hang_slow)
+		base->emit_at_offset(base, 0x8000800, 12);
+
+	if (version == 10) {
+		/* mmCB_RMI_GL2_CACHE_CONTROL */
+		base->emit(base, PACKET3(PACKET3_SET_CONTEXT_REG, 1));
+		base->emit(base, 0x104);
+		base->emit(base, 0x40aa0055);
+		/* mmDB_RMI_L2_CACHE_CONTROL */
+		base->emit(base, PACKET3(PACKET3_SET_CONTEXT_REG, 1));
+		base->emit(base, 0x1f);
+		base->emit(base, 0x2a0055);
+	}
+
+	return base->cdw - i;
+}
+
+static int
+amdgpu_draw_setup_and_write_drawblt_surf_info(struct amdgpu_cmd_base * base,
+					       uint64_t dst_addr, int hang_slow,
+					       uint32_t version)
+{
+	int i = base->cdw;
+
+	/* setup color buffer */
+	if (version == 9) {
+		/* offset   reg
+		   0xA318   CB_COLOR0_BASE
+		   0xA319   CB_COLOR0_BASE_EXT
+		   0xA31A   CB_COLOR0_ATTRIB2
+		   0xA31B   CB_COLOR0_VIEW
+		   0xA31C   CB_COLOR0_INFO
+		   0xA31D   CB_COLOR0_ATTRIB
+		   0xA31E   CB_COLOR0_DCC_CONTROL
+		   0xA31F   CB_COLOR0_CMASK
+		   0xA320   CB_COLOR0_CMASK_BASE_EXT
+		   0xA321   CB_COLOR0_FMASK
+		   0xA322   CB_COLOR0_FMASK_BASE_EXT
+		   0xA323   CB_COLOR0_CLEAR_WORD0
+		   0xA324   CB_COLOR0_CLEAR_WORD1
+		   0xA325   CB_COLOR0_DCC_BASE
+		   0xA326   CB_COLOR0_DCC_BASE_EXT */
+		base->emit(base, PACKET3(PACKET3_SET_CONTEXT_REG, 15));
+		base->emit(base, 0x318);
+		base->emit(base, dst_addr >> 8);
+		base->emit(base, dst_addr >> 40);
+		base->emit(base, hang_slow ? 0x3ffc7ff : 0x7c01f);
+		base->emit(base, 0);
+		base->emit(base, 0x50438);
+		base->emit(base, 0x10140000);
+		base->emit_repeat(base, 0, 9);
+
+		/* mmCB_MRT0_EPITCH */
+		base->emit(base, PACKET3(PACKET3_SET_CONTEXT_REG, 1));
+		base->emit(base, 0x1e8);
+		base->emit(base, hang_slow ? 0xfff : 0x1f);
+	} else if (version == 10) {
+		/* 0xA318   CB_COLOR0_BASE
+		   0xA319   CB_COLOR0_PITCH
+		   0xA31A   CB_COLOR0_SLICE
+		   0xA31B   CB_COLOR0_VIEW
+		   0xA31C   CB_COLOR0_INFO
+		   0xA31D   CB_COLOR0_ATTRIB
+		   0xA31E   CB_COLOR0_DCC_CONTROL
+		   0xA31F   CB_COLOR0_CMASK
+		   0xA320   CB_COLOR0_CMASK_SLICE
+		   0xA321   CB_COLOR0_FMASK
+		   0xA322   CB_COLOR0_FMASK_SLICE
+		   0xA323   CB_COLOR0_CLEAR_WORD0
+		   0xA324   CB_COLOR0_CLEAR_WORD1
+		   0xA325   CB_COLOR0_DCC_BASE */
+		base->emit(base, PACKET3(PACKET3_SET_CONTEXT_REG, 14));
+		base->emit(base, 0x318);
+		base->emit(base, dst_addr >> 8);
+		base->emit_repeat(base, 0, 3);
+		base->emit(base, 0x50438);
+		base->emit_repeat(base, 0, 9);
+
+		/* 0xA390   CB_COLOR0_BASE_EXT */
+		base->emit(base, PACKET3(PACKET3_SET_CONTEXT_REG, 1));
+		base->emit(base, 0x390);
+		base->emit(base, dst_addr >> 40);
+
+		/* 0xA398   CB_COLOR0_CMASK_BASE_EXT */
+		base->emit(base, PACKET3(PACKET3_SET_CONTEXT_REG, 1));
+		base->emit(base, 0x398);
+		base->emit(base, 0);
+
+		/* 0xA3A0   CB_COLOR0_FMASK_BASE_EXT */
+		base->emit(base, PACKET3(PACKET3_SET_CONTEXT_REG, 1));
+		base->emit(base, 0x3a0);
+		base->emit(base, 0);
+
+		/* 0xA3A8   CB_COLOR0_DCC_BASE_EXT */
+		base->emit(base, PACKET3(PACKET3_SET_CONTEXT_REG, 1));
+		base->emit(base, 0x3a8);
+		base->emit(base, 0);
+
+		/* 0xA3B0   CB_COLOR0_ATTRIB2 */
+		base->emit(base, PACKET3(PACKET3_SET_CONTEXT_REG, 1));
+		base->emit(base, 0x3b0);
+		base->emit(base, hang_slow ? 0x3ffc7ff : 0x7c01f);
+
+		/* 0xA3B8   CB_COLOR0_ATTRIB3 */
+		base->emit(base, PACKET3(PACKET3_SET_CONTEXT_REG, 1));
+		base->emit(base, 0x3b8);
+		base->emit(base, 0x9014000);
+	}
+
+	/* 0xA32B   CB_COLOR1_BASE */
+	base->emit(base, PACKET3(PACKET3_SET_CONTEXT_REG, 1));
+	base->emit(base, 0x32b);
+	base->emit(base, 0);
+
+	/* 0xA33A   CB_COLOR1_BASE */
+	base->emit(base, PACKET3(PACKET3_SET_CONTEXT_REG, 1));
+	base->emit(base, 0x33a);
+	base->emit(base, 0);
+
+	/* SPI_SHADER_COL_FORMAT */
+	base->emit(base, PACKET3(PACKET3_SET_CONTEXT_REG, 1));
+	base->emit(base, 0x1c5);
+	base->emit(base, 9);
+
+	/* Setup depth buffer */
+	if (version == 9) {
+		/* mmDB_Z_INFO */
+		base->emit(base, PACKET3(PACKET3_SET_CONTEXT_REG, 2));
+		base->emit(base, 0xe);
+		base->emit_repeat(base, 0, 2);
+	} else if (version == 10) {
+		/* mmDB_Z_INFO */
+		base->emit(base, PACKET3(PACKET3_SET_CONTEXT_REG, 2));
+		base->emit(base, 0x10);
+		base->emit_repeat(base, 0, 2);
+	}
+
+	return base->cdw - i;
+}
+
+ static int
+ amdgpu_draw_init(struct amdgpu_cmd_base * base,  uint32_t version)
+{
+	/**
+	 * s_load_dword s36, s[0:1], 0x81
+	* ;;
+	* s_add_u32 s0, s0, s0
+	* v_sub_f16_e32 v0, s0, v32
+	* s_load_dword s36, s[0:1], 0x8c
+	* ;;
+	* ...
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* s_load_dword s36, s[0:1], 0x90
+	* ;;
+	* s_add_u32 s0, s0, s0
+	* v_sub_f16_e32 v0, s0, v32
+	* s_load_dword s36, s[0:1], 0x94
+	* ;;
+	* s_add_u32 s0, s0, s0
+	* v_sub_f16_e32 v0, s0, v32
+	* s_load_dword s36, s[0:1], 0xb4
+	* ;;
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* v_add_f16_e32 v192, s0, v0
+	* s_load_dword s36, s[0:1], s3 glc
+	* ;;
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* s_load_dword s36, s[0:1], s8 glc
+	* ;;
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* s_load_dword s36, s[0:1], s16 glc
+	* ;;
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* s_load_dword s36, s[0:1], s33 glc
+	* ;;
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* s_load_dword s36, s[0:1], 0x2ad
+	* ;;
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* s_load_dword s36, s[0:1], s85 glc
+	* ;;
+	* v_cndmask_b32_e32 v0, s0, v128, vcc
+	* s_load_dword s36, s[0:1], s92 glc
+	* ;;
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* s_load_dwordx2 s[36:37], s[0:1], 0x2de
+	* ;;
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* s_load_dword s36, s[0:1], 0x2e5
+	* ;;
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* s_load_dwordx2 s[36:37], s[0:1], ttmp9 glc
+	* ;;
+	* v_cndmask_b32_e32 v0, s5, v0, vcc
+	* v_add_f16_e32 v192, s0, v0
+	* v_add_f16_e32 v192, s0, v0
+	* v_add_f16_e32 v192, s0, v0
+	* v_add_f16_e32 v192, s0, v0
+	* s_load_dword s36, s[0:1], 0x311 glc
+	*  ;;
+	* v_cndmask_b32_e32 v0, s3, v0, vcc
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* v_cndmask_b32_e32 v8, s0, v0, vcc
+	* s_load_dword s36, s[0:1], 0x316
+	* ;;
+	* v_cndmask_b32_e32 v0, s30, v0, vcc
+	* v_cndmask_b32_e32 v0, s32, v0, vcc
+	* s_load_dword s36, s[0:1], s73 glc
+	* ;;
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* s_load_dword s36, s[0:1], s88 glc
+	* ;;
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* s_load_dword s36, s[0:1], flat_scratch_hi glc
+	* ;;
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	s_load_dword s36, s[0:1], ttmp6 glc
+	* ;;
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* s_load_dword s36, s[0:1], s5 glc
+	* ;;
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* s_load_dword s36, s[0:1], s25 glc
+	* ;;
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* s_load_dwordx2 s[36:37], s[0:1], xnack_mask_lo glc
+	* ;;
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* s_load_dwordx2 s[36:37], s[0:1], 0x1e1 glc
+	* ;;
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* s_load_dword s36, s[0:1], 0x204
+	* ;;
+	* v_cndmask_b32_e32 v4, s0, v128, vcc
+	* v_cndmask_b32_e32 v0, s4, v0, vcc
+	* s_load_dwordx2 s[36:37], s[0:1], s12
+	* ;;
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* s_load_dword s36, s[0:1], s50 glc
+	* ;;
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* s_load_dword s36, s[0:1], 0x30e
+	* ;;
+	* ...
+	* ...
+	* s_load_dword s36, s[0:1], s20 glc
+	* ;;
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* s_load_dword s36, s[0:1], s38 glc
+	* ;;
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* s_load_dword s36, s[0:1], s16 glc
+	* ;;
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* s_load_dword s60, s[0:1], s1
+	* ;;
+	* s_load_dword s36, s[0:1], s1 glc
+	* ;;
+	* v_cndmask_b32_e32 v0, s1, v0, vcc
+	* s_load_dword s36, s[0:1], s24 glc
+	* ;;
+	* v_cndmask_b32_e32 v0, s2, v0, vcc
+	* s_load_dword s36, s[0:1], s6 glc
+	* ;;
+	* v_cndmask_b32_e32 v0, v0, v1, vcc
+	* s_load_dword s100, s[0:1], s67 glc
+	* ;;
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* s_load_dword s100, s[0:1], s72 glc
+	* ;;
+	* ...
+	* s_load_dword s100, s[0:1], s73 glc
+	* ;;
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* s_load_dword s100, s[0:1], s74 glc
+	* ;;
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	* s_load_dword s100, s[0:1], s75 glc
+	* ;;
+	* v_cndmask_b32_e32 v0, s0, v0, vcc
+	*/
+	static const uint32_t preamblecache_gfx9[] = {
+		0xc0026900, 0x81, 0x80000000, 0x40004000, 0xc0026900, 0x8c, 0xaa99aaaa, 0x0,
+		0xc0026900, 0x90, 0x80000000, 0x40004000, 0xc0026900, 0x94, 0x80000000, 0x40004000,
+		0xc0026900, 0xb4,  0x0, 0x3f800000, 0xc0016900, 0x103, 0x0,
+		0xc0016900, 0x208, 0x0, 0xc0016900, 0x290, 0x0,
+		0xc0016900, 0x2a1, 0x0, 0xc0026900, 0x2ad, 0x0, 0x0,
+		0xc0016900, 0x2d5, 0x10000, 0xc0016900,  0x2dc, 0x0,
+		0xc0066900, 0x2de, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc0026900, 0x2e5, 0x0, 0x0,
+		0xc0056900, 0x2f9, 0x5, 0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000,
+		0xc0036900, 0x311, 0x3, 0, 0x100000, 0xc0026900, 0x316, 0x1e, 0x20,
+		0xc0016900, 0x349, 0x0, 0xc0016900, 0x358, 0x0, 0xc0016900, 0x367, 0x0,
+		0xc0016900, 0x376, 0x0, 0xc0016900, 0x385, 0x0, 0xc0016900, 0x19, 0x0,
+		0xc0056900, 0xe8, 0x0, 0x0, 0x0, 0x0, 0x0,
+		0xc0076900, 0x1e1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
+		0xc0026900, 0x204, 0x90000, 0x4, 0xc0046900, 0x20c, 0x0, 0x0, 0x0, 0x0,
+		0xc0016900, 0x2b2, 0x0, 0xc0026900, 0x30e, 0xffffffff, 0xffffffff,
+		0xc0016900, 0x314, 0x0, 0xc0016900, 0x2a6, 0, 0xc0016900, 0x210, 0,
+		0xc0002f00, 0x1, 0xc0016900, 0x1, 0x1,
+		0xc0016900, 0x18, 0x2, 0xc0016900, 0x206, 0x300, 0xc0017900, 0x20000243, 0x0,
+		0xc0017900, 0x248, 0xffffffff, 0xc0017900, 0x249, 0x0, 0xc0017900, 0x24a, 0x0,
+		0xc0017900, 0x24b, 0x0
+	};
+
+	/**
+	s_load_dword s36, s[0:1], 0x81
+	;;
+	s_add_u32 s0, s0, s0
+	v_sub_f16_e32 v0, s0, v32
+	s_load_dword s36, s[0:1], 0x8c
+	;;
+	...
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	s_load_dword s36, s[0:1], 0x90
+	;;
+	s_add_u32 s0, s0, s0
+	v_sub_f16_e32 v0, s0, v32
+	s_load_dword s36, s[0:1], 0x94
+	;;
+	s_add_u32 s0, s0, s0
+	v_sub_f16_e32 v0, s0, v32
+	s_load_dword s36, s[0:1], 0xb4
+	;;
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	v_add_f16_e32 v192, s0, v0
+	s_load_dword s36, s[0:1], s3 glc
+	;;
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	s_load_dword s36, s[0:1], s8 glc
+	;;
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	s_load_dword s36, s[0:1], s16 glc
+	;;
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	s_load_dword s36, s[0:1], s33 glc
+	;;
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	s_load_dword s36, s[0:1], 0x2ad
+	;;
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	s_load_dword s36, s[0:1], s85 glc
+	;;
+	v_cndmask_b32_e32 v0, s0, v128, vcc
+	s_load_dword s36, s[0:1], s92 glc
+	;;
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	s_load_dwordx2 s[36:37], s[0:1], 0x2de
+	;;
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	s_load_dword s36, s[0:1], 0x2e5
+	;;
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	s_load_dwordx2 s[36:37], s[0:1], ttmp9 glc
+	;;
+	v_cndmask_b32_e32 v0, s5, v0, vcc
+	v_add_f16_e32 v192, s0, v0
+	v_add_f16_e32 v192, s0, v0
+	v_add_f16_e32 v192, s0, v0
+	v_add_f16_e32 v192, s0, v0
+	s_load_dwordx2 s[36:37], s[0:1], s16
+	;;
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	v_cndmask_b32_e32 v0, s3, v0, vcc
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	v_cndmask_b32_e32 v8, s0, v0, vcc
+	s_load_dword s36, s[0:1], 0x316
+	;;
+	v_cndmask_b32_e32 v0, s14, v0, vcc
+	v_cndmask_b32_e32 v0, s32, v0, vcc
+	s_load_dword s36, s[0:1], s73 glc
+	;;
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	s_load_dword s36, s[0:1], s88 glc
+	;;
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	s_load_dword s36, s[0:1], flat_scratch_hi glc
+	;;
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	s_load_dword s36, s[0:1], ttmp6 glc
+	;;
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	s_load_dword s36, s[0:1], s5 glc
+	;;
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	s_load_dword s36, s[0:1], s6 glc
+	;;
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	s_load_dwordx2 s[36:37], s[0:1], xnack_mask_lo glc
+	;;
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	s_load_dwordx2 s[36:37], s[0:1], 0x1e1 glc
+	;;
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	s_load_dword s36, s[0:1], 0x204
+	;;
+	v_cndmask_b32_e32 v4, s0, v128, vcc
+	v_cndmask_b32_e32 v0, s4, v0, vcc
+	s_load_dwordx2 s[36:37], s[0:1], s12
+	;;
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	s_load_dword s36, s[0:1], s50 glc
+	;;
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	s_load_dword s36, s[0:1], 0x30e
+	;;
+	...
+	...
+	s_load_dword s36, s[0:1], s20 glc
+	;;
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	s_load_dword s36, s[0:1], s10 glc
+	;;
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	s_load_dword s36, s[0:1], s38 glc
+	;;
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	s_load_dword s36, s[0:1], s16 glc
+	;;
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	s_load_dword s36, s[0:1], s91 glc
+	;;
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	s_load_dword s36, s[0:1], s84 glc
+	;;
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	s_load_dword s60, s[0:1], s1
+	;;
+	s_load_dword s36, s[0:1], s1 glc
+	;;
+	v_cndmask_b32_e32 v0, s1, v0, vcc
+	s_load_dword s36, s[0:1], s14 glc
+	;;
+	v_cndmask_b32_e32 v0, s2, v0, vcc
+	s_load_dword s36, s[0:1], s6 glc
+	;;
+	v_cndmask_b32_e32 v0, v0, v1, vcc
+	s_load_dword s36, s[0:1], s18 glc
+	;;
+	v_cndmask_b32_e32 v0, s0, v1, vcc
+	s_load_dword s100, s[0:1], ttmp11 glc
+	;;
+	v_cndmask_b32_e32 v0, s32, v0, vcc
+	s_load_dword xnack_mask_lo, s[0:1], s67 glc
+	;;
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	s_load_dword s100, s[0:1], s73 glc
+	;;
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	s_load_dword s100, s[0:1], s74 glc
+	;;
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	s_load_dword s100, s[0:1], s75 glc
+	;;
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	s_load_dword s100, s[0:1], s89 glc
+	;;
+	...
+	s_load_dword s100, s[0:1], s95 glc
+	;;
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	s_load_dword s100, s[0:1], s96 glc
+	;;
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	s_load_dword s100, s[0:1], s98 glc
+	;;
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	s_load_dword s88, s[0:1], s69 glc
+	;;
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	s_load_dword s88, s[0:1], s6 glc
+	;;
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	s_load_dwordx2 s[88:89], s[0:1], 0x70
+	;;
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	s_load_dwordx2 s[88:89], s[0:1], 0x30
+	;;
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	v_cndmask_b32_e32 v0, s0, v0, vcc
+	 */
+	static const uint32_t preamblecache_gfx10[] = {
+		0xc0026900, 0x81, 0x80000000, 0x40004000, 0xc0026900, 0x8c, 0xaa99aaaa, 0x0,
+		0xc0026900, 0x90, 0x80000000, 0x40004000, 0xc0026900, 0x94, 0x80000000, 0x40004000,
+		0xc0026900, 0xb4, 0x0, 0x3f800000, 0xc0016900, 0x103, 0x0,
+		0xc0016900, 0x208, 0x0, 0xc0016900, 0x290, 0x0,
+		0xc0016900, 0x2a1, 0x0, 0xc0026900, 0x2ad, 0x0, 0x0,
+		0xc0016900, 0x2d5, 0x10000, 0xc0016900, 0x2dc, 0x0,
+		0xc0066900, 0x2de, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc0026900, 0x2e5, 0x0, 0x0,
+		0xc0056900, 0x2f9, 0x5, 0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000,
+		0xc0046900, 0x310, 0, 0x3, 0, 0x100000, 0xc0026900, 0x316, 0xe, 0x20,
+		0xc0016900, 0x349, 0x0, 0xc0016900, 0x358, 0x0, 0xc0016900, 0x367, 0x0,
+		0xc0016900, 0x376, 0x0, 0xc0016900, 0x385, 0x0, 0xc0016900, 0x6, 0x0,
+		0xc0056900, 0xe8, 0x0, 0x0, 0x0, 0x0, 0x0,
+		0xc0076900, 0x1e1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
+		0xc0026900, 0x204, 0x90000, 0x4, 0xc0046900, 0x20c, 0x0, 0x0, 0x0, 0x0,
+		0xc0016900, 0x2b2, 0x0, 0xc0026900, 0x30e, 0xffffffff, 0xffffffff,
+		0xc0016900, 0x314, 0x0, 0xc0016900, 0x10a, 0, 0xc0016900, 0x2a6, 0, 0xc0016900, 0x210, 0,
+		0xc0016900, 0x2db, 0, 0xc0016900, 0x1d4, 0, 0xc0002f00, 0x1, 0xc0016900, 0x1, 0x1, 0xc0016900, 0xe, 0x2,
+		0xc0016900, 0x206, 0x300, 0xc0016900, 0x212, 0x200, 0xc0017900, 0x7b, 0x20, 0xc0017a00, 0x20000243, 0x0,
+		0xc0017900, 0x249, 0, 0xc0017900, 0x24a, 0, 0xc0017900, 0x24b, 0, 0xc0017900, 0x259, 0xffffffff,
+		0xc0017900, 0x25f, 0, 0xc0017900, 0x260, 0, 0xc0017900, 0x262, 0,
+		0xc0017600, 0x45, 0x0, 0xc0017600, 0x6, 0x0,
+		0xc0067600, 0x70, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
+		0xc0067600, 0x30, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
+	};
+	int i = base->cdw;
+	const uint32_t *preamblecache_ptr;
+	uint32_t preamblecache_size;
+
+	/* Write context control and load shadowing register if necessary */
+	base->emit(base, PACKET3(PKT3_CONTEXT_CONTROL, 1));
+	base->emit_repeat(base, 0x80000000, 2);
+
+	if (version == 9) {
+		preamblecache_ptr = preamblecache_gfx9;
+		preamblecache_size = sizeof(preamblecache_gfx9);
+	} else if (version == 10) {
+		preamblecache_ptr = preamblecache_gfx10;
+		preamblecache_size = sizeof(preamblecache_gfx10);
+	}
+	base->emit_buf(base, preamblecache_ptr, 0, preamblecache_size);
+
+	return base->cdw - i;
+}
+
+void
+amdgpu_memcpy_draw(amdgpu_device_handle device_handle,
+			       amdgpu_bo_handle bo_shader_ps,
+			       amdgpu_bo_handle bo_shader_vs,
+			       uint64_t mc_address_shader_ps,
+			       uint64_t mc_address_shader_vs,
+			       uint32_t ring, int version, int hang)
+{
+	amdgpu_context_handle context_handle;
+	amdgpu_bo_handle bo_dst, bo_src, bo_cmd, resources[5];
+	volatile unsigned char *ptr_dst;
+	unsigned char *ptr_src;
+	uint32_t *ptr_cmd;
+	uint64_t mc_address_dst, mc_address_src, mc_address_cmd;
+	amdgpu_va_handle va_dst, va_src, va_cmd;
+	int i, r;
+	int bo_size = 16384;
+	int bo_cmd_size = 4096;
+	struct amdgpu_cs_request ibs_request = {0};
+	struct amdgpu_cs_ib_info ib_info= {0};
+	uint32_t hang_state, hangs;
+	uint32_t expired;
+	amdgpu_bo_list_handle bo_list;
+	struct amdgpu_cs_fence fence_status = {0};
+
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
+	r = amdgpu_bo_alloc_and_map(device_handle, bo_size, 4096,
+					AMDGPU_GEM_DOMAIN_VRAM, 0,
+					&bo_src, (void **)&ptr_src,
+					&mc_address_src, &va_src);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_alloc_and_map(device_handle, bo_size, 4096,
+					AMDGPU_GEM_DOMAIN_VRAM, 0,
+					&bo_dst, (void **)&ptr_dst,
+					&mc_address_dst, &va_dst);
+	igt_assert_eq(r, 0);
+
+	memset(ptr_src, 0x55, bo_size);
+
+	amdgpu_draw_init(base_cmd, version);
+
+	amdgpu_draw_setup_and_write_drawblt_surf_info(base_cmd, mc_address_dst, 0, version);
+
+	amdgpu_draw_setup_and_write_drawblt_state(base_cmd, version, 0);
+
+	amdgpu_draw_vs_RectPosTexFast_write2hw(base_cmd, PS_TEX, mc_address_shader_vs,
+						    version, 0);
+
+	amdgpu_draw_ps_write2hw(base_cmd, PS_TEX, mc_address_shader_ps, version);
+
+	base_cmd->emit(base_cmd, PACKET3(PKT3_SET_SH_REG, 8));
+	if (version == 9) {
+		base_cmd->emit(base_cmd, 0xc);
+		base_cmd->emit(base_cmd, mc_address_src >> 8);
+		base_cmd->emit(base_cmd, mc_address_src >> 40 | 0x10e00000);
+		base_cmd->emit(base_cmd, 0x7c01f);
+		base_cmd->emit(base_cmd, 0x90500fac);
+		base_cmd->emit(base_cmd, 0x3e000);
+		base_cmd->emit_repeat(base_cmd, 0, 3);
+	} else if (version == 10) {
+		base_cmd->emit(base_cmd, 0xc);
+		base_cmd->emit(base_cmd, mc_address_src >> 8);
+		base_cmd->emit(base_cmd, mc_address_src >> 40 | 0xc4b00000);
+		base_cmd->emit(base_cmd, 0x8007c007);
+		base_cmd->emit(base_cmd, 0x90500fac);
+		base_cmd->emit_repeat(base_cmd, 0, 2);
+		base_cmd->emit(base_cmd, 0x400);
+		base_cmd->emit(base_cmd, 0);
+	}
+
+	base_cmd->emit(base_cmd, PACKET3(PKT3_SET_SH_REG, 4));
+	base_cmd->emit(base_cmd, 0x14);
+	base_cmd->emit(base_cmd, 0x92);
+	base_cmd->emit_repeat(base_cmd, 0, 3);
+
+	base_cmd->emit(base_cmd, PACKET3(PACKET3_SET_CONTEXT_REG, 1));
+	base_cmd->emit(base_cmd, 0x191);
+	base_cmd->emit(base_cmd, 0);
+
+	amdgpu_draw_draw(base_cmd, version);
+
+	base_cmd->emit_aligned(base_cmd, 7, 0xffff1000); /* type3 nop packet */
+
+	resources[0] = bo_dst;
+	resources[1] = bo_src;
+	resources[2] = bo_shader_ps;
+	resources[3] = bo_shader_vs;
+	resources[4] = bo_cmd;
+	r = amdgpu_bo_list_create(device_handle, 5, resources, NULL, &bo_list);
+	igt_assert_eq(r, 0);
+
+	ib_info.ib_mc_address = mc_address_cmd;
+	ib_info.size = base_cmd->cdw;
+	ibs_request.ip_type = AMDGPU_HW_IP_GFX;
+	ibs_request.ring = ring;
+	ibs_request.resources = bo_list;
+	ibs_request.number_of_ibs = 1;
+	ibs_request.ibs = &ib_info;
+	ibs_request.fence_info.handle = NULL;
+	r = amdgpu_cs_submit(context_handle, 0, &ibs_request, 1);
+	igt_assert_eq(r, 0);
+
+	fence_status.ip_type = AMDGPU_HW_IP_GFX;
+	fence_status.ip_instance = 0;
+	fence_status.ring = ring;
+	fence_status.context = context_handle;
+	fence_status.fence = ibs_request.seq_no;
+
+	/* wait for IB accomplished */
+	r = amdgpu_cs_query_fence_status(&fence_status,
+					 AMDGPU_TIMEOUT_INFINITE,
+					 0, &expired);
+	/**
+	 * TODO improve here
+	 */
+	if (!hang) {
+		igt_assert_eq(r, 0);
+		igt_assert_eq(expired, true);
+
+		/* verify if memcpy test result meets with expected */
+		i = 0;
+		while(i < bo_size) {
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
+
+	amdgpu_bo_unmap_and_free(bo_src, va_src, mc_address_src, bo_size);
+	amdgpu_bo_unmap_and_free(bo_dst, va_dst, mc_address_dst, bo_size);
+
+	amdgpu_bo_unmap_and_free(bo_cmd, va_cmd, mc_address_cmd, bo_cmd_size);
+
+	amdgpu_cs_ctx_free(context_handle);
+	free_cmd_base(base_cmd);
+}
+
+void
+amdgpu_memset_draw(amdgpu_device_handle device_handle,
+			amdgpu_bo_handle bo_shader_ps,
+			amdgpu_bo_handle bo_shader_vs,
+			uint64_t mc_address_shader_ps,
+			uint64_t mc_address_shader_vs,
+			uint32_t ring_id, uint32_t version)
+{
+	amdgpu_context_handle context_handle;
+	amdgpu_bo_handle bo_dst, bo_cmd, resources[4];
+	volatile unsigned char *ptr_dst;
+	uint32_t *ptr_cmd;
+	uint64_t mc_address_dst, mc_address_cmd;
+	amdgpu_va_handle va_dst, va_cmd;
+	int i, r;
+	int bo_dst_size = 16384;
+	int bo_cmd_size = 4096;
+	struct amdgpu_cs_request ibs_request = {0};
+	struct amdgpu_cs_ib_info ib_info = {0};
+	struct amdgpu_cs_fence fence_status = {0};
+	uint32_t expired;
+	amdgpu_bo_list_handle bo_list;
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
+	r = amdgpu_bo_alloc_and_map(device_handle, bo_dst_size, 4096,
+					AMDGPU_GEM_DOMAIN_VRAM, 0,
+					&bo_dst, (void **)&ptr_dst,
+					&mc_address_dst, &va_dst);
+	igt_assert_eq(r, 0);
+
+	amdgpu_draw_init(base_cmd, version);
+	amdgpu_draw_setup_and_write_drawblt_surf_info(base_cmd, mc_address_dst, 0, version);
+	amdgpu_draw_setup_and_write_drawblt_state(base_cmd, version, 0);
+	amdgpu_draw_vs_RectPosTexFast_write2hw(base_cmd, PS_CONST, mc_address_shader_vs, version,0);
+	amdgpu_draw_ps_write2hw(base_cmd, PS_CONST, mc_address_shader_ps, version);
+
+	base_cmd->emit(base_cmd, PACKET3(PKT3_SET_SH_REG, 4));
+	base_cmd->emit(base_cmd, 0xc);
+	base_cmd->emit_repeat(base_cmd, 0x33333333, 4);
+
+	amdgpu_draw_draw(base_cmd, version);
+
+	base_cmd->emit_aligned(base_cmd, 7, 0xffff1000 );/* type3 nop packet */
+
+	resources[0] = bo_dst;
+	resources[1] = bo_shader_ps;
+	resources[2] = bo_shader_vs;
+	resources[3] = bo_cmd;
+	r = amdgpu_bo_list_create(device_handle, 4, resources, NULL, &bo_list);
+	igt_assert_eq(r, 0);
+
+	ib_info.ib_mc_address = mc_address_cmd;
+	ib_info.size = base_cmd->cdw;
+	ibs_request.ip_type = AMDGPU_HW_IP_GFX;
+	ibs_request.ring = ring_id;
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
+	fence_status.ip_type = AMDGPU_HW_IP_GFX;
+	fence_status.ip_instance = 0;
+	fence_status.ring = ring_id;
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
+
+	/**
+	 * TODO improve here
+	 */
+	while(i < bo_cmd_size) {
+		igt_assert_eq(ptr_dst[i++], 0x33);
+	}
+
+	amdgpu_bo_unmap_and_free(bo_dst, va_dst, mc_address_dst, bo_dst_size);
+
+	amdgpu_bo_unmap_and_free(bo_cmd, va_cmd, mc_address_cmd, bo_cmd_size);
+
+	amdgpu_cs_ctx_free(context_handle);
+	free_cmd_base(base_cmd);
+}
+
+/* load RectPosTexFast_VS */
+int amdgpu_draw_load_vs_shader(uint8_t *ptr, uint32_t version)
+{
+	/**
+	v_cvt_f32_i32_e32 v0, v0
+	v_add_f32_e32 v0, -1.0, v0
+	v_cmp_eq_f32_e64 s[10:11], v0, 0
+	;;
+	v_mov_b32_e32 v1, s2
+	v_mov_b32_e32 v2, s0
+	v_add_f32_e32 v0, -1.0, v0
+	v_mov_b32_e32 v3, s6
+	v_mov_b32_e32 v4, s4
+	v_cndmask_b32_e64 v1, v2, v1, s[10:11]
+	;;
+	v_cmp_eq_f32_e32 vcc, 0, v0
+	v_mov_b32_e32 v0, s0
+	v_mov_b32_e32 v2, s3
+	v_mov_b32_e32 v5, s1
+	v_cndmask_b32_e64 v3, v4, v3, s[10:11]
+	;;
+	v_mov_b32_e32 v6, s7
+	v_mov_b32_e32 v7, s5
+	v_cndmask_b32_e32 v0, v1, v0, vcc
+	v_cndmask_b32_e32 v1, v5, v2, vcc
+	v_mov_b32_e32 v2, s8
+	v_mov_b32_e32 v5, 1.0
+	v_cndmask_b32_e32 v3, v3, v4, vcc
+	v_cndmask_b32_e32 v4, v7, v6, vcc
+	v_mov_b32_e32 v6, s9
+	exp pos0 v0, v1, v2, v5 done
+	;;
+	exp param0 v3, v4, v6, v5
+	;;
+	s_endpgm
+	 */
+	static const uint32_t vs_RectPosTexFast_shader_gfx9[] = {
+	    0x7E000B00, 0x020000F3, 0xD042000A, 0x00010100,
+	    0x7E020202, 0x7E040200, 0x020000F3, 0x7E060206,
+	    0x7E080204, 0xD1000001, 0x002A0302, 0x7C840080,
+	    0x7E000200, 0x7E040203, 0x7E0A0201, 0xD1000003,
+	    0x002A0704, 0x7E0C0207, 0x7E0E0205, 0x00000101,
+	    0x00020505, 0x7E040208, 0x7E0A02F2, 0x00060903,
+	    0x00080D07, 0x7E0C0209, 0xC40008CF, 0x05020100,
+	    0xC400020F, 0x05060403, 0xBF810000
+	};
+
+	/**
+	v_cvt_f32_i32_e32 v0, v0
+	v_subrev_f32_e32 v0, -1.0, v0
+	v_mov_b32_e32 v1, s2
+	v_mov_b32_e32 v2, s6
+	...
+	v_subrev_f32_e32 v0, -1.0, v0
+	v_interp_p2_f32_e32 v64, v1, attr0.x
+	v_cndmask_b32_e32 v213, s0, v1, vcc
+	v_mov_b32_e32 v3, s3
+	v_interp_p2_f32_e32 v64, v2, attr0.x
+	v_cndmask_b32_e32 v213, s4, v2, vcc
+	v_mov_b32_e32 v4, s7
+	...
+	v_interp_p2_f32_e32 v64, v0, attr0.x
+	v_cndmask_b32_e32 v212, v1, v0, vcc
+	v_interp_p2_f32_e32 v64, v1, attr0.x
+	v_cndmask_b32_e32 v213, s1, v3, vcc
+	v_mov_b32_e32 v3, s8
+	v_mov_b32_e32 v5, 1.0
+	v_interp_p2_f32_e32 v64, v2, attr0.x
+	v_cndmask_b32_e32 v212, v2, v4, vcc
+	v_interp_p2_f32_e32 v64, v4, attr0.x
+	v_cndmask_b32_e32 v213, s5, v4, vcc
+	v_mov_b32_e32 v6, s9
+	...
+	v_sub_f32_e32 v129, v0, v128
+	...
+	v_sub_f32_e32 v131, s2, v2
+	s_endpgm
+	 */
+	static const uint32_t vs_RectPosTexFast_shader_gfx10[] = {
+	    0x7E000B00, 0x060000F3, 0x7E020202, 0x7E040206,
+	    0x7C040080, 0x060000F3, 0xD5010001, 0x01AA0200,
+	    0x7E060203, 0xD5010002, 0x01AA0404, 0x7E080207,
+	    0x7C040080, 0xD5010000, 0x01A80101, 0xD5010001,
+	    0x01AA0601, 0x7E060208, 0x7E0A02F2, 0xD5010002,
+	    0x01A80902, 0xD5010004, 0x01AA0805, 0x7E0C0209,
+	    0xF80008CF, 0x05030100, 0xF800020F, 0x05060402,
+	    0xBF810000
+	};
+
+	const uint32_t *shader;
+	uint32_t shader_size;
+
+	if (version == 9) {
+		shader = vs_RectPosTexFast_shader_gfx9;
+		shader_size = sizeof(vs_RectPosTexFast_shader_gfx9);
+	} else if (version == 10) {
+		shader = vs_RectPosTexFast_shader_gfx10;
+		shader_size = sizeof(vs_RectPosTexFast_shader_gfx10);
+	}
+
+	memcpy(ptr, shader, shader_size);
+
+	return 0;
+}
+
+void
+amdgpu_memcpy_draw_hang_slow_test(amdgpu_device_handle device_handle, uint32_t ring, int version)
+{
+	amdgpu_context_handle context_handle;
+	amdgpu_bo_handle bo_shader_ps, bo_shader_vs;
+	amdgpu_bo_handle bo_dst, bo_src, bo_cmd, resources[5];
+	void *ptr_shader_ps;
+	void *ptr_shader_vs;
+	volatile unsigned char *ptr_dst;
+	unsigned char *ptr_src;
+	uint32_t *ptr_cmd;
+	uint64_t mc_address_dst, mc_address_src, mc_address_cmd;
+	uint64_t mc_address_shader_ps, mc_address_shader_vs;
+	amdgpu_va_handle va_shader_ps, va_shader_vs;
+	amdgpu_va_handle va_dst, va_src, va_cmd;
+	struct amdgpu_gpu_info gpu_info = {0};
+	int r;
+	int bo_size = 0x4000000;
+	int bo_shader_ps_size = 0x400000;
+	int bo_shader_vs_size = 4096;
+	int bo_cmd_size = 4096;
+	struct amdgpu_cs_request ibs_request = {0};
+	struct amdgpu_cs_ib_info ib_info= {0};
+	uint32_t hang_state, hangs, expired;
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
+	r = amdgpu_bo_alloc_and_map(device_handle, bo_shader_ps_size, 4096,
+					AMDGPU_GEM_DOMAIN_VRAM, 0,
+					&bo_shader_ps, &ptr_shader_ps,
+					&mc_address_shader_ps, &va_shader_ps);
+	igt_assert_eq(r, 0);
+	memset(ptr_shader_ps, 0, bo_shader_ps_size);
+
+	r = amdgpu_bo_alloc_and_map(device_handle, bo_shader_vs_size, 4096,
+					AMDGPU_GEM_DOMAIN_VRAM, 0,
+					&bo_shader_vs, &ptr_shader_vs,
+					&mc_address_shader_vs, &va_shader_vs);
+	igt_assert_eq(r, 0);
+	memset(ptr_shader_vs, 0, bo_shader_vs_size);
+
+	r = amdgpu_draw_load_ps_shader_hang_slow(ptr_shader_ps, gpu_info.family_id);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_draw_load_vs_shader(ptr_shader_vs, version);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_alloc_and_map(device_handle, bo_size, 4096,
+					AMDGPU_GEM_DOMAIN_VRAM, 0,
+					&bo_src, (void **)&ptr_src,
+					&mc_address_src, &va_src);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_alloc_and_map(device_handle, bo_size, 4096,
+					AMDGPU_GEM_DOMAIN_VRAM, 0,
+					&bo_dst, (void **)&ptr_dst,
+					&mc_address_dst, &va_dst);
+	igt_assert_eq(r, 0);
+
+	memset(ptr_src, 0x55, bo_size);
+
+	amdgpu_draw_init(base_cmd, version);
+
+	amdgpu_draw_setup_and_write_drawblt_surf_info(base_cmd, mc_address_dst, version, 1);
+
+	amdgpu_draw_setup_and_write_drawblt_state(base_cmd, version, 1);
+
+	amdgpu_draw_vs_RectPosTexFast_write2hw(base_cmd, PS_TEX,
+							mc_address_shader_vs, version, 1);
+
+	amdgpu_draw_ps_write2hw(base_cmd, PS_TEX, mc_address_shader_ps, version);
+
+	base_cmd->emit(base_cmd, PACKET3(PKT3_SET_SH_REG, 8));
+
+	if (version == 9) {
+		base_cmd->emit(base_cmd, 0xc);
+		base_cmd->emit(base_cmd, mc_address_src >> 8);
+		base_cmd->emit(base_cmd, mc_address_src >> 40 | 0x10e00000);
+		base_cmd->emit(base_cmd, 0x1ffcfff);
+		base_cmd->emit(base_cmd, 0x90500fac);
+		base_cmd->emit(base_cmd, 0x1ffe000);
+		base_cmd->emit_repeat(base_cmd, 0 , 3);
+	} else if (version == 10) {
+		base_cmd->emit(base_cmd, 0xc);
+		base_cmd->emit(base_cmd, mc_address_src >> 8);
+		base_cmd->emit(base_cmd, mc_address_src >> 40 | 0xc4b00000);
+		base_cmd->emit(base_cmd, 0x81ffc1ff);
+		base_cmd->emit(base_cmd, 0x90500fac);
+		base_cmd->emit_repeat(base_cmd, 0 , 4);
+	}
+
+	base_cmd->emit(base_cmd, PACKET3(PKT3_SET_SH_REG, 4));
+	base_cmd->emit(base_cmd, 0x14);
+	base_cmd->emit(base_cmd, 0x92);
+	base_cmd->emit_repeat(base_cmd, 0 , 3);
+
+	base_cmd->emit(base_cmd, PACKET3(PACKET3_SET_CONTEXT_REG, 1));
+	base_cmd->emit(base_cmd, 0x191);
+	base_cmd->emit(base_cmd, 0);
+
+	amdgpu_draw_draw(base_cmd, version);
+
+	base_cmd->emit_aligned(base_cmd, 7, 0xffff1000);/* type3 nop packet */
+
+	resources[0] = bo_dst;
+	resources[1] = bo_src;
+	resources[2] = bo_shader_ps;
+	resources[3] = bo_shader_vs;
+	resources[4] = bo_cmd;
+	r = amdgpu_bo_list_create(device_handle, 5, resources, NULL, &bo_list);
+	igt_assert_eq(r, 0);
+
+	ib_info.ib_mc_address = mc_address_cmd;
+	ib_info.size = base_cmd->cdw;
+	ibs_request.ip_type = AMDGPU_HW_IP_GFX;
+	ibs_request.ring = ring;
+	ibs_request.resources = bo_list;
+	ibs_request.number_of_ibs = 1;
+	ibs_request.ibs = &ib_info;
+	ibs_request.fence_info.handle = NULL;
+	r = amdgpu_cs_submit(context_handle, 0, &ibs_request, 1);
+	igt_assert_eq(r, 0);
+
+	fence_status.ip_type = AMDGPU_HW_IP_GFX;
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
+	igt_assert_eq(hang_state, AMDGPU_CTX_UNKNOWN_RESET);
+
+	amdgpu_bo_list_destroy(bo_list);
+
+	amdgpu_bo_unmap_and_free(bo_dst, va_dst, mc_address_dst, bo_size);
+	amdgpu_bo_unmap_and_free(bo_src, va_src, mc_address_src, bo_size);
+
+	amdgpu_bo_unmap_and_free(bo_cmd, va_cmd, mc_address_cmd, bo_cmd_size);
+
+	amdgpu_bo_unmap_and_free(bo_shader_ps, va_shader_ps, mc_address_shader_ps, bo_shader_ps_size);
+	amdgpu_bo_unmap_and_free(bo_shader_vs, va_shader_vs, mc_address_shader_vs, bo_shader_vs_size);
+
+	amdgpu_cs_ctx_free(context_handle);
+	free_cmd_base(base_cmd);
+}
+
diff --git a/lib/amdgpu/amd_draw_helpers.h b/lib/amdgpu/amd_draw_helpers.h
new file mode 100644
index 000000000..01bb080ec
--- /dev/null
+++ b/lib/amdgpu/amd_draw_helpers.h
@@ -0,0 +1,50 @@
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
+#ifndef __AMD_DRAW_HELPERS_H__
+#define __AMD_DRAW_HELPERS_H__
+#include <amdgpu.h>
+
+void
+amdgpu_memset_draw(amdgpu_device_handle device_handle,
+		   amdgpu_bo_handle bo_shader_ps,
+		   amdgpu_bo_handle bo_shader_vs,
+		   uint64_t mc_address_shader_ps,
+		   uint64_t mc_address_shader_vs,
+		   uint32_t ring_id, uint32_t version);
+
+void
+amdgpu_memcpy_draw(amdgpu_device_handle device_handle,
+		   amdgpu_bo_handle bo_shader_ps,
+		   amdgpu_bo_handle bo_shader_vs,
+		   uint64_t mc_address_shader_ps,
+		   uint64_t mc_address_shader_vs,
+		   uint32_t ring, int version, int hang);
+
+int amdgpu_draw_load_vs_shader(uint8_t *ptr, uint32_t version);
+
+void
+amdgpu_memcpy_draw_hang_slow_test(amdgpu_device_handle device_handle,
+				  uint32_t ring, int version);
+
+#endif
diff --git a/lib/meson.build b/lib/meson.build
index 9bb0c8410..f110d8901 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -136,7 +136,8 @@ if libdrm_amdgpu.found()
 		'amdgpu/amd_gfx_v8_0.c',
 		'amdgpu/amd_gfx_v9_0.c',
 		'amdgpu/amd_dispatch_helpers.c',
-		'amdgpu/amd_dispatch.c'
+		'amdgpu/amd_dispatch.c',
+		'amdgpu/amd_draw_helpers.c'
 	]
 endif
 
-- 
2.25.1
