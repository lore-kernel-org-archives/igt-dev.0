Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 112ED10E28F
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jul 2023 07:16:11 +0000 (UTC)
Date: Tue, 4 Jul 2023 09:13:40 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <20230704091340.03405c31@maurocar-mobl2>
In-Reply-To: <20230626160106.2632928-2-bhanuprakash.modem@intel.com>
References: <20230626160106.2632928-1-bhanuprakash.modem@intel.com>
 <20230626160106.2632928-2-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [V3 i-g-t 1/4] tests: New dir structure for intel
 specific tests
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

On Mon, 26 Jun 2023 21:31:03 +0530
Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:

> In-order to organize tests, move all intel specific tests to
> a new directory "tests/intel".
> 
> Motive is to rename all intel specific tests to represent the
> supported driver. Test name should start with the driver_name
> prefix. Below are the Examples.
> 
> - tests/intel/intel_*.c: All tests those supports both i915 & XE.
> - tests/intel/kms_*.c  : All kms tests. Ex: kms_psr.c
> - tests/intel/xe_*.c   : All XE specific tests. Ex: xe_module_load.c
> - Rest all will be the i915 specific
> 
> Going forward, we need to follow the above rules to maintain the
> tests. As it'll take a lot of efforts & affects many folks (like CI),
> renaming of i915 specific tests is kept open intentionally.
> 
> Still, the below rule is applicable for new i915 tests.
> - tests/intel/i915_*.c : All i915 specific tests. Ex: i915_module_load.c
> 
> V2: - Rebase
>     - Conditional compilation for Xe tests
>     - Squash renaming patch
> 
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  docs/testplan/meson.build                     |  4 +-
>  tests/{i915 => intel}/api_intel_allocator.c   |  0
>  tests/{i915 => intel}/api_intel_bb.c          |  0
>  tests/{ => intel}/debugfs_test.c              |  0
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
>  tests/{i915 => intel}/i915_test_config.json   |  6 +-
>  tests/{i915 => intel}/kms_big_fb.c            |  0
>  tests/{i915 => intel}/kms_big_joiner.c        |  0
>  tests/{i915 => intel}/kms_busy.c              |  0
>  tests/{i915 => intel}/kms_ccs.c               |  0
>  tests/{i915 => intel}/kms_cdclk.c             |  0
>  tests/{i915 => intel}/kms_draw_crc.c          |  0
>  tests/{i915 => intel}/kms_dsc.c               |  0
>  tests/{i915 => intel}/kms_dsc_helper.c        |  0
>  tests/{i915 => intel}/kms_dsc_helper.h        |  0
>  tests/{i915 => intel}/kms_fb_coherency.c      |  0
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
>  tests/{ => intel}/prime_busy.c                |  0
>  tests/{ => intel}/prime_mmap.c                |  0
>  tests/{ => intel}/prime_mmap_coherency.c      |  0
>  tests/{ => intel}/prime_mmap_kms.c            |  0
>  tests/{ => intel}/prime_self_import.c         |  0
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
>  tests/{xe => intel}/xe_live_ktest.c           |  0
>  tests/{xe => intel}/xe_mmap.c                 |  0
>  tests/{xe => intel}/xe_mmio.c                 |  0
>  tests/{xe => intel}/xe_module_load.c          |  0
>  tests/{xe => intel}/xe_noexec_ping_pong.c     |  0
>  tests/{xe => intel}/xe_pm.c                   |  0
>  tests/{xe => intel}/xe_prime_self_import.c    |  0
>  tests/{xe => intel}/xe_query.c                |  0
>  tests/{xe => intel}/xe_spin_batch.c           |  0
>  tests/{xe => intel}/xe_test_config.json       |  0
>  tests/{xe => intel}/xe_vm.c                   |  0
>  tests/{xe => intel}/xe_waitfence.c            |  0
>  tests/meson.build                             | 83 ++++++++++---------
>  211 files changed, 46 insertions(+), 47 deletions(-)

>  rename tests/{i915 => intel}/api_intel_allocator.c (100%)
>  rename tests/{i915 => intel}/api_intel_bb.c (100%)
>  rename tests/{ => intel}/debugfs_test.c (100%)
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

