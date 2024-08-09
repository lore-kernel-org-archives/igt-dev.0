Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8D8C52D7C
	for <igt-dev@archiver.kernel.org>; Fri,  9 Aug 2024 13:36:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D50D10E909;
	Fri,  9 Aug 2024 13:36:57 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37BC210E90D;
 Fri,  9 Aug 2024 13:36:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_Test_coverage_for_GPU_d?=
 =?utf-8?q?ebug_support_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Christoph Manszewski" <christoph.manszewski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 09 Aug 2024 13:36:56 -0000
Message-ID: <172321061622.552626.16668956316580921385@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240809123813.109365-1-christoph.manszewski@intel.com>
In-Reply-To: <20240809123813.109365-1-christoph.manszewski@intel.com>
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

Series: Test coverage for GPU debug support (rev3)
URL   : https://patchwork.freedesktop.org/series/136623/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1245140 for the overview.

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/62081847):
              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                    ~~~~~
  ../lib/igt_core.h:1257:64: note: in definition of macro ‘igt_debug’
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
  section_end:1723210264:step_script
  section_start:1723210264:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1723210265:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/62081849):
              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                    ~~~~~
  ../lib/igt_core.h:1257:64: note: in definition of macro ‘igt_debug’
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
  section_end:1723210260:step_script
  section_start:1723210260:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1723210261:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1245140
