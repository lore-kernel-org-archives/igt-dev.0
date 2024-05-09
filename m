Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BBDC10F1A
	for <igt-dev@archiver.kernel.org>; Thu,  9 May 2024 15:25:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B33410E654;
	Thu,  9 May 2024 15:25:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VE2119eM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7844510E654
 for <igt-dev@lists.freedesktop.org>; Thu,  9 May 2024 15:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715268321; x=1746804321;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8VYxYXoQiIF15hZFjzw16jTxvdJ3mmjbc/psoLBri30=;
 b=VE2119eMdF584N3Rxsw9GTA9OqROCBywO7pB5QdIAVHvu08mUfcHdUmD
 kvg/9iFeTKvLtfqvpzE7D10JKHqsYlue2iEM9acSTA8zHg9qox9ASTPPg
 CPOp93FUU3Om5whLCwjmZe2eBfjMkDLkORNEgxTkUYCWCsKnP+miGdB6h
 Ah1WXU+yRoIVb+zCy95Z7zX53E/CRIISWB5nV6y3f0T4srimog3SzIP1d
 LmVcuVhPK8utMNFV7HkdybfmQyUUsh3GroW1g211AYg4UIv2ZMQAz3+aC
 CyjL7sCXX9XQPTgPyMMiwVwmpAHe6mr4M9h+DMC/KDpU/1Qroy1GDF5Q4 g==;
X-CSE-ConnectionGUID: P7YbQrjESiSQB8jiOeSHIQ==
X-CSE-MsgGUID: vOre3CTXThuiaMoKP0dmGA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11038979"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="11038979"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 08:25:21 -0700
X-CSE-ConnectionGUID: aXHbP1csQUWSzaVjBJVHrw==
X-CSE-MsgGUID: 0LDenP/xRXi5iDjMXyVQSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="66719265"
Received: from bjrankin-mobl3.amr.corp.intel.com (HELO
 gjsousa-mobl2.intel.com) ([10.124.223.58])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 08:25:20 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/3] Add support for hook script
Date: Thu,  9 May 2024 12:24:28 -0300
Message-ID: <20240509152442.189166-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.45.0
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
execution. The feature is exposed to users via option --hook, which made
available for regular test binaries as well as for igt_runner.

Gustavo Sousa (3):
  igt_hook: Add feature
  runner: Make it easier to extend argv
  runner: Add option --hook

 .../igt-gpu-tools/igt-gpu-tools-docs.xml      |   1 +
 lib/igt_core.c                                | 116 +++-
 lib/igt_hook.c                                | 499 ++++++++++++++++++
 lib/igt_hook.h                                |  86 +++
 lib/meson.build                               |   1 +
 lib/tests/igt_hook.c                          | 187 +++++++
 lib/tests/igt_hook_integration.c              | 297 +++++++++++
 lib/tests/meson.build                         |   2 +
 runner/executor.c                             |  52 +-
 runner/runner_tests.c                         |   5 +
 runner/settings.c                             |  25 +-
 runner/settings.h                             |   1 +
 12 files changed, 1248 insertions(+), 24 deletions(-)
 create mode 100644 lib/igt_hook.c
 create mode 100644 lib/igt_hook.h
 create mode 100644 lib/tests/igt_hook.c
 create mode 100644 lib/tests/igt_hook_integration.c

-- 
2.45.0

