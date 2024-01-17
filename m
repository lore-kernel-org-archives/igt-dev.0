Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBBE110E091
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jan 2024 04:54:50 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Subject: [PATCH 1/2] lib/amdgpu: add support for gang cs
Date: Tue, 16 Jan 2024 23:54:40 -0500
Message-ID: <20240117045441.256498-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>, Christian
 Koenig <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

When gang command submission is used we need to add fields
for the second buf and second pm4 packet.

Add ASIC-dependent implementation of WAIT_REG_MEM used to poll on
location in the register or memory space until a reference value
is satisfied.

Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c | 35 +++++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_ip_blocks.h | 20 ++++++++++++++++----
 2 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 1adea6987..20264c019 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -288,6 +288,39 @@ gfx_ring_copy_linear(const struct amdgpu_ip_funcs *func,
 	return 0;
 }
 
+static int
+gfx_ring_wait_reg_mem(const struct amdgpu_ip_funcs *func,
+			const struct amdgpu_ring_context *ring_context,
+			uint32_t *pm4_dw)
+{
+	uint32_t i;
+
+	i = *pm4_dw;
+	ring_context->pm4[i++] = PACKET3(PACKET3_WAIT_REG_MEM, 5);
+	ring_context->pm4[i++] = (WAIT_REG_MEM_MEM_SPACE(1) | /* memory */
+							WAIT_REG_MEM_FUNCTION(3) | /* == */
+							WAIT_REG_MEM_ENGINE(0));  /* me */
+	ring_context->pm4[i++] = lower_32_bits(ring_context->bo_mc);
+	ring_context->pm4[i++] = upper_32_bits(ring_context->bo_mc);
+	ring_context->pm4[i++] = func->deadbeaf; /* reference value */
+	ring_context->pm4[i++] = 0xffffffff; /* and mask */
+	ring_context->pm4[i++] = 0x00000004; /* poll interval */
+	*pm4_dw = i;
+
+	return 0;
+}
+
+static int
+sdma_ring_wait_reg_mem(const struct amdgpu_ip_funcs *func,
+			const struct amdgpu_ring_context *ring_context,
+			uint32_t *pm4_dw)
+{
+	int r;
+
+	r = gfx_ring_wait_reg_mem(func, ring_context, pm4_dw);
+	return r;
+}
+
 /* we may cobine these two functions later */
 static int
 x_compare(const struct amdgpu_ip_funcs *func,
@@ -336,6 +369,7 @@ static struct amdgpu_ip_funcs gfx_v8_x_ip_funcs = {
 	.compare = x_compare,
 	.compare_pattern = x_compare_pattern,
 	.get_reg_offset = gfx_v8_0_get_reg_offset,
+	.wait_reg_mem = gfx_ring_wait_reg_mem,
 };
 
 static struct amdgpu_ip_funcs sdma_v3_x_ip_funcs = {
@@ -351,6 +385,7 @@ static struct amdgpu_ip_funcs sdma_v3_x_ip_funcs = {
 	.compare = x_compare,
 	.compare_pattern = x_compare_pattern,
 	.get_reg_offset = gfx_v8_0_get_reg_offset,
+	.wait_reg_mem = sdma_ring_wait_reg_mem,
 };
 
 struct amdgpu_ip_block_version gfx_v8_x_ip_block = {
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index aef433e7f..4cad30d1e 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -31,22 +31,31 @@ struct amdgpu_ring_context {
 	int res_cnt; /* num of bo in amdgpu_bo_handle resources[2] */
 
 	uint32_t write_length;  /* length of data */
+	uint32_t write_length2; /* length of data for second packet */
 	uint32_t *pm4;		/* data of the packet */
 	uint32_t pm4_size;	/* max allocated packet size */
 	bool secure;		/* secure or not */
 
-	uint64_t bo_mc;		/* result from amdgpu_bo_alloc_and_map */
-	uint64_t bo_mc2;	/* result from amdgpu_bo_alloc_and_map */
+	uint64_t bo_mc;		/* GPU address of first buffer */
+	uint64_t bo_mc2;	/* GPU address for p4 packet */
+	uint64_t bo_mc3;	/* GPU address of second buffer */
+	uint64_t bo_mc4;	/* GPU address of second p4 packet */
 
 	uint32_t pm4_dw;	/* actual size of pm4 */
+	uint32_t pm4_dw2;	/* actual size of second pm4 */
 
-	volatile uint32_t *bo_cpu;
-	volatile uint32_t *bo2_cpu;
+	volatile uint32_t *bo_cpu;	/* cpu adddress of mapped GPU buf */
+	volatile uint32_t *bo2_cpu;	/* cpu adddress of mapped pm4 */
+	volatile uint32_t *bo3_cpu;	/* cpu adddress of mapped GPU second buf */
+	volatile uint32_t *bo4_cpu;	/* cpu adddress of mapped second pm4 */
 
 	uint32_t bo_cpu_origin;
 
 	amdgpu_bo_handle bo;
 	amdgpu_bo_handle bo2;
+	amdgpu_bo_handle bo3;
+	amdgpu_bo_handle bo4;
+
 	amdgpu_bo_handle boa_vram[2];
 	amdgpu_bo_handle boa_gtt[2];
 
@@ -56,6 +65,8 @@ struct amdgpu_ring_context {
 	amdgpu_bo_handle resources[4]; /* amdgpu_bo_alloc_and_map */
 	amdgpu_va_handle va_handle;    /* amdgpu_bo_alloc_and_map */
 	amdgpu_va_handle va_handle2;   /* amdgpu_bo_alloc_and_map */
+	amdgpu_va_handle va_handle3;   /* amdgpu_bo_alloc_and_map */
+	amdgpu_va_handle va_handle4;   /* amdgpu_bo_alloc_and_map */
 
 	struct amdgpu_cs_ib_info ib_info;     /* amdgpu_bo_list_create */
 	struct amdgpu_cs_request ibs_request; /* amdgpu_cs_query_fence_status */
@@ -76,6 +87,7 @@ struct amdgpu_ip_funcs {
 	int (*compare)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, int div);
 	int (*compare_pattern)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, int div);
 	int (*get_reg_offset)(enum general_reg reg);
+	int (*wait_reg_mem)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, uint32_t *pm4_dw);
 
 };
 
-- 
2.25.1
