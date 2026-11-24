Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0169606A334
	for <igt-dev@archiver.kernel.org>; Tue, 24 Nov 2026 12:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c1oydg5E
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF0610F546;
	Tue, 24 Nov 2026 12:19:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B0A610F52E
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 12:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795522490; x=1827058490;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KcomtRQf5eWvFWf7kLoVtEWkfaHZ3OL4Zf7Fzpd7Y4k=;
 b=c1oydg5EdvIOGB1gfSz2FymTVIcijKvyWX3dwz8Pg7j/aQhwRFfhKa5Z
 Q7DZ0YhPJk/vQghEkOp21V8F/PNG14JzMzDoBKMLe4ITlk+NCPrBJjY70
 mt2ECmgsVkaCgbHwTC2CQ+ejaKk6mrc76wlSjco/BRBIYzqfvk81aEZj2
 NobxKSEXHmCnsIVTHmNPXqdY0W4U4yeBdSHxLCWb3OZGr2X3i2icgsR7G
 7uqDaW7f9pkEkvsCnNGsZ3dFsanRWXAl2qgdsh5dr1/1/eso2Vb7ix1to
 gN5kSOAyMutLJ9TkKd9NJUo+/ezK02lTLre3zAMyaQyP6F6V0A7MLbczt A==;
X-CSE-ConnectionGUID: EukyLvaeTz+YDp9UTTVb6w==
X-CSE-MsgGUID: FskN8EtqSVSaOpzewsuFVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4252823"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4252823"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 04:12:06 -0800
X-CSE-ConnectionGUID: GZvg1+17Qpiz+Zd8LY0Wxw==
X-CSE-MsgGUID: gEtavZNqTTmP93zKlG6moA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11850105"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by fmviesa008.fm.intel.com with ESMTP; 24 Nov 2026 04:12:05 -0800
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	nishit.sharma@intel.com
Cc: priyanka.dandamudi@intel.com, matthew.brost@intel.com,
 kamil.konieczny@intel.com
Subject: [PATCH i-g-t v8 3/5] tests/intel: Add array-of-binds random-size
 allocation tests
Date: Tue, 24 Nov 2026 12:12:01 +0000
Message-ID: <20261124121203.592758-4-sobin.thomas@intel.com>
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

v6:
- Replaced n_batches with loop variable i ( Priyanka)
v7:
- Optimized alloc_rand_size_bos function
v8:
- Added the test for evict in matrix for array-of-binds
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_bo_alloc.c | 160 +++++++++++++++++++++++++++++++++-----
 1 file changed, 140 insertions(+), 20 deletions(-)

diff --git a/tests/intel/xe_bo_alloc.c b/tests/intel/xe_bo_alloc.c
index 80b1ae887..c2cc0a301 100644
--- a/tests/intel/xe_bo_alloc.c
+++ b/tests/intel/xe_bo_alloc.c
@@ -28,6 +28,7 @@
 #define BO_BIND_BASE_ADDR	0x1a0000ull
 #define SZ_4K_SHIFT	12
 #define MAX_ALLOCATIONS 50000
+#define N_BOS_PER_BIND	10
 
 /**
  * SUBTEST: all-sizes-once
@@ -53,6 +54,21 @@
  * SUBTEST: rand-sizes-evict
  * Description: Allocate and retain random-sized BOs until VRAM is overcommitted, then validate them
  * Test category: functionality test
+ *
+ * SUBTEST: array-binds-rand-sizes-10
+ * Description: Test 10 batches of 10 random BO allocation sizes each bound together as a
+ * single array of binds
+ * Test category: functionality test
+ *
+ * SUBTEST: array-binds-rand-sizes-10-unaligned
+ * Description: Test 10 batches of 10 random BO allocation sizes bound together as a single
+ * array of binds, with bind addresses unaligned to BO size
+ * Test category: functionality test
+ *
+ * SUBTEST: array-binds-rand-sizes-evict
+ * Description: Allocate and retain batches of 10 random-sized BOs, each bound
+ * as a single array of binds, until VRAM is overcommited, then validate them.
+ * Test category: functionality test
  */
 
 #define N_ALLOC_SIZES	256
