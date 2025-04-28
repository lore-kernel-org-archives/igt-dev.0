Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3EEC369DC
	for <igt-dev@archiver.kernel.org>; Mon, 28 Apr 2025 13:21:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5192510E4E2;
	Mon, 28 Apr 2025 13:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MxWKw+0e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C589210E4E2
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Apr 2025 13:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745846518; x=1777382518;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B86RhSVl4hWhj8cDvn8rY7MJzq5P2mj9HpTa9ISFuQ4=;
 b=MxWKw+0e+3sV0w5PDlUt++Ysl+TaPnXBQm8MqVHtm0sIOjMgn5iVUNsf
 +h/sw1uO0CVl4xj+4lBL8anihjoCAY89cHOc8wyQPLs1wHH9mpTGfNBtj
 t4v+YlRTil3+LSYvw59d45sAUOf+RSqWYy3A8f1J22YUHYcRnKk7+roC1
 rqmI56EgiIQAaYU7ym1gg+E0yk3oM9fJKzf/toLAr0EWsJP8CPtdITgei
 /9F4TV4X1Wo6+q5N/kHZ11SxhtvDs0m7u2m99ex4Oo2Vy/FApIw8CEgjv
 IPXdzGSiQOuZWmzvrUKXOABLOkqagwplHzLwiykF7RpgkFiQZ5OP/FGuK A==;
X-CSE-ConnectionGUID: oXVmq+DYTKuCGWejbWyYTA==
X-CSE-MsgGUID: wDziJmSORCGrL1WUJxzzKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="51242126"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="51242126"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 06:21:57 -0700
X-CSE-ConnectionGUID: ARV4M3OCQ0qG03xdOvEmXw==
X-CSE-MsgGUID: GrjFa9kTSdSq2e1k71pwtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="133488778"
Received: from unknown (HELO pgurram-desk.iind.intel.com) ([10.190.238.70])
 by fmviesa007.fm.intel.com with ESMTP; 28 Apr 2025 06:21:54 -0700
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nishit.sharma@intel.com,
	Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH] benchmarks: create xe_exec_ctx
Date: Mon, 28 Apr 2025 18:59:52 +0530
Message-Id: <20250428132952.902307-1-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
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

Measure the overhead of execution when doing nothing, switching between
a pair of contexts, or creating a new context every time.

Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 benchmarks/meson.build   |   1 +
 benchmarks/xe_exec_ctx.c | 317 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 318 insertions(+)
 create mode 100644 benchmarks/xe_exec_ctx.c

diff --git a/benchmarks/meson.build b/benchmarks/meson.build
index 2c9a88fd3..496edd724 100644
--- a/benchmarks/meson.build
+++ b/benchmarks/meson.build
@@ -21,6 +21,7 @@ benchmark_progs = [
 	'kms_vblank',
 	'prime_lookup',
 	'vgem_mmap',
+	'xe_exec_ctx',
 ]
 
 benchmarksdir = join_paths(libexecdir, 'benchmarks')
