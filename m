Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A4AC3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 16:15:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C6E10E477;
	Tue, 30 Jul 2024 16:15:06 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BFB110E2BD;
 Tue, 30 Jul 2024 16:15:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_Test_coverage_for_GPU_d?=
 =?utf-8?q?ebug_support_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 30 Jul 2024 16:15:05 -0000
Message-ID: <172235610556.429217.7099217998696991911@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
In-Reply-To: <20240730114523.334156-1-christoph.manszewski@intel.com>
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

Series: Test coverage for GPU debug support (rev2)
URL   : https://patchwork.freedesktop.org/series/136623/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1236924 for the overview.

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/61691633):
              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                    ~~~~~
  ../lib/igt_core.h:1239:64: note: in definition of macro ‘igt_debug’
   #define igt_debug(f...) igt_log(IGT_LOG_DOMAIN, IGT_LOG_DEBUG, f)
                                                                  ^
  ../lib/xe/xe_eudebug.c: In function ‘xe_eudebug_client_exec_queue_create’:
  ../lib/xe/xe_eudebug.c:1792:20: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
    uint16_t class = ((struct drm_xe_engine_class_instance *)(create->instances))[0].engine_class;
                      ^
  ../lib/xe/xe_eudebug.c: In function ‘xe_eudebug_client_exec_queue_destroy’:
  ../lib/xe/xe_eudebug.c:1816:20: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
    uint16_t class = ((struct drm_xe_engine_class_instance *)(create->instances))[0].engine_class;
                      ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1722355697:step_script
  section_start:1722355697:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1722355697:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/61691635):
              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                    ~~~~~
  ../lib/igt_core.h:1239:64: note: in definition of macro ‘igt_debug’
   #define igt_debug(f...) igt_log(IGT_LOG_DOMAIN, IGT_LOG_DEBUG, f)
                                                                  ^
  ../lib/xe/xe_eudebug.c: In function ‘xe_eudebug_client_exec_queue_create’:
  ../lib/xe/xe_eudebug.c:1792:20: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
    uint16_t class = ((struct drm_xe_engine_class_instance *)(create->instances))[0].engine_class;
                      ^
  ../lib/xe/xe_eudebug.c: In function ‘xe_eudebug_client_exec_queue_destroy’:
  ../lib/xe/xe_eudebug.c:1816:20: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
    uint16_t class = ((struct drm_xe_engine_class_instance *)(create->instances))[0].engine_class;
                      ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1722355697:step_script
  section_start:1722355697:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1722355698:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1236924
