Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2083.outbound.protection.outlook.com [40.107.243.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E5710E529
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Oct 2023 01:24:09 +0000 (UTC)
From: Jesse Zhang <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 25 Oct 2023 09:23:54 +0800
Message-ID: <20231025012354.712924-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH] tests/amd_security: add secure write test for gfx
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tim Huang <tim.huang@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Christian
 Koenig <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

To verify writes in TMZ mode,
add secure write, and verify the result for gfx.

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
Signed-off-by: Tim Huang <tim.huang@amd.com>
---
 lib/amdgpu/amd_command_submission.c |   9 +-
 lib/amdgpu/amd_ip_blocks.c          | 139 ++++++++++++++++------------
 lib/amdgpu/amd_ip_blocks.h          |   1 +
 tests/amdgpu/amd_security.c         |   7 +-
 4 files changed, 90 insertions(+), 66 deletions(-)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index b674ba640..ddcf3d96e 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -165,20 +165,19 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
 				r = ip_block->funcs->compare(ip_block->funcs, ring_context, 1);
 				igt_assert_eq(r, 0);
 			} else if (ip_block->type == AMDGPU_HW_IP_GFX) {
-				ip_block->funcs->write_linear(ip_block->funcs, ring_context, &ring_context->pm4_dw);
-
+				ip_block->funcs->atomic(ip_block->funcs, ring_context, &ring_context->pm4_dw);
 				amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context, 0);
-
 			} else if (ip_block->type == AMDGPU_HW_IP_DMA) {
 				/* restore the bo_cpu to compare */
 				ring_context->bo_cpu_origin = ring_context->bo_cpu[0];
-				ip_block->funcs->write_linear(ip_block->funcs, ring_context, &ring_context->pm4_dw);
+				ip_block->funcs->atomic(ip_block->funcs, ring_context, &ring_context->pm4_dw);
 
 				amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context, 0);
 
+				igt_assert_neq(ring_context->bo_cpu[0], ring_context->bo_cpu_origin);
 				/* restore again, here dest_data should be */
 				ring_context->bo_cpu_origin = ring_context->bo_cpu[0];
-				ip_block->funcs->write_linear(ip_block->funcs, ring_context, &ring_context->pm4_dw);
+				ip_block->funcs->atomic(ip_block->funcs, ring_context, &ring_context->pm4_dw);
 
 				amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context, 0);
 				/* here bo_cpu[0] should be unchanged, still is 0x12345678, otherwise failed*/
diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 96130ccd5..6a095e0a3 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -34,50 +34,59 @@ sdma_ring_write_linear(const struct amdgpu_ip_funcs *func,
 
 	i = 0;
 	j = 0;
-	if (ring_context->secure == false) {
-		if (func->family_id == AMDGPU_FAMILY_SI)
-			ring_context->pm4[i++] = SDMA_PACKET_SI(SDMA_OPCODE_WRITE, 0, 0, 0,
-						 ring_context->write_length);
-		else
-			ring_context->pm4[i++] = SDMA_PACKET(SDMA_OPCODE_WRITE,
-						 SDMA_WRITE_SUB_OPCODE_LINEAR,
-						 ring_context->secure ? SDMA_ATOMIC_TMZ(1) : 0);
+	if (func->family_id == AMDGPU_FAMILY_SI)
+		ring_context->pm4[i++] = SDMA_PACKET_SI(SDMA_OPCODE_WRITE, 0, 0, 0,
+					 ring_context->write_length);
+	else
+		ring_context->pm4[i++] = SDMA_PACKET(SDMA_OPCODE_WRITE,
+					 SDMA_WRITE_SUB_OPCODE_LINEAR,
+					 ring_context->secure ? SDMA_ATOMIC_TMZ(1) : 0);
+
+	ring_context->pm4[i++] = 0xfffffffc & ring_context->bo_mc;
+	ring_context->pm4[i++] = (0xffffffff00000000 & ring_context->bo_mc) >> 32;
+	if (func->family_id >= AMDGPU_FAMILY_AI)
+		ring_context->pm4[i++] = ring_context->write_length - 1;
+	else
+		ring_context->pm4[i++] = ring_context->write_length;
 
-		ring_context->pm4[i++] = 0xfffffffc & ring_context->bo_mc;
-		ring_context->pm4[i++] = (0xffffffff00000000 & ring_context->bo_mc) >> 32;
-		if (func->family_id >= AMDGPU_FAMILY_AI)
-			ring_context->pm4[i++] = ring_context->write_length - 1;
-		else
-			ring_context->pm4[i++] = ring_context->write_length;
+	while (j++ < ring_context->write_length)
+		ring_context->pm4[i++] = func->deadbeaf;
 
-		while (j++ < ring_context->write_length)
-			ring_context->pm4[i++] = func->deadbeaf;
-	} else {
-		memset(ring_context->pm4, 0, ring_context->pm4_size * sizeof(uint32_t));
+	*pm4_dw = i;
+
+	return 0;
+}
+
+static int
+sdma_ring_atomic(const struct amdgpu_ip_funcs *func,
+		       const struct amdgpu_ring_context *ring_context,
+		       uint32_t *pm4_dw)
+{
+	uint32_t i = 0;
+
+	memset(ring_context->pm4, 0, ring_context->pm4_size * sizeof(uint32_t));
 
 		/* atomic opcode for 32b w/ RTN and ATOMIC_SWAPCMP_RTN
 		 * loop, 1-loop_until_compare_satisfied.
 		 * single_pass_atomic, 0-lru
 		 */
-		ring_context->pm4[i++] = SDMA_PACKET(SDMA_OPCODE_ATOMIC,
-					       0,
-					       SDMA_ATOMIC_LOOP(1) |
-					       SDMA_ATOMIC_TMZ(1) |
-					       SDMA_ATOMIC_OPCODE(TC_OP_ATOMIC_CMPSWAP_RTN_32));
-		ring_context->pm4[i++] = 0xfffffffc & ring_context->bo_mc;
-		ring_context->pm4[i++] = (0xffffffff00000000 & ring_context->bo_mc) >> 32;
-		ring_context->pm4[i++] = 0x12345678;
-		ring_context->pm4[i++] = 0x0;
-		ring_context->pm4[i++] = func->deadbeaf;
-		ring_context->pm4[i++] = 0x0;
-		ring_context->pm4[i++] = 0x100;
-	}
-
+	ring_context->pm4[i++] = SDMA_PACKET(SDMA_OPCODE_ATOMIC,
+				       0,
+				       SDMA_ATOMIC_LOOP(1) |
+				       (ring_context->secure ? SDMA_ATOMIC_TMZ(1) : SDMA_ATOMIC_TMZ(0)) |
+				       SDMA_ATOMIC_OPCODE(TC_OP_ATOMIC_CMPSWAP_RTN_32));
+	ring_context->pm4[i++] = 0xfffffffc & ring_context->bo_mc;
+	ring_context->pm4[i++] = (0xffffffff00000000 & ring_context->bo_mc) >> 32;
+	ring_context->pm4[i++] = 0x12345678;
+	ring_context->pm4[i++] = 0x0;
+	ring_context->pm4[i++] = func->deadbeaf;
+	ring_context->pm4[i++] = 0x0;
+	ring_context->pm4[i++] = 0x100;
 	*pm4_dw = i;
 
 	return 0;
-}
 
