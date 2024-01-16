Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/kms=5Fcontent=5Fpro?=
 =?utf-8?q?tection=3A_Add_LIC_Type_1_scenario_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Date: Tue, 16 Jan 2024 11:43:47 -0000
Message-ID: <170540542750.501308.473008632739689426@5338d5abeb45>
References: <20240112103330.169688-1-suraj.kandpal@intel.com>
In-Reply-To: <20240112103330.169688-1-suraj.kandpal@intel.com>
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

Series: tests/kms_content_protection: Add LIC Type 1 scenario (rev2)
URL   : https://patchwork.freedesktop.org/series/128714/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
8b379441eaf5f5adc0192a651e7ff34fa27f5eb4 build: Build xe tests by default

Tail of build.log:
[1619/1661] Linking target tools/intel_gem_info.
[1620/1661] Linking target tools/lsgpu.
[1621/1661] Linking target tools/intel_dp_compliance.
[1622/1661] Linking target tools/msm_dp_compliance.
[1623/1661] Linking target tools/amd_hdmi_compliance.
[1624/1661] Generating gem_stress.testlist with a meson_exe.py custom command.
[1625/1661] Linking target runner/testdata/no-subtests.
[1626/1661] Linking target runner/igt_comms_decoder.
[1627/1661] Linking target runner/igt_resume.
[1628/1661] Linking target runner/testdata/abort.
[1629/1661] Linking target runner/igt_runner.
[1630/1661] Linking target runner/testdata/abort-simple.
[1631/1661] Linking target runner/testdata/skippers.
[1632/1661] Linking target runner/testdata/successtest.
[1633/1661] Linking target runner/runner_json_test.
[1634/1661] Linking target runner/testdata/dynamic.
[1635/1661] Linking target runner/igt_results.
[1636/1661] Linking target runner/testdata/abort-dynamic.
[1637/1661] Linking target runner/testdata/abort-fixture.
[1638/1661] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_mtlgt3.c.o'.
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
[1653/1661] Generating gem_barrier_race.testlist with a meson_exe.py custom command.
[1654/1661] Generating perf.testlist with a meson_exe.py custom command.
[1655/1661] Generating xe_tests.rst with a custom command.
[1656/1661] Generating i915_tests.rst with a custom command.
[1657/1661] Generating kms_tests.rst with a custom command.
FAILED: docs/testplan/kms_tests.rst 
/usr/src/igt-gpu-tools/scripts/igt_doc.py --config /usr/src/igt-gpu-tools/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /opt/igt/build
Warning: Documented igt@kms_content_protection@lic-atomic doesn't exist on source files
Warning: Documented igt@kms_content_protection@lic-atomic-dpms doesn't exist on source files
Warning: Documented igt@kms_content_protection@lic-legacy doesn't exist on source files
Warning: Documented igt@kms_content_protection@lic-type1 doesn't exist on source files
Warning: Documented igt@kms_content_protection@type-0 doesn't exist on source files
Warning: Documented igt@kms_content_protection@type-1 doesn't exist on source files
[1658/1661] Generating xe_tests.html with a custom command.
[1659/1661] Generating i915_tests.html with a custom command.
ninja: build stopped: subcommand failed.