@@ -66,6 +82,7 @@ static uint64_t *alloc_sizes;
 enum test_type {
 	TYPE_ALL_SIZES,
 	TYPE_RANDOM_SIZE,
+	TYPE_ARRAY_BIND,
 };
 
 struct test_case {
@@ -85,6 +102,7 @@ struct bo_group {
 #define LEAK_BO			(0x1 << 1)
 #define EVICT			(0x1 << 2)
 #define UNALIGNED		(0x1 << 3)
+#define ARRAY_BIND		(0x1 << 4)
 
 /*
  * Represents a single BO under test: its reserved VA range, the BO handle,
@@ -169,6 +187,28 @@ static void bo_alloc_reserve_va(struct bo_alloc *b, uint32_t flags, uint64_t va_
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
@@ -245,11 +285,7 @@ static void create_bo_arr(int fd, uint32_t vm, struct bo_alloc *bos,  int n_bos,
 	}
 }
 
-/*
- * BIND step: bind one or more BOs as a single array-of-binds ioctl call
- * (see __xe_vm_bind_array() above), replacing the previous open-coded
- * xe_vm_bind_sync() called once per BO.
- */
+/* Bind BOs one VM_BIND each; signal only after the last */
 static int test_bind_individual(int fd, uint32_t vm, struct bo_alloc *bos, int n_bos)
 {
 	struct drm_xe_sync sync = {
@@ -299,8 +335,77 @@ static int test_bind_individual(int fd, uint32_t vm, struct bo_alloc *bos, int n
 	return 0;
 }
 
+/*
+ * BIND step: bind one or more BOs as a single array-of-binds ioctl call
+ * (see __xe_vm_bind_array() above), replacing the previous open-coded
+ * xe_vm_bind_sync() called once per BO.
+ */
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
+		igt_assert_f(false, "Array VM_BIND failed: ret=%d (%s)\n",
+			     ret, strerror(-ret));
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
+
 	return test_bind_individual(fd, vm, bos, n_bos);
 }
 
@@ -532,14 +637,16 @@ static void check_leak_multi_group(int fd, uint32_t vm, struct bo_group **groups
 }
 
 static void alloc_rand_size_bos(int fd, struct drm_xe_engine_class_instance *hwe,
-				int count, uint64_t vram_target, uint32_t flags)
+				int count, int n_per_bind,  uint64_t vram_target,
+				uint32_t flags)
 {
 	struct bo_group **leaks = NULL;
 	uint32_t vm, q;
-	uint64_t vram_used = 0, bo_size;
+	uint64_t vram_used = 0;
 	int i, max_batches = (count == -1) ? MAX_ALLOCATIONS : count;
 
-	igt_assert(count > 0 || (flags & EVICT && flags & LEAK_BO));
+	igt_assert(n_per_bind > 0 && n_per_bind <= N_BOS_PER_BIND);
+	igt_assert(count > 0 || ((flags & EVICT) && (flags & LEAK_BO)));
 	leaks = malloc(sizeof(*leaks) * max_batches);
 	igt_assert(leaks);
 
@@ -547,20 +654,25 @@ static void alloc_rand_size_bos(int fd, struct drm_xe_engine_class_instance *hwe
 	q = xe_exec_queue_create(fd, vm, hwe, 0);
 
 	for (i = 0; i < count || vram_used < vram_target; ++i) {
-		struct bo_alloc *bo;
-
-		bo_size = alloc_sizes[rand() % N_ALLOC_SIZES];
+		uint64_t sizes[N_BOS_PER_BIND];
+		struct bo_alloc *bos;
+		int j;
 
 		igt_assert(i < max_batches);
-		bo = test_alloc_sizes(fd, vm, q, hwe->gt_id, &bo_size, 1, flags, BO_BIND_BASE_ADDR);
-		if (bo) {
+
+		for (j = 0; j < n_per_bind; ++j)
+			sizes[j] = alloc_sizes[rand() % N_ALLOC_SIZES];
+
+		bos = test_alloc_sizes(fd, vm, q, hwe->gt_id, sizes, n_per_bind, flags,
+				       BO_BIND_BASE_ADDR);
+		if (bos) {
 			leaks[i] = malloc(sizeof(*leaks[i]));
 			igt_assert(leaks[i]);
 
-			leaks[i]->bos = bo;
-			leaks[i]->n_bos = 1;
-
-			vram_used += bo->bo_size;
+			leaks[i]->bos = bos;
+			leaks[i]->n_bos = n_per_bind;
+			for (j = 0; j < n_per_bind; ++j)
+				vram_used += bos[j].bo_size;
 		} else {
 			leaks[i] = NULL;
 		}
@@ -579,7 +691,7 @@ static void all_sizes_once(int fd, struct drm_xe_engine_class_instance *hwe)
 	int i;
 
 	vm = xe_vm_create(fd, 0, 0);
-	q =  xe_exec_queue_create(fd, vm, hwe, 0);
+	q = xe_exec_queue_create(fd, vm, hwe, 0);
 
 	for (i = 0; i < N_ALLOC_SIZES; ++i)
 		test_alloc_size(fd, vm, q, hwe->gt_id, alloc_sizes[i], 0, BO_BIND_BASE_ADDR);
@@ -588,6 +700,7 @@ static void all_sizes_once(int fd, struct drm_xe_engine_class_instance *hwe)
 	xe_vm_destroy(fd, vm);
 }
 
+
 static void run_gt_dynamic_subtests(int fd, const struct test_case *t)
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -635,7 +748,11 @@ static void run_gt_dynamic_subtests(int fd, const struct test_case *t)
 				all_sizes_once(fd, hwe);
 				break;
 			case TYPE_RANDOM_SIZE:
-				alloc_rand_size_bos(fd, hwe, t->count, vram_target, t->flags);
+				alloc_rand_size_bos(fd, hwe, t->count, 1, vram_target, t->flags);
+				break;
+			case TYPE_ARRAY_BIND:
+				alloc_rand_size_bos(fd, hwe, t->count, N_BOS_PER_BIND,
+						    vram_target, t->flags);
 				break;
 			default:
 				igt_assert_f(0, "Unhandled test type %d\n", t->type);
@@ -658,6 +775,10 @@ static const struct test_case test_matrix[] = {
 	{ "rand-sizes-100-unaligned", 100, UNALIGNED, TYPE_RANDOM_SIZE, false },
 	{ "rand-sizes-leak-100", 100, LEAK_BO, TYPE_RANDOM_SIZE, false },
 	{ "rand-sizes-evict", -1, LEAK_BO | EVICT, TYPE_RANDOM_SIZE, true },
+	{ "array-binds-rand-sizes-10", 10, ARRAY_BIND | LEAK_BO, TYPE_ARRAY_BIND, true },
+	{ "array-binds-rand-sizes-10-unaligned", 10, ARRAY_BIND | LEAK_BO | UNALIGNED,
+	   TYPE_ARRAY_BIND, true },
+	{ "array-binds-rand-sizes-evict", -1, ARRAY_BIND | LEAK_BO | EVICT, TYPE_ARRAY_BIND, true },
 };
 
 int igt_main()
@@ -671,7 +792,6 @@ int igt_main()
 
 	for (i = 0; i < ARRAY_SIZE(test_matrix); ++i) {
 		const struct test_case *t = &test_matrix[i];
-
 		igt_subtest_with_dynamic_f("%s", t->name)
 			run_gt_dynamic_subtests(fd, t);
 	}
-- 
2.55.0

