Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7048BE69E81
	for <igt-dev@archiver.kernel.org>; Mon,  2 Dec 2024 18:55:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0449D10E1D9;
	Mon,  2 Dec 2024 18:55:27 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026DA10E180;
 Mon,  2 Dec 2024 18:55:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests/kms=5Fasync=5Ffli?=
 =?utf-8?q?ps=3A_add_atomic_test_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 02 Dec 2024 18:55:26 -0000
Message-ID: <173316572600.1729639.820785857623861658@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241201183841.71046-1-andrealmeid@igalia.com>
In-Reply-To: <20241201183841.71046-1-andrealmeid@igalia.com>
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

Series: tests/kms_async_flips: add atomic test (rev3)
URL   : https://patchwork.freedesktop.org/series/107681/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1321671 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/67549550):
  [1914/1918] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  [1915/1918] Generating xe_tests.html with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/851] Generating version.h with a custom command.
  [2/6] Linking target runner/runner_test.
  [3/6] Generating intel-ci-tests with a custom command.
  [4/6] Generating i915_tests.html with a custom command.
  [5/6] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  ERROR: Missing documentation for igt@kms_async_flips@atomic-async-flip
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1733165386:step_script
  section_start:1733165386:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1733165386:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/67549545):
  [1920/1924] Generating xe_tests.html with a custom command.
  [1921/1924] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/853] Generating version.h with a custom command.
  [2/6] Linking target runner/runner_test.
  [3/6] Generating intel-ci-tests with a custom command.
  [4/6] Generating i915_tests.html with a custom command.
  [5/6] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  ERROR: Missing documentation for igt@kms_async_flips@atomic-async-flip
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1733165251:step_script
  section_start:1733165251:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1733165252:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/67549549):
  [1920/1924] Generating i915_tests.rst with a custom command.
  [1921/1924] Generating intel-ci-tests with a custom command.
  [1922/1924] Generating xe_tests.html with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/853] Generating version.h with a custom command.
  [2/5] Generating i915_tests.html with a custom command.
  [3/5] Generating intel-ci-tests with a custom command.
  [4/5] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  ERROR: Missing documentation for igt@kms_async_flips@atomic-async-flip
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1733165310:step_script
  section_start:1733165310:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1733165311:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/67549548):
  [1748/1752] Generating xe_tests.html with a custom command.
  [1749/1752] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/801] Generating version.h with a custom command.
  [2/6] Linking target runner/runner_test.
  [3/6] Generating intel-ci-tests with a custom command.
  [4/6] Generating i915_tests.html with a custom command.
  [5/6] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  ERROR: Missing documentation for igt@kms_async_flips@atomic-async-flip
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1733165218:step_script
  section_start:1733165218:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1733165281:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/67549546):
  [1920/1924] Generating xe_tests.html with a custom command.
  [1921/1924] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/853] Generating version.h with a custom command.
  [2/6] Linking target runner/runner_test.
  [3/6] Generating intel-ci-tests with a custom command.
  [4/6] Generating i915_tests.html with a custom command.
  [5/6] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  ERROR: Missing documentation for igt@kms_async_flips@atomic-async-flip
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1733165237:step_script
  section_start:1733165237:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1733165281:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/67549547):
  [1920/1924] Compiling C object 'runner/runner@@runner_test@exe/runner_tests.c.o'.
  [1921/1924] Generating xe_tests.html with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/853] Generating version.h with a custom command.
  [2/6] Linking target runner/runner_test.
  [3/6] Generating intel-ci-tests with a custom command.
  [4/6] Generating i915_tests.html with a custom command.
  [5/6] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  ERROR: Missing documentation for igt@kms_async_flips@atomic-async-flip
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1733165237:step_script
  section_start:1733165237:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1733165281:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1321671
