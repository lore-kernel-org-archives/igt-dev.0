Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184D4106B526
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 12:45:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28D210E6FA;
	Wed, 25 Mar 2026 12:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XIJ3NjC5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F6210E560
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 12:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774442697; x=1805978697;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oIuNlS34tZNyqiXzPm4a4pfyW/BRgWKmDUgdDKuCXU8=;
 b=XIJ3NjC5O9MC//F86HT9nCOC+y7yk6aU6mcIeRnuTRBlKowP6imOOfHJ
 Bh086IvbOIsd9ojnhd3+3b7RxPcZNG2kkgQXvQqpWeaNd5fM+9d3kobUU
 Sal7ws3INX4ekP9+AR3+GBRdv3D0wTiyoZCOIKXAg9RG8dEWSu5VVPbFt
 wOkxsFcxqqFUi4eM09YCw8Rcwnk8GYqZbWJYHO9atEFFFdIzabMRBGqfE
 B1/jbdlKSd3rt6BRo7onOY4JUNd/WBfqAFkQ91oxayz9jVANxEu5uomkX
 Ql4xXqz23BrJ7ToRDCVOFx6WkJrkjy2PyiyJsm9WHuV3BG0DG+8VQ3Z5w Q==;
X-CSE-ConnectionGUID: 1cMuhotwTni6S7DTxc3pQg==
X-CSE-MsgGUID: MCIPRXCpSgKuySPztO2cjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86555517"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="86555517"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 05:44:57 -0700
X-CSE-ConnectionGUID: BxnJ2t8tT62YCG7gd9202A==
X-CSE-MsgGUID: +oKytWrmSDK16S1+nq+HCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="223876409"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 05:44:56 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
Subject: [PATCH i-g-t v6 8/9] tests/intel/xe_madvise: Add per-vma-tracking
 subtest
Date: Wed, 25 Mar 2026 18:14:22 +0530
Message-ID: <20260325124426.3265234-9-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325124426.3265234-1-arvind.yadav@intel.com>
References: <20260325124426.3265234-1-arvind.yadav@intel.com>
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

This test validates that purgeable state is tracked per-VMA when a
single BO is bound in multiple VMs. The test creates one BO shared
across two VMs at different virtual addresses. It verifies that marking
only one VMA as DONTNEED does not make the BO purgeable, but marking
both VMAs as DONTNEED allows the kernel to purge the shared BO. This
ensures proper per-VMA tracking for shared memory.

v4:
  -  The comment now clarifies that triggering pressure. (Nishit)

v6:
  - Move resource cleanup before igt_skip() to avoid leaking VM and BO
    handles on platforms where memory pressure cannot be induced; replace
    igt_assert_eq(retained, 0) with a graceful skip. (Nishit)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Nishit Sharma <nishit.sharma@intel.com>
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 tests/intel/xe_madvise.c | 114 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
index 28ea81442..6c0a563d8 100644
--- a/tests/intel/xe_madvise.c
+++ b/tests/intel/xe_madvise.c
@@ -28,6 +28,7 @@ static bool xe_has_purgeable_support(int fd)
 
 /* Purgeable test constants */
 #define PURGEABLE_ADDR		0x1a0000
+#define PURGEABLE_ADDR2		0x2b0000
 #define PURGEABLE_BATCH_ADDR	0x3c0000
 #define PURGEABLE_BO_SIZE	4096
 #define PURGEABLE_FENCE_VAL	0xbeef
@@ -267,6 +268,58 @@ static void purgeable_setup_batch_and_data(int fd, uint32_t *vm,
 	xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL, 0, NSEC_PER_SEC);
 }
 
