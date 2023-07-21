Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Fri, 21 Jul 2023 17:02:26 -0000
Message-ID: <168995894678.22548.147506729767394881@emeril.freedesktop.org>
References: <20230721151528.495893-1-matthew.auld@intel.com>
In-Reply-To: <20230721151528.495893-1-matthew.auld@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBJR1Qg?=
 =?utf-8?q?bits_for_small-bar_=28rev6=29?=
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

Series: IGT bits for small-bar (rev6)
URL   : https://patchwork.freedesktop.org/series/115786/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
602cdd3c87fad86cab8b15fe4242f2a119ce48df lib: Make igt_while_interruptible() thread-safe

Tail of build.log:
[310/1616] Compiling C object 'lib/76b5a35@@igt-xe_xe_compute_c@sta/xe_xe_compute.c.o'.
[311/1616] Compiling C object 'lib/76b5a35@@igt-igt_device_scan_c@sta/igt_device_scan.c.o'.
[312/1616] Compiling C object 'lib/76b5a35@@igt-igt_frame_c@sta/igt_frame.c.o'.
[313/1616] Compiling C object 'lib/76b5a35@@igt-igt_draw_c@sta/igt_draw.c.o'.
[314/1616] Compiling C object 'tests/59830eb@@kms_selftest@exe/kms_selftest.c.o'.
[315/1616] Compiling C object 'lib/76b5a35@@igt-igt_v3d_c@sta/igt_v3d.c.o'.
[316/1616] Compiling C object 'tests/59830eb@@kms_scaling_modes@exe/kms_scaling_modes.c.o'.
[317/1616] Compiling C object 'tests/59830eb@@kms_sysfs_edid_timing@exe/kms_sysfs_edid_timing.c.o'.
[318/1616] Compiling C object 'lib/76b5a35@@igt-gpu_cmds_c@sta/gpu_cmds.c.o'.
[319/1616] Compiling C object 'lib/76b5a35@@igt-igt_chamelium_stream_c@sta/igt_chamelium_stream.c.o'.
[320/1616] Compiling C object 'lib/76b5a35@@igt-igt_alsa_c@sta/igt_alsa.c.o'.
[321/1616] Compiling C object 'tests/59830eb@@kms_rmfb@exe/kms_rmfb.c.o'.
[322/1616] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen7_c@sta/rendercopy_gen7.c.o'.
[323/1616] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen6_c@sta/rendercopy_gen6.c.o'.
[324/1616] Compiling C object 'tests/59830eb@@kms_plane_lowres@exe/kms_plane_lowres.c.o'.
[325/1616] Compiling C object 'lib/76b5a35@@igt-igt_audio_c@sta/igt_audio.c.o'.
[326/1616] Compiling C object 'tests/59830eb@@kms_tv_load_detect@exe/kms_tv_load_detect.c.o'.
[327/1616] Compiling C object 'lib/76b5a35@@igt-intel_bufops_c@sta/intel_bufops.c.o'.
[328/1616] Compiling C object 'tests/59830eb@@panfrost_prime@exe/panfrost_prime.c.o'.
[329/1616] Compiling C object 'lib/76b5a35@@igt-intel_blt_c@sta/intel_blt.c.o'.
[330/1616] Compiling C object 'tests/59830eb@@kms_sequence@exe/kms_sequence.c.o'.
[331/1616] Compiling C object 'tests/59830eb@@kms_flip@exe/kms_flip.c.o'.
[332/1616] Compiling C object 'lib/76b5a35@@igt-igt_pm_c@sta/igt_pm.c.o'.
[333/1616] Compiling C object 'lib/76b5a35@@igt-igt_amd_c@sta/igt_amd.c.o'.
[334/1616] Compiling C object 'tests/59830eb@@kms_prop_blob@exe/kms_prop_blob.c.o'.
[335/1616] Compiling C object 'lib/76b5a35@@igt-igt_vmwgfx_c@sta/igt_vmwgfx.c.o'.
[336/1616] Compiling C object 'tests/59830eb@@kms_vrr@exe/kms_vrr.c.o'.
[337/1616] Compiling C object 'tests/59830eb@@kms_prime@exe/kms_prime.c.o'.
[338/1616] Generating i915-perf-registers-acmgt3 with a custom command.
[339/1616] Compiling C object 'tests/59830eb@@kms_vblank@exe/kms_vblank.c.o'.
[340/1616] Compiling C object 'tests/59830eb@@kms_writeback@exe/kms_writeback.c.o'.
[341/1616] Compiling C object 'tests/59830eb@@kms_plane_alpha_blend@exe/kms_plane_alpha_blend.c.o'.
[342/1616] Compiling C object 'tests/59830eb@@kms_tiled_display@exe/kms_tiled_display.c.o'.
[343/1616] Compiling C object 'tests/59830eb@@kms_setmode@exe/kms_setmode.c.o'.
[344/1616] Compiling C object 'tests/59830eb@@kms_properties@exe/kms_properties.c.o'.
[345/1616] Compiling C object 'tests/59830eb@@kms_rotation_crc@exe/kms_rotation_crc.c.o'.
[346/1616] Compiling C object 'tests/59830eb@@kms_cursor_legacy@exe/kms_cursor_legacy.c.o'.
[347/1616] Compiling C object 'tests/59830eb@@kms_universal_plane@exe/kms_universal_plane.c.o'.
[348/1616] Generating i915-perf-metrics-acmgt3 with a custom command.
[349/1616] Compiling C object 'lib/76b5a35@@igt-igt_core_c@sta/igt_core.c.o'.
[350/1616] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen8_c@sta/rendercopy_gen8.c.o'.
[351/1616] Compiling C object 'lib/76b5a35@@igt-intel_batchbuffer_c@sta/intel_batchbuffer.c.o'.
[352/1616] Compiling C object 'tests/59830eb@@kms_plane_scaling@exe/kms_plane_scaling.c.o'.
[353/1616] Compiling C object 'lib/76b5a35@@igt-igt_chamelium_c@sta/igt_chamelium.c.o'.
[354/1616] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen9_c@sta/rendercopy_gen9.c.o'.
[355/1616] Compiling C object 'lib/76b5a35@@igt-i915_intel_decode_c@sta/i915_intel_decode.c.o'.
[356/1616] Compiling C object 'lib/76b5a35@@igt-igt_fb_c@sta/igt_fb.c.o'.
[357/1616] Compiling C object 'lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o'.
[358/1616] Generating i915-perf-equations with a custom command.
ninja: build stopped: subcommand failed.

