Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85E1F45A1C
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 06:17:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 588D710E56B;
	Tue, 14 Apr 2026 06:17:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IqY73b+e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0684910E56B
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 06:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776147437; x=1807683437;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eACrYiDT/0Elo7hE2BAaMN4tS+sN2QJ10Gpm2CNTQ9A=;
 b=IqY73b+enVo6TkEc0VibvxKE+KGYi7x6B0ydT8XjCuiDqWTTCCnk+b0v
 r3+L4dVOs4BNKBtE0noe0N/1i4KPrwYVYS4WFZUdrEBQvSMHCG6vbYMyW
 BWGRHftu0/9/ouGs3vSJa0gqb9B3B+QVjsotdODJPMtNvDM40UaCXtGTk
 rkq69lbUZcWGwYvcOb0dYtCkOi8DICxOFhMEhrzYxGD+UGpanmSkn62y0
 lPGsWfpKOObQCuM+QujEuQLCqeV8uym/IUj6I54mCjrdNHCriMZ+iDIe3
 j5EzwMWZevQjBGTXXqPvKfLrzys4vaMnZ1tPgp4L64YcJjDIzr5Y0r8e2 A==;
X-CSE-ConnectionGUID: OIKcIqV3QOSMmHnx6eADcw==
X-CSE-MsgGUID: XVPkGF2pSqua9cz6Q6k9KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="88173107"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="88173107"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 23:17:16 -0700
X-CSE-ConnectionGUID: GzToyyVPSNahri478VwiMQ==
X-CSE-MsgGUID: cWE2Mz8DQy6UHqmTaGxzvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="234962751"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 23:17:14 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
Subject: [PATCH i-g-t v10 0/8] tests/xe: Add purgeable memory madvise tests
 for system allocator
Date: Tue, 14 Apr 2026 11:46:51 +0530
Message-ID: <20260414061703.2604112-1-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=yes
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

This series adds IGT tests for the purgeable memory madvise functionality
in the XE driver's system allocator path.

Purgeable memory allows userspace to mark buffer objects as DONTNEED,
making them eligible for kernel reclamation under memory pressure. This
is critical for mobile and memory-constrained platforms to prevent OOM
conditions while managing temporary or regeneratable GPU data.

The test suite validates:
- Basic purgeable lifecycle (WILLNEED -> DONTNEED -> PURGED)
- "Once purged, always purged" semantics (i915 compatibility)
- Per-VMA purgeable state tracking for shared buffers
- CPU fault handling on purged BOs (SIGBUS/SIGSEGV)
- GPU execution with purged memory and scratch page protection
- Proper state transitions across multiple VMs

Purgeable Memory States:-
 - **WILLNEED (0)**: Memory is actively needed, kernel should not
                     reclaim it.
 - **DONTNEED (1)**: Application doesn't need this memory right now,
                     kernel can reclaim it if needed

Retained Value
 When querying purgeable state, the kernel returns:
 - retained = 1: Memory is still present (not purged)
 - retained = 0: Memory was purged/reclaimed

Kernel dependency: https://patchwork.freedesktop.org/series/156651/
 
