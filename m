Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 854A110E5F2
 for <igt-dev@lists.freedesktop.org>; Fri,  5 May 2023 12:46:55 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.18.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 01544580D56
 for <igt-dev@lists.freedesktop.org>; Fri,  5 May 2023 05:46:47 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1puuph-001Nkm-04
 for igt-dev@lists.freedesktop.org; Fri, 05 May 2023 14:46:45 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  5 May 2023 14:46:39 +0200
Message-Id: <20230505124643.327813-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/4] Better document i915 tests
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

The i915 test documentation has several gaps. Convert them
to use igt_doc.py tool, adding information from existing
sources.

Please notice that patches 3 and 4 were generated via some
script, which collects data from several different sources.

This is the first step to have a more comprehensive documentation
for i915 tests. Manual work will be needed in order to do some
additional cleanups.

Mauro Carvalho Chehab (4):
  scripts/test_list.py: add support to exclude files
  testplan/meson.build: add i915 support for a testplan document
  tests/i915: Improve test documentation
  tests/i915: Enhance test documentation

 docs/testplan/conf.py                       |    2 +-
 docs/testplan/meson.build                   |   10 +-
 scripts/test_list.py                        |   10 +
 tests/core_auth.c                           |   25 +
 tests/core_getclient.c                      |   12 +
 tests/core_getstats.c                       |   12 +
 tests/core_getversion.c                     |   12 +
 tests/core_hotunplug.c                      |   50 +
 tests/core_setmaster.c                      |   19 +
 tests/core_setmaster_vs_auth.c              |   13 +
 tests/debugfs_test.c                        |   38 +
 tests/device_reset.c                        |   25 +
 tests/dmabuf.c                              |    8 +
 tests/drm_mm.c                              |    8 +
 tests/dumb_buffer.c                         |   37 +
 tests/i915/api_intel_allocator.c            |   77 +
 tests/i915/api_intel_bb.c                   |  111 ++
 tests/i915/drm_fdinfo.c                     |   44 +
 tests/i915/gem_bad_reloc.c                  |   19 +
 tests/i915/gem_barrier_race.c               |   14 +
 tests/i915/gem_basic.c                      |   37 +
 tests/i915/gem_blits.c                      |   11 +
 tests/i915/gem_busy.c                       |   46 +
 tests/i915/gem_caching.c                    |   20 +
 tests/i915/gem_ccs.c                        |   33 +
 tests/i915/gem_close.c                      |   13 +
 tests/i915/gem_close_race.c                 |   53 +
 tests/i915/gem_create.c                     |   70 +
 tests/i915/gem_cs_tlb.c                     |   12 +
 tests/i915/gem_ctx_bad_destroy.c            |   18 +
 tests/i915/gem_ctx_create.c                 |   75 +
 tests/i915/gem_ctx_engines.c                |   26 +
 tests/i915/gem_ctx_exec.c                   |   53 +
 tests/i915/gem_ctx_freq.c                   |   11 +
 tests/i915/gem_ctx_isolation.c              |   53 +
 tests/i915/gem_ctx_param.c                  |  146 ++
 tests/i915/gem_ctx_persistence.c            |  154 ++
 tests/i915/gem_ctx_shared.c                 |   51 +
 tests/i915/gem_ctx_sseu.c                   |   14 +
 tests/i915/gem_ctx_switch.c                 |  365 +++++
 tests/i915/gem_eio.c                        |  178 +++
 tests/i915/gem_evict_alignment.c            |   17 +
 tests/i915/gem_evict_everything.c           |   61 +
 tests/i915/gem_exec_alignment.c             |   27 +
 tests/i915/gem_exec_async.c                 |   14 +
 tests/i915/gem_exec_await.c                 |   16 +
 tests/i915/gem_exec_balancer.c              |  194 +++
 tests/i915/gem_exec_basic.c                 |   16 +
 tests/i915/gem_exec_big.c                   |   14 +
 tests/i915/gem_exec_capture.c               |   40 +
 tests/i915/gem_exec_create.c                |   44 +
 tests/i915/gem_exec_endless.c               |   11 +
 tests/i915/gem_exec_fair.c                  |   92 ++
 tests/i915/gem_exec_fence.c                 |  369 +++++
 tests/i915/gem_exec_flush.c                 | 1496 +++++++++++++++++++
 tests/i915/gem_exec_gttfill.c               |   35 +
 tests/i915/gem_exec_latency.c               |   30 +
 tests/i915/gem_exec_lut_handle.c            |    7 +
 tests/i915/gem_exec_nop.c                   |   63 +
 tests/i915/gem_exec_parallel.c              |   43 +
 tests/i915/gem_exec_params.c                |  125 ++
 tests/i915/gem_exec_reloc.c                 |  593 ++++++++
 tests/i915/gem_exec_schedule.c              |  336 +++++
 tests/i915/gem_exec_store.c                 |   33 +
 tests/i915/gem_exec_suspend.c               |   81 +
 tests/i915/gem_exec_whisper.c               |  256 ++++
 tests/i915/gem_exercise_blt.c               |   17 +
 tests/i915/gem_fd_exhaustion.c              |    6 +
 tests/i915/gem_fence_thrash.c               |   19 +
 tests/i915/gem_fence_upload.c               |   16 +
 tests/i915/gem_fenced_exec_thrash.c         |   18 +
 tests/i915/gem_flink_basic.c                |   39 +
 tests/i915/gem_flink_race.c                 |   17 +
 tests/i915/gem_gpgpu_fill.c                 |   11 +
 tests/i915/gem_gtt_cpu_tlb.c                |    9 +
 tests/i915/gem_gtt_hog.c                    |    6 +
 tests/i915/gem_gtt_speed.c                  |    6 +
 tests/i915/gem_huc_copy.c                   |   11 +
 tests/i915/gem_linear_blits.c               |   25 +
 tests/i915/gem_lmem_evict.c                 |   10 +
 tests/i915/gem_lmem_swapping.c              |  121 ++
 tests/i915/gem_lut_handle.c                 |    7 +
 tests/i915/gem_madvise.c                    |   31 +
 tests/i915/gem_media_fill.c                 |    8 +
 tests/i915/gem_media_vme.c                  |    8 +
 tests/i915/gem_mmap.c                       |   57 +
 tests/i915/gem_mmap_gtt.c                   |  488 ++++++
 tests/i915/gem_mmap_offset.c                |   76 +
 tests/i915/gem_mmap_wc.c                    |   67 +
 tests/i915/gem_partial_pwrite_pread.c       |   62 +
 tests/i915/gem_pipe_control_store_loop.c    |   17 +
 tests/i915/gem_ppgtt.c                      |   29 +
 tests/i915/gem_pread.c                      |   17 +
 tests/i915/gem_pread_after_blit.c           |   29 +
 tests/i915/gem_pwrite.c                     |   67 +
 tests/i915/gem_pwrite_snooped.c             |    9 +
 tests/i915/gem_pxp.c                        |   79 +
 tests/i915/gem_read_read_speed.c            |   61 +
 tests/i915/gem_readwrite.c                  |   15 +
 tests/i915/gem_reg_read.c                   |   11 +
 tests/i915/gem_render_copy.c                |  120 ++
 tests/i915/gem_render_copy_redux.c          |   17 +
 tests/i915/gem_render_linear_blits.c        |   16 +
 tests/i915/gem_render_tiled_blits.c         |   27 +
 tests/i915/gem_request_retire.c             |   12 +
 tests/i915/gem_reset_stats.c                |  178 +++
 tests/i915/gem_ringfill.c                   |  123 ++
 tests/i915/gem_set_tiling_vs_blt.c          |   15 +
 tests/i915/gem_set_tiling_vs_gtt.c          |    8 +
 tests/i915/gem_set_tiling_vs_pwrite.c       |    8 +
 tests/i915/gem_shrink.c                     |  111 ++
 tests/i915/gem_softpin.c                    |  203 +++
 tests/i915/gem_spin_batch.c                 |   66 +
 tests/i915/gem_streaming_writes.c           |   29 +
 tests/i915/gem_stress.c                     |    7 +
 tests/i915/gem_sync.c                       |  247 +++
 tests/i915/gem_tiled_blits.c                |   17 +
 tests/i915/gem_tiled_fence_blits.c          |   15 +
 tests/i915/gem_tiled_partial_pwrite_pread.c |   12 +
 tests/i915/gem_tiled_pread_basic.c          |    9 +
 tests/i915/gem_tiled_pread_pwrite.c         |    9 +
 tests/i915/gem_tiled_swapping.c             |   10 +
 tests/i915/gem_tiled_wb.c                   |   11 +
 tests/i915/gem_tiled_wc.c                   |    8 +
 tests/i915/gem_tiling_max_stride.c          |    9 +
 tests/i915/gem_unfence_active_buffers.c     |    8 +
 tests/i915/gem_unref_active_buffers.c       |   12 +
 tests/i915/gem_userptr_blits.c              |  302 ++++
 tests/i915/gem_vm_create.c                  |   39 +
 tests/i915/gem_wait.c                       |   71 +
 tests/i915/gem_watchdog.c                   |   11 +
 tests/i915/gem_workarounds.c                |   71 +
 tests/i915/gen3_mixed_blits.c               |    7 +
 tests/i915/gen3_render_linear_blits.c       |    7 +
 tests/i915/gen3_render_mixed_blits.c        |    7 +
 tests/i915/gen3_render_tiledx_blits.c       |    7 +
 tests/i915/gen3_render_tiledy_blits.c       |    7 +
 tests/i915/gen7_exec_parse.c                |   31 +
 tests/i915/gen9_exec_parse.c                |   47 +
 tests/i915/i915_fb_tiling.c                 |    8 +
 tests/i915/i915_getparams_basic.c           |   19 +
 tests/i915/i915_hangman.c                   |   83 +
 tests/i915/i915_hwmon.c                     |   13 +
 tests/i915/i915_module_load.c               |   40 +
 tests/i915/i915_pciid.c                     |   13 +
 tests/i915/i915_pipe_stress.c               |   17 +
 tests/i915/i915_pm_backlight.c              |   25 +
 tests/i915/i915_pm_dc.c                     |   41 +
 tests/i915/i915_pm_freq_api.c               |   11 +
 tests/i915/i915_pm_freq_mult.c              |   10 +
 tests/i915/i915_pm_lpsp.c                   |   12 +
 tests/i915/i915_pm_rc6_residency.c          |   16 +
 tests/i915/i915_pm_rpm.c                    |  190 +++
 tests/i915/i915_pm_rps.c                    |   42 +
 tests/i915/i915_pm_sseu.c                   |    8 +
 tests/i915/i915_power.c                     |   12 +
 tests/i915/i915_query.c                     |   97 ++
 tests/i915/i915_selftest.c                  |   16 +
 tests/i915/i915_suspend.c                   |   79 +
 tests/i915/i915_test_config.json            |   88 ++
 tests/i915/perf.c                           |  266 ++++
 tests/i915/perf_pmu.c                       |  250 ++++
 tests/i915/sysfs_defaults.c                 |   12 +
 tests/i915/sysfs_heartbeat_interval.c       |   25 +
 tests/i915/sysfs_preempt_timeout.c          |   18 +
 tests/i915/sysfs_timeslice_duration.c       |   24 +
 tests/prime_busy.c                          |   27 +
 tests/prime_mmap.c                          |   33 +
 tests/prime_mmap_coherency.c                |   20 +
 tests/prime_self_import.c                   |   50 +
 tests/prime_vgem.c                          |  131 ++
 tests/sw_sync.c                             |   46 +
 tests/syncobj_basic.c                       |   34 +
 tests/syncobj_timeline.c                    |  398 +++++
 tests/syncobj_wait.c                        |  284 ++++
 tests/vgem_basic.c                          |  107 ++
 tests/vgem_slow.c                           |   13 +
 177 files changed, 11954 insertions(+), 5 deletions(-)
 create mode 100644 tests/i915/i915_test_config.json

-- 
2.40.1
