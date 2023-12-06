Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bommu Krishnaiah" <krishnaiah.bommu@intel.com>
Date: Wed, 06 Dec 2023 07:15:48 -0000
Message-ID: <170184694830.26424.5857620466166249338@emeril.freedesktop.org>
References: <20231206064800.11398-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20231206064800.11398-1-krishnaiah.bommu@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBSRkM6?=
 =?utf-8?q?_drm-uapi/xe=3A_add_exec=5Fqueue=5Fid_member_to_drm=5Fxe=5Fwait?=
 =?utf-8?q?=5Fuser=5Ffence_structure_=28rev2=29?=
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

Series: RFC: drm-uapi/xe: add exec_queue_id member to drm_xe_wait_user_fence structure (rev2)
URL   : https://patchwork.freedesktop.org/series/127364/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
48a47d91b7727215b965690c69d84159c8fb1aa2 Revert "test/xe_spin_batch: Add spin-fixed-duration-with-preempter"

Tail of build.log:
[314/1662] Compiling C object 'lib/76b5a35@@igt-intel_allocator_c@sta/intel_allocator.c.o'.
[315/1662] Compiling C object 'lib/76b5a35@@igt-xe_xe_spin_c@sta/xe_xe_spin.c.o'.
[316/1662] Compiling C object 'lib/76b5a35@@igt-xe_xe_query_c@sta/xe_xe_query.c.o'.
[317/1662] Compiling C object 'tests/59830eb@@kms_tv_load_detect@exe/kms_tv_load_detect.c.o'.
[318/1662] Compiling C object 'lib/76b5a35@@igt-igt_dummyload_c@sta/igt_dummyload.c.o'.
[319/1662] Compiling C object 'lib/76b5a35@@igt-igt_frame_c@sta/igt_frame.c.o'.
[320/1662] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen7_c@sta/rendercopy_gen7.c.o'.
[321/1662] Compiling C object 'tests/59830eb@@meta_test@exe/meta_test.c.o'.
[322/1662] Compiling C object 'lib/76b5a35@@igt-igt_alsa_c@sta/igt_alsa.c.o'.
[323/1662] Compiling C object 'lib/76b5a35@@igt-igt_v3d_c@sta/igt_v3d.c.o'.
[324/1662] Compiling C object 'tests/59830eb@@kms_sysfs_edid_timing@exe/kms_sysfs_edid_timing.c.o'.
[325/1662] Compiling C object 'lib/76b5a35@@igt-igt_device_scan_c@sta/igt_device_scan.c.o'.
[326/1662] Compiling C object 'tests/59830eb@@panfrost_get_param@exe/panfrost_get_param.c.o'.
[327/1662] Compiling C object 'lib/76b5a35@@igt-xe_xe_util_c@sta/xe_xe_util.c.o'.
[328/1662] Compiling C object 'tests/59830eb@@panfrost_prime@exe/panfrost_prime.c.o'.
[329/1662] Compiling C object 'lib/76b5a35@@igt-igt_audio_c@sta/igt_audio.c.o'.
[330/1662] Compiling C object 'tests/59830eb@@kms_scaling_modes@exe/kms_scaling_modes.c.o'.
[331/1662] Compiling C object 'lib/76b5a35@@igt-gpu_cmds_c@sta/gpu_cmds.c.o'.
[332/1662] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen6_c@sta/rendercopy_gen6.c.o'.
[333/1662] Compiling C object 'lib/76b5a35@@igt-igt_pm_c@sta/igt_pm.c.o'.
[334/1662] Compiling C object 'lib/76b5a35@@igt-igt_draw_c@sta/igt_draw.c.o'.
[335/1662] Compiling C object 'lib/76b5a35@@igt-igt_aux_c@sta/igt_aux.c.o'.
[336/1662] Compiling C object 'tests/59830eb@@kms_plane_scaling@exe/kms_plane_scaling.c.o'.
[337/1662] Compiling C object 'lib/76b5a35@@igt-igt_amd_c@sta/igt_amd.c.o'.
[338/1662] Compiling C object 'lib/76b5a35@@igt-intel_bufops_c@sta/intel_bufops.c.o'.
[339/1662] Compiling C object 'tests/59830eb@@kms_flip@exe/kms_flip.c.o'.
[340/1662] Compiling C object 'tests/59830eb@@kms_vrr@exe/kms_vrr.c.o'.
[341/1662] Compiling C object 'lib/76b5a35@@igt-igt_vmwgfx_c@sta/igt_vmwgfx.c.o'.
[342/1662] Compiling C object 'tests/59830eb@@kms_tiled_display@exe/kms_tiled_display.c.o'.
[343/1662] Compiling C object 'lib/76b5a35@@igt-intel_blt_c@sta/intel_blt.c.o'.
[344/1662] Compiling C object 'tests/59830eb@@kms_vblank@exe/kms_vblank.c.o'.
[345/1662] Compiling C object 'tests/59830eb@@kms_writeback@exe/kms_writeback.c.o'.
[346/1662] Generating i915-perf-registers-acmgt3 with a custom command.
[347/1662] Compiling C object 'tests/59830eb@@kms_universal_plane@exe/kms_universal_plane.c.o'.
[348/1662] Compiling C object 'lib/76b5a35@@igt-igt_kmod_c@sta/igt_kmod.c.o'.
[349/1662] Compiling C object 'tests/59830eb@@kms_setmode@exe/kms_setmode.c.o'.
[350/1662] Compiling C object 'tests/59830eb@@kms_atomic@exe/kms_atomic.c.o'.
[351/1662] Generating i915-perf-metrics-acmgt3 with a custom command.
[352/1662] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen8_c@sta/rendercopy_gen8.c.o'.
[353/1662] Compiling C object 'lib/76b5a35@@igt-intel_batchbuffer_c@sta/intel_batchbuffer.c.o'.
[354/1662] Compiling C object 'lib/76b5a35@@igt-igt_core_c@sta/igt_core.c.o'.
[355/1662] Compiling C object 'tests/59830eb@@kms_cursor_legacy@exe/kms_cursor_legacy.c.o'.
[356/1662] Compiling C object 'lib/76b5a35@@igt-igt_chamelium_c@sta/igt_chamelium.c.o'.
[357/1662] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen9_c@sta/rendercopy_gen9.c.o'.
[358/1662] Compiling C object 'tests/59830eb@@gem_userptr_blits@exe/intel_gem_userptr_blits.c.o'.
[359/1662] Compiling C object 'lib/76b5a35@@igt-i915_intel_decode_c@sta/i915_intel_decode.c.o'.
[360/1662] Compiling C object 'lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o'.
[361/1662] Compiling C object 'lib/76b5a35@@igt-igt_fb_c@sta/igt_fb.c.o'.
[362/1662] Generating i915-perf-equations with a custom command.
ninja: build stopped: subcommand failed.

