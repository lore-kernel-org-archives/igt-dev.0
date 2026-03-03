Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 147D7EDA680
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 15:29:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA53D10E830;
	Tue,  3 Mar 2026 15:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NufMJM0K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB9BC10E072
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 15:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772551761; x=1804087761;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uJKA5vbVNridYz8ldMVQS1kvij4hXxbuNOHYRzgpogs=;
 b=NufMJM0KU74n8SziSFGnibQMustBQzwylRo+1xA0Pk6GtkkjpZNFQh/C
 RkUbuREBaS6o1BDIKwrKbERQwJES/yVwRDfVgAi6Tp6plFaAhKC0361MP
 mftNW4cUmTNho4tRlnim3Y9tz3dylgpQqE/dSg8teO4Enc3jmR2k2Keo9
 TvTlJ+ewkmuAkRY6aQr7ts2aPW4c4lvKFHMa9LEeEacq3iM0Aniqe9K4L
 a9tG0vbxBHTEOPJJCkSTHmCf0cbvyx54rzXXmbQISg7g1wcJHPqccqeOT
 HKZlmw0BBY1WXoO43mEyaacNjcgWB/OyXI6dGFkMFNgB78Z/QDrSinOke A==;
X-CSE-ConnectionGUID: 5tovjdBSQnar6zyx+8JUnw==
X-CSE-MsgGUID: 1m9qFBUFTvifj8DHZnbC6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="76193132"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="76193132"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 07:29:20 -0800
X-CSE-ConnectionGUID: 3F0G1AilQ2Gt9eYOnth51g==
X-CSE-MsgGUID: EsCpXi6cReawoeNkj3945w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="215098674"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 07:29:17 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
Subject: [PATCH i-g-t v5 0/9] tests/xe: Add purgeable memory madvise tests for
 system allocator
Date: Tue,  3 Mar 2026 20:58:53 +0530
Message-ID: <20260303152909.3503461-1-arvind.yadav@intel.com>
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

Arvind Yadav (8):
  lib/xe: Add purgeable memory ioctl support
  tests/intel/xe_madvise: Add dontneed-before-mmap subtest
  tests/intel/xe_madvise: Add purged-mmap-blocked subtest
  tests/intel/xe_madvise: Add dontneed-after-mmap subtest
  tests/intel/xe_madvise: Add dontneed-before-exec subtest
  tests/intel/xe_madvise: Add dontneed-after-exec subtest
  tests/intel/xe_madvise: Add per-vma-tracking subtest
  tests/intel/xe_madvise: Add per-vma-protection subtest

Himal Prasad Ghimiray (1):
  drm-uapi/xe_drm: Add UAPI support for purgeable buffer objects

 include/drm-uapi/xe_drm.h |  60 +++
 lib/xe/xe_ioctl.c         |  33 ++
 lib/xe/xe_ioctl.h         |   2 +
 tests/intel/xe_madvise.c  | 797 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |   1 +
 5 files changed, 893 insertions(+)
 create mode 100644 tests/intel/xe_madvise.c

-- 
2.43.0

