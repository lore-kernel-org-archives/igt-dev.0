Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F29110E2A5
 for <igt-dev@lists.freedesktop.org>; Thu,  4 May 2023 05:02:39 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Thu,  4 May 2023 10:27:25 +0530
Message-Id: <20230504045726.2954788-6-bhanuprakash.modem@intel.com>
In-Reply-To: <20230504045726.2954788-1-bhanuprakash.modem@intel.com>
References: <20230504045726.2954788-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 5/6] tests: Use drm_close_driver() to close the
 drm fd
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

To close the drm file descriptor, use igt helper drm_close_driver()
instead of using close().

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_msm.c                               |  2 +-
 tests/amdgpu/amd_abm.c                      |  1 +
 tests/amdgpu/amd_assr.c                     |  1 +
 tests/amdgpu/amd_basic.c                    |  2 +-
 tests/amdgpu/amd_cs_nop.c                   |  2 +-
 tests/amdgpu/amd_deadlock.c                 |  2 +-
 tests/amdgpu/amd_freesync_video_mode.c      |  1 +
 tests/amdgpu/amd_info.c                     |  2 +-
 tests/amdgpu/amd_mem_leak.c                 |  1 +
 tests/amdgpu/amd_module_load.c              |  2 +-
 tests/amdgpu/amd_prime.c                    |  6 ++---
 tests/amdgpu/amd_psr.c                      |  4 +--
 tests/amdgpu/amd_vrr_range.c                |  1 +
 tests/chamelium/kms_chamelium_audio.c       |  2 +-
 tests/chamelium/kms_chamelium_edid.c        |  2 +-
 tests/chamelium/kms_chamelium_frames.c      |  2 +-
 tests/chamelium/kms_chamelium_hpd.c         |  2 +-
 tests/core_auth.c                           | 10 +++----
 tests/core_getclient.c                      |  2 +-
 tests/core_getstats.c                       |  2 +-
 tests/core_getversion.c                     |  2 +-
 tests/core_setmaster.c                      |  6 ++---
 tests/core_setmaster_vs_auth.c              |  6 ++---
 tests/debugfs_test.c                        |  2 +-
 tests/dmabuf_sync_file.c                    |  3 +++
 tests/drm_read.c                            |  3 +++
 tests/dumb_buffer.c                         |  2 +-
 tests/eviction_common.c                     |  2 +-
 tests/fbdev.c                               |  2 +-
 tests/i915/api_intel_allocator.c            |  2 +-
 tests/i915/api_intel_bb.c                   |  2 +-
 tests/i915/drm_fdinfo.c                     |  2 +-
 tests/i915/gem_bad_reloc.c                  |  2 +-
 tests/i915/gem_barrier_race.c               |  3 +++
 tests/i915/gem_basic.c                      |  5 +++-
 tests/i915/gem_blits.c                      |  2 +-
 tests/i915/gem_busy.c                       |  2 +-
 tests/i915/gem_caching.c                    |  2 +-
 tests/i915/gem_ccs.c                        |  2 +-
 tests/i915/gem_close_race.c                 | 12 ++++-----
 tests/i915/gem_concurrent_all.c             |  5 ++++
 tests/i915/gem_cs_tlb.c                     |  2 +-
 tests/i915/gem_ctx_bad_destroy.c            |  2 +-
 tests/i915/gem_ctx_create.c                 |  2 +-
 tests/i915/gem_ctx_engines.c                |  4 ++-
 tests/i915/gem_ctx_exec.c                   |  3 +++
 tests/i915/gem_ctx_freq.c                   |  3 +++
 tests/i915/gem_ctx_param.c                  |  2 +-
 tests/i915/gem_ctx_persistence.c            |  2 +-
 tests/i915/gem_ctx_shared.c                 |  3 +++
 tests/i915/gem_ctx_sseu.c                   |  2 +-
 tests/i915/gem_ctx_switch.c                 |  2 +-
 tests/i915/gem_eio.c                        |  3 +++
 tests/i915/gem_evict_alignment.c            |  2 +-
 tests/i915/gem_evict_everything.c           |  2 +-
 tests/i915/gem_exec_alignment.c             |  3 +++
 tests/i915/gem_exec_async.c                 |  2 +-
 tests/i915/gem_exec_await.c                 |  2 +-
 tests/i915/gem_exec_balancer.c              |  3 +++
 tests/i915/gem_exec_basic.c                 |  2 +-
 tests/i915/gem_exec_big.c                   |  2 +-
 tests/i915/gem_exec_capture.c               |  2 +-
 tests/i915/gem_exec_create.c                |  2 +-
 tests/i915/gem_exec_endless.c               |  3 +++
 tests/i915/gem_exec_fair.c                  |  2 +-
 tests/i915/gem_exec_fence.c                 |  2 +-
 tests/i915/gem_exec_flush.c                 |  2 +-
 tests/i915/gem_exec_gttfill.c               |  4 +--
 tests/i915/gem_exec_latency.c               |  2 +-
 tests/i915/gem_exec_nop.c                   |  2 +-
 tests/i915/gem_exec_parallel.c              |  2 +-
 tests/i915/gem_exec_params.c                |  2 +-
 tests/i915/gem_exec_reloc.c                 |  2 +-
 tests/i915/gem_exec_schedule.c              |  2 +-
 tests/i915/gem_exec_store.c                 |  2 +-
 tests/i915/gem_exec_suspend.c               |  2 +-
 tests/i915/gem_exec_whisper.c               |  2 +-
 tests/i915/gem_exercise_blt.c               |  2 +-
 tests/i915/gem_fd_exhaustion.c              |  2 +-
 tests/i915/gem_fence_thrash.c               |  3 ++-
 tests/i915/gem_fenced_exec_thrash.c         |  2 +-
 tests/i915/gem_flink_basic.c                |  7 +++--
 tests/i915/gem_flink_race.c                 |  6 ++---
 tests/i915/gem_gtt_cpu_tlb.c                |  2 +-
 tests/i915/gem_gtt_hog.c                    |  2 +-
 tests/i915/gem_gtt_speed.c                  |  2 +-
 tests/i915/gem_huc_copy.c                   |  2 +-
 tests/i915/gem_lmem_evict.c                 |  4 +--
 tests/i915/gem_lmem_swapping.c              |  4 +--
 tests/i915/gem_madvise.c                    | 12 ++++-----
 tests/i915/gem_media_fill.c                 |  2 +-
 tests/i915/gem_mmap.c                       |  2 +-
 tests/i915/gem_mmap_gtt.c                   |  2 +-
 tests/i915/gem_mmap_offset.c                |  2 +-
 tests/i915/gem_mmap_wc.c                    |  2 +-
 tests/i915/gem_partial_pwrite_pread.c       |  2 +-
 tests/i915/gem_pipe_control_store_loop.c    |  2 +-
 tests/i915/gem_ppgtt.c                      |  8 +++---
 tests/i915/gem_pread.c                      |  2 +-
 tests/i915/gem_pread_after_blit.c           |  2 +-
 tests/i915/gem_pwrite.c                     |  2 +-
 tests/i915/gem_pwrite_snooped.c             |  2 +-
 tests/i915/gem_pxp.c                        |  2 +-
 tests/i915/gem_read_read_speed.c            |  2 +-
 tests/i915/gem_readwrite.c                  |  2 +-
 tests/i915/gem_reg_read.c                   |  2 +-
 tests/i915/gem_render_copy.c                |  2 +-
 tests/i915/gem_render_copy_redux.c          |  2 +-
 tests/i915/gem_reset_stats.c                |  2 +-
 tests/i915/gem_ringfill.c                   |  2 +-
 tests/i915/gem_set_tiling_vs_blt.c          |  2 +-
 tests/i915/gem_set_tiling_vs_gtt.c          |  2 +-
 tests/i915/gem_set_tiling_vs_pwrite.c       |  2 +-
 tests/i915/gem_shrink.c                     | 14 +++++-----
 tests/i915/gem_softpin.c                    |  2 +-
 tests/i915/gem_spin_batch.c                 |  2 +-
 tests/i915/gem_streaming_writes.c           |  2 +-
 tests/i915/gem_stress.c                     |  2 +-
 tests/i915/gem_sync.c                       |  2 +-
 tests/i915/gem_tiled_blits.c                |  2 +-
 tests/i915/gem_tiled_fence_blits.c          |  2 +-
 tests/i915/gem_tiled_partial_pwrite_pread.c |  2 +-
 tests/i915/gem_tiled_pread_basic.c          |  2 +-
 tests/i915/gem_tiled_pread_pwrite.c         |  2 +-
 tests/i915/gem_tiled_swapping.c             |  2 +-
 tests/i915/gem_tiled_wb.c                   |  2 +-
 tests/i915/gem_tiled_wc.c                   |  2 +-
 tests/i915/gem_tiling_max_stride.c          |  2 +-
 tests/i915/gem_unfence_active_buffers.c     |  2 +-
 tests/i915/gem_unref_active_buffers.c       |  2 +-
 tests/i915/gem_userptr_blits.c              |  7 +++--
 tests/i915/gem_vm_create.c                  |  2 +-
 tests/i915/gem_wait.c                       |  2 +-
 tests/i915/gem_watchdog.c                   |  2 +-
 tests/i915/gem_workarounds.c                |  3 +++
 tests/i915/gen7_exec_parse.c                |  4 +--
 tests/i915/gen9_exec_parse.c                |  2 +-
 tests/i915/i915_fb_tiling.c                 |  2 +-
 tests/i915/i915_getparams_basic.c           |  2 +-
 tests/i915/i915_hangman.c                   |  4 +--
 tests/i915/i915_hwmon.c                     |  2 +-
 tests/i915/i915_module_load.c               |  8 +++---
 tests/i915/i915_pciid.c                     |  2 +-
 tests/i915/i915_pm_backlight.c              |  2 +-
 tests/i915/i915_pm_dc.c                     |  2 +-
 tests/i915/i915_pm_freq_api.c               |  2 +-
 tests/i915/i915_pm_freq_mult.c              |  2 +-
 tests/i915/i915_pm_lpsp.c                   |  2 +-
 tests/i915/i915_pm_rc6_residency.c          |  2 +-
 tests/i915/i915_pm_rpm.c                    |  2 +-
 tests/i915/i915_pm_rps.c                    |  5 +++-
 tests/i915/i915_pm_sseu.c                   |  2 +-
 tests/i915/i915_power.c                     |  2 +-
 tests/i915/i915_query.c                     |  2 +-
 tests/i915/i915_suspend.c                   |  4 +--
 tests/i915/kms_big_fb.c                     |  2 +-
 tests/i915/kms_big_joiner.c                 |  2 +-
 tests/i915/kms_busy.c                       |  2 +-
 tests/i915/kms_ccs.c                        |  2 +-
 tests/i915/kms_cdclk.c                      |  2 +-
 tests/i915/kms_draw_crc.c                   |  2 +-
 tests/i915/kms_dsc.c                        |  2 +-
 tests/i915/kms_fbcon_fbt.c                  |  2 +-
 tests/i915/kms_fence_pin_leak.c             |  2 +-
 tests/i915/kms_flip_scaled_crc.c            |  2 +-
 tests/i915/kms_flip_tiling.c                |  2 +-
 tests/i915/kms_frontbuffer_tracking.c       |  2 +-
 tests/i915/kms_legacy_colorkey.c            |  2 +-
 tests/i915/kms_mmap_write_crc.c             |  3 +--
 tests/i915/kms_pipe_b_c_ivb.c               |  2 +-
 tests/i915/kms_psr.c                        |  2 +-
 tests/i915/kms_psr2_sf.c                    |  2 +-
 tests/i915/kms_psr2_su.c                    |  2 +-
 tests/i915/kms_psr_stress_test.c            |  2 +-
 tests/i915/kms_pwrite_crc.c                 |  2 +-
 tests/i915/perf.c                           |  4 +--
 tests/i915/perf_pmu.c                       |  6 ++---
 tests/i915/sysfs_defaults.c                 |  2 +-
 tests/i915/sysfs_heartbeat_interval.c       |  2 +-
 tests/i915/sysfs_preempt_timeout.c          |  2 +-
 tests/i915/sysfs_timeslice_duration.c       |  2 +-
 tests/kms_3d.c                              |  2 +-
 tests/kms_addfb_basic.c                     |  4 +--
 tests/kms_async_flips.c                     |  2 +-
 tests/kms_atomic.c                          |  2 +-
 tests/kms_atomic_interruptible.c            |  2 +-
 tests/kms_atomic_transition.c               |  2 +-
 tests/kms_color.c                           |  2 +-
 tests/kms_concurrent.c                      |  2 +-
 tests/kms_content_protection.c              |  2 +-
 tests/kms_cursor_crc.c                      |  2 +-
 tests/kms_cursor_edge_walk.c                |  2 +-
 tests/kms_cursor_legacy.c                   |  2 +-
 tests/kms_dither.c                          |  2 +-
 tests/kms_dp_aux_dev.c                      |  2 +-
 tests/kms_dp_tiled_display.c                |  2 +-
 tests/kms_flip.c                            |  2 +-
 tests/kms_flip_event_leak.c                 |  4 +--
 tests/kms_force_connector_basic.c           |  4 +--
 tests/kms_getfb.c                           |  4 +--
 tests/kms_hdmi_inject.c                     |  2 +-
 tests/kms_hdr.c                             |  2 +-
 tests/kms_invalid_mode.c                    |  2 +-
 tests/kms_lease.c                           |  4 +--
 tests/kms_panel_fitting.c                   |  2 +-
 tests/kms_pipe_crc_basic.c                  |  2 +-
 tests/kms_plane.c                           |  2 +-
 tests/kms_plane_alpha_blend.c               |  2 +-
 tests/kms_plane_cursor.c                    |  2 +-
 tests/kms_plane_lowres.c                    |  2 +-
 tests/kms_plane_multiple.c                  |  2 +-
 tests/kms_plane_scaling.c                   |  2 +-
 tests/kms_prime.c                           |  6 ++---
 tests/kms_prop_blob.c                       |  8 +++---
 tests/kms_properties.c                      |  2 +-
 tests/kms_rmfb.c                            |  4 +--
 tests/kms_rotation_crc.c                    |  2 +-
 tests/kms_scaling_modes.c                   |  2 +-
 tests/kms_sequence.c                        |  2 +-
 tests/kms_setmode.c                         |  2 +-
 tests/kms_tv_load_detect.c                  |  2 +-
 tests/kms_universal_plane.c                 |  2 +-
 tests/kms_vblank.c                          |  2 +-
 tests/kms_vrr.c                             |  1 +
 tests/kms_writeback.c                       |  1 +
 tests/nouveau_crc.c                         |  6 +++--
 tests/panfrost_gem_new.c                    |  4 +--
 tests/panfrost_get_param.c                  |  2 +-
 tests/panfrost_prime.c                      |  4 +--
 tests/panfrost_submit.c                     |  6 ++---
 tests/prime_busy.c                          |  2 +-
 tests/prime_mmap.c                          |  2 +-
 tests/prime_mmap_coherency.c                |  4 +--
 tests/prime_mmap_kms.c                      |  2 +-
 tests/prime_self_import.c                   | 26 +++++++++---------
 tests/prime_vgem.c                          |  4 +--
 tests/syncobj_basic.c                       |  2 +-
 tests/syncobj_timeline.c                    |  2 +-
 tests/syncobj_wait.c                        |  2 +-
 tests/template.c                            |  2 +-
 tests/testdisplay.c                         |  4 +--
 tests/v3d/v3d_create_bo.c                   |  4 +--
 tests/v3d/v3d_get_bo_offset.c               |  2 +-
 tests/v3d/v3d_get_param.c                   |  2 +-
 tests/v3d/v3d_job_submission.c              |  2 +-
 tests/v3d/v3d_mmap.c                        |  2 +-
 tests/v3d/v3d_perfmon.c                     |  2 +-
 tests/v3d/v3d_submit_cl.c                   |  2 +-
 tests/v3d/v3d_submit_csd.c                  |  2 +-
 tests/v3d/v3d_wait_bo.c                     |  2 +-
 tests/vc4/vc4_create_bo.c                   |  4 +--
 tests/vc4/vc4_dmabuf_poll.c                 |  2 +-
 tests/vc4/vc4_label_bo.c                    |  2 +-
 tests/vc4/vc4_lookup_fail.c                 |  2 +-
 tests/vc4/vc4_mmap.c                        |  2 +-
 tests/vc4/vc4_perfmon.c                     |  2 +-
 tests/vc4/vc4_purgeable_bo.c                |  2 +-
 tests/vc4/vc4_tiling.c                      |  2 +-
 tests/vc4/vc4_wait_bo.c                     |  2 +-
 tests/vc4/vc4_wait_seqno.c                  |  2 +-
 tests/vgem_basic.c                          |  6 ++---
 tests/vgem_slow.c                           |  2 +-
 tests/vmwgfx/vmw_execution_buffer.c         |  2 +-
 tests/vmwgfx/vmw_ref_count.c                |  4 +--
 tests/vmwgfx/vmw_surface_copy.c             |  2 +-
 tests/xe/xe_compute.c                       |  2 +-
 tests/xe/xe_create.c                        |  2 +-
 tests/xe/xe_debugfs.c                       |  2 +-
 tests/xe/xe_dma_buf_sync.c                  |  4 +--
 tests/xe/xe_evict.c                         |  6 ++---
 tests/xe/xe_exec_balancer.c                 |  2 +-
 tests/xe/xe_exec_basic.c                    |  2 +-
 tests/xe/xe_exec_compute_mode.c             |  2 +-
 tests/xe/xe_exec_fault_mode.c               |  2 +-
 tests/xe/xe_exec_reset.c                    |  8 +++---
 tests/xe/xe_exec_threads.c                  |  8 +++---
 tests/xe/xe_guc_pc.c                        |  2 +-
 tests/xe/xe_huc_copy.c                      |  2 +-
 tests/xe/xe_intel_bb.c                      |  2 +-
 tests/xe/xe_mmap.c                          |  2 +-
 tests/xe/xe_mmio.c                          |  2 +-
 tests/xe/xe_module_load.c                   |  2 +-
 tests/xe/xe_noexec_ping_pong.c              |  2 +-
 tests/xe/xe_pm.c                            |  2 +-
 tests/xe/xe_prime_self_import.c             | 30 ++++++++++-----------
 tests/xe/xe_query.c                         |  2 +-
 tests/xe/xe_vm.c                            |  2 +-
 tests/xe/xe_waitfence.c                     |  2 +-
 288 files changed, 436 insertions(+), 375 deletions(-)

