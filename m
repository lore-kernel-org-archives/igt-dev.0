Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5112FC48BF6
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 11:16:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3FBA10FFFC;
	Mon,  4 Mar 2024 11:16:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="erBn5BHv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4A610FFFC
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 11:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709551014; x=1741087014;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=44UQXZJinW54Ksp0QhNaSnVpYarPFr5iRxgV0IUUnu4=;
 b=erBn5BHv5sVzQLyQ3IJMX/529iF7i9OCXmghX6NhrxbKVWVjVvOi/96/
 ZvjrndT4/7X+tIHcDm9uzM4iEyWhtthIA9v/kOuZZr+9sqCArFRMsTJ2O
 rSzxtJyoeO1WoGpx3MS+3iEQ190m6d8eDyisvFPWVw+IrIz/XSK8NV2WW
 maLn8fhAWD9sxjHFhfMXoPd14+w0bS2K3cxoiMGIExEmTxDUwOi3sZb2Z
 4XzTSCxymPzjSR0V0AOTfv0y9l5UkrfwV89sfTochLVVdk1Jt7KuNztu+
 eQhHrq1gVZZxSHtUHhdQ7b1WXZJ9fLtReleIvh3sjkG8Gqqdx0P7MQwLJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="14745594"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="14745594"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 03:16:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="9144587"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 03:16:34 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 00/24] Update test documentation for i915 tests
Date: Mon,  4 Mar 2024 11:15:53 +0000
Message-Id: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
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

There are many warnings about missing test documentation, so let's fix that.
While I am already doing that - let's introduce more subcategories and
functionalities. Additionally adjust categorization for all i915 tests.

