Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385ADCA6019
	for <igt-dev@archiver.kernel.org>; Fri,  9 Oct 2026 10:31:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59928112057;
	Fri,  9 Oct 2026 10:31:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ln+nDaQC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 960C5112047
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Oct 2026 10:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791541715; x=1823077715;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NQTRZA8ONPVSKLHGME3Dy5KWJshG3G5aj3wjvSrS1/c=;
 b=Ln+nDaQC38BgQmQ43gSQysUpgOWAh3T9vt3FXG0xJY00zsqf6exWmR3o
 bJsr+NX6cFJz/dZP7FoQt4MsNBIxdR+pESLIdw1L3KoPw116hnr6n7IeS
 2VJeLHq/ot6UqX4grIU4wCVIK9SiQvGRc6Dzu4tH6XRuZNfYP468D/puw
 uU2OTeiASiWet/X0FxMw8BickeEcGomqBrWrX34uNbAJkDRi4RYrdxJ6s
 tcsOXIuI0nXsaRijX6+S2PHgMnrrj8Kut9pJKhrRW/v23O1t7TPZDrtx0
 cGP3JdLrqRgh4kjllXUlCOp0sx6/WML2Z6wHgX5xHANmotxGbaalDGpDQ g==;
X-CSE-ConnectionGUID: PNJh1c3WSqmsF/IASh5wNQ==
X-CSE-MsgGUID: 9kyIZKkDRIKTkJA5xdwchg==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="218781"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="218781"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 03:28:35 -0700
X-CSE-ConnectionGUID: EUONYNWcTbi3pcZBuWELXA==
X-CSE-MsgGUID: uxb0NyZ2T5myyJctd9lVCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="621490"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by fmviesa006.fm.intel.com with ESMTP; 09 Oct 2026 03:28:34 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	matthew.brost@intel.com
Cc: nishit.sharma@intel.com,
	priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t v6 4/5] tests/intel: Add threaded random-size allocation
 stress tests
Date: Fri,  9 Oct 2026 10:28:31 +0000
Message-ID: <20261009102832.2839902-5-sobin.thomas@intel.com>
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

Add a new TYPE_THREAD test mode that creates a worker thread per
available engine and performs random-sized BO allocations concurrently.

Each thread creates its own VM and execution queue and exercises the
existing allocation path with both aligned and unaligned bind addresses.
Additional variants cover leaked bindings.

These tests provide additional stress coverage for concurrent BO
allocation and VM bind activity across multiple engines.

v6:
- Use rand_r(seed) instead of rand(). (Priyanka)
- Advance bind VA per transaction so leaked binding dont overlap. (Priyanka)
- Use engines[i] instead of engines [i%n_found]. (Priyanka)

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_bo_alloc.c | 157 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 157 insertions(+)

diff --git a/tests/intel/xe_bo_alloc.c b/tests/intel/xe_bo_alloc.c
index 5d983160e..4b62be299 100644
--- a/tests/intel/xe_bo_alloc.c
+++ b/tests/intel/xe_bo_alloc.c
@@ -29,6 +29,7 @@
 #define SZ_4K_SHIFT	12
 #define MAX_ALLOCATIONS 50000
 #define N_BOS_PER_BIND	10
+#define THREAD_VA_STRIDE GB(1)
 
 /**
  * SUBTEST: all-sizes-once
@@ -64,6 +65,26 @@
  * Description: Test 10 batches of 10 random BO allocation sizes bound together as a single
  * array of binds, unaligned bind addresses
  * Test category: functionality test
+ *
+ *
+ * SUBTEST: threads-rand-sizes-50
+ * Description: Test 50 random bo allocation sizes in test table with a thread per engine
+ * test category: stress test
+ *
+ * SUBTEST: threads-rand-sizes-50-unaligned
+ * Description: Test 50 random bo allocation sizes in test table with a thread per engine,
+ * unaligned bind addresses
+ * test category: stress test
+ *
+ * SUBTEST: threads-leak-binding-rand-sizes-50
+ * Description: Test 50 random BO allocation sizes in test table with a thread per engine,
+ * leak the binding
+ * Test category: stress test
+ *
+ * SUBTEST: threads-leak-binding-rand-sizes-50-unaligned
+ * Description: Test 50 random BO allocation sizes in test table with a thread per engine,
+ * leak the binding, unaligned bind addresses
+ * Test category: stress test
  */
 #define GB(x) (1024ULL * 1024ULL * 1024ULL * (x))
 
@@ -89,6 +110,7 @@ enum test_type {
 	TYPE_ALL_SIZES,
 	TYPE_RANDOM_SIZE,
 	TYPE_ARRAY_BIND,
+	TYPE_THREAD,
 };
 
 struct test_case {
@@ -135,6 +157,20 @@ struct batch_data {
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
@@ -765,6 +801,112 @@ static void alloc_random_size_bos_array_bind(int fd, struct drm_xe_engine_class_
 	free(leaks);
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
+	q =  xe_exec_queue_create(t->fd, t->vm, t->hwe, 0);
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
+	pthread_mutex_init(&mutex, 0);
+	pthread_cond_init(&cond, 0);
+
+	for (i = 0; i < n_found; ++i) {
+		threads_data[i].mutex = &mutex;
+		threads_data[i].cond = &cond;
+		/* reuse engine 0 if only one exists */
+		threads_data[i].hwe = engines[i % n_found];
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
@@ -855,6 +997,11 @@ static const struct test_case test_matrix[] = {
 	{ "array-binds-rand-sizes-10", 10, ARRAY_BIND | LEAK_BO, TYPE_ARRAY_BIND, true },
 	{ "array-binds-rand-sizes-10-unaligned", 10,  ARRAY_BIND | LEAK_BO | UNALIGNED,
 	   TYPE_ARRAY_BIND, true },
+	{ "threads-rand-sizes-50", 50, 0, TYPE_THREAD, false },
+	{ "threads-rand-sizes-50-unaligned", 50, UNALIGNED, TYPE_THREAD, false },
+	{ "threads-leak-binding-rand-sizes-50", 50, LEAK_BINDING, TYPE_THREAD, false },
+	{ "threads-leak-binding-rand-sizes-50-unaligned", 50, LEAK_BINDING | UNALIGNED,
+	   TYPE_THREAD, false },
 };
 
 int igt_main()
@@ -870,6 +1017,16 @@ int igt_main()
 		const struct test_case *t = &test_matrix[i];
 
 		switch (t->type) {
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
 		case TYPE_ALL_SIZES:
 		case TYPE_RANDOM_SIZE:
 		case TYPE_ARRAY_BIND:
-- 
2.55.0

