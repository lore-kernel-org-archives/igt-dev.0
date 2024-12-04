Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A162E7716E
	for <igt-dev@archiver.kernel.org>; Wed,  4 Dec 2024 15:46:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFFE910E4E3;
	Wed,  4 Dec 2024 15:46:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WBNsGEQG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA2110E4E3
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Dec 2024 15:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733327211; x=1764863211;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Arj8QFcbTWnhPo/sbNfTvD0JgMjSW0+k0VZDosWjjNA=;
 b=WBNsGEQGaya9A8Sj5jJFL/OZ82KADa0PTeq07v5bf5U9+bF1A90su8sU
 fLX7wM3kLRzKoIwmKluxy5JmmmlrOTnS+k/c6OXr1vXtKD4CX2aP9kE0z
 OGURNwPD5dtOncfo9Fi1olIwkTdQir/oema25Kg5rh48f2i06pF9xzxpm
 odX+WIAoua0nj3Zr0IdMkDr+WEXOQQb3m9Vyd7y5hwSakf8RYG5td+4S5
 r3pgiWqSvuQIuSpwHAbgmnnRid+8VKE41D2VVxhH3yMcqLLBzQ9WpjeJa
 sNTyNzyzVdwJsMfjSmGS7bvlpJ7KqNo053cehr22Qj6a9wk2oNgh/6SJ+ g==;
X-CSE-ConnectionGUID: y7vjxKxZRdWYaTbnZeHF5A==
X-CSE-MsgGUID: +RKaJm5lSVGx7twlT1cmRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="51017312"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="51017312"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 07:46:51 -0800
X-CSE-ConnectionGUID: e7GVOKooTeGRfjKF6meykQ==
X-CSE-MsgGUID: Ldq+KsudRPm0EdfwN4e8Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="98227373"
Received: from dut4066lnl.fm.intel.com ([10.105.8.83])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 07:46:52 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, alex.zuo@intel.com, saurabhg.gupta@intel.com,
 kamil.konieczny@linux.intel.com, sai.gowtham.ch@intel.com
Subject: [PATCH] lib/xe/xe_gt: Repair xe_gt_stats_get_count function
Date: Wed,  4 Dec 2024 15:46:50 +0000
Message-ID: <20241204154650.13327-1-jonathan.cavitt@intel.com>
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

Resolve the following issues:

- The target directory for the fopen does not take into consideration
  the dri subdirectory and assumes the correct path is dri/0.  This
  might not be the case.  Use the "minor" function and fstat to
  generate the correct subdirectory.

- The fopen may fail and return a NULL pointer, causing the subsequent
  fgets to generate a SIGSEGV.  Assert the file opened correctly.

- The file opened by fopen is never closed.  Close it.

Fixes: 10cefd82 ("tests/intel/xe_tlb: Add test to check TLB invalidation")
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3212
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 lib/xe/xe_gt.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
index cee892af96..493bf9793f 100644
--- a/lib/xe/xe_gt.c
+++ b/lib/xe/xe_gt.c
@@ -152,18 +152,28 @@ void xe_post_hang_ring(int fd, igt_hang_t arg)
 int xe_gt_stats_get_count(int fd, int gt, const char *stat)
 {
 	FILE *f;
+	struct stat st;
 	char tlb_path[4096];
 	char path[256];
 	int count;
 
-	sprintf(path, "/sys/kernel/debug/dri/0/gt%d/stats", gt);
+	igt_assert_eq(fstat(fd, &st), 0);
+
+	sprintf(path, "/sys/kernel/debug/dri/%d/gt%d/stats",
+		minor(st.st_rdev), gt);
 	f = fopen(path, "r");
 
+	igt_assert_f(f, "Failed to open /sys/kernel/debug/dri/%d/gt%d/stats",
+		     minor(st.st_rdev), gt);
+
 	while (fgets(tlb_path, sizeof(tlb_path), f)) {
 		if (strstr(tlb_path, stat) != NULL) {
 			sscanf(tlb_path, "%*[^:]: %d", &count);
 			break;
 		}
 	}
+
+	close(f);
+
 	return count;
 }
-- 
2.43.0

