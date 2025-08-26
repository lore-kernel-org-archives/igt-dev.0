Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A84ECA0FF2
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 17:00:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D9E210E39B;
	Tue, 26 Aug 2025 17:00:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="em9hcBa8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E605F10E6AA
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 17:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756227609; x=1787763609;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DwnJ6QMS56fYiAJ/Oj6iw0H6uSroToPgaaWv+OA6I5U=;
 b=em9hcBa8tbSg8/Xu0KHsOHzKE5wV3nfKJsf7gdN/0PR2wiRvDgQF6enN
 Eb/+wvnw2Knk6ht5xC7lInObUmI8y3SInMm2Iv42JMtyP85Sx1vtp4JhE
 pZzjt2JHxooX7Z/PgTAFbjdlSoiby45sc/LWH30ZxWo9DP1yXdqu0fW17
 PzSsnMPpj+c3RcCVs5SVYpS8e4IOvQoPF7pkzNlOLOboW/wQ24S3XeiMe
 mZDMYOBtMptojZmwKxbmkIzpOfgqQYtmI9aS5kusaJZ6eNyofUGJI/Htt
 WFIw023dZ7i94tr+92fJgGMN/SAgDiQO9btrR4mTCj1B7Q+YBfBSPOS+l w==;
X-CSE-ConnectionGUID: 7PyFQFTjTDao4kByG0hsGg==
X-CSE-MsgGUID: 4P8LRplMSz2fEZsvRQjccA==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="69572505"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="69572505"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 10:00:09 -0700
X-CSE-ConnectionGUID: SFm0HU6gTHycbKBnp9i7fA==
X-CSE-MsgGUID: SZc0Clq1QJCmd9JuPT/lYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="206793961"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.90])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 10:00:07 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Add compute test
Date: Tue, 26 Aug 2025 18:59:52 +0200
Message-ID: <20250826165952.507970-1-francois.dugast@intel.com>
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

The IGT compute library recently received multiple series of updates to
make it usable with the system allocator. This new test makes use of it
to trigger SVM faults from EUs.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 56 ++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 007d9bdc0..e7f3d423a 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -18,6 +18,7 @@
 
 #include "igt.h"
 #include "lib/igt_syncobj.h"
+#include "lib/intel_compute.h"
 #include "lib/intel_reg.h"
 #include "xe_drm.h"
 
@@ -1728,6 +1729,57 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
 	munmap(pdata, sizeof(*pdata));
 }
 
+/**
+ * SUBTEST: compute
+ * Description: Run a simple compute kernel with the system allocator
+ * Test category: functionality test
+ */
+static void
+test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
+{
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.timeline_value = USER_FENCE_VALUE,
+	};
+	struct bo_sync {
+		uint64_t sync;
+	} *bo_sync;
+	uint32_t vm;
+	struct user_execenv env = {
+		.array_size = size / sizeof(float),
+	};
+	float *compute_input, *compute_output;
+	int i;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	bo_sync = aligned_alloc(xe_get_default_alignment(fd), sizeof(*bo_sync));
+	sync.addr = to_user_pointer(&bo_sync->sync);
+	bind_system_allocator(&sync, 1);
+	xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, 0, FIVE_SEC);
+
+	compute_input = aligned_alloc(SZ_2M, size);
+	igt_assert(compute_input);
+	compute_output = aligned_alloc(SZ_2M, size);
+	igt_assert(compute_output);
+
+	for (i = 0; i < env.array_size; i++)
+		compute_input[i] = rand() / (float)RAND_MAX;
+
+	env.input_addr = to_user_pointer(compute_input);
+	env.output_addr = to_user_pointer(compute_output);
+	env.vm = vm;
+	run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
+
+	for (i = 0; i < env.array_size; i++)
+		igt_assert_eq_double(compute_input[i] * compute_input[i], compute_output[i]);
+
+	free(compute_output);
+	free(compute_input);
+	unbind_system_allocator();
+	xe_vm_destroy(fd, vm);
+}
+
 struct section {
 	const char *name;
 	unsigned int flags;
@@ -2026,6 +2078,10 @@ igt_main
 			processes_evict(fd, SZ_8M, SZ_1M, s->flags);
 	}
 
+	igt_subtest("compute")
+		xe_for_each_engine(fd, hwe)
+			test_compute(fd, hwe, SZ_2M);
+
 	igt_fixture {
 		xe_device_put(fd);
 		drm_close_driver(fd);
-- 
2.43.0

