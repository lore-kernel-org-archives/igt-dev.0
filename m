Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BFAF45A1C
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 06:17:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E7110E572;
	Tue, 14 Apr 2026 06:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bw8iDzpF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3597310E56B
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 06:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776147441; x=1807683441;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FWavkFsxVoIBjoLo8XhqtoAcTPCw2g98eYEKsOuV0Ik=;
 b=bw8iDzpFQl6qBfwQJz3XYKH9t4NBtSOGYQhBmTuf8nx7T/Hmn1TXZdXX
 iXiVpGwIQBgaUrHGI0WCTqbVBTz99hg6MacEth3ntm0nwy/k8Q+gj8MBF
 seV3AtR2f/MgTj8PKGenSUZxJMjmzLDVr5vnaLr/QDQXHZqx1ECS8BdAS
 pOf+wdW9xMjuIAJF98WCxeIZIJmSJoyhGsrPlF+x1OBJbsqQ+XN9f5OHg
 5VziOxEHcYpfBgkTbYoQhTbEWgBK3Wdm2aFS6Er9I+3hS+SPCh3rPC8LB
 zGKqF7IHem8K/5PcyAG7kl5WRMv/BIj4iSEJoN3RVIImx/fYAwaDTXmaR Q==;
X-CSE-ConnectionGUID: Rx9FeYGAQyChTqVUfQYKSA==
X-CSE-MsgGUID: 4lHMixCOT0mAHToG9sjHZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="88173115"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="88173115"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 23:17:21 -0700
X-CSE-ConnectionGUID: ojY0HcS+T1eHw8hwe5pRxQ==
X-CSE-MsgGUID: ytEOk7FdQGmYEVT66CCfeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="234962795"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 23:17:19 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
Subject: [PATCH i-g-t v10 2/8] tests/intel/xe_madvise: Add
 dontneed-before-mmap subtest
Date: Tue, 14 Apr 2026 11:46:53 +0530
Message-ID: <20260414061703.2604112-3-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414061703.2604112-1-arvind.yadav@intel.com>
References: <20260414061703.2604112-1-arvind.yadav@intel.com>
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

v7:
  - Move unused functions: trigger_memory_pressure(), sigtrap and
    purgeable_mark_and_verify_purged. (Nishit)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 tests/intel/xe_madvise.c | 122 +++++++++++++++++++++++++++++++++++++++
 tests/meson.build        |   1 +
 2 files changed, 123 insertions(+)
 create mode 100644 tests/intel/xe_madvise.c

diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
new file mode 100644
index 000000000..2c8c27fa9
--- /dev/null
+++ b/tests/intel/xe_madvise.c
@@ -0,0 +1,122 @@
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
+/* Purgeable test constants */
+#define PURGEABLE_ADDR		0x1a0000
+#define PURGEABLE_BO_SIZE	4096
+
+static bool xe_has_purgeable_support(int fd)
+{
+	struct drm_xe_query_config *config = xe_config(fd);
+
+	return config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
+		DRM_XE_QUERY_CONFIG_FLAG_HAS_PURGING_SUPPORT;
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
index 26d9345ec..09b0cc27c 100644
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

