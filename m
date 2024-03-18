Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89879C54E5D
	for <igt-dev@archiver.kernel.org>; Mon, 18 Mar 2024 23:32:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2956510E661;
	Mon, 18 Mar 2024 23:32:35 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A421310E24E;
 Mon, 18 Mar 2024 23:32:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/kms=5Fvrr=3A_Add_a_?=
 =?utf-8?q?subtest_for_seamless_modeset_to_a_virtual_LRR_mode?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Manasi Navare" <navaremanasi@chromium.org>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 18 Mar 2024 23:32:34 -0000
Message-ID: <171080475466.900325.6106307260694029552@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240318230241.3758794-1-navaremanasi@chromium.org>
In-Reply-To: <20240318230241.3758794-1-navaremanasi@chromium.org>
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

Series: tests/kms_vrr: Add a subtest for seamless modeset to a virtual LRR mode
URL   : https://patchwork.freedesktop.org/series/131295/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
ecff97233376d876f3b47d7323267453c43f3376 tests/intel/xe_debugfs: fix musl build

Tail of build.log:
[358/1672] Compiling C object 'lib/76b5a35@@igt-igt_pm_c@sta/igt_pm.c.o'.
[359/1672] Compiling C object 'tests/59830eb@@panfrost_prime@exe/panfrost_prime.c.o'.
[360/1672] Compiling C object 'lib/76b5a35@@igt-intel_compute_c@sta/intel_compute.c.o'.
[361/1672] Compiling C object 'tests/59830eb@@kms_prop_blob@exe/kms_prop_blob.c.o'.
[362/1672] Compiling C object 'tests/59830eb@@prime_udl@exe/prime_udl.c.o'.
[363/1672] Compiling C object 'tests/59830eb@@template@exe/template.c.o'.
[364/1672] Compiling C object 'tests/59830eb@@kms_flip@exe/kms_flip.c.o'.
[365/1672] Compiling C object 'tests/59830eb@@kms_plane_scaling@exe/kms_plane_scaling.c.o'.
[366/1672] Compiling C object 'tests/59830eb@@panfrost_submit@exe/panfrost_submit.c.o'.
[367/1672] Compiling C object 'tests/59830eb@@syncobj_basic@exe/syncobj_basic.c.o'.
[368/1672] Compiling C object 'lib/76b5a35@@igt-igt_vmwgfx_c@sta/igt_vmwgfx.c.o'.
[369/1672] Compiling C object 'tests/59830eb@@testdisplay@exe/testdisplay_hotplug.c.o'.
[370/1672] Compiling C object 'tests/59830eb@@sriov_basic@exe/sriov_basic.c.o'.
[371/1672] Compiling C object 'lib/76b5a35@@igt-intel_bufops_c@sta/intel_bufops.c.o'.
[372/1672] Compiling C object 'tests/59830eb@@kms_tiled_display@exe/kms_tiled_display.c.o'.
[373/1672] Compiling C object 'tests/59830eb@@syncobj_eventfd@exe/syncobj_eventfd.c.o'.
[374/1672] Compiling C object 'tests/59830eb@@vgem_slow@exe/vgem_slow.c.o'.
[375/1672] Compiling C object 'tests/59830eb@@tools_test@exe/tools_test.c.o'.
[376/1672] Compiling C object 'lib/76b5a35@@igt-intel_blt_c@sta/intel_blt.c.o'.
[377/1672] Compiling C object 'tests/59830eb@@intel_hwmon@exe/intel_intel_hwmon.c.o'.
[378/1672] Compiling C object 'lib/76b5a35@@igt-igt_amd_c@sta/igt_amd.c.o'.
[379/1672] Generating i915-perf-registers-acmgt3 with a custom command.
[380/1672] Compiling C object 'lib/76b5a35@@igt-igt_kmod_c@sta/igt_kmod.c.o'.
[381/1672] Compiling C object 'tests/59830eb@@kms_rotation_crc@exe/kms_rotation_crc.c.o'.
[382/1672] Compiling C object 'tests/59830eb@@kms_writeback@exe/kms_writeback.c.o'.
[383/1672] Compiling C object 'tests/59830eb@@kms_vblank@exe/kms_vblank.c.o'.
[384/1672] Compiling C object 'tests/59830eb@@testdisplay@exe/testdisplay.c.o'.
[385/1672] Compiling C object 'tests/59830eb@@kms_setmode@exe/kms_setmode.c.o'.
[386/1672] Compiling C object 'tests/59830eb@@kms_universal_plane@exe/kms_universal_plane.c.o'.
[387/1672] Compiling C object 'tests/59830eb@@syncobj_wait@exe/syncobj_wait.c.o'.
[388/1672] Compiling C object 'tests/59830eb@@kms_atomic@exe/kms_atomic.c.o'.
[389/1672] Compiling C object 'tests/59830eb@@sw_sync@exe/sw_sync.c.o'.
[390/1672] Compiling C object 'tests/59830eb@@vgem_basic@exe/vgem_basic.c.o'.
[391/1672] Compiling C object 'tests/59830eb@@api_intel_allocator@exe/intel_api_intel_allocator.c.o'.
[392/1672] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen8_c@sta/rendercopy_gen8.c.o'.
[393/1672] Compiling C object 'tests/59830eb@@prime_vgem@exe/prime_vgem.c.o'.
[394/1672] Compiling C object 'lib/76b5a35@@igt-intel_batchbuffer_c@sta/intel_batchbuffer.c.o'.
[395/1672] Compiling C object 'lib/76b5a35@@igt-igt_core_c@sta/igt_core.c.o'.
[396/1672] Generating i915-perf-metrics-acmgt3 with a custom command.
[397/1672] Compiling C object 'lib/76b5a35@@igt-igt_chamelium_c@sta/igt_chamelium.c.o'.
[398/1672] Compiling C object 'tests/59830eb@@syncobj_timeline@exe/syncobj_timeline.c.o'.
[399/1672] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen9_c@sta/rendercopy_gen9.c.o'.
[400/1672] Compiling C object 'tests/59830eb@@kms_cursor_legacy@exe/kms_cursor_legacy.c.o'.
[401/1672] Compiling C object 'tests/59830eb@@api_intel_bb@exe/intel_api_intel_bb.c.o'.
[402/1672] Compiling C object 'tests/59830eb@@gem_userptr_blits@exe/intel_gem_userptr_blits.c.o'.
[403/1672] Compiling C object 'lib/76b5a35@@igt-i915_intel_decode_c@sta/i915_intel_decode.c.o'.
[404/1672] Compiling C object 'lib/76b5a35@@igt-igt_fb_c@sta/igt_fb.c.o'.
[405/1672] Compiling C object 'lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o'.
[406/1672] Generating i915-perf-equations with a custom command.
ninja: build stopped: subcommand failed.


