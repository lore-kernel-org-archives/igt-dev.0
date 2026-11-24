Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD1A606A31E
	for <igt-dev@archiver.kernel.org>; Tue, 24 Nov 2026 12:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TTjIEF2J
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD6C10E69A;
	Tue, 24 Nov 2026 12:16:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C92F10F537
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 12:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795522486; x=1827058486;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r9kqNAIVkMi0ZqvzGnIG0Pbo0YBWXsgM3w1fsATaIt4=;
 b=TTjIEF2JDZqQ2qf0b55BWwt/LEQqRhU1rKWBMSwu3uJap6PBbnHIgtcj
 fXxJ7pPRdp7H52+lqdcKzChBisnuRBO5kk18CzdW4Uxt1MvPd5LzXFPeH
 hehcGoASETRfcJ13jBOlNBHjZ2dS3ShbnZFuvpQ8XKjTj4IdRngcNBHUC
 lUnf6OHuC3LLZJfl+3DRHdTquXZblkAX9MVuITuehQwuwRpm+Mek0dISE
 xpmh5wSOJqJE7TAgj1Bxl/nLz9BqrAAi/MDOMeFLhKtBiVyPN6ANlYUf5
 /GJfcGqY2yW4Lxv2XwC7tsUy02oF2G572TqmFKKLvYBwQY24XDMT4ZjVG g==;
X-CSE-ConnectionGUID: +BhkmZa7S/e9bLH00EK9BA==
X-CSE-MsgGUID: 5nGKaIG1QIiicKmcCPrJ4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4252824"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4252824"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 04:12:06 -0800
X-CSE-ConnectionGUID: hphR8wolTNayg1TtsdmOjw==
X-CSE-MsgGUID: 4qK4yUG8RiSfLg9BKxXQCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11850109"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by fmviesa008.fm.intel.com with ESMTP; 24 Nov 2026 04:12:05 -0800
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	nishit.sharma@intel.com
Cc: priyanka.dandamudi@intel.com, matthew.brost@intel.com,
 kamil.konieczny@intel.com
Subject: [PATCH i-g-t v8 4/5] tests/intel: Add threaded random-size allocation
 stress tests
Date: Tue, 24 Nov 2026 12:12:02 +0000
Message-ID: <20261124121203.592758-5-sobin.thomas@intel.com>
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

Add a new TYPE_THREAD test mode that creates a worker thread per
available engine and performs random-sized BO allocations concurrently.

Each thread creates its own VM and execution queue and exercises the
existing allocation path with both aligned and unaligned bind addresses.
Additional variants cover leaked bindings.

These tests provide additional stress coverage for concurrent BO
allocation and VM bind activity across multiple engines.

v6:
- Use rand_r(seed) instead of rand(). (Priyanka)
- Advance bind VA per transaction. (Priyanka)
- Use engines[i] instead of engines [i%n_found]. (Priyanka)

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_bo_alloc.c | 184 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 178 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_bo_alloc.c b/tests/intel/xe_bo_alloc.c
index c2cc0a301..cf75ae111 100644
--- a/tests/intel/xe_bo_alloc.c
+++ b/tests/intel/xe_bo_alloc.c
@@ -29,6 +29,8 @@
 #define SZ_4K_SHIFT	12
 #define MAX_ALLOCATIONS 50000
 #define N_BOS_PER_BIND	10
+#define GB(x) (1024ULL * 1024ULL * 1024ULL * (x))
+#define THREAD_VA_STRIDE GB(1)
 
 /**
  * SUBTEST: all-sizes-once
@@ -69,6 +71,25 @@
  * Description: Allocate and retain batches of 10 random-sized BOs, each bound
  * as a single array of binds, until VRAM is overcommited, then validate them.
  * Test category: functionality test
+ *
+ * SUBTEST: threads-rand-sizes-50
+ * Description: Test 50 random BO allocation sizes in test table with a thread per engine
+ * Test category: stress test
+ *
+ * SUBTEST: threads-rand-sizes-50-unaligned
+ * Description: Test 50 random BO allocation sizes in test table with a thread per engine,
+ * with bind addresses unaligned to BO size
+ * Test category: stress test
+ *
+ * SUBTEST: threads-leak-binding-rand-sizes-50
+ * Description: Test 50 random BO allocation sizes in test table with a thread per engine,
+ * leak the binding
+ * Test category: stress test
+ *
+ * SUBTEST: threads-leak-binding-rand-sizes-50-unaligned
+ * Description: Test 50 random BO allocation sizes in test table with a thread per engine,
+ * leak the binding, with bind addresses unaligned to BO size
+ * Test category: stress test
  */
 
 #define N_ALLOC_SIZES	256
