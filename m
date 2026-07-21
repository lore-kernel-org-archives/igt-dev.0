Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDEBC4452B
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 19:03:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D0C10E3BF;
	Tue, 21 Jul 2026 19:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LY2IjOYw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D9F110E3BF
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 19:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784660436; x=1816196436;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=H7Mon50omSiIFAMGZdfg3JCL3Fo5InAt1acarKuLko8=;
 b=LY2IjOYwlN8UxrzWknDEgdibh6um/1XLnCxTIWiX0GzbczhaXvpZRQRC
 0fC4jRGRqAExDHnzJN3UcN9mBgsEa4KFQB4dOIlmaQK3xcYsmM1RS0lOz
 FgcfLDtajvHa+Av0oTLsooAEbFARC//SLqeohguAYkcnfEU6sRCEsF5Vb
 rU4/wTg7DVLR0THmyulsq1/u25YG/2RRxHsfkA9snLcmU5Fte9rNotwTC
 3nY9nNQ6EXDbacfHFRiUg7nvMk2Dr1G5z4wAuR9TOnI5S+0KYtnuRljKl
 hr94fItDVNHARJoCCIEEL6sZmjN9EEEY41euH/bWifQFS1ptzHFuRjuL3 Q==;
X-CSE-ConnectionGUID: jR2bc0DOQumCz2UwUrojpA==
X-CSE-MsgGUID: Fr7uptGcS7GE81PecSu/eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="95637694"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="95637694"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 12:00:36 -0700
X-CSE-ConnectionGUID: Vt/yOvQKRlutojnwwqv3vg==
X-CSE-MsgGUID: c+q03EQqToOFUzKRs9GCpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="258516568"
Received: from rosenzwe-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.232])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 12:00:34 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Tue, 21 Jul 2026 15:59:56 -0300
Subject: [PATCH i-g-t 03/10] lib/xe: Gather workarounds debugfs dumps
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-wa_14026539277-v1-3-0c147eeefefa@intel.com>
References: <20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com>
In-Reply-To: <20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

In an upcoming change, we will cache workaround information in struct
xe_device.  As a preparation for that, add the logic to gather the
dumps of workaround debugfs files into a single array, which will be
used as the cached information in the future.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 lib/xe/xe_wa.c | 92 ++++++++++++++++++++++++++++++++++++----------------------
 1 file changed, 58 insertions(+), 34 deletions(-)

diff --git a/lib/xe/xe_wa.c b/lib/xe/xe_wa.c
index d44431e7e61f..e4e1b0bb7972 100644
--- a/lib/xe/xe_wa.c
+++ b/lib/xe/xe_wa.c
@@ -7,12 +7,65 @@
 #include <stdint.h>
 #include <stdio.h>
 
+#include "igt_core.h"
 #include "igt_debugfs.h"
 #include "igt_sysfs.h"
 
 #include "xe/xe_wa.h"
 #include "xe/xe_query.h"
 
+static void free_wa_debugfs_dumps(char **dumps)
+{
+	for (char **dump = dumps; *dump; dump++)
+		free(*dump);
+
+	free(dumps);
+}
+
+static char **get_wa_debugfs_dumps(int fd)
+{
+	char **dumps;
+	int gt;
+	int debugfs_fd;
+	int count = 1; /* Device workarounds */
+
+	xe_for_each_gt(fd, gt)
+		count++;
+
+	dumps = calloc(count + 1, sizeof(*dumps));
+	if (!dumps)
+		return NULL;
+
+	debugfs_fd = igt_debugfs_dir(fd);
+	if (debugfs_fd == -1)
+		goto err;
+
+	count = 0;
+
+	if (!(dumps[count++] = igt_sysfs_get(debugfs_fd, "workarounds")))
+		goto err;
+
+	xe_for_each_gt(fd, gt) {
+		char name[32];
+
+		snprintf(name, sizeof(name), "gt%d/workarounds", gt);
+
+		if (!(dumps[count++] = igt_sysfs_get(debugfs_fd, name)))
+			goto err;
+	}
+
+	goto out;
+
+err:
+	free_wa_debugfs_dumps(dumps);
+	dumps = NULL;
+
+out:
+	close(debugfs_fd);
+
+	return dumps;
+}
+
 static bool debugfs_dump_has_wa(char *dump, const char *wa)
 {
 	char *a = dump;
@@ -50,27 +103,6 @@ static bool debugfs_dump_has_wa(char *dump, const char *wa)
 	return false;
 }
 
-static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
-			       const char *debugfs_name, const char *wa)
-{
-	char *debugfs_dump;
-
-	if (!igt_debugfs_exists(drm_fd, debugfs_name, O_RDONLY))
-		return -1;
-
-	debugfs_dump = igt_sysfs_get(debugfs_fd, debugfs_name);
-	if (debugfs_dump) {
-		bool has_wa = debugfs_dump_has_wa(debugfs_dump, wa);
-
-		free(debugfs_dump);
-
-		if (has_wa)
-			return 1;
-	}
-
-	return 0;
-}
-
 /**
  * xe_wa: Check if a workaround is enabled for the device.
  * @fd: A drm file descriptor.
@@ -80,25 +112,17 @@ static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
  */
 int xe_wa(int fd, const char *wa)
 {
+	char **dumps = get_wa_debugfs_dumps(fd);
 	int ret = 0;
-	int debugfs_fd;
-	unsigned int xe;
-	char name[256];
 
-	debugfs_fd = igt_debugfs_dir(fd);
-	if (debugfs_fd == -1)
+	if (igt_warn_on(!dumps))
 		return -1;
 
-	xe_for_each_gt(fd, xe) {
-		sprintf(name, "gt%d/workarounds", xe);
-		ret = debugfs_file_has_wa(fd, debugfs_fd, name, wa);
-		if (ret)
+	for (char **dump = dumps; *dump; dump++)
+		if ((ret = debugfs_dump_has_wa(*dump, wa)))
 			break;
-	}
 
-	if (!ret)
-		ret = debugfs_file_has_wa(fd, debugfs_fd, "workarounds", wa);
+	free_wa_debugfs_dumps(dumps);
 
-	close(debugfs_fd);
 	return ret;
 }

-- 
2.55.0

