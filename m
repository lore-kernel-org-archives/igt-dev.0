Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411B0C5475B
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 04:26:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2AF610E4F4;
	Wed,  6 Mar 2024 04:26:39 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D0910EA89;
 Wed,  6 Mar 2024 04:26:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_revamp_big_joiner_test_?=
 =?utf-8?q?=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 06 Mar 2024 04:26:38 -0000
Message-ID: <170969919862.524851.11926951541580884726@8e613ede5ea5>
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

Series: revamp big joiner test (rev5)
URL   : https://patchwork.freedesktop.org/series/130572/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
3485bebabc1f0b8779c95d5525c72e6c672f2917 lib/xe/xe_query: Add helper to check if given gt id points to media gt

Tail of build.log:
[563/1667] Compiling C object 'tests/59830eb@@kms_pipe_b_c_ivb@exe/intel_kms_pipe_b_c_ivb.c.o'.
[564/1667] Compiling C object 'tests/59830eb@@kms_fbcon_fbt@exe/intel_kms_fbcon_fbt.c.o'.
[565/1667] Compiling C object 'tests/59830eb@@kms_cdclk@exe/intel_kms_cdclk.c.o'.
[566/1667] Compiling C object 'tests/59830eb@@i915_pipe_stress@exe/intel_i915_pipe_stress.c.o'.
[567/1667] Compiling C object 'tests/59830eb@@kms_psr2_sf@exe/intel_kms_dsc_helper.c.o'.
[568/1667] Compiling C object 'tests/59830eb@@kms_pm_lpsp@exe/intel_kms_pm_lpsp.c.o'.
[569/1667] Compiling C object 'tests/59830eb@@kms_pwrite_crc@exe/intel_kms_pwrite_crc.c.o'.
[570/1667] Compiling C object 'tests/59830eb@@xe_dma_buf_sync@exe/intel_xe_dma_buf_sync.c.o'.
[571/1667] Compiling C object 'tests/59830eb@@kms_psr2_su@exe/intel_kms_psr2_su.c.o'.
[572/1667] Compiling C object 'tests/59830eb@@xe_compute_preempt@exe/intel_xe_compute_preempt.c.o'.
[573/1667] Compiling C object 'lib/76b5a35@@igt-igt_fb_c@sta/igt_fb.c.o'.
[574/1667] Compiling C object 'tests/59830eb@@i915_pm_rc6_residency@exe/intel_i915_pm_rc6_residency.c.o'.
[575/1667] Compiling C object 'tests/59830eb@@xe_copy_basic@exe/intel_xe_copy_basic.c.o'.
[576/1667] Compiling C object 'tests/59830eb@@xe_compute@exe/intel_xe_compute.c.o'.
[577/1667] Compiling C object 'tests/59830eb@@sysfs_timeslice_duration@exe/intel_sysfs_timeslice_duration.c.o'.
[578/1667] Compiling C object 'tests/59830eb@@xe_debugfs@exe/intel_xe_debugfs.c.o'.
[579/1667] Compiling C object 'tests/59830eb@@kms_psr_stress_test@exe/intel_kms_psr_stress_test.c.o'.
[580/1667] Compiling C object 'tests/59830eb@@kms_pm_backlight@exe/intel_kms_pm_backlight.c.o'.
[581/1667] Compiling C object 'lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o'.
[582/1667] Compiling C object 'tests/59830eb@@prime_mmap@exe/intel_prime_mmap.c.o'.
[583/1667] Compiling C object 'tests/59830eb@@gem_mmap_gtt@exe/intel_gem_mmap_gtt.c.o'.
[584/1667] Compiling C object 'tests/59830eb@@i915_pm_rps@exe/intel_i915_pm_rps.c.o'.
[585/1667] Compiling C object 'tests/59830eb@@kms_busy@exe/intel_kms_busy.c.o'.
[586/1667] Compiling C object 'tests/59830eb@@gem_pxp@exe/intel_gem_pxp.c.o'.
[587/1667] Compiling C object 'tests/59830eb@@gem_reset_stats@exe/intel_gem_reset_stats.c.o'.
[588/1667] Compiling C object 'tests/59830eb@@xe_exec_atomic@exe/intel_xe_exec_atomic.c.o'.
[589/1667] Compiling C object 'tests/59830eb@@kms_pm_dc@exe/intel_kms_pm_dc.c.o'.
[590/1667] Compiling C object 'tests/59830eb@@xe_drm_fdinfo@exe/intel_xe_drm_fdinfo.c.o'.
[591/1667] Compiling C object 'tests/59830eb@@xe_create@exe/intel_xe_create.c.o'.
[592/1667] Compiling C object 'tests/59830eb@@kms_ccs@exe/intel_kms_ccs.c.o'.
[593/1667] Compiling C object 'tests/59830eb@@kms_big_fb@exe/intel_kms_big_fb.c.o'.
[594/1667] Compiling C object 'tests/59830eb@@kms_psr@exe/intel_kms_psr.c.o'.
[595/1667] Compiling C object 'tests/59830eb@@gem_sync@exe/intel_gem_sync.c.o'.
[596/1667] Compiling C object 'tests/59830eb@@xe_evict_ccs@exe/intel_xe_evict_ccs.c.o'.
[597/1667] Compiling C object 'tests/59830eb@@i915_pm_rpm@exe/intel_i915_pm_rpm.c.o'.
[598/1667] Compiling C object 'tests/59830eb@@xe_ccs@exe/intel_xe_ccs.c.o'.
[599/1667] Compiling C object 'tests/59830eb@@xe_exec_balancer@exe/intel_xe_exec_balancer.c.o'.
[600/1667] Compiling C object 'tests/59830eb@@gem_softpin@exe/intel_gem_softpin.c.o'.
[601/1667] Compiling C object 'tests/59830eb@@xe_evict@exe/intel_xe_evict.c.o'.
[602/1667] Compiling C object 'tests/59830eb@@i915_query@exe/intel_i915_query.c.o'.
[603/1667] Compiling C object 'tests/59830eb@@kms_psr2_sf@exe/intel_kms_psr2_sf.c.o'.
[604/1667] Compiling C object 'tests/59830eb@@gem_exec_balancer@exe/intel_gem_exec_balancer.c.o'.
[605/1667] Compiling C object 'tests/59830eb@@kms_pm_rpm@exe/intel_kms_pm_rpm.c.o'.
[606/1667] Generating i915-perf-equations with a custom command.
[607/1667] Compiling C object 'tests/59830eb@@gem_exec_fence@exe/intel_gem_exec_fence.c.o'.
[608/1667] Compiling C object 'tests/59830eb@@kms_frontbuffer_tracking@exe/intel_kms_frontbuffer_tracking.c.o'.
[609/1667] Compiling C object 'tests/59830eb@@perf_pmu@exe/intel_perf_pmu.c.o'.
[610/1667] Compiling C object 'tests/59830eb@@gem_exec_schedule@exe/intel_gem_exec_schedule.c.o'.
[611/1667] Compiling C object 'tests/59830eb@@perf@exe/intel_perf.c.o'.
ninja: build stopped: subcommand failed.


