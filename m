Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sean Paul" <sean@poorly.run>
Date: Tue, 24 Oct 2023 07:42:54 -0000
Message-ID: <169813337454.18360.1284457506396047122@emeril.freedesktop.org>
References: <20231023205910.3556533-1-sean@poorly.run>
In-Reply-To: <20231023205910.3556533-1-sean@poorly.run>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?s/kms=5Fvrr=3A_Modify_kms=5Fvrr_to_allow_flicker_profiling?=
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

Series: tests/kms_vrr: Modify kms_vrr to allow flicker profiling
URL   : https://patchwork.freedesktop.org/series/125479/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
557856802dfee103802f1157f97c65bb476d5468 lib/igt_kmod: Remove wrong note regarding dependencies

Tail of build.log:
[1599/1645] Linking target tools/intel_infoframes.
[1600/1645] Linking target tools/intel_reg.
[1601/1645] Linking target tools/intel_dp_compliance.
[1602/1645] Linking target tools/intel_residency.
[1603/1645] Linking target tools/intel_gvtg_test.
[1604/1645] Linking target runner/testdata/successtest.
[1605/1645] Linking target runner/testdata/no-subtests.
[1606/1645] Linking target runner/testdata/abort-dynamic.
[1607/1645] Linking target tools/msm_dp_compliance.
[1608/1645] Linking target tools/amd_hdmi_compliance.
[1609/1645] Linking target runner/testdata/abort-fixture.
[1610/1645] Generating gem_stress.testlist with a meson_exe.py custom command.
[1611/1645] Linking target tools/lsgpu.
[1612/1645] Linking target runner/testdata/dynamic.
[1613/1645] Linking target tools/intel_l3_parity.
[1614/1645] Linking target runner/testdata/abort-simple.
[1615/1645] Linking target runner/igt_runner.
[1616/1645] Linking target runner/igt_comms_decoder.
[1617/1645] Linking target runner/testdata/skippers.
[1618/1645] Linking target runner/testdata/abort.
[1619/1645] Linking target runner/runner_json_test.
[1620/1645] Linking target runner/igt_resume.
[1621/1645] Linking target runner/igt_results.
[1622/1645] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_mtlgt3.c.o'.
[1623/1645] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt1.c.o'.
[1624/1645] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
[1625/1645] Linking target runner/runner_test.
[1626/1645] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt2.c.o'.
[1627/1645] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt3.c.o'.
[1628/1645] Linking target lib/libi915_perf.so.1.5.
[1629/1645] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.so.1.5.symbols'.
[1630/1645] Linking target tools/i915-perf/i915-perf-configs.
[1631/1645] Linking target tools/i915-perf/i915-perf-recorder.
[1632/1645] Linking target tools/i915-perf/i915-perf-reader.
[1633/1645] Linking target tests/core_hotunplug.
[1634/1645] Linking target tests/gem_barrier_race.
[1635/1645] Linking target tests/perf.
[1636/1645] Generating gem_barrier_race.testlist with a meson_exe.py custom command.
[1637/1645] Generating perf.testlist with a meson_exe.py custom command.
[1638/1645] Generating core_hotunplug.testlist with a meson_exe.py custom command.
[1639/1645] Generating xe_tests.rst with a custom command.
[1640/1645] Generating i915_tests.rst with a custom command.
[1641/1645] Generating kms_tests.rst with a custom command.
FAILED: docs/testplan/kms_tests.rst 
/usr/src/igt-gpu-tools/scripts/igt_doc.py --config /usr/src/igt-gpu-tools/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /opt/igt/build
Warning: Missing documentation for igt@kms_vrr@max-min
Please refer: docs/test_documentation.md for more details
[1642/1645] Generating xe_tests.html with a custom command.
[1643/1645] Generating i915_tests.html with a custom command.
ninja: build stopped: subcommand failed.

