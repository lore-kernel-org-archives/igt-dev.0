Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D042C606A319
	for <igt-dev@archiver.kernel.org>; Wed, 21 Oct 2026 17:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X1vZSo9u
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89D1110E353;
	Wed, 21 Oct 2026 17:44:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55AA610E344
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2026 17:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792604449; x=1824140449;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SspIj/CzlC4Vkznkb5hTK2hsbrx8NDs1z5pB8C2LgZY=;
 b=X1vZSo9u/1XU8bzX+lZJRgF3VSXjxrtRXvTtGPlSGncFn3+ZNX+g42cW
 M9oYGKjCRWvxbKb4ZrUSkis+UE1e7qMaO3Ej6zyDcy/MKVEiK8pLCSysE
 p8f1wMVVVIvaPeZ8ppG0dmz1xvQm3kldTU4Kev0pDIrOEHvibr89OleZJ
 0m1N2Nqn1ODVDapw8ubwce5dZK7Y+71UzRzX6X5M33V0CA44oJxNb1pDc
 gxpkEzjAWD2lWA4M/s51X9Rb8h1R1R4m22m7j5yxyWIIHLR8sJ04MWG54
 cmEyrfbH/EZH2rcRP0GcrvHIi/nomF2wBvKw1YR5TtlGVDS7hIe/PnFrp A==;
X-CSE-ConnectionGUID: gIMLVA9DSk6+O4tsyfMbhw==
X-CSE-MsgGUID: m5T/Pe8mQdCo+wrV8dfEyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1346954"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1346954"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 10:40:45 -0700
X-CSE-ConnectionGUID: Lx8EpSuMRqiPlZrMgO2GOg==
X-CSE-MsgGUID: bHiG3AFWRuCe8L2Pl7/pBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="4942685"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 10:40:45 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	nishit.sharma@intel.com
Cc: priyanka.dandamudi@intel.com, matthew.brost@intel.com,
 kamil.konieczny@intel.com, Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v7 5/5] tests/intel: Add oversubscribe concurrent bind
 stress subtest
Date: Wed, 21 Oct 2026 17:40:31 +0000
Message-ID: <20261021174032.18337-6-sobin.thomas@intel.com>
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

Add test for oversubscribing VRAM in multi process environment that
creates VM, bind large BOs and submit workloads nearly simultaneously.

Previous coverage lacked a scenario combining multi-process bind
with VRAM oversubscription. This generates memory pressure with
multi-process VM Bind activity and concurrent submission, exercising
the bind pipeline under eviction pressure.

v3: Fixed minor nits
v4: Refactoring of the create_bo ( Nishit)
    Fix child process exit deadlock in release_ready_processes() (Nishit)
v6:
- Abort all child threads and fail with a reaon on timeout (Nishit)
- Track the setup fault , OOM Faults and completed child process.(Nishit)

v7:
- Added  skipped and late_skipped variable to track process at bind and
  rendezvous path.
- Replaced gem_close with cleanup_bo_resources.

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_bo_alloc.c | 641 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 641 insertions(+)

diff --git a/tests/intel/xe_bo_alloc.c b/tests/intel/xe_bo_alloc.c
index dbaa389df..121b48d8b 100644
--- a/tests/intel/xe_bo_alloc.c
+++ b/tests/intel/xe_bo_alloc.c
@@ -32,6 +32,18 @@
 #define GB(x) (1024ULL * 1024ULL * 1024ULL * (x))
 #define THREAD_VA_STRIDE GB(1)
 
+#define INT_ADD_CNT 4
+#define TIMEOUT_NS (30ULL * 1000000000ULL)
+#define MAX_SRAM_TEST_SIZE GB(32)
+#define GPR_RX_ADDR(x)          (0x600 + (x) * 8)
+#define MAX_PROCS 20
+
+#define EXEC_DATA_ADDR         0x100000ULL
+#define EXEC_RESULT_ADDR       0x200000ULL
+#define EXEC_BATCH_ADDR        0x300000ULL
+#define EXEC_UFENCE_ADDR       0x400000ULL
+#define STRESS_BIND_ADDR       0x40000000ULL
+
 /**
  * SUBTEST: all-sizes-once
  * Description: Test all BO allocations sizes in test table
@@ -85,11 +97,57 @@
  * Description: Test 50 random BO allocation sizes in test table with a thread per engine,
  * leak the binding, with bind addresses unaligned to BO size
  * Test category: stress test
+ *
+ * SUBTEST: vm-oversubscribe-concurrent-bind
+ * Description: Oversubscribe VRAM by concurrently binding arrays of deferred-backed
+ * BOs from multiple processes, then validate successful binds with an exec
+ * Test category: stress test
  */
 
