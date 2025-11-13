Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1252CD8CAC
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 17:15:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A7F10E10B;
	Thu, 13 Nov 2025 17:15:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lpys8HFE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A495010E10B
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 17:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763054151; x=1794590151;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=61/Eo0F8WGm36C8uefiGy1qvCGj9iqdJ4BhUckr7Jkw=;
 b=lpys8HFE20/6F91oMdWzj3/FP/lnPZnYa5kKTBs3BodqO0tEEC/QxyZ1
 bb758uFtZg0WhuN1q3J9gOXZOzpR72KUlYJNqysjpyPjEMvYmSiEB7RQ7
 QrrxMlSvc9jHOJXk39MEyYea0/1Xmo51WdmFH3cd7QbUfih0BvpWrtZ+W
 bdJvKmORBedEU2NrekkqxUuQgVae+epp/j04M0om3/7aZ6peIWKs791MA
 9Hkfd9sHfdRUUxExCDGV4wLbz80mdBhoRlV9jcO/tD2UC5M4Aw81ExBDL
 7MDyHoCbpaY37SZK9KyKR7VrIYcDR7kQwpvhTDTD+oJtVdIvAMMuHK04T w==;
X-CSE-ConnectionGUID: v9bnU4QcRWucl4XdjKC4jw==
X-CSE-MsgGUID: y22Z90ngToaG17bGuaRhTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="68993113"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="68993113"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 09:15:50 -0800
X-CSE-ConnectionGUID: rqzL9PuTT+mV0znhMqxcvA==
X-CSE-MsgGUID: kWeEmX67Q2Kp2+Y4NFaDEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="189817698"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.40.39])
 by fmviesa008.fm.intel.com with ESMTP; 13 Nov 2025 09:15:50 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v7 00/10] Madvise feature in SVM for Multi-GPU configs
Date: Thu, 13 Nov 2025 17:15:40 +0000
Message-ID: <20251113171549.635766-1-nishit.sharma@intel.com>
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

