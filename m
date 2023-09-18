Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Mon, 18 Sep 2023 11:51:58 -0000
Message-ID: <169503791817.32416.14506597975835637091@emeril.freedesktop.org>
References: <20230918075448.247197-1-swati2.sharma@intel.com>
In-Reply-To: <20230918075448.247197-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/kms=5Fvblank=3A_Test_cleanup_and_dynamic_conversion?=
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

Series: tests/kms_vblank: Test cleanup and dynamic conversion
URL   : https://patchwork.freedesktop.org/series/123847/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/988509 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/49131355):
                      ~~~~~~~~~~~~~~^~~~~~
  ../tests/kms_vblank.c:652:52: error: incompatible type for argument 2 of ‘pipe_output_combo_valid’
      if (!pipe_output_combo_valid(&data.display, data.output, data.pipe))
                                                  ~~~~^~~~~~~
  ../tests/kms_vblank.c:266:14: note: expected ‘enum pipe’ but argument is of type ‘igt_output_t *’ {aka ‘struct <anonymous> *’}
      enum pipe pipe, igt_output_t *output)
      ~~~~~~~~~~^~~~
  ../tests/kms_vblank.c:652:65: error: incompatible type for argument 3 of ‘pipe_output_combo_valid’
      if (!pipe_output_combo_valid(&data.display, data.output, data.pipe))
                                                               ~~~~^~~~~
  ../tests/kms_vblank.c:266:34: note: expected ‘igt_output_t *’ {aka ‘struct <anonymous> *’} but argument is of type ‘enum pipe’
      enum pipe pipe, igt_output_t *output)
                      ~~~~~~~~~~~~~~^~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1695037838:step_script
  section_start:1695037838:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1695037839:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/49131358):
                      ~~~~~~~~~~~~~~^~~~~~
  ../tests/kms_vblank.c:652:52: error: incompatible type for argument 2 of ‘pipe_output_combo_valid’
      if (!pipe_output_combo_valid(&data.display, data.output, data.pipe))
                                                  ~~~~^~~~~~~
  ../tests/kms_vblank.c:266:14: note: expected ‘enum pipe’ but argument is of type ‘igt_output_t *’ {aka ‘struct <anonymous> *’}
      enum pipe pipe, igt_output_t *output)
      ~~~~~~~~~~^~~~
  ../tests/kms_vblank.c:652:65: error: incompatible type for argument 3 of ‘pipe_output_combo_valid’
      if (!pipe_output_combo_valid(&data.display, data.output, data.pipe))
                                                               ~~~~^~~~~
  ../tests/kms_vblank.c:266:34: note: expected ‘igt_output_t *’ {aka ‘struct <anonymous> *’} but argument is of type ‘enum pipe’
      enum pipe pipe, igt_output_t *output)
                      ~~~~~~~~~~~~~~^~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1695037867:step_script
  section_start:1695037867:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1695037868:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/49131357):
                      ~~~~~~~~~~~~~~^~~~~~
  ../tests/kms_vblank.c:652:52: error: incompatible type for argument 2 of ‘pipe_output_combo_valid’
      if (!pipe_output_combo_valid(&data.display, data.output, data.pipe))
                                                  ~~~~^~~~~~~
  ../tests/kms_vblank.c:266:14: note: expected ‘enum pipe’ but argument is of type ‘igt_output_t *’ {aka ‘struct <anonymous> *’}
      enum pipe pipe, igt_output_t *output)
      ~~~~~~~~~~^~~~
  ../tests/kms_vblank.c:652:65: error: incompatible type for argument 3 of ‘pipe_output_combo_valid’
      if (!pipe_output_combo_valid(&data.display, data.output, data.pipe))
                                                               ~~~~^~~~~
  ../tests/kms_vblank.c:266:34: note: expected ‘igt_output_t *’ {aka ‘struct <anonymous> *’} but argument is of type ‘enum pipe’
      enum pipe pipe, igt_output_t *output)
                      ~~~~~~~~~~~~~~^~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1695037849:step_script
  section_start:1695037849:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1695037849:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/49131359):
                      ~~~~~~~~~~~~~~^~~~~~
  ../tests/kms_vblank.c:652:52: error: incompatible type for argument 2 of ‘pipe_output_combo_valid’
      if (!pipe_output_combo_valid(&data.display, data.output, data.pipe))
                                                  ~~~~^~~~~~~
  ../tests/kms_vblank.c:266:14: note: expected ‘enum pipe’ but argument is of type ‘igt_output_t *’ {aka ‘struct <anonymous> *’}
      enum pipe pipe, igt_output_t *output)
      ~~~~~~~~~~^~~~
  ../tests/kms_vblank.c:652:65: error: incompatible type for argument 3 of ‘pipe_output_combo_valid’
      if (!pipe_output_combo_valid(&data.display, data.output, data.pipe))
                                                               ~~~~^~~~~
  ../tests/kms_vblank.c:266:34: note: expected ‘igt_output_t *’ {aka ‘struct <anonymous> *’} but argument is of type ‘enum pipe’
      enum pipe pipe, igt_output_t *output)
                      ~~~~~~~~~~~~~~^~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1695037855:step_script
  section_start:1695037855:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1695037856:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/49131356):
  [549/554] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt3.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/102] Generating version.h with a custom command.
  [2/7] Linking target lib/libi915_perf.so.1.5.
  [3/7] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.so.1.5.symbols'.
  [4/7] Linking target tools/i915-perf/i915-perf-configs.
  [5/7] Linking target tools/i915-perf/i915-perf-recorder.
  [6/7] Linking target tools/i915-perf/i915-perf-reader.
  [7/7] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst
  /builds/gfx-ci/igt-ci-tags/tests/intel/../kms_vblank.c:subtest igt@kms_vblank@pipe-%s-ts-continuation-modeset-rpm needs 1 arguments but only 0 are defined.
  ninja: build stopped: subcommand failed.
  section_end:1695037830:step_script
  section_start:1695037830:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1695037831:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/49131350):
        |                                                    |
        |                                                    igt_output_t * {aka struct <anonymous> *}
  ../tests/kms_vblank.c:266:14: note: expected ‘enum pipe’ but argument is of type ‘igt_output_t *’ {aka ‘struct <anonymous> *’}
    266 |    enum pipe pipe, igt_output_t *output)
        |    ~~~~~~~~~~^~~~
  ../tests/kms_vblank.c:652:65: error: incompatible type for argument 3 of ‘pipe_output_combo_valid’
    652 |    if (!pipe_output_combo_valid(&data.display, data.output, data.pipe))
        |                                                             ~~~~^~~~~
        |                                                                 |
        |                                                                 enum pipe
  ../tests/kms_vblank.c:266:34: note: expected ‘igt_output_t *’ {aka ‘struct <anonymous> *’} but argument is of type ‘enum pipe’
    266 |    enum pipe pipe, igt_output_t *output)
        |                    ~~~~~~~~~~~~~~^~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1695037838:step_script
  section_start:1695037838:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1695037839:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/49131354):
  [1640/1643] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  /builds/gfx-ci/igt-ci-tags/tests/intel/../kms_vblank.c:subtest igt@kms_vblank@pipe-%s-ts-continuation-modeset-rpm needs 1 arguments but only 0 are defined.
  [1641/1643] Generating i915_tests.rst with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/726] Generating version.h with a custom command.
  [2/4] Generating i915_tests.html with a custom command.
  [3/4] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  /builds/gfx-ci/igt-ci-tags/tests/intel/../kms_vblank.c:subtest igt@kms_vblank@pipe-%s-ts-continuation-modeset-rpm needs 1 arguments but only 0 are defined.
  ninja: build stopped: subcommand failed.
  section_end:1695037875:step_script
  section_start:1695037875:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1695037875:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/49131353):
        |                                                    |
        |                                                    igt_output_t * {aka struct <anonymous> *}
  ../tests/kms_vblank.c:266:14: note: expected ‘enum pipe’ but argument is of type ‘igt_output_t *’ {aka ‘struct <anonymous> *’}
    266 |    enum pipe pipe, igt_output_t *output)
        |    ~~~~~~~~~~^~~~
  ../tests/kms_vblank.c:652:65: error: incompatible type for argument 3 of ‘pipe_output_combo_valid’
    652 |    if (!pipe_output_combo_valid(&data.display, data.output, data.pipe))
        |                                                             ~~~~^~~~~
        |                                                                 |
        |                                                                 enum pipe
  ../tests/kms_vblank.c:266:34: note: expected ‘igt_output_t *’ {aka ‘struct <anonymous> *’} but argument is of type ‘enum pipe’
    266 |    enum pipe pipe, igt_output_t *output)
        |                    ~~~~~~~~~~~~~~^~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1695037840:step_script
  section_start:1695037840:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1695037840:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/49131351):
        |                                                    |
        |                                                    igt_output_t * {aka struct <anonymous> *}
  ../tests/kms_vblank.c:266:14: note: expected ‘enum pipe’ but argument is of type ‘igt_output_t *’ {aka ‘struct <anonymous> *’}
    266 |    enum pipe pipe, igt_output_t *output)
        |    ~~~~~~~~~~^~~~
  ../tests/kms_vblank.c:652:65: error: incompatible type for argument 3 of ‘pipe_output_combo_valid’
    652 |    if (!pipe_output_combo_valid(&data.display, data.output, data.pipe))
        |                                                             ~~~~^~~~~
        |                                                                 |
        |                                                                 enum pipe
  ../tests/kms_vblank.c:266:34: note: expected ‘igt_output_t *’ {aka ‘struct <anonymous> *’} but argument is of type ‘enum pipe’
    266 |    enum pipe pipe, igt_output_t *output)
        |                    ~~~~~~~~~~~~~~^~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1695037841:step_script
  section_start:1695037841:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1695037842:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/49131352):
        |                                                    |
        |                                                    igt_output_t * {aka struct <anonymous> *}
  ../tests/kms_vblank.c:266:14: note: expected ‘enum pipe’ but argument is of type ‘igt_output_t *’ {aka ‘struct <anonymous> *’}
    266 |    enum pipe pipe, igt_output_t *output)
        |    ~~~~~~~~~~^~~~
  ../tests/kms_vblank.c:652:65: error: incompatible type for argument 3 of ‘pipe_output_combo_valid’
    652 |    if (!pipe_output_combo_valid(&data.display, data.output, data.pipe))
        |                                                             ~~~~^~~~~
        |                                                                 |
        |                                                                 enum pipe
  ../tests/kms_vblank.c:266:34: note: expected ‘igt_output_t *’ {aka ‘struct <anonymous> *’} but argument is of type ‘enum pipe’
    266 |    enum pipe pipe, igt_output_t *output)
        |                    ~~~~~~~~~~~~~~^~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1695037840:step_script
  section_start:1695037840:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1695037841:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/988509
