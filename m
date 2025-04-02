Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62204C36014
	for <igt-dev@archiver.kernel.org>; Wed,  2 Apr 2025 06:28:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B22410E6CE;
	Wed,  2 Apr 2025 06:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i8/tNHhh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E9A10E6CB
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Apr 2025 06:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743575332; x=1775111332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6nXAiSMM3txwK6jtL87w48sJj3LDjFBe0oSMD4mqWOQ=;
 b=i8/tNHhhxclLN/pjv+nKFpxOrrYwqiT3YcncTbmjyx4P9BzMZnFhmwXn
 jMKpCzti0IDr3wzEtrSdICdzUSoWjcl1Agav1PgCc7YJMaQ6i95mPunGD
 h9RgpSWpFYzAbAUPsFxYpnW2d7D5vulLEL5Y8t05Y+e/fLCfEJZ5mzLOx
 laV6Cr2auhEGqn+5hz2jdEWvcTLTfEyCeGr018bpJULz3I/6H397F0o3s
 oQqtwmAqbtFtyeN04QB7mjLwMIPzrhAn5j9+4KYXb1NhuXyt9H4CHNFiY
 Ywk3ClM1Ivkc7F3MjK5lwxXapAcmetwpr8z1DOWrH1RmMUD4ZFeWDDF1f g==;
X-CSE-ConnectionGUID: v46nihxASyi3PGUQJjOPuw==
X-CSE-MsgGUID: BgxDZedtTeibh6KDPoymHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44805926"
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; d="scan'208";a="44805926"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 23:28:51 -0700
X-CSE-ConnectionGUID: 7spy92tFQAi1af7aFUuFNQ==
X-CSE-MsgGUID: /bAgL+yvQqyhgDxM4Yi6Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; d="scan'208";a="126492639"
Received: from unknown (HELO pgurram-desk.iind.intel.com) ([10.190.238.70])
 by orviesa010.jf.intel.com with ESMTP; 01 Apr 2025 23:28:51 -0700
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH i-g-t 4/4] xe_exec_nop: create xe_exec_nop
Date: Wed,  2 Apr 2025 12:07:23 +0530
Message-Id: <20250402063723.660112-5-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250402063723.660112-1-pravalika.gurram@intel.com>
References: <20250402063723.660112-1-pravalika.gurram@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=a
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

Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 benchmarks/meson.build   |   1 +
 benchmarks/xe_exec_nop.c | 221 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 222 insertions(+)
 create mode 100644 benchmarks/xe_exec_nop.c

diff --git a/benchmarks/meson.build b/benchmarks/meson.build
index f29d5a288..1af13b0c6 100644
--- a/benchmarks/meson.build
+++ b/benchmarks/meson.build
@@ -24,6 +24,7 @@ benchmark_progs = [
         'xe_blt',
         'xe_create',
         'xe_exec_ctx',
+        'xe_exec_nop',
 ]
 
 benchmarksdir = join_paths(libexecdir, 'benchmarks')
