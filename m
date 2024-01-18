Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CA9C47422
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 14:44:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71CB210E840;
	Thu, 18 Jan 2024 14:44:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A249410E840
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 14:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705589087; x=1737125087;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MxgWHg1Ifo2hEDXuyIrxMpjqgQcsd5CVKI3ydD8Vd/E=;
 b=d+HezbTkze/jksyErJF8k5mbeuhsBflSdZdTqrenRO4z/bg5OCT+C2ST
 Mqvz+E3sBX/ZgnvwgslO/xCoh5iAf3W1JYVM5S5qVpWmLUJYbeyHyOJ2T
 Wqv0qpRsAvTa7lFnzMyFN9Hc6Xyg92p46I77fzfWd29MhmzhM3veI76Rc
 8RDsSDBxb8+sv6WrWWGnFGTztHY3fAxfD02ZVx+CFuCEJbRlv3WBfbPMA
 t5TU5vgsJUL4JcOxOHRwPoJoZZAwAwW91B8f/MRdJDyfIncwkFGdkxF0a
 kfre71rjMyengA8q7MgN6oKdQK5kq3ecmUhlEB28xKwl+bJFlqZ89b+Oz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="400130006"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="400130006"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 06:44:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="903844467"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="903844467"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 06:44:45 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/2] tests/intel/xe_gt_freq: Skip GuC PC tests if SLPC
 not enabled
Date: Thu, 18 Jan 2024 20:26:36 +0530
Message-Id: <20240118145636.1775115-3-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240118145636.1775115-1-badal.nilawar@intel.com>
References: <20240118145636.1775115-1-badal.nilawar@intel.com>
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

Skip GuC PC tests if SLPC is disabled

Fixes: acaaca0bf317 ("tests/xe: Add Xe IGT tests")
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 tests/intel/xe_gt_freq.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index bf63e4298..853720297 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -20,6 +20,7 @@
 #include "xe/xe_query.h"
 #include "xe/xe_util.h"
 
+#include <fcntl.h>
 #include <string.h>
 #include <sys/time.h>
 
@@ -319,6 +320,30 @@ static void test_reset(int fd, int gt_id, int cycles)
 	}
 }
 
+static bool xe_is_slpc_enabled_gt(int drm_fd, int gt)
+{
+	int gt_fd;
+	int freq_fd;
+
+	gt_fd = xe_sysfs_gt_open(drm_fd, gt);
+	igt_assert(gt_fd >= 0);
+
+	/*
+	 * When SLPC disabled xe kmd doesn't create sysfs freq entries
+	 * so its enough to check one of the entry present of not
+	 */
+	freq_fd = openat(gt_fd, "freq0/max_freq", O_RDONLY);
+
+	close(gt_fd);
+
+	if (freq_fd < 0)
+		return false;
+
+	close(freq_fd);
+
+	return true;
+}
+
 igt_main
 {
 	int fd;
@@ -329,6 +354,9 @@ igt_main
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
 
+		igt_skip_on_f(!xe_is_slpc_enabled_gt(fd, 0),
+			      "GuC PC tests are not supported when SLPC is disabled\n");
+
 		/* The defaults are the same. Stashing the gt0 is enough */
 		stash_min = get_freq(fd, 0, "min");
 		stash_max = get_freq(fd, 0, "max");
-- 
2.25.1

