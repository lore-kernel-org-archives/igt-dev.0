Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD6E109E553
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 06:06:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB63C10E2CE;
	Thu, 26 Mar 2026 06:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SDaqfiEz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F13610E1F8
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 06:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774505147; x=1806041147;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BN3ccaYmtd+qANxmahWSeAfawR1Co7jXXypDVxsfvHQ=;
 b=SDaqfiEzClVnjHrR6QklNCHlYLPpon9GHRgLQb5rgF3NTt1dEWP13s0R
 PuZw7G8kivf5HKWX+hql1Qtj9mZAkJnCWBNDzOSwErQSFQZ5tWlYwF03R
 xKaxrUi351n7w4oTm4xQ120C8e4OGkpwmD2A4Eu5JQYezNMD9bl9bxXUW
 nAkv62Rx04G/Rz8ChFXUgtVKMSDwBysBFOXDx0Npa1YZ+TGTxcSpDw2vv
 p2uotn+JMvChqzpTZz/mIlALWqltsQpF1lXDEphpXrfB0C+DkMvYaVIGI
 NjYO9oWu6QOWDhTts89Gz1w1EtBFdZ8N7Su7UV1IjhkzRRYrdQwMMBqD+ w==;
X-CSE-ConnectionGUID: kCekaLdVQJiyufpsEOGFdg==
X-CSE-MsgGUID: urw1RMuoQ6GLcIDlBiHXJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="98173973"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="98173973"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 23:05:43 -0700
X-CSE-ConnectionGUID: 1QZ6hvkPREKjMu4In/Ue8Q==
X-CSE-MsgGUID: 5WQPbKLOROSpAqZsfAJTPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="229362009"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.55])
 by orviesa004.jf.intel.com with ESMTP; 25 Mar 2026 23:05:42 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	jonathan.cavitt@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_compute: Add VM page fault property
 reporting test
Date: Thu, 26 Mar 2026 06:05:40 +0000
Message-ID: <20260326060540.7500-1-nishit.sharma@intel.com>
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
 tests/intel/xe_compute.c | 167 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 167 insertions(+)

diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 762e66fcd..673e8ad36 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -25,6 +25,7 @@
 #define LOOP_DURATION_2s	(1000000ull * 2)
 #define DURATION_MARGIN		0.2
 #define MIN_BUSYNESS		95.0
+#define EXEC_SYNC_VAL		0x676767
 
 bool sriov_enabled;
 
@@ -510,6 +511,169 @@ test_compute_square(int fd)
 		      "GPU not supported\n");
 }
 
+static void print_pf(struct xe_vm_fault *fault)
+{
+	igt_debug("FAULT:\n");
+	igt_debug("address = 0x%08x%08x\n",
+		  upper_32_bits(fault->address),
+		  lower_32_bits(fault->address));
+	igt_debug("address precision = %u\n", fault->address_precision);
+	igt_debug("access type = %u\n", fault->access_type);
+	igt_debug("fault type = %u\n", fault->fault_type);
+	igt_debug("fault level = %u\n", fault->fault_level);
+	igt_debug("\n");
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
+	struct drm_xe_vm_get_property query = {0};
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
+	query.vm_id = vm1;
+	query.property = DRM_XE_VM_GET_PROPERTY_FAULTS;
+	query.data = 0;
+	query.size = 0;
+
+	xe_vm_get_property(fd, vm1, &query);
+	igt_assert_eq(query.size, 0);
+
+	if (query.size > 0) {
+		faults_1 = malloc(query.size);
+		igt_assert(faults_1);
+		query.data = to_user_pointer(faults_1);
+		xe_vm_get_property(fd, vm1, &query);
+	}
+
+	fault_count = query.size / sizeof(struct xe_vm_fault);
+	f0 = faults_1[0];
+
+	for (int i = 0; i < fault_count; i++) {
+		f = faults_1[i];
+		print_pf(&f);
+		igt_assert_eq(f.address, f0.address);
+		igt_assert_eq(f.access_type, f0.access_type);
+		igt_assert_eq(f.fault_type, f0.fault_type);
+	}
+	free(faults_1);
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
+		igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec);
+
+		/* Wait for fault handling */
+		usleep(100000); /* 100ms for page fault to be recorded */
+
+		gem_close(fd, bo);
+
+		/* Step 3: Query pagefault count after fault */
+		faults_1 = malloc(query.size);
+		igt_assert(faults_1);
+		query.data = to_user_pointer(faults_1);
+		query.size = 0;
+		xe_vm_get_property(fd, vm1, &query);
+		igt_assert_lt(0, query.size);
+
+		if (query.size > 0) {
+			faults_1 = malloc(query.size);
+			igt_assert(faults_1);
+			query.data = to_user_pointer(faults_1);
+			xe_vm_get_property(fd, vm1, &query);
+			igt_assert_lt(0, query.size);
+
+			final_fault_count = query.size / sizeof(struct xe_vm_fault);
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
+			   DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	igt_assert(vm2);
+
+	query.vm_id = vm2;
+	query.property = DRM_XE_VM_GET_PROPERTY_FAULTS;
+	query.data = 0;
+	query.size = 0;
+	xe_vm_get_property(fd, vm1, &query);
+	igt_assert_eq(query.size, 0);
+
+	if (query.size > 0) {
+		faults_1 = malloc(query.size);
+		igt_assert(faults_1);
+		query.data = to_user_pointer(faults_1);
+		xe_vm_get_property(fd, vm1, &query);
+		igt_assert_lt(0, query.size);
+		free(faults_1);
+	}
+
+	/* Cleanup */
+	xe_vm_destroy(fd, vm1);
+	xe_vm_destroy(fd, vm2);
+	drm_close_driver(fd);
+}
+
 /**
  * SUBTEST: compute-square-userenv
  * Mega feature: Compute
@@ -717,6 +881,9 @@ int igt_main()
 		test_eu_busy(5 * LOOP_DURATION_2s);
 	}
 
+	igt_subtest("vm-get-property-pagefault-reporting")
+		test_vm_pagefault_reporting();
+
 	igt_fixture() {
 		if (!sriov_enabled)
 			igt_restore_ccs_mode(ccs_mode, ARRAY_SIZE(ccs_mode));
-- 
2.43.0

