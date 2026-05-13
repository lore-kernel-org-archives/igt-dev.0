Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E6ECD37B6
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 04:37:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F6110E2EA;
	Wed, 13 May 2026 04:37:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KFvWR/qH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1AC510E2EA
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 04:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778647001; x=1810183001;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MKLV/ObrgVtVLo1JzuAKHnYd5DVwIasvGJORIoVWlD4=;
 b=KFvWR/qHlPX+/CEh6S7qN42tlaWfm8PRIDjtqdS7ZET4FSqKrMW+Hy3V
 jUbCtrlrO+KE5PKwbGG6g72UCVp42WiuU37JOqP+q8J8LF7KpCvhzh837
 LnnngCubtxwjlBEC2SkBjpK+OHBicEuNI/jCvnAnpI6nqDukLve9rjNXx
 L1daElPOqbk0inWPamzk27O0mdobAfW5h+nfdP7Vc1CLFdLsOfVAxnuJc
 uhxBpOlHu6MNkVPfj4e9LvDY+xZJbSBCCl7byRQ8bO8Eo9uigh2rd6cVf
 OTj2YXy+d0raHaBRAGq0N+mwFQdV2RUP7LivUKmz7UaqkjvBqsOMsJzV2 w==;
X-CSE-ConnectionGUID: tR7y5FTAQxSUh6mc7Uu1fQ==
X-CSE-MsgGUID: scn20Ny2TNi2Mz86Pm1uHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="83180147"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="83180147"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 21:36:41 -0700
X-CSE-ConnectionGUID: gWFrWy/CSJC9gllxAO2gEA==
X-CSE-MsgGUID: kV9IhWP4RVSkSyRZzhdVww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="235301081"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 21:36:39 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: shekhar.chauhan@intel.com,
	ashutosh.dixit@intel.com
Subject: [PATCH v1 1/1] lib/intel_wa: Assert on error instead of returning -1
Date: Wed, 13 May 2026 10:06:27 +0530
Message-ID: <20260513043629.1533907-2-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260513043629.1533907-1-shekhar.chauhan@intel.com>
References: <20260513043629.1533907-1-shekhar.chauhan@intel.com>
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

Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 lib/intel_wa.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/lib/intel_wa.c b/lib/intel_wa.c
index 727dd6c98..5d50dcc28 100644
--- a/lib/intel_wa.c
+++ b/lib/intel_wa.c
@@ -7,6 +7,7 @@
 #include <stdint.h>
 #include <stdio.h>
 
+#include "igt_core.h"
 #include "igt_debugfs.h"
 #include "igt_sysfs.h"
 #include "intel_wa.h"
@@ -17,9 +18,6 @@ static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
 {
 	char *debugfs_dump;
 
-	if (!igt_debugfs_exists(drm_fd, debugfs_name, O_RDONLY))
-		return -1;
-
 	debugfs_dump = igt_sysfs_get(debugfs_fd, debugfs_name);
 	if (debugfs_dump) {
 		char *has_wa = strstr(debugfs_dump, wa);
@@ -38,7 +36,7 @@ static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
  * @drm_fd:	A drm file descriptor
  * @check_wa:	Workaround to be checked
  *
- * Returns:	0 if no WA, 1 if WA present, -1 on error
+ * Returns:	1 if WA present, 0 otherwise
  */
 int igt_has_intel_wa(int drm_fd, const char *check_wa)
 {
@@ -48,8 +46,7 @@ int igt_has_intel_wa(int drm_fd, const char *check_wa)
 	char name[256];
 
 	debugfs_fd = igt_debugfs_dir(drm_fd);
-	if (debugfs_fd == -1)
-		return -1;
+	igt_assert(debugfs_fd >= 0);
 
 	xe_for_each_gt(drm_fd, xe) {
 		sprintf(name, "gt%d/workarounds", xe);
@@ -58,7 +55,7 @@ int igt_has_intel_wa(int drm_fd, const char *check_wa)
 			break;
 	}
 
-	if (!ret)
+	if (!ret && igt_debugfs_exists(drm_fd, "workarounds", O_RDONLY))
 		ret = debugfs_file_has_wa(drm_fd, debugfs_fd, "workarounds", check_wa);
 
 	close(debugfs_fd);
-- 
2.53.0

