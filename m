Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B2ECD1292
	for <igt-dev@archiver.kernel.org>; Thu,  4 Apr 2024 09:37:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6CD911ADAC;
	Thu,  4 Apr 2024 09:37:53 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C7411AD12;
 Thu,  4 Apr 2024 09:37:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Update_compression_check_?=
 =?utf-8?q?based_on_platform?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Akshata Jahagirdar" <akshata.jahagirdar@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 04 Apr 2024 09:37:50 -0000
Message-ID: <171222347095.1209409.15059796103284125162@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1712252787.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1712252787.git.akshata.jahagirdar@intel.com>
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

Series: Update compression check based on platform
URL   : https://patchwork.freedesktop.org/series/132014/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
5e3263748a636ebc91ecfafbd339870c77e3eed6 tests/amdgpu/amd_ilr: Fix eDP PSR not be re-enabled after test

Tail of build.log:
[657/1674] Compiling C object 'tests/v3d/cad21b8@@v3d_create_bo@exe/v3d_create_bo.c.o'.
[658/1674] Compiling C object 'tests/v3d/cad21b8@@v3d_get_bo_offset@exe/v3d_get_bo_offset.c.o'.
[659/1674] Compiling C object 'tests/v3d/cad21b8@@v3d_mmap@exe/v3d_mmap.c.o'.
[660/1674] Compiling C object 'tests/vc4/e4667e8@@vc4_dmabuf_poll@exe/vc4_dmabuf_poll.c.o'.
[661/1674] Compiling C object 'tests/vc4/e4667e8@@vc4_lookup_fail@exe/vc4_lookup_fail.c.o'.
[662/1674] Generating testlist with a custom command.
[663/1674] Generating testlist-full with a custom command.
[664/1674] Compiling C object 'tests/59830eb@@xe_query@exe/intel_xe_query.c.o'.
[665/1674] Compiling C object 'tests/vc4/e4667e8@@vc4_mmap@exe/vc4_mmap.c.o'.
[666/1674] Compiling C object 'tests/59830eb@@i915_query@exe/intel_i915_query.c.o'.
[667/1674] Compiling C object 'tests/v3d/cad21b8@@v3d_perfmon@exe/v3d_perfmon.c.o'.
[668/1674] Compiling C object 'tests/vc4/e4667e8@@vc4_create_bo@exe/vc4_create_bo.c.o'.
[669/1674] Compiling C object 'tests/vc4/e4667e8@@vc4_tiling@exe/vc4_tiling.c.o'.
[670/1674] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_registers_hsw.c.o'.
[671/1674] Compiling C object 'tests/v3d/cad21b8@@v3d_wait_bo@exe/v3d_wait_bo.c.o'.
[672/1674] Compiling C object 'tests/vc4/e4667e8@@vc4_label_bo@exe/vc4_label_bo.c.o'.
[673/1674] Compiling C object 'tests/59830eb@@kms_pm_rpm@exe/intel_kms_pm_rpm.c.o'.
[674/1674] Compiling C object 'tests/59830eb@@gem_exec_balancer@exe/intel_gem_exec_balancer.c.o'.
[675/1674] Compiling C object 'tests/v3d/cad21b8@@v3d_job_submission@exe/v3d_job_submission.c.o'.
[676/1674] Compiling C object 'tests/vc4/e4667e8@@vc4_perfmon@exe/vc4_perfmon.c.o'.
[677/1674] Compiling C object 'tests/59830eb@@kms_chamelium_audio@exe/chamelium_kms_chamelium_audio.c.o'.
[678/1674] Compiling C object 'tests/vc4/e4667e8@@vc4_purgeable_bo@exe/vc4_purgeable_bo.c.o'.
[679/1674] Compiling C object 'tests/vc4/e4667e8@@vc4_wait_seqno@exe/vc4_wait_seqno.c.o'.
[680/1674] Compiling C object 'tests/59830eb@@kms_chamelium_edid@exe/chamelium_kms_chamelium_edid.c.o'.
[681/1674] Compiling C object 'tests/59830eb@@kms_chamelium_color@exe/chamelium_kms_chamelium_color.c.o'.
[682/1674] Compiling C object 'tests/vc4/e4667e8@@vc4_wait_bo@exe/vc4_wait_bo.c.o'.
[683/1674] Compiling C object 'tests/59830eb@@kms_psr2_sf@exe/intel_kms_psr2_sf.c.o'.
[684/1674] Compiling C object 'tests/v3d/cad21b8@@v3d_submit_cl@exe/v3d_submit_cl.c.o'.
[685/1674] Compiling C object 'tests/59830eb@@xe_exec_threads@exe/intel_xe_exec_threads.c.o'.
[686/1674] Compiling C object 'tests/vmwgfx/776e741@@vmw_mob_stress@exe/vmw_mob_stress.c.o'.
[687/1674] Compiling C object 'tests/v3d/cad21b8@@v3d_submit_csd@exe/v3d_submit_csd.c.o'.
[688/1674] Compiling C object 'tests/59830eb@@kms_chamelium_hpd@exe/chamelium_kms_chamelium_hpd.c.o'.
[689/1674] Compiling C object 'benchmarks/cb1d2fd@@gem_exec_reloc@exe/gem_exec_reloc.c.o'.
[690/1674] Compiling C object 'tests/vmwgfx/776e741@@vmw_tri@exe/vmw_tri.c.o'.
[691/1674] Compiling C object 'tests/vmwgfx/776e741@@vmw_execution_buffer@exe/vmw_execution_buffer.c.o'.
[692/1674] Compiling C object 'tests/vmwgfx/776e741@@vmw_ref_count@exe/vmw_ref_count.c.o'.
[693/1674] Compiling C object 'benchmarks/cb1d2fd@@gem_blt@exe/gem_blt.c.o'.
[694/1674] Compiling C object 'tests/59830eb@@kms_chamelium_frames@exe/chamelium_kms_chamelium_frames.c.o'.
[695/1674] Compiling C object 'tests/vmwgfx/776e741@@vmw_surface_copy@exe/vmw_surface_copy.c.o'.
[696/1674] Compiling C object 'tests/59830eb@@gem_stress@exe/intel_gem_stress.c.o'.
[697/1674] Compiling C object 'tests/59830eb@@gem_exec_fence@exe/intel_gem_exec_fence.c.o'.
[698/1674] Compiling C object 'tests/59830eb@@gem_userptr_blits@exe/intel_gem_userptr_blits.c.o'.
[699/1674] Compiling C object 'tests/59830eb@@xe_vm@exe/intel_xe_vm.c.o'.
[700/1674] Compiling C object 'tests/59830eb@@kms_frontbuffer_tracking@exe/intel_kms_frontbuffer_tracking.c.o'.
[701/1674] Compiling C object 'tests/59830eb@@gem_concurrent_all@exe/intel_gem_concurrent_all.c.o'.
[702/1674] Compiling C object 'tests/59830eb@@perf_pmu@exe/intel_perf_pmu.c.o'.
[703/1674] Compiling C object 'tests/59830eb@@gem_exec_schedule@exe/intel_gem_exec_schedule.c.o'.
[704/1674] Compiling C object 'tests/59830eb@@perf@exe/intel_perf.c.o'.
[705/1674] Linking target lib/libigt.so.0.
ninja: build stopped: subcommand failed.


