Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444C9CF397E
	for <igt-dev@archiver.kernel.org>; Fri, 20 Sep 2024 02:10:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F172A10E2AE;
	Fri, 20 Sep 2024 02:10:57 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3DB110E02C;
 Fri, 20 Sep 2024 02:10:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/kms=5Fwriteback=3A_?=
 =?utf-8?q?Add_clone_mode_subtest_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jessica Zhang" <quic_jesszhan@quicinc.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 20 Sep 2024 02:10:56 -0000
Message-ID: <172679825672.1048260.17365208002033074350@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240919-igt-cwb-v3-0-2bb3161f1f96@quicinc.com>
In-Reply-To: <20240919-igt-cwb-v3-0-2bb3161f1f96@quicinc.com>
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

Series: tests/kms_writeback: Add clone mode subtest (rev3)
URL   : https://patchwork.freedesktop.org/series/137933/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
c459544b7af00e4599e1ad010e9f773086cb0c19 tests/amd_queue_reset: add sdma test in queue reset

Tail of build.log:
[511/1771] Compiling C object 'tests/59830eb@@gem_ctx_exec@exe/intel_gem_ctx_exec.c.o'.
[512/1771] Compiling C object 'tools/f9d35d4@@intel_reg@exe/intel_reg_decode.c.o'.
[513/1771] Compiling C object 'tests/59830eb@@gem_ccs@exe/intel_gem_ccs.c.o'.
[514/1771] Compiling C object 'tests/59830eb@@gem_exec_lut_handle@exe/intel_gem_exec_lut_handle.c.o'.
[515/1771] Compiling C object 'tests/59830eb@@gem_ctx_create@exe/intel_gem_ctx_create.c.o'.
[516/1771] Compiling C object 'tests/59830eb@@gem_exec_gttfill@exe/intel_gem_exec_gttfill.c.o'.
[517/1771] Compiling C object 'tests/59830eb@@gem_ctx_engines@exe/intel_gem_ctx_engines.c.o'.
[518/1771] Compiling C object 'tests/59830eb@@prime_mmap@exe/intel_prime_mmap.c.o'.
[519/1771] Compiling C object 'tests/59830eb@@gem_exec_parallel@exe/intel_gem_exec_parallel.c.o'.
[520/1771] Compiling C object 'tests/59830eb@@gem_evict_everything@exe/intel_gem_evict_everything.c.o'.
[521/1771] Compiling C object 'tests/59830eb@@prime_vgem@exe/prime_vgem.c.o'.
[522/1771] Compiling C object 'tests/59830eb@@gem_blits@exe/intel_gem_blits.c.o'.
[523/1771] Compiling C object 'tests/59830eb@@gem_exec_alignment@exe/intel_gem_exec_alignment.c.o'.
[524/1771] Compiling C object 'tests/59830eb@@gem_ctx_sseu@exe/intel_gem_ctx_sseu.c.o'.
[525/1771] Compiling C object 'tests/59830eb@@gem_ctx_switch@exe/intel_gem_ctx_switch.c.o'.
[526/1771] Compiling C object 'tests/59830eb@@kms_flip@exe/kms_flip.c.o'.
[527/1771] Compiling C object 'tests/59830eb@@syncobj_timeline@exe/syncobj_timeline.c.o'.
[528/1771] Compiling C object 'tests/59830eb@@kms_plane_scaling@exe/kms_plane_scaling.c.o'.
[529/1771] Compiling C object 'tests/59830eb@@gem_exercise_blt@exe/intel_gem_exercise_blt.c.o'.
[530/1771] Compiling C object 'tests/59830eb@@gem_busy@exe/intel_gem_busy.c.o'.
[531/1771] Compiling C object 'tests/59830eb@@gem_ctx_isolation@exe/intel_gem_ctx_isolation.c.o'.
[532/1771] Compiling C object 'tests/59830eb@@gen7_exec_parse@exe/intel_gen7_exec_parse.c.o'.
[533/1771] Compiling C object 'tests/59830eb@@gem_exec_suspend@exe/intel_gem_exec_suspend.c.o'.
[534/1771] Compiling C object 'tests/59830eb@@gem_exec_params@exe/intel_gem_exec_params.c.o'.
[535/1771] Compiling C object 'tests/59830eb@@gem_exec_store@exe/intel_gem_exec_store.c.o'.
[536/1771] Compiling C object 'lib/76b5a35@@igt-i915_intel_decode_c@sta/i915_intel_decode.c.o'.
[537/1771] Compiling C object 'tests/59830eb@@drm_fdinfo@exe/intel_drm_fdinfo.c.o'.
[538/1771] Compiling C object 'tests/59830eb@@gem_eio@exe/intel_gem_eio.c.o'.
[539/1771] Compiling C object 'tests/59830eb@@gem_exec_fair@exe/intel_gem_exec_fair.c.o'.
[540/1771] Compiling C object 'tests/59830eb@@gem_exec_flush@exe/intel_gem_exec_flush.c.o'.
[541/1771] Compiling C object 'tests/59830eb@@api_intel_bb@exe/intel_api_intel_bb.c.o'.
[542/1771] Compiling C object 'tests/59830eb@@gem_ctx_shared@exe/intel_gem_ctx_shared.c.o'.
[543/1771] Compiling C object 'tests/59830eb@@gem_exec_latency@exe/intel_gem_exec_latency.c.o'.
[544/1771] Compiling C object 'tests/59830eb@@gem_ctx_persistence@exe/intel_gem_ctx_persistence.c.o'.
[545/1771] Compiling C object 'tests/59830eb@@gem_exec_whisper@exe/intel_gem_exec_whisper.c.o'.
[546/1771] Compiling C object 'tests/59830eb@@gem_exec_capture@exe/intel_gem_exec_capture.c.o'.
[547/1771] Compiling C object 'tests/59830eb@@kms_cursor_legacy@exe/kms_cursor_legacy.c.o'.
[548/1771] Compiling C object 'lib/76b5a35@@igt-igt_fb_c@sta/igt_fb.c.o'.
[549/1771] Compiling C object 'tests/59830eb@@gem_exec_reloc@exe/intel_gem_exec_reloc.c.o'.
[550/1771] Compiling C object 'tests/59830eb@@kms_atomic@exe/kms_atomic.c.o'.
[551/1771] Compiling C object 'tests/59830eb@@gen9_exec_parse@exe/intel_gen9_exec_parse.c.o'.
[552/1771] Compiling C object 'tests/59830eb@@gem_exec_nop@exe/intel_gem_exec_nop.c.o'.
[553/1771] Compiling C object 'lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o'.
[554/1771] Compiling C object 'tests/59830eb@@gem_concurrent_blit@exe/intel_gem_concurrent_blit.c.o'.
[555/1771] Compiling C object 'tools/f9d35d4@@intel_gpu_top@exe/intel_gpu_top.c.o'.
[556/1771] Compiling C object 'tests/59830eb@@gem_exec_balancer@exe/intel_gem_exec_balancer.c.o'.
[557/1771] Generating i915-perf-equations with a custom command.
[558/1771] Compiling C object 'tests/59830eb@@gem_exec_fence@exe/intel_gem_exec_fence.c.o'.
[559/1771] Compiling C object 'tests/59830eb@@gem_exec_schedule@exe/intel_gem_exec_schedule.c.o'.
ninja: build stopped: subcommand failed.


