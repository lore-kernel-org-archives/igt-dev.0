Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608D4C5AE59
	for <igt-dev@archiver.kernel.org>; Wed, 28 May 2025 21:27:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA75A10E6CC;
	Wed, 28 May 2025 21:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NANVyD1I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 305E510E6CA
 for <igt-dev@lists.freedesktop.org>; Wed, 28 May 2025 21:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748467624; x=1780003624;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sKNFZ51HU2Vi9LmMNK1DQhqSBe2/zz/tkAL5donIgQM=;
 b=NANVyD1ItVjBDANPgQUM4DPD5pYYTKmb73EQC+Z1bNxeosl/XxV0phOb
 k7HnLEh7Qr/Ypy2Ei2M23dysGo+zaJX385KeDVPxB2Ks0KQ9tICmExg24
 YLOIS1q5WYyV6x/mydP0gsNcMOxS3QgCAJPJFRp6g8lV5d7XL3fcKU6YJ
 Hxam7nyEHdn7czZOZYZ5vqqXyAP0b2d/4ZPbfvA53I1c7J3v8TvbDuTJO
 UXwSwAV+shyKQRSes5+Ad+RcJWdbAJ7/qvHPnnLDmEziqAoYrIoLLZM2q
 wVwBBNiwepL2L3esvjJMms7J14bVzi5wMo1VIrtFB4fjcNLbMXE+xy5t4 w==;
X-CSE-ConnectionGUID: s/drDiyTQiKmqLX8OwhSCA==
X-CSE-MsgGUID: QFgS4uYGSUWvjlXlK3qHyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61864173"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="61864173"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 14:27:03 -0700
X-CSE-ConnectionGUID: cjbNZNIhTV2vRqMJ6Gn6bA==
X-CSE-MsgGUID: buEukNtpTceKNwydozNdFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="143688345"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.84.121])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 14:27:02 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH i-g-t 2/3] lib/xe_gt: Trigger forced GT reset using write
Date: Wed, 28 May 2025 23:26:17 +0200
Message-Id: <20250528212618.373-3-michal.wajdeczko@intel.com>
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

The newest Xe driver supports triggering a GT reset using a write
operation and this is a preffered method. Update IGT code to comply
with that and also start using existing helper functions to access
exposed "force_reset" attribute instead of relying on system() call.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 lib/xe/xe_gt.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
index 8bceca10d..c911ca8e4 100644
--- a/lib/xe/xe_gt.c
+++ b/lib/xe/xe_gt.c
@@ -59,15 +59,14 @@ bool has_xe_gt_reset(int fd)
 
 static void xe_force_gt_reset(int fd, int gt, bool sync)
 {
-	char reset_string[128];
-	struct stat st;
+	const char *attr = sync ? "force_reset_sync" : "force_reset";
+	int dir = igt_debugfs_gt_dir(fd, gt);
+	int len;
 
-	igt_assert_eq(fstat(fd, &st), 0);
-
-	snprintf(reset_string, sizeof(reset_string),
-		 "cat /sys/kernel/debug/dri/%d/gt%d/force_reset%s",
-		 minor(st.st_rdev), gt, sync ? "_sync" : "");
-	system(reset_string);
+	igt_assert_neq(dir, -1);
+	len = igt_sysfs_write(dir, attr, "1", 1);
+	close(dir);
+	igt_assert_eq(len, 1);
 }
 
 /**
-- 
2.47.1

