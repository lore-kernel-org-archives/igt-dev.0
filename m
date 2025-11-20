Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6039ECFA441
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 19:14:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1191410E7CC;
	Thu, 20 Nov 2025 19:14:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rb4eefnA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AFE410E7CC
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 19:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763666087; x=1795202087;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=U7lRET8i5ubIROu38Co7tpGlroT0ihgWTJmBIgC0RBY=;
 b=Rb4eefnAoot8AInsNftbdLk8KdjErzKIwgK8mbsQ7g9DJNKk54RSUgNg
 8ZEhHzyNYPoLlYrCw3R813DlMCHTRfngmT1Y7y1pnGr+EF/vdm2zHeTET
 4UXV0UM7O6k8kMg3roeRypkeZqpRIKlFk0fZfLAWopm3tnkBAKFqRkf2P
 cuXbe3gtgSXDXRtTQY9xG9mfJWXbxQGnTEWzZZcw5gkUyvRVfdrgL4HL1
 D2NFLCmOloN/BcetfFsUZ5HNfw9QraspT5X0DJ90dkhxZrqmAUTNoP7Sq
 teLIpkVaCuemCxxrBrrbzyqrPW0k4EYydI6hYiBsI0aIbkdZ85E15TFi+ w==;
X-CSE-ConnectionGUID: OqKGfkbXSXu8wXifst20Gg==
X-CSE-MsgGUID: zix1MMuuSbKPMFuFDRDRNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65448734"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="65448734"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 11:14:46 -0800
X-CSE-ConnectionGUID: rHz8jWDuQNKS5KbUrWgSeQ==
X-CSE-MsgGUID: W62QhX9cSEa+sCFy6UMUUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="195753575"
Received: from inaky-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.245.244.92])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 11:14:44 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 5/7] igt: Make igt_main*() look like normal function
 definition
Date: Thu, 20 Nov 2025 21:14:13 +0200
Message-ID: <20251120191415.4236-6-ville.syrjala@linux.intel.com>
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

Coccinelle chokes on igt_main*() because it looks like
a function definition without a type. Make it look like
a normal thing by moving the type out of the macro.

The macro still needs the __real_main forward declaration
so we can't actually expose the type from the main()
definition, but we can add a forward declaration for main()
ahead of the __real_main declaration, and if we leave out
the type there it must be placed into the place where
igt_main*() is used.

The bulk conversion was done with sed:
$ find -type f -name \*.[ch] -exec sed -i 's/^igt_main/int igt_main/g' {} +

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 benchmarks/gem_userptr_benchmark.c               | 2 +-
 lib/igt_core.h                                   | 1 +
 lib/tests/bad_subtest_type.c                     | 2 +-
 lib/tests/i915_perf_data_alignment.c             | 2 +-
 lib/tests/igt_assert.c                           | 2 +-
 lib/tests/igt_audio.c                            | 2 +-
 lib/tests/igt_can_fail.c                         | 2 +-
 lib/tests/igt_hook.c                             | 2 +-
 lib/tests/igt_ktap_parser.c                      | 2 +-
 lib/tests/igt_runnercomms_packets.c              | 2 +-
 lib/tests/igt_subtest_group.c                    | 2 +-
 lib/tests/igt_types.c                            | 2 +-
 runner/runner_json_tests.c                       | 2 +-
 runner/runner_kmemleak_test.c                    | 2 +-
 runner/runner_tests.c                            | 2 +-
 runner/testdata/abort-dynamic.c                  | 2 +-
 runner/testdata/abort-fixture.c                  | 2 +-
 runner/testdata/abort.c                          | 2 +-
 runner/testdata/dynamic.c                        | 2 +-
 runner/testdata/skippers.c                       | 2 +-
 runner/testdata/successtest.c                    | 2 +-
 tests/amdgpu/amd_abm.c                           | 2 +-
 tests/amdgpu/amd_assr.c                          | 2 +-
 tests/amdgpu/amd_basic.c                         | 2 +-
 tests/amdgpu/amd_basic_ex.c                      | 2 +-
 tests/amdgpu/amd_basic_multi_gpu.c               | 2 +-
 tests/amdgpu/amd_bo.c                            | 2 +-
 tests/amdgpu/amd_bypass.c                        | 2 +-
 tests/amdgpu/amd_color.c                         | 2 +-
 tests/amdgpu/amd_cp_dma_misc.c                   | 2 +-
 tests/amdgpu/amd_cs_nop.c                        | 2 +-
 tests/amdgpu/amd_deadlock.c                      | 2 +-
 tests/amdgpu/amd_dispatch.c                      | 2 +-
 tests/amdgpu/amd_dp_dsc.c                        | 2 +-
 tests/amdgpu/amd_freesync_video_mode.c           | 2 +-
 tests/amdgpu/amd_fuzzing.c                       | 2 +-
 tests/amdgpu/amd_gang_cs.c                       | 2 +-
 tests/amdgpu/amd_hotplug.c                       | 2 +-
 tests/amdgpu/amd_ilr.c                           | 2 +-
 tests/amdgpu/amd_info.c                          | 2 +-
 tests/amdgpu/amd_jpeg_dec.c                      | 2 +-
 tests/amdgpu/amd_jpeg_queue.c                    | 2 +-
 tests/amdgpu/amd_link_settings.c                 | 2 +-
 tests/amdgpu/amd_mall.c                          | 2 +-
 tests/amdgpu/amd_max_bpc.c                       | 2 +-
 tests/amdgpu/amd_mem_leak.c                      | 2 +-
 tests/amdgpu/amd_mode_switch.c                   | 2 +-
 tests/amdgpu/amd_module_load.c                   | 2 +-
 tests/amdgpu/amd_multidisplay_modeset.c          | 2 +-
 tests/amdgpu/amd_odm.c                           | 2 +-
 tests/amdgpu/amd_pci_unplug.c                    | 2 +-
 tests/amdgpu/amd_plane.c                         | 2 +-
 tests/amdgpu/amd_prime.c                         | 2 +-
 tests/amdgpu/amd_psr.c                           | 2 +-
 tests/amdgpu/amd_pstate.c                        | 2 +-
 tests/amdgpu/amd_queue_reset.c                   | 2 +-
 tests/amdgpu/amd_ras.c                           | 2 +-
 tests/amdgpu/amd_replay.c                        | 2 +-
 tests/amdgpu/amd_security.c                      | 2 +-
 tests/amdgpu/amd_subvp.c                         | 2 +-
 tests/amdgpu/amd_syncobj.c                       | 2 +-
 tests/amdgpu/amd_uvd_dec.c                       | 2 +-
 tests/amdgpu/amd_uvd_enc.c                       | 2 +-
 tests/amdgpu/amd_vce_enc.c                       | 2 +-
 tests/amdgpu/amd_vcn.c                           | 2 +-
 tests/amdgpu/amd_vcn_queue.c                     | 2 +-
 tests/amdgpu/amd_vm.c                            | 2 +-
 tests/amdgpu/amd_vpe.c                           | 2 +-
 tests/amdgpu/amd_vrr_range.c                     | 2 +-
 tests/chamelium/kms_chamelium_audio.c            | 2 +-
 tests/chamelium/kms_chamelium_color.c            | 2 +-
 tests/chamelium/kms_chamelium_edid.c             | 2 +-
 tests/chamelium/kms_chamelium_frames.c           | 2 +-
 tests/chamelium/kms_chamelium_hpd.c              | 2 +-
 tests/chamelium/kms_chamelium_sharpness_filter.c | 2 +-
 tests/core_auth.c                                | 2 +-
 tests/core_debugfs.c                             | 2 +-
 tests/core_getclient.c                           | 2 +-
 tests/core_getstats.c                            | 2 +-
 tests/core_getversion.c                          | 2 +-
 tests/core_hotunplug.c                           | 2 +-
 tests/core_setmaster.c                           | 2 +-
 tests/core_sysfs.c                               | 2 +-
 tests/device_reset.c                             | 2 +-
 tests/dmabuf.c                                   | 2 +-
 tests/dmabuf_sync_file.c                         | 2 +-
 tests/drm_buddy.c                                | 2 +-
 tests/drm_mm.c                                   | 2 +-
 tests/drm_read.c                                 | 2 +-
 tests/drm_virtgpu.c                              | 2 +-
 tests/dumb_buffer.c                              | 2 +-
 tests/fbdev.c                                    | 2 +-
 tests/intel/api_intel_allocator.c                | 2 +-
 tests/intel/api_intel_bb.c                       | 2 +-
 tests/intel/gem_bad_reloc.c                      | 2 +-
 tests/intel/gem_barrier_race.c                   | 2 +-
 tests/intel/gem_basic.c                          | 2 +-
 tests/intel/gem_blits.c                          | 2 +-
 tests/intel/gem_busy.c                           | 2 +-
 tests/intel/gem_caching.c                        | 2 +-
 tests/intel/gem_ccs.c                            | 2 +-
 tests/intel/gem_close.c                          | 2 +-
 tests/intel/gem_close_race.c                     | 2 +-
 tests/intel/gem_compute.c                        | 2 +-
 tests/intel/gem_concurrent_all.c                 | 2 +-
 tests/intel/gem_create.c                         | 2 +-
 tests/intel/gem_cs_tlb.c                         | 2 +-
 tests/intel/gem_ctx_bad_destroy.c                | 2 +-
 tests/intel/gem_ctx_create.c                     | 2 +-
 tests/intel/gem_ctx_engines.c                    | 2 +-
 tests/intel/gem_ctx_exec.c                       | 2 +-
 tests/intel/gem_ctx_freq.c                       | 2 +-
 tests/intel/gem_ctx_isolation.c                  | 2 +-
 tests/intel/gem_ctx_param.c                      | 2 +-
 tests/intel/gem_ctx_persistence.c                | 2 +-
 tests/intel/gem_ctx_shared.c                     | 2 +-
 tests/intel/gem_ctx_sseu.c                       | 2 +-
 tests/intel/gem_ctx_switch.c                     | 2 +-
 tests/intel/gem_eio.c                            | 2 +-
 tests/intel/gem_evict_alignment.c                | 2 +-
 tests/intel/gem_evict_everything.c               | 2 +-
 tests/intel/gem_exec_alignment.c                 | 2 +-
 tests/intel/gem_exec_async.c                     | 2 +-
 tests/intel/gem_exec_await.c                     | 2 +-
 tests/intel/gem_exec_balancer.c                  | 2 +-
 tests/intel/gem_exec_basic.c                     | 2 +-
 tests/intel/gem_exec_big.c                       | 2 +-
 tests/intel/gem_exec_capture.c                   | 2 +-
 tests/intel/gem_exec_create.c                    | 2 +-
 tests/intel/gem_exec_endless.c                   | 2 +-
 tests/intel/gem_exec_fair.c                      | 2 +-
 tests/intel/gem_exec_fence.c                     | 2 +-
 tests/intel/gem_exec_flush.c                     | 2 +-
 tests/intel/gem_exec_gttfill.c                   | 2 +-
 tests/intel/gem_exec_latency.c                   | 2 +-
 tests/intel/gem_exec_nop.c                       | 2 +-
 tests/intel/gem_exec_parallel.c                  | 2 +-
 tests/intel/gem_exec_params.c                    | 2 +-
 tests/intel/gem_exec_reloc.c                     | 2 +-
 tests/intel/gem_exec_schedule.c                  | 2 +-
 tests/intel/gem_exec_store.c                     | 2 +-
 tests/intel/gem_exec_suspend.c                   | 2 +-
 tests/intel/gem_exec_whisper.c                   | 2 +-
 tests/intel/gem_exercise_blt.c                   | 2 +-
 tests/intel/gem_fence_thrash.c                   | 2 +-
 tests/intel/gem_fence_upload.c                   | 2 +-
 tests/intel/gem_fenced_exec_thrash.c             | 2 +-
 tests/intel/gem_flink_basic.c                    | 2 +-
 tests/intel/gem_flink_race.c                     | 2 +-
 tests/intel/gem_gpgpu_fill.c                     | 2 +-
 tests/intel/gem_huc_copy.c                       | 2 +-
 tests/intel/gem_linear_blits.c                   | 2 +-
 tests/intel/gem_lmem_evict.c                     | 2 +-
 tests/intel/gem_lmem_swapping.c                  | 2 +-
 tests/intel/gem_madvise.c                        | 2 +-
 tests/intel/gem_media_fill.c                     | 2 +-
 tests/intel/gem_mmap.c                           | 2 +-
 tests/intel/gem_mmap_gtt.c                       | 2 +-
 tests/intel/gem_mmap_offset.c                    | 2 +-
 tests/intel/gem_mmap_wc.c                        | 2 +-
 tests/intel/gem_partial_pwrite_pread.c           | 2 +-
 tests/intel/gem_pipe_control_store_loop.c        | 2 +-
 tests/intel/gem_ppgtt.c                          | 2 +-
 tests/intel/gem_pread.c                          | 2 +-
 tests/intel/gem_pread_after_blit.c               | 2 +-
 tests/intel/gem_pwrite.c                         | 2 +-
 tests/intel/gem_pxp.c                            | 2 +-
 tests/intel/gem_read_read_speed.c                | 2 +-
 tests/intel/gem_readwrite.c                      | 2 +-
 tests/intel/gem_reg_read.c                       | 2 +-
 tests/intel/gem_render_copy.c                    | 2 +-
 tests/intel/gem_render_copy_redux.c              | 2 +-
 tests/intel/gem_render_linear_blits.c            | 2 +-
 tests/intel/gem_render_tiled_blits.c             | 2 +-
 tests/intel/gem_request_retire.c                 | 2 +-
 tests/intel/gem_reset_stats.c                    | 2 +-
 tests/intel/gem_ringfill.c                       | 2 +-
 tests/intel/gem_set_tiling_vs_blt.c              | 2 +-
 tests/intel/gem_shrink.c                         | 2 +-
 tests/intel/gem_softpin.c                        | 2 +-
 tests/intel/gem_spin_batch.c                     | 2 +-
 tests/intel/gem_streaming_writes.c               | 2 +-
 tests/intel/gem_sync.c                           | 2 +-
 tests/intel/gem_tiled_blits.c                    | 2 +-
 tests/intel/gem_tiled_fence_blits.c              | 2 +-
 tests/intel/gem_tiled_partial_pwrite_pread.c     | 2 +-
 tests/intel/gem_tiled_swapping.c                 | 2 +-
 tests/intel/gem_userptr_blits.c                  | 2 +-
 tests/intel/gem_vm_create.c                      | 2 +-
 tests/intel/gem_wait.c                           | 2 +-
 tests/intel/gem_watchdog.c                       | 2 +-
 tests/intel/gem_workarounds.c                    | 2 +-
 tests/intel/gen7_exec_parse.c                    | 2 +-
 tests/intel/gen9_exec_parse.c                    | 2 +-
 tests/intel/i915_drm_fdinfo.c                    | 2 +-
 tests/intel/i915_fb_tiling.c                     | 2 +-
 tests/intel/i915_getparams_basic.c               | 2 +-
 tests/intel/i915_hangman.c                       | 2 +-
 tests/intel/i915_module_load.c                   | 2 +-
 tests/intel/i915_pm_freq_api.c                   | 2 +-
 tests/intel/i915_pm_freq_mult.c                  | 2 +-
 tests/intel/i915_pm_rc6_residency.c              | 2 +-
 tests/intel/i915_pm_rpm.c                        | 2 +-
 tests/intel/i915_pm_rps.c                        | 2 +-
 tests/intel/i915_pm_sseu.c                       | 2 +-
 tests/intel/i915_power.c                         | 2 +-
 tests/intel/i915_query.c                         | 2 +-
 tests/intel/i915_selftest.c                      | 2 +-
 tests/intel/i915_suspend.c                       | 2 +-
 tests/intel/intel_hwmon.c                        | 2 +-
 tests/intel/kms_big_fb.c                         | 2 +-
 tests/intel/kms_busy.c                           | 2 +-
 tests/intel/kms_ccs.c                            | 2 +-
 tests/intel/kms_cdclk.c                          | 2 +-
 tests/intel/kms_dirtyfb.c                        | 2 +-
 tests/intel/kms_dp_link_training.c               | 2 +-
 tests/intel/kms_dp_linktrain_fallback.c          | 2 +-
 tests/intel/kms_draw_crc.c                       | 2 +-
 tests/intel/kms_dsc.c                            | 2 +-
 tests/intel/kms_fb_coherency.c                   | 2 +-
 tests/intel/kms_fbc_dirty_rect.c                 | 2 +-
 tests/intel/kms_fbcon_fbt.c                      | 2 +-
 tests/intel/kms_flip_scaled_crc.c                | 2 +-
 tests/intel/kms_flip_tiling.c                    | 2 +-
 tests/intel/kms_frontbuffer_tracking.c           | 2 +-
 tests/intel/kms_joiner.c                         | 2 +-
 tests/intel/kms_legacy_colorkey.c                | 2 +-
 tests/intel/kms_mmap_write_crc.c                 | 2 +-
 tests/intel/kms_pipe_b_c_ivb.c                   | 2 +-
 tests/intel/kms_pipe_stress.c                    | 2 +-
 tests/intel/kms_pm_backlight.c                   | 2 +-
 tests/intel/kms_pm_dc.c                          | 2 +-
 tests/intel/kms_pm_lpsp.c                        | 2 +-
 tests/intel/kms_pm_rpm.c                         | 2 +-
 tests/intel/kms_psr.c                            | 2 +-
 tests/intel/kms_psr2_sf.c                        | 2 +-
 tests/intel/kms_psr2_su.c                        | 2 +-
 tests/intel/kms_psr_stress_test.c                | 2 +-
 tests/intel/perf.c                               | 2 +-
 tests/intel/perf_pmu.c                           | 2 +-
 tests/intel/prime_busy.c                         | 2 +-
 tests/intel/prime_mmap.c                         | 2 +-
 tests/intel/prime_mmap_coherency.c               | 2 +-
 tests/intel/prime_mmap_kms.c                     | 2 +-
 tests/intel/prime_self_import.c                  | 2 +-
 tests/intel/sysfs_defaults.c                     | 2 +-
 tests/intel/sysfs_heartbeat_interval.c           | 2 +-
 tests/intel/sysfs_preempt_timeout.c              | 2 +-
 tests/intel/sysfs_timeslice_duration.c           | 2 +-
 tests/intel/xe_ccs.c                             | 2 +-
 tests/intel/xe_compute.c                         | 2 +-
 tests/intel/xe_compute_preempt.c                 | 2 +-
 tests/intel/xe_configfs.c                        | 2 +-
 tests/intel/xe_copy_basic.c                      | 2 +-
 tests/intel/xe_create.c                          | 2 +-
 tests/intel/xe_debugfs.c                         | 2 +-
 tests/intel/xe_dma_buf_sync.c                    | 2 +-
 tests/intel/xe_drm_fdinfo.c                      | 2 +-
 tests/intel/xe_eu_stall.c                        | 2 +-
 tests/intel/xe_eudebug.c                         | 2 +-
 tests/intel/xe_eudebug_online.c                  | 2 +-
 tests/intel/xe_eudebug_sriov.c                   | 2 +-
 tests/intel/xe_evict.c                           | 2 +-
 tests/intel/xe_evict_ccs.c                       | 2 +-
 tests/intel/xe_exec_atomic.c                     | 2 +-
 tests/intel/xe_exec_balancer.c                   | 2 +-
 tests/intel/xe_exec_basic.c                      | 2 +-
 tests/intel/xe_exec_capture.c                    | 2 +-
 tests/intel/xe_exec_compute_mode.c               | 2 +-
 tests/intel/xe_exec_fault_mode.c                 | 2 +-
 tests/intel/xe_exec_mix_modes.c                  | 2 +-
 tests/intel/xe_exec_queue_property.c             | 2 +-
 tests/intel/xe_exec_reset.c                      | 2 +-
 tests/intel/xe_exec_sip.c                        | 2 +-
 tests/intel/xe_exec_sip_eudebug.c                | 2 +-
 tests/intel/xe_exec_store.c                      | 2 +-
 tests/intel/xe_exec_system_allocator.c           | 2 +-
 tests/intel/xe_exec_threads.c                    | 2 +-
 tests/intel/xe_exercise_blt.c                    | 2 +-
 tests/intel/xe_fault_injection.c                 | 2 +-
 tests/intel/xe_gpgpu_fill.c                      | 2 +-
 tests/intel/xe_gt_freq.c                         | 2 +-
 tests/intel/xe_huc_copy.c                        | 2 +-
 tests/intel/xe_intel_bb.c                        | 2 +-
 tests/intel/xe_live_ktest.c                      | 2 +-
 tests/intel/xe_media_fill.c                      | 2 +-
 tests/intel/xe_mmap.c                            | 2 +-
 tests/intel/xe_module_load.c                     | 2 +-
 tests/intel/xe_noexec_ping_pong.c                | 2 +-
 tests/intel/xe_oa.c                              | 2 +-
 tests/intel/xe_pat.c                             | 2 +-
 tests/intel/xe_peer2peer.c                       | 2 +-
 tests/intel/xe_pm.c                              | 2 +-
 tests/intel/xe_pm_residency.c                    | 2 +-
 tests/intel/xe_pmu.c                             | 2 +-
 tests/intel/xe_prime_self_import.c               | 2 +-
 tests/intel/xe_pxp.c                             | 2 +-
 tests/intel/xe_query.c                           | 2 +-
 tests/intel/xe_render_copy.c                     | 2 +-
 tests/intel/xe_spin_batch.c                      | 2 +-
 tests/intel/xe_sriov_auto_provisioning.c         | 2 +-
 tests/intel/xe_sriov_flr.c                       | 2 +-
 tests/intel/xe_sriov_scheduling.c                | 2 +-
 tests/intel/xe_sriov_vram.c                      | 2 +-
 tests/intel/xe_survivability.c                   | 2 +-
 tests/intel/xe_sysfs_defaults.c                  | 2 +-
 tests/intel/xe_sysfs_preempt_timeout.c           | 2 +-
 tests/intel/xe_sysfs_scheduler.c                 | 2 +-
 tests/intel/xe_sysfs_timeslice_duration.c        | 2 +-
 tests/intel/xe_tlb.c                             | 2 +-
 tests/intel/xe_vm.c                              | 2 +-
 tests/intel/xe_waitfence.c                       | 2 +-
 tests/intel/xe_wedged.c                          | 2 +-
 tests/kms_3d.c                                   | 2 +-
 tests/kms_addfb_basic.c                          | 2 +-
 tests/kms_async_flips.c                          | 2 +-
 tests/kms_atomic.c                               | 2 +-
 tests/kms_atomic_interruptible.c                 | 2 +-
 tests/kms_atomic_transition.c                    | 2 +-
 tests/kms_bw.c                                   | 2 +-
 tests/kms_color.c                                | 2 +-
 tests/kms_concurrent.c                           | 2 +-
 tests/kms_content_protection.c                   | 2 +-
 tests/kms_cursor_crc.c                           | 2 +-
 tests/kms_cursor_edge_walk.c                     | 2 +-
 tests/kms_cursor_legacy.c                        | 2 +-
 tests/kms_debugfs.c                              | 2 +-
 tests/kms_display_modes.c                        | 2 +-
 tests/kms_dither.c                               | 2 +-
 tests/kms_feature_discovery.c                    | 2 +-
 tests/kms_flip.c                                 | 2 +-
 tests/kms_flip_event_leak.c                      | 2 +-
 tests/kms_force_connector_basic.c                | 2 +-
 tests/kms_getfb.c                                | 2 +-
 tests/kms_hdmi_inject.c                          | 2 +-
 tests/kms_hdr.c                                  | 2 +-
 tests/kms_invalid_mode.c                         | 2 +-
 tests/kms_lease.c                                | 2 +-
 tests/kms_multipipe_modeset.c                    | 2 +-
 tests/kms_panel_fitting.c                        | 2 +-
 tests/kms_pipe_crc_basic.c                       | 2 +-
 tests/kms_plane.c                                | 2 +-
 tests/kms_plane_alpha_blend.c                    | 2 +-
 tests/kms_plane_cursor.c                         | 2 +-
 tests/kms_plane_lowres.c                         | 2 +-
 tests/kms_plane_multiple.c                       | 2 +-
 tests/kms_plane_scaling.c                        | 2 +-
 tests/kms_prime.c                                | 2 +-
 tests/kms_prop_blob.c                            | 2 +-
 tests/kms_properties.c                           | 2 +-
 tests/kms_rmfb.c                                 | 2 +-
 tests/kms_rotation_crc.c                         | 2 +-
 tests/kms_scaling_modes.c                        | 2 +-
 tests/kms_selftest.c                             | 2 +-
 tests/kms_sequence.c                             | 2 +-
 tests/kms_setmode.c                              | 2 +-
 tests/kms_sharpness_filter.c                     | 2 +-
 tests/kms_tiled_display.c                        | 2 +-
 tests/kms_tv_load_detect.c                       | 2 +-
 tests/kms_universal_plane.c                      | 2 +-
 tests/kms_vblank.c                               | 2 +-
 tests/kms_vrr.c                                  | 2 +-
 tests/kms_writeback.c                            | 2 +-
 tests/meta_test.c                                | 2 +-
 tests/msm/msm_mapping.c                          | 2 +-
 tests/msm/msm_recovery.c                         | 2 +-
 tests/msm/msm_shrink.c                           | 2 +-
 tests/msm/msm_submit.c                           | 2 +-
 tests/msm/msm_submitoverhead.c                   | 2 +-
 tests/nouveau_crc.c                              | 2 +-
 tests/panfrost/panfrost_gem_new.c                | 2 +-
 tests/panfrost/panfrost_get_param.c              | 2 +-
 tests/panfrost/panfrost_prime.c                  | 2 +-
 tests/panfrost/panfrost_submit.c                 | 2 +-
 tests/panthor/panthor_gem.c                      | 2 +-
 tests/panthor/panthor_group.c                    | 2 +-
 tests/panthor/panthor_query.c                    | 2 +-
 tests/panthor/panthor_vm.c                       | 2 +-
 tests/prime_nv_api.c                             | 2 +-
 tests/prime_nv_pcopy.c                           | 2 +-
 tests/prime_nv_test.c                            | 2 +-
 tests/prime_vgem.c                               | 2 +-
 tests/sriov_basic.c                              | 2 +-
 tests/sw_sync.c                                  | 2 +-
 tests/syncobj_basic.c                            | 2 +-
 tests/syncobj_eventfd.c                          | 2 +-
 tests/syncobj_timeline.c                         | 2 +-
 tests/syncobj_wait.c                             | 2 +-
 tests/template.c                                 | 2 +-
 tests/tools_test.c                               | 2 +-
 tests/v3d/v3d_create_bo.c                        | 2 +-
 tests/v3d/v3d_get_bo_offset.c                    | 2 +-
 tests/v3d/v3d_get_param.c                        | 2 +-
 tests/v3d/v3d_job_submission.c                   | 2 +-
 tests/v3d/v3d_mmap.c                             | 2 +-
 tests/v3d/v3d_perfmon.c                          | 2 +-
 tests/v3d/v3d_submit_cl.c                        | 2 +-
 tests/v3d/v3d_submit_csd.c                       | 2 +-
 tests/v3d/v3d_wait_bo.c                          | 2 +-
 tests/vc4/vc4_create_bo.c                        | 2 +-
 tests/vc4/vc4_dmabuf_poll.c                      | 2 +-
 tests/vc4/vc4_label_bo.c                         | 2 +-
 tests/vc4/vc4_lookup_fail.c                      | 2 +-
 tests/vc4/vc4_mmap.c                             | 2 +-
 tests/vc4/vc4_perfmon.c                          | 2 +-
 tests/vc4/vc4_purgeable_bo.c                     | 2 +-
 tests/vc4/vc4_tiling.c                           | 2 +-
 tests/vc4/vc4_wait_bo.c                          | 2 +-
 tests/vc4/vc4_wait_seqno.c                       | 2 +-
 tests/vgem_basic.c                               | 2 +-
 tests/vgem_slow.c                                | 2 +-
 tests/vkms/vkms_configfs.c                       | 2 +-
 tests/vmwgfx/vmw_execution_buffer.c              | 2 +-
 tests/vmwgfx/vmw_mob_stress.c                    | 2 +-
 tests/vmwgfx/vmw_prime.c                         | 2 +-
 tests/vmwgfx/vmw_ref_count.c                     | 2 +-
 tests/vmwgfx/vmw_surface_copy.c                  | 2 +-
 tests/vmwgfx/vmw_tri.c                           | 2 +-
 418 files changed, 418 insertions(+), 417 deletions(-)

