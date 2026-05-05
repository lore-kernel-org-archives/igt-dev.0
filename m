Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3EF1CD13DA
	for <igt-dev@archiver.kernel.org>; Tue,  5 May 2026 05:48:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7403210E0CF;
	Tue,  5 May 2026 05:48:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PToxx2YL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32CF10E0CF
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2026 05:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777960072; x=1809496072;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+wG3XnzNtaRcYmK9Z2iIBZrs/Wg4rNIESh9ul3eRA88=;
 b=PToxx2YLeGJxZIxIGDCltgzY4WR6FCMr4FF/pYsHUKfnI3bxVPQxHwZ6
 WJ9Bvqim1QtlrDdy4W0Tvcl7nru17VsO3MBmfS4bVtWaPEGzGvsf/gl/0
 dYQed4gNf8fH3hsJEhliHwjB1Kl358eSZwzAgL7f9T1JBlWa+LzZAzi+h
 3Yowm/y0d2lZ82bUdc1G3lbeiRStMU4mg/Mlk2d7Zu5Nuv482NLpolyGn
 jX7jecmFz1wSpMuWQHwbdL5hAtm+rw5Koqz5+5ILgAX/wcZcKf2/6tEJU
 nH0fmn2cCgZdqK2Sz4qITjTc+3/NyZk1O0kPCGvrGmk7Qbj4U2e2eYByp w==;
X-CSE-ConnectionGUID: t9RylcBTRLabLhJv2XIfCg==
X-CSE-MsgGUID: ZPMfR5tZSPeFmsEv2EJs1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="79013917"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="79013917"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 22:47:52 -0700
X-CSE-ConnectionGUID: u9svTN/6QPmrDjC5LZrVrw==
X-CSE-MsgGUID: 3Mag/7SiS+CW9uDl576G8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="232579926"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 22:47:50 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: shekhar.chauhan@intel.com, ashutosh.dixit@intel.com,
 gustavo.sousa@intel.com
Subject: [PATCH v4 1/2] lib/intel_wa: Add workaround check for a wa within
 debugfs file
Date: Tue,  5 May 2026 11:17:40 +0530
Message-ID: <20260505054741.486361-2-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505054741.486361-1-shekhar.chauhan@intel.com>
References: <20260505054741.486361-1-shekhar.chauhan@intel.com>
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

Add a check to see if a workaround exists in the debugfs file.

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

