Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D254010E1A1
 for <igt-dev@lists.freedesktop.org>; Tue,  9 May 2023 05:06:08 +0000 (UTC)
Message-ID: <bd7e8569-d3aa-75d2-41ea-ee0d849eb962@intel.com>
Date: Tue, 9 May 2023 10:35:44 +0530
Content-Language: en-US
References: <20230504045726.2954788-1-bhanuprakash.modem@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230504045726.2954788-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 0/6] XE test cleanup to handle xe_device
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, ankit.k.nautiyal@intel.com, mchehab@kernel.org, kamil.konieczny@linux.intel.com, zbigniew.kempczynski@intel.com, karthik.b.s@intel.com, swati2.sharma@intel.com
List-ID: <igt-dev@lists.freedesktop.org>



On Thu-04-05-2023 10:27 am, Bhanuprakash Modem wrote:
> Instead of caching the xe_device struct at subtest level, cache
> just after opening the driver. And remove from the cache just
> before closing the driver. So, this series introduces new helper
> drm_close_driver() which helps to remove the xe_device & close
> the drm fd. So that every user must call drm_close_driver()
> instead of close().
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> Bhanuprakash Modem (6):
>    lib: Interface to close the drm fd
>    lib: Cache xe_device at driver open/close level
>    lib/xe/xe_query: Add xe_config() interface
>    Revert "lib/igt_kms: Cache xe_device info for kms tests"
>    tests: Use drm_close_driver() to close the drm fd
>    tests: Drop xe_device get/put from test level
> 
>   lib/drmtest.c                               | 26 +++++++++
>   lib/drmtest.h                               |  1 +
>   lib/igt_kms.c                               |  8 ---
>   lib/igt_msm.c                               |  2 +-
>   lib/xe/xe_query.c                           |  8 +++
>   lib/xe/xe_query.h                           |  1 +
>   tests/amdgpu/amd_abm.c                      |  1 +
>   tests/amdgpu/amd_assr.c                     |  1 +
>   tests/amdgpu/amd_basic.c                    |  2 +-
>   tests/amdgpu/amd_cs_nop.c                   |  2 +-
>   tests/amdgpu/amd_deadlock.c                 |  2 +-
>   tests/amdgpu/amd_freesync_video_mode.c      |  1 +
>   tests/amdgpu/amd_info.c                     |  2 +-
>   tests/amdgpu/amd_mem_leak.c                 |  1 +
>   tests/amdgpu/amd_module_load.c              |  2 +-
>   tests/amdgpu/amd_prime.c                    |  6 +-
>   tests/amdgpu/amd_psr.c                      |  4 +-
>   tests/amdgpu/amd_vrr_range.c                |  1 +
>   tests/chamelium/kms_chamelium_audio.c       |  2 +-
>   tests/chamelium/kms_chamelium_edid.c        |  2 +-
>   tests/chamelium/kms_chamelium_frames.c      |  2 +-
>   tests/chamelium/kms_chamelium_hpd.c         |  2 +-
>   tests/core_auth.c                           | 10 ++--
>   tests/core_getclient.c                      |  2 +-
>   tests/core_getstats.c                       |  2 +-
>   tests/core_getversion.c                     |  2 +-
>   tests/core_setmaster.c                      |  6 +-
>   tests/core_setmaster_vs_auth.c              |  6 +-
>   tests/debugfs_test.c                        |  2 +-
>   tests/dmabuf_sync_file.c                    |  3 +
>   tests/drm_read.c                            |  3 +
>   tests/dumb_buffer.c                         |  2 +-
>   tests/eviction_common.c                     |  2 +-
>   tests/fbdev.c                               |  2 +-
>   tests/i915/api_intel_allocator.c            |  2 +-
>   tests/i915/api_intel_bb.c                   |  2 +-
>   tests/i915/drm_fdinfo.c                     |  2 +-
>   tests/i915/gem_bad_reloc.c                  |  2 +-
>   tests/i915/gem_barrier_race.c               |  3 +
>   tests/i915/gem_basic.c                      |  5 +-
>   tests/i915/gem_blits.c                      |  2 +-
>   tests/i915/gem_busy.c                       |  2 +-
>   tests/i915/gem_caching.c                    |  2 +-
>   tests/i915/gem_ccs.c                        |  2 +-
>   tests/i915/gem_close_race.c                 | 12 ++--
>   tests/i915/gem_concurrent_all.c             |  5 ++
>   tests/i915/gem_cs_tlb.c                     |  2 +-
>   tests/i915/gem_ctx_bad_destroy.c            |  2 +-
>   tests/i915/gem_ctx_create.c                 |  2 +-
>   tests/i915/gem_ctx_engines.c                |  4 +-
>   tests/i915/gem_ctx_exec.c                   |  3 +
>   tests/i915/gem_ctx_freq.c                   |  3 +
>   tests/i915/gem_ctx_param.c                  |  2 +-
>   tests/i915/gem_ctx_persistence.c            |  2 +-
>   tests/i915/gem_ctx_shared.c                 |  3 +
>   tests/i915/gem_ctx_sseu.c                   |  2 +-
>   tests/i915/gem_ctx_switch.c                 |  2 +-
>   tests/i915/gem_eio.c                        |  3 +
>   tests/i915/gem_evict_alignment.c            |  2 +-
>   tests/i915/gem_evict_everything.c           |  2 +-
>   tests/i915/gem_exec_alignment.c             |  3 +
>   tests/i915/gem_exec_async.c                 |  2 +-
>   tests/i915/gem_exec_await.c                 |  2 +-
>   tests/i915/gem_exec_balancer.c              |  3 +
>   tests/i915/gem_exec_basic.c                 |  2 +-
>   tests/i915/gem_exec_big.c                   |  2 +-
>   tests/i915/gem_exec_capture.c               |  2 +-
>   tests/i915/gem_exec_create.c                |  2 +-
>   tests/i915/gem_exec_endless.c               |  3 +
>   tests/i915/gem_exec_fair.c                  |  2 +-
>   tests/i915/gem_exec_fence.c                 |  2 +-
>   tests/i915/gem_exec_flush.c                 |  2 +-
>   tests/i915/gem_exec_gttfill.c               |  4 +-
>   tests/i915/gem_exec_latency.c               |  2 +-
>   tests/i915/gem_exec_nop.c                   |  2 +-
>   tests/i915/gem_exec_parallel.c              |  2 +-
>   tests/i915/gem_exec_params.c                |  2 +-
>   tests/i915/gem_exec_reloc.c                 |  2 +-
>   tests/i915/gem_exec_schedule.c              |  2 +-
>   tests/i915/gem_exec_store.c                 |  2 +-
>   tests/i915/gem_exec_suspend.c               |  2 +-
>   tests/i915/gem_exec_whisper.c               |  2 +-
>   tests/i915/gem_exercise_blt.c               |  2 +-
>   tests/i915/gem_fd_exhaustion.c              |  2 +-
>   tests/i915/gem_fence_thrash.c               |  3 +-
>   tests/i915/gem_fenced_exec_thrash.c         |  2 +-
>   tests/i915/gem_flink_basic.c                |  7 ++-
>   tests/i915/gem_flink_race.c                 |  6 +-
>   tests/i915/gem_gtt_cpu_tlb.c                |  2 +-
>   tests/i915/gem_gtt_hog.c                    |  2 +-
>   tests/i915/gem_gtt_speed.c                  |  2 +-
>   tests/i915/gem_huc_copy.c                   |  2 +-
>   tests/i915/gem_lmem_evict.c                 |  4 +-
>   tests/i915/gem_lmem_swapping.c              |  4 +-
>   tests/i915/gem_madvise.c                    | 12 ++--
>   tests/i915/gem_media_fill.c                 |  2 +-
>   tests/i915/gem_mmap.c                       |  2 +-
>   tests/i915/gem_mmap_gtt.c                   |  2 +-
>   tests/i915/gem_mmap_offset.c                |  2 +-
>   tests/i915/gem_mmap_wc.c                    |  2 +-
>   tests/i915/gem_partial_pwrite_pread.c       |  2 +-
>   tests/i915/gem_pipe_control_store_loop.c    |  2 +-
>   tests/i915/gem_ppgtt.c                      |  8 +--
>   tests/i915/gem_pread.c                      |  2 +-
>   tests/i915/gem_pread_after_blit.c           |  2 +-
>   tests/i915/gem_pwrite.c                     |  2 +-
>   tests/i915/gem_pwrite_snooped.c             |  2 +-
>   tests/i915/gem_pxp.c                        |  2 +-
>   tests/i915/gem_read_read_speed.c            |  2 +-
>   tests/i915/gem_readwrite.c                  |  2 +-
>   tests/i915/gem_reg_read.c                   |  2 +-
>   tests/i915/gem_render_copy.c                |  2 +-
>   tests/i915/gem_render_copy_redux.c          |  2 +-
>   tests/i915/gem_reset_stats.c                |  2 +-
>   tests/i915/gem_ringfill.c                   |  2 +-
>   tests/i915/gem_set_tiling_vs_blt.c          |  2 +-
>   tests/i915/gem_set_tiling_vs_gtt.c          |  2 +-
>   tests/i915/gem_set_tiling_vs_pwrite.c       |  2 +-
>   tests/i915/gem_shrink.c                     | 14 ++---
>   tests/i915/gem_softpin.c                    |  2 +-
>   tests/i915/gem_spin_batch.c                 |  2 +-
>   tests/i915/gem_streaming_writes.c           |  2 +-
>   tests/i915/gem_stress.c                     |  2 +-
>   tests/i915/gem_sync.c                       |  2 +-
>   tests/i915/gem_tiled_blits.c                |  2 +-
>   tests/i915/gem_tiled_fence_blits.c          |  2 +-
>   tests/i915/gem_tiled_partial_pwrite_pread.c |  2 +-
>   tests/i915/gem_tiled_pread_basic.c          |  2 +-
>   tests/i915/gem_tiled_pread_pwrite.c         |  2 +-
>   tests/i915/gem_tiled_swapping.c             |  2 +-
>   tests/i915/gem_tiled_wb.c                   |  2 +-
>   tests/i915/gem_tiled_wc.c                   |  2 +-
>   tests/i915/gem_tiling_max_stride.c          |  2 +-
>   tests/i915/gem_unfence_active_buffers.c     |  2 +-
>   tests/i915/gem_unref_active_buffers.c       |  2 +-
>   tests/i915/gem_userptr_blits.c              |  7 ++-
>   tests/i915/gem_vm_create.c                  |  2 +-
>   tests/i915/gem_wait.c                       |  2 +-
>   tests/i915/gem_watchdog.c                   |  2 +-
>   tests/i915/gem_workarounds.c                |  3 +
>   tests/i915/gen7_exec_parse.c                |  4 +-
>   tests/i915/gen9_exec_parse.c                |  2 +-
>   tests/i915/i915_fb_tiling.c                 |  2 +-
>   tests/i915/i915_getparams_basic.c           |  2 +-
>   tests/i915/i915_hangman.c                   |  4 +-
>   tests/i915/i915_hwmon.c                     |  2 +-
>   tests/i915/i915_module_load.c               |  8 +--
>   tests/i915/i915_pciid.c                     |  2 +-
>   tests/i915/i915_pm_backlight.c              |  2 +-
>   tests/i915/i915_pm_dc.c                     |  2 +-
>   tests/i915/i915_pm_freq_api.c               |  2 +-
>   tests/i915/i915_pm_freq_mult.c              |  2 +-
>   tests/i915/i915_pm_lpsp.c                   |  2 +-
>   tests/i915/i915_pm_rc6_residency.c          |  2 +-
>   tests/i915/i915_pm_rpm.c                    |  2 +-
>   tests/i915/i915_pm_rps.c                    |  5 +-
>   tests/i915/i915_pm_sseu.c                   |  2 +-
>   tests/i915/i915_power.c                     |  2 +-
>   tests/i915/i915_query.c                     |  2 +-
>   tests/i915/i915_suspend.c                   |  4 +-
>   tests/i915/kms_big_fb.c                     |  2 +-
>   tests/i915/kms_big_joiner.c                 |  2 +-
>   tests/i915/kms_busy.c                       |  2 +-
>   tests/i915/kms_ccs.c                        |  2 +-
>   tests/i915/kms_cdclk.c                      |  2 +-
>   tests/i915/kms_draw_crc.c                   |  2 +-
>   tests/i915/kms_dsc.c                        |  2 +-
>   tests/i915/kms_fbcon_fbt.c                  |  2 +-
>   tests/i915/kms_fence_pin_leak.c             |  2 +-
>   tests/i915/kms_flip_scaled_crc.c            |  2 +-
>   tests/i915/kms_flip_tiling.c                |  2 +-
>   tests/i915/kms_frontbuffer_tracking.c       |  2 +-
>   tests/i915/kms_legacy_colorkey.c            |  2 +-
>   tests/i915/kms_mmap_write_crc.c             |  3 +-
>   tests/i915/kms_pipe_b_c_ivb.c               |  2 +-
>   tests/i915/kms_psr.c                        |  2 +-
>   tests/i915/kms_psr2_sf.c                    |  2 +-
>   tests/i915/kms_psr2_su.c                    |  2 +-
>   tests/i915/kms_psr_stress_test.c            |  2 +-
>   tests/i915/kms_pwrite_crc.c                 |  2 +-
>   tests/i915/perf.c                           |  4 +-
>   tests/i915/perf_pmu.c                       |  6 +-
>   tests/i915/sysfs_defaults.c                 |  2 +-
>   tests/i915/sysfs_heartbeat_interval.c       |  2 +-
>   tests/i915/sysfs_preempt_timeout.c          |  2 +-
>   tests/i915/sysfs_timeslice_duration.c       |  2 +-
>   tests/kms_3d.c                              |  8 +--
>   tests/kms_addfb_basic.c                     | 13 +----
>   tests/kms_async_flips.c                     |  2 +-
>   tests/kms_atomic.c                          |  2 +-
>   tests/kms_atomic_interruptible.c            |  2 +-
>   tests/kms_atomic_transition.c               |  2 +-
>   tests/kms_color.c                           |  2 +-
>   tests/kms_concurrent.c                      |  2 +-
>   tests/kms_content_protection.c              |  2 +-
>   tests/kms_cursor_crc.c                      |  2 +-
>   tests/kms_cursor_edge_walk.c                |  2 +-
>   tests/kms_cursor_legacy.c                   |  2 +-
>   tests/kms_dither.c                          |  2 +-
>   tests/kms_dp_aux_dev.c                      |  2 +-
>   tests/kms_dp_tiled_display.c                |  2 +-
>   tests/kms_flip.c                            | 11 +---
>   tests/kms_flip_event_leak.c                 |  8 +--
>   tests/kms_force_connector_basic.c           |  4 +-
>   tests/kms_getfb.c                           | 19 +------
>   tests/kms_hdmi_inject.c                     |  9 +--
>   tests/kms_hdr.c                             |  2 +-
>   tests/kms_invalid_mode.c                    |  2 +-
>   tests/kms_lease.c                           |  4 +-
>   tests/kms_panel_fitting.c                   |  2 +-
>   tests/kms_pipe_crc_basic.c                  |  2 +-
>   tests/kms_plane.c                           |  2 +-
>   tests/kms_plane_alpha_blend.c               |  2 +-
>   tests/kms_plane_cursor.c                    |  2 +-
>   tests/kms_plane_lowres.c                    |  2 +-
>   tests/kms_plane_multiple.c                  |  2 +-
>   tests/kms_plane_scaling.c                   |  2 +-
>   tests/kms_prime.c                           |  6 +-
>   tests/kms_prop_blob.c                       |  8 +--
>   tests/kms_properties.c                      |  2 +-
>   tests/kms_rmfb.c                            |  4 +-
>   tests/kms_rotation_crc.c                    |  2 +-
>   tests/kms_scaling_modes.c                   |  2 +-
>   tests/kms_sequence.c                        |  2 +-
>   tests/kms_setmode.c                         |  9 +--
>   tests/kms_tv_load_detect.c                  |  2 +-
>   tests/kms_universal_plane.c                 |  2 +-
>   tests/kms_vblank.c                          |  2 +-
>   tests/kms_vrr.c                             |  1 +
>   tests/kms_writeback.c                       |  1 +
>   tests/nouveau_crc.c                         |  6 +-
>   tests/panfrost_gem_new.c                    |  4 +-
>   tests/panfrost_get_param.c                  |  2 +-
>   tests/panfrost_prime.c                      |  4 +-
>   tests/panfrost_submit.c                     |  6 +-
>   tests/prime_busy.c                          |  2 +-
>   tests/prime_mmap.c                          |  2 +-
>   tests/prime_mmap_coherency.c                |  4 +-
>   tests/prime_mmap_kms.c                      |  2 +-
>   tests/prime_self_import.c                   | 26 ++++-----
>   tests/prime_vgem.c                          |  4 +-
>   tests/syncobj_basic.c                       |  2 +-
>   tests/syncobj_timeline.c                    |  2 +-
>   tests/syncobj_wait.c                        |  2 +-
>   tests/template.c                            |  2 +-
>   tests/testdisplay.c                         |  4 +-
>   tests/v3d/v3d_create_bo.c                   |  4 +-
>   tests/v3d/v3d_get_bo_offset.c               |  2 +-
>   tests/v3d/v3d_get_param.c                   |  2 +-
>   tests/v3d/v3d_job_submission.c              |  2 +-
>   tests/v3d/v3d_mmap.c                        |  2 +-
>   tests/v3d/v3d_perfmon.c                     |  2 +-
>   tests/v3d/v3d_submit_cl.c                   |  2 +-
>   tests/v3d/v3d_submit_csd.c                  |  2 +-
>   tests/v3d/v3d_wait_bo.c                     |  2 +-
>   tests/vc4/vc4_create_bo.c                   |  4 +-
>   tests/vc4/vc4_dmabuf_poll.c                 |  2 +-
>   tests/vc4/vc4_label_bo.c                    |  2 +-
>   tests/vc4/vc4_lookup_fail.c                 |  2 +-
>   tests/vc4/vc4_mmap.c                        |  2 +-
>   tests/vc4/vc4_perfmon.c                     |  2 +-
>   tests/vc4/vc4_purgeable_bo.c                |  2 +-
>   tests/vc4/vc4_tiling.c                      |  2 +-
>   tests/vc4/vc4_wait_bo.c                     |  2 +-
>   tests/vc4/vc4_wait_seqno.c                  |  2 +-
>   tests/vgem_basic.c                          |  6 +-
>   tests/vgem_slow.c                           |  2 +-
>   tests/vmwgfx/vmw_execution_buffer.c         |  2 +-
>   tests/vmwgfx/vmw_ref_count.c                |  4 +-
>   tests/vmwgfx/vmw_surface_copy.c             |  2 +-
>   tests/xe/xe_compute.c                       | 10 +---
>   tests/xe/xe_create.c                        | 10 +---
>   tests/xe/xe_debugfs.c                       | 10 +---
>   tests/xe/xe_dma_buf_sync.c                  | 15 ++---
>   tests/xe/xe_evict.c                         | 11 +---
>   tests/xe/xe_exec_balancer.c                 | 10 +---
>   tests/xe/xe_exec_basic.c                    | 10 +---
>   tests/xe/xe_exec_compute_mode.c             | 10 +---
>   tests/xe/xe_exec_fault_mode.c               |  7 +--
>   tests/xe/xe_exec_reset.c                    | 31 +++--------
>   tests/xe/xe_exec_threads.c                  | 28 +++-------
>   tests/xe/xe_gpgpu_fill.c                    |  6 +-
>   tests/xe/xe_guc_pc.c                        |  4 +-
>   tests/xe/xe_huc_copy.c                      | 10 +---
>   tests/xe/xe_intel_bb.c                      |  4 +-
>   tests/xe/xe_mmap.c                          | 10 +---
>   tests/xe/xe_mmio.c                          | 10 +---
>   tests/xe/xe_module_load.c                   |  2 +-
>   tests/xe/xe_noexec_ping_pong.c              |  4 +-
>   tests/xe/xe_pm.c                            |  5 +-
>   tests/xe/xe_prime_self_import.c             | 61 ++++++---------------
>   tests/xe/xe_query.c                         | 10 +---
>   tests/xe/xe_vm.c                            |  7 +--
>   tests/xe/xe_waitfence.c                     | 10 +---
>   294 files changed, 512 insertions(+), 603 deletions(-)
> 
> --
> 2.40.0
> 

