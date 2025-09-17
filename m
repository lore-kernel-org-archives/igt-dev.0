Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA29CAC59A
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 13:10:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973C510E831;
	Wed, 17 Sep 2025 13:10:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R/3oatfv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCD010E831
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 13:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758114623; x=1789650623;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y6Sb5pyG4+5WAP3QFOFeZb3u1GAdA+YkzIwcBH0sToQ=;
 b=R/3oatfv+mJIzTmXV1HnMejzagFJm8rdM9G8re0lKq275KH4B4PWS34e
 W4S3UjyT+Xpyk/0x9rN4/GwnLFxRNGw+BWPQhk5Xcb9iHCFwlTdTgJFyM
 AmWNNsGmDcEhIQGbvfLzivNmP+Equ9vK71oXvt67XmqVdx3CL6MkT7Kh0
 CjOIZRTIKeVmomJ7pW+4LlC6TAvEoN/nPNC2bjcucq1xhvA6GjaBa9V50
 jnA6guPVmKng7b451LaEa3cW1TZrw7N3QgyFxoLVyzFfMAxLxF0qWWksF
 b60ujG2KRl7LwtnShI94x+hIewZxtWrLIRucISQfHtVMFnd2WlloPZA8/ w==;
X-CSE-ConnectionGUID: DSwQrdV7TIWY/sEgA23vkw==
X-CSE-MsgGUID: 0wpaoDzvRCaJU9HsGqws1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60477375"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60477375"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 06:10:23 -0700
X-CSE-ConnectionGUID: FP/umayVT+OY+vtGQ0lomg==
X-CSE-MsgGUID: 06wsOgL2R3WEbZDtmXczdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="174526361"
Received: from dut2144ptlh.iind.intel.com ([10.190.232.53])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 06:10:22 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: gajendra.uttamchand@intel.com
Subject: [PATCH v4 i-g-t 4/6] benchmarks/intel_latency:Add
 xe_vm_create_destroy test
Date: Wed, 17 Sep 2025 13:10:06 +0000
Message-ID: <20250917131003.71762-12-gajendra.uttamchand@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917131003.71762-8-gajendra.uttamchand@intel.com>
References: <20250908144314.42275-9-gajendra.uttamchand@intel.com>
 <20250917131003.71762-8-gajendra.uttamchand@intel.com>
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

Add VM lifecycle performance measurement test for the XE driver.
Measures virtual memory context creation and destruction latency
to identify VM management overhead.

Defaults: buffer sizes from 4KB to 8MB, 13 repetitions, 1000
iterations per repetition, 2 seconds per sample, single CPU.
Parallelism is configurable via command-line options.

Critical for applications with frequent VM context switching and
helps optimize memory management performance in complex graphics
applications.

Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
---
 .../intel_latency/xe_vm_create_destroy.c      | 122 ++++++++++++++++++
 1 file changed, 122 insertions(+)
 create mode 100644 benchmarks/intel_latency/xe_vm_create_destroy.c

diff --git a/benchmarks/intel_latency/xe_vm_create_destroy.c b/benchmarks/intel_latency/xe_vm_create_destroy.c
new file mode 100644
index 000000000..1c09b48dc
--- /dev/null
+++ b/benchmarks/intel_latency/xe_vm_create_destroy.c
@@ -0,0 +1,122 @@
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
+			  const struct timespec *end)
+{
+	return (end->tv_sec - start->tv_sec) + 1e-9 * (end->tv_nsec - start->tv_nsec);
+}
+
+static void test_vm_create(int fd)
+{
+	uint32_t vm;
+
+	vm = xe_vm_create(fd, 0, 0);
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
+
+			for (n = 0; n < reps; n++) {
+
+				struct timespec start, end;
+				uint64_t count = 0;
+
+				clock_gettime(CLOCK_MONOTONIC, &start);
+				do {
+					for (c = 0; c < 1000; c++)
+						test_vm_create(fd);
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
+						test_vm_create(fd);
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
+		munmap(shared, 4096);
+	}
+
+	close(fd);
+	return 0;
+}
-- 
2.43.0

