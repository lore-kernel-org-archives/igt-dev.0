Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A89C021AA
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 23:42:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8DBE10E786;
	Tue, 18 Feb 2025 23:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jXL+Xkm5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C0410E782
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 23:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739922130; x=1771458130;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/pHM3hT3byu17rUoKDFdkFLBV9AyxL+XcdK8Tf8hv9I=;
 b=jXL+Xkm5XXiR1Jq8OaSNyIA2UXuPMj+DRpcVO+NQFvxwdeNNuSdFCddE
 sVyC5zYHK2O627c6cbs+GbqWOnyDH8qzfxRH3b/cKQrvhLJoTygCKhhrI
 yDUfbjnzhh+RUPZlu4VMtSbfcBHQvHDNwF6O2OjjUscLZG0ErbCJ4QwH7
 g5edYhsOPlLQ55vv3iJxSfdAKiivxESKFhF/CGB6A5+hzYREDs6nwFFXI
 TgejVR9gwjnG0EjJtXW6qePvzW1PPGNygptPQLIYQ2NHlJlifKmH3amBh
 5g8SMl4ymQZCeVOFPq75t71GQ+DA9OviZUAz15cHlf4DZLml4S0qWoVGr A==;
X-CSE-ConnectionGUID: pGeGEFhTRxSV+OKyp/KDvg==
X-CSE-MsgGUID: glGwjbXzQh+zS4dJH8HitA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="52048311"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="52048311"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 15:42:09 -0800
X-CSE-ConnectionGUID: pgP/jtpFQlWKkF/uFX2tpQ==
X-CSE-MsgGUID: pyUVjxicSbGQOz5vwkk3Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="114724041"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 15:42:08 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com, matthew.brost@intel.com,
 kamil.konieczny@intel.com, zbigniew.kempczynski@intel.com,
 ashutosh.dixit@intel.com, juha-pekka.heikkila@intel.com,
 rodrigo.vivi@intel.com
Subject: [i-g-t v3 0/4] xe: Test scratch page under fault mode
Date: Tue, 18 Feb 2025 18:57:51 -0500
Message-Id: <20250218235755.360264-1-oak.zeng@intel.com>
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
igt tests, but to provide an alternative way to write simple tests.

Bommu Krishnaiah (1):
  lib/xe/xe_util: Introduce helper functions

Oak Zeng (3):
  lib/xe: Fix a comment error
  tests/intel/xe_vm: Exclude invalid_flags tests from LNL and BMG
  tests/intel/xe_exec_fault_mode: Test scratch page under fault mode

 lib/xe/xe_ioctl.c                |   2 +-
 lib/xe/xe_util.c                 | 239 +++++++++++++++++++++++++++++++
 lib/xe/xe_util.h                 |  47 ++++++
 tests/intel/xe_exec_fault_mode.c |  69 +++++++++
 tests/intel/xe_vm.c              |  47 ++++--
 5 files changed, 388 insertions(+), 16 deletions(-)

-- 
2.26.3

