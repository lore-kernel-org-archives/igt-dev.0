Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B91ECCF9F8
	for <igt-dev@archiver.kernel.org>; Wed,  5 Nov 2025 14:53:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E474810E78B;
	Wed,  5 Nov 2025 14:53:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nrr7pUIy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D62C10E78B
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Nov 2025 14:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762354392; x=1793890392;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=altSSZF2yUVQnxhUhM6ioP3HBj52Ib4K1Ntn9ZNxDeM=;
 b=nrr7pUIy6IlC8kizw75xqh/uPDxvLeoiIIoQOEbxoH//tzariFFqqx8k
 xWs+vLDv/9sXn5Qhno9s093SIdl6WKc1+eBLlzUfLLRR1PZMD9p2n/fwE
 LTcuKNONhINIP9Vcdc58okrrBYAt51EXn26/8veACw1CrcslaZsej7r5v
 r7kptS/iSTmMnkbHcUKqrd8QezC0UvQxsWoSer3VP0jr2t+xGFz8e7I3g
 bNK18GvYeNFpQZqxFW/E+kKD0nfGyMwZiwunjbbNwnCLbVbM2SgX311Rn
 ivUlm4loD4cMHw4Y7sr+yun+3eh3/8I7FNTEQb+PFNANepNWIz9fp7MBY g==;
X-CSE-ConnectionGUID: bibhgcZXS5K7v2s2APitQw==
X-CSE-MsgGUID: pWos+xmYRDOAZ6H3cmIVlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64165782"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="64165782"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 06:53:12 -0800
X-CSE-ConnectionGUID: QvAohskCQH6X0emW+ob8dg==
X-CSE-MsgGUID: gZ2LMW27TmKQKM/RfGdQIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="187167716"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.40.39])
 by orviesa009.jf.intel.com with ESMTP; 05 Nov 2025 06:53:12 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v4 0/7] Madvise feature in SVM for Multi-GPU configs
Date: Wed,  5 Nov 2025 14:53:04 +0000
Message-ID: <20251105145311.32403-1-nishit.sharma@intel.com>
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

Nishit Sharma (7):
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

 lib/xe/xe_ioctl.c             |   40 +
 lib/xe/xe_ioctl.h             |    5 +
 tests/intel/xe_multi_gpusvm.c | 1399 +++++++++++++++++++++++++++++++++
 tests/meson.build             |    1 +
 4 files changed, 1445 insertions(+)
 create mode 100644 tests/intel/xe_multi_gpusvm.c

-- 
2.48.1

