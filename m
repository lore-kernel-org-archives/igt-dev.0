Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A875BC54E65
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 07:11:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 354C610F807;
	Thu, 22 May 2025 07:11:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HvvRU9dN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C62A10F7DD
 for <igt-dev@lists.freedesktop.org>; Thu, 22 May 2025 07:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747897899; x=1779433899;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z9nGXQ+AX8qkASbvbpZiLTShFGisTTMDoV5KYZGmRLA=;
 b=HvvRU9dNYF1IrUbNkUBtMs7eeOE/7NDmHMHLCl6Q2+UmF2s4rwPmtLt3
 Fsrxt6HHJ7r4IPwO8ldTL5S1Dwssb6VoySyfDaO6d0IkANw7nLDbw/9qq
 ApNFEgh3uYwgeP34fJY/xdIl+dsH1zN+0kgjNE5dqV9eFY9390OhXItuA
 ZiPRTF5VM5ZYMzP7bEdN0mUJ3T5gfqXvNkE5OpiOxcTeDu1xDYY12Z6+9
 zX9l8Jh59M86bGPFaszNLQwGyvoMPgL5nRM7H1gv4aaJ3y71Vck4WwIUJ
 D0Dki3Ls65FvaHs9LrmqsT4P4IM4erP7IEeSyF/Qp8IYC6H1RIo2YVq7c g==;
X-CSE-ConnectionGUID: t9eMUOHERe+tmMQU5SZdrw==
X-CSE-MsgGUID: FUaFmGwiTr60O/yQPqj5Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="75303812"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="75303812"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 00:11:39 -0700
X-CSE-ConnectionGUID: WmTbSW2aQGigYLjDgkIaEw==
X-CSE-MsgGUID: 1SXOAJf5T82K0JngGpOXLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="140875735"
Received: from unknown (HELO thasleem.iind.intel.com) ([10.190.216.203])
 by fmviesa008.fm.intel.com with ESMTP; 22 May 2025 00:11:38 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v3 1/2] lib/igt_debugfs: Add specific checks for WA in GTs
Date: Thu, 22 May 2025 12:41:06 +0530
Message-ID: <20250522071106.1340240-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250519123135.1307174-2-mohammed.thasleem@intel.com>
References: <20250519123135.1307174-2-mohammed.thasleem@intel.com>
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

This function check the given workaround on available GTs

v2: Add discription for return. (Kamil)
    Rename function to igt_has_intel_wa. (Kamil)
    Move lib changes to lib/igt_debugfs. (Kamil)
    Dump the whole wa sysfs file and then search for the wa. (Vinod)
    Use return true/false directly instead assigning value. (Vinod)
v3: Updated return type discription and debugfs_fd failure check. (Kamil)
    Return 0 or 1 instead of true or false. (Kamil)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 lib/igt_debugfs.c | 36 ++++++++++++++++++++++++++++++++++++
 lib/igt_debugfs.h |  1 +
 2 files changed, 37 insertions(+)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index 8ac215a76..e4babc37f 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -44,6 +44,7 @@
 #include "igt_kms.h"
 #include "igt_debugfs.h"
 #include "igt_sysfs.h"
+#include "xe/xe_query.h"
 
 /**
  * SECTION:igt_debugfs
@@ -770,3 +771,38 @@ void __igt_debugfs_dump(int device, const char *filename, int level)
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