diff --git a/lib/igt_msm.c b/lib/igt_msm.c
index 8c0380f42..a236898b6 100644
--- a/lib/igt_msm.c
+++ b/lib/igt_msm.c
@@ -87,7 +87,7 @@ igt_msm_dev_close(struct msm_device *dev)
 {
 	if (!dev)
 		return;
-	close(dev->fd);
+	drm_close_driver(dev->fd);
 	free(dev);
 }
 
diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index 9400ed806..082da7ed6 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -378,5 +378,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&data.display);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/amdgpu/amd_assr.c b/tests/amdgpu/amd_assr.c
index 80cbbe8e9..fc2367f99 100644
--- a/tests/amdgpu/amd_assr.c
+++ b/tests/amdgpu/amd_assr.c
@@ -299,5 +299,6 @@ igt_main
 	igt_fixture
 	{
 		igt_display_fini(&data.display);
+		drm_close_driver(data.fd);
 	}
 }
diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 38525a85e..f7d7f036f 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -696,6 +696,6 @@ igt_main
 
 	igt_fixture {
 		amdgpu_device_deinitialize(device);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c
index ea3f6aae8..323c1b16a 100644
--- a/tests/amdgpu/amd_cs_nop.c
+++ b/tests/amdgpu/amd_cs_nop.c
@@ -239,6 +239,6 @@ igt_main
 	igt_fixture {
 		amdgpu_cs_ctx_free(context);
 		amdgpu_device_deinitialize(device);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index df650c921..d805b8d18 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -118,6 +118,6 @@ igt_main
 
 	igt_fixture {
 		amdgpu_device_deinitialize(device);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/amdgpu/amd_freesync_video_mode.c b/tests/amdgpu/amd_freesync_video_mode.c
index 579d24436..62d42a06c 100644
--- a/tests/amdgpu/amd_freesync_video_mode.c
+++ b/tests/amdgpu/amd_freesync_video_mode.c
@@ -868,5 +868,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&data.display);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/amdgpu/amd_info.c b/tests/amdgpu/amd_info.c
index d6aea827b..c1137ab4d 100644
--- a/tests/amdgpu/amd_info.c
+++ b/tests/amdgpu/amd_info.c
@@ -154,6 +154,6 @@ igt_main
 
 	igt_fixture {
 		amdgpu_device_deinitialize(dev);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/amdgpu/amd_mem_leak.c b/tests/amdgpu/amd_mem_leak.c
index dee563cbe..e4a4b5c47 100644
--- a/tests/amdgpu/amd_mem_leak.c
+++ b/tests/amdgpu/amd_mem_leak.c
@@ -232,5 +232,6 @@ igt_main
 	igt_fixture
 	{
 		igt_display_fini(&data.display);
+		drm_close_driver(data.fd);
 	}
 }
diff --git a/tests/amdgpu/amd_module_load.c b/tests/amdgpu/amd_module_load.c
index 77df96d50..cbc9106f6 100644
--- a/tests/amdgpu/amd_module_load.c
+++ b/tests/amdgpu/amd_module_load.c
@@ -54,7 +54,7 @@ static void sanity_check(void)
 		err = -errno;
 
 	igt_set_timeout(0, NULL);
-	close(fd);
+	drm_close_driver(fd);
 
 	igt_assert_eq(err, 0);
 }
diff --git a/tests/amdgpu/amd_prime.c b/tests/amdgpu/amd_prime.c
index 62924f15b..6916c3173 100644
--- a/tests/amdgpu/amd_prime.c
+++ b/tests/amdgpu/amd_prime.c
@@ -166,7 +166,7 @@ static void amd_plug(amdgpu_device_handle device, struct cork *c)
 static void unplug(struct cork *c)
 {
 	vgem_fence_signal(c->device, c->fence);
-	close(c->device);
+	drm_close_driver(c->device);
 }
 
 static void i915_to_amd(int i915, int amd, amdgpu_device_handle device)
@@ -461,7 +461,7 @@ igt_main
 
 	igt_fixture {
 		amdgpu_device_deinitialize(device);
-		close(amd);
-		close(i915);
+		drm_close_driver(amd);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
index 966a0dccf..bca3c6449 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -640,7 +640,7 @@ static void run_check_psr_su_cursor(data_t *data, bool test_mpo)
 	 * panning the primary plane at the top-left of screen
 	 * set alpha region in overlay plane and set alpha to 0.0 to show primary plane
 	 * set cursor plane and starting from position of (0, 0)
-	 */ 
+	 */
 	draw_color_alpha(&data->ov_fb[0], 0, 0, data->pfb_w, data->pfb_h, 1.0, 1.0, 1.0, .0);
 	igt_plane_set_fb(data->primary, &data->pm_fb[0]);
 	igt_plane_set_fb(data->overlay, &data->ov_fb[0]);
@@ -761,7 +761,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 			igt_require_f(igt_amd_set_visual_confirm(data.fd, VISUAL_CONFIRM_DISABLE),
 				      "reset PSR visual confirm option failed\n");
 		}
-		close(data.debugfs_fd);
 		igt_display_fini(&data.display);
+		drm_close_driver(data.debugfs_fd);
 	}
 }
diff --git a/tests/amdgpu/amd_vrr_range.c b/tests/amdgpu/amd_vrr_range.c
index 2f27296dd..cacd668cd 100644
--- a/tests/amdgpu/amd_vrr_range.c
+++ b/tests/amdgpu/amd_vrr_range.c
@@ -338,5 +338,6 @@ igt_main
 	igt_fixture
 	{
 		igt_display_fini(&data.display);
+		drm_close_driver(data.fd);
 	}
 }
diff --git a/tests/chamelium/kms_chamelium_audio.c b/tests/chamelium/kms_chamelium_audio.c
index 6c6177fc5..8fbc1f80e 100644
--- a/tests/chamelium/kms_chamelium_audio.c
+++ b/tests/chamelium/kms_chamelium_audio.c
@@ -870,6 +870,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/chamelium/kms_chamelium_edid.c b/tests/chamelium/kms_chamelium_edid.c
index 7e7262ed3..a650efe16 100644
--- a/tests/chamelium/kms_chamelium_edid.c
+++ b/tests/chamelium/kms_chamelium_edid.c
@@ -558,6 +558,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/chamelium/kms_chamelium_frames.c b/tests/chamelium/kms_chamelium_frames.c
index 008bc34b6..56c985b1a 100644
--- a/tests/chamelium/kms_chamelium_frames.c
+++ b/tests/chamelium/kms_chamelium_frames.c
@@ -1080,6 +1080,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_chamelium_hpd.c
index 2b17ce29d..f700673b3 100644
--- a/tests/chamelium/kms_chamelium_hpd.c
+++ b/tests/chamelium/kms_chamelium_hpd.c
@@ -525,6 +525,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/core_auth.c b/tests/core_auth.c
index 257f12482..110163b00 100644
--- a/tests/core_auth.c
+++ b/tests/core_auth.c
@@ -189,7 +189,7 @@ static void test_basic_auth(int master)
 	igt_assert(drmGetMagic(slave, &magic) == 0);
 	igt_assert_eq(magic, old_magic);
 
-	close(slave);
+	drm_close_driver(slave);
 }
 
 igt_main
@@ -201,7 +201,7 @@ igt_main
 
 		igt_assert(check_auth(fd) == true);
 
-		close(fd);
+		drm_close_driver(fd);
 	}
 
 	igt_describe("Use 2 clients, check second is authenticated even when first dropped.");
@@ -211,11 +211,11 @@ igt_main
 
 		igt_assert(check_auth(fd2) == true);
 
-		close(fd);
+		drm_close_driver(fd);
 
 		igt_assert(check_auth(fd2) == true);
 
-		close(fd2);
+		drm_close_driver(fd2);
 	}
 
 	/* above tests require that no drm fd is open */
@@ -224,7 +224,7 @@ igt_main
 
 		igt_fixture
 			master = drm_open_driver_master(DRIVER_ANY);
-	
+
 		igt_describe("Test magic numbers for master and slave.");
 		igt_subtest("basic-auth")
 			test_basic_auth(master);
diff --git a/tests/core_getclient.c b/tests/core_getclient.c
index 40a1c194d..9e53c46f9 100644
--- a/tests/core_getclient.c
+++ b/tests/core_getclient.c
@@ -58,5 +58,5 @@ igt_simple_main
 	ret = ioctl(fd, DRM_IOCTL_GET_CLIENT, &client);
 	igt_assert(ret == -1 && errno == EINVAL);
 
-	close(fd);
+	drm_close_driver(fd);
 }
diff --git a/tests/core_getstats.c b/tests/core_getstats.c
index fde27cdc6..c68b6b559 100644
--- a/tests/core_getstats.c
+++ b/tests/core_getstats.c
@@ -52,5 +52,5 @@ igt_simple_main
 	ret = ioctl(fd, DRM_IOCTL_GET_STATS, &stats);
 	igt_assert(ret == 0);
 
-	close(fd);
+	drm_close_driver(fd);
 }
diff --git a/tests/core_getversion.c b/tests/core_getversion.c
index f6953b313..0c2949f18 100644
--- a/tests/core_getversion.c
+++ b/tests/core_getversion.c
@@ -46,5 +46,5 @@ igt_simple_main
 		igt_assert_lte(1, v->version_major);
 
 	drmFree(v);
-	close(fd);
+	drm_close_driver(fd);
 }
diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
index 470f9441d..30348dd62 100644
--- a/tests/core_setmaster.c
+++ b/tests/core_setmaster.c
@@ -85,7 +85,7 @@ static void check_drop_set(void)
 	igt_assert_eq(drmDropMaster(master), 0);
 	igt_assert_eq(drmSetMaster(master), 0);
 
-	close(master);
+	drm_close_driver(master);
 }
 
 static unsigned tweak_perm(uint8_t *saved_perm, unsigned max_perm, bool save)
@@ -206,10 +206,10 @@ igt_main
 			igt_assert_eq(drmSetMaster(master), -1);
 			igt_assert_eq(errno, EACCES);
 
-			close(master);
+			drm_close_driver(master);
 		}
 		igt_waitchildren();
 
-		close(master);
+		drm_close_driver(master);
 	}
 }
diff --git a/tests/core_setmaster_vs_auth.c b/tests/core_setmaster_vs_auth.c
index 0b4b8613c..da4662e0a 100644
--- a/tests/core_setmaster_vs_auth.c
+++ b/tests/core_setmaster_vs_auth.c
@@ -66,7 +66,7 @@ igt_simple_main
 	igt_assert_neq(drmAuthMagic(master2, magic), 0);
 	igt_assert_eq(errno, EINVAL);
 
-	close(client);
-	close(master2);
-	close(master1);
+	drm_close_driver(client);
+	drm_close_driver(master2);
+	drm_close_driver(master1);
 }
diff --git a/tests/debugfs_test.c b/tests/debugfs_test.c
index 8c775158f..b45646d70 100644
--- a/tests/debugfs_test.c
+++ b/tests/debugfs_test.c
@@ -213,6 +213,6 @@ igt_main
 	igt_fixture {
 		close(sysfs);
 		close(debugfs);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/dmabuf_sync_file.c b/tests/dmabuf_sync_file.c
index 25bb6ad75..cfa73117b 100644
--- a/tests/dmabuf_sync_file.c
+++ b/tests/dmabuf_sync_file.c
@@ -380,4 +380,7 @@ igt_main
 		     "operations.");
 	igt_subtest("import-multiple-read-write")
 		test_import_multiple(fd, true);
+
+	igt_fixture
+		drm_close_driver(fd);
 }
diff --git a/tests/drm_read.c b/tests/drm_read.c
index 36dc623ed..e989e7bfb 100644
--- a/tests/drm_read.c
+++ b/tests/drm_read.c
@@ -311,4 +311,7 @@ igt_main
 
 	igt_subtest("short-buffer-wakeup")
 		test_short_buffer_wakeup(fd, pipe);
+
+	igt_fixture
+		drm_close_driver(fd);
 }
diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
index ded6b809c..8aa320a59 100644
--- a/tests/dumb_buffer.c
+++ b/tests/dumb_buffer.c
@@ -394,6 +394,6 @@ igt_main
 		always_clear(fd, 30);
 
 	igt_fixture {
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/eviction_common.c b/tests/eviction_common.c
index 95af106c1..5948fbc64 100644
--- a/tests/eviction_common.c
+++ b/tests/eviction_common.c
@@ -300,7 +300,7 @@ static int forking_evictions(int fd, struct igt_eviction_test_ops *ops,
 
 		/* drmfd closing will take care of additional bo refs */
 		if (flags & FORKING_EVICTIONS_DUP_DRMFD)
-			close(realfd);
+			drm_close_driver(realfd);
 	}
 
 	igt_waitchildren();
diff --git a/tests/fbdev.c b/tests/fbdev.c
index 794882a6a..154e78b0f 100644
--- a/tests/fbdev.c
+++ b/tests/fbdev.c
@@ -443,6 +443,6 @@ igt_main
 	}
 
 	igt_fixture {
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/api_intel_allocator.c b/tests/i915/api_intel_allocator.c
index e9039a214..83acc306f 100644
--- a/tests/i915/api_intel_allocator.c
+++ b/tests/i915/api_intel_allocator.c
@@ -847,5 +847,5 @@ igt_main
 		gem_pool(fd);
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/api_intel_bb.c b/tests/i915/api_intel_bb.c
index 46633b038..da74e1ed3 100644
--- a/tests/i915/api_intel_bb.c
+++ b/tests/i915/api_intel_bb.c
@@ -1701,6 +1701,6 @@ igt_main_args("dpibc:", NULL, help_str, opt_handler, NULL)
 
 	igt_fixture {
 		buf_ops_destroy(bops);
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/drm_fdinfo.c b/tests/i915/drm_fdinfo.c
index 1b1247553..c8437dc0b 100644
--- a/tests/i915/drm_fdinfo.c
+++ b/tests/i915/drm_fdinfo.c
@@ -855,6 +855,6 @@ igt_main
 
 	igt_fixture {
 		intel_ctx_destroy(i915, ctx);
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/gem_bad_reloc.c b/tests/i915/gem_bad_reloc.c
index 478e78a66..fc1c6a574 100644
--- a/tests/i915/gem_bad_reloc.c
+++ b/tests/i915/gem_bad_reloc.c
@@ -212,5 +212,5 @@ igt_main
 		negative_reloc_blt(fd);
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_barrier_race.c b/tests/i915/gem_barrier_race.c
index f446aab62..52f4eef39 100644
--- a/tests/i915/gem_barrier_race.c
+++ b/tests/i915/gem_barrier_race.c
@@ -153,4 +153,7 @@ igt_main
 			break;
 		}
 	}
+
+	igt_fixture
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_basic.c b/tests/i915/gem_basic.c
index 3dd790c6c..edcc6d443 100644
--- a/tests/i915/gem_basic.c
+++ b/tests/i915/gem_basic.c
@@ -108,7 +108,7 @@ igt_main
 			gpu_fd = __drm_open_driver_another(child, DRIVER_INTEL);
 			igt_assert_f(gpu_fd > 0, "cannot open gpu-%d, errno=%d\n", child, errno);
 			test_create_close(gpu_fd);
-			close(gpu_fd);
+			drm_close_driver(gpu_fd);
 		}
 
 		igt_waitchildren();
@@ -117,4 +117,7 @@ igt_main
 	igt_describe("Verify that closing drm driver is possible with opened gem object.");
 	igt_subtest("create-fd-close")
 		test_create_fd_close(fd);
+
+	igt_fixture
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_blits.c b/tests/i915/gem_blits.c
index 5fbb384db..5ac0bfdc3 100644
--- a/tests/i915/gem_blits.c
+++ b/tests/i915/gem_blits.c
@@ -893,6 +893,6 @@ igt_main
 
 	igt_fixture {
 		put_ahnd(device.ahnd);
-		close(device.fd);
+		drm_close_driver(device.fd);
 	}
 }
diff --git a/tests/i915/gem_busy.c b/tests/i915/gem_busy.c
index 08a500a9e..70ba1999f 100644
--- a/tests/i915/gem_busy.c
+++ b/tests/i915/gem_busy.c
@@ -562,6 +562,6 @@ igt_main
 
 	igt_fixture {
 		intel_ctx_destroy(fd, ctx);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_caching.c b/tests/i915/gem_caching.c
index 6e944f0ac..16c594aa6 100644
--- a/tests/i915/gem_caching.c
+++ b/tests/i915/gem_caching.c
@@ -340,6 +340,6 @@ igt_main
 		intel_buf_destroy(scratch_buf);
 		intel_buf_destroy(staging_buf);
 		buf_ops_destroy(data.bops);
-		close(data.fd);
+		drm_close_driver(data.fd);
 	}
 }
diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
index d25e00fc8..4a1ae094d 100644
--- a/tests/i915/gem_ccs.c
+++ b/tests/i915/gem_ccs.c
@@ -731,6 +731,6 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 
 	igt_fixture {
 		igt_disallow_hang(i915, hang);
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/gem_close_race.c b/tests/i915/gem_close_race.c
index 9c646f426..c1cbf0f90 100644
--- a/tests/i915/gem_close_race.c
+++ b/tests/i915/gem_close_race.c
@@ -274,7 +274,7 @@ static void multigpu_threads(int timeout, unsigned int flags, int gpu_count)
 
 		igt_waitchildren();
 		gem_quiescent_gpu(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 
 	igt_waitchildren();
@@ -293,7 +293,7 @@ static void threads(int timeout, unsigned int flags)
 	igt_waitchildren();
 
 	gem_quiescent_gpu(fd);
-	close(fd);
+	drm_close_driver(fd);
 }
 
 igt_main
@@ -317,7 +317,7 @@ igt_main
 		gpu_count = igt_device_filter_count();
 
 		igt_fork_hang_detector(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 
 	igt_describe("Basic workload submission.");
@@ -329,7 +329,7 @@ igt_main
 		igt_waitchildren();
 
 		gem_quiescent_gpu(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 
 	igt_describe("Basic workload submission on multi-GPU machine.");
@@ -342,7 +342,7 @@ igt_main
 			igt_assert(fd > 0);
 			process(fd, child);
 			gem_quiescent_gpu(fd);
-			close(fd);
+			drm_close_driver(fd);
 		}
 
 		igt_waitchildren();
@@ -369,7 +369,7 @@ igt_main
 		igt_waitchildren();
 
 		gem_quiescent_gpu(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 
 	igt_describe("Share buffer handle across different drm fd's and trying to race"
diff --git a/tests/i915/gem_concurrent_all.c b/tests/i915/gem_concurrent_all.c
index 25b7daf86..e1351c368 100644
--- a/tests/i915/gem_concurrent_all.c
+++ b/tests/i915/gem_concurrent_all.c
@@ -2015,4 +2015,9 @@ igt_main
 			}
 		}
 	}
+
+	igt_fixture {
+		drm_close_driver(fd);
+		drm_close_driver(vgem_drv);
+	}
 }
diff --git a/tests/i915/gem_cs_tlb.c b/tests/i915/gem_cs_tlb.c
index 2117b41e4..ff96e63ed 100644
--- a/tests/i915/gem_cs_tlb.c
+++ b/tests/i915/gem_cs_tlb.c
@@ -162,5 +162,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_ctx_bad_destroy.c b/tests/i915/gem_ctx_bad_destroy.c
index 50bb9aa07..5dc6d040d 100644
--- a/tests/i915/gem_ctx_bad_destroy.c
+++ b/tests/i915/gem_ctx_bad_destroy.c
@@ -80,5 +80,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_ctx_create.c b/tests/i915/gem_ctx_create.c
index 39f070af9..f0ef447e3 100644
--- a/tests/i915/gem_ctx_create.c
+++ b/tests/i915/gem_ctx_create.c
@@ -667,6 +667,6 @@ igt_main
 
 	igt_fixture {
 		igt_stop_hang_detector();
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
index b87a21fa4..3daed16a0 100644
--- a/tests/i915/gem_ctx_engines.c
+++ b/tests/i915/gem_ctx_engines.c
@@ -633,6 +633,8 @@ igt_main
 			independent_all(i915, ctx);
 	}
 
-	igt_fixture
+	igt_fixture {
 		igt_stop_hang_detector();
+		drm_close_driver(i915);
+	}
 }
diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c
index 3d94f01db..ec36f0040 100644
--- a/tests/i915/gem_ctx_exec.c
+++ b/tests/i915/gem_ctx_exec.c
@@ -546,4 +546,7 @@ igt_main
 		gem_context_destroy(fd, ctx_id);
 		put_ahnd(ahnd);
 	}
+
+	igt_fixture
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_ctx_freq.c b/tests/i915/gem_ctx_freq.c
index 18e736c73..ce4c0ba55 100644
--- a/tests/i915/gem_ctx_freq.c
+++ b/tests/i915/gem_ctx_freq.c
@@ -213,4 +213,7 @@ igt_main
 
 	igt_subtest_f("sysfs")
 		sysfs_range(i915);
+
+	igt_fixture
+		drm_close_driver(i915);
 }
diff --git a/tests/i915/gem_ctx_param.c b/tests/i915/gem_ctx_param.c
index d119ea74e..6fa2e6161 100644
--- a/tests/i915/gem_ctx_param.c
+++ b/tests/i915/gem_ctx_param.c
@@ -473,5 +473,5 @@ igt_main
 		test_get_invalid_param(fd, I915_CONTEXT_PARAM_ENGINES);
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
index 9fb528186..fabb41e66 100644
--- a/tests/i915/gem_ctx_persistence.c
+++ b/tests/i915/gem_ctx_persistence.c
@@ -1383,6 +1383,6 @@ igt_main
 	}
 
 	igt_fixture {
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
index 3d73db581..e7006f55f 100644
--- a/tests/i915/gem_ctx_shared.c
+++ b/tests/i915/gem_ctx_shared.c
@@ -1088,4 +1088,7 @@ igt_main
 			igt_stop_hang_detector();
 		}
 	}
+
+	igt_fixture
+		drm_close_driver(i915);
 }
diff --git a/tests/i915/gem_ctx_sseu.c b/tests/i915/gem_ctx_sseu.c
index 7685511f0..dcc38ae17 100644
--- a/tests/i915/gem_ctx_sseu.c
+++ b/tests/i915/gem_ctx_sseu.c
@@ -545,6 +545,6 @@ igt_main
 	}
 
 	igt_fixture {
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_ctx_switch.c b/tests/i915/gem_ctx_switch.c
index 4e46b7634..f675570ec 100644
--- a/tests/i915/gem_ctx_switch.c
+++ b/tests/i915/gem_ctx_switch.c
@@ -440,6 +440,6 @@ igt_main
 		igt_stop_hang_detector();
 		gem_close(fd, heavy);
 		gem_close(fd, light);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
index 8dbaa7a75..80eca558f 100644
--- a/tests/i915/gem_eio.c
+++ b/tests/i915/gem_eio.c
@@ -1126,4 +1126,7 @@ igt_main
 			intel_allocator_multiprocess_stop();
 		}
 	}
+
+	igt_fixture
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_evict_alignment.c b/tests/i915/gem_evict_alignment.c
index 0b560ab03..7a40b0128 100644
--- a/tests/i915/gem_evict_alignment.c
+++ b/tests/i915/gem_evict_alignment.c
@@ -265,6 +265,6 @@ igt_main
 
 	igt_fixture {
 		igt_stop_hang_helper();
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_evict_everything.c b/tests/i915/gem_evict_everything.c
index 120f89072..d5d464889 100644
--- a/tests/i915/gem_evict_everything.c
+++ b/tests/i915/gem_evict_everything.c
@@ -290,6 +290,6 @@ igt_main
 
 	igt_fixture {
 		igt_stop_hang_helper();
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_exec_alignment.c b/tests/i915/gem_exec_alignment.c
index a9fcd2a74..3084da5fc 100644
--- a/tests/i915/gem_exec_alignment.c
+++ b/tests/i915/gem_exec_alignment.c
@@ -546,4 +546,7 @@ igt_main
 		prio_inversion(fd, SHARED);
 	igt_subtest("pi-isolated")
 		prio_inversion(fd, ISOLATED);
+
+	igt_fixture
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_exec_async.c b/tests/i915/gem_exec_async.c
index 173bc4648..6895b9c6c 100644
--- a/tests/i915/gem_exec_async.c
+++ b/tests/i915/gem_exec_async.c
@@ -213,6 +213,6 @@ igt_main
 	igt_fixture {
 		igt_stop_hang_detector();
 		intel_ctx_destroy(fd, ctx);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_exec_await.c b/tests/i915/gem_exec_await.c
index 4935cf395..0fd8cbf67 100644
--- a/tests/i915/gem_exec_await.c
+++ b/tests/i915/gem_exec_await.c
@@ -287,6 +287,6 @@ igt_main
 	igt_fixture {
 		igt_stop_hang_detector();
 		intel_ctx_destroy(device, ctx);
-		close(device);
+		drm_close_driver(device);
 	}
 }
diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index 1c655e583..df16f8bec 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -3482,4 +3482,7 @@ igt_main
 		igt_subtest("nohangcheck")
 			nohangcheck(i915);
 	}
+
+	igt_fixture
+		drm_close_driver(i915);
 }
diff --git a/tests/i915/gem_exec_basic.c b/tests/i915/gem_exec_basic.c
index ca4fc7b96..c018d4089 100644
--- a/tests/i915/gem_exec_basic.c
+++ b/tests/i915/gem_exec_basic.c
@@ -98,6 +98,6 @@ igt_main
 		igt_collection_destroy(set);
 		igt_stop_hang_detector();
 		intel_ctx_destroy(fd, ctx);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_exec_big.c b/tests/i915/gem_exec_big.c
index 4619bda81..5a8df7264 100644
--- a/tests/i915/gem_exec_big.c
+++ b/tests/i915/gem_exec_big.c
@@ -326,5 +326,5 @@ igt_main
 		exhaustive(i915);
 
 	igt_fixture
-		close(i915);
+		drm_close_driver(i915);
 }
diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
index 9c391192d..56f5c6ba8 100644
--- a/tests/i915/gem_exec_capture.c
+++ b/tests/i915/gem_exec_capture.c
@@ -1013,6 +1013,6 @@ igt_main
 		close(dir);
 		igt_disallow_hang(fd, hang);
 		intel_ctx_destroy(fd, ctx);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_exec_create.c b/tests/i915/gem_exec_create.c
index 449aa5b2e..8ca564b09 100644
--- a/tests/i915/gem_exec_create.c
+++ b/tests/i915/gem_exec_create.c
@@ -225,6 +225,6 @@ igt_main
 
 	igt_fixture {
 		igt_stop_hang_detector();
-		close(device);
+		drm_close_driver(device);
 	}
 }
diff --git a/tests/i915/gem_exec_endless.c b/tests/i915/gem_exec_endless.c
index 77719de83..f895c6783 100644
--- a/tests/i915/gem_exec_endless.c
+++ b/tests/i915/gem_exec_endless.c
@@ -367,4 +367,7 @@ igt_main
 			intel_register_access_fini(&mmio);
 		}
 	}
+
+	igt_fixture
+		drm_close_driver(i915);
 }
diff --git a/tests/i915/gem_exec_fair.c b/tests/i915/gem_exec_fair.c
index 8208ab404..916686b55 100644
--- a/tests/i915/gem_exec_fair.c
+++ b/tests/i915/gem_exec_fair.c
@@ -1348,6 +1348,6 @@ igt_main
 
 	igt_fixture {
 		igt_stop_hang_detector();
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
index c2d874f84..799995865 100644
--- a/tests/i915/gem_exec_fence.c
+++ b/tests/i915/gem_exec_fence.c
@@ -3351,6 +3351,6 @@ igt_main
 	}
 
 	igt_fixture {
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/gem_exec_flush.c b/tests/i915/gem_exec_flush.c
index 42ddbc529..6a156c5c5 100644
--- a/tests/i915/gem_exec_flush.c
+++ b/tests/i915/gem_exec_flush.c
@@ -711,6 +711,6 @@ igt_main
 
 	igt_fixture {
 		igt_stop_hang_detector();
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_exec_gttfill.c b/tests/i915/gem_exec_gttfill.c
index d6c8f2192..320b47001 100644
--- a/tests/i915/gem_exec_gttfill.c
+++ b/tests/i915/gem_exec_gttfill.c
@@ -279,7 +279,7 @@ igt_main
 			// release resources
 			igt_stop_hang_detector();
 			intel_ctx_destroy(g_fd, ctx);
-			close(g_fd);
+			drm_close_driver(g_fd);
 		}
 
 		igt_waitchildren();
@@ -287,6 +287,6 @@ igt_main
 
 	igt_fixture {
 		intel_allocator_multiprocess_stop();
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/gem_exec_latency.c b/tests/i915/gem_exec_latency.c
index 4838a7082..d344db05e 100644
--- a/tests/i915/gem_exec_latency.c
+++ b/tests/i915/gem_exec_latency.c
@@ -971,6 +971,6 @@ igt_main
 	igt_fixture {
 		intel_register_access_fini(&mmio_data);
 		intel_ctx_destroy(device, ctx);
-		close(device);
+		drm_close_driver(device);
 	}
 }
diff --git a/tests/i915/gem_exec_nop.c b/tests/i915/gem_exec_nop.c
index 497f57f08..77c3aea54 100644
--- a/tests/i915/gem_exec_nop.c
+++ b/tests/i915/gem_exec_nop.c
@@ -1083,6 +1083,6 @@ igt_main
 		igt_stop_hang_detector();
 		gem_close(device, handle);
 		intel_ctx_destroy(device, ctx);
-		close(device);
+		drm_close_driver(device);
 	}
 }
diff --git a/tests/i915/gem_exec_parallel.c b/tests/i915/gem_exec_parallel.c
index 705b22cb9..8c82abdd7 100644
--- a/tests/i915/gem_exec_parallel.c
+++ b/tests/i915/gem_exec_parallel.c
@@ -364,6 +364,6 @@ igt_main
 	igt_fixture {
 		igt_stop_hang_detector();
 		intel_ctx_destroy(fd, ctx);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_exec_params.c b/tests/i915/gem_exec_params.c
index d0805d330..80024fb3d 100644
--- a/tests/i915/gem_exec_params.c
+++ b/tests/i915/gem_exec_params.c
@@ -646,6 +646,6 @@ igt_main
 	igt_fixture {
 		gem_close(fd, handle);
 
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
index 3ce89ca64..bcaffd1d9 100644
--- a/tests/i915/gem_exec_reloc.c
+++ b/tests/i915/gem_exec_reloc.c
@@ -1178,5 +1178,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
index ab1dd7749..a12db4df2 100644
--- a/tests/i915/gem_exec_schedule.c
+++ b/tests/i915/gem_exec_schedule.c
@@ -3369,6 +3369,6 @@ igt_main
 	igt_fixture {
 		igt_stop_hang_detector();
 		intel_ctx_destroy(fd, ctx);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_exec_store.c b/tests/i915/gem_exec_store.c
index 7d23bcd5b..6bf392bd2 100644
--- a/tests/i915/gem_exec_store.c
+++ b/tests/i915/gem_exec_store.c
@@ -455,6 +455,6 @@ igt_main
 	igt_fixture {
 		igt_stop_hang_detector();
 		intel_ctx_destroy(fd, ctx);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_exec_suspend.c b/tests/i915/gem_exec_suspend.c
index 8d56093fa..2295ed04c 100644
--- a/tests/i915/gem_exec_suspend.c
+++ b/tests/i915/gem_exec_suspend.c
@@ -411,6 +411,6 @@ igt_main
 		igt_collection_destroy(set);
 		igt_disallow_hang(fd, hang);
 		intel_ctx_destroy(fd, ctx);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_exec_whisper.c b/tests/i915/gem_exec_whisper.c
index 29d96cdca..08cc7f78a 100644
--- a/tests/i915/gem_exec_whisper.c
+++ b/tests/i915/gem_exec_whisper.c
@@ -660,6 +660,6 @@ igt_main
 	igt_fixture {
 		intel_allocator_multiprocess_stop();
 		intel_ctx_destroy(fd, ctx);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_exercise_blt.c b/tests/i915/gem_exercise_blt.c
index fb11fb925..365b9b005 100644
--- a/tests/i915/gem_exercise_blt.c
+++ b/tests/i915/gem_exercise_blt.c
@@ -381,6 +381,6 @@ igt_main_args("b:pst:W:H:", NULL, help_str, opt_handler, NULL)
 	}
 
 	igt_fixture {
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/gem_fd_exhaustion.c b/tests/i915/gem_fd_exhaustion.c
index a6463685e..717422951 100644
--- a/tests/i915/gem_fd_exhaustion.c
+++ b/tests/i915/gem_fd_exhaustion.c
@@ -69,5 +69,5 @@ igt_simple_main
 
 	igt_waitchildren();
 
-	close(fd);
+	drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_fence_thrash.c b/tests/i915/gem_fence_thrash.c
index 89a5ae29d..348100476 100644
--- a/tests/i915/gem_fence_thrash.c
+++ b/tests/i915/gem_fence_thrash.c
@@ -225,7 +225,7 @@ static int run_test(int threads_per_fence, void *f, int tiling,
 		igt_assert(func(&t) == (void *)0);
 	}
 
-	close(t.fd);
+	drm_close_driver(t.fd);
 
 	return 0;
 }
@@ -252,4 +252,5 @@ igt_main
 
 	igt_subtest("bo-copy")
 		igt_assert(run_test(1, bo_copy, I915_TILING_X, 1) == 0);
+
 }
diff --git a/tests/i915/gem_fenced_exec_thrash.c b/tests/i915/gem_fenced_exec_thrash.c
index a9597d801..03ba200a7 100644
--- a/tests/i915/gem_fenced_exec_thrash.c
+++ b/tests/i915/gem_fenced_exec_thrash.c
@@ -199,5 +199,5 @@ igt_main
 		run_test(fd, num_fences + 1, intel_gen(devid) >= 4 ? 0 : ENOBUFS, 0);
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_flink_basic.c b/tests/i915/gem_flink_basic.c
index 2620bc55d..9a014eb07 100644
--- a/tests/i915/gem_flink_basic.c
+++ b/tests/i915/gem_flink_basic.c
@@ -147,7 +147,7 @@ test_flink_lifetime(int fd)
 	igt_assert_eq(ret, 0);
 	igt_assert(open_struct.handle != 0);
 
-	close(fd2);
+	drm_close_driver(fd2);
 	fd2 = drm_open_driver(DRIVER_INTEL);
 
 	/* Flink name remains valid due to the second reference */
@@ -156,7 +156,7 @@ test_flink_lifetime(int fd)
 	igt_assert_eq(ret, 0);
 	igt_assert(open_struct.handle != 0);
 
-	close(fd2);
+	drm_close_driver(fd2);
 }
 
 igt_main
@@ -188,4 +188,7 @@ igt_main
 	igt_describe("Tests flink lifetime by referencing from multiple descriptors.");
 	igt_subtest("flink-lifetime")
 		test_flink_lifetime(fd);
+
+	igt_fixture
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_flink_race.c b/tests/i915/gem_flink_race.c
index 70e133d70..c167e5789 100644
--- a/tests/i915/gem_flink_race.c
+++ b/tests/i915/gem_flink_race.c
@@ -127,7 +127,7 @@ static void test_flink_name(int timeout)
 		 igt_stats_get_max(&stats));
 	igt_stats_fini(&stats);
 
-	close(fd);
+	drm_close_driver(fd);
 }
 
 static void *thread_fn_flink_close(void *p)
