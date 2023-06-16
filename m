Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Date: Fri, 16 Jun 2023 00:27:18 -0000
Message-ID: <168687523825.9826.2102300803211790206@emeril.freedesktop.org>
References: <20230615223936.86834-1-vitaly.prosyak@amd.com>
In-Reply-To: <20230615223936.86834-1-vitaly.prosyak@amd.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_s?=
 =?utf-8?q?eries_starting_with_=5B1/2=5D_tests/amdgpu=3A_add_bo_tests?=
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

Series: series starting with [1/2] tests/amdgpu: add bo tests
URL   : https://patchwork.freedesktop.org/series/119417/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/910520 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/43872297):
        amdgpu_cs_syncobj_export_sync_file
  ../tests/amdgpu/amd_syncobj.c:210:6: warning: nested extern declaration of ‘amdgpu_cs_syncobj_export_sync_file2’ [-Wnested-externs]
  ../tests/amdgpu/amd_syncobj.c:215:6: error: implicit declaration of function ‘amdgpu_cs_syncobj_import_sync_file2’; did you mean ‘amdgpu_cs_syncobj_import_sync_file’? [-Werror=implicit-function-declaration]
    r = amdgpu_cs_syncobj_import_sync_file2(device_handle, syncobj_handle,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        amdgpu_cs_syncobj_import_sync_file
  ../tests/amdgpu/amd_syncobj.c:215:6: warning: nested extern declaration of ‘amdgpu_cs_syncobj_import_sync_file2’ [-Wnested-externs]
  ../tests/amdgpu/amd_syncobj.c:225:6: error: implicit declaration of function ‘amdgpu_cs_syncobj_timeline_signal’; did you mean ‘amdgpu_cs_syncobj_signal’? [-Werror=implicit-function-declaration]
    r = amdgpu_cs_syncobj_timeline_signal(device_handle, &syncobj_handle,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        amdgpu_cs_syncobj_signal
  ../tests/amdgpu/amd_syncobj.c:225:6: warning: nested extern declaration of ‘amdgpu_cs_syncobj_timeline_signal’ [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1686874809:step_script
  section_start:1686874809:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1686874810:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/43872300):
        amdgpu_cs_syncobj_export_sync_file
  ../tests/amdgpu/amd_syncobj.c:210:6: warning: nested extern declaration of ‘amdgpu_cs_syncobj_export_sync_file2’ [-Wnested-externs]
  ../tests/amdgpu/amd_syncobj.c:215:6: error: implicit declaration of function ‘amdgpu_cs_syncobj_import_sync_file2’; did you mean ‘amdgpu_cs_syncobj_import_sync_file’? [-Werror=implicit-function-declaration]
    r = amdgpu_cs_syncobj_import_sync_file2(device_handle, syncobj_handle,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        amdgpu_cs_syncobj_import_sync_file
  ../tests/amdgpu/amd_syncobj.c:215:6: warning: nested extern declaration of ‘amdgpu_cs_syncobj_import_sync_file2’ [-Wnested-externs]
  ../tests/amdgpu/amd_syncobj.c:225:6: error: implicit declaration of function ‘amdgpu_cs_syncobj_timeline_signal’; did you mean ‘amdgpu_cs_syncobj_signal’? [-Werror=implicit-function-declaration]
    r = amdgpu_cs_syncobj_timeline_signal(device_handle, &syncobj_handle,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        amdgpu_cs_syncobj_signal
  ../tests/amdgpu/amd_syncobj.c:225:6: warning: nested extern declaration of ‘amdgpu_cs_syncobj_timeline_signal’ [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1686874842:step_script
  section_start:1686874842:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1686874844:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/43872299):
        amdgpu_cs_syncobj_export_sync_file
  ../tests/amdgpu/amd_syncobj.c:210:6: warning: nested extern declaration of ‘amdgpu_cs_syncobj_export_sync_file2’ [-Wnested-externs]
  ../tests/amdgpu/amd_syncobj.c:215:6: error: implicit declaration of function ‘amdgpu_cs_syncobj_import_sync_file2’; did you mean ‘amdgpu_cs_syncobj_import_sync_file’? [-Werror=implicit-function-declaration]
    r = amdgpu_cs_syncobj_import_sync_file2(device_handle, syncobj_handle,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        amdgpu_cs_syncobj_import_sync_file
  ../tests/amdgpu/amd_syncobj.c:215:6: warning: nested extern declaration of ‘amdgpu_cs_syncobj_import_sync_file2’ [-Wnested-externs]
  ../tests/amdgpu/amd_syncobj.c:225:6: error: implicit declaration of function ‘amdgpu_cs_syncobj_timeline_signal’; did you mean ‘amdgpu_cs_syncobj_signal’? [-Werror=implicit-function-declaration]
    r = amdgpu_cs_syncobj_timeline_signal(device_handle, &syncobj_handle,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        amdgpu_cs_syncobj_signal
  ../tests/amdgpu/amd_syncobj.c:225:6: warning: nested extern declaration of ‘amdgpu_cs_syncobj_timeline_signal’ [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1686874887:step_script
  section_start:1686874887:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1686874887:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/43872301):
        amdgpu_cs_syncobj_export_sync_file
  ../tests/amdgpu/amd_syncobj.c:210:6: warning: nested extern declaration of ‘amdgpu_cs_syncobj_export_sync_file2’ [-Wnested-externs]
  ../tests/amdgpu/amd_syncobj.c:215:6: error: implicit declaration of function ‘amdgpu_cs_syncobj_import_sync_file2’; did you mean ‘amdgpu_cs_syncobj_import_sync_file’? [-Werror=implicit-function-declaration]
    r = amdgpu_cs_syncobj_import_sync_file2(device_handle, syncobj_handle,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        amdgpu_cs_syncobj_import_sync_file
  ../tests/amdgpu/amd_syncobj.c:215:6: warning: nested extern declaration of ‘amdgpu_cs_syncobj_import_sync_file2’ [-Wnested-externs]
  ../tests/amdgpu/amd_syncobj.c:225:6: error: implicit declaration of function ‘amdgpu_cs_syncobj_timeline_signal’; did you mean ‘amdgpu_cs_syncobj_signal’? [-Werror=implicit-function-declaration]
    r = amdgpu_cs_syncobj_timeline_signal(device_handle, &syncobj_handle,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        amdgpu_cs_syncobj_signal
  ../tests/amdgpu/amd_syncobj.c:225:6: warning: nested extern declaration of ‘amdgpu_cs_syncobj_timeline_signal’ [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1686874853:step_script
  section_start:1686874853:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1686874854:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/910520
