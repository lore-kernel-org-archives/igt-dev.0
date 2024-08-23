Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9B2C5321E
	for <igt-dev@archiver.kernel.org>; Fri, 23 Aug 2024 21:56:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD46710E09B;
	Fri, 23 Aug 2024 21:56:55 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 842CA10E09B;
 Fri, 23 Aug 2024 21:56:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_kunit=3A_Remove_hard-code?=
 =?utf-8?q?d_test_list_from_xe=5Flive=5Fktest?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 23 Aug 2024 21:56:54 -0000
Message-ID: <172445021453.748054.6486549922745953512@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240823182418.1771456-1-John.C.Harrison@Intel.com>
In-Reply-To: <20240823182418.1771456-1-John.C.Harrison@Intel.com>
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

Series: kunit: Remove hard-coded test list from xe_live_ktest
URL   : https://patchwork.freedesktop.org/series/137735/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
af25d174eb6445242565a014f99bf3f419552c04 tests/amd_queue_reset: add ability to skip subtest

Tail of build.log:
[1720/1767] Linking target tools/intel_reg_checker.
[1721/1767] Linking target tools/lsgpu.
[1722/1767] Generating gem_stress.testlist with a meson_exe.py custom command.
[1723/1767] Linking target tools/intel_watermark.
[1724/1767] Linking target runner/testdata/abort-simple.
[1725/1767] Linking target runner/testdata/no-subtests.
[1726/1767] Linking target tools/xe-perf/xe-perf-reader.
[1727/1767] Linking target runner/testdata/dynamic.
[1728/1767] Linking target tools/xe-perf/xe-perf-recorder.
[1729/1767] Linking target tools/amd_hdmi_compliance.
[1730/1767] Linking target tools/intel_gvtg_test.
[1731/1767] Linking target tools/intel_vbt_decode.
[1732/1767] Linking target runner/igt_results.
[1733/1767] Linking target runner/testdata/successtest.
[1734/1767] Linking target tools/intel_dp_compliance.
[1735/1767] Linking target runner/igt_comms_decoder.
[1736/1767] Generating xe_live_ktest.testlist with a meson_exe.py custom command.
FAILED: tests/xe_live_ktest.testlist 
/usr/bin/meson --internal exe --capture tests/xe_live_ktest.testlist -- /opt/igt/build/tests/xe_live_ktest --show-testlist
skipping is allowed only in fixtures, subtests or igt_simple_main
please refer to lib/igt_core documentation
xe_live_ktest: ../../../usr/src/igt-gpu-tools/lib/igt_core.c:450: internal_assert: Assertion `0' failed.
Received signal SIGABRT.
Stack trace: 
 #0 [fatal_sig_handler+0x10f]
 #1 [killpg+0x40]
 #2 [gsignal+0xcb]
 #3 [abort+0x12b]
 #4 [<unknown>+0x12b]
 #5 [__assert_fail+0x46]
 #6 [internal_assert+0x106]
 #7 [igt_skip+0x185]
 #8 [__igt_skip_check+0x1d7]
 #9 [igt_ktest_begin+0x9e]
 #10 [igt_kunit_get_test_names+0x124]
 #11 [main+0x75]
 #12 [__libc_start_main+0xf3]
 #13 [_start+0x2e]
[1737/1767] Linking target runner/testdata/skippers.
[1738/1767] Linking target runner/testdata/abort.
[1739/1767] Linking target runner/testdata/abort-fixture.
[1740/1767] Linking target runner/igt_runner.
[1741/1767] Linking target runner/testdata/abort-dynamic.
[1742/1767] Linking target runner/runner_json_test.
[1743/1767] Linking target runner/igt_resume.
[1744/1767] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt1.c.o'.
[1745/1767] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
[1746/1767] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt2.c.o'.
[1747/1767] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt3.c.o'.
ninja: build stopped: subcommand failed.


