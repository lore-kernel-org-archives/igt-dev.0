Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F951C369B2
	for <igt-dev@archiver.kernel.org>; Thu, 17 Apr 2025 06:34:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F1CC10EA09;
	Thu, 17 Apr 2025 06:34:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cXmcxCOs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F3210EA09
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Apr 2025 06:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744871686; x=1776407686;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=r5tgpy1UH4Snw51gaGWjMCq792qoy3EQg0DES5kLpBc=;
 b=cXmcxCOsJ4hD2nUVPPkVLB4IfWMpaS3tiOqxwpo+yvgppJqTFftdSB1Y
 4AyFUVUFUDE84q9yH6l22pMPYxOv+2YZUSykRwVn8z4abf9fONiGDVFjf
 YgqLVnhyJqilIkBIOo6iQBllaarYJySZXBKdV0Xt/2k/ygKSi8VahNo/a
 Jen0oIkNdfn053ZnFUhlb4VYNRDBT81PMmBHgPNo9jW17SR3W6oluhwnD
 zos68xJaKY3N3U8PpBranLv/jIL7z9Q1bNAeWUCxj+frORsgBBjuEgmNV
 lhwDj4v0Mov676pwP7SKsD9vUTTCXOEXE3b4edp1OddbeH/3h3W1GDLBu A==;
X-CSE-ConnectionGUID: QABCUtaNRiyas86BacpdiA==
X-CSE-MsgGUID: xsGqJOZIRCu++2QgVPZ2EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46573578"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="46573578"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 23:34:46 -0700
X-CSE-ConnectionGUID: x9lBM3ENRF2Y+cTM3POZTA==
X-CSE-MsgGUID: tOivquYNTF2fJdLmocF5vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="130565732"
Received: from unknown (HELO pgurram-desk.iind.intel.com) ([10.190.238.70])
 by fmviesa006.fm.intel.com with ESMTP; 16 Apr 2025 23:34:44 -0700
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org,
	priyanka.dandamudi@intel.com
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH] benchmark: Measure allocation time for objects
Date: Thu, 17 Apr 2025 12:13:00 +0530
Message-Id: <20250417064300.785101-1-pravalika.gurram@intel.com>
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

Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 benchmarks/meson.build |   1 +
 benchmarks/xe_create.c | 179 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 180 insertions(+)
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
index 000000000..f30a5a91a
--- /dev/null
+++ b/benchmarks/xe_create.c
@@ -0,0 +1,179 @@
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
+							&exec_queue_id);
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

