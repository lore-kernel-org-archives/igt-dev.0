Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0A8E77183
	for <igt-dev@archiver.kernel.org>; Mon, 16 Dec 2024 13:12:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F6710E4C3;
	Mon, 16 Dec 2024 13:12:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XYYNX2c5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE6B10E63F
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Dec 2024 13:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734354726; x=1765890726;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZHofMBt6FKITgUUe/33V8U1BT3K+ez2fRbHnxyvJQrU=;
 b=XYYNX2c5Z2oY90gkbwMcBLETi+VLIJcTM2xl89kJweIlcAAU9XKfvMq5
 uamLvsRhNmlOd1Mz7zztxApXFxULXjk3sZ98RKZfDdGTYJ5sFRqKU2d4a
 M66Os8gl+eY6oEsJ/QpkGLzXAgKy7qxas5Hbd7hZXEPr5zw90sb/beXzp
 OiF051gVRcaNPbzKSIAquQJH9Si7Hexq1cn63bTYuzvWeNULpopaaX04A
 9mHIkLMKmcbgUcDAjcaS4uF7XfDTceRWtavVCyRpsNJAucJLeztCdZ5ta
 2m8/Wqg11B7g2JO1pR3z6z+BwqsUFtbluiJHkTyHP1gGrngKzniJDZjz7 Q==;
X-CSE-ConnectionGUID: IdcfNPFKT7q28tJr5qfJ1A==
X-CSE-MsgGUID: usge2lZNQaWTbsG0tNW43A==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34616784"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; d="scan'208";a="34616784"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 05:12:06 -0800
X-CSE-ConnectionGUID: lmfrLqbcSYq13ZfoCUs/fg==
X-CSE-MsgGUID: wGHo9jTNTieVDKJ+rrTC9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; d="scan'208";a="127997710"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO dgrzegor-mobl2..)
 ([10.245.245.5])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 05:12:05 -0800
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH i-g-t 1/2] lib/xe/xe_util: introduce helper for enabling ccs
 mode
Date: Mon, 16 Dec 2024 14:11:36 +0100
Message-Id: <20241216131137.50945-1-dominik.grzegorzek@intel.com>
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

From: Andrzej Hajda <andrzej.hajda@intel.com>

Multiple tests will require enabled ccs mode. Add special helper to
avoid code duplication.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/xe/xe_util.c | 31 +++++++++++++++++++++++++++++++
 lib/xe/xe_util.h |  1 +
 2 files changed, 32 insertions(+)

diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
index 9482819c2..f7ae19f08 100644
--- a/lib/xe/xe_util.c
+++ b/lib/xe/xe_util.c
@@ -302,3 +302,34 @@ int xe_gt_count_engines_by_class(int fd, int gt, int class)
 
 	return n;
 }
+
+/**
+ * xe_sysfs_enable_ccs_mode:
+ * @fd: pointer to xe drm fd, can reopened multiple times
+ *
+ * Enables ccs_mode on all GTs, it must succeed for at least one GT.
+ * Since function requires the driver to be closed during ccs_mode change
+ * @fd will be closed then re-opened.
+ */
+void xe_sysfs_enable_ccs_mode(int *fd)
+{
+	int gt, gt_fd, num_slices, ccs_mode, num_gt, enabled_count = 0;
+
+	num_gt = xe_number_gt(*fd);
+
+	for (gt = 0; gt < num_gt; gt++) {
+		gt_fd = xe_sysfs_gt_open(*fd, gt);
+		drm_close_driver(*fd);
+
+		if (!igt_debug_on(igt_sysfs_scanf(gt_fd, "num_cslices", "%u", &num_slices) <= 0) &&
+		    !igt_debug_on(igt_sysfs_printf(gt_fd, "ccs_mode", "%u", num_slices) <= 0) &&
+		    !igt_debug_on(igt_sysfs_scanf(gt_fd, "ccs_mode", "%u", &ccs_mode) <= 0) &&
+		    !igt_debug_on(num_slices != ccs_mode))
+			enabled_count++;
+		close(gt_fd);
+		*fd = drm_open_driver(DRIVER_XE);
+	}
+
+	if (!enabled_count)
+		igt_require_f(0, "Cannot enable ccs mode for any GT\n");
+}
diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
index b9fbfc5cd..a82c44a2a 100644
--- a/lib/xe/xe_util.h
+++ b/lib/xe/xe_util.h
@@ -53,5 +53,6 @@ int xe_gt_fill_engines_by_class(int fd, int gt, int class,
 				struct drm_xe_engine_class_instance eci[static XE_MAX_ENGINE_INSTANCE]);
 int xe_gt_count_engines_by_class(int fd, int gt, int class);
 
+void xe_sysfs_enable_ccs_mode(int *fd);
 
 #endif /* XE_UTIL_H */
-- 
2.34.1

