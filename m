Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Fri, 10 Nov 2023 18:54:10 -0000
Message-ID: <169964245012.31676.11086930600926755828@emeril.freedesktop.org>
References: <20231110163811.24158-1-andrealmeid@igalia.com>
In-Reply-To: <20231110163811.24158-1-andrealmeid@igalia.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_A?=
 =?utf-8?q?dd_test_for_atomic_async_page_flip?=
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

Series: Add test for atomic async page flip
URL   : https://patchwork.freedesktop.org/series/126282/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1031373 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/51451523):
  [1644/1647] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  [1645/1647] Generating i915_tests.html with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/730] Generating version.h with a custom command.
  [2/4] Linking target runner/runner_test.
  [3/4] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Missing documentation for igt@kms_async_flips@atomic-async-flip
  Warning: Missing documentation for igt@kms_async_flips@invalid-atomic-async-flip
  Warning: Missing documentation for igt@kms_async_flips@modeset-atomic-async-flip
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1699642173:step_script
  section_start:1699642173:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1699642174:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/51451518):
  [1650/1653] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  [1651/1653] Generating i915_tests.html with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/732] Generating version.h with a custom command.
  [2/4] Linking target runner/runner_test.
  [3/4] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Missing documentation for igt@kms_async_flips@atomic-async-flip
  Warning: Missing documentation for igt@kms_async_flips@invalid-atomic-async-flip
  Warning: Missing documentation for igt@kms_async_flips@modeset-atomic-async-flip
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1699642161:step_script
  section_start:1699642161:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1699642162:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/51451522):
  Warning: Missing documentation for igt@kms_async_flips@modeset-atomic-async-flip
  Please refer: docs/test_documentation.md for more details
  [1652/1653] Generating i915_tests.html with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/732] Generating version.h with a custom command.
  [2/3] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Missing documentation for igt@kms_async_flips@atomic-async-flip
  Warning: Missing documentation for igt@kms_async_flips@invalid-atomic-async-flip
  Warning: Missing documentation for igt@kms_async_flips@modeset-atomic-async-flip
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1699642182:step_script
  section_start:1699642182:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1699642182:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/51451521):
  [1492/1495] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  [1493/1495] Generating i915_tests.html with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/685] Generating version.h with a custom command.
  [2/4] Linking target runner/runner_test.
  [3/4] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Missing documentation for igt@kms_async_flips@atomic-async-flip
  Warning: Missing documentation for igt@kms_async_flips@invalid-atomic-async-flip
  Warning: Missing documentation for igt@kms_async_flips@modeset-atomic-async-flip
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1699642174:step_script
  section_start:1699642174:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1699642175:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/51451519):
  [1650/1653] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  [1651/1653] Generating i915_tests.html with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/732] Generating version.h with a custom command.
  [2/4] Linking target runner/runner_test.
  [3/4] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Missing documentation for igt@kms_async_flips@atomic-async-flip
  Warning: Missing documentation for igt@kms_async_flips@invalid-atomic-async-flip
  Warning: Missing documentation for igt@kms_async_flips@modeset-atomic-async-flip
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1699642161:step_script
  section_start:1699642161:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1699642162:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/51451520):
  [1650/1653] Compiling C object 'runner/runner@@runner_test@exe/runner_tests.c.o'.
  [1651/1653] Generating i915_tests.html with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/732] Generating version.h with a custom command.
  [2/4] Linking target runner/runner_test.
  [3/4] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Missing documentation for igt@kms_async_flips@atomic-async-flip
  Warning: Missing documentation for igt@kms_async_flips@invalid-atomic-async-flip
  Warning: Missing documentation for igt@kms_async_flips@modeset-atomic-async-flip
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1699642175:step_script
  section_start:1699642175:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1699642176:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1031373
