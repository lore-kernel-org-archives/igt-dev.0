Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F7DC28B20
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 08:24:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2112A10E99B;
	Fri, 28 Mar 2025 08:24:47 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7214210E2F3
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 08:24:33 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 52S8OTI91469974; Fri, 28 Mar 2025 13:54:29 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 52S8OTps1469973;
 Fri, 28 Mar 2025 13:54:29 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: igt-dev@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v3 08/19] tests/amdgpu: Add amdgpu_sync_dependency_test with
 UMQ
Date: Fri, 28 Mar 2025 13:54:05 +0530
Message-Id: <20250328082416.1469810-8-sunil.khatri@amd.com>
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

Add UMQ support in amdgpu_sync_dependency_test and also
add a new test case which will run this test for UMQ
submission.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 tests/amdgpu/amd_basic.c | 95 ++++++++++++++++++++++++++++++----------
 1 file changed, 72 insertions(+), 23 deletions(-)

diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 2b339c74b..643a147f5 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -475,7 +475,7 @@ amdgpu_bo_eviction_test(amdgpu_device_handle device_handle)
 }
 
 static void
-amdgpu_sync_dependency_test(amdgpu_device_handle device_handle)
+amdgpu_sync_dependency_test(amdgpu_device_handle device_handle, bool user_queue)
 {
 	const unsigned const_size = 8192;
 	const unsigned const_alignment = 4096;
@@ -498,25 +498,44 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle)
 
 	uint32_t size_bytes, code_offset, data_offset;
 	const uint32_t *shader;
+	struct amdgpu_ring_context *ring_context;
 
 	struct amdgpu_cmd_base *base = get_cmd_base();
 	const struct amdgpu_ip_block_version *ip_block = get_ip_block(device_handle, AMD_IP_GFX);
 
-	r = amdgpu_cs_ctx_create(device_handle, &context_handle[0]);
-	igt_assert_eq(r, 0);
-	r = amdgpu_cs_ctx_create(device_handle, &context_handle[1]);
-	igt_assert_eq(r, 0);
+	ring_context = calloc(1, sizeof(*ring_context));
+	igt_assert(ring_context);
 
-	r = amdgpu_bo_alloc_and_map(device_handle, const_size, const_alignment,
-			AMDGPU_GEM_DOMAIN_GTT, 0,
-			&ib_result_handle, &ib_result_cpu,
-			&ib_result_mc_address, &va_handle);
+	if (user_queue) {
+		amdgpu_user_queue_create(device_handle, ring_context, ip_block->type);
+	} else {
+		r = amdgpu_cs_ctx_create(device_handle, &context_handle[0]);
+		igt_assert_eq(r, 0);
+
+		r = amdgpu_cs_ctx_create(device_handle, &context_handle[1]);
+		igt_assert_eq(r, 0);
+	}
+
+	r = amdgpu_bo_alloc_and_map_sync(device_handle, const_size,
+					 const_alignment, AMDGPU_GEM_DOMAIN_GTT, 0,
+					 AMDGPU_VM_MTYPE_UC,
+					 &ib_result_handle, &ib_result_cpu,
+					 &ib_result_mc_address, &va_handle,
+					 ring_context->timeline_syncobj_handle,
+					 ++ring_context->point, user_queue);
 
 	igt_assert_eq(r, 0);
 
-	r = amdgpu_get_bo_list(device_handle, ib_result_handle, NULL,
+	if (user_queue) {
+		r = amdgpu_timeline_syncobj_wait(device_handle,
+						 ring_context->timeline_syncobj_handle,
+						 ring_context->point);
+		igt_assert_eq(r, 0);
+	} else {
+		r = amdgpu_get_bo_list(device_handle, ib_result_handle, NULL,
 			       &bo_list);
-	igt_assert_eq(r, 0);
+		igt_assert_eq(r, 0);
+	}
 
 	shader = get_shader_bin(&size_bytes, &code_offset, &data_offset);
 
@@ -585,7 +604,14 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle)
 	ibs_request.resources = bo_list;
 	ibs_request.fence_info.handle = NULL;
 
