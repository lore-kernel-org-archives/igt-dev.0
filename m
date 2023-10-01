Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Date: Sun, 01 Oct 2023 10:54:36 -0000
Message-ID: <169615767662.10311.1349469029110237856@emeril.freedesktop.org>
References: <20231001103006.431894-1-kunal1.joshi@intel.com>
In-Reply-To: <20231001103006.431894-1-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_A?=
 =?utf-8?q?dd_test_for_hotplug_validation_in_simulation?=
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

Series: Add test for hotplug validation in simulation
URL   : https://patchwork.freedesktop.org/series/124491/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/999056 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/49725139):
  Warning: Missing documentation for igt@kms_simulation_hpd@sim-hpd
  Please refer: docs/test_documentation.md for more details
  [1641/1644] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  [1642/1644] Generating i915_tests.html with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/728] Generating version.h with a custom command.
  [2/4] Linking target runner/runner_test.
  [3/4] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Missing documentation for igt@kms_simulation_hpd@sim-hpd
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1696157499:step_script
  section_start:1696157499:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1696157500:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/49725134):
  Warning: Missing documentation for igt@kms_simulation_hpd@sim-hpd
  Please refer: docs/test_documentation.md for more details
  [1647/1650] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  [1648/1650] Generating i915_tests.html with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/730] Generating version.h with a custom command.
  [2/4] Linking target runner/runner_test.
  [3/4] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Missing documentation for igt@kms_simulation_hpd@sim-hpd
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1696157511:step_script
  section_start:1696157511:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1696157512:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/49725138):
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Missing documentation for igt@kms_simulation_hpd@sim-hpd
  Please refer: docs/test_documentation.md for more details
  [1649/1650] Generating i915_tests.html with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/730] Generating version.h with a custom command.
  [2/3] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Missing documentation for igt@kms_simulation_hpd@sim-hpd
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1696157529:step_script
  section_start:1696157529:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1696157529:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/49725137):
  Warning: Missing documentation for igt@kms_simulation_hpd@sim-hpd
  Please refer: docs/test_documentation.md for more details
  [1491/1494] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  [1492/1494] Generating i915_tests.html with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/684] Generating version.h with a custom command.
  [2/4] Linking target runner/runner_test.
  [3/4] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Missing documentation for igt@kms_simulation_hpd@sim-hpd
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1696157499:step_script
  section_start:1696157499:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1696157500:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/49725135):
  Warning: Missing documentation for igt@kms_simulation_hpd@sim-hpd
  Please refer: docs/test_documentation.md for more details
  [1647/1650] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  [1648/1650] Generating i915_tests.html with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/730] Generating version.h with a custom command.
  [2/4] Linking target runner/runner_test.
  [3/4] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Missing documentation for igt@kms_simulation_hpd@sim-hpd
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1696157511:step_script
  section_start:1696157511:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1696157512:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/49725136):
  Warning: Missing documentation for igt@kms_simulation_hpd@sim-hpd
  Please refer: docs/test_documentation.md for more details
  [1647/1650] Compiling C object 'runner/runner@@runner_test@exe/runner_tests.c.o'.
  [1648/1650] Generating i915_tests.html with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/730] Generating version.h with a custom command.
  [2/4] Linking target runner/runner_test.
  [3/4] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Missing documentation for igt@kms_simulation_hpd@sim-hpd
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1696157509:step_script
  section_start:1696157509:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1696157510:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/999056
