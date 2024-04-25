Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A674C10F15
	for <igt-dev@archiver.kernel.org>; Thu, 25 Apr 2024 17:29:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4AEE11A6BA;
	Thu, 25 Apr 2024 17:29:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OomNZP3J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D43911A6BA
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2024 17:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714066158; x=1745602158;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=N9Kx81yCB2RfnW114exBoX/EVtmBtgdKaZCip0Y4TD8=;
 b=OomNZP3JR/Bl8QQtaO+bxwOlcuG3F/YDB4dbGA87jWRyBTBFAbH40jim
 bpWaLz45OC0oEh0c40hPZ6NA0MrDNZ6/BcTBrBF3dAUs57QUa+FhY0nkO
 G+Az0Ef6c2eM+8+0vSKsoyjiRGvoor76cN4Lo+HuimEWZS5jK1QLSLlH8
 aye/gDIGkbq3PeZxVWvJDD0oZmuJ4q3yi6uRxFkhadRtKJ7qtItBBpwJv
 yoX5/rFkJbDnYttvQMzfyPq4Xvg/NytvYx+cu0EmdN9wuuOis/ziBHzPW
 3gqf36jZfsrs3551GncYkUHoseods0qG58eb3FnlTWARUXoizufowFD5E w==;
X-CSE-ConnectionGUID: jpirgQi1SJOCBpj7oJlPTA==
X-CSE-MsgGUID: FCpBNtchRTW0237yPnyiEg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9620988"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="9620988"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 10:29:18 -0700
X-CSE-ConnectionGUID: aQf30xpGRz2GgO72BmtKjQ==
X-CSE-MsgGUID: sqCTAsFAT4Wq1t3IE7K2Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="25558934"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 10:29:16 -0700
Date: Thu, 25 Apr 2024 19:29:13 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
Subject: Re: [PATCH i-g-t v2 00/16] Introduce Mega feature to Xe and i915 tests
Message-ID: <20240425172913.vjbvnyfgtie4dueq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
References: <20240423104913.3559587-1-katarzyna.piecielska@intel.com>
 <20240425173605.7a701d61@maurocar-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240425173605.7a701d61@maurocar-mobl2>
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

Hi,

On 2024-04-25 at 17:36:05 +0200, Mauro Carvalho Chehab wrote:
> On Tue, 23 Apr 2024 10:48:57 +0000
> Katarzyna Piecielska <katarzyna.piecielska@intel.com> wrote:
> 
> > After Xe and i915 test documentation alignment there is now time to
> > add Mega feature field. After live review of v1 we decided to reduce
> > number of Mega feature values:
> > 
> >  - General Core features will cover:
> > 	legacy and DRIVER_ANY tests
> > 	legacy and DRIVER_INTEL i915 tests
> > 	general Xe tests
> > 	Blitter tests
> > 	Command Submission tests
> > 	Memory management tests, VMA,
> >  - Compute
> > 	Compute tests
> > 	GPGPU tests
> >  - Compression
> > 	FlatCCS tests
> >  - Media
> > 	Media tests
> >  - Performance interface
> > 	Performance interface tests
> >  - Power management
> > 	Power management tests
> >  - RAS
> > 	RAS tests
> >  - Render
> > 	Render copy, 3d
> >  - SysMan
> > 	SysMan tests
> > 
> > Also adding missing Mega feature to Display tests: General Display
> > Features.
> 
> Those are the feature-mapping warnings after applying this series
> 
> - for Xe:
> 
> WARNING: feature Blitter has multiple parents: Hardware building block and Software building block
> WARNING: feature Power management has multiple parents: Infrastructure and Software building block
> WARNING: feature driver has multiple parents: Software building block and Hardware building block
> WARNING: feature RAS has multiple parents: Software Building Block and Hardware building block
> WARNING: feature CMD submission has multiple parents: Hardware building block and Software building block
> WARNING: feature MultiGPU has multiple parents: Hardware building block and Software building block
> WARNING: feature compute is duplicated at Functionality and Sub-category
> WARNING: feature compute has multiple parents: CMD submission and Hardware building block
> WARNING: feature compute has multiple hierarchical levels: 3 and 2
> 

As for 'compute' here is what a script founds:

$ grep compute c.*

c.Functionality:computeYtest
c.Mega.feature:compute
c.Sub-category:computeYtests

where space is replaced by 'Y'. Btw 'compute tests' and 'compute test' is
very misleading and could be error prone, maybe rename to some other term?

