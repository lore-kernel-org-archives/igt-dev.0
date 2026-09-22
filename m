Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06620C982F1
	for <igt-dev@archiver.kernel.org>; Tue, 22 Sep 2026 11:06:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D16910E6BE;
	Tue, 22 Sep 2026 11:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JIgBVUk5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F08FC10E6BE
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Sep 2026 11:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790075081; x=1821611081;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VCV1v/Qy/ot4+geOTI0oZ2vKNft5JpWiK7xCHO483w8=;
 b=JIgBVUk5YZKYKkjcLfh9pwiNGvvTMv+t7Gj8dAEWi2xNuONJm+HgtCgq
 OKwntBa4hPyUMqOvXlHN11IFmUbo3CjGqhIJJp6Wt88JJa/WKTCPGY59I
 +rP+mTqcwxZPJ1Q4AV5Mteh2Ym8j7lcWph+/cTSURMthu9aKDvu5PYpxh
 sij/l69fV8g/d8X2eb0SahuiCgs36Ya4GfellHyDj/YC+7mo03bfNgBMB
 JAOhj8juVZQX7Gzp8VuCuROsI1Ewl4PXKYKcB6gY36fEL/HonSDlRmG+q
 oc8Yj780FK1VTKq+IVTpLvrFaQNhaV0tAiTX2VG+giJko97mVh74MRJaZ Q==;
X-CSE-ConnectionGUID: 0jodSakXSjaxPS8/3cXLhg==
X-CSE-MsgGUID: GbBEzF6SThukLvY+sGFC5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="78220519"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="78220519"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 04:04:40 -0700
X-CSE-ConnectionGUID: uoSyqAdpT2idUu8EJo600A==
X-CSE-MsgGUID: iwihIIFRTIWrGMex8y0EBA==
X-ExtLoop1: 1
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by fmviesa003.fm.intel.com with ESMTP; 22 Sep 2026 04:04:40 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	matthew.brost@intel.com
Cc: nishit.sharma@intel.com,
	priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t v5 2/5] tests/intel: Add random-size BO leak tests
Date: Tue, 22 Sep 2026 11:04:35 +0000
Message-ID: <20260922110438.2402109-3-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260922110438.2402109-1-sobin.thomas@intel.com>
References: <20260922110438.2402109-1-sobin.thomas@intel.com>
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

Add new RANDOM_SIZE subtests exercising randomly sized BO allocation
This test excercises allocation, execution, validation and cleanup
paths across a wider mix of BO size, helping to detect issues that
may only appear with specific size combinations.

Add the following subtests:
- rand-sizes-10
- rand-sizes-100
- rand-sizes-100-unaligned

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_bo_alloc.c | 126 ++++++++++++++++++++++++++++++++++----
 1 file changed, 115 insertions(+), 11 deletions(-)

diff --git a/tests/intel/xe_bo_alloc.c b/tests/intel/xe_bo_alloc.c
index 8680fe518..bd5bf5a33 100644
--- a/tests/intel/xe_bo_alloc.c
+++ b/tests/intel/xe_bo_alloc.c
@@ -34,6 +34,20 @@
  * SUBTEST: all-sizes-once
  * Description: Test all BO allocations sizes in test table
  * Test category: functionality test
+ *
+ * SUBTEST: rand-sizes-10
+ * Description: Test 10 random BO allocation sizes in test table
+ * Test category: functionality test
+ *
+ * SUBTEST: rand-sizes-100
+ * Description: Test 100 random BO allocation sizes in test table
+ * Test category: functionality test
+ *
+ * SUBTEST: rand-sizes-100-unaligned
+ * Description: Test 100 random BO allocation sizes in test table, unaligned bind addresses
+ * Test category: functionality test
+ *
+ *
  */
 
 #define GB(x) (1024ULL * 1024ULL * 1024ULL * (x))
@@ -45,7 +59,7 @@ static uint64_t *alloc_sizes;
 /*
  * Data-driven subtest matrix.
  *
- * TYPE_ALL_SIZES / TYPE_SINGLE / TYPE_ARRAY_BIND all exercise exactly one
+ * TYPE_ALL_SIZES / TYPE_RANDOM_SIZE / TYPE_ARRAY_BIND all exercise exactly one
  * engine per invocation, so they're wired up as a dynamic child subtest
  * per engine below (igt_subtest_with_dynamic_f() + igt_dynamic_f()).
  *
@@ -59,6 +73,7 @@ static uint64_t *alloc_sizes;
  */
 enum test_type {
 	TYPE_ALL_SIZES,
+	TYPE_RANDOM_SIZE,
 };
 
 struct test_case {
@@ -337,6 +352,15 @@ static void test_map_bos(int fd, struct bo_alloc *bos, int n_bos)
 	}
 }
 
+static void bo_release(int fd, struct bo_alloc *b)
+{
+	if (b->map)
+		munmap(b->map, b->bo_size);
+	if (b->bo)
+		gem_close(fd, b->bo);
+	bo_alloc_release_va(b);
+}
+
 /*
  * Build and submit one batch for every 4 KiB page of one BO.
  */
@@ -414,15 +438,6 @@ static void execute_multi_bos(int fd, uint32_t exec_queue,
 		execute_bo(fd, exec_queue, &bos[i]);
 }
 
