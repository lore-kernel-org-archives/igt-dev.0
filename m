Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526EAC27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 19:06:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E750C10ED12;
	Fri,  7 Jun 2024 19:06:58 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D62410ED11;
 Fri,  7 Jun 2024 19:06:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_Support_for_RGB16161616?=
 =?utf-8?q?=5F64B_compressed_format_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Melanie Lobo" <melanie.lobo@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 07 Jun 2024 19:06:57 -0000
Message-ID: <171778721764.27586.8233075046859860056@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240606121523.5347-1-melanie.lobo@intel.com>
In-Reply-To: <20240606121523.5347-1-melanie.lobo@intel.com>
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

Series: Support for RGB16161616_64B compressed format (rev2)
URL   : https://patchwork.freedesktop.org/series/134558/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1195621 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59601545):
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
  section_end:1717740589:step_script
  section_start:1717740589:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717740590:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59601548):
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
  section_end:1717740590:step_script
  section_start:1717740590:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717740591:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59601547):
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
  section_end:1717740590:step_script
  section_start:1717740590:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717740591:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59601549):
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
  section_end:1717740581:step_script
  section_start:1717740581:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717740582:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59601546):
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
  section_end:1717740561:step_script
  section_start:1717740561:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717740562:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59601540):
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
  section_end:1717740602:step_script
  section_start:1717740602:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717740604:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59601543):
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
  section_end:1717740589:step_script
  section_start:1717740589:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717740591:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59601541):
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
  section_end:1717740570:step_script
  section_start:1717740570:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717740571:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59601542):
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
  section_end:1717740569:step_script
  section_start:1717740569:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717740570:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1195621
