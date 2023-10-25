Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 25 Oct 2023 10:10:48 -0000
Message-ID: <169822864869.20487.14911703642624611110@emeril.freedesktop.org>
References: <20231025091841.191503-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20231025091841.191503-1-mauro.chehab@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_l?=
 =?utf-8?q?ib/igt=5Fsysfs=3A_move_kick=5Fsnd=5Fhda=5Fintel=28=29_to_igt=5F?=
 =?utf-8?q?kmod=2Ec?=
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
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/igt_sysfs: move kick_snd_hda_intel() to igt_kmod.c
URL   : https://patchwork.freedesktop.org/series/125553/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1018404 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/50736039):
     if (!S_ISLNK(st.st_mode))
          ^~~~~~~
          S_IFLNK
  ../lib/igt_kmod.c:478:8: warning: nested extern declaration of ‘S_ISLNK’ [-Wnested-externs]
  ../lib/igt_kmod.c:469:8: warning: unused variable ‘fpath’ [-Wunused-variable]
     char fpath[PATH_MAX];
          ^~~~~
  ../lib/igt_kmod.c:487:2: error: implicit declaration of function ‘closedir’; did you mean ‘close’? [-Werror=implicit-function-declaration]
    closedir(dir);
    ^~~~~~~~
    close
  ../lib/igt_kmod.c:487:2: warning: nested extern declaration of ‘closedir’ [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1698228409:step_script
  section_start:1698228409:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698228410:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/50736042):
     if (!S_ISLNK(st.st_mode))
          ^~~~~~~
          S_IFLNK
  ../lib/igt_kmod.c:478:8: warning: nested extern declaration of ‘S_ISLNK’ [-Wnested-externs]
  ../lib/igt_kmod.c:469:8: warning: unused variable ‘fpath’ [-Wunused-variable]
     char fpath[PATH_MAX];
          ^~~~~
  ../lib/igt_kmod.c:487:2: error: implicit declaration of function ‘closedir’; did you mean ‘close’? [-Werror=implicit-function-declaration]
    closedir(dir);
    ^~~~~~~~
    close
  ../lib/igt_kmod.c:487:2: warning: nested extern declaration of ‘closedir’ [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1698228434:step_script
  section_start:1698228434:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698228435:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/50736041):
     if (!S_ISLNK(st.st_mode))
          ^~~~~~~
          S_IFLNK
  ../lib/igt_kmod.c:478:8: warning: nested extern declaration of ‘S_ISLNK’ [-Wnested-externs]
  ../lib/igt_kmod.c:469:8: warning: unused variable ‘fpath’ [-Wunused-variable]
     char fpath[PATH_MAX];
          ^~~~~
  ../lib/igt_kmod.c:487:2: error: implicit declaration of function ‘closedir’; did you mean ‘close’? [-Werror=implicit-function-declaration]
    closedir(dir);
    ^~~~~~~~
    close
  ../lib/igt_kmod.c:487:2: warning: nested extern declaration of ‘closedir’ [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1698228425:step_script
  section_start:1698228425:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698228426:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/50736043):
     if (!S_ISLNK(st.st_mode))
          ^~~~~~~
          S_IFLNK
  ../lib/igt_kmod.c:478:8: warning: nested extern declaration of ‘S_ISLNK’ [-Wnested-externs]
  ../lib/igt_kmod.c:469:8: warning: unused variable ‘fpath’ [-Wunused-variable]
     char fpath[PATH_MAX];
          ^~~~~
  ../lib/igt_kmod.c:487:2: error: implicit declaration of function ‘closedir’; did you mean ‘close’? [-Werror=implicit-function-declaration]
    closedir(dir);
    ^~~~~~~~
    close
  ../lib/igt_kmod.c:487:2: warning: nested extern declaration of ‘closedir’ [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1698228420:step_script
  section_start:1698228420:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698228420:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/50736040):
     if (!S_ISLNK(st.st_mode))
          ^~~~~~~
          S_IFLNK
  ../lib/igt_kmod.c:478:8: warning: nested extern declaration of ‘S_ISLNK’ [-Wnested-externs]
  ../lib/igt_kmod.c:469:8: warning: unused variable ‘fpath’ [-Wunused-variable]
     char fpath[PATH_MAX];
          ^~~~~
  ../lib/igt_kmod.c:487:2: error: implicit declaration of function ‘closedir’; did you mean ‘close’? [-Werror=implicit-function-declaration]
    closedir(dir);
    ^~~~~~~~
    close
  ../lib/igt_kmod.c:487:2: warning: nested extern declaration of ‘closedir’ [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1698228405:step_script
  section_start:1698228405:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698228406:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/50736034):
    478 |   if (!S_ISLNK(st.st_mode))
        |        ^~~~~~~
        |        S_IFLNK
  ../lib/igt_kmod.c:478:8: warning: nested extern declaration of ‘S_ISLNK’ [-Wnested-externs]
  ../lib/igt_kmod.c:469:8: warning: unused variable ‘fpath’ [-Wunused-variable]
    469 |   char fpath[PATH_MAX];
        |        ^~~~~
  ../lib/igt_kmod.c:487:2: error: implicit declaration of function ‘closedir’; did you mean ‘close’? [-Werror=implicit-function-declaration]
    487 |  closedir(dir);
        |  ^~~~~~~~
        |  close
  ../lib/igt_kmod.c:487:2: warning: nested extern declaration of ‘closedir’ [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1698228410:step_script
  section_start:1698228410:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698228410:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/50736038):
  /usr/include/stdlib.h:852:14: note: 'div' declared here
  extern div_t div (int __numer, int __denom)
               ^
  ../lib/igt_kmod.c:868:5: warning: declaration does not declare anything [-Wmissing-declarations]
                                  __attribute__ ((fallthrough));
                                  ^
  ../lib/igt_kmod.c:1044:5: warning: declaration does not declare anything [-Wmissing-declarations]
                                  __attribute__ ((fallthrough));
                                  ^
  ../lib/igt_kmod.c:1271:5: warning: declaration does not declare anything [-Wmissing-declarations]
                                  __attribute__ ((fallthrough));
                                  ^
  4 warnings and 18 errors generated.
  ninja: build stopped: subcommand failed.
  section_end:1698228421:step_script
  section_start:1698228421:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698228424:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/50736037):
    478 |   if (!S_ISLNK(st.st_mode))
        |        ^~~~~~~
        |        S_IFLNK
  ../lib/igt_kmod.c:478:8: warning: nested extern declaration of ‘S_ISLNK’ [-Wnested-externs]
  ../lib/igt_kmod.c:469:8: warning: unused variable ‘fpath’ [-Wunused-variable]
    469 |   char fpath[PATH_MAX];
        |        ^~~~~
  ../lib/igt_kmod.c:487:2: error: implicit declaration of function ‘closedir’; did you mean ‘close’? [-Werror=implicit-function-declaration]
    487 |  closedir(dir);
        |  ^~~~~~~~
        |  close
  ../lib/igt_kmod.c:487:2: warning: nested extern declaration of ‘closedir’ [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1698228405:step_script
  section_start:1698228405:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698228405:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/50736035):
    478 |   if (!S_ISLNK(st.st_mode))
        |        ^~~~~~~
        |        S_IFLNK
  ../lib/igt_kmod.c:478:8: warning: nested extern declaration of ‘S_ISLNK’ [-Wnested-externs]
  ../lib/igt_kmod.c:469:8: warning: unused variable ‘fpath’ [-Wunused-variable]
    469 |   char fpath[PATH_MAX];
        |        ^~~~~
  ../lib/igt_kmod.c:487:2: error: implicit declaration of function ‘closedir’; did you mean ‘close’? [-Werror=implicit-function-declaration]
    487 |  closedir(dir);
        |  ^~~~~~~~
        |  close
  ../lib/igt_kmod.c:487:2: warning: nested extern declaration of ‘closedir’ [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1698228407:step_script
  section_start:1698228407:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698228408:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/50736036):
    478 |   if (!S_ISLNK(st.st_mode))
        |        ^~~~~~~
        |        S_IFLNK
  ../lib/igt_kmod.c:478:8: warning: nested extern declaration of ‘S_ISLNK’ [-Wnested-externs]
  ../lib/igt_kmod.c:469:8: warning: unused variable ‘fpath’ [-Wunused-variable]
    469 |   char fpath[PATH_MAX];
        |        ^~~~~
  ../lib/igt_kmod.c:487:2: error: implicit declaration of function ‘closedir’; did you mean ‘close’? [-Werror=implicit-function-declaration]
    487 |  closedir(dir);
        |  ^~~~~~~~
        |  close
  ../lib/igt_kmod.c:487:2: warning: nested extern declaration of ‘closedir’ [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1698228410:step_script
  section_start:1698228410:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698228411:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1018404

