Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E609C36013
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 08:24:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3073210E9A6;
	Fri, 28 Mar 2025 08:24:39 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60DD110E9A8
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 08:24:37 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 52S8OSJm1469958; Fri, 28 Mar 2025 13:54:28 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 52S8OSL11469957;
 Fri, 28 Mar 2025 13:54:28 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: igt-dev@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v3 06/19] tests/amdgpu: Add user queue support for gfx and
 compute
Date: Fri, 28 Mar 2025 13:54:03 +0530
Message-Id: <20250328082416.1469810-6-sunil.khatri@amd.com>
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

Add support of user queue command submission for
a. amdgpu_command_submission_gfx
b. amdgpu_command_submission_compute

Also add support of user queues in all the helper
functions used by the above functions.

Also since helper functions are same for sdma too
so update the function call to accommodate the changes.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 lib/amdgpu/amd_command_submission.c | 313 +++++++++++++++++++---------
 lib/amdgpu/amd_command_submission.h |   8 +-
 lib/amdgpu/amd_compute.c            | 100 ++++++---
 lib/amdgpu/amd_compute.h            |   2 +-
 tests/amdgpu/amd_basic.c            |  58 ++++--
 tests/amdgpu/amd_security.c         |   4 +-
 6 files changed, 326 insertions(+), 159 deletions(-)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index cd7240058..7550fa8bc 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -5,10 +5,14 @@
  * Copyright 2023 Advanced Micro Devices, Inc.
  */
 
+#include <amdgpu.h>
 #include "lib/amdgpu/amd_memory.h"
 #include "lib/amdgpu/amd_sdma.h"
 #include "lib/amdgpu/amd_PM4.h"
 #include "lib/amdgpu/amd_command_submission.h"
+#include "lib/amdgpu/amd_user_queue.h"
+#include "ioctl_wrappers.h"
+
 
 /*
  *
@@ -28,82 +32,100 @@ int amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_type
 	uint64_t ib_result_mc_address;
 	struct amdgpu_cs_fence fence_status = {0};
 	amdgpu_va_handle va_handle;
+	bool user_queue = ring_context->user_queue;
 
 	amdgpu_bo_handle *all_res = alloca(sizeof(ring_context->resources[0]) * (ring_context->res_cnt + 1));
 
 	if (expect_failure) {
 		/* allocate IB */
-		r = amdgpu_bo_alloc_and_map(device, ring_context->write_length, 4096,
-					    AMDGPU_GEM_DOMAIN_GTT, 0,
-					    &ib_result_handle, &ib_result_cpu,
-					    &ib_result_mc_address, &va_handle);
+		r = amdgpu_bo_alloc_and_map_sync(device, ring_context->write_length, 4096,
+						 AMDGPU_GEM_DOMAIN_GTT, 0, AMDGPU_VM_MTYPE_UC,
+						 &ib_result_handle, &ib_result_cpu,
+						 &ib_result_mc_address, &va_handle,
+						 ring_context->timeline_syncobj_handle,
+						 ++ring_context->point, user_queue);
 	} else {
 		/* prepare CS */
 		igt_assert(ring_context->pm4_dw <= 1024);
 		/* allocate IB */
-		r = amdgpu_bo_alloc_and_map(device, 4096, 4096,
-					    AMDGPU_GEM_DOMAIN_GTT, 0,
-					    &ib_result_handle, &ib_result_cpu,
-					    &ib_result_mc_address, &va_handle);
-
-
+		r = amdgpu_bo_alloc_and_map_sync(device, 4096, 4096,
+						 AMDGPU_GEM_DOMAIN_GTT, 0, AMDGPU_VM_MTYPE_UC,
+						 &ib_result_handle, &ib_result_cpu,
+						 &ib_result_mc_address, &va_handle,
+						 ring_context->timeline_syncobj_handle,
+						 ++ring_context->point, user_queue);
 	}
 	igt_assert_eq(r, 0);
 
+	if (user_queue) {
+		r = amdgpu_timeline_syncobj_wait(device, ring_context->timeline_syncobj_handle,
+						 ring_context->point);
+		igt_assert_eq(r, 0);
+	}
+
 	/* copy PM4 packet to ring from caller */
 	ring_ptr = ib_result_cpu;
 	memcpy(ring_ptr, ring_context->pm4, ring_context->pm4_dw * sizeof(*ring_context->pm4));
 
