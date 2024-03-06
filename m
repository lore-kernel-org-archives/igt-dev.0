Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A80C54E41
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 18:07:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1234F1133D8;
	Wed,  6 Mar 2024 18:07:31 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D9861133D5;
 Wed,  6 Mar 2024 18:07:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_Enable_more_tests_for_V?=
 =?utf-8?q?KMS?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 06 Mar 2024 18:07:30 -0000
Message-ID: <170974845025.562293.694143167815801626@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240306-b4-kms_tests-v1-0-8fe451efd2ac@bootlin.com>
In-Reply-To: <20240306-b4-kms_tests-v1-0-8fe451efd2ac@bootlin.com>
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

Series: Enable more tests for VKMS
URL   : https://patchwork.freedesktop.org/series/130818/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1121225 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/55955062):
  Checking if the user of the pipeline is allowed...
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out 69fbed73 as detached HEAD (ref is intel/IGTPW_10789)...
  Removing build/
  Removing lib/i915/perf-configs/__pycache__/
  Removing scripts/__pycache__/
  
  Skipping Git submodules setup
  section_end:1709748272:get_sources
  section_start:1709748272:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:ca01fc804bb92e5df42a202dd7e0470610c6711c66a808525defcb8bbb774078 for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian:commit-69fbed7368fcb3c662c803ba0c46d6c7c672dfee with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian@sha256:b9fe73c6ff5d68f5692fd18b9076735679c8bfa7ed393e752dd4927a2cdf9874 ...
  section_end:1709748274:step_script
  section_start:1709748274:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1709748275:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: no such image: docker.io/library/sha256:ca01fc804bb92e5df42a202dd7e0470610c6711c66a808525defcb8bbb774078: image not known (docker.go:570:0s)

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/55955057):
  [1790/1793] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/821] Generating version.h with a custom command.
  [2/6] Linking target runner/runner_test.
  [3/6] Generating i915_tests.html with a custom command.
  [4/6] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Documented igt@kms_plane@pixel-format doesn't exist on source files
  Warning: Missing documentation for igt@kms_plane@pixel-format-black-white
  Warning: Missing documentation for igt@kms_plane@pixel-format-colors
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1709748299:step_script
  section_start:1709748299:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1709748300:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/55955061):
  [1791/1793] Generating xe_tests.html with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/821] Generating version.h with a custom command.
  [2/5] Generating intel-ci-tests with a custom command.
  [3/5] Generating i915_tests.html with a custom command.
  [4/5] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Documented igt@kms_plane@pixel-format doesn't exist on source files
  Warning: Missing documentation for igt@kms_plane@pixel-format-black-white
  Warning: Missing documentation for igt@kms_plane@pixel-format-colors
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1709748326:step_script
  section_start:1709748326:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1709748328:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/55955060):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/771] Generating version.h with a custom command.
  [2/6] Linking target runner/runner_test.
  [3/6] Generating i915_tests.html with a custom command.
  [4/6] Generating intel-ci-tests with a custom command.
  [5/6] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Documented igt@kms_plane@pixel-format doesn't exist on source files
  Warning: Missing documentation for igt@kms_plane@pixel-format-black-white
  Warning: Missing documentation for igt@kms_plane@pixel-format-colors
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1709748306:step_script
  section_start:1709748306:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1709748306:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/55955058):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/821] Generating version.h with a custom command.
  [2/6] Linking target runner/runner_test.
  [3/6] Generating i915_tests.html with a custom command.
  [4/6] Generating intel-ci-tests with a custom command.
  [5/6] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Documented igt@kms_plane@pixel-format doesn't exist on source files
  Warning: Missing documentation for igt@kms_plane@pixel-format-black-white
  Warning: Missing documentation for igt@kms_plane@pixel-format-colors
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1709748299:step_script
  section_start:1709748299:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1709748300:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/55955059):
  [1790/1793] Compiling C object 'runner/runner@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/821] Generating version.h with a custom command.
  [2/6] Linking target runner/runner_test.
  [3/6] Generating i915_tests.html with a custom command.
  [4/6] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Documented igt@kms_plane@pixel-format doesn't exist on source files
  Warning: Missing documentation for igt@kms_plane@pixel-format-black-white
  Warning: Missing documentation for igt@kms_plane@pixel-format-colors
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1709748292:step_script
  section_start:1709748292:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1709748292:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1121225
