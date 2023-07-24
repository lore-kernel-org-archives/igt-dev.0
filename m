Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Mon, 24 Jul 2023 13:28:35 -0000
Message-ID: <169020531500.30102.12536123957470651481@emeril.freedesktop.org>
References: <20230721151528.495893-1-matthew.auld@intel.com>
In-Reply-To: <20230721151528.495893-1-matthew.auld@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBJR1Qg?=
 =?utf-8?q?bits_for_small-bar_=28rev7=29?=
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

Series: IGT bits for small-bar (rev7)
URL   : https://patchwork.freedesktop.org/series/115786/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
86fa0e885f8d020eeb046f27fae5729d5962ebd7 tests/intel-ci: move chamelium testlist inside igt

Tail of build.log:
[311/1616] Compiling C object 'lib/76b5a35@@igt-ioctl_wrappers_c@sta/ioctl_wrappers.c.o'.
[312/1616] Compiling C object 'lib/76b5a35@@igt-xe_xe_spin_c@sta/xe_xe_spin.c.o'.
[313/1616] Compiling C object 'tests/59830eb@@prime_udl@exe/prime_udl.c.o'.
[314/1616] Compiling C object 'tests/59830eb@@meta_test@exe/meta_test.c.o'.
[315/1616] Compiling C object 'lib/76b5a35@@igt-igt_chamelium_stream_c@sta/igt_chamelium_stream.c.o'.
[316/1616] Compiling C object 'lib/76b5a35@@igt-veboxcopy_gen12_c@sta/veboxcopy_gen12.c.o'.
[317/1616] Compiling C object 'lib/76b5a35@@igt-intel_allocator_c@sta/intel_allocator.c.o'.
[318/1616] Compiling C object 'lib/76b5a35@@igt-xe_xe_compute_c@sta/xe_xe_compute.c.o'.
[319/1616] Compiling C object 'lib/76b5a35@@igt-igt_dummyload_c@sta/igt_dummyload.c.o'.
[320/1616] Compiling C object 'lib/76b5a35@@igt-igt_kmod_c@sta/igt_kmod.c.o'.
[321/1616] Compiling C object 'tests/59830eb@@panfrost_gem_new@exe/panfrost_gem_new.c.o'.
[322/1616] Compiling C object 'lib/76b5a35@@igt-igt_audio_c@sta/igt_audio.c.o'.
[323/1616] Compiling C object 'lib/76b5a35@@igt-igt_alsa_c@sta/igt_alsa.c.o'.
[324/1616] Compiling C object 'tests/59830eb@@kms_plane_scaling@exe/kms_plane_scaling.c.o'.
[325/1616] Compiling C object 'lib/76b5a35@@igt-igt_aux_c@sta/igt_aux.c.o'.
[326/1616] Compiling C object 'tests/59830eb@@prime_mmap_kms@exe/prime_mmap_kms.c.o'.
[327/1616] Compiling C object 'lib/76b5a35@@igt-igt_device_scan_c@sta/igt_device_scan.c.o'.
[328/1616] Compiling C object 'lib/76b5a35@@igt-igt_v3d_c@sta/igt_v3d.c.o'.
[329/1616] Compiling C object 'lib/76b5a35@@igt-igt_draw_c@sta/igt_draw.c.o'.
[330/1616] Compiling C object 'tests/59830eb@@prime_busy@exe/prime_busy.c.o'.
[331/1616] Compiling C object 'tests/59830eb@@kms_flip@exe/kms_flip.c.o'.
[332/1616] Compiling C object 'lib/76b5a35@@igt-instdone_c@sta/instdone.c.o'.
[333/1616] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen6_c@sta/rendercopy_gen6.c.o'.
[334/1616] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen7_c@sta/rendercopy_gen7.c.o'.
[335/1616] Compiling C object 'tests/59830eb@@panfrost_submit@exe/panfrost_submit.c.o'.
[336/1616] Compiling C object 'lib/76b5a35@@igt-gpu_cmds_c@sta/gpu_cmds.c.o'.
[337/1616] Compiling C object 'lib/76b5a35@@igt-intel_bufops_c@sta/intel_bufops.c.o'.
[338/1616] Compiling C object 'tests/59830eb@@prime_self_import@exe/prime_self_import.c.o'.
[339/1616] Compiling C object 'tests/59830eb@@prime_mmap_coherency@exe/prime_mmap_coherency.c.o'.
[340/1616] Compiling C object 'lib/76b5a35@@igt-intel_blt_c@sta/intel_blt.c.o'.
[341/1616] Compiling C object 'tests/59830eb@@kms_writeback@exe/kms_writeback.c.o'.
[342/1616] Compiling C object 'lib/76b5a35@@igt-igt_pm_c@sta/igt_pm.c.o'.
[343/1616] Compiling C object 'tests/59830eb@@kms_vblank@exe/kms_vblank.c.o'.
[344/1616] Compiling C object 'lib/76b5a35@@igt-igt_vmwgfx_c@sta/igt_vmwgfx.c.o'.
[345/1616] Compiling C object 'tests/59830eb@@prime_mmap@exe/prime_mmap.c.o'.
[346/1616] Compiling C object 'lib/76b5a35@@igt-igt_amd_c@sta/igt_amd.c.o'.
[347/1616] Generating i915-perf-registers-acmgt3 with a custom command.
[348/1616] Generating i915-perf-metrics-acmgt3 with a custom command.
[349/1616] Compiling C object 'lib/76b5a35@@igt-intel_batchbuffer_c@sta/intel_batchbuffer.c.o'.
[350/1616] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen8_c@sta/rendercopy_gen8.c.o'.
[351/1616] Compiling C object 'tests/59830eb@@kms_cursor_legacy@exe/kms_cursor_legacy.c.o'.
[352/1616] Compiling C object 'tests/59830eb@@prime_vgem@exe/prime_vgem.c.o'.
[353/1616] Compiling C object 'lib/76b5a35@@igt-igt_core_c@sta/igt_core.c.o'.
[354/1616] Compiling C object 'lib/76b5a35@@igt-igt_chamelium_c@sta/igt_chamelium.c.o'.
[355/1616] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen9_c@sta/rendercopy_gen9.c.o'.
[356/1616] Compiling C object 'lib/76b5a35@@igt-i915_intel_decode_c@sta/i915_intel_decode.c.o'.
[357/1616] Compiling C object 'lib/76b5a35@@igt-igt_fb_c@sta/igt_fb.c.o'.
[358/1616] Compiling C object 'lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o'.
[359/1616] Generating i915-perf-equations with a custom command.
ninja: build stopped: subcommand failed.

