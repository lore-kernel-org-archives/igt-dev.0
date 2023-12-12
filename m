Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_RFC=3A_drm-uapi/xe=3A_add?=
 =?utf-8?q?_exec=5Fqueue=5Fid_member_to_drm=5Fxe=5Fwait=5Fuser=5Ffence_struc?=
 =?utf-8?q?ture_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bommu Krishnaiah" <krishnaiah.bommu@intel.com>
Date: Tue, 12 Dec 2023 05:35:57 -0000
Message-ID: <170235935725.31293.3050107583521937203@emeril.freedesktop.org>
References: <20231212051040.6912-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20231212051040.6912-1-krishnaiah.bommu@intel.com>
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

Series: RFC: drm-uapi/xe: add exec_queue_id member to drm_xe_wait_user_fence structure (rev7)
URL   : https://patchwork.freedesktop.org/series/127364/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
0b796be8ce05cb2070ce5136d248f438c962d11e tests/intel: Add Xe peer2peer test

Tail of build.log:
[621/1665] Compiling C object 'tests/59830eb@@kms_chamelium_edid@exe/chamelium_kms_chamelium_helper.c.o'.
[622/1665] Compiling C object 'tests/59830eb@@kms_chamelium_audio@exe/chamelium_kms_chamelium_helper.c.o'.
[623/1665] Compiling C object 'tests/59830eb@@kms_psr@exe/intel_kms_psr.c.o'.
[624/1665] Compiling C object 'tests/v3d/cad21b8@@v3d_mmap@exe/v3d_mmap.c.o'.
[625/1665] Compiling C object 'tests/v3d/cad21b8@@v3d_get_param@exe/v3d_get_param.c.o'.
[626/1665] Compiling C object 'tests/59830eb@@i915_pm_rpm@exe/intel_i915_pm_rpm.c.o'.
[627/1665] Compiling C object 'tests/vc4/e4667e8@@vc4_create_bo@exe/vc4_create_bo.c.o'.
[628/1665] Compiling C object 'tests/vc4/e4667e8@@vc4_lookup_fail@exe/vc4_lookup_fail.c.o'.
[629/1665] Compiling C object 'tests/59830eb@@gem_sync@exe/intel_gem_sync.c.o'.
[630/1665] Compiling C object 'tests/59830eb@@msm_shrink@exe/msm_msm_shrink.c.o'.
[631/1665] Compiling C object 'lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o'.
[632/1665] Compiling C object 'tests/59830eb@@kms_chamelium_hpd@exe/chamelium_kms_chamelium_helper.c.o'.
[633/1665] Compiling C object 'tests/v3d/cad21b8@@v3d_get_bo_offset@exe/v3d_get_bo_offset.c.o'.
[634/1665] Compiling C object 'tests/vc4/e4667e8@@vc4_mmap@exe/vc4_mmap.c.o'.
[635/1665] Compiling C object 'tests/v3d/cad21b8@@v3d_wait_bo@exe/v3d_wait_bo.c.o'.
[636/1665] Compiling C object 'tests/vc4/e4667e8@@vc4_dmabuf_poll@exe/vc4_dmabuf_poll.c.o'.
[637/1665] Compiling C object 'tests/59830eb@@kms_chamelium_frames@exe/chamelium_kms_chamelium_helper.c.o'.
[638/1665] Compiling C object 'tests/59830eb@@xe_pm@exe/intel_xe_pm.c.o'.
[639/1665] Compiling C object 'tests/59830eb@@xe_exec_balancer@exe/intel_xe_exec_balancer.c.o'.
[640/1665] Compiling C object 'tests/59830eb@@xe_exec_reset@exe/intel_xe_exec_reset.c.o'.
[641/1665] Compiling C object 'tests/59830eb@@kms_chamelium_color@exe/kms_color_helper.c.o'.
[642/1665] Compiling C object 'tests/59830eb@@gem_softpin@exe/intel_gem_softpin.c.o'.
[643/1665] Compiling C object 'tests/59830eb@@xe_query@exe/intel_xe_query.c.o'.
[644/1665] Compiling C object 'tests/vc4/e4667e8@@vc4_label_bo@exe/vc4_label_bo.c.o'.
[645/1665] Compiling C object 'tests/vc4/e4667e8@@vc4_purgeable_bo@exe/vc4_purgeable_bo.c.o'.
[646/1665] Compiling C object 'tests/59830eb@@kms_chamelium_color@exe/chamelium_kms_chamelium_color.c.o'.
[647/1665] Compiling C object 'tests/v3d/cad21b8@@v3d_perfmon@exe/v3d_perfmon.c.o'.
[648/1665] Compiling C object 'tests/v3d/cad21b8@@v3d_job_submission@exe/v3d_job_submission.c.o'.
[649/1665] Compiling C object 'tests/59830eb@@xe_evict@exe/intel_xe_evict.c.o'.
[650/1665] Compiling C object 'tests/v3d/cad21b8@@v3d_submit_csd@exe/v3d_submit_csd.c.o'.
[651/1665] Compiling C object 'tests/59830eb@@kms_psr2_sf@exe/intel_kms_psr2_sf.c.o'.
[652/1665] Compiling C object 'tests/59830eb@@kms_chamelium_hpd@exe/chamelium_kms_chamelium_hpd.c.o'.
[653/1665] Compiling C object 'tests/59830eb@@kms_chamelium_audio@exe/chamelium_kms_chamelium_audio.c.o'.
[654/1665] Compiling C object 'tests/v3d/cad21b8@@v3d_submit_cl@exe/v3d_submit_cl.c.o'.
[655/1665] Compiling C object 'tests/59830eb@@xe_pat@exe/intel_xe_pat.c.o'.
[656/1665] Compiling C object 'tests/59830eb@@kms_chamelium_edid@exe/chamelium_kms_chamelium_edid.c.o'.
[657/1665] Compiling C object 'tests/59830eb@@xe_exec_threads@exe/intel_xe_exec_threads.c.o'.
[658/1665] Compiling C object 'tests/59830eb@@kms_pm_rpm@exe/intel_kms_pm_rpm.c.o'.
[659/1665] Compiling C object 'tests/59830eb@@i915_query@exe/intel_i915_query.c.o'.
[660/1665] Compiling C object 'tests/59830eb@@xe_intel_bb@exe/intel_xe_intel_bb.c.o'.
[661/1665] Compiling C object 'tests/59830eb@@kms_chamelium_frames@exe/chamelium_kms_chamelium_frames.c.o'.
[662/1665] Compiling C object 'tests/59830eb@@gem_exec_balancer@exe/intel_gem_exec_balancer.c.o'.
[663/1665] Compiling C object 'tests/59830eb@@gem_exec_fence@exe/intel_gem_exec_fence.c.o'.
[664/1665] Compiling C object 'tests/59830eb@@xe_vm@exe/intel_xe_vm.c.o'.
[665/1665] Generating i915-perf-equations with a custom command.
[666/1665] Compiling C object 'tests/59830eb@@kms_frontbuffer_tracking@exe/intel_kms_frontbuffer_tracking.c.o'.
[667/1665] Compiling C object 'tests/59830eb@@perf_pmu@exe/intel_perf_pmu.c.o'.
[668/1665] Compiling C object 'tests/59830eb@@gem_exec_schedule@exe/intel_gem_exec_schedule.c.o'.
[669/1665] Compiling C object 'tests/59830eb@@perf@exe/intel_perf.c.o'.
ninja: build stopped: subcommand failed.

