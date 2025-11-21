Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CB1CFC295
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 16:25:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C1510E8E3;
	Fri, 21 Nov 2025 16:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GmOjUW9J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D3CC10E662
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 16:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763742338; x=1795278338;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1WxkllM6QBmGJFnpf1PPTwEDwkHAhu8q5cqcXFHaQYo=;
 b=GmOjUW9J0xlvn9324AaRgbtZRBYCNm6xJSCb7IMyzzZZOyvYPiwsX9UJ
 ljXIITrp9Ep8NxS7+jAc7VHWmtg3r6aIwSkZ/EXseDbcN3bXtM8sEvUEg
 kR4uOwdqh3xYEuZFR4DrMzPVvAoIDV0/ZuOaVE0GcBPkd8zpKc6hGr9OU
 vDii//dX2RkHUihrZqYQP1RmsOh92ewVt/w0NvwDl1RspNwbMSH6P/iT7
 8nWwPkAwc0vVNTES+bGsRTn18uqmJ6q48AgdNFx1H5OBkBIPmp2f5j1QF
 DOtM+KzOWAXGTptPXIJIzamyaJzZiZRdmBNiLnXnIgkCgCDEOPr6Yyv49 w==;
X-CSE-ConnectionGUID: YxRCpCy+RQSr6X5TGiinhQ==
X-CSE-MsgGUID: n0nySuLgR6+Fk8yiIaVVKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65029743"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="65029743"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 08:25:38 -0800
X-CSE-ConnectionGUID: luv2AX7cRj68b/E21ug3KQ==
X-CSE-MsgGUID: O3Ot89JjQ3ywj5gMIdYsrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="215096168"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..)
 ([10.1.40.114])
 by fmviesa002.fm.intel.com with ESMTP; 21 Nov 2025 08:25:38 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 thomas.hellstrom@intel.com
Subject: [PATCH i-g-t v8 00/10] Madvise feature in SVM for Multi-GPU configs
Date: Fri, 21 Nov 2025 16:25:27 +0000
Message-ID: <20251121162537.77551-1-nishit.sharma@intel.com>
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

Nishit Sharma (10):
  lib/xe: Add instance parameter to xe_vm_madvise
  lib/xe: Add synchronous helpers for VM bind/unbind operations
  tests/intel/xe_multi_gpusvm: Add SVM multi-GPU xGPU memory access test
  tests/intel/xe_multi_gpusvm: Add SVM multi-GPU atomic operations
  tests/intel/xe_multi_gpusvm: Add SVM multi-GPU coherency test
  tests/intel/xe_multi_gpusvm: Add SVM multi-GPU performance test
  tests/intel/xe_multi_gpusvm: Add SVM multi-GPU fault handling test
  tests/intel/xe_multi_gpusvm: Add SVM multi-GPU simultaneous access
    test
  tests/intel/xe_multi_gpusvm: Add SVM multi-GPU conflicting madvise
    test
  tests/intel/xe_multi-gpusvm: Add SVM multi-GPU migration test

 include/drm-uapi/xe_drm.h              |    4 +-
 lib/xe/xe_ioctl.c                      |   53 +-
 lib/xe/xe_ioctl.h                      |   11 +-
 tests/intel/xe_exec_system_allocator.c |    8 +-
 tests/intel/xe_multi_gpusvm.c          | 1616 ++++++++++++++++++++++++
 tests/meson.build                      |    1 +
 6 files changed, 1679 insertions(+), 14 deletions(-)
 create mode 100644 tests/intel/xe_multi_gpusvm.c

-- 
2.48.1

