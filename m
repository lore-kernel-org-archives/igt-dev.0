Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CD6CD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 17:09:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB2010E292;
	Wed, 27 May 2026 17:08:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K/ZpRd43";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1550E10E292
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 17:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779901721; x=1811437721;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=t9mRDiahUbW1jQsoSTZhATx45fMZ620TdLHKn5wEE1s=;
 b=K/ZpRd43ft1/byDGPKenWrCI8ve2r9dBNIjVNQlLCnZr2Zfex8sUTewe
 PnaSo/vGHCpA0kHS1gYiuLtRZapdpW9G6pItLVYpUrqFomkAk2YQeNxMc
 wMD8kLZRP1gwynNfe/gcF71bUuyA7I89IOZCz9JGLeNz3RaivEL+atWEb
 kbVQsidaRthGEazqIPpHTEaRsqMF7GkD6H2jg1w/5ElrQSeQMjiTGzz4a
 SkmExDKxFzeJjW8g8NdvSlftKchZMwOqywNC2Pez2X6pLMmOC8ChiF0Zz
 /yuI0t6ycDSgbJXvJntbGbrKLUOpBvFW1Cp8se9u175o81esHjRr6Jk2Z A==;
X-CSE-ConnectionGUID: ImSj3BQ6SKyLbHUoYN6P6g==
X-CSE-MsgGUID: KpWzdvXWSk2swVtC011Ppw==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="92213836"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="92213836"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 10:08:40 -0700
X-CSE-ConnectionGUID: HvjyC1g4RL6HXQcAPosQzQ==
X-CSE-MsgGUID: KtKvnm4nTD2ayFlUercQbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="272636966"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 10:08:40 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: gustavo.sousa@intel.com,
	ngai-mint.kwan@intel.com
Subject: [PATCH i-g-t] Revert "lib/intel_wa: Assert on error instead of
 returning -1"
Date: Wed, 27 May 2026 10:08:27 -0700
Message-ID: <20260527170827.1963198-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
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

This reverts commit b360115af75ac702b4f776aa3db0ac8a2a620657.

There are cases (e.g. igt@core_setmaster@master-drop-set-user) which drop
root before accessing debugfs, where we don't want to assert.

Also fix the igt_has_intel_wa() call in tests/intel/xe_oa.c.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/intel_wa.c      | 19 ++++++++++---------
 lib/intel_wa.h      |  2 +-
 tests/intel/xe_oa.c |  2 +-
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/lib/intel_wa.c b/lib/intel_wa.c
index a16ea62a4c..727dd6c988 100644
--- a/lib/intel_wa.c
+++ b/lib/intel_wa.c
@@ -7,18 +7,18 @@
 #include <stdint.h>
 #include <stdio.h>
 
-#include "igt_core.h"
 #include "igt_debugfs.h"
 #include "igt_sysfs.h"
 #include "intel_wa.h"
 #include "xe/xe_query.h"
 
-static bool debugfs_file_has_wa(int drm_fd, int debugfs_fd,
+static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
 			       const char *debugfs_name, const char *wa)
 {
 	char *debugfs_dump;
 
-	igt_assert(igt_debugfs_exists(drm_fd, debugfs_name, O_RDONLY));
+	if (!igt_debugfs_exists(drm_fd, debugfs_name, O_RDONLY))
+		return -1;
 
 	debugfs_dump = igt_sysfs_get(debugfs_fd, debugfs_name);
 	if (debugfs_dump) {
@@ -27,10 +27,10 @@ static bool debugfs_file_has_wa(int drm_fd, int debugfs_fd,
 		free(debugfs_dump);
 
 		if (has_wa)
-			return true;
+			return 1;
 	}
 
-	return false;
+	return 0;
 }
 
 /**
@@ -38,17 +38,18 @@ static bool debugfs_file_has_wa(int drm_fd, int debugfs_fd,
  * @drm_fd:	A drm file descriptor
  * @check_wa:	Workaround to be checked
  *
- * Returns:	true if WA present, false otherwise
+ * Returns:	0 if no WA, 1 if WA present, -1 on error
  */
-bool igt_has_intel_wa(int drm_fd, const char *check_wa)
+int igt_has_intel_wa(int drm_fd, const char *check_wa)
 {
-	bool ret = false;
+	int ret = 0;
 	int debugfs_fd;
 	unsigned int xe;
 	char name[256];
 
 	debugfs_fd = igt_debugfs_dir(drm_fd);
-	igt_assert(debugfs_fd >= 0);
+	if (debugfs_fd == -1)
+		return -1;
 
 	xe_for_each_gt(drm_fd, xe) {
 		sprintf(name, "gt%d/workarounds", xe);
diff --git a/lib/intel_wa.h b/lib/intel_wa.h
index 34cafecc41..765a5948ef 100644
--- a/lib/intel_wa.h
+++ b/lib/intel_wa.h
@@ -6,6 +6,6 @@
 #ifndef __INTEL_WA_H__
 #define __INTEL_WA_H__
 
-bool igt_has_intel_wa(int drm_fd, const char *check_wa);
+int igt_has_intel_wa(int drm_fd, const char *check_wa);
 
 #endif /* __INTEL_WA_H__ */
diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 56d818d860..e59fe953b0 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2678,7 +2678,7 @@ test_non_zero_reason(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
 	 * can result in buffer overflows.
 	 */
 	if (oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_MERT &&
-		igt_has_intel_wa(drm_fd, "14026633728")) {
+		igt_has_intel_wa(drm_fd, "14026633728") > 0) {
 		oa_exponent = max(oa_exponent, 8);
 		properties[9] = oa_exponent;
 	}
-- 
2.54.0

