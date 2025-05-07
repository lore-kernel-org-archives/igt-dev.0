Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD581C3ABC0
	for <igt-dev@archiver.kernel.org>; Wed,  7 May 2025 15:47:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A71C10E848;
	Wed,  7 May 2025 15:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VdqxDl2v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B1EA10E838
 for <igt-dev@lists.freedesktop.org>; Wed,  7 May 2025 15:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746632849; x=1778168849;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j+ldaEDFnW/CMevJvV7v8Jmct9MHIRuNgFMdFt9d3FY=;
 b=VdqxDl2v2WsTcRG0oyhjgGEEm4/f0BLrZMcLPZp0rz6KCJ57pHeQ6O4f
 Ck/VyxAaZKgByfksB7YzQQXeQIQvH6+CPOzIuVocdnZ2vjcsK9lff5nM/
 PXFqR7nw7gIohPKB/uGsp4W417eipyA52JpjmkbR6s3jM3NNXmK+fECU+
 BGfbn+MvS/mpPH7YfWOyAbeiT3c0DiCaqdN2hJb5vR91V7z8CnTFuzyYr
 7zDcbCYoNSa9DfJVqh3vD/mW0dK/09OHs3S8xjz/7/Cac5HgOavgyeOzA
 RRZ4RAwsuFgndr2snAbo2XuvkKASyBkwHQk312mDCYgbV/X/wJc7IqR8+ g==;
X-CSE-ConnectionGUID: YkebcAbSRDKyoU80liQhbQ==
X-CSE-MsgGUID: r5FtGveORw6pBQoVLNiIkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="65784247"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="65784247"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 08:47:28 -0700
X-CSE-ConnectionGUID: 7muj60t7Rm6LGV/hwQR2XA==
X-CSE-MsgGUID: 1WZ0tR46Q5ad+TDMY+KN4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="135922094"
Received: from dut1130bmgfrd.igk.intel.com ([10.211.178.45])
 by orviesa006.jf.intel.com with ESMTP; 07 May 2025 08:47:26 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 himal.prasad.ghimiray@intel.com, matthew.brost@intel.com
Subject: [PATCH] tests/intel/xe_svm_prefetch: Test to validate SVM prefetch
 ranges
Date: Wed,  7 May 2025 15:47:25 +0000
Message-Id: <20250507154725.36055-1-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Test validates prefetch with single range and multi ranges,
and stree testing of prefetch by binding address ranges with different memory
regions to check the expected bahaviour.

Verified with KMD SVM prefetch changes
https://gitlab.freedesktop.org/hghimira/kernel/-/tree/latest_v6_to_be_sent?ref_type=heads

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/intel/xe_svm_prefetch.c | 300 ++++++++++++++++++++++++++++++++++
 tests/meson.build             |   1 +
 2 files changed, 301 insertions(+)
 create mode 100644 tests/intel/xe_svm_prefetch.c

