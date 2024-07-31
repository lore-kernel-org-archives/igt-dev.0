Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2EFFC3DA7F
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 14:30:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 853D210E63A;
	Wed, 31 Jul 2024 14:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hA+tQN2a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E7010E63A
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 14:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722436211; x=1753972211;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1mVNArNp1bNnd+MLEvpu/WhHe+9Dbp4G3ztpb3dig5c=;
 b=hA+tQN2adQgaXcwXSTQ4ACN0IYtCSAUQ73CwCCq+1ZUwEwXBM8QUgR8q
 yHqlIWpFZ6ZD5CJn7u70CI5hBJsJFHSvwZYkUHLn8E41cnRkLEyNJoYJ/
 3wBxpnprZ0PDSXvZ9Hs/F0ITLnlHNoYHeiev1kevAmJeYnen2nLIOtVTt
 yrV7bKCkOaLIuX6nrFOu3L8nV+K93Bl0dfJTMNfDfDtaihul7TIurqy26
 0H1E1epDOh9bCAS+wSVTSI8ONAzqh9keFaUK9iqgXAONQ4OmfAwBb0Tr6
 yyTbH9NDUySaAvWI0/lFxBg3WsV3I6G0d4Xo/WjJjlYYVpRtUcR7rynJ3 A==;
X-CSE-ConnectionGUID: EPiGRAbeST63j+7ss1TMng==
X-CSE-MsgGUID: vhIshIAhSOC1wz0XfoCuNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20166071"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="20166071"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 07:30:11 -0700
X-CSE-ConnectionGUID: vPDW1+20RIOBs9vx42U3kw==
X-CSE-MsgGUID: 0+6jMDNqTQekXw4vSZbhSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="54631892"
Received: from nakshtra-system-product-name.iind.intel.com ([10.145.169.86])
 by orviesa010.jf.intel.com with ESMTP; 31 Jul 2024 07:30:09 -0700
From: nakshtra.goyal@intel.com
To: igt-dev@lists.freedesktop.org,
	ramadevi.gandi@intel.com
Cc: janga.rahul.kumar@intel.com,
	sai.gowtham.ch@intel.com
Subject: [PATCH i-g-t,
 v4 0/2] tests/intel/xe_sysfs_preempt_timeout: Porting sysfs preempt
 test in xe
Date: Wed, 31 Jul 2024 20:00:27 +0530
Message-Id: <20240731143029.3661149-1-nakshtra.goyal@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Nakshtra Goyal <nakshtra.goyal@intel.com>

Using single exec, removing unnecessary headers,using variables of same
type in single line according to comments in v3

Adding test in fast_feedback to check it xe BAT in CI

Nakshtra Goyal (2):
  tests/intel/xe_sysfs_preempt_timeout: Porting sysfs preempt test in xe
  HAX/DO_NOT_MERGE: xe-fast-feedback: test xe_sysfs_preempt_timeout

 tests/intel-ci/fast-feedback.testlist  |   2 +
 tests/intel/xe_sysfs_preempt_timeout.c | 221 +++++++++++++++++++++++++
 tests/meson.build                      |   1 +
 3 files changed, 224 insertions(+)
 create mode 100644 tests/intel/xe_sysfs_preempt_timeout.c

-- 
2.34.1

