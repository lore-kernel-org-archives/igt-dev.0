Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F9CC5475B
	for <igt-dev@archiver.kernel.org>; Fri,  1 Mar 2024 09:09:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62DE210E0C7;
	Fri,  1 Mar 2024 09:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A1FfslIG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2896210E0C7
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Mar 2024 09:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709284140; x=1740820140;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bQ4lIW7W+lZ9VIXLShFgtM2FV5WFB51lb8AKLeWBvdU=;
 b=A1FfslIGzW02xutjwVsDhxM6Bi8UEuyEWNptC7EHzxqMQdQDo7fVhoTN
 T4iySV2hNBiN6yp29ccHreaqD3ZpV+jCCqHY3GdDDhEo0GPzXHaBH2Xxv
 Qyzz4tWoJ8tTHU6JOAbdZvVk1lIKHMDb28tDdzybntLycWKqb0Eaz07Bp
 +OE8WcB+ypcU7DPeihZLZgMaUftE+lCXppGRU9G6GiOy/EKPCFmcSNDkZ
 dFqZYpsBBgDbBkwfsW91w7htXxc8DJrg/hyB1cu8yRc3gBaZvhB/mxroC
 wh0BbKREn+nfuqBtZt5RJFPma29Iyp9zlXpzmN6mLjDekDloBijNfjsTo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3931250"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="3931250"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 01:09:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="8037705"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 01:08:54 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 0/5] IGT documentation refactoring
Date: Fri,  1 Mar 2024 09:08:39 +0000
Message-Id: <20240301090844.671493-1-katarzyna.piecielska@intel.com>
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

First series to unify XE and i915 test documentation. This series is just first
step to refactor what is already documented, like remove duplications, change
layout etc.
This series is not addressing huge amount of warnings that we have now while
building IGTs, but will make review process easier.

Warnings of missing documentation fields will come as next series.

v2: Address review comments for commit messages. Fix checkpatch warnings. Fix
issue with patch1 application.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Katarzyna Piecielska (5):
  tests: Documentation refactoring part 1
  tests/intel: Documentation refactoring part 2
  tests/intel: Documentation refactoring part 3
  tests/intel: Documentation refactoring part 4
  test/intel: Documentation refactoring part 5

 tests/core_hotunplug.c                 |  57 ++---
 tests/device_reset.c                   |  11 +-
 tests/dmabuf.c                         |  13 +-
 tests/drm_mm.c                         |  84 +------
 tests/intel/api_intel_allocator.c      |  46 +---
 tests/intel/api_intel_bb.c             | 152 +-----------
 tests/intel/debugfs_test.c             |  32 +--
 tests/intel/gem_basic.c                |  22 +-
 tests/intel/gem_blits.c                |   2 +-
 tests/intel/gem_busy.c                 |  42 ++--
 tests/intel/gem_ccs.c                  |   9 +-
 tests/intel/gem_close_race.c           |  39 +--
 tests/intel/gem_create.c               |  87 ++-----
 tests/intel/gem_ctx_create.c           |  77 ++----
 tests/intel/gem_ctx_exec.c             |  51 ++--
 tests/intel/gem_ctx_isolation.c        |  43 +---
 tests/intel/gem_ctx_param.c            | 144 +++--------
 tests/intel/gem_ctx_persistence.c      | 117 +--------
 tests/intel/gem_ctx_shared.c           |  42 +---
 tests/intel/gem_eio.c                  | 133 +---------
 tests/intel/gem_exec_balancer.c        | 139 +----------
 tests/intel/gem_exec_basic.c           |  13 +-
 tests/intel/gem_exec_big.c             |   8 +-
 tests/intel/gem_exec_capture.c         |  25 +-
 tests/intel/gem_exec_create.c          |  48 ++--
 tests/intel/gem_exec_fence.c           | 277 +++++----------------
 tests/intel/gem_exec_gttfill.c         |  23 +-
 tests/intel/gem_exec_nop.c             |  27 +--
 tests/intel/gem_exec_parallel.c        |  37 +--
 tests/intel/gem_exec_params.c          | 112 +--------
 tests/intel/gem_exec_schedule.c        | 324 +------------------------
 tests/intel/gem_exec_suspend.c         |  40 +--
 tests/intel/gem_exec_whisper.c         | 181 +-------------
 tests/intel/gem_flink_basic.c          |  35 +--
 tests/intel/gem_linear_blits.c         |  23 +-
 tests/intel/gem_lmem_swapping.c        | 101 +-------
 tests/intel/gem_madvise.c              |  29 +--
 tests/intel/gem_mmap.c                 |  34 +--
 tests/intel/gem_mmap_gtt.c             | 175 +------------
 tests/intel/gem_mmap_offset.c          |  75 +-----
 tests/intel/gem_mmap_wc.c              |  43 +---
 tests/intel/gem_partial_pwrite_pread.c |  48 ++--
 tests/intel/gem_ppgtt.c                |  16 +-
 tests/intel/gem_pxp.c                  |  24 +-
 tests/intel/gem_render_linear_blits.c  |   4 +-
 tests/intel/gem_render_tiled_blits.c   |  17 +-
 tests/intel/gem_ringfill.c             |  30 +--
 tests/intel/gem_shrink.c               |   8 +-
 tests/intel/gem_softpin.c              | 134 +---------
 tests/intel/gem_spin_batch.c           |  60 +----
 tests/intel/gem_sync.c                 |  86 +------
 tests/intel/gem_tiled_blits.c          |   3 +-
 tests/intel/gem_userptr_blits.c        | 247 +------------------
 tests/intel/gem_wait.c                 |  34 +--
 tests/intel/gem_workarounds.c          |  43 +---
 tests/intel/i915_module_load.c         |  23 +-
 tests/intel/i915_pm_rc6_residency.c    |   6 +-
 tests/intel/i915_pm_rpm.c              |  50 +---
 tests/intel/i915_pm_rps.c              |  34 +--
 tests/intel/i915_query.c               |  50 +---
 tests/intel/i915_suspend.c             |  31 +--
 tests/intel/perf.c                     |  54 +----
 tests/intel/perf_pmu.c                 |  73 +-----
 tests/intel/sysfs_heartbeat_interval.c |   6 +-
 tests/intel/sysfs_preempt_timeout.c    |  15 +-
 tests/intel/sysfs_timeslice_duration.c |  17 +-
 tests/prime_vgem.c                     |  57 +----
 tests/vgem_basic.c                     |  30 +--
 68 files changed, 534 insertions(+), 3638 deletions(-)

-- 
2.34.1

