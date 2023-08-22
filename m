Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Date: Tue, 22 Aug 2023 23:13:14 -0000
Message-ID: <169274599431.20550.18340494624310559088@emeril.freedesktop.org>
References: <20230822211711.234230-1-vitaly.prosyak@amd.com>
In-Reply-To: <20230822211711.234230-1-vitaly.prosyak@amd.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/amdgpu=3A_add_sync_object_tests_=28rev3=29?=
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

Series: tests/amdgpu: add sync object tests (rev3)
URL   : https://patchwork.freedesktop.org/series/119304/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/968070 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47872456):
        amdgpu_cs_syncobj_export_sync_file
  ../tests/amdgpu/amd_syncobj.c:209:6: warning: nested extern declaration of ‘amdgpu_cs_syncobj_export_sync_file2’ [-Wnested-externs]
  ../tests/amdgpu/amd_syncobj.c:214:6: error: implicit declaration of function ‘amdgpu_cs_syncobj_import_sync_file2’; did you mean ‘amdgpu_cs_syncobj_import_sync_file’? [-Werror=implicit-function-declaration]
    r = amdgpu_cs_syncobj_import_sync_file2(device_handle, syncobj_handle,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        amdgpu_cs_syncobj_import_sync_file
  ../tests/amdgpu/amd_syncobj.c:214:6: warning: nested extern declaration of ‘amdgpu_cs_syncobj_import_sync_file2’ [-Wnested-externs]
  ../tests/amdgpu/amd_syncobj.c:224:6: error: implicit declaration of function ‘amdgpu_cs_syncobj_timeline_signal’; did you mean ‘amdgpu_cs_syncobj_signal’? [-Werror=implicit-function-declaration]
    r = amdgpu_cs_syncobj_timeline_signal(device_handle, &syncobj_handle,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        amdgpu_cs_syncobj_signal
  ../tests/amdgpu/amd_syncobj.c:224:6: warning: nested extern declaration of ‘amdgpu_cs_syncobj_timeline_signal’ [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1692745661:step_script
  section_start:1692745661:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692745662:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47872459):
        amdgpu_cs_syncobj_export_sync_file
  ../tests/amdgpu/amd_syncobj.c:209:6: warning: nested extern declaration of ‘amdgpu_cs_syncobj_export_sync_file2’ [-Wnested-externs]
  ../tests/amdgpu/amd_syncobj.c:214:6: error: implicit declaration of function ‘amdgpu_cs_syncobj_import_sync_file2’; did you mean ‘amdgpu_cs_syncobj_import_sync_file’? [-Werror=implicit-function-declaration]
    r = amdgpu_cs_syncobj_import_sync_file2(device_handle, syncobj_handle,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        amdgpu_cs_syncobj_import_sync_file
  ../tests/amdgpu/amd_syncobj.c:214:6: warning: nested extern declaration of ‘amdgpu_cs_syncobj_import_sync_file2’ [-Wnested-externs]
  ../tests/amdgpu/amd_syncobj.c:224:6: error: implicit declaration of function ‘amdgpu_cs_syncobj_timeline_signal’; did you mean ‘amdgpu_cs_syncobj_signal’? [-Werror=implicit-function-declaration]
    r = amdgpu_cs_syncobj_timeline_signal(device_handle, &syncobj_handle,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        amdgpu_cs_syncobj_signal
  ../tests/amdgpu/amd_syncobj.c:224:6: warning: nested extern declaration of ‘amdgpu_cs_syncobj_timeline_signal’ [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1692745679:step_script
  section_start:1692745679:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692745679:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47872458):
        amdgpu_cs_syncobj_export_sync_file
  ../tests/amdgpu/amd_syncobj.c:209:6: warning: nested extern declaration of ‘amdgpu_cs_syncobj_export_sync_file2’ [-Wnested-externs]
  ../tests/amdgpu/amd_syncobj.c:214:6: error: implicit declaration of function ‘amdgpu_cs_syncobj_import_sync_file2’; did you mean ‘amdgpu_cs_syncobj_import_sync_file’? [-Werror=implicit-function-declaration]
    r = amdgpu_cs_syncobj_import_sync_file2(device_handle, syncobj_handle,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        amdgpu_cs_syncobj_import_sync_file
  ../tests/amdgpu/amd_syncobj.c:214:6: warning: nested extern declaration of ‘amdgpu_cs_syncobj_import_sync_file2’ [-Wnested-externs]
  ../tests/amdgpu/amd_syncobj.c:224:6: error: implicit declaration of function ‘amdgpu_cs_syncobj_timeline_signal’; did you mean ‘amdgpu_cs_syncobj_signal’? [-Werror=implicit-function-declaration]
    r = amdgpu_cs_syncobj_timeline_signal(device_handle, &syncobj_handle,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        amdgpu_cs_syncobj_signal
  ../tests/amdgpu/amd_syncobj.c:224:6: warning: nested extern declaration of ‘amdgpu_cs_syncobj_timeline_signal’ [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1692745676:step_script
  section_start:1692745676:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692745677:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47872460):
        amdgpu_cs_syncobj_export_sync_file
  ../tests/amdgpu/amd_syncobj.c:209:6: warning: nested extern declaration of ‘amdgpu_cs_syncobj_export_sync_file2’ [-Wnested-externs]
  ../tests/amdgpu/amd_syncobj.c:214:6: error: implicit declaration of function ‘amdgpu_cs_syncobj_import_sync_file2’; did you mean ‘amdgpu_cs_syncobj_import_sync_file’? [-Werror=implicit-function-declaration]
    r = amdgpu_cs_syncobj_import_sync_file2(device_handle, syncobj_handle,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        amdgpu_cs_syncobj_import_sync_file
  ../tests/amdgpu/amd_syncobj.c:214:6: warning: nested extern declaration of ‘amdgpu_cs_syncobj_import_sync_file2’ [-Wnested-externs]
  ../tests/amdgpu/amd_syncobj.c:224:6: error: implicit declaration of function ‘amdgpu_cs_syncobj_timeline_signal’; did you mean ‘amdgpu_cs_syncobj_signal’? [-Werror=implicit-function-declaration]
    r = amdgpu_cs_syncobj_timeline_signal(device_handle, &syncobj_handle,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        amdgpu_cs_syncobj_signal
  ../tests/amdgpu/amd_syncobj.c:224:6: warning: nested extern declaration of ‘amdgpu_cs_syncobj_timeline_signal’ [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1692745691:step_script
  section_start:1692745691:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692745691:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/968070
