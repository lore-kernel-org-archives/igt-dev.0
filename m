Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957B6606A327
	for <igt-dev@archiver.kernel.org>; Tue, 24 Nov 2026 12:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n3F6I7mu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BD910E673;
	Tue, 24 Nov 2026 12:17:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B06B10F52E
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 12:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795522495; x=1827058495;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w/WmBRFiw90LgryfmRc0t6a+5uqlUgu1ENQOaWh4kao=;
 b=n3F6I7mua2+ZUPGEmL5H7SIkZIV5p8HcDPZxb5/efi86PN73muTSCIly
 AIHJ4ESWpOpZRLviEpssI55L9oZVlJToFI4B9OzXPDxVLiaaU5CiuwPq3
 I1D5YBGbyycAZ3HsBJtWO4OYd06djiuMHtl7mtcYP/Q7MXUsRDOa4KJBE
 herVB1R5eNYsiijWm/4+4igTO0TDHMYb2lmTMgmU/nfTlKpwoHbInXBS6
 ATECHtlocv++E5EkgcPJVcSxZ4xyoshQdjD2Vmsz/RtFshER30ksP2D0M
 hxKvYRA5NWP6BFnn6bVUAXh8KD51o/0V/uXnV+isW0c+SF3F3yI504P2b w==;
X-CSE-ConnectionGUID: Qjf7IWwuS+eWqN0qXqzL/Q==
X-CSE-MsgGUID: I1Dwpfv8RNqDCQlh5rvbBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4252825"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4252825"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 04:12:06 -0800
X-CSE-ConnectionGUID: VHvv17oZQCy+aSbgYW0nTg==
X-CSE-MsgGUID: V+9C6tquTwK5Aw/7EShLvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11850113"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by fmviesa008.fm.intel.com with ESMTP; 24 Nov 2026 04:12:05 -0800
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	nishit.sharma@intel.com
Cc: priyanka.dandamudi@intel.com, matthew.brost@intel.com,
 kamil.konieczny@intel.com
Subject: [PATCH i-g-t v8 5/5] tests/intel: Add oversubscribe concurrent bind
 stress subtest
Date: Tue, 24 Nov 2026 12:12:03 +0000
Message-ID: <20261124121203.592758-6-sobin.thomas@intel.com>
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

Add test for oversubscribing VRAM in multi process environment that
creates VM, bind large BOs and submit workloads nearly simultaneously.

Previous coverage lacked a scenario combining multi-process bind
with VRAM oversubscription. This generates memory pressure with
multi-process VM Bind activity and concurrent submission, exercising
the bind pipeline under eviction pressure.

v6:
- Abort all child threads and fail with a reaon on timeout (Nishit)
- Track the setup fault , OOM Faults and completed child process.(Nishit)

v7:
- Added  skipped and late_skipped variable to track process at bind and
  rendezvous path.
- Replaced gem_close with cleanup_bo_resources.

v8:
- Added check to get the Copy engine  (Nishit)
- Modified the verification strategy to use bind
  by write and read VMs (Nishit)

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_bo_alloc.c | 643 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 643 insertions(+)

diff --git a/tests/intel/xe_bo_alloc.c b/tests/intel/xe_bo_alloc.c
index cf75ae111..f7d2240c0 100644
--- a/tests/intel/xe_bo_alloc.c
+++ b/tests/intel/xe_bo_alloc.c
@@ -31,6 +31,19 @@
 #define N_BOS_PER_BIND	10
 #define GB(x) (1024ULL * 1024ULL * 1024ULL * (x))
 #define THREAD_VA_STRIDE GB(1)
