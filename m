Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D49DE7716D
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 15:27:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E55CA10E3BD;
	Thu,  5 Dec 2024 15:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ny1U/1x0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB2F310E3BD
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Dec 2024 15:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733412427; x=1764948427;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7OpOwU6y2a+evHBjfxdu2856wAc5oeGO8Z0XdvqpZT0=;
 b=Ny1U/1x0LuARoaJQjt4XRRiIV9LW09sKXvSQafq7bn6/zP4H1gmPLO1X
 pcSaKINGU6Yt147WLSexlm8cCcp4nQfC0Ig1q8zDcijEuGTu/jvtijVRS
 xHPz0qVQDLZAiRvSDgj5F+lqapzNB87DssyunFt8E7Z5b+TBGgExO+nKt
 egCej10MFB4dSD4XoNgGHEz/RvQOi75Ayfl15QnaFSVs2+coHsPkEWriR
 RhGpFjp2/kmbEZvLjEpbgAdX4MF5595TsxwRg3HV7X2haIhD+mj2WEign
 0UVmCvY//qyJ8ORf9Zvh1HFt+FMOV0lU6zUct4lkPN/ixZTmNnwWPStUe Q==;
X-CSE-ConnectionGUID: mWiRvcRIQD2icwS9K7uq/w==
X-CSE-MsgGUID: xR9vtuEDSJWSxqIOM86Lkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33612572"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="33612572"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 07:27:07 -0800
X-CSE-ConnectionGUID: Ehg4q4lrSRySfcBMrq1r8w==
X-CSE-MsgGUID: eorZP/nuSievnPPYyGzotQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="117365285"
Received: from dut4066lnl.fm.intel.com ([10.105.8.83])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 07:27:07 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, alex.zuo@intel.com, saurabhg.gupta@intel.com,
 kamil.konieczny@linux.intel.com, sai.gowtham.ch@intel.com
Subject: [PATCH v2] lib/xe/xe_gt: Repair xe_gt_stats_get_count function
Date: Thu,  5 Dec 2024 15:27:06 +0000
Message-ID: <20241205152706.5216-1-jonathan.cavitt@intel.com>
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

v2: fclose (Kamil)

Fixes: 10cefd82 ("tests/intel/xe_tlb: Add test to check TLB invalidation")
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3212
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/xe/xe_gt.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
index cee892af96..1f4b42ed9c 100644
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
+	fclose(f);
+
 	return count;
 }
-- 
2.43.0

