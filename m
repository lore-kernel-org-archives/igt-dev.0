Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62158C2D0CD
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 11:29:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D0DC10E2E8;
	Mon, 19 May 2025 11:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XgMXw4xV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B906010E293
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 11:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747654167; x=1779190167;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Gb16TkdimV1RJiGKwMx2a0hqKCF4Ko2fQGDMk7kKPU0=;
 b=XgMXw4xVafvs/wgZXVn7id6cs5tDYtfXmb8jgWEu+jp24LmlKV6s5lAS
 MnqbO5ySp6MydakbLhKqwL4NFAwE6ThLXOcKJ7JgmBXTYEoSgmKMG8ti0
 PEqNJLSoIqCK33uEOgz4FKOjm80SAEOPTebEjgrI67mY3Hb1U8bgLAho4
 AU1cA6j1/rzxldMOysuAwOYA0SpqH7ylJvlQdiIHnHkG6ZPn+6zQ9Fw7H
 UIbLJTeBUb8UbVMdy1gpPJmxVM3Nmi3Dwm0zdr7LL6GDc02hvk9mXQM9j
 +STkwqAGFh4KhJa9nec3zrK+552x1qiQc4FZqIlegPHXVqegpQvqwNScK Q==;
X-CSE-ConnectionGUID: Hak+3nRdRc6/jIdWgzp+Vw==
X-CSE-MsgGUID: 9VF4ju1SR0qLiEQYvMdyEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="53347304"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="53347304"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 04:29:26 -0700
X-CSE-ConnectionGUID: bKOkARJUQouwnAKHE2pDtw==
X-CSE-MsgGUID: FBLhDTZeSMmOH1fp8E6t4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="139385780"
Received: from artdev273.igk.intel.com ([172.28.176.71])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 04:29:25 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 0/8] Print/scan formatting fixups
Date: Mon, 19 May 2025 11:30:02 +0000
Message-Id: <20250519113010.125751-1-jan.sokolowski@intel.com>
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

---

Jan Sokolowski (8):
  lib/amdgpu: fixup print/scan formatting for files in lib
  tests/amdgpu: fixup print/scan formatting for files in tests
  lib/igt_nouveau: fixup print/scan formatting for files in lib
  lib/igt_perf: fixup print/scan formatting for files in lib
  lib/xe/xe_sriov*: fixup print/scan formatting for files in lib
  tests/intel/xe_sriov*: fixup print/scan formatting for files in tests
  runner: fixup print/scan formatting for files in runner
  tests/intel: fixup print/scan formatting for files in intel tests

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
 tests/intel/xe_pmu.c                     | 12 ++++++------
 tests/intel/xe_render_copy.c             |  2 +-
 tests/intel/xe_sriov_auto_provisioning.c |  6 +++---
 tests/intel/xe_sriov_flr.c               | 12 ++++++------
 tests/intel/xe_sriov_scheduling.c        |  4 ++--
 21 files changed, 66 insertions(+), 62 deletions(-)

-- 
2.34.1

