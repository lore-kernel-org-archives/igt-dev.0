Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C682CFA441
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 19:14:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D791210E7D0;
	Thu, 20 Nov 2025 19:14:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LCMrdo1o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C1310E7CF
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 19:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763666066; x=1795202066;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=B6qC0YVPymfsoXbclBtARcX/QO5WDzuQUnOQlBgZglo=;
 b=LCMrdo1oxjMWVpfUBIyEa9prGK4gOmkq5ARUplQGIG+gII6ZeZw6J9YO
 7uORYyycvc1LepZ92F1MVZmYU622ybNSs6UXiNNP8inHD4MD5c5U5MWyY
 I7tXcv96RNRuiXwPlu3SYYPh+jVnBO+ONu8Qhx3u3dr5WcHBAZI4BIv4l
 eSIJ57b+MLnSt7d0etUAGTIoNvIvF/ShjCT/U+BsTrYKJaE3BeQL6x19s
 m9g+3TofC1jukf22TUBgvROz9L8w9x3f2T7saDPgIRD6ueshjLDn8mg+Z
 2VrjJmCEZPg6Fr90yAC5Ku0DGMoXUcDbGmhk3ZOl/smqR/9cXoRuKFnfZ w==;
X-CSE-ConnectionGUID: nzgIEKqrQn+AS0MluTRP5g==
X-CSE-MsgGUID: IZ0ms3SWRHumjlRXh6ZQXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65448705"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="65448705"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 11:14:26 -0800
X-CSE-ConnectionGUID: xiJQYGLOTN+BJW6JRhz+Og==
X-CSE-MsgGUID: VBVBxubaS5uXjWr4Emit8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="195753430"
Received: from inaky-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.245.244.92])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 11:14:24 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/7] igt: Make igt_fixture look like an iterator
Date: Thu, 20 Nov 2025 21:14:09 +0200
Message-ID: <20251120191415.4236-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251120191415.4236-1-ville.syrjala@linux.intel.com>
References: <20251120191415.4236-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Turn igt_fixture into igt_fixture(). This allows coccinelle
to parse it when given a helping hand with the
'iterator name igt_fixture' directive.

Conversion done via:
$ find -type f -name \*.[ch] -exec sed -i 's/\([^_]\)igt_fixture/\1igt_fixture()/g' {} +

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 benchmarks/gem_userptr_benchmark.c            |   4 +-
 lib/igt_aux.c                                 |   6 +-
 lib/igt_core.c                                |  18 +--
 lib/igt_core.h                                |   8 +-
 lib/igt_dir.c                                 |   8 +-
 lib/igt_gt.c                                  |   2 +-
 lib/igt_kmod.c                                |   8 +-
 lib/igt_types.h                               |   2 +-
 lib/intel_batchbuffer.c                       |   2 +-
 lib/tests/igt_abort.c                         |   2 +-
 lib/tests/igt_audio.c                         |   4 +-
 lib/tests/igt_can_fail.c                      |   2 +-
 lib/tests/igt_describe.c                      |   2 +-
 lib/tests/igt_exit_handler.c                  |   2 +-
 lib/tests/igt_hook.c                          |   2 +-
 lib/tests/igt_nesting.c                       |  10 +-
 lib/tests/igt_simulation.c                    |   2 +-
 lib/tests/igt_subtest_group.c                 |   8 +-
 lib/tests/igt_types.c                         |  12 +-
 runner/resultgen.c                            |   2 +-
 runner/runner_kmemleak_test.c                 |   6 +-
 runner/runner_tests.c                         | 126 +++++++++---------
 runner/testdata/abort-fixture.c               |   2 +-
 runner/testdata/skippers.c                    |   2 +-
 tests/amdgpu/amd_abm.c                        |   4 +-
 tests/amdgpu/amd_assr.c                       |   4 +-
 tests/amdgpu/amd_basic.c                      |   4 +-
 tests/amdgpu/amd_basic_ex.c                   |   4 +-
 tests/amdgpu/amd_basic_multi_gpu.c            |   4 +-
 tests/amdgpu/amd_bo.c                         |   4 +-
 tests/amdgpu/amd_bypass.c                     |   4 +-
 tests/amdgpu/amd_color.c                      |   4 +-
 tests/amdgpu/amd_cp_dma_misc.c                |   4 +-
 tests/amdgpu/amd_cs_nop.c                     |   4 +-
 tests/amdgpu/amd_deadlock.c                   |   4 +-
 tests/amdgpu/amd_dispatch.c                   |   4 +-
 tests/amdgpu/amd_dp_dsc.c                     |   4 +-
 tests/amdgpu/amd_freesync_video_mode.c        |   4 +-
 tests/amdgpu/amd_fuzzing.c                    |   4 +-
 tests/amdgpu/amd_gang_cs.c                    |   4 +-
 tests/amdgpu/amd_hotplug.c                    |   4 +-
 tests/amdgpu/amd_ilr.c                        |   4 +-
 tests/amdgpu/amd_info.c                       |   4 +-
 tests/amdgpu/amd_jpeg_dec.c                   |   4 +-
 tests/amdgpu/amd_jpeg_queue.c                 |   4 +-
 tests/amdgpu/amd_link_settings.c              |   4 +-
 tests/amdgpu/amd_mall.c                       |   4 +-
 tests/amdgpu/amd_max_bpc.c                    |   4 +-
 tests/amdgpu/amd_mem_leak.c                   |   4 +-
 tests/amdgpu/amd_mode_switch.c                |   4 +-
 tests/amdgpu/amd_module_load.c                |   2 +-
 tests/amdgpu/amd_multidisplay_modeset.c       |   4 +-
 tests/amdgpu/amd_odm.c                        |   4 +-
 tests/amdgpu/amd_pci_unplug.c                 |   4 +-
 tests/amdgpu/amd_plane.c                      |   4 +-
 tests/amdgpu/amd_prime.c                      |   4 +-
 tests/amdgpu/amd_psr.c                        |   4 +-
 tests/amdgpu/amd_pstate.c                     |   4 +-
 tests/amdgpu/amd_queue_reset.c                |   4 +-
 tests/amdgpu/amd_ras.c                        |   4 +-
 tests/amdgpu/amd_replay.c                     |   4 +-
 tests/amdgpu/amd_security.c                   |   4 +-
 tests/amdgpu/amd_subvp.c                      |   4 +-
 tests/amdgpu/amd_syncobj.c                    |   4 +-
 tests/amdgpu/amd_uvd_dec.c                    |   4 +-
 tests/amdgpu/amd_uvd_enc.c                    |   4 +-
 tests/amdgpu/amd_vce_enc.c                    |   4 +-
 tests/amdgpu/amd_vcn.c                        |   4 +-
 tests/amdgpu/amd_vcn_queue.c                  |   4 +-
 tests/amdgpu/amd_vm.c                         |   4 +-
 tests/amdgpu/amd_vpe.c                        |   4 +-
 tests/amdgpu/amd_vrr_range.c                  |   4 +-
 tests/chamelium/kms_chamelium_audio.c         |   8 +-
 tests/chamelium/kms_chamelium_color.c         |   4 +-
 tests/chamelium/kms_chamelium_edid.c          |  10 +-
 tests/chamelium/kms_chamelium_frames.c        |  10 +-
 tests/chamelium/kms_chamelium_hpd.c           |  12 +-
 .../kms_chamelium_sharpness_filter.c          |   4 +-
 tests/core_auth.c                             |   2 +-
 tests/core_debugfs.c                          |   4 +-
 tests/core_getclient.c                        |   4 +-
 tests/core_getstats.c                         |   4 +-
 tests/core_getversion.c                       |   4 +-
 tests/core_hotunplug.c                        |  34 ++---
 tests/core_setmaster.c                        |   6 +-
 tests/core_sysfs.c                            |   4 +-
 tests/device_reset.c                          |   4 +-
 tests/dmabuf_sync_file.c                      |   4 +-
 tests/drm_read.c                              |   2 +-
 tests/drm_virtgpu.c                           |   4 +-
 tests/dumb_buffer.c                           |   4 +-
 tests/fbdev.c                                 |  12 +-
 tests/intel/api_intel_allocator.c             |   4 +-
 tests/intel/api_intel_bb.c                    |   4 +-
 tests/intel/gem_bad_reloc.c                   |   4 +-
 tests/intel/gem_barrier_race.c                |   4 +-
 tests/intel/gem_basic.c                       |   2 +-
 tests/intel/gem_blits.c                       |   4 +-
 tests/intel/gem_busy.c                        |  22 +--
 tests/intel/gem_caching.c                     |   4 +-
 tests/intel/gem_ccs.c                         |   4 +-
 tests/intel/gem_close.c                       |   2 +-
 tests/intel/gem_close_race.c                  |   4 +-
 tests/intel/gem_compute.c                     |   4 +-
 tests/intel/gem_concurrent_all.c              |  32 ++---
 tests/intel/gem_create.c                      |   6 +-
 tests/intel/gem_cs_tlb.c                      |   4 +-
 tests/intel/gem_ctx_bad_destroy.c             |   4 +-
 tests/intel/gem_ctx_create.c                  |   4 +-
 tests/intel/gem_ctx_engines.c                 |   4 +-
 tests/intel/gem_ctx_exec.c                    |   8 +-
 tests/intel/gem_ctx_freq.c                    |   4 +-
 tests/intel/gem_ctx_isolation.c               |   6 +-
 tests/intel/gem_ctx_param.c                   |   6 +-
 tests/intel/gem_ctx_persistence.c             |  12 +-
 tests/intel/gem_ctx_shared.c                  |  12 +-
 tests/intel/gem_ctx_sseu.c                    |   6 +-
 tests/intel/gem_ctx_switch.c                  |  10 +-
 tests/intel/gem_eio.c                         |  10 +-
 tests/intel/gem_evict_alignment.c             |   6 +-
 tests/intel/gem_evict_everything.c            |   8 +-
 tests/intel/gem_exec_alignment.c              |   2 +-
 tests/intel/gem_exec_async.c                  |   8 +-
 tests/intel/gem_exec_await.c                  |   4 +-
 tests/intel/gem_exec_balancer.c               |  16 +--
 tests/intel/gem_exec_basic.c                  |   4 +-
 tests/intel/gem_exec_big.c                    |   4 +-
 tests/intel/gem_exec_capture.c                |   4 +-
 tests/intel/gem_exec_create.c                 |   4 +-
 tests/intel/gem_exec_endless.c                |   6 +-
 tests/intel/gem_exec_fair.c                   |   4 +-
 tests/intel/gem_exec_fence.c                  |  32 ++---
 tests/intel/gem_exec_flush.c                  |   6 +-
 tests/intel/gem_exec_gttfill.c                |   6 +-
 tests/intel/gem_exec_latency.c                |   8 +-
 tests/intel/gem_exec_nop.c                    |   8 +-
 tests/intel/gem_exec_parallel.c               |   4 +-
 tests/intel/gem_exec_params.c                 |   4 +-
 tests/intel/gem_exec_reloc.c                  |  12 +-
 tests/intel/gem_exec_schedule.c               |  26 ++--
 tests/intel/gem_exec_store.c                  |   4 +-
 tests/intel/gem_exec_suspend.c                |   6 +-
 tests/intel/gem_exec_whisper.c                |   6 +-
 tests/intel/gem_exercise_blt.c                |   4 +-
 tests/intel/gem_fenced_exec_thrash.c          |   4 +-
 tests/intel/gem_flink_basic.c                 |   2 +-
 tests/intel/gem_gpgpu_fill.c                  |   4 +-
 tests/intel/gem_huc_copy.c                    |   4 +-
 tests/intel/gem_linear_blits.c                |   6 +-
 tests/intel/gem_lmem_evict.c                  |   4 +-
 tests/intel/gem_lmem_swapping.c               |   4 +-
 tests/intel/gem_media_fill.c                  |   4 +-
 tests/intel/gem_mmap.c                        |   4 +-
 tests/intel/gem_mmap_gtt.c                    |   4 +-
 tests/intel/gem_mmap_offset.c                 |   4 +-
 tests/intel/gem_mmap_wc.c                     |   6 +-
 tests/intel/gem_partial_pwrite_pread.c        |   6 +-
 tests/intel/gem_pipe_control_store_loop.c     |   4 +-
 tests/intel/gem_ppgtt.c                       |   2 +-
 tests/intel/gem_pread.c                       |   4 +-
 tests/intel/gem_pread_after_blit.c            |   6 +-
 tests/intel/gem_pwrite.c                      |   6 +-
 tests/intel/gem_pxp.c                         |   4 +-
 tests/intel/gem_read_read_speed.c             |   4 +-
 tests/intel/gem_readwrite.c                   |   4 +-
 tests/intel/gem_reg_read.c                    |   4 +-
 tests/intel/gem_render_copy.c                 |   4 +-
 tests/intel/gem_render_copy_redux.c           |   4 +-
 tests/intel/gem_render_linear_blits.c         |   2 +-
 tests/intel/gem_render_tiled_blits.c          |   2 +-
 tests/intel/gem_request_retire.c              |   2 +-
 tests/intel/gem_reset_stats.c                 |   8 +-
 tests/intel/gem_ringfill.c                    |   4 +-
 tests/intel/gem_set_tiling_vs_blt.c           |   4 +-
 tests/intel/gem_shrink.c                      |   2 +-
 tests/intel/gem_softpin.c                     |  10 +-
 tests/intel/gem_spin_batch.c                  |   8 +-
 tests/intel/gem_streaming_writes.c            |   4 +-
 tests/intel/gem_sync.c                        |   6 +-
 tests/intel/gem_tiled_blits.c                 |   8 +-
 tests/intel/gem_tiled_fence_blits.c           |   8 +-
 tests/intel/gem_tiled_partial_pwrite_pread.c  |   4 +-
 tests/intel/gem_tiled_swapping.c              |   4 +-
 tests/intel/gem_userptr_blits.c               |  14 +-
 tests/intel/gem_vm_create.c                   |   6 +-
 tests/intel/gem_wait.c                        |  12 +-
 tests/intel/gem_watchdog.c                    |   4 +-
 tests/intel/gem_workarounds.c                 |   6 +-
 tests/intel/gen7_exec_parse.c                 |   8 +-
 tests/intel/gen9_exec_parse.c                 |   4 +-
 tests/intel/i915_drm_fdinfo.c                 |   8 +-
 tests/intel/i915_fb_tiling.c                  |   4 +-
 tests/intel/i915_getparams_basic.c            |   2 +-
 tests/intel/i915_hangman.c                    |   6 +-
 tests/intel/i915_pm_freq_api.c                |   2 +-
 tests/intel/i915_pm_freq_mult.c               |   4 +-
 tests/intel/i915_pm_rc6_residency.c           |   8 +-
 tests/intel/i915_pm_rpm.c                     |   4 +-
 tests/intel/i915_pm_rps.c                     |   4 +-
 tests/intel/i915_pm_sseu.c                    |   2 +-
 tests/intel/i915_power.c                      |   4 +-
 tests/intel/i915_query.c                      |   6 +-
 tests/intel/i915_suspend.c                    |   4 +-
 tests/intel/intel_hwmon.c                     |   4 +-
 tests/intel/kms_big_fb.c                      |   8 +-
 tests/intel/kms_busy.c                        |   8 +-
 tests/intel/kms_ccs.c                         |   8 +-
 tests/intel/kms_cdclk.c                       |   4 +-
 tests/intel/kms_dirtyfb.c                     |   4 +-
 tests/intel/kms_dp_link_training.c            |   4 +-
 tests/intel/kms_dp_linktrain_fallback.c       |   4 +-
 tests/intel/kms_draw_crc.c                    |   4 +-
 tests/intel/kms_dsc.c                         |   4 +-
 tests/intel/kms_fb_coherency.c                |   4 +-
 tests/intel/kms_fbc_dirty_rect.c              |   4 +-
 tests/intel/kms_fbcon_fbt.c                   |   4 +-
 tests/intel/kms_flip_scaled_crc.c             |   4 +-
 tests/intel/kms_flip_tiling.c                 |   4 +-
 tests/intel/kms_frontbuffer_tracking.c        |   6 +-
 tests/intel/kms_joiner.c                      |  12 +-
 tests/intel/kms_legacy_colorkey.c             |   4 +-
 tests/intel/kms_mmap_write_crc.c              |   4 +-
 tests/intel/kms_pipe_b_c_ivb.c                |   4 +-
 tests/intel/kms_pipe_stress.c                 |   4 +-
 tests/intel/kms_pm_backlight.c                |   4 +-
 tests/intel/kms_pm_dc.c                       |   4 +-
 tests/intel/kms_pm_lpsp.c                     |   4 +-
 tests/intel/kms_pm_rpm.c                      |   4 +-
 tests/intel/kms_psr.c                         |   4 +-
 tests/intel/kms_psr2_sf.c                     |   4 +-
 tests/intel/kms_psr2_su.c                     |   4 +-
 tests/intel/kms_psr_stress_test.c             |   4 +-
 tests/intel/perf.c                            |   6 +-
 tests/intel/perf_pmu.c                        |  10 +-
 tests/intel/prime_busy.c                      |   6 +-
 tests/intel/prime_mmap.c                      |   4 +-
 tests/intel/prime_mmap_coherency.c            |   4 +-
 tests/intel/prime_mmap_kms.c                  |   4 +-
 tests/intel/sysfs_defaults.c                  |   4 +-
 tests/intel/sysfs_heartbeat_interval.c        |   4 +-
 tests/intel/sysfs_preempt_timeout.c           |   4 +-
 tests/intel/sysfs_timeslice_duration.c        |   4 +-
 tests/intel/xe_ccs.c                          |   4 +-
 tests/intel/xe_compute.c                      |   6 +-
 tests/intel/xe_compute_preempt.c              |   4 +-
 tests/intel/xe_configfs.c                     |   4 +-
 tests/intel/xe_copy_basic.c                   |   4 +-
 tests/intel/xe_create.c                       |   4 +-
 tests/intel/xe_debugfs.c                      |   4 +-
 tests/intel/xe_dma_buf_sync.c                 |   4 +-
 tests/intel/xe_drm_fdinfo.c                   |   4 +-
 tests/intel/xe_eu_stall.c                     |   4 +-
 tests/intel/xe_eudebug.c                      |   8 +-
 tests/intel/xe_eudebug_online.c               |   6 +-
 tests/intel/xe_eudebug_sriov.c                |   4 +-
 tests/intel/xe_evict.c                        |   4 +-
 tests/intel/xe_evict_ccs.c                    |   6 +-
 tests/intel/xe_exec_atomic.c                  |   4 +-
 tests/intel/xe_exec_balancer.c                |   4 +-
 tests/intel/xe_exec_basic.c                   |   4 +-
 tests/intel/xe_exec_capture.c                 |   4 +-
 tests/intel/xe_exec_compute_mode.c            |   4 +-
 tests/intel/xe_exec_fault_mode.c              |   4 +-
 tests/intel/xe_exec_mix_modes.c               |   4 +-
 tests/intel/xe_exec_queue_property.c          |   6 +-
 tests/intel/xe_exec_reset.c                   |   4 +-
 tests/intel/xe_exec_sip.c                     |   4 +-
 tests/intel/xe_exec_sip_eudebug.c             |  12 +-
 tests/intel/xe_exec_store.c                   |   4 +-
 tests/intel/xe_exec_system_allocator.c        |   4 +-
 tests/intel/xe_exec_threads.c                 |   4 +-
 tests/intel/xe_exercise_blt.c                 |   4 +-
 tests/intel/xe_fault_injection.c              |   6 +-
 tests/intel/xe_gpgpu_fill.c                   |   4 +-
 tests/intel/xe_gt_freq.c                      |   4 +-
 tests/intel/xe_huc_copy.c                     |   4 +-
 tests/intel/xe_intel_bb.c                     |   4 +-
 tests/intel/xe_media_fill.c                   |   4 +-
 tests/intel/xe_mmap.c                         |   6 +-
 tests/intel/xe_noexec_ping_pong.c             |   4 +-
 tests/intel/xe_oa.c                           |  10 +-
 tests/intel/xe_pat.c                          |   4 +-
 tests/intel/xe_peer2peer.c                    |   4 +-
 tests/intel/xe_pm.c                           |   6 +-
 tests/intel/xe_pm_residency.c                 |   4 +-
 tests/intel/xe_pmu.c                          |  16 +--
 tests/intel/xe_prime_self_import.c            |   4 +-
 tests/intel/xe_pxp.c                          |   4 +-
 tests/intel/xe_query.c                        |   4 +-
 tests/intel/xe_render_copy.c                  |   4 +-
 tests/intel/xe_spin_batch.c                   |   4 +-
 tests/intel/xe_sriov_auto_provisioning.c      |   4 +-
 tests/intel/xe_sriov_flr.c                    |   4 +-
 tests/intel/xe_sriov_scheduling.c             |   4 +-
 tests/intel/xe_sriov_vram.c                   |   4 +-
 tests/intel/xe_survivability.c                |   4 +-
 tests/intel/xe_sysfs_defaults.c               |   4 +-
 tests/intel/xe_sysfs_preempt_timeout.c        |   4 +-
 tests/intel/xe_sysfs_scheduler.c              |   4 +-
 tests/intel/xe_sysfs_timeslice_duration.c     |   4 +-
 tests/intel/xe_tlb.c                          |   4 +-
 tests/intel/xe_vm.c                           |   4 +-
 tests/intel/xe_waitfence.c                    |   4 +-
 tests/intel/xe_wedged.c                       |   4 +-
 tests/kms_3d.c                                |   4 +-
 tests/kms_addfb_basic.c                       |  50 +++----
 tests/kms_async_flips.c                       |   6 +-
 tests/kms_atomic.c                            |   4 +-
 tests/kms_atomic_interruptible.c              |   4 +-
 tests/kms_atomic_transition.c                 |   4 +-
 tests/kms_bw.c                                |   4 +-
 tests/kms_color.c                             |   6 +-
 tests/kms_concurrent.c                        |   4 +-
 tests/kms_content_protection.c                |   8 +-
 tests/kms_cursor_crc.c                        |  16 +--
 tests/kms_cursor_edge_walk.c                  |   6 +-
 tests/kms_cursor_legacy.c                     |  20 +--
 tests/kms_debugfs.c                           |   4 +-
 tests/kms_display_modes.c                     |   4 +-
 tests/kms_dither.c                            |   4 +-
 tests/kms_feature_discovery.c                 |   6 +-
 tests/kms_flip.c                              |   4 +-
 tests/kms_flip_event_leak.c                   |   4 +-
 tests/kms_force_connector_basic.c             |   4 +-
 tests/kms_getfb.c                             |  20 +--
 tests/kms_hdmi_inject.c                       |   4 +-
 tests/kms_hdr.c                               |   4 +-
 tests/kms_invalid_mode.c                      |   4 +-
 tests/kms_lease.c                             |   6 +-
 tests/kms_multipipe_modeset.c                 |   4 +-
 tests/kms_panel_fitting.c                     |   6 +-
 tests/kms_pipe_crc_basic.c                    |   4 +-
 tests/kms_plane.c                             |   4 +-
 tests/kms_plane_alpha_blend.c                 |   4 +-
 tests/kms_plane_cursor.c                      |   4 +-
 tests/kms_plane_lowres.c                      |   4 +-
 tests/kms_plane_multiple.c                    |   4 +-
 tests/kms_plane_scaling.c                     |   8 +-
 tests/kms_prime.c                             |  12 +-
 tests/kms_prop_blob.c                         |   8 +-
 tests/kms_properties.c                        |   6 +-
 tests/kms_rmfb.c                              |   4 +-
 tests/kms_rotation_crc.c                      |   6 +-
 tests/kms_scaling_modes.c                     |   4 +-
 tests/kms_sequence.c                          |   4 +-
 tests/kms_setmode.c                           |   4 +-
 tests/kms_sharpness_filter.c                  |   4 +-
 tests/kms_tiled_display.c                     |   4 +-
 tests/kms_tv_load_detect.c                    |   4 +-
 tests/kms_universal_plane.c                   |   4 +-
 tests/kms_vblank.c                            |   4 +-
 tests/kms_vrr.c                               |   6 +-
 tests/kms_writeback.c                         |   4 +-
 tests/meta_test.c                             |   2 +-
 tests/msm/msm_mapping.c                       |   4 +-
 tests/msm/msm_recovery.c                      |   4 +-
 tests/msm/msm_shrink.c                        |   4 +-
 tests/msm/msm_submit.c                        |   4 +-
 tests/msm/msm_submitoverhead.c                |   4 +-
 tests/nouveau_crc.c                           |   8 +-
 tests/panfrost/panfrost_gem_new.c             |   4 +-
 tests/panfrost/panfrost_get_param.c           |   4 +-
 tests/panfrost/panfrost_prime.c               |   4 +-
 tests/panfrost/panfrost_submit.c              |   4 +-
 tests/panthor/panthor_gem.c                   |   4 +-
 tests/panthor/panthor_group.c                 |   4 +-
 tests/panthor/panthor_query.c                 |   4 +-
 tests/panthor/panthor_vm.c                    |   4 +-
 tests/prime_nv_api.c                          |   4 +-
 tests/prime_nv_pcopy.c                        |   4 +-
 tests/prime_nv_test.c                         |   4 +-
 tests/prime_vgem.c                            |  16 +--
 tests/sriov_basic.c                           |   4 +-
 tests/sw_sync.c                               |   2 +-
 tests/syncobj_basic.c                         |   4 +-
 tests/syncobj_eventfd.c                       |   4 +-
 tests/syncobj_timeline.c                      |   4 +-
 tests/syncobj_wait.c                          |   4 +-
 tests/template.c                              |   6 +-
 tests/tools_test.c                            |   2 +-
 tests/v3d/v3d_create_bo.c                     |   4 +-
 tests/v3d/v3d_get_bo_offset.c                 |   4 +-
 tests/v3d/v3d_get_param.c                     |   4 +-
 tests/v3d/v3d_job_submission.c                |   4 +-
 tests/v3d/v3d_mmap.c                          |   4 +-
 tests/v3d/v3d_perfmon.c                       |   4 +-
 tests/v3d/v3d_submit_cl.c                     |   4 +-
 tests/v3d/v3d_submit_csd.c                    |   4 +-
 tests/v3d/v3d_wait_bo.c                       |   4 +-
 tests/vc4/vc4_create_bo.c                     |   4 +-
 tests/vc4/vc4_dmabuf_poll.c                   |   4 +-
 tests/vc4/vc4_label_bo.c                      |   4 +-
 tests/vc4/vc4_lookup_fail.c                   |   4 +-
 tests/vc4/vc4_mmap.c                          |   4 +-
 tests/vc4/vc4_perfmon.c                       |   4 +-
 tests/vc4/vc4_purgeable_bo.c                  |   4 +-
 tests/vc4/vc4_tiling.c                        |   4 +-
 tests/vc4/vc4_wait_bo.c                       |   4 +-
 tests/vc4/vc4_wait_seqno.c                    |   4 +-
 tests/vgem_basic.c                            |   8 +-
 tests/vgem_slow.c                             |   4 +-
 tests/vkms/vkms_configfs.c                    |   4 +-
 tests/vmwgfx/vmw_execution_buffer.c           |   4 +-
 tests/vmwgfx/vmw_mob_stress.c                 |   4 +-
 tests/vmwgfx/vmw_prime.c                      |   8 +-
 tests/vmwgfx/vmw_ref_count.c                  |   4 +-
 tests/vmwgfx/vmw_surface_copy.c               |   4 +-
 tests/vmwgfx/vmw_tri.c                        |   4 +-
 408 files changed, 1146 insertions(+), 1146 deletions(-)

diff --git a/benchmarks/gem_userptr_benchmark.c b/benchmarks/gem_userptr_benchmark.c
index 3b5894321934..cfd50252438a 100644
--- a/benchmarks/gem_userptr_benchmark.c
+++ b/benchmarks/gem_userptr_benchmark.c
@@ -454,7 +454,7 @@ igt_main
 {
 	int fd = -1, ret;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_assert(fd >= 0);
 
@@ -472,7 +472,7 @@ igt_main
 	igt_subtest("userptr-impact-sync-overlap")
 		test_impact_overlap(fd, "sync-");
 
-	igt_fixture {
+	igt_fixture() {
 		close(fd);
 	}
 }
diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index 5c26798129fc..39c66395a33c 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -313,7 +313,7 @@ static void sig_handler(int i)
  * helper can also be used from children spawned with #igt_fork.
  *
  * In tests with subtests this function can be called outside of failure
- * catching code blocks like #igt_fixture or #igt_subtest.
+ * catching code blocks like #igt_fixture() or #igt_subtest.
  *
  * Note that this just spews signals at the current process unconditionally and
  * hence incurs quite a bit of overhead. For a more focused approach, with less
@@ -350,7 +350,7 @@ void igt_fork_signal_helper(void)
  * Stops the child process spawned with igt_fork_signal_helper() again.
  *
  * In tests with subtests this function can be called outside of failure
- * catching code blocks like #igt_fixture or #igt_subtest.
+ * catching code blocks like #igt_fixture() or #igt_subtest.
  */
 void igt_stop_signal_helper(void)
 {
@@ -419,7 +419,7 @@ __noreturn static void shrink_helper_process(int fd, pid_t pid)
  *
  * This is useful to exercise swapping paths, without requiring us to hit swap.
  *
- * This should only be used from an igt_fixture.
+ * This should only be used from an igt_fixture().
  */
 void igt_fork_shrink_helper(int drm_fd)
 {
diff --git a/lib/igt_core.c b/lib/igt_core.c
index 4477cfef157a..190f59c3411a 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -118,10 +118,10 @@
  * never run any code which might fail (like trying to do privileged operations
  * or opening device driver nodes).
  *
- * To allow this i-g-t provides #igt_fixture code blocks for setup code outside
+ * To allow this i-g-t provides #igt_fixture() code blocks for setup code outside
  * of subtests and automatically skips the subtest code blocks themselves. For
  * special cases igt_only_list_subtests() is also provided. For setup code only
- * shared by a group of subtest encapsulate the #igt_fixture block and all the
+ * shared by a group of subtest encapsulate the #igt_fixture() block and all the
  * subtestest in a #igt_subtest_group block.
  *
  * # Magic Control Blocks
@@ -141,7 +141,7 @@
  *   issues.
  *
  * - Code blocks with magic control flow are implemented with setjmp()
- *   and longjmp(). This applies to #igt_fixture, #igt_subtest,
+ *   and longjmp(). This applies to #igt_fixture(), #igt_subtest,
  *   #igt_subtest_with_dynamic and #igt_dynamic
  *   blocks and all the three variants to finish test: igt_success(),
  *   igt_skip() and igt_fail(). Mostly this is of no concern, except
@@ -768,11 +768,11 @@ void __igt_assert_in_outer_scope(void)
 bool __igt_fixture(void)
 {
 	internal_assert(!in_fixture,
-			"nesting multiple igt_fixtures is invalid\n");
+			"nesting multiple igt_fixture()s is invalid\n");
 	internal_assert(!in_subtest,
-			"nesting igt_fixture in igt_subtest is invalid\n");
+			"nesting igt_fixture() in igt_subtest is invalid\n");
 	internal_assert(test_with_subtests,
-			"igt_fixture in igt_simple_main is invalid\n");
+			"igt_fixture() in igt_simple_main is invalid\n");
 
 	if (igt_only_list_subtests())
 		return false;
@@ -1974,7 +1974,7 @@ void igt_fatal_error(void)
 /**
  * igt_can_fail:
  *
- * Returns true if called from either an #igt_fixture, #igt_subtest or a
+ * Returns true if called from either an #igt_fixture(), #igt_subtest or a
  * testcase without subtests, i.e. #igt_simple_main. Returns false otherwise. In
  * other words, it checks whether it's legal to call igt_fail(), igt_skip_on()
  * and all the convenience macros build around those.
@@ -3119,7 +3119,7 @@ bool igt_run_in_simulation(void)
  * igt_skip() internally and hence is fully subtest aware.
  *
  * Note that in contrast to all other functions which use igt_skip() internally
- * it is allowed to use this outside of an #igt_fixture block in a test with
+ * it is allowed to use this outside of an #igt_fixture() block in a test with
  * subtests. This is because in contrast to most other test requirements,
  * checking for simulation mode doesn't depend upon the present hardware and it
  * so makes a lot of sense to have this check in the outermost #igt_main block.
@@ -3130,7 +3130,7 @@ void igt_skip_on_simulation(void)
 		return;
 
 	if (!igt_can_fail()) {
-		igt_fixture
+		igt_fixture()
 			igt_require(!igt_run_in_simulation());
 	} else
 		igt_require(!igt_run_in_simulation());
diff --git a/lib/igt_core.h b/lib/igt_core.h
index 6f462205facf..e03df8888453 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -149,16 +149,16 @@ bool __igt_fixture(void);
 void __igt_fixture_complete(void);
 __noreturn void __igt_fixture_end(void);
 /**
- * igt_fixture:
+ * igt_fixture():
  *
  * Annotate global test fixture code
  *
  * Testcase with subtests often need to set up a bunch of global state as the
  * common test fixture. To avoid such code interfering with the subtest
  * enumeration (e.g. when enumerating on systems without an intel gpu) such
- * blocks should be annotated with igt_fixture.
+ * blocks should be annotated with igt_fixture().
  */
-#define igt_fixture for (volatile int igt_unique(__tmpint) = 0; \
+#define igt_fixture() for (volatile int igt_unique(__tmpint) = 0; \
 			 igt_unique(__tmpint) < 1 && \
 			 (STATIC_ANALYSIS_BUILD || \
 			 (__igt_fixture() && \
@@ -398,7 +398,7 @@ void __igt_subtest_group_restore(int, int);
  * e.g. igt_require() would result in all subsequent tests skipping. Even those
  * from a different group.
  *
- * This macro allows to group together a set of #igt_fixture and #igt_subtest
+ * This macro allows to group together a set of #igt_fixture() and #igt_subtest
  * clauses. If any common setup in a fixture fails, only the subtests in this
  * group will fail or skip. Subtest groups can be arbitrarily nested.
  */
diff --git a/lib/igt_dir.c b/lib/igt_dir.c
index e232dbda9c8e..560c0e89a0ea 100644
--- a/lib/igt_dir.c
+++ b/lib/igt_dir.c
@@ -18,7 +18,7 @@
  * Utilities to facilitate reading and processing files within a directory.
  * For example, to read and discard all files from debugfs:
  *
- * igt_fixture {
+ * igt_fixture() {
  *	fd = drm_open_driver_master(DRIVER_ANY);
  *	debugfs = igt_debugfs_dir(fd);
  * }
@@ -27,7 +27,7 @@
  * igt_dir_scan_dirfd(igt_dir, -1); // -1 means unlimited scan depth
  * igt_dir_process_files(igt_dir, NULL, NULL);
  *
- * igt_fixture {
+ * igt_fixture() {
  *	igt_dir_destroy(igt_dir);
  *	closedir(debugfs);
  *	drm_close_driver(fd);
@@ -47,14 +47,14 @@
  * igt_dir_process_files(), and igt_dir_destroy(). For using the "_simple"
  * interface:
  *
- * igt_fixture {
+ * igt_fixture() {
  *	fd = drm_open_driver_master(DRIVER_ANY);
  *	debugfs = igt_debugfs_dir(fd);
  * }
  *
  * igt_dir_process_files_simple(debugfs);
  *
- * igt_fixture {
+ * igt_fixture() {
  *	igt_dir_destroy(igt_dir);
  *	closedir(debugfs);
  *	drm_close_driver(fd);
diff --git a/lib/igt_gt.c b/lib/igt_gt.c
index bec50e38833c..d8cccb800273 100644
--- a/lib/igt_gt.c
+++ b/lib/igt_gt.c
@@ -483,7 +483,7 @@ void igt_fork_hang_helper(void)
  * Stops the child process spawned with igt_fork_hang_helper().
  *
  * In tests with subtests this function can be called outside of failure
- * catching code blocks like #igt_fixture or #igt_subtest.
+ * catching code blocks like #igt_fixture() or #igt_subtest.
  */
 void igt_stop_hang_helper(void)
 {
diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 68ab4dbd575f..dd223a0f8ca6 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -1199,7 +1199,7 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
 	igt_ignore_warn(igt_kmod_load("kunit", NULL));
 	kunit_debugfs_path(debugfs_path);
 
-	igt_fixture {
+	igt_fixture() {
 		igt_require(subtest);
 		igt_require(*debugfs_path);
 
@@ -1222,7 +1222,7 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
 		__igt_kunit(&tst, subtest, opts, debugfs_path, &tests, &ktap);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		char *suite_name = NULL, *case_name = NULL;
 
 		igt_ktap_free(&ktap);
@@ -1365,7 +1365,7 @@ void igt_kselftests(const char *module_name,
 	if (igt_ktest_init(&tst, module_name) != 0)
 		return;
 
-	igt_fixture
+	igt_fixture()
 		igt_require(igt_ktest_begin(&tst) == 0);
 
 	igt_kselftest_get_tests(tst.kmod, filter, &tests);
@@ -1390,7 +1390,7 @@ void igt_kselftests(const char *module_name,
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_ktest_end(&tst);
 		igt_require(!igt_list_empty(&tests));
 	}
diff --git a/lib/igt_types.h b/lib/igt_types.h
index c4bc01ecdb3b..6f020e65c470 100644
--- a/lib/igt_types.h
+++ b/lib/igt_types.h
@@ -23,7 +23,7 @@
  * 	igt_subtest_group() {
  * 		igt_fd_t(fd);
  *
- * 		igt_fixture {
+ * 		igt_fixture() {
  * 			fd = drm_open_driver();
  * 		}
  *
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 4bc1cf5b65c1..3b25a385b78c 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1110,7 +1110,7 @@ static bool has_ctx_cfg(struct intel_bb *ibb)
  *
  * Notes:
  *
- * intel_bb must not be created in igt_fixture. The reason is intel_bb
+ * intel_bb must not be created in igt_fixture(). The reason is intel_bb
  * "opens" connection to the allocator and when test completes it can
  * leave the allocator in unknown state (mostly for failed tests).
  * As igt_core was armed to reset the allocator infrastructure
diff --git a/lib/tests/igt_abort.c b/lib/tests/igt_abort.c
index 356e41679451..9947caa2a1b7 100644
--- a/lib/tests/igt_abort.c
+++ b/lib/tests/igt_abort.c
@@ -44,7 +44,7 @@ __noreturn static void fake_fixture_test(void)
 {
 	igt_subtest_init(fake_argc, fake_argv);
 
-	igt_fixture {
+	igt_fixture() {
 		igt_abort_on_f(true, "I'm out!\n");
 	}
 
diff --git a/lib/tests/igt_audio.c b/lib/tests/igt_audio.c
index c0727673cb1e..7716ef28c9f4 100644
--- a/lib/tests/igt_audio.c
+++ b/lib/tests/igt_audio.c
@@ -181,7 +181,7 @@ igt_main
 	size_t i;
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			signal = audio_signal_init(CHANNELS, SAMPLING_RATE);
 
 			for (i = 0; i < test_freqs_len; i++) {
@@ -215,7 +215,7 @@ igt_main
 		igt_subtest("signal-detect-phaseshift")
 			test_signal_detect_phaseshift(signal);
 
-		igt_fixture {
+		igt_fixture() {
 			audio_signal_fini(signal);
 		}
 	}
diff --git a/lib/tests/igt_can_fail.c b/lib/tests/igt_can_fail.c
index 1e3d9558728f..2f145412ad67 100644
--- a/lib/tests/igt_can_fail.c
+++ b/lib/tests/igt_can_fail.c
@@ -30,7 +30,7 @@ igt_main
 {
 	internal_assert(igt_can_fail() == false);
 
-	igt_fixture {
+	igt_fixture() {
 		internal_assert(igt_can_fail());
 	}
 
diff --git a/lib/tests/igt_describe.c b/lib/tests/igt_describe.c
index d71e051e7667..54bd729ad1f4 100644
--- a/lib/tests/igt_describe.c
+++ b/lib/tests/igt_describe.c
@@ -42,7 +42,7 @@ __noreturn static void fake_main(void)
 	igt_subtest("A")
 		;
 
-	igt_fixture
+	igt_fixture()
 		printf("should not be executed!\n");
 
 	igt_describe("Group with B, C & D");
diff --git a/lib/tests/igt_exit_handler.c b/lib/tests/igt_exit_handler.c
index 892a7f141e90..873acbf91b59 100644
--- a/lib/tests/igt_exit_handler.c
+++ b/lib/tests/igt_exit_handler.c
@@ -76,7 +76,7 @@ static int testfunc(enum test_type test_type)
 	if (pid == 0) {
 		igt_subtest_init(fake_argc, fake_argv);
 
-		igt_fixture {
+		igt_fixture() {
 			/* register twice, should only be called once */
 			igt_install_exit_handler(exit_handler1);
 			igt_install_exit_handler(exit_handler1);
diff --git a/lib/tests/igt_hook.c b/lib/tests/igt_hook.c
index 420a19c721ae..90b4657af3cb 100644
--- a/lib/tests/igt_hook.c
+++ b/lib/tests/igt_hook.c
@@ -157,7 +157,7 @@ igt_main
 		test_print_help();
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			igt_require_f(system(NULL), "Shell seems not to be available\n");
 		}
 
diff --git a/lib/tests/igt_nesting.c b/lib/tests/igt_nesting.c
index 6b209af8299c..16ffbaf6ebd1 100644
--- a/lib/tests/igt_nesting.c
+++ b/lib/tests/igt_nesting.c
@@ -44,14 +44,14 @@ __noreturn static void all_valid(void)
 {
 	igt_subtest_init(fake_argc, fake_argv);
 
-	igt_fixture {
+	igt_fixture() {
 	}
 
 	igt_subtest_group {
 		igt_subtest_group {
 		}
 
-		igt_fixture {
+		igt_fixture() {
 		}
 
 		igt_subtest("a")
@@ -131,8 +131,8 @@ __noreturn static void invalid_fixture_in_fixture(void)
 {
 	igt_subtest_init(fake_argc, fake_argv);
 
-	igt_fixture {
-		igt_fixture {
+	igt_fixture() {
+		igt_fixture() {
 		}
 	}
 
@@ -178,7 +178,7 @@ __noreturn static void invalid_fixture_in_subtest(void)
 	igt_subtest_init(fake_argc, fake_argv);
 
 	igt_subtest("a") {
-		igt_fixture {
+		igt_fixture() {
 		}
 	}
 
diff --git a/lib/tests/igt_simulation.c b/lib/tests/igt_simulation.c
index 9a2cf2aae12e..069f8128f5f4 100644
--- a/lib/tests/igt_simulation.c
+++ b/lib/tests/igt_simulation.c
@@ -65,7 +65,7 @@ __noreturn static void fake_test(void)
 		}
 
 		if (in_fixture) {
-			igt_fixture
+			igt_fixture()
 				igt_skip_on_simulation();
 		} if (in_subtest) {
 			igt_subtest("sim")
diff --git a/lib/tests/igt_subtest_group.c b/lib/tests/igt_subtest_group.c
index 973a30e4e128..e42b1ef1305e 100644
--- a/lib/tests/igt_subtest_group.c
+++ b/lib/tests/igt_subtest_group.c
@@ -37,12 +37,12 @@ igt_main
 	volatile int t2 = 0;
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			igt_require(true);
 		}
 
 		igt_subtest_group {
-			igt_fixture {
+			igt_fixture() {
 				igt_require(false);
 			}
 
@@ -67,7 +67,7 @@ igt_main
 	}
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			internal_assert(t2 == 0);
 			t2 = 1;
 		}
@@ -77,7 +77,7 @@ igt_main
 			t2 = 2;
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			internal_assert(t2 == 2);
 			t2 = 3;
 
diff --git a/lib/tests/igt_types.c b/lib/tests/igt_types.c
index 75dd58b9c042..eb05393616bf 100644
--- a/lib/tests/igt_types.c
+++ b/lib/tests/igt_types.c
@@ -24,14 +24,14 @@ static void delegate(void)
 {
 	scoped_int_t(x);
 
-	igt_fixture
+	igt_fixture()
 		x = 1;
 
 	igt_describe("Pretend to be doing a subtest");
 	igt_subtest("empty-subtest")
 		x = 2;
 
-	igt_fixture {
+	igt_fixture() {
 		/* Check that we went through both blocks without cleanup */
 		igt_assert(!cleanup_called);
 		igt_assert(x == 2);
@@ -42,7 +42,7 @@ static void skip_delegate(void)
 {
 	scoped_int_t(x);
 
-	igt_fixture
+	igt_fixture()
 		x = 1;
 
 	igt_describe("Check if skipping a test will not update a scoped variable");
@@ -52,7 +52,7 @@ static void skip_delegate(void)
 		x = 2; /* not reached due to lonjmp from igt_skip */
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		/* Check that we went through both blocks without cleanup */
 		igt_assert(!cleanup_called);
 		igt_assert(x == 1);
@@ -63,7 +63,7 @@ igt_main
 {
 	/* Basic check that scopes will call their destructor */
 	cleanup_called = 0;
-	igt_fixture {
+	igt_fixture() {
 		scoped_int_t(x);
 	}
 
@@ -76,7 +76,7 @@ igt_main
 	igt_subtest_group {
 		scoped_int_t(x);
 
-		igt_fixture {
+		igt_fixture() {
 			x = 0xdeadbeef;
 		}
 
diff --git a/runner/resultgen.c b/runner/resultgen.c
index c96aa67414f8..1f7e79f24694 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -524,7 +524,7 @@ static const char *find_subtest_begin_limit_limited(struct matches matches,
 	if (begin_idx < first_idx) {
 		/*
 		 * Subtest didn't start, but we have the
-		 * result. Probably because an igt_fixture
+		 * result. Probably because an igt_fixture()
 		 * made it fail/skip.
 		 *
 		 * We go backwards one match from the result match,
diff --git a/runner/runner_kmemleak_test.c b/runner/runner_kmemleak_test.c
index ae3ebe113418..8030ff621c62 100644
--- a/runner/runner_kmemleak_test.c
+++ b/runner/runner_kmemleak_test.c
@@ -220,7 +220,7 @@ igt_main
 	int resdirfd;
 	int fd;
 
-	igt_fixture {
+	igt_fixture() {
 		/* resdirfd is used by runner_kmemleak() to store results */
 		igt_assert(resdirfd = open(runner_kmemleak_unit_testing_resdir,
 					   O_DIRECTORY | O_RDONLY));
@@ -258,10 +258,10 @@ igt_main
 			igt_assert(runner_kmemleak("test_name_3", resdirfd,
 						   true, false));
 		}
-		igt_fixture {
+		igt_fixture() {
 			close(resdirfd);
 		}
 	}
-	igt_fixture
+	igt_fixture()
 		unlinkat(resdirfd, KMEMLEAK_RESFILENAME, 0);
 }
diff --git a/runner/runner_tests.c b/runner/runner_tests.c
index e62e7b34d4f9..b360cdd8bfcf 100644
--- a/runner/runner_tests.c
+++ b/runner/runner_tests.c
@@ -15,7 +15,7 @@
 #include "resultgen.h"
 
 /*
- * NOTE: this test is using a lot of variables that are changed in igt_fixture,
+ * NOTE: this test is using a lot of variables that are changed in igt_fixture(),
  * igt_subtest_group and igt_subtests blocks but defined outside of them.
  *
  * Such variables have to be either non-local or volatile, otherwise their
@@ -106,7 +106,7 @@ static void job_list_filter_test(const char *name, const char *filterarg1, const
 	int multiple;
 	struct settings *settings = malloc(sizeof(*settings));
 
-	igt_fixture
+	igt_fixture()
 		init_settings(settings);
 
 	for (multiple = 0; multiple < 2; multiple++) {
@@ -139,7 +139,7 @@ static void job_list_filter_test(const char *name, const char *filterarg1, const
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		clear_settings(settings);
 		free(settings);
 	}
@@ -265,7 +265,7 @@ igt_main
 {
 	struct settings *settings = malloc(sizeof(*settings));
 
-	igt_fixture {
+	igt_fixture() {
 		int i;
 
 		/*
@@ -327,7 +327,7 @@ igt_main
 		char *cwd;
 		char *path;
 
-		igt_fixture {
+		igt_fixture() {
 			igt_require((cwd = realpath(".", NULL)) != NULL);
 			path = NULL;
 		}
@@ -349,7 +349,7 @@ igt_main
 			}
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			free(cwd);
 			free(path);
 		}
@@ -361,7 +361,7 @@ igt_main
 		char pathtotestlist[64];
 		volatile char *path;
 
-		igt_fixture {
+		igt_fixture() {
 			int dirfd, fd;
 
 			path = NULL;
@@ -400,7 +400,7 @@ igt_main
 			igt_assert_eqstr(settings->test_list, (char*)path);
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			int dirfd;
 
 			igt_require((dirfd = open(dirname, O_DIRECTORY | O_RDONLY)) >= 0);
@@ -443,7 +443,7 @@ igt_main
 		igt_assert(!settings->piglit_style_dmesg);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		unsetenv("IGT_TEST_ROOT");
 	}
 
@@ -760,7 +760,7 @@ igt_main
 	igt_subtest_group {
 		char filename[] = "tmplistXXXXXX";
 
-		igt_fixture {
+		igt_fixture() {
 			int fd;
 			igt_require((fd = mkstemp(filename)) >= 0);
 			close(fd);
@@ -779,7 +779,7 @@ igt_main
 			igt_assert(validate_settings(settings));
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			unlink(filename);
 		}
 	}
@@ -802,7 +802,7 @@ igt_main
 		char dirname[] = "tmpdirXXXXXX";
 		struct job_list *list = malloc(sizeof(*list));
 
-		igt_fixture {
+		igt_fixture() {
 			igt_require(mkdtemp(dirname) != NULL);
 			init_job_list(list);
 		}
@@ -818,7 +818,7 @@ igt_main
 			igt_assert(!create_job_list(list, settings));
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			rmdir(dirname);
 			free_job_list(list);
 			free(list);
@@ -841,7 +841,7 @@ igt_main
 		int multiple;
 		struct job_list *list = malloc(sizeof(*list));
 
-		igt_fixture {
+		igt_fixture() {
 			int fd;
 			igt_require((fd = mkstemp(filename)) >= 0);
 			igt_require(write(fd, testlisttext, strlen(testlisttext)) == strlen(testlisttext));
@@ -896,7 +896,7 @@ igt_main
 			}
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			unlink(filename);
 			free_job_list(list);
 			free(list);
@@ -911,7 +911,7 @@ igt_main
 		int multiple;
 		struct job_list *list = malloc(sizeof(*list));
 
-		igt_fixture {
+		igt_fixture() {
 			int fd;
 			igt_require((fd = mkstemp(filename)) >= 0);
 			igt_require(write(fd, testlisttext, strlen(testlisttext)) == strlen(testlisttext));
@@ -956,7 +956,7 @@ igt_main
 			}
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			unlink(filename);
 			free_job_list(list);
 			free(list);
@@ -968,7 +968,7 @@ igt_main
 		volatile int dirfd = -1, fd = -1;
 		struct settings *cmp_settings = malloc(sizeof(*cmp_settings));
 
-		igt_fixture {
+		igt_fixture() {
 			igt_require(mkdtemp(dirname) != NULL);
 			rmdir(dirname);
 			init_settings(cmp_settings);
@@ -1019,7 +1019,7 @@ igt_main
 			assert_settings_equal(settings, cmp_settings);
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			close(fd);
 			close(dirfd);
 			clear_directory(dirname);
@@ -1037,7 +1037,7 @@ igt_main
 		list = malloc(sizeof(*list));
 		cmp_list = malloc(sizeof(*cmp_list));
 
-		igt_fixture {
+		igt_fixture() {
 			init_job_list(list);
 			init_job_list(cmp_list);
 			igt_require(mkdtemp(dirname) != NULL);
@@ -1071,7 +1071,7 @@ igt_main
 				assert_job_list_equal(list, cmp_list);
 			}
 
-			igt_fixture {
+			igt_fixture() {
 				close(fd);
 				close(dirfd);
 				clear_directory(dirname);
@@ -1080,7 +1080,7 @@ igt_main
 			}
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			free(cmp_list);
 			free(list);
 		}
@@ -1091,7 +1091,7 @@ igt_main
 		struct job_list *list = malloc(sizeof(*list));
 		volatile int dirfd = -1, subdirfd = -1, fd = -1;
 
-		igt_fixture {
+		igt_fixture() {
 			init_job_list(list);
 			igt_require(mkdtemp(dirname) != NULL);
 			rmdir(dirname);
@@ -1160,7 +1160,7 @@ igt_main
 			igt_assert_eqstr(env_var->value, "ENV_VARS");
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			close(fd);
 			close(dirfd);
 			close(subdirfd);
@@ -1175,7 +1175,7 @@ igt_main
 		struct job_list *list = malloc(sizeof(*list));
 		volatile int dirfd = -1, fd = -1;
 
-		igt_fixture {
+		igt_fixture() {
 			init_job_list(list);
 			igt_require(mkdtemp(dirname) != NULL);
 			rmdir(dirname);
@@ -1210,7 +1210,7 @@ igt_main
 				     "Execute state initialization created uname.txt.\n");
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			close(fd);
 			close(dirfd);
 			clear_directory(dirname);
@@ -1224,7 +1224,7 @@ igt_main
 		struct job_list *list = malloc(sizeof(*list));
 		volatile int dirfd = -1, subdirfd = -1, fd = -1;
 
-		igt_fixture {
+		igt_fixture() {
 			init_job_list(list);
 			igt_require(mkdtemp(dirname) != NULL);
 		}
@@ -1266,7 +1266,7 @@ igt_main
 			igt_assert_eqstr(list->entries[0].subtests[1], excludestring);
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			close(fd);
 			close(subdirfd);
 			close(dirfd);
@@ -1281,7 +1281,7 @@ igt_main
 		struct job_list *list = malloc(sizeof(*list));
 		volatile int dirfd = -1, subdirfd = -1, fd = -1;
 
-		igt_fixture {
+		igt_fixture() {
 			init_job_list(list);
 			igt_require(mkdtemp(dirname) != NULL);
 		}
@@ -1322,7 +1322,7 @@ igt_main
 			igt_assert_eqstr(list->entries[0].subtests[1], excludestring);
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			close(fd);
 			close(subdirfd);
 			close(dirfd);
@@ -1337,7 +1337,7 @@ igt_main
 		struct job_list *list = malloc(sizeof(*list));
 		volatile int dirfd = -1, subdirfd = -1, fd = -1;
 
-		igt_fixture {
+		igt_fixture() {
 			init_job_list(list);
 			igt_require(mkdtemp(dirname) != NULL);
 		}
@@ -1378,7 +1378,7 @@ igt_main
 			igt_assert_eq(list->entries[0].subtest_count, 4);
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			close(fd);
 			close(subdirfd);
 			close(dirfd);
@@ -1393,7 +1393,7 @@ igt_main
 		struct job_list *list = malloc(sizeof(*list));
 		volatile int dirfd = -1, subdirfd = -1, fd = -1;
 
-		igt_fixture {
+		igt_fixture() {
 			init_job_list(list);
 			igt_require(mkdtemp(dirname) != NULL);
 		}
@@ -1434,7 +1434,7 @@ igt_main
 			igt_assert_eq(list->entries[0].subtest_count, 4);
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			close(fd);
 			close(subdirfd);
 			close(dirfd);
@@ -1449,7 +1449,7 @@ igt_main
 		struct job_list *list = malloc(sizeof(*list));
 		volatile int dirfd = -1, subdirfd = -1, fd = -1;
 
-		igt_fixture {
+		igt_fixture() {
 			init_job_list(list);
 			igt_require(mkdtemp(dirname) != NULL);
 		}
@@ -1493,7 +1493,7 @@ igt_main
 			igt_assert_eq(list->size, NUM_TESTDATA_BINARIES);
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			close(fd);
 			close(subdirfd);
 			close(dirfd);
@@ -1508,7 +1508,7 @@ igt_main
 		struct job_list *list = malloc(sizeof(*list));
 		volatile int dirfd = -1, subdirfd = -1, fd = -1;
 
-		igt_fixture {
+		igt_fixture() {
 			init_job_list(list);
 			igt_require(mkdtemp(dirname) != NULL);
 		}
@@ -1553,7 +1553,7 @@ igt_main
 			igt_assert_eq(list->size, NUM_TESTDATA_BINARIES);
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			close(fd);
 			close(subdirfd);
 			close(dirfd);
@@ -1568,14 +1568,14 @@ igt_main
 		volatile int dirfd = -1, subdirfd = -1, fd = -1;
 		int multiple;
 
-		igt_fixture {
+		igt_fixture() {
 			init_job_list(list);
 		}
 
 		for (multiple = 0; multiple < 2; multiple++) {
 			char dirname[] = "tmpdirXXXXXX";
 
-			igt_fixture {
+			igt_fixture() {
 				igt_require(mkdtemp(dirname) != NULL);
 				rmdir(dirname);
 			}
@@ -1620,7 +1620,7 @@ igt_main
 					     "Execute created too many directories\n");
 			}
 
-			igt_fixture {
+			igt_fixture() {
 				close(fd);
 				close(subdirfd);
 				close(dirfd);
@@ -1629,7 +1629,7 @@ igt_main
 			}
 		}
 
-		igt_fixture
+		igt_fixture()
 			free(list);
 	}
 
@@ -1704,14 +1704,14 @@ igt_main
 		volatile int dirfd = -1, subdirfd = -1, fd = -1;
 		int multiple;
 
-		igt_fixture {
+		igt_fixture() {
 			init_job_list(list);
 		}
 
 		for (multiple = 0; multiple < 2; multiple++) {
 			char dirname[] = "tmpdirXXXXXX";
 
-			igt_fixture {
+			igt_fixture() {
 				/* This test checks that the stdout parsing for result without time data works, so use that */
 				setenv("IGT_RUNNER_DISABLE_SOCKET_COMMUNICATION", "1", 1);
 				igt_require(mkdtemp(dirname) != NULL);
@@ -1772,7 +1772,7 @@ igt_main
 				}
 			}
 
-			igt_fixture {
+			igt_fixture() {
 				close(fd);
 				close(subdirfd);
 				close(dirfd);
@@ -1782,7 +1782,7 @@ igt_main
 			}
 		}
 
-		igt_fixture
+		igt_fixture()
 			free(list);
 	}
 
@@ -1794,7 +1794,7 @@ igt_main
 		volatile int fd;
 		char filename[] = "tmplistXXXXXX";
 
-		igt_fixture {
+		igt_fixture() {
 			igt_require(mkdtemp(dirname) != NULL);
 			rmdir(dirname);
 
@@ -1840,7 +1840,7 @@ igt_main
 			igt_assert_eq(json_object_put(results), 1);
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			unlink(filename);
 			close(dirfd);
 			clear_directory(dirname);
@@ -1863,7 +1863,7 @@ igt_main
 		char blockfilename[] = "tmpblockXXXXXX";
 		char blockfilename_upper[] = "tmpBLOCKXXXXXX";
 
-		igt_fixture {
+		igt_fixture() {
 			igt_require(mkdtemp(dirname) != NULL);
 			rmdir(dirname);
 
@@ -1933,7 +1933,7 @@ igt_main
 			igt_assert_eqstr(list->entries[0].subtests[0], "second-subtest");
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			unlink(listfilename);
 			unlink(blockfilename);
 			unlink(blockfilename_upper);
@@ -1949,7 +1949,7 @@ igt_main
 		volatile int dirfd = -1;
 		char dirname[] = "tmpdirXXXXXX";
 
-		igt_fixture {
+		igt_fixture() {
 			igt_require(mkdtemp(dirname) != NULL);
 			rmdir(dirname);
 
@@ -1983,7 +1983,7 @@ igt_main
 			igt_assert_eq(json_object_put(results), 1);
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			close(dirfd);
 			clear_directory(dirname);
 			free_job_list(list);
@@ -1995,7 +1995,7 @@ igt_main
 		volatile int dirfd = -1;
 		char dirname[] = "tmpdirXXXXXX";
 
-		igt_fixture {
+		igt_fixture() {
 			igt_require(mkdtemp(dirname) != NULL);
 			rmdir(dirname);
 
@@ -2029,7 +2029,7 @@ igt_main
 			igt_assert_eq(json_object_put(results), 1);
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			close(dirfd);
 			clear_directory(dirname);
 			free_job_list(list);
@@ -2043,7 +2043,7 @@ igt_main
 		for (int multiple = 0; multiple <= 1; ++multiple) {
 			char dirname[] = "tmpdirXXXXXX";
 
-			igt_fixture {
+			igt_fixture() {
 				igt_require(mkdtemp(dirname) != NULL);
 				rmdir(dirname);
 
@@ -2084,7 +2084,7 @@ igt_main
 				igt_assert_eq(json_object_put(results), 1);
 			}
 
-			igt_fixture {
+			igt_fixture() {
 				close(dirfd);
 				clear_directory(dirname);
 				free_job_list(list);
@@ -2099,7 +2099,7 @@ igt_main
 		for (int multiple = 0; multiple <= 1; ++multiple) {
 			char dirname[] = "tmpdirXXXXXX";
 
-			igt_fixture {
+			igt_fixture() {
 				igt_require(mkdtemp(dirname) != NULL);
 				rmdir(dirname);
 
@@ -2144,7 +2144,7 @@ igt_main
 				igt_assert_eq(json_object_put(results), 1);
 			}
 
-			igt_fixture {
+			igt_fixture() {
 				close(dirfd);
 				clear_directory(dirname);
 				free_job_list(list);
@@ -2162,7 +2162,7 @@ igt_main
 			const char testlisttext[] = "igt@abort-fixture@b-subtest\n"
 				"igt@abort-fixture@a-subtest\n";
 
-			igt_fixture {
+			igt_fixture() {
 				int fd;
 				igt_require((fd = mkstemp(filename)) >= 0);
 				igt_require(write(fd, testlisttext, strlen(testlisttext)) == strlen(testlisttext));
@@ -2206,7 +2206,7 @@ igt_main
 				igt_assert_eq(json_object_put(results), 1);
 			}
 
-			igt_fixture {
+			igt_fixture() {
 				unlink(filename);
 				close(dirfd);
 				clear_directory(dirname);
@@ -2222,7 +2222,7 @@ igt_main
 		for (int multiple = 0; multiple <= 1; ++multiple) {
 			char dirname[] = "tmpdirXXXXXX";
 
-			igt_fixture {
+			igt_fixture() {
 				igt_require(mkdtemp(dirname) != NULL);
 				rmdir(dirname);
 
@@ -2265,7 +2265,7 @@ igt_main
 				igt_assert_eq(json_object_put(results), 1);
 			}
 
-			igt_fixture {
+			igt_fixture() {
 				close(dirfd);
 				clear_directory(dirname);
 				free_job_list(list);
@@ -2291,7 +2291,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		clear_settings(settings);
 		free(settings);
 	}
diff --git a/runner/testdata/abort-fixture.c b/runner/testdata/abort-fixture.c
index 6a1cb9866468..f0ff5d678211 100644
--- a/runner/testdata/abort-fixture.c
+++ b/runner/testdata/abort-fixture.c
@@ -25,7 +25,7 @@
 
 igt_main
 {
-	igt_fixture {
+	igt_fixture() {
 		igt_abort_on_f(true, "I'm out!\n");
 	}
 
diff --git a/runner/testdata/skippers.c b/runner/testdata/skippers.c
index be4a31b423e6..1d58e418fab1 100644
--- a/runner/testdata/skippers.c
+++ b/runner/testdata/skippers.c
@@ -2,7 +2,7 @@
 
 igt_main
 {
-	igt_fixture {
+	igt_fixture() {
 		igt_require_f(false, "Skipping from fixture\n");
 	}
 
diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index 97813d80fc8c..b4bcd76d8c9c 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -503,7 +503,7 @@ igt_main
 	data_t data = {0};
 	igt_skip_on_simulation();
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_AMDGPU);
 
 		if (data.drm_fd == -1)
@@ -527,7 +527,7 @@ igt_main
 	igt_subtest("abm_gradual")
 		abm_gradual(&data);
 
-	igt_fixture {
+	igt_fixture() {
 		test_fini(&data);
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
diff --git a/tests/amdgpu/amd_assr.c b/tests/amdgpu/amd_assr.c
index fc2367f99e9e..133e8cb097c5 100644
--- a/tests/amdgpu/amd_assr.c
+++ b/tests/amdgpu/amd_assr.c
@@ -275,7 +275,7 @@ igt_main
 
 	memset(&data, 0, sizeof(data));
 
-	igt_fixture
+	igt_fixture()
 	{
 		data.fd = drm_open_driver_master(DRIVER_ANY);
 
@@ -296,7 +296,7 @@ igt_main
 	igt_subtest("assr-links-suspend")
 		test_assr_links(&data, TEST_SUSPEND);
 
-	igt_fixture
+	igt_fixture()
 	{
 		igt_display_fini(&data.display);
 		drm_close_driver(data.fd);
diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 9bb84221e774..06562cde0bf0 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -678,7 +678,7 @@ igt_main
 	enable_test = env && atoi(env);
 #endif
 
-	igt_fixture {
+	igt_fixture() {
 		uint32_t major, minor;
 		int err;
 
@@ -811,7 +811,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
 	}
diff --git a/tests/amdgpu/amd_basic_ex.c b/tests/amdgpu/amd_basic_ex.c
index ff8e75a0bd6f..e1cda3e9b6f5 100644
--- a/tests/amdgpu/amd_basic_ex.c
+++ b/tests/amdgpu/amd_basic_ex.c
@@ -29,7 +29,7 @@ igt_main
 	int r;
 	bool arr_cap[AMD_IP_MAX] = {0};
 
-	igt_fixture {
+	igt_fixture() {
 		uint32_t major, minor;
 		int err;
 
@@ -56,7 +56,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
 	}
diff --git a/tests/amdgpu/amd_basic_multi_gpu.c b/tests/amdgpu/amd_basic_multi_gpu.c
index b41111dce46d..03a4a719138d 100644
--- a/tests/amdgpu/amd_basic_multi_gpu.c
+++ b/tests/amdgpu/amd_basic_multi_gpu.c
@@ -168,7 +168,7 @@ igt_main
 	enable_test = env && atoi(env);
 #endif
 
-	igt_fixture {
+	igt_fixture() {
 		uint32_t major, minor;
 		int err;
 
@@ -416,7 +416,7 @@ igt_main
 		igt_waitchildren();
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
 	}
diff --git a/tests/amdgpu/amd_bo.c b/tests/amdgpu/amd_bo.c
index 93e04f046725..09fc7b496d6f 100644
--- a/tests/amdgpu/amd_bo.c
+++ b/tests/amdgpu/amd_bo.c
@@ -254,7 +254,7 @@ igt_main
 	struct bo_data bo;
 	int fd = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		uint32_t major, minor;
 		int err;
 
@@ -285,7 +285,7 @@ igt_main
 	igt_subtest("amdgpu_bo_find_by_cpu_mapping")
 	amdgpu_bo_find_by_cpu_mapping(device);
 
-	igt_fixture {
+	igt_fixture() {
 		amdgpu_bo_clean(device, &bo);
 		amdgpu_device_deinitialize(device);
 		close(fd);
diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
index 01946de24998..03ec30648abc 100644
--- a/tests/amdgpu/amd_bypass.c
+++ b/tests/amdgpu/amd_bypass.c
@@ -404,7 +404,7 @@ igt_main
 
 	igt_skip_on_simulation();
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_AMDGPU);
 		if (data.drm_fd == -1)
 			igt_skip("Not an amdgpu driver.\n");
@@ -420,7 +420,7 @@ igt_main
 	igt_subtest("8bpc-bypass-mode")
 		bypass_8bpc_test(&data);
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 	}
 }
diff --git a/tests/amdgpu/amd_color.c b/tests/amdgpu/amd_color.c
index 4a98df3be099..d2f3e9c659bc 100644
--- a/tests/amdgpu/amd_color.c
+++ b/tests/amdgpu/amd_color.c
@@ -400,7 +400,7 @@ igt_main
 
 	memset(&data, 0, sizeof(data));
 
-	igt_fixture
+	igt_fixture()
 	{
 		data.fd = drm_open_driver_master(DRIVER_AMDGPU);
 
@@ -418,7 +418,7 @@ igt_main
 	igt_describe("Tests color accuracy of CRTC degamma and regamma");
 	igt_subtest("crtc-lut-accuracy") test_crtc_lut_accuracy(&data);
 
-	igt_fixture
+	igt_fixture()
 	{
 		igt_display_fini(&data.display);
 	}
diff --git a/tests/amdgpu/amd_cp_dma_misc.c b/tests/amdgpu/amd_cp_dma_misc.c
index a5a61530198e..e86d580c29c1 100644
--- a/tests/amdgpu/amd_cp_dma_misc.c
+++ b/tests/amdgpu/amd_cp_dma_misc.c
@@ -41,7 +41,7 @@ igt_main
 	}, *e;
 
 
-	igt_fixture {
+	igt_fixture() {
 		num_devices = amdgpu_open_devices(true, MAX_CARDS_SUPPORTED, drm_amdgpu_fds);
 		igt_require(num_devices > 0);
 		r = amdgpu_device_initialize(drm_amdgpu_fds[0], &major,
@@ -97,7 +97,7 @@ igt_main
 				gpu_info2.family_id);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		amdgpu_device_deinitialize(device);
 		close(drm_amdgpu_fds[0]);
 		if (num_devices > 1) {
diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c
index 0f2c3316854f..4d6b5aaf267a 100644
--- a/tests/amdgpu/amd_cs_nop.c
+++ b/tests/amdgpu/amd_cs_nop.c
@@ -179,7 +179,7 @@ igt_main
 	enable_test = env && atoi(env);
 #endif
 
-	igt_fixture {
+	igt_fixture() {
 		uint32_t major, minor;
 		int err;
 
@@ -222,7 +222,7 @@ igt_main
 	}
 #endif
 
-	igt_fixture {
+	igt_fixture() {
 		amdgpu_cs_ctx_free(context);
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index 41b3aa15e75c..ea7c546cf797 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -50,7 +50,7 @@ igt_main
 	enable_test = env && atoi(env);
 #endif
 
-	igt_fixture {
+	igt_fixture() {
 		uint32_t major, minor;
 		int err;
 
@@ -246,7 +246,7 @@ igt_main
 	}
 #endif
 
-	igt_fixture {
+	igt_fixture() {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
 	}
diff --git a/tests/amdgpu/amd_dispatch.c b/tests/amdgpu/amd_dispatch.c
index 06bfebd143a4..bbd4761c7eb3 100644
--- a/tests/amdgpu/amd_dispatch.c
+++ b/tests/amdgpu/amd_dispatch.c
@@ -92,7 +92,7 @@ igt_main
 	enable_test = env && atoi(env);
 #endif
 
-	igt_fixture {
+	igt_fixture() {
 		uint32_t major, minor;
 		int err;
 
@@ -215,7 +215,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
 	}
diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
index 13c4452da326..68d774ffbeb3 100644
--- a/tests/amdgpu/amd_dp_dsc.c
+++ b/tests/amdgpu/amd_dp_dsc.c
@@ -542,7 +542,7 @@ igt_main {
 
 	igt_skip_on_simulation();
 
-	igt_fixture {
+	igt_fixture() {
 		data.fd = drm_open_driver_master(DRIVER_ANY);
 
 		igt_display_require(&data.display, data.fd);
@@ -569,7 +569,7 @@ igt_main {
 	igt_subtest("dsc-bpc")
 	    test_dsc_bpc(&data);
 
-	igt_fixture {
+	igt_fixture() {
 		igt_reset_connectors();
 		igt_display_fini(&data.display);
 	}
diff --git a/tests/amdgpu/amd_freesync_video_mode.c b/tests/amdgpu/amd_freesync_video_mode.c
index adfc8a8106ba..fbc770311f30 100644
--- a/tests/amdgpu/amd_freesync_video_mode.c
+++ b/tests/amdgpu/amd_freesync_video_mode.c
@@ -865,7 +865,7 @@ igt_main {
 
 	memset(&data, 0, sizeof(data));
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_AMDGPU);
 		if (data.drm_fd == -1) {
 			igt_skip("Not an amdgpu driver.\n");
@@ -898,7 +898,7 @@ igt_main {
 
 	igt_info("end of test\n");
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 		if (data.modes)
diff --git a/tests/amdgpu/amd_fuzzing.c b/tests/amdgpu/amd_fuzzing.c
index b2bba83fa1fe..e9109c5b8076 100644
--- a/tests/amdgpu/amd_fuzzing.c
+++ b/tests/amdgpu/amd_fuzzing.c
@@ -164,7 +164,7 @@ igt_main
 			AMD_IP_VCN_JPEG, AMD_IP_VPE
 	};
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_AMDGPU);
 		igt_require(fd != -1);
 	}
@@ -181,7 +181,7 @@ igt_main
 	igt_subtest("gem-create-fuzzing")
 		amd_gem_create_fuzzing(fd);
 
-	igt_fixture {
+	igt_fixture() {
 		drm_close_driver(fd);
 	}
 }
diff --git a/tests/amdgpu/amd_gang_cs.c b/tests/amdgpu/amd_gang_cs.c
index cd36f08ad563..242a331feb91 100644
--- a/tests/amdgpu/amd_gang_cs.c
+++ b/tests/amdgpu/amd_gang_cs.c
@@ -246,7 +246,7 @@ igt_main
 	int r;
 	bool arr_cap[AMD_IP_MAX] = {0};
 
-	igt_fixture {
+	igt_fixture() {
 		uint32_t major, minor;
 		int err;
 
@@ -282,7 +282,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
 	}
diff --git a/tests/amdgpu/amd_hotplug.c b/tests/amdgpu/amd_hotplug.c
index bbd50452b253..47c066349596 100644
--- a/tests/amdgpu/amd_hotplug.c
+++ b/tests/amdgpu/amd_hotplug.c
@@ -208,7 +208,7 @@ igt_main
 
 	memset(&data, 0, sizeof(data));
 
-	igt_fixture
+	igt_fixture()
 	{
 		data.fd = drm_open_driver_master(DRIVER_AMDGPU);
 
@@ -227,7 +227,7 @@ igt_main
 	igt_describe("Tests HPD on each connected output after a suspend sequence");
 	igt_subtest("basic-suspend") test_hotplug_basic(&data, true);
 
-	igt_fixture
+	igt_fixture()
 	{
 		igt_display_fini(&data.display);
 	}
diff --git a/tests/amdgpu/amd_ilr.c b/tests/amdgpu/amd_ilr.c
index b09980a154c0..ee9695f9eba4 100644
--- a/tests/amdgpu/amd_ilr.c
+++ b/tests/amdgpu/amd_ilr.c
@@ -322,7 +322,7 @@ igt_main
 
 	igt_skip_on_simulation();
 
-	igt_fixture
+	igt_fixture()
 	{
 		data.drm_fd = drm_open_driver_master(DRIVER_AMDGPU);
 		if (data.drm_fd == -1)
@@ -342,7 +342,7 @@ igt_main
 	igt_subtest("ilr-policy")
 		test_flow(&data, ILR_POLICY);
 
-	igt_fixture
+	igt_fixture()
 	{
 		igt_display_fini(&data.display);
 	}
diff --git a/tests/amdgpu/amd_info.c b/tests/amdgpu/amd_info.c
index ace739da4d6a..2fc9b8e81083 100644
--- a/tests/amdgpu/amd_info.c
+++ b/tests/amdgpu/amd_info.c
@@ -124,7 +124,7 @@ igt_main
 	int fd = -1;
 	int r = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		uint32_t major, minor;
 		int err;
 
@@ -155,7 +155,7 @@ igt_main
 		query_timestamp_test(device, 7000000, 1);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
 	}
diff --git a/tests/amdgpu/amd_jpeg_dec.c b/tests/amdgpu/amd_jpeg_dec.c
index 4431dd8e4bd4..6ff2ad68d865 100644
--- a/tests/amdgpu/amd_jpeg_dec.c
+++ b/tests/amdgpu/amd_jpeg_dec.c
@@ -223,7 +223,7 @@ igt_main
 	struct mmd_shared_context shared_context = {};
 	int fd = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		uint32_t major, minor;
 		int err;
 
@@ -240,7 +240,7 @@ igt_main
 	igt_subtest("amdgpu_cs_jpeg_decode")
 	amdgpu_cs_jpeg_decode(device, &shared_context);
 
-	igt_fixture {
+	igt_fixture() {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
 	}
diff --git a/tests/amdgpu/amd_jpeg_queue.c b/tests/amdgpu/amd_jpeg_queue.c
index 82d8679cc713..4a3146e0f3a3 100644
--- a/tests/amdgpu/amd_jpeg_queue.c
+++ b/tests/amdgpu/amd_jpeg_queue.c
@@ -85,7 +85,7 @@ igt_main
 	int err;
 	struct pci_addr pci;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_AMDGPU);
 		err = amdgpu_device_initialize(fd, &major, &minor, &device);
 		igt_require(err == 0);
@@ -107,7 +107,7 @@ igt_main
 		mm_queue_test_helper(device, &shared_context, jpeg_queue_decode, err, &pci);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
 	}
diff --git a/tests/amdgpu/amd_link_settings.c b/tests/amdgpu/amd_link_settings.c
index 226c94d73820..351d36fd81dd 100644
--- a/tests/amdgpu/amd_link_settings.c
+++ b/tests/amdgpu/amd_link_settings.c
@@ -253,7 +253,7 @@ igt_main
 
 	igt_skip_on_simulation();
 
-	igt_fixture
+	igt_fixture()
 	{
 		data.drm_fd = drm_open_driver_master(DRIVER_AMDGPU);
 		if (data.drm_fd == -1)
@@ -272,7 +272,7 @@ igt_main
 	igt_subtest("link-training-configs")
 		test_link_training_configs(&data);
 
-	igt_fixture
+	igt_fixture()
 	{
 		igt_display_fini(&data.display);
 	}
diff --git a/tests/amdgpu/amd_mall.c b/tests/amdgpu/amd_mall.c
index c21fcc27f706..36b9271d7295 100644
--- a/tests/amdgpu/amd_mall.c
+++ b/tests/amdgpu/amd_mall.c
@@ -136,7 +136,7 @@ igt_main
 
 	memset(&data, 0, sizeof(data));
 
-	igt_fixture
+	igt_fixture()
 	{
 		data.fd = drm_open_driver_master(DRIVER_AMDGPU);
 
@@ -151,7 +151,7 @@ igt_main
 		     "of GPU VRAM when screen contents are idle");
 	igt_subtest("static-screen") test_mall_ss(&data);
 
-	igt_fixture
+	igt_fixture()
 	{
 		igt_display_fini(&data.display);
 	}
diff --git a/tests/amdgpu/amd_max_bpc.c b/tests/amdgpu/amd_max_bpc.c
index effe830a29d0..51e6eb7cd1c9 100644
--- a/tests/amdgpu/amd_max_bpc.c
+++ b/tests/amdgpu/amd_max_bpc.c
@@ -126,7 +126,7 @@ igt_main
 
 	memset(&data, 0, sizeof(data));
 
-	igt_fixture
+	igt_fixture()
 	{
 		data.fd = drm_open_driver_master(DRIVER_AMDGPU);
 
@@ -140,7 +140,7 @@ igt_main
 	igt_describe("Tests overly high 'max bpc' should not affect 4K modes on HDMI");
 	igt_subtest("4k-mode-max-bpc") test_4k_mode_max_bpc(&data);
 
-	igt_fixture
+	igt_fixture()
 	{
 		igt_display_fini(&data.display);
 	}
diff --git a/tests/amdgpu/amd_mem_leak.c b/tests/amdgpu/amd_mem_leak.c
index 74f887bf93db..4ea1243a731c 100644
--- a/tests/amdgpu/amd_mem_leak.c
+++ b/tests/amdgpu/amd_mem_leak.c
@@ -135,7 +135,7 @@ igt_main
 
 	memset(&data, 0, sizeof(data));
 
-	igt_fixture
+	igt_fixture()
 	{
 		data.fd = drm_open_driver_master(DRIVER_AMDGPU);
 
@@ -151,7 +151,7 @@ igt_main
 	igt_describe("Test memroy leaks after connector hotplug");
 	igt_subtest("connector-hotplug") test_hotplug(&data);
 
-	igt_fixture
+	igt_fixture()
 	{
 		igt_display_fini(&data.display);
 		drm_close_driver(data.fd);
diff --git a/tests/amdgpu/amd_mode_switch.c b/tests/amdgpu/amd_mode_switch.c
index 270b1b9f64f9..bd89b7f338e5 100644
--- a/tests/amdgpu/amd_mode_switch.c
+++ b/tests/amdgpu/amd_mode_switch.c
@@ -185,7 +185,7 @@ igt_main
 
 	memset(&data, 0, sizeof(data));
 
-	igt_fixture
+	igt_fixture()
 	{
 		data.fd = drm_open_driver_master(DRIVER_AMDGPU);
 
@@ -203,7 +203,7 @@ igt_main
 			run_mode_switch_first_last(&data, i + 1);
 	}
 
-	igt_fixture
+	igt_fixture()
 	{
 		igt_display_fini(&data.display);
 	}
diff --git a/tests/amdgpu/amd_module_load.c b/tests/amdgpu/amd_module_load.c
index cbc9106f6013..aef7ec786791 100644
--- a/tests/amdgpu/amd_module_load.c
+++ b/tests/amdgpu/amd_module_load.c
@@ -75,7 +75,7 @@ igt_main
 		igt_amdgpu_driver_unload();
 	}
 
-	igt_fixture
+	igt_fixture()
 	{
 		/* load the module back in */
 		igt_amdgpu_driver_load(NULL);
diff --git a/tests/amdgpu/amd_multidisplay_modeset.c b/tests/amdgpu/amd_multidisplay_modeset.c
index f940973525b0..b7434b089e88 100644
--- a/tests/amdgpu/amd_multidisplay_modeset.c
+++ b/tests/amdgpu/amd_multidisplay_modeset.c
@@ -414,7 +414,7 @@ igt_main
 
 	memset(&data, 0, sizeof(data));
 
-	igt_fixture
+	igt_fixture()
 	{
 		data.fd = drm_open_driver_master(DRIVER_AMDGPU);
 
@@ -433,7 +433,7 @@ igt_main
 		multiple_display_test(&data, DISPLAY_ENABLE_DISABLE);
 
 
-	igt_fixture
+	igt_fixture()
 	{
 		igt_display_fini(&data.display);
 		drm_close_driver(data.fd);
diff --git a/tests/amdgpu/amd_odm.c b/tests/amdgpu/amd_odm.c
index 839f2de3f52b..9514c08fede2 100644
--- a/tests/amdgpu/amd_odm.c
+++ b/tests/amdgpu/amd_odm.c
@@ -166,7 +166,7 @@ igt_main
 
 	memset(&data, 0, sizeof(data));
 
-	igt_fixture
+	igt_fixture()
 	{
 		data.fd = drm_open_driver_master(DRIVER_ANY);
 
@@ -181,7 +181,7 @@ igt_main
 	igt_subtest_f("odm-combine-2-to-1-%s", test_mode[TEST_MODE_IDX_ODMC_2_TO_1].name)
 		run_test_odmc(&data, ODMC_2_TO_1, &test_mode[TEST_MODE_IDX_ODMC_2_TO_1]);
 
-	igt_fixture
+	igt_fixture()
 	{
 		igt_display_fini(&data.display);
 	}
diff --git a/tests/amdgpu/amd_pci_unplug.c b/tests/amdgpu/amd_pci_unplug.c
index cb88185a01e5..ad8c1fd1d003 100644
--- a/tests/amdgpu/amd_pci_unplug.c
+++ b/tests/amdgpu/amd_pci_unplug.c
@@ -37,7 +37,7 @@ igt_main
 	struct amd_pci_unplug_setup setup = {0};
 	struct amd_pci_unplug unplug = {0};
 
-	igt_fixture {
+	igt_fixture() {
 		setup.minor_version_req = 46;
 	}
 
@@ -53,5 +53,5 @@ igt_main
 	igt_subtest("amdgpu_hotunplug_with_exported_fence")
 		amdgpu_hotunplug_with_exported_fence(&setup, &unplug);
 
-	igt_fixture { }
+	igt_fixture() { }
 }
diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
index ee7de5778031..130d4231a680 100644
--- a/tests/amdgpu/amd_plane.c
+++ b/tests/amdgpu/amd_plane.c
@@ -904,7 +904,7 @@ igt_main
 
 	memset(&data, 0, sizeof(data));
 
-	igt_fixture
+	igt_fixture()
 	{
 		data.fd = drm_open_driver_master(DRIVER_AMDGPU);
 
@@ -980,7 +980,7 @@ igt_main
 	igt_subtest("mpo-scale-p010-multihead")
 		test_display_mpo(&data, MPO_SCALE, DRM_FORMAT_P010, DISPLAYS_TO_TEST);
 
-	igt_fixture
+	igt_fixture()
 	{
 		igt_display_fini(&data.display);
 	}
diff --git a/tests/amdgpu/amd_prime.c b/tests/amdgpu/amd_prime.c
index 6bcf11198d42..57fdfe8c61ed 100644
--- a/tests/amdgpu/amd_prime.c
+++ b/tests/amdgpu/amd_prime.c
@@ -435,7 +435,7 @@ igt_main
 
 	igt_skip_on_simulation();
 
-	igt_fixture {
+	igt_fixture() {
 		uint32_t major, minor;
 		int err;
 
@@ -459,7 +459,7 @@ igt_main
 	igt_subtest("shrink")
 		shrink(i915, amd, device);
 
-	igt_fixture {
+	igt_fixture() {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(amd);
 		drm_close_driver(i915);
diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
index 9da161a0949b..fca68ba0162d 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -707,7 +707,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	igt_skip_on_simulation();
 	memset(&data, 0, sizeof(data));
 
-	igt_fixture
+	igt_fixture()
 	{
 		data.fd = drm_open_driver_master(DRIVER_AMDGPU);
 		if (data.fd == -1) igt_skip("Not an amdgpu driver.\n");
@@ -757,7 +757,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		     "and to validate PSR SU disable/re-enable w/ primary scaling ratio 0.75");
 	igt_subtest("psr_su_mpo_scaling_0_75") run_check_psr_su_mpo(&data, true, .75);
 
-	igt_fixture
+	igt_fixture()
 	{
 		if (opt.visual_confirm) {
 			igt_require_f(igt_amd_set_visual_confirm(data.fd, VISUAL_CONFIRM_DISABLE),
diff --git a/tests/amdgpu/amd_pstate.c b/tests/amdgpu/amd_pstate.c
index 2bc7942521e6..448a5618f6d9 100644
--- a/tests/amdgpu/amd_pstate.c
+++ b/tests/amdgpu/amd_pstate.c
@@ -45,7 +45,7 @@ igt_main
 	amdgpu_device_handle device;
 	int fd = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		uint32_t major, minor;
 		int err;
 
@@ -61,7 +61,7 @@ igt_main
 	igt_subtest("amdgpu_pstate")
 	amdgpu_stable_pstate_test(device);
 
-	igt_fixture {
+	igt_fixture() {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
 	}
diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index 0e33e44a2c86..bb406324010f 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -1162,7 +1162,7 @@ igt_main
 
 	int const_num_of_tests;
 
-	igt_fixture {
+	igt_fixture() {
 		uint32_t major, minor;
 		int err;
 
@@ -1255,7 +1255,7 @@ igt_main
 	if (sh_mem && (!sh_mem->sub_test_is_existed))
 		set_next_test_to_skip(sh_mem);
 
-	igt_fixture {
+	igt_fixture() {
 		if (process == PROCESS_TEST)
 			waitpid(test_child, &testExitMethod, 0);
 		waitpid(pid_background, &backgrounExitMethod, 0);
diff --git a/tests/amdgpu/amd_ras.c b/tests/amdgpu/amd_ras.c
index fdf1bc27d40f..70ebed630180 100644
--- a/tests/amdgpu/amd_ras.c
+++ b/tests/amdgpu/amd_ras.c
@@ -993,7 +993,7 @@ igt_main
 	struct amd_ras_setup setup = {};
 	bool render_mode = true;
 
-	igt_fixture {
+	igt_fixture() {
 
 		igt_skip_on(!amdgpu_open_devices(render_mode, MAX_CARDS_SUPPORTED,
 				setup.drm_amdgpu));
@@ -1035,7 +1035,7 @@ igt_main
 			amdgpu_ras_enable_test(&setup);
 		}
 	}
-	igt_fixture {
+	igt_fixture() {
 		ras_tests_cleanup(&setup);
 	}
 }
diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
index 500e8253e809..6755ec3521a2 100644
--- a/tests/amdgpu/amd_replay.c
+++ b/tests/amdgpu/amd_replay.c
@@ -414,7 +414,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	igt_skip_on_simulation();
 	memset(&data, 0, sizeof(data));
 
-	igt_fixture
+	igt_fixture()
 	{
 		data.fd = drm_open_driver_master(DRIVER_AMDGPU);
 
@@ -449,7 +449,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	igt_describe("Test whether Panel Replay can be enabled after resume from suspend");
 	igt_subtest("replay_suspend") run_check_replay_suspend(&data);
 
-	igt_fixture
+	igt_fixture()
 	{
 		if (opt.visual_confirm) {
 			igt_skip_on(!igt_amd_has_visual_confirm(data.fd));
diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
index ce448a806e27..65b527fd38f3 100644
--- a/tests/amdgpu/amd_security.c
+++ b/tests/amdgpu/amd_security.c
@@ -324,7 +324,7 @@ igt_main
 	enable_test = env && atoi(env);
 #endif
 
-	igt_fixture {
+	igt_fixture() {
 		uint32_t major, minor;
 		int err;
 
@@ -379,7 +379,7 @@ igt_main
 							is_secure, true);
 #endif
 
-	igt_fixture {
+	igt_fixture() {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
 	}
diff --git a/tests/amdgpu/amd_subvp.c b/tests/amdgpu/amd_subvp.c
index f9915784b224..8a7268b8a33e 100644
--- a/tests/amdgpu/amd_subvp.c
+++ b/tests/amdgpu/amd_subvp.c
@@ -160,7 +160,7 @@ igt_main
 
 	memset(&data, 0, sizeof(data));
 
-	igt_fixture
+	igt_fixture()
 	{
 		data.fd = drm_open_driver_master(DRIVER_AMDGPU);
 		igt_display_require(&data.display, data.fd);
@@ -173,7 +173,7 @@ igt_main
 	igt_describe("Tests whether system enables sub-viewport when a specific mode is committed");
 	igt_subtest("dual-4k60") test_subvp(&data);
 
-	igt_fixture
+	igt_fixture()
 	{
 		igt_display_fini(&data.display);
 	}
diff --git a/tests/amdgpu/amd_syncobj.c b/tests/amdgpu/amd_syncobj.c
index e1d80758e8b9..a5e53d9f42ad 100644
--- a/tests/amdgpu/amd_syncobj.c
+++ b/tests/amdgpu/amd_syncobj.c
@@ -239,7 +239,7 @@ igt_main
 	amdgpu_device_handle device;
 	int fd = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		uint32_t major, minor;
 		int err;
 
@@ -255,7 +255,7 @@ igt_main
 	igt_subtest("amdgpu_syncobj_timeline")
 	amdgpu_syncobj_timeline(device);
 
-	igt_fixture {
+	igt_fixture() {
 		amdgpu_device_deinitialize(device);
 		close(fd);
 	}
diff --git a/tests/amdgpu/amd_uvd_dec.c b/tests/amdgpu/amd_uvd_dec.c
index 559092768b01..6151a59adc1b 100644
--- a/tests/amdgpu/amd_uvd_dec.c
+++ b/tests/amdgpu/amd_uvd_dec.c
@@ -301,7 +301,7 @@ igt_main
 	struct mmd_shared_context shared_context = {};
 	int fd = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		uint32_t major, minor;
 		int err;
 
@@ -329,7 +329,7 @@ igt_main
 	igt_subtest("amdgpu_uvd_dec_destroy")
 	amdgpu_uvd_dec_destroy(device, &context, &shared_context);
 
-	igt_fixture {
+	igt_fixture() {
 		mmd_context_clean(device, &context);
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
diff --git a/tests/amdgpu/amd_uvd_enc.c b/tests/amdgpu/amd_uvd_enc.c
index 15fb11fa3b53..53d82c0e92d3 100644
--- a/tests/amdgpu/amd_uvd_enc.c
+++ b/tests/amdgpu/amd_uvd_enc.c
@@ -315,7 +315,7 @@ igt_main
 	struct mmd_shared_context shared_context = {};
 	int fd = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		uint32_t major, minor;
 		int err;
 
@@ -335,7 +335,7 @@ igt_main
 	igt_subtest("uvd_encoder")
 		amdgpu_uvd_enc_test(device, &shared_context);
 
-	igt_fixture {
+	igt_fixture() {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
 	}
diff --git a/tests/amdgpu/amd_vce_enc.c b/tests/amdgpu/amd_vce_enc.c
index de7cb8d04064..b6dee0467dc2 100644
--- a/tests/amdgpu/amd_vce_enc.c
+++ b/tests/amdgpu/amd_vce_enc.c
@@ -593,7 +593,7 @@ igt_main
 	int fd = -1;
 	bool is_mv_supported = false;
 
-	igt_fixture {
+	igt_fixture() {
 		uint32_t major, minor;
 		int err;
 
@@ -611,7 +611,7 @@ igt_main
 	igt_subtest("amdgpu_vce_encoder")
 		amdgpu_vce_enc_test(device, &shared_context, is_mv_supported);
 
-	igt_fixture {
+	igt_fixture() {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
 	}
diff --git a/tests/amdgpu/amd_vcn.c b/tests/amdgpu/amd_vcn.c
index f696d4164a82..da8050640238 100644
--- a/tests/amdgpu/amd_vcn.c
+++ b/tests/amdgpu/amd_vcn.c
@@ -1239,7 +1239,7 @@ igt_main
 	struct mmd_shared_context shared_context = {};
 	int fd = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		uint32_t major, minor;
 		int err;
 
@@ -1280,7 +1280,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		mmd_context_clean(device, &context);
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
diff --git a/tests/amdgpu/amd_vcn_queue.c b/tests/amdgpu/amd_vcn_queue.c
index 7d95567a2df6..45cf78c087cf 100644
--- a/tests/amdgpu/amd_vcn_queue.c
+++ b/tests/amdgpu/amd_vcn_queue.c
@@ -67,7 +67,7 @@ igt_main
 	struct pci_addr pci;
 	int err;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_AMDGPU);
 		err = amdgpu_device_initialize(fd, &major, &minor, &device);
 		igt_require(err == 0);
@@ -92,7 +92,7 @@ igt_main
 		mm_queue_test_helper(device, &shared_context, vcn_queue_test, err, &pci);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		mmd_context_clean(device, &context);
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
diff --git a/tests/amdgpu/amd_vm.c b/tests/amdgpu/amd_vm.c
index 9cd56e2b5597..88f58f078902 100644
--- a/tests/amdgpu/amd_vm.c
+++ b/tests/amdgpu/amd_vm.c
@@ -203,7 +203,7 @@ igt_main
 	struct amdgpu_gpu_info gpu_info = {};
 	int fd = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		uint32_t major, minor;
 		int err;
 
@@ -230,7 +230,7 @@ igt_main
 	igt_subtest("amdgpu-vm-mapping-test")
 	amdgpu_vm_mapping_test(device);
 
-	igt_fixture {
+	igt_fixture() {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
 	}
diff --git a/tests/amdgpu/amd_vpe.c b/tests/amdgpu/amd_vpe.c
index e79ea133145b..93d91ffc565a 100644
--- a/tests/amdgpu/amd_vpe.c
+++ b/tests/amdgpu/amd_vpe.c
@@ -221,7 +221,7 @@ igt_main
 	amdgpu_device_handle device;
 	int fd = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		uint32_t major, minor;
 		int r;
 
@@ -249,7 +249,7 @@ igt_main
 	igt_subtest("vpe-blit-test")
 	amdgpu_cs_vpe_blit(device, &context);
 
-	igt_fixture {
+	igt_fixture() {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
 	}
diff --git a/tests/amdgpu/amd_vrr_range.c b/tests/amdgpu/amd_vrr_range.c
index 38ef1d27fe7d..f7aa43d6e8ef 100644
--- a/tests/amdgpu/amd_vrr_range.c
+++ b/tests/amdgpu/amd_vrr_range.c
@@ -464,7 +464,7 @@ igt_main
 
 	memset(&data, 0, sizeof(data));
 
-	igt_fixture
+	igt_fixture()
 	{
 		data.fd = drm_open_driver_master(DRIVER_AMDGPU);
 
@@ -487,7 +487,7 @@ igt_main
 	igt_describe("Freesync range from display after suspend");
 	igt_subtest("freesync-range-suspend") test_freesync_range_suspend(&data);
 
-	igt_fixture
+	igt_fixture()
 	{
 		igt_display_fini(&data.display);
 		drm_close_driver(data.fd);
diff --git a/tests/chamelium/kms_chamelium_audio.c b/tests/chamelium/kms_chamelium_audio.c
index 4feae6a93db6..c7eabdf4f367 100644
--- a/tests/chamelium/kms_chamelium_audio.c
+++ b/tests/chamelium/kms_chamelium_audio.c
@@ -854,13 +854,13 @@ igt_main
 	struct chamelium_port *port;
 	int p;
 
-	igt_fixture {
+	igt_fixture() {
 		chamelium_init_test(&data);
 	}
 
 	igt_describe("DisplayPort tests");
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			chamelium_require_connector_present(
 				data.ports, DRM_MODE_CONNECTOR_DisplayPort,
 				data.port_count, 1);
@@ -878,7 +878,7 @@ igt_main
 
 	igt_describe("HDMI tests");
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			chamelium_require_connector_present(
 				data.ports, DRM_MODE_CONNECTOR_HDMIA,
 				data.port_count, 1);
@@ -894,7 +894,7 @@ igt_main
 						IGT_CUSTOM_EDID_HDMI_AUDIO);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index 1d4f16da40ce..3d5be31c3de7 100644
--- a/tests/chamelium/kms_chamelium_color.c
+++ b/tests/chamelium/kms_chamelium_color.c
@@ -718,7 +718,7 @@ igt_main
 	int i;
 	data_t data = {};
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		if (is_intel_device(data.drm_fd))
 			data.devid = intel_get_drm_devid(data.drm_fd);
@@ -766,7 +766,7 @@ igt_main
 	igt_subtest_group
 		run_tests_for_pipe(&data);
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 	}
 }
diff --git a/tests/chamelium/kms_chamelium_edid.c b/tests/chamelium/kms_chamelium_edid.c
index 9a7915566cca..44ddd302db71 100644
--- a/tests/chamelium/kms_chamelium_edid.c
+++ b/tests/chamelium/kms_chamelium_edid.c
@@ -525,13 +525,13 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	struct chamelium_port *port;
 	int p;
 
-	igt_fixture {
+	igt_fixture() {
 		chamelium_init_test(&data);
 	}
 
 	igt_describe("DisplayPort tests");
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			chamelium_require_connector_present(
 				data.ports, DRM_MODE_CONNECTOR_DisplayPort,
 				data.port_count, 1);
@@ -585,7 +585,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 
 	igt_describe("HDMI tests");
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			chamelium_require_connector_present(
 				data.ports, DRM_MODE_CONNECTOR_HDMIA,
 				data.port_count, 1);
@@ -633,7 +633,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 
 	igt_describe("VGA tests");
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			chamelium_require_connector_present(
 				data.ports, DRM_MODE_CONNECTOR_VGA,
 				data.port_count, 1);
@@ -649,7 +649,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
diff --git a/tests/chamelium/kms_chamelium_frames.c b/tests/chamelium/kms_chamelium_frames.c
index b9a8eb46d9ee..e16a2eb58f07 100644
--- a/tests/chamelium/kms_chamelium_frames.c
+++ b/tests/chamelium/kms_chamelium_frames.c
@@ -990,13 +990,13 @@ igt_main
 	struct chamelium_port *port;
 	int p;
 
-	igt_fixture {
+	igt_fixture() {
 		chamelium_init_test(&data);
 	}
 
 	igt_describe("DisplayPort tests");
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			chamelium_require_connector_present(
 				data.ports, DRM_MODE_CONNECTOR_DisplayPort,
 				data.port_count, 1);
@@ -1024,7 +1024,7 @@ igt_main
 
 	igt_describe("HDMI tests");
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			chamelium_require_connector_present(
 				data.ports, DRM_MODE_CONNECTOR_HDMIA,
 				data.port_count, 1);
@@ -1137,7 +1137,7 @@ igt_main
 
 	igt_describe("VGA tests");
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			chamelium_require_connector_present(
 				data.ports, DRM_MODE_CONNECTOR_VGA,
 				data.port_count, 1);
@@ -1149,7 +1149,7 @@ igt_main
 					       CHAMELIUM_CHECK_ANALOG, 1);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_chamelium_hpd.c
index 161f494e9579..f475e0ed8f14 100644
--- a/tests/chamelium/kms_chamelium_hpd.c
+++ b/tests/chamelium/kms_chamelium_hpd.c
@@ -466,13 +466,13 @@ igt_main
 	struct chamelium_port *port;
 	int p;
 
-	igt_fixture {
+	igt_fixture() {
 		chamelium_init_test(&data);
 	}
 
 	igt_describe("DisplayPort tests");
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			chamelium_require_connector_present(
 				data.ports, DRM_MODE_CONNECTOR_DisplayPort,
 				data.port_count, 1);
@@ -524,7 +524,7 @@ igt_main
 
 	igt_describe("HDMI tests");
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			chamelium_require_connector_present(
 				data.ports, DRM_MODE_CONNECTOR_HDMIA,
 				data.port_count, 1);
@@ -576,7 +576,7 @@ igt_main
 
 	igt_describe("VGA tests");
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			chamelium_require_connector_present(
 				data.ports, DRM_MODE_CONNECTOR_VGA,
 				data.port_count, 1);
@@ -617,7 +617,7 @@ igt_main
 
 	igt_describe("Tests that operate on all connectors");
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			igt_require(data.port_count);
 		}
 
@@ -637,7 +637,7 @@ igt_main
 	connector_subtest("vga-hpd-for-each-pipe", VGA)
 		test_hotplug_for_each_pipe(&data, port);
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
diff --git a/tests/chamelium/kms_chamelium_sharpness_filter.c b/tests/chamelium/kms_chamelium_sharpness_filter.c
index fa397415dcc4..b11c4a21f5a7 100644
--- a/tests/chamelium/kms_chamelium_sharpness_filter.c
+++ b/tests/chamelium/kms_chamelium_sharpness_filter.c
@@ -245,7 +245,7 @@ igt_main
 {
 	data_t data = {};
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_XE);
 
 		igt_display_require(&data.display, data.drm_fd);
@@ -289,7 +289,7 @@ igt_main
 
 	run_sharpness_filter_test(&data);
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
diff --git a/tests/core_auth.c b/tests/core_auth.c
index 3c00d7925800..ef9cd2c1c3d5 100644
--- a/tests/core_auth.c
+++ b/tests/core_auth.c
@@ -244,7 +244,7 @@ igt_main
 	igt_subtest_group {
 		igt_fd_t(master);
 
-		igt_fixture
+		igt_fixture()
 			master = drm_open_driver_master(DRIVER_ANY);
 	
 		igt_describe("Test magic numbers for master and slave.");
diff --git a/tests/core_debugfs.c b/tests/core_debugfs.c
index 8ce305c407aa..cf2e128f3927 100644
--- a/tests/core_debugfs.c
+++ b/tests/core_debugfs.c
@@ -28,7 +28,7 @@ igt_main
 	int debugfs = -1;
 	int fd = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver_master(DRIVER_ANY);
 		debugfs = igt_debugfs_dir(fd);
 		igt_require(debugfs >= 0);
@@ -41,7 +41,7 @@ igt_main
 		igt_dir_process_files_simple(debugfs);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		close(debugfs);
 		drm_close_driver(fd);
 	}
diff --git a/tests/core_getclient.c b/tests/core_getclient.c
index 594c86a6f314..7d34265908ea 100644
--- a/tests/core_getclient.c
+++ b/tests/core_getclient.c
@@ -52,7 +52,7 @@ igt_main
 	int fd, ret;
 	drm_client_t client;
 
-	igt_fixture
+	igt_fixture()
 		fd = drm_open_driver(DRIVER_ANY);
 
 	igt_describe("Check GET_CLIENT ioctl of the first drm device.");
@@ -75,6 +75,6 @@ igt_main
 		igt_assert(ret == -1 && errno == EINVAL);
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/core_getstats.c b/tests/core_getstats.c
index 06fbbf0cf21c..f1bb134772d3 100644
--- a/tests/core_getstats.c
+++ b/tests/core_getstats.c
@@ -60,7 +60,7 @@ igt_main
 	int fd, ret;
 	drm_stats_t stats;
 
-	igt_fixture
+	igt_fixture()
 		fd = drm_open_driver(DRIVER_ANY);
 
 	igt_describe("Check DRM_IOCTL_GET_STATS ioctl of the first drm device.");
@@ -69,6 +69,6 @@ igt_main
 		igt_assert(ret == 0);
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/core_getversion.c b/tests/core_getversion.c
index 158133da742c..6ce53fe01c4d 100644
--- a/tests/core_getversion.c
+++ b/tests/core_getversion.c
@@ -86,7 +86,7 @@ igt_main
 	char info[256];
 	int fd;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = __drm_open_driver(DRIVER_ANY);
 		igt_assert_fd(fd);
 	}
@@ -101,6 +101,6 @@ igt_main
 	igt_subtest("all-cards")
 		check_all_drm();
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 18e9dfc346f7..fe8cefd1769c 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -683,7 +683,7 @@ igt_main
 		.chipset	= DRIVER_ANY,
 	};
 
-	igt_fixture {
+	igt_fixture() {
 		int fd_drm;
 		char driver[32] = {};
 
@@ -720,11 +720,11 @@ igt_main
 		igt_subtest("unbind-rebind")
 			unbind_rebind(&priv);
 
-		igt_fixture
+		igt_fixture()
 			recover(&priv);
 	}
 
-	igt_fixture
+	igt_fixture()
 		post_healthcheck(&priv);
 
 	igt_subtest_group {
@@ -732,11 +732,11 @@ igt_main
 		igt_subtest("unplug-rescan")
 			unplug_rescan(&priv);
 
-		igt_fixture
+		igt_fixture()
 			recover(&priv);
 	}
 
-	igt_fixture
+	igt_fixture()
 		post_healthcheck(&priv);
 
 	igt_subtest_group {
@@ -744,11 +744,11 @@ igt_main
 		igt_subtest("hotunbind-rebind")
 			hotunbind_rebind(&priv);
 
-		igt_fixture
+		igt_fixture()
 			recover(&priv);
 	}
 
-	igt_fixture
+	igt_fixture()
 		post_healthcheck(&priv);
 
 	igt_subtest_group {
@@ -756,11 +756,11 @@ igt_main
 		igt_subtest("hotunplug-rescan")
 			hotunplug_rescan(&priv);
 
-		igt_fixture
+		igt_fixture()
 			recover(&priv);
 	}
 
-	igt_fixture
+	igt_fixture()
 		post_healthcheck(&priv);
 
 	igt_subtest_group {
@@ -768,11 +768,11 @@ igt_main
 		igt_subtest("hotrebind")
 			hotrebind(&priv);
 
-		igt_fixture
+		igt_fixture()
 			recover(&priv);
 	}
 
-	igt_fixture
+	igt_fixture()
 		post_healthcheck(&priv);
 
 	igt_subtest_group {
@@ -780,11 +780,11 @@ igt_main
 		igt_subtest("hotreplug")
 			hotreplug(&priv);
 
-		igt_fixture
+		igt_fixture()
 			recover(&priv);
 	}
 
-	igt_fixture
+	igt_fixture()
 		post_healthcheck(&priv);
 
 	igt_subtest_group {
@@ -792,11 +792,11 @@ igt_main
 		igt_subtest("hotrebind-lateclose")
 			hotrebind_lateclose(&priv);
 
-		igt_fixture
+		igt_fixture()
 			recover(&priv);
 	}
 
-	igt_fixture
+	igt_fixture()
 		post_healthcheck(&priv);
 
 	igt_subtest_group {
@@ -804,11 +804,11 @@ igt_main
 		igt_subtest("hotreplug-lateclose")
 			hotreplug_lateclose(&priv);
 
-		igt_fixture
+		igt_fixture()
 			recover(&priv);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		post_healthcheck(&priv);
 
 		igt_ignore_warn(close(priv.fd.sysfs_bus));
diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
index fe9993515ea4..a929b7f5187f 100644
--- a/tests/core_setmaster.c
+++ b/tests/core_setmaster.c
@@ -135,7 +135,7 @@ static void tweak_perm(uint8_t *saved_perm, char *path, bool save)
 
 igt_main
 {
-	igt_fixture {
+	igt_fixture() {
 		/*
 		 * We're operating on the device files themselves
 		 * before opening them, make sure the drivers are
@@ -166,7 +166,7 @@ igt_main
 		/* Note: we use a fixture to ensure the permissions are
 		 * restored on skip or failure.
 		 */
-		igt_fixture {
+		igt_fixture() {
 			char path[255];
 			int len;
 			int fd;
@@ -202,7 +202,7 @@ igt_main
 		}
 
 		/* Restore the original permissions */
-		igt_fixture {
+		igt_fixture() {
 			tweak_perm(&saved_perm, buf, false);
 		}
 	}
diff --git a/tests/core_sysfs.c b/tests/core_sysfs.c
index c43008981891..7416d35cf06a 100644
--- a/tests/core_sysfs.c
+++ b/tests/core_sysfs.c
@@ -29,7 +29,7 @@ igt_main
 	int fd = -1;
 	int sysfs = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver_master(DRIVER_ANY);
 		sysfs = igt_sysfs_open(fd);
 		igt_require(sysfs >= 0);
@@ -41,7 +41,7 @@ igt_main
 	igt_subtest("read-all-entries")
 		igt_dir_process_files_simple(sysfs);
 
-	igt_fixture {
+	igt_fixture() {
 		close(sysfs);
 		drm_close_driver(fd);
 	}
diff --git a/tests/device_reset.c b/tests/device_reset.c
index 6c93a96c2176..2c25ed79afc0 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -443,7 +443,7 @@ igt_main
 {
 	struct device_fds dev = { .fds = {-1, -1, -1}, .dev_bus_addr = {0}, };
 
-	igt_fixture {
+	igt_fixture() {
 		char dev_path[PATH_MAX];
 
 		igt_debug("opening device\n");
@@ -496,7 +496,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		cleanup_device_fds(&dev);
 	}
 }
diff --git a/tests/dmabuf_sync_file.c b/tests/dmabuf_sync_file.c
index ca9d7d579ac7..cce8bdbb9ce5 100644
--- a/tests/dmabuf_sync_file.c
+++ b/tests/dmabuf_sync_file.c
@@ -358,7 +358,7 @@ igt_main
 {
 	int fd;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_VGEM);
 	}
 
@@ -399,6 +399,6 @@ igt_main
 	igt_subtest("import-multiple-read-write")
 		test_import_multiple(fd, true);
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/drm_read.c b/tests/drm_read.c
index 0a9b61cd082b..3e3103fdf61a 100644
--- a/tests/drm_read.c
+++ b/tests/drm_read.c
@@ -277,7 +277,7 @@ igt_main
 	enum pipe pipe;
 	igt_fd_t(fd);
 
-	igt_fixture {
+	igt_fixture() {
 		struct sigaction alarm_action = {};
 		igt_output_t *output;
 
diff --git a/tests/drm_virtgpu.c b/tests/drm_virtgpu.c
index 6ff9f6e5d17a..2a89bd0ec3d8 100644
--- a/tests/drm_virtgpu.c
+++ b/tests/drm_virtgpu.c
@@ -159,7 +159,7 @@ static void create_resource_if_needed(void)
 igt_main {
 	void *caps_buf = NULL;
 
-	igt_fixture {
+	igt_fixture() {
 		drm_fd = open_virtgpu_device();
 		igt_require(drm_fd >= 0);
 
@@ -424,7 +424,7 @@ igt_main {
 			     "No GETPARAM query returned a value.");
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		free(caps_buf);
 		close(drm_fd);
 	}
diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
index dd237467d3f6..a8f30d88734b 100644
--- a/tests/dumb_buffer.c
+++ b/tests/dumb_buffer.c
@@ -393,7 +393,7 @@ igt_main
 {
 	int fd = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_ANY);
 	}
 
@@ -415,7 +415,7 @@ igt_main
 	igt_subtest("create-clear")
 		always_clear(fd, 30);
 
-	igt_fixture {
+	igt_fixture() {
 		drm_close_driver(fd);
 	}
 }
diff --git a/tests/fbdev.c b/tests/fbdev.c
index fca688407070..cd478add5411 100644
--- a/tests/fbdev.c
+++ b/tests/fbdev.c
@@ -116,7 +116,7 @@ static void mode_tests(int fd)
 	struct fb_var_screeninfo var_info;
 	struct fb_fix_screeninfo fix_info;
 
-	igt_fixture {
+	igt_fixture() {
 		igt_require(ioctl(fd, FBIOGET_VSCREENINFO, &var_info) == 0);
 		igt_require(ioctl(fd, FBIOGET_FSCREENINFO, &fix_info) == 0);
 	}
@@ -233,7 +233,7 @@ static void mode_tests(int fd)
 		pan_var.vmode &= ~FB_VMODE_YWRAP;
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		/* restore original panning offsets */
 		ioctl(fd, FBIOPAN_DISPLAY, &var_info);
 	}
@@ -247,7 +247,7 @@ static void framebuffer_tests(int fd)
 	unsigned char * volatile buf;
 	volatile size_t pagesize;
 
-	igt_fixture {
+	igt_fixture() {
 		long ret;
 
 		igt_require(ioctl(fd, FBIOGET_FSCREENINFO, &fix_info) == 0);
@@ -444,7 +444,7 @@ static void framebuffer_tests(int fd)
 			     ret);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		free(buf);
 		/* don't leave garbage on the screen */
 		memset(map, 0, fix_info.smem_len);
@@ -460,7 +460,7 @@ igt_main
 	 * Should this test focus on the fbdev independent of any drm driver,
 	 * or should it look for fbdev of a particular device?
 	 */
-	igt_fixture {
+	igt_fixture() {
 		fd = open("/dev/fb0", O_RDWR);
 		if (fd < 0) {
 			drm_load_module(DRIVER_ANY);
@@ -479,7 +479,7 @@ igt_main
 		framebuffer_tests(fd);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		close(fd);
 	}
 }
diff --git a/tests/intel/api_intel_allocator.c b/tests/intel/api_intel_allocator.c
index 461459122271..e2ac8bf7a0e0 100644
--- a/tests/intel/api_intel_allocator.c
+++ b/tests/intel/api_intel_allocator.c
@@ -815,7 +815,7 @@ igt_main
 	int fd;
 	struct allocators *a;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL | DRIVER_XE);
 		atomic_init(&next_handle, 1);
 		srandom(0xdeadbeef);
@@ -900,6 +900,6 @@ igt_main
 		gem_pool(fd);
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/intel/api_intel_bb.c b/tests/intel/api_intel_bb.c
index 21ed6fc0903f..735ca8194547 100644
--- a/tests/intel/api_intel_bb.c
+++ b/tests/intel/api_intel_bb.c
@@ -1594,7 +1594,7 @@ igt_main_args("dpibc:", NULL, help_str, opt_handler, NULL)
 		{ I915_TILING_Y, "y" },
 	};
 
-	igt_fixture {
+	igt_fixture() {
 		i915 = drm_open_driver(DRIVER_INTEL);
 		bops = buf_ops_create(i915);
 		gen = intel_gen(intel_get_drm_devid(i915));
@@ -1717,7 +1717,7 @@ igt_main_args("dpibc:", NULL, help_str, opt_handler, NULL)
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		buf_ops_destroy(bops);
 		drm_close_driver(i915);
 	}
diff --git a/tests/intel/gem_bad_reloc.c b/tests/intel/gem_bad_reloc.c
index 1cdb988d9a92..94b1e8ee5827 100644
--- a/tests/intel/gem_bad_reloc.c
+++ b/tests/intel/gem_bad_reloc.c
@@ -210,7 +210,7 @@ igt_main
 {
 	int fd = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
 		/* Check if relocations supported by platform */
@@ -232,6 +232,6 @@ igt_main
 	igt_subtest("negative-reloc-bltcopy")
 		negative_reloc_blt(fd);
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/intel/gem_barrier_race.c b/tests/intel/gem_barrier_race.c
index ac60f66592d7..bdf6a9ef833a 100644
--- a/tests/intel/gem_barrier_race.c
+++ b/tests/intel/gem_barrier_race.c
@@ -147,7 +147,7 @@ igt_main
 {
 	int fd;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver_render(DRIVER_INTEL);
 		igt_require_gem(fd);
 	}
@@ -169,6 +169,6 @@ igt_main
 		}
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/intel/gem_basic.c b/tests/intel/gem_basic.c
index e4e49415d107..06281a739bfc 100644
--- a/tests/intel/gem_basic.c
+++ b/tests/intel/gem_basic.c
@@ -110,7 +110,7 @@ igt_main
 	igt_fd_t(fd);
 	int gpu_count;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 		gpu_count = igt_device_filter_count();
 	}
diff --git a/tests/intel/gem_blits.c b/tests/intel/gem_blits.c
index b2af48ef1163..47fd4a3206f6 100644
--- a/tests/intel/gem_blits.c
+++ b/tests/intel/gem_blits.c
@@ -824,7 +824,7 @@ igt_main
 {
 	struct device device;
 
-	igt_fixture {
+	igt_fixture() {
 		device.fd = drm_open_driver_render(DRIVER_INTEL);
 		igt_require_gem(device.fd);
 		gem_require_blitter(device.fd);
@@ -900,7 +900,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		put_ahnd(device.ahnd);
 		drm_close_driver(device.fd);
 	}
diff --git a/tests/intel/gem_busy.c b/tests/intel/gem_busy.c
index 02eaeb864bf3..ffeba1d44a1a 100644
--- a/tests/intel/gem_busy.c
+++ b/tests/intel/gem_busy.c
@@ -475,14 +475,14 @@ igt_main
 	const intel_ctx_t *ctx;
 	int fd = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver_master(DRIVER_INTEL);
 		igt_require_gem(fd);
 		ctx = intel_ctx_create_all_physical(fd);
 	}
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			intel_allocator_multiprocess_start();
 			igt_fork_hang_detector(fd);
 		}
@@ -507,7 +507,7 @@ igt_main
 		igt_subtest("close-race")
 			close_race(fd, ctx);
 
-		igt_fixture {
+		igt_fixture() {
 			igt_stop_hang_detector();
 			intel_allocator_multiprocess_stop();
 		}
@@ -515,12 +515,12 @@ igt_main
 
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			igt_fork_hang_detector(fd);
 		}
 
 		igt_subtest_group {
-			igt_fixture {
+			igt_fixture() {
 				igt_require(has_extended_busy_ioctl(fd));
 				gem_require_mmap_device_coherent(fd);
 			}
@@ -544,7 +544,7 @@ igt_main
 		}
 
 		igt_subtest_group {
-			igt_fixture {
+			igt_fixture() {
 				igt_require(has_extended_busy_ioctl(fd));
 				igt_require(has_semaphores(fd));
 			}
@@ -559,7 +559,7 @@ igt_main
 			}
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			igt_stop_hang_detector();
 		}
 	}
@@ -567,7 +567,7 @@ igt_main
 	igt_subtest_group {
 		igt_hang_t hang;
 
-		igt_fixture {
+		igt_fixture() {
 			hang = igt_allow_hang(fd, ctx->id, 0);
 		}
 
@@ -580,7 +580,7 @@ igt_main
 		}
 
 		igt_subtest_group {
-			igt_fixture {
+			igt_fixture() {
 				igt_require(has_extended_busy_ioctl(fd));
 				gem_require_mmap_device_coherent(fd);
 			}
@@ -595,12 +595,12 @@ igt_main
 			}
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			igt_disallow_hang(fd, hang);
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		intel_ctx_destroy(fd, ctx);
 		drm_close_driver(fd);
 	}
diff --git a/tests/intel/gem_caching.c b/tests/intel/gem_caching.c
index 11ce9c79658a..a9d07c6a3498 100644
--- a/tests/intel/gem_caching.c
+++ b/tests/intel/gem_caching.c
@@ -165,7 +165,7 @@ igt_main
 	uint8_t *cpu_ptr;
 	uint8_t *gtt_ptr;
 
-	igt_fixture {
+	igt_fixture() {
 		srandom(0xdeadbeef);
 
 		data.fd = drm_open_driver(DRIVER_INTEL);
@@ -352,7 +352,7 @@ igt_main
 		intel_bb_destroy(ibb);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		intel_buf_destroy(scratch_buf);
 		intel_buf_destroy(staging_buf);
 		buf_ops_destroy(data.bops);
diff --git a/tests/intel/gem_ccs.c b/tests/intel/gem_ccs.c
index a84a47cc46c4..ca7f94385444 100644
--- a/tests/intel/gem_ccs.c
+++ b/tests/intel/gem_ccs.c
@@ -774,7 +774,7 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 	int i915;
 	igt_hang_t hang;
 
-	igt_fixture {
+	igt_fixture() {
 		i915 = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(i915);
 		igt_require(blt_has_block_copy(i915));
@@ -853,7 +853,7 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 		block_copy_test(i915, &config, ctx, set, BLOCK_COPY);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_disallow_hang(i915, hang);
 		drm_close_driver(i915);
 	}
diff --git a/tests/intel/gem_close.c b/tests/intel/gem_close.c
index 3971cc75efe1..e3667ef34171 100644
--- a/tests/intel/gem_close.c
+++ b/tests/intel/gem_close.c
@@ -141,7 +141,7 @@ igt_main
 {
 	igt_fd_t(fd);
 
-	igt_fixture {
+	igt_fixture() {
 		/* Create an flink requires DRM_AUTH */
 		fd = drm_open_driver_master(DRIVER_INTEL);
 		igt_require_gem(fd);
diff --git a/tests/intel/gem_close_race.c b/tests/intel/gem_close_race.c
index c68e2fa738d0..6e32617e06d1 100644
--- a/tests/intel/gem_close_race.c
+++ b/tests/intel/gem_close_race.c
@@ -340,7 +340,7 @@ igt_main
 {
 	int gpu_count;
 
-	igt_fixture {
+	igt_fixture() {
 		int fd;
 
 		fd = drm_open_driver(DRIVER_INTEL);
@@ -422,6 +422,6 @@ igt_main
 	igt_subtest("gem-close-race")
 		threads(150, 0);
 
-	igt_fixture
+	igt_fixture()
 	    igt_stop_hang_detector();
 }
diff --git a/tests/intel/gem_compute.c b/tests/intel/gem_compute.c
index b8e7dec59c1b..219a4db2fc83 100644
--- a/tests/intel/gem_compute.c
+++ b/tests/intel/gem_compute.c
@@ -35,12 +35,12 @@ igt_main
 {
 	int i915;
 
-	igt_fixture
+	igt_fixture()
 		i915 = drm_open_driver(DRIVER_INTEL);
 
 	igt_subtest("compute-square")
 		test_compute_square(i915);
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(i915);
 }
diff --git a/tests/intel/gem_concurrent_all.c b/tests/intel/gem_concurrent_all.c
index 69ae7db1b19b..ede34f698d7d 100644
--- a/tests/intel/gem_concurrent_all.c
+++ b/tests/intel/gem_concurrent_all.c
@@ -1564,7 +1564,7 @@ run_mode(const char *prefix,
 	}, *h;
 	struct buffers buffers;
 
-	igt_fixture
+	igt_fixture()
 		buffers_init(&buffers, prefix, create, mode,
 			     size, num_buffers, fd);
 
@@ -1573,12 +1573,12 @@ run_mode(const char *prefix,
 			continue;
 
 		if (!*h->suffix)
-			igt_fixture
+			igt_fixture()
 				igt_fork_hang_detector(fd);
 
 		for (p = all ? pipelines : pskip; p->prefix; p++) {
 			igt_subtest_group  {
-				igt_fixture p->require();
+				igt_fixture() p->require();
 
 				igt_subtest_f("%s-%s-%s-sanitycheck0%s%s", prefix, mode->name, p->prefix, suffix, h->suffix) {
 					buffers_create(&buffers);
@@ -1707,11 +1707,11 @@ run_mode(const char *prefix,
 		}
 
 		if (!*h->suffix)
-			igt_fixture
+			igt_fixture()
 				igt_stop_hang_detector();
 	}
 
-	igt_fixture
+	igt_fixture()
 		buffers_fini(&buffers);
 }
 
@@ -1736,7 +1736,7 @@ run_modes(const char *style,
 
 	while (mode->name) {
 		igt_subtest_group {
-			igt_fixture {
+			igt_fixture() {
 				if (mode->require)
 					mode->require(create, num);
 			}
@@ -1897,7 +1897,7 @@ igt_main
 	if (strstr(igt_test_name(), "all"))
 		all = true;
 
-	igt_fixture {
+	igt_fixture() {
 		igt_allow_unlimited_files();
 
 		fd = drm_open_driver(DRIVER_INTEL);
@@ -1921,7 +1921,7 @@ igt_main
 			snprintf(name, sizeof(name), "%s%s-%s",
 				 c->name, s->name, "tiny");
 			igt_subtest_group {
-				igt_fixture {
+				igt_fixture() {
 					count = num_buffers(0, s, c, CHECK_RAM);
 				}
 				run_modes(name, c, modes, s, count);
@@ -1931,7 +1931,7 @@ igt_main
 			snprintf(name, sizeof(name), "%s%s-%s",
 				 c->name, s->name, "small");
 			igt_subtest_group {
-				igt_fixture {
+				igt_fixture() {
 					count = num_buffers(gem_mappable_aperture_size(fd)/4,
 							    s, c, CHECK_RAM);
 				}
@@ -1942,7 +1942,7 @@ igt_main
 			snprintf(name, sizeof(name), "%s%s-%s",
 				 c->name, s->name, "thrash");
 			igt_subtest_group {
-				igt_fixture {
+				igt_fixture() {
 					count = num_buffers(gem_mappable_aperture_size(fd),
 							    s, c, CHECK_RAM);
 				}
@@ -1953,7 +1953,7 @@ igt_main
 			snprintf(name, sizeof(name), "%s%s-%s",
 				 c->name, s->name, "global");
 			igt_subtest_group {
-				igt_fixture {
+				igt_fixture() {
 					count = num_buffers(gem_global_aperture_size(fd),
 							    s, c, CHECK_RAM);
 				}
@@ -1964,7 +1964,7 @@ igt_main
 			snprintf(name, sizeof(name), "%s%s-%s",
 				 c->name, s->name, "full");
 			igt_subtest_group {
-				igt_fixture {
+				igt_fixture() {
 					count = num_buffers(gem_aperture_size(fd),
 							    s, c, CHECK_RAM);
 				}
@@ -1974,7 +1974,7 @@ igt_main
 			snprintf(name, sizeof(name), "%s%s-%s",
 				 c->name, s->name, "shrink");
 			igt_subtest_group {
-				igt_fixture {
+				igt_fixture() {
 					count = num_buffers(gem_mappable_aperture_size(fd),
 							    s, c, CHECK_RAM);
 
@@ -1982,7 +1982,7 @@ igt_main
 				}
 				run_modes(name, c, modes, s, count);
 
-				igt_fixture
+				igt_fixture()
 					igt_stop_shrink_helper();
 			}
 
@@ -1990,7 +1990,7 @@ igt_main
 			snprintf(name, sizeof(name), "%s%s-%s",
 				 c->name, s->name, "swap");
 			igt_subtest_group {
-				igt_fixture {
+				igt_fixture() {
 					if (igt_get_avail_ram_mb() > gem_mappable_aperture_size(fd)/(1024*1024)) {
 						pin_sz = igt_get_avail_ram_mb() - gem_mappable_aperture_size(fd)/(1024*1024);
 
@@ -2021,7 +2021,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		drm_close_driver(fd);
 		drm_close_driver(vgem_drv);
 	}
diff --git a/tests/intel/gem_create.c b/tests/intel/gem_create.c
index f0749d288dcf..7d80b2707382 100644
--- a/tests/intel/gem_create.c
+++ b/tests/intel/gem_create.c
@@ -950,7 +950,7 @@ igt_main
 {
 	igt_fd_t(fd);
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 	}
 
@@ -985,7 +985,7 @@ igt_main
 
 	igt_describe("Create buffer objects while GPU is busy.");
 	igt_subtest_group {
-		igt_fixture
+		igt_fixture()
 			igt_fork_hang_detector(fd);
 
 		igt_subtest_with_dynamic("busy-create") {
@@ -1002,7 +1002,7 @@ igt_main
 			}
 		}
 
-		igt_fixture
+		igt_fixture()
 			igt_stop_hang_detector();
 	}
 
diff --git a/tests/intel/gem_cs_tlb.c b/tests/intel/gem_cs_tlb.c
index a72bbe8479b7..ed9acf004c64 100644
--- a/tests/intel/gem_cs_tlb.c
+++ b/tests/intel/gem_cs_tlb.c
@@ -160,7 +160,7 @@ igt_main
 	const intel_ctx_t *ctx;
 	int fd = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
 		ctx = intel_ctx_create_all_physical(fd);
@@ -173,6 +173,6 @@ igt_main
 		}
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/intel/gem_ctx_bad_destroy.c b/tests/intel/gem_ctx_bad_destroy.c
index 1467f2943a1c..3d1e909daa70 100644
--- a/tests/intel/gem_ctx_bad_destroy.c
+++ b/tests/intel/gem_ctx_bad_destroy.c
@@ -60,7 +60,7 @@ int fd;
 
 igt_main
 {
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver_render(DRIVER_INTEL);
 
 		gem_require_contexts(fd);
@@ -97,6 +97,6 @@ igt_main
 		gem_context_destroy(fd, ctx_id);
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/intel/gem_ctx_create.c b/tests/intel/gem_ctx_create.c
index 5c2b0ef65651..3070dd9ac316 100644
--- a/tests/intel/gem_ctx_create.c
+++ b/tests/intel/gem_ctx_create.c
@@ -622,7 +622,7 @@ igt_main
 	intel_ctx_cfg_t cfg;
 	int fd = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
 		gem_require_contexts(fd);
@@ -721,7 +721,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_stop_hang_detector();
 		drm_close_driver(fd);
 	}
diff --git a/tests/intel/gem_ctx_engines.c b/tests/intel/gem_ctx_engines.c
index 24240df66062..5c2bf93abe0a 100644
--- a/tests/intel/gem_ctx_engines.c
+++ b/tests/intel/gem_ctx_engines.c
@@ -614,7 +614,7 @@ igt_main
 	const struct intel_execution_engine2 *e;
 	igt_fd_t(i915);
 
-	igt_fixture {
+	igt_fixture() {
 		i915 = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(i915);
 
@@ -654,6 +654,6 @@ igt_main
 			independent_all(i915, ctx);
 	}
 
-	igt_fixture
+	igt_fixture()
 		igt_stop_hang_detector();
 }
diff --git a/tests/intel/gem_ctx_exec.c b/tests/intel/gem_ctx_exec.c
index a45a7e378870..f5fa2938eed1 100644
--- a/tests/intel/gem_ctx_exec.c
+++ b/tests/intel/gem_ctx_exec.c
@@ -493,7 +493,7 @@ igt_main
 	uint32_t ctx_id;
 	int fd;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver_render(DRIVER_INTEL);
 		igt_require_gem(fd);
 
@@ -541,14 +541,14 @@ igt_main
 	igt_describe("Race the execution and interrupt handlers along a context,"
 	             " while closing it at a random time.");
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			intel_allocator_multiprocess_start();
 		}
 
 		igt_subtest("basic-close-race")
 			close_race(fd);
 
-		igt_fixture {
+		igt_fixture() {
 			intel_allocator_multiprocess_stop();
 		}
 	}
@@ -585,6 +585,6 @@ igt_main
 		put_ahnd(ahnd);
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/intel/gem_ctx_freq.c b/tests/intel/gem_ctx_freq.c
index 6b510aca1b1d..8b8205e2acd3 100644
--- a/tests/intel/gem_ctx_freq.c
+++ b/tests/intel/gem_ctx_freq.c
@@ -262,7 +262,7 @@ static void disable_boost(void)
 
 igt_main
 {
-	igt_fixture {
+	igt_fixture() {
 		i915 = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(i915);
 
@@ -281,7 +281,7 @@ igt_main
 				sysfs_range(dirfd, gt);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		close(sysfs);
 		drm_close_driver(i915);
 	}
diff --git a/tests/intel/gem_ctx_isolation.c b/tests/intel/gem_ctx_isolation.c
index f406462d8b4e..73e773f301ff 100644
--- a/tests/intel/gem_ctx_isolation.c
+++ b/tests/intel/gem_ctx_isolation.c
@@ -1011,7 +1011,7 @@ igt_main
 	intel_ctx_cfg_t cfg;
 	igt_fd_t(i915);
 
-	igt_fixture {
+	igt_fixture() {
 		int gen;
 
 		i915 = drm_open_driver(DRIVER_INTEL);
@@ -1029,7 +1029,7 @@ igt_main
 		igt_skip_on(gen > LAST_KNOWN_GEN);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_fork_hang_detector(i915);
 	}
 
@@ -1073,7 +1073,7 @@ igt_main
 			preservation(i915, &cfg, e, S4);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_stop_hang_detector();
 	}
 
diff --git a/tests/intel/gem_ctx_param.c b/tests/intel/gem_ctx_param.c
index 2e39a519bfcc..0edf3a357906 100644
--- a/tests/intel/gem_ctx_param.c
+++ b/tests/intel/gem_ctx_param.c
@@ -380,7 +380,7 @@ igt_main
 
 	memset(&arg, 0, sizeof(arg));
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver_render(DRIVER_INTEL);
 
 		gem_require_contexts(fd);
@@ -483,7 +483,7 @@ igt_main
 
 	igt_describe("Test performed with context param set to priority");
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			igt_require(gem_scheduler_has_ctx_priority(fd));
 		}
 
@@ -549,6 +549,6 @@ igt_main
 	igt_subtest("invalid-get-engines")
 		test_get_invalid_param(fd, I915_CONTEXT_PARAM_ENGINES);
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/intel/gem_ctx_persistence.c b/tests/intel/gem_ctx_persistence.c
index d90b78267dc9..cbf5ff142a63 100644
--- a/tests/intel/gem_ctx_persistence.c
+++ b/tests/intel/gem_ctx_persistence.c
@@ -1351,7 +1351,7 @@ igt_main
 	};
 	const intel_ctx_t *ctx;
 
-	igt_fixture {
+	igt_fixture() {
 		i915 = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(i915);
 
@@ -1401,7 +1401,7 @@ igt_main
 		test_noheartbeat_close(i915, IGT_SPIN_NO_PREEMPTION);
 
 	igt_subtest_group {
-		igt_fixture
+		igt_fixture()
 			gem_require_contexts(i915);
 
 		for (test = tests; test->name; test++) {
@@ -1423,7 +1423,7 @@ igt_main
 	igt_subtest_group {
 		const struct intel_execution_engine2 *e;
 
-		igt_fixture
+		igt_fixture()
 			gem_require_contexts(i915);
 
 		for (test = tests; test->name; test++) {
@@ -1457,7 +1457,7 @@ igt_main
 	}
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			gem_require_contexts(i915);
 			intel_allocator_multiprocess_start();
 		}
@@ -1465,13 +1465,13 @@ igt_main
 		igt_subtest("smoketest")
 			smoketest(i915, &ctx->cfg);
 
-		igt_fixture {
+		igt_fixture() {
 			intel_allocator_multiprocess_stop();
 		}
 
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		drm_close_driver(i915);
 	}
 }
diff --git a/tests/intel/gem_ctx_shared.c b/tests/intel/gem_ctx_shared.c
index 4b9d604f6732..0c1d687c7a9a 100644
--- a/tests/intel/gem_ctx_shared.c
+++ b/tests/intel/gem_ctx_shared.c
@@ -1029,14 +1029,14 @@ igt_main
 	intel_ctx_cfg_t cfg;
 	igt_fd_t(i915);
 
-	igt_fixture {
+	igt_fixture() {
 		i915 = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(i915);
 		cfg = intel_ctx_cfg_all_physical(i915);
 	}
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			igt_require(gem_has_vm(i915));
 			igt_fork_hang_detector(i915);
 		}
@@ -1072,7 +1072,7 @@ igt_main
 		 * and so rely on gem_exec_schedule to prove the rest.
 		 */
 		igt_subtest_group {
-			igt_fixture {
+			igt_fixture() {
 				igt_require(gem_scheduler_enabled(i915));
 				igt_require(gem_scheduler_has_ctx_priority(i915));
 				igt_require(gem_has_vm(i915));
@@ -1101,7 +1101,7 @@ igt_main
 		}
 
 		igt_subtest_group {
-			igt_fixture {
+			igt_fixture() {
 				igt_require(gem_scheduler_enabled(i915));
 				igt_require(gem_scheduler_has_ctx_priority(i915));
 				igt_require(gem_has_vm(i915));
@@ -1117,7 +1117,7 @@ igt_main
 			igt_subtest("Q-smoketest-all")
 				smoketest(i915, &cfg, -1, 30);
 
-			igt_fixture {
+			igt_fixture() {
 				intel_allocator_multiprocess_stop();
 			}
 		}
@@ -1129,7 +1129,7 @@ igt_main
 		igt_subtest("exhaust-shared-gtt-lrc")
 			exhaust_shared_gtt(i915, EXHAUST_LRC);
 
-		igt_fixture {
+		igt_fixture() {
 			igt_stop_hang_detector();
 		}
 	}
diff --git a/tests/intel/gem_ctx_sseu.c b/tests/intel/gem_ctx_sseu.c
index 7d445ba00740..11bbf5764455 100644
--- a/tests/intel/gem_ctx_sseu.c
+++ b/tests/intel/gem_ctx_sseu.c
@@ -518,7 +518,7 @@ igt_main
 {
 	int fd;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
 
@@ -529,7 +529,7 @@ igt_main
 	}
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			drm_i915_getparam_t gp;
 
 			gp.param = I915_PARAM_SLICE_MASK;
@@ -561,7 +561,7 @@ igt_main
 			test_engines(fd);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		drm_close_driver(fd);
 	}
 }
diff --git a/tests/intel/gem_ctx_switch.c b/tests/intel/gem_ctx_switch.c
index 7a3c72e492c4..1880a3ce2a0d 100644
--- a/tests/intel/gem_ctx_switch.c
+++ b/tests/intel/gem_ctx_switch.c
@@ -707,7 +707,7 @@ igt_main
 	uint32_t light = 0, heavy;
 	int fd = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		const uint32_t bbe = MI_BATCH_BUFFER_END;
 
 		fd = drm_open_driver(DRIVER_INTEL);
@@ -738,7 +738,7 @@ igt_main
 
 		for (typeof(*phases) *p = phases; p->name; p++) {
 			igt_subtest_group {
-				igt_fixture {
+				igt_fixture() {
 					gem_require_ring(fd, e2->flags);
 					if (p->require)
 						igt_require(p->require(fd));
@@ -767,7 +767,7 @@ igt_main
 	for_each_ctx_cfg_engine(fd, &engines_cfg, e2) {
 		for (typeof(*phases) *p = phases; p->name; p++) {
 			igt_subtest_group {
-				igt_fixture {
+				igt_fixture() {
 					if (p->require)
 						igt_require(p->require(fd));
 				}
@@ -795,7 +795,7 @@ igt_main
 		all(fd, heavy, &engines_cfg, 0, 2);
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			gem_require_vm(fd);
 		}
 		igt_subtest("queue-light")
@@ -804,7 +804,7 @@ igt_main
 			all(fd, heavy, &engines_cfg, QUEUE, 2);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_stop_hang_detector();
 		gem_close(fd, heavy);
 		gem_close(fd, light);
diff --git a/tests/intel/gem_eio.c b/tests/intel/gem_eio.c
index 16dbb57a04a4..844562a0e861 100644
--- a/tests/intel/gem_eio.c
+++ b/tests/intel/gem_eio.c
@@ -1104,7 +1104,7 @@ exit_handler(int sig)
 
 igt_main
 {
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_device_drop_master(fd);
 
@@ -1153,7 +1153,7 @@ igt_main
 		test_inflight_suspend(fd);
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			igt_require(gem_has_contexts(fd));
 		}
 
@@ -1198,7 +1198,7 @@ igt_main
 			.drm_fd = -1, .n_pipes = IGT_MAX_PIPES
 		};
 
-		igt_fixture {
+		igt_fixture() {
 			igt_device_set_master(fd);
 
 			igt_display_require(&display, fd);
@@ -1209,11 +1209,11 @@ igt_main
 		igt_subtest("kms")
 			test_kms(fd, &display);
 
-		igt_fixture {
+		igt_fixture() {
 			intel_allocator_multiprocess_stop();
 		}
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/intel/gem_evict_alignment.c b/tests/intel/gem_evict_alignment.c
index 57aa5df04831..3f68a79e8a70 100644
--- a/tests/intel/gem_evict_alignment.c
+++ b/tests/intel/gem_evict_alignment.c
@@ -214,7 +214,7 @@ igt_main
 	uint64_t size, count;
 	int fd = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
 		gem_require_blitter(fd);
@@ -240,7 +240,7 @@ igt_main
 		major_evictions(fd, size, count);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_stop_hang_detector();
 	}
 
@@ -283,7 +283,7 @@ igt_main
 	}
 	igt_stop_signal_helper();
 
-	igt_fixture {
+	igt_fixture() {
 		igt_stop_hang_helper();
 		drm_close_driver(fd);
 	}
diff --git a/tests/intel/gem_evict_everything.c b/tests/intel/gem_evict_everything.c
index 53e359de7014..cf36cca15dc6 100644
--- a/tests/intel/gem_evict_everything.c
+++ b/tests/intel/gem_evict_everything.c
@@ -249,7 +249,7 @@ igt_main
 	size = count = 0;
 	fd = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
 		gem_require_blitter(fd);
@@ -293,7 +293,7 @@ igt_main
 		test_major_evictions(fd, size, count);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		size = 1024 * 1024;
 		count = gem_aperture_size(fd);
 		if (count >> 32)
@@ -321,7 +321,7 @@ igt_main
 		test_major_evictions(fd, size, count);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_stop_hang_detector();
 		igt_fork_hang_helper();
 
@@ -352,7 +352,7 @@ igt_main
 
 	igt_stop_signal_helper();
 
-	igt_fixture {
+	igt_fixture() {
 		igt_stop_hang_helper();
 		drm_close_driver(fd);
 	}
diff --git a/tests/intel/gem_exec_alignment.c b/tests/intel/gem_exec_alignment.c
index 6a9905d959c9..d70a325f215e 100644
--- a/tests/intel/gem_exec_alignment.c
+++ b/tests/intel/gem_exec_alignment.c
@@ -552,7 +552,7 @@ igt_main
 {
 	igt_fd_t(fd);
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
 		igt_require(gem_allows_obj_alignment(fd));
diff --git a/tests/intel/gem_exec_async.c b/tests/intel/gem_exec_async.c
index 6d739307cfe6..4b5c03553a7d 100644
--- a/tests/intel/gem_exec_async.c
+++ b/tests/intel/gem_exec_async.c
@@ -195,7 +195,7 @@ igt_main
 	const intel_ctx_t *ctx;
 	int fd = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver_master(DRIVER_INTEL);
 		igt_require_gem(fd);
 		gem_require_mmap_device_coherent(fd);
@@ -210,19 +210,19 @@ igt_main
 		one(fd, ctx, e->flags, 0);
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			intel_allocator_multiprocess_start();
 		}
 
 		test_each_engine("forked-writes", fd, ctx, e)
 			one(fd, ctx, e->flags, FORKED);
 
-		igt_fixture {
+		igt_fixture() {
 			intel_allocator_multiprocess_stop();
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_stop_hang_detector();
 		intel_ctx_destroy(fd, ctx);
 		drm_close_driver(fd);
diff --git a/tests/intel/gem_exec_await.c b/tests/intel/gem_exec_await.c
index 5dc43a0c421f..e7c78196e499 100644
--- a/tests/intel/gem_exec_await.c
+++ b/tests/intel/gem_exec_await.c
@@ -257,7 +257,7 @@ igt_main
 	int ring_size = 0;
 	igt_fd_t(device);
 
-	igt_fixture {
+	igt_fixture() {
 
 		device = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(device);
@@ -280,7 +280,7 @@ igt_main
 		wide(device, &cfg, ring_size, TIMEOUT, CONTEXTS);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_stop_hang_detector();
 	}
 }
diff --git a/tests/intel/gem_exec_balancer.c b/tests/intel/gem_exec_balancer.c
index 46ea19a2a216..57f30f73aa68 100644
--- a/tests/intel/gem_exec_balancer.c
+++ b/tests/intel/gem_exec_balancer.c
@@ -3413,7 +3413,7 @@ igt_main
 {
 	igt_fd_t(i915);
 
-	igt_fixture {
+	igt_fixture() {
 		i915 = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(i915);
 
@@ -3484,7 +3484,7 @@ igt_main
 		bonded_semaphore(i915);
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			intel_allocator_multiprocess_start();
 		}
 
@@ -3500,17 +3500,17 @@ igt_main
 		igt_subtest("bonded-sync")
 			bonded_runner(i915, __bonded_sync);
 
-		igt_fixture {
+		igt_fixture() {
 			intel_allocator_multiprocess_stop();
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_stop_hang_detector();
 	}
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			igt_require(has_logical_mapping(i915));
 			igt_require(has_parallel_execbuf(i915));
 		}
@@ -3549,7 +3549,7 @@ igt_main
 	igt_subtest_group {
 		igt_hang_t  hang;
 
-		igt_fixture
+		igt_fixture()
 			hang = igt_allow_hang(i915, 0, 0);
 
 		igt_subtest("bonded-false-hang")
@@ -3558,7 +3558,7 @@ igt_main
 		igt_subtest("bonded-true-hang")
 			bonded_nohang(i915, 0);
 
-		igt_fixture
+		igt_fixture()
 			igt_disallow_hang(i915, hang);
 
 		igt_subtest("hang")
@@ -3566,7 +3566,7 @@ igt_main
 	}
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			igt_require_gem(i915); /* reset parameters */
 			igt_require(has_persistence(i915));
 		}
diff --git a/tests/intel/gem_exec_basic.c b/tests/intel/gem_exec_basic.c
index ca56bf4b5563..d4dbed2c5099 100644
--- a/tests/intel/gem_exec_basic.c
+++ b/tests/intel/gem_exec_basic.c
@@ -62,7 +62,7 @@ igt_main
 	const intel_ctx_t *ctx;
 	int fd = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 		ctx = intel_ctx_create_all_physical(fd);
 
@@ -107,7 +107,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		free(query_info);
 		igt_collection_destroy(set);
 		igt_stop_hang_detector();
diff --git a/tests/intel/gem_exec_big.c b/tests/intel/gem_exec_big.c
index cdefce5dbf07..9ae1f26dd71b 100644
--- a/tests/intel/gem_exec_big.c
+++ b/tests/intel/gem_exec_big.c
@@ -322,7 +322,7 @@ igt_main
 {
 	int i915 = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		i915 = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(i915);
 
@@ -336,6 +336,6 @@ igt_main
 	igt_subtest("exhaustive")
 		exhaustive(i915);
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(i915);
 }
diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/gem_exec_capture.c
index 37c1f7255046..6966975b33f3 100644
--- a/tests/intel/gem_exec_capture.c
+++ b/tests/intel/gem_exec_capture.c
@@ -967,7 +967,7 @@ igt_main
 	char *sub_name;
 	uint32_t region;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 
 		if (gem_store_dword_needs_secure(fd))
@@ -1060,7 +1060,7 @@ igt_main
 		igt_dynamic_f("%s", (e)->name)
 			prioinv(fd, dir, ctx, e);
 
-	igt_fixture {
+	igt_fixture() {
 		close(dir);
 		igt_disallow_hang(fd, hang);
 		intel_ctx_destroy(fd, ctx);
diff --git a/tests/intel/gem_exec_create.c b/tests/intel/gem_exec_create.c
index fb096a181aa0..29768cf2bdc9 100644
--- a/tests/intel/gem_exec_create.c
+++ b/tests/intel/gem_exec_create.c
@@ -184,7 +184,7 @@ igt_main
 	uint32_t region;
 	int device = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		device = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(device);
 
@@ -251,7 +251,7 @@ igt_main
 			free(sub_name);
 		}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_stop_hang_detector();
 		drm_close_driver(device);
 	}
diff --git a/tests/intel/gem_exec_endless.c b/tests/intel/gem_exec_endless.c
index e7647e22e7d1..fb70a9cc87f1 100644
--- a/tests/intel/gem_exec_endless.c
+++ b/tests/intel/gem_exec_endless.c
@@ -348,7 +348,7 @@ igt_main
 
 	igt_skip_on_simulation();
 
-	igt_fixture {
+	igt_fixture() {
 		i915 = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(i915);
 	}
@@ -357,7 +357,7 @@ igt_main
 		struct intel_mmio_data mmio;
 		int sysfs;
 
-		igt_fixture {
+		igt_fixture() {
 			igt_require(gem_scheduler_enabled(i915));
 			igt_require(gem_scheduler_has_preemption(i915));
 
@@ -372,7 +372,7 @@ igt_main
 		test_each_engine("dispatch", i915, e)
 				endless_dispatch(i915, e);
 
-		igt_fixture {
+		igt_fixture() {
 			unpin_rps(sysfs);
 			close(sysfs);
 			intel_register_access_fini(&mmio);
diff --git a/tests/intel/gem_exec_fair.c b/tests/intel/gem_exec_fair.c
index 19df66921888..c566a2957860 100644
--- a/tests/intel/gem_exec_fair.c
+++ b/tests/intel/gem_exec_fair.c
@@ -1376,7 +1376,7 @@ igt_main
 	intel_ctx_cfg_t cfg;
 	int i915 = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		igt_require_sw_sync();
 
 		i915 = drm_open_driver_master(DRIVER_INTEL);
@@ -1449,7 +1449,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_stop_hang_detector();
 		drm_close_driver(i915);
 	}
diff --git a/tests/intel/gem_exec_fence.c b/tests/intel/gem_exec_fence.c
index c3c462b77dc4..62d090847698 100644
--- a/tests/intel/gem_exec_fence.c
+++ b/tests/intel/gem_exec_fence.c
@@ -3161,7 +3161,7 @@ igt_main
 	const intel_ctx_t *ctx;
 	int i915 = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		i915 = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(i915);
 		igt_require(gem_has_exec_fence(i915));
@@ -3174,7 +3174,7 @@ igt_main
 	igt_subtest_group {
 		igt_hang_t hang;
 
-		igt_fixture {
+		igt_fixture() {
 			igt_fork_hang_detector(i915);
 		}
 
@@ -3187,7 +3187,7 @@ igt_main
 		igt_subtest("basic-wait-all")
 			test_fence_busy_all(i915, ctx, WAIT);
 
-		igt_fixture {
+		igt_fixture() {
 			igt_stop_hang_detector();
 			hang = igt_allow_hang(i915, ctx->id, 0);
 		}
@@ -3202,19 +3202,19 @@ igt_main
 		igt_subtest("wait-hang-all")
 			test_fence_busy_all(i915, ctx, WAIT | HANG);
 
-		igt_fixture {
+		igt_fixture() {
 			igt_disallow_hang(i915, hang);
 		}
 	}
 
 	igt_subtest_group {
 		for_each_ctx_engine(i915, ctx, e) {
-			igt_fixture {
+			igt_fixture() {
 				igt_require(gem_class_can_store_dword(i915, e->class));
 			}
 		}
 		igt_subtest_group {
-			igt_fixture {
+			igt_fixture() {
 				igt_fork_hang_detector(i915);
 				intel_allocator_multiprocess_start();
 			}
@@ -3330,7 +3330,7 @@ igt_main
 				test_submit_chain(i915, ctx);
 			}
 
-			igt_fixture {
+			igt_fixture() {
 				intel_allocator_multiprocess_stop();
 				igt_stop_hang_detector();
 			}
@@ -3339,7 +3339,7 @@ igt_main
 		igt_subtest_group {
 			igt_hang_t hang;
 
-			igt_fixture {
+			igt_fixture() {
 				hang = igt_allow_hang(i915, ctx->id, 0);
 				intel_allocator_multiprocess_start();
 			}
@@ -3376,7 +3376,7 @@ igt_main
 						test_fence_await(i915, ctx, e, NONBLOCK | HANG);
 				}
 			}
-			igt_fixture {
+			igt_fixture() {
 				intel_allocator_multiprocess_stop();
 				igt_disallow_hang(i915, hang);
 			}
@@ -3386,7 +3386,7 @@ igt_main
 	igt_subtest_group {
 		long ring_size = 0;
 
-		igt_fixture {
+		igt_fixture() {
 			ring_size = gem_submission_measure(i915, &ctx->cfg,
 							   ALL_ENGINES);
 			igt_info("Ring size: %ld batches\n", ring_size);
@@ -3405,7 +3405,7 @@ igt_main
 	}
 
 	igt_subtest_group { /* syncobj */
-		igt_fixture {
+		igt_fixture() {
 			igt_require(exec_has_fence_array(i915));
 			igt_assert(has_syncobj(i915));
 			igt_fork_hang_detector(i915);
@@ -3456,14 +3456,14 @@ igt_main
 		igt_subtest("syncobj-channel")
 			test_syncobj_channel(i915);
 
-		igt_fixture {
+		igt_fixture() {
 			intel_allocator_multiprocess_stop();
 			igt_stop_hang_detector();
 		}
 	}
 
 	igt_subtest_group { /* syncobj timeline */
-		igt_fixture {
+		igt_fixture() {
 			igt_require(exec_has_timeline_fences(i915));
 			igt_require(has_syncobj_timeline(i915));
 			igt_fork_hang_detector(i915);
@@ -3506,7 +3506,7 @@ igt_main
 			test_syncobj_timeline_multiple_ext_nodes(i915);
 
 		igt_subtest_group { /* syncobj timeline engine chaining */
-			igt_fixture {
+			igt_fixture() {
 				/*
 				 * We need support for MI_ALU on all
 				 * engines which seems to be there
@@ -3528,12 +3528,12 @@ igt_main
 				test_syncobj_backward_timeline_chain_engines(i915, &ctx->cfg);
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			igt_stop_hang_detector();
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		drm_close_driver(i915);
 	}
 }
diff --git a/tests/intel/gem_exec_flush.c b/tests/intel/gem_exec_flush.c
index 027510424b06..d8fe78377994 100644
--- a/tests/intel/gem_exec_flush.c
+++ b/tests/intel/gem_exec_flush.c
@@ -2105,7 +2105,7 @@ igt_main
 	unsigned cpu = x86_64_features();
 	int fd = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		igt_require(igt_setup_clflush());
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
@@ -2127,7 +2127,7 @@ igt_main
 		unsigned ring = eb_ring(e);
 		unsigned timeout = 5 + 120*!!e->exec_id;
 
-		igt_fixture {
+		igt_fixture() {
 			gem_require_ring(fd, ring);
 			igt_require(gem_can_store_dword(fd, ring));
 		}
@@ -2208,7 +2208,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_stop_hang_detector();
 		drm_close_driver(fd);
 	}
diff --git a/tests/intel/gem_exec_gttfill.c b/tests/intel/gem_exec_gttfill.c
index 59a3679fec07..9fe3fefbb301 100644
--- a/tests/intel/gem_exec_gttfill.c
+++ b/tests/intel/gem_exec_gttfill.c
@@ -250,7 +250,7 @@ igt_main
 	const intel_ctx_t *ctx;
 	int i915 = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		i915 = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(i915);
 		ctx = intel_ctx_create_all_physical(i915);
@@ -279,7 +279,7 @@ igt_main
 	igt_subtest("all-engines")
 		fillgtt(i915, ctx, ALL_ENGINES, 20);
 
-	igt_fixture {
+	igt_fixture() {
 		igt_stop_hang_detector();
 		intel_ctx_destroy(i915, ctx);
 	}
@@ -300,7 +300,7 @@ igt_main
 		igt_waitchildren();
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		intel_allocator_multiprocess_stop();
 		drm_close_driver(i915);
 	}
diff --git a/tests/intel/gem_exec_latency.c b/tests/intel/gem_exec_latency.c
index a95c4890c85a..65937d109d7d 100644
--- a/tests/intel/gem_exec_latency.c
+++ b/tests/intel/gem_exec_latency.c
@@ -934,7 +934,7 @@ igt_main
 	const intel_ctx_t *ctx;
 	int device = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		device = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(device);
 		gem_require_mmap_wc(device);
@@ -957,7 +957,7 @@ igt_main
 	}
 
 	igt_subtest_group {
-		igt_fixture
+		igt_fixture()
 			igt_require(intel_gen(intel_get_drm_devid(device)) >= 7);
 
 		test_each_engine("rthog-submit", device, ctx, e)
@@ -987,7 +987,7 @@ igt_main
 			wakeup_latency(device, ctx, e);
 
 		igt_subtest_group {
-			igt_fixture {
+			igt_fixture() {
 				gem_require_contexts(device);
 				igt_require(gem_scheduler_has_preemption(device));
 			}
@@ -1001,7 +1001,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		intel_register_access_fini(&mmio_data);
 		intel_ctx_destroy(device, ctx);
 		drm_close_driver(device);
diff --git a/tests/intel/gem_exec_nop.c b/tests/intel/gem_exec_nop.c
index 74593c085dec..072be55f3c95 100644
--- a/tests/intel/gem_exec_nop.c
+++ b/tests/intel/gem_exec_nop.c
@@ -1007,7 +1007,7 @@ igt_main
 	uint32_t handle = 0;
 	int device = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		const uint32_t bbe = MI_BATCH_BUFFER_END;
 
 		device = drm_open_driver(DRIVER_INTEL);
@@ -1078,7 +1078,7 @@ igt_main
 		sequential(device, handle, ctx, FORKED | CONTEXT, 20);
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			gem_require_contexts(device);
 			igt_require(gem_scheduler_has_ctx_priority(device));
 			igt_require(gem_scheduler_has_preemption(device));
@@ -1092,7 +1092,7 @@ igt_main
 	}
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			igt_device_set_master(device);
 		}
 
@@ -1117,7 +1117,7 @@ igt_main
 
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_stop_hang_detector();
 		gem_close(device, handle);
 		intel_ctx_destroy(device, ctx);
diff --git a/tests/intel/gem_exec_parallel.c b/tests/intel/gem_exec_parallel.c
index 9817bcd0ff33..eaadc9387593 100644
--- a/tests/intel/gem_exec_parallel.c
+++ b/tests/intel/gem_exec_parallel.c
@@ -354,7 +354,7 @@ igt_main
 	const intel_ctx_t *ctx;
 	int fd;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver_master(DRIVER_INTEL);
 		igt_require_gem(fd);
 		ctx = intel_ctx_create_all_physical(fd);
@@ -381,7 +381,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_stop_hang_detector();
 		intel_ctx_destroy(fd, ctx);
 		drm_close_driver(fd);
diff --git a/tests/intel/gem_exec_params.c b/tests/intel/gem_exec_params.c
index 382d4f6dc39d..d7dd842c3b9b 100644
--- a/tests/intel/gem_exec_params.c
+++ b/tests/intel/gem_exec_params.c
@@ -451,7 +451,7 @@ int fd;
 
 igt_main
 {
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
 
@@ -720,7 +720,7 @@ igt_main
 
 #undef RUN_FAIL
 
-	igt_fixture {
+	igt_fixture() {
 		gem_close(fd, handle);
 
 		drm_close_driver(fd);
diff --git a/tests/intel/gem_exec_reloc.c b/tests/intel/gem_exec_reloc.c
index d9afbe23a337..1aed353b586b 100644
--- a/tests/intel/gem_exec_reloc.c
+++ b/tests/intel/gem_exec_reloc.c
@@ -1666,7 +1666,7 @@ igt_main
 	uint64_t size;
 	int fd = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver_master(DRIVER_INTEL);
 		igt_require_gem(fd);
 		/* Check if relocations supported by platform */
@@ -1678,7 +1678,7 @@ igt_main
 		igt_hang_t hang;
 
 		igt_subtest_group {
-			igt_fixture {
+			igt_fixture() {
 				if (f->flags & HANG)
 					hang = igt_allow_hang(fd, 0, 0);
 			}
@@ -1703,7 +1703,7 @@ igt_main
 				}
 			}
 
-			igt_fixture {
+			igt_fixture() {
 				if (f->flags & HANG)
 					igt_disallow_hang(fd, hang);
 			}
@@ -1758,7 +1758,7 @@ igt_main
 			.n_pipes = IGT_MAX_PIPES
 		};
 
-		igt_fixture {
+		igt_fixture() {
 			igt_device_set_master(fd);
 			kmstest_set_vt_graphics_mode();
 			igt_display_require(&display, fd);
@@ -1771,10 +1771,10 @@ igt_main
 			}
 		}
 
-		igt_fixture
+		igt_fixture()
 			igt_display_fini(&display);
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/intel/gem_exec_schedule.c b/tests/intel/gem_exec_schedule.c
index 2f3958723aaf..5a4665284104 100644
--- a/tests/intel/gem_exec_schedule.c
+++ b/tests/intel/gem_exec_schedule.c
@@ -3207,7 +3207,7 @@ igt_main
 	int fd = -1;
 	const intel_ctx_t *ctx = NULL;
 
-	igt_fixture {
+	igt_fixture() {
 		igt_require_sw_sync();
 
 		fd = drm_open_driver_master(DRIVER_INTEL);
@@ -3247,7 +3247,7 @@ igt_main
 	igt_subtest_group {
 		const struct intel_execution_engine2 *e;
 
-		igt_fixture {
+		igt_fixture() {
 			igt_require(gem_scheduler_enabled(fd));
 			igt_require(gem_scheduler_has_ctx_priority(fd));
 		}
@@ -3267,7 +3267,7 @@ igt_main
 			lateslice(fd, &ctx->cfg, e->flags, IGT_SPIN_USERPTR);
 
 		igt_subtest_group {
-			igt_fixture {
+			igt_fixture() {
 				igt_require(gem_scheduler_has_timeslicing(fd));
 				igt_require(intel_gen(intel_get_drm_devid(fd)) >= 8);
 			}
@@ -3278,7 +3278,7 @@ igt_main
 			test_each_engine("u-fairslice", fd, ctx, e)
 				fairslice(fd, &ctx->cfg, e, IGT_SPIN_USERPTR, 2);
 
-			igt_fixture {
+			igt_fixture() {
 				intel_allocator_multiprocess_start();
 			}
 			igt_subtest("fairslice-all")  {
@@ -3297,7 +3297,7 @@ igt_main
 				}
 				igt_waitchildren();
 			}
-			igt_fixture {
+			igt_fixture() {
 				intel_allocator_multiprocess_stop();
 			}
 		}
@@ -3346,7 +3346,7 @@ igt_main
 			promotion(fd, &ctx->cfg, e->flags);
 
 		igt_subtest_group {
-			igt_fixture {
+			igt_fixture() {
 				igt_require(gem_scheduler_has_preemption(fd));
 			}
 
@@ -3372,7 +3372,7 @@ igt_main
 				preempt_engines(fd, e, 0);
 
 			igt_subtest_group {
-				igt_fixture {
+				igt_fixture() {
 					igt_require(!gem_scheduler_has_static_priority(fd));
 				}
 
@@ -3391,7 +3391,7 @@ igt_main
 			igt_subtest_group {
 				igt_hang_t hang;
 
-				igt_fixture {
+				igt_fixture() {
 					igt_stop_hang_detector();
 					hang = igt_allow_hang(fd, ctx->id, 0);
 				}
@@ -3402,7 +3402,7 @@ igt_main
 				test_each_engine_store("preemptive-hang", fd, ctx, e)
 					preemptive_hang(fd, &ctx->cfg, e);
 
-				igt_fixture {
+				igt_fixture() {
 					igt_disallow_hang(fd, hang);
 					igt_fork_hang_detector(fd);
 				}
@@ -3432,7 +3432,7 @@ igt_main
 			smoketest(fd, &ctx->cfg, e->flags, 5);
 
 		igt_subtest_group {
-			igt_fixture {
+			igt_fixture() {
 				igt_require(!gem_scheduler_has_static_priority(fd));
 			}
 
@@ -3444,7 +3444,7 @@ igt_main
 	igt_subtest_group {
 		const struct intel_execution_engine2 *e;
 
-		igt_fixture {
+		igt_fixture() {
 			igt_require(gem_scheduler_enabled(fd));
 			igt_require(gem_scheduler_has_ctx_priority(fd));
 			igt_require(gem_scheduler_has_preemption(fd));
@@ -3467,7 +3467,7 @@ igt_main
 	}
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			igt_require(gem_scheduler_enabled(fd));
 			igt_require(gem_scheduler_has_semaphores(fd));
 		}
@@ -3476,7 +3476,7 @@ igt_main
 			measure_semaphore_power(fd, ctx);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_stop_hang_detector();
 		intel_ctx_destroy(fd, ctx);
 		drm_close_driver(fd);
diff --git a/tests/intel/gem_exec_store.c b/tests/intel/gem_exec_store.c
index d64cdeb6d435..64b293aa46f8 100644
--- a/tests/intel/gem_exec_store.c
+++ b/tests/intel/gem_exec_store.c
@@ -443,7 +443,7 @@ igt_main
 	const intel_ctx_t *ctx;
 	int fd;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 
 		print_welcome(fd);
@@ -474,7 +474,7 @@ igt_main
 	test_each_engine("pages", fd, ctx, e)
 		store_cachelines(fd, ctx, e, PAGES);
 
-	igt_fixture {
+	igt_fixture() {
 		igt_stop_hang_detector();
 		intel_ctx_destroy(fd, ctx);
 		drm_close_driver(fd);
diff --git a/tests/intel/gem_exec_suspend.c b/tests/intel/gem_exec_suspend.c
index 646c219588e4..03bc63fa1d9f 100644
--- a/tests/intel/gem_exec_suspend.c
+++ b/tests/intel/gem_exec_suspend.c
@@ -398,7 +398,7 @@ igt_main
 	struct drm_i915_query_memory_regions *query_info;
 	struct igt_collection *set, *regions;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver_master(DRIVER_INTEL);
 		igt_require_gem(fd);
 		igt_require(gem_can_store_dword(fd, 0));
@@ -462,7 +462,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_stop_hang_detector();
 		hang = igt_allow_hang(fd, 0, 0);
 	}
@@ -472,7 +472,7 @@ igt_main
 		subtest_for_each_combination(test->name, intel_ctx_0(fd), test->flags, test->fn);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		free(query_info);
 		igt_collection_destroy(set);
 		igt_disallow_hang(fd, hang);
diff --git a/tests/intel/gem_exec_whisper.c b/tests/intel/gem_exec_whisper.c
index 32f7ccb2d468..0200d50e8b03 100644
--- a/tests/intel/gem_exec_whisper.c
+++ b/tests/intel/gem_exec_whisper.c
@@ -717,7 +717,7 @@ igt_main
 	const intel_ctx_t *ctx;
 	int fd = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver_master(DRIVER_INTEL);
 		igt_require_gem(fd);
 		igt_require(gem_can_store_dword(fd, 0));
@@ -752,7 +752,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_stop_hang_detector();
 	}
 
@@ -765,7 +765,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		intel_allocator_multiprocess_stop();
 		intel_ctx_destroy(fd, ctx);
 		drm_close_driver(fd);
diff --git a/tests/intel/gem_exercise_blt.c b/tests/intel/gem_exercise_blt.c
index 72f3b6b347b3..11d5294c83bc 100644
--- a/tests/intel/gem_exercise_blt.c
+++ b/tests/intel/gem_exercise_blt.c
@@ -373,7 +373,7 @@ igt_main_args("b:pst:W:H:", NULL, help_str, opt_handler, NULL)
 	const intel_ctx_t *ctx;
 	int i915;
 
-	igt_fixture {
+	igt_fixture() {
 		i915 = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(i915);
 		igt_require(blt_has_fast_copy(i915));
@@ -399,7 +399,7 @@ igt_main_args("b:pst:W:H:", NULL, help_str, opt_handler, NULL)
 		fast_copy_test(i915, ctx, set, FAST_COPY_EMIT);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		drm_close_driver(i915);
 	}
 }
diff --git a/tests/intel/gem_fenced_exec_thrash.c b/tests/intel/gem_fenced_exec_thrash.c
index 19d49823a31e..8f8203c5bf4d 100644
--- a/tests/intel/gem_fenced_exec_thrash.c
+++ b/tests/intel/gem_fenced_exec_thrash.c
@@ -197,7 +197,7 @@ igt_main
 	unsigned int num_fences = 0;
 	int fd = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
 
@@ -219,6 +219,6 @@ igt_main
 	igt_subtest("too-many-fences")
 		run_test(fd, num_fences + 1, intel_gen(devid) >= 4 ? 0 : ENOBUFS, 0);
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/intel/gem_flink_basic.c b/tests/intel/gem_flink_basic.c
index 2fa3e925ccd0..34bc2a7f5c69 100644
--- a/tests/intel/gem_flink_basic.c
+++ b/tests/intel/gem_flink_basic.c
@@ -189,7 +189,7 @@ igt_main
 {
 	igt_fd_t(fd);
 
-	igt_fixture
+	igt_fixture()
 		fd = drm_open_driver(DRIVER_INTEL);
 
 	igt_describe("Check if gem object can be exported to global namespace"
diff --git a/tests/intel/gem_gpgpu_fill.c b/tests/intel/gem_gpgpu_fill.c
index 0e60a4991942..d37e778512e3 100644
--- a/tests/intel/gem_gpgpu_fill.c
+++ b/tests/intel/gem_gpgpu_fill.c
@@ -205,7 +205,7 @@ igt_main_args("dW:H:X:Y:", NULL, help_str, opt_handler, NULL)
 	struct drm_i915_query_memory_regions *region_info;
 	struct igt_collection *region_set;
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_render(DRIVER_INTEL);
 		data.devid = intel_get_drm_devid(data.drm_fd);
 		igt_require_gem(data.drm_fd);
@@ -251,7 +251,7 @@ igt_main_args("dW:H:X:Y:", NULL, help_str, opt_handler, NULL)
 			   surfheight / 2);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_collection_destroy(region_set);
 		free(region_info);
 		buf_ops_destroy(data.bops);
diff --git a/tests/intel/gem_huc_copy.c b/tests/intel/gem_huc_copy.c
index 8660a9f84a6c..d0f7793e883b 100644
--- a/tests/intel/gem_huc_copy.c
+++ b/tests/intel/gem_huc_copy.c
@@ -105,7 +105,7 @@ igt_main
 	igt_huc_copyfunc_t huc_copy;
 	uint64_t ahnd;
 
-	igt_fixture {
+	igt_fixture() {
 		drm_fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(drm_fd);
 		devid = intel_get_drm_devid(drm_fd);
@@ -151,7 +151,7 @@ igt_main
 		gem_close(drm_fd, obj[2].handle);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		put_ahnd(ahnd);
 		drm_close_driver(drm_fd);
 	}
diff --git a/tests/intel/gem_linear_blits.c b/tests/intel/gem_linear_blits.c
index b6c0b13ac776..c81866aec84d 100644
--- a/tests/intel/gem_linear_blits.c
+++ b/tests/intel/gem_linear_blits.c
@@ -276,7 +276,7 @@ igt_main
 	bool do_relocs;
 	igt_fd_t(fd);
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
 		gem_require_blitter(fd);
@@ -301,7 +301,7 @@ igt_main
 		run_test(fd, 2, do_relocs);
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			intel_allocator_multiprocess_start();
 		}
 
@@ -322,7 +322,7 @@ igt_main
 			igt_stop_signal_helper();
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			intel_allocator_multiprocess_stop();
 		}
 	}
diff --git a/tests/intel/gem_lmem_evict.c b/tests/intel/gem_lmem_evict.c
index dcdf30c1dd3d..ab66e3de7417 100644
--- a/tests/intel/gem_lmem_evict.c
+++ b/tests/intel/gem_lmem_evict.c
@@ -98,7 +98,7 @@ igt_main
 	struct drm_i915_query_memory_regions *regions;
 	int i915 = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		char *tmp;
 
 		if (igt_kmod_is_loaded("i915")) {
@@ -144,7 +144,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		drm_close_driver(i915);
 		igt_i915_driver_unload();
 	}
diff --git a/tests/intel/gem_lmem_swapping.c b/tests/intel/gem_lmem_swapping.c
index 6f494b534251..32aa0e2cd76e 100644
--- a/tests/intel/gem_lmem_swapping.c
+++ b/tests/intel/gem_lmem_swapping.c
@@ -807,7 +807,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	const intel_ctx_t *ctx;
 	int i915 = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		struct intel_execution_engine2 *e;
 		char *tmp;
 
@@ -864,7 +864,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	dynamic_lmem_subtest(region, regions, "smem-oom")
 		test_smem_oom(i915, ctx, region);
 
-	igt_fixture {
+	igt_fixture() {
 		intel_allocator_multiprocess_stop();
 		intel_ctx_destroy(i915, ctx);
 		free(regions);
diff --git a/tests/intel/gem_media_fill.c b/tests/intel/gem_media_fill.c
index 12e91ccbd8aa..0ccc5497ba79 100644
--- a/tests/intel/gem_media_fill.c
+++ b/tests/intel/gem_media_fill.c
@@ -147,7 +147,7 @@ igt_main
 	struct drm_i915_query_memory_regions *query_info;
 	struct igt_collection *set, *region_set;
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_render(DRIVER_INTEL);
 		igt_require_gem(data.drm_fd);
 
@@ -178,7 +178,7 @@ igt_main
 			free(sub_name);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_collection_destroy(set);
 		igt_stop_hang_detector();
 		drm_close_driver(data.drm_fd);
diff --git a/tests/intel/gem_mmap.c b/tests/intel/gem_mmap.c
index 829a1e4c1953..a4ef04ddb96e 100644
--- a/tests/intel/gem_mmap.c
+++ b/tests/intel/gem_mmap.c
@@ -209,7 +209,7 @@ igt_main
 	uint8_t buf[OBJECT_SIZE];
 	uint8_t *addr;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require(gem_has_legacy_mmap(fd));
 	}
@@ -365,6 +365,6 @@ igt_main
 	igt_subtest("swap-bo")
 		test_huge_bo(2);
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/intel/gem_mmap_gtt.c b/tests/intel/gem_mmap_gtt.c
index 3bf2e584542d..2cd02b281804 100644
--- a/tests/intel/gem_mmap_gtt.c
+++ b/tests/intel/gem_mmap_gtt.c
@@ -1594,7 +1594,7 @@ igt_main
 	if (igt_run_in_simulation())
 		OBJECT_SIZE = 1 * 1024 * 1024;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 
 		/*
@@ -1822,6 +1822,6 @@ igt_main
 	}
 
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/intel/gem_mmap_offset.c b/tests/intel/gem_mmap_offset.c
index 8ce10d61443a..f51c1703bcb2 100644
--- a/tests/intel/gem_mmap_offset.c
+++ b/tests/intel/gem_mmap_offset.c
@@ -1149,7 +1149,7 @@ igt_main
 {
 	int i915;
 
-	igt_fixture {
+	igt_fixture() {
 		i915 = drm_open_driver(DRIVER_INTEL);
 		igt_require(has_mmap_offset(i915));
 	}
@@ -1244,7 +1244,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		drm_close_driver(i915);
 	}
 }
diff --git a/tests/intel/gem_mmap_wc.c b/tests/intel/gem_mmap_wc.c
index 487027af9e96..3a6b12f56fe8 100644
--- a/tests/intel/gem_mmap_wc.c
+++ b/tests/intel/gem_mmap_wc.c
@@ -524,7 +524,7 @@ igt_main
 	if (igt_run_in_simulation())
 		OBJECT_SIZE = 1 * 1024 * 1024;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require(gem_has_legacy_mmap(fd));
 		gem_require_mmap_wc(fd);
@@ -638,7 +638,7 @@ igt_main
 		test_write_cpu_read_wc(fd, 0);
 
 	igt_subtest_group {
-		igt_fixture gem_require_mappable_ggtt(fd);
+		igt_fixture() gem_require_mappable_ggtt(fd);
 		igt_subtest("write-wc-read-gtt")
 			test_write_wc_read_gtt(fd);
 		igt_subtest("write-gtt-read-wc")
@@ -650,6 +650,6 @@ igt_main
 	igt_subtest("set-cache-level")
 		test_set_cache_level(fd);
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/intel/gem_partial_pwrite_pread.c b/tests/intel/gem_partial_pwrite_pread.c
index c983177663f0..a1912ea82a7b 100644
--- a/tests/intel/gem_partial_pwrite_pread.c
+++ b/tests/intel/gem_partial_pwrite_pread.c
@@ -344,7 +344,7 @@ static void test_partial_read_writes(data_t *data)
 
 static void do_tests(data_t *data, int cache_level, const char *suffix)
 {
-	igt_fixture {
+	igt_fixture() {
 		if (cache_level != -1)
 			gem_set_caching(data->drm_fd, scratch_buf->handle, cache_level);
 	}
@@ -370,7 +370,7 @@ igt_main
 	data_t data = {0, };
 	srandom(0xdeadbeef);
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(data.drm_fd);
 		gem_require_blitter(data.drm_fd);
@@ -391,7 +391,7 @@ igt_main
 	do_tests(&data, 1, "-snoop");
 	do_tests(&data, 2, "-display");
 
-	igt_fixture {
+	igt_fixture() {
 		intel_buf_destroy(scratch_buf);
 		intel_buf_destroy(staging_buf);
 		buf_ops_destroy(data.bops);
diff --git a/tests/intel/gem_pipe_control_store_loop.c b/tests/intel/gem_pipe_control_store_loop.c
index 27630b1883d6..9831eb67e57b 100644
--- a/tests/intel/gem_pipe_control_store_loop.c
+++ b/tests/intel/gem_pipe_control_store_loop.c
@@ -177,7 +177,7 @@ uint32_t devid;
 
 igt_main
 {
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
 		gem_require_blitter(fd);
@@ -197,7 +197,7 @@ igt_main
 	igt_subtest("reused-buffer")
 		store_pipe_control_loop(true, 2);
 
-	igt_fixture {
+	igt_fixture() {
 		buf_ops_destroy(bops);
 		drm_close_driver(fd);
 	}
diff --git a/tests/intel/gem_ppgtt.c b/tests/intel/gem_ppgtt.c
index 4ae9a5b73ec5..9c8c5e3dec97 100644
--- a/tests/intel/gem_ppgtt.c
+++ b/tests/intel/gem_ppgtt.c
@@ -412,7 +412,7 @@ igt_main
 {
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 
-	igt_fixture {
+	igt_fixture() {
 		int fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
 		gem_require_blitter(fd);
diff --git a/tests/intel/gem_pread.c b/tests/intel/gem_pread.c
index 70a38e75c39d..be83a8de8f59 100644
--- a/tests/intel/gem_pread.c
+++ b/tests/intel/gem_pread.c
@@ -317,7 +317,7 @@ igt_main_args("s:", NULL, help_str, opt_handler, NULL)
 		object_size = OBJECT_SIZE;
 	object_size = (object_size + 3) & -4;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 		gem_require_pread_pwrite(fd);
 
@@ -365,7 +365,7 @@ igt_main_args("s:", NULL, help_str, opt_handler, NULL)
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		free(src);
 		gem_close(fd, dst);
 
diff --git a/tests/intel/gem_pread_after_blit.c b/tests/intel/gem_pread_after_blit.c
index a793b53cd133..8b0ecfe317f8 100644
--- a/tests/intel/gem_pread_after_blit.c
+++ b/tests/intel/gem_pread_after_blit.c
@@ -245,7 +245,7 @@ igt_main
 	struct buf_ops *bops;
 	int fd;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
 		gem_require_pread_pwrite(fd);
@@ -274,7 +274,7 @@ igt_main
 			do_test(bops, t->cache, src, start, dst, 1, bcs_hang);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		intel_buf_destroy(src[0]);
 		intel_buf_destroy(src[1]);
 		intel_buf_destroy(dst[0]);
@@ -283,6 +283,6 @@ igt_main
 		buf_ops_destroy(bops);
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/intel/gem_pwrite.c b/tests/intel/gem_pwrite.c
index 05a47b7b14c9..eb573584f0a8 100644
--- a/tests/intel/gem_pwrite.c
+++ b/tests/intel/gem_pwrite.c
@@ -555,7 +555,7 @@ igt_main_args("s:", NULL, help_str, opt_handler, NULL)
 		object_size = OBJECT_SIZE;
 	object_size = (object_size + 3) & -4;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 		gem_require_pread_pwrite(fd);
 
@@ -603,7 +603,7 @@ igt_main_args("s:", NULL, help_str, opt_handler, NULL)
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		free(src);
 		gem_close(fd, dst);
 	}
@@ -640,6 +640,6 @@ igt_main_args("s:", NULL, help_str, opt_handler, NULL)
 		}
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/intel/gem_pxp.c b/tests/intel/gem_pxp.c
index c8d378875616..ecff502c1427 100644
--- a/tests/intel/gem_pxp.c
+++ b/tests/intel/gem_pxp.c
@@ -1308,7 +1308,7 @@ igt_main
 	uint32_t devid = 0;
 	igt_display_t display;
 
-	igt_fixture
+	igt_fixture()
 	{
 		i915 = drm_open_driver(DRIVER_INTEL);
 		igt_require(i915);
@@ -1436,7 +1436,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		if (pm.debugfsdir != -1)
 			close(pm.debugfsdir);
 
diff --git a/tests/intel/gem_read_read_speed.c b/tests/intel/gem_read_read_speed.c
index c6095f19ea3d..1570f990a157 100644
--- a/tests/intel/gem_read_read_speed.c
+++ b/tests/intel/gem_read_read_speed.c
@@ -248,7 +248,7 @@ igt_main
 	struct buf_ops *bops = NULL;
 	int fd, i;
 
-	igt_fixture {
+	igt_fixture() {
 		int devid;
 
 		fd = drm_open_driver(DRIVER_INTEL);
@@ -276,7 +276,7 @@ igt_main
 			run(bops, sizes[i], sizes[i], true, true);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		buf_ops_destroy(bops);
 		drm_close_driver(fd);
 	}
diff --git a/tests/intel/gem_readwrite.c b/tests/intel/gem_readwrite.c
index f3d0c4fbfa43..98f629af49aa 100644
--- a/tests/intel/gem_readwrite.c
+++ b/tests/intel/gem_readwrite.c
@@ -101,7 +101,7 @@ igt_main
 	uint8_t buf[OBJECT_SIZE];
 	int ret;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 		gem_require_pread_pwrite(fd);
 
@@ -160,6 +160,6 @@ igt_main
 		igt_assert(ret == -1 && errno == ENOENT);
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/intel/gem_reg_read.c b/tests/intel/gem_reg_read.c
index 5559c4d0a7ad..3d760313cb34 100644
--- a/tests/intel/gem_reg_read.c
+++ b/tests/intel/gem_reg_read.c
@@ -164,7 +164,7 @@ igt_main
 	uint64_t val = 0;
 	int fd = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 		is_x86_64 = check_kernel_x86_64();
 		has_proper_timestamp = check_timestamp(fd);
@@ -183,7 +183,7 @@ igt_main
 		test_timestamp_monotonic(fd);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		drm_close_driver(fd);
 	}
 }
diff --git a/tests/intel/gem_render_copy.c b/tests/intel/gem_render_copy.c
index 9df2ce1178e0..fd02df731dc8 100644
--- a/tests/intel/gem_render_copy.c
+++ b/tests/intel/gem_render_copy.c
@@ -857,7 +857,7 @@ igt_main_args("dac", NULL, help_str, opt_handler, NULL)
 
 	data_t data = {0, };
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_render(DRIVER_INTEL);
 		data.devid = intel_get_drm_devid(data.drm_fd);
 		igt_require_gem(data.drm_fd);
@@ -942,7 +942,7 @@ igt_main_args("dac", NULL, help_str, opt_handler, NULL)
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_stop_hang_detector();
 		buf_ops_destroy(data.bops);
 		igt_collection_destroy(set);
diff --git a/tests/intel/gem_render_copy_redux.c b/tests/intel/gem_render_copy_redux.c
index b9961fe64557..9acd7207f9e7 100644
--- a/tests/intel/gem_render_copy_redux.c
+++ b/tests/intel/gem_render_copy_redux.c
@@ -221,7 +221,7 @@ igt_main
 {
 	data_t data = {0, };
 
-	igt_fixture {
+	igt_fixture() {
 		data_init(&data);
 		igt_require_gem(data.fd);
 	}
@@ -254,7 +254,7 @@ igt_main
 		igt_stop_signal_helper();
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		data_fini(&data);
 	}
 }
diff --git a/tests/intel/gem_render_linear_blits.c b/tests/intel/gem_render_linear_blits.c
index 5de090d1a353..09ef22899bd8 100644
--- a/tests/intel/gem_render_linear_blits.c
+++ b/tests/intel/gem_render_linear_blits.c
@@ -183,7 +183,7 @@ igt_main
 	static int fd = 0;
 	int count=0;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
 	}
diff --git a/tests/intel/gem_render_tiled_blits.c b/tests/intel/gem_render_tiled_blits.c
index e33bd6890a67..64ac1ec2f151 100644
--- a/tests/intel/gem_render_tiled_blits.c
+++ b/tests/intel/gem_render_tiled_blits.c
@@ -234,7 +234,7 @@ igt_main
 	int fd = 0;
 	int count = 0;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
 		igt_require(gem_available_fences(fd) > 0);
diff --git a/tests/intel/gem_request_retire.c b/tests/intel/gem_request_retire.c
index 5ebfc1d3bc47..77e466c286c6 100644
--- a/tests/intel/gem_request_retire.c
+++ b/tests/intel/gem_request_retire.c
@@ -120,7 +120,7 @@ igt_main
 {
 	igt_fd_t(fd);
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
 		gem_require_blitter(fd);
diff --git a/tests/intel/gem_reset_stats.c b/tests/intel/gem_reset_stats.c
index 8c74ce28c743..712183cf65af 100644
--- a/tests/intel/gem_reset_stats.c
+++ b/tests/intel/gem_reset_stats.c
@@ -1084,7 +1084,7 @@ igt_main
 {
 	const struct intel_execution_ring *e;
 
-	igt_fixture {
+	igt_fixture() {
 		bool has_reset_stats;
 		bool using_full_reset;
 		char *tmp;
@@ -1160,7 +1160,7 @@ igt_main
 		const struct intel_execution_engine2 *e2;
 		intel_ctx_cfg_t cfg = {};
 
-		igt_fixture {
+		igt_fixture() {
 			gem_require_contexts(device);
 			cfg = intel_ctx_cfg_all_physical(device);
 
@@ -1174,11 +1174,11 @@ igt_main
 					test_shared_reset_domain(&cfg, e2);
 			}
 		}
-		igt_fixture {
+		igt_fixture() {
 			enable_hangcheck(device, true);
 		}
 	}
-	igt_fixture {
+	igt_fixture() {
 		igt_assert(igt_params_set(device, "reset", "%d", INT_MAX /* any reset method */));
 		drm_close_driver(device);
 	}
diff --git a/tests/intel/gem_ringfill.c b/tests/intel/gem_ringfill.c
index a8b9dc19cbc0..8a032d32c2f7 100644
--- a/tests/intel/gem_ringfill.c
+++ b/tests/intel/gem_ringfill.c
@@ -420,7 +420,7 @@ igt_main
 	const intel_ctx_t *ctx;
 	int fd = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		int gen;
 
 		fd = drm_open_driver(DRIVER_INTEL);
@@ -499,7 +499,7 @@ igt_main
 		igt_waitchildren();
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		intel_allocator_multiprocess_stop();
 		intel_ctx_destroy(fd, ctx);
 		drm_close_driver(fd);
diff --git a/tests/intel/gem_set_tiling_vs_blt.c b/tests/intel/gem_set_tiling_vs_blt.c
index f78196fff882..b110c76be0fc 100644
--- a/tests/intel/gem_set_tiling_vs_blt.c
+++ b/tests/intel/gem_set_tiling_vs_blt.c
@@ -240,7 +240,7 @@ igt_main
 	uint32_t tiling, tiling_after;
 	struct buf_ops *bops;
 
-	igt_fixture {
+	igt_fixture() {
 		for (i = 0; i < 1024*256; i++)
 			data[i] = i;
 
@@ -278,7 +278,7 @@ igt_main
 		igt_assert(tiling_after == I915_TILING_X);
 	}
 
-	igt_fixture{
+	igt_fixture(){
 		buf_ops_destroy(bops);
 		drm_close_driver(fd);
 	}
diff --git a/tests/intel/gem_shrink.c b/tests/intel/gem_shrink.c
index 53332afbd24f..0ade4f9b31f0 100644
--- a/tests/intel/gem_shrink.c
+++ b/tests/intel/gem_shrink.c
@@ -545,7 +545,7 @@ igt_main
 	uint64_t alloc_size = 0;
 	int num_processes = 0;
 
-	igt_fixture {
+	igt_fixture() {
 		const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 		uint64_t mem_size = igt_get_total_ram_mb();
 		int fd;
diff --git a/tests/intel/gem_softpin.c b/tests/intel/gem_softpin.c
index 98c751439bfc..7e772b927c32 100644
--- a/tests/intel/gem_softpin.c
+++ b/tests/intel/gem_softpin.c
@@ -1470,7 +1470,7 @@ igt_main
 	int fd = -1;
 	const intel_ctx_t *ctx;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver_master(DRIVER_INTEL);
 		igt_require_gem(fd);
 		gem_require_blitter(fd);
@@ -1487,7 +1487,7 @@ igt_main
 	igt_subtest_group {
 		/* Under full-ppgtt, we have complete control of the GTT */
 
-		igt_fixture {
+		igt_fixture() {
 			igt_require(gem_uses_full_ppgtt(fd));
 		}
 
@@ -1554,7 +1554,7 @@ igt_main
 	}
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			igt_require(gem_uses_full_ppgtt(fd));
 			intel_allocator_multiprocess_start();
 		}
@@ -1567,7 +1567,7 @@ igt_main
 		test_each_engine("allocator-evict", fd, ctx, e)
 			test_allocator_evict(fd, ctx, e->flags, 20);
 
-		igt_fixture {
+		igt_fixture() {
 			intel_allocator_multiprocess_stop();
 		}
 	}
@@ -1618,7 +1618,7 @@ igt_main
 	igt_subtest("evict-hang")
 		test_evict_hang(fd);
 
-	igt_fixture {
+	igt_fixture() {
 		intel_ctx_destroy(fd, ctx);
 		drm_close_driver(fd);
 	}
diff --git a/tests/intel/gem_spin_batch.c b/tests/intel/gem_spin_batch.c
index dee892411349..36e1d759ab24 100644
--- a/tests/intel/gem_spin_batch.c
+++ b/tests/intel/gem_spin_batch.c
@@ -248,7 +248,7 @@ igt_main
 	const intel_ctx_t *ctx;
 	int fd = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
 		ctx = intel_ctx_create_all_physical(fd);
@@ -303,7 +303,7 @@ igt_main
 #undef test_each_engine
 
 	igt_subtest_group {
-		igt_fixture
+		igt_fixture()
 			intel_allocator_multiprocess_start();
 
 		igt_subtest("spin-each")
@@ -314,11 +314,11 @@ igt_main
 			spin_on_all_engines(fd, ctx, IGT_SPIN_USERPTR, 3);
 		}
 
-		igt_fixture
+		igt_fixture()
 			intel_allocator_multiprocess_stop();
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_stop_hang_detector();
 		intel_ctx_destroy(fd, ctx);
 		drm_close_driver(fd);
diff --git a/tests/intel/gem_streaming_writes.c b/tests/intel/gem_streaming_writes.c
index ea8c6db23917..7e1b65cf1fd5 100644
--- a/tests/intel/gem_streaming_writes.c
+++ b/tests/intel/gem_streaming_writes.c
@@ -423,7 +423,7 @@ igt_main
 {
 	int fd, sync;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
 	}
@@ -450,6 +450,6 @@ igt_main
 	igt_subtest("batch-reverse-wc")
 		test_batch(fd, 2, 1);
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/intel/gem_sync.c b/tests/intel/gem_sync.c
index 0861f41d75b1..6a2644b1ebbb 100644
--- a/tests/intel/gem_sync.c
+++ b/tests/intel/gem_sync.c
@@ -1436,7 +1436,7 @@ igt_main
 	const intel_ctx_t *ctx;
 	int fd = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
 		gem_submission_print_method(fd);
@@ -1503,7 +1503,7 @@ igt_main
 	}
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			gem_require_contexts(fd);
 			igt_require(gem_scheduler_has_ctx_priority(fd));
 			igt_require(gem_scheduler_has_preemption(fd));
@@ -1525,7 +1525,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		intel_allocator_multiprocess_stop();
 		igt_stop_hang_detector();
 		intel_ctx_destroy(fd, ctx);
diff --git a/tests/intel/gem_tiled_blits.c b/tests/intel/gem_tiled_blits.c
index d8e80ca60efa..735ef4800e3e 100644
--- a/tests/intel/gem_tiled_blits.c
+++ b/tests/intel/gem_tiled_blits.c
@@ -191,7 +191,7 @@ igt_main
 	uint64_t count = 0;
 	int fd = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
 		gem_require_blitter(fd);
@@ -213,7 +213,7 @@ igt_main
 		run_test(fd, 2);
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			intel_allocator_multiprocess_start();
 		}
 
@@ -233,12 +233,12 @@ igt_main
 			igt_stop_signal_helper();
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			intel_allocator_multiprocess_stop();
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		drm_close_driver(fd);
 	}
 }
diff --git a/tests/intel/gem_tiled_fence_blits.c b/tests/intel/gem_tiled_fence_blits.c
index c11eb73e3701..5753f9ad8455 100644
--- a/tests/intel/gem_tiled_fence_blits.c
+++ b/tests/intel/gem_tiled_fence_blits.c
@@ -302,7 +302,7 @@ igt_main
 	uint64_t count = 0, end;
 	int fd;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
 		gem_require_blitter(fd);
@@ -326,7 +326,7 @@ igt_main
 		run_test(fd, 2, end);
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			intel_allocator_multiprocess_start();
 		}
 
@@ -337,11 +337,11 @@ igt_main
 			igt_waitchildren();
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			intel_allocator_multiprocess_stop();
 		}
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/intel/gem_tiled_partial_pwrite_pread.c b/tests/intel/gem_tiled_partial_pwrite_pread.c
index 7e5a2766017b..68fc64e3eea2 100644
--- a/tests/intel/gem_tiled_partial_pwrite_pread.c
+++ b/tests/intel/gem_tiled_partial_pwrite_pread.c
@@ -290,7 +290,7 @@ igt_main
 {
 	srandom(0xdeadbeef);
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
 		gem_require_mappable_ggtt(fd);
@@ -327,7 +327,7 @@ igt_main
 	igt_subtest("writes-after-reads")
 		test_partial_read_writes();
 
-	igt_fixture {
+	igt_fixture() {
 		intel_buf_destroy(scratch_buf);
 		intel_buf_destroy(staging_buf);
 		intel_buf_destroy(tiled_staging_buf);
diff --git a/tests/intel/gem_tiled_swapping.c b/tests/intel/gem_tiled_swapping.c
index 1a9de5d2f6b7..23be1b7232d9 100644
--- a/tests/intel/gem_tiled_swapping.c
+++ b/tests/intel/gem_tiled_swapping.c
@@ -182,7 +182,7 @@ igt_main
 	struct thread *threads;
 	int fd, num_threads;
 
-	igt_fixture {
+	igt_fixture() {
 		size_t lock_size;
 
 		current_tiling_mode = I915_TILING_X;
@@ -258,6 +258,6 @@ igt_main
 			thread_fini(&threads[n]);
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/intel/gem_userptr_blits.c b/tests/intel/gem_userptr_blits.c
index ff076dc649b5..83c9f8888348 100644
--- a/tests/intel/gem_userptr_blits.c
+++ b/tests/intel/gem_userptr_blits.c
@@ -2502,7 +2502,7 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
 	int size = sizeof(linear);
 	igt_fd_t(fd);
 
-	igt_fixture {
+	igt_fixture() {
 		unsigned int mmo_max = 0;
 
 		fd = drm_open_driver(DRIVER_INTEL);
@@ -2533,7 +2533,7 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
 	}
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			/* Either mode will do for parameter checking */
 			gem_userptr_test_synchronized();
 			if (!has_userptr(fd))
@@ -2580,7 +2580,7 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
 	igt_subtest_group {
 		gem_userptr_test_unsynchronized();
 
-		igt_fixture {
+		igt_fixture() {
 			igt_require(has_userptr(fd));
 		}
 
@@ -2644,7 +2644,7 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
 			test_major_evictions(fd, size, count);
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			size = sizeof(linear);
 			count = 2 * gem_aperture_size(fd) / (1024*1024) / 3;
 			if (count > total_ram * 3 / 4)
@@ -2674,7 +2674,7 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
 	igt_subtest_group {
 		gem_userptr_test_synchronized();
 
-		igt_fixture {
+		igt_fixture() {
 			igt_require(has_userptr(fd));
 			size = sizeof(linear);
 			count = 2 * gem_aperture_size(fd) / (1024*1024) / 3;
@@ -2770,7 +2770,7 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
 			test_major_evictions(fd, size, count);
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			size = 1024 * 1024;
 			count = 2 * gem_aperture_size(fd) / (1024*1024) / 3;
 			if (count > total_ram * 3 / 4)
@@ -2798,7 +2798,7 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
 	}
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			gem_userptr_test_synchronized();
 			if (!has_userptr(fd))
 				gem_userptr_test_unsynchronized();
diff --git a/tests/intel/gem_vm_create.c b/tests/intel/gem_vm_create.c
index 752babfa8a52..18b049cc0551 100644
--- a/tests/intel/gem_vm_create.c
+++ b/tests/intel/gem_vm_create.c
@@ -384,7 +384,7 @@ igt_main
 {
 	int i915 = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		i915 = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(i915);
 		igt_require(has_vm(i915));
@@ -397,7 +397,7 @@ igt_main
 		invalid_destroy(i915);
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			gem_context_require_param(i915, I915_CONTEXT_PARAM_VM);
 		}
 
@@ -411,7 +411,7 @@ igt_main
 			create_ext(i915);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		drm_close_driver(i915);
 	}
 }
diff --git a/tests/intel/gem_wait.c b/tests/intel/gem_wait.c
index 9265d1d7abab..a08fda9beefd 100644
--- a/tests/intel/gem_wait.c
+++ b/tests/intel/gem_wait.c
@@ -234,7 +234,7 @@ igt_main
 	const intel_ctx_t *ctx;
 	int fd = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver_master(DRIVER_INTEL);
 		igt_require_gem(fd);
 		ctx = intel_ctx_create_all_physical(fd);
@@ -261,7 +261,7 @@ igt_main
 			{ }
 		};
 
-		igt_fixture {
+		igt_fixture() {
 			igt_fork_hang_detector(fd);
 			igt_fork_signal_helper();
 		}
@@ -272,7 +272,7 @@ igt_main
 			test_all_engines(t->name, fd, ctx, t->flags);
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			igt_stop_signal_helper();
 			igt_stop_hang_detector();
 		}
@@ -291,7 +291,7 @@ igt_main
 		};
 		igt_hang_t hang;
 
-		igt_fixture {
+		igt_fixture() {
 			hang = igt_allow_hang(fd, ctx->id, 0);
 			igt_fork_signal_helper();
 		}
@@ -302,13 +302,13 @@ igt_main
 			test_all_engines(t->name, fd, ctx, t->flags);
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			igt_stop_signal_helper();
 			igt_disallow_hang(fd, hang);
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		intel_ctx_destroy(fd, ctx);
 		drm_close_driver(fd);
 	}
diff --git a/tests/intel/gem_watchdog.c b/tests/intel/gem_watchdog.c
index 1edde8b3c345..9b69f534399a 100644
--- a/tests/intel/gem_watchdog.c
+++ b/tests/intel/gem_watchdog.c
@@ -559,7 +559,7 @@ igt_main
 	const intel_ctx_t *ctx;
 	int i915 = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		const unsigned int timeout = 1;
 		char *tmp;
 
@@ -608,7 +608,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		intel_ctx_destroy(i915, ctx);
 		drm_close_driver(i915);
 	}
diff --git a/tests/intel/gem_workarounds.c b/tests/intel/gem_workarounds.c
index b810b125cd07..b639b061a786 100644
--- a/tests/intel/gem_workarounds.c
+++ b/tests/intel/gem_workarounds.c
@@ -300,7 +300,7 @@ igt_main
 	}, *m;
 	igt_fd_t(device);
 
-	igt_fixture {
+	igt_fixture() {
 		FILE *file;
 		char *line = NULL;
 		char *str;
@@ -352,7 +352,7 @@ igt_main
 		igt_subtest_group {
 			igt_hang_t hang = {};
 
-			igt_fixture {
+			igt_fixture() {
 				switch (op->op) {
 				case GPU_RESET:
 					hang = igt_allow_hang(device, 0, 0);
@@ -366,7 +366,7 @@ igt_main
 				igt_subtest_f("%s%s", op->name, m->name)
 					check_workarounds(device, op->op, m->flags);
 
-			igt_fixture {
+			igt_fixture() {
 				switch (op->op) {
 				case GPU_RESET:
 					igt_disallow_hang(device, hang);
diff --git a/tests/intel/gen7_exec_parse.c b/tests/intel/gen7_exec_parse.c
index 3a37604e52aa..8a25805f00d6 100644
--- a/tests/intel/gen7_exec_parse.c
+++ b/tests/intel/gen7_exec_parse.c
@@ -487,7 +487,7 @@ igt_main
 	uint32_t handle;
 	int fd;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
 
@@ -607,7 +607,7 @@ igt_main
 		};
 #undef REG
 
-		igt_fixture {
+		igt_fixture() {
 			intel_register_access_init(&mmio_data, igt_device_get_pci_device(fd), 0);
 		}
 
@@ -620,7 +620,7 @@ igt_main
 			}
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			intel_register_access_fini(&mmio_data);
 		}
 	}
@@ -747,7 +747,7 @@ igt_main
 	igt_subtest("load-register-reg")
 		hsw_load_register_reg();
 
-	igt_fixture {
+	igt_fixture() {
 		igt_stop_hang_detector();
 		gem_close(fd, handle);
 
diff --git a/tests/intel/gen9_exec_parse.c b/tests/intel/gen9_exec_parse.c
index dcce24835013..6fc76ae9317f 100644
--- a/tests/intel/gen9_exec_parse.c
+++ b/tests/intel/gen9_exec_parse.c
@@ -1211,7 +1211,7 @@ igt_main
 	uint32_t handle;
 	int i915;
 
-	igt_fixture {
+	igt_fixture() {
 		i915 = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(i915);
 		gem_require_blitter(i915);
@@ -1298,7 +1298,7 @@ igt_main
 	igt_subtest("shadow-peek")
 		test_shadow_peek(i915);
 
-	igt_fixture {
+	igt_fixture() {
 		igt_stop_hang_detector();
 		gem_close(i915, handle);
 
diff --git a/tests/intel/i915_drm_fdinfo.c b/tests/intel/i915_drm_fdinfo.c
index f5aadc9eb5de..902c0cb8e551 100644
--- a/tests/intel/i915_drm_fdinfo.c
+++ b/tests/intel/i915_drm_fdinfo.c
@@ -938,7 +938,7 @@ igt_main
 	const intel_ctx_t *ctx = NULL;
 	int i915 = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		struct drm_client_fdinfo info = { };
 		unsigned int i;
 
@@ -1095,17 +1095,17 @@ igt_main
 	igt_subtest_group {
 		int newfd;
 
-		igt_fixture
+		igt_fixture()
 			newfd = drm_reopen_driver(i915);
 
 		igt_subtest("context-close-stress")
 			stress_context_close(newfd);
 
-		igt_fixture
+		igt_fixture()
 			drm_close_driver(newfd);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		intel_ctx_destroy(i915, ctx);
 		drm_close_driver(i915);
 	}
diff --git a/tests/intel/i915_fb_tiling.c b/tests/intel/i915_fb_tiling.c
index 8d95416f72e5..508f8f3ff389 100644
--- a/tests/intel/i915_fb_tiling.c
+++ b/tests/intel/i915_fb_tiling.c
@@ -42,7 +42,7 @@ igt_main
 	int drm_fd;
 	struct igt_fb fb;
 
-	igt_fixture {
+	igt_fixture() {
 		drm_fd = drm_open_driver_master(DRIVER_INTEL);
 		igt_require(gem_available_fences(drm_fd) > 0);
 	}
@@ -64,6 +64,6 @@ igt_main
 		igt_assert_eq(ret2, -EBUSY);
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(drm_fd);
 }
diff --git a/tests/intel/i915_getparams_basic.c b/tests/intel/i915_getparams_basic.c
index cd0b528bcd94..e52fbab6cf19 100644
--- a/tests/intel/i915_getparams_basic.c
+++ b/tests/intel/i915_getparams_basic.c
@@ -164,7 +164,7 @@ exit_handler(int sig)
 
 igt_main
 {
-	igt_fixture {
+	igt_fixture() {
 		igt_install_exit_handler(exit_handler);
 		init();
 	}
diff --git a/tests/intel/i915_hangman.c b/tests/intel/i915_hangman.c
index a556eec5354f..78c96b0d906f 100644
--- a/tests/intel/i915_hangman.c
+++ b/tests/intel/i915_hangman.c
@@ -574,7 +574,7 @@ igt_main
 	struct gem_engine_properties saved_params[GEM_MAX_ENGINES];
 	int num_engines = 0;
 
-	igt_fixture {
+	igt_fixture() {
 		const struct intel_execution_engine2 *e;
 
 		device = drm_open_driver(DRIVER_INTEL);
@@ -619,7 +619,7 @@ igt_main
 
 	do_tests("GT", "gt", ctx);
 
-	igt_fixture {
+	igt_fixture() {
 		igt_disallow_hang(device, hang);
 
 		hang = igt_allow_hang(device, ctx->id, HANG_ALLOW_CAPTURE | HANG_WANT_ENGINE_RESET);
@@ -627,7 +627,7 @@ igt_main
 
 	do_tests("engine", "engine", ctx);
 
-	igt_fixture {
+	igt_fixture() {
 		int i;
 
 		for (i = 0; i < num_engines; i++)
diff --git a/tests/intel/i915_pm_freq_api.c b/tests/intel/i915_pm_freq_api.c
index f2106cd3e319..f4bd3cb9e5df 100644
--- a/tests/intel/i915_pm_freq_api.c
+++ b/tests/intel/i915_pm_freq_api.c
@@ -161,7 +161,7 @@ static void restore_sysfs_freq(int sig)
 
 igt_main
 {
-	igt_fixture {
+	igt_fixture() {
 		int num_gts, dirfd, gt;
 
 		i915 = drm_open_driver(DRIVER_INTEL);
diff --git a/tests/intel/i915_pm_freq_mult.c b/tests/intel/i915_pm_freq_mult.c
index fa68be2200dc..05b55124c012 100644
--- a/tests/intel/i915_pm_freq_mult.c
+++ b/tests/intel/i915_pm_freq_mult.c
@@ -168,7 +168,7 @@ igt_main
 {
 	int dir, gt;
 
-	igt_fixture {
+	igt_fixture() {
 		i915 = drm_open_driver(DRIVER_INTEL);
 
 		/* Frequency multipliers are not simulated. */
@@ -183,7 +183,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		drm_close_driver(i915);
 	}
 }
diff --git a/tests/intel/i915_pm_rc6_residency.c b/tests/intel/i915_pm_rc6_residency.c
index 2236668ce91d..e56263ff27ef 100644
--- a/tests/intel/i915_pm_rc6_residency.c
+++ b/tests/intel/i915_pm_rc6_residency.c
@@ -608,7 +608,7 @@ igt_main
 	const intel_ctx_t *ctx;
 
 	/* Use drm_open_driver to verify device existence */
-	igt_fixture {
+	igt_fixture() {
 		i915 = drm_open_driver(DRIVER_INTEL);
 	}
 
@@ -651,7 +651,7 @@ igt_main
 		unsigned int rc6_enabled = 0;
 		unsigned int devid = 0;
 
-		igt_fixture {
+		igt_fixture() {
 			devid = intel_get_drm_devid(i915);
 			sysfs = igt_sysfs_open(i915);
 			igt_assert(sysfs != 1);
@@ -683,11 +683,11 @@ igt_main
 			residency_accuracy(res.media_rc6, res.duration, "media_rc6");
 		}
 
-		igt_fixture
+		igt_fixture()
 			close(sysfs);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		free(drpc);
 		drm_close_driver(i915);
 	}
diff --git a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c
index 31758b1a5e35..6aa165bf962b 100644
--- a/tests/intel/i915_pm_rpm.c
+++ b/tests/intel/i915_pm_rpm.c
@@ -1349,7 +1349,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	/* Skip instead of failing in case the machine is not prepared to reach
 	 * PC8+. We don't want bug reports from cases where the machine is just
 	 * not properly configured. */
-	igt_fixture {
+	igt_fixture() {
 		igt_require(setup_environment(true));
 	}
 
@@ -1420,7 +1420,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	igt_subtest("gem-execbuf-stress-pc8")
 		gem_execbuf_stress_subtest(rounds, WAIT_PC8_RES, 0);
 
-	igt_fixture {
+	igt_fixture() {
 		teardown_environment(true);
 		forcewake_put(&ms_data);
 	}
diff --git a/tests/intel/i915_pm_rps.c b/tests/intel/i915_pm_rps.c
index 359776a6d81e..061fddc6a7a8 100644
--- a/tests/intel/i915_pm_rps.c
+++ b/tests/intel/i915_pm_rps.c
@@ -1205,7 +1205,7 @@ igt_main
 {
 	int tmp, gt;
 
-	igt_fixture {
+	igt_fixture() {
 		char sysfs_path[80];
 
 		/* Use drm_open_driver to verify device existence */
@@ -1319,6 +1319,6 @@ igt_main
 		}
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(drm_fd);
 }
diff --git a/tests/intel/i915_pm_sseu.c b/tests/intel/i915_pm_sseu.c
index 13493933a05a..85493b83d26d 100644
--- a/tests/intel/i915_pm_sseu.c
+++ b/tests/intel/i915_pm_sseu.c
@@ -389,7 +389,7 @@ exit_handler(int sig)
 
 igt_main
 {
-	igt_fixture {
+	igt_fixture() {
 		igt_install_exit_handler(exit_handler);
 
 		gem_init();
diff --git a/tests/intel/i915_power.c b/tests/intel/i915_power.c
index 4de7adbe68be..8fff552cc37b 100644
--- a/tests/intel/i915_power.c
+++ b/tests/intel/i915_power.c
@@ -79,7 +79,7 @@ igt_main
 {
 	int i915;
 
-	igt_fixture {
+	igt_fixture() {
 		igt_skip_on_simulation();
 		i915 = drm_open_driver_master(DRIVER_INTEL);
 	}
@@ -89,7 +89,7 @@ igt_main
 		sanity(i915);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		drm_close_driver(i915);
 	}
 }
diff --git a/tests/intel/i915_query.c b/tests/intel/i915_query.c
index df7e46a63daa..9545a35c1836 100644
--- a/tests/intel/i915_query.c
+++ b/tests/intel/i915_query.c
@@ -1441,7 +1441,7 @@ igt_main
 	int fd = -1;
 	int devid;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require(has_query_supports(fd));
 		devid = intel_get_drm_devid(fd);
@@ -1516,7 +1516,7 @@ igt_main
 	}
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			igt_require(query_engine_info_supported(fd));
 		}
 
@@ -1533,7 +1533,7 @@ igt_main
 	igt_subtest("hwconfig_table")
 		query_parse_and_validate_hwconfig_table(fd);
 
-	igt_fixture {
+	igt_fixture() {
 		drm_close_driver(fd);
 	}
 }
diff --git a/tests/intel/i915_suspend.c b/tests/intel/i915_suspend.c
index fae1031a2357..881b49bda2d6 100644
--- a/tests/intel/i915_suspend.c
+++ b/tests/intel/i915_suspend.c
@@ -308,7 +308,7 @@ igt_main
 	igt_subtest("basic-s3-without-i915")
 		test_suspend_without_i915(SUSPEND_STATE_S3);
 
-	igt_fixture {
+	igt_fixture() {
 		/*
 		 * Since above subtests may fail, leaving i915 module unloaded
 		 * but device list populated, refresh the device list before
@@ -362,6 +362,6 @@ igt_main
 	igt_subtest("forcewake-hibernate")
 		test_forcewake(fd, true);
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/intel/intel_hwmon.c b/tests/intel/intel_hwmon.c
index e4272e0a0c9a..a700f69769b2 100644
--- a/tests/intel/intel_hwmon.c
+++ b/tests/intel/intel_hwmon.c
@@ -80,7 +80,7 @@ igt_main
 {
 	int fd, hwm;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 		hwm = igt_hwmon_open(fd);
 		igt_require(hwm >= 0);
@@ -96,7 +96,7 @@ igt_main
 		hwmon_write(hwm);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		close(hwm);
 		drm_close_driver(fd);
 	}
diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 41fdcacab9dd..e7123cabcedf 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -969,7 +969,7 @@ static bool test_requirements(data_t *input_data, int l)
 
 igt_main
 {
-	igt_fixture {
+	igt_fixture() {
 		drmModeResPtr res;
 
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
@@ -1075,7 +1075,7 @@ igt_main
 					test_scanout(&data);
 			}
 
-			igt_fixture
+			igt_fixture()
 				test_cleanup(&data);
 		}
 	}
@@ -1133,7 +1133,7 @@ igt_main
 					}
 					data.async_flip_test = false;
 
-					igt_fixture
+					igt_fixture()
 						test_cleanup(&data);
 				}
 			}
@@ -1141,7 +1141,7 @@ igt_main
 	}
 	data.max_hw_stride_test = false;
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 		buf_ops_destroy(data.bops);
 		drm_close_driver(data.drm_fd);
diff --git a/tests/intel/kms_busy.c b/tests/intel/kms_busy.c
index 3f65ecb0192e..e9d2792c7a9a 100644
--- a/tests/intel/kms_busy.c
+++ b/tests/intel/kms_busy.c
@@ -431,7 +431,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	};
 	int fd;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver_master(DRIVER_INTEL);
 
 		igt_require_gem(fd);
@@ -508,7 +508,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		struct gem_engine_properties saved_gpu_timeouts[GEM_MAX_ENGINES];
 		int num_engines;
 
-		igt_fixture {
+		igt_fixture() {
 			igt_require(display.is_atomic);
 			if (tests[i].reset)
 				gpu_engines_init_timeouts(display.drm_fd,
@@ -545,13 +545,13 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 			igt_disallow_hang(display.drm_fd, hang);
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			if (tests[i].reset)
 				gpu_engines_restore_timeouts(display.drm_fd, num_engines, saved_gpu_timeouts);
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&display);
 		drm_close_driver(display.drm_fd);
 	}
diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index ab081aa755fa..ea53157bc8b3 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -1127,7 +1127,7 @@ static void test_output(data_t *data, const int testnum)
 {
 	uint16_t dev_id;
 
-	igt_fixture
+	igt_fixture()
 		dev_id = intel_get_drm_devid(data->drm_fd);
 
 	data->flags = tests[testnum].flags;
@@ -1191,7 +1191,7 @@ static void test_output(data_t *data, const int testnum)
 		}
 	}
 
-	igt_fixture
+	igt_fixture()
 		data->plane = NULL;
 }
 
@@ -1227,7 +1227,7 @@ static const char *help_str =
 
 igt_main_args("csr:", NULL, help_str, opt_handler, &data)
 {
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 
 		igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 9);
@@ -1249,7 +1249,7 @@ igt_main_args("csr:", NULL, help_str, opt_handler, &data)
 	for (int c = 0; c < ARRAY_SIZE(tests); c++)
 		test_output(&data, c);
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_commit2(&data.display, data.commit);
 		for (int i = 0; i < data.fb_list_length; i++)
 			igt_remove_fb(data.drm_fd, &data.fb_list[i].fb);
diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index 0c7c235f3d02..f1595818c1bd 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -344,7 +344,7 @@ igt_main
 {
 	data_t data = {};
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 		igt_require(data.drm_fd >= 0);
 		kmstest_set_vt_graphics_mode();
@@ -370,7 +370,7 @@ igt_main
 	igt_subtest("mode-transition-all-outputs")
 		test_mode_transition_on_all_outputs(&data);
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index c0649c0c6208..f25226da86a6 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -354,7 +354,7 @@ igt_main
 {
 	data_t data = {};
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
 		kmstest_set_vt_graphics_mode();
@@ -415,7 +415,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		buf_ops_destroy(data.bops);
 		igt_display_fini(&data.display);
 		close(data.drm_fd);
diff --git a/tests/intel/kms_dp_link_training.c b/tests/intel/kms_dp_link_training.c
index fb9b42608f25..7c1a97d022bd 100644
--- a/tests/intel/kms_dp_link_training.c
+++ b/tests/intel/kms_dp_link_training.c
@@ -302,7 +302,7 @@ igt_main
 {
 	data_t data = {};
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 		data.devid = intel_get_drm_devid(data.drm_fd);
 		kmstest_set_vt_graphics_mode();
@@ -344,7 +344,7 @@ igt_main
 			      "Didn't find any MST output with NON-UHBR rates.\n");
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_reset_connectors();
 		igt_display_fini(&data.display);
 		close(data.drm_fd);
diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index 4d67408833eb..b5e9e07774da 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -601,7 +601,7 @@ igt_main
 {
 	data_t data = {};
 
-	igt_fixture {
+	igt_fixture() {
 		unsigned int debug_mask_if_ci = DRM_UT_KMS;
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL |
 						     DRIVER_XE);
@@ -631,7 +631,7 @@ igt_main
 			      "Skipping test as DSC fallback conditions not met.\n");
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_remove_fb(data.drm_fd, &data.fb);
 		igt_display_fini(&data.display);
 		close(data.drm_fd);
diff --git a/tests/intel/kms_draw_crc.c b/tests/intel/kms_draw_crc.c
index 4877e757c24a..073a0084a7f1 100644
--- a/tests/intel/kms_draw_crc.c
+++ b/tests/intel/kms_draw_crc.c
@@ -335,7 +335,7 @@ igt_main
 	uint64_t modifier;
 	bool found_supported_format = false;
 
-	igt_fixture
+	igt_fixture()
 		setup_environment();
 
 	for (method = 0; method < IGT_DRAW_METHOD_COUNT; method++) {
@@ -378,6 +378,6 @@ igt_main
 	igt_subtest("fill-fb")
 		fill_fb_subtest();
 
-	igt_fixture
+	igt_fixture()
 		teardown_environment();
 }
diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index 7f074537051a..a3c1fe716b09 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -323,7 +323,7 @@ data_t data = {};
 
 igt_main_args("l", NULL, help_str, opt_handler, &data)
 {
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 		data.devid = intel_get_drm_devid(data.drm_fd);
 		data.disp_ver = intel_display_ver(data.devid);
@@ -415,7 +415,7 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
 				 DSC_FORMAT_RGB);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
diff --git a/tests/intel/kms_fb_coherency.c b/tests/intel/kms_fb_coherency.c
index 573037db1102..298cd7946086 100644
--- a/tests/intel/kms_fb_coherency.c
+++ b/tests/intel/kms_fb_coherency.c
@@ -238,7 +238,7 @@ igt_main
 {
 	data_t data;
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 
 		data.devid = intel_get_drm_devid(data.drm_fd);
@@ -288,7 +288,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
diff --git a/tests/intel/kms_fbc_dirty_rect.c b/tests/intel/kms_fbc_dirty_rect.c
index eda3fd91a896..c8b85545cd17 100644
--- a/tests/intel/kms_fbc_dirty_rect.c
+++ b/tests/intel/kms_fbc_dirty_rect.c
@@ -440,7 +440,7 @@ igt_main
 {
 	data_t data = {0};
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_XE);
 		igt_require(data.drm_fd >= 0);
 		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
@@ -530,7 +530,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 		close(data.drm_fd);
 	}
diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index 2c8cbbb1e94f..a410b2e0be6d 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -455,7 +455,7 @@ igt_main
 {
 	struct drm_info drm = { .fd = -1 };
 
-	igt_fixture
+	igt_fixture()
 		setup_environment(&drm);
 
 	igt_describe("Test the relationship between fbcon and the frontbuffer "
@@ -482,6 +482,6 @@ igt_main
 	igt_subtest("psr-suspend")
 		subtest(&drm, &psr, true);
 
-	igt_fixture
+	igt_fixture()
 		teardown_environment(&drm);
 }
diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_scaled_crc.c
index e866c62fc2bb..9daf045c4d8e 100644
--- a/tests/intel/kms_flip_scaled_crc.c
+++ b/tests/intel/kms_flip_scaled_crc.c
@@ -721,7 +721,7 @@ igt_main
 	igt_output_t *output;
 	drmModeModeInfoPtr modetoset = NULL;
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 		data.gen = intel_display_ver(intel_get_drm_devid(data.drm_fd));
 		igt_require(data.gen >= 9);
@@ -778,7 +778,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		free_fbs(&data);
 		if (data.pipe_crc) {
 			igt_pipe_crc_stop(data.pipe_crc);
diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
index d078653e9d91..aba8949514d2 100644
--- a/tests/intel/kms_flip_tiling.c
+++ b/tests/intel/kms_flip_tiling.c
@@ -211,7 +211,7 @@ igt_output_t *output;
 
 igt_main
 {
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 		data.gen = intel_display_ver(intel_get_drm_devid(data.drm_fd));
 
@@ -273,7 +273,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 0f162d9a514f..4e1214d165f1 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -4093,7 +4093,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	enum pipe pipe;
 	igt_output_t *output;
 
-	igt_fixture {
+	igt_fixture() {
 		setup_drm();
 		drm.devid = intel_get_drm_devid(drm.fd);
 		drm.display_ver = intel_display_ver(drm.devid);
@@ -4195,7 +4195,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 			}
 		}
 
-		igt_fixture
+		igt_fixture()
 			init_modeset_cached_params();
 	}
 
@@ -4459,6 +4459,6 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		basic_subtest(&t);
 	}
 
-	igt_fixture
+	igt_fixture()
 		teardown_environment();
 }
diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 276170229775..efb109604d1a 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -553,7 +553,7 @@ igt_main
 	drmModeModeInfo mode;
 	data_t data;
 
-	igt_fixture {
+	igt_fixture() {
 		ultra_joiner_supported = false;
 		data.big_joiner_output_count = 0;
 		data.ultra_joiner_output_count = 0;
@@ -628,7 +628,7 @@ igt_main
 	}
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			igt_require(data.big_joiner_output_count > 0);
 			igt_require(data.n_pipes > 1);
 		}
@@ -658,7 +658,7 @@ igt_main
 	}
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			igt_require(data.non_big_joiner_output_count > 0);
 			igt_require(data.n_pipes > 1);
 		}
@@ -700,7 +700,7 @@ igt_main
 	}
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			igt_require(data.ultra_joiner_output_count > 0);
 			igt_require(data.n_pipes > 3);
 		}
@@ -724,7 +724,7 @@ igt_main
 	}
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			igt_require(ultra_joiner_supported);
 			igt_require(data.non_ultra_joiner_output_count > 0);
 			igt_require(data.n_pipes > 3);
@@ -775,7 +775,7 @@ igt_main
 			test_basic_max_non_joiner(&data);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 		igt_reset_connectors();
diff --git a/tests/intel/kms_legacy_colorkey.c b/tests/intel/kms_legacy_colorkey.c
index 957e208c6d18..db674dc255fa 100644
--- a/tests/intel/kms_legacy_colorkey.c
+++ b/tests/intel/kms_legacy_colorkey.c
@@ -60,7 +60,7 @@ static void test_plane(uint32_t plane_id, int expected_ret)
 
 igt_main
 {
-	igt_fixture {
+	igt_fixture() {
 		drm_fd = drm_open_driver_master(DRIVER_INTEL);
 
 		kmstest_set_vt_graphics_mode();
@@ -100,7 +100,7 @@ igt_main
 			test_plane(max_id + 1, -ENOENT);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&display);
 		drm_close_driver(drm_fd);
 	}
diff --git a/tests/intel/kms_mmap_write_crc.c b/tests/intel/kms_mmap_write_crc.c
index 74ba70edd774..93c435a999cd 100644
--- a/tests/intel/kms_mmap_write_crc.c
+++ b/tests/intel/kms_mmap_write_crc.c
@@ -275,7 +275,7 @@ igt_main_args("n", NULL, NULL, opt_handler, NULL)
 	igt_output_t *output;
 	enum pipe pipe;
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 
 		data.devid = intel_get_drm_devid(data.drm_fd);
@@ -318,7 +318,7 @@ igt_main_args("n", NULL, NULL, opt_handler, NULL)
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 
diff --git a/tests/intel/kms_pipe_b_c_ivb.c b/tests/intel/kms_pipe_b_c_ivb.c
index 11236cb369ae..7960dbc9be4f 100644
--- a/tests/intel/kms_pipe_b_c_ivb.c
+++ b/tests/intel/kms_pipe_b_c_ivb.c
@@ -293,7 +293,7 @@ igt_main
 {
 	int devid;
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
 		devid = intel_get_drm_devid(data.drm_fd);
 		igt_skip_on(!IS_IVYBRIDGE(devid));
@@ -328,7 +328,7 @@ igt_main
 	igt_subtest("enable-pipe-C-while-B-has-3-lanes")
 		test_fail_enable_pipe_C_while_B_has_3_lanes(&data);
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index 193f59d8d4b1..525c6810e3d7 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -859,7 +859,7 @@ struct data data = {
 igt_main {
 	uint8_t format_idx = 0, tiling_idx = 0;
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = data.display.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 
 		kmstest_set_vt_graphics_mode();
@@ -895,7 +895,7 @@ igt_main {
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 	}
 }
diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
index a0ecf2b0e6fa..6cf16a460a68 100644
--- a/tests/intel/kms_pm_backlight.c
+++ b/tests/intel/kms_pm_backlight.c
@@ -226,7 +226,7 @@ igt_main
 		{ "fade-with-suspend", "test the fade with suspend.", test_fade, TEST_SUSPEND },
 	};
 
-	igt_fixture {
+	igt_fixture() {
 		bool found = false;
 		char full_name[32] = {};
 		char *name;
@@ -307,7 +307,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		/* Restore old brightness */
 		for (i = 0; i < (dual_edp ? 2 : 1); i++)
 			igt_backlight_write(contexts[i].old, "brightness", &contexts[i]);
diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 8cdf312f6803..475e64a21f4a 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -734,7 +734,7 @@ igt_main
 {
 	data_t data = {};
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
 		igt_require(data.debugfs_fd != -1);
@@ -839,7 +839,7 @@ igt_main
 		test_dc9_dpms(&data);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		free(data.debugfs_dump);
 		close(data.debugfs_fd);
 		close(data.debugfs_root_fd);
diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
index 771dc4134a6d..231a1b1c833e 100644
--- a/tests/intel/kms_pm_lpsp.c
+++ b/tests/intel/kms_pm_lpsp.c
@@ -196,7 +196,7 @@ igt_main
 {
 	data_t data = {};
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 		igt_require(data.drm_fd >= 0);
 		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
@@ -256,7 +256,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		free(data.pwr_dmn_info);
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
index 1610404ff0d8..2692f4cd8d74 100644
--- a/tests/intel/kms_pm_rpm.c
+++ b/tests/intel/kms_pm_rpm.c
@@ -1611,7 +1611,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		basic_subtest();
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_require(setup_environment());
 	}
 
@@ -1704,7 +1704,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		pm_test_caching();
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		teardown_environment();
 		forcewake_put(&ms_data);
 	}
diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index 105104be7d82..ec6dc3f0f092 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -789,7 +789,7 @@ igt_main
 	bool fbc_chipset_support;
 	int disp_ver;
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
 		kmstest_set_vt_graphics_mode();
@@ -963,7 +963,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 
 		close(data.debugfs_fd);
 		buf_ops_destroy(data.bops);
diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 739001064e08..9437d65e42c5 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -1196,7 +1196,7 @@ igt_main
 	bool fbc_chipset_support;
 	int disp_ver;
 
-	igt_fixture {
+	igt_fixture() {
 		drmModeResPtr res;
 
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
@@ -1546,7 +1546,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		close(data.debugfs_fd);
 		display_fini(&data);
 		drm_close_driver(data.drm_fd);
diff --git a/tests/intel/kms_psr2_su.c b/tests/intel/kms_psr2_su.c
index e9bc6f6c628b..fc6b30f2fdfd 100644
--- a/tests/intel/kms_psr2_su.c
+++ b/tests/intel/kms_psr2_su.c
@@ -318,7 +318,7 @@ igt_main
 	int pipes[IGT_MAX_PIPES * IGT_MAX_PIPES];
 	int n_pipes = 0;
 
-	igt_fixture {
+	igt_fixture() {
 		struct itimerspec interval;
 
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
@@ -395,7 +395,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		close(data.debugfs_fd);
 		display_fini(&data);
 		drm_close_driver(data.drm_fd);
diff --git a/tests/intel/kms_psr_stress_test.c b/tests/intel/kms_psr_stress_test.c
index cc8155a75b1e..356e9fe01a65 100644
--- a/tests/intel/kms_psr_stress_test.c
+++ b/tests/intel/kms_psr_stress_test.c
@@ -352,7 +352,7 @@ igt_main
 {
 	data_t data = {};
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
 		data.bops = buf_ops_create(data.drm_fd);
@@ -396,7 +396,7 @@ igt_main
 		cleanup(&data);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		buf_ops_destroy(data.bops);
 		igt_display_fini(&data.display);
 		close(data.debugfs_fd);
diff --git a/tests/intel/perf.c b/tests/intel/perf.c
index 1f106bed8fdf..7f27e70ace25 100644
--- a/tests/intel/perf.c
+++ b/tests/intel/perf.c
@@ -5862,7 +5862,7 @@ igt_main
 	const intel_ctx_t *ctx;
 	const struct intel_execution_engine2 *e;
 
-	igt_fixture {
+	igt_fixture() {
 		struct stat sb;
 
 		/*
@@ -5884,7 +5884,7 @@ igt_main
 	igt_subtest("sysctl-defaults")
 		test_sysctl_defaults();
 
-	igt_fixture {
+	igt_fixture() {
 		/* We expect that the ref count test before these fixtures
 		 * should have closed drm_fd...
 		 */
@@ -6149,7 +6149,7 @@ igt_main
 	igt_subtest("whitelisted-registers-userspace-config")
 		test_whitelisted_registers_userspace_config();
 
-	igt_fixture {
+	igt_fixture() {
 		/* leave sysctl options in their default state... */
 		write_u64_file("/proc/sys/dev/i915/oa_max_sample_rate", 100000);
 		write_u64_file("/proc/sys/dev/i915/perf_stream_paranoid", 1);
diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index bf43da8db57b..20e68e4b10fd 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -2292,7 +2292,7 @@ igt_main
 	 * Including all the I915_PMU_OTHER(x).
 	 */
 
-	igt_fixture {
+	igt_fixture() {
 		fd = __drm_open_driver(DRIVER_INTEL);
 
 		igt_require_gem(fd);
@@ -2424,7 +2424,7 @@ igt_main
 	 * enabled after two batches are running.
 	 */
 	igt_subtest_group {
-		igt_fixture gem_require_contexts(fd);
+		igt_fixture() gem_require_contexts(fd);
 
 		test_each_engine("busy-double-start", fd, ctx, e)
 			busy_double_start(fd, ctx, e);
@@ -2541,7 +2541,7 @@ igt_main
 		int render_fd = -1;
 		const intel_ctx_t *render_ctx = NULL;
 
-		igt_fixture {
+		igt_fixture() {
 			render_fd = __drm_open_driver_render(DRIVER_INTEL);
 			igt_require_gem(render_fd);
 			render_ctx = intel_ctx_create_all_physical(render_fd);
@@ -2554,13 +2554,13 @@ igt_main
 		test_each_engine("render-node-busy-idle", render_fd, render_ctx, e)
 			single(render_fd, render_ctx, e, TEST_BUSY | TEST_TRAILING_IDLE);
 
-		igt_fixture {
+		igt_fixture() {
 			intel_ctx_destroy(render_fd, render_ctx);
 			drm_close_driver(render_fd);
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		intel_ctx_destroy(fd, ctx);
 		drm_close_driver(fd);
 		free(drpc);
diff --git a/tests/intel/prime_busy.c b/tests/intel/prime_busy.c
index 4bba32835922..2777d0aa92e6 100644
--- a/tests/intel/prime_busy.c
+++ b/tests/intel/prime_busy.c
@@ -153,7 +153,7 @@ igt_main
 	const intel_ctx_t *ctx;
 	int fd = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
 		ctx = intel_ctx_create_all_physical(fd);
@@ -170,7 +170,7 @@ igt_main
 			{ },
 		};
 
-		igt_fixture
+		igt_fixture()
 			gem_require_mmap_device_coherent(fd);
 
 		for (const struct mode *m = modes; m->name; m++) {
@@ -182,7 +182,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		intel_ctx_destroy(fd, ctx);
 		drm_close_driver(fd);
 	}
diff --git a/tests/intel/prime_mmap.c b/tests/intel/prime_mmap.c
index ae0c74dfeb9f..c3990d6edc98 100644
--- a/tests/intel/prime_mmap.c
+++ b/tests/intel/prime_mmap.c
@@ -563,7 +563,7 @@ igt_main
 	char *ext;
 	int i;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 
 		query_info = gem_get_query_memory_regions(fd);
@@ -590,7 +590,7 @@ igt_main
 			}
 		}
 
-	igt_fixture {
+	igt_fixture() {
 		free(query_info);
 		igt_collection_destroy(set);
 		igt_collection_destroy(dma_buf_set);
diff --git a/tests/intel/prime_mmap_coherency.c b/tests/intel/prime_mmap_coherency.c
index 01c394639935..cbed906de44e 100644
--- a/tests/intel/prime_mmap_coherency.c
+++ b/tests/intel/prime_mmap_coherency.c
@@ -312,7 +312,7 @@ igt_main
 	struct igt_collection *set, *dma_buf_set;
 	struct drm_i915_query_memory_regions *query_info;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
 
@@ -361,7 +361,7 @@ igt_main
 		intel_bb_destroy(batch);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		buf_ops_destroy(bops);
 
 		drm_close_driver(fd);
diff --git a/tests/intel/prime_mmap_kms.c b/tests/intel/prime_mmap_kms.c
index c0c2f2fc0e00..4480f0c1cfef 100644
--- a/tests/intel/prime_mmap_kms.c
+++ b/tests/intel/prime_mmap_kms.c
@@ -261,7 +261,7 @@ igt_main
 {
 	gpu_process_t gpu;
 
-	igt_fixture {
+	igt_fixture() {
 		gpu.drm_fd = drm_open_driver_master(DRIVER_INTEL);
 		igt_skip_on((check_for_dma_buf_mmap(gpu.drm_fd) != 0));
 		kmstest_set_vt_graphics_mode();
@@ -274,7 +274,7 @@ igt_main
 	igt_subtest("buffer-sharing")
 		run_test(&gpu);
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&gpu.display);
 		drm_close_driver(gpu.drm_fd);
 	}
diff --git a/tests/intel/sysfs_defaults.c b/tests/intel/sysfs_defaults.c
index c7b6b36fdbeb..641c2de1bf30 100644
--- a/tests/intel/sysfs_defaults.c
+++ b/tests/intel/sysfs_defaults.c
@@ -95,7 +95,7 @@ igt_main
 {
 	int i915 = -1, engines = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		int sys;
 
 		i915 = drm_open_driver(DRIVER_INTEL);
@@ -114,7 +114,7 @@ igt_main
 	igt_subtest_with_dynamic("readonly")
 		dyn_sysfs_engines(i915, engines, NULL, test_writable);
 
-	igt_fixture {
+	igt_fixture() {
 		close(engines);
 		drm_close_driver(i915);
 	}
diff --git a/tests/intel/sysfs_heartbeat_interval.c b/tests/intel/sysfs_heartbeat_interval.c
index b4ca4769f92b..afee2ef80684 100644
--- a/tests/intel/sysfs_heartbeat_interval.c
+++ b/tests/intel/sysfs_heartbeat_interval.c
@@ -504,7 +504,7 @@ igt_main
 	};
 	int i915 = -1, engines = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		int sys;
 
 		i915 = drm_open_driver(DRIVER_INTEL);
@@ -525,7 +525,7 @@ igt_main
 		igt_subtest_with_dynamic(t->name)
 			dyn_sysfs_engines(i915, engines, ATTR, t->fn);
 
-	igt_fixture {
+	igt_fixture() {
 		close(engines);
 		drm_close_driver(i915);
 	}
diff --git a/tests/intel/sysfs_preempt_timeout.c b/tests/intel/sysfs_preempt_timeout.c
index 18e000405120..5c7ff672ea81 100644
--- a/tests/intel/sysfs_preempt_timeout.c
+++ b/tests/intel/sysfs_preempt_timeout.c
@@ -346,7 +346,7 @@ igt_main
 	};
 	int i915 = -1, engines = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		int sys;
 
 		i915 = drm_open_driver(DRIVER_INTEL);
@@ -366,7 +366,7 @@ igt_main
 		igt_subtest_with_dynamic(t->name)
 			dyn_sysfs_engines(i915, engines, ATTR, t->fn);
 
-	igt_fixture {
+	igt_fixture() {
 		close(engines);
 		drm_close_driver(i915);
 	}
diff --git a/tests/intel/sysfs_timeslice_duration.c b/tests/intel/sysfs_timeslice_duration.c
index 026d12b85c38..ea4ea7a8d289 100644
--- a/tests/intel/sysfs_timeslice_duration.c
+++ b/tests/intel/sysfs_timeslice_duration.c
@@ -571,7 +571,7 @@ igt_main
 	};
 	int i915 = -1, engines = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		int sys;
 
 		i915 = drm_open_driver(DRIVER_INTEL);
@@ -591,7 +591,7 @@ igt_main
 		igt_subtest_with_dynamic(t->name)
 			dyn_sysfs_engines(i915, engines, ATTR, t->fn);
 
-	igt_fixture {
+	igt_fixture() {
 		close(engines);
 		drm_close_driver(i915);
 	}
diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index 61cf97d52550..8c5c4d22db7a 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -866,7 +866,7 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 	struct igt_collection *set;
 	int xe;
 
-	igt_fixture {
+	igt_fixture() {
 		xe = drm_open_driver(DRIVER_XE);
 		igt_require(blt_has_block_copy(xe));
 
@@ -969,7 +969,7 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 		block_copy_test(xe, &config, set, BLOCK_COPY);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		xe_device_put(xe);
 		close(xe);
 	}
diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 10823563743b..96abbc879281 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -515,7 +515,7 @@ igt_main
 	int xe, ccs_mode[4];
 	unsigned int ip_ver;
 
-	igt_fixture {
+	igt_fixture() {
 		xe = drm_open_driver(DRIVER_XE);
 		sriov_enabled = is_sriov_mode(xe);
 		ip_ver = intel_graphics_ver(intel_get_drm_devid(xe));
@@ -525,7 +525,7 @@ igt_main
 	igt_subtest("compute-square")
 		test_compute_square(xe);
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(xe);
 
 	/* ccs mode tests should be run without open gpu file handles */
@@ -565,7 +565,7 @@ igt_main
 		test_eu_busy(5 * LOOP_DURATION_2s);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		if (!sriov_enabled)
 			igt_restore_ccs_mode(ccs_mode, ARRAY_SIZE(ccs_mode));
 	}
diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
index 076360f1de71..b13285eef7d4 100644
--- a/tests/intel/xe_compute_preempt.c
+++ b/tests/intel/xe_compute_preempt.c
@@ -68,7 +68,7 @@ igt_main
 	struct drm_xe_engine_class_instance *hwe;
 	uint64_t ram_mb, swap_mb, vram_mb;
 
-	igt_fixture {
+	igt_fixture() {
 		xe = drm_open_driver(DRIVER_XE);
 		ram_mb = igt_get_avail_ram_mb();
 		swap_mb = igt_get_total_swap_mb();
@@ -203,7 +203,7 @@ igt_main
 		}
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(xe);
 
 }
diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 911e18965aa5..2cebeae55282 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -315,7 +315,7 @@ igt_main
 	uint32_t devid;
 	bool is_vf_device;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
 		devid = intel_get_drm_devid(fd);
 		is_vf_device = intel_is_vf_device(fd);
@@ -359,7 +359,7 @@ igt_main
 	igt_subtest("ctx-restore-mid-bb")
 		test_ctx_restore(configfs_device_fd, "mid");
 
-	igt_fixture {
+	igt_fixture() {
 		close(configfs_device_fd);
 		close(configfs_fd);
 	}
diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
index 09cfa470dd74..75c609690df6 100644
--- a/tests/intel/xe_copy_basic.c
+++ b/tests/intel/xe_copy_basic.c
@@ -273,7 +273,7 @@ igt_main_args("b", NULL, help_str, opt_handler, NULL)
 			       { 0, 17, 1, MODE_PAGE }};
 	struct rect matrix[] = { { 4, 2, 2 }, { 256, 200, 127 } };
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
 		dev_id = intel_get_drm_devid(fd);
 		xe_device_get(fd);
@@ -330,7 +330,7 @@ igt_main_args("b", NULL, help_str, opt_handler, NULL)
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		drm_close_driver(fd);
 	}
 }
diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index d7fe9d626f7c..ed917190e184 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -531,7 +531,7 @@ igt_main_args("Q:p:", NULL, help_str, opt_handler, NULL)
 {
 	int xe;
 
-	igt_fixture
+	igt_fixture()
 		xe = drm_open_driver(DRIVER_XE);
 
 	igt_subtest("valid-flag")
@@ -613,6 +613,6 @@ igt_main_args("Q:p:", NULL, help_str, opt_handler, NULL)
 		igt_waitchildren();
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(xe);
 }
diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index 100504713283..126b8290d456 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -178,7 +178,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	int fd = -1;
 	igt_dir_t *igt_dir = NULL;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver_master(DRIVER_XE);
 		__igt_debugfs_dump(fd, "info", IGT_LOG_INFO);
 		debugfs = igt_debugfs_dir(fd);
@@ -199,7 +199,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		xe_test_forcewake(fd);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_dir_destroy(igt_dir);
 		close(debugfs);
 		drm_close_driver(fd);
diff --git a/tests/intel/xe_dma_buf_sync.c b/tests/intel/xe_dma_buf_sync.c
index 1c0e7c67035a..0a8a3c5a1a66 100644
--- a/tests/intel/xe_dma_buf_sync.c
+++ b/tests/intel/xe_dma_buf_sync.c
@@ -231,7 +231,7 @@ igt_main
 	struct drm_xe_engine_class_instance *hwe, *hwe0 = NULL, *hwe1;
 	int fd;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
 
 		xe_for_each_engine(fd, hwe)
@@ -267,6 +267,6 @@ igt_main
 	igt_subtest("export-dma-buf-many-write-read-sync")
 		test_export_dma_buf(hwe0, hwe1, 16, WRITE_READ_SYNC);
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 264380d99526..f863cb519a9b 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -741,7 +741,7 @@ igt_main
 	struct drm_xe_engine_class_instance *hwe;
 	int xe, gt, class;
 
-	igt_fixture {
+	igt_fixture() {
 		struct drm_client_fdinfo info = { };
 
 		xe = drm_open_driver(DRIVER_XE);
@@ -849,7 +849,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		drm_close_driver(xe);
 	}
 }
diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c
index f5c57a9b366a..eecbcfa4f090 100644
--- a/tests/intel/xe_eu_stall.c
+++ b/tests/intel/xe_eu_stall.c
@@ -652,7 +652,7 @@ igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
 	uint32_t devid;
 	struct stat sb;
 
-	igt_fixture {
+	igt_fixture() {
 		drm_fd = drm_open_driver(DRIVER_XE);
 		igt_require_fd(drm_fd);
 		devid = intel_get_drm_devid(drm_fd);
@@ -712,7 +712,7 @@ igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
 	igt_subtest("invalid-event-report-count")
 		test_invalid_event_report_count(drm_fd);
 
-	igt_fixture {
+	igt_fixture() {
 		free(user_buf);
 		if (output)
 			fclose(output);
diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 9d1280528fcc..6e5409df4ff0 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -2800,7 +2800,7 @@ igt_main
 	bool *multigpu_was_enabled;
 	int fd, gpu_count;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
 		was_enabled = xe_eudebug_enable(fd, true);
 
@@ -2921,13 +2921,13 @@ igt_main
 	igt_subtest("discovery-empty-clients")
 		test_empty_discovery(fd, DISCOVERY_DESTROY_RESOURCES, 16);
 
-	igt_fixture {
+	igt_fixture() {
 		xe_eudebug_enable(fd, was_enabled);
 		drm_close_driver(fd);
 	}
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			gpu_count = drm_prepare_filtered_multigpu(DRIVER_XE);
 
 			multigpu_was_enabled = malloc(gpu_count * sizeof(bool));
@@ -2967,7 +2967,7 @@ igt_main
 			igt_waitchildren();
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			for (int i = 0; i < gpu_count; i++) {
 				fd = drm_open_filtered_card(i);
 				xe_eudebug_enable(fd, multigpu_was_enabled[i]);
diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 50d95988e6b3..470d94022a45 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -2595,7 +2595,7 @@ igt_main
 	uint16_t engine_class = 0xFFFF;
 	uint32_t preempt_timeout = 0xFFFFFFFF;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
 		intel_allocator_multiprocess_start();
 		igt_srandom();
@@ -2647,7 +2647,7 @@ igt_main
 			test_interrupt_other(fd, hwe, SHADER_LOOP | DISABLE_DEBUG_MODE);
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			if ((uint16_t)~engine_class && ~preempt_timeout)
 				if (!restore_preempt_timeout(fd, engine_class, preempt_timeout))
 					igt_warn("Cleanup of preempt_timeout failed!\n");
@@ -2720,7 +2720,7 @@ igt_main
 	test_gt_render_or_compute("pagefault-write-stress", fd, hwe)
 		test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_WRITE | PAGEFAULT_STRESS_TEST);
 
-	igt_fixture {
+	igt_fixture() {
 		xe_eudebug_enable(fd, was_enabled);
 
 		intel_allocator_multiprocess_stop();
diff --git a/tests/intel/xe_eudebug_sriov.c b/tests/intel/xe_eudebug_sriov.c
index 4f20a3e49847..c5178fd48d66 100644
--- a/tests/intel/xe_eudebug_sriov.c
+++ b/tests/intel/xe_eudebug_sriov.c
@@ -132,7 +132,7 @@ igt_main
 	bool vf_autoprobe;
 	int fd;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
 		igt_require(igt_sriov_is_pf(fd));
 		igt_require(igt_sriov_vfs_supported(fd));
@@ -147,7 +147,7 @@ igt_main
 	igt_subtest("deny-sriov")
 		test_deny_sriov(fd);
 
-	igt_fixture {
+	igt_fixture() {
 		restore_initial_driver_state(fd, eudebug_enabled, vf_autoprobe);
 		close(fd);
 	}
diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 91533cc54aad..2815250ce8f5 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -801,7 +801,7 @@ igt_main
 	uint64_t system_size;
 	int fd;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
 		igt_require(xe_has_vram(fd));
 		vram_size = xe_visible_vram_size(fd, 0);
@@ -863,6 +863,6 @@ igt_main
 		}
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/intel/xe_evict_ccs.c b/tests/intel/xe_evict_ccs.c
index 7cba378cdb1d..f4556c2ba36b 100644
--- a/tests/intel/xe_evict_ccs.c
+++ b/tests/intel/xe_evict_ccs.c
@@ -528,7 +528,7 @@ igt_main_args("bdDn:p:s:S:V", NULL, help_str, opt_handler, NULL)
 	bool has_flatccs;
 	int fd;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
 		igt_require(xe_has_vram(fd));
 		vram_size = xe_visible_vram_size(fd, 0);
@@ -541,7 +541,7 @@ igt_main_args("bdDn:p:s:S:V", NULL, help_str, opt_handler, NULL)
 		has_flatccs = HAS_FLATCCS(intel_get_drm_devid(fd));
 	}
 
-	igt_fixture
+	igt_fixture()
 		intel_allocator_multiprocess_start();
 
 	for (const struct ccs *s = ccs; s->name; s++) {
@@ -554,7 +554,7 @@ igt_main_args("bdDn:p:s:S:V", NULL, help_str, opt_handler, NULL)
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		intel_allocator_multiprocess_stop();
 		drm_close_driver(fd);
 	}
diff --git a/tests/intel/xe_exec_atomic.c b/tests/intel/xe_exec_atomic.c
index 39c739b64480..f42f93c1782c 100644
--- a/tests/intel/xe_exec_atomic.c
+++ b/tests/intel/xe_exec_atomic.c
@@ -128,7 +128,7 @@ igt_main
 	struct drm_xe_engine_class_instance *hwe;
 	int fd;
 
-	igt_fixture
+	igt_fixture()
 		fd = drm_open_driver(DRIVER_XE);
 
 	igt_subtest_with_dynamic("basic-dec-all") {
@@ -167,6 +167,6 @@ igt_main
 		}
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index 27ed91d5f3f2..da36367c6e8f 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -588,7 +588,7 @@ igt_main
 	int class;
 	int fd;
 
-	igt_fixture
+	igt_fixture()
 		fd = drm_open_driver(DRIVER_XE);
 
 	igt_subtest("virtual-all-active")
@@ -663,6 +663,6 @@ igt_main
 					test_cm(fd, gt, class, 1, 0, s->flags);
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
index 616fd262c3ac..405d8ec77eda 100644
--- a/tests/intel/xe_exec_basic.c
+++ b/tests/intel/xe_exec_basic.c
@@ -345,7 +345,7 @@ igt_main
 	};
 	int fd;
 
-	igt_fixture
+	igt_fixture()
 		fd = drm_open_driver(DRIVER_XE);
 
 	for (const struct section *s = sections; s->name; s++) {
@@ -383,7 +383,7 @@ igt_main
 				test_exec(fd, hwe, 1, 0, 1, s->flags);
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 
 	for (const struct section *s = sections; s->name; s++) {
diff --git a/tests/intel/xe_exec_capture.c b/tests/intel/xe_exec_capture.c
index 8257d8069737..962df5f1917f 100644
--- a/tests/intel/xe_exec_capture.c
+++ b/tests/intel/xe_exec_capture.c
@@ -410,7 +410,7 @@ igt_main
 	struct drm_xe_engine_class_instance *hwe;
 	u64 timeouts[DRM_XE_ENGINE_CLASS_VM_BIND] = {0};
 
-	igt_fixture {
+	igt_fixture() {
 		xe = drm_open_driver(DRIVER_XE);
 		xe_for_each_engine(xe, hwe) {
 			/* Skip kernel only classes */
@@ -433,7 +433,7 @@ igt_main
 	igt_subtest("reset")
 		test_card(xe);
 
-	igt_fixture {
+	igt_fixture() {
 		xe_for_each_engine(xe, hwe) {
 			u64 store, timeout;
 
diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index 316f7322c13f..2121f4fb4861 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -430,7 +430,7 @@ igt_main
 	};
 	int fd;
 
-	igt_fixture
+	igt_fixture()
 		fd = drm_open_driver(DRIVER_XE);
 
 	for (const struct section *s = sections; s->name; s++) {
@@ -464,6 +464,6 @@ igt_main
 		lr_mode_workload(fd);
 
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index ae40e099b972..18b86514d14f 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -459,7 +459,7 @@ igt_main
 	};
 	int fd;
 
-	igt_fixture {
+	igt_fixture() {
 		struct timespec tv = {};
 		bool supports_faults;
 		int ret = 0;
@@ -508,7 +508,7 @@ igt_main
 		xe_for_each_engine(fd, hwe)
 			test_exec(fd, hwe, 1, 1, ENABLE_SCRATCH | INVALID_VA);
 
-	igt_fixture {
+	igt_fixture() {
 		drm_close_driver(fd);
 	}
 }
diff --git a/tests/intel/xe_exec_mix_modes.c b/tests/intel/xe_exec_mix_modes.c
index e65854d0dc1e..45d02e06e2dc 100644
--- a/tests/intel/xe_exec_mix_modes.c
+++ b/tests/intel/xe_exec_mix_modes.c
@@ -271,7 +271,7 @@ igt_main
 	};
 	int fd;
 
-	igt_fixture {
+	igt_fixture() {
 		bool supports_faults;
 		int ret = 0;
 
@@ -288,7 +288,7 @@ igt_main
 					test_exec(fd, hwe, s->flags);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		drm_close_driver(fd);
 	}
 }
diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
index 4dfcf09e2669..cf8a9800ceed 100644
--- a/tests/intel/xe_exec_queue_property.c
+++ b/tests/intel/xe_exec_queue_property.c
@@ -215,7 +215,7 @@ igt_main
 	int xe;
 	int gt;
 
-	igt_fixture {
+	igt_fixture() {
 		xe = drm_open_driver(DRIVER_XE);
 	}
 
@@ -240,7 +240,7 @@ igt_main
 	}
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			int sys_fd = igt_sysfs_open(xe);
 
 			if (sys_fd != -1) {
@@ -285,7 +285,7 @@ igt_main
 	igt_subtest("invalid-property")
 		invalid_property(xe);
 
-	igt_fixture {
+	igt_fixture() {
 		xe_device_put(xe);
 		drm_close_driver(xe);
 	}
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index a3c4b2d7baeb..f7ecb26af290 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -785,7 +785,7 @@ igt_main
 	int class;
 	int fd;
 
-	igt_fixture
+	igt_fixture()
 		fd = drm_open_driver(DRIVER_XE);
 
 	igt_subtest("spin")
@@ -979,6 +979,6 @@ igt_main
 		xe_for_each_gt(fd, gt)
 			gt_mocs_reset(fd, gt);
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
index 310526531d99..06465e27ed62 100644
--- a/tests/intel/xe_exec_sip.c
+++ b/tests/intel/xe_exec_sip.c
@@ -314,7 +314,7 @@ igt_main
 	struct drm_xe_engine_class_instance *eci;
 	int fd;
 
-	igt_fixture
+	igt_fixture()
 		fd = drm_open_driver(DRIVER_XE);
 
 	test_render_and_compute("sanity", fd, eci)
@@ -338,6 +338,6 @@ igt_main
 	test_render_and_compute("invalidinstr-walker-enabled", fd, eci)
 		test_sip(SHADER_INV_INSTR_WALKER_ENABLED, SIP_INV_INSTR, eci, 0);
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/intel/xe_exec_sip_eudebug.c b/tests/intel/xe_exec_sip_eudebug.c
index e5b8ba418c43..7f739b120fa6 100644
--- a/tests/intel/xe_exec_sip_eudebug.c
+++ b/tests/intel/xe_exec_sip_eudebug.c
@@ -320,12 +320,12 @@ igt_main
 	bool was_enabled;
 	int fd;
 
-	igt_fixture
+	igt_fixture()
 		fd = drm_open_driver(DRIVER_XE);
 
 	/* Debugger disabled (TD_CTL not set) */
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			was_enabled = xe_eudebug_enable(fd, false);
 			igt_require(!xe_eudebug_debugger_available(fd));
 		}
@@ -336,13 +336,13 @@ igt_main
 		test_render_and_compute("breakpoint-writesip-nodebug", fd, eci)
 			test_sip(SHADER_BREAKPOINT, SIP_WRITE, eci, 0);
 
-		igt_fixture
+		igt_fixture()
 			xe_eudebug_enable(fd, was_enabled);
 	}
 
 	/* Debugger enabled (TD_CTL set) */
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			was_enabled = xe_eudebug_enable(fd, true);
 		}
 
@@ -358,10 +358,10 @@ igt_main
 		test_render_and_compute("breakpoint-waitsip-heavy", fd, eci)
 			test_sip(SHADER_BREAKPOINT, SIP_HEAVY, eci, 0);
 
-		igt_fixture
+		igt_fixture()
 			xe_eudebug_enable(fd, was_enabled);
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index bf22c3475548..4fda5a4fb253 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -419,7 +419,7 @@ igt_main
 	uint16_t dev_id;
 	struct drm_xe_engine *engine;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
 		xe_device_get(fd);
 		dev_id = intel_get_drm_devid(fd);
@@ -483,7 +483,7 @@ igt_main
 		igt_collection_destroy(set);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		xe_device_put(fd);
 		close(fd);
 	}
diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index b88967e580b2..106e1a0e63c5 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -2381,7 +2381,7 @@ igt_main
 
 	int fd;
 
-	igt_fixture {
+	igt_fixture() {
 		struct xe_device *xe;
 
 		fd = drm_open_driver(DRIVER_XE);
@@ -2599,7 +2599,7 @@ igt_main
 		xe_for_each_engine(fd, hwe)
 			test_compute(fd, hwe, SZ_2M);
 
-	igt_fixture {
+	igt_fixture() {
 		xe_device_put(fd);
 		drm_close_driver(fd);
 		close_sync_file();
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index bb39eecbe33a..0eff4b8be8bc 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -1281,7 +1281,7 @@ igt_main
 	};
 	int fd;
 
-	igt_fixture
+	igt_fixture()
 		fd = drm_open_driver(DRIVER_XE);
 
 	for (const struct section *s = sections; s->name; s++) {
@@ -1289,6 +1289,6 @@ igt_main
 			threads(fd, s->flags);
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/intel/xe_exercise_blt.c b/tests/intel/xe_exercise_blt.c
index e24a48abf54a..47879a0dce38 100644
--- a/tests/intel/xe_exercise_blt.c
+++ b/tests/intel/xe_exercise_blt.c
@@ -390,7 +390,7 @@ igt_main_args("b:pst:W:H:", NULL, help_str, opt_handler, NULL)
 	struct igt_collection *set;
 	int xe;
 
-	igt_fixture {
+	igt_fixture() {
 		xe = drm_open_driver(DRIVER_XE);
 		igt_require(blt_has_fast_copy(xe));
 
@@ -421,7 +421,7 @@ igt_main_args("b:pst:W:H:", NULL, help_str, opt_handler, NULL)
 		fast_copy_test(xe, set, FAST_COPY_EMIT);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		drm_close_driver(xe);
 	}
 }
diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 4b4881634181..b7278c16aa6d 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -626,7 +626,7 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 		{ }
 	};
 
-	igt_fixture {
+	igt_fixture() {
 		igt_require(fail_function_injection_enabled());
 		fd = drm_open_driver(DRIVER_XE);
 		devid = intel_get_drm_devid(fd);
@@ -663,7 +663,7 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 		igt_subtest_f("oa-add-config-fail-%s", s->name)
 			oa_add_config_fail(fd, sysfs, devid, pci_slot, s->name);
 
-	igt_fixture {
+	igt_fixture() {
 		igt_kmod_unbind("xe", pci_slot);
 	}
 
@@ -685,7 +685,7 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 			probe_fail_guc(fd, pci_slot, s->name, &fault_params);
 		}
 
-	igt_fixture {
+	igt_fixture() {
 		close(sysfs);
 		drm_close_driver(fd);
 		injection_list_clear();
diff --git a/tests/intel/xe_gpgpu_fill.c b/tests/intel/xe_gpgpu_fill.c
index e1ecff82339f..e61d5c8db903 100644
--- a/tests/intel/xe_gpgpu_fill.c
+++ b/tests/intel/xe_gpgpu_fill.c
@@ -174,7 +174,7 @@ igt_main_args("dW:H:X:Y:", NULL, help_str, opt_handler, NULL)
 	data_t data = {0, };
 	igt_fillfunc_t fill_fn = NULL;
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_render(DRIVER_XE);
 		data.devid = intel_get_drm_devid(data.drm_fd);
 		data.bops = buf_ops_create(data.drm_fd);
@@ -201,7 +201,7 @@ igt_main_args("dW:H:X:Y:", NULL, help_str, opt_handler, NULL)
 			   surfheight / 2);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		buf_ops_destroy(data.bops);
 		drm_close_driver(data.drm_fd);
 	}
diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index d0f35b10a5fe..e067b4598915 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -401,7 +401,7 @@ igt_main
 	uint32_t *stash_min, *stash_max;
 	int max_gt;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
 
 		igt_require(xe_sysfs_gt_has_node(fd, 0, "freq0"));
@@ -487,7 +487,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		xe_for_each_gt(fd, gt) {
 			xe_gt_set_freq(fd, gt, "max", stash_max[gt]);
 			xe_gt_set_freq(fd, gt, "min", stash_min[gt]);
diff --git a/tests/intel/xe_huc_copy.c b/tests/intel/xe_huc_copy.c
index c8b5efc7b979..6a015a6f7139 100644
--- a/tests/intel/xe_huc_copy.c
+++ b/tests/intel/xe_huc_copy.c
@@ -195,7 +195,7 @@ igt_main
 {
 	int xe;
 
-	igt_fixture
+	igt_fixture()
 		xe = drm_open_driver(DRIVER_XE);
 
 	igt_subtest("huc_copy") {
@@ -207,6 +207,6 @@ igt_main
 		test_huc_copy(xe);
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(xe);
 }
diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
index f2e92a024ad0..d7dbe661a790 100644
--- a/tests/intel/xe_intel_bb.c
+++ b/tests/intel/xe_intel_bb.c
@@ -990,7 +990,7 @@ igt_main_args("dpib", NULL, help_str, opt_handler, NULL)
 	struct buf_ops *bops;
 	uint32_t width;
 
-	igt_fixture {
+	igt_fixture() {
 		xe = drm_open_driver(DRIVER_XE);
 		bops = buf_ops_create(xe);
 	}
@@ -1068,7 +1068,7 @@ igt_main_args("dpib", NULL, help_str, opt_handler, NULL)
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		buf_ops_destroy(bops);
 		drm_close_driver(xe);
 	}
diff --git a/tests/intel/xe_media_fill.c b/tests/intel/xe_media_fill.c
index 1e0ccb829fb8..ec76de6c54a2 100644
--- a/tests/intel/xe_media_fill.c
+++ b/tests/intel/xe_media_fill.c
@@ -120,7 +120,7 @@ igt_main
 	struct data_t data = {0, };
 	igt_fillfunc_t fill_fn = NULL;
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_render(DRIVER_XE);
 		data.devid = intel_get_drm_devid(data.drm_fd);
 		data.bops = buf_ops_create(data.drm_fd);
@@ -133,7 +133,7 @@ igt_main
 	igt_subtest("media-fill")
 		media_fill(&data, fill_fn);
 
-	igt_fixture {
+	igt_fixture() {
 		buf_ops_destroy(data.bops);
 		drm_close_driver(data.drm_fd);
 	}
diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
index 79c611f5287f..c9c00ee894a2 100644
--- a/tests/intel/xe_mmap.c
+++ b/tests/intel/xe_mmap.c
@@ -444,7 +444,7 @@ igt_main
 {
 	int fd;
 
-	igt_fixture
+	igt_fixture()
 		fd = drm_open_driver(DRIVER_XE);
 
 	igt_subtest("system")
@@ -492,7 +492,7 @@ igt_main
 			test_bad_object_for_pcimem(fd);
 		}
 
-		igt_fixture
+		igt_fixture()
 			close(fw_handle);
 	}
 
@@ -515,6 +515,6 @@ igt_main
 	igt_subtest("cpu-caching")
 		test_cpu_caching(fd);
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/intel/xe_noexec_ping_pong.c b/tests/intel/xe_noexec_ping_pong.c
index 91cd04243789..ab8d1944a319 100644
--- a/tests/intel/xe_noexec_ping_pong.c
+++ b/tests/intel/xe_noexec_ping_pong.c
@@ -97,13 +97,13 @@ static int fd;
 IGT_TEST_DESCRIPTION("Expose compute VM's unnecessary rebinds");
 igt_main
 {
-	igt_fixture
+	igt_fixture()
 		fd = drm_open_driver(DRIVER_XE);
 
 	igt_describe("Check for unnnecessary rebinds");
 	igt_subtest("basic")
 		test_ping_pong(fd, xe_engine(fd, 0));
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 0c9e693f7d9b..c9507b583e91 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4996,7 +4996,7 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 	const struct drm_xe_oa_unit *oau;
 	struct xe_device *xe_dev;
 
-	igt_fixture {
+	igt_fixture() {
 		struct stat sb;
 
 		/*
@@ -5012,7 +5012,7 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 	igt_subtest("sysctl-defaults")
 		test_sysctl_defaults();
 
-	igt_fixture {
+	igt_fixture() {
 		/* We expect that the ref count test before these fixtures
 		 * should have closed drm_fd...
 		 */
@@ -5220,7 +5220,7 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 	}
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			perf_init_whitelist();
 		}
 
@@ -5242,7 +5242,7 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 	}
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			igt_require(oau->capabilities & DRM_XE_OA_CAPS_SYNCS);
 		}
 
@@ -5254,7 +5254,7 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		/* leave sysctl options in their default state... */
 		write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
 
diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 59dfb6b1115f..8af4c32f489c 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -1160,7 +1160,7 @@ igt_main_args("V", NULL, help_str, opt_handler, NULL)
 	uint16_t dev_id;
 	int fd;
 
-	igt_fixture {
+	igt_fixture() {
 		uint32_t seed;
 
 		fd = drm_open_driver(DRIVER_XE);
@@ -1218,6 +1218,6 @@ igt_main_args("V", NULL, help_str, opt_handler, NULL)
 	igt_subtest("display-vs-wb-transient")
 		display_vs_wb_transient(fd);
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/intel/xe_peer2peer.c b/tests/intel/xe_peer2peer.c
index 92cb6a65f515..d9f8ee07be12 100644
--- a/tests/intel/xe_peer2peer.c
+++ b/tests/intel/xe_peer2peer.c
@@ -368,7 +368,7 @@ igt_main_args("", NULL, NULL, NULL, NULL)
 	struct gpu_info gpus[2];
 	int gpu_cnt;
 
-	igt_fixture {
+	igt_fixture() {
 		gpu_cnt = get_device_info(gpus, ARRAY_SIZE(gpus));
 		igt_skip_on(gpu_cnt < 2);
 	}
@@ -381,7 +381,7 @@ igt_main_args("", NULL, NULL, NULL, NULL)
 	igt_subtest_with_dynamic_f("write")
 		gpu_write(&gpus[0], &gpus[1]);
 
-	igt_fixture {
+	igt_fixture() {
 		int cnt;
 
 		for (cnt = 0; cnt < gpu_cnt; cnt++)
diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 1db28a899f7e..de63998d1792 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -905,7 +905,7 @@ igt_main
 		{ NULL },
 	};
 
-	igt_fixture {
+	igt_fixture() {
 		memset(&device, 0, sizeof(device));
 		device.fd_xe = drm_open_driver(DRIVER_XE);
 		device.pci_xe = igt_device_get_pci_device(device.fd_xe);
@@ -966,7 +966,7 @@ igt_main
 			test_mocs_suspend_resume(device, s->state, NO_RPM);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_install_exit_handler(close_fw_handle);
 	}
 
@@ -1052,7 +1052,7 @@ igt_main
 		test_vram_d3cold_threshold(device, sysfs_fd);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		close(sysfs_fd);
 		igt_pm_set_d3cold_allowed(device.pci_slot_name, d3cold_allowed);
 		if (has_runtime_pm)
diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 1749d6467796..775ee7f99f6f 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -377,7 +377,7 @@ igt_main
 	char pci_slot_name[NAME_MAX];
 	struct drm_xe_engine_class_instance *hwe;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
 
 		igt_require(!IS_PONTEVECCHIO(xe_dev_id(fd)));
@@ -444,7 +444,7 @@ igt_main
 		cpg_gt_toggle(fd);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		close(fd);
 	}
 }
diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 1a5b17de0b6b..d3cf7ca00fbf 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -1061,7 +1061,7 @@ igt_main
 	int fd, gt, num_engines;
 	struct drm_xe_engine_class_instance *eci;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
 		xe_perf_device(fd, xe_device, sizeof(xe_device));
 		num_engines = xe_number_engines(fd);
@@ -1155,7 +1155,7 @@ igt_main
 	igt_subtest_group {
 		int render_fd;
 
-		igt_fixture {
+		igt_fixture() {
 			render_fd = __drm_open_driver_render(DRIVER_XE);
 			igt_require(render_fd);
 		}
@@ -1172,14 +1172,14 @@ igt_main
 		test_each_engine("engine-activity-render-node-load-idle", render_fd, eci)
 			engine_activity(render_fd, eci, TEST_LOAD | TEST_TRAILING_IDLE);
 
-		igt_fixture
+		igt_fixture()
 			drm_close_driver(render_fd);
 	}
 
 	igt_subtest_group {
 		unsigned int num_fns;
 
-		igt_fixture
+		igt_fixture()
 			num_fns = enable_and_provision_vfs(fd) + 1;
 
 		igt_describe("Validate engine activity on all functions");
@@ -1198,7 +1198,7 @@ igt_main
 				engine_activity_fn(fd, eci, fn);
 		}
 
-		igt_fixture
+		igt_fixture()
 			unprovision_and_disable_vfs(fd);
 	}
 
@@ -1206,7 +1206,7 @@ igt_main
 		bool has_freq0_node, needs_freq_restore = false;
 		uint32_t *stash_min, *stash_max;
 
-		igt_fixture {
+		igt_fixture() {
 			has_freq0_node = xe_sysfs_gt_has_node(fd, 0, "freq0");
 		}
 
@@ -1226,13 +1226,13 @@ igt_main
 			}
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			if (needs_freq_restore)
 				restore_gt_freq(fd, stash_min, stash_max);
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		close(fd);
 	}
 }
diff --git a/tests/intel/xe_prime_self_import.c b/tests/intel/xe_prime_self_import.c
index ba171802240b..2fc73ddeb0c0 100644
--- a/tests/intel/xe_prime_self_import.c
+++ b/tests/intel/xe_prime_self_import.c
@@ -532,7 +532,7 @@ igt_main
 	int i;
 	int fd;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
 	}
 
@@ -541,6 +541,6 @@ igt_main
 			tests[i].fn();
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
index 98f06ae13457..88db5cecc3cf 100644
--- a/tests/intel/xe_pxp.c
+++ b/tests/intel/xe_pxp.c
@@ -1107,7 +1107,7 @@ igt_main
 	bool pxp_supported = true;
 	drmModeResPtr res;
 
-	igt_fixture {
+	igt_fixture() {
 		xe_fd = drm_open_driver(DRIVER_XE);
 		igt_require(xe_has_engine_class(xe_fd, DRM_XE_ENGINE_CLASS_RENDER));
 		pxp_supported = is_pxp_hw_supported(xe_fd);
@@ -1176,7 +1176,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		drmModeFreeResources(res);
 		if (!pxp_supported)
 			drm_close_driver(xe_fd);
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 928daaf5875d..6474ba0b8424 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -1144,7 +1144,7 @@ igt_main
 	}, *f;
 	int xe, gpu_count;
 
-	igt_fixture
+	igt_fixture()
 		xe = drm_open_driver(DRIVER_XE);
 
 	for (f = funcs; f->name; f++) {
@@ -1152,7 +1152,7 @@ igt_main
 			f->func(xe);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		drm_close_driver(xe);
 		gpu_count = drm_prepare_filtered_multigpu(DRIVER_XE);
 	}
diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
index ae2bb6f5901c..6a2ef4fe96e9 100644
--- a/tests/intel/xe_render_copy.c
+++ b/tests/intel/xe_render_copy.c
@@ -695,7 +695,7 @@ igt_main_args("dpiW:H:", NULL, help_str, opt_handler, NULL)
 		{ NULL },
 	};
 
-	igt_fixture {
+	igt_fixture() {
 		xe = drm_open_driver(DRIVER_XE);
 
 		/* As some cards don't have render, we should skip these. */
@@ -729,7 +729,7 @@ igt_main_args("dpiW:H:", NULL, help_str, opt_handler, NULL)
 			render_stress_copy(xe, set, s->nparallel_copies_per_engine);
 		}
 
-	igt_fixture {
+	igt_fixture() {
 		buf_ops_destroy(bops);
 		drm_close_driver(xe);
 	}
diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index ee2d0ec3fd0e..168b604ac3f5 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -533,7 +533,7 @@ igt_main
 	int gt, class;
 	struct igt_collection *regions;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
 		regions = xe_get_memory_region_set(fd, DRM_XE_MEM_REGION_CLASS_SYSMEM,
 						   DRM_XE_MEM_REGION_CLASS_VRAM);
@@ -576,6 +576,6 @@ igt_main
 				xe_spin_mem_copy(fd, hwe, regions);
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/intel/xe_sriov_auto_provisioning.c b/tests/intel/xe_sriov_auto_provisioning.c
index 451c3c5ca6c1..1b13eb7f8f65 100644
--- a/tests/intel/xe_sriov_auto_provisioning.c
+++ b/tests/intel/xe_sriov_auto_provisioning.c
@@ -328,7 +328,7 @@ igt_main_args("", long_opts, help_str, opts_handler, NULL)
 		{ NULL },
 	};
 
-	igt_fixture {
+	igt_fixture() {
 		struct xe_sriov_provisioned_range *ranges;
 		int ret;
 
@@ -432,7 +432,7 @@ igt_main_args("", long_opts, help_str, opts_handler, NULL)
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_sriov_disable_vfs(pf_fd);
 		/* abort to avoid execution of next tests with enabled VFs */
 		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0, "Failed to disable VF(s)");
diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index 3e5835487f3a..608e306ed0e6 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -1028,7 +1028,7 @@ igt_main
 	int pf_fd;
 	bool autoprobe;
 
-	igt_fixture {
+	igt_fixture() {
 		pf_fd = drm_open_driver(DRIVER_XE);
 		igt_require(igt_sriov_is_pf(pf_fd));
 		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
@@ -1063,7 +1063,7 @@ igt_main
 		clear_tests(pf_fd, 1, execute_parallel_flr_twice);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_sriov_disable_vfs(pf_fd);
 		/* abort to avoid execution of next tests with enabled VFs */
 		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0, "Failed to disable VF(s)");
diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
index 5e8c877557eb..e2ee96c72901 100644
--- a/tests/intel/xe_sriov_scheduling.c
+++ b/tests/intel/xe_sriov_scheduling.c
@@ -889,7 +889,7 @@ igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
 	int pf_fd;
 	bool autoprobe;
 
-	igt_fixture {
+	igt_fixture() {
 		pf_fd = drm_open_driver(DRIVER_XE);
 		igt_require(igt_sriov_is_pf(pf_fd));
 		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
@@ -922,7 +922,7 @@ igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
 				nonpreempt_engine_resets(pf_fd, vf, &subm_opts);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		set_vfs_scheduling_params(pf_fd, igt_sriov_get_total_vfs(pf_fd),
 					  &(struct vf_sched_params){});
 		xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
diff --git a/tests/intel/xe_sriov_vram.c b/tests/intel/xe_sriov_vram.c
index 6c3c8e0314ba..75eb03e7b6bc 100644
--- a/tests/intel/xe_sriov_vram.c
+++ b/tests/intel/xe_sriov_vram.c
@@ -344,7 +344,7 @@ igt_main_args("", long_opts, help_str, opts_handler, NULL)
 		{ NULL },
 	};
 
-	igt_fixture {
+	igt_fixture() {
 		pf_fd = drm_open_driver(DRIVER_XE);
 		igt_require(xe_has_vram(pf_fd));
 		igt_require(igt_sriov_is_pf(pf_fd));
@@ -395,7 +395,7 @@ igt_main_args("", long_opts, help_str, opts_handler, NULL)
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_sriov_disable_vfs(pf_fd);
 		/* abort to avoid execution of next tests with enabled VFs */
 		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0, "Failed to disable VF(s)");
diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
index f2e15114dd90..dfdd14738dfa 100644
--- a/tests/intel/xe_survivability.c
+++ b/tests/intel/xe_survivability.c
@@ -213,7 +213,7 @@ igt_main
 	struct pci_device *pci_xe;
 	bool vf_device;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
 		igt_require(IS_BATTLEMAGE(intel_get_drm_devid(fd)));
 		vf_device = intel_is_vf_device(fd);
@@ -258,7 +258,7 @@ igt_main
 		igt_debugfs_write(fd, "inject_csc_hw_error/times", "1");
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_fs_remove_dir(configfs_fd, bus_addr);
 		close(configfs_device_fd);
 		close(configfs_fd);
diff --git a/tests/intel/xe_sysfs_defaults.c b/tests/intel/xe_sysfs_defaults.c
index f21ae94e633e..3a221375e82d 100644
--- a/tests/intel/xe_sysfs_defaults.c
+++ b/tests/intel/xe_sysfs_defaults.c
@@ -63,7 +63,7 @@ igt_main
 	int xe, sys_fd;
 	int gt;
 
-	igt_fixture {
+	igt_fixture() {
 		xe = drm_open_driver(DRIVER_XE);
 		xe_device_get(xe);
 
@@ -89,7 +89,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		xe_device_put(xe);
 		close(xe);
 	}
diff --git a/tests/intel/xe_sysfs_preempt_timeout.c b/tests/intel/xe_sysfs_preempt_timeout.c
index ff58c4d49dcf..ea0ed13d3319 100644
--- a/tests/intel/xe_sysfs_preempt_timeout.c
+++ b/tests/intel/xe_sysfs_preempt_timeout.c
@@ -192,7 +192,7 @@ igt_main
 	unsigned int pts[MAX_GTS][XE_MAX_ENGINE_INSTANCE];
 	int *engine_list[MAX_GTS];
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
 
 		sys_fd = igt_sysfs_open(fd);
@@ -236,7 +236,7 @@ igt_main
 			}
 		}
 	}
-	igt_fixture {
+	igt_fixture() {
 		for (int i = 0; i < gt_count; i++) {
 			int *list, j = 0;
 
diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_scheduler.c
index 90d4ab8fdcb0..f134074aa414 100644
--- a/tests/intel/xe_sysfs_scheduler.c
+++ b/tests/intel/xe_sysfs_scheduler.c
@@ -246,7 +246,7 @@ igt_main
 	int engines_fd[MAX_GTS], gt_fd[MAX_GTS];
 	int *engine_list[MAX_GTS];
 
-	igt_fixture {
+	igt_fixture() {
 		xe = drm_open_driver(DRIVER_XE);
 		xe_device_get(xe);
 
@@ -300,7 +300,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		for (int gtn = gt_count - 1; gtn >= 0; gtn--) {
 			int *list, i = 0;
 
diff --git a/tests/intel/xe_sysfs_timeslice_duration.c b/tests/intel/xe_sysfs_timeslice_duration.c
index 456cb9a72544..ae6b9aa223cc 100644
--- a/tests/intel/xe_sysfs_timeslice_duration.c
+++ b/tests/intel/xe_sysfs_timeslice_duration.c
@@ -169,7 +169,7 @@ igt_main
 	unsigned int tds[MAX_GTS][XE_MAX_ENGINE_INSTANCE];
 	int *engine_list[MAX_GTS];
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
 
 		sys_fd = igt_sysfs_open(fd);
@@ -215,7 +215,7 @@ igt_main
 			}
 		}
 	}
-	igt_fixture {
+	igt_fixture() {
 		for (int i = 0; i < gt_count; i++) {
 			int *list, j = 0;
 
diff --git a/tests/intel/xe_tlb.c b/tests/intel/xe_tlb.c
index 9b920fe8adf4..712707270416 100644
--- a/tests/intel/xe_tlb.c
+++ b/tests/intel/xe_tlb.c
@@ -133,7 +133,7 @@ igt_main
 	int fd;
 	struct drm_xe_engine *engine;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
 	}
 
@@ -142,7 +142,7 @@ igt_main
 		tlb_invalidation(fd, &engine->instance);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		drm_close_driver(fd);
 	}
 }
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 6a3950ba9b1a..523c2158e721 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -2562,7 +2562,7 @@ igt_main
                 { }
         };
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
 
 		xe_for_each_engine(fd, hwe)
@@ -2850,6 +2850,6 @@ igt_main
 		test_oom(fd);
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index 5fcd4fc74a6e..ee02732a815f 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -279,7 +279,7 @@ igt_main
 {
 	int fd;
 
-	igt_fixture
+	igt_fixture()
 		fd = drm_open_driver(DRIVER_XE);
 
 	igt_subtest("reltime")
@@ -300,6 +300,6 @@ igt_main
 	igt_subtest("exec_queue-reset-wait")
 		exec_queue_reset_wait(fd);
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index 7fc7ca9ebf69..c3c81960ae42 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -214,7 +214,7 @@ igt_main
 	int fd;
 	char pci_slot[NAME_MAX];
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
 		igt_device_get_pci_slot_name(fd, pci_slot);
 	}
@@ -300,7 +300,7 @@ igt_main
 		igt_assert_f(str[0] != '\0', "Failed to read wedged_mode from debugfs!\n");
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		if (igt_debugfs_exists(fd, "fail_gt_reset/probability", O_RDWR)) {
 			igt_debugfs_write(fd, "fail_gt_reset/probability", "0");
 			igt_debugfs_write(fd, "fail_gt_reset/times", "1");
diff --git a/tests/kms_3d.c b/tests/kms_3d.c
index 86254cdcbf5b..b4e662bfd73f 100644
--- a/tests/kms_3d.c
+++ b/tests/kms_3d.c
@@ -48,7 +48,7 @@ igt_main
 	const struct edid *edid;
 	int mode_count, connector_id;
 
-	igt_fixture {
+	igt_fixture() {
 		drm_fd = drm_open_driver_master(DRIVER_ANY);
 
 		res = drmModeGetResources(drm_fd);
@@ -127,7 +127,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		if (connector) {
 			kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_UNSPECIFIED);
 			kmstest_force_edid(drm_fd, connector, NULL);
diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index 268e4e0e4488..3f9c5fef4121 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -215,7 +215,7 @@ static void invalid_tests(int fd)
 	f.pixel_format = DRM_FORMAT_XRGB8888;
 	f.pitches[0] = 512*4;
 
-	igt_fixture {
+	igt_fixture() {
 		gem_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
 			DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, NULL, NULL, NULL);
 		igt_assert(gem_bo);
@@ -413,7 +413,7 @@ static void invalid_tests(int fd)
 			 count);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		gem_close(fd, gem_bo);
 		gem_close(fd, gem_bo_small);
 	}
@@ -430,7 +430,7 @@ static void pitch_tests(int fd)
 	f.pixel_format = DRM_FORMAT_XRGB8888;
 	f.pitches[0] = 1024*4;
 
-	igt_fixture {
+	igt_fixture() {
 		gem_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
 			DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, NULL, NULL, NULL);
 		igt_assert(gem_bo);
@@ -462,7 +462,7 @@ static void pitch_tests(int fd)
 		}
 	}
 
-	igt_fixture
+	igt_fixture()
 		gem_close(fd, gem_bo);
 }
 
@@ -478,7 +478,7 @@ static void tiling_tests(int fd)
 	f.pitches[0] = 1024*4;
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			igt_require_intel(fd);
 			tiled_x_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
 				DRM_FORMAT_XRGB8888, I915_FORMAT_MOD_X_TILED,
@@ -543,7 +543,7 @@ static void tiling_tests(int fd)
 			do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EINVAL);
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			gem_close(fd, tiled_x_bo);
 			gem_close(fd, tiled_y_bo);
 		}
@@ -573,7 +573,7 @@ static void size_tests(int fd)
 	f_8.pixel_format = DRM_FORMAT_C8;
 	f_8.pitches[0] = 1024*2;
 
-	igt_fixture {
+	igt_fixture() {
 		gem_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
 			DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, NULL, NULL, NULL);
 		igt_assert(gem_bo);
@@ -659,7 +659,7 @@ static void size_tests(int fd)
 	}
 
 
-	igt_fixture {
+	igt_fixture() {
 		gem_close(fd, gem_bo);
 		gem_close(fd, gem_bo_small);
 	}
@@ -669,7 +669,7 @@ static void addfb25_tests(int fd)
 {
 	struct drm_mode_fb_cmd2 f = {};
 
-	igt_fixture {
+	igt_fixture() {
 		gem_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
 			DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, NULL, NULL, NULL);
 		igt_assert(gem_bo);
@@ -693,7 +693,7 @@ static void addfb25_tests(int fd)
 		do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EINVAL);
 	}
 
-	igt_fixture
+	igt_fixture()
 		f.flags = DRM_MODE_FB_MODIFIERS;
 
 	igt_describe("Test that addfb2 call fails correctly for irrelevant modifier");
@@ -705,7 +705,7 @@ static void addfb25_tests(int fd)
 	}
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			igt_require_intel(fd);
 			if (is_i915_device(fd)) {
 				igt_require(gem_available_fences(fd) > 0);
@@ -743,7 +743,7 @@ static void addfb25_tests(int fd)
 		}
 	}
 
-	igt_fixture
+	igt_fixture()
 		gem_close(fd, gem_bo);
 }
 
@@ -751,7 +751,7 @@ static void addfb25_ytile(int fd)
 {
 	struct drm_mode_fb_cmd2 f = {};
 
-	igt_fixture {
+	igt_fixture() {
 		gem_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
 			DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, NULL, NULL, NULL);
 		igt_assert(gem_bo);
@@ -807,7 +807,7 @@ static void addfb25_ytile(int fd)
 		f.fb_id = 0;
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		gem_close(fd, gem_bo);
 		gem_close(fd, gem_bo_small);
 	}
@@ -817,7 +817,7 @@ static void addfb25_4tile(int fd)
 {
 	struct drm_mode_fb_cmd2 f = {};
 
-	igt_fixture {
+	igt_fixture() {
 		gem_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
 				DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, NULL, NULL, NULL);
 		igt_assert(gem_bo);
@@ -847,7 +847,7 @@ static void addfb25_4tile(int fd)
 		f.fb_id = 0;
 	}
 
-	igt_fixture
+	igt_fixture()
 		gem_close(fd, gem_bo);
 }
 
@@ -863,7 +863,7 @@ static void prop_tests(int fd)
 	f.pixel_format = DRM_FORMAT_XRGB8888;
 	f.pitches[0] = 1024*4;
 
-	igt_fixture {
+	igt_fixture() {
 		gem_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
 			DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, NULL, NULL, NULL);
 		igt_assert(gem_bo);
@@ -910,7 +910,7 @@ static void prop_tests(int fd)
 		do_ioctl_err(fd, DRM_IOCTL_MODE_OBJ_SETPROPERTY, &set_prop, EINVAL);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id);
 		gem_close(fd, gem_bo);
 	}
@@ -925,7 +925,7 @@ static void master_tests(int fd)
 	f.pixel_format = DRM_FORMAT_XRGB8888;
 	f.pitches[0] = 1024*4;
 
-	igt_fixture {
+	igt_fixture() {
 		gem_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
 			DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, NULL, NULL, NULL);
 		igt_assert(gem_bo);
@@ -951,7 +951,7 @@ static void master_tests(int fd)
 		igt_device_set_master(fd);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id);
 		gem_close(fd, gem_bo);
 	}
@@ -984,7 +984,7 @@ int fd;
 
 igt_main
 {
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver_master(DRIVER_ANY);
 		igt_require(has_addfb2_iface(fd));
 	}
@@ -1005,24 +1005,24 @@ igt_main
 		tiling_tests(fd);
 
 	igt_subtest_group {
-		igt_fixture
+		igt_fixture()
 			igt_display_require(&display, fd);
 
 		size_tests(fd);
 
 		addfb25_tests(fd);
 
-		igt_fixture
+		igt_fixture()
 			igt_require_intel(fd);
 
 		addfb25_ytile(fd);
 
 		addfb25_4tile(fd);
 
-		igt_fixture
+		igt_fixture()
 			igt_display_fini(&display);
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index cbe38889e97e..ae64574a89fa 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -1069,7 +1069,7 @@ igt_main
 {
 	int i;
 
-	igt_fixture {
+	igt_fixture() {
 		int ret;
 
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
@@ -1088,7 +1088,7 @@ igt_main
 
 	igt_describe("Verify the async flip functionality and the fps during async flips");
 	igt_subtest_group {
-		igt_fixture
+		igt_fixture()
 			require_monotonic_timestamp(data.drm_fd);
 
 		igt_describe("Wait for page flip events in between successive asynchronous flips");
@@ -1272,7 +1272,7 @@ igt_main
 		data.single_pipe = false;
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		for (i = 0; i < NUM_FBS; i++) {
 			igt_remove_fb(data.drm_fd, &data.bufs[i]);
 			igt_remove_fb(data.drm_fd, &data.bufs_overlay[i]);
diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 474df3fa4f6b..ab871edd3ba8 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -1404,7 +1404,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	igt_output_t *output = NULL;
 	data_t data = { 0 };
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&data.display, data.drm_fd);
@@ -1638,7 +1638,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interruptible.c
index 19fbcab99774..2983b14f7df3 100644
--- a/tests/kms_atomic_interruptible.c
+++ b/tests/kms_atomic_interruptible.c
@@ -327,7 +327,7 @@ igt_main
 	igt_output_t *output;
 	enum pipe pipe;
 
-	igt_fixture {
+	igt_fixture() {
 		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
 		kmstest_set_vt_graphics_mode();
@@ -424,7 +424,7 @@ igt_main
 	}
 
 	/* TODO: legacy gamma_set/get, object set/getprop, getcrtc, getconnector */
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&display);
 		drm_close_driver(display.drm_fd);
 	}
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 419afe4dd5ce..bb17cb70d0ee 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -1174,7 +1174,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	int i, j, count = 0;
 	int pipe_count = 0;
 
-	igt_fixture {
+	igt_fixture() {
 		unsigned int debug_mask_if_ci = DRM_UT_KMS;
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
@@ -1267,7 +1267,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index ca05695d3260..43c4439ced8b 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -266,7 +266,7 @@ igt_main
 
 	memset(&data, 0, sizeof(data));
 
-	igt_fixture
+	igt_fixture()
 	{
 		data.fd = drm_open_driver_master(DRIVER_ANY);
 
@@ -297,7 +297,7 @@ igt_main
         }
 
 
-	igt_fixture
+	igt_fixture()
 	{
 		igt_display_fini(&data.display);
 	}
diff --git a/tests/kms_color.c b/tests/kms_color.c
index c424083b7fd4..ab3c0caea475 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -1157,7 +1157,7 @@ run_tests_for_pipe(data_t *data)
 		}
 	}
 
-	igt_fixture
+	igt_fixture()
 		igt_require(data->display.is_atomic);
 
 	igt_describe("Verify that deep color works correctly");
@@ -1175,7 +1175,7 @@ igt_main
 {
 	data_t data = {};
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		if (is_intel_device(data.drm_fd))
 			data.devid = intel_get_drm_devid(data.drm_fd);
@@ -1190,7 +1190,7 @@ igt_main
 	igt_subtest_group
 		run_invalid_tests_for_pipe(&data);
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 3812290bacac..dff1247c51b9 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -389,7 +389,7 @@ static data_t data;
 
 igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&data.display, data.drm_fd);
@@ -402,7 +402,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 
 	run_tests_for_pipe(&data);
 
-	igt_fixture {
+	igt_fixture() {
 		if (is_intel_device(data.drm_fd))
 			intel_allocator_multiprocess_stop();
 		igt_display_fini(&data.display);
diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 2422793b14e8..38de54da1547 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -982,7 +982,7 @@ static const struct {
 
 igt_main
 {
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		igt_display_require(&data.display, data.drm_fd);
 		igt_display_require_output(&data.display);
@@ -996,7 +996,7 @@ igt_main
 	}
 
 	igt_subtest_group {
-		igt_fixture
+		igt_fixture()
 			igt_require(data.display.is_atomic);
 
 		for (int i = 0; i < ARRAY_SIZE(subtests); i++) {
@@ -1019,7 +1019,7 @@ igt_main
 	}
 
 	igt_subtest_group {
-		igt_fixture
+		igt_fixture()
 			igt_require(data.display.is_atomic);
 
 		for (int i = 0; i < ARRAY_SIZE(mst_subtests); i++) {
@@ -1032,7 +1032,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		test_content_protection_cleanup();
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 239bbd7b7a8b..1cbf26f55663 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -989,7 +989,7 @@ static void run_size_tests(data_t *data, int w, int h)
 		snprintf(name, sizeof(name), "%dx%d", w, h);
 	}
 
-	igt_fixture
+	igt_fixture()
 		create_cursor_fb(data, w, h);
 
 	for (i = 0; i < ARRAY_SIZE(size_tests); i++) {
@@ -1028,7 +1028,7 @@ static void run_size_tests(data_t *data, int w, int h)
 		}
 	}
 
-	igt_fixture
+	igt_fixture()
 		igt_remove_fb(data->drm_fd, &data->fb);
 }
 
@@ -1037,7 +1037,7 @@ static void run_tests_on_pipe(data_t *data)
 	enum pipe pipe;
 	int cursor_size;
 
-	igt_fixture {
+	igt_fixture() {
 		data->alpha = 1.0;
 		data->flags = 0;
 	}
@@ -1103,7 +1103,7 @@ static void run_tests_on_pipe(data_t *data)
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_create_color_fb(data->drm_fd, data->cursor_max_w, data->cursor_max_h,
 				DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR,
 				1.f, 1.f, 1.f, &data->timed_fb[0]);
@@ -1151,7 +1151,7 @@ static void run_tests_on_pipe(data_t *data)
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_remove_fb(data->drm_fd, &data->timed_fb[0]);
 		igt_remove_fb(data->drm_fd, &data->timed_fb[1]);
 
@@ -1200,7 +1200,7 @@ static void run_tests_on_pipe(data_t *data)
 		data->flags = 0;
 	}
 
-	igt_fixture
+	igt_fixture()
 		igt_remove_fb(data->drm_fd, &data->fb);
 
 	igt_describe("Check that sizes declared in SIZE_HINTS are accepted.");
@@ -1266,7 +1266,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	uint64_t cursor_width = 64, cursor_height = 64;
 	int ret;
 
-	igt_fixture {
+	igt_fixture() {
 		enum pipe pipe;
 
 		last_pipe = 0;
@@ -1303,7 +1303,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	igt_subtest_group
 		run_tests_on_pipe(&data);
 
-	igt_fixture {
+	igt_fixture() {
 		if (data.pipe_crc != NULL) {
 			igt_pipe_crc_stop(data.pipe_crc);
 			igt_pipe_crc_free(data.pipe_crc);
diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index 27bee448223f..7ea1439b38d3 100644
--- a/tests/kms_cursor_edge_walk.c
+++ b/tests/kms_cursor_edge_walk.c
@@ -355,7 +355,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	};
 	int i;
 
-	igt_fixture {
+	igt_fixture() {
 		int ret;
 		enum pipe pipe;
 
@@ -387,7 +387,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
 		for (data.curw = 64; data.curw <= 256; data.curw *= 2) {
 			data.curh = data.curw;
-			igt_fixture
+			igt_fixture()
 				igt_require(data.curw <= max_curw && data.curh <= max_curh);
 
 			igt_describe_f("Checking cursor size %dx%d by walking %s of screen",
@@ -415,7 +415,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 865853c38fac..d5d564410756 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1839,7 +1839,7 @@ igt_main
 		"atomic-transitions-varying-size"
 	};
 
-	igt_fixture {
+	igt_fixture() {
 		unsigned int debug_mask_if_ci = DRM_UT_KMS;
 		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
@@ -1892,7 +1892,7 @@ igt_main
 	igt_describe("Test checks how many cursor updates we can fit between vblanks "
 		    "on all pipes with different modes, priority and number of processes");
 	igt_subtest_group {
-		igt_fixture
+		igt_fixture()
 			igt_display_require_output(&display);
 
 		igt_subtest("nonblocking-modeset-vs-cursor-atomic")
@@ -1905,7 +1905,7 @@ igt_main
 	igt_describe("Test changes the cursor hotspot and checks that the "
 		      "property is updated accordignly");
 	igt_subtest_group {
-		igt_fixture
+		igt_fixture()
 			igt_display_require_output(&display);
 
 		igt_subtest("modeset-atomic-cursor-hotspot") {
@@ -1930,7 +1930,7 @@ igt_main
 			{ "2x-long-nonblocking-modeset-vs-cursor-atomic", 15, true, true },
 		};
 
-		igt_fixture
+		igt_fixture()
 			igt_display_require_output(&display);
 
 		for (i = 0; i < ARRAY_SIZE(tests); i++) {
@@ -1956,7 +1956,7 @@ igt_main
 			{ "2x-long-cursor-vs-flip-atomic", 50, true },
 		};
 
-		igt_fixture
+		igt_fixture()
 			igt_display_require_output(&display);
 
 		for (i = 0; i < ARRAY_SIZE(tests); i++) {
@@ -1969,7 +1969,7 @@ igt_main
 
 	igt_describe("Test will first does a page flip and then cursor update");
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			igt_require_pipe_crc(display.drm_fd);
 			igt_display_require_output(&display);
 		}
@@ -1983,7 +1983,7 @@ igt_main
 
 	igt_describe("this test perform a busy bo update followed by a cursor update");
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			igt_require_intel(display.drm_fd);
 			igt_require_pipe_crc(display.drm_fd);
 			igt_display_require_output(&display);
@@ -2013,7 +2013,7 @@ igt_main
 		};
 		int t;
 
-		igt_fixture
+		igt_fixture()
 			igt_display_require_output(&display);
 
 		for (i = 0; i <= flip_test_last; i++) {
@@ -2056,7 +2056,7 @@ igt_main
 			{ "cursorB-vs-flipB", 1, 1, 10 },
 		};
 
-		igt_fixture
+		igt_fixture()
 			igt_display_require_output(&display);
 
 		for (i = 0; i <= flip_test_last; i++) {
@@ -2076,7 +2076,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		if (intel_psr2_restore)
 			i915_psr2_sel_fetch_restore(display.drm_fd, NULL);
 		igt_display_fini(&display);
diff --git a/tests/kms_debugfs.c b/tests/kms_debugfs.c
index 570ad1c0ce60..45ad1440fbd0 100644
--- a/tests/kms_debugfs.c
+++ b/tests/kms_debugfs.c
@@ -100,7 +100,7 @@ igt_main
 	igt_display_t display;
 	int fd = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver_master(DRIVER_ANY);
 		debugfs = igt_debugfs_dir(fd);
 		igt_require(debugfs >= 0);
@@ -126,7 +126,7 @@ igt_main
 		igt_dir_process_files_simple(debugfs);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&display);
 		close(debugfs);
 		drm_close_driver(fd);
diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index d6494a85b601..59bda92ff77e 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -233,7 +233,7 @@ igt_main
 	igt_output_t *output;
 	data_t data;
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&data.display, data.drm_fd);
@@ -252,7 +252,7 @@ igt_main
 		run_extendedmode_test(&data);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 	}
 }
diff --git a/tests/kms_dither.c b/tests/kms_dither.c
index 426caaaa8557..f045cdf130b0 100644
--- a/tests/kms_dither.c
+++ b/tests/kms_dither.c
@@ -249,7 +249,7 @@ igt_main
 	int i;
 	data_t data = { 0 };
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
 
@@ -271,7 +271,7 @@ igt_main
 					tests[i].output_bpc);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
index a4f96e2a7db9..c5b33aaa4eef 100644
--- a/tests/kms_feature_discovery.c
+++ b/tests/kms_feature_discovery.c
@@ -75,13 +75,13 @@ igt_main {
 	igt_fd_t(debugfs_fd);
 	igt_fd_t(fd);
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver_master(DRIVER_ANY);
 		debugfs_fd = igt_debugfs_dir(fd);
 	}
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			igt_display_require(&display, fd);
 		}
 
@@ -95,7 +95,7 @@ igt_main {
 			igt_output_t *output;
 			enum pipe pipe;
 
-			igt_fixture {
+			igt_fixture() {
 				/* this is what most of the 2x tests are doing */
 				for_each_pipe(&display, pipe) {
 					for_each_valid_output_on_pipe(&display, pipe, output) {
diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index e5e685438615..787c23100366 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -2092,7 +2092,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	};
 	int i;
 
-	igt_fixture {
+	igt_fixture() {
 		drm_fd = drm_open_driver_master(DRIVER_ANY);
 
 		igt_display_require(&display, drm_fd);
@@ -2167,7 +2167,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	}
 	igt_stop_signal_helper();
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&display);
 		drm_close_driver(drm_fd);
 	}
diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c
index 71b58b4dfe31..d417c2e5438e 100644
--- a/tests/kms_flip_event_leak.c
+++ b/tests/kms_flip_event_leak.c
@@ -109,7 +109,7 @@ igt_main
 	igt_output_t *output;
 	enum pipe pipe;
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
 
@@ -131,7 +131,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
diff --git a/tests/kms_force_connector_basic.c b/tests/kms_force_connector_basic.c
index f554e997c47f..19909084c445 100644
--- a/tests/kms_force_connector_basic.c
+++ b/tests/kms_force_connector_basic.c
@@ -336,7 +336,7 @@ igt_main_args("", long_opts, help_str, opt_handler, NULL)
 		  prune_stale_modes }
 	};
 
-	igt_fixture {
+	igt_fixture() {
 		unsigned connector_id = 0;
 
 		drm_fd = drm_open_driver_master(DRIVER_ANY);
@@ -407,7 +407,7 @@ end:
 			tests[i].func(drm_fd, connector);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		drmModeFreeConnector(connector);
 		drm_close_driver(drm_fd);
 
diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
index ebaa229d212e..0f89c54728cc 100644
--- a/tests/kms_getfb.c
+++ b/tests/kms_getfb.c
@@ -144,7 +144,7 @@ static void test_handle_input(struct igt_display *display)
 {
 	struct igt_fb fb;
 
-	igt_fixture {
+	igt_fixture() {
 		igt_create_fb(display->drm_fd, 1024, 1024,
 			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
 			      &fb);
@@ -192,7 +192,7 @@ static void test_handle_input(struct igt_display *display)
 			     ENOENT);
 	}
 
-	igt_fixture
+	igt_fixture()
 		igt_remove_fb(display->drm_fd, &fb);
 }
 
@@ -200,7 +200,7 @@ static void test_duplicate_handles(struct igt_display *display)
 {
 	struct igt_fb fb;
 
-	igt_fixture {
+	igt_fixture() {
 		igt_create_fb(display->drm_fd, 1024, 1024,
 			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
 			      &fb);
@@ -252,7 +252,7 @@ static void test_duplicate_handles(struct igt_display *display)
 		igt_remove_fb(display->drm_fd, &nv12_fb);
 	}
 
-	igt_fixture
+	igt_fixture()
 		igt_remove_fb(display->drm_fd, &fb);
 }
 
@@ -260,7 +260,7 @@ static void test_getfb2(struct igt_display *display)
 {
 	struct igt_fb fb;
 
-	igt_fixture {
+	igt_fixture() {
 		struct drm_mode_fb_cmd2 get = {};
 
 		igt_create_fb(display->drm_fd, 1024, 1024,
@@ -363,7 +363,7 @@ static void test_getfb2(struct igt_display *display)
 		gem_close(display->drm_fd, cmd.handles[0]);
 	}
 
-	igt_fixture
+	igt_fixture()
 		igt_remove_fb(display->drm_fd, &fb);
 }
 
@@ -371,7 +371,7 @@ static void test_handle_protection(void) {
 	int non_master_fd;
 	struct drm_mode_fb_cmd2 non_master_add = {};
 
-	igt_fixture {
+	igt_fixture() {
 		non_master_fd = drm_open_driver(DRIVER_ANY);
 
 		non_master_add.width = 1024;
@@ -417,7 +417,7 @@ static void test_handle_protection(void) {
 		igt_waitchildren();
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		do_ioctl(non_master_fd, DRM_IOCTL_MODE_RMFB, &non_master_add.fb_id);
 		gem_close(non_master_fd, non_master_add.handles[0]);
 
@@ -430,7 +430,7 @@ igt_main
 	int fd;
 	igt_display_t display;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver_master(DRIVER_ANY);
 		igt_require(has_getfb_iface(fd));
 		igt_display_require(&display, fd);
@@ -448,7 +448,7 @@ igt_main
 	igt_subtest_group
 		test_handle_protection();
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&display);
 		drm_close_driver(fd);
 	}
diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c
index 625708ddd168..d6aa1b17e60a 100644
--- a/tests/kms_hdmi_inject.c
+++ b/tests/kms_hdmi_inject.c
@@ -217,7 +217,7 @@ igt_main
 	drmModeRes *res;
 	drmModeConnector *connector;
 
-	igt_fixture {
+	igt_fixture() {
 		drm_fd = drm_open_driver_master(DRIVER_ANY);
 
 		res = drmModeGetResources(drm_fd);
@@ -239,7 +239,7 @@ igt_main
 	igt_subtest("inject-audio")
 		hdmi_inject_audio(drm_fd, connector);
 
-	igt_fixture {
+	igt_fixture() {
 		drmModeFreeConnector(connector);
 		drmModeFreeResources(res);
 		drm_close_driver(drm_fd);
diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 40187275bf61..7dbd10eeb4ef 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -803,7 +803,7 @@ igt_main
 {
 	data_t data = {};
 
-	igt_fixture {
+	igt_fixture() {
 		data.fd = drm_open_driver_master(DRIVER_ANY);
 
 		kmstest_set_vt_graphics_mode();
@@ -850,7 +850,7 @@ igt_main
 	igt_subtest_with_dynamic("invalid-hdr")
 		test_hdr(&data, TEST_INVALID_HDR);
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.fd);
 	}
diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index 981b6ceb6c9b..a404526cff88 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -340,7 +340,7 @@ igt_main
 	enum pipe pipe;
 	igt_output_t *output;
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
 		kmstest_set_vt_graphics_mode();
@@ -373,7 +373,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 		igt_reset_connectors();
 		drmModeFreeResources(data.res);
diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index e217f81d0510..f8c3dda99c24 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -1245,7 +1245,7 @@ igt_main
 	igt_output_t *output;
 	igt_display_t *display = &data.master.display;
 
-	igt_fixture {
+	igt_fixture() {
 		data.master.fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(display, data.master.fd);
@@ -1282,7 +1282,7 @@ igt_main
 			{ }
 		}, *f;
 
-		igt_fixture
+		igt_fixture()
 			igt_display_require_output(display);
 
 		for (f = funcs; f->name; f++) {
@@ -1343,7 +1343,7 @@ igt_main
 			lease_uevent(&data);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(display);
 		drm_close_driver(data.master.fd);
 	}
diff --git a/tests/kms_multipipe_modeset.c b/tests/kms_multipipe_modeset.c
index 69dc62e38fb9..e2a2969560d6 100644
--- a/tests/kms_multipipe_modeset.c
+++ b/tests/kms_multipipe_modeset.c
@@ -147,7 +147,7 @@ igt_main
 	data_t data;
 	drmModeResPtr res;
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
 
@@ -163,7 +163,7 @@ igt_main
 	igt_subtest("basic-max-pipe-crc-check")
 		test_multipipe(&data, res->count_crtcs);
 
-	igt_fixture {
+	igt_fixture() {
 		drmModeFreeResources(res);
 		igt_display_fini(&data.display);
 	}
diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
index 1db7f8e9a965..5375bb9af23f 100644
--- a/tests/kms_panel_fitting.c
+++ b/tests/kms_panel_fitting.c
@@ -285,7 +285,7 @@ igt_main
 {
 	data_t data = {};
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		igt_display_require(&data.display, data.drm_fd);
 		igt_display_require_output(&data.display);
@@ -295,14 +295,14 @@ igt_main
 	igt_subtest_with_dynamic("legacy")
 		test_panel_fitting(&data, TEST_LEGACY);
 
-	igt_fixture
+	igt_fixture()
 		igt_require(&data.display.is_atomic);
 
 	igt_describe("Tests panel fitting usages with atomic fastset.");
 	igt_subtest_with_dynamic("atomic-fastset")
 		test_panel_fitting(&data, TEST_ATOMIC);
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 9750d014cbb1..0a15799965e3 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -393,7 +393,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	int i;
 	last_pipe = 0;
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
 		kmstest_set_vt_graphics_mode();
@@ -499,7 +499,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 02d4da4cb511..d09bd361f142 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1453,7 +1453,7 @@ static data_t data;
 
 igt_main_args("", long_opts, help_str, opt_handler, &data)
 {
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
 		kmstest_set_vt_graphics_mode();
@@ -1464,7 +1464,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 	run_tests_for_pipe_plane(&data);
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index 696bb1e5eab3..2d033a4525ba 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -736,7 +736,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 {
 	data_t data = {};
 
-	igt_fixture {
+	igt_fixture() {
 		enum pipe pipe;
 
 		last_pipe = 0;
@@ -756,7 +756,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 
 	run_subtests(&data);
 
-	igt_fixture {
+	igt_fixture() {
 		remove_fbs(&data);
 		igt_display_reset(&data.display);
 		igt_display_commit2(&data.display, data.display.is_atomic ?
diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 9fa36bfd49b3..e2c174f23631 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -306,7 +306,7 @@ igt_main
 		  "with buffer larger than viewport used for display" },
 	};
 
-	igt_fixture {
+	igt_fixture() {
 		int ret;
 
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
@@ -360,7 +360,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index 4ed098e419a0..ea3813edf906 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -342,7 +342,7 @@ igt_main
 {
 	data_t data = {};
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		data.devid = is_intel_device(data.drm_fd) ?
 			intel_get_drm_devid(data.drm_fd) : 0;
@@ -363,7 +363,7 @@ igt_main
 			run_test(&data, subtests[i].modifier);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 4e6ca780a6ed..1921f120528f 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -631,7 +631,7 @@ struct option long_options[] = {
 
 igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
 		igt_require_pipe_crc(data.drm_fd);
@@ -664,7 +664,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 63d35d76b518..cdfcc60ef43b 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -1173,7 +1173,7 @@ static void invalid_parameter_tests(data_t *d)
 		},
 	};
 
-	igt_fixture {
+	igt_fixture() {
 		output = igt_get_single_output_for_pipe(&d->display, pipe);
 		igt_require(output);
 
@@ -1210,7 +1210,7 @@ static void invalid_parameter_tests(data_t *d)
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_remove_fb(d->drm_fd, &fb);
 		igt_output_set_pipe(output, PIPE_NONE);
 	}
@@ -1352,7 +1352,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	enum pipe pipe;
 	uint32_t ret = -EINVAL;
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		igt_display_require(&data.display, data.drm_fd);
 		data.devid = is_intel_device(data.drm_fd) ?
@@ -1614,7 +1614,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	igt_subtest_f("2x-scaler-multi-pipe")
 		test_scaler_with_multi_pipe_plane(&data);
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index aa3cc386cc05..6f8c24e86a1b 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -558,7 +558,7 @@ igt_main
 	int second_fd_hybrid = -1;
 	bool first_output, second_output;
 
-	igt_fixture {
+	igt_fixture() {
 		kmstest_set_vt_graphics_mode();
 		/* ANY = anything that is not VGEM */
 		first_fd = __drm_open_driver_another(0, DRIVER_ANY);
@@ -568,7 +568,7 @@ igt_main
 
 	igt_describe("Hybrid GPU subtests");
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			second_fd_hybrid = __drm_open_driver_another(1, DRIVER_ANY);
 			igt_require(second_fd_hybrid >= 0);
 			second_output = has_connected_output(second_fd_hybrid);
@@ -621,7 +621,7 @@ igt_main
 			validate_d3_hot(second_fd_hybrid);
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			if (kms_poll_disabled)
 				kms_poll_state_restore();
 
@@ -631,7 +631,7 @@ igt_main
 
 	igt_describe("VGEM subtests");
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			second_fd_vgem = __drm_open_driver_another(1, DRIVER_VGEM);
 			igt_require(second_fd_vgem >= 0);
 			if (is_i915_device(first_fd))
@@ -649,10 +649,10 @@ igt_main
 					test_crc(second_fd_vgem, first_fd);
 		}
 
-		igt_fixture
+		igt_fixture()
 			drm_close_driver(second_fd_vgem);
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(first_fd);
 }
diff --git a/tests/kms_prop_blob.c b/tests/kms_prop_blob.c
index cc43088c2871..9548827d84f4 100644
--- a/tests/kms_prop_blob.c
+++ b/tests/kms_prop_blob.c
@@ -294,7 +294,7 @@ static void prop_tests(int fd)
 	struct drm_mode_obj_set_property set_prop = {};
 	uint64_t prop, prop_val, blob_id;
 
-	igt_fixture
+	igt_fixture()
 		blob_id = create_prop(fd);
 
 	get_props.props_ptr = (uintptr_t) &prop;
@@ -341,7 +341,7 @@ static void prop_tests(int fd)
 				    &set_prop) == -1 && errno == EINVAL);
 	}
 
-	igt_fixture
+	igt_fixture()
 		destroy_prop(fd, blob_id);
 }
 
@@ -349,7 +349,7 @@ igt_main
 {
 	int fd;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_ANY);
 		igt_require(fd >= 0);
 		igt_require_propblob(fd);
@@ -377,6 +377,6 @@ igt_main
 
 	prop_tests(fd);
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index b30387888768..68091e043b24 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -844,7 +844,7 @@ igt_main
 		  "Tests connector properties with atomic commit" },
 	};
 
-	igt_fixture {
+	igt_fixture() {
 		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
 		kmstest_set_vt_graphics_mode();
@@ -888,7 +888,7 @@ igt_main
 	}
 
 	igt_subtest_group {
-		igt_fixture
+		igt_fixture()
 			igt_require(display.is_atomic);
 
 		igt_describe("Test validates the properties of all planes, crtc and connectors with atomic commit");
@@ -896,7 +896,7 @@ igt_main
 			get_prop_sanity(&display, true);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&display);
 		drm_close_driver(display.drm_fd);
 	}
diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
index acda4b528cda..5a338ef733d7 100644
--- a/tests/kms_rmfb.c
+++ b/tests/kms_rmfb.c
@@ -206,7 +206,7 @@ igt_main
 	struct rmfb_data data = {};
 	int i, other_fd;
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		/*
 		 * Prevent fb from changing underneath so we can check by
@@ -227,7 +227,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 		drm_close_driver(other_fd);
diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index e187681414df..aac9d2038290 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -1221,7 +1221,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 	int gen = 0;
 
-	igt_fixture {
+	igt_fixture() {
 		data.gfx_fd = drm_open_driver_master(DRIVER_ANY);
 		if (is_intel_device(data.gfx_fd)) {
 			data.devid = intel_get_drm_devid(data.gfx_fd);
@@ -1287,7 +1287,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 	igt_describe("Tiling and Rotation test for gen 10+ for primary plane");
 	for (reflect_x = reflect_x_subtests; reflect_x->modifier; reflect_x++) {
-		igt_fixture
+		igt_fixture()
 			igt_require_intel(data.gfx_fd);
 
 		igt_subtest_f("primary-%s-tiled-reflect-x-%s",
@@ -1360,7 +1360,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.gfx_fd);
 	}
diff --git a/tests/kms_scaling_modes.c b/tests/kms_scaling_modes.c
index 47ed35c7ef25..b869639551dc 100644
--- a/tests/kms_scaling_modes.c
+++ b/tests/kms_scaling_modes.c
@@ -134,7 +134,7 @@ igt_main
 {
 	data_t data = {};
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		igt_require(data.drm_fd >= 0);
 
@@ -159,7 +159,7 @@ igt_main
 	igt_subtest_with_dynamic("scaling-mode-none")
 		test_scaling_mode(&data, DRM_MODE_SCALE_NONE);
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
index f9372431429e..635854460d73 100644
--- a/tests/kms_sequence.c
+++ b/tests/kms_sequence.c
@@ -294,7 +294,7 @@ igt_main
 		{ }
 	}, *m;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&data.display, fd);
@@ -327,7 +327,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		drm_close_driver(fd);
 	}
 }
diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 8892cb0f0d5e..586adc5d678d 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -1053,7 +1053,7 @@ igt_main_args("det:", NULL, help_str, opt_handler, NULL)
 	igt_assert_f(!(dry_run && filter_test_id),
 		     "only one of -d and -t is accepted\n");
 
-	igt_fixture {
+	igt_fixture() {
 		drm_fd = drm_open_driver_master(DRIVER_ANY);
 		if (!dry_run)
 			kmstest_set_vt_graphics_mode();
@@ -1076,7 +1076,7 @@ igt_main_args("det:", NULL, help_str, opt_handler, NULL)
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		drmModeFreeResources(drm_resources);
 		drm_close_driver(drm_fd);
 	}
diff --git a/tests/kms_sharpness_filter.c b/tests/kms_sharpness_filter.c
index ef3ce3995115..6248d1e897b7 100644
--- a/tests/kms_sharpness_filter.c
+++ b/tests/kms_sharpness_filter.c
@@ -558,7 +558,7 @@ data_t data = {};
 
 igt_main_args("l", NULL, help_str, opt_handler, &data)
 {
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
 		kmstest_set_vt_graphics_mode();
@@ -753,7 +753,7 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
index 1f53314081bb..eae9312d18c2 100644
--- a/tests/kms_tiled_display.c
+++ b/tests/kms_tiled_display.c
@@ -571,7 +571,7 @@ igt_main
 	data_t data = {0};
 	struct pollfd pfd = {0};
 	drmEventContext drm_event = {0};
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&data.display, data.drm_fd);
@@ -620,7 +620,7 @@ igt_main
 	}
 #endif
 
-	igt_fixture {
+	igt_fixture() {
 		free(data.conns);
 		kmstest_restore_vt_mode();
 		igt_display_fini(&data.display);
diff --git a/tests/kms_tv_load_detect.c b/tests/kms_tv_load_detect.c
index 03d0729ae483..c962a55d9724 100644
--- a/tests/kms_tv_load_detect.c
+++ b/tests/kms_tv_load_detect.c
@@ -46,7 +46,7 @@ igt_main
 	drmModeRes *res;
 	drmModeConnector *tv_connector = NULL, *temp;
 
-	igt_fixture {
+	igt_fixture() {
 		drm_fd = drm_open_driver_master(DRIVER_ANY);
 
 		res = drmModeGetResources(drm_fd);
@@ -95,7 +95,7 @@ igt_main
 		drmModeFreeConnector(temp);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		drmModeFreeConnector(tv_connector);
 		drmModeFreeResources(res);
 		drm_close_driver(drm_fd);
diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 2d9716575183..edbe3e961cbb 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -895,7 +895,7 @@ igt_main
 {
 	data_t data;
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		if (is_intel_device(data.drm_fd))
 			data.display_ver = intel_display_ver(intel_get_drm_devid(data.drm_fd));
@@ -909,7 +909,7 @@ igt_main
 
 	run_tests(&data);
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index 75cf9448fec9..34499e5c7d0d 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -627,7 +627,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	int fd;
 	data_t data;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&data.display, fd);
@@ -671,7 +671,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 
 	run_subtests(&data);
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(fd);
 	}
diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index d83aa2de1b71..804c0114ee8f 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -1146,7 +1146,7 @@ static data_t data;
 
 igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
 {
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
 		kmstest_set_vt_graphics_mode();
@@ -1185,7 +1185,7 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
 		run_vrr_test(&data, test_basic, TEST_MAXMIN);
 
 	igt_subtest_group {
-		igt_fixture
+		igt_fixture()
 			igt_require_intel(data.drm_fd);
 
 		igt_describe("Test to switch RR seamlessly without modeset.");
@@ -1222,7 +1222,7 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 1b81088d7ab3..f6f335ba17b0 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -537,7 +537,7 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 
 	memset(&display, 0, sizeof(display));
 
-	igt_fixture {
+	igt_fixture() {
 		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
 		kmstest_set_vt_graphics_mode();
@@ -701,7 +701,7 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 		igt_remove_fb(display.drm_fd, &output_fb);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		cleanup_writeback(&display, output);
 		igt_remove_fb(display.drm_fd, &input_fb);
 		igt_remove_fb(display.drm_fd, &input_fb_10bit);
diff --git a/tests/meta_test.c b/tests/meta_test.c
index c37610c70f21..2620982d0a6c 100644
--- a/tests/meta_test.c
+++ b/tests/meta_test.c
@@ -120,7 +120,7 @@ static void test_panic(void)
 igt_main
 {
 
-	igt_fixture {
+	igt_fixture() {
 		igt_skip_on_f(!getenv("IGT_CI_META_TEST"),
 			      "Only for meta-testing of CI systems");
 	}
diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
index d224a413cbf2..f9abffee82f2 100644
--- a/tests/msm/msm_mapping.c
+++ b/tests/msm/msm_mapping.c
@@ -267,7 +267,7 @@ igt_main
 	struct msm_device *dev = NULL;
 	struct msm_pipe *pipe = NULL;
 
-	igt_fixture {
+	igt_fixture() {
 		dev = igt_msm_dev_open();
 		pipe = igt_msm_pipe_open(dev, 0);
 	}
@@ -319,7 +319,7 @@ igt_main
 		do_mapping_test(pipe, "preempt_smmu_info ring0", false);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_msm_pipe_close(pipe);
 		igt_msm_dev_close(dev);
 	}
diff --git a/tests/msm/msm_recovery.c b/tests/msm/msm_recovery.c
index 7b6e3d76e087..e0cef1140f90 100644
--- a/tests/msm/msm_recovery.c
+++ b/tests/msm/msm_recovery.c
@@ -219,7 +219,7 @@ igt_main
 {
 	static struct msm_pipe *pipe = NULL;
 
-	igt_fixture {
+	igt_fixture() {
 		dev = igt_msm_dev_open();
 		pipe = igt_msm_pipe_open(dev, 0);
 		scratch_bo = igt_msm_bo_new(dev, 0x1000, MSM_BO_WC);
@@ -270,7 +270,7 @@ igt_main
 		do_fault_test(pipe, true);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_msm_bo_free(scratch_bo);
 		igt_msm_pipe_close(pipe);
 		igt_msm_dev_close(dev);
diff --git a/tests/msm/msm_shrink.c b/tests/msm/msm_shrink.c
index 8e6c582ffc8c..6c5b976520a3 100644
--- a/tests/msm/msm_shrink.c
+++ b/tests/msm/msm_shrink.c
@@ -249,7 +249,7 @@ igt_main
 	uint64_t alloc_size_mb = 0;
 	int num_processes = 0;
 
-	igt_fixture {
+	igt_fixture() {
 		int params, ncpus;
 		uint64_t mem_size;
 		uint64_t swap_size;
@@ -306,7 +306,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_msm_dev_close(dev);
 	}
 }
diff --git a/tests/msm/msm_submit.c b/tests/msm/msm_submit.c
index 48cffab6940b..2955f5d99b23 100644
--- a/tests/msm/msm_submit.c
+++ b/tests/msm/msm_submit.c
@@ -30,7 +30,7 @@ igt_main
 	struct msm_pipe *pipe = NULL;
 	struct msm_bo *a = NULL, *b = NULL;
 
-	igt_fixture {
+	igt_fixture() {
 		dev = igt_msm_dev_open();
 		pipe = igt_msm_pipe_open(dev, 0);
 		a = igt_msm_bo_new(dev, 0x1000, MSM_BO_WC);
@@ -185,7 +185,7 @@ igt_main
 		do_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_msm_bo_free(a);
 		igt_msm_bo_free(b);
 		igt_msm_pipe_close(pipe);
diff --git a/tests/msm/msm_submitoverhead.c b/tests/msm/msm_submitoverhead.c
index 1b893e30ebe1..bf5229881277 100644
--- a/tests/msm/msm_submitoverhead.c
+++ b/tests/msm/msm_submitoverhead.c
@@ -24,7 +24,7 @@ igt_main
 		10, 100, 250, 500, 1000,
 	};
 
-	igt_fixture {
+	igt_fixture() {
 		struct drm_msm_gem_submit req;
 
 		dev = igt_msm_dev_open();
@@ -78,7 +78,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		for (int i = 0; i < MAX_BOS; i++)
 			igt_msm_bo_free(bos[i]);
 		igt_msm_pipe_close(pipe);
diff --git a/tests/nouveau_crc.c b/tests/nouveau_crc.c
index c949723189f1..a8f4b71f7121 100644
--- a/tests/nouveau_crc.c
+++ b/tests/nouveau_crc.c
@@ -322,7 +322,7 @@ igt_main
 {
 	int pipe;
 
-	igt_fixture {
+	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		igt_require_nouveau(data.drm_fd);
 
@@ -334,7 +334,7 @@ igt_main
 	}
 
 	for_each_pipe_static(pipe) {
-		igt_fixture {
+		igt_fixture() {
 			int dir;
 
 			data.pipe = pipe;
@@ -407,13 +407,13 @@ igt_main
 		pipe_test("source-outp-inactive")
 			test_source_outp_inactive(&data);
 
-		igt_fixture {
+		igt_fixture() {
 			igt_remove_fb(data.drm_fd, &data.default_fb);
 			close(data.nv_crc_dir);
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
diff --git a/tests/panfrost/panfrost_gem_new.c b/tests/panfrost/panfrost_gem_new.c
index 4f27e029d09a..42e0bbc038e1 100644
--- a/tests/panfrost/panfrost_gem_new.c
+++ b/tests/panfrost/panfrost_gem_new.c
@@ -39,7 +39,7 @@ igt_main
 {
 	int fd;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_PANFROST);
 	}
 
@@ -85,6 +85,6 @@ igt_main
 		drm_close_driver(fd2);
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/panfrost/panfrost_get_param.c b/tests/panfrost/panfrost_get_param.c
index 7d1ebecb46fc..39ef11eba1b8 100644
--- a/tests/panfrost/panfrost_get_param.c
+++ b/tests/panfrost/panfrost_get_param.c
@@ -40,7 +40,7 @@ igt_main
 {
 	int fd;
 
-	igt_fixture
+	igt_fixture()
 		fd = drm_open_driver(DRIVER_PANFROST);
 
 	igt_subtest("base-params") {
@@ -68,6 +68,6 @@ igt_main
 		do_ioctl_err(fd, DRM_IOCTL_PANFROST_GET_PARAM, &get, EINVAL);
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/panfrost/panfrost_prime.c b/tests/panfrost/panfrost_prime.c
index dbc1cb46bc57..b90c66032c23 100644
--- a/tests/panfrost/panfrost_prime.c
+++ b/tests/panfrost/panfrost_prime.c
@@ -59,7 +59,7 @@ igt_main
 {
 	int fd, kms_fd;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_PANFROST);
 		kms_fd = __drm_open_driver_another(1, DRIVER_ANY);
 	}
@@ -95,7 +95,7 @@ igt_main
 		igt_panfrost_free_bo(fd, bo);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		drm_close_driver(fd);
 		drm_close_driver(kms_fd);
 	}
diff --git a/tests/panfrost/panfrost_submit.c b/tests/panfrost/panfrost_submit.c
index 70af55e0ba09..27d3a7de55b3 100644
--- a/tests/panfrost/panfrost_submit.c
+++ b/tests/panfrost/panfrost_submit.c
@@ -66,7 +66,7 @@ igt_main
 {
         int fd;
 
-        igt_fixture {
+        igt_fixture() {
                 fd = drm_open_driver(DRIVER_PANFROST);
         }
 
@@ -196,7 +196,7 @@ igt_main
                 igt_panfrost_free_job(fd, submit);
         }
 
-        igt_fixture {
+        igt_fixture() {
                 drm_close_driver(fd);
         }
 }
diff --git a/tests/panthor/panthor_gem.c b/tests/panthor/panthor_gem.c
index 57cd97e809fd..7e3aeca1e6c0 100644
--- a/tests/panthor/panthor_gem.c
+++ b/tests/panthor/panthor_gem.c
@@ -10,7 +10,7 @@
 igt_main {
 	int fd;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_PANTHOR);
 	}
 
@@ -66,7 +66,7 @@ igt_main {
 		igt_panthor_free_bo(fd, &bo);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		drm_close_driver(fd);
 	}
 }
diff --git a/tests/panthor/panthor_group.c b/tests/panthor/panthor_group.c
index 0101a6249d4f..846ddabce36e 100644
--- a/tests/panthor/panthor_group.c
+++ b/tests/panthor/panthor_group.c
@@ -43,7 +43,7 @@ issue_store_multiple(uint8_t *cs, uint64_t kernel_va, uint32_t constant)
 igt_main {
 	int fd;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_PANTHOR);
 	}
 
@@ -117,7 +117,7 @@ igt_main {
 		igt_panthor_free_bo(fd, &result_bo);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		drm_close_driver(fd);
 	}
 }
diff --git a/tests/panthor/panthor_query.c b/tests/panthor/panthor_query.c
index 81c2ebd23f06..7212cb8f1c3c 100644
--- a/tests/panthor/panthor_query.c
+++ b/tests/panthor/panthor_query.c
@@ -10,7 +10,7 @@
 igt_main {
 	int fd;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_PANTHOR);
 	}
 
@@ -23,7 +23,7 @@ igt_main {
 		igt_assert_neq(gpu.gpu_id, 0);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		drm_close_driver(fd);
 	}
 }
diff --git a/tests/panthor/panthor_vm.c b/tests/panthor/panthor_vm.c
index 18a0622c7f8a..ffde7881146b 100644
--- a/tests/panthor/panthor_vm.c
+++ b/tests/panthor/panthor_vm.c
@@ -9,7 +9,7 @@
 igt_main {
 	int fd;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_PANTHOR);
 	}
 
@@ -78,7 +78,7 @@ igt_main {
 		igt_panthor_vm_destroy(fd, vm_id, 0);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		drm_close_driver(fd);
 	}
 }
diff --git a/tests/prime_nv_api.c b/tests/prime_nv_api.c
index d9c1849cf0b0..c95586c6b01d 100644
--- a/tests/prime_nv_api.c
+++ b/tests/prime_nv_api.c
@@ -348,7 +348,7 @@ static void test_nv_self_import_to_different_fd(void)
 
 igt_main
 {
-	igt_fixture {
+	igt_fixture() {
 		find_and_open_devices();
 
 		igt_require(nouveau_fd != -1);
@@ -383,7 +383,7 @@ igt_main
 	xtest(i915_self_import_to_different_fd);
 	xtest(nv_self_import_to_different_fd);
 	
-	igt_fixture {
+	igt_fixture() {
 		nouveau_device_del(&ndev);
 
 		close(intel_fd);
diff --git a/tests/prime_nv_pcopy.c b/tests/prime_nv_pcopy.c
index 103f67235e12..b1a935dbbea6 100644
--- a/tests/prime_nv_pcopy.c
+++ b/tests/prime_nv_pcopy.c
@@ -862,7 +862,7 @@ static void test_semaphore(void)
 
 igt_main
 {
-	igt_fixture {
+	igt_fixture() {
 		find_and_open_devices();
 
 		igt_require(nouveau_fd != -1);
@@ -887,7 +887,7 @@ igt_main
 	xtest(test3_5);
 	xtest(test_semaphore);
 
-	igt_fixture {
+	igt_fixture() {
 		nouveau_bo_ref(NULL, &query_bo);
 		nouveau_object_del(&pcopy);
 		nouveau_bufctx_del(&nbufctx);
diff --git a/tests/prime_nv_test.c b/tests/prime_nv_test.c
index c8c4337e32b6..94ea4f028d2a 100644
--- a/tests/prime_nv_test.c
+++ b/tests/prime_nv_test.c
@@ -354,7 +354,7 @@ static void test_i915_blt_fill_nv_read(void)
 
 igt_main
 {
-	igt_fixture {
+	igt_fixture() {
 		igt_assert(find_and_open_devices() == 0);
 
 		igt_require(nouveau_fd != -1);
@@ -380,7 +380,7 @@ igt_main
 	xtest(i915_import_pread_pwrite);
 	xtest(i915_blt_fill_nv_read);
 
-	igt_fixture {
+	igt_fixture() {
 		nouveau_device_del(&ndev);
 
 		buf_ops_destroy(bops);
diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index d15ea906ff7b..7bcd731faeb9 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -1124,7 +1124,7 @@ static void test_each_engine(const char *name, int vgem, int i915,
 	const struct intel_execution_engine2 *e;
 	const intel_ctx_t *ctx;
 
-	igt_fixture
+	igt_fixture()
 		ctx = intel_ctx_create_all_physical(i915);
 
 	igt_subtest_with_dynamic(name) {
@@ -1142,7 +1142,7 @@ static void test_each_engine(const char *name, int vgem, int i915,
 		}
 	}
 
-	igt_fixture
+	igt_fixture()
 		intel_ctx_destroy(i915, ctx);
 }
 
@@ -1151,7 +1151,7 @@ igt_main
 	int i915 = -1;
 	int vgem = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		vgem = drm_open_driver(DRIVER_VGEM);
 		igt_require(has_prime_export(vgem));
 
@@ -1214,7 +1214,7 @@ igt_main
 
 	/* Fence testing */
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			igt_require(vgem_has_fences(vgem));
 		}
 
@@ -1237,7 +1237,7 @@ igt_main
 			test_flip(i915, vgem, 0);
 
 		igt_subtest_group {
-			igt_fixture {
+			igt_fixture() {
 				igt_require(vgem_fence_has_flag(vgem, WIP_VGEM_FENCE_NOTIMEOUT));
 			}
 
@@ -1258,7 +1258,7 @@ igt_main
 
 	/* Fence testing, requires multiprocess allocator */
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			igt_require(vgem_has_fences(vgem));
 			intel_allocator_multiprocess_start();
 		}
@@ -1266,13 +1266,13 @@ igt_main
 		igt_describe("Examine basic dma-buf fence interop.");
 		test_each_engine("fence-wait", vgem, i915, test_fence_wait);
 
-		igt_fixture {
+		igt_fixture() {
 			intel_allocator_multiprocess_stop();
 		}
 	}
 
 
-	igt_fixture {
+	igt_fixture() {
 		drm_close_driver(i915);
 		drm_close_driver(vgem);
 	}
diff --git a/tests/sriov_basic.c b/tests/sriov_basic.c
index 36bca4149e02..7e01b578b5bc 100644
--- a/tests/sriov_basic.c
+++ b/tests/sriov_basic.c
@@ -123,7 +123,7 @@ igt_main
 	int pf_fd;
 	bool autoprobe;
 
-	igt_fixture {
+	igt_fixture() {
 		pf_fd = drm_open_driver(DRIVER_ANY);
 		igt_require(igt_sriov_is_pf(pf_fd));
 		igt_require(igt_sriov_vfs_supported(pf_fd));
@@ -209,7 +209,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_sriov_disable_vfs(pf_fd);
 		/* abort to avoid execution of next tests with enabled VFs */
 		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0, "Failed to disable VF(s)");
diff --git a/tests/sw_sync.c b/tests/sw_sync.c
index fbb24e8ac380..f7d719873626 100644
--- a/tests/sw_sync.c
+++ b/tests/sw_sync.c
@@ -880,7 +880,7 @@ static void test_sync_random_merge(void)
 
 igt_main
 {
-	igt_fixture {
+	igt_fixture() {
 		igt_require_sw_sync();
 		multi_consumer_threads =
 			min_t(multi_consumer_threads,
diff --git a/tests/syncobj_basic.c b/tests/syncobj_basic.c
index 8a4416fffe88..9a4f33884fba 100644
--- a/tests/syncobj_basic.c
+++ b/tests/syncobj_basic.c
@@ -223,7 +223,7 @@ igt_main
 {
 	int fd = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_ANY);
 		igt_require(has_syncobj(fd));
 	}
@@ -265,7 +265,7 @@ igt_main
 	igt_subtest("test-valid-cycle")
 		test_valid_cycle(fd);
 
-	igt_fixture {
+	igt_fixture() {
 		drm_close_driver(fd);
 	}
 
diff --git a/tests/syncobj_eventfd.c b/tests/syncobj_eventfd.c
index f8bf17e1f8ad..7ad0e62ad04d 100644
--- a/tests/syncobj_eventfd.c
+++ b/tests/syncobj_eventfd.c
@@ -281,7 +281,7 @@ igt_main
 {
 	int fd = -1, i;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_ANY);
 		igt_require(has_syncobj_eventfd(fd));
 		igt_require_sw_sync();
@@ -320,7 +320,7 @@ igt_main
 			test_wait_signaled(fd, use_timeline);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		drm_close_driver(fd);
 	}
 }
diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
index a77896ec1d20..7f09070d3412 100644
--- a/tests/syncobj_timeline.c
+++ b/tests/syncobj_timeline.c
@@ -1699,7 +1699,7 @@ igt_main
 {
 	int fd = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_ANY);
 		igt_require(has_syncobj_timeline_wait(fd));
 		igt_require_sw_sync();
@@ -1934,7 +1934,7 @@ igt_main
 	igt_subtest("32bits-limit")
 		test_32bits_limit(fd);
 
-	igt_fixture {
+	igt_fixture() {
 		drm_close_driver(fd);
 	}
 }
diff --git a/tests/syncobj_wait.c b/tests/syncobj_wait.c
index e5f251205bc9..854e1711055d 100644
--- a/tests/syncobj_wait.c
+++ b/tests/syncobj_wait.c
@@ -909,7 +909,7 @@ igt_main
 {
 	int fd = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_ANY);
 		igt_require(has_syncobj_wait(fd));
 		igt_require_sw_sync();
@@ -1061,7 +1061,7 @@ igt_main
 	igt_subtest("wait-all-interrupted")
 		test_wait_interrupted(fd, WAIT_ALL);
 
-	igt_fixture {
+	igt_fixture() {
 		drm_close_driver(fd);
 	}
 }
diff --git a/tests/template.c b/tests/template.c
index ae2681c01378..513125757109 100644
--- a/tests/template.c
+++ b/tests/template.c
@@ -47,7 +47,7 @@ static void test_B(int fd)
 }
 
 /*
- * Variables which are written to in igt_fixtures/subtest blocks need to be
+ * Variables which are written to in igt_fixture()s/subtest blocks need to be
  * allocated outside of the relevant function scope, otherwise gcc will wreak
  * havoc (since these magic blocks use setjmp/longjmp internally).
  *
@@ -60,7 +60,7 @@ int drm_fd;
 
 igt_main
 {
-	igt_fixture {
+	igt_fixture() {
 		drm_fd = drm_open_driver(DRIVER_ANY);
 
 		/* Set up other interesting stuff shared by all tests. */
@@ -75,7 +75,7 @@ igt_main
 	 * various uses of igt_subtest_f for a few neat ideas.
 	 */
 
-	igt_fixture {
+	igt_fixture() {
 		drm_close_driver(drm_fd);
 	}
 }
diff --git a/tests/tools_test.c b/tests/tools_test.c
index 8412ba521df1..61e8a9998394 100644
--- a/tests/tools_test.c
+++ b/tests/tools_test.c
@@ -96,7 +96,7 @@ static bool chdir_to_tools_dir(void)
 
 igt_main
 {
-	igt_fixture {
+	igt_fixture() {
 		char *path;
 
 		igt_require_f(chdir_to_tools_dir(),
diff --git a/tests/v3d/v3d_create_bo.c b/tests/v3d/v3d_create_bo.c
index 07d237e96786..daa928d3fdd2 100644
--- a/tests/v3d/v3d_create_bo.c
+++ b/tests/v3d/v3d_create_bo.c
@@ -12,7 +12,7 @@ igt_main
 {
 	int fd;
 
-	igt_fixture
+	igt_fixture()
 		fd = drm_open_driver(DRIVER_V3D);
 
 	igt_describe("Make sure a BO cannot be created with flags different than zero.");
@@ -66,6 +66,6 @@ igt_main
 		drm_close_driver(fd2);
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/v3d/v3d_get_bo_offset.c b/tests/v3d/v3d_get_bo_offset.c
index 533488420190..717d91a528c2 100644
--- a/tests/v3d/v3d_get_bo_offset.c
+++ b/tests/v3d/v3d_get_bo_offset.c
@@ -30,7 +30,7 @@ igt_main
 {
 	int fd;
 
-	igt_fixture
+	igt_fixture()
 		fd = drm_open_driver(DRIVER_V3D);
 
 	igt_describe("Make sure the offset returned by the creation of the BO is "
@@ -66,6 +66,6 @@ igt_main
 		do_ioctl_err(fd, DRM_IOCTL_V3D_GET_BO_OFFSET, &get, ENOENT);
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/v3d/v3d_get_param.c b/tests/v3d/v3d_get_param.c
index 0d8fbf3d6d67..55caa0f1dd9a 100644
--- a/tests/v3d/v3d_get_param.c
+++ b/tests/v3d/v3d_get_param.c
@@ -30,7 +30,7 @@ igt_main
 {
 	int fd;
 
-	igt_fixture
+	igt_fixture()
 		fd = drm_open_driver(DRIVER_V3D);
 
 	igt_describe("Sanity check for getting existent params.");
@@ -68,6 +68,6 @@ igt_main
 		do_ioctl_err(fd, DRM_IOCTL_V3D_GET_PARAM, &get, EINVAL);
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/v3d/v3d_job_submission.c b/tests/v3d/v3d_job_submission.c
index e4ca7e89d6bf..522c0ff79d84 100644
--- a/tests/v3d/v3d_job_submission.c
+++ b/tests/v3d/v3d_job_submission.c
@@ -60,7 +60,7 @@ static void *create_csd_jobs(void *args)
 
 igt_main
 {
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_V3D);
 		igt_require(igt_v3d_get_param(fd, DRM_V3D_PARAM_SUPPORTS_CSD));
 		igt_require(igt_v3d_get_param(fd, DRM_V3D_PARAM_SUPPORTS_MULTISYNC_EXT));
@@ -218,6 +218,6 @@ igt_main
 		free(csd_jobs);
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/v3d/v3d_mmap.c b/tests/v3d/v3d_mmap.c
index 642c55c659ee..c5ef39a6609b 100644
--- a/tests/v3d/v3d_mmap.c
+++ b/tests/v3d/v3d_mmap.c
@@ -30,7 +30,7 @@ igt_main
 {
 	int fd;
 
-	igt_fixture
+	igt_fixture()
 		fd = drm_open_driver(DRIVER_V3D);
 
 	igt_describe("Make sure that flags is equal to zero.");
@@ -74,6 +74,6 @@ igt_main
 		free(bo);
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/v3d/v3d_perfmon.c b/tests/v3d/v3d_perfmon.c
index 4d6ea465f48e..1858888fe427 100644
--- a/tests/v3d/v3d_perfmon.c
+++ b/tests/v3d/v3d_perfmon.c
@@ -12,7 +12,7 @@ igt_main
 {
 	int fd;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_V3D);
 		igt_require(igt_v3d_get_param(fd, DRM_V3D_PARAM_SUPPORTS_PERFMON));
 	}
@@ -141,6 +141,6 @@ igt_main
 		do_ioctl_err(fd, DRM_IOCTL_V3D_PERFMON_GET_VALUES, &get, EINVAL);
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/v3d/v3d_submit_cl.c b/tests/v3d/v3d_submit_cl.c
index 293b146e296d..a4d79e4abf5e 100644
--- a/tests/v3d/v3d_submit_cl.c
+++ b/tests/v3d/v3d_submit_cl.c
@@ -31,7 +31,7 @@ igt_main
 {
 	int fd;
 
-	igt_fixture
+	igt_fixture()
 		fd = drm_open_driver(DRIVER_V3D);
 
 	igt_describe("Make sure a submission cannot be accepted with a pad different than zero.");
@@ -375,6 +375,6 @@ igt_main
 		igt_v3d_perfmon_destroy(fd, id);
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/v3d/v3d_submit_csd.c b/tests/v3d/v3d_submit_csd.c
index 0e19913c6871..cf2026cef022 100644
--- a/tests/v3d/v3d_submit_csd.c
+++ b/tests/v3d/v3d_submit_csd.c
@@ -33,7 +33,7 @@ igt_main
 {
 	int fd;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_V3D);
 		igt_require(igt_v3d_get_param(fd, DRM_V3D_PARAM_SUPPORTS_CSD));
 	}
@@ -359,6 +359,6 @@ igt_main
 		igt_v3d_perfmon_destroy(fd, id);
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/v3d/v3d_wait_bo.c b/tests/v3d/v3d_wait_bo.c
index 6ed999426a6f..8754410261e5 100644
--- a/tests/v3d/v3d_wait_bo.c
+++ b/tests/v3d/v3d_wait_bo.c
@@ -29,7 +29,7 @@ igt_main
 	int fd;
 	struct v3d_bo *bo;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_V3D);
 		bo = igt_v3d_create_bo(fd, PAGE_SIZE);
 	}
@@ -120,7 +120,7 @@ igt_main
 		igt_v3d_free_cl_job(fd, job);
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_v3d_free_bo(fd, bo);
 		drm_close_driver(fd);
 	}
diff --git a/tests/vc4/vc4_create_bo.c b/tests/vc4/vc4_create_bo.c
index c67f626f9796..8c55d09e629f 100644
--- a/tests/vc4/vc4_create_bo.c
+++ b/tests/vc4/vc4_create_bo.c
@@ -28,7 +28,7 @@ igt_main
 {
 	int fd;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_VC4);
 		igt_require(igt_vc4_is_v3d(fd));
 	}
@@ -75,6 +75,6 @@ igt_main
 		drm_close_driver(fd2);
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/vc4/vc4_dmabuf_poll.c b/tests/vc4/vc4_dmabuf_poll.c
index 56f60b202b06..14976dacc731 100644
--- a/tests/vc4/vc4_dmabuf_poll.c
+++ b/tests/vc4/vc4_dmabuf_poll.c
@@ -59,7 +59,7 @@ igt_main
 {
 	int fd;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_VC4);
 		igt_require(igt_vc4_is_v3d(fd));
 	}
@@ -72,6 +72,6 @@ igt_main
 		poll_write_bo_test(fd, POLLIN);
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/vc4/vc4_label_bo.c b/tests/vc4/vc4_label_bo.c
index dc0ddaa15d55..1d1b134a1796 100644
--- a/tests/vc4/vc4_label_bo.c
+++ b/tests/vc4/vc4_label_bo.c
@@ -43,7 +43,7 @@ igt_main
 {
 	int fd;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_VC4);
 		igt_require(igt_vc4_is_v3d(fd));
 	}
@@ -81,6 +81,6 @@ igt_main
 		gem_close(fd, handle);
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/vc4/vc4_lookup_fail.c b/tests/vc4/vc4_lookup_fail.c
index 76b52ecf3ed4..be0b39ad9469 100644
--- a/tests/vc4/vc4_lookup_fail.c
+++ b/tests/vc4/vc4_lookup_fail.c
@@ -29,7 +29,7 @@ igt_main
 {
 	int fd;
 
-	igt_fixture
+	igt_fixture()
 		fd = drm_open_driver(DRIVER_VC4);
 
 	igt_subtest("bad-color-write") {
@@ -66,6 +66,6 @@ igt_main
 		do_ioctl_err(fd, DRM_IOCTL_VC4_SUBMIT_CL, &submit, EINVAL);
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/vc4/vc4_mmap.c b/tests/vc4/vc4_mmap.c
index 7ca08811e396..511561c8e6df 100644
--- a/tests/vc4/vc4_mmap.c
+++ b/tests/vc4/vc4_mmap.c
@@ -12,7 +12,7 @@ igt_main
 {
 	int fd;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_VC4);
 		igt_require(igt_vc4_is_v3d(fd));
 	}
@@ -48,6 +48,6 @@ igt_main
 		munmap(map, VC4_GPU_PAGE_SIZE);
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/vc4/vc4_perfmon.c b/tests/vc4/vc4_perfmon.c
index b25e9209681e..646956747f97 100644
--- a/tests/vc4/vc4_perfmon.c
+++ b/tests/vc4/vc4_perfmon.c
@@ -12,7 +12,7 @@ igt_main
 {
 	int fd;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_VC4);
 		igt_require(igt_vc4_is_v3d(fd));
 		igt_require(igt_vc4_get_param(fd, DRM_VC4_PARAM_SUPPORTS_PERFMON));
@@ -134,6 +134,6 @@ igt_main
 		do_ioctl_err(fd, DRM_IOCTL_VC4_PERFMON_GET_VALUES, &get, EINVAL);
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/vc4/vc4_purgeable_bo.c b/tests/vc4/vc4_purgeable_bo.c
index 7e9ac1718934..294f193dfc36 100644
--- a/tests/vc4/vc4_purgeable_bo.c
+++ b/tests/vc4/vc4_purgeable_bo.c
@@ -101,7 +101,7 @@ igt_main
 	uint32_t *map;
 	int fd, ret;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_VC4);
 		igt_require(igt_vc4_get_param(fd, DRM_VC4_PARAM_SUPPORTS_MADVISE));
 		IGT_INIT_LIST_HEAD(&list);
@@ -248,6 +248,6 @@ igt_main
 		free(bo);
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/vc4/vc4_tiling.c b/tests/vc4/vc4_tiling.c
index 923e210e7aad..f412a9fe896e 100644
--- a/tests/vc4/vc4_tiling.c
+++ b/tests/vc4/vc4_tiling.c
@@ -28,7 +28,7 @@ igt_main
 {
 	int fd;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_VC4);
 		igt_require(igt_vc4_is_v3d(fd));
 	}
@@ -123,6 +123,6 @@ igt_main
 		gem_close(fd, bo);
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/vc4/vc4_wait_bo.c b/tests/vc4/vc4_wait_bo.c
index 3f4fb4dc6990..d70e90118759 100644
--- a/tests/vc4/vc4_wait_bo.c
+++ b/tests/vc4/vc4_wait_bo.c
@@ -62,7 +62,7 @@ igt_main
 	int fd;
 	int bo_handle;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_VC4);
 		igt_require(igt_vc4_is_v3d(fd));
 		bo_handle = igt_vc4_create_bo(fd, VC4_GPU_PAGE_SIZE);
@@ -110,6 +110,6 @@ igt_main
 	igt_subtest("used-bo")
 		test_used_bo(fd, ~0ull);
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/vc4/vc4_wait_seqno.c b/tests/vc4/vc4_wait_seqno.c
index e029a613e58c..b390d76b55e6 100644
--- a/tests/vc4/vc4_wait_seqno.c
+++ b/tests/vc4/vc4_wait_seqno.c
@@ -28,7 +28,7 @@ igt_main
 {
 	int fd;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_VC4);
 		igt_require(igt_vc4_is_v3d(fd));
 	}
@@ -54,6 +54,6 @@ igt_main
 		do_ioctl_err(fd, DRM_IOCTL_VC4_WAIT_SEQNO, &arg, ETIME);
 	}
 
-	igt_fixture
+	igt_fixture()
 		drm_close_driver(fd);
 }
diff --git a/tests/vgem_basic.c b/tests/vgem_basic.c
index 048ad7460fea..96d0d77ad840 100644
--- a/tests/vgem_basic.c
+++ b/tests/vgem_basic.c
@@ -497,7 +497,7 @@ igt_main
 	igt_subtest("unload")
 		test_unload();
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_VGEM);
 	}
 
@@ -560,7 +560,7 @@ igt_main
 		test_busy_fence(fd);
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			igt_require(has_prime_export(fd));
 		}
 
@@ -575,7 +575,7 @@ igt_main
 			test_dmabuf_mmap(fd);
 
 		igt_subtest_group {
-			igt_fixture {
+			igt_fixture() {
 				igt_require(vgem_has_fences(fd));
 			}
 
@@ -598,7 +598,7 @@ igt_main
 	igt_subtest("debugfs")
 		test_debugfs_read(fd);
 
-	igt_fixture {
+	igt_fixture() {
 		drm_close_driver(fd);
 	}
 }
diff --git a/tests/vgem_slow.c b/tests/vgem_slow.c
index 6609989c71e0..0e5ead6fa547 100644
--- a/tests/vgem_slow.c
+++ b/tests/vgem_slow.c
@@ -89,14 +89,14 @@ igt_main
 {
 	int fd = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_VGEM);
 	}
 
 	igt_subtest_f("nohang")
 		test_nohang(fd);
 
-	igt_fixture {
+	igt_fixture() {
 		drm_close_driver(fd);
 	}
 }
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 04a86de43283..69ebb23ec4bf 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1942,7 +1942,7 @@ igt_main
 		{ "enabled-connector-hot-plug", test_enabled_connector_hot_plug },
 	};
 
-	igt_fixture {
+	igt_fixture() {
 		drm_load_module(DRIVER_VKMS);
 		igt_require_vkms();
 		igt_require_vkms_configfs();
@@ -1954,7 +1954,7 @@ igt_main
 			tests[i].fn();
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		igt_require_vkms();
 		igt_require_vkms_configfs();
 		igt_vkms_destroy_all_devices();
diff --git a/tests/vmwgfx/vmw_execution_buffer.c b/tests/vmwgfx/vmw_execution_buffer.c
index 23c5f900d96e..4fcefe622cd6 100644
--- a/tests/vmwgfx/vmw_execution_buffer.c
+++ b/tests/vmwgfx/vmw_execution_buffer.c
@@ -252,7 +252,7 @@ igt_main_args("st:", long_options, NULL, parse_options, NULL)
 {
 	int fd;
 
-	igt_fixture
+	igt_fixture()
 	{
 		fd = drm_open_driver_render(DRIVER_VMWGFX);
 	}
@@ -287,7 +287,7 @@ igt_main_args("st:", long_options, NULL, parse_options, NULL)
 		}
 	}
 
-	igt_fixture
+	igt_fixture()
 	{
 		drm_close_driver(fd);
 	}
diff --git a/tests/vmwgfx/vmw_mob_stress.c b/tests/vmwgfx/vmw_mob_stress.c
index 2e6a9422c12f..cf229fb3b33d 100644
--- a/tests/vmwgfx/vmw_mob_stress.c
+++ b/tests/vmwgfx/vmw_mob_stress.c
@@ -52,7 +52,7 @@ igt_main
 	uint64 max_mob_mem;
 	uint64 max_mob_size;
 
-	igt_fixture
+	igt_fixture()
 	{
 		vmw_svga_device_init(&device, vmw_svga_device_node_render);
 		igt_require(device.drm_fd != -1);
@@ -97,7 +97,7 @@ igt_main
 		free(mob_objs);
 	}
 
-	igt_fixture
+	igt_fixture()
 	{
 		vmw_ioctl_context_destroy(device.drm_fd, cid);
 		vmw_svga_device_fini(&device);
diff --git a/tests/vmwgfx/vmw_prime.c b/tests/vmwgfx/vmw_prime.c
index 5c39ff1a4d45..4265a13943f0 100644
--- a/tests/vmwgfx/vmw_prime.c
+++ b/tests/vmwgfx/vmw_prime.c
@@ -508,7 +508,7 @@ igt_main
 	struct gpu_process_t gpu = { 0 };
 	int second_fd_vgem = -1;
 
-	igt_fixture {
+	igt_fixture() {
 		vmw_svga_device_init(&gpu.mdevice, vmw_svga_device_node_master);
 		vmw_svga_device_init(&gpu.rdevice, vmw_svga_device_node_render);
 		igt_require(gpu.mdevice.drm_fd != -1);
@@ -558,7 +558,7 @@ igt_main
 
 	igt_describe("VGEM subtests");
 	igt_subtest_group {
-		igt_fixture {
+		igt_fixture() {
 			second_fd_vgem =
 				__drm_open_driver_another(1, DRIVER_VGEM);
 			igt_require(second_fd_vgem >= 0);
@@ -570,12 +570,12 @@ igt_main
 			test_vgem(&gpu, second_fd_vgem);
 		}
 
-		igt_fixture {
+		igt_fixture() {
 			drm_close_driver(second_fd_vgem);
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		vmw_ioctl_context_destroy(gpu.rdevice.drm_fd, gpu.cid);
 		igt_display_fini(&gpu.display);
 		vmw_svga_device_fini(&gpu.rdevice);
diff --git a/tests/vmwgfx/vmw_ref_count.c b/tests/vmwgfx/vmw_ref_count.c
index c74940e0201c..40f46588bce7 100644
--- a/tests/vmwgfx/vmw_ref_count.c
+++ b/tests/vmwgfx/vmw_ref_count.c
@@ -92,7 +92,7 @@ igt_main
 	const uint32 size = sizeof(data);
 	SVGA3dSize surface_size = { .width = size, .height = 1, .depth = 1 };
 
-	igt_fixture
+	igt_fixture()
 	{
 		fd1 = drm_open_driver_render(DRIVER_VMWGFX);
 		fd2 = drm_open_driver_render(DRIVER_VMWGFX);
@@ -445,7 +445,7 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture() {
 		drm_close_driver(fd1);
 		drm_close_driver(fd2);
 	}
diff --git a/tests/vmwgfx/vmw_surface_copy.c b/tests/vmwgfx/vmw_surface_copy.c
index 471de54aa876..7c44be1c25bb 100644
--- a/tests/vmwgfx/vmw_surface_copy.c
+++ b/tests/vmwgfx/vmw_surface_copy.c
@@ -311,7 +311,7 @@ igt_main
 	int fd;
 	int32 cid;
 
-	igt_fixture
+	igt_fixture()
 	{
 		fd = drm_open_driver_render(DRIVER_VMWGFX);
 		igt_require(fd != -1);
@@ -333,7 +333,7 @@ igt_main
 		test_invalid_copies_3d(fd, cid);
 	}
 
-	igt_fixture
+	igt_fixture()
 	{
 		vmw_ioctl_context_destroy(fd, cid);
 		drm_close_driver(fd);
diff --git a/tests/vmwgfx/vmw_tri.c b/tests/vmwgfx/vmw_tri.c
index 1cb54707a2d3..4c79e5e2152a 100644
--- a/tests/vmwgfx/vmw_tri.c
+++ b/tests/vmwgfx/vmw_tri.c
@@ -185,7 +185,7 @@ igt_main
 	struct vmw_svga_device device;
 	int32 cid;
 
-	igt_fixture
+	igt_fixture()
 	{
 		vmw_svga_device_init(&device, vmw_svga_device_node_render);
 		igt_require(device.drm_fd != -1);
@@ -233,7 +233,7 @@ igt_main
 		vmw_ioctl_mob_close_handle(device.drm_fd, mob);
 	}
 
-	igt_fixture
+	igt_fixture()
 	{
 		vmw_svga_device_fini(&device);
 	}
-- 
2.49.1

