Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F99109022C
	for <igt-dev@archiver.kernel.org>; Thu, 19 Mar 2026 14:15:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8E110E8CD;
	Thu, 19 Mar 2026 14:15:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Twc8flB1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2263C10E911
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Mar 2026 14:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773929708; x=1805465708;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Wbz7kPQhKq6SzKKG//qwWFXyrXKxPGcgRrkPeXYqKYU=;
 b=Twc8flB1rdx4yMIRo1LcryqBNu7ROICOxHiG19sqhqVZ/T1lnG3uDiZo
 PTwpqtbB0h06OvryibiI5+8G25T/I/Oc6+EY4r9TNAs1A0TVt9r9ejLyF
 FIgRJspWXShyuxEltnzmiJ2TSXegKBrG6w7ocL9brQwukISSGpchYREA2
 svJVZRSBcup7XYC8h7JbWloRbVVjY1wtJfI0KJQhOtNB2NsLsX7BHm/oP
 u1ZdCPUMllt4oTLtXIM7oRDYXbS73wYWH0EsML5Ym57ZKOk70wrWcnNvv
 0EqvDmafsaQUmLlb38Vf6kTVz2YxsS35+VCTB+eFBe28dQ9sH35yd3pRS g==;
X-CSE-ConnectionGUID: cxIo0vEERZm1kd55AU0WnA==
X-CSE-MsgGUID: Zfz496zTSrax8DNFgjwqKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="85703661"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="85703661"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 07:15:07 -0700
X-CSE-ConnectionGUID: YtOm/CYOShaWO7UrncsfLA==
X-CSE-MsgGUID: FhtTfkaiR1ukcQst7JN5kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="227097796"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.175])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 07:15:06 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/kms_dp_aux_dev: Create basic subtest
Date: Thu, 19 Mar 2026 15:15:01 +0100
Message-ID: <20260319141501.33758-1-kamil.konieczny@linux.intel.com>
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

Create one basic subtest and also make proper resources cleanup
in igt_fixture. While at this also sort headers.

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/kms_dp_aux_dev.c | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/tests/kms_dp_aux_dev.c b/tests/kms_dp_aux_dev.c
index b09669a34..51c6ad164 100644
--- a/tests/kms_dp_aux_dev.c
+++ b/tests/kms_dp_aux_dev.c
@@ -32,16 +32,16 @@
 
 #include "config.h"
 
+#include <dirent.h>
+#include <fcntl.h>
 #include <sys/types.h>
 #include <sys/stat.h>
-#include <fcntl.h>
-#include <dirent.h>
 
 #include "igt.h"
 #include "igt_kms.h"
 
 /**
- * SUBTEST:
+ * SUBTEST: basic
  * Description: Test that /dev/drm_dp_aux reads work
  */
 
@@ -144,21 +144,31 @@ static bool test(int drm_fd, uint32_t connector_id)
 	return false;
 }
 
-int igt_simple_main()
+int igt_main()
 {
 	int valid_connectors = 0;
-	drmModeRes *res;
+	drmModeRes *res = NULL;
 	int drm_fd;
 
-	drm_fd = drm_open_driver_master(DRIVER_ANY);
+	igt_fixture() {
+		drm_fd = drm_open_driver_master(DRIVER_ANY);
 
-	res = drmModeGetResources(drm_fd);
-	igt_require(res);
+		res = drmModeGetResources(drm_fd);
+		igt_require(res);
+	}
 
-	for (int i = 0; i < res->count_connectors; i++)
-		valid_connectors += test(drm_fd, res->connectors[i]);
-	igt_require(valid_connectors);
+	igt_describe("Basic test for reading /dev/drm_dp_aux");
+	igt_subtest("basic") {
+		for (int i = 0; i < res->count_connectors; i++)
+			valid_connectors += test(drm_fd, res->connectors[i]);
 
-	drmModeFreeResources(res);
-	drm_close_driver(drm_fd);
+		igt_require(valid_connectors);
+	}
+
+	igt_fixture() {
+		if (res)
+			drmModeFreeResources(res);
+
+		drm_close_driver(drm_fd);
+	}
 }
-- 
2.53.0

