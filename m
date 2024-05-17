Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29945C25B77
	for <igt-dev@archiver.kernel.org>; Fri, 17 May 2024 12:35:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD65910E39C;
	Fri, 17 May 2024 12:35:46 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE76410E39C;
 Fri, 17 May 2024 12:35:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests/intel/xe=5Fsvm=3A?=
 =?utf-8?q?_Add_tests_for_Shared_Virtual_Memory_=28SVM=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bommu Krishnaiah" <krishnaiah.bommu@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 17 May 2024 12:35:44 -0000
Message-ID: <171594934484.2142370.8310201807291212952@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240517114658.810283-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20240517114658.810283-1-krishnaiah.bommu@intel.com>
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

Series: tests/intel/xe_svm: Add tests for Shared Virtual Memory (SVM)
URL   : https://patchwork.freedesktop.org/series/133746/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1179970 for the overview.

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/58868527):
                                                                                                             ^
  ../lib/xe/xe_util.c: In function ‘xe_destroy_buffer’:
  ../lib/xe/xe_util.c:90:15: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
    sync->addr = (uint64_t)buffer->bind_ufence;
                 ^
  ../lib/xe/xe_util.c:92:68: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
    xe_vm_unbind_async(buffer->fd, buffer->vm, buffer->bind_queue, 0, (uint64_t)buffer->gpu_addr, buffer->size, sync, 1);
                                                                      ^
  ../lib/xe/xe_util.c: In function ‘xe_cmdbuf_exec_ufence_gpuva’:
  ../lib/xe/xe_util.c:215:9: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
    return (uint64_t)cmd_buf->gpu_addr + cmd_buf->size - 8;
           ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1715949053:step_script
  section_start:1715949053:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1715949054:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/58868529):
                                                                                                             ^
  ../lib/xe/xe_util.c: In function ‘xe_destroy_buffer’:
  ../lib/xe/xe_util.c:90:15: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
    sync->addr = (uint64_t)buffer->bind_ufence;
                 ^
  ../lib/xe/xe_util.c:92:68: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
    xe_vm_unbind_async(buffer->fd, buffer->vm, buffer->bind_queue, 0, (uint64_t)buffer->gpu_addr, buffer->size, sync, 1);
                                                                      ^
  ../lib/xe/xe_util.c: In function ‘xe_cmdbuf_exec_ufence_gpuva’:
  ../lib/xe/xe_util.c:215:9: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
    return (uint64_t)cmd_buf->gpu_addr + cmd_buf->size - 8;
           ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1715949058:step_script
  section_start:1715949058:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1715949059:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1179970
