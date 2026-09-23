Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9F3C98304
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 21:50:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F373210E4C9;
	Wed, 23 Sep 2026 21:50:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J3OkvAlD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 045C410F1DE
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 21:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790199715; x=1821735715;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=bZiydxo7T9p6T/NlLMlcQV2hUGAY7N12AyVVroUigqs=;
 b=J3OkvAlDBgXiJTrL0iS7T3p625bPnN/QEZtDSLiGGnAYRGotzJgS7W9R
 mnt2lY/E/4J5Ch5NkI9DaVnhpEefG5swkACi47U6msj55TuLuu/vw+ct6
 AusfFP1ZOOChg15LpvK+uzRM/U205jJlUg0fKgks+jJ39bGwZQyah5ugl
 9GJb5cBvjkKyU5G1A2WLXuwFTKVXKtZoNRu12O0vuOPxHJwTHt87W3DqY
 QROt66TGIhnt9iXWdgNkkoio2rELIPido4ZBFYk2cSoUumb5qB+EhR7th
 cgS05nJ5FSSySz386j4BqSLer5xKjXSFkm6M3WmpLIIO/GU2a63o2Rm+C A==;
X-CSE-ConnectionGUID: 3GpYi6cLTze2ngjUdha2sw==
X-CSE-MsgGUID: /VAQst42QYmgcpiKBdncEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="93445412"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="93445412"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 14:41:55 -0700
X-CSE-ConnectionGUID: 2j13kEzDQ8eyDDvahmIS3A==
X-CSE-MsgGUID: uGEKz/vbQRyMUmRg1ZFHbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="4907720"
Received: from inaky-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.113])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 14:41:49 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Wed, 23 Sep 2026 18:41:15 -0300
Subject: [PATCH i-g-t v2 08/11] lib/xe: Add xe_wa_from_cache()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-wa_14026539277-v2-8-528b575299d2@intel.com>
References: <20260923-wa_14026539277-v2-0-528b575299d2@intel.com>
In-Reply-To: <20260923-wa_14026539277-v2-0-528b575299d2@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
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

v2:
  - Use correct function name in documentation for xe_wa_from_cache(). (Matt)

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 lib/xe/xe_wa.c | 30 +++++++++++++++++++++++++-----
 lib/xe/xe_wa.h |  1 +
 2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/lib/xe/xe_wa.c b/lib/xe/xe_wa.c
index 5f09efd2373a..64ea04e666c6 100644
--- a/lib/xe/xe_wa.c
+++ b/lib/xe/xe_wa.c
@@ -173,15 +173,23 @@ int xe_wa_test_debugfs_dump_has_wa(char *dump, const char *wa)
 }
 
 /**
- * xe_wa: Check if a workaround is enabled for the device.
- * @fd: A drm file descriptor.
+ * xe_wa_from_cache: Check if a workaround is enabled for the device.
+ * @xe_dev: Xe device where the cached data is stashed.
  * @wa: Name of the workaround to be checked.
  *
- * Return a boolean indicating whether the workaround is enabled.
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
-	struct xe_wa_cache *wa_cache = xe_device_get(fd)->wa_cache;
+	struct xe_wa_cache *wa_cache = xe_dev->wa_cache;
 
 	igt_assert(wa_cache);
 
@@ -192,6 +200,18 @@ bool xe_wa(int fd, const char *wa)
 	return false;
 }
 
+/**
+ * xe_wa: Check if a workaround is enabled for the device.
+ * @fd: A drm file descriptor.
+ * @wa: Name of the workaround to be checked.
+ *
+ * Return a boolean indicating whether the workaround is enabled.
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