@@ -188,13 +188,13 @@ static void test_flink_close(void)
 		igt_assert(status == 0);
 	}
 
-	close(fd);
+	drm_close_driver(fd);
 
 	obj_count = igt_get_stable_obj_count(fake) - obj_count;
 
 	igt_info("leaked %i objects\n", obj_count);
 
-	close(fake);
+	drm_close_driver(fake);
 
 	igt_assert_eq(obj_count, 0);
 }
diff --git a/tests/i915/gem_gtt_cpu_tlb.c b/tests/i915/gem_gtt_cpu_tlb.c
index 8000e58cc..5f0a19b8b 100644
--- a/tests/i915/gem_gtt_cpu_tlb.c
+++ b/tests/i915/gem_gtt_cpu_tlb.c
@@ -105,5 +105,5 @@ igt_simple_main
 	for (i = 0; i < OBJ_SIZE/4; i++)
 		igt_assert(ptr[i] == i);
 
-	close(fd);
+	drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_gtt_hog.c b/tests/i915/gem_gtt_hog.c
index 15a6139ea..c365f1196 100644
--- a/tests/i915/gem_gtt_hog.c
+++ b/tests/i915/gem_gtt_hog.c
@@ -164,7 +164,7 @@ igt_simple_main
 	int fd = drm_open_driver(DRIVER_INTEL);
 	igt_require_gem(fd);
 	gem_require_mappable_ggtt(fd);
-	close(fd);
+	drm_close_driver(fd);
 
 	data.fd = drm_open_driver(DRIVER_INTEL);
 	data.devid = intel_get_drm_devid(data.fd);
diff --git a/tests/i915/gem_gtt_speed.c b/tests/i915/gem_gtt_speed.c
index 272091fdb..d142b1cf7 100644
--- a/tests/i915/gem_gtt_speed.c
+++ b/tests/i915/gem_gtt_speed.c
@@ -515,5 +515,5 @@ igt_simple_main_args("s:", NULL, help_str, opt_handler, NULL)
 	}
 
 	gem_close(fd, handle);
-	close(fd);
+	drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_huc_copy.c b/tests/i915/gem_huc_copy.c
index ea32b705a..9c31eeaea 100644
--- a/tests/i915/gem_huc_copy.c
+++ b/tests/i915/gem_huc_copy.c
@@ -139,6 +139,6 @@ igt_main
 
 	igt_fixture {
 		put_ahnd(ahnd);
-		close(drm_fd);
+		drm_close_driver(drm_fd);
 	}
 }
diff --git a/tests/i915/gem_lmem_evict.c b/tests/i915/gem_lmem_evict.c
index 71a066de3..6fd596feb 100644
--- a/tests/i915/gem_lmem_evict.c
+++ b/tests/i915/gem_lmem_evict.c
@@ -93,7 +93,7 @@ igt_main
 			igt_require_fd(i915);
 			igt_require_gem(i915);
 			igt_require(gem_has_lmem(i915));
-			close(i915);
+			drm_close_driver(i915);
 		}
 
 		igt_i915_driver_unload();
@@ -132,7 +132,7 @@ igt_main
 	}
 
 	igt_fixture {
-		close(i915);
+		drm_close_driver(i915);
 		igt_i915_driver_unload();
 	}
 }
diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
index 55b044ecd..c4e0fc3be 100644
--- a/tests/i915/gem_lmem_swapping.c
+++ b/tests/i915/gem_lmem_swapping.c
@@ -736,7 +736,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 			igt_require_fd(i915);
 			igt_require_gem(i915);
 			igt_require(gem_has_lmem(i915));
-			close(i915);
+			drm_close_driver(i915);
 		}
 
 		igt_i915_driver_unload();
@@ -781,7 +781,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	igt_fixture {
 		intel_ctx_destroy(i915, ctx);
 		free(regions);
-		close(i915);
+		drm_close_driver(i915);
 		igt_i915_driver_unload();
 	}
 
diff --git a/tests/i915/gem_madvise.c b/tests/i915/gem_madvise.c
index 2502d84c7..c141d208d 100644
--- a/tests/i915/gem_madvise.c
+++ b/tests/i915/gem_madvise.c
@@ -77,7 +77,7 @@ dontneed_before_mmap(void)
 					PROT_READ | PROT_WRITE,
 					t->type);
 
-		close(fd);
+		drm_close_driver(fd);
 		if (!ptr)
 			continue;
 
@@ -99,7 +99,7 @@ dontneed_before_mmap(void)
 		fd = drm_open_driver(DRIVER_INTEL);
 	}
 
-	close(fd);
+	drm_close_driver(fd);
 }
 
 static void
@@ -123,7 +123,7 @@ dontneed_after_mmap(void)
 					t->type);
 
 		gem_madvise(fd, handle, I915_MADV_DONTNEED);
-		close(fd);
+		drm_close_driver(fd);
 		if (!ptr)
 			continue;
 
@@ -145,7 +145,7 @@ dontneed_after_mmap(void)
 		fd = drm_open_driver(DRIVER_INTEL);
 	}
 
-	close(fd);
+	drm_close_driver(fd);
 }
 
 static void
@@ -161,7 +161,7 @@ dontneed_before_pwrite(void)
 
 	igt_assert_eq(__gem_write(fd, handle, 0, &bbe, sizeof(bbe)), -EFAULT);
 
-	close(fd);
+	drm_close_driver(fd);
 }
 
 static void
@@ -185,7 +185,7 @@ dontneed_before_exec(void)
 	execbuf.batch_len = sizeof(buf);
 	igt_assert_eq(__gem_execbuf(fd, &execbuf), -EFAULT);
 
-	close(fd);
+	drm_close_driver(fd);
 }
 
 igt_main
diff --git a/tests/i915/gem_media_fill.c b/tests/i915/gem_media_fill.c
index e418047c2..127d7e3a6 100644
--- a/tests/i915/gem_media_fill.c
+++ b/tests/i915/gem_media_fill.c
@@ -173,6 +173,6 @@ igt_main
 	igt_fixture {
 		igt_collection_destroy(set);
 		igt_stop_hang_detector();
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/i915/gem_mmap.c b/tests/i915/gem_mmap.c
index 61f862a8e..053c9ed4c 100644
--- a/tests/i915/gem_mmap.c
+++ b/tests/i915/gem_mmap.c
@@ -315,5 +315,5 @@ igt_main
 		test_huge_bo(2);
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem_mmap_gtt.c
index c14ab50ee..a92f42dc1 100644
--- a/tests/i915/gem_mmap_gtt.c
+++ b/tests/i915/gem_mmap_gtt.c
@@ -1492,5 +1492,5 @@ igt_main
 
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
index 962fc1b73..1d236f6d0 100644
--- a/tests/i915/gem_mmap_offset.c
+++ b/tests/i915/gem_mmap_offset.c
@@ -926,6 +926,6 @@ igt_main
 		blt_coherency(i915);
 
 	igt_fixture {
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/gem_mmap_wc.c b/tests/i915/gem_mmap_wc.c
index 6dc7bae49..9fc26593e 100644
--- a/tests/i915/gem_mmap_wc.c
+++ b/tests/i915/gem_mmap_wc.c
@@ -620,5 +620,5 @@ igt_main
 		test_set_cache_level(fd);
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_partial_pwrite_pread.c b/tests/i915/gem_partial_pwrite_pread.c
index 474149d48..affce4ee6 100644
--- a/tests/i915/gem_partial_pwrite_pread.c
+++ b/tests/i915/gem_partial_pwrite_pread.c
@@ -326,6 +326,6 @@ igt_main
 		intel_buf_destroy(scratch_buf);
 		intel_buf_destroy(staging_buf);
 		buf_ops_destroy(data.bops);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/i915/gem_pipe_control_store_loop.c b/tests/i915/gem_pipe_control_store_loop.c
index 59959a374..8e9af5088 100644
--- a/tests/i915/gem_pipe_control_store_loop.c
+++ b/tests/i915/gem_pipe_control_store_loop.c
@@ -183,6 +183,6 @@ igt_main
 
 	igt_fixture {
 		buf_ops_destroy(bops);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_ppgtt.c b/tests/i915/gem_ppgtt.c
index c3102857a..09b4c6acc 100644
--- a/tests/i915/gem_ppgtt.c
+++ b/tests/i915/gem_ppgtt.c
@@ -251,8 +251,8 @@ static void flink_and_close(void)
 	igt_assert_eq(offset, offset_new);
 
 	gem_close(fd, bo);
-	close(fd);
-	close(fd2);
+	drm_close_driver(fd);
+	drm_close_driver(fd2);
 }
 
 #define PAGE_SIZE 4096
@@ -385,7 +385,7 @@ static bool has_contexts(void)
 
 	fd = drm_open_driver(DRIVER_INTEL);
 	result = gem_has_contexts(fd);
-	close(fd);
+	drm_close_driver(fd);
 
 	return result;
 }
@@ -398,7 +398,7 @@ igt_main
 		int fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
 		gem_require_blitter(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 
 	igt_subtest("blt-vs-render-ctx0") {
diff --git a/tests/i915/gem_pread.c b/tests/i915/gem_pread.c
index a8bf2b054..e76dbce1f 100644
--- a/tests/i915/gem_pread.c
+++ b/tests/i915/gem_pread.c
@@ -350,6 +350,6 @@ igt_main_args("s:", NULL, help_str, opt_handler, NULL)
 		free(src);
 		gem_close(fd, dst);
 
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_pread_after_blit.c b/tests/i915/gem_pread_after_blit.c
index 3b56f787a..d5d20f58d 100644
--- a/tests/i915/gem_pread_after_blit.c
+++ b/tests/i915/gem_pread_after_blit.c
@@ -252,5 +252,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_pwrite.c b/tests/i915/gem_pwrite.c
index 6e3f833cd..353ce1a01 100644
--- a/tests/i915/gem_pwrite.c
+++ b/tests/i915/gem_pwrite.c
@@ -572,5 +572,5 @@ igt_main_args("s:", NULL, help_str, opt_handler, NULL)
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_pwrite_snooped.c b/tests/i915/gem_pwrite_snooped.c
index e6a10747d..8883b2737 100644
--- a/tests/i915/gem_pwrite_snooped.c
+++ b/tests/i915/gem_pwrite_snooped.c
@@ -140,5 +140,5 @@ igt_simple_main
 	test(256, 256);
 
 	buf_ops_destroy(bops);
-	close(fd);
+	drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
index 2f27abd58..a4209945f 100644
--- a/tests/i915/gem_pxp.c
+++ b/tests/i915/gem_pxp.c
@@ -1293,6 +1293,6 @@ igt_main
 	}
 
 	igt_fixture {
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/gem_read_read_speed.c b/tests/i915/gem_read_read_speed.c
index 7c5c90f79..9e84c7a27 100644
--- a/tests/i915/gem_read_read_speed.c
+++ b/tests/i915/gem_read_read_speed.c
@@ -214,6 +214,6 @@ igt_main
 
 	igt_fixture {
 		buf_ops_destroy(bops);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_readwrite.c b/tests/i915/gem_readwrite.c
index 2d437dec3..6a24d74ec 100644
--- a/tests/i915/gem_readwrite.c
+++ b/tests/i915/gem_readwrite.c
@@ -143,5 +143,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_reg_read.c b/tests/i915/gem_reg_read.c
index 79facc1f2..302aa82ab 100644
--- a/tests/i915/gem_reg_read.c
+++ b/tests/i915/gem_reg_read.c
@@ -170,6 +170,6 @@ igt_main
 	}
 
 	igt_fixture {
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_render_copy.c b/tests/i915/gem_render_copy.c
index 2c150b2b0..0eaa10754 100644
--- a/tests/i915/gem_render_copy.c
+++ b/tests/i915/gem_render_copy.c
@@ -879,6 +879,6 @@ igt_main_args("dac", NULL, help_str, opt_handler, NULL)
 		igt_stop_hang_detector();
 		buf_ops_destroy(data.bops);
 		igt_collection_destroy(set);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/i915/gem_render_copy_redux.c b/tests/i915/gem_render_copy_redux.c
index 5e1daccf1..dd7917413 100644
--- a/tests/i915/gem_render_copy_redux.c
+++ b/tests/i915/gem_render_copy_redux.c
@@ -81,7 +81,7 @@ static void data_init(data_t *data)
 static void data_fini(data_t *data)
 {
 	buf_ops_destroy(data->bops);
-	close(data->fd);
+	drm_close_driver(data->fd);
 }
 
 static void scratch_buf_init(data_t *data, struct intel_buf *buf,
diff --git a/tests/i915/gem_reset_stats.c b/tests/i915/gem_reset_stats.c
index 7b003d88b..9bc7c803d 100644
--- a/tests/i915/gem_reset_stats.c
+++ b/tests/i915/gem_reset_stats.c
@@ -999,6 +999,6 @@ igt_main
 	}
 	igt_fixture {
 		igt_assert(igt_params_set(device, "reset", "%d", INT_MAX /* any reset method */));
-		close(device);
+		drm_close_driver(device);
 	}
 }
diff --git a/tests/i915/gem_ringfill.c b/tests/i915/gem_ringfill.c
index afcd7b73e..b0641b483 100644
--- a/tests/i915/gem_ringfill.c
+++ b/tests/i915/gem_ringfill.c
@@ -401,6 +401,6 @@ igt_main
 
 	igt_fixture {
 		intel_ctx_destroy(fd, ctx);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_set_tiling_vs_blt.c b/tests/i915/gem_set_tiling_vs_blt.c
index 5e3bf6a12..7148c9d18 100644
--- a/tests/i915/gem_set_tiling_vs_blt.c
+++ b/tests/i915/gem_set_tiling_vs_blt.c
@@ -261,6 +261,6 @@ igt_main
 
 	igt_fixture{
 		buf_ops_destroy(bops);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_set_tiling_vs_gtt.c b/tests/i915/gem_set_tiling_vs_gtt.c
index 2f890e83b..4ebf17dcb 100644
--- a/tests/i915/gem_set_tiling_vs_gtt.c
+++ b/tests/i915/gem_set_tiling_vs_gtt.c
@@ -130,5 +130,5 @@ igt_simple_main
 
 	munmap(ptr, OBJECT_SIZE);
 
-	close(fd);
+	drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_set_tiling_vs_pwrite.c b/tests/i915/gem_set_tiling_vs_pwrite.c
index 6bec7f27e..170195e47 100644
--- a/tests/i915/gem_set_tiling_vs_pwrite.c
+++ b/tests/i915/gem_set_tiling_vs_pwrite.c
@@ -99,5 +99,5 @@ igt_simple_main
 
 	munmap(ptr, OBJECT_SIZE);
 
-	close(fd);
+	drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_shrink.c b/tests/i915/gem_shrink.c
index 380d2c846..a104c9f3a 100644
--- a/tests/i915/gem_shrink.c
+++ b/tests/i915/gem_shrink.c
@@ -270,7 +270,7 @@ static bool has_userptr(void)
 	if (drmIoctl(fd, DRM_IOCTL_I915_GEM_USERPTR, &userptr))
 		err = errno;
 
-	close(fd);
+	drm_close_driver(fd);
 
 	return err == EFAULT;
 }
@@ -319,7 +319,7 @@ static void run_test(int nchildren, uint64_t alloc,
 				int fd = drm_open_driver(DRIVER_INTEL);
 				for (int pass = 0; pass < nchildren; pass++)
 					leak(fd, alloc);
-				close(fd);
+				drm_close_driver(fd);
 			}
 		}
 	}
@@ -331,7 +331,7 @@ static void run_test(int nchildren, uint64_t alloc,
 				int fd = drm_open_driver(DRIVER_INTEL);
 				for (int pass = 0; pass < nchildren; pass++)
 					userptr(fd, alloc, 0);
-				close(fd);
+				drm_close_driver(fd);
 			}
 		}
 		nchildren = (nchildren + 1)/2;
@@ -344,7 +344,7 @@ static void run_test(int nchildren, uint64_t alloc,
 				int fd = drm_open_driver(DRIVER_INTEL);
 				for (int pass = 0; pass < nchildren; pass++)
 					userptr(fd, alloc, UDIRTY);
-				close(fd);
+				drm_close_driver(fd);
 			}
 		}
 		nchildren = (nchildren + 1)/2;
@@ -356,7 +356,7 @@ static void run_test(int nchildren, uint64_t alloc,
 			int fd = drm_open_driver(DRIVER_INTEL);
 			for (int pass = 0; pass < nchildren; pass++)
 				func(fd, alloc);
-			close(fd);
+			drm_close_driver(fd);
 		}
 	}
 	igt_waitchildren();
@@ -399,7 +399,7 @@ static void reclaim(unsigned engine, int timeout)
 
 	munmap((void *)shared, 4096);
 	close(debugfs);
-	close(fd);
+	drm_close_driver(fd);
 }
 
 igt_main
@@ -456,7 +456,7 @@ igt_main
 			 num_processes, alloc_size);
 
 		alloc_size <<= 20;
-		close(fd);
+		drm_close_driver(fd);
 	}
 
 	igt_subtest("reclaim")
