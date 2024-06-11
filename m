Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E79CC25B76
	for <igt-dev@archiver.kernel.org>; Tue, 11 Jun 2024 12:02:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2C4A10E5D1;
	Tue, 11 Jun 2024 12:02:30 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870F710E5D1;
 Tue, 11 Jun 2024 12:02:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_lib/gpgpu=3A_add_shader_s?=
 =?utf-8?q?upport_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 11 Jun 2024 12:02:28 -0000
Message-ID: <171810734855.66743.13740203840652207620@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240611-iga64_inline_ups-v6-0-b634ec43a610@intel.com>
In-Reply-To: <20240611-iga64_inline_ups-v6-0-b634ec43a610@intel.com>
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

Series: lib/gpgpu: add shader support (rev6)
URL   : https://patchwork.freedesktop.org/series/133020/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
d3d49beb5bbf027618a278d0633ec5182e30c712 tests/intel/xe_create: Don't assert on presi execution

Tail of build.log:
[1643/1687] Generating gem_stress.testlist with a meson_exe.py custom command.
[1644/1687] Linking target tools/intel_reg_checker.
[1645/1687] Linking target tools/intel_gem_info.
[1646/1687] Linking target tools/intel_pm_rpm.
[1647/1687] Linking target runner/testdata/abort-dynamic.
[1648/1687] Linking target runner/testdata/dynamic.
[1649/1687] Linking target tools/intel_reg.
[1650/1687] Linking target tools/intel_perf_counters.
[1651/1687] Linking target tools/intel_vbt_decode.
[1652/1687] Linking target runner/igt_comms_decoder.
[1653/1687] Linking target runner/testdata/skippers.
[1654/1687] Linking target tools/lsgpu.
[1655/1687] Linking target tools/intel_dp_compliance.
[1656/1687] Linking target runner/runner_json_test.
[1657/1687] Linking target tools/intel_l3_parity.
[1658/1687] Linking target tools/msm_dp_compliance.
[1659/1687] Linking target runner/testdata/abort.
[1660/1687] Linking target runner/igt_runner.
[1661/1687] Linking target runner/testdata/abort-simple.
[1662/1687] Linking target runner/testdata/abort-fixture.
[1663/1687] Linking target runner/igt_results.
[1664/1687] Linking target runner/igt_resume.
[1665/1687] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
[1666/1687] Linking target runner/runner_test.
[1667/1687] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt2.c.o'.
[1668/1687] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt3.c.o'.
[1669/1687] Linking target lib/libi915_perf.so.1.5.
[1670/1687] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.so.1.5.symbols'.
[1671/1687] Linking target tools/i915-perf/i915-perf-configs.
[1672/1687] Linking target tools/i915-perf/i915-perf-recorder.
[1673/1687] Linking target tools/i915-perf/i915-perf-reader.
[1674/1687] Linking target tests/gem_barrier_race.
[1675/1687] Linking target tests/core_hotunplug.
[1676/1687] Linking target tests/perf.
[1677/1687] Generating perf.testlist with a meson_exe.py custom command.
[1678/1687] Generating core_hotunplug.testlist with a meson_exe.py custom command.
[1679/1687] Generating gem_barrier_race.testlist with a meson_exe.py custom command.
[1680/1687] Generating xe_tests.rst with a custom command.
FAILED: docs/testplan/xe_tests.rst 
/usr/src/igt-gpu-tools/scripts/igt_doc.py --config /usr/src/igt-gpu-tools/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /opt/igt/build
/usr/src/igt-gpu-tools/tests/intel/xe_exec_sip.c:11: Error: unrecognized line. Need to add field at /usr/src/igt-gpu-tools/tests/intel/xe_test_config.json?
	==> Driver requirement: xe
[1681/1687] Generating intel-ci-tests with a custom command.
FAILED: docs/testplan/intel-ci-tests 
/usr/src/igt-gpu-tools/scripts/igt_doc.py --config /usr/src/igt-gpu-tools/tests/intel/i915_test_config.json /usr/src/igt-gpu-tools/tests/intel/kms_test_config.json /usr/src/igt-gpu-tools/tests/intel/xe_test_config.json --intelci-testlist docs/testplan/intel-ci-tests
/usr/src/igt-gpu-tools/tests/intel/xe_exec_sip.c:11: Error: unrecognized line. Need to add field at /usr/src/igt-gpu-tools/tests/intel/xe_test_config.json?
	==> Driver requirement: xe
[1682/1687] Generating i915_tests.rst with a custom command.
[1683/1687] Generating kms_tests.rst with a custom command.
ninja: build stopped: subcommand failed.


