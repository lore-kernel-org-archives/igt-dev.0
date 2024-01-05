Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_tests/kms=5Fbw=3A_Use_reduced_blanking_mode_1920x1080p_timi?=
 =?utf-8?q?ngs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rob Clark" <robdclark@gmail.com>
Date: Fri, 05 Jan 2024 21:52:11 -0000
Message-ID: <170449153169.40937.6014705799946068201@5338d5abeb45>
References: <20240105213603.109149-1-robdclark@gmail.com>
In-Reply-To: <20240105213603.109149-1-robdclark@gmail.com>
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

Series: series starting with [1/2] tests/kms_bw: Use reduced blanking mode 1920x1080p timings
URL   : https://patchwork.freedesktop.org/series/128283/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
dcc68cc6c562866584feac3ffadab65dfa9a402b lib/intel_mmio: Allow access to full register space on modern platforms

Tail of build.log:
[1630/1661] Linking target runner/igt_comms_decoder.
[1631/1661] Linking target tools/intel_reg.
[1632/1661] Linking target runner/igt_runner.
[1633/1661] Linking target runner/testdata/abort-simple.
[1634/1661] Linking target runner/runner_json_test.
[1635/1661] Linking target runner/testdata/skippers.
[1636/1661] Linking target runner/testdata/abort.
[1637/1661] Linking target runner/igt_resume.
[1638/1661] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_mtlgt3.c.o'.
[1639/1661] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt1.c.o'.
[1640/1661] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
[1641/1661] Linking target runner/runner_test.
[1642/1661] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt2.c.o'.
[1643/1661] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt3.c.o'.
[1644/1661] Linking target lib/libi915_perf.so.1.5.
[1645/1661] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.so.1.5.symbols'.
[1646/1661] Linking target tools/i915-perf/i915-perf-configs.
[1647/1661] Linking target tools/i915-perf/i915-perf-reader.
[1648/1661] Linking target tools/i915-perf/i915-perf-recorder.
[1649/1661] Linking target tests/gem_barrier_race.
[1650/1661] Linking target tests/core_hotunplug.
[1651/1661] Linking target tests/perf.
[1652/1661] Generating gem_barrier_race.testlist with a meson_exe.py custom command.
[1653/1661] Generating perf.testlist with a meson_exe.py custom command.
[1654/1661] Generating core_hotunplug.testlist with a meson_exe.py custom command.
[1655/1661] Generating xe_tests.rst with a custom command.
[1656/1661] Generating i915_tests.rst with a custom command.
[1657/1661] Generating kms_tests.rst with a custom command.
FAILED: docs/testplan/kms_tests.rst 
/usr/src/igt-gpu-tools/scripts/igt_doc.py --config /usr/src/igt-gpu-tools/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /opt/igt/build
Warning: Missing documentation for igt@kms_bw@linear-tiling-1-displays-2160x1440p
Warning: Missing documentation for igt@kms_bw@linear-tiling-10-displays-2160x1440p
Warning: Missing documentation for igt@kms_bw@linear-tiling-11-displays-2160x1440p
Warning: Missing documentation for igt@kms_bw@linear-tiling-12-displays-2160x1440p
Warning: Missing documentation for igt@kms_bw@linear-tiling-13-displays-2160x1440p
Warning: Missing documentation for igt@kms_bw@linear-tiling-14-displays-2160x1440p
Warning: Missing documentation for igt@kms_bw@linear-tiling-15-displays-2160x1440p
Warning: Missing documentation for igt@kms_bw@linear-tiling-16-displays-2160x1440p
Warning: Missing documentation for igt@kms_bw@linear-tiling-2-displays-2160x1440p
Warning: Missing documentation for igt@kms_bw@linear-tiling-3-displays-2160x1440p
Warning: Missing documentation for igt@kms_bw@linear-tiling-4-displays-2160x1440p
Warning: Missing documentation for igt@kms_bw@linear-tiling-5-displays-2160x1440p
Warning: Missing documentation for igt@kms_bw@linear-tiling-6-displays-2160x1440p
Warning: Missing documentation for igt@kms_bw@linear-tiling-7-displays-2160x1440p
Warning: Missing documentation for igt@kms_bw@linear-tiling-8-displays-2160x1440p
Warning: Missing documentation for igt@kms_bw@linear-tiling-9-displays-2160x1440p
Please refer: docs/test_documentation.md for more details
[1658/1661] Generating xe_tests.html with a custom command.
[1659/1661] Generating i915_tests.html with a custom command.
ninja: build stopped: subcommand failed.

