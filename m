Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F58CCD1AB
	for <igt-dev@archiver.kernel.org>; Fri, 24 Oct 2025 03:31:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576A710E9C6;
	Fri, 24 Oct 2025 03:31:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hqhQ8V8/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F60010E9C6
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Oct 2025 03:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761276714; x=1792812714;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7k9ZuYkugsTTNMt3At5tqY5UcAl+f/dq0wJjHDoX9hQ=;
 b=hqhQ8V8/CSGUNDxOsffYty4nQrXjb2mV0SUsv+gILySkmRzcubj1tJer
 +rHPIAMjWgymIEPi2dg88LzL98Lst87Am5stUKjrYZYA2Exti6slTvvoW
 JXPHnC9cvHnMyYfPEIW9A49NJg8bHBEM39DkaL5fHU0ljypuBEItmYfOH
 RWdIOxQFwgtHkd5sgNY/NrZp8dkn0Wwci70WU0oSQ7XnIhQRLscZLaalR
 rpzrn1osrhgNZLfGTih4+2+cS9iD3E5kmw2mwobOGl33FeOQgl0X9n1VS
 GDVKh1SW8BVkxV+K9ompIcvwD2e3uh/Xt5ZyQXtW+yQgD09OFeKGZecYB g==;
X-CSE-ConnectionGUID: wwK4ftk5Qzi2LtZHTk16nQ==
X-CSE-MsgGUID: eIsV7eCtRNCzHZv0usbWfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73746190"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="73746190"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 20:31:54 -0700
X-CSE-ConnectionGUID: O7oFDNqZSiyu7izLG9Zqpg==
X-CSE-MsgGUID: xwG3/0fzS1CeCfinos0/ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="184221621"
Received: from dut2143ptlh.iind.intel.com ([10.223.34.2])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 20:31:51 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, priyanka.dandamudi@intel.com,
 Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Subject: [PATCH v5 i-g-t 2/5] benchmarks/intel_latency: Add xe_execqueue test
Date: Fri, 24 Oct 2025 03:31:20 +0000
Message-ID: <20251024033118.15674-9-gajendra.uttamchand@intel.com>
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

Add execution queue management latency test for the XE driver.
Measures performance of command queue operations including queue
creation and destruction.

Defaults: 13 repetitions, 1000 iterations per repetition,
2 seconds per sample, single CPU.
Parallelism and busy mode are configurable via command-line
options.

Critical for understanding command submission overhead and
optimizing graphics workload execution pipelines.

Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
---
 benchmarks/intel_latency/meson.build    |   1 +
 benchmarks/intel_latency/xe_execqueue.c | 121 ++++++++++++++++++++++++
 2 files changed, 122 insertions(+)
 create mode 100644 benchmarks/intel_latency/xe_execqueue.c

diff --git a/benchmarks/intel_latency/meson.build b/benchmarks/intel_latency/meson.build
index c404501e8..b3545efd0 100644
--- a/benchmarks/intel_latency/meson.build
+++ b/benchmarks/intel_latency/meson.build
@@ -2,6 +2,7 @@ xe_latency_progs = [
 	'xe_blt',
 	'xe_create',
 	'xe_exec_ctx',
+	'xe_execqueue',
 ]
 
 latencydir = join_paths(libexecdir, 'benchmarks', 'intel_latency')
diff --git a/benchmarks/intel_latency/xe_execqueue.c b/benchmarks/intel_latency/xe_execqueue.c
new file mode 100644
index 000000000..19482bd75
--- /dev/null
+++ b/benchmarks/intel_latency/xe_execqueue.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "igt.h"
+#include "igt_syncobj.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include <unistd.h>
+
+static double
+elapsed(const struct timespec *start, const struct timespec *end)
+{
+	return (end->tv_sec - start->tv_sec) + 1e-9 * (end->tv_nsec - start->tv_nsec);
+}
+
+static void test_exec(int fd, uint32_t vm)
+{
+	int err;
+	uint32_t exec_queue_id;
+
+	err = __xe_exec_queue_create(fd, vm, 1, 1,
+				     &xe_engine(fd, 0)->instance,
+				     0, &exec_queue_id);
+	igt_assert_f(!err, "Failed to create exec queue (%d)\n", err);
+
+	xe_exec_queue_destroy(fd, exec_queue_id);
+}
+
+int main(int argc, char **argv)
+{
+	int fd = drm_open_driver(DRIVER_XE);
+	int reps = 13;
+	int ncpus = 1;
+	int c, n;
+
+	while ((c = getopt(argc, argv, "r:f")) != -1) {
+		switch (c) {
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
+	if (ncpus == 1) {
+		uint32_t vm = xe_vm_create(fd, 0, 0);
+
+		for (n = 0; n < 1; n++) {
+			igt_stats_t stats;
+
+			igt_stats_init_with_size(&stats, reps);
+
+			for (int rep = 0; rep < reps; rep++) {
+				struct timespec start, end;
+				uint64_t count = 0;
+
+				clock_gettime(CLOCK_MONOTONIC, &start);
+				do {
+					for (c = 0; c < 1000; c++)
+						test_exec(fd, vm);
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
+		xe_vm_destroy(fd, vm);
+	} else {
+		size_t len = (ncpus + 1) * sizeof(double);
+		double *shared;
+
+		shared = mmap(0, len, PROT_READ | PROT_WRITE,
+			      MAP_SHARED | MAP_ANON, -1, 0);
+
+		for (n = 0; n < reps; n++) {
+			memset(shared, 0, len);
+
+			igt_fork(child, ncpus) {
+				uint32_t vm = xe_vm_create(fd, 0, 0);
+				struct timespec start, end;
+				uint64_t count = 0;
+
+				clock_gettime(CLOCK_MONOTONIC, &start);
+				do {
+					for (c = 0; c < 1000; c++)
+						test_exec(fd, vm);
+
+					count += c;
+					clock_gettime(CLOCK_MONOTONIC, &end);
+				} while (end.tv_sec - start.tv_sec < 2);
+
+				shared[child] = count / elapsed(&start, &end);
+				xe_vm_destroy(fd, vm);
+			}
+			igt_waitchildren();
+
+			shared[ncpus] = 0;
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

