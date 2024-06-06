Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBC3C25B75
	for <igt-dev@archiver.kernel.org>; Thu,  6 Jun 2024 13:19:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0DC610E95C;
	Thu,  6 Jun 2024 13:19:07 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F0910E1B1;
 Thu,  6 Jun 2024 13:19:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Support_for_RGB16161616?=
 =?utf-8?q?=5F64B_compressed_format?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Melanie Lobo" <melanie.lobo@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 06 Jun 2024 13:19:06 -0000
Message-ID: <171767994692.22703.1047535370181036785@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240606121523.5347-1-melanie.lobo@intel.com>
In-Reply-To: <20240606121523.5347-1-melanie.lobo@intel.com>
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

Series: Support for RGB16161616_64B compressed format
URL   : https://patchwork.freedesktop.org/series/134558/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
08560f766a505e729dfee2846c1c11d28dd0e3d0 tools/intel_vbt_decode: Decode device handle as a bitmask

Tail of build.log:
[272/1679] Compiling C object 'lib/76b5a35@@igt-igt_dsc_c@sta/igt_dsc.c.o'.
[273/1679] Compiling C object 'lib/76b5a35@@igt-igt_sysfs_c@sta/igt_sysfs.c.o'.
[274/1679] Compiling C object 'lib/76b5a35@@igt-igt_halffloat_c@sta/igt_halffloat.c.o'.
[275/1679] Compiling C object 'lib/76b5a35@@igt-igt_ktap_c@sta/igt_ktap.c.o'.
[276/1679] Compiling C object 'lib/76b5a35@@igt-runnercomms_c@sta/runnercomms.c.o'.
[277/1679] Compiling C object 'lib/76b5a35@@igt-rendercopy_i830_c@sta/rendercopy_i830.c.o'.
[278/1679] Compiling C object 'lib/76b5a35@@igt-igt_eld_c@sta/igt_eld.c.o'.
[279/1679] Compiling C object 'tests/59830eb@@kms_rotation_crc@exe/kms_rotation_crc.c.o'.
[280/1679] Compiling C object 'tests/59830eb@@kms_atomic_transition@exe/kms_atomic_transition.c.o'.
[281/1679] Compiling C object 'lib/76b5a35@@igt-igt_psr_c@sta/igt_psr.c.o'.
[282/1679] Compiling C object 'lib/76b5a35@@igt-intel_allocator_simple_c@sta/intel_allocator_simple.c.o'.
[283/1679] Compiling C object 'lib/76b5a35@@igt-igt_edid_c@sta/igt_edid.c.o'.
[284/1679] Compiling C object 'tests/59830eb@@kms_lease@exe/kms_lease.c.o'.
[285/1679] Compiling C object 'lib/76b5a35@@igt-intel_allocator_c@sta/intel_allocator.c.o'.
[286/1679] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen4_c@sta/rendercopy_gen4.c.o'.
[287/1679] Compiling C object 'lib/76b5a35@@igt-igt_dummyload_c@sta/igt_dummyload.c.o'.
[288/1679] Compiling C object 'lib/76b5a35@@igt-igt_vc4_c@sta/igt_vc4.c.o'.
[289/1679] Compiling C object 'lib/76b5a35@@igt-ioctl_wrappers_c@sta/ioctl_wrappers.c.o'.
[290/1679] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen7_c@sta/rendercopy_gen7.c.o'.
[291/1679] Compiling C object 'tests/59830eb@@kms_flip@exe/kms_flip.c.o'.
[292/1679] Compiling C object 'lib/76b5a35@@igt-igt_device_scan_c@sta/igt_device_scan.c.o'.
[293/1679] Compiling C object 'lib/76b5a35@@igt-veboxcopy_gen12_c@sta/veboxcopy_gen12.c.o'.
[294/1679] Compiling C object 'lib/76b5a35@@igt-gpu_cmds_c@sta/gpu_cmds.c.o'.
[295/1679] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen6_c@sta/rendercopy_gen6.c.o'.
[296/1679] Compiling C object 'lib/76b5a35@@igt-igt_v3d_c@sta/igt_v3d.c.o'.
[297/1679] Compiling C object 'lib/76b5a35@@igt-igt_aux_c@sta/igt_aux.c.o'.
[298/1679] Compiling C object 'lib/76b5a35@@igt-intel_compute_c@sta/intel_compute.c.o'.
[299/1679] Compiling C object 'lib/76b5a35@@igt-igt_draw_c@sta/igt_draw.c.o'.
[300/1679] Compiling C object 'lib/76b5a35@@igt-instdone_c@sta/instdone.c.o'.
[301/1679] Compiling C object 'lib/76b5a35@@igt-igt_pm_c@sta/igt_pm.c.o'.
[302/1679] Compiling C object 'lib/76b5a35@@igt-igt_vmwgfx_c@sta/igt_vmwgfx.c.o'.
[303/1679] Compiling C object 'tests/59830eb@@gem_concurrent_blit@exe/intel_gem_concurrent_blit.c.o'.
[304/1679] Compiling C object 'lib/76b5a35@@igt-intel_bufops_c@sta/intel_bufops.c.o'.
[305/1679] Compiling C object 'tests/59830eb@@kms_plane_scaling@exe/kms_plane_scaling.c.o'.
[306/1679] Compiling C object 'lib/76b5a35@@igt-intel_blt_c@sta/intel_blt.c.o'.
[307/1679] Compiling C object 'lib/76b5a35@@igt-igt_amd_c@sta/igt_amd.c.o'.
[308/1679] Compiling C object 'lib/76b5a35@@igt-igt_kmod_c@sta/igt_kmod.c.o'.
[309/1679] Compiling C object 'tests/59830eb@@kms_atomic@exe/kms_atomic.c.o'.
[310/1679] Generating i915-perf-registers-acmgt3 with a custom command.
[311/1679] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen8_c@sta/rendercopy_gen8.c.o'.
[312/1679] Compiling C object 'lib/76b5a35@@igt-intel_batchbuffer_c@sta/intel_batchbuffer.c.o'.
[313/1679] Generating i915-perf-metrics-acmgt3 with a custom command.
[314/1679] Compiling C object 'lib/76b5a35@@igt-igt_core_c@sta/igt_core.c.o'.
[315/1679] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen9_c@sta/rendercopy_gen9.c.o'.
[316/1679] Compiling C object 'tests/59830eb@@kms_cursor_legacy@exe/kms_cursor_legacy.c.o'.
[317/1679] Compiling C object 'lib/76b5a35@@igt-i915_intel_decode_c@sta/i915_intel_decode.c.o'.
[318/1679] Compiling C object 'lib/76b5a35@@igt-igt_fb_c@sta/igt_fb.c.o'.
[319/1679] Compiling C object 'lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o'.
[320/1679] Generating i915-perf-equations with a custom command.
ninja: build stopped: subcommand failed.


