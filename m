Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_tests/intel=3A_Sync_headers_to_grab_DUMPABLE_changes=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Date: Fri, 12 Jan 2024 13:39:49 -0000
Message-ID: <170506678965.338258.4668836467589239685@5338d5abeb45>
References: <20240112124043.166886-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240112124043.166886-1-maarten.lankhorst@linux.intel.com>
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

Series: series starting with [1/2] tests/intel: Sync headers to grab DUMPABLE changes.
URL   : https://patchwork.freedesktop.org/series/128716/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
16d7484a28cc1aaf2dfb9e9c73c011daf602d926 tests/intel/xe_exec_store: don't pass gt_id as bind queue

Tail of build.log:
[1615/1664] Linking target tools/intel_panel_fitter.
[1616/1664] Linking target tools/intel_stepping.
[1617/1664] Linking target tools/intel_gem_info.
[1618/1664] Linking target tools/intel_firmware_decode.
[1619/1664] Linking target tools/intel_pm_rpm.
[1620/1664] Linking target tools/intel_watermark.
[1621/1664] Linking target tools/intel_gvtg_test.
[1622/1664] Linking target runner/testdata/abort-simple.
[1623/1664] Linking target tools/amd_hdmi_compliance.
[1624/1664] Generating gem_stress.testlist with a meson_exe.py custom command.
[1625/1664] Linking target runner/igt_comms_decoder.
[1626/1664] Linking target tools/msm_dp_compliance.
[1627/1664] Linking target tools/intel_l3_parity.
[1628/1664] Linking target runner/testdata/no-subtests.
[1629/1664] Linking target runner/testdata/abort.
[1630/1664] Linking target runner/testdata/skippers.
[1631/1664] Linking target tools/intel_reg.
[1632/1664] Linking target runner/testdata/abort-dynamic.
[1633/1664] Linking target runner/runner_json_test.
[1634/1664] Linking target runner/testdata/successtest.
[1635/1664] Linking target tools/lsgpu.
[1636/1664] Linking target runner/testdata/dynamic.
[1637/1664] Linking target runner/igt_runner.
[1638/1664] Linking target runner/igt_resume.
[1639/1664] Linking target runner/testdata/abort-fixture.
[1640/1664] Linking target runner/igt_results.
[1641/1664] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_mtlgt3.c.o'.
[1642/1664] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt1.c.o'.
[1643/1664] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
[1644/1664] Linking target runner/runner_test.
[1645/1664] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt2.c.o'.
[1646/1664] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt3.c.o'.
[1647/1664] Linking target lib/libi915_perf.so.1.5.
[1648/1664] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.so.1.5.symbols'.
[1649/1664] Linking target tools/i915-perf/i915-perf-configs.
[1650/1664] Linking target tools/i915-perf/i915-perf-reader.
[1651/1664] Linking target tools/i915-perf/i915-perf-recorder.
[1652/1664] Linking target tests/gem_barrier_race.
[1653/1664] Linking target tests/core_hotunplug.
[1654/1664] Linking target tests/perf.
[1655/1664] Generating perf.testlist with a meson_exe.py custom command.
[1656/1664] Generating gem_barrier_race.testlist with a meson_exe.py custom command.
[1657/1664] Generating core_hotunplug.testlist with a meson_exe.py custom command.
[1658/1664] Generating xe_tests.rst with a custom command.
FAILED: docs/testplan/xe_tests.rst 
/usr/src/igt-gpu-tools/scripts/igt_doc.py --config /usr/src/igt-gpu-tools/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /opt/igt/build
/usr/src/igt-gpu-tools/tests/intel/xe_coredump.c:subtest igt@xe_coredump@%s needs 1 arguments but only 0 are defined.
[1659/1664] Generating i915_tests.rst with a custom command.
[1660/1664] Generating kms_tests.rst with a custom command.
ninja: build stopped: subcommand failed.

