Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47212C3DA4A
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 01:59:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4AA810E7B4;
	Wed, 21 Aug 2024 01:59:30 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7125D10E7B4;
 Wed, 21 Aug 2024 01:59:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/xe=3A_Add_system=5F?=
 =?utf-8?q?allocator_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 21 Aug 2024 01:59:29 -0000
Message-ID: <172420556945.717251.7241616339230093452@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240821014108.1578139-1-matthew.brost@intel.com>
In-Reply-To: <20240821014108.1578139-1-matthew.brost@intel.com>
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

Series: tests/xe: Add system_allocator test
URL   : https://patchwork.freedesktop.org/series/137545/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
f4e2ada1adec484cf506b5ec7e9acb3ae62228f1 tests/intel/xe_gt_freq: Add a wait after gt reset

Tail of build.log:
[850/1764] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_cflgt3.c.o'.
[851/1764] Compiling C object 'lib/76b5a35@@i915_perf@sha/i915_perf.c.o'.
[852/1764] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_kblgt3.c.o'.
[853/1764] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_cflgt2.c.o'.
[854/1764] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_bdw.c.o'.
[855/1764] Compiling C object 'tools/i915-perf/d68c898@@i915-perf-reader@exe/i915_perf_reader.c.o'.
[856/1764] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_icl.c.o'.
[857/1764] Compiling C object 'tools/f9d35d4@@msm_dp_compliance@exe/igt_compliance_utils.c.o'.
[858/1764] Compiling C object 'tools/null_state_gen/bfd930e@@intel_null_state_gen@exe/intel_batchbuffer.c.o'.
[859/1764] Compiling C object 'tools/f9d35d4@@intel_infoframes@exe/intel_infoframes.c.o'.
[860/1764] Compiling C object 'tools/f9d35d4@@intel_error_decode@exe/intel_error_decode.c.o'.
[861/1764] Compiling C object 'tools/xe-perf/f41d0c0@@xe-perf-configs@exe/xe_perf_configs.c.o'.
[862/1764] Compiling C object 'tools/f9d35d4@@intel_residency@exe/intel_residency.c.o'.
[863/1764] Compiling C object 'tools/xe-perf/f41d0c0@@xe-perf-reader@exe/xe_perf_reader.c.o'.
[864/1764] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_dg1.c.o'.
[865/1764] Compiling C object 'tests/59830eb@@gem_userptr_blits@exe/intel_gem_userptr_blits.c.o'.
[866/1764] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_adl.c.o'.
[867/1764] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_ehl.c.o'.
[868/1764] Compiling C object 'tools/f9d35d4@@gputop@exe/gputop.c.o'.
[869/1764] Compiling C object 'runner/testdata/3f061af@@successtest@exe/successtest.c.o'.
[870/1764] Compiling C object 'tools/f9d35d4@@msm_dp_compliance@exe/igt_dp_compliance_hotplug.c.o'.
[871/1764] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_tglgt2.c.o'.
[872/1764] Compiling C object 'tools/f9d35d4@@intel_dp_compliance@exe/intel_dp_compliance.c.o'.
[873/1764] Compiling C object 'tests/59830eb@@gem_exec_fence@exe/intel_gem_exec_fence.c.o'.
[874/1764] Compiling C object 'tools/i915-perf/d68c898@@i915-perf-recorder@exe/i915_perf_recorder.c.o'.
[875/1764] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_registers_mtlgt3.c.o'.
[876/1764] Compiling C object 'tools/xe-perf/f41d0c0@@xe-perf-recorder@exe/xe_perf_recorder.c.o'.
[877/1764] Compiling C object 'tests/59830eb@@kms_frontbuffer_tracking@exe/intel_kms_frontbuffer_tracking.c.o'.
[878/1764] Compiling C object 'tests/59830eb@@gem_concurrent_all@exe/intel_gem_concurrent_all.c.o'.
[879/1764] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_registers_acmgt1.c.o'.
[880/1764] Compiling C object 'tools/f9d35d4@@intel_audio_dump@exe/intel_audio_dump.c.o'.
[881/1764] Compiling C object 'tools/f9d35d4@@intel_watermark@exe/intel_watermark.c.o'.
[882/1764] Compiling C object 'tools/f9d35d4@@intel_display_poller@exe/intel_display_poller.c.o'.
[883/1764] Compiling C object 'tests/59830eb@@xe_vm@exe/intel_xe_vm.c.o'.
[884/1764] Compiling C object 'benchmarks/cb1d2fd@@gem_wsim@exe/gem_wsim.c.o'.
[885/1764] Compiling C object 'tests/59830eb@@perf_pmu@exe/intel_perf_pmu.c.o'.
[886/1764] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_registers_acmgt2.c.o'.
[887/1764] Compiling C object 'tests/59830eb@@xe_oa@exe/intel_xe_oa.c.o'.
[888/1764] Compiling C object 'tools/f9d35d4@@intel_vbt_decode@exe/intel_vbt_decode.c.o'.
[889/1764] Compiling C object 'tests/59830eb@@perf@exe/intel_perf.c.o'.
[890/1764] Compiling C object 'tests/59830eb@@gem_exec_schedule@exe/intel_gem_exec_schedule.c.o'.
[891/1764] Linking target lib/libigt.so.0.
[892/1764] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_registers_acmgt3.c.o'.
[893/1764] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_mtlgt2.c.o'.
[894/1764] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_equations.c.o'.
[895/1764] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_mtlgt3.c.o'.
[896/1764] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt1.c.o'.
[897/1764] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt2.c.o'.
[898/1764] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt3.c.o'.
ninja: build stopped: subcommand failed.


