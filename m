Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1FFCA0FF9
	for <igt-dev@archiver.kernel.org>; Fri, 29 Aug 2025 14:54:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7833110EBEA;
	Fri, 29 Aug 2025 14:54:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P7B8/SNe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F6310EBEA
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Aug 2025 14:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756479266; x=1788015266;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0Qz3gtPtMR5YQiaH5s5CzmOZPECYQeYAKsPJXfQoGho=;
 b=P7B8/SNevUw0LB47lAsaEum58sOxRyXJLcN/LI6Vadp6SkxrsJvE7AYD
 4sB4JeOhRs4UbBd2C2dkLK1/j8fwbaHyIPCQYvezWHmtrI25daNk/qO6u
 wUnga+IDUIkWYX/raG73eBmqoc+EBpufT1gbaGcvkTfTg3Ulx180pZAHz
 6KGbIVsJrppmiySCYBufQ7FHlbfbi2yCxn/B0W0veegp9tK4pEEpTUWdA
 FUQiQBbOkompqo3kxBVrJDw1+j+yIkkqDoC+MTcTpvq9ompOeh7eYa8HY
 bx+dPFpz/GulS0bMiNskOsO2ZWDPNcpiLJkU6EwEGLx1MTWHj7q8QQfxL w==;
X-CSE-ConnectionGUID: ZopfSeGoS9+chIO+8B0Rmw==
X-CSE-MsgGUID: 2qfRrwGFQqWgRjLcfT1bcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="76364624"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="76364624"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 07:54:25 -0700
X-CSE-ConnectionGUID: BWMWrYKYRB6//TMvxXu/jQ==
X-CSE-MsgGUID: c2JnbpWaRYKTR/W6FiVg5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="175694431"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.68])
 by orviesa005.jf.intel.com with ESMTP; 29 Aug 2025 07:54:24 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, pravalika.gurram@intel.com,
 himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t 0/5] 
Date: Fri, 29 Aug 2025 14:54:17 +0000
Message-ID: <20250829145422.559494-1-nishit.sharma@intel.com>
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
- Added few more sub-tests under struct section msections
- Added description of new sub-tests

Nishit Sharma (5):
  DO-NOT-MERGE: include/drm-uapi: Add drm_xe_madvise structure
  lib/xe: Add xe_vm_madvise ioctl support
  lib/xe: Add Helper to get memory attributes
  tests/intel/xe_exec_system_allocator: Add preferred-loc-smem test
  tests/intel/xe_exec_system_allocator: Add atomic_batch test in IGT

 include/drm-uapi/xe_drm.h              | 289 +++++++++++-
 lib/xe/xe_ioctl.c                      | 149 ++++++
 lib/xe/xe_ioctl.h                      |   9 +-
 tests/intel/xe_exec_system_allocator.c | 630 ++++++++++++++++++++++---
 4 files changed, 997 insertions(+), 80 deletions(-)

-- 
2.43.0

