Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Mon, 13 Nov 2023 06:27:55 -0000
Message-ID: <169985687500.24215.13346028163173484687@emeril.freedesktop.org>
References: <20231113052304.1092040-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20231113052304.1092040-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?s/syncobj=5Ftimeline=3A_Fix_testplan_documentation_=28rev2=29?=
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

Series: tests/syncobj_timeline: Fix testplan documentation (rev2)
URL   : https://patchwork.freedesktop.org/series/126315/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
453b9df12fbc9fff561bdb4eb97992983e74c3d4 tests/intel/xe_exec_queue_property: Add scheduler exec queue set property

Tail of build.log:
[1629/1657] Linking target runner/testdata/no-subtests.
[1630/1657] Linking target runner/testdata/abort-fixture.
[1631/1657] Linking target tools/msm_dp_compliance.
[1632/1657] Linking target runner/testdata/abort-simple.
[1633/1657] Linking target runner/igt_results.
[1634/1657] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_mtlgt3.c.o'.
[1635/1657] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt1.c.o'.
[1636/1657] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
[1637/1657] Linking target runner/runner_test.
[1638/1657] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt2.c.o'.
[1639/1657] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt3.c.o'.
[1640/1657] Linking target lib/libi915_perf.so.1.5.
[1641/1657] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.so.1.5.symbols'.
[1642/1657] Linking target tools/i915-perf/i915-perf-configs.
[1643/1657] Linking target tools/i915-perf/i915-perf-reader.
[1644/1657] Linking target tools/i915-perf/i915-perf-recorder.
[1645/1657] Linking target tests/core_hotunplug.
[1646/1657] Linking target tests/gem_barrier_race.
[1647/1657] Linking target tests/perf.
[1648/1657] Generating perf.testlist with a meson_exe.py custom command.
[1649/1657] Generating core_hotunplug.testlist with a meson_exe.py custom command.
[1650/1657] Generating gem_barrier_race.testlist with a meson_exe.py custom command.
[1651/1657] Generating xe_tests.rst with a custom command.
[1652/1657] Generating i915_tests.rst with a custom command.
FAILED: docs/testplan/i915_tests.rst 
/usr/src/igt-gpu-tools/scripts/igt_doc.py --config /usr/src/igt-gpu-tools/tests/intel/i915_test_config.json --rest docs/testplan/i915_tests.rst --check-testlist --igt-build-path /opt/igt/build
Warning: Documented igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted doesn't exist on source files
Warning: Documented igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted-signaled doesn't exist on source files
Warning: Documented igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted-submitted doesn't exist on source files
Warning: Documented igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted-submitted-signaled doesn't exist on source files
Warning: Documented igt@syncobj_timeline@etime-multi-wait-available-unsubmitted doesn't exist on source files
Warning: Documented igt@syncobj_timeline@etime-single-wait-all-available-unsubmitted doesn't exist on source files
Warning: Documented igt@syncobj_timeline@etime-single-wait-available-unsubmitted doesn't exist on source files
Warning: Documented igt@syncobj_timeline@multi-wait-available-unsubmitted-signaled doesn't exist on source files
Warning: Documented igt@syncobj_timeline@multi-wait-available-unsubmitted-submitted doesn't exist on source files
Warning: Documented igt@syncobj_timeline@multi-wait-available-unsubmitted-submitted-signaled doesn't exist on source files
Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted
Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-signaled
Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-submitted
Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-submitted-signaled
Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted
Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-signaled
Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted
Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted-signaled
Warning: Missing documentation for igt@syncobj_timeline@invalid-single-wait-all-available-unsubmitted
Warning: Missing documentation for igt@syncobj_timeline@invalid-single-wait-available-unsubmitted
Please refer: docs/test_documentation.md for more details
[1653/1657] Generating kms_tests.rst with a custom command.
[1654/1657] Generating xe_tests.html with a custom command.
ninja: build stopped: subcommand failed.

