Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5FDCCD1A5
	for <igt-dev@archiver.kernel.org>; Fri, 24 Oct 2025 03:31:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF0510E9C4;
	Fri, 24 Oct 2025 03:31:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hMvgI96J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3794210E9C4
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Oct 2025 03:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761276716; x=1792812716;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mY7IYkoge2+YUKm+E7l774fGo5jJ1gau0tLVc3DngSQ=;
 b=hMvgI96JtfKvRx2NgpoJJ4/IapRPHgTTeZo0MFFrwxg1RQA6lLPxKpbB
 O6Fc9g4S8Nx9sRhjEVJoq8xndnYx2oIdC1Eg0tSeTGDS0JiQdOZ9vQdhb
 8Z4SRMYK1k0cCWSfDXv3UKgWyj092wqllsXmI8D/ekaXl4RXRTZNsGYJu
 JxW+teNvbln6p9mx7rQYRoTdpmdnARFPFszsJNLYr/C6RmqKAZotNFNND
 p9ELLo0YTfyNORZgHeITrVB/8bGlTmSfuzIojy1g1qORZlKk/a7ZIBBHT
 sCS0tEJHwkAWDGjlLaEcY7yooX+CVodaIjDnmKW2QS4yML3Fz/CsxDSDy A==;
X-CSE-ConnectionGUID: KI11ZJG3Tqm4hDXg8pTrsw==
X-CSE-MsgGUID: 5P2ubW2fQiKFelWiVBWxMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73746191"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="73746191"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 20:31:55 -0700
X-CSE-ConnectionGUID: wD0DAPpeSJSKoHKajjcXlw==
X-CSE-MsgGUID: iY7GhHQoSWa4IeR2Gp0bkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="184221638"
Received: from dut2143ptlh.iind.intel.com ([10.223.34.2])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 20:31:53 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, priyanka.dandamudi@intel.com,
 Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Subject: [PATCH v5 i-g-t 3/5] benchmarks/intel_latency: Add xe_vm_bind latency
 test
Date: Fri, 24 Oct 2025 03:31:21 +0000
Message-ID: <20251024033118.15674-10-gajendra.uttamchand@intel.com>
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

Add virtual memory operation timing test for the XE driver.
Measures latency of VM management operations including memory
mapping, unmapping, and virtual address space management.

Defaults: buffer sizes from 4KB to 8MB, 13 repetitions, 1000
iterations per repetition, 2 seconds per sample, single CPU.
Parallelism and busy mode are configurable via command-line
options.

Essential for graphics workloads with complex memory access
patterns and dynamic memory management requirements.

Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
---
 benchmarks/intel_latency/meson.build  |   1 +
 benchmarks/intel_latency/xe_vm_bind.c | 126 ++++++++++++++++++++++++++
 2 files changed, 127 insertions(+)
 create mode 100644 benchmarks/intel_latency/xe_vm_bind.c

diff --git a/benchmarks/intel_latency/meson.build b/benchmarks/intel_latency/meson.build
index b3545efd0..939a01bf2 100644
--- a/benchmarks/intel_latency/meson.build
+++ b/benchmarks/intel_latency/meson.build
@@ -3,6 +3,7 @@ xe_latency_progs = [
 	'xe_create',
 	'xe_exec_ctx',
 	'xe_execqueue',
+	'xe_vm_bind',
 ]
 
 latencydir = join_paths(libexecdir, 'benchmarks', 'intel_latency')
diff --git a/benchmarks/intel_latency/xe_vm_bind.c b/benchmarks/intel_latency/xe_vm_bind.c
new file mode 100644
index 000000000..489f0124f
--- /dev/null
+++ b/benchmarks/intel_latency/xe_vm_bind.c
@@ -0,0 +1,126 @@
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
+static void test_exec(int fd, int size)
+{
+	uint32_t vm, bo;
+	int ret;
+	uint64_t bo_size = xe_bb_size(fd, size);
+
+	vm = xe_vm_create(fd, 0, 0);
+	bo = xe_bo_create_caching(fd, vm, bo_size, vram_if_possible(fd, 0),
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+				  DRM_XE_GEM_CPU_CACHING_WC);
+	ret = __xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
+			   bo_size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
+			   0, 0);
+	xe_vm_unbind_sync(fd, vm, 0, 0x40000, bo_size);
+	igt_assert_eq(ret, 0);
+
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
+int main(int argc, char **argv)
+{
+	int fd = drm_open_driver(DRIVER_XE);
+	int size = 0;
+	int reps = 13;
+	int ncpus = 1;
+	int c, n, s;
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
+			for (n = 0; n < reps; n++) {
+				struct timespec start, end;
+				uint64_t count = 0;
+
+				clock_gettime(CLOCK_MONOTONIC, &start);
+				do {
+					for (c = 0; c < 1000; c++)
+						test_exec(fd, s);
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
+		size_t len = (ncpus + 1) * sizeof(double);
+		double *shared;
+
+		shared = mmap(0, len, PROT_READ | PROT_WRITE,
+			      MAP_SHARED | MAP_ANON, -1, 0);
+		for (n = 0; n < reps; n++) {
+			memset(shared, 0, len);
+
+			igt_fork(child, ncpus) {
+				struct timespec start, end;
+				uint64_t count = 0;
+
+				clock_gettime(CLOCK_MONOTONIC, &start);
+				do {
+					for (c = 0; c < 1000; c++)
+						test_exec(fd, size);
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
+		munmap(shared, len);
+	}
+
+	return 0;
+}
-- 
2.43.0

