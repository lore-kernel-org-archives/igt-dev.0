Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F22C4451C
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 19:06:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF96D10E3BF;
	Tue, 21 Jul 2026 19:06:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SldRkq+d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CEE110EB2C
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 19:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784660440; x=1816196440;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=QWLQYoWWGY2lvLc/TurDYKFD9PKRGTRZHFYHPT0nDRk=;
 b=SldRkq+dNJIcpKcaWdpHqUWRkfeoG2tPuRBuIJhBYmLelGioVKa7RIaS
 B2gihjSvQkejYa0EiF67ADdU5E/b0ZyNUw/9byCteZN/WwwvPrHP7cQrC
 vxn/wtYS+1HcTABMBcPtz4roJYuH+olgJN6dXuhRjMmtKu6LbAnDxILWk
 Rt7ZlyQWmH/0Yp9mkxkYRR87KBVc7PIVSLppORHgDCMghqz9HIFTD3TqN
 ld6fefk9p3Qk0Br2o79eb5FsREp0C1CHjxDyr5dUXGx56xsC0nOEJzzPd
 CIYe/w1hse9k3kaa305ZrAhMrh9aUNcbSSjVH9QECPZ2K9kzuc7dI4X1h Q==;
X-CSE-ConnectionGUID: nwNBC6x0TrW+Q9e1VZBXoA==
X-CSE-MsgGUID: nQbNVKUpR1GfgYFydxzhaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="95637706"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="95637706"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 12:00:40 -0700
X-CSE-ConnectionGUID: EYMRQLJHSWSC9/Mf3BgqMw==
X-CSE-MsgGUID: DoSvl/lDRduqW8nPAC+PpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="258516597"
Received: from rosenzwe-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.232])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 12:00:38 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Tue, 21 Jul 2026 16:00:00 -0300
Subject: [PATCH i-g-t 07/10] lib/xe: Add xe_wa_from_cache()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-wa_14026539277-v1-7-0c147eeefefa@intel.com>
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

An upcoming change will need to check if a workaround is enabled
during the creation of the xe_device struct, i.e., during the
execution of xe_device_get().  It is not possible to call xe_wa() in
that context because the struct is not yet cached and xe_wa() calling
xe_device_get() will cause an infinite recursion.

Add the function xe_wa_from_cache() to allow checking for workarounds
in that specific scenario and make a note in the function's
documentation about its purpose.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 lib/xe/xe_wa.c | 34 ++++++++++++++++++++++++++++------
 lib/xe/xe_wa.h |  1 +
 2 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/lib/xe/xe_wa.c b/lib/xe/xe_wa.c
index 8c8f7156c21f..ac3dcf6ef1c1 100644
--- a/lib/xe/xe_wa.c
+++ b/lib/xe/xe_wa.c
@@ -105,19 +105,28 @@ static bool debugfs_dump_has_wa(char *dump, const char *wa)
 
 /**
  * xe_wa: Check if a workaround is enabled for the device.
- * @fd: A drm file descriptor.
+ * @xe_dev: Xe device where the cached data is stashed.
  * @wa: Name of the workaround to be checked.
  *
- * Return a boolean indicating whether the workaround is enabled.
- * On error, returns false and a warning is printed.
+ * This function is like xe_wa(), but it receives the "incomplete"
+ * (see next paragraph) xe_device struct directly instead of a drm
+ * file descriptor.
+ *
+ * This function is only expected to be used in specific paths during
+ * the initialization of a xe_device struct (i.e. during execution of
+ * xe_device_get()), where the workaround cache is ready
+ * (i.e. xe_wa_build_cache()), but the xe_device struct is not yet
+ * fully built and cached (which is a requirement for xe_wa()).
  */
-bool xe_wa(int fd, const char *wa)
+bool xe_wa_from_cache(struct xe_device *xe_dev, const char *wa)
 {
-	char **dumps = xe_device_get(fd)->wa_cache;
+	char **dumps;
 
-	if (igt_warn_on(!dumps))
+	if (igt_warn_on(!xe_dev->wa_cache))
 		return false;
 
+	dumps = xe_dev->wa_cache;
+
 	for (char **dump = dumps; *dump; dump++)
 		if (debugfs_dump_has_wa(*dump, wa))
 			return true;
@@ -125,6 +134,19 @@ bool xe_wa(int fd, const char *wa)
 	return false;
 }
 
+/**
+ * xe_wa: Check if a workaround is enabled for the device.
+ * @fd: A drm file descriptor.
+ * @wa: Name of the workaround to be checked.
+ *
+ * Return a boolean indicating whether the workaround is enabled.
+ * On error, returns false and a warning is printed.
+ */
+bool xe_wa(int fd, const char *wa)
+{
+	return xe_wa_from_cache(xe_device_get(fd), wa);
+}
+
 /**
  * xe_wa_build_cache: Build cached data for xe_wa().
  * @xe_dev: Xe device where the cache will be stashed.
diff --git a/lib/xe/xe_wa.h b/lib/xe/xe_wa.h
index aa1c50c0f9c9..2f141ae15016 100644
--- a/lib/xe/xe_wa.h
+++ b/lib/xe/xe_wa.h
@@ -14,5 +14,6 @@ bool xe_wa(int fd, const char *wa);
 
 void xe_wa_build_cache(struct xe_device *xe_dev);
 void xe_wa_free_cache(struct xe_device *xe_dev);
+bool xe_wa_from_cache(struct xe_device *xe_dev, const char *wa);
 
 #endif /* XE_WA_H */

-- 
2.55.0

