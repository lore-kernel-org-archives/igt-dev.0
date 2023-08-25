Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
Date: Fri, 25 Aug 2023 14:06:47 -0000
Message-ID: <169297240740.10952.3084154955686063430@emeril.freedesktop.org>
References: <20230825120205.802246-1-aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20230825120205.802246-1-aravind.iddamsetty@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBBIHRv?=
 =?utf-8?q?ol_to_demonstrate_use_of_netlink_sockets_to_read_RAS_error_coun?=
 =?utf-8?q?ters_=28rev2=29?=
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

Series: A tool to demonstrate use of netlink sockets to read RAS error counters (rev2)
URL   : https://patchwork.freedesktop.org/series/118438/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
f395b9c2b3f34de57d9639cf2d81b834bc68cd74 tests/kms_color: skip deep-color test for mst

Tail of build.log:
[736/1628] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_registers_kblgt2.c.o'.
[737/1628] Compiling C object 'tests/59830eb@@gem_stress@exe/i915_gem_stress.c.o'.
[738/1628] Compiling C object 'runner/testdata/3f061af@@successtest@exe/successtest.c.o'.
[739/1628] Compiling C object 'tools/i915-perf/d68c898@@i915-perf-reader@exe/i915_perf_reader.c.o'.
[740/1628] Compiling C object 'tools/f9d35d4@@msm_dp_compliance@exe/igt_dp_compliance_hotplug.c.o'.
[741/1628] Compiling C object 'runner/testdata/3f061af@@skippers@exe/skippers.c.o'.
[742/1628] Compiling C object 'tools/f9d35d4@@msm_dp_compliance@exe/igt_compliance_utils.c.o'.
[743/1628] Compiling C object 'runner/527aa9f@@igt_runner@exe/runner.c.o'.
[744/1628] Compiling C object 'runner/testdata/3f061af@@abort-fixture@exe/abort-fixture.c.o'.
[745/1628] Compiling C object 'runner/testdata/3f061af@@abort-simple@exe/abort-simple.c.o'.
[746/1628] Compiling C object 'tools/f9d35d4@@intel_l3_parity@exe/intel_l3_parity.c.o'.
[747/1628] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_registers_chv.c.o'.
[748/1628] Compiling C object 'runner/testdata/3f061af@@abort-dynamic@exe/abort-dynamic.c.o'.
[749/1628] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_registers_bdw.c.o'.
[750/1628] Compiling C object 'runner/testdata/3f061af@@dynamic@exe/dynamic.c.o'.
[751/1628] Compiling C object 'runner/testdata/3f061af@@abort@exe/abort.c.o'.
[752/1628] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_registers_cflgt3.c.o'.
[753/1628] Compiling C object 'tools/f9d35d4@@intel_residency@exe/intel_residency.c.o'.
[754/1628] Compiling C object 'runner/527aa9f@@runner_json_test@exe/runner_json_tests.c.o'.
[755/1628] Compiling C object 'tools/f9d35d4@@intel_error_decode@exe/intel_error_decode.c.o'.
[756/1628] Compiling C object 'tools/f9d35d4@@msm_dp_compliance@exe/msm_dp_compliance.c.o'.
[757/1628] Compiling C object 'runner/527aa9f@@igt_runner@sta/job_list.c.o'.
[758/1628] Compiling C object 'tools/f9d35d4@@intel_infoframes@exe/intel_infoframes.c.o'.
[759/1628] Compiling C object 'tools/f9d35d4@@intel_dp_compliance@exe/intel_dp_compliance.c.o'.
[760/1628] Compiling C object 'tests/59830eb@@i915_pm_rpm@exe/i915_i915_pm_rpm.c.o'.
[761/1628] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_hsw.c.o'.
[762/1628] Compiling C object 'tools/i915-perf/d68c898@@i915-perf-recorder@exe/i915_perf_recorder.c.o'.
[763/1628] Compiling C object 'tools/f9d35d4@@intel_reg@exe/intel_reg.c.o'.
[764/1628] Compiling C object 'runner/527aa9f@@igt_runner@sta/settings.c.o'.
[765/1628] Compiling C object 'tests/59830eb@@xe_vm@exe/xe_xe_vm.c.o'.
[766/1628] Compiling C object 'tools/f9d35d4@@intel_display_poller@exe/intel_display_poller.c.o'.
[767/1628] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_bdw.c.o'.
[768/1628] Compiling C object 'tools/f9d35d4@@intel_reg@exe/intel_reg_decode.c.o'.
[769/1628] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_sklgt4.c.o'.
[770/1628] Compiling C object 'tools/f9d35d4@@intel_watermark@exe/intel_watermark.c.o'.
[771/1628] Compiling C object 'benchmarks/cb1d2fd@@gem_wsim@exe/gem_wsim.c.o'.
[772/1628] Compiling C object 'tools/f9d35d4@@intel_audio_dump@exe/intel_audio_dump.c.o'.
[773/1628] Compiling C object 'tests/59830eb@@gem_exec_fence@exe/i915_gem_exec_fence.c.o'.
[774/1628] Compiling C object 'tests/59830eb@@gem_concurrent_all@exe/i915_gem_concurrent_all.c.o'.
[775/1628] Compiling C object 'tests/59830eb@@kms_frontbuffer_tracking@exe/i915_kms_frontbuffer_tracking.c.o'.
[776/1628] Compiling C object 'runner/527aa9f@@igt_runner@sta/resultgen.c.o'.
[777/1628] Compiling C object 'tools/f9d35d4@@intel_vbt_decode@exe/intel_vbt_decode.c.o'.
[778/1628] Compiling C object 'runner/527aa9f@@igt_runner@sta/executor.c.o'.
[779/1628] Compiling C object 'tests/59830eb@@perf_pmu@exe/i915_perf_pmu.c.o'.
[780/1628] Compiling C object 'tools/f9d35d4@@intel_gpu_top@exe/intel_gpu_top.c.o'.
[781/1628] Compiling C object 'tests/59830eb@@perf@exe/i915_perf.c.o'.
[782/1628] Compiling C object 'tests/59830eb@@gem_exec_schedule@exe/i915_gem_exec_schedule.c.o'.
[783/1628] Linking target lib/libigt.so.0.
[784/1628] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_equations.c.o'.
ninja: build stopped: subcommand failed.

