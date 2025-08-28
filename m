Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA46CA0EED
	for <igt-dev@archiver.kernel.org>; Thu, 28 Aug 2025 16:58:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D2310EA54;
	Thu, 28 Aug 2025 16:58:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ge6tAQ6n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BFA210EA54
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Aug 2025 16:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756400300; x=1787936300;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=n3SWl2wlBcfEXPXjGo+VcGsUdpaUPKrvT8J0rp8RVGw=;
 b=ge6tAQ6nJsX6QyiCBQgKg+CNl130ZT6UsI+byTZaTYRs+t+JLPzv0TXs
 n9AZx0L3NlasjGqeQnm1CFyn9LOUY3E2Uqe21dezQsCWpZGyNJl46f53B
 hL0nm7QyyJ84fi0QYO5ekPllsdgPYiWWdI+x5HDXMSWlENVafqttiUrQ7
 45EmvMrNV63xm6vDZoHO77NgfOuAK2t7KgvVcGfCLUhfytz9dk9+KWMlI
 CeSj8y9ncOk740kEM56M0M8/clLDaSLvYmgZY4CaLAHTYppMvZhOcHIuT
 OGkHkykq+SZGIO0Myww2vjuKjghVZovvEaeCPpJp9k0g9SmQuoxTe8Dkd w==;
X-CSE-ConnectionGUID: CAsRw4IWQ3eUWLtRgH5HSA==
X-CSE-MsgGUID: zDijag0WRbyxGLLVQJ8Dqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="58388076"
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="58388076"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 09:58:19 -0700
X-CSE-ConnectionGUID: rLPV3nKLTzmy0oLoyH4U8A==
X-CSE-MsgGUID: yb6bRbOVQaeBVr+O7gy4XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="169685200"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.68])
 by fmviesa007.fm.intel.com with ESMTP; 28 Aug 2025 09:58:18 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, pravalika.gurram@intel.com,
 himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t 0/5] Madvise Tests in IGT
Date: Thu, 28 Aug 2025 16:58:12 +0000
Message-ID: <20250828165817.97661-1-nishit.sharma@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

Revision 1:
Added madvise tests in IGT which validate different features related
to attributes passed. Madvise tests related to Atomic operation,
Preferred Loc have been added and validated. Madvise tests are called as
part of different struct section and available as madvise-<test-name> in
list of subtests.

ver2:
- added back subtest which was deleted due to rebasing

ver3:
- added variable deleted during rebase.

ver4:
- Removed redundant loop for multi-vma test. Instead added multi-vma check
  in which is manipulating address, batch addreess only and the
  remaining execution is done as per default flow.
- Passed region DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC in prefetch tests.

ver5:
- Incorporated review comments
- Removed section from test which was not required
- Added subtests description
- Tests executed on latest drm tip

Nishit Sharma (5):
  DO-NOT-MERGE: include/drm-uapi: Add drm_xe_madvise structure
  lib/xe: Add xe_vm_madvise ioctl support
  lib/xe: Add Helper to get memory attributes
  tests/intel/xe_exec_system_allocator: Add preferred_loc_smem test
  tests/intel/xe_exec_system_allocator: Add atomic_batch test in IGT

 include/drm-uapi/xe_drm.h              | 289 +++++++++++-
 lib/xe/xe_ioctl.c                      | 154 ++++++
 lib/xe/xe_ioctl.h                      |   9 +-
 tests/intel/xe_exec_system_allocator.c | 624 ++++++++++++++++++++++---
 4 files changed, 990 insertions(+), 86 deletions(-)

-- 
2.43.0

