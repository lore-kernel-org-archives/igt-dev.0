Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3409CCD1A5
	for <igt-dev@archiver.kernel.org>; Fri, 24 Oct 2025 03:31:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF6B10E0FD;
	Fri, 24 Oct 2025 03:31:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E8mBnD9T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 293EC10E9C8
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Oct 2025 03:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761276717; x=1792812717;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CPslJIgvqR01e+KfVdAMjmZb0bSuMYiYN69STany+r0=;
 b=E8mBnD9TQ/9gst0770IOkI5QmV+Dtty8Gvh3Gaqs0lpnTtqiKvGTlV+P
 Kop8HI42f8jeC5IGfE8v0drwOC37ye4SWvluTwMdo4bD7KBbZJgCR0z/W
 7izDWVwNVuNFUNKGh6rYClL5maoaBQCD04GTpi75tWr4KtEFEqofrIYJb
 4yltdHp8Mkc1nT2N2lF/VYiFyWW7VMmEWAezQezPO6Cy92ns5pYqIwTIl
 NkqrCGeWyzEgRZ3IMZjV2vbk6S1ba5DnaiiYWyNXDMTKmqELxselat+XM
 M/xfpKCDEbVcV/9sY14UGb2yzU60uSVJ+sNfNnLtRg93ZS2SodGSPlxX6 w==;
X-CSE-ConnectionGUID: PzLlzT6QSBy6/2EIDNdL6g==
X-CSE-MsgGUID: OMd0lsWXRQyZWvrp4PoFUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73746195"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="73746195"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 20:31:57 -0700
X-CSE-ConnectionGUID: /hOhafSFTJSYuXFUwec3Aw==
X-CSE-MsgGUID: /+ndd0yIRKChYsrOr0jR/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="184221646"
Received: from dut2143ptlh.iind.intel.com ([10.223.34.2])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 20:31:55 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, priyanka.dandamudi@intel.com,
 Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Subject: [PATCH v5 i-g-t 4/5] benchmarks/intel_latency:Add
 xe_vm_create_destroy test
Date: Fri, 24 Oct 2025 03:31:22 +0000
Message-ID: <20251024033118.15674-11-gajendra.uttamchand@intel.com>
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

