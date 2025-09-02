Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52862CA0FFE
	for <igt-dev@archiver.kernel.org>; Tue,  2 Sep 2025 16:30:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE91D10E7E6;
	Tue,  2 Sep 2025 16:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QrsF2wG/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818D410E7E6
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Sep 2025 16:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756830656; x=1788366656;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=t7jJQwSptUxQPBgDEFYK9+zrNn5UqwuB8pkwIAFZrq4=;
 b=QrsF2wG/R4BTQTIamhmupHFDq1keK3V9viPG9V2PLiM2v+5AZrlA3OPd
 0kelVfe0zHlEI4zWlJnlSPHW028rIm4tpoC8CAqrbDTjc+6ZWcATYbvwe
 HmMZF0lJnxXI2lWJpPcG/y6SadnHLNpU73ntpPswH6JRmCTmvMRmI7CaR
 O8tkl+E1JOIhwU1z64EZmEIGdTshnJt4mmX2C36heXLBPzMfoO+oRCrYb
 pts03ctM3i8jWXzNgZGt8gg5HDWJ0rAnARJe1ZK6ZfT7gtVE8Lw2cSDAd
 r79vKELFXf66IyxFCX44aKg2Y/ZkQxcScryN2gL1/rUhfKw7E2b42xeGm A==;
X-CSE-ConnectionGUID: y5j+KSTnTQKF8qeceOM6Fw==
X-CSE-MsgGUID: 0TJUhbM1T0WPjOXkBZlATA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="58814597"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="58814597"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 09:30:55 -0700
X-CSE-ConnectionGUID: na0wp9qkR56Vh26WOT6lzw==
X-CSE-MsgGUID: vi2SA2iETgCmXcS/RMgLuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="171288432"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.68])
 by fmviesa006.fm.intel.com with ESMTP; 02 Sep 2025 09:30:53 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, pravalika.gurram@intel.com,
 himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v8 0/5] Madvise Tests in IGT
Date: Tue,  2 Sep 2025 16:30:46 +0000
Message-ID: <20250902163051.1470191-1-nishit.sharma@intel.com>
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

Nishit Sharma (5):
  DO-NOT-MERGE: include/drm-uapi: Add drm_xe_madvise structure
  lib/xe: Add xe_vm_madvise ioctl support
  lib/xe: Add Helper to get memory attributes
  tests/intel/xe_exec_system_allocator: Add madvise-swizzle test
  tests/intel/xe_exec_system_allocator: Add atomic_batch test in IGT

 include/drm-uapi/xe_drm.h              | 289 ++++++++++++++-
 lib/xe/xe_ioctl.c                      | 149 ++++++++
 lib/xe/xe_ioctl.h                      |   9 +-
 tests/intel/xe_exec_system_allocator.c | 465 +++++++++++++++++++++++--
 4 files changed, 867 insertions(+), 45 deletions(-)

-- 
2.43.0

