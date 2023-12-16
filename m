Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Add_tests_for_solid_fill_?=
 =?utf-8?q?planes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jessica Zhang" <quic_jesszhan@quicinc.com>
Date: Sat, 16 Dec 2023 00:49:22 -0000
Message-ID: <170268776264.3476.7273696966043459064@emeril.freedesktop.org>
References: <20231215-solid-fill-v1-0-12932f9f452d@quicinc.com>
In-Reply-To: <20231215-solid-fill-v1-0-12932f9f452d@quicinc.com>
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

Series: Add tests for solid fill planes
URL   : https://patchwork.freedesktop.org/series/127900/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
2a2b716161007f885855d6dfcb90b526183e624e tests/intel/xe: Remove xe_uevent for now

Tail of build.log:
[1611/1656] Linking target tools/intel_stepping.
[1612/1656] Linking target runner/testdata/abort.
[1613/1656] Linking target tools/intel_watermark.
[1614/1656] Linking target tools/intel_dp_compliance.
[1615/1656] Linking target runner/testdata/successtest.
[1616/1656] Linking target runner/testdata/dynamic.
[1617/1656] Linking target runner/testdata/no-subtests.
[1618/1656] Linking target tools/intel_vbt_decode.
[1619/1656] Linking target runner/testdata/abort-dynamic.
[1620/1656] Linking target tools/intel_gem_info.
[1621/1656] Linking target runner/igt_runner.
[1622/1656] Linking target tools/amd_hdmi_compliance.
[1623/1656] Generating gem_stress.testlist with a meson_exe.py custom command.
[1624/1656] Linking target runner/igt_comms_decoder.
[1625/1656] Linking target tools/intel_l3_parity.
[1626/1656] Linking target tools/msm_dp_compliance.
[1627/1656] Linking target runner/igt_results.
[1628/1656] Linking target tools/intel_reg.
[1629/1656] Linking target runner/igt_resume.
[1630/1656] Linking target runner/testdata/abort-simple.
[1631/1656] Linking target runner/testdata/abort-fixture.
[1632/1656] Linking target runner/runner_json_test.
[1633/1656] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_mtlgt3.c.o'.
[1634/1656] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt1.c.o'.
[1635/1656] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
[1636/1656] Linking target runner/runner_test.
[1637/1656] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt2.c.o'.
[1638/1656] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt3.c.o'.
[1639/1656] Linking target lib/libi915_perf.so.1.5.
[1640/1656] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.so.1.5.symbols'.
[1641/1656] Linking target tools/i915-perf/i915-perf-configs.
[1642/1656] Linking target tools/i915-perf/i915-perf-reader.
[1643/1656] Linking target tools/i915-perf/i915-perf-recorder.
[1644/1656] Linking target tests/gem_barrier_race.
[1645/1656] Linking target tests/core_hotunplug.
[1646/1656] Linking target tests/perf.
[1647/1656] Generating perf.testlist with a meson_exe.py custom command.
[1648/1656] Generating core_hotunplug.testlist with a meson_exe.py custom command.
[1649/1656] Generating gem_barrier_race.testlist with a meson_exe.py custom command.
[1650/1656] Generating xe_tests.rst with a custom command.
[1651/1656] Generating i915_tests.rst with a custom command.
[1652/1656] Generating kms_tests.rst with a custom command.
FAILED: docs/testplan/kms_tests.rst 
/usr/src/igt-gpu-tools/scripts/igt_doc.py --config /usr/src/igt-gpu-tools/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /opt/igt/build
Warning: Missing documentation for igt@kms_atomic@plane-cursor-solid-fill
Warning: Missing documentation for igt@kms_atomic@plane-primary-solid-fill
Please refer: docs/test_documentation.md for more details
[1653/1656] Generating xe_tests.html with a custom command.
[1654/1656] Generating i915_tests.html with a custom command.
ninja: build stopped: subcommand failed.

