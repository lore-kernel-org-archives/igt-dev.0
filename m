Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FECC3DA41
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 16:21:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10F610E5ED;
	Tue,  9 Jul 2024 16:21:00 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7284F10E5EB;
 Tue,  9 Jul 2024 16:21:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests/chamelium=3A_Inte?=
 =?utf-8?q?grate_the_chamelium_v3?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 09 Jul 2024 16:21:00 -0000
Message-ID: <172054206045.86477.13338337233384982865@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
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

Series: tests/chamelium: Integrate the chamelium v3
URL   : https://patchwork.freedesktop.org/series/135910/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1220486 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60848890):
   #include "igt_kms.h"
  ../lib/chamelium/v3/igt_chamelium.c:164:4:
      errno = 0;
      ^~~~~
  ../lib/chamelium/v3/igt_chamelium.c:164:4: note: each undeclared identifier is reported only once for each function it appears in
  ../lib/chamelium/v3/igt_chamelium.c: In function ‘chamelium_v3_fill_port_mapping_from_config_v3’:
  ../lib/chamelium/v3/igt_chamelium.c:223:4: error: ‘errno’ undeclared (first use in this function)
      errno = 0;
      ^~~~~
  ../lib/chamelium/v3/igt_chamelium.c:223:4: note: ‘errno’ is defined in header ‘<errno.h>’; did you forget to ‘#include <errno.h>’?
  ../lib/chamelium/v3/igt_chamelium.c:231:24: error: ‘ERANGE’ undeclared (first use in this function)
      } else if (errno == ERANGE) {
                          ^~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1720541868:step_script
  section_start:1720541868:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1720541869:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60848885):
    +++ |+#include <errno.h>
     10 | #include "igt_kms.h"
  ../lib/chamelium/v3/igt_chamelium.c:164:4: note: each undeclared identifier is reported only once for each function it appears in
    164 |    errno = 0;
        |    ^~~~~
  ../lib/chamelium/v3/igt_chamelium.c: In function ‘chamelium_v3_fill_port_mapping_from_config_v3’:
  ../lib/chamelium/v3/igt_chamelium.c:223:4: error: ‘errno’ undeclared (first use in this function)
    223 |    errno = 0;
        |    ^~~~~
  ../lib/chamelium/v3/igt_chamelium.c:223:4: note: ‘errno’ is defined in header ‘<errno.h>’; did you forget to ‘#include <errno.h>’?
  ../lib/chamelium/v3/igt_chamelium.c:231:24: error: ‘ERANGE’ undeclared (first use in this function)
    231 |    } else if (errno == ERANGE) {
        |                        ^~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1720541858:step_script
  section_start:1720541858:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1720541859:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60848889):
                          errno = 0;
                          ^
  ../lib/chamelium/v3/igt_chamelium.c:231:15: error: use of undeclared identifier 'errno'; did you mean 'error'?
                          } else if (errno == ERANGE) {
                                     ^~~~~
                                     error
  ../lib/chamelium/v3/igt_chamelium.c:219:12: note: 'error' declared here
                          GError *error = NULL;
                                  ^
  ../lib/chamelium/v3/igt_chamelium.c:231:24: error: use of undeclared identifier 'ERANGE'
                          } else if (errno == ERANGE) {
                                              ^
  4 errors generated.
  ninja: build stopped: subcommand failed.
  section_end:1720541870:step_script
  section_start:1720541870:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1720541870:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60848888):
    +++ |+#include <errno.h>
     10 | #include "igt_kms.h"
  ../lib/chamelium/v3/igt_chamelium.c:164:4: note: each undeclared identifier is reported only once for each function it appears in
    164 |    errno = 0;
        |    ^~~~~
  ../lib/chamelium/v3/igt_chamelium.c: In function ‘chamelium_v3_fill_port_mapping_from_config_v3’:
  ../lib/chamelium/v3/igt_chamelium.c:223:4: error: ‘errno’ undeclared (first use in this function)
    223 |    errno = 0;
        |    ^~~~~
  ../lib/chamelium/v3/igt_chamelium.c:223:4: note: ‘errno’ is defined in header ‘<errno.h>’; did you forget to ‘#include <errno.h>’?
  ../lib/chamelium/v3/igt_chamelium.c:231:24: error: ‘ERANGE’ undeclared (first use in this function)
    231 |    } else if (errno == ERANGE) {
        |                        ^~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1720541872:step_script
  section_start:1720541872:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1720541873:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60848886):
    +++ |+#include <errno.h>
     10 | #include "igt_kms.h"
  ../lib/chamelium/v3/igt_chamelium.c:164:4: note: each undeclared identifier is reported only once for each function it appears in
    164 |    errno = 0;
        |    ^~~~~
  ../lib/chamelium/v3/igt_chamelium.c: In function ‘chamelium_v3_fill_port_mapping_from_config_v3’:
  ../lib/chamelium/v3/igt_chamelium.c:223:4: error: ‘errno’ undeclared (first use in this function)
    223 |    errno = 0;
        |    ^~~~~
  ../lib/chamelium/v3/igt_chamelium.c:223:4: note: ‘errno’ is defined in header ‘<errno.h>’; did you forget to ‘#include <errno.h>’?
  ../lib/chamelium/v3/igt_chamelium.c:231:24: error: ‘ERANGE’ undeclared (first use in this function)
    231 |    } else if (errno == ERANGE) {
        |                        ^~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1720541855:step_script
  section_start:1720541855:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1720541856:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60848887):
    +++ |+#include <errno.h>
     10 | #include "igt_kms.h"
  ../lib/chamelium/v3/igt_chamelium.c:164:4: note: each undeclared identifier is reported only once for each function it appears in
    164 |    errno = 0;
        |    ^~~~~
  ../lib/chamelium/v3/igt_chamelium.c: In function ‘chamelium_v3_fill_port_mapping_from_config_v3’:
  ../lib/chamelium/v3/igt_chamelium.c:223:4: error: ‘errno’ undeclared (first use in this function)
    223 |    errno = 0;
        |    ^~~~~
  ../lib/chamelium/v3/igt_chamelium.c:223:4: note: ‘errno’ is defined in header ‘<errno.h>’; did you forget to ‘#include <errno.h>’?
  ../lib/chamelium/v3/igt_chamelium.c:231:24: error: ‘ERANGE’ undeclared (first use in this function)
    231 |    } else if (errno == ERANGE) {
        |                        ^~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1720541853:step_script
  section_start:1720541853:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1720541854:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1220486
