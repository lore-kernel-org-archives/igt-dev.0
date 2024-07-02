Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 702F0C3064D
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 11:45:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3446310E5D0;
	Tue,  2 Jul 2024 11:45:07 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2B910E5D0;
 Tue,  2 Jul 2024 11:45:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_series_starting_with_=5Bi?=
 =?utf-8?q?-g-t=2C1/2=5D_tests/intel/xe=5Fpm=3A_Install_fw_close_exit_handle?=
 =?utf-8?q?r_before_rpm_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 02 Jul 2024 11:45:06 -0000
Message-ID: <171992070650.21226.14719205929949228066@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240701145439.91038-1-badal.nilawar@intel.com>
In-Reply-To: <20240701145439.91038-1-badal.nilawar@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
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

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/intel/xe_pm: Install fw close exit handler before rpm tests
URL   : https://patchwork.freedesktop.org/series/135601/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
bf723cf88eab8774a5a17794a720f9321f625ffc xe/oa/oa-metricset-codegen: Fix XE_OA_FORMAT_PEC64u64 offsets

Tail of build.log:
[1712/1736] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_mtlgt3.c.o'.
[1713/1736] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt1.c.o'.
[1714/1736] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
[1715/1736] Linking target runner/runner_test.
[1716/1736] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt2.c.o'.
[1717/1736] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt3.c.o'.
[1718/1736] Linking target lib/libi915_perf.so.1.5.
[1719/1736] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.so.1.5.symbols'.
[1720/1736] Linking target tools/i915-perf/i915-perf-configs.
[1721/1736] Linking target tools/i915-perf/i915-perf-reader.
[1722/1736] Linking target tools/i915-perf/i915-perf-recorder.
[1723/1736] Linking target tests/perf.
[1724/1736] Linking target tests/gem_barrier_race.
[1725/1736] Linking target tests/core_hotunplug.
[1726/1736] Generating core_hotunplug.testlist with a meson_exe.py custom command.
[1727/1736] Generating gem_barrier_race.testlist with a meson_exe.py custom command.
[1728/1736] Generating perf.testlist with a meson_exe.py custom command.
[1729/1736] Generating xe_tests.rst with a custom command.
FAILED: docs/testplan/xe_tests.rst 
/usr/src/igt-gpu-tools/scripts/igt_doc.py --config /usr/src/igt-gpu-tools/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /opt/igt/build
Traceback (most recent call last):
  File "/usr/src/igt-gpu-tools/scripts/igt_doc.py", line 386, in <module>
    main()
  File "/usr/src/igt-gpu-tools/scripts/igt_doc.py", line 341, in main
    tests.check_tests()
  File "/usr/src/igt-gpu-tools/scripts/test_list.py", line 1166, in check_tests
    subtests = self.expand_dictionary(True)
  File "/usr/src/igt-gpu-tools/scripts/test_list.py", line 749, in expand_dictionary
    subtest_array = self.expand_subtest(fname, name, test, subtest_only)
  File "/usr/src/igt-gpu-tools/scripts/test_list.py", line 655, in expand_subtest
    if arg_array[j] is None:
KeyError: 0
[1730/1736] Generating i915_tests.rst with a custom command.
[1731/1736] Generating kms_tests.rst with a custom command.
[1732/1736] Generating intel-ci-tests with a custom command.
FAILED: docs/testplan/intel-ci-tests 
/usr/src/igt-gpu-tools/scripts/igt_doc.py --config /usr/src/igt-gpu-tools/tests/intel/i915_test_config.json /usr/src/igt-gpu-tools/tests/intel/kms_test_config.json /usr/src/igt-gpu-tools/tests/intel/xe_test_config.json --intelci-testlist docs/testplan/intel-ci-tests
Traceback (most recent call last):
  File "/usr/src/igt-gpu-tools/scripts/igt_doc.py", line 386, in <module>
    main()
  File "/usr/src/igt-gpu-tools/scripts/igt_doc.py", line 380, in main
    (testlist, gpu_set) = tests.gen_intelci_testlist()
  File "/usr/src/igt-gpu-tools/scripts/igt_doc.py", line 91, in gen_intelci_testlist
    subtest_dict = self.expand_dictionary(True)
  File "/usr/src/igt-gpu-tools/scripts/test_list.py", line 749, in expand_dictionary
    subtest_array = self.expand_subtest(fname, name, test, subtest_only)
  File "/usr/src/igt-gpu-tools/scripts/test_list.py", line 655, in expand_subtest
    if arg_array[j] is None:
KeyError: 0
ninja: build stopped: subcommand failed.


