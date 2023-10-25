Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Wed, 25 Oct 2023 16:52:40 -0000
Message-ID: <169825276032.20490.17738848977164915752@emeril.freedesktop.org>
References: <20231025120256.27326-1-nidhi1.gupta@intel.com>
In-Reply-To: <20231025120256.27326-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/kms=5Ffrontbuffer=5Ftracking=3A_Extend_the_test_to_enable_?=
 =?utf-8?q?FBC_for_each_plane_=28rev4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_frontbuffer_tracking: Extend the test to enable FBC for each plane (rev4)
URL   : https://patchwork.freedesktop.org/series/123724/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1018792 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/50757436):
  [1640/1642] Generating i915_tests.html with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/727] Generating version.h with a custom command.
  [2/4] Linking target runner/runner_test.
  [3/4] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Documented igt@kms_frontbuffer_tracking@plane-0-fbc-rte doesn't exist on source files
  Warning: Documented igt@kms_frontbuffer_tracking@plane-1-fbc-rte doesn't exist on source files
  Warning: Documented igt@kms_frontbuffer_tracking@plane-2-fbc-rte doesn't exist on source files
  Warning: Missing documentation for igt@kms_frontbuffer_tracking@plane-fbc-rte
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1698252389:step_script
  section_start:1698252389:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698252391:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/50757431):
  [1646/1648] Generating i915_tests.html with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/729] Generating version.h with a custom command.
  [2/4] Linking target runner/runner_test.
  [3/4] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Documented igt@kms_frontbuffer_tracking@plane-0-fbc-rte doesn't exist on source files
  Warning: Documented igt@kms_frontbuffer_tracking@plane-1-fbc-rte doesn't exist on source files
  Warning: Documented igt@kms_frontbuffer_tracking@plane-2-fbc-rte doesn't exist on source files
  Warning: Missing documentation for igt@kms_frontbuffer_tracking@plane-fbc-rte
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1698252359:step_script
  section_start:1698252359:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698252361:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/50757435):
  Please refer: docs/test_documentation.md for more details
  [1647/1648] Generating i915_tests.html with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/729] Generating version.h with a custom command.
  [2/3] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Documented igt@kms_frontbuffer_tracking@plane-0-fbc-rte doesn't exist on source files
  Warning: Documented igt@kms_frontbuffer_tracking@plane-1-fbc-rte doesn't exist on source files
  Warning: Documented igt@kms_frontbuffer_tracking@plane-2-fbc-rte doesn't exist on source files
  Warning: Missing documentation for igt@kms_frontbuffer_tracking@plane-fbc-rte
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1698252382:step_script
  section_start:1698252382:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698252383:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/50757434):
  [1490/1492] Generating i915_tests.html with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/683] Generating version.h with a custom command.
  [2/4] Linking target runner/runner_test.
  [3/4] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Documented igt@kms_frontbuffer_tracking@plane-0-fbc-rte doesn't exist on source files
  Warning: Documented igt@kms_frontbuffer_tracking@plane-1-fbc-rte doesn't exist on source files
  Warning: Documented igt@kms_frontbuffer_tracking@plane-2-fbc-rte doesn't exist on source files
  Warning: Missing documentation for igt@kms_frontbuffer_tracking@plane-fbc-rte
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1698252359:step_script
  section_start:1698252359:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698252360:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/50757432):
  [1646/1648] Generating i915_tests.html with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/729] Generating version.h with a custom command.
  [2/4] Linking target runner/runner_test.
  [3/4] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Documented igt@kms_frontbuffer_tracking@plane-0-fbc-rte doesn't exist on source files
  Warning: Documented igt@kms_frontbuffer_tracking@plane-1-fbc-rte doesn't exist on source files
  Warning: Documented igt@kms_frontbuffer_tracking@plane-2-fbc-rte doesn't exist on source files
  Warning: Missing documentation for igt@kms_frontbuffer_tracking@plane-fbc-rte
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1698252357:step_script
  section_start:1698252357:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698252358:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/50757433):
  [1646/1648] Generating i915_tests.html with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/729] Generating version.h with a custom command.
  [2/4] Linking target runner/runner_test.
  [3/4] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Documented igt@kms_frontbuffer_tracking@plane-0-fbc-rte doesn't exist on source files
  Warning: Documented igt@kms_frontbuffer_tracking@plane-1-fbc-rte doesn't exist on source files
  Warning: Documented igt@kms_frontbuffer_tracking@plane-2-fbc-rte doesn't exist on source files
  Warning: Missing documentation for igt@kms_frontbuffer_tracking@plane-fbc-rte
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1698252357:step_script
  section_start:1698252357:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698252359:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1018792