-	ring_context->ib_info.ib_mc_address = ib_result_mc_address;
-	ring_context->ib_info.size = ring_context->pm4_dw;
-	if (ring_context->secure)
-		ring_context->ib_info.flags |= AMDGPU_IB_FLAGS_SECURE;
-
-	ring_context->ibs_request.ip_type = ip_type;
-	ring_context->ibs_request.ring = ring_context->ring_id;
-	ring_context->ibs_request.number_of_ibs = 1;
-	ring_context->ibs_request.ibs = &ring_context->ib_info;
-	ring_context->ibs_request.fence_info.handle = NULL;
-
-	memcpy(all_res, ring_context->resources, sizeof(ring_context->resources[0]) * ring_context->res_cnt);
-	all_res[ring_context->res_cnt] = ib_result_handle;
-
-	r = amdgpu_bo_list_create(device, ring_context->res_cnt+1, all_res,
-				  NULL, &ring_context->ibs_request.resources);
-	igt_assert_eq(r, 0);
-
-	/* submit CS */
-	r = amdgpu_cs_submit(ring_context->context_handle, 0, &ring_context->ibs_request, 1);
-	ring_context->err_codes.err_code_cs_submit = r;
-	if (expect_failure)
-		igt_info("amdgpu_cs_submit %d PID %d\n", r, getpid());
+	if (user_queue)
+		amdgpu_user_queue_submit(device, ring_context, ip_type, ib_result_mc_address);
 	else {
-		if (r != -ECANCELED && r != -ENODATA && r != -EHWPOISON) /* we allow ECANCELED, ENODATA or -EHWPOISON for good jobs temporally */
-			igt_assert_eq(r, 0);
-	}
-
-
-	r = amdgpu_bo_list_destroy(ring_context->ibs_request.resources);
-	igt_assert_eq(r, 0);
+		ring_context->ib_info.ib_mc_address = ib_result_mc_address;
+		ring_context->ib_info.size = ring_context->pm4_dw;
+		if (ring_context->secure)
+			ring_context->ib_info.flags |= AMDGPU_IB_FLAGS_SECURE;
+
+		ring_context->ibs_request.ip_type = ip_type;
+		ring_context->ibs_request.ring = ring_context->ring_id;
+		ring_context->ibs_request.number_of_ibs = 1;
+		ring_context->ibs_request.ibs = &ring_context->ib_info;
+		ring_context->ibs_request.fence_info.handle = NULL;
+
+		memcpy(all_res, ring_context->resources,
+		       sizeof(ring_context->resources[0]) * ring_context->res_cnt);
+
+		all_res[ring_context->res_cnt] = ib_result_handle;
+
+		r = amdgpu_bo_list_create(device, ring_context->res_cnt + 1, all_res,
+					  NULL, &ring_context->ibs_request.resources);
+		igt_assert_eq(r, 0);
+
+		/* submit CS */
+		r = amdgpu_cs_submit(ring_context->context_handle, 0,
+				     &ring_context->ibs_request, 1);
+
+		ring_context->err_codes.err_code_cs_submit = r;
+		if (expect_failure)
+			igt_info("amdgpu_cs_submit %d PID %d\n", r, getpid());
+		else {
+			/* we allow ECANCELED, ENODATA or -EHWPOISON for good jobs temporally */
+			if (r != -ECANCELED && r != -ENODATA && r != -EHWPOISON)
+				igt_assert_eq(r, 0);
+		}
 
-	fence_status.ip_type = ip_type;
-	fence_status.ip_instance = 0;
-	fence_status.ring = ring_context->ibs_request.ring;
-	fence_status.context = ring_context->context_handle;
-	fence_status.fence = ring_context->ibs_request.seq_no;
-
-	/* wait for IB accomplished */
-	r = amdgpu_cs_query_fence_status(&fence_status,
-					 AMDGPU_TIMEOUT_INFINITE,
-					 0, &expired);
-	ring_context->err_codes.err_code_wait_for_fence = r;
-	if (expect_failure) {
-		igt_info("EXPECT FAILURE amdgpu_cs_query_fence_status %d expired %d PID %d\n", r,  expired, getpid());
-	} else {
-		if (r != -ECANCELED && r != -ENODATA) /* we allow ECANCELED or ENODATA for good jobs temporally */
-			igt_assert_eq(r, 0);
+		r = amdgpu_bo_list_destroy(ring_context->ibs_request.resources);
+		igt_assert_eq(r, 0);
+
+		fence_status.ip_type = ip_type;
+		fence_status.ip_instance = 0;
+		fence_status.ring = ring_context->ibs_request.ring;
+		fence_status.context = ring_context->context_handle;
+		fence_status.fence = ring_context->ibs_request.seq_no;
+
+		/* wait for IB accomplished */
+		r = amdgpu_cs_query_fence_status(&fence_status,
+						 AMDGPU_TIMEOUT_INFINITE,
+						 0, &expired);
+		ring_context->err_codes.err_code_wait_for_fence = r;
+		if (expect_failure) {
+			igt_info("EXPECT FAILURE amdgpu_cs_query_fence_status%d"
+				 "expired %d PID %d\n", r, expired, getpid());
+		} else {
+			/* we allow ECANCELED or ENODATA for good jobs temporally */
+			if (r != -ECANCELED && r != -ENODATA)
+				igt_assert_eq(r, 0);
+		}
 	}
