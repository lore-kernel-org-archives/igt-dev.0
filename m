Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E78CE835E
	for <igt-dev@archiver.kernel.org>; Mon, 30 Sep 2024 15:39:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4702C10E53C;
	Mon, 30 Sep 2024 15:39:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q9lJ6P9P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A226210E53C
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Sep 2024 15:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727710741; x=1759246741;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=SNJ2LMBvGBbevzL9NOaqnDHdwjpVg+fqFqJCrOVHZEA=;
 b=Q9lJ6P9P5Oeq1m/06FRSKi6YxJBY/klh9R7ioaJJMZrIbrFluTp0nsw3
 gxm8IlyXjcldYjBWRr5X+RGKvHxHmWtiYr1ECC/HJXaQ5wlUqsaA7Nczl
 EZ6yu4TwrILfbqomUmYJiMPOdcI49JuuqPZMeQgfsm9pZeJa1U3GUr6nU
 A2RCui4xNgSrtvG2QCUXhxlU9bThlBhOU+SxrXmE6dWCQ8hVe15X288Yk
 wxvqH2LWx728Zh6aK1kdBWAK/9hrrP/F3d0/q4yePzr1znJQIlO/TW3db
 5tIQFZ2k5ovjHW7IxCnl7FuZkTHcCFQF8DNFSi7vUOJ6GRdyhBlTYrSMb Q==;
X-CSE-ConnectionGUID: W21UWNpUSfmu44FcE+AKsQ==
X-CSE-MsgGUID: YSzT3BvpT7m3O7/kuVqgxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="52224366"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="52224366"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 08:39:01 -0700
X-CSE-ConnectionGUID: 4PXT6YqKTBSwXmW3vABo4Q==
X-CSE-MsgGUID: aXghl/dgSTS3lhfw2D0R+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="104145513"
Received: from priyanka.iind.intel.com ([10.145.169.174])
 by fmviesa001.fm.intel.com with ESMTP; 30 Sep 2024 08:39:00 -0700
From: priyanka.dandamudi@intel.com
To: janga.rahul.kumar@intel.com, igt-dev@lists.freedesktop.org,
 apoorva.singh@intel.com, priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 2/2] tests/intel/xe_access_counter: Access counter tests
Date: Mon, 30 Sep 2024 21:07:50 +0530
Message-Id: <20240930153750.1141461-3-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240930153750.1141461-1-priyanka.dandamudi@intel.com>
References: <20240930153750.1141461-1-priyanka.dandamudi@intel.com>
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Added 2 tests to check basic functionality of access counter.

1.access-trigger: Set a trigger value. Store object in smem and try to store a value through gpu
until the triggered value number of times and check if it gets migrated using trace.
2.access-trigger-negative: It is similar to above test but try to store value through gpu less than
triggered value and check that it is not migrated.

Note: It works once access counter related code is enabled.

Cc: Brian Welty <brian.welty@intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_access_counter.c | 209 ++++++++++++++++++++++++++++++++
 tests/meson.build               |   1 +
 2 files changed, 210 insertions(+)
 create mode 100644 tests/intel/xe_access_counter.c

