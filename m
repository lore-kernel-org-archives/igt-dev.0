Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C295C982FA
	for <igt-dev@archiver.kernel.org>; Tue, 22 Sep 2026 11:09:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33FB310E6B9;
	Tue, 22 Sep 2026 11:09:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Irb7JhTi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4674310E6BE
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Sep 2026 11:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790075081; x=1821611081;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aA8x5Vpn6+kXMuAlWbmqupIGeCvQMByIA2ESPztOfU8=;
 b=Irb7JhTijmwmmLQLkWQlT577RJ0bTpgp0tI+yKKezutAJYR9tmMVHtWl
 3MiDXUqZFoCSUqoOCU5olNGhHym2icDwgWZHvdFil8kioN1UfrBk6zoWw
 qLOKZErJMc9fbln44vYtbP3gCFdolIryeZ2s2nWU1utteS/p+w1rkz5/X
 qoDouy3F+esQYEatcwwyaCac51mCOcH3gLuwpeBPi7Jg+XjqeTdsXm6LQ
 BZEK0YtrnnyEw/Hlqm0XO0dRg5bzclZuwosrrkzsCNNIul3JuVUffeFNg
 5nV0KCvY/5/6ab9/zAVtb6X2Molmbwku79djRZVnflC26sdJMKZl74FDR w==;
X-CSE-ConnectionGUID: BG0wfLJETb+9ox706+b5nw==
X-CSE-MsgGUID: RwFwIGzLQ/m/jRI1qF7SXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="78220520"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="78220520"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 04:04:40 -0700
X-CSE-ConnectionGUID: G7HIVcBwQZKrP2eoRSHfXw==
X-CSE-MsgGUID: mIvOAh1qSdOMfrUj+E9OaA==
X-ExtLoop1: 1
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by fmviesa003.fm.intel.com with ESMTP; 22 Sep 2026 04:04:40 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	matthew.brost@intel.com
Cc: nishit.sharma@intel.com,
	priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t v5 3/5] tests/intel: Add array-of-binds random-size
 allocation tests
Date: Tue, 22 Sep 2026 11:04:36 +0000
Message-ID: <20260922110438.2402109-4-sobin.thomas@intel.com>
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

Add new array-binds-rand-sizes-* subtests that allocate batches of
random-sized BOs and bind them using a single array-of-binds operation.

The new tests allocate 10 BOs per batch and exercise both aligned and
unaligned bind addresses. This extends existing eviction coverage by
verifying that BOs with varying sizes can be bound, managed and evicted
correctly when submitted as a single bind array rather than individual
bind operations.

Introduce alloc_random_size_bos_array_bind(), which mirrors the existing
random-size allocation flow while grouping multiple BOs into a single
array bind submission. This is particularly useful for eviction testing
where a set of BOs needs to be resident or evicted as a unit.

The tests are intended to provide additional coverage for array-of-binds
handling under random allocation patterns and VRAM pressure scenarios.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_bo_alloc.c | 177 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 177 insertions(+)

diff --git a/tests/intel/xe_bo_alloc.c b/tests/intel/xe_bo_alloc.c
index bd5bf5a33..343d07626 100644
--- a/tests/intel/xe_bo_alloc.c
+++ b/tests/intel/xe_bo_alloc.c
@@ -47,7 +47,15 @@
  * Description: Test 100 random BO allocation sizes in test table, unaligned bind addresses
  * Test category: functionality test
  *
+ * SUBTEST: array-binds-rand-sizes-10
+ * Description: Test 10 batches of 10 random BO allocation sizes each bound together as a
+ * single array of binds
+ * Test category: functionality test
  *
+ * SUBTEST: array-binds-rand-sizes-10-unaligned
+ * Description: Test 10 batches of 10 random BO allocation sizes bound together as a single
+ * array of binds, unaligned bind addresses
+ * Test category: functionality test
  */
 
 #define GB(x) (1024ULL * 1024ULL * 1024ULL * (x))
