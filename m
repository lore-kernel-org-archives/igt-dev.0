Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Wed, 04 Oct 2023 03:31:29 -0000
Message-ID: <169639028938.7834.9508275497923908431@emeril.freedesktop.org>
References: <20231004031023.3444455-1-lucas.demarchi@intel.com>
In-Reply-To: <20231004031023.3444455-1-lucas.demarchi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBBZGFw?=
 =?utf-8?q?t_copy_commands_for_Xe2_=28rev3=29?=
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

Series: Adapt copy commands for Xe2 (rev3)
URL   : https://patchwork.freedesktop.org/series/123773/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
a4b4a33d8312e4e30ca23d26bbd1758e56540e1d tests/kms_frontbuffer_tracking: Remove badstride subtests

Tail of build.log:
[616/1641] Compiling C object 'tests/59830eb@@xe_sysfs_defaults@exe/intel_xe_sysfs_defaults.c.o'.
[617/1641] Compiling C object 'tests/59830eb@@xe_exec_basic@exe/intel_xe_exec_basic.c.o'.
[618/1641] Compiling C object 'tests/59830eb@@gem_sync@exe/intel_gem_sync.c.o'.
[619/1641] Compiling C object 'tests/59830eb@@kms_big_fb@exe/intel_kms_big_fb.c.o'.
[620/1641] Compiling C object 'tests/59830eb@@xe_pm_residency@exe/intel_xe_pm_residency.c.o'.
[621/1641] Compiling C object 'tests/59830eb@@msm_submitoverhead@exe/msm_msm_submitoverhead.c.o'.
[622/1641] Compiling C object 'tests/59830eb@@msm_mapping@exe/msm_msm_mapping.c.o'.
[623/1641] Compiling C object 'tests/59830eb@@msm_recovery@exe/msm_msm_recovery.c.o'.
[624/1641] Compiling C object 'tests/59830eb@@xe_sysfs_scheduler@exe/intel_xe_sysfs_scheduler.c.o'.
[625/1641] Compiling C object 'tests/59830eb@@xe_prime_self_import@exe/intel_xe_prime_self_import.c.o'.
[626/1641] Compiling C object 'tests/59830eb@@xe_spin_batch@exe/intel_xe_spin_batch.c.o'.
[627/1641] Compiling C object 'tests/59830eb@@kms_chamelium_audio@exe/chamelium_kms_chamelium_helper.c.o'.
[628/1641] Compiling C object 'tests/59830eb@@xe_exec_fault_mode@exe/intel_xe_exec_fault_mode.c.o'.
[629/1641] Compiling C object 'tests/59830eb@@xe_query@exe/intel_xe_query.c.o'.
[630/1641] Compiling C object 'tests/v3d/cad21b8@@v3d_get_bo_offset@exe/v3d_get_bo_offset.c.o'.
[631/1641] Compiling C object 'tests/v3d/cad21b8@@v3d_create_bo@exe/v3d_create_bo.c.o'.
[632/1641] Compiling C object 'tests/59830eb@@kms_chamelium_color@exe/kms_color_helper.c.o'.
[633/1641] Compiling C object 'tests/59830eb@@gem_softpin@exe/intel_gem_softpin.c.o'.
[634/1641] Compiling C object 'tests/59830eb@@msm_submit@exe/msm_msm_submit.c.o'.
[635/1641] Compiling C object 'tests/59830eb@@msm_shrink@exe/msm_msm_shrink.c.o'.
[636/1641] Compiling C object 'tests/59830eb@@xe_guc_pc@exe/intel_xe_guc_pc.c.o'.
[637/1641] Compiling C object 'tests/v3d/cad21b8@@v3d_mmap@exe/v3d_mmap.c.o'.
[638/1641] Compiling C object 'tests/59830eb@@kms_chamelium_hpd@exe/chamelium_kms_chamelium_helper.c.o'.
[639/1641] Compiling C object 'tests/59830eb@@xe_pm@exe/intel_xe_pm.c.o'.
[640/1641] Compiling C object 'tests/59830eb@@kms_chamelium_edid@exe/chamelium_kms_chamelium_helper.c.o'.
[641/1641] Compiling C object 'tests/59830eb@@kms_chamelium_frames@exe/chamelium_kms_chamelium_helper.c.o'.
[642/1641] Compiling C object 'tests/59830eb@@xe_exec_balancer@exe/intel_xe_exec_balancer.c.o'.
[643/1641] Compiling C object 'tests/v3d/cad21b8@@v3d_job_submission@exe/v3d_job_submission.c.o'.
[644/1641] Compiling C object 'tests/59830eb@@xe_evict@exe/intel_xe_evict.c.o'.
[645/1641] Compiling C object 'tests/59830eb@@kms_chamelium_audio@exe/chamelium_kms_chamelium_audio.c.o'.
[646/1641] Compiling C object 'tests/59830eb@@xe_exec_reset@exe/intel_xe_exec_reset.c.o'.
[647/1641] Compiling C object 'tests/59830eb@@kms_psr2_sf@exe/intel_kms_psr2_sf.c.o'.
[648/1641] Compiling C object 'tests/59830eb@@kms_chamelium_hpd@exe/chamelium_kms_chamelium_hpd.c.o'.
[649/1641] Compiling C object 'tests/59830eb@@kms_chamelium_edid@exe/chamelium_kms_chamelium_edid.c.o'.
[650/1641] Compiling C object 'tests/59830eb@@xe_intel_bb@exe/intel_xe_intel_bb.c.o'.
[651/1641] Compiling C object 'tests/59830eb@@kms_chamelium_color@exe/chamelium_kms_chamelium_color.c.o'.
[652/1641] Compiling C object 'tests/59830eb@@xe_exec_threads@exe/intel_xe_exec_threads.c.o'.
[653/1641] Compiling C object 'tests/59830eb@@i915_query@exe/intel_i915_query.c.o'.
[654/1641] Compiling C object 'tests/59830eb@@gem_exec_balancer@exe/intel_gem_exec_balancer.c.o'.
[655/1641] Compiling C object 'tests/59830eb@@kms_chamelium_frames@exe/chamelium_kms_chamelium_frames.c.o'.
[656/1641] Compiling C object 'tests/59830eb@@i915_pm_rpm@exe/intel_i915_pm_rpm.c.o'.
[657/1641] Compiling C object 'tests/59830eb@@gem_exec_fence@exe/intel_gem_exec_fence.c.o'.
[658/1641] Compiling C object 'tests/59830eb@@gem_userptr_blits@exe/intel_gem_userptr_blits.c.o'.
[659/1641] Compiling C object 'tests/59830eb@@xe_vm@exe/intel_xe_vm.c.o'.
[660/1641] Compiling C object 'tests/59830eb@@kms_frontbuffer_tracking@exe/intel_kms_frontbuffer_tracking.c.o'.
[661/1641] Compiling C object 'tests/59830eb@@perf_pmu@exe/intel_perf_pmu.c.o'.
[662/1641] Generating i915-perf-equations with a custom command.
[663/1641] Compiling C object 'tests/59830eb@@gem_exec_schedule@exe/intel_gem_exec_schedule.c.o'.
[664/1641] Compiling C object 'tests/59830eb@@perf@exe/intel_perf.c.o'.
ninja: build stopped: subcommand failed.