-
 	amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
 				 ib_result_mc_address, 4096);
 	return r;
@@ -111,10 +133,9 @@ int amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_type
 
 void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
 						   const struct amdgpu_ip_block_version *ip_block,
-						   bool secure)
+						   bool secure, bool user_queue)
 
 {
-
 	const int sdma_write_length = 128;
 	const int pm4_dw = 256;
 
@@ -131,6 +152,7 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
 	ring_context->secure = secure;
 	ring_context->pm4_size = pm4_dw;
 	ring_context->res_cnt = 1;
+	ring_context->user_queue = user_queue;
 	igt_assert(ring_context->pm4);
 
 	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &ring_context->hw_ip_info);
@@ -139,30 +161,51 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
 	for (i = 0; secure && (i < 2); i++)
 		gtt_flags[i] |= AMDGPU_GEM_CREATE_ENCRYPTED;
 
-	r = amdgpu_cs_ctx_create(device, &ring_context->context_handle);
+	if (user_queue) {
+		amdgpu_user_queue_create(device, ring_context, ip_block->type);
+	} else {
+		r = amdgpu_cs_ctx_create(device, &ring_context->context_handle);
+		igt_assert_eq(r, 0);
+	}
+
 
-	igt_assert_eq(r, 0);
 
+/* Dont need but check with vitaly if for KMS also we need ring id or not */
 	for (ring_id = 0; (1 << ring_id) & ring_context->hw_ip_info.available_rings; ring_id++) {
 		loop = 0;
 		ring_context->ring_id = ring_id;
 		while (loop < 2) {
 			/* allocate UC bo for sDMA use */
-			r = amdgpu_bo_alloc_and_map(device,
-						    ring_context->write_length * sizeof(uint32_t),
-						    4096, AMDGPU_GEM_DOMAIN_GTT,
-						    gtt_flags[loop], &ring_context->bo,
-						    (void **)&ring_context->bo_cpu,
-						    &ring_context->bo_mc,
-						    &ring_context->va_handle);
+			r = amdgpu_bo_alloc_and_map_sync(device,
+							 ring_context->write_length *
+							 sizeof(uint32_t),
+							 4096, AMDGPU_GEM_DOMAIN_GTT,
+							 gtt_flags[loop],
+							 AMDGPU_VM_MTYPE_UC,
+							 &ring_context->bo,
+							 (void **)&ring_context->bo_cpu,
+							 &ring_context->bo_mc,
+							 &ring_context->va_handle,
+							 ring_context->timeline_syncobj_handle,
+							 ++ring_context->point, user_queue);
+
 			igt_assert_eq(r, 0);
 
+			if (user_queue) {
+				r = amdgpu_timeline_syncobj_wait(device,
+					ring_context->timeline_syncobj_handle,
+					ring_context->point);
+				igt_assert_eq(r, 0);
+			}
+
 			/* clear bo */
-			memset((void *)ring_context->bo_cpu, 0, ring_context->write_length * sizeof(uint32_t));
+			memset((void *)ring_context->bo_cpu, 0,
+			       ring_context->write_length * sizeof(uint32_t));
 
 			ring_context->resources[0] = ring_context->bo;
 
-			ip_block->funcs->write_linear(ip_block->funcs, ring_context, &ring_context->pm4_dw);
+			ip_block->funcs->write_linear(ip_block->funcs, ring_context,
+						      &ring_context->pm4_dw);
 
 			ring_context->ring_id = ring_id;
 
@@ -200,9 +243,14 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
 	}
 	/* clean resources */
 	free(ring_context->pm4);
-	/* end of test */
-	r = amdgpu_cs_ctx_free(ring_context->context_handle);
-	igt_assert_eq(r, 0);
+
+	if (user_queue) {
+		amdgpu_user_queue_destroy(device, ring_context, ip_block->type);
+	} else {
+		r = amdgpu_cs_ctx_free(ring_context->context_handle);
+		igt_assert_eq(r, 0);
+	}
+
 	free(ring_context);
 }
 
