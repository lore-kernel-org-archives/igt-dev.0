Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE1F10E11B
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Aug 2023 19:43:08 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  3 Aug 2023 01:03:23 +0530
Message-Id: <20230802193330.3843896-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 0/7] New dir structure for intel specific tests
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
- tests/intel/i915_*.c : All i915 specific tests. Ex: i915_module_load.c

Bhanuprakash Modem (7):
  testplan/i915: Exclude non-i915 tests from i915 testplan
  testplan/kms: Move kms testplan to intel dir
  tests/i915/prime_mmap_kms: Add missing documentation
  tests/meson.build: Simplify builds for Chamelium targets
  tests: Move intel specific tests to new directory
  tests/meson.build: Split intel targets based on their nature
  tests: Rename all intel specific tests

 README.md                                     |   2 +-
 docs/testplan/meson.build                     |   6 +-
 tests/intel-ci/blacklist-pre-merge.txt        |  14 +-
 tests/intel-ci/blacklist.txt                  | 102 ++---
 tests/intel-ci/fast-feedback.testlist         | 104 ++---
 .../i915_api_intel_bb.c}                      |   0
 .../i915_debugfs_test.c}                      |   0
 .../drm_fdinfo.c => intel/i915_drm_fdinfo.c}  |   0
 tests/{i915 => intel}/i915_fb_tiling.c        |   0
 .../i915_gem_bad_reloc.c}                     |   0
 .../i915_gem_barrier_race.c}                  |   0
 .../gem_basic.c => intel/i915_gem_basic.c}    |   0
 .../gem_blits.c => intel/i915_gem_blits.c}    |   0
 .../gem_busy.c => intel/i915_gem_busy.c}      |   0
 .../i915_gem_caching.c}                       |   0
 .../{i915/gem_ccs.c => intel/i915_gem_ccs.c}  |   0
 .../gem_close.c => intel/i915_gem_close.c}    |   0
 .../i915_gem_close_race.c}                    |   0
 .../i915_gem_concurrent_all.c}                |   0
 .../i915_gem_concurrent_blit.c}               |   2 +-
 .../gem_create.c => intel/i915_gem_create.c}  |   0
 .../gem_cs_tlb.c => intel/i915_gem_cs_tlb.c}  |   0
 .../i915_gem_ctx_bad_destroy.c}               |   0
 .../i915_gem_ctx_create.c}                    |   0
 .../i915_gem_ctx_engines.c}                   |   0
 .../i915_gem_ctx_exec.c}                      |   0
 .../i915_gem_ctx_freq.c}                      |   0
 .../i915_gem_ctx_isolation.c}                 |   0
 .../i915_gem_ctx_param.c}                     |   0
 .../i915_gem_ctx_persistence.c}               |   0
 .../i915_gem_ctx_shared.c}                    |   0
 .../i915_gem_ctx_sseu.c}                      |   0
 .../i915_gem_ctx_switch.c}                    |   0
 .../{i915/gem_eio.c => intel/i915_gem_eio.c}  |   0
 .../i915_gem_evict_alignment.c}               |   0
 .../i915_gem_evict_everything.c}              |   0
 .../i915_gem_exec_alignment.c}                |   0
 .../i915_gem_exec_async.c}                    |   0
 .../i915_gem_exec_await.c}                    |   0
 .../i915_gem_exec_balancer.c}                 |   0
 .../i915_gem_exec_basic.c}                    |   0
 .../i915_gem_exec_big.c}                      |   0
 .../i915_gem_exec_capture.c}                  |   0
 .../i915_gem_exec_create.c}                   |   0
 .../i915_gem_exec_endless.c}                  |   0
 .../i915_gem_exec_fair.c}                     |   0
 .../i915_gem_exec_fence.c}                    |   0
 .../i915_gem_exec_flush.c}                    |   0
 .../i915_gem_exec_gttfill.c}                  |   0
 .../i915_gem_exec_latency.c}                  |   0
 .../i915_gem_exec_lut_handle.c}               |   0
 .../i915_gem_exec_nop.c}                      |   0
 .../i915_gem_exec_parallel.c}                 |   0
 .../i915_gem_exec_params.c}                   |   0
 .../i915_gem_exec_reloc.c}                    |   0
 .../i915_gem_exec_schedule.c}                 |   0
 .../i915_gem_exec_store.c}                    |   0
 .../i915_gem_exec_suspend.c}                  |   0
 .../i915_gem_exec_whisper.c}                  |   0
 .../i915_gem_exercise_blt.c}                  |   0
 .../i915_gem_fd_exhaustion.c}                 |   0
 .../i915_gem_fence_thrash.c}                  |   0
 .../i915_gem_fence_upload.c}                  |   0
 .../i915_gem_fenced_exec_thrash.c}            |   0
 .../i915_gem_flink_basic.c}                   |   0
 .../i915_gem_flink_race.c}                    |   0
 .../i915_gem_gpgpu_fill.c}                    |   0
 .../i915_gem_gtt_cpu_tlb.c}                   |   0
 .../i915_gem_gtt_hog.c}                       |   0
 .../i915_gem_gtt_speed.c}                     |   0
 .../i915_gem_huc_copy.c}                      |   0
 .../i915_gem_linear_blits.c}                  |   0
 .../i915_gem_lmem_evict.c}                    |   0
 .../i915_gem_lmem_swapping.c}                 |   0
 .../i915_gem_lut_handle.c}                    |   0
 .../i915_gem_madvise.c}                       |   0
 .../i915_gem_media_fill.c}                    |   0
 .../i915_gem_media_vme.c}                     |   0
 .../gem_mmap.c => intel/i915_gem_mmap.c}      |   0
 .../i915_gem_mmap_gtt.c}                      |   0
 .../i915_gem_mmap_offset.c}                   |   0
 .../i915_gem_mmap_wc.c}                       |   0
 .../i915_gem_partial_pwrite_pread.c}          |   0
 .../i915_gem_pipe_control_store_loop.c}       |   0
 .../gem_ppgtt.c => intel/i915_gem_ppgtt.c}    |   0
 .../gem_pread.c => intel/i915_gem_pread.c}    |   0
 .../i915_gem_pread_after_blit.c}              |   0
 .../gem_pwrite.c => intel/i915_gem_pwrite.c}  |   0
 .../i915_gem_pwrite_snooped.c}                |   0
 .../{i915/gem_pxp.c => intel/i915_gem_pxp.c}  |   0
 .../i915_gem_read_read_speed.c}               |   0
 .../i915_gem_readwrite.c}                     |   0
 .../i915_gem_reg_read.c}                      |   0
 .../i915_gem_render_copy.c}                   |   0
 .../i915_gem_render_copy_redux.c}             |   0
 .../i915_gem_render_linear_blits.c}           |   0
 .../i915_gem_render_tiled_blits.c}            |   0
 .../i915_gem_request_retire.c}                |   0
 .../i915_gem_reset_stats.c}                   |   0
 .../i915_gem_ringfill.c}                      |   0
 .../i915_gem_set_tiling_vs_blt.c}             |   0
 .../i915_gem_set_tiling_vs_gtt.c}             |   0
 .../i915_gem_set_tiling_vs_pwrite.c}          |   0
 .../gem_shrink.c => intel/i915_gem_shrink.c}  |   0
 .../i915_gem_softpin.c}                       |   0
 .../i915_gem_spin_batch.c}                    |   0
 .../i915_gem_streaming_writes.c}              |   0
 .../gem_stress.c => intel/i915_gem_stress.c}  |   0
 .../gem_sync.c => intel/i915_gem_sync.c}      |   0
 .../i915_gem_tiled_blits.c}                   |   0
 .../i915_gem_tiled_fence_blits.c}             |   0
 .../i915_gem_tiled_partial_pwrite_pread.c}    |   0
 .../i915_gem_tiled_pread_basic.c}             |   0
 .../i915_gem_tiled_pread_pwrite.c}            |   0
 .../i915_gem_tiled_swapping.c}                |   0
 .../i915_gem_tiled_wb.c}                      |   0
 .../i915_gem_tiled_wc.c}                      |   0
 .../i915_gem_tiling_max_stride.c}             |   0
 .../i915_gem_unfence_active_buffers.c}        |   0
 .../i915_gem_unref_active_buffers.c}          |   0
 .../i915_gem_userptr_blits.c}                 |   0
 .../i915_gem_vm_create.c}                     |   0
 .../gem_wait.c => intel/i915_gem_wait.c}      |   0
 .../i915_gem_watchdog.c}                      |   0
 .../i915_gem_workarounds.c}                   |   0
 .../i915_gen3_mixed_blits.c}                  |   0
 .../i915_gen3_render_linear_blits.c}          |   0
 .../i915_gen3_render_mixed_blits.c}           |   0
 .../i915_gen3_render_tiledx_blits.c}          |   0
 .../i915_gen3_render_tiledy_blits.c}          |   0
 .../i915_gen7_exec_parse.c}                   |   0
 .../i915_gen9_exec_parse.c}                   |   0
 tests/{i915 => intel}/i915_getparams_basic.c  |   0
 tests/{i915 => intel}/i915_hangman.c          |   0
 tests/{i915 => intel}/i915_hwmon.c            |   0
 tests/{i915 => intel}/i915_module_load.c      |   0
 tests/{i915 => intel}/i915_pciid.c            |   0
 tests/{i915/perf.c => intel/i915_perf.c}      |   0
 .../perf_pmu.c => intel/i915_perf_pmu.c}      |   0
 tests/{i915 => intel}/i915_pipe_stress.c      |   0
 tests/{i915 => intel}/i915_pm_backlight.c     |   0
 tests/{i915 => intel}/i915_pm_dc.c            |   0
 tests/{i915 => intel}/i915_pm_freq_api.c      |   0
 tests/{i915 => intel}/i915_pm_freq_mult.c     |   0
 tests/{i915 => intel}/i915_pm_lpsp.c          |   0
 tests/{i915 => intel}/i915_pm_rc6_residency.c |   0
 tests/{i915 => intel}/i915_pm_rpm.c           |   0
 tests/{i915 => intel}/i915_pm_rps.c           |   0
 tests/{i915 => intel}/i915_pm_sseu.c          |   0
 tests/{i915 => intel}/i915_power.c            |   0
 .../{prime_busy.c => intel/i915_prime_busy.c} |   0
 .../{prime_mmap.c => intel/i915_prime_mmap.c} |   0
 .../i915_prime_mmap_coherency.c}              |   0
 .../i915_prime_mmap_kms.c}                    |  13 +
 .../i915_prime_self_import.c}                 |   0
 tests/{i915 => intel}/i915_query.c            |   0
 tests/{i915 => intel}/i915_selftest.c         |   0
 tests/{i915 => intel}/i915_suspend.c          |   0
 .../i915_sysfs_defaults.c}                    |   0
 .../i915_sysfs_heartbeat_interval.c}          |   0
 .../i915_sysfs_preempt_timeout.c}             |   0
 .../i915_sysfs_timeslice_duration.c}          |   0
 tests/{i915 => intel}/i915_test_config.json   |   9 +-
 .../intel_api_intel_allocator.c}              |   0
 tests/{i915 => intel}/kms_big_fb.c            |   0
 tests/{i915 => intel}/kms_big_joiner.c        |   0
 tests/{i915 => intel}/kms_busy.c              |   0
 tests/{i915 => intel}/kms_ccs.c               |   0
 tests/{i915 => intel}/kms_cdclk.c             |   0
 tests/{i915 => intel}/kms_draw_crc.c          |   0
 tests/{i915 => intel}/kms_dsc.c               |   0
 tests/{i915 => intel}/kms_dsc_helper.c        |   0
 tests/{i915 => intel}/kms_dsc_helper.h        |   0
 tests/{i915 => intel}/kms_fb_coherency.c      |   0
 tests/{i915 => intel}/kms_fbcon_fbt.c         |   0
 tests/{i915 => intel}/kms_fence_pin_leak.c    |   0
 tests/{i915 => intel}/kms_flip_scaled_crc.c   |   0
 tests/{i915 => intel}/kms_flip_tiling.c       |   0
 .../kms_frontbuffer_tracking.c                |   0
 tests/{i915 => intel}/kms_legacy_colorkey.c   |   0
 tests/{i915 => intel}/kms_mmap_write_crc.c    |   0
 tests/{i915 => intel}/kms_pipe_b_c_ivb.c      |   0
 tests/{i915 => intel}/kms_psr.c               |   0
 tests/{i915 => intel}/kms_psr2_sf.c           |   0
 tests/{i915 => intel}/kms_psr2_su.c           |   0
 tests/{i915 => intel}/kms_psr_stress_test.c   |   0
 tests/{i915 => intel}/kms_pwrite_crc.c        |   0
 tests/{ => intel}/kms_test_config.json        |   2 +-
 tests/{xe => intel}/xe_ccs.c                  |   0
 tests/{xe => intel}/xe_compute.c              |   0
 tests/{xe => intel}/xe_create.c               |   0
 tests/{xe => intel}/xe_debugfs.c              |   0
 tests/{xe => intel}/xe_dma_buf_sync.c         |   0
 tests/{xe => intel}/xe_evict.c                |   0
 tests/{xe => intel}/xe_exec_balancer.c        |   0
 tests/{xe => intel}/xe_exec_basic.c           |   0
 tests/{xe => intel}/xe_exec_compute_mode.c    |   0
 tests/{xe => intel}/xe_exec_fault_mode.c      |   0
 tests/{xe => intel}/xe_exec_reset.c           |   0
 tests/{xe => intel}/xe_exec_store.c           |   0
 tests/{xe => intel}/xe_exec_threads.c         |   0
 tests/{xe => intel}/xe_exercise_blt.c         |   0
 tests/{xe => intel}/xe_gpgpu_fill.c           |   0
 tests/{xe => intel}/xe_guc_pc.c               |   0
 tests/{xe => intel}/xe_huc_copy.c             |   0
 tests/{xe => intel}/xe_intel_bb.c             |   0
 tests/{xe => intel}/xe_live_ktest.c           |   0
 tests/{xe => intel}/xe_mmap.c                 |   0
 tests/{xe => intel}/xe_mmio.c                 |   0
 tests/{xe => intel}/xe_module_load.c          |   0
 tests/{xe => intel}/xe_noexec_ping_pong.c     |   0
 tests/{xe => intel}/xe_pm.c                   |   0
 tests/{xe => intel}/xe_pm_residency.c         |   0
 tests/{xe => intel}/xe_prime_self_import.c    |   0
 tests/{xe => intel}/xe_query.c                |   0
 tests/{xe => intel}/xe_spin_batch.c           |   0
 tests/{xe => intel}/xe_sysfs_defaults.c       |   0
 tests/{xe => intel}/xe_sysfs_scheduler.c      |   0
 tests/{xe => intel}/xe_sysfs_tile.c           |   0
 tests/{xe => intel}/xe_test_config.json       |   0
 tests/{xe => intel}/xe_uevent.c               |   0
 tests/{xe => intel}/xe_vm.c                   |   0
 tests/{xe => intel}/xe_waitfence.c            |   0
 tests/meson.build                             | 379 +++++++++---------
 224 files changed, 314 insertions(+), 319 deletions(-)
 rename tests/{i915/api_intel_bb.c => intel/i915_api_intel_bb.c} (100%)
 rename tests/{debugfs_test.c => intel/i915_debugfs_test.c} (100%)
 rename tests/{i915/drm_fdinfo.c => intel/i915_drm_fdinfo.c} (100%)
 rename tests/{i915 => intel}/i915_fb_tiling.c (100%)
 rename tests/{i915/gem_bad_reloc.c => intel/i915_gem_bad_reloc.c} (100%)
 rename tests/{i915/gem_barrier_race.c => intel/i915_gem_barrier_race.c} (100%)
 rename tests/{i915/gem_basic.c => intel/i915_gem_basic.c} (100%)
 rename tests/{i915/gem_blits.c => intel/i915_gem_blits.c} (100%)
 rename tests/{i915/gem_busy.c => intel/i915_gem_busy.c} (100%)
 rename tests/{i915/gem_caching.c => intel/i915_gem_caching.c} (100%)
 rename tests/{i915/gem_ccs.c => intel/i915_gem_ccs.c} (100%)
 rename tests/{i915/gem_close.c => intel/i915_gem_close.c} (100%)
 rename tests/{i915/gem_close_race.c => intel/i915_gem_close_race.c} (100%)
 rename tests/{i915/gem_concurrent_all.c => intel/i915_gem_concurrent_all.c} (100%)
 rename tests/{i915/gem_concurrent_blit.c => intel/i915_gem_concurrent_blit.c} (91%)
 rename tests/{i915/gem_create.c => intel/i915_gem_create.c} (100%)
 rename tests/{i915/gem_cs_tlb.c => intel/i915_gem_cs_tlb.c} (100%)
 rename tests/{i915/gem_ctx_bad_destroy.c => intel/i915_gem_ctx_bad_destroy.c} (100%)
 rename tests/{i915/gem_ctx_create.c => intel/i915_gem_ctx_create.c} (100%)
 rename tests/{i915/gem_ctx_engines.c => intel/i915_gem_ctx_engines.c} (100%)
 rename tests/{i915/gem_ctx_exec.c => intel/i915_gem_ctx_exec.c} (100%)
 rename tests/{i915/gem_ctx_freq.c => intel/i915_gem_ctx_freq.c} (100%)
 rename tests/{i915/gem_ctx_isolation.c => intel/i915_gem_ctx_isolation.c} (100%)
 rename tests/{i915/gem_ctx_param.c => intel/i915_gem_ctx_param.c} (100%)
 rename tests/{i915/gem_ctx_persistence.c => intel/i915_gem_ctx_persistence.c} (100%)
 rename tests/{i915/gem_ctx_shared.c => intel/i915_gem_ctx_shared.c} (100%)
 rename tests/{i915/gem_ctx_sseu.c => intel/i915_gem_ctx_sseu.c} (100%)
 rename tests/{i915/gem_ctx_switch.c => intel/i915_gem_ctx_switch.c} (100%)
 rename tests/{i915/gem_eio.c => intel/i915_gem_eio.c} (100%)
 rename tests/{i915/gem_evict_alignment.c => intel/i915_gem_evict_alignment.c} (100%)
 rename tests/{i915/gem_evict_everything.c => intel/i915_gem_evict_everything.c} (100%)
 rename tests/{i915/gem_exec_alignment.c => intel/i915_gem_exec_alignment.c} (100%)
 rename tests/{i915/gem_exec_async.c => intel/i915_gem_exec_async.c} (100%)
 rename tests/{i915/gem_exec_await.c => intel/i915_gem_exec_await.c} (100%)
 rename tests/{i915/gem_exec_balancer.c => intel/i915_gem_exec_balancer.c} (100%)
 rename tests/{i915/gem_exec_basic.c => intel/i915_gem_exec_basic.c} (100%)
 rename tests/{i915/gem_exec_big.c => intel/i915_gem_exec_big.c} (100%)
 rename tests/{i915/gem_exec_capture.c => intel/i915_gem_exec_capture.c} (100%)
 rename tests/{i915/gem_exec_create.c => intel/i915_gem_exec_create.c} (100%)
 rename tests/{i915/gem_exec_endless.c => intel/i915_gem_exec_endless.c} (100%)
 rename tests/{i915/gem_exec_fair.c => intel/i915_gem_exec_fair.c} (100%)
 rename tests/{i915/gem_exec_fence.c => intel/i915_gem_exec_fence.c} (100%)
 rename tests/{i915/gem_exec_flush.c => intel/i915_gem_exec_flush.c} (100%)
 rename tests/{i915/gem_exec_gttfill.c => intel/i915_gem_exec_gttfill.c} (100%)
 rename tests/{i915/gem_exec_latency.c => intel/i915_gem_exec_latency.c} (100%)
 rename tests/{i915/gem_exec_lut_handle.c => intel/i915_gem_exec_lut_handle.c} (100%)
 rename tests/{i915/gem_exec_nop.c => intel/i915_gem_exec_nop.c} (100%)
 rename tests/{i915/gem_exec_parallel.c => intel/i915_gem_exec_parallel.c} (100%)
 rename tests/{i915/gem_exec_params.c => intel/i915_gem_exec_params.c} (100%)
 rename tests/{i915/gem_exec_reloc.c => intel/i915_gem_exec_reloc.c} (100%)
 rename tests/{i915/gem_exec_schedule.c => intel/i915_gem_exec_schedule.c} (100%)
 rename tests/{i915/gem_exec_store.c => intel/i915_gem_exec_store.c} (100%)
 rename tests/{i915/gem_exec_suspend.c => intel/i915_gem_exec_suspend.c} (100%)
 rename tests/{i915/gem_exec_whisper.c => intel/i915_gem_exec_whisper.c} (100%)
 rename tests/{i915/gem_exercise_blt.c => intel/i915_gem_exercise_blt.c} (100%)
 rename tests/{i915/gem_fd_exhaustion.c => intel/i915_gem_fd_exhaustion.c} (100%)
 rename tests/{i915/gem_fence_thrash.c => intel/i915_gem_fence_thrash.c} (100%)
 rename tests/{i915/gem_fence_upload.c => intel/i915_gem_fence_upload.c} (100%)
 rename tests/{i915/gem_fenced_exec_thrash.c => intel/i915_gem_fenced_exec_thrash.c} (100%)
 rename tests/{i915/gem_flink_basic.c => intel/i915_gem_flink_basic.c} (100%)
 rename tests/{i915/gem_flink_race.c => intel/i915_gem_flink_race.c} (100%)
 rename tests/{i915/gem_gpgpu_fill.c => intel/i915_gem_gpgpu_fill.c} (100%)
 rename tests/{i915/gem_gtt_cpu_tlb.c => intel/i915_gem_gtt_cpu_tlb.c} (100%)
 rename tests/{i915/gem_gtt_hog.c => intel/i915_gem_gtt_hog.c} (100%)
 rename tests/{i915/gem_gtt_speed.c => intel/i915_gem_gtt_speed.c} (100%)
 rename tests/{i915/gem_huc_copy.c => intel/i915_gem_huc_copy.c} (100%)
 rename tests/{i915/gem_linear_blits.c => intel/i915_gem_linear_blits.c} (100%)
 rename tests/{i915/gem_lmem_evict.c => intel/i915_gem_lmem_evict.c} (100%)
 rename tests/{i915/gem_lmem_swapping.c => intel/i915_gem_lmem_swapping.c} (100%)
 rename tests/{i915/gem_lut_handle.c => intel/i915_gem_lut_handle.c} (100%)
 rename tests/{i915/gem_madvise.c => intel/i915_gem_madvise.c} (100%)
 rename tests/{i915/gem_media_fill.c => intel/i915_gem_media_fill.c} (100%)
 rename tests/{i915/gem_media_vme.c => intel/i915_gem_media_vme.c} (100%)
 rename tests/{i915/gem_mmap.c => intel/i915_gem_mmap.c} (100%)
 rename tests/{i915/gem_mmap_gtt.c => intel/i915_gem_mmap_gtt.c} (100%)
 rename tests/{i915/gem_mmap_offset.c => intel/i915_gem_mmap_offset.c} (100%)
 rename tests/{i915/gem_mmap_wc.c => intel/i915_gem_mmap_wc.c} (100%)
 rename tests/{i915/gem_partial_pwrite_pread.c => intel/i915_gem_partial_pwrite_pread.c} (100%)
 rename tests/{i915/gem_pipe_control_store_loop.c => intel/i915_gem_pipe_control_store_loop.c} (100%)
 rename tests/{i915/gem_ppgtt.c => intel/i915_gem_ppgtt.c} (100%)
 rename tests/{i915/gem_pread.c => intel/i915_gem_pread.c} (100%)
 rename tests/{i915/gem_pread_after_blit.c => intel/i915_gem_pread_after_blit.c} (100%)
 rename tests/{i915/gem_pwrite.c => intel/i915_gem_pwrite.c} (100%)
 rename tests/{i915/gem_pwrite_snooped.c => intel/i915_gem_pwrite_snooped.c} (100%)
 rename tests/{i915/gem_pxp.c => intel/i915_gem_pxp.c} (100%)
 rename tests/{i915/gem_read_read_speed.c => intel/i915_gem_read_read_speed.c} (100%)
 rename tests/{i915/gem_readwrite.c => intel/i915_gem_readwrite.c} (100%)
 rename tests/{i915/gem_reg_read.c => intel/i915_gem_reg_read.c} (100%)
 rename tests/{i915/gem_render_copy.c => intel/i915_gem_render_copy.c} (100%)
 rename tests/{i915/gem_render_copy_redux.c => intel/i915_gem_render_copy_redux.c} (100%)
 rename tests/{i915/gem_render_linear_blits.c => intel/i915_gem_render_linear_blits.c} (100%)
 rename tests/{i915/gem_render_tiled_blits.c => intel/i915_gem_render_tiled_blits.c} (100%)
 rename tests/{i915/gem_request_retire.c => intel/i915_gem_request_retire.c} (100%)
 rename tests/{i915/gem_reset_stats.c => intel/i915_gem_reset_stats.c} (100%)
 rename tests/{i915/gem_ringfill.c => intel/i915_gem_ringfill.c} (100%)
 rename tests/{i915/gem_set_tiling_vs_blt.c => intel/i915_gem_set_tiling_vs_blt.c} (100%)
 rename tests/{i915/gem_set_tiling_vs_gtt.c => intel/i915_gem_set_tiling_vs_gtt.c} (100%)
 rename tests/{i915/gem_set_tiling_vs_pwrite.c => intel/i915_gem_set_tiling_vs_pwrite.c} (100%)
 rename tests/{i915/gem_shrink.c => intel/i915_gem_shrink.c} (100%)
 rename tests/{i915/gem_softpin.c => intel/i915_gem_softpin.c} (100%)
 rename tests/{i915/gem_spin_batch.c => intel/i915_gem_spin_batch.c} (100%)
 rename tests/{i915/gem_streaming_writes.c => intel/i915_gem_streaming_writes.c} (100%)
 rename tests/{i915/gem_stress.c => intel/i915_gem_stress.c} (100%)
 rename tests/{i915/gem_sync.c => intel/i915_gem_sync.c} (100%)
 rename tests/{i915/gem_tiled_blits.c => intel/i915_gem_tiled_blits.c} (100%)
 rename tests/{i915/gem_tiled_fence_blits.c => intel/i915_gem_tiled_fence_blits.c} (100%)
 rename tests/{i915/gem_tiled_partial_pwrite_pread.c => intel/i915_gem_tiled_partial_pwrite_pread.c} (100%)
 rename tests/{i915/gem_tiled_pread_basic.c => intel/i915_gem_tiled_pread_basic.c} (100%)
 rename tests/{i915/gem_tiled_pread_pwrite.c => intel/i915_gem_tiled_pread_pwrite.c} (100%)
 rename tests/{i915/gem_tiled_swapping.c => intel/i915_gem_tiled_swapping.c} (100%)
 rename tests/{i915/gem_tiled_wb.c => intel/i915_gem_tiled_wb.c} (100%)
 rename tests/{i915/gem_tiled_wc.c => intel/i915_gem_tiled_wc.c} (100%)
 rename tests/{i915/gem_tiling_max_stride.c => intel/i915_gem_tiling_max_stride.c} (100%)
 rename tests/{i915/gem_unfence_active_buffers.c => intel/i915_gem_unfence_active_buffers.c} (100%)
 rename tests/{i915/gem_unref_active_buffers.c => intel/i915_gem_unref_active_buffers.c} (100%)
 rename tests/{i915/gem_userptr_blits.c => intel/i915_gem_userptr_blits.c} (100%)
 rename tests/{i915/gem_vm_create.c => intel/i915_gem_vm_create.c} (100%)
 rename tests/{i915/gem_wait.c => intel/i915_gem_wait.c} (100%)
 rename tests/{i915/gem_watchdog.c => intel/i915_gem_watchdog.c} (100%)
 rename tests/{i915/gem_workarounds.c => intel/i915_gem_workarounds.c} (100%)
 rename tests/{i915/gen3_mixed_blits.c => intel/i915_gen3_mixed_blits.c} (100%)
 rename tests/{i915/gen3_render_linear_blits.c => intel/i915_gen3_render_linear_blits.c} (100%)
 rename tests/{i915/gen3_render_mixed_blits.c => intel/i915_gen3_render_mixed_blits.c} (100%)
 rename tests/{i915/gen3_render_tiledx_blits.c => intel/i915_gen3_render_tiledx_blits.c} (100%)
 rename tests/{i915/gen3_render_tiledy_blits.c => intel/i915_gen3_render_tiledy_blits.c} (100%)
 rename tests/{i915/gen7_exec_parse.c => intel/i915_gen7_exec_parse.c} (100%)
 rename tests/{i915/gen9_exec_parse.c => intel/i915_gen9_exec_parse.c} (100%)
 rename tests/{i915 => intel}/i915_getparams_basic.c (100%)
 rename tests/{i915 => intel}/i915_hangman.c (100%)
 rename tests/{i915 => intel}/i915_hwmon.c (100%)
 rename tests/{i915 => intel}/i915_module_load.c (100%)
 rename tests/{i915 => intel}/i915_pciid.c (100%)
 rename tests/{i915/perf.c => intel/i915_perf.c} (100%)
 rename tests/{i915/perf_pmu.c => intel/i915_perf_pmu.c} (100%)
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
 rename tests/{prime_busy.c => intel/i915_prime_busy.c} (100%)
 rename tests/{prime_mmap.c => intel/i915_prime_mmap.c} (100%)
 rename tests/{prime_mmap_coherency.c => intel/i915_prime_mmap_coherency.c} (100%)
 rename tests/{prime_mmap_kms.c => intel/i915_prime_mmap_kms.c} (96%)
 rename tests/{prime_self_import.c => intel/i915_prime_self_import.c} (100%)
 rename tests/{i915 => intel}/i915_query.c (100%)
 rename tests/{i915 => intel}/i915_selftest.c (100%)
 rename tests/{i915 => intel}/i915_suspend.c (100%)
 rename tests/{i915/sysfs_defaults.c => intel/i915_sysfs_defaults.c} (100%)
 rename tests/{i915/sysfs_heartbeat_interval.c => intel/i915_sysfs_heartbeat_interval.c} (100%)
 rename tests/{i915/sysfs_preempt_timeout.c => intel/i915_sysfs_preempt_timeout.c} (100%)
 rename tests/{i915/sysfs_timeslice_duration.c => intel/i915_sysfs_timeslice_duration.c} (100%)
 rename tests/{i915 => intel}/i915_test_config.json (90%)
 rename tests/{i915/api_intel_allocator.c => intel/intel_api_intel_allocator.c} (100%)
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
 rename tests/{ => intel}/kms_test_config.json (94%)
 rename tests/{xe => intel}/xe_ccs.c (100%)
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
 rename tests/{xe => intel}/xe_exec_store.c (100%)
 rename tests/{xe => intel}/xe_exec_threads.c (100%)
 rename tests/{xe => intel}/xe_exercise_blt.c (100%)
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
 rename tests/{xe => intel}/xe_pm_residency.c (100%)
 rename tests/{xe => intel}/xe_prime_self_import.c (100%)
 rename tests/{xe => intel}/xe_query.c (100%)
 rename tests/{xe => intel}/xe_spin_batch.c (100%)
 rename tests/{xe => intel}/xe_sysfs_defaults.c (100%)
 rename tests/{xe => intel}/xe_sysfs_scheduler.c (100%)
 rename tests/{xe => intel}/xe_sysfs_tile.c (100%)
 rename tests/{xe => intel}/xe_test_config.json (100%)
 rename tests/{xe => intel}/xe_uevent.c (100%)
 rename tests/{xe => intel}/xe_vm.c (100%)
 rename tests/{xe => intel}/xe_waitfence.c (100%)

--
2.40.0
