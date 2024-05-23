Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78321C25B79
	for <igt-dev@archiver.kernel.org>; Thu, 23 May 2024 14:26:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B10F810E3D5;
	Thu, 23 May 2024 14:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XU0UdQkW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F8FC10E3D5
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2024 14:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716474396; x=1748010396;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MzqC9V23okBJwjTIzVFvk8QXIc84jMlxXFtBdeCMIFE=;
 b=XU0UdQkW1tM9cWioTMl1PcRGrA8i+KRaY3JiPG7hGdOg3AtSkO0n/es6
 2qKSebNkFW/MXEYbjIbXgXkhYSzVDveWNsQg42QRGVUsqEI0s0rdkOPEM
 C1xp4+tuFGexf+cNiWqQ+C0u9vCGtkpbZgisMxHyCVSmiljdTiIZ4yBB1
 w30JnyDqJTilgTWVmbnWkAWHkEcFCfDk78uuMYcrhMGKWERyGWMFdae+0
 zCT+3fm1JCGRjgtfewG/ir2xDJrfS/Kt6z5hSIZ7sGukDbDsoFTSUNOoJ
 BoMT+PtyQ2qLjU3TbwuiFeVc7WvB0ud8nNV+ByZ/u0oBYRUjjc7gJWRhB A==;
X-CSE-ConnectionGUID: AuvqcRfJTLS4EYNZpH3abA==
X-CSE-MsgGUID: xV66Sb6hTb2eeFJPFupXlQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12574008"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="12574008"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 07:26:35 -0700
X-CSE-ConnectionGUID: cxvNUBB1T4ueK+PMFCJjeQ==
X-CSE-MsgGUID: pwJjNnDVQXClUEN2WprS6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="38526542"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 07:26:33 -0700
Date: Thu, 23 May 2024 16:26:30 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org, Gandi Ramadevi <ramadevi.gandi@intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: Re: [PATCH i-g-t 1/2] tests: Unify Category for Core tests
Message-ID: <20240523142630.aaorzrm3llq7plkw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 igt-dev@lists.freedesktop.org,
 Gandi Ramadevi <ramadevi.gandi@intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
References: <20240522123322.779571-1-katarzyna.piecielska@intel.com>
 <20240522123322.779571-2-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240522123322.779571-2-katarzyna.piecielska@intel.com>
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

Hi Katarzyna,
On 2024-05-22 at 12:33:21 +0000, Katarzyna Piecielska wrote:
> All Display tests are using Category field to show that these are
> display tests. For Core we were having various values: Software building
> block, Desktop client, Infrastructure, Server, Selftest, Obsolete, etc.
> With Mega feature/Sub-category/Functionality properly set and aligned,
> there is no need to have so many values in 'Category' field.
> 
> Let's have 'Category=Core' for all Core tests.
> Adding change to xe_test_config.json and i915_test_config.json files to
> show correct Category value and remove mandatory field.

I checked for conflicts with:

mkdir tmp
cd tmp
cp ../scripts/doc-tests-cross-check.sh .
./doc-tests-cross-check.sh

Results (possible conflicts) are in e.* files
==============================================
 1 e.Category
 1 e.Sub-category
 2 total

'Core' is used also in Sub-category so it will conflict with
Category:

n.Sub-category:../tests/dmabuf_sync_file.c: * Sub-category: Core
n.Sub-category:../tests/intel/i915_pciid.c: * Sub-category: Core
n.Sub-category:../tests/intel/i915_selftest.c: * Sub-category: Core
n.Sub-category:../tests/prime_vgem.c: * Sub-category: Core
n.Sub-category:../tests/vgem_basic.c: * Sub-category: Core
n.Sub-category:../tests/vgem_slow.c: * Sub-category: Core


