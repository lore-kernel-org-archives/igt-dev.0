Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDB7CD3427
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 02:45:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52AF10E4D6;
	Wed,  6 May 2026 02:45:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g/kDwm9Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B48410E4DA
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 02:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778035503; x=1809571503;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xPmNPBXC9tyyUzyN6uFjSyD1odQOVJe2IzccGVmj9bE=;
 b=g/kDwm9Yhu0UxyHdK9hqGAe5FHMQeIbS4BjAO29iw6Wp5OuXdQbLsXYH
 rdRWS3RJSPsW+8Cs4W1yVjF1H/Y88/f/h6G4qeMfBY+Sn++nUQBkGQoPm
 ACjbENLXQom9sikxD7rYn5G6jlciy1Fhf5VsXzZuPgT418SkYY/J/I188
 avR9JQw0zi4PgzJm7T4DxrZEmdonuSvWX40witdqMYtF9k7cTAPiYLryE
 rMk2ZH/Si0pFZTfnUesKa0lWJNewwYMlRKx6lVa5Sx8QnklkzHmWP5m+U
 1arPJpZ4NvgBpqxxsEjW+SR6qP3UTLIo/H0q6UQdmORYeA1A+CHY26VBx Q==;
X-CSE-ConnectionGUID: /YERv/31TPizM1mdNap4Fg==
X-CSE-MsgGUID: D7TCJRvvQy+BRPnGLhTB8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78780565"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="78780565"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 19:44:55 -0700
X-CSE-ConnectionGUID: W8pzpKo2TbmGOpjNBZ3cFQ==
X-CSE-MsgGUID: XTKcwbmhQIKxTUQgktnu9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="239964079"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 19:44:54 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: shekhar.chauhan@intel.com, ashutosh.dixit@intel.com,
 gustavo.sousa@intel.com
Subject: [PATCH v5 1/2] lib/intel_wa: Check for device workarounds
Date: Wed,  6 May 2026 08:14:42 +0530
Message-ID: <20260506024443.612636-2-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506024443.612636-1-shekhar.chauhan@intel.com>
References: <20260506024443.612636-1-shekhar.chauhan@intel.com>
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

Currently, igt_has_intel_wa() only checks for GT workarounds, extending
it to ensure that it also checks for device workarounds to avoid having
device workaround checks in the code.
While at it, ensure that we do not duplicate the logic for reading from
the debugfs file by extracting it into a separate function called
debugfs_file_has_wa().

Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 lib/intel_wa.c | 40 ++++++++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/lib/intel_wa.c b/lib/intel_wa.c
index 685df106f..727dd6c98 100644
--- a/lib/intel_wa.c
+++ b/lib/intel_wa.c
@@ -12,6 +12,27 @@
 #include "intel_wa.h"
 #include "xe/xe_query.h"
 
+static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
+			       const char *debugfs_name, const char *wa)
+{
+	char *debugfs_dump;
+
+	if (!igt_debugfs_exists(drm_fd, debugfs_name, O_RDONLY))
+		return -1;
+
+	debugfs_dump = igt_sysfs_get(debugfs_fd, debugfs_name);
+	if (debugfs_dump) {
+		char *has_wa = strstr(debugfs_dump, wa);
+
+		free(debugfs_dump);
+
+		if (has_wa)
+			return 1;
+	}
+
+	return 0;
+}
+
 /**
  * igt_has_intel_wa:
  * @drm_fd:	A drm file descriptor
@@ -25,7 +46,6 @@ int igt_has_intel_wa(int drm_fd, const char *check_wa)
 	int debugfs_fd;
 	unsigned int xe;
 	char name[256];
-	char *debugfs_dump, *has_wa;
 
 	debugfs_fd = igt_debugfs_dir(drm_fd);
 	if (debugfs_fd == -1)
@@ -33,22 +53,14 @@ int igt_has_intel_wa(int drm_fd, const char *check_wa)
 
 	xe_for_each_gt(drm_fd, xe) {
 		sprintf(name, "gt%d/workarounds", xe);
-		if (!igt_debugfs_exists(drm_fd, name, O_RDONLY)) {
-			ret = -1;
+		ret = debugfs_file_has_wa(drm_fd, debugfs_fd, name, check_wa);
+		if (ret)
 			break;
-		}
-
-		debugfs_dump = igt_sysfs_get(debugfs_fd, name);
-		if (debugfs_dump) {
-			has_wa = strstr(debugfs_dump, check_wa);
-			free(debugfs_dump);
-			if (has_wa) {
-				ret = 1;
-				break;
-			}
-		}
 	}
 
+	if (!ret)
+		ret = debugfs_file_has_wa(drm_fd, debugfs_fd, "workarounds", check_wa);
+
 	close(debugfs_fd);
 	return ret;
 }
-- 
2.53.0

