Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E225A10E040
 for <igt-dev@lists.freedesktop.org>; Wed, 24 May 2023 17:52:06 +0000 (UTC)
Date: Wed, 24 May 2023 19:52:02 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230524175202.yhsfr4vptvzwuwdp@kamilkon-desk1>
References: <20230518151842.287294-1-bhanuprakash.modem@intel.com>
 <20230518151842.287294-2-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230518151842.287294-2-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t V2 1/2] tests: New dir structure for intel
 specific tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Bhanuprakash,

On 2023-05-18 at 20:48:41 +0530, Bhanuprakash Modem wrote:
> In-order to organize tests, move all intel specific tests to
> a new directory "tests/intel".
> 

Moving into tests/intel/ looks good. I have one comment,
see below.

Please add +cc Mauro

Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>

> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  docs/testplan/meson.build                     |  2 +-
>  tests/{i915 => intel}/api_intel_allocator.c   |  0
>  tests/{i915 => intel}/api_intel_bb.c          |  0
>  tests/{i915 => intel}/drm_fdinfo.c            |  0
>  tests/{i915 => intel}/gem_bad_reloc.c         |  0
>  tests/{i915 => intel}/gem_barrier_race.c      |  0
>  tests/{i915 => intel}/gem_basic.c             |  0
>  tests/{i915 => intel}/gem_blits.c             |  0
>  tests/{i915 => intel}/gem_busy.c              |  0
>  tests/{i915 => intel}/gem_caching.c           |  0
>  tests/{i915 => intel}/gem_ccs.c               |  0
>  tests/{i915 => intel}/gem_close.c             |  0
>  tests/{i915 => intel}/gem_close_race.c        |  0
>  tests/{i915 => intel}/gem_concurrent_all.c    |  0
>  tests/{i915 => intel}/gem_concurrent_blit.c   |  0
>  tests/{i915 => intel}/gem_create.c            |  0
>  tests/{i915 => intel}/gem_cs_tlb.c            |  0
>  tests/{i915 => intel}/gem_ctx_bad_destroy.c   |  0
>  tests/{i915 => intel}/gem_ctx_create.c        |  0
>  tests/{i915 => intel}/gem_ctx_engines.c       |  0
>  tests/{i915 => intel}/gem_ctx_exec.c          |  0
>  tests/{i915 => intel}/gem_ctx_freq.c          |  0
>  tests/{i915 => intel}/gem_ctx_isolation.c     |  0
>  tests/{i915 => intel}/gem_ctx_param.c         |  0
>  tests/{i915 => intel}/gem_ctx_persistence.c   |  0
>  tests/{i915 => intel}/gem_ctx_shared.c        |  0
>  tests/{i915 => intel}/gem_ctx_sseu.c          |  0
>  tests/{i915 => intel}/gem_ctx_switch.c        |  0
>  tests/{i915 => intel}/gem_eio.c               |  0
>  tests/{i915 => intel}/gem_evict_alignment.c   |  0
>  tests/{i915 => intel}/gem_evict_everything.c  |  0
>  tests/{i915 => intel}/gem_exec_alignment.c    |  0
>  tests/{i915 => intel}/gem_exec_async.c        |  0
>  tests/{i915 => intel}/gem_exec_await.c        |  0
>  tests/{i915 => intel}/gem_exec_balancer.c     |  0
>  tests/{i915 => intel}/gem_exec_basic.c        |  0
>  tests/{i915 => intel}/gem_exec_big.c          |  0
>  tests/{i915 => intel}/gem_exec_capture.c      |  0
>  tests/{i915 => intel}/gem_exec_create.c       |  0
>  tests/{i915 => intel}/gem_exec_endless.c      |  0
>  tests/{i915 => intel}/gem_exec_fair.c         |  0
>  tests/{i915 => intel}/gem_exec_fence.c        |  0
>  tests/{i915 => intel}/gem_exec_flush.c        |  0
>  tests/{i915 => intel}/gem_exec_gttfill.c      |  0
>  tests/{i915 => intel}/gem_exec_latency.c      |  0
>  tests/{i915 => intel}/gem_exec_lut_handle.c   |  0
>  tests/{i915 => intel}/gem_exec_nop.c          |  0
>  tests/{i915 => intel}/gem_exec_parallel.c     |  0
>  tests/{i915 => intel}/gem_exec_params.c       |  0
>  tests/{i915 => intel}/gem_exec_reloc.c        |  0
>  tests/{i915 => intel}/gem_exec_schedule.c     |  0
>  tests/{i915 => intel}/gem_exec_store.c        |  0
>  tests/{i915 => intel}/gem_exec_suspend.c      |  0
>  tests/{i915 => intel}/gem_exec_whisper.c      |  0
>  tests/{i915 => intel}/gem_exercise_blt.c      |  0
>  tests/{i915 => intel}/gem_fd_exhaustion.c     |  0
>  tests/{i915 => intel}/gem_fence_thrash.c      |  0
>  tests/{i915 => intel}/gem_fence_upload.c      |  0
>  .../{i915 => intel}/gem_fenced_exec_thrash.c  |  0
>  tests/{i915 => intel}/gem_flink_basic.c       |  0
>  tests/{i915 => intel}/gem_flink_race.c        |  0
>  tests/{i915 => intel}/gem_gpgpu_fill.c        |  0
>  tests/{i915 => intel}/gem_gtt_cpu_tlb.c       |  0
>  tests/{i915 => intel}/gem_gtt_hog.c           |  0
>  tests/{i915 => intel}/gem_gtt_speed.c         |  0
>  tests/{i915 => intel}/gem_huc_copy.c          |  0
>  tests/{i915 => intel}/gem_linear_blits.c      |  0
>  tests/{i915 => intel}/gem_lmem_evict.c        |  0
>  tests/{i915 => intel}/gem_lmem_swapping.c     |  0
>  tests/{i915 => intel}/gem_lut_handle.c        |  0
>  tests/{i915 => intel}/gem_madvise.c           |  0
>  tests/{i915 => intel}/gem_media_fill.c        |  0
>  tests/{i915 => intel}/gem_media_vme.c         |  0
>  tests/{i915 => intel}/gem_mmap.c              |  0
>  tests/{i915 => intel}/gem_mmap_gtt.c          |  0
>  tests/{i915 => intel}/gem_mmap_offset.c       |  0
>  tests/{i915 => intel}/gem_mmap_wc.c           |  0
>  .../gem_partial_pwrite_pread.c                |  0
>  .../gem_pipe_control_store_loop.c             |  0
>  tests/{i915 => intel}/gem_ppgtt.c             |  0
>  tests/{i915 => intel}/gem_pread.c             |  0
>  tests/{i915 => intel}/gem_pread_after_blit.c  |  0
>  tests/{i915 => intel}/gem_pwrite.c            |  0
>  tests/{i915 => intel}/gem_pwrite_snooped.c    |  0
>  tests/{i915 => intel}/gem_pxp.c               |  0
>  tests/{i915 => intel}/gem_read_read_speed.c   |  0
>  tests/{i915 => intel}/gem_readwrite.c         |  0
>  tests/{i915 => intel}/gem_reg_read.c          |  0
>  tests/{i915 => intel}/gem_render_copy.c       |  0
>  tests/{i915 => intel}/gem_render_copy_redux.c |  0
>  .../{i915 => intel}/gem_render_linear_blits.c |  0
>  .../{i915 => intel}/gem_render_tiled_blits.c  |  0
>  tests/{i915 => intel}/gem_request_retire.c    |  0
>  tests/{i915 => intel}/gem_reset_stats.c       |  0
>  tests/{i915 => intel}/gem_ringfill.c          |  0
>  tests/{i915 => intel}/gem_set_tiling_vs_blt.c |  0
>  tests/{i915 => intel}/gem_set_tiling_vs_gtt.c |  0
>  .../gem_set_tiling_vs_pwrite.c                |  0
>  tests/{i915 => intel}/gem_shrink.c            |  0
>  tests/{i915 => intel}/gem_softpin.c           |  0
>  tests/{i915 => intel}/gem_spin_batch.c        |  0
>  tests/{i915 => intel}/gem_streaming_writes.c  |  0
>  tests/{i915 => intel}/gem_stress.c            |  0
>  tests/{i915 => intel}/gem_sync.c              |  0
>  tests/{i915 => intel}/gem_tiled_blits.c       |  0
>  tests/{i915 => intel}/gem_tiled_fence_blits.c |  0
>  .../gem_tiled_partial_pwrite_pread.c          |  0
>  tests/{i915 => intel}/gem_tiled_pread_basic.c |  0
>  .../{i915 => intel}/gem_tiled_pread_pwrite.c  |  0
>  tests/{i915 => intel}/gem_tiled_swapping.c    |  0
>  tests/{i915 => intel}/gem_tiled_wb.c          |  0
>  tests/{i915 => intel}/gem_tiled_wc.c          |  0
>  tests/{i915 => intel}/gem_tiling_max_stride.c |  0
>  .../gem_unfence_active_buffers.c              |  0
>  .../gem_unref_active_buffers.c                |  0
>  tests/{i915 => intel}/gem_userptr_blits.c     |  0
>  tests/{i915 => intel}/gem_vm_create.c         |  0
>  tests/{i915 => intel}/gem_wait.c              |  0
>  tests/{i915 => intel}/gem_watchdog.c          |  0
>  tests/{i915 => intel}/gem_workarounds.c       |  0
>  tests/{i915 => intel}/gen3_mixed_blits.c      |  0
>  .../gen3_render_linear_blits.c                |  0
>  .../{i915 => intel}/gen3_render_mixed_blits.c |  0
>  .../gen3_render_tiledx_blits.c                |  0
>  .../gen3_render_tiledy_blits.c                |  0
>  tests/{i915 => intel}/gen7_exec_parse.c       |  0
>  tests/{i915 => intel}/gen9_exec_parse.c       |  0
>  tests/{i915 => intel}/i915_fb_tiling.c        |  0
>  tests/{i915 => intel}/i915_getparams_basic.c  |  0
>  tests/{i915 => intel}/i915_hangman.c          |  0
>  tests/{i915 => intel}/i915_hwmon.c            |  0
>  tests/{i915 => intel}/i915_module_load.c      |  0
>  tests/{i915 => intel}/i915_pciid.c            |  0
>  tests/{i915 => intel}/i915_pipe_stress.c      |  0
>  tests/{i915 => intel}/i915_pm_backlight.c     |  0
>  tests/{i915 => intel}/i915_pm_dc.c            |  0
>  tests/{i915 => intel}/i915_pm_freq_api.c      |  0
>  tests/{i915 => intel}/i915_pm_freq_mult.c     |  0
>  tests/{i915 => intel}/i915_pm_lpsp.c          |  0
>  tests/{i915 => intel}/i915_pm_rc6_residency.c |  0
>  tests/{i915 => intel}/i915_pm_rpm.c           |  0
>  tests/{i915 => intel}/i915_pm_rps.c           |  0
>  tests/{i915 => intel}/i915_pm_sseu.c          |  0
>  tests/{i915 => intel}/i915_power.c            |  0
>  tests/{i915 => intel}/i915_query.c            |  0
>  tests/{i915 => intel}/i915_selftest.c         |  0
>  tests/{i915 => intel}/i915_suspend.c          |  0
>  tests/{i915 => intel}/kms_big_fb.c            |  0
>  tests/{i915 => intel}/kms_big_joiner.c        |  0
>  tests/{i915 => intel}/kms_busy.c              |  0
>  tests/{i915 => intel}/kms_ccs.c               |  0
>  tests/{i915 => intel}/kms_cdclk.c             |  0
>  tests/{i915 => intel}/kms_draw_crc.c          |  0
>  tests/{i915 => intel}/kms_dsc.c               |  0
>  tests/{i915 => intel}/kms_dsc_helper.c        |  0
>  tests/{i915 => intel}/kms_dsc_helper.h        |  0
>  tests/{i915 => intel}/kms_fbcon_fbt.c         |  0
>  tests/{i915 => intel}/kms_fence_pin_leak.c    |  0
>  tests/{i915 => intel}/kms_flip_scaled_crc.c   |  0
>  tests/{i915 => intel}/kms_flip_tiling.c       |  0
>  .../kms_frontbuffer_tracking.c                |  0
>  tests/{i915 => intel}/kms_legacy_colorkey.c   |  0
>  tests/{i915 => intel}/kms_mmap_write_crc.c    |  0
>  tests/{i915 => intel}/kms_pipe_b_c_ivb.c      |  0
>  tests/{i915 => intel}/kms_psr.c               |  0
>  tests/{i915 => intel}/kms_psr2_sf.c           |  0
>  tests/{i915 => intel}/kms_psr2_su.c           |  0
>  tests/{i915 => intel}/kms_psr_stress_test.c   |  0
>  tests/{i915 => intel}/kms_pwrite_crc.c        |  0
>  tests/{i915 => intel}/perf.c                  |  0
>  tests/{i915 => intel}/perf_pmu.c              |  0
>  tests/{i915 => intel}/sysfs_defaults.c        |  0
>  .../sysfs_heartbeat_interval.c                |  0
>  tests/{i915 => intel}/sysfs_preempt_timeout.c |  0
>  .../sysfs_timeslice_duration.c                |  0
>  tests/{xe => intel}/xe_compute.c              |  0
>  tests/{xe => intel}/xe_create.c               |  0
>  tests/{xe => intel}/xe_debugfs.c              |  0
>  tests/{xe => intel}/xe_dma_buf_sync.c         |  0
>  tests/{xe => intel}/xe_evict.c                |  0
>  tests/{xe => intel}/xe_exec_balancer.c        |  0
>  tests/{xe => intel}/xe_exec_basic.c           |  0
>  tests/{xe => intel}/xe_exec_compute_mode.c    |  0
>  tests/{xe => intel}/xe_exec_fault_mode.c      |  0
>  tests/{xe => intel}/xe_exec_reset.c           |  0
>  tests/{xe => intel}/xe_exec_threads.c         |  0
>  tests/{xe => intel}/xe_gpgpu_fill.c           |  0
>  tests/{xe => intel}/xe_guc_pc.c               |  0
>  tests/{xe => intel}/xe_huc_copy.c             |  0
>  tests/{xe => intel}/xe_intel_bb.c             |  0
>  tests/{xe => intel}/xe_mmap.c                 |  0
>  tests/{xe => intel}/xe_mmio.c                 |  0
>  tests/{xe => intel}/xe_module_load.c          |  0
>  tests/{xe => intel}/xe_noexec_ping_pong.c     |  0
>  tests/{xe => intel}/xe_pm.c                   |  0
>  tests/{xe => intel}/xe_prime_self_import.c    |  0
>  tests/{xe => intel}/xe_query.c                |  0
>  tests/{xe => intel}/xe_test_config.json       |  0
>  tests/{xe => intel}/xe_vm.c                   |  0
>  tests/{xe => intel}/xe_waitfence.c            |  0
>  tests/meson.build                             | 54 +++++++------------
>  201 files changed, 20 insertions(+), 36 deletions(-)
>  rename tests/{i915 => intel}/api_intel_allocator.c (100%)
>  rename tests/{i915 => intel}/api_intel_bb.c (100%)
>  rename tests/{i915 => intel}/drm_fdinfo.c (100%)
>  rename tests/{i915 => intel}/gem_bad_reloc.c (100%)
>  rename tests/{i915 => intel}/gem_barrier_race.c (100%)
>  rename tests/{i915 => intel}/gem_basic.c (100%)
>  rename tests/{i915 => intel}/gem_blits.c (100%)
>  rename tests/{i915 => intel}/gem_busy.c (100%)
>  rename tests/{i915 => intel}/gem_caching.c (100%)
>  rename tests/{i915 => intel}/gem_ccs.c (100%)
>  rename tests/{i915 => intel}/gem_close.c (100%)
>  rename tests/{i915 => intel}/gem_close_race.c (100%)
>  rename tests/{i915 => intel}/gem_concurrent_all.c (100%)
>  rename tests/{i915 => intel}/gem_concurrent_blit.c (100%)
>  rename tests/{i915 => intel}/gem_create.c (100%)
>  rename tests/{i915 => intel}/gem_cs_tlb.c (100%)
>  rename tests/{i915 => intel}/gem_ctx_bad_destroy.c (100%)
>  rename tests/{i915 => intel}/gem_ctx_create.c (100%)
>  rename tests/{i915 => intel}/gem_ctx_engines.c (100%)
>  rename tests/{i915 => intel}/gem_ctx_exec.c (100%)
>  rename tests/{i915 => intel}/gem_ctx_freq.c (100%)
>  rename tests/{i915 => intel}/gem_ctx_isolation.c (100%)
>  rename tests/{i915 => intel}/gem_ctx_param.c (100%)
>  rename tests/{i915 => intel}/gem_ctx_persistence.c (100%)
>  rename tests/{i915 => intel}/gem_ctx_shared.c (100%)
>  rename tests/{i915 => intel}/gem_ctx_sseu.c (100%)
>  rename tests/{i915 => intel}/gem_ctx_switch.c (100%)
>  rename tests/{i915 => intel}/gem_eio.c (100%)
>  rename tests/{i915 => intel}/gem_evict_alignment.c (100%)
>  rename tests/{i915 => intel}/gem_evict_everything.c (100%)
>  rename tests/{i915 => intel}/gem_exec_alignment.c (100%)
>  rename tests/{i915 => intel}/gem_exec_async.c (100%)
>  rename tests/{i915 => intel}/gem_exec_await.c (100%)
>  rename tests/{i915 => intel}/gem_exec_balancer.c (100%)
>  rename tests/{i915 => intel}/gem_exec_basic.c (100%)
>  rename tests/{i915 => intel}/gem_exec_big.c (100%)
>  rename tests/{i915 => intel}/gem_exec_capture.c (100%)
>  rename tests/{i915 => intel}/gem_exec_create.c (100%)
>  rename tests/{i915 => intel}/gem_exec_endless.c (100%)
>  rename tests/{i915 => intel}/gem_exec_fair.c (100%)
>  rename tests/{i915 => intel}/gem_exec_fence.c (100%)
>  rename tests/{i915 => intel}/gem_exec_flush.c (100%)
>  rename tests/{i915 => intel}/gem_exec_gttfill.c (100%)
>  rename tests/{i915 => intel}/gem_exec_latency.c (100%)
>  rename tests/{i915 => intel}/gem_exec_lut_handle.c (100%)
>  rename tests/{i915 => intel}/gem_exec_nop.c (100%)
>  rename tests/{i915 => intel}/gem_exec_parallel.c (100%)
>  rename tests/{i915 => intel}/gem_exec_params.c (100%)
>  rename tests/{i915 => intel}/gem_exec_reloc.c (100%)
>  rename tests/{i915 => intel}/gem_exec_schedule.c (100%)
>  rename tests/{i915 => intel}/gem_exec_store.c (100%)
>  rename tests/{i915 => intel}/gem_exec_suspend.c (100%)
>  rename tests/{i915 => intel}/gem_exec_whisper.c (100%)
>  rename tests/{i915 => intel}/gem_exercise_blt.c (100%)
>  rename tests/{i915 => intel}/gem_fd_exhaustion.c (100%)
>  rename tests/{i915 => intel}/gem_fence_thrash.c (100%)
>  rename tests/{i915 => intel}/gem_fence_upload.c (100%)
>  rename tests/{i915 => intel}/gem_fenced_exec_thrash.c (100%)
>  rename tests/{i915 => intel}/gem_flink_basic.c (100%)
>  rename tests/{i915 => intel}/gem_flink_race.c (100%)
>  rename tests/{i915 => intel}/gem_gpgpu_fill.c (100%)
>  rename tests/{i915 => intel}/gem_gtt_cpu_tlb.c (100%)
>  rename tests/{i915 => intel}/gem_gtt_hog.c (100%)
>  rename tests/{i915 => intel}/gem_gtt_speed.c (100%)
>  rename tests/{i915 => intel}/gem_huc_copy.c (100%)
>  rename tests/{i915 => intel}/gem_linear_blits.c (100%)
>  rename tests/{i915 => intel}/gem_lmem_evict.c (100%)
>  rename tests/{i915 => intel}/gem_lmem_swapping.c (100%)
>  rename tests/{i915 => intel}/gem_lut_handle.c (100%)
>  rename tests/{i915 => intel}/gem_madvise.c (100%)
>  rename tests/{i915 => intel}/gem_media_fill.c (100%)
>  rename tests/{i915 => intel}/gem_media_vme.c (100%)
>  rename tests/{i915 => intel}/gem_mmap.c (100%)
>  rename tests/{i915 => intel}/gem_mmap_gtt.c (100%)
>  rename tests/{i915 => intel}/gem_mmap_offset.c (100%)
>  rename tests/{i915 => intel}/gem_mmap_wc.c (100%)
>  rename tests/{i915 => intel}/gem_partial_pwrite_pread.c (100%)
>  rename tests/{i915 => intel}/gem_pipe_control_store_loop.c (100%)
>  rename tests/{i915 => intel}/gem_ppgtt.c (100%)
>  rename tests/{i915 => intel}/gem_pread.c (100%)
>  rename tests/{i915 => intel}/gem_pread_after_blit.c (100%)
>  rename tests/{i915 => intel}/gem_pwrite.c (100%)
>  rename tests/{i915 => intel}/gem_pwrite_snooped.c (100%)
>  rename tests/{i915 => intel}/gem_pxp.c (100%)
>  rename tests/{i915 => intel}/gem_read_read_speed.c (100%)
>  rename tests/{i915 => intel}/gem_readwrite.c (100%)
>  rename tests/{i915 => intel}/gem_reg_read.c (100%)
>  rename tests/{i915 => intel}/gem_render_copy.c (100%)
>  rename tests/{i915 => intel}/gem_render_copy_redux.c (100%)
>  rename tests/{i915 => intel}/gem_render_linear_blits.c (100%)
>  rename tests/{i915 => intel}/gem_render_tiled_blits.c (100%)
>  rename tests/{i915 => intel}/gem_request_retire.c (100%)
>  rename tests/{i915 => intel}/gem_reset_stats.c (100%)
>  rename tests/{i915 => intel}/gem_ringfill.c (100%)
>  rename tests/{i915 => intel}/gem_set_tiling_vs_blt.c (100%)
>  rename tests/{i915 => intel}/gem_set_tiling_vs_gtt.c (100%)
>  rename tests/{i915 => intel}/gem_set_tiling_vs_pwrite.c (100%)
>  rename tests/{i915 => intel}/gem_shrink.c (100%)
>  rename tests/{i915 => intel}/gem_softpin.c (100%)
>  rename tests/{i915 => intel}/gem_spin_batch.c (100%)
>  rename tests/{i915 => intel}/gem_streaming_writes.c (100%)
>  rename tests/{i915 => intel}/gem_stress.c (100%)
>  rename tests/{i915 => intel}/gem_sync.c (100%)
>  rename tests/{i915 => intel}/gem_tiled_blits.c (100%)
>  rename tests/{i915 => intel}/gem_tiled_fence_blits.c (100%)
>  rename tests/{i915 => intel}/gem_tiled_partial_pwrite_pread.c (100%)
>  rename tests/{i915 => intel}/gem_tiled_pread_basic.c (100%)
>  rename tests/{i915 => intel}/gem_tiled_pread_pwrite.c (100%)
>  rename tests/{i915 => intel}/gem_tiled_swapping.c (100%)
>  rename tests/{i915 => intel}/gem_tiled_wb.c (100%)
>  rename tests/{i915 => intel}/gem_tiled_wc.c (100%)
>  rename tests/{i915 => intel}/gem_tiling_max_stride.c (100%)
>  rename tests/{i915 => intel}/gem_unfence_active_buffers.c (100%)
>  rename tests/{i915 => intel}/gem_unref_active_buffers.c (100%)
>  rename tests/{i915 => intel}/gem_userptr_blits.c (100%)
>  rename tests/{i915 => intel}/gem_vm_create.c (100%)
>  rename tests/{i915 => intel}/gem_wait.c (100%)
>  rename tests/{i915 => intel}/gem_watchdog.c (100%)
>  rename tests/{i915 => intel}/gem_workarounds.c (100%)
>  rename tests/{i915 => intel}/gen3_mixed_blits.c (100%)
>  rename tests/{i915 => intel}/gen3_render_linear_blits.c (100%)
>  rename tests/{i915 => intel}/gen3_render_mixed_blits.c (100%)
>  rename tests/{i915 => intel}/gen3_render_tiledx_blits.c (100%)
>  rename tests/{i915 => intel}/gen3_render_tiledy_blits.c (100%)
>  rename tests/{i915 => intel}/gen7_exec_parse.c (100%)
>  rename tests/{i915 => intel}/gen9_exec_parse.c (100%)
>  rename tests/{i915 => intel}/i915_fb_tiling.c (100%)
>  rename tests/{i915 => intel}/i915_getparams_basic.c (100%)
>  rename tests/{i915 => intel}/i915_hangman.c (100%)
>  rename tests/{i915 => intel}/i915_hwmon.c (100%)
>  rename tests/{i915 => intel}/i915_module_load.c (100%)
>  rename tests/{i915 => intel}/i915_pciid.c (100%)
>  rename tests/{i915 => intel}/i915_pipe_stress.c (100%)
>  rename tests/{i915 => intel}/i915_pm_backlight.c (100%)
>  rename tests/{i915 => intel}/i915_pm_dc.c (100%)
>  rename tests/{i915 => intel}/i915_pm_freq_api.c (100%)
>  rename tests/{i915 => intel}/i915_pm_freq_mult.c (100%)
>  rename tests/{i915 => intel}/i915_pm_lpsp.c (100%)
>  rename tests/{i915 => intel}/i915_pm_rc6_residency.c (100%)
>  rename tests/{i915 => intel}/i915_pm_rpm.c (100%)
>  rename tests/{i915 => intel}/i915_pm_rps.c (100%)
>  rename tests/{i915 => intel}/i915_pm_sseu.c (100%)
>  rename tests/{i915 => intel}/i915_power.c (100%)
>  rename tests/{i915 => intel}/i915_query.c (100%)
>  rename tests/{i915 => intel}/i915_selftest.c (100%)
>  rename tests/{i915 => intel}/i915_suspend.c (100%)
>  rename tests/{i915 => intel}/kms_big_fb.c (100%)
>  rename tests/{i915 => intel}/kms_big_joiner.c (100%)
>  rename tests/{i915 => intel}/kms_busy.c (100%)
>  rename tests/{i915 => intel}/kms_ccs.c (100%)
>  rename tests/{i915 => intel}/kms_cdclk.c (100%)
>  rename tests/{i915 => intel}/kms_draw_crc.c (100%)
>  rename tests/{i915 => intel}/kms_dsc.c (100%)
>  rename tests/{i915 => intel}/kms_dsc_helper.c (100%)
>  rename tests/{i915 => intel}/kms_dsc_helper.h (100%)
>  rename tests/{i915 => intel}/kms_fbcon_fbt.c (100%)
>  rename tests/{i915 => intel}/kms_fence_pin_leak.c (100%)
>  rename tests/{i915 => intel}/kms_flip_scaled_crc.c (100%)
>  rename tests/{i915 => intel}/kms_flip_tiling.c (100%)
>  rename tests/{i915 => intel}/kms_frontbuffer_tracking.c (100%)
>  rename tests/{i915 => intel}/kms_legacy_colorkey.c (100%)
>  rename tests/{i915 => intel}/kms_mmap_write_crc.c (100%)
>  rename tests/{i915 => intel}/kms_pipe_b_c_ivb.c (100%)
>  rename tests/{i915 => intel}/kms_psr.c (100%)
>  rename tests/{i915 => intel}/kms_psr2_sf.c (100%)
>  rename tests/{i915 => intel}/kms_psr2_su.c (100%)
>  rename tests/{i915 => intel}/kms_psr_stress_test.c (100%)
>  rename tests/{i915 => intel}/kms_pwrite_crc.c (100%)
>  rename tests/{i915 => intel}/perf.c (100%)
>  rename tests/{i915 => intel}/perf_pmu.c (100%)
>  rename tests/{i915 => intel}/sysfs_defaults.c (100%)
>  rename tests/{i915 => intel}/sysfs_heartbeat_interval.c (100%)
>  rename tests/{i915 => intel}/sysfs_preempt_timeout.c (100%)
>  rename tests/{i915 => intel}/sysfs_timeslice_duration.c (100%)
>  rename tests/{xe => intel}/xe_compute.c (100%)
>  rename tests/{xe => intel}/xe_create.c (100%)
>  rename tests/{xe => intel}/xe_debugfs.c (100%)
>  rename tests/{xe => intel}/xe_dma_buf_sync.c (100%)
>  rename tests/{xe => intel}/xe_evict.c (100%)
>  rename tests/{xe => intel}/xe_exec_balancer.c (100%)
>  rename tests/{xe => intel}/xe_exec_basic.c (100%)
>  rename tests/{xe => intel}/xe_exec_compute_mode.c (100%)
>  rename tests/{xe => intel}/xe_exec_fault_mode.c (100%)
>  rename tests/{xe => intel}/xe_exec_reset.c (100%)
>  rename tests/{xe => intel}/xe_exec_threads.c (100%)
>  rename tests/{xe => intel}/xe_gpgpu_fill.c (100%)
>  rename tests/{xe => intel}/xe_guc_pc.c (100%)
>  rename tests/{xe => intel}/xe_huc_copy.c (100%)
>  rename tests/{xe => intel}/xe_intel_bb.c (100%)
>  rename tests/{xe => intel}/xe_mmap.c (100%)
>  rename tests/{xe => intel}/xe_mmio.c (100%)
>  rename tests/{xe => intel}/xe_module_load.c (100%)
>  rename tests/{xe => intel}/xe_noexec_ping_pong.c (100%)
>  rename tests/{xe => intel}/xe_pm.c (100%)
>  rename tests/{xe => intel}/xe_prime_self_import.c (100%)
>  rename tests/{xe => intel}/xe_query.c (100%)
>  rename tests/{xe => intel}/xe_test_config.json (100%)
>  rename tests/{xe => intel}/xe_vm.c (100%)
>  rename tests/{xe => intel}/xe_waitfence.c (100%)
> 
> diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
> index 6cd44be5c..02c869a00 100644
> --- a/docs/testplan/meson.build
> +++ b/docs/testplan/meson.build
> @@ -6,7 +6,7 @@ rst2pdf = find_program('rst2pdf', required: false)
>  
>  stylesheet = join_paths(meson.current_source_dir(), 'testplan.css')
>  
> -xe_test_config = join_paths(source_root, 'tests', 'xe', 'xe_test_config.json')
> +xe_test_config = join_paths(source_root, 'tests', 'intel', 'xe_test_config.json')
>  kms_test_config = join_paths(source_root, 'tests', 'kms_test_config.json')
>  i915_test_config = join_paths(source_root, 'tests', 'i915', 'i915_test_config.json')
>  
> diff --git a/tests/i915/api_intel_allocator.c b/tests/intel/api_intel_allocator.c
> similarity index 100%
> rename from tests/i915/api_intel_allocator.c

