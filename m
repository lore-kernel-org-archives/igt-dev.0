Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Date: Fri, 17 Nov 2023 15:38:54 -0000
Message-ID: <170023553415.7876.7176113281078911753@emeril.freedesktop.org>
References: <20231117130316.5498-1-nirmoy.das@intel.com>
In-Reply-To: <20231117130316.5498-1-nirmoy.das@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?/xe=5Fspin=5Fbatch=3A_Add_spin-fixed-duration-with-preempter?=
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

Series: test/xe_spin_batch: Add spin-fixed-duration-with-preempter
URL   : https://patchwork.freedesktop.org/series/126583/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
9e0160a387768ffdffbd429c948eea8c5821ce4b drm-uapi/xe: Be more specific about vm_bind prefetch region

Tail of build.log:
[645/1657] Compiling C object 'tests/59830eb@@kms_chamelium_frames@exe/chamelium_kms_chamelium_helper.c.o'.
[646/1657] Compiling C object 'tests/59830eb@@gem_softpin@exe/intel_gem_softpin.c.o'.
[647/1657] Compiling C object 'benchmarks/cb1d2fd@@gem_prw@exe/gem_prw.c.o'.
[648/1657] Compiling C object 'tests/vmwgfx/776e741@@vmw_tri@exe/vmw_tri.c.o'.
[649/1657] Compiling C object 'tests/vc4/e4667e8@@vc4_tiling@exe/vc4_tiling.c.o'.
[650/1657] Compiling C object 'benchmarks/cb1d2fd@@gem_exec_fault@exe/gem_exec_fault.c.o'.
[651/1657] Compiling C object 'benchmarks/cb1d2fd@@gem_set_domain@exe/gem_set_domain.c.o'.
[652/1657] Compiling C object 'tests/59830eb@@kms_psr2_sf@exe/intel_kms_psr2_sf.c.o'.
[653/1657] Compiling C object 'tests/vc4/e4667e8@@vc4_wait_bo@exe/vc4_wait_bo.c.o'.
[654/1657] Compiling C object 'tests/59830eb@@kms_chamelium_color@exe/chamelium_kms_chamelium_color.c.o'.
[655/1657] Compiling C object 'tests/59830eb@@xe_exec_balancer@exe/intel_xe_exec_balancer.c.o'.
[656/1657] Compiling C object 'benchmarks/cb1d2fd@@gem_exec_ctx@exe/gem_exec_ctx.c.o'.
[657/1657] Compiling C object 'tests/vc4/e4667e8@@vc4_purgeable_bo@exe/vc4_purgeable_bo.c.o'.
[658/1657] Compiling C object 'tests/59830eb@@xe_evict@exe/intel_xe_evict.c.o'.
[659/1657] Compiling C object 'tests/vmwgfx/776e741@@vmw_execution_buffer@exe/vmw_execution_buffer.c.o'.
[660/1657] Compiling C object 'tests/59830eb@@kms_chamelium_audio@exe/chamelium_kms_chamelium_audio.c.o'.
[661/1657] Compiling C object 'tests/59830eb@@xe_exec_reset@exe/intel_xe_exec_reset.c.o'.
[662/1657] Compiling C object 'tests/59830eb@@xe_query@exe/intel_xe_query.c.o'.
[663/1657] Compiling C object 'benchmarks/cb1d2fd@@gem_exec_nop@exe/gem_exec_nop.c.o'.
[664/1657] Compiling C object 'benchmarks/cb1d2fd@@gem_busy@exe/gem_busy.c.o'.
[665/1657] Compiling C object 'benchmarks/cb1d2fd@@gem_exec_reloc@exe/gem_exec_reloc.c.o'.
[666/1657] Compiling C object 'tests/v3d/cad21b8@@v3d_submit_cl@exe/v3d_submit_cl.c.o'.
[667/1657] Compiling C object 'benchmarks/cb1d2fd@@gem_create@exe/gem_create.c.o'.
[668/1657] Compiling C object 'tests/v3d/cad21b8@@v3d_submit_csd@exe/v3d_submit_csd.c.o'.
[669/1657] Compiling C object 'tests/59830eb@@kms_chamelium_edid@exe/chamelium_kms_chamelium_edid.c.o'.
[670/1657] Compiling C object 'tests/vmwgfx/776e741@@vmw_ref_count@exe/vmw_ref_count.c.o'.
[671/1657] Compiling C object 'tests/vmwgfx/776e741@@vmw_surface_copy@exe/vmw_surface_copy.c.o'.
[672/1657] Compiling C object 'benchmarks/cb1d2fd@@gem_exec_trace@exe/gem_exec_trace.c.o'.
[673/1657] Compiling C object 'tests/59830eb@@kms_pm_rpm@exe/intel_kms_pm_rpm.c.o'.
[674/1657] Compiling C object 'tests/59830eb@@kms_chamelium_frames@exe/chamelium_kms_chamelium_frames.c.o'.
[675/1657] Compiling C object 'tests/59830eb@@kms_chamelium_hpd@exe/chamelium_kms_chamelium_hpd.c.o'.
[676/1657] Compiling C object 'benchmarks/cb1d2fd@@gem_blt@exe/gem_blt.c.o'.
[677/1657] Compiling C object 'tests/59830eb@@i915_query@exe/intel_i915_query.c.o'.
[678/1657] Compiling C object 'benchmarks/cb1d2fd@@gem_syslatency@exe/gem_syslatency.c.o'.
[679/1657] Compiling C object 'tests/59830eb@@xe_exec_threads@exe/intel_xe_exec_threads.c.o'.
[680/1657] Compiling C object 'tests/59830eb@@xe_intel_bb@exe/intel_xe_intel_bb.c.o'.
[681/1657] Compiling C object 'tests/59830eb@@gem_exec_balancer@exe/intel_gem_exec_balancer.c.o'.
[682/1657] Compiling C object 'benchmarks/cb1d2fd@@gem_latency@exe/gem_latency.c.o'.
[683/1657] Compiling C object 'tests/59830eb@@gem_stress@exe/intel_gem_stress.c.o'.
[684/1657] Compiling C object 'tests/59830eb@@xe_vm@exe/intel_xe_vm.c.o'.
[685/1657] Compiling C object 'tests/59830eb@@gem_exec_fence@exe/intel_gem_exec_fence.c.o'.
[686/1657] Compiling C object 'tests/59830eb@@gem_userptr_blits@exe/intel_gem_userptr_blits.c.o'.
[687/1657] Generating i915-perf-equations with a custom command.
[688/1657] Compiling C object 'tests/59830eb@@kms_frontbuffer_tracking@exe/intel_kms_frontbuffer_tracking.c.o'.
[689/1657] Compiling C object 'tests/59830eb@@gem_concurrent_all@exe/intel_gem_concurrent_all.c.o'.
[690/1657] Compiling C object 'tests/59830eb@@perf_pmu@exe/intel_perf_pmu.c.o'.
[691/1657] Compiling C object 'tests/59830eb@@perf@exe/intel_perf.c.o'.
[692/1657] Compiling C object 'tests/59830eb@@gem_exec_schedule@exe/intel_gem_exec_schedule.c.o'.
[693/1657] Linking target lib/libigt.so.0.
ninja: build stopped: subcommand failed.

