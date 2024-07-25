Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A780C3DA49
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jul 2024 14:20:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB49A10E835;
	Thu, 25 Jul 2024 14:20:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BhUzmsRo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FD710E834
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2024 14:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721917251; x=1753453251;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lZ6G91EwMWqdpzpGFaNsdMxSxTyr+u8IA8h0cnyjdt8=;
 b=BhUzmsRoB1SesOSVUYENIHLPnzr/ItxXc4TZcp0Assd/yLBOAkfqb7Sa
 ilTHJgC14cUXU/a39wrrqEglgtfKAty2NGK84grDHbFCuaYMenQk4qcHO
 8zVRPS4QtSeFK8t9ZNYYr361fwpIKRNXz2OV+IApcMqNQ/dMWPdA8Jd5d
 05unx7dHj21T4kYKRBnS0dU0kOh49+bOZuhqX9dYqG1egLGLTSWMPg6N5
 4kDfBbQB98iTDydejgZUNuBYnh/uTlP1f304Qurj2M3+PVacepXji4ueE
 qM75+WGvHCrsHD4m17LGNL0Ti/ErZ0nJ0bjJ5+OAtg7XMaskMzGqN6Ige g==;
X-CSE-ConnectionGUID: Ol0sOvruRGikwvoc/0oUNQ==
X-CSE-MsgGUID: LAXVOgsMTQGM0NXZf6ujcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="23463851"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="23463851"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 07:20:50 -0700
X-CSE-ConnectionGUID: BjBv8M7xQBimUEejuhbwTw==
X-CSE-MsgGUID: dyUke7BGTECgy2ThWgdwcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="83938415"
Received: from djiang5-mobl3.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.125.111.59])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 07:20:46 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 0/6] Add support for hook script
Date: Thu, 25 Jul 2024 11:19:33 -0300
Message-ID: <20240725142028.51735-1-gustavo.sousa@intel.com>
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
  - Updated first patch to address review comments.
  - Added support for multiple instances of --hook options with 4 extra
    patches appended to the series. I thought about squashing them to
    the original patches, but I preferred to keep them separated, since
    supporting multiple --hook options can be seen as an extension and
    should make the series easier to follow.

v3:
  - Updated patches to address review comments. See the changelog in each patch
    for details.

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
 lib/tests/igt_hook_integration.c              | 374 +++++++++++++
 lib/tests/meson.build                         |   2 +
 runner/executor.c                             |  61 ++-
 runner/runner_tests.c                         |  18 +
 runner/settings.c                             | 168 +++++-
 runner/settings.h                             |   2 +
 12 files changed, 1429 insertions(+), 28 deletions(-)
 create mode 100644 lib/igt_hook.c
 create mode 100644 lib/igt_hook.h
 create mode 100644 lib/tests/igt_hook.c
 create mode 100644 lib/tests/igt_hook_integration.c

-- 
2.45.2

