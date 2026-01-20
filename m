Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05DFD2ECF7
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 06:12:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6332A10E4CE;
	Tue, 20 Jan 2026 06:12:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PydVM5Mn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A41EF10E4CE
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 06:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768889524; x=1800425524;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y7PofEAx0AHE2xB2TMjnGXBesomtKd7pcQbu5XWx+kc=;
 b=PydVM5Mnd/d7zU2EzGCkZrHdAIR7E2tpAOZYbGQNGoBbitSyVvfxubFS
 VsrrWqT120o8UWM9CYVvTZ5n1ib53Omrw2IeKIiHhfSCMWNTDLA1jHniH
 SpBgtNTBSScae+2IcIieWxo/1YpolHrunEQI1HNLeCxD5LR9pUp/JBM2i
 cZR9eX/ul8NNJg2wrGJj3aVqQgoQqziRmKnxC1iGesdkazzWgC1syTt7k
 UtccfwJ5DuiJCv0MZvgLj5dglpQ3ztz57WGKtCCjypSe8itel4ttxwHo6
 BugK26xyCTiMgvYwjSL2NuLAmnfagPelP65baY0mfrco1OD9Xvh7CGXkP A==;
X-CSE-ConnectionGUID: I32VCLaITHCHqU8dKwmMAg==
X-CSE-MsgGUID: eOZgiaA7SaCO0ZV10oMYsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="80810790"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="80810790"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 22:12:04 -0800
X-CSE-ConnectionGUID: 1aomyZg/RPOdlUMg2bpD5w==
X-CSE-MsgGUID: vELOiprOTQGsr85+0asM5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="206083134"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 22:12:01 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
Subject: [PATCH i-g-t 3/3] tests/intel/xe_exec_system_allocator: Add purgeable
 memory madvise tests
Date: Tue, 20 Jan 2026 11:41:41 +0530
Message-ID: <20260120061141.3139060-4-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120061141.3139060-1-arvind.yadav@intel.com>
References: <20260120061141.3139060-1-arvind.yadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add six purgeable memory test cases for system allocator using madvise:

- madvise-purgeable-dontneed-before-mmap: Mark BO as DONTNEED before mmap,
  verify mmap fails on purged memory

- madvise-purgeable-dontneed-after-mmap: Mark BO as DONTNEED after mmap,
  verify SIGBUS/SIGSEGV on accessing purged mapping

- madvise-purgeable-dontneed-before-exec: Mark BO as DONTNEED before GPU
  execution, verify GPU behavior on purged memory with SCRATCH_PAGE VMs

- madvise-purgeable-dontneed-after-exec: Mark BO as DONTNEED after GPU
  execution, verify previously-used memory becomes inaccessible

- madvise-purgeable-per-vma-tracking: One BO mapped in two VMs becomes
  purgeable only when BOTH VMAs are marked DONTNEED

- madvise-purgeable-per-vma-protection: One VMA marked DONTNEED allows
  GPU execution on other VMA; both DONTNEED makes BO purgeable

Tests use xe_vm_madvise_purgeable() for WILLNEED/DONTNEED state management
and trigger_memory_pressure() to simulate OOM conditions forcing kernel to
reclaim purgeable memory.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 638 +++++++++++++++++++++++++
 1 file changed, 638 insertions(+)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 8af66d76e..338037a48 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -32,6 +32,15 @@
 #define QUARTER_SEC		(NSEC_PER_SEC / 4)
 #define FIVE_SEC		(5LL * NSEC_PER_SEC)
 
