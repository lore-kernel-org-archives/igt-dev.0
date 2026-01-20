Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74051D2ECF7
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 06:11:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2762F10E074;
	Tue, 20 Jan 2026 06:11:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dKWiokgX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB85310E074
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 06:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768889517; x=1800425517;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yi03dGdJiVqIs6K5kDTcxvQDBXZnffs4++T1geLDfVY=;
 b=dKWiokgXlHPwkLk5VMsHFgd2sMYXMHD4LBpVQ5tsEjsizjBSpIfMyX7b
 A/X7MSMAaXEJpfoALzw46+u/IPOSPOd96GbJPJWaDAiPy9WzT/ijV8GoO
 3leIK8Tgg+RHlUhh9emYGLp+oITd7HZeukp1jZEB/twR7G7M9quolz3jM
 dr37RN2iWQgGXVxyKTR2Aa4pNX/vFDyYn/Kj/4yqoCodLAWZYWsD8/UId
 46C5hQbSHwyNaE1nYgycq0rcDx/iBtIGVAvPTr+qt6O4cIsDpZIpAmxD3
 TAcuYfERloNNODn3/f26bLoocwsSP3XB9DOdjVK/WDELDawvsMpry1Cks w==;
X-CSE-ConnectionGUID: lD+YgzJlTK6yk/EPo8ytfQ==
X-CSE-MsgGUID: m3sT5uzbSOuzRkzc+qh+Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="80810781"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="80810781"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 22:11:57 -0800
X-CSE-ConnectionGUID: GDadcOQCR+m8H6fTqFGHIg==
X-CSE-MsgGUID: JvMV8e1XTAaOzUMCqVmSzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="206083102"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 22:11:54 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
Subject: [PATCH i-g-t 0/3] tests/xe: Add purgeable memory madvise tests for
 system allocator
Date: Tue, 20 Jan 2026 11:41:38 +0530
Message-ID: <20260120061141.3139060-1-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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
 - **WILLNEED (0)**: Memory is actively needed, kernel should not reclaim it.
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
	Purpose: Validate that accessing an existing mapping of purged memory triggers SIGBUS/SIGSEGV

  3. madvise-purgeable-dontneed-before-exec
	Purpose: Validate GPU execution on purgeable BO (before it's used)

  4. madvise-purgeable-dontneed-after-exec
	Purpose: Validate that previously-used BO can be purged and becomes inaccessible

  5. madvise-purgeable-per-vma-tracking
	Purpose: Validate per-VMA purgeable state tracking

  6. madvise-purgeable-per-vma-protection
	Purpose: Validate that WILLNEED VMA protects BO from purging during GPU operations

Arvind Yadav (2):
  lib/xe: Add purgeable memory ioctl support
  tests/intel/xe_exec_system_allocator: Add purgeable memory madvise
    tests

Himal Prasad Ghimiray (1):
  drm-uapi/xe_drm: Add UAPI support for purgeable buffer objects

 include/drm-uapi/xe_drm.h              |  37 ++
 lib/xe/xe_ioctl.c                      |  33 ++
 lib/xe/xe_ioctl.h                      |   2 +
 tests/intel/xe_exec_system_allocator.c | 638 +++++++++++++++++++++++++
 4 files changed, 710 insertions(+)

-- 
2.43.0

