Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E33CCAC5B0
	for <igt-dev@archiver.kernel.org>; Mon, 29 Sep 2025 17:54:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 080BF10E475;
	Mon, 29 Sep 2025 17:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CNGR/bwh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC5B10E475
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Sep 2025 17:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759168490; x=1790704490;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=16dEEVYsLFe+gl6j+y4XmwcgnW4Ph+FJx6hwPQasfII=;
 b=CNGR/bwh7miK9Ey1sg8nOXfYv+bz/GBcCjNbNrnKUzW6LF3n9IZUSE7T
 p0wnX4W2rxjInnpGs9Yl7do1ATGSh1pC8vw7WdYBV3iLYKEfCuRw3838Q
 YntpA41+wMBqMBWZRQRc/dslkO/PDthfOJxX3FnSd2gy4saeluBdyKgrp
 ueaGkeAqXojkWumqUxaBlfW1eP/dnUWGzdQYkoPOkHoIf1ITZu/6TZ5Dc
 mxziuqC2ZRy4p5FnwZzie8GP4orpt6bWuAnjoEbUuSYpQnLb5rf6Ium1d
 QhfJs3Mx3GIyVt0D3qPOv6SEpCLY9t/qDDBb0joukDQGevm2XkB4aYVEY g==;
X-CSE-ConnectionGUID: HctxcGAmTemImff0vmFGFg==
X-CSE-MsgGUID: Lq0s6dokSEKgIB2tBpxXIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61330323"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61330323"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 10:54:49 -0700
X-CSE-ConnectionGUID: ldoq4g42Rje9U1lpzT+bNA==
X-CSE-MsgGUID: I5XOij6GSUSrS1YXf53ZfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="177868349"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 10:54:46 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v5 0/3] tests/intel/xe_survivability: Add xe_survivability test
Date: Mon, 29 Sep 2025 23:22:28 +0530
Message-ID: <20250929175230.753899-5-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
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

This series creates a new xe_survivability.c test file with two subtests.
i2c-functionality validates i2c adapter preservation in survivability
mode for AMC firmware updates, and runtime-survivability tests CSC error
injection, device wedged state recovery, and post-recovery GPU
functionality validation.

Sk Anirban (3):
  tests/intel/xe_survivability: Add new xe_survivability test for i2c
    adapter
  tests/intel/xe_survivability: Add new test runtime survivability
  HAX: Add xe_survivability tests to fast feedback list

 tests/intel-ci/xe-fast-feedback.testlist |   2 +
 tests/intel/xe_survivability.c           | 260 +++++++++++++++++++++++
 tests/meson.build                        |   1 +
 3 files changed, 263 insertions(+)
 create mode 100644 tests/intel/xe_survivability.c

-- 
2.43.0

