Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EC7C25B5F
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 19:51:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40EE210FA66;
	Wed,  8 May 2024 19:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B7Ls4DyP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF1610F2D6
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 19:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715197862; x=1746733862;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rmzDKk5EQAO/qiTb+7uTa7YpgBq7Iav0u3rEEXxLOYo=;
 b=B7Ls4DyPtepeHk0YJhvtCY4nXhT4XmRJ01vxRoNsEgP/R+PgrE8v3j62
 7h+SfObCd2QXtWGlPo1ygOZewscNnULbNNyTL+R3CFg6bOBw1k9hXmpct
 qLjCl0umiGVSNGom4QkXvlmZC9SLV95vfUw+eMdi8NwhzWxJ7xhHYRAV5
 kkcfz5GBriTnpi2Y3S1jsEkgNttBKSFYrl3a6MzYWsknJ+ahKqj1LlcLV
 0mLLQB+OW1zwVOFyiMGfNfH57qDJB2KIfmgCujc8R4kLLAzmYDZcdY4yB
 2BxKAN/WGQwlovq9H2WdztLOuYzTO7WmUk3kL8Xa6L/P321SdyDbpPf6x Q==;
X-CSE-ConnectionGUID: dp6lkCmzQ+WJw4QT7hORNg==
X-CSE-MsgGUID: S4v+ixeVRMi4EWht8vtA1A==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11239932"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="11239932"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 12:51:02 -0700
X-CSE-ConnectionGUID: xnUoINbERLal/zxl5YEzhg==
X-CSE-MsgGUID: /pRyCkGMQNKbF0KDvaijhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="33798501"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 12:51:02 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, brian.welty@intel.com,
 tomasz.mistat@intel.com, himanshu.girotra@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t 0/1] lib/xe/xe_query: Wait for xe_supports_faults
Date: Wed,  8 May 2024 12:35:44 -0700
Message-Id: <20240508193545.2735209-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
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

It's possible for xe_supports_faults to return false if the system is
busy with multiple running tests.  This is because the check looks for
all active VMs and searches for VMs that do not have faults enabled,
returning false if any exist.  Recently, this check has been changed to
return EBUSY when the check fails in this way, so wait for up to ten
seconds for all the active VMs to flush out before proceeding.

v2:
- Remove loop from lib version of xe_supports_faults.
- Change xe_supports_faults to instead return the return value of the
  ioctl call used for the check.
- Loop when xe_supports_faults is called instead if the return value is
  -EBUSY.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1562
Test-with: 20240503190138.1958302-1-jonathan.cavitt@intel.com
Suggested-by: Brian Welty <brian.welty@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

Jonathan Cavitt (1):
  lib/xe/xe_query: Wait for xe_supports_faults

 lib/xe/xe_query.c                | 15 ++++++++-------
 lib/xe/xe_query.h                |  2 +-
 tests/intel/xe_exec_fault_mode.c |  9 ++++++++-
 3 files changed, 17 insertions(+), 9 deletions(-)

-- 
2.25.1

