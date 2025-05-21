Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13D2C54E65
	for <igt-dev@archiver.kernel.org>; Wed, 21 May 2025 10:44:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 961B910E80C;
	Wed, 21 May 2025 10:44:04 +0000 (UTC)
Received: from amd-X570-AORUS-ELITE.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F238010E6FC
 for <igt-dev@lists.freedesktop.org>; Wed, 21 May 2025 10:43:57 +0000 (UTC)
Received: by amd-X570-AORUS-ELITE.amd.com (Postfix, from userid 1000)
 id BD22536A0168; Wed, 21 May 2025 16:13:52 +0530 (IST)
From: Sunil Khatri <sunil.khatri@amd.com>
To: igt-dev@lists.freedesktop.org,
	Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH] amdgpu: remove AMDGPU_USERQ_ENABLED flag from userqueues
Date: Wed, 21 May 2025 16:13:50 +0530
Message-ID: <20250521104351.262573-1-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

All the dependent components are merged in upstream
and there is no need to have the flag anymore and
hence removing it.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 lib/amdgpu/amd_userq.c      | 33 ---------------------------------
 lib/meson.build             |  5 -----
 tests/amdgpu/amd_basic.c    |  3 ---
 tests/amdgpu/amd_cs_nop.c   |  2 --
 tests/amdgpu/amd_deadlock.c |  4 ++--
 tests/amdgpu/amd_security.c |  3 ---
 6 files changed, 2 insertions(+), 48 deletions(-)

diff --git a/lib/amdgpu/amd_userq.c b/lib/amdgpu/amd_userq.c
index f8e1a4b45..231f46a82 100644
--- a/lib/amdgpu/amd_userq.c
+++ b/lib/amdgpu/amd_userq.c
@@ -8,7 +8,6 @@
 #include "amd_PM4.h"
 #include "ioctl_wrappers.h"
 
-#ifdef AMDGPU_USERQ_ENABLED
 static void amdgpu_alloc_doorbell(amdgpu_device_handle device_handle,
 				  struct amdgpu_userq_bo *doorbell_bo,
 				  unsigned int size, unsigned int domain)
@@ -438,36 +437,4 @@ void amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_
 
 	}
 }
-#else
-int
-amdgpu_bo_alloc_and_map_uq(amdgpu_device_handle device_handle, unsigned int size,
-			   unsigned int alignment, unsigned int heap, uint64_t alloc_flags,
-			   uint64_t mapping_flags, amdgpu_bo_handle *bo, void **cpu,
-			   uint64_t *mc_address, amdgpu_va_handle *va_handle,
-			   uint32_t timeline_syncobj_handle, uint64_t point)
-{
-	return 0;
-}
-
-int amdgpu_timeline_syncobj_wait(amdgpu_device_handle device_handle,
-	uint32_t timeline_syncobj_handle, uint64_t point)
-{
-	return 0;
-}
 
-void amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context,
-	unsigned int ip_type, uint64_t mc_address)
-{
-}
-
-void amdgpu_user_queue_destroy(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt,
-	unsigned int type)
-{
-}
-
-void amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt,
-	unsigned int type)
-{
-}
-
-#endif
diff --git a/lib/meson.build b/lib/meson.build
index 6f3a1150c..29bb7ce4e 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -173,11 +173,6 @@ if libdrm_amdgpu.found()
 		lib_sources +=[ 'amdgpu/amd_dispatch.c',]
 	else
 		warning('libdrm <= 2.4.99 found, amdgpu_cs_query_reset_state2 not applicable')
-	endif
-
-	if cc.has_function('amdgpu_create_userqueue', dependencies: libdrm_amdgpu)
-		add_project_arguments('-DAMDGPU_USERQ_ENABLED=1', language: 'c')
-		#conf.set('AMDGPU_USERQ_ENABLED', 1)
 	endif	
 endif
 
diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 97a08a9a3..6339fe4ea 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -790,8 +790,6 @@ igt_main
 		}
 	}
 
-#ifdef AMDGPU_USERQ_ENABLED
-
 	igt_describe("Check-GFX-CS-for-every-available-ring-works-for-write-const-fill-and-copy-operation-using-more-than-one-IB-and-shared-IB");
 	igt_subtest_with_dynamic("cs-gfx-with-IP-GFX-UMQ") {
 		if (userq_arr_cap[AMD_IP_GFX]) {
@@ -815,7 +813,6 @@ igt_main
 			amdgpu_sync_dependency_test(device, true);
 		}
 	}
-#endif
 
 	igt_fixture {
 		amdgpu_device_deinitialize(device);
diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c
index 268bc9201..d29ac7a27 100644
--- a/tests/amdgpu/amd_cs_nop.c
+++ b/tests/amdgpu/amd_cs_nop.c
@@ -199,7 +199,6 @@ igt_main
 		}
 	}
 
-#ifdef AMDGPU_USERQ_ENABLED
 	for (p = phase; p->name; p++) {
 		for (e = engines; e->name; e++) {
 			igt_describe("Stressful-and-multiple-cs-of-nop-operations-using-multiple-processes-with-the-same-GPU-context-UMQ");
@@ -212,7 +211,6 @@ igt_main
 			}
 		}
 	}
-#endif
 
 	igt_fixture {
 		amdgpu_cs_ctx_free(context);
diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index d59957cc2..a4f15578f 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -179,7 +179,7 @@ igt_main
 					AMDGPU_HW_IP_DMA, &pci, false);
 		}
 	}
-#ifdef AMDGPU_USERQ_ENABLED
+
 	igt_describe("Test-GPU-reset-by-access-umq-gfx-illegal-reg");
 	igt_subtest_with_dynamic("amdgpu-umq-gfx-illegal-reg-access") {
 		if (userq_arr_cap[AMD_IP_GFX] &&
@@ -189,7 +189,7 @@ igt_main
 					AMDGPU_HW_IP_GFX, &pci, true);
 		}
 	}
-#endif
+
 	igt_fixture {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
index ff22fd8db..fc566c5c4 100644
--- a/tests/amdgpu/amd_security.c
+++ b/tests/amdgpu/amd_security.c
@@ -356,8 +356,6 @@ igt_main
 	amdgpu_secure_bounce(device, fd, &sdma_info, get_ip_block(device,
 			AMDGPU_HW_IP_DMA), is_secure);
 
-#ifdef AMDGPU_USERQ_ENABLED
-
 	igt_describe("amdgpu gfx command submission write linear helper with user queue");
 	igt_subtest("gfx-write-linear-helper-secure-umq")
 	if (userq_arr_cap[AMD_IP_GFX])
@@ -369,7 +367,6 @@ igt_main
 	if (userq_arr_cap[AMD_IP_COMPUTE])
 		amdgpu_command_submission_write_linear_helper(device,
 				get_ip_block(device, AMDGPU_HW_IP_COMPUTE), is_secure, true);
-#endif
 
 	igt_fixture {
 		amdgpu_device_deinitialize(device);
-- 
2.43.0