+/**
+ * purgeable_setup_two_vms_shared_bo - Setup two VMs with one shared BO
+ * @fd: DRM file descriptor
+ * @vm1: Output first VM handle
+ * @vm2: Output second VM handle
+ * @bo: Output shared BO handle
+ * @addr1: Virtual address in VM1
+ * @addr2: Virtual address in VM2
+ * @size: Size of the BO
+ * @use_scratch: Whether to use scratch page flag for VMs
+ *
+ * Helper to create two VMs and bind one shared BO in both VMs.
+ * Returns mapped pointer to the BO.
+ */
+static void *purgeable_setup_two_vms_shared_bo(int fd, uint32_t *vm1, uint32_t *vm2,
+					       uint32_t *bo, uint64_t addr1,
+					       uint64_t addr2, size_t size,
+					       bool use_scratch)
+{
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.timeline_value = 1,
+	};
+	uint64_t sync_val = 0;
+	void *map;
+
+	/* Create two VMs */
+	*vm1 = xe_vm_create(fd, use_scratch ? DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE : 0, 0);
+	*vm2 = xe_vm_create(fd, use_scratch ? DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE : 0, 0);
+
+	/* Create shared BO */
+	*bo = xe_bo_create(fd, 0, size, vram_if_possible(fd, 0),
+			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+
+	map = xe_bo_map(fd, *bo, size);
+	memset(map, 0xAB, size);
+
+	/* Bind BO in VM1 */
+	sync.addr = to_user_pointer(&sync_val);
+	sync_val = 0;
+	xe_vm_bind_async(fd, *vm1, 0, *bo, 0, addr1, size, &sync, 1);
+	xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC);
+
+	/* Bind BO in VM2 */
+	sync_val = 0;
+	xe_vm_bind_async(fd, *vm2, 0, *bo, 0, addr2, size, &sync, 1);
+	xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC);
+
+	return map;
+}
+
 /**
  * SUBTEST: dontneed-before-mmap
  * Description: Mark BO as DONTNEED before mmap, verify mmap() fails with -EBUSY
@@ -546,6 +599,61 @@ static void test_dontneed_after_exec(int fd, struct drm_xe_engine_class_instance
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * SUBTEST: per-vma-tracking
+ * Description: One BO in two VMs becomes purgeable only when both VMAs are DONTNEED
+ * Test category: functionality test
+ */
+static void test_per_vma_tracking(int fd, struct drm_xe_engine_class_instance *hwe)
+{
+	uint32_t bo, vm1, vm2;
+	uint64_t addr1 = PURGEABLE_ADDR;
+	uint64_t addr2 = PURGEABLE_ADDR2;
+	size_t bo_size = PURGEABLE_BO_SIZE;
+	uint32_t retained;
+	void *map;
+
+	map = purgeable_setup_two_vms_shared_bo(fd, &vm1, &vm2, &bo,
+						addr1, addr2,
+						bo_size, false);
+
+	/* Mark VMA1 as DONTNEED */
+	retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
+					   DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
+	igt_assert_eq(retained, 1);
+
+	/* Verify BO NOT purgeable (VMA2 still WILLNEED) */
+	retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
+					   DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
+	igt_assert_eq(retained, 1);
+
+	/* Mark both VMAs as DONTNEED */
+	retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
+					   DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
+	igt_assert_eq(retained, 1);
+
+	retained = xe_vm_madvise_purgeable(fd, vm2, addr2, bo_size,
+					   DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
+	igt_assert_eq(retained, 1);
+
+	/*
+	 * Trigger pressure and verify BO was purged.
+	 * Using vm1 is sufficient since both VMAs are DONTNEED - kernel can purge the BO.
+	 */
+	trigger_memory_pressure(fd, vm1);
+
+	retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
+					   DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
+	munmap(map, bo_size);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm1);
+	xe_vm_destroy(fd, vm2);
+
+	if (retained != 0)
+		igt_skip("Unable to induce purge on this platform/config");
+
+}
+
 int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -588,6 +696,12 @@ int igt_main()
 			break;
 		}
 
+	igt_subtest("per-vma-tracking")
+		xe_for_each_engine(fd, hwe) {
+			test_per_vma_tracking(fd, hwe);
+			break;
+		}
+
 	igt_fixture() {
 		xe_device_put(fd);
 		drm_close_driver(fd);
-- 
2.43.0

