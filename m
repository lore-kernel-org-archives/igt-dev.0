Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA50CAC599
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 13:10:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38D910E832;
	Wed, 17 Sep 2025 13:10:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I8yDiEF3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA8E10E831
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 13:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758114622; x=1789650622;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S2dJ0y6w2sXxyizXJmCQrhrbLZWdXxi1ywUi/lvDwuQ=;
 b=I8yDiEF3bfep4okc2CdiOLx91VckfGDafOogoy6yUiR0oD31lpuBhMii
 gMP/8DGFcPG/VveT2a1sLbyaO79/gdvjS4YRFkvZpRSEFfa1jfuQ7Wx0K
 XRW2TI3TnZg/3pW8Afyv2WUwd5gQxpJHsDj4lCIDDyICj85fGHtGOZiWt
 Xa3bnihb+mSgkTc6GxXWPCgfAtT9Bu8NP5IYl2vrPCQFiw0SJRZpJK8tN
 Vy0oEoxzgkksRcbRjU/T6PMHnkNO86UUDa3VUa5aMIKDwTZy9amZiOTjl
 QGD3NQtlZjaw+nv4spxFXMGfIc8VFkE8+9xL2QH/55P6EmoSkNvG6vE3/ w==;
X-CSE-ConnectionGUID: lV3CRXMsRiCv3oFYlLtIJw==
X-CSE-MsgGUID: as7xBgcBTBO6ayxq44IYGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60477373"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60477373"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 06:10:22 -0700
X-CSE-ConnectionGUID: +EOjio1YTXquY0rvhTwoMA==
X-CSE-MsgGUID: cd636PuiR3OU8QJwc4WWpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="174526354"
Received: from dut2144ptlh.iind.intel.com ([10.190.232.53])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 06:10:20 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: gajendra.uttamchand@intel.com
Subject: [PATCH v4 i-g-t 3/6] benchmarks/intel_latency: Add xe_vm latency test
Date: Wed, 17 Sep 2025 13:10:05 +0000
Message-ID: <20250917131003.71762-11-gajendra.uttamchand@intel.com>
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
 benchmarks/intel_latency/xe_vm.c | 128 +++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)
 create mode 100644 benchmarks/intel_latency/xe_vm.c

diff --git a/benchmarks/intel_latency/xe_vm.c b/benchmarks/intel_latency/xe_vm.c
new file mode 100644
index 000000000..0287a908d
--- /dev/null
+++ b/benchmarks/intel_latency/xe_vm.c
@@ -0,0 +1,128 @@
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
+	uint32_t vm, bo;
+	uint64_t bo_size = xe_bb_size(fd, size);
+
+	vm = xe_vm_create(fd, 0, 0);
+	bo = xe_bo_create(fd, vm, bo_size, system_memory(fd), 0);
+
+	if (busy) {
+		igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
+					bo_size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
+					0, 0),
+				-EINVAL);
+		xe_vm_unbind_sync(fd, vm, 0, 0x40000, bo_size);
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
2.43.0

