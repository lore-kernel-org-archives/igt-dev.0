Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BD2CA601C
	for <igt-dev@archiver.kernel.org>; Fri,  9 Oct 2026 10:31:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A5E112058;
	Fri,  9 Oct 2026 10:31:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BEjzxDhV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AFE4112047
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Oct 2026 10:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791541715; x=1823077715;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HLgaWkuoePKzfa4IoCJRnynWvGSKYAdMNPsS9NDM0Qw=;
 b=BEjzxDhVFa9T/n+RQ4P3gNoHupsFAv8SH1SLlkzlUYALq3ak6OgxB+oA
 K05VCM2M9uxpBLS5s79xLFeK64h141RsEsUuIpbeb4qjGZHentFHb+Eix
 r3AXr/14qpl4Fiw00f0EUk1s7zzz/QP4xWCIhKB7ct9/heild+V2mrxAP
 ODS7dzjDe3aonB9rb4XO/6XhWKaZ+uSH51IscI3qajyILaYTGZMqNcWJ+
 d6DRrLA+RK+mJn/Qyq2fwnjGhlNI856bOmKcgksIyPgUzvkFgGvXzpBn1
 q424qCjE8cMmXHOO7CkKDDziaLIrIdn3PM4lJ3iNCcK03jSIcTuF/WJ5n g==;
X-CSE-ConnectionGUID: VL4Z81phQVeV3lEpqkY7OQ==
X-CSE-MsgGUID: GyP30zAMSLeiI6kQhlai7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="218779"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="218779"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 03:28:34 -0700
X-CSE-ConnectionGUID: 3ZqaShjARyOtDskTkTx/ww==
X-CSE-MsgGUID: Ldw64HDSSG25Ysz0NfBdsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="621484"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by fmviesa006.fm.intel.com with ESMTP; 09 Oct 2026 03:28:34 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	matthew.brost@intel.com
Cc: nishit.sharma@intel.com,
	priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t v6 2/5] tests/intel: Add random-size BO leak tests
Date: Fri,  9 Oct 2026 10:28:29 +0000
Message-ID: <20261009102832.2839902-3-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009102832.2839902-1-sobin.thomas@intel.com>
References: <20261009102832.2839902-1-sobin.thomas@intel.com>
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
- rand-sizes-evict
- rand-sizes-leak-100

v6:
- Set LEAK_BO for rand-sizes-* so leak path is verified.(Priyanka)
- Add rand-sizes-evict subtest which uses EVICT path ( Priyanka)
- Drop unused pthread barrier parameter (Priyanka)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_bo_alloc.c | 143 +++++++++++++++++++++++++++++++++++---
 1 file changed, 132 insertions(+), 11 deletions(-)

diff --git a/tests/intel/xe_bo_alloc.c b/tests/intel/xe_bo_alloc.c
index 9bf27813c..31e2ef72e 100644
--- a/tests/intel/xe_bo_alloc.c
+++ b/tests/intel/xe_bo_alloc.c
@@ -27,11 +27,32 @@
 #include "xe_drm.h"
 #define BO_BIND_BASE_ADDR	0x1a0000ull
 #define SZ_4K_SHIFT	12
+#define MAX_ALLOCATIONS 50000
 
 /**
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
+ * SUBTEST: rand-sizes-leak-100
+ * Description: Allocate and retain 100 randomly sized BOs, then validate their contents
+ * Test category: functionality test
+ *
+ * SUBTEST: rand-sizes-evict
+ * Description: Allocate and retain random-sized BOs until VRAM is overcommitted, then validate them
+ * Test category: functionality test
  */
 
 #define GB(x) (1024ULL * 1024ULL * 1024ULL * (x))
