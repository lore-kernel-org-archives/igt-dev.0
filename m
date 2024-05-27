Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DCBC25B79
	for <igt-dev@archiver.kernel.org>; Mon, 27 May 2024 06:30:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E518C10F86E;
	Mon, 27 May 2024 06:30:37 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2FC910F86E;
 Mon, 27 May 2024 06:30:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/intel/kms=5Fpm=5Fdc?=
 =?utf-8?q?=3A_Add_a_new_test_to_validate_the_deep_sleep_state_during_extend?=
 =?utf-8?q?ed_vblank?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 27 May 2024 06:30:35 -0000
Message-ID: <171679143586.2211933.17842465278386201336@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240527041908.513920-1-jeevan.b@intel.com>
In-Reply-To: <20240527041908.513920-1-jeevan.b@intel.com>
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

Series: tests/intel/kms_pm_dc: Add a new test to validate the deep sleep state during extended vblank
URL   : https://patchwork.freedesktop.org/series/134058/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
1d7b961235e345db20933c057f265898e2e96fd2 tests: Fix Sub-category in documentation

Tail of build.log:
[1632/1679] Linking target tools/intel_vbt_decode.
[1633/1679] Linking target tools/intel_pm_rpm.
[1634/1679] Linking target tools/lsgpu.
[1635/1679] Linking target runner/testdata/skippers.
[1636/1679] Linking target tools/intel_stepping.
[1637/1679] Linking target tools/intel_residency.
[1638/1679] Linking target runner/testdata/dynamic.
[1639/1679] Linking target tools/intel_gem_info.
[1640/1679] Linking target tools/intel_l3_parity.
[1641/1679] Linking target runner/testdata/abort-fixture.
[1642/1679] Linking target tools/intel_watermark.
[1643/1679] Generating gem_stress.testlist with a meson_exe.py custom command.
[1644/1679] Linking target runner/igt_comms_decoder.
[1645/1679] Linking target tools/amd_hdmi_compliance.
[1646/1679] Linking target runner/igt_runner.
[1647/1679] Linking target runner/testdata/abort-simple.
[1648/1679] Linking target runner/testdata/abort-dynamic.
[1649/1679] Linking target runner/testdata/no-subtests.
[1650/1679] Linking target tools/msm_dp_compliance.
[1651/1679] Linking target runner/testdata/successtest.
[1652/1679] Linking target runner/igt_resume.
[1653/1679] Linking target runner/testdata/abort.
[1654/1679] Linking target runner/runner_json_test.
[1655/1679] Linking target runner/igt_results.
[1656/1679] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt1.c.o'.
[1657/1679] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
[1658/1679] Linking target runner/runner_test.
[1659/1679] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt2.c.o'.
[1660/1679] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt3.c.o'.
[1661/1679] Linking target lib/libi915_perf.so.1.5.
[1662/1679] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.so.1.5.symbols'.
[1663/1679] Linking target tools/i915-perf/i915-perf-configs.
[1664/1679] Linking target tools/i915-perf/i915-perf-reader.
[1665/1679] Linking target tests/gem_barrier_race.
[1666/1679] Linking target tests/perf.
[1667/1679] Linking target tools/i915-perf/i915-perf-recorder.
[1668/1679] Linking target tests/core_hotunplug.
[1669/1679] Generating gem_barrier_race.testlist with a meson_exe.py custom command.
[1670/1679] Generating perf.testlist with a meson_exe.py custom command.
[1671/1679] Generating core_hotunplug.testlist with a meson_exe.py custom command.
[1672/1679] Generating xe_tests.rst with a custom command.
[1673/1679] Generating kms_tests.rst with a custom command.
FAILED: docs/testplan/kms_tests.rst 
/usr/src/igt-gpu-tools/scripts/igt_doc.py --config /usr/src/igt-gpu-tools/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /opt/igt/build
Warning: Missing documentation for igt@kms_pm_dc@deep-pkgc
Please refer: docs/test_documentation.md for more details
[1674/1679] Generating i915_tests.rst with a custom command.
[1675/1679] Generating intel-ci-tests with a custom command.
[1676/1679] Generating xe_tests.html with a custom command.
ninja: build stopped: subcommand failed.


