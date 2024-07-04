Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FA0C30653
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jul 2024 17:54:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E876B10E147;
	Thu,  4 Jul 2024 17:54:54 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D01E10E147;
 Thu,  4 Jul 2024 17:54:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/kms=5Fatomic=5Ftran?=
 =?utf-8?q?sition=3A_Reducing_debug_loglevel_dynamically?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 04 Jul 2024 17:54:53 -0000
Message-ID: <172011569363.29744.15782311884957655351@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240704094911.679105-1-pranay.samala@intel.com>
In-Reply-To: <20240704094911.679105-1-pranay.samala@intel.com>
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

Series: tests/kms_atomic_transition: Reducing debug loglevel dynamically
URL   : https://patchwork.freedesktop.org/series/135754/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
971cfc9d6afc8242db25d1eabd4ae00890d9144a test/xe_gt_freq: Add helper to read RPe freq

Tail of build.log:
[388/1744] Compiling C object 'tests/59830eb@@kms_invalid_mode@exe/kms_invalid_mode.c.o'.
[389/1744] Compiling C object 'tests/59830eb@@kms_cursor_edge_walk@exe/kms_cursor_edge_walk.c.o'.
[390/1744] Compiling C object 'tests/59830eb@@kms_display_modes@exe/kms_display_modes.c.o'.
[391/1744] Compiling C object 'tests/59830eb@@kms_selftest@exe/kms_selftest.c.o'.
[392/1744] Compiling C object 'tests/59830eb@@kms_force_connector_basic@exe/kms_force_connector_basic.c.o'.
[393/1744] Compiling C object 'lib/76b5a35@@igt-igt_pm_c@sta/igt_pm.c.o'.
[394/1744] Compiling C object 'lib/76b5a35@@igt-intel_bufops_c@sta/intel_bufops.c.o'.
[395/1744] Compiling C object 'tests/59830eb@@kms_panel_fitting@exe/kms_panel_fitting.c.o'.
[396/1744] Compiling C object 'lib/76b5a35@@igt-igt_vmwgfx_c@sta/igt_vmwgfx.c.o'.
[397/1744] Compiling C object 'tests/59830eb@@kms_sysfs_edid_timing@exe/kms_sysfs_edid_timing.c.o'.
[398/1744] Compiling C object 'lib/76b5a35@@xe_oa@sha/meson-generated_.._xe_oa_equations.c.o'.
[399/1744] Compiling C object 'lib/76b5a35@@igt-intel_blt_c@sta/intel_blt.c.o'.
[400/1744] Compiling C object 'tests/59830eb@@kms_rmfb@exe/kms_rmfb.c.o'.
[401/1744] Compiling C object 'tests/59830eb@@kms_scaling_modes@exe/kms_scaling_modes.c.o'.
[402/1744] Compiling C object 'tests/59830eb@@kms_plane_lowres@exe/kms_plane_lowres.c.o'.
[403/1744] Compiling C object 'tests/59830eb@@kms_content_protection@exe/kms_content_protection.c.o'.
[404/1744] Compiling C object 'tests/59830eb@@kms_hdr@exe/kms_hdr.c.o'.
[405/1744] Compiling C object 'tests/59830eb@@kms_pipe_crc_basic@exe/kms_pipe_crc_basic.c.o'.
[406/1744] Compiling C object 'lib/76b5a35@@igt-igt_amd_c@sta/igt_amd.c.o'.
[407/1744] Compiling C object 'tests/59830eb@@kms_plane_cursor@exe/kms_plane_cursor.c.o'.
[408/1744] Compiling C object 'tests/59830eb@@kms_prop_blob@exe/kms_prop_blob.c.o'.
[409/1744] Compiling C object 'tests/59830eb@@kms_plane_multiple@exe/kms_plane_multiple.c.o'.
[410/1744] Compiling C object 'tests/59830eb@@kms_getfb@exe/kms_getfb.c.o'.
[411/1744] Compiling C object 'lib/76b5a35@@igt-igt_kmod_c@sta/igt_kmod.c.o'.
[412/1744] Compiling C object 'tests/59830eb@@kms_plane_alpha_blend@exe/kms_plane_alpha_blend.c.o'.
[413/1744] Compiling C object 'lib/76b5a35@@xe_oa@sha/xe_xe_oa.c.o'.
[414/1744] Compiling C object 'tests/59830eb@@gem_concurrent_blit@exe/intel_gem_concurrent_blit.c.o'.
[415/1744] Compiling C object 'tests/59830eb@@kms_sequence@exe/kms_sequence.c.o'.
[416/1744] Compiling C object 'tests/59830eb@@kms_prime@exe/kms_prime.c.o'.
[417/1744] Compiling C object 'lib/76b5a35@@igt-intel_batchbuffer_c@sta/intel_batchbuffer.c.o'.
[418/1744] Compiling C object 'tests/59830eb@@kms_rotation_crc@exe/kms_rotation_crc.c.o'.
[419/1744] Compiling C object 'tests/59830eb@@kms_plane@exe/kms_plane.c.o'.
[420/1744] Compiling C object 'tests/59830eb@@kms_lease@exe/kms_lease.c.o'.
[421/1744] Generating i915-perf-registers-acmgt3 with a custom command.
[422/1744] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen8_c@sta/rendercopy_gen8.c.o'.
[423/1744] Compiling C object 'tests/59830eb@@kms_setmode@exe/kms_setmode.c.o'.
[424/1744] Compiling C object 'lib/76b5a35@@igt-igt_core_c@sta/igt_core.c.o'.
[425/1744] Compiling C object 'tests/59830eb@@kms_atomic@exe/kms_atomic.c.o'.
[426/1744] Compiling C object 'tests/59830eb@@kms_properties@exe/kms_properties.c.o'.
[427/1744] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen9_c@sta/rendercopy_gen9.c.o'.
[428/1744] Compiling C object 'lib/76b5a35@@igt-igt_chamelium_c@sta/igt_chamelium.c.o'.
[429/1744] Generating i915-perf-metrics-acmgt3 with a custom command.
[430/1744] Compiling C object 'tests/59830eb@@kms_plane_scaling@exe/kms_plane_scaling.c.o'.
[431/1744] Compiling C object 'tests/59830eb@@kms_flip@exe/kms_flip.c.o'.
[432/1744] Compiling C object 'tests/59830eb@@kms_cursor_legacy@exe/kms_cursor_legacy.c.o'.
[433/1744] Compiling C object 'lib/76b5a35@@igt-i915_intel_decode_c@sta/i915_intel_decode.c.o'.
[434/1744] Compiling C object 'lib/76b5a35@@igt-igt_fb_c@sta/igt_fb.c.o'.
[435/1744] Compiling C object 'lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o'.
[436/1744] Generating i915-perf-equations with a custom command.
ninja: build stopped: subcommand failed.


