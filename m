Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29329C30653
	for <igt-dev@archiver.kernel.org>; Mon, 24 Jun 2024 23:09:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B788010E1F3;
	Mon, 24 Jun 2024 23:09:21 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A89710E1F3;
 Mon, 24 Jun 2024 23:09:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_xe=5Fexec=5Fcapture=3A_?=
 =?utf-8?q?Add_xe=5Fexec=5Fcapture_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 24 Jun 2024 23:09:20 -0000
Message-ID: <171927056003.154922.15066837093463264632@a6498e030952>
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
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1209272 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60299517):
  [1801/1806] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/827] Generating version.h with a custom command.
  [2/8] Linking target runner/runner_test.
  [3/8] Linking target assembler/intel-gen4asm.
  [4/8] Generating i915_tests.html with a custom command.
  [5/8] Generating kms_tests.html with a custom command.
  [6/8] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  /builds/gfx-ci/igt-ci-tags/tests/intel/xe_exec_capture.c:72: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json?
  	==> range
  ninja: build stopped: subcommand failed.
  section_end:1719270375:step_script
  section_start:1719270375:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719270376:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60299520):
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
  /builds/gfx-ci/igt-ci-tags/tests/intel/xe_exec_capture.c:72: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json?
  	==> range
  ninja: build stopped: subcommand failed.
  section_end:1719270341:step_script
  section_start:1719270341:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719270342:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60299519):
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
  /builds/gfx-ci/igt-ci-tags/tests/intel/xe_exec_capture.c:72: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json?
  	==> range
  ninja: build stopped: subcommand failed.
  section_end:1719270374:step_script
  section_start:1719270374:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719270375:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60299521):
  [3/13] Linking target runner/igt_runner.
  [4/13] Linking target runner/igt_resume.
  [5/13] Linking target runner/igt_results.
  [6/13] Linking target runner/igt_comms_decoder.
  [7/13] Linking target runner/runner_json_test.
  [8/13] Linking target runner/runner_test.
  [9/13] Generating i915_tests.html with a custom command.
  [10/13] Generating kms_tests.html with a custom command.
  [11/13] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst
  /builds/gfx-ci/igt-ci-tags/tests/intel/xe_exec_capture.c:72: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json?
  	==> range
  ninja: build stopped: subcommand failed.
  section_end:1719270356:step_script
  section_start:1719270356:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719270357:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60299518):
  ninja: Entering directory `build'
  [1/106] Generating version.h with a custom command.
  [2/9] Linking target lib/libi915_perf.so.1.5.
  [3/9] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.so.1.5.symbols'.
  [4/9] Linking target tools/intel_gpu_top.
  [5/9] Linking target tools/i915-perf/i915-perf-configs.
  [6/9] Linking target tools/i915-perf/i915-perf-recorder.
  [7/9] Linking target tools/i915-perf/i915-perf-reader.
  [8/9] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst
  /builds/gfx-ci/igt-ci-tags/tests/intel/xe_exec_capture.c:72: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json?
  	==> range
  ninja: build stopped: subcommand failed.
  section_end:1719270333:step_script
  section_start:1719270333:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719270334:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60299512):
  [1807/1812] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/829] Generating version.h with a custom command.
  [2/8] Linking target runner/runner_test.
  [3/8] Linking target assembler/intel-gen4asm.
  [4/8] Generating i915_tests.html with a custom command.
  [5/8] Generating kms_tests.html with a custom command.
  [6/8] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  /builds/gfx-ci/igt-ci-tags/tests/intel/xe_exec_capture.c:72: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json?
  	==> range
  ninja: build stopped: subcommand failed.
  section_end:1719270377:step_script
  section_start:1719270377:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719270378:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60299516):
  	==> range
  [1808/1812] Generating i915_tests.rst with a custom command.
  [1809/1812] Generating kms_tests.rst with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/829] Generating version.h with a custom command.
  [2/6] Generating kms_tests.html with a custom command.
  [3/6] Generating i915_tests.html with a custom command.
  [4/6] Generating intel-ci-tests with a custom command.
  FAILED: docs/testplan/intel-ci-tests 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --intelci-testlist docs/testplan/intel-ci-tests
  /builds/gfx-ci/igt-ci-tags/tests/intel/xe_exec_capture.c:72: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json?
  	==> range
  ninja: build stopped: subcommand failed.
  section_end:1719270366:step_script
  section_start:1719270366:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719270366:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60299515):
  	==> range
  [1638/1644] Generating i915_tests.rst with a custom command.
  [1639/1644] Generating kms_tests.rst with a custom command.
  [1640/1644] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/778] Generating version.h with a custom command.
  [2/7] Linking target runner/runner_test.
  [3/7] Generating intel-ci-tests with a custom command.
  FAILED: docs/testplan/intel-ci-tests 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --intelci-testlist docs/testplan/intel-ci-tests
  /builds/gfx-ci/igt-ci-tags/tests/intel/xe_exec_capture.c:72: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json?
  	==> range
  ninja: build stopped: subcommand failed.
  section_end:1719270371:step_script
  section_start:1719270371:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719270373:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60299513):
  	==> range
  [1806/1812] Generating i915_tests.rst with a custom command.
  [1807/1812] Generating kms_tests.rst with a custom command.
  [1808/1812] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/829] Generating version.h with a custom command.
  [2/7] Linking target runner/runner_test.
  [3/7] Generating intel-ci-tests with a custom command.
  FAILED: docs/testplan/intel-ci-tests 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --intelci-testlist docs/testplan/intel-ci-tests
  /builds/gfx-ci/igt-ci-tags/tests/intel/xe_exec_capture.c:72: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json?
  	==> range
  ninja: build stopped: subcommand failed.
  section_end:1719270373:step_script
  section_start:1719270373:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719270374:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60299514):
  	==> range
  [1807/1812] Generating kms_tests.rst with a custom command.
  [1808/1812] Compiling C object 'runner/runner@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/829] Generating version.h with a custom command.
  [2/7] Linking target runner/runner_test.
  [3/7] Generating kms_tests.html with a custom command.
  [4/7] Generating intel-ci-tests with a custom command.
  FAILED: docs/testplan/intel-ci-tests 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --intelci-testlist docs/testplan/intel-ci-tests
  /builds/gfx-ci/igt-ci-tags/tests/intel/xe_exec_capture.c:72: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json?
  	==> range
  ninja: build stopped: subcommand failed.
  section_end:1719270373:step_script
  section_start:1719270373:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719270374:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1209272
