Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9394CC3600B
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 14:51:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456E310E068;
	Thu, 27 Mar 2025 14:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jKQFiIlI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0786510E068
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 14:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743087072; x=1774623072;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wG73uePdy7ObhUFoBfKp7EFoBaFSxYxm80pRGfNuPdU=;
 b=jKQFiIlIkq9gN4Ai5YYAkZ3asb3fk5IDr2+Khtgzj2/ff4iHyzhsI34W
 S0s56avaWl1VyHYOSj0Zw8nESlUFHoqVAl78pJIhM/wT8ytafRdGzG5o7
 wQhh5v0RGQP98RqtsK0DYSbAL51mAS4xd9eSZ0SDcalD5Ev+oqnie/vxZ
 1jsSprb7HNXVYQ468pWzqMDcuNZJx/yy5rAh7I1a8xjkCHKyQ6JcgMQwe
 fviCVCF0tqX4m76oSI3ZyzP75czL9imS/v0Exp6XwQ63o9JYASckoVMbP
 wKDwKyRe1BQWCwcgN/DnCbqyjrYJ7+i0kljHhZFLKO6i9Uko0sWpp298c A==;
X-CSE-ConnectionGUID: zfkAdmWRTT2Cw/DV7GPcYg==
X-CSE-MsgGUID: g+Uuc1dbSfuUAbkxuQ3TAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44313138"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="44313138"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 07:51:11 -0700
X-CSE-ConnectionGUID: jZ+OvD4jTXGDKyme+D1RIA==
X-CSE-MsgGUID: HpOzh3nhTZeTpz7Nd617Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="129861521"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 07:51:11 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH i-g-t v6 0/6] Xe: Add tests for PXP
Date: Thu, 27 Mar 2025 07:50:54 -0700
Message-ID: <20250327145101.722032-1-daniele.ceraolospurio@intel.com>
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

Given that PXP introduces new interfaces and behaviors, we need to
update existing IGTs and add new ones to cover all the new scenarios.

Minor changes have been done to common functions to propagate the
PXP info and error returns.

v3: part of the v2 series has been split off and merged (see [1]) to
allow the kernel side to be merged without IGT failures. This is rebased
on top of that and addresses the review comments on v2 on the remaining
patches.

v4: fix termination test fixtures

v5: turn off display before running the RPM test, add documentation to
lib functions

v6: rebased on igt_get_render_copyfunc changes. The rebase was trivial,
so I've kept the r-bs

[1] https://patchwork.freedesktop.org/series/144158/
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>

Daniele Ceraolo Spurio (6):
  tests/intel/xe_vm: Update invalid flag subtest with valid PXP flag
  tests/intel/xe_query: Add test for PXP status query
  tests/intel/xe_pxp: Add PXP object and queue creation tests
  tests/intel/xe_pxp: Test PXP submissions
  tests/intel/xe_pxp: Termination tests
  tests/intel/xe_pxp: Test encrypted FBs

 lib/intel_batchbuffer.c |   62 +-
 lib/intel_batchbuffer.h |    1 +
 lib/xe/xe_ioctl.c       |   49 +-
 lib/xe/xe_ioctl.h       |    4 +-
 tests/intel/xe_mmap.c   |    1 +
 tests/intel/xe_pxp.c    | 1220 +++++++++++++++++++++++++++++++++++++++
 tests/intel/xe_query.c  |   65 +++
 tests/intel/xe_vm.c     |   23 +
 tests/meson.build       |    1 +
 9 files changed, 1405 insertions(+), 21 deletions(-)
 create mode 100644 tests/intel/xe_pxp.c

-- 
2.43.0

