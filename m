Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDFF7D1F9CB
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 11:37:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8747E10E91C;
	Thu,  4 Dec 2025 11:37:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RE1YercX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB6F10E91C
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 11:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764848269; x=1796384269;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c+PuZCuuzo9i3Hf4zEiqYw3XC70l6EoGevaKana3Bug=;
 b=RE1YercXxgwznJgMKzDmep+D1fvFlDrGChDjxIiQ1Ygv8Y/RiBRBWI/7
 Rre3ZBvZ21coeZc46lxvuq0CctRX3crg07YwipiSmIHuyiVwuZ88GbiXh
 ksiLXaRNTXasK6aaM+EPRtqH4DsnvutWtvWhFk6P8nb0q6lcFED3uXV4d
 rTNa3o7lA2EaO0Y9jvyPttNY5rgUhiG89HKqbn+1jlGdi5RhJR5zm9VyD
 ghVW5fzUyULCWbQmCmcwoX7uOVRB9S1qE4Nays1Rp2QAegka0fSnFT7z1
 qsPvRwAMFSwex1rvjWiOdgPCUCirZp+kr2p3IX757RjBhC0pJnfUwdTCr A==;
X-CSE-ConnectionGUID: YxTmRcwTTR+6E5mR7JIUKw==
X-CSE-MsgGUID: CcxKFVNZT96I/U0qkXIvaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78330986"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="78330986"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 03:37:49 -0800
X-CSE-ConnectionGUID: ZRjiPzxmTSeA/Pz3X9AWOg==
X-CSE-MsgGUID: HPd6H9doRVmwsl7Nj46G1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="195372509"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.245.165])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 03:37:48 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_exec_system_allocator: Add new SVM
 compute tests
Date: Thu,  4 Dec 2025 12:35:59 +0100
Message-ID: <20251204113726.567142-3-francois.dugast@intel.com>
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

These new tests allow triggering GPU page faults from the context of
execution units. They can be used to create single page faults or page
fault floods, of various sizes. This is helpful for debugging and for
performance profiling.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 60 ++++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 43be307fb..95146a5f3 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -2172,13 +2172,37 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
 	munmap(pdata, sizeof(*pdata));
 }
 
+/* compute flags */
+#define TOUCH_ONCE		(0x1 << 0)
+#define ACCESS_DEVICE_HOST	(0x1 << 1)
+
 /**
  * SUBTEST: compute
  * Description: Run a simple compute kernel with the system allocator
  * Test category: functionality test
+ *
+ * SUBTEST: eu-fault-4k-%s
+ * Description: Run a simple compute kernel %arg[1] on a 4KB malloc'ed buffer
+ * Test category: performance test
+ *
+ * SUBTEST: eu-fault-64k-%s
+ * Description: Run a simple compute kernel %arg[1] on a 64KB malloc'ed buffer
+ * Test category: performance test
+ *
+ * SUBTEST: eu-fault-2m-%s
+ * Description: Run a simple compute kernel %arg[1] on a 2MB malloc'ed buffer
+ * Test category: performance test
+ *
+ * arg[1]:
+ *
+ * @once-device:				touch the buffer only once, from the device
+ * @once-device-host:				touch the buffer only once, from the device then from the host
+ * @range-device:				touch the whole buffer, from the device
+ * @range-device-host:				touch the whole buffer, from the device then from the host
  */
 static void
-test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
+test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
+	     unsigned int flags)
 {
 	struct drm_xe_sync sync = {
 		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
@@ -2205,11 +2229,14 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
 	compute_input = aligned_alloc(aligned_size, size);
 	igt_assert(compute_input);
 
+	env.array_size = (flags & TOUCH_ONCE) ? 1 : aligned_size / sizeof(float);
+	env.skip_results_check = (flags & ACCESS_DEVICE_HOST) ? false : true;
+	env.input_addr = to_user_pointer(compute_input);
+	env.vm = vm;
+
 	for (i = 0; i < env.array_size; i++)
 		compute_input[i] = rand() / (float)RAND_MAX;
 
-	env.input_addr = to_user_pointer(compute_input);
-	env.vm = vm;
 	run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
 
 	free(compute_input);
@@ -2361,6 +2388,13 @@ igt_main
 		  MADVISE_OP | PREFETCH | PREFETCH_SAME_ATTR | ATOMIC_BATCH },
 		{ NULL },
 	};
+	const struct section csections[] = {
+		{ "once-device", TOUCH_ONCE },
+		{ "once-device-host", TOUCH_ONCE | ACCESS_DEVICE_HOST },
+		{ "range-device", 0 },
+		{ "range-device-host", ACCESS_DEVICE_HOST },
+		{ NULL },
+	};
 
 	const struct section intel_get_pat_idx_functions[] = {
 		{ "madvise-pat-idx-wb-single-vma", MADVISE_OP | MADVISE_PAT_INDEX,
@@ -2604,7 +2638,25 @@ igt_main
 
 	igt_subtest("compute")
 		xe_for_each_engine(fd, hwe)
-			test_compute(fd, hwe, SZ_2M);
+			test_compute(fd, hwe, SZ_2M, 0);
+
+	for (const struct section *s = csections; s->name; s++) {
+		igt_subtest_f("eu-fault-4k-%s", s->name)
+			xe_for_each_engine(fd, hwe) {
+				test_compute(fd, hwe, SZ_4K, s->flags);
+				break;
+			}
+		igt_subtest_f("eu-fault-64k-%s", s->name)
+			xe_for_each_engine(fd, hwe) {
+				test_compute(fd, hwe, SZ_64K, s->flags);
+				break;
+			}
+		igt_subtest_f("eu-fault-2m-%s", s->name)
+			xe_for_each_engine(fd, hwe) {
+				test_compute(fd, hwe, SZ_2M, s->flags);
+				break;
+			}
+	}
 
 	igt_fixture {
 		xe_device_put(fd);
-- 
2.43.0

