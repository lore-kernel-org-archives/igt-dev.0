Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13B2C7883F
	for <igt-dev@archiver.kernel.org>; Fri, 20 Sep 2024 13:36:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6B210E0E3;
	Fri, 20 Sep 2024 13:36:43 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF8C410E14D;
 Fri, 20 Sep 2024 13:36:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/intel/xe=5Ffault=5F?=
 =?utf-8?q?injection=3A_Add_new_test_for_fault_injection?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 20 Sep 2024 13:36:41 -0000
Message-ID: <172683940190.1050860.3829448309124249687@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240920131913.3368381-1-francois.dugast@intel.com>
In-Reply-To: <20240920131913.3368381-1-francois.dugast@intel.com>
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

Series: tests/intel/xe_fault_injection: Add new test for fault injection
URL   : https://patchwork.freedesktop.org/series/138923/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
cb008246b0c73b2af9363c3ed0d7a3448e82953c lib/igt_kmod: Rewrite xe unload logic

Tail of build.log:
[1731/1774] Linking target tools/intel_l3_parity.
[1732/1774] Linking target runner/igt_comms_decoder.
[1733/1774] Linking target tools/intel_vbt_decode.
[1734/1774] Linking target tools/intel_tiling_detect.
[1735/1774] Linking target tools/amd_hdmi_compliance.
[1736/1774] Linking target runner/testdata/successtest.
[1737/1774] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_mtlgt3.c.o'.
[1738/1774] Linking target tools/msm_dp_compliance.
[1739/1774] Linking target tools/intel_reg.
[1740/1774] Linking target runner/igt_resume.
[1741/1774] Linking target runner/testdata/abort.
[1742/1774] Linking target runner/igt_runner.
[1743/1774] Linking target runner/testdata/abort-dynamic.
[1744/1774] Linking target runner/testdata/abort-fixture.
[1745/1774] Linking target runner/testdata/skippers.
[1746/1774] Linking target runner/runner_json_test.
[1747/1774] Linking target runner/testdata/abort-simple.
[1748/1774] Linking target runner/testdata/dynamic.
[1749/1774] Generating gem_stress.testlist with a meson_exe.py custom command.
[1750/1774] Linking target runner/igt_results.
[1751/1774] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt1.c.o'.
[1752/1774] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
[1753/1774] Linking target runner/runner_test.
[1754/1774] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt2.c.o'.
[1755/1774] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt3.c.o'.
[1756/1774] Linking target lib/libi915_perf.so.1.5.
[1757/1774] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.so.1.5.symbols'.
[1758/1774] Linking target tools/i915-perf/i915-perf-configs.
[1759/1774] Linking target tools/i915-perf/i915-perf-reader.
[1760/1774] Linking target tools/i915-perf/i915-perf-recorder.
[1761/1774] Linking target tests/gem_barrier_race.
[1762/1774] Linking target tests/core_hotunplug.
[1763/1774] Linking target tests/perf.
[1764/1774] Generating perf.testlist with a meson_exe.py custom command.
[1765/1774] Generating gem_barrier_race.testlist with a meson_exe.py custom command.
[1766/1774] Generating core_hotunplug.testlist with a meson_exe.py custom command.
[1767/1774] Generating xe_tests.rst with a custom command.
FAILED: docs/testplan/xe_tests.rst 
/usr/src/igt-gpu-tools/scripts/igt_doc.py --config /usr/src/igt-gpu-tools/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /opt/igt/build
Warning: igt@xe_fault_injection@function-fault-injection-during-probe Functionality documentation is missing
INFO: Found documentation for 'xe_eudebug' but no binary
INFO: Found documentation for 'xe_eudebug_online' but no binary
INFO: Found documentation for 'xe_exec_sip_eudebug' but no binary
ERROR: Missing documentation for igt@xe_fault_injection@function-fault-injection
ERROR: Unneeded documentation for igt@xe_fault_injection@function-fault-injection-during-probe
Please refer: docs/test_documentation.md for more details
[1768/1774] Generating i915_tests.rst with a custom command.
[1769/1774] Generating kms_tests.rst with a custom command.
[1770/1774] Generating intel-ci-tests with a custom command.
ninja: build stopped: subcommand failed.


