Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95761D1D862
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 05:10:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B99110E00D;
	Thu,  4 Dec 2025 05:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y2CG9PU3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F326010E00D
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 05:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764825052; x=1796361052;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UmhKwekESsJaE3J6GIqI85Bq+E4Zcy7Oj/nkOJ8JfoE=;
 b=Y2CG9PU3j6LpUZl026XuyZMLqRIqe5PbcORmG+n6JBiyqmxeELtXnG6e
 lAoLwfTwhewm5/pCE9Hco73unaBSRoXFgWC9916pk+Sg7qoe9aahdqf2A
 xcI+r/hzrZuHEAlPNE9vXFUgtawP9P9N4v0Y3Pf4MDCF/Wy6OGx7K2XIR
 Rgm4G8XpQtttDfby2Ei1mTHYuPwhIKEGCA2L6UEJtvb1i9z1O+GpncFeL
 nDX9ENN+NTpCfc8971GWIhMSZenbSIaDgfer7NmBwhU49mUEXvkwXXYil
 daKSvsFHuEAJtD3ulwyx6ejCeee1uL4G4HvUhOIHV2aMhWdu4fhiKXhR8 g==;
X-CSE-ConnectionGUID: 6FZg/1awT6OdBrA+WKyngg==
X-CSE-MsgGUID: WKiuWVNUSxqw4NznjeV9Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="92314032"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="92314032"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 21:10:52 -0800
X-CSE-ConnectionGUID: 14PunDSSTF6r/yWhP6Z/5Q==
X-CSE-MsgGUID: n3lYnIi1RVGbH9gA7+/8ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="195678335"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.40.43])
 by fmviesa010.fm.intel.com with ESMTP; 03 Dec 2025 21:10:51 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 thomas.hellstrom@intel.com
Subject: [PATCH v11 00/10] Madvise feature in SVM for Multi-GPU configs
Date: Thu,  4 Dec 2025 05:10:41 +0000
Message-ID: <20251204051051.27495-1-nishit.sharma@intel.com>
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

his patch series adds comprehensive SVM multi-GPU IGT test coverage for
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
 tests/intel/xe_multigpu_svm.c          | 1555 ++++++++++++++++++++++++
 tests/meson.build                      |    3 +-
 6 files changed, 1618 insertions(+), 13 deletions(-)
 create mode 100644 tests/intel/xe_multigpu_svm.c

-- 
2.48.1

