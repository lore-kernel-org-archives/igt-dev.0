Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2071.outbound.protection.outlook.com [40.107.100.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719AC10E735
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Oct 2022 03:01:10 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Mon, 17 Oct 2022 23:00:54 -0400
Message-ID: <20221018030055.73636-6-vitaly.prosyak@amd.com>
In-Reply-To: <20221018030055.73636-1-vitaly.prosyak@amd.com>
References: <20221018030055.73636-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 6/7] tests/amdgpu: reuse predefined const
 GFX_COMPUTE_NOP
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: pierre-eric.pelloux-prayer@amd.com, marek.olsak@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
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
index 54d001532..d6cdbfeaf 100644
--- a/lib/amdgpu/amd_PM4.h
+++ b/lib/amdgpu/amd_PM4.h
@@ -216,4 +216,5 @@
 /* GMC registers */
 #define mmVM_CONTEXT0_PAGE_TABLE_BASE_ADDR                   0x54f
 
+#define GFX_COMPUTE_NOP  0xffff1000
 #endif
diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index 49602320a..d22b4aad5 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -101,7 +101,7 @@ amdgpu_deadlock_helper(amdgpu_device_handle device_handle, unsigned ip_type, boo
 	base_cmd->emit(base_cmd, 0);/* reference value */
 	base_cmd->emit(base_cmd, 0xffffffff); /* and mask */
 	base_cmd->emit(base_cmd, 0x00000004);/* poll interval */
-	base_cmd->emit_repeat(base_cmd, 0xffff1000, 16 - base_cmd->cdw);
+	base_cmd->emit_repeat(base_cmd, GFX_COMPUTE_NOP, 16 - base_cmd->cdw);
 
 
 	ib_result_cpu2 = ib_result_cpu;
@@ -301,7 +301,7 @@ bad_access_helper(amdgpu_device_handle device_handle, int reg_access)
 					0xdeadbee0);
 	base_cmd->emit(base_cmd, 0 );
 	base_cmd->emit(base_cmd, 0xdeadbeef );
-	base_cmd->emit_repeat(base_cmd, 0xffff1000, 16 - base_cmd->cdw);
+	base_cmd->emit_repeat(base_cmd, GFX_COMPUTE_NOP, 16 - base_cmd->cdw);
 
 	memset(&ib_info, 0, sizeof(struct amdgpu_cs_ib_info));
 	ib_info.ib_mc_address = ib_result_mc_address;
diff --git a/lib/amdgpu/amd_dispatch.c b/lib/amdgpu/amd_dispatch.c
index cf773c309..c476bc1d6 100644
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
index 8f018167c..69f7d8ac7 100644
--- a/lib/amdgpu/amd_sdma.h
+++ b/lib/amdgpu/amd_sdma.h
@@ -102,4 +102,6 @@
 		 */
 #              define PACKET3_DMA_DATA_SI_CP_SYNC     (1 << 31)
 
+#define SDMA_NOP  0x0
+
 #endif
diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 9be034975..f5df4acaa 100644
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
