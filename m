Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5AD210E1C2
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Nov 2022 21:53:04 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 11 Nov 2022 16:52:12 -0500
Message-ID: <20221111215213.48679-8-vitaly.prosyak@amd.com>
In-Reply-To: <20221111215213.48679-1-vitaly.prosyak@amd.com>
References: <20221111215213.48679-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 8/9] tests/amdgpu: reuse predefined const
 GFX_COMPUTE_NOP
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Pierre-eric
 Pelloux-prayer <Pierre-eric.Pelloux-prayer@amd.com>, marek.olsak@amd.com,
 christian.koenig@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reviewed-by: Pierre-eric Pelloux-prayer <Pierre-eric.Pelloux-prayer@amd.com>
---
 lib/amdgpu/amd_PM4.h              | 1 +
 lib/amdgpu/amd_deadlock_helpers.c | 4 ++--
 lib/amdgpu/amd_dispatch.c         | 6 +++---
 lib/amdgpu/amd_sdma.h             | 2 ++
 tests/amdgpu/amd_basic.c          | 3 ---
 tests/amdgpu/amd_cs_nop.c         | 4 ++--
 tests/amdgpu/amd_prime.c          | 5 ++---
 7 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/lib/amdgpu/amd_PM4.h b/lib/amdgpu/amd_PM4.h
index 32a04c1ac..dd483baee 100644
--- a/lib/amdgpu/amd_PM4.h
+++ b/lib/amdgpu/amd_PM4.h
@@ -215,4 +215,5 @@
 /* GMC registers */
 #define mmVM_CONTEXT0_PAGE_TABLE_BASE_ADDR                   0x54f
 
+#define GFX_COMPUTE_NOP  0xffff1000
 #endif
diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index 5ffa39318..bef70893c 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -115,7 +115,7 @@ amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned ip_type)
 	base_cmd->emit(base_cmd, 0);/* reference value */
 	base_cmd->emit(base_cmd, 0xffffffff); /* and mask */
 	base_cmd->emit(base_cmd, 0x00000004);/* poll interval */
-	base_cmd->emit_repeat(base_cmd, 0xffff1000, 16 - base_cmd->cdw);
+	base_cmd->emit_repeat(base_cmd, GFX_COMPUTE_NOP, 16 - base_cmd->cdw);
 
 	ib_result_cpu2 = ib_result_cpu;
 	ib_result_cpu2[MEMORY_OFFSET] = 0x0; /* the memory we wait on to change */
@@ -227,7 +227,7 @@ bad_access_helper(amdgpu_device_handle device_handle, int reg_access, unsigned i
 					0xdeadbee0);
 	base_cmd->emit(base_cmd, 0 );
 	base_cmd->emit(base_cmd, 0xdeadbeef );
-	base_cmd->emit_repeat(base_cmd, 0xffff1000, 16 - base_cmd->cdw);
+	base_cmd->emit_repeat(base_cmd, GFX_COMPUTE_NOP, 16 - base_cmd->cdw);
 
 	memset(&ib_info, 0, sizeof(struct amdgpu_cs_ib_info));
 	ib_info.ib_mc_address = ib_result_mc_address;
diff --git a/lib/amdgpu/amd_dispatch.c b/lib/amdgpu/amd_dispatch.c
index 863786c59..ddc6def17 100644
--- a/lib/amdgpu/amd_dispatch.c
+++ b/lib/amdgpu/amd_dispatch.c
@@ -125,7 +125,7 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
 	base_cmd->emit(base_cmd, 1);
 	base_cmd->emit(base_cmd, 1);
 
-	base_cmd->emit_aligned(base_cmd, 7, 0xffff1000);
+	base_cmd->emit_aligned(base_cmd, 7, GFX_COMPUTE_NOP);
 	resources[0] = bo_dst;
 	resources[1] = bo_shader;
 	resources[2] = bo_cmd;
@@ -278,7 +278,7 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 	base_cmd->emit(base_cmd, 1);
 	base_cmd->emit(base_cmd, 1);
 
-	base_cmd->emit_aligned(base_cmd, 7, 0xffff1000); /* type3 nop packet */
+	base_cmd->emit_aligned(base_cmd, 7, GFX_COMPUTE_NOP); /* type3 nop packet */
 
 	resources[0] = bo_shader;
 	resources[1] = bo_src;
@@ -448,7 +448,7 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
 	base_cmd->emit(base_cmd, 1);
 	base_cmd->emit(base_cmd, 1);
 
-	base_cmd->emit_aligned(base_cmd, 7, 0xffff1000); /* type3 nop packet */
+	base_cmd->emit_aligned(base_cmd, 7, GFX_COMPUTE_NOP); /* type3 nop packet */
 
 	resources[0] = bo_shader;
 	resources[1] = bo_src;
diff --git a/lib/amdgpu/amd_sdma.h b/lib/amdgpu/amd_sdma.h
index 102df1024..3e568e47a 100644
--- a/lib/amdgpu/amd_sdma.h
+++ b/lib/amdgpu/amd_sdma.h
@@ -102,4 +102,6 @@
 		 */
 #              define PACKET3_DMA_DATA_SI_CP_SYNC     (1 << 31)
 
+#define SDMA_NOP  0x0
+
 #endif
diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 1d5c1f3fb..38525a85e 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -34,9 +34,6 @@
 
 #define BUFFER_SIZE (8 * 1024)
 
-#define GFX_COMPUTE_NOP  0xffff1000
-
-
 /**
  * MEM ALLOC TEST
  * @param device
diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c
index 46f4b7c65..ea3f6aae8 100644
--- a/tests/amdgpu/amd_cs_nop.c
+++ b/tests/amdgpu/amd_cs_nop.c
@@ -26,9 +26,9 @@
 
 #include <amdgpu.h>
 #include <amdgpu_drm.h>
+#include "lib/amdgpu/amd_PM4.h"
+
 
-#define GFX_COMPUTE_NOP  0xffff1000
-#define SDMA_NOP  0x0
 
 static int
 amdgpu_bo_alloc_and_map(amdgpu_device_handle dev, unsigned size,
diff --git a/tests/amdgpu/amd_prime.c b/tests/amdgpu/amd_prime.c
index 248fbc354..62924f15b 100644
--- a/tests/amdgpu/amd_prime.c
+++ b/tests/amdgpu/amd_prime.c
@@ -30,9 +30,8 @@
 #include "i915/gem_create.h"
 #include "igt.h"
 #include "igt_vgem.h"
-
-#define GFX_COMPUTE_NOP  0xffff1000
-#define SDMA_NOP  0x0
+#include "lib/amdgpu/amd_sdma.h"
+#include "lib/amdgpu/amd_PM4.h"
 
 static int
 amdgpu_bo_alloc_and_map(amdgpu_device_handle dev, unsigned size,
-- 
2.25.1
