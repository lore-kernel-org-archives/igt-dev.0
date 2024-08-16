Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B1AC531DC
	for <igt-dev@archiver.kernel.org>; Fri, 16 Aug 2024 07:13:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68F510E5A6;
	Fri, 16 Aug 2024 07:13:06 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 520BF10E5A6;
 Fri, 16 Aug 2024 07:13:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/intel/xe=5Fsysfs=5F?=
 =?utf-8?q?preempt=5Ftimeout=3A_Porting_sysfs_preempt_test_in_xe_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nakshtra.goyal@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 16 Aug 2024 07:13:05 -0000
Message-ID: <172379238532.653293.13018739457011198049@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240816064852.3919814-1-nakshtra.goyal@intel.com>
In-Reply-To: <20240816064852.3919814-1-nakshtra.goyal@intel.com>
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

Series: tests/intel/xe_sysfs_preempt_timeout: Porting sysfs preempt test in xe (rev7)
URL   : https://patchwork.freedesktop.org/series/136449/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
c34e13f766d0ed48c8b62ad9d8c29f11a8441b8b tests/amdgpu: fix secure bounce test failure on APUs

Tail of build.log:
[1714/1761] Linking target tools/lsgpu.
[1715/1761] Linking target runner/igt_comms_decoder.
[1716/1761] Linking target tools/intel_residency.
[1717/1761] Linking target tools/msm_dp_compliance.
[1718/1761] Linking target tools/amd_hdmi_compliance.
[1719/1761] Linking target runner/testdata/successtest.
[1720/1761] Linking target tools/intel_vbt_decode.
[1721/1761] Linking target tools/intel_gvtg_test.
[1722/1761] Linking target runner/igt_results.
[1723/1761] Linking target tools/intel_stepping.
[1724/1761] Linking target tools/intel_gem_info.
[1725/1761] Linking target runner/testdata/abort-simple.
[1726/1761] Linking target tools/intel_l3_parity.
[1727/1761] Linking target runner/testdata/abort-dynamic.
[1728/1761] Linking target runner/testdata/dynamic.
[1729/1761] Linking target runner/igt_resume.
[1730/1761] Linking target runner/testdata/skippers.
[1731/1761] Linking target runner/testdata/abort.
[1732/1761] Linking target runner/testdata/no-subtests.
[1733/1761] Linking target runner/igt_runner.
[1734/1761] Linking target runner/runner_json_test.
[1735/1761] Generating gem_stress.testlist with a meson_exe.py custom command.
[1736/1761] Linking target runner/testdata/abort-fixture.
[1737/1761] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_mtlgt3.c.o'.
[1738/1761] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt1.c.o'.
[1739/1761] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
[1740/1761] Linking target runner/runner_test.
[1741/1761] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt2.c.o'.
[1742/1761] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt3.c.o'.
[1743/1761] Linking target lib/libi915_perf.so.1.5.
[1744/1761] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.so.1.5.symbols'.
[1745/1761] Linking target tools/i915-perf/i915-perf-configs.
[1746/1761] Linking target tools/i915-perf/i915-perf-reader.
[1747/1761] Linking target tools/i915-perf/i915-perf-recorder.
[1748/1761] Linking target tests/core_hotunplug.
[1749/1761] Linking target tests/gem_barrier_race.
[1750/1761] Linking target tests/perf.
[1751/1761] Generating core_hotunplug.testlist with a meson_exe.py custom command.
[1752/1761] Generating gem_barrier_race.testlist with a meson_exe.py custom command.
[1753/1761] Generating perf.testlist with a meson_exe.py custom command.
[1754/1761] Generating xe_tests.rst with a custom command.
FAILED: docs/testplan/xe_tests.rst 
/usr/src/igt-gpu-tools/scripts/igt_doc.py --config /usr/src/igt-gpu-tools/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /opt/igt/build
Warning: Documented igt@xe_sysfs_preempt_timeout@preempt timeout us-timeout doesn't exist on source files
Warning: Missing documentation for igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout
Please refer: docs/test_documentation.md for more details
[1755/1761] Generating i915_tests.rst with a custom command.
[1756/1761] Generating kms_tests.rst with a custom command.
[1757/1761] Generating intel-ci-tests with a custom command.
ninja: build stopped: subcommand failed.


