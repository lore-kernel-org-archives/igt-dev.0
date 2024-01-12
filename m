Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/syncobj=5Ftimeline?=
 =?utf-8?q?=3A_test_delayed_submission_with=2C_WAIT=5FAVAILABLE?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Erik Kurzinger" <ekurzinger@nvidia.com>
Date: Fri, 12 Jan 2024 22:22:02 -0000
Message-ID: <170509812235.338258.17627847365696942386@5338d5abeb45>
References: <58b60f0a-f28b-42b5-b94b-91c8a5db8465@nvidia.com>
In-Reply-To: <58b60f0a-f28b-42b5-b94b-91c8a5db8465@nvidia.com>
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

Series: tests/syncobj_timeline: test delayed submission with, WAIT_AVAILABLE
URL   : https://patchwork.freedesktop.org/series/128742/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
af432b481fb6a21e53e15d67784a317947f7ec96 tests/intel/xe_ccs: fix block-multicopy-inplace subtest

Tail of build.log:
[1615/1661] Linking target tools/intel_pm_rpm.
[1616/1661] Linking target runner/testdata/abort.
[1617/1661] Linking target tools/intel_dp_compliance.
[1618/1661] Linking target tools/intel_panel_fitter.
[1619/1661] Linking target runner/testdata/dynamic.
[1620/1661] Linking target tools/lsgpu.
[1621/1661] Linking target runner/testdata/no-subtests.
[1622/1661] Linking target tools/intel_watermark.
[1623/1661] Linking target runner/testdata/skippers.
[1624/1661] Linking target tools/msm_dp_compliance.
[1625/1661] Linking target runner/igt_comms_decoder.
[1626/1661] Linking target runner/testdata/abort-fixture.
[1627/1661] Linking target runner/testdata/abort-simple.
[1628/1661] Linking target runner/igt_runner.
[1629/1661] Linking target tools/intel_gem_info.
[1630/1661] Generating gem_stress.testlist with a meson_exe.py custom command.
[1631/1661] Linking target tools/amd_hdmi_compliance.
[1632/1661] Linking target tools/intel_residency.
[1633/1661] Linking target runner/testdata/successtest.
[1634/1661] Linking target runner/igt_resume.
[1635/1661] Linking target runner/igt_results.
[1636/1661] Linking target runner/testdata/abort-dynamic.
[1637/1661] Linking target tools/intel_reg.
[1638/1661] Linking target runner/runner_json_test.
[1639/1661] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt1.c.o'.
[1640/1661] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
[1641/1661] Linking target runner/runner_test.
[1642/1661] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt2.c.o'.
[1643/1661] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt3.c.o'.
[1644/1661] Linking target lib/libi915_perf.so.1.5.
[1645/1661] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.so.1.5.symbols'.
[1646/1661] Linking target tools/i915-perf/i915-perf-configs.
[1647/1661] Linking target tools/i915-perf/i915-perf-recorder.
[1648/1661] Linking target tools/i915-perf/i915-perf-reader.
[1649/1661] Linking target tests/core_hotunplug.
[1650/1661] Linking target tests/gem_barrier_race.
[1651/1661] Linking target tests/perf.
[1652/1661] Generating core_hotunplug.testlist with a meson_exe.py custom command.
[1653/1661] Generating perf.testlist with a meson_exe.py custom command.
[1654/1661] Generating gem_barrier_race.testlist with a meson_exe.py custom command.
[1655/1661] Generating xe_tests.rst with a custom command.
[1656/1661] Generating i915_tests.rst with a custom command.
FAILED: docs/testplan/i915_tests.rst 
/usr/src/igt-gpu-tools/scripts/igt_doc.py --config /usr/src/igt-gpu-tools/tests/intel/i915_test_config.json --rest docs/testplan/i915_tests.rst --check-testlist --igt-build-path /opt/igt/build
Warning: Missing documentation for igt@syncobj_timeline@wait-all-available-delayed-submit
Warning: Missing documentation for igt@syncobj_timeline@wait-available-delayed-submit
Please refer: docs/test_documentation.md for more details
[1657/1661] Generating kms_tests.rst with a custom command.
[1658/1661] Generating xe_tests.html with a custom command.
ninja: build stopped: subcommand failed.

