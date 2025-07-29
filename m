Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45DBFC83F26
	for <igt-dev@archiver.kernel.org>; Tue, 29 Jul 2025 05:47:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA7110E1CC;
	Tue, 29 Jul 2025 05:47:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QOow1qzz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E52310E1CC
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Jul 2025 05:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753768027; x=1785304027;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1t+ykSefVIK+5ULCANHkRTuZTNNWgJeqUFZJENfirSI=;
 b=QOow1qzz8cZNn8eOpns955iypD5WDkT+4IRryUZeAqtua9ZACUwzgxXR
 CoGzOUHMe2vKml4jx8RWV1sMTWOhb73+8QFoisX+mrKsxwYnn6dDqkYcn
 xi/FIF/38yPYTUY1WuUNDxPBGYUqiuRiwvOWEqvAWt3UnUnUWkj50O90q
 gb9J7BJSp2etvG4Zd5Q7Lm8rW5WAavxKWggOK286lfuylx4ZXFb/W/BTJ
 NUXLwYZkVQgE7vYWCFmTjE17euepIDeKk682NlQKamjYqpciXfM0CvICz
 i/avRE7vTUVe8FG7KHksQnQjKyzuQyn3mGCvz+sXcn+m+gWL90ugbWG5E A==;
X-CSE-ConnectionGUID: ps9z8iRiT96KwNXmrkt7oA==
X-CSE-MsgGUID: 0zguIW4HRZ++sLCPyF1sjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="73476472"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="73476472"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 22:47:07 -0700
X-CSE-ConnectionGUID: QXg+86UWTD6G8UlK0xFFew==
X-CSE-MsgGUID: jzUq8eKwTcKqyop3Do63Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="166780440"
Received: from unknown (HELO priyanka.iind.intel.com) ([10.190.216.153])
 by fmviesa003.fm.intel.com with ESMTP; 28 Jul 2025 22:47:05 -0700
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, nishit.sharma@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] lib/xe_gt: Assertion related to xe_gt_stats_get_count
Date: Tue, 29 Jul 2025 11:17:03 +0530
Message-Id: <20250729054703.3323716-1-priyanka.dandamudi@intel.com>
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Currently, when the specific gt stats file is not found, it fails with
an assertion. Due to this the test using this function also fails.
In general, this lib function is just to count the stats count, test
using this need not fail.So, now the function will warn the failure
when file not found and return -1 as count.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 lib/xe/xe_gt.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
index afb757bfa..ed19bec74 100644
--- a/lib/xe/xe_gt.c
+++ b/lib/xe/xe_gt.c
@@ -185,8 +185,11 @@ int xe_gt_stats_get_count(int fd, int gt, const char *stat)
 		minor(st.st_rdev), gt);
 	f = fopen(path, "r");
 
-	igt_assert_f(f, "Failed to open /sys/kernel/debug/dri/%d/gt%d/stats",
-		     minor(st.st_rdev), gt);
+	if (!f) {
+		igt_warn("Failed to open /sys/kernel/debug/dri/%d/gt%d/stats",
+			 minor(st.st_rdev), gt);
+		return -1;
+	}
 
 	while (fgets(tlb_path, sizeof(tlb_path), f)) {
 		if (strstr(tlb_path, stat) != NULL) {
-- 
2.34.1

