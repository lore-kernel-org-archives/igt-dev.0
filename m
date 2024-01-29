Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594FAC47422
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jan 2024 04:46:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E1910F32D;
	Mon, 29 Jan 2024 04:46:34 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED2C10F32D;
 Mon, 29 Jan 2024 04:46:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/kms=5Fprime=3A_Add_?=
 =?utf-8?q?XE_support_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Mon, 29 Jan 2024 04:46:32 -0000
Message-ID: <170650359284.789298.15247081729333099010@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240129045439.17891-1-nidhi1.gupta@intel.com>
In-Reply-To: <20240129045439.17891-1-nidhi1.gupta@intel.com>
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_prime: Add XE support (rev3)
URL   : https://patchwork.freedesktop.org/series/128045/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
814cd9883b94be1c61d830b2c1279dc2265476bf lib/igt_amd: add debugfs disallow edp enter psr

Tail of build.log:
[411/1667] Compiling C object 'tests/59830eb@@kms_setmode@exe/kms_setmode.c.o'.
[412/1667] Compiling C object 'lib/76b5a35@@igt-igt_core_c@sta/igt_core.c.o'.
[413/1667] Compiling C object 'tests/59830eb@@kms_rotation_crc@exe/kms_rotation_crc.c.o'.
[414/1667] Compiling C object 'tests/59830eb@@gem_exec_basic@exe/intel_gem_exec_basic.c.o'.
[415/1667] Compiling C object 'tests/59830eb@@vgem_basic@exe/vgem_basic.c.o'.
[416/1667] Compiling C object 'tests/59830eb@@gem_caching@exe/intel_gem_caching.c.o'.
[417/1667] Compiling C object 'tests/59830eb@@gem_ctx_freq@exe/intel_gem_ctx_freq.c.o'.
[418/1667] Compiling C object 'tests/59830eb@@sw_sync@exe/sw_sync.c.o'.
[419/1667] Compiling C object 'tests/59830eb@@gem_exec_await@exe/intel_gem_exec_await.c.o'.
[420/1667] Compiling C object 'tests/59830eb@@testdisplay@exe/testdisplay.c.o'.
[421/1667] Compiling C object 'tests/59830eb@@syncobj_wait@exe/syncobj_wait.c.o'.
[422/1667] Compiling C object 'tests/59830eb@@kms_universal_plane@exe/kms_universal_plane.c.o'.
[423/1667] Compiling C object 'lib/76b5a35@@igt-intel_batchbuffer_c@sta/intel_batchbuffer.c.o'.
[424/1667] Compiling C object 'tests/59830eb@@gem_evict_alignment@exe/intel_gem_evict_alignment.c.o'.
[425/1667] Compiling C object 'tests/59830eb@@gem_exec_async@exe/intel_gem_exec_async.c.o'.
[426/1667] Compiling C object 'lib/76b5a35@@igt-igt_chamelium_c@sta/igt_chamelium.c.o'.
[427/1667] Generating i915-perf-metrics-acmgt3 with a custom command.
[428/1667] Compiling C object 'tests/59830eb@@gem_ctx_exec@exe/intel_gem_ctx_exec.c.o'.
[429/1667] Compiling C object 'tests/59830eb@@gem_exec_create@exe/intel_gem_exec_create.c.o'.
[430/1667] Compiling C object 'tests/59830eb@@kms_cursor_legacy@exe/kms_cursor_legacy.c.o'.
[431/1667] Compiling C object 'tests/59830eb@@gem_create@exe/intel_gem_create.c.o'.
[432/1667] Compiling C object 'tests/59830eb@@gem_ctx_switch@exe/intel_gem_ctx_switch.c.o'.
[433/1667] Compiling C object 'tests/59830eb@@gem_ctx_param@exe/intel_gem_ctx_param.c.o'.
[434/1667] Compiling C object 'tests/59830eb@@gem_exec_alignment@exe/intel_gem_exec_alignment.c.o'.
[435/1667] Compiling C object 'tests/59830eb@@gem_evict_everything@exe/intel_gem_evict_everything.c.o'.
[436/1667] Compiling C object 'tests/59830eb@@kms_atomic@exe/kms_atomic.c.o'.
[437/1667] Compiling C object 'tests/59830eb@@api_intel_allocator@exe/intel_api_intel_allocator.c.o'.
[438/1667] Compiling C object 'tests/59830eb@@gem_ctx_sseu@exe/intel_gem_ctx_sseu.c.o'.
[439/1667] Compiling C object 'tests/59830eb@@gem_ctx_create@exe/intel_gem_ctx_create.c.o'.
[440/1667] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen8_c@sta/rendercopy_gen8.c.o'.
[441/1667] Compiling C object 'tests/59830eb@@gem_blits@exe/intel_gem_blits.c.o'.
[442/1667] Compiling C object 'tests/59830eb@@prime_vgem@exe/prime_vgem.c.o'.
[443/1667] Compiling C object 'tests/59830eb@@kms_plane_scaling@exe/kms_plane_scaling.c.o'.
[444/1667] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen9_c@sta/rendercopy_gen9.c.o'.
[445/1667] Compiling C object 'tests/59830eb@@gem_ctx_isolation@exe/intel_gem_ctx_isolation.c.o'.
[446/1667] Compiling C object 'tests/59830eb@@gem_busy@exe/intel_gem_busy.c.o'.
[447/1667] Compiling C object 'tests/59830eb@@drm_fdinfo@exe/intel_drm_fdinfo.c.o'.
[448/1667] Compiling C object 'tests/59830eb@@gem_ctx_shared@exe/intel_gem_ctx_shared.c.o'.
[449/1667] Compiling C object 'tests/59830eb@@gem_ctx_persistence@exe/intel_gem_ctx_persistence.c.o'.
[450/1667] Compiling C object 'tests/59830eb@@gem_eio@exe/intel_gem_eio.c.o'.
[451/1667] Compiling C object 'tests/59830eb@@syncobj_timeline@exe/syncobj_timeline.c.o'.
[452/1667] Compiling C object 'tests/59830eb@@gem_userptr_blits@exe/intel_gem_userptr_blits.c.o'.
[453/1667] Compiling C object 'lib/76b5a35@@igt-i915_intel_decode_c@sta/i915_intel_decode.c.o'.
[454/1667] Compiling C object 'tests/59830eb@@api_intel_bb@exe/intel_api_intel_bb.c.o'.
[455/1667] Compiling C object 'tests/59830eb@@gem_exec_capture@exe/intel_gem_exec_capture.c.o'.
[456/1667] Compiling C object 'tests/59830eb@@gem_concurrent_blit@exe/intel_gem_concurrent_blit.c.o'.
[457/1667] Compiling C object 'lib/76b5a35@@igt-igt_fb_c@sta/igt_fb.c.o'.
[458/1667] Compiling C object 'lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o'.
[459/1667] Generating i915-perf-equations with a custom command.
ninja: build stopped: subcommand failed.


