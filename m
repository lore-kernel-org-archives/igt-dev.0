Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC99DC3ABB2
	for <igt-dev@archiver.kernel.org>; Fri, 30 May 2025 07:54:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E3F610E7CA;
	Fri, 30 May 2025 07:54:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EKAp9BD3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9521D10E7EB
 for <igt-dev@lists.freedesktop.org>; Fri, 30 May 2025 07:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748591692; x=1780127692;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Winyprb6JEWW7pbxFL9ONtswDj03iUlDtGwiYU7rTXU=;
 b=EKAp9BD3hBvAtIRpLJmDC3O31iFEfLizsL4Hj2yA8VpQ6U3rThLMYL6N
 6NNUFvm0pG0KdzaA/sacPMT98Q0KpU0FYe6xg6EiDbXqfRwjHO4H7Ey8x
 e7UaCjaYlwAxc+Iv2QRRpiZfUCw2RMjfkU+MArSu4vOxsTRnFwEKVyG6J
 uBolOu7YZe/HJbXzOBCc//5rKrDC11P4A/ubDqlGVH7T5gpyHqRD6me/Z
 wKUaQdEmFd6jUUUyxE3LBQ7XIihdC/uyWKcfMBzsFxEElGw4YQ5x7/fxQ
 dTvBcOnYeW61+uUbrmrBZI2yi6BDOJiJF2wMPlfasIPINVwDcEauV82FO g==;
X-CSE-ConnectionGUID: 0BYRATwORP2ACYv1eYNBKQ==
X-CSE-MsgGUID: OXGLiNKyTtuHTJYsRZsffg==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="76068452"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="76068452"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 00:54:50 -0700
X-CSE-ConnectionGUID: InF5wa8qQNejPs/0r0Uy7w==
X-CSE-MsgGUID: E6AQ98KUQayDhEvHiuvyaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="144787239"
Received: from linux-lunar-lake-client-platform.iind.intel.com
 ([10.190.238.55])
 by fmviesa009.fm.intel.com with ESMTP; 30 May 2025 00:54:48 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH v4 1/2] lib/igt_debugfs: Add specific checks for WA in GTs
Date: Fri, 30 May 2025 13:28:10 +0530
Message-Id: <20250530075811.1033-2-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250530075811.1033-1-mohammed.thasleem@intel.com>
References: <20250530075811.1033-1-mohammed.thasleem@intel.com>
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

This function check the given workaround on available GTs.

v2: Add discription for return. (Kamil)
    Rename function to igt_has_intel_wa. (Kamil)
    Move lib changes to lib/igt_debugfs. (Kamil)
    Dump the whole wa sysfs file and then search for the wa. (Vinod)
    Use return true/false directly instead assigning value. (Vinod)
v3: Updated return type discription and debugfs_fd failure check. (Kamil)
    Return 0 or 1 instead of true or false. (Kamil)
v4: Add check for xe device before execution. (Vinod)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_debugfs.c | 39 +++++++++++++++++++++++++++++++++++++++
 lib/igt_debugfs.h |  1 +
 2 files changed, 40 insertions(+)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index 8ac215a76..5444c6f5f 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -44,6 +44,7 @@
 #include "igt_kms.h"
 #include "igt_debugfs.h"
 #include "igt_sysfs.h"
+#include "xe/xe_query.h"
 
 /**
  * SECTION:igt_debugfs
@@ -770,3 +771,41 @@ void __igt_debugfs_dump(int device, const char *filename, int level)
 	igt_log(IGT_LOG_DOMAIN, level, "%s:\n%s\n", filename, contents);
 	free(contents);
 }
+
+/**
+ * igt_has_intel_wa:
+ * @drm_fd:	A drm file descriptor
+ * @check_wa:	Workaround to be checked
+ *
+ * Returns:	0 if no WA, 1 if WA present, -1 on error
+ */
+int igt_has_intel_wa(int drm_fd, const char *check_wa)
+{
+	int debugfs_fd;
+	unsigned int xe;
+	char name[PATH_MAX];
+	char *debugfs_dump, *has_wa;
+
+	if (!is_xe_device(drm_fd))
+		return 0;
+
+	debugfs_fd = igt_debugfs_dir(drm_fd);
+	if (debugfs_fd == -1)
+		return -1;
+
+	xe_for_each_gt(drm_fd, xe) {
+		sprintf(name, "gt%d/workarounds", xe);
+		if (!igt_debugfs_exists(drm_fd, name, O_RDONLY))
+			return -1;
+
+		debugfs_dump = igt_sysfs_get(debugfs_fd, name);
+		if (debugfs_dump != NULL) {
+			has_wa = strstr(debugfs_dump, check_wa);
+			free(debugfs_dump);
+			if (has_wa)
+				return 1;
+		}
+	}
+
+	return 0;
+}
diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
index f4044d545..6d4c09d2f 100644
--- a/lib/igt_debugfs.h
+++ b/lib/igt_debugfs.h
@@ -49,6 +49,7 @@ bool igt_debugfs_search(int fd, const char *filename, const char *substring);
 int igt_debugfs_gt_dir(int device, unsigned int gt);
 int igt_debugfs_gt_open(int device, unsigned int gt, const char *filename,
 			int mode);
+int igt_has_intel_wa(int drm_fd, const char *check_wa);
 
 /**
  * igt_debugfs_read:
-- 
2.34.1

