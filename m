Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCF0EDA68D
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 15:29:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4368910E83B;
	Tue,  3 Mar 2026 15:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ndxpp4Lu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9637A10E83B
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 15:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772551777; x=1804087777;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OPqXKpwJ+Su4qI4lERglDSBQ/0BTmLrppRP9jH5PlAg=;
 b=Ndxpp4LuSN6f6t1YmOF72MOQnLUwN52LsxLfQyrcYMSF6Hw+Lz1tOEiV
 vApDSCBdyVM9Z6W4qTxk93xQHiznJZ6k7vK0boWfwAvUlRhNKjgV9aYOS
 OmweowYYfpjxkP/eslc+JeRpb8LXNR2VBfra/TpDIMQQp2aD4sSX9jzw5
 WUZMh5FCqe8N73BkfFiabPj0Up9WmOb0QBXGADnG5UHc5/Lc6AyFeyTMz
 4elBHdApEBs/kYzma7pJ7aKcyXBR/rHyOnShm1YrQX1gLNf5mUzBhHWLs
 HtEvBuMjgf7Xa3r0hIE2W4obQKRW5BEV3yq15eMeytEfl+2z0pcFCV/UP w==;
X-CSE-ConnectionGUID: 0ToA+JxHQtW08+QkePpFIw==
X-CSE-MsgGUID: xYDHv6vGSL2EiaJN/W3KcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="76193158"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="76193158"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 07:29:36 -0800
X-CSE-ConnectionGUID: ZEOj0G9ZTyuCrbL3KCzmVg==
X-CSE-MsgGUID: lWlzMXBVR+WyfLDVAgLG3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="215098724"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 07:29:34 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
Subject: [PATCH i-g-t v5 8/9] tests/intel/xe_madvise: Add per-vma-tracking
 subtest
Date: Tue,  3 Mar 2026 20:59:01 +0530
Message-ID: <20260303152909.3503461-9-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303152909.3503461-1-arvind.yadav@intel.com>
References: <20260303152909.3503461-1-arvind.yadav@intel.com>
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

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>
Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 tests/intel/xe_madvise.c | 112 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
index 6c74c2d41..ababe2ca4 100644
--- a/tests/intel/xe_madvise.c
+++ b/tests/intel/xe_madvise.c
@@ -28,6 +28,7 @@ static bool xe_has_purgeable_support(int fd)
 
 /* Purgeable test constants */
 #define PURGEABLE_ADDR		0x1a0000
+#define PURGEABLE_ADDR2		0x2b0000
 #define PURGEABLE_BATCH_ADDR	0x3c0000
 #define PURGEABLE_BO_SIZE	4096
 #define PURGEABLE_FENCE_VAL	0xbeef
@@ -241,6 +242,58 @@ static void purgeable_setup_batch_and_data(int fd, uint32_t *vm,
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
  * Description: Mark BO as DONTNEED before mmap, verify mmap offset fails with -EBUSY
@@ -515,6 +568,59 @@ static void test_dontneed_after_exec(int fd, struct drm_xe_engine_class_instance
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
+	igt_assert_eq(retained, 0);
+
+	munmap(map, bo_size);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm1);
+	xe_vm_destroy(fd, vm2);
+}
+
 int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -557,6 +663,12 @@ int igt_main()
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

