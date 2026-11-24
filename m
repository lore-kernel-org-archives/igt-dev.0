Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4581606A321
	for <igt-dev@archiver.kernel.org>; Tue, 24 Nov 2026 12:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RHhHgI6l
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F27810F52E;
	Tue, 24 Nov 2026 12:15:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A82BC10F52E
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 12:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795522485; x=1827058485;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B/Q6PU2e1SLrWwjsRNrgiG8njFKM88XC2tlmQbKCca8=;
 b=RHhHgI6ltXWAo7wRUac2IyOTBxzcYLct6WnKZB+ekzX2mAe8fyCF43Rp
 xviz1FWywrUkF/Aajh0O/NHXTKp9uPMc8NKKpHOifkwbUVs5bw/YUQN6k
 hP6VkCRFlXOKGuEfzMh0Irko/I1E5T9evXWsZaIGgnq0ai7g2JrucUP6y
 aWYB+eKBvf3WEsI4xrIDskuaWuPBhqPxy1dmVXgTw547ROV/rFLDiYZup
 Gv80U7cXX6N/9dkvCHcR1rfjoxzUz0OXIuYmoR+xC3YuhZvBCBNEGPqo1
 5/Bw2izfAkNoiFXfpHCjHzPylCRj8EezNDMNy7XTruc+4X2UpXyKa5UsC g==;
X-CSE-ConnectionGUID: wqGZcwh8R4WriKqestHjjA==
X-CSE-MsgGUID: hLIqEUhrSluxPQBPXDD4bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4252822"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4252822"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 04:12:05 -0800
X-CSE-ConnectionGUID: T3DldB1dQb2WdmxPnrUYpw==
X-CSE-MsgGUID: 2pRxdtKCR2C2ZNHSgM+51g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11850102"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by fmviesa008.fm.intel.com with ESMTP; 24 Nov 2026 04:12:04 -0800
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	nishit.sharma@intel.com
Cc: priyanka.dandamudi@intel.com, matthew.brost@intel.com,
 kamil.konieczny@intel.com
Subject: [PATCH i-g-t v8 2/5] tests/intel: Add random-size BO leak tests
Date: Tue, 24 Nov 2026 12:12:00 +0000
Message-ID: <20261124121203.592758-3-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124121203.592758-1-sobin.thomas@intel.com>
References: <20261124121203.592758-1-sobin.thomas@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
v7:
- Keep an explicit assertion for unhandled test types.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_bo_alloc.c | 120 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/tests/intel/xe_bo_alloc.c b/tests/intel/xe_bo_alloc.c
index 38d581d18..80b1ae887 100644
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
+ * Description: Test 100 random BO allocation sizes, with bind address not aligned to BO size
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
 
 #define N_ALLOC_SIZES	256
@@ -44,6 +65,7 @@ static uint64_t *alloc_sizes;
  */
 enum test_type {
 	TYPE_ALL_SIZES,
+	TYPE_RANDOM_SIZE,
 };
 
 struct test_case {
@@ -54,8 +76,14 @@ struct test_case {
 	bool requires_evict_ram;
 };
 
+struct bo_group {
+	struct bo_alloc *bos;
+	int n_bos;
+};
+
 #define LEAK_BINDING		(0x1 << 0)
 #define LEAK_BO			(0x1 << 1)
+#define EVICT			(0x1 << 2)
 #define UNALIGNED		(0x1 << 3)
 
 /*
@@ -466,6 +494,85 @@ static struct bo_alloc *test_alloc_size(int fd, uint32_t vm, uint32_t q,
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
+	/* Rebind to force migration back to VRAM, rechec */
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
+				int count, uint64_t vram_target, uint32_t flags)
+{
+	struct bo_group **leaks = NULL;
+	uint32_t vm, q;
+	uint64_t vram_used = 0, bo_size;
+	int i, max_batches = (count == -1) ? MAX_ALLOCATIONS : count;
+
+	igt_assert(count > 0 || (flags & EVICT && flags & LEAK_BO));
+	leaks = malloc(sizeof(*leaks) * max_batches);
+	igt_assert(leaks);
+
+	vm = xe_vm_create(fd, 0, 0);
+	q = xe_exec_queue_create(fd, vm, hwe, 0);
+
+	for (i = 0; i < count || vram_used < vram_target; ++i) {
+		struct bo_alloc *bo;
+
+		bo_size = alloc_sizes[rand() % N_ALLOC_SIZES];
+
+		igt_assert(i < max_batches);
+		bo = test_alloc_sizes(fd, vm, q, hwe->gt_id, &bo_size, 1, flags, BO_BIND_BASE_ADDR);
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
@@ -487,6 +594,7 @@ static void run_gt_dynamic_subtests(int fd, const struct test_case *t)
 	uint16_t seen_gt[64];
 	int n_seen = 0, j;
 	bool dup;
+	uint64_t vram_target;
 
 	if (t->requires_evict_ram) {
 		igt_require(xe_has_vram(fd));
@@ -517,11 +625,18 @@ static void run_gt_dynamic_subtests(int fd, const struct test_case *t)
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
 				igt_assert_f(0, "Unhandled test type %d\n", t->type);
 
@@ -538,6 +653,11 @@ static void run_gt_dynamic_subtests(int fd, const struct test_case *t)
 
 static const struct test_case test_matrix[] = {
 	{ "all-sizes-once", 0, 0, TYPE_ALL_SIZES, false },
+	{ "rand-sizes-10", 10, 0, TYPE_RANDOM_SIZE, false },
+	{ "rand-sizes-100", 100, 0, TYPE_RANDOM_SIZE, false },
+	{ "rand-sizes-100-unaligned", 100, UNALIGNED, TYPE_RANDOM_SIZE, false },
+	{ "rand-sizes-leak-100", 100, LEAK_BO, TYPE_RANDOM_SIZE, false },
+	{ "rand-sizes-evict", -1, LEAK_BO | EVICT, TYPE_RANDOM_SIZE, true },
 };
 
 int igt_main()
-- 
2.55.0