diff --git a/benchmarks/gem_userptr_benchmark.c b/benchmarks/gem_userptr_benchmark.c
index 91a3ddbd4ec8..30472d26f947 100644
--- a/benchmarks/gem_userptr_benchmark.c
+++ b/benchmarks/gem_userptr_benchmark.c
@@ -450,7 +450,7 @@ static void test_userptr(int fd)
 	test_multiple(fd, 100, 1);
 }
 
-igt_main()
+int igt_main()
 {
 	int fd = -1, ret;
 
diff --git a/lib/igt_core.h b/lib/igt_core.h
index 8fb25e1d53c5..fac27608986c 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -426,6 +426,7 @@ void __igt_subtest_group_restore(int, int);
  * #igt_subtest_init_parse_opts.
  */
 #define igt_main_args(short_opts, long_opts, help_str, opt_handler, handler_data) \
+	main(int argc, char **argv); \
 	static void igt_unique(__real_main)(void); \
 	int main(int argc, char **argv) { \
 		igt_subtest_init_parse_opts(&argc, argv, \
diff --git a/lib/tests/bad_subtest_type.c b/lib/tests/bad_subtest_type.c
index ec522c49bdbc..468162af9bbc 100644
--- a/lib/tests/bad_subtest_type.c
+++ b/lib/tests/bad_subtest_type.c
@@ -8,7 +8,7 @@
 
 IGT_TEST_DESCRIPTION("Test bad-scoped file descriptor variable");
 
-igt_main()
+int igt_main()
 {
 	igt_describe("Check if using a scoped variable inside a subtest will abort it");
 	igt_subtest("bad-scoped-variable") {
diff --git a/lib/tests/i915_perf_data_alignment.c b/lib/tests/i915_perf_data_alignment.c
index 6d2e1de1e4fd..dd8d3fdb465c 100644
--- a/lib/tests/i915_perf_data_alignment.c
+++ b/lib/tests/i915_perf_data_alignment.c
@@ -30,7 +30,7 @@
 
 #define is_aligned(s) ((sizeof(s) % 8) == 0)
 
-igt_main()
+int igt_main()
 {
 	igt_subtest("alignment") {
 		internal_assert(is_aligned(struct intel_perf_record_version));
diff --git a/lib/tests/igt_assert.c b/lib/tests/igt_assert.c
index f866870da6bf..09d7e6c0399a 100644
--- a/lib/tests/igt_assert.c
+++ b/lib/tests/igt_assert.c
@@ -125,7 +125,7 @@ static void test_fd(void)
 	igt_assert_fd(INT_MAX);
 }
 
-igt_main()
+int igt_main()
 {
 	int ret;
 
diff --git a/lib/tests/igt_audio.c b/lib/tests/igt_audio.c
index 93dda16c6641..e57449856255 100644
--- a/lib/tests/igt_audio.c
+++ b/lib/tests/igt_audio.c
@@ -174,7 +174,7 @@ static void test_signal_detect_phaseshift(struct audio_signal *signal)
 	igt_assert(!ok);
 }
 
-igt_main()
+int igt_main()
 {
 	struct audio_signal *signal = NULL;
 	int ret;
diff --git a/lib/tests/igt_can_fail.c b/lib/tests/igt_can_fail.c
index 034d60df3bf1..4314d4765619 100644
--- a/lib/tests/igt_can_fail.c
+++ b/lib/tests/igt_can_fail.c
@@ -26,7 +26,7 @@
 
 #include "igt_tests_common.h"
 
-igt_main()
+int igt_main()
 {
 	internal_assert(igt_can_fail() == false);
 
diff --git a/lib/tests/igt_hook.c b/lib/tests/igt_hook.c
index 445d619db2f0..0328c3a3c055 100644
--- a/lib/tests/igt_hook.c
+++ b/lib/tests/igt_hook.c
@@ -149,7 +149,7 @@ static void test_all_env_vars(void)
 	free(line);
 }
 
-igt_main()
+int igt_main()
 {
 	test_invalid_hook_descriptors();
 
diff --git a/lib/tests/igt_ktap_parser.c b/lib/tests/igt_ktap_parser.c
index 73c2b7e358fd..dfc653b33f0a 100644
--- a/lib/tests/igt_ktap_parser.c
+++ b/lib/tests/igt_ktap_parser.c
@@ -230,7 +230,7 @@ static void ktap_top_version(void)
 	igt_ktap_free(&ktap);
 }
 
-igt_main()
+int igt_main()
 {
 	igt_subtest("list")
 		ktap_list();
diff --git a/lib/tests/igt_runnercomms_packets.c b/lib/tests/igt_runnercomms_packets.c
index 1f752b43305a..36fea85ec8a6 100644
--- a/lib/tests/igt_runnercomms_packets.c
+++ b/lib/tests/igt_runnercomms_packets.c
@@ -214,7 +214,7 @@ struct {
 		      { NULL, NULL }
 };
 
-igt_main()
+int igt_main()
 {
 	igt_subtest("create-and-parse-normal") {
 		for (typeof (*basic_creation) *t = basic_creation; t->create; t++) {
diff --git a/lib/tests/igt_subtest_group.c b/lib/tests/igt_subtest_group.c
index 691498157524..216dc7c9f4c4 100644
--- a/lib/tests/igt_subtest_group.c
+++ b/lib/tests/igt_subtest_group.c
@@ -26,7 +26,7 @@
 
 #include "igt_tests_common.h"
 
-igt_main()
+int igt_main()
 {
 	/*
 	 * local variables have to be volatile here otherwise they end up being
diff --git a/lib/tests/igt_types.c b/lib/tests/igt_types.c
index 8144157210ef..388bf0a29f36 100644
--- a/lib/tests/igt_types.c
+++ b/lib/tests/igt_types.c
@@ -59,7 +59,7 @@ static void skip_delegate(void)
 	}
 }
 
-igt_main()
+int igt_main()
 {
 	/* Basic check that scopes will call their destructor */
 	cleanup_called = 0;
diff --git a/runner/runner_json_tests.c b/runner/runner_json_tests.c
index 5d7ed593cce3..38439ccaaa6a 100644
--- a/runner/runner_json_tests.c
+++ b/runner/runner_json_tests.c
@@ -172,7 +172,7 @@ static const char *dirnames[] = {
 	"graceful-notrun",
 };
 
-igt_main()
+int igt_main()
 {
 	int dirfd = open(testdatadir, O_RDONLY | O_DIRECTORY);
 	size_t i;
diff --git a/runner/runner_kmemleak_test.c b/runner/runner_kmemleak_test.c
index 76ea97f096e7..8d5013a13b79 100644
--- a/runner/runner_kmemleak_test.c
+++ b/runner/runner_kmemleak_test.c
@@ -213,7 +213,7 @@ const char *kmemleak_file_example =
 
 static const char *runner_kmemleak_unit_testing_resdir = "/tmp";
 
-igt_main()
+int igt_main()
 {
 	char unit_testing_kmemleak_filepath[256] = "/tmp/runner_kmemleak_test_XXXXXX";
 	int written_bytes;
diff --git a/runner/runner_tests.c b/runner/runner_tests.c
index c419eb9756cd..908979982390 100644
--- a/runner/runner_tests.c
+++ b/runner/runner_tests.c
@@ -261,7 +261,7 @@ static void write_packet_with_canary(int fd, struct runnerpacket *packet)
 	free(packet);
 }
 
-igt_main()
+int igt_main()
 {
 	struct settings *settings = malloc(sizeof(*settings));
 
diff --git a/runner/testdata/abort-dynamic.c b/runner/testdata/abort-dynamic.c
index 11cace0145f3..73c5ed1e9f18 100644
--- a/runner/testdata/abort-dynamic.c
+++ b/runner/testdata/abort-dynamic.c
@@ -23,7 +23,7 @@
 
 #include "igt.h"
 
-igt_main()
+int igt_main()
 {
 	igt_subtest_with_dynamic("a-subtest") {
 		igt_dynamic("dynamic-1")
diff --git a/runner/testdata/abort-fixture.c b/runner/testdata/abort-fixture.c
index 93759b29b82f..11f59a6eedc7 100644
--- a/runner/testdata/abort-fixture.c
+++ b/runner/testdata/abort-fixture.c
@@ -23,7 +23,7 @@
 
 #include "igt.h"
 
-igt_main()
+int igt_main()
 {
 	igt_fixture() {
 		igt_abort_on_f(true, "I'm out!\n");
diff --git a/runner/testdata/abort.c b/runner/testdata/abort.c
index eb726a0dda4e..e619429d68df 100644
--- a/runner/testdata/abort.c
+++ b/runner/testdata/abort.c
@@ -23,7 +23,7 @@
 
 #include "igt.h"
 
-igt_main()
+int igt_main()
 {
 	igt_subtest("a-subtest")
 		;
diff --git a/runner/testdata/dynamic.c b/runner/testdata/dynamic.c
index eabb49ef2ae5..5cc9ea7354a4 100644
--- a/runner/testdata/dynamic.c
+++ b/runner/testdata/dynamic.c
@@ -1,6 +1,6 @@
 #include "igt.h"
 
-igt_main()
+int igt_main()
 {
 	igt_subtest_with_dynamic("dynamic-subtest") {
 		igt_dynamic("failing")
diff --git a/runner/testdata/skippers.c b/runner/testdata/skippers.c
index 6dc117a41401..6f5a9d0a4266 100644
--- a/runner/testdata/skippers.c
+++ b/runner/testdata/skippers.c
@@ -1,6 +1,6 @@
 #include "igt.h"
 
-igt_main()
+int igt_main()
 {
 	igt_fixture() {
 		igt_require_f(false, "Skipping from fixture\n");
diff --git a/runner/testdata/successtest.c b/runner/testdata/successtest.c
index 8055382181b5..4511e169677c 100644
--- a/runner/testdata/successtest.c
+++ b/runner/testdata/successtest.c
@@ -1,6 +1,6 @@
 #include "igt.h"
 
-igt_main()
+int igt_main()
 {
 	igt_subtest("first-subtest")
 		igt_debug("Running first subtest\n");
diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index 7b850174bd00..84677fef80d6 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -498,7 +498,7 @@ static void abm_gradual(data_t *data)
 	}
 }
 
-igt_main()
+int igt_main()
 {
 	data_t data = {0};
 	igt_skip_on_simulation();
diff --git a/tests/amdgpu/amd_assr.c b/tests/amdgpu/amd_assr.c
index 559ae8abead1..8a42baa0ba86 100644
--- a/tests/amdgpu/amd_assr.c
+++ b/tests/amdgpu/amd_assr.c
@@ -267,7 +267,7 @@ static void test_assr_links(data_t *data, uint32_t test_flags)
 
 }
 
-igt_main()
+int igt_main()
 {
 	data_t data;
 
diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index fe0f7fad2297..92ceb7854a5c 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -662,7 +662,7 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle, bool user_queue)
 	free(ring_context);
 }
 
-igt_main()
+int igt_main()
 {
 	amdgpu_device_handle device;
 	struct amdgpu_gpu_info gpu_info = {0};
diff --git a/tests/amdgpu/amd_basic_ex.c b/tests/amdgpu/amd_basic_ex.c
index 01d89b5719aa..c3e614284fe7 100644
--- a/tests/amdgpu/amd_basic_ex.c
+++ b/tests/amdgpu/amd_basic_ex.c
@@ -21,7 +21,7 @@ amdgpu_ce_write_after_fence(amdgpu_device_handle device_handle)
 	amdgpu_cs_ctx_free(context_handle);
 }
 
-igt_main()
+int igt_main()
 {
 	amdgpu_device_handle device;
 	struct amdgpu_gpu_info gpu_info = {0};
diff --git a/tests/amdgpu/amd_basic_multi_gpu.c b/tests/amdgpu/amd_basic_multi_gpu.c
index 5ece374bab6a..6cb8933874f6 100644
--- a/tests/amdgpu/amd_basic_multi_gpu.c
+++ b/tests/amdgpu/amd_basic_multi_gpu.c
@@ -157,7 +157,7 @@ static void amdgpu_command_submission_multi_fence(amdgpu_device_handle device)
 	amdgpu_command_submission_multi_fence_wait_all(device, false);
 }
 
-igt_main()
+int igt_main()
 {
 	amdgpu_device_handle device;
 	int fd = -1;
diff --git a/tests/amdgpu/amd_bo.c b/tests/amdgpu/amd_bo.c
index 52a379eb17c6..1f300e6ba070 100644
--- a/tests/amdgpu/amd_bo.c
+++ b/tests/amdgpu/amd_bo.c
@@ -248,7 +248,7 @@ amdgpu_bo_find_by_cpu_mapping(amdgpu_device_handle device_handle)
 				     bo_mc_address, 4096);
 }
 
-igt_main()
+int igt_main()
 {
 	amdgpu_device_handle device;
 	struct bo_data bo;
diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
index 1d92d470027b..a3fc39c50a51 100644
--- a/tests/amdgpu/amd_bypass.c
+++ b/tests/amdgpu/amd_bypass.c
@@ -397,7 +397,7 @@ static void bypass_8bpc_test(data_t *data)
 	}
 }
 
-igt_main()
+int igt_main()
 {
 	data_t data;
 	memset(&data, 0, sizeof(data));
diff --git a/tests/amdgpu/amd_color.c b/tests/amdgpu/amd_color.c
index c01ef1b84359..917d30b20a47 100644
--- a/tests/amdgpu/amd_color.c
+++ b/tests/amdgpu/amd_color.c
@@ -392,7 +392,7 @@ static void test_crtc_lut_accuracy(data_t *data)
 	lut_free(&lut_degamma);
 }
 
-igt_main()
+int igt_main()
 {
 	data_t data;
 
diff --git a/tests/amdgpu/amd_cp_dma_misc.c b/tests/amdgpu/amd_cp_dma_misc.c
index 5ad799d8a6e0..31473780cdc7 100644
--- a/tests/amdgpu/amd_cp_dma_misc.c
+++ b/tests/amdgpu/amd_cp_dma_misc.c
@@ -8,7 +8,7 @@
 #include "lib/amdgpu/amd_cp_dma.h"
 #include "lib/amdgpu/amd_ip_blocks.h"
 
-igt_main()
+int igt_main()
 {
 	amdgpu_device_handle device;
 	amdgpu_device_handle device2;
diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c
index 60a9d77e0918..beab62a54022 100644
--- a/tests/amdgpu/amd_cs_nop.c
+++ b/tests/amdgpu/amd_cs_nop.c
@@ -146,7 +146,7 @@ static void nop_cs(amdgpu_device_handle device,
 	free(ring_context);
 }
 
-igt_main()
+int igt_main()
 {
 	amdgpu_device_handle device;
 	amdgpu_context_handle context;
diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index 73513055c17a..5d615799d01f 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -33,7 +33,7 @@ is_deadlock_tests_enable(const struct amdgpu_gpu_info *gpu_info)
 	return enable;
 }
 
-igt_main()
+int igt_main()
 {
 	amdgpu_device_handle device;
 	struct amdgpu_gpu_info gpu_info = {0};
diff --git a/tests/amdgpu/amd_dispatch.c b/tests/amdgpu/amd_dispatch.c
index ad7a6fdbd04d..1f4bf39f6459 100644
--- a/tests/amdgpu/amd_dispatch.c
+++ b/tests/amdgpu/amd_dispatch.c
@@ -76,7 +76,7 @@ amdgpu_gpu_reset_test(amdgpu_device_handle device_handle, int drm_amdgpu,
 	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, 0, pci, false);
 }
 
-igt_main()
+int igt_main()
 {
 	amdgpu_device_handle device;
 	struct amdgpu_gpu_info gpu_info = {0};
diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
index 9701df2bd6cb..30d7c898f907 100644
--- a/tests/amdgpu/amd_dp_dsc.c
+++ b/tests/amdgpu/amd_dp_dsc.c
@@ -537,7 +537,7 @@ static void test_dsc_bpc(data_t *data)
 	test_fini(data);
 }
 
-igt_main() {
+int igt_main() {
 	data_t data = { 0 };
 
 	igt_skip_on_simulation();
diff --git a/tests/amdgpu/amd_freesync_video_mode.c b/tests/amdgpu/amd_freesync_video_mode.c
index 41de7b19217c..4db975e26347 100644
--- a/tests/amdgpu/amd_freesync_video_mode.c
+++ b/tests/amdgpu/amd_freesync_video_mode.c
@@ -860,7 +860,7 @@ run_test(data_t *data, uint32_t scene)
 		igt_skip("No vrr capable outputs found.\n");
 }
 
-igt_main() {
+int igt_main() {
 	data_t data = {};
 
 	memset(&data, 0, sizeof(data));
diff --git a/tests/amdgpu/amd_fuzzing.c b/tests/amdgpu/amd_fuzzing.c
index c1b5ad4843f6..dcfc3c288887 100644
--- a/tests/amdgpu/amd_fuzzing.c
+++ b/tests/amdgpu/amd_fuzzing.c
@@ -155,7 +155,7 @@ amd_gem_create_fuzzing(int fd)
 
 }
 
-igt_main()
+int igt_main()
 {
 	int fd = -1;
 	const enum amd_ip_block_type arr_types[] = {
diff --git a/tests/amdgpu/amd_gang_cs.c b/tests/amdgpu/amd_gang_cs.c
index b808f1518bef..5eb21197df8d 100644
--- a/tests/amdgpu/amd_gang_cs.c
+++ b/tests/amdgpu/amd_gang_cs.c
@@ -238,7 +238,7 @@ amdgpu_cs_gang(amdgpu_device_handle device, uint32_t ring, bool is_vmid)
 	free(ring_context);
 }
 
-igt_main()
+int igt_main()
 {
 	amdgpu_device_handle device;
 	struct amdgpu_gpu_info gpu_info = {0};
diff --git a/tests/amdgpu/amd_hotplug.c b/tests/amdgpu/amd_hotplug.c
index bd2e59d03079..9038b2ed9208 100644
--- a/tests/amdgpu/amd_hotplug.c
+++ b/tests/amdgpu/amd_hotplug.c
@@ -200,7 +200,7 @@ static void test_hotplug_basic(data_t *data, bool suspend)
 	test_fini(data);
 }
 
-igt_main()
+int igt_main()
 {
 	data_t data;
 
diff --git a/tests/amdgpu/amd_ilr.c b/tests/amdgpu/amd_ilr.c
index a1cb82cff69b..5767d4ac4c11 100644
--- a/tests/amdgpu/amd_ilr.c
+++ b/tests/amdgpu/amd_ilr.c
@@ -315,7 +315,7 @@ static void test_flow(data_t *data, enum sub_test option)
 	}
 }
 
-igt_main()
+int igt_main()
 {
 	data_t data;
 	memset(&data, 0, sizeof(data));
diff --git a/tests/amdgpu/amd_info.c b/tests/amdgpu/amd_info.c
index 9657bf320038..4b66b63f92d0 100644
--- a/tests/amdgpu/amd_info.c
+++ b/tests/amdgpu/amd_info.c
@@ -117,7 +117,7 @@ time_stamp_test_enable(struct amdgpu_gpu_info *gpu_info)
 	return true;
 }
 
-igt_main()
+int igt_main()
 {
 	amdgpu_device_handle device;
 	struct amdgpu_gpu_info gpu_info = {};
diff --git a/tests/amdgpu/amd_jpeg_dec.c b/tests/amdgpu/amd_jpeg_dec.c
index 713ede11a4bc..ed005b3a15e9 100644
--- a/tests/amdgpu/amd_jpeg_dec.c
+++ b/tests/amdgpu/amd_jpeg_dec.c
@@ -217,7 +217,7 @@ amdgpu_cs_jpeg_decode(amdgpu_device_handle device_handle,
 	mmd_context_clean(device_handle, context);
 }
 
-igt_main()
+int igt_main()
 {
 	amdgpu_device_handle device;
 	struct mmd_shared_context shared_context = {};
diff --git a/tests/amdgpu/amd_jpeg_queue.c b/tests/amdgpu/amd_jpeg_queue.c
index 5f4a3d90ac8a..3f97af3959b7 100644
--- a/tests/amdgpu/amd_jpeg_queue.c
+++ b/tests/amdgpu/amd_jpeg_queue.c
@@ -76,7 +76,7 @@ err_handle:
 	return ret;
 }
 
-igt_main()
+int igt_main()
 {
 	amdgpu_device_handle device;
 	struct mmd_shared_context shared_context = {};
diff --git a/tests/amdgpu/amd_link_settings.c b/tests/amdgpu/amd_link_settings.c
index e42843023397..fb83f3c13932 100644
--- a/tests/amdgpu/amd_link_settings.c
+++ b/tests/amdgpu/amd_link_settings.c
@@ -246,7 +246,7 @@ static void test_link_training_configs(data_t *data)
 	test_fini(data);
 }
 
-igt_main()
+int igt_main()
 {
 	data_t data;
 	memset(&data, 0, sizeof(data));
diff --git a/tests/amdgpu/amd_mall.c b/tests/amdgpu/amd_mall.c
index b4bf2c5adc2a..a3e82a33f8f9 100644
--- a/tests/amdgpu/amd_mall.c
+++ b/tests/amdgpu/amd_mall.c
@@ -128,7 +128,7 @@ static void test_mall_ss(data_t *data)
 	test_fini(data);
 }
 
-igt_main()
+int igt_main()
 {
 	data_t data;
 
diff --git a/tests/amdgpu/amd_max_bpc.c b/tests/amdgpu/amd_max_bpc.c
index 98dd8fd7fb63..869a3e5c52b7 100644
--- a/tests/amdgpu/amd_max_bpc.c
+++ b/tests/amdgpu/amd_max_bpc.c
@@ -118,7 +118,7 @@ static void test_4k_mode_max_bpc(data_t *data)
 	test_fini(data);
 }
 
-igt_main()
+int igt_main()
 {
 	data_t data;
 
diff --git a/tests/amdgpu/amd_mem_leak.c b/tests/amdgpu/amd_mem_leak.c
index 5bcd2be239e9..9863ec78d143 100644
--- a/tests/amdgpu/amd_mem_leak.c
+++ b/tests/amdgpu/amd_mem_leak.c
@@ -127,7 +127,7 @@ static void test_hotplug(data_t *data)
 	test_fini(data);
 }
 
-igt_main()
+int igt_main()
 {
 	data_t data;
 
diff --git a/tests/amdgpu/amd_mode_switch.c b/tests/amdgpu/amd_mode_switch.c
index eaeafd32a134..57b2b98023f5 100644
--- a/tests/amdgpu/amd_mode_switch.c
+++ b/tests/amdgpu/amd_mode_switch.c
@@ -176,7 +176,7 @@ static void run_mode_switch_first_last(data_t *data, int num_pipes)
 }
 
 IGT_TEST_DESCRIPTION("Test switching between supported modes");
-igt_main()
+int igt_main()
 {
 	data_t data;
 	int i = 0;
diff --git a/tests/amdgpu/amd_module_load.c b/tests/amdgpu/amd_module_load.c
index 589f8bd2aa3a..32e96c4f42ac 100644
--- a/tests/amdgpu/amd_module_load.c
+++ b/tests/amdgpu/amd_module_load.c
@@ -59,7 +59,7 @@ static void sanity_check(void)
 	igt_assert_eq(err, 0);
 }
 
-igt_main()
+int igt_main()
 {
 	igt_describe("Make sure reloading amdgpu drivers works");
 	igt_subtest("reload") {
diff --git a/tests/amdgpu/amd_multidisplay_modeset.c b/tests/amdgpu/amd_multidisplay_modeset.c
index 1a31cd74c8d1..a53cf668fb5c 100644
--- a/tests/amdgpu/amd_multidisplay_modeset.c
+++ b/tests/amdgpu/amd_multidisplay_modeset.c
@@ -406,7 +406,7 @@ static void multiple_display_test(struct data_t *data, enum sub_test test_mode)
 }
 
 IGT_TEST_DESCRIPTION("Test multi-display mode set, display enable and disable");
-igt_main()
+int igt_main()
 {
 	struct data_t data;
 
diff --git a/tests/amdgpu/amd_odm.c b/tests/amdgpu/amd_odm.c
index 3cb2996f746f..101c89e60e4e 100644
--- a/tests/amdgpu/amd_odm.c
+++ b/tests/amdgpu/amd_odm.c
@@ -160,7 +160,7 @@ static void run_test_odmc(struct data *data, enum odmc_mode m, const drmModeMode
 	test_fini(data);
 }
 
-igt_main()
+int igt_main()
 {
 	struct data data;
 
diff --git a/tests/amdgpu/amd_pci_unplug.c b/tests/amdgpu/amd_pci_unplug.c
index ee6ede43017a..65e5843bcc4a 100644
--- a/tests/amdgpu/amd_pci_unplug.c
+++ b/tests/amdgpu/amd_pci_unplug.c
@@ -31,7 +31,7 @@
 #include "lib/amdgpu/amd_ip_blocks.h"
 
 
-igt_main()
+int igt_main()
 {
 
 	struct amd_pci_unplug_setup setup = {0};
diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
index 71c294053369..8bf776f35770 100644
--- a/tests/amdgpu/amd_plane.c
+++ b/tests/amdgpu/amd_plane.c
@@ -896,7 +896,7 @@ static void test_mpo_swizzle_toggle(data_t *data)
 }
 
 
-igt_main()
+int igt_main()
 {
 	data_t data;
 
diff --git a/tests/amdgpu/amd_prime.c b/tests/amdgpu/amd_prime.c
index fbab2d164fe1..73353ab1b3bf 100644
--- a/tests/amdgpu/amd_prime.c
+++ b/tests/amdgpu/amd_prime.c
@@ -428,7 +428,7 @@ static void shrink(int i915, int amd, amdgpu_device_handle device)
 	gem_close(i915, handle);
 }
 
-igt_main()
+int igt_main()
 {
 	amdgpu_device_handle device;
 	int i915 = -1, amd = -1;
diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
index fca68ba0162d..040c39f0abdb 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -700,7 +700,7 @@ static int opt_handler(int option, int option_index, void *data)
 	return IGT_OPT_HANDLER_SUCCESS;
 }
 
-igt_main_args("", long_options, help_str, opt_handler, NULL)
+int igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
 	data_t data;
 
diff --git a/tests/amdgpu/amd_pstate.c b/tests/amdgpu/amd_pstate.c
index d2ea44826254..00662765a2d0 100644
--- a/tests/amdgpu/amd_pstate.c
+++ b/tests/amdgpu/amd_pstate.c
@@ -40,7 +40,7 @@ amdgpu_stable_pstate_test(amdgpu_device_handle device_handle)
 
 }
 
-igt_main()
+int igt_main()
 {
 	amdgpu_device_handle device;
 	int fd = -1;
diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index 3058eac26780..a9259a1b8c9d 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -1100,7 +1100,7 @@ get_num_of_tests(struct dynamic_test *arr_err, enum amd_ip_block_type *ip_tests,
 	return cnt;
 }
 
-igt_main()
+int igt_main()
 {
 	char cmdline[2048];
 	int argc = 0;
diff --git a/tests/amdgpu/amd_ras.c b/tests/amdgpu/amd_ras.c
index 4303908bedc6..380fe80c5f85 100644
--- a/tests/amdgpu/amd_ras.c
+++ b/tests/amdgpu/amd_ras.c
@@ -988,7 +988,7 @@ ras_tests_cleanup(struct amd_ras_setup *setup)
 	}
 }
 
-igt_main()
+int igt_main()
 {
 	struct amd_ras_setup setup = {};
 	bool render_mode = true;
diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
index 6755ec3521a2..d06f56df233c 100644
--- a/tests/amdgpu/amd_replay.c
+++ b/tests/amdgpu/amd_replay.c
@@ -407,7 +407,7 @@ static int opt_handler(int option, int option_index, void *data)
 	return IGT_OPT_HANDLER_SUCCESS;
 }
 
-igt_main_args("", long_options, help_str, opt_handler, NULL)
+int igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
 	struct test_data data;
 
diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
index cef083d23b42..9ebb3fa833e3 100644
--- a/tests/amdgpu/amd_security.c
+++ b/tests/amdgpu/amd_security.c
@@ -308,7 +308,7 @@ is_security_tests_enable(amdgpu_device_handle device_handle,
 	return enable;
 }
 
-igt_main()
+int igt_main()
 {
 	amdgpu_device_handle device;
 	struct amdgpu_gpu_info gpu_info = {};
diff --git a/tests/amdgpu/amd_subvp.c b/tests/amdgpu/amd_subvp.c
index 984d661e846c..7d29bcf10d18 100644
--- a/tests/amdgpu/amd_subvp.c
+++ b/tests/amdgpu/amd_subvp.c
@@ -152,7 +152,7 @@ static void test_subvp(struct data *data)
 	test_fini(data);
 }
 
-igt_main()
+int igt_main()
 {
 	struct data data;
 
diff --git a/tests/amdgpu/amd_syncobj.c b/tests/amdgpu/amd_syncobj.c
index e06769bcab67..0f381262c1ba 100644
--- a/tests/amdgpu/amd_syncobj.c
+++ b/tests/amdgpu/amd_syncobj.c
@@ -234,7 +234,7 @@ amdgpu_syncobj_timeline(amdgpu_device_handle device_handle)
 
 }
 
-igt_main()
+int igt_main()
 {
 	amdgpu_device_handle device;
 	int fd = -1;
diff --git a/tests/amdgpu/amd_uvd_dec.c b/tests/amdgpu/amd_uvd_dec.c
index 5e7d5b34fa20..6eeadc4590e6 100644
--- a/tests/amdgpu/amd_uvd_dec.c
+++ b/tests/amdgpu/amd_uvd_dec.c
@@ -294,7 +294,7 @@ amdgpu_uvd_dec_destroy(amdgpu_device_handle device_handle, struct mmd_context *c
 	igt_assert_eq(r, 0);
 }
 
-igt_main()
+int igt_main()
 {
 	amdgpu_device_handle device;
 	struct mmd_context context = {};
diff --git a/tests/amdgpu/amd_uvd_enc.c b/tests/amdgpu/amd_uvd_enc.c
index 4e2780239681..5eda30979099 100644
--- a/tests/amdgpu/amd_uvd_enc.c
+++ b/tests/amdgpu/amd_uvd_enc.c
@@ -309,7 +309,7 @@ amdgpu_uvd_enc_test(amdgpu_device_handle device, struct mmd_shared_context *shar
 
 }
 
-igt_main()
+int igt_main()
 {
 	amdgpu_device_handle device;
 	struct mmd_shared_context shared_context = {};
diff --git a/tests/amdgpu/amd_vce_enc.c b/tests/amdgpu/amd_vce_enc.c
index a95e13d98620..55234ee34c65 100644
--- a/tests/amdgpu/amd_vce_enc.c
+++ b/tests/amdgpu/amd_vce_enc.c
@@ -586,7 +586,7 @@ amdgpu_vce_enc_test(amdgpu_device_handle device, struct mmd_shared_context *shar
 	mmd_context_clean(device, context);
 }
 
-igt_main()
+int igt_main()
 {
 	amdgpu_device_handle device;
 	struct mmd_shared_context shared_context = {};
diff --git a/tests/amdgpu/amd_vcn.c b/tests/amdgpu/amd_vcn.c
index 2c7a84ccb22e..b42467f1f6c7 100644
--- a/tests/amdgpu/amd_vcn.c
+++ b/tests/amdgpu/amd_vcn.c
@@ -1231,7 +1231,7 @@ amdgpu_cs_vcn_enc_destroy(amdgpu_device_handle device_handle,
 	free_resource(&v_context->enc_buf);
 }
 
-igt_main()
+int igt_main()
 {
 	amdgpu_device_handle device;
 	struct mmd_context context = {};
diff --git a/tests/amdgpu/amd_vcn_queue.c b/tests/amdgpu/amd_vcn_queue.c
index 8ba48389f626..3dad9e7b3398 100644
--- a/tests/amdgpu/amd_vcn_queue.c
+++ b/tests/amdgpu/amd_vcn_queue.c
@@ -57,7 +57,7 @@ vcn_queue_test(amdgpu_device_handle device_handle,
 	return 0;
 }
 
-igt_main()
+int igt_main()
 {
 	amdgpu_device_handle device;
 	struct mmd_context context = {};
diff --git a/tests/amdgpu/amd_vm.c b/tests/amdgpu/amd_vm.c
index b9d5bbae5ac4..d5377fd61598 100644
--- a/tests/amdgpu/amd_vm.c
+++ b/tests/amdgpu/amd_vm.c
@@ -197,7 +197,7 @@ amdgpu_vm_mapping_test(amdgpu_device_handle device_handle)
 	amdgpu_bo_free(buf);
 }
 
-igt_main()
+int igt_main()
 {
 	amdgpu_device_handle device;
 	struct amdgpu_gpu_info gpu_info = {};
diff --git a/tests/amdgpu/amd_vpe.c b/tests/amdgpu/amd_vpe.c
index a6f49e605ac0..072e521c933a 100644
--- a/tests/amdgpu/amd_vpe.c
+++ b/tests/amdgpu/amd_vpe.c
@@ -214,7 +214,7 @@ static void amdgpu_cs_vpe_blit(amdgpu_device_handle device_handle,
 	free_resource(&dst_plane_bo);
 }
 
-igt_main()
+int igt_main()
 {
 	struct mmd_context context = {};
 	struct mmd_shared_context shared_context = {};
diff --git a/tests/amdgpu/amd_vrr_range.c b/tests/amdgpu/amd_vrr_range.c
index 5378e9cbda84..dc911323e2e2 100644
--- a/tests/amdgpu/amd_vrr_range.c
+++ b/tests/amdgpu/amd_vrr_range.c
@@ -456,7 +456,7 @@ static inline void test_freesync_range_suspend(data_t *data)
 	test_freesync_range_base(data, TEST_SUSPEND);
 }
 
-igt_main()
+int igt_main()
 {
 	data_t data;
 
diff --git a/tests/chamelium/kms_chamelium_audio.c b/tests/chamelium/kms_chamelium_audio.c
index 89003fec468e..c89f644fffd0 100644
--- a/tests/chamelium/kms_chamelium_audio.c
+++ b/tests/chamelium/kms_chamelium_audio.c
@@ -848,7 +848,7 @@ static void test_display_audio_edid(chamelium_data_t *data,
 }
 
 IGT_TEST_DESCRIPTION("Testing Audio with a Chamelium board");
-igt_main()
+int igt_main()
 {
 	chamelium_data_t data;
 	struct chamelium_port *port;
diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index c07ea8b157c3..fd4f2aad46d6 100644
--- a/tests/chamelium/kms_chamelium_color.c
+++ b/tests/chamelium/kms_chamelium_color.c
@@ -713,7 +713,7 @@ run_tests_for_pipe(data_t *data)
 
 }
 
-igt_main()
+int igt_main()
 {
 	int i;
 	data_t data = {};
diff --git a/tests/chamelium/kms_chamelium_edid.c b/tests/chamelium/kms_chamelium_edid.c
index 9e21a68f7db8..566a4f0ac886 100644
--- a/tests/chamelium/kms_chamelium_edid.c
+++ b/tests/chamelium/kms_chamelium_edid.c
@@ -519,7 +519,7 @@ const char *help_str =
 	"  -e \tExtended tests.\n";
 
 IGT_TEST_DESCRIPTION("Testing EDID with a Chamelium board");
-igt_main_args("e", NULL, help_str, opt_handler, NULL)
+int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 {
 	chamelium_data_t data;
 	struct chamelium_port *port;
diff --git a/tests/chamelium/kms_chamelium_frames.c b/tests/chamelium/kms_chamelium_frames.c
index 3bc1902a9f27..29f957385ce0 100644
--- a/tests/chamelium/kms_chamelium_frames.c
+++ b/tests/chamelium/kms_chamelium_frames.c
@@ -984,7 +984,7 @@ static void test_display_planes_random(chamelium_data_t *data,
 }
 
 IGT_TEST_DESCRIPTION("Tests requiring a Chamelium board");
-igt_main()
+int igt_main()
 {
 	chamelium_data_t data;
 	struct chamelium_port *port;
diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_chamelium_hpd.c
index e35132d14115..d1460533f276 100644
--- a/tests/chamelium/kms_chamelium_hpd.c
+++ b/tests/chamelium/kms_chamelium_hpd.c
@@ -460,7 +460,7 @@ static void test_hpd_storm_disable(chamelium_data_t *data,
 }
 
 IGT_TEST_DESCRIPTION("Testing HPD with a Chamelium board");
-igt_main()
+int igt_main()
 {
 	chamelium_data_t data;
 	struct chamelium_port *port;
diff --git a/tests/chamelium/kms_chamelium_sharpness_filter.c b/tests/chamelium/kms_chamelium_sharpness_filter.c
index a25ac8ad6dc0..014532d5c6b8 100644
--- a/tests/chamelium/kms_chamelium_sharpness_filter.c
+++ b/tests/chamelium/kms_chamelium_sharpness_filter.c
@@ -241,7 +241,7 @@ run_sharpness_filter_test(data_t *data)
 	}
 }
 
-igt_main()
+int igt_main()
 {
 	data_t data = {};
 
diff --git a/tests/core_auth.c b/tests/core_auth.c
index e6f4c60fca65..31ba2cfb2d24 100644
--- a/tests/core_auth.c
+++ b/tests/core_auth.c
@@ -214,7 +214,7 @@ static void test_basic_auth(int master)
 	drm_close_driver(slave);
 }
 
-igt_main()
+int igt_main()
 {
 	/* root (which we run igt as) should always be authenticated */
 	igt_describe("Check drm client is always authenticated.");
diff --git a/tests/core_debugfs.c b/tests/core_debugfs.c
index 7f754ce052c1..0e654c3e3497 100644
--- a/tests/core_debugfs.c
+++ b/tests/core_debugfs.c
@@ -23,7 +23,7 @@
 
 IGT_TEST_DESCRIPTION("Read entries from debugfs");
 
-igt_main()
+int igt_main()
 {
 	int debugfs = -1;
 	int fd = -1;
diff --git a/tests/core_getclient.c b/tests/core_getclient.c
index bea04157f03f..fccf148543b9 100644
--- a/tests/core_getclient.c
+++ b/tests/core_getclient.c
@@ -47,7 +47,7 @@
 
 IGT_TEST_DESCRIPTION("Tests the DRM_IOCTL_GET_CLIENT ioctl.");
 
-igt_main()
+int igt_main()
 {
 	int fd, ret;
 	drm_client_t client;
diff --git a/tests/core_getstats.c b/tests/core_getstats.c
index fc8bd510f969..4dddeb48c50f 100644
--- a/tests/core_getstats.c
+++ b/tests/core_getstats.c
@@ -55,7 +55,7 @@
 
 IGT_TEST_DESCRIPTION("Tests the DRM_IOCTL_GET_STATS ioctl.");
 
-igt_main()
+int igt_main()
 {
 	int fd, ret;
 	drm_stats_t stats;
diff --git a/tests/core_getversion.c b/tests/core_getversion.c
index 2c69a65a5cd8..e4092e167b2d 100644
--- a/tests/core_getversion.c
+++ b/tests/core_getversion.c
@@ -81,7 +81,7 @@ static void check_all_drm(void)
 	}
 }
 
-igt_main()
+int igt_main()
 {
 	char info[256];
 	int fd;
diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index a970da41d196..e23b5b89fd48 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -672,7 +672,7 @@ static void hotreplug_lateclose(struct hotunplug *priv)
 
 /* Main */
 
-igt_main()
+int igt_main()
 {
 	struct hotunplug priv = {
 		.fd		= { .drm = -1, .drm_hc = -1, .sysfs_dev = -1, },
diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
index b2063b9bccd2..ecb5307961e0 100644
--- a/tests/core_setmaster.c
+++ b/tests/core_setmaster.c
@@ -133,7 +133,7 @@ static void tweak_perm(uint8_t *saved_perm, char *path, bool save)
 	igt_assert_f(!ret, "chmod failed with %d path=%s\n", errno, path);
 }
 
-igt_main()
+int igt_main()
 {
 	igt_fixture() {
 		/*
diff --git a/tests/core_sysfs.c b/tests/core_sysfs.c
index 857dd3c537e9..3173ffa7be36 100644
--- a/tests/core_sysfs.c
+++ b/tests/core_sysfs.c
@@ -24,7 +24,7 @@
 
 IGT_TEST_DESCRIPTION("Read entries from sysfs paths.");
 
-igt_main()
+int igt_main()
 {
 	int fd = -1;
 	int sysfs = -1;
diff --git a/tests/device_reset.c b/tests/device_reset.c
index e51daacf43fa..62b295a06e9c 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -439,7 +439,7 @@ static void unbind_reset_rebind(struct device_fds *dev, enum reset type)
 	driver_bind(dev);
 }
 
-igt_main()
+int igt_main()
 {
 	struct device_fds dev = { .fds = {-1, -1, -1}, .dev_bus_addr = {0}, };
 
diff --git a/tests/dmabuf.c b/tests/dmabuf.c
index da8bc0735bf0..322981473313 100644
--- a/tests/dmabuf.c
+++ b/tests/dmabuf.c
@@ -92,7 +92,7 @@ static int wrapper(const char *dynamic_name,
 	return igt_kselftest_execute(tst, tl, NULL, NULL);
 }
 
-igt_main()
+int igt_main()
 {
 	igt_kselftests("dmabuf_selftests", NULL, NULL, NULL, wrapper);
 }
diff --git a/tests/dmabuf_sync_file.c b/tests/dmabuf_sync_file.c
index 18a75f80a3d9..118727697511 100644
--- a/tests/dmabuf_sync_file.c
+++ b/tests/dmabuf_sync_file.c
@@ -354,7 +354,7 @@ static void test_import_multiple(int fd, bool write)
 	igt_assert(!sync_file_busy(write_sync_file));
 }
 
-igt_main()
+int igt_main()
 {
 	int fd;
 
diff --git a/tests/drm_buddy.c b/tests/drm_buddy.c
index 58e7a582c542..dbc7c957d116 100644
--- a/tests/drm_buddy.c
+++ b/tests/drm_buddy.c
@@ -8,7 +8,7 @@
 
 IGT_TEST_DESCRIPTION("Basic sanity check of DRM's buddy allocator (struct drm_buddy)");
 
-igt_main()
+int igt_main()
 {
 	igt_kunit("drm_buddy_test", NULL, NULL);
 }
diff --git a/tests/drm_mm.c b/tests/drm_mm.c
index 58e56058bf1b..48ab2dfeabe1 100644
--- a/tests/drm_mm.c
+++ b/tests/drm_mm.c
@@ -78,7 +78,7 @@
 
 IGT_TEST_DESCRIPTION("Basic sanity check of DRM's range manager (struct drm_mm)");
 
-igt_main()
+int igt_main()
 {
 	igt_kunit("drm_mm_test", NULL, NULL);
 }
diff --git a/tests/drm_read.c b/tests/drm_read.c
index f48cd71ac8ac..151294fa710f 100644
--- a/tests/drm_read.c
+++ b/tests/drm_read.c
@@ -270,7 +270,7 @@ static void test_short_buffer_wakeup(int in, enum pipe pipe)
 	close(w.fd);
 }
 
-igt_main()
+int igt_main()
 {
 	igt_display_t display;
 	struct igt_fb fb;
diff --git a/tests/drm_virtgpu.c b/tests/drm_virtgpu.c
index b632708d104b..f4b35d4dfc74 100644
--- a/tests/drm_virtgpu.c
+++ b/tests/drm_virtgpu.c
@@ -156,7 +156,7 @@ static void create_resource_if_needed(void)
 		 args.res_handle, args.bo_handle);
 }
 
-igt_main() {
+int igt_main() {
 	void *caps_buf = NULL;
 
 	igt_fixture() {
diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
index ae89618bedb1..431568b9a519 100644
--- a/tests/dumb_buffer.c
+++ b/tests/dumb_buffer.c
@@ -389,7 +389,7 @@ static void always_clear(int fd, int timeout)
 	igt_info("Checked %'lu page allocations\n", checked);
 }
 
-igt_main()
+int igt_main()
 {
 	int fd = -1;
 
diff --git a/tests/fbdev.c b/tests/fbdev.c
index cb331ba00f0a..a1f855ea477b 100644
--- a/tests/fbdev.c
+++ b/tests/fbdev.c
@@ -452,7 +452,7 @@ static void framebuffer_tests(int fd)
 	}
 }
 
-igt_main()
+int igt_main()
 {
 	volatile int fd = -1;
 
diff --git a/tests/intel/api_intel_allocator.c b/tests/intel/api_intel_allocator.c
index 56889fe6cbd6..464576d1bb61 100644
--- a/tests/intel/api_intel_allocator.c
+++ b/tests/intel/api_intel_allocator.c
@@ -810,7 +810,7 @@ struct allocators {
 	{NULL, 0},
 };
 
-igt_main()
+int igt_main()
 {
 	int fd;
 	struct allocators *a;
diff --git a/tests/intel/api_intel_bb.c b/tests/intel/api_intel_bb.c
index 735ca8194547..67e923cef3ac 100644
--- a/tests/intel/api_intel_bb.c
+++ b/tests/intel/api_intel_bb.c
@@ -1579,7 +1579,7 @@ const char *help_str =
 	"  -c n\tCalculate crc up to (1 << n)\n"
 	;
 
-igt_main_args("dpibc:", NULL, help_str, opt_handler, NULL)
+int igt_main_args("dpibc:", NULL, help_str, opt_handler, NULL)
 {
 	int i915, i, gen;
 	struct buf_ops *bops;
diff --git a/tests/intel/gem_bad_reloc.c b/tests/intel/gem_bad_reloc.c
index a3219827f544..8a5f4eae41c2 100644
--- a/tests/intel/gem_bad_reloc.c
+++ b/tests/intel/gem_bad_reloc.c
@@ -206,7 +206,7 @@ static void negative_reloc_blt(int fd)
 		igt_assert_eq(buf[i], 0xc0ffee ^ i);
 }
 
-igt_main()
+int igt_main()
 {
 	int fd = -1;
 
diff --git a/tests/intel/gem_barrier_race.c b/tests/intel/gem_barrier_race.c
index e47f9cd82760..ab8732ee943d 100644
--- a/tests/intel/gem_barrier_race.c
+++ b/tests/intel/gem_barrier_race.c
@@ -143,7 +143,7 @@ static void test_remote_request(int fd, uint64_t engine, unsigned int timeout)
 	munmap(done, 4096);
 }
 
-igt_main()
+int igt_main()
 {
 	int fd;
 
diff --git a/tests/intel/gem_basic.c b/tests/intel/gem_basic.c
index 94ba793721c2..602269b49272 100644
--- a/tests/intel/gem_basic.c
+++ b/tests/intel/gem_basic.c
@@ -105,7 +105,7 @@ test_create_fd_close(int fd)
 	close(fd);
 }
 
-igt_main()
+int igt_main()
 {
 	igt_fd_t(fd);
 	int gpu_count;
diff --git a/tests/intel/gem_blits.c b/tests/intel/gem_blits.c
index 236b22a44d20..3f7fb1564949 100644
--- a/tests/intel/gem_blits.c
+++ b/tests/intel/gem_blits.c
@@ -820,7 +820,7 @@ static bool blit_supports_tiling(int fd, enum blt_tiling_type tiling)
 	}
 }
 
-igt_main()
+int igt_main()
 {
 	struct device device;
 
diff --git a/tests/intel/gem_busy.c b/tests/intel/gem_busy.c
index 13b8ad8441bf..55140284733c 100644
--- a/tests/intel/gem_busy.c
+++ b/tests/intel/gem_busy.c
@@ -469,7 +469,7 @@ static void all(int i915, const intel_ctx_t *ctx)
 		for_each_if (gem_class_can_store_dword(i915, (e)->class)) \
 			igt_dynamic_f("%s", (e)->name)
 
-igt_main()
+int igt_main()
 {
 	const struct intel_execution_engine2 *e;
 	const intel_ctx_t *ctx;
diff --git a/tests/intel/gem_caching.c b/tests/intel/gem_caching.c
index 0a613dbf0be8..ca6229a9a0de 100644
--- a/tests/intel/gem_caching.c
+++ b/tests/intel/gem_caching.c
@@ -155,7 +155,7 @@ blt_bo_fill(data_t *data, struct intel_bb *ibb, struct intel_buf *tmp_bo,
 #define TEST_READ 0x1
 #define TEST_WRITE 0x2
 #define TEST_BOTH (TEST_READ | TEST_WRITE)
-igt_main()
+int igt_main()
 {
 	struct intel_buf *scratch_buf, *staging_buf;
 	struct intel_bb *ibb;
diff --git a/tests/intel/gem_ccs.c b/tests/intel/gem_ccs.c
index ca7f94385444..838a1d712b41 100644
--- a/tests/intel/gem_ccs.c
+++ b/tests/intel/gem_ccs.c
@@ -766,7 +766,7 @@ const char *help_str =
 	"  -H\tHeight (default 512)"
 	;
 
-igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
+int igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 {
 	struct drm_i915_query_memory_regions *query_info;
 	struct igt_collection *set;
diff --git a/tests/intel/gem_close.c b/tests/intel/gem_close.c
index fa99bb8c1f5b..23bfe25dd015 100644
--- a/tests/intel/gem_close.c
+++ b/tests/intel/gem_close.c
@@ -137,7 +137,7 @@ static void test_many_handles(int fd)
 	}
 }
 
-igt_main()
+int igt_main()
 {
 	igt_fd_t(fd);
 
diff --git a/tests/intel/gem_close_race.c b/tests/intel/gem_close_race.c
index 2359671ebe0a..b2688774d7f0 100644
--- a/tests/intel/gem_close_race.c
+++ b/tests/intel/gem_close_race.c
@@ -336,7 +336,7 @@ static void threads(int timeout, unsigned int flags)
 	drm_close_driver(fd);
 }
 
-igt_main()
+int igt_main()
 {
 	int gpu_count;
 
diff --git a/tests/intel/gem_compute.c b/tests/intel/gem_compute.c
index ad5542c140fe..2cabbcd0b019 100644
--- a/tests/intel/gem_compute.c
+++ b/tests/intel/gem_compute.c
@@ -31,7 +31,7 @@ test_compute_square(int fd)
 		      "GPU not supported\n");
 }
 
-igt_main()
+int igt_main()
 {
 	int i915;
 
diff --git a/tests/intel/gem_concurrent_all.c b/tests/intel/gem_concurrent_all.c
index 65db04bfee97..6418883317a7 100644
--- a/tests/intel/gem_concurrent_all.c
+++ b/tests/intel/gem_concurrent_all.c
@@ -1775,7 +1775,7 @@ num_buffers(uint64_t max,
 	return n;
 }
 
-igt_main()
+int igt_main()
 {
 	const struct access_mode modes[] = {
 		{
diff --git a/tests/intel/gem_create.c b/tests/intel/gem_create.c
index 87490b3757c1..51ae3e90b427 100644
--- a/tests/intel/gem_create.c
+++ b/tests/intel/gem_create.c
@@ -946,7 +946,7 @@ static void create_ext_cpu_access_big(int fd)
 	free(regions);
 }
 
-igt_main()
+int igt_main()
 {
 	igt_fd_t(fd);
 
diff --git a/tests/intel/gem_cs_tlb.c b/tests/intel/gem_cs_tlb.c
index fd40d6484f24..cf7c46509881 100644
--- a/tests/intel/gem_cs_tlb.c
+++ b/tests/intel/gem_cs_tlb.c
@@ -154,7 +154,7 @@ static void run_on_ring(int fd, const intel_ctx_t *ctx,
 	}
 }
 
-igt_main()
+int igt_main()
 {
 	const struct intel_execution_engine2 *e;
 	const intel_ctx_t *ctx;
diff --git a/tests/intel/gem_ctx_bad_destroy.c b/tests/intel/gem_ctx_bad_destroy.c
index 83e56420be3d..c77414355b3f 100644
--- a/tests/intel/gem_ctx_bad_destroy.c
+++ b/tests/intel/gem_ctx_bad_destroy.c
@@ -58,7 +58,7 @@ IGT_TEST_DESCRIPTION("Negative test cases for destroy contexts.");
 uint32_t ctx_id;
 int fd;
 
-igt_main()
+int igt_main()
 {
 	igt_fixture() {
 		fd = drm_open_driver_render(DRIVER_INTEL);
diff --git a/tests/intel/gem_ctx_create.c b/tests/intel/gem_ctx_create.c
index 6bebc290d249..be7d4657110c 100644
--- a/tests/intel/gem_ctx_create.c
+++ b/tests/intel/gem_ctx_create.c
@@ -614,7 +614,7 @@ static void iris_pipeline(int i915)
 #endif /* I915_DEFINE_CONTEXT_PARAM_ENGINES */
 }
 
-igt_main()
+int igt_main()
 {
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	struct drm_i915_gem_context_create create;
diff --git a/tests/intel/gem_ctx_engines.c b/tests/intel/gem_ctx_engines.c
index b626094875ca..de1935ec57ce 100644
--- a/tests/intel/gem_ctx_engines.c
+++ b/tests/intel/gem_ctx_engines.c
@@ -609,7 +609,7 @@ static void independent_all(int i915, const intel_ctx_t *ctx)
 	igt_waitchildren();
 }
 
-igt_main()
+int igt_main()
 {
 	const struct intel_execution_engine2 *e;
 	igt_fd_t(i915);
diff --git a/tests/intel/gem_ctx_exec.c b/tests/intel/gem_ctx_exec.c
index 481bd18323f3..dd4369e28559 100644
--- a/tests/intel/gem_ctx_exec.c
+++ b/tests/intel/gem_ctx_exec.c
@@ -486,7 +486,7 @@ static void close_race(int i915)
 	munmap(ctx_id, 4096);
 }
 
-igt_main()
+int igt_main()
 {
 	const uint32_t batch[2] = { 0, MI_BATCH_BUFFER_END };
 	uint32_t handle;
diff --git a/tests/intel/gem_ctx_freq.c b/tests/intel/gem_ctx_freq.c
index 3fb87b79fd34..c11cd53c2d95 100644
--- a/tests/intel/gem_ctx_freq.c
+++ b/tests/intel/gem_ctx_freq.c
@@ -260,7 +260,7 @@ static void disable_boost(void)
 		__disable_boost(dirfd);
 }
 
-igt_main()
+int igt_main()
 {
 	igt_fixture() {
 		i915 = drm_open_driver(DRIVER_INTEL);
diff --git a/tests/intel/gem_ctx_isolation.c b/tests/intel/gem_ctx_isolation.c
index 1337b86a05e0..e1585cbc67b3 100644
--- a/tests/intel/gem_ctx_isolation.c
+++ b/tests/intel/gem_ctx_isolation.c
@@ -1004,7 +1004,7 @@ static unsigned int __has_context_isolation(int fd)
 		for_each_if(mask & (1 << (e)->class)) \
 			igt_dynamic_f("%s", (e)->name)
 
-igt_main()
+int igt_main()
 {
 	unsigned int has_context_isolation = 0;
 	const struct intel_execution_engine2 *e;
diff --git a/tests/intel/gem_ctx_param.c b/tests/intel/gem_ctx_param.c
index 5da9522f51b6..30463209be9b 100644
--- a/tests/intel/gem_ctx_param.c
+++ b/tests/intel/gem_ctx_param.c
@@ -372,7 +372,7 @@ static void test_get_invalid_param(int fd, uint64_t param)
 	igt_assert_eq(err, -EINVAL);
 }
 
-igt_main()
+int igt_main()
 {
 	struct drm_i915_gem_context_param arg;
 	int fd;
diff --git a/tests/intel/gem_ctx_persistence.c b/tests/intel/gem_ctx_persistence.c
index 379a82d42185..6645743a977b 100644
--- a/tests/intel/gem_ctx_persistence.c
+++ b/tests/intel/gem_ctx_persistence.c
@@ -1331,7 +1331,7 @@ static void exit_handler(int sig)
 	enable_hangcheck(i915);
 }
 
-igt_main()
+int igt_main()
 {
 	const intel_ctx_cfg_t empty_cfg = {};
 	struct {
diff --git a/tests/intel/gem_ctx_shared.c b/tests/intel/gem_ctx_shared.c
index c9af1ae0a813..fc15ecd1fd3d 100644
--- a/tests/intel/gem_ctx_shared.c
+++ b/tests/intel/gem_ctx_shared.c
@@ -1023,7 +1023,7 @@ static void smoketest(int i915, const intel_ctx_cfg_t *cfg,
 			    !gem_engine_can_block_ggtt_binder(i915, e)) \
 			igt_dynamic_f("%s", e->name)
 
-igt_main()
+int igt_main()
 {
 	const struct intel_execution_engine2 *e;
 	intel_ctx_cfg_t cfg;
diff --git a/tests/intel/gem_ctx_sseu.c b/tests/intel/gem_ctx_sseu.c
index aa4e8472761a..20ab14784a7f 100644
--- a/tests/intel/gem_ctx_sseu.c
+++ b/tests/intel/gem_ctx_sseu.c
@@ -514,7 +514,7 @@ out:
 	gem_context_destroy(fd, arg.ctx_id);
 }
 
-igt_main()
+int igt_main()
 {
 	int fd;
 
diff --git a/tests/intel/gem_ctx_switch.c b/tests/intel/gem_ctx_switch.c
index 270d4c8cc0ba..2c1b84bbef70 100644
--- a/tests/intel/gem_ctx_switch.c
+++ b/tests/intel/gem_ctx_switch.c
@@ -686,7 +686,7 @@ has_queues(int fd)
 	return gem_has_vm(fd) && gem_context_has_single_timeline(fd);
 }
 
-igt_main()
+int igt_main()
 {
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	const struct intel_execution_engine2 *e2;
diff --git a/tests/intel/gem_eio.c b/tests/intel/gem_eio.c
index fafed9205ad0..290f3e2e870f 100644
--- a/tests/intel/gem_eio.c
+++ b/tests/intel/gem_eio.c
@@ -1102,7 +1102,7 @@ exit_handler(int sig)
 	igt_force_gpu_reset(fd);
 }
 
-igt_main()
+int igt_main()
 {
 	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
diff --git a/tests/intel/gem_evict_alignment.c b/tests/intel/gem_evict_alignment.c
index acea339166a4..0c1f4ac5294a 100644
--- a/tests/intel/gem_evict_alignment.c
+++ b/tests/intel/gem_evict_alignment.c
@@ -209,7 +209,7 @@ static void major_evictions(int fd, uint64_t size, uint64_t count)
 
 #define MAX_32b ((1ull << 32) - 4096)
 
-igt_main()
+int igt_main()
 {
 	uint64_t size, count;
 	int fd = -1;
diff --git a/tests/intel/gem_evict_everything.c b/tests/intel/gem_evict_everything.c
index 40d79a52c1e8..28ac675132a8 100644
--- a/tests/intel/gem_evict_everything.c
+++ b/tests/intel/gem_evict_everything.c
@@ -241,7 +241,7 @@ static void test_major_evictions(int fd, uint64_t size, uint64_t count)
 
 #define MAX_32b ((1ull << 32) - 4096)
 
-igt_main()
+int igt_main()
 {
 	uint64_t size, count;
 	int fd;
diff --git a/tests/intel/gem_exec_alignment.c b/tests/intel/gem_exec_alignment.c
index 628b4d226368..a71e180b4217 100644
--- a/tests/intel/gem_exec_alignment.c
+++ b/tests/intel/gem_exec_alignment.c
@@ -548,7 +548,7 @@ static void single(int fd)
 	gem_close(fd, execobj.handle);
 }
 
-igt_main()
+int igt_main()
 {
 	igt_fd_t(fd);
 
diff --git a/tests/intel/gem_exec_async.c b/tests/intel/gem_exec_async.c
index a3d5705dde34..9af06bb419ee 100644
--- a/tests/intel/gem_exec_async.c
+++ b/tests/intel/gem_exec_async.c
@@ -189,7 +189,7 @@ static bool has_async_execbuf(int fd)
 	igt_subtest_with_dynamic(T) for_each_ctx_engine(i915, ctx, e) \
 		igt_dynamic_f("%s", (e)->name)
 
-igt_main()
+int igt_main()
 {
 	const struct intel_execution_engine2 *e;
 	const intel_ctx_t *ctx;
diff --git a/tests/intel/gem_exec_await.c b/tests/intel/gem_exec_await.c
index 66dfbc3d4a16..6a71893d1461 100644
--- a/tests/intel/gem_exec_await.c
+++ b/tests/intel/gem_exec_await.c
@@ -251,7 +251,7 @@ static void wide(int fd, intel_ctx_cfg_t *cfg, int ring_size,
 
 #define TIMEOUT 20
 
-igt_main()
+int igt_main()
 {
 	intel_ctx_cfg_t cfg;
 	int ring_size = 0;
diff --git a/tests/intel/gem_exec_balancer.c b/tests/intel/gem_exec_balancer.c
index ce9859420b71..19c612bb35bd 100644
--- a/tests/intel/gem_exec_balancer.c
+++ b/tests/intel/gem_exec_balancer.c
@@ -3409,7 +3409,7 @@ static bool has_parallel_execbuf(int i915)
 	return false;
 }
 
-igt_main()
+int igt_main()
 {
 	igt_fd_t(i915);
 
diff --git a/tests/intel/gem_exec_basic.c b/tests/intel/gem_exec_basic.c
index b4afd440b540..a99d407ae8cf 100644
--- a/tests/intel/gem_exec_basic.c
+++ b/tests/intel/gem_exec_basic.c
@@ -53,7 +53,7 @@ static uint32_t batch_create(int fd, uint64_t *batch_size, uint32_t region)
 	return handle;
 }
 
-igt_main()
+int igt_main()
 {
 	const struct intel_execution_engine2 *e;
 	struct drm_i915_query_memory_regions *query_info;
diff --git a/tests/intel/gem_exec_big.c b/tests/intel/gem_exec_big.c
index 5050364624ae..5430af47e2e2 100644
--- a/tests/intel/gem_exec_big.c
+++ b/tests/intel/gem_exec_big.c
@@ -318,7 +318,7 @@ static void single(int i915)
 		munmap(ptr, batch_size);
 }
 
-igt_main()
+int igt_main()
 {
 	int i915 = -1;
 
diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/gem_exec_capture.c
index a424480ac3ce..15058e28db06 100644
--- a/tests/intel/gem_exec_capture.c
+++ b/tests/intel/gem_exec_capture.c
@@ -955,7 +955,7 @@ static size_t safer_strlen(const char *s)
 	igt_subtest_with_dynamic(T) for_each_ctx_engine(i915, ctx, e) \
 		for_each_if(gem_class_can_store_dword(i915, (e)->class)) \
 
-igt_main()
+int igt_main()
 {
 	const struct intel_execution_engine2 *e;
 	const intel_ctx_t *ctx;
diff --git a/tests/intel/gem_exec_create.c b/tests/intel/gem_exec_create.c
index 6e7553b2b08c..54ef82c3e843 100644
--- a/tests/intel/gem_exec_create.c
+++ b/tests/intel/gem_exec_create.c
@@ -176,7 +176,7 @@ static void all(int fd, unsigned flags, int timeout, int ncpus, uint32_t region)
 	intel_ctx_destroy(fd, ctx);
 }
 
-igt_main()
+int igt_main()
 {
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	struct drm_i915_query_memory_regions *query_info;
diff --git a/tests/intel/gem_exec_endless.c b/tests/intel/gem_exec_endless.c
index db6f0bcd8128..7f35e985c50d 100644
--- a/tests/intel/gem_exec_endless.c
+++ b/tests/intel/gem_exec_endless.c
@@ -341,7 +341,7 @@ static void unpin_rps(int sysfs)
 	}
 }
 
-igt_main()
+int igt_main()
 {
 	const struct intel_execution_engine2 *e;
 	igt_fd_t(i915);
diff --git a/tests/intel/gem_exec_fair.c b/tests/intel/gem_exec_fair.c
index b73a1771d5f1..ac23714b7c5f 100644
--- a/tests/intel/gem_exec_fair.c
+++ b/tests/intel/gem_exec_fair.c
@@ -1289,7 +1289,7 @@ static bool set_heartbeat(int i915, const char *name, unsigned int value)
 	return true;
 }
 
-igt_main()
+int igt_main()
 {
 	static const struct {
 		const char *name;
diff --git a/tests/intel/gem_exec_fence.c b/tests/intel/gem_exec_fence.c
index ed9232629f1c..bc2755031a2c 100644
--- a/tests/intel/gem_exec_fence.c
+++ b/tests/intel/gem_exec_fence.c
@@ -3155,7 +3155,7 @@ static void test_syncobj_backward_timeline_chain_engines(int fd, const intel_ctx
 	teardown_timeline_chain_engines(&ctx);
 }
 
-igt_main()
+int igt_main()
 {
 	const struct intel_execution_engine2 *e;
 	const intel_ctx_t *ctx;
diff --git a/tests/intel/gem_exec_flush.c b/tests/intel/gem_exec_flush.c
index 437572f6c0f7..cd8d32810f15 100644
--- a/tests/intel/gem_exec_flush.c
+++ b/tests/intel/gem_exec_flush.c
@@ -2074,7 +2074,7 @@ static const char *yesno(bool x)
 	return x ? "yes" : "no";
 }
 
-igt_main()
+int igt_main()
 {
 	const struct intel_execution_ring *e;
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
diff --git a/tests/intel/gem_exec_gttfill.c b/tests/intel/gem_exec_gttfill.c
index fe0df37eb790..4275d2beacd5 100644
--- a/tests/intel/gem_exec_gttfill.c
+++ b/tests/intel/gem_exec_gttfill.c
@@ -244,7 +244,7 @@ static void fillgtt(int fd, const intel_ctx_t *ctx, unsigned ring, int timeout)
 	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
 }
 
-igt_main()
+int igt_main()
 {
 	const struct intel_execution_engine2 *e;
 	const intel_ctx_t *ctx;
diff --git a/tests/intel/gem_exec_latency.c b/tests/intel/gem_exec_latency.c
index ca4986f09cf5..36ad5d23a29b 100644
--- a/tests/intel/gem_exec_latency.c
+++ b/tests/intel/gem_exec_latency.c
@@ -928,7 +928,7 @@ static double clockrate(int i915, int reg)
 		for_each_if(gem_class_can_store_dword(i915, (e)->class)) \
 			igt_dynamic_f("%s", (e)->name)
 
-igt_main()
+int igt_main()
 {
 	const struct intel_execution_engine2 *e;
 	const intel_ctx_t *ctx;
diff --git a/tests/intel/gem_exec_nop.c b/tests/intel/gem_exec_nop.c
index 10d3258441b0..975ec35d0a6d 100644
--- a/tests/intel/gem_exec_nop.c
+++ b/tests/intel/gem_exec_nop.c
@@ -1000,7 +1000,7 @@ static void preempt(int fd, uint32_t handle,
 		 e->name, count, elapsed(&start, &now)*1e6 / count);
 }
 
-igt_main()
+int igt_main()
 {
 	const struct intel_execution_engine2 *e;
 	const intel_ctx_t *ctx;
diff --git a/tests/intel/gem_exec_parallel.c b/tests/intel/gem_exec_parallel.c
index 3f75ed93d2ea..3cdae115651b 100644
--- a/tests/intel/gem_exec_parallel.c
+++ b/tests/intel/gem_exec_parallel.c
@@ -336,7 +336,7 @@ static void all(int fd, const intel_ctx_t *ctx,
 	free(threads);
 }
 
-igt_main()
+int igt_main()
 {
 	struct intel_execution_engine2 *e;
 
diff --git a/tests/intel/gem_exec_params.c b/tests/intel/gem_exec_params.c
index ec771100123d..3ba4c530b17c 100644
--- a/tests/intel/gem_exec_params.c
+++ b/tests/intel/gem_exec_params.c
@@ -449,7 +449,7 @@ uint32_t batch[2] = {MI_BATCH_BUFFER_END};
 uint32_t handle, devid;
 int fd;
 
-igt_main()
+int igt_main()
 {
 	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
diff --git a/tests/intel/gem_exec_reloc.c b/tests/intel/gem_exec_reloc.c
index 19a059c39fc5..5b51d7b384bb 100644
--- a/tests/intel/gem_exec_reloc.c
+++ b/tests/intel/gem_exec_reloc.c
@@ -1625,7 +1625,7 @@ static void invalid_domains(int fd)
 	gem_close(fd, obj[0].handle);
 }
 
-igt_main()
+int igt_main()
 {
 	const intel_ctx_t *ctx;
 	const struct intel_execution_engine2 *e;
diff --git a/tests/intel/gem_exec_schedule.c b/tests/intel/gem_exec_schedule.c
index a8701a57e67e..da88e81a640d 100644
--- a/tests/intel/gem_exec_schedule.c
+++ b/tests/intel/gem_exec_schedule.c
@@ -3202,7 +3202,7 @@ static void fairslice(int i915, const intel_ctx_cfg_t *cfg,
 			    !gem_engine_can_block_ggtt_binder(i915, e)) \
 		igt_dynamic_f("%s", e->name)
 
-igt_main()
+int igt_main()
 {
 	int fd = -1;
 	const intel_ctx_t *ctx = NULL;
diff --git a/tests/intel/gem_exec_store.c b/tests/intel/gem_exec_store.c
index c2ac27ff5bcc..01569ddd6709 100644
--- a/tests/intel/gem_exec_store.c
+++ b/tests/intel/gem_exec_store.c
@@ -437,7 +437,7 @@ static void print_welcome(int fd)
 		for_each_if(gem_class_can_store_dword(i915, (e)->class)) \
 			igt_dynamic_f("%s", (e)->name)
 
-igt_main()
+int igt_main()
 {
 	const struct intel_execution_engine2 *e;
 	const intel_ctx_t *ctx;
diff --git a/tests/intel/gem_exec_suspend.c b/tests/intel/gem_exec_suspend.c
index a93fb1d0f699..de81e1ef1454 100644
--- a/tests/intel/gem_exec_suspend.c
+++ b/tests/intel/gem_exec_suspend.c
@@ -351,7 +351,7 @@ static void power_test(int i915, const intel_ctx_t *ctx,
 		 d_charge(&after, &before) * 3600 / d_time(&after, &before));
 }
 
-igt_main()
+int igt_main()
 {
 	const struct {
 		const char *suffix;
diff --git a/tests/intel/gem_exec_whisper.c b/tests/intel/gem_exec_whisper.c
index 8f195adb39eb..1d01577b47a3 100644
--- a/tests/intel/gem_exec_whisper.c
+++ b/tests/intel/gem_exec_whisper.c
@@ -679,7 +679,7 @@ static void whisper(int fd, const intel_ctx_t *ctx,
 	close(debugfs);
 }
 
-igt_main()
+int igt_main()
 {
 	const struct mode {
 		const char *name;
diff --git a/tests/intel/gem_exercise_blt.c b/tests/intel/gem_exercise_blt.c
index 11d5294c83bc..49347ff0ab62 100644
--- a/tests/intel/gem_exercise_blt.c
+++ b/tests/intel/gem_exercise_blt.c
@@ -366,7 +366,7 @@ const char *help_str =
 	"  -H\tHeight (default 512)"
 	;
 
-igt_main_args("b:pst:W:H:", NULL, help_str, opt_handler, NULL)
+int igt_main_args("b:pst:W:H:", NULL, help_str, opt_handler, NULL)
 {
 	struct drm_i915_query_memory_regions *query_info;
 	struct igt_collection *set;
diff --git a/tests/intel/gem_fence_thrash.c b/tests/intel/gem_fence_thrash.c
index fed680c800ed..ce2e480d02e7 100644
--- a/tests/intel/gem_fence_thrash.c
+++ b/tests/intel/gem_fence_thrash.c
@@ -252,7 +252,7 @@ static int run_test(int threads_per_fence, void *f, int tiling,
 	return 0;
 }
 
-igt_main()
+int igt_main()
 {
 	igt_subtest("bo-write-verify-none")
 		igt_assert(run_test(0, bo_write_verify, I915_TILING_NONE, 80) == 0);
diff --git a/tests/intel/gem_fence_upload.c b/tests/intel/gem_fence_upload.c
index c41d5784d34c..ac44964454ab 100644
--- a/tests/intel/gem_fence_upload.c
+++ b/tests/intel/gem_fence_upload.c
@@ -407,7 +407,7 @@ static void wc_contention(void)
 	igt_assert(tiled[1] > 0.75 * tiled[0]);
 }
 
-igt_main()
+int igt_main()
 {
 	igt_subtest("performance")
 		performance();
diff --git a/tests/intel/gem_fenced_exec_thrash.c b/tests/intel/gem_fenced_exec_thrash.c
index d52c02b2b8ef..59aa32bbd693 100644
--- a/tests/intel/gem_fenced_exec_thrash.c
+++ b/tests/intel/gem_fenced_exec_thrash.c
@@ -191,7 +191,7 @@ static void run_test(int fd, int num_fences, int expected_errno,
 	put_ahnd(ahnd);
 }
 
-igt_main()
+int igt_main()
 {
 	uint32_t devid = 0;
 	unsigned int num_fences = 0;
diff --git a/tests/intel/gem_flink_basic.c b/tests/intel/gem_flink_basic.c
index ed5135b72120..3f04185bfd8b 100644
--- a/tests/intel/gem_flink_basic.c
+++ b/tests/intel/gem_flink_basic.c
@@ -185,7 +185,7 @@ test_flink_lifetime(int fd)
 	drm_close_driver(fd2);
 }
 
-igt_main()
+int igt_main()
 {
 	igt_fd_t(fd);
 
diff --git a/tests/intel/gem_flink_race.c b/tests/intel/gem_flink_race.c
index 0b2b44d30420..6b1b71d0a0a0 100644
--- a/tests/intel/gem_flink_race.c
+++ b/tests/intel/gem_flink_race.c
@@ -213,7 +213,7 @@ static void test_flink_close(void)
 	igt_assert_eq(obj_count, 0);
 }
 
-igt_main()
+int igt_main()
 {
 	igt_subtest("flink_name")
 		test_flink_name(5);
diff --git a/tests/intel/gem_gpgpu_fill.c b/tests/intel/gem_gpgpu_fill.c
index d37e778512e3..bdd96eccda49 100644
--- a/tests/intel/gem_gpgpu_fill.c
+++ b/tests/intel/gem_gpgpu_fill.c
@@ -198,7 +198,7 @@ const char *help_str =
 	;
 
 
-igt_main_args("dW:H:X:Y:", NULL, help_str, opt_handler, NULL)
+int igt_main_args("dW:H:X:Y:", NULL, help_str, opt_handler, NULL)
 {
 	data_t data = {0, };
 	igt_fillfunc_t fill_fn = NULL;
diff --git a/tests/intel/gem_huc_copy.c b/tests/intel/gem_huc_copy.c
index 37a4044a9112..87e206b14162 100644
--- a/tests/intel/gem_huc_copy.c
+++ b/tests/intel/gem_huc_copy.c
@@ -98,7 +98,7 @@ static void test_huc_load(int fd)
 	igt_fail_on_f(status == 0, "HuC firmware is not running!\n");
 }
 
-igt_main()
+int igt_main()
 {
 	int drm_fd = -1;
 	uint32_t devid;
diff --git a/tests/intel/gem_linear_blits.c b/tests/intel/gem_linear_blits.c
index 84d62279e8d5..c1733138b0ca 100644
--- a/tests/intel/gem_linear_blits.c
+++ b/tests/intel/gem_linear_blits.c
@@ -269,7 +269,7 @@ static void run_test(int fd, int count, bool do_relocs)
 
 #define MAX_32b ((1ull << 32) - 4096)
 
-igt_main()
+int igt_main()
 {
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	uint64_t count = 0;
diff --git a/tests/intel/gem_lmem_evict.c b/tests/intel/gem_lmem_evict.c
index 6472f6fd58cf..beccf00377c2 100644
--- a/tests/intel/gem_lmem_evict.c
+++ b/tests/intel/gem_lmem_evict.c
@@ -93,7 +93,7 @@ static void test_dontneed_evict_race(int fd,
 	gem_close(fd, handle1);
 }
 
-igt_main()
+int igt_main()
 {
 	struct drm_i915_query_memory_regions *regions;
 	int i915 = -1;
diff --git a/tests/intel/gem_lmem_swapping.c b/tests/intel/gem_lmem_swapping.c
index 32aa0e2cd76e..adae26716cf4 100644
--- a/tests/intel/gem_lmem_swapping.c
+++ b/tests/intel/gem_lmem_swapping.c
@@ -774,7 +774,7 @@ struct option long_options[] = {
 	{ 0, 0, 0, 0 }
 };
 
-igt_main_args("", long_options, help_str, opt_handler, NULL)
+int igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
 	struct drm_i915_query_memory_regions *regions;
 	struct drm_i915_memory_region_info *region;
diff --git a/tests/intel/gem_madvise.c b/tests/intel/gem_madvise.c
index e726f3b6993f..0f4b497a9bb6 100644
--- a/tests/intel/gem_madvise.c
+++ b/tests/intel/gem_madvise.c
@@ -215,7 +215,7 @@ dontneed_before_exec(void)
 	drm_close_driver(fd);
 }
 
-igt_main()
+int igt_main()
 {
 	igt_describe("Check signal for Segmentation Fault and bus error before"
 		     " obtaining a purgeable object and calling for sighandler.");
diff --git a/tests/intel/gem_media_fill.c b/tests/intel/gem_media_fill.c
index 3496055b790f..5694cf53797f 100644
--- a/tests/intel/gem_media_fill.c
+++ b/tests/intel/gem_media_fill.c
@@ -140,7 +140,7 @@ static void media_fill(data_t *data, igt_fillfunc_t fill,
 	munmap(ptr, buf->surface[0].size);
 }
 
-igt_main()
+int igt_main()
 {
 	data_t data = {0, };
 	igt_fillfunc_t fill_fn = NULL;
diff --git a/tests/intel/gem_mmap.c b/tests/intel/gem_mmap.c
index 11fb5d02655f..9fb18856732a 100644
--- a/tests/intel/gem_mmap.c
+++ b/tests/intel/gem_mmap.c
@@ -203,7 +203,7 @@ static int mmap_ioctl(int i915, struct drm_i915_gem_mmap *arg)
 	return err;
 }
 
-igt_main()
+int igt_main()
 {
 	uint8_t expected[OBJECT_SIZE];
 	uint8_t buf[OBJECT_SIZE];
diff --git a/tests/intel/gem_mmap_gtt.c b/tests/intel/gem_mmap_gtt.c
index 1276d2cf71cf..51f2a5fee52e 100644
--- a/tests/intel/gem_mmap_gtt.c
+++ b/tests/intel/gem_mmap_gtt.c
@@ -1589,7 +1589,7 @@ static int mmap_ioctl(int i915, struct drm_i915_gem_mmap_gtt *arg)
 
 int fd;
 
-igt_main()
+int igt_main()
 {
 	if (igt_run_in_simulation())
 		OBJECT_SIZE = 1 * 1024 * 1024;
diff --git a/tests/intel/gem_mmap_offset.c b/tests/intel/gem_mmap_offset.c
index 977b63da957f..d3c56ab40141 100644
--- a/tests/intel/gem_mmap_offset.c
+++ b/tests/intel/gem_mmap_offset.c
@@ -1145,7 +1145,7 @@ static bool has_mmap_offset(int i915)
 	return mmap_gtt_version(i915) >= 4;
 }
 
-igt_main()
+int igt_main()
 {
 	int i915;
 
diff --git a/tests/intel/gem_mmap_wc.c b/tests/intel/gem_mmap_wc.c
index 2b52a2954e73..c56fefda2f7a 100644
--- a/tests/intel/gem_mmap_wc.c
+++ b/tests/intel/gem_mmap_wc.c
@@ -519,7 +519,7 @@ static int mmap_ioctl(int i915, struct drm_i915_gem_mmap *arg)
 
 int fd;
 
-igt_main()
+int igt_main()
 {
 	if (igt_run_in_simulation())
 		OBJECT_SIZE = 1 * 1024 * 1024;
diff --git a/tests/intel/gem_partial_pwrite_pread.c b/tests/intel/gem_partial_pwrite_pread.c
index a9095df4224f..4125553f0b4b 100644
--- a/tests/intel/gem_partial_pwrite_pread.c
+++ b/tests/intel/gem_partial_pwrite_pread.c
@@ -365,7 +365,7 @@ static void do_tests(data_t *data, int cache_level, const char *suffix)
 		test_partial_read_writes(data);
 }
 
-igt_main()
+int igt_main()
 {
 	data_t data = {0, };
 	srandom(0xdeadbeef);
diff --git a/tests/intel/gem_pipe_control_store_loop.c b/tests/intel/gem_pipe_control_store_loop.c
index 6fce3fc10014..2b42f1d21af7 100644
--- a/tests/intel/gem_pipe_control_store_loop.c
+++ b/tests/intel/gem_pipe_control_store_loop.c
@@ -175,7 +175,7 @@ store_pipe_control_loop(bool preuse_buffer, int timeout)
 int fd;
 uint32_t devid;
 
-igt_main()
+int igt_main()
 {
 	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
diff --git a/tests/intel/gem_ppgtt.c b/tests/intel/gem_ppgtt.c
index 8e388e31014b..67185de5e78f 100644
--- a/tests/intel/gem_ppgtt.c
+++ b/tests/intel/gem_ppgtt.c
@@ -408,7 +408,7 @@ static bool has_contexts(void)
 	return result;
 }
 
-igt_main()
+int igt_main()
 {
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 
diff --git a/tests/intel/gem_pread.c b/tests/intel/gem_pread.c
index be83a8de8f59..d31fc1785608 100644
--- a/tests/intel/gem_pread.c
+++ b/tests/intel/gem_pread.c
@@ -298,7 +298,7 @@ static int opt_handler(int opt, int opt_index, void *data)
 
 const char *help_str = "  -s\tObject size in bytes\n";
 
-igt_main_args("s:", NULL, help_str, opt_handler, NULL)
+int igt_main_args("s:", NULL, help_str, opt_handler, NULL)
 {
 	double usecs;
 	char buf[100];
diff --git a/tests/intel/gem_pread_after_blit.c b/tests/intel/gem_pread_after_blit.c
index a0ff7da0a31a..8364e295230d 100644
--- a/tests/intel/gem_pread_after_blit.c
+++ b/tests/intel/gem_pread_after_blit.c
@@ -228,7 +228,7 @@ static void do_test(struct buf_ops *bops, int cache_level,
 	intel_bb_destroy(ibb);
 }
 
-igt_main()
+int igt_main()
 {
 	const uint32_t start[2] = {0, 1024 * 1024 / 4};
 	const struct {
diff --git a/tests/intel/gem_pwrite.c b/tests/intel/gem_pwrite.c
index eb573584f0a8..ed5a949673d6 100644
--- a/tests/intel/gem_pwrite.c
+++ b/tests/intel/gem_pwrite.c
@@ -535,7 +535,7 @@ static int opt_handler(int opt, int opt_index, void *data)
 
 const char *help_str = "  -s\tObject size in bytes\n";
 
-igt_main_args("s:", NULL, help_str, opt_handler, NULL)
+int igt_main_args("s:", NULL, help_str, opt_handler, NULL)
 {
 	double usecs;
 	const char* bps;
diff --git a/tests/intel/gem_pxp.c b/tests/intel/gem_pxp.c
index 0922b3afdce5..b80b7d33ee6c 100644
--- a/tests/intel/gem_pxp.c
+++ b/tests/intel/gem_pxp.c
@@ -1299,7 +1299,7 @@ static void require_init_powermgt(int i915, struct powermgt_data *pm)
 		init_powermgt_resources(i915, pm);
 }
 
-igt_main()
+int igt_main()
 {
 	int i915 = -1;
 	bool pxp_supported = false;
diff --git a/tests/intel/gem_read_read_speed.c b/tests/intel/gem_read_read_speed.c
index 1c80c9e21fe3..965781ddb4af 100644
--- a/tests/intel/gem_read_read_speed.c
+++ b/tests/intel/gem_read_read_speed.c
@@ -242,7 +242,7 @@ static void run(struct buf_ops *bops, int _width, int _height,
 	intel_buf_destroy(bcs);
 }
 
-igt_main()
+int igt_main()
 {
 	const int sizes[] = {128, 256, 512, 1024, 2048, 4096, 8192, 0};
 	struct buf_ops *bops = NULL;
diff --git a/tests/intel/gem_readwrite.c b/tests/intel/gem_readwrite.c
index c3089ceb1716..0902bee91533 100644
--- a/tests/intel/gem_readwrite.c
+++ b/tests/intel/gem_readwrite.c
@@ -95,7 +95,7 @@ do_write(int fd, int handle, void *buf, int offset, int size)
 int fd;
 uint32_t handle;
 
-igt_main()
+int igt_main()
 {
 	uint8_t expected[OBJECT_SIZE];
 	uint8_t buf[OBJECT_SIZE];
diff --git a/tests/intel/gem_reg_read.c b/tests/intel/gem_reg_read.c
index 028f6cd225d4..91570ad4e522 100644
--- a/tests/intel/gem_reg_read.c
+++ b/tests/intel/gem_reg_read.c
@@ -159,7 +159,7 @@ retry:
 
 }
 
-igt_main()
+int igt_main()
 {
 	uint64_t val = 0;
 	int fd = -1;
diff --git a/tests/intel/gem_render_copy.c b/tests/intel/gem_render_copy.c
index fd02df731dc8..5e7941d5a868 100644
--- a/tests/intel/gem_render_copy.c
+++ b/tests/intel/gem_render_copy.c
@@ -716,7 +716,7 @@ static void buf_mode_to_str(uint32_t tiling, bool mixed_tiled,
 		 tiling_str, compression_str[0] ? "-" : "", compression_str);
 }
 
-igt_main_args("dac", NULL, help_str, opt_handler, NULL)
+int igt_main_args("dac", NULL, help_str, opt_handler, NULL)
 {
 	static const struct test_desc {
 		int src_tiling;
diff --git a/tests/intel/gem_render_copy_redux.c b/tests/intel/gem_render_copy_redux.c
index 169feeae5f27..1de300b04bc1 100644
--- a/tests/intel/gem_render_copy_redux.c
+++ b/tests/intel/gem_render_copy_redux.c
@@ -217,7 +217,7 @@ static void copy_flink(data_t *data)
 	data_fini(&local);
 }
 
-igt_main()
+int igt_main()
 {
 	data_t data = {0, };
 
diff --git a/tests/intel/gem_render_linear_blits.c b/tests/intel/gem_render_linear_blits.c
index bf49a4a990c2..80355f85e71e 100644
--- a/tests/intel/gem_render_linear_blits.c
+++ b/tests/intel/gem_render_linear_blits.c
@@ -178,7 +178,7 @@ static void run_test (int fd, int count)
 	buf_ops_destroy(bops);
 }
 
-igt_main()
+int igt_main()
 {
 	static int fd = 0;
 	int count=0;
diff --git a/tests/intel/gem_render_tiled_blits.c b/tests/intel/gem_render_tiled_blits.c
index 7b82e7b28c4c..62a2f7a8bf1f 100644
--- a/tests/intel/gem_render_tiled_blits.c
+++ b/tests/intel/gem_render_tiled_blits.c
@@ -229,7 +229,7 @@ static void run_test (int fd, int count)
 }
 
 
-igt_main()
+int igt_main()
 {
 	int fd = 0;
 	int count = 0;
diff --git a/tests/intel/gem_request_retire.c b/tests/intel/gem_request_retire.c
index b1de40563d61..67db1eb5d1f5 100644
--- a/tests/intel/gem_request_retire.c
+++ b/tests/intel/gem_request_retire.c
@@ -116,7 +116,7 @@ test_retire_vma_not_inactive(int fd)
 	put_ahnd(ahnd);
 }
 
-igt_main()
+int igt_main()
 {
 	igt_fd_t(fd);
 
diff --git a/tests/intel/gem_reset_stats.c b/tests/intel/gem_reset_stats.c
index 02ab8076c57a..b6cd440011aa 100644
--- a/tests/intel/gem_reset_stats.c
+++ b/tests/intel/gem_reset_stats.c
@@ -1080,7 +1080,7 @@ static void test_shared_reset_domain(const intel_ctx_cfg_t *base_cfg,
 #define RUN_TEST(...) do { sync_gpu(); __VA_ARGS__; sync_gpu(); } while (0)
 #define RUN_CTX_TEST(...) do { check_context(e); RUN_TEST(__VA_ARGS__); } while (0)
 
-igt_main()
+int igt_main()
 {
 	const struct intel_execution_ring *e;
 
diff --git a/tests/intel/gem_ringfill.c b/tests/intel/gem_ringfill.c
index 233a6eae12c3..7d0be81de77e 100644
--- a/tests/intel/gem_ringfill.c
+++ b/tests/intel/gem_ringfill.c
@@ -391,7 +391,7 @@ static bool has_lut_handle(int i915)
 	return result;
 }
 
-igt_main()
+int igt_main()
 {
 	const struct {
 		const char *suffix;
diff --git a/tests/intel/gem_set_tiling_vs_blt.c b/tests/intel/gem_set_tiling_vs_blt.c
index e63958a8e056..ec08e1c136f8 100644
--- a/tests/intel/gem_set_tiling_vs_blt.c
+++ b/tests/intel/gem_set_tiling_vs_blt.c
@@ -234,7 +234,7 @@ static void do_test(struct buf_ops *bops, uint32_t tiling, unsigned stride,
 	igt_info("done\n");
 }
 
-igt_main()
+int igt_main()
 {
 	int fd, i;
 	uint32_t tiling, tiling_after;
diff --git a/tests/intel/gem_shrink.c b/tests/intel/gem_shrink.c
index c332c084c302..471edf007311 100644
--- a/tests/intel/gem_shrink.c
+++ b/tests/intel/gem_shrink.c
@@ -513,7 +513,7 @@ static void reclaim(unsigned engine, int timeout)
 	drm_close_driver(fd);
 }
 
-igt_main()
+int igt_main()
 {
 	const struct test {
 		const char *name;
diff --git a/tests/intel/gem_softpin.c b/tests/intel/gem_softpin.c
index a86151a14e9b..7b3fc26deaed 100644
--- a/tests/intel/gem_softpin.c
+++ b/tests/intel/gem_softpin.c
@@ -1464,7 +1464,7 @@ static void safe_alignment(int i915)
 	igt_subtest_with_dynamic(T) for_each_ctx_engine(i915, ctx, e) \
 		igt_dynamic_f("%s", e->name)
 
-igt_main()
+int igt_main()
 {
 	const struct intel_execution_engine2 *e;
 	int fd = -1;
diff --git a/tests/intel/gem_spin_batch.c b/tests/intel/gem_spin_batch.c
index 7aaa26fde61e..b9143ee4eb1e 100644
--- a/tests/intel/gem_spin_batch.c
+++ b/tests/intel/gem_spin_batch.c
@@ -241,7 +241,7 @@ static bool has_userptr(int fd)
 	return err == EFAULT;
 }
 
-igt_main()
+int igt_main()
 {
 	const struct intel_execution_engine2 *e2;
 	const struct intel_execution_ring *e;
diff --git a/tests/intel/gem_streaming_writes.c b/tests/intel/gem_streaming_writes.c
index 40c158c3fdec..b231bcfef640 100644
--- a/tests/intel/gem_streaming_writes.c
+++ b/tests/intel/gem_streaming_writes.c
@@ -419,7 +419,7 @@ static void test_batch(int fd, int mode, int reverse)
 	gem_close(fd, dst);
 }
 
-igt_main()
+int igt_main()
 {
 	int fd, sync;
 
diff --git a/tests/intel/gem_sync.c b/tests/intel/gem_sync.c
index bf99d695d709..c6063e8f79a9 100644
--- a/tests/intel/gem_sync.c
+++ b/tests/intel/gem_sync.c
@@ -1365,7 +1365,7 @@ preempt(int fd, const intel_ctx_t *ctx, unsigned ring,
 	intel_ctx_destroy(fd, tmp_ctx[0]);
 }
 
-igt_main()
+int igt_main()
 {
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	const struct {
diff --git a/tests/intel/gem_tiled_blits.c b/tests/intel/gem_tiled_blits.c
index 3345be61ad01..228a423473e0 100644
--- a/tests/intel/gem_tiled_blits.c
+++ b/tests/intel/gem_tiled_blits.c
@@ -185,7 +185,7 @@ static void run_test(int fd, int count)
 
 #define MAX_32b ((1ull << 32) - 4096)
 
-igt_main()
+int igt_main()
 {
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	uint64_t count = 0;
diff --git a/tests/intel/gem_tiled_fence_blits.c b/tests/intel/gem_tiled_fence_blits.c
index 035716e1f6e8..4eb1194c1bae 100644
--- a/tests/intel/gem_tiled_fence_blits.c
+++ b/tests/intel/gem_tiled_fence_blits.c
@@ -292,7 +292,7 @@ static void run_test(int fd, int count, uint64_t end)
 
 #define MAX_32b ((1ull << 32) - 4096)
 
-igt_main()
+int igt_main()
 {
 	/*
 	 * For machines with many cpu cores buffer verification can take
diff --git a/tests/intel/gem_tiled_partial_pwrite_pread.c b/tests/intel/gem_tiled_partial_pwrite_pread.c
index a1fbb70c078c..075ec2b196fa 100644
--- a/tests/intel/gem_tiled_partial_pwrite_pread.c
+++ b/tests/intel/gem_tiled_partial_pwrite_pread.c
@@ -286,7 +286,7 @@ static bool known_swizzling(uint32_t handle)
 	return arg.phys_swizzle_mode == arg.swizzle_mode;
 }
 
-igt_main()
+int igt_main()
 {
 	srandom(0xdeadbeef);
 
diff --git a/tests/intel/gem_tiled_swapping.c b/tests/intel/gem_tiled_swapping.c
index 7ec468baa837..e6d3d58b7721 100644
--- a/tests/intel/gem_tiled_swapping.c
+++ b/tests/intel/gem_tiled_swapping.c
@@ -176,7 +176,7 @@ static void check_memory_layout(int fd)
 	igt_debug("normal memory configuration detected, continuing\n");
 }
 
-igt_main()
+int igt_main()
 {
 	unsigned long n, count;
 	struct thread *threads;
diff --git a/tests/intel/gem_userptr_blits.c b/tests/intel/gem_userptr_blits.c
index eb5b0d0621c6..d8d227100161 100644
--- a/tests/intel/gem_userptr_blits.c
+++ b/tests/intel/gem_userptr_blits.c
@@ -2497,7 +2497,7 @@ static int opt_handler(int opt, int opt_index, void *data)
 
 const char *help_str = "  -c\tBuffer count\n";
 
-igt_main_args("c:", NULL, help_str, opt_handler, NULL)
+int igt_main_args("c:", NULL, help_str, opt_handler, NULL)
 {
 	int size = sizeof(linear);
 	igt_fd_t(fd);
diff --git a/tests/intel/gem_vm_create.c b/tests/intel/gem_vm_create.c
index ae9fc828a60b..c30be7fcabb5 100644
--- a/tests/intel/gem_vm_create.c
+++ b/tests/intel/gem_vm_create.c
@@ -380,7 +380,7 @@ static void isolation(int i915)
 	gem_vm_destroy(i915, vm[0]);
 }
 
-igt_main()
+int igt_main()
 {
 	int i915 = -1;
 
diff --git a/tests/intel/gem_wait.c b/tests/intel/gem_wait.c
index eb7cc3956255..7983c1d30fa9 100644
--- a/tests/intel/gem_wait.c
+++ b/tests/intel/gem_wait.c
@@ -229,7 +229,7 @@ static void test_all_engines(const char *name, int i915, const intel_ctx_t *ctx,
 	}
 }
 
-igt_main()
+int igt_main()
 {
 	const intel_ctx_t *ctx;
 	int fd = -1;
diff --git a/tests/intel/gem_watchdog.c b/tests/intel/gem_watchdog.c
index 974aba7fe1e8..efa9ebebe710 100644
--- a/tests/intel/gem_watchdog.c
+++ b/tests/intel/gem_watchdog.c
@@ -553,7 +553,7 @@ far_fence(int i915, int timeout, const intel_ctx_t *ctx,
 	close(fence);
 }
 
-igt_main()
+int igt_main()
 {
 	const struct intel_execution_engine2 *e;
 	const intel_ctx_t *ctx;
diff --git a/tests/intel/gem_workarounds.c b/tests/intel/gem_workarounds.c
index b5440840e282..07f0a7da6823 100644
--- a/tests/intel/gem_workarounds.c
+++ b/tests/intel/gem_workarounds.c
@@ -276,7 +276,7 @@ static void check_workarounds(int fd, enum operation op, unsigned int flags)
 		drm_close_driver(fd);
 }
 
-igt_main()
+int igt_main()
 {
 	struct intel_mmio_data mmio_data;
 	const struct {
diff --git a/tests/intel/gen7_exec_parse.c b/tests/intel/gen7_exec_parse.c
index 671cbd12426e..b9f5de2343e8 100644
--- a/tests/intel/gen7_exec_parse.c
+++ b/tests/intel/gen7_exec_parse.c
@@ -482,7 +482,7 @@ static void hsw_load_register_reg(void)
 	drm_close_driver(fd);
 }
 
-igt_main()
+int igt_main()
 {
 	uint32_t handle;
 	int fd;
diff --git a/tests/intel/gen9_exec_parse.c b/tests/intel/gen9_exec_parse.c
index e7f65dd6af2b..961bf5e462d3 100644
--- a/tests/intel/gen9_exec_parse.c
+++ b/tests/intel/gen9_exec_parse.c
@@ -1206,7 +1206,7 @@ static void test_shadow_peek(int fd)
 		gem_close(fd, exec[i].handle);
 }
 
-igt_main()
+int igt_main()
 {
 	uint32_t handle;
 	int i915;
diff --git a/tests/intel/i915_drm_fdinfo.c b/tests/intel/i915_drm_fdinfo.c
index 94b009b80f14..d8158afdfe06 100644
--- a/tests/intel/i915_drm_fdinfo.c
+++ b/tests/intel/i915_drm_fdinfo.c
@@ -930,7 +930,7 @@ test_memory(int i915, struct gem_memory_region *mr, unsigned int flags)
 	igt_subtest_with_dynamic(T) for_each_ctx_engine(i915, ctx, e) \
 		igt_dynamic_f("%s", e->name)
 
-igt_main()
+int igt_main()
 {
 	unsigned int num_engines = 0, num_classes = 0;
 	const struct intel_execution_engine2 *e;
diff --git a/tests/intel/i915_fb_tiling.c b/tests/intel/i915_fb_tiling.c
index 23ee053d0d51..cc7d4e78ba43 100644
--- a/tests/intel/i915_fb_tiling.c
+++ b/tests/intel/i915_fb_tiling.c
@@ -37,7 +37,7 @@
 
 IGT_TEST_DESCRIPTION("Object tiling must be fixed after framebuffer creation.");
 
-igt_main()
+int igt_main()
 {
 	int drm_fd;
 	struct igt_fb fb;
diff --git a/tests/intel/i915_getparams_basic.c b/tests/intel/i915_getparams_basic.c
index 59f97bd65a1d..abd5dd57a956 100644
--- a/tests/intel/i915_getparams_basic.c
+++ b/tests/intel/i915_getparams_basic.c
@@ -162,7 +162,7 @@ exit_handler(int sig)
 	deinit();
 }
 
-igt_main()
+int igt_main()
 {
 	igt_fixture() {
 		igt_install_exit_handler(exit_handler);
diff --git a/tests/intel/i915_hangman.c b/tests/intel/i915_hangman.c
index dc18eb3a82de..9414641a4689 100644
--- a/tests/intel/i915_hangman.c
+++ b/tests/intel/i915_hangman.c
@@ -567,7 +567,7 @@ static void do_tests(const char *name, const char *prefix,
 	}
 }
 
-igt_main()
+int igt_main()
 {
 	const intel_ctx_t *ctx;
 	igt_hang_t hang = {};
diff --git a/tests/intel/i915_module_load.c b/tests/intel/i915_module_load.c
index be908c4a9ba9..0c83d6701792 100644
--- a/tests/intel/i915_module_load.c
+++ b/tests/intel/i915_module_load.c
@@ -361,7 +361,7 @@ static uint32_t  driver_load_with_lmem_bar_size(uint32_t lmem_bar_size, bool che
 	return lmem_bar_size;
 }
 
-igt_main()
+int igt_main()
 {
 	igt_describe("Check if i915 and friends are not yet loaded, then load them.");
 	igt_subtest("load") {
diff --git a/tests/intel/i915_pm_freq_api.c b/tests/intel/i915_pm_freq_api.c
index a41b0e658df7..837f239a1a7f 100644
--- a/tests/intel/i915_pm_freq_api.c
+++ b/tests/intel/i915_pm_freq_api.c
@@ -159,7 +159,7 @@ static void restore_sysfs_freq(int sig)
 	drm_close_driver(i915);
 }
 
-igt_main()
+int igt_main()
 {
 	igt_fixture() {
 		int num_gts, dirfd, gt;
diff --git a/tests/intel/i915_pm_freq_mult.c b/tests/intel/i915_pm_freq_mult.c
index 0e8f6a255008..5cad54f2263c 100644
--- a/tests/intel/i915_pm_freq_mult.c
+++ b/tests/intel/i915_pm_freq_mult.c
@@ -164,7 +164,7 @@ static void media_freq(int gt, int dir)
 	cleanup(dir);
 }
 
-igt_main()
+int igt_main()
 {
 	int dir, gt;
 
diff --git a/tests/intel/i915_pm_rc6_residency.c b/tests/intel/i915_pm_rc6_residency.c
index 22267b7c26e5..346796fb2e53 100644
--- a/tests/intel/i915_pm_rc6_residency.c
+++ b/tests/intel/i915_pm_rc6_residency.c
@@ -601,7 +601,7 @@ static unsigned int rc6_enabled_mask(int i915, int dirfd)
 	return get_rc6_enabled_mask(dirfd);
 }
 
-igt_main()
+int igt_main()
 {
 	int i915 = -1;
 	unsigned int dirfd, gt;
diff --git a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c
index 6aa165bf962b..778f46dbcfb9 100644
--- a/tests/intel/i915_pm_rpm.c
+++ b/tests/intel/i915_pm_rpm.c
@@ -1344,7 +1344,7 @@ static struct option long_options[] = {
 	{ 0, 0, 0, 0 }
 };
 
-igt_main_args("", long_options, help_str, opt_handler, NULL)
+int igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
 	/* Skip instead of failing in case the machine is not prepared to reach
 	 * PC8+. We don't want bug reports from cases where the machine is just
diff --git a/tests/intel/i915_pm_rps.c b/tests/intel/i915_pm_rps.c
index 8c3089b56d6d..f97a716bec08 100644
--- a/tests/intel/i915_pm_rps.c
+++ b/tests/intel/i915_pm_rps.c
@@ -1201,7 +1201,7 @@ static void read_sysfs_freq(char *sysfs_path)
 	}
 }
 
-igt_main()
+int igt_main()
 {
 	int tmp, gt;
 
diff --git a/tests/intel/i915_pm_sseu.c b/tests/intel/i915_pm_sseu.c
index ad852579a23a..5dd571a45631 100644
--- a/tests/intel/i915_pm_sseu.c
+++ b/tests/intel/i915_pm_sseu.c
@@ -387,7 +387,7 @@ exit_handler(int sig)
 	gem_deinit();
 }
 
-igt_main()
+int igt_main()
 {
 	igt_fixture() {
 		igt_install_exit_handler(exit_handler);
diff --git a/tests/intel/i915_power.c b/tests/intel/i915_power.c
index f2362a4f7586..a95167f7e8e2 100644
--- a/tests/intel/i915_power.c
+++ b/tests/intel/i915_power.c
@@ -75,7 +75,7 @@ static void sanity(int i915)
 	igt_assert(idle >= 0 && busy > 0 && busy > idle);
 }
 
-igt_main()
+int igt_main()
 {
 	int i915;
 
diff --git a/tests/intel/i915_query.c b/tests/intel/i915_query.c
index dc0568874e86..7b254961153c 100644
--- a/tests/intel/i915_query.c
+++ b/tests/intel/i915_query.c
@@ -1436,7 +1436,7 @@ static void query_parse_and_validate_hwconfig_table(int i915)
 	free(data);
 }
 
-igt_main()
+int igt_main()
 {
 	int fd = -1;
 	int devid;
diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c
index 1d624cf1ed50..6972de64cc9d 100644
--- a/tests/intel/i915_selftest.c
+++ b/tests/intel/i915_selftest.c
@@ -638,7 +638,7 @@
 
 IGT_TEST_DESCRIPTION("Basic unit tests for i915.ko");
 
-igt_main()
+int igt_main()
 {
 	const char *env = getenv("SELFTESTS") ?: "";
 	char opts[1024];
diff --git a/tests/intel/i915_suspend.c b/tests/intel/i915_suspend.c
index e2c332ef11be..375531130ccb 100644
--- a/tests/intel/i915_suspend.c
+++ b/tests/intel/i915_suspend.c
@@ -298,7 +298,7 @@ test_suspend_without_i915(int state)
 
 int fd;
 
-igt_main()
+int igt_main()
 {
 	igt_describe("Validate suspend-to-idle without i915 module");
 	igt_subtest("basic-s2idle-without-i915")
diff --git a/tests/intel/intel_hwmon.c b/tests/intel/intel_hwmon.c
index 8b02b5fa1077..103ae69cd976 100644
--- a/tests/intel/intel_hwmon.c
+++ b/tests/intel/intel_hwmon.c
@@ -76,7 +76,7 @@ static void hwmon_write(int hwm)
 	closedir(dir);
 }
 
-igt_main()
+int igt_main()
 {
 	int fd, hwm;
 
diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 3371c06787c2..686c6772ef4b 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -967,7 +967,7 @@ static bool test_requirements(data_t *input_data, int l)
 	return true;
 }
 
-igt_main()
+int igt_main()
 {
 	igt_fixture() {
 		drmModeResPtr res;
diff --git a/tests/intel/kms_busy.c b/tests/intel/kms_busy.c
index e9d2792c7a9a..b2eb418db1fa 100644
--- a/tests/intel/kms_busy.c
+++ b/tests/intel/kms_busy.c
@@ -408,7 +408,7 @@ static void gpu_engines_restore_timeouts(int fd, int num_engines, const struct g
 const char *help_str =
 	"  -e \tRun on all pipes. (By default subtests will run on two pipes)\n";
 
-igt_main_args("e", NULL, help_str, opt_handler, NULL)
+int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 {
 	igt_display_t display = { .drm_fd = -1, .n_pipes = IGT_MAX_PIPES };
 
diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index ea53157bc8b3..9087c6a38680 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -1225,7 +1225,7 @@ static const char *help_str =
 "  -r\t\tOn suspend test do full hibernate with reboot\n"
 ;
 
-igt_main_args("csr:", NULL, help_str, opt_handler, &data)
+int igt_main_args("csr:", NULL, help_str, opt_handler, &data)
 {
 	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index c9e2e3fb925e..8238b89582ee 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -340,7 +340,7 @@ static void run_cdclk_test(data_t *data, uint32_t flags)
 	}
 }
 
-igt_main()
+int igt_main()
 {
 	data_t data = {};
 
diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index dfa5aa04acab..758d6fd8965d 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -350,7 +350,7 @@ static void run_test(data_t *data)
 	intel_buf_destroy(dst);
 }
 
-igt_main()
+int igt_main()
 {
 	data_t data = {};
 
diff --git a/tests/intel/kms_dp_link_training.c b/tests/intel/kms_dp_link_training.c
index 64af89d1bcce..625d3ead21b5 100644
--- a/tests/intel/kms_dp_link_training.c
+++ b/tests/intel/kms_dp_link_training.c
@@ -298,7 +298,7 @@ static bool test_link_rate(data_t *data, bool mst, bool uhbr)
 IGT_TEST_DESCRIPTION("Test to validate link training on SST/MST with "
 		     "UHBR/NON_UHBR rates");
 
-igt_main()
+int igt_main()
 {
 	data_t data = {};
 
diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index db9039f061a0..ac398ec5bb70 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -597,7 +597,7 @@ static bool run_dsc_sst_fallaback_test(data_t *data)
 	return ran;
 }
 
-igt_main()
+int igt_main()
 {
 	data_t data = {};
 
diff --git a/tests/intel/kms_draw_crc.c b/tests/intel/kms_draw_crc.c
index 0f2144cd5d2f..020a2ad8674f 100644
--- a/tests/intel/kms_draw_crc.c
+++ b/tests/intel/kms_draw_crc.c
@@ -328,7 +328,7 @@ static const char *modifier_str(int modifier_index)
 	}
 }
 
-igt_main()
+int igt_main()
 {
 	enum igt_draw_method method;
 	int format_idx, modifier_idx;
diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index a3c1fe716b09..1bb79bbcbbb6 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -321,7 +321,7 @@ static const char help_str[] =
 
 data_t data = {};
 
-igt_main_args("l", NULL, help_str, opt_handler, &data)
+int igt_main_args("l", NULL, help_str, opt_handler, &data)
 {
 	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
diff --git a/tests/intel/kms_fb_coherency.c b/tests/intel/kms_fb_coherency.c
index d3a998f6a034..520d2e3f6655 100644
--- a/tests/intel/kms_fb_coherency.c
+++ b/tests/intel/kms_fb_coherency.c
@@ -234,7 +234,7 @@ static void select_valid_pipe_output_combo(data_t *data)
 	igt_skip("no valid crtc/connector combinations found\n");
 }
 
-igt_main()
+int igt_main()
 {
 	data_t data;
 
diff --git a/tests/intel/kms_fbc_dirty_rect.c b/tests/intel/kms_fbc_dirty_rect.c
index 55422909d2a6..06ac749d7a27 100644
--- a/tests/intel/kms_fbc_dirty_rect.c
+++ b/tests/intel/kms_fbc_dirty_rect.c
@@ -436,7 +436,7 @@ static void fbc_dirty_rectangle_test(data_t *data, void (*test_func)(data_t *))
 	cleanup(data);
 }
 
-igt_main()
+int igt_main()
 {
 	data_t data = {0};
 
diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index 50cd650f4ea6..1b9e535ebffc 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -451,7 +451,7 @@ static void teardown_environment(struct drm_info *drm)
 	kmstest_restore_vt_mode();
 }
 
-igt_main()
+int igt_main()
 {
 	struct drm_info drm = { .fd = -1 };
 
diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_scaled_crc.c
index ab60d1d43bfc..b642ed197d55 100644
--- a/tests/intel/kms_flip_scaled_crc.c
+++ b/tests/intel/kms_flip_scaled_crc.c
@@ -714,7 +714,7 @@ static void run_tests(data_t *data, uint32_t index, enum pipe pipe,
 		test_flip_to_scaled(data, index, pipe, output, modetoset, 1);
 }
 
-igt_main()
+int igt_main()
 {
 	enum pipe pipe;
 	data_t data = {};
diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
index 1eac7978e8a9..8df727e4aa7c 100644
--- a/tests/intel/kms_flip_tiling.c
+++ b/tests/intel/kms_flip_tiling.c
@@ -209,7 +209,7 @@ static void handle_lost_event(data_t *data) {
 static data_t data = {};
 igt_output_t *output;
 
-igt_main()
+int igt_main()
 {
 	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 50b118f1d754..c32f9c582e86 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -4087,7 +4087,7 @@ struct option long_options[] = {
 	{ 0, 0, 0, 0 }
 };
 
-igt_main_args("", long_options, help_str, opt_handler, NULL)
+int igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
 	struct test_mode t;
 	enum pipe pipe;
diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 565cf66d9b6d..bf77f6626f5b 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -545,7 +545,7 @@ static void test_basic_max_non_joiner(data_t *data)
 	}
 }
 
-igt_main()
+int igt_main()
 {
 	bool ultra_joiner_supported, is_dgfx;
 	int i, j, display_ver;
diff --git a/tests/intel/kms_legacy_colorkey.c b/tests/intel/kms_legacy_colorkey.c
index 221c009a4fb9..b720ccf4394b 100644
--- a/tests/intel/kms_legacy_colorkey.c
+++ b/tests/intel/kms_legacy_colorkey.c
@@ -58,7 +58,7 @@ static void test_plane(uint32_t plane_id, int expected_ret)
 				   sizeof(ckey)) == expected_ret);
 }
 
-igt_main()
+int igt_main()
 {
 	igt_fixture() {
 		drm_fd = drm_open_driver_master(DRIVER_INTEL);
diff --git a/tests/intel/kms_mmap_write_crc.c b/tests/intel/kms_mmap_write_crc.c
index 93c435a999cd..ad3dd1b20333 100644
--- a/tests/intel/kms_mmap_write_crc.c
+++ b/tests/intel/kms_mmap_write_crc.c
@@ -269,7 +269,7 @@ static int opt_handler(int opt, int opt_index, void *data)
 
 static data_t data;
 
-igt_main_args("n", NULL, NULL, opt_handler, NULL)
+int igt_main_args("n", NULL, NULL, opt_handler, NULL)
 {
 	int i;
 	igt_output_t *output;
diff --git a/tests/intel/kms_pipe_b_c_ivb.c b/tests/intel/kms_pipe_b_c_ivb.c
index bf48f018d92a..2dde4660e77c 100644
--- a/tests/intel/kms_pipe_b_c_ivb.c
+++ b/tests/intel/kms_pipe_b_c_ivb.c
@@ -289,7 +289,7 @@ test_fail_enable_pipe_C_while_B_has_3_lanes(data_t *data)
 }
 
 static data_t data;
-igt_main()
+int igt_main()
 {
 	int devid;
 
diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index 700013908ab1..282288f8e943 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -856,7 +856,7 @@ struct data data = {
 };
 
 
-igt_main() {
+int igt_main() {
 	uint8_t format_idx = 0, tiling_idx = 0;
 
 	igt_fixture() {
diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
index a61ca91a5f8b..7d62d0503d51 100644
--- a/tests/intel/kms_pm_backlight.c
+++ b/tests/intel/kms_pm_backlight.c
@@ -202,7 +202,7 @@ static void test_setup(igt_display_t display, igt_output_t *output)
 	}
 }
 
-igt_main()
+int igt_main()
 {
 	int fd;
 	int i = 0;
diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index ccfdeb0644d9..dbdd7b3e3eaa 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -730,7 +730,7 @@ static void kms_poll_state_restore(int sig)
 	}
 }
 
-igt_main()
+int igt_main()
 {
 	data_t data = {};
 
diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
index 109a9ed0cf40..07916d42cb85 100644
--- a/tests/intel/kms_pm_lpsp.c
+++ b/tests/intel/kms_pm_lpsp.c
@@ -192,7 +192,7 @@ static void test_lpsp(data_t *data)
 }
 
 IGT_TEST_DESCRIPTION("These tests validates display Low Power Single Pipe configurations");
-igt_main()
+int igt_main()
 {
 	data_t data = {};
 
diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
index 2692f4cd8d74..51111c01aa9b 100644
--- a/tests/intel/kms_pm_rpm.c
+++ b/tests/intel/kms_pm_rpm.c
@@ -1604,7 +1604,7 @@ static struct option long_options[] = {
 	{ 0, 0, 0, 0 }
 };
 
-igt_main_args("", long_options, help_str, opt_handler, NULL)
+int igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
 	igt_subtest("basic-rte") {
 		igt_assert(setup_environment());
diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index ccf239b4c16f..7b93608f3e4a 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -769,7 +769,7 @@ static void dpms_off_on(data_t *data)
 
 data_t data = {};
 
-igt_main()
+int igt_main()
 {
 	int z, y;
 	enum operations op;
diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index f08d117c3d64..61a195a45d2a 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -1172,7 +1172,7 @@ static void run_plane_update_continuous(data_t data, int i, int coexist_features
 	}
 }
 
-igt_main()
+int igt_main()
 {
 	bool output_supports_pr_psr2_sel_fetch = false;
 	bool pr_psr2_sel_fetch_supported = false;
diff --git a/tests/intel/kms_psr2_su.c b/tests/intel/kms_psr2_su.c
index 5732f0a3dce7..fd0963ab7d3d 100644
--- a/tests/intel/kms_psr2_su.c
+++ b/tests/intel/kms_psr2_su.c
@@ -309,7 +309,7 @@ static int check_psr2_support(data_t *data, enum pipe pipe)
 	return status;
 }
 
-igt_main()
+int igt_main()
 {
 	data_t data = {};
 	enum pipe pipe;
diff --git a/tests/intel/kms_psr_stress_test.c b/tests/intel/kms_psr_stress_test.c
index 80394166e936..8fe4a25d74ff 100644
--- a/tests/intel/kms_psr_stress_test.c
+++ b/tests/intel/kms_psr_stress_test.c
@@ -348,7 +348,7 @@ static void run(data_t *data)
 	psr_sink_error_check(data->debugfs_fd, data->initial_state, data->output);
 }
 
-igt_main()
+int igt_main()
 {
 	data_t data = {};
 
diff --git a/tests/intel/perf.c b/tests/intel/perf.c
index 110f4659e0be..b6b2cce5085c 100644
--- a/tests/intel/perf.c
+++ b/tests/intel/perf.c
@@ -5857,7 +5857,7 @@ test_group_concurrent_oa_buffer_read(void)
 	igt_waitchildren();
 }
 
-igt_main()
+int igt_main()
 {
 	const intel_ctx_t *ctx;
 	const struct intel_execution_engine2 *e;
diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index 6775b7f9065b..7b5d711f3881 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -2278,7 +2278,7 @@ static void restore_sysfs_freq(int i915)
 	free(stash_boost);
 }
 
-igt_main()
+int igt_main()
 {
 	const struct intel_execution_engine2 *e;
 	unsigned int num_engines = 0;
diff --git a/tests/intel/prime_busy.c b/tests/intel/prime_busy.c
index 62ae30f6f057..1afe9504ec36 100644
--- a/tests/intel/prime_busy.c
+++ b/tests/intel/prime_busy.c
@@ -148,7 +148,7 @@ static void test_mode(int fd, const intel_ctx_t *ctx, unsigned int flags)
 		igt_disallow_hang(fd, hang);
 }
 
-igt_main()
+int igt_main()
 {
 	const intel_ctx_t *ctx;
 	int fd = -1;
diff --git a/tests/intel/prime_mmap.c b/tests/intel/prime_mmap.c
index 7299ac47a33f..fcce9597b816 100644
--- a/tests/intel/prime_mmap.c
+++ b/tests/intel/prime_mmap.c
@@ -537,7 +537,7 @@ static bool check_skip(uint32_t skip, uint32_t region)
 	return false;
 }
 
-igt_main()
+int igt_main()
 {
 	struct igt_collection *set, *regions, *dma_buf_set;
 	struct drm_i915_query_memory_regions *query_info;
diff --git a/tests/intel/prime_mmap_coherency.c b/tests/intel/prime_mmap_coherency.c
index 7ca88c32a861..ffe06c31938e 100644
--- a/tests/intel/prime_mmap_coherency.c
+++ b/tests/intel/prime_mmap_coherency.c
@@ -307,7 +307,7 @@ static void test_ioctl_errors(void)
 	}
 }
 
-igt_main()
+int igt_main()
 {
 	struct igt_collection *set, *dma_buf_set;
 	struct drm_i915_query_memory_regions *query_info;
diff --git a/tests/intel/prime_mmap_kms.c b/tests/intel/prime_mmap_kms.c
index b8b3ea277ccd..10c76a82fcfd 100644
--- a/tests/intel/prime_mmap_kms.c
+++ b/tests/intel/prime_mmap_kms.c
@@ -257,7 +257,7 @@ check_for_dma_buf_mmap(int fd)
 	return ret;
 }
 
-igt_main()
+int igt_main()
 {
 	gpu_process_t gpu;
 
diff --git a/tests/intel/prime_self_import.c b/tests/intel/prime_self_import.c
index 0d21476be242..ef01ff713b5e 100644
--- a/tests/intel/prime_self_import.c
+++ b/tests/intel/prime_self_import.c
@@ -458,7 +458,7 @@ static void test_llseek_bad(void)
 	drm_close_driver(fd);
 }
 
-igt_main()
+int igt_main()
 {
 	struct {
 		const char *name;
diff --git a/tests/intel/sysfs_defaults.c b/tests/intel/sysfs_defaults.c
index 3b13b2834631..aa342544c061 100644
--- a/tests/intel/sysfs_defaults.c
+++ b/tests/intel/sysfs_defaults.c
@@ -91,7 +91,7 @@ static void test_writable(int i915, int engine)
 	closedir(dir);
 }
 
-igt_main()
+int igt_main()
 {
 	int i915 = -1, engines = -1;
 
diff --git a/tests/intel/sysfs_heartbeat_interval.c b/tests/intel/sysfs_heartbeat_interval.c
index 44bb3a850927..97d4c327945f 100644
--- a/tests/intel/sysfs_heartbeat_interval.c
+++ b/tests/intel/sysfs_heartbeat_interval.c
@@ -487,7 +487,7 @@ static void test_off(int i915, int engine)
 	put_ahnd(ahnd);
 }
 
-igt_main()
+int igt_main()
 {
 	static const struct {
 		const char *name;
diff --git a/tests/intel/sysfs_preempt_timeout.c b/tests/intel/sysfs_preempt_timeout.c
index 827e2eb93537..1971b85c2256 100644
--- a/tests/intel/sysfs_preempt_timeout.c
+++ b/tests/intel/sysfs_preempt_timeout.c
@@ -332,7 +332,7 @@ static void test_off(int i915, int engine)
 	set_preempt_timeout(engine, saved);
 }
 
-igt_main()
+int igt_main()
 {
 	static const struct {
 		const char *name;
diff --git a/tests/intel/sysfs_timeslice_duration.c b/tests/intel/sysfs_timeslice_duration.c
index 2e25690da22b..f10a86777aaa 100644
--- a/tests/intel/sysfs_timeslice_duration.c
+++ b/tests/intel/sysfs_timeslice_duration.c
@@ -556,7 +556,7 @@ static void test_off(int i915, int engine)
 	set_timeslice(engine, saved);
 }
 
-igt_main()
+int igt_main()
 {
 	static const struct {
 		const char *name;
diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index 8c5c4d22db7a..a21922ee5487 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -861,7 +861,7 @@ const char *help_str =
 	"  -H\tHeight (default 512)"
 	;
 
-igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
+int igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 {
 	struct igt_collection *set;
 	int xe;
diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 2e676b93b04c..310093fc5646 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -510,7 +510,7 @@ test_compute_square(int fd)
 		      "GPU not supported\n");
 }
 
-igt_main()
+int igt_main()
 {
 	int xe, ccs_mode[4];
 	unsigned int ip_ver;
diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
index 414d17f50047..2d4ab896f44f 100644
--- a/tests/intel/xe_compute_preempt.c
+++ b/tests/intel/xe_compute_preempt.c
@@ -62,7 +62,7 @@ test_compute_preempt(int fd, struct drm_xe_engine_class_instance *hwe, bool thre
 
 #define CONTEXT_MB 100
 
-igt_main()
+int igt_main()
 {
 	int xe;
 	struct drm_xe_engine_class_instance *hwe;
diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 5599102117b1..6208c9447fab 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -309,7 +309,7 @@ static int create_device_configfs_group(int configfs_fd)
 	return configfs_device_fd;
 }
 
-igt_main()
+int igt_main()
 {
 	int fd, configfs_fd, configfs_device_fd;
 	uint32_t devid;
diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
index 75c609690df6..55081f938ed0 100644
--- a/tests/intel/xe_copy_basic.c
+++ b/tests/intel/xe_copy_basic.c
@@ -258,7 +258,7 @@ const char *help_str =
 	"  -b\tPrint bb"
 	;
 
-igt_main_args("b", NULL, help_str, opt_handler, NULL)
+int igt_main_args("b", NULL, help_str, opt_handler, NULL)
 {
 	int fd;
 	uint16_t dev_id;
diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index ed917190e184..fd1993b21941 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -527,7 +527,7 @@ const char *help_str =
 	"  -p\tpercent of available resource\n"
 	;
 
-igt_main_args("Q:p:", NULL, help_str, opt_handler, NULL)
+int igt_main_args("Q:p:", NULL, help_str, opt_handler, NULL)
 {
 	int xe;
 
diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index 126b8290d456..b85d7d2dfad2 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -172,7 +172,7 @@ static int opt_handler(int option, int option_index, void *input)
 	return IGT_OPT_HANDLER_SUCCESS;
 }
 
-igt_main_args("", long_options, help_str, opt_handler, NULL)
+int igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
 	int debugfs = -1;
 	int fd = -1;
diff --git a/tests/intel/xe_dma_buf_sync.c b/tests/intel/xe_dma_buf_sync.c
index 07099a8c92d4..f214866a170f 100644
--- a/tests/intel/xe_dma_buf_sync.c
+++ b/tests/intel/xe_dma_buf_sync.c
@@ -226,7 +226,7 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
 		drm_close_driver(fd[i]);
 }
 
-igt_main()
+int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe, *hwe0 = NULL, *hwe1;
 	int fd;
diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index fe6f8539767e..411ca6ec42a7 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -728,7 +728,7 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
 	xe_vm_destroy(fd, vm);
 }
 
-igt_main()
+int igt_main()
 {
 	const struct section {
 		const char *name;
diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c
index eecbcfa4f090..1ff25fa45c48 100644
--- a/tests/intel/xe_eu_stall.c
+++ b/tests/intel/xe_eu_stall.c
@@ -644,7 +644,7 @@ static struct option long_options[] = {
 	{ NULL, 0, 0, 0 }
 };
 
-igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
+int igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
 {
 	bool blocking_read = true;
 	struct xe_device *xe_dev;
diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index b037bb97f088..134f317668ca 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -2794,7 +2794,7 @@ static void test_basic_exec_queues_enable(int fd)
 	xe_vm_destroy(fd, vm_non_lr);
 }
 
-igt_main()
+int igt_main()
 {
 	bool was_enabled;
 	bool *multigpu_was_enabled;
diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 3b83e3301c71..14073d576c93 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -2587,7 +2587,7 @@ static bool restore_preempt_timeout(int fd, uint16_t engine_class, uint32_t pree
 			igt_dynamic_f("%s%d", xe_engine_class_string(__hwe->engine_class), \
 				      hwe->engine_instance)
 
-igt_main()
+int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
 	bool was_enabled;
diff --git a/tests/intel/xe_eudebug_sriov.c b/tests/intel/xe_eudebug_sriov.c
index 0f857639a01b..1f150d0efe10 100644
--- a/tests/intel/xe_eudebug_sriov.c
+++ b/tests/intel/xe_eudebug_sriov.c
@@ -126,7 +126,7 @@ static void restore_initial_driver_state(int fd, bool eudebug_enabled, bool vf_a
 	igt_abort_on_f(abort, "Failed to restore initial driver state\n");
 }
 
-igt_main()
+int igt_main()
 {
 	bool eudebug_enabled;
 	bool vf_autoprobe;
diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 839a39a76a1d..2350487c87dd 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -676,7 +676,7 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
  * sections exists which cover multiple compute VM, multiple non-compute VMs,
  * and mixing of VMs.
  */
-igt_main()
+int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
 	const struct section {
diff --git a/tests/intel/xe_evict_ccs.c b/tests/intel/xe_evict_ccs.c
index f4556c2ba36b..17f0ccb9fa43 100644
--- a/tests/intel/xe_evict_ccs.c
+++ b/tests/intel/xe_evict_ccs.c
@@ -497,7 +497,7 @@ const char *help_str =
 	"  -V\tVerify object after compressing\n"
 	;
 
-igt_main_args("bdDn:p:s:S:V", NULL, help_str, opt_handler, NULL)
+int igt_main_args("bdDn:p:s:S:V", NULL, help_str, opt_handler, NULL)
 {
 	const struct ccs {
 		const char *name;
diff --git a/tests/intel/xe_exec_atomic.c b/tests/intel/xe_exec_atomic.c
index 61a860b3cc7f..f138a510e3a3 100644
--- a/tests/intel/xe_exec_atomic.c
+++ b/tests/intel/xe_exec_atomic.c
@@ -123,7 +123,7 @@ static bool has_atomics(int fd, uint32_t region)
 	return true;
 }
 
-igt_main()
+int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
 	int fd;
diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index 13a85dcfac42..98e09961ec53 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -560,7 +560,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 }
 
 
-igt_main()
+int igt_main()
 {
 	const struct section {
 		const char *name;
diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
index 4e59c34ef5a1..b105455f3cf7 100644
--- a/tests/intel/xe_exec_basic.c
+++ b/tests/intel/xe_exec_basic.c
@@ -314,7 +314,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	}
 }
 
-igt_main()
+int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
 	const struct section {
diff --git a/tests/intel/xe_exec_capture.c b/tests/intel/xe_exec_capture.c
index af22f49aec5d..6e454cfff3a7 100644
--- a/tests/intel/xe_exec_capture.c
+++ b/tests/intel/xe_exec_capture.c
@@ -404,7 +404,7 @@ static void test_card(int fd)
 	regfree(&regex);
 }
 
-igt_main()
+int igt_main()
 {
 	int xe;
 	struct drm_xe_engine_class_instance *hwe;
diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index bacff2f36953..cf68319be68a 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -401,7 +401,7 @@ static void lr_mode_workload(int fd)
 	put_ahnd(ahnd);
 }
 
-igt_main()
+int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
 	const struct section {
diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 803a8ec1c15a..5f42051a1016 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -398,7 +398,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		close(map_fd);
 }
 
-igt_main()
+int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
 	const struct section {
diff --git a/tests/intel/xe_exec_mix_modes.c b/tests/intel/xe_exec_mix_modes.c
index 9780119069a0..9594e56e5165 100644
--- a/tests/intel/xe_exec_mix_modes.c
+++ b/tests/intel/xe_exec_mix_modes.c
@@ -256,7 +256,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *hwe,
 	run_job(fd, hwe, engine_execution_mode, job_type, true, NULL);
 }
 
-igt_main()
+int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
 	const struct section {
diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
index dc4896e22d45..0dbbb4a0f62e 100644
--- a/tests/intel/xe_exec_queue_property.c
+++ b/tests/intel/xe_exec_queue_property.c
@@ -201,7 +201,7 @@ static void invalid_property(int xe)
 					     to_user_pointer(&ext), &exec_queue_id), 0);
 }
 
-igt_main()
+int igt_main()
 {
 	static const struct {
 		const char *name;
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index ec86f8e2fc8e..7aaee31dd220 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -770,7 +770,7 @@ static void threads(int fd, int n_exec_queues, int n_execs, unsigned int flags)
 	free(threads_data);
 }
 
-igt_main()
+int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
 	const struct section {
diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
index cb78ade1a496..024c594f5df3 100644
--- a/tests/intel/xe_exec_sip.c
+++ b/tests/intel/xe_exec_sip.c
@@ -309,7 +309,7 @@ static void test_sip(enum shader_type shader_type, enum sip_type sip_type,
 				igt_dynamic_f("%s%d", xe_engine_class_string(__eci->engine_class), \
 					      __eci->engine_instance)
 
-igt_main()
+int igt_main()
 {
 	struct drm_xe_engine_class_instance *eci;
 	int fd;
diff --git a/tests/intel/xe_exec_sip_eudebug.c b/tests/intel/xe_exec_sip_eudebug.c
index 820bb852c3d5..20c2a1d82539 100644
--- a/tests/intel/xe_exec_sip_eudebug.c
+++ b/tests/intel/xe_exec_sip_eudebug.c
@@ -314,7 +314,7 @@ static void test_sip(enum shader_type shader_type, enum sip_type sip_type,
 				igt_dynamic_f("%s%d", xe_engine_class_string(__eci->engine_class), \
 					      __eci->engine_instance)
 
-igt_main()
+int igt_main()
 {
 	struct drm_xe_engine_class_instance *eci;
 	bool was_enabled;
diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index 3df66850019f..6935fa8aa406 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -412,7 +412,7 @@ static void long_shader(int fd, struct drm_xe_engine_class_instance *hwe,
 	free(buf);
 }
 
-igt_main()
+int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
 	int fd;
diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 2bcb7b513b63..fed9b8fc2669 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -2216,7 +2216,7 @@ struct section {
 	uint8_t (*fn)(int pat);
 };
 
-igt_main()
+int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
 	const struct section sections[] = {
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 58a1558e57fb..e8d56a3ef36a 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -1109,7 +1109,7 @@ static void threads(int fd, int flags)
 	pthread_barrier_destroy(&barrier);
 }
 
-igt_main()
+int igt_main()
 {
 	const struct section {
 		const char *name;
diff --git a/tests/intel/xe_exercise_blt.c b/tests/intel/xe_exercise_blt.c
index 47879a0dce38..5aba07ec3ea9 100644
--- a/tests/intel/xe_exercise_blt.c
+++ b/tests/intel/xe_exercise_blt.c
@@ -385,7 +385,7 @@ const char *help_str =
 	"  -H\tHeight (default 512)"
 	;
 
-igt_main_args("b:pst:W:H:", NULL, help_str, opt_handler, NULL)
+int igt_main_args("b:pst:W:H:", NULL, help_str, opt_handler, NULL)
 {
 	struct igt_collection *set;
 	int xe;
diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index b7278c16aa6d..013b4dc9ad51 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -553,7 +553,7 @@ const char *help_str =
 	If not set, an error will be injected in every possible function call\
 	starting from first up to 100.";
 
-igt_main_args("I:", NULL, help_str, opt_handler, NULL)
+int igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 {
 	int fd, sysfs;
 	struct drm_xe_engine_class_instance *hwe;
diff --git a/tests/intel/xe_gpgpu_fill.c b/tests/intel/xe_gpgpu_fill.c
index e61d5c8db903..ce6222ddd7c5 100644
--- a/tests/intel/xe_gpgpu_fill.c
+++ b/tests/intel/xe_gpgpu_fill.c
@@ -169,7 +169,7 @@ const char *help_str =
 	;
 
 
-igt_main_args("dW:H:X:Y:", NULL, help_str, opt_handler, NULL)
+int igt_main_args("dW:H:X:Y:", NULL, help_str, opt_handler, NULL)
 {
 	data_t data = {0, };
 	igt_fillfunc_t fill_fn = NULL;
diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index db5c980eb069..c02d6189ae9e 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -393,7 +393,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci, bool fix
 	xe_vm_destroy(fd, vm);
 }
 
-igt_main()
+int igt_main()
 {
 	int fd;
 	int gt;
diff --git a/tests/intel/xe_huc_copy.c b/tests/intel/xe_huc_copy.c
index 77a87acc540a..e8f4fb562429 100644
--- a/tests/intel/xe_huc_copy.c
+++ b/tests/intel/xe_huc_copy.c
@@ -191,7 +191,7 @@ is_huc_running(int fd)
 	return false;
 }
 
-igt_main()
+int igt_main()
 {
 	int xe;
 
diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
index d7dbe661a790..02de63a3a679 100644
--- a/tests/intel/xe_intel_bb.c
+++ b/tests/intel/xe_intel_bb.c
@@ -984,7 +984,7 @@ const char *help_str =
 	"  -b\tDump to base64 (bb and images)\n"
 	;
 
-igt_main_args("dpib", NULL, help_str, opt_handler, NULL)
+int igt_main_args("dpib", NULL, help_str, opt_handler, NULL)
 {
 	int xe;
 	struct buf_ops *bops;
diff --git a/tests/intel/xe_live_ktest.c b/tests/intel/xe_live_ktest.c
index f65d44af9963..e80d7f68e04d 100644
--- a/tests/intel/xe_live_ktest.c
+++ b/tests/intel/xe_live_ktest.c
@@ -53,7 +53,7 @@ static const char *live_tests[] = {
 	"xe_eudebug",
 };
 
-igt_main()
+int igt_main()
 {
 	int i;
 
diff --git a/tests/intel/xe_media_fill.c b/tests/intel/xe_media_fill.c
index 65fd16dcd036..56c96261567d 100644
--- a/tests/intel/xe_media_fill.c
+++ b/tests/intel/xe_media_fill.c
@@ -115,7 +115,7 @@ static void media_fill(struct data_t *data, igt_fillfunc_t fill)
 	munmap(ptr, buf->surface[0].size);
 }
 
-igt_main()
+int igt_main()
 {
 	struct data_t data = {0, };
 	igt_fillfunc_t fill_fn = NULL;
diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
index 3bcd1668cd9a..37ae12acb36b 100644
--- a/tests/intel/xe_mmap.c
+++ b/tests/intel/xe_mmap.c
@@ -440,7 +440,7 @@ static void prepare_pci_membarrier_test(int fd, int *fw_ptr)
 	igt_assert_lte(0, *fw_ptr);
 }
 
-igt_main()
+int igt_main()
 {
 	int fd;
 
diff --git a/tests/intel/xe_module_load.c b/tests/intel/xe_module_load.c
index e4f8c41da85e..6fcf4f806bf4 100644
--- a/tests/intel/xe_module_load.c
+++ b/tests/intel/xe_module_load.c
@@ -116,7 +116,7 @@ static const char * const unwanted_drivers[] = {
  * SUBTEST: many-reload
  * Description: Reload the Xe driver many times
  */
-igt_main()
+int igt_main()
 {
 	igt_describe("Check if xe and friends are not yet loaded, then load them.");
 	igt_subtest("load") {
diff --git a/tests/intel/xe_noexec_ping_pong.c b/tests/intel/xe_noexec_ping_pong.c
index 9c5961be5a77..02ffefc8cbcf 100644
--- a/tests/intel/xe_noexec_ping_pong.c
+++ b/tests/intel/xe_noexec_ping_pong.c
@@ -95,7 +95,7 @@ static void test_ping_pong(int fd, struct drm_xe_engine *engine)
 static int fd;
 
 IGT_TEST_DESCRIPTION("Expose compute VM's unnecessary rebinds");
-igt_main()
+int igt_main()
 {
 	igt_fixture()
 		fd = drm_open_driver(DRIVER_XE);
diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 9da5eb5a63b5..a6af1166e637 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4975,7 +4975,7 @@ static struct option long_options[] = {
 	{ NULL, 0, 0, 0 }
 };
 
-igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
+int igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 {
 	const struct sync_section {
 		const char *name;
diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 8af4c32f489c..957057f09748 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -1155,7 +1155,7 @@ static int opt_handler(int opt, int opt_index, void *data)
 const char *help_str =
 	"  -V\tVerify every dword (might be slow)\n";
 
-igt_main_args("V", NULL, help_str, opt_handler, NULL)
+int igt_main_args("V", NULL, help_str, opt_handler, NULL)
 {
 	uint16_t dev_id;
 	int fd;
diff --git a/tests/intel/xe_peer2peer.c b/tests/intel/xe_peer2peer.c
index d9f8ee07be12..cb9ef740c743 100644
--- a/tests/intel/xe_peer2peer.c
+++ b/tests/intel/xe_peer2peer.c
@@ -363,7 +363,7 @@ static void gpu_write(struct gpu_info *ex_gpu, struct gpu_info *im_gpu)
 
 #define DEFAULT_SIZE 0
 
-igt_main_args("", NULL, NULL, NULL, NULL)
+int igt_main_args("", NULL, NULL, NULL, NULL)
 {
 	struct gpu_info gpus[2];
 	int gpu_cnt;
diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 6876e0bd9ac6..54f2e9d1817c 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -871,7 +871,7 @@ static void i2c_test(device_t device, int sysfs_fd, enum igt_acpi_d_state d_stat
 	close(i2c_fd);
 }
 
-igt_main()
+int igt_main()
 {
 	device_t device;
 	uint32_t d3cold_allowed;
diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 7dc1ab2c1e05..d33a87b13989 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -370,7 +370,7 @@ static void cpg_gt_toggle(int fd)
 		powergate_status(fd, gt, "down");
 }
 
-igt_main()
+int igt_main()
 {
 	uint32_t d3cold_allowed;
 	int fd, gt;
diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index e8b2f4b4b5f9..806bca024ff3 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -1056,7 +1056,7 @@ static void restore_gt_freq(int fd, uint32_t *stash_min, uint32_t *stash_max)
 	free(stash_max);
 }
 
-igt_main()
+int igt_main()
 {
 	int fd, gt, num_engines;
 	struct drm_xe_engine_class_instance *eci;
diff --git a/tests/intel/xe_prime_self_import.c b/tests/intel/xe_prime_self_import.c
index 9b25d2d0b1cc..b43269d4f159 100644
--- a/tests/intel/xe_prime_self_import.c
+++ b/tests/intel/xe_prime_self_import.c
@@ -514,7 +514,7 @@ static void test_llseek_bad(void)
 	drm_close_driver(fd);
 }
 
-igt_main()
+int igt_main()
 {
 	struct {
 		const char *name;
diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
index d92c67961f47..c6274bf616bf 100644
--- a/tests/intel/xe_pxp.c
+++ b/tests/intel/xe_pxp.c
@@ -1102,7 +1102,7 @@ static void exit_handler(int sig)
 	usleep(50 * 1000); /* give time for the termination to be processed */
 }
 
-igt_main()
+int igt_main()
 {
 	bool pxp_supported = true;
 	drmModeResPtr res;
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 1f62090776ca..3ab74eb79a9f 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -1117,7 +1117,7 @@ static void test_query_pxp_status(int fd)
 	free(qpxp);
 }
 
-igt_main()
+int igt_main()
 {
 	const struct {
 		const char *name;
diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
index 6a2ef4fe96e9..ed87132e02fc 100644
--- a/tests/intel/xe_render_copy.c
+++ b/tests/intel/xe_render_copy.c
@@ -677,7 +677,7 @@ const char *help_str =
 	;
 
 
-igt_main_args("dpiW:H:", NULL, help_str, opt_handler, NULL)
+int igt_main_args("dpiW:H:", NULL, help_str, opt_handler, NULL)
 {
 	int xe;
 	struct buf_ops *bops;
diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index 528230d91c90..d148b6abe4f5 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -526,7 +526,7 @@ static void xe_spin_timestamp_check(int fd, struct drm_xe_engine_class_instance
 	run_spinner(fd, eci);
 }
 
-igt_main()
+int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
 	int fd;
diff --git a/tests/intel/xe_sriov_auto_provisioning.c b/tests/intel/xe_sriov_auto_provisioning.c
index 1b13eb7f8f65..8f573d234e8d 100644
--- a/tests/intel/xe_sriov_auto_provisioning.c
+++ b/tests/intel/xe_sriov_auto_provisioning.c
@@ -313,7 +313,7 @@ static const struct option long_opts[] = {
 static const char help_str[] =
 	"  --extended\tRun the extended test scope\n";
 
-igt_main_args("", long_opts, help_str, opts_handler, NULL)
+int igt_main_args("", long_opts, help_str, opts_handler, NULL)
 {
 	enum xe_sriov_shared_res res;
 	unsigned int gt, total_vfs;
diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index ad5de95c7217..12989d0f5eba 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -1023,7 +1023,7 @@ static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
 	verify_flr(pf_fd, num_vfs, checks, num_checks, exec_strategy);
 }
 
-igt_main()
+int igt_main()
 {
 	int pf_fd;
 	bool autoprobe;
diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
index e2ee96c72901..fad3cbb0438c 100644
--- a/tests/intel/xe_sriov_scheduling.c
+++ b/tests/intel/xe_sriov_scheduling.c
@@ -884,7 +884,7 @@ static const char help_str[] =
 	"  --pt_us\tpreempt_timeout_us\n"
 	"  --inflight\tNumber of submissions kept in flight per VF (0=auto)\n";
 
-igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
+int igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
 {
 	int pf_fd;
 	bool autoprobe;
diff --git a/tests/intel/xe_sriov_vram.c b/tests/intel/xe_sriov_vram.c
index 75eb03e7b6bc..622ca77fc735 100644
--- a/tests/intel/xe_sriov_vram.c
+++ b/tests/intel/xe_sriov_vram.c
@@ -331,7 +331,7 @@ static const char help_str[] =
 	"  --extended\tRun the extended test scope\n"
 	"  --verbose\tEnable verbose logging\n";
 
-igt_main_args("", long_opts, help_str, opts_handler, NULL)
+int igt_main_args("", long_opts, help_str, opts_handler, NULL)
 {
 	bool autoprobe;
 	int pf_fd;
diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
index 8325ee85adbf..552414903f08 100644
--- a/tests/intel/xe_survivability.c
+++ b/tests/intel/xe_survivability.c
@@ -207,7 +207,7 @@ static void test_spinner_after_recovery(int fd)
 	put_ahnd(ahnd);
 }
 
-igt_main()
+int igt_main()
 {
 	int fd, configfs_fd, configfs_device_fd;
 	struct pci_device *pci_xe;
diff --git a/tests/intel/xe_sysfs_defaults.c b/tests/intel/xe_sysfs_defaults.c
index 807a1defdde2..bc2690c186be 100644
--- a/tests/intel/xe_sysfs_defaults.c
+++ b/tests/intel/xe_sysfs_defaults.c
@@ -58,7 +58,7 @@ static void test_defaults(int xe, int engine, const char **property,
 	closedir(dir);
 }
 
-igt_main()
+int igt_main()
 {
 	int xe, sys_fd;
 	int gt;
diff --git a/tests/intel/xe_sysfs_preempt_timeout.c b/tests/intel/xe_sysfs_preempt_timeout.c
index 1bc762ef4697..725707bf679a 100644
--- a/tests/intel/xe_sysfs_preempt_timeout.c
+++ b/tests/intel/xe_sysfs_preempt_timeout.c
@@ -173,7 +173,7 @@ static void test_timeout(int fd, int engine, const char **property, uint16_t cla
 }
 
 #define	MAX_GTS	8
-igt_main()
+int igt_main()
 {
 	static const struct {
 		const char *name;
diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_scheduler.c
index bf714b5f5371..38362506406a 100644
--- a/tests/intel/xe_sysfs_scheduler.c
+++ b/tests/intel/xe_sysfs_scheduler.c
@@ -219,7 +219,7 @@ static void test_invalid_large_string(int xe, int engine, const char **property,
 }
 
 #define MAX_GTS 8
-igt_main()
+int igt_main()
 {
 	static const struct {
 		const char *name;
diff --git a/tests/intel/xe_sysfs_timeslice_duration.c b/tests/intel/xe_sysfs_timeslice_duration.c
index 55ce7e4995c5..93b97f805665 100644
--- a/tests/intel/xe_sysfs_timeslice_duration.c
+++ b/tests/intel/xe_sysfs_timeslice_duration.c
@@ -149,7 +149,7 @@ static void test_timeout(int fd, int engine, const char **property, uint16_t cla
 }
 
 #define	MAX_GTS	8
-igt_main()
+int igt_main()
 {
 	static const struct {
 		const char *name;
diff --git a/tests/intel/xe_tlb.c b/tests/intel/xe_tlb.c
index 7c545abff60b..6c88631ac06b 100644
--- a/tests/intel/xe_tlb.c
+++ b/tests/intel/xe_tlb.c
@@ -128,7 +128,7 @@ static void tlb_invalidation(int fd, struct drm_xe_engine_class_instance *eci)
 	xe_vm_destroy(fd, vm);
 }
 
-igt_main()
+int igt_main()
 {
 	int fd;
 	struct drm_xe_engine *engine;
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 9a944adc6898..ccff8f8046be 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -2450,7 +2450,7 @@ static void test_oom(int fd)
 	}
 }
 
-igt_main()
+int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe, *hwe_non_copy = NULL;
 	uint64_t bind_size;
diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index 3cd96d43d284..ff92a13fa35a 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -275,7 +275,7 @@ exec_queue_reset_wait(int fd)
 	}
 }
 
-igt_main()
+int igt_main()
 {
 	int fd;
 
diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index 7eae418835f7..bcd78b49d703 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -208,7 +208,7 @@ simple_hang(int fd, struct drm_xe_sync *sync)
  * SUBTEST: basic-wedged-read
  * Description: Read wedged_mode debugfs
  */
-igt_main()
+int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
 	int fd;
diff --git a/tests/kms_3d.c b/tests/kms_3d.c
index 12316ca08b16..c73d1f407d94 100644
--- a/tests/kms_3d.c
+++ b/tests/kms_3d.c
@@ -40,7 +40,7 @@
 
 IGT_TEST_DESCRIPTION("Tests 3D mode setting.");
 
-igt_main()
+int igt_main()
 {
 	int drm_fd;
 	drmModeRes *res;
diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index 43a9794b18f2..c8889c53cd5c 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -982,7 +982,7 @@ static bool has_addfb2_iface(int fd)
 
 int fd;
 
-igt_main()
+int igt_main()
 {
 	igt_fixture() {
 		fd = drm_open_driver_master(DRIVER_ANY);
diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 50d5b5850e66..6b2da0013b25 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -1065,7 +1065,7 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 
 static data_t data;
 
-igt_main()
+int igt_main()
 {
 	int i;
 
diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index ab871edd3ba8..2a5f31357c56 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -1398,7 +1398,7 @@ static int opt_handler(int opt, int opt_index, void *_data)
 static const char *help_str =
 	"  -e \tRun on all pipes. (By default subtests will run only on one pipe)\n";
 
-igt_main_args("e", NULL, help_str, opt_handler, NULL)
+int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 {
 	enum pipe pipe = PIPE_NONE;
 	igt_output_t *output = NULL;
diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interruptible.c
index 29a1f2e0bdc3..9bce0bf1f829 100644
--- a/tests/kms_atomic_interruptible.c
+++ b/tests/kms_atomic_interruptible.c
@@ -321,7 +321,7 @@ static bool pipe_output_combo_valid(igt_display_t *display,
 	return ret;
 }
 
-igt_main()
+int igt_main()
 {
 	igt_display_t display;
 	igt_output_t *output;
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index bb17cb70d0ee..18f79136c30f 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -1120,7 +1120,7 @@ static const char help_str[] =
 
 static data_t data;
 
-igt_main_args("", long_opts, help_str, opt_handler, &data)
+int igt_main_args("", long_opts, help_str, opt_handler, &data)
 {
 	igt_output_t *output;
 	enum pipe pipe;
diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index b6126e03a233..02e2de00344f 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -259,7 +259,7 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 	test_fini(data);
 }
 
-igt_main()
+int igt_main()
 {
 	data_t data;
 	int i = 0, j = 0;
diff --git a/tests/kms_color.c b/tests/kms_color.c
index ceee839bc35b..847359a6d601 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -1171,7 +1171,7 @@ run_tests_for_pipe(data_t *data)
 	}
 }
 
-igt_main()
+int igt_main()
 {
 	data_t data = {};
 
diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index dff1247c51b9..bb8cbe703622 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -387,7 +387,7 @@ struct option long_options[] = {
 
 static data_t data;
 
-igt_main_args("", long_options, help_str, opt_handler, NULL)
+int igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
 	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 1113a36fd26c..184e94bca739 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -980,7 +980,7 @@ static const struct {
 	},
 };
 
-igt_main()
+int igt_main()
 {
 	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index bb3bbd5cb7b6..7ca2ca82c0bd 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -1261,7 +1261,7 @@ static int opt_handler(int opt, int opt_index, void *_data)
 const char *help_str =
 	"  -e \tExtended tests.\n";
 
-igt_main_args("e", NULL, help_str, opt_handler, NULL)
+int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 {
 	uint64_t cursor_width = 64, cursor_height = 64;
 	int ret;
diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index 7ea1439b38d3..27f861378763 100644
--- a/tests/kms_cursor_edge_walk.c
+++ b/tests/kms_cursor_edge_walk.c
@@ -342,7 +342,7 @@ static const char *help_str =
 	"  --jump\t\tJump the cursor to middle of the screen between each step)\n"
 	"  --extended\t\tRun on all pipes.(Default it will Run only two pipes)\n";
 
-igt_main_args("", long_opts, help_str, opt_handler, &data)
+int igt_main_args("", long_opts, help_str, opt_handler, &data)
 {
 	struct {
 		const char *name;
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index dc2fbc460a7a..3344c27a0cdb 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1824,7 +1824,7 @@ static void modeset_atomic_cursor_hotspot(igt_display_t *display)
 	igt_remove_fb(display->drm_fd, &cursor_fb);
 }
 
-igt_main()
+int igt_main()
 {
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	igt_display_t display = { .drm_fd = -1 };
diff --git a/tests/kms_debugfs.c b/tests/kms_debugfs.c
index 7db75637e912..e77c91afff9f 100644
--- a/tests/kms_debugfs.c
+++ b/tests/kms_debugfs.c
@@ -94,7 +94,7 @@ static void igt_display_all_off(igt_display_t *display)
 
 IGT_TEST_DESCRIPTION("Read entries from debugfs with display on/off.");
 
-igt_main()
+int igt_main()
 {
 	int debugfs = -1;
 	igt_display_t display;
diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index 2f229a953f64..b8b1fa8e555c 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -227,7 +227,7 @@ static void run_extendedmode_test(data_t *data) {
 	}
 }
 
-igt_main()
+int igt_main()
 {
 	int dp_mst_outputs = 0, count = 0;
 	igt_output_t *output;
diff --git a/tests/kms_dither.c b/tests/kms_dither.c
index cf9e054e2000..a4cb004e8e24 100644
--- a/tests/kms_dither.c
+++ b/tests/kms_dither.c
@@ -236,7 +236,7 @@ run_dither_test(data_t *data, int fb_bpc, int fb_format, int output_bpc)
 	}
 }
 
-igt_main()
+int igt_main()
 {
 	struct {
 		int fb_bpc;
diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
index 6e10eb392bf5..a0615a113f1c 100644
--- a/tests/kms_feature_discovery.c
+++ b/tests/kms_feature_discovery.c
@@ -71,7 +71,7 @@ static igt_display_t display;
 IGT_TEST_DESCRIPTION("A metatest that checks for \"features\" presence. "
 		     "The subtests here should only skip or pass, "
 		     "anything else means we have a serious problem.");
-igt_main() {
+int igt_main() {
 	igt_fd_t(debugfs_fd);
 	igt_fd_t(fd);
 
diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 787c23100366..a74e69c6f042 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -2042,7 +2042,7 @@ static int opt_handler(int opt, int opt_index, void *data)
 const char *help_str =
 	"  -e \tRun on all pipes. (By default subtests will run on two pipes)\n";
 
-igt_main_args("e", NULL, help_str, opt_handler, NULL)
+int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 {
 	struct {
 		int duration;
diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c
index 79f90000da56..2526951dc54b 100644
--- a/tests/kms_flip_event_leak.c
+++ b/tests/kms_flip_event_leak.c
@@ -103,7 +103,7 @@ static void test(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_remove_fb(data->drm_fd, &fb[0]);
 }
 
-igt_main()
+int igt_main()
 {
 	data_t data = {};
 	igt_output_t *output;
diff --git a/tests/kms_force_connector_basic.c b/tests/kms_force_connector_basic.c
index 19909084c445..4ea6b0e8c03d 100644
--- a/tests/kms_force_connector_basic.c
+++ b/tests/kms_force_connector_basic.c
@@ -314,7 +314,7 @@ struct option long_opts[] = {
 const char *help_str =
 	"  --reset\t\tReset all connector force states and edid.\n";
 
-igt_main_args("", long_opts, help_str, opt_handler, NULL)
+int igt_main_args("", long_opts, help_str, opt_handler, NULL)
 {
 	/* Force the VGA output and test that it worked. */
 	int i, drm_fd = 0;
diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
index 9354c27ed18d..5b0eea161163 100644
--- a/tests/kms_getfb.c
+++ b/tests/kms_getfb.c
@@ -425,7 +425,7 @@ static void test_handle_protection(void) {
 	}
 }
 
-igt_main()
+int igt_main()
 {
 	int fd;
 	igt_display_t display;
diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c
index 61d42d1a6021..00eb5e4a4f8c 100644
--- a/tests/kms_hdmi_inject.c
+++ b/tests/kms_hdmi_inject.c
@@ -211,7 +211,7 @@ hdmi_inject_audio(int drm_fd, drmModeConnector *connector)
 	kmstest_force_edid(drm_fd, connector, NULL);
 }
 
-igt_main()
+int igt_main()
 {
 	int drm_fd;
 	drmModeRes *res;
diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 0fd0a505b302..ab0ec47cbfad 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -799,7 +799,7 @@ static void test_hdr(data_t *data, uint32_t flags)
 	}
 }
 
-igt_main()
+int igt_main()
 {
 	data_t data = {};
 
diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index 8f4e19657791..78c73e72ffa3 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -334,7 +334,7 @@ static const struct {
 
 static data_t data;
 
-igt_main()
+int igt_main()
 {
 
 	enum pipe pipe;
diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 914254309532..02eee701639a 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -1239,7 +1239,7 @@ static void lease_uevent(data_t *data)
 	igt_cleanup_uevents(uevent_monitor);
 }
 
-igt_main()
+int igt_main()
 {
 	data_t data;
 	igt_output_t *output;
diff --git a/tests/kms_multipipe_modeset.c b/tests/kms_multipipe_modeset.c
index ec191e025021..28c71fdec00a 100644
--- a/tests/kms_multipipe_modeset.c
+++ b/tests/kms_multipipe_modeset.c
@@ -142,7 +142,7 @@ static void test_multipipe(data_t *data, int num_pipes)
 	run_test(data, valid_outputs);
 }
 
-igt_main()
+int igt_main()
 {
 	data_t data;
 	drmModeResPtr res;
diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
index 51934e151ee3..14cebf384d91 100644
--- a/tests/kms_panel_fitting.c
+++ b/tests/kms_panel_fitting.c
@@ -281,7 +281,7 @@ static void test_panel_fitting(data_t *data, enum test_type type)
 	}
 }
 
-igt_main()
+int igt_main()
 {
 	data_t data = {};
 
diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 0a15799965e3..ca8f76c8aa27 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -368,7 +368,7 @@ static int opt_handler(int opt, int opt_index, void *_data)
 const char *help_str =
 	"  -e \tExtended tests.\n";
 
-igt_main_args("e", NULL, help_str, opt_handler, NULL)
+int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 {
 	enum pipe pipe;
 	igt_output_t *output;
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index d09bd361f142..cb5769a4c83b 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1451,7 +1451,7 @@ static const char help_str[] =
 
 static data_t data;
 
-igt_main_args("", long_opts, help_str, opt_handler, &data)
+int igt_main_args("", long_opts, help_str, opt_handler, &data)
 {
 	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index 2d033a4525ba..037a5c1060a2 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -732,7 +732,7 @@ static int opt_handler(int opt, int opt_index, void *_data)
 const char *help_str =
 	"  -e \tExtended tests.\n";
 
-igt_main_args("e", NULL, help_str, opt_handler, NULL)
+int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 {
 	data_t data = {};
 
diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index b0b3f7b9baba..c8b42fb5c401 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -284,7 +284,7 @@ static void test_cursor(data_t *data, int size, unsigned int flags)
 	test_cursor_spots(data, size, flags);
 }
 
-igt_main()
+int igt_main()
 {
 	static const int cursor_sizes[] = { 64, 128, 256 };
 	data_t data = { .max_curw = 64, .max_curh = 64 };
diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index b0f256802962..5dac21ea6def 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -338,7 +338,7 @@ static const struct {
 	},
 };
 
-igt_main()
+int igt_main()
 {
 	data_t data = {};
 
diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 1921f120528f..b4a6436e3add 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -629,7 +629,7 @@ struct option long_options[] = {
 	{ 0, 0, 0, 0 }
 };
 
-igt_main_args("", long_options, help_str, opt_handler, NULL)
+int igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
 	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 9ca958866897..c4bd03adb098 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -1347,7 +1347,7 @@ static const char help_str[] =
 
 static data_t data;
 
-igt_main_args("", long_opts, help_str, opt_handler, &data)
+int igt_main_args("", long_opts, help_str, opt_handler, &data)
 {
 	enum pipe pipe;
 	uint32_t ret = -EINVAL;
diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index 778debbd9c50..b4469d83339b 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -551,7 +551,7 @@ static void kms_poll_disable(void)
 	close(sysfs_fd);
 }
 
-igt_main()
+int igt_main()
 {
 	int first_fd = -1;
 	int second_fd_vgem = -1;
diff --git a/tests/kms_prop_blob.c b/tests/kms_prop_blob.c
index a63d950892f0..83c396936cc1 100644
--- a/tests/kms_prop_blob.c
+++ b/tests/kms_prop_blob.c
@@ -345,7 +345,7 @@ static void prop_tests(int fd)
 		destroy_prop(fd, blob_id);
 }
 
-igt_main()
+int igt_main()
 {
 	int fd;
 
diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index bb6feb152579..82daa6f96515 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -820,7 +820,7 @@ static void invalid_properties(igt_display_t *display, bool atomic)
 		test_object_invalid_properties(display, output->id, DRM_MODE_OBJECT_CONNECTOR, atomic);
 }
 
-igt_main()
+int igt_main()
 {
 	igt_display_t display;
 	int i;
diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
index 807df9ec89f1..716c96972554 100644
--- a/tests/kms_rmfb.c
+++ b/tests/kms_rmfb.c
@@ -190,7 +190,7 @@ run_rmfb_test(struct rmfb_data *data, bool reopen)
 	}
 }
 
-igt_main()
+int igt_main()
 {
 	const struct {
 		bool reopen;
diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index aac9d2038290..6f10da8fbf7c 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -1184,7 +1184,7 @@ static const char help_str[] =
 
 static data_t data;
 
-igt_main_args("", long_opts, help_str, opt_handler, &data)
+int igt_main_args("", long_opts, help_str, opt_handler, &data)
 {
 	struct rot_subtest {
 		unsigned plane;
diff --git a/tests/kms_scaling_modes.c b/tests/kms_scaling_modes.c
index 8d120dc8ad21..4edefe4ec5b1 100644
--- a/tests/kms_scaling_modes.c
+++ b/tests/kms_scaling_modes.c
@@ -130,7 +130,7 @@ static void test_scaling_mode(data_t *data, uint32_t flags)
 	}
 }
 
-igt_main()
+int igt_main()
 {
 	data_t data = {};
 
diff --git a/tests/kms_selftest.c b/tests/kms_selftest.c
index dbd1b048179e..45cebd813c1c 100644
--- a/tests/kms_selftest.c
+++ b/tests/kms_selftest.c
@@ -49,7 +49,7 @@
 
 IGT_TEST_DESCRIPTION("Basic sanity check of KMS selftests.");
 
-igt_main()
+int igt_main()
 {
 	static const char *kunit_subtests[] = {
 		"drm_cmdline_parser_test",
diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
index 17295ba517a2..46edcc50d2ab 100644
--- a/tests/kms_sequence.c
+++ b/tests/kms_sequence.c
@@ -268,7 +268,7 @@ static void sequence_queue(data_t *data, int fd, int nchildren)
 		 frame_time * 1000.0, 1.0/frame_time);
 }
 
-igt_main()
+int igt_main()
 {
 	int fd;
 	igt_output_t *output;
diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 586adc5d678d..108e713610fd 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -1030,7 +1030,7 @@ const char *help_str =
 	"  -e \t\tExtend to run on all pipes. (By default tests will run on two pipes only)\n";
 
 
-igt_main_args("det:", NULL, help_str, opt_handler, NULL)
+int igt_main_args("det:", NULL, help_str, opt_handler, NULL)
 {
 	const struct {
 		enum test_flags flags;
diff --git a/tests/kms_sharpness_filter.c b/tests/kms_sharpness_filter.c
index 6248d1e897b7..41a42c60868a 100644
--- a/tests/kms_sharpness_filter.c
+++ b/tests/kms_sharpness_filter.c
@@ -556,7 +556,7 @@ static const char help_str[] =
 
 data_t data = {};
 
-igt_main_args("l", NULL, help_str, opt_handler, &data)
+int igt_main_args("l", NULL, help_str, opt_handler, &data)
 {
 	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
index 9d98e806ae80..f50ac5f17a76 100644
--- a/tests/kms_tiled_display.c
+++ b/tests/kms_tiled_display.c
@@ -566,7 +566,7 @@ static void basic_test(data_t *data, drmEventContext *drm_event, struct pollfd *
 	}
 }
 
-igt_main()
+int igt_main()
 {
 	data_t data = {0};
 	struct pollfd pfd = {0};
diff --git a/tests/kms_tv_load_detect.c b/tests/kms_tv_load_detect.c
index 3f7e1b8240bf..a668cd423a5c 100644
--- a/tests/kms_tv_load_detect.c
+++ b/tests/kms_tv_load_detect.c
@@ -39,7 +39,7 @@
 
 IGT_TEST_DESCRIPTION("Check tv load detection works correctly.");
 
-igt_main()
+int igt_main()
 {
 	/* force the VGA output and test that it worked */
 	int drm_fd = 0;
diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 2f8c6ce92617..47c805cd36cd 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -891,7 +891,7 @@ run_tests(data_t *data)
 	}
 }
 
-igt_main()
+int igt_main()
 {
 	data_t data;
 
diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index 34499e5c7d0d..bce767a2ab83 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -622,7 +622,7 @@ static int opt_handler(int opt, int opt_index, void *data)
 const char *help_str =
 	"  -e \tRun on all pipes. (By default subtests will run on two pipes)\n";
 
-igt_main_args("e", NULL, help_str, opt_handler, NULL)
+int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 {
 	int fd;
 	data_t data;
diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 81101ea33c36..193f02b51ced 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -1144,7 +1144,7 @@ static const char help_str[] =
 
 static data_t data;
 
-igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
+int igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
 {
 	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index f6f335ba17b0..3a26c5b8bdcf 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -525,7 +525,7 @@ static const struct option long_options[] = {
 	{}
 };
 
-igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
+int igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 {
 	igt_display_t display;
 	igt_output_t *output;
diff --git a/tests/meta_test.c b/tests/meta_test.c
index 56503d8a3313..3212be289a39 100644
--- a/tests/meta_test.c
+++ b/tests/meta_test.c
@@ -117,7 +117,7 @@ static void test_panic(void)
 	system("echo c > /proc/sysrq-trigger");
 }
 
-igt_main()
+int igt_main()
 {
 
 	igt_fixture() {
diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
index 69cef2c8c876..05960627c7c2 100644
--- a/tests/msm/msm_mapping.c
+++ b/tests/msm/msm_mapping.c
@@ -262,7 +262,7 @@ do_mapping_test(struct msm_pipe *pipe, const char *buffername, bool write)
  * Tests for drm/msm hangcheck, recovery, and fault handling
  */
 
-igt_main()
+int igt_main()
 {
 	struct msm_device *dev = NULL;
 	struct msm_pipe *pipe = NULL;
diff --git a/tests/msm/msm_recovery.c b/tests/msm/msm_recovery.c
index 86fd930cf564..21e3cb076a4a 100644
--- a/tests/msm/msm_recovery.c
+++ b/tests/msm/msm_recovery.c
@@ -215,7 +215,7 @@ do_fault_test(struct msm_pipe *pipe, bool stress)
  * Tests for drm/msm hangcheck, recovery, and fault handling
  */
 
-igt_main()
+int igt_main()
 {
 	static struct msm_pipe *pipe = NULL;
 
diff --git a/tests/msm/msm_shrink.c b/tests/msm/msm_shrink.c
index 9b689e80ea51..8c701c4e2669 100644
--- a/tests/msm/msm_shrink.c
+++ b/tests/msm/msm_shrink.c
@@ -243,7 +243,7 @@ static void run_test(int nchildren, uint64_t alloc_size_mb, unsigned num_bos,
 
 static const unsigned num_bos[] = { 8, 32 };
 
-igt_main()
+int igt_main()
 {
 	struct msm_device *dev = NULL;
 	uint64_t alloc_size_mb = 0;
diff --git a/tests/msm/msm_submit.c b/tests/msm/msm_submit.c
index 1b2e7b147a68..452466e35364 100644
--- a/tests/msm/msm_submit.c
+++ b/tests/msm/msm_submit.c
@@ -24,7 +24,7 @@
 #include "igt.h"
 #include "igt_msm.h"
 
-igt_main()
+int igt_main()
 {
 	struct msm_device *dev = NULL;
 	struct msm_pipe *pipe = NULL;
diff --git a/tests/msm/msm_submitoverhead.c b/tests/msm/msm_submitoverhead.c
index 5f84a186d2c5..8a60fd92b073 100644
--- a/tests/msm/msm_submitoverhead.c
+++ b/tests/msm/msm_submitoverhead.c
@@ -14,7 +14,7 @@
 
 #define MAX_BOS 1000
 
-igt_main()
+int igt_main()
 {
 	struct msm_device *dev = NULL;
 	struct msm_pipe *pipe = NULL;
diff --git a/tests/nouveau_crc.c b/tests/nouveau_crc.c
index 929c59404145..bf913cf13ad4 100644
--- a/tests/nouveau_crc.c
+++ b/tests/nouveau_crc.c
@@ -318,7 +318,7 @@ static void test_source_outp_inactive(data_t *data)
 data_t data = {0};
 
 #define pipe_test(name) igt_subtest_f("pipe-%s-" name, kmstest_pipe_name(pipe))
-igt_main()
+int igt_main()
 {
 	int pipe;
 
diff --git a/tests/panfrost/panfrost_gem_new.c b/tests/panfrost/panfrost_gem_new.c
index b97287deed23..5ab5d4a42663 100644
--- a/tests/panfrost/panfrost_gem_new.c
+++ b/tests/panfrost/panfrost_gem_new.c
@@ -35,7 +35,7 @@
 #include <sys/ioctl.h>
 #include "panfrost_drm.h"
 
-igt_main()
+int igt_main()
 {
 	int fd;
 
diff --git a/tests/panfrost/panfrost_get_param.c b/tests/panfrost/panfrost_get_param.c
index e6f63b4f9071..8e8b19380e29 100644
--- a/tests/panfrost/panfrost_get_param.c
+++ b/tests/panfrost/panfrost_get_param.c
@@ -36,7 +36,7 @@
 #include <poll.h>
 #include "panfrost_drm.h"
 
-igt_main()
+int igt_main()
 {
 	int fd;
 
diff --git a/tests/panfrost/panfrost_prime.c b/tests/panfrost/panfrost_prime.c
index cc07c8570693..ccae7aeba9d0 100644
--- a/tests/panfrost/panfrost_prime.c
+++ b/tests/panfrost/panfrost_prime.c
@@ -55,7 +55,7 @@ static bool igt_has_prime(int fd, uint64_t flags)
 	return (value & flags) == flags;
 }
 
-igt_main()
+int igt_main()
 {
 	int fd, kms_fd;
 
diff --git a/tests/panfrost/panfrost_submit.c b/tests/panfrost/panfrost_submit.c
index dd899857ec0f..affa1f4e1ee0 100644
--- a/tests/panfrost/panfrost_submit.c
+++ b/tests/panfrost/panfrost_submit.c
@@ -62,7 +62,7 @@ static void check_done(struct mali_job_descriptor_header *header)
         igt_assert(header->exception_status == 1 && header->fault_pointer == 0);
 }
 
-igt_main()
+int igt_main()
 {
         int fd;
 
diff --git a/tests/panthor/panthor_gem.c b/tests/panthor/panthor_gem.c
index 1d372d4c6f02..27e83fe85b41 100644
--- a/tests/panthor/panthor_gem.c
+++ b/tests/panthor/panthor_gem.c
@@ -7,7 +7,7 @@
 #include "igt_core.h"
 #include "igt_panthor.h"
 
-igt_main() {
+int igt_main() {
 	int fd;
 
 	igt_fixture() {
diff --git a/tests/panthor/panthor_group.c b/tests/panthor/panthor_group.c
index 8befd56fe267..13636e60c0e7 100644
--- a/tests/panthor/panthor_group.c
+++ b/tests/panthor/panthor_group.c
@@ -40,7 +40,7 @@ issue_store_multiple(uint8_t *cs, uint64_t kernel_va, uint32_t constant)
 	return sizeof(instrs);
 }
 
-igt_main() {
+int igt_main() {
 	int fd;
 
 	igt_fixture() {
diff --git a/tests/panthor/panthor_query.c b/tests/panthor/panthor_query.c
index 915ef004562e..fa4f8ef264d8 100644
--- a/tests/panthor/panthor_query.c
+++ b/tests/panthor/panthor_query.c
@@ -7,7 +7,7 @@
 #include "panthor_drm.h"
 #include <stdint.h>
 
-igt_main() {
+int igt_main() {
 	int fd;
 
 	igt_fixture() {
diff --git a/tests/panthor/panthor_vm.c b/tests/panthor/panthor_vm.c
index 21b9de9be3bf..f91bcaaa0d3a 100644
--- a/tests/panthor/panthor_vm.c
+++ b/tests/panthor/panthor_vm.c
@@ -6,7 +6,7 @@
 #include "igt_panthor.h"
 #include "panthor_drm.h"
 
-igt_main() {
+int igt_main() {
 	int fd;
 
 	igt_fixture() {
diff --git a/tests/prime_nv_api.c b/tests/prime_nv_api.c
index a411090a81e1..08ae5a4bd5d9 100644
--- a/tests/prime_nv_api.c
+++ b/tests/prime_nv_api.c
@@ -346,7 +346,7 @@ static void test_nv_self_import_to_different_fd(void)
 	nouveau_bo_ref(NULL, &nvbo2);
 }
 
-igt_main()
+int igt_main()
 {
 	igt_fixture() {
 		find_and_open_devices();
diff --git a/tests/prime_nv_pcopy.c b/tests/prime_nv_pcopy.c
index db3f54ab5aed..72f192d648e2 100644
--- a/tests/prime_nv_pcopy.c
+++ b/tests/prime_nv_pcopy.c
@@ -860,7 +860,7 @@ static void test_semaphore(void)
 	gem_close(intel_fd, intel_handle);
 }
 
-igt_main()
+int igt_main()
 {
 	igt_fixture() {
 		find_and_open_devices();
diff --git a/tests/prime_nv_test.c b/tests/prime_nv_test.c
index 3135191d9319..0766d552cfc3 100644
--- a/tests/prime_nv_test.c
+++ b/tests/prime_nv_test.c
@@ -352,7 +352,7 @@ static void test_i915_blt_fill_nv_read(void)
 
 /* test 9 nouveau copy engine?? */
 
-igt_main()
+int igt_main()
 {
 	igt_fixture() {
 		igt_assert(find_and_open_devices() == 0);
diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index 2abb1d185440..79963648f132 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -1146,7 +1146,7 @@ static void test_each_engine(const char *name, int vgem, int i915,
 		intel_ctx_destroy(i915, ctx);
 }
 
-igt_main()
+int igt_main()
 {
 	int i915 = -1;
 	int vgem = -1;
diff --git a/tests/sriov_basic.c b/tests/sriov_basic.c
index 29e1fd84dd75..69240ab54100 100644
--- a/tests/sriov_basic.c
+++ b/tests/sriov_basic.c
@@ -118,7 +118,7 @@ static void bind_unbind_vf(int pf_fd, unsigned int vf_num)
 	igt_sriov_disable_vfs(pf_fd);
 }
 
-igt_main()
+int igt_main()
 {
 	int pf_fd;
 	bool autoprobe;
diff --git a/tests/sw_sync.c b/tests/sw_sync.c
index f57ffcc10e58..8012652d6d11 100644
--- a/tests/sw_sync.c
+++ b/tests/sw_sync.c
@@ -878,7 +878,7 @@ static void test_sync_random_merge(void)
 		close(timeline_arr[i]);
 }
 
-igt_main()
+int igt_main()
 {
 	igt_fixture() {
 		igt_require_sw_sync();
diff --git a/tests/syncobj_basic.c b/tests/syncobj_basic.c
index cd0b3eab0582..e8b47cb7b039 100644
--- a/tests/syncobj_basic.c
+++ b/tests/syncobj_basic.c
@@ -219,7 +219,7 @@ static bool has_syncobj(int fd)
 	return value ? true : false;
 }
 
-igt_main()
+int igt_main()
 {
 	int fd = -1;
 
diff --git a/tests/syncobj_eventfd.c b/tests/syncobj_eventfd.c
index d88ea3e701c0..a213046000cf 100644
--- a/tests/syncobj_eventfd.c
+++ b/tests/syncobj_eventfd.c
@@ -277,7 +277,7 @@ test_wait_signaled(int fd, bool use_timeline)
 	syncobj_destroy(fd, syncobj);
 }
 
-igt_main()
+int igt_main()
 {
 	int fd = -1, i;
 
diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
index b83f4c6bcb4a..ccb9e8e6f0a0 100644
--- a/tests/syncobj_timeline.c
+++ b/tests/syncobj_timeline.c
@@ -1695,7 +1695,7 @@ has_syncobj_timeline_wait(int fd)
 	return ret == -1 && errno == ENOENT;
 }
 
-igt_main()
+int igt_main()
 {
 	int fd = -1;
 
diff --git a/tests/syncobj_wait.c b/tests/syncobj_wait.c
index 5ee90c5e9a8c..c65c085c60fd 100644
--- a/tests/syncobj_wait.c
+++ b/tests/syncobj_wait.c
@@ -905,7 +905,7 @@ has_syncobj_wait(int fd)
 	return ret == -1 && errno == ENOENT;
 }
 
-igt_main()
+int igt_main()
 {
 	int fd = -1;
 
diff --git a/tests/template.c b/tests/template.c
index 29733de5785e..fe7454c279cb 100644
--- a/tests/template.c
+++ b/tests/template.c
@@ -58,7 +58,7 @@ static void test_B(int fd)
 
 int drm_fd;
 
-igt_main()
+int igt_main()
 {
 	igt_fixture() {
 		drm_fd = drm_open_driver(DRIVER_ANY);
diff --git a/tests/tools_test.c b/tests/tools_test.c
index cc028eca96a7..857f71d14bd2 100644
--- a/tests/tools_test.c
+++ b/tests/tools_test.c
@@ -94,7 +94,7 @@ static bool chdir_to_tools_dir(void)
 	return chdir(TOOLS) == 0 || chdir("../../bin") == 0;
 }
 
-igt_main()
+int igt_main()
 {
 	igt_fixture() {
 		char *path;
diff --git a/tests/v3d/v3d_create_bo.c b/tests/v3d/v3d_create_bo.c
index c7a0593de9c7..930c14f68b8c 100644
--- a/tests/v3d/v3d_create_bo.c
+++ b/tests/v3d/v3d_create_bo.c
@@ -8,7 +8,7 @@
 
 IGT_TEST_DESCRIPTION("Tests for the V3D's Create BO IOCTL");
 
-igt_main()
+int igt_main()
 {
 	int fd;
 
diff --git a/tests/v3d/v3d_get_bo_offset.c b/tests/v3d/v3d_get_bo_offset.c
index 8ff9773c0656..64d9a58b3696 100644
--- a/tests/v3d/v3d_get_bo_offset.c
+++ b/tests/v3d/v3d_get_bo_offset.c
@@ -26,7 +26,7 @@
 
 IGT_TEST_DESCRIPTION("Tests for the V3D's get BO offset IOCTL");
 
-igt_main()
+int igt_main()
 {
 	int fd;
 
diff --git a/tests/v3d/v3d_get_param.c b/tests/v3d/v3d_get_param.c
index 7185d630e117..833ff5bf0a9b 100644
--- a/tests/v3d/v3d_get_param.c
+++ b/tests/v3d/v3d_get_param.c
@@ -26,7 +26,7 @@
 
 IGT_TEST_DESCRIPTION("Tests for the V3D's get params IOCTL");
 
-igt_main()
+int igt_main()
 {
 	int fd;
 
diff --git a/tests/v3d/v3d_job_submission.c b/tests/v3d/v3d_job_submission.c
index fcf88daf650b..720450d03e51 100644
--- a/tests/v3d/v3d_job_submission.c
+++ b/tests/v3d/v3d_job_submission.c
@@ -58,7 +58,7 @@ static void *create_csd_jobs(void *args)
 	return NULL;
 }
 
-igt_main()
+int igt_main()
 {
 	igt_fixture() {
 		fd = drm_open_driver(DRIVER_V3D);
diff --git a/tests/v3d/v3d_mmap.c b/tests/v3d/v3d_mmap.c
index 7c433e8a120d..847567417db5 100644
--- a/tests/v3d/v3d_mmap.c
+++ b/tests/v3d/v3d_mmap.c
@@ -26,7 +26,7 @@
 
 IGT_TEST_DESCRIPTION("Tests for the V3D's mmap IOCTL");
 
-igt_main()
+int igt_main()
 {
 	int fd;
 
diff --git a/tests/v3d/v3d_perfmon.c b/tests/v3d/v3d_perfmon.c
index 865b2aa17680..ac6f094c3b29 100644
--- a/tests/v3d/v3d_perfmon.c
+++ b/tests/v3d/v3d_perfmon.c
@@ -8,7 +8,7 @@
 
 IGT_TEST_DESCRIPTION("Tests for the V3D's performance monitors");
 
-igt_main()
+int igt_main()
 {
 	int fd;
 
diff --git a/tests/v3d/v3d_submit_cl.c b/tests/v3d/v3d_submit_cl.c
index d6b12cd67301..570838e23bae 100644
--- a/tests/v3d/v3d_submit_cl.c
+++ b/tests/v3d/v3d_submit_cl.c
@@ -27,7 +27,7 @@ short_timeout(void)
 	return gettime_ns() + SHORT_TIME_NSEC;
 }
 
-igt_main()
+int igt_main()
 {
 	int fd;
 
diff --git a/tests/v3d/v3d_submit_csd.c b/tests/v3d/v3d_submit_csd.c
index 636e1168733b..e7841f7c8903 100644
--- a/tests/v3d/v3d_submit_csd.c
+++ b/tests/v3d/v3d_submit_csd.c
@@ -29,7 +29,7 @@ short_timeout(void)
 	return gettime_ns() + SHORT_TIME_NSEC;
 }
 
-igt_main()
+int igt_main()
 {
 	int fd;
 
diff --git a/tests/v3d/v3d_wait_bo.c b/tests/v3d/v3d_wait_bo.c
index f30df3c4a902..8d6a38b1b76e 100644
--- a/tests/v3d/v3d_wait_bo.c
+++ b/tests/v3d/v3d_wait_bo.c
@@ -24,7 +24,7 @@ static void test_used_bo(int fd, struct v3d_bo *bo, uint64_t timeout)
 	igt_assert(ret == 0 || (ret == -1 && errno == ETIME));
 }
 
-igt_main()
+int igt_main()
 {
 	int fd;
 	struct v3d_bo *bo;
diff --git a/tests/vc4/vc4_create_bo.c b/tests/vc4/vc4_create_bo.c
index 75fdcdf60ee3..f6ca3dd8dce9 100644
--- a/tests/vc4/vc4_create_bo.c
+++ b/tests/vc4/vc4_create_bo.c
@@ -24,7 +24,7 @@
 #include "igt.h"
 #include "igt_vc4.h"
 
-igt_main()
+int igt_main()
 {
 	int fd;
 
diff --git a/tests/vc4/vc4_dmabuf_poll.c b/tests/vc4/vc4_dmabuf_poll.c
index a2ee5371c36a..dedf690877e8 100644
--- a/tests/vc4/vc4_dmabuf_poll.c
+++ b/tests/vc4/vc4_dmabuf_poll.c
@@ -55,7 +55,7 @@ poll_write_bo_test(int fd, int poll_flag)
 	gem_close(fd, handle);
 }
 
-igt_main()
+int igt_main()
 {
 	int fd;
 
diff --git a/tests/vc4/vc4_label_bo.c b/tests/vc4/vc4_label_bo.c
index d00ab0155ef1..bae12cd7ca36 100644
--- a/tests/vc4/vc4_label_bo.c
+++ b/tests/vc4/vc4_label_bo.c
@@ -39,7 +39,7 @@ set_label(int fd, int handle, const char *name, int err)
 		do_ioctl(fd, DRM_IOCTL_VC4_LABEL_BO, &label);
 }
 
-igt_main()
+int igt_main()
 {
 	int fd;
 
diff --git a/tests/vc4/vc4_lookup_fail.c b/tests/vc4/vc4_lookup_fail.c
index 592f1f6c04d2..e37d34d25504 100644
--- a/tests/vc4/vc4_lookup_fail.c
+++ b/tests/vc4/vc4_lookup_fail.c
@@ -25,7 +25,7 @@
 #include "igt_vc4.h"
 #include "vc4_packet.h"
 
-igt_main()
+int igt_main()
 {
 	int fd;
 
diff --git a/tests/vc4/vc4_mmap.c b/tests/vc4/vc4_mmap.c
index 07fa6bee362f..1d1d34e6fb5d 100644
--- a/tests/vc4/vc4_mmap.c
+++ b/tests/vc4/vc4_mmap.c
@@ -8,7 +8,7 @@
 
 IGT_TEST_DESCRIPTION("Tests for the VC4's mmap IOCTL");
 
-igt_main()
+int igt_main()
 {
 	int fd;
 
diff --git a/tests/vc4/vc4_perfmon.c b/tests/vc4/vc4_perfmon.c
index 829e32d3761c..df0d163fcb7e 100644
--- a/tests/vc4/vc4_perfmon.c
+++ b/tests/vc4/vc4_perfmon.c
@@ -8,7 +8,7 @@
 
 IGT_TEST_DESCRIPTION("Tests for the VC4's performance monitors");
 
-igt_main()
+int igt_main()
 {
 	int fd;
 
diff --git a/tests/vc4/vc4_purgeable_bo.c b/tests/vc4/vc4_purgeable_bo.c
index b657ddfdf706..3c3dc1e6d5e7 100644
--- a/tests/vc4/vc4_purgeable_bo.c
+++ b/tests/vc4/vc4_purgeable_bo.c
@@ -94,7 +94,7 @@ static void igt_vc4_purgeable_subtest_prepare(int fd, struct igt_list_head *list
 	igt_assert(!igt_list_empty(list));
 }
 
-igt_main()
+int igt_main()
 {
 	struct igt_vc4_bo *bo;
 	struct igt_list_head list;
diff --git a/tests/vc4/vc4_tiling.c b/tests/vc4/vc4_tiling.c
index 227f42f16db0..648d683fa7b7 100644
--- a/tests/vc4/vc4_tiling.c
+++ b/tests/vc4/vc4_tiling.c
@@ -24,7 +24,7 @@
 #include "igt.h"
 #include "igt_vc4.h"
 
-igt_main()
+int igt_main()
 {
 	int fd;
 
diff --git a/tests/vc4/vc4_wait_bo.c b/tests/vc4/vc4_wait_bo.c
index 25441edc8672..811d1034ce21 100644
--- a/tests/vc4/vc4_wait_bo.c
+++ b/tests/vc4/vc4_wait_bo.c
@@ -57,7 +57,7 @@ test_used_bo(int fd, uint64_t timeout)
 	gem_close(fd, handle);
 }
 
-igt_main()
+int igt_main()
 {
 	int fd;
 	int bo_handle;
diff --git a/tests/vc4/vc4_wait_seqno.c b/tests/vc4/vc4_wait_seqno.c
index e192378745b6..8a46d0bfd19b 100644
--- a/tests/vc4/vc4_wait_seqno.c
+++ b/tests/vc4/vc4_wait_seqno.c
@@ -24,7 +24,7 @@
 #include "igt.h"
 #include "igt_vc4.h"
 
-igt_main()
+int igt_main()
 {
 	int fd;
 
diff --git a/tests/vgem_basic.c b/tests/vgem_basic.c
index 0f94a1649a02..a4271511dd5c 100644
--- a/tests/vgem_basic.c
+++ b/tests/vgem_basic.c
@@ -489,7 +489,7 @@ static bool has_prime_export(int fd)
 	return value & DRM_PRIME_CAP_EXPORT;
 }
 
-igt_main()
+int igt_main()
 {
 	int fd = -1;
 
diff --git a/tests/vgem_slow.c b/tests/vgem_slow.c
index 0da74b1fb09c..d085422f726d 100644
--- a/tests/vgem_slow.c
+++ b/tests/vgem_slow.c
@@ -85,7 +85,7 @@ static void test_nohang(int fd)
 	gem_close(fd, bo.handle);
 }
 
-igt_main()
+int igt_main()
 {
 	int fd = -1;
 
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 6a585c96bce0..a1c3f77fa618 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1895,7 +1895,7 @@ static void test_enabled_connector_hot_plug(void)
 	igt_vkms_device_destroy(dev);
 }
 
-igt_main()
+int igt_main()
 {
 	struct {
 		const char *name;
diff --git a/tests/vmwgfx/vmw_execution_buffer.c b/tests/vmwgfx/vmw_execution_buffer.c
index 4fcefe622cd6..5a50a8e475f1 100644
--- a/tests/vmwgfx/vmw_execution_buffer.c
+++ b/tests/vmwgfx/vmw_execution_buffer.c
@@ -248,7 +248,7 @@ static void execbuf_stress_test(int fd)
 	pthread_join(threads[1], &status);
 }
 
-igt_main_args("st:", long_options, NULL, parse_options, NULL)
+int igt_main_args("st:", long_options, NULL, parse_options, NULL)
 {
 	int fd;
 
diff --git a/tests/vmwgfx/vmw_mob_stress.c b/tests/vmwgfx/vmw_mob_stress.c
index 9f5fbd7c09ce..8198939d9865 100644
--- a/tests/vmwgfx/vmw_mob_stress.c
+++ b/tests/vmwgfx/vmw_mob_stress.c
@@ -45,7 +45,7 @@ static void test_triangle_render(struct vmw_svga_device *device, int32 cid)
 	vmw_destroy_default_objects(device, &objects);
 }
 
-igt_main()
+int igt_main()
 {
 	struct vmw_svga_device device;
 	int32 cid;
diff --git a/tests/vmwgfx/vmw_prime.c b/tests/vmwgfx/vmw_prime.c
index 7ff5ec843539..c0c1c3d8343d 100644
--- a/tests/vmwgfx/vmw_prime.c
+++ b/tests/vmwgfx/vmw_prime.c
@@ -503,7 +503,7 @@ static void test_vgem(struct gpu_process_t *gpu, int vgem_fd)
 	gem_close(gpu->mdevice.drm_fd, vmw_buffer_handle);
 }
 
-igt_main()
+int igt_main()
 {
 	struct gpu_process_t gpu = { 0 };
 	int second_fd_vgem = -1;
diff --git a/tests/vmwgfx/vmw_ref_count.c b/tests/vmwgfx/vmw_ref_count.c
index 1f3606c30cdc..af3872249051 100644
--- a/tests/vmwgfx/vmw_ref_count.c
+++ b/tests/vmwgfx/vmw_ref_count.c
@@ -86,7 +86,7 @@ static bool ref_surface_and_check_contents(int32 fd, uint32 surface_handle)
 	return data_valid;
 }
 
-igt_main()
+int igt_main()
 {
 	int32 fd1, fd2;
 	const uint32 size = sizeof(data);
diff --git a/tests/vmwgfx/vmw_surface_copy.c b/tests/vmwgfx/vmw_surface_copy.c
index 92b0740319e4..9a3b6e22ae82 100644
--- a/tests/vmwgfx/vmw_surface_copy.c
+++ b/tests/vmwgfx/vmw_surface_copy.c
@@ -306,7 +306,7 @@ static void test_invalid_copies_3d(int fd, int32 cid)
 	vmw_ioctl_surface_unref(fd, s2);
 }
 
-igt_main()
+int igt_main()
 {
 	int fd;
 	int32 cid;
diff --git a/tests/vmwgfx/vmw_tri.c b/tests/vmwgfx/vmw_tri.c
index 3091d925526d..19a21945837d 100644
--- a/tests/vmwgfx/vmw_tri.c
+++ b/tests/vmwgfx/vmw_tri.c
@@ -180,7 +180,7 @@ static void draw_triangle_on_coherent_rt(struct vmw_svga_device *device,
 	vmw_destroy_default_objects(device, &objects);
 }
 
-igt_main()
+int igt_main()
 {
 	struct vmw_svga_device device;
 	int32 cid;
-- 
2.49.1

