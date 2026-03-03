Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607B7EDA680
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 15:29:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 082CB10E072;
	Tue,  3 Mar 2026 15:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BicvhSrB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A8710E83D
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 15:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772551766; x=1804087766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2www57bneEgp9SmJKEGf6tfkvvE12JKabvcZVBlf+lw=;
 b=BicvhSrBxTHlRKQ5yrkcPUr/BgPfxIGuEi1snx9DVpRlG384HaOpPdRA
 rYpTkkaAJTY3j2LrRtyohqtsNENYgqlICfaIKQorinXG5tLi+/SWyaGEE
 YV4m4lmFrFtuhOPIg7SWIehhx76LqhAdVPkMtK4lXm3Xwd/pYX4qYYW2M
 1+q7j4hrBJNB6rkTq8J4GmiuSvRTTbFs+8JWySINBomtdTXCcCy2kt++E
 tpST3i7J+HgkKCUS1KY5TRxcwqbTIdj2zRHqYpxKEC1VVpgDujHXEOhAq
 Y2y91ITQOa7XGn3U/9j4BbKid0q30CfoUxBusUQ5ADwhXjpnJUTW9kOeJ w==;
X-CSE-ConnectionGUID: HDxtM77+TsS3RpyEEiHVmA==
X-CSE-MsgGUID: KAfDky9TSTaOebu8xvwA2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="76193146"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="76193146"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 07:29:26 -0800
X-CSE-ConnectionGUID: KgZK3gG9RS+FzaTBR3zABA==
X-CSE-MsgGUID: Ov57IMCtSGKm6MGAeVomOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="215098690"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 07:29:24 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
Subject: [PATCH i-g-t v5 3/9] tests/intel/xe_madvise: Add dontneed-before-mmap
 subtest
Date: Tue,  3 Mar 2026 20:58:56 +0530
Message-ID: <20260303152909.3503461-4-arvind.yadav@intel.com>
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

This test validates kernel behavior when attempting to mmap a BO that
was marked as purgeable (DONTNEED). The test attempts to obtain an mmap
offset. The kernel should block the DRM_IOCTL_XE_GEM_MMAP_OFFSET ioctl
with -EBUSY, preventing any new CPU mappings of purgeable BOs

  - DONTNEED BOs: return -EBUSY (temporary purgeable state, BO still
    has backing store but can be purged at any time)
  - Purged BOs: return -EINVAL (permanent, backing store discarded)

v4:
  - Move unmap outside the block. (Pravalika)
  - Added proper resource cleanup before calling igt_skip(). (Nishit)
  - Added assertion for xe_bo_map. (Nishit)

v5:
  - Add kernel capability check *_FLAG_HAS_PURGING_SUPPORT for
    purgeable support. (Jose)
  - Drop memory pressure trigger path; mark DONTNEED directly and
    assert -EBUSY from mmap offset ioctl; restore WILLNEED before
    cleanup.

Cc: Nishit Sharma <nishit.sharma@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 tests/intel/xe_madvise.c | 210 +++++++++++++++++++++++++++++++++++++++
 tests/meson.build        |   1 +
 2 files changed, 211 insertions(+)
 create mode 100644 tests/intel/xe_madvise.c

diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
new file mode 100644
index 000000000..435dd939e
--- /dev/null
+++ b/tests/intel/xe_madvise.c
@@ -0,0 +1,210 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+/**
+ * TEST: Validate purgeable BO madvise functionality
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: Memory management tests
+ * Functionality: madvise, purgeable
+ */
+
+#include "igt.h"
+#include "xe_drm.h"
+
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
+static bool xe_has_purgeable_support(int fd)
+{
+	struct drm_xe_query_config *config = xe_config(fd);
+
+	return config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
+		DRM_XE_QUERY_CONFIG_FLAG_HAS_PURGING_SUPPORT;
+}
+
+/* Purgeable test constants */
+#define PURGEABLE_ADDR		0x1a0000
+#define PURGEABLE_BO_SIZE	4096
+
+/**
+ * trigger_memory_pressure - Fill VRAM + 25% to force purgeable reclaim
+ * @fd: DRM file descriptor
+ * @vm: VM handle (unused, kept for API compatibility)
+ *
+ * Allocates BOs in a temporary VM until VRAM is overcommitted,
+ * forcing the kernel to purge DONTNEED-marked BOs.
+ */
+static void trigger_memory_pressure(int fd, uint32_t vm)
+{
+	uint64_t vram_size, overpressure;
+	const uint64_t chunk = 8ull << 20; /* 8 MiB */
+	int max_objs, n = 0;
+	uint32_t *handles;
+	uint64_t total;
+	void *p;
+	uint32_t handle, temp_vm;
+
+	/* Use a separate VM so pressure BOs don't affect the test VM */
+	temp_vm = xe_vm_create(fd, 0, 0);
+
+	vram_size = xe_visible_vram_size(fd, 0);
+	/* Scale overpressure to 25% of VRAM, minimum 64MB */
+	overpressure = vram_size / 4;
+	if (overpressure < (64 << 20))
+		overpressure = 64 << 20;
+
+	max_objs = (vram_size + overpressure) / chunk + 1;
+	handles = malloc(max_objs * sizeof(*handles));
+	igt_assert(handles);
+
+	total = 0;
+	while (total < vram_size + overpressure && n < max_objs) {
+		handle = xe_bo_create(fd, temp_vm, chunk,
+				      vram_if_possible(fd, 0),
+				      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		handles[n++] = handle;
+		total += chunk;
+
+		p = xe_bo_map(fd, handle, chunk);
+		igt_assert(p != MAP_FAILED);
+
+		/* Fault in all pages so they actually consume VRAM */
+		memset(p, 0xCD, chunk);
+		munmap(p, chunk);
+	}
+
+	/* Allow shrinker time to process pressure */
+	usleep(100000);
+
+	for (int i = 0; i < n; i++)
+		gem_close(fd, handles[i]);
+
+	free(handles);
+
+	xe_vm_destroy(fd, temp_vm);
+}
+
+static jmp_buf jmp;
+
+__noreturn static void sigtrap(int sig)
+{
+	siglongjmp(jmp, sig);
+}
+
+/**
+ * purgeable_mark_and_verify_purged - Mark DONTNEED, pressure, check purged
+ * @fd: DRM file descriptor
+ * @vm: VM handle
+ * @addr: Virtual address of the BO
+ * @size: Size of the BO
+ *
+ * Returns true if the BO was purged under memory pressure.
+ */
+static bool purgeable_mark_and_verify_purged(int fd, uint32_t vm, uint64_t addr, size_t size)
+{
+	uint32_t retained;
+
+	/* Mark as DONTNEED */
+	retained = xe_vm_madvise_purgeable(fd, vm, addr, size,
+					   DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
+	if (retained != 1)
+		return false;
+
+	/* Trigger memory pressure */
+	trigger_memory_pressure(fd, vm);
+
+	/* Verify purged */
+	retained = xe_vm_madvise_purgeable(fd, vm, addr, size,
+					   DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
+	return retained == 0;
+}
+
+/**
+ * purgeable_setup_simple_bo - Setup VM and bind a single BO
+ * @fd: DRM file descriptor
+ * @vm: Output VM handle
+ * @bo: Output BO handle
+ * @addr: Virtual address to bind at
+ * @size: Size of the BO
+ * @use_scratch: Whether to use scratch page flag
+ *
+ * Helper to create VM, BO, and bind it at the specified address.
+ */
+static void purgeable_setup_simple_bo(int fd, uint32_t *vm, uint32_t *bo,
+				      uint64_t addr, size_t size, bool use_scratch)
+{
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.timeline_value = 1,
+	};
+	uint64_t sync_val = 0;
+
+	*vm = xe_vm_create(fd, use_scratch ? DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE : 0, 0);
+	*bo = xe_bo_create(fd, *vm, size, vram_if_possible(fd, 0),
+			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+
+	sync.addr = to_user_pointer(&sync_val);
+	xe_vm_bind_async(fd, *vm, 0, *bo, 0, addr, size, &sync, 1);
+	xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC);
+}
+
+/**
+ * SUBTEST: dontneed-before-mmap
+ * Description: Mark BO as DONTNEED before mmap, verify mmap offset fails with -EBUSY
+ * Test category: functionality test
+ */
+static void test_dontneed_before_mmap(int fd, struct drm_xe_engine_class_instance *hwe)
+{
+	uint32_t bo, vm;
+	uint64_t addr = PURGEABLE_ADDR;
+	size_t bo_size = PURGEABLE_BO_SIZE;
+	struct drm_xe_gem_mmap_offset mmo = {};
+	uint32_t retained;
+
+	purgeable_setup_simple_bo(fd, &vm, &bo, addr, bo_size, false);
+
+	/* Mark BO as DONTNEED - new mmap operations must be blocked */
+	retained = xe_vm_madvise_purgeable(fd, vm, addr, bo_size,
+					   DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
+	igt_assert_eq(retained, 1);
+
+	/* Attempt to get mmap offset for BO in DONTNEED state - should fail with EBUSY */
+	mmo.handle = bo;
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo), -1);
+	igt_assert_eq(errno, EBUSY);
+
+	/* Restore to WILLNEED before cleanup */
+	xe_vm_madvise_purgeable(fd, vm, addr, bo_size,
+				DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
+
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
+int igt_main()
+{
+	struct drm_xe_engine_class_instance *hwe;
+	int fd;
+
+	igt_fixture() {
+		fd = drm_open_driver(DRIVER_XE);
+		xe_device_get(fd);
+		igt_require_f(xe_has_purgeable_support(fd),
+			      "Kernel does not support purgeable buffer objects\n");
+	}
+
+	igt_subtest("dontneed-before-mmap")
+		xe_for_each_engine(fd, hwe) {
+			test_dontneed_before_mmap(fd, hwe);
+			break;
+		}
+
+	igt_fixture() {
+		xe_device_put(fd);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 0ad728b87..9d41d7de6 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -313,6 +313,7 @@ intel_xe_progs = [
 	'xe_huc_copy',
 	'xe_intel_bb',
 	'xe_live_ktest',
+	'xe_madvise',
 	'xe_media_fill',
 	'xe_mmap',
         'xe_module_load',
-- 
2.43.0

