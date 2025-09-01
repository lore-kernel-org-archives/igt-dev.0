Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC073CA0FFF
	for <igt-dev@archiver.kernel.org>; Mon,  1 Sep 2025 16:40:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD8410E149;
	Mon,  1 Sep 2025 16:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="llsO36Kt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2BF10E149
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Sep 2025 16:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756744848; x=1788280848;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pGyBjGEIAJ7jOsBwP0Lh96AQnpF8YCDfNxgDP8saBGw=;
 b=llsO36KtOa23wAWutyJUh+K8YuqLllbBpq4W3ZW2GtmmpWOT4+Uew61x
 aDdLUO0E+bckT1AmTLSb2goyhKnVQC6odjSt0qWQvAM45Je9s2gj/G2JJ
 GRvSqOfwFq79FQIDpx9iLvrlZzELwkeAxZ6Ula7afwooyufeRYYmvOZ1f
 JNhx2XUlmL42sfT/qp0To7rpKQdhti+A8g0YbVKC52cd/yjyf6DaO/rtN
 fn7YPmVWUnJBQy7WoAyKZWn+myC7Kdsf04X6HuIY+NC0NvQmdCMs0/Z9I
 7s+TPdjMnMQa2KH3Qc6mPIG1oGQWF+DHbjNjASqH203VRXgSdI3zAHNxE w==;
X-CSE-ConnectionGUID: GgYxqB+zScCmrtztbNmM5Q==
X-CSE-MsgGUID: Asa1Eia4RSeILodYDiaGeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="61640993"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="61640993"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 09:40:47 -0700
X-CSE-ConnectionGUID: j1eYDiD9SieNf6JjPLLtYg==
X-CSE-MsgGUID: tjym64PTT7uYD7ojs8t0dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="171508875"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.68])
 by fmviesa009.fm.intel.com with ESMTP; 01 Sep 2025 09:40:45 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, pravalika.gurram@intel.com,
 himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t 0/5] Madvise Tests in IGT
Date: Mon,  1 Sep 2025 16:40:39 +0000
Message-ID: <20250901164044.1028046-1-nishit.sharma@intel.com>
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
  madvise operations

Nishit Sharma (5):
  DO-NOT-MERGE: include/drm-uapi: Add drm_xe_madvise structure
  lib/xe: Add xe_vm_madvise ioctl support
  lib/xe: Add Helper to get memory attributes
  tests/intel/xe_exec_system_allocator: Add madvise-swizzle test
  tests/intel/xe_exec_system_allocator: Add atomic_batch test in IGT

 include/drm-uapi/xe_drm.h              | 289 ++++++++++++++-
 lib/xe/xe_ioctl.c                      | 149 ++++++++
 lib/xe/xe_ioctl.h                      |   9 +-
 tests/intel/xe_exec_system_allocator.c | 470 +++++++++++++++++++++++--
 4 files changed, 872 insertions(+), 45 deletions(-)

-- 
2.43.0