The above seems messy, as those tests are meant to be used only for
i915. They would likely need gain an i915_ prefix.

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
>  rename tests/{i915 => intel}/i915_test_config.json (92%)
>  rename tests/{i915 => intel}/kms_big_fb.c (100%)
>  rename tests/{i915 => intel}/kms_big_joiner.c (100%)
>  rename tests/{i915 => intel}/kms_busy.c (100%)
>  rename tests/{i915 => intel}/kms_ccs.c (100%)
>  rename tests/{i915 => intel}/kms_cdclk.c (100%)
>  rename tests/{i915 => intel}/kms_draw_crc.c (100%)
>  rename tests/{i915 => intel}/kms_dsc.c (100%)
>  rename tests/{i915 => intel}/kms_dsc_helper.c (100%)
>  rename tests/{i915 => intel}/kms_dsc_helper.h (100%)
>  rename tests/{i915 => intel}/kms_fb_coherency.c (100%)
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
>  rename tests/{ => intel}/prime_busy.c (100%)
>  rename tests/{ => intel}/prime_mmap.c (100%)
>  rename tests/{ => intel}/prime_mmap_coherency.c (100%)
>  rename tests/{ => intel}/prime_mmap_kms.c (100%)
>  rename tests/{ => intel}/prime_self_import.c (100%)
>  rename tests/{i915 => intel}/sysfs_defaults.c (100%)
>  rename tests/{i915 => intel}/sysfs_heartbeat_interval.c (100%)
>  rename tests/{i915 => intel}/sysfs_preempt_timeout.c (100%)
>  rename tests/{i915 => intel}/sysfs_timeslice_duration.c (100%)

Same here: the tests that are specific to i915 should gain the
i915_ prefix after a rename.

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
>  rename tests/{xe => intel}/xe_live_ktest.c (100%)
>  rename tests/{xe => intel}/xe_mmap.c (100%)
>  rename tests/{xe => intel}/xe_mmio.c (100%)
>  rename tests/{xe => intel}/xe_module_load.c (100%)
>  rename tests/{xe => intel}/xe_noexec_ping_pong.c (100%)
>  rename tests/{xe => intel}/xe_pm.c (100%)
>  rename tests/{xe => intel}/xe_prime_self_import.c (100%)
>  rename tests/{xe => intel}/xe_query.c (100%)
>  rename tests/{xe => intel}/xe_spin_batch.c (100%)
>  rename tests/{xe => intel}/xe_test_config.json (100%)
>  rename tests/{xe => intel}/xe_vm.c (100%)
>  rename tests/{xe => intel}/xe_waitfence.c (100%)
> 
> diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
> index bf73dd32a..fb933a780 100644
> --- a/docs/testplan/meson.build
> +++ b/docs/testplan/meson.build
> @@ -6,9 +6,9 @@ rst2pdf = find_program('rst2pdf', required: false)
>  
>  stylesheet = join_paths(meson.current_source_dir(), 'testplan.css')
>  
> -xe_test_config = join_paths(source_root, 'tests', 'xe', 'xe_test_config.json')
> +xe_test_config = join_paths(source_root, 'tests', 'intel', 'xe_test_config.json')
>  kms_test_config = join_paths(source_root, 'tests', 'kms_test_config.json')
> -i915_test_config = join_paths(source_root, 'tests', 'i915', 'i915_test_config.json')
> +i915_test_config = join_paths(source_root, 'tests', 'intel', 'i915_test_config.json')
>  
>  check_testlist = []
>  if build_tests

...

