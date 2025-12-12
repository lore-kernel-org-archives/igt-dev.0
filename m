Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDADD49208
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 11:52:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DCF410E721;
	Fri, 12 Dec 2025 11:52:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rh9zvA7u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1AD810E341
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 11:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765540351; x=1797076351;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/q+kCWsiZ6R+vvPXadJnq9qWaJkRLuEE6SsKEPdiR5A=;
 b=Rh9zvA7uO2Im8bjKSu3Shkez1vLxUjjGKvehSCJHBve3Ftvos37zosvw
 Y+Ccqiqw9uXoHLLRYUWTSDKX7IXgUVL0R1VRMhjqCizTidIGa3ijTkyhA
 QRE5YnO6hMS6zxph5GJKqTcvTOd8cHf9rMsDFM7n59yMC1hYVrHwQZXNi
 7vhRfI1YdsVxfVThJF07U598VDxcOENY7lM4XhpJbPTgquEgI0zsOynL+
 3M/AvFW4QU//M6e5RWPXV6fI7t8gTmpezuq7cH3UKIPP8SWHPgUbnMTJN
 U5erg0DNxMPizMtDTNir7US9qKvbRJaVUV4TMO2OYLsBJfA/4BpmFBdDx w==;
X-CSE-ConnectionGUID: 5+fs7pVtSze/c9Igk9caBw==
X-CSE-MsgGUID: g4IxdR6uRryph8x3a/sJBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67615571"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="67615571"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 03:52:31 -0800
X-CSE-ConnectionGUID: 13HrOpiFQQqfzP8tXnb4aw==
X-CSE-MsgGUID: DliEBcaOQ0uI5Oc45XX4qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="234473130"
Received: from rvuia-mobl.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.245.89])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 03:52:29 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Nishit Sharma <nishit.sharma@intel.com>
Subject: [PATCH i-g-t,
 v2 3/3] tests/intel/xe_exec_system_allocator: Add new SVM compute
 tests
Date: Fri, 12 Dec 2025 12:51:11 +0100
Message-ID: <20251212115208.179655-4-francois.dugast@intel.com>
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

These new tests allow triggering GPU page faults from the context of
execution units. They can be used to create single page faults or page
fault floods, of various sizes. This is helpful for debugging and for
performance profiling.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Acked-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 53 +++++++++++++++++++++++---
 1 file changed, 47 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index f13aee9cd..c787e6f03 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -2172,13 +2172,36 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
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
-test_compute(int fd, size_t size)
+test_compute(int fd, size_t size, unsigned int flags)
 {
 	struct drm_xe_sync sync = {
 		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
@@ -2193,7 +2216,6 @@ test_compute(int fd, size_t size)
 		.array_size = size,
 	};
 	float *compute_input;
-	unsigned int loop_count = env.array_size / sizeof(float);
 	int i;
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
@@ -2205,11 +2227,14 @@ test_compute(int fd, size_t size)
 	compute_input = aligned_alloc(SZ_2M, env.array_size);
 	igt_assert(compute_input);
 
-	for (i = 0; i < loop_count; i++)
-		compute_input[i] = rand() / (float)RAND_MAX;
-
+	env.loop_count = (flags & TOUCH_ONCE) ? 1 : env.array_size / sizeof(float);
+	env.skip_results_check = !(flags & ACCESS_DEVICE_HOST);
 	env.input_addr = to_user_pointer(compute_input);
 	env.vm = vm;
+
+	for (i = 0; i < env.loop_count; i++)
+		compute_input[i] = rand() / (float)RAND_MAX;
+
 	run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
 
 	free(compute_input);
@@ -2361,6 +2386,13 @@ int igt_main()
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
@@ -2603,7 +2635,16 @@ int igt_main()
 	}
 
 	igt_subtest("compute")
-		test_compute(fd, SZ_2M);
+		test_compute(fd, SZ_2M, 0);
+
+	for (const struct section *s = csections; s->name; s++) {
+		igt_subtest_f("eu-fault-4k-%s", s->name)
+			test_compute(fd, SZ_4K, s->flags);
+		igt_subtest_f("eu-fault-64k-%s", s->name)
+			test_compute(fd, SZ_64K, s->flags);
+		igt_subtest_f("eu-fault-2m-%s", s->name)
+			test_compute(fd, SZ_2M, s->flags);
+	}
 
 	igt_fixture() {
 		xe_device_put(fd);
-- 
2.43.0

