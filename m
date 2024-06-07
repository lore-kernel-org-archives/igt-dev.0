Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CA3C27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 19:06:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA01D10ED09;
	Fri,  7 Jun 2024 19:06:20 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13EFC10ED08;
 Fri,  7 Jun 2024 19:06:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_Support_for_RGB16161616?=
 =?utf-8?q?=5F64B_compressed_formats_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Melanie Lobo" <melanie.lobo@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 07 Jun 2024 19:06:19 -0000
Message-ID: <171778717908.28075.504736800636805035@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240603081607.30930-1-melanie.lobo@intel.com>
In-Reply-To: <20240603081607.30930-1-melanie.lobo@intel.com>
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

Series: Support for RGB16161616_64B compressed formats (rev2)
URL   : https://patchwork.freedesktop.org/series/134353/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1194559 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59544528):
                       ^~~~~~~~~~~~~~~~~~~~~~~
  ../lib/intel_aux_pgtable.c:25:44: error: stray ‘\302’ in program
   #define AUX_FORMAT_RGBA16_FLOAT        0x1
                                              ^
  ../lib/intel_aux_pgtable.c:311:21: note: in expansion of macro ‘AUX_FORMAT_RGBA16_FLOAT’
      entry.e.format = AUX_FORMAT_RGBA16_FLOAT;
                       ^~~~~~~~~~~~~~~~~~~~~~~
  ../lib/intel_aux_pgtable.c:25:45: error: stray ‘\240’ in program
   #define AUX_FORMAT_RGBA16_FLOAT        0x1
                                               ^
  ../lib/intel_aux_pgtable.c:311:21: note: in expansion of macro ‘AUX_FORMAT_RGBA16_FLOAT’
      entry.e.format = AUX_FORMAT_RGBA16_FLOAT;
                       ^~~~~~~~~~~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1717652596:step_script
  section_start:1717652596:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717652597:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59544531):
                       ^~~~~~~~~~~~~~~~~~~~~~~
  ../lib/intel_aux_pgtable.c:25:44: error: stray ‘\302’ in program
   #define AUX_FORMAT_RGBA16_FLOAT        0x1
                                              ^
  ../lib/intel_aux_pgtable.c:311:21: note: in expansion of macro ‘AUX_FORMAT_RGBA16_FLOAT’
      entry.e.format = AUX_FORMAT_RGBA16_FLOAT;
                       ^~~~~~~~~~~~~~~~~~~~~~~
  ../lib/intel_aux_pgtable.c:25:45: error: stray ‘\240’ in program
   #define AUX_FORMAT_RGBA16_FLOAT        0x1
                                               ^
  ../lib/intel_aux_pgtable.c:311:21: note: in expansion of macro ‘AUX_FORMAT_RGBA16_FLOAT’
      entry.e.format = AUX_FORMAT_RGBA16_FLOAT;
                       ^~~~~~~~~~~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1717652607:step_script
  section_start:1717652607:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717652608:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59544530):
                       ^~~~~~~~~~~~~~~~~~~~~~~
  ../lib/intel_aux_pgtable.c:25:44: error: stray ‘\302’ in program
   #define AUX_FORMAT_RGBA16_FLOAT        0x1
                                              ^
  ../lib/intel_aux_pgtable.c:311:21: note: in expansion of macro ‘AUX_FORMAT_RGBA16_FLOAT’
      entry.e.format = AUX_FORMAT_RGBA16_FLOAT;
                       ^~~~~~~~~~~~~~~~~~~~~~~
  ../lib/intel_aux_pgtable.c:25:45: error: stray ‘\240’ in program
   #define AUX_FORMAT_RGBA16_FLOAT        0x1
                                               ^
  ../lib/intel_aux_pgtable.c:311:21: note: in expansion of macro ‘AUX_FORMAT_RGBA16_FLOAT’
      entry.e.format = AUX_FORMAT_RGBA16_FLOAT;
                       ^~~~~~~~~~~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1717652597:step_script
  section_start:1717652597:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717652597:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59544532):
                       ^~~~~~~~~~~~~~~~~~~~~~~
  ../lib/intel_aux_pgtable.c:25:44: error: stray ‘\302’ in program
   #define AUX_FORMAT_RGBA16_FLOAT        0x1
                                              ^
  ../lib/intel_aux_pgtable.c:311:21: note: in expansion of macro ‘AUX_FORMAT_RGBA16_FLOAT’
      entry.e.format = AUX_FORMAT_RGBA16_FLOAT;
                       ^~~~~~~~~~~~~~~~~~~~~~~
  ../lib/intel_aux_pgtable.c:25:45: error: stray ‘\240’ in program
   #define AUX_FORMAT_RGBA16_FLOAT        0x1
                                               ^
  ../lib/intel_aux_pgtable.c:311:21: note: in expansion of macro ‘AUX_FORMAT_RGBA16_FLOAT’
      entry.e.format = AUX_FORMAT_RGBA16_FLOAT;
                       ^~~~~~~~~~~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1717652608:step_script
  section_start:1717652608:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717652608:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59544529):
                       ^~~~~~~~~~~~~~~~~~~~~~~
  ../lib/intel_aux_pgtable.c:25:44: error: stray ‘\302’ in program
   #define AUX_FORMAT_RGBA16_FLOAT        0x1
                                              ^
  ../lib/intel_aux_pgtable.c:311:21: note: in expansion of macro ‘AUX_FORMAT_RGBA16_FLOAT’
      entry.e.format = AUX_FORMAT_RGBA16_FLOAT;
                       ^~~~~~~~~~~~~~~~~~~~~~~
  ../lib/intel_aux_pgtable.c:25:45: error: stray ‘\240’ in program
   #define AUX_FORMAT_RGBA16_FLOAT        0x1
                                               ^
  ../lib/intel_aux_pgtable.c:311:21: note: in expansion of macro ‘AUX_FORMAT_RGBA16_FLOAT’
      entry.e.format = AUX_FORMAT_RGBA16_FLOAT;
                       ^~~~~~~~~~~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1717652589:step_script
  section_start:1717652589:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717652590:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59544523):
        |                     ^~~~~~~~~~~~~~~~~~~~~~~
  ../lib/intel_aux_pgtable.c:25:44: error: stray ‘\302’ in program
     25 | #define AUX_FORMAT_RGBA16_FLOAT        0x1
        |                                            ^
  ../lib/intel_aux_pgtable.c:311:21: note: in expansion of macro ‘AUX_FORMAT_RGBA16_FLOAT’
    311 |    entry.e.format = AUX_FORMAT_RGBA16_FLOAT;
        |                     ^~~~~~~~~~~~~~~~~~~~~~~
  ../lib/intel_aux_pgtable.c:25:45: error: stray ‘\240’ in program
     25 | #define AUX_FORMAT_RGBA16_FLOAT        0x1
        |                                             ^
  ../lib/intel_aux_pgtable.c:311:21: note: in expansion of macro ‘AUX_FORMAT_RGBA16_FLOAT’
    311 |    entry.e.format = AUX_FORMAT_RGBA16_FLOAT;
        |                     ^~~~~~~~~~~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1717652593:step_script
  section_start:1717652593:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717652594:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59544526):
        |                     ^~~~~~~~~~~~~~~~~~~~~~~
  ../lib/intel_aux_pgtable.c:25:44: error: stray ‘\302’ in program
     25 | #define AUX_FORMAT_RGBA16_FLOAT        0x1
        |                                            ^
  ../lib/intel_aux_pgtable.c:311:21: note: in expansion of macro ‘AUX_FORMAT_RGBA16_FLOAT’
    311 |    entry.e.format = AUX_FORMAT_RGBA16_FLOAT;
        |                     ^~~~~~~~~~~~~~~~~~~~~~~
  ../lib/intel_aux_pgtable.c:25:45: error: stray ‘\240’ in program
     25 | #define AUX_FORMAT_RGBA16_FLOAT        0x1
        |                                             ^
  ../lib/intel_aux_pgtable.c:311:21: note: in expansion of macro ‘AUX_FORMAT_RGBA16_FLOAT’
    311 |    entry.e.format = AUX_FORMAT_RGBA16_FLOAT;
        |                     ^~~~~~~~~~~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1717652595:step_script
  section_start:1717652595:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717652596:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59544524):
        |                     ^~~~~~~~~~~~~~~~~~~~~~~
  ../lib/intel_aux_pgtable.c:25:44: error: stray ‘\302’ in program
     25 | #define AUX_FORMAT_RGBA16_FLOAT        0x1
        |                                            ^
  ../lib/intel_aux_pgtable.c:311:21: note: in expansion of macro ‘AUX_FORMAT_RGBA16_FLOAT’
    311 |    entry.e.format = AUX_FORMAT_RGBA16_FLOAT;
        |                     ^~~~~~~~~~~~~~~~~~~~~~~
  ../lib/intel_aux_pgtable.c:25:45: error: stray ‘\240’ in program
     25 | #define AUX_FORMAT_RGBA16_FLOAT        0x1
        |                                             ^
  ../lib/intel_aux_pgtable.c:311:21: note: in expansion of macro ‘AUX_FORMAT_RGBA16_FLOAT’
    311 |    entry.e.format = AUX_FORMAT_RGBA16_FLOAT;
        |                     ^~~~~~~~~~~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1717652597:step_script
  section_start:1717652597:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717652598:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59544525):
        |                     ^~~~~~~~~~~~~~~~~~~~~~~
  ../lib/intel_aux_pgtable.c:25:44: error: stray ‘\302’ in program
     25 | #define AUX_FORMAT_RGBA16_FLOAT        0x1
        |                                            ^
  ../lib/intel_aux_pgtable.c:311:21: note: in expansion of macro ‘AUX_FORMAT_RGBA16_FLOAT’
    311 |    entry.e.format = AUX_FORMAT_RGBA16_FLOAT;
        |                     ^~~~~~~~~~~~~~~~~~~~~~~
  ../lib/intel_aux_pgtable.c:25:45: error: stray ‘\240’ in program
     25 | #define AUX_FORMAT_RGBA16_FLOAT        0x1
        |                                             ^
  ../lib/intel_aux_pgtable.c:311:21: note: in expansion of macro ‘AUX_FORMAT_RGBA16_FLOAT’
    311 |    entry.e.format = AUX_FORMAT_RGBA16_FLOAT;
        |                     ^~~~~~~~~~~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1717652597:step_script
  section_start:1717652597:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717652598:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1194559
