Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: <vitaly.prosyak@amd.com>
Subject: [PATCH 2/2] tests/amd_security: fix secure bounce test
Date: Thu, 11 Jan 2024 14:25:53 -0500
Message-ID: <20240111192553.113902-2-vitaly.prosyak@amd.com>
In-Reply-To: <20240111192553.113902-1-vitaly.prosyak@amd.com>
References: <20240111192553.113902-1-vitaly.prosyak@amd.com>
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev.lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>
Message-ID: <20240111192553.uZYF0d1rs_urw4GZugKtPvJoXRoUMxvbVYhHxUJPh0c@z>

From: Jesse Zhang <jesse.zhang@amd.com>

When it copy from scr (bo) to destination (bo2),
and move bo2 from vram to gtt. Then it need to copy from bo2(src)
to bo (destination) for verification.

v2:
  - The typo was hidden in the fact that the same pattern was used for
    both buffers and even when the second copy did not occur due to an
    incorrect address, the problem did not pop up. To address the issue
    we use the second pattern for the second copy.(Vitaly)

  - Use ASIC-dependent linear copy function vs hardcoded earlier.(Vitaly)

  - Remove obsolete amdgpu_sdma_lcopy.(Vitaly)

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reviewed-by: Jesse Zhang <jesse.zhang@amd.com>
---
 tests/amdgpu/amd_security.c | 45 ++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 23 deletions(-)

diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
index d1146a7ce..ec6883d3d 100644
--- a/tests/amdgpu/amd_security.c
+++ b/tests/amdgpu/amd_security.c
@@ -58,22 +58,6 @@ get_handle(struct amdgpu_bo *bo)
 	return handle;
 }
 
-static void
-amdgpu_sdma_lcopy(uint32_t *packet, uint64_t dst, uint64_t src, uint32_t size,
-				uint32_t secure)
-{
-	/* Set the packet to Linear copy with TMZ set.
-	 */
-	packet[0] = htole32(secure << 18 | 1);
-	packet[1] = htole32(size-1);
-	packet[2] = htole32(0);
-	packet[3] = htole32((uint32_t)(src & 0xFFFFFFFFU));
-	packet[4] = htole32((uint32_t)(src >> 32));
-	packet[5] = htole32((uint32_t)(dst & 0xFFFFFFFFU));
-	packet[6] = htole32((uint32_t)(dst >> 32));
-	packet[7] = htole32(0);
-}
-
 static void
 amdgpu_sdma_nop(uint32_t *packet, uint32_t nop_count)
 {
@@ -106,10 +90,10 @@ amdgpu_bo_lcopy(amdgpu_device_handle device,
 	ring_context->pm4_size = PACKET_LCOPY_SIZE;
 	ring_context->pm4_dw = PACKET_LCOPY_SIZE;
 	ring_context->res_cnt = 2;
+	ring_context->write_length =  size;
 	igt_assert(ring_context->pm4);
-
-	amdgpu_sdma_lcopy(ring_context->pm4, ring_context->bo_mc2,
-			ring_context->bo_mc, size, secure);
+	ip_block->funcs->copy_linear(ip_block->funcs, ring_context,
+			&ring_context->pm4_dw);
 	amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context, 0);
 	free(ring_context->pm4);
 }
@@ -163,7 +147,7 @@ amdgpu_bo_move(amdgpu_device_handle device, int fd,
  */
 static const uint8_t secure_pattern[] = { 0x5A, 0xFE, 0x05, 0xEC };
 
-
+static const uint8_t secure_pattern2[] = { 0xDE, 0xAD, 0xBE, 0xEF };
 
 static void
 amdgpu_secure_bounce(amdgpu_device_handle device_handle, int fd,
@@ -175,6 +159,7 @@ amdgpu_secure_bounce(amdgpu_device_handle device_handle, int fd,
 	long page_size;
 	uint8_t *pp;
 	int r;
+	uint64_t tmp_mc;
 
 	ring_context = calloc(1, sizeof(*ring_context));
 	igt_assert(ring_context);
@@ -235,6 +220,11 @@ amdgpu_secure_bounce(amdgpu_device_handle device_handle, int fd,
 			break;
 		}
 	}
+	/* Fill Bob with a pattern2 */
+	for (pp = (__typeof__(pp))ring_context->bo2_cpu;
+		pp < (__typeof__(pp)) ring_context->bo2_cpu + SECURE_BUFFER_SIZE;
+		pp += sizeof(secure_pattern2))
+		memcpy(pp, secure_pattern2, sizeof(secure_pattern2));
 
 	/* Move Bob to the GTT domain. */
 	amdgpu_bo_move(device_handle, fd, ring_context, ip_block,
@@ -247,15 +237,24 @@ amdgpu_secure_bounce(amdgpu_device_handle device_handle, int fd,
 	ring_context->resources[0] = ring_context->bo; // Alice
 	ring_context->resources[1] = ring_context->bo2; // Bob
 
+	/*
+	 * Swap mc addresses between Bob(bo_mc2) and Alice(bo_mc) since we copy now
+	 * from Bob to Alice and using ASIC dependant implementation sdma_ring_copy_linear
+	 * which uses context->bo_mc as source and context->bo_mc2 as destination
+	 */
+	tmp_mc = ring_context->bo_mc2;
+	ring_context->bo_mc2 = ring_context->bo_mc;
+	ring_context->bo_mc = tmp_mc;
+
 	/* sDMA TMZ copy from Bob to Alice. */
 	amdgpu_bo_lcopy(device_handle, ring_context, ip_block, SECURE_BUFFER_SIZE,
 			secure == true ? 1 : 0);
 
-	/* Verify the contents of Alice */
+	/* Verify the content of Alice if it matches to pattern2*/
 	for (pp = (__typeof__(pp))ring_context->bo_cpu;
 	     pp < (__typeof__(pp)) ring_context->bo_cpu + SECURE_BUFFER_SIZE;
-	     pp += sizeof(secure_pattern)) {
-		r = memcmp(pp, secure_pattern, sizeof(secure_pattern));
+	     pp += sizeof(secure_pattern2)) {
+		r = memcmp(pp, secure_pattern2, sizeof(secure_pattern2));
 		if (r) {
 			// test failure
 			igt_assert(false);
-- 
2.25.1
