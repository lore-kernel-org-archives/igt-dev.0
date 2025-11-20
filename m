Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE66CFA443
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 19:14:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C614A10E7CC;
	Thu, 20 Nov 2025 19:14:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GesFYA7A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B6010E7CC
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 19:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763666060; x=1795202060;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tgj3fnndj9WpQWicsIkrm/ghPTEi+M3Nu2d9YdWTcow=;
 b=GesFYA7AMLo2VmOE7zlR9ovVMlZYZVhSRWFvURcZVLfhQNmUWgamGTUd
 8JRVnEtRcSoY4yfJGTj8j9/Gxscuhqptz158vz2C2w0lBd2Au2DUEeYXu
 RPtvlCyiuIV7VsECcRwvM2PhxGJu8b3ajPeipkA4FGkt2TGAaSBUKFQa8
 P8xGZ4U9HZRvTjKnX0wJuZEqliOrylZnhBM5KXfnnEbp0ibTgrkITJDkr
 oVV3SKxeByVq2qBpQx7eqBqySLgNWdnZPCTpEJmW5phwP72y2wDzNn0jV
 WNXMrvuw4pSYa4OGNhYxvLsv/OvWhkxFdEitZKKAfL+GhEDIXHS8e3N9U Q==;
X-CSE-ConnectionGUID: HhCXuNY3RD+u0wzd5VYMuQ==
X-CSE-MsgGUID: gyIUah1cQDOBh5Q+sogoHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65448697"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="65448697"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 11:14:20 -0800
X-CSE-ConnectionGUID: XoDP6zQHRTq+LcRBJ18yIA==
X-CSE-MsgGUID: Ys/vinK+TfOD/GLR0XkiQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="195753405"
Received: from inaky-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.245.244.92])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 11:14:19 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/7] igt: Help out coccinelle
Date: Thu, 20 Nov 2025 21:14:08 +0200
Message-ID: <20251120191415.4236-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
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

Coccinelle has trouble parsing a lot of the magic macros
used throughout igt. Convert some of the macros to a form
coccinelle understands, and provide a pre-made iterators.cocci
script that people can include in their own scripts to help
coccinelle with the iterator macros.

