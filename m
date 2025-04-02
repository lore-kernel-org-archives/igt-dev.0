Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF16C28B20
	for <igt-dev@archiver.kernel.org>; Wed,  2 Apr 2025 06:05:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A71510E6B8;
	Wed,  2 Apr 2025 06:05:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PN1oCSZK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB37910E6BE
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Apr 2025 06:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743573907; x=1775109907;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r33Ykn8AQHSS74LXqCvvLYQCfMtpRHwCzLptTc2l+jc=;
 b=PN1oCSZKNVS8VvY7n8vzau4MSR+0II0pc4ds88/VAubaP4qBMfPywiWy
 5hWFChI7tJ/iwQIUrW4WTYxOZuREEt02s1q4h7i9jL/Vi5UTXpr8GSU6O
 9VXfAJLVnnPtZaJ6F7F8Atw9s0xyKagCuf/FjJQzcq0uxk8t3OPAIZ7LW
 PWDxixMgItMq4f+0JWSYgxyQ+lnYD/ox/ec84q6D5ePlWCOk1kSK5F2uR
 LDDWYJN725738t938tptoekoqk9sCrBU6Tgmrw0+0/XWNJT3sITnksK7d
 F5VBj2kENyWXK6YnFQWrcA0KfC29UBSydhg9Nii3ZrXWseU2fzrepgu4j w==;
X-CSE-ConnectionGUID: t3mW/g8xR4yrT1U1Fg3yFQ==
X-CSE-MsgGUID: vjKEkyNqRLGPrOWvE7jJtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="45090414"
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; d="scan'208";a="45090414"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 23:05:07 -0700
X-CSE-ConnectionGUID: HkZhNHO6QVyRnFMBoBPZDw==
X-CSE-MsgGUID: YFpDQOAgTNCUC7oe625MRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; d="scan'208";a="126552500"
Received: from unknown (HELO pgurram-desk.iind.intel.com) ([10.190.238.70])
 by orviesa006.jf.intel.com with ESMTP; 01 Apr 2025 23:05:06 -0700
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH 2/4] benchmark: Measure allocation time for objects
Date: Wed,  2 Apr 2025 11:40:31 +0530
Message-Id: <20250402061033.659931-2-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250402061033.659931-1-pravalika.gurram@intel.com>
References: <20250402061033.659931-1-pravalika.gurram@intel.com>
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

A basic measurement, how fast can we create and populate an object with
backing storage

Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 benchmarks/meson.build |   1 +
 benchmarks/xe_create.c | 233 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 234 insertions(+)
 create mode 100644 benchmarks/xe_create.c

diff --git a/benchmarks/meson.build b/benchmarks/meson.build
index 4421ede86..00203c62e 100644
--- a/benchmarks/meson.build
+++ b/benchmarks/meson.build
@@ -22,6 +22,7 @@ benchmark_progs = [
 	'prime_lookup',
 	'vgem_mmap',
         'xe_blt',
+        'xe_create',
 ]
 
 benchmarksdir = join_paths(libexecdir, 'benchmarks')
