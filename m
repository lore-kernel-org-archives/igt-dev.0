Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0266C3ABA9
	for <igt-dev@archiver.kernel.org>; Tue, 29 Apr 2025 09:50:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F2210E111;
	Tue, 29 Apr 2025 09:50:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hRrJIE9x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B5410E111
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Apr 2025 09:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745920203; x=1777456203;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Sl9L7J6uLtoNOnNvLycfrCGyGvp5iYq8Lvfbq0Vz3pc=;
 b=hRrJIE9x6XR9PxA8fnpKuuW7gnELekaHmRiOIT8oskqeUbmD3pvYkYus
 BmQjejqkejlkCT4Nh01oQZ+bQBcTCPfSn7V2Lv3n+t5vJAGVqFaE1uXg6
 1w1kRkrgJjOSaYn7coiVSojp0h2ojdphDbosA3Vos5rnVYxhtc4H2DKAF
 BhsJFF/QTsF9qQpQVATtFay71oZBzqfv/aBrTyZQ0BCiedydZb5e18mUh
 5okG4pp/hvsci/1wtFLh/ybUt/ouS4G2U+I0mnmKL161ebcBv1/AL3WH2
 bvp+MeHPCLiRgER5Hg/fZfpHx6WLFpr9HDeUfcoPrx3Ab48tnQiFHmFzv w==;
X-CSE-ConnectionGUID: ZqjDGczHTjyD6xQprhkoaw==
X-CSE-MsgGUID: sXUg5musRUeHZM1edWURqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="58905099"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="58905099"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 02:50:00 -0700
X-CSE-ConnectionGUID: F0wnsjNaT+CPTwuxdf5w0g==
X-CSE-MsgGUID: 0JeOgB/NTjWDF769EFWM4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="164721833"
Received: from unknown (HELO pgurram-desk.iind.intel.com) ([10.190.238.70])
 by orviesa002.jf.intel.com with ESMTP; 29 Apr 2025 02:49:57 -0700
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pravalika Gurram <pravalika.gurram@intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH] benchmark: Measure allocation time for objects
Date: Tue, 29 Apr 2025 15:27:54 +0530
Message-Id: <20250429095754.914809-1-pravalika.gurram@intel.com>
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

v2: remove the headers and unused variable which are not required [Priyanka]
    use SPDX [kamil]
v3: Move sync and exec functions inside busy condition. [Priyanka]
v4: Move other variables inside busy condition. [Priyanka]
v5: Use size parameter to create the bo [Kamil]

Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
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
index 000000000..ddae1cb30
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
2.34.1

