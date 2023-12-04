Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9495F10E182
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Dec 2023 03:00:35 +0000 (UTC)
From: Jesse Zhang <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Mon, 4 Dec 2023 11:00:07 +0800
Message-ID: <20231204030007.326044-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t] tests/amd_security: fix secure bounce test
 issue
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Luben Tuikov <luben.tuikov@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Christian
 Koenig <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

When it copy from scr (bo) to destination (bo2),
and move bo2 from vram to gtt.
Then it need to copy from bo2(src)
to bo (destination) for verification.

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 tests/amdgpu/amd_security.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
index d1146a7ce..7fb6df3b6 100644
--- a/tests/amdgpu/amd_security.c
+++ b/tests/amdgpu/amd_security.c
@@ -99,7 +99,7 @@ static void
 amdgpu_bo_lcopy(amdgpu_device_handle device,
 		struct amdgpu_ring_context *ring_context,
 		const struct amdgpu_ip_block_version *ip_block, uint32_t size,
-		uint32_t secure)
+		uint32_t secure, int direction)
 {
 	ring_context->pm4 = calloc(PACKET_LCOPY_SIZE, sizeof(*ring_context->pm4));
 	ring_context->secure = secure;
@@ -108,8 +108,15 @@ amdgpu_bo_lcopy(amdgpu_device_handle device,
 	ring_context->res_cnt = 2;
 	igt_assert(ring_context->pm4);
 
-	amdgpu_sdma_lcopy(ring_context->pm4, ring_context->bo_mc2,
-			ring_context->bo_mc, size, secure);
+	if (direction) {
+		/* copy from bo2 to bo */
+		amdgpu_sdma_lcopy(ring_context->pm4, ring_context->bo_mc,
+				ring_context->bo_mc2, size, secure);
+	} else {
+		/* copy from bo to bo bo2 */
+		amdgpu_sdma_lcopy(ring_context->pm4, ring_context->bo_mc2,
+				ring_context->bo_mc, size, secure);
+	}
 	amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context, 0);
 	free(ring_context->pm4);
 }
@@ -222,7 +229,7 @@ amdgpu_secure_bounce(amdgpu_device_handle device_handle, int fd,
 	ring_context->resources[1] = ring_context->bo;	// Alice
 
 	amdgpu_bo_lcopy(device_handle, ring_context, ip_block, SECURE_BUFFER_SIZE,
-			secure == true ? 1 : 0);
+			secure == true ? 1 : 0, 0);
 
 	/* Verify the contents of Bob. */
 	for (pp = (__typeof__(pp))ring_context->bo2_cpu;
@@ -249,7 +256,7 @@ amdgpu_secure_bounce(amdgpu_device_handle device_handle, int fd,
 
 	/* sDMA TMZ copy from Bob to Alice. */
 	amdgpu_bo_lcopy(device_handle, ring_context, ip_block, SECURE_BUFFER_SIZE,
-			secure == true ? 1 : 0);
+			secure == true ? 1 : 0, 1);
 
 	/* Verify the contents of Alice */
 	for (pp = (__typeof__(pp))ring_context->bo_cpu;
-- 
2.25.1
