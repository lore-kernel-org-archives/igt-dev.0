Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A96CFB448
	for <igt-dev@archiver.kernel.org>; Mon,  7 Oct 2024 15:39:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52EB510E322;
	Mon,  7 Oct 2024 15:39:25 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C356110E322;
 Mon,  7 Oct 2024 15:39:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_intel=3A_igt=5Fdraw_and?=
 =?utf-8?q?_intel=5Fbufops_improvements?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 07 Oct 2024 15:39:24 -0000
Message-ID: <172831556479.1199107.12823113622696577179@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
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

Series: intel: igt_draw and intel_bufops improvements
URL   : https://patchwork.freedesktop.org/series/139556/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1285113 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/64744864):
  [1900/1907] Generating xe_tests.rst with a custom command.
  [1901/1907] Generating kms_tests.rst with a custom command.
  [1902/1907] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/848] Generating version.h with a custom command.
  [2/8] Linking target runner/runner_test.
  [3/8] Linking target assembler/intel-gen4asm.
  [4/8] Generating intel-ci-tests with a custom command.
  FAILED: docs/testplan/intel-ci-tests 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --intelci-testlist docs/testplan/intel-ci-tests
  /builds/gfx-ci/igt-ci-tags/tests/intel/gem_draw.c:10: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json?
  	==> Driver requirement: i915
  ninja: build stopped: subcommand failed.
  section_end:1728315260:step_script
  section_start:1728315260:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1728315260:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/64744867):
  [1/519] Generating version.h with a custom command.
  [2/13] Linking static target runner/libigt_runner.a.
  [3/13] Linking target runner/igt_runner.
  [4/13] Linking target runner/igt_resume.
  [5/13] Linking target runner/igt_results.
  [6/13] Linking target runner/runner_json_test.
  [7/13] Linking target runner/igt_comms_decoder.
  [8/13] Linking target runner/runner_test.
  [9/13] Generating i915_tests.rst with a custom command.
  FAILED: docs/testplan/i915_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json --rest docs/testplan/i915_tests.rst
  /builds/gfx-ci/igt-ci-tags/tests/intel/gem_draw.c:10: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json?
  	==> Driver requirement: i915
  ninja: build stopped: subcommand failed.
  section_end:1728315279:step_script
  section_start:1728315279:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1728315280:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/64744866):
  [1/519] Generating version.h with a custom command.
  [2/13] Linking static target runner/libigt_runner.a.
  [3/13] Linking target runner/igt_runner.
  [4/13] Linking target runner/igt_resume.
  [5/13] Linking target runner/igt_results.
  [6/13] Linking target runner/igt_comms_decoder.
  [7/13] Linking target runner/runner_test.
  [8/13] Linking target runner/runner_json_test.
  [9/13] Generating i915_tests.rst with a custom command.
  FAILED: docs/testplan/i915_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json --rest docs/testplan/i915_tests.rst
  /builds/gfx-ci/igt-ci-tags/tests/intel/gem_draw.c:10: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json?
  	==> Driver requirement: i915
  ninja: build stopped: subcommand failed.
  section_end:1728315258:step_script
  section_start:1728315258:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1728315259:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/64744868):
  [1/519] Generating version.h with a custom command.
  [2/13] Linking static target runner/libigt_runner.a.
  [3/13] Linking target runner/igt_runner.
  [4/13] Linking target runner/igt_results.
  [5/13] Linking target runner/igt_resume.
  [6/13] Linking target runner/igt_comms_decoder.
  [7/13] Linking target runner/runner_test.
  [8/13] Linking target runner/runner_json_test.
  [9/13] Generating i915_tests.rst with a custom command.
  FAILED: docs/testplan/i915_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json --rest docs/testplan/i915_tests.rst
  /builds/gfx-ci/igt-ci-tags/tests/intel/gem_draw.c:10: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json?
  	==> Driver requirement: i915
  ninja: build stopped: subcommand failed.
  section_end:1728315273:step_script
  section_start:1728315273:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1728315274:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/64744865):
  ninja: Entering directory `build'
  [1/115] Generating version.h with a custom command.
  [2/9] Linking target lib/libi915_perf.so.1.5.
  [3/9] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.so.1.5.symbols'.
  [4/9] Linking target tools/intel_gpu_top.
  [5/9] Linking target tools/i915-perf/i915-perf-configs.
  [6/9] Linking target tools/i915-perf/i915-perf-recorder.
  [7/9] Linking target tools/i915-perf/i915-perf-reader.
  [8/9] Generating i915_tests.rst with a custom command.
  FAILED: docs/testplan/i915_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json --rest docs/testplan/i915_tests.rst
  /builds/gfx-ci/igt-ci-tags/tests/intel/gem_draw.c:10: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json?
  	==> Driver requirement: i915
  ninja: build stopped: subcommand failed.
  section_end:1728315192:step_script
  section_start:1728315192:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1728315193:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/64744859):
  	==> Driver requirement: i915
  [1907/1913] Generating xe_tests.rst with a custom command.
  [1908/1913] Generating kms_tests.rst with a custom command.
  [1909/1913] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/850] Generating version.h with a custom command.
  [2/7] Linking target runner/runner_test.
  [3/7] Generating intel-ci-tests with a custom command.
  FAILED: docs/testplan/intel-ci-tests 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --intelci-testlist docs/testplan/intel-ci-tests
  /builds/gfx-ci/igt-ci-tags/tests/intel/gem_draw.c:10: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json?
  	==> Driver requirement: i915
  ninja: build stopped: subcommand failed.
  section_end:1728315260:step_script
  section_start:1728315260:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1728315261:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/64744863):
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json --rest docs/testplan/i915_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  /builds/gfx-ci/igt-ci-tags/tests/intel/gem_draw.c:10: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json?
  	==> Driver requirement: i915
  [1909/1913] Generating xe_tests.rst with a custom command.
  [1910/1913] Generating kms_tests.rst with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/850] Generating version.h with a custom command.
  [2/6] Generating intel-ci-tests with a custom command.
  FAILED: docs/testplan/intel-ci-tests 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --intelci-testlist docs/testplan/intel-ci-tests
  /builds/gfx-ci/igt-ci-tags/tests/intel/gem_draw.c:10: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json?
  	==> Driver requirement: i915
  ninja: build stopped: subcommand failed.
  section_end:1728315262:step_script
  section_start:1728315262:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1728315264:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/64744862):
  [1737/1743] Generating xe_tests.rst with a custom command.
  [1738/1743] Generating kms_tests.rst with a custom command.
  [1739/1743] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/798] Generating version.h with a custom command.
  [2/7] Linking target runner/runner_test.
  [3/7] Generating kms_tests.html with a custom command.
  [4/7] Generating i915_tests.rst with a custom command.
  FAILED: docs/testplan/i915_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json --rest docs/testplan/i915_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  /builds/gfx-ci/igt-ci-tags/tests/intel/gem_draw.c:10: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json?
  	==> Driver requirement: i915
  ninja: build stopped: subcommand failed.
  section_end:1728315239:step_script
  section_start:1728315239:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1728315241:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/64744860):
  /builds/gfx-ci/igt-ci-tags/tests/intel/gem_draw.c:10: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json?
  	==> Driver requirement: i915
  [1908/1913] Generating kms_tests.rst with a custom command.
  [1909/1913] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/850] Generating version.h with a custom command.
  [2/7] Linking target runner/runner_test.
  [3/7] Generating intel-ci-tests with a custom command.
  FAILED: docs/testplan/intel-ci-tests 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --intelci-testlist docs/testplan/intel-ci-tests
  /builds/gfx-ci/igt-ci-tags/tests/intel/gem_draw.c:10: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json?
  	==> Driver requirement: i915
  ninja: build stopped: subcommand failed.
  section_end:1728315256:step_script
  section_start:1728315256:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1728315257:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/64744861):
  	==> Driver requirement: i915
  [1907/1913] Generating xe_tests.rst with a custom command.
  [1908/1913] Generating kms_tests.rst with a custom command.
  [1909/1913] Compiling C object 'runner/runner@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/850] Generating version.h with a custom command.
  [2/7] Linking target runner/runner_test.
  [3/7] Generating i915_tests.rst with a custom command.
  FAILED: docs/testplan/i915_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json --rest docs/testplan/i915_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  /builds/gfx-ci/igt-ci-tags/tests/intel/gem_draw.c:10: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json?
  	==> Driver requirement: i915
  ninja: build stopped: subcommand failed.
  section_end:1728315235:step_script
  section_start:1728315235:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1728315236:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1285113
