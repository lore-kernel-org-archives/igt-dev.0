Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A493E10E20E
 for <igt-dev@lists.freedesktop.org>; Wed,  3 May 2023 08:44:13 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Wed,  3 May 2023 14:09:07 +0530
Message-Id: <20230503083907.2794598-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20230503083907.2794598-1-bhanuprakash.modem@intel.com>
References: <20230503083907.2794598-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 2/2] tests: Rename tests to represent the driver
 name
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com, mchehab@kernel.org
List-ID: <igt-dev@lists.freedesktop.org>

Rename all intel specific tests to represent the supported driver. Test
name should start with the driver_name prefix. Below are the Examples.

- tests/intel/i915_*.c : All i915 specific tests. Ex: i915_module_load.c
- tests/intel/xe_*.c   : All XE specific tests. Ex: xe_module_load.c
- tests/intel/kms_*.c  : All kms tests. Ex: kms_psr.c
- tests/intel/intel_*.c: All tests those supports both i915 & XE.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 README.md                                     |   2 +-
 tests/intel-ci/blacklist-pre-merge.txt        |  14 +-
 tests/intel-ci/blacklist.txt                  | 102 +++---
 tests/intel-ci/fast-feedback.testlist         |  92 +++---
 ...allocator.c => i915_api_intel_allocator.c} |   0
 .../{api_intel_bb.c => i915_api_intel_bb.c}   |   0
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
 ...sysfs_defaults.c => i915_sysfs_defaults.c} |   0
 ...rval.c => i915_sysfs_heartbeat_interval.c} |   0
 ...timeout.c => i915_sysfs_preempt_timeout.c} |   0
 ...tion.c => i915_sysfs_timeslice_duration.c} |   0
 tests/meson.build                             | 304 +++++++++---------
 137 files changed, 258 insertions(+), 258 deletions(-)
 rename tests/intel/{api_intel_allocator.c => i915_api_intel_allocator.c} (100%)
 rename tests/intel/{api_intel_bb.c => i915_api_intel_bb.c} (100%)
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
 rename tests/intel/{sysfs_defaults.c => i915_sysfs_defaults.c} (100%)
 rename tests/intel/{sysfs_heartbeat_interval.c => i915_sysfs_heartbeat_interval.c} (100%)
 rename tests/intel/{sysfs_preempt_timeout.c => i915_sysfs_preempt_timeout.c} (100%)
 rename tests/intel/{sysfs_timeslice_duration.c => i915_sysfs_timeslice_duration.c} (100%)

diff --git a/README.md b/README.md
index 66f2bc0fa..9e2c8173b 100644
--- a/README.md
+++ b/README.md
@@ -124,7 +124,7 @@ The benchmarks require KMS to be enabled.  When run with an X Server
 running, they must be run as root to avoid the authentication
 requirement.
 
-Note that a few other microbenchmarks are in tests (e.g. `gem_gtt_speed`).
+Note that a few other microbenchmarks are in tests (e.g. `i915_gem_gtt_speed`).
 
 ### `tools/`
 
diff --git a/tests/intel-ci/blacklist-pre-merge.txt b/tests/intel-ci/blacklist-pre-merge.txt
index d4e5ef66e..b747bdf42 100644
--- a/tests/intel-ci/blacklist-pre-merge.txt
+++ b/tests/intel-ci/blacklist-pre-merge.txt
@@ -37,7 +37,7 @@ igt@i915_pm_rpm@universal-planes(-dpms)?
 #
 # Data acquired on 2020-02-19 by Martin Peres
 ###############################################################################
-igt@gem_pwrite@big-.*
+igt@i915_gem_pwrite@big-.*
 
 
 ###############################################################################
@@ -46,7 +46,7 @@ igt@gem_pwrite@big-.*
 # outside of drm_mm and i915_gem_execbuffer, for which the authors assure us
 # that they are making deliberate and well tested changes.
 ###############################################################################
-igt@gem_exec_alignment@.*
+igt@i915_gem_exec_alignment@.*
 
 
 ###############################################################################
@@ -85,11 +85,11 @@ igt@i915_pm_rpm@debugfs-read
 #
 # Data acquired on 2020-02-20 by Martin Peres
 ###############################################################################
-igt@gem_fence_thrash@bo-write-verify-threaded-[xy]
-igt@gem_tiled_blits@interruptible
-igt@gem_tiled_fence_blits@normal
-igt@gem_tiled_blits@normal
-igt@gem_tiled_wc
+igt@i915_gem_fence_thrash@bo-write-verify-threaded-[xy]
+igt@i915_gem_tiled_blits@interruptible
+igt@i915_gem_tiled_fence_blits@normal
+igt@i915_gem_tiled_blits@normal
+igt@i915_gem_tiled_wc
 
 
 ###############################################################################
diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index e13759d3e..62996c2c7 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -18,56 +18,56 @@ igt@i915_pm_rpm@gem-execbuf-stress-extra-wait
 ###############################################
 # GEM
 ###############################################
-igt@gem_busy@hang.*
-igt@gem_close_race@(?!.*basic).*
-igt@gem_concurrent_blit(@.*)?
-igt@gem_ctx_create@(?!.*basic).*
-igt@gem_ctx_exec@(?!.*basic).*
-igt@gem_ctx_shared@*exhaust*
-igt@gem_ctx_switch(@.*)?
-igt@gem_evict_alignment(@.*)?
-igt@gem_evict_everything(@.*)?
-igt@gem_exec_big@(?!.*single).*
-igt@gem_exec_capture@many-(?!4K-).*
-igt@gem_exec_fair@(?!.*basic).*
-igt@gem_exec_fence@.*hang.*
-igt@gem_exec_flush@(?!.*basic).*
-igt@gem_exec_latency(@.*)?
-igt@gem_exec_lut_handle(@.*)?
-igt@gem_exec_nop@(?!.*basic).*
-igt@gem_exec_reloc@(?!.*basic).*
-igt@gem_exec_suspend@(?!.*basic).*
-igt@gem_exec_whisper@(?!basic).*
-igt@gem_fd_exhaustion(@.*)?
-igt@gem_fence_upload(@.*)?
-igt@gem_gtt_hog(@.*)?
-igt@gem_gtt_speed(@.*)?
-igt@gem_lut_handle(@.*)?
-igt@gem_mmap_gtt@.*(huge|swap|clflush|forked).*
-igt@gem_mmap@.*(swap|huge).*
-igt@gem_pread_after_blit(@.*)?
-igt@gem_pwrite@(?!.*basic).*
-igt@gem_read_read_speed(@.*)?
-igt@gem_render_linear_blits@(?!.*basic).*
-igt@gem_render_tiled_blits@(?!.*basic).*
-igt@gem_reset_stats(@.*)?
-igt@gem_ringfill@(?!.*basic).*
-igt@gem_shrink@(?!reclaim$).*
-igt@gem_softpin@.*(hang|S4).*
-igt@gem_streaming_writes(@.*)?
-igt@gem_sync@(?!.*basic).*
-igt@gem_tiled_swapping@(?!non-threaded).*
-igt@gem_userptr_blits@(major|minor|forked|mlocked|swapping).*
-igt@gem_wait@hang.*
-igt@gem_watchdog@far-fence
-igt@sysfs_heartbeat_interval@(long|off)
-igt@sysfs_preempt_timeout@off
-igt@sysfs_timeslice_duration@off
+igt@i915_gem_busy@hang.*
+igt@i915_gem_close_race@(?!.*basic).*
+igt@i915_gem_concurrent_blit(@.*)?
+igt@i915_gem_ctx_create@(?!.*basic).*
+igt@i915_gem_ctx_exec@(?!.*basic).*
+igt@i915_gem_ctx_shared@*exhaust*
+igt@i915_gem_ctx_switch(@.*)?
+igt@i915_gem_evict_alignment(@.*)?
+igt@i915_gem_evict_everything(@.*)?
+igt@i915_gem_exec_big@(?!.*single).*
+igt@i915_gem_exec_capture@many-(?!4K-).*
+igt@i915_gem_exec_fair@(?!.*basic).*
+igt@i915_gem_exec_fence@.*hang.*
+igt@i915_gem_exec_flush@(?!.*basic).*
+igt@i915_gem_exec_latency(@.*)?
+igt@i915_gem_exec_lut_handle(@.*)?
+igt@i915_gem_exec_nop@(?!.*basic).*
+igt@i915_gem_exec_reloc@(?!.*basic).*
+igt@i915_gem_exec_suspend@(?!.*basic).*
+igt@i915_gem_exec_whisper@(?!basic).*
+igt@i915_gem_fd_exhaustion(@.*)?
+igt@i915_gem_fence_upload(@.*)?
+igt@i915_gem_gtt_hog(@.*)?
+igt@i915_gem_gtt_speed(@.*)?
+igt@i915_gem_lut_handle(@.*)?
+igt@i915_gem_mmap_gtt@.*(huge|swap|clflush|forked).*
+igt@i915_gem_mmap@.*(swap|huge).*
+igt@i915_gem_pread_after_blit(@.*)?
+igt@i915_gem_pwrite@(?!.*basic).*
+igt@i915_gem_read_read_speed(@.*)?
+igt@i915_gem_render_linear_blits@(?!.*basic).*
+igt@i915_gem_render_tiled_blits@(?!.*basic).*
+igt@i915_gem_reset_stats(@.*)?
+igt@i915_gem_ringfill@(?!.*basic).*
+igt@i915_gem_shrink@(?!reclaim$).*
+igt@i915_gem_softpin@.*(hang|S4).*
+igt@i915_gem_streaming_writes(@.*)?
+igt@i915_gem_sync@(?!.*basic).*
+igt@i915_gem_tiled_swapping@(?!non-threaded).*
+igt@i915_gem_userptr_blits@(major|minor|forked|mlocked|swapping).*
+igt@i915_gem_wait@hang.*
+igt@i915_gem_watchdog@far-fence
+igt@i915_sysfs_heartbeat_interval@(long|off)
+igt@i915_sysfs_preempt_timeout@off
+igt@i915_sysfs_timeslice_duration@off
 ###############################################
 # GEM: Not worth fixing
 ###############################################
