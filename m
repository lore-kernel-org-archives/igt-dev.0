Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D791FC54798
	for <igt-dev@archiver.kernel.org>; Tue,  5 Mar 2024 18:52:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 830CC112C27;
	Tue,  5 Mar 2024 18:52:00 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2603112C27;
 Tue,  5 Mar 2024 18:51:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_revamp_big_joiner_test_?=
 =?utf-8?q?=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 05 Mar 2024 18:51:59 -0000
Message-ID: <170966471986.524851.5026327253856425315@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240305163607.688251-1-kunal1.joshi@intel.com>
In-Reply-To: <20240305163607.688251-1-kunal1.joshi@intel.com>
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

Series: revamp big joiner test (rev4)
URL   : https://patchwork.freedesktop.org/series/130572/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
3485bebabc1f0b8779c95d5525c72e6c672f2917 lib/xe/xe_query: Add helper to check if given gt id points to media gt

Tail of build.log:
[579/1667] Compiling C object 'tests/59830eb@@xe_compute@exe/intel_xe_compute.c.o'.
[580/1667] Compiling C object 'tests/59830eb@@gem_reset_stats@exe/intel_gem_reset_stats.c.o'.
[581/1667] Compiling C object 'tests/59830eb@@kms_psr_stress_test@exe/intel_kms_psr_stress_test.c.o'.
[582/1667] Compiling C object 'tests/59830eb@@kms_psr2_su@exe/intel_kms_psr2_su.c.o'.
[583/1667] Compiling C object 'tests/59830eb@@kms_pm_backlight@exe/intel_kms_pm_backlight.c.o'.
[584/1667] Compiling C object 'tests/59830eb@@kms_busy@exe/intel_kms_busy.c.o'.
[585/1667] Compiling C object 'tests/59830eb@@xe_copy_basic@exe/intel_xe_copy_basic.c.o'.
[586/1667] Compiling C object 'tests/59830eb@@xe_dma_buf_sync@exe/intel_xe_dma_buf_sync.c.o'.
[587/1667] Compiling C object 'tests/59830eb@@gem_mmap_gtt@exe/intel_gem_mmap_gtt.c.o'.
[588/1667] Compiling C object 'tests/59830eb@@gem_pxp@exe/intel_gem_pxp.c.o'.
[589/1667] Compiling C object 'tests/59830eb@@xe_debugfs@exe/intel_xe_debugfs.c.o'.
[590/1667] Compiling C object 'tests/59830eb@@xe_exec_atomic@exe/intel_xe_exec_atomic.c.o'.
[591/1667] Compiling C object 'tests/59830eb@@i915_pm_rps@exe/intel_i915_pm_rps.c.o'.
[592/1667] Compiling C object 'tests/59830eb@@xe_drm_fdinfo@exe/intel_xe_drm_fdinfo.c.o'.
[593/1667] Compiling C object 'tests/59830eb@@xe_media_fill@exe/intel_xe_media_fill.c.o'.
[594/1667] Compiling C object 'tests/59830eb@@xe_gpgpu_fill@exe/intel_xe_gpgpu_fill.c.o'.
[595/1667] Compiling C object 'tests/59830eb@@kms_pm_dc@exe/intel_kms_pm_dc.c.o'.
[596/1667] Compiling C object 'tests/59830eb@@xe_huc_copy@exe/intel_xe_huc_copy.c.o'.
[597/1667] Compiling C object 'tests/59830eb@@kms_ccs@exe/intel_kms_ccs.c.o'.
[598/1667] Compiling C object 'tests/59830eb@@xe_create@exe/intel_xe_create.c.o'.
[599/1667] Compiling C object 'tests/59830eb@@xe_exec_fault_mode@exe/intel_xe_exec_fault_mode.c.o'.
[600/1667] Compiling C object 'tests/59830eb@@xe_exec_queue_property@exe/intel_xe_exec_queue_property.c.o'.
[601/1667] Compiling C object 'tests/59830eb@@xe_exec_store@exe/intel_xe_exec_store.c.o'.
[602/1667] Compiling C object 'tests/59830eb@@xe_exec_basic@exe/intel_xe_exec_basic.c.o'.
[603/1667] Compiling C object 'tests/59830eb@@gem_sync@exe/intel_gem_sync.c.o'.
[604/1667] Compiling C object 'tests/59830eb@@i915_pm_rpm@exe/intel_i915_pm_rpm.c.o'.
[605/1667] Compiling C object 'tests/59830eb@@xe_ccs@exe/intel_xe_ccs.c.o'.
[606/1667] Compiling C object 'tests/59830eb@@xe_exercise_blt@exe/intel_xe_exercise_blt.c.o'.
[607/1667] Compiling C object 'tests/59830eb@@kms_big_fb@exe/intel_kms_big_fb.c.o'.
[608/1667] Compiling C object 'tests/59830eb@@gem_softpin@exe/intel_gem_softpin.c.o'.
[609/1667] Compiling C object 'tests/59830eb@@kms_psr@exe/intel_kms_psr.c.o'.
[610/1667] Compiling C object 'tests/59830eb@@xe_evict_ccs@exe/intel_xe_evict_ccs.c.o'.
[611/1667] Compiling C object 'tests/59830eb@@xe_exec_compute_mode@exe/intel_xe_exec_compute_mode.c.o'.
[612/1667] Compiling C object 'tests/59830eb@@xe_gt_freq@exe/intel_xe_gt_freq.c.o'.
[613/1667] Compiling C object 'tests/59830eb@@xe_exec_balancer@exe/intel_xe_exec_balancer.c.o'.
[614/1667] Compiling C object 'tests/59830eb@@i915_query@exe/intel_i915_query.c.o'.
[615/1667] Compiling C object 'tests/59830eb@@xe_exec_reset@exe/intel_xe_exec_reset.c.o'.
[616/1667] Compiling C object 'tests/59830eb@@gem_exec_balancer@exe/intel_gem_exec_balancer.c.o'.
[617/1667] Compiling C object 'tests/59830eb@@xe_evict@exe/intel_xe_evict.c.o'.
[618/1667] Compiling C object 'tests/59830eb@@kms_pm_rpm@exe/intel_kms_pm_rpm.c.o'.
[619/1667] Generating i915-perf-equations with a custom command.
[620/1667] Compiling C object 'tests/59830eb@@xe_intel_bb@exe/intel_xe_intel_bb.c.o'.
[621/1667] Compiling C object 'tests/59830eb@@kms_psr2_sf@exe/intel_kms_psr2_sf.c.o'.
[622/1667] Compiling C object 'tests/59830eb@@xe_exec_threads@exe/intel_xe_exec_threads.c.o'.
[623/1667] Compiling C object 'tests/59830eb@@gem_exec_fence@exe/intel_gem_exec_fence.c.o'.
[624/1667] Compiling C object 'tests/59830eb@@kms_frontbuffer_tracking@exe/intel_kms_frontbuffer_tracking.c.o'.
[625/1667] Compiling C object 'tests/59830eb@@perf_pmu@exe/intel_perf_pmu.c.o'.
[626/1667] Compiling C object 'tests/59830eb@@perf@exe/intel_perf.c.o'.
[627/1667] Compiling C object 'tests/59830eb@@gem_exec_schedule@exe/intel_gem_exec_schedule.c.o'.
ninja: build stopped: subcommand failed.


