Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3293FC3DA4A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 20:48:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3EFC10E040;
	Wed, 14 Aug 2024 20:48:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IHfjRlCF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC6E110E040
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2024 20:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723668522; x=1755204522;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xa5mYRs0f1/8EVojhwCd0mYSPNSMTTMTxKK4vx+STfw=;
 b=IHfjRlCFpriTZFiqKPLXAe1EZZd2fk35FEdVryxdhXJ3iHPPyctGtyQd
 h+FTsCaH+EuPtvjXOCzX+i0SeIjCY+7cHokkPdq65wOeWwFh9ovUe7Zth
 618TSoBCnPkw7CVhwn1rmG9VY0i/t7DiFzAKng2OcGZgsWV/fHN08CFjx
 yQdFaV+56y67O5IRl3kh2Y0hxkyNerbih0Aed95jl783AyJHnseFqXH26
 VjM99zuOSeNJUDOf7LvEPwHcSXuz6/ZaN4DQJkW/Wd1tFq7V60DnblK/Z
 obnheZso5A9+c5NoDPWRquU3MHaQ5y4CSVEsLIXmtf3zxX+N7sYMq/1N1 Q==;
X-CSE-ConnectionGUID: dK4qr2gOSyeZLnU3jKnLfA==
X-CSE-MsgGUID: tqkVZExhRTSuuRF0A4A3VQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="21723254"
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; d="scan'208";a="21723254"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 13:48:38 -0700
X-CSE-ConnectionGUID: Lak+RoazT2+Zdls4/ZcW+g==
X-CSE-MsgGUID: YkH7rS69RUSTsK0iSKVoJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; d="scan'208";a="59108117"
Received: from ldmartin-desk2.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.125.110.119])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 13:48:37 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH i-g-t v4 0/6] Add support for hook script
Date: Wed, 14 Aug 2024 17:47:55 -0300
Message-ID: <20240814204822.95283-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

For development purposes, sometimes it is useful to have a way of
running custom scripts at certain points of test executions. A
real-world example I bumped into recently is to collect information from
sysfs before and after running each entry of a testlist.

While it is possible for the user to handcraft a script that calls each
test with the correct actions before and after execution, we can provide
a better experience by adding built-in support for running hooks during
test execution.

This series adds support for running a hook script during test
execution. The feature is exposed to users via option --hook, which is
made available for regular test binaries as well as for igt_runner.

v2:
  - Updated first patch to address review commands.
  - Added support for multiple instances of --hook options with 4 extra
    patches appended to the series. I thought about squashing them to
    the original patches, but I preferred to keep them separated, since
    supporting multiple --hook options can be seen as an extension and
    should make the series easier to follow.

v3:
  - Updated patches to address review comments. See the changelog in
    each patch for details.

v4:
  - Apply suggested nits.

Gustavo Sousa (6):
  igt_hook: Add feature
  runner: Make it easier to extend argv
  runner: Add option --hook
  igt_hook: Implement and use set_fake_argv() in test
  igt_hook: Allow multiple hook descriptors
  runner: Allow multiple --hook options

 .../igt-gpu-tools/igt-gpu-tools-docs.xml      |   1 +
 lib/igt_core.c                                |  83 ++-
 lib/igt_hook.c                                | 511 ++++++++++++++++++
 lib/igt_hook.h                                |  70 +++
 lib/meson.build                               |   1 +
 lib/tests/igt_hook.c                          | 166 ++++++
 lib/tests/igt_hook_integration.c              | 371 +++++++++++++
 lib/tests/meson.build                         |   2 +
 runner/executor.c                             |  61 ++-
 runner/runner_tests.c                         |  18 +
 runner/settings.c                             | 168 +++++-
 runner/settings.h                             |   2 +
 12 files changed, 1426 insertions(+), 28 deletions(-)
 create mode 100644 lib/igt_hook.c
 create mode 100644 lib/igt_hook.h
 create mode 100644 lib/tests/igt_hook.c
 create mode 100644 lib/tests/igt_hook_integration.c

-- 
2.46.0

