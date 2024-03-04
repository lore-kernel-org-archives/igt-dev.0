Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF53C48BF6
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 14:52:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3B6112231;
	Mon,  4 Mar 2024 14:52:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bk1HLNt7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E44211222F
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 14:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709563933; x=1741099933;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+VyycExVRm0Z8KSiL0xxIKKGf586E8FWHVDDPy7qiHA=;
 b=Bk1HLNt78u4m/KAeWXpM69LLzD0tK8xAW3mIvKh8cGlNX+pZzskPkIZb
 uPXJekIE+OTpl21nWF3PkFEOuR0sn4yG+4if8IDAKoaKfvO9X6GkbSEzR
 9Y2IvPqn2sGv8vvxqxQp9Z0eIBbd++46m98X0ICWKm5AwXz4bLCJH24WQ
 36fDZ8gsG3ckfcA6oLkQzPsE1GEa60CKPLjRMlD47gdwhePfy1QcyzQIc
 +IS9S+gZTGcf6aX7whq3Xon29kLZIxOr9eIkCgCLDVesufUOd0mKkEF1c
 UmvogeWr46fY0TiIeRR/Pb5aJN6J/EeRpE6OyG+4sUua8l5obIvjfrJWl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="21518679"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="21518679"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 06:52:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="13604784"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 06:52:12 -0800
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 10F4B5807E7;
 Mon,  4 Mar 2024 06:52:09 -0800 (PST)
Date: Mon, 4 Mar 2024 15:52:06 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t 24/24] tests: Remove 'Run type' documentation field
Message-ID: <20240304155206.2da988c3@maurocar-mobl2>
In-Reply-To: <20240304111617.849785-25-katarzyna.piecielska@intel.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
 <20240304111617.849785-25-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

Just a nitpick:

On Mon,  4 Mar 2024 11:16:17 +0000
Katarzyna Piecielska <katarzyna.piecielska@intel.com> wrote:

> We are no longer relying on 'Run type' field to determine what is being
> run as basic acceptance tests (BATs), so let's remove this field from
> test documentation.

Not exactly true, as Run type is still read from testlists. Better
to describe the patch with something like:

	It has been easier to maintain the Run type field by reading
	it from testlists instead of from C file, as this changes
	dynamically, and different devices may have either have it
	inside, for instance, BAT test list or not.

	So, drop the field from the C file.

With that, feel free to add:

	Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Regards,
Mauro


> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/core_auth.c                            |  8 +++----
>  tests/core_getclient.c                       |  2 +-
>  tests/core_getstats.c                        |  2 +-
>  tests/core_getversion.c                      |  2 +-
>  tests/core_hotunplug.c                       |  4 ++--
>  tests/core_setmaster.c                       |  2 +-
>  tests/core_setmaster_vs_auth.c               |  2 +-
>  tests/device_reset.c                         |  2 +-
>  tests/dmabuf.c                               |  2 +-
>  tests/dmabuf_sync_file.c                     |  2 +-
>  tests/drm_mm.c                               |  2 +-
>  tests/drm_read.c                             |  2 +-
>  tests/dumb_buffer.c                          |  2 +-
>  tests/intel/api_intel_allocator.c            |  2 +-
>  tests/intel/api_intel_bb.c                   |  2 +-
>  tests/intel/debugfs_test.c                   |  6 ++---
>  tests/intel/drm_fdinfo.c                     |  2 +-
>  tests/intel/gem_bad_reloc.c                  |  2 +-
>  tests/intel/gem_barrier_race.c               |  2 +-
>  tests/intel/gem_basic.c                      |  4 ++--
>  tests/intel/gem_blits.c                      |  2 +-
>  tests/intel/gem_busy.c                       |  4 ++--
>  tests/intel/gem_caching.c                    |  2 +-
>  tests/intel/gem_ccs.c                        |  2 +-
>  tests/intel/gem_close.c                      |  2 +-
>  tests/intel/gem_close_race.c                 |  6 ++---
>  tests/intel/gem_compute.c                    |  2 +-
>  tests/intel/gem_create.c                     |  2 +-
>  tests/intel/gem_cs_tlb.c                     |  2 +-
>  tests/intel/gem_ctx_bad_destroy.c            |  2 +-
>  tests/intel/gem_ctx_create.c                 |  6 ++---
>  tests/intel/gem_ctx_engines.c                |  2 +-
>  tests/intel/gem_ctx_exec.c                   |  4 ++--
>  tests/intel/gem_ctx_freq.c                   |  2 +-
>  tests/intel/gem_ctx_isolation.c              |  2 +-
>  tests/intel/gem_ctx_param.c                  |  2 +-
>  tests/intel/gem_ctx_persistence.c            |  2 +-
>  tests/intel/gem_ctx_shared.c                 |  2 +-
>  tests/intel/gem_ctx_sseu.c                   |  2 +-
>  tests/intel/gem_ctx_switch.c                 |  2 +-
>  tests/intel/gem_eio.c                        |  2 +-
>  tests/intel/gem_evict_alignment.c            |  2 +-
>  tests/intel/gem_evict_everything.c           |  2 +-
>  tests/intel/gem_exec_alignment.c             |  2 +-
>  tests/intel/gem_exec_async.c                 |  2 +-
>  tests/intel/gem_exec_await.c                 |  2 +-
>  tests/intel/gem_exec_balancer.c              |  2 +-
>  tests/intel/gem_exec_basic.c                 |  2 +-
>  tests/intel/gem_exec_big.c                   |  2 +-
>  tests/intel/gem_exec_capture.c               |  2 +-
>  tests/intel/gem_exec_create.c                |  4 ++--
>  tests/intel/gem_exec_endless.c               |  2 +-
>  tests/intel/gem_exec_fair.c                  |  2 +-
>  tests/intel/gem_exec_fence.c                 | 10 ++++----
>  tests/intel/gem_exec_flush.c                 |  2 +-
>  tests/intel/gem_exec_gttfill.c               |  4 ++--
>  tests/intel/gem_exec_latency.c               |  2 +-
>  tests/intel/gem_exec_lut_handle.c            |  2 +-
>  tests/intel/gem_exec_nop.c                   |  2 +-
>  tests/intel/gem_exec_parallel.c              |  4 ++--
>  tests/intel/gem_exec_params.c                |  2 +-
>  tests/intel/gem_exec_reloc.c                 |  2 +-
>  tests/intel/gem_exec_schedule.c              |  2 +-
>  tests/intel/gem_exec_store.c                 |  4 ++--
>  tests/intel/gem_exec_suspend.c               |  2 +-
>  tests/intel/gem_exec_whisper.c               |  2 +-
>  tests/intel/gem_exercise_blt.c               |  2 +-
>  tests/intel/gem_fd_exhaustion.c              |  2 +-
>  tests/intel/gem_fence_thrash.c               |  2 +-
>  tests/intel/gem_fence_upload.c               |  2 +-
>  tests/intel/gem_fenced_exec_thrash.c         |  2 +-
>  tests/intel/gem_flink_basic.c                |  2 +-
>  tests/intel/gem_flink_race.c                 |  2 +-
>  tests/intel/gem_gpgpu_fill.c                 |  2 +-
>  tests/intel/gem_gtt_cpu_tlb.c                |  2 +-
>  tests/intel/gem_gtt_hog.c                    |  2 +-
>  tests/intel/gem_gtt_speed.c                  |  2 +-
>  tests/intel/gem_huc_copy.c                   |  2 +-
>  tests/intel/gem_linear_blits.c               |  4 ++--
>  tests/intel/gem_lmem_evict.c                 |  2 +-
>  tests/intel/gem_lmem_swapping.c              |  8 +++----
>  tests/intel/gem_lut_handle.c                 |  2 +-
>  tests/intel/gem_madvise.c                    |  2 +-
>  tests/intel/gem_media_fill.c                 |  2 +-
>  tests/intel/gem_media_vme.c                  |  2 +-
>  tests/intel/gem_mmap.c                       |  4 ++--
>  tests/intel/gem_mmap_gtt.c                   |  2 +-
>  tests/intel/gem_mmap_offset.c                |  2 +-
>  tests/intel/gem_mmap_wc.c                    |  2 +-
>  tests/intel/gem_partial_pwrite_pread.c       |  2 +-
>  tests/intel/gem_pipe_control_store_loop.c    |  2 +-
>  tests/intel/gem_ppgtt.c                      |  2 +-
>  tests/intel/gem_pread.c                      |  2 +-
>  tests/intel/gem_pread_after_blit.c           |  2 +-
>  tests/intel/gem_pwrite.c                     |  2 +-
>  tests/intel/gem_pwrite_snooped.c             |  2 +-
>  tests/intel/gem_pxp.c                        |  2 +-
>  tests/intel/gem_read_read_speed.c            |  2 +-
>  tests/intel/gem_readwrite.c                  |  2 +-
>  tests/intel/gem_reg_read.c                   |  2 +-
>  tests/intel/gem_render_copy.c                |  2 +-
>  tests/intel/gem_render_copy_redux.c          |  2 +-
>  tests/intel/gem_render_linear_blits.c        |  4 ++--
>  tests/intel/gem_render_tiled_blits.c         |  4 ++--
>  tests/intel/gem_request_retire.c             |  2 +-
>  tests/intel/gem_reset_stats.c                |  2 +-
>  tests/intel/gem_ringfill.c                   |  4 ++--
>  tests/intel/gem_set_tiling_vs_blt.c          |  2 +-
>  tests/intel/gem_set_tiling_vs_gtt.c          |  2 +-
>  tests/intel/gem_set_tiling_vs_pwrite.c       |  2 +-
>  tests/intel/gem_shrink.c                     |  2 +-
>  tests/intel/gem_softpin.c                    |  6 ++---
>  tests/intel/gem_spin_batch.c                 |  2 +-
>  tests/intel/gem_streaming_writes.c           |  2 +-
>  tests/intel/gem_stress.c                     |  2 +-
>  tests/intel/gem_sync.c                       |  8 +++----
>  tests/intel/gem_tiled_blits.c                |  4 ++--
>  tests/intel/gem_tiled_fence_blits.c          |  4 ++--
>  tests/intel/gem_tiled_partial_pwrite_pread.c |  2 +-
>  tests/intel/gem_tiled_pread_basic.c          |  2 +-
>  tests/intel/gem_tiled_pread_pwrite.c         |  2 +-
>  tests/intel/gem_tiled_swapping.c             |  2 +-
>  tests/intel/gem_tiled_wb.c                   |  2 +-
>  tests/intel/gem_tiled_wc.c                   |  2 +-
>  tests/intel/gem_tiling_max_stride.c          |  2 +-
>  tests/intel/gem_unfence_active_buffers.c     |  2 +-
>  tests/intel/gem_unref_active_buffers.c       |  2 +-
>  tests/intel/gem_userptr_blits.c              |  2 +-
>  tests/intel/gem_vm_create.c                  |  2 +-
>  tests/intel/gem_wait.c                       |  6 ++---
>  tests/intel/gem_watchdog.c                   |  2 +-
>  tests/intel/gem_workarounds.c                |  2 +-
>  tests/intel/gen3_mixed_blits.c               |  2 +-
>  tests/intel/gen3_render_linear_blits.c       |  2 +-
>  tests/intel/gen3_render_mixed_blits.c        |  2 +-
>  tests/intel/gen3_render_tiledx_blits.c       |  2 +-
>  tests/intel/gen3_render_tiledy_blits.c       |  2 +-
>  tests/intel/gen7_exec_parse.c                |  2 +-
>  tests/intel/gen9_exec_parse.c                |  2 +-
>  tests/intel/i915_fb_tiling.c                 |  2 +-
>  tests/intel/i915_getparams_basic.c           |  2 +-
>  tests/intel/i915_hangman.c                   | 18 +++++++--------
>  tests/intel/i915_module_load.c               |  6 ++---
>  tests/intel/i915_pciid.c                     |  2 +-
>  tests/intel/i915_pipe_stress.c               |  2 +-
>  tests/intel/i915_pm_freq_api.c               |  2 +-
>  tests/intel/i915_pm_freq_mult.c              |  2 +-
>  tests/intel/i915_pm_rc6_residency.c          |  2 +-
>  tests/intel/i915_pm_rpm.c                    |  2 +-
>  tests/intel/i915_pm_rps.c                    |  4 ++--
>  tests/intel/i915_pm_sseu.c                   |  2 +-
>  tests/intel/i915_power.c                     |  2 +-
>  tests/intel/i915_query.c                     |  2 +-
>  tests/intel/i915_selftest.c                  |  6 ++---
>  tests/intel/i915_suspend.c                   |  4 ++--
>  tests/intel/intel_hwmon.c                    |  2 +-
>  tests/intel/perf.c                           |  2 +-
>  tests/intel/perf_pmu.c                       |  2 +-
>  tests/intel/prime_busy.c                     |  2 +-
>  tests/intel/prime_mmap.c                     |  2 +-
>  tests/intel/prime_mmap_coherency.c           |  2 +-
>  tests/intel/prime_mmap_kms.c                 |  2 +-
>  tests/intel/prime_self_import.c              |  6 ++---
>  tests/intel/sysfs_defaults.c                 |  2 +-
>  tests/intel/sysfs_heartbeat_interval.c       |  2 +-
>  tests/intel/sysfs_preempt_timeout.c          |  2 +-
>  tests/intel/sysfs_timeslice_duration.c       |  2 +-
>  tests/intel/xe_drm_fdinfo.c                  |  2 +-
>  tests/intel/xe_pm.c                          |  2 +-
>  tests/intel/xe_pm_residency.c                |  2 +-
>  tests/intel/xe_spin_batch.c                  |  4 ++--
>  tests/intel/xe_waitfence.c                   |  2 +-
>  tests/prime_nv_api.c                         |  2 +-
>  tests/prime_nv_pcopy.c                       |  2 +-
>  tests/prime_nv_test.c                        |  2 +-
>  tests/prime_vgem.c                           | 14 ++++++------
>  tests/sriov_basic.c                          |  8 +++----
>  tests/sw_sync.c                              |  2 +-
>  tests/syncobj_basic.c                        |  2 +-
>  tests/syncobj_eventfd.c                      |  2 +-
>  tests/syncobj_timeline.c                     |  2 +-
>  tests/syncobj_wait.c                         |  2 +-
>  tests/vgem_basic.c                           | 24 ++++++++++----------
>  tests/vgem_slow.c                            |  2 +-
>  184 files changed, 259 insertions(+), 259 deletions(-)
> 
> diff --git a/tests/core_auth.c b/tests/core_auth.c
> index 6103d0ffc..469b1194c 100644
> --- a/tests/core_auth.c
> +++ b/tests/core_auth.c
> @@ -53,19 +53,19 @@
>   *
>   * SUBTEST: basic-auth
>   * Description: Test magic numbers for master and slave.
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: getclient-master-drop
>   * Description: Use 2 clients, check second is authenticated even when first dropped.
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: getclient-simple
>   * Description: Check drm client is always authenticated.
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: many-magics
>   * Description: Test authentication and magic numbers uniqness for rlimit slaves.
> - * Run type: FULL
> + *
>   */
>  
>  #ifndef __linux__
> diff --git a/tests/core_getclient.c b/tests/core_getclient.c
> index 839fae36a..54e283b15 100644
> --- a/tests/core_getclient.c
> +++ b/tests/core_getclient.c
> @@ -37,7 +37,7 @@
>   * Description: Tests the DRM_IOCTL_GET_CLIENT ioctl.
>   * Feature: core
>   * Functionality: permission management for clients
> - * Run type: FULL
> + *
>   * Sub-category: DRM
>   * Test category: GEM_Legacy
>   *
> diff --git a/tests/core_getstats.c b/tests/core_getstats.c
> index 1a8ad22c7..d39f93130 100644
> --- a/tests/core_getstats.c
> +++ b/tests/core_getstats.c
> @@ -38,7 +38,7 @@
>   * Description: Tests the DRM_IOCTL_GET_STATS ioctl.
>   * Feature: core
>   * Functionality: DRM memory management
> - * Run type: FULL
> + *
>   * Sub-category: uapi
>   * Test category: GEM_Legacy
>   *
> diff --git a/tests/core_getversion.c b/tests/core_getversion.c
> index 9945c3855..6cdff53f5 100644
> --- a/tests/core_getversion.c
> +++ b/tests/core_getversion.c
> @@ -34,7 +34,7 @@
>   * Description: Tests the DRM_IOCTL_GET_VERSION ioctl and libdrm's drmGetVersion() interface to it.
>   * Feature: core
>   * Functionality: permission management for clients
> - * Run type: FULL
> + *
>   * Sub-category: DRM
>   * Test category: GEM_Legacy
>   *
> diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
> index f578afa4a..eba21ea9d 100644
> --- a/tests/core_hotunplug.c
> +++ b/tests/core_hotunplug.c
> @@ -47,7 +47,7 @@
>   * Category: Software building block
>   * Sub-category: driver
>   * Functionality: device hotplug
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: hotrebind
>   * Description: Check if the driver can be cleanly rebound to a device with a
> @@ -76,7 +76,7 @@
>   * SUBTEST: unbind-rebind
>   * Description: Check if the driver can be cleanly unbound from a device
>   *		believed to be closed, then rebound
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: unplug-rescan
>   * Description: Check if a device believed to be closed can be cleanly
> diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
> index 04ee6b8b5..ba85471b5 100644
> --- a/tests/core_setmaster.c
> +++ b/tests/core_setmaster.c
> @@ -44,7 +44,7 @@
>   * Description: Check that Drop/SetMaster behaves correctly wrt root/user access
>   * Feature: core
>   * Functionality: permission management for clients
> - * Run type: FULL
> + *
>   * Sub-category: DRM
>   * Test category: GEM_Legacy
>   *
> diff --git a/tests/core_setmaster_vs_auth.c b/tests/core_setmaster_vs_auth.c
> index b80ed3879..9d6e509f6 100644
> --- a/tests/core_setmaster_vs_auth.c
> +++ b/tests/core_setmaster_vs_auth.c
> @@ -46,7 +46,7 @@
>   * Description: Check that drop/setMaster correctly transfer master state
>   * Feature: core
>   * Functionality: permission management for clients
> - * Run type: FULL
> + *
>   * Sub-category: DRM
>   * Test category: GEM_Legacy
>   *
> diff --git a/tests/device_reset.c b/tests/device_reset.c
> index 817cbc285..018c8a9ac 100644
> --- a/tests/device_reset.c
> +++ b/tests/device_reset.c
> @@ -23,7 +23,7 @@
>   * Functionality: reset
>   * Sub-category: Reset
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: cold-reset-bound
>   * Description: Cold Resets device with bound driver
> diff --git a/tests/dmabuf.c b/tests/dmabuf.c
> index 977b04043..2c242840d 100644
> --- a/tests/dmabuf.c
> +++ b/tests/dmabuf.c
> @@ -32,7 +32,7 @@
>   * Functionality: DRM
>   * Sub-category: Memory management
>   * Test category: GEM_Legacy
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: all-tests
>   *
> diff --git a/tests/dmabuf_sync_file.c b/tests/dmabuf_sync_file.c
> index 57f1ce2bc..01021236a 100644
> --- a/tests/dmabuf_sync_file.c
> +++ b/tests/dmabuf_sync_file.c
> @@ -16,7 +16,7 @@ IGT_TEST_DESCRIPTION("Tests for sync_file support in dma-buf");
>   * Description: Tests for sync_file support in dma-buf
>   * Functionality: dmabuf
>   * Sub-category: Core
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: export-basic
>   * SUBTEST: export-before-signal
> diff --git a/tests/drm_mm.c b/tests/drm_mm.c
> index 9793bfd6c..d464276df 100644
> --- a/tests/drm_mm.c
> +++ b/tests/drm_mm.c
> @@ -31,7 +31,7 @@
>   * Functionality: DRM memory management
>   * Sub-category: Memory management
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: drm_mm
>   *
> diff --git a/tests/drm_read.c b/tests/drm_read.c
> index f8ef324fa..dc0e106d5 100644
> --- a/tests/drm_read.c
> +++ b/tests/drm_read.c
> @@ -56,7 +56,7 @@ IGT_TEST_DESCRIPTION("Call read(drm) and see if it behaves.");
>   * Category: Infrastructure
>   * Functionality: DRM memory managemnt
>   * Sub-category: uapi
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: invalid-buffer
>   * SUBTEST: fault-buffer
> diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
> index d76f0c70f..99ad9f96d 100644
> --- a/tests/dumb_buffer.c
> +++ b/tests/dumb_buffer.c
> @@ -55,7 +55,7 @@
>   * Description: This is a test for the generic dumb buffer interface.
>   * Feature: prime
>   * Functionality: ioctl
> - * Run type: FULL
> + *
>   * Sub-category: uapi
>   * Test category: Compositor
>   *
> diff --git a/tests/intel/api_intel_allocator.c b/tests/intel/api_intel_allocator.c
> index f260250d4..31212f564 100644
> --- a/tests/intel/api_intel_allocator.c
> +++ b/tests/intel/api_intel_allocator.c
> @@ -18,7 +18,7 @@
>   * Category: Infrastructure
>   * Functionality: virtual address
>   * Description: checking the virtual address ranges
> - * Run type: FULL
> + *
>   * Sub-category: IGT Lib
>   * Test category: GEM_Legacy
>   * Feature: igt_core
> diff --git a/tests/intel/api_intel_bb.c b/tests/intel/api_intel_bb.c
> index 74e334581..927412295 100644
> --- a/tests/intel/api_intel_bb.c
> +++ b/tests/intel/api_intel_bb.c
> @@ -49,7 +49,7 @@
>   * Functionality: dummy buffer creation & submission
>   * Sub-category: IGT Lib
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: add-remove-objects
>   *
> diff --git a/tests/intel/debugfs_test.c b/tests/intel/debugfs_test.c
> index 9706b81e1..1705baa1b 100644
> --- a/tests/intel/debugfs_test.c
> +++ b/tests/intel/debugfs_test.c
> @@ -37,15 +37,15 @@
>   * Functionality: debugfs
>   * Sub-category: uapi
>   * Test category: uapi
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: basic-hwmon
>   * Description: Read all entries from hwmon path validating debugfs entries
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: read_all_entries
>   * Description: Read all entries from debugfs path validating debugfs entries
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: read_all_entries_display_off
>   * Description: Read all debugfs entries with display on/off.
> diff --git a/tests/intel/drm_fdinfo.c b/tests/intel/drm_fdinfo.c
> index 65d942330..3ed53d576 100644
> --- a/tests/intel/drm_fdinfo.c
> +++ b/tests/intel/drm_fdinfo.c
> @@ -40,7 +40,7 @@
>   * Functionality: client_busyness
>   * Sub-category: FDinfo
>   * Category: Desktop client
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: all-busy-check-all
>   *
> diff --git a/tests/intel/gem_bad_reloc.c b/tests/intel/gem_bad_reloc.c
> index 8e17d6630..a7de463c2 100644
> --- a/tests/intel/gem_bad_reloc.c
> +++ b/tests/intel/gem_bad_reloc.c
> @@ -49,7 +49,7 @@
>   * Sub-category: CMD submission
>   * Category: Desktop client
>   * Functionality: relocations
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: negative-reloc
>   * Description: SNA behaviour is compressing batch buffer which leads to
> diff --git a/tests/intel/gem_barrier_race.c b/tests/intel/gem_barrier_race.c
> index 7f434a68c..ceb8c2a33 100644
> --- a/tests/intel/gem_barrier_race.c
> +++ b/tests/intel/gem_barrier_race.c
> @@ -24,7 +24,7 @@
>   * Category: Desktop client
>   * Sub-category: CMD submission
>   * Functionality: barrier
> - * Run type: FULL
> + *
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: remote-request
> diff --git a/tests/intel/gem_basic.c b/tests/intel/gem_basic.c
> index 513113cd1..6b046e36b 100644
> --- a/tests/intel/gem_basic.c
> +++ b/tests/intel/gem_basic.c
> @@ -49,7 +49,7 @@
>   * Functionality: driver handler
>   * Sub-category: uapi
>   * Test category: GEM_Legacy
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: bad-close
>   * Description: Verify that gem_close fails with bad params.
> @@ -63,7 +63,7 @@
>   * SUBTEST: multigpu-create-close
>   * Description: Verify basic functionality of gem_create and gem_close on multi-GPU.
>   * Feature: gem_core, multigpu
> - * Run type: FULL
> + *
>   * Test category: MultiGPU
>   */
>  
> diff --git a/tests/intel/gem_blits.c b/tests/intel/gem_blits.c
> index b9d0b5f87..1f3edeeee 100644
> --- a/tests/intel/gem_blits.c
> +++ b/tests/intel/gem_blits.c
> @@ -33,7 +33,7 @@
>   * Category: Infrastructure
>   * Feature: blitter
>   * Functionality: command streamer
> - * Run type: FULL
> + *
>   * Sub-category: CMD submission
>   * Test category: GEM_Legacy
>   *
> diff --git a/tests/intel/gem_busy.c b/tests/intel/gem_busy.c
> index 7baaac41f..921e4865d 100644
> --- a/tests/intel/gem_busy.c
> +++ b/tests/intel/gem_busy.c
> @@ -38,7 +38,7 @@
>   * Sub-category: uapi
>   * Test category: GEM_Legacy
>   * Feature: cmd_submission
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: busy
>   * Description: Basic test to check busyness of each engine.
> @@ -46,7 +46,7 @@
>   * SUBTEST: busy@all
>   *
>   * SUBTEST: busy@all-engines
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: close-race
>   * Description: Test to check race condition by randomly closing the handle
> diff --git a/tests/intel/gem_caching.c b/tests/intel/gem_caching.c
> index 4a95cf528..9a1b29d48 100644
> --- a/tests/intel/gem_caching.c
> +++ b/tests/intel/gem_caching.c
> @@ -46,7 +46,7 @@
>   * Description: Test snoop consistency when touching partial cachelines.
>   * Feature: caching
>   * Functionality: coherency
> - * Run type: FULL
> + *
>   * Sub-category: Caching
>   * Test category: GEM_Legacy
>   *
> diff --git a/tests/intel/gem_ccs.c b/tests/intel/gem_ccs.c
> index e6257aeac..a550e05ec 100644
> --- a/tests/intel/gem_ccs.c
> +++ b/tests/intel/gem_ccs.c
> @@ -23,7 +23,7 @@
>   * Sub-category: Flat-ccs
>   * Category: Desktop \ Server
>   * Functionality: block-copy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: block-copy-compressed
>   * Description: Check block-copy flatccs compressed blit
> diff --git a/tests/intel/gem_close.c b/tests/intel/gem_close.c
> index 91cda5bdc..c84b5635e 100644
> --- a/tests/intel/gem_close.c
> +++ b/tests/intel/gem_close.c
> @@ -30,7 +30,7 @@
>   * Category: Infrastructure
>   * Feature: mapping
>   * Functionality: driver handler
> - * Run type: FULL
> + *
>   * Sub-category: Memory management
>   * Test category: GEM_Legacy
>   *
> diff --git a/tests/intel/gem_close_race.c b/tests/intel/gem_close_race.c
> index 9c2034ad3..d8f6ef6f9 100644
> --- a/tests/intel/gem_close_race.c
> +++ b/tests/intel/gem_close_race.c
> @@ -56,16 +56,16 @@
>   * Functionality: driver handler
>   * Sub-category: CMD submission
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: basic-process
>   * Description: Basic workload submission.
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: basic-threads
>   * Description: Share buffer handle across different drm fd's and trying to
>   *		race gem_close against continuous workload with minimum timeout.
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: contexts
>   * Description: Share buffer handle across different drm fd's and trying to
> diff --git a/tests/intel/gem_compute.c b/tests/intel/gem_compute.c
> index 8d0214c4d..a42e9875d 100644
> --- a/tests/intel/gem_compute.c
> +++ b/tests/intel/gem_compute.c
> @@ -8,7 +8,7 @@
>   * Category: Hardware building block
>   * Sub-category: compute
>   * Test category: functionality test
> - * Run type: BAT
> + *
>   */
>  
>  #include <string.h>
> diff --git a/tests/intel/gem_create.c b/tests/intel/gem_create.c
> index ae9575089..c799a4991 100644
> --- a/tests/intel/gem_create.c
> +++ b/tests/intel/gem_create.c
> @@ -71,7 +71,7 @@
>   * Functionality: buffer management
>   * Sub-category: uapi
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: busy-create
>   * Description: Create buffer objects while GPU is busy.
> diff --git a/tests/intel/gem_cs_tlb.c b/tests/intel/gem_cs_tlb.c
> index 2379eef0e..0eec7e36c 100644
> --- a/tests/intel/gem_cs_tlb.c
> +++ b/tests/intel/gem_cs_tlb.c
> @@ -58,7 +58,7 @@
>   * Description: Check whether we correctly invalidate the cs tlb.
>   * Feature: mapping
>   * Functionality: TLB invalidate
> - * Run type: FULL
> + *
>   * Sub-category: CMD submission
>   * Test category: GEM_Legacy
>   *
> diff --git a/tests/intel/gem_ctx_bad_destroy.c b/tests/intel/gem_ctx_bad_destroy.c
> index b6575e2d8..b5c3cfb75 100644
> --- a/tests/intel/gem_ctx_bad_destroy.c
> +++ b/tests/intel/gem_ctx_bad_destroy.c
> @@ -40,7 +40,7 @@
>   * Description: Negative test cases for destroy contexts.
>   * Feature: context
>   * Functionality: context
> - * Run type: FULL
> + *
>   * Sub-category: Context
>   * Test category: GEM_Legacy
>   *
> diff --git a/tests/intel/gem_ctx_create.c b/tests/intel/gem_ctx_create.c
> index 5fb0f9a1f..33e48f86f 100644
> --- a/tests/intel/gem_ctx_create.c
> +++ b/tests/intel/gem_ctx_create.c
> @@ -43,7 +43,7 @@
>   * Functionality: context
>   * Sub-category: Context
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: active
>   * Description: For each engine calculate the average performance of context
> @@ -55,11 +55,11 @@
>   *
>   * SUBTEST: basic
>   * Description: Test random context creation
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: basic-files
>   * Description: Exercise implicit per-fd context creation
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: ext-param
>   * Description: Verify valid and invalid context extensions
> diff --git a/tests/intel/gem_ctx_engines.c b/tests/intel/gem_ctx_engines.c
> index 75770e1f1..623a050f1 100644
> --- a/tests/intel/gem_ctx_engines.c
> +++ b/tests/intel/gem_ctx_engines.c
> @@ -48,7 +48,7 @@
>   * Category: Infrastructure
>   * Feature: context
>   * Functionality: context
> - * Run type: FULL
> + *
>   * Sub-category: Context
>   * Test category: GEM_Legacy
>   *
> diff --git a/tests/intel/gem_ctx_exec.c b/tests/intel/gem_ctx_exec.c
> index 20d42d5b0..ada868c95 100644
> --- a/tests/intel/gem_ctx_exec.c
> +++ b/tests/intel/gem_ctx_exec.c
> @@ -55,11 +55,11 @@
>   * Functionality: execbuf
>   * Sub-category: Context
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: basic
>   * Description: Check the basic context batch buffer execution.
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: basic-close-race
>   * Description: Race the execution and interrupt handlers along a context,
> diff --git a/tests/intel/gem_ctx_freq.c b/tests/intel/gem_ctx_freq.c
> index 8c0d7db3c..4575bc5ff 100644
> --- a/tests/intel/gem_ctx_freq.c
> +++ b/tests/intel/gem_ctx_freq.c
> @@ -42,7 +42,7 @@
>   * Category: Server
>   * Feature: context
>   * Functionality: frequency management
> - * Run type: FULL
> + *
>   * Sub-category: Performance
>   * Test category: GEM_Legacy
>   *
> diff --git a/tests/intel/gem_ctx_isolation.c b/tests/intel/gem_ctx_isolation.c
> index 89c023e09..3265c1101 100644
> --- a/tests/intel/gem_ctx_isolation.c
> +++ b/tests/intel/gem_ctx_isolation.c
> @@ -33,7 +33,7 @@
>   * Functionality: priv/non-priv registers
>   * Sub-category: Security
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: clean
>   *
> diff --git a/tests/intel/gem_ctx_param.c b/tests/intel/gem_ctx_param.c
> index c6fa31875..6da0276e1 100644
> --- a/tests/intel/gem_ctx_param.c
> +++ b/tests/intel/gem_ctx_param.c
> @@ -38,7 +38,7 @@
>   * Functionality: context
>   * Sub-category: uapi
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: basic
>   * Description: Basic test for context get/set param ioctls using valid context
> diff --git a/tests/intel/gem_ctx_persistence.c b/tests/intel/gem_ctx_persistence.c
> index 3f10c0fa3..fabe47e27 100644
> --- a/tests/intel/gem_ctx_persistence.c
> +++ b/tests/intel/gem_ctx_persistence.c
> @@ -52,7 +52,7 @@
>   * Functionality: context
>   * Sub-category: Compute
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: engines-cleanup
>   *
> diff --git a/tests/intel/gem_ctx_shared.c b/tests/intel/gem_ctx_shared.c
> index 8b045e20a..ffb2a8ba4 100644
> --- a/tests/intel/gem_ctx_shared.c
> +++ b/tests/intel/gem_ctx_shared.c
> @@ -55,7 +55,7 @@
>   * Functionality: shared contex
>   * Sub-category: Context
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: Q-in-order
>   *
> diff --git a/tests/intel/gem_ctx_sseu.c b/tests/intel/gem_ctx_sseu.c
> index a9d400c2d..8a55146f9 100644
> --- a/tests/intel/gem_ctx_sseu.c
> +++ b/tests/intel/gem_ctx_sseu.c
> @@ -51,7 +51,7 @@
>   * Sub-category: uapi
>   * Category: Desktop client
>   * Functionality: sseu
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: engines
>   *
> diff --git a/tests/intel/gem_ctx_switch.c b/tests/intel/gem_ctx_switch.c
> index 483aede20..a90616d63 100644
> --- a/tests/intel/gem_ctx_switch.c
> +++ b/tests/intel/gem_ctx_switch.c
> @@ -51,7 +51,7 @@
>   * Category: Desktop client
>   * Sub-category: CMD Submission
>   * Functionality: context switching
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: all-heavy
>   *
> diff --git a/tests/intel/gem_eio.c b/tests/intel/gem_eio.c
> index d6d12bd08..25b523a3a 100644
> --- a/tests/intel/gem_eio.c
> +++ b/tests/intel/gem_eio.c
> @@ -61,7 +61,7 @@
>   * Functionality: reset
>   * Sub-category: uapi
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: banned
>   *
> diff --git a/tests/intel/gem_evict_alignment.c b/tests/intel/gem_evict_alignment.c
> index 7cd11d169..b0c2bde3e 100644
> --- a/tests/intel/gem_evict_alignment.c
> +++ b/tests/intel/gem_evict_alignment.c
> @@ -53,7 +53,7 @@
>   * Sub-category: CMD submission
>   * Category: Desktop client
>   * Functionality: misalignment
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: major-hang
>   *
> diff --git a/tests/intel/gem_evict_everything.c b/tests/intel/gem_evict_everything.c
> index 578018e4d..2bba225e9 100644
> --- a/tests/intel/gem_evict_everything.c
> +++ b/tests/intel/gem_evict_everything.c
> @@ -54,7 +54,7 @@
>   * Sub-category: CMD submission
>   * Category: Desktop client
>   * Functionality: eviction
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: forked-interruptible
>   *
> diff --git a/tests/intel/gem_exec_alignment.c b/tests/intel/gem_exec_alignment.c
> index 40ff15030..ada27e65e 100644
> --- a/tests/intel/gem_exec_alignment.c
> +++ b/tests/intel/gem_exec_alignment.c
> @@ -51,7 +51,7 @@
>   * Description: Exercises the basic execbuffer using object alignments
>   * Feature: cmd_submission
>   * Functionality: execbuf
> - * Run type: FULL
> + *
>   * Sub-category: CMD submission
>   * Test category: GEM_Legacy
>   *
> diff --git a/tests/intel/gem_exec_async.c b/tests/intel/gem_exec_async.c
> index 8db8fbf3c..3171d3534 100644
> --- a/tests/intel/gem_exec_async.c
> +++ b/tests/intel/gem_exec_async.c
> @@ -30,7 +30,7 @@
>   * Description: Check that we can issue concurrent writes across the engines.
>   * Feature: cmd_submission
>   * Functionality: concurent writes
> - * Run type: FULL
> + *
>   * Sub-category: CMD submission
>   * Test category: GEM_Legacy
>   *
> diff --git a/tests/intel/gem_exec_await.c b/tests/intel/gem_exec_await.c
> index b2b8218bf..19367facd 100644
> --- a/tests/intel/gem_exec_await.c
> +++ b/tests/intel/gem_exec_await.c
> @@ -48,7 +48,7 @@
>   * Category: Infrastructure
>   * Feature: cmd_submission
>   * Functionality: requests
> - * Run type: FULL
> + *
>   * Sub-category: CMD submission
>   * Test category: GEM_Legacy
>   *
> diff --git a/tests/intel/gem_exec_balancer.c b/tests/intel/gem_exec_balancer.c
> index efa875889..36f610354 100644
> --- a/tests/intel/gem_exec_balancer.c
> +++ b/tests/intel/gem_exec_balancer.c
> @@ -46,7 +46,7 @@
>   * Functionality: load balancing
>   * Sub-category: CMD submission
>   * Test category: Media & Compute
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: bonded-chain
>   *
> diff --git a/tests/intel/gem_exec_basic.c b/tests/intel/gem_exec_basic.c
> index aae773987..7dc2cf262 100644
> --- a/tests/intel/gem_exec_basic.c
> +++ b/tests/intel/gem_exec_basic.c
> @@ -31,7 +31,7 @@
>   * Category: Infrastructure
>   * Feature: cmd_submission
>   * Functionality: execbuf
> - * Run type: BAT
> + *
>   * Sub-category: CMD submission
>   * Test category: GEM_Legacy
>   *
> diff --git a/tests/intel/gem_exec_big.c b/tests/intel/gem_exec_big.c
> index f22be96db..373e845eb 100644
> --- a/tests/intel/gem_exec_big.c
> +++ b/tests/intel/gem_exec_big.c
> @@ -56,7 +56,7 @@
>   * Functionality: large nop batch
>   * Sub-category: CMD submission
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: exhaustive
>   *
> diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/gem_exec_capture.c
> index 3617dd994..d9d10c713 100644
> --- a/tests/intel/gem_exec_capture.c
> +++ b/tests/intel/gem_exec_capture.c
> @@ -39,7 +39,7 @@
>   * Functionality: offline debugging
>   * Sub-category: Debugger
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: capture
>   *
> diff --git a/tests/intel/gem_exec_create.c b/tests/intel/gem_exec_create.c
> index 1d5c2512f..29953ea4b 100644
> --- a/tests/intel/gem_exec_create.c
> +++ b/tests/intel/gem_exec_create.c
> @@ -54,12 +54,12 @@
>   *		some of the symptoms this test look for include mysterious hangs.
>   * Feature: cmd_submission
>   * Functionality: buffer management
> - * Run type: FULL
> + *
>   * Sub-category: CMD submission
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic
> - * Run type: BAT
> + *
>   * Description: Check if we kill system by overloading it with active objects
>   *		iterating over all engines.
>   *
> diff --git a/tests/intel/gem_exec_endless.c b/tests/intel/gem_exec_endless.c
> index b7e2bb429..cf5012e1c 100644
> --- a/tests/intel/gem_exec_endless.c
> +++ b/tests/intel/gem_exec_endless.c
> @@ -35,7 +35,7 @@
>   * Category: Server
>   * Feature: cmd_submission
>   * Functionality: compute
> - * Run type: FULL
> + *
>   * Sub-category: CMD submission
>   * Test category: Compute
>   *
> diff --git a/tests/intel/gem_exec_fair.c b/tests/intel/gem_exec_fair.c
> index 2c33c0187..71d5b3039 100644
> --- a/tests/intel/gem_exec_fair.c
> +++ b/tests/intel/gem_exec_fair.c
> @@ -33,7 +33,7 @@
>   * Sub-category: CMD submission
>   * Category: Desktop client
>   * Functionality: multi-client systems
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: basic-deadline
>   *
> diff --git a/tests/intel/gem_exec_fence.c b/tests/intel/gem_exec_fence.c
> index a0cfc1378..db6437c26 100644
> --- a/tests/intel/gem_exec_fence.c
> +++ b/tests/intel/gem_exec_fence.c
> @@ -43,7 +43,7 @@
>   * Functionality: semaphore
>   * Sub-category: CMD submission
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: await-hang
>   * Description: Check for explicit fence with async wait on each engine with a
> @@ -51,13 +51,13 @@
>   *
>   * SUBTEST: basic-await
>   * Description: Basic check for explicit fence with async wait on each engine.
> - * Run type: BAT
> + *
>   * Test category: MultiTile
>   *
>   * SUBTEST: basic-busy
>   * Description: Basic check for explicit fence on each busy engine.
>   * Feature: cmd_submission, multitile, synchronization
> - * Run type: BAT
> + *
>   * Test category: MultiTile
>   *
>   * SUBTEST: basic-busy-all
> @@ -69,7 +69,7 @@
>   * Description: Basic check for explicit fence with additional wait time on
>   *		each busy engine.
>   * Feature: cmd_submission, multitile, synchronization
> - * Run type: BAT
> + *
>   * Test category: MultiTile
>   *
>   * SUBTEST: basic-wait-all
> @@ -113,7 +113,7 @@
>   * SUBTEST: nb-await
>   * Description: Check for explicit fence with non-blocking wait on each engine.
>   * Feature: cmd_submission, multitile, synchronization
> - * Run type: BAT
> + *
>   * Test category: MultiTile
>   *
>   * SUBTEST: nb-await-hang
> diff --git a/tests/intel/gem_exec_flush.c b/tests/intel/gem_exec_flush.c
> index a540d1f30..2793e60d0 100644
> --- a/tests/intel/gem_exec_flush.c
> +++ b/tests/intel/gem_exec_flush.c
> @@ -34,7 +34,7 @@
>   * Sub-category: CMD submission
>   * Category: Desktop client
>   * Functionality: execbuf
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: basic-batch-kernel-default-cmd
>   * Feature: cmd_submission, command_parser
> diff --git a/tests/intel/gem_exec_gttfill.c b/tests/intel/gem_exec_gttfill.c
> index b1063437b..1c902ee92 100644
> --- a/tests/intel/gem_exec_gttfill.c
> +++ b/tests/intel/gem_exec_gttfill.c
> @@ -34,14 +34,14 @@
>   * Functionality: execbuf
>   * Sub-category: CMD submission
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: all-engines
>   * Description: Stress test check behaviour/correctness of handling batches to fill gtt
>   *
>   * SUBTEST: basic
>   * Description: Checks if it can handle enough batches to fill gtt
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: engines
>   * Description: Checks the correctness of handling enough batches to fill gtt for each engine
> diff --git a/tests/intel/gem_exec_latency.c b/tests/intel/gem_exec_latency.c
> index 42955e97a..196ae998a 100644
> --- a/tests/intel/gem_exec_latency.c
> +++ b/tests/intel/gem_exec_latency.c
> @@ -53,7 +53,7 @@
>   * Sub-category: CMD submission
>   * Functionality: execbuf
>   * Category: Desktop client
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: context-preempt
>   *
> diff --git a/tests/intel/gem_exec_lut_handle.c b/tests/intel/gem_exec_lut_handle.c
> index a03a716e5..dbdcf3788 100644
> --- a/tests/intel/gem_exec_lut_handle.c
> +++ b/tests/intel/gem_exec_lut_handle.c
> @@ -46,7 +46,7 @@
>   * Sub-category: CMD submission
>   * Category: Desktop client
>   * Functionality: execbuf
> - * Run type: FULL
> + *
>   *
>   * SUBTEST:
>   */
> diff --git a/tests/intel/gem_exec_nop.c b/tests/intel/gem_exec_nop.c
> index 48308312e..739e29a0b 100644
> --- a/tests/intel/gem_exec_nop.c
> +++ b/tests/intel/gem_exec_nop.c
> @@ -55,7 +55,7 @@
>   * Functionality: execbuf
>   * Sub-category: CMD submission
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: basic-parallel
>   *
> diff --git a/tests/intel/gem_exec_parallel.c b/tests/intel/gem_exec_parallel.c
> index fdf22cbea..074ac3c41 100644
> --- a/tests/intel/gem_exec_parallel.c
> +++ b/tests/intel/gem_exec_parallel.c
> @@ -42,14 +42,14 @@
>   * Functionality: parallel clients
>   * Sub-category: CMD submission
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: basic
>   *
>   * SUBTEST: contexts
>   *
>   * SUBTEST: engines
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: fds
>   *
> diff --git a/tests/intel/gem_exec_params.c b/tests/intel/gem_exec_params.c
> index 912c4f856..36cc4ca08 100644
> --- a/tests/intel/gem_exec_params.c
> +++ b/tests/intel/gem_exec_params.c
> @@ -51,7 +51,7 @@
>   * Functionality: execbuf
>   * Sub-category: CMD submission
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: DR1-dirt
>   *
> diff --git a/tests/intel/gem_exec_reloc.c b/tests/intel/gem_exec_reloc.c
> index f3a8a45c0..fe4f45495 100644
> --- a/tests/intel/gem_exec_reloc.c
> +++ b/tests/intel/gem_exec_reloc.c
> @@ -37,7 +37,7 @@
>   * Sub-category: CMD submission
>   * Category: Desktop client
>   * Functionality: relocations
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: basic-active
>   * Feature: cmd_submission
> diff --git a/tests/intel/gem_exec_schedule.c b/tests/intel/gem_exec_schedule.c
> index 41dfc394b..d8fb7941e 100644
> --- a/tests/intel/gem_exec_schedule.c
> +++ b/tests/intel/gem_exec_schedule.c
> @@ -52,7 +52,7 @@
>   * Functionality: execution order
>   * Sub-category: CMD submission
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: deep
>   * SUBTEST: fairslice
> diff --git a/tests/intel/gem_exec_store.c b/tests/intel/gem_exec_store.c
> index a5a6538cb..9c436b70b 100644
> --- a/tests/intel/gem_exec_store.c
> +++ b/tests/intel/gem_exec_store.c
> @@ -42,12 +42,12 @@
>   * Functionality: coherency
>   * Sub-category: CMD submission
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: basic
>   * Description: Verify that all capable engines can store dwords to a common
>   *		buffer object
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: cachelines
>   * Description: Verify that each capable engine can store a dword to different
> diff --git a/tests/intel/gem_exec_suspend.c b/tests/intel/gem_exec_suspend.c
> index 1d185c56b..55cd80b07 100644
> --- a/tests/intel/gem_exec_suspend.c
> +++ b/tests/intel/gem_exec_suspend.c
> @@ -43,7 +43,7 @@
>   * Sub-category: CMD submission
>   * Category: Desktop client
>   * Functionality: suspend
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: basic
>   * Description: Check basic functionality without any suspend/resume cycle.
> diff --git a/tests/intel/gem_exec_whisper.c b/tests/intel/gem_exec_whisper.c
> index 29ed163cc..e28f2374c 100644
> --- a/tests/intel/gem_exec_whisper.c
> +++ b/tests/intel/gem_exec_whisper.c
> @@ -44,7 +44,7 @@
>   * Functionality: execbuf
>   * Sub-category: CMD submission
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: basic-contexts
>   * SUBTEST: basic-contexts-all
> diff --git a/tests/intel/gem_exercise_blt.c b/tests/intel/gem_exercise_blt.c
> index f8fc689ff..4146457a3 100644
> --- a/tests/intel/gem_exercise_blt.c
> +++ b/tests/intel/gem_exercise_blt.c
> @@ -18,7 +18,7 @@
>   * Category: Desktop client
>   * Functionality: blitter
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: fast-copy
>   * Description: Check fast-copy blit blitter
> diff --git a/tests/intel/gem_fd_exhaustion.c b/tests/intel/gem_fd_exhaustion.c
> index 0bf7b309a..886f39426 100644
> --- a/tests/intel/gem_fd_exhaustion.c
> +++ b/tests/intel/gem_fd_exhaustion.c
> @@ -39,7 +39,7 @@
>   * Sub-category: CMD submission
>   * Category: Desktop client
>   * Functionality: fd exhaustion
> - * Run type: FULL
> + *
>   *
>   * SUBTEST:
>   */
> diff --git a/tests/intel/gem_fence_thrash.c b/tests/intel/gem_fence_thrash.c
> index 0c9be92df..b07c6133a 100644
> --- a/tests/intel/gem_fence_thrash.c
> +++ b/tests/intel/gem_fence_thrash.c
> @@ -49,7 +49,7 @@
>   * Sub-category: Fences
>   * Category: Desktop client
>   * Functionality: synchronization
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: bo-copy
>   *
> diff --git a/tests/intel/gem_fence_upload.c b/tests/intel/gem_fence_upload.c
> index 074908d81..06f6b666c 100644
> --- a/tests/intel/gem_fence_upload.c
> +++ b/tests/intel/gem_fence_upload.c
> @@ -46,7 +46,7 @@
>   * Sub-category: Fences
>   * Category: Desktop client
>   * Functionality: synchronization
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: performance
>   *
> diff --git a/tests/intel/gem_fenced_exec_thrash.c b/tests/intel/gem_fenced_exec_thrash.c
> index b26eb7780..8e09be51a 100644
> --- a/tests/intel/gem_fenced_exec_thrash.c
> +++ b/tests/intel/gem_fenced_exec_thrash.c
> @@ -40,7 +40,7 @@
>   * Sub-category: Fences
>   * Category: Desktop client
>   * Functionality: synchronization
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: 2-spare-fences
>   *
> diff --git a/tests/intel/gem_flink_basic.c b/tests/intel/gem_flink_basic.c
> index 85cd78a46..bed1f8ec6 100644
> --- a/tests/intel/gem_flink_basic.c
> +++ b/tests/intel/gem_flink_basic.c
> @@ -46,7 +46,7 @@
>   * Functionality: buffer management
>   * Sub-category: DRM
>   * Test category: GEM_Legacy
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: bad-flink
>   * Description: Verify that GEM_FLINK ioctl with invalid gem object fails.
> diff --git a/tests/intel/gem_flink_race.c b/tests/intel/gem_flink_race.c
> index 41c15f298..7f2f2a6bc 100644
> --- a/tests/intel/gem_flink_race.c
> +++ b/tests/intel/gem_flink_race.c
> @@ -41,7 +41,7 @@
>   * Description: Check for flink/open vs. gem close races.
>   * Feature: xorg_dri2
>   * Functionality: buffer management
> - * Run type: FULL
> + *
>   * Sub-category: DRM
>   * Test category: GEM_Legacy
>   *
> diff --git a/tests/intel/gem_gpgpu_fill.c b/tests/intel/gem_gpgpu_fill.c
> index 535ac0cc8..20ec8d394 100644
> --- a/tests/intel/gem_gpgpu_fill.c
> +++ b/tests/intel/gem_gpgpu_fill.c
> @@ -55,7 +55,7 @@
>   * Sub-category: GPGPU
>   * Test category: GEM_Legacy
>   * Feature: compute
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: basic
>   */
> diff --git a/tests/intel/gem_gtt_cpu_tlb.c b/tests/intel/gem_gtt_cpu_tlb.c
> index 9d9068d31..475992385 100644
> --- a/tests/intel/gem_gtt_cpu_tlb.c
> +++ b/tests/intel/gem_gtt_cpu_tlb.c
> @@ -50,7 +50,7 @@
>   * Sub-category: Memory management
>   * Category: Desktop client
>   * Functionality: mapping
> - * Run type: FULL
> + *
>   *
>   * SUBTEST:
>   */
> diff --git a/tests/intel/gem_gtt_hog.c b/tests/intel/gem_gtt_hog.c
> index 247b31da5..3d0775f03 100644
> --- a/tests/intel/gem_gtt_hog.c
> +++ b/tests/intel/gem_gtt_hog.c
> @@ -47,7 +47,7 @@
>   * Sub-category: Memory management
>   * Category: Desktop client
>   * Functionality: gtt
> - * Run type: FULL
> + *
>   *
>   * SUBTEST:
>   */
> diff --git a/tests/intel/gem_gtt_speed.c b/tests/intel/gem_gtt_speed.c
> index 6cc34ce87..8200683e8 100644
> --- a/tests/intel/gem_gtt_speed.c
> +++ b/tests/intel/gem_gtt_speed.c
> @@ -47,7 +47,7 @@
>   * Sub-category: Memory management
>   * Category: Desktop client
>   * Functionality: gtt
> - * Run type: FULL
> + *
>   *
>   * SUBTEST:
>   */
> diff --git a/tests/intel/gem_huc_copy.c b/tests/intel/gem_huc_copy.c
> index 311c2fc59..7180dc4ae 100644
> --- a/tests/intel/gem_huc_copy.c
> +++ b/tests/intel/gem_huc_copy.c
> @@ -42,7 +42,7 @@
>   * Sub-category: HUC
>   * Category: Desktop client
>   * Functionality: huc
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: huc-copy
>   * Description:
> diff --git a/tests/intel/gem_linear_blits.c b/tests/intel/gem_linear_blits.c
> index 64f220cb3..c05b02006 100644
> --- a/tests/intel/gem_linear_blits.c
> +++ b/tests/intel/gem_linear_blits.c
> @@ -57,11 +57,11 @@
>   * Functionality: blitter
>   * Sub-category: CMD submission
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: basic
>   * Description: Basic blitter functionality check with 2 buffers
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: interruptible
>   * Description: Test with interrupts in between the parent process
> diff --git a/tests/intel/gem_lmem_evict.c b/tests/intel/gem_lmem_evict.c
> index 1574bbb9f..d11454774 100644
> --- a/tests/intel/gem_lmem_evict.c
> +++ b/tests/intel/gem_lmem_evict.c
> @@ -14,7 +14,7 @@
>   * Sub-category: Memory management
>   * Category: Desktop client
>   * Functionality: local memory eviction
> - * Run type: FULL
> + *
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: dontneed-evict-race
> diff --git a/tests/intel/gem_lmem_swapping.c b/tests/intel/gem_lmem_swapping.c
> index d38a04673..2e9ca5fb4 100644
> --- a/tests/intel/gem_lmem_swapping.c
> +++ b/tests/intel/gem_lmem_swapping.c
> @@ -35,7 +35,7 @@
>   *
>   * SUBTEST: basic
>   * Description: Exercise local memory swapping to system memory
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: heavy-multi
>   * Description: Exercise local memory swapping to system memory
> @@ -69,7 +69,7 @@
>   *
>   * SUBTEST: parallel-random-engines
>   * Description: Exercise local memory swapping to system memory
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: parallel-random-verify
>   * Description: Exercise local memory swapping to system memory
> @@ -82,7 +82,7 @@
>   *
>   * SUBTEST: random-engines
>   * Description: Exercise local memory swapping to system memory
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: smem-oom
>   * Description: Exercise local memory swapping during exhausting system memory
> @@ -95,7 +95,7 @@
>   *
>   * SUBTEST: verify-random
>   * Description: Exercise local memory swapping to system memory
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: verify-random-ccs
>   * Description: Exercise local memory swapping to system memory
> diff --git a/tests/intel/gem_lut_handle.c b/tests/intel/gem_lut_handle.c
> index 359e1a921..5b246b9d6 100644
> --- a/tests/intel/gem_lut_handle.c
> +++ b/tests/intel/gem_lut_handle.c
> @@ -45,7 +45,7 @@
>   * Sub-category: CMD submission
>   * Category: Desktop client
>   * Functionality: execbuf
> - * Run type: FULL
> + *
>   *
>   * SUBTEST:
>   */
> diff --git a/tests/intel/gem_madvise.c b/tests/intel/gem_madvise.c
> index c8aa71c1b..9485c761e 100644
> --- a/tests/intel/gem_madvise.c
> +++ b/tests/intel/gem_madvise.c
> @@ -46,7 +46,7 @@
>   * Functionality: buffer management
>   * Sub-category: Memory management
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: dontneed-after-mmap
>   * Description: Check signal for Segmentation Fault and bus error after
> diff --git a/tests/intel/gem_media_fill.c b/tests/intel/gem_media_fill.c
> index 65b53a6e0..094baa24d 100644
> --- a/tests/intel/gem_media_fill.c
> +++ b/tests/intel/gem_media_fill.c
> @@ -52,7 +52,7 @@
>   * Sub-category: Media
>   * Category: Desktop client
>   * Functionality: fill surface with media block
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: media-fill
>   */
> diff --git a/tests/intel/gem_media_vme.c b/tests/intel/gem_media_vme.c
> index d58c990f7..273d4cf86 100644
> --- a/tests/intel/gem_media_vme.c
> +++ b/tests/intel/gem_media_vme.c
> @@ -42,7 +42,7 @@
>   * Sub-category: Media
>   * Category: Desktop client
>   * Functionality: media
> - * Run type: FULL
> + *
>   *
>   * SUBTEST:
>   */
> diff --git a/tests/intel/gem_mmap.c b/tests/intel/gem_mmap.c
> index 5cb8282b0..2030e8fda 100644
> --- a/tests/intel/gem_mmap.c
> +++ b/tests/intel/gem_mmap.c
> @@ -45,7 +45,7 @@
>   * Sub-category: Memory management
>   * Category: Desktop client
>   * Functionality: mapping
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: bad-object
>   * Description: Verify mapping to invalid gem objects won't be created.
> @@ -60,7 +60,7 @@
>   * Description:
>   *   Test basics of newly mapped gem object like default content, write and read
>   *   coherency, mapping existence after gem_close and unmapping.
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: basic-small-bo
>   * Description:
> diff --git a/tests/intel/gem_mmap_gtt.c b/tests/intel/gem_mmap_gtt.c
> index 8d04188f7..a0c210eae 100644
> --- a/tests/intel/gem_mmap_gtt.c
> +++ b/tests/intel/gem_mmap_gtt.c
> @@ -53,7 +53,7 @@
>   * Sub-category: Memory management
>   * Category: Desktop client
>   * Functionality: map gtt
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: bad-object
>   * Description: Verify mapping to invalid gem objects fails.
> diff --git a/tests/intel/gem_mmap_offset.c b/tests/intel/gem_mmap_offset.c
> index b069b80f6..a82f99afe 100644
> --- a/tests/intel/gem_mmap_offset.c
> +++ b/tests/intel/gem_mmap_offset.c
> @@ -45,7 +45,7 @@
>   * Functionality: mapping
>   * Sub-category: Memory management
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: bad-extensions
>   * SUBTEST: bad-flags
> diff --git a/tests/intel/gem_mmap_wc.c b/tests/intel/gem_mmap_wc.c
> index f76a9bc4b..0fb8d7230 100644
> --- a/tests/intel/gem_mmap_wc.c
> +++ b/tests/intel/gem_mmap_wc.c
> @@ -45,7 +45,7 @@
>   * Sub-category: Memory Management
>   * Category: Desktop client
>   * Functionality: cache
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: bad-object
>   * SUBTEST: bad-offset
> diff --git a/tests/intel/gem_partial_pwrite_pread.c b/tests/intel/gem_partial_pwrite_pread.c
> index 782a4f3b8..4529899c3 100644
> --- a/tests/intel/gem_partial_pwrite_pread.c
> +++ b/tests/intel/gem_partial_pwrite_pread.c
> @@ -45,7 +45,7 @@
>   * Sub-category: CMD submission
>   * Category: Desktop client
>   * Functionality: pread/pwrite
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: reads
>   * Description:
> diff --git a/tests/intel/gem_pipe_control_store_loop.c b/tests/intel/gem_pipe_control_store_loop.c
> index 3cfef84e7..16afa47ea 100644
> --- a/tests/intel/gem_pipe_control_store_loop.c
> +++ b/tests/intel/gem_pipe_control_store_loop.c
> @@ -49,7 +49,7 @@
>   * Description: Test (TLB-)Coherency of pipe_control QW writes.
>   * Feature: cmd_submission
>   * Functionality: coherency
> - * Run type: FULL
> + *
>   * Sub-category: CMD submission
>   * Test category: GEM_Legacy
>   *
> diff --git a/tests/intel/gem_ppgtt.c b/tests/intel/gem_ppgtt.c
> index c25bf5f88..9ba230b36 100644
> --- a/tests/intel/gem_ppgtt.c
> +++ b/tests/intel/gem_ppgtt.c
> @@ -46,7 +46,7 @@
>   * Functionality: buffer management
>   * Sub-category: Memory management
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: blt-vs-render-ctx0
>   *
> diff --git a/tests/intel/gem_pread.c b/tests/intel/gem_pread.c
> index bfd20b8f8..1b953d395 100644
> --- a/tests/intel/gem_pread.c
> +++ b/tests/intel/gem_pread.c
> @@ -51,7 +51,7 @@
>   * Sub-category: CMD submission
>   * Category: Desktop client
>   * Functionality: pread
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: bench
>   *
> diff --git a/tests/intel/gem_pread_after_blit.c b/tests/intel/gem_pread_after_blit.c
> index 64453ad3d..cc38282d3 100644
> --- a/tests/intel/gem_pread_after_blit.c
> +++ b/tests/intel/gem_pread_after_blit.c
> @@ -53,7 +53,7 @@
>   * Sub-category: CMD submission
>   * Category: Desktop client
>   * Functionality: pread
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: default-hang
>   *
> diff --git a/tests/intel/gem_pwrite.c b/tests/intel/gem_pwrite.c
> index f265eb68c..971307f5b 100644
> --- a/tests/intel/gem_pwrite.c
> +++ b/tests/intel/gem_pwrite.c
> @@ -52,7 +52,7 @@
>   * Sub-category: CMD submission
>   * Category: Desktop client
>   * Functionality: pwrite
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: basic-exhaustion
>   *
> diff --git a/tests/intel/gem_pwrite_snooped.c b/tests/intel/gem_pwrite_snooped.c
> index fede6e1c8..b27bb1d4e 100644
> --- a/tests/intel/gem_pwrite_snooped.c
> +++ b/tests/intel/gem_pwrite_snooped.c
> @@ -44,7 +44,7 @@
>   * Sub-category: CMD submission
>   * Category: Desktop client
>   * Functionality: pwrite
> - * Run type: FULL
> + *
>   *
>   * SUBTEST:
>   */
> diff --git a/tests/intel/gem_pxp.c b/tests/intel/gem_pxp.c
> index 72f34c982..32436cc6a 100644
> --- a/tests/intel/gem_pxp.c
> +++ b/tests/intel/gem_pxp.c
> @@ -14,7 +14,7 @@
>   * Functionality: pxp
>   * Sub-category: Power management
>   * Category: Desktop client
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: create-protected-buffer
>   *
> diff --git a/tests/intel/gem_read_read_speed.c b/tests/intel/gem_read_read_speed.c
> index dde021f22..2cf803aa1 100644
> --- a/tests/intel/gem_read_read_speed.c
> +++ b/tests/intel/gem_read_read_speed.c
> @@ -48,7 +48,7 @@
>   * Sub-category: Memory management
>   * Category: Desktop client
>   * Functionality: read/write memory
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: read-read-1024x1024
>   *
> diff --git a/tests/intel/gem_readwrite.c b/tests/intel/gem_readwrite.c
> index 545e97f17..7ab436016 100644
> --- a/tests/intel/gem_readwrite.c
> +++ b/tests/intel/gem_readwrite.c
> @@ -44,7 +44,7 @@
>   * Sub-category: Memory management
>   * Category: Desktop client
>   * Functionality: read/write memory
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: beyond-EOB
>   *
> diff --git a/tests/intel/gem_reg_read.c b/tests/intel/gem_reg_read.c
> index 03b12551d..3d9c0bd1e 100644
> --- a/tests/intel/gem_reg_read.c
> +++ b/tests/intel/gem_reg_read.c
> @@ -38,7 +38,7 @@
>   * Sub-category: uapi
>   * Category: Desktop client
>   * Functionality: ioctl
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: bad-register
>   *
> diff --git a/tests/intel/gem_render_copy.c b/tests/intel/gem_render_copy.c
> index f97a3f3f9..024019132 100644
> --- a/tests/intel/gem_render_copy.c
> +++ b/tests/intel/gem_render_copy.c
> @@ -55,7 +55,7 @@
>   * Sub-category: Render copy
>   * Category: Desktop client
>   * Functionality: render copy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: linear
>   * Description: Test render_copy() from a mixed-tiled to a linear buffer.
> diff --git a/tests/intel/gem_render_copy_redux.c b/tests/intel/gem_render_copy_redux.c
> index b8e796109..5a9d35c37 100644
> --- a/tests/intel/gem_render_copy_redux.c
> +++ b/tests/intel/gem_render_copy_redux.c
> @@ -54,7 +54,7 @@
>   * Sub-category: Render copy
>   * Category: Desktop client
>   * Functionality: render copy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: flink
>   * Feature: mapping, xorg_dri2
> diff --git a/tests/intel/gem_render_linear_blits.c b/tests/intel/gem_render_linear_blits.c
> index 095d0acb2..4b5d97a70 100644
> --- a/tests/intel/gem_render_linear_blits.c
> +++ b/tests/intel/gem_render_linear_blits.c
> @@ -55,14 +55,14 @@
>   * Sub-category: CMD submission
>   * Category: Desktop client
>   * Functionality: render blits
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: aperture-shrink
>   *
>   * SUBTEST: aperture-thrash
>   *
>   * SUBTEST: basic
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: swap-thrash
>   */
> diff --git a/tests/intel/gem_render_tiled_blits.c b/tests/intel/gem_render_tiled_blits.c
> index dda6faf42..be391afe0 100644
> --- a/tests/intel/gem_render_tiled_blits.c
> +++ b/tests/intel/gem_render_tiled_blits.c
> @@ -58,7 +58,7 @@
>   * Sub-category: CMD submission
>   * Category: Desktop client
>   * Functionality: render blits
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: aperture-shrink
>   * Description:
> @@ -70,7 +70,7 @@
>   *
>   * SUBTEST: basic
>   * Description: Check basic functionality.
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: swap-thrash
>   * Description:
> diff --git a/tests/intel/gem_request_retire.c b/tests/intel/gem_request_retire.c
> index 8db5780c5..f5c410e5b 100644
> --- a/tests/intel/gem_request_retire.c
> +++ b/tests/intel/gem_request_retire.c
> @@ -57,7 +57,7 @@
>   * Functionality: requests
>   * Sub-category: CMD submission
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: retire-vma-not-inactive
>   */
> diff --git a/tests/intel/gem_reset_stats.c b/tests/intel/gem_reset_stats.c
> index a62c4061a..bb8103592 100644
> --- a/tests/intel/gem_reset_stats.c
> +++ b/tests/intel/gem_reset_stats.c
> @@ -52,7 +52,7 @@
>   * Sub-category: uapi
>   * Category: Desktop client
>   * Functionality: reset
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: ban-blt
>   *
> diff --git a/tests/intel/gem_ringfill.c b/tests/intel/gem_ringfill.c
> index e9f0c7d97..f6a1ef349 100644
> --- a/tests/intel/gem_ringfill.c
> +++ b/tests/intel/gem_ringfill.c
> @@ -51,10 +51,10 @@
>   * Functionality: execbuf
>   * Sub-category: CMD submission
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: basic-all
> - * Run type: BAT
> + *
>   * Description: Basic check to fill the ring up to maximum on all engines
>   *		simultaneously.
>   *
> diff --git a/tests/intel/gem_set_tiling_vs_blt.c b/tests/intel/gem_set_tiling_vs_blt.c
> index 28469f5f3..20eed99ba 100644
> --- a/tests/intel/gem_set_tiling_vs_blt.c
> +++ b/tests/intel/gem_set_tiling_vs_blt.c
> @@ -64,7 +64,7 @@
>   * Functionality: tiling
>   * Sub-category: Blitter
>   * Category: Desktop client
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: tiled-to-tiled
>   * Description: Check for proper synchronization of tiled->tiled transition.
> diff --git a/tests/intel/gem_set_tiling_vs_gtt.c b/tests/intel/gem_set_tiling_vs_gtt.c
> index 7e5dab1fa..0333d2675 100644
> --- a/tests/intel/gem_set_tiling_vs_gtt.c
> +++ b/tests/intel/gem_set_tiling_vs_gtt.c
> @@ -45,7 +45,7 @@
>   * Sub-category: Memory management
>   * Category: Desktop client
>   * Functionality: tiling vs gtt coherency
> - * Run type: FULL
> + *
>   *
>   * SUBTEST:
>   */
> diff --git a/tests/intel/gem_set_tiling_vs_pwrite.c b/tests/intel/gem_set_tiling_vs_pwrite.c
> index a358ddba6..98706118f 100644
> --- a/tests/intel/gem_set_tiling_vs_pwrite.c
> +++ b/tests/intel/gem_set_tiling_vs_pwrite.c
> @@ -45,7 +45,7 @@
>   * Sub-category: Memory management
>   * Category: Desktop client
>   * Functionality: tiling vs pwrite coherency
> - * Run type: FULL
> + *
>   *
>   * SUBTEST:
>   */
> diff --git a/tests/intel/gem_shrink.c b/tests/intel/gem_shrink.c
> index 094881a15..6a8f76b53 100644
> --- a/tests/intel/gem_shrink.c
> +++ b/tests/intel/gem_shrink.c
> @@ -40,7 +40,7 @@
>   * Functionality: buffer management
>   * Sub-category: CMD submission
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: execbuf1
>   *
> diff --git a/tests/intel/gem_softpin.c b/tests/intel/gem_softpin.c
> index f06e58be9..aa9694355 100644
> --- a/tests/intel/gem_softpin.c
> +++ b/tests/intel/gem_softpin.c
> @@ -41,18 +41,18 @@
>   * Functionality: softpin
>   * Sub-category: CMD submission
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: 32b-excludes-last-page
>   * Description: Check the last 32b page is excluded.
>   *
>   * SUBTEST: allocator-basic
>   * Description: Check that we can place objects at start/end of the GTT using the allocator.
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: allocator-basic-reserve
>   * Description: Check that if we can reserve a space for an object starting from a given offset.
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: allocator-evict
>   * Description: Exercise eviction with softpinning.
> diff --git a/tests/intel/gem_spin_batch.c b/tests/intel/gem_spin_batch.c
> index 2e617289c..2093614c1 100644
> --- a/tests/intel/gem_spin_batch.c
> +++ b/tests/intel/gem_spin_batch.c
> @@ -32,7 +32,7 @@
>   * Feature: context, igt_core
>   * Functionality: dummy workload
>   * Sub-category: IGT Lib
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: engines
>   * SUBTEST: legacy
> diff --git a/tests/intel/gem_streaming_writes.c b/tests/intel/gem_streaming_writes.c
> index dd2f28331..9e056804c 100644
> --- a/tests/intel/gem_streaming_writes.c
> +++ b/tests/intel/gem_streaming_writes.c
> @@ -46,7 +46,7 @@
>   * Sub-category: Memory management
>   * Category: Desktop client
>   * Functionality: barrier
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: batch-cpu
>   *
> diff --git a/tests/intel/gem_stress.c b/tests/intel/gem_stress.c
> index c3ee00012..f5a27c887 100644
> --- a/tests/intel/gem_stress.c
> +++ b/tests/intel/gem_stress.c
> @@ -67,7 +67,7 @@
>   * Category: Desktop client
>   * Sub-category: CMD submission
>   * Functionality: coherency
> - * Run type: FULL
> + *
>   *
>   * SUBTEST:
>   */
> diff --git a/tests/intel/gem_sync.c b/tests/intel/gem_sync.c
> index 129ee3b68..089992d74 100644
> --- a/tests/intel/gem_sync.c
> +++ b/tests/intel/gem_sync.c
> @@ -40,7 +40,7 @@
>   * Functionality: semaphore
>   * Sub-category: Synchronization
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: active
>   * Description: Exercise waiting while keeping the GPU busy on each engine.
> @@ -58,14 +58,14 @@
>   *
>   * SUBTEST: basic-all
>   * Description: Basic test to wait upon a batch on all rings.
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: basic-each
>   * Description:
>   *   Check synchronisation of ring.
>   *   Exercise all physical engine selection and legacy rings
>   * Feature: multitile, synchronization
> - * Run type: BAT
> + *
>   * Test category: MultiTile
>   *
>   * SUBTEST: basic-many-each
> @@ -162,7 +162,7 @@
>   * SUBTEST: legacy-switch
>   * Description: Check sync after context switch for each legacy engine.
>   * Feature: synchronization
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: legacy-wakeup
>   * Description: Stress for nop + sync for each legacy engine.
> diff --git a/tests/intel/gem_tiled_blits.c b/tests/intel/gem_tiled_blits.c
> index ec6e88477..e2be6a3d9 100644
> --- a/tests/intel/gem_tiled_blits.c
> +++ b/tests/intel/gem_tiled_blits.c
> @@ -61,11 +61,11 @@
>   * Sub-category: Memory management
>   * Category: Desktop client
>   * Functionality: tiled blits
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: basic
>   * Description: Check basic functionality.
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: interruptible
>   * Description: Check with interrupts in parallel execution.
> diff --git a/tests/intel/gem_tiled_fence_blits.c b/tests/intel/gem_tiled_fence_blits.c
> index 920eeb42d..a1747b81d 100644
> --- a/tests/intel/gem_tiled_fence_blits.c
> +++ b/tests/intel/gem_tiled_fence_blits.c
> @@ -57,11 +57,11 @@
>   *
>   * SUBTEST: basic
>   * Description: Check basic functionality.
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: normal
>   * Description: Check with parallel execution.
> - * Run type: FULL
> + *
>   */
>  
>  IGT_TEST_DESCRIPTION("Tests fence management problems related to tiled blits by performing "
> diff --git a/tests/intel/gem_tiled_partial_pwrite_pread.c b/tests/intel/gem_tiled_partial_pwrite_pread.c
> index 7d4fa8463..f00e257f6 100644
> --- a/tests/intel/gem_tiled_partial_pwrite_pread.c
> +++ b/tests/intel/gem_tiled_partial_pwrite_pread.c
> @@ -45,7 +45,7 @@
>   * Sub-category: Memory management
>   * Category: Desktop client
>   * Functionality: tiled pwrite/pread
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: reads
>   *
> diff --git a/tests/intel/gem_tiled_pread_basic.c b/tests/intel/gem_tiled_pread_basic.c
> index 13181d86c..8222a3b43 100644
> --- a/tests/intel/gem_tiled_pread_basic.c
> +++ b/tests/intel/gem_tiled_pread_basic.c
> @@ -55,7 +55,7 @@
>   * Sub-category: Memory management
>   * Category: Desktop client
>   * Functionality: tiled pread/pwrite
> - * Run type: BAT
> + *
>   *
>   * SUBTEST:
>   */
> diff --git a/tests/intel/gem_tiled_pread_pwrite.c b/tests/intel/gem_tiled_pread_pwrite.c
> index f8bc79731..6c418b579 100644
> --- a/tests/intel/gem_tiled_pread_pwrite.c
> +++ b/tests/intel/gem_tiled_pread_pwrite.c
> @@ -65,7 +65,7 @@
>   * Sub-category: Memory management
>   * Category: Desktop client
>   * Functionality: tiled pread/pwrite
> - * Run type: FULL
> + *
>   *
>   * SUBTEST:
>   */
> diff --git a/tests/intel/gem_tiled_swapping.c b/tests/intel/gem_tiled_swapping.c
> index 13f9fb41f..33ad10443 100644
> --- a/tests/intel/gem_tiled_swapping.c
> +++ b/tests/intel/gem_tiled_swapping.c
> @@ -65,7 +65,7 @@
>   * Sub-category: Memory management
>   * Category: Desktop client
>   * Functionality: swapping
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: non-threaded
>   *
> diff --git a/tests/intel/gem_tiled_wb.c b/tests/intel/gem_tiled_wb.c
> index ee17b587d..46badb168 100644
> --- a/tests/intel/gem_tiled_wb.c
> +++ b/tests/intel/gem_tiled_wb.c
> @@ -54,7 +54,7 @@
>   * Sub-category: Memory management
>   * Category: Desktop client
>   * Functionality: cache
> - * Run type: FULL
> + *
>   *
>   * SUBTEST:
>   */
> diff --git a/tests/intel/gem_tiled_wc.c b/tests/intel/gem_tiled_wc.c
> index 356b48829..234601112 100644
> --- a/tests/intel/gem_tiled_wc.c
> +++ b/tests/intel/gem_tiled_wc.c
> @@ -51,7 +51,7 @@
>   * Sub-category: Memory management
>   * Category: Desktop client
>   * Functionality: cache
> - * Run type: FULL
> + *
>   *
>   * SUBTEST:
>   */
> diff --git a/tests/intel/gem_tiling_max_stride.c b/tests/intel/gem_tiling_max_stride.c
> index 93b89b00e..5c6339cdf 100644
> --- a/tests/intel/gem_tiling_max_stride.c
> +++ b/tests/intel/gem_tiling_max_stride.c
> @@ -46,7 +46,7 @@
>   * Sub-category: Memory management
>   * Category: Desktop client
>   * Functionality: fences
> - * Run type: FULL
> + *
>   *
>   * SUBTEST:
>   */
> diff --git a/tests/intel/gem_unfence_active_buffers.c b/tests/intel/gem_unfence_active_buffers.c
> index aaa841f46..31141feea 100644
> --- a/tests/intel/gem_unfence_active_buffers.c
> +++ b/tests/intel/gem_unfence_active_buffers.c
> @@ -59,7 +59,7 @@
>   * Sub-category: Memory management
>   * Category: Desktop client
>   * Functionality: fences
> - * Run type: FULL
> + *
>   *
>   * SUBTEST:
>   */
> diff --git a/tests/intel/gem_unref_active_buffers.c b/tests/intel/gem_unref_active_buffers.c
> index e30214bc7..d05c06144 100644
> --- a/tests/intel/gem_unref_active_buffers.c
> +++ b/tests/intel/gem_unref_active_buffers.c
> @@ -47,7 +47,7 @@
>   * Description: Test unreferencing of active buffers.
>   * Feature: cmd_submission
>   * Functionality: buffer management
> - * Run type: FULL
> + *
>   * Sub-category: CMD submission
>   * Test category: GEM_Legacy
>   *
> diff --git a/tests/intel/gem_userptr_blits.c b/tests/intel/gem_userptr_blits.c
> index 3e1f48a4f..5efff8adc 100644
> --- a/tests/intel/gem_userptr_blits.c
> +++ b/tests/intel/gem_userptr_blits.c
> @@ -74,7 +74,7 @@
>   * Functionality: buffer management
>   * Sub-category: Compute
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: access-control
>   * SUBTEST: coherency-sync
> diff --git a/tests/intel/gem_vm_create.c b/tests/intel/gem_vm_create.c
> index d3d03eb73..fbf5e9a73 100644
> --- a/tests/intel/gem_vm_create.c
> +++ b/tests/intel/gem_vm_create.c
> @@ -34,7 +34,7 @@
>   * Sub-category: Context
>   * Feature: mapping
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: create-ext
>   *
> diff --git a/tests/intel/gem_wait.c b/tests/intel/gem_wait.c
> index 0d4a959b1..545d4b3db 100644
> --- a/tests/intel/gem_wait.c
> +++ b/tests/intel/gem_wait.c
> @@ -39,7 +39,7 @@
>   * Functionality: semaphore
>   * Sub-category: Synchronization
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: await
>   * Description: Verify GEM_WAIT functionality in await mode.
> @@ -50,7 +50,7 @@
>   * SUBTEST: busy@all
>   *
>   * SUBTEST: busy@all-engines
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: hang-busy
>   * Description: Verify GEM_WAIT functionality in busy mode, when hang is allowed.
> @@ -76,7 +76,7 @@
>   * SUBTEST: wait@all
>   *
>   * SUBTEST: wait@all-engines
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: write-busy
>   * Description: Verify GEM_WAIT functionality in write-busy mode.
> diff --git a/tests/intel/gem_watchdog.c b/tests/intel/gem_watchdog.c
> index a844cdfe0..76baeb171 100644
> --- a/tests/intel/gem_watchdog.c
> +++ b/tests/intel/gem_watchdog.c
> @@ -41,7 +41,7 @@
>   * Sub-category: CMD submission
>   * Category: Desktop client
>   * Functionality: fences
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: default-physical
>   *
> diff --git a/tests/intel/gem_workarounds.c b/tests/intel/gem_workarounds.c
> index d83c0a1db..b419dda8d 100644
> --- a/tests/intel/gem_workarounds.c
> +++ b/tests/intel/gem_workarounds.c
> @@ -39,7 +39,7 @@
>   * Functionality: workarounds
>   * Sub-category: Context
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: basic-read
>   * SUBTEST: basic-read-context
> diff --git a/tests/intel/gen3_mixed_blits.c b/tests/intel/gen3_mixed_blits.c
> index b9ae784da..f347a0780 100644
> --- a/tests/intel/gen3_mixed_blits.c
> +++ b/tests/intel/gen3_mixed_blits.c
> @@ -54,7 +54,7 @@
>   * Sub-category: Obsolete
>   * Functionality: obsolete
>   * Category: Obsolete
> - * Run type: FULL
> + *
>   *
>   * SUBTEST:
>   */
> diff --git a/tests/intel/gen3_render_linear_blits.c b/tests/intel/gen3_render_linear_blits.c
> index e62a0e9a1..43d219743 100644
> --- a/tests/intel/gen3_render_linear_blits.c
> +++ b/tests/intel/gen3_render_linear_blits.c
> @@ -53,7 +53,7 @@
>   * Sub-category: Obsolete
>   * Functionality: obsolete
>   * Category: Obsolete
> - * Run type: FULL
> + *
>   *
>   * SUBTEST:
>   */
> diff --git a/tests/intel/gen3_render_mixed_blits.c b/tests/intel/gen3_render_mixed_blits.c
> index f3fa937d0..b781df626 100644
> --- a/tests/intel/gen3_render_mixed_blits.c
> +++ b/tests/intel/gen3_render_mixed_blits.c
> @@ -54,7 +54,7 @@
>   * Sub-category: Obsolete
>   * Functionality: obsolete
>   * Category: Obsolete
> - * Run type: FULL
> + *
>   *
>   * SUBTEST:
>   */
> diff --git a/tests/intel/gen3_render_tiledx_blits.c b/tests/intel/gen3_render_tiledx_blits.c
> index 88dd606ec..391c2f3dd 100644
> --- a/tests/intel/gen3_render_tiledx_blits.c
> +++ b/tests/intel/gen3_render_tiledx_blits.c
> @@ -54,7 +54,7 @@
>   * Sub-category: Obsolete
>   * Category: Obsolete
>   * Functionality: obsolete
> - * Run type: FULL
> + *
>   *
>   * SUBTEST:
>   */
> diff --git a/tests/intel/gen3_render_tiledy_blits.c b/tests/intel/gen3_render_tiledy_blits.c
> index c2fa63c74..ca06dca02 100644
> --- a/tests/intel/gen3_render_tiledy_blits.c
> +++ b/tests/intel/gen3_render_tiledy_blits.c
> @@ -54,7 +54,7 @@
>   * Sub-category: Obsolete
>   * Category: Obsolete
>   * Functionality: obsolete
> - * Run type: FULL
> + *
>   *
>   * SUBTEST:
>   */
> diff --git a/tests/intel/gen7_exec_parse.c b/tests/intel/gen7_exec_parse.c
> index f9033a5d8..901e464f7 100644
> --- a/tests/intel/gen7_exec_parse.c
> +++ b/tests/intel/gen7_exec_parse.c
> @@ -40,7 +40,7 @@
>   * Sub-category: CMD submission
>   * Category: Desktop client
>   * Functionality: command_parser
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: basic-allocation
>   *
> diff --git a/tests/intel/gen9_exec_parse.c b/tests/intel/gen9_exec_parse.c
> index 509a2e80f..5199d181e 100644
> --- a/tests/intel/gen9_exec_parse.c
> +++ b/tests/intel/gen9_exec_parse.c
> @@ -39,7 +39,7 @@
>   * Sub-category: Blitter
>   * Functionality: command_parser
>   * Category: Desktop client
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: allowed-all
>   *
> diff --git a/tests/intel/i915_fb_tiling.c b/tests/intel/i915_fb_tiling.c
> index e1dc54cc5..8c2ab8f4f 100644
> --- a/tests/intel/i915_fb_tiling.c
> +++ b/tests/intel/i915_fb_tiling.c
> @@ -30,7 +30,7 @@
>   * Sub-category: Memory management
>   * Category: Desktop client
>   * Functionality: tiling
> - * Run type: FULL
> + *
>   *
>   * SUBTEST:
>   */
> diff --git a/tests/intel/i915_getparams_basic.c b/tests/intel/i915_getparams_basic.c
> index 971c35e55..4ccc5a665 100644
> --- a/tests/intel/i915_getparams_basic.c
> +++ b/tests/intel/i915_getparams_basic.c
> @@ -36,7 +36,7 @@
>   * Description: Tests the export of parameters via DRM_IOCTL_I915_GETPARAM
>   * Feature: gem_core
>   * Functionality: device topology
> - * Run type: BAT
> + *
>   * Sub-category: uapi
>   * Test category: GEM_Legacy
>   *
> diff --git a/tests/intel/i915_hangman.c b/tests/intel/i915_hangman.c
> index 0749a9900..3ba56fca5 100644
> --- a/tests/intel/i915_hangman.c
> +++ b/tests/intel/i915_hangman.c
> @@ -53,55 +53,55 @@
>   * Description:
>   *   Check that hang detector works
>   *   error detection
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: engine-engine-error
>   * Description:
>   *   Per engine hang recovery (invalid CS, engine reset)
>   *   error detection
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: engine-engine-hang
>   * Description:
>   *   Per engine hang recovery (spin, engine reset)
>   *   error detection
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: engine-error-state-capture
>   * Description:
>   *   Per engine error capture (engine reset)
>   *   error detection
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: error-state-basic
>   * Description:
>   *   Basic error capture
>   *   error detection
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: gt-engine-error
>   * Description:
>   *   Per engine hang recovery (invalid CS, GT reset)
>   *   error detection
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: gt-engine-hang
>   * Description:
>   *   Per engine hang recovery (spin, GT reset)
>   *   error detection
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: gt-error-state-capture
>   * Description:
>   *   Per engine error capture (GT reset)
>   *   error detection
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: hangcheck-unterminated
>   * Description:
>   *   Check that executing unintialised memory causes a hang
>   *   error detection
> - * Run type: FULL
> + *
>   */
>  
>  #ifndef I915_PARAM_CMD_PARSER_VERSION
> diff --git a/tests/intel/i915_module_load.c b/tests/intel/i915_module_load.c
> index b02e3e005..e83218c9f 100644
> --- a/tests/intel/i915_module_load.c
> +++ b/tests/intel/i915_module_load.c
> @@ -31,16 +31,16 @@
>   * Functionality: driver handler
>   * Sub-category: driver
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: load
>   * Description: Check if i915 and friends are not yet loaded, then load them.
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: reload
>   * Description: Verify the basic functionality of i915 driver after it's reloaded.
>   * Feature: core, sriov-core
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: reload-no-display
>   * Description: Verify that i915 driver can be successfully loaded with disabled display.
> diff --git a/tests/intel/i915_pciid.c b/tests/intel/i915_pciid.c
> index 436acdaeb..7b871d10f 100644
> --- a/tests/intel/i915_pciid.c
> +++ b/tests/intel/i915_pciid.c
> @@ -34,7 +34,7 @@
>   * Description: Check that igt/i915 know about this PCI-ID
>   * Feature: core
>   * Functionality: device management
> - * Run type: BAT
> + *
>   * Sub-category: Core
>   * Test category: GEM_Legacy
>   *
> diff --git a/tests/intel/i915_pipe_stress.c b/tests/intel/i915_pipe_stress.c
> index a487f70de..8ab8be77f 100644
> --- a/tests/intel/i915_pipe_stress.c
> +++ b/tests/intel/i915_pipe_stress.c
> @@ -28,7 +28,7 @@
>   * Mega feature: General Display Features
>   * Sub-category: Display
>   * Test category: stress test
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: stress-xrgb8888-untiled
>   * Description:
> diff --git a/tests/intel/i915_pm_freq_api.c b/tests/intel/i915_pm_freq_api.c
> index aa2de74c9..e3abc02ff 100644
> --- a/tests/intel/i915_pm_freq_api.c
> +++ b/tests/intel/i915_pm_freq_api.c
> @@ -14,7 +14,7 @@
>   * Category: Infrastructure
>   * Sub-category: uapi
>   * Functionality: slpc
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: freq-basic-api
>   * Description: Test basic API for controlling min/max GT frequency
> diff --git a/tests/intel/i915_pm_freq_mult.c b/tests/intel/i915_pm_freq_mult.c
> index de65eaedf..45f02245d 100644
> --- a/tests/intel/i915_pm_freq_mult.c
> +++ b/tests/intel/i915_pm_freq_mult.c
> @@ -18,7 +18,7 @@
>   * Functionality: freg multipliers
>   * Test category: i915
>   * Sub-category: Power management
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: media-freq
>   * Description: Tests for media frequency factor sysfs
> diff --git a/tests/intel/i915_pm_rc6_residency.c b/tests/intel/i915_pm_rc6_residency.c
> index 67ae1f1f9..c067de51c 100644
> --- a/tests/intel/i915_pm_rc6_residency.c
> +++ b/tests/intel/i915_pm_rc6_residency.c
> @@ -47,7 +47,7 @@
>   * Functionality: rc6
>   * Sub-category: Power management
>   * Category: Desktop client
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: media-rc6-accuracy
>   * Feature: pm_rc6
> diff --git a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c
> index be8d5fd77..fc8334843 100644
> --- a/tests/intel/i915_pm_rpm.c
> +++ b/tests/intel/i915_pm_rpm.c
> @@ -47,7 +47,7 @@
>   * Sub-category: Power management
>   * Category: Desktop client
>   * Test category: pm_rpm
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: debugfs-forcewake-user
>   * SUBTEST: debugfs-read
> diff --git a/tests/intel/i915_pm_rps.c b/tests/intel/i915_pm_rps.c
> index 17784daa9..50c362775 100644
> --- a/tests/intel/i915_pm_rps.c
> +++ b/tests/intel/i915_pm_rps.c
> @@ -52,10 +52,10 @@
>   * Functionality: pm_rps
>   * Sub-category: Power management
>   * Category: Desktop client
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: basic-api
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: engine-order
>   * Description:
> diff --git a/tests/intel/i915_pm_sseu.c b/tests/intel/i915_pm_sseu.c
> index 354403ef2..725766e81 100644
> --- a/tests/intel/i915_pm_sseu.c
> +++ b/tests/intel/i915_pm_sseu.c
> @@ -42,7 +42,7 @@
>   * Sub-category: Power management
>   * Category: Desktop client
>   * Functionality: sseu
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: full-enable
>   */
> diff --git a/tests/intel/i915_power.c b/tests/intel/i915_power.c
> index 0f083b375..164779ce0 100644
> --- a/tests/intel/i915_power.c
> +++ b/tests/intel/i915_power.c
> @@ -11,7 +11,7 @@
>   * TEST: i915 power
>   * Description: i915 power measurement tests
>   * Feature: hwmon
> - * Run type: FULL
> + *
>   * Test category: GEM_Legacy
>   * Sub-category: Power management
>   * Category: Desktop client
> diff --git a/tests/intel/i915_query.c b/tests/intel/i915_query.c
> index 4a82b13c6..46be453e8 100644
> --- a/tests/intel/i915_query.c
> +++ b/tests/intel/i915_query.c
> @@ -35,7 +35,7 @@
>   * Functionality: device topology
>   * Sub-category: uapi
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: engine-info
>   * Description: Positive tests for DRM_I915_QUERY_ENGINE_INFO
> diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c
> index 8ad15c480..30cb4e784 100644
> --- a/tests/intel/i915_selftest.c
> +++ b/tests/intel/i915_selftest.c
> @@ -32,7 +32,7 @@
>   * Sub-category: Selftest
>   * Category: Selftest
>   * Functionality: selftest
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: live@active
>   * Category: Selftest
> @@ -370,7 +370,7 @@
>   * Feature: gem_core
>   * Sub-category: Selftest
>   * Functionality: selftest
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: mock@buddy
>   * Category: Selftest
> @@ -523,7 +523,7 @@
>   * Feature: oa
>   * Functionality: oa
>   * Sub-category: Performance
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: perf@blt
>   * Category: Selftest
> diff --git a/tests/intel/i915_suspend.c b/tests/intel/i915_suspend.c
> index 7c96e25f5..bf1e012e3 100644
> --- a/tests/intel/i915_suspend.c
> +++ b/tests/intel/i915_suspend.c
> @@ -52,7 +52,7 @@
>   * Functionality: suspend
>   * Sub-category: Power management
>   * Category: Desktop client
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: basic-s2idle-without-i915
>   * Description: Validate suspend-to-idle without i915 module
> @@ -61,7 +61,7 @@
>   * Description:
>   *   Validate S3 without i915 module.
>   *   Validate S3 state without i915 module
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: debugfs-reader
>   * Description: Test debugfs behavior during suspend to idle
> diff --git a/tests/intel/intel_hwmon.c b/tests/intel/intel_hwmon.c
> index c3e5033d5..05a1383a4 100644
> --- a/tests/intel/intel_hwmon.c
> +++ b/tests/intel/intel_hwmon.c
> @@ -14,7 +14,7 @@
>   * Category: Software Building Block
>   * Sub-category: RAS
>   * Functionality: hwmon
> - * Run type: FULL
> + *
>   * Test category: functionality
>   *
>   * SUBTEST: hwmon-read
> diff --git a/tests/intel/perf.c b/tests/intel/perf.c
> index fdfb75603..5ee363040 100644
> --- a/tests/intel/perf.c
> +++ b/tests/intel/perf.c
> @@ -53,7 +53,7 @@
>   * Functionality: oa
>   * Sub-category: Performance
>   * Category: Desktop client
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: blocking
>   * Description: Test blocking read with default hrtimer frequency
> diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
> index b80273a56..e341bdb3f 100644
> --- a/tests/intel/perf_pmu.c
> +++ b/tests/intel/perf_pmu.c
> @@ -57,7 +57,7 @@
>   * Sub-category: Performance
>   * Category: Desktop client
>   * Functionality: pmu
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: all-busy-check-all
>   * Description: Test the i915 pmu perf interface
> diff --git a/tests/intel/prime_busy.c b/tests/intel/prime_busy.c
> index a4edb0e0a..d0ebb5d55 100644
> --- a/tests/intel/prime_busy.c
> +++ b/tests/intel/prime_busy.c
> @@ -32,7 +32,7 @@
>   * Description: Basic check of polling for prime fences.
>   * Feature: prime
>   * Functionality: buffer management
> - * Run type: FULL
> + *
>   * Sub-category: Fences
>   * Test category: GEM_Legacy
>   *
> diff --git a/tests/intel/prime_mmap.c b/tests/intel/prime_mmap.c
> index aee90ca23..27a9e1c48 100644
> --- a/tests/intel/prime_mmap.c
> +++ b/tests/intel/prime_mmap.c
> @@ -55,7 +55,7 @@
>   * Category: Infrastructure
>   * Feature: prime
>   * Functionality: prime
> - * Run type: FULL
> + *
>   * Sub-category: Memory management
>   * Test category: GEM_Legacy
>   *
> diff --git a/tests/intel/prime_mmap_coherency.c b/tests/intel/prime_mmap_coherency.c
> index bca46d9e8..314d0dff3 100644
> --- a/tests/intel/prime_mmap_coherency.c
> +++ b/tests/intel/prime_mmap_coherency.c
> @@ -39,7 +39,7 @@
>   *   we need the sync ioctls.
>   * Feature: prime
>   * Functionality: prime
> - * Run type: FULL
> + *
>   * Sub-category: Memory management
>   * Test category: GEM_Legacy
>   *
> diff --git a/tests/intel/prime_mmap_kms.c b/tests/intel/prime_mmap_kms.c
> index 683665752..bbf0880b1 100644
> --- a/tests/intel/prime_mmap_kms.c
> +++ b/tests/intel/prime_mmap_kms.c
> @@ -42,7 +42,7 @@ IGT_TEST_DESCRIPTION(
>   * Category: Infrastructure
>   * Feature: prime
>   * Functionality: memory management
> - * Run type: FULL
> + *
>   * Sub-category: DRM
>   * Test category: GEM_Legacy
>   *
> diff --git a/tests/intel/prime_self_import.c b/tests/intel/prime_self_import.c
> index e1dcebfd8..ff8b0fa36 100644
> --- a/tests/intel/prime_self_import.c
> +++ b/tests/intel/prime_self_import.c
> @@ -53,7 +53,7 @@
>   * Functionality: buffer management
>   * Sub-category: Memory management
>   * Test category: GEM_Legacy
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: basic-llseek-bad
>   * Description: Check dmabuf llseek support with invalid values.
> @@ -75,11 +75,11 @@
>   *
>   * SUBTEST: export-vs-gem_close-race
>   * Description: Check race of gem close against prime export.
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: reimport-vs-gem_close-race
>   * Description: Check race of gem close against reimport.
> - * Run type: FULL
> + *
>   */
>  
>  IGT_TEST_DESCRIPTION("Check whether prime import/export works on the same"
> diff --git a/tests/intel/sysfs_defaults.c b/tests/intel/sysfs_defaults.c
> index a80f7126c..1c2afb2c0 100644
> --- a/tests/intel/sysfs_defaults.c
> +++ b/tests/intel/sysfs_defaults.c
> @@ -40,7 +40,7 @@
>   * Functionality: sysfs
>   * Sub-category: uapi
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: readonly
>   */
> diff --git a/tests/intel/sysfs_heartbeat_interval.c b/tests/intel/sysfs_heartbeat_interval.c
> index 8c6c448fa..b6cf7488c 100644
> --- a/tests/intel/sysfs_heartbeat_interval.c
> +++ b/tests/intel/sysfs_heartbeat_interval.c
> @@ -48,7 +48,7 @@
>   * Sub-category: SysMan
>   * Category: Desktop \ Server
>   * Functionality: sysfs heartbeat
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: idempotent
>   * Description: Test to check whether the heartbeat parameter reports the values set.
> diff --git a/tests/intel/sysfs_preempt_timeout.c b/tests/intel/sysfs_preempt_timeout.c
> index 0663c347a..05d1760ad 100644
> --- a/tests/intel/sysfs_preempt_timeout.c
> +++ b/tests/intel/sysfs_preempt_timeout.c
> @@ -47,7 +47,7 @@
>   * Sub-category: SysMan
>   * Category: Desktop \ Server
>   * Functionality: sysfs preempt timeout
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: idempotent
>   * Description: Test to check whether the preempt_timeout parameter reports the
> diff --git a/tests/intel/sysfs_timeslice_duration.c b/tests/intel/sysfs_timeslice_duration.c
> index e8dd2677e..4588673d8 100644
> --- a/tests/intel/sysfs_timeslice_duration.c
> +++ b/tests/intel/sysfs_timeslice_duration.c
> @@ -50,7 +50,7 @@
>   * Functionality: timeslise sysfs
>   * Sub-category: SysMan
>   * Category: Desktop \ Server
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: duration
>   * Description: Test to measure the timeslice duration by watching the
> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
> index a582703c1..eef2b401c 100644
> --- a/tests/intel/xe_drm_fdinfo.c
> +++ b/tests/intel/xe_drm_fdinfo.c
> @@ -19,7 +19,7 @@
>   * Category: Software building block
>   * Sub-category: driver
>   * Functionality: Per client memory statistics
> - * Run type: FULL
> + *
>   * Test category: SysMan
>   *
>   * SUBTEST: basic
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index a0045da0b..f5d836edb 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -488,7 +488,7 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
>   * @system:	system region
>   *
>   * Functionality: pm-d3
> - * Run type: FULL
> + *
>   */
>  static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
>  {
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> index 3fa9abf25..71a7b29f4 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -54,7 +54,7 @@ enum test_type {
>   * SUBTEST: idle-residency-on-exec
>   * Description: Validate idle residency measured when a background
>   *		load is only active for ~1% of the time
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: gt-c6-freeze
>   * Description: Validate idle residency measured over suspend(s2idle)
> diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
> index 3bdc1e5e2..cc586594b 100644
> --- a/tests/intel/xe_spin_batch.c
> +++ b/tests/intel/xe_spin_batch.c
> @@ -227,12 +227,12 @@ static void preempter(int fd, struct drm_xe_engine_class_instance *hwe)
>  /**
>   * SUBTEST: spin-fixed-duration
>   * Description: Basic test which validates the functionality of xe_spin with fixed duration.
> - * Run type: FULL
> + *
>   */
>  /**
>   * SUBTEST: spin-fixed-duration-with-preempter
>   * Description: Basic test which validates the functionality of xe_spin preemption which gets preempted with a short duration high-priority task.
> - * Run type: FULL
> + *
>   */
>  static void xe_spin_fixed_duration(int fd, int gt, int class, int flags)
>  {
> diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
> index f6f797d43..fd4858b60 100644
> --- a/tests/intel/xe_waitfence.c
> +++ b/tests/intel/xe_waitfence.c
> @@ -142,7 +142,7 @@ waitfence(int fd, enum waittype wt)
>   * Category: Software building block
>   * Sub-category: waitfence
>   * Functionality: waitfence
> - * Run type: FULL
> + *
>   * Test category: negative test
>   *
>   * SUBTEST: invalid-flag
> diff --git a/tests/prime_nv_api.c b/tests/prime_nv_api.c
> index a33e2202b..39dd3f4fd 100644
> --- a/tests/prime_nv_api.c
> +++ b/tests/prime_nv_api.c
> @@ -13,7 +13,7 @@
>   * Description: Basic api tests between intel and nouveau
>   * Sub-category: uapi
>   * Functionality: intel-nouveau
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: i915_nv_import_twice
>   * SUBTEST: i915_nv_import_twice_check_flink_name
> diff --git a/tests/prime_nv_pcopy.c b/tests/prime_nv_pcopy.c
> index ecaa9fb1b..c0272593b 100644
> --- a/tests/prime_nv_pcopy.c
> +++ b/tests/prime_nv_pcopy.c
> @@ -18,7 +18,7 @@
>   * Description: Basic set of prime tests between intel and nouveau
>   * Sub-category: intel-nouveau
>   * Functionality: buffer management
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: test1_macro
>   * SUBTEST: test1_micro
> diff --git a/tests/prime_nv_test.c b/tests/prime_nv_test.c
> index be9e56414..bc3f2e0c8 100644
> --- a/tests/prime_nv_test.c
> +++ b/tests/prime_nv_test.c
> @@ -18,7 +18,7 @@
>   * Description: Basic set of prime tests between intel and nouveau
>   * Sub-category: intel-nouveau
>   * Functionality: buffer management
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: i915_nv_sharing
>   * SUBTEST: nv_i915_sharing
> diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
> index e21bedc94..585aede21 100644
> --- a/tests/prime_vgem.c
> +++ b/tests/prime_vgem.c
> @@ -38,7 +38,7 @@
>   * Functionality: mock device
>   * Sub-category: DRM
>   * Test category: GEM_Legacy
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: basic-blt
>   * Description: Examine blitter access path.
> @@ -48,32 +48,32 @@
>   *
>   * SUBTEST: basic-fence-flip
>   * Description: Examine vgem bo front/back flip fencing.
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: basic-fence-mmap
>   * Description: Examine GTT access path fencing.
>   * Feature: gtt, prime
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: basic-fence-read
>   * Description: Examine read access path fencing.
>   * Feature: gtt, prime
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: basic-gtt
>   * Description: Examine access path through GTT.
>   * Feature: gtt, prime
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: basic-read
>   * Description: Examine read access path.
>   * Feature: gtt, prime
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: basic-write
>   * Description: Examine write access path.
>   * Feature: gtt, prime
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: busy
>   * Description: Examine busy check of polling for vgem fence.
> diff --git a/tests/sriov_basic.c b/tests/sriov_basic.c
> index b2b63c702..921a9e4a6 100644
> --- a/tests/sriov_basic.c
> +++ b/tests/sriov_basic.c
> @@ -22,7 +22,7 @@ IGT_TEST_DESCRIPTION("Basic tests for enabling SR-IOV Virtual Functions");
>   * SUBTEST: enable-vfs-autoprobe-off
>   * Description:
>   *   Verify VFs enabling without probing VF driver
> - * Run type: BAT
> + *
>   */
>  static void enable_vfs_autoprobe_off(int pf_fd, unsigned int num_vfs)
>  {
> @@ -39,7 +39,7 @@ static void enable_vfs_autoprobe_off(int pf_fd, unsigned int num_vfs)
>   * SUBTEST: enable-vfs-autoprobe-on
>   * Description:
>   *   Verify VFs enabling and auto-probing VF driver
> - * Run type: FULL
> + *
>   */
>  static void enable_vfs_autoprobe_on(int pf_fd, unsigned int num_vfs)
>  {
> @@ -65,7 +65,7 @@ static void enable_vfs_autoprobe_on(int pf_fd, unsigned int num_vfs)
>   * SUBTEST: enable-vfs-bind-unbind-each
>   * Description:
>   *   Verify VFs enabling with binding and unbinding the driver one be one to each of them
> - * Run type: BAT
> + *
>   */
>  static void enable_vfs_bind_unbind_each(int pf_fd, unsigned int num_vfs)
>  {
> @@ -94,7 +94,7 @@ static void enable_vfs_bind_unbind_each(int pf_fd, unsigned int num_vfs)
>   * SUBTEST: bind-unbind-vf
>   * Description:
>   *   Verify binding and unbinding the driver to specific VF
> - * Run type: BAT
> + *
>   */
>  static void bind_unbind_vf(int pf_fd, unsigned int vf_num)
>  {
> diff --git a/tests/sw_sync.c b/tests/sw_sync.c
> index 40ecec665..befb514b9 100644
> --- a/tests/sw_sync.c
> +++ b/tests/sw_sync.c
> @@ -44,7 +44,7 @@
>   * Description: Test SW Sync Framework
>   * Feature: synchronization
>   * Functionality: semaphore
> - * Run type: FULL
> + *
>   * Sub-category: Synchronization
>   * Test category: GEM_Legacy
>   *
> diff --git a/tests/syncobj_basic.c b/tests/syncobj_basic.c
> index 6c75fce96..abf5f4f3e 100644
> --- a/tests/syncobj_basic.c
> +++ b/tests/syncobj_basic.c
> @@ -32,7 +32,7 @@
>   * Description: Basic check for drm sync objects.
>   * Feature: synchronization
>   * Functionality: semaphore
> - * Run type: FULL
> + *
>   * Sub-category: Synchronization
>   * Test category: GEM_Legacy
>   *
> diff --git a/tests/syncobj_eventfd.c b/tests/syncobj_eventfd.c
> index 6ca89c87a..65d161626 100644
> --- a/tests/syncobj_eventfd.c
> +++ b/tests/syncobj_eventfd.c
> @@ -17,7 +17,7 @@
>   * Description: Tests for the drm sync object eventfd API
>   * Feature: synchronization
>   * Functionality: semaphore
> - * Run type: FULL
> + *
>   * Sub-category: DRM
>   * Test category: GEM_Legacy
>   */
> diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
> index 083091583..77e9530b3 100644
> --- a/tests/syncobj_timeline.c
> +++ b/tests/syncobj_timeline.c
> @@ -36,7 +36,7 @@
>   * Description: Tests for the drm timeline sync object API
>   * Feature: synchronization
>   * Functionality: semaphore
> - * Run type: FULL
> + *
>   * Sub-category: Synchronization
>   * Test category: GEM_Legacy
>   *
> diff --git a/tests/syncobj_wait.c b/tests/syncobj_wait.c
> index 687f2613e..3be231882 100644
> --- a/tests/syncobj_wait.c
> +++ b/tests/syncobj_wait.c
> @@ -36,7 +36,7 @@
>   * Description: Tests for the drm sync object wait API
>   * Feature: synchronization
>   * Functionality: semaphore
> - * Run type: FULL
> + *
>   * Sub-category: Synchronization
>   * Test category: GEM_Legacy
>   *
> diff --git a/tests/vgem_basic.c b/tests/vgem_basic.c
> index fe201908c..2ae10eb0f 100644
> --- a/tests/vgem_basic.c
> +++ b/tests/vgem_basic.c
> @@ -39,7 +39,7 @@
>   * Sub-category: Core
>   * Test category: GEM_Legacy
>   * Feature: vgem
> - * Run type: FULL
> + *
>   *
>   * SUBTEST: bad-fence
>   * Description: Make sure a non-existent fence cannot be signaled.
> @@ -58,51 +58,51 @@
>   *
>   * SUBTEST: create
>   * Description: Check the basic working of vgem_create ioctl.
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: debugfs
>   * Description: Check the basic access to debugfs and also try to read entries in the directory.
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: dmabuf-export
>   * Description: Check whether it can export/import the vgem handle using prime.
>   * Feature: prime, vgem
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: dmabuf-fence
>   * Description: Check the working of dma-buf fence interop.
>   * Feature: prime, vgem
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: dmabuf-fence-before
>   * Description: Attach a fence before exporting a vgem handle and check the working of fence.
>   * Feature: prime, vgem
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: dmabuf-mmap
>   * Description: Export the vgem handle along with RDWR capabilities using prime and check if it can be mmaped.
>   * Feature: prime, vgem
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: mmap
>   * Description: Create a vgem handle and check if it can be mmaped.
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: second-client
>   * Description: Check whether it can open multiple clients.
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: setversion
>   * Description: Check the working of SET_VERSION ioctl.
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: sysfs
>   * Description: Check the basic access to sysfs and also try to read entries in the directory.
> - * Run type: BAT
> + *
>   *
>   * SUBTEST: unload
>   * Description: Basic test for handling of module unload.
> - * Run type: BAT
> + *
>   */
>  
>  IGT_TEST_DESCRIPTION("Basic sanity check of Virtual GEM module (vGEM).");
> diff --git a/tests/vgem_slow.c b/tests/vgem_slow.c
> index cb9436628..a580a8dbc 100644
> --- a/tests/vgem_slow.c
> +++ b/tests/vgem_slow.c
> @@ -36,7 +36,7 @@
>   * Description: Extended sanity check of Virtual GEM module (vGEM).
>   * Feature: vgem
>   * Functionality: mock device
> - * Run type: FULL
> + *
>   * Sub-category: DRM
>   * Test category: GEM_Legacy
>   *
