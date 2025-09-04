Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7706CA1015
	for <igt-dev@archiver.kernel.org>; Thu,  4 Sep 2025 08:13:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D6B110E9A3;
	Thu,  4 Sep 2025 08:13:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VlD6QfpE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5019810E235
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Sep 2025 08:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756973623; x=1788509623;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QZTvzjFU4NnbOmUwDH6noyN7xcGBw1yprl/N6JWM61Q=;
 b=VlD6QfpE71ioI8JRxHHMKv8TKxDEHoBvlHvi0xpJuAU4sqbjgPr2W/CC
 3MOSbe/yEpHpg6sc9wvsyLYas/WJ3dDflKZIPNiH+OMVmvSfNz3vaOQxI
 WCKmE118qiuSmkUq3ZIyeuu5mpnDUO0QERN+4JrBPvfPgeaB6FsuA1ziX
 g1/yvVET/CKvximT8K4xW/FGONBgSsXoRaVAz/LyqHOnWx6ZWx69KeHJX
 YTyAfHknvdb/Wf8eqUBDzpyT2BvolFMUQujhEvcDzb6a97Mj4UAf2DYea
 cnIPXVXomarVBhjg9uBJFQBE3rIm3A2r7Jake+7+g3ZVOpWM8Ou4DSf4i w==;
X-CSE-ConnectionGUID: QN8cE36YSwWE+kkztGTSjw==
X-CSE-MsgGUID: JwUvVEL5Q5WBiMVxfoLiIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="76907627"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="76907627"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 01:13:43 -0700
X-CSE-ConnectionGUID: A9SlIqhhR9iPVgcYnhdTGQ==
X-CSE-MsgGUID: eqd786awRtav6zzn5seZiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="172278862"
Received: from live-gta-imageloader.iind.intel.com (HELO
 DUT2146PTLH.iind.intel.com) ([10.190.234.52])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 01:13:42 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com,
 Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Subject: [PATCH i-g-t 2/7] benchmarks/latency: Add xe_create latency test
Date: Thu,  4 Sep 2025 08:13:20 +0000
Message-ID: <20250904081319.1320131-11-gajendra.uttamchand@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250904081319.1320131-9-gajendra.uttamchand@intel.com>
References: <20250904081319.1320131-9-gajendra.uttamchand@intel.com>
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

Add device initialization overhead measurement test for the XE
driver. Measures latency of device and context creation operations
to identify initialization bottlenecks.

Defaults: buffer sizes from 4KB to 8MB, 13 repetitions, 1000
iterations per repetition, 2 seconds per sample, single CPU.
Parallelism and busy mode are configurable via command-line
options.

This is critical for applications with dynamic device management
and helps establish baseline performance expectations for XE driver
initialization paths.

Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
---
 benchmarks/latency/xe_create.c | 156 +++++++++++++++++++++++++++++++++
 1 file changed, 156 insertions(+)
 create mode 100644 benchmarks/latency/xe_create.c

diff --git a/benchmarks/latency/xe_create.c b/benchmarks/latency/xe_create.c
new file mode 100644
index 000000000..dae1b9f91
--- /dev/null
+++ b/benchmarks/latency/xe_create.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "igt.h"
+#include "igt_syncobj.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
+#define OBJECT_SIZE (1 << 23)
+
+static double elapsed(const struct timespec *start,
+		      const struct timespec *end)
+{
+	return (end->tv_sec - start->tv_sec) + 1e-9 * (end->tv_nsec - start->tv_nsec);
+}
+
+static void test_exec(int fd, int busy, int size)
+{
+	uint32_t vm, bo;
+	uint64_t bo_size = xe_bb_size(fd, size);
+	int err;
+
+	vm = xe_vm_create(fd, 0, 0);
+	bo = xe_bo_create(fd, vm, bo_size, system_memory(fd), 0);
+
+	if (busy) {
+		uint32_t *batch, exec_queue_id;
+		uint64_t addr = 0x1a0000;
+		struct drm_xe_sync sync = {
+			.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+			.handle = syncobj_create(fd, 0),
+		};
+		struct drm_xe_exec exec = {
+			.num_syncs = 1,
+			.syncs = to_user_pointer(&sync),
+			.address = addr,
+			.num_batch_buffer = 1,
+		};
+
+		batch = xe_bo_map(fd, bo, bo_size);
+		*batch = MI_BATCH_BUFFER_END;
+		munmap(batch, bo_size);
+		xe_vm_bind_sync(fd, vm, bo, 0, addr, bo_size);
+
+		err = __xe_exec_queue_create(fd, vm, 1, 1, &xe_engine(fd, 0)->instance, 0,
+					     &exec_queue_id);
+		igt_assert_f(!err, "Failed to create exec queue (%d)\n", err);
+
+		exec.exec_queue_id = exec_queue_id;
+		err = __xe_exec(fd, &exec);
+		igt_assert_f(!err, "Failed to execute batch (%d)\n", err);
+
+		err = syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL);
+		igt_assert_f(err, "Timeout while waiting for syncobj signal  (%d)\n", err);
+
+		xe_exec_queue_destroy(fd, exec_queue_id);
+		syncobj_destroy(fd, sync.handle);
+	}
+
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
+int main(int argc, char **argv)
+{
+	int fd = drm_open_driver(DRIVER_XE);
+	int size = 0;
+	int busy = 0;
+	int reps = 13;
+	int ncpus = 1;
+	int c, n, s;
+
+	while ((c = getopt(argc, argv, "s:b:r:f")) != -1) {
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
+						test_exec(fd, busy, s);
+
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
+						test_exec(fd, busy, size);
+
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
2.43.0