diff --git a/tests/intel/xe_access_counter.c b/tests/intel/xe_access_counter.c
new file mode 100644
index 000000000..8e80074ca
--- /dev/null
+++ b/tests/intel/xe_access_counter.c
@@ -0,0 +1,209 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+/**
+ * TEST: Basic tests for access counter functionality
+ * Category: Software building block
+ * Run type: FULL
+ * Sub-category: access counter
+ * Functionality: access counter
+ * Test category: functionality test
+ * SUBTEST: invalid-param
+ * Description: Giving invalid granularity size parameter and checks for invalid error.
+ * SUBTEST: access-trigger
+ * Description: Tests basic functionality of access counter.
+ * SUBTEST: access-trigger-negative
+ * Description: Tests if it gets migrated when number of stores is less than set triggered value.
+ */
+
+#include "igt.h"
+#include "lib/igt_syncobj.h"
+#include "lib/intel_reg.h"
+#include "xe_drm.h"
+
+#include "xe/xe_trace.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include <string.h>
+
+#define SIZE_64M  3
+#define USER_FENCE_VALUE 0xdeadbeefdeadbeefull
+#define BATCH_SIZE 1500
+#define TRIGGER 5
+
+static void
+test_exec(int fd, int trigger, int num_stores, struct drm_xe_engine_class_instance *eci)
+{
+	uint64_t addr = 0x1a0000;
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		  .timeline_value = USER_FENCE_VALUE },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(sync),
+	};
+	struct {
+		uint32_t batch[BATCH_SIZE];
+		uint64_t vm_sync;
+		uint64_t exec_sync;
+		uint32_t data;
+	} *data;
+	struct drm_xe_ext_set_property ext = {
+		.base.next_extension = 0,
+		.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+		.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER,
+		.value = trigger,
+	};
+	uint64_t batch_offset = (char *)&data[0].batch - (char *)data;
+	uint64_t batch_addr = addr + batch_offset;
+	uint64_t sdi_offset = (char *)&data[0].data - (char *)data;
+	uint64_t sdi_addr = addr + sdi_offset;
+	uint32_t vm;
+	uint32_t exec_queue;
+	size_t bo_size;
+	uint32_t bo = 0;
+	int b = 0;
+
+	xe_start_tracing();
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+
+	bo_size = sizeof(*data);
+	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
+			xe_get_default_alignment(fd));
+
+	bo = xe_bo_create(fd, 0, bo_size,
+			  system_memory(fd) | all_memory_regions(fd),
+			  DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING);
+	data = xe_bo_map(fd, bo, bo_size);
+	memset(data, 0, bo_size);
+	exec_queue = xe_exec_queue_create(fd, vm, eci, to_user_pointer(&ext));
+	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	xe_vm_bind_async(fd, vm, 0, bo, 0,
+			 addr, bo_size, sync, 1);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+	data[0].vm_sync = 0;
+	xe_vm_prefetch_async(fd, vm, 0, 0, addr,
+			     bo_size, sync, 1, 0);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0,
+		       NSEC_PER_SEC);
+	data[0].vm_sync = 0;
+
+	for (int store = 0; store < num_stores * 50; store++) {
+		data[0].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+		data[0].batch[b++] = sdi_addr;
+		data[0].batch[b++] = sdi_addr >> 32;
+		data[0].batch[b++] = store;
+	}
+	data[0].batch[b++] = MI_BATCH_BUFFER_END;
+	igt_assert(b <= ARRAY_SIZE(data[0].batch));
+	sync[0].addr = addr + (char *)&data[0].exec_sync - (char *)data;
+	exec.exec_queue_id = exec_queue;
+	exec.address = batch_addr;
+	xe_exec(fd, &exec);
+
+	/* There is race condition in that xe_vm_unbind_async() might be called
+	 * below before KMD has even processed the hardware interrupt for access
+	 * counter trigger.
+	 */
+	sleep(2);
+	xe_wait_ufence(fd, &data[0].exec_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+
+	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size,
+			   sync, 1);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+	igt_assert(data[0].data == num_stores * 50 - 1);
+
+	if (trigger == num_stores)
+		xe_validate_acc_trace(fd, 1);
+	else
+		xe_validate_acc_trace(fd, 0);
+	xe_stop_tracing();
+
+	xe_exec_queue_destroy(fd, exec_queue);
+	munmap(data, bo_size);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
+igt_main
+{
+	struct drm_xe_engine_class_instance *hwe;
+
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
+	/* Pass trigger value same as number of stores */
+	igt_subtest("access-trigger") {
+		xe_for_each_engine(fd, hwe)
+			test_exec(fd, TRIGGER, TRIGGER, hwe);
+	}
+	/* Pass trigger value much greater than number of stores */
+	igt_subtest("access-trigger-negative") {
+		xe_for_each_engine(fd, hwe)
+			test_exec(fd, TRIGGER + 400, TRIGGER, hwe);
+	}
+
+	igt_subtest("invalid-param") {
+		struct drm_xe_engine_class_instance instance = {
+			 .engine_class = DRM_XE_ENGINE_CLASS_VM_BIND,
+		 };
+
+		int ret;
+		const int expected = -EINVAL;
+
+		struct drm_xe_ext_set_property ext = {
+			.base.next_extension = 0,
+			.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+			.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY,
+			.value = SIZE_64M + 1,
+		};
+
+		struct drm_xe_exec_queue_create create = {
+			.extensions = to_user_pointer(&ext),
+			.vm_id = xe_vm_create(fd, 0, 0),
+			.width = 1,
+			.num_placements = 1,
+			.instances = to_user_pointer(&instance),
+		};
+
+		if (igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create)) {
+			ret = -errno;
+			errno = 0;
+		}
+
+		igt_assert_eq(ret, expected);
+		ext.value = -1;
+
+		if (igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create)) {
+			ret = -errno;
+			errno = 0;
+		}
+
+		igt_assert_eq(ret, expected);
+	}
+
+	igt_fixture
+		drm_close_driver(fd);
+}
diff --git a/tests/meson.build b/tests/meson.build
index e5d8852f3..4e3e11e5a 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -271,6 +271,7 @@ intel_kms_progs = [
 
 intel_xe_progs = [
 	'xe_wedged',
+        'xe_access_counter',
 	'xe_ccs',
 	'xe_create',
 	'xe_compute',
-- 
2.34.1

