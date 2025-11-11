Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13ABCCFA18
	for <igt-dev@archiver.kernel.org>; Tue, 11 Nov 2025 16:35:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76EB010E610;
	Tue, 11 Nov 2025 16:35:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j1LPgy9O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C2B10E037
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Nov 2025 16:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762878898; x=1794414898;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Or19JhsTDeTa4RdWLyggYn/EFtpsJ0P57RBpCGSgtYU=;
 b=j1LPgy9OvS9OS1KkQ6Xlf0G7EGhV+BUanQ7DtskhlsdU0uNOemJO65K0
 qh6GAv0ufNI8spj7PzWxDBPX94+ek9wAlC9MnN5eKTBvR6hn/xplQ8IDj
 /Znwg+bo8aJIEOc40bJJccJR9GJI/m1cWnda40zCvdDx7UIYQiIEXmZ7o
 R5ULZvEx1t1nE6Z2Hf5wzf1vH68f4SslLpRIIIUL9jbj7+v03+IZiMYZC
 9BV8XOsSpEutmq58R+xdjrYPzj1pZYyOgra0kpa92Ll2eDNOZD8oar3PK
 +PV6K/D6A2jUllFmZicjLrTugNaTCO4raAdoarzurTI4FxsLDIibZgqar w==;
X-CSE-ConnectionGUID: 1OIPNsmTQSa0MMti+Rnm4A==
X-CSE-MsgGUID: gNr4uZ8aT6mRWS1aPzK+KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="68583951"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="68583951"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 08:34:57 -0800
X-CSE-ConnectionGUID: u60BZEWGSkeigTilFFXIow==
X-CSE-MsgGUID: h6xqvv4oSqCPYe/9fJxAoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="189734266"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.40.39])
 by fmviesa010.fm.intel.com with ESMTP; 11 Nov 2025 08:34:56 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v5 0/8] Madvise feature in SVM for Multi-GPU configs 
Date: Tue, 11 Nov 2025 16:34:48 +0000
Message-ID: <20251111163456.496063-1-nishit.sharma@intel.com>
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

Nishit Sharma (8):
  tests/intel/xe_multi_gpusvm.c: Add SVM multi-GPU cross-GPU memory
    access test
  tests/intel/xe_multi_gpusvm.c: Add SVM multi-GPU atomic operations
  tests/intel/xe_multi_gpusvm.c: Add SVM multi-GPU coherency test
  tests/intel/xe_multi_gpusvm.c: Add SVM multi-GPU performance test
  tests/intel/xe_multi_gpusvm.c: Add SVM multi-GPU fault handling test
  tests/intel/xe_multi_gpusvm.c: Add SVM multi-GPU simultaneous access
    test
  tests/intel/xe_multi_gpusvm.c: Add SVM multi-GPU conflicting madvise
    test
  tests/intel/xe_multi-gpusvm.c: Add SVM multi-GPU migration test

 lib/xe/xe_ioctl.c             |   39 +
 lib/xe/xe_ioctl.h             |    5 +
 tests/intel/xe_multi_gpusvm.c | 1636 +++++++++++++++++++++++++++++++++
 tests/intel/xe_multisvm.c     |    2 +
 tests/meson.build             |    1 +
 5 files changed, 1683 insertions(+)
 create mode 100644 tests/intel/xe_multi_gpusvm.c

-- 
2.48.1