+}
 static int
 sdma_ring_const_fill(const struct amdgpu_ip_funcs *func,
 		     const struct amdgpu_ring_context *context,
@@ -163,37 +172,45 @@ gfx_ring_write_linear(const struct amdgpu_ip_funcs *func,
 	i = 0;
 	j = 0;
 
-	if (ring_context->secure == false) {
-		ring_context->pm4[i++] = PACKET3(PACKET3_WRITE_DATA, 2 +  ring_context->write_length);
-		ring_context->pm4[i++] = WRITE_DATA_DST_SEL(5) | WR_CONFIRM;
-		ring_context->pm4[i++] = 0xfffffffc & ring_context->bo_mc;
-		ring_context->pm4[i++] = (0xffffffff00000000 & ring_context->bo_mc) >> 32;
-		while (j++ < ring_context->write_length)
-			ring_context->pm4[i++] = func->deadbeaf;
-	} else {
-		memset(ring_context->pm4, 0, ring_context->pm4_size * sizeof(uint32_t));
+	ring_context->pm4[i++] = PACKET3(PACKET3_WRITE_DATA, 2 +  ring_context->write_length);
+	ring_context->pm4[i++] = WRITE_DATA_DST_SEL(5) | WR_CONFIRM;
+	ring_context->pm4[i++] = 0xfffffffc & ring_context->bo_mc;
+	ring_context->pm4[i++] = (0xffffffff00000000 & ring_context->bo_mc) >> 32;
+	while (j++ < ring_context->write_length)
+		ring_context->pm4[i++] = func->deadbeaf;
+
+	*pm4_dw = i;
+	return 0;
+}
+
+static int
+gfx_ring_atomic(const struct amdgpu_ip_funcs *func,
+		      const struct amdgpu_ring_context *ring_context,
+		      uint32_t *pm4_dw)
+{
+	uint32_t i = 0;
+
+	memset(ring_context->pm4, 0, ring_context->pm4_size * sizeof(uint32_t));
 		ring_context->pm4[i++] = PACKET3(PACKET3_ATOMIC_MEM, 7);
 
-		/* atomic opcode for 32b w/ RTN and ATOMIC_SWAPCMP_RTN
-		 * command, 1-loop_until_compare_satisfied.
-		 * single_pass_atomic, 0-lru
-		 * engine_sel, 0-micro_engine
-		 */
-		ring_context->pm4[i++] = (TC_OP_ATOMIC_CMPSWAP_RTN_32 |
-					ATOMIC_MEM_COMMAND(1) |
-					ATOMIC_MEM_CACHEPOLICAY(0) |
-					ATOMIC_MEM_ENGINESEL(0));
-		ring_context->pm4[i++] = 0xfffffffc & ring_context->bo_mc;
-		ring_context->pm4[i++] = (0xffffffff00000000 & ring_context->bo_mc) >> 32;
-		ring_context->pm4[i++] = 0x12345678;
-		ring_context->pm4[i++] = 0x0;
-		ring_context->pm4[i++] = 0xdeadbeaf;
-		ring_context->pm4[i++] = 0x0;
-		ring_context->pm4[i++] = 0x100;
-	}
+	/* atomic opcode for 32b w/ RTN and ATOMIC_SWAPCMP_RTN
+	 * command, 1-loop_until_compare_satisfied.
+	 * single_pass_atomic, 0-lru
+	 * engine_sel, 0-micro_engine
+	 */
+	ring_context->pm4[i++] = (TC_OP_ATOMIC_CMPSWAP_RTN_32 |
+				ATOMIC_MEM_COMMAND(1) |
+				ATOMIC_MEM_CACHEPOLICAY(0) |
+				ATOMIC_MEM_ENGINESEL(0));
+	ring_context->pm4[i++] = 0xfffffffc & ring_context->bo_mc;
+	ring_context->pm4[i++] = (0xffffffff00000000 & ring_context->bo_mc) >> 32;
+	ring_context->pm4[i++] = 0x12345678;
+	ring_context->pm4[i++] = 0x0;
+	ring_context->pm4[i++] = 0xdeadbeaf;
+	ring_context->pm4[i++] = 0x0;
+	ring_context->pm4[i++] = 0x100;
 
 	*pm4_dw = i;
-
 	return 0;
 }
 
@@ -311,6 +328,7 @@ static struct amdgpu_ip_funcs gfx_v8_x_ip_funcs = {
 	.deadbeaf = 0xdeadbeaf,
 	.pattern = 0xaaaaaaaa,
 	.write_linear = gfx_ring_write_linear,
+	.atomic = gfx_ring_atomic,
 	.const_fill = gfx_ring_const_fill,
 	.copy_linear = gfx_ring_copy_linear,
 	.compare = x_compare,
@@ -325,6 +343,7 @@ static struct amdgpu_ip_funcs sdma_v3_x_ip_funcs = {
 	.deadbeaf = 0xdeadbeaf,
 	.pattern = 0xaaaaaaaa,
 	.write_linear = sdma_ring_write_linear,
+	.atomic = sdma_ring_atomic,
 	.const_fill = sdma_ring_const_fill,
 	.copy_linear = sdma_ring_copy_linear,
 	.compare = x_compare,
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 7f6fb3fb4..09a5e61f9 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -70,6 +70,7 @@ struct amdgpu_ip_funcs {
 	uint32_t	pattern;
 	/* functions */
 	int (*write_linear)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, uint32_t *pm4_dw);
+	int (*atomic)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, uint32_t *pm4_dw);
 	int (*const_fill)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, uint32_t *pm4_dw);
 	int (*copy_linear)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, uint32_t *pm4_dw);
 	int (*compare)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, int div);
diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
index 1a7eba9eb..793a0a8b5 100644
--- a/tests/amdgpu/amd_security.c
+++ b/tests/amdgpu/amd_security.c
@@ -356,10 +356,15 @@ igt_main
 	amdgpu_security_alloc_buf_test(device);
 
 	igt_describe("amdgpu_command_submission_write_linear_helper");
-	igt_subtest("write-linear-helper-secure")
+	igt_subtest("sdma-write-linear-helper-secure")
 	amdgpu_command_submission_write_linear_helper(device,
 			get_ip_block(device, AMDGPU_HW_IP_DMA), is_secure);
 
+	igt_describe("amdgpu_command_submission_write_linear_helper");
+	igt_subtest("gfx-write-linear-helper-secure")
+	 amdgpu_command_submission_write_linear_helper(device,
+			get_ip_block(device, AMDGPU_HW_IP_GFX), is_secure);
+
 	/* dynamic test based on sdma_info.available rings */
 	igt_describe("amdgpu_secure_bounce");
 	igt_subtest("amdgpu-secure-bounce")
-- 
2.25.1
