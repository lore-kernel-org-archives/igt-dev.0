Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2047.outbound.protection.outlook.com [40.107.223.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509BC14A6B7
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Jul 2022 20:57:00 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 22 Jul 2022 16:56:44 -0400
Message-ID: <20220722205650.4791-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 1/7] lib/amdgpu: increase number of resources
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Add arrays of bo's for VRAM and GTT.
Eviction test uses 4 bo resources.

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_ip_blocks.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index cb7d14747..c16ad1794 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -58,11 +58,13 @@ struct amdgpu_ring_context {
 
 	amdgpu_bo_handle bo;
 	amdgpu_bo_handle bo2;
+	amdgpu_bo_handle boa_vram[2];
+	amdgpu_bo_handle boa_gtt[2];
 
 	amdgpu_context_handle context_handle;
 	struct drm_amdgpu_info_hw_ip hw_ip_info;  /* result of amdgpu_query_hw_ip_info */
 
-	amdgpu_bo_handle resources[2]; /* amdgpu_bo_alloc_and_map */
+	amdgpu_bo_handle resources[4]; /* amdgpu_bo_alloc_and_map */
 	amdgpu_va_handle va_handle;    /* amdgpu_bo_alloc_and_map */
 	amdgpu_va_handle va_handle2;   /* amdgpu_bo_alloc_and_map */
 
-- 
2.25.1
