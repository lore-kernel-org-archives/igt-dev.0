Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB9AD6ACE6
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 10:49:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB69210EE16;
	Thu, 18 Dec 2025 10:49:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CMGXb507";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6454F10EE16
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 10:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766054967; x=1797590967;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tfHF1ZmLP1W3eGR7UKVdmsaSt6YhOpnTQdrGd6W7A9k=;
 b=CMGXb507FxE+/Is7TRaXn0FX1zH4qTwZW/33kCReoltct5GFnG2cjGze
 a6wKakBq8x29DVw/AvcyVW9ahSO4Sy2Njo6ZSwY+yxXuGwrNBquhm98UV
 XPsCyHGQ+TQnGdjRffFAUSoggDEF03rHfTB9zuB7/ibdyWwzsGjfdOapk
 x8hsH8l9FGf35tOds0fL3qXb0RTtIaFoLGJn4dnvkzEMpflwIOnXakkuA
 Bij71iVBbYbcq51+wX4AUO+H0PpMtozuRapKbFuc2YPLmXhgmR+b586/u
 q62ynagiieqQJKzaMTyHuKRk5psgNKxijxqq2XdmdK68P8tBIW3hn0LzB w==;
X-CSE-ConnectionGUID: vBSuRB6pTkelR6JWc84x7w==
X-CSE-MsgGUID: NTACAJrVQOK1G5T75HMIVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67896860"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="67896860"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 02:49:27 -0800
X-CSE-ConnectionGUID: 4k26o9GMRYqX/yJYTdFLxg==
X-CSE-MsgGUID: RfwMUziQTnONUfRvaSU6Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="199026125"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.48])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 02:49:25 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Nishit Sharma <nishit.sharma@intel.com>
Subject: [PATCH i-g-t,
 v3 3/3] tests/intel/xe_exec_system_allocator: Add new SVM compute
 tests
Date: Thu, 18 Dec 2025 11:47:22 +0100
Message-ID: <20251218104907.117812-4-francois.dugast@intel.com>
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
 1 file changed, 48 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index e66fa4203..25fca9ba6 100644
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
@@ -2194,6 +2217,7 @@ test_compute(int fd, size_t size)
 	};
 	float *compute_input;
 	int i;
+	unsigned int loop_count;
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
 	bo_sync = aligned_alloc(xe_get_default_alignment(fd), sizeof(*bo_sync));
@@ -2204,11 +2228,14 @@ test_compute(int fd, size_t size)
 	compute_input = aligned_alloc(SZ_2M, env.array_size * sizeof(float));
 	igt_assert(compute_input);
 
-	for (i = 0; i < env.array_size; i++)
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
@@ -2360,6 +2387,13 @@ int igt_main()
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
@@ -2602,7 +2636,16 @@ int igt_main()
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

