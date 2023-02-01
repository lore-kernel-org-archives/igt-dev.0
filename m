Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mark Yacoub" <markyacoub@chromium.org>
Date: Wed, 01 Feb 2023 18:24:24 -0000
Message-ID: <167527586483.25551.7673316049782662596@emeril.freedesktop.org>
References: <20230201181215.30500-1-markyacoub@google.com>
In-Reply-To: <20230201181215.30500-1-markyacoub@google.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_C?=
 =?utf-8?q?hamelium=3A_Get_Chamelium_Logs_on_RPC_failure=2E?=
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

Series: Chamelium: Get Chamelium Logs on RPC failure.
URL   : https://patchwork.freedesktop.org/series/113567/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/798228 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/35709867):
  ../tests/chamelium/kms_chamelium_helper.c:338:7: warning: nested extern declaration of ‘drmModeGetPropertyBlob’ [-Wnested-externs]
         drmModeGetPropertyBlob(data->drm_fd, edid_blob_id));
         ^~~~~~~~~~~~~~~~~~~~~~
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    do { if (!(expr)) \
               ^~~~
  ../tests/chamelium/kms_chamelium_helper.c:337:23: warning: assignment to ‘drmModePropertyBlobPtr’ {aka ‘struct _drmModePropertyBlob *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
    igt_assert(edid_blob =
                         ^
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    do { if (!(expr)) \
               ^~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1675275461:step_script
  section_start:1675275461:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1675275461:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/35709862):
  ../tests/chamelium/kms_chamelium_helper.c:338:7: warning: nested extern declaration of ‘drmModeGetPropertyBlob’ [-Wnested-externs]
    338 |       drmModeGetPropertyBlob(data->drm_fd, edid_blob_id));
        |       ^~~~~~~~~~~~~~~~~~~~~~
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    676 |  do { if (!(expr)) \
        |             ^~~~
  ../tests/chamelium/kms_chamelium_helper.c:337:23: warning: assignment to ‘drmModePropertyBlobPtr’ {aka ‘struct _drmModePropertyBlob *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
    337 |  igt_assert(edid_blob =
        |                       ^
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    676 |  do { if (!(expr)) \
        |             ^~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1675275465:step_script
  section_start:1675275465:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1675275466:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/35709866):
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
  section_end:1675275530:step_script
  section_start:1675275530:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1675275532:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/35709865):
  ../tests/chamelium/kms_chamelium_helper.c:338:7: warning: nested extern declaration of ‘drmModeGetPropertyBlob’ [-Wnested-externs]
    338 |       drmModeGetPropertyBlob(data->drm_fd, edid_blob_id));
        |       ^~~~~~~~~~~~~~~~~~~~~~
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    676 |  do { if (!(expr)) \
        |             ^~~~
  ../tests/chamelium/kms_chamelium_helper.c:337:23: warning: assignment to ‘drmModePropertyBlobPtr’ {aka ‘struct _drmModePropertyBlob *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
    337 |  igt_assert(edid_blob =
        |                       ^
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    676 |  do { if (!(expr)) \
        |             ^~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1675275467:step_script
  section_start:1675275467:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1675275468:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/35709863):
  ../tests/chamelium/kms_chamelium_helper.c:338:7: warning: nested extern declaration of ‘drmModeGetPropertyBlob’ [-Wnested-externs]
    338 |       drmModeGetPropertyBlob(data->drm_fd, edid_blob_id));
        |       ^~~~~~~~~~~~~~~~~~~~~~
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    676 |  do { if (!(expr)) \
        |             ^~~~
  ../tests/chamelium/kms_chamelium_helper.c:337:23: warning: assignment to ‘drmModePropertyBlobPtr’ {aka ‘struct _drmModePropertyBlob *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
    337 |  igt_assert(edid_blob =
        |                       ^
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    676 |  do { if (!(expr)) \
        |             ^~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1675275465:step_script
  section_start:1675275465:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1675275467:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/35709864):
  ../tests/chamelium/kms_chamelium_helper.c:338:7: warning: nested extern declaration of ‘drmModeGetPropertyBlob’ [-Wnested-externs]
    338 |       drmModeGetPropertyBlob(data->drm_fd, edid_blob_id));
        |       ^~~~~~~~~~~~~~~~~~~~~~
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    676 |  do { if (!(expr)) \
        |             ^~~~
  ../tests/chamelium/kms_chamelium_helper.c:337:23: warning: assignment to ‘drmModePropertyBlobPtr’ {aka ‘struct _drmModePropertyBlob *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
    337 |  igt_assert(edid_blob =
        |                       ^
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    676 |  do { if (!(expr)) \
        |             ^~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1675275466:step_script
  section_start:1675275466:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1675275467:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/798228
