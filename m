Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Fri, 03 Nov 2023 16:23:47 -0000
Message-ID: <169902862729.29107.17604210018879510251@emeril.freedesktop.org>
References: <20231103144359.7-1-francois.dugast@intel.com>
In-Reply-To: <20231103144359.7-1-francois.dugast@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB1QVBJ?=
 =?utf-8?q?_Alignment_-_take_2?=
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

Series: uAPI Alignment - take 2
URL   : https://patchwork.freedesktop.org/series/125956/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
69485d223b256208614e9949a4a7e84bde52d5f5 tests/intel/kms_pm_lpsp: Fix test constraint for bigjoiner

Tail of build.log:
      |                                     DRM_XE_SYNC_FLAG_SIGNAL
[604/1654] Compiling C object 'tests/59830eb@@xe_sysfs_scheduler@exe/intel_xe_sysfs_scheduler.c.o'.
[605/1654] Compiling C object 'tests/59830eb@@xe_evict_ccs@exe/intel_xe_evict_ccs.c.o'.
[606/1654] Compiling C object 'tests/59830eb@@msm_mapping@exe/msm_msm_mapping.c.o'.
[607/1654] Compiling C object 'tests/59830eb@@msm_recovery@exe/msm_msm_recovery.c.o'.
[608/1654] Compiling C object 'tests/59830eb@@xe_prime_self_import@exe/intel_xe_prime_self_import.c.o'.
[609/1654] Compiling C object 'tests/59830eb@@xe_exec_basic@exe/intel_xe_exec_basic.c.o'.
[610/1654] Compiling C object 'tests/59830eb@@xe_spin_batch@exe/intel_xe_spin_batch.c.o'.
[611/1654] Compiling C object 'tests/59830eb@@msm_submit@exe/msm_msm_submit.c.o'.
[612/1654] Compiling C object 'tests/59830eb@@xe_perf_pmu@exe/intel_xe_perf_pmu.c.o'.
[613/1654] Compiling C object 'lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o'.
[614/1654] Compiling C object 'tests/59830eb@@msm_submitoverhead@exe/msm_msm_submitoverhead.c.o'.
[615/1654] Compiling C object 'tests/59830eb@@xe_pm_residency@exe/intel_xe_pm_residency.c.o'.
[616/1654] Compiling C object 'tests/59830eb@@msm_shrink@exe/msm_msm_shrink.c.o'.
[617/1654] Compiling C object 'tests/59830eb@@i915_pm_rpm@exe/intel_i915_pm_rpm.c.o'.
[618/1654] Compiling C object 'tests/59830eb@@xe_ccs@exe/intel_xe_ccs.c.o'.
[619/1654] Compiling C object 'tests/59830eb@@gem_sync@exe/intel_gem_sync.c.o'.
[620/1654] Compiling C object 'tests/59830eb@@kms_chamelium_edid@exe/chamelium_kms_chamelium_helper.c.o'.
[621/1654] Compiling C object 'tests/59830eb@@kms_chamelium_audio@exe/chamelium_kms_chamelium_helper.c.o'.
[622/1654] Compiling C object 'tests/59830eb@@kms_chamelium_color@exe/kms_color_helper.c.o'.
[623/1654] Compiling C object 'tests/v3d/cad21b8@@v3d_create_bo@exe/v3d_create_bo.c.o'.
[624/1654] Compiling C object 'tests/v3d/cad21b8@@v3d_job_submission@exe/v3d_job_submission.c.o'.
[625/1654] Compiling C object 'tests/59830eb@@xe_guc_pc@exe/intel_xe_guc_pc.c.o'.
[626/1654] Compiling C object 'tests/59830eb@@xe_pm@exe/intel_xe_pm.c.o'.
[627/1654] Compiling C object 'tests/59830eb@@xe_query@exe/intel_xe_query.c.o'.
[628/1654] Compiling C object 'tests/59830eb@@gem_softpin@exe/intel_gem_softpin.c.o'.
[629/1654] Compiling C object 'tests/59830eb@@kms_chamelium_frames@exe/chamelium_kms_chamelium_helper.c.o'.
[630/1654] Compiling C object 'tests/59830eb@@xe_exec_balancer@exe/intel_xe_exec_balancer.c.o'.
[631/1654] Compiling C object 'tests/59830eb@@kms_chamelium_hpd@exe/chamelium_kms_chamelium_helper.c.o'.
[632/1654] Compiling C object 'tests/59830eb@@xe_evict@exe/intel_xe_evict.c.o'.
[633/1654] Compiling C object 'tests/59830eb@@kms_chamelium_color@exe/chamelium_kms_chamelium_color.c.o'.
[634/1654] Compiling C object 'tests/59830eb@@kms_chamelium_audio@exe/chamelium_kms_chamelium_audio.c.o'.
[635/1654] Compiling C object 'tests/59830eb@@kms_chamelium_edid@exe/chamelium_kms_chamelium_edid.c.o'.
[636/1654] Compiling C object 'tests/59830eb@@kms_chamelium_hpd@exe/chamelium_kms_chamelium_hpd.c.o'.
[637/1654] Compiling C object 'tests/59830eb@@xe_exec_reset@exe/intel_xe_exec_reset.c.o'.
[638/1654] Compiling C object 'tests/59830eb@@xe_intel_bb@exe/intel_xe_intel_bb.c.o'.
[639/1654] Compiling C object 'tests/59830eb@@xe_exec_threads@exe/intel_xe_exec_threads.c.o'.
[640/1654] Compiling C object 'tests/59830eb@@kms_pm_rpm@exe/intel_kms_pm_rpm.c.o'.
[641/1654] Compiling C object 'tests/59830eb@@kms_psr2_sf@exe/intel_kms_psr2_sf.c.o'.
[642/1654] Compiling C object 'tests/59830eb@@i915_query@exe/intel_i915_query.c.o'.
[643/1654] Compiling C object 'tests/59830eb@@kms_chamelium_frames@exe/chamelium_kms_chamelium_frames.c.o'.
[644/1654] Compiling C object 'tests/59830eb@@gem_exec_balancer@exe/intel_gem_exec_balancer.c.o'.
[645/1654] Compiling C object 'tests/59830eb@@kms_frontbuffer_tracking@exe/intel_kms_frontbuffer_tracking.c.o'.
[646/1654] Compiling C object 'tests/59830eb@@gem_exec_fence@exe/intel_gem_exec_fence.c.o'.
[647/1654] Compiling C object 'tests/59830eb@@gem_userptr_blits@exe/intel_gem_userptr_blits.c.o'.
[648/1654] Generating i915-perf-equations with a custom command.
[649/1654] Compiling C object 'tests/59830eb@@perf_pmu@exe/intel_perf_pmu.c.o'.
[650/1654] Compiling C object 'tests/59830eb@@gem_exec_schedule@exe/intel_gem_exec_schedule.c.o'.
[651/1654] Compiling C object 'tests/59830eb@@perf@exe/intel_perf.c.o'.
ninja: build stopped: subcommand failed.

