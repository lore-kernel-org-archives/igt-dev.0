Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6C6C19F32
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 23:40:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A126410E856;
	Wed,  5 Mar 2025 23:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DyT//TaR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC77A10E0D9
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 23:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741218011; x=1772754011;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aydG167Xd801ZBPqV8fBTzhH6YsdOUkf7UM/Ir4l6wY=;
 b=DyT//TaRJj/qjpSPdhhYRBiWhSbn34TXXOmUw2emhsBbsSKYFZ7T0RkO
 a7RO7IaGh59ylH6FypQK5/OlELaI+dAbWooJQ8imU/RjDcbdO4eGnsM7n
 tuZoy+1C76o71cOVJfSH+Y+WfplWqj9Qjqcs0J1/PBuaJpjNRBYY6mjwH
 SiJe13dgkW3fSVeceUKY2mv9h1p42mu7F/VsbWy1m9nqsz7Ej6TSe6iOq
 9iQ/T7Gp35eEKQdnmRrVSXEUDMI4Hlcx6oTEZQTCYR+VXOjSPY3iUHD4b
 rQwDQCc6hnEJhqwbfJxpJmFughHoYdfx4KDlUEYX6oC+BzI0ZKzdoWyZb g==;
X-CSE-ConnectionGUID: s5KysAhPQh6UhRIuN0egFA==
X-CSE-MsgGUID: fH0e4U0YS4mCuAf/NI0uvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41917097"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="41917097"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 15:40:11 -0800
X-CSE-ConnectionGUID: C/Rh5UvHTYmdst9x+5n4Cg==
X-CSE-MsgGUID: 2cbSKQwxQ5u2R9Gv/Z3F6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="118849497"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 15:40:11 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH i-g-t v5 0/6] Xe: Add tests for PXP 
Date: Wed,  5 Mar 2025 15:39:41 -0800
Message-ID: <20250305233951.3488609-1-daniele.ceraolospurio@intel.com>
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
 tests/intel/xe_pxp.c    | 1222 +++++++++++++++++++++++++++++++++++++++
 tests/intel/xe_query.c  |   61 ++
 tests/intel/xe_vm.c     |   23 +
 tests/meson.build       |    1 +
 9 files changed, 1403 insertions(+), 21 deletions(-)
 create mode 100644 tests/intel/xe_pxp.c

-- 
2.43.0

