Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE613C4452B
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 19:02:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788CB10E3AA;
	Tue, 21 Jul 2026 19:02:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jBfQapXo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646A210E3AA
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 19:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784660438; x=1816196438;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=myxY7HyWxEigTeNX5r8BsRhfE5hT6qtq4cPuBBOsBPY=;
 b=jBfQapXotT5oeiBpDtGmECr3tJTaIAtmPCvdiBTGntrgGlmV3wlo3KOy
 fF8MHmN5PySD76whHKKN0JM8v0cbYwfF86SmG7g84Nn9+vxE+kBoenpWm
 gAqRLpB8boolhBEd8opvtefMx8VLYgUR0/81b0jJD0BdnFZPCs4vIU+FO
 vMptg7d+hojrnvN4Xv9nlGXvhxwvXVKKFyInezN0GINX2GKp2e8aXJJjT
 UZT68D9vSUhiNiaDzDzEPx5ls9ITW6nDHfh/m9U6swwxiwGZvRGU7CMeA
 EqGpNdZS0Z700vImH5vyhoCFEvlo+0OjgGhydgAyO1INwrsb2f2Btsd9K Q==;
X-CSE-ConnectionGUID: fnvwKTciTrW7dbNvdz017A==
X-CSE-MsgGUID: V03XZpNSTPuxFO+GQov24w==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="95637698"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="95637698"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 12:00:38 -0700
X-CSE-ConnectionGUID: SsdrCkkCSUi5riZRBqZRFA==
X-CSE-MsgGUID: wq4kuHPrSZqBJIVGVxhETQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="258516579"
Received: from rosenzwe-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.232])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 12:00:36 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Tue, 21 Jul 2026 15:59:58 -0300
Subject: [PATCH i-g-t 05/10] lib/xe: Return boolean from xe_wa()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-wa_14026539277-v1-5-0c147eeefefa@intel.com>
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
index 0f4d2edc0795..8c8f7156c21f 100644
--- a/lib/xe/xe_wa.c
+++ b/lib/xe/xe_wa.c
@@ -108,20 +108,21 @@ static bool debugfs_dump_has_wa(char *dump, const char *wa)
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
 	char **dumps = xe_device_get(fd)->wa_cache;
 
 	if (igt_warn_on(!dumps))
-		return -1;
+		return false;
 
 	for (char **dump = dumps; *dump; dump++)
 		if (debugfs_dump_has_wa(*dump, wa))
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
index fcf1d71a167f..bdaa7141004b 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2678,7 +2678,7 @@ test_non_zero_reason(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
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

