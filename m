Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C82CD4F39
	for <igt-dev@archiver.kernel.org>; Thu, 14 May 2026 06:37:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB1B410E366;
	Thu, 14 May 2026 06:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J9IDIEij";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B4910E183
 for <igt-dev@lists.freedesktop.org>; Thu, 14 May 2026 06:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778740623; x=1810276623;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ukh5REerHeUolkqXqlnCpgV1+ycVVR2ZSoiQUGEtCqo=;
 b=J9IDIEijaLURKakHLiRi6Bc3oDSn5034rgvZF/YD2E96ABr+9NNiDokx
 AVLlmr8CwgOKhgGe1cTtA1Vvep2IS/UsQRpVsDO5vvHzHXBukvib0+/6S
 GeBWX9E9Jdi4eXXuQWbSHOBgggZtcMAbuvyuo4vuUtWuIxI8dHSi/kcwU
 iLPKd3jWVhbl0YEAgxrlmIXIeLtEa5H8f0T4uyAPQWhr4ynRiWNea7ubU
 uv89YhWh4ti060bxKQEjjChkugZnLBj01ZY+KxngRnZNkVb58gni6dh3n
 EGTC9uzFsfIXQQtRGTg2Clu3kzt6H1WLhTDjsaz5BhEnN8KqlPbhu3EUs A==;
X-CSE-ConnectionGUID: JcgyHOezRDas/9mMqxLISg==
X-CSE-MsgGUID: F4WvqXrxR0SrKfOIC3kpqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79535696"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="79535696"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 23:37:02 -0700
X-CSE-ConnectionGUID: PAsET5HmQDGCyzf4Bg+Hyw==
X-CSE-MsgGUID: Jv9XMgVwTcylfNOAHVCaXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="238191692"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 23:37:01 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: shekhar.chauhan@intel.com,
	ashutosh.dixit@intel.com
Subject: [PATCH v2] lib/intel_wa: Assert on error instead of returning -1
Date: Thu, 14 May 2026 12:06:55 +0530
Message-ID: <20260514063655.1683322-1-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.53.0
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

igt_has_intel_wa() returns 0, 1, or -1, but there is no point
distinguishing the error and no-workaround cases for callers. Replace
the error return with igt_assert() and simplify debugfs_file_has_wa() by
dropping the igt_debugfs_exists() check, since igt_sysfs_get() returns
NULL for missing files anyway.

v2: Make the func as bool instead of int.

Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 lib/intel_wa.c | 19 +++++++++----------
 lib/intel_wa.h |  2 +-
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/lib/intel_wa.c b/lib/intel_wa.c
index 727dd6c98..e4fe7b0ee 100644
--- a/lib/intel_wa.c
+++ b/lib/intel_wa.c
@@ -7,18 +7,18 @@
 #include <stdint.h>
 #include <stdio.h>
 
+#include "igt_core.h"
 #include "igt_debugfs.h"
 #include "igt_sysfs.h"
 #include "intel_wa.h"
 #include "xe/xe_query.h"
 
-static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
+static bool debugfs_file_has_wa(int drm_fd, int debugfs_fd,
 			       const char *debugfs_name, const char *wa)
 {
 	char *debugfs_dump;
 
-	if (!igt_debugfs_exists(drm_fd, debugfs_name, O_RDONLY))
-		return -1;
+	igt_assert(igt_debugfs_exists(drm_fd, debugfs_name, O_RDONLY));
 
 	debugfs_dump = igt_sysfs_get(debugfs_fd, debugfs_name);
 	if (debugfs_dump) {
@@ -27,10 +27,10 @@ static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
 		free(debugfs_dump);
 
 		if (has_wa)
-			return 1;
+			return true;
 	}
 
-	return 0;
+	return false;
 }
 
 /**
@@ -38,18 +38,17 @@ static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
  * @drm_fd:	A drm file descriptor
  * @check_wa:	Workaround to be checked
  *
- * Returns:	0 if no WA, 1 if WA present, -1 on error
+ * Returns:	true if WA present, false otherwise
  */
-int igt_has_intel_wa(int drm_fd, const char *check_wa)
+bool igt_has_intel_wa(int drm_fd, const char *check_wa)
 {
-	int ret = 0;
+	bool ret = 0;
 	int debugfs_fd;
 	unsigned int xe;
 	char name[256];
 
 	debugfs_fd = igt_debugfs_dir(drm_fd);
-	if (debugfs_fd == -1)
-		return -1;
+	igt_assert(debugfs_fd >= 0);
 
 	xe_for_each_gt(drm_fd, xe) {
 		sprintf(name, "gt%d/workarounds", xe);
diff --git a/lib/intel_wa.h b/lib/intel_wa.h
index 765a5948e..34cafecc4 100644
--- a/lib/intel_wa.h
+++ b/lib/intel_wa.h
@@ -6,6 +6,6 @@
 #ifndef __INTEL_WA_H__
 #define __INTEL_WA_H__
 
-int igt_has_intel_wa(int drm_fd, const char *check_wa);
+bool igt_has_intel_wa(int drm_fd, const char *check_wa);
 
 #endif /* __INTEL_WA_H__ */
-- 
2.53.0

