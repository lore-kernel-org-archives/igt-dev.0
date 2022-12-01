Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F1F10E087
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Dec 2022 14:43:51 +0000 (UTC)
Date: Thu, 1 Dec 2022 16:44:16 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y4i9wFX+uXzrf6xH@platvala-desk.ger.corp.intel.com>
References: <20221130204526.3182975-1-markyacoub@chromium.org>
 <166984279559.2881.2620862031634683203@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <166984279559.2881.2620862031634683203@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_C?=
 =?utf-8?q?hamelium=3A_Split_kms=5Fchamelium_into_multiple_kms=5Fchamelium?=
 =?utf-8?q?_tests?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Nov 30, 2022 at 09:13:15PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Chamelium: Split kms_chamelium into multiple kms_chamelium tests
> URL   : https://patchwork.freedesktop.org/series/111501/
> State : warning
> 
> == Summary ==
> 
> Pipeline status: FAILED.
> 
> see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/751787 for the overview.
> 
> build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/32736079):
>   ../tests/chamelium/kms_chamelium_edid.c:143:7: warning: nested extern declaration of ‘drmModeGetPropertyBlob’ [-Wnested-externs]
>          drmModeGetPropertyBlob(data->drm_fd, edid_blob_id));
>          ^~~~~~~~~~~~~~~~~~~~~~

Are you missing an #include in kms_chamelium_edid.c?


-- 
Petri Latvala





>   ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
>     do { if (!(expr)) \
>                ^~~~
>   ../tests/chamelium/kms_chamelium_edid.c:142:23: warning: assignment to ‘drmModePropertyBlobPtr’ {aka ‘struct _drmModePropertyBlob *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
>     igt_assert(edid_blob =
>                          ^
>   ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
>     do { if (!(expr)) \
>                ^~~~
>   cc1: some warnings being treated as errors
>   ninja: build stopped: subcommand failed.
>   section_end:1669842325:step_script
>   section_start:1669842325:cleanup_file_variables
>   Cleaning up project directory and file based variables
>   section_end:1669842326:cleanup_file_variables
>   ERROR: Job failed: exit code 1
>   
> 
> build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/32736074):
>   ../tests/chamelium/kms_chamelium_edid.c:143:7: warning: nested extern declaration of ‘drmModeGetPropertyBlob’ [-Wnested-externs]
>     143 |       drmModeGetPropertyBlob(data->drm_fd, edid_blob_id));
>         |       ^~~~~~~~~~~~~~~~~~~~~~
>   ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
>     676 |  do { if (!(expr)) \
>         |             ^~~~
>   ../tests/chamelium/kms_chamelium_edid.c:142:23: warning: assignment to ‘drmModePropertyBlobPtr’ {aka ‘struct _drmModePropertyBlob *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
>     142 |  igt_assert(edid_blob =
>         |                       ^
>   ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
>     676 |  do { if (!(expr)) \
>         |             ^~~~
>   cc1: some warnings being treated as errors
>   ninja: build stopped: subcommand failed.
>   section_end:1669842333:step_script
>   section_start:1669842333:cleanup_file_variables
>   Cleaning up project directory and file based variables
>   section_end:1669842334:cleanup_file_variables
>   ERROR: Job failed: exit code 1
>   
> 
> build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/32736078):
>           uint32_t bpp;
>           ^
>   /usr/include/xf86drmMode.h:221:2: error: unknown type name 'uint32_t'
>           uint32_t depth;
>           ^
>   /usr/include/xf86drmMode.h:223:2: error: unknown type name 'uint32_t'
>           uint32_t handle;
>           ^
>   /usr/include/xf86drmMode.h:229:2: error: unknown type name 'uint32_t'
>           uint32_t id;
>           ^
>   fatal error: too many errors emitted, stopping now [-ferror-limit=]
>   20 errors generated.
>   ninja: build stopped: subcommand failed.
>   section_end:1669842399:step_script
>   section_start:1669842399:cleanup_file_variables
>   Cleaning up project directory and file based variables
>   section_end:1669842399:cleanup_file_variables
>   ERROR: Job failed: exit code 1
>   
> 
> build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/32736077):
>   ../tests/chamelium/kms_chamelium_edid.c:143:7: warning: nested extern declaration of ‘drmModeGetPropertyBlob’ [-Wnested-externs]
>     143 |       drmModeGetPropertyBlob(data->drm_fd, edid_blob_id));
>         |       ^~~~~~~~~~~~~~~~~~~~~~
>   ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
>     676 |  do { if (!(expr)) \
>         |             ^~~~
>   ../tests/chamelium/kms_chamelium_edid.c:142:23: warning: assignment to ‘drmModePropertyBlobPtr’ {aka ‘struct _drmModePropertyBlob *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
>     142 |  igt_assert(edid_blob =
>         |                       ^
>   ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
>     676 |  do { if (!(expr)) \
>         |             ^~~~
>   cc1: some warnings being treated as errors
>   ninja: build stopped: subcommand failed.
>   section_end:1669842332:step_script
>   section_start:1669842332:cleanup_file_variables
>   Cleaning up project directory and file based variables
>   section_end:1669842333:cleanup_file_variables
>   ERROR: Job failed: exit code 1
>   
> 
> build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/32736075):
>   ../tests/chamelium/kms_chamelium_edid.c:143:7: warning: nested extern declaration of ‘drmModeGetPropertyBlob’ [-Wnested-externs]
>     143 |       drmModeGetPropertyBlob(data->drm_fd, edid_blob_id));
>         |       ^~~~~~~~~~~~~~~~~~~~~~
>   ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
>     676 |  do { if (!(expr)) \
>         |             ^~~~
>   ../tests/chamelium/kms_chamelium_edid.c:142:23: warning: assignment to ‘drmModePropertyBlobPtr’ {aka ‘struct _drmModePropertyBlob *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
>     142 |  igt_assert(edid_blob =
>         |                       ^
>   ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
>     676 |  do { if (!(expr)) \
>         |             ^~~~
>   cc1: some warnings being treated as errors
>   ninja: build stopped: subcommand failed.
>   section_end:1669842333:step_script
>   section_start:1669842333:cleanup_file_variables
>   Cleaning up project directory and file based variables
>   section_end:1669842334:cleanup_file_variables
>   ERROR: Job failed: exit code 1
>   
> 
> build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/32736076):
>   ../tests/chamelium/kms_chamelium_edid.c:143:7: warning: nested extern declaration of ‘drmModeGetPropertyBlob’ [-Wnested-externs]
>     143 |       drmModeGetPropertyBlob(data->drm_fd, edid_blob_id));
>         |       ^~~~~~~~~~~~~~~~~~~~~~
>   ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
>     676 |  do { if (!(expr)) \
>         |             ^~~~
>   ../tests/chamelium/kms_chamelium_edid.c:142:23: warning: assignment to ‘drmModePropertyBlobPtr’ {aka ‘struct _drmModePropertyBlob *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
>     142 |  igt_assert(edid_blob =
>         |                       ^
>   ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
>     676 |  do { if (!(expr)) \
>         |             ^~~~
>   cc1: some warnings being treated as errors
>   ninja: build stopped: subcommand failed.
>   section_end:1669842334:step_script
>   section_start:1669842334:cleanup_file_variables
>   Cleaning up project directory and file based variables
>   section_end:1669842335:cleanup_file_variables
>   ERROR: Job failed: exit code 1
> 
> == Logs ==
> 
> For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/751787