grep -n "Sub-category: Core" tests/*.c

../tests/dmabuf_sync_file.c:18: * Sub-category: Core
../tests/prime_vgem.c:38: * Sub-category: Core
../tests/vgem_basic.c:39: * Sub-category: Core
../tests/vgem_slow.c:38: * Sub-category: Core

grep -n "Sub-category: Core" tests/intel/*.c

../tests/intel/i915_pciid.c:36: * Sub-category: Core
../tests/intel/i915_selftest.c:313: * Sub-category: Core
../tests/intel/i915_selftest.c:321: * Sub-category: Core
../tests/intel/i915_selftest.c:360: * Sub-category: Core
../tests/intel/i915_selftest.c:534: * Sub-category: Core

Btw please add r-b from Mauro to both patches, fix conflict
and resend.

Regards,
Kamil

> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Gandi Ramadevi <ramadevi.gandi@intel.com>
> Cc: Aditya Chauhan <aditya.chauhan@intel.com>
> Cc: Girotra Himanshu <himanshu.girotra@intel.com>
> ---
>  tests/core_auth.c                            |   2 +-
>  tests/core_getclient.c                       |   2 +-
>  tests/core_getstats.c                        |   2 +-
>  tests/core_getversion.c                      |   2 +-
>  tests/core_hotunplug.c                       |   2 +-
>  tests/core_setmaster.c                       |   2 +-
>  tests/core_setmaster_vs_auth.c               |   2 +-
>  tests/device_reset.c                         |   4 +-
>  tests/dmabuf.c                               |   2 +-
>  tests/dmabuf_sync_file.c                     |   2 +-
>  tests/drm_mm.c                               |   2 +-
>  tests/drm_read.c                             |   2 +-
>  tests/dumb_buffer.c                          |   2 +-
>  tests/intel/api_intel_allocator.c            |   2 +-
>  tests/intel/api_intel_bb.c                   |   2 +-
>  tests/intel/debugfs_test.c                   |   2 +-
>  tests/intel/drm_fdinfo.c                     |   2 +-
>  tests/intel/gem_bad_reloc.c                  |   2 +-
>  tests/intel/gem_barrier_race.c               |   2 +-
>  tests/intel/gem_basic.c                      |   2 +-
>  tests/intel/gem_blits.c                      |   2 +-
>  tests/intel/gem_busy.c                       |   2 +-
>  tests/intel/gem_caching.c                    |   2 +-
>  tests/intel/gem_ccs.c                        |   2 +-
>  tests/intel/gem_close.c                      |   2 +-
>  tests/intel/gem_close_race.c                 |   2 +-
>  tests/intel/gem_compute.c                    |   2 +-
>  tests/intel/gem_create.c                     |   4 +-
>  tests/intel/gem_cs_tlb.c                     |   2 +-
>  tests/intel/gem_ctx_bad_destroy.c            |   2 +-
>  tests/intel/gem_ctx_create.c                 |   2 +-
>  tests/intel/gem_ctx_engines.c                |   2 +-
>  tests/intel/gem_ctx_exec.c                   |   2 +-
>  tests/intel/gem_ctx_freq.c                   |   2 +-
>  tests/intel/gem_ctx_isolation.c              |   2 +-
>  tests/intel/gem_ctx_param.c                  |   2 +-
>  tests/intel/gem_ctx_persistence.c            |   2 +-
>  tests/intel/gem_ctx_shared.c                 |   2 +-
>  tests/intel/gem_ctx_sseu.c                   |   2 +-
>  tests/intel/gem_ctx_switch.c                 |   2 +-
>  tests/intel/gem_eio.c                        |   2 +-
>  tests/intel/gem_evict_alignment.c            |   2 +-
>  tests/intel/gem_evict_everything.c           |   2 +-
>  tests/intel/gem_exec_alignment.c             |   2 +-
>  tests/intel/gem_exec_async.c                 |   2 +-
>  tests/intel/gem_exec_await.c                 |   2 +-
>  tests/intel/gem_exec_balancer.c              |   2 +-
>  tests/intel/gem_exec_basic.c                 |   2 +-
>  tests/intel/gem_exec_big.c                   |   2 +-
>  tests/intel/gem_exec_capture.c               |   2 +-
>  tests/intel/gem_exec_create.c                |   2 +-
>  tests/intel/gem_exec_endless.c               |   2 +-
>  tests/intel/gem_exec_fair.c                  |   2 +-
>  tests/intel/gem_exec_fence.c                 |   4 +-
>  tests/intel/gem_exec_flush.c                 |   2 +-
>  tests/intel/gem_exec_gttfill.c               |   2 +-
>  tests/intel/gem_exec_latency.c               |   2 +-
>  tests/intel/gem_exec_lut_handle.c            |   2 +-
>  tests/intel/gem_exec_nop.c                   |   2 +-
>  tests/intel/gem_exec_parallel.c              |   2 +-
>  tests/intel/gem_exec_params.c                |   2 +-
>  tests/intel/gem_exec_reloc.c                 |   2 +-
>  tests/intel/gem_exec_schedule.c              |   2 +-
>  tests/intel/gem_exec_store.c                 |   2 +-
>  tests/intel/gem_exec_suspend.c               |   2 +-
>  tests/intel/gem_exec_whisper.c               |   2 +-
>  tests/intel/gem_exercise_blt.c               |   2 +-
>  tests/intel/gem_fd_exhaustion.c              |   2 +-
>  tests/intel/gem_fence_thrash.c               |   2 +-
>  tests/intel/gem_fence_upload.c               |   2 +-
>  tests/intel/gem_fenced_exec_thrash.c         |   2 +-
>  tests/intel/gem_flink_basic.c                |   2 +-
>  tests/intel/gem_flink_race.c                 |   2 +-
>  tests/intel/gem_gpgpu_fill.c                 |   2 +-
>  tests/intel/gem_gtt_cpu_tlb.c                |   2 +-
>  tests/intel/gem_gtt_hog.c                    |   2 +-
>  tests/intel/gem_gtt_speed.c                  |   2 +-
>  tests/intel/gem_huc_copy.c                   |   2 +-
>  tests/intel/gem_linear_blits.c               |   2 +-
>  tests/intel/gem_lmem_evict.c                 |   2 +-
>  tests/intel/gem_lmem_swapping.c              |   2 +-
>  tests/intel/gem_lut_handle.c                 |   2 +-
>  tests/intel/gem_madvise.c                    |   2 +-
>  tests/intel/gem_media_fill.c                 |   2 +-
>  tests/intel/gem_media_vme.c                  |   2 +-
>  tests/intel/gem_mmap.c                       |   2 +-
>  tests/intel/gem_mmap_gtt.c                   |   2 +-
>  tests/intel/gem_mmap_offset.c                |   2 +-
>  tests/intel/gem_mmap_wc.c                    |   2 +-
>  tests/intel/gem_partial_pwrite_pread.c       |   2 +-
>  tests/intel/gem_pipe_control_store_loop.c    |   2 +-
>  tests/intel/gem_ppgtt.c                      |   2 +-
>  tests/intel/gem_pread.c                      |   2 +-
>  tests/intel/gem_pread_after_blit.c           |   2 +-
>  tests/intel/gem_pwrite.c                     |   2 +-
>  tests/intel/gem_pwrite_snooped.c             |   2 +-
>  tests/intel/gem_pxp.c                        |   2 +-
>  tests/intel/gem_read_read_speed.c            |   2 +-
>  tests/intel/gem_readwrite.c                  |   2 +-
>  tests/intel/gem_reg_read.c                   |   2 +-
>  tests/intel/gem_render_copy.c                |   2 +-
>  tests/intel/gem_render_copy_redux.c          |   2 +-
>  tests/intel/gem_render_linear_blits.c        |   2 +-
>  tests/intel/gem_render_tiled_blits.c         |   2 +-
>  tests/intel/gem_request_retire.c             |   2 +-
>  tests/intel/gem_reset_stats.c                |   2 +-
>  tests/intel/gem_ringfill.c                   |   2 +-
>  tests/intel/gem_set_tiling_vs_blt.c          |   2 +-
>  tests/intel/gem_set_tiling_vs_gtt.c          |   2 +-
>  tests/intel/gem_set_tiling_vs_pwrite.c       |   2 +-
>  tests/intel/gem_shrink.c                     |   2 +-
>  tests/intel/gem_softpin.c                    |   2 +-
>  tests/intel/gem_spin_batch.c                 |   2 +-
>  tests/intel/gem_streaming_writes.c           |   2 +-
>  tests/intel/gem_stress.c                     |   2 +-
>  tests/intel/gem_sync.c                       |   2 +-
>  tests/intel/gem_tiled_blits.c                |   2 +-
>  tests/intel/gem_tiled_fence_blits.c          |   2 +-
>  tests/intel/gem_tiled_partial_pwrite_pread.c |   2 +-
>  tests/intel/gem_tiled_pread_basic.c          |   2 +-
>  tests/intel/gem_tiled_pread_pwrite.c         |   2 +-
>  tests/intel/gem_tiled_swapping.c             |   2 +-
>  tests/intel/gem_tiled_wb.c                   |   2 +-
>  tests/intel/gem_tiled_wc.c                   |   2 +-
>  tests/intel/gem_tiling_max_stride.c          |   2 +-
>  tests/intel/gem_unfence_active_buffers.c     |   2 +-
>  tests/intel/gem_unref_active_buffers.c       |   2 +-
>  tests/intel/gem_userptr_blits.c              |   2 +-
>  tests/intel/gem_vm_create.c                  |   2 +-
>  tests/intel/gem_wait.c                       |   2 +-
>  tests/intel/gem_watchdog.c                   |   2 +-
>  tests/intel/gem_workarounds.c                |   2 +-
>  tests/intel/gen3_mixed_blits.c               |   2 +-
>  tests/intel/gen3_render_linear_blits.c       |   2 +-
>  tests/intel/gen3_render_mixed_blits.c        |   2 +-
>  tests/intel/gen3_render_tiledx_blits.c       |   2 +-
>  tests/intel/gen3_render_tiledy_blits.c       |   2 +-
>  tests/intel/gen7_exec_parse.c                |   2 +-
>  tests/intel/gen9_exec_parse.c                |   2 +-
>  tests/intel/i915_fb_tiling.c                 |   2 +-
>  tests/intel/i915_getparams_basic.c           |   2 +-
>  tests/intel/i915_hangman.c                   |   2 +-
>  tests/intel/i915_module_load.c               |   2 +-
>  tests/intel/i915_pciid.c                     |   2 +-
>  tests/intel/i915_pm_freq_api.c               |   2 +-
>  tests/intel/i915_pm_freq_mult.c              |   2 +-
>  tests/intel/i915_pm_rc6_residency.c          |   2 +-
>  tests/intel/i915_pm_rpm.c                    |   2 +-
>  tests/intel/i915_pm_rps.c                    |   2 +-
>  tests/intel/i915_pm_sseu.c                   |   2 +-
>  tests/intel/i915_power.c                     |   2 +-
>  tests/intel/i915_query.c                     |   2 +-
>  tests/intel/i915_selftest.c                  | 158 +++++++++----------
>  tests/intel/i915_suspend.c                   |   2 +-
>  tests/intel/i915_test_config.json            |   3 +-
>  tests/intel/intel_hwmon.c                    |   2 +-
>  tests/intel/perf.c                           |   2 +-
>  tests/intel/perf_pmu.c                       |   2 +-
>  tests/intel/prime_busy.c                     |   2 +-
>  tests/intel/prime_mmap.c                     |   2 +-
>  tests/intel/prime_mmap_coherency.c           |   2 +-
>  tests/intel/prime_mmap_kms.c                 |   2 +-
>  tests/intel/prime_self_import.c              |   2 +-
>  tests/intel/sysfs_defaults.c                 |   2 +-
>  tests/intel/sysfs_heartbeat_interval.c       |   2 +-
>  tests/intel/sysfs_preempt_timeout.c          |   2 +-
>  tests/intel/sysfs_timeslice_duration.c       |   2 +-
>  tests/intel/xe_ccs.c                         |   2 +-
>  tests/intel/xe_compute.c                     |   2 +-
>  tests/intel/xe_compute_preempt.c             |   2 +-
>  tests/intel/xe_copy_basic.c                  |   2 +-
>  tests/intel/xe_create.c                      |   2 +-
>  tests/intel/xe_debugfs.c                     |   2 +-
>  tests/intel/xe_dma_buf_sync.c                |   2 +-
>  tests/intel/xe_drm_fdinfo.c                  |   2 +-
>  tests/intel/xe_evict.c                       |   2 +-
>  tests/intel/xe_evict_ccs.c                   |   2 +-
>  tests/intel/xe_exec_atomic.c                 |   2 +-
>  tests/intel/xe_exec_balancer.c               |   2 +-
>  tests/intel/xe_exec_basic.c                  |   2 +-
>  tests/intel/xe_exec_compute_mode.c           |   2 +-
>  tests/intel/xe_exec_fault_mode.c             |   2 +-
>  tests/intel/xe_exec_queue_property.c         |   2 +-
>  tests/intel/xe_exec_reset.c                  |   2 +-
>  tests/intel/xe_exec_store.c                  |   2 +-
>  tests/intel/xe_exec_threads.c                |   2 +-
>  tests/intel/xe_exercise_blt.c                |   2 +-
>  tests/intel/xe_gpgpu_fill.c                  |   2 +-
>  tests/intel/xe_gt_freq.c                     |   2 +-
>  tests/intel/xe_huc_copy.c                    |   2 +-
>  tests/intel/xe_intel_bb.c                    |   2 +-
>  tests/intel/xe_live_ktest.c                  |   2 +-
>  tests/intel/xe_media_fill.c                  |   2 +-
>  tests/intel/xe_mmap.c                        |   2 +-
>  tests/intel/xe_module_load.c                 |   2 +-
>  tests/intel/xe_noexec_ping_pong.c            |   2 +-
>  tests/intel/xe_pat.c                         |   2 +-
>  tests/intel/xe_peer2peer.c                   |   2 +-
>  tests/intel/xe_pm.c                          |   2 +-
>  tests/intel/xe_pm_residency.c                |   2 +-
>  tests/intel/xe_prime_self_import.c           |   2 +-
>  tests/intel/xe_query.c                       |  24 +--
>  tests/intel/xe_render_copy.c                 |   2 +-
>  tests/intel/xe_spin_batch.c                  |   2 +-
>  tests/intel/xe_sysfs_defaults.c              |   2 +-
>  tests/intel/xe_sysfs_scheduler.c             |   2 +-
>  tests/intel/xe_test_config.json              |   3 +-
>  tests/intel/xe_vm.c                          |   2 +-
>  tests/intel/xe_waitfence.c                   |   4 +-
>  tests/intel/xe_wedged.c                      |   2 +-
>  tests/prime_vgem.c                           |   2 +-
>  tests/sriov_basic.c                          |   2 +-
>  tests/sw_sync.c                              |   2 +-
>  tests/syncobj_basic.c                        |   2 +-
>  tests/syncobj_eventfd.c                      |   2 +-
>  tests/syncobj_timeline.c                     |   2 +-
>  tests/syncobj_wait.c                         |   2 +-
>  tests/vgem_basic.c                           |   2 +-
>  tests/vgem_slow.c                            |   2 +-
>  219 files changed, 312 insertions(+), 314 deletions(-)
> 
> diff --git a/tests/core_auth.c b/tests/core_auth.c
> index 9831c3b17..3c00d7925 100644
> --- a/tests/core_auth.c
> +++ b/tests/core_auth.c
> @@ -45,7 +45,7 @@
>  /**
>   * TEST: core auth
>   * Description: Call drmGetMagic() and drmAuthMagic() and see if it behaves.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: DRM
>   * Functionality: permission management for clients
> diff --git a/tests/core_getclient.c b/tests/core_getclient.c
> index 8735bcc94..21711cc55 100644
> --- a/tests/core_getclient.c
> +++ b/tests/core_getclient.c
> @@ -34,7 +34,7 @@
>  /**
>   * TEST: core getclient
>   * Description: Tests the DRM_IOCTL_GET_CLIENT ioctl.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: DRM
>   * Functionality: permission management for clients
> diff --git a/tests/core_getstats.c b/tests/core_getstats.c
> index a8eaa9bf8..0b9138aed 100644
> --- a/tests/core_getstats.c
> +++ b/tests/core_getstats.c
> @@ -35,7 +35,7 @@
>  /**
>   * TEST: core getstats
>   * Description: Tests the DRM_IOCTL_GET_STATS ioctl.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: uapi
>   * Functionality: DRM memory management
> diff --git a/tests/core_getversion.c b/tests/core_getversion.c
> index 8198f5f7f..158133da7 100644
> --- a/tests/core_getversion.c
> +++ b/tests/core_getversion.c
> @@ -31,7 +31,7 @@
>  /**
>   * TEST: core getversion
>   * Description: Tests the DRM_IOCTL_GET_VERSION ioctl and libdrm's drmGetVersion() interface to it.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: DRM
>   * Functionality: permission management for clients
> diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
> index afd7c3faa..db7a5c5e8 100644
> --- a/tests/core_hotunplug.c
> +++ b/tests/core_hotunplug.c
> @@ -42,7 +42,7 @@
>  /**
>   * TEST: core hotunplug
>   * Description: Examine behavior of a driver on device hot unplug
> - * Category: Software building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: driver
>   * Functionality: device hotplug
> diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
> index 21c62036e..9c2083f66 100644
> --- a/tests/core_setmaster.c
> +++ b/tests/core_setmaster.c
> @@ -41,7 +41,7 @@
>  /**
>   * TEST: core setmaster
>   * Description: Check that Drop/SetMaster behaves correctly wrt root/user access
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: DRM
>   * Functionality: permission management for clients
> diff --git a/tests/core_setmaster_vs_auth.c b/tests/core_setmaster_vs_auth.c
> index 2eb613034..b48e51f51 100644
> --- a/tests/core_setmaster_vs_auth.c
> +++ b/tests/core_setmaster_vs_auth.c
> @@ -43,7 +43,7 @@
>  /**
>   * TEST: core setmaster vs auth
>   * Description: Check that drop/setMaster correctly transfer master state
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: DRM
>   * Functionality: permission management for clients
> diff --git a/tests/device_reset.c b/tests/device_reset.c
> index 84d42fa3a..a669e1224 100644
> --- a/tests/device_reset.c
> +++ b/tests/device_reset.c
> @@ -17,7 +17,7 @@
>  /**
>   * TEST: device reset
>   * Description: Examine behavior of a driver on device sysfs reset
> - * Category: Hardware building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Reset tests
>   * Functionality: sysfs reset
> @@ -37,7 +37,7 @@
>   * Description:
>   *   Unbinds driver from device, initiates reset then rebinds driver to device
>   *   validating device resets
> - * Category: Infrastructure
> + * Category: Core
>   * Feature: reset, sriov-reset
>   */
>  
> diff --git a/tests/dmabuf.c b/tests/dmabuf.c
> index 7d4e6e9aa..8568bdfb3 100644
> --- a/tests/dmabuf.c
> +++ b/tests/dmabuf.c
> @@ -26,7 +26,7 @@
>  /**
>   * TEST: dmabuf
>   * Description: Kernel selftests for the dmabuf API
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Functionality: drm_mm
>   * Sub-category: Memory management tests
> diff --git a/tests/dmabuf_sync_file.c b/tests/dmabuf_sync_file.c
> index 402816afc..ba33f6a9d 100644
> --- a/tests/dmabuf_sync_file.c
> +++ b/tests/dmabuf_sync_file.c
> @@ -12,7 +12,7 @@ IGT_TEST_DESCRIPTION("Tests for sync_file support in dma-buf");
>  
>  /**
>   * TEST: dmabuf_sync_file
> - * Category: Infrastructure
> + * Category: Core
>   * Description: Tests for sync_file support in dma-buf
>   * Functionality: dmabuf test
>   * Sub-category: Core
> diff --git a/tests/drm_mm.c b/tests/drm_mm.c
> index 41b363cf0..e7b4c651f 100644
> --- a/tests/drm_mm.c
> +++ b/tests/drm_mm.c
> @@ -26,7 +26,7 @@
>  /**
>   * TEST: drm mm
>   * Description: Basic sanity check of DRM's range manager (struct drm_mm)
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: drm_mm
> diff --git a/tests/drm_read.c b/tests/drm_read.c
> index 144c2140f..a7f0d8702 100644
> --- a/tests/drm_read.c
> +++ b/tests/drm_read.c
> @@ -53,7 +53,7 @@ IGT_TEST_DESCRIPTION("Call read(drm) and see if it behaves.");
>  /**
>   * TEST: drm read
>   * Description: boundary testing of read(drm_fd)
> - * Category: Infrastructure
> + * Category: Core
>   * Functionality: drm_mm
>   * Sub-category: uapi
>   *
> diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
> index f27e113d4..1d4bf296c 100644
> --- a/tests/dumb_buffer.c
> +++ b/tests/dumb_buffer.c
> @@ -52,7 +52,7 @@
>  /**
>   * TEST: dumb buffer
>   * Description: This is a test for the generic dumb buffer interface.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: uapi
>   * Functionality: ioctl
> diff --git a/tests/intel/api_intel_allocator.c b/tests/intel/api_intel_allocator.c
> index 95b85baff..9218be3b9 100644
> --- a/tests/intel/api_intel_allocator.c
> +++ b/tests/intel/api_intel_allocator.c
> @@ -16,7 +16,7 @@
>  /**
>   * TEST: api intel allocator
>   * Description: checking the virtual address ranges
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: IGT Lib
>   * Functionality: virtual address
> diff --git a/tests/intel/api_intel_bb.c b/tests/intel/api_intel_bb.c
> index e53298695..4158fa06c 100644
> --- a/tests/intel/api_intel_bb.c
> +++ b/tests/intel/api_intel_bb.c
> @@ -44,7 +44,7 @@
>  /**
>   * TEST: api intel bb
>   * Description: checking dummy buffer creation & submission
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: IGT Lib
>   * Functionality: dummy buffer creation & submission
> diff --git a/tests/intel/debugfs_test.c b/tests/intel/debugfs_test.c
> index f3eb43d68..f2b6fb334 100644
> --- a/tests/intel/debugfs_test.c
> +++ b/tests/intel/debugfs_test.c
> @@ -32,7 +32,7 @@
>  /**
>   * TEST: debugfs test
>   * Description: Read entries from debugfs, hwmon and sysfs paths.
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: uapi
>   * Functionality: debugfs
> diff --git a/tests/intel/drm_fdinfo.c b/tests/intel/drm_fdinfo.c
> index f9fd5574f..a790f9255 100644
> --- a/tests/intel/drm_fdinfo.c
> +++ b/tests/intel/drm_fdinfo.c
> @@ -36,7 +36,7 @@
>  /**
>   * TEST: drm fdinfo
>   * Description: Test the i915 drm fdinfo data
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: driver
>   * Functionality: Per client memory statistics
> diff --git a/tests/intel/gem_bad_reloc.c b/tests/intel/gem_bad_reloc.c
> index 319c65583..1cdb988d9 100644
> --- a/tests/intel/gem_bad_reloc.c
> +++ b/tests/intel/gem_bad_reloc.c
> @@ -45,7 +45,7 @@
>   * TEST: gem bad reloc
>   * Description: Simulates SNA behaviour using negative self-relocations for
>   *		STATE_BASE_ADDRESS command packets.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: relocations
> diff --git a/tests/intel/gem_barrier_race.c b/tests/intel/gem_barrier_race.c
> index c05a2f3de..ac60f6659 100644
> --- a/tests/intel/gem_barrier_race.c
> +++ b/tests/intel/gem_barrier_race.c
> @@ -21,7 +21,7 @@
>   * TEST: gem barrier race
>   * Description: Exercise engine barriers and their interaction with other subsystems
>   * Feature: core
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: barrier
> diff --git a/tests/intel/gem_basic.c b/tests/intel/gem_basic.c
> index c1ff3478a..e4e49415d 100644
> --- a/tests/intel/gem_basic.c
> +++ b/tests/intel/gem_basic.c
> @@ -44,7 +44,7 @@
>  /**
>   * TEST: gem basic
>   * Description: Tests basic gem_create and gem_close IOCTLs
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: uapi
>   * Functionality: create/close IOCTLs
> diff --git a/tests/intel/gem_blits.c b/tests/intel/gem_blits.c
> index 175c7f871..5ca81fbfe 100644
> --- a/tests/intel/gem_blits.c
> +++ b/tests/intel/gem_blits.c
> @@ -30,7 +30,7 @@
>  #include "intel_blt.h"
>  /**
>   * TEST: gem blits
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: command streamer
> diff --git a/tests/intel/gem_busy.c b/tests/intel/gem_busy.c
> index b0a35d1c0..02eaeb864 100644
> --- a/tests/intel/gem_busy.c
> +++ b/tests/intel/gem_busy.c
> @@ -33,7 +33,7 @@
>  /**
>   * TEST: gem busy
>   * Description: Basic check of busy-ioctl ABI.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: uapi
>   * Functionality: busy IOCTL
> diff --git a/tests/intel/gem_caching.c b/tests/intel/gem_caching.c
> index 111e32625..11ce9c796 100644
> --- a/tests/intel/gem_caching.c
> +++ b/tests/intel/gem_caching.c
> @@ -43,7 +43,7 @@
>  /**
>   * TEST: gem caching
>   * Description: Test snoop consistency when touching partial cachelines.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: coherency
> diff --git a/tests/intel/gem_ccs.c b/tests/intel/gem_ccs.c
> index 9b523dfec..6ced67d7a 100644
> --- a/tests/intel/gem_ccs.c
> +++ b/tests/intel/gem_ccs.c
> @@ -19,7 +19,7 @@
>  /**
>   * TEST: gem ccs
>   * Description: Exercise gen12 blitter with and without flatccs compression
> - * Category: Desktop \ Server
> + * Category: Core
>   * Mega feature: Compression
>   * Sub-category: Flat-ccs tests
>   * Functionality: block-copy
> diff --git a/tests/intel/gem_close.c b/tests/intel/gem_close.c
> index 4cdea4afd..3971cc75e 100644
> --- a/tests/intel/gem_close.c
> +++ b/tests/intel/gem_close.c
> @@ -27,7 +27,7 @@
>  #include "igt_types.h"
>  /**
>   * TEST: gem close
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: driver
>   * Functionality: driver handler
> diff --git a/tests/intel/gem_close_race.c b/tests/intel/gem_close_race.c
> index b89fd016d..9edcf13eb 100644
> --- a/tests/intel/gem_close_race.c
> +++ b/tests/intel/gem_close_race.c
> @@ -51,7 +51,7 @@
>  /**
>   * TEST: gem close race
>   * Description: Test try to race gem_close against workload submission.
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: buffer management
> diff --git a/tests/intel/gem_compute.c b/tests/intel/gem_compute.c
> index bc640fa11..97c701bce 100644
> --- a/tests/intel/gem_compute.c
> +++ b/tests/intel/gem_compute.c
> @@ -5,7 +5,7 @@
>  
>  /**
>   * TEST: Check compute-related functionality
> - * Category: Hardware building block
> + * Category: Core
>   * Mega feature: Compute
>   * Sub-category: Compute tests
>   * Test category: functionality test
> diff --git a/tests/intel/gem_create.c b/tests/intel/gem_create.c
> index 0e017fb9d..26cd6e32e 100644
> --- a/tests/intel/gem_create.c
> +++ b/tests/intel/gem_create.c
> @@ -66,7 +66,7 @@
>   * TEST: gem create
>   * Description: Ensure that basic gem_create and gem_create_ext works and that
>   *		invalid input combinations are rejected.
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: uapi
>   * Functionality: gem_create IOCTL
> @@ -88,7 +88,7 @@
>   *		I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS
>   *
>   * SUBTEST: create-ext-placement-all
> - * Category: Infrastructure
> + * Category: Core
>   * Description: Create objects in every memory region using create_ext.
>   *
>   * SUBTEST: create-ext-placement-each
> diff --git a/tests/intel/gem_cs_tlb.c b/tests/intel/gem_cs_tlb.c
> index 065d6b330..a72bbe847 100644
> --- a/tests/intel/gem_cs_tlb.c
> +++ b/tests/intel/gem_cs_tlb.c
> @@ -55,7 +55,7 @@
>  /**
>   * TEST: gem cs tlb
>   * Description: Check whether we correctly invalidate the cs tlb.
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: tlb
> diff --git a/tests/intel/gem_ctx_bad_destroy.c b/tests/intel/gem_ctx_bad_destroy.c
> index 85a45a488..1467f2943 100644
> --- a/tests/intel/gem_ctx_bad_destroy.c
> +++ b/tests/intel/gem_ctx_bad_destroy.c
> @@ -37,7 +37,7 @@
>  /**
>   * TEST: gem ctx bad destroy
>   * Description: Negative test cases for destroy contexts.
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: context
> diff --git a/tests/intel/gem_ctx_create.c b/tests/intel/gem_ctx_create.c
> index 69f2783df..6afb10a7b 100644
> --- a/tests/intel/gem_ctx_create.c
> +++ b/tests/intel/gem_ctx_create.c
> @@ -38,7 +38,7 @@
>  /**
>   * TEST: gem ctx create
>   * Description: Test the context create ioctls
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: context
> diff --git a/tests/intel/gem_ctx_engines.c b/tests/intel/gem_ctx_engines.c
> index 6cf799912..94a47ecc3 100644
> --- a/tests/intel/gem_ctx_engines.c
> +++ b/tests/intel/gem_ctx_engines.c
> @@ -45,7 +45,7 @@
>  #include "sw_sync.h"
>  /**
>   * TEST: gem ctx engines
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: context
> diff --git a/tests/intel/gem_ctx_exec.c b/tests/intel/gem_ctx_exec.c
> index 930724227..d6aa8ba0a 100644
> --- a/tests/intel/gem_ctx_exec.c
> +++ b/tests/intel/gem_ctx_exec.c
> @@ -50,7 +50,7 @@
>  /**
>   * TEST: gem ctx exec
>   * Description: Test context batch buffer execution.
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: context
> diff --git a/tests/intel/gem_ctx_freq.c b/tests/intel/gem_ctx_freq.c
> index c348fe338..29fdf89cb 100644
> --- a/tests/intel/gem_ctx_freq.c
> +++ b/tests/intel/gem_ctx_freq.c
> @@ -39,7 +39,7 @@
>  #include "sw_sync.h"
>  /**
>   * TEST: gem ctx freq
> - * Category: Server
> + * Category: Core
>   * Mega feature: Power management
>   * Sub-category: Power management tests
>   * Functionality: frequency management
> diff --git a/tests/intel/gem_ctx_isolation.c b/tests/intel/gem_ctx_isolation.c
> index cd4aaee9c..f406462d8 100644
> --- a/tests/intel/gem_ctx_isolation.c
> +++ b/tests/intel/gem_ctx_isolation.c
> @@ -28,7 +28,7 @@
>  #include "igt_types.h"
>  /**
>   * TEST: gem ctx isolation
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Security
>   * Functionality: priv/non-priv registers
> diff --git a/tests/intel/gem_ctx_param.c b/tests/intel/gem_ctx_param.c
> index 96998dc1e..2e39a519b 100644
> --- a/tests/intel/gem_ctx_param.c
> +++ b/tests/intel/gem_ctx_param.c
> @@ -33,7 +33,7 @@
>  /**
>   * TEST: gem ctx param
>   * Description: Basic test for context set/get param input validation.
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: uapi
>   * Functionality: get/set IOCTLs
> diff --git a/tests/intel/gem_ctx_persistence.c b/tests/intel/gem_ctx_persistence.c
> index 6c220fba5..90c1e0112 100644
> --- a/tests/intel/gem_ctx_persistence.c
> +++ b/tests/intel/gem_ctx_persistence.c
> @@ -47,7 +47,7 @@
>  #include "sw_sync.h"
>  /**
>   * TEST: gem ctx persistence
> - * Category: Server
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: context
> diff --git a/tests/intel/gem_ctx_shared.c b/tests/intel/gem_ctx_shared.c
> index bbb9f19c8..de06f2d54 100644
> --- a/tests/intel/gem_ctx_shared.c
> +++ b/tests/intel/gem_ctx_shared.c
> @@ -50,7 +50,7 @@
>  /**
>   * TEST: gem ctx shared
>   * Description: Test shared contexts.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: shared contex
> diff --git a/tests/intel/gem_ctx_sseu.c b/tests/intel/gem_ctx_sseu.c
> index 88a0d9eca..7d445ba00 100644
> --- a/tests/intel/gem_ctx_sseu.c
> +++ b/tests/intel/gem_ctx_sseu.c
> @@ -47,7 +47,7 @@
>  /**
>   * TEST: gem ctx sseu
>   * Description: Test context render powergating programming.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: uapi
>   * Functionality: sseu api
> diff --git a/tests/intel/gem_ctx_switch.c b/tests/intel/gem_ctx_switch.c
> index d87fcb46f..7a3c72e49 100644
> --- a/tests/intel/gem_ctx_switch.c
> +++ b/tests/intel/gem_ctx_switch.c
> @@ -48,7 +48,7 @@
>  /**
>   * TEST: gem ctx switch
>   * Feature: context feature
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD Submission
>   * Functionality: context switching
> diff --git a/tests/intel/gem_eio.c b/tests/intel/gem_eio.c
> index 39100086d..dc6178d63 100644
> --- a/tests/intel/gem_eio.c
> +++ b/tests/intel/gem_eio.c
> @@ -57,7 +57,7 @@
>   * TEST: gem eio
>   * Description: Test that specific ioctls report a wedged GPU (EIO).
>   * Mega feature: General Core features
> - * Category: Infrastructure
> + * Category: Core
>   * Sub-category: uapi
>   * Functionality: reset
>   * Feature: reset
> diff --git a/tests/intel/gem_evict_alignment.c b/tests/intel/gem_evict_alignment.c
> index d3f02c8ac..57aa5df04 100644
> --- a/tests/intel/gem_evict_alignment.c
> +++ b/tests/intel/gem_evict_alignment.c
> @@ -50,7 +50,7 @@
>  /**
>   * TEST: gem evict alignment
>   * Description: Run a couple of big batches to force the unbind on misalignment code.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: misalignment
> diff --git a/tests/intel/gem_evict_everything.c b/tests/intel/gem_evict_everything.c
> index 5d8f30bd6..53e359de7 100644
> --- a/tests/intel/gem_evict_everything.c
> +++ b/tests/intel/gem_evict_everything.c
> @@ -51,7 +51,7 @@
>  /**
>   * TEST: gem evict everything
>   * Description: Run a couple of big batches to force the eviction code.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: eviction
> diff --git a/tests/intel/gem_exec_alignment.c b/tests/intel/gem_exec_alignment.c
> index 45237e4f4..7b51b7af0 100644
> --- a/tests/intel/gem_exec_alignment.c
> +++ b/tests/intel/gem_exec_alignment.c
> @@ -48,7 +48,7 @@
>  /**
>   * TEST: gem exec alignment
>   * Description: Exercises the basic execbuffer using object alignments
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: execbuf
> diff --git a/tests/intel/gem_exec_async.c b/tests/intel/gem_exec_async.c
> index f61517e76..573157add 100644
> --- a/tests/intel/gem_exec_async.c
> +++ b/tests/intel/gem_exec_async.c
> @@ -26,7 +26,7 @@
>  #include "igt.h"
>  /**
>   * TEST: gem exec async
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: concurent writes
> diff --git a/tests/intel/gem_exec_await.c b/tests/intel/gem_exec_await.c
> index ad089b35a..5dc43a0c4 100644
> --- a/tests/intel/gem_exec_await.c
> +++ b/tests/intel/gem_exec_await.c
> @@ -45,7 +45,7 @@
>  
>  /**
>   * TEST: gem exec await
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: requests
> diff --git a/tests/intel/gem_exec_balancer.c b/tests/intel/gem_exec_balancer.c
> index 536f72d20..20e31baf0 100644
> --- a/tests/intel/gem_exec_balancer.c
> +++ b/tests/intel/gem_exec_balancer.c
> @@ -41,7 +41,7 @@
>  /**
>   * TEST: gem exec balancer
>   * Description: Exercise in-kernel load-balancing
> - * Category: Desktop \ Server
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: load balancing
> diff --git a/tests/intel/gem_exec_basic.c b/tests/intel/gem_exec_basic.c
> index 515c117cf..ca56bf4b5 100644
> --- a/tests/intel/gem_exec_basic.c
> +++ b/tests/intel/gem_exec_basic.c
> @@ -28,7 +28,7 @@
>  /**
>   * TEST: gem exec basic
>   * Description: Basic sanity check of execbuf-ioctl rings.
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: execbuf
> diff --git a/tests/intel/gem_exec_big.c b/tests/intel/gem_exec_big.c
> index ffdfb650c..7bd91c2a0 100644
> --- a/tests/intel/gem_exec_big.c
> +++ b/tests/intel/gem_exec_big.c
> @@ -52,7 +52,7 @@
>   * TEST: gem exec big
>   * Description: Run a large nop batch to stress test the error capture code.
>   * Feature: cmd_submission
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: large nop batch
> diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/gem_exec_capture.c
> index d671c7278..1f50d9c44 100644
> --- a/tests/intel/gem_exec_capture.c
> +++ b/tests/intel/gem_exec_capture.c
> @@ -35,7 +35,7 @@
>  /**
>   * TEST: gem exec capture
>   * Description: Check that we capture the user specified objects on a hang
> - * Category: Server
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Debugging
>   * Functionality: offline debugging
> diff --git a/tests/intel/gem_exec_create.c b/tests/intel/gem_exec_create.c
> index 0d4fa97ef..fb096a181 100644
> --- a/tests/intel/gem_exec_create.c
> +++ b/tests/intel/gem_exec_create.c
> @@ -48,7 +48,7 @@
>  #include "i915/intel_memory_region.h"
>  /**
>   * TEST: gem exec create
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: buffer management
> diff --git a/tests/intel/gem_exec_endless.c b/tests/intel/gem_exec_endless.c
> index 99c5403ec..6b2c56382 100644
> --- a/tests/intel/gem_exec_endless.c
> +++ b/tests/intel/gem_exec_endless.c
> @@ -32,7 +32,7 @@
>  #include "sw_sync.h"
>  /**
>   * TEST: gem exec endless
> - * Category: Server
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: compute test
> diff --git a/tests/intel/gem_exec_fair.c b/tests/intel/gem_exec_fair.c
> index 11d7648ed..2f7ef3800 100644
> --- a/tests/intel/gem_exec_fair.c
> +++ b/tests/intel/gem_exec_fair.c
> @@ -29,7 +29,7 @@
>  /**
>   * TEST: gem exec fair
>   * Description: Check that GPU time and execution order is fairly distributed across clients
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: multi-client systems
> diff --git a/tests/intel/gem_exec_fence.c b/tests/intel/gem_exec_fence.c
> index 6ae30ca59..a313c31f2 100644
> --- a/tests/intel/gem_exec_fence.c
> +++ b/tests/intel/gem_exec_fence.c
> @@ -38,7 +38,7 @@
>  /**
>   * TEST: gem exec fence
>   * Description: Check that execbuf waits for explicit fences
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Synchronization
>   * Functionality: semaphore
> @@ -89,7 +89,7 @@
>   * Description: Check blocking bonded fences on each engine.
>   *
>   * SUBTEST: expired-history
> - * Category: Infrastructure
> + * Category: Core
>   * Description: Verifies long history of fences are expired.
>   *
>   * SUBTEST: invalid-fence-array
> diff --git a/tests/intel/gem_exec_flush.c b/tests/intel/gem_exec_flush.c
> index 1151628bd..795be929c 100644
> --- a/tests/intel/gem_exec_flush.c
> +++ b/tests/intel/gem_exec_flush.c
> @@ -33,7 +33,7 @@
>   * Description: Basic check of flushing after batches
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
> - * Category: Desktop client
> + * Category: Core
>   * Functionality: execbuf
>   *
>   * SUBTEST: basic-batch-kernel-default-cmd
> diff --git a/tests/intel/gem_exec_gttfill.c b/tests/intel/gem_exec_gttfill.c
> index 65146bca6..096681740 100644
> --- a/tests/intel/gem_exec_gttfill.c
> +++ b/tests/intel/gem_exec_gttfill.c
> @@ -29,7 +29,7 @@
>  /**
>   * TEST: gem exec gttfill
>   * Description: Fill the GTT with batches.
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: execbuf
> diff --git a/tests/intel/gem_exec_latency.c b/tests/intel/gem_exec_latency.c
> index 0ada25824..3492f8503 100644
> --- a/tests/intel/gem_exec_latency.c
> +++ b/tests/intel/gem_exec_latency.c
> @@ -50,7 +50,7 @@
>  #include "i915/gem_create.h"
>  /**
>   * TEST: gem exec latency
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: execbuf
> diff --git a/tests/intel/gem_exec_lut_handle.c b/tests/intel/gem_exec_lut_handle.c
> index 2aba9ffed..432094bc2 100644
> --- a/tests/intel/gem_exec_lut_handle.c
> +++ b/tests/intel/gem_exec_lut_handle.c
> @@ -43,7 +43,7 @@
>  /**
>   * TEST: gem exec lut handle
>   * Description: Exercises the basic execbuffer using the handle LUT interface.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: execbuf
> diff --git a/tests/intel/gem_exec_nop.c b/tests/intel/gem_exec_nop.c
> index 7219a0fd6..fb37cb511 100644
> --- a/tests/intel/gem_exec_nop.c
> +++ b/tests/intel/gem_exec_nop.c
> @@ -50,7 +50,7 @@
>  
>  /**
>   * TEST: gem exec nop
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: execbuf
> diff --git a/tests/intel/gem_exec_parallel.c b/tests/intel/gem_exec_parallel.c
> index 8d7a5a185..90c46bf0c 100644
> --- a/tests/intel/gem_exec_parallel.c
> +++ b/tests/intel/gem_exec_parallel.c
> @@ -36,7 +36,7 @@
>  /**
>   * TEST: gem exec parallel
>   * Description: Exercise filling buffers by many clients working in parallel.
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: parallel clients
> diff --git a/tests/intel/gem_exec_params.c b/tests/intel/gem_exec_params.c
> index 18651c9fb..d0260d5f1 100644
> --- a/tests/intel/gem_exec_params.c
> +++ b/tests/intel/gem_exec_params.c
> @@ -46,7 +46,7 @@
>  #include "sw_sync.h"
>  /**
>   * TEST: gem exec params
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: execbuf
> diff --git a/tests/intel/gem_exec_reloc.c b/tests/intel/gem_exec_reloc.c
> index 692811057..d8013ccfc 100644
> --- a/tests/intel/gem_exec_reloc.c
> +++ b/tests/intel/gem_exec_reloc.c
> @@ -34,7 +34,7 @@
>  /**
>   * TEST: gem exec reloc
>   * Description: Basic sanity check of execbuf-ioctl relocations.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: relocations
> diff --git a/tests/intel/gem_exec_schedule.c b/tests/intel/gem_exec_schedule.c
> index 663c8782e..fdb7ebd70 100644
> --- a/tests/intel/gem_exec_schedule.c
> +++ b/tests/intel/gem_exec_schedule.c
> @@ -47,7 +47,7 @@
>  /**
>   * TEST: gem exec schedule
>   * Description: Check that we can control the order of execution
> - * Category: Desktop \ Server
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: execution order
> diff --git a/tests/intel/gem_exec_store.c b/tests/intel/gem_exec_store.c
> index c480555e8..3b1319519 100644
> --- a/tests/intel/gem_exec_store.c
> +++ b/tests/intel/gem_exec_store.c
> @@ -37,7 +37,7 @@
>  /**
>   * TEST: gem exec store
>   * Description: Exercise store dword functionality using execbuf-ioctl
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: coherency
> diff --git a/tests/intel/gem_exec_suspend.c b/tests/intel/gem_exec_suspend.c
> index 8dd23ee8c..0d08e8e44 100644
> --- a/tests/intel/gem_exec_suspend.c
> +++ b/tests/intel/gem_exec_suspend.c
> @@ -39,7 +39,7 @@
>  /**
>   * TEST: gem exec suspend
>   * Description: Exercise simple execbufs runs across various suspend/resume cycles.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: suspend
> diff --git a/tests/intel/gem_exec_whisper.c b/tests/intel/gem_exec_whisper.c
> index 21ebc5b3e..8d39fc0af 100644
> --- a/tests/intel/gem_exec_whisper.c
> +++ b/tests/intel/gem_exec_whisper.c
> @@ -40,7 +40,7 @@
>  /**
>   * TEST: gem exec whisper
>   * Feature: cmd_submission
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: execbuf
> diff --git a/tests/intel/gem_exercise_blt.c b/tests/intel/gem_exercise_blt.c
> index 4d62a037a..72f3b6b34 100644
> --- a/tests/intel/gem_exercise_blt.c
> +++ b/tests/intel/gem_exercise_blt.c
> @@ -13,7 +13,7 @@
>  /**
>   * TEST: gem exercise blt
>   * Description: Exercise blitter commands
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Blitter tests
>   * Functionality: fast-copy
> diff --git a/tests/intel/gem_fd_exhaustion.c b/tests/intel/gem_fd_exhaustion.c
> index 4b483863e..20c4f767c 100644
> --- a/tests/intel/gem_fd_exhaustion.c
> +++ b/tests/intel/gem_fd_exhaustion.c
> @@ -36,7 +36,7 @@
>  #include "i915/gem_create.h"
>  /**
>   * TEST: gem fd exhaustion
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: fd exhaustion
> diff --git a/tests/intel/gem_fence_thrash.c b/tests/intel/gem_fence_thrash.c
> index 0517c0316..bce638c27 100644
> --- a/tests/intel/gem_fence_thrash.c
> +++ b/tests/intel/gem_fence_thrash.c
> @@ -45,7 +45,7 @@
>  #include "igt_x86.h"
>  /**
>   * TEST: gem fence thrash
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: fences
> diff --git a/tests/intel/gem_fence_upload.c b/tests/intel/gem_fence_upload.c
> index 46a62a7ee..1105fa825 100644
> --- a/tests/intel/gem_fence_upload.c
> +++ b/tests/intel/gem_fence_upload.c
> @@ -43,7 +43,7 @@
>  #include "i915/gem_create.h"
>  /**
>   * TEST: gem fence upload
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: fences
> diff --git a/tests/intel/gem_fenced_exec_thrash.c b/tests/intel/gem_fenced_exec_thrash.c
> index 94e5632c1..19d49823a 100644
> --- a/tests/intel/gem_fenced_exec_thrash.c
> +++ b/tests/intel/gem_fenced_exec_thrash.c
> @@ -36,7 +36,7 @@
>  /**
>   * TEST: gem fenced exec thrash
>   * Description: Test execbuf fence accounting.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: fences
> diff --git a/tests/intel/gem_flink_basic.c b/tests/intel/gem_flink_basic.c
> index bb400a8bc..2fa3e925c 100644
> --- a/tests/intel/gem_flink_basic.c
> +++ b/tests/intel/gem_flink_basic.c
> @@ -41,7 +41,7 @@
>  /**
>   * TEST: gem flink basic
>   * Description: Tests for flink - a way to export a gem object by name
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: DRM
>   * Functionality: flink
> diff --git a/tests/intel/gem_flink_race.c b/tests/intel/gem_flink_race.c
> index b75d0c9be..2fd523436 100644
> --- a/tests/intel/gem_flink_race.c
> +++ b/tests/intel/gem_flink_race.c
> @@ -38,7 +38,7 @@
>  /**
>   * TEST: gem flink race
>   * Description: Check for flink/open vs. gem close races.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: DRM
>   * Functionality: flink
> diff --git a/tests/intel/gem_gpgpu_fill.c b/tests/intel/gem_gpgpu_fill.c
> index 3c03c7e70..aa735e539 100644
> --- a/tests/intel/gem_gpgpu_fill.c
> +++ b/tests/intel/gem_gpgpu_fill.c
> @@ -50,7 +50,7 @@
>  #include "i915/intel_memory_region.h"
>  /**
>   * TEST: gem gpgpu fill
> - * Category: Server
> + * Category: Core
>   * Mega feature: Compute
>   * Sub-category: GPGPU tests
>   * Functionality: gpgpu_fill
> diff --git a/tests/intel/gem_gtt_cpu_tlb.c b/tests/intel/gem_gtt_cpu_tlb.c
> index 7fd876e5c..4dc2f3ca8 100644
> --- a/tests/intel/gem_gtt_cpu_tlb.c
> +++ b/tests/intel/gem_gtt_cpu_tlb.c
> @@ -46,7 +46,7 @@
>  /**
>   * TEST: gem gtt cpu tlb
>   * Description: Check whether gtt tlbs for cpu access are correctly invalidated.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: mapping
> diff --git a/tests/intel/gem_gtt_hog.c b/tests/intel/gem_gtt_hog.c
> index cfeea8ba1..641dbecd3 100644
> --- a/tests/intel/gem_gtt_hog.c
> +++ b/tests/intel/gem_gtt_hog.c
> @@ -44,7 +44,7 @@
>  #include "igt.h"
>  /**
>   * TEST: gem gtt hog
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: gtt
> diff --git a/tests/intel/gem_gtt_speed.c b/tests/intel/gem_gtt_speed.c
> index 14f0ffa88..996e54af0 100644
> --- a/tests/intel/gem_gtt_speed.c
> +++ b/tests/intel/gem_gtt_speed.c
> @@ -44,7 +44,7 @@
>  #include "i915/gem_create.h"
>  /**
>   * TEST: gem gtt speed
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: gtt
> diff --git a/tests/intel/gem_huc_copy.c b/tests/intel/gem_huc_copy.c
> index 07810e696..8660a9f84 100644
> --- a/tests/intel/gem_huc_copy.c
> +++ b/tests/intel/gem_huc_copy.c
> @@ -38,7 +38,7 @@
>  /**
>   * TEST: gem huc copy
>   * Description: A very simple workload for the HuC.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Firmware tests
>   * Functionality: HUC
> diff --git a/tests/intel/gem_linear_blits.c b/tests/intel/gem_linear_blits.c
> index f5b86e37c..2eeec5b6a 100644
> --- a/tests/intel/gem_linear_blits.c
> +++ b/tests/intel/gem_linear_blits.c
> @@ -52,7 +52,7 @@
>  /**
>   * TEST: gem linear blits
>   * Description: Test doing many blits with a working set larger than the aperture size.
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Blitter tests
>   * Functionality: linear blits
> diff --git a/tests/intel/gem_lmem_evict.c b/tests/intel/gem_lmem_evict.c
> index 2453f95b2..dcdf30c1d 100644
> --- a/tests/intel/gem_lmem_evict.c
> +++ b/tests/intel/gem_lmem_evict.c
> @@ -10,7 +10,7 @@
>  /**
>   * TEST: gem lmem evict
>   * Description: Force tiny lmem size for easily testing eviction scenarios.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: local memory eviction
> diff --git a/tests/intel/gem_lmem_swapping.c b/tests/intel/gem_lmem_swapping.c
> index d6cc93fcf..b8f24742b 100644
> --- a/tests/intel/gem_lmem_swapping.c
> +++ b/tests/intel/gem_lmem_swapping.c
> @@ -27,7 +27,7 @@
>  /**
>   * TEST: gem lmem swapping
>   * Description: Exercise local memory swapping.
> - * Category: Server
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: local memory
> diff --git a/tests/intel/gem_lut_handle.c b/tests/intel/gem_lut_handle.c
> index be75154fc..35f06ebe2 100644
> --- a/tests/intel/gem_lut_handle.c
> +++ b/tests/intel/gem_lut_handle.c
> @@ -42,7 +42,7 @@
>  /**
>   * TEST: gem lut handle
>   * Description: Exercises the basic execbuffer using the handle LUT interface.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: execbuf
> diff --git a/tests/intel/gem_madvise.c b/tests/intel/gem_madvise.c
> index 101355322..c090f121e 100644
> --- a/tests/intel/gem_madvise.c
> +++ b/tests/intel/gem_madvise.c
> @@ -41,7 +41,7 @@
>  /**
>   * TEST: gem madvise
>   * Description: Checks that the kernel reports EFAULT when trying to use purged bo.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: madvise
> diff --git a/tests/intel/gem_media_fill.c b/tests/intel/gem_media_fill.c
> index e22565b86..12e91ccbd 100644
> --- a/tests/intel/gem_media_fill.c
> +++ b/tests/intel/gem_media_fill.c
> @@ -48,7 +48,7 @@
>  /**
>   * TEST: gem media fill
>   * Description: Basic test for the media_fill() function, a very simple workload for the Media pipeline.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: Media
>   * Sub-category: Media tests
>   * Functionality: fill surface with media block
> diff --git a/tests/intel/gem_media_vme.c b/tests/intel/gem_media_vme.c
> index 1ec4d4492..8e503fa0d 100644
> --- a/tests/intel/gem_media_vme.c
> +++ b/tests/intel/gem_media_vme.c
> @@ -38,7 +38,7 @@
>  /**
>   * TEST: gem media vme
>   * Description: A very simple workload for the VME media block.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: Media
>   * Sub-category: Media tests
>   * Functionality: vme media block
> diff --git a/tests/intel/gem_mmap.c b/tests/intel/gem_mmap.c
> index 5e8a787d1..829a1e4c1 100644
> --- a/tests/intel/gem_mmap.c
> +++ b/tests/intel/gem_mmap.c
> @@ -41,7 +41,7 @@
>  /**
>   * TEST: gem mmap
>   * Description: Basic MMAP IOCTL tests for memory regions.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: mapping
> diff --git a/tests/intel/gem_mmap_gtt.c b/tests/intel/gem_mmap_gtt.c
> index 79be68a22..3bf2e5845 100644
> --- a/tests/intel/gem_mmap_gtt.c
> +++ b/tests/intel/gem_mmap_gtt.c
> @@ -49,7 +49,7 @@
>  /**
>   * TEST: gem mmap gtt
>   * Description: Ensure that all operations around MMAP_GTT ioctl works.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: map gtt
> diff --git a/tests/intel/gem_mmap_offset.c b/tests/intel/gem_mmap_offset.c
> index 90a4a0f1a..d0e439fea 100644
> --- a/tests/intel/gem_mmap_offset.c
> +++ b/tests/intel/gem_mmap_offset.c
> @@ -40,7 +40,7 @@
>  /**
>   * TEST: gem mmap offset
>   * Description: Basic MMAP_OFFSET IOCTL tests for mem regions
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: mapping
> diff --git a/tests/intel/gem_mmap_wc.c b/tests/intel/gem_mmap_wc.c
> index beecd0b3a..487027af9 100644
> --- a/tests/intel/gem_mmap_wc.c
> +++ b/tests/intel/gem_mmap_wc.c
> @@ -41,7 +41,7 @@
>  #include "i915/gem_create.h"
>  /**
>   * TEST: gem mmap wc
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: cache
> diff --git a/tests/intel/gem_partial_pwrite_pread.c b/tests/intel/gem_partial_pwrite_pread.c
> index 2787886ee..c98317766 100644
> --- a/tests/intel/gem_partial_pwrite_pread.c
> +++ b/tests/intel/gem_partial_pwrite_pread.c
> @@ -41,7 +41,7 @@
>  /**
>   * TEST: gem partial pwrite pread
>   * Description: Test pwrite/pread consistency when touching partial cachelines.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: pread/pwrite
> diff --git a/tests/intel/gem_pipe_control_store_loop.c b/tests/intel/gem_pipe_control_store_loop.c
> index 0a16574af..27630b188 100644
> --- a/tests/intel/gem_pipe_control_store_loop.c
> +++ b/tests/intel/gem_pipe_control_store_loop.c
> @@ -45,7 +45,7 @@
>  #include "igt.h"
>  /**
>   * TEST: gem pipe control store loop
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: coherency
> diff --git a/tests/intel/gem_ppgtt.c b/tests/intel/gem_ppgtt.c
> index a6ebeb01d..309f240cc 100644
> --- a/tests/intel/gem_ppgtt.c
> +++ b/tests/intel/gem_ppgtt.c
> @@ -41,7 +41,7 @@
>  #include "igt_debugfs.h"
>  /**
>   * TEST: gem ppgtt
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: ppgtt
> diff --git a/tests/intel/gem_pread.c b/tests/intel/gem_pread.c
> index bf77049e1..e5e662361 100644
> --- a/tests/intel/gem_pread.c
> +++ b/tests/intel/gem_pread.c
> @@ -48,7 +48,7 @@
>  /**
>   * TEST: gem pread
>   * Mega feature: General Core features
> - * Category: Desktop client
> + * Category: Core
>   * Sub-category: CMD submission
>   * Functionality: pread
>   * Feature: mapping
> diff --git a/tests/intel/gem_pread_after_blit.c b/tests/intel/gem_pread_after_blit.c
> index e30d2b467..a793b53cd 100644
> --- a/tests/intel/gem_pread_after_blit.c
> +++ b/tests/intel/gem_pread_after_blit.c
> @@ -50,7 +50,7 @@
>  /**
>   * TEST: gem pread after blit
>   * Description: Test pread behavior when getting values out of just-drawn-to buffers.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: pread
> diff --git a/tests/intel/gem_pwrite.c b/tests/intel/gem_pwrite.c
> index 3497b3932..025684a33 100644
> --- a/tests/intel/gem_pwrite.c
> +++ b/tests/intel/gem_pwrite.c
> @@ -49,7 +49,7 @@
>  /**
>   * TEST: gem pwrite
>   * Feature: mapping
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: pwrite
> diff --git a/tests/intel/gem_pwrite_snooped.c b/tests/intel/gem_pwrite_snooped.c
> index be3595439..60ccdc7aa 100644
> --- a/tests/intel/gem_pwrite_snooped.c
> +++ b/tests/intel/gem_pwrite_snooped.c
> @@ -42,7 +42,7 @@
>   * Description: pwrite to a snooped bo then make it uncached and check that the GPU sees the data.
>   * Feature: gtt, mapping
>   * Sub-category: CMD submission
> - * Category: Desktop client
> + * Category: Core
>   * Functionality: pwrite
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gem_pxp.c b/tests/intel/gem_pxp.c
> index 79d17f99c..6be19318a 100644
> --- a/tests/intel/gem_pxp.c
> +++ b/tests/intel/gem_pxp.c
> @@ -10,7 +10,7 @@
>  /**
>   * TEST: gem pxp
>   * Description: Test PXP that manages protected content through arbitrated HW-PXP-session
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: driver
>   * Functionality: pxp
> diff --git a/tests/intel/gem_read_read_speed.c b/tests/intel/gem_read_read_speed.c
> index f6834f74c..5cf80fee6 100644
> --- a/tests/intel/gem_read_read_speed.c
> +++ b/tests/intel/gem_read_read_speed.c
> @@ -45,7 +45,7 @@
>  /**
>   * TEST: gem read read speed
>   * Description: Test speed of concurrent reads between engines.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: read/write memory
> diff --git a/tests/intel/gem_readwrite.c b/tests/intel/gem_readwrite.c
> index b5c6e7a26..f3d0c4fbf 100644
> --- a/tests/intel/gem_readwrite.c
> +++ b/tests/intel/gem_readwrite.c
> @@ -40,7 +40,7 @@
>  #include "i915/gem_create.h"
>  /**
>   * TEST: gem readwrite
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: read/write memory
> diff --git a/tests/intel/gem_reg_read.c b/tests/intel/gem_reg_read.c
> index 46ea06979..5559c4d0a 100644
> --- a/tests/intel/gem_reg_read.c
> +++ b/tests/intel/gem_reg_read.c
> @@ -34,7 +34,7 @@
>  
>  /**
>   * TEST: gem reg read
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: uapi
>   * Functionality: ioctl
> diff --git a/tests/intel/gem_render_copy.c b/tests/intel/gem_render_copy.c
> index e9a82c465..3a46859bc 100644
> --- a/tests/intel/gem_render_copy.c
> +++ b/tests/intel/gem_render_copy.c
> @@ -51,7 +51,7 @@
>  /**
>   * TEST: gem render copy
>   * Description: Basic test for the render_copy() function.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: Render
>   * Sub-category: Render copy
>   * Functionality: render_copy
> diff --git a/tests/intel/gem_render_copy_redux.c b/tests/intel/gem_render_copy_redux.c
> index 6dcd3145d..1971bfebd 100644
> --- a/tests/intel/gem_render_copy_redux.c
> +++ b/tests/intel/gem_render_copy_redux.c
> @@ -51,7 +51,7 @@
>  /**
>   * TEST: gem render copy redux
>   * Description: Advanced test for the render_copy() function.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: Render
>   * Sub-category: Render copy
>   * Functionality: render_copy
> diff --git a/tests/intel/gem_render_linear_blits.c b/tests/intel/gem_render_linear_blits.c
> index cace14843..6a5e51c2a 100644
> --- a/tests/intel/gem_render_linear_blits.c
> +++ b/tests/intel/gem_render_linear_blits.c
> @@ -51,7 +51,7 @@
>  #include "igt.h"
>  /**
>   * TEST: gem render linear blits
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: render blits
> diff --git a/tests/intel/gem_render_tiled_blits.c b/tests/intel/gem_render_tiled_blits.c
> index 14b06c181..892c9c42a 100644
> --- a/tests/intel/gem_render_tiled_blits.c
> +++ b/tests/intel/gem_render_tiled_blits.c
> @@ -54,7 +54,7 @@
>   *   Tests performs cyclic forward, backward and random blits on tiled buffer
>   *   objects using render engine with various working set sizes and compares
>   *   outputs with expected ones.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: render blits
> diff --git a/tests/intel/gem_request_retire.c b/tests/intel/gem_request_retire.c
> index 60975279d..5ebfc1d3b 100644
> --- a/tests/intel/gem_request_retire.c
> +++ b/tests/intel/gem_request_retire.c
> @@ -52,7 +52,7 @@
>  /**
>   * TEST: gem request retire
>   * Description: Collection of tests targeting request retirement code paths.
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: requests
> diff --git a/tests/intel/gem_reset_stats.c b/tests/intel/gem_reset_stats.c
> index df470fc6a..91bec96c0 100644
> --- a/tests/intel/gem_reset_stats.c
> +++ b/tests/intel/gem_reset_stats.c
> @@ -49,7 +49,7 @@
>  #include "sw_sync.h"
>  /**
>   * TEST: gem reset stats
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: uapi
>   * Functionality: reset
> diff --git a/tests/intel/gem_ringfill.c b/tests/intel/gem_ringfill.c
> index e64c98b4b..298ed9c67 100644
> --- a/tests/intel/gem_ringfill.c
> +++ b/tests/intel/gem_ringfill.c
> @@ -46,7 +46,7 @@
>   * Description:
>   *   Exercise many tiny batchbuffer operations, in the hope of catching failure to manage the ring
>   *   properly near full.
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: execbuf
> diff --git a/tests/intel/gem_set_tiling_vs_blt.c b/tests/intel/gem_set_tiling_vs_blt.c
> index ecd4fc711..f78196fff 100644
> --- a/tests/intel/gem_set_tiling_vs_blt.c
> +++ b/tests/intel/gem_set_tiling_vs_blt.c
> @@ -60,7 +60,7 @@
>  /**
>   * TEST: gem set tiling vs blt
>   * Description: Check for proper synchronization of tiling changes vs. tiled gpu access.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Blitter tests
>   * Functionality: tiling
> diff --git a/tests/intel/gem_set_tiling_vs_gtt.c b/tests/intel/gem_set_tiling_vs_gtt.c
> index 621dc6fbf..bfb9060be 100644
> --- a/tests/intel/gem_set_tiling_vs_gtt.c
> +++ b/tests/intel/gem_set_tiling_vs_gtt.c
> @@ -41,7 +41,7 @@
>  /**
>   * TEST: gem set tiling vs gtt
>   * Description: Check set_tiling vs gtt mmap coherency.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: tiling vs gtt coherency
> diff --git a/tests/intel/gem_set_tiling_vs_pwrite.c b/tests/intel/gem_set_tiling_vs_pwrite.c
> index 10bfcb71f..1aa38cc4f 100644
> --- a/tests/intel/gem_set_tiling_vs_pwrite.c
> +++ b/tests/intel/gem_set_tiling_vs_pwrite.c
> @@ -41,7 +41,7 @@
>  /**
>   * TEST: gem set tiling vs pwrite
>   * Description: Check set_tiling vs pwrite coherency.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: tiling vs pwrite coherency
> diff --git a/tests/intel/gem_shrink.c b/tests/intel/gem_shrink.c
> index ee373bf4d..53332afbd 100644
> --- a/tests/intel/gem_shrink.c
> +++ b/tests/intel/gem_shrink.c
> @@ -36,7 +36,7 @@
>  /**
>   * TEST: gem shrink
>   * Feature: mapping
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: buffer management
> diff --git a/tests/intel/gem_softpin.c b/tests/intel/gem_softpin.c
> index 9bea97d39..b7c1b34e1 100644
> --- a/tests/intel/gem_softpin.c
> +++ b/tests/intel/gem_softpin.c
> @@ -36,7 +36,7 @@
>   * Description:
>   *   Tests softpin feature with normal usage, invalid inputs scenarios and couple of eviction
>   *   tests which copy buffers between CPU and GPU.
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: softpin
> diff --git a/tests/intel/gem_spin_batch.c b/tests/intel/gem_spin_batch.c
> index e1522c260..682a06218 100644
> --- a/tests/intel/gem_spin_batch.c
> +++ b/tests/intel/gem_spin_batch.c
> @@ -27,7 +27,7 @@
>  #include "igt.h"
>  /**
>   * TEST: gem spin batch
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: IGT Lib
>   * Functionality: dummy workload
> diff --git a/tests/intel/gem_streaming_writes.c b/tests/intel/gem_streaming_writes.c
> index d80ac6fe1..ea8c6db23 100644
> --- a/tests/intel/gem_streaming_writes.c
> +++ b/tests/intel/gem_streaming_writes.c
> @@ -43,7 +43,7 @@
>  /**
>   * TEST: gem streaming writes
>   * Description: Test of streaming writes into active GPU sources
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: barrier
> diff --git a/tests/intel/gem_stress.c b/tests/intel/gem_stress.c
> index 9ee7a4210..19a33b7e7 100644
> --- a/tests/intel/gem_stress.c
> +++ b/tests/intel/gem_stress.c
> @@ -64,7 +64,7 @@
>  /**
>   * TEST: gem stress
>   * Description: General gem coherency test.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: coherency
> diff --git a/tests/intel/gem_sync.c b/tests/intel/gem_sync.c
> index e10f49f16..21180012c 100644
> --- a/tests/intel/gem_sync.c
> +++ b/tests/intel/gem_sync.c
> @@ -35,7 +35,7 @@
>  /**
>   * TEST: gem sync
>   * Description: Basic check of ring<->ring write synchronisation.
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Synchronization
>   * Functionality: semaphore
> diff --git a/tests/intel/gem_tiled_blits.c b/tests/intel/gem_tiled_blits.c
> index f3845d213..6fcc8616e 100644
> --- a/tests/intel/gem_tiled_blits.c
> +++ b/tests/intel/gem_tiled_blits.c
> @@ -57,7 +57,7 @@
>  /**
>   * TEST: gem tiled blits
>   * Description: Test doing many tiled blits, with a working set larger than the aperture size.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: tiled blits
> diff --git a/tests/intel/gem_tiled_fence_blits.c b/tests/intel/gem_tiled_fence_blits.c
> index bf33b8d5f..5e5bc6939 100644
> --- a/tests/intel/gem_tiled_fence_blits.c
> +++ b/tests/intel/gem_tiled_fence_blits.c
> @@ -50,7 +50,7 @@
>   * Description:
>   *   Tests fence management problems related to tiled blits by performing many blits on tiled
>   *   buffer objects with fences enabled and with working set larger than the aperture size.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: tiled blits
> diff --git a/tests/intel/gem_tiled_partial_pwrite_pread.c b/tests/intel/gem_tiled_partial_pwrite_pread.c
> index 551fb4306..7e5a27660 100644
> --- a/tests/intel/gem_tiled_partial_pwrite_pread.c
> +++ b/tests/intel/gem_tiled_partial_pwrite_pread.c
> @@ -41,7 +41,7 @@
>  /**
>   * TEST: gem tiled partial pwrite pread
>   * Description: Test pwrite/pread consistency when touching partial cachelines.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: tiled pread/pwrite
> diff --git a/tests/intel/gem_tiled_pread_basic.c b/tests/intel/gem_tiled_pread_basic.c
> index f26db3592..49ce207a6 100644
> --- a/tests/intel/gem_tiled_pread_basic.c
> +++ b/tests/intel/gem_tiled_pread_basic.c
> @@ -51,7 +51,7 @@
>  /**
>   * TEST: gem tiled pread basic
>   * Description: Test pread behavior on tiled objects with respect to the reported swizzling value.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: tiled pread/pwrite
> diff --git a/tests/intel/gem_tiled_pread_pwrite.c b/tests/intel/gem_tiled_pread_pwrite.c
> index b65e0458a..3e9855d5a 100644
> --- a/tests/intel/gem_tiled_pread_pwrite.c
> +++ b/tests/intel/gem_tiled_pread_pwrite.c
> @@ -61,7 +61,7 @@
>  /**
>   * TEST: gem tiled pread pwrite
>   * Description: Test swizzling by testing pwrite does the inverse of pread.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: tiled pread/pwrite
> diff --git a/tests/intel/gem_tiled_swapping.c b/tests/intel/gem_tiled_swapping.c
> index af8976a25..1a9de5d2f 100644
> --- a/tests/intel/gem_tiled_swapping.c
> +++ b/tests/intel/gem_tiled_swapping.c
> @@ -61,7 +61,7 @@
>  /**
>   * TEST: gem tiled swapping
>   * Description: Exercise swizzle code for swapping.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: swapping
> diff --git a/tests/intel/gem_tiled_wb.c b/tests/intel/gem_tiled_wb.c
> index 6a61fcace..0f8e66af4 100644
> --- a/tests/intel/gem_tiled_wb.c
> +++ b/tests/intel/gem_tiled_wb.c
> @@ -50,7 +50,7 @@
>   * Description:
>   *   This is a test of write-combining mmap's behavior on tiled objects with respect to the reported
>   *   swizzling value.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: cache
> diff --git a/tests/intel/gem_tiled_wc.c b/tests/intel/gem_tiled_wc.c
> index ca10ab02d..20cc64aad 100644
> --- a/tests/intel/gem_tiled_wc.c
> +++ b/tests/intel/gem_tiled_wc.c
> @@ -47,7 +47,7 @@
>  #include "i915/gem_create.h"
>  /**
>   * TEST: gem tiled wc
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: cache
> diff --git a/tests/intel/gem_tiling_max_stride.c b/tests/intel/gem_tiling_max_stride.c
> index 2693a1eeb..da3d481ef 100644
> --- a/tests/intel/gem_tiling_max_stride.c
> +++ b/tests/intel/gem_tiling_max_stride.c
> @@ -42,7 +42,7 @@
>  /**
>   * TEST: gem tiling max stride
>   * Description: Check that max fence stride works.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: fences
> diff --git a/tests/intel/gem_unfence_active_buffers.c b/tests/intel/gem_unfence_active_buffers.c
> index cf3c0a392..ce0a68de8 100644
> --- a/tests/intel/gem_unfence_active_buffers.c
> +++ b/tests/intel/gem_unfence_active_buffers.c
> @@ -55,7 +55,7 @@
>  /**
>   * TEST: gem unfence active buffers
>   * Description: Check for use-after-free in the fence stealing code.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: use-after-free
> diff --git a/tests/intel/gem_unref_active_buffers.c b/tests/intel/gem_unref_active_buffers.c
> index a535b24a4..21a5a07d9 100644
> --- a/tests/intel/gem_unref_active_buffers.c
> +++ b/tests/intel/gem_unref_active_buffers.c
> @@ -44,7 +44,7 @@
>  /**
>   * TEST: gem unref active buffers
>   * Description: Test unreferencing of active buffers.
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: buffer management
> diff --git a/tests/intel/gem_userptr_blits.c b/tests/intel/gem_userptr_blits.c
> index f62e7dbbf..807c209e8 100644
> --- a/tests/intel/gem_userptr_blits.c
> +++ b/tests/intel/gem_userptr_blits.c
> @@ -69,7 +69,7 @@
>  #include "intel_blt.h"
>  /**
>   * TEST: gem userptr blits
> - * Category: Server
> + * Category: Core
>   * Mega feature: Compute
>   * Sub-category: Compute tests
>   * Functionality: userptr blits
> diff --git a/tests/intel/gem_vm_create.c b/tests/intel/gem_vm_create.c
> index 6fff1a601..752babfa8 100644
> --- a/tests/intel/gem_vm_create.c
> +++ b/tests/intel/gem_vm_create.c
> @@ -29,7 +29,7 @@
>  #include "igt_dummyload.h"
>  /**
>   * TEST: gem vm create
> - * Category: Server
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: context
> diff --git a/tests/intel/gem_wait.c b/tests/intel/gem_wait.c
> index 8128e2f12..7a353a11e 100644
> --- a/tests/intel/gem_wait.c
> +++ b/tests/intel/gem_wait.c
> @@ -34,7 +34,7 @@
>  /**
>   * TEST: gem wait
>   * Description: Tests the GEM_WAIT ioctl
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Synchronization
>   * Functionality: semaphore
> diff --git a/tests/intel/gem_watchdog.c b/tests/intel/gem_watchdog.c
> index 0d03c7f05..3d2fd68a8 100644
> --- a/tests/intel/gem_watchdog.c
> +++ b/tests/intel/gem_watchdog.c
> @@ -37,7 +37,7 @@
>  #include "sw_sync.h"
>  /**
>   * TEST: gem watchdog
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: fences
> diff --git a/tests/intel/gem_workarounds.c b/tests/intel/gem_workarounds.c
> index d7fd8a8e0..b810b125c 100644
> --- a/tests/intel/gem_workarounds.c
> +++ b/tests/intel/gem_workarounds.c
> @@ -34,7 +34,7 @@
>  #include "igt_types.h"
>  /**
>   * TEST: gem workarounds
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Workarounds
>   * Functionality: workaround registers
> diff --git a/tests/intel/gen3_mixed_blits.c b/tests/intel/gen3_mixed_blits.c
> index fbfd04705..fbc98b68f 100644
> --- a/tests/intel/gen3_mixed_blits.c
> +++ b/tests/intel/gen3_mixed_blits.c
> @@ -50,7 +50,7 @@
>  #include "igt.h"
>  /**
>   * TEST: gen3 mixed blits
> - * Category: Obsolete
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Obsolete_gen3
>   * Functionality: obsolete_test
> diff --git a/tests/intel/gen3_render_linear_blits.c b/tests/intel/gen3_render_linear_blits.c
> index 34bf510f0..24e0acc84 100644
> --- a/tests/intel/gen3_render_linear_blits.c
> +++ b/tests/intel/gen3_render_linear_blits.c
> @@ -49,7 +49,7 @@
>  #include "igt.h"
>  /**
>   * TEST: gen3 render linear blits
> - * Category: Obsolete
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Obsolete_gen3
>   * Functionality: obsolete_test
> diff --git a/tests/intel/gen3_render_mixed_blits.c b/tests/intel/gen3_render_mixed_blits.c
> index 29db12d3d..74b085ff9 100644
> --- a/tests/intel/gen3_render_mixed_blits.c
> +++ b/tests/intel/gen3_render_mixed_blits.c
> @@ -50,7 +50,7 @@
>  #include "igt.h"
>  /**
>   * TEST: gen3 render mixed blits
> - * Category: Obsolete
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Obsolete_gen3
>   * Functionality: obsolete_test
> diff --git a/tests/intel/gen3_render_tiledx_blits.c b/tests/intel/gen3_render_tiledx_blits.c
> index 578abdef0..c6f92de8f 100644
> --- a/tests/intel/gen3_render_tiledx_blits.c
> +++ b/tests/intel/gen3_render_tiledx_blits.c
> @@ -50,7 +50,7 @@
>  #include "igt.h"
>  /**
>   * TEST: gen3 render tiledx blits
> - * Category: Obsolete
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Obsolete_gen3
>   * Functionality: obsolete_test
> diff --git a/tests/intel/gen3_render_tiledy_blits.c b/tests/intel/gen3_render_tiledy_blits.c
> index d8ecc1626..649c89eae 100644
> --- a/tests/intel/gen3_render_tiledy_blits.c
> +++ b/tests/intel/gen3_render_tiledy_blits.c
> @@ -50,7 +50,7 @@
>  #include "igt.h"
>  /**
>   * TEST: gen3 render tiledy blits
> - * Category: Obsolete
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Obsolete_gen3
>   * Functionality: obsolete_test
> diff --git a/tests/intel/gen7_exec_parse.c b/tests/intel/gen7_exec_parse.c
> index c0c01ae9e..d0dd21d08 100644
> --- a/tests/intel/gen7_exec_parse.c
> +++ b/tests/intel/gen7_exec_parse.c
> @@ -37,7 +37,7 @@
>  /**
>   * TEST: gen7 exec parse
>   * Feature: cmd_submission, command_parser
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: command submission
> diff --git a/tests/intel/gen9_exec_parse.c b/tests/intel/gen9_exec_parse.c
> index 021c07c38..dcce24835 100644
> --- a/tests/intel/gen9_exec_parse.c
> +++ b/tests/intel/gen9_exec_parse.c
> @@ -35,7 +35,7 @@
>  #include "sw_sync.h"
>  /**
>   * TEST: gen9 exec parse
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Blitter tests
>   * Functionality: command parser
> diff --git a/tests/intel/i915_fb_tiling.c b/tests/intel/i915_fb_tiling.c
> index baaed8893..849e37164 100644
> --- a/tests/intel/i915_fb_tiling.c
> +++ b/tests/intel/i915_fb_tiling.c
> @@ -26,7 +26,7 @@
>  /**
>   * TEST: i915 fb tiling
>   * Description: Object tiling must be fixed after framebuffer creation.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: object tiling
> diff --git a/tests/intel/i915_getparams_basic.c b/tests/intel/i915_getparams_basic.c
> index 507e9754f..cd0b528bc 100644
> --- a/tests/intel/i915_getparams_basic.c
> +++ b/tests/intel/i915_getparams_basic.c
> @@ -33,7 +33,7 @@
>  /**
>   * TEST: i915 getparams basic
>   * Description: Tests the export of parameters via DRM_IOCTL_I915_GETPARAM
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: uapi
>   * Functionality: device topology
> diff --git a/tests/intel/i915_hangman.c b/tests/intel/i915_hangman.c
> index 4a03917dc..f100118b6 100644
> --- a/tests/intel/i915_hangman.c
> +++ b/tests/intel/i915_hangman.c
> @@ -43,7 +43,7 @@
>  /**
>   * TEST: i915 hangman
>   * Description: Tests for hang detection and recovery
> - * Category: Server
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Debugging
>   * Functionality: error handling
> diff --git a/tests/intel/i915_module_load.c b/tests/intel/i915_module_load.c
> index 4508b43de..e3e4470df 100644
> --- a/tests/intel/i915_module_load.c
> +++ b/tests/intel/i915_module_load.c
> @@ -26,7 +26,7 @@
>  /**
>   * TEST: i915 module load
>   * Description: Tests the i915 module loading.
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: driver
>   * Functionality: driver handler
> diff --git a/tests/intel/i915_pciid.c b/tests/intel/i915_pciid.c
> index a66bd5edd..42ed7151d 100644
> --- a/tests/intel/i915_pciid.c
> +++ b/tests/intel/i915_pciid.c
> @@ -31,7 +31,7 @@
>  /**
>   * TEST: i915 pciid
>   * Description: Check that igt/i915 know about this PCI-ID
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Core
>   * Functionality: device management
> diff --git a/tests/intel/i915_pm_freq_api.c b/tests/intel/i915_pm_freq_api.c
> index bfcd02e25..2a3da6f4a 100644
> --- a/tests/intel/i915_pm_freq_api.c
> +++ b/tests/intel/i915_pm_freq_api.c
> @@ -11,7 +11,7 @@
>  /**
>   * TEST: i915 pm freq api
>   * Description: Test SLPC freq API
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: uapi
>   * Functionality: slpc
> diff --git a/tests/intel/i915_pm_freq_mult.c b/tests/intel/i915_pm_freq_mult.c
> index 5ea3b05b7..fa68be220 100644
> --- a/tests/intel/i915_pm_freq_mult.c
> +++ b/tests/intel/i915_pm_freq_mult.c
> @@ -14,7 +14,7 @@
>   * TEST: i915 pm freq mult
>   * Description: Tests for sysfs controls (or multipliers) for IP blocks which
>   *		run at frequencies different from the main GT frequency.
> - * Category: Firmware building block
> + * Category: Core
>   * Mega feature: Power management
>   * Sub-category: Power management tests
>   * Functionality: freg multipliers
> diff --git a/tests/intel/i915_pm_rc6_residency.c b/tests/intel/i915_pm_rc6_residency.c
> index 92dae43b3..ebc0c235c 100644
> --- a/tests/intel/i915_pm_rc6_residency.c
> +++ b/tests/intel/i915_pm_rc6_residency.c
> @@ -43,7 +43,7 @@
>  #include "sw_sync.h"
>  /**
>   * TEST: i915 pm rc6 residency
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: Power management
>   * Sub-category: Power management tests
>   * Functionality: rc6
> diff --git a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c
> index 52e00489d..0ea5fbd8a 100644
> --- a/tests/intel/i915_pm_rpm.c
> +++ b/tests/intel/i915_pm_rpm.c
> @@ -42,7 +42,7 @@
>  #include <sys/stat.h>
>  /**
>   * TEST: i915 pm rpm
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: Power management
>   * Sub-category: Power management tests
>   * Functionality: D3 state entry-exit
> diff --git a/tests/intel/i915_pm_rps.c b/tests/intel/i915_pm_rps.c
> index 4ab137282..99b83f315 100644
> --- a/tests/intel/i915_pm_rps.c
> +++ b/tests/intel/i915_pm_rps.c
> @@ -47,7 +47,7 @@
>  /**
>   * TEST: i915 pm rps
>   * Description: Render P-States tests - verify GPU frequency changes
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: Power management
>   * Sub-category: Power management tests
>   * Functionality: pm_rps
> diff --git a/tests/intel/i915_pm_sseu.c b/tests/intel/i915_pm_sseu.c
> index 1fb938893..13493933a 100644
> --- a/tests/intel/i915_pm_sseu.c
> +++ b/tests/intel/i915_pm_sseu.c
> @@ -38,7 +38,7 @@
>  /**
>   * TEST: i915 pm sseu
>   * Description: Tests slice/subslice/EU power gating functionality.
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: Power management
>   * Sub-category: Power management tests
>   * Functionality: sseu
> diff --git a/tests/intel/i915_power.c b/tests/intel/i915_power.c
> index ef92efb6f..4de7adbe6 100644
> --- a/tests/intel/i915_power.c
> +++ b/tests/intel/i915_power.c
> @@ -10,7 +10,7 @@
>  /**
>   * TEST: i915 power
>   * Description: i915 power measurement tests
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: Power management
>   * Sub-category: Power management tests
>   * Functionality: hwmon
> diff --git a/tests/intel/i915_query.c b/tests/intel/i915_query.c
> index a6e35804b..f886297ed 100644
> --- a/tests/intel/i915_query.c
> +++ b/tests/intel/i915_query.c
> @@ -30,7 +30,7 @@
>  /**
>   * TEST: i915 query
>   * Description: Testing the i915 query uAPI.
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: uapi
>   * Functionality: device topology
> diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c
> index bdac64b29..f234ca2de 100644
> --- a/tests/intel/i915_selftest.c
> +++ b/tests/intel/i915_selftest.c
> @@ -28,14 +28,14 @@
>   * Description: Basic unit tests for i915.ko
>   *
>   * SUBTEST: live
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Selftest subcategory
>   * Functionality: live selftest
>   * Feature: gem_core
>   *
>   * SUBTEST: live@active
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Synchronization
>   * Functionality: semaphore
> @@ -43,7 +43,7 @@
>   *
>   * SUBTEST: live@blt
>   * Description: Blitter validation
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Blitter tests
>   * Functionality: command streamer
> @@ -51,7 +51,7 @@
>   *
>   * SUBTEST: live@client
>   * Description: Internal API over blitter
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: uapi
>   * Functionality: blitter api
> @@ -59,35 +59,35 @@
>   *
>   * SUBTEST: live@coherency
>   * Description: Cache management
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: cache
>   * Test category: i915 / HW
>   *
>   * SUBTEST: live@debugger
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Debugging
>   * Functionality: device management
>   * Test category: debugger
>   *
>   * SUBTEST: live@display
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Display Features
>   * Sub-category: Display tests
>   * Functionality: display sanity
>   * Test category: i915
>   *
>   * SUBTEST: live@dmabuf
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: dmabuf test
>   * Test category: i915
>   *
>   * SUBTEST: live@evict
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: GTT eviction
> @@ -95,14 +95,14 @@
>   *
>   * SUBTEST: live@execlists
>   * Description: command submission backend
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: execlists
>   * Test category: i915
>   *
>   * SUBTEST: live@gem
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: execbuf
> @@ -110,7 +110,7 @@
>   *
>   * SUBTEST: live@gem_contexts
>   * Description: User isolation and execution at the context level
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: context
> @@ -118,7 +118,7 @@
>   *
>   * SUBTEST: live@gem_execbuf
>   * Description: command submission support
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: execbuf
> @@ -126,7 +126,7 @@
>   *
>   * SUBTEST: live@gt_ccs_mode
>   * Description: Multi-ccs internal validation
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: multii-ccs
> @@ -134,7 +134,7 @@
>   *
>   * SUBTEST: live@gt_contexts
>   * Description: HW isolation and HW context validation
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: context
> @@ -142,7 +142,7 @@
>   *
>   * SUBTEST: live@gt_engines
>   * Description: command submission topology validation
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: command submission topology
> @@ -150,7 +150,7 @@
>   *
>   * SUBTEST: live@gt_gtt
>   * Description: Validation of virtual address management and execution
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: gtt
> @@ -158,7 +158,7 @@
>   *
>   * SUBTEST: live@gt_heartbeat
>   * Description: Stall detection interface validation
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Reset tests
>   * Functionality: heartbeat
> @@ -166,7 +166,7 @@
>   *
>   * SUBTEST: live@gt_lrc
>   * Description: HW isolation and HW context validation
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: context
> @@ -174,7 +174,7 @@
>   *
>   * SUBTEST: live@gt_mocs
>   * Description: Verification of mocs registers
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Mocs
>   * Functionality: mocs registers
> @@ -182,21 +182,21 @@
>   *
>   * SUBTEST: live@gt_pm
>   * Description: Basic i915 driver module selftests
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: Power management
>   * Sub-category: Power management tests
>   * Functionality: rps, rc6
>   *
>   * SUBTEST: live@gt_timelines
>   * Description: semaphore tracking
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Synchronization
>   * Functionality: semaphore
>   * Test category: i915
>   *
>   * SUBTEST: live@gt_tlb
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: tlb
> @@ -204,7 +204,7 @@
>   *
>   * SUBTEST: live@gtt
>   * Description: Virtual address management interface validation
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: virtual address
> @@ -212,14 +212,14 @@
>   *
>   * SUBTEST: live@gtt_l4wa
>   * Description: Check the L4WA is enabled when it was required
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Workarounds
>   * Functionality: L4WA
>   * Test category: i915
>   *
>   * SUBTEST: live@guc
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Firmware tests
>   * Functionality: GUC
> @@ -227,7 +227,7 @@
>   * Test category: GuC
>   *
>   * SUBTEST: live@guc_doorbells
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Firmware tests
>   * Functionality: GUC
> @@ -235,7 +235,7 @@
>   * Test category: GuC
>   *
>   * SUBTEST: live@guc_hang
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Firmware tests
>   * Functionality: GUC
> @@ -243,7 +243,7 @@
>   * Test category: GuC
>   *
>   * SUBTEST: live@guc_multi_lrc
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Firmware tests
>   * Functionality: GUC
> @@ -252,7 +252,7 @@
>   *
>   * SUBTEST: live@hangcheck
>   * Description: reset handling after stall detection
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Functionality: hangcheck
>   * Test category: i915
> @@ -260,7 +260,7 @@
>   *
>   * SUBTEST: live@hugepages
>   * Description: Large page support validation
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: large page
> @@ -268,7 +268,7 @@
>   *
>   * SUBTEST: live@late_gt_pm
>   * Description: Basic i915 driver module selftests
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: Power management
>   * Sub-category: Power management tests
>   * Feature: rc6
> @@ -276,7 +276,7 @@
>   *
>   * SUBTEST: live@lmem
>   * Description: Basic i915 driver module selftests
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Feature: local_memory
> @@ -284,23 +284,23 @@
>   *
>   * SUBTEST: live@memory_region
>   * Description: memory topology validation and migration checks
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: memory topology
>   * Test category: i915 / HW
>   *
>   * SUBTEST: live@memory_region_cross_tile
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Description: Multi-tile memory topology validation
> - * Category: Selftest
> + * Category: Core
>   * Sub-category: MultiTile
>   * Functionality: memory topology
>   *
>   * SUBTEST: live@mman
>   * Description: memory management validation
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: mapping
> @@ -308,7 +308,7 @@
>   *
>   * SUBTEST: live@obj_lock
>   * Description: Validation of per-object locking patterns
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Core
>   * Functionality: per-object locking
> @@ -316,7 +316,7 @@
>   *
>   * SUBTEST: live@objects
>   * Description: User object allocation and isolation checks
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Core
>   * Functionality: objects
> @@ -324,7 +324,7 @@
>   *
>   * SUBTEST: live@perf
>   * Description: Basic i915 module perf unit selftests
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: Performance interface
>   * Sub-category: Performance tests
>   * Functionality: perf
> @@ -332,14 +332,14 @@
>   *
>   * SUBTEST: live@remote_tiles
>   * Description: Tile meta data validation
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: MultiTile
>   * Functionality: meta data
>   *
>   * SUBTEST: live@requests
>   * Description: Validation of internal i915 command submission interface
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: command submission interface
> @@ -347,7 +347,7 @@
>   *
>   * SUBTEST: live@reset
>   * Description: engine/GT resets
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Reset tests
>   * Functionality: engine/GT reset
> @@ -355,21 +355,21 @@
>   *
>   * SUBTEST: live@sanitycheck
>   * Description: Checks the selftest infrastructure itself
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Core
>   * Functionality: sanitycheck
>   * Test category: i915
>   *
>   * SUBTEST: live@scheduler
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD Submission
>   * Functionality: scheduler
>   *
>   * SUBTEST: live@semaphores
>   * Description: GuC semaphore management
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Synchronization
>   * Functionality: semaphore
> @@ -377,7 +377,7 @@
>   *
>   * SUBTEST: live@slpc
>   * Description: Basic i915 driver module selftests
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: Power management
>   * Sub-category: Power management tests
>   * Functionality: slpc
> @@ -385,7 +385,7 @@
>   *
>   * SUBTEST: live@uncore
>   * Description: Basic i915 driver module selftests
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: Power management
>   * Sub-category: Power management tests
>   * Functionality: forcewake
> @@ -393,7 +393,7 @@
>   *
>   * SUBTEST: live@vma
>   * Description: Per-object virtual address management
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: virtual address
> @@ -401,7 +401,7 @@
>   *
>   * SUBTEST: live@win_blt_copy
>   * Description: Validation of migration interface
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Blitter tests
>   * Functionality: migration interface
> @@ -409,14 +409,14 @@
>   *
>   * SUBTEST: live@workarounds
>   * Description: Check workarounds persist or are reapplied after resets and other power management events
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Workarounds
>   * Functionality: driver workarounds
>   * Test category: HW
>   *
>   * SUBTEST: mock
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Feature: gem_core
>   * Sub-category: Selftest subcategory
> @@ -425,7 +425,7 @@
>   *
>   * SUBTEST: mock@buddy
>   * Description: Buddy allocation
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: buddy allocation
> @@ -433,7 +433,7 @@
>   *
>   * SUBTEST: mock@contexts
>   * Description: GEM context internal API checks
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: uapi
>   * Functionality: context
> @@ -441,7 +441,7 @@
>   *
>   * SUBTEST: mock@dmabuf
>   * Description: dma-buf (buffer management) API checks
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: uapi
>   * Functionality: dmabuf test
> @@ -449,7 +449,7 @@
>   *
>   * SUBTEST: mock@engine
>   * Description: Engine topology API checks
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: uapi
>   * Functionality: engine topology
> @@ -457,7 +457,7 @@
>   *
>   * SUBTEST: mock@evict
>   * Description: GTT eviction API checks
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: uapi
>   * Functionality: gtt eviction
> @@ -465,7 +465,7 @@
>   *
>   * SUBTEST: mock@fence
>   * Description: semaphore API checks
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: uapi
>   * Functionality: semaphore api
> @@ -473,7 +473,7 @@
>   *
>   * SUBTEST: mock@gtt
>   * Description: Virtual address management API checks
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: uapi
>   * Functionality: gtt
> @@ -481,7 +481,7 @@
>   *
>   * SUBTEST: mock@hugepages
>   * Description: Hugepage API checks
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: uapi
>   * Functionality: huge page
> @@ -489,7 +489,7 @@
>   *
>   * SUBTEST: mock@memory_region
>   * Description: Memory region API checks
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: uapi
>   * Functionality: memory region
> @@ -497,7 +497,7 @@
>   *
>   * SUBTEST: mock@objects
>   * Description: Buffer object API checks
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: uapi
>   * Functionality: buffer object
> @@ -505,7 +505,7 @@
>   *
>   * SUBTEST: mock@phys
>   * Description: legacy physical object API checks
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: uapi
>   * Functionality: physical object
> @@ -513,7 +513,7 @@
>   *
>   * SUBTEST: mock@requests
>   * Description: Internal command submission API checks
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: uapi
>   * Functionality: requests
> @@ -521,7 +521,7 @@
>   *
>   * SUBTEST: mock@ring
>   * Description: Ringbuffer management API checks
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: uapi
>   * Functionality: ringbuffer
> @@ -529,7 +529,7 @@
>   *
>   * SUBTEST: mock@sanitycheck
>   * Description: Selftest for the selftest
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Core
>   * Functionality: sanitycheck
> @@ -537,7 +537,7 @@
>   *
>   * SUBTEST: mock@scatterlist
>   * Description: Scatterlist API checks
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: uapi
>   * Functionality: scatterlist
> @@ -545,7 +545,7 @@
>   *
>   * SUBTEST: mock@shmem
>   * Description: SHM utils API checks
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: uapi
>   * Functionality: shm
> @@ -553,7 +553,7 @@
>   *
>   * SUBTEST: mock@syncmap
>   * Description: API checks for the contracted radixtree
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: uapi
>   * Functionality: contracted radixtree
> @@ -561,14 +561,14 @@
>   *
>   * SUBTEST: mock@timelines
>   * Description: API checks for semaphore tracking
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: uapi
>   * Functionality: semaphore api
>   * Test category: i915
>   *
>   * SUBTEST: mock@tlb
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: tlb
> @@ -576,7 +576,7 @@
>   *
>   * SUBTEST: mock@uncore
>   * Description: Basic i915 driver module selftests
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: Power management
>   * Sub-category: Power management tests
>   * Functionality: forcewake
> @@ -584,14 +584,14 @@
>   *
>   * SUBTEST: mock@vma
>   * Description: API checks for virtual address management
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: uapi
>   * Functionality: virtual address
>   * Test category: i915
>   *
>   * SUBTEST: perf
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: Performance interface
>   * Sub-category: Performance tests
>   * Functionality: oa
> @@ -599,7 +599,7 @@
>   *
>   * SUBTEST: perf@blt
>   * Description: Basic i915 module perf unit selftests
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: Performance interface
>   * Sub-category: Performance tests
>   * Functionality: perf
> @@ -607,7 +607,7 @@
>   *
>   * SUBTEST: perf@engine_cs
>   * Description: Basic i915 module perf unit selftests
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: Performance interface
>   * Sub-category: Performance tests
>   * Functionality: perf
> @@ -615,7 +615,7 @@
>   *
>   * SUBTEST: perf@region
>   * Description: Basic i915 module perf unit selftests
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: Performance interface
>   * Sub-category: Performance tests
>   * Functionality: perf
> @@ -623,14 +623,14 @@
>   *
>   * SUBTEST: perf@request
>   * Description: Basic i915 module perf unit selftests
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: Performance interface
>   * Sub-category: Performance tests
>   * Functionality: perf
>   *
>   * SUBTEST: perf@scheduler
>   * Description: Basic i915 module perf unit selftests
> - * Category: Selftest
> + * Category: Core
>   * Mega feature: Performance interface
>   * Sub-category: Performance tests
>   * Functionality: perf
> diff --git a/tests/intel/i915_suspend.c b/tests/intel/i915_suspend.c
> index 1f99c2ddc..3398b372b 100644
> --- a/tests/intel/i915_suspend.c
> +++ b/tests/intel/i915_suspend.c
> @@ -46,7 +46,7 @@
>  #include "igt_device_scan.h"
>  /**
>   * TEST: i915 suspend
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: Power management
>   * Sub-category: Power management tests
>   * Functionality: s2idle w/o i915
> diff --git a/tests/intel/i915_test_config.json b/tests/intel/i915_test_config.json
> index 26e472152..3b3afb2fd 100644
> --- a/tests/intel/i915_test_config.json
> +++ b/tests/intel/i915_test_config.json
> @@ -39,8 +39,7 @@
>              },
>              "Category": {
>                  "_properties_": {
> -                    "mandatory": true,
> -                    "description": "Contains the major group for the tested functionality, being hardware, software or firmware"
> +                    "description": "Contains the major group for the tested functionality 'Core'"
>                  },
>                  "Mega feature": {
>                      "_properties_": {
> diff --git a/tests/intel/intel_hwmon.c b/tests/intel/intel_hwmon.c
> index 448f780d4..e4272e0a0 100644
> --- a/tests/intel/intel_hwmon.c
> +++ b/tests/intel/intel_hwmon.c
> @@ -11,7 +11,7 @@
>  /**
>   * TEST: intel hwmon
>   * Description: Tests for intel hwmon
> - * Category: Software Building Block
> + * Category: Core
>   * Mega feature: RAS
>   * Sub-category: RAS tests
>   * Functionality: hwmon
> diff --git a/tests/intel/perf.c b/tests/intel/perf.c
> index dd70faf56..95b17f522 100644
> --- a/tests/intel/perf.c
> +++ b/tests/intel/perf.c
> @@ -48,7 +48,7 @@
>  /**
>   * TEST: perf
>   * Description: Test the i915 perf metrics streaming interface
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: Performance interface
>   * Sub-category: Performance tests
>   * Functionality: oa
> diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
> index 7a92d5c1d..e3f51d0c7 100644
> --- a/tests/intel/perf_pmu.c
> +++ b/tests/intel/perf_pmu.c
> @@ -52,7 +52,7 @@
>  /**
>   * TEST: perf pmu
>   * Description: Test the i915 pmu perf interface
> - * Category: Desktop client
> + * Category: Core
>   * Mega feature: Performance interface
>   * Sub-category: Performance tests
>   * Functionality: pmu
> diff --git a/tests/intel/prime_busy.c b/tests/intel/prime_busy.c
> index 96fbac760..4bba32835 100644
> --- a/tests/intel/prime_busy.c
> +++ b/tests/intel/prime_busy.c
> @@ -29,7 +29,7 @@
>  /**
>   * TEST: prime busy
>   * Description: Basic check of polling for prime fences.
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: prime
> diff --git a/tests/intel/prime_mmap.c b/tests/intel/prime_mmap.c
> index c874bbd1f..6de54b840 100644
> --- a/tests/intel/prime_mmap.c
> +++ b/tests/intel/prime_mmap.c
> @@ -52,7 +52,7 @@
>  #include "i915/intel_memory_region.h"
>  /**
>   * TEST: prime mmap
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: prime
> diff --git a/tests/intel/prime_mmap_coherency.c b/tests/intel/prime_mmap_coherency.c
> index 73449d8bb..01c394639 100644
> --- a/tests/intel/prime_mmap_coherency.c
> +++ b/tests/intel/prime_mmap_coherency.c
> @@ -36,7 +36,7 @@
>   * Description:
>   *   Test dma-buf mmap on !llc platforms mostly and provoke coherency bugs so we know for sure where
>   *   we need the sync ioctls.
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: prime
> diff --git a/tests/intel/prime_mmap_kms.c b/tests/intel/prime_mmap_kms.c
> index ac476d874..c0c2f2fc0 100644
> --- a/tests/intel/prime_mmap_kms.c
> +++ b/tests/intel/prime_mmap_kms.c
> @@ -39,7 +39,7 @@ IGT_TEST_DESCRIPTION(
>  
>  /**
>   * TEST: prime mmap kms
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: DRM
>   * Functionality: prime
> diff --git a/tests/intel/prime_self_import.c b/tests/intel/prime_self_import.c
> index 46107045b..62d7431c2 100644
> --- a/tests/intel/prime_self_import.c
> +++ b/tests/intel/prime_self_import.c
> @@ -48,7 +48,7 @@
>  /**
>   * TEST: prime self import
>   * Description: Check whether prime import/export works on the same device... but with different fds.
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: prime import/export
> diff --git a/tests/intel/sysfs_defaults.c b/tests/intel/sysfs_defaults.c
> index 5b37e038d..c7b6b36fd 100644
> --- a/tests/intel/sysfs_defaults.c
> +++ b/tests/intel/sysfs_defaults.c
> @@ -35,7 +35,7 @@
>  #include "igt_sysfs.h"
>  /**
>   * TEST: sysfs defaults
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: uapi
>   * Functionality: sysfs
> diff --git a/tests/intel/sysfs_heartbeat_interval.c b/tests/intel/sysfs_heartbeat_interval.c
> index 0af8879f6..486a1514d 100644
> --- a/tests/intel/sysfs_heartbeat_interval.c
> +++ b/tests/intel/sysfs_heartbeat_interval.c
> @@ -43,7 +43,7 @@
>  #include "sw_sync.h"
>  /**
>   * TEST: sysfs heartbeat interval
> - * Category: Desktop \ Server
> + * Category: Core
>   * Mega feature: SysMan
>   * Sub-category: SysMan tests
>   * Functionality: sysfs heartbeat
> diff --git a/tests/intel/sysfs_preempt_timeout.c b/tests/intel/sysfs_preempt_timeout.c
> index 88f2cdfcd..18e000405 100644
> --- a/tests/intel/sysfs_preempt_timeout.c
> +++ b/tests/intel/sysfs_preempt_timeout.c
> @@ -42,7 +42,7 @@
>  #include "sw_sync.h"
>  /**
>   * TEST: sysfs preempt timeout
> - * Category: Desktop \ Server
> + * Category: Core
>   * Mega feature: SysMan
>   * Sub-category: SysMan tests
>   * Functionality: sysfs preempt timeout
> diff --git a/tests/intel/sysfs_timeslice_duration.c b/tests/intel/sysfs_timeslice_duration.c
> index 6baa000df..026d12b85 100644
> --- a/tests/intel/sysfs_timeslice_duration.c
> +++ b/tests/intel/sysfs_timeslice_duration.c
> @@ -45,7 +45,7 @@
>  #include "sw_sync.h"
>  /**
>   * TEST: sysfs timeslice duration
> - * Category: Desktop \ Server
> + * Category: Core
>   * Mega feature: SysMan
>   * Sub-category: SysMan tests
>   * Functionality: timeslise sysfs
> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> index a083325c0..beccfcb1a 100644
> --- a/tests/intel/xe_ccs.c
> +++ b/tests/intel/xe_ccs.c
> @@ -20,7 +20,7 @@
>  #include "xe/xe_util.h"
>  /**
>   * TEST: xe ccs
> - * Category: Hardware building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Blitter tests
>   * Functionality: flat_ccs
> diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
> index 8cf5e393b..ebaa5e750 100644
> --- a/tests/intel/xe_compute.c
> +++ b/tests/intel/xe_compute.c
> @@ -5,7 +5,7 @@
>  
>  /**
>   * TEST: Check compute-related functionality
> - * Category: Hardware building block
> + * Category: Core
>   * Mega feature: Compute
>   * Sub-category: Compute tests
>   * Test category: functionality test
> diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
> index 306b178df..9c76141f4 100644
> --- a/tests/intel/xe_compute_preempt.c
> +++ b/tests/intel/xe_compute_preempt.c
> @@ -5,7 +5,7 @@
>  
>  /**
>   * TEST: Check compute-related preemption functionality
> - * Category: Hardware building block
> + * Category: Core
>   * Mega feature: Compute
>   * Sub-category: Compute tests
>   * Functionality: OpenCL kernel
> diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
> index 86fdac0ce..aa771338e 100644
> --- a/tests/intel/xe_copy_basic.c
> +++ b/tests/intel/xe_copy_basic.c
> @@ -21,7 +21,7 @@
>  
>  /**
>   * TEST: Test to validate copy commands on xe
> - * Category: Software building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Blitter tests
>   * Functionality: copy
> diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
> index 59f1e2992..d41557c85 100644
> --- a/tests/intel/xe_create.c
> +++ b/tests/intel/xe_create.c
> @@ -5,7 +5,7 @@
>  
>  /**
>   * TEST: Check bo create ioctl
> - * Category: Software building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: uapi
>   */
> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
> index 1f4750923..a7d56a0be 100644
> --- a/tests/intel/xe_debugfs.c
> +++ b/tests/intel/xe_debugfs.c
> @@ -6,7 +6,7 @@
>  /**
>   * TEST: Check debugfs userspace API
>   * Description: Validate debugfs entries
> - * Category: Software building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: uapi
>   * Functionality: debugfs
> diff --git a/tests/intel/xe_dma_buf_sync.c b/tests/intel/xe_dma_buf_sync.c
> index 3ed690f4e..f0d3f0d54 100644
> --- a/tests/intel/xe_dma_buf_sync.c
> +++ b/tests/intel/xe_dma_buf_sync.c
> @@ -5,7 +5,7 @@
>  
>  /**
>   * TEST: Check dmabuf functionality
> - * Category: Software building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: dmabuf
>   * Test category: functionality test
> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
> index 51d2ea368..2ceafba24 100644
> --- a/tests/intel/xe_drm_fdinfo.c
> +++ b/tests/intel/xe_drm_fdinfo.c
> @@ -15,7 +15,7 @@
>  /**
>   * TEST: xe drm fdinfo
>   * Description: Read and verify drm client memory consumption using fdinfo
> - * Category: Software building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: driver
>   * Functionality: Per client memory statistics
> diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
> index d5f6cea32..eebdbc84b 100644
> --- a/tests/intel/xe_evict.c
> +++ b/tests/intel/xe_evict.c
> @@ -5,7 +5,7 @@
>  
>  /**
>   * TEST: Check VMA eviction
> - * Category: Software building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: VMA
>   * Functionality: eviction
> diff --git a/tests/intel/xe_evict_ccs.c b/tests/intel/xe_evict_ccs.c
> index 34b59cb96..68f408908 100644
> --- a/tests/intel/xe_evict_ccs.c
> +++ b/tests/intel/xe_evict_ccs.c
> @@ -5,7 +5,7 @@
>  
>  /**
>   * TEST: Check flat-ccs eviction
> - * Category: Software building block
> + * Category: Core
>   * Mega feature: Compression
>   * Sub-category: Flat-ccs tests
>   * Functionality: ccs-evict
> diff --git a/tests/intel/xe_exec_atomic.c b/tests/intel/xe_exec_atomic.c
> index 4eff16f7a..67017d9e1 100644
> --- a/tests/intel/xe_exec_atomic.c
> +++ b/tests/intel/xe_exec_atomic.c
> @@ -14,7 +14,7 @@
>  
>  /**
>   * TEST: Tests to verify atomic functionality.
> - * Category: Software building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: HW
>   * Functionality: intel-bb
> diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
> index 9d4de3206..a6dbd748b 100644
> --- a/tests/intel/xe_exec_balancer.c
> +++ b/tests/intel/xe_exec_balancer.c
> @@ -5,7 +5,7 @@
>  
>  /**
>   * TEST: Basic tests for execbuf functionality for virtual and parallel exec_queues
> - * Category: Hardware building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: virtual and parallel exec_queues
> diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
> index 238785c38..0fd1ae062 100644
> --- a/tests/intel/xe_exec_basic.c
> +++ b/tests/intel/xe_exec_basic.c
> @@ -5,7 +5,7 @@
>  
>  /**
>   * TEST: Basic tests for execbuf functionality
> - * Category: Hardware building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: exec_queues
> diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
> index 13265b9c0..389de7ca4 100644
> --- a/tests/intel/xe_exec_compute_mode.c
> +++ b/tests/intel/xe_exec_compute_mode.c
> @@ -5,7 +5,7 @@
>  
>  /**
>   * TEST: Basic tests for execbuf compute machine functionality
> - * Category: Hardware building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: compute test
> diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
> index f3d2e07ec..e8eb9e3e8 100644
> --- a/tests/intel/xe_exec_fault_mode.c
> +++ b/tests/intel/xe_exec_fault_mode.c
> @@ -5,7 +5,7 @@
>  
>  /**
>   * TEST: Basic tests for execbuf functionality for virtual and parallel exec_queues
> - * Category: Hardware building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: fault mode
> diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
> index 6df9815ad..3edab0af5 100644
> --- a/tests/intel/xe_exec_queue_property.c
> +++ b/tests/intel/xe_exec_queue_property.c
> @@ -5,7 +5,7 @@
>  
>  /**
>   * TEST: Basic tests to check exec_queue set/get property functionality
> - * Category: Software building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: uapi
>   * Functionality: exec queue set property
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 291ca4942..e47c3730d 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -5,7 +5,7 @@
>  
>  /**
>   * TEST: Basic tests for execbuf functionality for virtual and parallel exec_queues
> - * Category: Hardware building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: reset
> diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
> index 4d4495791..c872c22d5 100644
> --- a/tests/intel/xe_exec_store.c
> +++ b/tests/intel/xe_exec_store.c
> @@ -14,7 +14,7 @@
>  
>  /**
>   * TEST: Tests to verify store dword functionality.
> - * Category: Software building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: intel-bb
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> index 0c6150480..e7a0a7cd0 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -5,7 +5,7 @@
>  
>  /**
>   * TEST: Basic tests for execbuf functionality
> - * Category: Hardware building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: multi-threads
> diff --git a/tests/intel/xe_exercise_blt.c b/tests/intel/xe_exercise_blt.c
> index 1b86e9757..4ce97044e 100644
> --- a/tests/intel/xe_exercise_blt.c
> +++ b/tests/intel/xe_exercise_blt.c
> @@ -14,7 +14,7 @@
>  
>  /**
>   * TEST: xe exercise blt
> - * Category: Hardware building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Blitter tests
>   * Functionality: flat_ccs
> diff --git a/tests/intel/xe_gpgpu_fill.c b/tests/intel/xe_gpgpu_fill.c
> index 1d2aafbf2..24fab519c 100644
> --- a/tests/intel/xe_gpgpu_fill.c
> +++ b/tests/intel/xe_gpgpu_fill.c
> @@ -5,7 +5,7 @@
>  
>  /**
>   * TEST: Basic tests for gpgpu functionality
> - * Category: Software building block
> + * Category: Core
>   * Mega feature: Compute
>   * Sub-category: GPGPU tests
>   * Functionality: gpgpu_fill
> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> index cb6eaba09..ff99b46a0 100644
> --- a/tests/intel/xe_gt_freq.c
> +++ b/tests/intel/xe_gt_freq.c
> @@ -5,7 +5,7 @@
>  
>  /**
>   * TEST: Test Xe GT frequency request functionality
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: Power management
>   * Sub-category: Power management tests
>   * Functionality: frequency request
> diff --git a/tests/intel/xe_huc_copy.c b/tests/intel/xe_huc_copy.c
> index 692278cb5..6d8ca0776 100644
> --- a/tests/intel/xe_huc_copy.c
> +++ b/tests/intel/xe_huc_copy.c
> @@ -5,7 +5,7 @@
>  
>  /**
>   * TEST: Test HuC copy firmware.
> - * Category: Firmware building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Firmware tests
>   * Functionality: huc copy
> diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
> index c712d04ba..5dd794b18 100644
> --- a/tests/intel/xe_intel_bb.c
> +++ b/tests/intel/xe_intel_bb.c
> @@ -27,7 +27,7 @@
>  
>  /**
>   * TEST: Basic tests for intel-bb xe functionality
> - * Category: Software building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: IGT Lib
>   * Functionality: intel-bb
> diff --git a/tests/intel/xe_live_ktest.c b/tests/intel/xe_live_ktest.c
> index f3380dc98..4376d5df7 100644
> --- a/tests/intel/xe_live_ktest.c
> +++ b/tests/intel/xe_live_ktest.c
> @@ -4,7 +4,7 @@
>  /**
>   * TEST: Xe driver live kunit tests
>   * Description: Xe driver live dmabuf unit tests
> - * Category: Software building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: kunit
>   * Functionality: kunit test
> diff --git a/tests/intel/xe_media_fill.c b/tests/intel/xe_media_fill.c
> index 1adafee4f..7fc3c187e 100644
> --- a/tests/intel/xe_media_fill.c
> +++ b/tests/intel/xe_media_fill.c
> @@ -28,7 +28,7 @@
>  /**
>   * TEST: xe media fill
>   * Description: Basic tests for the media_fill() function.
> - * Category: Hardware building block
> + * Category: Core
>   * Mega feature: Media
>   * Sub-category: Media tests
>   * Functionality: fill surface with media block
> diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
> index 353d157da..fc5d73d59 100644
> --- a/tests/intel/xe_mmap.c
> +++ b/tests/intel/xe_mmap.c
> @@ -5,7 +5,7 @@
>  
>  /**
>   * TEST: Test if the driver is capable of doing mmap on different memory regions
> - * Category: Software building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Memory management tests
>   * Functionality: mmap
> diff --git a/tests/intel/xe_module_load.c b/tests/intel/xe_module_load.c
> index ce63ab106..83f7df341 100644
> --- a/tests/intel/xe_module_load.c
> +++ b/tests/intel/xe_module_load.c
> @@ -5,7 +5,7 @@
>  
>  /**
>   * TEST: Tests the xe module loading
> - * Category: Software building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: driver
>   * Functionality: module load
> diff --git a/tests/intel/xe_noexec_ping_pong.c b/tests/intel/xe_noexec_ping_pong.c
> index 9024623d9..609e05876 100644
> --- a/tests/intel/xe_noexec_ping_pong.c
> +++ b/tests/intel/xe_noexec_ping_pong.c
> @@ -17,7 +17,7 @@
>  
>  /**
>   * TEST: Expose compute VM's unnecessary rebinds
> - * Category: Hardware building block
> + * Category: Core
>   * Mega feature: Compute
>   * Sub-category: Compute tests
>   * Functionality: VM rebind
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index a48cd084b..fe6a367aa 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -5,7 +5,7 @@
>  
>  /**
>   * TEST: Test for selecting per-VMA pat_index
> - * Category: Software building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: VMA
>   * Functionality: pat_index
> diff --git a/tests/intel/xe_peer2peer.c b/tests/intel/xe_peer2peer.c
> index 59ea9964b..6ff4774bb 100644
> --- a/tests/intel/xe_peer2peer.c
> +++ b/tests/intel/xe_peer2peer.c
> @@ -18,7 +18,7 @@
>  /**
>   * TEST: xe_peer2peer
>   * Description: Peer2peer dma buf copy tests
> - * Category: Hardware building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: MultiGPU
>   * Functionality: dma buf copy
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index b4a8c4d15..a7b1aacd9 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -5,7 +5,7 @@
>  
>  /**
>   * TEST: Check Power Management functionality
> - * Category: Software building block
> + * Category: Core
>   * Mega feature: Power management
>   * Sub-category: Power management tests
>   * Test category: functionality test
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> index d58ebe804..367b1027c 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -5,7 +5,7 @@
>  
>  /**
>   * TEST: Test gtidle properties
> - * Category: Software building block
> + * Category: Core
>   * Mega feature: Power management
>   * Sub-category: Power management tests
>   * Functionality: GT C States
> diff --git a/tests/intel/xe_prime_self_import.c b/tests/intel/xe_prime_self_import.c
> index 10a393811..ba1718022 100644
> --- a/tests/intel/xe_prime_self_import.c
> +++ b/tests/intel/xe_prime_self_import.c
> @@ -27,7 +27,7 @@
>  
>  /**
>   * TEST: Check whether prime import/export works on the same device
> - * Category: Software building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: DRM
>   * Functionality: prime import/export
> diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
> index de2b13818..adb04a346 100644
> --- a/tests/intel/xe_query.c
> +++ b/tests/intel/xe_query.c
> @@ -5,7 +5,7 @@
>  
>  /**
>   * TEST: Check device configuration query
> - * Category: Software building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: uapi
>   * Functionality: ioctl
> @@ -178,7 +178,7 @@ const char *get_topo_name(int value)
>   *
>   * SUBTEST: multigpu-query-engines
>   * Description: Display engine classes available for all Xe devices.
> - * Category: Hardware building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: MultiGPU
>   * Test category: functionality test
> @@ -207,7 +207,7 @@ test_query_engines(int fd)
>   *
>   * SUBTEST: multigpu-query-mem-usage
>   * Description: Display memory information for all Xe devices.
> - * Category: Hardware building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: MultiGPU
>   * Test category: functionality test
> @@ -273,7 +273,7 @@ test_query_mem_regions(int fd)
>   *
>   * SUBTEST: multigpu-query-gt-list
>   * Description: Display information about GT components for all Xe devices.
> - * Category: Hardware building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: MultiGPU
>   * Test category: functionality test
> @@ -345,7 +345,7 @@ test_query_gt_list(int fd)
>   *
>   * SUBTEST: multigpu-query-topology
>   * Description: Display topology information of GT for all Xe devices.
> - * Category: Hardware building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: MultiGPU
>   * Test category: functionality test
> @@ -396,7 +396,7 @@ test_query_gt_topology(int fd)
>   *
>   * SUBTEST: multigpu-query-config
>   * Description: Display config information for all Xe devices.
> - * Category: Hardware building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: MultiGPU
>   * Test category: functionality test
> @@ -452,7 +452,7 @@ test_query_config(int fd)
>   *
>   * SUBTEST: multigpu-query-hwconfig
>   * Description: Display hardware configuration for all Xe devices.
> - * Category: Hardware building block
> + * Category: Core
>   * Sub-category: MultiGPU
>   * Mega feature: General Core features
>   * Test category: functionality test
> @@ -493,7 +493,7 @@ test_query_hwconfig(int fd)
>   *
>   * SUBTEST: multigpu-query-invalid-query
>   * Description: Check query with invalid arguments for all Xe devices.
> - * Category: Hardware building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: MultiGPU
>   * Test category: negative test
> @@ -518,7 +518,7 @@ test_query_invalid_query(int fd)
>   *
>   * SUBTEST: multigpu-query-invalid-size
>   * Description: Check query with invalid size for all Xe devices.
> - * Category: Hardware building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: MultiGPU
>   * Test category: negative test
> @@ -543,7 +543,7 @@ test_query_invalid_size(int fd)
>   *
>   * SUBTEST: multigpu-query-invalid-extension
>   * Description: Check query with invalid extension for all Xe devices.
> - * Category: Hardware building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: MultiGPU
>   * Test category: negative test
> @@ -709,7 +709,7 @@ __engine_cycles(int fd, struct drm_xe_engine_class_instance *hwe)
>   *
>   * SUBTEST: multigpu-query-cs-cycles
>   * Description: Query CPU-GPU timestamp correlation for all Xe devices.
> - * Category: Hardware building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: MultiGPU
>   */
> @@ -731,7 +731,7 @@ static void test_query_engine_cycles(int fd)
>   *
>   * SUBTEST: multigpu-query-invalid-cs-cycles
>   * Description: Check query with invalid arguments for all Xe devices.
> - * Category: Hardware building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: MultiGPU
>   */
> diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
> index 978441afa..ffe5f7ef1 100644
> --- a/tests/intel/xe_render_copy.c
> +++ b/tests/intel/xe_render_copy.c
> @@ -17,7 +17,7 @@
>  
>  /**
>   * TEST: Copy memory using 3d engine
> - * Category: Software building block
> + * Category: Core
>   * Mega feature: Render
>   * Sub-category: 3d
>   * Functionality: render_copy
> diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
> index 66ed0b77e..4e95060d3 100644
> --- a/tests/intel/xe_spin_batch.c
> +++ b/tests/intel/xe_spin_batch.c
> @@ -8,7 +8,7 @@
>  
>  /**
>   * TEST: Tests for spin batch submissons.
> - * Category: Software building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: IGT Lib
>   * Functionality: parallel execution
> diff --git a/tests/intel/xe_sysfs_defaults.c b/tests/intel/xe_sysfs_defaults.c
> index dd975c5bb..1777158d5 100644
> --- a/tests/intel/xe_sysfs_defaults.c
> +++ b/tests/intel/xe_sysfs_defaults.c
> @@ -6,7 +6,7 @@
>  /**
>   * TEST: xe sysfs defaults
>   * Description: check if the sysfs engine .defaults node has all values.
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: SysMan
>   * Sub-category: SysMan tests
>   * Functionality: sysman defaults
> diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_scheduler.c
> index 5c4fb1114..979ce95d2 100644
> --- a/tests/intel/xe_sysfs_scheduler.c
> +++ b/tests/intel/xe_sysfs_scheduler.c
> @@ -5,7 +5,7 @@
>  
>  /**
>   * TEST: xe sysfs scheduler
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: SysMan
>   * Sub-category: SysMan tests
>   * Functionality: scheduler control interface
> diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
> index 6651c1207..89c6c7ef6 100644
> --- a/tests/intel/xe_test_config.json
> +++ b/tests/intel/xe_test_config.json
> @@ -27,8 +27,7 @@
>              },
>              "Category": {
>                  "_properties_": {
> -                    "mandatory": true,
> -                    "description": "Contains the major group for the tested functionality, being hardware, software or firmware"
> +                    "description": "Contains the major group for the tested functionality 'Core'"
>                  },
>                  "Mega feature": {
>                      "_properties_": {
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index b2cfca235..a4f6c7a0b 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -5,7 +5,7 @@
>  
>  /**
>   * TEST: Check if VMA functionality is working
> - * Category: Software building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: VMA
>   */
> diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
> index 6916694f9..cf4e73368 100644
> --- a/tests/intel/xe_waitfence.c
> +++ b/tests/intel/xe_waitfence.c
> @@ -15,7 +15,7 @@
>  
>  /**
>   * TEST: Check if waitfences work
> - * Category: Software building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Synchronization
>   * Functionality: waitfence
> @@ -140,7 +140,7 @@ waitfence(int fd, enum waittype wt)
>  
>  /**
>   * TEST: Negative test for wait ufence ioctl
> - * Category: Software building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Synchronization
>   * Functionality: waitfence
> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> index f5c6fa5a8..aa4a452bf 100644
> --- a/tests/intel/xe_wedged.c
> +++ b/tests/intel/xe_wedged.c
> @@ -5,7 +5,7 @@
>  
>  /**
>   * TEST: cause fake gt reset failure which put Xe device in wedged state
> - * Category: Software building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: driver
>   * Functionality: wedged
> diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
> index 8cea7f584..79ea12b5c 100644
> --- a/tests/prime_vgem.c
> +++ b/tests/prime_vgem.c
> @@ -33,7 +33,7 @@
>  /**
>   * TEST: prime vgem
>   * Description: Basic check of polling for prime/vgem fences.
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Core
>   * Functionality: mock device
> diff --git a/tests/sriov_basic.c b/tests/sriov_basic.c
> index 74f1ce41d..95a462709 100644
> --- a/tests/sriov_basic.c
> +++ b/tests/sriov_basic.c
> @@ -11,7 +11,7 @@ IGT_TEST_DESCRIPTION("Basic tests for enabling SR-IOV Virtual Functions");
>  
>  /**
>   * TEST: sriov_basic
> - * Category: Software building block
> + * Category: Core
>   * Mega feature: SR-IOV
>   * Sub-category: VFs enabling
>   * Functionality: configure / enable VFs
> diff --git a/tests/sw_sync.c b/tests/sw_sync.c
> index e01397460..fbb24e8ac 100644
> --- a/tests/sw_sync.c
> +++ b/tests/sw_sync.c
> @@ -41,7 +41,7 @@
>  /**
>   * TEST: sw sync
>   * Description: Test SW Sync Framework
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Synchronization
>   * Functionality: semaphore
> diff --git a/tests/syncobj_basic.c b/tests/syncobj_basic.c
> index 9e905a939..8a4416fff 100644
> --- a/tests/syncobj_basic.c
> +++ b/tests/syncobj_basic.c
> @@ -29,7 +29,7 @@
>  /**
>   * TEST: syncobj basic
>   * Description: Basic check for drm sync objects.
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Synchronization
>   * Functionality: semaphore
> diff --git a/tests/syncobj_eventfd.c b/tests/syncobj_eventfd.c
> index e89dfa414..a4a73f251 100644
> --- a/tests/syncobj_eventfd.c
> +++ b/tests/syncobj_eventfd.c
> @@ -13,7 +13,7 @@
>  
>  /**
>   * TEST: syncobj eventfd
> - * Category: Infrastructure
> + * Category: Core
>   * Description: Tests for the drm sync object eventfd API
>   * Feature: synchronization
>   * Functionality: semaphore
> diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
> index e9c3ac740..96d5d8b45 100644
> --- a/tests/syncobj_timeline.c
> +++ b/tests/syncobj_timeline.c
> @@ -33,7 +33,7 @@
>  /**
>   * TEST: syncobj timeline
>   * Description: Tests for the drm timeline sync object API
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Synchronization
>   * Functionality: semaphore
> diff --git a/tests/syncobj_wait.c b/tests/syncobj_wait.c
> index 26fce89fe..be7e67163 100644
> --- a/tests/syncobj_wait.c
> +++ b/tests/syncobj_wait.c
> @@ -33,7 +33,7 @@
>  /**
>   * TEST: syncobj wait
>   * Description: Tests for the drm sync object wait API
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Synchronization
>   * Functionality: semaphore
> diff --git a/tests/vgem_basic.c b/tests/vgem_basic.c
> index 07ba5dcb3..f30722bbe 100644
> --- a/tests/vgem_basic.c
> +++ b/tests/vgem_basic.c
> @@ -34,7 +34,7 @@
>  /**
>   * TEST: vgem basic
>   * Description: Basic sanity check of Virtual GEM module (vGEM).
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Core
>   * Functionality: mock device
> diff --git a/tests/vgem_slow.c b/tests/vgem_slow.c
> index 2de512754..3ce0f811e 100644
> --- a/tests/vgem_slow.c
> +++ b/tests/vgem_slow.c
> @@ -33,7 +33,7 @@
>  /**
>   * TEST: vgem slow
>   * Description: Extended sanity check of Virtual GEM module (vGEM).
> - * Category: Infrastructure
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Core
>   * Functionality: mock device
> -- 
> 2.34.1
> 
