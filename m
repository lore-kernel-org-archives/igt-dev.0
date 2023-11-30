Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Akshata Jahagirdar" <akshata.jahagirdar@intel.com>
Date: Thu, 30 Nov 2023 02:31:48 -0000
Message-ID: <170131150861.15643.277808671847555620@emeril.freedesktop.org>
References: <cover.1701180818.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1701180818.git.akshata.jahagirdar@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBDb21w?=
 =?utf-8?q?ression_support_for_Lunarlake_=28rev3=29?=
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

Series: Compression support for Lunarlake (rev3)
URL   : https://patchwork.freedesktop.org/series/126254/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
1d3bb21672bde1a423133738dc56611531ba7535 tests/intel-ci/xe: add pat and caching related tests

Tail of build.log:
[267/1662] Compiling C object 'lib/76b5a35@@igt-runnercomms_c@sta/runnercomms.c.o'.
[268/1662] Compiling C object 'lib/76b5a35@@igt-igt_infoframe_c@sta/igt_infoframe.c.o'.
[269/1662] Compiling C object 'lib/76b5a35@@igt-rendercopy_i915_c@sta/rendercopy_i915.c.o'.
[270/1662] Compiling C object 'lib/76b5a35@@igt-xe_xe_gt_c@sta/xe_xe_gt.c.o'.
[271/1662] Compiling C object 'tests/59830eb@@kms_lease@exe/kms_lease.c.o'.
[272/1662] Compiling C object 'lib/76b5a35@@igt-intel_allocator_simple_c@sta/intel_allocator_simple.c.o'.
[273/1662] Compiling C object 'lib/76b5a35@@igt-igt_panfrost_c@sta/igt_panfrost.c.o'.
[274/1662] Compiling C object 'lib/76b5a35@@igt-igt_psr_c@sta/igt_psr.c.o'.
[275/1662] Compiling C object 'lib/76b5a35@@igt-intel_aux_pgtable_c@sta/intel_aux_pgtable.c.o'.
[276/1662] Compiling C object 'lib/76b5a35@@igt-igt_eld_c@sta/igt_eld.c.o'.
[277/1662] Compiling C object 'lib/76b5a35@@igt-igt_ktap_c@sta/igt_ktap.c.o'.
[278/1662] Compiling C object 'lib/76b5a35@@igt-igt_dsc_c@sta/igt_dsc.c.o'.
[279/1662] Compiling C object 'lib/76b5a35@@igt-igt_msm_c@sta/igt_msm.c.o'.
[280/1662] Compiling C object 'lib/76b5a35@@igt-igt_edid_c@sta/igt_edid.c.o'.
[281/1662] Compiling C object 'lib/76b5a35@@igt-intel_compute_c@sta/intel_compute.c.o'.
[282/1662] Compiling C object 'lib/76b5a35@@igt-ioctl_wrappers_c@sta/ioctl_wrappers.c.o'.
[283/1662] Compiling C object 'lib/76b5a35@@igt-igt_vc4_c@sta/igt_vc4.c.o'.
[284/1662] Compiling C object 'lib/76b5a35@@igt-igt_dummyload_c@sta/igt_dummyload.c.o'.
[285/1662] Compiling C object 'lib/76b5a35@@igt-igt_aux_c@sta/igt_aux.c.o'.
[286/1662] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen4_c@sta/rendercopy_gen4.c.o'.
[287/1662] Compiling C object 'lib/76b5a35@@igt-intel_allocator_c@sta/intel_allocator.c.o'.
[288/1662] Compiling C object 'lib/76b5a35@@igt-veboxcopy_gen12_c@sta/veboxcopy_gen12.c.o'.
[289/1662] Compiling C object 'lib/76b5a35@@igt-igt_v3d_c@sta/igt_v3d.c.o'.
[290/1662] Compiling C object 'tests/59830eb@@kms_plane_scaling@exe/kms_plane_scaling.c.o'.
[291/1662] Compiling C object 'lib/76b5a35@@igt-instdone_c@sta/instdone.c.o'.
[292/1662] Compiling C object 'lib/76b5a35@@igt-igt_draw_c@sta/igt_draw.c.o'.
[293/1662] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen6_c@sta/rendercopy_gen6.c.o'.
[294/1662] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen7_c@sta/rendercopy_gen7.c.o'.
[295/1662] Compiling C object 'lib/76b5a35@@igt-igt_device_scan_c@sta/igt_device_scan.c.o'.
[296/1662] Compiling C object 'tests/59830eb@@kms_flip@exe/kms_flip.c.o'.
[297/1662] Compiling C object 'lib/76b5a35@@igt-gpu_cmds_c@sta/gpu_cmds.c.o'.
[298/1662] Compiling C object 'lib/76b5a35@@igt-igt_vmwgfx_c@sta/igt_vmwgfx.c.o'.
[299/1662] Compiling C object 'lib/76b5a35@@igt-intel_bufops_c@sta/intel_bufops.c.o'.
[300/1662] Compiling C object 'lib/76b5a35@@igt-igt_pm_c@sta/igt_pm.c.o'.
[301/1662] Compiling C object 'lib/76b5a35@@igt-igt_kmod_c@sta/igt_kmod.c.o'.
[302/1662] Generating i915-perf-registers-acmgt3 with a custom command.
[303/1662] Compiling C object 'lib/76b5a35@@igt-igt_amd_c@sta/igt_amd.c.o'.
[304/1662] Compiling C object 'tests/59830eb@@kms_atomic@exe/kms_atomic.c.o'.
[305/1662] Generating i915-perf-metrics-acmgt3 with a custom command.
[306/1662] Compiling C object 'tests/59830eb@@kms_cursor_legacy@exe/kms_cursor_legacy.c.o'.
[307/1662] Compiling C object 'lib/76b5a35@@igt-intel_batchbuffer_c@sta/intel_batchbuffer.c.o'.
[308/1662] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen8_c@sta/rendercopy_gen8.c.o'.
[309/1662] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen9_c@sta/rendercopy_gen9.c.o'.
[310/1662] Compiling C object 'lib/76b5a35@@igt-igt_core_c@sta/igt_core.c.o'.
[311/1662] Compiling C object 'tests/59830eb@@gem_userptr_blits@exe/intel_gem_userptr_blits.c.o'.
[312/1662] Compiling C object 'lib/76b5a35@@igt-i915_intel_decode_c@sta/i915_intel_decode.c.o'.
[313/1662] Compiling C object 'lib/76b5a35@@igt-igt_fb_c@sta/igt_fb.c.o'.
[314/1662] Compiling C object 'lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o'.
[315/1662] Generating i915-perf-equations with a custom command.
ninja: build stopped: subcommand failed.

