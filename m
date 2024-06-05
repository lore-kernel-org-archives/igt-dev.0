Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237D0C25B76
	for <igt-dev@archiver.kernel.org>; Wed,  5 Jun 2024 17:08:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D2D810E0E4;
	Wed,  5 Jun 2024 17:08:15 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F6910E0E4;
 Wed,  5 Jun 2024 17:08:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_lib/xe=3A_Use_synchronous?=
 =?utf-8?q?_gt_resets_when_needed_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 05 Jun 2024 17:08:13 -0000
Message-ID: <171760729398.2161.673953097754024832@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240605163344.2747072-1-jonathan.cavitt@intel.com>
In-Reply-To: <20240605163344.2747072-1-jonathan.cavitt@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
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

== Series Details ==

Series: lib/xe: Use synchronous gt resets when needed (rev2)
URL   : https://patchwork.freedesktop.org/series/134509/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
08560f766a505e729dfee2846c1c11d28dd0e3d0 tools/intel_vbt_decode: Decode device handle as a bitmask

Tail of build.log:
[314/1679] Compiling C object 'lib/76b5a35@@igt-xe_xe_spin_c@sta/xe_xe_spin.c.o'.
[315/1679] Compiling C object 'lib/76b5a35@@igt-igt_dummyload_c@sta/igt_dummyload.c.o'.
[316/1679] Compiling C object 'lib/76b5a35@@igt-xe_xe_util_c@sta/xe_xe_util.c.o'.
[317/1679] Compiling C object 'lib/76b5a35@@igt-igt_frame_c@sta/igt_frame.c.o'.
[318/1679] Compiling C object 'lib/76b5a35@@igt-igt_aux_c@sta/igt_aux.c.o'.
[319/1679] Compiling C object 'tests/59830eb@@kms_tv_load_detect@exe/kms_tv_load_detect.c.o'.
[320/1679] Compiling C object 'tests/59830eb@@kms_sysfs_edid_timing@exe/kms_sysfs_edid_timing.c.o'.
[321/1679] Compiling C object 'tests/59830eb@@kms_rmfb@exe/kms_rmfb.c.o'.
[322/1679] Compiling C object 'lib/76b5a35@@igt-igt_chamelium_stream_c@sta/igt_chamelium_stream.c.o'.
[323/1679] Compiling C object 'lib/76b5a35@@igt-igt_v3d_c@sta/igt_v3d.c.o'.
[324/1679] Compiling C object 'tests/59830eb@@panfrost_get_param@exe/panfrost_get_param.c.o'.
[325/1679] Compiling C object 'tests/59830eb@@kms_scaling_modes@exe/kms_scaling_modes.c.o'.
[326/1679] Compiling C object 'lib/76b5a35@@igt-igt_draw_c@sta/igt_draw.c.o'.
[327/1679] Compiling C object 'lib/76b5a35@@igt-igt_alsa_c@sta/igt_alsa.c.o'.
[328/1679] Compiling C object 'tests/59830eb@@kms_sequence@exe/kms_sequence.c.o'.
[329/1679] Compiling C object 'lib/76b5a35@@igt-instdone_c@sta/instdone.c.o'.
[330/1679] Compiling C object 'lib/76b5a35@@igt-xe_xe_query_c@sta/xe_xe_query.c.o'.
[331/1679] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen6_c@sta/rendercopy_gen6.c.o'.
[332/1679] Compiling C object 'lib/76b5a35@@igt-igt_audio_c@sta/igt_audio.c.o'.
[333/1679] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen7_c@sta/rendercopy_gen7.c.o'.
[334/1679] Compiling C object 'lib/76b5a35@@igt-intel_compute_c@sta/intel_compute.c.o'.
[335/1679] Compiling C object 'lib/76b5a35@@igt-gpu_cmds_c@sta/gpu_cmds.c.o'.
[336/1679] Compiling C object 'lib/76b5a35@@igt-igt_device_scan_c@sta/igt_device_scan.c.o'.
[337/1679] Compiling C object 'tests/59830eb@@kms_tiled_display@exe/kms_tiled_display.c.o'.
[338/1679] Compiling C object 'tests/59830eb@@kms_prop_blob@exe/kms_prop_blob.c.o'.
[339/1679] Compiling C object 'lib/76b5a35@@igt-igt_pm_c@sta/igt_pm.c.o'.
[340/1679] Compiling C object 'lib/76b5a35@@igt-intel_bufops_c@sta/intel_bufops.c.o'.
[341/1679] Compiling C object 'tests/59830eb@@kms_plane_scaling@exe/kms_plane_scaling.c.o'.
[342/1679] Compiling C object 'tests/59830eb@@gem_concurrent_blit@exe/intel_gem_concurrent_blit.c.o'.
[343/1679] Compiling C object 'lib/76b5a35@@igt-igt_kmod_c@sta/igt_kmod.c.o'.
[344/1679] Compiling C object 'lib/76b5a35@@igt-igt_vmwgfx_c@sta/igt_vmwgfx.c.o'.
[345/1679] Compiling C object 'tests/59830eb@@kms_vblank@exe/kms_vblank.c.o'.
[346/1679] Compiling C object 'lib/76b5a35@@igt-igt_amd_c@sta/igt_amd.c.o'.
[347/1679] Compiling C object 'lib/76b5a35@@igt-intel_blt_c@sta/intel_blt.c.o'.
[348/1679] Compiling C object 'tests/59830eb@@kms_universal_plane@exe/kms_universal_plane.c.o'.
[349/1679] Compiling C object 'tests/59830eb@@kms_setmode@exe/kms_setmode.c.o'.
[350/1679] Compiling C object 'tests/59830eb@@kms_cursor_legacy@exe/kms_cursor_legacy.c.o'.
[351/1679] Compiling C object 'tests/59830eb@@kms_atomic@exe/kms_atomic.c.o'.
[352/1679] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen8_c@sta/rendercopy_gen8.c.o'.
[353/1679] Compiling C object 'lib/76b5a35@@igt-intel_batchbuffer_c@sta/intel_batchbuffer.c.o'.
[354/1679] Compiling C object 'lib/76b5a35@@igt-igt_core_c@sta/igt_core.c.o'.
[355/1679] Generating i915-perf-metrics-acmgt3 with a custom command.
[356/1679] Generating i915-perf-registers-acmgt3 with a custom command.
[357/1679] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen9_c@sta/rendercopy_gen9.c.o'.
[358/1679] Compiling C object 'lib/76b5a35@@igt-igt_chamelium_c@sta/igt_chamelium.c.o'.
[359/1679] Compiling C object 'lib/76b5a35@@igt-i915_intel_decode_c@sta/i915_intel_decode.c.o'.
[360/1679] Compiling C object 'lib/76b5a35@@igt-igt_fb_c@sta/igt_fb.c.o'.
[361/1679] Compiling C object 'lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o'.
[362/1679] Generating i915-perf-equations with a custom command.
ninja: build stopped: subcommand failed.


