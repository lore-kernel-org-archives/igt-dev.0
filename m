Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mark Yacoub" <markyacoub@chromium.org>
Date: Tue, 06 Dec 2022 19:19:17 -0000
Message-ID: <167035435750.3370.5422249350476316701@emeril.freedesktop.org>
References: <20221130204526.3182975-1-markyacoub@chromium.org>
In-Reply-To: <20221130204526.3182975-1-markyacoub@chromium.org>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_C?=
 =?utf-8?q?hamelium=3A_Split_kms=5Fchamelium_into_multiple_kms=5Fchamelium?=
 =?utf-8?q?_tests_=28rev3=29?=
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

Series: Chamelium: Split kms_chamelium into multiple kms_chamelium tests (rev3)
URL   : https://patchwork.freedesktop.org/series/111501/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/756315 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/33057333):
  /usr/include/xf86drmMode.h:545:39: error: unknown type name ‘uint32_t’
   extern int drmModeRevokeLease(int fd, uint32_t lessee_id);
                                         ^~~~~~~~
  ../tests/chamelium/kms_chamelium_edid.c: In function ‘igt_custom_edid_type_read’:
  ../tests/chamelium/kms_chamelium_edid.c:144:14: error: implicit declaration of function ‘drmModeGetPropertyBlob’; did you mean ‘drmModeFreePropertyBlob’? [-Werror=implicit-function-declaration]
    edid_blob = drmModeGetPropertyBlob(data->drm_fd, edid_blob_id);
                ^~~~~~~~~~~~~~~~~~~~~~
                drmModeFreePropertyBlob
  ../tests/chamelium/kms_chamelium_edid.c:144:14: warning: nested extern declaration of ‘drmModeGetPropertyBlob’ [-Wnested-externs]
  ../tests/chamelium/kms_chamelium_edid.c:144:12: warning: assignment to ‘drmModePropertyBlobPtr’ {aka ‘struct _drmModePropertyBlob *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
    edid_blob = drmModeGetPropertyBlob(data->drm_fd, edid_blob_id);
              ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1670353936:step_script
  section_start:1670353936:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1670353936:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/33057328):
  /usr/include/xf86drmMode.h:545:39: error: unknown type name ‘uint32_t’
    545 | extern int drmModeRevokeLease(int fd, uint32_t lessee_id);
        |                                       ^~~~~~~~
  ../tests/chamelium/kms_chamelium_edid.c: In function ‘igt_custom_edid_type_read’:
  ../tests/chamelium/kms_chamelium_edid.c:144:14: error: implicit declaration of function ‘drmModeGetPropertyBlob’; did you mean ‘drmModeFreePropertyBlob’? [-Werror=implicit-function-declaration]
    144 |  edid_blob = drmModeGetPropertyBlob(data->drm_fd, edid_blob_id);
        |              ^~~~~~~~~~~~~~~~~~~~~~
        |              drmModeFreePropertyBlob
  ../tests/chamelium/kms_chamelium_edid.c:144:14: warning: nested extern declaration of ‘drmModeGetPropertyBlob’ [-Wnested-externs]
  ../tests/chamelium/kms_chamelium_edid.c:144:12: warning: assignment to ‘drmModePropertyBlobPtr’ {aka ‘struct _drmModePropertyBlob *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
    144 |  edid_blob = drmModeGetPropertyBlob(data->drm_fd, edid_blob_id);
        |            ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1670353945:step_script
  section_start:1670353945:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1670353947:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/33057332):
          uint32_t bpp;
          ^
  /usr/include/xf86drmMode.h:221:2: error: unknown type name 'uint32_t'
          uint32_t depth;
          ^
  /usr/include/xf86drmMode.h:223:2: error: unknown type name 'uint32_t'
          uint32_t handle;
          ^
  /usr/include/xf86drmMode.h:229:2: error: unknown type name 'uint32_t'
          uint32_t id;
          ^
  fatal error: too many errors emitted, stopping now [-ferror-limit=]
  20 errors generated.
  ninja: build stopped: subcommand failed.
  section_end:1670354021:step_script
  section_start:1670354021:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1670354022:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/33057331):
  /usr/include/xf86drmMode.h:545:39: error: unknown type name ‘uint32_t’
    545 | extern int drmModeRevokeLease(int fd, uint32_t lessee_id);
        |                                       ^~~~~~~~
  ../tests/chamelium/kms_chamelium_edid.c: In function ‘igt_custom_edid_type_read’:
  ../tests/chamelium/kms_chamelium_edid.c:144:14: error: implicit declaration of function ‘drmModeGetPropertyBlob’; did you mean ‘drmModeFreePropertyBlob’? [-Werror=implicit-function-declaration]
    144 |  edid_blob = drmModeGetPropertyBlob(data->drm_fd, edid_blob_id);
        |              ^~~~~~~~~~~~~~~~~~~~~~
        |              drmModeFreePropertyBlob
  ../tests/chamelium/kms_chamelium_edid.c:144:14: warning: nested extern declaration of ‘drmModeGetPropertyBlob’ [-Wnested-externs]
  ../tests/chamelium/kms_chamelium_edid.c:144:12: warning: assignment to ‘drmModePropertyBlobPtr’ {aka ‘struct _drmModePropertyBlob *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
    144 |  edid_blob = drmModeGetPropertyBlob(data->drm_fd, edid_blob_id);
        |            ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1670353944:step_script
  section_start:1670353944:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1670353945:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/33057329):
  /usr/include/xf86drmMode.h:545:39: error: unknown type name ‘uint32_t’
    545 | extern int drmModeRevokeLease(int fd, uint32_t lessee_id);
        |                                       ^~~~~~~~
  ../tests/chamelium/kms_chamelium_edid.c: In function ‘igt_custom_edid_type_read’:
  ../tests/chamelium/kms_chamelium_edid.c:144:14: error: implicit declaration of function ‘drmModeGetPropertyBlob’; did you mean ‘drmModeFreePropertyBlob’? [-Werror=implicit-function-declaration]
    144 |  edid_blob = drmModeGetPropertyBlob(data->drm_fd, edid_blob_id);
        |              ^~~~~~~~~~~~~~~~~~~~~~
        |              drmModeFreePropertyBlob
  ../tests/chamelium/kms_chamelium_edid.c:144:14: warning: nested extern declaration of ‘drmModeGetPropertyBlob’ [-Wnested-externs]
  ../tests/chamelium/kms_chamelium_edid.c:144:12: warning: assignment to ‘drmModePropertyBlobPtr’ {aka ‘struct _drmModePropertyBlob *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
    144 |  edid_blob = drmModeGetPropertyBlob(data->drm_fd, edid_blob_id);
        |            ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1670353953:step_script
  section_start:1670353953:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1670353953:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/33057330):
  /usr/include/xf86drmMode.h:545:39: error: unknown type name ‘uint32_t’
    545 | extern int drmModeRevokeLease(int fd, uint32_t lessee_id);
        |                                       ^~~~~~~~
  ../tests/chamelium/kms_chamelium_edid.c: In function ‘igt_custom_edid_type_read’:
  ../tests/chamelium/kms_chamelium_edid.c:144:14: error: implicit declaration of function ‘drmModeGetPropertyBlob’; did you mean ‘drmModeFreePropertyBlob’? [-Werror=implicit-function-declaration]
    144 |  edid_blob = drmModeGetPropertyBlob(data->drm_fd, edid_blob_id);
        |              ^~~~~~~~~~~~~~~~~~~~~~
        |              drmModeFreePropertyBlob
  ../tests/chamelium/kms_chamelium_edid.c:144:14: warning: nested extern declaration of ‘drmModeGetPropertyBlob’ [-Wnested-externs]
  ../tests/chamelium/kms_chamelium_edid.c:144:12: warning: assignment to ‘drmModePropertyBlobPtr’ {aka ‘struct _drmModePropertyBlob *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
    144 |  edid_blob = drmModeGetPropertyBlob(data->drm_fd, edid_blob_id);
        |            ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1670353953:step_script
  section_start:1670353953:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1670353954:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/756315
