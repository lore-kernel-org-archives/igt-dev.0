Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F48CCE7AA0
	for <igt-dev@archiver.kernel.org>; Thu,  5 Sep 2024 21:25:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A07810E952;
	Thu,  5 Sep 2024 21:25:28 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9162010E952;
 Thu,  5 Sep 2024 21:25:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/km=5Fpm=5Fbrightnes?=
 =?utf-8?q?s=2Ec=3A_check_for_flickers_while_adjusting_the_brightness=2E_=28?=
 =?utf-8?q?rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 05 Sep 2024 21:25:27 -0000
Message-ID: <172557152758.952326.6812115317824580284@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240627030211.164110-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20240627030211.164110-1-santhosh.reddy.guddati@intel.com>
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

Series: tests/km_pm_brightness.c: check for flickers while adjusting the brightness. (rev4)
URL   : https://patchwork.freedesktop.org/series/135463/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
ae7f2bc0b99801a7ae369d4b5fda5c6b1c386eb1 tests/intel/xe_wedged: Inform runner about expected error

Tail of build.log:
[1721/1767] Linking target tools/intel_reg_checker.
[1722/1767] Linking target tools/xe-perf/xe-perf-configs.
[1723/1767] Linking target tools/xe-perf/xe-perf-reader.
[1724/1767] Linking target tools/intel_stepping.
[1725/1767] Linking target tools/amd_hdmi_compliance.
[1726/1767] Linking target tools/msm_dp_compliance.
[1727/1767] Linking target tools/intel_gem_info.
[1728/1767] Linking target runner/runner_json_test.
[1729/1767] Linking target tools/intel_vbt_decode.
[1730/1767] Linking target runner/igt_results.
[1731/1767] Linking target runner/testdata/skippers.
[1732/1767] Linking target runner/igt_resume.
[1733/1767] Linking target runner/testdata/dynamic.
[1734/1767] Linking target tools/intel_gvtg_test.
[1735/1767] Linking target runner/testdata/no-subtests.
[1736/1767] Generating gem_stress.testlist with a meson_exe.py custom command.
[1737/1767] Linking target runner/testdata/abort-fixture.
[1738/1767] Linking target runner/igt_runner.
[1739/1767] Linking target runner/testdata/abort.
[1740/1767] Linking target runner/igt_comms_decoder.
[1741/1767] Linking target tools/lsgpu.
[1742/1767] Linking target runner/testdata/abort-simple.
[1743/1767] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_mtlgt3.c.o'.
[1744/1767] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt1.c.o'.
[1745/1767] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
[1746/1767] Linking target runner/runner_test.
[1747/1767] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt2.c.o'.
[1748/1767] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt3.c.o'.
[1749/1767] Linking target lib/libi915_perf.so.1.5.
[1750/1767] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.so.1.5.symbols'.
[1751/1767] Linking target tools/i915-perf/i915-perf-configs.
[1752/1767] Linking target tools/i915-perf/i915-perf-recorder.
[1753/1767] Linking target tests/core_hotunplug.
[1754/1767] Linking target tests/gem_barrier_race.
[1755/1767] Linking target tools/i915-perf/i915-perf-reader.
[1756/1767] Linking target tests/perf.
[1757/1767] Generating perf.testlist with a meson_exe.py custom command.
[1758/1767] Generating core_hotunplug.testlist with a meson_exe.py custom command.
[1759/1767] Generating gem_barrier_race.testlist with a meson_exe.py custom command.
[1760/1767] Generating xe_tests.rst with a custom command.
[1761/1767] Generating kms_tests.rst with a custom command.
FAILED: docs/testplan/kms_tests.rst 
/usr/src/igt-gpu-tools/scripts/igt_doc.py --config /usr/src/igt-gpu-tools/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /opt/igt/build
Warning: Documented igt@kms_pm_backlight@brightness-with-crc doesn't exist on source files
Warning: Missing documentation for igt@kms_pm_backlight@brightness-crc-change
Please refer: docs/test_documentation.md for more details
[1762/1767] Generating i915_tests.rst with a custom command.
[1763/1767] Generating intel-ci-tests with a custom command.
[1764/1767] Generating xe_tests.html with a custom command.
ninja: build stopped: subcommand failed.