@@ -83,6 +104,7 @@ enum test_type {
 	TYPE_ALL_SIZES,
 	TYPE_RANDOM_SIZE,
 	TYPE_ARRAY_BIND,
+	TYPE_THREAD,
 };
 
 struct test_case {
@@ -129,6 +151,20 @@ struct batch_data {
 	uint32_t data;
 };
 
+struct thread_data {
+	uint64_t va_base;
+	pthread_t thread;
+	pthread_mutex_t *mutex;
+	pthread_cond_t *cond;
+	struct drm_xe_engine_class_instance *hwe;
+	int fd;
+	int count;
+	uint32_t vm;
+	uint32_t flags;
+	unsigned int seed;
+	bool *go;
+};
+
 /*
  * Reserve a chunk of process address space to use as the VM bind address
  * for a BO, and hand back a pointer inside it aligned either to bo_size
@@ -701,6 +737,112 @@ static void all_sizes_once(int fd, struct drm_xe_engine_class_instance *hwe)
 }
 
 
+static void *bo_alloc_thread_fn(void *data)
+{
+	struct thread_data *t = data;
+	uint32_t q;
+	uint64_t va = t->va_base;
+	int i;
+
+	igt_assert(!(t->flags & LEAK_BO));
+
+	pthread_mutex_lock(t->mutex);
+	while (!*t->go)
+		pthread_cond_wait(t->cond, t->mutex);
+	pthread_mutex_unlock(t->mutex);
+
+	q = xe_exec_queue_create(t->fd, t->vm, t->hwe, 0);
+
+	for (i = 0; i < t->count; ++i) {
+		uint64_t size = alloc_sizes[rand_r(&t->seed) % N_ALLOC_SIZES];
+
+		test_alloc_size(t->fd, t->vm, q, t->hwe->gt_id,
+				size, t->flags, va);
+		va += size;
+	}
+
+	xe_exec_queue_destroy(t->fd, q);
+
+	return NULL;
+}
+
+static void run_threaded_bo_alloc_test(int fd, int count, uint32_t flags)
+{
+	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_engine_class_instance **engines;
+	struct thread_data *threads_data;
+	pthread_mutex_t mutex;
+	pthread_cond_t cond;
+	bool begin_work = false;
+	int n_found = 0, n_threads = 0, i, ret;
+
+	xe_for_each_engine(fd, hwe)
+		n_found++;
+
+	igt_assert(n_found > 0);
+
+	engines = calloc(n_found, sizeof(*engines));
+	igt_assert(engines);
+
+	i = 0;
+	xe_for_each_engine(fd, hwe)
+		engines[i++] = hwe;
+
+	threads_data = calloc(n_found, sizeof(*threads_data));
+	igt_assert(threads_data);
+
+	pthread_mutex_init(&mutex, NULL);
+	pthread_cond_init(&cond, NULL);
+
+	for (i = 0; i < n_found; ++i) {
+		threads_data[i].mutex = &mutex;
+		threads_data[i].cond = &cond;
+		/* reuse engine 0 if only one exists */
+		threads_data[i].hwe = engines[i];
+		threads_data[i].fd = fd;
+		threads_data[i].count = count;
+		threads_data[i].vm = xe_vm_create(fd, 0, 0);
+		threads_data[i].flags = flags;
+		threads_data[i].go = &begin_work;
+		threads_data[i].seed = i + 1;
+		threads_data[i].va_base = BO_BIND_BASE_ADDR + (uint64_t)i * THREAD_VA_STRIDE;
+		ret = pthread_create(&threads_data[i].thread, 0, bo_alloc_thread_fn,
+				     &threads_data[i]);
+		if (ret) {
+			igt_warn("Thread creation failed for engine %d: %s, Continuing with %d threads\n",
+				 i, strerror(ret), n_threads);
+			break;
+		}
+		n_threads++;
+	}
+	igt_assert_f(n_threads > 0, "No worker threads could be created\n");
+	ret = pthread_mutex_lock(&mutex);
+	igt_assert_eq(ret, 0);
+	begin_work = true;
+	ret = pthread_cond_broadcast(&cond);
+	igt_assert_eq(ret, 0);
+	ret = pthread_mutex_unlock(&mutex);
+	igt_assert_eq(ret, 0);
+
+	for (i = 0; i < n_threads; ++i) {
+		ret = pthread_join(threads_data[i].thread, NULL);
+		igt_assert_eq(ret, 0);
+	}
+
+	/* VM destroy will be done for successful threads */
+	for (i = 0; i < n_found; ++i) {
+		if (threads_data[i].vm)
+			xe_vm_destroy(fd, threads_data[i].vm);
+	}
+
+	ret = pthread_cond_destroy(&cond);
+	igt_assert_eq(ret, 0);
+	ret = pthread_mutex_destroy(&mutex);
+	igt_assert_eq(ret, 0);
+	free(threads_data);
+	free(engines);
+}
+
 static void run_gt_dynamic_subtests(int fd, const struct test_case *t)
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -763,10 +905,19 @@ static void run_gt_dynamic_subtests(int fd, const struct test_case *t)
 }
 
 /*
- * Data-driven subtest matrix.
- *
- * Each entry becomes a subtest with one dynamic child per GT.
- */
+* Data-driven subtest matrix.
+* Each entry becomes a subtest with one dynamic child per GT.
+* TYPE_ALL_SIZES / TYPE_RANDOM_SIZE / TYPE_ARRAY_BIND all exercise exactly one
+* engine per invocation, so they're wired up as a dynamic child subtest
+* per engine below (igt_subtest_with_dynamic_f() + igt_dynamic_f()).
+*
+* TYPE_THREAD are deliberately NOT split per engine here:
+* threads() already do their own xe_for_each_engine() to  spawn one thread per
+* engine internally. Wrapping those in a  second, outer per-engine loop would
+* run the full all-engine fan-out once for every engine on the machine,
+* multiplying the runtime by the engine count and re-exercising every engine
+* N times over. So these stay flat, single subtests.
+*/
 
 static const struct test_case test_matrix[] = {
 	{ "all-sizes-once", 0, 0, TYPE_ALL_SIZES, false },
@@ -779,6 +930,11 @@ static const struct test_case test_matrix[] = {
 	{ "array-binds-rand-sizes-10-unaligned", 10, ARRAY_BIND | LEAK_BO | UNALIGNED,
 	   TYPE_ARRAY_BIND, true },
 	{ "array-binds-rand-sizes-evict", -1, ARRAY_BIND | LEAK_BO | EVICT, TYPE_ARRAY_BIND, true },
+	{ "threads-rand-sizes-50", 50, 0, TYPE_THREAD, false },
+	{ "threads-rand-sizes-50-unaligned", 50, UNALIGNED, TYPE_THREAD, false },
+	{ "threads-leak-binding-rand-sizes-50", 50, LEAK_BINDING, TYPE_THREAD, false },
+	{ "threads-leak-binding-rand-sizes-50-unaligned", 50, LEAK_BINDING | UNALIGNED,
+	   TYPE_THREAD, false },
 };
 
 int igt_main()
@@ -792,8 +948,24 @@ int igt_main()
 
 	for (i = 0; i < ARRAY_SIZE(test_matrix); ++i) {
 		const struct test_case *t = &test_matrix[i];
-		igt_subtest_with_dynamic_f("%s", t->name)
-			run_gt_dynamic_subtests(fd, t);
+
+		switch (t->type) {
+		case TYPE_THREAD:
+			igt_subtest_f("%s", t->name) {
+				if (t->requires_evict_ram) {
+					igt_require(xe_has_vram(fd));
+					igt_require(igt_get_avail_ram_mb() >=
+						    (xe_visible_vram_size(fd, 0) >> 20) / 2);
+				}
+				run_threaded_bo_alloc_test(fd, t->count, t->flags);
+			}
+			break;
+		case TYPE_ALL_SIZES:
+		case TYPE_RANDOM_SIZE:
+		case TYPE_ARRAY_BIND:
+			igt_subtest_with_dynamic_f("%s", t->name)
+				run_gt_dynamic_subtests(fd, t);
+		}
 	}
 
 	igt_fixture() {
-- 
2.55.0

