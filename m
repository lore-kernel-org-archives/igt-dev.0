Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85A3C83F26
	for <igt-dev@archiver.kernel.org>; Tue, 29 Jul 2025 05:45:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6755510E1CC;
	Tue, 29 Jul 2025 05:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lKLgqdep";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0EA10E1CC
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Jul 2025 05:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753767940; x=1785303940;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/VrRvYP6ZgXXhZbom4GwsKz0WRT5Avi451oCjy6ZRkY=;
 b=lKLgqdepylzNMRkZbS9r3zdBQvXD+kauTl6plsWZbUtR/CH1bJEh2PpR
 0T8/ln7RaQzv5mlOBVW5TEOUPtC4gi808Pv0pxaJyN1oXwLIvI7+PQeJV
 bh6rnMkZZHpr440kPCDmhkj2YYOTn08REcNNOEoxRgI9zmXYpm1jZTR8M
 V9jpLBLHs94PH2GfMYlW+wcLHIGjFpHwOT8OHMMyTMTcfGYW00eZwWjVe
 A4YKJSAcafCWunbrLsxjk1nVX9WG/24aVJSXBNxK9Ye4CYpK5N7XgdnJ0
 MV/cuuSfsaOKsHVAD9qqgihvQs6gtaEZQFFSQPZQ2/hKk5cldATzlx4dX A==;
X-CSE-ConnectionGUID: KZnp/AHvT9WDGoKyZM2uDg==
X-CSE-MsgGUID: RwIGpve8SveWioMEazKxBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="55886601"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="55886601"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 22:45:39 -0700
X-CSE-ConnectionGUID: cO3U4QKCT+6QHl3BERjCiA==
X-CSE-MsgGUID: ZGYtfT+5TwmLiO8MRPhP4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="162179603"
Received: from unknown (HELO priyanka.iind.intel.com) ([10.190.216.153])
 by fmviesa007.fm.intel.com with ESMTP; 28 Jul 2025 22:45:37 -0700
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, nishit.sharma@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] lib/xe_gt: Assertion related to xe_gt_stats_get_count
Date: Tue, 29 Jul 2025 11:15:36 +0530
Message-Id: <20250729054536.3323672-1-priyanka.dandamudi@intel.com>
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
need using this need not fail.So, now the function will warn the failure
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

