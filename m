Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB2FCCD1AB
	for <igt-dev@archiver.kernel.org>; Fri, 24 Oct 2025 03:32:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2096110E09A;
	Fri, 24 Oct 2025 03:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H/PFUdhL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF2DA10E9C9
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Oct 2025 03:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761276719; x=1792812719;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PUqFsqMSi8IGNnD1XSqQYzLGdXNcsldoocFAzbLTgmc=;
 b=H/PFUdhLueQXc9jhV8qgr3tcgiawAxP0KDFVYliqJXLdUtz19yqTybHh
 SYrt8cP4zeAc5SyjGbT242JyaB83VTHOM1gN+cEI+uzxvbAks7hhaqcYT
 2sxKD99HU8ZwFwGaplXX+tGwJBm7kDknYdDRC9JkxAQZy4RCry7skbugY
 x627REnbIufYVF2tfpHW7A6aLqB7QOuOtFa2c5hMJhLwBkFLzcLrlj7oT
 NC4V6mukOi+Q4a4yifZLfzbhOIIqQKRgNCVLk+rP3XelmMfwy+H6aHJel
 b3h9RpZAOjb5UAako/qR/bQbYp93M9BCAFzvKW3RlSlnpxAaVp2nw2+pd Q==;
X-CSE-ConnectionGUID: zi0XGrXgTY+7xeqGs9/dUQ==
X-CSE-MsgGUID: qoEQ7cG2So2F+/hli9ZxgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73746196"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="73746196"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 20:31:59 -0700
X-CSE-ConnectionGUID: ku8GI8OBRXizatUiktbA/g==
X-CSE-MsgGUID: 1wDdGMLsSBiAqinyRGvTvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="184221656"
Received: from dut2143ptlh.iind.intel.com ([10.223.34.2])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 20:31:57 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, priyanka.dandamudi@intel.com,
 Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Subject: [PATCH v5 i-g-t 5/5] benchmarks/intel_latency: Add
 xe_bo_create_destroy test
Date: Fri, 24 Oct 2025 03:31:23 +0000
Message-ID: <20251024033118.15674-12-gajendra.uttamchand@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251024033118.15674-7-gajendra.uttamchand@intel.com>
References: <20250917121626.67917-8-gajendra.uttamchand@intel.com>
 <20251024033118.15674-7-gajendra.uttamchand@intel.com>
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
 benchmarks/intel_latency/meson.build          |   1 +
 .../intel_latency/xe_bo_create_destroy.c      | 125 ++++++++++++++++++
 2 files changed, 126 insertions(+)
 create mode 100644 benchmarks/intel_latency/xe_bo_create_destroy.c

diff --git a/benchmarks/intel_latency/meson.build b/benchmarks/intel_latency/meson.build
index fd5222a4a..ec6fd1357 100644
--- a/benchmarks/intel_latency/meson.build
+++ b/benchmarks/intel_latency/meson.build
@@ -5,6 +5,7 @@ xe_latency_progs = [
 	'xe_execqueue',
 	'xe_vm_bind',
 	'xe_vm_create_destroy',
+	'xe_bo_create_destroy',
 ]
 
 latencydir = join_paths(libexecdir, 'benchmarks', 'intel_latency')
diff --git a/benchmarks/intel_latency/xe_bo_create_destroy.c b/benchmarks/intel_latency/xe_bo_create_destroy.c
new file mode 100644
index 000000000..dc7d7a10d
--- /dev/null
+++ b/benchmarks/intel_latency/xe_bo_create_destroy.c
@@ -0,0 +1,125 @@
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
+static double
+elapsed(const struct timespec *start, const struct timespec *end)
+{
+	return (end->tv_sec - start->tv_sec) + 1e-9 * (end->tv_nsec - start->tv_nsec);
+}
+
+static void test_bo_create(int fd, uint32_t vm, int size)
+{
+	uint32_t bo;
+	uint64_t bo_size = xe_bb_size(fd, size);
+
+	bo = xe_bo_create(fd, 0, bo_size, vram_if_possible(fd, 0),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	gem_close(fd, bo);
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
+	while ((c = getopt(argc, argv, "s:r:f")) != -1) {
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
+
+			for (n = 0; n < reps; n++) {
+				struct timespec start, end;
+				uint64_t count = 0;
+
+				vm = xe_vm_create(fd, 0, 0);
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
+				xe_vm_destroy(fd, vm);
+				igt_stats_push_float(&stats, count / elapsed(&start, &end));
+			}
+			printf("%f\n", igt_stats_get_trimean(&stats));
+			igt_stats_fini(&stats);
+		}
+	} else {
+		double *shared;
+
+		shared = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
+
+		vm = xe_vm_create(fd, 0, 0);
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
+				shared[child] = count / elapsed(&start, &end);
+			}
+			igt_waitchildren();
+
+			for (int child = 0; child < ncpus; child++)
+				shared[ncpus] += shared[child];
+
+			printf("%7.3f\n", shared[ncpus]);
+		}
+		xe_vm_destroy(fd, vm);
+		munmap(shared, 4096);
+	}
+
+	close(fd);
+	return 0;
+}
-- 
2.43.0

