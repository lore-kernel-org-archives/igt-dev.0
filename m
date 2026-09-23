Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC37C9830D
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 21:47:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E84110F20A;
	Wed, 23 Sep 2026 21:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aoxAEdWQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 652DD10F1E3
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 21:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790199714; x=1821735714;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=TdycROJLVBglduyUn34h6fITFS8Wd/z7M1dVgfjxrRE=;
 b=aoxAEdWQTLnCJePTPthPJgQybx3adAMReloo3fC/4c9+V7K65H00vmGb
 p+ICxh9vO3SoRr5PLvpxU/zQk/lRoZVDM8uBppDvJD1+zNcRNRCb8nA3H
 opVV+Fq9gNApFaaw2YiRQnq6QOGvDH3SBoG9u4hHMbrGF+LD4pnUzznyb
 eEBwyckWihzy6zoDmHvzOWzY/bnEUtY5Hpdh81pk6QyWycitv2pq6jt0m
 eD8/l4Iho8elIhMQQZWMvtk6T2doGvvwx6Y4sqvslQJij9n29jC7AATcQ
 AewQ6zwvDKl6FF3dOL8cppduhyZ1m6wtal7dbR2gZmScgpbVGFWsjGZ8J Q==;
X-CSE-ConnectionGUID: i7htL0akTIyPlHso/aRpuQ==
X-CSE-MsgGUID: mHTr9ZVyQNqw6PFqA/BqJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="93445406"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="93445406"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 14:41:54 -0700
X-CSE-ConnectionGUID: BNT2+hydQ5SQl2tBvTUyiw==
X-CSE-MsgGUID: KsQP67CjSkWyYnWAAoep/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="4907708"
Received: from inaky-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.113])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 14:41:47 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Wed, 23 Sep 2026 18:41:13 -0300
Subject: [PATCH i-g-t v2 06/11] lib/xe: Assert that cache is available for
 xe_wa()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-wa_14026539277-v2-6-528b575299d2@intel.com>
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

While we do print a warning if xe_wa() is called without the necessary
data cached in xe_device, it would make any test that relies on it to
be unreliable in that scenario.

Make sure that we cause the test to fail instead by adding an
igt_assert() to check that the wa_cache is not NULL.

Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 lib/xe/xe_wa.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/lib/xe/xe_wa.c b/lib/xe/xe_wa.c
index 05af64151e7c..5f09efd2373a 100644
--- a/lib/xe/xe_wa.c
+++ b/lib/xe/xe_wa.c
@@ -178,14 +178,12 @@ int xe_wa_test_debugfs_dump_has_wa(char *dump, const char *wa)
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
2.55.0

