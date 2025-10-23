Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE27CCD1BC
	for <igt-dev@archiver.kernel.org>; Thu, 23 Oct 2025 07:07:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10C010E894;
	Thu, 23 Oct 2025 07:07:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wc0ChvG3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D2D10E88F
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Oct 2025 07:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761203272; x=1792739272;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CPslJIgvqR01e+KfVdAMjmZb0bSuMYiYN69STany+r0=;
 b=Wc0ChvG3MoN5ujxH7HgZfmSpVl6gsL1TAtqayB+7eoW/g0+FZTfvrs0w
 HVQvwIqPgyymj4cI5crbSEwbgLX+ZmarDQQjNsLXfLj/GGOP2LZkT2h4T
 zlKWPnxva3GyJnhYn+V2nGqJssTXY77OFUQwcjACDg5tEMyb2P6evWx8m
 zC2yfgy0reNe1ZuNXSOdFcAx4CRb8NgLOE566h69mCSrTTyv4U9omQqte
 CdGPruh3Y9XBqR9GhLQm6eoA0ES7K0w7GOPAcepP+/RSXHFTmpty9FiWt
 ZUQDdORtLq/2EktPUmbPLRv1duIpcjo1b3DMfPqXFy4mGjubNPSeamNwK g==;
X-CSE-ConnectionGUID: JFsrRJL8Q1G/kJoPO57QKg==
X-CSE-MsgGUID: RqbHNdN+SHyPrqBOvQ25IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63402321"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="63402321"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 00:07:51 -0700
X-CSE-ConnectionGUID: hDdIo2JuQx+ZOzA2I8HB2g==
X-CSE-MsgGUID: ageLrv07Q0ijET4xmEPvrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="184143410"
Received: from dut2143ptlh.iind.intel.com ([10.223.34.2])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 00:07:50 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: gajendra.uttamchand@intel.com
Subject: [v5, i-g-t 4/5] benchmarks/intel_latency:Add xe_vm_create_destroy test
Date: Thu, 23 Oct 2025 07:07:30 +0000
Message-ID: <20251023070727.159678-11-gajendra.uttamchand@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023070727.159678-7-gajendra.uttamchand@intel.com>
References: <20250917121626.67917-8-gajendra.uttamchand@intel.com>
 <20251023070727.159678-7-gajendra.uttamchand@intel.com>
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

Defaults: 13 repetitions, 1000 iterations per repetition,
2 seconds per sample, single CPU.
Single-threaded by default to measure per-operation latency

Critical for applications with frequent VM context switching and
helps optimize memory management performance in complex graphics
applications.

Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
---
 benchmarks/intel_latency/meson.build          |  1 +
 .../intel_latency/xe_vm_create_destroy.c      | 72 +++++++++++++++++++
 2 files changed, 73 insertions(+)
 create mode 100644 benchmarks/intel_latency/xe_vm_create_destroy.c

diff --git a/benchmarks/intel_latency/meson.build b/benchmarks/intel_latency/meson.build
index 939a01bf2..fd5222a4a 100644
--- a/benchmarks/intel_latency/meson.build
+++ b/benchmarks/intel_latency/meson.build
@@ -4,6 +4,7 @@ xe_latency_progs = [
 	'xe_exec_ctx',
 	'xe_execqueue',
 	'xe_vm_bind',
+	'xe_vm_create_destroy',
 ]
 
 latencydir = join_paths(libexecdir, 'benchmarks', 'intel_latency')
diff --git a/benchmarks/intel_latency/xe_vm_create_destroy.c b/benchmarks/intel_latency/xe_vm_create_destroy.c
new file mode 100644
index 000000000..04d58de8a
--- /dev/null
+++ b/benchmarks/intel_latency/xe_vm_create_destroy.c
@@ -0,0 +1,72 @@
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
+	int reps = 13;
+	int c, n;
+
+	while ((c = getopt(argc, argv, "r:")) != -1) {
+		switch (c) {
+		case 'r':
+			reps = atoi(optarg);
+			if (reps < 1)
+				reps = 1;
+			break;
+
+		default:
+			break;
+		}
+	}
+
+	{
+		igt_stats_t stats;
+
+		igt_stats_init_with_size(&stats, reps);
+
+		for (n = 0; n < reps; n++) {
+			struct timespec start, end;
+			uint64_t count = 0;
+
+			clock_gettime(CLOCK_MONOTONIC, &start);
+			do {
+				for (c = 0; c < 1000; c++)
+					test_vm_create(fd);
+
+				count += c;
+				clock_gettime(CLOCK_MONOTONIC, &end);
+			} while (end.tv_sec - start.tv_sec < 2);
+
+			igt_stats_push_float(&stats, count / elapsed(&start, &end));
+		}
+		printf("%f\n", igt_stats_get_trimean(&stats));
+		igt_stats_fini(&stats);
+	}
+
+	close(fd);
+	return 0;
+}
-- 
2.43.0

