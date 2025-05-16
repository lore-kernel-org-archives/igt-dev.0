Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CE7C3ABC9
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 11:57:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2207E10E139;
	Fri, 16 May 2025 11:57:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bANymt7G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE04F10E139
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 11:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747396647; x=1778932647;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i7ObK9NkxCjACNwFBVjnRrwXCoCk3gc0JnnbnHEPmfw=;
 b=bANymt7Gf0Xje/iR98f4Ys/g2/XrFUkFpj3DGoNVCRJEkGkwUTvUnpO6
 paQiSUck45rTzSyUAkNcmfG0dgqnolyCGyqWCxyon+cvjA3Odv20W5kYP
 NJT1FUpJ108oubeSaJx90G0bJth1pSohpB5TZ09RuKOmGYazG/hoaaEw1
 CpOzBJHlptDE21tvhoc9yw4LxUc6/M+9noHwH4wA2Uan9KfBqvzLUKLh6
 xy8AuvgTBJsTGD4tkS93vyl5v2hDc2oeMeiPmjfHDiAQ+kGkBC38Zs3X4
 4zgKdqGIbPSZ6AkL1Zybo2AIIyGDjHwA/lCCgy8Uh9y4l5h/TZhQYp8or w==;
X-CSE-ConnectionGUID: 3ZB6ESfQSrCz6OjGLvrtvw==
X-CSE-MsgGUID: GnlTz9q8R829Cs4PA0y6NA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="36983594"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="36983594"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 04:57:27 -0700
X-CSE-ConnectionGUID: wvKn8c4iSM+DK5o1yFhuKA==
X-CSE-MsgGUID: 0yZ32NyWSRyCUJiXTH06Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="139074987"
Received: from artdev273.igk.intel.com ([172.28.176.71])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 04:57:25 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>
Subject: [PATCH i-g-t v1 0/4] Print/scan formatting fixups
Date: Fri, 16 May 2025 11:58:07 +0000
Message-Id: <20250516115811.135889-1-jan.sokolowski@intel.com>
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

Jan Sokolowski (4):
  lib: fixup print/scan formatting for files in lib
  runner: fixup print/scan formatting for files in runner
  tests/amdgpu: fixup print/scan formatting for amdgpu tests
  tests/intel: fixup print/scan formatting for intel test files

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
 tests/intel/xe_exec_capture.c            |  9 +++++----
 tests/intel/xe_exec_system_allocator.c   | 10 +++++-----
 tests/intel/xe_oa.c                      |  6 +++---
 tests/intel/xe_pmu.c                     | 12 ++++++------
 tests/intel/xe_render_copy.c             |  2 +-
 tests/intel/xe_sriov_auto_provisioning.c |  6 +++---
 tests/intel/xe_sriov_flr.c               | 12 ++++++------
 tests/intel/xe_sriov_scheduling.c        |  4 ++--
 20 files changed, 65 insertions(+), 61 deletions(-)

-- 
2.34.1

