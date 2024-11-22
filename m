Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638DBE69186
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 18:43:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0A210EC4C;
	Fri, 22 Nov 2024 18:43:57 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C81A10E1D4;
 Fri, 22 Nov 2024 18:43:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_lib/igt=5Fkms=3A_Helper?=
 =?utf-8?q?s_for_monitor_edid_managment_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 22 Nov 2024 18:43:55 -0000
Message-ID: <173230103565.1797262.18075132177813351811@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241122-b4-cv3-02-monitor-edids-v3-0-1798f58167ef@bootlin.com>
In-Reply-To: <20241122-b4-cv3-02-monitor-edids-v3-0-1798f58167ef@bootlin.com>
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

Series: lib/igt_kms: Helpers for monitor edid managment (rev3)
URL   : https://patchwork.freedesktop.org/series/137925/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1315538 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/67059891):
      *count = DP_EDIDS_NON_4K_COUNT;
             ^
  In file included from ../lib/monitor_edids/monitor_edids_helper.c:20:
  ../lib/monitor_edids/hdmi_edids.h:625:33: error: expected expression before ‘=’ token
   #define HDMI_EDIDS_NON_4K_COUNT = ARRAY_SIZE(HDMI_EDIDS_NON_4K);
                                   ^
  ../lib/monitor_edids/monitor_edids_helper.c:170:13: note: in expansion of macro ‘HDMI_EDIDS_NON_4K_COUNT’
      *count = HDMI_EDIDS_NON_4K_COUNT;
               ^~~~~~~~~~~~~~~~~~~~~~~
  ../lib/monitor_edids/monitor_edids_helper.c:170:11: error: assignment to ‘size_t’ {aka ‘long unsigned int’} from ‘struct <anonymous> *’ makes integer from pointer without a cast [-Werror=int-conversion]
      *count = HDMI_EDIDS_NON_4K_COUNT;
             ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1732300654:step_script
  section_start:1732300654:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1732300664:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/67059886):
    167 |    *count = DP_EDIDS_NON_4K_COUNT;
        |           ^
  In file included from ../lib/monitor_edids/monitor_edids_helper.c:20:
  ../lib/monitor_edids/hdmi_edids.h:625:33: error: expected expression before ‘=’ token
    625 | #define HDMI_EDIDS_NON_4K_COUNT = ARRAY_SIZE(HDMI_EDIDS_NON_4K);
        |                                 ^
  ../lib/monitor_edids/monitor_edids_helper.c:170:13: note: in expansion of macro ‘HDMI_EDIDS_NON_4K_COUNT’
    170 |    *count = HDMI_EDIDS_NON_4K_COUNT;
        |             ^~~~~~~~~~~~~~~~~~~~~~~
  ../lib/monitor_edids/monitor_edids_helper.c:170:11: error: assignment to ‘size_t’ {aka ‘long unsigned int’} from ‘struct <anonymous> *’ makes integer from pointer without a cast [-Werror=int-conversion]
    170 |    *count = HDMI_EDIDS_NON_4K_COUNT;
        |           ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1732300664:step_script
  section_start:1732300664:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1732300665:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/67059890):
  ../lib/monitor_edids/monitor_edids_helper.c:189:22: error: invalid application of 'sizeof' to an incomplete type 'struct (anonymous struct at ../lib/monitor_edids/monitor_edids_helper.c:22:1) []'
          for (int i = 0; i < ARRAY_SIZE(ALL_EDIDS); i++) {
                              ^~~~~~~~~~~~~~~~~~~~~
  ../lib/drmtest.h:85:32: note: expanded from macro 'ARRAY_SIZE'
  #define ARRAY_SIZE(arr) (sizeof(arr)/sizeof(arr[0]))
                                 ^~~~~
  ../lib/monitor_edids/monitor_edids_helper.c:206:22: error: invalid application of 'sizeof' to an incomplete type 'struct (anonymous struct at ../lib/monitor_edids/monitor_edids_helper.c:22:1) []'
          for (int i = 0; i < ARRAY_SIZE(ALL_EDIDS); i++) {
                              ^~~~~~~~~~~~~~~~~~~~~
  ../lib/drmtest.h:85:32: note: expanded from macro 'ARRAY_SIZE'
  #define ARRAY_SIZE(arr) (sizeof(arr)/sizeof(arr[0]))
                                 ^~~~~
  10 errors generated.
  ninja: build stopped: subcommand failed.
  section_end:1732300660:step_script
  section_start:1732300660:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1732300661:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/67059889):
    167 |    *count = DP_EDIDS_NON_4K_COUNT;
        |           ^
  In file included from ../lib/monitor_edids/monitor_edids_helper.c:20:
  ../lib/monitor_edids/hdmi_edids.h:625:33: error: expected expression before ‘=’ token
    625 | #define HDMI_EDIDS_NON_4K_COUNT = ARRAY_SIZE(HDMI_EDIDS_NON_4K);
        |                                 ^
  ../lib/monitor_edids/monitor_edids_helper.c:170:13: note: in expansion of macro ‘HDMI_EDIDS_NON_4K_COUNT’
    170 |    *count = HDMI_EDIDS_NON_4K_COUNT;
        |             ^~~~~~~~~~~~~~~~~~~~~~~
  ../lib/monitor_edids/monitor_edids_helper.c:170:11: error: assignment to ‘size_t’ {aka ‘long unsigned int’} from ‘struct <anonymous> *’ makes integer from pointer without a cast [-Werror=int-conversion]
    170 |    *count = HDMI_EDIDS_NON_4K_COUNT;
        |           ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1732300652:step_script
  section_start:1732300652:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1732300653:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/67059887):
    167 |    *count = DP_EDIDS_NON_4K_COUNT;
        |           ^
  In file included from ../lib/monitor_edids/monitor_edids_helper.c:20:
  ../lib/monitor_edids/hdmi_edids.h:625:33: error: expected expression before ‘=’ token
    625 | #define HDMI_EDIDS_NON_4K_COUNT = ARRAY_SIZE(HDMI_EDIDS_NON_4K);
        |                                 ^
  ../lib/monitor_edids/monitor_edids_helper.c:170:13: note: in expansion of macro ‘HDMI_EDIDS_NON_4K_COUNT’
    170 |    *count = HDMI_EDIDS_NON_4K_COUNT;
        |             ^~~~~~~~~~~~~~~~~~~~~~~
  ../lib/monitor_edids/monitor_edids_helper.c:170:11: error: assignment to ‘size_t’ {aka ‘long unsigned int’} from ‘struct <anonymous> *’ makes integer from pointer without a cast [-Werror=int-conversion]
    170 |    *count = HDMI_EDIDS_NON_4K_COUNT;
        |           ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1732300658:step_script
  section_start:1732300658:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1732300658:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/67059888):
    167 |    *count = DP_EDIDS_NON_4K_COUNT;
        |           ^
  In file included from ../lib/monitor_edids/monitor_edids_helper.c:20:
  ../lib/monitor_edids/hdmi_edids.h:625:33: error: expected expression before ‘=’ token
    625 | #define HDMI_EDIDS_NON_4K_COUNT = ARRAY_SIZE(HDMI_EDIDS_NON_4K);
        |                                 ^
  ../lib/monitor_edids/monitor_edids_helper.c:170:13: note: in expansion of macro ‘HDMI_EDIDS_NON_4K_COUNT’
    170 |    *count = HDMI_EDIDS_NON_4K_COUNT;
        |             ^~~~~~~~~~~~~~~~~~~~~~~
  ../lib/monitor_edids/monitor_edids_helper.c:170:11: error: assignment to ‘size_t’ {aka ‘long unsigned int’} from ‘struct <anonymous> *’ makes integer from pointer without a cast [-Werror=int-conversion]
    170 |    *count = HDMI_EDIDS_NON_4K_COUNT;
        |           ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1732300661:step_script
  section_start:1732300661:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1732300662:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1315538
