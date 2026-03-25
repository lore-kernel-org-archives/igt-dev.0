Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791E3106B526
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 12:44:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 353D010E230;
	Wed, 25 Mar 2026 12:44:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bCHuQTQc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55BC110E560
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 12:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774442686; x=1805978686;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X7Z1X3L+OcoB8SvLL3N/64lPStv2KkVAQqBI7G7LtZk=;
 b=bCHuQTQcamQvrwg/fLfQKGH9rVWI6QtdtdoYg8NbOvRMaCYN058YGCB+
 QcYpxkOBw6AU1TNSs4etDGGbgyJYpp28y9AAEuY0pzRHC7hyuLMl7aC9U
 ng3e3v1pzP40BOMMXHWjoQV6oycWJYvLLE+DbHjvO0rAerbCej6+/nlmm
 p5FX5A1m045SyJt+V2FglwjbfwcGEflGJJVKioh/6Wg0jNpr/HASV8oyQ
 BhAfKG7pYg4Bz/c3HQn6dna8/NTukMdYHYYeyPaJb6KOrlyNeegSWHKFz
 0eyMXwlA6+bIr+2w4smS6lgCAM/PQIDqNoo3GNAeoeIQY3DatqJa2qjue A==;
X-CSE-ConnectionGUID: COiQ/STvQiO5FVPFBW/Vow==
X-CSE-MsgGUID: wpsrHsM6SxmdLChxDfJf2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86555505"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="86555505"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 05:44:46 -0700
X-CSE-ConnectionGUID: t3VoJrHxRD2ZTjxXv9X+SA==
X-CSE-MsgGUID: n77kSp+RQ0mwo/F2YMOVIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="223876356"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 05:44:44 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
Subject: [PATCH i-g-t v6 3/9] tests/intel/xe_madvise: Add dontneed-before-mmap
 subtest
Date: Wed, 25 Mar 2026 18:14:17 +0530
Message-ID: <20260325124426.3265234-4-arvind.yadav@intel.com>
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

This test validates that mmap() fails with -EBUSY when attempting to
map a BO marked DONTNEED. The mmap offset ioctl succeeds (it just
returns the pre-allocated offset); the purgeable check happens in
xe_gem_object_mmap() at mmap() time.

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

v6:
  - Support iGPU by using total system RAM as the pressure baseline
    instead of VRAM size (which is 0 on iGPU).
  - Raise overpressure from 25% to 50% of the baseline to ensure the
    kernel shrinker is forced to reclaim on systems with large free RAM.
  - The DONTNEED enforcement point is mmap() itself, not the
    DRM_IOCTL_XE_GEM_MMAP_OFFSET ioctl. Update the test to mark DONTNEED
    first, then verify DRM_IOCTL_XE_GEM_MMAP_OFFSET still succeeds, and
    finally verify that mmap() fails with -EBUSY

Cc: Nishit Sharma <nishit.sharma@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 tests/intel/xe_madvise.c | 233 +++++++++++++++++++++++++++++++++++++++
 tests/meson.build        |   1 +
 2 files changed, 234 insertions(+)
 create mode 100644 tests/intel/xe_madvise.c

diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
new file mode 100644
index 000000000..de4a6e34c
--- /dev/null
+++ b/tests/intel/xe_madvise.c
@@ -0,0 +1,233 @@
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
+ * trigger_memory_pressure - Fill VRAM/RAM + 50% to force purgeable reclaim
+ * @fd: DRM file descriptor
+ * @vm: VM handle (unused, kept for API compatibility)
+ *
+ * Allocates BOs in a temporary VM until memory is overcommitted by 50%,
+ * forcing the kernel to purge DONTNEED-marked BOs.
+ */
+static void trigger_memory_pressure(int fd, uint32_t vm)
+{
+	uint64_t vram_size, mem_size, overpressure;
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
+	if (vram_size > 0) {
+		/* dGPU: pressure VRAM to trigger purgeable reclaim */
+		mem_size = vram_size;
+	} else {
+		/*
+		 * iGPU: purgeable BOs reside in system memory. Use *total*
+		 * RAM (not just available) as the baseline so that we always
+		 * over-commit regardless of how much is already in use.
+		 */
+		mem_size = igt_get_total_ram_mb() << 20;
+	}
+
+	/* Scale overpressure to 50% of memory, minimum 64MB */
+	overpressure = mem_size / 2;
+	if (overpressure < (64 << 20))
+		overpressure = 64 << 20;
+
+	max_objs = (mem_size + overpressure) / chunk + 1;
+	handles = malloc(max_objs * sizeof(*handles));
+	igt_assert(handles);
+
+	total = 0;
+	while (total < mem_size + overpressure && n < max_objs) {
+		uint32_t err;
+
+		err = __xe_bo_create(fd, temp_vm, chunk,
+				     vram_if_possible(fd, 0),
+				     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+				     NULL, &handle);
+		if (err) /* Out of memory — sufficient pressure achieved */
+			break;
+
+		handles[n++] = handle;
+		total += chunk;
+
+		p = xe_bo_map(fd, handle, chunk);
+		igt_assert(p != MAP_FAILED);
+
+		/* Fault in all pages so they actually consume memory */
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
+ * Description: Mark BO as DONTNEED before mmap, verify mmap() fails with -EBUSY
+ * Test category: functionality test
+ */
+static void test_dontneed_before_mmap(int fd)
+{
+	uint32_t bo, vm;
+	uint64_t addr = PURGEABLE_ADDR;
+	size_t bo_size = PURGEABLE_BO_SIZE;
+	struct drm_xe_gem_mmap_offset mmo = {};
+	uint32_t retained;
+	void *ptr;
+
+	purgeable_setup_simple_bo(fd, &vm, &bo, addr, bo_size, false);
+
+	/* Mark BO as DONTNEED - new mmap operations must be blocked */
+	retained = xe_vm_madvise_purgeable(fd, vm, addr, bo_size,
+					   DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
+	igt_assert_eq(retained, 1);
+
+	/* Ioctl succeeds even for DONTNEED BO; blocking happens at mmap() time. */
+	mmo.handle = bo;
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo), 0);
+
+	/* mmap() on a DONTNEED BO must fail with EBUSY. */
+	ptr = mmap(NULL, bo_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, mmo.offset);
+	igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);
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
+			test_dontneed_before_mmap(fd);
+			break;
+		}
+
+	igt_fixture() {
+		xe_device_put(fd);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index cecb4a8ae..a6370b685 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -314,6 +314,7 @@ intel_xe_progs = [
 	'xe_huc_copy',
 	'xe_intel_bb',
 	'xe_live_ktest',
+	'xe_madvise',
 	'xe_media_fill',
 	'xe_mmap',
         'xe_module_load',
-- 
2.43.0