-igt@gen7_exec_parse@.*lri.*
-igt@gem_exec_alignment@pi-shared
+igt@i915_gen7_exec_parse@.*lri.*
+igt@i915_gem_exec_alignment@pi-shared
 ###############################################
 # There are no DRRS capable displays in CI lab
 ###############################################
@@ -108,10 +108,10 @@ igt@msm_.*
 # Hibernate: not configured correctly on CI
 ###############################################
 igt@.*@.*-hibernate
-igt@gem_softpin@noreloc-s4
-igt@gem_workarounds@hibernate-.*
-igt@gem_exec_suspend@basic-s4$
-igt@gem_ctx_isolation@.*-s4
+igt@i915_gem_softpin@noreloc-s4
+igt@i915_gem_workarounds@hibernate-.*
+igt@i915_gem_exec_suspend@basic-s4$
+igt@i915_gem_ctx_isolation@.*-s4
 ###############################################
 # Out-of-memory: spammy and often broken
 ###############################################
diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index d9fcb62d6..93061165d 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -10,46 +10,46 @@ igt@fbdev@info
 igt@fbdev@nullptr
 igt@fbdev@read
 igt@fbdev@write
-igt@gem_basic@bad-close
-igt@gem_basic@create-close
-igt@gem_basic@create-fd-close
-igt@gem_busy@busy@all-engines
-igt@gem_close_race@basic-process
-igt@gem_close_race@basic-threads
-igt@gem_ctx_create@basic
-igt@gem_ctx_create@basic-files
-igt@gem_ctx_exec@basic
-igt@gem_exec_basic@basic
-igt@gem_exec_create@basic
-igt@gem_exec_fence@basic-busy
-igt@gem_exec_fence@basic-wait
-igt@gem_exec_fence@basic-await
-igt@gem_exec_fence@nb-await
-igt@gem_exec_gttfill@basic
-igt@gem_exec_parallel@engines
-igt@gem_exec_store@basic
-igt@gem_flink_basic@bad-flink
-igt@gem_flink_basic@bad-open
-igt@gem_flink_basic@basic
-igt@gem_flink_basic@double-flink
-igt@gem_flink_basic@flink-lifetime
-igt@gem_huc_copy@huc-copy
-igt@gem_linear_blits@basic
-igt@gem_mmap@basic
-igt@gem_mmap_gtt@basic
-igt@gem_render_linear_blits@basic
-igt@gem_render_tiled_blits@basic
-igt@gem_ringfill@basic-all
-igt@gem_softpin@allocator-basic
-igt@gem_softpin@allocator-basic-reserve
-igt@gem_softpin@safe-alignment
-igt@gem_sync@basic-all
-igt@gem_sync@basic-each
-igt@gem_tiled_blits@basic
-igt@gem_tiled_fence_blits@basic
-igt@gem_tiled_pread_basic
-igt@gem_wait@busy@all-engines
-igt@gem_wait@wait@all-engines
+igt@i915_gem_basic@bad-close
+igt@i915_gem_basic@create-close
+igt@i915_gem_basic@create-fd-close
+igt@i915_gem_busy@busy@all-engines
+igt@i915_gem_close_race@basic-process
+igt@i915_gem_close_race@basic-threads
+igt@i915_gem_ctx_create@basic
+igt@i915_gem_ctx_create@basic-files
+igt@i915_gem_ctx_exec@basic
+igt@i915_gem_exec_basic@basic
+igt@i915_gem_exec_create@basic
+igt@i915_gem_exec_fence@basic-busy
+igt@i915_gem_exec_fence@basic-wait
+igt@i915_gem_exec_fence@basic-await
+igt@i915_gem_exec_fence@nb-await
+igt@i915_gem_exec_gttfill@basic
+igt@i915_gem_exec_parallel@engines
+igt@i915_gem_exec_store@basic
+igt@i915_gem_flink_basic@bad-flink
+igt@i915_gem_flink_basic@bad-open
+igt@i915_gem_flink_basic@basic
+igt@i915_gem_flink_basic@double-flink
+igt@i915_gem_flink_basic@flink-lifetime
+igt@i915_gem_huc_copy@huc-copy
+igt@i915_gem_linear_blits@basic
+igt@i915_gem_mmap@basic
+igt@i915_gem_mmap_gtt@basic
+igt@i915_gem_render_linear_blits@basic
+igt@i915_gem_render_tiled_blits@basic
+igt@i915_gem_ringfill@basic-all
+igt@i915_gem_softpin@allocator-basic
+igt@i915_gem_softpin@allocator-basic-reserve
+igt@i915_gem_softpin@safe-alignment
+igt@i915_gem_sync@basic-all
+igt@i915_gem_sync@basic-each
+igt@i915_gem_tiled_blits@basic
+igt@i915_gem_tiled_fence_blits@basic
+igt@i915_gem_tiled_pread_basic
+igt@i915_gem_wait@busy@all-engines
+igt@i915_gem_wait@wait@all-engines
 igt@i915_getparams_basic@basic-eu-total
 igt@i915_getparams_basic@basic-subslice-total
 igt@i915_hangman@error-state-basic
@@ -164,10 +164,10 @@ igt@vgem_basic@sysfs
 igt@core_hotunplug@unbind-rebind
 igt@vgem_basic@unload
 igt@i915_module_load@reload
-igt@gem_lmem_swapping@basic
-igt@gem_lmem_swapping@parallel-random-engines
-igt@gem_lmem_swapping@random-engines
-igt@gem_lmem_swapping@verify-random
+igt@i915_gem_lmem_swapping@basic
+igt@i915_gem_lmem_swapping@parallel-random-engines
+igt@i915_gem_lmem_swapping@random-engines
+igt@i915_gem_lmem_swapping@verify-random
 igt@i915_pm_rpm@module-reload
 
 # Kernel selftests
@@ -177,7 +177,7 @@ igt@dmabuf@all-tests
 # System wide suspend tests
 igt@i915_suspend@basic-s2idle-without-i915
 igt@i915_suspend@basic-s3-without-i915
-igt@gem_exec_suspend@basic-s0
-igt@gem_exec_suspend@basic-s3
+igt@i915_gem_exec_suspend@basic-s0
+igt@i915_gem_exec_suspend@basic-s3
 igt@kms_chamelium_hpd@common-hpd-after-suspend
 igt@kms_pipe_crc_basic@suspend-read-crc
