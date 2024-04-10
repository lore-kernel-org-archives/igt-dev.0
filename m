Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78E2CD11C2
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 07:11:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451B21131FF;
	Wed, 10 Apr 2024 07:11:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c7pTE78n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB6991131FE
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 07:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712733106; x=1744269106;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6FC8Q7CC3qa3YwRAPWHSnfw8+3jOyfbmLj9PuO0SAh8=;
 b=c7pTE78nllDgQaJtom2Q+o9PCMXn0J1OJ0FC8mdA5VvJG3D9kEp+TQV6
 i8PhQLAfkAUy+s2UCN/pRW6DwQhE3e1XtNrmKtAdSHbOsceAZNe6JITie
 wfLE5u2KOX84xisCHxHZ9O+vsP5SJEpUHiIyftXlN69cl4hWjSg/HfRp1
 pLC3lx8k2LYVFtQHMFpOK08fzGXESd1YNIcVUhXr60eL0QV+sFQse+0EK
 Oz5OOS45c/uz6ty7Y85UzTNOoHSZDTuflrfbZJUxQWDBYXxgsBuyQk7aq
 Qk0vBsuOMS3XOXkbL+yBc9i4DeQNh9YMfiiMDsEYYjqQsPyP+0w+cUyF5 g==;
X-CSE-ConnectionGUID: sk0iXSw5QhqA/H8wUWuDKw==
X-CSE-MsgGUID: zHzgRLA+QMe0M9UP/igCZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7935770"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7935770"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 00:11:45 -0700
X-CSE-ConnectionGUID: VjknpijyR16Ar4FtO+BzAw==
X-CSE-MsgGUID: aMi9sACgTYiCKzNe3VFvcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20500391"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 00:11:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/1] xe: Add xe_bo_alloc test
Date: Wed, 10 Apr 2024 00:12:09 -0700
Message-Id: <20240410071209.481206-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240410071209.481206-1-matthew.brost@intel.com>
References: <20240410071209.481206-1-matthew.brost@intel.com>
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

Add xe_bo_alloc test which allocates BOs of various sizes, binds them,
and does an exec with a dword on every single page. Varies sections
exist to few or many BOs, leak binds, leak BO mappings, trigger
evictions run with threads, and run with multiple processes.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 lib/xe/xe_ioctl.c         |  12 +
 lib/xe/xe_ioctl.h         |   1 +
 tests/intel/xe_bo_alloc.c | 568 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |   1 +
 4 files changed, 582 insertions(+)
 create mode 100644 tests/intel/xe_bo_alloc.c

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 934c877ebc..d2eaa8ecf2 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -424,6 +424,18 @@ void *xe_bo_map(int fd, uint32_t bo, size_t size)
 	return __xe_bo_map(fd, bo, size, PROT_WRITE);
 }
 
+void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, uint64_t addr)
+{
+	uint64_t mmo;
+	void *map;
+
+	mmo = xe_bo_mmap_offset(fd, bo);
+	map = mmap((void *)addr, size, PROT_WRITE, MAP_SHARED | MAP_FIXED, fd, mmo);
+	igt_assert(map != MAP_FAILED);
+
+	return map;
+}
+
 void *xe_bo_mmap_ext(int fd, uint32_t bo, size_t size, int prot)
 {
 	return __xe_bo_map(fd, bo, size, prot);
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index 4d08402e0b..44657acd65 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -81,6 +81,7 @@ uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t class);
 void xe_exec_queue_destroy(int fd, uint32_t exec_queue);
 uint64_t xe_bo_mmap_offset(int fd, uint32_t bo);
 void *xe_bo_map(int fd, uint32_t bo, size_t size);
+void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, uint64_t addr);
 void *xe_bo_mmap_ext(int fd, uint32_t bo, size_t size, int prot);
 int __xe_exec(int fd, struct drm_xe_exec *exec);
 void xe_exec(int fd, struct drm_xe_exec *exec);
