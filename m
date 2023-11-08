Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: janga.rahul.kumar@intel.com
Date: Wed, 08 Nov 2023 09:44:00 -0000
Message-ID: <169943664031.24275.5920137664414555223@emeril.freedesktop.org>
References: <20231108091629.814209-1-janga.rahul.kumar@intel.com>
In-Reply-To: <20231108091629.814209-1-janga.rahul.kumar@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBBZGQg?=
 =?utf-8?q?wait_fence_Negative_tests?=
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

Series: Add wait fence Negative tests
URL   : https://patchwork.freedesktop.org/series/126126/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
d529fa7368a622634a9842a99df155cd10570446 tests/kms_frontbuffer_tracking: Extend the test to enable FBC for each plane

Tail of build.log:
[633/1654] Compiling C object 'tests/vc4/e4667e8@@vc4_label_bo@exe/vc4_label_bo.c.o'.
[634/1654] Compiling C object 'tests/vc4/e4667e8@@vc4_mmap@exe/vc4_mmap.c.o'.
[635/1654] Compiling C object 'tests/vc4/e4667e8@@vc4_dmabuf_poll@exe/vc4_dmabuf_poll.c.o'.
[636/1654] Compiling C object 'tests/59830eb@@kms_chamelium_frames@exe/chamelium_kms_chamelium_helper.c.o'.
[637/1654] Compiling C object 'tests/59830eb@@xe_exec_balancer@exe/intel_xe_exec_balancer.c.o'.
[638/1654] Compiling C object 'tests/v3d/cad21b8@@v3d_perfmon@exe/v3d_perfmon.c.o'.
[639/1654] Compiling C object 'tests/v3d/cad21b8@@v3d_job_submission@exe/v3d_job_submission.c.o'.
[640/1654] Compiling C object 'tests/vc4/e4667e8@@vc4_create_bo@exe/vc4_create_bo.c.o'.
[641/1654] Compiling C object 'tests/59830eb@@xe_pm@exe/intel_xe_pm.c.o'.
[642/1654] Compiling C object 'tests/vc4/e4667e8@@vc4_perfmon@exe/vc4_perfmon.c.o'.
[643/1654] Compiling C object 'tests/59830eb@@xe_query@exe/intel_xe_query.c.o'.
[644/1654] Compiling C object 'tests/v3d/cad21b8@@v3d_wait_bo@exe/v3d_wait_bo.c.o'.
[645/1654] Compiling C object 'tests/vc4/e4667e8@@vc4_wait_bo@exe/vc4_wait_bo.c.o'.
[646/1654] Compiling C object 'tests/vc4/e4667e8@@vc4_purgeable_bo@exe/vc4_purgeable_bo.c.o'.
[647/1654] Compiling C object 'tests/vc4/e4667e8@@vc4_wait_seqno@exe/vc4_wait_seqno.c.o'.
[648/1654] Compiling C object 'tests/vc4/e4667e8@@vc4_tiling@exe/vc4_tiling.c.o'.
[649/1654] Compiling C object 'tests/59830eb@@xe_evict@exe/intel_xe_evict.c.o'.
[650/1654] Compiling C object 'tests/v3d/cad21b8@@v3d_submit_csd@exe/v3d_submit_csd.c.o'.
[651/1654] Compiling C object 'tests/59830eb@@xe_exec_reset@exe/intel_xe_exec_reset.c.o'.
[652/1654] Compiling C object 'tests/vmwgfx/776e741@@vmw_mob_stress@exe/vmw_mob_stress.c.o'.
[653/1654] Compiling C object 'tests/vmwgfx/776e741@@vmw_tri@exe/vmw_tri.c.o'.
[654/1654] Compiling C object 'tests/vmwgfx/776e741@@vmw_execution_buffer@exe/vmw_execution_buffer.c.o'.
[655/1654] Compiling C object 'tests/59830eb@@kms_chamelium_hpd@exe/chamelium_kms_chamelium_hpd.c.o'.
[656/1654] Compiling C object 'tests/59830eb@@i915_query@exe/intel_i915_query.c.o'.
[657/1654] Compiling C object 'tests/vmwgfx/776e741@@vmw_surface_copy@exe/vmw_surface_copy.c.o'.
[658/1654] Compiling C object 'tests/vmwgfx/776e741@@vmw_ref_count@exe/vmw_ref_count.c.o'.
[659/1654] Compiling C object 'benchmarks/cb1d2fd@@gem_busy@exe/gem_busy.c.o'.
[660/1654] Compiling C object 'tests/59830eb@@kms_chamelium_audio@exe/chamelium_kms_chamelium_audio.c.o'.
[661/1654] Compiling C object 'benchmarks/cb1d2fd@@gem_blt@exe/gem_blt.c.o'.
[662/1654] Compiling C object 'tests/v3d/cad21b8@@v3d_submit_cl@exe/v3d_submit_cl.c.o'.
[663/1654] Compiling C object 'tests/59830eb@@kms_chamelium_color@exe/chamelium_kms_chamelium_color.c.o'.
[664/1654] Compiling C object 'tests/59830eb@@kms_chamelium_edid@exe/chamelium_kms_chamelium_edid.c.o'.
[665/1654] Compiling C object 'tests/59830eb@@kms_psr2_sf@exe/intel_kms_psr2_sf.c.o'.
[666/1654] Compiling C object 'tests/59830eb@@kms_pm_rpm@exe/intel_kms_pm_rpm.c.o'.
[667/1654] Compiling C object 'tests/59830eb@@xe_intel_bb@exe/intel_xe_intel_bb.c.o'.
[668/1654] Compiling C object 'tests/59830eb@@kms_chamelium_frames@exe/chamelium_kms_chamelium_frames.c.o'.
[669/1654] Generating i915-perf-equations with a custom command.
[670/1654] Compiling C object 'tests/59830eb@@xe_exec_threads@exe/intel_xe_exec_threads.c.o'.
[671/1654] Compiling C object 'tests/59830eb@@gem_exec_balancer@exe/intel_gem_exec_balancer.c.o'.
[672/1654] Compiling C object 'tests/59830eb@@gem_stress@exe/intel_gem_stress.c.o'.
[673/1654] Compiling C object 'tests/59830eb@@xe_vm@exe/intel_xe_vm.c.o'.
[674/1654] Compiling C object 'tests/59830eb@@gem_exec_fence@exe/intel_gem_exec_fence.c.o'.
[675/1654] Compiling C object 'tests/59830eb@@gem_userptr_blits@exe/intel_gem_userptr_blits.c.o'.
[676/1654] Compiling C object 'tests/59830eb@@kms_frontbuffer_tracking@exe/intel_kms_frontbuffer_tracking.c.o'.
[677/1654] Compiling C object 'tests/59830eb@@gem_concurrent_all@exe/intel_gem_concurrent_all.c.o'.
[678/1654] Compiling C object 'tests/59830eb@@perf_pmu@exe/intel_perf_pmu.c.o'.
[679/1654] Compiling C object 'tests/59830eb@@perf@exe/intel_perf.c.o'.
[680/1654] Compiling C object 'tests/59830eb@@gem_exec_schedule@exe/intel_gem_exec_schedule.c.o'.
[681/1654] Linking target lib/libigt.so.0.
ninja: build stopped: subcommand failed.