diff --git a/benchmarks/xe_create.c b/benchmarks/xe_create.c
new file mode 100644
index 000000000..cd97d6920
--- /dev/null
+++ b/benchmarks/xe_create.c
@@ -0,0 +1,233 @@
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
+ * Authors:
+ *    Pravalika Gurram <pravalika.gurram@intel.com>
+ *
+ */
+
+#include <unistd.h>
+#include <stdlib.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <string.h>
+#include <fcntl.h>
+#include <inttypes.h>
+#include <errno.h>
+#include <sys/stat.h>
+#include <sys/ioctl.h>
+#include <sys/time.h>
+#include <time.h>
+
+#include "drm.h"
+#include "drmtest.h"
+#include "i915/gem_create.h"
+#include "igt_aux.h"
+#include "igt_stats.h"
+#include "intel_reg.h"
+#include "ioctl_wrappers.h"
+
+#include "igt.h"
+#include "igt_core.h"
+#include "igt_syncobj.h"
+#include "intel_reg.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
+
+#define OBJECT_SIZE (1<<23)
+
+struct data {
+	uint32_t batch[16];
+	uint64_t pad;
+	uint32_t data;
+	uint64_t addr;
+};
+
+static double elapsed(const struct timespec *start,
+				const struct timespec *end)
+{
+	return (end->tv_sec - start->tv_sec) + 1e-9*(end->tv_nsec - start->tv_nsec);
+}
+
+static void store_dword_batch(struct data *data, uint64_t addr, int value)
+{
+	int b;
+	uint64_t batch_offset = (char *)&(data->batch) - (char *)data;
+	uint64_t batch_addr = addr + batch_offset;
+	uint64_t sdi_offset = (char *)&(data->data) - (char *)data;
+	uint64_t sdi_addr = addr + sdi_offset;
+
+	b = 0;
+
+	data->batch[b++] = MI_BATCH_BUFFER_END;
+	igt_assert(b <= ARRAY_SIZE(data->batch));
+
+	data->addr = batch_addr;
+}
+static void test_exec(int fd, int busy)
+{
+	uint32_t vm;
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct data *data;
+	uint32_t exec_queue;
+	uint32_t syncobj;
+	int value = 0x123456;
+	uint64_t addr = 0x100000;
+
+	struct drm_xe_sync sync = {
+		.flags = DRM_XE_SYNC_TYPE_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync),
+	};
+
+	struct drm_xe_engine_class_instance inst = {
+		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
+	};
+
+	vm = xe_vm_create(fd, 0, 0);
+	bo_size = sizeof(*data);
+	bo_size = xe_bb_size(fd, bo_size);
+
+	bo = xe_bo_create(fd, vm, bo_size,
+			vram_if_possible(fd, 0),
+			DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	if (busy) {
+		syncobj = syncobj_create(fd, 0);
+		sync.handle = syncobj;
+
+		xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, &sync, 1);
+		data = xe_bo_map(fd, bo, bo_size);
+		store_dword_batch(data, addr, value);
+
+		igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
+		syncobj_reset(fd, &syncobj, 1);
+
+		exec_queue = xe_exec_queue_create(fd, vm, &inst, 0);
+		exec.exec_queue_id = exec_queue;
+		exec.address = data->addr;
+		sync.flags &= DRM_XE_SYNC_FLAG_SIGNAL;
+		xe_exec(fd, &exec);
+
+		igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
+
+		syncobj_destroy(fd, syncobj);
+
+		xe_exec_queue_destroy(fd, exec_queue);
+	}
+	munmap(data, bo_size);
+	gem_close(fd, bo);
+
+	xe_vm_destroy(fd, vm);
+}
+int main(int argc, char **argv)
+{
+	int fd = drm_open_driver(DRIVER_XE);
+	int size = 0;
+	int busy = 0;
+	int reps = 13;
+	int ncpus = 1;
+	int c, n, s;
+
+	while ((c = getopt (argc, argv, "bs:r:f")) != -1) {
+		switch (c) {
+		case 's':
+			size = atoi(optarg);
+			break;
+
+		case 'r':
+			reps = atoi(optarg);
+			if (reps < 1)
+				reps = 1;
+			break;
+
+		case 'f':
+			ncpus = sysconf(_SC_NPROCESSORS_ONLN);
+			break;
+
+		case 'b':
+			busy = true;
+			break;
+
+		default:
+			break;
+		}
+	}
+
+	if (size == 0) {
+		for (s = 4096; s <=  OBJECT_SIZE; s <<= 1) {
+			igt_stats_t stats;
+
+			igt_stats_init_with_size(&stats, reps);
+			for (n = 0; n < reps; n++) {
+				struct timespec start, end;
+				uint64_t count = 0;
+
+				clock_gettime(CLOCK_MONOTONIC, &start);
+				do {
+					for (c = 0; c < 1000; c++)
+						test_exec(fd, busy);
+					count += c;
+					clock_gettime(CLOCK_MONOTONIC, &end);
+				} while (end.tv_sec - start.tv_sec < 2);
+
+				igt_stats_push_float(&stats, count / elapsed(&start, &end));
+			}
+			printf("%f\n", igt_stats_get_trimean(&stats));
+			igt_stats_fini(&stats);
+		}
+	} else {
+		double *shared;
+
+		shared = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
+		for (n = 0; n < reps; n++) {
+			memset(shared, 0, 4096);
+
+			igt_fork(child, ncpus) {
+				struct timespec start, end;
+				uint64_t count = 0;
+
+				clock_gettime(CLOCK_MONOTONIC, &start);
+				do {
+					for (c = 0; c < 1000; c++)
+						test_exec(fd, busy);
+					count += c;
+					clock_gettime(CLOCK_MONOTONIC, &end);
+				} while (end.tv_sec - start.tv_sec < 2);
+
+				shared[child] = count / elapsed(&start, &end);
+			}
+			igt_waitchildren();
+
+			for (int child = 0; child < ncpus; child++)
+				shared[ncpus] += shared[child];
+
+			printf("%7.3f\n", shared[ncpus]);
+		}
+	}
+
+	return 0;
+}
-- 
2.34.1

