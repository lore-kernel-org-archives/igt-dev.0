Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 13 Jul 2023 12:06:39 -0000
Message-ID: <168924999905.14985.12770336769793806713@emeril.freedesktop.org>
References: <20230713075054.970457-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20230713075054.970457-1-mauro.chehab@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBNYWtl?=
 =?utf-8?q?_test=5Flist=2Epy_more_generic_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Make test_list.py more generic (rev2)
URL   : https://patchwork.freedesktop.org/series/120655/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
6f68af5bc4c508fee58b7eb8eae61c7463b521a3 tests/gem_ccs: Avoid writing png twice

Tail of build.log:
[1578/1614] Linking target tools/msm_dp_compliance.
[1579/1614] Linking target runner/testdata/no-subtests.
[1580/1614] Linking target runner/testdata/dynamic.
[1581/1614] Linking target runner/igt_resume.
[1582/1614] Linking target runner/igt_results.
[1583/1614] Linking target runner/testdata/abort-fixture.
[1584/1614] Linking target runner/testdata/skippers.
[1585/1614] Linking target runner/runner_json_test.
[1586/1614] Linking target runner/testdata/abort-simple.
[1587/1614] Linking target runner/testdata/abort-dynamic.
[1588/1614] Linking target runner/igt_runner.
[1589/1614] Linking target runner/igt_comms_decoder.
[1590/1614] Linking target runner/testdata/abort.
[1591/1614] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt1.c.o'.
[1592/1614] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
[1593/1614] Linking target runner/runner_test.
[1594/1614] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt2.c.o'.
[1595/1614] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt3.c.o'.
[1596/1614] Linking target lib/libi915_perf.so.1.5.
[1597/1614] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.so.1.5.symbols'.
[1598/1614] Linking target tools/i915-perf/i915-perf-configs.
[1599/1614] Linking target tools/i915-perf/i915-perf-recorder.
[1600/1614] Linking target tools/i915-perf/i915-perf-reader.
[1601/1614] Linking target tests/gem_barrier_race.
[1602/1614] Linking target tests/core_hotunplug.
[1603/1614] Linking target tests/perf.
[1604/1614] Generating core_hotunplug.testlist with a meson_exe.py custom command.
[1605/1614] Generating gem_barrier_race.testlist with a meson_exe.py custom command.
[1606/1614] Generating perf.testlist with a meson_exe.py custom command.
[1607/1614] Generating xe_tests.rst with a custom command.
FAILED: docs/testplan/xe_tests.rst 
/usr/src/igt-gpu-tools/scripts/igt_doc.py --config /usr/src/igt-gpu-tools/tests/xe/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --built-testlist /opt/igt/build/tests/intel-ci/intel-ci.testlist
Traceback (most recent call last):
  File "/usr/src/igt-gpu-tools/scripts/igt_doc.py", line 67, in <module>
    tests.check_tests()
  File "/usr/src/igt-gpu-tools/scripts/test_list.py", line 966, in check_tests
    with open(self.built_testlist, 'r', encoding='utf8') as handle:
FileNotFoundError: [Errno 2] No such file or directory: '/opt/igt/build/tests/intel-ci/intel-ci.testlist'
[1608/1614] Generating kms_tests.rst with a custom command.
[1609/1614] Generating i915_tests.rst with a custom command.
FAILED: docs/testplan/i915_tests.rst 
/usr/src/igt-gpu-tools/scripts/igt_doc.py --config /usr/src/igt-gpu-tools/tests/i915/i915_test_config.json --rest docs/testplan/i915_tests.rst --check-testlist --built-testlist /opt/igt/build/tests/intel-ci/intel-ci.testlist
Traceback (most recent call last):
  File "/usr/src/igt-gpu-tools/scripts/igt_doc.py", line 67, in <module>
    tests.check_tests()
  File "/usr/src/igt-gpu-tools/scripts/test_list.py", line 966, in check_tests
    with open(self.built_testlist, 'r', encoding='utf8') as handle:
FileNotFoundError: [Errno 2] No such file or directory: '/opt/igt/build/tests/intel-ci/intel-ci.testlist'
[1610/1614] Generating intel-ci.testlist with a meson_exe.py custom command.
ninja: build stopped: subcommand failed.



