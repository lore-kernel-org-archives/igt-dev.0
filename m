Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6690D6ACFE
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 12:59:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3947010E401;
	Thu, 18 Dec 2025 12:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZaUB9Ovi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F51510E401
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 12:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766062757; x=1797598757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MWy0bSFcRkADWkHXqAa6hUXbI6VG8Y6rnNqX5pqJbIA=;
 b=ZaUB9Ovi23u+zl6NdhAL6yn8+YskcUJtXU2+EM4TtfD2R/733zxnORbh
 xk9mof3XQI7OvU+g0bX3O4YEDJ5yhSZXxLaxhZAYhtDcu3UBRF6YT3Ajy
 wmVidxIne0qsGab76/L20t7wcDP5n3Yj98B8cLBxYYDFIBurgciOPIlkT
 2uNNowhwUKI7iRSPo/WooGl1r+P7gR10fLY26H1ad39cxeKhPicswSX66
 3w4VSqk7OXeL38dBntptv/aiasxGtmszcd2fbcpUJ2pKbN+h+jalvGDA8
 9WWj8cO0ahAyuXJp9GlXkzCEZOF+tdRgilJFbMcAo2k4AQcd09CmewyNQ Q==;
X-CSE-ConnectionGUID: DCfvfT/oRQSxDqDsKRKzWg==
X-CSE-MsgGUID: vH+U2JEURTaUtxLu3l6+Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="90672317"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="90672317"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 04:59:17 -0800
X-CSE-ConnectionGUID: bSIX+xnbQ0arcsQlim49aA==
X-CSE-MsgGUID: 3Cu9Y2UpRgWsuE7Gr7flgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="198637716"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.48])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 04:59:15 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Nishit Sharma <nishit.sharma@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH i-g-t,
 v4 1/3] tests/intel/xe_exec_system_allocator: Cleanup compute test
Date: Thu, 18 Dec 2025 13:56:05 +0100
Message-ID: <20251218125906.124925-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218125906.124925-1-francois.dugast@intel.com>
References: <20251218125906.124925-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Cleanup the test that uses lib/intel_compute and SVM to execute a compute
kernel on arrays allocated on host, in preparation to add more tests.
Remove the result check as this is already done in lib/intel_compute.
Remove output to simplify the test as it did not add value.
Remove the drm_xe_engine_class_instance argument as it was unused.

Cc: Nishit Sharma <nishit.sharma@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index ffa4ec3f5..2ca85c95c 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -2178,7 +2178,7 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
  * Test category: functionality test
  */
 static void
-test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
+test_compute(int fd, size_t size)
 {
 	struct drm_xe_sync sync = {
 		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
@@ -2192,7 +2192,7 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
 	struct user_execenv env = {
 		.array_size = size / sizeof(float),
 	};
-	float *compute_input, *compute_output;
+	float *compute_input;
 	int i;
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
@@ -2203,21 +2203,14 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
 
 	compute_input = aligned_alloc(SZ_2M, size);
 	igt_assert(compute_input);
-	compute_output = aligned_alloc(SZ_2M, size);
-	igt_assert(compute_output);
 
 	for (i = 0; i < env.array_size; i++)
 		compute_input[i] = rand() / (float)RAND_MAX;
 
 	env.input_addr = to_user_pointer(compute_input);
-	env.output_addr = to_user_pointer(compute_output);
 	env.vm = vm;
 	run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
 
-	for (i = 0; i < env.array_size; i++)
-		igt_assert_eq_double(compute_input[i] * compute_input[i], compute_output[i]);
-
-	free(compute_output);
 	free(compute_input);
 	unbind_system_allocator();
 	xe_vm_destroy(fd, vm);
@@ -2609,8 +2602,7 @@ int igt_main()
 	}
 
 	igt_subtest("compute")
-		xe_for_each_engine(fd, hwe)
-			test_compute(fd, hwe, SZ_2M);
+		test_compute(fd, SZ_2M);
 
 	igt_fixture() {
 		xe_device_put(fd);
-- 
2.43.0

