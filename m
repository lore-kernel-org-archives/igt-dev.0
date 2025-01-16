Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CEFAE77188
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jan 2025 07:29:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9B610E8E6;
	Thu, 16 Jan 2025 07:29:58 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A3A310E8E5;
 Thu, 16 Jan 2025 07:29:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_The_series_add_support_?=
 =?utf-8?q?for_UMQ_submission?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sunil Khatri" <sunil.khatri@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 16 Jan 2025 07:29:57 -0000
Message-ID: <173701259703.189358.12734611678622990358@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250116065211.1882469-1-sunil.khatri@amd.com>
In-Reply-To: <20250116065211.1882469-1-sunil.khatri@amd.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
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

== Series Details ==

Series: The series add support for UMQ submission
URL   : https://patchwork.freedesktop.org/series/143586/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1346611 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/69437776):
  ../lib/amdgpu/amd_user_queue.c: In function ‘amdgpu_user_queue_destroy’:
  ../lib/amdgpu/amd_user_queue.c:183:6: error: implicit declaration of function ‘amdgpu_free_userqueue’; did you mean ‘amdgpu_open_devices’? [-Werror=implicit-function-declaration]
    r = amdgpu_free_userqueue(device_handle, ctxt->queue_id);
        ^~~~~~~~~~~~~~~~~~~~~
        amdgpu_open_devices
  ../lib/amdgpu/amd_user_queue.c:183:6: warning: nested extern declaration of ‘amdgpu_free_userqueue’ [-Wnested-externs]
  ../lib/amdgpu/amd_user_queue.c: In function ‘amdgpu_user_queue_create’:
  ../lib/amdgpu/amd_user_queue.c:387:7: error: implicit declaration of function ‘amdgpu_create_userqueue’; did you mean ‘amdgpu_cs_create_semaphore’? [-Werror=implicit-function-declaration]
     r = amdgpu_create_userqueue(device_handle, AMDGPU_HW_IP_GFX,
         ^~~~~~~~~~~~~~~~~~~~~~~
         amdgpu_cs_create_semaphore
  ../lib/amdgpu/amd_user_queue.c:387:7: warning: nested extern declaration of ‘amdgpu_create_userqueue’ [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1737012393:step_script
  section_start:1737012393:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1737012394:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/69437779):
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out b1b83419 as detached HEAD (ref is intel/IGTPW_12446)...
  Removing build/
  Removing lib/i915/perf-configs/__pycache__/
  Removing lib/xe/oa-configs/__pycache__/
  Removing scripts/__pycache__/
  
  Skipping Git submodules setup
  section_end:1737012396:get_sources
  section_start:1737012396:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:7360075a71dacfc66f0b49b3271b9a459904dbe51c5760efac48fe52da27946c for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-b1b83419cb66f61b2cb566c4521b0568d442947f with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64@sha256:df8438cd0e218646c3bdc2eb6abccb43c4e884bfd40a1a4dd0365f1f8031d21f ...
  section_end:1737012399:step_script
  section_start:1737012399:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1737012401:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: no such image: docker.io/library/sha256:7360075a71dacfc66f0b49b3271b9a459904dbe51c5760efac48fe52da27946c: image not known (docker.go:650:0s)

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/69437778):
  ../lib/amdgpu/amd_user_queue.c: In function ‘amdgpu_user_queue_destroy’:
  ../lib/amdgpu/amd_user_queue.c:183:6: error: implicit declaration of function ‘amdgpu_free_userqueue’; did you mean ‘amdgpu_open_devices’? [-Werror=implicit-function-declaration]
    r = amdgpu_free_userqueue(device_handle, ctxt->queue_id);
        ^~~~~~~~~~~~~~~~~~~~~
        amdgpu_open_devices
  ../lib/amdgpu/amd_user_queue.c:183:6: warning: nested extern declaration of ‘amdgpu_free_userqueue’ [-Wnested-externs]
  ../lib/amdgpu/amd_user_queue.c: In function ‘amdgpu_user_queue_create’:
  ../lib/amdgpu/amd_user_queue.c:387:7: error: implicit declaration of function ‘amdgpu_create_userqueue’; did you mean ‘amdgpu_cs_create_semaphore’? [-Werror=implicit-function-declaration]
     r = amdgpu_create_userqueue(device_handle, AMDGPU_HW_IP_GFX,
         ^~~~~~~~~~~~~~~~~~~~~~~
         amdgpu_cs_create_semaphore
  ../lib/amdgpu/amd_user_queue.c:387:7: warning: nested extern declaration of ‘amdgpu_create_userqueue’ [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1737012411:step_script
  section_start:1737012411:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1737012412:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/69437780):
  section_start:1737012390:get_sources
  Getting source from Git repository
  $ /host/bin/curl -s -L --cacert /host/ca-certificates.crt --retry 4 -f --retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra/-/raw/main/runner-gating/runner-gating.sh | sh -s -- pre_get_sources_script
  Checking if the user of the pipeline is allowed...
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out b1b83419 as detached HEAD (ref is intel/IGTPW_12446)...
  
  Skipping Git submodules setup
  section_end:1737012393:get_sources
  section_start:1737012393:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:cc55efdc667be826910d414a562c76ce1130a9c15255a0dd115431bc42f83448 for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-b1b83419cb66f61b2cb566c4521b0568d442947f with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips@sha256:c829c44880da4782b7a72626c259ac6904b4bd5f08601e66b3be889ca1c0cf79 ...
  section_end:1737012399:step_script
  section_start:1737012399:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1737012401:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: no such image: docker.io/library/sha256:cc55efdc667be826910d414a562c76ce1130a9c15255a0dd115431bc42f83448: image not known (docker.go:650:0s)

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/69437771):
        |      amdgpu_query_info
  ../lib/amdgpu/amd_user_queue.c:164:6: warning: nested extern declaration of ‘amdgpu_userq_signal’ [-Wnested-externs]
  ../lib/amdgpu/amd_user_queue.c: In function ‘amdgpu_user_queue_destroy’:
  ../lib/amdgpu/amd_user_queue.c:183:6: error: implicit declaration of function ‘amdgpu_free_userqueue’ [-Werror=implicit-function-declaration]
    183 |  r = amdgpu_free_userqueue(device_handle, ctxt->queue_id);
        |      ^~~~~~~~~~~~~~~~~~~~~
  ../lib/amdgpu/amd_user_queue.c:183:6: warning: nested extern declaration of ‘amdgpu_free_userqueue’ [-Wnested-externs]
  ../lib/amdgpu/amd_user_queue.c: In function ‘amdgpu_user_queue_create’:
  ../lib/amdgpu/amd_user_queue.c:387:7: error: implicit declaration of function ‘amdgpu_create_userqueue’ [-Werror=implicit-function-declaration]
    387 |   r = amdgpu_create_userqueue(device_handle, AMDGPU_HW_IP_GFX,
        |       ^~~~~~~~~~~~~~~~~~~~~~~
  ../lib/amdgpu/amd_user_queue.c:387:7: warning: nested extern declaration of ‘amdgpu_create_userqueue’ [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1737012392:step_script
  section_start:1737012392:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1737012393:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/69437775):
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out b1b83419 as detached HEAD (ref is intel/IGTPW_12446)...
  Removing build/
  Removing lib/i915/perf-configs/__pycache__/
  Removing lib/xe/oa-configs/__pycache__/
  Removing scripts/__pycache__/
  
  Skipping Git submodules setup
  section_end:1737012393:get_sources
  section_start:1737012393:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-b1b83419cb66f61b2cb566c4521b0568d442947f with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora@sha256:17d64607d998df2bf29a56b88922d3a598e6f1daa3b51ece2a892c2f293daf83 ...
  section_end:1737012399:step_script
  section_start:1737012399:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1737012401:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: no such image: docker.io/library/sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f: image not known (docker.go:650:0s)

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/69437772):
  section_start:1737012388:get_sources
  Getting source from Git repository
  $ /host/bin/curl -s -L --cacert /host/ca-certificates.crt --retry 4 -f --retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra/-/raw/main/runner-gating/runner-gating.sh | sh -s -- pre_get_sources_script
  Checking if the user of the pipeline is allowed...
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out b1b83419 as detached HEAD (ref is intel/IGTPW_12446)...
  
  Skipping Git submodules setup
  section_end:1737012393:get_sources
  section_start:1737012393:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-b1b83419cb66f61b2cb566c4521b0568d442947f with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora@sha256:17d64607d998df2bf29a56b88922d3a598e6f1daa3b51ece2a892c2f293daf83 ...
  section_end:1737012399:step_script
  section_start:1737012399:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1737012401:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: no such image: docker.io/library/sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f: image not known (docker.go:650:0s)

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/69437773):
        |      amdgpu_query_info
  ../lib/amdgpu/amd_user_queue.c:164:6: warning: nested extern declaration of ‘amdgpu_userq_signal’ [-Wnested-externs]
  ../lib/amdgpu/amd_user_queue.c: In function ‘amdgpu_user_queue_destroy’:
  ../lib/amdgpu/amd_user_queue.c:183:6: error: implicit declaration of function ‘amdgpu_free_userqueue’ [-Werror=implicit-function-declaration]
    183 |  r = amdgpu_free_userqueue(device_handle, ctxt->queue_id);
        |      ^~~~~~~~~~~~~~~~~~~~~
  ../lib/amdgpu/amd_user_queue.c:183:6: warning: nested extern declaration of ‘amdgpu_free_userqueue’ [-Wnested-externs]
  ../lib/amdgpu/amd_user_queue.c: In function ‘amdgpu_user_queue_create’:
  ../lib/amdgpu/amd_user_queue.c:387:7: error: implicit declaration of function ‘amdgpu_create_userqueue’ [-Werror=implicit-function-declaration]
    387 |   r = amdgpu_create_userqueue(device_handle, AMDGPU_HW_IP_GFX,
        |       ^~~~~~~~~~~~~~~~~~~~~~~
  ../lib/amdgpu/amd_user_queue.c:387:7: warning: nested extern declaration of ‘amdgpu_create_userqueue’ [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1737012391:step_script
  section_start:1737012391:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1737012391:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1346611
