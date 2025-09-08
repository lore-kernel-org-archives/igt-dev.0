Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567D7CAC586
	for <igt-dev@archiver.kernel.org>; Mon,  8 Sep 2025 13:52:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13FF410E525;
	Mon,  8 Sep 2025 13:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AuS2O8dL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C32A10E525
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Sep 2025 13:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757339541; x=1788875541;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kG8CedO58nkOWs19f+PRbrf+g2U07hFIurKXgrTh6vo=;
 b=AuS2O8dLe+RRBG9GlZrsX0Pfdo7690cKnzslXJzVMaTEjJcXw/KUiX0z
 ATx8Acsy/VwcNojBeROAEa7U8V/x6LlmKCwf6Pjvfkmj+zANPn8nwnrmJ
 BKNGrXtPtx3tjDBdbs3yJt3F/8D/pOywclPmJudm3eHUiviXJx6e4GRGO
 2NPeo3edQ9Wa5NtaK3c69mKF7vfm31OhhwIRpOGlWWooQALmQRefzuK3K
 OQncslZD8OHGlWcL7GwFWK4IZcyIggXS12ZjRBe66Ta2g/LSYEO/TX+b3
 pYO0f/PC+l/EpVT38aOf7036dG5lw/cuDQkgvxPhbQT0hJq4kr1YXusJe A==;
X-CSE-ConnectionGUID: Vqn4LHBfRhyhcKF0OJs2xw==
X-CSE-MsgGUID: elJj1O3RRMm8SWEfIfeiTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="85041123"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="85041123"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 06:52:21 -0700
X-CSE-ConnectionGUID: SGXQYb5lSBir4X0lOFYe+Q==
X-CSE-MsgGUID: wdH1PEnPRAeQpShava5TsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="171968378"
Received: from live-gta-imageloader.iind.intel.com (HELO
 DUT2144PTLH.iind.intel.com) ([10.190.232.53])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 06:52:15 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dwarakanath.ramadeva@intel.com, pravalika.gurram@intel.com,
 Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Subject: [PATCH v2 i-g-t 6/7] benchmarks/latency: Add xe_vm_create_destroy
 latency test
Date: Mon,  8 Sep 2025 13:51:44 +0000
Message-ID: <20250908135142.38997-15-gajendra.uttamchand@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250908135142.38997-9-gajendra.uttamchand@intel.com>
References: <20250908135142.38997-9-gajendra.uttamchand@intel.com>
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

V2: Fixed trailing whitespace and code formatting.

Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
---
 benchmarks/latency/xe_vm_create_destroy.c | 122 ++++++++++++++++++++++
 1 file changed, 122 insertions(+)
 create mode 100644 benchmarks/latency/xe_vm_create_destroy.c

diff --git a/benchmarks/latency/xe_vm_create_destroy.c b/benchmarks/latency/xe_vm_create_destroy.c
new file mode 100644
index 000000000..85b2ecfcc
--- /dev/null
+++ b/benchmarks/latency/xe_vm_create_destroy.c
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
+		      const struct timespec *end)
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
+        munmap(shared, 4096);
+	}
+
+    close(fd);
+	return 0;
+}
-- 
2.43.0

