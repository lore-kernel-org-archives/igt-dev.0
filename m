Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF727C54E5D
	for <igt-dev@archiver.kernel.org>; Tue, 19 Mar 2024 06:10:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26C0D10ED2B;
	Tue, 19 Mar 2024 06:10:12 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C91F10ED2B;
 Tue, 19 Mar 2024 06:10:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests/kms=5Fvrr=3A_Add_?=
 =?utf-8?q?a_subtest_for_seamless_modeset_to_a_virtual_LRR_mode_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Manasi Navare" <navaremanasi@chromium.org>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 19 Mar 2024 06:10:10 -0000
Message-ID: <171082861064.900422.11525905311715976848@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240319054343.3847440-1-navaremanasi@chromium.org>
In-Reply-To: <20240319054343.3847440-1-navaremanasi@chromium.org>
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

Series: tests/kms_vrr: Add a subtest for seamless modeset to a virtual LRR mode (rev2)
URL   : https://patchwork.freedesktop.org/series/131295/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1131232 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/56466211):
  Warning: igt@vgem_basic@unload Sub-category documentation is missing
  [1787/1792] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/821] Generating version.h with a custom command.
  [2/8] Linking target runner/runner_test.
  [3/8] Linking target assembler/intel-gen4asm.
  [4/8] Generating i915_tests.html with a custom command.
  [5/8] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  /builds/gfx-ci/igt-ci-tags/tests/intel/../kms_vrr.c:75: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json?
  	==> without a full modeset.
  ninja: build stopped: subcommand failed.
  section_end:1710828313:step_script
  section_start:1710828313:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710828313:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/56466214):
  [2/13] Linking static target runner/libigt_runner.a.
  [3/13] Linking target runner/igt_runner.
  [4/13] Linking target runner/igt_results.
  [5/13] Linking target runner/igt_resume.
  [6/13] Linking target runner/igt_comms_decoder.
  [7/13] Linking target runner/runner_json_test.
  [8/13] Linking target runner/runner_test.
  [9/13] Generating i915_tests.html with a custom command.
  [10/13] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst
  /builds/gfx-ci/igt-ci-tags/tests/intel/../kms_vrr.c:75: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json?
  	==> without a full modeset.
  ninja: build stopped: subcommand failed.
  section_end:1710828316:step_script
  section_start:1710828316:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710828317:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/56466213):
  [2/13] Linking static target runner/libigt_runner.a.
  [3/13] Linking target runner/runner_test.
  [4/13] Linking target runner/igt_runner.
  [5/13] Linking target runner/igt_results.
  [6/13] Linking target runner/igt_resume.
  [7/13] Linking target runner/igt_comms_decoder.
  [8/13] Linking target runner/runner_json_test.
  [9/13] Generating i915_tests.html with a custom command.
  [10/13] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst
  /builds/gfx-ci/igt-ci-tags/tests/intel/../kms_vrr.c:75: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json?
  	==> without a full modeset.
  ninja: build stopped: subcommand failed.
  section_end:1710828320:step_script
  section_start:1710828320:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710828321:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/56466215):
  [2/13] Linking static target runner/libigt_runner.a.
  [3/13] Linking target runner/igt_runner.
  [4/13] Linking target runner/igt_results.
  [5/13] Linking target runner/igt_resume.
  [6/13] Linking target runner/igt_comms_decoder.
  [7/13] Linking target runner/runner_test.
  [8/13] Linking target runner/runner_json_test.
  [9/13] Generating i915_tests.html with a custom command.
  [10/13] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst
  /builds/gfx-ci/igt-ci-tags/tests/intel/../kms_vrr.c:75: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json?
  	==> without a full modeset.
  ninja: build stopped: subcommand failed.
  section_end:1710828322:step_script
  section_start:1710828322:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710828323:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/56466212):
  ninja: Entering directory `build'
  [1/105] Generating version.h with a custom command.
  [2/9] Linking target lib/libi915_perf.so.1.5.
  [3/9] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.so.1.5.symbols'.
  [4/9] Linking target tools/intel_gpu_top.
  [5/9] Linking target tools/i915-perf/i915-perf-configs.
  [6/9] Linking target tools/i915-perf/i915-perf-recorder.
  [7/9] Linking target tools/i915-perf/i915-perf-reader.
  [8/9] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst
  /builds/gfx-ci/igt-ci-tags/tests/intel/../kms_vrr.c:75: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json?
  	==> without a full modeset.
  ninja: build stopped: subcommand failed.
  section_end:1710828271:step_script
  section_start:1710828271:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710828272:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/56466206):
  Warning: igt@vgem_basic@sysfs Sub-category documentation is missing
  Warning: igt@vgem_basic@unload Sub-category documentation is missing
  [1794/1798] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/823] Generating version.h with a custom command.
  [2/7] Linking target runner/runner_test.
  [3/7] Generating i915_tests.html with a custom command.
  [4/7] Generating intel-ci-tests with a custom command.
  FAILED: docs/testplan/intel-ci-tests 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --intelci-testlist docs/testplan/intel-ci-tests
  /builds/gfx-ci/igt-ci-tags/tests/intel/../kms_vrr.c:75: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json?
  	==> without a full modeset.
  ninja: build stopped: subcommand failed.
  section_end:1710828297:step_script
  section_start:1710828297:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710828298:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/56466210):
  Warning: igt@vgem_basic@mmap Sub-category documentation is missing
  Warning: igt@vgem_basic@second-client Sub-category documentation is missing
  Warning: igt@vgem_basic@setversion Sub-category documentation is missing
  Warning: igt@vgem_basic@sysfs Sub-category documentation is missing
  Warning: igt@vgem_basic@unload Sub-category documentation is missing
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/823] Generating version.h with a custom command.
  [2/6] Generating intel-ci-tests with a custom command.
  FAILED: docs/testplan/intel-ci-tests 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --intelci-testlist docs/testplan/intel-ci-tests
  /builds/gfx-ci/igt-ci-tags/tests/intel/../kms_vrr.c:75: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json?
  	==> without a full modeset.
  ninja: build stopped: subcommand failed.
  section_end:1710828314:step_script
  section_start:1710828314:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710828315:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/56466209):
  [1626/1632] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/773] Generating version.h with a custom command.
  [2/9] Linking target runner/igt_results.
  [3/9] Linking target runner/runner_test.
  [4/9] Linking target runner/runner_json_test.
  [5/9] Generating i915_tests.html with a custom command.
  [6/9] Generating intel-ci-tests with a custom command.
  FAILED: docs/testplan/intel-ci-tests 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --intelci-testlist docs/testplan/intel-ci-tests
  /builds/gfx-ci/igt-ci-tags/tests/intel/../kms_vrr.c:75: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json?
  	==> without a full modeset.
  ninja: build stopped: subcommand failed.
  section_end:1710828319:step_script
  section_start:1710828319:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710828320:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/56466207):
  Warning: igt@vgem_basic@unload Sub-category documentation is missing
  [1793/1798] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/823] Generating version.h with a custom command.
  [2/8] Linking target runner/runner_test.
  [3/8] Linking target assembler/intel-gen4asm.
  [4/8] Generating i915_tests.html with a custom command.
  [5/8] Generating intel-ci-tests with a custom command.
  FAILED: docs/testplan/intel-ci-tests 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --intelci-testlist docs/testplan/intel-ci-tests
  /builds/gfx-ci/igt-ci-tags/tests/intel/../kms_vrr.c:75: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json?
  	==> without a full modeset.
  ninja: build stopped: subcommand failed.
  section_end:1710828321:step_script
  section_start:1710828321:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710828322:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/56466208):
  Warning: igt@vgem_basic@sysfs Sub-category documentation is missing
  Warning: igt@vgem_basic@unload Sub-category documentation is missing
  [1794/1798] Compiling C object 'runner/runner@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/823] Generating version.h with a custom command.
  [2/7] Linking target runner/runner_test.
  [3/7] Generating i915_tests.html with a custom command.
  [4/7] Generating intel-ci-tests with a custom command.
  FAILED: docs/testplan/intel-ci-tests 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --intelci-testlist docs/testplan/intel-ci-tests
  /builds/gfx-ci/igt-ci-tags/tests/intel/../kms_vrr.c:75: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json?
  	==> without a full modeset.
  ninja: build stopped: subcommand failed.
  section_end:1710828293:step_script
  section_start:1710828293:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710828294:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1131232
