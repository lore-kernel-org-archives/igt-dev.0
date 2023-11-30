Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Akshata Jahagirdar" <akshata.jahagirdar@intel.com>
Date: Thu, 30 Nov 2023 02:33:06 -0000
Message-ID: <170131158684.15646.10758838572657089207@emeril.freedesktop.org>
References: <cover.1701180818.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1701180818.git.akshata.jahagirdar@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_C?=
 =?utf-8?q?ompression_support_for_Lunarlake_=28rev3=29?=
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

Series: Compression support for Lunarlake (rev3)
URL   : https://patchwork.freedesktop.org/series/126254/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1045659 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/52171905):
  ../lib/intel_chipset.h:210:55: note: in definition of macro ‘AT_LEAST_GEN’
   #define AT_LEAST_GEN(devid, x) (intel_get_device_info(devid)->graphics_ver >= x)
                                                         ^~~~~
  ../lib/intel_blt.c:1810:51: error: ‘mid’ undeclared (first use in this function); did you mean ‘min’?
     if(AT_LEAST_GEN(intel_get_drm_devid(xe), 20) && mid->compression){
                                                     ^~~
                                                     min
  ../lib/intel_blt.c:1811:16: error: implicit declaration of function ‘xe2_get_pat_idx_uc_comp’; did you mean ‘intel_get_pat_idx_uc_comp’? [-Werror=implicit-function-declaration]
      pat_index = xe2_get_pat_idx_uc_comp(blt->fd);
                  ^~~~~~~~~~~~~~~~~~~~~~~
                  intel_get_pat_idx_uc_comp
  ../lib/intel_blt.c:1811:16: warning: nested extern declaration of ‘xe2_get_pat_idx_uc_comp’ [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1701311566:step_script
  section_start:1701311566:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1701311567:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/52171908):
  ../lib/intel_chipset.h:210:55: note: in definition of macro ‘AT_LEAST_GEN’
   #define AT_LEAST_GEN(devid, x) (intel_get_device_info(devid)->graphics_ver >= x)
                                                         ^~~~~
  ../lib/intel_blt.c:1810:51: error: ‘mid’ undeclared (first use in this function); did you mean ‘min’?
     if(AT_LEAST_GEN(intel_get_drm_devid(xe), 20) && mid->compression){
                                                     ^~~
                                                     min
  ../lib/intel_blt.c:1811:16: error: implicit declaration of function ‘xe2_get_pat_idx_uc_comp’; did you mean ‘intel_get_pat_idx_uc_comp’? [-Werror=implicit-function-declaration]
      pat_index = xe2_get_pat_idx_uc_comp(blt->fd);
                  ^~~~~~~~~~~~~~~~~~~~~~~
                  intel_get_pat_idx_uc_comp
  ../lib/intel_blt.c:1811:16: warning: nested extern declaration of ‘xe2_get_pat_idx_uc_comp’ [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1701311572:step_script
  section_start:1701311572:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1701311572:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/52171907):
  ../lib/intel_chipset.h:210:55: note: in definition of macro ‘AT_LEAST_GEN’
   #define AT_LEAST_GEN(devid, x) (intel_get_device_info(devid)->graphics_ver >= x)
                                                         ^~~~~
  ../lib/intel_blt.c:1810:51: error: ‘mid’ undeclared (first use in this function); did you mean ‘min’?
     if(AT_LEAST_GEN(intel_get_drm_devid(xe), 20) && mid->compression){
                                                     ^~~
                                                     min
  ../lib/intel_blt.c:1811:16: error: implicit declaration of function ‘xe2_get_pat_idx_uc_comp’; did you mean ‘intel_get_pat_idx_uc_comp’? [-Werror=implicit-function-declaration]
      pat_index = xe2_get_pat_idx_uc_comp(blt->fd);
                  ^~~~~~~~~~~~~~~~~~~~~~~
                  intel_get_pat_idx_uc_comp
  ../lib/intel_blt.c:1811:16: warning: nested extern declaration of ‘xe2_get_pat_idx_uc_comp’ [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1701311567:step_script
  section_start:1701311567:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1701311567:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/52171909):
  ../lib/intel_chipset.h:210:55: note: in definition of macro ‘AT_LEAST_GEN’
   #define AT_LEAST_GEN(devid, x) (intel_get_device_info(devid)->graphics_ver >= x)
                                                         ^~~~~
  ../lib/intel_blt.c:1810:51: error: ‘mid’ undeclared (first use in this function); did you mean ‘min’?
     if(AT_LEAST_GEN(intel_get_drm_devid(xe), 20) && mid->compression){
                                                     ^~~
                                                     min
  ../lib/intel_blt.c:1811:16: error: implicit declaration of function ‘xe2_get_pat_idx_uc_comp’; did you mean ‘intel_get_pat_idx_uc_comp’? [-Werror=implicit-function-declaration]
      pat_index = xe2_get_pat_idx_uc_comp(blt->fd);
                  ^~~~~~~~~~~~~~~~~~~~~~~
                  intel_get_pat_idx_uc_comp
  ../lib/intel_blt.c:1811:16: warning: nested extern declaration of ‘xe2_get_pat_idx_uc_comp’ [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1701311564:step_script
  section_start:1701311564:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1701311565:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/52171906):
  ../lib/intel_chipset.h:210:55: note: in definition of macro ‘AT_LEAST_GEN’
   #define AT_LEAST_GEN(devid, x) (intel_get_device_info(devid)->graphics_ver >= x)
                                                         ^~~~~
  ../lib/intel_blt.c:1810:51: error: ‘mid’ undeclared (first use in this function); did you mean ‘min’?
     if(AT_LEAST_GEN(intel_get_drm_devid(xe), 20) && mid->compression){
                                                     ^~~
                                                     min
  ../lib/intel_blt.c:1811:16: error: implicit declaration of function ‘xe2_get_pat_idx_uc_comp’; did you mean ‘intel_get_pat_idx_uc_comp’? [-Werror=implicit-function-declaration]
      pat_index = xe2_get_pat_idx_uc_comp(blt->fd);
                  ^~~~~~~~~~~~~~~~~~~~~~~
                  intel_get_pat_idx_uc_comp
  ../lib/intel_blt.c:1811:16: warning: nested extern declaration of ‘xe2_get_pat_idx_uc_comp’ [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1701311560:step_script
  section_start:1701311560:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1701311560:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/52171900):
  ../lib/intel_chipset.h:210:55: note: in definition of macro ‘AT_LEAST_GEN’
    210 | #define AT_LEAST_GEN(devid, x) (intel_get_device_info(devid)->graphics_ver >= x)
        |                                                       ^~~~~
  ../lib/intel_blt.c:1810:51: error: ‘mid’ undeclared (first use in this function); did you mean ‘min’?
   1810 |   if(AT_LEAST_GEN(intel_get_drm_devid(xe), 20) && mid->compression){
        |                                                   ^~~
        |                                                   min
  ../lib/intel_blt.c:1811:16: error: implicit declaration of function ‘xe2_get_pat_idx_uc_comp’; did you mean ‘intel_get_pat_idx_uc_comp’? [-Werror=implicit-function-declaration]
   1811 |    pat_index = xe2_get_pat_idx_uc_comp(blt->fd);
        |                ^~~~~~~~~~~~~~~~~~~~~~~
        |                intel_get_pat_idx_uc_comp
  ../lib/intel_blt.c:1811:16: warning: nested extern declaration of ‘xe2_get_pat_idx_uc_comp’ [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1701311567:step_script
  section_start:1701311567:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1701311569:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/52171904):
                  if(AT_LEAST_GEN(intel_get_drm_devid(xe), 20) && mid->compression){
                                                      ^
  ../lib/intel_blt.c:1810:51: error: use of undeclared identifier 'mid'
                  if(AT_LEAST_GEN(intel_get_drm_devid(xe), 20) && mid->compression){
                                                                  ^
  ../lib/intel_blt.c:1811:16: error: implicit declaration of function 'xe2_get_pat_idx_uc_comp' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                          pat_index = xe2_get_pat_idx_uc_comp(blt->fd);
                                      ^
  ../lib/intel_blt.c:1811:16: note: did you mean 'intel_get_pat_idx_uc_comp'?
  ../lib/intel_pat.h:19:9: note: 'intel_get_pat_idx_uc_comp' declared here
  uint8_t intel_get_pat_idx_uc_comp(int fd);
          ^
  4 warnings and 3 errors generated.
  ninja: build stopped: subcommand failed.
  section_end:1701311568:step_script
  section_start:1701311568:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1701311569:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/52171903):
  ../lib/intel_chipset.h:210:55: note: in definition of macro ‘AT_LEAST_GEN’
    210 | #define AT_LEAST_GEN(devid, x) (intel_get_device_info(devid)->graphics_ver >= x)
        |                                                       ^~~~~
  ../lib/intel_blt.c:1810:51: error: ‘mid’ undeclared (first use in this function); did you mean ‘min’?
   1810 |   if(AT_LEAST_GEN(intel_get_drm_devid(xe), 20) && mid->compression){
        |                                                   ^~~
        |                                                   min
  ../lib/intel_blt.c:1811:16: error: implicit declaration of function ‘xe2_get_pat_idx_uc_comp’; did you mean ‘intel_get_pat_idx_uc_comp’? [-Werror=implicit-function-declaration]
   1811 |    pat_index = xe2_get_pat_idx_uc_comp(blt->fd);
        |                ^~~~~~~~~~~~~~~~~~~~~~~
        |                intel_get_pat_idx_uc_comp
  ../lib/intel_blt.c:1811:16: warning: nested extern declaration of ‘xe2_get_pat_idx_uc_comp’ [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1701311563:step_script
  section_start:1701311563:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1701311564:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/52171901):
  ../lib/intel_chipset.h:210:55: note: in definition of macro ‘AT_LEAST_GEN’
    210 | #define AT_LEAST_GEN(devid, x) (intel_get_device_info(devid)->graphics_ver >= x)
        |                                                       ^~~~~
  ../lib/intel_blt.c:1810:51: error: ‘mid’ undeclared (first use in this function); did you mean ‘min’?
   1810 |   if(AT_LEAST_GEN(intel_get_drm_devid(xe), 20) && mid->compression){
        |                                                   ^~~
        |                                                   min
  ../lib/intel_blt.c:1811:16: error: implicit declaration of function ‘xe2_get_pat_idx_uc_comp’; did you mean ‘intel_get_pat_idx_uc_comp’? [-Werror=implicit-function-declaration]
   1811 |    pat_index = xe2_get_pat_idx_uc_comp(blt->fd);
        |                ^~~~~~~~~~~~~~~~~~~~~~~
        |                intel_get_pat_idx_uc_comp
  ../lib/intel_blt.c:1811:16: warning: nested extern declaration of ‘xe2_get_pat_idx_uc_comp’ [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1701311570:step_script
  section_start:1701311570:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1701311570:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/52171902):
  ../lib/intel_chipset.h:210:55: note: in definition of macro ‘AT_LEAST_GEN’
    210 | #define AT_LEAST_GEN(devid, x) (intel_get_device_info(devid)->graphics_ver >= x)
        |                                                       ^~~~~
  ../lib/intel_blt.c:1810:51: error: ‘mid’ undeclared (first use in this function); did you mean ‘min’?
   1810 |   if(AT_LEAST_GEN(intel_get_drm_devid(xe), 20) && mid->compression){
        |                                                   ^~~
        |                                                   min
  ../lib/intel_blt.c:1811:16: error: implicit declaration of function ‘xe2_get_pat_idx_uc_comp’; did you mean ‘intel_get_pat_idx_uc_comp’? [-Werror=implicit-function-declaration]
   1811 |    pat_index = xe2_get_pat_idx_uc_comp(blt->fd);
        |                ^~~~~~~~~~~~~~~~~~~~~~~
        |                intel_get_pat_idx_uc_comp
  ../lib/intel_blt.c:1811:16: warning: nested extern declaration of ‘xe2_get_pat_idx_uc_comp’ [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1701311568:step_script
  section_start:1701311568:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1701311569:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1045659
