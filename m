Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F40E9DE43
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 07:02:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D21F210E74C;
	Thu,  9 Apr 2026 07:02:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dSHbptpi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7292F10E74A
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 07:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775718109; x=1807254109;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LWTXyTJJzw/5uOEkOiCAB2Md2ua+TIcvu8+cVkj8qt4=;
 b=dSHbptpiFvSFRetGgdzxXKAE6uxmJVU5JdlYPDYfgjOM15OsS9ky0FJF
 2NFcLluBNG8IyjZsGs0WxzAsmy+YJRcB4qMHXWyUcPZfIxohPVQPuQ1NJ
 KvDU2UloTOFBCht9M+0eblMhxPlcnD/YDi8Wy1PyZYXnSHsuDais9JpSE
 VpzqHfmf+/njiyW5Nt3uxv+jKvp/23rdUcejCWPC0vF8OoCKWXG3yw2ip
 +FBH0ol8RClupUi72eYvOs0DTuFyj/QhcYt9UVDQLwMr0kvjvGtd/hrfQ
 CaqVLWeeLLaIzoJMNDVLwkXuz7IGiFH2IlN1kIeWGtBIHKt2tQP171snL w==;
X-CSE-ConnectionGUID: G1HUpbk4QxibJmtHivUX8Q==
X-CSE-MsgGUID: MAdenUMaRUWyOo4zNZjj7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="88165075"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="88165075"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 00:01:48 -0700
X-CSE-ConnectionGUID: 5/70SPUjTnO2gDEdsEsRTg==
X-CSE-MsgGUID: zADVA713TcisME42UKJbnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="224384138"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 00:01:45 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
Subject: [PATCH i-g-t v7 8/9] tests/intel/xe_madvise: Add per-vma-tracking
 subtest
Date: Thu,  9 Apr 2026 12:31:17 +0530
Message-ID: <20260409070118.2211602-9-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409070118.2211602-1-arvind.yadav@intel.com>
References: <20260409070118.2211602-1-arvind.yadav@intel.com>
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
v7:
  - Removed unused 'hwe' parameter.

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
index 18bec198e..28a77e938 100644
--- a/tests/intel/xe_madvise.c
+++ b/tests/intel/xe_madvise.c
@@ -20,6 +20,7 @@
 
 /* Purgeable test constants */
 #define PURGEABLE_ADDR		0x1a0000
+#define PURGEABLE_ADDR2		0x2b0000
 #define PURGEABLE_BATCH_ADDR	0x3c0000
 #define PURGEABLE_BO_SIZE	4096
 #define PURGEABLE_FENCE_VAL	0xbeef
@@ -257,6 +258,58 @@ static void purgeable_setup_batch_and_data(int fd, uint32_t *vm,
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
@@ -536,6 +589,61 @@ static void test_dontneed_after_exec(int fd, struct drm_xe_engine_class_instance
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * SUBTEST: per-vma-tracking
+ * Description: One BO in two VMs becomes purgeable only when both VMAs are DONTNEED
+ * Test category: functionality test
+ */
+static void test_per_vma_tracking(int fd)
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
+	trigger_memory_pressure(fd);
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
@@ -578,6 +686,12 @@ int igt_main()
 			break;
 		}
 
+	igt_subtest("per-vma-tracking")
+		xe_for_each_engine(fd, hwe) {
+			test_per_vma_tracking(fd);
+			break;
+		}
+
 	igt_fixture() {
 		xe_device_put(fd);
 		drm_close_driver(fd);
-- 
2.43.0

