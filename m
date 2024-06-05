Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE318C27C5F
	for <igt-dev@archiver.kernel.org>; Wed,  5 Jun 2024 15:28:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333A110E1AE;
	Wed,  5 Jun 2024 15:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HpTDsEob";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 320CF10E0D3
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2024 15:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717601283; x=1749137283;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=t6DTlnbEiHSaLyIwnh0tlpI8lbIyGKFP5lCjf/2UrrM=;
 b=HpTDsEobXZDtQeXJ2xqAs4O9mRa2JVBx3SDfFYym6OrliPVtjzl4r3zN
 ynH9ocwYtVEZ1db9zWM8HI6uk3crE5Lf6q4UnoO7SW/p2AWLvG0uYzMyt
 mvddf/2Wpw/5Hb/pSuP4i390snTWVFkDUNzkPYfgWfKsbRxIp+xoyNeM3
 IJOvjGHnHkbAZ6MnyvEVu1NAmKmv26J0vUwoMJ5fQFNS/popi9x3T5oMZ
 8iaLFagKE45ViupgGfGrPoCzEhgPYoHPc4yJK4Cgx0i2rYH4RW+YYU90g
 Xcirxahc4K5FsIENZoxOMp9upv8vTYjxiqYV2KpPQDVgXiEIr1LoA7+Gt g==;
X-CSE-ConnectionGUID: 2uuKf/akRbyZDY0FeaQtFA==
X-CSE-MsgGUID: ZIeFLw8HTDCIuNDdLO3ILA==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="11923007"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="11923007"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 08:28:03 -0700
X-CSE-ConnectionGUID: oBRRVEyxTBOZOAfIDaQ0YQ==
X-CSE-MsgGUID: Zugioo4YSkeBF/XshzrSew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="37557682"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 08:28:02 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com,
 matthew.brost@intel.com, john.c.harrison@intel.com,
 stuart.summers@intel.com
Subject: [PATCH i-g-t 0/2] lib/xe: Use synchronous gt resets when needed
Date: Wed,  5 Jun 2024 08:12:46 -0700
Message-Id: <20240605151248.2736694-1-jonathan.cavitt@intel.com>
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

Add a tag to xe_force_gt_reset that allows the user to decide whether or
not they want the reset to be synchronous or not.  This is done by
having the sys call target a new synchronous reset function when the tag
is set to true.

The new tag will be set to false by default, but the test
xe_exec_reset@cm-gt-reset will want this to be set to true because it
lacks a blocking mechanism on the reset and may race with itself
otherwise.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1068
Test-with: 20240605150828.2736396-1-jonathan.cavitt@intel.com
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: John Harrison <john.c.harrison@intel.com>
CC: Stuart Summers <stuart.summers@intel.com>

Jonathan Cavitt (2):
  lib/xe: Add sync tag to xe_force_gt_reset
  test/intel/xe_exec_reset: Synchronize cm-gt-reset gt resets

 lib/xe/xe_gt.c              | 2 +-
 lib/xe/xe_ioctl.c           | 6 +++---
 lib/xe/xe_ioctl.h           | 2 +-
 tests/intel/xe_exec_reset.c | 8 ++++----
 tests/intel/xe_gt_freq.c    | 2 +-
 tests/intel/xe_wedged.c     | 2 +-
 6 files changed, 11 insertions(+), 11 deletions(-)

-- 
2.25.1

