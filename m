Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C53C369BA
	for <igt-dev@archiver.kernel.org>; Wed, 16 Apr 2025 16:31:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 127D510E96F;
	Wed, 16 Apr 2025 16:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DQ7+v7YV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC0D10E96F
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Apr 2025 16:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744821100; x=1776357100;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EMOw1I+Ngb3hnwS7ZYvMnlqqXCvjG/0t/4jnyKh/p9Y=;
 b=DQ7+v7YVy9gnHPdcfjUsjglklvlhIj/lR3eEwzClkYNLvXlzR0TNw6lO
 i5PGnvVRCKPMlVbUwiO4/wybpIgmkZJ/53CK2q4U5UTqSgQtMNzyAF8vP
 S8G/9rmM/Lm/W00xf8tI8rv+5Na6RHigVCst3drY+IX8+RXE0vezZAPmR
 p2BF4A9RYBIzhvnG/+Ua0L2TIssXYVk9vk1GQ9TY32DdrTItIUaoF7FmQ
 RmNSalyBKyc7UmaN/xqGMsv4DCZ7IRz5zEJidHqOQh3KchpSva8liUZ8Z
 FprvhfmpQOzxvMwaAWTnq7u0x92Qf5HZ5oyE+EaRJufWIC5GSQGAy4aME A==;
X-CSE-ConnectionGUID: 2jh11JDISjOo8bAc6DkFRQ==
X-CSE-MsgGUID: 9Y6QxOniT7GxqxBEJCiIWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="45515104"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="45515104"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 09:31:40 -0700
X-CSE-ConnectionGUID: g3E+8rKmTO2IhA5p0ICwPg==
X-CSE-MsgGUID: btXjKVgMTqm6m6eTetw90A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="130380189"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa006.fm.intel.com with ESMTP; 16 Apr 2025 09:31:39 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH i-g-t 2/3] lib/xe: replace div64_u64_round_up() with
 DIV_ROUND_UP
Date: Wed, 16 Apr 2025 16:30:52 +0000
Message-Id: <20250416163053.117425-3-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250416163053.117425-1-shuicheng.lin@intel.com>
References: <20250416163053.117425-1-shuicheng.lin@intel.com>
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

DIV_ROUND_UP is defined in igt_aux.h with the same function as
div64_u64_round_up().

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 lib/xe/xe_util.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
index 06b378ce0..9907c8b16 100644
--- a/lib/xe/xe_util.c
+++ b/lib/xe/xe_util.c
@@ -253,14 +253,6 @@ static uint32_t reference_clock(int fd, int gt_id)
 	return refclock;
 }
 
-static uint64_t div64_u64_round_up(const uint64_t x, const uint64_t y)
-{
-	igt_assert(y > 0);
-	igt_assert_lte_u64(x, UINT64_MAX - (y - 1));
-
-	return (x + y - 1) / y;
-}
-
 /**
  * xe_nsec_to_ticks: convert time in nanoseconds to timestamp ticks
  * @fd: opened device
@@ -273,5 +265,5 @@ uint32_t xe_nsec_to_ticks(int fd, int gt_id, uint64_t nsec)
 {
 	uint32_t refclock = reference_clock(fd, gt_id);
 
-	return div64_u64_round_up(nsec * refclock, NSEC_PER_SEC);
+	return DIV_ROUND_UP(nsec * refclock, NSEC_PER_SEC);
 }
-- 
2.25.1

