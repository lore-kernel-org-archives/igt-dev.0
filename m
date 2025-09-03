Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F433CA0FF2
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 10:37:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C38110E1FF;
	Wed,  3 Sep 2025 10:37:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ym+KL+aE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EDCC10E1FF
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 10:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756895840; x=1788431840;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UoKNV884SpMMYkz1M03jj986L77DeOxQRrKBJuHu69A=;
 b=Ym+KL+aEl+Ij+RVz4oyoW53RthwzxWBqkR6kq46mzCFeTzB3qpSnTdZ9
 g/tmERKKMkuaqPuI438HVf5kVWYnSIL8rqJzRUHWQ40xgInpzcOX3C/81
 mCjCHPZz3L/BHHoyl7hhnRp3pqZTx4RjXeu1Uc21Bkmd2bdPYEEME6h3v
 Us9g9VXA5Mwi3BTwkscfDwp1zJ7+kstWbvaSbIo7D2KO+SuEA/UQyBOuR
 WKw/YFVc4kr2unQjEk2iAik6WqAjov67lJEx6Dg33gGGUtg4yHl4/Amss
 Dy/t0+ryOMGpeFPtDXJtDJEwjXHayyuzU2MUPeUfr7JHkA2hkHznpNHJf A==;
X-CSE-ConnectionGUID: wf+ZQp8hStSvFo/V9DDHDQ==
X-CSE-MsgGUID: xGRFefPaRESaOxBiFCUB9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="70582204"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="70582204"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 03:37:20 -0700
X-CSE-ConnectionGUID: 0m/q2jXWT7ay8RLvabDhlw==
X-CSE-MsgGUID: 5lx+TnZlTgyHA0HuzUNeHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="171436737"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.68])
 by orviesa007.jf.intel.com with ESMTP; 03 Sep 2025 03:37:17 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, pravalika.gurram@intel.com,
 himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v9 0/5] Madvise Tests in IGT
Date: Wed,  3 Sep 2025 10:37:11 +0000
Message-ID: <20250903103716.1780404-1-nishit.sharma@intel.com>
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

ver6:
- Incorporated review comments
- Removed dead code checked-in due to rebasing
- Added new subtests in section
- Modified madvise subtests by adding flags
- Added description of new sub-tests
- Called helper functions from test_exec which performs

ver7:
- Fixed code which was calling madvise op only for device mem
- Fixed warnings

ver8:
- Done Code cleanup

ver9:
- Moved madvise-swizzle section in main loop. Each pass can toggle
  between device/system memory
- Removed redundant code for writing data at location
- called helper in test_exec() for handling madvise-swizzle

Nishit Sharma (5):
  DO-NOT-MERGE: include/drm-uapi: Add drm_xe_madvise structure
  lib/xe: Add xe_vm_madvise ioctl support
  lib/xe: Add Helper to get memory attributes
  tests/intel/xe_exec_system_allocator: Add madvise-swizzle test
  tests/intel/xe_exec_system_allocator: Add atomic_batch test in IGT

 include/drm-uapi/xe_drm.h              | 289 ++++++++++++++++-
 lib/xe/xe_ioctl.c                      | 149 +++++++++
 lib/xe/xe_ioctl.h                      |   9 +-
 tests/intel/xe_exec_system_allocator.c | 433 +++++++++++++++++++++++--
 4 files changed, 835 insertions(+), 45 deletions(-)

-- 
2.43.0

