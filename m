Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mark Yacoub" <markyacoub@chromium.org>
Date: Thu, 01 Dec 2022 18:13:07 -0000
Message-ID: <166991838722.14638.128753715912446842@emeril.freedesktop.org>
References: <20221130204526.3182975-1-markyacoub@chromium.org>
In-Reply-To: <20221130204526.3182975-1-markyacoub@chromium.org>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_C?=
 =?utf-8?q?hamelium=3A_Split_kms=5Fchamelium_into_multiple_kms=5Fchamelium?=
 =?utf-8?q?_tests_=28rev2=29?=
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

Series: Chamelium: Split kms_chamelium into multiple kms_chamelium tests (rev2)
URL   : https://patchwork.freedesktop.org/series/111501/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/752655 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/32808705):
  ../tests/chamelium/kms_chamelium_edid.c:145:7: warning: nested extern declaration of ‘drmModeGetPropertyBlob’ [-Wnested-externs]
         drmModeGetPropertyBlob(data->drm_fd, edid_blob_id));
         ^~~~~~~~~~~~~~~~~~~~~~
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    do { if (!(expr)) \
               ^~~~
  ../tests/chamelium/kms_chamelium_edid.c:144:23: warning: assignment to ‘drmModePropertyBlobPtr’ {aka ‘struct _drmModePropertyBlob *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
    igt_assert(edid_blob =
                         ^
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    do { if (!(expr)) \
               ^~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1669917860:step_script
  section_start:1669917860:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1669917860:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/32808700):
  ../tests/chamelium/kms_chamelium_edid.c:145:7: warning: nested extern declaration of ‘drmModeGetPropertyBlob’ [-Wnested-externs]
    145 |       drmModeGetPropertyBlob(data->drm_fd, edid_blob_id));
        |       ^~~~~~~~~~~~~~~~~~~~~~
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    676 |  do { if (!(expr)) \
        |             ^~~~
  ../tests/chamelium/kms_chamelium_edid.c:144:23: warning: assignment to ‘drmModePropertyBlobPtr’ {aka ‘struct _drmModePropertyBlob *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
    144 |  igt_assert(edid_blob =
        |                       ^
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    676 |  do { if (!(expr)) \
        |             ^~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1669917871:step_script
  section_start:1669917871:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1669917871:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/32808704):
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
  section_end:1669917933:step_script
  section_start:1669917933:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1669917934:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/32808703):
  ../tests/chamelium/kms_chamelium_edid.c:145:7: warning: nested extern declaration of ‘drmModeGetPropertyBlob’ [-Wnested-externs]
    145 |       drmModeGetPropertyBlob(data->drm_fd, edid_blob_id));
        |       ^~~~~~~~~~~~~~~~~~~~~~
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    676 |  do { if (!(expr)) \
        |             ^~~~
  ../tests/chamelium/kms_chamelium_edid.c:144:23: warning: assignment to ‘drmModePropertyBlobPtr’ {aka ‘struct _drmModePropertyBlob *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
    144 |  igt_assert(edid_blob =
        |                       ^
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    676 |  do { if (!(expr)) \
        |             ^~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1669917870:step_script
  section_start:1669917870:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1669917871:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/32808701):
  ../tests/chamelium/kms_chamelium_edid.c:145:7: warning: nested extern declaration of ‘drmModeGetPropertyBlob’ [-Wnested-externs]
    145 |       drmModeGetPropertyBlob(data->drm_fd, edid_blob_id));
        |       ^~~~~~~~~~~~~~~~~~~~~~
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    676 |  do { if (!(expr)) \
        |             ^~~~
  ../tests/chamelium/kms_chamelium_edid.c:144:23: warning: assignment to ‘drmModePropertyBlobPtr’ {aka ‘struct _drmModePropertyBlob *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
    144 |  igt_assert(edid_blob =
        |                       ^
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    676 |  do { if (!(expr)) \
        |             ^~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1669917855:step_script
  section_start:1669917855:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1669917856:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/32808702):
  ../tests/chamelium/kms_chamelium_edid.c:145:7: warning: nested extern declaration of ‘drmModeGetPropertyBlob’ [-Wnested-externs]
    145 |       drmModeGetPropertyBlob(data->drm_fd, edid_blob_id));
        |       ^~~~~~~~~~~~~~~~~~~~~~
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    676 |  do { if (!(expr)) \
        |             ^~~~
  ../tests/chamelium/kms_chamelium_edid.c:144:23: warning: assignment to ‘drmModePropertyBlobPtr’ {aka ‘struct _drmModePropertyBlob *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
    144 |  igt_assert(edid_blob =
        |                       ^
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    676 |  do { if (!(expr)) \
        |             ^~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1669917863:step_script
  section_start:1669917863:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1669917863:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/752655