> diff --git a/tests/meson.build b/tests/meson.build
> index 85ea7e74e..6d51b32ef 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -5,7 +5,6 @@ test_progs = [
>  	'core_getversion',
>  	'core_setmaster',
>  	'core_setmaster_vs_auth',
> -	'debugfs_test',
>  	'dmabuf',
>  	'dmabuf_sync_file',
>  	'device_reset',
> @@ -67,11 +66,6 @@ test_progs = [
>  	'panfrost_gem_new',
>  	'panfrost_prime',
>  	'panfrost_submit',
> -	'prime_busy',
> -	'prime_mmap',
> -	'prime_mmap_coherency',
> -	'prime_mmap_kms',
> -	'prime_self_import',
>  	'prime_udl',
>  	'prime_vgem',
>  	'syncobj_basic',
> @@ -83,9 +77,10 @@ test_progs = [
>  	'vgem_slow',
>  ]
>  
> -i915_progs = [
> +intel_progs = [

Please don't merge i915 and xe. The best here would be to have 3 lists:

	intel_i915_progs
	intel_xe_progs
	intel_kms_progs

This way, we can better handle dependencies at testplan/meson.build.

>  	'api_intel_allocator',
>  	'api_intel_bb',
> +	'debugfs_test',
>  	'gen3_mixed_blits',
>  	'gen3_render_linear_blits',
>  	'gen3_render_mixed_blits',
> @@ -237,13 +232,15 @@ i915_progs = [
>  	'kms_psr2_su',
>  	'kms_psr_stress_test',
>  	'kms_pwrite_crc',
> +	'prime_busy',
> +	'prime_mmap',
> +	'prime_mmap_coherency',
> +	'prime_mmap_kms',
> +	'prime_self_import',
>  	'sysfs_defaults',
>  	'sysfs_heartbeat_interval',
>  	'sysfs_preempt_timeout',
>  	'sysfs_timeslice_duration',
> -]
> -
> -xe_progs = [
>  	'xe_create',
>  	'xe_compute',
>  	'xe_dma_buf_sync',
> @@ -310,9 +307,26 @@ foreach prog : test_progs
>  	test_list += prog
>  endforeach
>  
> -foreach prog : i915_progs
> +# Filter Xe tests
> +xe_prefix = 'xe_'
> +progs = []
> +if build_xe
> +	build_info += 'Xe **experimental** tests enabled.'
> +endif

This is another reason why not merging things: this is hacky!

> +
> +foreach prog : intel_progs
> +	if not build_xe
> +	      if not prog.startswith(xe_prefix)
> +		    progs += prog
> +	      endif

This is also hacky!

What it can be done, instead, is to merge the per-intel-test-type
lists (kms, xe, i915) on an Intel list, e. g. something like:

	intel_progs = intel_kms_progs
	intel_progs += intel_i915_progs

	if build_xe
		build_info += 'Xe **experimental** tests enabled.'
		intel_progs += intel_xe_progs
	endif

As a side effect, this would help if we ever need to add options to
enable/disable i915 and/or kms test builds.


As a side note, this will break IGT bisectability, as patches 3 and 4
are now required.

IMO, you need to apply first patch 3.

I would also break this patch in two (or three patches, if needed):

- the first one will be renaming i915/* to intel/i915_*;
- the second one will be moving tests/kms* to intel/kms*;
- If needed, a third patch will handle other non-i915 intel-specific
  KMS tests not named with a kms_ prefix to have such prefix on them.

Regards,
Mauro


> +	else
> +	      progs += prog
> +	endif
> +endforeach
> +
> +foreach prog : progs
>  	test_executables += executable(prog,
> -		   join_paths('i915', prog + '.c'),
> +		   join_paths('intel', prog + '.c'),
>  		   dependencies : test_deps,
>  		   install_dir : libexecdir,
>  		   install_rpath : libexecdir_rpathdir,
> @@ -320,19 +334,6 @@ foreach prog : i915_progs
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
>  foreach prog : msm_progs
>  	test_executables += executable(prog, join_paths('msm', prog + '.c'),
>  				       dependencies : test_deps,
> @@ -357,7 +358,7 @@ if chamelium.found()
>  endif
>  
>  test_executables += executable('drm_fdinfo',
> -	   join_paths('i915', 'drm_fdinfo.c'),
> +	   join_paths('intel', 'drm_fdinfo.c'),
>  	   dependencies : test_deps + [ lib_igt_drm_fdinfo ],
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -372,7 +373,7 @@ test_executables += executable('dumb_buffer', 'dumb_buffer.c',
>  test_list += 'dumb_buffer'
>  
>  test_executables += executable('gem_create',
> -	   join_paths('i915', 'gem_create.c'),
> +	   join_paths('intel', 'gem_create.c'),
>  	   dependencies : test_deps + [ libatomic ],
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -380,7 +381,7 @@ test_executables += executable('gem_create',
>  test_list += 'gem_create'
>  
>  test_executables += executable('gem_ctx_freq',
> -	   join_paths('i915', 'gem_ctx_freq.c'),
> +	   join_paths('intel', 'gem_ctx_freq.c'),
>  	   dependencies : test_deps + [ lib_igt_perf ],
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -388,7 +389,7 @@ test_executables += executable('gem_ctx_freq',
>  test_list += 'gem_ctx_freq'
>  
>  test_executables += executable('gem_ctx_sseu',
> -	   join_paths('i915', 'gem_ctx_sseu.c'),
> +	   join_paths('intel', 'gem_ctx_sseu.c'),
>  	   dependencies : test_deps + [ lib_igt_perf ],
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -396,14 +397,14 @@ test_executables += executable('gem_ctx_sseu',
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
> @@ -411,7 +412,7 @@ test_executables += executable('gem_exec_balancer', 'i915/gem_exec_balancer.c',
>  test_list += 'gem_exec_balancer'
>  
>  test_executables += executable('gem_mmap_offset',
> -	   join_paths('i915', 'gem_mmap_offset.c'),
> +	   join_paths('intel', 'gem_mmap_offset.c'),
>  	   dependencies : test_deps + [ libatomic ],
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -419,7 +420,7 @@ test_executables += executable('gem_mmap_offset',
>  test_list += 'gem_mmap_offset'
>  
>  test_executables += executable('i915_pm_freq_mult',
> -	   join_paths('i915', 'i915_pm_freq_mult.c'),
> +	   join_paths('intel', 'i915_pm_freq_mult.c'),
>  	   dependencies : test_deps + [ lib_igt_perf ],
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -427,7 +428,7 @@ test_executables += executable('i915_pm_freq_mult',
>  test_list += 'i915_pm_freq_mult'
>  
>  test_executables += executable('i915_pm_rc6_residency',
> -	   join_paths('i915', 'i915_pm_rc6_residency.c'),
> +	   join_paths('intel', 'i915_pm_rc6_residency.c'),
>  	   dependencies : test_deps + [ lib_igt_perf ],
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -435,7 +436,7 @@ test_executables += executable('i915_pm_rc6_residency',
>  test_list += 'i915_pm_rc6_residency'
>  
>  test_executables += executable('gem_barrier_race',
> -	   join_paths('i915', 'gem_barrier_race.c'),
> +	   join_paths('intel', 'gem_barrier_race.c'),
>  	   dependencies : test_deps + [ lib_igt_i915_perf ],
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -443,7 +444,7 @@ test_executables += executable('gem_barrier_race',
>  test_list += 'gem_barrier_race'
>  
>  test_executables += executable('perf_pmu',
> -	   join_paths('i915', 'perf_pmu.c'),
> +	   join_paths('intel', 'perf_pmu.c'),
>  	   dependencies : test_deps + [ lib_igt_perf ],
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -451,7 +452,7 @@ test_executables += executable('perf_pmu',
>  test_list += 'perf_pmu'
>  
>  test_executables += executable('perf',
> -	   join_paths('i915', 'perf.c'),
> +	   join_paths('intel', 'perf.c'),
>  	   dependencies : test_deps + [ lib_igt_i915_perf ],
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -481,7 +482,7 @@ test_executables += executable('kms_color',
>  test_list += 'kms_color'
>  
>  test_executables += executable('kms_dsc',
> -	   [ join_paths('i915', 'kms_dsc.c'), join_paths ('i915', 'kms_dsc_helper.c')],
> +	   [ join_paths('intel', 'kms_dsc.c'), join_paths ('intel', 'kms_dsc_helper.c')],
>  	   dependencies : test_deps,
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -489,7 +490,7 @@ test_executables += executable('kms_dsc',
>  test_list += 'kms_dsc'
>  
>  test_executables += executable('kms_psr2_sf',
> -	   [ join_paths('i915', 'kms_psr2_sf.c'), join_paths ('i915', 'kms_dsc_helper.c')],
> +	   [ join_paths('intel', 'kms_psr2_sf.c'), join_paths ('intel', 'kms_dsc_helper.c')],
>  	   dependencies : test_deps,
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -528,7 +529,7 @@ test_list_target = custom_target('testlist',
>  	      install : true,
>  	      install_dir : libexecdir)
>  
> -test_executables += executable('gem_concurrent_all', 'i915/gem_concurrent_all.c',
> +test_executables += executable('gem_concurrent_all', 'intel/gem_concurrent_all.c',
>  	   dependencies : test_deps + [ libatomic ],
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
> @@ -546,7 +547,7 @@ foreach prog : test_list
>  	test('testcase check ' + prog, test_script, args : prog)
>  endforeach
>  
> -executable('gem_stress', 'i915/gem_stress.c',
> +executable('gem_stress', 'intel/gem_stress.c',
>  	   install : true,
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
