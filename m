Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA88C25B7A
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 12:33:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F73010E138;
	Wed, 22 May 2024 12:33:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C6Bl/j9T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D4610E138
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 12:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716381215; x=1747917215;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xdsP4e6Zh+X7oCH/EtOxbeNTZLdd4z3yNuHLQUUR38E=;
 b=C6Bl/j9TNXHxlBsjI8oFUmhZIWkqQZtHB93oiSXpPW9bXvluVN+qk6MK
 Dztk0LXFVB820HzVhS8SO+M3vHwVcdZeNlwVUBKq5B1d7UchAznCpqOZL
 eG33dX91xGPZh16jP6sU1R2HK5MK0F2gV0oF2cxnIhsIHmYjZKNqP6Ltq
 021SmNq5fTys9QTfMuK+HUkHS3w7+vAFUlffZ/HIN5fSNezui8QRPHmyu
 /yJm+KQt8Jfm+AFywiWvEV1vF4okDS25ahRZRZ8mFJYbapgxE7xKSnI1K
 pu6W74m7ktmRwcruHh5OoIr3KkPUy5H5wya3EwNg9ZHVDQ4NVVV9HC2tH w==;
X-CSE-ConnectionGUID: pquHV7dXT66JewXHw0HfQw==
X-CSE-MsgGUID: fd0MB+VASAy4g0WzRCmgqg==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="30150046"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="30150046"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 05:33:34 -0700
X-CSE-ConnectionGUID: TGM2jjF3QBS7Dc2liuNvVg==
X-CSE-MsgGUID: tLYVkGQqQEChA03qsnU3Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="33262560"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 05:33:32 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Gandi Ramadevi <ramadevi.gandi@intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t 0/2] Further test documentation improvements
Date: Wed, 22 May 2024 12:33:20 +0000
Message-Id: <20240522123322.779571-1-katarzyna.piecielska@intel.com>
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

There is a need to tweak Core test documentation:
 * Unify Category field
 * make Mega feature mandatory field

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Gandi Ramadevi <ramadevi.gandi@intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>

