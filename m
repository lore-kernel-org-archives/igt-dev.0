Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81B9C36016
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 08:24:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858D210E9B0;
	Fri, 28 Mar 2025 08:24:39 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A2D10E9A8
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 08:24:35 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 52S8OVas1470006; Fri, 28 Mar 2025 13:54:31 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 52S8OVEE1470005;
 Fri, 28 Mar 2025 13:54:31 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: igt-dev@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v3 12/19] tests/amdgpu: Add amdgpu_cp_nops tests for UMQ
Date: Fri, 28 Mar 2025 13:54:09 +0530
Message-Id: <20250328082416.1469810-12-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250328082416.1469810-1-sunil.khatri@amd.com>
References: <20250328082416.1469810-1-sunil.khatri@amd.com>
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

Add new tests to support amdgpu_cs_nops tests for UMQ
submission by modifying the existing cs_nops tests
to support UMQ.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 tests/amdgpu/amd_cs_nop.c | 77 +++++++++++++++++++++++++++++++--------
 1 file changed, 61 insertions(+), 16 deletions(-)

diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c
index 720b276df..96a15a029 100644
--- a/tests/amdgpu/amd_cs_nop.c
+++ b/tests/amdgpu/amd_cs_nop.c
@@ -12,6 +12,7 @@
 #include "lib/amdgpu/amd_PM4.h"
 #include "lib/amdgpu/amd_ip_blocks.h"
 #include "lib/amdgpu/amd_memory.h"
+#include "lib/amdgpu/amd_user_queue.h"
 
 static void amdgpu_cs_sync(amdgpu_context_handle context,
 			   unsigned int ip_type,
@@ -41,7 +42,8 @@ static void nop_cs(amdgpu_device_handle device,
 		   unsigned int ip_type,
 		   unsigned int ring,
 		   unsigned int timeout,
-		   unsigned int flags)
+		   unsigned int flags,
+		   bool user_queue)
 {
 	const int ncpus = flags & FORK ? sysconf(_SC_NPROCESSORS_ONLN) : 1;
 	amdgpu_bo_handle ib_result_handle;
@@ -51,19 +53,36 @@ static void nop_cs(amdgpu_device_handle device,
 	int i, r;
 	amdgpu_bo_list_handle bo_list;
 	amdgpu_va_handle va_handle;
+	struct amdgpu_ring_context *ring_context;
 
-	r = amdgpu_bo_alloc_and_map(device, 4096, 4096,
-				    AMDGPU_GEM_DOMAIN_GTT, 0,
-				    &ib_result_handle, &ib_result_cpu,
-				    &ib_result_mc_address, &va_handle);
+	ring_context = calloc(1, sizeof(*ring_context));
+	igt_assert(ring_context);
+
+	if (user_queue)
+		amdgpu_user_queue_create(device, ring_context, ip_type);
+
+	r = amdgpu_bo_alloc_and_map_sync(device, 4096, 4096,
+					 AMDGPU_GEM_DOMAIN_GTT, 0, AMDGPU_VM_MTYPE_UC,
+					 &ib_result_handle, &ib_result_cpu,
+					 &ib_result_mc_address, &va_handle,
+					 ring_context->timeline_syncobj_handle,
+					 ++ring_context->point, user_queue);
 	igt_assert_eq(r, 0);
 
+	if (user_queue) {
+		r = amdgpu_timeline_syncobj_wait(device, ring_context->timeline_syncobj_handle,
+						 ring_context->point);
+		igt_assert_eq(r, 0);
+	}
+
 	ptr = ib_result_cpu;
 	for (i = 0; i < 16; ++i)
 		ptr[i] = GFX_COMPUTE_NOP;
 
-	r = amdgpu_bo_list_create(device, 1, &ib_result_handle, NULL, &bo_list);
-	igt_assert_eq(r, 0);
+	if (!user_queue) {
+		r = amdgpu_bo_list_create(device, 1, &ib_result_handle, NULL, &bo_list);
+		igt_assert_eq(r, 0);
+	}
 
 	igt_fork(child, ncpus) {
 		struct amdgpu_cs_request ibs_request;
@@ -86,16 +105,25 @@ static void nop_cs(amdgpu_device_handle device,
 		count = 0;
 		igt_nsec_elapsed(&tv);
 		igt_until_timeout(timeout) {
-			r = amdgpu_cs_submit(context, 0, &ibs_request, 1);
-			igt_assert_eq(r, 0);
-			if (flags & SYNC)
-				amdgpu_cs_sync(context, ip_type, ring,
-					       ibs_request.seq_no);
+			if (user_queue) {
+				ring_context->pm4_dw = ib_info.size;
+				amdgpu_user_queue_submit(device, ring_context, ip_type,
+							 ib_info.ib_mc_address);
+				igt_assert_eq(r, 0);
+			} else {
+				r = amdgpu_cs_submit(context, 0, &ibs_request, 1);
+				igt_assert_eq(r, 0);
+				if (flags & SYNC)
+					amdgpu_cs_sync(context, ip_type, ring,
+						       ibs_request.seq_no);
+			}
+
 			count++;
 		}
 		submit_ns = igt_nsec_elapsed(&tv);
+		if (!user_queue)
+			amdgpu_cs_sync(context, ip_type, ring, ibs_request.seq_no);
 
-		amdgpu_cs_sync(context, ip_type, ring, ibs_request.seq_no);
 		sync_ns = igt_nsec_elapsed(&tv);
 
 		igt_info("%s.%d: %'lu cycles, submit %.2fus, sync %.2fus\n",
@@ -104,11 +132,14 @@ static void nop_cs(amdgpu_device_handle device,
 	}
 	igt_waitchildren();
 
-	r = amdgpu_bo_list_destroy(bo_list);
-	igt_assert_eq(r, 0);
+	if (!user_queue) {
+		r = amdgpu_bo_list_destroy(bo_list);
+		igt_assert_eq(r, 0);
+	}
 
 	amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
 				 ib_result_mc_address, 4096);
+	free(ring_context);
 }
 
 igt_main
@@ -156,7 +187,21 @@ igt_main
 			igt_subtest_with_dynamic_f("cs-nops-with-%s-%s0", p->name, e->name) {
 				if (arr_cap[e->ip_type]) {
 					igt_dynamic_f("cs-nop-with-%s-%s0", p->name, e->name)
-					nop_cs(device, context, e->name, e->ip_type, 0, 20, p->flags);
+					nop_cs(device, context, e->name, e->ip_type, 0, 20,
+					       p->flags, 0);
+				}
+			}
+		}
+	}
+
+	for (p = phase; p->name; p++) {
+		for (e = engines; e->name; e++) {
+			igt_describe("Stressful-and-multiple-cs-of-nop-operations-using-multiple-processes-with-the-same-GPU-context-UMQ");
+			igt_subtest_with_dynamic_f("cs-nops-with-%s-%s0-with-UQ-Submission", p->name, e->name) {
+				if (arr_cap[e->ip_type]) {
+					igt_dynamic_f("cs-nop-with-%s-%s0-with-UQ-Submission", p->name, e->name)
+					nop_cs(device, context, e->name, e->ip_type, 0, 20,
+					       p->flags, 1);
 				}
 			}
 		}
-- 
2.43.0

