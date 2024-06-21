Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829A1C27C4F
	for <igt-dev@archiver.kernel.org>; Fri, 21 Jun 2024 19:52:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 080C510E07E;
	Fri, 21 Jun 2024 19:52:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ymd7v8me";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C69210E07E
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2024 19:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718999550; x=1750535550;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+1AyPa0u/sBpbt16JRsV6tO5ZYxHAF2ABhAAS55l62U=;
 b=Ymd7v8meFUVFq2+XcMjRhcatNmQJZGDi3ZCLt8KEOh65ArjMqqScxxpp
 2BB9SaV4TLKYksPgcmLtqAW+dAnSJzQLuNC1JYK39K4WL+D35TH8becDs
 o/as4EaHDXz3vchtSZQF8KrpHWssu6I5XxtfNV89ThCyVCH6+mBkbCgO8
 j/7JGW46E5W1STHGWYxoidZ+mA9Ht80NgB+wYBYGaPB6sBpdU+c7TBnXF
 55B/eHK5+tv+3Il+RUFTcVvG29SrfxJEwDrLtrnsBSkf4OP6ddBiJbguG
 0d6HLMnh5rm1qwHSeE/LR9Ubm5YuTEGBYpD7TKoDtJFk+sS9wcLinmbvg Q==;
X-CSE-ConnectionGUID: la6z/tvOTHSArtPiRvAMaw==
X-CSE-MsgGUID: qR4T/lJ9QgqWPBnhE9SuxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="15925513"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="15925513"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 12:52:30 -0700
X-CSE-ConnectionGUID: Y660rIGPRQWpyQota2rDhA==
X-CSE-MsgGUID: +Uodymm0RpO/GNHOZX1ZHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="73432086"
Received: from dgramcko-desk.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.124.221.63])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 12:52:28 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Petri Latvala <adrinael@adrinael.net>
Subject: [PATCH i-g-t v2 0/7] Add support for hook script
Date: Fri, 21 Jun 2024 16:51:43 -0300
Message-ID: <20240621195150.390462-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.45.2
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

Gustavo Sousa (7):
  igt_hook: Add feature
  runner: Make it easier to extend argv
  runner: Add option --hook
  igt_hook: Implement and use set_fake_argv() in test
  igt_hook: Allow multiple hook descriptors
  runner: Use dynamic vector for test argv
  runner: Allow multiple --hook options

 .../igt-gpu-tools/igt-gpu-tools-docs.xml      |   1 +
 lib/igt_core.c                                | 121 +++-
 lib/igt_hook.c                                | 524 ++++++++++++++++++
 lib/igt_hook.h                                |  70 +++
 lib/meson.build                               |   1 +
 lib/tests/igt_hook.c                          | 180 ++++++
 lib/tests/igt_hook_integration.c              | 374 +++++++++++++
 lib/tests/meson.build                         |   2 +
 runner/executor.c                             |  61 +-
 runner/runner_tests.c                         |  18 +
 runner/settings.c                             | 168 +++++-
 runner/settings.h                             |   2 +
 12 files changed, 1492 insertions(+), 30 deletions(-)
 create mode 100644 lib/igt_hook.c
 create mode 100644 lib/igt_hook.h
 create mode 100644 lib/tests/igt_hook.c
 create mode 100644 lib/tests/igt_hook_integration.c

-- 
2.45.2

