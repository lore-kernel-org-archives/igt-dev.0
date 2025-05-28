Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004AAC5AD49
	for <igt-dev@archiver.kernel.org>; Wed, 28 May 2025 21:27:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 895B010E6D0;
	Wed, 28 May 2025 21:27:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AslM/jDQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A7B10E6CC
 for <igt-dev@lists.freedesktop.org>; Wed, 28 May 2025 21:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748467624; x=1780003624;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZdRyaWg+9FC8S3wavfR/dqNlhdRmcVUp3hdVwph6GjY=;
 b=AslM/jDQOjDDeEEvVWr1+wam3eh8PtryF0HlQqmUwkH0DcKtRysCIRwk
 VFfaW2nGKi+YE64bQ1CagoBb60f0asK0rznVdzUECAdPMs1WNwAkny0P0
 Gr3IlyfC1Sg1CGOPwvuHYtzLSCBXKajJlTIify3urElYuSsW4dasMop5r
 PL5JStcRe4hgVuvl28jl7wEo5mSnycW5PQ2+E5X/2MztANdszxcmixBsK
 FiMuQ1E60p5yr/pReiKiIKE+iQcGIwVRhgQ5lACewFfvX4LoJxnmn6d2T
 ZbHUG7b4MIZ1xw22Se67lzeTPV9VCNZOcxcxmSM7Fh/kkrXBKF9LRbb3M A==;
X-CSE-ConnectionGUID: 4vck24VdQeKcPEp0kyiUkg==
X-CSE-MsgGUID: 2CtDigAtQMmz/fJ/SP651Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61864176"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="61864176"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 14:27:04 -0700
X-CSE-ConnectionGUID: VDQ3ZEsDQki8ubUW64AmgQ==
X-CSE-MsgGUID: 0jG842OsSye/7daypeYJZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="143688349"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.84.121])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 14:27:03 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH i-g-t 3/3] lib/xe_gt: Update has_xe_gt_reset function
Date: Wed, 28 May 2025 23:26:18 +0200
Message-Id: <20250528212618.373-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250528212618.373-1-michal.wajdeczko@intel.com>
References: <20250528212618.373-1-michal.wajdeczko@intel.com>
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

We should look for the write-only "force_reset" attribute.
While around simplify code by using existing helper functions.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 lib/xe/xe_gt.c | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
index c911ca8e4..afb757bfa 100644
--- a/lib/xe/xe_gt.c
+++ b/lib/xe/xe_gt.c
@@ -30,31 +30,17 @@
  */
 bool has_xe_gt_reset(int fd)
 {
-	char reset_sysfs_path[100];
-	struct stat st;
+	int reset_fd;
 	int gt;
-	int reset_sysfs_fd = -1;
-	int sysfs_fd = -1;
 
-	igt_assert_eq(fstat(fd, &st), 0);
-	sysfs_fd = igt_sysfs_open(fd);
-
-	igt_assert(sysfs_fd != -1);
 	xe_for_each_gt(fd, gt) {
-		sprintf(reset_sysfs_path, "/sys/kernel/debug/dri/%d/gt%d/force_reset",
-				minor(st.st_rdev), gt);
-		reset_sysfs_fd = openat(sysfs_fd, reset_sysfs_path, O_RDONLY);
-
-		if (reset_sysfs_fd == -1) {
-			close(sysfs_fd);
-			return 0;
-		}
-
-		close(reset_sysfs_fd);
+		reset_fd = igt_debugfs_gt_open(fd, gt, "force_reset", O_WRONLY);
+		if (reset_fd == -1)
+			return false;
+		close(reset_fd);
 	}
 
-	close(sysfs_fd);
-	return 1;
+	return true;
 }
 
 static void xe_force_gt_reset(int fd, int gt, bool sync)
-- 
2.47.1