diff --git a/tests/intel/xe_bo_alloc.c b/tests/intel/xe_bo_alloc.c
new file mode 100644
index 0000000000..68c9494fc2
--- /dev/null
+++ b/tests/intel/xe_bo_alloc.c
@@ -0,0 +1,568 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+/**
+ * TEST: Check if BO allocation functionality is working
+ * Category: Software building block
+ * Sub-category: BO
+ * Functionality: BO allocation, BO eviction, VNA binding
+ */
+
+#include <fcntl.h>
+
+#include "igt.h"
+
+#include "lib/igt_syncobj.h"
+#include "lib/intel_reg.h"
+
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
+#include "xe_drm.h"
+
+/**
+ * SUBTEST: all-sizes-once
+ * Description: Test all BO allocations sizes in test table
+ * Test category: functionality test
+ *
+ * SUBTEST: rand-sizes-10
+ * Description: Test 10 random BO allocation sizes in test table
+ * Test category: functionality test
+ *
+ * SUBTEST: rand-sizes-100
+ * Description: Test 100 random BO allocation sizes in test table
+ * Test category: functionality test
+ *
+ * SUBTEST: rand-sizes-100-unaligned
+ * Description: Test 100 random BO allocation sizes in test table, unaligned bind addresses
+ * Test category: functionality test
+ *
+ * SUBTEST: threads-rand-sizes-50
+ * description: test 50 random bo allocation sizes in test table with a thread per engine
+ * test category: stress test
+ *
+ * SUBTEST: threads-rand-sizes-50-unaligned
+ * description: test 50 random bo allocation sizes in test table with a thread per engine, unaligned bind addresses
+ * test category: stress test
+ *
+ * SUBTEST: threads-leak-binding-rand-sizes-50
+ * Description: Test 50 random BO allocation sizes in test table with a thread per engine, leak the binding
+ * Test category: stress test
+ *
+ * SUBTEST: threads-leak-binding-rand-sizes-50-unaligned
+ * Description: Test 50 random BO allocation sizes in test table with a thread per engine, leak the binding, unaligned bind addresses
+ * Test category: stress test
+ *
+ * SUBTEST: processes-rand-sizes-50
+ * Description: Test 50 random BO allocation sizes in test table with 2 process per engine
+ * Test category: stress test
+ *
+ * SUBTEST: processes-rand-sizes-50-unaligned
+ * Description: Test 50 random BO allocation sizes in test table with 2 process per engine, unaligned bind addresses
+ * Test category: stress test
+ *
+ * SUBTEST: processes-leak-binding-rand-sizes-50
+ * Description: Test 50 random BO allocation sizes in test table with 2 process per engine, leak the binding
+ * Test category: stress test
+ *
+ * SUBTEST: processes-leak-binding-rand-sizes-50-unaligned
+ * Description: Test 50 random BO allocation sizes in test table with 2 process per engine, leak the binding, unaligned bind addresses
+ * Test category: stress test
+ *
+ * SUBTEST: processes-leak-bo-rand-sizes-50
+ * Description: Test 50 random BO allocation sizes in test table with 2 process per engine, leak the BO munmap / gem close
+ * Test category: stress test
+ *
+ * SUBTEST: processes-leak-bo-rand-sizes-50-unaligned
+ * Description: Test 50 random BO allocation sizes in test table with 2 process per engine, leak the BO munmap / gem close, unaligned bind addresses
+ * Test category: stress test
+ *
+ * SUBTEST: processes-leak-bo-rand-sizes-evict
+ * Description: Test enough random BO allocation sizes in test table to trigger evictions with 2 process per engine, leak the BO munmap / gem close
+ * Test category: stress test
+ *
+ * SUBTEST: processes-leak-bo-rand-sizes-evict-unaligned
+ * Description: Test enough random BO allocation sizes in test table to trigger evictions with 2 process per engine, leak the BO munmap / gem close, unaligned bind addresses
+ * Test category: stress test
+ */
+
+#define SZ_4K_SHIFT	12
+
+#define N_ALLOC_SIZES	256
+static uint64_t *alloc_sizes = NULL;
+
+static void alloc_sizes_init(void)
+{
+	int i;
+
+	alloc_sizes = malloc(sizeof(*alloc_sizes) * N_ALLOC_SIZES);
+
+	/* For now just do incremnts of 64k */
+	for (i = 0; i < N_ALLOC_SIZES; ++i)
+		alloc_sizes[i] = 0x10000ull * (i + 1);
+}
+
+static void alloc_sizes_fini(void)
+{
+	free(alloc_sizes);
+}
+
+struct batch_data {
+	uint32_t batch[16];
+	uint64_t pad;
+	uint32_t data;
+};
+
+static uint32_t wkey = 0xc0ffeeull;
+#define WRITE_VALUE(page)	(((wkey) << 8) | (page))
+
+static void check_exec_data(void *ptr, int n_pages)
+{
+	int i;
+
+	for (i = 0; i < n_pages; ++i) {
+		struct batch_data *data = ptr + i * SZ_4K;
+
+		igt_assert_eq(data->data, WRITE_VALUE(i));
+	}
+}
+
+static void touch_all_pages(int fd, uint32_t q, void *ptr, uint64_t bo_size)
+{
+	struct drm_xe_sync sync = {
+	    .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+	    .handle = syncobj_create(fd, 0),
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 0,
+		.exec_queue_id = q,
+		.syncs = to_user_pointer(&sync),
+	};
+	int i, n_pages = bo_size >> SZ_4K_SHIFT;
+	struct batch_data *data = NULL;
+	uint64_t addr = to_user_pointer(ptr);
+
+	for (i = 0; i < n_pages; ++i, addr += SZ_4K) {
+		uint64_t batch_offset = (char *)&data->batch - (char *)data;
+		uint64_t batch_addr = addr + batch_offset;
+		uint64_t sdi_offset = (char *)&data->data - (char *)data;
+		uint64_t sdi_addr = addr + sdi_offset;
+		int b = 0;
+
+		data = ptr + i * SZ_4K;
+		data->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+		data->batch[b++] = sdi_addr;
+		data->batch[b++] = sdi_addr >> 32;
+		data->batch[b++] = WRITE_VALUE(i);
+		data->batch[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b <= ARRAY_SIZE(data->batch));
+
+		exec.address = batch_addr;
+		if (i + 1 == n_pages)
+			exec.num_syncs = 1;
+		xe_exec(fd, &exec);
+	}
+
+	igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
+	check_exec_data(ptr, n_pages);
+
+	syncobj_destroy(fd, sync.handle);
+}
+
+#define LEAK_BINDING		(0x1 << 0)
+#define LEAK_BO			(0x1 << 1)
+#define EVICT			(0x1 << 2)
+#define UNALIGNED		(0x1 << 3)
+
+struct leak {
+	void *ptr;
+	uint64_t bo_size;
+	uint32_t bo;
+};
+
+static struct leak *test_alloc_size(int fd, uint32_t vm, uint32_t q,
+				    uint16_t gt_id, uint64_t bo_size,
+				    uint32_t flags)
+{
+	uint32_t bo;
+	void *ptr;
+
+	if (flags & UNALIGNED)
+		ptr = aligned_alloc(0x10000, bo_size);
+	else
+		ptr = aligned_alloc(bo_size, bo_size);
+	igt_assert(ptr);
+
+	bo = xe_bo_create(fd, !(flags & EVICT) ? vm : 0, bo_size,
+			  vram_if_possible(fd, gt_id),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	xe_vm_bind_sync(fd, vm, bo, 0, to_user_pointer(ptr), bo_size);
+	ptr = xe_bo_map_fixed(fd, bo, bo_size, to_user_pointer(ptr));
+
+	touch_all_pages(fd, q, ptr, bo_size);
+
+	if (!(flags & LEAK_BINDING))
+		xe_vm_unbind_sync(fd, vm, 0, to_user_pointer(ptr), bo_size);
+
+	if (!(flags & LEAK_BO)) {
+		munmap(ptr, bo_size);
+		gem_close(fd, bo);
+	} else {
+		struct leak *leak;
+
+		leak = malloc(sizeof(*leak));
+		igt_assert(leak);
+
+		leak->ptr = ptr;
+		leak->bo_size = bo_size;
+		leak->bo = bo;
+
+		return leak;
+	}
+
+	return NULL;
+}
+
+static void all_sizes_once(int fd, struct drm_xe_engine_class_instance *hwe)
+{
+	uint32_t vm, q;
+	int i;
+
+	vm = xe_vm_create(fd, 0, 0);
+	q =  xe_exec_queue_create(fd, vm, hwe, 0);
+
+	for (i = 0; i < N_ALLOC_SIZES; ++i)
+		test_alloc_size(fd, vm, q, hwe->gt_id, alloc_sizes[i], 0);
+
+	xe_exec_queue_destroy(fd, q);
+	xe_vm_destroy(fd, vm);
+}
+
+static void check_leak(int fd, uint32_t vm, struct leak *leak, uint32_t flags)
+{
+	check_exec_data(leak->ptr, leak->bo_size >> SZ_4K_SHIFT);
+
+	/* Migrate buffer back into VRAM, recheck */
+	if (flags & EVICT) {
+		xe_vm_bind_sync(fd, vm, leak->bo, 0,
+				to_user_pointer(leak->ptr), leak->bo_size);
+
+		check_exec_data(leak->ptr, leak->bo_size >> SZ_4K_SHIFT);
+
+		xe_vm_unbind_sync(fd, vm, 0, to_user_pointer(leak->ptr),
+				  leak->bo_size);
+	}
+
+	munmap(leak->ptr, leak->bo_size);
+	gem_close(fd, leak->bo);
+}
+
+static void check_leaks(int fd, uint32_t vm, struct leak **leaks, int count,
+			uint32_t flags)
+{
+	int i;
+
+	for (i = 0; i < count; ++i) {
+		if (!leaks[i])
+			continue;
+
+		check_leak(fd, vm, leaks[i], flags);
+		free(leaks[i]);
+	}
+}
+
+static void rand_sizes(int fd, struct drm_xe_engine_class_instance *hwe,
+		       int count, uint64_t vram_per_process,
+		       pthread_barrier_t *barrier, uint32_t flags)
+{
+	struct leak **leaks = NULL;
+	uint32_t vm, q;
+	uint64_t vram_used = 0;
+	int i, alloc = (count == -1) ? 50000 : count;
+
+	igt_assert(count > 0 || (flags & EVICT && flags & LEAK_BO));
+
+	leaks = malloc(sizeof(leaks) * alloc);
+	igt_assert(leaks);
+
+	vm = xe_vm_create(fd, 0, 0);
+	q =  xe_exec_queue_create(fd, vm, hwe, 0);
+
+	for (i = 0; i < count || vram_used < vram_per_process; ++i) {
+		uint32_t bo_size = alloc_sizes[rand() % N_ALLOC_SIZES];
+
+		igt_assert(i < alloc);
+		leaks[i] = test_alloc_size(fd, vm, q, hwe->gt_id, bo_size, flags);
+		if (leaks[i])
+			vram_used += leaks[i]->bo_size;
+	}
+
+	if (barrier)
+		pthread_barrier_wait(barrier);
+	check_leaks(fd, vm, leaks, i, flags);
+
+	xe_exec_queue_destroy(fd, q);
+	xe_vm_destroy(fd, vm);
+	free(leaks);
+}
+
+struct thread_data {
+	pthread_t thread;
+	pthread_mutex_t *mutex;
+	pthread_cond_t *cond;
+	struct drm_xe_engine_class_instance *hwe;
+	int fd;
+	int count;
+	uint32_t vm;
+	uint32_t flags;
+	bool *go;
+};
+
+static void *thread(void *data)
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
+				t->flags);
+
+	xe_exec_queue_destroy(t->fd, q);
+
+	return NULL;
+}
+
+static void threads(int fd, int count, uint32_t flags)
+{
+	struct drm_xe_engine_class_instance *hwe;
+	struct thread_data *threads_data;
+	pthread_mutex_t mutex;
+	pthread_cond_t cond;
+	int n_engines = 0, i = 0;
+	uint32_t vm = 0;
+	bool go = false;
+
+	vm = xe_vm_create(fd, 0, 0);
+
+	xe_for_each_engine(fd, hwe)
+		++n_engines;
+
+	threads_data = calloc(n_engines, sizeof(*threads_data));
+	igt_assert(threads_data);
+
+	pthread_mutex_init(&mutex, 0);
+	pthread_cond_init(&cond, 0);
+
+	xe_for_each_engine(fd, hwe) {
+		threads_data[i].mutex = &mutex;
+		threads_data[i].cond = &cond;
+		threads_data[i].hwe = hwe;
+		threads_data[i].fd = fd;
+		threads_data[i].count = count;
+		threads_data[i].vm = vm;
+		threads_data[i].flags = flags;
+		threads_data[i].go = &go;
+		pthread_create(&threads_data[i].thread, 0, thread,
+			       &threads_data[i]);
+		++i;
+	}
+
+	pthread_mutex_lock(&mutex);
+	go = true;
+	pthread_cond_broadcast(&cond);
+	pthread_mutex_unlock(&mutex);
+
+	for (i = 0; i < n_engines; ++i)
+		pthread_join(threads_data[i].thread, NULL);
+
+	xe_vm_destroy(fd, vm);
+}
+
+#define SYNC_FILE	"/tmp/xe_bo_alloc_sync"
+
+struct process_data {
+	pthread_mutex_t mutex;
+	pthread_cond_t cond;
+	pthread_barrier_t barrier;
+	bool go;
+};
+
+static void process(struct drm_xe_engine_class_instance *hwe,
+		    int count, uint64_t vram_per_process, uint32_t flags)
+{
+	struct process_data *pdata;
+	int map_fd;
+	int fd;
+
+	wkey = rand() & 0xffffffull;
+
+	map_fd = open(SYNC_FILE, O_RDWR, 0x666);
+	pdata = mmap(NULL, sizeof(*pdata), PROT_READ |
+		     PROT_WRITE, MAP_SHARED, map_fd, 0);
+
+	pthread_mutex_lock(&pdata->mutex);
+	while (!pdata->go)
+		pthread_cond_wait(&pdata->cond, &pdata->mutex);
+	pthread_mutex_unlock(&pdata->mutex);
+
+	fd = drm_open_driver(DRIVER_XE);
+	rand_sizes(fd, hwe, count, vram_per_process, &pdata->barrier, flags);
+	drm_close_driver(fd);
+
+	close(map_fd);
+	munmap(pdata, sizeof(*pdata));
+}
+
+static void processes(int fd, int count, uint32_t flags)
+{
+	struct drm_xe_engine_class_instance *hwe;
+	struct process_data *pdata;
+	pthread_mutexattr_t mutex_attr;
+	pthread_condattr_t cond_attr;
+	pthread_barrierattr_t barrier_attr;
+	uint64_t vram_per_process = 0;
+	int map_fd, n_engines = 0;
+
+	igt_assert(count > 0 || (flags & EVICT && flags & LEAK_BO));
+
+	xe_for_each_engine(fd, hwe)
+		++n_engines;
+
+	if (flags & EVICT)
+		vram_per_process = (xe_visible_vram_size(fd, 0) * 3) /
+			(n_engines * 4);
+
+	map_fd = open(SYNC_FILE, O_RDWR | O_CREAT, 0x666);
+	posix_fallocate(map_fd, 0, sizeof(*pdata));
+	pdata = mmap(NULL, sizeof(*pdata), PROT_READ |
+		     PROT_WRITE, MAP_SHARED, map_fd, 0);
+
+	pthread_mutexattr_init(&mutex_attr);
+	pthread_mutexattr_setpshared(&mutex_attr, PTHREAD_PROCESS_SHARED);
+	pthread_mutex_init(&pdata->mutex, &mutex_attr);
+
+	pthread_condattr_init(&cond_attr);
+	pthread_condattr_setpshared(&cond_attr, PTHREAD_PROCESS_SHARED);
+	pthread_cond_init(&pdata->cond, &cond_attr);
+
+	pthread_barrierattr_init(&barrier_attr);
+	pthread_barrierattr_setpshared(&barrier_attr, PTHREAD_PROCESS_SHARED);
+	pthread_barrier_init(&pdata->barrier, &barrier_attr, n_engines * 2);
+
+	pdata->go = false;
+
+	xe_for_each_engine(fd, hwe) {
+		igt_fork(child, 2)
+			process(hwe, count, vram_per_process, flags);
+	}
+
+	pthread_mutex_lock(&pdata->mutex);
+	pdata->go = true;
+	pthread_cond_broadcast(&pdata->cond);
+	pthread_mutex_unlock(&pdata->mutex);
+
+	igt_waitchildren();
+
+	close(map_fd);
+	munmap(pdata, sizeof(*pdata));
+}
+
+igt_main
+{
+	struct drm_xe_engine_class_instance *hwe;
+	int fd;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		alloc_sizes_init();
+	}
+
+	igt_subtest_f("all-sizes-once")
+		xe_for_each_engine(fd, hwe) {
+			all_sizes_once(fd, hwe);
+			break;
+		}
+
+	igt_subtest_f("rand-sizes-10")
+		xe_for_each_engine(fd, hwe) {
+			rand_sizes(fd, hwe, 10, 0, NULL, 0);
+			break;
+		}
+
+	igt_subtest_f("rand-sizes-100")
+		xe_for_each_engine(fd, hwe) {
+			rand_sizes(fd, hwe, 100, 0, NULL, 0);
+			break;
+		}
+
+	igt_subtest_f("rand-sizes-100-unaligned")
+		xe_for_each_engine(fd, hwe) {
+			rand_sizes(fd, hwe, 100, 0, NULL, UNALIGNED);
+			break;
+		}
+
+	igt_subtest_f("threads-rand-sizes-50")
+		threads(fd, 50, 0);
+
+	igt_subtest_f("threads-rand-sizes-50-unaligned")
+		threads(fd, 50, UNALIGNED);
+
+	igt_subtest_f("threads-leak-binding-rand-sizes-50")
+		threads(fd, 50, LEAK_BINDING);
+
+	igt_subtest_f("threads-leak-binding-rand-sizes-50-unaligned")
+		threads(fd, 50, LEAK_BINDING | UNALIGNED);
+
+	igt_subtest_f("processes-rand-sizes-50")
+		processes(fd, 50, 0);
+
+	igt_subtest_f("processes-rand-sizes-50-unaligned")
+		processes(fd, 50, UNALIGNED);
+
+	igt_subtest_f("processes-leak-binding-rand-sizes-50")
+		processes(fd, 50, LEAK_BINDING);
+
+	igt_subtest_f("processes-leak-binding-rand-sizes-50-unaligned")
+		processes(fd, 50, LEAK_BINDING | UNALIGNED);
+
+	igt_subtest_f("processes-leak-bo-rand-sizes-50")
+		processes(fd, 50, LEAK_BO);
+
+	igt_subtest_f("processes-leak-bo-rand-sizes-50-unaligned")
+		processes(fd, 50, LEAK_BO | UNALIGNED);
+
+	igt_subtest_f("processes-leak-bo-rand-sizes-evict") {
+		igt_require(xe_has_vram(fd));
+		igt_require(igt_get_avail_ram_mb() >=
+			    (xe_visible_vram_size(fd, 0) >> 20) / 2);
+
+		processes(fd, -1, LEAK_BO | EVICT);
+	}
+
+	igt_subtest_f("processes-leak-bo-rand-sizes-evict-unaligned") {
+		igt_require(xe_has_vram(fd));
+		igt_require(igt_get_avail_ram_mb() >=
+			    (xe_visible_vram_size(fd, 0) >> 20) / 2);
+
+		processes(fd, -1, LEAK_BO | EVICT | UNALIGNED);
+	}
+
+	igt_fixture {
+		alloc_sizes_fini();
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index a856510fce..52ec4de433 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -274,6 +274,7 @@ intel_kms_progs = [
 ]
 
 intel_xe_progs = [
+	'xe_bo_alloc',
 	'xe_ccs',
 	'xe_create',
 	'xe_compute',
-- 
2.34.1

