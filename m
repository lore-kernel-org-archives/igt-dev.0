Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D109C35FFA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Mar 2025 22:26:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC0C10E2C0;
	Wed, 19 Mar 2025 22:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i5YO1voA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A4B10E25D
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Mar 2025 22:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742423159; x=1773959159;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PnE66ge1Sv/C5NrbbxjIeC3hSUfWA4I78aBnv2jXAUM=;
 b=i5YO1voAQv572h5UmJjy+OTzSRCn244uDikJKfuxvkwSfdMBEYF/elRV
 2NoL6f3KwGseZRePcGwp9DLKYxY9eNY9IL8Vi84IQi1SpnR5LfHPwCJul
 r66CDjjd5hk8eHnS24CHTgr6qK3SVjCIHOxgFAI+rvul7YdtfAq3wL9Fw
 LHmdY0y+cI5t2rIYZnwko3Mvc7y8vve2/mr5AMXjfTEb2vjoTTvXaWbG5
 WcRVNVGgO+2qV74kPuTr9V60j85LgWdG2jqxiZt4gnEyqeXBPJR3Ul+K9
 F4zl0SPm/zmxoKOcbmEqrs4nfAaEm04dRK9bvQgT32Cuu20PV3sK5vPAr g==;
X-CSE-ConnectionGUID: fy7CZUYGQYeLacqDVYUlGA==
X-CSE-MsgGUID: x/mK0qVhT1migVlArqx1hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43510774"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="43510774"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 15:25:58 -0700
X-CSE-ConnectionGUID: OC12eWn0S1mgBFSXjwaSWw==
X-CSE-MsgGUID: VbI6hsTRQT2geoq9HPUmhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="122540394"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 15:25:58 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, matthew.brost@intel.com,
 zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com
Subject: [i-g-t v7 0/4] xe: Test scratch page under fault mode
Date: Wed, 19 Mar 2025 18:42:27 -0400
Message-Id: <20250319224231.1909393-1-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
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

This series intoduces a subtest for Xe to test scratch page under fault
mode.

It also includes some helper functions to make the test easier.

Today most of igt tests use one single function to perform multiple
subtests. flags are used to control the behavior of the test. While
this is a good way to write efficient tests, it also makes the test
difficult to maintain, especially when we add more and more subtests
into single test function.

This patch series introduces some helper functions with which we can
write more readable tests. This is illustrated in patch 4 of this series.

Note the intention of this patch series is not to replace the existing
igt tests, but to provide an alternative way to write simple tests.Bommu Krishnaiah (1):
  lib/xe/xe_util: Introduce helper functions

Bommu Krishnaiah (1):
  lib/xe/xe_util: Introduce helper functions

Oak Zeng (3):
  lib/xe: Fix a comment error
  tests/intel/xe_exec_fault_mode: Test scratch page under fault mode
  tests/intel/xe_vm: Allow scratch page under fault mode on LNL and BMG

 lib/xe/xe_ioctl.c                |   4 +-
 lib/xe/xe_util.c                 | 239 +++++++++++++++++++++++++++++++
 lib/xe/xe_util.h                 |  39 +++++
 tests/intel/xe_exec_fault_mode.c |  68 +++++++++
 tests/intel/xe_vm.c              |   7 +
 5 files changed, 355 insertions(+), 2 deletions(-)

-- 
2.26.3

