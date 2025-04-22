Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44826C369C2
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 05:47:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E118010E4F3;
	Tue, 22 Apr 2025 05:47:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GzkKZylV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F5F210E4F3
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Apr 2025 05:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745300835; x=1776836835;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=C5XUx1NoG1tZW3Na9eYkNrsIRPEUxcTVLbIFLzwZnvs=;
 b=GzkKZylVmG6NuTHg42T8mWD3NmnVa2GSPjILcrhQmi+2Vh0ufPihtGtI
 NVCmyVJyZ2FTrPaMRI/lF94bYKSPULXpPejx/1ijMdeSL/mlPGQxg6oJ5
 BihN8+AvstJHxAQRzEy9RUCtXOIGp2nhsPVz+rZP/aD0dIAThZkQ+YgRh
 s8pQB/Jdv5gIqQ+ixAD4X0D72AN0rn3hFca7b7gu9gUY5aeXD4k/ua4X3
 qcAxzdpUoI10mtlqfDq+MqrcOs68VKYCNROmIYhiiaMZE2BltKlIUnrGZ
 y3pMAT8tMZA/LgSWUELVE5ZPDxNQUz0gni42HdZ49FC6feYOMvNl9WfFF Q==;
X-CSE-ConnectionGUID: wdZ+U1dwRU6n4dLldkmv8g==
X-CSE-MsgGUID: NoAsxuZNRt+7DfZ+nMu86A==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="72238346"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="72238346"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 22:47:15 -0700
X-CSE-ConnectionGUID: EZBq3GRJRKaDkj6hHHGREw==
X-CSE-MsgGUID: FyBg0DhpTe6ERxonWbq3+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="135993484"
Received: from unknown (HELO pgurram-desk.iind.intel.com) ([10.190.238.70])
 by fmviesa003.fm.intel.com with ESMTP; 21 Apr 2025 22:47:14 -0700
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: priyanka.dandamudi@intel.com, Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH] benchmark: Measure allocation time for objects
Date: Tue, 22 Apr 2025 11:25:22 +0530
Message-Id: <20250422055522.814722-1-pravalika.gurram@intel.com>
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

A basic measurement, how fast can we create and populate an object with
backing storage

v1: remove the headers and unused variable which are not required [Priyanka]
    use SPDX [kamil]

Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 benchmarks/meson.build |   1 +
 benchmarks/xe_create.c | 157 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 158 insertions(+)
 create mode 100644 benchmarks/xe_create.c

diff --git a/benchmarks/meson.build b/benchmarks/meson.build
index 2c9a88fd3..0e41eed06 100644
--- a/benchmarks/meson.build
+++ b/benchmarks/meson.build
@@ -21,6 +21,7 @@ benchmark_progs = [
 	'kms_vblank',
 	'prime_lookup',
 	'vgem_mmap',
+        'xe_create',
 ]
 
 benchmarksdir = join_paths(libexecdir, 'benchmarks')
diff --git a/benchmarks/xe_create.c b/benchmarks/xe_create.c
new file mode 100644
index 000000000..9674c9359
--- /dev/null
+++ b/benchmarks/xe_create.c
@@ -0,0 +1,157 @@
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
+
+#define OBJECT_SIZE (1<<23)
+
+static double elapsed(const struct timespec *start,
+				const struct timespec *end)
+{
+	return (end->tv_sec - start->tv_sec) + 1e-9*(end->tv_nsec - start->tv_nsec);
+}
+
+static void test_exec(int fd, int busy)
+{
+	uint32_t vm, bo, *batch;
+	uint64_t bo_size = xe_bb_size(fd, SZ_4K), addr = 0x1a0000;
+	uint32_t exec_queue_id;
+	int err;
+
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.handle = syncobj_create(fd, 0),
+	};
+	struct drm_xe_exec exec = {
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync),
+		.address = addr,
+		.num_batch_buffer = 1,
+	};
+
+	vm = xe_vm_create(fd, 0, 0);
+	bo = xe_bo_create(fd, vm, bo_size, system_memory(fd), 0);
+
+	if (busy) {
+		batch = xe_bo_map(fd, bo, bo_size);
+		*batch = MI_BATCH_BUFFER_END;
+		munmap(batch, bo_size);
+		xe_vm_bind_sync(fd, vm, bo, 0, addr, bo_size);
+
+		err = __xe_exec_queue_create(fd, vm, 1, 1, &xe_engine(fd, 0)->instance, 0,
+					    &exec_queue_id);
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
+
+	}
+
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+	syncobj_destroy(fd, sync.handle);
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
+						test_exec(fd, busy);
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
+						test_exec(fd, busy);
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
2.34.1

