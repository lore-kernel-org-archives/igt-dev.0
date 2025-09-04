Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25931CA1012
	for <igt-dev@archiver.kernel.org>; Thu,  4 Sep 2025 08:27:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D022210E99A;
	Thu,  4 Sep 2025 08:27:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="djNza5ke";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B805C10E99A
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Sep 2025 08:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756974425; x=1788510425;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0mWAe9lF9Ydph9YdNwrOvgDPY6AcW+1Sn7voP+cqij0=;
 b=djNza5kej3zQwmwB6nPUP5Ca0rxAtPBFb2LQLhNslRYgb+/ldnAOfddf
 +z5S0OiNPQJrmHLMeTJW+WYOJ/Q9emu8muJBAVUbLSUX+MV+B//Jdg0oL
 KA6Pj/kpooV37gQ4esRE/Y8hrBGJkqU7DU6AoFh+tQYYLQFquAwZLB83F
 3M1/9SFTL4RFzLFz8RUHDBgxXNC15p/7Ncp1UQPuB+Y1+JXgQnEUTWx8O
 qj0y3yDYs4tii4g2ypQTq7DEhNDrbY+wg++JYNVDUrVrmjUGUCFYhutrQ
 k5gajXeyksoHbN+bPXaAgsbn0Cjn+RPibEx0w4yg1kgaPxGkpVb6N/Nct w==;
X-CSE-ConnectionGUID: ZONEwDc1R+GFKZXZmPbHkQ==
X-CSE-MsgGUID: PReKKRKPRj25Xooy2KzeTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="61937986"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="61937986"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 01:27:05 -0700
X-CSE-ConnectionGUID: k7bO9aPQQ/iXiqikmXv+DQ==
X-CSE-MsgGUID: /39huF7PTvOW7kohQMwkNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="171945324"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.68])
 by orviesa008.jf.intel.com with ESMTP; 04 Sep 2025 01:27:03 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, pravalika.gurram@intel.com,
 himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH v12 0/5] Madvise Tests in IGT
Date: Thu,  4 Sep 2025 08:26:56 +0000
Message-ID: <20250904082701.2154029-1-nishit.sharma@intel.com>
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

v2:
- added back subtest which was deleted due to rebasing

v3:
- added variable deleted during rebase.

v4:
- Removed redundant loop for multi-vma test. Instead added multi-vma check
  in which is manipulating address, batch addreess only and the
  remaining execution is done as per default flow.
- Passed region DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC in prefetch tests.

v5:
- Incorporated review comments
- Removed section from test which was not required
- Added subtests description
- Tests executed on latest drm tip

v6:
- Incorporated review comments
- Removed dead code checked-in due to rebasing
- Added new subtests in section
- Modified madvise subtests by adding flags
- Added description of new sub-tests
- Called helper functions from test_exec which performs

v7:
- Fixed code which was calling madvise op only for device mem
- Fixed warnings

v8:
- Done Code cleanup

v9:
- Moved madvise-swizzle section in main loop. Each pass can toggle
  between device/system memory
- Removed redundant code for writing data at location
- called helper in test_exec() for handling madvise-swizzle

v11:
- For maintaining patch series version parity with Patchwork set v11
- Sync latest uAPI KMD header

v12:
- Incorporated review comments (Matt B)
- Patch-1 commit aligned with KMD uAPI commit

Nishit Sharma (5):
  drm-uapi/xe: Sync with madvise interface
  lib/xe: Add xe_vm_madvise ioctl support
  lib/xe: Add Helper to get memory attributes
  tests/intel/xe_exec_system_allocator: Add madvise-swizzle test
  tests/intel/xe_exec_system_allocator: Add atomic_batch test in IGT

 include/drm-uapi/xe_drm.h              | 290 +++++++++++++++-
 lib/xe/xe_ioctl.c                      | 149 +++++++++
 lib/xe/xe_ioctl.h                      |   9 +-
 tests/intel/xe_exec_system_allocator.c | 436 +++++++++++++++++++++++--
 4 files changed, 842 insertions(+), 42 deletions(-)

-- 
2.43.0

