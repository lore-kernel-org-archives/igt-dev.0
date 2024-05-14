Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C871AC04FFE
	for <igt-dev@archiver.kernel.org>; Tue, 14 May 2024 07:58:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701BE10E415;
	Tue, 14 May 2024 07:58:59 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9218010E415;
 Tue, 14 May 2024 07:58:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_helper_function_=28rev2?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bommu Krishnaiah" <krishnaiah.bommu@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 14 May 2024 07:58:57 -0000
Message-ID: <171567353759.2114161.14381807463129975477@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240514071026.748257-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20240514071026.748257-1-krishnaiah.bommu@intel.com>
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

Series: helper function (rev2)
URL   : https://patchwork.freedesktop.org/series/133096/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1177054 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/58697849):
  Warning: igt@xe_svm@svm-basic-mmap Category documentation is missing
  Warning: igt@xe_svm@svm-benchmark Category documentation is missing
  Warning: igt@xe_svm@svm-huge-page Category documentation is missing
  Warning: igt@xe_svm@svm-mprotect Category documentation is missing
  Warning: igt@xe_svm@svm-random-access Category documentation is missing
  Warning: igt@xe_svm@svm-sparse-access Category documentation is missing
  Warning: igt@xe_svm@svm_invalid_va Category documentation is missing
  Warning: igt@xe_svm@xe_basic Category documentation is missing
  Warning: Documented igt@xe_svm@svm_invalid_va doesn't exist on source files
  Warning: Documented igt@xe_svm@xe_basic doesn't exist on source files
  Warning: Missing documentation for igt@xe_svm@svm-invalid-va
  Warning: Missing documentation for igt@xe_svm@xe-basic
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1715673253:step_script
  section_start:1715673253:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1715673254:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/58697851):
                                                                                                             ^
  ../lib/xe/xe_util.c: In function ‘xe_destroy_buffer’:
  ../lib/xe/xe_util.c:80:15: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
    sync->addr = (uint64_t)buffer->bind_ufence;
                 ^
  ../lib/xe/xe_util.c:82:68: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
    xe_vm_unbind_async(buffer->fd, buffer->vm, buffer->bind_queue, 0, (uint64_t)buffer->gpu_addr, buffer->size, sync, 1);
                                                                      ^
  ../lib/xe/xe_util.c: In function ‘xe_cmdbuf_exec_ufence_gpuva’:
  ../lib/xe/xe_util.c:191:9: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
    return (uint64_t)cmd_buf->gpu_addr + cmd_buf->size - 8;
           ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1715673195:step_script
  section_start:1715673195:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1715673196:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/58697853):
                                                                                                             ^
  ../lib/xe/xe_util.c: In function ‘xe_destroy_buffer’:
  ../lib/xe/xe_util.c:80:15: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
    sync->addr = (uint64_t)buffer->bind_ufence;
                 ^
  ../lib/xe/xe_util.c:82:68: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
    xe_vm_unbind_async(buffer->fd, buffer->vm, buffer->bind_queue, 0, (uint64_t)buffer->gpu_addr, buffer->size, sync, 1);
                                                                      ^
  ../lib/xe/xe_util.c: In function ‘xe_cmdbuf_exec_ufence_gpuva’:
  ../lib/xe/xe_util.c:191:9: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
    return (uint64_t)cmd_buf->gpu_addr + cmd_buf->size - 8;
           ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1715673195:step_script
  section_start:1715673195:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1715673196:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/58697844):
  Warning: igt@xe_svm@svm-basic-mmap Category documentation is missing
  Warning: igt@xe_svm@svm-benchmark Category documentation is missing
  Warning: igt@xe_svm@svm-huge-page Category documentation is missing
  Warning: igt@xe_svm@svm-mprotect Category documentation is missing
  Warning: igt@xe_svm@svm-random-access Category documentation is missing
  Warning: igt@xe_svm@svm-sparse-access Category documentation is missing
  Warning: igt@xe_svm@svm_invalid_va Category documentation is missing
  Warning: igt@xe_svm@xe_basic Category documentation is missing
  Warning: Documented igt@xe_svm@svm_invalid_va doesn't exist on source files
  Warning: Documented igt@xe_svm@xe_basic doesn't exist on source files
  Warning: Missing documentation for igt@xe_svm@svm-invalid-va
  Warning: Missing documentation for igt@xe_svm@xe-basic
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1715673241:step_script
  section_start:1715673241:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1715673242:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/58697848):
  Warning: igt@xe_svm@svm-basic-mmap Category documentation is missing
  Warning: igt@xe_svm@svm-benchmark Category documentation is missing
  Warning: igt@xe_svm@svm-huge-page Category documentation is missing
  Warning: igt@xe_svm@svm-mprotect Category documentation is missing
  Warning: igt@xe_svm@svm-random-access Category documentation is missing
  Warning: igt@xe_svm@svm-sparse-access Category documentation is missing
  Warning: igt@xe_svm@svm_invalid_va Category documentation is missing
  Warning: igt@xe_svm@xe_basic Category documentation is missing
  Warning: Documented igt@xe_svm@svm_invalid_va doesn't exist on source files
  Warning: Documented igt@xe_svm@xe_basic doesn't exist on source files
  Warning: Missing documentation for igt@xe_svm@svm-invalid-va
  Warning: Missing documentation for igt@xe_svm@xe-basic
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1715673267:step_script
  section_start:1715673267:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1715673268:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/58697847):
  Warning: igt@xe_svm@svm-basic-mmap Category documentation is missing
  Warning: igt@xe_svm@svm-benchmark Category documentation is missing
  Warning: igt@xe_svm@svm-huge-page Category documentation is missing
  Warning: igt@xe_svm@svm-mprotect Category documentation is missing
  Warning: igt@xe_svm@svm-random-access Category documentation is missing
  Warning: igt@xe_svm@svm-sparse-access Category documentation is missing
  Warning: igt@xe_svm@svm_invalid_va Category documentation is missing
  Warning: igt@xe_svm@xe_basic Category documentation is missing
  Warning: Documented igt@xe_svm@svm_invalid_va doesn't exist on source files
  Warning: Documented igt@xe_svm@xe_basic doesn't exist on source files
  Warning: Missing documentation for igt@xe_svm@svm-invalid-va
  Warning: Missing documentation for igt@xe_svm@xe-basic
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1715673249:step_script
  section_start:1715673249:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1715673249:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/58697845):
  Warning: igt@xe_svm@svm-basic-mmap Category documentation is missing
  Warning: igt@xe_svm@svm-benchmark Category documentation is missing
  Warning: igt@xe_svm@svm-huge-page Category documentation is missing
  Warning: igt@xe_svm@svm-mprotect Category documentation is missing
  Warning: igt@xe_svm@svm-random-access Category documentation is missing
  Warning: igt@xe_svm@svm-sparse-access Category documentation is missing
  Warning: igt@xe_svm@svm_invalid_va Category documentation is missing
  Warning: igt@xe_svm@xe_basic Category documentation is missing
  Warning: Documented igt@xe_svm@svm_invalid_va doesn't exist on source files
  Warning: Documented igt@xe_svm@xe_basic doesn't exist on source files
  Warning: Missing documentation for igt@xe_svm@svm-invalid-va
  Warning: Missing documentation for igt@xe_svm@xe-basic
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1715673238:step_script
  section_start:1715673238:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1715673239:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/58697846):
  Warning: igt@xe_svm@svm-basic-mmap Category documentation is missing
  Warning: igt@xe_svm@svm-benchmark Category documentation is missing
  Warning: igt@xe_svm@svm-huge-page Category documentation is missing
  Warning: igt@xe_svm@svm-mprotect Category documentation is missing
  Warning: igt@xe_svm@svm-random-access Category documentation is missing
  Warning: igt@xe_svm@svm-sparse-access Category documentation is missing
  Warning: igt@xe_svm@svm_invalid_va Category documentation is missing
  Warning: igt@xe_svm@xe_basic Category documentation is missing
  Warning: Documented igt@xe_svm@svm_invalid_va doesn't exist on source files
  Warning: Documented igt@xe_svm@xe_basic doesn't exist on source files
  Warning: Missing documentation for igt@xe_svm@svm-invalid-va
  Warning: Missing documentation for igt@xe_svm@xe-basic
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1715673238:step_script
  section_start:1715673238:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1715673239:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1177054
