Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33F8E83848
	for <igt-dev@archiver.kernel.org>; Tue, 17 Feb 2026 02:35:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E5C110E1CC;
	Tue, 17 Feb 2026 02:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T9d9lu4K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8EC10E15A
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Feb 2026 02:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771295747; x=1802831747;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7Bo5zqarZBDXr4218yfxTZzEm1fCkgd2a/ZLje42ZTc=;
 b=T9d9lu4KF7lNZS128tb/0IU2kxzD7DcI8wyv7CNFQ/QUzQEEEfaylvkq
 YaDwZnrWTJ86Bi7a1GgTN9eFG19sYM7XDLafQFRbhTUeiYeeO24dfDQDL
 UVE3rH39I5N6Yz34HYzmq4dzlFykGx6twP9Ep7rm5ooPdoceoVr9ez9qk
 XBic5vDeM7DIjkrG6SOcWBtziWx0GreMqSQ9lXqhKPkUsrf2DH9no8anZ
 KmqGLpssOsQI3DG5B1EBerPP1rVaR87ZUcgR52KEx3wBXDe7wjdL47TWd
 v+2I8GuigwnyMRYTqy6TlC+knGnCHUiuiRBNJYaAdRgzT7AW/c6GbwEIl w==;
X-CSE-ConnectionGUID: MPDRraQ6Qn+Zx72CYqhpiQ==
X-CSE-MsgGUID: 2FGZZG+FS6OvBoLm0wed6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72358373"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; d="scan'208";a="72358373"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 18:35:46 -0800
X-CSE-ConnectionGUID: FN9p2tZFT02ZG2SwNwMgmA==
X-CSE-MsgGUID: BAo0d+IkSvKHvPp/rFnFwQ==
X-ExtLoop1: 1
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 18:34:32 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
Subject: [PATCH i-g-t v3 0/8] tests/xe: Add purgeable memory madvise tests for
 system allocator
Date: Tue, 17 Feb 2026 08:04:11 +0530
Message-ID: <20260217023423.2632617-1-arvind.yadav@intel.com>
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
  1. madvise-purgeable-dontneed-before-mmap
  	Purpose: Validate that mmap fails on already-purged BO

  2. madvise-purgeable-dontneed-after-mmap
	Purpose: Validate that accessing an existing mapping of purged memory
	         triggers SIGBUS/SIGSEGV.

  3. madvise-purgeable-dontneed-before-exec
	Purpose: Validate GPU execution on purgeable BO (before it's used).

  4. madvise-purgeable-dontneed-after-exec
	Purpose: Validate that previously-used BO can be purged and becomes
                 inaccessible.

  5. madvise-purgeable-per-vma-tracking
	Purpose: Validate per-VMA purgeable state tracking

  6. madvise-purgeable-per-vma-protection
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

Arvind Yadav (7):
  lib/xe: Add purgeable memory ioctl support
  tests/intel/xe_madvise: Add dontneed-before-mmap subtest
  tests/intel/xe_madvise: Add dontneed-after-mmap subtest
  tests/intel/xe_madvise: Add dontneed-before-exec subtest
  tests/intel/xe_madvise: Add dontneed-after-exec subtest
  tests/intel/xe_madvise: Add per-vma-tracking subtest
  tests/intel/xe_madvise: Add per-vma-protection subtest

Himal Prasad Ghimiray (1):
  drm-uapi/xe_drm: Add UAPI support for purgeable buffer objects

 include/drm-uapi/xe_drm.h |  44 +++
 lib/xe/xe_ioctl.c         |  33 ++
 lib/xe/xe_ioctl.h         |   2 +
 tests/intel/xe_madvise.c  | 731 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |   1 +
 5 files changed, 811 insertions(+)
 create mode 100644 tests/intel/xe_madvise.c

-- 
2.43.0

