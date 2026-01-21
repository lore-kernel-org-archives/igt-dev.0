Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2063C4450D
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 11:46:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F36810E759;
	Wed, 21 Jan 2026 11:46:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PbW+p5cV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB5E10E1FC
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 11:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768995994; x=1800531994;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3EXLm/qjvxO8syVWzBAs9ozdgffhAT3BhMKNhgN/NNc=;
 b=PbW+p5cVa8ucPdSuBVaDtwxQ2GY4ZhRY0LnXS5Zwqg+FVjhAHkS3qs7i
 nCMpfwyvHMDjddrwfLGaC36yv2VV7UQDUDCo2snZrUkGxn5MYLiapnAUo
 8j2+Ec4CDPN3DTAborYwVsWND5BcFjrm0PUbOC4sDC45MiItCwJRJ+2Lc
 XBADu+nvySNCQyE8E3H3d32JfOy36EbCm0sOypHDs+58l4iwMU7jAfyNE
 AhllVpE30ISDsLRGfstdUloson6/JPM8W6otqgwk7Mjar5F9X4EGG+O8K
 7eFv2pyftAi9i3F4mTmHjFG6bZqFm1wn0nlYXTdEcUJGOyDCtQaU7B0Ri A==;
X-CSE-ConnectionGUID: nOAKuMBMQpumwA6OlQCmlA==
X-CSE-MsgGUID: WqBvfeA4Sty876ULUD51mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="92889030"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="92889030"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 03:46:33 -0800
X-CSE-ConnectionGUID: YiIXpXwaS7eI/f9VDpxPPw==
X-CSE-MsgGUID: wvvdUJOTSn+0gCHPtgtXYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="206347399"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa006.fm.intel.com with ESMTP; 21 Jan 2026 03:46:32 -0800
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org,
 niranjana.vishwanathapura@intel.com, ramadevi.gandi@intel.com,
 dwarakanath.ramadeva@intel.com
Subject: [PATCH v3 0/6] Extend multi queue feature validation support
Date: Wed, 21 Jan 2026 17:16:25 +0530
Message-ID: <20260121114631.277272-1-priyanka.dandamudi@intel.com>
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add multi queue validation support to other tests.

xe_exec_fault_mode
xe_evict
xe_exec_threads

v2:
1. Remove documentation changes in this series to avoid confusion
and will be added in a separate patch.
2. Rename emailid's who are no longer valid.
3. Rename multiq in the starting of the patch for the test xe_evict.c.
4. Add cm multi queue tests for xe_exec_threads.
5. Include a patch in this series for new 2 subtests engine-reset and cm-engine-reset
as it's lib changes are dependent for multi-queue-engine-reset test
cases.
6. Separate out lib changes related to cat-error as those are also for cat-error
test cases but include in this series as multi queue cat error test
cases are also dependent on it.
7. Remove lib change related to sync object in legacy mode lib as that
change doesn't add any difference.

v3:
1. Remove xe_exec_reset test related patches from the series.
2. Move compute code to compute related patch of xe_exec_threads.
3. Add assertion for MULTI_VM in xe_evict that it shouldnt go with
MULTI_QUEUE.
4. Some minor changes in the commit descriptions.
5. Add related version changes in the commit description of each patch.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Priyanka Dandamudi (6):
  tests/intel/xe_exec_fault_mode: Add multi-queue test support
  tests/intel/xe_evict: Add basic multi-queue test
  tests/intel/xe_evict: Add multi-queue priority test
  tests/intel/xe_evict: Enhance testing of multi-queue functionality
  tests/intel/xe_exec_threads: Add multi-queue basic test
  tests/intel/xe_exec_threads: Add multi queue for compute mode

 tests/intel/xe_evict.c           | 110 ++++++++++++--
 tests/intel/xe_exec_fault_mode.c | 111 ++++++++++++--
 tests/intel/xe_exec_threads.c    | 252 ++++++++++++++++++++++++++++++-
 3 files changed, 442 insertions(+), 31 deletions(-)

-- 
2.43.0

