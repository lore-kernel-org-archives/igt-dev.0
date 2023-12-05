Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bommu Krishnaiah" <krishnaiah.bommu@intel.com>
Date: Tue, 05 Dec 2023 15:32:23 -0000
Message-ID: <170179034351.24286.16710208491021524195@emeril.freedesktop.org>
References: <20231205143622.4704-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20231205143622.4704-1-krishnaiah.bommu@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBSRkM6?=
 =?utf-8?q?_drm-uapi/xe=3A_add_exec=5Fqueue=5Fid_member_to_drm=5Fxe=5Fwait?=
 =?utf-8?q?=5Fuser=5Ffence_structure?=
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

Series: RFC: drm-uapi/xe: add exec_queue_id member to drm_xe_wait_user_fence structure
URL   : https://patchwork.freedesktop.org/series/127364/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
48a47d91b7727215b965690c69d84159c8fb1aa2 Revert "test/xe_spin_batch: Add spin-fixed-duration-with-preempter"

Tail of build.log:
[650/1662] Compiling C object 'tests/v3d/cad21b8@@v3d_job_submission@exe/v3d_job_submission.c.o'.
[651/1662] Compiling C object 'benchmarks/cb1d2fd@@gem_prw@exe/gem_prw.c.o'.
[652/1662] Compiling C object 'benchmarks/cb1d2fd@@gem_set_domain@exe/gem_set_domain.c.o'.
[653/1662] Compiling C object 'tests/59830eb@@xe_exec_reset@exe/intel_xe_exec_reset.c.o'.
[654/1662] Compiling C object 'tests/vc4/e4667e8@@vc4_wait_bo@exe/vc4_wait_bo.c.o'.
[655/1662] Compiling C object 'tests/59830eb@@xe_evict@exe/intel_xe_evict.c.o'.
[656/1662] Compiling C object 'tests/vc4/e4667e8@@vc4_perfmon@exe/vc4_perfmon.c.o'.
[657/1662] Compiling C object 'tests/vmwgfx/776e741@@vmw_mob_stress@exe/vmw_mob_stress.c.o'.
[658/1662] Compiling C object 'tests/59830eb@@xe_query@exe/intel_xe_query.c.o'.
[659/1662] Compiling C object 'benchmarks/cb1d2fd@@gem_exec_ctx@exe/gem_exec_ctx.c.o'.
[660/1662] Compiling C object 'benchmarks/cb1d2fd@@gem_create@exe/gem_create.c.o'.
[661/1662] Compiling C object 'tests/vmwgfx/776e741@@vmw_tri@exe/vmw_tri.c.o'.
[662/1662] Compiling C object 'tests/vmwgfx/776e741@@vmw_ref_count@exe/vmw_ref_count.c.o'.
[663/1662] Compiling C object 'benchmarks/cb1d2fd@@gem_exec_nop@exe/gem_exec_nop.c.o'.
[664/1662] Compiling C object 'tests/59830eb@@kms_chamelium_color@exe/chamelium_kms_chamelium_color.c.o'.
[665/1662] Compiling C object 'tests/v3d/cad21b8@@v3d_submit_csd@exe/v3d_submit_csd.c.o'.
[666/1662] Compiling C object 'benchmarks/cb1d2fd@@gem_exec_fault@exe/gem_exec_fault.c.o'.
[667/1662] Compiling C object 'benchmarks/cb1d2fd@@gem_exec_reloc@exe/gem_exec_reloc.c.o'.
[668/1662] Compiling C object 'tests/vmwgfx/776e741@@vmw_execution_buffer@exe/vmw_execution_buffer.c.o'.
[669/1662] Compiling C object 'tests/59830eb@@kms_chamelium_edid@exe/chamelium_kms_chamelium_edid.c.o'.
[670/1662] Compiling C object 'tests/59830eb@@kms_chamelium_hpd@exe/chamelium_kms_chamelium_hpd.c.o'.
[671/1662] Compiling C object 'tests/vmwgfx/776e741@@vmw_surface_copy@exe/vmw_surface_copy.c.o'.
[672/1662] Compiling C object 'benchmarks/cb1d2fd@@gem_busy@exe/gem_busy.c.o'.
[673/1662] Compiling C object 'tests/59830eb@@xe_pat@exe/intel_xe_pat.c.o'.
[674/1662] Compiling C object 'benchmarks/cb1d2fd@@gem_exec_trace@exe/gem_exec_trace.c.o'.
[675/1662] Compiling C object 'tests/59830eb@@kms_psr2_sf@exe/intel_kms_psr2_sf.c.o'.
[676/1662] Compiling C object 'tests/v3d/cad21b8@@v3d_submit_cl@exe/v3d_submit_cl.c.o'.
[677/1662] Compiling C object 'benchmarks/cb1d2fd@@gem_userptr_benchmark@exe/gem_userptr_benchmark.c.o'.
[678/1662] Compiling C object 'benchmarks/cb1d2fd@@gem_blt@exe/gem_blt.c.o'.
[679/1662] Compiling C object 'tests/59830eb@@kms_chamelium_audio@exe/chamelium_kms_chamelium_audio.c.o'.
[680/1662] Compiling C object 'tests/59830eb@@kms_pm_rpm@exe/intel_kms_pm_rpm.c.o'.
[681/1662] Compiling C object 'tests/59830eb@@i915_query@exe/intel_i915_query.c.o'.
[682/1662] Compiling C object 'tests/59830eb@@xe_intel_bb@exe/intel_xe_intel_bb.c.o'.
[683/1662] Compiling C object 'benchmarks/cb1d2fd@@gem_syslatency@exe/gem_syslatency.c.o'.
[684/1662] Compiling C object 'benchmarks/cb1d2fd@@gem_latency@exe/gem_latency.c.o'.
[685/1662] Compiling C object 'tests/59830eb@@kms_chamelium_frames@exe/chamelium_kms_chamelium_frames.c.o'.
[686/1662] Compiling C object 'tests/59830eb@@gem_exec_balancer@exe/intel_gem_exec_balancer.c.o'.
[687/1662] Compiling C object 'tests/59830eb@@xe_exec_threads@exe/intel_xe_exec_threads.c.o'.
[688/1662] Compiling C object 'tests/59830eb@@gem_stress@exe/intel_gem_stress.c.o'.
[689/1662] Compiling C object 'tests/59830eb@@xe_vm@exe/intel_xe_vm.c.o'.
[690/1662] Generating i915-perf-equations with a custom command.
[691/1662] Compiling C object 'tests/59830eb@@gem_exec_fence@exe/intel_gem_exec_fence.c.o'.
[692/1662] Compiling C object 'tests/59830eb@@gem_concurrent_all@exe/intel_gem_concurrent_all.c.o'.
[693/1662] Compiling C object 'tests/59830eb@@perf_pmu@exe/intel_perf_pmu.c.o'.
[694/1662] Compiling C object 'tests/59830eb@@kms_frontbuffer_tracking@exe/intel_kms_frontbuffer_tracking.c.o'.
[695/1662] Compiling C object 'benchmarks/cb1d2fd@@gem_wsim@exe/gem_wsim.c.o'.
[696/1662] Compiling C object 'tests/59830eb@@perf@exe/intel_perf.c.o'.
[697/1662] Compiling C object 'tests/59830eb@@gem_exec_schedule@exe/intel_gem_exec_schedule.c.o'.
[698/1662] Linking target lib/libigt.so.0.
ninja: build stopped: subcommand failed.

