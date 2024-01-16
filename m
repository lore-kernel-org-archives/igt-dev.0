Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests/kms=5Fcontent=5Fp?=
 =?utf-8?q?rotection=3A_Add_LIC_Type_1_scenario_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Date: Tue, 16 Jan 2024 11:48:16 -0000
Message-ID: <170540569657.501310.11904346849962944850@5338d5abeb45>
References: <20240112103330.169688-1-suraj.kandpal@intel.com>
In-Reply-To: <20240112103330.169688-1-suraj.kandpal@intel.com>
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

Series: tests/kms_content_protection: Add LIC Type 1 scenario (rev2)
URL   : https://patchwork.freedesktop.org/series/128714/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1079197 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/53794350):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/813] Generating version.h with a custom command.
  [2/4] Linking target runner/runner_test.
  [3/4] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Documented igt@kms_content_protection@lic-atomic doesn't exist on source files
  Warning: Documented igt@kms_content_protection@lic-atomic-dpms doesn't exist on source files
  Warning: Documented igt@kms_content_protection@lic-legacy doesn't exist on source files
  Warning: Documented igt@kms_content_protection@lic-type1 doesn't exist on source files
  Warning: Documented igt@kms_content_protection@type-0 doesn't exist on source files
  Warning: Documented igt@kms_content_protection@type-1 doesn't exist on source files
  ninja: build stopped: subcommand failed.
  section_end:1705405503:step_script
  section_start:1705405503:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1705405503:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/53794345):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/815] Generating version.h with a custom command.
  [2/4] Linking target runner/runner_test.
  [3/4] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Documented igt@kms_content_protection@lic-atomic doesn't exist on source files
  Warning: Documented igt@kms_content_protection@lic-atomic-dpms doesn't exist on source files
  Warning: Documented igt@kms_content_protection@lic-legacy doesn't exist on source files
  Warning: Documented igt@kms_content_protection@lic-type1 doesn't exist on source files
  Warning: Documented igt@kms_content_protection@type-0 doesn't exist on source files
  Warning: Documented igt@kms_content_protection@type-1 doesn't exist on source files
  ninja: build stopped: subcommand failed.
  section_end:1705405515:step_script
  section_start:1705405515:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1705405516:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/53794349):
  [1780/1781] Generating i915_tests.html with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/815] Generating version.h with a custom command.
  [2/3] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Documented igt@kms_content_protection@lic-atomic doesn't exist on source files
  Warning: Documented igt@kms_content_protection@lic-atomic-dpms doesn't exist on source files
  Warning: Documented igt@kms_content_protection@lic-legacy doesn't exist on source files
  Warning: Documented igt@kms_content_protection@lic-type1 doesn't exist on source files
  Warning: Documented igt@kms_content_protection@type-0 doesn't exist on source files
  Warning: Documented igt@kms_content_protection@type-1 doesn't exist on source files
  ninja: build stopped: subcommand failed.
  section_end:1705405538:step_script
  section_start:1705405538:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1705405539:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/53794348):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/767] Generating version.h with a custom command.
  [2/4] Linking target runner/runner_test.
  [3/4] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Documented igt@kms_content_protection@lic-atomic doesn't exist on source files
  Warning: Documented igt@kms_content_protection@lic-atomic-dpms doesn't exist on source files
  Warning: Documented igt@kms_content_protection@lic-legacy doesn't exist on source files
  Warning: Documented igt@kms_content_protection@lic-type1 doesn't exist on source files
  Warning: Documented igt@kms_content_protection@type-0 doesn't exist on source files
  Warning: Documented igt@kms_content_protection@type-1 doesn't exist on source files
  ninja: build stopped: subcommand failed.
  section_end:1705405503:step_script
  section_start:1705405503:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1705405504:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/53794346):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/815] Generating version.h with a custom command.
  [2/4] Linking target runner/runner_test.
  [3/4] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Documented igt@kms_content_protection@lic-atomic doesn't exist on source files
  Warning: Documented igt@kms_content_protection@lic-atomic-dpms doesn't exist on source files
  Warning: Documented igt@kms_content_protection@lic-legacy doesn't exist on source files
  Warning: Documented igt@kms_content_protection@lic-type1 doesn't exist on source files
  Warning: Documented igt@kms_content_protection@type-0 doesn't exist on source files
  Warning: Documented igt@kms_content_protection@type-1 doesn't exist on source files
  ninja: build stopped: subcommand failed.
  section_end:1705405519:step_script
  section_start:1705405519:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1705405519:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/53794347):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/815] Generating version.h with a custom command.
  [2/4] Linking target runner/runner_test.
  [3/4] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Documented igt@kms_content_protection@lic-atomic doesn't exist on source files
  Warning: Documented igt@kms_content_protection@lic-atomic-dpms doesn't exist on source files
  Warning: Documented igt@kms_content_protection@lic-legacy doesn't exist on source files
  Warning: Documented igt@kms_content_protection@lic-type1 doesn't exist on source files
  Warning: Documented igt@kms_content_protection@type-0 doesn't exist on source files
  Warning: Documented igt@kms_content_protection@type-1 doesn't exist on source files
  ninja: build stopped: subcommand failed.
  section_end:1705405516:step_script
  section_start:1705405516:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1705405517:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1079197