Ville Syrjälä (7):
  igt: Make igt_fixture look like an iterator
  igt: Make igt_subtest_group look like an iterator
  igt: Make igt_main look more like a function
  igt: Make igt_simple_main look more like a function
  igt: Make igt_main*() look like normal function definition
  igt: Make igt_simple_main*() look like normal function definition
  scripts/cocci: Add iterators.cocci

 benchmarks/gem_userptr_benchmark.c            |   6 +-
 benchmarks/kms_fb_stress.c                    |   2 +-
 lib/igt_aux.c                                 |   6 +-
 lib/igt_core.c                                |  42 ++--
 lib/igt_core.h                                |  42 ++--
 lib/igt_dir.c                                 |   8 +-
 lib/igt_gt.c                                  |   2 +-
 lib/igt_kmod.c                                |  12 +-
 lib/igt_types.h                               |   2 +-
 lib/intel_batchbuffer.c                       |   2 +-
 lib/tests/bad_subtest_type.c                  |   2 +-
 lib/tests/i915_perf_data_alignment.c          |   2 +-
 lib/tests/igt_abort.c                         |   2 +-
 lib/tests/igt_assert.c                        |   2 +-
 lib/tests/igt_audio.c                         |   8 +-
 lib/tests/igt_can_fail.c                      |   4 +-
 lib/tests/igt_can_fail_simple.c               |   2 +-
 lib/tests/igt_describe.c                      |   8 +-
 lib/tests/igt_edid.c                          |   2 +-
 lib/tests/igt_exit_handler.c                  |   2 +-
 lib/tests/igt_facts.c                         |   2 +-
 lib/tests/igt_hook.c                          |   6 +-
 lib/tests/igt_ktap_parser.c                   |   2 +-
 lib/tests/igt_nesting.c                       |  16 +-
 lib/tests/igt_runnercomms_packets.c           |   2 +-
 lib/tests/igt_simple_test_subtests.c          |   2 +-
 lib/tests/igt_simulation.c                    |   2 +-
 lib/tests/igt_stats.c                         |   2 +-
 lib/tests/igt_subtest_group.c                 |  18 +-
 lib/tests/igt_timeout.c                       |   2 +-
 lib/tests/igt_types.c                         |  22 +--
 runner/resultgen.c                            |   2 +-
 runner/runner_json_tests.c                    |   2 +-
 runner/runner_kmemleak_test.c                 |  10 +-
 runner/runner_tests.c                         | 184 +++++++++---------
 runner/testdata/abort-dynamic.c               |   2 +-
 runner/testdata/abort-fixture.c               |   4 +-
 runner/testdata/abort-simple.c                |   2 +-
 runner/testdata/abort.c                       |   2 +-
 runner/testdata/dynamic.c                     |   2 +-
 runner/testdata/no-subtests.c                 |   2 +-
 runner/testdata/skippers.c                    |   4 +-
 runner/testdata/successtest.c                 |   2 +-
 scripts/iterators.cocci                       |  53 +++++
 tests/amdgpu/amd_abm.c                        |   6 +-
 tests/amdgpu/amd_assr.c                       |   6 +-
 tests/amdgpu/amd_basic.c                      |   6 +-
 tests/amdgpu/amd_basic_ex.c                   |   6 +-
 tests/amdgpu/amd_basic_multi_gpu.c            |   6 +-
 tests/amdgpu/amd_bo.c                         |   6 +-
 tests/amdgpu/amd_bypass.c                     |   6 +-
 tests/amdgpu/amd_color.c                      |   6 +-
 tests/amdgpu/amd_cp_dma_misc.c                |   6 +-
 tests/amdgpu/amd_cs_nop.c                     |   6 +-
 tests/amdgpu/amd_deadlock.c                   |   6 +-
 tests/amdgpu/amd_dispatch.c                   |   6 +-
 tests/amdgpu/amd_dp_dsc.c                     |   6 +-
 tests/amdgpu/amd_freesync_video_mode.c        |   6 +-
 tests/amdgpu/amd_fuzzing.c                    |   6 +-
 tests/amdgpu/amd_gang_cs.c                    |   6 +-
 tests/amdgpu/amd_hotplug.c                    |   6 +-
 tests/amdgpu/amd_ilr.c                        |   6 +-
 tests/amdgpu/amd_info.c                       |   6 +-
 tests/amdgpu/amd_jpeg_dec.c                   |   6 +-
 tests/amdgpu/amd_jpeg_queue.c                 |   6 +-
 tests/amdgpu/amd_link_settings.c              |   6 +-
 tests/amdgpu/amd_mall.c                       |   6 +-
 tests/amdgpu/amd_max_bpc.c                    |   6 +-
 tests/amdgpu/amd_mem_leak.c                   |   6 +-
 tests/amdgpu/amd_mode_switch.c                |   6 +-
 tests/amdgpu/amd_module_load.c                |   4 +-
 tests/amdgpu/amd_multidisplay_modeset.c       |   6 +-
 tests/amdgpu/amd_odm.c                        |   6 +-
 tests/amdgpu/amd_pci_unplug.c                 |   6 +-
 tests/amdgpu/amd_plane.c                      |   6 +-
 tests/amdgpu/amd_prime.c                      |   6 +-
 tests/amdgpu/amd_psr.c                        |   6 +-
 tests/amdgpu/amd_pstate.c                     |   6 +-
 tests/amdgpu/amd_queue_reset.c                |   6 +-
 tests/amdgpu/amd_ras.c                        |   6 +-
 tests/amdgpu/amd_replay.c                     |   6 +-
 tests/amdgpu/amd_security.c                   |   6 +-
 tests/amdgpu/amd_subvp.c                      |   6 +-
 tests/amdgpu/amd_syncobj.c                    |   6 +-
 tests/amdgpu/amd_uvd_dec.c                    |   6 +-
 tests/amdgpu/amd_uvd_enc.c                    |   6 +-
 tests/amdgpu/amd_vce_enc.c                    |   6 +-
 tests/amdgpu/amd_vcn.c                        |   6 +-
 tests/amdgpu/amd_vcn_queue.c                  |   6 +-
 tests/amdgpu/amd_vm.c                         |   6 +-
 tests/amdgpu/amd_vpe.c                        |   6 +-
 tests/amdgpu/amd_vrr_range.c                  |   6 +-
 tests/chamelium/kms_chamelium_audio.c         |  14 +-
 tests/chamelium/kms_chamelium_color.c         |   8 +-
 tests/chamelium/kms_chamelium_edid.c          |  18 +-
 tests/chamelium/kms_chamelium_frames.c        |  18 +-
 tests/chamelium/kms_chamelium_hpd.c           |  22 +--
 .../kms_chamelium_sharpness_filter.c          |   6 +-
 tests/core_auth.c                             |   6 +-
 tests/core_debugfs.c                          |   6 +-
 tests/core_getclient.c                        |   6 +-
 tests/core_getstats.c                         |   6 +-
 tests/core_getversion.c                       |   6 +-
 tests/core_hotunplug.c                        |  52 ++---
 tests/core_setmaster.c                        |  10 +-
 tests/core_setmaster_vs_auth.c                |   2 +-
 tests/core_sysfs.c                            |   6 +-
 tests/device_reset.c                          |   8 +-
 tests/dmabuf.c                                |   2 +-
 tests/dmabuf_sync_file.c                      |   6 +-
 tests/drm_buddy.c                             |   2 +-
 tests/drm_mm.c                                |   2 +-
 tests/drm_read.c                              |   4 +-
 tests/drm_virtgpu.c                           |   6 +-
 tests/dumb_buffer.c                           |   6 +-
 tests/fbdev.c                                 |  18 +-
 tests/intel/api_intel_allocator.c             |   6 +-
 tests/intel/api_intel_bb.c                    |   6 +-
 tests/intel/gem_bad_reloc.c                   |   6 +-
 tests/intel/gem_barrier_race.c                |   6 +-
 tests/intel/gem_basic.c                       |   4 +-
 tests/intel/gem_blits.c                       |   6 +-
 tests/intel/gem_busy.c                        |  36 ++--
 tests/intel/gem_caching.c                     |   6 +-
 tests/intel/gem_ccs.c                         |   6 +-
 tests/intel/gem_close.c                       |   4 +-
 tests/intel/gem_close_race.c                  |   6 +-
 tests/intel/gem_compute.c                     |   6 +-
 tests/intel/gem_concurrent_all.c              |  52 ++---
 tests/intel/gem_create.c                      |  10 +-
 tests/intel/gem_cs_tlb.c                      |   6 +-
 tests/intel/gem_ctx_bad_destroy.c             |   6 +-
 tests/intel/gem_ctx_create.c                  |   6 +-
 tests/intel/gem_ctx_engines.c                 |   6 +-
 tests/intel/gem_ctx_exec.c                    |  12 +-
 tests/intel/gem_ctx_freq.c                    |   6 +-
 tests/intel/gem_ctx_isolation.c               |   8 +-
 tests/intel/gem_ctx_param.c                   |  10 +-
 tests/intel/gem_ctx_persistence.c             |  20 +-
 tests/intel/gem_ctx_shared.c                  |  20 +-
 tests/intel/gem_ctx_sseu.c                    |  10 +-
 tests/intel/gem_ctx_switch.c                  |  18 +-
 tests/intel/gem_eio.c                         |  18 +-
 tests/intel/gem_evict_alignment.c             |   8 +-
 tests/intel/gem_evict_everything.c            |  10 +-
 tests/intel/gem_exec_alignment.c              |   4 +-
 tests/intel/gem_exec_async.c                  |  12 +-
 tests/intel/gem_exec_await.c                  |   6 +-
 tests/intel/gem_exec_balancer.c               |  28 +--
 tests/intel/gem_exec_basic.c                  |   6 +-
 tests/intel/gem_exec_big.c                    |   6 +-
 tests/intel/gem_exec_capture.c                |   6 +-
 tests/intel/gem_exec_create.c                 |   6 +-
 tests/intel/gem_exec_endless.c                |  10 +-
 tests/intel/gem_exec_fair.c                   |   6 +-
 tests/intel/gem_exec_fence.c                  |  50 ++---
 tests/intel/gem_exec_flush.c                  |  10 +-
 tests/intel/gem_exec_gttfill.c                |   8 +-
 tests/intel/gem_exec_latency.c                |  14 +-
 tests/intel/gem_exec_lut_handle.c             |   2 +-
 tests/intel/gem_exec_nop.c                    |  14 +-
 tests/intel/gem_exec_parallel.c               |   6 +-
 tests/intel/gem_exec_params.c                 |   6 +-
 tests/intel/gem_exec_reloc.c                  |  18 +-
 tests/intel/gem_exec_schedule.c               |  46 ++---
 tests/intel/gem_exec_store.c                  |   6 +-
 tests/intel/gem_exec_suspend.c                |   8 +-
 tests/intel/gem_exec_whisper.c                |  10 +-
 tests/intel/gem_exercise_blt.c                |   6 +-
 tests/intel/gem_fd_exhaustion.c               |   2 +-
 tests/intel/gem_fence_thrash.c                |   2 +-
 tests/intel/gem_fence_upload.c                |   2 +-
 tests/intel/gem_fenced_exec_thrash.c          |   6 +-
 tests/intel/gem_flink_basic.c                 |   4 +-
 tests/intel/gem_flink_race.c                  |   2 +-
 tests/intel/gem_gpgpu_fill.c                  |   6 +-
 tests/intel/gem_gtt_cpu_tlb.c                 |   2 +-
 tests/intel/gem_gtt_hog.c                     |   2 +-
 tests/intel/gem_gtt_speed.c                   |   2 +-
 tests/intel/gem_huc_copy.c                    |   6 +-
 tests/intel/gem_linear_blits.c                |  10 +-
 tests/intel/gem_lmem_evict.c                  |   6 +-
 tests/intel/gem_lmem_swapping.c               |   6 +-
 tests/intel/gem_lut_handle.c                  |   2 +-
 tests/intel/gem_madvise.c                     |   2 +-
 tests/intel/gem_media_fill.c                  |   6 +-
 tests/intel/gem_media_vme.c                   |   2 +-
 tests/intel/gem_mmap.c                        |   6 +-
 tests/intel/gem_mmap_gtt.c                    |   8 +-
 tests/intel/gem_mmap_offset.c                 |   6 +-
 tests/intel/gem_mmap_wc.c                     |  10 +-
 tests/intel/gem_partial_pwrite_pread.c        |   8 +-
 tests/intel/gem_pipe_control_store_loop.c     |   6 +-
 tests/intel/gem_ppgtt.c                       |   6 +-
 tests/intel/gem_pread.c                       |   6 +-
 tests/intel/gem_pread_after_blit.c            |   8 +-
 tests/intel/gem_pwrite.c                      |   8 +-
 tests/intel/gem_pwrite_snooped.c              |   2 +-
 tests/intel/gem_pxp.c                         |  16 +-
 tests/intel/gem_read_read_speed.c             |   6 +-
 tests/intel/gem_readwrite.c                   |   6 +-
 tests/intel/gem_reg_read.c                    |   6 +-
 tests/intel/gem_render_copy.c                 |   6 +-
 tests/intel/gem_render_copy_redux.c           |   6 +-
 tests/intel/gem_render_linear_blits.c         |   4 +-
 tests/intel/gem_render_tiled_blits.c          |   4 +-
 tests/intel/gem_request_retire.c              |   4 +-
 tests/intel/gem_reset_stats.c                 |  12 +-
 tests/intel/gem_ringfill.c                    |   6 +-
 tests/intel/gem_set_tiling_vs_blt.c           |   6 +-
 tests/intel/gem_set_tiling_vs_gtt.c           |   2 +-
 tests/intel/gem_set_tiling_vs_pwrite.c        |   2 +-
 tests/intel/gem_shrink.c                      |   4 +-
 tests/intel/gem_softpin.c                     |  16 +-
 tests/intel/gem_spin_batch.c                  |  12 +-
 tests/intel/gem_streaming_writes.c            |   6 +-
 tests/intel/gem_stress.c                      |   2 +-
 tests/intel/gem_sync.c                        |  10 +-
 tests/intel/gem_tiled_blits.c                 |  12 +-
 tests/intel/gem_tiled_fence_blits.c           |  12 +-
 tests/intel/gem_tiled_partial_pwrite_pread.c  |   6 +-
 tests/intel/gem_tiled_pread_basic.c           |   2 +-
 tests/intel/gem_tiled_pread_pwrite.c          |   2 +-
 tests/intel/gem_tiled_swapping.c              |   6 +-
 tests/intel/gem_tiled_wb.c                    |   2 +-
 tests/intel/gem_tiled_wc.c                    |   2 +-
 tests/intel/gem_tiling_max_stride.c           |   2 +-
 tests/intel/gem_unfence_active_buffers.c      |   2 +-
 tests/intel/gem_unref_active_buffers.c        |   2 +-
 tests/intel/gem_userptr_blits.c               |  24 +--
 tests/intel/gem_vm_create.c                   |  10 +-
 tests/intel/gem_wait.c                        |  18 +-
 tests/intel/gem_watchdog.c                    |   8 +-
 tests/intel/gem_workarounds.c                 |  10 +-
 tests/intel/gen3_mixed_blits.c                |   2 +-
 tests/intel/gen3_render_linear_blits.c        |   2 +-
 tests/intel/gen3_render_mixed_blits.c         |   2 +-
 tests/intel/gen3_render_tiledx_blits.c        |   2 +-
 tests/intel/gen3_render_tiledy_blits.c        |   2 +-
 tests/intel/gen7_exec_parse.c                 |  12 +-
 tests/intel/gen9_exec_parse.c                 |   6 +-
 tests/intel/i915_drm_fdinfo.c                 |  12 +-
 tests/intel/i915_fb_tiling.c                  |   6 +-
 tests/intel/i915_getparams_basic.c            |   4 +-
 tests/intel/i915_hangman.c                    |   8 +-
 tests/intel/i915_module_load.c                |   2 +-
 tests/intel/i915_pciid.c                      |   2 +-
 tests/intel/i915_pm_freq_api.c                |   4 +-
 tests/intel/i915_pm_freq_mult.c               |   6 +-
 tests/intel/i915_pm_rc6_residency.c           |  12 +-
 tests/intel/i915_pm_rpm.c                     |   6 +-
 tests/intel/i915_pm_rps.c                     |   6 +-
 tests/intel/i915_pm_sseu.c                    |   4 +-
 tests/intel/i915_power.c                      |   6 +-
 tests/intel/i915_query.c                      |  10 +-
 tests/intel/i915_selftest.c                   |   2 +-
 tests/intel/i915_suspend.c                    |   6 +-
 tests/intel/intel_hwmon.c                     |   6 +-
 tests/intel/kms_big_fb.c                      |  10 +-
 tests/intel/kms_busy.c                        |  10 +-
 tests/intel/kms_ccs.c                         |  10 +-
 tests/intel/kms_cdclk.c                       |   6 +-
 tests/intel/kms_dirtyfb.c                     |   6 +-
 tests/intel/kms_dp_link_training.c            |   6 +-
 tests/intel/kms_dp_linktrain_fallback.c       |   6 +-
 tests/intel/kms_draw_crc.c                    |   6 +-
 tests/intel/kms_dsc.c                         |   6 +-
 tests/intel/kms_fb_coherency.c                |   6 +-
 tests/intel/kms_fbc_dirty_rect.c              |   6 +-
 tests/intel/kms_fbcon_fbt.c                   |   6 +-
 tests/intel/kms_fence_pin_leak.c              |   2 +-
 tests/intel/kms_flip_scaled_crc.c             |   6 +-
 tests/intel/kms_flip_tiling.c                 |   6 +-
 tests/intel/kms_frontbuffer_tracking.c        |  10 +-
 tests/intel/kms_joiner.c                      |  22 +--
 tests/intel/kms_legacy_colorkey.c             |   6 +-
 tests/intel/kms_mmap_write_crc.c              |   6 +-
 tests/intel/kms_pipe_b_c_ivb.c                |   6 +-
 tests/intel/kms_pipe_stress.c                 |   6 +-
 tests/intel/kms_pm_backlight.c                |   6 +-
 tests/intel/kms_pm_dc.c                       |   6 +-
 tests/intel/kms_pm_lpsp.c                     |   6 +-
 tests/intel/kms_pm_rpm.c                      |   6 +-
 tests/intel/kms_psr.c                         |   6 +-
 tests/intel/kms_psr2_sf.c                     |   6 +-
 tests/intel/kms_psr2_su.c                     |   6 +-
 tests/intel/kms_psr_stress_test.c             |   6 +-
 tests/intel/kms_pwrite_crc.c                  |   2 +-
 tests/intel/perf.c                            |  14 +-
 tests/intel/perf_pmu.c                        |  18 +-
 tests/intel/prime_busy.c                      |  10 +-
 tests/intel/prime_mmap.c                      |   6 +-
 tests/intel/prime_mmap_coherency.c            |   6 +-
 tests/intel/prime_mmap_kms.c                  |   6 +-
 tests/intel/prime_self_import.c               |   2 +-
 tests/intel/sysfs_defaults.c                  |   6 +-
 tests/intel/sysfs_heartbeat_interval.c        |   6 +-
 tests/intel/sysfs_preempt_timeout.c           |   6 +-
 tests/intel/sysfs_timeslice_duration.c        |   6 +-
 tests/intel/xe_ccs.c                          |   6 +-
 tests/intel/xe_compute.c                      |   8 +-
 tests/intel/xe_compute_preempt.c              |   6 +-
 tests/intel/xe_configfs.c                     |   6 +-
 tests/intel/xe_copy_basic.c                   |   6 +-
 tests/intel/xe_create.c                       |   6 +-
 tests/intel/xe_debugfs.c                      |   6 +-
 tests/intel/xe_dma_buf_sync.c                 |   6 +-
 tests/intel/xe_drm_fdinfo.c                   |   6 +-
 tests/intel/xe_eu_stall.c                     |   6 +-
 tests/intel/xe_eudebug.c                      |  14 +-
 tests/intel/xe_eudebug_online.c               |  10 +-
 tests/intel/xe_eudebug_sriov.c                |   6 +-
 tests/intel/xe_evict.c                        |   6 +-
 tests/intel/xe_evict_ccs.c                    |   8 +-
 tests/intel/xe_exec_atomic.c                  |   6 +-
 tests/intel/xe_exec_balancer.c                |   6 +-
 tests/intel/xe_exec_basic.c                   |   6 +-
 tests/intel/xe_exec_capture.c                 |   6 +-
 tests/intel/xe_exec_compute_mode.c            |   6 +-
 tests/intel/xe_exec_fault_mode.c              |   6 +-
 tests/intel/xe_exec_mix_modes.c               |   6 +-
 tests/intel/xe_exec_queue_property.c          |  10 +-
 tests/intel/xe_exec_reset.c                   |   6 +-
 tests/intel/xe_exec_sip.c                     |   6 +-
 tests/intel/xe_exec_sip_eudebug.c             |  18 +-
 tests/intel/xe_exec_store.c                   |   6 +-
 tests/intel/xe_exec_system_allocator.c        |   6 +-
 tests/intel/xe_exec_threads.c                 |   6 +-
 tests/intel/xe_exercise_blt.c                 |   6 +-
 tests/intel/xe_fault_injection.c              |   8 +-
 tests/intel/xe_gpgpu_fill.c                   |   6 +-
 tests/intel/xe_gt_freq.c                      |   6 +-
 tests/intel/xe_huc_copy.c                     |   6 +-
 tests/intel/xe_intel_bb.c                     |   6 +-
 tests/intel/xe_live_ktest.c                   |   2 +-
 tests/intel/xe_media_fill.c                   |   6 +-
 tests/intel/xe_mmap.c                         |  10 +-
 tests/intel/xe_module_load.c                  |   2 +-
 tests/intel/xe_noexec_ping_pong.c             |   6 +-
 tests/intel/xe_oa.c                           |  22 +--
 tests/intel/xe_pat.c                          |   6 +-
 tests/intel/xe_peer2peer.c                    |   6 +-
 tests/intel/xe_pm.c                           |   8 +-
 tests/intel/xe_pm_residency.c                 |   6 +-
 tests/intel/xe_pmu.c                          |  26 +--
 tests/intel/xe_prime_self_import.c            |   6 +-
 tests/intel/xe_pxp.c                          |  14 +-
 tests/intel/xe_query.c                        |   6 +-
 tests/intel/xe_render_copy.c                  |   6 +-
 tests/intel/xe_spin_batch.c                   |   6 +-
 tests/intel/xe_sriov_auto_provisioning.c      |   6 +-
 tests/intel/xe_sriov_flr.c                    |   6 +-
 tests/intel/xe_sriov_scheduling.c             |   6 +-
 tests/intel/xe_sriov_vram.c                   |   6 +-
 tests/intel/xe_survivability.c                |   6 +-
 tests/intel/xe_sysfs_defaults.c               |   6 +-
 tests/intel/xe_sysfs_preempt_timeout.c        |   6 +-
 tests/intel/xe_sysfs_scheduler.c              |   6 +-
 tests/intel/xe_sysfs_timeslice_duration.c     |   6 +-
 tests/intel/xe_tlb.c                          |   6 +-
 tests/intel/xe_vm.c                           |   6 +-
 tests/intel/xe_waitfence.c                    |   6 +-
 tests/intel/xe_wedged.c                       |   6 +-
 tests/kms_3d.c                                |   6 +-
 tests/kms_addfb_basic.c                       |  68 +++----
 tests/kms_async_flips.c                       |  10 +-
 tests/kms_atomic.c                            |   6 +-
 tests/kms_atomic_interruptible.c              |   6 +-
 tests/kms_atomic_transition.c                 |   6 +-
 tests/kms_bw.c                                |   6 +-
 tests/kms_color.c                             |  12 +-
 tests/kms_concurrent.c                        |   6 +-
 tests/kms_content_protection.c                |  14 +-
 tests/kms_cursor_crc.c                        |  24 +--
 tests/kms_cursor_edge_walk.c                  |   8 +-
 tests/kms_cursor_legacy.c                     |  40 ++--
 tests/kms_debugfs.c                           |   6 +-
 tests/kms_display_modes.c                     |   6 +-
 tests/kms_dither.c                            |   6 +-
 tests/kms_dp_aux_dev.c                        |   2 +-
 tests/kms_feature_discovery.c                 |  12 +-
 tests/kms_flip.c                              |   6 +-
 tests/kms_flip_event_leak.c                   |   6 +-
 tests/kms_force_connector_basic.c             |   6 +-
 tests/kms_getfb.c                             |  30 +--
 tests/kms_hdmi_inject.c                       |   6 +-
 tests/kms_hdr.c                               |   6 +-
 tests/kms_invalid_mode.c                      |   6 +-
 tests/kms_lease.c                             |  12 +-
 tests/kms_multipipe_modeset.c                 |   6 +-
 tests/kms_panel_fitting.c                     |   8 +-
 tests/kms_pipe_crc_basic.c                    |   6 +-
 tests/kms_plane.c                             |   6 +-
 tests/kms_plane_alpha_blend.c                 |   6 +-
 tests/kms_plane_cursor.c                      |   6 +-
 tests/kms_plane_lowres.c                      |   6 +-
 tests/kms_plane_multiple.c                    |   6 +-
 tests/kms_plane_scaling.c                     |  14 +-
 tests/kms_prime.c                             |  18 +-
 tests/kms_prop_blob.c                         |  10 +-
 tests/kms_properties.c                        |  14 +-
 tests/kms_rmfb.c                              |   6 +-
 tests/kms_rotation_crc.c                      |   8 +-
 tests/kms_scaling_modes.c                     |   6 +-
 tests/kms_selftest.c                          |   2 +-
 tests/kms_sequence.c                          |   6 +-
 tests/kms_setmode.c                           |   6 +-
 tests/kms_sharpness_filter.c                  |   6 +-
 tests/kms_sysfs_edid_timing.c                 |   2 +-
 tests/kms_tiled_display.c                     |   6 +-
 tests/kms_tv_load_detect.c                    |   6 +-
 tests/kms_universal_plane.c                   |   6 +-
 tests/kms_vblank.c                            |   6 +-
 tests/kms_vrr.c                               |  10 +-
 tests/kms_writeback.c                         |   6 +-
 tests/meta_test.c                             |   4 +-
 tests/msm/msm_mapping.c                       |   6 +-
 tests/msm/msm_recovery.c                      |   6 +-
 tests/msm/msm_shrink.c                        |   6 +-
 tests/msm/msm_submit.c                        |   6 +-
 tests/msm/msm_submitoverhead.c                |   6 +-
 tests/nouveau_crc.c                           |  10 +-
 tests/panfrost/panfrost_gem_new.c             |   6 +-
 tests/panfrost/panfrost_get_param.c           |   6 +-
 tests/panfrost/panfrost_prime.c               |   6 +-
 tests/panfrost/panfrost_submit.c              |   6 +-
 tests/panthor/panthor_gem.c                   |   6 +-
 tests/panthor/panthor_group.c                 |   6 +-
 tests/panthor/panthor_query.c                 |   6 +-
 tests/panthor/panthor_vm.c                    |   6 +-
 tests/prime_nv_api.c                          |   6 +-
 tests/prime_nv_pcopy.c                        |   6 +-
 tests/prime_nv_test.c                         |   6 +-
 tests/prime_udl.c                             |   2 +-
 tests/prime_vgem.c                            |  24 +--
 tests/sriov_basic.c                           |   6 +-
 tests/sw_sync.c                               |   4 +-
 tests/syncobj_basic.c                         |   6 +-
 tests/syncobj_eventfd.c                       |   6 +-
 tests/syncobj_timeline.c                      |   6 +-
 tests/syncobj_wait.c                          |   6 +-
 tests/template.c                              |   8 +-
 tests/testdisplay.c                           |   2 +-
 tests/tools_test.c                            |   4 +-
 tests/v3d/v3d_create_bo.c                     |   6 +-
 tests/v3d/v3d_get_bo_offset.c                 |   6 +-
 tests/v3d/v3d_get_param.c                     |   6 +-
 tests/v3d/v3d_job_submission.c                |   6 +-
 tests/v3d/v3d_mmap.c                          |   6 +-
 tests/v3d/v3d_perfmon.c                       |   6 +-
 tests/v3d/v3d_submit_cl.c                     |   6 +-
 tests/v3d/v3d_submit_csd.c                    |   6 +-
 tests/v3d/v3d_wait_bo.c                       |   6 +-
 tests/vc4/vc4_create_bo.c                     |   6 +-
 tests/vc4/vc4_dmabuf_poll.c                   |   6 +-
 tests/vc4/vc4_label_bo.c                      |   6 +-
 tests/vc4/vc4_lookup_fail.c                   |   6 +-
 tests/vc4/vc4_mmap.c                          |   6 +-
 tests/vc4/vc4_perfmon.c                       |   6 +-
 tests/vc4/vc4_purgeable_bo.c                  |   6 +-
 tests/vc4/vc4_tiling.c                        |   6 +-
 tests/vc4/vc4_wait_bo.c                       |   6 +-
 tests/vc4/vc4_wait_seqno.c                    |   6 +-
 tests/vgem_basic.c                            |  14 +-
 tests/vgem_slow.c                             |   6 +-
 tests/vkms/vkms_configfs.c                    |   6 +-
 tests/vmwgfx/vmw_execution_buffer.c           |   6 +-
 tests/vmwgfx/vmw_mob_stress.c                 |   6 +-
 tests/vmwgfx/vmw_prime.c                      |  12 +-
 tests/vmwgfx/vmw_ref_count.c                  |   6 +-
 tests/vmwgfx/vmw_surface_copy.c               |   6 +-
 tests/vmwgfx/vmw_tri.c                        |   6 +-
 472 files changed, 1930 insertions(+), 1875 deletions(-)
 create mode 100644 scripts/iterators.cocci

-- 
2.49.1

