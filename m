Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DC5D11700
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 15:59:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEEC510E67C;
	Tue,  2 Dec 2025 15:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JuFiziVi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60CB810E677
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 15:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764691192; x=1796227192;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CcCrwY3nCAgZMe3LIfnvpVFKZZBhSKb9X2r4cdH7MaM=;
 b=JuFiziVibONC2W6BqpbRBzY1kES+iuiN8VstSmqfItxdDk2BtVok21Wi
 U/ejXoqm51x5sxeHWNwc6v3w6QahD5GdwiZYCX29SJ4BYE3JIP6+ZtgR8
 vj8CJP1NDvilFjx6VR0eoUTToTV7EFrpQsUOHmMsBMg4os97jo8A7JVL9
 fMWCe+8jJrSbHoc2rIAEuV3QN4AJA/a1z9balhEG7WaRl7/Is9BOraXfU
 0vpXxZX/E4VXgUhh1PLrG2TzC5rCPzr+UUJaMixI8nXoo27F8BzZlzWBf
 iHann0EG4T5+9rvggiYqAWCB64IqeFLxayR4NB7M75Fv5kOtrKaiytT84 A==;
X-CSE-ConnectionGUID: tRTEZfzsQ0CnVwrylW4Vjg==
X-CSE-MsgGUID: ZsaMWBRfT4Wgsqf20QWS5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="84059528"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="84059528"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 07:59:52 -0800
X-CSE-ConnectionGUID: dXEntMaJQrqq8a6BljsOFw==
X-CSE-MsgGUID: mh9ZeBTGT9q/kgHvd2Ktlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="198600765"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.40.43])
 by orviesa003.jf.intel.com with ESMTP; 02 Dec 2025 07:59:51 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	thomas.hellstrom@intel.com
Subject: [PATCH v10 00/10] Madvise feature in SVM for Multi-GPU configs
Date: Tue,  2 Dec 2025 15:59:41 +0000
Message-ID: <20251202155951.21369-1-nishit.sharma@intel.com>
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
 tests/intel/xe_multigpu_svm.c          | 1597 ++++++++++++++++++++++++
 tests/meson.build                      |    3 +-
 6 files changed, 1660 insertions(+), 13 deletions(-)
 create mode 100644 tests/intel/xe_multigpu_svm.c

-- 
2.48.1

