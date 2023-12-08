Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_RFC=3A_drm-uapi/xe=3A_add?=
 =?utf-8?q?_exec=5Fqueue=5Fid_member_to_drm=5Fxe=5Fwait=5Fuser=5Ffence_struc?=
 =?utf-8?q?ture_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bommu Krishnaiah" <krishnaiah.bommu@intel.com>
Date: Fri, 08 Dec 2023 05:48:52 -0000
Message-ID: <170201453264.7327.8586927323238408724@emeril.freedesktop.org>
References: <20231208041825.32421-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20231208041825.32421-1-krishnaiah.bommu@intel.com>
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

Series: RFC: drm-uapi/xe: add exec_queue_id member to drm_xe_wait_user_fence structure (rev5)
URL   : https://patchwork.freedesktop.org/series/127364/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
431c2d2dd5828b25fcbe1c82afbac865f4771aee tests/intel/xe_create: create-big-vram subtest

Tail of build.log:
[613/1662] Compiling C object 'tests/59830eb@@i915_pm_rpm@exe/intel_i915_pm_rpm.c.o'.
[614/1662] Compiling C object 'tests/59830eb@@msm_mapping@exe/msm_msm_mapping.c.o'.
[615/1662] Compiling C object 'tests/59830eb@@xe_ccs@exe/intel_xe_ccs.c.o'.
[616/1662] Compiling C object 'tests/59830eb@@gem_sync@exe/intel_gem_sync.c.o'.
[617/1662] Compiling C object 'tests/59830eb@@msm_submitoverhead@exe/msm_msm_submitoverhead.c.o'.
[618/1662] Compiling C object 'tests/59830eb@@xe_pm_residency@exe/intel_xe_pm_residency.c.o'.
[619/1662] Compiling C object 'tests/59830eb@@xe_perf_pmu@exe/intel_xe_perf_pmu.c.o'.
[620/1662] Compiling C object 'tests/59830eb@@xe_spin_batch@exe/intel_xe_spin_batch.c.o'.
[621/1662] Compiling C object 'tests/59830eb@@xe_prime_self_import@exe/intel_xe_prime_self_import.c.o'.
[622/1662] Compiling C object 'tests/v3d/cad21b8@@v3d_create_bo@exe/v3d_create_bo.c.o'.
[623/1662] Compiling C object 'tests/v3d/cad21b8@@v3d_get_bo_offset@exe/v3d_get_bo_offset.c.o'.
[624/1662] Compiling C object 'tests/59830eb@@kms_psr@exe/intel_kms_psr.c.o'.
[625/1662] Compiling C object 'tests/59830eb@@msm_submit@exe/msm_msm_submit.c.o'.
[626/1662] Compiling C object 'tests/59830eb@@msm_recovery@exe/msm_msm_recovery.c.o'.
[627/1662] Compiling C object 'tests/v3d/cad21b8@@v3d_get_param@exe/v3d_get_param.c.o'.
[628/1662] Compiling C object 'tests/59830eb@@xe_sysfs_scheduler@exe/intel_xe_sysfs_scheduler.c.o'.
[629/1662] Compiling C object 'tests/59830eb@@kms_chamelium_frames@exe/chamelium_kms_chamelium_helper.c.o'.
[630/1662] Compiling C object 'tests/59830eb@@kms_chamelium_audio@exe/chamelium_kms_chamelium_helper.c.o'.
[631/1662] Compiling C object 'tests/59830eb@@msm_shrink@exe/msm_msm_shrink.c.o'.
[632/1662] Compiling C object 'tests/59830eb@@kms_chamelium_hpd@exe/chamelium_kms_chamelium_helper.c.o'.
[633/1662] Compiling C object 'tests/59830eb@@gem_softpin@exe/intel_gem_softpin.c.o'.
[634/1662] Compiling C object 'tests/59830eb@@xe_pm@exe/intel_xe_pm.c.o'.
[635/1662] Compiling C object 'tests/59830eb@@kms_chamelium_color@exe/kms_color_helper.c.o'.
[636/1662] Compiling C object 'tests/59830eb@@kms_chamelium_edid@exe/chamelium_kms_chamelium_helper.c.o'.
[637/1662] Compiling C object 'tests/59830eb@@xe_query@exe/intel_xe_query.c.o'.
[638/1662] Compiling C object 'tests/59830eb@@xe_exec_balancer@exe/intel_xe_exec_balancer.c.o'.
[639/1662] Compiling C object 'tests/v3d/cad21b8@@v3d_job_submission@exe/v3d_job_submission.c.o'.
[640/1662] Compiling C object 'tests/59830eb@@xe_pat@exe/intel_xe_pat.c.o'.
[641/1662] Compiling C object 'tests/v3d/cad21b8@@v3d_submit_csd@exe/v3d_submit_csd.c.o'.
[642/1662] Compiling C object 'tests/59830eb@@xe_exec_reset@exe/intel_xe_exec_reset.c.o'.
[643/1662] Compiling C object 'tests/59830eb@@xe_evict@exe/intel_xe_evict.c.o'.
[644/1662] Compiling C object 'tests/59830eb@@kms_psr2_sf@exe/intel_kms_psr2_sf.c.o'.
[645/1662] Compiling C object 'tests/59830eb@@kms_chamelium_audio@exe/chamelium_kms_chamelium_audio.c.o'.
[646/1662] Compiling C object 'tests/59830eb@@i915_query@exe/intel_i915_query.c.o'.
[647/1662] Compiling C object 'tests/59830eb@@kms_chamelium_edid@exe/chamelium_kms_chamelium_edid.c.o'.
[648/1662] Compiling C object 'tests/59830eb@@xe_intel_bb@exe/intel_xe_intel_bb.c.o'.
[649/1662] Compiling C object 'tests/59830eb@@kms_chamelium_color@exe/chamelium_kms_chamelium_color.c.o'.
[650/1662] Compiling C object 'tests/59830eb@@gem_exec_balancer@exe/intel_gem_exec_balancer.c.o'.
[651/1662] Generating i915-perf-equations with a custom command.
[652/1662] Compiling C object 'tests/59830eb@@kms_chamelium_frames@exe/chamelium_kms_chamelium_frames.c.o'.
[653/1662] Compiling C object 'tests/59830eb@@kms_pm_rpm@exe/intel_kms_pm_rpm.c.o'.
[654/1662] Compiling C object 'tests/59830eb@@kms_chamelium_hpd@exe/chamelium_kms_chamelium_hpd.c.o'.
[655/1662] Compiling C object 'tests/59830eb@@gem_exec_fence@exe/intel_gem_exec_fence.c.o'.
[656/1662] Compiling C object 'tests/59830eb@@xe_vm@exe/intel_xe_vm.c.o'.
[657/1662] Compiling C object 'tests/59830eb@@kms_frontbuffer_tracking@exe/intel_kms_frontbuffer_tracking.c.o'.
[658/1662] Compiling C object 'tests/59830eb@@perf_pmu@exe/intel_perf_pmu.c.o'.
[659/1662] Compiling C object 'tests/59830eb@@gem_exec_schedule@exe/intel_gem_exec_schedule.c.o'.
[660/1662] Compiling C object 'tests/59830eb@@perf@exe/intel_perf.c.o'.
[661/1662] Linking target lib/libigt.so.0.
ninja: build stopped: subcommand failed.