diff --git a/tests/i915/gem_softpin.c b/tests/i915/gem_softpin.c
index 8717860b2..0cf33208f 100644
--- a/tests/i915/gem_softpin.c
+++ b/tests/i915/gem_softpin.c
@@ -1531,6 +1531,6 @@ igt_main
 
 	igt_fixture {
 		intel_ctx_destroy(fd, ctx);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_spin_batch.c b/tests/i915/gem_spin_batch.c
index 7dc68ebc7..68e7af7e3 100644
--- a/tests/i915/gem_spin_batch.c
+++ b/tests/i915/gem_spin_batch.c
@@ -277,6 +277,6 @@ igt_main
 	igt_fixture {
 		igt_stop_hang_detector();
 		intel_ctx_destroy(fd, ctx);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_streaming_writes.c b/tests/i915/gem_streaming_writes.c
index 883fe4293..a8e6c42a8 100644
--- a/tests/i915/gem_streaming_writes.c
+++ b/tests/i915/gem_streaming_writes.c
@@ -419,5 +419,5 @@ igt_main
 		test_batch(fd, 2, 1);
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_stress.c b/tests/i915/gem_stress.c
index 3765ab14b..23690c077 100644
--- a/tests/i915/gem_stress.c
+++ b/tests/i915/gem_stress.c
@@ -926,7 +926,7 @@ igt_simple_main_args("ds:g:c:t:rbuxmo:fp:",
 	intel_bb_destroy(ibb);
 	buf_ops_destroy(bops);
 
-	close(drm_fd);
+	drm_close_driver(drm_fd);
 
 	igt_stop_signal_helper();
 }
diff --git a/tests/i915/gem_sync.c b/tests/i915/gem_sync.c
index e7dc6637a..18adbd19d 100644
--- a/tests/i915/gem_sync.c
+++ b/tests/i915/gem_sync.c
@@ -1363,6 +1363,6 @@ igt_main
 		intel_allocator_multiprocess_stop();
 		igt_stop_hang_detector();
 		intel_ctx_destroy(fd, ctx);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_tiled_blits.c b/tests/i915/gem_tiled_blits.c
index 5e7ed0c4e..0f8434d7f 100644
--- a/tests/i915/gem_tiled_blits.c
+++ b/tests/i915/gem_tiled_blits.c
@@ -215,6 +215,6 @@ igt_main
 	}
 
 	igt_fixture {
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_tiled_fence_blits.c b/tests/i915/gem_tiled_fence_blits.c
index a3a0221d6..8e908eac0 100644
--- a/tests/i915/gem_tiled_fence_blits.c
+++ b/tests/i915/gem_tiled_fence_blits.c
@@ -320,5 +320,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_tiled_partial_pwrite_pread.c b/tests/i915/gem_tiled_partial_pwrite_pread.c
index 95fb69c65..ecc97002e 100644
--- a/tests/i915/gem_tiled_partial_pwrite_pread.c
+++ b/tests/i915/gem_tiled_partial_pwrite_pread.c
@@ -318,6 +318,6 @@ igt_main
 		intel_buf_destroy(tiled_staging_buf);
 		buf_ops_destroy(bops);
 
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_tiled_pread_basic.c b/tests/i915/gem_tiled_pread_basic.c
index 2b4cec6e7..48f5c67e1 100644
--- a/tests/i915/gem_tiled_pread_basic.c
+++ b/tests/i915/gem_tiled_pread_basic.c
@@ -222,5 +222,5 @@ igt_simple_main
 		}
 	}
 
-	close(fd);
+	drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_tiled_pread_pwrite.c b/tests/i915/gem_tiled_pread_pwrite.c
index 2d21dfb76..885785cab 100644
--- a/tests/i915/gem_tiled_pread_pwrite.c
+++ b/tests/i915/gem_tiled_pread_pwrite.c
@@ -154,5 +154,5 @@ igt_simple_main
 		gem_madvise(fd, handle, I915_MADV_DONTNEED);
 	}
 
-	close(fd);
+	drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_tiled_swapping.c b/tests/i915/gem_tiled_swapping.c
index f4bdce738..718516def 100644
--- a/tests/i915/gem_tiled_swapping.c
+++ b/tests/i915/gem_tiled_swapping.c
@@ -246,5 +246,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_tiled_wb.c b/tests/i915/gem_tiled_wb.c
index e9efbdf23..b2337806d 100644
--- a/tests/i915/gem_tiled_wb.c
+++ b/tests/i915/gem_tiled_wb.c
@@ -239,5 +239,5 @@ igt_simple_main
 		munmap(linear, last_page - first_page);
 	}
 
-	close(fd);
+	drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_tiled_wc.c b/tests/i915/gem_tiled_wc.c
index 1f245eb7d..4f733163b 100644
--- a/tests/i915/gem_tiled_wc.c
+++ b/tests/i915/gem_tiled_wc.c
@@ -243,5 +243,5 @@ igt_simple_main
 		munmap(linear, last_page - first_page);
 	}
 
-	close(fd);
+	drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_tiling_max_stride.c b/tests/i915/gem_tiling_max_stride.c
index 513d579d3..d326ae7c2 100644
--- a/tests/i915/gem_tiling_max_stride.c
+++ b/tests/i915/gem_tiling_max_stride.c
@@ -138,5 +138,5 @@ igt_simple_main
 
 	munmap(ptr, size);
 
-	close(fd);
+	drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_unfence_active_buffers.c b/tests/i915/gem_unfence_active_buffers.c
index a0a601de2..71686095d 100644
--- a/tests/i915/gem_unfence_active_buffers.c
+++ b/tests/i915/gem_unfence_active_buffers.c
@@ -99,5 +99,5 @@ igt_simple_main
 
 	igt_spin_free(i915, spin);
 	put_ahnd(ahnd);
-	close(i915);
+	drm_close_driver(i915);
 }
diff --git a/tests/i915/gem_unref_active_buffers.c b/tests/i915/gem_unref_active_buffers.c
index 735c14720..9d92156a1 100644
--- a/tests/i915/gem_unref_active_buffers.c
+++ b/tests/i915/gem_unref_active_buffers.c
@@ -121,5 +121,5 @@ igt_simple_main
 
 	igt_spin_free(i915, spin);
 	put_ahnd(ahnd);
-	close(i915);
+	drm_close_driver(i915);
 }
diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index b00afc32c..381f1b6d9 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -1288,9 +1288,9 @@ static int test_dmabuf(void)
 
 	/* destroy userptr object and expect SIGBUS */
 	free_userptr_bo(fd1, handle);
-	close(fd1);
+	drm_close_driver(fd1);
 
-	close(fd2);
+	drm_close_driver(fd2);
 	reset_handle_ptr();
 
 	return 0;
@@ -2703,4 +2703,7 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
 		igt_require(has_userptr_probe(fd));
 		test_probe(fd);
 	}
+
+	igt_fixture
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_vm_create.c b/tests/i915/gem_vm_create.c
index f47d8c556..9c5085206 100644
--- a/tests/i915/gem_vm_create.c
+++ b/tests/i915/gem_vm_create.c
@@ -388,6 +388,6 @@ igt_main
 	}
 
 	igt_fixture {
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/gem_wait.c b/tests/i915/gem_wait.c
index 27d084afa..a33e461d8 100644
--- a/tests/i915/gem_wait.c
+++ b/tests/i915/gem_wait.c
@@ -257,6 +257,6 @@ igt_main
 
 	igt_fixture {
 		intel_ctx_destroy(fd, ctx);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_watchdog.c b/tests/i915/gem_watchdog.c
index 27f3a2d7f..18957cee3 100644
--- a/tests/i915/gem_watchdog.c
+++ b/tests/i915/gem_watchdog.c
@@ -586,6 +586,6 @@ igt_main
 
 	igt_fixture {
 		intel_ctx_destroy(i915, ctx);
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/gem_workarounds.c b/tests/i915/gem_workarounds.c
index 7d1199625..b0268e01a 100644
--- a/tests/i915/gem_workarounds.c
+++ b/tests/i915/gem_workarounds.c
@@ -339,4 +339,7 @@ igt_main
 			}
 		}
 	}
+
+	igt_fixture
+		drm_close_driver(device);
 }
diff --git a/tests/i915/gen7_exec_parse.c b/tests/i915/gen7_exec_parse.c
index e9751ea73..895aea1ea 100644
--- a/tests/i915/gen7_exec_parse.c
+++ b/tests/i915/gen7_exec_parse.c
@@ -445,7 +445,7 @@ static void hsw_load_register_reg(void)
 				   0xabcdabc0);
 	}
 
-	close(fd);
+	drm_close_driver(fd);
 }
 
 igt_main
@@ -717,6 +717,6 @@ igt_main
 		igt_stop_hang_detector();
 		gem_close(fd, handle);
 
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gen9_exec_parse.c b/tests/i915/gen9_exec_parse.c
index 26b151705..e7d47fccc 100644
--- a/tests/i915/gen9_exec_parse.c
+++ b/tests/i915/gen9_exec_parse.c
@@ -1252,6 +1252,6 @@ igt_main
 		igt_stop_hang_detector();
 		gem_close(i915, handle);
 
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/i915_fb_tiling.c b/tests/i915/i915_fb_tiling.c
index cafa5233c..f3f0c3d0a 100644
--- a/tests/i915/i915_fb_tiling.c
+++ b/tests/i915/i915_fb_tiling.c
@@ -44,5 +44,5 @@ igt_simple_main
 	igt_assert_eq(ret, -EBUSY);
 
 	igt_remove_fb(drm_fd, &fb);
-	close(drm_fd);
+	drm_close_driver(drm_fd);
 }
diff --git a/tests/i915/i915_getparams_basic.c b/tests/i915/i915_getparams_basic.c
index 5422d585f..b6988784d 100644
--- a/tests/i915/i915_getparams_basic.c
+++ b/tests/i915/i915_getparams_basic.c
@@ -46,7 +46,7 @@ init(void)
 static void
 deinit(void)
 {
-	close(drm_fd);
+	drm_close_driver(drm_fd);
 }
 
 
diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
index dd396c4e9..d8c9ec0ef 100644
--- a/tests/i915/i915_hangman.c
+++ b/tests/i915/i915_hangman.c
@@ -97,7 +97,7 @@ static void check_alive(void)
 	put_ahnd(ahnd);
 	intel_ctx_destroy(fd, ctx);
 	gem_quiescent_gpu(fd);
-	close(fd);
+	drm_close_driver(fd);
 }
 
 static bool has_error_state(int dir)
@@ -580,6 +580,6 @@ igt_main
 
 		igt_disallow_hang(device, hang);
 		intel_ctx_destroy(device, ctx);
-		close(device);
+		drm_close_driver(device);
 	}
 }
diff --git a/tests/i915/i915_hwmon.c b/tests/i915/i915_hwmon.c
index 6d9937e99..4b7ecb766 100644
--- a/tests/i915/i915_hwmon.c
+++ b/tests/i915/i915_hwmon.c
@@ -83,6 +83,6 @@ igt_main
 
 	igt_fixture {
 		close(hwm);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/i915_module_load.c b/tests/i915/i915_module_load.c
index 725687dab..057c68906 100644
--- a/tests/i915/i915_module_load.c
+++ b/tests/i915/i915_module_load.c
@@ -238,7 +238,7 @@ static void gem_sanitycheck(void)
 		store_all(i915);
 	errno = 0;
 
-	close(i915);
+	drm_close_driver(i915);
 	igt_assert_eq(err, expected);
 }
 
@@ -286,7 +286,7 @@ static void load_and_check_i915(void)
 
 	/* make sure the GPU is idle */
 	gem_quiescent_gpu(drm_fd);
-	close(drm_fd);
+	drm_close_driver(drm_fd);
 
 	/* make sure we can do basic memory ops */
 	gem_sanitycheck();
@@ -327,7 +327,7 @@ static uint32_t  driver_load_with_lmem_bar_size(uint32_t lmem_bar_size, bool che
 		}
 	}
 
-	close(i915);
+	drm_close_driver(i915);
 
 	return lmem_bar_size;
 }
@@ -419,7 +419,7 @@ igt_main
 			igt_require_gem(i915);
 			igt_require(gem_has_lmem(i915));
 			igt_skip_on_f(igt_sysfs_get_num_gt(i915) > 1, "Skips for more than one lmem instance.\n");
-			close(i915);
+			drm_close_driver(i915);
 		}
 
 		/* Test for lmem_bar_size modparam support */
diff --git a/tests/i915/i915_pciid.c b/tests/i915/i915_pciid.c
index 377eec58c..9da7dc074 100644
--- a/tests/i915/i915_pciid.c
+++ b/tests/i915/i915_pciid.c
@@ -65,5 +65,5 @@ igt_simple_main
 
 	igt_assert(has_known_intel_chipset(intel));
 
-	close(intel);
+	drm_close_driver(intel);
 }
diff --git a/tests/i915/i915_pm_backlight.c b/tests/i915/i915_pm_backlight.c
index 829606622..0bdb98f3f 100644
--- a/tests/i915/i915_pm_backlight.c
+++ b/tests/i915/i915_pm_backlight.c
@@ -332,6 +332,6 @@ igt_main
 
 		igt_display_fini(&display);
 		igt_pm_restore_sata_link_power_management();
-		close(display.drm_fd);
+		drm_close_driver(display.drm_fd);
 	}
 }
diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index 6f08cb3fc..859bfdc55 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -689,7 +689,7 @@ igt_main
 		close(data.debugfs_root_fd);
 		close(data.msr_fd);
 		display_fini(&data);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 
 	igt_exit();
diff --git a/tests/i915/i915_pm_freq_api.c b/tests/i915/i915_pm_freq_api.c
index 662d514a4..096adbbb5 100644
--- a/tests/i915/i915_pm_freq_api.c
+++ b/tests/i915/i915_pm_freq_api.c
@@ -139,6 +139,6 @@ igt_main
 			igt_assert(set_freq(dirfd, RPS_MAX_FREQ_MHZ, stash_max[gt]) > 0);
 			igt_assert(set_freq(dirfd, RPS_MIN_FREQ_MHZ, stash_min[gt]) > 0);
 		}
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/i915_pm_freq_mult.c b/tests/i915/i915_pm_freq_mult.c
index 894ae294c..825f5a326 100644
--- a/tests/i915/i915_pm_freq_mult.c
+++ b/tests/i915/i915_pm_freq_mult.c
@@ -167,6 +167,6 @@ igt_main
 	}
 
 	igt_fixture {
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c
index 3ad8b2603..fc4404c9b 100644
--- a/tests/i915/i915_pm_lpsp.c
+++ b/tests/i915/i915_pm_lpsp.c
@@ -211,6 +211,6 @@ igt_main
 	igt_fixture {
 		free(data.pwr_dmn_info);
 		igt_display_fini(&data.display);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/i915/i915_pm_rc6_residency.c b/tests/i915/i915_pm_rc6_residency.c
index 3554f5d77..0fac22770 100644
--- a/tests/i915/i915_pm_rc6_residency.c
+++ b/tests/i915/i915_pm_rc6_residency.c
@@ -611,6 +611,6 @@ igt_main
 
 	igt_fixture {
 		intel_ctx_destroy(i915, ctx);
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 9a6408dd3..5f812d3c9 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -874,7 +874,7 @@ static void teardown_environment(bool display_enabled)
 		fini_mode_set_data(&ms_data);
 
 	close(debugfs);
-	close(drm_fd);
+	drm_close_driver(drm_fd);
 
 	has_runtime_pm = false;
 }
diff --git a/tests/i915/i915_pm_rps.c b/tests/i915/i915_pm_rps.c
index d4ee2d58a..34abfe690 100644
--- a/tests/i915/i915_pm_rps.c
+++ b/tests/i915/i915_pm_rps.c
@@ -877,7 +877,7 @@ static void pm_rps_exit_handler(int sig)
 	if (lh.igt_proc.running)
 		load_helper_stop();
 
-	close(drm_fd);
+	drm_close_driver(drm_fd);
 }
 
 igt_main
@@ -959,4 +959,7 @@ igt_main
 		waitboost(drm_fd, true);
 		igt_disallow_hang(drm_fd, hang);
 	}
+
+	igt_fixture
+		drm_close_driver(drm_fd);
 }
diff --git a/tests/i915/i915_pm_sseu.c b/tests/i915/i915_pm_sseu.c
index 1b428c9ba..771971851 100644
--- a/tests/i915/i915_pm_sseu.c
+++ b/tests/i915/i915_pm_sseu.c
@@ -315,7 +315,7 @@ gem_deinit(void)
 	case 2:
 		buf_ops_destroy(gem.bops);
 	case 1:
-		close(gem.drm_fd);
+		drm_close_driver(gem.drm_fd);
 	}
 }
 
diff --git a/tests/i915/i915_power.c b/tests/i915/i915_power.c
index 51b412e3a..9f6235083 100644
--- a/tests/i915/i915_power.c
+++ b/tests/i915/i915_power.c
@@ -76,6 +76,6 @@ igt_main
 	}
 
 	igt_fixture {
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/i915_query.c b/tests/i915/i915_query.c
index e725e04e4..ea191f8a3 100644
--- a/tests/i915/i915_query.c
+++ b/tests/i915/i915_query.c
@@ -1465,6 +1465,6 @@ igt_main
 		query_parse_and_validate_hwconfig_table(fd);
 
 	igt_fixture {
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/i915_suspend.c b/tests/i915/i915_suspend.c
index a9507964b..1961d85f1 100644
--- a/tests/i915/i915_suspend.c
+++ b/tests/i915/i915_suspend.c
@@ -232,7 +232,7 @@ test_suspend_without_i915(int state)
 		igt_pm_get_d3cold_allowed(&card, d3cold_allowed);
 		igt_pm_set_d3cold_allowed(&card, "0\n");
 	}
-	close(fd);
+	drm_close_driver(fd);
 
 	igt_kmsg(KMSG_INFO "Unloading i915\n");
 	igt_assert_eq(igt_i915_driver_unload(),0);
@@ -315,5 +315,5 @@ igt_main
 		test_forcewake(fd, true);
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c
index a0d5ef730..d132f5b98 100644
--- a/tests/i915/kms_big_fb.c
+++ b/tests/i915/kms_big_fb.c
@@ -1010,6 +1010,6 @@ igt_main
 	igt_fixture {
 		igt_display_fini(&data.display);
 		buf_ops_destroy(data.bops);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/i915/kms_big_joiner.c b/tests/i915/kms_big_joiner.c
index b9dda58f6..2ff23398a 100644
--- a/tests/i915/kms_big_joiner.c
+++ b/tests/i915/kms_big_joiner.c
@@ -302,6 +302,6 @@ igt_main
 	igt_fixture {
 		igt_remove_fb(data.drm_fd, &data.fb);
 		igt_display_fini(&data.display);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/i915/kms_busy.c b/tests/i915/kms_busy.c
index 20d3058fb..74af9229e 100644
--- a/tests/i915/kms_busy.c
+++ b/tests/i915/kms_busy.c
@@ -506,6 +506,6 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	igt_fixture {
 		gpu_engines_restore_timeouts(fd, num_engines, saved_gpu_timeouts);
 		igt_display_fini(&display);
-		close(display.drm_fd);
+		drm_close_driver(display.drm_fd);
 	}
 }
diff --git a/tests/i915/kms_ccs.c b/tests/i915/kms_ccs.c
index 1b3462ea9..2661f661c 100644
--- a/tests/i915/kms_ccs.c
+++ b/tests/i915/kms_ccs.c
@@ -708,6 +708,6 @@ igt_main_args("cs:", NULL, help_str, opt_handler, &data)
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/i915/kms_cdclk.c b/tests/i915/kms_cdclk.c
index 0f9b8dc58..40eca24f0 100644
--- a/tests/i915/kms_cdclk.c
+++ b/tests/i915/kms_cdclk.c
@@ -397,6 +397,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
index db6d71f2e..01ecb7bb9 100644
--- a/tests/i915/kms_draw_crc.c
+++ b/tests/i915/kms_draw_crc.c
@@ -242,7 +242,7 @@ static void teardown_environment(void)
 
 	buf_ops_destroy(bops);
 
-	close(drm_fd);
+	drm_close_driver(drm_fd);
 }
 
 static const char *format_str(int format_index)
diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index c4dfc9251..87aceb1e3 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -257,6 +257,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/i915/kms_fbcon_fbt.c b/tests/i915/kms_fbcon_fbt.c
index 831ec867a..aea724756 100644
--- a/tests/i915/kms_fbcon_fbt.c
+++ b/tests/i915/kms_fbcon_fbt.c
@@ -408,7 +408,7 @@ static void teardown_environment(struct drm_info *drm)
 
 	drmModeFreeResources(drm->res);
 	close(drm->debugfs_fd);
-	close(drm->fd);
+	drm_close_driver(drm->fd);
 	kmstest_restore_vt_mode();
 }
 
