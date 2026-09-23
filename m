Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3585AC9830D
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 21:47:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7EB10E11F;
	Wed, 23 Sep 2026 21:47:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D1pImzDW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ACFD10F1DF
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 21:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790199714; x=1821735714;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=jiwIM6p8Z/D1TKBZv1i9ut9CaRPS+LsA1ItMG1Pozfs=;
 b=D1pImzDW/JPuJhRY4AP1OfvLIYatB3vlt+MITOh3IkZMbnDSSXAgyy0T
 Z6+qhSWkcTeQjo0fZ+RtUmLER3x+FyLMyua4X0mqMCDoD+DouhNBqiZ9H
 Hub5FkhnIw6gfwruQ+j02nQIBBXYQ2sSOb+pspp9tGMm98LFiXtJMOmBE
 Pn9Vqv9KsrtukSBruW38f24tSB5Vh6cj7HYRLx9AqVX7ZPDW6wYFK9sMg
 hfWbR1Ftvj5sV/alBTDzjjtHb/jz2davlO/Xfc8GP8fxE8aQTkTRainHL
 wArmhUwIyKGNtX9N7PVaHPJpKOkMdssnwOW46LpWs64+bQ+9Kxl5QjDM0 g==;
X-CSE-ConnectionGUID: Kr23p1YxSIugwujLmTSGXA==
X-CSE-MsgGUID: pV8R3lY5QQ+dL9IHy7KxVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="93445405"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="93445405"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 14:41:54 -0700
X-CSE-ConnectionGUID: rOnrBee2QlW3wWPut0FnPA==
X-CSE-MsgGUID: 93zzX9gfQXq1tfWWF39vLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="4907705"
Received: from inaky-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.113])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 14:41:45 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Wed, 23 Sep 2026 18:41:12 -0300
Subject: [PATCH i-g-t v2 05/11] lib/xe: Return boolean from xe_wa()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-wa_14026539277-v2-5-528b575299d2@intel.com>
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

The function xe_wa() will cause a warning to be printed when an error
condition is found.  Since the current users of xe_wa() do not check
for errors, let's just convert the function to return a boolean.

Checking for xe_wa(...) instead of xe_wa(...) > 0 feels more natural.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 lib/xe/xe_wa.c      | 11 ++++++-----
 lib/xe/xe_wa.h      |  4 +++-
 tests/intel/xe_oa.c |  2 +-
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/lib/xe/xe_wa.c b/lib/xe/xe_wa.c
index 59064219cd96..05af64151e7c 100644
--- a/lib/xe/xe_wa.c
+++ b/lib/xe/xe_wa.c
@@ -177,20 +177,21 @@ int xe_wa_test_debugfs_dump_has_wa(char *dump, const char *wa)
  * @fd: A drm file descriptor.
  * @wa: Name of the workaround to be checked.
  *
- * Returns 1 if enabled, 0 if disabled, -1 on error.
+ * Return a boolean indicating whether the workaround is enabled.
+ * On error, returns false and a warning is printed.
  */
-int xe_wa(int fd, const char *wa)
+bool xe_wa(int fd, const char *wa)
 {
 	struct xe_wa_cache *wa_cache = xe_device_get(fd)->wa_cache;
 
 	if (igt_warn_on(!wa_cache))
-		return -1;
+		return false;
 
 	for (int i = 0; i < wa_cache->num_dumps; i++)
 		if (debugfs_dump_has_wa(wa_cache->dumps[i], wa))
-			return 1;
+			return true;
 
-	return 0;
+	return false;
 }
 
 /**
diff --git a/lib/xe/xe_wa.h b/lib/xe/xe_wa.h
index f0a826553df8..aa1c50c0f9c9 100644
--- a/lib/xe/xe_wa.h
+++ b/lib/xe/xe_wa.h
@@ -6,9 +6,11 @@
 #ifndef XE_WA_H
 #define XE_WA_H
 
+#include <stdbool.h>
+
 struct xe_device;
 
-int xe_wa(int fd, const char *wa);
+bool xe_wa(int fd, const char *wa);
 
 void xe_wa_build_cache(struct xe_device *xe_dev);
 void xe_wa_free_cache(struct xe_device *xe_dev);
diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 9571c62c115e..8ce39e6c5064 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2585,7 +2585,7 @@ test_non_zero_reason(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
 	 * can result in buffer overflows.
 	 */
 	if (oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_MERT &&
-	    xe_wa(drm_fd, "14026633728") > 0) {
+	    xe_wa(drm_fd, "14026633728")) {
 		oa_exponent = max(oa_exponent, 8);
 		properties[9] = oa_exponent;
 	}

-- 
2.55.0

