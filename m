Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 03 Sep 2021 16:23:10 -0000
Message-ID: <163068619059.21414.11937418775054059612@emeril.freedesktop.org>
References: <20210903161532.25874-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20210903161532.25874-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/kms=5Fcolor=3A_3D_LUT_tests_=28rev4=29?=
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_color: 3D LUT tests (rev4)
URL   : https://patchwork.freedesktop.org/series/90165/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/394644 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/13373823):
     invalid_degamma_lut_sizes(&data);
     ^~~~~~~~~~~~~~~~~~~~~~~~~
  In file included from ../tests/kms_color_chamelium.c:25:
  ../tests/kms_color_helper.h:124:6: note: declared here
   void invalid_degamma_lut_sizes(data_t *data, enum pipe p);
        ^~~~~~~~~~~~~~~~~~~~~~~~~
  ../tests/kms_color_chamelium.c:765:3: error: too few arguments to function ‘invalid_ctm_matrix_sizes’
     invalid_ctm_matrix_sizes(&data);
     ^~~~~~~~~~~~~~~~~~~~~~~~
  In file included from ../tests/kms_color_chamelium.c:25:
  ../tests/kms_color_helper.h:126:6: note: declared here
   void invalid_ctm_matrix_sizes(data_t *data, enum pipe p);
        ^~~~~~~~~~~~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1630685996:step_script
  section_start:1630685996:cleanup_file_variables
  Cleaning up file based variables
  section_end:1630685998:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/13373818):
    761 |   invalid_degamma_lut_sizes(&data);
        |   ^~~~~~~~~~~~~~~~~~~~~~~~~
  In file included from ../tests/kms_color_chamelium.c:25:
  ../tests/kms_color_helper.h:124:6: note: declared here
    124 | void invalid_degamma_lut_sizes(data_t *data, enum pipe p);
        |      ^~~~~~~~~~~~~~~~~~~~~~~~~
  ../tests/kms_color_chamelium.c:765:3: error: too few arguments to function ‘invalid_ctm_matrix_sizes’
    765 |   invalid_ctm_matrix_sizes(&data);
        |   ^~~~~~~~~~~~~~~~~~~~~~~~
  In file included from ../tests/kms_color_chamelium.c:25:
  ../tests/kms_color_helper.h:126:6: note: declared here
    126 | void invalid_ctm_matrix_sizes(data_t *data, enum pipe p);
        |      ^~~~~~~~~~~~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1630685994:step_script
  section_start:1630685994:cleanup_file_variables
  Cleaning up file based variables
  section_end:1630685996:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/13373822):
  ../tests/kms_color_chamelium.c:761:34: error: too few arguments to function call, expected 2, have 1
                  invalid_degamma_lut_sizes(&data);
                  ~~~~~~~~~~~~~~~~~~~~~~~~~      ^
  ../tests/kms_color_helper.h:124:1: note: 'invalid_degamma_lut_sizes' declared here
  void invalid_degamma_lut_sizes(data_t *data, enum pipe p);
  ^
  ../tests/kms_color_chamelium.c:765:33: error: too few arguments to function call, expected 2, have 1
                  invalid_ctm_matrix_sizes(&data);
                  ~~~~~~~~~~~~~~~~~~~~~~~~      ^
  ../tests/kms_color_helper.h:126:1: note: 'invalid_ctm_matrix_sizes' declared here
  void invalid_ctm_matrix_sizes(data_t *data, enum pipe p);
  ^
  3 errors generated.
  ninja: build stopped: subcommand failed.
  section_end:1630685988:step_script
  section_start:1630685988:cleanup_file_variables
  Cleaning up file based variables
  section_end:1630685989:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/13373821):
    761 |   invalid_degamma_lut_sizes(&data);
        |   ^~~~~~~~~~~~~~~~~~~~~~~~~
  In file included from ../tests/kms_color_chamelium.c:25:
  ../tests/kms_color_helper.h:124:6: note: declared here
    124 | void invalid_degamma_lut_sizes(data_t *data, enum pipe p);
        |      ^~~~~~~~~~~~~~~~~~~~~~~~~
  ../tests/kms_color_chamelium.c:765:3: error: too few arguments to function ‘invalid_ctm_matrix_sizes’
    765 |   invalid_ctm_matrix_sizes(&data);
        |   ^~~~~~~~~~~~~~~~~~~~~~~~
  In file included from ../tests/kms_color_chamelium.c:25:
  ../tests/kms_color_helper.h:126:6: note: declared here
    126 | void invalid_ctm_matrix_sizes(data_t *data, enum pipe p);
        |      ^~~~~~~~~~~~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1630685994:step_script
  section_start:1630685994:cleanup_file_variables
  Cleaning up file based variables
  section_end:1630685996:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/13373819):
    761 |   invalid_degamma_lut_sizes(&data);
        |   ^~~~~~~~~~~~~~~~~~~~~~~~~
  In file included from ../tests/kms_color_chamelium.c:25:
  ../tests/kms_color_helper.h:124:6: note: declared here
    124 | void invalid_degamma_lut_sizes(data_t *data, enum pipe p);
        |      ^~~~~~~~~~~~~~~~~~~~~~~~~
  ../tests/kms_color_chamelium.c:765:3: error: too few arguments to function ‘invalid_ctm_matrix_sizes’
    765 |   invalid_ctm_matrix_sizes(&data);
        |   ^~~~~~~~~~~~~~~~~~~~~~~~
  In file included from ../tests/kms_color_chamelium.c:25:
  ../tests/kms_color_helper.h:126:6: note: declared here
    126 | void invalid_ctm_matrix_sizes(data_t *data, enum pipe p);
        |      ^~~~~~~~~~~~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1630685994:step_script
  section_start:1630685994:cleanup_file_variables
  Cleaning up file based variables
  section_end:1630685996:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/13373820):
    761 |   invalid_degamma_lut_sizes(&data);
        |   ^~~~~~~~~~~~~~~~~~~~~~~~~
  In file included from ../tests/kms_color_chamelium.c:25:
  ../tests/kms_color_helper.h:124:6: note: declared here
    124 | void invalid_degamma_lut_sizes(data_t *data, enum pipe p);
        |      ^~~~~~~~~~~~~~~~~~~~~~~~~
  ../tests/kms_color_chamelium.c:765:3: error: too few arguments to function ‘invalid_ctm_matrix_sizes’
    765 |   invalid_ctm_matrix_sizes(&data);
        |   ^~~~~~~~~~~~~~~~~~~~~~~~
  In file included from ../tests/kms_color_chamelium.c:25:
  ../tests/kms_color_helper.h:126:6: note: declared here
    126 | void invalid_ctm_matrix_sizes(data_t *data, enum pipe p);
        |      ^~~~~~~~~~~~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1630685997:step_script
  section_start:1630685997:cleanup_file_variables
  Cleaning up file based variables
  section_end:1630685998:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/394644
