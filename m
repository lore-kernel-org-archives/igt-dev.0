Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796A0D591AC
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 18:05:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B3710E54E;
	Mon, 18 Nov 2024 18:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DV9mM3Q+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705C910E13E
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 18:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731953113; x=1763489113;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ENRgJlYsm/w4WRz6qzFVex5OUws/QA/0yGBkcPte4Vo=;
 b=DV9mM3Q+Yvfl40HRzdwFUBgdxZvh0hlMDYLSwiwmyDfmz5fNydLyDhlM
 ZyMvv1xBXztdEQs8LARk3yUXtm3vtQrirB1top2Eex5zerfvX2565/uYu
 NXmugKI4TXrXt8sHAIgmbPOJhM30JG4v4DdQQ2rezdAJiIWG3WDwyXFYU
 xiUSBsox2kJvBnATGFmwu4xFl3bTjTYCLhr10vsm0nfioU+uo13ZGF5dI
 D9H00TsGzpFUoMlouMy0LoyOQPnAiWkqIvzxnAeoXbjVUbsYatTgNjY5Q
 dPhJl1Px4rA/ZAJUC+cp1lrW5Fq0eDBFeGm5aZnHHdmYpbiz9q8XP+vga Q==;
X-CSE-ConnectionGUID: SHp96YjeQ/ee+gJk8QauCg==
X-CSE-MsgGUID: nBS05nCkQ82n8SOJ8iA9OA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="35597456"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="35597456"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 10:05:13 -0800
X-CSE-ConnectionGUID: 1lBMjRtaS2CBIzP9CJGMyQ==
X-CSE-MsgGUID: ScLPNhtAS5qGmZFRUhKmpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="89723605"
Received: from dut4411lnl.fm.intel.com ([10.105.10.34])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 10:05:12 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 kamil.konieczny@linux.intel.com, vinay.belgaumkar@intel.com
Subject: [PATCH v7 0/4] test/intel/xe_sysfs: Restore sysfs params correctly
Date: Mon, 18 Nov 2024 18:05:07 +0000
Message-ID: <20241118180511.64212-1-jonathan.cavitt@intel.com>
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

The xe_sysfs_timeslice_duration, xe_sysfs_preempt_timeout, and
xe_sysfs_scheduler tests do not correctly restore modified sysfs params on
test failure.
Additionally, xe_sysfs_timeslice_duration modifies but does not restore
preempt_timeout_us.
Finally, while xe_sysfs_scheduler does attempt to restore all modified
sysfs params at the end of the tests, no guarantee is made that the
restorations are successful.
Repair these issues.

v3: Fix several formatting issues (Kamil)

v4: Do not compare possibly unassigned variable (Kamil)
    Whitespace and commit name fixes (Kamil)

v5: Add new helper funciton, igt_sysfs_get_next_engine
    Fix igt_sysfs_scanf/printf usage in tests (Kamil)

v6: Replace helper function igt_sysfs_get_next_engine with new helper
    functions that return and destroy engine lists (Kamil)

v7: Also fix xe_sysfs_scheduler

Jonathan Cavitt (4):
  lib/igt_sysfs: Add engine list helpers
  tests/intel/xe_sysfs*: Restore values on test failure
  tests/intel/xe_sysfs_timeslice_duration: Restore preempt timeout
  tests/intel/xe_sysfs_scheduler: Assert sysfs params are restored

 lib/igt_sysfs.c                           | 54 +++++++++++++++
 lib/igt_sysfs.h                           |  3 +
 tests/intel/xe_sysfs_preempt_timeout.c    | 58 +++++++++++++---
 tests/intel/xe_sysfs_scheduler.c          | 82 ++++++++++++++++++++---
 tests/intel/xe_sysfs_timeslice_duration.c | 74 +++++++++++++++++---
 5 files changed, 241 insertions(+), 30 deletions(-)

-- 
2.43.0

