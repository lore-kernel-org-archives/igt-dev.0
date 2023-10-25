Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Wed, 25 Oct 2023 07:06:53 -0000
Message-ID: <169821761309.20487.10227304488597319661@emeril.freedesktop.org>
References: <20231025053157.15470-1-nidhi1.gupta@intel.com>
In-Reply-To: <20231025053157.15470-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?s/kms=5Ffrontbuffer=5Ftracking=3A_Extend_the_test_to_enable_FBC?=
 =?utf-8?q?_for_each_plane_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_frontbuffer_tracking: Extend the test to enable FBC for each plane (rev3)
URL   : https://patchwork.freedesktop.org/series/123724/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
03ded26cd2697ce3b4d7ceb0d7d2706460f87ca1 tests/intel/xe_copy_basic: Fix validating the mem set values.

Tail of build.log:
[584/1645] Compiling C object 'lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o'.
[585/1645] Compiling C object 'tests/59830eb@@kms_psr_stress_test@exe/intel_kms_psr_stress_test.c.o'.
[586/1645] Compiling C object 'tests/59830eb@@kms_ccs@exe/intel_kms_ccs.c.o'.
[587/1645] Compiling C object 'tests/59830eb@@xe_create@exe/intel_xe_create.c.o'.
[588/1645] Compiling C object 'tests/59830eb@@xe_dma_buf_sync@exe/intel_xe_dma_buf_sync.c.o'.
[589/1645] Compiling C object 'lib/76b5a35@@igt-igt_fb_c@sta/igt_fb.c.o'.
[590/1645] Compiling C object 'tests/59830eb@@xe_live_ktest@exe/intel_xe_live_ktest.c.o'.
[591/1645] Compiling C object 'tests/59830eb@@xe_debugfs@exe/intel_xe_debugfs.c.o'.
[592/1645] Compiling C object 'tests/59830eb@@xe_gpgpu_fill@exe/intel_xe_gpgpu_fill.c.o'.
[593/1645] Compiling C object 'tests/59830eb@@xe_mmap@exe/intel_xe_mmap.c.o'.
[594/1645] Compiling C object 'tests/59830eb@@xe_huc_copy@exe/intel_xe_huc_copy.c.o'.
[595/1645] Compiling C object 'tests/59830eb@@gem_mmap_gtt@exe/intel_gem_mmap_gtt.c.o'.
[596/1645] Compiling C object 'tests/59830eb@@xe_media_fill@exe/intel_xe_media_fill.c.o'.
[597/1645] Compiling C object 'tests/59830eb@@xe_exec_compute_mode@exe/intel_xe_exec_compute_mode.c.o'.
[598/1645] Compiling C object 'tests/59830eb@@kms_busy@exe/intel_kms_busy.c.o'.
[599/1645] Compiling C object 'tests/59830eb@@xe_exec_store@exe/intel_xe_exec_store.c.o'.
[600/1645] Compiling C object 'tests/59830eb@@kms_pm_dc@exe/intel_kms_pm_dc.c.o'.
[601/1645] Compiling C object 'tests/59830eb@@xe_module_load@exe/intel_xe_module_load.c.o'.
[602/1645] Compiling C object 'tests/59830eb@@kms_psr@exe/intel_kms_psr.c.o'.
[603/1645] Compiling C object 'tests/59830eb@@xe_exercise_blt@exe/intel_xe_exercise_blt.c.o'.
[604/1645] Compiling C object 'tests/59830eb@@i915_pm_rps@exe/intel_i915_pm_rps.c.o'.
[605/1645] Compiling C object 'tests/59830eb@@xe_drm_fdinfo@exe/intel_xe_drm_fdinfo.c.o'.
[606/1645] Compiling C object 'tests/59830eb@@xe_ccs@exe/intel_xe_ccs.c.o'.
[607/1645] Compiling C object 'tests/59830eb@@xe_exec_basic@exe/intel_xe_exec_basic.c.o'.
[608/1645] Compiling C object 'tests/59830eb@@gem_sync@exe/intel_gem_sync.c.o'.
[609/1645] Compiling C object 'tests/59830eb@@kms_big_fb@exe/intel_kms_big_fb.c.o'.
[610/1645] Compiling C object 'tests/59830eb@@xe_pm_residency@exe/intel_xe_pm_residency.c.o'.
[611/1645] Compiling C object 'tests/59830eb@@xe_guc_pc@exe/intel_xe_guc_pc.c.o'.
[612/1645] Compiling C object 'tests/59830eb@@gem_pxp@exe/intel_gem_pxp.c.o'.
[613/1645] Compiling C object 'tests/59830eb@@xe_pm@exe/intel_xe_pm.c.o'.
[614/1645] Compiling C object 'tests/59830eb@@xe_exec_fault_mode@exe/intel_xe_exec_fault_mode.c.o'.
[615/1645] Compiling C object 'tests/59830eb@@i915_pm_rpm@exe/intel_i915_pm_rpm.c.o'.
[616/1645] Compiling C object 'tests/59830eb@@xe_exec_balancer@exe/intel_xe_exec_balancer.c.o'.
[617/1645] Compiling C object 'tests/59830eb@@xe_evict@exe/intel_xe_evict.c.o'.
[618/1645] Compiling C object 'tests/59830eb@@xe_exec_reset@exe/intel_xe_exec_reset.c.o'.
[619/1645] Compiling C object 'tests/59830eb@@gem_softpin@exe/intel_gem_softpin.c.o'.
[620/1645] Compiling C object 'tests/59830eb@@kms_psr2_sf@exe/intel_kms_psr2_sf.c.o'.
[621/1645] Compiling C object 'tests/59830eb@@xe_intel_bb@exe/intel_xe_intel_bb.c.o'.
[622/1645] Compiling C object 'tests/59830eb@@xe_exec_threads@exe/intel_xe_exec_threads.c.o'.
[623/1645] Compiling C object 'tests/59830eb@@kms_pm_rpm@exe/intel_kms_pm_rpm.c.o'.
[624/1645] Compiling C object 'tests/59830eb@@i915_query@exe/intel_i915_query.c.o'.
[625/1645] Compiling C object 'tests/59830eb@@gem_exec_balancer@exe/intel_gem_exec_balancer.c.o'.
[626/1645] Compiling C object 'tests/59830eb@@perf@exe/intel_perf.c.o'.
[627/1645] Compiling C object 'tests/59830eb@@xe_vm@exe/intel_xe_vm.c.o'.
[628/1645] Compiling C object 'tests/59830eb@@gem_exec_fence@exe/intel_gem_exec_fence.c.o'.
[629/1645] Compiling C object 'tests/59830eb@@gem_userptr_blits@exe/intel_gem_userptr_blits.c.o'.
[630/1645] Compiling C object 'tests/59830eb@@perf_pmu@exe/intel_perf_pmu.c.o'.
[631/1645] Generating i915-perf-equations with a custom command.
[632/1645] Compiling C object 'tests/59830eb@@gem_exec_schedule@exe/intel_gem_exec_schedule.c.o'.
ninja: build stopped: subcommand failed.

