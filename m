Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBC2C5AD49
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 13:11:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F284210E103;
	Thu, 29 May 2025 13:11:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fOqRQzd7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA45610E103
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 13:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748524302; x=1780060302;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BXL0pDKDsMT4WWOpIhvWQZ0TPAdbQwLA+2rZJDXBSTU=;
 b=fOqRQzd72JmkHkd8JGjkBC66geeIfXWx7Jfkb0gziw3GgUAc5vYHL8y3
 ShPgDpATu1ZH+COEkV9RRKJJ4VNyvpPCGdIW1EO2iMZmqNk29xwqAyKo/
 ZkklGmqS8d+W1zdLIJVC85rGtFLxosQumJTsoqUqQNTusdQdZhmsU0OBD
 LZtP+8c30B95SywJGi890fkbFe6QM4jAdHtrW5gB4H8wEivCdUsxPqHzX
 qiX0/gC5CHC8BwJ2y72za7bSiL0+Tehhx9fzlgL5r2feFWsQsloQdM6vo
 JS0DzvqD8iCMv6/h0Wy7yPaOMwHVuksm79LovS8QKb16rD0zMkY8XGYVG A==;
X-CSE-ConnectionGUID: XTyYpkYKSgyTnivorAR7lA==
X-CSE-MsgGUID: q52mKos1SJyu6/lVgArRBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="73115882"
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; d="scan'208";a="73115882"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 06:11:41 -0700
X-CSE-ConnectionGUID: lfqHZ6L9Qj2irj5Qjj114Q==
X-CSE-MsgGUID: v1TeaghdQwmApimv0FXchQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="148423396"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.113.199])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 06:11:40 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH i-g-t v2 1/3] lib/xe_gt: Move reset related function to xe_gt.c
Date: Thu, 29 May 2025 15:11:27 +0200
Message-Id: <20250529131127.417-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250528212618.373-2-michal.wajdeczko@intel.com>
References: <20250528212618.373-2-michal.wajdeczko@intel.com>
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
v2: update also tests/intel/xe_eudebug_online.c (CI)
---
 lib/xe/xe_gt.c                  | 39 +++++++++++++++++++++++++++++++++
 lib/xe/xe_gt.h                  |  3 +++
 lib/xe/xe_ioctl.c               | 23 -------------------
 lib/xe/xe_ioctl.h               |  2 --
 lib/xe/xe_legacy.c              |  1 +
 tests/intel/xe_eudebug_online.c |  1 +
 tests/intel/xe_wedged.c         |  1 +
 7 files changed, 45 insertions(+), 25 deletions(-)

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
diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 1f72e3e44..535f00818 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -13,6 +13,7 @@
  */
 
 #include "xe/xe_eudebug.h"
+#include "xe/xe_gt.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "igt.h"
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

