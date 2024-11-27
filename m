Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E32BD6ACD4
	for <igt-dev@archiver.kernel.org>; Wed, 27 Nov 2024 13:43:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E93D10EADC;
	Wed, 27 Nov 2024 13:43:51 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30FD610EADC;
 Wed, 27 Nov 2024 13:43:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests/kms=5Finvalid=5Fm?=
 =?utf-8?q?ode=3A_Attempt_divide-by-zero_in_drm=5Fmode=5Fvrefresh=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 27 Nov 2024 13:43:50 -0000
Message-ID: <173271503019.3741769.9615319983679137784@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241127110012.13349-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20241127110012.13349-1-ville.syrjala@linux.intel.com>
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

Series: tests/kms_invalid_mode: Attempt divide-by-zero in drm_mode_vrefresh()
URL   : https://patchwork.freedesktop.org/series/141836/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1318201 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/67292399):
  [1912/1916] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  [1913/1916] Generating xe_tests.html with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/851] Generating version.h with a custom command.
  [2/6] Linking target runner/runner_test.
  [3/6] Generating intel-ci-tests with a custom command.
  [4/6] Generating i915_tests.html with a custom command.
  [5/6] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  ERROR: Missing documentation for igt@kms_invalid_mode@overflow-vrefresh
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1732714795:step_script
  section_start:1732714795:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1732714795:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/67292394):
  [1918/1922] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  [1919/1922] Generating xe_tests.html with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/853] Generating version.h with a custom command.
  [2/6] Linking target runner/runner_test.
  [3/6] Generating intel-ci-tests with a custom command.
  [4/6] Generating i915_tests.html with a custom command.
  [5/6] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  ERROR: Missing documentation for igt@kms_invalid_mode@overflow-vrefresh
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1732714758:step_script
  section_start:1732714758:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1732714758:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/67292398):
  [1918/1922] Generating i915_tests.rst with a custom command.
  [1919/1922] Generating intel-ci-tests with a custom command.
  [1920/1922] Generating xe_tests.html with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/853] Generating version.h with a custom command.
  [2/5] Generating i915_tests.html with a custom command.
  [3/5] Generating intel-ci-tests with a custom command.
  [4/5] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  ERROR: Missing documentation for igt@kms_invalid_mode@overflow-vrefresh
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1732714807:step_script
  section_start:1732714807:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1732714808:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/67292397):
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
  ERROR: Missing documentation for igt@kms_invalid_mode@overflow-vrefresh
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1732714761:step_script
  section_start:1732714761:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1732714762:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/67292395):
  [1918/1922] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  [1919/1922] Generating xe_tests.html with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/853] Generating version.h with a custom command.
  [2/6] Linking target runner/runner_test.
  [3/6] Generating intel-ci-tests with a custom command.
  [4/6] Generating i915_tests.html with a custom command.
  [5/6] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  ERROR: Missing documentation for igt@kms_invalid_mode@overflow-vrefresh
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1732714783:step_script
  section_start:1732714783:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1732714783:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/67292396):
  [1918/1922] Compiling C object 'runner/runner@@runner_test@exe/runner_tests.c.o'.
  [1919/1922] Generating xe_tests.html with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/853] Generating version.h with a custom command.
  [2/6] Linking target runner/runner_test.
  [3/6] Generating intel-ci-tests with a custom command.
  [4/6] Generating i915_tests.html with a custom command.
  [5/6] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  ERROR: Missing documentation for igt@kms_invalid_mode@overflow-vrefresh
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1732714760:step_script
  section_start:1732714760:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1732714761:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1318201
