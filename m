Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86CB410E645
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Apr 2023 03:53:55 +0000 (UTC)
Date: Tue, 25 Apr 2023 05:53:47 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <20230425035347.bkk3k7y2ybtaxwxe@zkempczy-mobl2>
References: <20230424080233.2016931-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230424080233.2016931-1-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t] tests: New dir structure for intel specific
 tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Apr 24, 2023 at 01:32:33PM +0530, Bhanuprakash Modem wrote:
> As we have many KMS tests those can support both i915 & XE, we
> can have new dir structure to place tests in a proper location.
> 
> Below is the new dir structure:
> - tests/intel/i915/ : All i915 specific tests should move here.
> - tests/intel/xe/   : All XE specific tests should move here.
> - tests/intel/      : Tests those supports both i915 & XE should
>                       move here. Example: kms_psr

As test name say nothing about driver it requires introducing
directory separation makes this clear. At least for me, so:

Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Before you decide to merge collect other comments, this introduces
new order and people should be aware of it.

--
Zbigniew

> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  docs/testplan/meson.build                     |  2 +-
>  tests/{ => intel}/i915/api_intel_allocator.c  |  0
>  tests/{ => intel}/i915/api_intel_bb.c         |  0
>  tests/{ => intel}/i915/drm_fdinfo.c           |  0
>  tests/{ => intel}/i915/gem_bad_reloc.c        |  0
>  tests/{ => intel}/i915/gem_barrier_race.c     |  0
>  tests/{ => intel}/i915/gem_basic.c            |  0
>  tests/{ => intel}/i915/gem_blits.c            |  0
>  tests/{ => intel}/i915/gem_busy.c             |  0
>  tests/{ => intel}/i915/gem_caching.c          |  0
>  tests/{ => intel}/i915/gem_ccs.c              |  0
>  tests/{ => intel}/i915/gem_close.c            |  0
>  tests/{ => intel}/i915/gem_close_race.c       |  0
>  tests/{ => intel}/i915/gem_concurrent_all.c   |  0
>  tests/{ => intel}/i915/gem_concurrent_blit.c  |  0
>  tests/{ => intel}/i915/gem_create.c           |  0
>  tests/{ => intel}/i915/gem_cs_tlb.c           |  0
>  tests/{ => intel}/i915/gem_ctx_bad_destroy.c  |  0
>  tests/{ => intel}/i915/gem_ctx_create.c       |  0
>  tests/{ => intel}/i915/gem_ctx_engines.c      |  0
>  tests/{ => intel}/i915/gem_ctx_exec.c         |  0
>  tests/{ => intel}/i915/gem_ctx_freq.c         |  0
>  tests/{ => intel}/i915/gem_ctx_isolation.c    |  0
>  tests/{ => intel}/i915/gem_ctx_param.c        |  0
>  tests/{ => intel}/i915/gem_ctx_persistence.c  |  0
>  tests/{ => intel}/i915/gem_ctx_shared.c       |  0
>  tests/{ => intel}/i915/gem_ctx_sseu.c         |  0
>  tests/{ => intel}/i915/gem_ctx_switch.c       |  0
>  tests/{ => intel}/i915/gem_eio.c              |  0
>  tests/{ => intel}/i915/gem_evict_alignment.c  |  0
>  tests/{ => intel}/i915/gem_evict_everything.c |  0
>  tests/{ => intel}/i915/gem_exec_alignment.c   |  0
>  tests/{ => intel}/i915/gem_exec_async.c       |  0
>  tests/{ => intel}/i915/gem_exec_await.c       |  0
>  tests/{ => intel}/i915/gem_exec_balancer.c    |  0
>  tests/{ => intel}/i915/gem_exec_basic.c       |  0
>  tests/{ => intel}/i915/gem_exec_big.c         |  0
>  tests/{ => intel}/i915/gem_exec_capture.c     |  0
>  tests/{ => intel}/i915/gem_exec_create.c      |  0
>  tests/{ => intel}/i915/gem_exec_endless.c     |  0
>  tests/{ => intel}/i915/gem_exec_fair.c        |  0
>  tests/{ => intel}/i915/gem_exec_fence.c       |  0
>  tests/{ => intel}/i915/gem_exec_flush.c       |  0
>  tests/{ => intel}/i915/gem_exec_gttfill.c     |  0
>  tests/{ => intel}/i915/gem_exec_latency.c     |  0
>  tests/{ => intel}/i915/gem_exec_lut_handle.c  |  0
>  tests/{ => intel}/i915/gem_exec_nop.c         |  0
>  tests/{ => intel}/i915/gem_exec_parallel.c    |  0
>  tests/{ => intel}/i915/gem_exec_params.c      |  0
>  tests/{ => intel}/i915/gem_exec_reloc.c       |  0
>  tests/{ => intel}/i915/gem_exec_schedule.c    |  0
>  tests/{ => intel}/i915/gem_exec_store.c       |  0
>  tests/{ => intel}/i915/gem_exec_suspend.c     |  0
>  tests/{ => intel}/i915/gem_exec_whisper.c     |  0
>  tests/{ => intel}/i915/gem_exercise_blt.c     |  0
>  tests/{ => intel}/i915/gem_fd_exhaustion.c    |  0
>  tests/{ => intel}/i915/gem_fence_thrash.c     |  0
>  tests/{ => intel}/i915/gem_fence_upload.c     |  0
>  .../{ => intel}/i915/gem_fenced_exec_thrash.c |  0
>  tests/{ => intel}/i915/gem_flink_basic.c      |  0
>  tests/{ => intel}/i915/gem_flink_race.c       |  0
>  tests/{ => intel}/i915/gem_gpgpu_fill.c       |  0
>  tests/{ => intel}/i915/gem_gtt_cpu_tlb.c      |  0
>  tests/{ => intel}/i915/gem_gtt_hog.c          |  0
>  tests/{ => intel}/i915/gem_gtt_speed.c        |  0
>  tests/{ => intel}/i915/gem_huc_copy.c         |  0
>  tests/{ => intel}/i915/gem_linear_blits.c     |  0
>  tests/{ => intel}/i915/gem_lmem_evict.c       |  0
>  tests/{ => intel}/i915/gem_lmem_swapping.c    |  0
>  tests/{ => intel}/i915/gem_lut_handle.c       |  0
>  tests/{ => intel}/i915/gem_madvise.c          |  0
>  tests/{ => intel}/i915/gem_media_fill.c       |  0
>  tests/{ => intel}/i915/gem_media_vme.c        |  0
>  tests/{ => intel}/i915/gem_mmap.c             |  0
>  tests/{ => intel}/i915/gem_mmap_gtt.c         |  0
>  tests/{ => intel}/i915/gem_mmap_offset.c      |  0
>  tests/{ => intel}/i915/gem_mmap_wc.c          |  0
>  .../i915/gem_partial_pwrite_pread.c           |  0
>  .../i915/gem_pipe_control_store_loop.c        |  0
>  tests/{ => intel}/i915/gem_ppgtt.c            |  0
>  tests/{ => intel}/i915/gem_pread.c            |  0
>  tests/{ => intel}/i915/gem_pread_after_blit.c |  0
>  tests/{ => intel}/i915/gem_pwrite.c           |  0
>  tests/{ => intel}/i915/gem_pwrite_snooped.c   |  0
>  tests/{ => intel}/i915/gem_pxp.c              |  0
>  tests/{ => intel}/i915/gem_read_read_speed.c  |  0
>  tests/{ => intel}/i915/gem_readwrite.c        |  0
>  tests/{ => intel}/i915/gem_reg_read.c         |  0
>  tests/{ => intel}/i915/gem_render_copy.c      |  0
>  .../{ => intel}/i915/gem_render_copy_redux.c  |  0
>  .../i915/gem_render_linear_blits.c            |  0
>  .../{ => intel}/i915/gem_render_tiled_blits.c |  0
>  tests/{ => intel}/i915/gem_request_retire.c   |  0
>  tests/{ => intel}/i915/gem_reset_stats.c      |  0
>  tests/{ => intel}/i915/gem_ringfill.c         |  0
>  .../{ => intel}/i915/gem_set_tiling_vs_blt.c  |  0
>  .../{ => intel}/i915/gem_set_tiling_vs_gtt.c  |  0
>  .../i915/gem_set_tiling_vs_pwrite.c           |  0
>  tests/{ => intel}/i915/gem_shrink.c           |  0
>  tests/{ => intel}/i915/gem_softpin.c          |  0
>  tests/{ => intel}/i915/gem_spin_batch.c       |  0
>  tests/{ => intel}/i915/gem_streaming_writes.c |  0
>  tests/{ => intel}/i915/gem_stress.c           |  0
>  tests/{ => intel}/i915/gem_sync.c             |  0
>  tests/{ => intel}/i915/gem_tiled_blits.c      |  0
>  .../{ => intel}/i915/gem_tiled_fence_blits.c  |  0
>  .../i915/gem_tiled_partial_pwrite_pread.c     |  0
>  .../{ => intel}/i915/gem_tiled_pread_basic.c  |  0
>  .../{ => intel}/i915/gem_tiled_pread_pwrite.c |  0
>  tests/{ => intel}/i915/gem_tiled_swapping.c   |  0
>  tests/{ => intel}/i915/gem_tiled_wb.c         |  0
>  tests/{ => intel}/i915/gem_tiled_wc.c         |  0
>  .../{ => intel}/i915/gem_tiling_max_stride.c  |  0
>  .../i915/gem_unfence_active_buffers.c         |  0
>  .../i915/gem_unref_active_buffers.c           |  0
>  tests/{ => intel}/i915/gem_userptr_blits.c    |  0
>  tests/{ => intel}/i915/gem_vm_create.c        |  0
>  tests/{ => intel}/i915/gem_wait.c             |  0
>  tests/{ => intel}/i915/gem_watchdog.c         |  0
>  tests/{ => intel}/i915/gem_workarounds.c      |  0
>  tests/{ => intel}/i915/gen3_mixed_blits.c     |  0
>  .../i915/gen3_render_linear_blits.c           |  0
>  .../i915/gen3_render_mixed_blits.c            |  0
>  .../i915/gen3_render_tiledx_blits.c           |  0
>  .../i915/gen3_render_tiledy_blits.c           |  0
>  tests/{ => intel}/i915/gen7_exec_parse.c      |  0
>  tests/{ => intel}/i915/gen9_exec_parse.c      |  0
>  tests/{ => intel}/i915/i915_fb_tiling.c       |  0
>  tests/{ => intel}/i915/i915_getparams_basic.c |  0
>  tests/{ => intel}/i915/i915_hangman.c         |  0
>  tests/{ => intel}/i915/i915_hwmon.c           |  0
>  tests/{ => intel}/i915/i915_module_load.c     |  0
>  tests/{ => intel}/i915/i915_pciid.c           |  0
>  tests/{ => intel}/i915/i915_pipe_stress.c     |  0
>  tests/{ => intel}/i915/i915_pm_backlight.c    |  0
>  tests/{ => intel}/i915/i915_pm_dc.c           |  0
>  tests/{ => intel}/i915/i915_pm_freq_mult.c    |  0
>  tests/{ => intel}/i915/i915_pm_lpsp.c         |  0
>  .../{ => intel}/i915/i915_pm_rc6_residency.c  |  0
>  tests/{ => intel}/i915/i915_pm_rpm.c          |  0
>  tests/{ => intel}/i915/i915_pm_rps.c          |  0
>  tests/{ => intel}/i915/i915_pm_sseu.c         |  0
>  tests/{ => intel}/i915/i915_power.c           |  0
>  tests/{ => intel}/i915/i915_query.c           |  0
>  tests/{ => intel}/i915/i915_selftest.c        |  0
>  tests/{ => intel}/i915/i915_suspend.c         |  0
>  tests/{ => intel}/i915/kms_big_fb.c           |  0
>  tests/{ => intel}/i915/kms_big_joiner.c       |  0
>  tests/{ => intel}/i915/kms_busy.c             |  0
>  tests/{ => intel}/i915/kms_ccs.c              |  0
>  tests/{ => intel}/i915/kms_cdclk.c            |  0
>  tests/{ => intel}/i915/kms_draw_crc.c         |  0
>  tests/{ => intel}/i915/kms_dsc.c              |  0
>  tests/{ => intel}/i915/kms_dsc_helper.c       |  0
>  tests/{ => intel}/i915/kms_dsc_helper.h       |  0
>  tests/{ => intel}/i915/kms_fbcon_fbt.c        |  0
>  tests/{ => intel}/i915/kms_fence_pin_leak.c   |  0
>  tests/{ => intel}/i915/kms_flip_scaled_crc.c  |  0
>  tests/{ => intel}/i915/kms_flip_tiling.c      |  0
>  .../i915/kms_frontbuffer_tracking.c           |  0
>  tests/{ => intel}/i915/kms_legacy_colorkey.c  |  0
>  tests/{ => intel}/i915/kms_mmap_write_crc.c   |  0
>  tests/{ => intel}/i915/kms_pipe_b_c_ivb.c     |  0
>  tests/{ => intel}/i915/kms_pwrite_crc.c       |  0
>  tests/{ => intel}/i915/perf.c                 |  0
>  tests/{ => intel}/i915/perf_pmu.c             |  0
>  tests/{ => intel}/i915/sysfs_defaults.c       |  0
>  .../i915/sysfs_heartbeat_interval.c           |  0
>  .../{ => intel}/i915/sysfs_preempt_timeout.c  |  0
>  .../i915/sysfs_timeslice_duration.c           |  0
>  tests/{i915 => intel}/kms_psr.c               |  0
>  tests/{i915 => intel}/kms_psr2_sf.c           |  2 +-
>  tests/{i915 => intel}/kms_psr2_su.c           |  0
>  tests/{i915 => intel}/kms_psr_stress_test.c   |  0
>  tests/{ => intel}/xe/xe_compute.c             |  0
>  tests/{ => intel}/xe/xe_create.c              |  0
>  tests/{ => intel}/xe/xe_debugfs.c             |  0
>  tests/{ => intel}/xe/xe_dma_buf_sync.c        |  0
>  tests/{ => intel}/xe/xe_evict.c               |  0
>  tests/{ => intel}/xe/xe_exec_balancer.c       |  0
>  tests/{ => intel}/xe/xe_exec_basic.c          |  0
>  tests/{ => intel}/xe/xe_exec_compute_mode.c   |  0
>  tests/{ => intel}/xe/xe_exec_fault_mode.c     |  0
>  tests/{ => intel}/xe/xe_exec_reset.c          |  0
>  tests/{ => intel}/xe/xe_exec_threads.c        |  0
>  tests/{ => intel}/xe/xe_guc_pc.c              |  0
>  tests/{ => intel}/xe/xe_huc_copy.c            |  0
>  tests/{ => intel}/xe/xe_mmap.c                |  0
>  tests/{ => intel}/xe/xe_mmio.c                |  0
>  tests/{ => intel}/xe/xe_module_load.c         |  0
>  tests/{ => intel}/xe/xe_noexec_ping_pong.c    |  0
>  tests/{ => intel}/xe/xe_pm.c                  |  0
>  tests/{ => intel}/xe/xe_prime_self_import.c   |  0
>  tests/{ => intel}/xe/xe_query.c               |  0
>  tests/{ => intel}/xe/xe_test_config.json      |  0
>  tests/{ => intel}/xe/xe_vm.c                  |  0
>  tests/{ => intel}/xe/xe_waitfence.c           |  0
>  tests/meson.build                             | 55 ++++++++++++-------
>  198 files changed, 36 insertions(+), 23 deletions(-)
>  rename tests/{ => intel}/i915/api_intel_allocator.c (100%)
>  rename tests/{ => intel}/i915/api_intel_bb.c (100%)
>  rename tests/{ => intel}/i915/drm_fdinfo.c (100%)
>  rename tests/{ => intel}/i915/gem_bad_reloc.c (100%)
>  rename tests/{ => intel}/i915/gem_barrier_race.c (100%)
>  rename tests/{ => intel}/i915/gem_basic.c (100%)
>  rename tests/{ => intel}/i915/gem_blits.c (100%)
>  rename tests/{ => intel}/i915/gem_busy.c (100%)
>  rename tests/{ => intel}/i915/gem_caching.c (100%)
>  rename tests/{ => intel}/i915/gem_ccs.c (100%)
>  rename tests/{ => intel}/i915/gem_close.c (100%)
>  rename tests/{ => intel}/i915/gem_close_race.c (100%)
>  rename tests/{ => intel}/i915/gem_concurrent_all.c (100%)
>  rename tests/{ => intel}/i915/gem_concurrent_blit.c (100%)
>  rename tests/{ => intel}/i915/gem_create.c (100%)
>  rename tests/{ => intel}/i915/gem_cs_tlb.c (100%)
>  rename tests/{ => intel}/i915/gem_ctx_bad_destroy.c (100%)
>  rename tests/{ => intel}/i915/gem_ctx_create.c (100%)
>  rename tests/{ => intel}/i915/gem_ctx_engines.c (100%)
>  rename tests/{ => intel}/i915/gem_ctx_exec.c (100%)
>  rename tests/{ => intel}/i915/gem_ctx_freq.c (100%)
>  rename tests/{ => intel}/i915/gem_ctx_isolation.c (100%)
>  rename tests/{ => intel}/i915/gem_ctx_param.c (100%)
>  rename tests/{ => intel}/i915/gem_ctx_persistence.c (100%)
>  rename tests/{ => intel}/i915/gem_ctx_shared.c (100%)
>  rename tests/{ => intel}/i915/gem_ctx_sseu.c (100%)
>  rename tests/{ => intel}/i915/gem_ctx_switch.c (100%)
>  rename tests/{ => intel}/i915/gem_eio.c (100%)
>  rename tests/{ => intel}/i915/gem_evict_alignment.c (100%)
>  rename tests/{ => intel}/i915/gem_evict_everything.c (100%)
>  rename tests/{ => intel}/i915/gem_exec_alignment.c (100%)
>  rename tests/{ => intel}/i915/gem_exec_async.c (100%)
>  rename tests/{ => intel}/i915/gem_exec_await.c (100%)
>  rename tests/{ => intel}/i915/gem_exec_balancer.c (100%)
>  rename tests/{ => intel}/i915/gem_exec_basic.c (100%)
>  rename tests/{ => intel}/i915/gem_exec_big.c (100%)
>  rename tests/{ => intel}/i915/gem_exec_capture.c (100%)
>  rename tests/{ => intel}/i915/gem_exec_create.c (100%)
>  rename tests/{ => intel}/i915/gem_exec_endless.c (100%)
>  rename tests/{ => intel}/i915/gem_exec_fair.c (100%)
>  rename tests/{ => intel}/i915/gem_exec_fence.c (100%)
>  rename tests/{ => intel}/i915/gem_exec_flush.c (100%)
>  rename tests/{ => intel}/i915/gem_exec_gttfill.c (100%)
>  rename tests/{ => intel}/i915/gem_exec_latency.c (100%)
>  rename tests/{ => intel}/i915/gem_exec_lut_handle.c (100%)
>  rename tests/{ => intel}/i915/gem_exec_nop.c (100%)
>  rename tests/{ => intel}/i915/gem_exec_parallel.c (100%)
>  rename tests/{ => intel}/i915/gem_exec_params.c (100%)
>  rename tests/{ => intel}/i915/gem_exec_reloc.c (100%)
>  rename tests/{ => intel}/i915/gem_exec_schedule.c (100%)
>  rename tests/{ => intel}/i915/gem_exec_store.c (100%)
>  rename tests/{ => intel}/i915/gem_exec_suspend.c (100%)
>  rename tests/{ => intel}/i915/gem_exec_whisper.c (100%)
>  rename tests/{ => intel}/i915/gem_exercise_blt.c (100%)
>  rename tests/{ => intel}/i915/gem_fd_exhaustion.c (100%)
>  rename tests/{ => intel}/i915/gem_fence_thrash.c (100%)
>  rename tests/{ => intel}/i915/gem_fence_upload.c (100%)
>  rename tests/{ => intel}/i915/gem_fenced_exec_thrash.c (100%)
>  rename tests/{ => intel}/i915/gem_flink_basic.c (100%)
>  rename tests/{ => intel}/i915/gem_flink_race.c (100%)
>  rename tests/{ => intel}/i915/gem_gpgpu_fill.c (100%)
>  rename tests/{ => intel}/i915/gem_gtt_cpu_tlb.c (100%)
>  rename tests/{ => intel}/i915/gem_gtt_hog.c (100%)
>  rename tests/{ => intel}/i915/gem_gtt_speed.c (100%)
>  rename tests/{ => intel}/i915/gem_huc_copy.c (100%)
>  rename tests/{ => intel}/i915/gem_linear_blits.c (100%)
>  rename tests/{ => intel}/i915/gem_lmem_evict.c (100%)
>  rename tests/{ => intel}/i915/gem_lmem_swapping.c (100%)
>  rename tests/{ => intel}/i915/gem_lut_handle.c (100%)
>  rename tests/{ => intel}/i915/gem_madvise.c (100%)
>  rename tests/{ => intel}/i915/gem_media_fill.c (100%)
>  rename tests/{ => intel}/i915/gem_media_vme.c (100%)
>  rename tests/{ => intel}/i915/gem_mmap.c (100%)
>  rename tests/{ => intel}/i915/gem_mmap_gtt.c (100%)
>  rename tests/{ => intel}/i915/gem_mmap_offset.c (100%)
>  rename tests/{ => intel}/i915/gem_mmap_wc.c (100%)
>  rename tests/{ => intel}/i915/gem_partial_pwrite_pread.c (100%)
>  rename tests/{ => intel}/i915/gem_pipe_control_store_loop.c (100%)
>  rename tests/{ => intel}/i915/gem_ppgtt.c (100%)
>  rename tests/{ => intel}/i915/gem_pread.c (100%)
>  rename tests/{ => intel}/i915/gem_pread_after_blit.c (100%)
>  rename tests/{ => intel}/i915/gem_pwrite.c (100%)
>  rename tests/{ => intel}/i915/gem_pwrite_snooped.c (100%)
>  rename tests/{ => intel}/i915/gem_pxp.c (100%)
>  rename tests/{ => intel}/i915/gem_read_read_speed.c (100%)
>  rename tests/{ => intel}/i915/gem_readwrite.c (100%)
>  rename tests/{ => intel}/i915/gem_reg_read.c (100%)
>  rename tests/{ => intel}/i915/gem_render_copy.c (100%)
>  rename tests/{ => intel}/i915/gem_render_copy_redux.c (100%)
>  rename tests/{ => intel}/i915/gem_render_linear_blits.c (100%)
>  rename tests/{ => intel}/i915/gem_render_tiled_blits.c (100%)
>  rename tests/{ => intel}/i915/gem_request_retire.c (100%)
>  rename tests/{ => intel}/i915/gem_reset_stats.c (100%)
>  rename tests/{ => intel}/i915/gem_ringfill.c (100%)
>  rename tests/{ => intel}/i915/gem_set_tiling_vs_blt.c (100%)
>  rename tests/{ => intel}/i915/gem_set_tiling_vs_gtt.c (100%)
>  rename tests/{ => intel}/i915/gem_set_tiling_vs_pwrite.c (100%)
>  rename tests/{ => intel}/i915/gem_shrink.c (100%)
>  rename tests/{ => intel}/i915/gem_softpin.c (100%)
>  rename tests/{ => intel}/i915/gem_spin_batch.c (100%)
>  rename tests/{ => intel}/i915/gem_streaming_writes.c (100%)
>  rename tests/{ => intel}/i915/gem_stress.c (100%)
>  rename tests/{ => intel}/i915/gem_sync.c (100%)
>  rename tests/{ => intel}/i915/gem_tiled_blits.c (100%)
>  rename tests/{ => intel}/i915/gem_tiled_fence_blits.c (100%)
>  rename tests/{ => intel}/i915/gem_tiled_partial_pwrite_pread.c (100%)
>  rename tests/{ => intel}/i915/gem_tiled_pread_basic.c (100%)
>  rename tests/{ => intel}/i915/gem_tiled_pread_pwrite.c (100%)
>  rename tests/{ => intel}/i915/gem_tiled_swapping.c (100%)
>  rename tests/{ => intel}/i915/gem_tiled_wb.c (100%)
>  rename tests/{ => intel}/i915/gem_tiled_wc.c (100%)
>  rename tests/{ => intel}/i915/gem_tiling_max_stride.c (100%)
>  rename tests/{ => intel}/i915/gem_unfence_active_buffers.c (100%)
>  rename tests/{ => intel}/i915/gem_unref_active_buffers.c (100%)
>  rename tests/{ => intel}/i915/gem_userptr_blits.c (100%)
>  rename tests/{ => intel}/i915/gem_vm_create.c (100%)
>  rename tests/{ => intel}/i915/gem_wait.c (100%)
>  rename tests/{ => intel}/i915/gem_watchdog.c (100%)
>  rename tests/{ => intel}/i915/gem_workarounds.c (100%)
>  rename tests/{ => intel}/i915/gen3_mixed_blits.c (100%)
>  rename tests/{ => intel}/i915/gen3_render_linear_blits.c (100%)
>  rename tests/{ => intel}/i915/gen3_render_mixed_blits.c (100%)
>  rename tests/{ => intel}/i915/gen3_render_tiledx_blits.c (100%)
>  rename tests/{ => intel}/i915/gen3_render_tiledy_blits.c (100%)
>  rename tests/{ => intel}/i915/gen7_exec_parse.c (100%)
>  rename tests/{ => intel}/i915/gen9_exec_parse.c (100%)
>  rename tests/{ => intel}/i915/i915_fb_tiling.c (100%)
>  rename tests/{ => intel}/i915/i915_getparams_basic.c (100%)
>  rename tests/{ => intel}/i915/i915_hangman.c (100%)
>  rename tests/{ => intel}/i915/i915_hwmon.c (100%)
>  rename tests/{ => intel}/i915/i915_module_load.c (100%)
>  rename tests/{ => intel}/i915/i915_pciid.c (100%)
>  rename tests/{ => intel}/i915/i915_pipe_stress.c (100%)
>  rename tests/{ => intel}/i915/i915_pm_backlight.c (100%)
>  rename tests/{ => intel}/i915/i915_pm_dc.c (100%)
>  rename tests/{ => intel}/i915/i915_pm_freq_mult.c (100%)
>  rename tests/{ => intel}/i915/i915_pm_lpsp.c (100%)
>  rename tests/{ => intel}/i915/i915_pm_rc6_residency.c (100%)
>  rename tests/{ => intel}/i915/i915_pm_rpm.c (100%)
>  rename tests/{ => intel}/i915/i915_pm_rps.c (100%)
>  rename tests/{ => intel}/i915/i915_pm_sseu.c (100%)
>  rename tests/{ => intel}/i915/i915_power.c (100%)
>  rename tests/{ => intel}/i915/i915_query.c (100%)
>  rename tests/{ => intel}/i915/i915_selftest.c (100%)
>  rename tests/{ => intel}/i915/i915_suspend.c (100%)
>  rename tests/{ => intel}/i915/kms_big_fb.c (100%)
>  rename tests/{ => intel}/i915/kms_big_joiner.c (100%)
>  rename tests/{ => intel}/i915/kms_busy.c (100%)
>  rename tests/{ => intel}/i915/kms_ccs.c (100%)
>  rename tests/{ => intel}/i915/kms_cdclk.c (100%)
>  rename tests/{ => intel}/i915/kms_draw_crc.c (100%)
>  rename tests/{ => intel}/i915/kms_dsc.c (100%)
>  rename tests/{ => intel}/i915/kms_dsc_helper.c (100%)
>  rename tests/{ => intel}/i915/kms_dsc_helper.h (100%)
>  rename tests/{ => intel}/i915/kms_fbcon_fbt.c (100%)
>  rename tests/{ => intel}/i915/kms_fence_pin_leak.c (100%)
>  rename tests/{ => intel}/i915/kms_flip_scaled_crc.c (100%)
>  rename tests/{ => intel}/i915/kms_flip_tiling.c (100%)
>  rename tests/{ => intel}/i915/kms_frontbuffer_tracking.c (100%)
>  rename tests/{ => intel}/i915/kms_legacy_colorkey.c (100%)
>  rename tests/{ => intel}/i915/kms_mmap_write_crc.c (100%)
>  rename tests/{ => intel}/i915/kms_pipe_b_c_ivb.c (100%)
>  rename tests/{ => intel}/i915/kms_pwrite_crc.c (100%)
>  rename tests/{ => intel}/i915/perf.c (100%)
>  rename tests/{ => intel}/i915/perf_pmu.c (100%)
>  rename tests/{ => intel}/i915/sysfs_defaults.c (100%)
>  rename tests/{ => intel}/i915/sysfs_heartbeat_interval.c (100%)
>  rename tests/{ => intel}/i915/sysfs_preempt_timeout.c (100%)
>  rename tests/{ => intel}/i915/sysfs_timeslice_duration.c (100%)
>  rename tests/{i915 => intel}/kms_psr.c (100%)
>  rename tests/{i915 => intel}/kms_psr2_sf.c (99%)
>  rename tests/{i915 => intel}/kms_psr2_su.c (100%)
>  rename tests/{i915 => intel}/kms_psr_stress_test.c (100%)
>  rename tests/{ => intel}/xe/xe_compute.c (100%)
>  rename tests/{ => intel}/xe/xe_create.c (100%)
>  rename tests/{ => intel}/xe/xe_debugfs.c (100%)
>  rename tests/{ => intel}/xe/xe_dma_buf_sync.c (100%)
>  rename tests/{ => intel}/xe/xe_evict.c (100%)
>  rename tests/{ => intel}/xe/xe_exec_balancer.c (100%)
>  rename tests/{ => intel}/xe/xe_exec_basic.c (100%)
>  rename tests/{ => intel}/xe/xe_exec_compute_mode.c (100%)
>  rename tests/{ => intel}/xe/xe_exec_fault_mode.c (100%)
>  rename tests/{ => intel}/xe/xe_exec_reset.c (100%)
>  rename tests/{ => intel}/xe/xe_exec_threads.c (100%)
>  rename tests/{ => intel}/xe/xe_guc_pc.c (100%)
>  rename tests/{ => intel}/xe/xe_huc_copy.c (100%)
>  rename tests/{ => intel}/xe/xe_mmap.c (100%)
>  rename tests/{ => intel}/xe/xe_mmio.c (100%)
>  rename tests/{ => intel}/xe/xe_module_load.c (100%)
>  rename tests/{ => intel}/xe/xe_noexec_ping_pong.c (100%)
>  rename tests/{ => intel}/xe/xe_pm.c (100%)
>  rename tests/{ => intel}/xe/xe_prime_self_import.c (100%)
>  rename tests/{ => intel}/xe/xe_query.c (100%)
>  rename tests/{ => intel}/xe/xe_test_config.json (100%)
>  rename tests/{ => intel}/xe/xe_vm.c (100%)
>  rename tests/{ => intel}/xe/xe_waitfence.c (100%)
> 
> diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
> index 3347f6187..0617859a9 100644
> --- a/docs/testplan/meson.build
> +++ b/docs/testplan/meson.build
> @@ -6,7 +6,7 @@ rst2pdf = find_program('rst2pdf', required: false)
>  
>  stylesheet = join_paths(meson.current_source_dir(), 'testplan.css')
>  
> -xe_test_config = join_paths(source_root, 'tests', 'xe', 'xe_test_config.json')
> +xe_test_config = join_paths(source_root, 'tests', 'intel/xe', 'xe_test_config.json')
>  
>  check_testlist = []
>  if build_tests
> diff --git a/tests/i915/api_intel_allocator.c b/tests/intel/i915/api_intel_allocator.c
> similarity index 100%
> rename from tests/i915/api_intel_allocator.c
> rename to tests/intel/i915/api_intel_allocator.c
> diff --git a/tests/i915/api_intel_bb.c b/tests/intel/i915/api_intel_bb.c
> similarity index 100%
> rename from tests/i915/api_intel_bb.c
> rename to tests/intel/i915/api_intel_bb.c
> diff --git a/tests/i915/drm_fdinfo.c b/tests/intel/i915/drm_fdinfo.c
> similarity index 100%
> rename from tests/i915/drm_fdinfo.c
> rename to tests/intel/i915/drm_fdinfo.c
> diff --git a/tests/i915/gem_bad_reloc.c b/tests/intel/i915/gem_bad_reloc.c
> similarity index 100%
> rename from tests/i915/gem_bad_reloc.c
> rename to tests/intel/i915/gem_bad_reloc.c
> diff --git a/tests/i915/gem_barrier_race.c b/tests/intel/i915/gem_barrier_race.c
> similarity index 100%
> rename from tests/i915/gem_barrier_race.c
> rename to tests/intel/i915/gem_barrier_race.c
> diff --git a/tests/i915/gem_basic.c b/tests/intel/i915/gem_basic.c
> similarity index 100%
> rename from tests/i915/gem_basic.c
> rename to tests/intel/i915/gem_basic.c
> diff --git a/tests/i915/gem_blits.c b/tests/intel/i915/gem_blits.c
> similarity index 100%
> rename from tests/i915/gem_blits.c
> rename to tests/intel/i915/gem_blits.c
> diff --git a/tests/i915/gem_busy.c b/tests/intel/i915/gem_busy.c
> similarity index 100%
> rename from tests/i915/gem_busy.c
> rename to tests/intel/i915/gem_busy.c
> diff --git a/tests/i915/gem_caching.c b/tests/intel/i915/gem_caching.c
> similarity index 100%
> rename from tests/i915/gem_caching.c
> rename to tests/intel/i915/gem_caching.c
> diff --git a/tests/i915/gem_ccs.c b/tests/intel/i915/gem_ccs.c
> similarity index 100%
> rename from tests/i915/gem_ccs.c
> rename to tests/intel/i915/gem_ccs.c
> diff --git a/tests/i915/gem_close.c b/tests/intel/i915/gem_close.c
> similarity index 100%
> rename from tests/i915/gem_close.c
> rename to tests/intel/i915/gem_close.c
> diff --git a/tests/i915/gem_close_race.c b/tests/intel/i915/gem_close_race.c
> similarity index 100%
> rename from tests/i915/gem_close_race.c
> rename to tests/intel/i915/gem_close_race.c
> diff --git a/tests/i915/gem_concurrent_all.c b/tests/intel/i915/gem_concurrent_all.c
> similarity index 100%
> rename from tests/i915/gem_concurrent_all.c
> rename to tests/intel/i915/gem_concurrent_all.c
> diff --git a/tests/i915/gem_concurrent_blit.c b/tests/intel/i915/gem_concurrent_blit.c
> similarity index 100%
> rename from tests/i915/gem_concurrent_blit.c
> rename to tests/intel/i915/gem_concurrent_blit.c
> diff --git a/tests/i915/gem_create.c b/tests/intel/i915/gem_create.c
> similarity index 100%
> rename from tests/i915/gem_create.c
> rename to tests/intel/i915/gem_create.c
> diff --git a/tests/i915/gem_cs_tlb.c b/tests/intel/i915/gem_cs_tlb.c
> similarity index 100%
> rename from tests/i915/gem_cs_tlb.c
> rename to tests/intel/i915/gem_cs_tlb.c
> diff --git a/tests/i915/gem_ctx_bad_destroy.c b/tests/intel/i915/gem_ctx_bad_destroy.c
> similarity index 100%
> rename from tests/i915/gem_ctx_bad_destroy.c
> rename to tests/intel/i915/gem_ctx_bad_destroy.c
> diff --git a/tests/i915/gem_ctx_create.c b/tests/intel/i915/gem_ctx_create.c
> similarity index 100%
> rename from tests/i915/gem_ctx_create.c
> rename to tests/intel/i915/gem_ctx_create.c
> diff --git a/tests/i915/gem_ctx_engines.c b/tests/intel/i915/gem_ctx_engines.c
> similarity index 100%
> rename from tests/i915/gem_ctx_engines.c
> rename to tests/intel/i915/gem_ctx_engines.c
> diff --git a/tests/i915/gem_ctx_exec.c b/tests/intel/i915/gem_ctx_exec.c
> similarity index 100%
> rename from tests/i915/gem_ctx_exec.c
> rename to tests/intel/i915/gem_ctx_exec.c
> diff --git a/tests/i915/gem_ctx_freq.c b/tests/intel/i915/gem_ctx_freq.c
> similarity index 100%
> rename from tests/i915/gem_ctx_freq.c
> rename to tests/intel/i915/gem_ctx_freq.c
> diff --git a/tests/i915/gem_ctx_isolation.c b/tests/intel/i915/gem_ctx_isolation.c
> similarity index 100%
> rename from tests/i915/gem_ctx_isolation.c
> rename to tests/intel/i915/gem_ctx_isolation.c
> diff --git a/tests/i915/gem_ctx_param.c b/tests/intel/i915/gem_ctx_param.c
> similarity index 100%
> rename from tests/i915/gem_ctx_param.c
> rename to tests/intel/i915/gem_ctx_param.c
> diff --git a/tests/i915/gem_ctx_persistence.c b/tests/intel/i915/gem_ctx_persistence.c
> similarity index 100%
> rename from tests/i915/gem_ctx_persistence.c
> rename to tests/intel/i915/gem_ctx_persistence.c
> diff --git a/tests/i915/gem_ctx_shared.c b/tests/intel/i915/gem_ctx_shared.c
> similarity index 100%
> rename from tests/i915/gem_ctx_shared.c
> rename to tests/intel/i915/gem_ctx_shared.c
> diff --git a/tests/i915/gem_ctx_sseu.c b/tests/intel/i915/gem_ctx_sseu.c
> similarity index 100%
> rename from tests/i915/gem_ctx_sseu.c
> rename to tests/intel/i915/gem_ctx_sseu.c
> diff --git a/tests/i915/gem_ctx_switch.c b/tests/intel/i915/gem_ctx_switch.c
> similarity index 100%
> rename from tests/i915/gem_ctx_switch.c
> rename to tests/intel/i915/gem_ctx_switch.c
> diff --git a/tests/i915/gem_eio.c b/tests/intel/i915/gem_eio.c
> similarity index 100%
> rename from tests/i915/gem_eio.c
> rename to tests/intel/i915/gem_eio.c
> diff --git a/tests/i915/gem_evict_alignment.c b/tests/intel/i915/gem_evict_alignment.c
> similarity index 100%
> rename from tests/i915/gem_evict_alignment.c
> rename to tests/intel/i915/gem_evict_alignment.c
> diff --git a/tests/i915/gem_evict_everything.c b/tests/intel/i915/gem_evict_everything.c
> similarity index 100%
> rename from tests/i915/gem_evict_everything.c
> rename to tests/intel/i915/gem_evict_everything.c
> diff --git a/tests/i915/gem_exec_alignment.c b/tests/intel/i915/gem_exec_alignment.c
> similarity index 100%
> rename from tests/i915/gem_exec_alignment.c
> rename to tests/intel/i915/gem_exec_alignment.c
> diff --git a/tests/i915/gem_exec_async.c b/tests/intel/i915/gem_exec_async.c
> similarity index 100%
> rename from tests/i915/gem_exec_async.c
> rename to tests/intel/i915/gem_exec_async.c
> diff --git a/tests/i915/gem_exec_await.c b/tests/intel/i915/gem_exec_await.c
> similarity index 100%
> rename from tests/i915/gem_exec_await.c
> rename to tests/intel/i915/gem_exec_await.c
> diff --git a/tests/i915/gem_exec_balancer.c b/tests/intel/i915/gem_exec_balancer.c
> similarity index 100%
> rename from tests/i915/gem_exec_balancer.c
> rename to tests/intel/i915/gem_exec_balancer.c
> diff --git a/tests/i915/gem_exec_basic.c b/tests/intel/i915/gem_exec_basic.c
> similarity index 100%
> rename from tests/i915/gem_exec_basic.c
> rename to tests/intel/i915/gem_exec_basic.c
> diff --git a/tests/i915/gem_exec_big.c b/tests/intel/i915/gem_exec_big.c
> similarity index 100%
> rename from tests/i915/gem_exec_big.c
> rename to tests/intel/i915/gem_exec_big.c
> diff --git a/tests/i915/gem_exec_capture.c b/tests/intel/i915/gem_exec_capture.c
> similarity index 100%
> rename from tests/i915/gem_exec_capture.c
> rename to tests/intel/i915/gem_exec_capture.c
> diff --git a/tests/i915/gem_exec_create.c b/tests/intel/i915/gem_exec_create.c
> similarity index 100%
> rename from tests/i915/gem_exec_create.c
> rename to tests/intel/i915/gem_exec_create.c
> diff --git a/tests/i915/gem_exec_endless.c b/tests/intel/i915/gem_exec_endless.c
> similarity index 100%
> rename from tests/i915/gem_exec_endless.c
> rename to tests/intel/i915/gem_exec_endless.c
> diff --git a/tests/i915/gem_exec_fair.c b/tests/intel/i915/gem_exec_fair.c
> similarity index 100%
> rename from tests/i915/gem_exec_fair.c
> rename to tests/intel/i915/gem_exec_fair.c
> diff --git a/tests/i915/gem_exec_fence.c b/tests/intel/i915/gem_exec_fence.c
> similarity index 100%
> rename from tests/i915/gem_exec_fence.c
> rename to tests/intel/i915/gem_exec_fence.c
> diff --git a/tests/i915/gem_exec_flush.c b/tests/intel/i915/gem_exec_flush.c
> similarity index 100%
> rename from tests/i915/gem_exec_flush.c
> rename to tests/intel/i915/gem_exec_flush.c
> diff --git a/tests/i915/gem_exec_gttfill.c b/tests/intel/i915/gem_exec_gttfill.c
> similarity index 100%
> rename from tests/i915/gem_exec_gttfill.c
> rename to tests/intel/i915/gem_exec_gttfill.c
> diff --git a/tests/i915/gem_exec_latency.c b/tests/intel/i915/gem_exec_latency.c
> similarity index 100%
> rename from tests/i915/gem_exec_latency.c
> rename to tests/intel/i915/gem_exec_latency.c
> diff --git a/tests/i915/gem_exec_lut_handle.c b/tests/intel/i915/gem_exec_lut_handle.c
> similarity index 100%
> rename from tests/i915/gem_exec_lut_handle.c
> rename to tests/intel/i915/gem_exec_lut_handle.c
> diff --git a/tests/i915/gem_exec_nop.c b/tests/intel/i915/gem_exec_nop.c
> similarity index 100%
> rename from tests/i915/gem_exec_nop.c
> rename to tests/intel/i915/gem_exec_nop.c
> diff --git a/tests/i915/gem_exec_parallel.c b/tests/intel/i915/gem_exec_parallel.c
> similarity index 100%
> rename from tests/i915/gem_exec_parallel.c
> rename to tests/intel/i915/gem_exec_parallel.c
> diff --git a/tests/i915/gem_exec_params.c b/tests/intel/i915/gem_exec_params.c
> similarity index 100%
> rename from tests/i915/gem_exec_params.c
> rename to tests/intel/i915/gem_exec_params.c
> diff --git a/tests/i915/gem_exec_reloc.c b/tests/intel/i915/gem_exec_reloc.c
> similarity index 100%
> rename from tests/i915/gem_exec_reloc.c
> rename to tests/intel/i915/gem_exec_reloc.c
> diff --git a/tests/i915/gem_exec_schedule.c b/tests/intel/i915/gem_exec_schedule.c
> similarity index 100%
> rename from tests/i915/gem_exec_schedule.c
> rename to tests/intel/i915/gem_exec_schedule.c
> diff --git a/tests/i915/gem_exec_store.c b/tests/intel/i915/gem_exec_store.c
> similarity index 100%
> rename from tests/i915/gem_exec_store.c
> rename to tests/intel/i915/gem_exec_store.c
> diff --git a/tests/i915/gem_exec_suspend.c b/tests/intel/i915/gem_exec_suspend.c
> similarity index 100%
> rename from tests/i915/gem_exec_suspend.c
> rename to tests/intel/i915/gem_exec_suspend.c
> diff --git a/tests/i915/gem_exec_whisper.c b/tests/intel/i915/gem_exec_whisper.c
> similarity index 100%
> rename from tests/i915/gem_exec_whisper.c
> rename to tests/intel/i915/gem_exec_whisper.c
> diff --git a/tests/i915/gem_exercise_blt.c b/tests/intel/i915/gem_exercise_blt.c
> similarity index 100%
> rename from tests/i915/gem_exercise_blt.c
> rename to tests/intel/i915/gem_exercise_blt.c
> diff --git a/tests/i915/gem_fd_exhaustion.c b/tests/intel/i915/gem_fd_exhaustion.c
> similarity index 100%
> rename from tests/i915/gem_fd_exhaustion.c
> rename to tests/intel/i915/gem_fd_exhaustion.c
> diff --git a/tests/i915/gem_fence_thrash.c b/tests/intel/i915/gem_fence_thrash.c
> similarity index 100%
> rename from tests/i915/gem_fence_thrash.c
> rename to tests/intel/i915/gem_fence_thrash.c
> diff --git a/tests/i915/gem_fence_upload.c b/tests/intel/i915/gem_fence_upload.c
> similarity index 100%
> rename from tests/i915/gem_fence_upload.c
> rename to tests/intel/i915/gem_fence_upload.c
> diff --git a/tests/i915/gem_fenced_exec_thrash.c b/tests/intel/i915/gem_fenced_exec_thrash.c
> similarity index 100%
> rename from tests/i915/gem_fenced_exec_thrash.c
> rename to tests/intel/i915/gem_fenced_exec_thrash.c
> diff --git a/tests/i915/gem_flink_basic.c b/tests/intel/i915/gem_flink_basic.c
> similarity index 100%
> rename from tests/i915/gem_flink_basic.c
> rename to tests/intel/i915/gem_flink_basic.c
> diff --git a/tests/i915/gem_flink_race.c b/tests/intel/i915/gem_flink_race.c
> similarity index 100%
> rename from tests/i915/gem_flink_race.c
> rename to tests/intel/i915/gem_flink_race.c
> diff --git a/tests/i915/gem_gpgpu_fill.c b/tests/intel/i915/gem_gpgpu_fill.c
> similarity index 100%
> rename from tests/i915/gem_gpgpu_fill.c
> rename to tests/intel/i915/gem_gpgpu_fill.c
> diff --git a/tests/i915/gem_gtt_cpu_tlb.c b/tests/intel/i915/gem_gtt_cpu_tlb.c
> similarity index 100%
> rename from tests/i915/gem_gtt_cpu_tlb.c
> rename to tests/intel/i915/gem_gtt_cpu_tlb.c
> diff --git a/tests/i915/gem_gtt_hog.c b/tests/intel/i915/gem_gtt_hog.c
> similarity index 100%
> rename from tests/i915/gem_gtt_hog.c
> rename to tests/intel/i915/gem_gtt_hog.c
> diff --git a/tests/i915/gem_gtt_speed.c b/tests/intel/i915/gem_gtt_speed.c
> similarity index 100%
> rename from tests/i915/gem_gtt_speed.c
> rename to tests/intel/i915/gem_gtt_speed.c
> diff --git a/tests/i915/gem_huc_copy.c b/tests/intel/i915/gem_huc_copy.c
> similarity index 100%
> rename from tests/i915/gem_huc_copy.c
> rename to tests/intel/i915/gem_huc_copy.c
> diff --git a/tests/i915/gem_linear_blits.c b/tests/intel/i915/gem_linear_blits.c
> similarity index 100%
> rename from tests/i915/gem_linear_blits.c
> rename to tests/intel/i915/gem_linear_blits.c
> diff --git a/tests/i915/gem_lmem_evict.c b/tests/intel/i915/gem_lmem_evict.c
> similarity index 100%
> rename from tests/i915/gem_lmem_evict.c
> rename to tests/intel/i915/gem_lmem_evict.c
> diff --git a/tests/i915/gem_lmem_swapping.c b/tests/intel/i915/gem_lmem_swapping.c
> similarity index 100%
> rename from tests/i915/gem_lmem_swapping.c
> rename to tests/intel/i915/gem_lmem_swapping.c
> diff --git a/tests/i915/gem_lut_handle.c b/tests/intel/i915/gem_lut_handle.c
> similarity index 100%
> rename from tests/i915/gem_lut_handle.c
> rename to tests/intel/i915/gem_lut_handle.c
> diff --git a/tests/i915/gem_madvise.c b/tests/intel/i915/gem_madvise.c
> similarity index 100%
> rename from tests/i915/gem_madvise.c
> rename to tests/intel/i915/gem_madvise.c
> diff --git a/tests/i915/gem_media_fill.c b/tests/intel/i915/gem_media_fill.c
> similarity index 100%
> rename from tests/i915/gem_media_fill.c
> rename to tests/intel/i915/gem_media_fill.c
> diff --git a/tests/i915/gem_media_vme.c b/tests/intel/i915/gem_media_vme.c
> similarity index 100%
> rename from tests/i915/gem_media_vme.c
> rename to tests/intel/i915/gem_media_vme.c
> diff --git a/tests/i915/gem_mmap.c b/tests/intel/i915/gem_mmap.c
> similarity index 100%
> rename from tests/i915/gem_mmap.c
> rename to tests/intel/i915/gem_mmap.c
> diff --git a/tests/i915/gem_mmap_gtt.c b/tests/intel/i915/gem_mmap_gtt.c
> similarity index 100%
> rename from tests/i915/gem_mmap_gtt.c
> rename to tests/intel/i915/gem_mmap_gtt.c
> diff --git a/tests/i915/gem_mmap_offset.c b/tests/intel/i915/gem_mmap_offset.c
> similarity index 100%
> rename from tests/i915/gem_mmap_offset.c
> rename to tests/intel/i915/gem_mmap_offset.c
> diff --git a/tests/i915/gem_mmap_wc.c b/tests/intel/i915/gem_mmap_wc.c
> similarity index 100%
> rename from tests/i915/gem_mmap_wc.c
> rename to tests/intel/i915/gem_mmap_wc.c
> diff --git a/tests/i915/gem_partial_pwrite_pread.c b/tests/intel/i915/gem_partial_pwrite_pread.c
> similarity index 100%
> rename from tests/i915/gem_partial_pwrite_pread.c
> rename to tests/intel/i915/gem_partial_pwrite_pread.c
> diff --git a/tests/i915/gem_pipe_control_store_loop.c b/tests/intel/i915/gem_pipe_control_store_loop.c
> similarity index 100%
> rename from tests/i915/gem_pipe_control_store_loop.c
> rename to tests/intel/i915/gem_pipe_control_store_loop.c
> diff --git a/tests/i915/gem_ppgtt.c b/tests/intel/i915/gem_ppgtt.c
> similarity index 100%
> rename from tests/i915/gem_ppgtt.c
> rename to tests/intel/i915/gem_ppgtt.c
> diff --git a/tests/i915/gem_pread.c b/tests/intel/i915/gem_pread.c
> similarity index 100%
> rename from tests/i915/gem_pread.c
> rename to tests/intel/i915/gem_pread.c
> diff --git a/tests/i915/gem_pread_after_blit.c b/tests/intel/i915/gem_pread_after_blit.c
> similarity index 100%
> rename from tests/i915/gem_pread_after_blit.c
> rename to tests/intel/i915/gem_pread_after_blit.c
> diff --git a/tests/i915/gem_pwrite.c b/tests/intel/i915/gem_pwrite.c
> similarity index 100%
> rename from tests/i915/gem_pwrite.c
> rename to tests/intel/i915/gem_pwrite.c
> diff --git a/tests/i915/gem_pwrite_snooped.c b/tests/intel/i915/gem_pwrite_snooped.c
> similarity index 100%
> rename from tests/i915/gem_pwrite_snooped.c
> rename to tests/intel/i915/gem_pwrite_snooped.c
> diff --git a/tests/i915/gem_pxp.c b/tests/intel/i915/gem_pxp.c
> similarity index 100%
> rename from tests/i915/gem_pxp.c
> rename to tests/intel/i915/gem_pxp.c
> diff --git a/tests/i915/gem_read_read_speed.c b/tests/intel/i915/gem_read_read_speed.c
> similarity index 100%
> rename from tests/i915/gem_read_read_speed.c
> rename to tests/intel/i915/gem_read_read_speed.c
> diff --git a/tests/i915/gem_readwrite.c b/tests/intel/i915/gem_readwrite.c
> similarity index 100%
> rename from tests/i915/gem_readwrite.c
> rename to tests/intel/i915/gem_readwrite.c
> diff --git a/tests/i915/gem_reg_read.c b/tests/intel/i915/gem_reg_read.c
> similarity index 100%
> rename from tests/i915/gem_reg_read.c
> rename to tests/intel/i915/gem_reg_read.c
> diff --git a/tests/i915/gem_render_copy.c b/tests/intel/i915/gem_render_copy.c
> similarity index 100%
> rename from tests/i915/gem_render_copy.c
> rename to tests/intel/i915/gem_render_copy.c
> diff --git a/tests/i915/gem_render_copy_redux.c b/tests/intel/i915/gem_render_copy_redux.c
> similarity index 100%
> rename from tests/i915/gem_render_copy_redux.c
> rename to tests/intel/i915/gem_render_copy_redux.c
> diff --git a/tests/i915/gem_render_linear_blits.c b/tests/intel/i915/gem_render_linear_blits.c
> similarity index 100%
> rename from tests/i915/gem_render_linear_blits.c
> rename to tests/intel/i915/gem_render_linear_blits.c
> diff --git a/tests/i915/gem_render_tiled_blits.c b/tests/intel/i915/gem_render_tiled_blits.c
> similarity index 100%
> rename from tests/i915/gem_render_tiled_blits.c
> rename to tests/intel/i915/gem_render_tiled_blits.c
> diff --git a/tests/i915/gem_request_retire.c b/tests/intel/i915/gem_request_retire.c
> similarity index 100%
> rename from tests/i915/gem_request_retire.c
> rename to tests/intel/i915/gem_request_retire.c
> diff --git a/tests/i915/gem_reset_stats.c b/tests/intel/i915/gem_reset_stats.c
> similarity index 100%
> rename from tests/i915/gem_reset_stats.c
> rename to tests/intel/i915/gem_reset_stats.c
> diff --git a/tests/i915/gem_ringfill.c b/tests/intel/i915/gem_ringfill.c
> similarity index 100%
> rename from tests/i915/gem_ringfill.c
> rename to tests/intel/i915/gem_ringfill.c
> diff --git a/tests/i915/gem_set_tiling_vs_blt.c b/tests/intel/i915/gem_set_tiling_vs_blt.c
> similarity index 100%
> rename from tests/i915/gem_set_tiling_vs_blt.c
> rename to tests/intel/i915/gem_set_tiling_vs_blt.c
> diff --git a/tests/i915/gem_set_tiling_vs_gtt.c b/tests/intel/i915/gem_set_tiling_vs_gtt.c
> similarity index 100%
> rename from tests/i915/gem_set_tiling_vs_gtt.c
> rename to tests/intel/i915/gem_set_tiling_vs_gtt.c
> diff --git a/tests/i915/gem_set_tiling_vs_pwrite.c b/tests/intel/i915/gem_set_tiling_vs_pwrite.c
> similarity index 100%
> rename from tests/i915/gem_set_tiling_vs_pwrite.c
> rename to tests/intel/i915/gem_set_tiling_vs_pwrite.c
> diff --git a/tests/i915/gem_shrink.c b/tests/intel/i915/gem_shrink.c
> similarity index 100%
> rename from tests/i915/gem_shrink.c
> rename to tests/intel/i915/gem_shrink.c
> diff --git a/tests/i915/gem_softpin.c b/tests/intel/i915/gem_softpin.c
> similarity index 100%
> rename from tests/i915/gem_softpin.c
> rename to tests/intel/i915/gem_softpin.c
> diff --git a/tests/i915/gem_spin_batch.c b/tests/intel/i915/gem_spin_batch.c
> similarity index 100%
> rename from tests/i915/gem_spin_batch.c
> rename to tests/intel/i915/gem_spin_batch.c
> diff --git a/tests/i915/gem_streaming_writes.c b/tests/intel/i915/gem_streaming_writes.c
> similarity index 100%
> rename from tests/i915/gem_streaming_writes.c
> rename to tests/intel/i915/gem_streaming_writes.c
> diff --git a/tests/i915/gem_stress.c b/tests/intel/i915/gem_stress.c
> similarity index 100%
> rename from tests/i915/gem_stress.c
> rename to tests/intel/i915/gem_stress.c
> diff --git a/tests/i915/gem_sync.c b/tests/intel/i915/gem_sync.c
> similarity index 100%
> rename from tests/i915/gem_sync.c
> rename to tests/intel/i915/gem_sync.c
> diff --git a/tests/i915/gem_tiled_blits.c b/tests/intel/i915/gem_tiled_blits.c
> similarity index 100%
> rename from tests/i915/gem_tiled_blits.c
> rename to tests/intel/i915/gem_tiled_blits.c
> diff --git a/tests/i915/gem_tiled_fence_blits.c b/tests/intel/i915/gem_tiled_fence_blits.c
> similarity index 100%
> rename from tests/i915/gem_tiled_fence_blits.c
> rename to tests/intel/i915/gem_tiled_fence_blits.c
> diff --git a/tests/i915/gem_tiled_partial_pwrite_pread.c b/tests/intel/i915/gem_tiled_partial_pwrite_pread.c
> similarity index 100%
> rename from tests/i915/gem_tiled_partial_pwrite_pread.c
> rename to tests/intel/i915/gem_tiled_partial_pwrite_pread.c
> diff --git a/tests/i915/gem_tiled_pread_basic.c b/tests/intel/i915/gem_tiled_pread_basic.c
> similarity index 100%
> rename from tests/i915/gem_tiled_pread_basic.c
> rename to tests/intel/i915/gem_tiled_pread_basic.c
> diff --git a/tests/i915/gem_tiled_pread_pwrite.c b/tests/intel/i915/gem_tiled_pread_pwrite.c
> similarity index 100%
> rename from tests/i915/gem_tiled_pread_pwrite.c
> rename to tests/intel/i915/gem_tiled_pread_pwrite.c
> diff --git a/tests/i915/gem_tiled_swapping.c b/tests/intel/i915/gem_tiled_swapping.c
> similarity index 100%
> rename from tests/i915/gem_tiled_swapping.c
> rename to tests/intel/i915/gem_tiled_swapping.c
> diff --git a/tests/i915/gem_tiled_wb.c b/tests/intel/i915/gem_tiled_wb.c
> similarity index 100%
> rename from tests/i915/gem_tiled_wb.c
> rename to tests/intel/i915/gem_tiled_wb.c
> diff --git a/tests/i915/gem_tiled_wc.c b/tests/intel/i915/gem_tiled_wc.c
> similarity index 100%
> rename from tests/i915/gem_tiled_wc.c
> rename to tests/intel/i915/gem_tiled_wc.c
> diff --git a/tests/i915/gem_tiling_max_stride.c b/tests/intel/i915/gem_tiling_max_stride.c
> similarity index 100%
> rename from tests/i915/gem_tiling_max_stride.c
> rename to tests/intel/i915/gem_tiling_max_stride.c
> diff --git a/tests/i915/gem_unfence_active_buffers.c b/tests/intel/i915/gem_unfence_active_buffers.c
> similarity index 100%
> rename from tests/i915/gem_unfence_active_buffers.c
> rename to tests/intel/i915/gem_unfence_active_buffers.c
> diff --git a/tests/i915/gem_unref_active_buffers.c b/tests/intel/i915/gem_unref_active_buffers.c
> similarity index 100%
> rename from tests/i915/gem_unref_active_buffers.c
> rename to tests/intel/i915/gem_unref_active_buffers.c
> diff --git a/tests/i915/gem_userptr_blits.c b/tests/intel/i915/gem_userptr_blits.c
> similarity index 100%
> rename from tests/i915/gem_userptr_blits.c
> rename to tests/intel/i915/gem_userptr_blits.c
> diff --git a/tests/i915/gem_vm_create.c b/tests/intel/i915/gem_vm_create.c
> similarity index 100%
> rename from tests/i915/gem_vm_create.c
> rename to tests/intel/i915/gem_vm_create.c
> diff --git a/tests/i915/gem_wait.c b/tests/intel/i915/gem_wait.c
> similarity index 100%
> rename from tests/i915/gem_wait.c
> rename to tests/intel/i915/gem_wait.c
> diff --git a/tests/i915/gem_watchdog.c b/tests/intel/i915/gem_watchdog.c
> similarity index 100%
> rename from tests/i915/gem_watchdog.c
> rename to tests/intel/i915/gem_watchdog.c
> diff --git a/tests/i915/gem_workarounds.c b/tests/intel/i915/gem_workarounds.c
> similarity index 100%
> rename from tests/i915/gem_workarounds.c
> rename to tests/intel/i915/gem_workarounds.c
> diff --git a/tests/i915/gen3_mixed_blits.c b/tests/intel/i915/gen3_mixed_blits.c
> similarity index 100%
> rename from tests/i915/gen3_mixed_blits.c
> rename to tests/intel/i915/gen3_mixed_blits.c
> diff --git a/tests/i915/gen3_render_linear_blits.c b/tests/intel/i915/gen3_render_linear_blits.c
> similarity index 100%
> rename from tests/i915/gen3_render_linear_blits.c
> rename to tests/intel/i915/gen3_render_linear_blits.c
> diff --git a/tests/i915/gen3_render_mixed_blits.c b/tests/intel/i915/gen3_render_mixed_blits.c
> similarity index 100%
> rename from tests/i915/gen3_render_mixed_blits.c
> rename to tests/intel/i915/gen3_render_mixed_blits.c
> diff --git a/tests/i915/gen3_render_tiledx_blits.c b/tests/intel/i915/gen3_render_tiledx_blits.c
> similarity index 100%
> rename from tests/i915/gen3_render_tiledx_blits.c
> rename to tests/intel/i915/gen3_render_tiledx_blits.c
> diff --git a/tests/i915/gen3_render_tiledy_blits.c b/tests/intel/i915/gen3_render_tiledy_blits.c
> similarity index 100%
> rename from tests/i915/gen3_render_tiledy_blits.c
> rename to tests/intel/i915/gen3_render_tiledy_blits.c
> diff --git a/tests/i915/gen7_exec_parse.c b/tests/intel/i915/gen7_exec_parse.c
> similarity index 100%
> rename from tests/i915/gen7_exec_parse.c
> rename to tests/intel/i915/gen7_exec_parse.c
> diff --git a/tests/i915/gen9_exec_parse.c b/tests/intel/i915/gen9_exec_parse.c
> similarity index 100%
> rename from tests/i915/gen9_exec_parse.c
> rename to tests/intel/i915/gen9_exec_parse.c
> diff --git a/tests/i915/i915_fb_tiling.c b/tests/intel/i915/i915_fb_tiling.c
> similarity index 100%
> rename from tests/i915/i915_fb_tiling.c
> rename to tests/intel/i915/i915_fb_tiling.c
> diff --git a/tests/i915/i915_getparams_basic.c b/tests/intel/i915/i915_getparams_basic.c
> similarity index 100%
> rename from tests/i915/i915_getparams_basic.c
> rename to tests/intel/i915/i915_getparams_basic.c
> diff --git a/tests/i915/i915_hangman.c b/tests/intel/i915/i915_hangman.c
> similarity index 100%
> rename from tests/i915/i915_hangman.c
> rename to tests/intel/i915/i915_hangman.c
> diff --git a/tests/i915/i915_hwmon.c b/tests/intel/i915/i915_hwmon.c
> similarity index 100%
> rename from tests/i915/i915_hwmon.c
> rename to tests/intel/i915/i915_hwmon.c
> diff --git a/tests/i915/i915_module_load.c b/tests/intel/i915/i915_module_load.c
> similarity index 100%
> rename from tests/i915/i915_module_load.c
> rename to tests/intel/i915/i915_module_load.c
> diff --git a/tests/i915/i915_pciid.c b/tests/intel/i915/i915_pciid.c
> similarity index 100%
> rename from tests/i915/i915_pciid.c
> rename to tests/intel/i915/i915_pciid.c
> diff --git a/tests/i915/i915_pipe_stress.c b/tests/intel/i915/i915_pipe_stress.c
> similarity index 100%
> rename from tests/i915/i915_pipe_stress.c
> rename to tests/intel/i915/i915_pipe_stress.c
> diff --git a/tests/i915/i915_pm_backlight.c b/tests/intel/i915/i915_pm_backlight.c
> similarity index 100%
> rename from tests/i915/i915_pm_backlight.c
> rename to tests/intel/i915/i915_pm_backlight.c
> diff --git a/tests/i915/i915_pm_dc.c b/tests/intel/i915/i915_pm_dc.c
> similarity index 100%
> rename from tests/i915/i915_pm_dc.c
> rename to tests/intel/i915/i915_pm_dc.c
> diff --git a/tests/i915/i915_pm_freq_mult.c b/tests/intel/i915/i915_pm_freq_mult.c
> similarity index 100%
> rename from tests/i915/i915_pm_freq_mult.c
> rename to tests/intel/i915/i915_pm_freq_mult.c
> diff --git a/tests/i915/i915_pm_lpsp.c b/tests/intel/i915/i915_pm_lpsp.c
> similarity index 100%
> rename from tests/i915/i915_pm_lpsp.c
> rename to tests/intel/i915/i915_pm_lpsp.c
> diff --git a/tests/i915/i915_pm_rc6_residency.c b/tests/intel/i915/i915_pm_rc6_residency.c
> similarity index 100%
> rename from tests/i915/i915_pm_rc6_residency.c
> rename to tests/intel/i915/i915_pm_rc6_residency.c
> diff --git a/tests/i915/i915_pm_rpm.c b/tests/intel/i915/i915_pm_rpm.c
> similarity index 100%
> rename from tests/i915/i915_pm_rpm.c
> rename to tests/intel/i915/i915_pm_rpm.c
> diff --git a/tests/i915/i915_pm_rps.c b/tests/intel/i915/i915_pm_rps.c
> similarity index 100%
> rename from tests/i915/i915_pm_rps.c
> rename to tests/intel/i915/i915_pm_rps.c
> diff --git a/tests/i915/i915_pm_sseu.c b/tests/intel/i915/i915_pm_sseu.c
> similarity index 100%
> rename from tests/i915/i915_pm_sseu.c
> rename to tests/intel/i915/i915_pm_sseu.c
> diff --git a/tests/i915/i915_power.c b/tests/intel/i915/i915_power.c
> similarity index 100%
> rename from tests/i915/i915_power.c
> rename to tests/intel/i915/i915_power.c
> diff --git a/tests/i915/i915_query.c b/tests/intel/i915/i915_query.c
> similarity index 100%
> rename from tests/i915/i915_query.c
> rename to tests/intel/i915/i915_query.c
> diff --git a/tests/i915/i915_selftest.c b/tests/intel/i915/i915_selftest.c
> similarity index 100%
> rename from tests/i915/i915_selftest.c
> rename to tests/intel/i915/i915_selftest.c
> diff --git a/tests/i915/i915_suspend.c b/tests/intel/i915/i915_suspend.c
> similarity index 100%
> rename from tests/i915/i915_suspend.c
> rename to tests/intel/i915/i915_suspend.c
> diff --git a/tests/i915/kms_big_fb.c b/tests/intel/i915/kms_big_fb.c
> similarity index 100%
> rename from tests/i915/kms_big_fb.c
> rename to tests/intel/i915/kms_big_fb.c
> diff --git a/tests/i915/kms_big_joiner.c b/tests/intel/i915/kms_big_joiner.c
> similarity index 100%
> rename from tests/i915/kms_big_joiner.c
> rename to tests/intel/i915/kms_big_joiner.c
> diff --git a/tests/i915/kms_busy.c b/tests/intel/i915/kms_busy.c
> similarity index 100%
> rename from tests/i915/kms_busy.c
> rename to tests/intel/i915/kms_busy.c
> diff --git a/tests/i915/kms_ccs.c b/tests/intel/i915/kms_ccs.c
> similarity index 100%
> rename from tests/i915/kms_ccs.c
> rename to tests/intel/i915/kms_ccs.c
> diff --git a/tests/i915/kms_cdclk.c b/tests/intel/i915/kms_cdclk.c
> similarity index 100%
> rename from tests/i915/kms_cdclk.c
> rename to tests/intel/i915/kms_cdclk.c
> diff --git a/tests/i915/kms_draw_crc.c b/tests/intel/i915/kms_draw_crc.c
> similarity index 100%
> rename from tests/i915/kms_draw_crc.c
> rename to tests/intel/i915/kms_draw_crc.c
> diff --git a/tests/i915/kms_dsc.c b/tests/intel/i915/kms_dsc.c
> similarity index 100%
> rename from tests/i915/kms_dsc.c
> rename to tests/intel/i915/kms_dsc.c
> diff --git a/tests/i915/kms_dsc_helper.c b/tests/intel/i915/kms_dsc_helper.c
> similarity index 100%
> rename from tests/i915/kms_dsc_helper.c
> rename to tests/intel/i915/kms_dsc_helper.c
> diff --git a/tests/i915/kms_dsc_helper.h b/tests/intel/i915/kms_dsc_helper.h
> similarity index 100%
> rename from tests/i915/kms_dsc_helper.h
> rename to tests/intel/i915/kms_dsc_helper.h
> diff --git a/tests/i915/kms_fbcon_fbt.c b/tests/intel/i915/kms_fbcon_fbt.c
> similarity index 100%
> rename from tests/i915/kms_fbcon_fbt.c
> rename to tests/intel/i915/kms_fbcon_fbt.c
> diff --git a/tests/i915/kms_fence_pin_leak.c b/tests/intel/i915/kms_fence_pin_leak.c
> similarity index 100%
> rename from tests/i915/kms_fence_pin_leak.c
> rename to tests/intel/i915/kms_fence_pin_leak.c
> diff --git a/tests/i915/kms_flip_scaled_crc.c b/tests/intel/i915/kms_flip_scaled_crc.c
> similarity index 100%
> rename from tests/i915/kms_flip_scaled_crc.c
> rename to tests/intel/i915/kms_flip_scaled_crc.c
> diff --git a/tests/i915/kms_flip_tiling.c b/tests/intel/i915/kms_flip_tiling.c
> similarity index 100%
> rename from tests/i915/kms_flip_tiling.c
> rename to tests/intel/i915/kms_flip_tiling.c
> diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/intel/i915/kms_frontbuffer_tracking.c
> similarity index 100%
> rename from tests/i915/kms_frontbuffer_tracking.c
> rename to tests/intel/i915/kms_frontbuffer_tracking.c
> diff --git a/tests/i915/kms_legacy_colorkey.c b/tests/intel/i915/kms_legacy_colorkey.c
> similarity index 100%
> rename from tests/i915/kms_legacy_colorkey.c
> rename to tests/intel/i915/kms_legacy_colorkey.c
> diff --git a/tests/i915/kms_mmap_write_crc.c b/tests/intel/i915/kms_mmap_write_crc.c
> similarity index 100%
> rename from tests/i915/kms_mmap_write_crc.c
> rename to tests/intel/i915/kms_mmap_write_crc.c
> diff --git a/tests/i915/kms_pipe_b_c_ivb.c b/tests/intel/i915/kms_pipe_b_c_ivb.c
> similarity index 100%
> rename from tests/i915/kms_pipe_b_c_ivb.c
> rename to tests/intel/i915/kms_pipe_b_c_ivb.c
> diff --git a/tests/i915/kms_pwrite_crc.c b/tests/intel/i915/kms_pwrite_crc.c
> similarity index 100%
> rename from tests/i915/kms_pwrite_crc.c
> rename to tests/intel/i915/kms_pwrite_crc.c
> diff --git a/tests/i915/perf.c b/tests/intel/i915/perf.c
> similarity index 100%
> rename from tests/i915/perf.c
> rename to tests/intel/i915/perf.c
> diff --git a/tests/i915/perf_pmu.c b/tests/intel/i915/perf_pmu.c
> similarity index 100%
> rename from tests/i915/perf_pmu.c
> rename to tests/intel/i915/perf_pmu.c
> diff --git a/tests/i915/sysfs_defaults.c b/tests/intel/i915/sysfs_defaults.c
> similarity index 100%
> rename from tests/i915/sysfs_defaults.c
> rename to tests/intel/i915/sysfs_defaults.c
> diff --git a/tests/i915/sysfs_heartbeat_interval.c b/tests/intel/i915/sysfs_heartbeat_interval.c
> similarity index 100%
> rename from tests/i915/sysfs_heartbeat_interval.c
> rename to tests/intel/i915/sysfs_heartbeat_interval.c
> diff --git a/tests/i915/sysfs_preempt_timeout.c b/tests/intel/i915/sysfs_preempt_timeout.c
> similarity index 100%
> rename from tests/i915/sysfs_preempt_timeout.c
> rename to tests/intel/i915/sysfs_preempt_timeout.c
> diff --git a/tests/i915/sysfs_timeslice_duration.c b/tests/intel/i915/sysfs_timeslice_duration.c
> similarity index 100%
> rename from tests/i915/sysfs_timeslice_duration.c
> rename to tests/intel/i915/sysfs_timeslice_duration.c
> diff --git a/tests/i915/kms_psr.c b/tests/intel/kms_psr.c
> similarity index 100%
> rename from tests/i915/kms_psr.c
> rename to tests/intel/kms_psr.c
> diff --git a/tests/i915/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
> similarity index 99%
> rename from tests/i915/kms_psr2_sf.c
> rename to tests/intel/kms_psr2_sf.c
> index 4cf986440..068006e25 100644
> --- a/tests/i915/kms_psr2_sf.c
> +++ b/tests/intel/kms_psr2_sf.c
> @@ -25,7 +25,7 @@
>  #include "igt.h"
>  #include "igt_sysfs.h"
>  #include "igt_psr.h"
> -#include "kms_dsc_helper.h"
> +#include "i915/kms_dsc_helper.h"
>  #include <errno.h>
>  #include <stdbool.h>
>  #include <stdio.h>
> diff --git a/tests/i915/kms_psr2_su.c b/tests/intel/kms_psr2_su.c
> similarity index 100%
> rename from tests/i915/kms_psr2_su.c
> rename to tests/intel/kms_psr2_su.c
> diff --git a/tests/i915/kms_psr_stress_test.c b/tests/intel/kms_psr_stress_test.c
> similarity index 100%
> rename from tests/i915/kms_psr_stress_test.c
> rename to tests/intel/kms_psr_stress_test.c
> diff --git a/tests/xe/xe_compute.c b/tests/intel/xe/xe_compute.c
> similarity index 100%
> rename from tests/xe/xe_compute.c
> rename to tests/intel/xe/xe_compute.c
> diff --git a/tests/xe/xe_create.c b/tests/intel/xe/xe_create.c
> similarity index 100%
> rename from tests/xe/xe_create.c
> rename to tests/intel/xe/xe_create.c
> diff --git a/tests/xe/xe_debugfs.c b/tests/intel/xe/xe_debugfs.c
> similarity index 100%
> rename from tests/xe/xe_debugfs.c
> rename to tests/intel/xe/xe_debugfs.c
> diff --git a/tests/xe/xe_dma_buf_sync.c b/tests/intel/xe/xe_dma_buf_sync.c
> similarity index 100%
> rename from tests/xe/xe_dma_buf_sync.c
> rename to tests/intel/xe/xe_dma_buf_sync.c
> diff --git a/tests/xe/xe_evict.c b/tests/intel/xe/xe_evict.c
> similarity index 100%
> rename from tests/xe/xe_evict.c
> rename to tests/intel/xe/xe_evict.c
> diff --git a/tests/xe/xe_exec_balancer.c b/tests/intel/xe/xe_exec_balancer.c
> similarity index 100%
> rename from tests/xe/xe_exec_balancer.c
> rename to tests/intel/xe/xe_exec_balancer.c
> diff --git a/tests/xe/xe_exec_basic.c b/tests/intel/xe/xe_exec_basic.c
> similarity index 100%
> rename from tests/xe/xe_exec_basic.c
> rename to tests/intel/xe/xe_exec_basic.c
> diff --git a/tests/xe/xe_exec_compute_mode.c b/tests/intel/xe/xe_exec_compute_mode.c
> similarity index 100%
> rename from tests/xe/xe_exec_compute_mode.c
> rename to tests/intel/xe/xe_exec_compute_mode.c
> diff --git a/tests/xe/xe_exec_fault_mode.c b/tests/intel/xe/xe_exec_fault_mode.c
> similarity index 100%
> rename from tests/xe/xe_exec_fault_mode.c
> rename to tests/intel/xe/xe_exec_fault_mode.c
> diff --git a/tests/xe/xe_exec_reset.c b/tests/intel/xe/xe_exec_reset.c
> similarity index 100%
> rename from tests/xe/xe_exec_reset.c
> rename to tests/intel/xe/xe_exec_reset.c
> diff --git a/tests/xe/xe_exec_threads.c b/tests/intel/xe/xe_exec_threads.c
> similarity index 100%
> rename from tests/xe/xe_exec_threads.c
> rename to tests/intel/xe/xe_exec_threads.c
> diff --git a/tests/xe/xe_guc_pc.c b/tests/intel/xe/xe_guc_pc.c
> similarity index 100%
> rename from tests/xe/xe_guc_pc.c
> rename to tests/intel/xe/xe_guc_pc.c
> diff --git a/tests/xe/xe_huc_copy.c b/tests/intel/xe/xe_huc_copy.c
> similarity index 100%
> rename from tests/xe/xe_huc_copy.c
> rename to tests/intel/xe/xe_huc_copy.c
> diff --git a/tests/xe/xe_mmap.c b/tests/intel/xe/xe_mmap.c
> similarity index 100%
> rename from tests/xe/xe_mmap.c
> rename to tests/intel/xe/xe_mmap.c
> diff --git a/tests/xe/xe_mmio.c b/tests/intel/xe/xe_mmio.c
> similarity index 100%
> rename from tests/xe/xe_mmio.c
> rename to tests/intel/xe/xe_mmio.c
> diff --git a/tests/xe/xe_module_load.c b/tests/intel/xe/xe_module_load.c
> similarity index 100%
> rename from tests/xe/xe_module_load.c
> rename to tests/intel/xe/xe_module_load.c
> diff --git a/tests/xe/xe_noexec_ping_pong.c b/tests/intel/xe/xe_noexec_ping_pong.c
> similarity index 100%
> rename from tests/xe/xe_noexec_ping_pong.c
> rename to tests/intel/xe/xe_noexec_ping_pong.c
> diff --git a/tests/xe/xe_pm.c b/tests/intel/xe/xe_pm.c
> similarity index 100%
> rename from tests/xe/xe_pm.c
> rename to tests/intel/xe/xe_pm.c
> diff --git a/tests/xe/xe_prime_self_import.c b/tests/intel/xe/xe_prime_self_import.c
> similarity index 100%
> rename from tests/xe/xe_prime_self_import.c
> rename to tests/intel/xe/xe_prime_self_import.c
> diff --git a/tests/xe/xe_query.c b/tests/intel/xe/xe_query.c
> similarity index 100%
> rename from tests/xe/xe_query.c
> rename to tests/intel/xe/xe_query.c
> diff --git a/tests/xe/xe_test_config.json b/tests/intel/xe/xe_test_config.json
> similarity index 100%
> rename from tests/xe/xe_test_config.json
> rename to tests/intel/xe/xe_test_config.json
> diff --git a/tests/xe/xe_vm.c b/tests/intel/xe/xe_vm.c
> similarity index 100%
> rename from tests/xe/xe_vm.c
> rename to tests/intel/xe/xe_vm.c
> diff --git a/tests/xe/xe_waitfence.c b/tests/intel/xe/xe_waitfence.c
> similarity index 100%
> rename from tests/xe/xe_waitfence.c
> rename to tests/intel/xe/xe_waitfence.c
> diff --git a/tests/meson.build b/tests/meson.build
> index 9072cfadc..782a0473a 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -83,6 +83,12 @@ test_progs = [
>  	'vgem_slow',
>  ]
>  
> +intel_progs = [
> +	'kms_psr',
> +	'kms_psr2_su',
> +	'kms_psr_stress_test',
> +]
> +
>  i915_progs = [
>  	'api_intel_allocator',
>  	'api_intel_bb',
> @@ -231,9 +237,6 @@ i915_progs = [
>  	'kms_legacy_colorkey',
>  	'kms_mmap_write_crc',
>  	'kms_pipe_b_c_ivb',
> -	'kms_psr',
> -	'kms_psr2_su',
> -	'kms_psr_stress_test',
>  	'kms_pwrite_crc',
>  	'sysfs_defaults',
>  	'sysfs_heartbeat_interval',
> @@ -304,9 +307,19 @@ foreach prog : test_progs
>  	test_list += prog
>  endforeach
>  
> +foreach prog : intel_progs
> +	test_executables += executable(prog,
> +		   join_paths('intel', prog + '.c'),
> +		   dependencies : test_deps,
> +		   install_dir : libexecdir,
> +		   install_rpath : libexecdir_rpathdir,
> +		   install : true)
> +	test_list += prog
> +endforeach
> +
>  foreach prog : i915_progs
>  	test_executables += executable(prog,
> -		   join_paths('i915', prog + '.c'),
> +		   join_paths('intel/i915', prog + '.c'),
>  		   dependencies : test_deps,
>  		   install_dir : libexecdir,
>  		   install_rpath : libexecdir_rpathdir,
> @@ -316,7 +329,7 @@ endforeach
>  
>  foreach prog : xe_progs
>  	test_executables += executable(prog,
> -		   join_paths('xe', prog + '.c'),
> +		   join_paths('intel/xe', prog + '.c'),
>  		   dependencies : test_deps,
>  		   install_dir : libexecdir,
>  		   install_rpath : libexecdir_rpathdir,
> @@ -348,7 +361,7 @@ if chamelium.found()
>  endif
>  
>  test_executables += executable('drm_fdinfo',
> -	   join_paths('i915', 'drm_fdinfo.c'),
> +	   join_paths('intel/i915', 'drm_fdinfo.c'),
>  	   dependencies : test_deps + [ lib_igt_drm_fdinfo ],
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -363,7 +376,7 @@ test_executables += executable('dumb_buffer', 'dumb_buffer.c',
>  test_list += 'dumb_buffer'
>  
>  test_executables += executable('gem_create',
> -	   join_paths('i915', 'gem_create.c'),
> +	   join_paths('intel/i915', 'gem_create.c'),
>  	   dependencies : test_deps + [ libatomic ],
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -371,7 +384,7 @@ test_executables += executable('gem_create',
>  test_list += 'gem_create'
>  
>  test_executables += executable('gem_ctx_freq',
> -	   join_paths('i915', 'gem_ctx_freq.c'),
> +	   join_paths('intel/i915', 'gem_ctx_freq.c'),
>  	   dependencies : test_deps + [ lib_igt_perf ],
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -379,7 +392,7 @@ test_executables += executable('gem_ctx_freq',
>  test_list += 'gem_ctx_freq'
>  
>  test_executables += executable('gem_ctx_sseu',
> -	   join_paths('i915', 'gem_ctx_sseu.c'),
> +	   join_paths('intel/i915', 'gem_ctx_sseu.c'),
>  	   dependencies : test_deps + [ lib_igt_perf ],
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -387,14 +400,14 @@ test_executables += executable('gem_ctx_sseu',
>  test_list += 'gem_ctx_sseu'
>  
>  test_executables += executable('gem_eio',
> -	   join_paths('i915', 'gem_eio.c'),
> +	   join_paths('intel/i915', 'gem_eio.c'),
>  	   dependencies : test_deps + [ realtime ],
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
>  	   install : true)
>  test_list += 'gem_eio'
>  
> -test_executables += executable('gem_exec_balancer', 'i915/gem_exec_balancer.c',
> +test_executables += executable('gem_exec_balancer', 'intel/i915/gem_exec_balancer.c',
>  	   dependencies : test_deps + [ lib_igt_perf ],
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -402,7 +415,7 @@ test_executables += executable('gem_exec_balancer', 'i915/gem_exec_balancer.c',
>  test_list += 'gem_exec_balancer'
>  
>  test_executables += executable('gem_mmap_offset',
> -	   join_paths('i915', 'gem_mmap_offset.c'),
> +	   join_paths('intel/i915', 'gem_mmap_offset.c'),
>  	   dependencies : test_deps + [ libatomic ],
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -410,7 +423,7 @@ test_executables += executable('gem_mmap_offset',
>  test_list += 'gem_mmap_offset'
>  
>  test_executables += executable('i915_pm_freq_mult',
> -	   join_paths('i915', 'i915_pm_freq_mult.c'),
> +	   join_paths('intel/i915', 'i915_pm_freq_mult.c'),
>  	   dependencies : test_deps + [ lib_igt_perf ],
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -418,7 +431,7 @@ test_executables += executable('i915_pm_freq_mult',
>  test_list += 'i915_pm_freq_mult'
>  
>  test_executables += executable('i915_pm_rc6_residency',
> -	   join_paths('i915', 'i915_pm_rc6_residency.c'),
> +	   join_paths('intel/i915', 'i915_pm_rc6_residency.c'),
>  	   dependencies : test_deps + [ lib_igt_perf ],
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -426,7 +439,7 @@ test_executables += executable('i915_pm_rc6_residency',
>  test_list += 'i915_pm_rc6_residency'
>  
>  test_executables += executable('gem_barrier_race',
> -	   join_paths('i915', 'gem_barrier_race.c'),
> +	   join_paths('intel/i915', 'gem_barrier_race.c'),
>  	   dependencies : test_deps + [ lib_igt_i915_perf ],
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -434,7 +447,7 @@ test_executables += executable('gem_barrier_race',
>  test_list += 'gem_barrier_race'
>  
>  test_executables += executable('perf_pmu',
> -	   join_paths('i915', 'perf_pmu.c'),
> +	   join_paths('intel/i915', 'perf_pmu.c'),
>  	   dependencies : test_deps + [ lib_igt_perf ],
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -442,7 +455,7 @@ test_executables += executable('perf_pmu',
>  test_list += 'perf_pmu'
>  
>  test_executables += executable('perf',
> -	   join_paths('i915', 'perf.c'),
> +	   join_paths('intel/i915', 'perf.c'),
>  	   dependencies : test_deps + [ lib_igt_i915_perf ],
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -472,7 +485,7 @@ test_executables += executable('kms_color',
>  test_list += 'kms_color'
>  
>  test_executables += executable('kms_dsc',
> -	   [ join_paths('i915', 'kms_dsc.c'), join_paths ('i915', 'kms_dsc_helper.c')],
> +	   [ join_paths('intel/i915', 'kms_dsc.c'), join_paths ('intel/i915', 'kms_dsc_helper.c')],
>  	   dependencies : test_deps,
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -480,7 +493,7 @@ test_executables += executable('kms_dsc',
>  test_list += 'kms_dsc'
>  
>  test_executables += executable('kms_psr2_sf',
> -	   [ join_paths('i915', 'kms_psr2_sf.c'), join_paths ('i915', 'kms_dsc_helper.c')],
> +	   [ join_paths('intel', 'kms_psr2_sf.c'), join_paths ('intel/i915', 'kms_dsc_helper.c')],
>  	   dependencies : test_deps,
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -519,7 +532,7 @@ test_list_target = custom_target('testlist',
>  	      install : true,
>  	      install_dir : libexecdir)
>  
> -test_executables += executable('gem_concurrent_all', 'i915/gem_concurrent_all.c',
> +test_executables += executable('gem_concurrent_all', 'intel/i915/gem_concurrent_all.c',
>  	   dependencies : test_deps + [ libatomic ],
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -537,7 +550,7 @@ foreach prog : test_list
>  	test('testcase check ' + prog, test_script, args : prog)
>  endforeach
>  
> -executable('gem_stress', 'i915/gem_stress.c',
> +executable('gem_stress', 'intel/i915/gem_stress.c',
>  	   install : true,
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> -- 
> 2.40.0
> 