Katarzyna Piecielska (2):
  tests: Unify Category for Core tests
  tests/intel: Make Mega feature field mandatory in test documentation

 tests/core_auth.c                            |   2 +-
 tests/core_getclient.c                       |   2 +-
 tests/core_getstats.c                        |   2 +-
 tests/core_getversion.c                      |   2 +-
 tests/core_hotunplug.c                       |   2 +-
 tests/core_setmaster.c                       |   2 +-
 tests/core_setmaster_vs_auth.c               |   2 +-
 tests/device_reset.c                         |   4 +-
 tests/dmabuf.c                               |   2 +-
 tests/dmabuf_sync_file.c                     |   2 +-
 tests/drm_mm.c                               |   2 +-
 tests/drm_read.c                             |   2 +-
 tests/dumb_buffer.c                          |   2 +-
 tests/intel/api_intel_allocator.c            |   2 +-
 tests/intel/api_intel_bb.c                   |   2 +-
 tests/intel/debugfs_test.c                   |   2 +-
 tests/intel/drm_fdinfo.c                     |   2 +-
 tests/intel/gem_bad_reloc.c                  |   2 +-
 tests/intel/gem_barrier_race.c               |   2 +-
 tests/intel/gem_basic.c                      |   2 +-
 tests/intel/gem_blits.c                      |   2 +-
 tests/intel/gem_busy.c                       |   2 +-
 tests/intel/gem_caching.c                    |   2 +-
 tests/intel/gem_ccs.c                        |   2 +-
 tests/intel/gem_close.c                      |   2 +-
 tests/intel/gem_close_race.c                 |   2 +-
 tests/intel/gem_compute.c                    |   2 +-
 tests/intel/gem_create.c                     |   4 +-
 tests/intel/gem_cs_tlb.c                     |   2 +-
 tests/intel/gem_ctx_bad_destroy.c            |   2 +-
 tests/intel/gem_ctx_create.c                 |   2 +-
 tests/intel/gem_ctx_engines.c                |   2 +-
 tests/intel/gem_ctx_exec.c                   |   2 +-
 tests/intel/gem_ctx_freq.c                   |   2 +-
 tests/intel/gem_ctx_isolation.c              |   2 +-
 tests/intel/gem_ctx_param.c                  |   2 +-
 tests/intel/gem_ctx_persistence.c            |   2 +-
 tests/intel/gem_ctx_shared.c                 |   2 +-
 tests/intel/gem_ctx_sseu.c                   |   2 +-
 tests/intel/gem_ctx_switch.c                 |   2 +-
 tests/intel/gem_eio.c                        |   2 +-
 tests/intel/gem_evict_alignment.c            |   2 +-
 tests/intel/gem_evict_everything.c           |   2 +-
 tests/intel/gem_exec_alignment.c             |   2 +-
 tests/intel/gem_exec_async.c                 |   2 +-
 tests/intel/gem_exec_await.c                 |   2 +-
 tests/intel/gem_exec_balancer.c              |   2 +-
 tests/intel/gem_exec_basic.c                 |   2 +-
 tests/intel/gem_exec_big.c                   |   2 +-
 tests/intel/gem_exec_capture.c               |   2 +-
 tests/intel/gem_exec_create.c                |   2 +-
 tests/intel/gem_exec_endless.c               |   2 +-
 tests/intel/gem_exec_fair.c                  |   2 +-
 tests/intel/gem_exec_fence.c                 |   4 +-
 tests/intel/gem_exec_flush.c                 |   2 +-
 tests/intel/gem_exec_gttfill.c               |   2 +-
 tests/intel/gem_exec_latency.c               |   2 +-
 tests/intel/gem_exec_lut_handle.c            |   2 +-
 tests/intel/gem_exec_nop.c                   |   2 +-
 tests/intel/gem_exec_parallel.c              |   2 +-
 tests/intel/gem_exec_params.c                |   2 +-
 tests/intel/gem_exec_reloc.c                 |   2 +-
 tests/intel/gem_exec_schedule.c              |   2 +-
 tests/intel/gem_exec_store.c                 |   2 +-
 tests/intel/gem_exec_suspend.c               |   2 +-
 tests/intel/gem_exec_whisper.c               |   2 +-
 tests/intel/gem_exercise_blt.c               |   2 +-
 tests/intel/gem_fd_exhaustion.c              |   2 +-
 tests/intel/gem_fence_thrash.c               |   2 +-
 tests/intel/gem_fence_upload.c               |   2 +-
 tests/intel/gem_fenced_exec_thrash.c         |   2 +-
 tests/intel/gem_flink_basic.c                |   2 +-
 tests/intel/gem_flink_race.c                 |   2 +-
 tests/intel/gem_gpgpu_fill.c                 |   2 +-
 tests/intel/gem_gtt_cpu_tlb.c                |   2 +-
 tests/intel/gem_gtt_hog.c                    |   2 +-
 tests/intel/gem_gtt_speed.c                  |   2 +-
 tests/intel/gem_huc_copy.c                   |   2 +-
 tests/intel/gem_linear_blits.c               |   2 +-
 tests/intel/gem_lmem_evict.c                 |   2 +-
 tests/intel/gem_lmem_swapping.c              |   2 +-
 tests/intel/gem_lut_handle.c                 |   2 +-
 tests/intel/gem_madvise.c                    |   2 +-
 tests/intel/gem_media_fill.c                 |   2 +-
 tests/intel/gem_media_vme.c                  |   2 +-
 tests/intel/gem_mmap.c                       |   2 +-
 tests/intel/gem_mmap_gtt.c                   |   2 +-
 tests/intel/gem_mmap_offset.c                |   2 +-
 tests/intel/gem_mmap_wc.c                    |   2 +-
 tests/intel/gem_partial_pwrite_pread.c       |   2 +-
 tests/intel/gem_pipe_control_store_loop.c    |   2 +-
 tests/intel/gem_ppgtt.c                      |   2 +-
 tests/intel/gem_pread.c                      |   2 +-
 tests/intel/gem_pread_after_blit.c           |   2 +-
 tests/intel/gem_pwrite.c                     |   2 +-
 tests/intel/gem_pwrite_snooped.c             |   2 +-
 tests/intel/gem_pxp.c                        |   2 +-
 tests/intel/gem_read_read_speed.c            |   2 +-
 tests/intel/gem_readwrite.c                  |   2 +-
 tests/intel/gem_reg_read.c                   |   2 +-
 tests/intel/gem_render_copy.c                |   2 +-
 tests/intel/gem_render_copy_redux.c          |   2 +-
 tests/intel/gem_render_linear_blits.c        |   2 +-
 tests/intel/gem_render_tiled_blits.c         |   2 +-
 tests/intel/gem_request_retire.c             |   2 +-
 tests/intel/gem_reset_stats.c                |   2 +-
 tests/intel/gem_ringfill.c                   |   2 +-
 tests/intel/gem_set_tiling_vs_blt.c          |   2 +-
 tests/intel/gem_set_tiling_vs_gtt.c          |   2 +-
 tests/intel/gem_set_tiling_vs_pwrite.c       |   2 +-
 tests/intel/gem_shrink.c                     |   2 +-
 tests/intel/gem_softpin.c                    |   2 +-
 tests/intel/gem_spin_batch.c                 |   2 +-
 tests/intel/gem_streaming_writes.c           |   2 +-
 tests/intel/gem_stress.c                     |   2 +-
 tests/intel/gem_sync.c                       |   2 +-
 tests/intel/gem_tiled_blits.c                |   2 +-
 tests/intel/gem_tiled_fence_blits.c          |   2 +-
 tests/intel/gem_tiled_partial_pwrite_pread.c |   2 +-
 tests/intel/gem_tiled_pread_basic.c          |   2 +-
 tests/intel/gem_tiled_pread_pwrite.c         |   2 +-
 tests/intel/gem_tiled_swapping.c             |   2 +-
 tests/intel/gem_tiled_wb.c                   |   2 +-
 tests/intel/gem_tiled_wc.c                   |   2 +-
 tests/intel/gem_tiling_max_stride.c          |   2 +-
 tests/intel/gem_unfence_active_buffers.c     |   2 +-
 tests/intel/gem_unref_active_buffers.c       |   2 +-
 tests/intel/gem_userptr_blits.c              |   2 +-
 tests/intel/gem_vm_create.c                  |   2 +-
 tests/intel/gem_wait.c                       |   2 +-
 tests/intel/gem_watchdog.c                   |   2 +-
 tests/intel/gem_workarounds.c                |   2 +-
 tests/intel/gen3_mixed_blits.c               |   2 +-
 tests/intel/gen3_render_linear_blits.c       |   2 +-
 tests/intel/gen3_render_mixed_blits.c        |   2 +-
 tests/intel/gen3_render_tiledx_blits.c       |   2 +-
 tests/intel/gen3_render_tiledy_blits.c       |   2 +-
 tests/intel/gen7_exec_parse.c                |   2 +-
 tests/intel/gen9_exec_parse.c                |   2 +-
 tests/intel/i915_fb_tiling.c                 |   2 +-
 tests/intel/i915_getparams_basic.c           |   2 +-
 tests/intel/i915_hangman.c                   |   2 +-
 tests/intel/i915_module_load.c               |   2 +-
 tests/intel/i915_pciid.c                     |   2 +-
 tests/intel/i915_pm_freq_api.c               |   2 +-
 tests/intel/i915_pm_freq_mult.c              |   2 +-
 tests/intel/i915_pm_rc6_residency.c          |   2 +-
 tests/intel/i915_pm_rpm.c                    |   2 +-
 tests/intel/i915_pm_rps.c                    |   2 +-
 tests/intel/i915_pm_sseu.c                   |   2 +-
 tests/intel/i915_power.c                     |   2 +-
 tests/intel/i915_query.c                     |   2 +-
 tests/intel/i915_selftest.c                  | 158 +++++++++----------
 tests/intel/i915_suspend.c                   |   2 +-
 tests/intel/i915_test_config.json            |   4 +-
 tests/intel/intel_hwmon.c                    |   2 +-
 tests/intel/perf.c                           |   2 +-
 tests/intel/perf_pmu.c                       |   2 +-
 tests/intel/prime_busy.c                     |   2 +-
 tests/intel/prime_mmap.c                     |   2 +-
 tests/intel/prime_mmap_coherency.c           |   2 +-
 tests/intel/prime_mmap_kms.c                 |   2 +-
 tests/intel/prime_self_import.c              |   2 +-
 tests/intel/sysfs_defaults.c                 |   2 +-
 tests/intel/sysfs_heartbeat_interval.c       |   2 +-
 tests/intel/sysfs_preempt_timeout.c          |   2 +-
 tests/intel/sysfs_timeslice_duration.c       |   2 +-
 tests/intel/xe_ccs.c                         |   2 +-
 tests/intel/xe_compute.c                     |   2 +-
 tests/intel/xe_compute_preempt.c             |   2 +-
 tests/intel/xe_copy_basic.c                  |   2 +-
 tests/intel/xe_create.c                      |   2 +-
 tests/intel/xe_debugfs.c                     |   2 +-
 tests/intel/xe_dma_buf_sync.c                |   2 +-
 tests/intel/xe_drm_fdinfo.c                  |   2 +-
 tests/intel/xe_evict.c                       |   2 +-
 tests/intel/xe_evict_ccs.c                   |   2 +-
 tests/intel/xe_exec_atomic.c                 |   2 +-
 tests/intel/xe_exec_balancer.c               |   2 +-
 tests/intel/xe_exec_basic.c                  |   2 +-
 tests/intel/xe_exec_compute_mode.c           |   2 +-
 tests/intel/xe_exec_fault_mode.c             |   2 +-
 tests/intel/xe_exec_queue_property.c         |   2 +-
 tests/intel/xe_exec_reset.c                  |   2 +-
 tests/intel/xe_exec_store.c                  |   2 +-
 tests/intel/xe_exec_threads.c                |   2 +-
 tests/intel/xe_exercise_blt.c                |   2 +-
 tests/intel/xe_gpgpu_fill.c                  |   2 +-
 tests/intel/xe_gt_freq.c                     |   2 +-
 tests/intel/xe_huc_copy.c                    |   2 +-
 tests/intel/xe_intel_bb.c                    |   2 +-
 tests/intel/xe_live_ktest.c                  |   2 +-
 tests/intel/xe_media_fill.c                  |   2 +-
 tests/intel/xe_mmap.c                        |   2 +-
 tests/intel/xe_module_load.c                 |   2 +-
 tests/intel/xe_noexec_ping_pong.c            |   2 +-
 tests/intel/xe_pat.c                         |   2 +-
 tests/intel/xe_peer2peer.c                   |   2 +-
 tests/intel/xe_pm.c                          |   2 +-
 tests/intel/xe_pm_residency.c                |   2 +-
 tests/intel/xe_prime_self_import.c           |   2 +-
 tests/intel/xe_query.c                       |  24 +--
 tests/intel/xe_render_copy.c                 |   2 +-
 tests/intel/xe_spin_batch.c                  |   2 +-
 tests/intel/xe_sysfs_defaults.c              |   2 +-
 tests/intel/xe_sysfs_scheduler.c             |   2 +-
 tests/intel/xe_test_config.json              |   4 +-
 tests/intel/xe_vm.c                          |   2 +-
 tests/intel/xe_waitfence.c                   |   4 +-
 tests/intel/xe_wedged.c                      |   2 +-
 tests/prime_vgem.c                           |   2 +-
 tests/sriov_basic.c                          |   2 +-
 tests/sw_sync.c                              |   2 +-
 tests/syncobj_basic.c                        |   2 +-
 tests/syncobj_eventfd.c                      |   2 +-
 tests/syncobj_timeline.c                     |   2 +-
 tests/syncobj_wait.c                         |   2 +-
 tests/vgem_basic.c                           |   2 +-
 tests/vgem_slow.c                            |   2 +-
 219 files changed, 314 insertions(+), 314 deletions(-)

-- 
2.34.1