diff --git a/benchmarks/xe_exec_nop.c b/benchmarks/xe_exec_nop.c
new file mode 100644
index 000000000..a0e222004
--- /dev/null
+++ b/benchmarks/xe_exec_nop.c
@@ -0,0 +1,221 @@
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *    Pravalika Gurram <pravalika.gurram@intel.com>
+ *
+ */
+
+#include "drm.h"
+#include "drmtest.h"
+
+#include "intel_io.h"
+#include "intel_reg.h"
+#include <sys/ioctl.h>
+#include "ioctl_wrappers.h"
+#include "igt_syncobj.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include "xe/xe_util.h"
+#include <time.h>
+
+#define READ_ALL 0x4
+static double elapsed(const struct timespec *start,
+		      const struct timespec *end)
+{
+	return (end->tv_sec - start->tv_sec) + 1e-9*(end->tv_nsec - start->tv_nsec);
+}
+
+static void first_batch(int fd)
+{
+	uint64_t bo_size = xe_bb_size(fd, SZ_4K);
+	struct drm_xe_engine_class_instance inst = {
+		.engine_class = DRM_XE_ENGINE_CLASS_RENDER,
+	};
+	uint32_t vm, bo;
+	u32 q;
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0);
+	bo = xe_bo_create(fd, vm, bo_size, system_memory(fd), 0);
+	q = xe_exec_queue_create(fd, vm, &inst, 0);
+	xe_exec_queue_destroy(fd, q);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+static void second_batch(int fd)
+{
+
+	int err;
+	uint64_t bo_size = xe_bb_size(fd, SZ_4K), bo_addr = 0x1a0000;
+	uint32_t vm, bo, *batch, exec_queue;
+	struct drm_xe_engine_class_instance inst = {
+		.engine_class = DRM_XE_ENGINE_CLASS_RENDER,
+	};
+
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.handle = syncobj_create(fd, 0),
+	};
+	struct drm_xe_exec exec = {
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync),
+		.address = bo_addr,
+		.num_batch_buffer = 1,
+	};
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0);
+	bo = xe_bo_create(fd, vm, bo_size, system_memory(fd), 0);
+
+	batch = xe_bo_map(fd, bo, bo_size);
+	*batch = MI_BATCH_BUFFER_END;
+	munmap(batch, bo_size);
+
+	xe_vm_bind_sync(fd, vm, bo, 0, bo_addr, bo_size);
+	exec_queue = xe_exec_queue_create(fd, vm, &inst, 0);
+
+	exec.exec_queue_id = exec_queue;
+	err = __xe_exec(fd, &exec);
+
+	err = syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL);
+	xe_exec_queue_destroy(fd, exec_queue);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+	syncobj_destroy(fd, sync.handle);
+
+}
+static int loop(unsigned ring, int reps, int ncpus, unsigned flags)
+{
+	double *shared;
+	int fd;
+	struct drm_xe_engine_class_instance *hwe;
+	shared = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
+
+	fd = drm_open_driver(DRIVER_XE);
+	if (ring) {
+		xe_for_each_engine(fd, hwe) {
+			if (hwe->engine_class == ring) {
+				first_batch(fd);
+				second_batch(fd);
+			}
+		}
+	} else {
+		xe_for_each_engine(fd, hwe) {
+			first_batch(fd);
+			second_batch(fd);
+		}
+	}
+
+
+	while (reps--) {
+		memset(shared, 0, 4096);
+
+		sleep(1); /* wait for the hw to go back to sleep */
+
+		igt_fork(child, ncpus) {
+			struct timespec start, end;
+			unsigned count = 0;
+
+			first_batch(fd);
+			second_batch(fd);
+
+			clock_gettime(CLOCK_MONOTONIC, &start);
+			do {
+				for (int inner = 0; inner < 1024; inner++) {
+					if (flags & READ_ALL) {
+						if (ring) {
+							xe_for_each_engine(fd, hwe) {
+								if (hwe->engine_class == ring) {
+									first_batch(fd);
+									second_batch(fd);
+								}
+							}
+						} else {
+							xe_for_each_engine(fd, hwe) {
+								first_batch(fd);
+								second_batch(fd);
+							}
+						}
+					}
+				}
+
+				clock_gettime(CLOCK_MONOTONIC, &end);
+			} while (elapsed(&start, &end) < 2.);
+
+			clock_gettime(CLOCK_MONOTONIC, &end);
+			shared[child] = 1e6*elapsed(&start, &end) / count;
+
+		}
+		igt_waitchildren();
+
+		for (int child = 0; child < ncpus; child++)
+			shared[ncpus] += shared[child];
+		printf("%7.3f ncpus %d\n", shared[ncpus] / ncpus, ncpus);
+	}
+	return 0;
+}
+
+int main(int argc, char **argv)
+{
+	unsigned ring = I915_EXEC_RENDER;
+	unsigned flags = 0;
+	int reps = 1;
+	int ncpus = 1;
+	int c;
+
+	while ((c = getopt (argc, argv, "e:r:f:A")) != -1) {
+		switch (c) {
+		case 'e':
+			if (strcmp(optarg, "rcs") == 0)
+				ring = DRM_XE_ENGINE_CLASS_RENDER;
+			else if (strcmp(optarg, "vcs") == 0)
+				ring = DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
+			else if (strcmp(optarg, "bcs") == 0)
+				ring = DRM_XE_ENGINE_CLASS_COPY;
+			else if (strcmp(optarg, "vecs") == 0)
+				ring = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
+			else if (strcmp(optarg, "ccs") == 0)
+				ring = DRM_XE_ENGINE_CLASS_COMPUTE;
+			else
+				ring = atoi(optarg);
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
+		case 'A':
+			flags |= READ_ALL;
+			break;
+
+		default:
+			break;
+		}
+	}
+
+	return loop(ring, reps, ncpus, flags);
+}
-- 
2.34.1

