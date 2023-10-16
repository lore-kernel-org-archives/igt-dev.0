Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: priyanka.dandamudi@intel.com
Date: Mon, 16 Oct 2023 06:11:10 -0000
Message-ID: <169743667078.13510.7504807003081225781@emeril.freedesktop.org>
References: <20231016051016.2009725-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20231016051016.2009725-1-priyanka.dandamudi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?s/xe/xe=5Faccess=5Fcounter=3A_Negative_access_counter_test_=28r?=
 =?utf-8?q?ev3=29?=
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

Series: tests/xe/xe_access_counter: Negative access counter test (rev3)
URL   : https://patchwork.freedesktop.org/series/124883/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
08e87a32fa113a9b6f30cbd9766fec346b53faac tests/kms_atomic: add flexibility to run tests on all pipes

Tail of build.log:
[580/1650] Compiling C object 'tests/59830eb@@xe_gpgpu_fill@exe/intel_xe_gpgpu_fill.c.o'.
[581/1650] Compiling C object 'tests/59830eb@@xe_exec_store@exe/intel_xe_exec_store.c.o'.
[582/1650] Compiling C object 'tests/59830eb@@kms_busy@exe/intel_kms_busy.c.o'.
[583/1650] Compiling C object 'tests/59830eb@@gem_reset_stats@exe/intel_gem_reset_stats.c.o'.
[584/1650] Compiling C object 'tests/59830eb@@xe_drm_fdinfo@exe/intel_xe_drm_fdinfo.c.o'.
[585/1650] Compiling C object 'tests/59830eb@@xe_media_fill@exe/intel_xe_media_fill.c.o'.
[586/1650] Compiling C object 'tests/59830eb@@xe_module_load@exe/intel_xe_module_load.c.o'.
[587/1650] Compiling C object 'tests/59830eb@@xe_huc_copy@exe/intel_xe_huc_copy.c.o'.
[588/1650] Compiling C object 'tests/59830eb@@kms_psr@exe/intel_kms_psr.c.o'.
[589/1650] Compiling C object 'tests/59830eb@@xe_noexec_ping_pong@exe/intel_xe_noexec_ping_pong.c.o'.
[590/1650] Compiling C object 'tests/59830eb@@xe_exercise_blt@exe/intel_xe_exercise_blt.c.o'.
[591/1650] Compiling C object 'tests/59830eb@@xe_mmio@exe/intel_xe_mmio.c.o'.
[592/1650] Compiling C object 'lib/76b5a35@@igt-igt_fb_c@sta/igt_fb.c.o'.
[593/1650] Compiling C object 'tests/59830eb@@xe_mmap@exe/intel_xe_mmap.c.o'.
[594/1650] Compiling C object 'tests/59830eb@@xe_waitfence@exe/intel_xe_waitfence.c.o'.
[595/1650] Compiling C object 'lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o'.
[596/1650] Compiling C object 'tests/59830eb@@gem_pxp@exe/intel_gem_pxp.c.o'.
[597/1650] Compiling C object 'tests/59830eb@@xe_exec_compute_mode@exe/intel_xe_exec_compute_mode.c.o'.
[598/1650] Compiling C object 'tests/59830eb@@gem_mmap_gtt@exe/intel_gem_mmap_gtt.c.o'.
[599/1650] Compiling C object 'tests/59830eb@@i915_pm_rps@exe/intel_i915_pm_rps.c.o'.
[600/1650] Compiling C object 'tests/59830eb@@kms_pm_dc@exe/intel_kms_pm_dc.c.o'.
[601/1650] Compiling C object 'tests/59830eb@@xe_perf_pmu@exe/intel_xe_perf_pmu.c.o'.
[602/1650] Compiling C object 'tests/59830eb@@xe_exec_basic@exe/intel_xe_exec_basic.c.o'.
[603/1650] Compiling C object 'tests/59830eb@@xe_exec_fault_mode@exe/intel_xe_exec_fault_mode.c.o'.
[604/1650] Compiling C object 'tests/59830eb@@kms_big_fb@exe/intel_kms_big_fb.c.o'.
[605/1650] Compiling C object 'tests/59830eb@@xe_pm_residency@exe/intel_xe_pm_residency.c.o'.
[606/1650] Compiling C object 'tests/59830eb@@xe_guc_pc@exe/intel_xe_guc_pc.c.o'.
[607/1650] Compiling C object 'tests/59830eb@@xe_ccs@exe/intel_xe_ccs.c.o'.
[608/1650] Compiling C object 'tests/59830eb@@gem_sync@exe/intel_gem_sync.c.o'.
[609/1650] Compiling C object 'tests/59830eb@@xe_query@exe/intel_xe_query.c.o'.
[610/1650] Compiling C object 'tests/59830eb@@gem_softpin@exe/intel_gem_softpin.c.o'.
[611/1650] Compiling C object 'tests/59830eb@@xe_exec_balancer@exe/intel_xe_exec_balancer.c.o'.
[612/1650] Compiling C object 'tests/59830eb@@i915_pm_rpm@exe/intel_i915_pm_rpm.c.o'.
[613/1650] Compiling C object 'tests/59830eb@@xe_pm@exe/intel_xe_pm.c.o'.
[614/1650] Compiling C object 'tests/59830eb@@xe_exec_reset@exe/intel_xe_exec_reset.c.o'.
[615/1650] Compiling C object 'tests/59830eb@@xe_evict@exe/intel_xe_evict.c.o'.
[616/1650] Compiling C object 'tests/59830eb@@xe_intel_bb@exe/intel_xe_intel_bb.c.o'.
[617/1650] Compiling C object 'tests/59830eb@@kms_psr2_sf@exe/intel_kms_psr2_sf.c.o'.
[618/1650] Compiling C object 'tests/59830eb@@kms_pm_rpm@exe/intel_kms_pm_rpm.c.o'.
[619/1650] Compiling C object 'tests/59830eb@@i915_query@exe/intel_i915_query.c.o'.
[620/1650] Compiling C object 'tests/59830eb@@xe_exec_threads@exe/intel_xe_exec_threads.c.o'.
[621/1650] Compiling C object 'tests/59830eb@@gem_exec_balancer@exe/intel_gem_exec_balancer.c.o'.
[622/1650] Compiling C object 'tests/59830eb@@perf@exe/intel_perf.c.o'.
[623/1650] Generating i915-perf-equations with a custom command.
[624/1650] Compiling C object 'tests/59830eb@@gem_userptr_blits@exe/intel_gem_userptr_blits.c.o'.
[625/1650] Compiling C object 'tests/59830eb@@kms_frontbuffer_tracking@exe/intel_kms_frontbuffer_tracking.c.o'.
[626/1650] Compiling C object 'tests/59830eb@@gem_exec_fence@exe/intel_gem_exec_fence.c.o'.
[627/1650] Compiling C object 'tests/59830eb@@perf_pmu@exe/intel_perf_pmu.c.o'.
[628/1650] Compiling C object 'tests/59830eb@@gem_exec_schedule@exe/intel_gem_exec_schedule.c.o'.
ninja: build stopped: subcommand failed.

