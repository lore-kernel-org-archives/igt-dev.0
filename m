Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Wed, 25 Oct 2023 16:44:23 -0000
Message-ID: <169825226302.20487.10580023049622973006@emeril.freedesktop.org>
References: <20231025120256.27326-1-nidhi1.gupta@intel.com>
In-Reply-To: <20231025120256.27326-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?s/kms=5Ffrontbuffer=5Ftracking=3A_Extend_the_test_to_enable_FBC?=
 =?utf-8?q?_for_each_plane_=28rev4=29?=
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

Series: tests/kms_frontbuffer_tracking: Extend the test to enable FBC for each plane (rev4)
URL   : https://patchwork.freedesktop.org/series/123724/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
18fc864d68d382847596594d7eb3488f2c8fb45e tests/kms_flip: disable DRRS if eDP support variable refresh rate

Tail of build.log:
[1602/1645] Linking target tools/amd_hdmi_compliance.
[1603/1645] Linking target tools/intel_l3_parity.
[1604/1645] Linking target tools/intel_gem_info.
[1605/1645] Linking target tools/lsgpu.
[1606/1645] Linking target tools/intel_dp_compliance.
[1607/1645] Linking target runner/igt_comms_decoder.
[1608/1645] Linking target tools/msm_dp_compliance.
[1609/1645] Linking target tools/intel_reg.
[1610/1645] Generating gem_stress.testlist with a meson_exe.py custom command.
[1611/1645] Linking target runner/igt_results.
[1612/1645] Linking target runner/testdata/abort-fixture.
[1613/1645] Linking target runner/testdata/no-subtests.
[1614/1645] Linking target runner/testdata/abort-simple.
[1615/1645] Linking target runner/testdata/successtest.
[1616/1645] Linking target runner/testdata/skippers.
[1617/1645] Linking target runner/testdata/abort-dynamic.
[1618/1645] Linking target runner/igt_runner.
[1619/1645] Linking target runner/testdata/abort.
[1620/1645] Linking target runner/runner_json_test.
[1621/1645] Linking target runner/igt_resume.
[1622/1645] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_mtlgt3.c.o'.
[1623/1645] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt1.c.o'.
[1624/1645] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
[1625/1645] Linking target runner/runner_test.
[1626/1645] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt2.c.o'.
[1627/1645] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt3.c.o'.
[1628/1645] Linking target lib/libi915_perf.so.1.5.
[1629/1645] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.so.1.5.symbols'.
[1630/1645] Linking target tools/i915-perf/i915-perf-configs.
[1631/1645] Linking target tools/i915-perf/i915-perf-reader.
[1632/1645] Linking target tools/i915-perf/i915-perf-recorder.
[1633/1645] Linking target tests/perf.
[1634/1645] Linking target tests/gem_barrier_race.
[1635/1645] Linking target tests/core_hotunplug.
[1636/1645] Generating perf.testlist with a meson_exe.py custom command.
[1637/1645] Generating core_hotunplug.testlist with a meson_exe.py custom command.
[1638/1645] Generating gem_barrier_race.testlist with a meson_exe.py custom command.
[1639/1645] Generating xe_tests.rst with a custom command.
[1640/1645] Generating i915_tests.rst with a custom command.
[1641/1645] Generating kms_tests.rst with a custom command.
FAILED: docs/testplan/kms_tests.rst 
/usr/src/igt-gpu-tools/scripts/igt_doc.py --config /usr/src/igt-gpu-tools/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /opt/igt/build
Warning: Documented igt@kms_frontbuffer_tracking@plane-0-fbc-rte doesn't exist on source files
Warning: Documented igt@kms_frontbuffer_tracking@plane-1-fbc-rte doesn't exist on source files
Warning: Documented igt@kms_frontbuffer_tracking@plane-2-fbc-rte doesn't exist on source files
Warning: Missing documentation for igt@kms_frontbuffer_tracking@plane-fbc-rte
Please refer: docs/test_documentation.md for more details
[1642/1645] Generating xe_tests.html with a custom command.
[1643/1645] Generating i915_tests.html with a custom command.
ninja: build stopped: subcommand failed.

