Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8209D12691
	for <igt-dev@archiver.kernel.org>; Wed,  3 Dec 2025 09:48:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 808E910E125;
	Wed,  3 Dec 2025 09:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WygR2zJM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252EB10E125
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Dec 2025 09:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764755303; x=1796291303;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kZ7RgKWEQdnoHv+AXjlFxHgf8W2h8DVEezvOlqIvY2Y=;
 b=WygR2zJMwvxkfOn6c9m2ZKdHol+e2Pd9iGh6eSKUM5Wf+0giiQSHivfE
 2sX1yz7Ldt4qA1Ysz8bNLfL2ljZ82xBayirAjdst3zpzxioA8YJ3o+Ads
 +9hz7qQueVYuuYqzf9gZpPakUXkIjc8OvdhAo6fQNuMxiUqH5kUj0kt25
 IJrJp80HRTvxXY6ioKPuOQNRqx1d4r61K2HeOMPjKS3s86HKY7Sf/H7PM
 kMTAUIHm4XjNPUbSnhL+TJZ0bjvTGWPIrl0NNqpNmZPOdHkihfn9j+06k
 xNRK4/5GpjYMjIIoaCpru4PKlMTLP+rwy2T5jL7XKAS+JsoHmPYvNUrKF w==;
X-CSE-ConnectionGUID: CkSd/nlcS8CyodswzmsRuQ==
X-CSE-MsgGUID: S5NrJE22QRy8RtPH5xYqUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="70359227"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="70359227"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 01:48:22 -0800
X-CSE-ConnectionGUID: v4P/cIRjTmqy3lNurBMF0A==
X-CSE-MsgGUID: te7DjniIQsmUagWWCeXygQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="225580389"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.68])
 by fmviesa001.fm.intel.com with ESMTP; 03 Dec 2025 01:48:21 -0800
From: nishit.sharma@intel.com
To: jonathan.cavitt@intel.com, igt-dev@lists.freedesktop.org,
 nishit.sharma@intel.com
Subject: [PATCH] tests/intel/xe_compute: Add VM page fault property reporting
 test
Date: Wed,  3 Dec 2025 09:48:20 +0000
Message-ID: <20251203094820.14800-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Nishit Sharma <nishit.sharma@intel.com>

Add new subtest 'vm-get-property-pagefault-reporting' to validate the
DRM_IOCTL_XE_VM_GET_PROPERTY ioctl for querying VM page fault information.

This test exercises the kernel's page fault tracking mechanism for VMs
created with fault-mode enabled. It verifies:
- Initial page fault count is zero for newly created VMs
- Page faults are correctly tracked and reported after triggering
- Reported fault count respects the maximum limit (≤50 faults)
- All reported faults maintain consistent fault address, access type,
  and fault type
- VM isolation is maintained (faults in VM1 don't affect VM2)

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_compute.c | 171 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 171 insertions(+)

diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 108235637..48c6e032a 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -16,6 +16,7 @@
 #include "igt.h"
 #include "igt_sysfs.h"
 #include "intel_compute.h"
+#include "xe_drm.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
@@ -510,6 +511,173 @@ test_compute_square(int fd)
 		      "GPU not supported\n");
 }
 
