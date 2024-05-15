Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010B2C25B75
	for <igt-dev@archiver.kernel.org>; Wed, 15 May 2024 10:52:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709A110E3CB;
	Wed, 15 May 2024 10:52:30 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DBC310E3CB;
 Wed, 15 May 2024 10:52:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_lib/gpgpu=3A_add_shader?=
 =?utf-8?q?_support_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 15 May 2024 10:52:29 -0000
Message-ID: <171577034951.2117833.3616824896991262948@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240515-iga64_inline_ups-v2-0-693743cb0985@intel.com>
In-Reply-To: <20240515-iga64_inline_ups-v2-0-693743cb0985@intel.com>
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

Series: lib/gpgpu: add shader support (rev2)
URL   : https://patchwork.freedesktop.org/series/133020/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1178181 for the overview.

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/58765598):
  #define ARRAY_SIZE(arr) (sizeof(arr)/sizeof(arr[0]))
                                 ^~~~~
  ../lib/gpgpu_shader.c:312:3: error: expected ';' after expression
          )ASM", 2, y_offset, 3, value, value, value, value);
           ^
           ;
  ../lib/gpgpu_shader.c:312:6: warning: missing terminating '"' character [-Winvalid-pp-token]
          )ASM", 2, y_offset, 3, value, value, value, value);
              ^
  ../lib/gpgpu_shader.c:312:3: error: use of undeclared identifier 'ASM'
          )ASM", 2, y_offset, 3, value, value, value, value);
           ^
  6 warnings and 12 errors generated.
  ninja: build stopped: subcommand failed.
  section_end:1715769978:step_script
  section_start:1715769978:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1715769979:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/58765596):
  Checking for function "outb" : YES
  Checking if "cpuid.h" links: YES
  Header <unistd.h> has symbol "gettid": YES
  Checking whether type "struct sysinfo" has member "totalram" : YES
  Checking for function "memfd_create" : YES
  Configuring config.h using configuration
  Program python3 found: YES (/usr/bin/python3)
  lib/meson.build:236: WARNING: Identifier 'in' will become a reserved keyword in a future release. Please rename it.
  
  lib/meson.build:236:9: ERROR:  Expecting eol got id.
      if f in iga64_assembly_sources
           ^
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1715769970:step_script
  section_start:1715769970:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1715769971:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1178181