@@ -74,6 +82,7 @@ static uint64_t *alloc_sizes;
 enum test_type {
 	TYPE_ALL_SIZES,
 	TYPE_RANDOM_SIZE,
+	TYPE_ARRAY_BIND
 };
 
 struct test_case {
@@ -178,6 +187,28 @@ static void bo_alloc_reserve_va(struct bo_alloc *b, uint32_t flags, uint64_t va_
 	igt_assert_eq_u64(b->gpu_va % align, 0);
 }
 
+static int __xe_vm_bind_array(int fd, uint32_t vm,
+			      struct drm_xe_vm_bind_op *bind_ops,
+			      uint32_t num_bind, struct drm_xe_sync *sync,
+			      uint32_t num_syncs)
+{
+	struct drm_xe_vm_bind bind = {
+		.vm_id = vm,
+		.num_binds = num_bind,
+		.vector_of_binds = (uintptr_t)bind_ops,
+		.num_syncs = num_syncs,
+		.syncs = (uintptr_t)sync,
+		.exec_queue_id = 0,
+	};
+
+	igt_assert(num_bind > 0);
+
+	if (igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind))
+		return -errno;
+
+	return 0;
+}
+
 static void alloc_sizes_init(void)
 {
 	int i;
@@ -254,6 +285,7 @@ static void create_bo_arr(int fd, uint32_t vm, struct bo_alloc *bos,  int n_bos,
 	}
 }
 
+
 /*
  * BIND step: bind one or more BOs as a single array-of-binds ioctl call
  * (see __xe_vm_bind_array() above), replacing the previous open-coded
@@ -308,8 +340,72 @@ static int test_bind_individual(int fd, uint32_t vm, struct bo_alloc *bos, int n
 	return 0;
 }
 
+static int test_bind_array(int fd, uint32_t vm,
+			   struct bo_alloc *bos, int n_bos)
+{
+	struct drm_xe_vm_bind_op *bind_ops;
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.handle = syncobj_create(fd, 0),
+	};
+	int i, ret;
+
+	igt_assert(n_bos > 0);
+
+	bind_ops = calloc(n_bos, sizeof(*bind_ops));
+	igt_assert(bind_ops);
+
+	for (i = 0; i < n_bos; i++) {
+		igt_assert_f(bos[i].bo,
+			     "BO[%d] was not created before bind\n", i);
+
+		igt_assert_f(bos[i].bo_size,
+			     "BO[%d] has zero size\n", i);
+
+		bind_ops[i] = (struct drm_xe_vm_bind_op) {
+			.obj = bos[i].bo,
+			.obj_offset = 0,
+			.range = bos[i].bo_size,
+			.addr = bos[i].gpu_va,
+			.op = DRM_XE_VM_BIND_OP_MAP,
+			.flags = 0,
+		};
+
+		igt_debug("Bind op[%d]: bo=%u size=%#llx addr=%#llx\n",
+			  i,
+			  bos[i].bo,
+			  (unsigned long long)bos[i].bo_size,
+			  (unsigned long long)bos[i].gpu_va);
+	}
+
+	ret = __xe_vm_bind_array(fd, vm, bind_ops, n_bos, &sync, 1);
+	if (ret) {
+		if (ret == -ENOMEM || ret == -ENOSPC) {
+			syncobj_destroy(fd, sync.handle);
+			free(bind_ops);
+			return ret;
+		}
+
+		igt_assert_f(false, "Array VM_BIND failed: ret=%d errno=%d (%s)\n",
+			     ret, errno, strerror(errno));
+	}
+
+	igt_assert_f(syncobj_wait(fd, &sync.handle, 1,
+				  INT64_MAX, 0, NULL),
+		     "Timed out waiting for array VM_BIND\n");
+
+	syncobj_destroy(fd, sync.handle);
+	free(bind_ops);
+
+	return 0;
+}
+
 static int test_bind(int fd, uint32_t vm, struct bo_alloc *bos, int n_bos, uint32_t flags)
 {
+	if (flags & ARRAY_BIND)
+		return test_bind_array(fd, vm, bos, n_bos);
+	else
 		return test_bind_individual(fd, vm, bos, n_bos);
 }
 
@@ -600,6 +696,76 @@ static void all_sizes_once(int fd, struct drm_xe_engine_class_instance *hwe)
 	xe_vm_destroy(fd, vm);
 }
 
+/*
+ * Same idea as alloc_rand_size_bos(), but each iteration binds N_BOS_PER_BIND BOs
+ * together via a single array-of-binds call instead of one at a time.
+ * Used by the array-binds-* subtests, in particular the eviction stress
+ * test where several BOs need to be resident (or evicted) as a unit.
+ */
+#define N_BOS_PER_BIND	10
+
+static void alloc_random_size_bos_array_bind(int fd, struct drm_xe_engine_class_instance *hwe,
+					     int count, uint64_t vram_per_process,
+					     pthread_barrier_t *barrier, uint32_t flags,
+					     unsigned int *seed)
+{
+	struct bo_group **leaks = NULL;
+	uint32_t vm, exec_queue;
+	uint64_t vram_used = 0;
+	int i, max_batches = (count == -1) ? MAX_ALLOCATIONS : count;
+	int n_batches = 0;
+
+	igt_debug("count=%d max_batches=%d vram_per_process=%llu flags=%x\n",
+		  count, max_batches, (unsigned long long)vram_per_process, flags);
+
+	igt_assert(count > 0 || (flags & EVICT && flags & LEAK_BO));
+
+	leaks = malloc(sizeof(*leaks) * max_batches);
+	igt_assert(leaks);
+
+	vm = xe_vm_create(fd, 0, 0);
+	exec_queue =  xe_exec_queue_create(fd, vm, hwe, 0);
+
+	for (i = 0; i < count || vram_used < vram_per_process; ++i) {
+		uint64_t sizes[N_BOS_PER_BIND];
+		struct bo_alloc *bos;
+		int j;
+
+		for (j = 0; j < N_BOS_PER_BIND; ++j)
+			sizes[j] = alloc_sizes[rand_r(seed) % N_ALLOC_SIZES];
+
+		igt_assert_f(i < max_batches, "Failed to reach %llu bytes of VRAM pressure "
+			     " after %d batches (currently reached %llu bytes)\n",
+			     (unsigned long long)vram_per_process, max_batches,
+			     (unsigned long long)vram_used);
+
+		bos = test_alloc_sizes(fd, vm, exec_queue, hwe->gt_id, sizes,
+				       N_BOS_PER_BIND, flags, BO_BIND_BASE_ADDR);
+		if (bos) {
+			leaks[i] = malloc(sizeof(*leaks[i]));
+			igt_assert(leaks[i]);
+
+			leaks[i]->bos = bos;
+			leaks[i]->n_bos = N_BOS_PER_BIND;
+			n_batches++;
+
+			for (j = 0; j < N_BOS_PER_BIND; ++j)
+				vram_used += bos[j].bo_size;
+		} else {
+			leaks[i] = NULL;
+		}
+	}
+
+	if (barrier)
+		pthread_barrier_wait(barrier);
+
+	check_leak_multi_group(fd, vm, leaks, n_batches, flags);
+
+	xe_exec_queue_destroy(fd, exec_queue);
+	xe_vm_destroy(fd, vm);
+	free(leaks);
+}
+
 static void run_gt_dynamic_subtests(int fd, const struct test_case *t)
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -644,6 +810,13 @@ static void run_gt_dynamic_subtests(int fd, const struct test_case *t)
 			case TYPE_RANDOM_SIZE:
 				alloc_rand_size_bos(fd, hwe, t->count, 0, NULL, t->flags);
 				break;
