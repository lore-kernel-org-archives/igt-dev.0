Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 25 Oct 2023 10:05:51 -0000
Message-ID: <169822835128.20488.15880356888364214047@emeril.freedesktop.org>
References: <20231025091841.191503-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20231025091841.191503-1-mauro.chehab@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBsaWIv?=
 =?utf-8?q?igt=5Fsysfs=3A_move_kick=5Fsnd=5Fhda=5Fintel=28=29_to_igt=5Fkmo?=
 =?utf-8?b?ZC5j?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/igt_sysfs: move kick_snd_hda_intel() to igt_kmod.c
URL   : https://patchwork.freedesktop.org/series/125553/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
cdc8d1fcd23c0480145f83af79a222fd9ca2eeb6 tests/device_reset: fix logic to unbind when snd_hda_intel is loaded

Tail of build.log:
[270/1645] Compiling C object 'lib/76b5a35@@igt-rendercopy_i915_c@sta/rendercopy_i915.c.o'.
[271/1645] Compiling C object 'lib/76b5a35@@igt-rendercopy_i830_c@sta/rendercopy_i830.c.o'.
[272/1645] Compiling C object 'lib/76b5a35@@igt-igt_msm_c@sta/igt_msm.c.o'.
[273/1645] Compiling C object 'lib/76b5a35@@igt-xe_xe_gt_c@sta/xe_xe_gt.c.o'.
[274/1645] Compiling C object 'lib/76b5a35@@igt-intel_aux_pgtable_c@sta/intel_aux_pgtable.c.o'.
[275/1645] Compiling C object 'lib/76b5a35@@igt-intel_allocator_simple_c@sta/intel_allocator_simple.c.o'.
[276/1645] Compiling C object 'lib/76b5a35@@igt-igt_vc4_c@sta/igt_vc4.c.o'.
[277/1645] Compiling C object 'tests/59830eb@@kms_atomic_transition@exe/kms_atomic_transition.c.o'.
[278/1645] Compiling C object 'lib/76b5a35@@igt-intel_compute_c@sta/intel_compute.c.o'.
[279/1645] Compiling C object 'lib/76b5a35@@igt-veboxcopy_gen12_c@sta/veboxcopy_gen12.c.o'.
[280/1645] Compiling C object 'lib/76b5a35@@igt-igt_draw_c@sta/igt_draw.c.o'.
[281/1645] Compiling C object 'tests/59830eb@@kms_lease@exe/kms_lease.c.o'.
[282/1645] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen4_c@sta/rendercopy_gen4.c.o'.
[283/1645] Compiling C object 'tests/59830eb@@kms_flip@exe/kms_flip.c.o'.
[284/1645] Compiling C object 'lib/76b5a35@@igt-igt_edid_c@sta/igt_edid.c.o'.
[285/1645] Compiling C object 'lib/76b5a35@@igt-xe_xe_spin_c@sta/xe_xe_spin.c.o'.
[286/1645] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen7_c@sta/rendercopy_gen7.c.o'.
[287/1645] Compiling C object 'lib/76b5a35@@igt-xe_xe_ioctl_c@sta/xe_xe_ioctl.c.o'.
[288/1645] Compiling C object 'lib/76b5a35@@igt-ioctl_wrappers_c@sta/ioctl_wrappers.c.o'.
[289/1645] Compiling C object 'lib/76b5a35@@igt-igt_frame_c@sta/igt_frame.c.o'.
[290/1645] Compiling C object 'lib/76b5a35@@igt-instdone_c@sta/instdone.c.o'.
[291/1645] Compiling C object 'lib/76b5a35@@igt-xe_xe_util_c@sta/xe_xe_util.c.o'.
[292/1645] Compiling C object 'lib/76b5a35@@igt-igt_device_scan_c@sta/igt_device_scan.c.o'.
[293/1645] Compiling C object 'lib/76b5a35@@igt-intel_allocator_c@sta/intel_allocator.c.o'.
[294/1645] Compiling C object 'lib/76b5a35@@igt-xe_xe_query_c@sta/xe_xe_query.c.o'.
[295/1645] Compiling C object 'lib/76b5a35@@igt-igt_dummyload_c@sta/igt_dummyload.c.o'.
[296/1645] Compiling C object 'lib/76b5a35@@igt-gpu_cmds_c@sta/gpu_cmds.c.o'.
[297/1645] Compiling C object 'lib/76b5a35@@igt-igt_v3d_c@sta/igt_v3d.c.o'.
[298/1645] Compiling C object 'lib/76b5a35@@igt-igt_aux_c@sta/igt_aux.c.o'.
[299/1645] Compiling C object 'lib/76b5a35@@igt-igt_pm_c@sta/igt_pm.c.o'.
[300/1645] Compiling C object 'lib/76b5a35@@igt-intel_bufops_c@sta/intel_bufops.c.o'.
[301/1645] Compiling C object 'lib/76b5a35@@igt-igt_vmwgfx_c@sta/igt_vmwgfx.c.o'.
[302/1645] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen6_c@sta/rendercopy_gen6.c.o'.
[303/1645] Compiling C object 'tests/59830eb@@kms_atomic@exe/kms_atomic.c.o'.
[304/1645] Compiling C object 'lib/76b5a35@@igt-intel_blt_c@sta/intel_blt.c.o'.
[305/1645] Compiling C object 'lib/76b5a35@@igt-igt_amd_c@sta/igt_amd.c.o'.
[306/1645] Generating i915-perf-registers-acmgt3 with a custom command.
[307/1645] Compiling C object 'lib/76b5a35@@igt-igt_core_c@sta/igt_core.c.o'.
[308/1645] Compiling C object 'lib/76b5a35@@igt-intel_batchbuffer_c@sta/intel_batchbuffer.c.o'.
[309/1645] Compiling C object 'lib/76b5a35@@igt-igt_chamelium_c@sta/igt_chamelium.c.o'.
[310/1645] Generating i915-perf-metrics-acmgt3 with a custom command.
[311/1645] Compiling C object 'tests/59830eb@@kms_cursor_legacy@exe/kms_cursor_legacy.c.o'.
[312/1645] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen8_c@sta/rendercopy_gen8.c.o'.
[313/1645] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen9_c@sta/rendercopy_gen9.c.o'.
[314/1645] Compiling C object 'lib/76b5a35@@igt-i915_intel_decode_c@sta/i915_intel_decode.c.o'.
[315/1645] Compiling C object 'lib/76b5a35@@igt-igt_fb_c@sta/igt_fb.c.o'.
[316/1645] Compiling C object 'lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o'.
[317/1645] Compiling C object 'tests/59830eb@@perf@exe/intel_perf.c.o'.
[318/1645] Generating i915-perf-equations with a custom command.
ninja: build stopped: subcommand failed.



