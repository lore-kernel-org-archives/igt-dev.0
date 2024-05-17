Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51972C04FFE
	for <igt-dev@archiver.kernel.org>; Fri, 17 May 2024 11:46:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB0D10EE82;
	Fri, 17 May 2024 11:46:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fxFIuGw6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A8910EE82
 for <igt-dev@lists.freedesktop.org>; Fri, 17 May 2024 11:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715946390; x=1747482390;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WlFuSJAfKtEKxiAJbbqJ18/b7kZAoh2XewzOEvxx2U8=;
 b=fxFIuGw6UFK0UKQErOoFBxpYRuG8za7CNFaJN9YxAuI3M8mViIlWuVL0
 lIssCxolvzJE+zR7IQ5tn1jwVBueMhWSkoaDhdZzvJe+dBtT9ciovvk66
 Xi4vcYSqVF3PJsGh2kcAs7d9oWxVuA7e6hUe9alchaeuuHoDP2WWYZDbA
 CbcJLMSrM3+IInjmjce84kNvJFgsUeqxYBk4JE+EeHu+5RjfLE12DSGPk
 REwBNLRmIwy03j1BlPIz2VtYy3mRGCngNLVjDWdFDL9h/dZc7j4hpyvXT
 SdOnXtDcFbPOkBybPoKwMBPxMWvZ9shJeO/vQP1NepStOeockJ1P23xu3 Q==;
X-CSE-ConnectionGUID: s01TAwv+R/mDRxkdKvelwQ==
X-CSE-MsgGUID: xsJY2BKRTX+1UmGgdBo22Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="29619976"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="29619976"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 04:46:29 -0700
X-CSE-ConnectionGUID: rbNkkQcaQBmX/j2veRJ26A==
X-CSE-MsgGUID: xwSCUjzwSlytV4EYvfYF2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="54977267"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by fmviesa002.fm.intel.com with ESMTP; 17 May 2024 04:46:28 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Subject: [PATCH i-g-t v3 00/10] tests/intel/xe_svm: Add tests for Shared
 Virtual Memory (SVM)
Date: Fri, 17 May 2024 17:16:48 +0530
Message-Id: <20240517114658.810283-1-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.25.1
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

Introduce helper functions for object creation, binding, submission,
and destruction, applicable for SVM and other tests

xe-basic test is validating the helper function introduced in 'lib/xe/xe_util: helper function'

svm test cases:
svm-basic-malloc
svm-basic-mmap
svm-random-access
svm-huge-page
svm-atomic-access
svm-atomic-access
svm_invalid_va
svm-mprotect
svm-benchmark
svm-sparse-access

svm kernel implimentation:
https://gitlab.freedesktop.org/oak/xe-kernel-driver-svm.git
branch: origin/drm-xe-next-svm-unify-userptr

v2 igt patch: https://patchwork.freedesktop.org/series/133096/

Note: xe-basic test is validated without SVM. Remaining tests are not validated because the SVM driver code is still under development

Bommu Krishnaiah (10):
  lib/xe/xe_util: Introduce helper functions for buffer creation and
    command submission etc
  tests/intel/xe_svm: basic xe-basic test
  tests/intel/xe_svm: Add SVM basic tests using malloc and mmap
  tests/intel/xe_svm: add random access test for SVM
  tests/intel/xe_svm: add huge page access test for SVM
  tests/intel/xe_svm: Add support for GPU atomic access test for svm
  tests/intel/xe_svm: Add svm-invalid-va test to verify SVM
    functionality with invalid address access
  tests/intel/xe_svm: Add svm-benchmark test to measure SVM performance
    with a simple benchmark
  tests/intel/xe_svm: Add svm-mprotect test to verify SVM functionality
    with read-only memory access
  tests/intel/xe_svm: Add svm-sparse-access test to verify sparsely
    accessing two memory locations with SVM

 include/drm-uapi/xe_drm.h |   1 +
 lib/xe/xe_util.c          | 214 +++++++++++++++++
 lib/xe/xe_util.h          |  40 ++++
 tests/intel/xe_svm.c      | 476 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |   1 +
 5 files changed, 732 insertions(+)
 create mode 100644 tests/intel/xe_svm.c

-- 
2.25.1

