Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC5EC44536
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 07:15:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BFEC10E8F8;
	Thu, 22 Jan 2026 07:15:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gi7aWY35";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791EE10E28B
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 07:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769066138; x=1800602138;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8Ef9WnB5Li39c+eRjkIV94YaMRnSMFEAqRERyi8qA0c=;
 b=gi7aWY35WfhvTVq6/oHh/1FerIn5jrsPjWHXaLrUY2GGGxzCOQk9sOem
 LLETLRadzDAuBw0gshKUvf8gkk4Yot2XDUSOzFnYraPeVXzea3JWMJUsm
 yKHaH/uCfSLw4Vlka55Bfg94cLPN5MoS+acL04ngCwHhc2FcPHb04pGIv
 L+Qmbkt0RFBeB48Ydh8Kdh9WQUHaveSXt6+Y4qQgzBrdb3SCFq3BYu02L
 tswkTBmqErRL5t1CazENgKS7aC07PWiYwMzsO9asJBMnspMKVwDb/wgKR
 5oyKO7DdTB2NS9dobNmAswAOsp3No2GlC2Uiw7ZuX6tkuZ9ZZFumsNvLw Q==;
X-CSE-ConnectionGUID: cJS3IN+iQmSp5MvAema9Dw==
X-CSE-MsgGUID: qXgNP3FpQcK+d/Cgmx1JLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="80925722"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="80925722"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 23:15:37 -0800
X-CSE-ConnectionGUID: WzgBKcsGQwmTtq00BOlp2A==
X-CSE-MsgGUID: 3k4qfW9CR6KcCduLRilI5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="206265587"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by fmviesa007.fm.intel.com with ESMTP; 21 Jan 2026 23:15:37 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>
Subject: [PATCH v2 0/3] lib/intel: switch graphics/IP version queries to
 fd-based APIs
Date: Thu, 22 Jan 2026 07:15:27 +0000
Message-ID: <20260122071530.1629046-1-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This series separates PCI ID–based device traits from per‑device IP version
queries. It introduces fd‑based intel_gen()/intel_graphics_ver() using Xe
query data when available, keeps PCI ID translation as _legacy, and
updates Xe‑side libs/tests to use the fd‑based APIs. This aligns IGT with
post‑MTL IP disaggregation while preserving i915 safety fallback.

V2:
- Rebased on latest master
- Enhanced patch 1 commit message to clarify it's a preparatory step

