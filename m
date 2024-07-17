Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF05C3DA42
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jul 2024 12:31:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F2F10EAD0;
	Wed, 17 Jul 2024 12:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mJUrVzru";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DDAD10EAD1
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jul 2024 12:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721219503; x=1752755503;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o7hyCqIRZ7MOtKN9HoKrBda+Q+IdS5PnpSmKpFXiUZE=;
 b=mJUrVzruiIN6rfqN9iVfLHA97/+4nDCOwWPl2ksLJTuS4yWqVVv4MPi3
 SPhx6AyKrV16B9FSXW3hw51clZyjRz7rT8lVaRinU3p5m2x98+UzvZph+
 I6dAEpckN6WfOP18WCKLQ/N2GUe4So8Oj1M1YmrtlxcRnkZpeRkNIFHfR
 Yjbt/VSJO5IHf9PPrxWkM+YNrD8wlpqnlq9hk6kHM++eSES0OfLXdZIX2
 suFNGt8r0r1FYOGaIAQiKnjibzzWBX4lF65WTeELy5djjmgNaoWeKYm54
 U4YyA9FDWBZeXiZc/kJEWYAv00f4SYihtlBFnKUYVsjp2ug0+UeX67/2W g==;
X-CSE-ConnectionGUID: XsjgQhgURG+dxJ/l0VtbMQ==
X-CSE-MsgGUID: 4eMOUsdVSd6kCVn4a4KJdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="29386630"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="29386630"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 05:31:43 -0700
X-CSE-ConnectionGUID: NGxdH4l5RPKvJsmZudRHJw==
X-CSE-MsgGUID: LqC4jTEITO2YLBetpmLLsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="54699272"
Received: from rajritu-mobl2.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.251.217.45])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 05:31:42 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 1/1] tests/intel/xe_exec_mix_modes: Add new tests for
 parallel execution
Date: Wed, 17 Jul 2024 14:30:48 +0200
Message-ID: <20240717123120.1065167-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240717123120.1065167-1-francois.dugast@intel.com>
References: <20240717123120.1065167-1-francois.dugast@intel.com>
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

Test parallel execution of LR and dma fence jobs on the same device.

Add the following tests:
* "exec-simple-batch-store-lr"
* "exec-simple-batch-store-dma-fence"
* "exec-spinner-interrupted-lr"
* "exec-spinner-interrupted-dma-fence"

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_exec_mix_modes.c | 277 ++++++++++++++++++++++++++++++++
 tests/meson.build               |   1 +
 2 files changed, 278 insertions(+)
 create mode 100644 tests/intel/xe_exec_mix_modes.c

