Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E44BC27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 22:08:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC6910E012;
	Fri,  7 Jun 2024 22:08:15 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6C910E012;
 Fri,  7 Jun 2024 22:08:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/kms=5Fdirtyfb=3A_fe?=
 =?utf-8?q?w_fbc_related_updates?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 07 Jun 2024 22:08:13 -0000
Message-ID: <171779809363.28978.1177158910965543696@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240607145732.285557-1-vinod.govindapillai@intel.com>
In-Reply-To: <20240607145732.285557-1-vinod.govindapillai@intel.com>
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
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_dirtyfb: few fbc related updates
URL   : https://patchwork.freedesktop.org/series/134620/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
73618605b4370cf902267aaf1d25666ff5e26112 test/intel/xe_exec_reset: Synchronize cm-gt-reset gt resets

Tail of build.log:
[582/1679] Compiling C object 'tests/59830eb@@kms_flip_tiling@exe/intel_kms_flip_tiling.c.o'.
[583/1679] Compiling C object 'tests/59830eb@@kms_pm_lpsp@exe/intel_kms_pm_lpsp.c.o'.
[584/1679] Compiling C object 'tests/59830eb@@xe_compute@exe/intel_xe_compute.c.o'.
[585/1679] Compiling C object 'tests/59830eb@@i915_pipe_stress@exe/intel_i915_pipe_stress.c.o'.
[586/1679] Compiling C object 'tests/59830eb@@kms_big_joiner@exe/intel_kms_big_joiner.c.o'.
[587/1679] Compiling C object 'tests/59830eb@@xe_wedged@exe/intel_xe_wedged.c.o'.
[588/1679] Compiling C object 'tests/59830eb@@kms_pm_backlight@exe/intel_kms_pm_backlight.c.o'.
[589/1679] Compiling C object 'tests/59830eb@@kms_flip_scaled_crc@exe/intel_kms_flip_scaled_crc.c.o'.
[590/1679] Compiling C object 'tests/59830eb@@sysfs_timeslice_duration@exe/intel_sysfs_timeslice_duration.c.o'.
[591/1679] Compiling C object 'tests/59830eb@@kms_psr_stress_test@exe/intel_kms_psr_stress_test.c.o'.
[592/1679] Compiling C object 'tests/59830eb@@xe_copy_basic@exe/intel_xe_copy_basic.c.o'.
[593/1679] Compiling C object 'tests/59830eb@@kms_psr2_su@exe/intel_kms_psr2_su.c.o'.
[594/1679] Compiling C object 'tests/59830eb@@kms_busy@exe/intel_kms_busy.c.o'.
[595/1679] Compiling C object 'tests/59830eb@@xe_dma_buf_sync@exe/intel_xe_dma_buf_sync.c.o'.
[596/1679] Compiling C object 'tests/59830eb@@gem_mmap_gtt@exe/intel_gem_mmap_gtt.c.o'.
[597/1679] Compiling C object 'tests/59830eb@@i915_pm_rc6_residency@exe/intel_i915_pm_rc6_residency.c.o'.
[598/1679] Compiling C object 'tests/59830eb@@gem_reset_stats@exe/intel_gem_reset_stats.c.o'.
[599/1679] Compiling C object 'tests/59830eb@@xe_exec_atomic@exe/intel_xe_exec_atomic.c.o'.
[600/1679] Compiling C object 'tests/59830eb@@xe_debugfs@exe/intel_xe_debugfs.c.o'.
[601/1679] Compiling C object 'tests/59830eb@@xe_create@exe/intel_xe_create.c.o'.
[602/1679] Compiling C object 'lib/76b5a35@@igt-igt_fb_c@sta/igt_fb.c.o'.
[603/1679] Compiling C object 'tests/59830eb@@xe_drm_fdinfo@exe/intel_xe_drm_fdinfo.c.o'.
[604/1679] Compiling C object 'tests/59830eb@@kms_pm_dc@exe/intel_kms_pm_dc.c.o'.
[605/1679] Compiling C object 'tests/59830eb@@xe_evict_ccs@exe/intel_xe_evict_ccs.c.o'.
[606/1679] Compiling C object 'tests/59830eb@@kms_big_fb@exe/intel_kms_big_fb.c.o'.
[607/1679] Compiling C object 'tests/59830eb@@kms_ccs@exe/intel_kms_ccs.c.o'.
[608/1679] Compiling C object 'tests/59830eb@@kms_psr@exe/intel_kms_psr.c.o'.
[609/1679] Compiling C object 'lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o'.
[610/1679] Compiling C object 'tests/59830eb@@xe_exec_fault_mode@exe/intel_xe_exec_fault_mode.c.o'.
[611/1679] Compiling C object 'tests/59830eb@@xe_exec_basic@exe/intel_xe_exec_basic.c.o'.
[612/1679] Compiling C object 'tests/59830eb@@i915_pm_rps@exe/intel_i915_pm_rps.c.o'.
[613/1679] Compiling C object 'tests/59830eb@@gem_sync@exe/intel_gem_sync.c.o'.
[614/1679] Compiling C object 'tests/59830eb@@gem_pxp@exe/intel_gem_pxp.c.o'.
[615/1679] Compiling C object 'tests/59830eb@@xe_exec_balancer@exe/intel_xe_exec_balancer.c.o'.
[616/1679] Compiling C object 'tests/59830eb@@gem_softpin@exe/intel_gem_softpin.c.o'.
[617/1679] Compiling C object 'tests/59830eb@@i915_pm_rpm@exe/intel_i915_pm_rpm.c.o'.
[618/1679] Compiling C object 'tests/59830eb@@xe_ccs@exe/intel_xe_ccs.c.o'.
[619/1679] Compiling C object 'tests/59830eb@@xe_evict@exe/intel_xe_evict.c.o'.
[620/1679] Compiling C object 'tests/59830eb@@kms_pm_rpm@exe/intel_kms_pm_rpm.c.o'.
[621/1679] Compiling C object 'tests/59830eb@@i915_query@exe/intel_i915_query.c.o'.
[622/1679] Compiling C object 'tests/59830eb@@gem_exec_balancer@exe/intel_gem_exec_balancer.c.o'.
[623/1679] Compiling C object 'tests/59830eb@@kms_psr2_sf@exe/intel_kms_psr2_sf.c.o'.
[624/1679] Generating i915-perf-equations with a custom command.
[625/1679] Compiling C object 'tests/59830eb@@gem_userptr_blits@exe/intel_gem_userptr_blits.c.o'.
[626/1679] Compiling C object 'tests/59830eb@@gem_exec_fence@exe/intel_gem_exec_fence.c.o'.
[627/1679] Compiling C object 'tests/59830eb@@kms_frontbuffer_tracking@exe/intel_kms_frontbuffer_tracking.c.o'.
[628/1679] Compiling C object 'tests/59830eb@@perf_pmu@exe/intel_perf_pmu.c.o'.
[629/1679] Compiling C object 'tests/59830eb@@perf@exe/intel_perf.c.o'.
[630/1679] Compiling C object 'tests/59830eb@@gem_exec_schedule@exe/intel_gem_exec_schedule.c.o'.
ninja: build stopped: subcommand failed.


