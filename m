Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Fri, 10 Nov 2023 18:48:08 -0000
Message-ID: <169964208844.31677.12793454863477253684@emeril.freedesktop.org>
References: <20231110163811.24158-1-andrealmeid@igalia.com>
In-Reply-To: <20231110163811.24158-1-andrealmeid@igalia.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBBZGQg?=
 =?utf-8?q?test_for_atomic_async_page_flip?=
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

Series: Add test for atomic async page flip
URL   : https://patchwork.freedesktop.org/series/126282/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
453b9df12fbc9fff561bdb4eb97992983e74c3d4 tests/intel/xe_exec_queue_property: Add scheduler exec queue set property

Tail of build.log:
[1613/1657] Linking target tools/intel_gem_info.
[1614/1657] Linking target tools/intel_vbt_decode.
[1615/1657] Linking target tools/intel_watermark.
[1616/1657] Linking target tools/intel_residency.
[1617/1657] Generating gem_stress.testlist with a meson_exe.py custom command.
[1618/1657] Linking target runner/igt_runner.
[1619/1657] Linking target tools/amd_hdmi_compliance.
[1620/1657] Linking target tools/msm_dp_compliance.
[1621/1657] Linking target runner/testdata/skippers.
[1622/1657] Linking target tools/intel_dp_compliance.
[1623/1657] Linking target runner/testdata/abort-simple.
[1624/1657] Linking target runner/runner_json_test.
[1625/1657] Linking target tools/lsgpu.
[1626/1657] Linking target runner/igt_comms_decoder.
[1627/1657] Linking target runner/testdata/successtest.
[1628/1657] Linking target runner/testdata/abort.
[1629/1657] Linking target runner/testdata/abort-fixture.
[1630/1657] Linking target runner/testdata/abort-dynamic.
[1631/1657] Linking target runner/testdata/dynamic.
[1632/1657] Linking target runner/igt_results.
[1633/1657] Linking target runner/igt_resume.
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
[1648/1657] Generating core_hotunplug.testlist with a meson_exe.py custom command.
[1649/1657] Generating perf.testlist with a meson_exe.py custom command.
[1650/1657] Generating gem_barrier_race.testlist with a meson_exe.py custom command.
[1651/1657] Generating xe_tests.rst with a custom command.
[1652/1657] Generating i915_tests.rst with a custom command.
[1653/1657] Generating kms_tests.rst with a custom command.
FAILED: docs/testplan/kms_tests.rst 
/usr/src/igt-gpu-tools/scripts/igt_doc.py --config /usr/src/igt-gpu-tools/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /opt/igt/build
Warning: Missing documentation for igt@kms_async_flips@atomic-async-flip
Warning: Missing documentation for igt@kms_async_flips@invalid-atomic-async-flip
Warning: Missing documentation for igt@kms_async_flips@modeset-atomic-async-flip
Please refer: docs/test_documentation.md for more details
[1654/1657] Generating xe_tests.html with a custom command.
[1655/1657] Generating i915_tests.html with a custom command.
ninja: build stopped: subcommand failed.