diff --git a/tests/i915/kms_fence_pin_leak.c b/tests/i915/kms_fence_pin_leak.c
index 63657a742..c8a6f1aa1 100644
--- a/tests/i915/kms_fence_pin_leak.c
+++ b/tests/i915/kms_fence_pin_leak.c
@@ -238,5 +238,5 @@ igt_simple_main
 
 	buf_ops_destroy(data.bops);
 	igt_display_fini(&data.display);
-	close(data.drm_fd);
+	drm_close_driver(data.drm_fd);
 }
diff --git a/tests/i915/kms_flip_scaled_crc.c b/tests/i915/kms_flip_scaled_crc.c
index f5dc430e3..30da1fcf3 100644
--- a/tests/i915/kms_flip_scaled_crc.c
+++ b/tests/i915/kms_flip_scaled_crc.c
@@ -694,6 +694,6 @@ igt_main
 		}
 		kmstest_set_vt_text_mode();
 		igt_display_fini(&data.display);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/i915/kms_flip_tiling.c b/tests/i915/kms_flip_tiling.c
index a22f12382..02a5fe8e3 100644
--- a/tests/i915/kms_flip_tiling.c
+++ b/tests/i915/kms_flip_tiling.c
@@ -240,6 +240,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index 650e14a77..075e3827b 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -1351,7 +1351,7 @@ static void teardown_drm(void)
 {
 	buf_ops_destroy(drm.bops);
 	igt_display_fini(&drm.display);
-	close(drm.fd);
+	drm_close_driver(drm.fd);
 }
 
 static void setup_modeset(void)
diff --git a/tests/i915/kms_legacy_colorkey.c b/tests/i915/kms_legacy_colorkey.c
index 5b2fd64ba..450cb2e3f 100644
--- a/tests/i915/kms_legacy_colorkey.c
+++ b/tests/i915/kms_legacy_colorkey.c
@@ -87,6 +87,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&display);
-		close(drm_fd);
+		drm_close_driver(drm_fd);
 	}
 }
diff --git a/tests/i915/kms_mmap_write_crc.c b/tests/i915/kms_mmap_write_crc.c
index bc51975f6..77e1cc807 100644
--- a/tests/i915/kms_mmap_write_crc.c
+++ b/tests/i915/kms_mmap_write_crc.c
@@ -303,9 +303,8 @@ igt_main_args("n", NULL, NULL, opt_handler, NULL)
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 
 		igt_stop_helper(&hog);
-		close(data.drm_fd);
 	}
 }
diff --git a/tests/i915/kms_pipe_b_c_ivb.c b/tests/i915/kms_pipe_b_c_ivb.c
index af11e3262..192771794 100644
--- a/tests/i915/kms_pipe_b_c_ivb.c
+++ b/tests/i915/kms_pipe_b_c_ivb.c
@@ -291,6 +291,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/i915/kms_psr.c b/tests/i915/kms_psr.c
index 0e8d7f4f0..0ef5f1e82 100644
--- a/tests/i915/kms_psr.c
+++ b/tests/i915/kms_psr.c
@@ -639,6 +639,6 @@ igt_main_args("", long_options, help_str, opt_handler, &data)
 		close(data.debugfs_fd);
 		buf_ops_destroy(data.bops);
 		display_fini(&data);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
index 4cf986440..a202c613c 100644
--- a/tests/i915/kms_psr2_sf.c
+++ b/tests/i915/kms_psr2_sf.c
@@ -1298,6 +1298,6 @@ igt_main
 	igt_fixture {
 		close(data.debugfs_fd);
 		display_fini(&data);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/i915/kms_psr2_su.c b/tests/i915/kms_psr2_su.c
index 65e67b8c9..3081887ca 100644
--- a/tests/i915/kms_psr2_su.c
+++ b/tests/i915/kms_psr2_su.c
@@ -373,6 +373,6 @@ igt_main
 	igt_fixture {
 		close(data.debugfs_fd);
 		display_fini(&data);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/i915/kms_psr_stress_test.c b/tests/i915/kms_psr_stress_test.c
index a4cb3194e..23dcb4077 100644
--- a/tests/i915/kms_psr_stress_test.c
+++ b/tests/i915/kms_psr_stress_test.c
@@ -378,6 +378,6 @@ igt_main
 		buf_ops_destroy(data.bops);
 		igt_display_fini(&data.display);
 		close(data.debugfs_fd);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/i915/kms_pwrite_crc.c b/tests/i915/kms_pwrite_crc.c
index 3278d876d..7bddeecba 100644
--- a/tests/i915/kms_pwrite_crc.c
+++ b/tests/i915/kms_pwrite_crc.c
@@ -193,5 +193,5 @@ igt_simple_main
 	run_test(&data);
 
 	igt_display_fini(&data.display);
-	close(data.drm_fd);
+	drm_close_driver(data.drm_fd);
 }
diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 9ca4d34b6..760c8d692 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -5299,7 +5299,7 @@ test_i915_ref_count(void)
 	igt_debug("ref count after opening i915 perf stream = %u\n", ref_count1);
 	igt_assert(ref_count1 > ref_count0);
 
-	close(drm_fd);
+	drm_close_driver(drm_fd);
 	close(sysfs);
 	drm_fd = -1;
 	sysfs = -1;
@@ -6008,6 +6008,6 @@ igt_main
 			put_engine_groups(perf_oa_groups, num_perf_oa_groups);
 
 		intel_ctx_destroy(drm_fd, ctx);
-		close(drm_fd);
+		drm_close_driver(drm_fd);
 	}
 }
diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index c5f083bbd..34b0e10f6 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -2111,7 +2111,7 @@ static void test_unload(unsigned int num_engines)
 		if (fd[count] != -1)
 			count++;
 
-		close(i915);
+		drm_close_driver(i915);
 
 		buf = calloc(count, sizeof(uint64_t));
 		igt_assert(buf);
@@ -2436,13 +2436,13 @@ igt_main
 
 		igt_fixture {
 			intel_ctx_destroy(render_fd, render_ctx);
-			close(render_fd);
+			drm_close_driver(render_fd);
 		}
 	}
 
 	igt_fixture {
 		intel_ctx_destroy(fd, ctx);
-		close(fd);
+		drm_close_driver(fd);
 	}
 
 	igt_subtest("module-unload") {
diff --git a/tests/i915/sysfs_defaults.c b/tests/i915/sysfs_defaults.c
index dda27a0af..94437c0a0 100644
--- a/tests/i915/sysfs_defaults.c
+++ b/tests/i915/sysfs_defaults.c
@@ -105,6 +105,6 @@ igt_main
 
 	igt_fixture {
 		close(engines);
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/sysfs_heartbeat_interval.c b/tests/i915/sysfs_heartbeat_interval.c
index 8a3dd3975..467e0728b 100644
--- a/tests/i915/sysfs_heartbeat_interval.c
+++ b/tests/i915/sysfs_heartbeat_interval.c
@@ -514,6 +514,6 @@ igt_main
 
 	igt_fixture {
 		close(engines);
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/sysfs_preempt_timeout.c b/tests/i915/sysfs_preempt_timeout.c
index 5e0a7d962..b686d6ba8 100644
--- a/tests/i915/sysfs_preempt_timeout.c
+++ b/tests/i915/sysfs_preempt_timeout.c
@@ -343,6 +343,6 @@ igt_main
 
 	igt_fixture {
 		close(engines);
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/sysfs_timeslice_duration.c b/tests/i915/sysfs_timeslice_duration.c
index 92c4c5eae..8f0d8d94b 100644
--- a/tests/i915/sysfs_timeslice_duration.c
+++ b/tests/i915/sysfs_timeslice_duration.c
@@ -564,6 +564,6 @@ igt_main
 
 	igt_fixture {
 		close(engines);
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/kms_3d.c b/tests/kms_3d.c
index 437c8a481..55e1d8058 100644
--- a/tests/kms_3d.c
+++ b/tests/kms_3d.c
@@ -119,5 +119,5 @@ igt_simple_main
 	if (is_xe_device(drm_fd))
 		xe_device_put(drm_fd);
 
-	close(drm_fd);
+	drm_close_driver(drm_fd);
 }
diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index e4783624f..1e5d834ce 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -795,7 +795,7 @@ static void master_tests(int fd)
 		do_ioctl_err(master2_fd, DRM_IOCTL_MODE_RMFB, &f.fb_id, ENOENT);
 
 		igt_device_drop_master(master2_fd);
-		close(master2_fd);
+		drm_close_driver(master2_fd);
 
 		igt_device_set_master(fd);
 	}
@@ -874,6 +874,6 @@ igt_main
 		if (is_xe_device(fd))
 			xe_device_put(fd);
 
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 51ffa523a..f44fc4bea 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -668,6 +668,6 @@ igt_main_args("e", NULL, help_str, opt_handler, &data)
 		igt_display_reset(&data.display);
 		igt_display_commit(&data.display);
 		igt_display_fini(&data.display);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 037db2d36..b65045abc 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -1460,6 +1460,6 @@ igt_main
 		igt_remove_fb(display.drm_fd, &fb);
 
 		igt_display_fini(&display);
-		close(display.drm_fd);
+		drm_close_driver(display.drm_fd);
 	}
 }
diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interruptible.c
index 74b2e246a..2acdcb29d 100644
--- a/tests/kms_atomic_interruptible.c
+++ b/tests/kms_atomic_interruptible.c
@@ -389,6 +389,6 @@ igt_main
 	/* TODO: legacy gamma_set/get, object set/getprop, getcrtc, getconnector */
 	igt_fixture {
 		igt_display_fini(&display);
-		close(display.drm_fd);
+		drm_close_driver(display.drm_fd);
 	}
 }
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 9f39d033d..6ab5267ca 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -1182,6 +1182,6 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/kms_color.c b/tests/kms_color.c
index fdc7120c7..d444cfe10 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -1069,6 +1069,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index e1e581723..d915a98b2 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -400,6 +400,6 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		if (is_intel_device(data.drm_fd))
 			intel_allocator_multiprocess_stop();
 		igt_display_fini(&data.display);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 344cac505..6cdf81a28 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -884,6 +884,6 @@ igt_main
 	igt_fixture {
 		test_content_protection_cleanup();
 		igt_display_fini(&data.display);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 3a353a032..d9ae35587 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -1010,6 +1010,6 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		}
 
 		igt_display_fini(&data.display);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index 5f423a18f..462b51e20 100644
--- a/tests/kms_cursor_edge_walk.c
+++ b/tests/kms_cursor_edge_walk.c
@@ -391,6 +391,6 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 7df6a6125..69e52a864 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1803,6 +1803,6 @@ igt_main
 		if (intel_psr2_restore)
 			i915_psr2_sel_fetch_restore(display.drm_fd);
 		igt_display_fini(&display);
-		close(display.drm_fd);
+		drm_close_driver(display.drm_fd);
 	}
 }
diff --git a/tests/kms_dither.c b/tests/kms_dither.c
index 95be6e136..d6c16dd0b 100644
--- a/tests/kms_dither.c
+++ b/tests/kms_dither.c
@@ -247,6 +247,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/kms_dp_aux_dev.c b/tests/kms_dp_aux_dev.c
index 69edc1585..19cbe216a 100644
--- a/tests/kms_dp_aux_dev.c
+++ b/tests/kms_dp_aux_dev.c
@@ -147,5 +147,5 @@ igt_simple_main
 	igt_require(valid_connectors);
 
 	drmModeFreeResources(res);
-	close(drm_fd);
+	drm_close_driver(drm_fd);
 }
diff --git a/tests/kms_dp_tiled_display.c b/tests/kms_dp_tiled_display.c
index 07b803a50..8dfe93000 100644
--- a/tests/kms_dp_tiled_display.c
+++ b/tests/kms_dp_tiled_display.c
@@ -502,6 +502,6 @@ igt_main
 		free(data.conns);
 		kmstest_restore_vt_mode();
 		igt_display_fini(data.display);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index e4c98b8ec..8d6a8e74d 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1898,6 +1898,6 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		if (is_xe_device(drm_fd))
 			xe_device_put(drm_fd);
 
-		close(drm_fd);
+		drm_close_driver(drm_fd);
 	}
 }
diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c
index b79cd5030..7e46f5ec0 100644
--- a/tests/kms_flip_event_leak.c
+++ b/tests/kms_flip_event_leak.c
@@ -79,7 +79,7 @@ static void test(data_t *data, enum pipe pipe, igt_output_t *output)
 
 	if (is_xe_device(fd))
 		xe_device_put(fd);
-	ret = close(fd);
+	ret = drm_close_driver(fd);
 	igt_assert_eq(ret, 0);
 
 	igt_device_set_master(data->drm_fd);
@@ -121,6 +121,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/kms_force_connector_basic.c b/tests/kms_force_connector_basic.c
index f1508efba..d1e516562 100644
--- a/tests/kms_force_connector_basic.c
+++ b/tests/kms_force_connector_basic.c
@@ -60,7 +60,7 @@ static void reset_connectors(void)
 		free(param);
 	}
 
-	close(drm_fd);
+	drm_close_driver(drm_fd);
 }
 
 static void force_load_detect(int drm_fd, drmModeConnectorPtr connector, drmModeRes *res)
@@ -386,7 +386,7 @@ end:
 
 	igt_fixture {
 		drmModeFreeConnector(connector);
-		close(drm_fd);
+		drm_close_driver(drm_fd);
 
 		reset_connectors();
 	}
diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
index 4adc7eee2..3cb568808 100644
--- a/tests/kms_getfb.c
+++ b/tests/kms_getfb.c
@@ -452,7 +452,7 @@ static void test_handle_protection(void) {
 		if (is_xe_device(non_master_fd))
 			xe_device_get(non_master_fd);
 
-		close(non_master_fd);
+		drm_close_driver(non_master_fd);
 	}
 }
 
@@ -484,6 +484,6 @@ igt_main
 		if (is_xe_device(fd))
 			xe_device_put(fd);
 
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c
index 2085d1453..e3db34502 100644
--- a/tests/kms_hdmi_inject.c
+++ b/tests/kms_hdmi_inject.c
@@ -227,6 +227,6 @@ igt_main
 		if (is_xe_device(drm_fd))
 			xe_device_put(drm_fd);
 
-		close(drm_fd);
+		drm_close_driver(drm_fd);
 	}
 }
diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 81a32dbf8..d47a1977c 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -666,6 +666,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-		close(data.fd);
+		drm_close_driver(data.fd);
 	}
 }
diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index ec0483055..6059f1f8f 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -300,6 +300,6 @@ igt_main
 		igt_display_fini(&data.display);
 		igt_reset_connectors();
 		drmModeFreeResources(data.res);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 29a774ae8..c8ae98206 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -1082,7 +1082,7 @@ static void multimaster_lease(data_t *data)
 	drmSetClientCap(master2_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
 	lease2_fd = create_simple_lease(master2_fd, data);
 
-	close(master2_fd); /* close is an implicit DropMaster */
+	drm_close_driver(master2_fd); /* close is an implicit DropMaster */
 	igt_assert(!is_master(lease2_fd));
 
 	igt_device_set_master(data->master.fd);
@@ -1278,6 +1278,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(display);
-		close(data.master.fd);
+		drm_close_driver(data.master.fd);
 	}
 }
diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
index 97ef1ae48..ae1c65928 100644
--- a/tests/kms_panel_fitting.c
+++ b/tests/kms_panel_fitting.c
@@ -288,6 +288,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 65afc9f60..9a354fcfe 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -433,6 +433,6 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 10e16b638..8e0cd2129 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1318,6 +1318,6 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index 0d03e178a..341b85c7e 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -715,6 +715,6 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 				    COMMIT_ATOMIC : COMMIT_LEGACY);
 
 		igt_display_fini(&data.display);
-		close(data.gfx_fd);
+		drm_close_driver(data.gfx_fd);
 	}
 }
diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 59b105c60..a7acb18e1 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -331,6 +331,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index db9f5a54c..7aaf83c41 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -342,6 +342,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 7dd9d586d..1f2bd65c3 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -478,6 +478,6 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index a37abd16d..61d0f8c89 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -1323,6 +1323,6 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index dd5ab993e..52f587961 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -431,7 +431,7 @@ igt_main
 			if (kms_poll_disabled)
 				kms_poll_state_restore();
 