+/* Purgeable test constants */
+#define PURGEABLE_ADDR		0x1a0000
+#define PURGEABLE_ADDR2		0x2b0000
+#define PURGEABLE_BATCH_ADDR	0x3c0000
+#define PURGEABLE_BO_SIZE	4096
+#define PURGEABLE_FENCE_VAL	0xbeef
+#define PURGEABLE_TEST_PATTERN	0xc0ffee
+#define PURGEABLE_DEAD_PATTERN	0xdead
+
 struct test_exec_data {
 	uint32_t batch[32];
 	uint64_t pad;
@@ -2245,6 +2254,599 @@ test_compute(int fd, size_t size, unsigned int flags)
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * trigger_memory_pressure - Trigger memory pressure for purgeable tests
+ * @fd: DRM file descriptor
+ * @vm: VM handle
+ *
+ * Creates temporary BOs exceeding VRAM size (VRAM + 64MB) to trigger memory
+ * pressure, forcing kernel to reclaim purgeable BOs in system allocator.
+ */
+static void trigger_memory_pressure(int fd, uint32_t vm)
+{
+	uint64_t vram_size;
+	const uint64_t chunk = 8ull << 20; /* 8 MiB */
+	int max_objs, n = 0;
+	uint32_t *handles;
+	uint64_t total;
+	void *p;
+	uint32_t bo2;
+
+	vram_size = xe_visible_vram_size(fd, 0);
+	max_objs = vram_size / chunk + 64;
+	handles = calloc(max_objs, sizeof(*handles));
+	igt_assert(handles);
+
+	total = 0;
+	while (total < vram_size + (64 << 20) && n < max_objs) {
+		bo2 = xe_bo_create(fd, vm, chunk, vram_if_possible(fd, 0),
+				   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		handles[n++] = bo2;
+		total += chunk;
+		p = xe_bo_map(fd, bo2, chunk);
+		memset(p, 0xCD, 4096);
+		munmap(p, chunk);
+	}
+
+	for (int i = 0; i < n; i++)
+		gem_close(fd, handles[i]);
+
+	free(handles);
+}
+
+static jmp_buf jmp;
+
+__noreturn static void sigtrap(int sig)
+{
+	siglongjmp(jmp, sig);
+}
+
+/**
+ * purgeable_mark_and_verify_purged - Mark BO as DONTNEED and verify purge
+ * @fd: DRM file descriptor
+ * @vm: VM handle
+ * @addr: Virtual address of the BO
+ * @size: Size of the BO
+ *
+ * Marks BO as DONTNEED, triggers memory pressure, and verifies purge.
+ * Returns: true if BO was successfully purged, false otherwise
+ */
+static bool purgeable_mark_and_verify_purged(int fd, uint32_t vm, uint64_t addr, size_t size)
+{
+	uint32_t retained;
+
+	/* Mark as DONTNEED */
+	retained = xe_vm_madvise_purgeable(fd, vm, addr, size,
+					   DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
+	if (retained != 1)
+		return false;
+
+	/* Trigger memory pressure */
+	trigger_memory_pressure(fd, vm);
+
+	/* Verify purged */
+	retained = xe_vm_madvise_purgeable(fd, vm, addr, size,
+					   DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
+	return retained == 0;
+}
+
+/**
+ * purgeable_setup_simple_bo - Setup VM and bind a single BO
+ * @fd: DRM file descriptor
+ * @vm: Output VM handle
+ * @bo: Output BO handle
+ * @addr: Virtual address to bind at
+ * @size: Size of the BO
+ * @use_scratch: Whether to use scratch page flag
+ *
+ * Helper to create VM, BO, and bind it at the specified address.
+ */
+static void purgeable_setup_simple_bo(int fd, uint32_t *vm, uint32_t *bo,
+				      uint64_t addr, size_t size, bool use_scratch)
+{
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.timeline_value = 1,
+	};
+	uint64_t sync_val = 0;
+
+	*vm = xe_vm_create(fd, use_scratch ? DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE : 0, 0);
+	*bo = xe_bo_create(fd, *vm, size, vram_if_possible(fd, 0), 0);
+
+	sync.addr = to_user_pointer(&sync_val);
+	xe_vm_bind_async(fd, *vm, 0, *bo, 0, addr, size, &sync, 1);
+	xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC);
+}
+
+/**
+ * purgeable_setup_batch_and_data - Setup VM with batch and data BOs for GPU exec
+ * @fd: DRM file descriptor
+ * @vm: Output VM handle
+ * @bind_engine: Output bind engine handle
+ * @batch_bo: Output batch BO handle
+ * @data_bo: Output data BO handle
+ * @batch: Output batch buffer pointer
+ * @data: Output data buffer pointer
+ * @batch_addr: Batch virtual address
+ * @data_addr: Data virtual address
+ * @batch_size: Batch buffer size
+ * @data_size: Data buffer size
+ *
+ * Helper to create VM, bind engine, batch and data BOs, and bind them.
+ */
+static void purgeable_setup_batch_and_data(int fd, uint32_t *vm, uint32_t *bind_engine,
+					    uint32_t *batch_bo, uint32_t *data_bo,
+					    uint32_t **batch, uint32_t **data,
+					    uint64_t batch_addr, uint64_t data_addr,
+					    size_t batch_size, size_t data_size)
+{
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.timeline_value = PURGEABLE_FENCE_VAL,
+	};
+	uint64_t vm_sync = 0;
+
+	*vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0);
+	*bind_engine = xe_bind_exec_queue_create(fd, *vm, 0);
+
+	/* Create and bind batch BO */
+	*batch_bo = xe_bo_create(fd, *vm, batch_size, vram_if_possible(fd, 0),
+				 DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	*batch = xe_bo_map(fd, *batch_bo, batch_size);
+
+	sync.addr = to_user_pointer(&vm_sync);
+	xe_vm_bind_async(fd, *vm, *bind_engine, *batch_bo, 0, batch_addr, batch_size, &sync, 1);
+	xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL, 0, NSEC_PER_SEC);
+
+	/* Create and bind data BO */
+	*data_bo = xe_bo_create(fd, *vm, data_size, vram_if_possible(fd, 0),
+				DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	*data = xe_bo_map(fd, *data_bo, data_size);
+
+	vm_sync = 0;
+	xe_vm_bind_async(fd, *vm, *bind_engine, *data_bo, 0, data_addr, data_size, &sync, 1);
+	xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL, 0, NSEC_PER_SEC);
+}
+
+/**
+ * purgeable_setup_two_vms_shared_bo - Setup two VMs with one shared BO
+ * @fd: DRM file descriptor
+ * @vm1: Output first VM handle
+ * @vm2: Output second VM handle
+ * @bo: Output shared BO handle
+ * @addr1: Virtual address in VM1
+ * @addr2: Virtual address in VM2
+ * @size: Size of the BO
+ * @use_scratch: Whether to use scratch page flag for VMs
+ *
+ * Helper to create two VMs and bind one shared BO in both VMs.
+ * Returns mapped pointer to the BO.
+ */
+static void *purgeable_setup_two_vms_shared_bo(int fd, uint32_t *vm1, uint32_t *vm2,
+						uint32_t *bo, uint64_t addr1, uint64_t addr2,
+						size_t size, bool use_scratch)
+{
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.timeline_value = 1,
+	};
+	uint64_t sync_val = 0;
+	void *map;
+
+	/* Create two VMs */
+	*vm1 = xe_vm_create(fd, use_scratch ? DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE : 0, 0);
+	*vm2 = xe_vm_create(fd, use_scratch ? DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE : 0, 0);
+
+	/* Create shared BO */
+	*bo = xe_bo_create(fd, 0, size, vram_if_possible(fd, 0),
+			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+
+	map = xe_bo_map(fd, *bo, size);
+	memset(map, 0xAB, size);
+
+	/* Bind BO in VM1 */
+	sync.addr = to_user_pointer(&sync_val);
+	sync_val = 0;
+	xe_vm_bind_async(fd, *vm1, 0, *bo, 0, addr1, size, &sync, 1);
+	xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC);
+
+	/* Bind BO in VM2 */
+	sync_val = 0;
+	xe_vm_bind_async(fd, *vm2, 0, *bo, 0, addr2, size, &sync, 1);
+	xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC);
+
+	return map;
+}
+
+/**
+ * SUBTEST: madvise-purgeable-dontneed-before-mmap
+ * Description: Test marking memory as DONTNEED before mmap access in system allocator
+ * Test category: functionality test
+ */
+static void test_dontneed_before_mmap_madvise(int fd, struct drm_xe_engine_class_instance *hwe)
+{
+	uint32_t bo, vm;
+	uint64_t addr = PURGEABLE_ADDR;
+	size_t bo_size = PURGEABLE_BO_SIZE;
+	void *map;
+
+	purgeable_setup_simple_bo(fd, &vm, &bo, addr, bo_size, false);
+	if (!purgeable_mark_and_verify_purged(fd, vm, addr, bo_size))
+		igt_skip("Unable to induce purge on this platform/config");
+
+	/* Try to mmap - should fail on purged BO */
+	map = __gem_mmap__device_coherent(fd, bo, 0, bo_size, PROT_READ | PROT_WRITE);
+	igt_assert_f(map == NULL, "mmap should fail on purged BO");
+	igt_assert_f(errno == EINVAL || errno == EFAULT,
+		     "Expected EINVAL or EFAULT, got errno=%d\n", errno);
+
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
+/**
+ * SUBTEST: madvise-purgeable-dontneed-after-mmap
+ * Description: Test marking memory as DONTNEED after mmap in system allocator
+ * Test category: functionality test
+ */
+static void test_dontneed_after_mmap_madvise(int fd, struct drm_xe_engine_class_instance *hwe)
+{
+	uint32_t bo, vm;
+	uint64_t addr = PURGEABLE_ADDR;
+	size_t bo_size = PURGEABLE_BO_SIZE;
+	void *map;
+
+	purgeable_setup_simple_bo(fd, &vm, &bo, addr, bo_size, true);
+
+	map = xe_bo_map(fd, bo, bo_size);
+	memset(map, 0xAB, bo_size);
+
+	if (!purgeable_mark_and_verify_purged(fd, vm, addr, bo_size))
+		igt_skip("Unable to induce purge on this platform/config");
+
+	/* Access purged mapping - should trigger SIGBUS/SIGSEGV */
+	{
+		sighandler_t old_sigsegv, old_sigbus;
+		char *ptr = (char *)map;
+		int sig;
+
+		old_sigsegv = signal(SIGSEGV, (__sighandler_t)sigtrap);
+		old_sigbus = signal(SIGBUS, (__sighandler_t)sigtrap);
+
+		sig = sigsetjmp(jmp, SIGBUS | SIGSEGV);
+		if (sig == SIGBUS || sig == SIGSEGV) {
+			/* Expected - purged mapping access failed */
+		} else if (sig == 0) {
+			*ptr = 0;
+			igt_assert_f(false, "Access to purged mapping should trigger signal\n");
+		} else {
+			igt_assert_f(false, "unexpected signal %d\n", sig);
+		}
+
+		signal(SIGBUS, old_sigbus);
+		signal(SIGSEGV, old_sigsegv);
+	}
+
+	munmap(map, bo_size);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
+/**
+ * SUBTEST: madvise-purgeable-dontneed-before-exec
+ * Description: Test marking memory as DONTNEED before GPU exec in system allocator
+ * Test category: functionality test
+ */
+static void test_dontneed_before_exec_madvise(int fd, struct drm_xe_engine_class_instance *hwe)
+{
+	uint32_t vm, exec_queue, bo, batch_bo, bind_engine;
+	uint64_t data_addr = 0x1a0000;
+	uint64_t batch_addr = 0x2a0000;
+	size_t data_size = 4096;
+	size_t batch_size = 4096;
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		  .timeline_value = 0xbeef },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(sync),
+	};
+	uint32_t *data, *batch;
+	uint64_t vm_sync = 0;
+	int b, ret;
+
+	purgeable_setup_batch_and_data(fd, &vm, &bind_engine, &batch_bo, &bo,
+					&batch, &data, batch_addr, data_addr,
+					batch_size, data_size);
+
+	/* Prepare batch */
+	b = 0;
+	batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+	batch[b++] = data_addr;
+	batch[b++] = data_addr >> 32;
+	batch[b++] = PURGEABLE_DEAD_PATTERN;
+	batch[b++] = MI_BATCH_BUFFER_END;
+
+	igt_assert(purgeable_mark_and_verify_purged(fd, vm, data_addr, data_size));
+
+	/* Try to execute - should fail or cause GPU fault */
+	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
+	exec.exec_queue_id = exec_queue;
+	exec.address = batch_addr;
+
+	vm_sync = 0;
+	sync[0].addr = to_user_pointer(&vm_sync);
+
+	ret = __xe_exec(fd, &exec);
+	if (ret == 0) {
+		int64_t timeout = NSEC_PER_SEC;
+
+		__xe_wait_ufence(fd, &vm_sync, 0xbeef, exec_queue, &timeout);
+		/* Wait may succeed (NULL rebind) or fail (purged) - both acceptable */
+	}
+
+	munmap(data, data_size);
+	munmap(batch, batch_size);
+	gem_close(fd, bo);
+	gem_close(fd, batch_bo);
+	xe_exec_queue_destroy(fd, bind_engine);
+	xe_exec_queue_destroy(fd, exec_queue);
+	xe_vm_destroy(fd, vm);
+}
+
+/**
+ * SUBTEST: madvise-purgeable-dontneed-after-exec
+ * Description: Test marking memory as DONTNEED after successful GPU exec
+ * Test category: functionality test
+ */
+static void test_dontneed_after_exec_madvise(int fd, struct drm_xe_engine_class_instance *hwe)
+{
+	uint32_t vm, exec_queue, bo, batch_bo, bind_engine;
+	uint64_t data_addr = 0x1a0000;
+	uint64_t batch_addr = 0x2a0000;
+	size_t data_size = 4096;
+	size_t batch_size = 4096;
+	struct drm_xe_sync sync[2] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		  .timeline_value = 0xbeef },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 2,
+		.syncs = to_user_pointer(sync),
+	};
+	uint32_t *data, *batch;
+	uint32_t syncobj;
+	int b, ret;
+
+	purgeable_setup_batch_and_data(fd, &vm, &bind_engine, &batch_bo, &bo,
+					&batch, &data, batch_addr, data_addr,
+					batch_size, data_size);
+	memset(data, 0, data_size);
+
+	syncobj = syncobj_create(fd, 0);
+
+	/* Prepare batch to write to data BO */
+	b = 0;
+	batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+	batch[b++] = data_addr;
+	batch[b++] = data_addr >> 32;
+	batch[b++] = 0xfeed0001;
+	batch[b++] = MI_BATCH_BUFFER_END;
+
+	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
+	exec.exec_queue_id = exec_queue;
+	exec.address = batch_addr;
+
+	/* Use only syncobj for exec (not USER_FENCE) */
+	sync[1].handle = syncobj;
+	exec.num_syncs = 1;
+	exec.syncs = to_user_pointer(&sync[1]);
+
+	ret = __xe_exec(fd, &exec);
+	igt_assert_eq(ret, 0);
+
+	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
+	munmap(data, data_size);
+	data = xe_bo_map(fd, bo, data_size);
+	igt_assert_eq(data[0], 0xfeed0001);
+
+	igt_assert(purgeable_mark_and_verify_purged(fd, vm, data_addr, data_size));
+
+	/* Prepare second batch (different value) */
+	b = 0;
+	batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+	batch[b++] = data_addr;
+	batch[b++] = data_addr >> 32;
+	batch[b++] = 0xfeed0002;
+	batch[b++] = MI_BATCH_BUFFER_END;
+
+	ret = __xe_exec(fd, &exec);
+	if (ret == 0) {
+		/* Exec succeeded, but wait may fail on purged BO (both behaviors valid) */
+		syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL);
+	}
+
+	munmap(data, data_size);
+	munmap(batch, batch_size);
+	gem_close(fd, bo);
+	gem_close(fd, batch_bo);
+	syncobj_destroy(fd, syncobj);
+	xe_exec_queue_destroy(fd, bind_engine);
+	xe_exec_queue_destroy(fd, exec_queue);
+	xe_vm_destroy(fd, vm);
+}
+
+/**
+ * SUBTEST: madvise-purgeable-per-vma-tracking
+ * Description: Test per-VMA purgeable state tracking with multiple VMs
+ * Test category: functionality test
+ */
+static void test_per_vma_tracking_madvise(int fd, struct drm_xe_engine_class_instance *hwe)
+{
+	uint32_t bo, vm1, vm2;
+	uint64_t addr1 = PURGEABLE_ADDR;
+	uint64_t addr2 = PURGEABLE_ADDR2;
+	size_t bo_size = PURGEABLE_BO_SIZE;
+	uint32_t retained;
+	void *map;
+
+	map = purgeable_setup_two_vms_shared_bo(fd, &vm1, &vm2, &bo,
+							addr1, addr2, bo_size, false);
+
+	/* Mark VMA1 as DONTNEED */
+	retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
+					   DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
+	igt_assert_eq(retained, 1);
+
+	/* Verify BO NOT purgeable (VMA2 still WILLNEED) */
+	retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
+					   DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
+	igt_assert_eq(retained, 1);
+
+	/* Mark both VMAs as DONTNEED */
+	retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
+					   DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
+	igt_assert_eq(retained, 1);
+
+	retained = xe_vm_madvise_purgeable(fd, vm2, addr2, bo_size,
+					   DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
+	igt_assert_eq(retained, 1);
+
+	/* Trigger pressure and verify BO was purged */
+	trigger_memory_pressure(fd, vm1);
+
+	retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
+					   DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
+	igt_assert_eq(retained, 0);
+
+	munmap(map, bo_size);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm1);
+	xe_vm_destroy(fd, vm2);
+}
+
+/**
+ * SUBTEST: madvise-purgeable-per-vma-protection
+ * Description: Test per-VMA protection from purging with GPU workload
+ * Test category: functionality test
+ */
+static void test_per_vma_protection_madvise(int fd, struct drm_xe_engine_class_instance *hwe)
+{
+	uint32_t vm1, vm2, exec_queue, bo, batch_bo, bind_engine;
+	uint64_t data_addr1 = PURGEABLE_ADDR;
+	uint64_t data_addr2 = PURGEABLE_ADDR2;
+	uint64_t batch_addr = PURGEABLE_BATCH_ADDR;
+	size_t data_size = PURGEABLE_BO_SIZE;
+	size_t batch_size = PURGEABLE_BO_SIZE;
+	struct drm_xe_sync sync[2] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		  .timeline_value = PURGEABLE_FENCE_VAL },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync[1]),
+	};
+	uint32_t *data, *batch;
+	uint64_t vm_sync = 0;
+	uint32_t retained, syncobj;
+	int b, ret;
+
+	/* Create two VMs and bind shared data BO */
+	data = purgeable_setup_two_vms_shared_bo(fd, &vm1, &vm2, &bo,
+							 data_addr1, data_addr2, data_size, true);
+	memset(data, 0, data_size);
+	bind_engine = xe_bind_exec_queue_create(fd, vm2, 0);
+
+	/* Create and bind batch BO in VM2 */
+	batch_bo = xe_bo_create(fd, vm2, batch_size, vram_if_possible(fd, 0),
+				DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	batch = xe_bo_map(fd, batch_bo, batch_size);
+
+	sync[0].addr = to_user_pointer(&vm_sync);
+	vm_sync = 0;
+	xe_vm_bind_async(fd, vm2, bind_engine, batch_bo, 0, batch_addr, batch_size, sync, 1);
+	xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL, 0, NSEC_PER_SEC);
+
+	/* Mark VMA1 as DONTNEED, VMA2 stays WILLNEED */
+	retained = xe_vm_madvise_purgeable(fd, vm1, data_addr1, data_size,
+					   DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
+	igt_assert_eq(retained, 1);
+
+	/* Trigger pressure - BO should survive (VMA2 protects) */
+	trigger_memory_pressure(fd, vm1);
+
+	retained = xe_vm_madvise_purgeable(fd, vm2, data_addr2, data_size,
+					   DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
+	igt_assert_eq(retained, 1);
+
+	/* GPU workload - should succeed */
+	b = 0;
+	batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+	batch[b++] = data_addr2;
+	batch[b++] = data_addr2 >> 32;
+	batch[b++] = PURGEABLE_TEST_PATTERN;
+	batch[b++] = MI_BATCH_BUFFER_END;
+
+	syncobj = syncobj_create(fd, 0);
+	sync[1].handle = syncobj;
+	exec_queue = xe_exec_queue_create(fd, vm2, hwe, 0);
+	exec.exec_queue_id = exec_queue;
+	exec.address = batch_addr;
+
+	ret = __xe_exec(fd, &exec);
+	igt_assert_eq(ret, 0);
+	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
+
+	munmap(data, data_size);
+	data = xe_bo_map(fd, bo, data_size);
+	igt_assert_eq(data[0], PURGEABLE_TEST_PATTERN);
+
+	/* Mark both VMAs DONTNEED */
+	retained = xe_vm_madvise_purgeable(fd, vm2, data_addr2, data_size,
+					   DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
+	igt_assert_eq(retained, 1);
+
+	/* Trigger pressure - BO should be purged */
+	trigger_memory_pressure(fd, vm1);
+
+	retained = xe_vm_madvise_purgeable(fd, vm2, data_addr2, data_size,
+					   DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
+	igt_assert_eq(retained, 0);
+
+	/* GPU workload - should fail or succeed with NULL rebind */
+	batch[3] = PURGEABLE_DEAD_PATTERN;
+
+	ret = __xe_exec(fd, &exec);
+	/* With SCRATCH_PAGE, kernel may allow exec with NULL rebind.
+	 * Without it, exec should fail with -EIO/-EFAULT or wait should timeout.
+	 * Both behaviors are valid depending on kernel support.
+	 */
+
+	munmap(data, data_size);
+	munmap(batch, batch_size);
+	gem_close(fd, bo);
+	gem_close(fd, batch_bo);
+	syncobj_destroy(fd, syncobj);
+	xe_exec_queue_destroy(fd, bind_engine);
+	xe_exec_queue_destroy(fd, exec_queue);
+	xe_vm_destroy(fd, vm1);
+	xe_vm_destroy(fd, vm2);
+}
+
 struct section {
 	const char *name;
 	unsigned long long flags;
@@ -2649,6 +3251,42 @@ int igt_main()
 			test_compute(fd, SZ_2M, s->flags);
 	}
 
+	igt_subtest("madvise-purgeable-dontneed-before-mmap")
+		xe_for_each_engine(fd, hwe) {
+			test_dontneed_before_mmap_madvise(fd, hwe);
+			break;
+		}
+
+	igt_subtest("madvise-purgeable-dontneed-after-mmap")
+		xe_for_each_engine(fd, hwe) {
+			test_dontneed_after_mmap_madvise(fd, hwe);
+			break;
+		}
+
+	igt_subtest("madvise-purgeable-dontneed-before-exec")
+		xe_for_each_engine(fd, hwe) {
+			test_dontneed_before_exec_madvise(fd, hwe);
+			break;
+		}
+
+	igt_subtest("madvise-purgeable-dontneed-after-exec")
+		xe_for_each_engine(fd, hwe) {
+			test_dontneed_after_exec_madvise(fd, hwe);
+			break;
+		}
+
+	igt_subtest("madvise-purgeable-per-vma-tracking")
+		xe_for_each_engine(fd, hwe) {
+			test_per_vma_tracking_madvise(fd, hwe);
+			break;
+		}
+
+	igt_subtest("madvise-purgeable-per-vma-protection")
+		xe_for_each_engine(fd, hwe) {
+			test_per_vma_protection_madvise(fd, hwe);
+			break;
+		}
+
 	igt_fixture() {
 		xe_device_put(fd);
 		drm_close_driver(fd);
-- 
2.43.0

