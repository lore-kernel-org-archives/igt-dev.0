Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB5EC79F9E
	for <igt-dev@archiver.kernel.org>; Mon,  7 Sep 2026 08:22:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B39A10E6CF;
	Mon,  7 Sep 2026 08:22:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iSj0Tfkm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0422510E2D1
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Sep 2026 08:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788769256; x=1820305256;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y/Xx9fmOhig//ZsUIYZ+jYHjOtp0aD5jvuTlnRsPzOk=;
 b=iSj0TfkmLM8ADp39aZ4p9nsXZvIu4sg+NBc6ose7HkVKS90LTNBR9SYe
 53sV2cYbyOxeyfCzgZ+A2hhyHoJm0WiMzW1jQ6uTeHj5EZIRARo6xyLUm
 BwsxlqqJob8ScohTJlWkDHncNgOsCoVS2+6T9LqhI/l2JJL3lqJPkUUnP
 6fb7gHq23YFGoELWirKNqim5qx0MQh6DFpHydQWHO+MecyYsHV6gKCJ5L
 TFxhtvLEPnfn5M2CCfM6JpRR7tvgWb8sUPJKKpcaOr2rzd5J1XcXLPvwv
 OSE1ToA4Qt1vfXl6xb6h50XYbVtYBVGODOQB/Cl4lxsivngZwow1BCmi/ g==;
X-CSE-ConnectionGUID: AaCWmMjoQ8W7AejITuEOHg==
X-CSE-MsgGUID: QBhHGvdhTVmxR1FrtFvpyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="106685111"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="106685111"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 01:20:56 -0700
X-CSE-ConnectionGUID: /ZmUm8N5S/WSZllDmj/X9w==
X-CSE-MsgGUID: uhoENx3mTfWfod2u6LQhAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="272580390"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 01:20:56 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	matthew.brost@intel.com
Cc: nishit.sharma@intel.com, kamil.konieczny@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v4 2/2] test/intel/xe_bo_alloc: Add oversubscribe
 concurrent bind stress subtest
Date: Mon,  7 Sep 2026 08:20:37 +0000
Message-ID: <20260907082039.2223531-3-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260907082039.2223531-1-sobin.thomas@intel.com>
References: <20260907082039.2223531-1-sobin.thomas@intel.com>
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

Add test for oversubscribing VRAM in multi process environment that
creates VM, bind large BOs and submit workloads nearly simultaneously.

Previous coverage lacked a scenario combining multi-process bind
with VRAM oversubscription. This generates memory pressure with
multi-process VM Bind activity and concurrent submission, exercising
the bind pipeline under eviction pressure.

v3: Fixed minor nits

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_bo_alloc.c | 498 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 498 insertions(+)

diff --git a/tests/intel/xe_bo_alloc.c b/tests/intel/xe_bo_alloc.c
index 58380463c..06cd651eb 100644
--- a/tests/intel/xe_bo_alloc.c
+++ b/tests/intel/xe_bo_alloc.c
@@ -29,6 +29,19 @@
 #define THREAD_VA_STRIDE GB(1)
 #define SZ_4K_SHIFT	12
 #define MAX_ALLOCATIONS 50000
