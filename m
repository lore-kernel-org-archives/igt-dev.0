Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C2ECD8CAC
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 17:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC8710E8DF;
	Thu, 13 Nov 2025 17:10:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gw1a+l79";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5993210E8DF
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 17:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763053802; x=1794589802;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=61/Eo0F8WGm36C8uefiGy1qvCGj9iqdJ4BhUckr7Jkw=;
 b=gw1a+l79aUshNSUAD6UrBmcHGdr0qCPCxKS2NNRX3eZxyLeYeVv6etXy
 iJTrcxv7+FRPZ2whUfXekLSgcroIo1VcRCwLYlQtW7VDvBmeiDGyQ1iPH
 tf01rjSrnsccSXR2DOs0GY8GroZPMJ3KO0pgVKatfscBPCAjSf7DUvUvR
 nJs96hMwfe+059LKX6b+VnYYdPoe8T16Mvgcis6C6CpItYP//idXnKpv7
 03EmcoYgnzL1LNW0DzKs/cBingBSCX+AwJ9lRtKIsA2vw0K1Gp/egcDr4
 Gjd9IZhfhpavEaoBXZ96NfDgObKA9whxVtA7gLHddxm2z0HF2vJot0Fno Q==;
X-CSE-ConnectionGUID: a2ZVsqI4RmeJAAja8/1Mgw==
X-CSE-MsgGUID: HI9hytd2QgyvTk1evChGbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64850223"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="64850223"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 09:10:02 -0800
X-CSE-ConnectionGUID: 5Yfj9/iDQHSfobZBJLWSJQ==
X-CSE-MsgGUID: Gqn5PCopRtKsC+LQtUhsew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="189394586"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.40.39])
 by fmviesa006.fm.intel.com with ESMTP; 13 Nov 2025 09:10:01 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	nishit.sharma@intel.com
Subject: [PATCH i-g-t v7 00/10] SVM madvise feature in multi-GPU config
Date: Thu, 13 Nov 2025 17:09:52 +0000
Message-ID: <20251113171001.635563-1-nishit.sharma@intel.com>
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

