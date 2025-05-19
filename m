Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96145C2D0CD
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 12:32:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B28B10E3B1;
	Mon, 19 May 2025 12:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="At/0fqJL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1787D10E397
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 12:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747657929; x=1779193929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S8waqhsepRlcrsiXCB8/9iG0bWBtHrYbw5O2az6MfvM=;
 b=At/0fqJL5qdh5dTNqkjIJ9iAN2A0lhDonpHUi3Xe6wT86RitlmUQewtE
 iuI4OxgRk71rqFRjkShwtwy+ssrsb0Ch+XqwiQJEH6lYi4677n8h0VaEA
 ocM+9NJB+zVbN8E2SV67ZKjd96fEiCFn2A/rYpl6VtcLqrkRI02xXCGxg
 AtTGvw9wLMpUu6PpcvWt9HRAuAvwWy7Ju5nfzL5B7R0VB7Nhv5+hEbLU4
 ykFaE7iLXjkUQNq4a5cM+sKBAZyY4AH5w7ipDMDWgu0ScDTe8c87bEGJN
 Ob3zxtIWFhHlOY0IYZkq4yteqeumkzcTK9hGl5cV3lx3YYB+u041dcRwI Q==;
X-CSE-ConnectionGUID: sQ3XGEZ2S+eQdgKJVzNZQA==
X-CSE-MsgGUID: 3eH3WMDhQOyJB64FfW90SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49710016"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="49710016"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 05:32:09 -0700
X-CSE-ConnectionGUID: vQE8Po/XSJO0peSSBx1m3g==
X-CSE-MsgGUID: gFoogjz5RK2yUsdxCX5lNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="144358197"
Received: from unknown (HELO thasleem.iind.intel.com) ([10.190.216.203])
 by orviesa004.jf.intel.com with ESMTP; 19 May 2025 05:32:08 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v2 1/2] lib/igt_debugfs: Add specific checks for WA in GTs
Date: Mon, 19 May 2025 18:01:34 +0530
Message-ID: <20250519123135.1307174-2-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250519123135.1307174-1-mohammed.thasleem@intel.com>
References: <20250519123135.1307174-1-mohammed.thasleem@intel.com>
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

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 lib/igt_debugfs.c | 31 +++++++++++++++++++++++++++++++
 lib/igt_debugfs.h |  1 +
 2 files changed, 32 insertions(+)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index 8ac215a76..ec3e33854 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -44,6 +44,7 @@
 #include "igt_kms.h"
 #include "igt_debugfs.h"
 #include "igt_sysfs.h"
+#include "xe/xe_query.h"
 
 /**
  * SECTION:igt_debugfs
@@ -770,3 +771,33 @@ void __igt_debugfs_dump(int device, const char *filename, int level)
 	igt_log(IGT_LOG_DOMAIN, level, "%s:\n%s\n", filename, contents);
 	free(contents);
 }
+
+/**
+ * igt_has_intel_wa:
+ * @drm_fd:	A drm file descriptor
+ * @check_wa:	Workaround to be checked
+ * @return:	It will return true if WA found otherwise false
+ */
+int igt_has_intel_wa(int drm_fd, const char *check_wa)
+{
+	char name[PATH_MAX];
+	char *debugfs_dump;
+	unsigned int xe, debugfs_fd;
+
+	debugfs_fd = igt_debugfs_dir(drm_fd);
+
+	xe_for_each_gt(drm_fd, xe) {
+		sprintf(name, "gt%d/workarounds", xe);
+		if (!igt_debugfs_exists(drm_fd, name, O_RDONLY))
+			return -1;
+
+		debugfs_dump = igt_sysfs_get(debugfs_fd, name);
+
+		if (debugfs_dump != NULL) {
+			if (strstr(debugfs_dump, check_wa))
+				return true;
+		}
+	}
+
+	return false;
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

