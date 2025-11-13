Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A00FCD8C9D
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 16:28:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E023310E8C0;
	Thu, 13 Nov 2025 16:28:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mi6selHJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F8D10E8C3
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 16:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763051316; x=1794587316;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8MG5VKJBhrpTmS5U7lcqyDG6mjhazFsjp9IAbEc5XR0=;
 b=mi6selHJvyFVsNNYLRwbA6oWmOJEN88iAgdECE9TKuWfz8lO21vzPDoQ
 Ulf4DiKoO4TZM1R4M/w3sdrjO0R5TYh+8hLXU7+wdbBjva3h6pJw1kqbP
 nFLkMMXxNsIQZDA9FmxVkf1IHtV3Ozvg/1NdxzS6egUZQ6cE8Co+LoAsw
 aHlupuiQbenITMY3kEiZtO4bHm6xyK6/N/HHJuT3o6TAp36nrayqaNNc+
 HFpabfGqJZ0k6BBF+WHmHRGuOZIjOlwzLe6BTZYNWYCgeSgtmr/Nd3tGc
 Fu30agIuEdJu+mW7dCJzsQmtfe3x0NucHUcwgdPwNEoexBWQE0Rg5/2kQ g==;
X-CSE-ConnectionGUID: sE0s7CrWQyeiOOJqDFIksA==
X-CSE-MsgGUID: 19osFvBZRBi/lqDgtd39Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65074319"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65074319"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 08:28:36 -0800
X-CSE-ConnectionGUID: J34Z4OF+R76scx2yZK4XCA==
X-CSE-MsgGUID: thjIL/RQTQKoC9JQHX/lCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="193983988"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.40.39])
 by orviesa004.jf.intel.com with ESMTP; 13 Nov 2025 08:28:35 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH v7 00/10] Madvise feature in SVM for Multi-GPU configs 
Date: Thu, 13 Nov 2025 16:28:25 +0000
Message-ID: <20251113162834.633575-1-nishit.sharma@intel.com>
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

is patch series adds comprehensive SVM multi-GPU IGT test coverage for
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

