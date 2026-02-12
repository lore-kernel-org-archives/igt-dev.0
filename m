Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF04EB48EE
	for <igt-dev@archiver.kernel.org>; Thu, 12 Feb 2026 09:09:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3BFE10E6FF;
	Thu, 12 Feb 2026 09:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ctVlp6pr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5289C10E143
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Feb 2026 09:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770887384; x=1802423384;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QswfSuto8lZydLOx7F2v2iCY4dfoRCru6XYbY53Baq4=;
 b=ctVlp6pr2tvzRk2C2VyKmzIldBfshzVNqVV/66UHtDZGPUeLmmmpmtO8
 YdTErk1ABFIFLJ2JpN+4ww9OOl8sFLXdlsqMklIFZ/UIlZSsKrpIwUv1g
 0Y/hS1noNKk93XiMs0g8EqjylcLJWcMrJbP290K19zrWw2AHpP1Vxm6mA
 jr3Bx7SD8Oot7Yk3l32vR7QSUcMGNPOntHxHsFjucB0g4EyaTvXplIMfJ
 Y6VhrP6v5cldSlfbCmRckuf5UNHk4G/drjU5SPAndF/24TSEXgwUqXCss
 GY5Qs3B/sNb70qJOY2rzVgpCYlRScy8O4nx0gAmorQaIMPvOiUWdx4sYr w==;
X-CSE-ConnectionGUID: rCOny7RMRrGyI3xQUIqqCw==
X-CSE-MsgGUID: vegTPyD4QgCPfpeqZ17u9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="74653284"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="74653284"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 01:09:43 -0800
X-CSE-ConnectionGUID: UPECHQH0QeW2O1u2mqOc3Q==
X-CSE-MsgGUID: d+R8zF5XS1KEKYpe9EAC6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="212636943"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 01:09:41 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
Subject: [PATCH i-g-t v2 3/3] tests/intel/xe_madvise: Add purgeable BO madvise
 tests
Date: Thu, 12 Feb 2026 14:39:17 +0530
Message-ID: <20260212090921.2079711-4-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260212090921.2079711-1-arvind.yadav@intel.com>
References: <20260212090921.2079711-1-arvind.yadav@intel.com>
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

Create a dedicated IGT test app for purgeable buffer object madvise
functionality. Tests validate the DRM_XE_VMA_PURGEABLE_STATE ioctl
for marking VMA-backed BOs as DONTNEED/WILLNEED and verifying
correct purge behavior under memory pressure.

Tests:
- dontneed-before-mmap: SIGBUS on mmap access after purge
- dontneed-after-mmap: SIGBUS on existing mapping after purge
- dontneed-before-exec: GPU exec behavior with purged data BO
- dontneed-after-exec: Purge after successful GPU write
- per-vma-tracking: Shared BO needs all VMAs DONTNEED to purge
- per-vma-protection: WILLNEED VMA in one VM protects shared BO

v2:
   - Move tests from xe_exec_system_allocator.c to dedicated
     xe_madvise.c (Thomas Hellström).
   - Fix trigger_memory_pressure to use scalable overpressure
    (25% of VRAM, minimum 64MB instead of fixed 64MB). (Pravalika)
   - Add MAP_FAILED check in trigger_memory_pressure.
   - Touch all pages in allocated chunks, not just first 4KB. (Pravalika)
   - Add 100ms sleep before freeing BOs to allow shrinker time
     to process memory pressure.  (Pravalika)
   - Rename 'bo2' to 'handle' for clarity in trigger_memory_pressure.
     (Pravalika)
   - Add NEEDS_VISIBLE_VRAM flag to purgeable_setup_simple_bo
     for consistent CPU mapping support on discrete GPUs.  (Pravalika)
   - Add proper NULL mmap handling in test_dontneed_before_mmap
      with cleanup and early return.  (Pravalika)

Cc: Nishit Sharma <nishit.sharma@intel.com>
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 tests/intel/xe_madvise.c | 747 +++++++++++++++++++++++++++++++++++++++
 tests/meson.build        |   1 +
 2 files changed, 748 insertions(+)
 create mode 100644 tests/intel/xe_madvise.c

diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
new file mode 100644
index 000000000..c08c7922e
--- /dev/null
+++ b/tests/intel/xe_madvise.c
@@ -0,0 +1,747 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+/**
+ * TEST: Validate purgeable BO madvise functionality
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: Memory management tests
+ * Functionality: madvise, purgeable
+ */
+
+#include <fcntl.h>
+#include <setjmp.h>
+#include <signal.h>
+#include <string.h>
+#include <sys/mman.h>
+#include <unistd.h>
+
+#include "igt.h"
+#include "lib/igt_syncobj.h"
+#include "lib/intel_reg.h"
+#include "xe_drm.h"
+
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
+/* Purgeable test constants */
+#define PURGEABLE_ADDR		0x1a0000
+#define PURGEABLE_ADDR2		0x2b0000
+#define PURGEABLE_BATCH_ADDR	0x3c0000
+#define PURGEABLE_BO_SIZE	4096
+#define PURGEABLE_FENCE_VAL	0xbeef
+#define PURGEABLE_TEST_PATTERN	0xc0ffee
+#define PURGEABLE_DEAD_PATTERN	0xdead
+
+/**
+ * trigger_memory_pressure - Fill VRAM + 25% to force purgeable reclaim
+ * @fd: DRM file descriptor
+ * @vm: VM handle (unused, kept for API compatibility)
+ *
+ * Allocates BOs in a temporary VM until VRAM is overcommitted,
+ * forcing the kernel to purge DONTNEED-marked BOs.
+ */
+static void trigger_memory_pressure(int fd, uint32_t vm)
+{
+	uint64_t vram_size, overpressure;
+	const uint64_t chunk = 8ull << 20; /* 8 MiB */
+	int max_objs, n = 0;
+	uint32_t *handles;
+	uint64_t total;
+	void *p;
+	uint32_t handle, temp_vm;
+
+	/* Use a separate VM so pressure BOs don't affect the test VM */
+	temp_vm = xe_vm_create(fd, 0, 0);
+
+	vram_size = xe_visible_vram_size(fd, 0);
+	/* Scale overpressure to 25% of VRAM, minimum 64MB */
+	overpressure = vram_size / 4;
+	if (overpressure < (64 << 20))
+		overpressure = 64 << 20;
+
+	max_objs = (vram_size + overpressure) / chunk + 1;
+	handles = malloc(max_objs * sizeof(*handles));
+	igt_assert(handles);
+
+	total = 0;
+	while (total < vram_size + overpressure && n < max_objs) {
+		handle = xe_bo_create(fd, temp_vm, chunk,
+				      vram_if_possible(fd, 0),
+				      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		handles[n++] = handle;
+		total += chunk;
+
+		p = xe_bo_map(fd, handle, chunk);
+		igt_assert(p != MAP_FAILED);
+
+		/* Fault in all pages so they actually consume VRAM */
+		memset(p, 0xCD, chunk);
+		munmap(p, chunk);
+	}
+
+	/* Allow shrinker time to process pressure */
+	usleep(100000);
+
+	for (int i = 0; i < n; i++)
+		gem_close(fd, handles[i]);
+
+	free(handles);
+
+	xe_vm_destroy(fd, temp_vm);
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
+ * purgeable_mark_and_verify_purged - Mark DONTNEED, pressure, check purged
+ * @fd: DRM file descriptor
+ * @vm: VM handle
+ * @addr: Virtual address of the BO
+ * @size: Size of the BO
+ *
+ * Returns true if the BO was purged under memory pressure.
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
+	*bo = xe_bo_create(fd, *vm, size, vram_if_possible(fd, 0),
+			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
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
+static void purgeable_setup_batch_and_data(int fd, uint32_t *vm,
+					   uint32_t *bind_engine,
+					   uint32_t *batch_bo,
+					   uint32_t *data_bo,
+					   uint32_t **batch,
+					   uint32_t **data,
+					   uint64_t batch_addr,
+					   uint64_t data_addr,
+					   size_t batch_size,
+					   size_t data_size)
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
+					       uint32_t *bo, uint64_t addr1,
+					       uint64_t addr2, size_t size,
+					       bool use_scratch)
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
+ * SUBTEST: dontneed-before-mmap
+ * Description: Mark BO as DONTNEED before mmap, verify mmap fails or SIGBUS on access
+ * Test category: functionality test
+ */
+static void test_dontneed_before_mmap(int fd, struct drm_xe_engine_class_instance *hwe)
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
+	/*
+	 * Kernel may either fail the mmap or succeed but SIGBUS on access.
+	 * Both are valid — handle like gem_madvise.
+	 */
+	map = __gem_mmap__device_coherent(fd, bo, 0, bo_size, PROT_READ | PROT_WRITE);
+	if (!map) {
+		/* mmap failed on purged BO - acceptable behavior */
+		gem_close(fd, bo);
+		xe_vm_destroy(fd, vm);
+		return;
+	}
+
+	/* mmap succeeded - access must trigger SIGBUS */
+	{
+		sighandler_t old_sigsegv, old_sigbus;
+		char *ptr = (char *)map;
+		int sig;
+
+		old_sigsegv = signal(SIGSEGV, (__sighandler_t)sigtrap);
+		old_sigbus = signal(SIGBUS, (__sighandler_t)sigtrap);
+
+		sig = sigsetjmp(jmp, SIGBUS | SIGSEGV);
+		switch (sig) {
+		case SIGBUS:
+			break;
+		case 0:
+			*ptr = 0;
+			__attribute__ ((fallthrough));
+		default:
+			igt_assert_f(false,
+				     "Access to purged mmap should trigger SIGBUS, got sig=%d\n",
+				     sig);
+			break;
+		}
+
+		signal(SIGBUS, old_sigbus);
+		signal(SIGSEGV, old_sigsegv);
+		munmap(map, bo_size);
+	}
+
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
+/**
+ * SUBTEST: dontneed-after-mmap
+ * Description: Mark BO as DONTNEED after mmap, verify SIGBUS on accessing purged mapping
+ * Test category: functionality test
+ */
+static void test_dontneed_after_mmap(int fd, struct drm_xe_engine_class_instance *hwe)
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
+ * SUBTEST: dontneed-before-exec
+ * Description: Mark BO as DONTNEED before GPU exec, verify GPU behavior with SCRATCH_PAGE
+ * Test category: functionality test
+ */
+static void test_dontneed_before_exec(int fd, struct drm_xe_engine_class_instance *hwe)
+{
+	uint32_t vm, exec_queue, bo, batch_bo, bind_engine;
+	uint64_t data_addr = PURGEABLE_ADDR;
+	uint64_t batch_addr = PURGEABLE_BATCH_ADDR;
+	size_t data_size = PURGEABLE_BO_SIZE;
+	size_t batch_size = PURGEABLE_BO_SIZE;
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		  .timeline_value = PURGEABLE_FENCE_VAL },
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
+	purgeable_setup_batch_and_data(fd, &vm, &bind_engine, &batch_bo,
+				       &bo, &batch, &data, batch_addr,
+				       data_addr, batch_size, data_size);
+
+	/* Prepare batch */
+	b = 0;
+	batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+	batch[b++] = data_addr;
+	batch[b++] = data_addr >> 32;
+	batch[b++] = PURGEABLE_DEAD_PATTERN;
+	batch[b++] = MI_BATCH_BUFFER_END;
+
+	/* Phase 1: Purge data BO, batch BO still valid */
+	igt_assert(purgeable_mark_and_verify_purged(fd, vm, data_addr, data_size));
+
+	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
+	exec.exec_queue_id = exec_queue;
+	exec.address = batch_addr;
+
+	vm_sync = 0;
+	sync[0].addr = to_user_pointer(&vm_sync);
+
+	/*
+	 * VM has SCRATCH_PAGE — exec may succeed with the GPU write
+	 * landing on scratch instead of the purged data BO.
+	 */
+	ret = __xe_exec(fd, &exec);
+	if (ret == 0) {
+		int64_t timeout = NSEC_PER_SEC;
+
+		__xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL,
+				 exec_queue, &timeout);
+	}
+
+	/*
+	 * Don't purge the batch BO — GPU would fetch zeroed scratch
+	 * instructions and trigger an engine reset.
+	 */
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
+ * SUBTEST: dontneed-after-exec
+ * Description: Mark BO as DONTNEED after GPU exec, verify memory becomes inaccessible
+ * Test category: functionality test
+ */
+static void test_dontneed_after_exec(int fd, struct drm_xe_engine_class_instance *hwe)
+{
+	uint32_t vm, exec_queue, bo, batch_bo, bind_engine;
+	uint64_t data_addr = PURGEABLE_ADDR;
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
+		.num_syncs = 2,
+		.syncs = to_user_pointer(sync),
+	};
+	uint32_t *data, *batch;
+	uint32_t syncobj;
+	int b, ret;
+
+	purgeable_setup_batch_and_data(fd, &vm, &bind_engine, &batch_bo,
+				       &bo, &batch, &data, batch_addr,
+				       data_addr, batch_size, data_size);
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
+ * SUBTEST: per-vma-tracking
+ * Description: One BO in two VMs becomes purgeable only when both VMAs are DONTNEED
+ * Test category: functionality test
+ */
+static void test_per_vma_tracking(int fd, struct drm_xe_engine_class_instance *hwe)
+{
+	uint32_t bo, vm1, vm2;
+	uint64_t addr1 = PURGEABLE_ADDR;
+	uint64_t addr2 = PURGEABLE_ADDR2;
+	size_t bo_size = PURGEABLE_BO_SIZE;
+	uint32_t retained;
+	void *map;
+
+	map = purgeable_setup_two_vms_shared_bo(fd, &vm1, &vm2, &bo,
+						addr1, addr2,
+						bo_size, false);
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
+ * SUBTEST: per-vma-protection
+ * Description: WILLNEED VMA protects BO from purging; both DONTNEED makes BO purgeable
+ * Test category: functionality test
+ */
+static void test_per_vma_protection(int fd, struct drm_xe_engine_class_instance *hwe)
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
+						 data_addr1, data_addr2,
+						 data_size, true);
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
+	/* Exec on purged BO — may succeed (scratch rebind) or fail, both OK */
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
+int igt_main()
+{
+	struct drm_xe_engine_class_instance *hwe;
+	int fd;
+
+	igt_fixture() {
+		fd = drm_open_driver(DRIVER_XE);
+		xe_device_get(fd);
+	}
+
+	igt_subtest("dontneed-before-mmap")
+		xe_for_each_engine(fd, hwe) {
+			test_dontneed_before_mmap(fd, hwe);
+			break;
+		}
+
+	igt_subtest("dontneed-after-mmap")
+		xe_for_each_engine(fd, hwe) {
+			test_dontneed_after_mmap(fd, hwe);
+			break;
+		}
+
+	igt_subtest("dontneed-before-exec")
+		xe_for_each_engine(fd, hwe) {
+			test_dontneed_before_exec(fd, hwe);
+			break;
+		}
+
+	igt_subtest("dontneed-after-exec")
+		xe_for_each_engine(fd, hwe) {
+			test_dontneed_after_exec(fd, hwe);
+			break;
+		}
+
+	igt_subtest("per-vma-tracking")
+		xe_for_each_engine(fd, hwe) {
+			test_per_vma_tracking(fd, hwe);
+			break;
+		}
+
+	igt_subtest("per-vma-protection")
+		xe_for_each_engine(fd, hwe) {
+			test_per_vma_protection(fd, hwe);
+			break;
+		}
+
+	igt_fixture() {
+		xe_device_put(fd);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 0ad728b87..9d41d7de6 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -313,6 +313,7 @@ intel_xe_progs = [
 	'xe_huc_copy',
 	'xe_intel_bb',
 	'xe_live_ktest',
+	'xe_madvise',
 	'xe_media_fill',
 	'xe_mmap',
         'xe_module_load',
-- 
2.43.0

