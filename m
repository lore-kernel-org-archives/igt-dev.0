Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: sai.gowtham.ch@intel.com
Date: Fri, 10 Nov 2023 11:43:58 -0000
Message-ID: <169961663886.31676.12180969493336812191@emeril.freedesktop.org>
References: <20231110110759.11719-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20231110110759.11719-1-sai.gowtham.ch@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?s/intel/xe=5Fexec=5Fqueue=5Fproperty=3A_Negative_tests_for_get_?=
 =?utf-8?q?exec=5Fqueue_property_ioctl=2E?=
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

Series: tests/intel/xe_exec_queue_property: Negative tests for get exec_queue property ioctl.
URL   : https://patchwork.freedesktop.org/series/126266/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
453b9df12fbc9fff561bdb4eb97992983e74c3d4 tests/intel/xe_exec_queue_property: Add scheduler exec queue set property

Tail of build.log:
[1610/1657] Linking target tools/intel_gvtg_test.
[1611/1657] Linking target tools/intel_dp_compliance.
[1612/1657] Linking target tools/intel_residency.
[1613/1657] Linking target runner/testdata/skippers.
[1614/1657] Linking target runner/testdata/successtest.
[1615/1657] Linking target tools/intel_reg_checker.
[1616/1657] Linking target tools/amd_hdmi_compliance.
[1617/1657] Linking target tools/intel_watermark.
[1618/1657] Linking target runner/testdata/abort-simple.
[1619/1657] Linking target runner/igt_runner.
[1620/1657] Linking target tools/intel_vbt_decode.
[1621/1657] Linking target runner/testdata/dynamic.
[1622/1657] Linking target tools/intel_reg.
[1623/1657] Linking target runner/igt_results.
[1624/1657] Linking target runner/testdata/abort-fixture.
[1625/1657] Linking target runner/testdata/abort.
[1626/1657] Linking target tools/lsgpu.
[1627/1657] Generating gem_stress.testlist with a meson_exe.py custom command.
[1628/1657] Linking target runner/testdata/no-subtests.
[1629/1657] Linking target runner/runner_json_test.
[1630/1657] Linking target runner/igt_comms_decoder.
[1631/1657] Linking target tools/intel_l3_parity.
[1632/1657] Linking target tools/msm_dp_compliance.
[1633/1657] Linking target runner/igt_resume.
[1634/1657] Linking target runner/testdata/abort-dynamic.
[1635/1657] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt1.c.o'.
[1636/1657] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
[1637/1657] Linking target runner/runner_test.
[1638/1657] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt2.c.o'.
[1639/1657] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt3.c.o'.
[1640/1657] Linking target lib/libi915_perf.so.1.5.
[1641/1657] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.so.1.5.symbols'.
[1642/1657] Linking target tools/i915-perf/i915-perf-configs.
[1643/1657] Linking target tools/i915-perf/i915-perf-recorder.
[1644/1657] Linking target tools/i915-perf/i915-perf-reader.
[1645/1657] Linking target tests/gem_barrier_race.
[1646/1657] Linking target tests/perf.
[1647/1657] Linking target tests/core_hotunplug.
[1648/1657] Generating gem_barrier_race.testlist with a meson_exe.py custom command.
[1649/1657] Generating core_hotunplug.testlist with a meson_exe.py custom command.
[1650/1657] Generating perf.testlist with a meson_exe.py custom command.
[1651/1657] Generating xe_tests.rst with a custom command.
FAILED: docs/testplan/xe_tests.rst 
/usr/src/igt-gpu-tools/scripts/igt_doc.py --config /usr/src/igt-gpu-tools/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /opt/igt/build
Warning: Documented igt@xe_exec_queue_property@Invalid_exec_queue doesn't exist on source files
Warning: Missing documentation for igt@xe_exec_queue_property@Invalid-exec-queue
Please refer: docs/test_documentation.md for more details
[1652/1657] Generating i915_tests.rst with a custom command.
[1653/1657] Generating kms_tests.rst with a custom command.
ninja: build stopped: subcommand failed.

