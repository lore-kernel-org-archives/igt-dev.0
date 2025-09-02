Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C80CA0FFE
	for <igt-dev@archiver.kernel.org>; Tue,  2 Sep 2025 04:26:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36BAC10E077;
	Tue,  2 Sep 2025 04:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ee8D+I2e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D7B10E077
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Sep 2025 04:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756787169; x=1788323169;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sb3l4njCFMKIatvJn8lUTuOzOsJVg5nkCwlQqespvww=;
 b=Ee8D+I2eJtfF5RGNiqcBR+taQk+w0RXGPrFIRvcy9bTb+K4X/1C9BT2N
 LPLLExvYwi1eT7XoBsHs5WohGO+hRi/i4Ep8axcNOmMCblBgX2H72lAne
 /TinfT1nLeV7+/7I+AT7ayBUH65737isY0Cxe5oUCcLJjL5KXfQFJPxEi
 VK/sqWGLVUwig0IND4iysGeD4maxXrb4+1owqMPbXKa3l1D7xy/ZFFpGd
 PQTwZ8eBe7Pa+8e2aCZVTcQk2SH08h7JXFAWozBiscoGVVLLHdhHx/dt3
 6Qnx5NECJJFLwlG775YGcOF2JEPql0nTC/Z384HHZU2RTafEgSmqc0lk5 w==;
X-CSE-ConnectionGUID: rS8B9mM6QkCTcl7Zc3BqWA==
X-CSE-MsgGUID: kYw7T80WRiy5I0XV/xkBbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58977222"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="58977222"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 21:26:09 -0700
X-CSE-ConnectionGUID: jjGq6yNTR/ub63JizAxkUA==
X-CSE-MsgGUID: SYbx1+bLQQa/KPd0bROOWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="175529930"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.68])
 by orviesa004.jf.intel.com with ESMTP; 01 Sep 2025 21:26:07 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, pravalika.gurram@intel.com,
 himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v7 0/5] Madvise Tests in IGT
Date: Tue,  2 Sep 2025 04:26:00 +0000
Message-ID: <20250902042605.1223524-1-nishit.sharma@intel.com>
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

Nishit Sharma (5):
  DO-NOT-MERGE: include/drm-uapi: Add drm_xe_madvise structure
  lib/xe: Add xe_vm_madvise ioctl support
  lib/xe: Add Helper to get memory attributes
  tests/intel/xe_exec_system_allocator: Add madvise-swizzle test
  tests/intel/xe_exec_system_allocator: Add atomic_batch test in IGT

 include/drm-uapi/xe_drm.h              | 289 ++++++++++++++-
 lib/xe/xe_ioctl.c                      | 149 ++++++++
 lib/xe/xe_ioctl.h                      |   9 +-
 tests/intel/xe_exec_system_allocator.c | 471 +++++++++++++++++++++++--
 4 files changed, 873 insertions(+), 45 deletions(-)

-- 
2.43.0

