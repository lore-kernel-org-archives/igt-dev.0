Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618A7FC9EDF
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 06:07:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E27DE10E131;
	Mon,  9 Mar 2026 06:07:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jIXhJcs+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 673AA10E0ED
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 06:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773036444; x=1804572444;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0kfpIrCC0kMWR4MZ2ysBh6Znh+QA6kdKTQFpqV1mOU0=;
 b=jIXhJcs+fN2kSualr9Dg7EEQNi26LaxCoqz3oH0CKG5fl/p8Pfq1vhdc
 YES+lmtywnn3jkcdnzs6s20bwwPHaF91n27ZLrw9sI2OfuCPUOnRg7L9B
 JNTC/X+DtmlLVEguGxlMEeqFubBDpMx5yOFQhwabJpUX4cqStvdFN7u6g
 tpjLMqN2hxwgaUVasvu0C9512D6hXN/RsH8JZFfgjywci/r552LRU04O0
 hAavC4g84wXjlglhcvz63pJh2NoNlB1p48K59Dnp7OdCzx554AF1FuzMY
 EVudJXda+zv3SqU19kyA0FF/b3W+QLeenS1AAWC/09T/PLfYqJ0dAryRM Q==;
X-CSE-ConnectionGUID: AZcs92g+TxCPEbJlIfTn2g==
X-CSE-MsgGUID: 8TONK4p9TL6Cho2D/N7xPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="73073610"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="73073610"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2026 23:07:24 -0700
X-CSE-ConnectionGUID: gHNPL25kQXiUvR4flzOElA==
X-CSE-MsgGUID: eglvCFyqTe22LpEyFgmD8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="219627751"
Received: from jeevan24.iind.intel.com ([10.223.74.58])
 by orviesa008.jf.intel.com with ESMTP; 08 Mar 2026 23:07:23 -0700
From: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 0/3] Implementation of Negative tests for VM_BIND Decomp
Date: Mon,  9 Mar 2026 11:37:57 +0530
Message-ID: <20260309060800.642378-1-smitha.balasubramanyam@intel.com>
X-Mailer: git-send-email 2.43.0
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

This series adds negative test coverage for VM_BIND Decompression.

Patch 1 introduces temporary helpers and UAPI definitions required
for the tests while the corresponding positive test series is still
under review.

Patch 2 adds resource management structures and helper utilities
used by the VM_BIND Decomp Negative tests.

Patch 3 implements the actual negative tests covering invalid uapi parameters and
ccs corruption scenarios.

Smitha Balasubramanyam (3):
  igt/xe: Add temporary helpers for VM_Bind neg test
  tests/intel : Add data structs & helper utilities for VM_Bind Neg
    tests
  tests/intel : Add Neg tests for VM_Bind Decomp

 include/drm-uapi/xe_drm.h |    1 +
 tests/intel/xe_ccs.c      | 1395 +++++++++++++++++++++++++++++++++----
 2 files changed, 1275 insertions(+), 121 deletions(-)

-- 
2.43.0