-	r = amdgpu_cs_submit(context_handle[1], 0, &ibs_request, 1);
+	if (user_queue) {
+		ring_context->pm4_dw = ib_info.size;
+		amdgpu_user_queue_submit(device_handle, ring_context, ip_block->type,
+					 ib_result_mc_address);
+	} else {
+		r = amdgpu_cs_submit(context_handle[1], 0, &ibs_request, 1);
+	}
+
 	igt_assert_eq(r, 0);
 	seq_no = ibs_request.seq_no;
 
@@ -618,8 +644,14 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle)
 	ibs_request.dependencies[0].ring = 0;
 	ibs_request.dependencies[0].fence = seq_no;
 
-	r = amdgpu_cs_submit(context_handle[0], 0, &ibs_request, 1);
-	igt_assert_eq(r, 0);
+	if (user_queue) {
+		ring_context->pm4_dw = ib_info.size;
+		amdgpu_user_queue_submit(device_handle, ring_context, ip_block->type,
+					ib_info.ib_mc_address);
+	} else {
+		r = amdgpu_cs_submit(context_handle[0], 0, &ibs_request, 1);
+		igt_assert_eq(r, 0);
+	}
 
 	memset(&fence_status, 0, sizeof(struct amdgpu_cs_fence));
 	fence_status.context = context_handle[0];
@@ -628,24 +660,33 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle)
 	fence_status.ring = 0;
 	fence_status.fence = ibs_request.seq_no;
 
-	r = amdgpu_cs_query_fence_status(&fence_status,
+	if (!user_queue) {
+		r = amdgpu_cs_query_fence_status(&fence_status,
 		       AMDGPU_TIMEOUT_INFINITE, 0, &expired);
-	igt_assert_eq(r, 0);
+		igt_assert_eq(r, 0);
+	}
 
 	/* Expect the second command to wait for shader to complete */
 	igt_assert_eq(base->buf[data_offset], 99);
 
-	r = amdgpu_bo_list_destroy(bo_list);
-	igt_assert_eq(r, 0);
+	if (!user_queue) {
+		r = amdgpu_bo_list_destroy(bo_list);
+		igt_assert_eq(r, 0);
+	}
 
-	 amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
-				     ib_result_mc_address, const_alignment);
+	amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
+				 ib_result_mc_address, const_alignment);
 
-	amdgpu_cs_ctx_free(context_handle[0]);
-	amdgpu_cs_ctx_free(context_handle[1]);
+	if (user_queue) {
+		amdgpu_user_queue_destroy(device_handle, ring_context, ip_block->type);
+	} else {
+		amdgpu_cs_ctx_free(context_handle[0]);
+		amdgpu_cs_ctx_free(context_handle[1]);
+	}
 
 	free(ibs_request.dependencies);
 	free_cmd_base(base);
+	free(ring_context);
 }
 
 igt_main
@@ -743,7 +784,7 @@ igt_main
 	igt_subtest_with_dynamic("sync-dependency-test-with-IP-GFX") {
 		if (arr_cap[AMD_IP_GFX]) {
 			igt_dynamic_f("sync-dependency-test")
-			amdgpu_sync_dependency_test(device);
+			amdgpu_sync_dependency_test(device, false);
 		}
 	}
 
@@ -763,6 +804,14 @@ igt_main
 		}
 	}
 
+	igt_describe("Check-sync-dependency-using-GFX-ring");
+	igt_subtest_with_dynamic("sync-dependency-test-with-IP-GFX-UMQ") {
+		if (arr_cap[AMD_IP_GFX]) {
+			igt_dynamic_f("sync-dependency-test-with-umq")
+			amdgpu_sync_dependency_test(device, true);
+		}
+	}
+
 	igt_fixture {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
-- 
2.43.0

