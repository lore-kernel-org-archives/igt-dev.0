Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685C4C982FA
	for <igt-dev@archiver.kernel.org>; Tue, 22 Sep 2026 11:07:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1021110E6B9;
	Tue, 22 Sep 2026 11:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C0pF7/2I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B6D10E6B9
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Sep 2026 11:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790075081; x=1821611081;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b130lAfjtclnMmJowQ4b3RSLLQ4CHM1BQXoqWspAoh0=;
 b=C0pF7/2I+7/mITJqABdfPZHwa4tQLxIFMjXdrmat6g7A0dHlv++4TXeX
 YC/q584Jlym30zKZkb03jQbI7Eop422gwk77K8D7KcH5n6y32xjESEcW+
 AJBYGfyq0w6JD/gvW8ePq0GpmhX4ZODozZcty2HyDMzzddJUlHico1Nkq
 THLdoMhxUcOzDflpkSdovkIKPkzS9o90zto1jT4cdmdujTzDmjSui0Itp
 MT2dxwI5+uENzbazaihKrCKRCbDuXUwE2r3OTWFU/jmpyd2Q27piSY2IL
 MZZqQUkm6f/u6kpG6tigHQBVUo9IU+nQCSQXUM4OSkS6njhSSH0enDB0f A==;
X-CSE-ConnectionGUID: mRAnUsN0Ss6lbI2zMNoi3A==
X-CSE-MsgGUID: VOsSt3E7SwK23lvdcCN1Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="78220521"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="78220521"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 04:04:40 -0700
X-CSE-ConnectionGUID: 7FD50+AeQuerLfsAT7x5bA==
X-CSE-MsgGUID: rZfSemBmRBibEpQ/kozLow==
X-ExtLoop1: 1
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by fmviesa003.fm.intel.com with ESMTP; 22 Sep 2026 04:04:40 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	matthew.brost@intel.com
Cc: nishit.sharma@intel.com,
	priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t v5 4/5] tests/intel: Add threaded random-size allocation
 stress tests
Date: Tue, 22 Sep 2026 11:04:37 +0000
Message-ID: <20260922110438.2402109-5-sobin.thomas@intel.com>
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

Add a new TYPE_THREAD test mode that creates a worker thread per
available engine and performs random-sized BO allocations concurrently.

Each thread creates its own VM and execution queue and exercises the
existing allocation path with both aligned and unaligned bind addresses.
Additional variants cover leaked bindings.

These tests provide additional stress coverage for concurrent BO
allocation and VM bind activity across multiple engines.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_bo_alloc.c | 149 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 148 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_bo_alloc.c b/tests/intel/xe_bo_alloc.c
index 343d07626..d8368087b 100644
--- a/tests/intel/xe_bo_alloc.c
+++ b/tests/intel/xe_bo_alloc.c
@@ -56,6 +56,26 @@
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
@@ -82,7 +102,8 @@ static uint64_t *alloc_sizes;
 enum test_type {
 	TYPE_ALL_SIZES,
 	TYPE_RANDOM_SIZE,
-	TYPE_ARRAY_BIND
+	TYPE_ARRAY_BIND,
+	TYPE_THREAD
 };
 
 struct test_case {
@@ -129,6 +150,20 @@ struct batch_data {
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
@@ -766,6 +801,103 @@ static void alloc_random_size_bos_array_bind(int fd, struct drm_xe_engine_class_
 	free(leaks);
 }
 
+static void *bo_alloc_thread_fn(void *data)
+{
+	struct thread_data *t = data;
+	uint32_t q;
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
+	for (i = 0; i < t->count; ++i)
+		test_alloc_size(t->fd, t->vm, q, t->hwe->gt_id,
+				alloc_sizes[rand() % N_ALLOC_SIZES],
+				t->flags, t->va_base);
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
+		if (ret)
+			break;
+		n_threads++;
+	}
+
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
+	/* vm is created for every slot up to n_found regardless of thread creation success */
+	for (i = 0; i < n_found; ++i)
+		xe_vm_destroy(fd, threads_data[i].vm);
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
@@ -849,6 +981,11 @@ static const struct test_case test_matrix[] = {
 	{ "array-binds-rand-sizes-10", 10, ARRAY_BIND, TYPE_ARRAY_BIND, true },
 	{ "array-binds-rand-sizes-10-unaligned", 10,  ARRAY_BIND | UNALIGNED, TYPE_ARRAY_BIND,
 	  true },
+	{ "threads-rand-sizes-50", 50, 0, TYPE_THREAD, false },
+	{ "threads-rand-sizes-50-unaligned", 50, UNALIGNED, TYPE_THREAD, false },
+	{ "threads-leak-binding-rand-sizes-50", 50, LEAK_BINDING, TYPE_THREAD, false },
+	{ "threads-leak-binding-rand-sizes-50-unaligned", 50, LEAK_BINDING | UNALIGNED,
+	  TYPE_THREAD, false },
 };
 
 int igt_main()
@@ -864,6 +1001,16 @@ int igt_main()
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
2.52.0