+			case TYPE_ARRAY_BIND: {
+				unsigned int seed = hwe->gt_id + 1;
+
+				alloc_random_size_bos_array_bind(fd, hwe, t->count, 0, NULL,
+								 t->flags, &seed);
+				break;
+			}
 			default:
 				break;
 
@@ -673,6 +846,9 @@ static const struct test_case test_matrix[] = {
 	{ "rand-sizes-10", 10, 0, TYPE_RANDOM_SIZE, false },
 	{ "rand-sizes-100", 100, 0, TYPE_RANDOM_SIZE, false },
 	{ "rand-sizes-100-unaligned", 100, UNALIGNED, TYPE_RANDOM_SIZE, false },
+	{ "array-binds-rand-sizes-10", 10, ARRAY_BIND, TYPE_ARRAY_BIND, true },
+	{ "array-binds-rand-sizes-10-unaligned", 10,  ARRAY_BIND | UNALIGNED, TYPE_ARRAY_BIND,
+	  true },
 };
 
 int igt_main()
@@ -690,6 +866,7 @@ int igt_main()
 		switch (t->type) {
 		case TYPE_ALL_SIZES:
 		case TYPE_RANDOM_SIZE:
+		case TYPE_ARRAY_BIND:
 			igt_subtest_with_dynamic_f("%s", t->name)
 				run_gt_dynamic_subtests(fd, t);
 		}
-- 
2.52.0