diff --git a/tests/intel/xe_exec_mix_modes.c b/tests/intel/xe_exec_mix_modes.c
new file mode 100644
index 000000000..44265b220
--- /dev/null
+++ b/tests/intel/xe_exec_mix_modes.c
@@ -0,0 +1,277 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+/**
+ * TEST: Test the parallel submission of jobs in LR and dma fence modecs
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: CMD submission
+ * Functionality: fault mode
+ * GPU requirements: GPU needs support for DRM_XE_VM_CREATE_FLAG_FAULT_MODE
+ */
+
+#include <fcntl.h>
+
+#include "igt.h"
+#include "lib/igt_syncobj.h"
+#include "lib/intel_reg.h"
+#include "xe_drm.h"
+
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include "xe/xe_spin.h"
+#include <string.h>
+
+#define FLAG_EXEC_MODE_LR	(0x1 << 0)
+#define FLAG_JOB_TYPE_SIMPLE	(0x1 << 1)
+
+#define NUM_INTERRUPTING_JOBS	5
+#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
+#define ONE_SEC			MS_TO_NS(1000)
+#define VM_DATA			0
+#define SPIN_DATA		1
+#define EXEC_DATA		2
+#define DATA_COUNT		3
+
+struct data {
+	struct xe_spin spin;
+	uint32_t batch[16];
+	uint64_t vm_sync;
+	uint32_t data;
+	uint64_t exec_sync;
+	uint64_t addr;
+};
+
+static void store_dword_batch(struct data *data, uint64_t addr, int value)
+{
+	int b;
+	uint64_t batch_offset = (char *)&(data->batch) - (char *)data;
+	uint64_t batch_addr = addr + batch_offset;
+	uint64_t sdi_offset = (char *)&(data->data) - (char *)data;
+	uint64_t sdi_addr = addr + sdi_offset;
+
+	b = 0;
+	data->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+	data->batch[b++] = sdi_addr;
+	data->batch[b++] = sdi_addr >> 32;
+	data->batch[b++] = value;
+	data->batch[b++] = MI_BATCH_BUFFER_END;
+	igt_assert(b <= ARRAY_SIZE(data->batch));
+
+	data->addr = batch_addr;
+}
+
+enum engine_execution_mode {
+	EXEC_MODE_LR,
+	EXEC_MODE_DMA_FENCE,
+};
+
+enum job_type {
+	SIMPLE_BATCH_STORE,
+	SPINNER_INTERRUPTED,
+};
+
+static void
+run_job(int fd, struct drm_xe_engine_class_instance *hwe,
+	enum engine_execution_mode engine_execution_mode,
+	enum job_type job_type)
+{
+	struct drm_xe_sync sync[1] = {
+		{ .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync),
+	};
+	struct drm_xe_ext_set_property ext = {
+		.base.next_extension = 0,
+		.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+		.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY,
+		.value = 2, /* High priority */
+	};
+	struct data *data;
+	uint32_t vm;
+	uint32_t exec_queue;
+	size_t bo_size;
+	int value = 0x123456;
+	uint64_t addr = 0x100000;
+	uint32_t bo = 0;
+	unsigned int vm_flags = 0;
+	struct xe_spin_opts spin_opts = { .preempt = true };
+	const uint64_t duration_ns = NSEC_PER_SEC / 2; /* 500ms */
+	struct timespec tv;
+
+	if (engine_execution_mode == EXEC_MODE_LR) {
+		sync[0].type = DRM_XE_SYNC_TYPE_USER_FENCE;
+		sync[0].timeline_value = USER_FENCE_VALUE;
+		vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE;
+	} else if (engine_execution_mode == EXEC_MODE_DMA_FENCE) {
+		sync[0].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
+		sync[0].handle = syncobj_create(fd, 0);
+	}
+
+	vm = xe_vm_create(fd, vm_flags, 0);
+	bo_size = sizeof(*data) * DATA_COUNT;
+	bo_size = xe_bb_size(fd, bo_size);
+	bo = xe_bo_create(fd, vm, bo_size,
+			  vram_if_possible(fd, hwe->gt_id),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	data = xe_bo_map(fd, bo, bo_size);
+	if (engine_execution_mode == EXEC_MODE_LR)
+		sync[0].addr = to_user_pointer(&data[VM_DATA].vm_sync);
+	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, &sync[0], 1);
+
+	store_dword_batch(data, addr, value);
+	if (engine_execution_mode == EXEC_MODE_LR) {
+		xe_wait_ufence(fd, &data[VM_DATA].vm_sync, USER_FENCE_VALUE, 0, ONE_SEC);
+		sync[0].addr = addr + (char *)&data[EXEC_DATA].exec_sync - (char *)data;
+	} else if (engine_execution_mode == EXEC_MODE_DMA_FENCE) {
+		igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+		syncobj_reset(fd, &sync[0].handle, 1);
+		sync[0].flags &= DRM_XE_SYNC_FLAG_SIGNAL;
+	}
+	exec_queue = xe_exec_queue_create(fd, vm, hwe, to_user_pointer(&ext));
+	exec.exec_queue_id = exec_queue;
+
+	if (job_type == SPINNER_INTERRUPTED) {
+		spin_opts.addr = addr + (char *)&data[SPIN_DATA].spin - (char *)data;
+		spin_opts.ctx_ticks = duration_to_ctx_ticks(fd, 0, duration_ns);
+		xe_spin_init(&data[SPIN_DATA].spin, &spin_opts);
+		if (engine_execution_mode == EXEC_MODE_LR)
+		    sync[0].addr = addr + (char *)&data[SPIN_DATA].exec_sync - (char *)data;
+		exec.address = spin_opts.addr;
+	} else if (job_type == SIMPLE_BATCH_STORE) {
+		exec.address = data->addr;
+	}
+	xe_exec(fd, &exec);
+
+	if (job_type == SPINNER_INTERRUPTED) {
+		enum engine_execution_mode interrupting_engine_execution_mode;
+		if (engine_execution_mode == EXEC_MODE_LR)
+			interrupting_engine_execution_mode = EXEC_MODE_DMA_FENCE;
+		else if (engine_execution_mode == EXEC_MODE_DMA_FENCE)
+			interrupting_engine_execution_mode = EXEC_MODE_LR;
+		xe_spin_wait_started(&data[SPIN_DATA].spin);
+		igt_gettime(&tv);
+		for (int i = 0; i < NUM_INTERRUPTING_JOBS; i++)
+		{
+			run_job(fd, hwe, interrupting_engine_execution_mode, SIMPLE_BATCH_STORE);
+			/**
+			 * Executing a SIMPLE_BATCH_STORE job takes significantly less time than
+			 * duration_ns.
+			 * When a spinner is running in LR mode, the interrupting job preempts it
+			 * in KMD and should complete fast, shortly after starting the spinner.
+			 * When a spinner is running in dma fence mode, the interrupting job waits
+			 * in KMD and should complete shortly after the spinner has ended.
+			 * The checks below are to verify preempting/waiting happens as expected
+			 * depending on the execution mode.
+			 */
+			if (engine_execution_mode == EXEC_MODE_LR)
+				igt_assert(igt_nsec_elapsed(&tv) < 0.5 * duration_ns);
+			else if (engine_execution_mode == EXEC_MODE_DMA_FENCE)
+				igt_assert(igt_nsec_elapsed(&tv) > duration_ns);
+		}
+	}
+
+	if (engine_execution_mode == EXEC_MODE_LR) {
+		if (job_type == SPINNER_INTERRUPTED)
+			xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync, USER_FENCE_VALUE, 0, ONE_SEC * 2);
+		else if (job_type == SIMPLE_BATCH_STORE)
+			xe_wait_ufence(fd, &data[EXEC_DATA].exec_sync, USER_FENCE_VALUE, 0, ONE_SEC * 2);
+	} else if (engine_execution_mode == EXEC_MODE_DMA_FENCE) {
+		igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+		syncobj_destroy(fd, sync[0].handle);
+	}
+
+	if (job_type == SIMPLE_BATCH_STORE)
+		igt_assert_eq(data->data, value);
+
+	munmap(data, bo_size);
+	gem_close(fd, bo);
+	xe_exec_queue_destroy(fd, exec_queue);
+	xe_vm_destroy(fd, vm);
+}
+
+/**
+ * SUBTEST: exec-simple-batch-store-lr
+ * Description: Execute a simple batch store job in long running mode
+ *
+ * SUBTEST: exec-simple-batch-store-dma-fence
+ * Description: Execute a simple batch store job in dma fence mode
+ *
+ * SUBTEST: exec-spinner-interrupted-lr
+ * Description: Spin in long running mode then get interrupted by a simple
+ *              batch store job in dma fence mode
+ *
+ * SUBTEST: exec-spinner-interrupted-dma-fence
+ * Description: Spin in dma fence mode then get interrupted by a simple
+ *              batch store job in long running mode
+ */
+static void
+test_exec(int fd, struct drm_xe_engine_class_instance *hwe,
+	  unsigned int flags)
+{
+	enum engine_execution_mode engine_execution_mode;
+	enum job_type job_type;
+
+	if (flags & FLAG_EXEC_MODE_LR)
+		engine_execution_mode = EXEC_MODE_LR;
+	else
+		engine_execution_mode = EXEC_MODE_DMA_FENCE;
+
+	if (flags & FLAG_JOB_TYPE_SIMPLE)
+		job_type = SIMPLE_BATCH_STORE;
+	else
+		job_type = SPINNER_INTERRUPTED;
+
+	run_job(fd, hwe, engine_execution_mode, job_type);
+}
+
+igt_main
+
+
+{
+	struct drm_xe_engine_class_instance *hwe;
+	const struct section {
+		const char *name;
+		unsigned int flags;
+	} sections[] = {
+		{ "simple-batch-store-lr", FLAG_JOB_TYPE_SIMPLE | FLAG_EXEC_MODE_LR },
+		{ "simple-batch-store-dma-fence", FLAG_JOB_TYPE_SIMPLE },
+		{ "spinner-interrupted-lr", FLAG_EXEC_MODE_LR },
+		{ "spinner-interrupted-dma-fence", 0 },
+		{ NULL },
+	};
+	int fd;
+
+	igt_fixture {
+		struct timespec tv = {};
+		bool supports_faults;
+		int ret = 0;
+		int timeout = igt_run_in_simulation() ? 20 : 2;
+
+		fd = drm_open_driver(DRIVER_XE);
+		do {
+			if (ret)
+				usleep(5000);
+			ret = xe_supports_faults(fd);
+		} while (ret == -EBUSY && igt_seconds_elapsed(&tv) < timeout);
+
+		supports_faults = !ret;
+		igt_require(supports_faults);
+	}
+
+	for (const struct section *s = sections; s->name; s++) {
+		igt_subtest_f("exec-%s", s->name)
+			xe_for_each_engine(fd, hwe)
+				if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
+					test_exec(fd, hwe, s->flags);
+	}
+
+	igt_fixture {
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 357db2723..e649466be 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -286,6 +286,7 @@ intel_xe_progs = [
 	'xe_exec_basic',
 	'xe_exec_compute_mode',
 	'xe_exec_fault_mode',
+	'xe_exec_mix_modes',
 	'xe_exec_queue_property',
 	'xe_exec_reset',
 	'xe_exec_sip',
-- 
2.43.0

