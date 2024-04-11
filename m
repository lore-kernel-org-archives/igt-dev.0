Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BE7CD1297
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 01:40:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74E710E528;
	Thu, 11 Apr 2024 01:40:52 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F130010E528;
 Thu, 11 Apr 2024 01:40:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_series_starting_with_=5Bv?=
 =?utf-8?q?5=2C1/2=5D_tests/kms=5Fvrr=3A_Add_a_subtest_for_seamless_modeset_?=
 =?utf-8?q?to_a_virtual_LRR_mode?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Manasi Navare" <navaremanasi@chromium.org>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 11 Apr 2024 01:40:50 -0000
Message-ID: <171279965098.1339733.7728749168657283297@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240410190329.3518540-1-navaremanasi@chromium.org>
In-Reply-To: <20240410190329.3518540-1-navaremanasi@chromium.org>
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

Series: series starting with [v5,1/2] tests/kms_vrr: Add a subtest for seamless modeset to a virtual LRR mode
URL   : https://patchwork.freedesktop.org/series/132297/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
e490cb6ffc497275544b36871c24af0a04f98470 lib: fix calloc calls with inverted arguments

Tail of build.log:
[1633/1676] Linking target tools/intel_gvtg_test.
[1634/1676] Linking target tools/intel_panel_fitter.
[1635/1676] Linking target tools/intel_gem_info.
[1636/1676] Linking target runner/testdata/no-subtests.
[1637/1676] Linking target tools/lsgpu.
[1638/1676] Linking target tools/intel_stepping.
[1639/1676] Linking target tools/intel_l3_parity.
[1640/1676] Linking target tools/intel_watermark.
[1641/1676] Linking target tools/msm_dp_compliance.
[1642/1676] Generating gem_stress.testlist with a meson_exe.py custom command.
[1643/1676] Linking target runner/testdata/abort-dynamic.
[1644/1676] Linking target runner/testdata/abort-simple.
[1645/1676] Linking target runner/igt_comms_decoder.
[1646/1676] Linking target tools/intel_dp_compliance.
[1647/1676] Linking target runner/testdata/abort-fixture.
[1648/1676] Linking target runner/testdata/dynamic.
[1649/1676] Linking target runner/igt_resume.
[1650/1676] Linking target runner/igt_runner.
[1651/1676] Linking target runner/igt_results.
[1652/1676] Linking target runner/runner_json_test.
[1653/1676] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt1.c.o'.
[1654/1676] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
[1655/1676] Linking target runner/runner_test.
[1656/1676] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt2.c.o'.
[1657/1676] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt3.c.o'.
[1658/1676] Linking target lib/libi915_perf.so.1.5.
[1659/1676] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.so.1.5.symbols'.
[1660/1676] Linking target tools/i915-perf/i915-perf-configs.
[1661/1676] Linking target tools/i915-perf/i915-perf-recorder.
[1662/1676] Linking target tests/gem_barrier_race.
[1663/1676] Linking target tests/core_hotunplug.
[1664/1676] Linking target tools/i915-perf/i915-perf-reader.
[1665/1676] Linking target tests/perf.
[1666/1676] Generating gem_barrier_race.testlist with a meson_exe.py custom command.
[1667/1676] Generating perf.testlist with a meson_exe.py custom command.
[1668/1676] Generating core_hotunplug.testlist with a meson_exe.py custom command.
[1669/1676] Generating xe_tests.rst with a custom command.
Warning: igt@xe_waitfence@exec_queue-reset-wait Sub-category documentation is missing
Warning: igt@xe_waitfence@invalid-flag Sub-category documentation is missing
Warning: igt@xe_waitfence@invalid-ops Sub-category documentation is missing
[1670/1676] Generating kms_tests.rst with a custom command.
FAILED: docs/testplan/kms_tests.rst 
/usr/src/igt-gpu-tools/scripts/igt_doc.py --config /usr/src/igt-gpu-tools/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /opt/igt/build
Warning: Documented igt@kms_vrr@seamless-rr-switch-virtual doesn't exist on source files
Warning: Missing documentation for igt@kms_vrr@seamless-virtual-rr-switch
Please refer: docs/test_documentation.md for more details
[1671/1676] Generating i915_tests.rst with a custom command.
[1672/1676] Generating intel-ci-tests with a custom command.
[1673/1676] Generating xe_tests.html with a custom command.
ninja: build stopped: subcommand failed.


