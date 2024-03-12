Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD0AC54E58
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 10:02:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D80D410EFBC;
	Tue, 12 Mar 2024 10:02:32 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E38C310EFBC;
 Tue, 12 Mar 2024 10:02:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/device=5Freset=3A_S?=
 =?utf-8?q?kip_if_no_drm_devices_are_preset_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 12 Mar 2024 10:02:31 -0000
Message-ID: <171023775193.694325.3662702558538839413@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240311162713.19137-1-nirmoy.das@intel.com>
In-Reply-To: <20240311162713.19137-1-nirmoy.das@intel.com>
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

Series: tests/device_reset: Skip if no drm devices are preset (rev2)
URL   : https://patchwork.freedesktop.org/series/130992/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
a44ebfe43edc96acab22a19b6a8850eef9202eea tests/xe_ccs: Separate inc dimension start width

Tail of build.log:
[121/1670] Compiling C object 'lib/76b5a35@@igt-i915_gem_c@sta/i915_gem.c.o'.
[122/1670] Compiling C object 'tests/59830eb@@gem_ctx_engines@exe/intel_gem_ctx_engines.c.o'.
[123/1670] Compiling C object 'tests/59830eb@@kms_display_modes@exe/kms_display_modes.c.o'.
[124/1670] Compiling C object 'tests/59830eb@@dmabuf_sync_file@exe/dmabuf_sync_file.c.o'.
[125/1670] Compiling C object 'tests/59830eb@@kms_atomic_interruptible@exe/kms_atomic_interruptible.c.o'.
[126/1670] Generating i915-perf-metrics-acmgt1 with a custom command.
[127/1670] Compiling C object 'lib/76b5a35@@igt-dmabuf_sync_file_c@sta/dmabuf_sync_file.c.o'.
[128/1670] Compiling C object 'tests/59830eb@@fbdev@exe/fbdev.c.o'.
[129/1670] Compiling C object 'tests/59830eb@@kms_cursor_edge_walk@exe/kms_cursor_edge_walk.c.o'.
[130/1670] Compiling C object 'tests/59830eb@@kms_force_connector_basic@exe/kms_force_connector_basic.c.o'.
[131/1670] Compiling C object 'tests/59830eb@@kms_plane_cursor@exe/kms_plane_cursor.c.o'.
[132/1670] Compiling C object 'lib/76b5a35@@igt-i915_intel_drrs_c@sta/i915_intel_drrs.c.o'.
[133/1670] Compiling C object 'tests/59830eb@@kms_plane_lowres@exe/kms_plane_lowres.c.o'.
[134/1670] Compiling C object 'tests/59830eb@@kms_rmfb@exe/kms_rmfb.c.o'.
[135/1670] Compiling C object 'tests/59830eb@@gem_vm_create@exe/intel_gem_vm_create.c.o'.
[136/1670] Compiling C object 'lib/76b5a35@@igt-i915_gem_context_c@sta/i915_gem_context.c.o'.
[137/1670] Compiling C object 'lib/76b5a35@@igt-drmtest_c@sta/drmtest.c.o'.
[138/1670] Compiling C object 'tests/59830eb@@kms_async_flips@exe/kms_async_flips.c.o'.
[139/1670] Compiling C object 'tests/59830eb@@kms_pipe_crc_basic@exe/kms_pipe_crc_basic.c.o'.
[140/1670] Compiling C object 'lib/76b5a35@@igt-i915_gem_mman_c@sta/i915_gem_mman.c.o'.
[141/1670] Compiling C object 'tests/59830eb@@kms_content_protection@exe/kms_content_protection.c.o'.
[142/1670] Generating i915-perf-registers-acmgt2 with a custom command.
[143/1670] Compiling C object 'tests/59830eb@@gem_ccs@exe/intel_gem_ccs.c.o'.
[144/1670] Compiling C object 'tests/59830eb@@kms_prop_blob@exe/kms_prop_blob.c.o'.
[145/1670] Compiling C object 'tests/59830eb@@core_hotunplug@exe/core_hotunplug.c.o'.
[146/1670] Compiling C object 'tests/59830eb@@kms_plane_multiple@exe/kms_plane_multiple.c.o'.
[147/1670] Compiling C object 'lib/76b5a35@@igt-i915_gem_engine_topology_c@sta/i915_gem_engine_topology.c.o'.
[148/1670] Compiling C object 'tests/59830eb@@kms_hdr@exe/kms_hdr.c.o'.
[149/1670] Compiling C object 'tests/59830eb@@kms_prime@exe/kms_prime.c.o'.
[150/1670] Compiling C object 'tests/59830eb@@kms_color@exe/kms_color.c.o'.
[151/1670] Compiling C object 'tests/59830eb@@kms_plane_alpha_blend@exe/kms_plane_alpha_blend.c.o'.
[152/1670] Compiling C object 'tests/59830eb@@kms_getfb@exe/kms_getfb.c.o'.
[153/1670] Compiling C object 'lib/76b5a35@@igt_device_scan@sta/igt_device_scan.c.o'.
[154/1670] Compiling C object 'tests/59830eb@@kms_cursor_crc@exe/kms_cursor_crc.c.o'.
[155/1670] Compiling C object 'tests/59830eb@@kms_addfb_basic@exe/kms_addfb_basic.c.o'.
[156/1670] Compiling C object 'tests/59830eb@@kms_plane@exe/kms_plane.c.o'.
[157/1670] Generating i915-perf-metrics-acmgt2 with a custom command.
[158/1670] Compiling C object 'tests/59830eb@@kms_atomic_transition@exe/kms_atomic_transition.c.o'.
[159/1670] Compiling C object 'tests/59830eb@@kms_lease@exe/kms_lease.c.o'.
[160/1670] Compiling C object 'tests/59830eb@@kms_rotation_crc@exe/kms_rotation_crc.c.o'.
[161/1670] Compiling C object 'tests/59830eb@@kms_plane_scaling@exe/kms_plane_scaling.c.o'.
[162/1670] Compiling C object 'tests/59830eb@@kms_flip@exe/kms_flip.c.o'.
[163/1670] Generating i915-perf-registers-acmgt3 with a custom command.
[164/1670] Compiling C object 'tests/59830eb@@kms_atomic@exe/kms_atomic.c.o'.
[165/1670] Compiling C object 'tests/59830eb@@kms_cursor_legacy@exe/kms_cursor_legacy.c.o'.
[166/1670] Generating i915-perf-metrics-acmgt3 with a custom command.
[167/1670] Compiling C object 'tests/59830eb@@gem_userptr_blits@exe/intel_gem_userptr_blits.c.o'.
[168/1670] Compiling C object 'lib/76b5a35@@igt-i915_intel_decode_c@sta/i915_intel_decode.c.o'.
[169/1670] Generating i915-perf-equations with a custom command.
ninja: build stopped: subcommand failed.


