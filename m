Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7330BCFA447
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 19:14:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B32D10E7D3;
	Thu, 20 Nov 2025 19:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XPQ3G4n9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA00410E7D3
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 19:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763666077; x=1795202077;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=v6xjkTqkvt3yUNEBqP/8bQ1EF352FXKpa5Wy3AazxSY=;
 b=XPQ3G4n9FC2Vfc8WSf4kUDXmbLQcVZ4JLQhNvN6QFrB97jtNXmgGOBet
 n8KOivSBq0wcSwEkcEZckWVwRHZnlDCE8uh0HCSdyVCCMHHGBQ96TIZTB
 Cfmz6HK49aRXD2wFlP6CkXDTwqQTGKQEVdZNUeeDPcrh9Anp2cSgIuY85
 NVHpB704GfkrjUHIFqtXPM7lw9cvjxc+9monZEjhH4rsHqnGR6BtwdXy/
 GnVqu5nxdId4OL5LZPKnkk0lKMeha2pYZvlojPceewK2TGaJYoaODSjMf
 LI5+cu9kV6ny7gcZpMtkwHPDD2ZYYzSLLZMwZVtYsPCB/6IkCaXcf392f A==;
X-CSE-ConnectionGUID: 9EXX/gktQluyi2mU8Haq0g==
X-CSE-MsgGUID: /k2DkZ1ZQA2PslBeQ17NQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65448720"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="65448720"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 11:14:36 -0800
X-CSE-ConnectionGUID: 62BMD+sTS863MuW6MngZSw==
X-CSE-MsgGUID: AmNnbjGcQ9eb5VMn0FcckA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="195753506"
Received: from inaky-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.245.244.92])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 11:14:34 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 3/7] igt: Make igt_main look more like a function
Date: Thu, 20 Nov 2025 21:14:11 +0200
Message-ID: <20251120191415.4236-4-ville.syrjala@linux.intel.com>
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

Turn igt_main into igt_main(). This is a step towads
allowing coccinelle to parse it.

Conversion done via:
$ find -type f -name \*.[ch] -exec sed -i 's/\([^_]\?\)igt_main\([^_(]\|$\)/\1igt_main()\2/g' {} +

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 benchmarks/gem_userptr_benchmark.c               |  2 +-
 lib/igt_core.c                                   |  6 +++---
 lib/igt_core.h                                   | 12 ++++++------
 lib/igt_kmod.c                                   |  2 +-
 lib/tests/bad_subtest_type.c                     |  2 +-
 lib/tests/i915_perf_data_alignment.c             |  2 +-
 lib/tests/igt_assert.c                           |  2 +-
 lib/tests/igt_audio.c                            |  2 +-
 lib/tests/igt_can_fail.c                         |  2 +-
 lib/tests/igt_hook.c                             |  2 +-
 lib/tests/igt_ktap_parser.c                      |  2 +-
 lib/tests/igt_runnercomms_packets.c              |  2 +-
 lib/tests/igt_subtest_group.c                    |  2 +-
 lib/tests/igt_types.c                            |  2 +-
 runner/runner_json_tests.c                       |  2 +-
 runner/runner_kmemleak_test.c                    |  2 +-
 runner/runner_tests.c                            |  2 +-
 runner/testdata/abort-dynamic.c                  |  2 +-
 runner/testdata/abort-fixture.c                  |  2 +-
 runner/testdata/abort.c                          |  2 +-
 runner/testdata/dynamic.c                        |  2 +-
 runner/testdata/skippers.c                       |  2 +-
 runner/testdata/successtest.c                    |  2 +-
 tests/amdgpu/amd_abm.c                           |  2 +-
 tests/amdgpu/amd_assr.c                          |  2 +-
 tests/amdgpu/amd_basic.c                         |  2 +-
 tests/amdgpu/amd_basic_ex.c                      |  2 +-
 tests/amdgpu/amd_basic_multi_gpu.c               |  2 +-
 tests/amdgpu/amd_bo.c                            |  2 +-
 tests/amdgpu/amd_bypass.c                        |  2 +-
 tests/amdgpu/amd_color.c                         |  2 +-
 tests/amdgpu/amd_cp_dma_misc.c                   |  2 +-
 tests/amdgpu/amd_cs_nop.c                        |  2 +-
 tests/amdgpu/amd_deadlock.c                      |  2 +-
 tests/amdgpu/amd_dispatch.c                      |  2 +-
 tests/amdgpu/amd_dp_dsc.c                        |  2 +-
 tests/amdgpu/amd_freesync_video_mode.c           |  2 +-
 tests/amdgpu/amd_fuzzing.c                       |  2 +-
 tests/amdgpu/amd_gang_cs.c                       |  2 +-
 tests/amdgpu/amd_hotplug.c                       |  2 +-
 tests/amdgpu/amd_ilr.c                           |  2 +-
 tests/amdgpu/amd_info.c                          |  2 +-
 tests/amdgpu/amd_jpeg_dec.c                      |  2 +-
 tests/amdgpu/amd_jpeg_queue.c                    |  2 +-
 tests/amdgpu/amd_link_settings.c                 |  2 +-
 tests/amdgpu/amd_mall.c                          |  2 +-
 tests/amdgpu/amd_max_bpc.c                       |  2 +-
 tests/amdgpu/amd_mem_leak.c                      |  2 +-
 tests/amdgpu/amd_mode_switch.c                   |  2 +-
 tests/amdgpu/amd_module_load.c                   |  2 +-
 tests/amdgpu/amd_multidisplay_modeset.c          |  2 +-
 tests/amdgpu/amd_odm.c                           |  2 +-
 tests/amdgpu/amd_pci_unplug.c                    |  2 +-
 tests/amdgpu/amd_plane.c                         |  2 +-
 tests/amdgpu/amd_prime.c                         |  2 +-
 tests/amdgpu/amd_pstate.c                        |  2 +-
 tests/amdgpu/amd_queue_reset.c                   |  2 +-
 tests/amdgpu/amd_ras.c                           |  2 +-
 tests/amdgpu/amd_security.c                      |  2 +-
 tests/amdgpu/amd_subvp.c                         |  2 +-
 tests/amdgpu/amd_syncobj.c                       |  2 +-
 tests/amdgpu/amd_uvd_dec.c                       |  2 +-
 tests/amdgpu/amd_uvd_enc.c                       |  2 +-
 tests/amdgpu/amd_vce_enc.c                       |  2 +-
 tests/amdgpu/amd_vcn.c                           |  2 +-
 tests/amdgpu/amd_vcn_queue.c                     |  2 +-
 tests/amdgpu/amd_vm.c                            |  2 +-
 tests/amdgpu/amd_vpe.c                           |  2 +-
 tests/amdgpu/amd_vrr_range.c                     |  2 +-
 tests/chamelium/kms_chamelium_audio.c            |  2 +-
 tests/chamelium/kms_chamelium_color.c            |  2 +-
 tests/chamelium/kms_chamelium_frames.c           |  2 +-
 tests/chamelium/kms_chamelium_hpd.c              |  2 +-
 tests/chamelium/kms_chamelium_sharpness_filter.c |  2 +-
 tests/core_auth.c                                |  2 +-
 tests/core_debugfs.c                             |  2 +-
 tests/core_getclient.c                           |  2 +-
 tests/core_getstats.c                            |  2 +-
 tests/core_getversion.c                          |  2 +-
 tests/core_hotunplug.c                           |  2 +-
 tests/core_setmaster.c                           |  2 +-
 tests/core_sysfs.c                               |  2 +-
 tests/device_reset.c                             |  2 +-
 tests/dmabuf.c                                   |  2 +-
 tests/dmabuf_sync_file.c                         |  2 +-
 tests/drm_buddy.c                                |  2 +-
 tests/drm_mm.c                                   |  2 +-
 tests/drm_read.c                                 |  2 +-
 tests/drm_virtgpu.c                              |  2 +-
 tests/dumb_buffer.c                              |  2 +-
 tests/fbdev.c                                    |  2 +-
 tests/intel/api_intel_allocator.c                |  2 +-
 tests/intel/gem_bad_reloc.c                      |  2 +-
 tests/intel/gem_barrier_race.c                   |  2 +-
 tests/intel/gem_basic.c                          |  2 +-
 tests/intel/gem_blits.c                          |  2 +-
 tests/intel/gem_busy.c                           |  2 +-
 tests/intel/gem_caching.c                        |  2 +-
 tests/intel/gem_close.c                          |  2 +-
 tests/intel/gem_close_race.c                     |  2 +-
 tests/intel/gem_compute.c                        |  2 +-
 tests/intel/gem_concurrent_all.c                 |  2 +-
 tests/intel/gem_create.c                         |  2 +-
 tests/intel/gem_cs_tlb.c                         |  2 +-
 tests/intel/gem_ctx_bad_destroy.c                |  2 +-
 tests/intel/gem_ctx_create.c                     |  2 +-
 tests/intel/gem_ctx_engines.c                    |  2 +-
 tests/intel/gem_ctx_exec.c                       |  2 +-
 tests/intel/gem_ctx_freq.c                       |  2 +-
 tests/intel/gem_ctx_isolation.c                  |  2 +-
 tests/intel/gem_ctx_param.c                      |  2 +-
 tests/intel/gem_ctx_persistence.c                |  2 +-
 tests/intel/gem_ctx_shared.c                     |  2 +-
 tests/intel/gem_ctx_sseu.c                       |  2 +-
 tests/intel/gem_ctx_switch.c                     |  2 +-
 tests/intel/gem_eio.c                            |  2 +-
 tests/intel/gem_evict_alignment.c                |  2 +-
 tests/intel/gem_evict_everything.c               |  2 +-
 tests/intel/gem_exec_alignment.c                 |  2 +-
 tests/intel/gem_exec_async.c                     |  2 +-
 tests/intel/gem_exec_await.c                     |  2 +-
 tests/intel/gem_exec_balancer.c                  |  2 +-
 tests/intel/gem_exec_basic.c                     |  2 +-
 tests/intel/gem_exec_big.c                       |  2 +-
 tests/intel/gem_exec_capture.c                   |  2 +-
 tests/intel/gem_exec_create.c                    |  2 +-
 tests/intel/gem_exec_endless.c                   |  2 +-
 tests/intel/gem_exec_fair.c                      |  2 +-
 tests/intel/gem_exec_fence.c                     |  2 +-
 tests/intel/gem_exec_flush.c                     |  2 +-
 tests/intel/gem_exec_gttfill.c                   |  2 +-
 tests/intel/gem_exec_latency.c                   |  2 +-
 tests/intel/gem_exec_nop.c                       |  2 +-
 tests/intel/gem_exec_parallel.c                  |  2 +-
 tests/intel/gem_exec_params.c                    |  2 +-
 tests/intel/gem_exec_reloc.c                     |  2 +-
 tests/intel/gem_exec_schedule.c                  |  2 +-
 tests/intel/gem_exec_store.c                     |  2 +-
 tests/intel/gem_exec_suspend.c                   |  2 +-
 tests/intel/gem_exec_whisper.c                   |  2 +-
 tests/intel/gem_fence_thrash.c                   |  2 +-
 tests/intel/gem_fence_upload.c                   |  2 +-
 tests/intel/gem_fenced_exec_thrash.c             |  2 +-
 tests/intel/gem_flink_basic.c                    |  2 +-
 tests/intel/gem_flink_race.c                     |  2 +-
 tests/intel/gem_huc_copy.c                       |  2 +-
 tests/intel/gem_linear_blits.c                   |  2 +-
 tests/intel/gem_lmem_evict.c                     |  2 +-
 tests/intel/gem_madvise.c                        |  2 +-
 tests/intel/gem_media_fill.c                     |  2 +-
 tests/intel/gem_mmap.c                           |  2 +-
 tests/intel/gem_mmap_gtt.c                       |  2 +-
 tests/intel/gem_mmap_offset.c                    |  2 +-
 tests/intel/gem_mmap_wc.c                        |  2 +-
 tests/intel/gem_partial_pwrite_pread.c           |  2 +-
 tests/intel/gem_pipe_control_store_loop.c        |  2 +-
 tests/intel/gem_ppgtt.c                          |  2 +-
 tests/intel/gem_pread_after_blit.c               |  2 +-
 tests/intel/gem_pxp.c                            |  2 +-
 tests/intel/gem_read_read_speed.c                |  2 +-
 tests/intel/gem_readwrite.c                      |  2 +-
 tests/intel/gem_reg_read.c                       |  2 +-
 tests/intel/gem_render_copy_redux.c              |  2 +-
 tests/intel/gem_render_linear_blits.c            |  2 +-
 tests/intel/gem_render_tiled_blits.c             |  2 +-
 tests/intel/gem_request_retire.c                 |  2 +-
 tests/intel/gem_reset_stats.c                    |  2 +-
 tests/intel/gem_ringfill.c                       |  2 +-
 tests/intel/gem_set_tiling_vs_blt.c              |  2 +-
 tests/intel/gem_shrink.c                         |  2 +-
 tests/intel/gem_softpin.c                        |  2 +-
 tests/intel/gem_spin_batch.c                     |  2 +-
 tests/intel/gem_streaming_writes.c               |  2 +-
 tests/intel/gem_sync.c                           |  2 +-
 tests/intel/gem_tiled_blits.c                    |  2 +-
 tests/intel/gem_tiled_fence_blits.c              |  2 +-
 tests/intel/gem_tiled_partial_pwrite_pread.c     |  2 +-
 tests/intel/gem_tiled_swapping.c                 |  2 +-
 tests/intel/gem_vm_create.c                      |  2 +-
 tests/intel/gem_wait.c                           |  2 +-
 tests/intel/gem_watchdog.c                       |  2 +-
 tests/intel/gem_workarounds.c                    |  2 +-
 tests/intel/gen7_exec_parse.c                    |  2 +-
 tests/intel/gen9_exec_parse.c                    |  2 +-
 tests/intel/i915_drm_fdinfo.c                    |  2 +-
 tests/intel/i915_fb_tiling.c                     |  2 +-
 tests/intel/i915_getparams_basic.c               |  2 +-
 tests/intel/i915_hangman.c                       |  2 +-
 tests/intel/i915_module_load.c                   |  2 +-
 tests/intel/i915_pm_freq_api.c                   |  2 +-
 tests/intel/i915_pm_freq_mult.c                  |  2 +-
 tests/intel/i915_pm_rc6_residency.c              |  2 +-
 tests/intel/i915_pm_rps.c                        |  2 +-
 tests/intel/i915_pm_sseu.c                       |  2 +-
 tests/intel/i915_power.c                         |  2 +-
 tests/intel/i915_query.c                         |  2 +-
 tests/intel/i915_selftest.c                      |  2 +-
 tests/intel/i915_suspend.c                       |  2 +-
 tests/intel/intel_hwmon.c                        |  2 +-
 tests/intel/kms_big_fb.c                         |  2 +-
 tests/intel/kms_cdclk.c                          |  2 +-
 tests/intel/kms_dirtyfb.c                        |  2 +-
 tests/intel/kms_dp_link_training.c               |  2 +-
 tests/intel/kms_dp_linktrain_fallback.c          |  2 +-
 tests/intel/kms_draw_crc.c                       |  2 +-
 tests/intel/kms_fb_coherency.c                   |  2 +-
 tests/intel/kms_fbc_dirty_rect.c                 |  2 +-
 tests/intel/kms_fbcon_fbt.c                      |  2 +-
 tests/intel/kms_flip_scaled_crc.c                |  2 +-
 tests/intel/kms_flip_tiling.c                    |  2 +-
 tests/intel/kms_joiner.c                         |  2 +-
 tests/intel/kms_legacy_colorkey.c                |  2 +-
 tests/intel/kms_pipe_b_c_ivb.c                   |  2 +-
 tests/intel/kms_pipe_stress.c                    |  2 +-
 tests/intel/kms_pm_backlight.c                   |  2 +-
 tests/intel/kms_pm_dc.c                          |  2 +-
 tests/intel/kms_pm_lpsp.c                        |  2 +-
 tests/intel/kms_psr.c                            |  2 +-
 tests/intel/kms_psr2_sf.c                        |  2 +-
 tests/intel/kms_psr2_su.c                        |  2 +-
 tests/intel/kms_psr_stress_test.c                |  2 +-
 tests/intel/perf.c                               |  2 +-
 tests/intel/perf_pmu.c                           |  2 +-
 tests/intel/prime_busy.c                         |  2 +-
 tests/intel/prime_mmap.c                         |  2 +-
 tests/intel/prime_mmap_coherency.c               |  2 +-
 tests/intel/prime_mmap_kms.c                     |  2 +-
 tests/intel/prime_self_import.c                  |  2 +-
 tests/intel/sysfs_defaults.c                     |  2 +-
 tests/intel/sysfs_heartbeat_interval.c           |  2 +-
 tests/intel/sysfs_preempt_timeout.c              |  2 +-
 tests/intel/sysfs_timeslice_duration.c           |  2 +-
 tests/intel/xe_compute.c                         |  2 +-
 tests/intel/xe_compute_preempt.c                 |  2 +-
 tests/intel/xe_configfs.c                        |  2 +-
 tests/intel/xe_dma_buf_sync.c                    |  2 +-
 tests/intel/xe_drm_fdinfo.c                      |  2 +-
 tests/intel/xe_eudebug.c                         |  2 +-
 tests/intel/xe_eudebug_online.c                  |  2 +-
 tests/intel/xe_eudebug_sriov.c                   |  2 +-
 tests/intel/xe_evict.c                           |  2 +-
 tests/intel/xe_exec_atomic.c                     |  2 +-
 tests/intel/xe_exec_balancer.c                   |  2 +-
 tests/intel/xe_exec_basic.c                      |  2 +-
 tests/intel/xe_exec_capture.c                    |  2 +-
 tests/intel/xe_exec_compute_mode.c               |  2 +-
 tests/intel/xe_exec_fault_mode.c                 |  2 +-
 tests/intel/xe_exec_mix_modes.c                  |  2 +-
 tests/intel/xe_exec_queue_property.c             |  2 +-
 tests/intel/xe_exec_reset.c                      |  2 +-
 tests/intel/xe_exec_sip.c                        |  2 +-
 tests/intel/xe_exec_sip_eudebug.c                |  2 +-
 tests/intel/xe_exec_store.c                      |  2 +-
 tests/intel/xe_exec_system_allocator.c           |  2 +-
 tests/intel/xe_exec_threads.c                    |  2 +-
 tests/intel/xe_gt_freq.c                         |  2 +-
 tests/intel/xe_huc_copy.c                        |  2 +-
 tests/intel/xe_live_ktest.c                      |  2 +-
 tests/intel/xe_media_fill.c                      |  2 +-
 tests/intel/xe_mmap.c                            |  2 +-
 tests/intel/xe_module_load.c                     |  2 +-
 tests/intel/xe_noexec_ping_pong.c                |  2 +-
 tests/intel/xe_pm.c                              |  2 +-
 tests/intel/xe_pm_residency.c                    |  2 +-
 tests/intel/xe_pmu.c                             |  2 +-
 tests/intel/xe_prime_self_import.c               |  2 +-
 tests/intel/xe_pxp.c                             |  2 +-
 tests/intel/xe_query.c                           |  2 +-
 tests/intel/xe_spin_batch.c                      |  2 +-
 tests/intel/xe_sriov_flr.c                       |  2 +-
 tests/intel/xe_survivability.c                   |  2 +-
 tests/intel/xe_sysfs_defaults.c                  |  2 +-
 tests/intel/xe_sysfs_preempt_timeout.c           |  2 +-
 tests/intel/xe_sysfs_scheduler.c                 |  2 +-
 tests/intel/xe_sysfs_timeslice_duration.c        |  2 +-
 tests/intel/xe_tlb.c                             |  2 +-
 tests/intel/xe_vm.c                              |  2 +-
 tests/intel/xe_waitfence.c                       |  2 +-
 tests/intel/xe_wedged.c                          |  2 +-
 tests/kms_3d.c                                   |  2 +-
 tests/kms_addfb_basic.c                          |  2 +-
 tests/kms_async_flips.c                          |  2 +-
 tests/kms_atomic_interruptible.c                 |  2 +-
 tests/kms_bw.c                                   |  2 +-
 tests/kms_color.c                                |  2 +-
 tests/kms_content_protection.c                   |  2 +-
 tests/kms_cursor_legacy.c                        |  2 +-
 tests/kms_debugfs.c                              |  2 +-
 tests/kms_display_modes.c                        |  2 +-
 tests/kms_dither.c                               |  2 +-
 tests/kms_feature_discovery.c                    |  2 +-
 tests/kms_flip_event_leak.c                      |  2 +-
 tests/kms_getfb.c                                |  2 +-
 tests/kms_hdmi_inject.c                          |  2 +-
 tests/kms_hdr.c                                  |  2 +-
 tests/kms_invalid_mode.c                         |  2 +-
 tests/kms_lease.c                                |  2 +-
 tests/kms_multipipe_modeset.c                    |  2 +-
 tests/kms_panel_fitting.c                        |  2 +-
 tests/kms_plane_cursor.c                         |  2 +-
 tests/kms_plane_lowres.c                         |  2 +-
 tests/kms_prime.c                                |  2 +-
 tests/kms_prop_blob.c                            |  2 +-
 tests/kms_properties.c                           |  2 +-
 tests/kms_rmfb.c                                 |  2 +-
 tests/kms_scaling_modes.c                        |  2 +-
 tests/kms_selftest.c                             |  2 +-
 tests/kms_sequence.c                             |  2 +-
 tests/kms_tiled_display.c                        |  2 +-
 tests/kms_tv_load_detect.c                       |  2 +-
 tests/kms_universal_plane.c                      |  2 +-
 tests/meta_test.c                                |  2 +-
 tests/msm/msm_mapping.c                          |  2 +-
 tests/msm/msm_recovery.c                         |  2 +-
 tests/msm/msm_shrink.c                           |  2 +-
 tests/msm/msm_submit.c                           |  2 +-
 tests/msm/msm_submitoverhead.c                   |  2 +-
 tests/nouveau_crc.c                              |  2 +-
 tests/panfrost/panfrost_gem_new.c                |  2 +-
 tests/panfrost/panfrost_get_param.c              |  2 +-
 tests/panfrost/panfrost_prime.c                  |  2 +-
 tests/panfrost/panfrost_submit.c                 |  2 +-
 tests/panthor/panthor_gem.c                      |  2 +-
 tests/panthor/panthor_group.c                    |  2 +-
 tests/panthor/panthor_query.c                    |  2 +-
 tests/panthor/panthor_vm.c                       |  2 +-
 tests/prime_nv_api.c                             |  2 +-
 tests/prime_nv_pcopy.c                           |  2 +-
 tests/prime_nv_test.c                            |  2 +-
 tests/prime_vgem.c                               |  2 +-
 tests/sriov_basic.c                              |  2 +-
 tests/sw_sync.c                                  |  2 +-
 tests/syncobj_basic.c                            |  2 +-
 tests/syncobj_eventfd.c                          |  2 +-
 tests/syncobj_timeline.c                         |  2 +-
 tests/syncobj_wait.c                             |  2 +-
 tests/template.c                                 |  2 +-
 tests/tools_test.c                               |  2 +-
 tests/v3d/v3d_create_bo.c                        |  2 +-
 tests/v3d/v3d_get_bo_offset.c                    |  2 +-
 tests/v3d/v3d_get_param.c                        |  2 +-
 tests/v3d/v3d_job_submission.c                   |  2 +-
 tests/v3d/v3d_mmap.c                             |  2 +-
 tests/v3d/v3d_perfmon.c                          |  2 +-
 tests/v3d/v3d_submit_cl.c                        |  2 +-
 tests/v3d/v3d_submit_csd.c                       |  2 +-
 tests/v3d/v3d_wait_bo.c                          |  2 +-
 tests/vc4/vc4_create_bo.c                        |  2 +-
 tests/vc4/vc4_dmabuf_poll.c                      |  2 +-
 tests/vc4/vc4_label_bo.c                         |  2 +-
 tests/vc4/vc4_lookup_fail.c                      |  2 +-
 tests/vc4/vc4_mmap.c                             |  2 +-
 tests/vc4/vc4_perfmon.c                          |  2 +-
 tests/vc4/vc4_purgeable_bo.c                     |  2 +-
 tests/vc4/vc4_tiling.c                           |  2 +-
 tests/vc4/vc4_wait_bo.c                          |  2 +-
 tests/vc4/vc4_wait_seqno.c                       |  2 +-
 tests/vgem_basic.c                               |  2 +-
 tests/vgem_slow.c                                |  2 +-
 tests/vkms/vkms_configfs.c                       |  2 +-
 tests/vmwgfx/vmw_mob_stress.c                    |  2 +-
 tests/vmwgfx/vmw_prime.c                         |  2 +-
 tests/vmwgfx/vmw_ref_count.c                     |  2 +-
 tests/vmwgfx/vmw_surface_copy.c                  |  2 +-
 tests/vmwgfx/vmw_tri.c                           |  2 +-
 365 files changed, 372 insertions(+), 372 deletions(-)

