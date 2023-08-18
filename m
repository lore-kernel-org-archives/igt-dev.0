Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Date: Fri, 18 Aug 2023 19:28:07 -0000
Message-ID: <169238688746.12740.13573066508150451741@emeril.freedesktop.org>
References: <20230818192203.75155-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20230818192203.75155-1-kamil.konieczny@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBSRkM6?=
 =?utf-8?q?_runner/resultgen=3A_lower_dmesg_copied_when_size_limit_was_exc?=
 =?utf-8?q?eeded?=
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
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: RFC: runner/resultgen: lower dmesg copied when size limit was exceeded
URL   : https://patchwork.freedesktop.org/series/122650/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
2741053c529d822ac60608ad80b910e5858be467 Revert "testplan/kms: Make documentation is mandatory for all kms subtests"

Tail of build.log:
[768/1624] Compiling C object 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_dri2.c.o'.
[769/1624] Compiling C object 'overlay/b4b33d2@@intel-gpu-overlay@exe/rc6.c.o'.
[770/1624] Compiling C object 'tools/f9d35d4@@intel_infoframes@exe/intel_infoframes.c.o'.
[771/1624] Compiling C object 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_rgb2yuv.c.o'.
[772/1624] Compiling C object 'tools/f9d35d4@@msm_dp_compliance@exe/msm_dp_compliance.c.o'.
[773/1624] Compiling C object 'overlay/b4b33d2@@intel-gpu-overlay@exe/kms_kms-overlay.c.o'.
[774/1624] Compiling C object 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_x11-overlay.c.o'.
[775/1624] Compiling C object 'tools/f9d35d4@@intel_dp_compliance@exe/intel_dp_compliance.c.o'.
[776/1624] Generating intel_error_decode.1 with a custom command.
[777/1624] Generating intel_lid.1 with a custom command.
[778/1624] Compiling C object 'runner/527aa9f@@igt_runner@sta/job_list.c.o'.
[779/1624] Compiling C object 'tests/59830eb@@gem_exec_balancer@exe/i915_gem_exec_balancer.c.o'.
[780/1624] Generating intel_audio_dump.1 with a custom command.
[781/1624] Generating intel_gpu_frequency.1 with a custom command.
[782/1624] Generating intel_infoframes.1 with a custom command.
[783/1624] Generating intel_bios_dumper.1 with a custom command.
[784/1624] Generating intel_gpu_top.1 with a custom command.
[785/1624] Compiling C object 'runner/527aa9f@@igt_runner@sta/settings.c.o'.
[786/1624] Compiling C object 'tools/i915-perf/d68c898@@i915-perf-recorder@exe/i915_perf_recorder.c.o'.
[787/1624] Compiling C object 'assembler/1ca89e8@@brw@sta/gen8_instruction.c.o'.
[788/1624] Compiling C object 'tools/f9d35d4@@intel_reg@exe/intel_reg.c.o'.
[789/1624] Generating intel_gtt.1 with a custom command.
[790/1624] Generating intel_panel_fitter.1 with a custom command.
[791/1624] Compiling C object 'tests/59830eb@@i915_pm_rpm@exe/i915_i915_pm_rpm.c.o'.
[792/1624] Compiling C object 'assembler/1ca89e8@@brw@sta/gen8_disasm.c.o'.
[793/1624] Generating source from 'assembler/gram.y'.
[794/1624] Compiling C object 'assembler/1ca89e8@@brw@sta/brw_disasm.c.o'.
[795/1624] Compiling C object 'tools/f9d35d4@@intel_reg@exe/intel_reg_decode.c.o'.
[796/1624] Compiling C object 'tools/f9d35d4@@intel_display_poller@exe/intel_display_poller.c.o'.
[797/1624] Compiling C object 'overlay/b4b33d2@@intel-gpu-overlay@exe/gpu-perf.c.o'.
[798/1624] Compiling C object 'tests/59830eb@@xe_vm@exe/xe_xe_vm.c.o'.
[799/1624] Compiling C object 'overlay/b4b33d2@@intel-gpu-overlay@exe/overlay.c.o'.
[800/1624] Compiling C object 'tools/f9d35d4@@intel_watermark@exe/intel_watermark.c.o'.
[801/1624] Compiling C object 'tests/59830eb@@gem_concurrent_all@exe/i915_gem_concurrent_all.c.o'.
[802/1624] Compiling C object 'tests/59830eb@@gem_exec_fence@exe/i915_gem_exec_fence.c.o'.
[803/1624] Compiling C object 'tools/f9d35d4@@intel_vbt_decode@exe/intel_vbt_decode.c.o'.
[804/1624] Compiling C object 'tests/59830eb@@gem_userptr_blits@exe/i915_gem_userptr_blits.c.o'.
[805/1624] Compiling C object 'tests/59830eb@@kms_frontbuffer_tracking@exe/i915_kms_frontbuffer_tracking.c.o'.
[806/1624] Compiling C object 'tools/f9d35d4@@intel_audio_dump@exe/intel_audio_dump.c.o'.
[807/1624] Compiling C object 'benchmarks/cb1d2fd@@gem_wsim@exe/gem_wsim.c.o'.
[808/1624] Compiling C object 'runner/527aa9f@@igt_runner@sta/executor.c.o'.
[809/1624] Compiling C object 'tests/59830eb@@perf_pmu@exe/i915_perf_pmu.c.o'.
[810/1624] Compiling C object 'assembler/1ca89e8@@brw@sta/brw_eu_emit.c.o'.
[811/1624] Generating i915-perf-equations with a custom command.
[812/1624] Compiling C object 'tools/f9d35d4@@intel_gpu_top@exe/intel_gpu_top.c.o'.
[813/1624] Compiling C object 'tests/59830eb@@perf@exe/i915_perf.c.o'.
[814/1624] Compiling C object 'tests/59830eb@@gem_exec_schedule@exe/i915_gem_exec_schedule.c.o'.
[815/1624] Linking target lib/libigt.so.0.
[816/1624] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
ninja: build stopped: subcommand failed.

