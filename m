Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A60C2BD09
	for <igt-dev@archiver.kernel.org>; Mon, 24 Jun 2024 13:07:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D607610E257;
	Mon, 24 Jun 2024 13:07:41 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A3510E257;
 Mon, 24 Jun 2024 13:07:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Early_Transport_Support_?=
 =?utf-8?q?=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 24 Jun 2024 13:07:40 -0000
Message-ID: <171923446000.153309.13363198036059478336@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240624091943.1583273-1-jeevan.b@intel.com>
In-Reply-To: <20240624091943.1583273-1-jeevan.b@intel.com>
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

Series: Early Transport Support (rev4)
URL   : https://patchwork.freedesktop.org/series/133804/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
9119f9c5dbbb969438b3424dc2f3b30f3b442aab lib/igt_psr: Adjust igt_wait intervals

Tail of build.log:
[286/1681] Compiling C object 'lib/76b5a35@@igt-igt_msm_c@sta/igt_msm.c.o'.
[287/1681] Compiling C object 'lib/76b5a35@@igt-monitor_edids_monitor_edids_helper_c@sta/monitor_edids_monitor_edids_helper.c.o'.
[288/1681] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen4_c@sta/rendercopy_gen4.c.o'.
[289/1681] Compiling C object 'lib/76b5a35@@igt-ioctl_wrappers_c@sta/ioctl_wrappers.c.o'.
[290/1681] Compiling C object 'lib/76b5a35@@igt-veboxcopy_gen12_c@sta/veboxcopy_gen12.c.o'.
[291/1681] Compiling C object 'lib/76b5a35@@igt-intel_aux_pgtable_c@sta/intel_aux_pgtable.c.o'.
[292/1681] Compiling C object 'lib/76b5a35@@igt-igt_vc4_c@sta/igt_vc4.c.o'.
[293/1681] Compiling C object 'lib/76b5a35@@igt-intel_allocator_c@sta/intel_allocator.c.o'.
[294/1681] Compiling C object 'lib/76b5a35@@igt-igt_edid_c@sta/igt_edid.c.o'.
[295/1681] Compiling C object 'tests/59830eb@@kms_lease@exe/kms_lease.c.o'.
[296/1681] Compiling C object 'lib/76b5a35@@igt-xe_xe_util_c@sta/xe_xe_util.c.o'.
[297/1681] Compiling C object 'lib/76b5a35@@igt-igt_device_scan_c@sta/igt_device_scan.c.o'.
[298/1681] Compiling C object 'lib/76b5a35@@igt-igt_alsa_c@sta/igt_alsa.c.o'.
[299/1681] Compiling C object 'lib/76b5a35@@igt-igt_frame_c@sta/igt_frame.c.o'.
[300/1681] Compiling C object 'lib/76b5a35@@igt-igt_draw_c@sta/igt_draw.c.o'.
[301/1681] Compiling C object 'lib/76b5a35@@igt-igt_dummyload_c@sta/igt_dummyload.c.o'.
[302/1681] Compiling C object 'lib/76b5a35@@igt-igt_aux_c@sta/igt_aux.c.o'.
[303/1681] Compiling C object 'lib/76b5a35@@igt-igt_chamelium_stream_c@sta/igt_chamelium_stream.c.o'.
[304/1681] Compiling C object 'lib/76b5a35@@igt-instdone_c@sta/instdone.c.o'.
[305/1681] Compiling C object 'tests/59830eb@@kms_flip@exe/kms_flip.c.o'.
[306/1681] Compiling C object 'lib/76b5a35@@igt-xe_xe_ioctl_c@sta/xe_xe_ioctl.c.o'.
[307/1681] Compiling C object 'lib/76b5a35@@igt-xe_xe_spin_c@sta/xe_xe_spin.c.o'.
[308/1681] Compiling C object 'lib/76b5a35@@igt-gpu_cmds_c@sta/gpu_cmds.c.o'.
[309/1681] Compiling C object 'lib/76b5a35@@igt-xe_xe_query_c@sta/xe_xe_query.c.o'.
[310/1681] Compiling C object 'lib/76b5a35@@igt-igt_v3d_c@sta/igt_v3d.c.o'.
[311/1681] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen7_c@sta/rendercopy_gen7.c.o'.
[312/1681] Compiling C object 'lib/76b5a35@@igt-igt_vmwgfx_c@sta/igt_vmwgfx.c.o'.
[313/1681] Compiling C object 'lib/76b5a35@@igt-igt_audio_c@sta/igt_audio.c.o'.
[314/1681] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen6_c@sta/rendercopy_gen6.c.o'.
[315/1681] Compiling C object 'lib/76b5a35@@igt-igt_pm_c@sta/igt_pm.c.o'.
[316/1681] Compiling C object 'lib/76b5a35@@igt-intel_compute_c@sta/intel_compute.c.o'.
[317/1681] Compiling C object 'tests/59830eb@@gem_concurrent_blit@exe/intel_gem_concurrent_blit.c.o'.
[318/1681] Compiling C object 'lib/76b5a35@@igt-igt_amd_c@sta/igt_amd.c.o'.
[319/1681] Compiling C object 'lib/76b5a35@@igt-intel_blt_c@sta/intel_blt.c.o'.
[320/1681] Compiling C object 'lib/76b5a35@@igt-intel_bufops_c@sta/intel_bufops.c.o'.
[321/1681] Compiling C object 'lib/76b5a35@@igt-igt_kmod_c@sta/igt_kmod.c.o'.
[322/1681] Compiling C object 'tests/59830eb@@kms_atomic@exe/kms_atomic.c.o'.
[323/1681] Generating i915-perf-registers-acmgt3 with a custom command.
[324/1681] Generating i915-perf-metrics-acmgt3 with a custom command.
[325/1681] Compiling C object 'lib/76b5a35@@igt-intel_batchbuffer_c@sta/intel_batchbuffer.c.o'.
[326/1681] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen8_c@sta/rendercopy_gen8.c.o'.
[327/1681] Compiling C object 'lib/76b5a35@@igt-igt_chamelium_c@sta/igt_chamelium.c.o'.
[328/1681] Compiling C object 'tests/59830eb@@kms_cursor_legacy@exe/kms_cursor_legacy.c.o'.
[329/1681] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen9_c@sta/rendercopy_gen9.c.o'.
[330/1681] Compiling C object 'lib/76b5a35@@igt-igt_core_c@sta/igt_core.c.o'.
[331/1681] Compiling C object 'lib/76b5a35@@igt-i915_intel_decode_c@sta/i915_intel_decode.c.o'.
[332/1681] Compiling C object 'lib/76b5a35@@igt-igt_fb_c@sta/igt_fb.c.o'.
[333/1681] Compiling C object 'lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o'.
[334/1681] Generating i915-perf-equations with a custom command.
ninja: build stopped: subcommand failed.


