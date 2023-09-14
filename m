Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E3CD10E1FC
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Sep 2023 01:17:57 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 13 Sep 2023 21:17:32 -0400
Message-ID: <20230914011732.343775-3-vitaly.prosyak@amd.com>
In-Reply-To: <20230914011732.343775-1-vitaly.prosyak@amd.com>
References: <20230914011732.343775-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 3/3] lib/amdgpu: add shaders for gfx11
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Jesse Zhang <jesse.zhang@amd.com>

add memcpy shader for gfx11

Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>

v2 : added disassembly comments (Vitaly)

Signed-off-by: Jesse zhang <jesse.zhang@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_dispatch.c         | 21 ++++----
 lib/amdgpu/amd_dispatch_helpers.c | 30 +++++++++--
 lib/amdgpu/amd_shaders.c          | 88 ++++++++++++++++++++++++++++++-
 3 files changed, 122 insertions(+), 17 deletions(-)

diff --git a/lib/amdgpu/amd_dispatch.c b/lib/amdgpu/amd_dispatch.c
index 075f897ac..f17240f5c 100644
--- a/lib/amdgpu/amd_dispatch.c
+++ b/lib/amdgpu/amd_dispatch.c
@@ -254,6 +254,8 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 		base_cmd->emit(base_cmd,0x74fac);
 	else if (version == 10)
 		base_cmd->emit(base_cmd,0x1104bfac);
+	else if (version == 11)
+		base_cmd->emit(base_cmd,0x1003dfac);
 
 	/* Writes the UAV constant data to the SGPRs. */
 	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
@@ -265,6 +267,8 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 		base_cmd->emit(base_cmd, 0x74fac);
 	else if (version == 10)
 		base_cmd->emit(base_cmd, 0x1104bfac);
+	else if (version == 11)
+		base_cmd->emit(base_cmd, 0x1003dfac);
 
 	/* clear mmCOMPUTE_RESOURCE_LIMITS */
 	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
@@ -506,21 +510,18 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
 	r = amdgpu_query_hw_ip_info(device_handle, ip_type, 0, &info);
 	igt_assert_eq(r, 0);
 	if (!info.available_rings)
-		printf("SKIP ... as there's no ring for ip %d\n", ip_type);
+		igt_info("SKIP ... as there's no ring for ip %d\n", ip_type);
 
 	version = info.hw_ip_version_major;
