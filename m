Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98A0C25B74
	for <igt-dev@archiver.kernel.org>; Mon, 27 May 2024 06:36:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AAB310F84C;
	Mon, 27 May 2024 06:36:21 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00CDD10F84C;
 Mon, 27 May 2024 06:36:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests/intel/kms=5Fpm=5F?=
 =?utf-8?q?dc=3A_Add_a_new_test_to_validate_the_deep_sleep_state_during_exte?=
 =?utf-8?q?nded_vblank?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 27 May 2024 06:36:19 -0000
Message-ID: <171679177900.2211934.18317915861598299868@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240527041908.513920-1-jeevan.b@intel.com>
In-Reply-To: <20240527041908.513920-1-jeevan.b@intel.com>
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

Series: tests/intel/kms_pm_dc: Add a new test to validate the deep sleep state during extended vblank
URL   : https://patchwork.freedesktop.org/series/134058/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1186674 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59173459):
  [1796/1801] Generating intel-ci-tests with a custom command.
  [1797/1801] Generating xe_tests.html with a custom command.
  [1798/1801] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/824] Generating version.h with a custom command.
  [2/6] Linking target runner/runner_test.
  [3/6] Generating i915_tests.html with a custom command.
  [4/6] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Missing documentation for igt@kms_pm_dc@deep-pkgc
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1716791548:step_script
  section_start:1716791548:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1716791549:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59173454):
  [1803/1807] Generating xe_tests.html with a custom command.
  [1804/1807] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/826] Generating version.h with a custom command.
  [2/6] Linking target runner/runner_test.
  [3/6] Generating intel-ci-tests with a custom command.
  [4/6] Generating i915_tests.html with a custom command.
  [5/6] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Missing documentation for igt@kms_pm_dc@deep-pkgc
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1716791553:step_script
  section_start:1716791553:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1716791554:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59173458):
  [1803/1807] Generating i915_tests.rst with a custom command.
  [1804/1807] Generating intel-ci-tests with a custom command.
  [1805/1807] Generating xe_tests.html with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/826] Generating version.h with a custom command.
  [2/5] Generating i915_tests.html with a custom command.
  [3/5] Generating intel-ci-tests with a custom command.
  [4/5] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Missing documentation for igt@kms_pm_dc@deep-pkgc
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1716791526:step_script
  section_start:1716791526:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1716791526:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59173457):
  [1635/1639] Generating xe_tests.html with a custom command.
  [1636/1639] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/775] Generating version.h with a custom command.
  [2/6] Linking target runner/runner_test.
  [3/6] Generating intel-ci-tests with a custom command.
  [4/6] Generating i915_tests.html with a custom command.
  [5/6] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Missing documentation for igt@kms_pm_dc@deep-pkgc
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1716791549:step_script
  section_start:1716791549:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1716791550:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59173455):
  [1803/1807] Generating xe_tests.html with a custom command.
  [1804/1807] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/826] Generating version.h with a custom command.
  [2/6] Linking target runner/runner_test.
  [3/6] Generating intel-ci-tests with a custom command.
  [4/6] Generating i915_tests.html with a custom command.
  [5/6] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Missing documentation for igt@kms_pm_dc@deep-pkgc
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1716791551:step_script
  section_start:1716791551:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1716791552:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59173456):
  [1803/1807] Generating xe_tests.html with a custom command.
  [1804/1807] Compiling C object 'runner/runner@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/826] Generating version.h with a custom command.
  [2/6] Linking target runner/runner_test.
  [3/6] Generating intel-ci-tests with a custom command.
  [4/6] Generating i915_tests.html with a custom command.
  [5/6] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Missing documentation for igt@kms_pm_dc@deep-pkgc
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1716791506:step_script
  section_start:1716791506:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1716791507:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1186674
