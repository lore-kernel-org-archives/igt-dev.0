Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Melanie Lobo" <melanie.lobo@intel.corp-partner.google.com>
Date: Wed, 11 Oct 2023 20:11:31 -0000
Message-ID: <169705509119.26515.8156857884961870346@emeril.freedesktop.org>
References: <20231010131124.14541-1-melanie.lobo@intel.corp-partner.google.com>
In-Reply-To: <20231010131124.14541-1-melanie.lobo@intel.corp-partner.google.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciA6IHRl?=
 =?utf-8?q?sts/intel/kms=5Fflip=5Fscaled=5Fcrc=3A_Add_support_for_FP16_for?=
 =?utf-8?q?mat_of_MTL_compressed_modifier?=
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

Series: : tests/intel/kms_flip_scaled_crc: Add support for FP16 format of MTL compressed modifier
URL   : https://patchwork.freedesktop.org/series/124973/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
bf24b157b1049afc086fe65a60b22bd6bb3e18b7 tests/intel/gem_eio: Skip stress test on BCS0 for MTL

Tail of build.log:
[1602/1647] Linking target tools/amd_hdmi_compliance.
[1603/1647] Linking target tools/intel_dp_compliance.
[1604/1647] Linking target runner/testdata/skippers.
[1605/1647] Linking target tools/intel_gem_info.
[1606/1647] Generating gem_stress.testlist with a meson_exe.py custom command.
[1607/1647] Linking target tools/xe_reg.
[1608/1647] Linking target tools/intel_l3_parity.
[1609/1647] Linking target tools/lsgpu.
[1610/1647] Linking target runner/igt_results.
[1611/1647] Linking target runner/testdata/no-subtests.
[1612/1647] Linking target tools/msm_dp_compliance.
[1613/1647] Linking target runner/igt_resume.
[1614/1647] Linking target runner/testdata/abort.
[1615/1647] Linking target runner/testdata/dynamic.
[1616/1647] Linking target runner/testdata/abort-simple.
[1617/1647] Linking target runner/testdata/abort-fixture.
[1618/1647] Linking target runner/igt_runner.
[1619/1647] Linking target tools/intel_reg.
[1620/1647] Linking target runner/testdata/successtest.
[1621/1647] Linking target runner/igt_comms_decoder.
[1622/1647] Linking target runner/testdata/abort-dynamic.
[1623/1647] Linking target runner/runner_json_test.
[1624/1647] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_mtlgt3.c.o'.
[1625/1647] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt1.c.o'.
[1626/1647] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
[1627/1647] Linking target runner/runner_test.
[1628/1647] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt2.c.o'.
[1629/1647] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt3.c.o'.
[1630/1647] Linking target lib/libi915_perf.so.1.5.
[1631/1647] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.so.1.5.symbols'.
[1632/1647] Linking target tools/i915-perf/i915-perf-configs.
[1633/1647] Linking target tools/i915-perf/i915-perf-reader.
[1634/1647] Linking target tools/i915-perf/i915-perf-recorder.
[1635/1647] Linking target tests/perf.
[1636/1647] Linking target tests/gem_barrier_race.
[1637/1647] Linking target tests/core_hotunplug.
[1638/1647] Generating perf.testlist with a meson_exe.py custom command.
[1639/1647] Generating core_hotunplug.testlist with a meson_exe.py custom command.
[1640/1647] Generating gem_barrier_race.testlist with a meson_exe.py custom command.
[1641/1647] Generating xe_tests.rst with a custom command.
[1642/1647] Generating i915_tests.rst with a custom command.
[1643/1647] Generating kms_tests.rst with a custom command.
FAILED: docs/testplan/kms_tests.rst 
/usr/src/igt-gpu-tools/scripts/igt_doc.py --config /usr/src/igt-gpu-tools/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /opt/igt/build
Warning: Missing documentation for igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tilemtlrcccs-downscaling
Warning: Missing documentation for igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tilemtlrcccs-upscaling
Please refer: docs/test_documentation.md for more details
[1644/1647] Generating xe_tests.html with a custom command.
[1645/1647] Generating i915_tests.html with a custom command.
ninja: build stopped: subcommand failed.

