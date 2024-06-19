Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F424C27C53
	for <igt-dev@archiver.kernel.org>; Wed, 19 Jun 2024 19:31:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9562710EDA1;
	Wed, 19 Jun 2024 19:31:52 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C5A10EDA1;
 Wed, 19 Jun 2024 19:31:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_Support_for_RGB16161616?=
 =?utf-8?q?=5F64B_compressed_formats_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Melanie Lobo" <melanie.lobo@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 19 Jun 2024 19:31:51 -0000
Message-ID: <171882551107.125140.4391994855697001965@a6498e030952>
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

Series: Support for RGB16161616_64B compressed formats (rev3)
URL   : https://patchwork.freedesktop.org/series/134353/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1205442 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60103846):
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
  section_end:1718825247:step_script
  section_start:1718825247:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1718825248:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60103849):
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
  section_end:1718825251:step_script
  section_start:1718825251:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1718825251:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60103848):
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
  section_end:1718825249:step_script
  section_start:1718825249:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1718825250:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60103850):
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
  section_end:1718825254:step_script
  section_start:1718825254:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1718825255:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60103847):
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
  section_end:1718825238:step_script
  section_start:1718825238:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1718825238:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60103841):
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
  section_end:1718825244:step_script
  section_start:1718825244:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1718825245:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60103844):
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
  section_end:1718825245:step_script
  section_start:1718825245:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1718825246:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60103842):
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
  section_end:1718825249:step_script
  section_start:1718825249:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1718825250:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60103843):
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
  section_end:1718825244:step_script
  section_start:1718825244:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1718825245:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1205442