Xin Wang (3):
  lib/intel: suffix PCI ID based gen/graphics_ver with _legacy
  lib/intel: add fd-based intel_gen/intel_graphics_ver via Xe query
  intel/xe: use fd-based graphics/IP version helpers

 benchmarks/gem_blt.c                     |  2 +-
 benchmarks/gem_busy.c                    |  2 +-
 benchmarks/gem_latency.c                 |  2 +-
 benchmarks/gem_wsim.c                    |  8 ++--
 benchmarks/intel_upload_blit_large.c     |  2 +-
 benchmarks/intel_upload_blit_large_gtt.c |  2 +-
 benchmarks/intel_upload_blit_large_map.c |  2 +-
 benchmarks/intel_upload_blit_small.c     |  2 +-
 lib/gpgpu_shader.c                       |  5 +--
 lib/gpu_cmds.c                           | 21 +++++-----
 lib/i915/gem_engine_topology.c           |  6 +--
 lib/i915/gem_mman.c                      |  2 +-
 lib/i915/gem_submission.c                |  8 ++--
 lib/i915/i915_crc.c                      |  4 +-
 lib/i915/intel_decode.c                  |  4 +-
 lib/igt_dummyload.c                      |  2 +-
 lib/igt_gt.c                             |  4 +-
 lib/igt_store.c                          |  2 +-
 lib/instdone.c                           |  2 +-
 lib/intel_batchbuffer.c                  | 18 ++++----
 lib/intel_blt.c                          | 21 ++++------
 lib/intel_blt.h                          |  2 +-
 lib/intel_bufops.c                       | 10 ++---
 lib/intel_chipset.c                      | 51 +++++++++++++++++++++++
 lib/intel_chipset.h                      | 14 ++++---
 lib/intel_common.c                       |  2 +-
 lib/intel_compute.c                      |  6 +--
 lib/intel_device_info.c                  |  6 +--
 lib/intel_mmio.c                         |  8 ++--
 lib/intel_mocs.c                         | 48 +++++++++++-----------
 lib/intel_pat.c                          | 19 ++++-----
 lib/intel_reg_map.c                      |  2 +-
 lib/ioctl_wrappers.c                     |  2 +-
 lib/rendercopy_gen9.c                    | 22 +++++-----
 lib/xe/xe_legacy.c                       |  2 +-
 lib/xe/xe_oa.c                           |  4 +-
 lib/xe/xe_query.c                        | 25 ++++++++++++
 lib/xe/xe_query.h                        |  1 +
 lib/xe/xe_spin.c                         |  4 +-
 lib/xe/xe_sriov_provisioning.c           |  4 +-
 tests/intel/api_intel_allocator.c        |  2 +-
 tests/intel/api_intel_bb.c               | 10 ++---
 tests/intel/gem_bad_reloc.c              |  4 +-
 tests/intel/gem_blits.c                  |  2 +-
 tests/intel/gem_close_race.c             |  2 +-
 tests/intel/gem_concurrent_all.c         |  2 +-
 tests/intel/gem_ctx_create.c             |  4 +-
 tests/intel/gem_ctx_engines.c            |  6 +--
 tests/intel/gem_ctx_isolation.c          | 14 +++----
 tests/intel/gem_ctx_shared.c             |  8 ++--
 tests/intel/gem_ctx_sseu.c               |  2 +-
 tests/intel/gem_eio.c                    |  6 +--
 tests/intel/gem_evict_alignment.c        |  6 +--
 tests/intel/gem_evict_everything.c       |  8 ++--
 tests/intel/gem_exec_async.c             |  2 +-
 tests/intel/gem_exec_await.c             |  2 +-
 tests/intel/gem_exec_balancer.c          |  4 +-
 tests/intel/gem_exec_big.c               |  2 +-
 tests/intel/gem_exec_capture.c           |  6 +--
 tests/intel/gem_exec_fair.c              | 20 ++++-----
 tests/intel/gem_exec_fence.c             | 18 ++++----
 tests/intel/gem_exec_flush.c             |  4 +-
 tests/intel/gem_exec_gttfill.c           |  2 +-
 tests/intel/gem_exec_latency.c           |  6 +--
 tests/intel/gem_exec_nop.c               |  4 +-
 tests/intel/gem_exec_parallel.c          |  2 +-
 tests/intel/gem_exec_params.c            |  8 ++--
 tests/intel/gem_exec_reloc.c             | 10 ++---
 tests/intel/gem_exec_schedule.c          | 20 ++++-----
 tests/intel/gem_exec_store.c             |  6 +--
 tests/intel/gem_exec_suspend.c           |  2 +-
 tests/intel/gem_exec_whisper.c           |  6 +--
 tests/intel/gem_fenced_exec_thrash.c     |  2 +-
 tests/intel/gem_gtt_hog.c                |  2 +-
 tests/intel/gem_linear_blits.c           |  8 ++--
 tests/intel/gem_media_vme.c              |  2 +-
 tests/intel/gem_mmap_gtt.c               | 12 +++---
 tests/intel/gem_read_read_speed.c        |  2 +-
 tests/intel/gem_render_copy.c            |  8 ++--
 tests/intel/gem_ringfill.c               |  4 +-
 tests/intel/gem_set_tiling_vs_blt.c      |  2 +-
 tests/intel/gem_softpin.c                |  6 +--
 tests/intel/gem_streaming_writes.c       |  4 +-
 tests/intel/gem_sync.c                   |  8 ++--
 tests/intel/gem_tiled_fence_blits.c      |  4 +-
 tests/intel/gem_tiling_max_stride.c      |  8 ++--
 tests/intel/gem_userptr_blits.c          | 20 ++++-----
 tests/intel/gem_vm_create.c              |  2 +-
 tests/intel/gem_watchdog.c               |  4 +-
 tests/intel/gem_workarounds.c            |  2 +-
 tests/intel/gen7_exec_parse.c            |  2 +-
 tests/intel/gen9_exec_parse.c            |  2 +-
 tests/intel/i915_getparams_basic.c       |  6 +--
 tests/intel/i915_module_load.c           |  2 +-
 tests/intel/i915_pm_rc6_residency.c      |  6 +--
 tests/intel/i915_pm_rpm.c                |  2 +-
 tests/intel/i915_pm_sseu.c               |  2 +-
 tests/intel/kms_ccs.c                    | 13 ++----
 tests/intel/kms_fbcon_fbt.c              |  2 +-
 tests/intel/kms_frontbuffer_tracking.c   |  6 +--
 tests/intel/kms_pipe_stress.c            |  4 +-
 tests/intel/perf.c                       | 52 ++++++++++++------------
 tests/intel/perf_pmu.c                   |  8 ++--
 tests/intel/sysfs_preempt_timeout.c      |  2 +-
 tests/intel/sysfs_timeslice_duration.c   |  2 +-
 tests/intel/xe_ccs.c                     | 16 ++++----
 tests/intel/xe_compute.c                 |  8 ++--
 tests/intel/xe_copy_basic.c              |  6 +--
 tests/intel/xe_debugfs.c                 |  3 +-
 tests/intel/xe_eudebug_online.c          |  8 +---
 tests/intel/xe_exec_multi_queue.c        |  2 +-
 tests/intel/xe_exec_store.c              | 18 ++++----
 tests/intel/xe_fault_injection.c         |  8 ++--
 tests/intel/xe_intel_bb.c                |  7 ++--
 tests/intel/xe_multigpu_svm.c            |  3 +-
 tests/intel/xe_oa.c                      | 22 +++++-----
 tests/intel/xe_pat.c                     | 16 +++-----
 tests/intel/xe_query.c                   |  4 +-
 tests/intel/xe_render_copy.c             |  2 +-
 tests/prime_vgem.c                       |  2 +-
 tools/intel_dp_compliance.c              |  2 +-
 tools/intel_error_decode.c               | 12 +++---
 tools/intel_gtt.c                        | 12 +++---
 tools/intel_l3_parity.c                  |  2 +-
 tools/intel_reg.c                        |  6 +--
 tools/intel_reg_decode.c                 |  4 +-
 tools/intel_tiling_detect.c              |  2 +-
 tools/intel_vbt_decode.c                 |  2 +-
 128 files changed, 486 insertions(+), 445 deletions(-)

-- 
2.43.0

