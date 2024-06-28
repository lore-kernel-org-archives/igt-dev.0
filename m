Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86A2C3064D
	for <igt-dev@archiver.kernel.org>; Fri, 28 Jun 2024 12:41:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560BE10EC2E;
	Fri, 28 Jun 2024 12:41:51 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD43E10E222;
 Fri, 28 Jun 2024 12:41:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Add_vmwgfx_prime_tests_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zack Rusin" <zack.rusin@broadcom.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 28 Jun 2024 12:41:50 -0000
Message-ID: <171957851068.185831.17743555641226027267@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240627195615.3695848-1-zack.rusin@broadcom.com>
In-Reply-To: <20240627195615.3695848-1-zack.rusin@broadcom.com>
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

Series: Add vmwgfx prime tests (rev2)
URL   : https://patchwork.freedesktop.org/series/133402/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
676b8e660cadae8ffb29a45b12ad5b53ef228b6a lib/rendercopy_gen9: Use AUX_NONE for platforms with unified compression

Tail of build.log:
[701/1679] Compiling C object 'tests/v3d/cad21b8@@v3d_submit_csd@exe/v3d_submit_csd.c.o'.
[702/1679] Compiling C object 'benchmarks/cb1d2fd@@gem_exec_tracer@sha/gem_exec_tracer.c.o'.
[703/1679] Compiling C object 'benchmarks/cb1d2fd@@gem_exec_trace@exe/gem_exec_trace.c.o'.
[704/1679] Compiling C object 'tests/59830eb@@xe_pat@exe/intel_xe_pat.c.o'.
[705/1679] Compiling C object 'benchmarks/cb1d2fd@@intel_upload_blit_large_gtt@exe/intel_upload_blit_large_gtt.c.o'.
[706/1679] Compiling C object 'tools/f9d35d4@@intel_forcewaked@exe/intel_forcewaked.c.o'.
[707/1679] Compiling C object 'tools/f9d35d4@@cnl_compute_wrpll@exe/cnl_compute_wrpll.c.o'.
[708/1679] Compiling C object 'tools/f9d35d4@@intel_dump_decode@exe/intel_dump_decode.c.o'.
[709/1679] Compiling C object 'tools/f9d35d4@@intel_lid@exe/intel_lid.c.o'.
[710/1679] Compiling C object 'benchmarks/cb1d2fd@@intel_upload_blit_small@exe/intel_upload_blit_small.c.o'.
[711/1679] Compiling C object 'tools/f9d35d4@@intel_framebuffer_dump@exe/intel_framebuffer_dump.c.o'.
[712/1679] Compiling C object 'tests/vmwgfx/776e741@@vmw_surface_copy@exe/vmw_surface_copy.c.o'.
[713/1679] Compiling C object 'tools/f9d35d4@@intel_gpu_time@exe/intel_gpu_time.c.o'.
[714/1679] Compiling C object 'benchmarks/cb1d2fd@@kms_fb_stress@exe/kms_fb_stress.c.o'.
[715/1679] Compiling C object 'tools/f9d35d4@@intel_firmware_decode@exe/intel_firmware_decode.c.o'.
[716/1679] Compiling C object 'tests/59830eb@@i915_query@exe/intel_i915_query.c.o'.
[717/1679] Compiling C object 'benchmarks/cb1d2fd@@vgem_mmap@exe/vgem_mmap.c.o'.
[718/1679] Compiling C object 'tools/f9d35d4@@intel_gtt@exe/intel_gtt.c.o'.
[719/1679] Compiling C object 'tools/f9d35d4@@intel_gpu_frequency@exe/intel_gpu_frequency.c.o'.
[720/1679] Compiling C object 'benchmarks/cb1d2fd@@gem_userptr_benchmark@exe/gem_userptr_benchmark.c.o'.
[721/1679] Compiling C object 'tests/vmwgfx/776e741@@vmw_ref_count@exe/vmw_ref_count.c.o'.
[722/1679] Compiling C object 'tools/f9d35d4@@skl_compute_wrpll@exe/skl_compute_wrpll.c.o'.
[723/1679] Compiling C object 'tools/f9d35d4@@intel_panel_fitter@exe/intel_panel_fitter.c.o'.
[724/1679] Compiling C object 'tests/59830eb@@kms_pm_rpm@exe/intel_kms_pm_rpm.c.o'.
[725/1679] Compiling C object 'tools/f9d35d4@@intel_perf_counters@exe/intel_perf_counters.c.o'.
[726/1679] Compiling C object 'tests/59830eb@@xe_exec_threads@exe/intel_xe_exec_threads.c.o'.
[727/1679] Compiling C object 'tests/59830eb@@kms_chamelium_frames@exe/chamelium_kms_chamelium_frames.c.o'.
[728/1679] Compiling C object 'benchmarks/cb1d2fd@@gem_syslatency@exe/gem_syslatency.c.o'.
[729/1679] Compiling C object 'tools/f9d35d4@@intel_opregion_decode@exe/intel_opregion_decode.c.o'.
[730/1679] Compiling C object 'benchmarks/cb1d2fd@@gem_latency@exe/gem_latency.c.o'.
[731/1679] Compiling C object 'tests/59830eb@@kms_psr2_sf@exe/intel_kms_psr2_sf.c.o'.
[732/1679] Compiling C object 'tests/59830eb@@gem_exec_balancer@exe/intel_gem_exec_balancer.c.o'.
[733/1679] Compiling C object 'tools/f9d35d4@@intel_guc_logger@exe/intel_guc_logger.c.o'.
[734/1679] Compiling C object 'tests/59830eb@@gem_stress@exe/intel_gem_stress.c.o'.
[735/1679] Compiling C object 'tools/f9d35d4@@intel_error_decode@exe/intel_error_decode.c.o'.
[736/1679] Compiling C object 'tools/f9d35d4@@intel_infoframes@exe/intel_infoframes.c.o'.
[737/1679] Generating i915-perf-equations with a custom command.
[738/1679] Compiling C object 'tests/59830eb@@xe_vm@exe/intel_xe_vm.c.o'.
[739/1679] Compiling C object 'tools/f9d35d4@@intel_display_poller@exe/intel_display_poller.c.o'.
[740/1679] Compiling C object 'tests/59830eb@@gem_userptr_blits@exe/intel_gem_userptr_blits.c.o'.
[741/1679] Compiling C object 'tests/59830eb@@gem_exec_fence@exe/intel_gem_exec_fence.c.o'.
[742/1679] Compiling C object 'tests/59830eb@@gem_concurrent_all@exe/intel_gem_concurrent_all.c.o'.
[743/1679] Compiling C object 'tests/59830eb@@kms_frontbuffer_tracking@exe/intel_kms_frontbuffer_tracking.c.o'.
[744/1679] Compiling C object 'tools/f9d35d4@@intel_audio_dump@exe/intel_audio_dump.c.o'.
[745/1679] Compiling C object 'tests/59830eb@@perf_pmu@exe/intel_perf_pmu.c.o'.
[746/1679] Compiling C object 'benchmarks/cb1d2fd@@gem_wsim@exe/gem_wsim.c.o'.
[747/1679] Compiling C object 'tests/59830eb@@perf@exe/intel_perf.c.o'.
[748/1679] Compiling C object 'tests/59830eb@@gem_exec_schedule@exe/intel_gem_exec_schedule.c.o'.
[749/1679] Linking target lib/libigt.so.0.
ninja: build stopped: subcommand failed.


