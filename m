Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F29C54ED1
	for <igt-dev@archiver.kernel.org>; Tue, 27 May 2025 12:03:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C22E10E4D9;
	Tue, 27 May 2025 12:03:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mN9aQcYa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227FA10E4CC
 for <igt-dev@lists.freedesktop.org>; Tue, 27 May 2025 12:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748347405; x=1779883405;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WDH0PfaEyqCK1mjb00zJgBhFi3kiYbjXxEsImK94ABs=;
 b=mN9aQcYa3d/cl3kFJifonTuU1zQJfriqwCbyHjkgyBmp5WDWWP3RmfIG
 vcLZbLTonROLw8qoc+64kRScnk4tB9u9M/RXmbQ07+g9EwbNPsCdeT3Mj
 EmoqBmjCs7WKNOYgML0FASGEPvTRYPPncVvwAC1SVmNJChr8jPSDICinl
 y9xO4YD9BnTFk3DkvcSbZgcXpe71cloRZB58npN/2sgB7qpJT7bxCwiXK
 5rEVKxMNUsFXPykHaWUitzZVJsE8vOXQx4eVY2IbmJT9ZFHfeIaQLeMFr
 WyQnV5vO1WTpDsq05/po9tvsmnrhg923PbrjMQS71SOMJFP/2WWGBQVkD w==;
X-CSE-ConnectionGUID: CT/9IOiySV+NF1Yaf0DzHQ==
X-CSE-MsgGUID: MKxO9rRsRruR+LD0OfL6Bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="61687781"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="61687781"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 05:03:25 -0700
X-CSE-ConnectionGUID: Q8iMkYOBQkCzuyjZYn6AAA==
X-CSE-MsgGUID: A+qDEkteRm2Ny21VIf16wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="147557975"
Received: from artdev273.igk.intel.com ([172.28.176.71])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 05:03:23 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v4 0/9] Print/scan formatting fixups
Date: Tue, 27 May 2025 12:04:12 +0000
Message-Id: <20250527120421.79026-1-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
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

It was found that when compiling for other architectures,
due to difference in how these architectures recognize
how integers should be printed, warnings were thrown
in print/scan functions.

Fix them up using universal formatters like
for example PRIu64.

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

---

v2: various fixes for missing formatters, commit messages, and warnings
for additional configurations. Added cc's. Split patches into more
smaller patches. 
v3: Added rb's from v2. Fixed what had been found in v2 review.
Rebased to current HEAD, which added more things to correct in xe_pmu.c 
v4: Minor fixes.

---

Jan Sokolowski (9):
  lib/amdgpu: fixup print formatting for files in lib
  tests/amdgpu: fixup print formatting for files in tests
  lib/igt_nouveau: fixup print formatting for files in lib
  lib/igt_perf: fixup scan formatting for files in lib
  lib/xe/xe_sriov*: fixup print/scan formatting for files in lib
  tests/intel/xe_sriov*: fixup print formatting for files in tests
  runner: fixup print/scan formatting for files in runner
  tests/intel: fixup print formatting for files in intel tests
  tests/intel/xe_eudebug: fixup print formatting for xe_eudebug tests

 lib/amdgpu/amd_deadlock_helpers.c        | 19 ++++++++++---------
 lib/igt_nouveau.c                        |  2 +-
 lib/igt_perf.c                           |  3 ++-
 lib/xe/xe_sriov_debugfs.c                | 18 +++++++++---------
 lib/xe/xe_sriov_provisioning.c           |  2 +-
 runner/executor.c                        |  2 +-
 runner/settings.c                        |  2 +-
 tests/amdgpu/amd_freesync_video_mode.c   |  4 ++--
 tests/amdgpu/amd_info.c                  |  2 +-
 tests/amdgpu/amd_ras.c                   |  2 +-
 tests/intel/xe_compute_preempt.c         |  5 +++--
 tests/intel/xe_eu_stall.c                |  4 ++--
 tests/intel/xe_eudebug.c                 |  4 ++--
 tests/intel/xe_exec_capture.c            |  9 +++++----
 tests/intel/xe_exec_system_allocator.c   |  8 ++++----
 tests/intel/xe_oa.c                      |  6 +++---
 tests/intel/xe_pmu.c                     | 16 ++++++++--------
 tests/intel/xe_render_copy.c             |  2 +-
 tests/intel/xe_sriov_auto_provisioning.c |  6 +++---
 tests/intel/xe_sriov_flr.c               | 12 ++++++------
 tests/intel/xe_sriov_scheduling.c        |  4 ++--
 21 files changed, 68 insertions(+), 64 deletions(-)

-- 
2.34.1