diff --git a/benchmarks/xe_exec_ctx.c b/benchmarks/xe_exec_ctx.c
new file mode 100644
index 000000000..ec52af026
--- /dev/null
+++ b/benchmarks/xe_exec_ctx.c
@@ -0,0 +1,317 @@
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Author:
+ *    Pravalika Gurram <pravalika.gurram@intel.com>
+ *
+ */
+#include <stdio.h>
+#include "intel_reg.h"
+#include "ioctl_wrappers.h"
+#include "lib/igt_syncobj.h"
+
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include "xe/xe_util.h"
+#include "xe/xe_spin.h"
+
+#define MAX_N_EXEC_QUEUES        16
+enum mode { NOP, CREATE, SWITCH };
+
+static double elapsed(const struct timespec *start,
+			const struct timespec *end)
+{
+	return (end->tv_sec - start->tv_sec) + 1e-9*(end->tv_nsec - start->tv_nsec);
+}
+
+static void
+test_exec(int fd, struct drm_xe_engine_class_instance *eci,
+		int n_exec_queues, int n_execs, int n_vm, unsigned int flags)
+{
+	struct drm_xe_sync sync[2] = {
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 2,
+		.syncs = to_user_pointer(sync),
+	};
+
+	uint64_t addr[MAX_N_EXEC_QUEUES];
+	uint64_t sparse_addr[MAX_N_EXEC_QUEUES];
+	uint32_t vm[MAX_N_EXEC_QUEUES];
+	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
+	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
+	uint32_t syncobjs[MAX_N_EXEC_QUEUES];
+	uint32_t bind_syncobjs[MAX_N_EXEC_QUEUES];
+	struct drm_gem_flink flink;
+	struct drm_gem_open open_struct;
+	uint32_t bo_flags;
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data;
+	int i, b;
+	int ret;
+
+	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
+	igt_assert_lte(n_vm, MAX_N_EXEC_QUEUES);
+
+	for (i = 0; i < n_vm; ++i)
+		vm[i] = xe_vm_create(fd, 0, 0);
+	bo_size = sizeof(*data) * n_execs;
+	bo_size = xe_bb_size(fd, bo_size);
+
+	addr[0] = 0x1a0000;
+	sparse_addr[0] = 0x301a0000;
+	for (i = 1; i < MAX_N_EXEC_QUEUES; ++i) {
+		addr[i] = addr[i - 1] + (0x1ull << 32);
+		sparse_addr[i] = sparse_addr[i - 1] + (0x1ull << 32);
+	}
+
+	bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
+
+	bo = xe_bo_create(fd, n_vm == 1 ? vm[0] : 0, bo_size,
+			vram_if_possible(fd, 0), bo_flags);
+
+	flink.handle = bo;
+	ret = igt_ioctl(fd, DRM_IOCTL_GEM_FLINK, &flink);
+	igt_assert_eq(ret, 0);
+
+	open_struct.name = flink.name;
+	ret = igt_ioctl(fd, DRM_IOCTL_GEM_OPEN, &open_struct);
+	igt_assert_eq(ret, 0);
+	igt_assert(open_struct.handle != 0);
+
+	data = xe_bo_map(fd, bo, bo_size);
+
+	for (i = 0; i < n_exec_queues; i++) {
+		uint32_t __vm = vm[i % n_vm];
+
+		exec_queues[i] = xe_exec_queue_create(fd, __vm, eci, 0);
+
+		bind_exec_queues[i] = 0;
+		syncobjs[i] = syncobj_create(fd, 0);
+		bind_syncobjs[i] = syncobj_create(fd, 0);
+	};
+
+	for (i = 0; i < n_vm; ++i) {
+		sync[0].handle = bind_syncobjs[i];
+		xe_vm_bind_async(fd, vm[i], bind_exec_queues[i], bo, 0,
+				addr[i], bo_size, sync, 1);
+	}
+
+	for (i = 0; i < n_execs; i++) {
+		int cur_vm = i % n_vm;
+		uint64_t __addr = addr[cur_vm];
+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_addr = __addr + batch_offset;
+		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
+		uint64_t sdi_addr = __addr + sdi_offset;
+		int e = i % n_exec_queues;
+
+		b = 0;
+		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+		data[i].batch[b++] = sdi_addr;
+		data[i].batch[b++] = sdi_addr >> 32;
+		data[i].batch[b++] = 0xc0ffee;
+		data[i].batch[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+		sync[0].handle = bind_syncobjs[cur_vm];
+		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+		sync[1].handle = syncobjs[e];
+
+		exec.exec_queue_id = exec_queues[e];
+		exec.address = batch_addr;
+		if (e != i)
+			syncobj_reset(fd, &syncobjs[e], 1);
+		xe_exec(fd, &exec);
+
+		if (i + 1 != n_execs) {
+			uint32_t __vm = vm[cur_vm];
+
+			sync[1].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+			xe_vm_unbind_async(fd, __vm, bind_exec_queues[e], 0,
+					__addr, bo_size, sync + 1, 1);
+
+			sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+			addr[i % n_vm] += bo_size;
+			__addr = addr[i % n_vm];
+			xe_vm_bind_async(fd, __vm, bind_exec_queues[e], bo,
+					0, __addr, bo_size, sync, 1);
+		}
+	}
+
+	for (i = 0; i < n_exec_queues && n_execs; i++)
+		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
+					NULL));
+
+	for (i = 0; i < n_vm; i++)
+		igt_assert(syncobj_wait(fd, &bind_syncobjs[i], 1, INT64_MAX, 0,
+					NULL));
+
+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+	for (i = 0; i < n_vm; ++i) {
+		syncobj_reset(fd, &sync[0].handle, 1);
+		xe_vm_unbind_async(fd, vm[i], bind_exec_queues[i], 0, addr[i],
+				bo_size, sync, 1);
+		igt_assert(syncobj_wait(fd, &sync[0].handle, 1,
+					INT64_MAX, 0, NULL));
+	}
+
+	for (i = 0; i < n_exec_queues; i++) {
+		syncobj_destroy(fd, syncobjs[i]);
+		xe_exec_queue_destroy(fd, exec_queues[i]);
+		if (bind_exec_queues[i])
+			xe_exec_queue_destroy(fd, bind_exec_queues[i]);
+	}
+
+	munmap(data, bo_size);
+	gem_close(fd, bo);
+
+	for (i = 0; i < n_vm; ++i) {
+		syncobj_destroy(fd, bind_syncobjs[i]);
+		xe_vm_destroy(fd, vm[i]);
+	}
+}
+
+static int loop(unsigned int ring,
+		int reps,
+		enum mode mode,
+		int ncpus,
+		unsigned int flags)
+{
+	int fd;
+	struct drm_xe_engine_class_instance *hwe;
+	double *shared;
+
+	fd = drm_open_driver(DRIVER_XE);
+	shared = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
+
+	xe_for_each_engine(fd, hwe)
+		if (hwe->engine_class == ring)
+			test_exec(fd, hwe, 1, 1, 1, 0);
+
+	while (reps--) {
+		sleep(1); /* wait for the hw to go back to sleep */
+
+		memset(shared, 0, 4096);
+
+		igt_fork(child, ncpus) {
+			struct timespec start, end;
+			unsigned int count = 0;
+
+		clock_gettime(CLOCK_MONOTONIC, &start);
+		do {
+			switch (mode) {
+			case CREATE:
+				xe_for_each_engine(fd, hwe)
+					if (hwe->engine_class == ring)
+						test_exec(fd, hwe, 1, 1, 1, 0);
+				break;
+
+			case SWITCH:
+				xe_for_each_engine(fd, hwe)
+					if (hwe->engine_class == ring)
+						test_exec(fd, hwe, 16, 64, 1, 1);
+				break;
+
+			case NOP:
+				break;
+			}
+			count++;
+			clock_gettime(CLOCK_MONOTONIC, &end);
+		} while (elapsed(&start, &end) < 2.);
+
+		clock_gettime(CLOCK_MONOTONIC, &end);
+		shared[child] = 1e6*elapsed(&start, &end) / count;
+		}
+	}
+	igt_waitchildren();
+
+	for (int child = 0; child < ncpus; child++)
+		shared[ncpus] += shared[child];
+	printf("%7.3f\n", shared[ncpus] / ncpus);
+
+	return 0;
+}
+
+int main(int argc, char **argv)
+{
+	unsigned int ring = DRM_XE_ENGINE_CLASS_RENDER;
+	unsigned int flags = 0;
+	enum mode mode = NOP;
+	int reps = 1;
+	int ncpus = 1;
+	int c;
+
+	while ((c = getopt(argc, argv, "e:r:b:f")) != -1) {
+		switch (c) {
+		case 'e':
+			if (strcmp(optarg, "rcs") == 0)
+				ring = DRM_XE_ENGINE_CLASS_RENDER;
+			else if (strcmp(optarg, "vcs") == 0)
+				ring = DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
+			else if (strcmp(optarg, "bcs") == 0)
+				ring = DRM_XE_ENGINE_CLASS_COPY;
+			else if (strcmp(optarg, "vecs") == 0)
+				ring = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
+			else if (strcmp(optarg, "ccs") == 0)
+				ring = DRM_XE_ENGINE_CLASS_COMPUTE;
+			else
+				ring = atoi(optarg);
+			break;
+
+		case 'b':
+			if (strcmp(optarg, "create") == 0)
+				mode = CREATE;
+			else if (strcmp(optarg, "switch") == 0)
+				mode = SWITCH;
+			else if (strcmp(optarg, "nop") == 0)
+				mode = NOP;
+			else
+				abort();
+			break;
+
+		case 'f':
+			ncpus = sysconf(_SC_NPROCESSORS_ONLN);
+			break;
+
+		case 'r':
+			reps = atoi(optarg);
+			if (reps < 1)
+				reps = 1;
+			break;
+
+		default:
+			break;
+		}
+	}
+
+	return loop(ring, reps, mode, ncpus, flags);
+}
-- 
2.34.1