+#define INT_ADD_CNT 4
+#define TIMEOUT_NS (30ULL * 1000000000ULL)
+#define MAX_SRAM_TEST_SIZE GB(32)
+#define GPR_RX_ADDR(x)          (0x600 + (x) * 8)
+#define MAX_PROCS 20
+
+#define EXEC_DATA_ADDR		0x100000ULL
+#define EXEC_RESULT_ADDR	0x200000ULL
+#define EXEC_BATCH_ADDR		0x300000ULL
+#define EXEC_UFENCE_ADDR	0x400000ULL
+#define STRESS_BIND_ADDR	0x40000000ULL
+
+
 
 /**
  * SUBTEST: all-sizes-once
@@ -75,14 +88,48 @@
  * Description: Test 50 random BO allocation sizes in test table with a thread per engine,
  * leak the binding, unaligned bind addresses
  * Test category: stress test
+ *
+ * SUBTEST: test_vm_oversubscribe_concurrent_bind
+ * Description: Test enough random BO allocation sizes, bound as arrays of binds, to trigger
+ * evictions with 2 processes per engine, leak the BO munmap / gem close, unaligned bind addresses
+ * Test category: stress test
  */
 
 #define GB(x) (1024ULL * 1024ULL * 1024ULL * (x))
 #define MIN_BUFS_PER_PROC 2
 
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
+	int failed;
+	pthread_barrier_t barrier;
+	bool go;
+};
+
 /*
  * Data-driven subtest matrix.
  *
@@ -103,6 +150,7 @@ enum test_type {
 	TYPE_SINGLE,
 	TYPE_ARRAY_BIND,
 	TYPE_THREAD,
+	TYPE_OVERSUBSCRIBE,
 };
 
 struct test_case {
@@ -223,6 +271,450 @@ static int __xe_vm_bind_array(int fd, uint32_t vm,
 	return 0;
 }
 
+static void init_pdata(struct process_data *pdata)
+{
+	pthread_mutexattr_t mattr;
+	pthread_condattr_t cattr;
+
+	pthread_mutexattr_init(&mattr);
+	igt_assert_eq(pthread_mutexattr_setpshared(&mattr, PTHREAD_PROCESS_SHARED), 0);
+	igt_assert_eq(pthread_mutex_init(&pdata->mutex, &mattr), 0);
+	pthread_mutexattr_destroy(&mattr);
+
+	pthread_condattr_init(&cattr);
+	igt_assert_eq(pthread_condattr_setpshared(&cattr, PTHREAD_PROCESS_SHARED), 0);
+	igt_assert_eq(pthread_cond_init(&pdata->cond, &cattr), 0);
+	pthread_condattr_destroy(&cattr);
+	pdata->ready = 0;
+	pdata->failed = 0;
+	pdata->go = false;
+}
+
+static void process_ready_and_wait(struct process_data *pdata)
+{
+	pthread_mutex_lock(&pdata->mutex);
+	pdata->ready++;
+	pthread_cond_broadcast(&pdata->cond);
+	while (!pdata->go)
+		pthread_cond_wait(&pdata->cond, &pdata->mutex);
+	pthread_mutex_unlock(&pdata->mutex);
+}
+
+static void process_setup_failed(struct process_data *pdata)
+{
+	pthread_mutex_lock(&pdata->mutex);
+	pdata->failed++;
+	pthread_cond_broadcast(&pdata->cond);
+	pthread_mutex_unlock(&pdata->mutex);
+}
+
+static void release_ready_processes(struct process_data *pdata, int n_proc)
+{
+	pthread_mutex_lock(&pdata->mutex);
+	/*
+	 * Wait until all children have either reached VM Bind rendevouz
+	 * Or, failed setup and exited the test path.
+	 */
+	while (pdata->ready + pdata->failed < n_proc)
+		pthread_cond_wait(&pdata->cond, &pdata->mutex);
+
+	igt_debug(" Process rendezvous: ready=%d failed=%d total = %d\n",
+		  pdata->ready, pdata->failed, n_proc);
+
+	/* Release every successful child into VM_Bind at same time*/
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
+	tmp_addr = integers_bo->addr + 0 * sizeof(uint32_t);
+	batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
+	batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
+	for (i = 1; i < ints_to_add; i++) {
+		/* r1 = integers_bo[i] */
+		batch_bo->ptr[pos++] = MI_LOAD_REGISTER_MEM_CMD | MI_LRI_LRM_CS_MMIO | 2;
+		batch_bo->ptr[pos++] = GPR_RX_ADDR(1);
+		tmp_addr = integers_bo->addr + i * sizeof(uint32_t);
+		batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
+		batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
+		/* r0 = r0 + r1 */
+		batch_bo->ptr[pos++] = MI_MATH(4);
+		batch_bo->ptr[pos++] = MI_MATH_LOAD(MI_MATH_REG_SRCA, MI_MATH_REG(0));
+		batch_bo->ptr[pos++] = MI_MATH_LOAD(MI_MATH_REG_SRCB, MI_MATH_REG(1));
+		batch_bo->ptr[pos++] = MI_MATH_ADD;
+		batch_bo->ptr[pos++] = MI_MATH_STORE(MI_MATH_REG(0), MI_MATH_REG_ACCU);
+	}
+	/* result_bo[0] = r0 */
+	batch_bo->ptr[pos++] = MI_STORE_REGISTER_MEM_GEN8 | MI_LRI_LRM_CS_MMIO;
+	batch_bo->ptr[pos++] = GPR_RX_ADDR(0);
+	tmp_addr = result_bo->addr + 0 * sizeof(uint32_t);
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
+vm_bind_bo_batch(int fd, struct xe_oversubscribe_ctx *ctx, struct gem_bo *bos, int size,
+		 int *out_err)
+{
+	uint64_t *ufence;
+	struct drm_xe_sync bind_sync;
+	struct drm_xe_vm_bind_op *binds;
+	int i;
+
+	binds = calloc(size, sizeof(*binds));
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
+	for (i = 0; i < size; i++) {
+		binds[i] = (struct drm_xe_vm_bind_op) {
+			.obj = bos[i].handle,
+			.obj_offset = 0,
+			.range = bos[i].size,
+			.addr = bos[i].addr,
+			.op = DRM_XE_VM_BIND_OP_MAP,
+			.flags = 0,
+		};
+	}
+	*out_err = __xe_vm_bind_array(fd, ctx->vm_id, binds, size, &bind_sync, 1);
+	free(binds);
+	return ufence;
+}
+
+static int fill_random_integers(struct gem_bo *int_bo, int ints_to_add)
+{
+	uint32_t expected_result = 0;
+	char expr[256];
+	int len = 0;
+
+	for (int i = 0; i < ints_to_add; i++) {
+		uint32_t random_int = rand() % 8;
+
+		int_bo->ptr[i] = random_int;
+		expected_result += random_int;
+
+		len += snprintf(expr + len, sizeof(expr) - len, "%s%u",
+				i ? " + " : "", random_int);
+	}
+	igt_debug("%s = %u\n", expr, expected_result);
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
+	int ret;
+
+	for (int i = 0; i < bind->n_bufs; i++) {
+		struct gem_bo *bo = &bind->bufs[i];
+
+		bo->size = GB(1);
+		ret = __xe_bo_create_caching(fd, ctx->vm_id, bo->size, placement, 0,
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
+		gem_close(fd, vram_bind->bufs[i].handle);
+	for (int i = 0; i < sram_bind->n_bufs; i++)
+		gem_close(fd, sram_bind->bufs[i].handle);
+	free(vram_bind->bufs);
+	free(sram_bind->bufs);
+	if (vram_bind->binds_ufence)
+		free(vram_bind->binds_ufence);
+	if (sram_bind->binds_ufence)
+		free(sram_bind->binds_ufence);
+}
+
+static void test_vm_oversubscribe_concurrent_bind(int fd)
+{
+	int n_proc = 0, n_vram_bufs = 0, n_sram_bufs = 0;
+	uint64_t max_by_mem;
+	uint64_t total_vram_demand = 0;
+	uint64_t vram_size = xe_visible_available_vram_size(fd, 0);
+	uint64_t sram_avail = (uint64_t)igt_get_avail_ram_mb() << 20;
+	uint64_t target_vram = vram_size * 2;
+	uint64_t target_sram, total_vram_bufs, total_sram_bufs;
+	struct process_data *pdata;
+
+	/*
+	 * Dynamically cap VRAM oversubscription so the overflow into system
+	 * RAM stays within 25% of available RAM. On small-VRAM platforms
+	 * (e.g. BMG) the 2x target fits within the cap and behavior is
+	 * unchanged; on large-VRAM platforms (e.g. PVC) this prevents OOM.
+	 */
+	target_vram = min(target_vram, vram_size + sram_avail / 4);
+	target_sram = min_t(uint64_t, sram_avail * 50 / 100,
+			    MAX_SRAM_TEST_SIZE);
+
+	total_vram_bufs = target_vram / GB(1);
+	total_sram_bufs = target_sram / GB(1);
+
+	/* determine concurrency from memory pressure */
+
+	max_by_mem = min(total_vram_bufs / MIN_BUFS_PER_PROC,
+			 total_sram_bufs / MIN_BUFS_PER_PROC);
+	n_proc = min_t(int, max_by_mem, MAX_PROCS);
+	igt_require_f(n_proc > 0, "Not enough VRAM/RAM for oversubscription test\n");
+
+	n_vram_bufs = max_t(int, 2, total_vram_bufs / n_proc);
+	n_sram_bufs = max_t(int, 2, total_sram_bufs / n_proc);
+	total_vram_demand = (uint64_t)n_proc * n_vram_bufs * GB(1);
+
+	igt_debug("VRAM size: %" PRIu64 "MB, System RAM available: %" PRIu64 "MB\n",
+		  vram_size >> 20, sram_avail >> 20);
+
+	igt_debug("n_proc = %d\n", n_proc);
+	igt_debug("VRAM: %" PRIu64 "GB\n", vram_size >> 30);
+	igt_debug("VRAM demand: %" PRIu64 "MB (%.2fx oversubscription)\n",
+		  total_vram_demand >> 20, (double)total_vram_demand / vram_size);
+	igt_debug("Processes=%d VRAM_bufs=%d SRAM_bufs=%d\n", n_proc,
+		  n_vram_bufs, n_sram_bufs);
+
+	pdata = mmap(NULL, sizeof(*pdata), PROT_READ | PROT_WRITE,
+		     MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	igt_assert(pdata != MAP_FAILED);
+	init_pdata(pdata);
+
+	igt_fork(child, n_proc) {
+		struct xe_oversubscribe_ctx ctx = {0};
+		int rc, ret;
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
+		vram_bufs = calloc(n_vram_bufs, sizeof(*vram_bufs));
+		sram_bufs = calloc(n_sram_bufs, sizeof(*sram_bufs));
+		srand(child);
+
+		igt_assert(vram_bufs && sram_bufs);
+
+		ctx.vm_id = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0);
+		create_exec_queue(fd, &ctx);
+		vram_bind.bufs = vram_bufs;
+		vram_bind.n_bufs = n_vram_bufs;
+		sram_bind.bufs = sram_bufs;
+		sram_bind.n_bufs = n_sram_bufs;
+
+		ret = create_test_bos(fd, &ctx, &vram_bind, vram_memory(fd, 0), &addr);
+		if (ret) {
+			process_setup_failed(pdata);
+			goto cleanup;
+		}
+
+		ret = create_test_bos(fd, &ctx, &sram_bind, system_memory(fd), &addr);
+		if (ret) {
+			process_setup_failed(pdata);
+			goto cleanup;
+		}
+
+		if (!vram_bind.n_bufs || !sram_bind.n_bufs) {
+			igt_debug("No BOs allocated; VRAM/SRAM unavailable, skipping\n");
+			process_setup_failed(pdata);
+			goto cleanup;
+		}
+
+		/*
+		 * All allocations are complete. Report Ready and wait until every
+		 * child has either reached this point or repported a setup failure.
+		 */
+
+		 process_ready_and_wait(pdata);
+
+		/*
+		 * VM_Bind starts only after the parent releases all ready
+		 * childen.
+		 */
+
+		if (vram_bind.n_bufs) {
+			vram_bind.binds_ufence =
+				vm_bind_bo_batch(fd, &ctx, vram_bufs,
+						 vram_bind.n_bufs, &vram_bind_err);
+			if (vram_bind_err) {
+				igt_assert_f(vram_bind_err == -ENOMEM || vram_bind_err == -ENOSPC,
+					     "Unexpected VRAM bind error: %d (%s)\n",
+					     vram_bind_err, strerror(-vram_bind_err));
+				igt_debug("VRAM bind failed with expected OOM (%s), skipping exec\n",
+					  strerror(-vram_bind_err));
+				goto cleanup;
+			}
+			xe_wait_ufence(fd, vram_bind.binds_ufence, 1, 0, TIMEOUT_NS);
+		}
+
+		if (sram_bind.n_bufs) {
+			sram_bind.binds_ufence =
+				vm_bind_bo_batch(fd, &ctx, sram_bufs,
+						 sram_bind.n_bufs, &sram_bind_err);
+			/* Assert if there is any bind error in SRAM */
+			if (sram_bind_err)
+				igt_assert_f(0, "Unexpected SRAM bind error: %d", sram_bind_err);
+			xe_wait_ufence(fd, sram_bind.binds_ufence, 1, 0, TIMEOUT_NS);
+	}
+
+		integers_bo.size = ALIGN(sizeof(int) * INT_ADD_CNT, 4096);
+		integers_bo.handle = xe_bo_create_caching(fd, ctx.vm_id, integers_bo.size,
+							  system_memory(fd), 0,
+							  DRM_XE_GEM_CPU_CACHING_WC);
+		igt_assert(integers_bo.handle);
+		integers_bo.ptr = xe_bo_map(fd, integers_bo.handle, integers_bo.size);
+		igt_assert(integers_bo.ptr != MAP_FAILED);
+		integers_bo.addr = EXEC_DATA_ADDR;
+
+		expected_result = fill_random_integers(&integers_bo, INT_ADD_CNT);
+		igt_debug("%d\n", expected_result);
+
+		result_bo.size = ALIGN(sizeof(int), 4096);
+		result_bo.handle  = xe_bo_create_caching(fd, ctx.vm_id, result_bo.size,
+							 system_memory(fd), 0,
+							 DRM_XE_GEM_CPU_CACHING_WC);
+		igt_assert(result_bo.handle);
+		result_bo.ptr = NULL;
+		result_bo.addr = EXEC_RESULT_ADDR;
+
+		batch_bo.size = 4096;
+		batch_bo.handle = xe_bo_create_caching(fd, ctx.vm_id, batch_bo.size,
+						       system_memory(fd), 0,
+						       DRM_XE_GEM_CPU_CACHING_WC);
+		igt_assert(batch_bo.handle);
+
+		batch_bo.ptr = xe_bo_map(fd, batch_bo.handle, batch_bo.size);
+		igt_assert(batch_bo.ptr != MAP_FAILED);
+		batch_bo.addr = EXEC_BATCH_ADDR;
+
+		pos = build_add_batch(&batch_bo, &integers_bo, &result_bo, INT_ADD_CNT);
+
+		igt_assert(pos * sizeof(int) <= batch_bo.size);
+
+		xe_vm_bind_lr_sync(fd, ctx.vm_id, integers_bo.handle, 0, integers_bo.addr,
+				   integers_bo.size, 0);
+		xe_vm_bind_lr_sync(fd, ctx.vm_id, result_bo.handle, 0, result_bo.addr,
+				   result_bo.size, 0);
+		xe_vm_bind_lr_sync(fd, ctx.vm_id, batch_bo.handle, 0, batch_bo.addr,
+				   batch_bo.size, 0);
+
+		ufence_bo.size = 4096;
+		ufence_bo.handle = xe_bo_create_caching(fd, ctx.vm_id, ufence_bo.size,
+							system_memory(fd), 0,
+							DRM_XE_GEM_CPU_CACHING_WC);
+		igt_assert(ufence_bo.handle);
+		ufence_bo.ptr = xe_bo_map(fd, ufence_bo.handle, ufence_bo.size);
+		igt_assert(ufence_bo.ptr != MAP_FAILED);
+		ufence_bo.addr = EXEC_UFENCE_ADDR;
+		memset(ufence_bo.ptr, 0, ufence_bo.size);
+		xe_vm_bind_lr_sync(fd, ctx.vm_id, ufence_bo.handle, 0, ufence_bo.addr,
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
+		rc = igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec);
+		igt_assert_f(rc == 0, "xe_exec failed unexpectedly: %s (%d)\n",
+			     strerror(errno), errno);
+		xe_wait_ufence(fd, (uint64_t *)ufence_bo.ptr, USER_FENCE_VALUE, ctx.exec_queue_id,
+			       TIMEOUT_NS);
+		result_bo.ptr = xe_bo_map(fd, result_bo.handle, result_bo.size);
+		igt_assert(result_bo.ptr != MAP_FAILED);
+		igt_assert_eq(result_bo.ptr[0], expected_result);
+cleanup:
+		cleanup_bo_resources(fd, &ufence_bo);
+		cleanup_bo_resources(fd, &result_bo);
+		cleanup_bo_resources(fd, &batch_bo);
+		cleanup_bo_resources(fd, &integers_bo);
+		cleanup_sram_vram_objs(fd, &vram_bind, &sram_bind);
+		xe_exec_queue_destroy(fd, ctx.exec_queue_id);
+		xe_vm_destroy(fd, ctx.vm_id);
+	}
+
+	release_ready_processes(pdata, n_proc);
+	igt_waitchildren();
+	igt_reset_timeout();
+
+	pthread_cond_destroy(&pdata->cond);
+	pthread_mutex_destroy(&pdata->mutex);
+	igt_assert_eq(munmap(pdata, sizeof(*pdata)), 0);
+}
+
 static void alloc_sizes_init(void)
 {
 	int i;
@@ -984,6 +1476,8 @@ static const struct test_case test_matrix[] = {
 	  false },
 	{ "threads-leak-binding-rand-sizes-50-unaligned", 50,
 	  LEAK_BINDING | UNALIGNED, TYPE_THREAD, false },
+	{ "test_vm_oversubscribe_concurrent_bind", 0, 0,
+	  TYPE_OVERSUBSCRIBE, false},
 };
 
 int igt_main()
@@ -1010,6 +1504,10 @@ int igt_main()
 				run_threaded_bo_alloc_test(fd, t->count, t->flags);
 			}
 			break;
+		case TYPE_OVERSUBSCRIBE:
+			igt_subtest_f("%s", t->name)
+				test_vm_oversubscribe_concurrent_bind(fd);
+			break;
 		case TYPE_ALL_SIZES:
 		case TYPE_SINGLE:
 		case TYPE_ARRAY_BIND:
-- 
2.52.0

