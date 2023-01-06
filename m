Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F164F10E829
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Jan 2023 02:48:36 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 5 Jan 2023 21:48:09 -0500
Message-ID: <20230106024812.102077-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/4] lib/amdgpu: rename function parameter
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

No functional change just cosmetic.
Rename flags parameter to alloc_flags to avoid ambiguity
with mapping flags.

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/amdgpu/amd_memory.c | 4 ++--
 lib/amdgpu/amd_memory.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/amdgpu/amd_memory.c b/lib/amdgpu/amd_memory.c
index 0aa400ac8..208e20eb8 100644
--- a/lib/amdgpu/amd_memory.c
+++ b/lib/amdgpu/amd_memory.c
@@ -41,7 +41,7 @@
 				      uint64_t size,
 				      uint64_t alignment,
 				      uint32_t type,
-				      uint64_t flags,
+				      uint64_t alloc_flags,
 				      uint64_t *vmc_addr,
 				      amdgpu_va_handle *va_handle)
 {
@@ -49,7 +49,7 @@
 		.alloc_size = size,
 		.phys_alignment = alignment,
 		.preferred_heap = type,
-		.flags = flags,
+		.flags = alloc_flags,
 	};
 	amdgpu_bo_handle buf_handle;
 	int r;
diff --git a/lib/amdgpu/amd_memory.h b/lib/amdgpu/amd_memory.h
index 77fd099b0..a06f88923 100644
--- a/lib/amdgpu/amd_memory.h
+++ b/lib/amdgpu/amd_memory.h
@@ -35,7 +35,7 @@ gpu_mem_alloc(amdgpu_device_handle device_handle,
 				      uint64_t size,
 				      uint64_t alignment,
 				      uint32_t type,
-				      uint64_t flags,
+				      uint64_t alloc_flags,
 				      uint64_t *vmc_addr,
 				      amdgpu_va_handle *va_handle);
 int
-- 
2.25.1
