Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD957CAC597
	for <igt-dev@archiver.kernel.org>; Mon, 15 Sep 2025 10:40:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EA5110E44E;
	Mon, 15 Sep 2025 10:40:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R1MnkVQG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6615B10E445
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Sep 2025 10:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757932808; x=1789468808;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EirqQ5CcwFrSHedHb1A7vnpSZXplKi6ZEAMfz7WMMHg=;
 b=R1MnkVQGTtkG/Ibfo+NNe/8R0t58ynTMjQe7rokA7i32SY669N7OSbt1
 lZjfZ7FMzWNnKAMfByBc3Yqi/0/axPq5TLAKX8p1HE42nwUcHgkiEBMBT
 RTDQjR4pIVJzWdqxW3JyNr7cVmfKWD0/+rbpLsRNN50hyGVMkmhLCnDh7
 /mkcndrg58cf9NUXaZg5YDc6QQFirR6WgXyz/LxGxYdaBndH8oCMr1kKS
 re9a4cuUPgW92fhMii4gmA/YKu+LgMw8VdwvZjXf5Cfs3TVvat1FBt1e/
 aStf9mO4K4N2cgM+VPYxtWuRhZ/RI+dksfZfNo+9RxkNq30CIyiyqTEUt g==;
X-CSE-ConnectionGUID: wmQEF8JYQ1iAMUFEbYBQjw==
X-CSE-MsgGUID: 7z1qDf3nTuuD+1HVQtvx1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="60051211"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="60051211"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 03:40:07 -0700
X-CSE-ConnectionGUID: OrxxPAVuSOeD9jxkRgPXtQ==
X-CSE-MsgGUID: bexY4i8NT5u2H97yrYkwCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="173881594"
Received: from pgurram-desk.iind.intel.com ([10.190.238.70])
 by orviesa010.jf.intel.com with ESMTP; 15 Sep 2025 03:40:06 -0700
From: pravalika.gurram@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 himal.prasad.ghimiray@intel.com
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH v6 0/2] Add pat-index-madvise
Date: Mon, 15 Sep 2025 16:20:55 +0530
Message-Id: <20250915105057.1468276-1-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Pravalika Gurram <pravalika.gurram@intel.com>

Add pat-index-madvise test to verify setting different
pat_index values for multiple VMAs. This test uses
madvise to set various pat_index values and
verifies that different PAT values can be assigned
to multiple VMAs as expected.

Pravalika Gurram (2):
  tests/intel/xe_exec_system_allocator: Add pat-index-madvise
  intel-ci: Blocklist compression PAT index for LNL

 lib/xe/xe_ioctl.c                        |  29 ++--
 lib/xe/xe_ioctl.h                        |   4 +-
 tests/intel-ci/xe.lnl.core.blocklist.txt |   6 +
 tests/intel/xe_exec_system_allocator.c   | 179 +++++++++++++++++++----
 4 files changed, 178 insertions(+), 40 deletions(-)

-- 
2.34.1