@@ -211,9 +259,11 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
  *
  * @param device
  * @param ip_type
+ * @param user_queue
  */
 void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
-						 const struct amdgpu_ip_block_version *ip_block)
+						 const struct amdgpu_ip_block_version *ip_block,
+						 bool user_queue)
 {
 	const int sdma_write_length = 1024 * 1024;
 	const int pm4_dw = 256;
@@ -229,25 +279,43 @@ void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
 	ring_context->secure = false;
 	ring_context->pm4_size = pm4_dw;
 	ring_context->res_cnt = 1;
+	ring_context->user_queue = user_queue;
 	igt_assert(ring_context->pm4);
 	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &ring_context->hw_ip_info);
 	igt_assert_eq(r, 0);
 
-	r = amdgpu_cs_ctx_create(device, &ring_context->context_handle);
-	igt_assert_eq(r, 0);
+	if (user_queue) {
+		amdgpu_user_queue_create(device, ring_context, ip_block->type);
+	} else {
+		r = amdgpu_cs_ctx_create(device, &ring_context->context_handle);
+		igt_assert_eq(r, 0);
+	}
+
 	for (ring_id = 0; (1 << ring_id) & ring_context->hw_ip_info.available_rings; ring_id++) {
 		/* prepare resource */
 		loop = 0;
 		ring_context->ring_id = ring_id;
 		while (loop < 2) {
 			/* allocate UC bo for sDMA use */
-			r = amdgpu_bo_alloc_and_map(device,
-					    ring_context->write_length, 4096,
-					    AMDGPU_GEM_DOMAIN_GTT,
-					    gtt_flags[loop], &ring_context->bo, (void **)&ring_context->bo_cpu,
-					    &ring_context->bo_mc, &ring_context->va_handle);
+			r = amdgpu_bo_alloc_and_map_sync(device, ring_context->write_length,
+							 4096, AMDGPU_GEM_DOMAIN_GTT,
+							 gtt_flags[loop],
+							 AMDGPU_VM_MTYPE_UC,
+							 &ring_context->bo,
+							 (void **)&ring_context->bo_cpu,
+							 &ring_context->bo_mc,
+							 &ring_context->va_handle,
+							 ring_context->timeline_syncobj_handle,
+							 ++ring_context->point, user_queue);
 			igt_assert_eq(r, 0);
 
+			if (user_queue) {
+				r = amdgpu_timeline_syncobj_wait(device,
+					ring_context->timeline_syncobj_handle,
+					ring_context->point);
+				igt_assert_eq(r, 0);
+			}
+
 			/* clear bo */
 			memset((void *)ring_context->bo_cpu, 0, ring_context->write_length);
 
@@ -270,9 +338,13 @@ void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
 	/* clean resources */
 	free(ring_context->pm4);
 
-	/* end of test */
-	r = amdgpu_cs_ctx_free(ring_context->context_handle);
-	igt_assert_eq(r, 0);
+	if (user_queue) {
+		amdgpu_user_queue_destroy(device, ring_context, ip_block->type);
+	} else {
+		r = amdgpu_cs_ctx_free(ring_context->context_handle);
+		igt_assert_eq(r, 0);
+	}
+
 	free(ring_context);
 }
 
@@ -280,9 +352,11 @@ void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
  *
  * @param device
  * @param ip_type
+ * @param user_queue
  */
 void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
-						  const struct amdgpu_ip_block_version *ip_block)
+						  const struct amdgpu_ip_block_version *ip_block,
+						  bool user_queue)
 {
 	const int sdma_write_length = 1024;
 	const int pm4_dw = 256;
@@ -299,13 +373,18 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
 	ring_context->secure = false;
 	ring_context->pm4_size = pm4_dw;
 	ring_context->res_cnt = 2;
+	ring_context->user_queue = user_queue;
 	igt_assert(ring_context->pm4);
 	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &ring_context->hw_ip_info);
 	igt_assert_eq(r, 0);
 
 
