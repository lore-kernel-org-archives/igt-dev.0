Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3353F606A31A
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 21:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kY2APuGK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA7C710E6F8;
	Fri, 23 Oct 2026 21:10:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D868410E2A8
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 21:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792789402; x=1824325402;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=A/nkgZlZrc+fVtocuOhMCeWIe0jyOll29VIV70nHgv8=;
 b=kY2APuGKQt82MaYF1n08Ctr6qmbFtw79Oia001IVbc3SKqWe4hH/UfOS
 5uPKbbSrL5Jx/8CorFTZrxZYVABzrw05V1voV59sGwi4kfrV2QfnlHK31
 l4gVflXHxcIszBoYdExFhrtSmVkq0G91LegY9OiiU9Hmrynft+b1Gh23G
 xSRV93f8r1Pj+AN6TRB/ZLv6sRoxhoLiR8vUq9cGwuUqHGWJHC91A7IPQ
 2Rjvuykx1m+/hpq70JiBXyhj5ErOJvmHMsFjIB0TndDtd0WCJnru1I40q
 VkmxaKmNYPWjXZH9PJSQq7t3zJt8+MKwE5bx04dCMgpUeCiL+YhFS0xW2 A==;
X-CSE-ConnectionGUID: z92L8CnPTemFZNV6fik4WA==
X-CSE-MsgGUID: VoC6WhYAS0y8VVD1T6yF2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1457470"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1457470"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 14:03:18 -0700
X-CSE-ConnectionGUID: SZs4xnkDQO+m+Q0t5u58jQ==
X-CSE-MsgGUID: 5SdqbBoiR4eY7WQ0AFqRQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="5585820"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 14:03:16 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 23 Oct 2026 18:02:43 -0300
Subject: [PATCH i-g-t v3 08/11] lib/xe: Add xe_wa_from_cache()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-wa_14026539277-v3-8-b8723ececb7f@intel.com>
References: <20261023-wa_14026539277-v3-0-b8723ececb7f@intel.com>
In-Reply-To: <20261023-wa_14026539277-v3-0-b8723ececb7f@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
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
index fc1d9e59e65e..ca65ea879f87 100644
--- a/lib/xe/xe_wa.c
+++ b/lib/xe/xe_wa.c
@@ -181,15 +181,23 @@ int xe_wa_test_debugfs_dump_has_wa(char *dump, const char *wa)
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
 
@@ -200,6 +208,18 @@ bool xe_wa(int fd, const char *wa)
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
2.56.0

