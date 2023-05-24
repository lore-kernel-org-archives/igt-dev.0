Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C780E10E040
 for <igt-dev@lists.freedesktop.org>; Wed, 24 May 2023 17:45:24 +0000 (UTC)
Date: Wed, 24 May 2023 19:45:20 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230524174520.mqgrc7wrjf7ry6md@kamilkon-desk1>
References: <20230518151842.287294-1-bhanuprakash.modem@intel.com>
 <20230518151842.287294-3-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230518151842.287294-3-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t V2 2/2] tests: Rename tests to represent the
 driver name
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Bhanuprakash,

On 2023-05-18 at 20:48:42 +0530, Bhanuprakash Modem wrote:
> Rename all intel specific tests to represent the supported driver. Test
> name should start with the driver_name prefix. Below are the Examples.
> 
> - tests/intel/i915_*.c : All i915 specific tests. Ex: i915_module_load.c
> - tests/intel/xe_*.c   : All XE specific tests. Ex: xe_module_load.c
> - tests/intel/kms_*.c  : All kms tests. Ex: kms_psr.c
> - tests/intel/intel_*.c: All tests those supports both i915 & XE.
> 
> V2: - Rebase

imho we should +cc CI team, so please add:

Cc: Ewelina Musial <ewelina.musial@intel.com>
Cc: Radoslaw Szwichtenberg <radoslaw.szwichtenberg@intel.com>

I will also add +cc Mauro.

> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> ---
>  README.md                                     |   2 +-
>  tests/intel-ci/blacklist-pre-merge.txt        |  14 +-
>  tests/intel-ci/blacklist.txt                  | 102 +++---
>  tests/intel-ci/fast-feedback.testlist         |  92 +++---
>  ...allocator.c => i915_api_intel_allocator.c} |   0
>  .../{api_intel_bb.c => i915_api_intel_bb.c}   |   0

Btw main concern is: do we really need this ? It looks like
a lot of work for our CI with little benefit, we may just
keep old names and we can keep in mind that:

intel_* - for both i915 and Xe (if there will be any)
kms_* - for both i915 and Xe
xe_* - for only Xe

and all the rest for only i915. Maybe we could rename few of
them, for example good candidates are sysfs_, perf_, drm_, api_?

>  .../intel/{drm_fdinfo.c => i915_drm_fdinfo.c} |   0
>  .../{gem_bad_reloc.c => i915_gem_bad_reloc.c} |   0
>  ...barrier_race.c => i915_gem_barrier_race.c} |   0

[...cut...]

