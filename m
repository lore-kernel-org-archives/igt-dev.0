Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A6DCA0FF2
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 14:13:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B26110E8AC;
	Wed,  3 Sep 2025 14:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lCSJ3/CU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 293AF10E8AC
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 14:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756908823; x=1788444823;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e1fkuwFl2WpEGnrS9jZtnWMwNhnDpcLDK1JmrCkCHxc=;
 b=lCSJ3/CUAPAV+pXdlj9Aerp6Kx23c1NhlppwbGhaf5vSdMp5+goL9d1H
 QhZiYcxdG/m4hrcKf+cnnTRlGFcqjUmBM6GHk0nvGs4Y7HgYgaXKIGmay
 SGXRj93B0nEg/bKOxMjoH5kbDkfXpeNWew/fUqShJ3HNyuECVjsTP6K9p
 701H/tcrTN8/9sq9WXY9SElpIRXUg6Kol8aGndrCPAr7027Und7QDCvUP
 j0+DaVaWFta8FWp1PrHUlkmcjY3ZctjPM3yFDf41A8ZudhFnN9xhvg1/4
 hifxdh/4CEIQbshPqbkNfLAWgPPDIB6WfV7BzGRFtGYa0hK2/SugIpoOR Q==;
X-CSE-ConnectionGUID: hst5Mhc7TCC94JqWxNzXIg==
X-CSE-MsgGUID: ihT6tQ9bT7SYWOjCzRL3wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59292123"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59292123"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 07:13:43 -0700
X-CSE-ConnectionGUID: S03QlowDQxeE/gUPv+HFgg==
X-CSE-MsgGUID: dkOque3cTNqsEp7qUSO1OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="172435953"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.68])
 by fmviesa010.fm.intel.com with ESMTP; 03 Sep 2025 07:13:40 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, pravalika.gurram@intel.com,
 himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v11 0/5] Madvise Tests in IGT
Date: Wed,  3 Sep 2025 14:13:34 +0000
Message-ID: <20250903141339.1859497-1-nishit.sharma@intel.com>
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

ver11:
- For maintaining patch series version parity with Patchwork set ver11
- Sync latest uAPI KMD header

Nishit Sharma (5):
  uapi/xe: Sync latest uAPI KMD header
  lib/xe: Add xe_vm_madvise ioctl support
  lib/xe: Add Helper to get memory attributes
  tests/intel/xe_exec_system_allocator: Add madvise-swizzle test
  tests/intel/xe_exec_system_allocator: Add atomic_batch test in IGT

 include/drm-uapi/xe_drm.h              | 290 ++++++++++++++++-
 lib/xe/xe_ioctl.c                      | 149 +++++++++
 lib/xe/xe_ioctl.h                      |   9 +-
 tests/intel/xe_exec_system_allocator.c | 433 +++++++++++++++++++++++--
 4 files changed, 839 insertions(+), 42 deletions(-)

-- 
2.43.0

