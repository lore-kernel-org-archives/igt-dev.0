Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F74CA0EE8
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 12:33:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ED0910E82C;
	Wed, 17 Sep 2025 12:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YljULiDi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D9B10E824
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 12:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758112410; x=1789648410;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+5LUBdD4gM+unptjshGChWJ6iOQaXZlDH6TJ7KZa4Q4=;
 b=YljULiDihFPXcJCmrBcZidH/aCUDbcO/nbAYnpL5iDFO8Mlm6VvwLN2j
 aKHStikSYcybtz0Zbx7CuK+fOKd4d3DDxug5bliO5nP3wUJCLDeWStcJq
 p60wKH/JLX3wd740Gufyw1P/AHoWuwjnbp9LirDvfpgoynwK5B7ntgf5C
 137oKZ7ylEcoV3VMD4/4Bi0EuXuJRkL573T4V/RRsCUhjft0/Rrn//Iqr
 l1xkKo4YUkW+aIQU+oBXEZowtSN7fD96/QYgFxZoqn2ecjBAvD+9DlBmZ
 PPMZYd2XuTeBxZJp9GU2QU24P5L2PQ9xZNFMgIUv9iDsNDkmZyFFr2QPR Q==;
X-CSE-ConnectionGUID: 25cGo/6mRvG3dGX5mCddKQ==
X-CSE-MsgGUID: imrKV46hSX+Gu1oULiHDXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="71781635"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="71781635"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 05:33:30 -0700
X-CSE-ConnectionGUID: 0awXpMbsQ8SII0lW+GNj7A==
X-CSE-MsgGUID: TWXQwenNT5u5Xyg9nretkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="212379556"
Received: from dut2144ptlh.iind.intel.com ([10.190.232.53])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 05:33:30 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: gajendra.uttamchand@intel.com
Subject: [PATCH v4 i-g-t 2/6] benchmarks/intel_latency: Add xe_execqueue test
Date: Wed, 17 Sep 2025 12:33:13 +0000
Message-ID: <20250917123312.68977-10-gajendra.uttamchand@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917123312.68977-8-gajendra.uttamchand@intel.com>
References: <20250908144314.42275-9-gajendra.uttamchand@intel.com>
 <20250917123312.68977-8-gajendra.uttamchand@intel.com>
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

Add execution queue management latency test for the XE driver.
Measures performance of command queue operations including queue
creation and destruction.

Defaults: buffer sizes from 4KB to 8MB, 13 repetitions, 1000
iterations per repetition, 2 seconds per sample, single CPU.
Parallelism and busy mode are configurable via command-line
options.

Critical for understanding command submission overhead and
optimizing graphics workload execution pipelines.

Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
---
 benchmarks/intel_latency/xe_execqueue.c | 127 ++++++++++++++++++++++++
 1 file changed, 127 insertions(+)
 create mode 100644 benchmarks/intel_latency/xe_execqueue.c

diff --git a/benchmarks/intel_latency/xe_execqueue.c b/benchmarks/intel_latency/xe_execqueue.c
new file mode 100644
index 000000000..cb7401faa
--- /dev/null
+++ b/benchmarks/intel_latency/xe_execqueue.c
@@ -0,0 +1,127 @@
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
+	uint32_t vm;
+	int err;
+
+	vm = xe_vm_create(fd, 0, 0);
+
+	if (busy) {
+		uint32_t exec_queue_id;
+		err = __xe_exec_queue_create(fd, vm, 1, 1, &xe_engine(fd, 0)->instance, 0,
+					     &exec_queue_id);
+		igt_assert_f(!err, "Failed to create exec queue (%d)\n", err);
+
+		xe_exec_queue_destroy(fd, exec_queue_id);
+	}
+
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