-	r = amdgpu_cs_ctx_create(device, &ring_context->context_handle);
-	igt_assert_eq(r, 0);
+	if (user_queue) {
+		amdgpu_user_queue_create(device, ring_context, ip_block->type);
+	} else {
+		r = amdgpu_cs_ctx_create(device, &ring_context->context_handle);
+		igt_assert_eq(r, 0);
+	}
 
 	for (ring_id = 0; (1 << ring_id) & ring_context->hw_ip_info.available_rings; ring_id++) {
 		loop1 = loop2 = 0;
@@ -313,27 +392,50 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
 	/* run 9 circle to test all mapping combination */
 		while (loop1 < 2) {
 			while (loop2 < 2) {
-			/* allocate UC bo1for sDMA use */
-				r = amdgpu_bo_alloc_and_map(device,
-						    ring_context->write_length, 4096,
-						    AMDGPU_GEM_DOMAIN_GTT,
-						    gtt_flags[loop1], &ring_context->bo,
-						    (void **)&ring_context->bo_cpu, &ring_context->bo_mc,
-						    &ring_context->va_handle);
+				/* allocate UC bo1for sDMA use */
+				r = amdgpu_bo_alloc_and_map_sync(device, ring_context->write_length,
+							4096, AMDGPU_GEM_DOMAIN_GTT,
+							gtt_flags[loop1],
+							AMDGPU_VM_MTYPE_UC,
+							&ring_context->bo,
+							(void **)&ring_context->bo_cpu,
+							&ring_context->bo_mc,
+							&ring_context->va_handle,
+							ring_context->timeline_syncobj_handle,
+							++ring_context->point, user_queue);
 				igt_assert_eq(r, 0);
 
+				if (user_queue) {
+					r = amdgpu_timeline_syncobj_wait(device,
+						ring_context->timeline_syncobj_handle,
+						ring_context->point);
+					igt_assert_eq(r, 0);
+				}
+
 				/* set bo_cpu */
 				memset((void *)ring_context->bo_cpu, ip_block->funcs->pattern, ring_context->write_length);
 
 				/* allocate UC bo2 for sDMA use */
-				r = amdgpu_bo_alloc_and_map(device,
-						    ring_context->write_length, 4096,
-						    AMDGPU_GEM_DOMAIN_GTT,
-						    gtt_flags[loop2], &ring_context->bo2,
-						    (void **)&ring_context->bo2_cpu, &ring_context->bo_mc2,
-						    &ring_context->va_handle2);
+				r = amdgpu_bo_alloc_and_map_sync(device,
+							ring_context->write_length,
+							4096, AMDGPU_GEM_DOMAIN_GTT,
+							gtt_flags[loop2],
+							AMDGPU_VM_MTYPE_UC,
+							&ring_context->bo2,
+							(void **)&ring_context->bo2_cpu,
+							&ring_context->bo_mc2,
+							&ring_context->va_handle2,
+							ring_context->timeline_syncobj_handle,
+							++ring_context->point, user_queue);
 				igt_assert_eq(r, 0);
 
+				if (user_queue) {
+					r = amdgpu_timeline_syncobj_wait(device,
+						ring_context->timeline_syncobj_handle,
+						ring_context->point);
+					igt_assert_eq(r, 0);
+				}
+
 				/* clear bo2_cpu */
 				memset((void *)ring_context->bo2_cpu, 0, ring_context->write_length);
 
@@ -357,11 +459,16 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
 			loop1++;
 		}
 	}
+
 	/* clean resources */
 	free(ring_context->pm4);
 
-	/* end of test */
-	r = amdgpu_cs_ctx_free(ring_context->context_handle);
-	igt_assert_eq(r, 0);
+	if (user_queue) {
+		amdgpu_user_queue_destroy(device, ring_context, ip_block->type);
+	} else {
+		r = amdgpu_cs_ctx_free(ring_context->context_handle);
+		igt_assert_eq(r, 0);
+	}
+
 	free(ring_context);
 }
diff --git a/lib/amdgpu/amd_command_submission.h b/lib/amdgpu/amd_command_submission.h
index e3139a402..d0139b364 100644
--- a/lib/amdgpu/amd_command_submission.h
+++ b/lib/amdgpu/amd_command_submission.h
@@ -34,11 +34,13 @@ int amdgpu_test_exec_cs_helper(amdgpu_device_handle device,
 
 void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
 						   const struct amdgpu_ip_block_version *ip_block,
-						   bool secure);
+						   bool secure, bool user_queue);
 
 void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
-						 const struct amdgpu_ip_block_version *ip_block);
+						 const struct amdgpu_ip_block_version *ip_block,
+						 bool user_queue);
 
 void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
-						 const struct amdgpu_ip_block_version *ip_block);
+						 const struct amdgpu_ip_block_version *ip_block,
+						 bool user_queue);
 #endif
diff --git a/lib/amdgpu/amd_compute.c b/lib/amdgpu/amd_compute.c
index 6e61f1820..5d7040d80 100644
--- a/lib/amdgpu/amd_compute.c
+++ b/lib/amdgpu/amd_compute.c
@@ -25,12 +25,14 @@
 #include "amd_PM4.h"
 #include "amd_memory.h"
 #include "amd_compute.h"
