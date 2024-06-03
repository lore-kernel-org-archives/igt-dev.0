Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2322DC25B75
	for <igt-dev@archiver.kernel.org>; Mon,  3 Jun 2024 07:44:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF6810E0EB;
	Mon,  3 Jun 2024 07:44:46 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6787410E0EB;
 Mon,  3 Jun 2024 07:44:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests/intel/kms=5Fflip?=
 =?utf-8?q?=5Fscaled=5Fcrc=3A_Add_support_for_FP16_format_of_MTL_compressed_?=
 =?utf-8?q?modifier_=28rev19=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Melanie Lobo" <melanie.lobo@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 03 Jun 2024 07:44:45 -0000
Message-ID: <171740068541.2260944.8398233171821380349@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20231010134540.28485-1-melanie.lobo@intel.com>
In-Reply-To: <20231010134540.28485-1-melanie.lobo@intel.com>
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

Series: tests/intel/kms_flip_scaled_crc: Add support for FP16 format of MTL compressed modifier (rev19)
URL   : https://patchwork.freedesktop.org/series/124956/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1192631 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59456321):
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
  section_end:1717400575:step_script
  section_start:1717400575:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717400576:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59456324):
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
  section_end:1717400588:step_script
  section_start:1717400588:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717400588:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59456323):
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
  section_end:1717400590:step_script
  section_start:1717400590:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717400591:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59456325):
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
  section_end:1717400611:step_script
  section_start:1717400611:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717400611:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59456322):
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
  section_end:1717400571:step_script
  section_start:1717400571:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717400571:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59456316):
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
  section_end:1717400580:step_script
  section_start:1717400580:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717400580:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59456319):
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
  section_end:1717400587:step_script
  section_start:1717400587:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717400588:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59456317):
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
  section_end:1717400588:step_script
  section_start:1717400588:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717400589:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59456318):
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
  section_end:1717400589:step_script
  section_start:1717400589:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717400590:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1192631
