Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99554606A31A
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 21:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IsYOyO00
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489B510E11E;
	Fri, 23 Oct 2026 21:08:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE9FB10E54B
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 21:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792789397; x=1824325397;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=mkGbyxsNEBeydZPP1pUmnxCZxQdG0gS8gYIFjx3GTgk=;
 b=IsYOyO00ZOVOcmt1+cFa9l21aLB8mSwUHSSBzuqDGkKOHVLlArcWpNt2
 X10wM0f557WpwpYYg++Jx5Lr4VtidjVaa2o8gXCxYlPrOMI23Rf710jNj
 bQFGBoF8fT9lKIRJ2Y2CN9iKM5uQtDMwPR3YyjDH8snePTSJRmDJtCBjf
 bHmwku3fnqaaQrEyEcVJIzlZUYt1kmeXNa07cEqMps4hK9qDNDu5RZZwm
 XQnjJGO+GiNQXevTceJWscSKuJOajNqr3U1qF7tnrnQSKONslo4RPUr53
 3MZKxAFu5tMFjJ4Pk8cUlF6mEWIYVIN4pE7O9JGER/W4uGkrUSmKBrsE3 A==;
X-CSE-ConnectionGUID: Y0PtFObWSDesia0EWBbXLg==
X-CSE-MsgGUID: Kqtp3IYjRAqwiX/L+9z81Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1457465"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1457465"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 14:03:13 -0700
X-CSE-ConnectionGUID: 2+m1szaPQ7i7u4YMlhjjdQ==
X-CSE-MsgGUID: Th8OqpFLRNmwafn9osP7Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="5585799"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 14:03:12 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 23 Oct 2026 18:02:40 -0300
Subject: [PATCH i-g-t v3 05/11] lib/xe: Return boolean from xe_wa()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-wa_14026539277-v3-5-b8723ececb7f@intel.com>
References: <20261023-wa_14026539277-v3-0-b8723ececb7f@intel.com>
In-Reply-To: <20261023-wa_14026539277-v3-0-b8723ececb7f@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Atwood <matthew.s.atwood@intel.com>
X-Mailer: b4 0.15-dev
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The function xe_wa() will cause a warning to be printed when an error
condition is found.  Since the current users of xe_wa() do not check
for errors, let's just convert the function to return a boolean.

Checking for xe_wa(...) instead of xe_wa(...) > 0 feels more natural.

Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 lib/xe/xe_wa.c      | 11 ++++++-----
 lib/xe/xe_wa.h      |  4 +++-
 tests/intel/xe_oa.c |  2 +-
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/lib/xe/xe_wa.c b/lib/xe/xe_wa.c
index d133532c01cb..2f1a90a3b0b0 100644
--- a/lib/xe/xe_wa.c
+++ b/lib/xe/xe_wa.c
@@ -185,20 +185,21 @@ int xe_wa_test_debugfs_dump_has_wa(char *dump, const char *wa)
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
index 66e0e1ab65df..91d0ad9c4023 100644
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
2.56.0