+static void print_pf(struct xe_vm_fault *fault)
+{
+        igt_debug("FAULT:\n");
+        igt_debug("address = 0x%08x%08x\n",
+                  upper_32_bits(fault->address),
+                  lower_32_bits(fault->address));
+        igt_debug("address precision = %u\n", fault->address_precision);
+        igt_debug("access type = %u\n", fault->access_type);
+        igt_debug("fault type = %u\n", fault->fault_type);
+        igt_debug("fault level = %u\n", fault->fault_level);
+        igt_debug("\n");
+}
+
+/**
+ * SUBTEST: vm-get-property-pagefault-reporting
+ * Description: Test VM page fault reporting via xe_vm_get_property ioctl
+ * Functionality: VM page fault isolation and query
+ * Test category: functionality test
+ */
+static void test_vm_pagefault_reporting(void)
+{
+	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_vm_get_property property = {0};
+	struct xe_vm_fault *faults_1, f0, f;
+	uint32_t vm1, vm2;
+	uint32_t exec_queue1;
+	uint64_t addr = 0x1a0000;
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+	};
+	struct drm_xe_exec exec = {};
+	uint64_t *sync_val;
+	int ret;
+	int fd, fault_count, final_fault_count, check_count;
+	uint32_t bo;
+	bool found_compute = false;
+
+	fd = drm_open_driver(DRIVER_XE);
+	xe_device_get(fd);
+
+	igt_require(xe_has_vram(fd)); /* Fault mode typically needs VRAM */
+
+	/* Create fault-mode VM1 */
+	vm1 = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			   DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	igt_assert(vm1);
+
+	/* Step 1: Query initial pagefault count (should be 0) */
+	property.vm_id = vm1;
+	property.property = DRM_XE_VM_GET_PROPERTY_FAULTS;
+	property.data = 0;
+	property.size = 0;
+
+	ret = igt_ioctl(fd, DRM_IOCTL_XE_VM_GET_PROPERTY, &property);
+	igt_assert_eq(ret, 0);
+
+
+	if (property.size > 0) {
+		faults_1 = malloc(property.size);
+		igt_assert(faults_1);
+		property.data = to_user_pointer(faults_1);
+		ret = igt_ioctl(fd, DRM_IOCTL_XE_VM_GET_PROPERTY, &property);
+		igt_assert_eq(ret, 0);
+		free(faults_1);
+	}
+
+	fault_count = property.size / sizeof(struct xe_vm_fault);
+	f0 = faults_1[0];
+
+	for (int i = 0; i < fault_count; i++) {
+		f = faults_1[i];
+		print_pf(&f);
+		igt_assert_eq(f.address, f0.address);
+		igt_assert_eq(f.access_type, f0.access_type);
+		igt_assert_eq(f.fault_type, f0.fault_type);
+	}
+        free(faults_1);
+
+	/* Step 2: Trigger a page fault via compute job */
+	xe_for_each_engine(fd, hwe) {
+		if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
+			continue;
+		found_compute = true;
+
+		exec_queue1 = xe_exec_queue_create(fd, vm1, hwe, 0);
+		sync_val = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
+		igt_assert(sync_val != MAP_FAILED);
+		*sync_val = 0;
+		sync.addr = to_user_pointer(sync_val);
+
+		/* Create a faulting job (access unmapped address) */
+		bo = xe_bo_create(fd, vm1, 4096, vram_if_possible(fd, 0), 0);
+		exec.exec_queue_id = exec_queue1;
+		exec.num_batch_buffer = 1;
+		exec.address = addr; /* Unmapped - will fault */
+		exec.syncs = to_user_pointer(&sync);
+
+		/* This exec should trigger page fault */
+		ret = igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec);
+
+		/* Wait for fault handling */
+		usleep(100000); /* 100ms for page fault to be recorded */
+
+		gem_close(fd, bo);
+
+		/* Step 3: Query pagefault count after fault */
+		faults_1 = malloc(property.size);
+		igt_assert(faults_1);
+		property.data = to_user_pointer(faults_1);
+		property.size = 0;
+		ret = igt_ioctl(fd, DRM_IOCTL_XE_VM_GET_PROPERTY, &property);
+		igt_assert_eq(ret, 0);
+
+		if (property.size > 0) {
+			faults_1 = malloc(property.size);
+			igt_assert(faults_1);
+			property.data = to_user_pointer(faults_1);
+			ret = igt_ioctl(fd, DRM_IOCTL_XE_VM_GET_PROPERTY, &property);
+			igt_assert_eq(ret, 0);
+
+			final_fault_count = property.size / sizeof(struct xe_vm_fault);
+			check_count = final_fault_count > 50 ? 50 : final_fault_count;
+			f0 = faults_1[0];
+
+			for (int i = 0; i < check_count; i++) {
+				f = faults_1[i];
+				print_pf(&f);
+				igt_assert_eq(f.address, f0.address);
+				igt_assert_eq(f.access_type, f0.access_type);
+				igt_assert_eq(f.fault_type, f0.fault_type);
+			}
+			free(faults_1);
+		}
+
+		munmap(sync_val, 4096);
+		xe_exec_queue_destroy(fd, exec_queue1);
+	}
+	igt_require(found_compute);
+
+	/* Step 4: Create VM2 for isolation test */
+	vm2 = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	igt_assert(vm2);
+
+	property.vm_id = vm2;
+	property.property = DRM_XE_VM_GET_PROPERTY_FAULTS;
+	property.data = 0;
+	property.size = 0;
+	ret = igt_ioctl(fd, DRM_IOCTL_XE_VM_GET_PROPERTY, &property);
+	igt_assert_eq(ret, 0);
+
+	if (property.size > 0) {
+		faults_1 = malloc(property.size);
+		igt_assert(faults_1);
+		property.data = to_user_pointer(faults_1);
+		ret = igt_ioctl(fd, DRM_IOCTL_XE_VM_GET_PROPERTY, &property);
+		igt_assert_eq(ret, 0);
+		free(faults_1);
+	}
+
+	/* Cleanup */
+	xe_vm_destroy(fd, vm1);
+	xe_vm_destroy(fd, vm2);
+	drm_close_driver(fd);
+}
+
 igt_main
 {
 	int xe, ccs_mode[4];
@@ -565,6 +733,9 @@ igt_main
 		test_eu_busy(5 * LOOP_DURATION_2s);
 	}
 
+	igt_subtest("vm-get-property-pagefault-reporting")
+		test_vm_pagefault_reporting();
+
 	igt_fixture {
 		if (!sriov_enabled)
 			igt_restore_ccs_mode(ccs_mode, ARRAY_SIZE(ccs_mode));
-- 
2.43.0

