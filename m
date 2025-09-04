Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB14CA1013
	for <igt-dev@archiver.kernel.org>; Thu,  4 Sep 2025 08:13:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81BFD10E9A4;
	Thu,  4 Sep 2025 08:13:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fS/8IsTX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D902910E9A0
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Sep 2025 08:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756973628; x=1788509628;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vo6suB+N1OyYMC48rpWuJEFtYcGLhNer3YRDJUgFFD0=;
 b=fS/8IsTXwHoTuovaqO6WCTUstvIqqnU7i9Ogt3ZBe1CFGqpKQqQecd60
 nOu21FPTml5wftN1RVo7QKDIapSrHf1Se/2pk6PoI+mULIqM9fcV2b5si
 kNZ99jdRt9zK+ZNnUNxFcaobo6BBtLL7TBYf/SUKp0QvNHqOR6B0F8Iqx
 syb5jKy1NBDRQO3gLxzRuwtOwyqUGtByog4/Jkt3C63GNZMic5ohdTqdV
 ZMR1xDuJwon2FDzksNoJvI7beBECTveRQvBZsIq+ZRqQnzKEghnP/jcc2
 QCHc0GMTkHBPEmrGYxNu1v9k57SX83Vnw1xmg1vnScSm3lzY8Frq/+vVW g==;
X-CSE-ConnectionGUID: 2JwV0XkTTjmNBLj72AexyQ==
X-CSE-MsgGUID: IbFOT/6LRQeU0TUGRU7qiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="76907638"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="76907638"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 01:13:48 -0700
X-CSE-ConnectionGUID: KSX+3r0TTma7FjA1Rt8myg==
X-CSE-MsgGUID: VTBaD8LFRoGwdNNPSNUjwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="172278889"
Received: from live-gta-imageloader.iind.intel.com (HELO
 DUT2146PTLH.iind.intel.com) ([10.190.234.52])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 01:13:47 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com,
 Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Subject: [PATCH i-g-t 5/7] benchmarks/latency: Add xe_bo_create_destroy
 latency test
Date: Thu,  4 Sep 2025 08:13:23 +0000
Message-ID: <20250904081319.1320131-14-gajendra.uttamchand@intel.com>
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

Add buffer object lifecycle latency test for the XE driver.
Measures allocation and deallocation timing for buffer objects
across different sizes and usage patterns.

Defaults: buffer sizes from 4KB to 8MB, 13 repetitions, 1000
iterations per repetition, 2 seconds per sample, single CPU.
Parallelism is configurable via command-line options.

Important for applications with dynamic buffer management and
helps identify memory allocation bottlenecks in graphics
workloads.

Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
---
 benchmarks/latency/xe_bo_create_destroy.c | 130 ++++++++++++++++++++++
 1 file changed, 130 insertions(+)
 create mode 100644 benchmarks/latency/xe_bo_create_destroy.c

diff --git a/benchmarks/latency/xe_bo_create_destroy.c b/benchmarks/latency/xe_bo_create_destroy.c
new file mode 100644
index 000000000..16417b870
--- /dev/null
+++ b/benchmarks/latency/xe_bo_create_destroy.c
@@ -0,0 +1,130 @@
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
+static void test_bo_create(int fd, uint32_t vm, int size)
+{
+	uint32_t bo;
+	uint64_t bo_size = xe_bb_size(fd, size);
+
+	//bo = xe_bo_create(fd, vm, bo_size, system_memory(fd), 0);
+	bo = xe_bo_create(fd, 0, bo_size, vram_if_possible(fd, 0), DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	gem_close(fd, bo);
+	
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
+	uint32_t vm; 
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
+    
+	if (size == 0) {
+		for (s = 4096; s <=  OBJECT_SIZE; s <<= 1) {
+			igt_stats_t stats;
+
+			igt_stats_init_with_size(&stats, reps);
+        
+			for (n = 0; n < reps; n++) {
+                vm = xe_vm_create(fd, 0, 0);
+				struct timespec start, end;
+				uint64_t count = 0;
+
+				clock_gettime(CLOCK_MONOTONIC, &start);
+				do {
+					for (c = 0; c < 1000; c++)
+						test_bo_create(fd, vm, s);
+
+					count += c;
+					clock_gettime(CLOCK_MONOTONIC, &end);
+				} while (end.tv_sec - start.tv_sec < 2);
+
+                xe_vm_destroy(fd, vm);
+				igt_stats_push_float(&stats, count / elapsed(&start, &end));
+			}
+			printf("%f\n", igt_stats_get_trimean(&stats));
+			igt_stats_fini(&stats);
+		}
+	} else {
+		double *shared;
+		shared = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
+        
+        vm = xe_vm_create(fd, 0, 0);
+
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
+						test_bo_create(fd, busy, size);
+
+					count += c;
+					clock_gettime(CLOCK_MONOTONIC, &end);
+				} while (end.tv_sec - start.tv_sec < 2);
+                
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
+        xe_vm_destroy(fd, vm);
+        munmap(shared, 4096);
+	}
+
+    close(fd);
+	return 0;
+}
-- 
2.43.0

