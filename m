Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7CEC04FFE
	for <igt-dev@archiver.kernel.org>; Tue, 14 May 2024 07:52:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE72910E063;
	Tue, 14 May 2024 07:52:29 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC7E910E063;
 Tue, 14 May 2024 07:52:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_helper_function_=28rev2?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bommu Krishnaiah" <krishnaiah.bommu@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 14 May 2024 07:52:28 -0000
Message-ID: <171567314876.2114222.5188538755193425372@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240514071026.748257-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20240514071026.748257-1-krishnaiah.bommu@intel.com>
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

Series: helper function (rev2)
URL   : https://patchwork.freedesktop.org/series/133096/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
be9b9992805df48e785b40ac2c4d001fb680a2c1 tests/kms_ccs: Test XRGB2101010

Tail of build.log:
[1647/1682] Linking target runner/igt_results.
[1648/1682] Linking target tools/lsgpu.
[1649/1682] Linking target tools/msm_dp_compliance.
[1650/1682] Linking target runner/testdata/no-subtests.
[1651/1682] Linking target runner/testdata/successtest.
[1652/1682] Linking target runner/testdata/abort-simple.
[1653/1682] Generating gem_stress.testlist with a meson_exe.py custom command.
[1654/1682] Linking target runner/testdata/dynamic.
[1655/1682] Linking target runner/igt_resume.
[1656/1682] Linking target runner/igt_runner.
[1657/1682] Linking target runner/runner_json_test.
[1658/1682] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_mtlgt3.c.o'.
[1659/1682] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt1.c.o'.
[1660/1682] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
[1661/1682] Linking target runner/runner_test.
[1662/1682] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt2.c.o'.
[1663/1682] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt3.c.o'.
[1664/1682] Linking target lib/libi915_perf.so.1.5.
[1665/1682] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.so.1.5.symbols'.
[1666/1682] Linking target tools/i915-perf/i915-perf-configs.
[1667/1682] Linking target tools/i915-perf/i915-perf-recorder.
[1668/1682] Linking target tools/i915-perf/i915-perf-reader.
[1669/1682] Linking target tests/core_hotunplug.
[1670/1682] Linking target tests/gem_barrier_race.
[1671/1682] Linking target tests/perf.
[1672/1682] Generating core_hotunplug.testlist with a meson_exe.py custom command.
[1673/1682] Generating gem_barrier_race.testlist with a meson_exe.py custom command.
[1674/1682] Generating perf.testlist with a meson_exe.py custom command.
[1675/1682] Generating xe_tests.rst with a custom command.
FAILED: docs/testplan/xe_tests.rst 
/usr/src/igt-gpu-tools/scripts/igt_doc.py --config /usr/src/igt-gpu-tools/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /opt/igt/build
Warning: igt@xe_svm@svm-atomic-access Category documentation is missing
Warning: igt@xe_svm@svm-basic-malloc Category documentation is missing
Warning: igt@xe_svm@svm-basic-mmap Category documentation is missing
Warning: igt@xe_svm@svm-benchmark Category documentation is missing
Warning: igt@xe_svm@svm-huge-page Category documentation is missing
Warning: igt@xe_svm@svm-mprotect Category documentation is missing
Warning: igt@xe_svm@svm-random-access Category documentation is missing
Warning: igt@xe_svm@svm-sparse-access Category documentation is missing
Warning: igt@xe_svm@svm_invalid_va Category documentation is missing
Warning: igt@xe_svm@xe_basic Category documentation is missing
Warning: Documented igt@xe_svm@svm_invalid_va doesn't exist on source files
Warning: Documented igt@xe_svm@xe_basic doesn't exist on source files
Warning: Missing documentation for igt@xe_svm@svm-invalid-va
Warning: Missing documentation for igt@xe_svm@xe-basic
Please refer: docs/test_documentation.md for more details
[1676/1682] Generating i915_tests.rst with a custom command.
[1677/1682] Generating kms_tests.rst with a custom command.
[1678/1682] Generating intel-ci-tests with a custom command.
ninja: build stopped: subcommand failed.