-	if (version != 9 && version != 10) {
-		printf("SKIP ... unsupported gfx version %d\n", version);
+	if (version != 9 && version != 10 /*&& version != 11*/) {
+		igt_info("SKIP ... unsupported gfx version %d\n", version);
 		return;
 	}
-	//TODO IGT
-	//if (version < 9)
-	//	version = 9;
 	for (ring_id = 0; (1 << ring_id) & info.available_rings; ring_id++) {
 		amdgpu_memcpy_dispatch_test(device_handle, ip_type,
 					    ring_id,  version, 0);
 		amdgpu_memcpy_dispatch_hang_slow_test(device_handle, ip_type,
-						      ring_id, version, AMDGPU_CTX_NO_RESET);
+						      ring_id, version, AMDGPU_CTX_UNKNOWN_RESET);
 
 		amdgpu_memcpy_dispatch_test(device_handle, ip_type, ring_id,
 					    version, 0);
@@ -536,11 +537,11 @@ void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_ty
 	r = amdgpu_query_hw_ip_info(device_handle, AMDGPU_HW_IP_GFX, 0, &info);
 	igt_assert_eq(r, 0);
 	if (!info.available_rings)
-		printf("SKIP ... as there's no graphics ring\n");
+		igt_info("SKIP ... as there's no graphics ring\n");
 
 	version = info.hw_ip_version_major;
-	if (version != 9 && version != 10) {
-		printf("SKIP ... unsupported gfx version %d\n", version);
+	if (version != 9 && version != 10 && version != 11) {
+		igt_info("SKIP ... unsupported gfx version %d\n", version);
 		return;
 	}
 	if (version < 9)
diff --git a/lib/amdgpu/amd_dispatch_helpers.c b/lib/amdgpu/amd_dispatch_helpers.c
index 8f06d841d..11ce8284a 100644
--- a/lib/amdgpu/amd_dispatch_helpers.c
+++ b/lib/amdgpu/amd_dispatch_helpers.c
@@ -118,8 +118,16 @@ int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base * base, uint64_t shader_addr
 		{0x2e08, 0x00000001},	//{ mmCOMPUTE_NUM_THREAD_Y,	0x00000001 },
 		{0x2e09, 0x00000001},	//{ mmCOMPUTE_NUM_THREAD_Z,	0x00000001 }
 	};
+	static uint32_t bufferclear_cs_shader_registers_gfx11[][2] = {
+		{0x2e12, 0x600C0041},	//{ mmCOMPUTE_PGM_RSRC1,	  0x600C0041 },
+		{0x2e13, 0x00000090},	//{ mmCOMPUTE_PGM_RSRC2,	  0x00000090 },
+		{0x2e07, 0x00000040},	//{ mmCOMPUTE_NUM_THREAD_X, 0x00000040 },
+		{0x2e08, 0x00000001},	//{ mmCOMPUTE_NUM_THREAD_Y, 0x00000001 },
+		{0x2e09, 0x00000001},	//{ mmCOMPUTE_NUM_THREAD_Z, 0x00000001 }
+	};
 
 	static const uint32_t bufferclear_cs_shader_registers_num_gfx9 = ARRAY_SIZE(bufferclear_cs_shader_registers_gfx9);
+	static const uint32_t bufferclear_cs_shader_registers_num_gfx11 = ARRAY_SIZE(bufferclear_cs_shader_registers_gfx11);
 	int offset_prev = base->cdw;
 	int j;
 
@@ -130,11 +138,23 @@ int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base * base, uint64_t shader_addr
 	base->emit(base, shader_addr >> 8);
 	base->emit(base, shader_addr >> 40);
 	/* write sh regs */
-	for (j = 0; j < bufferclear_cs_shader_registers_num_gfx9; j++) {
-		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
-		/* - Gfx9ShRegBase */
-		base->emit(base,bufferclear_cs_shader_registers_gfx9[j][0] - 0x2c00);
-		base->emit(base,bufferclear_cs_shader_registers_gfx9[j][1]);
+	if (version == 11) {
+		for (j = 0; j < bufferclear_cs_shader_registers_num_gfx11; j++) {
+			base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
+			/* - Gfx11ShRegBase */
+			base->emit(base,bufferclear_cs_shader_registers_gfx11[j][0] - 0x2c00);
+			if (bufferclear_cs_shader_registers_gfx11[j][0] ==0x2E12)
+				bufferclear_cs_shader_registers_gfx11[j][1] &= ~(1<<29);
+
+			base->emit(base,bufferclear_cs_shader_registers_gfx11[j][1]);
+		}
+	} else {
+		for (j = 0; j < bufferclear_cs_shader_registers_num_gfx9; j++) {
+			base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
+			/* - Gfx9ShRegBase */
+			base->emit(base,bufferclear_cs_shader_registers_gfx9[j][0] - 0x2c00);
+			base->emit(base,bufferclear_cs_shader_registers_gfx9[j][1]);
+		}
 	}
 	if (version == 10) {
 		/* mmCOMPUTE_PGM_RSRC3 */
diff --git a/lib/amdgpu/amd_shaders.c b/lib/amdgpu/amd_shaders.c
index 7672f67c0..cbea12827 100644
--- a/lib/amdgpu/amd_shaders.c
+++ b/lib/amdgpu/amd_shaders.c
@@ -150,10 +150,9 @@ int amdgpu_dispatch_load_cs_shader_hang_slow(uint32_t *ptr, uint32_t family_id)
 			shader = &memcpy_cs_hang_slow_rv;
 			break;
 		case AMDGPU_FAMILY_NV:
+		default:
 			shader = &memcpy_cs_hang_slow_nv;
 			break;
-		default:
-			return -1;
 	}
 
 	memcpy(ptr, shader->shader, shader->header_length * sizeof(uint32_t));
@@ -275,6 +274,85 @@ int  amdgpu_dispatch_load_cs_shader(uint8_t *ptr, int cs_type, uint32_t version)
 		0xBF8C3F70, 0xE01C2000, 0x80010201, 0xBF810000
 	};
 
+	/**
+	 * shader main
+	 * asic(GFX11)
+	 * type(CS)
+	 * s_version     UC_VERSION_GFX11 | UC_VERSION_W64_BIT   // 000000000000: B0802006
+	 * s_set_inst_prefetch_distance  0x0003                  // 000000000004: BF840003
+	 * v_and_b32     v0, lit(0x000003ff), v0                 // 000000000008: 360000FF 000003FF
+	 * v_mov_b32     v1, s5                                  // 000000000010: 7E020205
+	 * v_mov_b32     v2, s6                                  // 000000000014: 7E040206
+	 * v_mov_b32     v3, s7                                  // 000000000018: 7E060207
+	 * s_delay_alu   instid0(VALU_DEP_4)                     // 00000000001C: BF870004
+	 * v_lshl_add_u32  v4, s8, 6, v0                         // 000000000020: D6460004 04010C08
+	 * v_mov_b32     v0, s4                                  // 000000000028: 7E000204
+	 * buffer_store_format_xyzw  v[0:3], v4, s[0:3], 0 idxen // 00000000002C: E01C0000 80800004
+	 * s_sendmsg     sendmsg(MSG_DEALLOC_VGPRS, 0, 0)        // 000000000034: BFB60003
+	 * s_endpgm                                              // 000000000038: BFB00000
+	 */
+	static const uint32_t bufferclear_cs_shader_gfx11[] = {
+		0xB0802006, 0xBF840003, 0x360000FF, 0x000003FF,
+		0x7E020205, 0x7E040206, 0x7E060207, 0xBF870004,
+		0xD6460004, 0x04010C08, 0x7E000204, 0xE01C0000,
+		0x80800004, 0xBFB60003, 0xBFB00000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000
+	};
+
+	/**
+	 * shader main
+	 * asic(GFX11)
+	 * type(CS)
+	 * s_version     UC_VERSION_GFX11 | UC_VERSION_W64_BIT   // 000000000000: B0802006
+	 * s_set_inst_prefetch_distance  0x0003                  // 000000000004: BF840003
+	 * v_and_b32     v0, lit(0x000003ff), v0                 // 000000000008: 360000FF 000003FF
+	 * s_delay_alu   instid0(VALU_DEP_1)                     // 000000000010: BF870001
+	 * v_lshl_add_u32  v1, s8, 6, v0                         // 000000000014: D6460001 04010C08
+	 * buffer_load_format_xyzw  v[2:5], v1, s[0:3], 0 idxen  // 00000000001C: E00C0000 80800201
+	 * s_waitcnt     vmcnt(0)                                // 000000000024: BF8903F7
+	 * buffer_store_format_xyzw  v[2:5], v1, s[4:7], 0 idxen // 000000000028: E01C0000 80810201
+	 * s_sendmsg     sendmsg(MSG_DEALLOC_VGPRS, 0, 0)        // 000000000030: BFB60003
+	 * s_endpgm                                              // 000000000034: BFB00000
+	 * end
+	 */
+	static const uint32_t buffercopy_cs_shader_gfx11[] = {
+		0xB0802006, 0xBF840003, 0x360000FF, 0x000003FF,
+		0xBF870001, 0xD6460001, 0x04010C08, 0xE00C0000,
+		0x80800201, 0xBF8903F7, 0xE01C0000, 0x80810201,
+		0xBFB60003, 0xBFB00000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000
+	};
+
 	uint32_t shader_size;
 	const uint32_t *shader;
 
@@ -286,6 +364,9 @@ int  amdgpu_dispatch_load_cs_shader(uint8_t *ptr, int cs_type, uint32_t version)
 			} else if (version == 10) {
 				shader = bufferclear_cs_shader_gfx10;
 				shader_size = sizeof(bufferclear_cs_shader_gfx10);
+			} else if (version == 11) {
+				shader = bufferclear_cs_shader_gfx11;
+				shader_size = sizeof(bufferclear_cs_shader_gfx11);
 			}
 			break;
 		case CS_BUFFERCOPY:
@@ -295,6 +376,9 @@ int  amdgpu_dispatch_load_cs_shader(uint8_t *ptr, int cs_type, uint32_t version)
 			} else if (version == 10) {
 				shader = buffercopy_cs_shader_gfx10;
 				shader_size = sizeof(buffercopy_cs_shader_gfx10);
+			} else if (version == 11) {
+				shader = buffercopy_cs_shader_gfx11;
+				shader_size = sizeof(buffercopy_cs_shader_gfx11);
 			}
 			break;
 		case CS_HANG:
-- 
2.25.1
