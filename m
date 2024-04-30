Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7452AC4345F
	for <igt-dev@archiver.kernel.org>; Tue, 30 Apr 2024 20:24:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 088B410FCBD;
	Tue, 30 Apr 2024 20:24:49 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2D0410FCBD;
 Tue, 30 Apr 2024 20:24:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_helper_function?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bommu Krishnaiah" <krishnaiah.bommu@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 30 Apr 2024 20:24:47 -0000
Message-ID: <171450868773.1793102.16771045025149346479@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240430182747.589234-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20240430182747.589234-1-krishnaiah.bommu@intel.com>
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

Series: helper function
URL   : https://patchwork.freedesktop.org/series/133096/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1167210 for the overview.

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/58219509):
         ~~~~~~^~~~~~~~~~~~~
  In file included from ../lib/igt_core.h:40,
                   from ../lib/drmtest.h:39,
                   from ../lib/igt.h:27,
                   from ../lib/xe/xe_util.c:6:
  /usr/arm-linux-gnueabihf/include/stdlib.h:563:25: note: expected ‘void *’ but argument is of type ‘uint64_t’ {aka ‘long long unsigned int’}
   extern void free (void *__ptr) __THROW;
                     ~~~~~~^~~~~
  ../lib/xe/xe_util.c: In function ‘xe_cmdbuf_exec_ufence_gpuva’:
  ../lib/xe/xe_util.c:119:9: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
    return (uint64_t)cmd_buf->gpu_addr + cmd_buf->size - 8;
           ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1714508271:step_script
  section_start:1714508271:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1714508272:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/58219511):
         ~~~~~~^~~~~~~~~~~~~
  In file included from ../lib/igt_core.h:40,
                   from ../lib/drmtest.h:39,
                   from ../lib/igt.h:27,
                   from ../lib/xe/xe_util.c:6:
  /usr/mips-linux-gnu/include/stdlib.h:563:25: note: expected ‘void *’ but argument is of type ‘uint64_t’ {aka ‘long long unsigned int’}
   extern void free (void *__ptr) __THROW;
                     ~~~~~~^~~~~
  ../lib/xe/xe_util.c: In function ‘xe_cmdbuf_exec_ufence_gpuva’:
  ../lib/xe/xe_util.c:119:9: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
    return (uint64_t)cmd_buf->gpu_addr + cmd_buf->size - 8;
           ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1714508266:step_script
  section_start:1714508266:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1714508267:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1167210
