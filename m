Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Date: Wed, 27 Sep 2023 10:00:48 -0000
Message-ID: <169580884816.20755.13182300089849980053@emeril.freedesktop.org>
References: <20230927095505.40514-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20230927095505.40514-1-kamil.konieczny@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBkcm10?=
 =?utf-8?q?est_changes_for_running_tests_on_multi-gpu_=28rev2=29?=
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

Series: drmtest changes for running tests on multi-gpu (rev2)
URL   : https://patchwork.freedesktop.org/series/123991/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
8d12be0387d5b80076b7d67db7831292bb34f6df tests/amdgpu: add pstate test

Tail of build.log:
[1593/1641] Linking target tools/intel_gvtg_test.
[1594/1641] Generating gem_stress.testlist with a meson_exe.py custom command.
[1595/1641] Linking target tools/lsgpu.
[1596/1641] Linking target tools/intel_vbt_decode.
[1597/1641] Linking target tools/intel_perf_counters.
[1598/1641] Linking target tools/intel_gem_info.
[1599/1641] Linking target tools/xe_reg.
[1600/1641] Linking target tools/intel_dp_compliance.
[1601/1641] Linking target tools/intel_reg.
[1602/1641] Linking target tools/amd_hdmi_compliance.
[1603/1641] Linking target tools/msm_dp_compliance.
[1604/1641] Linking target runner/testdata/abort.
[1605/1641] Linking target runner/testdata/no-subtests.
[1606/1641] Linking target runner/igt_comms_decoder.
[1607/1641] Linking target tools/intel_l3_parity.
[1608/1641] Linking target runner/testdata/successtest.
[1609/1641] Linking target runner/igt_resume.
[1610/1641] Linking target runner/testdata/skippers.
[1611/1641] Linking target runner/runner_json_test.
[1612/1641] Linking target runner/testdata/abort-fixture.
[1613/1641] Linking target runner/testdata/dynamic.
[1614/1641] Linking target runner/testdata/abort-dynamic.
[1615/1641] Linking target runner/igt_results.
[1616/1641] Linking target runner/testdata/abort-simple.
[1617/1641] Linking target runner/igt_runner.
[1618/1641] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_mtlgt3.c.o'.
[1619/1641] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
[1620/1641] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt1.c.o'.
[1621/1641] Linking target runner/runner_test.
[1622/1641] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt2.c.o'.
[1623/1641] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt3.c.o'.
[1624/1641] Linking target lib/libi915_perf.so.1.5.
[1625/1641] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.so.1.5.symbols'.
[1626/1641] Linking target tools/i915-perf/i915-perf-configs.
[1627/1641] Linking target tools/i915-perf/i915-perf-recorder.
[1628/1641] Linking target tools/i915-perf/i915-perf-reader.
[1629/1641] Linking target tests/gem_barrier_race.
[1630/1641] Linking target tests/core_hotunplug.
[1631/1641] Linking target tests/perf.
[1632/1641] Generating gem_barrier_race.testlist with a meson_exe.py custom command.
[1633/1641] Generating core_hotunplug.testlist with a meson_exe.py custom command.
[1634/1641] Generating perf.testlist with a meson_exe.py custom command.
[1635/1641] Generating xe_tests.rst with a custom command.
FAILED: docs/testplan/xe_tests.rst 
/usr/src/igt-gpu-tools/scripts/igt_doc.py --config /usr/src/igt-gpu-tools/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /opt/igt/build
/usr/src/igt-gpu-tools/tests/intel/xe_create.c:199: Error: unrecognized line. Need to add field at /usr/src/igt-gpu-tools/tests/intel/xe_test_config.json?
	==> Test sub-category: multi gpu
[1636/1641] Generating i915_tests.rst with a custom command.
[1637/1641] Generating kms_tests.rst with a custom command.
ninja: build stopped: subcommand failed.

