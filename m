Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304FFCD8CA4
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 16:33:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 747C010E8D2;
	Thu, 13 Nov 2025 16:33:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UQ74TLIJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B879610E8C0
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 16:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763051592; x=1794587592;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l2QHOnFebk7H0SBPnqRlcaNbcDZs7XgckHnoPsGdJYM=;
 b=UQ74TLIJKZrPNWjuPXvahtJjmq3g/1vzsCxt31/mNG4cbUnP7MIr0LvD
 sr+gQ8PYFpAEHe/eVxWRiDmla82eEDh5q4qfQxphkOpum2hf+K+yf4K8X
 FpyosSIzflb4Y5TF3OZl3pj61VgMadKGHKwQCT/r8SeWYLFb76rSbFALi
 1YW3YSKHurnmzpVLhD8P+PnfkqKtekZxno1MOKQVF6zndvSH99SJN1oy7
 7K1km9ugXkh7E67arjnI7D3sP06xekIAiZQlwmL8iCLWRIn2HzM1SoZZy
 bkOMQvxp4/OaUY25xbh4yZn2deox2attmfw2clQorCk3KJuYuq7tcvRyh A==;
X-CSE-ConnectionGUID: B31ZRS2zRF+7B7y7Q8BgaA==
X-CSE-MsgGUID: d65eQ9VKQbKnSaSI61miwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="76482250"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="76482250"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 08:33:11 -0800
X-CSE-ConnectionGUID: nvCJLFDfRR6ePVBKtjUVdA==
X-CSE-MsgGUID: BYAydq9vS1q/5dOaoTafUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="194533894"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.40.39])
 by fmviesa004.fm.intel.com with ESMTP; 13 Nov 2025 08:33:08 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v7 00/10] Madvise feature in SVM for Multi-GPU configs
Date: Thu, 13 Nov 2025 16:32:59 +0000
Message-ID: <20251113163308.633818-1-nishit.sharma@intel.com>
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

Tis patch series adds comprehensive SVM multi-GPU IGT test coverage for
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
  tests/intel/xe_multi_gpusvm.c: Add SVM multi-GPU atomic operations
  tests/intel/xe_multi_gpusvm.c: Add SVM multi-GPU coherency test
  tests/intel/xe_multi_gpusvm.c: Add SVM multi-GPU performance test
  tests/intel/xe_multi_gpusvm.c: Add SVM multi-GPU fault handling test
  tests/intel/xe_multi_gpusvm.c: Add SVM multi-GPU simultaneous access
    test
  tests/intel/xe_multi_gpusvm.c: Add SVM multi-GPU conflicting madvise
    test
  tests/intel/xe_multi-gpusvm.c: Add SVM multi-GPU migration test

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

