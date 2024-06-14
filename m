Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F499C27C77
	for <igt-dev@archiver.kernel.org>; Fri, 14 Jun 2024 17:18:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB54F10E16C;
	Fri, 14 Jun 2024 17:18:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MbIREHJW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 248A110E16C
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jun 2024 17:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718385501; x=1749921501;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/kZL0m+VpxPC6GIvpyIFoNbpM9SBGxu5K6yuI+dS4j4=;
 b=MbIREHJWXfAYJ8Zm2OgIBTHDkKzXoSl38PJ04eHUcqrulEtnORN8Yi+s
 u6u1KNTkzBxPeBZ4a1vN0jgh0t+CzYYOUvVbcY+I5EpX9NS651H08hlP7
 09y98QSCNOIlCnOcZc3Strp9Riw/u6tYyrrDHyvSRg7/ntDlNBBBytOhW
 ytqHOFC0xhgTDhbAlv42zqEstpgQZb6Y0YWsSbegiZQN3LeXE8Mit1XO6
 Ub0JTYyge7o5XAulVCbgBhLZ4ahG9oKQMHEmh2W40QpEG88J4TnUEXFtS
 oW5q9X7njyHQFxyq6u7vfeetcffbTc+ufGCyT+ZsaG8iIHS+gEwC3agEm g==;
X-CSE-ConnectionGUID: 4qJi5MEjTB25MznDeV9AAQ==
X-CSE-MsgGUID: 8iEJH06pQgSkloDGlWiKOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15159400"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="15159400"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 10:18:20 -0700
X-CSE-ConnectionGUID: fEl/E/MpTBi3OyDcmfFbLQ==
X-CSE-MsgGUID: 311ws+ujSTqWWGDxHRKRzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="40526186"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.59])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 10:18:20 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinay.belgaumkar@intel.com,
	kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t v2] tests/intel/xe_gt_freq: Resolve freq_low_max test
Date: Fri, 14 Jun 2024 23:05:20 +0530
Message-Id: <20240614173520.51631-1-badal.nilawar@intel.com>
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

In GUCPC flow when max freq is less than min freq and min freq is greater
than rpe then cur will be set to min.

By nature rpe is variable as pcode changes it as per its calculations.
So for above scenario when rpe is greater than min then GUCPC will set cur
to rpe.

To validate GUCPC behaving as expected it is enough to check cur freq.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1045
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1829
Fixes: 1a1e668e774e ("tests/intel/xe_gt_freq: Fix freq_low_max test")
Fixes: adcc68266b8e ("tests/intel/xe_gt_freq: Check for RPe freq updates")
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 tests/intel/xe_gt_freq.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index d2e4d1a09..664ea3f79 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -264,6 +264,7 @@ static void test_freq_low_max(int fd, int gt_id)
 {
 	uint32_t rpn = get_freq(fd, gt_id, "rpn");
 	uint32_t rpe = get_freq(fd, gt_id, "rpe");
+	uint32_t min;
 
 	/*
 	 *  When max request < min request, max is ignored and min works like
@@ -276,10 +277,16 @@ static void test_freq_low_max(int fd, int gt_id)
 	/* Refresh value of rpe, pcode could have adjusted it */
 	rpe = get_freq(fd, gt_id, "rpe");
 
-	igt_assert(get_freq(fd, gt_id, "cur") == rpe);
+	min = get_freq(fd, gt_id, "min");
 
-	if (!xe_is_gt_in_c6(fd, gt_id))
-		igt_assert(get_freq(fd, gt_id, "act") == rpe);
+	/*
+	 * Refreshed value of rpe can be lesser or greater than min (previous rpe).
+	 * So when rpe < min then cur = min else cur = rpe
+	 */
+	if (rpe < min)
+		igt_assert(get_freq(fd, gt_id, "cur") == min);
+	else
+		igt_assert(get_freq(fd, gt_id, "cur") == rpe);
 }
 
 /**
-- 
2.34.1

