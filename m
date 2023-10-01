Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Date: Sun, 01 Oct 2023 10:50:40 -0000
Message-ID: <169615744029.10311.15092436498746280203@emeril.freedesktop.org>
References: <20231001103006.431894-1-kunal1.joshi@intel.com>
In-Reply-To: <20231001103006.431894-1-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBBZGQg?=
 =?utf-8?q?test_for_hotplug_validation_in_simulation?=
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

Series: Add test for hotplug validation in simulation
URL   : https://patchwork.freedesktop.org/series/124491/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
8abfd4fd5c71c882e90410aac2afba7331904b2b lib/intel_blt: Add check to see if blt commands are supported by the platforms

Tail of build.log:
[1598/1644] Linking target tools/xe_reg.
[1599/1644] Linking target tools/intel_watermark.
[1600/1644] Linking target tools/intel_gvtg_test.
[1601/1644] Linking target runner/testdata/successtest.
[1602/1644] Linking target tools/intel_residency.
[1603/1644] Linking target tools/intel_reg.
[1604/1644] Linking target runner/testdata/abort-simple.
[1605/1644] Linking target runner/testdata/dynamic.
[1606/1644] Generating gem_stress.testlist with a meson_exe.py custom command.
[1607/1644] Linking target runner/testdata/no-subtests.
[1608/1644] Linking target tools/amd_hdmi_compliance.
[1609/1644] Linking target tools/msm_dp_compliance.
[1610/1644] Linking target runner/igt_comms_decoder.
[1611/1644] Linking target runner/runner_json_test.
[1612/1644] Linking target tools/lsgpu.
[1613/1644] Linking target runner/igt_runner.
[1614/1644] Linking target runner/testdata/abort-dynamic.
[1615/1644] Linking target runner/igt_results.
[1616/1644] Linking target tools/intel_dp_compliance.
[1617/1644] Linking target runner/testdata/skippers.
[1618/1644] Linking target runner/testdata/abort.
[1619/1644] Linking target runner/testdata/abort-fixture.
[1620/1644] Linking target runner/igt_resume.
[1621/1644] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_mtlgt3.c.o'.
[1622/1644] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
[1623/1644] Linking target runner/runner_test.
[1624/1644] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt1.c.o'.
[1625/1644] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt2.c.o'.
[1626/1644] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt3.c.o'.
[1627/1644] Linking target lib/libi915_perf.so.1.5.
[1628/1644] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.so.1.5.symbols'.
[1629/1644] Linking target tools/i915-perf/i915-perf-configs.
[1630/1644] Linking target tools/i915-perf/i915-perf-reader.
[1631/1644] Linking target tools/i915-perf/i915-perf-recorder.
[1632/1644] Linking target tests/core_hotunplug.
[1633/1644] Linking target tests/gem_barrier_race.
[1634/1644] Linking target tests/perf.
[1635/1644] Generating gem_barrier_race.testlist with a meson_exe.py custom command.
[1636/1644] Generating perf.testlist with a meson_exe.py custom command.
[1637/1644] Generating core_hotunplug.testlist with a meson_exe.py custom command.
[1638/1644] Generating xe_tests.rst with a custom command.
[1639/1644] Generating i915_tests.rst with a custom command.
[1640/1644] Generating kms_tests.rst with a custom command.
FAILED: docs/testplan/kms_tests.rst 
/usr/src/igt-gpu-tools/scripts/igt_doc.py --config /usr/src/igt-gpu-tools/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /opt/igt/build
Warning: Missing documentation for igt@kms_simulation_hpd@sim-hpd
Please refer: docs/test_documentation.md for more details
[1641/1644] Generating xe_tests.html with a custom command.
[1642/1644] Generating i915_tests.html with a custom command.
ninja: build stopped: subcommand failed.