> - for i915:
> 
> WARNING: feature CMD submission has multiple parents: None and Infrastructure
> WARNING: feature CMD submission has multiple hierarchical levels: 1 and 2

'None' here and below looks a little strange.

Regards,
Kamil

> WARNING: feature Memory management has multiple parents: Server and None
> WARNING: feature Memory management has multiple hierarchical levels: 2 and 1
> WARNING: feature Power management has multiple parents: Firmware and None
> WARNING: feature Power management has multiple hierarchical levels: 2 and 1
> WARNING: feature SysMan has multiple parents: None and Desktop \ Server
> WARNING: feature SysMan has multiple hierarchical levels: 1 and 2
> WARNING: feature uapi has multiple parents: Infrastructure and None
> WARNING: feature uapi has multiple hierarchical levels: 2 and 1
> WARNING: feature driver handler has multiple parents: CMD submission and driver
> WARNING: feature buffer management has multiple parents: Memory management and DRM
> WARNING: feature Blitter is duplicated at Functionality and Sub-category
> WARNING: feature Blitter has multiple parents: blitter and None
> WARNING: feature Blitter has multiple hierarchical levels: 2 and 1
> WARNING: feature Context has multiple parents: Desktop client and Infrastructure
> WARNING: feature Performance has multiple parents: Server and None
> WARNING: feature Performance has multiple hierarchical levels: 2 and 1
> WARNING: feature Display has multiple parents: None and Selftest
> WARNING: feature Display has multiple hierarchical levels: 1 and 2
> WARNING: feature CMD Submission has multiple parents: None and Selftest
> WARNING: feature CMD Submission has multiple hierarchical levels: 1 and 2
> WARNING: feature SR-IOV has multiple parents: Desktop \ Server and HW
> WARNING: feature driver has multiple parents: Infrastructure and None
> WARNING: feature driver has multiple hierarchical levels: 2 and 1
> WARNING: feature DRM has multiple parents: Desktop client and Infrastructure
> 
> > 
> > Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> > Cc: Aditya Chauhan <aditya.chauhan@intel.com>
> > Cc: Girotra Himanshu <himanshu.girotra@intel.com>
> > CC: Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
> > 
> > Katarzyna Piecielska (16):
> >   tests/intel: Introduce General Core Mega feature
> >   tests: Add Memory management tests to General Core Mega feature
> >   tests/intel: Add Blitter tests to General Core Mega feature
> >   tests/intel: Introduce Power management Mega feature
> >   tests/intel: Introduce Compute Mega feature
> >   tests: Add DRIVER_ANY tests to General Core Mega feature
> >   tests/intel: Add legacy i915 tests to General Core Mega feature
> >   tests/intel: Introduce SysMan Mega feature
> >   tests/intel: Add general XE tests to General Core Mega feature
> >   tests/intel: Introduce Performance Mega feature
> >   tests/intel: Introduce Compression Mega feature
> >   tests/intel: Introduce Render Mega feature
> >   tests/intel: Add GPGPU tests to Compute Mega feature
> >   tests/intel: Introduce Media Mega feature
> >   tests/intel: Introduce RAS Mega feature
> >   tests/intel: Add display tests to General Display Features
> > 
> >  tests/core_auth.c                            |   7 +-
> >  tests/core_getclient.c                       |   7 +-
> >  tests/core_getstats.c                        |   7 +-
> >  tests/core_getversion.c                      |   7 +-
> >  tests/core_hotunplug.c                       |   5 +-
> >  tests/core_setmaster.c                       |   7 +-
> >  tests/core_setmaster_vs_auth.c               |   7 +-
> >  tests/device_reset.c                         |  11 +-
> >  tests/dmabuf.c                               |   4 +-
> >  tests/drm_mm.c                               |   5 +-
> >  tests/dumb_buffer.c                          |   7 +-
> >  tests/intel/api_intel_allocator.c            |   5 +-
> >  tests/intel/api_intel_bb.c                   |   7 +-
> >  tests/intel/debugfs_test.c                   |   5 +-
> >  tests/intel/drm_fdinfo.c                     |   7 +-
> >  tests/intel/gem_bad_reloc.c                  |   5 +-
> >  tests/intel/gem_barrier_race.c               |   1 +
> >  tests/intel/gem_basic.c                      |   5 +-
> >  tests/intel/gem_blits.c                      |   5 +-
> >  tests/intel/gem_busy.c                       |   3 +-
> >  tests/intel/gem_caching.c                    |   7 +-
> >  tests/intel/gem_ccs.c                        |   5 +-
> >  tests/intel/gem_close.c                      |   5 +-
> >  tests/intel/gem_close_race.c                 |   5 +-
> >  tests/intel/gem_compute.c                    |   5 +-
> >  tests/intel/gem_create.c                     |   5 +-
> >  tests/intel/gem_cs_tlb.c                     |   7 +-
> >  tests/intel/gem_ctx_bad_destroy.c            |   7 +-
> >  tests/intel/gem_ctx_create.c                 |   5 +-
> >  tests/intel/gem_ctx_engines.c                |   5 +-
> >  tests/intel/gem_ctx_exec.c                   |   5 +-
> >  tests/intel/gem_ctx_freq.c                   |   5 +-
> >  tests/intel/gem_ctx_isolation.c              |   5 +-
> >  tests/intel/gem_ctx_param.c                  |   5 +-
> >  tests/intel/gem_ctx_persistence.c            |   5 +-
> >  tests/intel/gem_ctx_shared.c                 |   5 +-
> >  tests/intel/gem_ctx_sseu.c                   |   5 +-
> >  tests/intel/gem_ctx_switch.c                 |   1 +
> >  tests/intel/gem_eio.c                        |   5 +-
> >  tests/intel/gem_evict_alignment.c            |   3 +-
> >  tests/intel/gem_evict_everything.c           |   3 +-
> >  tests/intel/gem_exec_alignment.c             |   7 +-
> >  tests/intel/gem_exec_async.c                 |   5 +-
> >  tests/intel/gem_exec_await.c                 |   5 +-
> >  tests/intel/gem_exec_balancer.c              |   5 +-
> >  tests/intel/gem_exec_basic.c                 |   5 +-
> >  tests/intel/gem_exec_big.c                   |   3 +-
> >  tests/intel/gem_exec_capture.c               |   5 +-
> >  tests/intel/gem_exec_create.c                |   5 +-
> >  tests/intel/gem_exec_endless.c               |   1 +
> >  tests/intel/gem_exec_fair.c                  |   5 +-
> >  tests/intel/gem_exec_fence.c                 |   5 +-
> >  tests/intel/gem_exec_flush.c                 |   1 +
> >  tests/intel/gem_exec_gttfill.c               |   5 +-
> >  tests/intel/gem_exec_latency.c               |   3 +-
> >  tests/intel/gem_exec_lut_handle.c            |   3 +-
> >  tests/intel/gem_exec_nop.c                   |   5 +-
> >  tests/intel/gem_exec_parallel.c              |   6 +-
> >  tests/intel/gem_exec_params.c                |   5 +-
> >  tests/intel/gem_exec_reloc.c                 |   3 +-
> >  tests/intel/gem_exec_schedule.c              |   5 +-
> >  tests/intel/gem_exec_store.c                 |   7 +-
> >  tests/intel/gem_exec_suspend.c               |   5 +-
> >  tests/intel/gem_exec_whisper.c               |   3 +-
> >  tests/intel/gem_exercise_blt.c               |   5 +-
> >  tests/intel/gem_fd_exhaustion.c              |   3 +-
> >  tests/intel/gem_fence_thrash.c               |   5 +-
> >  tests/intel/gem_fence_upload.c               |   3 +-
> >  tests/intel/gem_fenced_exec_thrash.c         |   1 +
> >  tests/intel/gem_flink_basic.c                |   7 +-
> >  tests/intel/gem_flink_race.c                 |   7 +-
> >  tests/intel/gem_gpgpu_fill.c                 |   3 +-
> >  tests/intel/gem_gtt_cpu_tlb.c                |   8 +-
> >  tests/intel/gem_gtt_hog.c                    |   3 +-
> >  tests/intel/gem_gtt_speed.c                  |   3 +-
> >  tests/intel/gem_huc_copy.c                   |   7 +-
> >  tests/intel/gem_linear_blits.c               |   7 +-
> >  tests/intel/gem_lmem_evict.c                 |   5 +-
> >  tests/intel/gem_lmem_swapping.c              |   7 +-
> >  tests/intel/gem_lut_handle.c                 |   3 +-
> >  tests/intel/gem_madvise.c                    |   7 +-
> >  tests/intel/gem_media_fill.c                 |   7 +-
> >  tests/intel/gem_media_vme.c                  |   5 +-
> >  tests/intel/gem_mmap.c                       |   7 +-
> >  tests/intel/gem_mmap_gtt.c                   |   5 +-
> >  tests/intel/gem_mmap_offset.c                |   5 +-
> >  tests/intel/gem_mmap_wc.c                    |   5 +-
> >  tests/intel/gem_partial_pwrite_pread.c       |   5 +-
> >  tests/intel/gem_pipe_control_store_loop.c    |   5 +-
> >  tests/intel/gem_ppgtt.c                      |   5 +-
> >  tests/intel/gem_pread.c                      |   5 +-
> >  tests/intel/gem_pread_after_blit.c           |   3 +-
> >  tests/intel/gem_pwrite.c                     |   3 +-
> >  tests/intel/gem_pwrite_snooped.c             |   1 +
> >  tests/intel/gem_pxp.c                        |   7 +-
> >  tests/intel/gem_read_read_speed.c            |   3 +-
> >  tests/intel/gem_readwrite.c                  |   5 +-
> >  tests/intel/gem_reg_read.c                   |   5 +-
> >  tests/intel/gem_render_copy.c                |   5 +-
> >  tests/intel/gem_render_copy_redux.c          |   3 +-
> >  tests/intel/gem_render_linear_blits.c        |   5 +-
> >  tests/intel/gem_render_tiled_blits.c         |   5 +-
> >  tests/intel/gem_request_retire.c             |   7 +-
> >  tests/intel/gem_reset_stats.c                |   5 +-
> >  tests/intel/gem_ringfill.c                   |   7 +-
> >  tests/intel/gem_set_tiling_vs_blt.c          |   7 +-
> >  tests/intel/gem_set_tiling_vs_gtt.c          |   5 +-
> >  tests/intel/gem_set_tiling_vs_pwrite.c       |   5 +-
> >  tests/intel/gem_shrink.c                     |   3 +-
> >  tests/intel/gem_softpin.c                    |   7 +-
> >  tests/intel/gem_spin_batch.c                 |   7 +-
> >  tests/intel/gem_streaming_writes.c           |   3 +-
> >  tests/intel/gem_stress.c                     |   1 +
> >  tests/intel/gem_sync.c                       |   7 +-
> >  tests/intel/gem_tiled_blits.c                |   5 +-
> >  tests/intel/gem_tiled_fence_blits.c          |   5 +-
> >  tests/intel/gem_tiled_partial_pwrite_pread.c |   5 +-
> >  tests/intel/gem_tiled_pread_basic.c          |   5 +-
> >  tests/intel/gem_tiled_pread_pwrite.c         |   5 +-
> >  tests/intel/gem_tiled_swapping.c             |   5 +-
> >  tests/intel/gem_tiled_wb.c                   |   5 +-
> >  tests/intel/gem_tiled_wc.c                   |   5 +-
> >  tests/intel/gem_tiling_max_stride.c          |   5 +-
> >  tests/intel/gem_unfence_active_buffers.c     |   5 +-
> >  tests/intel/gem_unref_active_buffers.c       |   7 +-
> >  tests/intel/gem_userptr_blits.c              |   5 +-
> >  tests/intel/gem_vm_create.c                  |   3 +-
> >  tests/intel/gem_wait.c                       |   9 +-
> >  tests/intel/gem_watchdog.c                   |   5 +-
> >  tests/intel/gem_workarounds.c                |   5 +-
> >  tests/intel/gen3_mixed_blits.c               |   1 +
> >  tests/intel/gen3_render_linear_blits.c       |   1 +
> >  tests/intel/gen3_render_mixed_blits.c        |   1 +
> >  tests/intel/gen3_render_tiledx_blits.c       |   1 +
> >  tests/intel/gen3_render_tiledy_blits.c       |   1 +
> >  tests/intel/gen7_exec_parse.c                |   3 +-
> >  tests/intel/gen9_exec_parse.c                |   7 +-
> >  tests/intel/i915_fb_tiling.c                 |   5 +-
> >  tests/intel/i915_getparams_basic.c           |   7 +-
> >  tests/intel/i915_hangman.c                   |   7 +-
> >  tests/intel/i915_module_load.c               |   7 +-
> >  tests/intel/i915_pciid.c                     |   7 +-
> >  tests/intel/i915_pipe_stress.c               |   4 +-
> >  tests/intel/i915_pm_freq_api.c               |   1 +
> >  tests/intel/i915_pm_freq_mult.c              |   7 +-
> >  tests/intel/i915_pm_rc6_residency.c          |   7 +-
> >  tests/intel/i915_pm_rpm.c                    |   7 +-
> >  tests/intel/i915_pm_rps.c                    |   7 +-
> >  tests/intel/i915_pm_sseu.c                   |   5 +-
> >  tests/intel/i915_power.c                     |   7 +-
> >  tests/intel/i915_query.c                     |   7 +-
> >  tests/intel/i915_selftest.c                  | 370 +++++++++++--------
> >  tests/intel/i915_suspend.c                   |   8 +-
> >  tests/intel/intel_hwmon.c                    |   3 +-
> >  tests/intel/perf.c                           |   7 +-
> >  tests/intel/perf_pmu.c                       |   7 +-
> >  tests/intel/prime_busy.c                     |   7 +-
> >  tests/intel/prime_mmap.c                     |   7 +-
> >  tests/intel/prime_mmap_coherency.c           |   7 +-
> >  tests/intel/prime_mmap_kms.c                 |   5 +-
> >  tests/intel/prime_self_import.c              |   7 +-
> >  tests/intel/sysfs_defaults.c                 |   5 +-
> >  tests/intel/sysfs_heartbeat_interval.c       |   7 +-
> >  tests/intel/sysfs_preempt_timeout.c          |   7 +-
> >  tests/intel/sysfs_timeslice_duration.c       |   7 +-
> >  tests/intel/xe_ccs.c                         |   3 +-
> >  tests/intel/xe_compute.c                     |   3 +-
> >  tests/intel/xe_compute_preempt.c             |   3 +-
> >  tests/intel/xe_copy_basic.c                  |   3 +-
> >  tests/intel/xe_create.c                      |   1 +
> >  tests/intel/xe_debugfs.c                     |   3 +-
> >  tests/intel/xe_dma_buf_sync.c                |   1 +
> >  tests/intel/xe_drm_fdinfo.c                  |   3 +-
> >  tests/intel/xe_evict.c                       |   2 +
> >  tests/intel/xe_evict_ccs.c                   |   3 +-
> >  tests/intel/xe_exec_atomic.c                 |   1 +
> >  tests/intel/xe_exec_balancer.c               |   2 +-
> >  tests/intel/xe_exec_basic.c                  |   1 +
> >  tests/intel/xe_exec_compute_mode.c           |   1 +
> >  tests/intel/xe_exec_fault_mode.c             |   1 +
> >  tests/intel/xe_exec_queue_property.c         |   1 +
> >  tests/intel/xe_exec_reset.c                  |   5 +-
> >  tests/intel/xe_exec_store.c                  |   1 +
> >  tests/intel/xe_exec_threads.c                |   1 +
> >  tests/intel/xe_exercise_blt.c                |   3 +-
> >  tests/intel/xe_gpgpu_fill.c                  |   3 +-
> >  tests/intel/xe_gt_freq.c                     |   3 +-
> >  tests/intel/xe_huc_copy.c                    |   1 +
> >  tests/intel/xe_intel_bb.c                    |   1 +
> >  tests/intel/xe_live_ktest.c                  |   1 +
> >  tests/intel/xe_media_fill.c                  |   9 +-
> >  tests/intel/xe_mmap.c                        |   3 +-
> >  tests/intel/xe_module_load.c                 |   1 +
> >  tests/intel/xe_noexec_ping_pong.c            |   3 +-
> >  tests/intel/xe_pat.c                         |   1 +
> >  tests/intel/xe_peer2peer.c                   |   3 +-
> >  tests/intel/xe_pm.c                          |   3 +-
> >  tests/intel/xe_pm_residency.c                |   3 +-
> >  tests/intel/xe_prime_self_import.c           |   1 +
> >  tests/intel/xe_query.c                       |  66 ++--
> >  tests/intel/xe_render_copy.c                 |   1 +
> >  tests/intel/xe_spin_batch.c                  |   1 +
> >  tests/intel/xe_sysfs_defaults.c              |   6 +-
> >  tests/intel/xe_sysfs_scheduler.c             |   3 +-
> >  tests/intel/xe_vm.c                          |   1 +
> >  tests/intel/xe_waitfence.c                   |   2 +
> >  tests/prime_vgem.c                           |   7 +-
> >  tests/sw_sync.c                              |   9 +-
> >  tests/syncobj_basic.c                        |   7 +-
> >  tests/syncobj_timeline.c                     |   9 +-
> >  tests/syncobj_wait.c                         |   9 +-
> >  tests/vgem_basic.c                           |   5 +-
> >  tests/vgem_slow.c                            |   7 +-
> >  213 files changed, 859 insertions(+), 559 deletions(-)
> > 
