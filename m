Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B7F610E50B
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Sep 2023 13:31:23 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  5 Sep 2023 18:53:14 +0530
Message-Id: <20230905132316.1666056-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 0/2] Rename all intel specific tests
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

As all intel specific tests got moved to a new directory
"tests/intel", rename all intel specific tests to represent
the supported driver.

Test name should start with the driver_name_ prefix. Below are
the Examples.

 - tests/intel/i915_*.c : All i915 specific tests. Ex: i915_module_load.c
 - tests/intel/intel_*.c: All tests those supports both i915 & XE.
 - tests/intel/kms_*.c  : All kms tests. Ex: kms_psr.c
 - tests/intel/xe_*.c   : All XE specific tests. Ex: xe_module_load.c

Bhanuprakash Modem (2):
  tests/intel: Rename all intel specific tests
  docs/reference/igt: Update IGT reference docs

 README.md                                     |   2 +-
 .../igt-gpu-tools/igt_test_programs.xml       | 102 +++---
 docs/reference/igt-gpu-tools/meson.build      |  14 +-
 tests/feat_profile.json                       |   8 +-
 tests/intel-ci/blacklist-pre-merge.txt        |  14 +-
 tests/intel-ci/blacklist.txt                  | 102 +++---
 tests/intel-ci/fast-feedback.testlist         | 104 +++---
 .../{api_intel_bb.c => i915_api_intel_bb.c}   |   0
 .../{debugfs_test.c => i915_debugfs_test.c}   |   0
 .../intel/{drm_fdinfo.c => i915_drm_fdinfo.c} |   0
 .../{gem_bad_reloc.c => i915_gem_bad_reloc.c} |   0
 ...barrier_race.c => i915_gem_barrier_race.c} |   0
 tests/intel/{gem_basic.c => i915_gem_basic.c} |   0
 tests/intel/{gem_blits.c => i915_gem_blits.c} |   0
 tests/intel/{gem_busy.c => i915_gem_busy.c}   |   0
 .../{gem_caching.c => i915_gem_caching.c}     |   0
 tests/intel/{gem_ccs.c => i915_gem_ccs.c}     |   0
 tests/intel/{gem_close.c => i915_gem_close.c} |   0
 ...gem_close_race.c => i915_gem_close_race.c} |   0
 ...urrent_all.c => i915_gem_concurrent_all.c} |   0
 ...rent_blit.c => i915_gem_concurrent_blit.c} |   2 +-
 .../intel/{gem_create.c => i915_gem_create.c} |   0
 .../intel/{gem_cs_tlb.c => i915_gem_cs_tlb.c} |   0
 ...d_destroy.c => i915_gem_ctx_bad_destroy.c} |   0
 ...gem_ctx_create.c => i915_gem_ctx_create.c} |   0
 ...m_ctx_engines.c => i915_gem_ctx_engines.c} |   0
 .../{gem_ctx_exec.c => i915_gem_ctx_exec.c}   |   0
 .../{gem_ctx_freq.c => i915_gem_ctx_freq.c}   |   0
 ...x_isolation.c => i915_gem_ctx_isolation.c} |   0
 .../{gem_ctx_param.c => i915_gem_ctx_param.c} |   0
 ...rsistence.c => i915_gem_ctx_persistence.c} |   0
 ...gem_ctx_shared.c => i915_gem_ctx_shared.c} |   0
 .../{gem_ctx_sseu.c => i915_gem_ctx_sseu.c}   |   0
 ...gem_ctx_switch.c => i915_gem_ctx_switch.c} |   0
 tests/intel/{gem_eio.c => i915_gem_eio.c}     |   0
 ...alignment.c => i915_gem_evict_alignment.c} |   0
 ...erything.c => i915_gem_evict_everything.c} |   0
 ..._alignment.c => i915_gem_exec_alignment.c} |   0
 ...gem_exec_async.c => i915_gem_exec_async.c} |   0
 ...gem_exec_await.c => i915_gem_exec_await.c} |   0
 ...ec_balancer.c => i915_gem_exec_balancer.c} |   0
 ...gem_exec_basic.c => i915_gem_exec_basic.c} |   0
 .../{gem_exec_big.c => i915_gem_exec_big.c}   |   0
 ...exec_capture.c => i915_gem_exec_capture.c} |   0
 ...m_exec_create.c => i915_gem_exec_create.c} |   0
 ...exec_endless.c => i915_gem_exec_endless.c} |   0
 .../{gem_exec_fair.c => i915_gem_exec_fair.c} |   0
 ...gem_exec_fence.c => i915_gem_exec_fence.c} |   0
 ...gem_exec_flush.c => i915_gem_exec_flush.c} |   0
 ...exec_gttfill.c => i915_gem_exec_gttfill.c} |   0
 ...exec_latency.c => i915_gem_exec_latency.c} |   0
 ...ut_handle.c => i915_gem_exec_lut_handle.c} |   0
 .../{gem_exec_nop.c => i915_gem_exec_nop.c}   |   0
 ...ec_parallel.c => i915_gem_exec_parallel.c} |   0
 ...m_exec_params.c => i915_gem_exec_params.c} |   0
 ...gem_exec_reloc.c => i915_gem_exec_reloc.c} |   0
 ...ec_schedule.c => i915_gem_exec_schedule.c} |   0
 ...gem_exec_store.c => i915_gem_exec_store.c} |   0
 ...exec_suspend.c => i915_gem_exec_suspend.c} |   0
 ...exec_whisper.c => i915_gem_exec_whisper.c} |   0
 ...exercise_blt.c => i915_gem_exercise_blt.c} |   0
 ..._exhaustion.c => i915_gem_fd_exhaustion.c} |   0
 ...fence_thrash.c => i915_gem_fence_thrash.c} |   0
 ...fence_upload.c => i915_gem_fence_upload.c} |   0
 ...thrash.c => i915_gem_fenced_exec_thrash.c} |   0
 ...m_flink_basic.c => i915_gem_flink_basic.c} |   0
 ...gem_flink_race.c => i915_gem_flink_race.c} |   0
 ...gem_gpgpu_fill.c => i915_gem_gpgpu_fill.c} |   0
 ...m_gtt_cpu_tlb.c => i915_gem_gtt_cpu_tlb.c} |   0
 .../{gem_gtt_hog.c => i915_gem_gtt_hog.c}     |   0
 .../{gem_gtt_speed.c => i915_gem_gtt_speed.c} |   0
 .../{gem_huc_copy.c => i915_gem_huc_copy.c}   |   0
 ...linear_blits.c => i915_gem_linear_blits.c} |   0
 ...gem_lmem_evict.c => i915_gem_lmem_evict.c} |   0
 ...em_swapping.c => i915_gem_lmem_swapping.c} |   0
 ...gem_lut_handle.c => i915_gem_lut_handle.c} |   0
 .../{gem_madvise.c => i915_gem_madvise.c}     |   0
 ...gem_media_fill.c => i915_gem_media_fill.c} |   0
 .../{gem_media_vme.c => i915_gem_media_vme.c} |   0
 tests/intel/{gem_mmap.c => i915_gem_mmap.c}   |   0
 .../{gem_mmap_gtt.c => i915_gem_mmap_gtt.c}   |   0
 ...m_mmap_offset.c => i915_gem_mmap_offset.c} |   0
 .../{gem_mmap_wc.c => i915_gem_mmap_wc.c}     |   0
 ...read.c => i915_gem_partial_pwrite_pread.c} |   0
 ...p.c => i915_gem_pipe_control_store_loop.c} |   0
 tests/intel/{gem_ppgtt.c => i915_gem_ppgtt.c} |   0
 tests/intel/{gem_pread.c => i915_gem_pread.c} |   0
 ...ter_blit.c => i915_gem_pread_after_blit.c} |   0
 .../intel/{gem_pwrite.c => i915_gem_pwrite.c} |   0
 ...te_snooped.c => i915_gem_pwrite_snooped.c} |   0
 tests/intel/{gem_pxp.c => i915_gem_pxp.c}     |   0
 ...ead_speed.c => i915_gem_read_read_speed.c} |   0
 .../{gem_readwrite.c => i915_gem_readwrite.c} |   0
 .../{gem_reg_read.c => i915_gem_reg_read.c}   |   0
 ...m_render_copy.c => i915_gem_render_copy.c} |   0
 ...y_redux.c => i915_gem_render_copy_redux.c} |   0
 ...blits.c => i915_gem_render_linear_blits.c} |   0
 ..._blits.c => i915_gem_render_tiled_blits.c} |   0
 ...est_retire.c => i915_gem_request_retire.c} |   0
 ...m_reset_stats.c => i915_gem_reset_stats.c} |   0
 .../{gem_ringfill.c => i915_gem_ringfill.c}   |   0
 ..._vs_blt.c => i915_gem_set_tiling_vs_blt.c} |   0
 ..._vs_gtt.c => i915_gem_set_tiling_vs_gtt.c} |   0
 ...rite.c => i915_gem_set_tiling_vs_pwrite.c} |   0
 .../intel/{gem_shrink.c => i915_gem_shrink.c} |   0
 .../{gem_softpin.c => i915_gem_softpin.c}     |   0
 ...gem_spin_batch.c => i915_gem_spin_batch.c} |   0
 ...g_writes.c => i915_gem_streaming_writes.c} |   0
 .../intel/{gem_stress.c => i915_gem_stress.c} |   0
 tests/intel/{gem_sync.c => i915_gem_sync.c}   |   0
 ...m_tiled_blits.c => i915_gem_tiled_blits.c} |   0
 ...e_blits.c => i915_gem_tiled_fence_blits.c} |   0
 ... => i915_gem_tiled_partial_pwrite_pread.c} |   0
 ...d_basic.c => i915_gem_tiled_pread_basic.c} |   0
 ...pwrite.c => i915_gem_tiled_pread_pwrite.c} |   0
 ...d_swapping.c => i915_gem_tiled_swapping.c} |   0
 .../{gem_tiled_wb.c => i915_gem_tiled_wb.c}   |   0
 .../{gem_tiled_wc.c => i915_gem_tiled_wc.c}   |   0
 ..._stride.c => i915_gem_tiling_max_stride.c} |   0
 ...rs.c => i915_gem_unfence_active_buffers.c} |   0
 ...fers.c => i915_gem_unref_active_buffers.c} |   0
 ...erptr_blits.c => i915_gem_userptr_blits.c} |   0
 .../{gem_vm_create.c => i915_gem_vm_create.c} |   0
 tests/intel/{gem_wait.c => i915_gem_wait.c}   |   0
 .../{gem_watchdog.c => i915_gem_watchdog.c}   |   0
 ...m_workarounds.c => i915_gem_workarounds.c} |   0
 ..._mixed_blits.c => i915_gen3_mixed_blits.c} |   0
 ...lits.c => i915_gen3_render_linear_blits.c} |   0
 ...blits.c => i915_gen3_render_mixed_blits.c} |   0
 ...lits.c => i915_gen3_render_tiledx_blits.c} |   0
 ...lits.c => i915_gen3_render_tiledy_blits.c} |   0
 ...n7_exec_parse.c => i915_gen7_exec_parse.c} |   0
 ...n9_exec_parse.c => i915_gen9_exec_parse.c} |   0
 tests/intel/{perf.c => i915_perf.c}           |   0
 tests/intel/{perf_pmu.c => i915_perf_pmu.c}   |   0
 .../intel/{prime_busy.c => i915_prime_busy.c} |   0
 .../intel/{prime_mmap.c => i915_prime_mmap.c} |   0
 ...oherency.c => i915_prime_mmap_coherency.c} |   0
 ...prime_mmap_kms.c => i915_prime_mmap_kms.c} |   0
 ...self_import.c => i915_prime_self_import.c} |   0
 ...sysfs_defaults.c => i915_sysfs_defaults.c} |   0
 ...rval.c => i915_sysfs_heartbeat_interval.c} |   0
 ...timeout.c => i915_sysfs_preempt_timeout.c} |   0
 ...tion.c => i915_sysfs_timeslice_duration.c} |   0
 tests/intel/i915_test_config.json             |   8 +-
 ...llocator.c => intel_api_intel_allocator.c} |   0
 tests/meson.build                             | 308 +++++++++---------
 147 files changed, 341 insertions(+), 323 deletions(-)
 rename tests/intel/{api_intel_bb.c => i915_api_intel_bb.c} (100%)
 rename tests/intel/{debugfs_test.c => i915_debugfs_test.c} (100%)
 rename tests/intel/{drm_fdinfo.c => i915_drm_fdinfo.c} (100%)
 rename tests/intel/{gem_bad_reloc.c => i915_gem_bad_reloc.c} (100%)
 rename tests/intel/{gem_barrier_race.c => i915_gem_barrier_race.c} (100%)
 rename tests/intel/{gem_basic.c => i915_gem_basic.c} (100%)
 rename tests/intel/{gem_blits.c => i915_gem_blits.c} (100%)
 rename tests/intel/{gem_busy.c => i915_gem_busy.c} (100%)
 rename tests/intel/{gem_caching.c => i915_gem_caching.c} (100%)
 rename tests/intel/{gem_ccs.c => i915_gem_ccs.c} (100%)
 rename tests/intel/{gem_close.c => i915_gem_close.c} (100%)
 rename tests/intel/{gem_close_race.c => i915_gem_close_race.c} (100%)
 rename tests/intel/{gem_concurrent_all.c => i915_gem_concurrent_all.c} (100%)
 rename tests/intel/{gem_concurrent_blit.c => i915_gem_concurrent_blit.c} (91%)
 rename tests/intel/{gem_create.c => i915_gem_create.c} (100%)
 rename tests/intel/{gem_cs_tlb.c => i915_gem_cs_tlb.c} (100%)
 rename tests/intel/{gem_ctx_bad_destroy.c => i915_gem_ctx_bad_destroy.c} (100%)
 rename tests/intel/{gem_ctx_create.c => i915_gem_ctx_create.c} (100%)
 rename tests/intel/{gem_ctx_engines.c => i915_gem_ctx_engines.c} (100%)
 rename tests/intel/{gem_ctx_exec.c => i915_gem_ctx_exec.c} (100%)
 rename tests/intel/{gem_ctx_freq.c => i915_gem_ctx_freq.c} (100%)
 rename tests/intel/{gem_ctx_isolation.c => i915_gem_ctx_isolation.c} (100%)
 rename tests/intel/{gem_ctx_param.c => i915_gem_ctx_param.c} (100%)
 rename tests/intel/{gem_ctx_persistence.c => i915_gem_ctx_persistence.c} (100%)
 rename tests/intel/{gem_ctx_shared.c => i915_gem_ctx_shared.c} (100%)
 rename tests/intel/{gem_ctx_sseu.c => i915_gem_ctx_sseu.c} (100%)
 rename tests/intel/{gem_ctx_switch.c => i915_gem_ctx_switch.c} (100%)
 rename tests/intel/{gem_eio.c => i915_gem_eio.c} (100%)
 rename tests/intel/{gem_evict_alignment.c => i915_gem_evict_alignment.c} (100%)
 rename tests/intel/{gem_evict_everything.c => i915_gem_evict_everything.c} (100%)
 rename tests/intel/{gem_exec_alignment.c => i915_gem_exec_alignment.c} (100%)
 rename tests/intel/{gem_exec_async.c => i915_gem_exec_async.c} (100%)
 rename tests/intel/{gem_exec_await.c => i915_gem_exec_await.c} (100%)
 rename tests/intel/{gem_exec_balancer.c => i915_gem_exec_balancer.c} (100%)
 rename tests/intel/{gem_exec_basic.c => i915_gem_exec_basic.c} (100%)
 rename tests/intel/{gem_exec_big.c => i915_gem_exec_big.c} (100%)
 rename tests/intel/{gem_exec_capture.c => i915_gem_exec_capture.c} (100%)
 rename tests/intel/{gem_exec_create.c => i915_gem_exec_create.c} (100%)
 rename tests/intel/{gem_exec_endless.c => i915_gem_exec_endless.c} (100%)
 rename tests/intel/{gem_exec_fair.c => i915_gem_exec_fair.c} (100%)
 rename tests/intel/{gem_exec_fence.c => i915_gem_exec_fence.c} (100%)
 rename tests/intel/{gem_exec_flush.c => i915_gem_exec_flush.c} (100%)
 rename tests/intel/{gem_exec_gttfill.c => i915_gem_exec_gttfill.c} (100%)
 rename tests/intel/{gem_exec_latency.c => i915_gem_exec_latency.c} (100%)
 rename tests/intel/{gem_exec_lut_handle.c => i915_gem_exec_lut_handle.c} (100%)
 rename tests/intel/{gem_exec_nop.c => i915_gem_exec_nop.c} (100%)
 rename tests/intel/{gem_exec_parallel.c => i915_gem_exec_parallel.c} (100%)
 rename tests/intel/{gem_exec_params.c => i915_gem_exec_params.c} (100%)
 rename tests/intel/{gem_exec_reloc.c => i915_gem_exec_reloc.c} (100%)
 rename tests/intel/{gem_exec_schedule.c => i915_gem_exec_schedule.c} (100%)
 rename tests/intel/{gem_exec_store.c => i915_gem_exec_store.c} (100%)
 rename tests/intel/{gem_exec_suspend.c => i915_gem_exec_suspend.c} (100%)
 rename tests/intel/{gem_exec_whisper.c => i915_gem_exec_whisper.c} (100%)
 rename tests/intel/{gem_exercise_blt.c => i915_gem_exercise_blt.c} (100%)
 rename tests/intel/{gem_fd_exhaustion.c => i915_gem_fd_exhaustion.c} (100%)
 rename tests/intel/{gem_fence_thrash.c => i915_gem_fence_thrash.c} (100%)
 rename tests/intel/{gem_fence_upload.c => i915_gem_fence_upload.c} (100%)
 rename tests/intel/{gem_fenced_exec_thrash.c => i915_gem_fenced_exec_thrash.c} (100%)
 rename tests/intel/{gem_flink_basic.c => i915_gem_flink_basic.c} (100%)
 rename tests/intel/{gem_flink_race.c => i915_gem_flink_race.c} (100%)
 rename tests/intel/{gem_gpgpu_fill.c => i915_gem_gpgpu_fill.c} (100%)
 rename tests/intel/{gem_gtt_cpu_tlb.c => i915_gem_gtt_cpu_tlb.c} (100%)
 rename tests/intel/{gem_gtt_hog.c => i915_gem_gtt_hog.c} (100%)
 rename tests/intel/{gem_gtt_speed.c => i915_gem_gtt_speed.c} (100%)
 rename tests/intel/{gem_huc_copy.c => i915_gem_huc_copy.c} (100%)
 rename tests/intel/{gem_linear_blits.c => i915_gem_linear_blits.c} (100%)
 rename tests/intel/{gem_lmem_evict.c => i915_gem_lmem_evict.c} (100%)
 rename tests/intel/{gem_lmem_swapping.c => i915_gem_lmem_swapping.c} (100%)
 rename tests/intel/{gem_lut_handle.c => i915_gem_lut_handle.c} (100%)
 rename tests/intel/{gem_madvise.c => i915_gem_madvise.c} (100%)
 rename tests/intel/{gem_media_fill.c => i915_gem_media_fill.c} (100%)
 rename tests/intel/{gem_media_vme.c => i915_gem_media_vme.c} (100%)
 rename tests/intel/{gem_mmap.c => i915_gem_mmap.c} (100%)
 rename tests/intel/{gem_mmap_gtt.c => i915_gem_mmap_gtt.c} (100%)
 rename tests/intel/{gem_mmap_offset.c => i915_gem_mmap_offset.c} (100%)
 rename tests/intel/{gem_mmap_wc.c => i915_gem_mmap_wc.c} (100%)
 rename tests/intel/{gem_partial_pwrite_pread.c => i915_gem_partial_pwrite_pread.c} (100%)
 rename tests/intel/{gem_pipe_control_store_loop.c => i915_gem_pipe_control_store_loop.c} (100%)
 rename tests/intel/{gem_ppgtt.c => i915_gem_ppgtt.c} (100%)
 rename tests/intel/{gem_pread.c => i915_gem_pread.c} (100%)
 rename tests/intel/{gem_pread_after_blit.c => i915_gem_pread_after_blit.c} (100%)
 rename tests/intel/{gem_pwrite.c => i915_gem_pwrite.c} (100%)
 rename tests/intel/{gem_pwrite_snooped.c => i915_gem_pwrite_snooped.c} (100%)
 rename tests/intel/{gem_pxp.c => i915_gem_pxp.c} (100%)
 rename tests/intel/{gem_read_read_speed.c => i915_gem_read_read_speed.c} (100%)
 rename tests/intel/{gem_readwrite.c => i915_gem_readwrite.c} (100%)
 rename tests/intel/{gem_reg_read.c => i915_gem_reg_read.c} (100%)
 rename tests/intel/{gem_render_copy.c => i915_gem_render_copy.c} (100%)
 rename tests/intel/{gem_render_copy_redux.c => i915_gem_render_copy_redux.c} (100%)
 rename tests/intel/{gem_render_linear_blits.c => i915_gem_render_linear_blits.c} (100%)
 rename tests/intel/{gem_render_tiled_blits.c => i915_gem_render_tiled_blits.c} (100%)
 rename tests/intel/{gem_request_retire.c => i915_gem_request_retire.c} (100%)
 rename tests/intel/{gem_reset_stats.c => i915_gem_reset_stats.c} (100%)
 rename tests/intel/{gem_ringfill.c => i915_gem_ringfill.c} (100%)
 rename tests/intel/{gem_set_tiling_vs_blt.c => i915_gem_set_tiling_vs_blt.c} (100%)
 rename tests/intel/{gem_set_tiling_vs_gtt.c => i915_gem_set_tiling_vs_gtt.c} (100%)
 rename tests/intel/{gem_set_tiling_vs_pwrite.c => i915_gem_set_tiling_vs_pwrite.c} (100%)
 rename tests/intel/{gem_shrink.c => i915_gem_shrink.c} (100%)
 rename tests/intel/{gem_softpin.c => i915_gem_softpin.c} (100%)
 rename tests/intel/{gem_spin_batch.c => i915_gem_spin_batch.c} (100%)
 rename tests/intel/{gem_streaming_writes.c => i915_gem_streaming_writes.c} (100%)
 rename tests/intel/{gem_stress.c => i915_gem_stress.c} (100%)
 rename tests/intel/{gem_sync.c => i915_gem_sync.c} (100%)
 rename tests/intel/{gem_tiled_blits.c => i915_gem_tiled_blits.c} (100%)
 rename tests/intel/{gem_tiled_fence_blits.c => i915_gem_tiled_fence_blits.c} (100%)
 rename tests/intel/{gem_tiled_partial_pwrite_pread.c => i915_gem_tiled_partial_pwrite_pread.c} (100%)
 rename tests/intel/{gem_tiled_pread_basic.c => i915_gem_tiled_pread_basic.c} (100%)
 rename tests/intel/{gem_tiled_pread_pwrite.c => i915_gem_tiled_pread_pwrite.c} (100%)
 rename tests/intel/{gem_tiled_swapping.c => i915_gem_tiled_swapping.c} (100%)
 rename tests/intel/{gem_tiled_wb.c => i915_gem_tiled_wb.c} (100%)
 rename tests/intel/{gem_tiled_wc.c => i915_gem_tiled_wc.c} (100%)
 rename tests/intel/{gem_tiling_max_stride.c => i915_gem_tiling_max_stride.c} (100%)
 rename tests/intel/{gem_unfence_active_buffers.c => i915_gem_unfence_active_buffers.c} (100%)
 rename tests/intel/{gem_unref_active_buffers.c => i915_gem_unref_active_buffers.c} (100%)
 rename tests/intel/{gem_userptr_blits.c => i915_gem_userptr_blits.c} (100%)
 rename tests/intel/{gem_vm_create.c => i915_gem_vm_create.c} (100%)
 rename tests/intel/{gem_wait.c => i915_gem_wait.c} (100%)
 rename tests/intel/{gem_watchdog.c => i915_gem_watchdog.c} (100%)
 rename tests/intel/{gem_workarounds.c => i915_gem_workarounds.c} (100%)
 rename tests/intel/{gen3_mixed_blits.c => i915_gen3_mixed_blits.c} (100%)
 rename tests/intel/{gen3_render_linear_blits.c => i915_gen3_render_linear_blits.c} (100%)
 rename tests/intel/{gen3_render_mixed_blits.c => i915_gen3_render_mixed_blits.c} (100%)
 rename tests/intel/{gen3_render_tiledx_blits.c => i915_gen3_render_tiledx_blits.c} (100%)
 rename tests/intel/{gen3_render_tiledy_blits.c => i915_gen3_render_tiledy_blits.c} (100%)
 rename tests/intel/{gen7_exec_parse.c => i915_gen7_exec_parse.c} (100%)
 rename tests/intel/{gen9_exec_parse.c => i915_gen9_exec_parse.c} (100%)
 rename tests/intel/{perf.c => i915_perf.c} (100%)
 rename tests/intel/{perf_pmu.c => i915_perf_pmu.c} (100%)
 rename tests/intel/{prime_busy.c => i915_prime_busy.c} (100%)
 rename tests/intel/{prime_mmap.c => i915_prime_mmap.c} (100%)
 rename tests/intel/{prime_mmap_coherency.c => i915_prime_mmap_coherency.c} (100%)
 rename tests/intel/{prime_mmap_kms.c => i915_prime_mmap_kms.c} (100%)
 rename tests/intel/{prime_self_import.c => i915_prime_self_import.c} (100%)
 rename tests/intel/{sysfs_defaults.c => i915_sysfs_defaults.c} (100%)
 rename tests/intel/{sysfs_heartbeat_interval.c => i915_sysfs_heartbeat_interval.c} (100%)
 rename tests/intel/{sysfs_preempt_timeout.c => i915_sysfs_preempt_timeout.c} (100%)
 rename tests/intel/{sysfs_timeslice_duration.c => i915_sysfs_timeslice_duration.c} (100%)
 rename tests/intel/{api_intel_allocator.c => intel_api_intel_allocator.c} (100%)

--
2.40.0
