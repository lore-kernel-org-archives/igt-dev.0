Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5E0D6ACE5
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 10:49:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE5F110ED46;
	Thu, 18 Dec 2025 10:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KVfDNOno";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA56910EE17
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 10:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766054964; x=1797590964;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yxr6BqYmouBeE3xSUcn3pHrTkhx1FMNatAG415VMjLQ=;
 b=KVfDNOno/p2A8erea5SRlXJ+/tTvhVN3o2rP2HZcpfS5d8m/FldRosIt
 XuzMRuiajM5R7Zeh2qGbDlkaLeo1mEJZ6d4Og8P4wXXY+jJgAJDHeJH4p
 BehwzM6wfDZKalv57KmSIYJWVcLJb9MJSlKBhGMsb2swYggWvXgnxc7Gr
 vAkhaWAdMWi+bHhNieilYVZgbs/cx1u97ti/sFU0QeAYobf45+GFhHqvr
 Zgd0IeS9VWUzZ6RkK9gE/FmtBj14IEYKaLXeMgRGJ4wYKBc3WRPYL6Ppe
 P4j/toySHVqSiDQQh0j8bbDTyjsl/My0zXDjhQYK2u10OR7kWcXyphyHq w==;
X-CSE-ConnectionGUID: X9w7b9VLR7+fd8UNOkV8PQ==
X-CSE-MsgGUID: wnwsORvcTEyjSNj4Kgj5Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67896855"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="67896855"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 02:49:24 -0800
X-CSE-ConnectionGUID: IOUY8W7nTieXwdTTqihrMw==
X-CSE-MsgGUID: GjE240PrT8i9jafrosSxhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="199026105"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.48])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 02:49:22 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Nishit Sharma <nishit.sharma@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH i-g-t,
 v3 1/3] tests/intel/xe_exec_system_allocator: Cleanup compute test
Date: Thu, 18 Dec 2025 11:47:20 +0100
Message-ID: <20251218104907.117812-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218104907.117812-1-francois.dugast@intel.com>
References: <20251218104907.117812-1-francois.dugast@intel.com>
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