@@ -42,7 +63,7 @@ static uint64_t *alloc_sizes;
 /*
  * Data-driven subtest matrix.
  *
- * TYPE_ALL_SIZES / TYPE_SINGLE / TYPE_ARRAY_BIND all exercise exactly one
+ * TYPE_ALL_SIZES / TYPE_RANDOM_SIZE / TYPE_ARRAY_BIND all exercise exactly one
  * engine per invocation, so they're wired up as a dynamic child subtest
  * per engine below (igt_subtest_with_dynamic_f() + igt_dynamic_f()).
  *
@@ -56,6 +77,7 @@ static uint64_t *alloc_sizes;
  */
 enum test_type {
 	TYPE_ALL_SIZES,
+	TYPE_RANDOM_SIZE,
 };
 
 struct test_case {
@@ -66,6 +88,11 @@ struct test_case {
 	bool requires_evict_ram;
 };
 
+struct bo_group {
+	struct bo_alloc *bos;
+	int n_bos;
+};
+
 #define LEAK_BINDING		(0x1 << 0)
 #define LEAK_BO			(0x1 << 1)
 #define EVICT			(0x1 << 2)
@@ -329,6 +356,15 @@ static void test_map_bos(int fd, struct bo_alloc *bos, int n_bos)
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
@@ -406,15 +442,6 @@ static void execute_multi_bos(int fd, uint32_t exec_queue,
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
@@ -480,6 +507,86 @@ static struct bo_alloc *test_alloc_size(int fd, uint32_t vm, uint32_t q,
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
+		free(groups[i]->bos);
+		free(groups[i]);
+	}
+}
+
+static void alloc_rand_size_bos(int fd, struct drm_xe_engine_class_instance *hwe,
+				int count, uint64_t vram_per_process, uint32_t flags)
+{
+	struct bo_group **leaks = NULL;
+	uint32_t vm, q;
+	uint64_t vram_used = 0, bo_size = 0;
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
@@ -501,6 +608,7 @@ static void run_gt_dynamic_subtests(int fd, const struct test_case *t)
 	uint16_t seen_gt[64];
 	int n_seen = 0, j;
 	bool dup;
+	uint64_t vram_target;
 
 	if (t->requires_evict_ram) {
 		igt_require(xe_has_vram(fd));
@@ -531,11 +639,18 @@ static void run_gt_dynamic_subtests(int fd, const struct test_case *t)
 		igt_assert(n_seen < ARRAY_SIZE(seen_gt));
 		seen_gt[n_seen++] = hwe->gt_id;
 
+		/* 1.5x visible VRAM of this GT so EVICT exceeds capacity by half */
+		vram_target = (t->flags & EVICT) ?
+				xe_visible_vram_size(fd, hwe->gt_id) * 3 / 2 : 0;
+
 		igt_dynamic_f("gt%u", hwe->gt_id) {
 			switch (t->type) {
 			case TYPE_ALL_SIZES:
 				all_sizes_once(fd, hwe);
 				break;
+			case TYPE_RANDOM_SIZE:
+				alloc_rand_size_bos(fd, hwe, t->count, vram_target, t->flags);
+				break;
 			default:
 				break;
 
@@ -547,7 +662,7 @@ static void run_gt_dynamic_subtests(int fd, const struct test_case *t)
 /*
  * Data-driven subtest matrix.
  *
- * TYPE_ALL_SIZES / TYPE_SINGLE / TYPE_ARRAY_BIND all exercise exactly one
+ * TYPE_ALL_SIZES / TYPE_RANDOM_SIZE / TYPE_ARRAY_BIND all exercise exactly one
  * engine per invocation, so they're wired up as a dynamic child subtest
  * per engine below (igt_subtest_with_dynamic_f() + igt_dynamic_f()).
  *
@@ -562,6 +677,11 @@ static void run_gt_dynamic_subtests(int fd, const struct test_case *t)
 
 static const struct test_case test_matrix[] = {
 	{ "all-sizes-once", 0, 0, TYPE_ALL_SIZES, false },
+	{ "rand-sizes-10", 10, 0, TYPE_RANDOM_SIZE, false },
+	{ "rand-sizes-100", 100, 0, TYPE_RANDOM_SIZE, false },
+	{ "rand-sizes-100-unaligned", 100, UNALIGNED, TYPE_RANDOM_SIZE, false },
+	{ "rand-sizes-leak-100", 100, LEAK_BO, TYPE_RANDOM_SIZE, false },
+	{ "rand-sizes-evict", -1, LEAK_BO | EVICT, TYPE_RANDOM_SIZE, true },
 };
 
 int igt_main()
@@ -578,6 +698,7 @@ int igt_main()
 
 		switch (t->type) {
 		case TYPE_ALL_SIZES:
+		case TYPE_RANDOM_SIZE:
 			igt_subtest_with_dynamic_f("%s", t->name)
 				run_gt_dynamic_subtests(fd, t);
 		}
-- 
2.55.0

