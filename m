Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Erik Kurzinger" <ekurzinger@nvidia.com>
Date: Thu, 07 Sep 2023 11:50:48 -0000
Message-ID: <169408744888.17902.11672397848194490070@emeril.freedesktop.org>
References: <498c41b0-d041-67ad-e7ea-1ebc809974c5@nvidia.com>
In-Reply-To: <498c41b0-d041-67ad-e7ea-1ebc809974c5@nvidia.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBzeW5j?=
 =?utf-8?q?obj=5Ftimeline=3A_don=27t_expect_EINVAL_for_WAIT=5FUNSUBMITTED?=
 =?utf-8?q?=2C_=7C_WAIT=5FAVAILABLE_=28rev2=29?=
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

Series: syncobj_timeline: don't expect EINVAL for WAIT_UNSUBMITTED, | WAIT_AVAILABLE (rev2)
URL   : https://patchwork.freedesktop.org/series/122766/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
9d91cf2c6e7bb64d60c2030d1535e40ca0ad53ee tests/intel-ci/xe.blocklist: Drop hang tests from xe blocklist

Tail of build.log:
[1595/1633] Linking target tools/intel_dp_compliance.
[1596/1633] Linking target tools/intel_reg.
[1597/1633] Linking target tools/amd_hdmi_compliance.
[1598/1633] Linking target runner/igt_comms_decoder.
[1599/1633] Linking target tools/intel_l3_parity.
[1600/1633] Linking target tools/intel_gem_info.
[1601/1633] Linking target runner/igt_runner.
[1602/1633] Linking target tools/msm_dp_compliance.
[1603/1633] Linking target runner/testdata/abort-fixture.
[1604/1633] Linking target tools/xe_reg.
[1605/1633] Linking target runner/testdata/no-subtests.
[1606/1633] Linking target runner/igt_resume.
[1607/1633] Linking target runner/runner_json_test.
[1608/1633] Linking target runner/igt_results.
[1609/1633] Linking target runner/testdata/abort-simple.
[1610/1633] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_mtlgt3.c.o'.
[1611/1633] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
[1612/1633] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt1.c.o'.
[1613/1633] Linking target runner/runner_test.
[1614/1633] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt2.c.o'.
[1615/1633] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt3.c.o'.
[1616/1633] Linking target lib/libi915_perf.so.1.5.
[1617/1633] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.so.1.5.symbols'.
[1618/1633] Linking target tools/i915-perf/i915-perf-configs.
[1619/1633] Linking target tools/i915-perf/i915-perf-reader.
[1620/1633] Linking target tools/i915-perf/i915-perf-recorder.
[1621/1633] Linking target tests/core_hotunplug.
[1622/1633] Linking target tests/gem_barrier_race.
[1623/1633] Linking target tests/perf.
[1624/1633] Generating core_hotunplug.testlist with a meson_exe.py custom command.
[1625/1633] Generating perf.testlist with a meson_exe.py custom command.
[1626/1633] Generating gem_barrier_race.testlist with a meson_exe.py custom command.
[1627/1633] Generating xe_tests.rst with a custom command.
[1628/1633] Generating i915_tests.rst with a custom command.
FAILED: docs/testplan/i915_tests.rst 
/usr/src/igt-gpu-tools/scripts/igt_doc.py --config /usr/src/igt-gpu-tools/tests/intel/i915_test_config.json --rest docs/testplan/i915_tests.rst --check-testlist --igt-build-path /opt/igt/build
Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted
Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted-signaled
Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted-submitted
Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted-submitted-signaled
Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-available-unsubmitted
Warning: Missing documentation for igt@syncobj_timeline@etime-single-wait-all-available-unsubmitted
Warning: Missing documentation for igt@syncobj_timeline@etime-single-wait-available-unsubmitted
Warning: Missing documentation for igt@syncobj_timeline@multi-wait-available-unsubmitted-signaled
Warning: Missing documentation for igt@syncobj_timeline@multi-wait-available-unsubmitted-submitted
Warning: Missing documentation for igt@syncobj_timeline@multi-wait-available-unsubmitted-submitted-signaled
Please refer: docs/test_documentation.md for more details
[1629/1633] Generating kms_tests.rst with a custom command.
[1630/1633] Generating xe_tests.html with a custom command.
ninja: build stopped: subcommand failed.