+#include "amd_user_queue.h"
 
 /**
  *
  * @param device
+ * @param user_queue
  */
-void amdgpu_command_submission_compute_nop(amdgpu_device_handle device)
+void amdgpu_command_submission_compute_nop(amdgpu_device_handle device, bool user_queue)
 {
 	amdgpu_context_handle context_handle;
 	amdgpu_bo_handle ib_result_handle;
@@ -46,19 +48,38 @@ void amdgpu_command_submission_compute_nop(amdgpu_device_handle device)
 	amdgpu_bo_list_handle bo_list;
 	amdgpu_va_handle va_handle;
 
+	struct amdgpu_ring_context *ring_context;
+
+	ring_context = calloc(1, sizeof(*ring_context));
+	igt_assert(ring_context);
+
 	r = amdgpu_query_hw_ip_info(device, AMDGPU_HW_IP_COMPUTE, 0, &info);
 	igt_assert_eq(r, 0);
 
-	r = amdgpu_cs_ctx_create(device, &context_handle);
-	igt_assert_eq(r, 0);
+	if (user_queue) {
+		amdgpu_user_queue_create(device, ring_context, AMD_IP_COMPUTE);
+	} else {
+		r = amdgpu_cs_ctx_create(device, &context_handle);
+		igt_assert_eq(r, 0);
+	}
 
 	for (instance = 0; info.available_rings & (1 << instance); instance++) {
-		r = amdgpu_bo_alloc_and_map(device, 4096, 4096,
-					    AMDGPU_GEM_DOMAIN_GTT, 0,
-					    &ib_result_handle, &ib_result_cpu,
-					    &ib_result_mc_address, &va_handle);
+		r = amdgpu_bo_alloc_and_map_sync(device, 4096, 4096,
+						 AMDGPU_GEM_DOMAIN_GTT, 0,
+						 AMDGPU_VM_MTYPE_UC,
+						 &ib_result_handle, (void **)&ib_result_cpu,
+						 &ib_result_mc_address, &va_handle,
+						 ring_context->timeline_syncobj_handle,
+						 ++ring_context->point, user_queue);
 		igt_assert_eq(r, 0);
 
+		if (user_queue) {
+			r = amdgpu_timeline_syncobj_wait(device,
+							 ring_context->timeline_syncobj_handle,
+							 ring_context->point);
+			igt_assert_eq(r, 0);
+		}
+
 		r = amdgpu_get_bo_list(device, ib_result_handle, NULL,
 				       &bo_list);
 		igt_assert_eq(r, 0);
@@ -66,42 +87,53 @@ void amdgpu_command_submission_compute_nop(amdgpu_device_handle device)
 		ptr = ib_result_cpu;
 		memset(ptr, 0, 16);
 		ptr[0] = PACKET3(PACKET3_NOP, 14);
+		ring_context->pm4_dw = 16;
 
-		memset(&ib_info, 0, sizeof(struct amdgpu_cs_ib_info));
-		ib_info.ib_mc_address = ib_result_mc_address;
-		ib_info.size = 16;
-
-		memset(&ibs_request, 0, sizeof(struct amdgpu_cs_request));
-		ibs_request.ip_type = AMDGPU_HW_IP_COMPUTE;
-		ibs_request.ring = instance;
-		ibs_request.number_of_ibs = 1;
-		ibs_request.ibs = &ib_info;
-		ibs_request.resources = bo_list;
-		ibs_request.fence_info.handle = NULL;
+		if (user_queue) {
+			amdgpu_user_queue_submit(device, ring_context, AMD_IP_COMPUTE,
+						 ib_result_mc_address);
+		} else {
+			memset(&ib_info, 0, sizeof(struct amdgpu_cs_ib_info));
+			ib_info.ib_mc_address = ib_result_mc_address;
+			ib_info.size = 16;
 
-		memset(&fence_status, 0, sizeof(struct amdgpu_cs_fence));
-		r = amdgpu_cs_submit(context_handle, 0,&ibs_request, 1);
-		igt_assert_eq(r, 0);
+			memset(&ibs_request, 0, sizeof(struct amdgpu_cs_request));
+			ibs_request.ip_type = AMDGPU_HW_IP_COMPUTE;
+			ibs_request.ring = instance;
+			ibs_request.number_of_ibs = 1;
+			ibs_request.ibs = &ib_info;
+			ibs_request.resources = bo_list;
+			ibs_request.fence_info.handle = NULL;
 
-		fence_status.context = context_handle;
-		fence_status.ip_type = AMDGPU_HW_IP_COMPUTE;
-		fence_status.ip_instance = 0;
-		fence_status.ring = instance;
-		fence_status.fence = ibs_request.seq_no;
+			memset(&fence_status, 0, sizeof(struct amdgpu_cs_fence));
+			r = amdgpu_cs_submit(context_handle, 0, &ibs_request, 1);
+			igt_assert_eq(r, 0);
 
-		r = amdgpu_cs_query_fence_status(&fence_status,
-						 AMDGPU_TIMEOUT_INFINITE,
-						 0, &expired);
-		igt_assert_eq(r, 0);
+			fence_status.context = context_handle;
+			fence_status.ip_type = AMDGPU_HW_IP_COMPUTE;
+			fence_status.ip_instance = 0;
+			fence_status.ring = instance;
+			fence_status.fence = ibs_request.seq_no;
 
-		r = amdgpu_bo_list_destroy(bo_list);
-		igt_assert_eq(r, 0);
+			r = amdgpu_cs_query_fence_status(&fence_status,
+							 AMDGPU_TIMEOUT_INFINITE,
+							 0, &expired);
+			igt_assert_eq(r, 0);
 
+			r = amdgpu_bo_list_destroy(bo_list);
+			igt_assert_eq(r, 0);
+		}
 		amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
 					 ib_result_mc_address, 4096);
 	}
 
