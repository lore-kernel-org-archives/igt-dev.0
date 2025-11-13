Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806DACD8CAC
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 17:04:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA4D10E907;
	Thu, 13 Nov 2025 17:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KOmS1wx3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E7910E906
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 17:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763053497; x=1794589497;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=61/Eo0F8WGm36C8uefiGy1qvCGj9iqdJ4BhUckr7Jkw=;
 b=KOmS1wx3XCaO46338hB8RL5EI1i20jCWz4M0Zwo+6TfvdaDMiKJjtb/D
 0dbMtVdIq82Zr7s2MjC7qEfOlrdtYTqvKafSuTH9t3rUmpACH1HAtC36Q
 ai/l9AVA9ZCFwVRgsNGRpEpflKE7K+7hXTW4t1Q2E0NT99DWMv9Ka6uOS
 qY/+mYbZeych0hikfcpLlJW32pZn/KJpjB9eLuMViWT4BKn8AP2Maw9BB
 niw7bnE3YBl+fX55wp8G+YOGqCcBxhxsgCnALYdujhr3C108yjIHrdjLB
 FNjBQdzNEFWkf53SVmL5Xqr3w5W0S9l1mYZbrnLPqSnp49yKM8nFq1NOv g==;
X-CSE-ConnectionGUID: LJ44+/4kSKOkEZTYL5XGGQ==
X-CSE-MsgGUID: RMdAlOSWTlahiWsGRxgqnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="76243680"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="76243680"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 09:04:56 -0800
X-CSE-ConnectionGUID: J0cAIrhmQESc0d4zfHgXDg==
X-CSE-MsgGUID: HiRpNHIeSUC5W4xBB0vwzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="193808103"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.40.39])
 by fmviesa005.fm.intel.com with ESMTP; 13 Nov 2025 09:04:55 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	nishit.sharma@intel.com
Subject: [PATCH i-g-t v7 00/10] Add SVM madvise feature for multi-GPU
 configurations
Date: Thu, 13 Nov 2025 17:04:47 +0000
Message-ID: <20251113170456.635343-1-nishit.sharma@intel.com>
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


Nishit Sharma (10):
  lib/xe: Add instance parameter to xe_vm_madvise and introduce lr_sync
    helpers
  tests/intel/xe_exec_system_allocator: Add parameter in madvise call
  tests/intel/xe_multi_gpusvm: Add SVM multi-GPU cross-GPU memory access
    test
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
 tests/intel/xe_multi_gpusvm.c          | 1441 ++++++++++++++++++++++++
 tests/meson.build                      |    1 +
 6 files changed, 1504 insertions(+), 14 deletions(-)
 create mode 100644 tests/intel/xe_multi_gpusvm.c

-- 
2.48.1

