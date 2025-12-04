Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26801D1F9C8
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 11:37:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB0B10E921;
	Thu,  4 Dec 2025 11:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mY1Yh4dV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E7B10E8EA
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 11:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764848268; x=1796384268;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xyFu65301OhyNbTIZRvEUITxEcCDx6HgAzjdJxrrJDM=;
 b=mY1Yh4dVf/TjyiN6VP8evh8ciNJBuyyEb33eUNlEWOAx5D5X4aoIJPvR
 I4Pa3xMdyVfhf74bC5UKWu5dXZJDtkWKFWacNblMT7enK2ahPEyVmOsDI
 2M38o3IBd7jVKvgYiS/I78N0bdg2wE+2hpZKAyXNVi9dHwBd722OZz48n
 2PfF/jLOmJ9aR4DHFGli6nfP6gTpZQLgrWiDyCSAA1KFdIUUPRcNCNALa
 kMOfHvndlUK2RuPfruPLY24x2TlEz6uTp+SH9BkA0Z0rAnH+QCyJpjVbJ
 E4I0rfOac7I+MNbTOVSh6j5yxlbU0MG7/0Iuzx+XUUVczQrD1ZQFernUn g==;
X-CSE-ConnectionGUID: L52M1/g/Q1CWwRAXiG8rcw==
X-CSE-MsgGUID: 5EOBK3A/TI2mXvHcxN6jSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78330985"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="78330985"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 03:37:48 -0800
X-CSE-ConnectionGUID: kWMuk8RPRDe37Ibuv8Zi/w==
X-CSE-MsgGUID: FQllOlwPT7+uUlfOXjSqVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="195372505"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.245.165])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 03:37:47 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/xe_exec_system_allocator: Cleanup
 compute test
Date: Thu,  4 Dec 2025 12:35:58 +0100
Message-ID: <20251204113726.567142-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251204113726.567142-1-francois.dugast@intel.com>
References: <20251204113726.567142-1-francois.dugast@intel.com>
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

Cleanup the test that uses lib/intel_compute and SVM to execute a compute
kernel on arrays allocated on host, in preparation to add more tests.
Remove the result check as this is already done in lib/intel_compute and
remove output to simplify the test as it did not add value.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index c54a52690..43be307fb 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -2189,10 +2189,11 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
 		uint64_t sync;
 	} *bo_sync;
 	uint32_t vm;
+	size_t aligned_size = size ?: xe_get_default_alignment(fd);
 	struct user_execenv env = {
-		.array_size = size / sizeof(float),
+		.array_size = aligned_size / sizeof(float),
 	};
-	float *compute_input, *compute_output;
+	float *compute_input;
 	int i;
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
@@ -2201,23 +2202,16 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
 	bind_system_allocator(&sync, 1);
 	xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, 0, FIVE_SEC);
 
-	compute_input = aligned_alloc(SZ_2M, size);
+	compute_input = aligned_alloc(aligned_size, size);
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
-- 
2.43.0