-	r = amdgpu_cs_ctx_free(context_handle);
-	igt_assert_eq(r, 0);
+	if (user_queue) {
+		amdgpu_user_queue_destroy(device, ring_context, AMD_IP_COMPUTE);
+	} else {
+		r = amdgpu_cs_ctx_free(context_handle);
+		igt_assert_eq(r, 0);
+	}
+
+	free(ring_context);
 }
 
diff --git a/lib/amdgpu/amd_compute.h b/lib/amdgpu/amd_compute.h
index f27be5f17..41ed225b8 100644
--- a/lib/amdgpu/amd_compute.h
+++ b/lib/amdgpu/amd_compute.h
@@ -26,6 +26,6 @@
 #define AMD_COMPUTE_H
 
 
-void amdgpu_command_submission_compute_nop(amdgpu_device_handle device);
+void amdgpu_command_submission_compute_nop(amdgpu_device_handle device, bool user_queue);
 
 #endif
diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 8819b9cd4..b05633b8e 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -13,6 +13,7 @@
 #include "lib/amdgpu/amd_gfx.h"
 #include "lib/amdgpu/amd_shaders.h"
 #include "lib/amdgpu/amd_dispatch.h"
+#include "lib/amdgpu/amd_user_queue.h"
 
 #define BUFFER_SIZE (8 * 1024)
 
@@ -67,14 +68,25 @@ static void amdgpu_memory_alloc(amdgpu_device_handle device)
  * AMDGPU_HW_IP_GFX
  * @param device
  */
