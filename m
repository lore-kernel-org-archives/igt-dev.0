Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7269C98304
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 21:46:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A8D10F1E3;
	Wed, 23 Sep 2026 21:46:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GhjiBSWj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E1F10F1DE
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 21:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790199714; x=1821735714;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=jn4/xHBK+w0aGeeqY04pSxheX9rrVGqCtTMAYyEBbpI=;
 b=GhjiBSWjghcoelcKrMjr5biuQE0k5TbI13doWQSDoZyauNfJNPaVfI/0
 9lUGYQXhUBpAa2Z7ak8xzh0dhWh7pGT4Qx3MTajbfbYHVp5wwUEfVnspP
 lFK+LGraMHOKFC0MhWWGFo/t2l42NIIXS4Lojy7ObMCy0tQcbwrDWepeU
 2zTCFg3CP6WyeLXtz7gOyOmTbFwiPlbCnmyXFtrILh630MzBUEmRT4oFG
 Boy2ReLw32iA+AlTVzIAveo+hVDv+1lq6/YMSVVdVYoKbasS+zJ0ogzYY
 ECIeYEoFwsaRTCgU8LxYp9JXhj2vuBLHeLl70nOAM1AYbh0zsLFHGp7Dz Q==;
X-CSE-ConnectionGUID: WdDg/xpRSF+BooMX0zbaig==
X-CSE-MsgGUID: xeQ9w/SNQeCPtmaDTYjFvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="93445402"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="93445402"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 14:41:53 -0700
X-CSE-ConnectionGUID: G1BtfMIeQ+erfs6CW5rPpw==
X-CSE-MsgGUID: c7vlMxMWT4m/8ccY5ck+iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="4907693"
Received: from inaky-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.113])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 14:41:43 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Wed, 23 Sep 2026 18:41:10 -0300
Subject: [PATCH i-g-t v2 03/11] lib/xe: Gather workarounds debugfs dumps in
 a cache struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-wa_14026539277-v2-3-528b575299d2@intel.com>
References: <20260923-wa_14026539277-v2-0-528b575299d2@intel.com>
In-Reply-To: <20260923-wa_14026539277-v2-0-528b575299d2@intel.com>
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
dumps of workaround debugfs files into a cache struct.  Such a cache
will be kept attached to xe_device as a follow-up.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 lib/xe/xe_wa.c | 140 +++++++++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 106 insertions(+), 34 deletions(-)

diff --git a/lib/xe/xe_wa.c b/lib/xe/xe_wa.c
index c0c97e244564..93b97c7c1476 100644
--- a/lib/xe/xe_wa.c
+++ b/lib/xe/xe_wa.c
@@ -8,6 +8,7 @@
 #include <stdint.h>
 #include <stdio.h>
 
+#include "igt_core.h"
 #include "igt_debugfs.h"
 #include "igt_sysfs.h"
 
@@ -16,6 +17,101 @@
 
 #include "tests/xe_wa.h"
 
+struct xe_wa_cache {
+	int num_dumps;
+	char *dumps[];
+};
+
+static void free_wa_debugfs_dumps(struct xe_wa_cache *wa_cache)
+{
+	for (int i = 0; i < wa_cache->num_dumps && wa_cache->dumps[i]; i++) {
+		free(wa_cache->dumps[i]);
+		wa_cache->dumps[i] = NULL;
+	}
+}
+
+static int get_wa_debugfs_count(int fd)
+{
+	int gt;
+	int count = 1; /* Device workarounds */
+
+	xe_for_each_gt(fd, gt)
+		count++;
+
+	return count;
+}
+
+static int get_wa_debugfs_dumps(int fd, struct xe_wa_cache *wa_cache)
+{
+	int gt;
+	int debugfs_fd;
+	int count;
+	int ret = 0;
+
+	debugfs_fd = igt_debugfs_dir(fd);
+	if (debugfs_fd == -1)
+		goto err;
+
+	count = 0;
+
+	if (!(wa_cache->dumps[count++] = igt_sysfs_get(debugfs_fd, "workarounds")))
+		goto err;
+
+	xe_for_each_gt(fd, gt) {
+		char name[32];
+
+		snprintf(name, sizeof(name), "gt%d/workarounds", gt);
+
+		if (!(wa_cache->dumps[count++] = igt_sysfs_get(debugfs_fd, name)))
+			goto err;
+	}
+
+	if (igt_warn_on(count != wa_cache->num_dumps))
+		goto err;
+
+	goto out;
+
+err:
+	free_wa_debugfs_dumps(wa_cache);
+	ret = 1;
+
+out:
+	close(debugfs_fd);
+
+	return ret;
+}
+
+static void free_cache(struct xe_wa_cache *wa_cache)
+{
+	if (!wa_cache)
+		return;
+
+	free_wa_debugfs_dumps(wa_cache);
+	free(wa_cache);
+}
+
+static struct xe_wa_cache *build_cache(int fd)
+{
+	struct xe_wa_cache *wa_cache;
+	int num_dumps;
+
+	num_dumps = get_wa_debugfs_count(fd);
+	wa_cache = calloc(1, sizeof(*wa_cache) + num_dumps * sizeof(wa_cache->dumps[0]));
+
+	if (igt_warn_on(!wa_cache))
+		return NULL;
+
+	wa_cache->num_dumps = num_dumps;
+
+	if (igt_warn_on(get_wa_debugfs_dumps(fd, wa_cache))) {
+		free_cache(wa_cache);
+
+		return NULL;
+	}
+
+	return wa_cache;
+}
+
 static int debugfs_dump_has_wa(char *dump, const char *wa)
 {
 	size_t wa_len;
@@ -76,27 +172,6 @@ int xe_wa_test_debugfs_dump_has_wa(char *dump, const char *wa)
 	return debugfs_dump_has_wa(dump, wa);
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
-		int ret = debugfs_dump_has_wa(debugfs_dump, wa);
-
-		free(debugfs_dump);
-
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
 /**
  * xe_wa: Check if a workaround is enabled for the device.
  * @fd: A drm file descriptor.
@@ -106,25 +181,22 @@ static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
  */
 int xe_wa(int fd, const char *wa)
 {
-	int ret = 0;
-	int debugfs_fd;
-	unsigned int xe;
-	char name[256];
+	struct xe_wa_cache *wa_cache = build_cache(fd);
+	int ret;
 
-	debugfs_fd = igt_debugfs_dir(fd);
-	if (debugfs_fd == -1)
+	if (igt_warn_on(!wa_cache))
 		return -1;
 
-	xe_for_each_gt(fd, xe) {
-		sprintf(name, "gt%d/workarounds", xe);
-		ret = debugfs_file_has_wa(fd, debugfs_fd, name, wa);
-		if (ret)
+	ret = 0;
+
+	for (int i = 0; i < wa_cache->num_dumps; i++) {
+		if (debugfs_dump_has_wa(wa_cache->dumps[i], wa)) {
+			ret = 1;
 			break;
+		}
 	}
 
-	if (!ret)
-		ret = debugfs_file_has_wa(fd, debugfs_fd, "workarounds", wa);
+	free_cache(wa_cache);
 
-	close(debugfs_fd);
 	return ret;
 }

-- 
2.55.0

