Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A921C4345F
	for <igt-dev@archiver.kernel.org>; Mon, 29 Apr 2024 16:19:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E57410E7BC;
	Mon, 29 Apr 2024 16:19:06 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE1510E3A0;
 Mon, 29 Apr 2024 16:19:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_lib/gpgpu=3A_add_shader_s?=
 =?utf-8?q?upport?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 29 Apr 2024 16:19:04 -0000
Message-ID: <171440754470.1757642.7339441535763551488@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240429-iga64_inline_ups-v1-0-2e9ac46cf6ba@intel.com>
In-Reply-To: <20240429-iga64_inline_ups-v1-0-2e9ac46cf6ba@intel.com>
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

Series: lib/gpgpu: add shader support
URL   : https://patchwork.freedesktop.org/series/133020/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
ce6ce0f60dd1a6c0df93a01ad71a31964158a2cf intel_reg: Move decoding behind an option

Tail of build.log:
[326/1687] Compiling C object 'lib/76b5a35@@igt-igt_aux_c@sta/igt_aux.c.o'.
[327/1687] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen6_c@sta/rendercopy_gen6.c.o'.
[328/1687] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen7_c@sta/rendercopy_gen7.c.o'.
[329/1687] Compiling C object 'tests/59830eb@@kms_multipipe_modeset@exe/kms_multipipe_modeset.c.o'.
[330/1687] Compiling C object 'tests/59830eb@@kms_force_connector_basic@exe/kms_force_connector_basic.c.o'.
[331/1687] Compiling C object 'lib/76b5a35@@igt-gpu_cmds_c@sta/gpu_cmds.c.o'.
[332/1687] Compiling C object 'lib/76b5a35@@igt-igt_audio_c@sta/igt_audio.c.o'.
[333/1687] Compiling C object 'tests/59830eb@@kms_panel_fitting@exe/kms_panel_fitting.c.o'.
[334/1687] Compiling C object 'tests/59830eb@@kms_invalid_mode@exe/kms_invalid_mode.c.o'.
[335/1687] Compiling C object 'lib/76b5a35@@igt-igt_pm_c@sta/igt_pm.c.o'.
[336/1687] Compiling C object 'tests/59830eb@@kms_plane_lowres@exe/kms_plane_lowres.c.o'.
[337/1687] Compiling C object 'lib/76b5a35@@igt-intel_compute_c@sta/intel_compute.c.o'.
[338/1687] Compiling C object 'lib/76b5a35@@igt-intel_bufops_c@sta/intel_bufops.c.o'.
[339/1687] Compiling C object 'tests/59830eb@@kms_rmfb@exe/kms_rmfb.c.o'.
[340/1687] Compiling C object 'tests/59830eb@@kms_selftest@exe/kms_selftest.c.o'.
[341/1687] Compiling C object 'lib/76b5a35@@igt-igt_vmwgfx_c@sta/igt_vmwgfx.c.o'.
[342/1687] Compiling C object 'tests/59830eb@@kms_plane_cursor@exe/kms_plane_cursor.c.o'.
[343/1687] Compiling C object 'tests/59830eb@@kms_flip@exe/kms_flip.c.o'.
[344/1687] Compiling C object 'tests/59830eb@@kms_prop_blob@exe/kms_prop_blob.c.o'.
[345/1687] Compiling C object 'tests/59830eb@@kms_sysfs_edid_timing@exe/kms_sysfs_edid_timing.c.o'.
[346/1687] Compiling C object 'tests/59830eb@@kms_scaling_modes@exe/kms_scaling_modes.c.o'.
[347/1687] Compiling C object 'tests/59830eb@@kms_plane_multiple@exe/kms_plane_multiple.c.o'.
[348/1687] Compiling C object 'tests/59830eb@@kms_sequence@exe/kms_sequence.c.o'.
[349/1687] Compiling C object 'tests/59830eb@@kms_hdr@exe/kms_hdr.c.o'.
[350/1687] Compiling C object 'lib/76b5a35@@igt-igt_amd_c@sta/igt_amd.c.o'.
[351/1687] Compiling C object 'tests/59830eb@@kms_pipe_crc_basic@exe/kms_pipe_crc_basic.c.o'.
[352/1687] Compiling C object 'lib/76b5a35@@igt-intel_blt_c@sta/intel_blt.c.o'.
[353/1687] Compiling C object 'tests/59830eb@@kms_prime@exe/kms_prime.c.o'.
[354/1687] Compiling C object 'tests/59830eb@@kms_plane_alpha_blend@exe/kms_plane_alpha_blend.c.o'.
[355/1687] Compiling C object 'lib/76b5a35@@igt-igt_kmod_c@sta/igt_kmod.c.o'.
[356/1687] Generating i915-perf-registers-acmgt3 with a custom command.
[357/1687] Compiling C object 'lib/76b5a35@@igt-intel_batchbuffer_c@sta/intel_batchbuffer.c.o'.
[358/1687] Compiling C object 'tests/59830eb@@kms_plane@exe/kms_plane.c.o'.
[359/1687] Compiling C object 'tests/59830eb@@kms_cursor_legacy@exe/kms_cursor_legacy.c.o'.
[360/1687] Compiling C object 'tests/59830eb@@kms_setmode@exe/kms_setmode.c.o'.
[361/1687] Compiling C object 'tests/59830eb@@kms_lease@exe/kms_lease.c.o'.
[362/1687] Compiling C object 'tests/59830eb@@kms_properties@exe/kms_properties.c.o'.
[363/1687] Compiling C object 'lib/76b5a35@@igt-igt_chamelium_c@sta/igt_chamelium.c.o'.
[364/1687] Compiling C object 'tests/59830eb@@kms_atomic@exe/kms_atomic.c.o'.
[365/1687] Generating i915-perf-metrics-acmgt3 with a custom command.
[366/1687] Compiling C object 'lib/76b5a35@@igt-igt_core_c@sta/igt_core.c.o'.
[367/1687] Compiling C object 'tests/59830eb@@kms_rotation_crc@exe/kms_rotation_crc.c.o'.
[368/1687] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen8_c@sta/rendercopy_gen8.c.o'.
[369/1687] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen9_c@sta/rendercopy_gen9.c.o'.
[370/1687] Compiling C object 'tests/59830eb@@kms_plane_scaling@exe/kms_plane_scaling.c.o'.
[371/1687] Compiling C object 'lib/76b5a35@@igt-i915_intel_decode_c@sta/i915_intel_decode.c.o'.
[372/1687] Compiling C object 'lib/76b5a35@@igt-igt_fb_c@sta/igt_fb.c.o'.
[373/1687] Compiling C object 'lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o'.
[374/1687] Generating i915-perf-equations with a custom command.
ninja: build stopped: subcommand failed.


