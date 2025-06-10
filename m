Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E88C5B552
	for <igt-dev@archiver.kernel.org>; Tue, 10 Jun 2025 17:39:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2634610E2A5;
	Tue, 10 Jun 2025 17:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mI8nyWRK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04F510E134
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Jun 2025 17:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749577141; x=1781113141;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=757Lcg5gEquzIHBUZXt51mpbYjQfJOhfQ0hvMrE1f2Q=;
 b=mI8nyWRKe42Qr7UFJD+zQCVH7CkyBhuOhPuuhSml/dIoODq8dDGRKpsH
 IhqIorgJUuk5VfHIYQsiCsOwmxgOzBcD0iUPAgAlft00YVSPx3YJL+MAg
 HsB2UKdL1hJp/1brdYVT201WQMK8Pl9giCQqNCqV48AyusNK5rB3Ix0WD
 EFoD9z8gsgngopecN583IeszQoA6CDl8uDk9OAiS7RraMer7Q3V+kbZ8u
 LyyeooICLhPle7T6JXpBpn0fmga9lN4o58b2eSuuNBMid1x2upYamOrPQ
 zZQczpAUO7nHY4KQLA+C2tKwBPWbYYGbDiApgJK85LLvnml0rOdMt4IDU w==;
X-CSE-ConnectionGUID: 2b6ozI6qRV2NyVFBgPWwcQ==
X-CSE-MsgGUID: L7zJGy9LT6GhL2F7Uh+YTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="55505940"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="55505940"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 10:39:00 -0700
X-CSE-ConnectionGUID: fBUpG5xRTbaWhSqTKPyBWQ==
X-CSE-MsgGUID: x+RnqxEHRmSs0s3/Uz6lBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="147854431"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 linux-Lunar-Lake-Client-Platform.iind.intel.com) ([10.190.238.55])
 by orviesa008.jf.intel.com with ESMTP; 10 Jun 2025 10:38:59 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>
Subject: [PATCH v5 1/7] lib/igt_debugfs: Add specific checks for WA in GTs
Date: Tue, 10 Jun 2025 23:12:38 +0530
Message-Id: <20250610174244.1292-2-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610174244.1292-1-mohammed.thasleem@intel.com>
References: <20250610174244.1292-1-mohammed.thasleem@intel.com>
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
Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 lib/igt_debugfs.c | 39 +++++++++++++++++++++++++++++++++++++++
 lib/igt_debugfs.h |  1 +
 2 files changed, 40 insertions(+)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index 210a9cea0..f2621a84c 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -44,6 +44,7 @@
 #include "igt_kms.h"
 #include "igt_debugfs.h"
 #include "igt_sysfs.h"
+#include "xe/xe_query.h"
 
 /**
  * SECTION:igt_debugfs
@@ -745,3 +746,41 @@ void __igt_debugfs_dump(int device, const char *filename, int level)
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

