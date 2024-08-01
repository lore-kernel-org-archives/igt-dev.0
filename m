Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12718C3DA64
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 06:35:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A9510E89B;
	Thu,  1 Aug 2024 06:35:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="exUjqZSi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCEB310E89B
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 06:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722494120; x=1754030120;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0RBAfxfNWQs50dq2/Ga+EyLytnlh7KUWlO5IVvteUS8=;
 b=exUjqZSiwSSTs009uCod9ny4Y3gCb3WexUPRiaEU11e8V0dw6+9KNltl
 Q9Rc0anJbQoiiBluqkSl5ApWPwdQAuMxj5NYp6zILDL4EDYb11QeZ7AnF
 UC+2KlgjaKhqIeaWcKUc3fodtsfj3Qq4GWc3Dz2SipZVvP7n6LuIepkSy
 0w/34SLMoLPkjZXuiNH2W4Vju09TG1o7bizCDUYiXVGWbYaa5ahmLqcQZ
 85SzV91rGlu7eFY8cS/7xkbwr0rujAvkCUkjHo5t7xvuDo/botZtlijf3
 RY49hyO9kpJhJGz8TRNtZw1dYZ7kECCadoNXiG2QDI8QtvzbE5ld7qToZ A==;
X-CSE-ConnectionGUID: 3XSOGMGmT1yO465VnZgB6Q==
X-CSE-MsgGUID: 3gB+YEf2Rry74hycji+lGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31809778"
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; d="scan'208";a="31809778"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 23:35:19 -0700
X-CSE-ConnectionGUID: twHbHPP8SsKEueRThTDdTQ==
X-CSE-MsgGUID: aPxS3fouT/+zw8HL78aGhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; d="scan'208";a="59727528"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 23:35:17 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t 0/3] Apply igt.cocci transforms
Date: Thu,  1 Aug 2024 11:55:59 +0530
Message-ID: <20240801062602.2047179-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
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

A number of KMS & Intel tests are using checks like "igt_assert(x < y)"
rather than using the dedicated comparison assertions that print the actual
values on assertion failure. This series applies the igt.cocci transforms
on all KMS & Intel tests.

Bhanuprakash Modem (1):
  tests/kms: Apply igt.cocci transforms

Matt Roper (2):
  lib: Add u32 variants of igt_assert_{lt,lte}
  tests/intel: Apply igt.cocci transforms

 lib/igt_core.h                      | 18 +++++++
 tests/intel/api_intel_allocator.c   | 12 ++---
 tests/intel/api_intel_bb.c          | 18 +++----
 tests/intel/drm_fdinfo.c            |  8 +--
 tests/intel/gem_blits.c             | 16 +++---
 tests/intel/gem_ccs.c               |  4 +-
 tests/intel/gem_close_race.c        |  2 +-
 tests/intel/gem_concurrent_all.c    |  8 +--
 tests/intel/gem_create.c            |  2 +-
 tests/intel/gem_ctx_create.c        |  8 +--
 tests/intel/gem_ctx_exec.c          |  4 +-
 tests/intel/gem_ctx_persistence.c   | 12 +++--
 tests/intel/gem_eio.c               |  8 +--
 tests/intel/gem_exec_alignment.c    |  6 ++-
 tests/intel/gem_exec_big.c          |  4 +-
 tests/intel/gem_exec_capture.c      |  8 +--
 tests/intel/gem_exec_fair.c         | 32 +++++++-----
 tests/intel/gem_exec_fence.c        |  2 +-
 tests/intel/gem_exec_gttfill.c      |  4 +-
 tests/intel/gem_exec_nop.c          |  2 +-
 tests/intel/gem_exec_reloc.c        |  4 +-
 tests/intel/gem_gtt_speed.c         |  2 +-
 tests/intel/gem_linear_blits.c      |  6 +--
 tests/intel/gem_pread.c             |  5 +-
 tests/intel/gem_pwrite.c            |  5 +-
 tests/intel/gem_pxp.c               | 16 +++---
 tests/intel/gem_reset_stats.c       |  8 +--
 tests/intel/gem_softpin.c           |  8 ++-
 tests/intel/gem_tiled_blits.c       |  6 +--
 tests/intel/gem_tiled_fence_blits.c |  4 +-
 tests/intel/gem_userptr_blits.c     |  4 +-
 tests/intel/gem_wait.c              |  8 +--
 tests/intel/gem_watchdog.c          |  2 +-
 tests/intel/i915_hangman.c          |  2 +-
 tests/intel/i915_module_load.c      |  6 +--
 tests/intel/i915_pm_freq_api.c      | 50 +++++++++---------
 tests/intel/i915_pm_rc6_residency.c |  4 +-
 tests/intel/i915_pm_rps.c           | 11 ++--
 tests/intel/i915_query.c            | 12 ++---
 tests/intel/kms_big_fb.c            |  2 +-
 tests/intel/kms_busy.c              |  2 +-
 tests/intel/kms_ccs.c               | 14 +++--
 tests/intel/kms_cdclk.c             |  5 +-
 tests/intel/kms_dsc_helper.c        |  4 +-
 tests/intel/kms_fbcon_fbt.c         |  3 +-
 tests/intel/kms_pm_dc.c             |  9 ++--
 tests/intel/kms_pm_rpm.c            |  2 +-
 tests/intel/kms_psr.c               | 18 +++----
 tests/intel/perf.c                  | 34 ++++++-------
 tests/intel/perf_pmu.c              | 37 +++++++-------
 tests/intel/xe_ccs.c                |  4 +-
 tests/intel/xe_debugfs.c            |  2 +-
 tests/intel/xe_dma_buf_sync.c       |  2 +-
 tests/intel/xe_evict.c              |  4 +-
 tests/intel/xe_exec_balancer.c      |  7 +--
 tests/intel/xe_exec_basic.c         |  4 +-
 tests/intel/xe_exec_compute_mode.c  |  9 ++--
 tests/intel/xe_exec_fault_mode.c    |  5 +-
 tests/intel/xe_exec_reset.c         |  8 +--
 tests/intel/xe_exec_store.c         |  2 +-
 tests/intel/xe_exec_threads.c       | 11 ++--
 tests/intel/xe_gt_freq.c            | 79 +++++++++++++++--------------
 tests/intel/xe_intel_bb.c           | 16 +++---
 tests/intel/xe_oa.c                 | 26 +++++-----
 tests/intel/xe_pat.c                |  2 +-
 tests/intel/xe_peer2peer.c          |  2 +-
 tests/intel/xe_pm.c                 | 16 +++---
 tests/intel/xe_pm_residency.c       |  4 +-
 tests/intel/xe_query.c              | 12 ++---
 tests/intel/xe_vm.c                 |  4 +-
 tests/kms_async_flips.c             | 22 ++++----
 tests/kms_atomic_transition.c       |  6 +--
 tests/kms_cursor_legacy.c           |  2 +-
 tests/kms_dither.c                  |  2 +-
 tests/kms_dp_aux_dev.c              |  4 +-
 tests/kms_hdmi_inject.c             | 12 ++---
 tests/kms_lease.c                   |  8 +--
 tests/kms_plane.c                   |  9 ++--
 tests/kms_plane_multiple.c          |  2 +-
 tests/kms_prime.c                   |  6 +--
 tests/kms_properties.c              |  6 +--
 tests/kms_setmode.c                 |  2 +-
 tests/kms_tiled_display.c           |  2 +-
 tests/kms_vrr.c                     |  2 +-
 tests/kms_writeback.c               | 10 ++--
 85 files changed, 405 insertions(+), 380 deletions(-)

-- 
2.43.2