-static void amdgpu_command_submission_gfx(amdgpu_device_handle device, bool ce_avails)
+static void amdgpu_command_submission_gfx(amdgpu_device_handle device,
+					  bool ce_avails,
+					  bool user_queue)
 {
+
 	/* write data using the CP */
-	amdgpu_command_submission_write_linear_helper(device, get_ip_block(device, AMDGPU_HW_IP_GFX), false);
+	amdgpu_command_submission_write_linear_helper(device,
+						      get_ip_block(device, AMDGPU_HW_IP_GFX),
+						      false, user_queue);
+
 	/* const fill using the CP */
-	amdgpu_command_submission_const_fill_helper(device, get_ip_block(device, AMDGPU_HW_IP_GFX));
+	amdgpu_command_submission_const_fill_helper(device,
+						    get_ip_block(device, AMDGPU_HW_IP_GFX),
+						    user_queue);
+
 	/* copy data using the CP */
-	amdgpu_command_submission_copy_linear_helper(device, get_ip_block(device, AMDGPU_HW_IP_GFX));
+	amdgpu_command_submission_copy_linear_helper(device,
+						     get_ip_block(device, AMDGPU_HW_IP_GFX),
+						     user_queue);
 	if (ce_avails) {
 		/* separate IB buffers for multi-IB submission */
 		amdgpu_command_submission_gfx_separate_ibs(device);
@@ -89,27 +101,41 @@ static void amdgpu_command_submission_gfx(amdgpu_device_handle device, bool ce_a
  * AMDGPU_HW_IP_COMPUTE
  * @param device
  */
-static void amdgpu_command_submission_compute(amdgpu_device_handle device)
+static void amdgpu_command_submission_compute(amdgpu_device_handle device, bool user_queue)
 {
 	/* write data using the CP */
-	amdgpu_command_submission_write_linear_helper(device, get_ip_block(device, AMDGPU_HW_IP_COMPUTE), false);
+	amdgpu_command_submission_write_linear_helper(device,
+						      get_ip_block(device, AMDGPU_HW_IP_COMPUTE),
+						      false, user_queue);
 	/* const fill using the CP */
-	amdgpu_command_submission_const_fill_helper(device, get_ip_block(device, AMDGPU_HW_IP_COMPUTE));
+	amdgpu_command_submission_const_fill_helper(device,
+						    get_ip_block(device, AMDGPU_HW_IP_COMPUTE),
+						    user_queue);
 	/* copy data using the CP */
-	amdgpu_command_submission_copy_linear_helper(device, get_ip_block(device, AMDGPU_HW_IP_COMPUTE));
+	amdgpu_command_submission_copy_linear_helper(device,
+						     get_ip_block(device, AMDGPU_HW_IP_COMPUTE),
+						     user_queue);
 	/* nop test */
-	amdgpu_command_submission_compute_nop(device);
+	amdgpu_command_submission_compute_nop(device, user_queue);
 }
 
 /**
  * AMDGPU_HW_IP_DMA
  * @param device
  */
-static void amdgpu_command_submission_sdma(amdgpu_device_handle device)
+static void amdgpu_command_submission_sdma(amdgpu_device_handle device, bool user_queue)
 {
-	amdgpu_command_submission_write_linear_helper(device,  get_ip_block(device, AMDGPU_HW_IP_DMA), false);
-	amdgpu_command_submission_const_fill_helper(device,  get_ip_block(device, AMDGPU_HW_IP_DMA));
-	amdgpu_command_submission_copy_linear_helper(device,  get_ip_block(device, AMDGPU_HW_IP_DMA));
+	amdgpu_command_submission_write_linear_helper(device,
+						      get_ip_block(device, AMDGPU_HW_IP_DMA),
+						      false, user_queue);
+
+	amdgpu_command_submission_const_fill_helper(device,
+						    get_ip_block(device, AMDGPU_HW_IP_DMA),
+						    user_queue);
+
+	amdgpu_command_submission_copy_linear_helper(device,
+						     get_ip_block(device, AMDGPU_HW_IP_DMA),
+						     user_queue);
 }
 
 /**
@@ -667,7 +693,7 @@ igt_main
 	igt_subtest_with_dynamic("cs-gfx-with-IP-GFX") {
 		if (arr_cap[AMD_IP_GFX]) {
 			igt_dynamic_f("cs-gfx")
-			amdgpu_command_submission_gfx(device, info.hw_ip_version_major < 11);
+			amdgpu_command_submission_gfx(device, info.hw_ip_version_major < 11, false);
 		}
 	}
 
@@ -675,7 +701,7 @@ igt_main
 	igt_subtest_with_dynamic("cs-compute-with-IP-COMPUTE") {
 		if (arr_cap[AMD_IP_COMPUTE]) {
 			igt_dynamic_f("cs-compute")
-			amdgpu_command_submission_compute(device);
+			amdgpu_command_submission_compute(device, false);
 		}
 	}
 
@@ -693,7 +719,7 @@ igt_main
 	igt_subtest_with_dynamic("cs-sdma-with-IP-DMA") {
 		if (arr_cap[AMD_IP_DMA]) {
 			igt_dynamic_f("cs-sdma")
-			amdgpu_command_submission_sdma(device);
+			amdgpu_command_submission_sdma(device, false);
 		}
 	}
 
diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
index 024cadc05..19baaaea0 100644
--- a/tests/amdgpu/amd_security.c
+++ b/tests/amdgpu/amd_security.c
@@ -341,12 +341,12 @@ igt_main
 	igt_describe("amdgpu sdma command submission write linear helper");
 	igt_subtest("sdma-write-linear-helper-secure")
 	amdgpu_command_submission_write_linear_helper(device,
-			get_ip_block(device, AMDGPU_HW_IP_DMA), is_secure);
+			get_ip_block(device, AMDGPU_HW_IP_DMA), is_secure, false);
 
 	igt_describe("amdgpu gfx command submission write linear helper");
 	igt_subtest("gfx-write-linear-helper-secure")
 	 amdgpu_command_submission_write_linear_helper(device,
-			get_ip_block(device, AMDGPU_HW_IP_GFX), is_secure);
+			get_ip_block(device, AMDGPU_HW_IP_GFX), is_secure, false);
 
 	/* dynamic test based on sdma_info.available rings */
 	igt_describe("amdgpu secure bounce");
-- 
2.43.0

