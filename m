Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A184ED1D89F
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 08:54:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF74510E8EC;
	Thu,  4 Dec 2025 08:54:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TH+AqScJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11AC510E068
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 08:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764838481; x=1796374481;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DiSe8UYZbIdWHhlHDN4ZsqDoHVAqAjSXyk0NicjQU4Q=;
 b=TH+AqScJfhDl93+6x6HZ5Di8wu5+9cc7rpH5lA9mcPoTgCVDlC+Mz3t4
 yVwki0oZI6oSYPE5hbUMH9TWzVQhJMdFTllAdgQhETHCAjcMZA/12XF+c
 rrVVxpHZMiES5xplxr3nwXN1q9iigvtwM/DgQzJavieaFz1NGYkW/G9YX
 waxCWOA9plG54MgLFoov6+MHFVPMW2dFej+n5ylJKkBkEW3vRlkfMC4DG
 mBbq5IAWmF/pT8QI0ge/4DI1Wzruc3M9PJ3GFC2iVod+DzaaRGYvWHZ77
 hf838eqO/RsTroFHOhDYoWXcVNh6aK8umY6Pnt3KdNwyCIvQHbyhSDF73 g==;
X-CSE-ConnectionGUID: WwpC89ESRiKG7tVIRjzAcg==
X-CSE-MsgGUID: BY5fCj54Se+8l2XvMuq6/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="70703087"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="70703087"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 00:54:32 -0800
X-CSE-ConnectionGUID: KxVXYNofTgC2M9votIQn7g==
X-CSE-MsgGUID: jHKXfqU3SiOfa9H3K+alDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="194744038"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.40.43])
 by orviesa009.jf.intel.com with ESMTP; 04 Dec 2025 00:54:32 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	thomas.hellstrom@intel.com
Subject: [PATCH v12 00/10] Madvise feature in SVM for Multi-GPU configs
Date: Thu,  4 Dec 2025 08:54:21 +0000
Message-ID: <20251204085432.35023-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
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

From: Nishit Sharma <nishit.sharma@intel.com>

This patch series adds comprehensive SVM multi-GPU IGT test coverage for
madvise and prefetch functionality.

ver2:
- Test name changed in commits
- In patchwork v1 patch is missing due to last patch was not sent

ver3:
- In patch-7 tags were added and it was not sent on patchwork

ver4:
- In patch file was added which is not available in source which caused
  CI build failure.

ver5:
- Added subtest function wrappers
- Subtests executing for all GPUs enumerated

ver7:
- Optimized function calling which are frequenctly called
- Incorporated review comments (Thomas Hellstrom)

ver8:
- Incorporated review comments (Thomas Hellstrom)
- Seperated madvise and lr_sync patches
- merged added 0 as instance parameter in xe_vm_madvise() call in
  xe_exec_system_allocator with xe_vm_madvise lib changes
- Subtests declared in const struct section[] and optimized
- All subtests executed with and without prefetch

ver9:
- Incorporated review comments (Pravalika, Thomas)
- Optimized code. Multiple same function called put in single function
- Added READ_ONCE/WRITE_once instead dereferecing.

ver10:
- Incorporated review comments (Thomas)

ver11:
- Incorporated review comments (Thomas)
- For conflict madvise case instead assertion added conditon

ver12:
- Incorporated review comments (Thomas)

Nishit Sharma (10):
  DONT_MERGE: lib/xe: Add instance parameter to xe_vm_madvise
  lib/xe: Add synchronous helpers for VM bind/unbind operations
  tests/intel/xe_multigpu_svm: Add SVM multi-GPU xGPU memory access test
  tests/intel/xe_multigpu_svm: Add SVM multi-GPU atomic operations
  tests/intel/xe_multigpu_svm: Add SVM multi-GPU coherency test
  tests/intel/xe_multigpu_svm: Add SVM multi-GPU performance test
  tests/intel/xe_multigpu_svm: Add SVM multi-GPU fault handling test
  tests/intel/xe_multigpu_svm: Add SVM multi-GPU simultaneous access
    test
  tests/intel/xe_multigpu_svm: Add SVM multi-GPU conflicting madvise
    test
  tests/intel/xe_multigpu_svm: Add SVM multi-GPU migration test

 include/drm-uapi/xe_drm.h              |    4 +-
 lib/xe/xe_ioctl.c                      |   52 +-
 lib/xe/xe_ioctl.h                      |    9 +-
 tests/intel/xe_exec_system_allocator.c |    8 +-
 tests/intel/xe_multigpu_svm.c          | 1544 ++++++++++++++++++++++++
 tests/meson.build                      |    3 +-
 6 files changed, 1607 insertions(+), 13 deletions(-)
 create mode 100644 tests/intel/xe_multigpu_svm.c

-- 
2.48.1