Last patch is removing 'Run type' field from all Intel tests - both XE and i915.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Katarzyna Piecielska (24):
  tests: Introduce uapi subcategory
  tests/intel: Introduce Memory management subcategory
  tests/intel: Introduce Fences subcategory
  tests/intel: Introduce CMD submission subcategory
  tests/intel: Introduce Caching subcategory
  tests/intel: Introduce Context subcategory
  tests/intel: Introduce GPGPU subcategory
  tests/intel: Introduce Blitter subcategory
  tests/intel: Introduce FDinfo subcategory
  tests/intel: Introduce Flat-ccs subcategory
  tests/intel: Introduce HUC subcategory
  tests/intel: Introduce Media subcategory
  tests/intel: Introduce Render copy subcategory
  tests/intel: Introduce Obsolete subcategory
  tests/intel: Introduce Power management subcategory
  tests/intel: Introduce SysMan subcategory
  tests: Introduce Core subcategory
  tests: Introduce Synchronization subcategory
  tests: Introduce intel-nouveau subcategory
  tests/intel: Introduce Debugging subcategory
  tests/intel: Add missing documentation fields in i915_selftest
  tests/intel: Add more tests to Performance subcategory
  tests: Add missing documentation fields for SRIOV and Display
  tests: Remove 'Run type' documentation field

 tests/core_auth.c                            |   8 +-
 tests/core_getclient.c                       |   2 +-
 tests/core_getstats.c                        |   6 +-
 tests/core_getversion.c                      |   2 +-
 tests/core_hotunplug.c                       |   4 +-
 tests/core_setmaster.c                       |   2 +-
 tests/core_setmaster_vs_auth.c               |   2 +-
 tests/device_reset.c                         |   2 +-
 tests/dmabuf.c                               |   2 +-
 tests/dmabuf_sync_file.c                     |  18 +
 tests/drm_mm.c                               |   4 +-
 tests/drm_read.c                             |  17 +
 tests/dumb_buffer.c                          |   8 +-
 tests/intel/api_intel_allocator.c            |   2 +-
 tests/intel/api_intel_bb.c                   |   2 +-
 tests/intel/debugfs_test.c                   |   6 +-
 tests/intel/drm_fdinfo.c                     |   5 +-
 tests/intel/gem_bad_reloc.c                  |  16 +-
 tests/intel/gem_barrier_race.c               |   5 +-
 tests/intel/gem_basic.c                      |   4 +-
 tests/intel/gem_blits.c                      |   2 +-
 tests/intel/gem_busy.c                       |   4 +-
 tests/intel/gem_caching.c                    |   6 +-
 tests/intel/gem_ccs.c                        |   5 +-
 tests/intel/gem_close.c                      |   4 +-
 tests/intel/gem_close_race.c                 |   6 +-
 tests/intel/gem_compute.c                    |   2 +-
 tests/intel/gem_create.c                     |  17 +-
 tests/intel/gem_cs_tlb.c                     |   6 +-
 tests/intel/gem_ctx_bad_destroy.c            |   6 +-
 tests/intel/gem_ctx_create.c                 |   6 +-
 tests/intel/gem_ctx_engines.c                |   6 +-
 tests/intel/gem_ctx_exec.c                   |   4 +-
 tests/intel/gem_ctx_freq.c                   |   2 +-
 tests/intel/gem_ctx_isolation.c              |   2 +-
 tests/intel/gem_ctx_param.c                  |   2 +-
 tests/intel/gem_ctx_persistence.c            |   2 +-
 tests/intel/gem_ctx_shared.c                 |   2 +-
 tests/intel/gem_ctx_sseu.c                   |   5 +-
 tests/intel/gem_ctx_switch.c                 |   5 +-
 tests/intel/gem_eio.c                        |   2 +-
 tests/intel/gem_evict_alignment.c            |   5 +-
 tests/intel/gem_evict_everything.c           |   5 +-
 tests/intel/gem_exec_alignment.c             |   6 +-
 tests/intel/gem_exec_async.c                 |   6 +-
 tests/intel/gem_exec_await.c                 |   6 +-
 tests/intel/gem_exec_balancer.c              |   2 +-
 tests/intel/gem_exec_basic.c                 |   2 +-
 tests/intel/gem_exec_big.c                   |   2 +-
 tests/intel/gem_exec_capture.c               |   2 +-
 tests/intel/gem_exec_create.c                |   4 +-
 tests/intel/gem_exec_endless.c               |   8 +-
 tests/intel/gem_exec_fair.c                  |   5 +-
 tests/intel/gem_exec_fence.c                 |  10 +-
 tests/intel/gem_exec_flush.c                 |   5 +-
 tests/intel/gem_exec_gttfill.c               |   4 +-
 tests/intel/gem_exec_latency.c               |   5 +-
 tests/intel/gem_exec_lut_handle.c            |   5 +-
 tests/intel/gem_exec_nop.c                   |   6 +-
 tests/intel/gem_exec_parallel.c              |   4 +-
 tests/intel/gem_exec_params.c                |   2 +-
 tests/intel/gem_exec_reloc.c                 |   5 +-
 tests/intel/gem_exec_schedule.c              |   2 +-
 tests/intel/gem_exec_store.c                 |  20 +-
 tests/intel/gem_exec_suspend.c               |   5 +-
 tests/intel/gem_exec_whisper.c               |   6 +-
 tests/intel/gem_exercise_blt.c               |  14 +-
 tests/intel/gem_fd_exhaustion.c              |   5 +-
 tests/intel/gem_fence_thrash.c               |   5 +-
 tests/intel/gem_fence_upload.c               |   5 +-
 tests/intel/gem_fenced_exec_thrash.c         |   5 +-
 tests/intel/gem_flink_basic.c                |   2 +-
 tests/intel/gem_flink_race.c                 |   2 +-
 tests/intel/gem_gpgpu_fill.c                 |   8 +-
 tests/intel/gem_gtt_cpu_tlb.c                |   5 +-
 tests/intel/gem_gtt_hog.c                    |   5 +-
 tests/intel/gem_gtt_speed.c                  |   5 +-
 tests/intel/gem_huc_copy.c                   |   5 +-
 tests/intel/gem_linear_blits.c               |   4 +-
 tests/intel/gem_lmem_evict.c                 |   5 +-
 tests/intel/gem_lmem_swapping.c              |  10 +-
 tests/intel/gem_lut_handle.c                 |   5 +-
 tests/intel/gem_madvise.c                    |   4 +-
 tests/intel/gem_media_fill.c                 |   5 +-
 tests/intel/gem_media_vme.c                  |   5 +-
 tests/intel/gem_mmap.c                       |   7 +-
 tests/intel/gem_mmap_gtt.c                   |   5 +-
 tests/intel/gem_mmap_offset.c                |   2 +-
 tests/intel/gem_mmap_wc.c                    |   5 +-
 tests/intel/gem_partial_pwrite_pread.c       |   5 +-
 tests/intel/gem_pipe_control_store_loop.c    |   6 +-
 tests/intel/gem_ppgtt.c                      |   2 +-
 tests/intel/gem_pread.c                      |   5 +-
 tests/intel/gem_pread_after_blit.c           |   5 +-
 tests/intel/gem_pwrite.c                     |   5 +-
 tests/intel/gem_pwrite_snooped.c             |   5 +-
 tests/intel/gem_pxp.c                        |   3 +-
 tests/intel/gem_read_read_speed.c            |   5 +-
 tests/intel/gem_readwrite.c                  |   5 +-
 tests/intel/gem_reg_read.c                   |   5 +-
 tests/intel/gem_render_copy.c                |   5 +-
 tests/intel/gem_render_copy_redux.c          |   5 +-
 tests/intel/gem_render_linear_blits.c        |   7 +-
 tests/intel/gem_render_tiled_blits.c         |   7 +-
 tests/intel/gem_request_retire.c             |   6 +-
 tests/intel/gem_reset_stats.c                |   5 +-
 tests/intel/gem_ringfill.c                   |   8 +-
 tests/intel/gem_set_tiling_vs_blt.c          |   5 +-
 tests/intel/gem_set_tiling_vs_gtt.c          |   5 +-
 tests/intel/gem_set_tiling_vs_pwrite.c       |   5 +-
 tests/intel/gem_shrink.c                     |   2 +-
 tests/intel/gem_softpin.c                    |   6 +-
 tests/intel/gem_spin_batch.c                 |   2 +-
 tests/intel/gem_streaming_writes.c           |   5 +-
 tests/intel/gem_stress.c                     |   5 +-
 tests/intel/gem_sync.c                       |  10 +-
 tests/intel/gem_tiled_blits.c                |   7 +-
 tests/intel/gem_tiled_fence_blits.c          |   7 +-
 tests/intel/gem_tiled_partial_pwrite_pread.c |   5 +-
 tests/intel/gem_tiled_pread_basic.c          |   5 +-
 tests/intel/gem_tiled_pread_pwrite.c         |   5 +-
 tests/intel/gem_tiled_swapping.c             |   5 +-
 tests/intel/gem_tiled_wb.c                   |   5 +-
 tests/intel/gem_tiled_wc.c                   |   5 +-
 tests/intel/gem_tiling_max_stride.c          |   5 +-
 tests/intel/gem_unfence_active_buffers.c     |   5 +-
 tests/intel/gem_unref_active_buffers.c       |   4 +-
 tests/intel/gem_userptr_blits.c              |   2 +-
 tests/intel/gem_vm_create.c                  |  10 +-
 tests/intel/gem_wait.c                       |   8 +-
 tests/intel/gem_watchdog.c                   |   5 +-
 tests/intel/gem_workarounds.c                |   2 +-
 tests/intel/gen3_mixed_blits.c               |   5 +-
 tests/intel/gen3_render_linear_blits.c       |   5 +-
 tests/intel/gen3_render_mixed_blits.c        |   5 +-
 tests/intel/gen3_render_tiledx_blits.c       |   5 +-
 tests/intel/gen3_render_tiledy_blits.c       |   5 +-
 tests/intel/gen7_exec_parse.c                |   5 +-
 tests/intel/gen9_exec_parse.c                |   5 +-
 tests/intel/i915_fb_tiling.c                 |   5 +-
 tests/intel/i915_getparams_basic.c           |   4 +-
 tests/intel/i915_hangman.c                   |  20 +-
 tests/intel/i915_module_load.c               |   6 +-
 tests/intel/i915_pciid.c                     |   4 +-
 tests/intel/i915_pipe_stress.c               |  13 +-
 tests/intel/i915_pm_freq_api.c               |   5 +-
 tests/intel/i915_pm_freq_mult.c              |  11 +-
 tests/intel/i915_pm_rc6_residency.c          |   3 +-
 tests/intel/i915_pm_rpm.c                    |   4 +-
 tests/intel/i915_pm_rps.c                    |   7 +-
 tests/intel/i915_pm_sseu.c                   |   5 +-
 tests/intel/i915_power.c                     |   5 +-
 tests/intel/i915_query.c                     |   2 +-
 tests/intel/i915_selftest.c                  | 380 ++++++++++---------
 tests/intel/i915_suspend.c                   |   7 +-
 tests/intel/intel_hwmon.c                    |   2 +-
 tests/intel/perf.c                           |   3 +-
 tests/intel/perf_pmu.c                       |   3 +-
 tests/intel/prime_busy.c                     |   4 +-
 tests/intel/prime_mmap.c                     |   6 +-
 tests/intel/prime_mmap_coherency.c           |   6 +-
 tests/intel/prime_mmap_kms.c                 |   2 +-
 tests/intel/prime_self_import.c              |  13 +-
 tests/intel/sysfs_defaults.c                 |   6 +-
 tests/intel/sysfs_heartbeat_interval.c       |   5 +-
 tests/intel/sysfs_preempt_timeout.c          |   5 +-
 tests/intel/sysfs_timeslice_duration.c       |   5 +-
 tests/intel/xe_drm_fdinfo.c                  |   2 +-
 tests/intel/xe_pm.c                          |   2 +-
 tests/intel/xe_pm_residency.c                |   2 +-
 tests/intel/xe_spin_batch.c                  |   4 +-
 tests/intel/xe_waitfence.c                   |   2 +-
 tests/prime_nv_api.c                         |  22 ++
 tests/prime_nv_pcopy.c                       |  18 +
 tests/prime_nv_test.c                        |  17 +
 tests/prime_vgem.c                           |  14 +-
 tests/sriov_basic.c                          |   9 +-
 tests/sw_sync.c                              |   4 +-
 tests/syncobj_basic.c                        |   4 +-
 tests/syncobj_eventfd.c                      |   2 +-
 tests/syncobj_timeline.c                     |   4 +-
 tests/syncobj_wait.c                         |   4 +-
 tests/vgem_basic.c                           |  25 +-
 tests/vgem_slow.c                            |   2 +-
 184 files changed, 877 insertions(+), 528 deletions(-)

-- 
2.34.1

