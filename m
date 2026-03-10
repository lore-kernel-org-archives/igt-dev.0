Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FC6FD4F03
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 16:40:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E884D10E2CA;
	Tue, 10 Mar 2026 16:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WAUmgqwd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E8B10E2CA
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 16:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773160847; x=1804696847;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3KHsCSESpRBjNc3Qsub5SYN8cHkKLThVvGGZ1vmznug=;
 b=WAUmgqwdSYfF+zS4vvxhS2PFB2Q1v8jSerJZNJeW42iB75JONYXSBcos
 BwvsHSqScY27nlGOtTfCYWbpDN9QyNFKnNPDUk89Gv4wUFB9v02BJVTge
 Xo7TqTv+S8AUt7sadSIbcBDE/B+DeuFeHRmAgqtmvUF0Q5yKCJoE5sdV6
 rLeDcf6vAK2sKSCio1c+fca5S2PS0Qwa0hhnRaF4xd/9hTIAG1EWdk1EK
 ojQBrl+zQAsAJZntSvi3Rp5VNL3pqLuaGg6PhaPNj58Pmw9PSvHC2LtbP
 nAp1C/WgCyg2nKB16A0PBMdpusgK1x2JopRr+RKXdqnIBcDfJBLWxC2O/ Q==;
X-CSE-ConnectionGUID: x/73MWzAQ8CVwaamS2QxIA==
X-CSE-MsgGUID: XmUxTfDhTlqTwzNzScApoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74115446"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="74115446"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 09:40:45 -0700
X-CSE-ConnectionGUID: feX6vC1lQTyBwYSTYQXyKA==
X-CSE-MsgGUID: kJ2WtHDLRUK9zamHT3Y61g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="216934051"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by fmviesa010.fm.intel.com with ESMTP; 10 Mar 2026 09:40:45 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>
Subject: [PATCH v4 0/4] lib/intel: switch graphics/IP version queries to
 fd-based APIs
Date: Tue, 10 Mar 2026 09:40:40 -0700
Message-ID: <20260310164044.1490471-1-x.wang@intel.com>
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
queries. It introduces fd‑based intel_gfx_ver()/intel_gfx_ver_major() using Xe
query data when available, keeps PCI ID translation as _from_pciid, and
updates libs/tests to use the fd‑based APIs. This aligns IGT with post‑MTL 
IP disaggregation while preserving i915 safety fallback.

