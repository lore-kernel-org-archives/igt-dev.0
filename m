Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E97606A31B
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 21:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W+tSMHOP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B0AD10E6E8;
	Fri, 23 Oct 2026 21:12:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86CE210E5F1
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 21:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792789399; x=1824325399;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=xun5C4Dv0NgBQRlq3ATfefBOHDBr/OMoJd/tPzVuvBE=;
 b=W+tSMHOPDgCi5qDJNTU2c6lQiEq3ppEGzJdwmwcZVZrOqPbvVHkR7JJy
 z5lC/dVktxDcTsVfWT66Iggq1T8otAiBiR+n11t/94HVt3pRp8kG8hNfM
 vNditNlYJYc4JV/Kf/y6isPRF1+4fanOL7PkjPOfqeIj0okCi+LJ2R+WY
 CPz2LwyGAZOlchDxaD4EclDawxxLYygu7T827PQO2wy+QBoXqbrIhrsnB
 52fWBFT9As+OvBllbsfYLDtyY7W6awutU5FMKu7pHnibtK6dLDz3GQ6kC
 phSi6xRHTJC4yzby1D8mhydeZlBhE6bRFwBGUMxovpO9XFiQmnBlnFqnY g==;
X-CSE-ConnectionGUID: PozA4PpDTLKbuQBCGXu6gg==
X-CSE-MsgGUID: rpiDI3v/QjKOA3oa4n7y/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1457467"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1457467"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 14:03:15 -0700
X-CSE-ConnectionGUID: WE8+WQeASx2/wwRcjrXIMQ==
X-CSE-MsgGUID: 1k8qI61iSdWFbclgDJkvMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="5585805"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 14:03:14 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 23 Oct 2026 18:02:41 -0300
Subject: [PATCH i-g-t v3 06/11] lib/xe: Assert that cache is available for
 xe_wa()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-wa_14026539277-v3-6-b8723ececb7f@intel.com>
References: <20261023-wa_14026539277-v3-0-b8723ececb7f@intel.com>
In-Reply-To: <20261023-wa_14026539277-v3-0-b8723ececb7f@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>, 
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

While we do print a warning if xe_wa() is called without the necessary
data cached in xe_device, it would make any test that relies on it to
be unreliable in that scenario.

Make sure that we cause the test to fail instead by adding an
igt_assert() to check that the wa_cache is not NULL.

Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 lib/xe/xe_wa.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/lib/xe/xe_wa.c b/lib/xe/xe_wa.c
index 2f1a90a3b0b0..fc1d9e59e65e 100644
--- a/lib/xe/xe_wa.c
+++ b/lib/xe/xe_wa.c
@@ -186,14 +186,12 @@ int xe_wa_test_debugfs_dump_has_wa(char *dump, const char *wa)
  * @wa: Name of the workaround to be checked.
  *
  * Return a boolean indicating whether the workaround is enabled.
- * On error, returns false and a warning is printed.
  */
 bool xe_wa(int fd, const char *wa)
 {
 	struct xe_wa_cache *wa_cache = xe_device_get(fd)->wa_cache;
 
-	if (igt_warn_on(!wa_cache))
-		return false;
+	igt_assert(wa_cache);
 
 	for (int i = 0; i < wa_cache->num_dumps; i++)
 		if (debugfs_dump_has_wa(wa_cache->dumps[i], wa))

-- 
2.56.0

