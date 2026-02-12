Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000A7EB48EC
	for <igt-dev@archiver.kernel.org>; Thu, 12 Feb 2026 09:09:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A674410E6FF;
	Thu, 12 Feb 2026 09:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q6nr62T/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2276410E143
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Feb 2026 09:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770887377; x=1802423377;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WBND5bWbMPWtekFoWGepRIYNEFvtpNmjKPzBzYMGvpc=;
 b=Q6nr62T/6Wb/VlkSLErRuTeWl4WSqDTtZ1YxpBD47q4RaE3mJnIq5raY
 A/XXjg2aOngN+TjshGqzwt2bu2c/5tChkJFuHJBMANE1SzFkfQaFtmjSl
 3p6JcOOCnHWjhHB9wD5GQdHpoBHt+uEBtK42GteeVGLiuniGLlAFUsitM
 EptVEiV9jV0n4YIwX8ZzEiVKgyEZHoKQps+KK13kby1/YgDuqFEL2IBhz
 c1DZfbNrE2Hu9zpnQ3MAvCU7N23WFCSYkRaSYv9Fxj8PyaOEEQfAQAG57
 2y8ugag2rIdpNg/2cPxCQpBVmByadm8DFaEqtbyiTMM6gtC0Bh1FW9Yae w==;
X-CSE-ConnectionGUID: Fn/516EyQ7GNe7/3sH9FZw==
X-CSE-MsgGUID: 4dB7nUYERp2wpwpEbMDfMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="74653244"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="74653244"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 01:09:36 -0800
X-CSE-ConnectionGUID: LNC3sk7+Rwa+pDyN7Mgdeg==
X-CSE-MsgGUID: 7sGi6SGhT4SMjYMW2yObVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="212636868"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 01:09:34 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
Subject: [PATCH i-g-t v2 0/3] tests/xe: Add purgeable memory madvise tests for
 system allocator
Date: Thu, 12 Feb 2026 14:39:14 +0530
Message-ID: <20260212090921.2079711-1-arvind.yadav@intel.com>
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

Arvind Yadav (2):
  lib/xe: Add purgeable memory ioctl support
  tests/intel/xe_madvise: Add purgeable BO madvise tests

Himal Prasad Ghimiray (1):
  drm-uapi/xe_drm: Add UAPI support for purgeable buffer objects

 include/drm-uapi/xe_drm.h |  44 +++
 lib/xe/xe_ioctl.c         |  33 ++
 lib/xe/xe_ioctl.h         |   2 +
 tests/intel/xe_madvise.c  | 747 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |   1 +
 5 files changed, 827 insertions(+)
 create mode 100644 tests/intel/xe_madvise.c

-- 
2.43.0

