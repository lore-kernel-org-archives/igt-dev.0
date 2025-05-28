Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C64C5B553
	for <igt-dev@archiver.kernel.org>; Wed, 28 May 2025 21:27:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C22410E6D1;
	Wed, 28 May 2025 21:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mZqOH+qD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1311910E6CC
 for <igt-dev@lists.freedesktop.org>; Wed, 28 May 2025 21:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748467624; x=1780003624;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qAQSqmm39ls80vLJYrlmN4Kju0Uu3levk+3Z59mZO5A=;
 b=mZqOH+qDrd+Ai03RWhuUqAakPGCXCD7aKYyCf4JmtWnipvMnWGWQhYIw
 jp/5m4chSinavo0Ejdpdt5VyGnYa1PG10oOiY5q1+wUSp68IvvapXVlaM
 uZdNOnbQFtLDv9RhAcCuhkVVizCHFtUNbLBTuNu6bahw3FF4OxsFoM5/8
 mVfkoIn0jOs5R+HBiq892VC4UyAVhHfjOGwa3svC0O8l4Sj7Zc/Q6wh+z
 MRRQCQMTpdLl8KVWmPJh7ULp/yntblWNdY9DBTPWpTOTSjNf4kD48XAj1
 +IvZIdOrmVKn/OE1QsDq0fTX4fHeXxo7ON3aH3iAjFA93AA+rWTYS/s4C g==;
X-CSE-ConnectionGUID: LoJuRUGpTQ+rIrCqUsNgUA==
X-CSE-MsgGUID: fir4i6+KRl6W+kZTQVwCDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61864170"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="61864170"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 14:27:01 -0700
X-CSE-ConnectionGUID: XDDT/bJwSreuhNd9a1Rx/A==
X-CSE-MsgGUID: KbBqkz1nSKasYURp+BC2Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="143688342"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.84.121])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 14:27:00 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH i-g-t 1/3] lib/xe_gt: Move reset related function to xe_gt.c
Date: Wed, 28 May 2025 23:26:16 +0200
Message-Id: <20250528212618.373-2-michal.wajdeczko@intel.com>
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

Those helper functions are per GT and related query function is
already there. While around add simple documentation.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 lib/xe/xe_gt.c          | 39 +++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_gt.h          |  3 +++
 lib/xe/xe_ioctl.c       | 23 -----------------------
 lib/xe/xe_ioctl.h       |  2 --
 lib/xe/xe_legacy.c      |  1 +
 tests/intel/xe_wedged.c |  1 +
 6 files changed, 44 insertions(+), 25 deletions(-)

diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
index a1e080b88..8bceca10d 100644
--- a/lib/xe/xe_gt.c
+++ b/lib/xe/xe_gt.c
@@ -57,6 +57,45 @@ bool has_xe_gt_reset(int fd)
 	return 1;
 }
 
+static void xe_force_gt_reset(int fd, int gt, bool sync)
+{
+	char reset_string[128];
+	struct stat st;
+
+	igt_assert_eq(fstat(fd, &st), 0);
+
+	snprintf(reset_string, sizeof(reset_string),
+		 "cat /sys/kernel/debug/dri/%d/gt%d/force_reset%s",
+		 minor(st.st_rdev), gt, sync ? "_sync" : "");
+	system(reset_string);
+}
+
+/**
+ * xe_force_gt_reset_async:
+ * @fd: the Xe DRM file descriptor
+ * @gt: the GT identifier
+ *
+ * This function forces a reset on the selected GT.
+ * It does not wait for the reset completion.
+ */
+void xe_force_gt_reset_async(int fd, int gt)
+{
+	xe_force_gt_reset(fd, gt, false);
+}
+
+/**
+ * xe_force_gt_reset_async:
+ * @fd: the Xe DRM file descriptor
+ * @gt: the GT identifier
+ *
+ * This function forces a reset on the selected GT.
+ * It will wait until the reset completes.
+ */
+void xe_force_gt_reset_sync(int fd, int gt)
+{
+	xe_force_gt_reset(fd, gt, true);
+}
+
 /**
  * xe_force_gt_reset_all:
  *
diff --git a/lib/xe/xe_gt.h b/lib/xe/xe_gt.h
index 06a59281c..93525ea35 100644
--- a/lib/xe/xe_gt.h
+++ b/lib/xe/xe_gt.h
@@ -12,6 +12,9 @@
 
 bool has_xe_gt_reset(int fd);
 void xe_force_gt_reset_all(int fd);
+void xe_force_gt_reset_async(int fd, int gt);
+void xe_force_gt_reset_sync(int fd, int gt);
+
 igt_hang_t xe_hang_ring(int fd, uint64_t ahnd, uint32_t ctx, int ring,
 				unsigned int flags);
 void xe_post_hang_ring(int fd, igt_hang_t arg);
diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 53a53cd0d..1e95af409 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -585,26 +585,3 @@ int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
 	igt_assert_eq(__xe_wait_ufence(fd, addr, value, exec_queue, &timeout), 0);
 	return timeout;
 }
-
-static void xe_force_gt_reset(int fd, int gt, bool sync)
-{
-	char reset_string[128];
-	struct stat st;
-
-	igt_assert_eq(fstat(fd, &st), 0);
-
-	snprintf(reset_string, sizeof(reset_string),
-		 "cat /sys/kernel/debug/dri/%d/gt%d/force_reset%s",
-		 minor(st.st_rdev), gt, sync ? "_sync" : "");
-	system(reset_string);
-}
-
-void xe_force_gt_reset_async(int fd, int gt)
-{
-	xe_force_gt_reset(fd, gt, false);
-}
-
-void xe_force_gt_reset_sync(int fd, int gt)
-{
-	xe_force_gt_reset(fd, gt, true);
-}
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index 522094ae2..6302d1a7d 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -99,7 +99,5 @@ int __xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
 		     uint32_t exec_queue, int64_t *timeout);
 int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
 		       uint32_t exec_queue, int64_t timeout);
-void xe_force_gt_reset_async(int fd, int gt);
-void xe_force_gt_reset_sync(int fd, int gt);
 
 #endif /* XE_IOCTL_H */
diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
index a3ff5da03..6570cf1e6 100644
--- a/lib/xe/xe_legacy.c
+++ b/lib/xe/xe_legacy.c
@@ -5,6 +5,7 @@
 
 #include "lib/igt_syncobj.h"
 #include "linux_scaffold.h"
+#include "xe/xe_gt.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_legacy.h"
 #include "xe/xe_spin.h"
diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index 1d2c510b7..7fc7ca9eb 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -22,6 +22,7 @@
 #include "igt_sysfs.h"
 
 #include "xe_drm.h"
+#include "xe/xe_gt.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_spin.h"
-- 
2.47.1

