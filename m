Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Wed, 25 Oct 2023 07:09:53 -0000
Message-ID: <169821779322.20487.246393917867180890@emeril.freedesktop.org>
References: <20231025053157.15470-1-nidhi1.gupta@intel.com>
In-Reply-To: <20231025053157.15470-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/kms=5Ffrontbuffer=5Ftracking=3A_Extend_the_test_to_enable_?=
 =?utf-8?q?FBC_for_each_plane_=28rev3=29?=
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

Series: tests/kms_frontbuffer_tracking: Extend the test to enable FBC for each plane (rev3)
URL   : https://patchwork.freedesktop.org/series/123724/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1018261 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/50727644):
    ^~~
  ../tests/intel/kms_frontbuffer_tracking.c:5024:3: note: in expansion of macro ‘for_each_plane_on_pipe’
     for_each_plane_on_pipe(&drm.display, prim_mode_params.pipe, plane)
     ^~~~~~~~~~~~~~~~~~~~~~
  ../tests/intel/kms_frontbuffer_tracking.c:5026:4: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the ‘for’
      if (n_planes == 3)
      ^~
  ../tests/intel/kms_frontbuffer_tracking.c:5029:26: error: incompatible type for argument 1 of ‘prepare_subtest_data’
       prepare_subtest_data(t, NULL);
                            ^
  ../tests/intel/kms_frontbuffer_tracking.c:1833:58: note: expected ‘const struct test_mode *’ but argument is of type ‘struct test_mode’
   static void prepare_subtest_data(const struct test_mode *t,
                                    ~~~~~~~~~~~~~~~~~~~~~~~~^
  ninja: build stopped: subcommand failed.
  section_end:1698217561:step_script
  section_start:1698217561:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698217562:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/50727647):
    ^~~
  ../tests/intel/kms_frontbuffer_tracking.c:5024:3: note: in expansion of macro ‘for_each_plane_on_pipe’
     for_each_plane_on_pipe(&drm.display, prim_mode_params.pipe, plane)
     ^~~~~~~~~~~~~~~~~~~~~~
  ../tests/intel/kms_frontbuffer_tracking.c:5026:4: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the ‘for’
      if (n_planes == 3)
      ^~
  ../tests/intel/kms_frontbuffer_tracking.c:5029:26: error: incompatible type for argument 1 of ‘prepare_subtest_data’
       prepare_subtest_data(t, NULL);
                            ^
  ../tests/intel/kms_frontbuffer_tracking.c:1833:58: note: expected ‘const struct test_mode *’ but argument is of type ‘struct test_mode’
   static void prepare_subtest_data(const struct test_mode *t,
                                    ~~~~~~~~~~~~~~~~~~~~~~~~^
  ninja: build stopped: subcommand failed.
  section_end:1698217570:step_script
  section_start:1698217570:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698217570:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/50727646):
    ^~~
  ../tests/intel/kms_frontbuffer_tracking.c:5024:3: note: in expansion of macro ‘for_each_plane_on_pipe’
     for_each_plane_on_pipe(&drm.display, prim_mode_params.pipe, plane)
     ^~~~~~~~~~~~~~~~~~~~~~
  ../tests/intel/kms_frontbuffer_tracking.c:5026:4: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the ‘for’
      if (n_planes == 3)
      ^~
  ../tests/intel/kms_frontbuffer_tracking.c:5029:26: error: incompatible type for argument 1 of ‘prepare_subtest_data’
       prepare_subtest_data(t, NULL);
                            ^
  ../tests/intel/kms_frontbuffer_tracking.c:1833:58: note: expected ‘const struct test_mode *’ but argument is of type ‘struct test_mode’
   static void prepare_subtest_data(const struct test_mode *t,
                                    ~~~~~~~~~~~~~~~~~~~~~~~~^
  ninja: build stopped: subcommand failed.
  section_end:1698217575:step_script
  section_start:1698217575:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698217576:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/50727648):
    ^~~
  ../tests/intel/kms_frontbuffer_tracking.c:5024:3: note: in expansion of macro ‘for_each_plane_on_pipe’
     for_each_plane_on_pipe(&drm.display, prim_mode_params.pipe, plane)
     ^~~~~~~~~~~~~~~~~~~~~~
  ../tests/intel/kms_frontbuffer_tracking.c:5026:4: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the ‘for’
      if (n_planes == 3)
      ^~
  ../tests/intel/kms_frontbuffer_tracking.c:5029:26: error: incompatible type for argument 1 of ‘prepare_subtest_data’
       prepare_subtest_data(t, NULL);
                            ^
  ../tests/intel/kms_frontbuffer_tracking.c:1833:58: note: expected ‘const struct test_mode *’ but argument is of type ‘struct test_mode’
   static void prepare_subtest_data(const struct test_mode *t,
                                    ~~~~~~~~~~~~~~~~~~~~~~~~^
  ninja: build stopped: subcommand failed.
  section_end:1698217572:step_script
  section_start:1698217572:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698217573:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/50727639):
   5024 |   for_each_plane_on_pipe(&drm.display, prim_mode_params.pipe, plane)
        |   ^~~~~~~~~~~~~~~~~~~~~~
  ../tests/intel/kms_frontbuffer_tracking.c:5026:4: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the ‘for’
   5026 |    if (n_planes == 3)
        |    ^~
  ../tests/intel/kms_frontbuffer_tracking.c:5029:26: error: incompatible type for argument 1 of ‘prepare_subtest_data’
   5029 |     prepare_subtest_data(t, NULL);
        |                          ^
        |                          |
        |                          struct test_mode
  ../tests/intel/kms_frontbuffer_tracking.c:1833:58: note: expected ‘const struct test_mode *’ but argument is of type ‘struct test_mode’
   1833 | static void prepare_subtest_data(const struct test_mode *t,
        |                                  ~~~~~~~~~~~~~~~~~~~~~~~~^
  ninja: build stopped: subcommand failed.
  section_end:1698217557:step_script
  section_start:1698217557:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698217558:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/50727643):
                                            ^~~~~
                                            clone
  /usr/include/bits/sched.h:80:12: note: 'clone' declared here
  extern int clone (int (*__fn) (void *__arg), void *__child_stack,
             ^
  ../tests/intel/kms_frontbuffer_tracking.c:5029:26: error: passing 'struct test_mode' to parameter of incompatible type 'const struct test_mode *'; take the address with &
                                  prepare_subtest_data(t, NULL);
                                                       ^
                                                       &
  ../tests/intel/kms_frontbuffer_tracking.c:1833:58: note: passing argument to parameter 't' here
  static void prepare_subtest_data(const struct test_mode *t,
                                                           ^
  5 errors generated.
  ninja: build stopped: subcommand failed.
  section_end:1698217580:step_script
  section_start:1698217580:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698217581:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/50727642):
   5024 |   for_each_plane_on_pipe(&drm.display, prim_mode_params.pipe, plane)
        |   ^~~~~~~~~~~~~~~~~~~~~~
  ../tests/intel/kms_frontbuffer_tracking.c:5026:4: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the ‘for’
   5026 |    if (n_planes == 3)
        |    ^~
  ../tests/intel/kms_frontbuffer_tracking.c:5029:26: error: incompatible type for argument 1 of ‘prepare_subtest_data’
   5029 |     prepare_subtest_data(t, NULL);
        |                          ^
        |                          |
        |                          struct test_mode
  ../tests/intel/kms_frontbuffer_tracking.c:1833:58: note: expected ‘const struct test_mode *’ but argument is of type ‘struct test_mode’
   1833 | static void prepare_subtest_data(const struct test_mode *t,
        |                                  ~~~~~~~~~~~~~~~~~~~~~~~~^
  ninja: build stopped: subcommand failed.
  section_end:1698217565:step_script
  section_start:1698217565:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698217565:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/50727640):
   5024 |   for_each_plane_on_pipe(&drm.display, prim_mode_params.pipe, plane)
        |   ^~~~~~~~~~~~~~~~~~~~~~
  ../tests/intel/kms_frontbuffer_tracking.c:5026:4: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the ‘for’
   5026 |    if (n_planes == 3)
        |    ^~
  ../tests/intel/kms_frontbuffer_tracking.c:5029:26: error: incompatible type for argument 1 of ‘prepare_subtest_data’
   5029 |     prepare_subtest_data(t, NULL);
        |                          ^
        |                          |
        |                          struct test_mode
  ../tests/intel/kms_frontbuffer_tracking.c:1833:58: note: expected ‘const struct test_mode *’ but argument is of type ‘struct test_mode’
   1833 | static void prepare_subtest_data(const struct test_mode *t,
        |                                  ~~~~~~~~~~~~~~~~~~~~~~~~^
  ninja: build stopped: subcommand failed.
  section_end:1698217566:step_script
  section_start:1698217566:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698217566:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/50727641):
   5024 |   for_each_plane_on_pipe(&drm.display, prim_mode_params.pipe, plane)
        |   ^~~~~~~~~~~~~~~~~~~~~~
  ../tests/intel/kms_frontbuffer_tracking.c:5026:4: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the ‘for’
   5026 |    if (n_planes == 3)
        |    ^~
  ../tests/intel/kms_frontbuffer_tracking.c:5029:26: error: incompatible type for argument 1 of ‘prepare_subtest_data’
   5029 |     prepare_subtest_data(t, NULL);
        |                          ^
        |                          |
        |                          struct test_mode
  ../tests/intel/kms_frontbuffer_tracking.c:1833:58: note: expected ‘const struct test_mode *’ but argument is of type ‘struct test_mode’
   1833 | static void prepare_subtest_data(const struct test_mode *t,
        |                                  ~~~~~~~~~~~~~~~~~~~~~~~~^
  ninja: build stopped: subcommand failed.
  section_end:1698217563:step_script
  section_start:1698217563:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698217564:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1018261
