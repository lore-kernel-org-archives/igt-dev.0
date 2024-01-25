Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E04FC47422
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 18:52:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45C710E520;
	Thu, 25 Jan 2024 18:52:33 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10FC510EF78;
 Thu, 25 Jan 2024 18:52:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_introduce_Xe_multigpu_a?=
 =?utf-8?q?nd_other_multi-GPU_helpers_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Date: Thu, 25 Jan 2024 18:52:32 -0000
Message-ID: <170620875206.727567.5535986526348398211@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240125183632.50422-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240125183632.50422-1-kamil.konieczny@linux.intel.com>
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

== Series Details ==

Series: introduce Xe multigpu and other multi-GPU helpers (rev3)
URL   : https://patchwork.freedesktop.org/series/129101/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1087015 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/54214077):
  ../tests/intel/xe_exec_basic.c:388:4: note: in expansion of macro ‘xe_multi_fork_foreach_gpu’
      xe_multi_fork_foreach_gpu(xe, gpu_idx)
      ^~~~~~~~~~~~~~~~~~~~~~~~~
  ../lib/intel_multigpu.h:31:30: warning: nested extern declaration of ‘multigpu_aquire_view’ [-Wnested-externs]
    igt_multi_fork(__gpu_index, multigpu_aquire_view(2, DRIVER_XE)) \
                                ^~~~~~~~~~~~~~~~~~~~
  ../lib/igt_core.h:1133:31: note: in definition of macro ‘igt_multi_fork’
    for (int child = 0; child < (num_children); child++) \
                                 ^~~~~~~~~~~~
  ../tests/intel/xe_exec_basic.c:388:4: note: in expansion of macro ‘xe_multi_fork_foreach_gpu’
      xe_multi_fork_foreach_gpu(xe, gpu_idx)
      ^~~~~~~~~~~~~~~~~~~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1706208685:step_script
  section_start:1706208685:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1706208686:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/54214080):
  ../tests/intel/xe_exec_basic.c:388:4: note: in expansion of macro ‘xe_multi_fork_foreach_gpu’
      xe_multi_fork_foreach_gpu(xe, gpu_idx)
      ^~~~~~~~~~~~~~~~~~~~~~~~~
  ../lib/intel_multigpu.h:31:30: warning: nested extern declaration of ‘multigpu_aquire_view’ [-Wnested-externs]
    igt_multi_fork(__gpu_index, multigpu_aquire_view(2, DRIVER_XE)) \
                                ^~~~~~~~~~~~~~~~~~~~
  ../lib/igt_core.h:1133:31: note: in definition of macro ‘igt_multi_fork’
    for (int child = 0; child < (num_children); child++) \
                                 ^~~~~~~~~~~~
  ../tests/intel/xe_exec_basic.c:388:4: note: in expansion of macro ‘xe_multi_fork_foreach_gpu’
      xe_multi_fork_foreach_gpu(xe, gpu_idx)
      ^~~~~~~~~~~~~~~~~~~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1706208700:step_script
  section_start:1706208700:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1706208700:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/54214079):
  ../tests/intel/xe_exec_basic.c:388:4: note: in expansion of macro ‘xe_multi_fork_foreach_gpu’
      xe_multi_fork_foreach_gpu(xe, gpu_idx)
      ^~~~~~~~~~~~~~~~~~~~~~~~~
  ../lib/intel_multigpu.h:31:30: warning: nested extern declaration of ‘multigpu_aquire_view’ [-Wnested-externs]
    igt_multi_fork(__gpu_index, multigpu_aquire_view(2, DRIVER_XE)) \
                                ^~~~~~~~~~~~~~~~~~~~
  ../lib/igt_core.h:1133:31: note: in definition of macro ‘igt_multi_fork’
    for (int child = 0; child < (num_children); child++) \
                                 ^~~~~~~~~~~~
  ../tests/intel/xe_exec_basic.c:388:4: note: in expansion of macro ‘xe_multi_fork_foreach_gpu’
      xe_multi_fork_foreach_gpu(xe, gpu_idx)
      ^~~~~~~~~~~~~~~~~~~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1706208695:step_script
  section_start:1706208695:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1706208696:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/54214081):
  ../tests/intel/xe_exec_basic.c:388:4: note: in expansion of macro ‘xe_multi_fork_foreach_gpu’
      xe_multi_fork_foreach_gpu(xe, gpu_idx)
      ^~~~~~~~~~~~~~~~~~~~~~~~~
  ../lib/intel_multigpu.h:31:30: warning: nested extern declaration of ‘multigpu_aquire_view’ [-Wnested-externs]
    igt_multi_fork(__gpu_index, multigpu_aquire_view(2, DRIVER_XE)) \
                                ^~~~~~~~~~~~~~~~~~~~
  ../lib/igt_core.h:1133:31: note: in definition of macro ‘igt_multi_fork’
    for (int child = 0; child < (num_children); child++) \
                                 ^~~~~~~~~~~~
  ../tests/intel/xe_exec_basic.c:388:4: note: in expansion of macro ‘xe_multi_fork_foreach_gpu’
      xe_multi_fork_foreach_gpu(xe, gpu_idx)
      ^~~~~~~~~~~~~~~~~~~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1706208703:step_script
  section_start:1706208703:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1706208704:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/54214072):
  ../tests/intel/xe_exec_basic.c:388:4: note: in expansion of macro ‘xe_multi_fork_foreach_gpu’
    388 |    xe_multi_fork_foreach_gpu(xe, gpu_idx)
        |    ^~~~~~~~~~~~~~~~~~~~~~~~~
  ../lib/intel_multigpu.h:31:30: warning: nested extern declaration of ‘multigpu_aquire_view’ [-Wnested-externs]
     31 |  igt_multi_fork(__gpu_index, multigpu_aquire_view(2, DRIVER_XE)) \
        |                              ^~~~~~~~~~~~~~~~~~~~
  ../lib/igt_core.h:1133:31: note: in definition of macro ‘igt_multi_fork’
   1133 |  for (int child = 0; child < (num_children); child++) \
        |                               ^~~~~~~~~~~~
  ../tests/intel/xe_exec_basic.c:388:4: note: in expansion of macro ‘xe_multi_fork_foreach_gpu’
    388 |    xe_multi_fork_foreach_gpu(xe, gpu_idx)
        |    ^~~~~~~~~~~~~~~~~~~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1706208696:step_script
  section_start:1706208696:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1706208697:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/54214076):
  ../tests/intel/xe_exec_basic.c:395:4: error: implicit declaration of function 'multigpu_aquire_view' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                          xe_multi_fork_foreach_gpu(xe, gpu_idx)
                          ^
  ../lib/intel_multigpu.h:31:30: note: expanded from macro 'xe_multi_fork_foreach_gpu'
          igt_multi_fork(__gpu_index, multigpu_aquire_view(2, DRIVER_XE)) \
                                      ^
  ../tests/intel/xe_exec_basic.c:402:4: error: implicit declaration of function 'multigpu_aquire_view' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                          xe_multi_fork_foreach_gpu(xe, gpu_idx)
                          ^
  ../lib/intel_multigpu.h:31:30: note: expanded from macro 'xe_multi_fork_foreach_gpu'
          igt_multi_fork(__gpu_index, multigpu_aquire_view(2, DRIVER_XE)) \
                                      ^
  3 errors generated.
  ninja: build stopped: subcommand failed.
  section_end:1706208713:step_script
  section_start:1706208713:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1706208714:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/54214075):
  ../tests/intel/xe_exec_basic.c:388:4: note: in expansion of macro ‘xe_multi_fork_foreach_gpu’
    388 |    xe_multi_fork_foreach_gpu(xe, gpu_idx)
        |    ^~~~~~~~~~~~~~~~~~~~~~~~~
  ../lib/intel_multigpu.h:31:30: warning: nested extern declaration of ‘multigpu_aquire_view’ [-Wnested-externs]
     31 |  igt_multi_fork(__gpu_index, multigpu_aquire_view(2, DRIVER_XE)) \
        |                              ^~~~~~~~~~~~~~~~~~~~
  ../lib/igt_core.h:1133:31: note: in definition of macro ‘igt_multi_fork’
   1133 |  for (int child = 0; child < (num_children); child++) \
        |                               ^~~~~~~~~~~~
  ../tests/intel/xe_exec_basic.c:388:4: note: in expansion of macro ‘xe_multi_fork_foreach_gpu’
    388 |    xe_multi_fork_foreach_gpu(xe, gpu_idx)
        |    ^~~~~~~~~~~~~~~~~~~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1706208700:step_script
  section_start:1706208700:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1706208702:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/54214073):
  ../tests/intel/xe_exec_basic.c:388:4: note: in expansion of macro ‘xe_multi_fork_foreach_gpu’
    388 |    xe_multi_fork_foreach_gpu(xe, gpu_idx)
        |    ^~~~~~~~~~~~~~~~~~~~~~~~~
  ../lib/intel_multigpu.h:31:30: warning: nested extern declaration of ‘multigpu_aquire_view’ [-Wnested-externs]
     31 |  igt_multi_fork(__gpu_index, multigpu_aquire_view(2, DRIVER_XE)) \
        |                              ^~~~~~~~~~~~~~~~~~~~
  ../lib/igt_core.h:1133:31: note: in definition of macro ‘igt_multi_fork’
   1133 |  for (int child = 0; child < (num_children); child++) \
        |                               ^~~~~~~~~~~~
  ../tests/intel/xe_exec_basic.c:388:4: note: in expansion of macro ‘xe_multi_fork_foreach_gpu’
    388 |    xe_multi_fork_foreach_gpu(xe, gpu_idx)
        |    ^~~~~~~~~~~~~~~~~~~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1706208700:step_script
  section_start:1706208700:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1706208702:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/54214074):
  ../tests/intel/xe_exec_basic.c:388:4: note: in expansion of macro ‘xe_multi_fork_foreach_gpu’
    388 |    xe_multi_fork_foreach_gpu(xe, gpu_idx)
        |    ^~~~~~~~~~~~~~~~~~~~~~~~~
  ../lib/intel_multigpu.h:31:30: warning: nested extern declaration of ‘multigpu_aquire_view’ [-Wnested-externs]
     31 |  igt_multi_fork(__gpu_index, multigpu_aquire_view(2, DRIVER_XE)) \
        |                              ^~~~~~~~~~~~~~~~~~~~
  ../lib/igt_core.h:1133:31: note: in definition of macro ‘igt_multi_fork’
   1133 |  for (int child = 0; child < (num_children); child++) \
        |                               ^~~~~~~~~~~~
  ../tests/intel/xe_exec_basic.c:388:4: note: in expansion of macro ‘xe_multi_fork_foreach_gpu’
    388 |    xe_multi_fork_foreach_gpu(xe, gpu_idx)
        |    ^~~~~~~~~~~~~~~~~~~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1706208693:step_script
  section_start:1706208693:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1706208694:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1087015
