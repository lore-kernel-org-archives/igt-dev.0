Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA09C531DC
	for <igt-dev@archiver.kernel.org>; Fri, 16 Aug 2024 07:20:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD36710E5AC;
	Fri, 16 Aug 2024 07:20:57 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D1210E5AC;
 Fri, 16 Aug 2024 07:20:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests/intel/xe=5Fsysfs?=
 =?utf-8?q?=5Fpreempt=5Ftimeout=3A_Porting_sysfs_preempt_test_in_xe_=28rev7?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nakshtra.goyal@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 16 Aug 2024 07:20:56 -0000
Message-ID: <172379285661.653293.9838199472011817895@2413ebb6fbb6>
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
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1250399 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/62332077):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/837] Generating version.h with a custom command.
  [2/8] Linking target runner/runner_test.
  [3/8] Linking target assembler/intel-gen4asm.
  [4/8] Generating i915_tests.html with a custom command.
  [5/8] Generating kms_tests.html with a custom command.
  [6/8] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Documented igt@xe_sysfs_preempt_timeout@preempt timeout us-timeout doesn't exist on source files
  Warning: Missing documentation for igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1723792489:step_script
  section_start:1723792489:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1723792490:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/62332072):
  ninja: Entering directory `build'
  [1/839] Generating version.h with a custom command.
  [2/8] Linking target runner/runner_test.
  [3/8] Linking target assembler/intel-gen4asm.
  [4/8] Generating kms_tests.html with a custom command.
  [5/8] Generating i915_tests.html with a custom command.
  [6/8] Generating intel-ci-tests with a custom command.
  [7/8] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Documented igt@xe_sysfs_preempt_timeout@preempt timeout us-timeout doesn't exist on source files
  Warning: Missing documentation for igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1723792498:step_script
  section_start:1723792498:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1723792499:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/62332076):
  [1886/1889] Generating intel-ci-tests with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/839] Generating version.h with a custom command.
  [2/6] Generating kms_tests.html with a custom command.
  [3/6] Generating i915_tests.html with a custom command.
  [4/6] Generating intel-ci-tests with a custom command.
  [5/6] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Documented igt@xe_sysfs_preempt_timeout@preempt timeout us-timeout doesn't exist on source files
  Warning: Missing documentation for igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1723792518:step_script
  section_start:1723792518:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1723792519:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/62332075):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/788] Generating version.h with a custom command.
  [2/7] Linking target runner/runner_test.
  [3/7] Generating kms_tests.html with a custom command.
  [4/7] Generating i915_tests.html with a custom command.
  [5/7] Generating intel-ci-tests with a custom command.
  [6/7] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Documented igt@xe_sysfs_preempt_timeout@preempt timeout us-timeout doesn't exist on source files
  Warning: Missing documentation for igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1723792478:step_script
  section_start:1723792478:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1723792479:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/62332073):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/839] Generating version.h with a custom command.
  [2/7] Linking target runner/runner_test.
  [3/7] Generating kms_tests.html with a custom command.
  [4/7] Generating intel-ci-tests with a custom command.
  [5/7] Generating i915_tests.html with a custom command.
  [6/7] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Documented igt@xe_sysfs_preempt_timeout@preempt timeout us-timeout doesn't exist on source files
  Warning: Missing documentation for igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1723792498:step_script
  section_start:1723792498:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1723792499:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/62332074):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/839] Generating version.h with a custom command.
  [2/7] Linking target runner/runner_test.
  [3/7] Generating i915_tests.html with a custom command.
  [4/7] Generating intel-ci-tests with a custom command.
  [5/7] Generating kms_tests.html with a custom command.
  [6/7] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Documented igt@xe_sysfs_preempt_timeout@preempt timeout us-timeout doesn't exist on source files
  Warning: Missing documentation for igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1723792478:step_script
  section_start:1723792478:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1723792479:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1250399
