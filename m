Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946E9D49206
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 11:52:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C3E10E341;
	Fri, 12 Dec 2025 11:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PYmN3oZp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ACBA10E341
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 11:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765540349; x=1797076349;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p1EWP/tVyhe8DNh9gpE88DevO1KE2l88gqqcvadB9U4=;
 b=PYmN3oZp3COIQFTiwShZEKiLqjLa5vWmfxap4RMr1vxK3rJkg1YD/tnH
 klgIBUtO1SC2yQWT2srf6Nh0Lh6MzU6oEn1vjm7Mcf+jiOGM8K6EqgA55
 muMHPix7vhQJwd3np6F3UJ3bGnY5Gvz5QVik5uKAiWzFfOvvd1353bHQi
 rKG+XG+PMQVNBeoE4q4f56foeknchVR7g9OLLeIlXDxHcOJVc+L/TVIJ6
 yJvtAiPdAxdSSFyimXSpUhwW0JE90JdRXX4VVTC7F0Key2NG+CxTCaZn7
 Rz1hzgotn5RiCmIy6fAG2/cCFCbCP90BD9OHRtzTiXvdP2bQOvDy24Z9W A==;
X-CSE-ConnectionGUID: JyWYb0HQSeewBZLRmLK8VA==
X-CSE-MsgGUID: aHbPnUQbSImgIr38AmmpKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67615564"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="67615564"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 03:52:29 -0800
X-CSE-ConnectionGUID: wihxlEFERsKEsVSUrnBbdg==
X-CSE-MsgGUID: x6tuSu70Tm2h4US6XVNbKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="234473125"
Received: from rvuia-mobl.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.245.89])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 03:52:27 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Nishit Sharma <nishit.sharma@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH i-g-t,
 v2 2/3] tests/intel/xe_exec_system_allocator: Cleanup compute test
Date: Fri, 12 Dec 2025 12:51:10 +0100
Message-ID: <20251212115208.179655-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212115208.179655-1-francois.dugast@intel.com>
References: <20251212115208.179655-1-francois.dugast@intel.com>
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
index 07ac6b66c..f13aee9cd 100644
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
 		.array_size = size,
 	};
-	float *compute_input, *compute_output;
+	float *compute_input;
 	unsigned int loop_count = env.array_size / sizeof(float);
 	int i;
 
@@ -2204,21 +2204,14 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
 
 	compute_input = aligned_alloc(SZ_2M, env.array_size);
 	igt_assert(compute_input);
-	compute_output = aligned_alloc(SZ_2M, env.array_size);
-	igt_assert(compute_output);
 
 	for (i = 0; i < loop_count; i++)
 		compute_input[i] = rand() / (float)RAND_MAX;
 
 	env.input_addr = to_user_pointer(compute_input);
-	env.output_addr = to_user_pointer(compute_output);
 	env.vm = vm;
 	run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
 
-	for (i = 0; i < loop_count; i++)
-		igt_assert_eq_double(compute_input[i] * compute_input[i], compute_output[i]);
-
-	free(compute_output);
 	free(compute_input);
 	unbind_system_allocator();
 	xe_vm_destroy(fd, vm);
@@ -2610,8 +2603,7 @@ int igt_main()
 	}
 
 	igt_subtest("compute")
-		xe_for_each_engine(fd, hwe)
-			test_compute(fd, hwe, SZ_2M);
+		test_compute(fd, SZ_2M);
 
 	igt_fixture() {
 		xe_device_put(fd);
-- 
2.43.0

