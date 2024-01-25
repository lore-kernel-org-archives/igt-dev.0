Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95467C47258
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 18:51:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3043810E327;
	Thu, 25 Jan 2024 18:51:49 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0554510E327;
 Thu, 25 Jan 2024 18:51:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_introduce_Xe_multigpu_and?=
 =?utf-8?q?_other_multi-GPU_helpers_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Date: Thu, 25 Jan 2024 18:51:48 -0000
Message-ID: <170620870802.727567.11815967454267685730@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240125183632.50422-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240125183632.50422-1-kamil.konieczny@linux.intel.com>
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

Series: introduce Xe multigpu and other multi-GPU helpers (rev3)
URL   : https://patchwork.freedesktop.org/series/129101/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
5d9c29c620701497323bf3721146da57efa50952 tests/kms_vrr: Reset to High refresh rate before begin drrs test

Tail of build.log:
[641/1669] Compiling C object 'tests/vc4/e4667e8@@vc4_lookup_fail@exe/vc4_lookup_fail.c.o'.
[642/1669] Compiling C object 'tests/59830eb@@kms_chamelium_frames@exe/chamelium_kms_chamelium_helper.c.o'.
[643/1669] Compiling C object 'tests/vc4/e4667e8@@vc4_dmabuf_poll@exe/vc4_dmabuf_poll.c.o'.
[644/1669] Compiling C object 'tests/59830eb@@kms_chamelium_hpd@exe/chamelium_kms_chamelium_helper.c.o'.
[645/1669] Compiling C object 'tests/vc4/e4667e8@@vc4_create_bo@exe/vc4_create_bo.c.o'.
[646/1669] Compiling C object 'tests/vc4/e4667e8@@vc4_wait_seqno@exe/vc4_wait_seqno.c.o'.
[647/1669] Compiling C object 'tests/vc4/e4667e8@@vc4_label_bo@exe/vc4_label_bo.c.o'.
[648/1669] Compiling C object 'tests/vc4/e4667e8@@vc4_tiling@exe/vc4_tiling.c.o'.
[649/1669] Compiling C object 'tests/vc4/e4667e8@@vc4_mmap@exe/vc4_mmap.c.o'.
[650/1669] Compiling C object 'tests/vc4/e4667e8@@vc4_wait_bo@exe/vc4_wait_bo.c.o'.
[651/1669] Compiling C object 'tests/v3d/cad21b8@@v3d_wait_bo@exe/v3d_wait_bo.c.o'.
[652/1669] Compiling C object 'tests/vc4/e4667e8@@vc4_perfmon@exe/vc4_perfmon.c.o'.
[653/1669] Compiling C object 'tests/v3d/cad21b8@@v3d_perfmon@exe/v3d_perfmon.c.o'.
[654/1669] Compiling C object 'tests/v3d/cad21b8@@v3d_job_submission@exe/v3d_job_submission.c.o'.
[655/1669] Compiling C object 'tests/vc4/e4667e8@@vc4_purgeable_bo@exe/vc4_purgeable_bo.c.o'.
[656/1669] Compiling C object 'tests/59830eb@@xe_pm@exe/intel_xe_pm.c.o'.
[657/1669] Compiling C object 'tests/59830eb@@xe_exec_reset@exe/intel_xe_exec_reset.c.o'.
[658/1669] Compiling C object 'tests/vmwgfx/776e741@@vmw_mob_stress@exe/vmw_mob_stress.c.o'.
[659/1669] Compiling C object 'tests/v3d/cad21b8@@v3d_submit_cl@exe/v3d_submit_cl.c.o'.
[660/1669] Compiling C object 'tests/59830eb@@kms_chamelium_edid@exe/chamelium_kms_chamelium_edid.c.o'.
[661/1669] Compiling C object 'tests/59830eb@@xe_evict@exe/intel_xe_evict.c.o'.
[662/1669] Compiling C object 'tests/59830eb@@kms_chamelium_color@exe/chamelium_kms_chamelium_color.c.o'.
[663/1669] Compiling C object 'tests/59830eb@@xe_pat@exe/intel_xe_pat.c.o'.
[664/1669] Compiling C object 'tests/vmwgfx/776e741@@vmw_ref_count@exe/vmw_ref_count.c.o'.
[665/1669] Compiling C object 'tests/59830eb@@xe_query@exe/intel_xe_query.c.o'.
[666/1669] Compiling C object 'tests/vmwgfx/776e741@@vmw_surface_copy@exe/vmw_surface_copy.c.o'.
[667/1669] Compiling C object 'tests/59830eb@@kms_chamelium_audio@exe/chamelium_kms_chamelium_audio.c.o'.
[668/1669] Compiling C object 'tests/vmwgfx/776e741@@vmw_tri@exe/vmw_tri.c.o'.
[669/1669] Compiling C object 'tests/59830eb@@gem_softpin@exe/intel_gem_softpin.c.o'.
[670/1669] Compiling C object 'tests/59830eb@@kms_psr2_sf@exe/intel_kms_psr2_sf.c.o'.
[671/1669] Compiling C object 'tests/59830eb@@kms_chamelium_hpd@exe/chamelium_kms_chamelium_hpd.c.o'.
[672/1669] Compiling C object 'tests/v3d/cad21b8@@v3d_submit_csd@exe/v3d_submit_csd.c.o'.
[673/1669] Compiling C object 'tests/vmwgfx/776e741@@vmw_execution_buffer@exe/vmw_execution_buffer.c.o'.
[674/1669] Compiling C object 'tests/59830eb@@kms_pm_rpm@exe/intel_kms_pm_rpm.c.o'.
[675/1669] Compiling C object 'tests/59830eb@@i915_query@exe/intel_i915_query.c.o'.
[676/1669] Compiling C object 'benchmarks/cb1d2fd@@gem_blt@exe/gem_blt.c.o'.
[677/1669] Compiling C object 'tests/59830eb@@xe_exec_threads@exe/intel_xe_exec_threads.c.o'.
[678/1669] Compiling C object 'tests/59830eb@@xe_intel_bb@exe/intel_xe_intel_bb.c.o'.
[679/1669] Compiling C object 'tests/59830eb@@gem_stress@exe/intel_gem_stress.c.o'.
[680/1669] Compiling C object 'tests/59830eb@@gem_exec_balancer@exe/intel_gem_exec_balancer.c.o'.
[681/1669] Compiling C object 'tests/59830eb@@kms_chamelium_frames@exe/chamelium_kms_chamelium_frames.c.o'.
[682/1669] Compiling C object 'tests/59830eb@@xe_vm@exe/intel_xe_vm.c.o'.
[683/1669] Compiling C object 'tests/59830eb@@gem_exec_fence@exe/intel_gem_exec_fence.c.o'.
[684/1669] Compiling C object 'tests/59830eb@@gem_concurrent_all@exe/intel_gem_concurrent_all.c.o'.
[685/1669] Generating i915-perf-equations with a custom command.
[686/1669] Compiling C object 'tests/59830eb@@kms_frontbuffer_tracking@exe/intel_kms_frontbuffer_tracking.c.o'.
[687/1669] Compiling C object 'tests/59830eb@@perf_pmu@exe/intel_perf_pmu.c.o'.
[688/1669] Compiling C object 'tests/59830eb@@gem_exec_schedule@exe/intel_gem_exec_schedule.c.o'.
[689/1669] Compiling C object 'tests/59830eb@@perf@exe/intel_perf.c.o'.
ninja: build stopped: subcommand failed.


