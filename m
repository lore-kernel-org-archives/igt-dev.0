Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 194BFC4828D
	for <igt-dev@archiver.kernel.org>; Tue,  6 Feb 2024 19:31:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB2D112D94;
	Tue,  6 Feb 2024 19:31:14 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34264112D94;
 Tue,  6 Feb 2024 19:31:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests/intel/kms=5Fccs?=
 =?utf-8?q?=3A_Add_Xe2_ccs_crc_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 06 Feb 2024 19:31:13 -0000
Message-ID: <170724787321.1056871.337649748845651432@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240206190502.487549-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20240206190502.487549-1-juhapekka.heikkila@gmail.com>
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

Series: tests/intel/kms_ccs: Add Xe2 ccs crc tests
URL   : https://patchwork.freedesktop.org/series/129593/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1096724 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/54702174):
  Warning: Missing documentation for igt@kms_ccs@pipe-O-crc-sprite-planes-basic-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-O-missing-ccs-buffer-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-O-random-ccs-data-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-bad-aux-stride-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-bad-pixel-format-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-bad-rotation-90-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-ccs-on-another-bo-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-primary-basic-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-primary-rotation-180-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-sprite-planes-basic-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-missing-ccs-buffer-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-xe2-ccs
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1707247673:step_script
  section_start:1707247673:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1707247674:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/54702169):
  Warning: Missing documentation for igt@kms_ccs@pipe-O-crc-sprite-planes-basic-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-O-missing-ccs-buffer-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-O-random-ccs-data-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-bad-aux-stride-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-bad-pixel-format-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-bad-rotation-90-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-ccs-on-another-bo-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-primary-basic-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-primary-rotation-180-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-sprite-planes-basic-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-missing-ccs-buffer-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-xe2-ccs
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1707247625:step_script
  section_start:1707247625:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1707247627:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/54702173):
  Warning: Missing documentation for igt@kms_ccs@pipe-O-crc-sprite-planes-basic-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-O-missing-ccs-buffer-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-O-random-ccs-data-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-bad-aux-stride-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-bad-pixel-format-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-bad-rotation-90-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-ccs-on-another-bo-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-primary-basic-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-primary-rotation-180-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-sprite-planes-basic-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-missing-ccs-buffer-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-xe2-ccs
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1707247671:step_script
  section_start:1707247671:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1707247674:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/54702172):
  Warning: Missing documentation for igt@kms_ccs@pipe-O-crc-sprite-planes-basic-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-O-missing-ccs-buffer-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-O-random-ccs-data-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-bad-aux-stride-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-bad-pixel-format-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-bad-rotation-90-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-ccs-on-another-bo-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-primary-basic-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-primary-rotation-180-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-sprite-planes-basic-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-missing-ccs-buffer-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-xe2-ccs
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1707247629:step_script
  section_start:1707247629:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1707247630:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/54702170):
  Warning: Missing documentation for igt@kms_ccs@pipe-O-crc-sprite-planes-basic-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-O-missing-ccs-buffer-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-O-random-ccs-data-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-bad-aux-stride-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-bad-pixel-format-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-bad-rotation-90-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-ccs-on-another-bo-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-primary-basic-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-primary-rotation-180-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-sprite-planes-basic-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-missing-ccs-buffer-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-xe2-ccs
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1707247615:step_script
  section_start:1707247615:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1707247616:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/54702171):
  Warning: Missing documentation for igt@kms_ccs@pipe-O-crc-sprite-planes-basic-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-O-missing-ccs-buffer-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-O-random-ccs-data-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-bad-aux-stride-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-bad-pixel-format-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-bad-rotation-90-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-ccs-on-another-bo-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-primary-basic-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-primary-rotation-180-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-sprite-planes-basic-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-missing-ccs-buffer-4-tiled-xe2-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-xe2-ccs
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1707247613:step_script
  section_start:1707247613:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1707247614:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1096724