+#define MIN_BUFS_PER_PROC 2
+
+#define USER_FENCE_VALUE 0xdeadbeefdeadbeefull
+#define BO_STORE_VALUE(child, idx) \
+	(0xc0ffee00 | ((uint32_t)(child) << 16) | ((uint32_t)(idx) & 0xffff))
+
+#define TIMEOUT_NS (30ULL * 1000000000ULL)
+#define MAX_SRAM_TEST_SIZE GB(32)
+#define MAX_PROCS 20
+
+#define EXEC_BATCH_ADDR        0x300000ULL
+#define EXEC_UFENCE_ADDR       0x400000ULL
+#define STRESS_BIND_ADDR       0x40000000ULL
 
 /**
  * SUBTEST: all-sizes-once
@@ -90,11 +103,54 @@
  * Description: Test 50 random BO allocation sizes in test table with a thread per engine,
  * leak the binding, with bind addresses unaligned to BO size
  * Test category: stress test
+ *
+ * SUBTEST: vm-oversubscribe-concurrent-bind
+ * Description: Oversubscribe VRAM by concurrently binding arrays of deferred-backed
+ * BOs from multiple processes, then validate successful binds with an exec
+ * Test category: stress test
  */
 
 #define N_ALLOC_SIZES	256
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
+	int bind_oom_vram;
+	int bind_oom_sram;
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
@@ -105,6 +161,7 @@ enum test_type {
 	TYPE_RANDOM_SIZE,
 	TYPE_ARRAY_BIND,
 	TYPE_THREAD,
+	TYPE_OVERSUBSCRIBE,
 };
 
 struct test_case {
@@ -120,6 +177,15 @@ struct bo_group {
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
+
 #define LEAK_BINDING		(0x1 << 0)
 #define LEAK_BO			(0x1 << 1)
 #define EVICT			(0x1 << 2)
@@ -245,6 +311,578 @@ static int __xe_vm_bind_array(int fd, uint32_t vm,
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
+	pdata->bind_oom_vram = 0;
+	pdata->bind_oom_sram = 0;
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
+static void create_exec_queue(int fd, struct xe_oversubscribe_ctx *ctx,
+			      struct drm_xe_engine_class_instance *eci)
+{
+	ctx->exec_queue_id = xe_exec_queue_create(fd, ctx->vm_id, eci, 0);
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
+/*
+ * Returns true if the binds succeeded or there was nothing to bind,
+ * false on ENOMEM/ENOBUFS/ENOSPC, expected for VRAM/SRAM under
+ * oversubscription.
+ */
+static bool bind_bos(int fd, struct xe_oversubscribe_ctx *ctx,
+		     struct mem_bind_sync *bind, const char *mem_type, int child)
+{
+	int err = 0;
+
+	if (!bind->n_bufs)
+		return true;
+
+	bind->binds_ufence = vm_bind_bo_batch(fd, ctx, bind->bufs, bind->n_bufs, &err);
+
+	if (err == -ENOMEM || err == -ENOBUFS || err == -ENOSPC) {
+		igt_info("Child %d: %s bind failed with expected OOM (%s), skipping exec\n",
+			 child, mem_type, strerror(-err));
+		return false;
+	}
+	/* Assert for any other error value */
+	igt_assert_f(!err, "Child %d: unexpected %s bind error: %d (%s)\n", child, mem_type, err,
+		     strerror(-err));
+
+	xe_wait_ufence(fd, bind->binds_ufence, 1, 0, TIMEOUT_NS);
+	return true;
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
+static int emit_bo_stores(uint32_t *batch, int pos, struct gem_bo *bufs, int n_bufs,
+			  int child, int base)
+{
+	for (int i = 0; i < n_bufs; i++) {
+		batch[pos++] = MI_STORE_DWORD_IMM_GEN4;
+		batch[pos++] = lower_32_bits(bufs[i].addr);
+		batch[pos++] = upper_32_bits(bufs[i].addr);
+		batch[pos++] = BO_STORE_VALUE(child, base + i);
+	}
+	return pos;
+}
+
+static void verify_bo_stores(int fd, struct gem_bo *bufs, int n_bufs, int child, int base)
+{
+	for (int i = 0; i < n_bufs; i++) {
+		uint32_t expected = BO_STORE_VALUE(child, base + i);
+		uint32_t *map = xe_bo_map(fd, bufs[i].handle, 4096);
+		uint32_t got;
+
+		got = map[0];
+		munmap(map, 4096);
+		igt_assert_f(got == expected,
+			     "child %d BO %d (addr 0x%" PRIx64 "): got 0x%08x, expected 0x%08x\n",
+			     child, base + i, bufs[i].addr, got, expected);
+	}
+}
+
+static int create_test_bos(int fd, struct xe_oversubscribe_ctx *ctx,
+			   struct mem_bind_sync *bind, uint32_t placement,
+			   uint64_t *addr)
+{
+	const char *mem_type = (placement & vram_memory(fd, 0)) ? "VRAM" : "SRAM";
+	uint32_t create_flags = (placement & vram_memory(fd, 0)) ?
+				DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING |
+				DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM : 0;
+	int ret;
+
+	for (int i = 0; i < bind->n_bufs; i++) {
+		struct gem_bo *bo = &bind->bufs[i];
+
+		bo->size = GB(1);
+		ret = __xe_bo_create_caching(fd, ctx->vm_id, bo->size, placement, create_flags,
+					     DRM_XE_GEM_CPU_CACHING_WC, &bo->handle);
+		if (ret) {
+			int saved_errno = errno;
+
+			bind->n_bufs = i;
+			if (saved_errno == ENOMEM || saved_errno == ENOSPC) {
+				/* Continue on OOM, expected when oversubscribing the VM */
+				igt_info("%s allocation failed at buffer %d (OOM)\n", mem_type, i);
+				break;
+			}
+			/* We are returning as this is a fail scenario */
+			igt_warn("%s allocation failed at buffer %d: %s\n",
+				 mem_type, i, strerror(saved_errno));
+			return ret;
+		}
+		bo->ptr = NULL;
+		bo->addr = *addr;
+		*addr += bo->size;
+		igt_debug("%s buffer %d created at 0x%016" PRIx64 "\n", mem_type, i, bo->addr);
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
+/*
+ * Non-asserting BO creation: returns 0 or -errno so the caller can treat
+ * ENOMEM/ENOSPC under memory pressure as an expected setup skip.
+ */
+static int create_bo(int fd, uint32_t vm, struct gem_bo *bo, uint64_t size,
+		     uint64_t addr, bool map_now)
+{
+	bo->size = ALIGN(size, 4096);
+	bo->handle = 0;
+	bo->ptr = NULL;
+	if (__xe_bo_create_caching(fd, vm, bo->size, system_memory(fd), 0,
+				   DRM_XE_GEM_CPU_CACHING_WC, &bo->handle))
+		return -errno;
+	bo->addr = addr;
+	if (map_now)
+		bo->ptr = xe_bo_map(fd, bo->handle, bo->size);
+	return 0;
+}
+
+static bool calc_oversubscribe_params(int fd, struct oversubscribe_params *p)
+{
+	uint64_t target_vram, target_sram;
+	uint64_t total_vram_bufs, total_sram_bufs, max_by_mem;
+
+	p->vram_size = xe_visible_available_vram_size(fd, 0);
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
+	p->n_vram_bufs = max_t(int, MIN_BUFS_PER_PROC, total_vram_bufs / p->n_proc);
+	p->n_sram_bufs = max_t(int, MIN_BUFS_PER_PROC, total_sram_bufs / p->n_proc);
+	p->total_vram_demand = (uint64_t)p->n_proc * p->n_vram_bufs * GB(1);
+	return true;
+}
+
+/*
+ * Create and bind the small BOs needed for the exec phase (batch, user
+ * fence). Done before the rendezvous, so a transient  ENOMEM here is
+ * reported as a setup skip instead of killing the child after the
+ * large binds, when memory pressure is highest.
+ */
+static int setup_exec_bos(int fd, uint32_t vm, int n_stores, struct gem_bo *batch_bo,
+			  struct gem_bo *ufence_bo)
+{
+	struct gem_bo *bos[] = { batch_bo, ufence_bo };
+	int ret;
+
+	ret = create_bo(fd, vm, batch_bo, n_stores * 4 * sizeof(uint32_t) + 4096, EXEC_BATCH_ADDR,
+			true);
+	if (ret)
+		return ret;
+	ret = create_bo(fd, vm, ufence_bo, 4096, EXEC_UFENCE_ADDR, true);
+	if (ret)
+		return ret;
+
+	memset(ufence_bo->ptr, 0, ufence_bo->size);
+
+	for (int i = 0; i < ARRAY_SIZE(bos); i++) {
+		ret = __xe_vm_bind_lr_sync(fd, vm, bos[i]->handle, 0, bos[i]->addr,
+					   bos[i]->size, 0);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
+static void test_vm_oversubscribe_concurrent_bind(int fd)
+{
+	struct oversubscribe_params p;
+	struct process_data *pdata;
+	struct drm_xe_engine_class_instance eci;
+	struct drm_xe_engine *engine;
+	int fault_count, child_completed, bind_oom_vram, bind_oom_sram, skipped, late_skipped;
+	bool abort_stat;
+
+	igt_require_f(xe_has_vram(fd), "Test needs VRAM (discrete GPU)\n");
+	engine = xe_find_engine_by_class(fd, DRM_XE_ENGINE_CLASS_COPY);
+	igt_require_f(engine, "No Copy engine available\n");
+	eci = engine->instance;
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
+		int ret, fd_c;
+		int pos = 0;
+		uint64_t addr = STRESS_BIND_ADDR;
+		struct gem_bo batch_bo = {0};
+		struct gem_bo *vram_bufs, *sram_bufs;
+		struct mem_bind_sync vram_bind = {0};
+		struct mem_bind_sync sram_bind = {0};
+		struct drm_xe_sync batch_syncs[1];
+		struct drm_xe_exec exec;
+		struct gem_bo ufence_bo = {0};
+
+		vram_bufs = calloc(p.n_vram_bufs, sizeof(*vram_bufs));
+		sram_bufs = calloc(p.n_sram_bufs, sizeof(*sram_bufs));
+		igt_assert(vram_bufs && sram_bufs);
+
+		fd_c = drm_open_driver(DRIVER_XE);
+
+		ctx.vm_id = xe_vm_create(fd_c, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+		create_exec_queue(fd_c, &ctx, &eci);
+		vram_bind.bufs = vram_bufs;
+		vram_bind.n_bufs = p.n_vram_bufs;
+		sram_bind.bufs = sram_bufs;
+		sram_bind.n_bufs = p.n_sram_bufs;
+
+		ret = create_test_bos(fd_c, &ctx, &vram_bind, vram_memory(fd_c, 0), &addr);
+		if (ret) {
+			igt_info("Child %d failed to create VRAM BOs\n", child);
+			process_setup_failed(pdata, true);
+			goto cleanup;
+		}
+
+		ret = create_test_bos(fd_c, &ctx, &sram_bind, system_memory(fd_c), &addr);
+		if (ret) {
+			igt_info("Child %d failed to create SRAM BOs\n", child);
+			process_setup_failed(pdata, true);
+			goto cleanup;
+		}
+
+		if (!vram_bind.n_bufs || !sram_bind.n_bufs) {
+			/*
+			 * Skipping test as we are running out of memory
+			 * We will keep track in the pdata->skipped count
+			 */
+			igt_info("Child %d skipping no BOs allocated; VRAM/SRAM unavailable\n",
+				 child);
+			process_setup_failed(pdata, false);
+			goto cleanup;
+		}
+		ret = setup_exec_bos(fd_c, ctx.vm_id, vram_bind.n_bufs + sram_bind.n_bufs,
+				     &batch_bo, &ufence_bo);
+		if (ret) {
+			bool oom = ret == -ENOMEM || ret == -ENOSPC;
+
+			if (oom)
+				igt_info("Exec BO setup hit OOM (%s), skipping\n",
+					 strerror(-ret));
+			else
+				igt_warn("Exec BO setup failed: %s\n", strerror(-ret));
+			process_setup_failed(pdata, !oom);
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
+			igt_info("Child %d, rendezvous aborted/timed out, skipping bind + exec\n",
+				 child);
+			process_setup_failed(pdata, true);
+			goto cleanup;
+		case RENDEZVOUS_READY:
+			break;
+		}
+
+		/*
+		 * SRAM mem is allocated at the bind time and competes with RAM, so
+		 * OOM is expected for either bind.
+		 */
+		if (!bind_bos(fd_c, &ctx, &vram_bind, "VRAM", child)) {
+			pdata_lock(pdata);
+			pdata->bind_oom_vram++;
+			pthread_mutex_unlock(&pdata->mutex);
+			goto cleanup;
+		}
+		if (!bind_bos(fd_c, &ctx, &sram_bind, "SRAM", child)) {
+			pdata_lock(pdata);
+			pdata->bind_oom_sram++;
+			pthread_mutex_unlock(&pdata->mutex);
+			goto cleanup;
+		}
+
+		igt_assert((vram_bind.n_bufs + sram_bind.n_bufs) * 4 + 1 <=
+			   batch_bo.size / sizeof(uint32_t));
+		pos = emit_bo_stores(batch_bo.ptr, 0, vram_bind.bufs, vram_bind.n_bufs, child, 0);
+		pos = emit_bo_stores(batch_bo.ptr, pos, sram_bind.bufs, sram_bind.n_bufs, child,
+				     vram_bind.n_bufs);
+		batch_bo.ptr[pos++] = MI_BATCH_BUFFER_END;
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
+		ret = igt_ioctl(fd_c, DRM_IOCTL_XE_EXEC, &exec);
+		igt_assert_f(ret == 0, "xe_exec failed unexpectedly: %s (%d)\n",
+			     strerror(errno), errno);
+		xe_wait_ufence(fd_c, (uint64_t *)ufence_bo.ptr, USER_FENCE_VALUE, ctx.exec_queue_id,
+			       TIMEOUT_NS);
+		verify_bo_stores(fd_c, vram_bind.bufs, vram_bind.n_bufs, child, 0);
+		verify_bo_stores(fd_c, sram_bind.bufs, sram_bind.n_bufs, child, vram_bind.n_bufs);
+		pdata_lock(pdata);
+		pdata->child_completed++;
+		pthread_mutex_unlock(&pdata->mutex);
+cleanup:
+		cleanup_bo_resources(fd_c, &ufence_bo);
+		cleanup_bo_resources(fd_c, &batch_bo);
+		cleanup_sram_vram_objs(fd_c, &vram_bind, &sram_bind);
+		xe_exec_queue_destroy(fd_c, ctx.exec_queue_id);
+		xe_vm_destroy(fd_c, ctx.vm_id);
+		drm_close_driver(fd_c);
+	}
+
+	release_ready_processes(pdata, p.n_proc);
+	/* Wait for specified sec to kill the hanging child process */
+	igt_waitchildren_timeout(5 * TIMEOUT_NS / NSEC_PER_SEC, "Oversubscription child failed");
+	fault_count = pdata->fault_count;
+	child_completed = pdata->child_completed;
+	bind_oom_sram = pdata->bind_oom_sram;
+	bind_oom_vram = pdata->bind_oom_vram;
+	abort_stat = pdata->abort;
+	skipped = pdata->skipped;
+	late_skipped = pdata->late_skipped;
+
+	pthread_cond_destroy(&pdata->cond);
+	pthread_mutex_destroy(&pdata->mutex);
+	igt_assert_eq(munmap(pdata, sizeof(*pdata)), 0);
+
+	igt_info("Oversubscribe summary : %d processes\n", p.n_proc);
+	igt_info("=> Faulted Process(unexpected error): %d\n", fault_count);
+	igt_info("=> Skipped during setup (OOM cases) %d\n", skipped - fault_count);
+	igt_info("=> Skipped during Rendezvous (late arrivals) %d\n", late_skipped);
+	igt_info("=> Bind failed, VRAM OOM (ENOMEM/ENOSPC) %d\n", bind_oom_vram);
+	igt_info("=> Bind failed, SRAM OOM (ENOMEM/ENOSPC) %d\n", bind_oom_sram);
+	igt_info("Successfully completed oversubscription process (exec + verify)  %d\n",
+		 child_completed);
+
+	igt_assert_f(!abort_stat, "Child rendezvous wait timed out\n");
+	igt_assert_f(fault_count == 0, "%d children hit fault\n", fault_count);
+
+	igt_assert_f(child_completed >= 2,
+		     "Only %d/%d processes completed exec+verify (min 2 process needed)\n",
+		     child_completed, p.n_proc);
+}
+
 static void alloc_sizes_init(void)
 {
 	int i;
@@ -935,6 +1573,7 @@ static const struct test_case test_matrix[] = {
 	{ "threads-leak-binding-rand-sizes-50", 50, LEAK_BINDING, TYPE_THREAD, false },
 	{ "threads-leak-binding-rand-sizes-50-unaligned", 50, LEAK_BINDING | UNALIGNED,
 	   TYPE_THREAD, false },
+	{ "vm-oversubscribe-concurrent-bind", 0, 0, TYPE_OVERSUBSCRIBE, false },
 };
 
 int igt_main()
@@ -960,6 +1599,10 @@ int igt_main()
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

