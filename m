Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCB2C021A4
	for <igt-dev@archiver.kernel.org>; Mon, 24 Feb 2025 17:24:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 403D210E356;
	Mon, 24 Feb 2025 17:24:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AuZ62HYj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C704110E351
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Feb 2025 17:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740417856; x=1771953856;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MyAd2LmGkidkeAvDI4iZVMEWzisAyBGdPo/xn983E70=;
 b=AuZ62HYjeTdkGrVf7Do5llCl6yWUUGXulj1ZLOSezagMlCzMr8HfGWDA
 R0WhG2PVgKHvcjtKQgThAiWyjCJcjOc4SMIf9ZiUA0GYkA5Q5t8FIti+0
 c5ylXf5a5ucX6SuEgZNYSray/LQka4r9+B485eDLWkmWN6rf1jdvFLwp3
 yzDdkYR2PLvZCl0/TLVsrAeAu7MaNFBJZFMfn/CtJRFfRSpN/xX1xcj6i
 n5oCrghZqERzVzY8T5uVYNxksGrPJglTra96q3QLpBacQ8JgZwDaubqW1
 Na6Q2d4a5S82zbFAjOKrGh6fKVLCICR3haV9UboI3yF5tr48K9QyYUp3U Q==;
X-CSE-ConnectionGUID: 3+ow92ikQ9GZSAndAlra2Q==
X-CSE-MsgGUID: DMNMqMM8St2g8ylUC73zgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="41307439"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="41307439"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 09:24:15 -0800
X-CSE-ConnectionGUID: ZvZDS4quSKOVeYUHOrxcoA==
X-CSE-MsgGUID: NQytPzyKTyKAvuPR6n+ooA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117026019"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 09:24:14 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com, matthew.brost@intel.com,
 kamil.konieczny@intel.com, zbigniew.kempczynski@intel.com,
 ashutosh.dixit@intel.com, juha-pekka.heikkila@intel.com,
 rodrigo.vivi@intel.com
Subject: [i-g-t v6 0/4] xe: Test scratch page under fault mode
Date: Mon, 24 Feb 2025 12:40:06 -0500
Message-Id: <20250224174010.594192-1-oak.zeng@intel.com>
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
  tests/intel/xe_vm: Exclude invalid_flags tests from LNL and BMG
  tests/intel/xe_exec_fault_mode: Test scratch page under fault mode

 lib/xe/xe_ioctl.c                |   2 +-
 lib/xe/xe_util.c                 | 239 +++++++++++++++++++++++++++++++
 lib/xe/xe_util.h                 |  39 +++++
 tests/intel/xe_exec_fault_mode.c |  68 +++++++++
 tests/intel/xe_vm.c              |  47 ++++--
 5 files changed, 379 insertions(+), 16 deletions(-)

-- 
2.26.3