diff --git a/tests/intel/xe_svm_prefetch.c b/tests/intel/xe_svm_prefetch.c
new file mode 100644
index 000000000..3e3853455
--- /dev/null
+++ b/tests/intel/xe_svm_prefetch.c
@@ -0,0 +1,300 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Authors:
+ *      Sai Gowtham Ch <sai.gowtham.ch@intel.com>
+ */
+
+#include <fcntl.h>
+#include <linux/mman.h>
+#include <pthread.h>
+#include <string.h>
+
+#include "igt.h"
+#include "lib/igt_syncobj.h"
+#include "xe_drm.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
+#define USER_FENCE_VALUE        0xdeadbeefdeadbeefull
+#define VRAM            (0x1 << 0)
+
+#define bind_system_allocator(__sync, __num_sync)                   \
+	__xe_vm_bind_assert(fd, vm, 0,                              \
+			0, 0, 0, 0x1ull << 47,                      \
+			DRM_XE_VM_BIND_OP_MAP,                      \
+			DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,        \
+			(__sync), (__num_sync), 0, 0)
+
+#define unbind_system_allocator()                       \
+	__xe_vm_bind(fd, vm, 0, 0, 0, 0, 0x1ull << 47,  \
+			DRM_XE_VM_BIND_OP_UNMAP, 0,     \
+			NULL, 0, 0, 0, 0)
+#define WRITE_VALUE(data__, i__)        ({              	\
+		(data__)->expected_data = rand() << 12 | (i__); \
+		(data__)->expected_data;                        \
+})
+#define READ_VALUE(data__, i__) ((data__)->expected_data)
+
+/**
+ * TEST: Test to validate prefetch of svm
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: prefetch
+ * Functionality: svm
+ */
+struct data {
+	uint32_t batch[16];
+	uint64_t pad;
+	uint32_t data;
+	uint64_t vm_sync;
+	uint64_t exec_sync;
+	uint32_t expected_data;
+	uint64_t addr;
+};
+
+static void write_dword_m(uint32_t *batch, uint64_t sdi_addr, uint32_t wdata,
+			  int *idx)
+{
+	batch[(*idx)++] = MI_STORE_DWORD_IMM_GEN4;
+	batch[(*idx)++] = sdi_addr;
+	batch[(*idx)++] = sdi_addr >> 32;
+	batch[(*idx)++] = wdata;
+	batch[(*idx)++] = MI_BATCH_BUFFER_END;
+}
+
+/**
+ * SUBTEST: basic-svm
+ * Description: Test validates basic svm.
+ * Test category: functionality test
+ */
+static void test_basic(int fd, struct drm_xe_engine_class_instance *eci,
+		       size_t bo_size, int num_dwords)
+{
+	uint64_t addr;
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		  .timeline_value = USER_FENCE_VALUE },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(sync),
+	};
+	struct data *data;
+	uint32_t exec_queues, vm;
+	size_t aligned_size = bo_size ?: xe_get_default_alignment(fd);
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	data = aligned_alloc(aligned_size, bo_size);
+	igt_assert(data != NULL);
+	memset(data, 0, bo_size);
+
+	exec_queues = xe_exec_queue_create(fd, vm, eci, 0);
+
+	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	bind_system_allocator(sync, 1);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+	data[0].vm_sync = 0;
+
+	addr = to_user_pointer(data);
+	for (int i = 0; i <= num_dwords; i++) {
+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_addr = addr + batch_offset;
+		uint64_t sdi_offset = (char *)&(data[i].data) - (char *)data;
+		uint64_t sdi_addr = addr + sdi_offset;
+		int b = 0;
+
+		write_dword_m(data[i].batch, sdi_addr, WRITE_VALUE(&data[i], i), &b);
+		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+		exec.exec_queue_id = exec_queues;
+		exec.address = batch_addr;
+		sync[0].addr = addr + (char *)&data[i].exec_sync - (char *)data;
+		xe_exec(fd, &exec);
+		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE, exec_queues, NSEC_PER_SEC);
+		data[i].exec_sync = 0;
+		igt_assert_eq(data[i].data, READ_VALUE(&data[i], i));
+	}
+	unbind_system_allocator();
+	free(data);
+	xe_exec_queue_destroy(fd, exec_queues);
+	xe_vm_destroy(fd, vm);
+}
+/**
+ * SUBTEST: prefetch-smem-%s
+ * Description: Test to validate functionality of Prefetch using SVM of size arg[1] at smem region
+ * Test category: functionality test
+ *
+ * SUBTEST: prefetch-vram-%s
+ * Description: Test to validate functionality of Prefetch using SVM of size arg[1] at vram region
+ * Test category: functionality test
+ *
+ * SUBTEST: bind-vram-%s
+ * Description: Validate prefetch-smem of size arg[1] by rebinding them with prefetch-vram to
+ *		check the behaviour, ideal behaviour is to migrate ranges
+ * Test category: functionality test
+ *
+ * SUBTEST: bind-smem-%s
+ * Description: Validate prefetch-smem of size arg[1] by rebinding them with prefetch-vram
+ *		check the behaviour, ideal behaviour is to migrate ranges
+ * Test category: functionality test
+ *
+ * SUBTEST: multi-range-smem-%s
+ * Description: Prefetch of mutliple ranges within arg[1] size to validate multiple ranges are created
+ * Test category: functionality test
+ *
+ * SUBTEST: multi-range-vram-%s
+ * Description: Prefetch of mutliple ranges within arg[1] size and check if multiple ranges are created
+ * Test category: functionality test
+ *
+ * SUBTEST: multi-range-bind-vram-%s
+ * Description: Validate multiple ranges of size arg[1] by binding them with multiple ranges at vram
+ * Test category: functionality test
+ *
+ * SUBTEST: multi-range-bind-smem-%s
+ * Description: Validate multiple ranges of size arg[1] by binding them with multiple ranges at smem
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @SZ_4K: SZ_4K
+ * @SZ_64K: SZ_64K
+ * @SZ_2M: SZ_2M
+ */
+
+#define MAX_BATCH_DWORDS 16
+static void prefetch(int fd, struct drm_xe_engine_class_instance *eci,
+		     size_t bo_size, unsigned int flags, int num_dwords, bool bind)
+{
+	struct data *data;
+	uint64_t target_addr;
+	uint64_t addr;
+	u64 *exec_ufence = NULL;
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		  .timeline_value = USER_FENCE_VALUE },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(sync),
+	};
+	size_t slice_size = bo_size;
+	uint64_t batch_addr;
+	uint32_t exec_queues, expected, vm, *result_ptr, *batch;
+	size_t aligned_size = bo_size ?: xe_get_default_alignment(fd);
+	int b;
+
+	bo_size = bo_size * num_dwords;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	data = aligned_alloc(aligned_size, bo_size);
+	memset(data, 0, bo_size);
+	addr = to_user_pointer(data);
+
+	exec_queues = xe_exec_queue_create(fd, vm, eci, 0);
+	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	bind_system_allocator(sync, 1);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+	data[0].vm_sync = 0;
+	exec_ufence = mmap(NULL, SZ_4K, PROT_READ |
+				 PROT_WRITE, MAP_SHARED |
+				 MAP_ANONYMOUS, -1, 0);
+	igt_assert(exec_ufence != MAP_FAILED);
+	memset(exec_ufence, 0, SZ_4K);
+
+	for (int i = 0; i < num_dwords; i++) {
+		batch = (uint32_t *)((uint8_t *)data + i * slice_size);
+		target_addr = addr + i * slice_size + 0x100;
+
+		b = 0;
+		igt_assert(b + 5 <= MAX_BATCH_DWORDS);
+		write_dword_m(batch, target_addr, 0xDEADBEEF + i, &b);
+	}
+
+	sync[0].addr = to_user_pointer(exec_ufence);
+	xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync, 1, flags & VRAM ? 1 : 0);
+	xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+	if (bind) {
+		exec_ufence[0] = 0;
+		sync[0].addr = to_user_pointer(exec_ufence);
+		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync, 1, flags & VRAM ? 0 : 1);
+		xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+		exec_ufence[0] = 0;
+	}
+
+	exec.exec_queue_id = exec_queues;
+	for (int i = 0; i < num_dwords; i++) {
+		result_ptr = (uint32_t *)((uint8_t *)data + i * slice_size + 0x100);
+		expected = 0xDEADBEEF + i;
+
+		batch_addr = addr + i * slice_size;
+		exec.address = batch_addr;
+		exec_ufence[0] = 0;
+		sync[0].addr = to_user_pointer(exec_ufence);
+		xe_exec(fd, &exec);
+		xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, exec_queues, NSEC_PER_SEC);
+		exec_ufence[0] = 0;
+
+		igt_assert_eq(*result_ptr, expected);
+	}
+	xe_exec_queue_destroy(fd, exec_queues);
+	unbind_system_allocator();
+	munmap(data, bo_size);
+	xe_vm_destroy(fd, vm);
+}
+
+igt_main
+{
+	int fd;
+	struct drm_xe_engine *engine;
+	const struct mode {
+		const char *name;
+		size_t size;
+	} mode[] = {
+		{ "SZ_4K", SZ_4K},
+		{ "SZ_64K", SZ_64K},
+		{ "SZ_2M", SZ_2M},
+		{},
+	}, *m;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		engine = xe_engine(fd, 1);
+	}
+
+	igt_subtest("basic-svm")
+		test_basic(fd, &engine->instance, SZ_64K, 1);
+
+	for ( m = mode; m->name; m++) {
+		igt_subtest_f("prefetch-smem-%s", m->name)
+			prefetch(fd, &engine->instance, m->size, 0, 1, 0);
+
+		igt_subtest_f("prefetch-vram-%s", m->name)
+			prefetch(fd, &engine->instance, m->size, VRAM, 1, 0);
+
+		igt_subtest_f("bind-vram-%s", m->name)
+			prefetch(fd, &engine->instance, m->size, 0, 1, 1);
+
+		igt_subtest_f("bind-smem-%s", m->name)
+			prefetch(fd, &engine->instance, m->size, 0, 1, 1);
+
+		igt_subtest_f("multi-range-smem-%s", m->name)
+			prefetch(fd, &engine->instance, m->size, 0, 10, 0);
+
+		igt_subtest_f("multi-range-vram-%s", m->name)
+			prefetch(fd, &engine->instance, m->size, VRAM, 10, 0);
+
+		igt_subtest_f("multi-range-bind-vram-%s", m->name)
+			prefetch(fd, &engine->instance, m->size, 0, 10, 1);
+
+		igt_subtest_f("multi-range-bind-smem-%s", m->name)
+			prefetch(fd, &engine->instance, m->size, VRAM, 10, 1);
+	}
+
+	igt_fixture {
+		close(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 20ddddb89..84e109803 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -324,6 +324,7 @@ intel_xe_progs = [
 	'xe_sriov_auto_provisioning',
 	'xe_sriov_flr',
 	'xe_sriov_scheduling',
+        'xe_svm_prefetch',
 	'xe_sysfs_defaults',
 	'xe_sysfs_preempt_timeout',
 	'xe_sysfs_scheduler',
-- 
2.34.1