diff --git a/tests/intel/api_intel_allocator.c b/tests/intel/i915_api_intel_allocator.c
similarity index 100%
rename from tests/intel/api_intel_allocator.c
rename to tests/intel/i915_api_intel_allocator.c
diff --git a/tests/intel/api_intel_bb.c b/tests/intel/i915_api_intel_bb.c
similarity index 100%
rename from tests/intel/api_intel_bb.c
rename to tests/intel/i915_api_intel_bb.c
diff --git a/tests/intel/drm_fdinfo.c b/tests/intel/i915_drm_fdinfo.c
similarity index 100%
rename from tests/intel/drm_fdinfo.c
rename to tests/intel/i915_drm_fdinfo.c
diff --git a/tests/intel/gem_bad_reloc.c b/tests/intel/i915_gem_bad_reloc.c
similarity index 100%
rename from tests/intel/gem_bad_reloc.c
rename to tests/intel/i915_gem_bad_reloc.c
diff --git a/tests/intel/gem_barrier_race.c b/tests/intel/i915_gem_barrier_race.c
similarity index 100%
rename from tests/intel/gem_barrier_race.c
rename to tests/intel/i915_gem_barrier_race.c
diff --git a/tests/intel/gem_basic.c b/tests/intel/i915_gem_basic.c
similarity index 100%
rename from tests/intel/gem_basic.c
rename to tests/intel/i915_gem_basic.c
diff --git a/tests/intel/gem_blits.c b/tests/intel/i915_gem_blits.c
similarity index 100%
rename from tests/intel/gem_blits.c
rename to tests/intel/i915_gem_blits.c
diff --git a/tests/intel/gem_busy.c b/tests/intel/i915_gem_busy.c
similarity index 100%
rename from tests/intel/gem_busy.c
rename to tests/intel/i915_gem_busy.c
diff --git a/tests/intel/gem_caching.c b/tests/intel/i915_gem_caching.c
similarity index 100%
rename from tests/intel/gem_caching.c
rename to tests/intel/i915_gem_caching.c
diff --git a/tests/intel/gem_ccs.c b/tests/intel/i915_gem_ccs.c
similarity index 100%
rename from tests/intel/gem_ccs.c
rename to tests/intel/i915_gem_ccs.c
diff --git a/tests/intel/gem_close.c b/tests/intel/i915_gem_close.c
similarity index 100%
rename from tests/intel/gem_close.c
rename to tests/intel/i915_gem_close.c
diff --git a/tests/intel/gem_close_race.c b/tests/intel/i915_gem_close_race.c
similarity index 100%
rename from tests/intel/gem_close_race.c
rename to tests/intel/i915_gem_close_race.c
diff --git a/tests/intel/gem_concurrent_all.c b/tests/intel/i915_gem_concurrent_all.c
similarity index 100%
rename from tests/intel/gem_concurrent_all.c
rename to tests/intel/i915_gem_concurrent_all.c
diff --git a/tests/intel/gem_concurrent_blit.c b/tests/intel/i915_gem_concurrent_blit.c
similarity index 91%
rename from tests/intel/gem_concurrent_blit.c
rename to tests/intel/i915_gem_concurrent_blit.c
index 513de4a1b..03b1483cb 100644
--- a/tests/intel/gem_concurrent_blit.c
+++ b/tests/intel/i915_gem_concurrent_blit.c
@@ -5,4 +5,4 @@
 /* available subtests. This avoids the use of           */
 /* non-standard command line parameters which can cause */
 /* problems for automated testing */