>  ...rval.c => i915_sysfs_heartbeat_interval.c} |   0
>  ...timeout.c => i915_sysfs_preempt_timeout.c} |   0
>  ...tion.c => i915_sysfs_timeslice_duration.c} |   0
>  tests/meson.build                             | 304 +++++++++---------
>  137 files changed, 258 insertions(+), 258 deletions(-)
>  rename tests/intel/{api_intel_allocator.c => i915_api_intel_allocator.c} (100%)
>  rename tests/intel/{api_intel_bb.c => i915_api_intel_bb.c} (100%)
>  rename tests/intel/{drm_fdinfo.c => i915_drm_fdinfo.c} (100%)
>  rename tests/intel/{gem_bad_reloc.c => i915_gem_bad_reloc.c} (100%)
>  rename tests/intel/{gem_barrier_race.c => i915_gem_barrier_race.c} (100%)
>  rename tests/intel/{gem_basic.c => i915_gem_basic.c} (100%)
>  rename tests/intel/{gem_blits.c => i915_gem_blits.c} (100%)
>  rename tests/intel/{gem_busy.c => i915_gem_busy.c} (100%)
>  rename tests/intel/{gem_caching.c => i915_gem_caching.c} (100%)
>  rename tests/intel/{gem_ccs.c => i915_gem_ccs.c} (100%)
>  rename tests/intel/{gem_close.c => i915_gem_close.c} (100%)
>  rename tests/intel/{gem_close_race.c => i915_gem_close_race.c} (100%)
>  rename tests/intel/{gem_concurrent_all.c => i915_gem_concurrent_all.c} (100%)
>  rename tests/intel/{gem_concurrent_blit.c => i915_gem_concurrent_blit.c} (91%)
>  rename tests/intel/{gem_create.c => i915_gem_create.c} (100%)
>  rename tests/intel/{gem_cs_tlb.c => i915_gem_cs_tlb.c} (100%)
>  rename tests/intel/{gem_ctx_bad_destroy.c => i915_gem_ctx_bad_destroy.c} (100%)
>  rename tests/intel/{gem_ctx_create.c => i915_gem_ctx_create.c} (100%)
>  rename tests/intel/{gem_ctx_engines.c => i915_gem_ctx_engines.c} (100%)
>  rename tests/intel/{gem_ctx_exec.c => i915_gem_ctx_exec.c} (100%)
>  rename tests/intel/{gem_ctx_freq.c => i915_gem_ctx_freq.c} (100%)
>  rename tests/intel/{gem_ctx_isolation.c => i915_gem_ctx_isolation.c} (100%)
>  rename tests/intel/{gem_ctx_param.c => i915_gem_ctx_param.c} (100%)
>  rename tests/intel/{gem_ctx_persistence.c => i915_gem_ctx_persistence.c} (100%)
>  rename tests/intel/{gem_ctx_shared.c => i915_gem_ctx_shared.c} (100%)
>  rename tests/intel/{gem_ctx_sseu.c => i915_gem_ctx_sseu.c} (100%)
>  rename tests/intel/{gem_ctx_switch.c => i915_gem_ctx_switch.c} (100%)
>  rename tests/intel/{gem_eio.c => i915_gem_eio.c} (100%)
>  rename tests/intel/{gem_evict_alignment.c => i915_gem_evict_alignment.c} (100%)
>  rename tests/intel/{gem_evict_everything.c => i915_gem_evict_everything.c} (100%)
>  rename tests/intel/{gem_exec_alignment.c => i915_gem_exec_alignment.c} (100%)
>  rename tests/intel/{gem_exec_async.c => i915_gem_exec_async.c} (100%)
>  rename tests/intel/{gem_exec_await.c => i915_gem_exec_await.c} (100%)
>  rename tests/intel/{gem_exec_balancer.c => i915_gem_exec_balancer.c} (100%)
>  rename tests/intel/{gem_exec_basic.c => i915_gem_exec_basic.c} (100%)
>  rename tests/intel/{gem_exec_big.c => i915_gem_exec_big.c} (100%)
>  rename tests/intel/{gem_exec_capture.c => i915_gem_exec_capture.c} (100%)
>  rename tests/intel/{gem_exec_create.c => i915_gem_exec_create.c} (100%)
>  rename tests/intel/{gem_exec_endless.c => i915_gem_exec_endless.c} (100%)
>  rename tests/intel/{gem_exec_fair.c => i915_gem_exec_fair.c} (100%)
>  rename tests/intel/{gem_exec_fence.c => i915_gem_exec_fence.c} (100%)
>  rename tests/intel/{gem_exec_flush.c => i915_gem_exec_flush.c} (100%)
>  rename tests/intel/{gem_exec_gttfill.c => i915_gem_exec_gttfill.c} (100%)
>  rename tests/intel/{gem_exec_latency.c => i915_gem_exec_latency.c} (100%)
>  rename tests/intel/{gem_exec_lut_handle.c => i915_gem_exec_lut_handle.c} (100%)
>  rename tests/intel/{gem_exec_nop.c => i915_gem_exec_nop.c} (100%)
>  rename tests/intel/{gem_exec_parallel.c => i915_gem_exec_parallel.c} (100%)
>  rename tests/intel/{gem_exec_params.c => i915_gem_exec_params.c} (100%)
>  rename tests/intel/{gem_exec_reloc.c => i915_gem_exec_reloc.c} (100%)
>  rename tests/intel/{gem_exec_schedule.c => i915_gem_exec_schedule.c} (100%)
>  rename tests/intel/{gem_exec_store.c => i915_gem_exec_store.c} (100%)
>  rename tests/intel/{gem_exec_suspend.c => i915_gem_exec_suspend.c} (100%)
>  rename tests/intel/{gem_exec_whisper.c => i915_gem_exec_whisper.c} (100%)
>  rename tests/intel/{gem_exercise_blt.c => i915_gem_exercise_blt.c} (100%)
>  rename tests/intel/{gem_fd_exhaustion.c => i915_gem_fd_exhaustion.c} (100%)
>  rename tests/intel/{gem_fence_thrash.c => i915_gem_fence_thrash.c} (100%)
>  rename tests/intel/{gem_fence_upload.c => i915_gem_fence_upload.c} (100%)
>  rename tests/intel/{gem_fenced_exec_thrash.c => i915_gem_fenced_exec_thrash.c} (100%)
>  rename tests/intel/{gem_flink_basic.c => i915_gem_flink_basic.c} (100%)
>  rename tests/intel/{gem_flink_race.c => i915_gem_flink_race.c} (100%)
>  rename tests/intel/{gem_gpgpu_fill.c => i915_gem_gpgpu_fill.c} (100%)
>  rename tests/intel/{gem_gtt_cpu_tlb.c => i915_gem_gtt_cpu_tlb.c} (100%)
>  rename tests/intel/{gem_gtt_hog.c => i915_gem_gtt_hog.c} (100%)
>  rename tests/intel/{gem_gtt_speed.c => i915_gem_gtt_speed.c} (100%)
>  rename tests/intel/{gem_huc_copy.c => i915_gem_huc_copy.c} (100%)
>  rename tests/intel/{gem_linear_blits.c => i915_gem_linear_blits.c} (100%)
>  rename tests/intel/{gem_lmem_evict.c => i915_gem_lmem_evict.c} (100%)
>  rename tests/intel/{gem_lmem_swapping.c => i915_gem_lmem_swapping.c} (100%)
>  rename tests/intel/{gem_lut_handle.c => i915_gem_lut_handle.c} (100%)
>  rename tests/intel/{gem_madvise.c => i915_gem_madvise.c} (100%)
>  rename tests/intel/{gem_media_fill.c => i915_gem_media_fill.c} (100%)
>  rename tests/intel/{gem_media_vme.c => i915_gem_media_vme.c} (100%)
>  rename tests/intel/{gem_mmap.c => i915_gem_mmap.c} (100%)
>  rename tests/intel/{gem_mmap_gtt.c => i915_gem_mmap_gtt.c} (100%)
>  rename tests/intel/{gem_mmap_offset.c => i915_gem_mmap_offset.c} (100%)
>  rename tests/intel/{gem_mmap_wc.c => i915_gem_mmap_wc.c} (100%)
>  rename tests/intel/{gem_partial_pwrite_pread.c => i915_gem_partial_pwrite_pread.c} (100%)
>  rename tests/intel/{gem_pipe_control_store_loop.c => i915_gem_pipe_control_store_loop.c} (100%)
>  rename tests/intel/{gem_ppgtt.c => i915_gem_ppgtt.c} (100%)
>  rename tests/intel/{gem_pread.c => i915_gem_pread.c} (100%)
>  rename tests/intel/{gem_pread_after_blit.c => i915_gem_pread_after_blit.c} (100%)
>  rename tests/intel/{gem_pwrite.c => i915_gem_pwrite.c} (100%)
>  rename tests/intel/{gem_pwrite_snooped.c => i915_gem_pwrite_snooped.c} (100%)
>  rename tests/intel/{gem_pxp.c => i915_gem_pxp.c} (100%)
>  rename tests/intel/{gem_read_read_speed.c => i915_gem_read_read_speed.c} (100%)
>  rename tests/intel/{gem_readwrite.c => i915_gem_readwrite.c} (100%)
>  rename tests/intel/{gem_reg_read.c => i915_gem_reg_read.c} (100%)
>  rename tests/intel/{gem_render_copy.c => i915_gem_render_copy.c} (100%)
>  rename tests/intel/{gem_render_copy_redux.c => i915_gem_render_copy_redux.c} (100%)
>  rename tests/intel/{gem_render_linear_blits.c => i915_gem_render_linear_blits.c} (100%)
>  rename tests/intel/{gem_render_tiled_blits.c => i915_gem_render_tiled_blits.c} (100%)
>  rename tests/intel/{gem_request_retire.c => i915_gem_request_retire.c} (100%)
>  rename tests/intel/{gem_reset_stats.c => i915_gem_reset_stats.c} (100%)
>  rename tests/intel/{gem_ringfill.c => i915_gem_ringfill.c} (100%)
>  rename tests/intel/{gem_set_tiling_vs_blt.c => i915_gem_set_tiling_vs_blt.c} (100%)
>  rename tests/intel/{gem_set_tiling_vs_gtt.c => i915_gem_set_tiling_vs_gtt.c} (100%)
>  rename tests/intel/{gem_set_tiling_vs_pwrite.c => i915_gem_set_tiling_vs_pwrite.c} (100%)
>  rename tests/intel/{gem_shrink.c => i915_gem_shrink.c} (100%)
>  rename tests/intel/{gem_softpin.c => i915_gem_softpin.c} (100%)
>  rename tests/intel/{gem_spin_batch.c => i915_gem_spin_batch.c} (100%)
>  rename tests/intel/{gem_streaming_writes.c => i915_gem_streaming_writes.c} (100%)
>  rename tests/intel/{gem_stress.c => i915_gem_stress.c} (100%)
>  rename tests/intel/{gem_sync.c => i915_gem_sync.c} (100%)
>  rename tests/intel/{gem_tiled_blits.c => i915_gem_tiled_blits.c} (100%)
>  rename tests/intel/{gem_tiled_fence_blits.c => i915_gem_tiled_fence_blits.c} (100%)
>  rename tests/intel/{gem_tiled_partial_pwrite_pread.c => i915_gem_tiled_partial_pwrite_pread.c} (100%)
>  rename tests/intel/{gem_tiled_pread_basic.c => i915_gem_tiled_pread_basic.c} (100%)
>  rename tests/intel/{gem_tiled_pread_pwrite.c => i915_gem_tiled_pread_pwrite.c} (100%)
>  rename tests/intel/{gem_tiled_swapping.c => i915_gem_tiled_swapping.c} (100%)
>  rename tests/intel/{gem_tiled_wb.c => i915_gem_tiled_wb.c} (100%)
>  rename tests/intel/{gem_tiled_wc.c => i915_gem_tiled_wc.c} (100%)
>  rename tests/intel/{gem_tiling_max_stride.c => i915_gem_tiling_max_stride.c} (100%)
>  rename tests/intel/{gem_unfence_active_buffers.c => i915_gem_unfence_active_buffers.c} (100%)
>  rename tests/intel/{gem_unref_active_buffers.c => i915_gem_unref_active_buffers.c} (100%)
>  rename tests/intel/{gem_userptr_blits.c => i915_gem_userptr_blits.c} (100%)
>  rename tests/intel/{gem_vm_create.c => i915_gem_vm_create.c} (100%)
>  rename tests/intel/{gem_wait.c => i915_gem_wait.c} (100%)
>  rename tests/intel/{gem_watchdog.c => i915_gem_watchdog.c} (100%)
>  rename tests/intel/{gem_workarounds.c => i915_gem_workarounds.c} (100%)
>  rename tests/intel/{gen3_mixed_blits.c => i915_gen3_mixed_blits.c} (100%)
>  rename tests/intel/{gen3_render_linear_blits.c => i915_gen3_render_linear_blits.c} (100%)
>  rename tests/intel/{gen3_render_mixed_blits.c => i915_gen3_render_mixed_blits.c} (100%)
>  rename tests/intel/{gen3_render_tiledx_blits.c => i915_gen3_render_tiledx_blits.c} (100%)
>  rename tests/intel/{gen3_render_tiledy_blits.c => i915_gen3_render_tiledy_blits.c} (100%)
>  rename tests/intel/{gen7_exec_parse.c => i915_gen7_exec_parse.c} (100%)
>  rename tests/intel/{gen9_exec_parse.c => i915_gen9_exec_parse.c} (100%)
>  rename tests/intel/{perf.c => i915_perf.c} (100%)
>  rename tests/intel/{perf_pmu.c => i915_perf_pmu.c} (100%)
>  rename tests/intel/{sysfs_defaults.c => i915_sysfs_defaults.c} (100%)
>  rename tests/intel/{sysfs_heartbeat_interval.c => i915_sysfs_heartbeat_interval.c} (100%)
>  rename tests/intel/{sysfs_preempt_timeout.c => i915_sysfs_preempt_timeout.c} (100%)
>  rename tests/intel/{sysfs_timeslice_duration.c => i915_sysfs_timeslice_duration.c} (100%)
> 
> diff --git a/README.md b/README.md
> index 66f2bc0fa..9e2c8173b 100644
> --- a/README.md
> +++ b/README.md
> @@ -124,7 +124,7 @@ The benchmarks require KMS to be enabled.  When run with an X Server
>  running, they must be run as root to avoid the authentication
>  requirement.
>  
> -Note that a few other microbenchmarks are in tests (e.g. `gem_gtt_speed`).
> +Note that a few other microbenchmarks are in tests (e.g. `i915_gem_gtt_speed`).
>  
>  ### `tools/`
>  
> diff --git a/tests/intel-ci/blacklist-pre-merge.txt b/tests/intel-ci/blacklist-pre-merge.txt
> index d4e5ef66e..b747bdf42 100644
> --- a/tests/intel-ci/blacklist-pre-merge.txt
> +++ b/tests/intel-ci/blacklist-pre-merge.txt
> @@ -37,7 +37,7 @@ igt@i915_pm_rpm@universal-planes(-dpms)?
>  #
>  # Data acquired on 2020-02-19 by Martin Peres
>  ###############################################################################
> -igt@gem_pwrite@big-.*
> +igt@i915_gem_pwrite@big-.*
>  
>  
>  ###############################################################################
> @@ -46,7 +46,7 @@ igt@gem_pwrite@big-.*
>  # outside of drm_mm and i915_gem_execbuffer, for which the authors assure us
>  # that they are making deliberate and well tested changes.
>  ###############################################################################
> -igt@gem_exec_alignment@.*
> +igt@i915_gem_exec_alignment@.*
>  
>  
>  ###############################################################################
> @@ -85,11 +85,11 @@ igt@i915_pm_rpm@debugfs-read
>  #
>  # Data acquired on 2020-02-20 by Martin Peres
>  ###############################################################################
> -igt@gem_fence_thrash@bo-write-verify-threaded-[xy]
> -igt@gem_tiled_blits@interruptible
> -igt@gem_tiled_fence_blits@normal
> -igt@gem_tiled_blits@normal
> -igt@gem_tiled_wc
> +igt@i915_gem_fence_thrash@bo-write-verify-threaded-[xy]
> +igt@i915_gem_tiled_blits@interruptible
> +igt@i915_gem_tiled_fence_blits@normal
> +igt@i915_gem_tiled_blits@normal
> +igt@i915_gem_tiled_wc
>  
>  
>  ###############################################################################
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
> index e13759d3e..62996c2c7 100644
> --- a/tests/intel-ci/blacklist.txt
> +++ b/tests/intel-ci/blacklist.txt
> @@ -18,56 +18,56 @@ igt@i915_pm_rpm@gem-execbuf-stress-extra-wait
>  ###############################################
>  # GEM
>  ###############################################
> -igt@gem_busy@hang.*
> -igt@gem_close_race@(?!.*basic).*
> -igt@gem_concurrent_blit(@.*)?
> -igt@gem_ctx_create@(?!.*basic).*
> -igt@gem_ctx_exec@(?!.*basic).*

[...cut...]

Regards,
Kamil


