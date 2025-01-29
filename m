Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7C1C0218D
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jan 2025 22:01:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D4D10E8C2;
	Wed, 29 Jan 2025 22:01:05 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB8D10E8C7;
 Wed, 29 Jan 2025 22:01:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_RFC_tests/kms=5Fvrr=3AA?=
 =?utf-8?q?dd_adaptive-dc_subtest?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 29 Jan 2025 22:01:04 -0000
Message-ID: <173818806430.2599720.4349586198187232423@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250129201149.3666688-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20250129201149.3666688-1-ramanaidu.naladala@intel.com>
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

Series: RFC tests/kms_vrr:Add adaptive-dc subtest
URL   : https://patchwork.freedesktop.org/series/144119/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1354733 for the overview.

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/70206731):
  ../tests/kms_vrr.c:682:11: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
    result = (uint64_t)thread_result;
             ^
  In file included from ../lib/drmtest.h:39,
                   from ../lib/igt.h:27,
                   from ../tests/kms_vrr.c:33:
  ../tests/kms_vrr.c:684:28: warning: format ‘%ld’ expects argument of type ‘long int’, but argument 7 has type ‘uint64_t’ {aka ‘long long unsigned int’} [-Wformat=]
    igt_assert_f(result == 0, "Adaptive_dc_balance %ld not adjusted\n", result);
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ~~~~~~
  ../lib/igt_core.h:694:75: note: in definition of macro ‘igt_assert_f’
     __igt_fail_assert(IGT_LOG_DOMAIN, __FILE__, __LINE__, __func__, #expr , f); \
                                                                             ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1738187860:step_script
  section_start:1738187860:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1738187861:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/70206733):
  ../tests/kms_vrr.c:682:11: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
    result = (uint64_t)thread_result;
             ^
  In file included from ../lib/drmtest.h:39,
                   from ../lib/igt.h:27,
                   from ../tests/kms_vrr.c:33:
  ../tests/kms_vrr.c:684:28: warning: format ‘%ld’ expects argument of type ‘long int’, but argument 7 has type ‘uint64_t’ {aka ‘long long unsigned int’} [-Wformat=]
    igt_assert_f(result == 0, "Adaptive_dc_balance %ld not adjusted\n", result);
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ~~~~~~
  ../lib/igt_core.h:694:75: note: in definition of macro ‘igt_assert_f’
     __igt_fail_assert(IGT_LOG_DOMAIN, __FILE__, __LINE__, __func__, #expr , f); \
                                                                             ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1738187936:step_script
  section_start:1738187936:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1738187937:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1354733
