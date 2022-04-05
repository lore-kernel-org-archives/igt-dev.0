Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "David Zhang" <dingchen.zhang@amd.com>
Date: Tue, 05 Apr 2022 15:01:34 -0000
Message-ID: <164917089450.24159.963711301041127226@emeril.freedesktop.org>
References: <20220405142434.40630-1-dingchen.zhang@amd.com>
In-Reply-To: <20220405142434.40630-1-dingchen.zhang@amd.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_a?=
 =?utf-8?q?dd_PSR-SU_FFU_test_case_w/_visual_confirm?=
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

Series: add PSR-SU FFU test case w/ visual confirm
URL   : https://patchwork.freedesktop.org/series/102199/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/551006 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/20735649):
    if (!(expr)) igt_skip_check(#expr , NULL); \
          ^~~~
  ../tests/amdgpu/amd_psr.c:489:16: warning: nested extern declaration of ‘igt_amd_dm_get_visual_confirm’ [-Wnested-externs]
      igt_require(igt_amd_dm_get_visual_confirm(data.fd) == VISUAL_CONFIRM_PSR);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ../lib/igt_core.h:997:8: note: in definition of macro ‘igt_require’
    if (!(expr)) igt_skip_check(#expr , NULL); \
          ^~~~
  ../tests/amdgpu/amd_psr.c:510:43: error: ‘VISUAL_CONFIRM_DISABLE’ undeclared (first use in this function); did you mean ‘PIPEACONF_DISABLE’?
      igt_amd_dm_set_visual_confirm(data.fd, VISUAL_CONFIRM_DISABLE);
                                             ^~~~~~~~~~~~~~~~~~~~~~
                                             PIPEACONF_DISABLE
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1649170834:step_script
  section_start:1649170834:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1649170834:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/20735652):
    if (!(expr)) igt_skip_check(#expr , NULL); \
          ^~~~
  ../tests/amdgpu/amd_psr.c:489:16: warning: nested extern declaration of ‘igt_amd_dm_get_visual_confirm’ [-Wnested-externs]
      igt_require(igt_amd_dm_get_visual_confirm(data.fd) == VISUAL_CONFIRM_PSR);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ../lib/igt_core.h:997:8: note: in definition of macro ‘igt_require’
    if (!(expr)) igt_skip_check(#expr , NULL); \
          ^~~~
  ../tests/amdgpu/amd_psr.c:510:43: error: ‘VISUAL_CONFIRM_DISABLE’ undeclared (first use in this function); did you mean ‘PIPEACONF_DISABLE’?
      igt_amd_dm_set_visual_confirm(data.fd, VISUAL_CONFIRM_DISABLE);
                                             ^~~~~~~~~~~~~~~~~~~~~~
                                             PIPEACONF_DISABLE
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1649170800:step_script
  section_start:1649170800:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1649170800:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/20735651):
    if (!(expr)) igt_skip_check(#expr , NULL); \
          ^~~~
  ../tests/amdgpu/amd_psr.c:489:16: warning: nested extern declaration of ‘igt_amd_dm_get_visual_confirm’ [-Wnested-externs]
      igt_require(igt_amd_dm_get_visual_confirm(data.fd) == VISUAL_CONFIRM_PSR);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ../lib/igt_core.h:997:8: note: in definition of macro ‘igt_require’
    if (!(expr)) igt_skip_check(#expr , NULL); \
          ^~~~
  ../tests/amdgpu/amd_psr.c:510:43: error: ‘VISUAL_CONFIRM_DISABLE’ undeclared (first use in this function); did you mean ‘PIPEACONF_DISABLE’?
      igt_amd_dm_set_visual_confirm(data.fd, VISUAL_CONFIRM_DISABLE);
                                             ^~~~~~~~~~~~~~~~~~~~~~
                                             PIPEACONF_DISABLE
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1649170856:step_script
  section_start:1649170856:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1649170858:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/20735653):
    if (!(expr)) igt_skip_check(#expr , NULL); \
          ^~~~
  ../tests/amdgpu/amd_psr.c:489:16: warning: nested extern declaration of ‘igt_amd_dm_get_visual_confirm’ [-Wnested-externs]
      igt_require(igt_amd_dm_get_visual_confirm(data.fd) == VISUAL_CONFIRM_PSR);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ../lib/igt_core.h:997:8: note: in definition of macro ‘igt_require’
    if (!(expr)) igt_skip_check(#expr , NULL); \
          ^~~~
  ../tests/amdgpu/amd_psr.c:510:43: error: ‘VISUAL_CONFIRM_DISABLE’ undeclared (first use in this function); did you mean ‘PIPEACONF_DISABLE’?
      igt_amd_dm_set_visual_confirm(data.fd, VISUAL_CONFIRM_DISABLE);
                                             ^~~~~~~~~~~~~~~~~~~~~~
                                             PIPEACONF_DISABLE
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1649170832:step_script
  section_start:1649170832:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1649170832:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/20735644):
    997 |  if (!(expr)) igt_skip_check(#expr , NULL); \
        |        ^~~~
  ../tests/amdgpu/amd_psr.c:489:16: warning: nested extern declaration of ‘igt_amd_dm_get_visual_confirm’ [-Wnested-externs]
    489 |    igt_require(igt_amd_dm_get_visual_confirm(data.fd) == VISUAL_CONFIRM_PSR);
        |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ../lib/igt_core.h:997:8: note: in definition of macro ‘igt_require’
    997 |  if (!(expr)) igt_skip_check(#expr , NULL); \
        |        ^~~~
  ../tests/amdgpu/amd_psr.c:510:43: error: ‘VISUAL_CONFIRM_DISABLE’ undeclared (first use in this function); did you mean ‘PIPEACONF_DISABLE’?
    510 |    igt_amd_dm_set_visual_confirm(data.fd, VISUAL_CONFIRM_DISABLE);
        |                                           ^~~~~~~~~~~~~~~~~~~~~~
        |                                           PIPEACONF_DISABLE
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1649170763:step_script
  section_start:1649170763:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1649170764:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/20735648):
  ../tests/amdgpu/amd_psr.c:510:4: error: implicit declaration of function 'igt_amd_dm_set_visual_confirm' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                          igt_amd_dm_set_visual_confirm(data.fd, VISUAL_CONFIRM_DISABLE);
                          ^
  ../tests/amdgpu/amd_psr.c:510:43: error: use of undeclared identifier 'VISUAL_CONFIRM_DISABLE'
                          igt_amd_dm_set_visual_confirm(data.fd, VISUAL_CONFIRM_DISABLE);
                                                                 ^
  ../tests/amdgpu/amd_psr.c:511:16: error: implicit declaration of function 'igt_amd_dm_get_visual_confirm' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                          igt_require(igt_amd_dm_get_visual_confirm(data.fd) == VISUAL_CONFIRM_DISABLE);
                                      ^
  ../tests/amdgpu/amd_psr.c:511:58: error: use of undeclared identifier 'VISUAL_CONFIRM_DISABLE'
                          igt_require(igt_amd_dm_get_visual_confirm(data.fd) == VISUAL_CONFIRM_DISABLE);
                                                                                ^
  1 warning and 9 errors generated.
  ninja: build stopped: subcommand failed.
  section_end:1649170851:step_script
  section_start:1649170851:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1649170853:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/20735645):
    997 |  if (!(expr)) igt_skip_check(#expr , NULL); \
        |        ^~~~
  ../tests/amdgpu/amd_psr.c:489:16: warning: nested extern declaration of ‘igt_amd_dm_get_visual_confirm’ [-Wnested-externs]
    489 |    igt_require(igt_amd_dm_get_visual_confirm(data.fd) == VISUAL_CONFIRM_PSR);
        |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ../lib/igt_core.h:997:8: note: in definition of macro ‘igt_require’
    997 |  if (!(expr)) igt_skip_check(#expr , NULL); \
        |        ^~~~
  ../tests/amdgpu/amd_psr.c:510:43: error: ‘VISUAL_CONFIRM_DISABLE’ undeclared (first use in this function); did you mean ‘PIPEACONF_DISABLE’?
    510 |    igt_amd_dm_set_visual_confirm(data.fd, VISUAL_CONFIRM_DISABLE);
        |                                           ^~~~~~~~~~~~~~~~~~~~~~
        |                                           PIPEACONF_DISABLE
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1649170741:step_script
  section_start:1649170741:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1649170741:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/20735646):
    997 |  if (!(expr)) igt_skip_check(#expr , NULL); \
        |        ^~~~
  ../tests/amdgpu/amd_psr.c:489:16: warning: nested extern declaration of ‘igt_amd_dm_get_visual_confirm’ [-Wnested-externs]
    489 |    igt_require(igt_amd_dm_get_visual_confirm(data.fd) == VISUAL_CONFIRM_PSR);
        |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ../lib/igt_core.h:997:8: note: in definition of macro ‘igt_require’
    997 |  if (!(expr)) igt_skip_check(#expr , NULL); \
        |        ^~~~
  ../tests/amdgpu/amd_psr.c:510:43: error: ‘VISUAL_CONFIRM_DISABLE’ undeclared (first use in this function); did you mean ‘PIPEACONF_DISABLE’?
    510 |    igt_amd_dm_set_visual_confirm(data.fd, VISUAL_CONFIRM_DISABLE);
        |                                           ^~~~~~~~~~~~~~~~~~~~~~
        |                                           PIPEACONF_DISABLE
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1649170804:step_script
  section_start:1649170804:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1649170805:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/551006