-			close(second_fd_hybrid);
+			drm_close_driver(second_fd_hybrid);
 		}
 	}
 
@@ -454,9 +454,9 @@ igt_main
 		}
 
 		igt_fixture
-			close(second_fd_vgem);
+			drm_close_driver(second_fd_vgem);
 	}
 
 	igt_fixture
-		close(first_fd);
+		drm_close_driver(first_fd);
 }
diff --git a/tests/kms_prop_blob.c b/tests/kms_prop_blob.c
index 96aa6d8d6..d9a5992e4 100644
--- a/tests/kms_prop_blob.c
+++ b/tests/kms_prop_blob.c
@@ -178,7 +178,7 @@ test_lifetime(int fd)
 	/* Make sure properties are cleaned up on client exit. */
 	prop_id2 = create_prop(fd2);
 	igt_assert_eq(validate_prop(fd, prop_id2), 0);
-	igt_assert_eq(close(fd2), 0);
+	igt_assert_eq(drm_close_driver(fd2), 0);
 	igt_assert_eq(validate_prop(fd, prop_id2), ENOENT);
 
 	igt_assert_eq(validate_prop(fd, prop_id), 0);
@@ -206,7 +206,7 @@ test_multiple(int fd)
 		igt_assert_eq(destroy_prop(fd2, prop_ids[i]), 0);
 		igt_assert_eq(validate_prop(fd2, prop_ids[i]), ENOENT);
 	}
-	igt_assert_eq(close(fd2), 0);
+	igt_assert_eq(drm_close_driver(fd2), 0);
 
 	fd2 = drm_open_driver(DRIVER_ANY);
 	igt_assert_fd(fd2);
@@ -217,7 +217,7 @@ test_multiple(int fd)
 		igt_assert_eq(validate_prop(fd, prop_ids[i]), 0);
 		igt_assert_eq(validate_prop(fd2, prop_ids[i]), 0);
 	}
-	igt_assert_eq(close(fd2), 0);
+	igt_assert_eq(drm_close_driver(fd2), 0);
 
 	for (i = 0; i < ARRAY_SIZE(prop_ids); i++)
 		igt_assert_eq(validate_prop(fd, prop_ids[i]), ENOENT);
@@ -338,5 +338,5 @@ igt_main
 	prop_tests(fd);
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 2fe8dfa66..8645808d1 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -810,6 +810,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&display);
-		close(display.drm_fd);
+		drm_close_driver(display.drm_fd);
 	}
 }
diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
index 50df42953..9a41c1d14 100644
--- a/tests/kms_rmfb.c
+++ b/tests/kms_rmfb.c
@@ -121,7 +121,7 @@ test_rmfb(struct rmfb_data *data, igt_output_t *output, enum pipe pipe, bool reo
 	drmModeFreeCrtc(crtc);
 
 	if (reopen) {
-		close(data->drm_fd);
+		drm_close_driver(data->drm_fd);
 
 		data->drm_fd = drm_open_driver_master(DRIVER_ANY);
 		drmSetClientCap(data->drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
@@ -204,6 +204,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 28b4fd27c..f0d8b1172 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -1279,6 +1279,6 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-		close(data.gfx_fd);
+		drm_close_driver(data.gfx_fd);
 	}
 }
diff --git a/tests/kms_scaling_modes.c b/tests/kms_scaling_modes.c
index 906ae76de..31b806ae2 100644
--- a/tests/kms_scaling_modes.c
+++ b/tests/kms_scaling_modes.c
@@ -138,6 +138,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
index c8a3d6bbd..1b96f0017 100644
--- a/tests/kms_sequence.c
+++ b/tests/kms_sequence.c
@@ -303,6 +303,6 @@ igt_main
 	}
 
 	igt_fixture {
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index a611d9382..a85f4eaf2 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -978,6 +978,6 @@ igt_main_args("det:", NULL, help_str, opt_handler, NULL)
 		if (is_xe_device(drm_fd))
 			xe_device_put(drm_fd);
 
-		close(drm_fd);
+		drm_close_driver(drm_fd);
 	}
 }
diff --git a/tests/kms_tv_load_detect.c b/tests/kms_tv_load_detect.c
index 80ced9918..c8e5338d2 100644
--- a/tests/kms_tv_load_detect.c
+++ b/tests/kms_tv_load_detect.c
@@ -84,6 +84,6 @@ igt_main
 
 	igt_fixture {
 		drmModeFreeConnector(tv_connector);
-		close(drm_fd);
+		drm_close_driver(drm_fd);
 	}
 }
diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 635a136ab..957d600f1 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -918,6 +918,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index da0ada78e..1aa8c1083 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -601,6 +601,6 @@ igt_main
 			run_subtests_for_pipe(&data);
 
 	igt_fixture {
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index d2d79c4eb..6a766bfb9 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -528,5 +528,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&data.display);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index c4808b02c..db1f0884f 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -606,5 +606,6 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
 		detach_crtc(&display, output);
 		igt_remove_fb(display.drm_fd, &input_fb);
 		igt_display_fini(&display);
+		drm_close_driver(display.drm_fd);
 	}
 }
diff --git a/tests/nouveau_crc.c b/tests/nouveau_crc.c
index 785d39bde..d5aa0e650 100644
--- a/tests/nouveau_crc.c
+++ b/tests/nouveau_crc.c
@@ -409,7 +409,9 @@ igt_main
 			close(data.nv_crc_dir);
 		}
 	}
-	igt_fixture
-		igt_display_fini(&data.display);
 
+	igt_fixture {
+		igt_display_fini(&data.display);
+		drm_close_driver(data.drm_fd);
+	}
 }
diff --git a/tests/panfrost_gem_new.c b/tests/panfrost_gem_new.c
index 940525ff1..4f27e029d 100644
--- a/tests/panfrost_gem_new.c
+++ b/tests/panfrost_gem_new.c
@@ -82,9 +82,9 @@ igt_main
 		munmap(map, size);
 		igt_panfrost_free_bo(fd2, bo);
 
-		close(fd2);
+		drm_close_driver(fd2);
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/panfrost_get_param.c b/tests/panfrost_get_param.c
index 11c2632b8..7d1ebecb4 100644
--- a/tests/panfrost_get_param.c
+++ b/tests/panfrost_get_param.c
@@ -69,5 +69,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/panfrost_prime.c b/tests/panfrost_prime.c
index 40ba036b2..dbc1cb46b 100644
--- a/tests/panfrost_prime.c
+++ b/tests/panfrost_prime.c
@@ -96,7 +96,7 @@ igt_main
 	}
 
 	igt_fixture {
-		close(fd);
-		close(kms_fd);
+		drm_close_driver(fd);
+		drm_close_driver(kms_fd);
 	}
 }
diff --git a/tests/panfrost_submit.c b/tests/panfrost_submit.c
index 4747d2957..70af55e0b 100644
--- a/tests/panfrost_submit.c
+++ b/tests/panfrost_submit.c
@@ -154,7 +154,7 @@ igt_main
                 check_done(headers[2]);
                 igt_panfrost_free_job(fd, submit[0]);
                 igt_panfrost_free_job(tmpfd, submit[1]);
-                close(tmpfd);
+                drm_close_driver(tmpfd);
         }
 
         igt_subtest("pan-submit-and-close") {
@@ -165,7 +165,7 @@ igt_main
                 submit = igt_panfrost_job_loop(tmpfd);
                 do_ioctl(tmpfd, DRM_IOCTL_PANFROST_SUBMIT, submit->args);
                 igt_panfrost_free_job(tmpfd, submit);
-                close(tmpfd);
+                drm_close_driver(tmpfd);
         }
 
         igt_subtest("pan-unhandled-pagefault") {
@@ -197,6 +197,6 @@ igt_main
         }
 
         igt_fixture {
-                close(fd);
+                drm_close_driver(fd);
         }
 }
diff --git a/tests/prime_busy.c b/tests/prime_busy.c
index 343020f13..f9f1674d4 100644
--- a/tests/prime_busy.c
+++ b/tests/prime_busy.c
@@ -162,6 +162,6 @@ igt_main
 
 	igt_fixture {
 		intel_ctx_destroy(fd, ctx);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/prime_mmap.c b/tests/prime_mmap.c
index bc19f68c9..1c2d2a301 100644
--- a/tests/prime_mmap.c
+++ b/tests/prime_mmap.c
@@ -557,6 +557,6 @@ igt_main
 		free(query_info);
 		igt_collection_destroy(set);
 		igt_collection_destroy(dma_buf_set);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/prime_mmap_coherency.c b/tests/prime_mmap_coherency.c
index b22fb35c1..a18c16c5c 100644
--- a/tests/prime_mmap_coherency.c
+++ b/tests/prime_mmap_coherency.c
@@ -249,7 +249,7 @@ static void blit_and_cmp(void)
 
 	intel_bb_destroy(local_batch);
 	buf_ops_destroy(local_bops);
-	close(local_fd);
+	drm_close_driver(local_fd);
 }
 
 /*
@@ -346,6 +346,6 @@ igt_main
 	igt_fixture {
 		buf_ops_destroy(bops);
 
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/prime_mmap_kms.c b/tests/prime_mmap_kms.c
index 8b127a13c..1a63be38f 100644
--- a/tests/prime_mmap_kms.c
+++ b/tests/prime_mmap_kms.c
@@ -263,6 +263,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&gpu.display);
-		close(gpu.drm_fd);
+		drm_close_driver(gpu.drm_fd);
 	}
 }
diff --git a/tests/prime_self_import.c b/tests/prime_self_import.c
index bf5486194..0b5ac256d 100644
--- a/tests/prime_self_import.c
+++ b/tests/prime_self_import.c
@@ -106,8 +106,8 @@ static void test_with_fd_dup(void)
 	close(dma_buf_fd2);
 	check_bo(fd2, handle_import, fd2, handle_import);
 
-	close(fd1);
-	close(fd2);
+	drm_close_driver(fd1);
+	drm_close_driver(fd2);
 }
 
 static void test_with_two_bos(void)
@@ -139,8 +139,8 @@ static void test_with_two_bos(void)
 
 	check_bo(fd2, handle_import, fd2, handle_import);
 
-	close(fd1);
-	close(fd2);
+	drm_close_driver(fd1);
+	drm_close_driver(fd2);
 }
 
 static void test_with_one_bo_two_files(void)
@@ -164,8 +164,8 @@ static void test_with_one_bo_two_files(void)
 	/* dma-buf self importing an flink bo should give the same handle */
 	igt_assert_eq_u32(handle_import, handle_open);
 
-	close(fd1);
-	close(fd2);
+	drm_close_driver(fd1);
+	drm_close_driver(fd2);
 	close(dma_buf_fd1);
 	close(dma_buf_fd2);
 }
@@ -211,7 +211,7 @@ static void test_with_one_bo(void)
 	check_bo(fd1, handle, fd2, handle_import1);
 
 	/* Completely rip out exporting fd. */
-	close(fd1);
+	drm_close_driver(fd1);
 	check_bo(fd2, handle_import1, fd2, handle_import1);
 }
 
@@ -275,14 +275,14 @@ static void test_reimport_close_race(void)
 		igt_assert(status == 0);
 	}
 
-	close(fds[0]);
+	drm_close_driver(fds[0]);
 	close(fds[1]);
 
 	obj_count = igt_get_stable_obj_count(fake) - obj_count;
 
 	igt_info("leaked %i objects\n", obj_count);
 
-	close(fake);
+	drm_close_driver(fake);
 
 	igt_assert_eq(obj_count, 0);
 }
@@ -357,13 +357,13 @@ static void test_export_close_race(void)
 		igt_assert(status == 0);
 	}
 
-	close(fd);
+	drm_close_driver(fd);
 
 	obj_count = igt_get_stable_obj_count(fake) - obj_count;
 
 	igt_info("leaked %i objects\n", obj_count);
 
-	close(fake);
+	drm_close_driver(fake);
 
 	igt_assert_eq(obj_count, 0);
 }
@@ -392,7 +392,7 @@ static void test_llseek_size(void)
 		close(dma_buf_fd);
 	}
 
-	close(fd);
+	drm_close_driver(fd);
 }
 
 static void test_llseek_bad(void)
@@ -421,7 +421,7 @@ static void test_llseek_bad(void)
 
 	close(dma_buf_fd);
 
-	close(fd);
+	drm_close_driver(fd);
 }
 
 igt_main
diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index 9aa767c9c..9bd22641c 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -1249,7 +1249,7 @@ igt_main
 
 
 	igt_fixture {
-		close(i915);
-		close(vgem);
+		drm_close_driver(i915);
+		drm_close_driver(vgem);
 	}
 }
diff --git a/tests/syncobj_basic.c b/tests/syncobj_basic.c
index 6e20c3411..beb44b1e9 100644
--- a/tests/syncobj_basic.c
+++ b/tests/syncobj_basic.c
@@ -232,7 +232,7 @@ igt_main
 		test_valid_cycle(fd);
 
 	igt_fixture {
-		close(fd);
+		drm_close_driver(fd);
 	}
 
 }
diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
index 7f5ff6f6c..081f440f3 100644
--- a/tests/syncobj_timeline.c
+++ b/tests/syncobj_timeline.c
@@ -1538,6 +1538,6 @@ igt_main
 		test_32bits_limit(fd);
 
 	igt_fixture {
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/syncobj_wait.c b/tests/syncobj_wait.c
index 427b6b119..eebc96b67 100644
--- a/tests/syncobj_wait.c
+++ b/tests/syncobj_wait.c
@@ -914,6 +914,6 @@ igt_main
 		test_wait_interrupted(fd, WAIT_ALL);
 
 	igt_fixture {
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/template.c b/tests/template.c
index e23814fb7..ae2681c01 100644
--- a/tests/template.c
+++ b/tests/template.c
@@ -76,6 +76,6 @@ igt_main
 	 */
 
 	igt_fixture {
-		close(drm_fd);
+		drm_close_driver(drm_fd);
 	}
 }
diff --git a/tests/testdisplay.c b/tests/testdisplay.c
index ee272dfb2..294d4c604 100644
--- a/tests/testdisplay.c
+++ b/tests/testdisplay.c
@@ -548,7 +548,7 @@ int update_display(bool probe)
 
 __noreturn static void cleanup_and_exit(int ret)
 {
-	close(drm_fd);
+	drm_close_driver(drm_fd);
 	exit(ret);
 }
 
@@ -779,7 +779,7 @@ out_hotplug:
 out_mainloop:
 	g_main_loop_unref(mainloop);
 out_close:
-	close(drm_fd);
+	drm_close_driver(drm_fd);
 
 	igt_assert_eq(ret, 0);
 }
diff --git a/tests/v3d/v3d_create_bo.c b/tests/v3d/v3d_create_bo.c
index 4142fb5f6..07d237e96 100644
--- a/tests/v3d/v3d_create_bo.c
+++ b/tests/v3d/v3d_create_bo.c
@@ -63,9 +63,9 @@ igt_main
 			igt_assert_eq_u32(((uint32_t *)bo->map)[i], 0x0);
 		igt_v3d_free_bo(fd2, bo);
 