diff --git a/benchmarks/gem_userptr_benchmark.c b/benchmarks/gem_userptr_benchmark.c
index cfd50252438a..91a3ddbd4ec8 100644
--- a/benchmarks/gem_userptr_benchmark.c
+++ b/benchmarks/gem_userptr_benchmark.c
@@ -450,7 +450,7 @@ static void test_userptr(int fd)
 	test_multiple(fd, 100, 1);
 }
 
-igt_main
+igt_main()
 {
 	int fd = -1, ret;
 
diff --git a/lib/igt_core.c b/lib/igt_core.c
index 94236bf2ee87..a8cc5fa27e63 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -1499,7 +1499,7 @@ static bool valid_name_for_subtest(const char *subtest_name)
 bool __igt_run_subtest(const char *subtest_name, const char *file, const int line)
 {
 	internal_assert(!igt_can_fail(),
-			"igt_subtest can be nested only in igt_main"
+			"igt_subtest can be nested only in igt_main()"
 			" or igt_subtest_group()\n");
 
 	if (!valid_name_for_subtest(subtest_name)) {
@@ -2362,7 +2362,7 @@ void __igt_abort(const char *domain, const char *file, const int line,
  *
  * It is an error to normally exit a test calling igt_exit() - without it the
  * result reporting will be wrong. To avoid such issues it is highly recommended
- * to use #igt_main or #igt_simple_main instead of a hand-rolled main() function.
+ * to use #igt_main() or #igt_simple_main instead of a hand-rolled main() function.
  */
 void igt_exit(void)
 {
@@ -3122,7 +3122,7 @@ bool igt_run_in_simulation(void)
  * it is allowed to use this outside of an #igt_fixture() block in a test with
  * subtests. This is because in contrast to most other test requirements,
  * checking for simulation mode doesn't depend upon the present hardware and it
- * so makes a lot of sense to have this check in the outermost #igt_main block.
+ * so makes a lot of sense to have this check in the outermost #igt_main() block.
  */
 void igt_skip_on_simulation(void)
 {
diff --git a/lib/igt_core.h b/lib/igt_core.h
index 422711b5e372..ef70983eaa66 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -193,7 +193,7 @@ int igt_subtest_init_parse_opts(int *argc, char **argv,
  * igt_subtest_init_parse_opts().
  *
  * If there's not a reason to the contrary it's less error prone to just use an
- * #igt_main block instead of stitching the test's main() function together
+ * #igt_main() block instead of stitching the test's main() function together
  * manually.
  */
 #define igt_subtest_init(argc, argv) \
@@ -318,7 +318,7 @@ bool __igt_run_dynamic_subtest(const char *dynamic_subtest_name);
  * allowed. Example:
  *
  * |[<!-- language="C" -->
- * igt_main
+ * igt_main()
  * {
  *     igt_subtest_with_dynamic("engine-tests") {
  *               igt_require(is_awesome(fd)); // requires ok here
@@ -438,12 +438,12 @@ void __igt_subtest_group_restore(int, int);
 
 
 /**
- * igt_main:
+ * igt_main():
  *
  * This is a magic control flow block used instead of a main() function for
  * tests with subtests. Open-coding the main() function is not recommended.
  */
-#define igt_main igt_main_args(NULL, NULL, NULL, NULL, NULL)
+#define igt_main() igt_main_args(NULL, NULL, NULL, NULL, NULL)
 
 const char *igt_test_name(void);
 void igt_simple_init_parse_opts(int *argc, char **argv,
@@ -595,7 +595,7 @@ void igt_describe_f(const char *fmt, ...);
  * #include "igt.h"
  *
  * IGT_TEST_DESCRIPTION("Global description of the whole binary");
- * igt_main
+ * igt_main()
  * {
  * 	igt_describe("Desc of the subgroup with A and B");
  * 	igt_subtest_group() {
@@ -646,7 +646,7 @@ void igt_describe_f(const char *fmt, ...);
  * |[<!-- language="C" -->
  * #include "igt.h"
  *
- * igt_main
+ * igt_main()
  * {
  * 	igt_describe("check xyz with different tilings");
  * 	igt_subtest_group() {
diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index dd223a0f8ca6..6ef119174994 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -1212,7 +1212,7 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
 	/*
 	 * We need to use igt_subtest here, as otherwise it may crash with:
 	 * "skipping is allowed only in fixtures, subtests or igt_simple_main"
-	 * if used on igt_main. This is also needed in order to provide
+	 * if used on igt_main(). This is also needed in order to provide
 	 * proper namespace for dynamic subtests, with is required for CI
 	 * and for documentation.
 	 */
diff --git a/lib/tests/bad_subtest_type.c b/lib/tests/bad_subtest_type.c
index a7580f9dc701..ec522c49bdbc 100644
--- a/lib/tests/bad_subtest_type.c
+++ b/lib/tests/bad_subtest_type.c
@@ -8,7 +8,7 @@
 
 IGT_TEST_DESCRIPTION("Test bad-scoped file descriptor variable");
 
-igt_main
+igt_main()
 {
 	igt_describe("Check if using a scoped variable inside a subtest will abort it");
 	igt_subtest("bad-scoped-variable") {
diff --git a/lib/tests/i915_perf_data_alignment.c b/lib/tests/i915_perf_data_alignment.c
index 8c14e0d0e172..6d2e1de1e4fd 100644
--- a/lib/tests/i915_perf_data_alignment.c
+++ b/lib/tests/i915_perf_data_alignment.c
@@ -30,7 +30,7 @@
 
 #define is_aligned(s) ((sizeof(s) % 8) == 0)
 
-igt_main
+igt_main()
 {
 	igt_subtest("alignment") {
 		internal_assert(is_aligned(struct intel_perf_record_version));
diff --git a/lib/tests/igt_assert.c b/lib/tests/igt_assert.c
index 10c08f9860bb..f866870da6bf 100644
--- a/lib/tests/igt_assert.c
+++ b/lib/tests/igt_assert.c
@@ -125,7 +125,7 @@ static void test_fd(void)
 	igt_assert_fd(INT_MAX);
 }
 
-igt_main
+igt_main()
 {
 	int ret;
 
diff --git a/lib/tests/igt_audio.c b/lib/tests/igt_audio.c
index c559f2e16a07..93dda16c6641 100644
--- a/lib/tests/igt_audio.c
+++ b/lib/tests/igt_audio.c
@@ -174,7 +174,7 @@ static void test_signal_detect_phaseshift(struct audio_signal *signal)
 	igt_assert(!ok);
 }
 
-igt_main
+igt_main()
 {
 	struct audio_signal *signal = NULL;
 	int ret;
diff --git a/lib/tests/igt_can_fail.c b/lib/tests/igt_can_fail.c
index 2f145412ad67..034d60df3bf1 100644
--- a/lib/tests/igt_can_fail.c
+++ b/lib/tests/igt_can_fail.c
@@ -26,7 +26,7 @@
 
 #include "igt_tests_common.h"
 
-igt_main
+igt_main()
 {
 	internal_assert(igt_can_fail() == false);
 
diff --git a/lib/tests/igt_hook.c b/lib/tests/igt_hook.c
index b5d820c94ae0..445d619db2f0 100644
--- a/lib/tests/igt_hook.c
+++ b/lib/tests/igt_hook.c
@@ -149,7 +149,7 @@ static void test_all_env_vars(void)
 	free(line);
 }
 
-igt_main
+igt_main()
 {
 	test_invalid_hook_descriptors();
 
diff --git a/lib/tests/igt_ktap_parser.c b/lib/tests/igt_ktap_parser.c
index 8c2d16080db4..73c2b7e358fd 100644
--- a/lib/tests/igt_ktap_parser.c
+++ b/lib/tests/igt_ktap_parser.c
@@ -230,7 +230,7 @@ static void ktap_top_version(void)
 	igt_ktap_free(&ktap);
 }
 
-igt_main
+igt_main()
 {
 	igt_subtest("list")
 		ktap_list();
diff --git a/lib/tests/igt_runnercomms_packets.c b/lib/tests/igt_runnercomms_packets.c
index 167ad8e6879c..1f752b43305a 100644
--- a/lib/tests/igt_runnercomms_packets.c
+++ b/lib/tests/igt_runnercomms_packets.c
@@ -214,7 +214,7 @@ struct {
 		      { NULL, NULL }
 };
 
-igt_main
+igt_main()
 {
 	igt_subtest("create-and-parse-normal") {
 		for (typeof (*basic_creation) *t = basic_creation; t->create; t++) {
diff --git a/lib/tests/igt_subtest_group.c b/lib/tests/igt_subtest_group.c
index 3568276dee71..691498157524 100644
--- a/lib/tests/igt_subtest_group.c
+++ b/lib/tests/igt_subtest_group.c
@@ -26,7 +26,7 @@
 
 #include "igt_tests_common.h"
 
-igt_main
+igt_main()
 {
 	/*
 	 * local variables have to be volatile here otherwise they end up being
diff --git a/lib/tests/igt_types.c b/lib/tests/igt_types.c
index e75a77157cda..8144157210ef 100644
--- a/lib/tests/igt_types.c
+++ b/lib/tests/igt_types.c
@@ -59,7 +59,7 @@ static void skip_delegate(void)
 	}
 }
 
-igt_main
+igt_main()
 {
 	/* Basic check that scopes will call their destructor */
 	cleanup_called = 0;
diff --git a/runner/runner_json_tests.c b/runner/runner_json_tests.c
index 7253c9069952..5d7ed593cce3 100644
--- a/runner/runner_json_tests.c
+++ b/runner/runner_json_tests.c
@@ -172,7 +172,7 @@ static const char *dirnames[] = {
 	"graceful-notrun",
 };
 
-igt_main
+igt_main()
 {
 	int dirfd = open(testdatadir, O_RDONLY | O_DIRECTORY);
 	size_t i;
diff --git a/runner/runner_kmemleak_test.c b/runner/runner_kmemleak_test.c
index 31b0e3b91b32..76ea97f096e7 100644
--- a/runner/runner_kmemleak_test.c
+++ b/runner/runner_kmemleak_test.c
@@ -213,7 +213,7 @@ const char *kmemleak_file_example =
 
 static const char *runner_kmemleak_unit_testing_resdir = "/tmp";
 
-igt_main
+igt_main()
 {
 	char unit_testing_kmemleak_filepath[256] = "/tmp/runner_kmemleak_test_XXXXXX";
 	int written_bytes;
diff --git a/runner/runner_tests.c b/runner/runner_tests.c
index bdba0bdd2077..c419eb9756cd 100644
--- a/runner/runner_tests.c
+++ b/runner/runner_tests.c
@@ -261,7 +261,7 @@ static void write_packet_with_canary(int fd, struct runnerpacket *packet)
 	free(packet);
 }
 
-igt_main
+igt_main()
 {
 	struct settings *settings = malloc(sizeof(*settings));
 
diff --git a/runner/testdata/abort-dynamic.c b/runner/testdata/abort-dynamic.c
index 66cf13a7d18c..11cace0145f3 100644
--- a/runner/testdata/abort-dynamic.c
+++ b/runner/testdata/abort-dynamic.c
@@ -23,7 +23,7 @@
 
 #include "igt.h"
 
-igt_main
+igt_main()
 {
 	igt_subtest_with_dynamic("a-subtest") {
 		igt_dynamic("dynamic-1")
diff --git a/runner/testdata/abort-fixture.c b/runner/testdata/abort-fixture.c
index f0ff5d678211..93759b29b82f 100644
--- a/runner/testdata/abort-fixture.c
+++ b/runner/testdata/abort-fixture.c
@@ -23,7 +23,7 @@
 
 #include "igt.h"
 
-igt_main
+igt_main()
 {
 	igt_fixture() {
 		igt_abort_on_f(true, "I'm out!\n");
diff --git a/runner/testdata/abort.c b/runner/testdata/abort.c
index 074946a4f556..eb726a0dda4e 100644
--- a/runner/testdata/abort.c
+++ b/runner/testdata/abort.c
@@ -23,7 +23,7 @@
 
 #include "igt.h"
 
-igt_main
+igt_main()
 {
 	igt_subtest("a-subtest")
 		;
diff --git a/runner/testdata/dynamic.c b/runner/testdata/dynamic.c
index 8e5de7d96938..eabb49ef2ae5 100644
--- a/runner/testdata/dynamic.c
+++ b/runner/testdata/dynamic.c
@@ -1,6 +1,6 @@
 #include "igt.h"
 
-igt_main
+igt_main()
 {
 	igt_subtest_with_dynamic("dynamic-subtest") {
 		igt_dynamic("failing")
diff --git a/runner/testdata/skippers.c b/runner/testdata/skippers.c
index 1d58e418fab1..6dc117a41401 100644
--- a/runner/testdata/skippers.c
+++ b/runner/testdata/skippers.c
@@ -1,6 +1,6 @@
 #include "igt.h"
 
-igt_main
+igt_main()
 {
 	igt_fixture() {
 		igt_require_f(false, "Skipping from fixture\n");
diff --git a/runner/testdata/successtest.c b/runner/testdata/successtest.c
index bb411eb45718..8055382181b5 100644
--- a/runner/testdata/successtest.c
+++ b/runner/testdata/successtest.c
@@ -1,6 +1,6 @@
 #include "igt.h"
 
-igt_main
+igt_main()
 {
 	igt_subtest("first-subtest")
 		igt_debug("Running first subtest\n");
diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index b4bcd76d8c9c..7b850174bd00 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -498,7 +498,7 @@ static void abm_gradual(data_t *data)
 	}
 }
 
-igt_main
+igt_main()
 {
 	data_t data = {0};
 	igt_skip_on_simulation();
diff --git a/tests/amdgpu/amd_assr.c b/tests/amdgpu/amd_assr.c
index 133e8cb097c5..559ae8abead1 100644
--- a/tests/amdgpu/amd_assr.c
+++ b/tests/amdgpu/amd_assr.c
@@ -267,7 +267,7 @@ static void test_assr_links(data_t *data, uint32_t test_flags)
 
 }
 
-igt_main
+igt_main()
 {
 	data_t data;
 
diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 06562cde0bf0..fe0f7fad2297 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -662,7 +662,7 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle, bool user_queue)
 	free(ring_context);
 }
 
-igt_main
+igt_main()
 {
 	amdgpu_device_handle device;
 	struct amdgpu_gpu_info gpu_info = {0};
diff --git a/tests/amdgpu/amd_basic_ex.c b/tests/amdgpu/amd_basic_ex.c
index e1cda3e9b6f5..01d89b5719aa 100644
--- a/tests/amdgpu/amd_basic_ex.c
+++ b/tests/amdgpu/amd_basic_ex.c
@@ -21,7 +21,7 @@ amdgpu_ce_write_after_fence(amdgpu_device_handle device_handle)
 	amdgpu_cs_ctx_free(context_handle);
 }
 
-igt_main
+igt_main()
 {
 	amdgpu_device_handle device;
 	struct amdgpu_gpu_info gpu_info = {0};
diff --git a/tests/amdgpu/amd_basic_multi_gpu.c b/tests/amdgpu/amd_basic_multi_gpu.c
index 03a4a719138d..5ece374bab6a 100644
--- a/tests/amdgpu/amd_basic_multi_gpu.c
+++ b/tests/amdgpu/amd_basic_multi_gpu.c
@@ -157,7 +157,7 @@ static void amdgpu_command_submission_multi_fence(amdgpu_device_handle device)
 	amdgpu_command_submission_multi_fence_wait_all(device, false);
 }
 
-igt_main
+igt_main()
 {
 	amdgpu_device_handle device;
 	int fd = -1;
diff --git a/tests/amdgpu/amd_bo.c b/tests/amdgpu/amd_bo.c
index 09fc7b496d6f..52a379eb17c6 100644
--- a/tests/amdgpu/amd_bo.c
+++ b/tests/amdgpu/amd_bo.c
@@ -248,7 +248,7 @@ amdgpu_bo_find_by_cpu_mapping(amdgpu_device_handle device_handle)
 				     bo_mc_address, 4096);
 }
 
-igt_main
+igt_main()
 {
 	amdgpu_device_handle device;
 	struct bo_data bo;
diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
index 03ec30648abc..1d92d470027b 100644
--- a/tests/amdgpu/amd_bypass.c
+++ b/tests/amdgpu/amd_bypass.c
@@ -397,7 +397,7 @@ static void bypass_8bpc_test(data_t *data)
 	}
 }
 
-igt_main
+igt_main()
 {
 	data_t data;
 	memset(&data, 0, sizeof(data));
diff --git a/tests/amdgpu/amd_color.c b/tests/amdgpu/amd_color.c
index d2f3e9c659bc..c01ef1b84359 100644
--- a/tests/amdgpu/amd_color.c
+++ b/tests/amdgpu/amd_color.c
@@ -392,7 +392,7 @@ static void test_crtc_lut_accuracy(data_t *data)
 	lut_free(&lut_degamma);
 }
 
-igt_main
+igt_main()
 {
 	data_t data;
 
diff --git a/tests/amdgpu/amd_cp_dma_misc.c b/tests/amdgpu/amd_cp_dma_misc.c
index e86d580c29c1..5ad799d8a6e0 100644
--- a/tests/amdgpu/amd_cp_dma_misc.c
+++ b/tests/amdgpu/amd_cp_dma_misc.c
@@ -8,7 +8,7 @@
 #include "lib/amdgpu/amd_cp_dma.h"
 #include "lib/amdgpu/amd_ip_blocks.h"
 
-igt_main
+igt_main()
 {
 	amdgpu_device_handle device;
 	amdgpu_device_handle device2;
diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c
index 4d6b5aaf267a..60a9d77e0918 100644
--- a/tests/amdgpu/amd_cs_nop.c
+++ b/tests/amdgpu/amd_cs_nop.c
@@ -146,7 +146,7 @@ static void nop_cs(amdgpu_device_handle device,
 	free(ring_context);
 }
 
-igt_main
+igt_main()
 {
 	amdgpu_device_handle device;
 	amdgpu_context_handle context;
diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index ea7c546cf797..73513055c17a 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -33,7 +33,7 @@ is_deadlock_tests_enable(const struct amdgpu_gpu_info *gpu_info)
 	return enable;
 }
 
-igt_main
+igt_main()
 {
 	amdgpu_device_handle device;
 	struct amdgpu_gpu_info gpu_info = {0};
diff --git a/tests/amdgpu/amd_dispatch.c b/tests/amdgpu/amd_dispatch.c
index bbd4761c7eb3..ad7a6fdbd04d 100644
--- a/tests/amdgpu/amd_dispatch.c
+++ b/tests/amdgpu/amd_dispatch.c
@@ -76,7 +76,7 @@ amdgpu_gpu_reset_test(amdgpu_device_handle device_handle, int drm_amdgpu,
 	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, 0, pci, false);
 }
 
-igt_main
+igt_main()
 {
 	amdgpu_device_handle device;
 	struct amdgpu_gpu_info gpu_info = {0};
diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
index 68d774ffbeb3..9701df2bd6cb 100644
--- a/tests/amdgpu/amd_dp_dsc.c
+++ b/tests/amdgpu/amd_dp_dsc.c
@@ -537,7 +537,7 @@ static void test_dsc_bpc(data_t *data)
 	test_fini(data);
 }
 
-igt_main {
+igt_main() {
 	data_t data = { 0 };
 
 	igt_skip_on_simulation();
diff --git a/tests/amdgpu/amd_freesync_video_mode.c b/tests/amdgpu/amd_freesync_video_mode.c
index fbc770311f30..41de7b19217c 100644
--- a/tests/amdgpu/amd_freesync_video_mode.c
+++ b/tests/amdgpu/amd_freesync_video_mode.c
@@ -860,7 +860,7 @@ run_test(data_t *data, uint32_t scene)
 		igt_skip("No vrr capable outputs found.\n");
 }
 
-igt_main {
+igt_main() {
 	data_t data = {};
 
 	memset(&data, 0, sizeof(data));
diff --git a/tests/amdgpu/amd_fuzzing.c b/tests/amdgpu/amd_fuzzing.c
index e9109c5b8076..c1b5ad4843f6 100644
--- a/tests/amdgpu/amd_fuzzing.c
+++ b/tests/amdgpu/amd_fuzzing.c
@@ -155,7 +155,7 @@ amd_gem_create_fuzzing(int fd)
 
 }
 
-igt_main
+igt_main()
 {
 	int fd = -1;
 	const enum amd_ip_block_type arr_types[] = {
diff --git a/tests/amdgpu/amd_gang_cs.c b/tests/amdgpu/amd_gang_cs.c
index 242a331feb91..b808f1518bef 100644
--- a/tests/amdgpu/amd_gang_cs.c
+++ b/tests/amdgpu/amd_gang_cs.c
@@ -238,7 +238,7 @@ amdgpu_cs_gang(amdgpu_device_handle device, uint32_t ring, bool is_vmid)
 	free(ring_context);
 }
 
-igt_main
+igt_main()
 {
 	amdgpu_device_handle device;
 	struct amdgpu_gpu_info gpu_info = {0};
diff --git a/tests/amdgpu/amd_hotplug.c b/tests/amdgpu/amd_hotplug.c
index 47c066349596..bd2e59d03079 100644
--- a/tests/amdgpu/amd_hotplug.c
+++ b/tests/amdgpu/amd_hotplug.c
@@ -200,7 +200,7 @@ static void test_hotplug_basic(data_t *data, bool suspend)
 	test_fini(data);
 }
 
-igt_main
+igt_main()
 {
 	data_t data;
 
diff --git a/tests/amdgpu/amd_ilr.c b/tests/amdgpu/amd_ilr.c
index ee9695f9eba4..a1cb82cff69b 100644
--- a/tests/amdgpu/amd_ilr.c
+++ b/tests/amdgpu/amd_ilr.c
@@ -315,7 +315,7 @@ static void test_flow(data_t *data, enum sub_test option)
 	}
 }
 
-igt_main
+igt_main()
 {
 	data_t data;
 	memset(&data, 0, sizeof(data));
diff --git a/tests/amdgpu/amd_info.c b/tests/amdgpu/amd_info.c
index 2fc9b8e81083..9657bf320038 100644
--- a/tests/amdgpu/amd_info.c
+++ b/tests/amdgpu/amd_info.c
@@ -117,7 +117,7 @@ time_stamp_test_enable(struct amdgpu_gpu_info *gpu_info)
 	return true;
 }
 
-igt_main
+igt_main()
 {
 	amdgpu_device_handle device;
 	struct amdgpu_gpu_info gpu_info = {};
diff --git a/tests/amdgpu/amd_jpeg_dec.c b/tests/amdgpu/amd_jpeg_dec.c
index 6ff2ad68d865..713ede11a4bc 100644
--- a/tests/amdgpu/amd_jpeg_dec.c
+++ b/tests/amdgpu/amd_jpeg_dec.c
@@ -217,7 +217,7 @@ amdgpu_cs_jpeg_decode(amdgpu_device_handle device_handle,
 	mmd_context_clean(device_handle, context);
 }
 
-igt_main
+igt_main()
 {
 	amdgpu_device_handle device;
 	struct mmd_shared_context shared_context = {};
diff --git a/tests/amdgpu/amd_jpeg_queue.c b/tests/amdgpu/amd_jpeg_queue.c
index 4a3146e0f3a3..5f4a3d90ac8a 100644
--- a/tests/amdgpu/amd_jpeg_queue.c
+++ b/tests/amdgpu/amd_jpeg_queue.c
@@ -76,7 +76,7 @@ err_handle:
 	return ret;
 }
 
-igt_main
+igt_main()
 {
 	amdgpu_device_handle device;
 	struct mmd_shared_context shared_context = {};
diff --git a/tests/amdgpu/amd_link_settings.c b/tests/amdgpu/amd_link_settings.c
index 351d36fd81dd..e42843023397 100644
--- a/tests/amdgpu/amd_link_settings.c
+++ b/tests/amdgpu/amd_link_settings.c
@@ -246,7 +246,7 @@ static void test_link_training_configs(data_t *data)
 	test_fini(data);
 }
 
-igt_main
+igt_main()
 {
 	data_t data;
 	memset(&data, 0, sizeof(data));
diff --git a/tests/amdgpu/amd_mall.c b/tests/amdgpu/amd_mall.c
index 36b9271d7295..b4bf2c5adc2a 100644
--- a/tests/amdgpu/amd_mall.c
+++ b/tests/amdgpu/amd_mall.c
@@ -128,7 +128,7 @@ static void test_mall_ss(data_t *data)
 	test_fini(data);
 }
 
-igt_main
+igt_main()
 {
 	data_t data;
 
diff --git a/tests/amdgpu/amd_max_bpc.c b/tests/amdgpu/amd_max_bpc.c
index 51e6eb7cd1c9..98dd8fd7fb63 100644
--- a/tests/amdgpu/amd_max_bpc.c
+++ b/tests/amdgpu/amd_max_bpc.c
@@ -118,7 +118,7 @@ static void test_4k_mode_max_bpc(data_t *data)
 	test_fini(data);
 }
 
-igt_main
+igt_main()
 {
 	data_t data;
 
diff --git a/tests/amdgpu/amd_mem_leak.c b/tests/amdgpu/amd_mem_leak.c
index 4ea1243a731c..5bcd2be239e9 100644
--- a/tests/amdgpu/amd_mem_leak.c
+++ b/tests/amdgpu/amd_mem_leak.c
@@ -127,7 +127,7 @@ static void test_hotplug(data_t *data)
 	test_fini(data);
 }
 
-igt_main
+igt_main()
 {
 	data_t data;
 
diff --git a/tests/amdgpu/amd_mode_switch.c b/tests/amdgpu/amd_mode_switch.c
index bd89b7f338e5..eaeafd32a134 100644
--- a/tests/amdgpu/amd_mode_switch.c
+++ b/tests/amdgpu/amd_mode_switch.c
@@ -176,7 +176,7 @@ static void run_mode_switch_first_last(data_t *data, int num_pipes)
 }
 
 IGT_TEST_DESCRIPTION("Test switching between supported modes");
-igt_main
+igt_main()
 {
 	data_t data;
 	int i = 0;
diff --git a/tests/amdgpu/amd_module_load.c b/tests/amdgpu/amd_module_load.c
index aef7ec786791..589f8bd2aa3a 100644
--- a/tests/amdgpu/amd_module_load.c
+++ b/tests/amdgpu/amd_module_load.c
@@ -59,7 +59,7 @@ static void sanity_check(void)
 	igt_assert_eq(err, 0);
 }
 
-igt_main
+igt_main()
 {
 	igt_describe("Make sure reloading amdgpu drivers works");
 	igt_subtest("reload") {
diff --git a/tests/amdgpu/amd_multidisplay_modeset.c b/tests/amdgpu/amd_multidisplay_modeset.c
index b7434b089e88..1a31cd74c8d1 100644
--- a/tests/amdgpu/amd_multidisplay_modeset.c
+++ b/tests/amdgpu/amd_multidisplay_modeset.c
@@ -406,7 +406,7 @@ static void multiple_display_test(struct data_t *data, enum sub_test test_mode)
 }
 
 IGT_TEST_DESCRIPTION("Test multi-display mode set, display enable and disable");
-igt_main
+igt_main()
 {
 	struct data_t data;
 
diff --git a/tests/amdgpu/amd_odm.c b/tests/amdgpu/amd_odm.c
index 9514c08fede2..3cb2996f746f 100644
--- a/tests/amdgpu/amd_odm.c
+++ b/tests/amdgpu/amd_odm.c
@@ -160,7 +160,7 @@ static void run_test_odmc(struct data *data, enum odmc_mode m, const drmModeMode
 	test_fini(data);
 }
 
-igt_main
+igt_main()
 {
 	struct data data;
 
diff --git a/tests/amdgpu/amd_pci_unplug.c b/tests/amdgpu/amd_pci_unplug.c
index ad8c1fd1d003..ee6ede43017a 100644
--- a/tests/amdgpu/amd_pci_unplug.c
+++ b/tests/amdgpu/amd_pci_unplug.c
@@ -31,7 +31,7 @@
 #include "lib/amdgpu/amd_ip_blocks.h"
 
 
-igt_main
+igt_main()
 {
 
 	struct amd_pci_unplug_setup setup = {0};
diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
index 130d4231a680..71c294053369 100644
--- a/tests/amdgpu/amd_plane.c
+++ b/tests/amdgpu/amd_plane.c
@@ -896,7 +896,7 @@ static void test_mpo_swizzle_toggle(data_t *data)
 }
 
 
-igt_main
+igt_main()
 {
 	data_t data;
 
diff --git a/tests/amdgpu/amd_prime.c b/tests/amdgpu/amd_prime.c
index 57fdfe8c61ed..fbab2d164fe1 100644
--- a/tests/amdgpu/amd_prime.c
+++ b/tests/amdgpu/amd_prime.c
@@ -428,7 +428,7 @@ static void shrink(int i915, int amd, amdgpu_device_handle device)
 	gem_close(i915, handle);
 }
 
-igt_main
+igt_main()
 {
 	amdgpu_device_handle device;
 	int i915 = -1, amd = -1;
diff --git a/tests/amdgpu/amd_pstate.c b/tests/amdgpu/amd_pstate.c
index 448a5618f6d9..d2ea44826254 100644
--- a/tests/amdgpu/amd_pstate.c
+++ b/tests/amdgpu/amd_pstate.c
@@ -40,7 +40,7 @@ amdgpu_stable_pstate_test(amdgpu_device_handle device_handle)
 
 }
 
-igt_main
+igt_main()
 {
 	amdgpu_device_handle device;
 	int fd = -1;
diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index bb406324010f..3058eac26780 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -1100,7 +1100,7 @@ get_num_of_tests(struct dynamic_test *arr_err, enum amd_ip_block_type *ip_tests,
 	return cnt;
 }
 
-igt_main
+igt_main()
 {
 	char cmdline[2048];
 	int argc = 0;
diff --git a/tests/amdgpu/amd_ras.c b/tests/amdgpu/amd_ras.c
index 70ebed630180..4303908bedc6 100644
--- a/tests/amdgpu/amd_ras.c
+++ b/tests/amdgpu/amd_ras.c
@@ -988,7 +988,7 @@ ras_tests_cleanup(struct amd_ras_setup *setup)
 	}
 }
 
-igt_main
+igt_main()
 {
 	struct amd_ras_setup setup = {};
 	bool render_mode = true;
diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
index 65b527fd38f3..cef083d23b42 100644
--- a/tests/amdgpu/amd_security.c
+++ b/tests/amdgpu/amd_security.c
@@ -308,7 +308,7 @@ is_security_tests_enable(amdgpu_device_handle device_handle,
 	return enable;
 }
 
-igt_main
+igt_main()
 {
 	amdgpu_device_handle device;
 	struct amdgpu_gpu_info gpu_info = {};
diff --git a/tests/amdgpu/amd_subvp.c b/tests/amdgpu/amd_subvp.c
index 8a7268b8a33e..984d661e846c 100644
--- a/tests/amdgpu/amd_subvp.c
+++ b/tests/amdgpu/amd_subvp.c
@@ -152,7 +152,7 @@ static void test_subvp(struct data *data)
 	test_fini(data);
 }
 
-igt_main
+igt_main()
 {
 	struct data data;
 
diff --git a/tests/amdgpu/amd_syncobj.c b/tests/amdgpu/amd_syncobj.c
index a5e53d9f42ad..e06769bcab67 100644
--- a/tests/amdgpu/amd_syncobj.c
+++ b/tests/amdgpu/amd_syncobj.c
@@ -234,7 +234,7 @@ amdgpu_syncobj_timeline(amdgpu_device_handle device_handle)
 
 }
 
-igt_main
+igt_main()
 {
 	amdgpu_device_handle device;
 	int fd = -1;
diff --git a/tests/amdgpu/amd_uvd_dec.c b/tests/amdgpu/amd_uvd_dec.c
index 6151a59adc1b..5e7d5b34fa20 100644
--- a/tests/amdgpu/amd_uvd_dec.c
+++ b/tests/amdgpu/amd_uvd_dec.c
@@ -294,7 +294,7 @@ amdgpu_uvd_dec_destroy(amdgpu_device_handle device_handle, struct mmd_context *c
 	igt_assert_eq(r, 0);
 }
 
-igt_main
+igt_main()
 {
 	amdgpu_device_handle device;
 	struct mmd_context context = {};
diff --git a/tests/amdgpu/amd_uvd_enc.c b/tests/amdgpu/amd_uvd_enc.c
index 53d82c0e92d3..4e2780239681 100644
--- a/tests/amdgpu/amd_uvd_enc.c
+++ b/tests/amdgpu/amd_uvd_enc.c
@@ -309,7 +309,7 @@ amdgpu_uvd_enc_test(amdgpu_device_handle device, struct mmd_shared_context *shar
 
 }
 
-igt_main
+igt_main()
 {
 	amdgpu_device_handle device;
 	struct mmd_shared_context shared_context = {};
diff --git a/tests/amdgpu/amd_vce_enc.c b/tests/amdgpu/amd_vce_enc.c
index b6dee0467dc2..a95e13d98620 100644
--- a/tests/amdgpu/amd_vce_enc.c
+++ b/tests/amdgpu/amd_vce_enc.c
@@ -586,7 +586,7 @@ amdgpu_vce_enc_test(amdgpu_device_handle device, struct mmd_shared_context *shar
 	mmd_context_clean(device, context);
 }
 
-igt_main
+igt_main()
 {
 	amdgpu_device_handle device;
 	struct mmd_shared_context shared_context = {};
diff --git a/tests/amdgpu/amd_vcn.c b/tests/amdgpu/amd_vcn.c
index da8050640238..2c7a84ccb22e 100644
--- a/tests/amdgpu/amd_vcn.c
+++ b/tests/amdgpu/amd_vcn.c
@@ -1231,7 +1231,7 @@ amdgpu_cs_vcn_enc_destroy(amdgpu_device_handle device_handle,
 	free_resource(&v_context->enc_buf);
 }
 
-igt_main
+igt_main()
 {
 	amdgpu_device_handle device;
 	struct mmd_context context = {};
diff --git a/tests/amdgpu/amd_vcn_queue.c b/tests/amdgpu/amd_vcn_queue.c
index 45cf78c087cf..8ba48389f626 100644
--- a/tests/amdgpu/amd_vcn_queue.c
+++ b/tests/amdgpu/amd_vcn_queue.c
@@ -57,7 +57,7 @@ vcn_queue_test(amdgpu_device_handle device_handle,
 	return 0;
 }
 
-igt_main
+igt_main()
 {
 	amdgpu_device_handle device;
 	struct mmd_context context = {};
diff --git a/tests/amdgpu/amd_vm.c b/tests/amdgpu/amd_vm.c
index 88f58f078902..b9d5bbae5ac4 100644
--- a/tests/amdgpu/amd_vm.c
+++ b/tests/amdgpu/amd_vm.c
@@ -197,7 +197,7 @@ amdgpu_vm_mapping_test(amdgpu_device_handle device_handle)
 	amdgpu_bo_free(buf);
 }
 
-igt_main
+igt_main()
 {
 	amdgpu_device_handle device;
 	struct amdgpu_gpu_info gpu_info = {};
diff --git a/tests/amdgpu/amd_vpe.c b/tests/amdgpu/amd_vpe.c
index 93d91ffc565a..a6f49e605ac0 100644
--- a/tests/amdgpu/amd_vpe.c
+++ b/tests/amdgpu/amd_vpe.c
@@ -214,7 +214,7 @@ static void amdgpu_cs_vpe_blit(amdgpu_device_handle device_handle,
 	free_resource(&dst_plane_bo);
 }
 
-igt_main
+igt_main()
 {
 	struct mmd_context context = {};
 	struct mmd_shared_context shared_context = {};
diff --git a/tests/amdgpu/amd_vrr_range.c b/tests/amdgpu/amd_vrr_range.c
index f7aa43d6e8ef..5378e9cbda84 100644
--- a/tests/amdgpu/amd_vrr_range.c
+++ b/tests/amdgpu/amd_vrr_range.c
@@ -456,7 +456,7 @@ static inline void test_freesync_range_suspend(data_t *data)
 	test_freesync_range_base(data, TEST_SUSPEND);
 }
 
-igt_main
+igt_main()
 {
 	data_t data;
 
diff --git a/tests/chamelium/kms_chamelium_audio.c b/tests/chamelium/kms_chamelium_audio.c
index b296bdf7ef0a..89003fec468e 100644
--- a/tests/chamelium/kms_chamelium_audio.c
+++ b/tests/chamelium/kms_chamelium_audio.c
@@ -848,7 +848,7 @@ static void test_display_audio_edid(chamelium_data_t *data,
 }
 
 IGT_TEST_DESCRIPTION("Testing Audio with a Chamelium board");
-igt_main
+igt_main()
 {
 	chamelium_data_t data;
 	struct chamelium_port *port;
diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index 4658678ae693..c07ea8b157c3 100644
--- a/tests/chamelium/kms_chamelium_color.c
+++ b/tests/chamelium/kms_chamelium_color.c
@@ -713,7 +713,7 @@ run_tests_for_pipe(data_t *data)
 
 }
 
-igt_main
+igt_main()
 {
 	int i;
 	data_t data = {};
diff --git a/tests/chamelium/kms_chamelium_frames.c b/tests/chamelium/kms_chamelium_frames.c
index 5194938b7564..3bc1902a9f27 100644
--- a/tests/chamelium/kms_chamelium_frames.c
+++ b/tests/chamelium/kms_chamelium_frames.c
@@ -984,7 +984,7 @@ static void test_display_planes_random(chamelium_data_t *data,
 }
 
 IGT_TEST_DESCRIPTION("Tests requiring a Chamelium board");
-igt_main
+igt_main()
 {
 	chamelium_data_t data;
 	struct chamelium_port *port;
diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_chamelium_hpd.c
index 078166cbd955..e35132d14115 100644
--- a/tests/chamelium/kms_chamelium_hpd.c
+++ b/tests/chamelium/kms_chamelium_hpd.c
@@ -460,7 +460,7 @@ static void test_hpd_storm_disable(chamelium_data_t *data,
 }
 
 IGT_TEST_DESCRIPTION("Testing HPD with a Chamelium board");
-igt_main
+igt_main()
 {
 	chamelium_data_t data;
 	struct chamelium_port *port;
diff --git a/tests/chamelium/kms_chamelium_sharpness_filter.c b/tests/chamelium/kms_chamelium_sharpness_filter.c
index b11c4a21f5a7..a25ac8ad6dc0 100644
--- a/tests/chamelium/kms_chamelium_sharpness_filter.c
+++ b/tests/chamelium/kms_chamelium_sharpness_filter.c
@@ -241,7 +241,7 @@ run_sharpness_filter_test(data_t *data)
 	}
 }
 
-igt_main
+igt_main()
 {
 	data_t data = {};
 
diff --git a/tests/core_auth.c b/tests/core_auth.c
index 2cdaa2f2bec6..e6f4c60fca65 100644
--- a/tests/core_auth.c
+++ b/tests/core_auth.c
@@ -214,7 +214,7 @@ static void test_basic_auth(int master)
 	drm_close_driver(slave);
 }
 
-igt_main
+igt_main()
 {
 	/* root (which we run igt as) should always be authenticated */
 	igt_describe("Check drm client is always authenticated.");
diff --git a/tests/core_debugfs.c b/tests/core_debugfs.c
index cf2e128f3927..7f754ce052c1 100644
--- a/tests/core_debugfs.c
+++ b/tests/core_debugfs.c
@@ -23,7 +23,7 @@
 
 IGT_TEST_DESCRIPTION("Read entries from debugfs");
 
-igt_main
+igt_main()
 {
 	int debugfs = -1;
 	int fd = -1;
diff --git a/tests/core_getclient.c b/tests/core_getclient.c
index 7d34265908ea..bea04157f03f 100644
--- a/tests/core_getclient.c
+++ b/tests/core_getclient.c
@@ -47,7 +47,7 @@
 
 IGT_TEST_DESCRIPTION("Tests the DRM_IOCTL_GET_CLIENT ioctl.");
 
-igt_main
+igt_main()
 {
 	int fd, ret;
 	drm_client_t client;
diff --git a/tests/core_getstats.c b/tests/core_getstats.c
index f1bb134772d3..fc8bd510f969 100644
--- a/tests/core_getstats.c
+++ b/tests/core_getstats.c
@@ -55,7 +55,7 @@
 
 IGT_TEST_DESCRIPTION("Tests the DRM_IOCTL_GET_STATS ioctl.");
 
-igt_main
+igt_main()
 {
 	int fd, ret;
 	drm_stats_t stats;
diff --git a/tests/core_getversion.c b/tests/core_getversion.c
index 6ce53fe01c4d..2c69a65a5cd8 100644
--- a/tests/core_getversion.c
+++ b/tests/core_getversion.c
@@ -81,7 +81,7 @@ static void check_all_drm(void)
 	}
 }
 
-igt_main
+igt_main()
 {
 	char info[256];
 	int fd;
diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 9d8d3f1302bc..a970da41d196 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -672,7 +672,7 @@ static void hotreplug_lateclose(struct hotunplug *priv)
 
 /* Main */
 
-igt_main
+igt_main()
 {
 	struct hotunplug priv = {
 		.fd		= { .drm = -1, .drm_hc = -1, .sysfs_dev = -1, },
diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
index 7f6373c73780..b2063b9bccd2 100644
--- a/tests/core_setmaster.c
+++ b/tests/core_setmaster.c
@@ -133,7 +133,7 @@ static void tweak_perm(uint8_t *saved_perm, char *path, bool save)
 	igt_assert_f(!ret, "chmod failed with %d path=%s\n", errno, path);
 }
 
-igt_main
+igt_main()
 {
 	igt_fixture() {
 		/*
diff --git a/tests/core_sysfs.c b/tests/core_sysfs.c
index 7416d35cf06a..857dd3c537e9 100644
--- a/tests/core_sysfs.c
+++ b/tests/core_sysfs.c
@@ -24,7 +24,7 @@
 
 IGT_TEST_DESCRIPTION("Read entries from sysfs paths.");
 
-igt_main
+igt_main()
 {
 	int fd = -1;
 	int sysfs = -1;
diff --git a/tests/device_reset.c b/tests/device_reset.c
index 8ef7792003de..e51daacf43fa 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -439,7 +439,7 @@ static void unbind_reset_rebind(struct device_fds *dev, enum reset type)
 	driver_bind(dev);
 }
 
-igt_main
+igt_main()
 {
 	struct device_fds dev = { .fds = {-1, -1, -1}, .dev_bus_addr = {0}, };
 
diff --git a/tests/dmabuf.c b/tests/dmabuf.c
index 12c2db68f6df..da8bc0735bf0 100644
--- a/tests/dmabuf.c
+++ b/tests/dmabuf.c
@@ -92,7 +92,7 @@ static int wrapper(const char *dynamic_name,
 	return igt_kselftest_execute(tst, tl, NULL, NULL);
 }
 
-igt_main
+igt_main()
 {
 	igt_kselftests("dmabuf_selftests", NULL, NULL, NULL, wrapper);
 }
diff --git a/tests/dmabuf_sync_file.c b/tests/dmabuf_sync_file.c
index cce8bdbb9ce5..18a75f80a3d9 100644
--- a/tests/dmabuf_sync_file.c
+++ b/tests/dmabuf_sync_file.c
@@ -354,7 +354,7 @@ static void test_import_multiple(int fd, bool write)
 	igt_assert(!sync_file_busy(write_sync_file));
 }
 
-igt_main
+igt_main()
 {
 	int fd;
 
diff --git a/tests/drm_buddy.c b/tests/drm_buddy.c
index 4f411464a761..58e7a582c542 100644
--- a/tests/drm_buddy.c
+++ b/tests/drm_buddy.c
@@ -8,7 +8,7 @@
 
 IGT_TEST_DESCRIPTION("Basic sanity check of DRM's buddy allocator (struct drm_buddy)");
 
-igt_main
+igt_main()
 {
 	igt_kunit("drm_buddy_test", NULL, NULL);
 }
diff --git a/tests/drm_mm.c b/tests/drm_mm.c
index e7b4c651f81e..58e56058bf1b 100644
--- a/tests/drm_mm.c
+++ b/tests/drm_mm.c
@@ -78,7 +78,7 @@
 
 IGT_TEST_DESCRIPTION("Basic sanity check of DRM's range manager (struct drm_mm)");
 
-igt_main
+igt_main()
 {
 	igt_kunit("drm_mm_test", NULL, NULL);
 }
diff --git a/tests/drm_read.c b/tests/drm_read.c
index 3e3103fdf61a..f48cd71ac8ac 100644
--- a/tests/drm_read.c
+++ b/tests/drm_read.c
@@ -270,7 +270,7 @@ static void test_short_buffer_wakeup(int in, enum pipe pipe)
 	close(w.fd);
 }
 
-igt_main
+igt_main()
 {
 	igt_display_t display;
 	struct igt_fb fb;
diff --git a/tests/drm_virtgpu.c b/tests/drm_virtgpu.c
index 2a89bd0ec3d8..b632708d104b 100644
--- a/tests/drm_virtgpu.c
+++ b/tests/drm_virtgpu.c
@@ -156,7 +156,7 @@ static void create_resource_if_needed(void)
 		 args.res_handle, args.bo_handle);
 }
 
-igt_main {
+igt_main() {
 	void *caps_buf = NULL;
 
 	igt_fixture() {
diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
index a8f30d88734b..ae89618bedb1 100644
--- a/tests/dumb_buffer.c
+++ b/tests/dumb_buffer.c
@@ -389,7 +389,7 @@ static void always_clear(int fd, int timeout)
 	igt_info("Checked %'lu page allocations\n", checked);
 }
 
-igt_main
+igt_main()
 {
 	int fd = -1;
 
diff --git a/tests/fbdev.c b/tests/fbdev.c
index 387b99660fb5..cb331ba00f0a 100644
--- a/tests/fbdev.c
+++ b/tests/fbdev.c
@@ -452,7 +452,7 @@ static void framebuffer_tests(int fd)
 	}
 }
 
-igt_main
+igt_main()
 {
 	volatile int fd = -1;
 
diff --git a/tests/intel/api_intel_allocator.c b/tests/intel/api_intel_allocator.c
index e2ac8bf7a0e0..56889fe6cbd6 100644
--- a/tests/intel/api_intel_allocator.c
+++ b/tests/intel/api_intel_allocator.c
@@ -810,7 +810,7 @@ struct allocators {
 	{NULL, 0},
 };
 
-igt_main
+igt_main()
 {
 	int fd;
 	struct allocators *a;
diff --git a/tests/intel/gem_bad_reloc.c b/tests/intel/gem_bad_reloc.c
index 94b1e8ee5827..a3219827f544 100644
--- a/tests/intel/gem_bad_reloc.c
+++ b/tests/intel/gem_bad_reloc.c
@@ -206,7 +206,7 @@ static void negative_reloc_blt(int fd)
 		igt_assert_eq(buf[i], 0xc0ffee ^ i);
 }
 
-igt_main
+igt_main()
 {
 	int fd = -1;
 
diff --git a/tests/intel/gem_barrier_race.c b/tests/intel/gem_barrier_race.c
index bdf6a9ef833a..e47f9cd82760 100644
--- a/tests/intel/gem_barrier_race.c
+++ b/tests/intel/gem_barrier_race.c
@@ -143,7 +143,7 @@ static void test_remote_request(int fd, uint64_t engine, unsigned int timeout)
 	munmap(done, 4096);
 }
 
-igt_main
+igt_main()
 {
 	int fd;
 
diff --git a/tests/intel/gem_basic.c b/tests/intel/gem_basic.c
index 06281a739bfc..94ba793721c2 100644
--- a/tests/intel/gem_basic.c
+++ b/tests/intel/gem_basic.c
@@ -105,7 +105,7 @@ test_create_fd_close(int fd)
 	close(fd);
 }
 
-igt_main
+igt_main()
 {
 	igt_fd_t(fd);
 	int gpu_count;
diff --git a/tests/intel/gem_blits.c b/tests/intel/gem_blits.c
index 47fd4a3206f6..236b22a44d20 100644
--- a/tests/intel/gem_blits.c
+++ b/tests/intel/gem_blits.c
@@ -820,7 +820,7 @@ static bool blit_supports_tiling(int fd, enum blt_tiling_type tiling)
 	}
 }
 
-igt_main
+igt_main()
 {
 	struct device device;
 
diff --git a/tests/intel/gem_busy.c b/tests/intel/gem_busy.c
index 16831aee0ba1..13b8ad8441bf 100644
--- a/tests/intel/gem_busy.c
+++ b/tests/intel/gem_busy.c
@@ -469,7 +469,7 @@ static void all(int i915, const intel_ctx_t *ctx)
 		for_each_if (gem_class_can_store_dword(i915, (e)->class)) \
 			igt_dynamic_f("%s", (e)->name)
 
-igt_main
+igt_main()
 {
 	const struct intel_execution_engine2 *e;
 	const intel_ctx_t *ctx;
diff --git a/tests/intel/gem_caching.c b/tests/intel/gem_caching.c
index a9d07c6a3498..0a613dbf0be8 100644
--- a/tests/intel/gem_caching.c
+++ b/tests/intel/gem_caching.c
@@ -155,7 +155,7 @@ blt_bo_fill(data_t *data, struct intel_bb *ibb, struct intel_buf *tmp_bo,
 #define TEST_READ 0x1
 #define TEST_WRITE 0x2
 #define TEST_BOTH (TEST_READ | TEST_WRITE)
-igt_main
+igt_main()
 {
 	struct intel_buf *scratch_buf, *staging_buf;
 	struct intel_bb *ibb;
diff --git a/tests/intel/gem_close.c b/tests/intel/gem_close.c
index e3667ef34171..fa99bb8c1f5b 100644
--- a/tests/intel/gem_close.c
+++ b/tests/intel/gem_close.c
@@ -137,7 +137,7 @@ static void test_many_handles(int fd)
 	}
 }
 
-igt_main
+igt_main()
 {
 	igt_fd_t(fd);
 
diff --git a/tests/intel/gem_close_race.c b/tests/intel/gem_close_race.c
index 6e32617e06d1..2359671ebe0a 100644
--- a/tests/intel/gem_close_race.c
+++ b/tests/intel/gem_close_race.c
@@ -336,7 +336,7 @@ static void threads(int timeout, unsigned int flags)
 	drm_close_driver(fd);
 }
 
-igt_main
+igt_main()
 {
 	int gpu_count;
 
diff --git a/tests/intel/gem_compute.c b/tests/intel/gem_compute.c
index 219a4db2fc83..ad5542c140fe 100644
--- a/tests/intel/gem_compute.c
+++ b/tests/intel/gem_compute.c
@@ -31,7 +31,7 @@ test_compute_square(int fd)
 		      "GPU not supported\n");
 }
 
-igt_main
+igt_main()
 {
 	int i915;
 
diff --git a/tests/intel/gem_concurrent_all.c b/tests/intel/gem_concurrent_all.c
index 5235de888b38..65db04bfee97 100644
--- a/tests/intel/gem_concurrent_all.c
+++ b/tests/intel/gem_concurrent_all.c
@@ -1775,7 +1775,7 @@ num_buffers(uint64_t max,
 	return n;
 }
 
-igt_main
+igt_main()
 {
 	const struct access_mode modes[] = {
 		{
diff --git a/tests/intel/gem_create.c b/tests/intel/gem_create.c
index 4253a055f0e8..87490b3757c1 100644
--- a/tests/intel/gem_create.c
+++ b/tests/intel/gem_create.c
@@ -946,7 +946,7 @@ static void create_ext_cpu_access_big(int fd)
 	free(regions);
 }
 
-igt_main
+igt_main()
 {
 	igt_fd_t(fd);
 
diff --git a/tests/intel/gem_cs_tlb.c b/tests/intel/gem_cs_tlb.c
index ed9acf004c64..fd40d6484f24 100644
--- a/tests/intel/gem_cs_tlb.c
+++ b/tests/intel/gem_cs_tlb.c
@@ -154,7 +154,7 @@ static void run_on_ring(int fd, const intel_ctx_t *ctx,
 	}
 }
 
-igt_main
+igt_main()
 {
 	const struct intel_execution_engine2 *e;
 	const intel_ctx_t *ctx;
diff --git a/tests/intel/gem_ctx_bad_destroy.c b/tests/intel/gem_ctx_bad_destroy.c
index 3d1e909daa70..83e56420be3d 100644
--- a/tests/intel/gem_ctx_bad_destroy.c
+++ b/tests/intel/gem_ctx_bad_destroy.c
@@ -58,7 +58,7 @@ IGT_TEST_DESCRIPTION("Negative test cases for destroy contexts.");
 uint32_t ctx_id;
 int fd;
 
-igt_main
+igt_main()
 {
 	igt_fixture() {
 		fd = drm_open_driver_render(DRIVER_INTEL);
diff --git a/tests/intel/gem_ctx_create.c b/tests/intel/gem_ctx_create.c
index 3070dd9ac316..6bebc290d249 100644
--- a/tests/intel/gem_ctx_create.c
+++ b/tests/intel/gem_ctx_create.c
@@ -614,7 +614,7 @@ static void iris_pipeline(int i915)
 #endif /* I915_DEFINE_CONTEXT_PARAM_ENGINES */
 }
 
-igt_main
+igt_main()
 {
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	struct drm_i915_gem_context_create create;
diff --git a/tests/intel/gem_ctx_engines.c b/tests/intel/gem_ctx_engines.c
index 5c2bf93abe0a..b626094875ca 100644
--- a/tests/intel/gem_ctx_engines.c
+++ b/tests/intel/gem_ctx_engines.c
@@ -609,7 +609,7 @@ static void independent_all(int i915, const intel_ctx_t *ctx)
 	igt_waitchildren();
 }
 
-igt_main
+igt_main()
 {
 	const struct intel_execution_engine2 *e;
 	igt_fd_t(i915);
diff --git a/tests/intel/gem_ctx_exec.c b/tests/intel/gem_ctx_exec.c
index 025f25a20e8b..481bd18323f3 100644
--- a/tests/intel/gem_ctx_exec.c
+++ b/tests/intel/gem_ctx_exec.c
@@ -486,7 +486,7 @@ static void close_race(int i915)
 	munmap(ctx_id, 4096);
 }
 
-igt_main
+igt_main()
 {
 	const uint32_t batch[2] = { 0, MI_BATCH_BUFFER_END };
 	uint32_t handle;
diff --git a/tests/intel/gem_ctx_freq.c b/tests/intel/gem_ctx_freq.c
index 8b8205e2acd3..3fb87b79fd34 100644
--- a/tests/intel/gem_ctx_freq.c
+++ b/tests/intel/gem_ctx_freq.c
@@ -260,7 +260,7 @@ static void disable_boost(void)
 		__disable_boost(dirfd);
 }
 
-igt_main
+igt_main()
 {
 	igt_fixture() {
 		i915 = drm_open_driver(DRIVER_INTEL);
diff --git a/tests/intel/gem_ctx_isolation.c b/tests/intel/gem_ctx_isolation.c
index 73e773f301ff..1337b86a05e0 100644
--- a/tests/intel/gem_ctx_isolation.c
+++ b/tests/intel/gem_ctx_isolation.c
@@ -1004,7 +1004,7 @@ static unsigned int __has_context_isolation(int fd)
 		for_each_if(mask & (1 << (e)->class)) \
 			igt_dynamic_f("%s", (e)->name)
 
-igt_main
+igt_main()
 {
 	unsigned int has_context_isolation = 0;
 	const struct intel_execution_engine2 *e;
diff --git a/tests/intel/gem_ctx_param.c b/tests/intel/gem_ctx_param.c
index 44bde4dee93b..5da9522f51b6 100644
--- a/tests/intel/gem_ctx_param.c
+++ b/tests/intel/gem_ctx_param.c
@@ -372,7 +372,7 @@ static void test_get_invalid_param(int fd, uint64_t param)
 	igt_assert_eq(err, -EINVAL);
 }
 
-igt_main
+igt_main()
 {
 	struct drm_i915_gem_context_param arg;
 	int fd;
diff --git a/tests/intel/gem_ctx_persistence.c b/tests/intel/gem_ctx_persistence.c
index 2fc82bdc3c6f..379a82d42185 100644
--- a/tests/intel/gem_ctx_persistence.c
+++ b/tests/intel/gem_ctx_persistence.c
@@ -1331,7 +1331,7 @@ static void exit_handler(int sig)
 	enable_hangcheck(i915);
 }
 
-igt_main
+igt_main()
 {
 	const intel_ctx_cfg_t empty_cfg = {};
 	struct {
diff --git a/tests/intel/gem_ctx_shared.c b/tests/intel/gem_ctx_shared.c
index 575e0cebd80f..c9af1ae0a813 100644
--- a/tests/intel/gem_ctx_shared.c
+++ b/tests/intel/gem_ctx_shared.c
@@ -1023,7 +1023,7 @@ static void smoketest(int i915, const intel_ctx_cfg_t *cfg,
 			    !gem_engine_can_block_ggtt_binder(i915, e)) \
 			igt_dynamic_f("%s", e->name)
 
-igt_main
+igt_main()
 {
 	const struct intel_execution_engine2 *e;
 	intel_ctx_cfg_t cfg;
diff --git a/tests/intel/gem_ctx_sseu.c b/tests/intel/gem_ctx_sseu.c
index 45fcb16e6fa6..aa4e8472761a 100644
--- a/tests/intel/gem_ctx_sseu.c
+++ b/tests/intel/gem_ctx_sseu.c
@@ -514,7 +514,7 @@ out:
 	gem_context_destroy(fd, arg.ctx_id);
 }
 
-igt_main
+igt_main()
 {
 	int fd;
 
diff --git a/tests/intel/gem_ctx_switch.c b/tests/intel/gem_ctx_switch.c
index 0fa31b4c27f9..270d4c8cc0ba 100644
--- a/tests/intel/gem_ctx_switch.c
+++ b/tests/intel/gem_ctx_switch.c
@@ -686,7 +686,7 @@ has_queues(int fd)
 	return gem_has_vm(fd) && gem_context_has_single_timeline(fd);
 }
 
-igt_main
+igt_main()
 {
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	const struct intel_execution_engine2 *e2;
diff --git a/tests/intel/gem_eio.c b/tests/intel/gem_eio.c
index e589a62d534c..fafed9205ad0 100644
--- a/tests/intel/gem_eio.c
+++ b/tests/intel/gem_eio.c
@@ -1102,7 +1102,7 @@ exit_handler(int sig)
 	igt_force_gpu_reset(fd);
 }
 
-igt_main
+igt_main()
 {
 	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
diff --git a/tests/intel/gem_evict_alignment.c b/tests/intel/gem_evict_alignment.c
index 3f68a79e8a70..acea339166a4 100644
--- a/tests/intel/gem_evict_alignment.c
+++ b/tests/intel/gem_evict_alignment.c
@@ -209,7 +209,7 @@ static void major_evictions(int fd, uint64_t size, uint64_t count)
 
 #define MAX_32b ((1ull << 32) - 4096)
 
-igt_main
+igt_main()
 {
 	uint64_t size, count;
 	int fd = -1;
diff --git a/tests/intel/gem_evict_everything.c b/tests/intel/gem_evict_everything.c
index cf36cca15dc6..40d79a52c1e8 100644
--- a/tests/intel/gem_evict_everything.c
+++ b/tests/intel/gem_evict_everything.c
@@ -241,7 +241,7 @@ static void test_major_evictions(int fd, uint64_t size, uint64_t count)
 
 #define MAX_32b ((1ull << 32) - 4096)
 
-igt_main
+igt_main()
 {
 	uint64_t size, count;
 	int fd;
diff --git a/tests/intel/gem_exec_alignment.c b/tests/intel/gem_exec_alignment.c
index d70a325f215e..628b4d226368 100644
--- a/tests/intel/gem_exec_alignment.c
+++ b/tests/intel/gem_exec_alignment.c
@@ -548,7 +548,7 @@ static void single(int fd)
 	gem_close(fd, execobj.handle);
 }
 
-igt_main
+igt_main()
 {
 	igt_fd_t(fd);
 
diff --git a/tests/intel/gem_exec_async.c b/tests/intel/gem_exec_async.c
index de5bc9caca31..a3d5705dde34 100644
--- a/tests/intel/gem_exec_async.c
+++ b/tests/intel/gem_exec_async.c
@@ -189,7 +189,7 @@ static bool has_async_execbuf(int fd)
 	igt_subtest_with_dynamic(T) for_each_ctx_engine(i915, ctx, e) \
 		igt_dynamic_f("%s", (e)->name)
 
-igt_main
+igt_main()
 {
 	const struct intel_execution_engine2 *e;
 	const intel_ctx_t *ctx;
diff --git a/tests/intel/gem_exec_await.c b/tests/intel/gem_exec_await.c
index e7c78196e499..66dfbc3d4a16 100644
--- a/tests/intel/gem_exec_await.c
+++ b/tests/intel/gem_exec_await.c
@@ -251,7 +251,7 @@ static void wide(int fd, intel_ctx_cfg_t *cfg, int ring_size,
 
 #define TIMEOUT 20
 
-igt_main
+igt_main()
 {
 	intel_ctx_cfg_t cfg;
 	int ring_size = 0;
diff --git a/tests/intel/gem_exec_balancer.c b/tests/intel/gem_exec_balancer.c
index a7d88952f650..ce9859420b71 100644
--- a/tests/intel/gem_exec_balancer.c
+++ b/tests/intel/gem_exec_balancer.c
@@ -3409,7 +3409,7 @@ static bool has_parallel_execbuf(int i915)
 	return false;
 }
 
-igt_main
+igt_main()
 {
 	igt_fd_t(i915);
 
diff --git a/tests/intel/gem_exec_basic.c b/tests/intel/gem_exec_basic.c
index d4dbed2c5099..b4afd440b540 100644
--- a/tests/intel/gem_exec_basic.c
+++ b/tests/intel/gem_exec_basic.c
@@ -53,7 +53,7 @@ static uint32_t batch_create(int fd, uint64_t *batch_size, uint32_t region)
 	return handle;
 }
 
-igt_main
+igt_main()
 {
 	const struct intel_execution_engine2 *e;
 	struct drm_i915_query_memory_regions *query_info;
diff --git a/tests/intel/gem_exec_big.c b/tests/intel/gem_exec_big.c
index 9ae1f26dd71b..5050364624ae 100644
--- a/tests/intel/gem_exec_big.c
+++ b/tests/intel/gem_exec_big.c
@@ -318,7 +318,7 @@ static void single(int i915)
 		munmap(ptr, batch_size);
 }
 
-igt_main
+igt_main()
 {
 	int i915 = -1;
 
diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/gem_exec_capture.c
index 6966975b33f3..a424480ac3ce 100644
--- a/tests/intel/gem_exec_capture.c
+++ b/tests/intel/gem_exec_capture.c
@@ -955,7 +955,7 @@ static size_t safer_strlen(const char *s)
 	igt_subtest_with_dynamic(T) for_each_ctx_engine(i915, ctx, e) \
 		for_each_if(gem_class_can_store_dword(i915, (e)->class)) \
 
-igt_main
+igt_main()
 {
 	const struct intel_execution_engine2 *e;
 	const intel_ctx_t *ctx;
diff --git a/tests/intel/gem_exec_create.c b/tests/intel/gem_exec_create.c
index 29768cf2bdc9..6e7553b2b08c 100644
--- a/tests/intel/gem_exec_create.c
+++ b/tests/intel/gem_exec_create.c
@@ -176,7 +176,7 @@ static void all(int fd, unsigned flags, int timeout, int ncpus, uint32_t region)
 	intel_ctx_destroy(fd, ctx);
 }
 
-igt_main
+igt_main()
 {
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	struct drm_i915_query_memory_regions *query_info;
diff --git a/tests/intel/gem_exec_endless.c b/tests/intel/gem_exec_endless.c
index 0b0e755e1191..db6f0bcd8128 100644
--- a/tests/intel/gem_exec_endless.c
+++ b/tests/intel/gem_exec_endless.c
@@ -341,7 +341,7 @@ static void unpin_rps(int sysfs)
 	}
 }
 
-igt_main
+igt_main()
 {
 	const struct intel_execution_engine2 *e;
 	igt_fd_t(i915);
diff --git a/tests/intel/gem_exec_fair.c b/tests/intel/gem_exec_fair.c
index c566a2957860..b73a1771d5f1 100644
--- a/tests/intel/gem_exec_fair.c
+++ b/tests/intel/gem_exec_fair.c
@@ -1289,7 +1289,7 @@ static bool set_heartbeat(int i915, const char *name, unsigned int value)
 	return true;
 }
 
-igt_main
+igt_main()
 {
 	static const struct {
 		const char *name;
diff --git a/tests/intel/gem_exec_fence.c b/tests/intel/gem_exec_fence.c
index b9855f2e3347..ed9232629f1c 100644
--- a/tests/intel/gem_exec_fence.c
+++ b/tests/intel/gem_exec_fence.c
@@ -3155,7 +3155,7 @@ static void test_syncobj_backward_timeline_chain_engines(int fd, const intel_ctx
 	teardown_timeline_chain_engines(&ctx);
 }
 
-igt_main
+igt_main()
 {
 	const struct intel_execution_engine2 *e;
 	const intel_ctx_t *ctx;
diff --git a/tests/intel/gem_exec_flush.c b/tests/intel/gem_exec_flush.c
index 84e3d82fbe5e..437572f6c0f7 100644
--- a/tests/intel/gem_exec_flush.c
+++ b/tests/intel/gem_exec_flush.c
@@ -2074,7 +2074,7 @@ static const char *yesno(bool x)
 	return x ? "yes" : "no";
 }
 
-igt_main
+igt_main()
 {
 	const struct intel_execution_ring *e;
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
diff --git a/tests/intel/gem_exec_gttfill.c b/tests/intel/gem_exec_gttfill.c
index 9fe3fefbb301..fe0df37eb790 100644
--- a/tests/intel/gem_exec_gttfill.c
+++ b/tests/intel/gem_exec_gttfill.c
@@ -244,7 +244,7 @@ static void fillgtt(int fd, const intel_ctx_t *ctx, unsigned ring, int timeout)
 	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
 }
 
-igt_main
+igt_main()
 {
 	const struct intel_execution_engine2 *e;
 	const intel_ctx_t *ctx;
diff --git a/tests/intel/gem_exec_latency.c b/tests/intel/gem_exec_latency.c
index f86b9b1da6c5..ca4986f09cf5 100644
--- a/tests/intel/gem_exec_latency.c
+++ b/tests/intel/gem_exec_latency.c
@@ -928,7 +928,7 @@ static double clockrate(int i915, int reg)
 		for_each_if(gem_class_can_store_dword(i915, (e)->class)) \
 			igt_dynamic_f("%s", (e)->name)
 
-igt_main
+igt_main()
 {
 	const struct intel_execution_engine2 *e;
 	const intel_ctx_t *ctx;
diff --git a/tests/intel/gem_exec_nop.c b/tests/intel/gem_exec_nop.c
index d7664bfa37b8..10d3258441b0 100644
--- a/tests/intel/gem_exec_nop.c
+++ b/tests/intel/gem_exec_nop.c
@@ -1000,7 +1000,7 @@ static void preempt(int fd, uint32_t handle,
 		 e->name, count, elapsed(&start, &now)*1e6 / count);
 }
 
-igt_main
+igt_main()
 {
 	const struct intel_execution_engine2 *e;
 	const intel_ctx_t *ctx;
diff --git a/tests/intel/gem_exec_parallel.c b/tests/intel/gem_exec_parallel.c
index eaadc9387593..3f75ed93d2ea 100644
--- a/tests/intel/gem_exec_parallel.c
+++ b/tests/intel/gem_exec_parallel.c
@@ -336,7 +336,7 @@ static void all(int fd, const intel_ctx_t *ctx,
 	free(threads);
 }
 
-igt_main
+igt_main()
 {
 	struct intel_execution_engine2 *e;
 
diff --git a/tests/intel/gem_exec_params.c b/tests/intel/gem_exec_params.c
index d7dd842c3b9b..ec771100123d 100644
--- a/tests/intel/gem_exec_params.c
+++ b/tests/intel/gem_exec_params.c
@@ -449,7 +449,7 @@ uint32_t batch[2] = {MI_BATCH_BUFFER_END};
 uint32_t handle, devid;
 int fd;
 
-igt_main
+igt_main()
 {
 	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
diff --git a/tests/intel/gem_exec_reloc.c b/tests/intel/gem_exec_reloc.c
index 8bdfc78da6e0..19a059c39fc5 100644
--- a/tests/intel/gem_exec_reloc.c
+++ b/tests/intel/gem_exec_reloc.c
@@ -1625,7 +1625,7 @@ static void invalid_domains(int fd)
 	gem_close(fd, obj[0].handle);
 }
 
-igt_main
+igt_main()
 {
 	const intel_ctx_t *ctx;
 	const struct intel_execution_engine2 *e;
diff --git a/tests/intel/gem_exec_schedule.c b/tests/intel/gem_exec_schedule.c
index 5e5fa2877908..a8701a57e67e 100644
--- a/tests/intel/gem_exec_schedule.c
+++ b/tests/intel/gem_exec_schedule.c
@@ -3202,7 +3202,7 @@ static void fairslice(int i915, const intel_ctx_cfg_t *cfg,
 			    !gem_engine_can_block_ggtt_binder(i915, e)) \
 		igt_dynamic_f("%s", e->name)
 
-igt_main
+igt_main()
 {
 	int fd = -1;
 	const intel_ctx_t *ctx = NULL;
diff --git a/tests/intel/gem_exec_store.c b/tests/intel/gem_exec_store.c
index 64b293aa46f8..c2ac27ff5bcc 100644
--- a/tests/intel/gem_exec_store.c
+++ b/tests/intel/gem_exec_store.c
@@ -437,7 +437,7 @@ static void print_welcome(int fd)
 		for_each_if(gem_class_can_store_dword(i915, (e)->class)) \
 			igt_dynamic_f("%s", (e)->name)
 
-igt_main
+igt_main()
 {
 	const struct intel_execution_engine2 *e;
 	const intel_ctx_t *ctx;
diff --git a/tests/intel/gem_exec_suspend.c b/tests/intel/gem_exec_suspend.c
index 03bc63fa1d9f..a93fb1d0f699 100644
--- a/tests/intel/gem_exec_suspend.c
+++ b/tests/intel/gem_exec_suspend.c
@@ -351,7 +351,7 @@ static void power_test(int i915, const intel_ctx_t *ctx,
 		 d_charge(&after, &before) * 3600 / d_time(&after, &before));
 }
 
-igt_main
+igt_main()
 {
 	const struct {
 		const char *suffix;
diff --git a/tests/intel/gem_exec_whisper.c b/tests/intel/gem_exec_whisper.c
index 649847354c42..8f195adb39eb 100644
--- a/tests/intel/gem_exec_whisper.c
+++ b/tests/intel/gem_exec_whisper.c
@@ -679,7 +679,7 @@ static void whisper(int fd, const intel_ctx_t *ctx,
 	close(debugfs);
 }
 
-igt_main
+igt_main()
 {
 	const struct mode {
 		const char *name;
diff --git a/tests/intel/gem_fence_thrash.c b/tests/intel/gem_fence_thrash.c
index bce638c27f31..fed680c800ed 100644
--- a/tests/intel/gem_fence_thrash.c
+++ b/tests/intel/gem_fence_thrash.c
@@ -252,7 +252,7 @@ static int run_test(int threads_per_fence, void *f, int tiling,
 	return 0;
 }
 
-igt_main
+igt_main()
 {
 	igt_subtest("bo-write-verify-none")
 		igt_assert(run_test(0, bo_write_verify, I915_TILING_NONE, 80) == 0);
diff --git a/tests/intel/gem_fence_upload.c b/tests/intel/gem_fence_upload.c
index 1105fa825bc3..c41d5784d34c 100644
--- a/tests/intel/gem_fence_upload.c
+++ b/tests/intel/gem_fence_upload.c
@@ -407,7 +407,7 @@ static void wc_contention(void)
 	igt_assert(tiled[1] > 0.75 * tiled[0]);
 }
 
-igt_main
+igt_main()
 {
 	igt_subtest("performance")
 		performance();
diff --git a/tests/intel/gem_fenced_exec_thrash.c b/tests/intel/gem_fenced_exec_thrash.c
index 8f8203c5bf4d..d52c02b2b8ef 100644
--- a/tests/intel/gem_fenced_exec_thrash.c
+++ b/tests/intel/gem_fenced_exec_thrash.c
@@ -191,7 +191,7 @@ static void run_test(int fd, int num_fences, int expected_errno,
 	put_ahnd(ahnd);
 }
 
-igt_main
+igt_main()
 {
 	uint32_t devid = 0;
 	unsigned int num_fences = 0;
diff --git a/tests/intel/gem_flink_basic.c b/tests/intel/gem_flink_basic.c
index 34bc2a7f5c69..ed5135b72120 100644
--- a/tests/intel/gem_flink_basic.c
+++ b/tests/intel/gem_flink_basic.c
@@ -185,7 +185,7 @@ test_flink_lifetime(int fd)
 	drm_close_driver(fd2);
 }
 
-igt_main
+igt_main()
 {
 	igt_fd_t(fd);
 
diff --git a/tests/intel/gem_flink_race.c b/tests/intel/gem_flink_race.c
index 2fd523436455..0b2b44d30420 100644
--- a/tests/intel/gem_flink_race.c
+++ b/tests/intel/gem_flink_race.c
@@ -213,7 +213,7 @@ static void test_flink_close(void)
 	igt_assert_eq(obj_count, 0);
 }
 
-igt_main
+igt_main()
 {
 	igt_subtest("flink_name")
 		test_flink_name(5);
diff --git a/tests/intel/gem_huc_copy.c b/tests/intel/gem_huc_copy.c
index d0f7793e883b..37a4044a9112 100644
--- a/tests/intel/gem_huc_copy.c
+++ b/tests/intel/gem_huc_copy.c
@@ -98,7 +98,7 @@ static void test_huc_load(int fd)
 	igt_fail_on_f(status == 0, "HuC firmware is not running!\n");
 }
 
-igt_main
+igt_main()
 {
 	int drm_fd = -1;
 	uint32_t devid;
diff --git a/tests/intel/gem_linear_blits.c b/tests/intel/gem_linear_blits.c
index ac07d4ef0adc..84d62279e8d5 100644
--- a/tests/intel/gem_linear_blits.c
+++ b/tests/intel/gem_linear_blits.c
@@ -269,7 +269,7 @@ static void run_test(int fd, int count, bool do_relocs)
 
 #define MAX_32b ((1ull << 32) - 4096)
 
-igt_main
+igt_main()
 {
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	uint64_t count = 0;
diff --git a/tests/intel/gem_lmem_evict.c b/tests/intel/gem_lmem_evict.c
index ab66e3de7417..6472f6fd58cf 100644
--- a/tests/intel/gem_lmem_evict.c
+++ b/tests/intel/gem_lmem_evict.c
@@ -93,7 +93,7 @@ static void test_dontneed_evict_race(int fd,
 	gem_close(fd, handle1);
 }
 
-igt_main
+igt_main()
 {
 	struct drm_i915_query_memory_regions *regions;
 	int i915 = -1;
diff --git a/tests/intel/gem_madvise.c b/tests/intel/gem_madvise.c
index c090f121eba2..e726f3b6993f 100644
--- a/tests/intel/gem_madvise.c
+++ b/tests/intel/gem_madvise.c
@@ -215,7 +215,7 @@ dontneed_before_exec(void)
 	drm_close_driver(fd);
 }
 
-igt_main
+igt_main()
 {
 	igt_describe("Check signal for Segmentation Fault and bus error before"
 		     " obtaining a purgeable object and calling for sighandler.");
diff --git a/tests/intel/gem_media_fill.c b/tests/intel/gem_media_fill.c
index 0ccc5497ba79..3496055b790f 100644
--- a/tests/intel/gem_media_fill.c
+++ b/tests/intel/gem_media_fill.c
@@ -140,7 +140,7 @@ static void media_fill(data_t *data, igt_fillfunc_t fill,
 	munmap(ptr, buf->surface[0].size);
 }
 
-igt_main
+igt_main()
 {
 	data_t data = {0, };
 	igt_fillfunc_t fill_fn = NULL;
diff --git a/tests/intel/gem_mmap.c b/tests/intel/gem_mmap.c
index a4ef04ddb96e..11fb5d02655f 100644
--- a/tests/intel/gem_mmap.c
+++ b/tests/intel/gem_mmap.c
@@ -203,7 +203,7 @@ static int mmap_ioctl(int i915, struct drm_i915_gem_mmap *arg)
 	return err;
 }
 
-igt_main
+igt_main()
 {
 	uint8_t expected[OBJECT_SIZE];
 	uint8_t buf[OBJECT_SIZE];
diff --git a/tests/intel/gem_mmap_gtt.c b/tests/intel/gem_mmap_gtt.c
index fe944f161e9b..1276d2cf71cf 100644
--- a/tests/intel/gem_mmap_gtt.c
+++ b/tests/intel/gem_mmap_gtt.c
@@ -1589,7 +1589,7 @@ static int mmap_ioctl(int i915, struct drm_i915_gem_mmap_gtt *arg)
 
 int fd;
 
-igt_main
+igt_main()
 {
 	if (igt_run_in_simulation())
 		OBJECT_SIZE = 1 * 1024 * 1024;
diff --git a/tests/intel/gem_mmap_offset.c b/tests/intel/gem_mmap_offset.c
index f51c1703bcb2..977b63da957f 100644
--- a/tests/intel/gem_mmap_offset.c
+++ b/tests/intel/gem_mmap_offset.c
@@ -1145,7 +1145,7 @@ static bool has_mmap_offset(int i915)
 	return mmap_gtt_version(i915) >= 4;
 }
 
-igt_main
+igt_main()
 {
 	int i915;
 
diff --git a/tests/intel/gem_mmap_wc.c b/tests/intel/gem_mmap_wc.c
index 2d77b3ede410..2b52a2954e73 100644
--- a/tests/intel/gem_mmap_wc.c
+++ b/tests/intel/gem_mmap_wc.c
@@ -519,7 +519,7 @@ static int mmap_ioctl(int i915, struct drm_i915_gem_mmap *arg)
 
 int fd;
 
-igt_main
+igt_main()
 {
 	if (igt_run_in_simulation())
 		OBJECT_SIZE = 1 * 1024 * 1024;
diff --git a/tests/intel/gem_partial_pwrite_pread.c b/tests/intel/gem_partial_pwrite_pread.c
index a1912ea82a7b..a9095df4224f 100644
--- a/tests/intel/gem_partial_pwrite_pread.c
+++ b/tests/intel/gem_partial_pwrite_pread.c
@@ -365,7 +365,7 @@ static void do_tests(data_t *data, int cache_level, const char *suffix)
 		test_partial_read_writes(data);
 }
 
-igt_main
+igt_main()
 {
 	data_t data = {0, };
 	srandom(0xdeadbeef);
diff --git a/tests/intel/gem_pipe_control_store_loop.c b/tests/intel/gem_pipe_control_store_loop.c
index 9831eb67e57b..6fce3fc10014 100644
--- a/tests/intel/gem_pipe_control_store_loop.c
+++ b/tests/intel/gem_pipe_control_store_loop.c
@@ -175,7 +175,7 @@ store_pipe_control_loop(bool preuse_buffer, int timeout)
 int fd;
 uint32_t devid;
 
-igt_main
+igt_main()
 {
 	igt_fixture() {
 		fd = drm_open_driver(DRIVER_INTEL);
diff --git a/tests/intel/gem_ppgtt.c b/tests/intel/gem_ppgtt.c
index 7e242ae24c5b..8e388e31014b 100644
--- a/tests/intel/gem_ppgtt.c
+++ b/tests/intel/gem_ppgtt.c
@@ -408,7 +408,7 @@ static bool has_contexts(void)
 	return result;
 }
 
-igt_main
+igt_main()
 {
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 
diff --git a/tests/intel/gem_pread_after_blit.c b/tests/intel/gem_pread_after_blit.c
index 8b0ecfe317f8..a0ff7da0a31a 100644
--- a/tests/intel/gem_pread_after_blit.c
+++ b/tests/intel/gem_pread_after_blit.c
@@ -228,7 +228,7 @@ static void do_test(struct buf_ops *bops, int cache_level,
 	intel_bb_destroy(ibb);
 }
 
-igt_main
+igt_main()
 {
 	const uint32_t start[2] = {0, 1024 * 1024 / 4};
 	const struct {
diff --git a/tests/intel/gem_pxp.c b/tests/intel/gem_pxp.c
index 73ba7c230546..0922b3afdce5 100644
--- a/tests/intel/gem_pxp.c
+++ b/tests/intel/gem_pxp.c
@@ -1299,7 +1299,7 @@ static void require_init_powermgt(int i915, struct powermgt_data *pm)
 		init_powermgt_resources(i915, pm);
 }
 
-igt_main
+igt_main()
 {
 	int i915 = -1;
 	bool pxp_supported = false;
diff --git a/tests/intel/gem_read_read_speed.c b/tests/intel/gem_read_read_speed.c
index 1570f990a157..1c80c9e21fe3 100644
--- a/tests/intel/gem_read_read_speed.c
+++ b/tests/intel/gem_read_read_speed.c
@@ -242,7 +242,7 @@ static void run(struct buf_ops *bops, int _width, int _height,
 	intel_buf_destroy(bcs);
 }
 
-igt_main
+igt_main()
 {
 	const int sizes[] = {128, 256, 512, 1024, 2048, 4096, 8192, 0};
 	struct buf_ops *bops = NULL;
diff --git a/tests/intel/gem_readwrite.c b/tests/intel/gem_readwrite.c
index 98f629af49aa..c3089ceb1716 100644
--- a/tests/intel/gem_readwrite.c
+++ b/tests/intel/gem_readwrite.c
@@ -95,7 +95,7 @@ do_write(int fd, int handle, void *buf, int offset, int size)
 int fd;
 uint32_t handle;
 
-igt_main
+igt_main()
 {
 	uint8_t expected[OBJECT_SIZE];
 	uint8_t buf[OBJECT_SIZE];
diff --git a/tests/intel/gem_reg_read.c b/tests/intel/gem_reg_read.c
index 3d760313cb34..028f6cd225d4 100644
--- a/tests/intel/gem_reg_read.c
+++ b/tests/intel/gem_reg_read.c
@@ -159,7 +159,7 @@ retry:
 
 }
 
-igt_main
+igt_main()
 {
 	uint64_t val = 0;
 	int fd = -1;
diff --git a/tests/intel/gem_render_copy_redux.c b/tests/intel/gem_render_copy_redux.c
index 9acd7207f9e7..169feeae5f27 100644
--- a/tests/intel/gem_render_copy_redux.c
+++ b/tests/intel/gem_render_copy_redux.c
@@ -217,7 +217,7 @@ static void copy_flink(data_t *data)
 	data_fini(&local);
 }
 
-igt_main
+igt_main()
 {
 	data_t data = {0, };
 
diff --git a/tests/intel/gem_render_linear_blits.c b/tests/intel/gem_render_linear_blits.c
index 09ef22899bd8..bf49a4a990c2 100644
--- a/tests/intel/gem_render_linear_blits.c
+++ b/tests/intel/gem_render_linear_blits.c
@@ -178,7 +178,7 @@ static void run_test (int fd, int count)
 	buf_ops_destroy(bops);
 }
 
-igt_main
+igt_main()
 {
 	static int fd = 0;
 	int count=0;
diff --git a/tests/intel/gem_render_tiled_blits.c b/tests/intel/gem_render_tiled_blits.c
index 64ac1ec2f151..7b82e7b28c4c 100644
--- a/tests/intel/gem_render_tiled_blits.c
+++ b/tests/intel/gem_render_tiled_blits.c
@@ -229,7 +229,7 @@ static void run_test (int fd, int count)
 }
 
 
-igt_main
+igt_main()
 {
 	int fd = 0;
 	int count = 0;
diff --git a/tests/intel/gem_request_retire.c b/tests/intel/gem_request_retire.c
index 77e466c286c6..b1de40563d61 100644
--- a/tests/intel/gem_request_retire.c
+++ b/tests/intel/gem_request_retire.c
@@ -116,7 +116,7 @@ test_retire_vma_not_inactive(int fd)
 	put_ahnd(ahnd);
 }
 
-igt_main
+igt_main()
 {
 	igt_fd_t(fd);
 
diff --git a/tests/intel/gem_reset_stats.c b/tests/intel/gem_reset_stats.c
index e0fe9c420e71..02ab8076c57a 100644
--- a/tests/intel/gem_reset_stats.c
+++ b/tests/intel/gem_reset_stats.c
@@ -1080,7 +1080,7 @@ static void test_shared_reset_domain(const intel_ctx_cfg_t *base_cfg,
 #define RUN_TEST(...) do { sync_gpu(); __VA_ARGS__; sync_gpu(); } while (0)
 #define RUN_CTX_TEST(...) do { check_context(e); RUN_TEST(__VA_ARGS__); } while (0)
 
-igt_main
+igt_main()
 {
 	const struct intel_execution_ring *e;
 
diff --git a/tests/intel/gem_ringfill.c b/tests/intel/gem_ringfill.c
index 8a032d32c2f7..233a6eae12c3 100644
--- a/tests/intel/gem_ringfill.c
+++ b/tests/intel/gem_ringfill.c
@@ -391,7 +391,7 @@ static bool has_lut_handle(int i915)
 	return result;
 }
 
-igt_main
+igt_main()
 {
 	const struct {
 		const char *suffix;
diff --git a/tests/intel/gem_set_tiling_vs_blt.c b/tests/intel/gem_set_tiling_vs_blt.c
index b110c76be0fc..e63958a8e056 100644
--- a/tests/intel/gem_set_tiling_vs_blt.c
+++ b/tests/intel/gem_set_tiling_vs_blt.c
@@ -234,7 +234,7 @@ static void do_test(struct buf_ops *bops, uint32_t tiling, unsigned stride,
 	igt_info("done\n");
 }
 
-igt_main
+igt_main()
 {
 	int fd, i;
 	uint32_t tiling, tiling_after;
diff --git a/tests/intel/gem_shrink.c b/tests/intel/gem_shrink.c
index 0ade4f9b31f0..c332c084c302 100644
--- a/tests/intel/gem_shrink.c
+++ b/tests/intel/gem_shrink.c
@@ -513,7 +513,7 @@ static void reclaim(unsigned engine, int timeout)
 	drm_close_driver(fd);
 }
 
-igt_main
+igt_main()
 {
 	const struct test {
 		const char *name;
diff --git a/tests/intel/gem_softpin.c b/tests/intel/gem_softpin.c
index dfa33b7c7a38..a86151a14e9b 100644
--- a/tests/intel/gem_softpin.c
+++ b/tests/intel/gem_softpin.c
@@ -1464,7 +1464,7 @@ static void safe_alignment(int i915)
 	igt_subtest_with_dynamic(T) for_each_ctx_engine(i915, ctx, e) \
 		igt_dynamic_f("%s", e->name)
 
-igt_main
+igt_main()
 {
 	const struct intel_execution_engine2 *e;
 	int fd = -1;
diff --git a/tests/intel/gem_spin_batch.c b/tests/intel/gem_spin_batch.c
index 72fd736e902d..7aaa26fde61e 100644
--- a/tests/intel/gem_spin_batch.c
+++ b/tests/intel/gem_spin_batch.c
@@ -241,7 +241,7 @@ static bool has_userptr(int fd)
 	return err == EFAULT;
 }
 
-igt_main
+igt_main()
 {
 	const struct intel_execution_engine2 *e2;
 	const struct intel_execution_ring *e;
diff --git a/tests/intel/gem_streaming_writes.c b/tests/intel/gem_streaming_writes.c
index 7e1b65cf1fd5..40c158c3fdec 100644
--- a/tests/intel/gem_streaming_writes.c
+++ b/tests/intel/gem_streaming_writes.c
@@ -419,7 +419,7 @@ static void test_batch(int fd, int mode, int reverse)
 	gem_close(fd, dst);
 }
 
-igt_main
+igt_main()
 {
 	int fd, sync;
 
diff --git a/tests/intel/gem_sync.c b/tests/intel/gem_sync.c
index 95e40f7802a1..bf99d695d709 100644
--- a/tests/intel/gem_sync.c
+++ b/tests/intel/gem_sync.c
@@ -1365,7 +1365,7 @@ preempt(int fd, const intel_ctx_t *ctx, unsigned ring,
 	intel_ctx_destroy(fd, tmp_ctx[0]);
 }
 
-igt_main
+igt_main()
 {
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	const struct {
diff --git a/tests/intel/gem_tiled_blits.c b/tests/intel/gem_tiled_blits.c
index 183c938dd26a..3345be61ad01 100644
--- a/tests/intel/gem_tiled_blits.c
+++ b/tests/intel/gem_tiled_blits.c
@@ -185,7 +185,7 @@ static void run_test(int fd, int count)
 
 #define MAX_32b ((1ull << 32) - 4096)
 
-igt_main
+igt_main()
 {
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	uint64_t count = 0;
diff --git a/tests/intel/gem_tiled_fence_blits.c b/tests/intel/gem_tiled_fence_blits.c
index 7a81074f0634..035716e1f6e8 100644
--- a/tests/intel/gem_tiled_fence_blits.c
+++ b/tests/intel/gem_tiled_fence_blits.c
@@ -292,7 +292,7 @@ static void run_test(int fd, int count, uint64_t end)
 
 #define MAX_32b ((1ull << 32) - 4096)
 
-igt_main
+igt_main()
 {
 	/*
 	 * For machines with many cpu cores buffer verification can take
diff --git a/tests/intel/gem_tiled_partial_pwrite_pread.c b/tests/intel/gem_tiled_partial_pwrite_pread.c
index 68fc64e3eea2..a1fbb70c078c 100644
--- a/tests/intel/gem_tiled_partial_pwrite_pread.c
+++ b/tests/intel/gem_tiled_partial_pwrite_pread.c
@@ -286,7 +286,7 @@ static bool known_swizzling(uint32_t handle)
 	return arg.phys_swizzle_mode == arg.swizzle_mode;
 }
 
-igt_main
+igt_main()
 {
 	srandom(0xdeadbeef);
 
diff --git a/tests/intel/gem_tiled_swapping.c b/tests/intel/gem_tiled_swapping.c
index 23be1b7232d9..7ec468baa837 100644
--- a/tests/intel/gem_tiled_swapping.c
+++ b/tests/intel/gem_tiled_swapping.c
@@ -176,7 +176,7 @@ static void check_memory_layout(int fd)
 	igt_debug("normal memory configuration detected, continuing\n");
 }
 
-igt_main
+igt_main()
 {
 	unsigned long n, count;
 	struct thread *threads;
diff --git a/tests/intel/gem_vm_create.c b/tests/intel/gem_vm_create.c
index 435549cdfec9..ae9fc828a60b 100644
--- a/tests/intel/gem_vm_create.c
+++ b/tests/intel/gem_vm_create.c
@@ -380,7 +380,7 @@ static void isolation(int i915)
 	gem_vm_destroy(i915, vm[0]);
 }
 
-igt_main
+igt_main()
 {
 	int i915 = -1;
 
diff --git a/tests/intel/gem_wait.c b/tests/intel/gem_wait.c
index 6247ed7441ad..eb7cc3956255 100644
--- a/tests/intel/gem_wait.c
+++ b/tests/intel/gem_wait.c
@@ -229,7 +229,7 @@ static void test_all_engines(const char *name, int i915, const intel_ctx_t *ctx,
 	}
 }
 
-igt_main
+igt_main()
 {
 	const intel_ctx_t *ctx;
 	int fd = -1;
diff --git a/tests/intel/gem_watchdog.c b/tests/intel/gem_watchdog.c
index 6d9b95018766..974aba7fe1e8 100644
--- a/tests/intel/gem_watchdog.c
+++ b/tests/intel/gem_watchdog.c
@@ -553,7 +553,7 @@ far_fence(int i915, int timeout, const intel_ctx_t *ctx,
 	close(fence);
 }
 
-igt_main
+igt_main()
 {
 	const struct intel_execution_engine2 *e;
 	const intel_ctx_t *ctx;
diff --git a/tests/intel/gem_workarounds.c b/tests/intel/gem_workarounds.c
index 54fd2c4c13e1..b5440840e282 100644
--- a/tests/intel/gem_workarounds.c
+++ b/tests/intel/gem_workarounds.c
@@ -276,7 +276,7 @@ static void check_workarounds(int fd, enum operation op, unsigned int flags)
 		drm_close_driver(fd);
 }
 
-igt_main
+igt_main()
 {
 	struct intel_mmio_data mmio_data;
 	const struct {
diff --git a/tests/intel/gen7_exec_parse.c b/tests/intel/gen7_exec_parse.c
index de92f9e186b4..671cbd12426e 100644
--- a/tests/intel/gen7_exec_parse.c
+++ b/tests/intel/gen7_exec_parse.c
@@ -482,7 +482,7 @@ static void hsw_load_register_reg(void)
 	drm_close_driver(fd);
 }
 
-igt_main
+igt_main()
 {
 	uint32_t handle;
 	int fd;
diff --git a/tests/intel/gen9_exec_parse.c b/tests/intel/gen9_exec_parse.c
index 6fc76ae9317f..e7f65dd6af2b 100644
--- a/tests/intel/gen9_exec_parse.c
+++ b/tests/intel/gen9_exec_parse.c
@@ -1206,7 +1206,7 @@ static void test_shadow_peek(int fd)
 		gem_close(fd, exec[i].handle);
 }
 
-igt_main
+igt_main()
 {
 	uint32_t handle;
 	int i915;
diff --git a/tests/intel/i915_drm_fdinfo.c b/tests/intel/i915_drm_fdinfo.c
index 4505dea9ce64..94b009b80f14 100644
--- a/tests/intel/i915_drm_fdinfo.c
+++ b/tests/intel/i915_drm_fdinfo.c
@@ -930,7 +930,7 @@ test_memory(int i915, struct gem_memory_region *mr, unsigned int flags)
 	igt_subtest_with_dynamic(T) for_each_ctx_engine(i915, ctx, e) \
 		igt_dynamic_f("%s", e->name)
 
-igt_main
+igt_main()
 {
 	unsigned int num_engines = 0, num_classes = 0;
 	const struct intel_execution_engine2 *e;
diff --git a/tests/intel/i915_fb_tiling.c b/tests/intel/i915_fb_tiling.c
index 508f8f3ff389..23ee053d0d51 100644
--- a/tests/intel/i915_fb_tiling.c
+++ b/tests/intel/i915_fb_tiling.c
@@ -37,7 +37,7 @@
 
 IGT_TEST_DESCRIPTION("Object tiling must be fixed after framebuffer creation.");
 
-igt_main
+igt_main()
 {
 	int drm_fd;
 	struct igt_fb fb;
diff --git a/tests/intel/i915_getparams_basic.c b/tests/intel/i915_getparams_basic.c
index e52fbab6cf19..59f97bd65a1d 100644
--- a/tests/intel/i915_getparams_basic.c
+++ b/tests/intel/i915_getparams_basic.c
@@ -162,7 +162,7 @@ exit_handler(int sig)
 	deinit();
 }
 
-igt_main
+igt_main()
 {
 	igt_fixture() {
 		igt_install_exit_handler(exit_handler);
diff --git a/tests/intel/i915_hangman.c b/tests/intel/i915_hangman.c
index 78c96b0d906f..dc18eb3a82de 100644
--- a/tests/intel/i915_hangman.c
+++ b/tests/intel/i915_hangman.c
@@ -567,7 +567,7 @@ static void do_tests(const char *name, const char *prefix,
 	}
 }
 
-igt_main
+igt_main()
 {
 	const intel_ctx_t *ctx;
 	igt_hang_t hang = {};
diff --git a/tests/intel/i915_module_load.c b/tests/intel/i915_module_load.c
index 2047d1886ac8..be908c4a9ba9 100644
--- a/tests/intel/i915_module_load.c
+++ b/tests/intel/i915_module_load.c
@@ -361,7 +361,7 @@ static uint32_t  driver_load_with_lmem_bar_size(uint32_t lmem_bar_size, bool che
 	return lmem_bar_size;
 }
 
-igt_main
+igt_main()
 {
 	igt_describe("Check if i915 and friends are not yet loaded, then load them.");
 	igt_subtest("load") {
diff --git a/tests/intel/i915_pm_freq_api.c b/tests/intel/i915_pm_freq_api.c
index f4bd3cb9e5df..a41b0e658df7 100644
--- a/tests/intel/i915_pm_freq_api.c
+++ b/tests/intel/i915_pm_freq_api.c
@@ -159,7 +159,7 @@ static void restore_sysfs_freq(int sig)
 	drm_close_driver(i915);
 }
 
-igt_main
+igt_main()
 {
 	igt_fixture() {
 		int num_gts, dirfd, gt;
diff --git a/tests/intel/i915_pm_freq_mult.c b/tests/intel/i915_pm_freq_mult.c
index 05b55124c012..0e8f6a255008 100644
--- a/tests/intel/i915_pm_freq_mult.c
+++ b/tests/intel/i915_pm_freq_mult.c
@@ -164,7 +164,7 @@ static void media_freq(int gt, int dir)
 	cleanup(dir);
 }
 
-igt_main
+igt_main()
 {
 	int dir, gt;
 
diff --git a/tests/intel/i915_pm_rc6_residency.c b/tests/intel/i915_pm_rc6_residency.c
index 3d6bb5a6f445..22267b7c26e5 100644
--- a/tests/intel/i915_pm_rc6_residency.c
+++ b/tests/intel/i915_pm_rc6_residency.c
@@ -601,7 +601,7 @@ static unsigned int rc6_enabled_mask(int i915, int dirfd)
 	return get_rc6_enabled_mask(dirfd);
 }
 
-igt_main
+igt_main()
 {
 	int i915 = -1;
 	unsigned int dirfd, gt;
diff --git a/tests/intel/i915_pm_rps.c b/tests/intel/i915_pm_rps.c
index 061fddc6a7a8..8c3089b56d6d 100644
--- a/tests/intel/i915_pm_rps.c
+++ b/tests/intel/i915_pm_rps.c
@@ -1201,7 +1201,7 @@ static void read_sysfs_freq(char *sysfs_path)
 	}
 }
 
-igt_main
+igt_main()
 {
 	int tmp, gt;
 
diff --git a/tests/intel/i915_pm_sseu.c b/tests/intel/i915_pm_sseu.c
index 85493b83d26d..ad852579a23a 100644
--- a/tests/intel/i915_pm_sseu.c
+++ b/tests/intel/i915_pm_sseu.c
@@ -387,7 +387,7 @@ exit_handler(int sig)
 	gem_deinit();
 }
 
-igt_main
+igt_main()
 {
 	igt_fixture() {
 		igt_install_exit_handler(exit_handler);
diff --git a/tests/intel/i915_power.c b/tests/intel/i915_power.c
index 8fff552cc37b..f2362a4f7586 100644
--- a/tests/intel/i915_power.c
+++ b/tests/intel/i915_power.c
@@ -75,7 +75,7 @@ static void sanity(int i915)
 	igt_assert(idle >= 0 && busy > 0 && busy > idle);
 }
 
-igt_main
+igt_main()
 {
 	int i915;
 
diff --git a/tests/intel/i915_query.c b/tests/intel/i915_query.c
index 25443f6f35b9..dc0568874e86 100644
--- a/tests/intel/i915_query.c
+++ b/tests/intel/i915_query.c
@@ -1436,7 +1436,7 @@ static void query_parse_and_validate_hwconfig_table(int i915)
 	free(data);
 }
 
-igt_main
+igt_main()
 {
 	int fd = -1;
 	int devid;
diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c
index 824e6f5b9590..1d624cf1ed50 100644
--- a/tests/intel/i915_selftest.c
+++ b/tests/intel/i915_selftest.c
@@ -638,7 +638,7 @@
 
 IGT_TEST_DESCRIPTION("Basic unit tests for i915.ko");
 
-igt_main
+igt_main()
 {
 	const char *env = getenv("SELFTESTS") ?: "";
 	char opts[1024];
diff --git a/tests/intel/i915_suspend.c b/tests/intel/i915_suspend.c
index 881b49bda2d6..e2c332ef11be 100644
--- a/tests/intel/i915_suspend.c
+++ b/tests/intel/i915_suspend.c
@@ -298,7 +298,7 @@ test_suspend_without_i915(int state)
 
 int fd;
 
-igt_main
+igt_main()
 {
 	igt_describe("Validate suspend-to-idle without i915 module");
 	igt_subtest("basic-s2idle-without-i915")
diff --git a/tests/intel/intel_hwmon.c b/tests/intel/intel_hwmon.c
index a700f69769b2..8b02b5fa1077 100644
--- a/tests/intel/intel_hwmon.c
+++ b/tests/intel/intel_hwmon.c
@@ -76,7 +76,7 @@ static void hwmon_write(int hwm)
 	closedir(dir);
 }
 
-igt_main
+igt_main()
 {
 	int fd, hwm;
 
diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index e7123cabcedf..3371c06787c2 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -967,7 +967,7 @@ static bool test_requirements(data_t *input_data, int l)
 	return true;
 }
 
-igt_main
+igt_main()
 {
 	igt_fixture() {
 		drmModeResPtr res;
diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index f1595818c1bd..c9e2e3fb925e 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -340,7 +340,7 @@ static void run_cdclk_test(data_t *data, uint32_t flags)
 	}
 }
 
-igt_main
+igt_main()
 {
 	data_t data = {};
 
diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index f25226da86a6..dfa5aa04acab 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -350,7 +350,7 @@ static void run_test(data_t *data)
 	intel_buf_destroy(dst);
 }
 
-igt_main
+igt_main()
 {
 	data_t data = {};
 
diff --git a/tests/intel/kms_dp_link_training.c b/tests/intel/kms_dp_link_training.c
index 7c1a97d022bd..64af89d1bcce 100644
--- a/tests/intel/kms_dp_link_training.c
+++ b/tests/intel/kms_dp_link_training.c
@@ -298,7 +298,7 @@ static bool test_link_rate(data_t *data, bool mst, bool uhbr)
 IGT_TEST_DESCRIPTION("Test to validate link training on SST/MST with "
 		     "UHBR/NON_UHBR rates");
 
-igt_main
+igt_main()
 {
 	data_t data = {};
 
diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index b5e9e07774da..db9039f061a0 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -597,7 +597,7 @@ static bool run_dsc_sst_fallaback_test(data_t *data)
 	return ran;
 }
 
-igt_main
+igt_main()
 {
 	data_t data = {};
 
diff --git a/tests/intel/kms_draw_crc.c b/tests/intel/kms_draw_crc.c
index 073a0084a7f1..0f2144cd5d2f 100644
--- a/tests/intel/kms_draw_crc.c
+++ b/tests/intel/kms_draw_crc.c
@@ -328,7 +328,7 @@ static const char *modifier_str(int modifier_index)
 	}
 }
 
-igt_main
+igt_main()
 {
 	enum igt_draw_method method;
 	int format_idx, modifier_idx;
diff --git a/tests/intel/kms_fb_coherency.c b/tests/intel/kms_fb_coherency.c
index 298cd7946086..d3a998f6a034 100644
--- a/tests/intel/kms_fb_coherency.c
+++ b/tests/intel/kms_fb_coherency.c
@@ -234,7 +234,7 @@ static void select_valid_pipe_output_combo(data_t *data)
 	igt_skip("no valid crtc/connector combinations found\n");
 }
 
-igt_main
+igt_main()
 {
 	data_t data;
 
diff --git a/tests/intel/kms_fbc_dirty_rect.c b/tests/intel/kms_fbc_dirty_rect.c
index c8b85545cd17..55422909d2a6 100644
--- a/tests/intel/kms_fbc_dirty_rect.c
+++ b/tests/intel/kms_fbc_dirty_rect.c
@@ -436,7 +436,7 @@ static void fbc_dirty_rectangle_test(data_t *data, void (*test_func)(data_t *))
 	cleanup(data);
 }
 
-igt_main
+igt_main()
 {
 	data_t data = {0};
 
diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index a410b2e0be6d..50cd650f4ea6 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -451,7 +451,7 @@ static void teardown_environment(struct drm_info *drm)
 	kmstest_restore_vt_mode();
 }
 
-igt_main
+igt_main()
 {
 	struct drm_info drm = { .fd = -1 };
 
diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_scaled_crc.c
index 9daf045c4d8e..ab60d1d43bfc 100644
--- a/tests/intel/kms_flip_scaled_crc.c
+++ b/tests/intel/kms_flip_scaled_crc.c
@@ -714,7 +714,7 @@ static void run_tests(data_t *data, uint32_t index, enum pipe pipe,
 		test_flip_to_scaled(data, index, pipe, output, modetoset, 1);
 }
 
-igt_main
+igt_main()
 {
 	enum pipe pipe;
 	data_t data = {};
diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
index aba8949514d2..1eac7978e8a9 100644
--- a/tests/intel/kms_flip_tiling.c
+++ b/tests/intel/kms_flip_tiling.c
@@ -209,7 +209,7 @@ static void handle_lost_event(data_t *data) {
 static data_t data = {};
 igt_output_t *output;
 
-igt_main
+igt_main()
 {
 	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 07efc74e6f14..565cf66d9b6d 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -545,7 +545,7 @@ static void test_basic_max_non_joiner(data_t *data)
 	}
 }
 
-igt_main
+igt_main()
 {
 	bool ultra_joiner_supported, is_dgfx;
 	int i, j, display_ver;
diff --git a/tests/intel/kms_legacy_colorkey.c b/tests/intel/kms_legacy_colorkey.c
index db674dc255fa..221c009a4fb9 100644
--- a/tests/intel/kms_legacy_colorkey.c
+++ b/tests/intel/kms_legacy_colorkey.c
@@ -58,7 +58,7 @@ static void test_plane(uint32_t plane_id, int expected_ret)
 				   sizeof(ckey)) == expected_ret);
 }
 
-igt_main
+igt_main()
 {
 	igt_fixture() {
 		drm_fd = drm_open_driver_master(DRIVER_INTEL);
diff --git a/tests/intel/kms_pipe_b_c_ivb.c b/tests/intel/kms_pipe_b_c_ivb.c
index 7960dbc9be4f..bf48f018d92a 100644
--- a/tests/intel/kms_pipe_b_c_ivb.c
+++ b/tests/intel/kms_pipe_b_c_ivb.c
@@ -289,7 +289,7 @@ test_fail_enable_pipe_C_while_B_has_3_lanes(data_t *data)
 }
 
 static data_t data;
-igt_main
+igt_main()
 {
 	int devid;
 
diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index 525c6810e3d7..700013908ab1 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -856,7 +856,7 @@ struct data data = {
 };
 
 
-igt_main {
+igt_main() {
 	uint8_t format_idx = 0, tiling_idx = 0;
 
 	igt_fixture() {
diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
index 6cf16a460a68..a61ca91a5f8b 100644
--- a/tests/intel/kms_pm_backlight.c
+++ b/tests/intel/kms_pm_backlight.c
@@ -202,7 +202,7 @@ static void test_setup(igt_display_t display, igt_output_t *output)
 	}
 }
 
-igt_main
+igt_main()
 {
 	int fd;
 	int i = 0;
diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 475e64a21f4a..ccfdeb0644d9 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -730,7 +730,7 @@ static void kms_poll_state_restore(int sig)
 	}
 }
 
-igt_main
+igt_main()
 {
 	data_t data = {};
 
diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
index 231a1b1c833e..109a9ed0cf40 100644
--- a/tests/intel/kms_pm_lpsp.c
+++ b/tests/intel/kms_pm_lpsp.c
@@ -192,7 +192,7 @@ static void test_lpsp(data_t *data)
 }
 
 IGT_TEST_DESCRIPTION("These tests validates display Low Power Single Pipe configurations");
-igt_main
+igt_main()
 {
 	data_t data = {};
 
diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index ec6dc3f0f092..ccf239b4c16f 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -769,7 +769,7 @@ static void dpms_off_on(data_t *data)
 
 data_t data = {};
 
-igt_main
+igt_main()
 {
 	int z, y;
 	enum operations op;
diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 9437d65e42c5..f08d117c3d64 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -1172,7 +1172,7 @@ static void run_plane_update_continuous(data_t data, int i, int coexist_features
 	}
 }
 
-igt_main
+igt_main()
 {
 	bool output_supports_pr_psr2_sel_fetch = false;
 	bool pr_psr2_sel_fetch_supported = false;
diff --git a/tests/intel/kms_psr2_su.c b/tests/intel/kms_psr2_su.c
index fc6b30f2fdfd..5732f0a3dce7 100644
--- a/tests/intel/kms_psr2_su.c
+++ b/tests/intel/kms_psr2_su.c
@@ -309,7 +309,7 @@ static int check_psr2_support(data_t *data, enum pipe pipe)
 	return status;
 }
 
-igt_main
+igt_main()
 {
 	data_t data = {};
 	enum pipe pipe;
diff --git a/tests/intel/kms_psr_stress_test.c b/tests/intel/kms_psr_stress_test.c
index 356e9fe01a65..80394166e936 100644
--- a/tests/intel/kms_psr_stress_test.c
+++ b/tests/intel/kms_psr_stress_test.c
@@ -348,7 +348,7 @@ static void run(data_t *data)
 	psr_sink_error_check(data->debugfs_fd, data->initial_state, data->output);
 }
 
-igt_main
+igt_main()
 {
 	data_t data = {};
 
diff --git a/tests/intel/perf.c b/tests/intel/perf.c
index ee607b13efb2..110f4659e0be 100644
--- a/tests/intel/perf.c
+++ b/tests/intel/perf.c
@@ -5857,7 +5857,7 @@ test_group_concurrent_oa_buffer_read(void)
 	igt_waitchildren();
 }
 
-igt_main
+igt_main()
 {
 	const intel_ctx_t *ctx;
 	const struct intel_execution_engine2 *e;
diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index f7d3e0cefbd5..6775b7f9065b 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -2278,7 +2278,7 @@ static void restore_sysfs_freq(int i915)
 	free(stash_boost);
 }
 
-igt_main
+igt_main()
 {
 	const struct intel_execution_engine2 *e;
 	unsigned int num_engines = 0;
diff --git a/tests/intel/prime_busy.c b/tests/intel/prime_busy.c
index ee4c7c73ab2c..62ae30f6f057 100644
--- a/tests/intel/prime_busy.c
+++ b/tests/intel/prime_busy.c
@@ -148,7 +148,7 @@ static void test_mode(int fd, const intel_ctx_t *ctx, unsigned int flags)
 		igt_disallow_hang(fd, hang);
 }
 
-igt_main
+igt_main()
 {
 	const intel_ctx_t *ctx;
 	int fd = -1;
diff --git a/tests/intel/prime_mmap.c b/tests/intel/prime_mmap.c
index c3990d6edc98..7299ac47a33f 100644
--- a/tests/intel/prime_mmap.c
+++ b/tests/intel/prime_mmap.c
@@ -537,7 +537,7 @@ static bool check_skip(uint32_t skip, uint32_t region)
 	return false;
 }
 
-igt_main
+igt_main()
 {
 	struct igt_collection *set, *regions, *dma_buf_set;
 	struct drm_i915_query_memory_regions *query_info;
diff --git a/tests/intel/prime_mmap_coherency.c b/tests/intel/prime_mmap_coherency.c
index cbed906de44e..7ca88c32a861 100644
--- a/tests/intel/prime_mmap_coherency.c
+++ b/tests/intel/prime_mmap_coherency.c
@@ -307,7 +307,7 @@ static void test_ioctl_errors(void)
 	}
 }
 
-igt_main
+igt_main()
 {
 	struct igt_collection *set, *dma_buf_set;
 	struct drm_i915_query_memory_regions *query_info;
diff --git a/tests/intel/prime_mmap_kms.c b/tests/intel/prime_mmap_kms.c
index 4480f0c1cfef..b8b3ea277ccd 100644
--- a/tests/intel/prime_mmap_kms.c
+++ b/tests/intel/prime_mmap_kms.c
@@ -257,7 +257,7 @@ check_for_dma_buf_mmap(int fd)
 	return ret;
 }
 
-igt_main
+igt_main()
 {
 	gpu_process_t gpu;
 
diff --git a/tests/intel/prime_self_import.c b/tests/intel/prime_self_import.c
index 62d7431c2d3e..0d21476be242 100644
--- a/tests/intel/prime_self_import.c
+++ b/tests/intel/prime_self_import.c
@@ -458,7 +458,7 @@ static void test_llseek_bad(void)
 	drm_close_driver(fd);
 }
 
-igt_main
+igt_main()
 {
 	struct {
 		const char *name;
diff --git a/tests/intel/sysfs_defaults.c b/tests/intel/sysfs_defaults.c
index 641c2de1bf30..3b13b2834631 100644
--- a/tests/intel/sysfs_defaults.c
+++ b/tests/intel/sysfs_defaults.c
@@ -91,7 +91,7 @@ static void test_writable(int i915, int engine)
 	closedir(dir);
 }
 
-igt_main
+igt_main()
 {
 	int i915 = -1, engines = -1;
 
diff --git a/tests/intel/sysfs_heartbeat_interval.c b/tests/intel/sysfs_heartbeat_interval.c
index afee2ef80684..44bb3a850927 100644
--- a/tests/intel/sysfs_heartbeat_interval.c
+++ b/tests/intel/sysfs_heartbeat_interval.c
@@ -487,7 +487,7 @@ static void test_off(int i915, int engine)
 	put_ahnd(ahnd);
 }
 
-igt_main
+igt_main()
 {
 	static const struct {
 		const char *name;
diff --git a/tests/intel/sysfs_preempt_timeout.c b/tests/intel/sysfs_preempt_timeout.c
index 5c7ff672ea81..827e2eb93537 100644
--- a/tests/intel/sysfs_preempt_timeout.c
+++ b/tests/intel/sysfs_preempt_timeout.c
@@ -332,7 +332,7 @@ static void test_off(int i915, int engine)
 	set_preempt_timeout(engine, saved);
 }
 
-igt_main
+igt_main()
 {
 	static const struct {
 		const char *name;
diff --git a/tests/intel/sysfs_timeslice_duration.c b/tests/intel/sysfs_timeslice_duration.c
index ea4ea7a8d289..2e25690da22b 100644
--- a/tests/intel/sysfs_timeslice_duration.c
+++ b/tests/intel/sysfs_timeslice_duration.c
@@ -556,7 +556,7 @@ static void test_off(int i915, int engine)
 	set_timeslice(engine, saved);
 }
 
-igt_main
+igt_main()
 {
 	static const struct {
 		const char *name;
diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 96abbc879281..2e676b93b04c 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -510,7 +510,7 @@ test_compute_square(int fd)
 		      "GPU not supported\n");
 }
 
-igt_main
+igt_main()
 {
 	int xe, ccs_mode[4];
 	unsigned int ip_ver;
diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
index b13285eef7d4..414d17f50047 100644
--- a/tests/intel/xe_compute_preempt.c
+++ b/tests/intel/xe_compute_preempt.c
@@ -62,7 +62,7 @@ test_compute_preempt(int fd, struct drm_xe_engine_class_instance *hwe, bool thre
 
 #define CONTEXT_MB 100
 
-igt_main
+igt_main()
 {
 	int xe;
 	struct drm_xe_engine_class_instance *hwe;
diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 2cebeae55282..5599102117b1 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -309,7 +309,7 @@ static int create_device_configfs_group(int configfs_fd)
 	return configfs_device_fd;
 }
 
-igt_main
+igt_main()
 {
 	int fd, configfs_fd, configfs_device_fd;
 	uint32_t devid;
diff --git a/tests/intel/xe_dma_buf_sync.c b/tests/intel/xe_dma_buf_sync.c
index 0a8a3c5a1a66..07099a8c92d4 100644
--- a/tests/intel/xe_dma_buf_sync.c
+++ b/tests/intel/xe_dma_buf_sync.c
@@ -226,7 +226,7 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
 		drm_close_driver(fd[i]);
 }
 
-igt_main
+igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe, *hwe0 = NULL, *hwe1;
 	int fd;
diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index f863cb519a9b..fe6f8539767e 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -728,7 +728,7 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
 	xe_vm_destroy(fd, vm);
 }
 
-igt_main
+igt_main()
 {
 	const struct section {
 		const char *name;
diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index fa4d5361cad9..b037bb97f088 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -2794,7 +2794,7 @@ static void test_basic_exec_queues_enable(int fd)
 	xe_vm_destroy(fd, vm_non_lr);
 }
 
-igt_main
+igt_main()
 {
 	bool was_enabled;
 	bool *multigpu_was_enabled;
diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index a3e8d60953c9..3b83e3301c71 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -2587,7 +2587,7 @@ static bool restore_preempt_timeout(int fd, uint16_t engine_class, uint32_t pree
 			igt_dynamic_f("%s%d", xe_engine_class_string(__hwe->engine_class), \
 				      hwe->engine_instance)
 
-igt_main
+igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
 	bool was_enabled;
diff --git a/tests/intel/xe_eudebug_sriov.c b/tests/intel/xe_eudebug_sriov.c
index c5178fd48d66..0f857639a01b 100644
--- a/tests/intel/xe_eudebug_sriov.c
+++ b/tests/intel/xe_eudebug_sriov.c
@@ -126,7 +126,7 @@ static void restore_initial_driver_state(int fd, bool eudebug_enabled, bool vf_a
 	igt_abort_on_f(abort, "Failed to restore initial driver state\n");
 }
 
-igt_main
+igt_main()
 {
 	bool eudebug_enabled;
 	bool vf_autoprobe;
diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 2815250ce8f5..839a39a76a1d 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -676,7 +676,7 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
  * sections exists which cover multiple compute VM, multiple non-compute VMs,
  * and mixing of VMs.
  */
-igt_main
+igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
 	const struct section {
diff --git a/tests/intel/xe_exec_atomic.c b/tests/intel/xe_exec_atomic.c
index f42f93c1782c..61a860b3cc7f 100644
--- a/tests/intel/xe_exec_atomic.c
+++ b/tests/intel/xe_exec_atomic.c
@@ -123,7 +123,7 @@ static bool has_atomics(int fd, uint32_t region)
 	return true;
 }
 
-igt_main
+igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
 	int fd;
diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index da36367c6e8f..13a85dcfac42 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -560,7 +560,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 }
 
 
-igt_main
+igt_main()
 {
 	const struct section {
 		const char *name;
diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
index 405d8ec77eda..4e59c34ef5a1 100644
--- a/tests/intel/xe_exec_basic.c
+++ b/tests/intel/xe_exec_basic.c
@@ -314,7 +314,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	}
 }
 
-igt_main
+igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
 	const struct section {
diff --git a/tests/intel/xe_exec_capture.c b/tests/intel/xe_exec_capture.c
index 962df5f1917f..af22f49aec5d 100644
--- a/tests/intel/xe_exec_capture.c
+++ b/tests/intel/xe_exec_capture.c
@@ -404,7 +404,7 @@ static void test_card(int fd)
 	regfree(&regex);
 }
 
-igt_main
+igt_main()
 {
 	int xe;
 	struct drm_xe_engine_class_instance *hwe;
diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index 2121f4fb4861..bacff2f36953 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -401,7 +401,7 @@ static void lr_mode_workload(int fd)
 	put_ahnd(ahnd);
 }
 
-igt_main
+igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
 	const struct section {
diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 18b86514d14f..803a8ec1c15a 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -398,7 +398,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		close(map_fd);
 }
 
-igt_main
+igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
 	const struct section {
diff --git a/tests/intel/xe_exec_mix_modes.c b/tests/intel/xe_exec_mix_modes.c
index 45d02e06e2dc..9780119069a0 100644
--- a/tests/intel/xe_exec_mix_modes.c
+++ b/tests/intel/xe_exec_mix_modes.c
@@ -256,7 +256,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *hwe,
 	run_job(fd, hwe, engine_execution_mode, job_type, true, NULL);
 }
 
-igt_main
+igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
 	const struct section {
diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
index f612fdf196bf..dc4896e22d45 100644
--- a/tests/intel/xe_exec_queue_property.c
+++ b/tests/intel/xe_exec_queue_property.c
@@ -201,7 +201,7 @@ static void invalid_property(int xe)
 					     to_user_pointer(&ext), &exec_queue_id), 0);
 }
 
-igt_main
+igt_main()
 {
 	static const struct {
 		const char *name;
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index f7ecb26af290..ec86f8e2fc8e 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -770,7 +770,7 @@ static void threads(int fd, int n_exec_queues, int n_execs, unsigned int flags)
 	free(threads_data);
 }
 
-igt_main
+igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
 	const struct section {
diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
index 06465e27ed62..cb78ade1a496 100644
--- a/tests/intel/xe_exec_sip.c
+++ b/tests/intel/xe_exec_sip.c
@@ -309,7 +309,7 @@ static void test_sip(enum shader_type shader_type, enum sip_type sip_type,
 				igt_dynamic_f("%s%d", xe_engine_class_string(__eci->engine_class), \
 					      __eci->engine_instance)
 
-igt_main
+igt_main()
 {
 	struct drm_xe_engine_class_instance *eci;
 	int fd;
diff --git a/tests/intel/xe_exec_sip_eudebug.c b/tests/intel/xe_exec_sip_eudebug.c
index e3afa372776f..820bb852c3d5 100644
--- a/tests/intel/xe_exec_sip_eudebug.c
+++ b/tests/intel/xe_exec_sip_eudebug.c
@@ -314,7 +314,7 @@ static void test_sip(enum shader_type shader_type, enum sip_type sip_type,
 				igt_dynamic_f("%s%d", xe_engine_class_string(__eci->engine_class), \
 					      __eci->engine_instance)
 
-igt_main
+igt_main()
 {
 	struct drm_xe_engine_class_instance *eci;
 	bool was_enabled;
diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index 4fda5a4fb253..3df66850019f 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -412,7 +412,7 @@ static void long_shader(int fd, struct drm_xe_engine_class_instance *hwe,
 	free(buf);
 }
 
-igt_main
+igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
 	int fd;
diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 106e1a0e63c5..2bcb7b513b63 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -2216,7 +2216,7 @@ struct section {
 	uint8_t (*fn)(int pat);
 };
 
-igt_main
+igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
 	const struct section sections[] = {
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 0eff4b8be8bc..58a1558e57fb 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -1109,7 +1109,7 @@ static void threads(int fd, int flags)
 	pthread_barrier_destroy(&barrier);
 }
 
-igt_main
+igt_main()
 {
 	const struct section {
 		const char *name;
diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index e067b4598915..db5c980eb069 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -393,7 +393,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci, bool fix
 	xe_vm_destroy(fd, vm);
 }
 
-igt_main
+igt_main()
 {
 	int fd;
 	int gt;
diff --git a/tests/intel/xe_huc_copy.c b/tests/intel/xe_huc_copy.c
index 6a015a6f7139..77a87acc540a 100644
--- a/tests/intel/xe_huc_copy.c
+++ b/tests/intel/xe_huc_copy.c
@@ -191,7 +191,7 @@ is_huc_running(int fd)
 	return false;
 }
 
-igt_main
+igt_main()
 {
 	int xe;
 
diff --git a/tests/intel/xe_live_ktest.c b/tests/intel/xe_live_ktest.c
index d64d6a12c1ff..f65d44af9963 100644
--- a/tests/intel/xe_live_ktest.c
+++ b/tests/intel/xe_live_ktest.c
@@ -53,7 +53,7 @@ static const char *live_tests[] = {
 	"xe_eudebug",
 };
 
-igt_main
+igt_main()
 {
 	int i;
 
diff --git a/tests/intel/xe_media_fill.c b/tests/intel/xe_media_fill.c
index ec76de6c54a2..65fd16dcd036 100644
--- a/tests/intel/xe_media_fill.c
+++ b/tests/intel/xe_media_fill.c
@@ -115,7 +115,7 @@ static void media_fill(struct data_t *data, igt_fillfunc_t fill)
 	munmap(ptr, buf->surface[0].size);
 }
 
-igt_main
+igt_main()
 {
 	struct data_t data = {0, };
 	igt_fillfunc_t fill_fn = NULL;
diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
index 5952ce0bdd69..3bcd1668cd9a 100644
--- a/tests/intel/xe_mmap.c
+++ b/tests/intel/xe_mmap.c
@@ -440,7 +440,7 @@ static void prepare_pci_membarrier_test(int fd, int *fw_ptr)
 	igt_assert_lte(0, *fw_ptr);
 }
 
-igt_main
+igt_main()
 {
 	int fd;
 
diff --git a/tests/intel/xe_module_load.c b/tests/intel/xe_module_load.c
index 83e37430f55f..e4f8c41da85e 100644
--- a/tests/intel/xe_module_load.c
+++ b/tests/intel/xe_module_load.c
@@ -116,7 +116,7 @@ static const char * const unwanted_drivers[] = {
  * SUBTEST: many-reload
  * Description: Reload the Xe driver many times
  */
-igt_main
+igt_main()
 {
 	igt_describe("Check if xe and friends are not yet loaded, then load them.");
 	igt_subtest("load") {
diff --git a/tests/intel/xe_noexec_ping_pong.c b/tests/intel/xe_noexec_ping_pong.c
index ab8d1944a319..9c5961be5a77 100644
--- a/tests/intel/xe_noexec_ping_pong.c
+++ b/tests/intel/xe_noexec_ping_pong.c
@@ -95,7 +95,7 @@ static void test_ping_pong(int fd, struct drm_xe_engine *engine)
 static int fd;
 
 IGT_TEST_DESCRIPTION("Expose compute VM's unnecessary rebinds");
-igt_main
+igt_main()
 {
 	igt_fixture()
 		fd = drm_open_driver(DRIVER_XE);
diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index de63998d1792..6876e0bd9ac6 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -871,7 +871,7 @@ static void i2c_test(device_t device, int sysfs_fd, enum igt_acpi_d_state d_stat
 	close(i2c_fd);
 }
 
-igt_main
+igt_main()
 {
 	device_t device;
 	uint32_t d3cold_allowed;
diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 775ee7f99f6f..7dc1ab2c1e05 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -370,7 +370,7 @@ static void cpg_gt_toggle(int fd)
 		powergate_status(fd, gt, "down");
 }
 
-igt_main
+igt_main()
 {
 	uint32_t d3cold_allowed;
 	int fd, gt;
diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 96723ec867e1..e8b2f4b4b5f9 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -1056,7 +1056,7 @@ static void restore_gt_freq(int fd, uint32_t *stash_min, uint32_t *stash_max)
 	free(stash_max);
 }
 
-igt_main
+igt_main()
 {
 	int fd, gt, num_engines;
 	struct drm_xe_engine_class_instance *eci;
diff --git a/tests/intel/xe_prime_self_import.c b/tests/intel/xe_prime_self_import.c
index 2fc73ddeb0c0..9b25d2d0b1cc 100644
--- a/tests/intel/xe_prime_self_import.c
+++ b/tests/intel/xe_prime_self_import.c
@@ -514,7 +514,7 @@ static void test_llseek_bad(void)
 	drm_close_driver(fd);
 }
 
-igt_main
+igt_main()
 {
 	struct {
 		const char *name;
diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
index cae8f5a7e73c..d92c67961f47 100644
--- a/tests/intel/xe_pxp.c
+++ b/tests/intel/xe_pxp.c
@@ -1102,7 +1102,7 @@ static void exit_handler(int sig)
 	usleep(50 * 1000); /* give time for the termination to be processed */
 }
 
-igt_main
+igt_main()
 {
 	bool pxp_supported = true;
 	drmModeResPtr res;
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 6474ba0b8424..1f62090776ca 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -1117,7 +1117,7 @@ static void test_query_pxp_status(int fd)
 	free(qpxp);
 }
 
-igt_main
+igt_main()
 {
 	const struct {
 		const char *name;
diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index 168b604ac3f5..528230d91c90 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -526,7 +526,7 @@ static void xe_spin_timestamp_check(int fd, struct drm_xe_engine_class_instance
 	run_spinner(fd, eci);
 }
 
-igt_main
+igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
 	int fd;
diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index 608e306ed0e6..ad5de95c7217 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -1023,7 +1023,7 @@ static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
 	verify_flr(pf_fd, num_vfs, checks, num_checks, exec_strategy);
 }
 
-igt_main
+igt_main()
 {
 	int pf_fd;
 	bool autoprobe;
diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
index dfdd14738dfa..8325ee85adbf 100644
--- a/tests/intel/xe_survivability.c
+++ b/tests/intel/xe_survivability.c
@@ -207,7 +207,7 @@ static void test_spinner_after_recovery(int fd)
 	put_ahnd(ahnd);
 }
 
-igt_main
+igt_main()
 {
 	int fd, configfs_fd, configfs_device_fd;
 	struct pci_device *pci_xe;
diff --git a/tests/intel/xe_sysfs_defaults.c b/tests/intel/xe_sysfs_defaults.c
index 3a221375e82d..807a1defdde2 100644
--- a/tests/intel/xe_sysfs_defaults.c
+++ b/tests/intel/xe_sysfs_defaults.c
@@ -58,7 +58,7 @@ static void test_defaults(int xe, int engine, const char **property,
 	closedir(dir);
 }
 
-igt_main
+igt_main()
 {
 	int xe, sys_fd;
 	int gt;
diff --git a/tests/intel/xe_sysfs_preempt_timeout.c b/tests/intel/xe_sysfs_preempt_timeout.c
index ea0ed13d3319..1bc762ef4697 100644
--- a/tests/intel/xe_sysfs_preempt_timeout.c
+++ b/tests/intel/xe_sysfs_preempt_timeout.c
@@ -173,7 +173,7 @@ static void test_timeout(int fd, int engine, const char **property, uint16_t cla
 }
 
 #define	MAX_GTS	8
-igt_main
+igt_main()
 {
 	static const struct {
 		const char *name;
diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_scheduler.c
index f134074aa414..bf714b5f5371 100644
--- a/tests/intel/xe_sysfs_scheduler.c
+++ b/tests/intel/xe_sysfs_scheduler.c
@@ -219,7 +219,7 @@ static void test_invalid_large_string(int xe, int engine, const char **property,
 }
 
 #define MAX_GTS 8
-igt_main
+igt_main()
 {
 	static const struct {
 		const char *name;
diff --git a/tests/intel/xe_sysfs_timeslice_duration.c b/tests/intel/xe_sysfs_timeslice_duration.c
index ae6b9aa223cc..55ce7e4995c5 100644
--- a/tests/intel/xe_sysfs_timeslice_duration.c
+++ b/tests/intel/xe_sysfs_timeslice_duration.c
@@ -149,7 +149,7 @@ static void test_timeout(int fd, int engine, const char **property, uint16_t cla
 }
 
 #define	MAX_GTS	8
-igt_main
+igt_main()
 {
 	static const struct {
 		const char *name;
diff --git a/tests/intel/xe_tlb.c b/tests/intel/xe_tlb.c
index 712707270416..7c545abff60b 100644
--- a/tests/intel/xe_tlb.c
+++ b/tests/intel/xe_tlb.c
@@ -128,7 +128,7 @@ static void tlb_invalidation(int fd, struct drm_xe_engine_class_instance *eci)
 	xe_vm_destroy(fd, vm);
 }
 
-igt_main
+igt_main()
 {
 	int fd;
 	struct drm_xe_engine *engine;
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 523c2158e721..9a944adc6898 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -2450,7 +2450,7 @@ static void test_oom(int fd)
 	}
 }
 
-igt_main
+igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe, *hwe_non_copy = NULL;
 	uint64_t bind_size;
diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index ee02732a815f..3cd96d43d284 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -275,7 +275,7 @@ exec_queue_reset_wait(int fd)
 	}
 }
 
-igt_main
+igt_main()
 {
 	int fd;
 
diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index c3c81960ae42..7eae418835f7 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -208,7 +208,7 @@ simple_hang(int fd, struct drm_xe_sync *sync)
  * SUBTEST: basic-wedged-read
  * Description: Read wedged_mode debugfs
  */
-igt_main
+igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
 	int fd;
diff --git a/tests/kms_3d.c b/tests/kms_3d.c
index b4e662bfd73f..12316ca08b16 100644
--- a/tests/kms_3d.c
+++ b/tests/kms_3d.c
@@ -40,7 +40,7 @@
 
 IGT_TEST_DESCRIPTION("Tests 3D mode setting.");
 
-igt_main
+igt_main()
 {
 	int drm_fd;
 	drmModeRes *res;
diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index 9699bd8398c1..43a9794b18f2 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -982,7 +982,7 @@ static bool has_addfb2_iface(int fd)
 
 int fd;
 
-igt_main
+igt_main()
 {
 	igt_fixture() {
 		fd = drm_open_driver_master(DRIVER_ANY);
diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index c1be4c5a947d..50d5b5850e66 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -1065,7 +1065,7 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 
 static data_t data;
 
-igt_main
+igt_main()
 {
 	int i;
 
diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interruptible.c
index 2983b14f7df3..29a1f2e0bdc3 100644
--- a/tests/kms_atomic_interruptible.c
+++ b/tests/kms_atomic_interruptible.c
@@ -321,7 +321,7 @@ static bool pipe_output_combo_valid(igt_display_t *display,
 	return ret;
 }
 
-igt_main
+igt_main()
 {
 	igt_display_t display;
 	igt_output_t *output;
diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index 43c4439ced8b..b6126e03a233 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -259,7 +259,7 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 	test_fini(data);
 }
 
-igt_main
+igt_main()
 {
 	data_t data;
 	int i = 0, j = 0;
diff --git a/tests/kms_color.c b/tests/kms_color.c
index 5ffc9ddadd19..ceee839bc35b 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -1171,7 +1171,7 @@ run_tests_for_pipe(data_t *data)
 	}
 }
 
-igt_main
+igt_main()
 {
 	data_t data = {};
 
diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index f0c2993598e7..1113a36fd26c 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -980,7 +980,7 @@ static const struct {
 	},
 };
 
-igt_main
+igt_main()
 {
 	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index fea50b3b1b16..dc2fbc460a7a 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1824,7 +1824,7 @@ static void modeset_atomic_cursor_hotspot(igt_display_t *display)
 	igt_remove_fb(display->drm_fd, &cursor_fb);
 }
 
-igt_main
+igt_main()
 {
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	igt_display_t display = { .drm_fd = -1 };
diff --git a/tests/kms_debugfs.c b/tests/kms_debugfs.c
index 45ad1440fbd0..7db75637e912 100644
--- a/tests/kms_debugfs.c
+++ b/tests/kms_debugfs.c
@@ -94,7 +94,7 @@ static void igt_display_all_off(igt_display_t *display)
 
 IGT_TEST_DESCRIPTION("Read entries from debugfs with display on/off.");
 
-igt_main
+igt_main()
 {
 	int debugfs = -1;
 	igt_display_t display;
diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index 59bda92ff77e..2f229a953f64 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -227,7 +227,7 @@ static void run_extendedmode_test(data_t *data) {
 	}
 }
 
-igt_main
+igt_main()
 {
 	int dp_mst_outputs = 0, count = 0;
 	igt_output_t *output;
diff --git a/tests/kms_dither.c b/tests/kms_dither.c
index f045cdf130b0..cf9e054e2000 100644
--- a/tests/kms_dither.c
+++ b/tests/kms_dither.c
@@ -236,7 +236,7 @@ run_dither_test(data_t *data, int fb_bpc, int fb_format, int output_bpc)
 	}
 }
 
-igt_main
+igt_main()
 {
 	struct {
 		int fb_bpc;
diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
index 6dea20541b16..6e10eb392bf5 100644
--- a/tests/kms_feature_discovery.c
+++ b/tests/kms_feature_discovery.c
@@ -71,7 +71,7 @@ static igt_display_t display;
 IGT_TEST_DESCRIPTION("A metatest that checks for \"features\" presence. "
 		     "The subtests here should only skip or pass, "
 		     "anything else means we have a serious problem.");
-igt_main {
+igt_main() {
 	igt_fd_t(debugfs_fd);
 	igt_fd_t(fd);
 
diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c
index d417c2e5438e..79f90000da56 100644
--- a/tests/kms_flip_event_leak.c
+++ b/tests/kms_flip_event_leak.c
@@ -103,7 +103,7 @@ static void test(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_remove_fb(data->drm_fd, &fb[0]);
 }
 
-igt_main
+igt_main()
 {
 	data_t data = {};
 	igt_output_t *output;
diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
index 7bb8e2839f8c..9354c27ed18d 100644
--- a/tests/kms_getfb.c
+++ b/tests/kms_getfb.c
@@ -425,7 +425,7 @@ static void test_handle_protection(void) {
 	}
 }
 
-igt_main
+igt_main()
 {
 	int fd;
 	igt_display_t display;
diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c
index d6aa1b17e60a..61d42d1a6021 100644
--- a/tests/kms_hdmi_inject.c
+++ b/tests/kms_hdmi_inject.c
@@ -211,7 +211,7 @@ hdmi_inject_audio(int drm_fd, drmModeConnector *connector)
 	kmstest_force_edid(drm_fd, connector, NULL);
 }
 
-igt_main
+igt_main()
 {
 	int drm_fd;
 	drmModeRes *res;
diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 7dbd10eeb4ef..0fd0a505b302 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -799,7 +799,7 @@ static void test_hdr(data_t *data, uint32_t flags)
 	}
 }
 
-igt_main
+igt_main()
 {
 	data_t data = {};
 
diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index a404526cff88..8f4e19657791 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -334,7 +334,7 @@ static const struct {
 
 static data_t data;
 
-igt_main
+igt_main()
 {
 
 	enum pipe pipe;
diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index cd1c6fb6cf0c..914254309532 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -1239,7 +1239,7 @@ static void lease_uevent(data_t *data)
 	igt_cleanup_uevents(uevent_monitor);
 }
 
-igt_main
+igt_main()
 {
 	data_t data;
 	igt_output_t *output;
diff --git a/tests/kms_multipipe_modeset.c b/tests/kms_multipipe_modeset.c
index e2a2969560d6..ec191e025021 100644
--- a/tests/kms_multipipe_modeset.c
+++ b/tests/kms_multipipe_modeset.c
@@ -142,7 +142,7 @@ static void test_multipipe(data_t *data, int num_pipes)
 	run_test(data, valid_outputs);
 }
 
-igt_main
+igt_main()
 {
 	data_t data;
 	drmModeResPtr res;
diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
index 5375bb9af23f..51934e151ee3 100644
--- a/tests/kms_panel_fitting.c
+++ b/tests/kms_panel_fitting.c
@@ -281,7 +281,7 @@ static void test_panel_fitting(data_t *data, enum test_type type)
 	}
 }
 
-igt_main
+igt_main()
 {
 	data_t data = {};
 
diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index e2c174f23631..b0b3f7b9baba 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -284,7 +284,7 @@ static void test_cursor(data_t *data, int size, unsigned int flags)
 	test_cursor_spots(data, size, flags);
 }
 
-igt_main
+igt_main()
 {
 	static const int cursor_sizes[] = { 64, 128, 256 };
 	data_t data = { .max_curw = 64, .max_curh = 64 };
diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index ea3813edf906..b0f256802962 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -338,7 +338,7 @@ static const struct {
 	},
 };
 
-igt_main
+igt_main()
 {
 	data_t data = {};
 
diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index fb7320d2bf58..778debbd9c50 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -551,7 +551,7 @@ static void kms_poll_disable(void)
 	close(sysfs_fd);
 }
 
-igt_main
+igt_main()
 {
 	int first_fd = -1;
 	int second_fd_vgem = -1;
diff --git a/tests/kms_prop_blob.c b/tests/kms_prop_blob.c
index 9548827d84f4..a63d950892f0 100644
--- a/tests/kms_prop_blob.c
+++ b/tests/kms_prop_blob.c
@@ -345,7 +345,7 @@ static void prop_tests(int fd)
 		destroy_prop(fd, blob_id);
 }
 
-igt_main
+igt_main()
 {
 	int fd;
 
diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index b17032d6cad6..bb6feb152579 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -820,7 +820,7 @@ static void invalid_properties(igt_display_t *display, bool atomic)
 		test_object_invalid_properties(display, output->id, DRM_MODE_OBJECT_CONNECTOR, atomic);
 }
 
-igt_main
+igt_main()
 {
 	igt_display_t display;
 	int i;
diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
index 5a338ef733d7..807df9ec89f1 100644
--- a/tests/kms_rmfb.c
+++ b/tests/kms_rmfb.c
@@ -190,7 +190,7 @@ run_rmfb_test(struct rmfb_data *data, bool reopen)
 	}
 }
 
-igt_main
+igt_main()
 {
 	const struct {
 		bool reopen;
diff --git a/tests/kms_scaling_modes.c b/tests/kms_scaling_modes.c
index b869639551dc..8d120dc8ad21 100644
--- a/tests/kms_scaling_modes.c
+++ b/tests/kms_scaling_modes.c
@@ -130,7 +130,7 @@ static void test_scaling_mode(data_t *data, uint32_t flags)
 	}
 }
 
-igt_main
+igt_main()
 {
 	data_t data = {};
 
diff --git a/tests/kms_selftest.c b/tests/kms_selftest.c
index eb6482cc2a84..dbd1b048179e 100644
--- a/tests/kms_selftest.c
+++ b/tests/kms_selftest.c
@@ -49,7 +49,7 @@
 
 IGT_TEST_DESCRIPTION("Basic sanity check of KMS selftests.");
 
-igt_main
+igt_main()
 {
 	static const char *kunit_subtests[] = {
 		"drm_cmdline_parser_test",
diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
index 635854460d73..17295ba517a2 100644
--- a/tests/kms_sequence.c
+++ b/tests/kms_sequence.c
@@ -268,7 +268,7 @@ static void sequence_queue(data_t *data, int fd, int nchildren)
 		 frame_time * 1000.0, 1.0/frame_time);
 }
 
-igt_main
+igt_main()
 {
 	int fd;
 	igt_output_t *output;
diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
index eae9312d18c2..9d98e806ae80 100644
--- a/tests/kms_tiled_display.c
+++ b/tests/kms_tiled_display.c
@@ -566,7 +566,7 @@ static void basic_test(data_t *data, drmEventContext *drm_event, struct pollfd *
 	}
 }
 
-igt_main
+igt_main()
 {
 	data_t data = {0};
 	struct pollfd pfd = {0};
diff --git a/tests/kms_tv_load_detect.c b/tests/kms_tv_load_detect.c
index c962a55d9724..3f7e1b8240bf 100644
--- a/tests/kms_tv_load_detect.c
+++ b/tests/kms_tv_load_detect.c
@@ -39,7 +39,7 @@
 
 IGT_TEST_DESCRIPTION("Check tv load detection works correctly.");
 
-igt_main
+igt_main()
 {
 	/* force the VGA output and test that it worked */
 	int drm_fd = 0;
diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index edbe3e961cbb..2f8c6ce92617 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -891,7 +891,7 @@ run_tests(data_t *data)
 	}
 }
 
-igt_main
+igt_main()
 {
 	data_t data;
 
diff --git a/tests/meta_test.c b/tests/meta_test.c
index 2620982d0a6c..56503d8a3313 100644
--- a/tests/meta_test.c
+++ b/tests/meta_test.c
@@ -117,7 +117,7 @@ static void test_panic(void)
 	system("echo c > /proc/sysrq-trigger");
 }
 
-igt_main
+igt_main()
 {
 
 	igt_fixture() {
diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
index f9abffee82f2..69cef2c8c876 100644
--- a/tests/msm/msm_mapping.c
+++ b/tests/msm/msm_mapping.c
@@ -262,7 +262,7 @@ do_mapping_test(struct msm_pipe *pipe, const char *buffername, bool write)
  * Tests for drm/msm hangcheck, recovery, and fault handling
  */
 
-igt_main
+igt_main()
 {
 	struct msm_device *dev = NULL;
 	struct msm_pipe *pipe = NULL;
diff --git a/tests/msm/msm_recovery.c b/tests/msm/msm_recovery.c
index e0cef1140f90..86fd930cf564 100644
--- a/tests/msm/msm_recovery.c
+++ b/tests/msm/msm_recovery.c
@@ -215,7 +215,7 @@ do_fault_test(struct msm_pipe *pipe, bool stress)
  * Tests for drm/msm hangcheck, recovery, and fault handling
  */
 
-igt_main
+igt_main()
 {
 	static struct msm_pipe *pipe = NULL;
 
diff --git a/tests/msm/msm_shrink.c b/tests/msm/msm_shrink.c
index 6c5b976520a3..9b689e80ea51 100644
--- a/tests/msm/msm_shrink.c
+++ b/tests/msm/msm_shrink.c
@@ -243,7 +243,7 @@ static void run_test(int nchildren, uint64_t alloc_size_mb, unsigned num_bos,
 
 static const unsigned num_bos[] = { 8, 32 };
 
-igt_main
+igt_main()
 {
 	struct msm_device *dev = NULL;
 	uint64_t alloc_size_mb = 0;
diff --git a/tests/msm/msm_submit.c b/tests/msm/msm_submit.c
index 2955f5d99b23..1b2e7b147a68 100644
--- a/tests/msm/msm_submit.c
+++ b/tests/msm/msm_submit.c
@@ -24,7 +24,7 @@
 #include "igt.h"
 #include "igt_msm.h"
 
-igt_main
+igt_main()
 {
 	struct msm_device *dev = NULL;
 	struct msm_pipe *pipe = NULL;
diff --git a/tests/msm/msm_submitoverhead.c b/tests/msm/msm_submitoverhead.c
index bf5229881277..5f84a186d2c5 100644
--- a/tests/msm/msm_submitoverhead.c
+++ b/tests/msm/msm_submitoverhead.c
@@ -14,7 +14,7 @@
 
 #define MAX_BOS 1000
 
-igt_main
+igt_main()
 {
 	struct msm_device *dev = NULL;
 	struct msm_pipe *pipe = NULL;
diff --git a/tests/nouveau_crc.c b/tests/nouveau_crc.c
index a8f4b71f7121..929c59404145 100644
--- a/tests/nouveau_crc.c
+++ b/tests/nouveau_crc.c
@@ -318,7 +318,7 @@ static void test_source_outp_inactive(data_t *data)
 data_t data = {0};
 
 #define pipe_test(name) igt_subtest_f("pipe-%s-" name, kmstest_pipe_name(pipe))
-igt_main
+igt_main()
 {
 	int pipe;
 
diff --git a/tests/panfrost/panfrost_gem_new.c b/tests/panfrost/panfrost_gem_new.c
index 42e0bbc038e1..b97287deed23 100644
--- a/tests/panfrost/panfrost_gem_new.c
+++ b/tests/panfrost/panfrost_gem_new.c
@@ -35,7 +35,7 @@
 #include <sys/ioctl.h>
 #include "panfrost_drm.h"
 
-igt_main
+igt_main()
 {
 	int fd;
 
diff --git a/tests/panfrost/panfrost_get_param.c b/tests/panfrost/panfrost_get_param.c
index 39ef11eba1b8..e6f63b4f9071 100644
--- a/tests/panfrost/panfrost_get_param.c
+++ b/tests/panfrost/panfrost_get_param.c
@@ -36,7 +36,7 @@
 #include <poll.h>
 #include "panfrost_drm.h"
 
-igt_main
+igt_main()
 {
 	int fd;
 
diff --git a/tests/panfrost/panfrost_prime.c b/tests/panfrost/panfrost_prime.c
index b90c66032c23..cc07c8570693 100644
--- a/tests/panfrost/panfrost_prime.c
+++ b/tests/panfrost/panfrost_prime.c
@@ -55,7 +55,7 @@ static bool igt_has_prime(int fd, uint64_t flags)
 	return (value & flags) == flags;
 }
 
-igt_main
+igt_main()
 {
 	int fd, kms_fd;
 
diff --git a/tests/panfrost/panfrost_submit.c b/tests/panfrost/panfrost_submit.c
index 27d3a7de55b3..dd899857ec0f 100644
--- a/tests/panfrost/panfrost_submit.c
+++ b/tests/panfrost/panfrost_submit.c
@@ -62,7 +62,7 @@ static void check_done(struct mali_job_descriptor_header *header)
         igt_assert(header->exception_status == 1 && header->fault_pointer == 0);
 }
 
-igt_main
+igt_main()
 {
         int fd;
 
diff --git a/tests/panthor/panthor_gem.c b/tests/panthor/panthor_gem.c
index 7e3aeca1e6c0..1d372d4c6f02 100644
--- a/tests/panthor/panthor_gem.c
+++ b/tests/panthor/panthor_gem.c
@@ -7,7 +7,7 @@
 #include "igt_core.h"
 #include "igt_panthor.h"
 
-igt_main {
+igt_main() {
 	int fd;
 
 	igt_fixture() {
diff --git a/tests/panthor/panthor_group.c b/tests/panthor/panthor_group.c
index 846ddabce36e..8befd56fe267 100644
--- a/tests/panthor/panthor_group.c
+++ b/tests/panthor/panthor_group.c
@@ -40,7 +40,7 @@ issue_store_multiple(uint8_t *cs, uint64_t kernel_va, uint32_t constant)
 	return sizeof(instrs);
 }
 
-igt_main {
+igt_main() {
 	int fd;
 
 	igt_fixture() {
diff --git a/tests/panthor/panthor_query.c b/tests/panthor/panthor_query.c
index 7212cb8f1c3c..915ef004562e 100644
--- a/tests/panthor/panthor_query.c
+++ b/tests/panthor/panthor_query.c
@@ -7,7 +7,7 @@
 #include "panthor_drm.h"
 #include <stdint.h>
 
-igt_main {
+igt_main() {
 	int fd;
 
 	igt_fixture() {
diff --git a/tests/panthor/panthor_vm.c b/tests/panthor/panthor_vm.c
index ffde7881146b..21b9de9be3bf 100644
--- a/tests/panthor/panthor_vm.c
+++ b/tests/panthor/panthor_vm.c
@@ -6,7 +6,7 @@
 #include "igt_panthor.h"
 #include "panthor_drm.h"
 
-igt_main {
+igt_main() {
 	int fd;
 
 	igt_fixture() {
diff --git a/tests/prime_nv_api.c b/tests/prime_nv_api.c
index c95586c6b01d..a411090a81e1 100644
--- a/tests/prime_nv_api.c
+++ b/tests/prime_nv_api.c
@@ -346,7 +346,7 @@ static void test_nv_self_import_to_different_fd(void)
 	nouveau_bo_ref(NULL, &nvbo2);
 }
 
-igt_main
+igt_main()
 {
 	igt_fixture() {
 		find_and_open_devices();
diff --git a/tests/prime_nv_pcopy.c b/tests/prime_nv_pcopy.c
index b1a935dbbea6..db3f54ab5aed 100644
--- a/tests/prime_nv_pcopy.c
+++ b/tests/prime_nv_pcopy.c
@@ -860,7 +860,7 @@ static void test_semaphore(void)
 	gem_close(intel_fd, intel_handle);
 }
 
-igt_main
+igt_main()
 {
 	igt_fixture() {
 		find_and_open_devices();
diff --git a/tests/prime_nv_test.c b/tests/prime_nv_test.c
index 94ea4f028d2a..3135191d9319 100644
--- a/tests/prime_nv_test.c
+++ b/tests/prime_nv_test.c
@@ -352,7 +352,7 @@ static void test_i915_blt_fill_nv_read(void)
 
 /* test 9 nouveau copy engine?? */
 
-igt_main
+igt_main()
 {
 	igt_fixture() {
 		igt_assert(find_and_open_devices() == 0);
diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index 19b0839261ff..2abb1d185440 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -1146,7 +1146,7 @@ static void test_each_engine(const char *name, int vgem, int i915,
 		intel_ctx_destroy(i915, ctx);
 }
 
-igt_main
+igt_main()
 {
 	int i915 = -1;
 	int vgem = -1;
diff --git a/tests/sriov_basic.c b/tests/sriov_basic.c
index 7e01b578b5bc..29e1fd84dd75 100644
--- a/tests/sriov_basic.c
+++ b/tests/sriov_basic.c
@@ -118,7 +118,7 @@ static void bind_unbind_vf(int pf_fd, unsigned int vf_num)
 	igt_sriov_disable_vfs(pf_fd);
 }
 
-igt_main
+igt_main()
 {
 	int pf_fd;
 	bool autoprobe;
diff --git a/tests/sw_sync.c b/tests/sw_sync.c
index f7d719873626..f57ffcc10e58 100644
--- a/tests/sw_sync.c
+++ b/tests/sw_sync.c
@@ -878,7 +878,7 @@ static void test_sync_random_merge(void)
 		close(timeline_arr[i]);
 }
 
-igt_main
+igt_main()
 {
 	igt_fixture() {
 		igt_require_sw_sync();
diff --git a/tests/syncobj_basic.c b/tests/syncobj_basic.c
index 9a4f33884fba..cd0b3eab0582 100644
--- a/tests/syncobj_basic.c
+++ b/tests/syncobj_basic.c
@@ -219,7 +219,7 @@ static bool has_syncobj(int fd)
 	return value ? true : false;
 }
 
-igt_main
+igt_main()
 {
 	int fd = -1;
 
diff --git a/tests/syncobj_eventfd.c b/tests/syncobj_eventfd.c
index 7ad0e62ad04d..d88ea3e701c0 100644
--- a/tests/syncobj_eventfd.c
+++ b/tests/syncobj_eventfd.c
@@ -277,7 +277,7 @@ test_wait_signaled(int fd, bool use_timeline)
 	syncobj_destroy(fd, syncobj);
 }
 
-igt_main
+igt_main()
 {
 	int fd = -1, i;
 
diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
index 7f09070d3412..b83f4c6bcb4a 100644
--- a/tests/syncobj_timeline.c
+++ b/tests/syncobj_timeline.c
@@ -1695,7 +1695,7 @@ has_syncobj_timeline_wait(int fd)
 	return ret == -1 && errno == ENOENT;
 }
 
-igt_main
+igt_main()
 {
 	int fd = -1;
 
diff --git a/tests/syncobj_wait.c b/tests/syncobj_wait.c
index 854e1711055d..5ee90c5e9a8c 100644
--- a/tests/syncobj_wait.c
+++ b/tests/syncobj_wait.c
@@ -905,7 +905,7 @@ has_syncobj_wait(int fd)
 	return ret == -1 && errno == ENOENT;
 }
 
-igt_main
+igt_main()
 {
 	int fd = -1;
 
diff --git a/tests/template.c b/tests/template.c
index 513125757109..29733de5785e 100644
--- a/tests/template.c
+++ b/tests/template.c
@@ -58,7 +58,7 @@ static void test_B(int fd)
 
 int drm_fd;
 
-igt_main
+igt_main()
 {
 	igt_fixture() {
 		drm_fd = drm_open_driver(DRIVER_ANY);
diff --git a/tests/tools_test.c b/tests/tools_test.c
index 61e8a9998394..cc028eca96a7 100644
--- a/tests/tools_test.c
+++ b/tests/tools_test.c
@@ -94,7 +94,7 @@ static bool chdir_to_tools_dir(void)
 	return chdir(TOOLS) == 0 || chdir("../../bin") == 0;
 }
 
-igt_main
+igt_main()
 {
 	igt_fixture() {
 		char *path;
diff --git a/tests/v3d/v3d_create_bo.c b/tests/v3d/v3d_create_bo.c
index daa928d3fdd2..c7a0593de9c7 100644
--- a/tests/v3d/v3d_create_bo.c
+++ b/tests/v3d/v3d_create_bo.c
@@ -8,7 +8,7 @@
 
 IGT_TEST_DESCRIPTION("Tests for the V3D's Create BO IOCTL");
 
-igt_main
+igt_main()
 {
 	int fd;
 
diff --git a/tests/v3d/v3d_get_bo_offset.c b/tests/v3d/v3d_get_bo_offset.c
index 717d91a528c2..8ff9773c0656 100644
--- a/tests/v3d/v3d_get_bo_offset.c
+++ b/tests/v3d/v3d_get_bo_offset.c
@@ -26,7 +26,7 @@
 
 IGT_TEST_DESCRIPTION("Tests for the V3D's get BO offset IOCTL");
 
-igt_main
+igt_main()
 {
 	int fd;
 
diff --git a/tests/v3d/v3d_get_param.c b/tests/v3d/v3d_get_param.c
index 55caa0f1dd9a..7185d630e117 100644
--- a/tests/v3d/v3d_get_param.c
+++ b/tests/v3d/v3d_get_param.c
@@ -26,7 +26,7 @@
 
 IGT_TEST_DESCRIPTION("Tests for the V3D's get params IOCTL");
 
-igt_main
+igt_main()
 {
 	int fd;
 
diff --git a/tests/v3d/v3d_job_submission.c b/tests/v3d/v3d_job_submission.c
index 522c0ff79d84..fcf88daf650b 100644
--- a/tests/v3d/v3d_job_submission.c
+++ b/tests/v3d/v3d_job_submission.c
@@ -58,7 +58,7 @@ static void *create_csd_jobs(void *args)
 	return NULL;
 }
 
-igt_main
+igt_main()
 {
 	igt_fixture() {
 		fd = drm_open_driver(DRIVER_V3D);
diff --git a/tests/v3d/v3d_mmap.c b/tests/v3d/v3d_mmap.c
index c5ef39a6609b..7c433e8a120d 100644
--- a/tests/v3d/v3d_mmap.c
+++ b/tests/v3d/v3d_mmap.c
@@ -26,7 +26,7 @@
 
 IGT_TEST_DESCRIPTION("Tests for the V3D's mmap IOCTL");
 
-igt_main
+igt_main()
 {
 	int fd;
 
diff --git a/tests/v3d/v3d_perfmon.c b/tests/v3d/v3d_perfmon.c
index 1858888fe427..865b2aa17680 100644
--- a/tests/v3d/v3d_perfmon.c
+++ b/tests/v3d/v3d_perfmon.c
@@ -8,7 +8,7 @@
 
 IGT_TEST_DESCRIPTION("Tests for the V3D's performance monitors");
 
-igt_main
+igt_main()
 {
 	int fd;
 
diff --git a/tests/v3d/v3d_submit_cl.c b/tests/v3d/v3d_submit_cl.c
index a4d79e4abf5e..d6b12cd67301 100644
--- a/tests/v3d/v3d_submit_cl.c
+++ b/tests/v3d/v3d_submit_cl.c
@@ -27,7 +27,7 @@ short_timeout(void)
 	return gettime_ns() + SHORT_TIME_NSEC;
 }
 
-igt_main
+igt_main()
 {
 	int fd;
 
diff --git a/tests/v3d/v3d_submit_csd.c b/tests/v3d/v3d_submit_csd.c
index cf2026cef022..636e1168733b 100644
--- a/tests/v3d/v3d_submit_csd.c
+++ b/tests/v3d/v3d_submit_csd.c
@@ -29,7 +29,7 @@ short_timeout(void)
 	return gettime_ns() + SHORT_TIME_NSEC;
 }
 
-igt_main
+igt_main()
 {
 	int fd;
 
diff --git a/tests/v3d/v3d_wait_bo.c b/tests/v3d/v3d_wait_bo.c
index 8754410261e5..f30df3c4a902 100644
--- a/tests/v3d/v3d_wait_bo.c
+++ b/tests/v3d/v3d_wait_bo.c
@@ -24,7 +24,7 @@ static void test_used_bo(int fd, struct v3d_bo *bo, uint64_t timeout)
 	igt_assert(ret == 0 || (ret == -1 && errno == ETIME));
 }
 
-igt_main
+igt_main()
 {
 	int fd;
 	struct v3d_bo *bo;
diff --git a/tests/vc4/vc4_create_bo.c b/tests/vc4/vc4_create_bo.c
index 8c55d09e629f..75fdcdf60ee3 100644
--- a/tests/vc4/vc4_create_bo.c
+++ b/tests/vc4/vc4_create_bo.c
@@ -24,7 +24,7 @@
 #include "igt.h"
 #include "igt_vc4.h"
 
-igt_main
+igt_main()
 {
 	int fd;
 
diff --git a/tests/vc4/vc4_dmabuf_poll.c b/tests/vc4/vc4_dmabuf_poll.c
index 14976dacc731..a2ee5371c36a 100644
--- a/tests/vc4/vc4_dmabuf_poll.c
+++ b/tests/vc4/vc4_dmabuf_poll.c
@@ -55,7 +55,7 @@ poll_write_bo_test(int fd, int poll_flag)
 	gem_close(fd, handle);
 }
 
-igt_main
+igt_main()
 {
 	int fd;
 
diff --git a/tests/vc4/vc4_label_bo.c b/tests/vc4/vc4_label_bo.c
index 1d1b134a1796..d00ab0155ef1 100644
--- a/tests/vc4/vc4_label_bo.c
+++ b/tests/vc4/vc4_label_bo.c
@@ -39,7 +39,7 @@ set_label(int fd, int handle, const char *name, int err)
 		do_ioctl(fd, DRM_IOCTL_VC4_LABEL_BO, &label);
 }
 
-igt_main
+igt_main()
 {
 	int fd;
 
diff --git a/tests/vc4/vc4_lookup_fail.c b/tests/vc4/vc4_lookup_fail.c
index be0b39ad9469..592f1f6c04d2 100644
--- a/tests/vc4/vc4_lookup_fail.c
+++ b/tests/vc4/vc4_lookup_fail.c
@@ -25,7 +25,7 @@
 #include "igt_vc4.h"
 #include "vc4_packet.h"
 
-igt_main
+igt_main()
 {
 	int fd;
 
diff --git a/tests/vc4/vc4_mmap.c b/tests/vc4/vc4_mmap.c
index 511561c8e6df..07fa6bee362f 100644
--- a/tests/vc4/vc4_mmap.c
+++ b/tests/vc4/vc4_mmap.c
@@ -8,7 +8,7 @@
 
 IGT_TEST_DESCRIPTION("Tests for the VC4's mmap IOCTL");
 
-igt_main
+igt_main()
 {
 	int fd;
 
diff --git a/tests/vc4/vc4_perfmon.c b/tests/vc4/vc4_perfmon.c
index 646956747f97..829e32d3761c 100644
--- a/tests/vc4/vc4_perfmon.c
+++ b/tests/vc4/vc4_perfmon.c
@@ -8,7 +8,7 @@
 
 IGT_TEST_DESCRIPTION("Tests for the VC4's performance monitors");
 
-igt_main
+igt_main()
 {
 	int fd;
 
diff --git a/tests/vc4/vc4_purgeable_bo.c b/tests/vc4/vc4_purgeable_bo.c
index 294f193dfc36..b657ddfdf706 100644
--- a/tests/vc4/vc4_purgeable_bo.c
+++ b/tests/vc4/vc4_purgeable_bo.c
@@ -94,7 +94,7 @@ static void igt_vc4_purgeable_subtest_prepare(int fd, struct igt_list_head *list
 	igt_assert(!igt_list_empty(list));
 }
 
-igt_main
+igt_main()
 {
 	struct igt_vc4_bo *bo;
 	struct igt_list_head list;
diff --git a/tests/vc4/vc4_tiling.c b/tests/vc4/vc4_tiling.c
index f412a9fe896e..227f42f16db0 100644
--- a/tests/vc4/vc4_tiling.c
+++ b/tests/vc4/vc4_tiling.c
@@ -24,7 +24,7 @@
 #include "igt.h"
 #include "igt_vc4.h"
 
-igt_main
+igt_main()
 {
 	int fd;
 
diff --git a/tests/vc4/vc4_wait_bo.c b/tests/vc4/vc4_wait_bo.c
index d70e90118759..25441edc8672 100644
--- a/tests/vc4/vc4_wait_bo.c
+++ b/tests/vc4/vc4_wait_bo.c
@@ -57,7 +57,7 @@ test_used_bo(int fd, uint64_t timeout)
 	gem_close(fd, handle);
 }
 
-igt_main
+igt_main()
 {
 	int fd;
 	int bo_handle;
diff --git a/tests/vc4/vc4_wait_seqno.c b/tests/vc4/vc4_wait_seqno.c
index b390d76b55e6..e192378745b6 100644
--- a/tests/vc4/vc4_wait_seqno.c
+++ b/tests/vc4/vc4_wait_seqno.c
@@ -24,7 +24,7 @@
 #include "igt.h"
 #include "igt_vc4.h"
 
-igt_main
+igt_main()
 {
 	int fd;
 
diff --git a/tests/vgem_basic.c b/tests/vgem_basic.c
index 35739b0e82c1..0f94a1649a02 100644
--- a/tests/vgem_basic.c
+++ b/tests/vgem_basic.c
@@ -489,7 +489,7 @@ static bool has_prime_export(int fd)
 	return value & DRM_PRIME_CAP_EXPORT;
 }
 
-igt_main
+igt_main()
 {
 	int fd = -1;
 
diff --git a/tests/vgem_slow.c b/tests/vgem_slow.c
index 0e5ead6fa547..0da74b1fb09c 100644
--- a/tests/vgem_slow.c
+++ b/tests/vgem_slow.c
@@ -85,7 +85,7 @@ static void test_nohang(int fd)
 	gem_close(fd, bo.handle);
 }
 
-igt_main
+igt_main()
 {
 	int fd = -1;
 
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 69ebb23ec4bf..6a585c96bce0 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1895,7 +1895,7 @@ static void test_enabled_connector_hot_plug(void)
 	igt_vkms_device_destroy(dev);
 }
 
-igt_main
+igt_main()
 {
 	struct {
 		const char *name;
diff --git a/tests/vmwgfx/vmw_mob_stress.c b/tests/vmwgfx/vmw_mob_stress.c
index cf229fb3b33d..9f5fbd7c09ce 100644
--- a/tests/vmwgfx/vmw_mob_stress.c
+++ b/tests/vmwgfx/vmw_mob_stress.c
@@ -45,7 +45,7 @@ static void test_triangle_render(struct vmw_svga_device *device, int32 cid)
 	vmw_destroy_default_objects(device, &objects);
 }
 
-igt_main
+igt_main()
 {
 	struct vmw_svga_device device;
 	int32 cid;
diff --git a/tests/vmwgfx/vmw_prime.c b/tests/vmwgfx/vmw_prime.c
index 5346ed4336bf..7ff5ec843539 100644
--- a/tests/vmwgfx/vmw_prime.c
+++ b/tests/vmwgfx/vmw_prime.c
@@ -503,7 +503,7 @@ static void test_vgem(struct gpu_process_t *gpu, int vgem_fd)
 	gem_close(gpu->mdevice.drm_fd, vmw_buffer_handle);
 }
 
-igt_main
+igt_main()
 {
 	struct gpu_process_t gpu = { 0 };
 	int second_fd_vgem = -1;
diff --git a/tests/vmwgfx/vmw_ref_count.c b/tests/vmwgfx/vmw_ref_count.c
index 40f46588bce7..1f3606c30cdc 100644
--- a/tests/vmwgfx/vmw_ref_count.c
+++ b/tests/vmwgfx/vmw_ref_count.c
@@ -86,7 +86,7 @@ static bool ref_surface_and_check_contents(int32 fd, uint32 surface_handle)
 	return data_valid;
 }
 
-igt_main
+igt_main()
 {
 	int32 fd1, fd2;
 	const uint32 size = sizeof(data);
diff --git a/tests/vmwgfx/vmw_surface_copy.c b/tests/vmwgfx/vmw_surface_copy.c
index 7c44be1c25bb..92b0740319e4 100644
--- a/tests/vmwgfx/vmw_surface_copy.c
+++ b/tests/vmwgfx/vmw_surface_copy.c
@@ -306,7 +306,7 @@ static void test_invalid_copies_3d(int fd, int32 cid)
 	vmw_ioctl_surface_unref(fd, s2);
 }
 
-igt_main
+igt_main()
 {
 	int fd;
 	int32 cid;
diff --git a/tests/vmwgfx/vmw_tri.c b/tests/vmwgfx/vmw_tri.c
index 4c79e5e2152a..3091d925526d 100644
--- a/tests/vmwgfx/vmw_tri.c
+++ b/tests/vmwgfx/vmw_tri.c
@@ -180,7 +180,7 @@ static void draw_triangle_on_coherent_rt(struct vmw_svga_device *device,
 	vmw_destroy_default_objects(device, &objects);
 }
 
-igt_main
+igt_main()
 {
 	struct vmw_svga_device device;
 	int32 cid;
-- 
2.49.1

