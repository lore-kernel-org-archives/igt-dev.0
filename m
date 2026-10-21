Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF11606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 21 Oct 2026 17:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BS4bv+Pq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B32D10E394;
	Wed, 21 Oct 2026 17:43:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA09F10E313
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2026 17:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792604447; x=1824140447;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fgHoHXo1djG6i3giw+wOCsZPg7+liG5MaMTWJ0jPjik=;
 b=BS4bv+PqEw8cMZ3vbQ8zU3LPhbHvF0ZZOtSu5vYkuOfCej/Jw8s+5x7f
 I3maUvLJ9xDCsFbzhxi/gkXtF2YcQA+lv5XRCiDyhFxfWLPVIBnKYBLS2
 TbFbaqYUflOPQac8BUFJiCQ0rNRpUmZrFjdOnCGpB12JBKXn419gWAuiZ
 T3QjL9Jk8h0MSz2kc9lZ3BKuBkB1ipt0lFlPQh1hupMseYQy/6LRNVZAS
 bJU1frpgcsz/LwWtNiass72PERgWeNKqccllqAYoj8gnKu4RZ175gUpdD
 /Cu+jrI2ENMzao3oTI+rF3naRrMnpxZ7fsMjo4WM3L4bewcKStgryVKDi w==;
X-CSE-ConnectionGUID: ZjtMcRrdTCCEHeTYgDXsMQ==
X-CSE-MsgGUID: 9b69A2WsRDSKlCR7K4E8nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1346952"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1346952"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 10:40:44 -0700
X-CSE-ConnectionGUID: pPAMfYDwTcKJCnh5oHnIBQ==
X-CSE-MsgGUID: ahaOEHzsRKWbFD/ZePdCLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="4942679"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 10:40:44 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	nishit.sharma@intel.com
Cc: priyanka.dandamudi@intel.com, matthew.brost@intel.com,
 kamil.konieczny@intel.com, Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v7 4/5] tests/intel: Add threaded random-size allocation
 stress tests
Date: Wed, 21 Oct 2026 17:40:30 +0000
Message-ID: <20261021174032.18337-5-sobin.thomas@intel.com>
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
 tests/intel/xe_bo_alloc.c | 166 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 164 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_bo_alloc.c b/tests/intel/xe_bo_alloc.c
index 1b3bef79a..dbaa389df 100644
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
@@ -64,6 +66,25 @@
  * Description: Test 10 batches of 10 random BO allocation sizes bound together as a single
  * array of binds, with bind addresses unaligned to BO size
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
@@ -78,6 +99,7 @@ enum test_type {
 	TYPE_ALL_SIZES,
 	TYPE_RANDOM_SIZE,
 	TYPE_ARRAY_BIND,
+	TYPE_THREAD,
 };
 
 struct test_case {
@@ -124,6 +146,20 @@ struct batch_data {
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
@@ -696,6 +732,112 @@ static void all_sizes_once(int fd, struct drm_xe_engine_class_instance *hwe)
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
@@ -773,6 +915,11 @@ static const struct test_case test_matrix[] = {
 	{ "array-binds-rand-sizes-10", 10, ARRAY_BIND | LEAK_BO, TYPE_ARRAY_BIND, true },
 	{ "array-binds-rand-sizes-10-unaligned", 10, ARRAY_BIND | LEAK_BO | UNALIGNED,
 	   TYPE_ARRAY_BIND, true },
+	{ "threads-rand-sizes-50", 50, 0, TYPE_THREAD, false },
+	{ "threads-rand-sizes-50-unaligned", 50, UNALIGNED, TYPE_THREAD, false },
+	{ "threads-leak-binding-rand-sizes-50", 50, LEAK_BINDING, TYPE_THREAD, false },
+	{ "threads-leak-binding-rand-sizes-50-unaligned", 50, LEAK_BINDING | UNALIGNED,
+	   TYPE_THREAD, false },
 };
 
 int igt_main()
@@ -787,8 +934,23 @@ int igt_main()
 	for (i = 0; i < ARRAY_SIZE(test_matrix); ++i) {
 		const struct test_case *t = &test_matrix[i];
 
-		igt_subtest_with_dynamic_f("%s", t->name)
-			run_gt_dynamic_subtests(fd, t);
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

