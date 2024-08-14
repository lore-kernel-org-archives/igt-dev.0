Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E06C3DA4A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 20:17:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525FE10E025;
	Wed, 14 Aug 2024 20:17:36 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884FC10E025;
 Wed, 14 Aug 2024 20:17:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_dumb=5Fbuffer=3A_Remove_invalid-bpp_subtest?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rob Clark" <robdclark@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 14 Aug 2024 20:17:35 -0000
Message-ID: <172366665555.633672.2684249756097623858@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240814185426.70418-1-robdclark@gmail.com>
In-Reply-To: <20240814185426.70418-1-robdclark@gmail.com>
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

Series: series starting with [1/2] dumb_buffer: Remove invalid-bpp subtest
URL   : https://patchwork.freedesktop.org/series/137323/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
496e86347f8607d032ed59cdad5eb018e5be6933 tests/intel/xe_module_load: Rename enable_display module param

Tail of build.log:
[1710/1758] Linking target tools/intel_dp_compliance.
[1711/1758] Linking target tools/intel_reg_checker.
[1712/1758] Linking target tools/intel_tiling_detect.
[1713/1758] Linking target tools/xe-perf/xe-perf-reader.
[1714/1758] Linking target tools/intel_vbt_decode.
[1715/1758] Linking target tools/intel_watermark.
[1716/1758] Linking target tools/intel_residency.
[1717/1758] Linking target tools/lsgpu.
[1718/1758] Linking target runner/igt_runner.
[1719/1758] Linking target runner/testdata/skippers.
[1720/1758] Linking target runner/testdata/abort.
[1721/1758] Linking target runner/testdata/abort-dynamic.
[1722/1758] Linking target runner/testdata/abort-fixture.
[1723/1758] Linking target tools/intel_gvtg_test.
[1724/1758] Linking target runner/igt_resume.
[1725/1758] Linking target runner/runner_json_test.
[1726/1758] Linking target runner/testdata/no-subtests.
[1727/1758] Linking target runner/igt_comms_decoder.
[1728/1758] Linking target tools/msm_dp_compliance.
[1729/1758] Linking target runner/testdata/successtest.
[1730/1758] Linking target runner/igt_results.
[1731/1758] Linking target runner/testdata/dynamic.
[1732/1758] Linking target runner/testdata/abort-simple.
[1733/1758] Generating gem_stress.testlist with a meson_exe.py custom command.
[1734/1758] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_mtlgt3.c.o'.
[1735/1758] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt1.c.o'.
[1736/1758] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
[1737/1758] Linking target runner/runner_test.
[1738/1758] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt2.c.o'.
[1739/1758] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt3.c.o'.
[1740/1758] Linking target lib/libi915_perf.so.1.5.
[1741/1758] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.so.1.5.symbols'.
[1742/1758] Linking target tools/i915-perf/i915-perf-configs.
[1743/1758] Linking target tools/i915-perf/i915-perf-reader.
[1744/1758] Linking target tools/i915-perf/i915-perf-recorder.
[1745/1758] Linking target tests/core_hotunplug.
[1746/1758] Linking target tests/gem_barrier_race.
[1747/1758] Linking target tests/perf.
[1748/1758] Generating core_hotunplug.testlist with a meson_exe.py custom command.
[1749/1758] Generating gem_barrier_race.testlist with a meson_exe.py custom command.
[1750/1758] Generating perf.testlist with a meson_exe.py custom command.
[1751/1758] Generating xe_tests.rst with a custom command.
[1752/1758] Generating i915_tests.rst with a custom command.
FAILED: docs/testplan/i915_tests.rst 
/usr/src/igt-gpu-tools/scripts/igt_doc.py --config /usr/src/igt-gpu-tools/tests/intel/i915_test_config.json --rest docs/testplan/i915_tests.rst --check-testlist --igt-build-path /opt/igt/build
Warning: Documented igt@dumb_buffer@invalid-bpp doesn't exist on source files
[1753/1758] Generating kms_tests.rst with a custom command.
[1754/1758] Generating intel-ci-tests with a custom command.
[1755/1758] Generating xe_tests.html with a custom command.
ninja: build stopped: subcommand failed.


