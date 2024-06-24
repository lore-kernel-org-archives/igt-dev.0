Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135BCC30653
	for <igt-dev@archiver.kernel.org>; Mon, 24 Jun 2024 23:04:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF6110E26C;
	Mon, 24 Jun 2024 23:04:05 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D915810E1F3;
 Mon, 24 Jun 2024 23:04:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_xe=5Fexec=5Fcapture=3A_Ad?=
 =?utf-8?q?d_xe=5Fexec=5Fcapture_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 24 Jun 2024 23:04:04 -0000
Message-ID: <171927024488.153309.3384132610481388672@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240624224537.3239118-1-zhanjun.dong@intel.com>
In-Reply-To: <20240624224537.3239118-1-zhanjun.dong@intel.com>
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

Series: xe_exec_capture: Add xe_exec_capture test
URL   : https://patchwork.freedesktop.org/series/135328/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
a2600953b16d6628855b89ac40f477b58933b37b tests/amdgpu/gang_cs: skip test for some chips

Tail of build.log:
[1640/1684] Linking target tools/intel_gvtg_test.
[1641/1684] Linking target tools/msm_dp_compliance.
[1642/1684] Linking target runner/testdata/skippers.
[1643/1684] Linking target tools/intel_vbt_decode.
[1644/1684] Linking target runner/testdata/abort-dynamic.
[1645/1684] Linking target tools/intel_dp_compliance.
[1646/1684] Linking target runner/testdata/abort-fixture.
[1647/1684] Linking target runner/testdata/successtest.
[1648/1684] Linking target runner/testdata/no-subtests.
[1649/1684] Linking target runner/testdata/abort.
[1650/1684] Linking target runner/testdata/dynamic.
[1651/1684] Linking target tools/lsgpu.
[1652/1684] Linking target runner/igt_resume.
[1653/1684] Linking target runner/testdata/abort-simple.
[1654/1684] Linking target tools/amd_hdmi_compliance.
[1655/1684] Linking target runner/igt_runner.
[1656/1684] Linking target runner/igt_comms_decoder.
[1657/1684] Linking target runner/igt_results.
[1658/1684] Generating gem_stress.testlist with a meson_exe.py custom command.
[1659/1684] Linking target runner/runner_json_test.
[1660/1684] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_mtlgt3.c.o'.
[1661/1684] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt1.c.o'.
[1662/1684] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
[1663/1684] Linking target runner/runner_test.
[1664/1684] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt2.c.o'.
[1665/1684] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt3.c.o'.
[1666/1684] Linking target lib/libi915_perf.so.1.5.
[1667/1684] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.so.1.5.symbols'.
[1668/1684] Linking target tools/i915-perf/i915-perf-configs.
[1669/1684] Linking target tools/i915-perf/i915-perf-reader.
[1670/1684] Linking target tools/i915-perf/i915-perf-recorder.
[1671/1684] Linking target tests/gem_barrier_race.
[1672/1684] Linking target tests/core_hotunplug.
[1673/1684] Linking target tests/perf.
[1674/1684] Generating core_hotunplug.testlist with a meson_exe.py custom command.
[1675/1684] Generating gem_barrier_race.testlist with a meson_exe.py custom command.
[1676/1684] Generating perf.testlist with a meson_exe.py custom command.
[1677/1684] Generating xe_tests.rst with a custom command.
FAILED: docs/testplan/xe_tests.rst 
/usr/src/igt-gpu-tools/scripts/igt_doc.py --config /usr/src/igt-gpu-tools/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /opt/igt/build
/usr/src/igt-gpu-tools/tests/intel/xe_exec_capture.c:72: Error: unrecognized line. Need to add field at /usr/src/igt-gpu-tools/tests/intel/xe_test_config.json?
	==> range
[1678/1684] Generating intel-ci-tests with a custom command.
FAILED: docs/testplan/intel-ci-tests 
/usr/src/igt-gpu-tools/scripts/igt_doc.py --config /usr/src/igt-gpu-tools/tests/intel/i915_test_config.json /usr/src/igt-gpu-tools/tests/intel/kms_test_config.json /usr/src/igt-gpu-tools/tests/intel/xe_test_config.json --intelci-testlist docs/testplan/intel-ci-tests
/usr/src/igt-gpu-tools/tests/intel/xe_exec_capture.c:72: Error: unrecognized line. Need to add field at /usr/src/igt-gpu-tools/tests/intel/xe_test_config.json?
	==> range
[1679/1684] Generating i915_tests.rst with a custom command.
[1680/1684] Generating kms_tests.rst with a custom command.
ninja: build stopped: subcommand failed.


