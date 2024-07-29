Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAB9C3DA61
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 19:21:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B5B10E3D1;
	Mon, 29 Jul 2024 19:21:39 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D73A710E3CF;
 Mon, 29 Jul 2024 19:21:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_Test_coverage_for_GPU_d?=
 =?utf-8?q?ebug_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Christoph Manszewski" <christoph.manszewski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 29 Jul 2024 19:21:37 -0000
Message-ID: <172228089787.425906.1151616097618470262@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240729160159.37036-1-christoph.manszewski@intel.com>
In-Reply-To: <20240729160159.37036-1-christoph.manszewski@intel.com>
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

Series: Test coverage for GPU debug support
URL   : https://patchwork.freedesktop.org/series/136623/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1236035 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/61654173):
     int __n1 = (n1), __n2 = (n2); \
                 ^~
  ../lib/xe/xe_eudebug.c:2185:2: note: in expansion of macro ‘igt_assert_eq’
    igt_assert_eq(igt_ioctl(debugfd, DRM_XE_EUDEBUG_IOCTL_ACK_EVENT, &ack), 0);
    ^~~~~~~~~~~~~
  ../lib/xe/xe_eudebug.c:2177:34: warning: unused variable ‘ack’ [-Wunused-variable]
    struct drm_xe_eudebug_ack_event ack = { 0, };
                                    ^~~
  ../lib/xe/xe_eudebug.c: In function ‘xe_eudebug_client_metadata_create’:
  ../lib/xe/xe_eudebug.c:2150:1: error: control reaches end of non-void function [-Werror=return-type]
   }
   ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1722280796:step_script
  section_start:1722280796:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1722280797:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/61654176):
     int __n1 = (n1), __n2 = (n2); \
                 ^~
  ../lib/xe/xe_eudebug.c:2185:2: note: in expansion of macro ‘igt_assert_eq’
    igt_assert_eq(igt_ioctl(debugfd, DRM_XE_EUDEBUG_IOCTL_ACK_EVENT, &ack), 0);
    ^~~~~~~~~~~~~
  ../lib/xe/xe_eudebug.c:2177:34: warning: unused variable ‘ack’ [-Wunused-variable]
    struct drm_xe_eudebug_ack_event ack = { 0, };
                                    ^~~
  ../lib/xe/xe_eudebug.c: In function ‘xe_eudebug_client_metadata_create’:
  ../lib/xe/xe_eudebug.c:2150:1: error: control reaches end of non-void function [-Werror=return-type]
   }
   ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1722280801:step_script
  section_start:1722280801:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1722280802:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/61654175):
     int __n1 = (n1), __n2 = (n2); \
                 ^~
  ../lib/xe/xe_eudebug.c:2185:2: note: in expansion of macro ‘igt_assert_eq’
    igt_assert_eq(igt_ioctl(debugfd, DRM_XE_EUDEBUG_IOCTL_ACK_EVENT, &ack), 0);
    ^~~~~~~~~~~~~
  ../lib/xe/xe_eudebug.c:2177:34: warning: unused variable ‘ack’ [-Wunused-variable]
    struct drm_xe_eudebug_ack_event ack = { 0, };
                                    ^~~
  ../lib/xe/xe_eudebug.c: In function ‘xe_eudebug_client_metadata_create’:
  ../lib/xe/xe_eudebug.c:2150:1: error: control reaches end of non-void function [-Werror=return-type]
   }
   ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1722280803:step_script
  section_start:1722280803:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1722280803:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/61654177):
     int __n1 = (n1), __n2 = (n2); \
                 ^~
  ../lib/xe/xe_eudebug.c:2185:2: note: in expansion of macro ‘igt_assert_eq’
    igt_assert_eq(igt_ioctl(debugfd, DRM_XE_EUDEBUG_IOCTL_ACK_EVENT, &ack), 0);
    ^~~~~~~~~~~~~
  ../lib/xe/xe_eudebug.c:2177:34: warning: unused variable ‘ack’ [-Wunused-variable]
    struct drm_xe_eudebug_ack_event ack = { 0, };
                                    ^~~
  ../lib/xe/xe_eudebug.c: In function ‘xe_eudebug_client_metadata_create’:
  ../lib/xe/xe_eudebug.c:2150:1: error: control reaches end of non-void function [-Werror=return-type]
   }
   ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1722280804:step_script
  section_start:1722280804:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1722280805:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/61654174):
     int __n1 = (n1), __n2 = (n2); \
                 ^~
  ../lib/xe/xe_eudebug.c:2185:2: note: in expansion of macro ‘igt_assert_eq’
    igt_assert_eq(igt_ioctl(debugfd, DRM_XE_EUDEBUG_IOCTL_ACK_EVENT, &ack), 0);
    ^~~~~~~~~~~~~
  ../lib/xe/xe_eudebug.c:2177:34: warning: unused variable ‘ack’ [-Wunused-variable]
    struct drm_xe_eudebug_ack_event ack = { 0, };
                                    ^~~
  ../lib/xe/xe_eudebug.c: In function ‘xe_eudebug_client_metadata_create’:
  ../lib/xe/xe_eudebug.c:2150:1: error: control reaches end of non-void function [-Werror=return-type]
   }
   ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1722280790:step_script
  section_start:1722280790:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1722280791:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/61654168):
    737 |   int __n1 = (n1), __n2 = (n2); \
        |               ^~
  ../lib/xe/xe_eudebug.c:2185:2: note: in expansion of macro ‘igt_assert_eq’
   2185 |  igt_assert_eq(igt_ioctl(debugfd, DRM_XE_EUDEBUG_IOCTL_ACK_EVENT, &ack), 0);
        |  ^~~~~~~~~~~~~
  ../lib/xe/xe_eudebug.c:2177:34: warning: unused variable ‘ack’ [-Wunused-variable]
   2177 |  struct drm_xe_eudebug_ack_event ack = { 0, };
        |                                  ^~~
  ../lib/xe/xe_eudebug.c: In function ‘xe_eudebug_client_metadata_create’:
  ../lib/xe/xe_eudebug.c:2150:1: error: control reaches end of non-void function [-Werror=return-type]
   2150 | }
        | ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1722280798:step_script
  section_start:1722280798:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1722280798:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/61654172):
          if (flags & DRM_XE_EUDEBUG_EVENT_STATE_CHANGE)
                      ^
  ../lib/xe/xe_eudebug.c:105:23: error: use of undeclared identifier 'DRM_XE_EUDEBUG_EVENT_NEED_ACK'
          igt_assert(!(flags & DRM_XE_EUDEBUG_EVENT_NEED_ACK));
                               ^
  ../lib/xe/xe_eudebug.c:112:11: error: incomplete definition of type 'struct drm_xe_eudebug_event'
          switch (e->type) {
                  ~^
  ../lib/xe/xe_eudebug.h:117:8: note: forward declaration of 'struct drm_xe_eudebug_event'
  struct drm_xe_eudebug_event *
         ^
  fatal error: too many errors emitted, stopping now [-ferror-limit=]
  3 warnings and 20 errors generated.
  ninja: build stopped: subcommand failed.
  section_end:1722280804:step_script
  section_start:1722280804:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1722280804:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/61654171):
    737 |   int __n1 = (n1), __n2 = (n2); \
        |               ^~
  ../lib/xe/xe_eudebug.c:2185:2: note: in expansion of macro ‘igt_assert_eq’
   2185 |  igt_assert_eq(igt_ioctl(debugfd, DRM_XE_EUDEBUG_IOCTL_ACK_EVENT, &ack), 0);
        |  ^~~~~~~~~~~~~
  ../lib/xe/xe_eudebug.c:2177:34: warning: unused variable ‘ack’ [-Wunused-variable]
   2177 |  struct drm_xe_eudebug_ack_event ack = { 0, };
        |                                  ^~~
  ../lib/xe/xe_eudebug.c: In function ‘xe_eudebug_client_metadata_create’:
  ../lib/xe/xe_eudebug.c:2150:1: error: control reaches end of non-void function [-Werror=return-type]
   2150 | }
        | ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1722280799:step_script
  section_start:1722280799:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1722280801:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/61654169):
    737 |   int __n1 = (n1), __n2 = (n2); \
        |               ^~
  ../lib/xe/xe_eudebug.c:2185:2: note: in expansion of macro ‘igt_assert_eq’
   2185 |  igt_assert_eq(igt_ioctl(debugfd, DRM_XE_EUDEBUG_IOCTL_ACK_EVENT, &ack), 0);
        |  ^~~~~~~~~~~~~
  ../lib/xe/xe_eudebug.c:2177:34: warning: unused variable ‘ack’ [-Wunused-variable]
   2177 |  struct drm_xe_eudebug_ack_event ack = { 0, };
        |                                  ^~~
  ../lib/xe/xe_eudebug.c: In function ‘xe_eudebug_client_metadata_create’:
  ../lib/xe/xe_eudebug.c:2150:1: error: control reaches end of non-void function [-Werror=return-type]
   2150 | }
        | ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1722280799:step_script
  section_start:1722280799:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1722280800:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/61654170):
    737 |   int __n1 = (n1), __n2 = (n2); \
        |               ^~
  ../lib/xe/xe_eudebug.c:2185:2: note: in expansion of macro ‘igt_assert_eq’
   2185 |  igt_assert_eq(igt_ioctl(debugfd, DRM_XE_EUDEBUG_IOCTL_ACK_EVENT, &ack), 0);
        |  ^~~~~~~~~~~~~
  ../lib/xe/xe_eudebug.c:2177:34: warning: unused variable ‘ack’ [-Wunused-variable]
   2177 |  struct drm_xe_eudebug_ack_event ack = { 0, };
        |                                  ^~~
  ../lib/xe/xe_eudebug.c: In function ‘xe_eudebug_client_metadata_create’:
  ../lib/xe/xe_eudebug.c:2150:1: error: control reaches end of non-void function [-Werror=return-type]
   2150 | }
        | ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1722280800:step_script
  section_start:1722280800:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1722280801:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1236035