Test Cases :
  1. dontneed-before-mmap
        Purpose: Validate that mmap fails on dontneed BO

  2. purged-mmap-blocked
        Purpose: Validate that mmap fails on already-purged
      
  3. dontneed-after-mmap
        Purpose: Validate that accessing an existing mapping of purged memory
                 triggers SIGBUS/SIGSEGV.

  4. dontneed-before-exec
        Purpose: Validate GPU execution on purgeable BO (before it's used).

  5. dontneed-after-exec
        Purpose: Validate that previously-used BO can be purged and becomes
                 inaccessible.

  6. per-vma-tracking
        Purpose: Validate per-VMA purgeable state tracking

  7. per-vma-protection
        Purpose: Validate that WILLNEED VMA protects BO from purging during
                 GPU operations.
v2:
   - Move tests from xe_exec_system_allocator.c to dedicated
     xe_madvise.c (Thomas Hellström).
   - Fix trigger_memory_pressure to use scalable overpressure
    (25% of VRAM, minimum 64MB instead of fixed 64MB). (Pravalika)
   - Add MAP_FAILED check in trigger_memory_pressure.
   - Touch all pages in allocated chunks, not just first 4KB. (Pravalika)
   - Add 100ms sleep before freeing BOs to allow shrinker time
     to process memory pressure.  (Pravalika)
   - Rename 'bo2' to 'handle' for clarity in trigger_memory_pressure.(Pravalika)
   - Add NEEDS_VISIBLE_VRAM flag to purgeable_setup_simple_bo
     for consistent CPU mapping support on discrete GPUs.  (Pravalika)
   - Add proper NULL mmap handling in test_dontneed_before_mmap
      with cleanup and early return.  (Pravalika)

v3:
   - Added separate commits for each individual test case. (Pravalika)

v4:
   - Move unmap outside the block. (Pravalika)
   - Added proper resource cleanup before calling igt_skip(). (Nishit)
   - Added assertion for xe_bo_map. (Nishit)
   - Now using sync[0] consistently. (Nishit)
   - Added clarifying comment. (Nishit)

v5:
  - Document DONTNEED BO access blocking behavior to prevent undefined
    behavior and clarify uAPI contract (Thomas, Matt)
  - Add query flag DRM_XE_QUERY_CONFIG_FLAG_HAS_PURGING_SUPPORT for
    feature detection. (Jose)
  - For DONTNEED BO's mmap offset ioctl blocked with -EBUSY.
  - Rename retained to retained_ptr. (Jose)
  - Add new subtest purged-mmap-blocked.

v6:
  - Support iGPU in trigger_memory_pressure() by using total system RAM
    as pressure baseline; raise overpressure to 50% to force shrinker.
  - DONTNEED mmap blocking now enforced at mmap() time (xe_gem_object_mmap),
    not at DRM_IOCTL_XE_GEM_MMAP_OFFSET. Update dontneed-before-mmap and
    purged-mmap-blocked accordingly.
  - Fix graceful skip (instead of fail) in per-vma-tracking and
    per-vma-protection when purge cannot be induced. (Nishit)

v7:
  - Commit message updated with kernel UAPI details (Nishit)
  - Moved trigger_memory_pressure(), purgeable_mark_and_verify_purged()
    and sigtrap() in 4/9 and other patch. (Nishit)
  - Use xe_has_vram() instead of checking xe_visible_vram_size() > 0 for
    clearer dGPU/iGPU detection. (Nishit)
  - Fix purgeable_mark_and_verify_purged(): handle retained == 0 from
    DONTNEED (BO already purged) as success instead of incorrectly
    returning false. (Nishit)
  - Drop unused vm parameter from trigger_memory_pressure(). (Nishit)
  - Mentioned this new ioctl instead of __xe_vm_madvise(). (Nishit)

v8:
  - rebased. 
  - Drop this "[i-g-t,v7,1/9] drm-uapi/xe_drm: Sync with Add UAPI
    support for purgeable buffer objects" patch. (Kamil)

v9:
  - Added Reviewed-by tags. (Nishit)

v10:
  - iGPU: use igt_purge_vm_caches() to trigger shrinker directly
    instead of flooding system RAM (avoids OOM on low-memory machines).
  - Simplified comments in trigger_memory_pressure().

Arvind Yadav (8):
  lib/xe: Add purgeable memory ioctl support
  tests/intel/xe_madvise: Add dontneed-before-mmap subtest
  tests/intel/xe_madvise: Add purged-mmap-blocked subtest
  tests/intel/xe_madvise: Add dontneed-after-mmap subtest
  tests/intel/xe_madvise: Add dontneed-before-exec subtest
  tests/intel/xe_madvise: Add dontneed-after-exec subtest
  tests/intel/xe_madvise: Add per-vma-tracking subtest
  tests/intel/xe_madvise: Add per-vma-protection subtest

 lib/xe/xe_ioctl.c        |  33 ++
 lib/xe/xe_ioctl.h        |   2 +
 tests/intel/xe_madvise.c | 829 +++++++++++++++++++++++++++++++++++++++
 tests/meson.build        |   1 +
 4 files changed, 865 insertions(+)
 create mode 100644 tests/intel/xe_madvise.c

-- 
2.43.0

