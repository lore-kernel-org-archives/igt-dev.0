Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests/syncobj=5Ftimelin?=
 =?utf-8?q?e=3A_test_delayed_submission_with=2C_WAIT=5FAVAILABLE?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Erik Kurzinger" <ekurzinger@nvidia.com>
Date: Fri, 12 Jan 2024 22:28:25 -0000
Message-ID: <170509850565.338258.937818085542498676@5338d5abeb45>
References: <58b60f0a-f28b-42b5-b94b-91c8a5db8465@nvidia.com>
In-Reply-To: <58b60f0a-f28b-42b5-b94b-91c8a5db8465@nvidia.com>
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

Series: tests/syncobj_timeline: test delayed submission with, WAIT_AVAILABLE
URL   : https://patchwork.freedesktop.org/series/128742/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1076865 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/53689306):
  [1652/1656] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/733] Generating version.h with a custom command.
  [2/6] Linking target runner/runner_test.
  [3/6] Linking target assembler/intel-gen4asm.
  [4/6] Generating kms_tests.html with a custom command.
  [5/6] Generating i915_tests.rst with a custom command.
  FAILED: docs/testplan/i915_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json --rest docs/testplan/i915_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Missing documentation for igt@syncobj_timeline@wait-all-available-delayed-submit
  Warning: Missing documentation for igt@syncobj_timeline@wait-available-delayed-submit
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1705098197:step_script
  section_start:1705098197:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1705098198:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/53689301):
  Please refer: docs/test_documentation.md for more details
  [1658/1662] Generating kms_tests.rst with a custom command.
  [1659/1662] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/735] Generating version.h with a custom command.
  [2/5] Linking target runner/runner_test.
  [3/5] Generating i915_tests.rst with a custom command.
  FAILED: docs/testplan/i915_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json --rest docs/testplan/i915_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Missing documentation for igt@syncobj_timeline@wait-all-available-delayed-submit
  Warning: Missing documentation for igt@syncobj_timeline@wait-available-delayed-submit
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1705098194:step_script
  section_start:1705098194:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1705098194:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/53689305):
  Warning: Missing documentation for igt@syncobj_timeline@wait-available-delayed-submit
  Please refer: docs/test_documentation.md for more details
  [1660/1662] Generating kms_tests.rst with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/735] Generating version.h with a custom command.
  [2/4] Generating kms_tests.html with a custom command.
  [3/4] Generating i915_tests.rst with a custom command.
  FAILED: docs/testplan/i915_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json --rest docs/testplan/i915_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Missing documentation for igt@syncobj_timeline@wait-all-available-delayed-submit
  Warning: Missing documentation for igt@syncobj_timeline@wait-available-delayed-submit
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1705098222:step_script
  section_start:1705098222:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1705098223:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/53689304):
  Please refer: docs/test_documentation.md for more details
  [1498/1502] Generating kms_tests.rst with a custom command.
  [1499/1502] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/687] Generating version.h with a custom command.
  [2/5] Linking target runner/runner_test.
  [3/5] Generating i915_tests.rst with a custom command.
  FAILED: docs/testplan/i915_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json --rest docs/testplan/i915_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Missing documentation for igt@syncobj_timeline@wait-all-available-delayed-submit
  Warning: Missing documentation for igt@syncobj_timeline@wait-available-delayed-submit
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1705098195:step_script
  section_start:1705098195:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1705098196:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/53689302):
  Please refer: docs/test_documentation.md for more details
  [1658/1662] Generating kms_tests.rst with a custom command.
  [1659/1662] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/735] Generating version.h with a custom command.
  [2/5] Linking target runner/runner_test.
  [3/5] Generating i915_tests.rst with a custom command.
  FAILED: docs/testplan/i915_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json --rest docs/testplan/i915_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Missing documentation for igt@syncobj_timeline@wait-all-available-delayed-submit
  Warning: Missing documentation for igt@syncobj_timeline@wait-available-delayed-submit
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1705098192:step_script
  section_start:1705098192:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1705098193:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/53689303):
  Please refer: docs/test_documentation.md for more details
  [1658/1662] Generating kms_tests.rst with a custom command.
  [1659/1662] Compiling C object 'runner/runner@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/735] Generating version.h with a custom command.
  [2/5] Linking target runner/runner_test.
  [3/5] Generating i915_tests.rst with a custom command.
  FAILED: docs/testplan/i915_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json --rest docs/testplan/i915_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Missing documentation for igt@syncobj_timeline@wait-all-available-delayed-submit
  Warning: Missing documentation for igt@syncobj_timeline@wait-available-delayed-submit
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1705098197:step_script
  section_start:1705098197:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1705098197:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1076865
