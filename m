Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD52C27C6E
	for <igt-dev@archiver.kernel.org>; Fri, 14 Jun 2024 12:36:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1797210ED1D;
	Fri, 14 Jun 2024 12:36:17 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7B810E083;
 Fri, 14 Jun 2024 12:36:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_lib/gpgpu=3A_add_shader?=
 =?utf-8?q?_support_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 14 Jun 2024 12:36:14 -0000
Message-ID: <171836857457.77190.10649855227586450641@a6498e030952>
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
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1198675 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59747460):
  [1802/1809] Generating i915_tests.rst with a custom command.
  [1803/1809] Generating kms_tests.rst with a custom command.
  [1804/1809] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/828] Generating version.h with a custom command.
  [2/8] Linking target runner/runner_test.
  [3/8] Linking target assembler/intel-gen4asm.
  [4/8] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  /builds/gfx-ci/igt-ci-tags/tests/intel/xe_exec_sip.c:11: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json?
  	==> Driver requirement: xe
  ninja: build stopped: subcommand failed.
  section_end:1718107445:step_script
  section_start:1718107445:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1718107446:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59747464):
  [3/13] Linking target runner/igt_runner.
  [4/13] Linking target runner/igt_results.
  [5/13] Linking target runner/igt_resume.
  [6/13] Linking target runner/igt_comms_decoder.
  [7/13] Linking target runner/runner_test.
  [8/13] Linking target runner/runner_json_test.
  [9/13] Generating i915_tests.html with a custom command.
  [10/13] Generating kms_tests.html with a custom command.
  [11/13] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst
  /builds/gfx-ci/igt-ci-tags/tests/intel/xe_exec_sip.c:11: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json?
  	==> Driver requirement: xe
  ninja: build stopped: subcommand failed.
  section_end:1718107432:step_script
  section_start:1718107432:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1718107432:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59747463):
  [3/13] Linking target runner/igt_runner.
  [4/13] Linking target runner/igt_results.
  [5/13] Linking target runner/igt_resume.
  [6/13] Linking target runner/igt_comms_decoder.
  [7/13] Linking target runner/runner_test.
  [8/13] Linking target runner/runner_json_test.
  [9/13] Generating i915_tests.html with a custom command.
  [10/13] Generating kms_tests.html with a custom command.
  [11/13] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst
  /builds/gfx-ci/igt-ci-tags/tests/intel/xe_exec_sip.c:11: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json?
  	==> Driver requirement: xe
  ninja: build stopped: subcommand failed.
  section_end:1718107448:step_script
  section_start:1718107448:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1718107449:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59747466):
  [3/13] Linking target runner/igt_runner.
  [4/13] Linking target runner/igt_resume.
  [5/13] Linking target runner/igt_results.
  [6/13] Linking target runner/igt_comms_decoder.
  [7/13] Linking target runner/runner_test.
  [8/13] Linking target runner/runner_json_test.
  [9/13] Generating i915_tests.html with a custom command.
  [10/13] Generating kms_tests.html with a custom command.
  [11/13] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst
  /builds/gfx-ci/igt-ci-tags/tests/intel/xe_exec_sip.c:11: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json?
  	==> Driver requirement: xe
  ninja: build stopped: subcommand failed.
  section_end:1718107454:step_script
  section_start:1718107454:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1718107454:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59747462):
  ninja: Entering directory `build'
  [1/107] Generating version.h with a custom command.
  [2/9] Linking target lib/libi915_perf.so.1.5.
  [3/9] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.so.1.5.symbols'.
  [4/9] Linking target tools/intel_gpu_top.
  [5/9] Linking target tools/i915-perf/i915-perf-configs.
  [6/9] Linking target tools/i915-perf/i915-perf-recorder.
  [7/9] Linking target tools/i915-perf/i915-perf-reader.
  [8/9] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst
  /builds/gfx-ci/igt-ci-tags/tests/intel/xe_exec_sip.c:11: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json?
  	==> Driver requirement: xe
  ninja: build stopped: subcommand failed.
  section_end:1718107417:step_script
  section_start:1718107417:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1718107417:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59747453):
  	==> Driver requirement: xe
  [1809/1815] Generating i915_tests.rst with a custom command.
  [1810/1815] Generating kms_tests.rst with a custom command.
  [1811/1815] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/830] Generating version.h with a custom command.
  [2/7] Linking target runner/runner_test.
  [3/7] Generating intel-ci-tests with a custom command.
  FAILED: docs/testplan/intel-ci-tests 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --intelci-testlist docs/testplan/intel-ci-tests
  /builds/gfx-ci/igt-ci-tags/tests/intel/xe_exec_sip.c:11: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json?
  	==> Driver requirement: xe
  ninja: build stopped: subcommand failed.
  section_end:1718107426:step_script
  section_start:1718107426:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1718107428:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59747459):
  	==> Driver requirement: xe
  [1811/1815] Generating i915_tests.rst with a custom command.
  [1812/1815] Generating kms_tests.rst with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/830] Generating version.h with a custom command.
  [2/6] Generating kms_tests.html with a custom command.
  [3/6] Generating i915_tests.html with a custom command.
  [4/6] Generating intel-ci-tests with a custom command.
  FAILED: docs/testplan/intel-ci-tests 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --intelci-testlist docs/testplan/intel-ci-tests
  /builds/gfx-ci/igt-ci-tags/tests/intel/xe_exec_sip.c:11: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json?
  	==> Driver requirement: xe
  ninja: build stopped: subcommand failed.
  section_end:1718107474:step_script
  section_start:1718107474:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1718107474:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59747457):
  	==> Driver requirement: xe
  [1641/1647] Generating i915_tests.rst with a custom command.
  [1642/1647] Generating kms_tests.rst with a custom command.
  [1643/1647] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/779] Generating version.h with a custom command.
  [2/7] Linking target runner/runner_test.
  [3/7] Generating intel-ci-tests with a custom command.
  FAILED: docs/testplan/intel-ci-tests 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --intelci-testlist docs/testplan/intel-ci-tests
  /builds/gfx-ci/igt-ci-tags/tests/intel/xe_exec_sip.c:11: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json?
  	==> Driver requirement: xe
  ninja: build stopped: subcommand failed.
  section_end:1718107427:step_script
  section_start:1718107427:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1718107428:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59747454):
  	==> Driver requirement: xe
  [1809/1815] Generating i915_tests.rst with a custom command.
  [1810/1815] Generating kms_tests.rst with a custom command.
  [1811/1815] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/830] Generating version.h with a custom command.
  [2/7] Linking target runner/runner_test.
  [3/7] Generating intel-ci-tests with a custom command.
  FAILED: docs/testplan/intel-ci-tests 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --intelci-testlist docs/testplan/intel-ci-tests
  /builds/gfx-ci/igt-ci-tags/tests/intel/xe_exec_sip.c:11: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json?
  	==> Driver requirement: xe
  ninja: build stopped: subcommand failed.
  section_end:1718107429:step_script
  section_start:1718107429:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1718107431:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59747456):
  [1810/1815] Generating kms_tests.rst with a custom command.
  [1811/1815] Compiling C object 'runner/runner@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/830] Generating version.h with a custom command.
  [2/7] Linking target runner/runner_test.
  [3/7] Generating kms_tests.html with a custom command.
  [4/7] Generating i915_tests.html with a custom command.
  [5/7] Generating intel-ci-tests with a custom command.
  FAILED: docs/testplan/intel-ci-tests 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --intelci-testlist docs/testplan/intel-ci-tests
  /builds/gfx-ci/igt-ci-tags/tests/intel/xe_exec_sip.c:11: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json?
  	==> Driver requirement: xe
  ninja: build stopped: subcommand failed.
  section_end:1718107432:step_script
  section_start:1718107432:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1718107434:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1198675