-		close(fd2);
+		drm_close_driver(fd2);
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/v3d/v3d_get_bo_offset.c b/tests/v3d/v3d_get_bo_offset.c
index 5c208f940..533488420 100644
--- a/tests/v3d/v3d_get_bo_offset.c
+++ b/tests/v3d/v3d_get_bo_offset.c
@@ -67,5 +67,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/v3d/v3d_get_param.c b/tests/v3d/v3d_get_param.c
index 0ca330eb5..0d8fbf3d6 100644
--- a/tests/v3d/v3d_get_param.c
+++ b/tests/v3d/v3d_get_param.c
@@ -69,5 +69,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/v3d/v3d_job_submission.c b/tests/v3d/v3d_job_submission.c
index d6e415bb2..e4ca7e89d 100644
--- a/tests/v3d/v3d_job_submission.c
+++ b/tests/v3d/v3d_job_submission.c
@@ -219,5 +219,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/v3d/v3d_mmap.c b/tests/v3d/v3d_mmap.c
index 567940a80..642c55c65 100644
--- a/tests/v3d/v3d_mmap.c
+++ b/tests/v3d/v3d_mmap.c
@@ -75,5 +75,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/v3d/v3d_perfmon.c b/tests/v3d/v3d_perfmon.c
index 3f55ddb1d..4d6ea465f 100644
--- a/tests/v3d/v3d_perfmon.c
+++ b/tests/v3d/v3d_perfmon.c
@@ -142,5 +142,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/v3d/v3d_submit_cl.c b/tests/v3d/v3d_submit_cl.c
index 725bc1dff..293b146e2 100644
--- a/tests/v3d/v3d_submit_cl.c
+++ b/tests/v3d/v3d_submit_cl.c
@@ -376,5 +376,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/v3d/v3d_submit_csd.c b/tests/v3d/v3d_submit_csd.c
index 3ec0ee49f..0e19913c6 100644
--- a/tests/v3d/v3d_submit_csd.c
+++ b/tests/v3d/v3d_submit_csd.c
@@ -360,5 +360,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/v3d/v3d_wait_bo.c b/tests/v3d/v3d_wait_bo.c
index 9e51b6a05..6ed999426 100644
--- a/tests/v3d/v3d_wait_bo.c
+++ b/tests/v3d/v3d_wait_bo.c
@@ -122,6 +122,6 @@ igt_main
 
 	igt_fixture {
 		igt_v3d_free_bo(fd, bo);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/vc4/vc4_create_bo.c b/tests/vc4/vc4_create_bo.c
index c17f25b04..ba7db1985 100644
--- a/tests/vc4/vc4_create_bo.c
+++ b/tests/vc4/vc4_create_bo.c
@@ -72,9 +72,9 @@ igt_main
 		munmap(map, size);
 		gem_close(fd2, handle);
 
-		close(fd2);
+		drm_close_driver(fd2);
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/vc4/vc4_dmabuf_poll.c b/tests/vc4/vc4_dmabuf_poll.c
index c76d4950e..56f60b202 100644
--- a/tests/vc4/vc4_dmabuf_poll.c
+++ b/tests/vc4/vc4_dmabuf_poll.c
@@ -73,5 +73,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/vc4/vc4_label_bo.c b/tests/vc4/vc4_label_bo.c
index 252bd1ed8..5d626a92d 100644
--- a/tests/vc4/vc4_label_bo.c
+++ b/tests/vc4/vc4_label_bo.c
@@ -82,5 +82,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/vc4/vc4_lookup_fail.c b/tests/vc4/vc4_lookup_fail.c
index 5e709a7d3..9f179a3fd 100644
--- a/tests/vc4/vc4_lookup_fail.c
+++ b/tests/vc4/vc4_lookup_fail.c
@@ -67,5 +67,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/vc4/vc4_mmap.c b/tests/vc4/vc4_mmap.c
index 8094f4a2d..fef25f334 100644
--- a/tests/vc4/vc4_mmap.c
+++ b/tests/vc4/vc4_mmap.c
@@ -49,5 +49,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/vc4/vc4_perfmon.c b/tests/vc4/vc4_perfmon.c
index 664633a3f..b25e92096 100644
--- a/tests/vc4/vc4_perfmon.c
+++ b/tests/vc4/vc4_perfmon.c
@@ -135,5 +135,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/vc4/vc4_purgeable_bo.c b/tests/vc4/vc4_purgeable_bo.c
index 9d6a3b438..7e9ac1718 100644
--- a/tests/vc4/vc4_purgeable_bo.c
+++ b/tests/vc4/vc4_purgeable_bo.c
@@ -249,5 +249,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/vc4/vc4_tiling.c b/tests/vc4/vc4_tiling.c
index f5bf31f56..e9d3ebfb3 100644
--- a/tests/vc4/vc4_tiling.c
+++ b/tests/vc4/vc4_tiling.c
@@ -124,5 +124,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/vc4/vc4_wait_bo.c b/tests/vc4/vc4_wait_bo.c
index c88a4ac46..d309acc95 100644
--- a/tests/vc4/vc4_wait_bo.c
+++ b/tests/vc4/vc4_wait_bo.c
@@ -111,5 +111,5 @@ igt_main
 		test_used_bo(fd, ~0ull);
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/vc4/vc4_wait_seqno.c b/tests/vc4/vc4_wait_seqno.c
index 78984fa32..e029a613e 100644
--- a/tests/vc4/vc4_wait_seqno.c
+++ b/tests/vc4/vc4_wait_seqno.c
@@ -55,5 +55,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/vgem_basic.c b/tests/vgem_basic.c
index ada5518d7..36899b307 100644
--- a/tests/vgem_basic.c
+++ b/tests/vgem_basic.c
@@ -64,8 +64,8 @@ static void test_setversion(int fd)
 
 static void test_client(int fd)
 {
-	close(drm_open_driver(DRIVER_VGEM));
-	close(drm_open_driver_render(DRIVER_VGEM));
+	drm_close_driver(drm_open_driver(DRIVER_VGEM));
+	drm_close_driver(drm_open_driver_render(DRIVER_VGEM));
 }
 
 static void test_create(int fd)
@@ -537,6 +537,6 @@ igt_main
 		test_debugfs_read(fd);
 
 	igt_fixture {
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/vgem_slow.c b/tests/vgem_slow.c
index 58b09e421..4c4e94ea0 100644
--- a/tests/vgem_slow.c
+++ b/tests/vgem_slow.c
@@ -85,6 +85,6 @@ igt_main
 		test_nohang(fd);
 
 	igt_fixture {
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/vmwgfx/vmw_execution_buffer.c b/tests/vmwgfx/vmw_execution_buffer.c
index 42322514e..b89770b30 100644
--- a/tests/vmwgfx/vmw_execution_buffer.c
+++ b/tests/vmwgfx/vmw_execution_buffer.c
@@ -308,6 +308,6 @@ igt_main_args("st:", long_options, NULL, parse_options, NULL)
 	igt_fixture
 	{
 		vmw_ioctl_context_destroy(fd, cid);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/vmwgfx/vmw_ref_count.c b/tests/vmwgfx/vmw_ref_count.c
index 013214ff0..da4b41f89 100644
--- a/tests/vmwgfx/vmw_ref_count.c
+++ b/tests/vmwgfx/vmw_ref_count.c
@@ -314,7 +314,7 @@ igt_main
 
 	igt_fixture
 	{
-		close(fd1);
-		close(fd2);
+		drm_close_driver(fd1);
+		drm_close_driver(fd2);
 	}
 }
diff --git a/tests/vmwgfx/vmw_surface_copy.c b/tests/vmwgfx/vmw_surface_copy.c
index d7c2711a8..57e90334f 100644
--- a/tests/vmwgfx/vmw_surface_copy.c
+++ b/tests/vmwgfx/vmw_surface_copy.c
@@ -336,6 +336,6 @@ igt_main
 	igt_fixture
 	{
 		vmw_ioctl_context_destroy(fd, cid);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/xe/xe_compute.c b/tests/xe/xe_compute.c
index 7ac64dfe3..5e6cd8529 100644
--- a/tests/xe/xe_compute.c
+++ b/tests/xe/xe_compute.c
@@ -45,6 +45,6 @@ igt_main
 
 	igt_fixture {
 		xe_device_put(xe);
-		close(xe);
+		drm_close_driver(xe);
 	}
 }
diff --git a/tests/xe/xe_create.c b/tests/xe/xe_create.c
index ae841f809..b3d9fd49f 100644
--- a/tests/xe/xe_create.c
+++ b/tests/xe/xe_create.c
@@ -102,6 +102,6 @@ igt_main
 
 	igt_fixture {
 		xe_device_put(xe);
-		close(xe);
+		drm_close_driver(xe);
 	}
 }
diff --git a/tests/xe/xe_debugfs.c b/tests/xe/xe_debugfs.c
index 6bdd3ef06..4006981c6 100644
--- a/tests/xe/xe_debugfs.c
+++ b/tests/xe/xe_debugfs.c
@@ -270,6 +270,6 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 
 	igt_fixture {
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/xe/xe_dma_buf_sync.c b/tests/xe/xe_dma_buf_sync.c
index 8920b141b..81ece2428 100644
--- a/tests/xe/xe_dma_buf_sync.c
+++ b/tests/xe/xe_dma_buf_sync.c
@@ -220,7 +220,7 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
 
 	for (i = 0; i < N_FD; ++i) {
 		xe_device_put(fd[i]);
-		close(fd[i]);
+		drm_close_driver(fd[i]);
 	}
 
 }
@@ -257,6 +257,6 @@ igt_main
 
 	igt_fixture {
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/xe/xe_evict.c b/tests/xe/xe_evict.c
index 5687cce30..14a2d19f1 100644
--- a/tests/xe/xe_evict.c
+++ b/tests/xe/xe_evict.c
@@ -201,7 +201,7 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
 		xe_vm_destroy(fd, vm3);
 	}
 	xe_device_put(fd);
-	close(fd);
+	drm_close_driver(fd);
 }
 
 static void
@@ -369,7 +369,7 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
 	if (flags & MULTI_VM)
 		xe_vm_destroy(fd, vm2);
 	xe_device_put(fd);
-	close(fd);
+	drm_close_driver(fd);
 }
 
 struct thread_data {
@@ -701,5 +701,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/xe/xe_exec_balancer.c b/tests/xe/xe_exec_balancer.c
index 2018c8104..fb4592903 100644
--- a/tests/xe/xe_exec_balancer.c
+++ b/tests/xe/xe_exec_balancer.c
@@ -708,6 +708,6 @@ igt_main
 
 	igt_fixture {
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/xe/xe_exec_basic.c b/tests/xe/xe_exec_basic.c
index 2a176a5b3..d14a764f4 100644
--- a/tests/xe/xe_exec_basic.c
+++ b/tests/xe/xe_exec_basic.c
@@ -353,6 +353,6 @@ igt_main
 
 	igt_fixture {
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/xe/xe_exec_compute_mode.c b/tests/xe/xe_exec_compute_mode.c
index 685193990..950cb6159 100644
--- a/tests/xe/xe_exec_compute_mode.c
+++ b/tests/xe/xe_exec_compute_mode.c
@@ -361,6 +361,6 @@ igt_main
 
 	igt_fixture {
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/xe/xe_exec_fault_mode.c b/tests/xe/xe_exec_fault_mode.c
index a3ab17270..8cd883c09 100644
--- a/tests/xe/xe_exec_fault_mode.c
+++ b/tests/xe/xe_exec_fault_mode.c
@@ -570,6 +570,6 @@ igt_main
 
 	igt_fixture {
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/xe/xe_exec_reset.c b/tests/xe/xe_exec_reset.c
index 0d72a3f20..3700b8dce 100644
--- a/tests/xe/xe_exec_reset.c
+++ b/tests/xe/xe_exec_reset.c
@@ -294,7 +294,7 @@ test_balancer(int fd, int gt, int class, int n_engines, int n_execs,
 				xe_engine_destroy(fd, engines[i]);
 		}
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 		/* FIXME: wait for idle */
 		usleep(150000);
 		return;
@@ -475,7 +475,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 				xe_engine_destroy(fd, engines[i]);
 		}
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 		/* FIXME: wait for idle */
 		usleep(150000);
 		return;
@@ -655,7 +655,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 				xe_engine_destroy(fd, engines[i]);
 		}
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 		/* FIXME: wait for idle */
 		usleep(150000);
 		return;
@@ -946,6 +946,6 @@ igt_main
 
 	igt_fixture {
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/xe/xe_exec_threads.c b/tests/xe/xe_exec_threads.c
index 3f2c2de9e..bde92a9c5 100644
--- a/tests/xe/xe_exec_threads.c
+++ b/tests/xe/xe_exec_threads.c
@@ -245,7 +245,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 		xe_vm_destroy(fd, vm);
 	if (owns_fd) {
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
 
@@ -454,7 +454,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		xe_vm_destroy(fd, vm);
 	if (owns_fd) {
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
 
@@ -698,7 +698,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		xe_vm_destroy(fd, vm);
 	if (owns_fd) {
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
 
@@ -1403,6 +1403,6 @@ igt_main
 
 	igt_fixture {
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/xe/xe_guc_pc.c b/tests/xe/xe_guc_pc.c
index 5c71ae147..56d4f9190 100644
--- a/tests/xe/xe_guc_pc.c
+++ b/tests/xe/xe_guc_pc.c
@@ -496,6 +496,6 @@ igt_main
 		}
 		close(sysfs);
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/xe/xe_huc_copy.c b/tests/xe/xe_huc_copy.c
index fdac907d6..ccdfe8622 100644
--- a/tests/xe/xe_huc_copy.c
+++ b/tests/xe/xe_huc_copy.c
@@ -192,6 +192,6 @@ igt_main
 
 	igt_fixture {
 		xe_device_put(xe);
-		close(xe);
+		drm_close_driver(xe);
 	}
 }
diff --git a/tests/xe/xe_intel_bb.c b/tests/xe/xe_intel_bb.c
index 35d61608e..f43beb1a8 100644
--- a/tests/xe/xe_intel_bb.c
+++ b/tests/xe/xe_intel_bb.c
@@ -1180,6 +1180,6 @@ igt_main_args("dpib", NULL, help_str, opt_handler, NULL)
 	igt_fixture {
 		xe_device_put(xe);
 		buf_ops_destroy(bops);
-		close(xe);
+		drm_close_driver(xe);
 	}
 }
diff --git a/tests/xe/xe_mmap.c b/tests/xe/xe_mmap.c
index 6b313a189..352cbcab4 100644
--- a/tests/xe/xe_mmap.c
+++ b/tests/xe/xe_mmap.c
@@ -77,6 +77,6 @@ igt_main
 
 	igt_fixture {
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/xe/xe_mmio.c b/tests/xe/xe_mmio.c
index 42b6241b1..77a38b8d1 100644
--- a/tests/xe/xe_mmio.c
+++ b/tests/xe/xe_mmio.c
@@ -89,6 +89,6 @@ igt_main
 
 	igt_fixture {
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/xe/xe_module_load.c b/tests/xe/xe_module_load.c
index c2d43cc20..16432c78f 100644
--- a/tests/xe/xe_module_load.c
+++ b/tests/xe/xe_module_load.c
@@ -86,7 +86,7 @@ static void load_and_check_xe(const char *opts)
 	/* driver is ready, check if it's bound */
 	drm_fd = __drm_open_driver(DRIVER_XE);
 	igt_fail_on_f(drm_fd < 0, "Cannot open the xe DRM driver after modprobing xe.\n");
-	close(drm_fd);
+	drm_close_driver(drm_fd);
 }
 
 static const char * const unwanted_drivers[] = {
diff --git a/tests/xe/xe_noexec_ping_pong.c b/tests/xe/xe_noexec_ping_pong.c
index 367671883..f276e694c 100644
--- a/tests/xe/xe_noexec_ping_pong.c
+++ b/tests/xe/xe_noexec_ping_pong.c
@@ -104,5 +104,5 @@ igt_simple_main
 	test_ping_pong(fd, xe_hw_engine(fd, 0));
 
 	xe_device_put(fd);
-	close(fd);
+	drm_close_driver(fd);
 }
diff --git a/tests/xe/xe_pm.c b/tests/xe/xe_pm.c
index 44154143c..7bec294ed 100644
--- a/tests/xe/xe_pm.c
+++ b/tests/xe/xe_pm.c
@@ -441,6 +441,6 @@ igt_main
 		set_d3cold_allowed(device.pci_xe, d3cold_allowed);
 		igt_restore_runtime_pm();
 		xe_device_put(device.fd_xe);
-		close(device.fd_xe);
+		drm_close_driver(device.fd_xe);
 	}
 }
diff --git a/tests/xe/xe_prime_self_import.c b/tests/xe/xe_prime_self_import.c
index 4e8fd5d4f..a86d0e9f2 100644
--- a/tests/xe/xe_prime_self_import.c
+++ b/tests/xe/xe_prime_self_import.c
@@ -122,9 +122,9 @@ static void test_with_fd_dup(void)
 	check_bo(fd2, handle_import, fd2, handle_import);
 
 	xe_device_put(fd1);
-	close(fd1);
+	drm_close_driver(fd1);
 	xe_device_put(fd2);
-	close(fd2);
+	drm_close_driver(fd2);
 }
 
 /**
@@ -166,9 +166,9 @@ static void test_with_two_bos(void)
 	check_bo(fd2, handle_import, fd2, handle_import);
 
 	xe_device_put(fd1);
-	close(fd1);
+	drm_close_driver(fd1);
 	xe_device_put(fd2);
-	close(fd2);
+	drm_close_driver(fd2);
 }
 
 /**
@@ -202,9 +202,9 @@ static void test_with_one_bo_two_files(void)
 	igt_assert_eq_u32(handle_import, handle_open);
 
 	xe_device_put(fd1);
-	close(fd1);
+	drm_close_driver(fd1);
 	xe_device_put(fd2);
-	close(fd2);
+	drm_close_driver(fd2);
 	close(dma_buf_fd1);
 	close(dma_buf_fd2);
 }
@@ -259,10 +259,10 @@ static void test_with_one_bo(void)
 
 	/* Completely rip out exporting fd. */
 	xe_device_put(fd1);
-	close(fd1);
+	drm_close_driver(fd1);
 	check_bo(fd2, handle_import1, fd2, handle_import1);
 	xe_device_put(fd2);
-	close(fd2);
+	drm_close_driver(fd2);
 }
 
 static void *thread_fn_reimport_vs_close(void *p)
@@ -335,7 +335,7 @@ static void *thread_fn_reimport_vs_close(void *p)
 
 	pthread_barrier_destroy(&g_barrier);
 	xe_device_put(fds[0]);
-	close(fds[0]);
+	drm_close_driver(fds[0]);
 	close(fds[1]);
 
 	/* TODO: Read object count */
@@ -343,7 +343,7 @@ static void *thread_fn_reimport_vs_close(void *p)
 
 	igt_info("leaked %i objects\n", obj_count);
 
-	close(fake);
+	drm_close_driver(fake);
 
 	igt_assert_eq(obj_count, 0);
 }
@@ -429,7 +429,7 @@ static void test_export_close_race(void)
 
 	pthread_barrier_destroy(&g_barrier);
 	xe_device_put(fd);
-	close(fd);
+	drm_close_driver(fd);
 
 	/* TODO: Read object count */
 	obj_count = 0;
@@ -437,7 +437,7 @@ static void test_export_close_race(void)
 	igt_info("leaked %i objects\n", obj_count);
 
 	xe_device_put(fake);
-	close(fake);
+	drm_close_driver(fake);
 
 	igt_assert_eq(obj_count, 0);
 }
@@ -474,7 +474,7 @@ static void test_llseek_size(void)
 	}
 
 	xe_device_put(fd);
-	close(fd);
+	drm_close_driver(fd);
 }
 
 /**
@@ -511,7 +511,7 @@ static void test_llseek_bad(void)
 	close(dma_buf_fd);
 
 	xe_device_put(fd);
-	close(fd);
+	drm_close_driver(fd);
 }
 
 igt_main
@@ -544,6 +544,6 @@ igt_main
 
 	igt_fixture {
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/xe/xe_query.c b/tests/xe/xe_query.c
index 87990370f..1c06534d4 100644
--- a/tests/xe/xe_query.c
+++ b/tests/xe/xe_query.c
@@ -491,6 +491,6 @@ igt_main
 
 	igt_fixture {
 		xe_device_put(xe);
-		close(xe);
+		drm_close_driver(xe);
 	}
 }
diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
index d4cec104e..9015a5a57 100644
--- a/tests/xe/xe_vm.c
+++ b/tests/xe/xe_vm.c
@@ -1839,6 +1839,6 @@ igt_main
 
 	igt_fixture {
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/xe/xe_waitfence.c b/tests/xe/xe_waitfence.c
index cdfcacdb4..8bfb741f6 100644
--- a/tests/xe/xe_waitfence.c
+++ b/tests/xe/xe_waitfence.c
@@ -98,6 +98,6 @@ igt_main
 
 	igt_fixture {
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
-- 
2.40.0