-static void bo_release(int fd, struct bo_alloc *b)
-{
-	if (b->map)
-		munmap(b->map, b->bo_size);
-	if (b->bo)
-		gem_close(fd, b->bo);
-	bo_alloc_release_va(b);
-}
-
 /*
  * Runs prepare + bind + execute for n_bos BOs at once (n_bos == 1
  * reproduces the original single-BO behaviour). If LEAK_BINDING is not
@@ -488,6 +503,88 @@ static struct bo_alloc *test_alloc_size(int fd, uint32_t vm, uint32_t q,
 	return NULL;
 }
 
+static void validate_bo_leak(int fd, uint32_t vm, struct bo_alloc *bos,
+			     int n_bos, uint32_t flags)
+{
+	int i;
+
+	for (i = 0; i < n_bos; ++i)
+		check_exec_data(bos[i].map, bos[i].bo_size >> SZ_4K_SHIFT);
+
+	/* Migrate the whole group back into VRAM, recheck */
+	if (flags & EVICT) {
+		igt_assert_eq(test_bind(fd, vm, bos, n_bos, flags), 0);
+
+		for (i = 0; i < n_bos; ++i)
+			check_exec_data(bos[i].map, bos[i].bo_size >> SZ_4K_SHIFT);
+
+		test_unbind(fd, vm, bos, n_bos);
+	}
+
+	for (i = 0; i < n_bos; ++i)
+		bo_release(fd, &bos[i]);
+}
+
+static void check_leak_multi_group(int fd, uint32_t vm, struct bo_group **groups,
+				   int count, uint32_t flags)
+{
+	int i;
+
+	for (i = 0; i < count; ++i) {
+		if (!groups[i])
+			continue;
+
+		validate_bo_leak(fd, vm, groups[i]->bos, groups[i]->n_bos, flags);
+		free(groups[i]);
+	}
+}
+
+static void alloc_rand_size_bos(int fd, struct drm_xe_engine_class_instance *hwe,
+				int count, uint64_t vram_per_process, pthread_barrier_t *barrier,
+				uint32_t flags)
+{
+	struct bo_group **leaks = NULL;
+	uint32_t vm, q, bo_size;
+	uint64_t vram_used = 0;
+	int i, max_batches = (count == -1) ? MAX_ALLOCATIONS : count;
+
+	igt_assert(count > 0 || (flags & EVICT && flags & LEAK_BO));
+	leaks = malloc(sizeof(*leaks) * max_batches);
+	igt_assert(leaks);
+
+	vm = xe_vm_create(fd, 0, 0);
+	q =  xe_exec_queue_create(fd, vm, hwe, 0);
+
+	for (i = 0; i < count || vram_used < vram_per_process; ++i) {
+		struct bo_alloc *bo;
+
+		bo_size = alloc_sizes[rand() % N_ALLOC_SIZES];
+
+		igt_assert(i < max_batches);
+		bo = test_alloc_size(fd, vm, q, hwe->gt_id, bo_size, flags,
+				     BO_BIND_BASE_ADDR);
+		if (bo) {
+			leaks[i] = malloc(sizeof(*leaks[i]));
+			igt_assert(leaks[i]);
+
+			leaks[i]->bos = bo;
+			leaks[i]->n_bos = 1;
+
+			vram_used += bo->bo_size;
+		} else {
+			leaks[i] = NULL;
+		}
+	}
+
+	if (barrier)
+		pthread_barrier_wait(barrier);
+	check_leak_multi_group(fd, vm, leaks, i, flags);
+
+	xe_exec_queue_destroy(fd, q);
+	xe_vm_destroy(fd, vm);
+	free(leaks);
+}
+
 static void all_sizes_once(int fd, struct drm_xe_engine_class_instance *hwe)
 {
 	uint32_t vm, q;
@@ -544,6 +641,9 @@ static void run_gt_dynamic_subtests(int fd, const struct test_case *t)
 			case TYPE_ALL_SIZES:
 				all_sizes_once(fd, hwe);
 				break;
+			case TYPE_RANDOM_SIZE:
+				alloc_rand_size_bos(fd, hwe, t->count, 0, NULL, t->flags);
+				break;
 			default:
 				break;
 
@@ -555,7 +655,7 @@ static void run_gt_dynamic_subtests(int fd, const struct test_case *t)
 /*
  * Data-driven subtest matrix.
  *
- * TYPE_ALL_SIZES / TYPE_SINGLE / TYPE_ARRAY_BIND all exercise exactly one
+ * TYPE_ALL_SIZES / TYPE_RANDOM_SIZE / TYPE_ARRAY_BIND all exercise exactly one
  * engine per invocation, so they're wired up as a dynamic child subtest
  * per engine below (igt_subtest_with_dynamic_f() + igt_dynamic_f()).
  *
@@ -570,6 +670,9 @@ static void run_gt_dynamic_subtests(int fd, const struct test_case *t)
 
 static const struct test_case test_matrix[] = {
 	{ "all-sizes-once", 0, 0, TYPE_ALL_SIZES, false },
+	{ "rand-sizes-10", 10, 0, TYPE_RANDOM_SIZE, false },
+	{ "rand-sizes-100", 100, 0, TYPE_RANDOM_SIZE, false },
+	{ "rand-sizes-100-unaligned", 100, UNALIGNED, TYPE_RANDOM_SIZE, false },
 };
 
 int igt_main()
@@ -586,6 +689,7 @@ int igt_main()
 
 		switch (t->type) {
 		case TYPE_ALL_SIZES:
+		case TYPE_RANDOM_SIZE:
 			igt_subtest_with_dynamic_f("%s", t->name)
 				run_gt_dynamic_subtests(fd, t);
 		}
-- 
2.52.0

