Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFE0D6ACFE
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 12:59:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 407ED10E41D;
	Thu, 18 Dec 2025 12:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WWZnm/du";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF6510E41D
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 12:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766062760; x=1797598760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6p87nYknT129WTFODWsGZwrlXiq8USn5mRxcROZBuzk=;
 b=WWZnm/du7PnsgMW/+VTamcly8W3FArq4N5SfQ9d3jA+xKy5C/n/KON8h
 C+U2cit4aCspVC2Czfm0JSIMPipx/PRX2c7KefvtZnT9FUHwZmvL0uObY
 0esn8RaSvnijgQubw0+VZxuKlemg3I8wO/M6DMMlI8A8NXY4V70J2pBe1
 yOzV/a+5wFYxlFv4jAAueaAern8KOjcJtyR+c3TWl+Lo/vp3JYkA/6Xso
 0D6MeuS8WzufvwTcr0gx7IV1cdgoqlouO38fdvRXK/BJX8mnju3I/bycU
 RSSV1ZrAR9UVwaOP+T48M1TIQngRWEF9/yNoZkH6302ceV35RhzhMDRJr Q==;
X-CSE-ConnectionGUID: M21bP2IHRxatAiHRXeZ8Kw==
X-CSE-MsgGUID: 3oFPd+kURMa+vE4o7wf+nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="90672321"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="90672321"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 04:59:20 -0800
X-CSE-ConnectionGUID: Cnuzt5IiTjqDyI6SSoMD9Q==
X-CSE-MsgGUID: BcZI35hoTOasGT4fj7kzZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="198637743"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.48])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 04:59:18 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Nishit Sharma <nishit.sharma@intel.com>
Subject: [PATCH i-g-t,
 v4 3/3] tests/intel/xe_exec_system_allocator: Add new SVM compute
 tests
Date: Thu, 18 Dec 2025 13:56:07 +0100
Message-ID: <20251218125906.124925-4-francois.dugast@intel.com>
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

These new tests allow triggering GPU page faults from the context of
execution units. They can be used to create single page faults or page
fault floods, of various sizes. This is helpful for debugging and for
performance profiling.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Acked-by: Nishit Sharma <nishit.sharma@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 52 +++++++++++++++++++++++---
 1 file changed, 47 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index b1555afbe..66d68f054 100644
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
@@ -2207,11 +2230,14 @@ test_compute(int fd, size_t size)
 	compute_input = aligned_alloc(SZ_2M, size);
 	igt_assert(compute_input);
 
-	for (i = 0; i < env.array_size; i++)
-		compute_input[i] = rand() / (float)RAND_MAX;
-
+	env.loop_count = (flags & TOUCH_ONCE) ? 1 : env.array_size;
+	env.skip_results_check = !(flags & ACCESS_DEVICE_HOST);
 	env.input_addr = to_user_pointer(compute_input);
 	env.vm = vm;
+
+	for (i = 0; i < env.loop_count; i++)
+		compute_input[i] = rand() / (float)RAND_MAX;
+
 	run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
 
 	free(compute_input);
@@ -2363,6 +2389,13 @@ int igt_main()
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
@@ -2605,7 +2638,16 @@ int igt_main()
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

