Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Date: Wed, 18 May 2022 22:47:26 -0000
Message-ID: <165291404662.21389.17091844487126328724@emeril.freedesktop.org>
References: <20220518224243.4310-1-vitaly.prosyak@amd.com>
In-Reply-To: <20220518224243.4310-1-vitaly.prosyak@amd.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/amdgpu=3A_refactoring_and_update_amd=5Fbasic_tests_=28rev2?=
 =?utf-8?q?=29?=
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

Series: tests/amdgpu: refactoring and update amd_basic tests (rev2)
URL   : https://patchwork.freedesktop.org/series/104149/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/590162 for the overview.

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/22879030):
  /usr/bin/ld: lib/libigt-amdgpu_amd_gfx_c.a(amdgpu_amd_gfx.c.o): in function `amdgpu_command_submission_gfx_shared_ib':
  /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_gfx.c:137: undefined reference to `amdgpu_cs_ctx_create'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_gfx.c:174: undefined reference to `amdgpu_cs_submit'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_gfx.c:183: undefined reference to `amdgpu_cs_query_fence_status'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_gfx.c:191: undefined reference to `amdgpu_bo_list_destroy'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_gfx.c:194: undefined reference to `amdgpu_cs_ctx_free'
  /usr/bin/ld: lib/libigt-amdgpu_amd_fence_c.a(amdgpu_amd_fence.c.o): in function `amdgpu_command_submission_multi_fence_wait_all':
  /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_fence.c:51: undefined reference to `amdgpu_cs_ctx_create'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_fence.c:97: undefined reference to `amdgpu_cs_submit'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_fence.c:107: undefined reference to `amdgpu_cs_wait_fences'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_fence.c:118: undefined reference to `amdgpu_bo_list_destroy'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_fence.c:121: undefined reference to `amdgpu_cs_ctx_free'
  collect2: error: ld returned 1 exit status
  ninja: build stopped: subcommand failed.
  section_end:1652913909:step_script
  section_start:1652913909:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1652913910:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/22879027):
  /usr/bin/ld: lib/libigt-amdgpu_amd_gfx_c.a(amdgpu_amd_gfx.c.o): in function `amdgpu_command_submission_gfx_shared_ib':
  /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_gfx.c:137: undefined reference to `amdgpu_cs_ctx_create'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_gfx.c:174: undefined reference to `amdgpu_cs_submit'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_gfx.c:183: undefined reference to `amdgpu_cs_query_fence_status'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_gfx.c:191: undefined reference to `amdgpu_bo_list_destroy'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_gfx.c:194: undefined reference to `amdgpu_cs_ctx_free'
  /usr/bin/ld: lib/libigt-amdgpu_amd_fence_c.a(amdgpu_amd_fence.c.o): in function `amdgpu_command_submission_multi_fence_wait_all':
  /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_fence.c:51: undefined reference to `amdgpu_cs_ctx_create'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_fence.c:97: undefined reference to `amdgpu_cs_submit'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_fence.c:107: undefined reference to `amdgpu_cs_wait_fences'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_fence.c:118: undefined reference to `amdgpu_bo_list_destroy'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_fence.c:121: undefined reference to `amdgpu_cs_ctx_free'
  collect2: error: ld returned 1 exit status
  ninja: build stopped: subcommand failed.
  section_end:1652913917:step_script
  section_start:1652913917:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1652913918:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/590162
