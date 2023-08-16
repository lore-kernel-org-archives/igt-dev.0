Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gupta, Nidhi1" <nidhi1.gupta@intel.com>
Date: Wed, 16 Aug 2023 18:26:05 -0000
Message-ID: <169221036531.10285.10767362560620336129@emeril.freedesktop.org>
References: <20230809045740.275175-1-nidhi1.gupta@intel.com>
In-Reply-To: <20230809045740.275175-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?s/kms=5Fplane=5Fcursor=3A_Handle_invalid_pipe_in_big_joiner_=28?=
 =?utf-8?q?rev4=29?=
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

Series: tests/kms_plane_cursor: Handle invalid pipe in big joiner (rev4)
URL   : https://patchwork.freedesktop.org/series/119890/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
152bb04fd1297075b5d0b1c4487dac8e9a70d070 tests/amdgpu: fix cs nop test when no GFX IP

Tail of build.log:
[333/1622] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen7_c@sta/rendercopy_gen7.c.o'.
[334/1622] Compiling C object 'lib/76b5a35@@igt-gpu_cmds_c@sta/gpu_cmds.c.o'.
[335/1622] Compiling C object 'lib/76b5a35@@igt-intel_blt_c@sta/intel_blt.c.o'.
[336/1622] Compiling C object 'tests/59830eb@@kms_scaling_modes@exe/kms_scaling_modes.c.o'.
[337/1622] Compiling C object 'tests/59830eb@@kms_panel_fitting@exe/kms_panel_fitting.c.o'.
[338/1622] Compiling C object 'lib/76b5a35@@igt-igt_pm_c@sta/igt_pm.c.o'.
[339/1622] Compiling C object 'lib/76b5a35@@igt-intel_bufops_c@sta/intel_bufops.c.o'.
[340/1622] Compiling C object 'tests/59830eb@@panfrost_prime@exe/panfrost_prime.c.o'.
[341/1622] Compiling C object 'tests/59830eb@@kms_tv_load_detect@exe/kms_tv_load_detect.c.o'.
[342/1622] Compiling C object 'tests/59830eb@@kms_sysfs_edid_timing@exe/kms_sysfs_edid_timing.c.o'.
[343/1622] Compiling C object 'tests/59830eb@@kms_rmfb@exe/kms_rmfb.c.o'.
[344/1622] Compiling C object 'lib/76b5a35@@igt-igt_vmwgfx_c@sta/igt_vmwgfx.c.o'.
[345/1622] Compiling C object 'tests/59830eb@@kms_plane_lowres@exe/kms_plane_lowres.c.o'.
[346/1622] Compiling C object 'tests/59830eb@@kms_prop_blob@exe/kms_prop_blob.c.o'.
[347/1622] Compiling C object 'tests/59830eb@@kms_plane_multiple@exe/kms_plane_multiple.c.o'.
[348/1622] Compiling C object 'tests/59830eb@@kms_flip@exe/kms_flip.c.o'.
[349/1622] Compiling C object 'tests/59830eb@@meta_test@exe/meta_test.c.o'.
[350/1622] Compiling C object 'tests/59830eb@@panfrost_gem_new@exe/panfrost_gem_new.c.o'.
[351/1622] Compiling C object 'lib/76b5a35@@igt-igt_amd_c@sta/igt_amd.c.o'.
[352/1622] Compiling C object 'tests/59830eb@@panfrost_get_param@exe/panfrost_get_param.c.o'.
[353/1622] Compiling C object 'tests/59830eb@@kms_prime@exe/kms_prime.c.o'.
[354/1622] Compiling C object 'tests/59830eb@@kms_pipe_crc_basic@exe/kms_pipe_crc_basic.c.o'.
[355/1622] Compiling C object 'tests/59830eb@@kms_vrr@exe/kms_vrr.c.o'.
[356/1622] Compiling C object 'tests/59830eb@@kms_plane_alpha_blend@exe/kms_plane_alpha_blend.c.o'.
[357/1622] Compiling C object 'tests/59830eb@@prime_busy@exe/prime_busy.c.o'.
[358/1622] Compiling C object 'tests/59830eb@@prime_udl@exe/prime_udl.c.o'.
[359/1622] Compiling C object 'tests/59830eb@@kms_sequence@exe/kms_sequence.c.o'.
[360/1622] Compiling C object 'tests/59830eb@@kms_tiled_display@exe/kms_tiled_display.c.o'.
[361/1622] Compiling C object 'tests/59830eb@@panfrost_submit@exe/panfrost_submit.c.o'.
[362/1622] Compiling C object 'tests/59830eb@@kms_plane@exe/kms_plane.c.o'.
[363/1622] Compiling C object 'tests/59830eb@@kms_vblank@exe/kms_vblank.c.o'.
[364/1622] Compiling C object 'tests/59830eb@@kms_writeback@exe/kms_writeback.c.o'.
[365/1622] Generating i915-perf-registers-acmgt3 with a custom command.
[366/1622] Compiling C object 'tests/59830eb@@kms_properties@exe/kms_properties.c.o'.
[367/1622] Compiling C object 'tests/59830eb@@kms_setmode@exe/kms_setmode.c.o'.
[368/1622] Compiling C object 'tests/59830eb@@kms_universal_plane@exe/kms_universal_plane.c.o'.
[369/1622] Compiling C object 'tests/59830eb@@kms_rotation_crc@exe/kms_rotation_crc.c.o'.
[370/1622] Compiling C object 'tests/59830eb@@kms_cursor_legacy@exe/kms_cursor_legacy.c.o'.
[371/1622] Compiling C object 'lib/76b5a35@@igt-igt_core_c@sta/igt_core.c.o'.
[372/1622] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen8_c@sta/rendercopy_gen8.c.o'.
[373/1622] Generating i915-perf-metrics-acmgt3 with a custom command.
[374/1622] Compiling C object 'lib/76b5a35@@igt-intel_batchbuffer_c@sta/intel_batchbuffer.c.o'.
[375/1622] Compiling C object 'tests/59830eb@@kms_plane_scaling@exe/kms_plane_scaling.c.o'.
[376/1622] Compiling C object 'lib/76b5a35@@igt-igt_chamelium_c@sta/igt_chamelium.c.o'.
[377/1622] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen9_c@sta/rendercopy_gen9.c.o'.
[378/1622] Compiling C object 'lib/76b5a35@@igt-i915_intel_decode_c@sta/i915_intel_decode.c.o'.
[379/1622] Compiling C object 'lib/76b5a35@@igt-igt_fb_c@sta/igt_fb.c.o'.
[380/1622] Compiling C object 'lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o'.
[381/1622] Generating i915-perf-equations with a custom command.
ninja: build stopped: subcommand failed.

