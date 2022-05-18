Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Date: Wed, 18 May 2022 20:01:49 -0000
Message-ID: <165290410931.21386.16553799721281957761@emeril.freedesktop.org>
References: <20220518194137.3452-1-vitaly.prosyak@amd.com>
In-Reply-To: <20220518194137.3452-1-vitaly.prosyak@amd.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/amdgpu/amd=5Fbasic=3A_refactoring_the_basic_tests?=
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

Series: tests/amdgpu/amd_basic: refactoring the basic tests
URL   : https://patchwork.freedesktop.org/series/104142/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/590060 for the overview.

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/22875248):
  /usr/bin/ld: lib/libigt-amdgpu_amd_gfx_c.a(amdgpu_amd_gfx.c.o): in function `amdgpu_command_submission_gfx_shared_ib':
  /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_gfx.c:136: undefined reference to `amdgpu_cs_ctx_create'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_gfx.c:173: undefined reference to `amdgpu_cs_submit'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_gfx.c:182: undefined reference to `amdgpu_cs_query_fence_status'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_gfx.c:190: undefined reference to `amdgpu_bo_list_destroy'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_gfx.c:193: undefined reference to `amdgpu_cs_ctx_free'
  /usr/bin/ld: lib/libigt-amdgpu_amd_fence_c.a(amdgpu_amd_fence.c.o): in function `amdgpu_command_submission_multi_fence_wait_all':
  /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_fence.c:50: undefined reference to `amdgpu_cs_ctx_create'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_fence.c:96: undefined reference to `amdgpu_cs_submit'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_fence.c:106: undefined reference to `amdgpu_cs_wait_fences'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_fence.c:117: undefined reference to `amdgpu_bo_list_destroy'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_fence.c:120: undefined reference to `amdgpu_cs_ctx_free'
  collect2: error: ld returned 1 exit status
  ninja: build stopped: subcommand failed.
  section_end:1652903957:step_script
  section_start:1652903957:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1652903958:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/22875245):
  /usr/bin/ld: lib/libigt-amdgpu_amd_gfx_c.a(amdgpu_amd_gfx.c.o): in function `amdgpu_command_submission_gfx_shared_ib':
  /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_gfx.c:136: undefined reference to `amdgpu_cs_ctx_create'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_gfx.c:173: undefined reference to `amdgpu_cs_submit'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_gfx.c:182: undefined reference to `amdgpu_cs_query_fence_status'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_gfx.c:190: undefined reference to `amdgpu_bo_list_destroy'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_gfx.c:193: undefined reference to `amdgpu_cs_ctx_free'
  /usr/bin/ld: lib/libigt-amdgpu_amd_fence_c.a(amdgpu_amd_fence.c.o): in function `amdgpu_command_submission_multi_fence_wait_all':
  /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_fence.c:50: undefined reference to `amdgpu_cs_ctx_create'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_fence.c:96: undefined reference to `amdgpu_cs_submit'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_fence.c:106: undefined reference to `amdgpu_cs_wait_fences'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_fence.c:117: undefined reference to `amdgpu_bo_list_destroy'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/amdgpu/amd_fence.c:120: undefined reference to `amdgpu_cs_ctx_free'
  collect2: error: ld returned 1 exit status
  ninja: build stopped: subcommand failed.
  section_end:1652903964:step_script
  section_start:1652903964:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1652903965:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/590060
