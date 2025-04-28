Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B857C36005
	for <igt-dev@archiver.kernel.org>; Mon, 28 Apr 2025 07:44:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D372D10E0C6;
	Mon, 28 Apr 2025 07:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DzpJ/JJr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A021110E0C6
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Apr 2025 07:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745826265; x=1777362265;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LgqWI3KYeGwTPFrjspIzVB85BzZ3rXkAJLuFooKJ/W0=;
 b=DzpJ/JJrQYki27hdBXYQLA9n6Lt7nrWInTMpnfRclnYv8HU+E71y7IsF
 QscYpVpt1WdlS0OlpeS0KUyeyJXKyvRLa0nPt0kYiZ37GNp/OoILKNsHv
 QXkrSn690glCdBQw5idmLYOzIhI0wZw+slE04GM33OUtcAeVxU9r9qbqf
 0BYpFessV+hkiAzzw7VKvW+8NcBpGVuK+vhW0EkQfVFBA6OoqQHh2yZ2k
 iCuFA5WqqyOX5g86UarqqBRc43diFanKzbGV9EQkVeqW8XZk9NTyC1L3P
 fw4gFg9nTCXT/JnJ+d5fwc7gGKZ2HDwFRe0+XG1qWDhPnie5dpBeoL/dm g==;
X-CSE-ConnectionGUID: i0/qzv9eRIiNiL224qbLwA==
X-CSE-MsgGUID: T2a0JOTCRs6iNRawVoV34g==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="47492002"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="47492002"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 00:44:24 -0700
X-CSE-ConnectionGUID: Fn4kQRNIQByTyz+0/sy6JA==
X-CSE-MsgGUID: dQTUFYm4SgeKToj8pCsymA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="133332187"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.160])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 00:44:23 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Add basic compute
 test
Date: Mon, 28 Apr 2025 09:44:13 +0200
Message-ID: <20250428074414.2438277-1-francois.dugast@intel.com>
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

The IGT compute library recently received multiple series of updates
to make it usable with the system allocator. This new test demonstrates
and validates how the system allocator and IGT compute can be wired up.
It is intentionally very basic for now.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 56 ++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index e1121a862..a2d5353f5 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -18,6 +18,7 @@
 
 #include "igt.h"
 #include "lib/igt_syncobj.h"
+#include "lib/intel_compute.h"
 #include "lib/intel_reg.h"
 #include "xe_drm.h"
 
@@ -1570,6 +1571,57 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
 	munmap(pdata, sizeof(*pdata));
 }
 
+/**
+ * SUBTEST: compute-basic
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
+	compute_input = aligned_alloc(xe_get_default_alignment(fd), size);
+	igt_assert(compute_input);
+	compute_output = aligned_alloc(xe_get_default_alignment(fd), size);
+	igt_assert(compute_output);
+
+	for (i = 0; i < env.array_size; i++)
+		compute_input[i] = rand() / (float)RAND_MAX;
+
+	env.input_addr = to_user_pointer(compute_input);
+	env.output_addr = to_user_pointer(compute_output);
+	env.vm = vm;
+	run_intel_compute_kernel(fd, &env);
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
@@ -1847,6 +1899,10 @@ igt_main
 			processes_evict(fd, SZ_8M, SZ_1M, s->flags);
 	}
 
+	igt_subtest("compute-basic")
+		xe_for_each_engine(fd, hwe)
+			test_compute(fd, hwe, SZ_8M);
+
 	igt_fixture {
 		xe_device_put(fd);
 		drm_close_driver(fd);
-- 
2.43.0

