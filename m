Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582C4606A31D
	for <igt-dev@archiver.kernel.org>; Wed, 21 Oct 2026 17:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cy5SX/4S
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1130110E353;
	Wed, 21 Oct 2026 17:43:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CCD910E35F
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2026 17:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792604446; x=1824140446;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tEVpTGJLzBxxvPcAvl+LhJ+7xCcLudpeLR+51bJbMw4=;
 b=cy5SX/4SlA+iHPrWLEF3EDiHXM39gz+4mqidNei/h0qzSzrCLyPq748u
 Xyv0Utn8G1vURGfHDPMYLqFj9aaWT/xmtxwk/eWH10CL0k4DzNONqMBi8
 znP8+BVdSd/oYMAm8oYOPxydBrl3TBKoh17/RLQBlo8yP7wFVVa+0lvNC
 Se0VyLE0W75kVYr+3pSv+23I23vhTrpHFnZ+aXXr+Rjm2GHywzrZatWoX
 qaK3i/QTpZvRAgvc6FdTEymwa8sISzQ48qYwXJe+KdMfoA/l+pcnSiglg
 3WeNd8DLRpofg0yWhjCAbg/vK5EOFnjc7c2GJuVT3TkBJLDgk+em3vYWO w==;
X-CSE-ConnectionGUID: 24zHH9NJQGW/9fLBpp6f+w==
X-CSE-MsgGUID: N0uL37zJTEOi3DjUmNmy2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1346951"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1346951"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 10:40:43 -0700
X-CSE-ConnectionGUID: 7CPGroXaTZqR1NbF35Ykag==
X-CSE-MsgGUID: GvnhxuqDRcaIH39Rt10gDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="4942671"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 10:40:43 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	nishit.sharma@intel.com
Cc: priyanka.dandamudi@intel.com, matthew.brost@intel.com,
 kamil.konieczny@intel.com, Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v7 3/5] tests/intel: Add array-of-binds random-size
 allocation tests
Date: Wed, 21 Oct 2026 17:40:29 +0000
Message-ID: <20261021174032.18337-4-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021174032.18337-1-sobin.thomas@intel.com>
References: <20261021174032.18337-1-sobin.thomas@intel.com>
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_bo_alloc.c | 153 +++++++++++++++++++++++++++++++++-----
 1 file changed, 134 insertions(+), 19 deletions(-)

diff --git a/tests/intel/xe_bo_alloc.c b/tests/intel/xe_bo_alloc.c
index 80b1ae887..1b3bef79a 100644
--- a/tests/intel/xe_bo_alloc.c
+++ b/tests/intel/xe_bo_alloc.c
@@ -28,6 +28,7 @@
 #define BO_BIND_BASE_ADDR	0x1a0000ull
 #define SZ_4K_SHIFT	12
 #define MAX_ALLOCATIONS 50000
+#define N_BOS_PER_BIND	10
 
 /**
  * SUBTEST: all-sizes-once
@@ -53,6 +54,16 @@
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
  */
 
 #define N_ALLOC_SIZES	256
@@ -66,6 +77,7 @@ static uint64_t *alloc_sizes;
 enum test_type {
 	TYPE_ALL_SIZES,
 	TYPE_RANDOM_SIZE,
+	TYPE_ARRAY_BIND,
 };
 
 struct test_case {
@@ -85,6 +97,7 @@ struct bo_group {
 #define LEAK_BO			(0x1 << 1)
 #define EVICT			(0x1 << 2)
 #define UNALIGNED		(0x1 << 3)
+#define ARRAY_BIND		(0x1 << 4)
 
 /*
  * Represents a single BO under test: its reserved VA range, the BO handle,
@@ -169,6 +182,28 @@ static void bo_alloc_reserve_va(struct bo_alloc *b, uint32_t flags, uint64_t va_
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
@@ -245,11 +280,7 @@ static void create_bo_arr(int fd, uint32_t vm, struct bo_alloc *bos,  int n_bos,
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
@@ -299,8 +330,77 @@ static int test_bind_individual(int fd, uint32_t vm, struct bo_alloc *bos, int n
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
 
@@ -532,14 +632,16 @@ static void check_leak_multi_group(int fd, uint32_t vm, struct bo_group **groups
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
 
@@ -547,20 +649,25 @@ static void alloc_rand_size_bos(int fd, struct drm_xe_engine_class_instance *hwe
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
@@ -579,7 +686,7 @@ static void all_sizes_once(int fd, struct drm_xe_engine_class_instance *hwe)
 	int i;
 
 	vm = xe_vm_create(fd, 0, 0);
-	q =  xe_exec_queue_create(fd, vm, hwe, 0);
+	q = xe_exec_queue_create(fd, vm, hwe, 0);
 
 	for (i = 0; i < N_ALLOC_SIZES; ++i)
 		test_alloc_size(fd, vm, q, hwe->gt_id, alloc_sizes[i], 0, BO_BIND_BASE_ADDR);
@@ -588,6 +695,7 @@ static void all_sizes_once(int fd, struct drm_xe_engine_class_instance *hwe)
 	xe_vm_destroy(fd, vm);
 }
 
+
 static void run_gt_dynamic_subtests(int fd, const struct test_case *t)
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -635,7 +743,11 @@ static void run_gt_dynamic_subtests(int fd, const struct test_case *t)
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
@@ -658,6 +770,9 @@ static const struct test_case test_matrix[] = {
 	{ "rand-sizes-100-unaligned", 100, UNALIGNED, TYPE_RANDOM_SIZE, false },
 	{ "rand-sizes-leak-100", 100, LEAK_BO, TYPE_RANDOM_SIZE, false },
 	{ "rand-sizes-evict", -1, LEAK_BO | EVICT, TYPE_RANDOM_SIZE, true },
+	{ "array-binds-rand-sizes-10", 10, ARRAY_BIND | LEAK_BO, TYPE_ARRAY_BIND, true },
+	{ "array-binds-rand-sizes-10-unaligned", 10, ARRAY_BIND | LEAK_BO | UNALIGNED,
+	   TYPE_ARRAY_BIND, true },
 };
 
 int igt_main()
-- 
2.55.0