-#include "gem_concurrent_all.c"
+#include "i915_gem_concurrent_all.c"
diff --git a/tests/intel/gem_create.c b/tests/intel/i915_gem_create.c
similarity index 100%
rename from tests/intel/gem_create.c
rename to tests/intel/i915_gem_create.c
diff --git a/tests/intel/gem_cs_tlb.c b/tests/intel/i915_gem_cs_tlb.c
similarity index 100%
rename from tests/intel/gem_cs_tlb.c
rename to tests/intel/i915_gem_cs_tlb.c
diff --git a/tests/intel/gem_ctx_bad_destroy.c b/tests/intel/i915_gem_ctx_bad_destroy.c
similarity index 100%
rename from tests/intel/gem_ctx_bad_destroy.c
rename to tests/intel/i915_gem_ctx_bad_destroy.c
diff --git a/tests/intel/gem_ctx_create.c b/tests/intel/i915_gem_ctx_create.c
similarity index 100%
rename from tests/intel/gem_ctx_create.c
rename to tests/intel/i915_gem_ctx_create.c
diff --git a/tests/intel/gem_ctx_engines.c b/tests/intel/i915_gem_ctx_engines.c
similarity index 100%
rename from tests/intel/gem_ctx_engines.c
rename to tests/intel/i915_gem_ctx_engines.c
diff --git a/tests/intel/gem_ctx_exec.c b/tests/intel/i915_gem_ctx_exec.c
similarity index 100%
rename from tests/intel/gem_ctx_exec.c
rename to tests/intel/i915_gem_ctx_exec.c
diff --git a/tests/intel/gem_ctx_freq.c b/tests/intel/i915_gem_ctx_freq.c
similarity index 100%
rename from tests/intel/gem_ctx_freq.c
rename to tests/intel/i915_gem_ctx_freq.c
diff --git a/tests/intel/gem_ctx_isolation.c b/tests/intel/i915_gem_ctx_isolation.c
similarity index 100%
rename from tests/intel/gem_ctx_isolation.c
rename to tests/intel/i915_gem_ctx_isolation.c
diff --git a/tests/intel/gem_ctx_param.c b/tests/intel/i915_gem_ctx_param.c
similarity index 100%
rename from tests/intel/gem_ctx_param.c
rename to tests/intel/i915_gem_ctx_param.c
diff --git a/tests/intel/gem_ctx_persistence.c b/tests/intel/i915_gem_ctx_persistence.c
similarity index 100%
rename from tests/intel/gem_ctx_persistence.c
rename to tests/intel/i915_gem_ctx_persistence.c
diff --git a/tests/intel/gem_ctx_shared.c b/tests/intel/i915_gem_ctx_shared.c
similarity index 100%
rename from tests/intel/gem_ctx_shared.c
rename to tests/intel/i915_gem_ctx_shared.c
diff --git a/tests/intel/gem_ctx_sseu.c b/tests/intel/i915_gem_ctx_sseu.c
similarity index 100%
rename from tests/intel/gem_ctx_sseu.c
rename to tests/intel/i915_gem_ctx_sseu.c
diff --git a/tests/intel/gem_ctx_switch.c b/tests/intel/i915_gem_ctx_switch.c
similarity index 100%
rename from tests/intel/gem_ctx_switch.c
rename to tests/intel/i915_gem_ctx_switch.c
diff --git a/tests/intel/gem_eio.c b/tests/intel/i915_gem_eio.c
similarity index 100%
rename from tests/intel/gem_eio.c
rename to tests/intel/i915_gem_eio.c
diff --git a/tests/intel/gem_evict_alignment.c b/tests/intel/i915_gem_evict_alignment.c
similarity index 100%
rename from tests/intel/gem_evict_alignment.c
rename to tests/intel/i915_gem_evict_alignment.c
diff --git a/tests/intel/gem_evict_everything.c b/tests/intel/i915_gem_evict_everything.c
similarity index 100%
rename from tests/intel/gem_evict_everything.c
rename to tests/intel/i915_gem_evict_everything.c
diff --git a/tests/intel/gem_exec_alignment.c b/tests/intel/i915_gem_exec_alignment.c
similarity index 100%
rename from tests/intel/gem_exec_alignment.c
rename to tests/intel/i915_gem_exec_alignment.c
diff --git a/tests/intel/gem_exec_async.c b/tests/intel/i915_gem_exec_async.c
similarity index 100%
rename from tests/intel/gem_exec_async.c
rename to tests/intel/i915_gem_exec_async.c
diff --git a/tests/intel/gem_exec_await.c b/tests/intel/i915_gem_exec_await.c
similarity index 100%
rename from tests/intel/gem_exec_await.c
rename to tests/intel/i915_gem_exec_await.c
diff --git a/tests/intel/gem_exec_balancer.c b/tests/intel/i915_gem_exec_balancer.c
similarity index 100%
rename from tests/intel/gem_exec_balancer.c
rename to tests/intel/i915_gem_exec_balancer.c
diff --git a/tests/intel/gem_exec_basic.c b/tests/intel/i915_gem_exec_basic.c
similarity index 100%
rename from tests/intel/gem_exec_basic.c
rename to tests/intel/i915_gem_exec_basic.c
diff --git a/tests/intel/gem_exec_big.c b/tests/intel/i915_gem_exec_big.c
similarity index 100%
rename from tests/intel/gem_exec_big.c
rename to tests/intel/i915_gem_exec_big.c
diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/i915_gem_exec_capture.c
similarity index 100%
rename from tests/intel/gem_exec_capture.c
rename to tests/intel/i915_gem_exec_capture.c
diff --git a/tests/intel/gem_exec_create.c b/tests/intel/i915_gem_exec_create.c
similarity index 100%
rename from tests/intel/gem_exec_create.c
rename to tests/intel/i915_gem_exec_create.c
diff --git a/tests/intel/gem_exec_endless.c b/tests/intel/i915_gem_exec_endless.c
similarity index 100%
rename from tests/intel/gem_exec_endless.c
rename to tests/intel/i915_gem_exec_endless.c
diff --git a/tests/intel/gem_exec_fair.c b/tests/intel/i915_gem_exec_fair.c
similarity index 100%
rename from tests/intel/gem_exec_fair.c
rename to tests/intel/i915_gem_exec_fair.c
diff --git a/tests/intel/gem_exec_fence.c b/tests/intel/i915_gem_exec_fence.c
similarity index 100%
rename from tests/intel/gem_exec_fence.c
rename to tests/intel/i915_gem_exec_fence.c
diff --git a/tests/intel/gem_exec_flush.c b/tests/intel/i915_gem_exec_flush.c
similarity index 100%
rename from tests/intel/gem_exec_flush.c
rename to tests/intel/i915_gem_exec_flush.c
diff --git a/tests/intel/gem_exec_gttfill.c b/tests/intel/i915_gem_exec_gttfill.c
similarity index 100%
rename from tests/intel/gem_exec_gttfill.c
rename to tests/intel/i915_gem_exec_gttfill.c
diff --git a/tests/intel/gem_exec_latency.c b/tests/intel/i915_gem_exec_latency.c
similarity index 100%
rename from tests/intel/gem_exec_latency.c
rename to tests/intel/i915_gem_exec_latency.c
diff --git a/tests/intel/gem_exec_lut_handle.c b/tests/intel/i915_gem_exec_lut_handle.c
similarity index 100%
rename from tests/intel/gem_exec_lut_handle.c
rename to tests/intel/i915_gem_exec_lut_handle.c
diff --git a/tests/intel/gem_exec_nop.c b/tests/intel/i915_gem_exec_nop.c
similarity index 100%
rename from tests/intel/gem_exec_nop.c
rename to tests/intel/i915_gem_exec_nop.c
diff --git a/tests/intel/gem_exec_parallel.c b/tests/intel/i915_gem_exec_parallel.c
similarity index 100%
rename from tests/intel/gem_exec_parallel.c
rename to tests/intel/i915_gem_exec_parallel.c
diff --git a/tests/intel/gem_exec_params.c b/tests/intel/i915_gem_exec_params.c
similarity index 100%
rename from tests/intel/gem_exec_params.c
rename to tests/intel/i915_gem_exec_params.c
diff --git a/tests/intel/gem_exec_reloc.c b/tests/intel/i915_gem_exec_reloc.c
similarity index 100%
rename from tests/intel/gem_exec_reloc.c
rename to tests/intel/i915_gem_exec_reloc.c
diff --git a/tests/intel/gem_exec_schedule.c b/tests/intel/i915_gem_exec_schedule.c
similarity index 100%
rename from tests/intel/gem_exec_schedule.c
rename to tests/intel/i915_gem_exec_schedule.c
diff --git a/tests/intel/gem_exec_store.c b/tests/intel/i915_gem_exec_store.c
similarity index 100%
rename from tests/intel/gem_exec_store.c
rename to tests/intel/i915_gem_exec_store.c
diff --git a/tests/intel/gem_exec_suspend.c b/tests/intel/i915_gem_exec_suspend.c
similarity index 100%
rename from tests/intel/gem_exec_suspend.c
rename to tests/intel/i915_gem_exec_suspend.c
diff --git a/tests/intel/gem_exec_whisper.c b/tests/intel/i915_gem_exec_whisper.c
similarity index 100%
rename from tests/intel/gem_exec_whisper.c
rename to tests/intel/i915_gem_exec_whisper.c
diff --git a/tests/intel/gem_exercise_blt.c b/tests/intel/i915_gem_exercise_blt.c
similarity index 100%
rename from tests/intel/gem_exercise_blt.c
rename to tests/intel/i915_gem_exercise_blt.c
diff --git a/tests/intel/gem_fd_exhaustion.c b/tests/intel/i915_gem_fd_exhaustion.c
similarity index 100%
rename from tests/intel/gem_fd_exhaustion.c
rename to tests/intel/i915_gem_fd_exhaustion.c
diff --git a/tests/intel/gem_fence_thrash.c b/tests/intel/i915_gem_fence_thrash.c
similarity index 100%
rename from tests/intel/gem_fence_thrash.c
rename to tests/intel/i915_gem_fence_thrash.c
diff --git a/tests/intel/gem_fence_upload.c b/tests/intel/i915_gem_fence_upload.c
similarity index 100%
rename from tests/intel/gem_fence_upload.c
rename to tests/intel/i915_gem_fence_upload.c
diff --git a/tests/intel/gem_fenced_exec_thrash.c b/tests/intel/i915_gem_fenced_exec_thrash.c
similarity index 100%
rename from tests/intel/gem_fenced_exec_thrash.c
rename to tests/intel/i915_gem_fenced_exec_thrash.c
diff --git a/tests/intel/gem_flink_basic.c b/tests/intel/i915_gem_flink_basic.c
similarity index 100%
rename from tests/intel/gem_flink_basic.c
rename to tests/intel/i915_gem_flink_basic.c
diff --git a/tests/intel/gem_flink_race.c b/tests/intel/i915_gem_flink_race.c
similarity index 100%
rename from tests/intel/gem_flink_race.c
rename to tests/intel/i915_gem_flink_race.c
diff --git a/tests/intel/gem_gpgpu_fill.c b/tests/intel/i915_gem_gpgpu_fill.c
similarity index 100%
rename from tests/intel/gem_gpgpu_fill.c
rename to tests/intel/i915_gem_gpgpu_fill.c
diff --git a/tests/intel/gem_gtt_cpu_tlb.c b/tests/intel/i915_gem_gtt_cpu_tlb.c
similarity index 100%
rename from tests/intel/gem_gtt_cpu_tlb.c
rename to tests/intel/i915_gem_gtt_cpu_tlb.c
diff --git a/tests/intel/gem_gtt_hog.c b/tests/intel/i915_gem_gtt_hog.c
similarity index 100%
rename from tests/intel/gem_gtt_hog.c
rename to tests/intel/i915_gem_gtt_hog.c
diff --git a/tests/intel/gem_gtt_speed.c b/tests/intel/i915_gem_gtt_speed.c
similarity index 100%
rename from tests/intel/gem_gtt_speed.c
rename to tests/intel/i915_gem_gtt_speed.c
diff --git a/tests/intel/gem_huc_copy.c b/tests/intel/i915_gem_huc_copy.c
similarity index 100%
rename from tests/intel/gem_huc_copy.c
rename to tests/intel/i915_gem_huc_copy.c
diff --git a/tests/intel/gem_linear_blits.c b/tests/intel/i915_gem_linear_blits.c
similarity index 100%
rename from tests/intel/gem_linear_blits.c
rename to tests/intel/i915_gem_linear_blits.c
diff --git a/tests/intel/gem_lmem_evict.c b/tests/intel/i915_gem_lmem_evict.c
similarity index 100%
rename from tests/intel/gem_lmem_evict.c
rename to tests/intel/i915_gem_lmem_evict.c
diff --git a/tests/intel/gem_lmem_swapping.c b/tests/intel/i915_gem_lmem_swapping.c
similarity index 100%
rename from tests/intel/gem_lmem_swapping.c
rename to tests/intel/i915_gem_lmem_swapping.c
diff --git a/tests/intel/gem_lut_handle.c b/tests/intel/i915_gem_lut_handle.c
similarity index 100%
rename from tests/intel/gem_lut_handle.c
rename to tests/intel/i915_gem_lut_handle.c
diff --git a/tests/intel/gem_madvise.c b/tests/intel/i915_gem_madvise.c
similarity index 100%
rename from tests/intel/gem_madvise.c
rename to tests/intel/i915_gem_madvise.c
diff --git a/tests/intel/gem_media_fill.c b/tests/intel/i915_gem_media_fill.c
similarity index 100%
rename from tests/intel/gem_media_fill.c
rename to tests/intel/i915_gem_media_fill.c
diff --git a/tests/intel/gem_media_vme.c b/tests/intel/i915_gem_media_vme.c
similarity index 100%
rename from tests/intel/gem_media_vme.c
rename to tests/intel/i915_gem_media_vme.c
diff --git a/tests/intel/gem_mmap.c b/tests/intel/i915_gem_mmap.c
similarity index 100%
rename from tests/intel/gem_mmap.c
rename to tests/intel/i915_gem_mmap.c
diff --git a/tests/intel/gem_mmap_gtt.c b/tests/intel/i915_gem_mmap_gtt.c
similarity index 100%
rename from tests/intel/gem_mmap_gtt.c
rename to tests/intel/i915_gem_mmap_gtt.c
diff --git a/tests/intel/gem_mmap_offset.c b/tests/intel/i915_gem_mmap_offset.c
similarity index 100%
rename from tests/intel/gem_mmap_offset.c
rename to tests/intel/i915_gem_mmap_offset.c
diff --git a/tests/intel/gem_mmap_wc.c b/tests/intel/i915_gem_mmap_wc.c
similarity index 100%
rename from tests/intel/gem_mmap_wc.c
rename to tests/intel/i915_gem_mmap_wc.c
diff --git a/tests/intel/gem_partial_pwrite_pread.c b/tests/intel/i915_gem_partial_pwrite_pread.c
similarity index 100%
rename from tests/intel/gem_partial_pwrite_pread.c
rename to tests/intel/i915_gem_partial_pwrite_pread.c
diff --git a/tests/intel/gem_pipe_control_store_loop.c b/tests/intel/i915_gem_pipe_control_store_loop.c
similarity index 100%
rename from tests/intel/gem_pipe_control_store_loop.c
rename to tests/intel/i915_gem_pipe_control_store_loop.c
diff --git a/tests/intel/gem_ppgtt.c b/tests/intel/i915_gem_ppgtt.c
similarity index 100%
rename from tests/intel/gem_ppgtt.c
rename to tests/intel/i915_gem_ppgtt.c
diff --git a/tests/intel/gem_pread.c b/tests/intel/i915_gem_pread.c
similarity index 100%
rename from tests/intel/gem_pread.c
rename to tests/intel/i915_gem_pread.c
diff --git a/tests/intel/gem_pread_after_blit.c b/tests/intel/i915_gem_pread_after_blit.c
similarity index 100%
rename from tests/intel/gem_pread_after_blit.c
rename to tests/intel/i915_gem_pread_after_blit.c
diff --git a/tests/intel/gem_pwrite.c b/tests/intel/i915_gem_pwrite.c
similarity index 100%
rename from tests/intel/gem_pwrite.c
rename to tests/intel/i915_gem_pwrite.c
diff --git a/tests/intel/gem_pwrite_snooped.c b/tests/intel/i915_gem_pwrite_snooped.c
similarity index 100%
rename from tests/intel/gem_pwrite_snooped.c
rename to tests/intel/i915_gem_pwrite_snooped.c
diff --git a/tests/intel/gem_pxp.c b/tests/intel/i915_gem_pxp.c
similarity index 100%
rename from tests/intel/gem_pxp.c
rename to tests/intel/i915_gem_pxp.c
diff --git a/tests/intel/gem_read_read_speed.c b/tests/intel/i915_gem_read_read_speed.c
similarity index 100%
rename from tests/intel/gem_read_read_speed.c
rename to tests/intel/i915_gem_read_read_speed.c
diff --git a/tests/intel/gem_readwrite.c b/tests/intel/i915_gem_readwrite.c
similarity index 100%
rename from tests/intel/gem_readwrite.c
rename to tests/intel/i915_gem_readwrite.c
diff --git a/tests/intel/gem_reg_read.c b/tests/intel/i915_gem_reg_read.c
similarity index 100%
rename from tests/intel/gem_reg_read.c
rename to tests/intel/i915_gem_reg_read.c
diff --git a/tests/intel/gem_render_copy.c b/tests/intel/i915_gem_render_copy.c
similarity index 100%
rename from tests/intel/gem_render_copy.c
rename to tests/intel/i915_gem_render_copy.c
diff --git a/tests/intel/gem_render_copy_redux.c b/tests/intel/i915_gem_render_copy_redux.c
similarity index 100%
rename from tests/intel/gem_render_copy_redux.c
rename to tests/intel/i915_gem_render_copy_redux.c
diff --git a/tests/intel/gem_render_linear_blits.c b/tests/intel/i915_gem_render_linear_blits.c
similarity index 100%
rename from tests/intel/gem_render_linear_blits.c
rename to tests/intel/i915_gem_render_linear_blits.c
diff --git a/tests/intel/gem_render_tiled_blits.c b/tests/intel/i915_gem_render_tiled_blits.c
similarity index 100%
rename from tests/intel/gem_render_tiled_blits.c
rename to tests/intel/i915_gem_render_tiled_blits.c
diff --git a/tests/intel/gem_request_retire.c b/tests/intel/i915_gem_request_retire.c
similarity index 100%
rename from tests/intel/gem_request_retire.c
rename to tests/intel/i915_gem_request_retire.c
diff --git a/tests/intel/gem_reset_stats.c b/tests/intel/i915_gem_reset_stats.c
similarity index 100%
rename from tests/intel/gem_reset_stats.c
rename to tests/intel/i915_gem_reset_stats.c
diff --git a/tests/intel/gem_ringfill.c b/tests/intel/i915_gem_ringfill.c
similarity index 100%
rename from tests/intel/gem_ringfill.c
rename to tests/intel/i915_gem_ringfill.c
diff --git a/tests/intel/gem_set_tiling_vs_blt.c b/tests/intel/i915_gem_set_tiling_vs_blt.c
similarity index 100%
rename from tests/intel/gem_set_tiling_vs_blt.c
rename to tests/intel/i915_gem_set_tiling_vs_blt.c
diff --git a/tests/intel/gem_set_tiling_vs_gtt.c b/tests/intel/i915_gem_set_tiling_vs_gtt.c
similarity index 100%
rename from tests/intel/gem_set_tiling_vs_gtt.c
rename to tests/intel/i915_gem_set_tiling_vs_gtt.c
diff --git a/tests/intel/gem_set_tiling_vs_pwrite.c b/tests/intel/i915_gem_set_tiling_vs_pwrite.c
similarity index 100%
rename from tests/intel/gem_set_tiling_vs_pwrite.c
rename to tests/intel/i915_gem_set_tiling_vs_pwrite.c
diff --git a/tests/intel/gem_shrink.c b/tests/intel/i915_gem_shrink.c
similarity index 100%
rename from tests/intel/gem_shrink.c
rename to tests/intel/i915_gem_shrink.c
diff --git a/tests/intel/gem_softpin.c b/tests/intel/i915_gem_softpin.c
similarity index 100%
rename from tests/intel/gem_softpin.c
rename to tests/intel/i915_gem_softpin.c
diff --git a/tests/intel/gem_spin_batch.c b/tests/intel/i915_gem_spin_batch.c
similarity index 100%
rename from tests/intel/gem_spin_batch.c
rename to tests/intel/i915_gem_spin_batch.c
diff --git a/tests/intel/gem_streaming_writes.c b/tests/intel/i915_gem_streaming_writes.c
similarity index 100%
rename from tests/intel/gem_streaming_writes.c
rename to tests/intel/i915_gem_streaming_writes.c
diff --git a/tests/intel/gem_stress.c b/tests/intel/i915_gem_stress.c
similarity index 100%
rename from tests/intel/gem_stress.c
rename to tests/intel/i915_gem_stress.c
diff --git a/tests/intel/gem_sync.c b/tests/intel/i915_gem_sync.c
similarity index 100%
rename from tests/intel/gem_sync.c
rename to tests/intel/i915_gem_sync.c
diff --git a/tests/intel/gem_tiled_blits.c b/tests/intel/i915_gem_tiled_blits.c
similarity index 100%
rename from tests/intel/gem_tiled_blits.c
rename to tests/intel/i915_gem_tiled_blits.c
diff --git a/tests/intel/gem_tiled_fence_blits.c b/tests/intel/i915_gem_tiled_fence_blits.c
similarity index 100%
rename from tests/intel/gem_tiled_fence_blits.c
rename to tests/intel/i915_gem_tiled_fence_blits.c
diff --git a/tests/intel/gem_tiled_partial_pwrite_pread.c b/tests/intel/i915_gem_tiled_partial_pwrite_pread.c
similarity index 100%
rename from tests/intel/gem_tiled_partial_pwrite_pread.c
rename to tests/intel/i915_gem_tiled_partial_pwrite_pread.c
diff --git a/tests/intel/gem_tiled_pread_basic.c b/tests/intel/i915_gem_tiled_pread_basic.c
similarity index 100%
rename from tests/intel/gem_tiled_pread_basic.c
rename to tests/intel/i915_gem_tiled_pread_basic.c
diff --git a/tests/intel/gem_tiled_pread_pwrite.c b/tests/intel/i915_gem_tiled_pread_pwrite.c
similarity index 100%
rename from tests/intel/gem_tiled_pread_pwrite.c
rename to tests/intel/i915_gem_tiled_pread_pwrite.c
diff --git a/tests/intel/gem_tiled_swapping.c b/tests/intel/i915_gem_tiled_swapping.c
similarity index 100%
rename from tests/intel/gem_tiled_swapping.c
rename to tests/intel/i915_gem_tiled_swapping.c
diff --git a/tests/intel/gem_tiled_wb.c b/tests/intel/i915_gem_tiled_wb.c
similarity index 100%
rename from tests/intel/gem_tiled_wb.c
rename to tests/intel/i915_gem_tiled_wb.c
diff --git a/tests/intel/gem_tiled_wc.c b/tests/intel/i915_gem_tiled_wc.c
similarity index 100%
rename from tests/intel/gem_tiled_wc.c
rename to tests/intel/i915_gem_tiled_wc.c
diff --git a/tests/intel/gem_tiling_max_stride.c b/tests/intel/i915_gem_tiling_max_stride.c
similarity index 100%
rename from tests/intel/gem_tiling_max_stride.c
rename to tests/intel/i915_gem_tiling_max_stride.c
diff --git a/tests/intel/gem_unfence_active_buffers.c b/tests/intel/i915_gem_unfence_active_buffers.c
similarity index 100%
rename from tests/intel/gem_unfence_active_buffers.c
rename to tests/intel/i915_gem_unfence_active_buffers.c
diff --git a/tests/intel/gem_unref_active_buffers.c b/tests/intel/i915_gem_unref_active_buffers.c
similarity index 100%
rename from tests/intel/gem_unref_active_buffers.c
rename to tests/intel/i915_gem_unref_active_buffers.c
diff --git a/tests/intel/gem_userptr_blits.c b/tests/intel/i915_gem_userptr_blits.c
similarity index 100%
rename from tests/intel/gem_userptr_blits.c
rename to tests/intel/i915_gem_userptr_blits.c
diff --git a/tests/intel/gem_vm_create.c b/tests/intel/i915_gem_vm_create.c
similarity index 100%
rename from tests/intel/gem_vm_create.c
rename to tests/intel/i915_gem_vm_create.c
diff --git a/tests/intel/gem_wait.c b/tests/intel/i915_gem_wait.c
similarity index 100%
rename from tests/intel/gem_wait.c
rename to tests/intel/i915_gem_wait.c
diff --git a/tests/intel/gem_watchdog.c b/tests/intel/i915_gem_watchdog.c
similarity index 100%
rename from tests/intel/gem_watchdog.c
rename to tests/intel/i915_gem_watchdog.c
diff --git a/tests/intel/gem_workarounds.c b/tests/intel/i915_gem_workarounds.c
similarity index 100%
rename from tests/intel/gem_workarounds.c
rename to tests/intel/i915_gem_workarounds.c
diff --git a/tests/intel/gen3_mixed_blits.c b/tests/intel/i915_gen3_mixed_blits.c
similarity index 100%
rename from tests/intel/gen3_mixed_blits.c
rename to tests/intel/i915_gen3_mixed_blits.c
diff --git a/tests/intel/gen3_render_linear_blits.c b/tests/intel/i915_gen3_render_linear_blits.c
similarity index 100%
rename from tests/intel/gen3_render_linear_blits.c
rename to tests/intel/i915_gen3_render_linear_blits.c
diff --git a/tests/intel/gen3_render_mixed_blits.c b/tests/intel/i915_gen3_render_mixed_blits.c
similarity index 100%
rename from tests/intel/gen3_render_mixed_blits.c
rename to tests/intel/i915_gen3_render_mixed_blits.c
diff --git a/tests/intel/gen3_render_tiledx_blits.c b/tests/intel/i915_gen3_render_tiledx_blits.c
similarity index 100%
rename from tests/intel/gen3_render_tiledx_blits.c
rename to tests/intel/i915_gen3_render_tiledx_blits.c
diff --git a/tests/intel/gen3_render_tiledy_blits.c b/tests/intel/i915_gen3_render_tiledy_blits.c
similarity index 100%
rename from tests/intel/gen3_render_tiledy_blits.c
rename to tests/intel/i915_gen3_render_tiledy_blits.c
diff --git a/tests/intel/gen7_exec_parse.c b/tests/intel/i915_gen7_exec_parse.c
similarity index 100%
rename from tests/intel/gen7_exec_parse.c
rename to tests/intel/i915_gen7_exec_parse.c
diff --git a/tests/intel/gen9_exec_parse.c b/tests/intel/i915_gen9_exec_parse.c
similarity index 100%
rename from tests/intel/gen9_exec_parse.c
rename to tests/intel/i915_gen9_exec_parse.c
diff --git a/tests/intel/perf.c b/tests/intel/i915_perf.c
similarity index 100%
rename from tests/intel/perf.c
rename to tests/intel/i915_perf.c
diff --git a/tests/intel/perf_pmu.c b/tests/intel/i915_perf_pmu.c
similarity index 100%
rename from tests/intel/perf_pmu.c
rename to tests/intel/i915_perf_pmu.c
diff --git a/tests/intel/sysfs_defaults.c b/tests/intel/i915_sysfs_defaults.c
similarity index 100%
rename from tests/intel/sysfs_defaults.c
rename to tests/intel/i915_sysfs_defaults.c
diff --git a/tests/intel/sysfs_heartbeat_interval.c b/tests/intel/i915_sysfs_heartbeat_interval.c
similarity index 100%
rename from tests/intel/sysfs_heartbeat_interval.c
rename to tests/intel/i915_sysfs_heartbeat_interval.c
diff --git a/tests/intel/sysfs_preempt_timeout.c b/tests/intel/i915_sysfs_preempt_timeout.c
similarity index 100%
rename from tests/intel/sysfs_preempt_timeout.c
rename to tests/intel/i915_sysfs_preempt_timeout.c
diff --git a/tests/intel/sysfs_timeslice_duration.c b/tests/intel/i915_sysfs_timeslice_duration.c
similarity index 100%
rename from tests/intel/sysfs_timeslice_duration.c
rename to tests/intel/i915_sysfs_timeslice_duration.c
diff --git a/tests/meson.build b/tests/meson.build
index 14f81083f..f005246b2 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -84,122 +84,122 @@ test_progs = [
 ]
 
 intel_progs = [
-	'api_intel_allocator',
-	'api_intel_bb',
-	'gen3_mixed_blits',
-	'gen3_render_linear_blits',
-	'gen3_render_mixed_blits',
-	'gen3_render_tiledx_blits',
-	'gen3_render_tiledy_blits',
-	'gem_bad_reloc',
-	'gem_basic',
-	'gem_blits',
-	'gem_busy',
-	'gem_caching',
-	'gem_ccs',
-	'gem_close',
-	'gem_close_race',
-	'gem_concurrent_blit',
-	'gem_cs_tlb',
-	'gem_ctx_bad_destroy',
-	'gem_ctx_create',
-	'gem_ctx_engines',
-	'gem_ctx_exec',
-	'gem_ctx_isolation',
-	'gem_ctx_param',
-	'gem_ctx_persistence',
-	'gem_ctx_shared',
-	'gem_ctx_switch',
-	'gem_evict_alignment',
-	'gem_evict_everything',
-	'gem_exec_alignment',
-	'gem_exec_async',
-	'gem_exec_await',
-	'gem_exec_basic',
-	'gem_exec_big',
-	'gem_exec_capture',
-	'gem_exec_create',
-	'gem_exec_endless',
-	'gem_exec_fair',
-	'gem_exec_fence',
-	'gem_exec_flush',
-	'gem_exec_gttfill',
-	'gem_exec_latency',
-	'gem_exec_lut_handle',
-	'gem_exec_nop',
-	'gem_exec_parallel',
-	'gem_exec_params',
-	'gem_exercise_blt',
-	'gen7_exec_parse',
-	'gen9_exec_parse',
-	'gem_exec_reloc',
-	'gem_exec_schedule',
-	'gem_exec_store',
-	'gem_exec_suspend',
-	'gem_exec_whisper',
-	'gem_fd_exhaustion',
-	'gem_fence_thrash',
-	'gem_fence_upload',
-	'gem_fenced_exec_thrash',
-	'gem_flink_basic',
-	'gem_flink_race',
-	'gem_gpgpu_fill',
-	'gem_gtt_cpu_tlb',
-	'gem_gtt_hog',
-	'gem_gtt_speed',
-	'gem_huc_copy',
-	'gem_linear_blits',
-	'gem_lmem_evict',
-	'gem_lmem_swapping',
-	'gem_lut_handle',
-	'gem_madvise',
-	'gem_media_fill',
-	'gem_media_vme',
-	'gem_mmap',
-	'gem_mmap_gtt',
-	'gem_mmap_wc',
-	'gem_partial_pwrite_pread',
-	'gem_pipe_control_store_loop',
-	'gem_ppgtt',
-	'gem_pread',
-	'gem_pread_after_blit',
-	'gem_pwrite',
-	'gem_pwrite_snooped',
-	'gem_pxp',
-	'gem_read_read_speed',
-	'gem_readwrite',
-	'gem_reg_read',
-	'gem_render_copy',
-	'gem_render_copy_redux',
-	'gem_render_linear_blits',
-	'gem_render_tiled_blits',
-	'gem_request_retire',
-	'gem_reset_stats',
-	'gem_ringfill',
-	'gem_set_tiling_vs_blt',
-	'gem_set_tiling_vs_gtt',
-	'gem_set_tiling_vs_pwrite',
-	'gem_shrink',
-	'gem_softpin',
-	'gem_spin_batch',
-	'gem_streaming_writes',
-	'gem_sync',
-	'gem_tiled_blits',
-	'gem_tiled_fence_blits',
-	'gem_tiled_partial_pwrite_pread',
-	'gem_tiled_pread_basic',
-	'gem_tiled_pread_pwrite',
-	'gem_tiled_swapping',
-	'gem_tiled_wb',
-	'gem_tiled_wc',
-	'gem_tiling_max_stride',
-	'gem_unfence_active_buffers',
-	'gem_unref_active_buffers',
-	'gem_userptr_blits',
-	'gem_vm_create',
-	'gem_wait',
-	'gem_watchdog',
-	'gem_workarounds',
+	'i915_api_intel_allocator',
+	'i915_api_intel_bb',
+	'i915_gen3_mixed_blits',
+	'i915_gen3_render_linear_blits',
+	'i915_gen3_render_mixed_blits',
+	'i915_gen3_render_tiledx_blits',
+	'i915_gen3_render_tiledy_blits',
+	'i915_gem_bad_reloc',
+	'i915_gem_basic',
+	'i915_gem_blits',
+	'i915_gem_busy',
+	'i915_gem_caching',
+	'i915_gem_ccs',
+	'i915_gem_close',
+	'i915_gem_close_race',
+	'i915_gem_concurrent_blit',
+	'i915_gem_cs_tlb',
+	'i915_gem_ctx_bad_destroy',
+	'i915_gem_ctx_create',
+	'i915_gem_ctx_engines',
+	'i915_gem_ctx_exec',
+	'i915_gem_ctx_isolation',
+	'i915_gem_ctx_param',
+	'i915_gem_ctx_persistence',
+	'i915_gem_ctx_shared',
+	'i915_gem_ctx_switch',
+	'i915_gem_evict_alignment',
+	'i915_gem_evict_everything',
+	'i915_gem_exec_alignment',
+	'i915_gem_exec_async',
+	'i915_gem_exec_await',
+	'i915_gem_exec_basic',
+	'i915_gem_exec_big',
+	'i915_gem_exec_capture',
+	'i915_gem_exec_create',
+	'i915_gem_exec_endless',
+	'i915_gem_exec_fair',
+	'i915_gem_exec_fence',
+	'i915_gem_exec_flush',
+	'i915_gem_exec_gttfill',
+	'i915_gem_exec_latency',
+	'i915_gem_exec_lut_handle',
+	'i915_gem_exec_nop',
+	'i915_gem_exec_parallel',
+	'i915_gem_exec_params',
+	'i915_gem_exercise_blt',
+	'i915_gen7_exec_parse',
+	'i915_gen9_exec_parse',
+	'i915_gem_exec_reloc',
+	'i915_gem_exec_schedule',
+	'i915_gem_exec_store',
+	'i915_gem_exec_suspend',
+	'i915_gem_exec_whisper',
+	'i915_gem_fd_exhaustion',
+	'i915_gem_fence_thrash',
+	'i915_gem_fence_upload',
+	'i915_gem_fenced_exec_thrash',
+	'i915_gem_flink_basic',
+	'i915_gem_flink_race',
+	'i915_gem_gpgpu_fill',
+	'i915_gem_gtt_cpu_tlb',
+	'i915_gem_gtt_hog',
+	'i915_gem_gtt_speed',
+	'i915_gem_huc_copy',
+	'i915_gem_linear_blits',
+	'i915_gem_lmem_evict',
+	'i915_gem_lmem_swapping',
+	'i915_gem_lut_handle',
+	'i915_gem_madvise',
+	'i915_gem_media_fill',
+	'i915_gem_media_vme',
+	'i915_gem_mmap',
+	'i915_gem_mmap_gtt',
+	'i915_gem_mmap_wc',
+	'i915_gem_partial_pwrite_pread',
+	'i915_gem_pipe_control_store_loop',
+	'i915_gem_ppgtt',
+	'i915_gem_pread',
+	'i915_gem_pread_after_blit',
+	'i915_gem_pwrite',
+	'i915_gem_pwrite_snooped',
+	'i915_gem_pxp',
+	'i915_gem_read_read_speed',
+	'i915_gem_readwrite',
+	'i915_gem_reg_read',
+	'i915_gem_render_copy',
+	'i915_gem_render_copy_redux',
+	'i915_gem_render_linear_blits',
+	'i915_gem_render_tiled_blits',
+	'i915_gem_request_retire',
+	'i915_gem_reset_stats',
+	'i915_gem_ringfill',
+	'i915_gem_set_tiling_vs_blt',
+	'i915_gem_set_tiling_vs_gtt',
+	'i915_gem_set_tiling_vs_pwrite',
+	'i915_gem_shrink',
+	'i915_gem_softpin',
+	'i915_gem_spin_batch',
+	'i915_gem_streaming_writes',
+	'i915_gem_sync',
+	'i915_gem_tiled_blits',
+	'i915_gem_tiled_fence_blits',
+	'i915_gem_tiled_partial_pwrite_pread',
+	'i915_gem_tiled_pread_basic',
+	'i915_gem_tiled_pread_pwrite',
+	'i915_gem_tiled_swapping',
+	'i915_gem_tiled_wb',
+	'i915_gem_tiled_wc',
+	'i915_gem_tiling_max_stride',
+	'i915_gem_unfence_active_buffers',
+	'i915_gem_unref_active_buffers',
+	'i915_gem_userptr_blits',
+	'i915_gem_vm_create',
+	'i915_gem_wait',
+	'i915_gem_watchdog',
+	'i915_gem_workarounds',
 	'i915_fb_tiling',
 	'i915_getparams_basic',
 	'i915_pm_freq_api',
@@ -236,10 +236,10 @@ intel_progs = [
 	'kms_psr2_su',
 	'kms_psr_stress_test',
 	'kms_pwrite_crc',
-	'sysfs_defaults',
-	'sysfs_heartbeat_interval',
-	'sysfs_preempt_timeout',
-	'sysfs_timeslice_duration',
+	'i915_sysfs_defaults',
+	'i915_sysfs_heartbeat_interval',
+	'i915_sysfs_preempt_timeout',
+	'i915_sysfs_timeslice_duration',
 	'xe_create',
 	'xe_compute',
 	'xe_dma_buf_sync',
@@ -337,13 +337,13 @@ if chamelium.found()
 	test_deps += chamelium
 endif
 
-test_executables += executable('drm_fdinfo',
-	   join_paths('intel', 'drm_fdinfo.c'),
+test_executables += executable('i915_drm_fdinfo',
+	   join_paths('intel', 'i915_drm_fdinfo.c'),
 	   dependencies : test_deps + [ lib_igt_drm_fdinfo ],
 	   install_dir : libexecdir,
 	   install_rpath : libexecdir_rpathdir,
 	   install : true)
-test_list += 'drm_fdinfo'
+test_list += 'i915_drm_fdinfo'
 
 test_executables += executable('dumb_buffer', 'dumb_buffer.c',
 	   dependencies : test_deps + [ libatomic ],
@@ -352,52 +352,52 @@ test_executables += executable('dumb_buffer', 'dumb_buffer.c',
 	   install : true)
 test_list += 'dumb_buffer'
 
-test_executables += executable('gem_create',
-	   join_paths('intel', 'gem_create.c'),
+test_executables += executable('i915_gem_create',
+	   join_paths('intel', 'i915_gem_create.c'),
 	   dependencies : test_deps + [ libatomic ],
 	   install_dir : libexecdir,
 	   install_rpath : libexecdir_rpathdir,
 	   install : true)
-test_list += 'gem_create'
+test_list += 'i915_gem_create'
 
-test_executables += executable('gem_ctx_freq',
-	   join_paths('intel', 'gem_ctx_freq.c'),
+test_executables += executable('i915_gem_ctx_freq',
+	   join_paths('intel', 'i915_gem_ctx_freq.c'),
 	   dependencies : test_deps + [ lib_igt_perf ],
 	   install_dir : libexecdir,
 	   install_rpath : libexecdir_rpathdir,
 	   install : true)
-test_list += 'gem_ctx_freq'
+test_list += 'i915_gem_ctx_freq'
 
-test_executables += executable('gem_ctx_sseu',
-	   join_paths('intel', 'gem_ctx_sseu.c'),
+test_executables += executable('i915_gem_ctx_sseu',
+	   join_paths('intel', 'i915_gem_ctx_sseu.c'),
 	   dependencies : test_deps + [ lib_igt_perf ],
 	   install_dir : libexecdir,
 	   install_rpath : libexecdir_rpathdir,
 	   install : true)
-test_list += 'gem_ctx_sseu'
+test_list += 'i915_gem_ctx_sseu'
 
-test_executables += executable('gem_eio',
-	   join_paths('intel', 'gem_eio.c'),
+test_executables += executable('i915_gem_eio',
+	   join_paths('intel', 'i915_gem_eio.c'),
 	   dependencies : test_deps + [ realtime ],
 	   install_dir : libexecdir,
 	   install_rpath : libexecdir_rpathdir,
 	   install : true)
-test_list += 'gem_eio'
+test_list += 'i915_gem_eio'
 
-test_executables += executable('gem_exec_balancer', 'intel/gem_exec_balancer.c',
+test_executables += executable('i915_gem_exec_balancer', 'intel/i915_gem_exec_balancer.c',
 	   dependencies : test_deps + [ lib_igt_perf ],
 	   install_dir : libexecdir,
 	   install_rpath : libexecdir_rpathdir,
 	   install : true)
-test_list += 'gem_exec_balancer'
+test_list += 'i915_gem_exec_balancer'
 
-test_executables += executable('gem_mmap_offset',
-	   join_paths('intel', 'gem_mmap_offset.c'),
+test_executables += executable('i915_gem_mmap_offset',
+	   join_paths('intel', 'i915_gem_mmap_offset.c'),
 	   dependencies : test_deps + [ libatomic ],
 	   install_dir : libexecdir,
 	   install_rpath : libexecdir_rpathdir,
 	   install : true)
-test_list += 'gem_mmap_offset'
+test_list += 'i915_gem_mmap_offset'
 
 test_executables += executable('i915_pm_freq_mult',
 	   join_paths('intel', 'i915_pm_freq_mult.c'),
@@ -415,29 +415,29 @@ test_executables += executable('i915_pm_rc6_residency',
 	   install : true)
 test_list += 'i915_pm_rc6_residency'
 
-test_executables += executable('gem_barrier_race',
-	   join_paths('intel', 'gem_barrier_race.c'),
+test_executables += executable('i915_gem_barrier_race',
+	   join_paths('intel', 'i915_gem_barrier_race.c'),
 	   dependencies : test_deps + [ lib_igt_i915_perf ],
 	   install_dir : libexecdir,
 	   install_rpath : libexecdir_rpathdir,
 	   install : true)
-test_list += 'gem_barrier_race'
+test_list += 'i915_gem_barrier_race'
 
-test_executables += executable('perf_pmu',
-	   join_paths('intel', 'perf_pmu.c'),
+test_executables += executable('i915_perf_pmu',
+	   join_paths('intel', 'i915_perf_pmu.c'),
 	   dependencies : test_deps + [ lib_igt_perf ],
 	   install_dir : libexecdir,
 	   install_rpath : libexecdir_rpathdir,
 	   install : true)
-test_list += 'perf_pmu'
+test_list += 'i915_perf_pmu'
 
-test_executables += executable('perf',
-	   join_paths('intel', 'perf.c'),
+test_executables += executable('i915_perf',
+	   join_paths('intel', 'i915_perf.c'),
 	   dependencies : test_deps + [ lib_igt_i915_perf ],
 	   install_dir : libexecdir,
 	   install_rpath : libexecdir_rpathdir,
 	   install : true)
-test_list += 'perf'
+test_list += 'i915_perf'
 
 test_executables += executable('core_hotunplug', 'core_hotunplug.c',
 	   dependencies : test_deps + [ lib_igt_i915_perf ],
@@ -509,12 +509,12 @@ test_list_target = custom_target('testlist',
 	      install : true,
 	      install_dir : libexecdir)
 
-test_executables += executable('gem_concurrent_all', 'intel/gem_concurrent_all.c',
+test_executables += executable('i915_gem_concurrent_all', 'intel/i915_gem_concurrent_all.c',
 	   dependencies : test_deps + [ libatomic ],
 	   install_dir : libexecdir,
 	   install_rpath : libexecdir_rpathdir,
 	   install : true)
-test_list += 'gem_concurrent_all'
+test_list += 'i915_gem_concurrent_all'
 
 test_list_full_target = custom_target('testlist-full',
 	      output : 'test-list-full.txt',
@@ -527,7 +527,7 @@ foreach prog : test_list
 	test('testcase check ' + prog, test_script, args : prog)
 endforeach
 
-executable('gem_stress', 'intel/gem_stress.c',
+executable('i915_gem_stress', 'intel/i915_gem_stress.c',
 	   install : true,
 	   install_dir : libexecdir,
 	   install_rpath : libexecdir_rpathdir,
-- 
2.40.0


