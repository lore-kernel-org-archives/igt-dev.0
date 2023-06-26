Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D54B10E239
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jun 2023 16:11:57 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@linux.intel.com
Date: Mon, 26 Jun 2023 21:31:02 +0530
Message-Id: <20230626160106.2632928-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V3 i-g-t 0/4] New dir structure for intel specific tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

In-order to organize tests, move all intel specific tests to
a new directory "tests/intel". And rename all intel specific
tests to represent the supported driver. Test name should start
with the driver_name prefix. Below are the Examples.

- tests/intel/xe_*.c   : All XE specific tests. Ex: xe_module_load.c
- tests/intel/kms_*.c  : All kms tests. Ex: kms_psr.c
- tests/intel/intel_*.c: All tests those supports both i915 & XE.
- Rest all will be i915 specific

V2: - Rebase
V3: - Rebase
    - Testplan update

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Bhanuprakash Modem (4):
  tests: New dir structure for intel specific tests
  tests/intel/prime_mmap_kms: Add missing documentation
  testplan/i915: Exclude non-i915 tests from i915 testplan
  testplan/kms: Move kms testplan to intel dir

 docs/testplan/meson.build                     |  6 +-
 tests/{i915 => intel}/api_intel_allocator.c   |  0
 tests/{i915 => intel}/api_intel_bb.c          |  0
 tests/{ => intel}/debugfs_test.c              |  0
 tests/{i915 => intel}/drm_fdinfo.c            |  0
 tests/{i915 => intel}/gem_bad_reloc.c         |  0
 tests/{i915 => intel}/gem_barrier_race.c      |  0
 tests/{i915 => intel}/gem_basic.c             |  0
 tests/{i915 => intel}/gem_blits.c             |  0
 tests/{i915 => intel}/gem_busy.c              |  0
 tests/{i915 => intel}/gem_caching.c           |  0
 tests/{i915 => intel}/gem_ccs.c               |  0
 tests/{i915 => intel}/gem_close.c             |  0
 tests/{i915 => intel}/gem_close_race.c        |  0
 tests/{i915 => intel}/gem_concurrent_all.c    |  0
 tests/{i915 => intel}/gem_concurrent_blit.c   |  0
 tests/{i915 => intel}/gem_create.c            |  0
 tests/{i915 => intel}/gem_cs_tlb.c            |  0
 tests/{i915 => intel}/gem_ctx_bad_destroy.c   |  0
 tests/{i915 => intel}/gem_ctx_create.c        |  0
 tests/{i915 => intel}/gem_ctx_engines.c       |  0
 tests/{i915 => intel}/gem_ctx_exec.c          |  0
 tests/{i915 => intel}/gem_ctx_freq.c          |  0
 tests/{i915 => intel}/gem_ctx_isolation.c     |  0
 tests/{i915 => intel}/gem_ctx_param.c         |  0
 tests/{i915 => intel}/gem_ctx_persistence.c   |  0
 tests/{i915 => intel}/gem_ctx_shared.c        |  0
 tests/{i915 => intel}/gem_ctx_sseu.c          |  0
 tests/{i915 => intel}/gem_ctx_switch.c        |  0
 tests/{i915 => intel}/gem_eio.c               |  0
 tests/{i915 => intel}/gem_evict_alignment.c   |  0
 tests/{i915 => intel}/gem_evict_everything.c  |  0
 tests/{i915 => intel}/gem_exec_alignment.c    |  0
 tests/{i915 => intel}/gem_exec_async.c        |  0
 tests/{i915 => intel}/gem_exec_await.c        |  0
 tests/{i915 => intel}/gem_exec_balancer.c     |  0
 tests/{i915 => intel}/gem_exec_basic.c        |  0
 tests/{i915 => intel}/gem_exec_big.c          |  0
 tests/{i915 => intel}/gem_exec_capture.c      |  0
 tests/{i915 => intel}/gem_exec_create.c       |  0
 tests/{i915 => intel}/gem_exec_endless.c      |  0
 tests/{i915 => intel}/gem_exec_fair.c         |  0
 tests/{i915 => intel}/gem_exec_fence.c        |  0
 tests/{i915 => intel}/gem_exec_flush.c        |  0
 tests/{i915 => intel}/gem_exec_gttfill.c      |  0
 tests/{i915 => intel}/gem_exec_latency.c      |  0
 tests/{i915 => intel}/gem_exec_lut_handle.c   |  0
 tests/{i915 => intel}/gem_exec_nop.c          |  0
 tests/{i915 => intel}/gem_exec_parallel.c     |  0
 tests/{i915 => intel}/gem_exec_params.c       |  0
 tests/{i915 => intel}/gem_exec_reloc.c        |  0
 tests/{i915 => intel}/gem_exec_schedule.c     |  0
 tests/{i915 => intel}/gem_exec_store.c        |  0
 tests/{i915 => intel}/gem_exec_suspend.c      |  0
 tests/{i915 => intel}/gem_exec_whisper.c      |  0
 tests/{i915 => intel}/gem_exercise_blt.c      |  0
 tests/{i915 => intel}/gem_fd_exhaustion.c     |  0
 tests/{i915 => intel}/gem_fence_thrash.c      |  0
 tests/{i915 => intel}/gem_fence_upload.c      |  0
 .../{i915 => intel}/gem_fenced_exec_thrash.c  |  0
 tests/{i915 => intel}/gem_flink_basic.c       |  0
 tests/{i915 => intel}/gem_flink_race.c        |  0
 tests/{i915 => intel}/gem_gpgpu_fill.c        |  0
 tests/{i915 => intel}/gem_gtt_cpu_tlb.c       |  0
 tests/{i915 => intel}/gem_gtt_hog.c           |  0
 tests/{i915 => intel}/gem_gtt_speed.c         |  0
 tests/{i915 => intel}/gem_huc_copy.c          |  0
 tests/{i915 => intel}/gem_linear_blits.c      |  0
 tests/{i915 => intel}/gem_lmem_evict.c        |  0
 tests/{i915 => intel}/gem_lmem_swapping.c     |  0
 tests/{i915 => intel}/gem_lut_handle.c        |  0
 tests/{i915 => intel}/gem_madvise.c           |  0
 tests/{i915 => intel}/gem_media_fill.c        |  0
 tests/{i915 => intel}/gem_media_vme.c         |  0
 tests/{i915 => intel}/gem_mmap.c              |  0
 tests/{i915 => intel}/gem_mmap_gtt.c          |  0
 tests/{i915 => intel}/gem_mmap_offset.c       |  0
 tests/{i915 => intel}/gem_mmap_wc.c           |  0
 .../gem_partial_pwrite_pread.c                |  0
 .../gem_pipe_control_store_loop.c             |  0
 tests/{i915 => intel}/gem_ppgtt.c             |  0
 tests/{i915 => intel}/gem_pread.c             |  0
 tests/{i915 => intel}/gem_pread_after_blit.c  |  0
 tests/{i915 => intel}/gem_pwrite.c            |  0
 tests/{i915 => intel}/gem_pwrite_snooped.c    |  0
 tests/{i915 => intel}/gem_pxp.c               |  0
 tests/{i915 => intel}/gem_read_read_speed.c   |  0
 tests/{i915 => intel}/gem_readwrite.c         |  0
 tests/{i915 => intel}/gem_reg_read.c          |  0
 tests/{i915 => intel}/gem_render_copy.c       |  0
 tests/{i915 => intel}/gem_render_copy_redux.c |  0
 .../{i915 => intel}/gem_render_linear_blits.c |  0
 .../{i915 => intel}/gem_render_tiled_blits.c  |  0
 tests/{i915 => intel}/gem_request_retire.c    |  0
 tests/{i915 => intel}/gem_reset_stats.c       |  0
 tests/{i915 => intel}/gem_ringfill.c          |  0
 tests/{i915 => intel}/gem_set_tiling_vs_blt.c |  0
 tests/{i915 => intel}/gem_set_tiling_vs_gtt.c |  0
 .../gem_set_tiling_vs_pwrite.c                |  0
 tests/{i915 => intel}/gem_shrink.c            |  0
 tests/{i915 => intel}/gem_softpin.c           |  0
 tests/{i915 => intel}/gem_spin_batch.c        |  0
 tests/{i915 => intel}/gem_streaming_writes.c  |  0
 tests/{i915 => intel}/gem_stress.c            |  0
 tests/{i915 => intel}/gem_sync.c              |  0
 tests/{i915 => intel}/gem_tiled_blits.c       |  0
 tests/{i915 => intel}/gem_tiled_fence_blits.c |  0
 .../gem_tiled_partial_pwrite_pread.c          |  0
 tests/{i915 => intel}/gem_tiled_pread_basic.c |  0
 .../{i915 => intel}/gem_tiled_pread_pwrite.c  |  0
 tests/{i915 => intel}/gem_tiled_swapping.c    |  0
 tests/{i915 => intel}/gem_tiled_wb.c          |  0
 tests/{i915 => intel}/gem_tiled_wc.c          |  0
 tests/{i915 => intel}/gem_tiling_max_stride.c |  0
 .../gem_unfence_active_buffers.c              |  0
 .../gem_unref_active_buffers.c                |  0
 tests/{i915 => intel}/gem_userptr_blits.c     |  0
 tests/{i915 => intel}/gem_vm_create.c         |  0
 tests/{i915 => intel}/gem_wait.c              |  0
 tests/{i915 => intel}/gem_watchdog.c          |  0
 tests/{i915 => intel}/gem_workarounds.c       |  0
 tests/{i915 => intel}/gen3_mixed_blits.c      |  0
 .../gen3_render_linear_blits.c                |  0
 .../{i915 => intel}/gen3_render_mixed_blits.c |  0
 .../gen3_render_tiledx_blits.c                |  0
 .../gen3_render_tiledy_blits.c                |  0
 tests/{i915 => intel}/gen7_exec_parse.c       |  0
 tests/{i915 => intel}/gen9_exec_parse.c       |  0
 tests/{i915 => intel}/i915_fb_tiling.c        |  0
 tests/{i915 => intel}/i915_getparams_basic.c  |  0
 tests/{i915 => intel}/i915_hangman.c          |  0
 tests/{i915 => intel}/i915_hwmon.c            |  0
 tests/{i915 => intel}/i915_module_load.c      |  0
 tests/{i915 => intel}/i915_pciid.c            |  0
 tests/{i915 => intel}/i915_pipe_stress.c      |  0
 tests/{i915 => intel}/i915_pm_backlight.c     |  0
 tests/{i915 => intel}/i915_pm_dc.c            |  0
 tests/{i915 => intel}/i915_pm_freq_api.c      |  0
 tests/{i915 => intel}/i915_pm_freq_mult.c     |  0
 tests/{i915 => intel}/i915_pm_lpsp.c          |  0
 tests/{i915 => intel}/i915_pm_rc6_residency.c |  0
 tests/{i915 => intel}/i915_pm_rpm.c           |  0
 tests/{i915 => intel}/i915_pm_rps.c           |  0
 tests/{i915 => intel}/i915_pm_sseu.c          |  0
 tests/{i915 => intel}/i915_power.c            |  0
 tests/{i915 => intel}/i915_query.c            |  0
 tests/{i915 => intel}/i915_selftest.c         |  0
 tests/{i915 => intel}/i915_suspend.c          |  0
 tests/{i915 => intel}/i915_test_config.json   |  9 +-
 tests/{i915 => intel}/kms_big_fb.c            |  0
 tests/{i915 => intel}/kms_big_joiner.c        |  0
 tests/{i915 => intel}/kms_busy.c              |  0
 tests/{i915 => intel}/kms_ccs.c               |  0
 tests/{i915 => intel}/kms_cdclk.c             |  0
 tests/{i915 => intel}/kms_draw_crc.c          |  0
 tests/{i915 => intel}/kms_dsc.c               |  0
 tests/{i915 => intel}/kms_dsc_helper.c        |  0
 tests/{i915 => intel}/kms_dsc_helper.h        |  0
 tests/{i915 => intel}/kms_fb_coherency.c      |  0
 tests/{i915 => intel}/kms_fbcon_fbt.c         |  0
 tests/{i915 => intel}/kms_fence_pin_leak.c    |  0
 tests/{i915 => intel}/kms_flip_scaled_crc.c   |  0
 tests/{i915 => intel}/kms_flip_tiling.c       |  0
 .../kms_frontbuffer_tracking.c                |  0
 tests/{i915 => intel}/kms_legacy_colorkey.c   |  0
 tests/{i915 => intel}/kms_mmap_write_crc.c    |  0
 tests/{i915 => intel}/kms_pipe_b_c_ivb.c      |  0
 tests/{i915 => intel}/kms_psr.c               |  0
 tests/{i915 => intel}/kms_psr2_sf.c           |  0
 tests/{i915 => intel}/kms_psr2_su.c           |  0
 tests/{i915 => intel}/kms_psr_stress_test.c   |  0
 tests/{i915 => intel}/kms_pwrite_crc.c        |  0
 tests/{ => intel}/kms_test_config.json        |  0
 tests/{i915 => intel}/perf.c                  |  0
 tests/{i915 => intel}/perf_pmu.c              |  0
 tests/{ => intel}/prime_busy.c                |  0
 tests/{ => intel}/prime_mmap.c                |  0
 tests/{ => intel}/prime_mmap_coherency.c      |  0
 tests/{ => intel}/prime_mmap_kms.c            | 13 +++
 tests/{ => intel}/prime_self_import.c         |  0
 tests/{i915 => intel}/sysfs_defaults.c        |  0
 .../sysfs_heartbeat_interval.c                |  0
 tests/{i915 => intel}/sysfs_preempt_timeout.c |  0
 .../sysfs_timeslice_duration.c                |  0
 tests/{xe => intel}/xe_compute.c              |  0
 tests/{xe => intel}/xe_create.c               |  0
 tests/{xe => intel}/xe_debugfs.c              |  0
 tests/{xe => intel}/xe_dma_buf_sync.c         |  0
 tests/{xe => intel}/xe_evict.c                |  0
 tests/{xe => intel}/xe_exec_balancer.c        |  0
 tests/{xe => intel}/xe_exec_basic.c           |  0
 tests/{xe => intel}/xe_exec_compute_mode.c    |  0
 tests/{xe => intel}/xe_exec_fault_mode.c      |  0
 tests/{xe => intel}/xe_exec_reset.c           |  0
 tests/{xe => intel}/xe_exec_threads.c         |  0
 tests/{xe => intel}/xe_gpgpu_fill.c           |  0
 tests/{xe => intel}/xe_guc_pc.c               |  0
 tests/{xe => intel}/xe_huc_copy.c             |  0
 tests/{xe => intel}/xe_intel_bb.c             |  0
 tests/{xe => intel}/xe_live_ktest.c           |  0
 tests/{xe => intel}/xe_mmap.c                 |  0
 tests/{xe => intel}/xe_mmio.c                 |  0
 tests/{xe => intel}/xe_module_load.c          |  0
 tests/{xe => intel}/xe_noexec_ping_pong.c     |  0
 tests/{xe => intel}/xe_pm.c                   |  0
 tests/{xe => intel}/xe_prime_self_import.c    |  0
 tests/{xe => intel}/xe_query.c                |  0
 tests/{xe => intel}/xe_spin_batch.c           |  0
 tests/{xe => intel}/xe_test_config.json       |  0
 tests/{xe => intel}/xe_vm.c                   |  0
 tests/{xe => intel}/xe_waitfence.c            |  0
 tests/meson.build                             | 83 ++++++++++---------
 212 files changed, 62 insertions(+), 49 deletions(-)
 rename tests/{i915 => intel}/api_intel_allocator.c (100%)
 rename tests/{i915 => intel}/api_intel_bb.c (100%)
 rename tests/{ => intel}/debugfs_test.c (100%)
 rename tests/{i915 => intel}/drm_fdinfo.c (100%)
 rename tests/{i915 => intel}/gem_bad_reloc.c (100%)
 rename tests/{i915 => intel}/gem_barrier_race.c (100%)
 rename tests/{i915 => intel}/gem_basic.c (100%)
 rename tests/{i915 => intel}/gem_blits.c (100%)
 rename tests/{i915 => intel}/gem_busy.c (100%)
 rename tests/{i915 => intel}/gem_caching.c (100%)
 rename tests/{i915 => intel}/gem_ccs.c (100%)
 rename tests/{i915 => intel}/gem_close.c (100%)
 rename tests/{i915 => intel}/gem_close_race.c (100%)
 rename tests/{i915 => intel}/gem_concurrent_all.c (100%)
 rename tests/{i915 => intel}/gem_concurrent_blit.c (100%)
 rename tests/{i915 => intel}/gem_create.c (100%)
 rename tests/{i915 => intel}/gem_cs_tlb.c (100%)
 rename tests/{i915 => intel}/gem_ctx_bad_destroy.c (100%)
 rename tests/{i915 => intel}/gem_ctx_create.c (100%)
 rename tests/{i915 => intel}/gem_ctx_engines.c (100%)
 rename tests/{i915 => intel}/gem_ctx_exec.c (100%)
 rename tests/{i915 => intel}/gem_ctx_freq.c (100%)
 rename tests/{i915 => intel}/gem_ctx_isolation.c (100%)
 rename tests/{i915 => intel}/gem_ctx_param.c (100%)
 rename tests/{i915 => intel}/gem_ctx_persistence.c (100%)
 rename tests/{i915 => intel}/gem_ctx_shared.c (100%)
 rename tests/{i915 => intel}/gem_ctx_sseu.c (100%)
 rename tests/{i915 => intel}/gem_ctx_switch.c (100%)
 rename tests/{i915 => intel}/gem_eio.c (100%)
 rename tests/{i915 => intel}/gem_evict_alignment.c (100%)
 rename tests/{i915 => intel}/gem_evict_everything.c (100%)
 rename tests/{i915 => intel}/gem_exec_alignment.c (100%)
 rename tests/{i915 => intel}/gem_exec_async.c (100%)
 rename tests/{i915 => intel}/gem_exec_await.c (100%)
 rename tests/{i915 => intel}/gem_exec_balancer.c (100%)
 rename tests/{i915 => intel}/gem_exec_basic.c (100%)
 rename tests/{i915 => intel}/gem_exec_big.c (100%)
 rename tests/{i915 => intel}/gem_exec_capture.c (100%)
 rename tests/{i915 => intel}/gem_exec_create.c (100%)
 rename tests/{i915 => intel}/gem_exec_endless.c (100%)
 rename tests/{i915 => intel}/gem_exec_fair.c (100%)
 rename tests/{i915 => intel}/gem_exec_fence.c (100%)
 rename tests/{i915 => intel}/gem_exec_flush.c (100%)
 rename tests/{i915 => intel}/gem_exec_gttfill.c (100%)
 rename tests/{i915 => intel}/gem_exec_latency.c (100%)
 rename tests/{i915 => intel}/gem_exec_lut_handle.c (100%)
 rename tests/{i915 => intel}/gem_exec_nop.c (100%)
 rename tests/{i915 => intel}/gem_exec_parallel.c (100%)
 rename tests/{i915 => intel}/gem_exec_params.c (100%)
 rename tests/{i915 => intel}/gem_exec_reloc.c (100%)
 rename tests/{i915 => intel}/gem_exec_schedule.c (100%)
 rename tests/{i915 => intel}/gem_exec_store.c (100%)
 rename tests/{i915 => intel}/gem_exec_suspend.c (100%)
 rename tests/{i915 => intel}/gem_exec_whisper.c (100%)
 rename tests/{i915 => intel}/gem_exercise_blt.c (100%)
 rename tests/{i915 => intel}/gem_fd_exhaustion.c (100%)
 rename tests/{i915 => intel}/gem_fence_thrash.c (100%)
 rename tests/{i915 => intel}/gem_fence_upload.c (100%)
 rename tests/{i915 => intel}/gem_fenced_exec_thrash.c (100%)
 rename tests/{i915 => intel}/gem_flink_basic.c (100%)
 rename tests/{i915 => intel}/gem_flink_race.c (100%)
 rename tests/{i915 => intel}/gem_gpgpu_fill.c (100%)
 rename tests/{i915 => intel}/gem_gtt_cpu_tlb.c (100%)
 rename tests/{i915 => intel}/gem_gtt_hog.c (100%)
 rename tests/{i915 => intel}/gem_gtt_speed.c (100%)
 rename tests/{i915 => intel}/gem_huc_copy.c (100%)
 rename tests/{i915 => intel}/gem_linear_blits.c (100%)
 rename tests/{i915 => intel}/gem_lmem_evict.c (100%)
 rename tests/{i915 => intel}/gem_lmem_swapping.c (100%)
 rename tests/{i915 => intel}/gem_lut_handle.c (100%)
 rename tests/{i915 => intel}/gem_madvise.c (100%)
 rename tests/{i915 => intel}/gem_media_fill.c (100%)
 rename tests/{i915 => intel}/gem_media_vme.c (100%)
 rename tests/{i915 => intel}/gem_mmap.c (100%)
 rename tests/{i915 => intel}/gem_mmap_gtt.c (100%)
 rename tests/{i915 => intel}/gem_mmap_offset.c (100%)
 rename tests/{i915 => intel}/gem_mmap_wc.c (100%)
 rename tests/{i915 => intel}/gem_partial_pwrite_pread.c (100%)
 rename tests/{i915 => intel}/gem_pipe_control_store_loop.c (100%)
 rename tests/{i915 => intel}/gem_ppgtt.c (100%)
 rename tests/{i915 => intel}/gem_pread.c (100%)
 rename tests/{i915 => intel}/gem_pread_after_blit.c (100%)
 rename tests/{i915 => intel}/gem_pwrite.c (100%)
 rename tests/{i915 => intel}/gem_pwrite_snooped.c (100%)
 rename tests/{i915 => intel}/gem_pxp.c (100%)
 rename tests/{i915 => intel}/gem_read_read_speed.c (100%)
 rename tests/{i915 => intel}/gem_readwrite.c (100%)
 rename tests/{i915 => intel}/gem_reg_read.c (100%)
 rename tests/{i915 => intel}/gem_render_copy.c (100%)
 rename tests/{i915 => intel}/gem_render_copy_redux.c (100%)
 rename tests/{i915 => intel}/gem_render_linear_blits.c (100%)
 rename tests/{i915 => intel}/gem_render_tiled_blits.c (100%)
 rename tests/{i915 => intel}/gem_request_retire.c (100%)
 rename tests/{i915 => intel}/gem_reset_stats.c (100%)
 rename tests/{i915 => intel}/gem_ringfill.c (100%)
 rename tests/{i915 => intel}/gem_set_tiling_vs_blt.c (100%)
 rename tests/{i915 => intel}/gem_set_tiling_vs_gtt.c (100%)
 rename tests/{i915 => intel}/gem_set_tiling_vs_pwrite.c (100%)
 rename tests/{i915 => intel}/gem_shrink.c (100%)
 rename tests/{i915 => intel}/gem_softpin.c (100%)
 rename tests/{i915 => intel}/gem_spin_batch.c (100%)
 rename tests/{i915 => intel}/gem_streaming_writes.c (100%)
 rename tests/{i915 => intel}/gem_stress.c (100%)
 rename tests/{i915 => intel}/gem_sync.c (100%)
 rename tests/{i915 => intel}/gem_tiled_blits.c (100%)
 rename tests/{i915 => intel}/gem_tiled_fence_blits.c (100%)
 rename tests/{i915 => intel}/gem_tiled_partial_pwrite_pread.c (100%)
 rename tests/{i915 => intel}/gem_tiled_pread_basic.c (100%)
 rename tests/{i915 => intel}/gem_tiled_pread_pwrite.c (100%)
 rename tests/{i915 => intel}/gem_tiled_swapping.c (100%)
 rename tests/{i915 => intel}/gem_tiled_wb.c (100%)
 rename tests/{i915 => intel}/gem_tiled_wc.c (100%)
 rename tests/{i915 => intel}/gem_tiling_max_stride.c (100%)
 rename tests/{i915 => intel}/gem_unfence_active_buffers.c (100%)
 rename tests/{i915 => intel}/gem_unref_active_buffers.c (100%)
 rename tests/{i915 => intel}/gem_userptr_blits.c (100%)
 rename tests/{i915 => intel}/gem_vm_create.c (100%)
 rename tests/{i915 => intel}/gem_wait.c (100%)
 rename tests/{i915 => intel}/gem_watchdog.c (100%)
 rename tests/{i915 => intel}/gem_workarounds.c (100%)
 rename tests/{i915 => intel}/gen3_mixed_blits.c (100%)
 rename tests/{i915 => intel}/gen3_render_linear_blits.c (100%)
 rename tests/{i915 => intel}/gen3_render_mixed_blits.c (100%)
 rename tests/{i915 => intel}/gen3_render_tiledx_blits.c (100%)
 rename tests/{i915 => intel}/gen3_render_tiledy_blits.c (100%)
 rename tests/{i915 => intel}/gen7_exec_parse.c (100%)
 rename tests/{i915 => intel}/gen9_exec_parse.c (100%)
 rename tests/{i915 => intel}/i915_fb_tiling.c (100%)
 rename tests/{i915 => intel}/i915_getparams_basic.c (100%)
 rename tests/{i915 => intel}/i915_hangman.c (100%)
 rename tests/{i915 => intel}/i915_hwmon.c (100%)
 rename tests/{i915 => intel}/i915_module_load.c (100%)
 rename tests/{i915 => intel}/i915_pciid.c (100%)
 rename tests/{i915 => intel}/i915_pipe_stress.c (100%)
 rename tests/{i915 => intel}/i915_pm_backlight.c (100%)
 rename tests/{i915 => intel}/i915_pm_dc.c (100%)
 rename tests/{i915 => intel}/i915_pm_freq_api.c (100%)
 rename tests/{i915 => intel}/i915_pm_freq_mult.c (100%)
 rename tests/{i915 => intel}/i915_pm_lpsp.c (100%)
 rename tests/{i915 => intel}/i915_pm_rc6_residency.c (100%)
 rename tests/{i915 => intel}/i915_pm_rpm.c (100%)
 rename tests/{i915 => intel}/i915_pm_rps.c (100%)
 rename tests/{i915 => intel}/i915_pm_sseu.c (100%)
 rename tests/{i915 => intel}/i915_power.c (100%)
 rename tests/{i915 => intel}/i915_query.c (100%)
 rename tests/{i915 => intel}/i915_selftest.c (100%)
 rename tests/{i915 => intel}/i915_suspend.c (100%)
 rename tests/{i915 => intel}/i915_test_config.json (91%)
 rename tests/{i915 => intel}/kms_big_fb.c (100%)
 rename tests/{i915 => intel}/kms_big_joiner.c (100%)
 rename tests/{i915 => intel}/kms_busy.c (100%)
 rename tests/{i915 => intel}/kms_ccs.c (100%)
 rename tests/{i915 => intel}/kms_cdclk.c (100%)
 rename tests/{i915 => intel}/kms_draw_crc.c (100%)
 rename tests/{i915 => intel}/kms_dsc.c (100%)
 rename tests/{i915 => intel}/kms_dsc_helper.c (100%)
 rename tests/{i915 => intel}/kms_dsc_helper.h (100%)
 rename tests/{i915 => intel}/kms_fb_coherency.c (100%)
 rename tests/{i915 => intel}/kms_fbcon_fbt.c (100%)
 rename tests/{i915 => intel}/kms_fence_pin_leak.c (100%)
 rename tests/{i915 => intel}/kms_flip_scaled_crc.c (100%)
 rename tests/{i915 => intel}/kms_flip_tiling.c (100%)
 rename tests/{i915 => intel}/kms_frontbuffer_tracking.c (100%)
 rename tests/{i915 => intel}/kms_legacy_colorkey.c (100%)
 rename tests/{i915 => intel}/kms_mmap_write_crc.c (100%)
 rename tests/{i915 => intel}/kms_pipe_b_c_ivb.c (100%)
 rename tests/{i915 => intel}/kms_psr.c (100%)
 rename tests/{i915 => intel}/kms_psr2_sf.c (100%)
 rename tests/{i915 => intel}/kms_psr2_su.c (100%)
 rename tests/{i915 => intel}/kms_psr_stress_test.c (100%)
 rename tests/{i915 => intel}/kms_pwrite_crc.c (100%)
 rename tests/{ => intel}/kms_test_config.json (100%)
 rename tests/{i915 => intel}/perf.c (100%)
 rename tests/{i915 => intel}/perf_pmu.c (100%)
 rename tests/{ => intel}/prime_busy.c (100%)
 rename tests/{ => intel}/prime_mmap.c (100%)
 rename tests/{ => intel}/prime_mmap_coherency.c (100%)
 rename tests/{ => intel}/prime_mmap_kms.c (96%)
 rename tests/{ => intel}/prime_self_import.c (100%)
 rename tests/{i915 => intel}/sysfs_defaults.c (100%)
 rename tests/{i915 => intel}/sysfs_heartbeat_interval.c (100%)
 rename tests/{i915 => intel}/sysfs_preempt_timeout.c (100%)
 rename tests/{i915 => intel}/sysfs_timeslice_duration.c (100%)
 rename tests/{xe => intel}/xe_compute.c (100%)
 rename tests/{xe => intel}/xe_create.c (100%)
 rename tests/{xe => intel}/xe_debugfs.c (100%)
 rename tests/{xe => intel}/xe_dma_buf_sync.c (100%)
 rename tests/{xe => intel}/xe_evict.c (100%)
 rename tests/{xe => intel}/xe_exec_balancer.c (100%)
 rename tests/{xe => intel}/xe_exec_basic.c (100%)
 rename tests/{xe => intel}/xe_exec_compute_mode.c (100%)
 rename tests/{xe => intel}/xe_exec_fault_mode.c (100%)
 rename tests/{xe => intel}/xe_exec_reset.c (100%)
 rename tests/{xe => intel}/xe_exec_threads.c (100%)
 rename tests/{xe => intel}/xe_gpgpu_fill.c (100%)
 rename tests/{xe => intel}/xe_guc_pc.c (100%)
 rename tests/{xe => intel}/xe_huc_copy.c (100%)
 rename tests/{xe => intel}/xe_intel_bb.c (100%)
 rename tests/{xe => intel}/xe_live_ktest.c (100%)
 rename tests/{xe => intel}/xe_mmap.c (100%)
 rename tests/{xe => intel}/xe_mmio.c (100%)
 rename tests/{xe => intel}/xe_module_load.c (100%)
 rename tests/{xe => intel}/xe_noexec_ping_pong.c (100%)
 rename tests/{xe => intel}/xe_pm.c (100%)
 rename tests/{xe => intel}/xe_prime_self_import.c (100%)
 rename tests/{xe => intel}/xe_query.c (100%)
 rename tests/{xe => intel}/xe_spin_batch.c (100%)
 rename tests/{xe => intel}/xe_test_config.json (100%)
 rename tests/{xe => intel}/xe_vm.c (100%)
 rename tests/{xe => intel}/xe_waitfence.c (100%)

--
2.40.0
