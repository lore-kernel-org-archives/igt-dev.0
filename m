Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2082.outbound.protection.outlook.com [40.107.102.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E96E110E0C7
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Nov 2022 04:28:30 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 23 Nov 2022 23:28:09 -0500
Message-ID: <20221124042809.7602-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH] lib/amdgpu: activate GFX9 test support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: pierre-eric.pelloux-prayer@amd.com, christian.koenig@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Use always AMDGPU_CTX_NO_RESET for comparison of return code.

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_dispatch.c  | 5 +----
 lib/amdgpu/amd_ip_blocks.c | 3 +--
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/lib/amdgpu/amd_dispatch.c b/lib/amdgpu/amd_dispatch.c
index ddc6def17..075f897ac 100644
--- a/lib/amdgpu/amd_dispatch.c
+++ b/lib/amdgpu/amd_dispatch.c
@@ -520,11 +520,8 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
 		amdgpu_memcpy_dispatch_test(device_handle, ip_type,
 					    ring_id,  version, 0);
 		amdgpu_memcpy_dispatch_hang_slow_test(device_handle, ip_type,
-						      ring_id, version,
-						      ip_type == AMDGPU_HW_IP_GFX ?
-				AMDGPU_CTX_UNKNOWN_RESET:AMDGPU_CTX_NO_RESET);
+						      ring_id, version, AMDGPU_CTX_NO_RESET);
 
-		/* TODO Why reset status is differant? */
 		amdgpu_memcpy_dispatch_test(device_handle, ip_type, ring_id,
 					    version, 0);
 	}
diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 3d7c54a11..3331c40bd 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -640,6 +640,7 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
 		break;
 	case GFX7: /* tested */
 	case GFX8: /* tested */
+	case GFX9: /* tested */
 	case GFX10:/* tested */
 		amdgpu_device_ip_block_add(&gfx_v8_x_ip_block);
 		amdgpu_device_ip_block_add(&compute_v8_x_ip_block);
@@ -652,8 +653,6 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
 		igt_assert_eq(gfx_v8_x_ip_block.funcs->family_id, FAMILY_VI);
 		igt_assert_eq(sdma_v3_x_ip_block.funcs->family_id, FAMILY_VI);
 		break;
-	case GFX9:
-		break;
 	case GFX10_3:
 		break;
 	default:
-- 
2.25.1