+#define MIN_BUFS_PER_PROC 2
+
 #define N_ALLOC_SIZES	256
+#define USER_FENCE_VALUE 0xdeadbeefdeadbeefull
+
 static uint64_t *alloc_sizes;
 
+struct gem_bo {
+	uint32_t handle;
+	uint64_t size;
+	uint32_t *ptr;
+	uint64_t addr;
+};
+
+struct xe_oversubscribe_ctx {
+	uint32_t vm_id;
+	uint32_t exec_queue_id;
+};
+
+struct mem_bind_sync {
+	struct gem_bo *bufs;
+	int n_bufs;
+	uint64_t *binds_ufence;
+};
+
+struct process_data {
+	pthread_mutex_t mutex;
+	pthread_cond_t cond;
+	int ready;
+	int skipped;
+	int late_skipped;
+	int fault_count;
+	int child_completed;
+	int bind_oom;
+	bool go;
+	bool abort;
+};
+
+enum rendezvous_result {
+	RENDEZVOUS_READY,
+	RENDEZVOUS_LATE,
+	RENDEZVOUS_ABORTED,
+};
+
 /*
  * Data-driven subtest matrix.
  *
@@ -100,6 +158,7 @@ enum test_type {
 	TYPE_RANDOM_SIZE,
 	TYPE_ARRAY_BIND,
 	TYPE_THREAD,
+	TYPE_OVERSUBSCRIBE,
 };
 
 struct test_case {
@@ -115,6 +174,14 @@ struct bo_group {
 	int n_bos;
 };
 
+struct oversubscribe_params {
+	int n_proc;
+	int n_vram_bufs;
+	int n_sram_bufs;
+	uint64_t vram_size;
+	uint64_t sram_size;
+	uint64_t total_vram_demand;
+};
 #define LEAK_BINDING		(0x1 << 0)
 #define LEAK_BO			(0x1 << 1)
 #define EVICT			(0x1 << 2)
@@ -240,6 +307,565 @@ static int __xe_vm_bind_array(int fd, uint32_t vm,
 	return 0;
 }
 
+static void init_pdata(struct process_data *pdata)
+{
+	pthread_mutexattr_t mattr;
+	pthread_condattr_t cattr;
+
+	pthread_mutexattr_init(&mattr);
+	igt_assert_eq(pthread_mutexattr_setpshared(&mattr, PTHREAD_PROCESS_SHARED), 0);
+	igt_assert_eq(pthread_mutexattr_setrobust(&mattr, PTHREAD_MUTEX_ROBUST), 0);
+	igt_assert_eq(pthread_mutex_init(&pdata->mutex, &mattr), 0);
+	pthread_mutexattr_destroy(&mattr);
+
+	pthread_condattr_init(&cattr);
+	igt_assert_eq(pthread_condattr_setpshared(&cattr, PTHREAD_PROCESS_SHARED), 0);
+	igt_assert_eq(pthread_condattr_setclock(&cattr, CLOCK_MONOTONIC), 0);
+	igt_assert_eq(pthread_cond_init(&pdata->cond, &cattr), 0);
+	pthread_condattr_destroy(&cattr);
+	pdata->ready = 0;
+	pdata->skipped = 0;
+	pdata->late_skipped = 0;
+	pdata->child_completed = 0;
+	pdata->fault_count = 0;
+	pdata->bind_oom = 0;
+	pdata->go = false;
+	pdata->abort = false;
+}
+
+/*
+ * EOWNERDEAD means the previous owner died holding the robust mutex;
+ * mark it consistent so this process can continue.
+ */
+static void pdata_lock(struct process_data *pdata)
+{
+	int ret = pthread_mutex_lock(&pdata->mutex);
+
+	if (ret == EOWNERDEAD)
+		igt_assert_eq(pthread_mutex_consistent(&pdata->mutex), 0);
+	else
+		igt_assert_eq(ret, 0);
+}
+
+static enum rendezvous_result process_ready_and_wait(struct process_data *pdata)
+{
+	struct timespec timeout;
+	enum rendezvous_result result;
+	int ret;
+
+	pdata_lock(pdata);
+	if (pdata->abort) {
+		pthread_mutex_unlock(&pdata->mutex);
+		return RENDEZVOUS_ABORTED;
+	}
+	/* Admission closes when the parent releases the ready group. */
+	if (pdata->go) {
+		pdata->late_skipped++;
+		pthread_mutex_unlock(&pdata->mutex);
+		return RENDEZVOUS_LATE;
+	}
+	pdata->ready++;
+	pthread_cond_broadcast(&pdata->cond);
+	clock_gettime(CLOCK_MONOTONIC, &timeout);
+	timeout.tv_sec += 2 * TIMEOUT_NS / NSEC_PER_SEC;
+	/* Give the parent time to time out and release the rendezvous first. */
+	while (!pdata->go && !pdata->abort) {
+		ret = pthread_cond_timedwait(&pdata->cond, &pdata->mutex, &timeout);
+		if (ret == EOWNERDEAD) {
+			igt_assert_eq(pthread_mutex_consistent(&pdata->mutex), 0);
+			continue;
+		}
+		if (ret == ETIMEDOUT) {
+			pdata->abort = true;
+			pdata->skipped++;
+			pthread_cond_broadcast(&pdata->cond);
+			break;
+		}
+		igt_assert_eq(ret, 0);
+	}
+	result = pdata->abort ? RENDEZVOUS_ABORTED : RENDEZVOUS_READY;
+	pthread_mutex_unlock(&pdata->mutex);
+	return result;
+}
+
+static void process_setup_failed(struct process_data *pdata, bool fault)
+{
+	pdata_lock(pdata);
+	/* This will be incremented for all real error / OOM */
+	pdata->skipped++;
+	if (fault)
+		pdata->fault_count++; /* Will be incremented for fault case */
+	pthread_cond_broadcast(&pdata->cond);
+	pthread_mutex_unlock(&pdata->mutex);
+}
+
+static void release_ready_processes(struct process_data *pdata, int n_proc)
+{
+	struct timespec timeout;
+	int ret;
+
+	pdata_lock(pdata);
+
+	clock_gettime(CLOCK_MONOTONIC, &timeout);
+	timeout.tv_sec += TIMEOUT_NS / NSEC_PER_SEC;
+	/*
+	 * Wait until all children have either reached VM Bind rendezvous
+	 * Or, failed setup and exited the test path.
+	 */
+	while (!pdata->abort && (pdata->ready + pdata->skipped < n_proc)) {
+		ret = pthread_cond_timedwait(&pdata->cond, &pdata->mutex, &timeout);
+		if (ret == EOWNERDEAD) {
+			igt_assert_eq(pthread_mutex_consistent(&pdata->mutex), 0);
+			continue; /* re-check loop condition */
+		} else if (ret == ETIMEDOUT) {
+			igt_warn("Rendezvous timeout: Continuing with %d of %d children: (skipped=%d)\n",
+				 pdata->ready, n_proc, pdata->skipped);
+			break;
+		}
+		igt_assert_eq(ret, 0);
+	}
+
+	/* Release every successful child into VM_Bind at same time */
+	pdata->go = true;
+	pthread_cond_broadcast(&pdata->cond);
+	pthread_mutex_unlock(&pdata->mutex);
+}
+
+static int build_add_batch(struct gem_bo *batch_bo, struct gem_bo *integers_bo,
+			   struct gem_bo *result_bo, int ints_to_add)
+{
+	int pos = 0;
+	int i;
+	uint64_t tmp_addr;
+
+	batch_bo->ptr[pos++] = MI_LOAD_REGISTER_MEM_CMD | MI_LRI_LRM_CS_MMIO | 2;
+	batch_bo->ptr[pos++] = GPR_RX_ADDR(0);
+	tmp_addr = integers_bo->addr;
+	batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
+	batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
+	for (i = 1; i < ints_to_add; i++) {
+		/* r1 = integers_bo[i] */
+		batch_bo->ptr[pos++] = MI_LOAD_REGISTER_MEM_CMD | MI_LRI_LRM_CS_MMIO | 2;
+		batch_bo->ptr[pos++] = GPR_RX_ADDR(1);
+		tmp_addr = integers_bo->addr + i * sizeof(uint32_t);
+		batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
+		batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
+		/*
+		 * r0 = r0 + r1. The loads write only the low dword of each GPR.
+		 * Each int is rand() % 8 (at most 7), so the sum stays well
+		 * below 2^32 and never carries into the upper dword.
+		 */
+		batch_bo->ptr[pos++] = MI_MATH(4);
+		batch_bo->ptr[pos++] = MI_MATH_LOAD(MI_MATH_REG_SRCA, MI_MATH_REG(0));
+		batch_bo->ptr[pos++] = MI_MATH_LOAD(MI_MATH_REG_SRCB, MI_MATH_REG(1));
+		batch_bo->ptr[pos++] = MI_MATH_ADD;
+		batch_bo->ptr[pos++] = MI_MATH_STORE(MI_MATH_REG(0), MI_MATH_REG_ACCU);
+	}
+	/* result_bo[0] = r0 */
+	batch_bo->ptr[pos++] = MI_STORE_REGISTER_MEM_GEN8 | MI_LRI_LRM_CS_MMIO;
+	batch_bo->ptr[pos++] = GPR_RX_ADDR(0);
+	tmp_addr = result_bo->addr;
+	batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
+	batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
+
+	batch_bo->ptr[pos++] = MI_BATCH_BUFFER_END;
+	while (pos % 4 != 0)
+		batch_bo->ptr[pos++] = MI_NOOP;
+	return pos;
+}
+
+static void create_exec_queue(int fd, struct xe_oversubscribe_ctx *ctx)
+{
+	ctx->exec_queue_id = xe_exec_queue_create(fd, ctx->vm_id,
+						  &xe_engine(fd, 0)->instance, 0);
+}
+
+static uint64_t *
+vm_bind_bo_batch(int fd, struct xe_oversubscribe_ctx *ctx, struct gem_bo *bos, int n_bufs,
+		 int *out_err)
+{
+	uint64_t *ufence;
+	struct drm_xe_sync bind_sync;
+	struct drm_xe_vm_bind_op *binds;
+	int i;
+
+	binds = calloc(n_bufs, sizeof(*binds));
+	igt_assert(binds);
+
+	ufence = calloc(1, sizeof(*ufence));
+	igt_assert(ufence);
+	bind_sync = (struct drm_xe_sync) {
+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.addr = to_user_pointer(ufence),
+		.timeline_value = 1,
+	};
+
+	for (i = 0; i < n_bufs; i++) {
+		binds[i] = (struct drm_xe_vm_bind_op) {
+			.obj = bos[i].handle,
+			.range = bos[i].size,
+			.addr = bos[i].addr,
+			.op = DRM_XE_VM_BIND_OP_MAP,
+		};
+	}
+	*out_err = __xe_vm_bind_array(fd, ctx->vm_id, binds, n_bufs, &bind_sync, 1);
+	free(binds);
+	return ufence;
+}
+
+/* Returns true if the binds succeeded or there was nothing to bind, false on an allowed OOM. */
+static bool bind_bos(int fd, struct xe_oversubscribe_ctx *ctx, struct gem_bo *bufs,
+		    struct mem_bind_sync *bind, int *bind_err, bool allow_oom)
+{
+	if (!bind->n_bufs)
+		return true;
+
+	bind->binds_ufence = vm_bind_bo_batch(fd, ctx, bufs, bind->n_bufs, bind_err);
+
+	if (*bind_err) {
+		if (allow_oom) {
+			igt_assert_f(*bind_err == -ENOMEM || *bind_err == -ENOSPC,
+				     "Unexpected bind error: %d (%s)\n",
+				     *bind_err, strerror(-*bind_err));
+			igt_debug("Bind failed with expected OOM (%s), skipping exec\n",
+				  strerror(-*bind_err));
+			return false;
+		}
+
+		igt_assert_f(false, "Unexpected bind error: %d", *bind_err);
+	}
+
+	xe_wait_ufence(fd, bind->binds_ufence, 1, 0, TIMEOUT_NS);
+	return true;
+}
+
+static uint32_t fill_random_integers(struct gem_bo *int_bo, int ints_to_add)
+{
+	uint32_t expected_result = 0;
+	size_t expr_size = 4 * (size_t)ints_to_add + 1;
+	char *expr = malloc(expr_size);
+	int len = 0;
+
+	igt_assert(expr);
+	for (int i = 0; i < ints_to_add; i++) {
+		uint32_t random_int = rand() % 8;
+
+		int_bo->ptr[i] = random_int;
+		expected_result += random_int;
+
+		len += snprintf(expr + len, expr_size - len, "%s%u",
+				i ? " + " : "", random_int);
+	}
+	igt_debug("%s = %u\n", expr, expected_result);
+	free(expr);
+	return expected_result;
+}
+
+static void cleanup_bo_resources(int fd, struct gem_bo *bo)
+{
+	if (bo->ptr) {
+		igt_assert_eq(munmap(bo->ptr, bo->size), 0);
+		bo->ptr = NULL;
+	}
+	if (bo->handle)
+		gem_close(fd, bo->handle);
+}
+
+static int create_test_bos(int fd, struct xe_oversubscribe_ctx *ctx,
+			   struct mem_bind_sync *bind, uint32_t placement,
+			   uint64_t *addr)
+{
+	const char *mem_type = (placement & vram_memory(fd, 0)) ? "VRAM" : "SRAM";
+	uint32_t create_flags = (placement & vram_memory(fd, 0)) ?
+				DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING : 0;
+	int ret;
+
+	for (int i = 0; i < bind->n_bufs; i++) {
+		struct gem_bo *bo = &bind->bufs[i];
+
+		bo->size = GB(1);
+		ret = __xe_bo_create_caching(fd, ctx->vm_id, bo->size, placement, create_flags,
+					     DRM_XE_GEM_CPU_CACHING_WC, &bo->handle);
+		if (ret) {
+			int saved_errno = errno; /* capture before anything can clobber it */
+
+			bind->n_bufs = i;
+			if (saved_errno == ENOMEM || saved_errno == ENOSPC) {
+				/* Continue on OOM, expected when oversubscribing the VM */
+				igt_debug("%s allocation failed at buffer %d (OOM)\n", mem_type, i);
+				break;
+			}
+			/* We are returning as this is a fail scenario */
+			igt_warn("%s allocation failed at buffer %d: %s\n",
+				 mem_type, i, strerror(saved_errno));
+			return -saved_errno;
+		}
+		bo->ptr = NULL;
+		bo->addr = *addr;
+		*addr += bo->size;
+		igt_debug("%s buffer %d created at 0x%016lx\n", mem_type, i, bo->addr);
+	}
+	return 0;
+}
+
+static void cleanup_sram_vram_objs(int fd, struct mem_bind_sync *vram_bind,
+				   struct mem_bind_sync *sram_bind)
+{
+	for (int i = 0; i < vram_bind->n_bufs; i++)
+		cleanup_bo_resources(fd, &vram_bind->bufs[i]);
+	for (int i = 0; i < sram_bind->n_bufs; i++)
+		cleanup_bo_resources(fd, &sram_bind->bufs[i]);
+	free(vram_bind->bufs);
+	free(sram_bind->bufs);
+	if (vram_bind->binds_ufence)
+		free(vram_bind->binds_ufence);
+	if (sram_bind->binds_ufence)
+		free(sram_bind->binds_ufence);
+}
+
+static void create_bo(int fd, uint32_t vm, struct gem_bo *bo, uint64_t size,
+		      uint64_t addr, bool map_now)
+{
+	bo->size = ALIGN(size, 4096);
+	bo->handle = xe_bo_create_caching(fd, vm, bo->size, system_memory(fd), 0,
+					  DRM_XE_GEM_CPU_CACHING_WC);
+	igt_assert(bo->handle);
+	bo->addr = addr;
+	if (map_now) {
+		bo->ptr = xe_bo_map(fd, bo->handle, bo->size);
+		igt_assert(bo->ptr != MAP_FAILED);
+	} else {
+		bo->ptr = NULL;
+	}
+}
+
+static bool calc_oversubscribe_params(int fd, struct oversubscribe_params *p)
+{
+	uint64_t target_vram, target_sram;
+	uint64_t total_vram_bufs, total_sram_bufs, max_by_mem;
+
+	p->vram_size =  xe_visible_available_vram_size(fd, 0);
+	p->sram_size = (uint64_t)igt_get_avail_ram_mb() << 20;
+	/*
+	 * Dynamically cap VRAM oversubscription so the overflow into system
+	 * RAM stays within 25% of available RAM. Combined with the system
+	 * RAM allocation target of up to 50%, this budgets at most 75% of
+	 * available RAM, leaving at least 25% headroom. On small-VRAM
+	 * platforms the 2x target fits within the cap and behavior is
+	 * unchanged; on large-VRAM platforms (e.g. PVC) this reduces OOM risk.
+	 */
+
+	target_vram = min(p->vram_size * 2, p->vram_size + p->sram_size / 4);
+	target_sram = min_t(uint64_t, p->sram_size * 50 / 100,
+			    MAX_SRAM_TEST_SIZE);
+	total_vram_bufs = target_vram / GB(1);
+	total_sram_bufs = target_sram / GB(1);
+	max_by_mem = min(total_vram_bufs / MIN_BUFS_PER_PROC,
+			 total_sram_bufs / MIN_BUFS_PER_PROC);
+
+	p->n_proc = min_t(int, max_by_mem, MAX_PROCS);
+	/* Ensure we have minimum of 2 process */
+	if (p->n_proc < 2) {
+		igt_info("At least 2 processes are required for oversubscription.\n");
+		return false;
+	}
+	p->n_vram_bufs = max_t(int, 2, total_vram_bufs / p->n_proc);
+	p->n_sram_bufs = max_t(int, 2, total_sram_bufs / p->n_proc);
+	p->total_vram_demand = (uint64_t)p->n_proc * p->n_vram_bufs * GB(1);
+	return true;
+}
+
+static void test_vm_oversubscribe_concurrent_bind(int fd)
+{
+	struct oversubscribe_params p;
+	struct process_data *pdata;
+
+	igt_require_f(calc_oversubscribe_params(fd, &p),
+		      "Not enough VRAM/RAM for oversubscription test\n");
+	igt_debug("VRAM size: %" PRIu64 "MB, System RAM available: %" PRIu64 "MB\n",
+		  p.vram_size >> 20, p.sram_size >> 20);
+
+	igt_debug("n_proc = %d\n", p.n_proc);
+	igt_debug("VRAM: %" PRIu64 "GB\n", p.vram_size >> 30);
+	igt_debug("VRAM demand: %" PRIu64 "MB (%.2fx oversubscription)\n",
+		  p.total_vram_demand >> 20, (double)p.total_vram_demand / p.vram_size);
+	igt_debug("Processes=%d VRAM_bufs=%d SRAM_bufs=%d\n", p.n_proc,
+		  p.n_vram_bufs, p.n_sram_bufs);
+
+	pdata = mmap(NULL, sizeof(*pdata), PROT_READ | PROT_WRITE,
+		     MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	igt_assert(pdata != MAP_FAILED);
+	init_pdata(pdata);
+
+	igt_fork(child, p.n_proc) {
+		struct xe_oversubscribe_ctx ctx = {0};
+		int rc, ret, fd_c;
+		uint64_t addr = STRESS_BIND_ADDR;
+		uint32_t expected_result = 0;
+		struct gem_bo integers_bo = {0}, result_bo = {0}, batch_bo = {0};
+		struct gem_bo *vram_bufs, *sram_bufs;
+		int pos = 0;
+		struct mem_bind_sync vram_bind = {0};
+		struct mem_bind_sync sram_bind = {0};
+		struct drm_xe_sync batch_syncs[1];
+		struct drm_xe_exec exec;
+		struct gem_bo ufence_bo = {0};
+		int vram_bind_err = 0, sram_bind_err = 0;
+
+		vram_bufs = calloc(p.n_vram_bufs, sizeof(*vram_bufs));
+		sram_bufs = calloc(p.n_sram_bufs, sizeof(*sram_bufs));
+		srand(child);
+
+		fd_c = drm_open_driver(DRIVER_XE);
+
+		igt_assert(vram_bufs && sram_bufs);
+
+		ctx.vm_id = xe_vm_create(fd_c, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+		create_exec_queue(fd_c, &ctx);
+		vram_bind.bufs = vram_bufs;
+		vram_bind.n_bufs = p.n_vram_bufs;
+		sram_bind.bufs = sram_bufs;
+		sram_bind.n_bufs = p.n_sram_bufs;
+
+		ret = create_test_bos(fd_c, &ctx, &vram_bind, vram_memory(fd_c, 0), &addr);
+		if (ret) {
+			igt_debug("Child process failed while bo creation in VRAM");
+			process_setup_failed(pdata, true);
+			goto cleanup;
+		}
+
+		ret = create_test_bos(fd_c, &ctx, &sram_bind, system_memory(fd_c), &addr);
+		if (ret) {
+			igt_debug("Child process failed while bo creation in SRAM");
+			process_setup_failed(pdata, true);
+			goto cleanup;
+		}
+
+		if (!vram_bind.n_bufs || !sram_bind.n_bufs) {
+			/* Skipping test as we are running out of memory
+			 * We will keep track in the pdata->skipped count
+			 */
+			igt_debug("Skipping No BOs allocated; VRAM/SRAM unavailable\n");
+			process_setup_failed(pdata, false);
+			goto cleanup;
+		}
+
+		/*
+		 * All allocations are complete. Report Ready and wait until every
+		 * child has either reached this point or reported a setup failure,
+		 * or the parent times out and releases the ready group.
+		 */
+
+		switch (process_ready_and_wait(pdata)) {
+		case RENDEZVOUS_LATE:
+			igt_info("Child %d missed rendezvous release, skipping bind + exec\n",
+				 child);
+			goto cleanup;
+		case RENDEZVOUS_ABORTED:
+			igt_debug("Rendezvous aborted/timed out, skipping bind + exec\n");
+			process_setup_failed(pdata, true);
+			goto cleanup;
+		case RENDEZVOUS_READY:
+			break;
+		}
+		/*
+		 * VM_Bind starts only after the parent signal all ready
+		 * children.
+		 */
+		if (!bind_bos(fd_c, &ctx, vram_bufs, &vram_bind, &vram_bind_err, true)) {
+			pdata_lock(pdata);
+			pdata->bind_oom++;
+			pthread_mutex_unlock(&pdata->mutex);
+			goto cleanup;
+		}
+
+		if (!bind_bos(fd_c, &ctx, sram_bufs, &sram_bind, &sram_bind_err, false)) {
+			pdata_lock(pdata);
+			pdata->bind_oom++;
+			pthread_mutex_unlock(&pdata->mutex);
+			goto cleanup;
+		}
+
+		create_bo(fd_c, ctx.vm_id, &integers_bo, 4096, EXEC_DATA_ADDR, true);
+		expected_result = fill_random_integers(&integers_bo, INT_ADD_CNT);
+		create_bo(fd_c, ctx.vm_id, &result_bo, 4096, EXEC_RESULT_ADDR, false);
+		create_bo(fd_c, ctx.vm_id, &batch_bo, 4096, EXEC_BATCH_ADDR, true);
+		pos = build_add_batch(&batch_bo, &integers_bo, &result_bo, INT_ADD_CNT);
+
+		igt_assert(pos * sizeof(int) <= batch_bo.size);
+
+		xe_vm_bind_lr_sync(fd_c, ctx.vm_id, integers_bo.handle, 0, integers_bo.addr,
+				   integers_bo.size, 0);
+		xe_vm_bind_lr_sync(fd_c, ctx.vm_id, result_bo.handle, 0, result_bo.addr,
+				   result_bo.size, 0);
+		xe_vm_bind_lr_sync(fd_c, ctx.vm_id, batch_bo.handle, 0, batch_bo.addr,
+				   batch_bo.size, 0);
+		create_bo(fd_c, ctx.vm_id, &ufence_bo, 4096, EXEC_UFENCE_ADDR, true);
+
+		memset(ufence_bo.ptr, 0, ufence_bo.size);
+		xe_vm_bind_lr_sync(fd_c, ctx.vm_id, ufence_bo.handle, 0, ufence_bo.addr,
+				   ufence_bo.size, 0);
+
+		batch_syncs[0] = (struct drm_xe_sync){
+			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+			.addr = ufence_bo.addr,
+			.timeline_value = USER_FENCE_VALUE,
+		};
+
+		exec = (struct drm_xe_exec) {
+			.exec_queue_id = ctx.exec_queue_id,
+			.num_syncs = 1,
+			.syncs = (uintptr_t)batch_syncs,
+			.address = batch_bo.addr,
+			.num_batch_buffer = 1,
+		};
+
+		rc = igt_ioctl(fd_c, DRM_IOCTL_XE_EXEC, &exec);
+		igt_assert_f(rc == 0, "xe_exec failed unexpectedly: %s (%d)\n",
+			     strerror(errno), errno);
+		xe_wait_ufence(fd_c, (uint64_t *)ufence_bo.ptr, USER_FENCE_VALUE, ctx.exec_queue_id,
+			       TIMEOUT_NS);
+		result_bo.ptr = xe_bo_map(fd_c, result_bo.handle, result_bo.size);
+		igt_assert(result_bo.ptr != MAP_FAILED);
+		igt_assert_eq(result_bo.ptr[0], expected_result);
+		pdata_lock(pdata);
+		pdata->child_completed++;
+		pthread_mutex_unlock(&pdata->mutex);
+cleanup:
+		cleanup_bo_resources(fd_c, &ufence_bo);
+		cleanup_bo_resources(fd_c, &result_bo);
+		cleanup_bo_resources(fd_c, &batch_bo);
+		cleanup_bo_resources(fd_c, &integers_bo);
+		cleanup_sram_vram_objs(fd_c, &vram_bind, &sram_bind);
+		xe_exec_queue_destroy(fd_c, ctx.exec_queue_id);
+		xe_vm_destroy(fd_c, ctx.vm_id);
+		drm_close_driver(fd_c);
+	}
+
+	release_ready_processes(pdata, p.n_proc);
+	/* Wait for 60 sec to kill the hanging child process */
+	igt_waitchildren_timeout(60, "Oversubscription child failed");
+	igt_assert_f(!pdata->abort, "Child rendezvous wait timed out\n");
+	igt_assert_f(pdata->fault_count == 0, "%d children hit fault", pdata->fault_count);
+
+	igt_assert_f(pdata->child_completed >= 2,
+		     "Expected at least 2 children to complete exec+verify, got %d of %d processes (bind_oom=%d)\n",
+		     pdata->child_completed, p.n_proc, pdata->bind_oom);
+	igt_reset_timeout();
+	igt_info("Oversubscribe summary : %d processes\n", p.n_proc);
+	igt_info("=> Faulted Process(unexpected error): %d\n", pdata->fault_count);
+	igt_info("=> Skipped during setup (OOM cases) %d\n", pdata->skipped - pdata->fault_count);
+	igt_info("=> Skipped during Rendezvous (late arrivals) %d\n", pdata->late_skipped);
+	igt_info("=> Bind failed (ENOMEM/ENOSPC) %d\n", pdata->bind_oom);
+	igt_info("Successfully completed oversubscription process (exec + verify)  %d\n",
+		 pdata->child_completed);
+	pthread_cond_destroy(&pdata->cond);
+	pthread_mutex_destroy(&pdata->mutex);
+	igt_assert_eq(munmap(pdata, sizeof(*pdata)), 0);
+}
+
 static void alloc_sizes_init(void)
 {
 	int i;
@@ -903,6 +1529,16 @@ static void run_gt_dynamic_subtests(int fd, const struct test_case *t)
  * Data-driven subtest matrix.
  *
  * Each entry becomes a subtest with one dynamic child per GT.
+ * TYPE_ALL_SIZES / TYPE_RANDOM_SIZE / TYPE_ARRAY_BIND all exercise exactly one
+ * engine per invocation, so they're wired up as a dynamic child subtest
+ * per engine below (igt_subtest_with_dynamic_f() + igt_dynamic_f()).
+ *
+ * TYPE_THREAD are deliberately NOT split per engine here:
+ * threads() already do their own xe_for_each_engine() to  spawn one thread per
+ * engine internally. Wrapping those in a  second, outer per-engine loop would
+ * run the full all-engine fan-out once for every engine on the machine,
+ * multiplying the runtime by the engine count and re-exercising every engine
+ * N times over. So these stay flat, single subtests.
  */
 
 static const struct test_case test_matrix[] = {
@@ -920,6 +1556,7 @@ static const struct test_case test_matrix[] = {
 	{ "threads-leak-binding-rand-sizes-50", 50, LEAK_BINDING, TYPE_THREAD, false },
 	{ "threads-leak-binding-rand-sizes-50-unaligned", 50, LEAK_BINDING | UNALIGNED,
 	   TYPE_THREAD, false },
+	{ "vm-oversubscribe-concurrent-bind", 0, 0, TYPE_OVERSUBSCRIBE, false },
 };
 
 int igt_main()
@@ -945,6 +1582,10 @@ int igt_main()
 				run_threaded_bo_alloc_test(fd, t->count, t->flags);
 			}
 			break;
+		case TYPE_OVERSUBSCRIBE:
+			igt_subtest_f("%s", t->name)
+				test_vm_oversubscribe_concurrent_bind(fd);
+			break;
 		case TYPE_ALL_SIZES:
 		case TYPE_RANDOM_SIZE:
 		case TYPE_ARRAY_BIND:
-- 
2.55.0