Xin Wang (4):
  lib/intel: rename intel_gen() and intel_graphics_ver() to
    *_from_pciid() variants
  lib/intel: add fd-based graphics IP version query helpers
  intel/{lib,tests}: switch fd-backed version checks to intel_gfx_ver*
  lib/intel_device_info: remove the graphcs_rel from xe2+ devices

 benchmarks/gem_blt.c                     |  2 +-
 benchmarks/gem_busy.c                    |  2 +-
 benchmarks/gem_latency.c                 |  2 +-
 benchmarks/gem_wsim.c                    |  8 ++--
 benchmarks/intel_upload_blit_large.c     |  2 +-
 benchmarks/intel_upload_blit_large_gtt.c |  2 +-
 benchmarks/intel_upload_blit_large_map.c |  2 +-
 benchmarks/intel_upload_blit_small.c     |  2 +-
 lib/gpgpu_shader.c                       |  6 +--
 lib/gpu_cmds.c                           | 21 +++++----
 lib/i915/gem_engine_topology.c           | 10 ++---
 lib/i915/gem_mman.c                      |  2 +-
 lib/i915/gem_submission.c                |  8 ++--
 lib/i915/i915_crc.c                      |  6 +--
 lib/i915/intel_decode.c                  |  4 +-
 lib/igt_dummyload.c                      |  3 +-
 lib/igt_fb.c                             |  2 +-
 lib/igt_gt.c                             |  4 +-
 lib/igt_store.c                          |  2 +-
 lib/instdone.c                           |  2 +-
 lib/intel_batchbuffer.c                  | 56 ++++++++++++------------
 lib/intel_batchbuffer.h                  |  4 +-
 lib/intel_blt.c                          | 22 ++++------
 lib/intel_blt.h                          |  2 +-
 lib/intel_bufops.c                       | 10 ++---
 lib/intel_chipset.c                      | 43 ++++++++++++++++++
 lib/intel_chipset.h                      | 14 +++---
 lib/intel_common.c                       |  2 +-
 lib/intel_compute.c                      |  6 +--
 lib/intel_device_info.c                  | 32 +++++++++-----
 lib/intel_mmio.c                         |  8 ++--
 lib/intel_mocs.c                         | 13 +++---
 lib/intel_pat.c                          | 14 +++---
 lib/intel_reg_map.c                      |  2 +-
 lib/ioctl_wrappers.c                     |  2 +-
 lib/rendercopy_gen9.c                    | 24 +++++-----
 lib/xe/xe_legacy.c                       |  2 +-
 lib/xe/xe_oa.c                           |  4 +-
 lib/xe/xe_query.c                        | 25 +++++++++++
 lib/xe/xe_query.h                        |  1 +
 lib/xe/xe_spin.c                         |  4 +-
 lib/xe/xe_sriov_provisioning.c           |  4 +-
 tests/intel/api_intel_allocator.c        |  2 +-
 tests/intel/api_intel_bb.c               | 11 +++--
 tests/intel/gem_bad_reloc.c              |  4 +-
 tests/intel/gem_blits.c                  |  2 +-
 tests/intel/gem_close_race.c             |  2 +-
 tests/intel/gem_concurrent_all.c         |  2 +-
 tests/intel/gem_ctx_create.c             |  4 +-
 tests/intel/gem_ctx_engines.c            |  6 +--
 tests/intel/gem_ctx_isolation.c          | 14 +++---
 tests/intel/gem_ctx_shared.c             |  8 ++--
 tests/intel/gem_ctx_sseu.c               |  2 +-
 tests/intel/gem_eio.c                    |  6 +--
 tests/intel/gem_evict_alignment.c        |  6 +--
 tests/intel/gem_evict_everything.c       |  8 ++--
 tests/intel/gem_exec_async.c             |  2 +-
 tests/intel/gem_exec_await.c             |  2 +-
 tests/intel/gem_exec_balancer.c          |  4 +-
 tests/intel/gem_exec_big.c               |  2 +-
 tests/intel/gem_exec_capture.c           |  9 ++--
 tests/intel/gem_exec_fair.c              | 20 ++++-----
 tests/intel/gem_exec_fence.c             | 20 ++++-----
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
 tests/intel/gem_fenced_exec_thrash.c     |  5 +--
 tests/intel/gem_gpgpu_fill.c             |  2 +-
 tests/intel/gem_gtt_hog.c                |  2 +-
 tests/intel/gem_linear_blits.c           | 11 ++---
 tests/intel/gem_media_fill.c             |  2 +-
 tests/intel/gem_media_vme.c              |  2 +-
 tests/intel/gem_mmap_gtt.c               | 12 ++---
 tests/intel/gem_read_read_speed.c        |  4 +-
 tests/intel/gem_render_copy.c            | 10 ++---
 tests/intel/gem_ringfill.c               |  4 +-
 tests/intel/gem_set_tiling_vs_blt.c      |  2 +-
 tests/intel/gem_softpin.c                |  6 +--
 tests/intel/gem_streaming_writes.c       |  4 +-
 tests/intel/gem_sync.c                   |  8 ++--
 tests/intel/gem_tiled_fence_blits.c      |  4 +-
 tests/intel/gem_tiling_max_stride.c      |  8 ++--
 tests/intel/gem_userptr_blits.c          | 25 +++++------
 tests/intel/gem_vm_create.c              |  2 +-
 tests/intel/gem_watchdog.c               |  4 +-
 tests/intel/gem_workarounds.c            |  2 +-
 tests/intel/gen7_exec_parse.c            |  2 +-
 tests/intel/gen9_exec_parse.c            |  2 +-
 tests/intel/i915_getparams_basic.c       |  7 +--
 tests/intel/i915_module_load.c           |  2 +-
 tests/intel/i915_pm_rc6_residency.c      |  6 +--
 tests/intel/i915_pm_rpm.c                |  2 +-
 tests/intel/i915_pm_sseu.c               |  2 +-
 tests/intel/kms_ccs.c                    | 13 ++----
 tests/intel/kms_fbcon_fbt.c              |  2 +-
 tests/intel/kms_frontbuffer_tracking.c   | 11 +++--
 tests/intel/kms_pipe_stress.c            |  6 +--
 tests/intel/perf.c                       | 55 ++++++++++++-----------
 tests/intel/perf_pmu.c                   |  8 ++--
 tests/intel/sysfs_preempt_timeout.c      |  2 +-
 tests/intel/sysfs_timeslice_duration.c   |  2 +-
 tests/intel/xe_ccs.c                     | 16 +++----
 tests/intel/xe_compute.c                 |  8 ++--
 tests/intel/xe_copy_basic.c              |  6 +--
 tests/intel/xe_debugfs.c                 |  3 +-
 tests/intel/xe_eu_stall.c                |  4 +-
 tests/intel/xe_eudebug_online.c          |  9 ++--
 tests/intel/xe_evict.c                   |  6 +--
 tests/intel/xe_exec_fault_mode.c         |  2 +-
 tests/intel/xe_exec_multi_queue.c        |  2 +-
 tests/intel/xe_exec_store.c              |  6 +--
 tests/intel/xe_exec_threads.c            |  4 +-
 tests/intel/xe_fault_injection.c         |  2 +-
 tests/intel/xe_gpgpu_fill.c              |  2 +-
 tests/intel/xe_intel_bb.c                |  7 ++-
 tests/intel/xe_media_fill.c              |  2 +-
 tests/intel/xe_multigpu_svm.c            |  3 +-
 tests/intel/xe_oa.c                      | 23 +++++-----
 tests/intel/xe_pat.c                     | 38 +++++++---------
 tests/intel/xe_query.c                   |  4 +-
 tests/intel/xe_render_copy.c             |  3 +-
 tests/intel/xe_svm_usrptr_madvise.c      |  3 +-
 tests/prime_vgem.c                       |  2 +-
 tools/intel_dp_compliance.c              |  2 +-
 tools/intel_error_decode.c               | 12 ++---
 tools/intel_gtt.c                        | 12 ++---
 tools/intel_l3_parity.c                  |  2 +-
 tools/intel_reg.c                        |  6 +--
 tools/intel_reg_decode.c                 |  4 +-
 tools/intel_tiling_detect.c              |  2 +-
 tools/intel_vbt_decode.c                 |  2 +-
 139 files changed, 533 insertions(+), 497 deletions(-)

-- 
2.43.0