[...cut...]

> diff --git a/tests/xe/xe_waitfence.c b/tests/intel/xe_waitfence.c
> similarity index 100%
> rename from tests/xe/xe_waitfence.c
> rename to tests/intel/xe_waitfence.c
> diff --git a/tests/meson.build b/tests/meson.build
> index 38f080f7c..14f81083f 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -83,7 +83,7 @@ test_progs = [
>  	'vgem_slow',
>  ]
>  
> -i915_progs = [
> +intel_progs = [
>  	'api_intel_allocator',
>  	'api_intel_bb',
>  	'gen3_mixed_blits',
> @@ -240,9 +240,6 @@ i915_progs = [
>  	'sysfs_heartbeat_interval',
>  	'sysfs_preempt_timeout',
>  	'sysfs_timeslice_duration',
> -]
> -
> -xe_progs = [
>  	'xe_create',
>  	'xe_compute',
>  	'xe_dma_buf_sync',
> @@ -307,9 +304,9 @@ foreach prog : test_progs
>  	test_list += prog
>  endforeach
>  
> -foreach prog : i915_progs
> +foreach prog : intel_progs
>  	test_executables += executable(prog,
> -		   join_paths('i915', prog + '.c'),
> +		   join_paths('intel', prog + '.c'),
>  		   dependencies : test_deps,
>  		   install_dir : libexecdir,
>  		   install_rpath : libexecdir_rpathdir,
> @@ -317,19 +314,6 @@ foreach prog : i915_progs
>  	test_list += prog
>  endforeach
>  
> -if build_xe
> -	foreach prog : xe_progs
> -		test_executables += executable(prog,
> -			   join_paths('xe', prog + '.c'),
> -			   dependencies : test_deps,
> -			   install_dir : libexecdir,
> -			   install_rpath : libexecdir_rpathdir,
> -			   install : true)
> -		test_list += prog
> -	endforeach
> -	build_info += 'Xe **experimental** tests enabled.'
> -endif
> -

This looks problematic as we want to have option for not building
xe_* binaries on linux platforms like Fedora or Ubuntu until
there will be Xe driver included on them.

Regards,
Kamil

>  foreach prog : msm_progs
>  	test_executables += executable(prog, join_paths('msm', prog + '.c'),
>  				       dependencies : test_deps,
> @@ -354,7 +338,7 @@ if chamelium.found()
>  endif
>  
>  test_executables += executable('drm_fdinfo',
> -	   join_paths('i915', 'drm_fdinfo.c'),
> +	   join_paths('intel', 'drm_fdinfo.c'),
>  	   dependencies : test_deps + [ lib_igt_drm_fdinfo ],
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -369,7 +353,7 @@ test_executables += executable('dumb_buffer', 'dumb_buffer.c',
>  test_list += 'dumb_buffer'
>  
>  test_executables += executable('gem_create',
> -	   join_paths('i915', 'gem_create.c'),
> +	   join_paths('intel', 'gem_create.c'),
>  	   dependencies : test_deps + [ libatomic ],
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -377,7 +361,7 @@ test_executables += executable('gem_create',
>  test_list += 'gem_create'
>  
>  test_executables += executable('gem_ctx_freq',
> -	   join_paths('i915', 'gem_ctx_freq.c'),
> +	   join_paths('intel', 'gem_ctx_freq.c'),
>  	   dependencies : test_deps + [ lib_igt_perf ],
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -385,7 +369,7 @@ test_executables += executable('gem_ctx_freq',
>  test_list += 'gem_ctx_freq'
>  
>  test_executables += executable('gem_ctx_sseu',
> -	   join_paths('i915', 'gem_ctx_sseu.c'),
> +	   join_paths('intel', 'gem_ctx_sseu.c'),
>  	   dependencies : test_deps + [ lib_igt_perf ],
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -393,14 +377,14 @@ test_executables += executable('gem_ctx_sseu',
>  test_list += 'gem_ctx_sseu'
>  
>  test_executables += executable('gem_eio',
> -	   join_paths('i915', 'gem_eio.c'),
> +	   join_paths('intel', 'gem_eio.c'),
>  	   dependencies : test_deps + [ realtime ],
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
>  	   install : true)
>  test_list += 'gem_eio'
>  
> -test_executables += executable('gem_exec_balancer', 'i915/gem_exec_balancer.c',
> +test_executables += executable('gem_exec_balancer', 'intel/gem_exec_balancer.c',
>  	   dependencies : test_deps + [ lib_igt_perf ],
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -408,7 +392,7 @@ test_executables += executable('gem_exec_balancer', 'i915/gem_exec_balancer.c',
>  test_list += 'gem_exec_balancer'
>  
>  test_executables += executable('gem_mmap_offset',
> -	   join_paths('i915', 'gem_mmap_offset.c'),
> +	   join_paths('intel', 'gem_mmap_offset.c'),
>  	   dependencies : test_deps + [ libatomic ],
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -416,7 +400,7 @@ test_executables += executable('gem_mmap_offset',
>  test_list += 'gem_mmap_offset'
>  
>  test_executables += executable('i915_pm_freq_mult',
> -	   join_paths('i915', 'i915_pm_freq_mult.c'),
> +	   join_paths('intel', 'i915_pm_freq_mult.c'),
>  	   dependencies : test_deps + [ lib_igt_perf ],
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -424,7 +408,7 @@ test_executables += executable('i915_pm_freq_mult',
>  test_list += 'i915_pm_freq_mult'
>  
>  test_executables += executable('i915_pm_rc6_residency',
> -	   join_paths('i915', 'i915_pm_rc6_residency.c'),
> +	   join_paths('intel', 'i915_pm_rc6_residency.c'),
>  	   dependencies : test_deps + [ lib_igt_perf ],
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -432,7 +416,7 @@ test_executables += executable('i915_pm_rc6_residency',
>  test_list += 'i915_pm_rc6_residency'
>  
>  test_executables += executable('gem_barrier_race',
> -	   join_paths('i915', 'gem_barrier_race.c'),
> +	   join_paths('intel', 'gem_barrier_race.c'),
>  	   dependencies : test_deps + [ lib_igt_i915_perf ],
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -440,7 +424,7 @@ test_executables += executable('gem_barrier_race',
>  test_list += 'gem_barrier_race'
>  
>  test_executables += executable('perf_pmu',
> -	   join_paths('i915', 'perf_pmu.c'),
> +	   join_paths('intel', 'perf_pmu.c'),
>  	   dependencies : test_deps + [ lib_igt_perf ],
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -448,7 +432,7 @@ test_executables += executable('perf_pmu',
>  test_list += 'perf_pmu'
>  
>  test_executables += executable('perf',
> -	   join_paths('i915', 'perf.c'),
> +	   join_paths('intel', 'perf.c'),
>  	   dependencies : test_deps + [ lib_igt_i915_perf ],
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -478,7 +462,7 @@ test_executables += executable('kms_color',
>  test_list += 'kms_color'
>  
>  test_executables += executable('kms_dsc',
> -	   [ join_paths('i915', 'kms_dsc.c'), join_paths ('i915', 'kms_dsc_helper.c')],
> +	   [ join_paths('intel', 'kms_dsc.c'), join_paths ('intel', 'kms_dsc_helper.c')],
>  	   dependencies : test_deps,
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -486,7 +470,7 @@ test_executables += executable('kms_dsc',
>  test_list += 'kms_dsc'
>  
>  test_executables += executable('kms_psr2_sf',
> -	   [ join_paths('i915', 'kms_psr2_sf.c'), join_paths ('i915', 'kms_dsc_helper.c')],
> +	   [ join_paths('intel', 'kms_psr2_sf.c'), join_paths ('intel', 'kms_dsc_helper.c')],
>  	   dependencies : test_deps,
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -525,7 +509,7 @@ test_list_target = custom_target('testlist',
>  	      install : true,
>  	      install_dir : libexecdir)
>  
> -test_executables += executable('gem_concurrent_all', 'i915/gem_concurrent_all.c',
> +test_executables += executable('gem_concurrent_all', 'intel/gem_concurrent_all.c',
>  	   dependencies : test_deps + [ libatomic ],
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -543,7 +527,7 @@ foreach prog : test_list
>  	test('testcase check ' + prog, test_script, args : prog)
>  endforeach
>  
> -executable('gem_stress', 'i915/gem_stress.c',
> +executable('gem_stress', 'intel/gem_stress.c',
>  	   install : true,
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> -- 
> 2.40.0
> 

