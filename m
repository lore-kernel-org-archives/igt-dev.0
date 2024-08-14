Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31035C52D7F
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 21:47:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E14BF10E1EE;
	Wed, 14 Aug 2024 21:47:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U4hHw53j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40AD10E1EE
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2024 21:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723672034; x=1755208034;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CZ/LoEx9msVKeBVv6eRYUETTsZzeSVXOjadXLoSI2dI=;
 b=U4hHw53jCTLv/jw+SeGYObIsXd5lqfUPnOYu1u7MSJsBAJSFV2Po55LD
 hEhW5Ty9LFkWLRH4CVT/BNJhTxUve+9kV88DxJwMR+xQpQxZWdktLRaqO
 aN+u2ibV36F0ilgmBvjNnsg/vkAx6etvN9W0jTPpZCQPa5DdgDoeskiu7
 ggdjl9IVd+q/lxLjWVd1pM7QdoqokAltVKj7Sjm5uqMdqukQkrke1/As/
 OifPTn0AOAn3+V+dOHP1JrEBMG5hB3MZp5iry0lJbNjLU+6cert0zOEvY
 1/x+oEVCE+r77csGaSUacAyVooPC3CzlaZgTO4+l+qpF8pBgqVOHz8Ssg w==;
X-CSE-ConnectionGUID: +JllOmbPSaWPFwF/METzCA==
X-CSE-MsgGUID: Y7i1wJpsT8GcvLb/d7pRTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="21785901"
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; d="scan'208";a="21785901"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 14:47:13 -0700
X-CSE-ConnectionGUID: bcujHrK0SkGuQVnZL1WgpA==
X-CSE-MsgGUID: vxqS3kcSRpKIvcIIxx7fQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; d="scan'208";a="63983767"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 14:47:13 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 1/3] lib/igt_core: Use unsigned constants for time
 conversion
Date: Wed, 14 Aug 2024 14:47:03 -0700
Message-ID: <20240814214705.3718355-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Time conversion is usually done with unsigned constant as it could
otherwise give warnings on signed/unsigned comparisons.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_core.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/igt_core.h b/lib/igt_core.h
index 82f474c5f..c83bcbaba 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -1505,10 +1505,10 @@ void igt_kmsg(const char *format, ...);
 #define le32_to_cpu(x)  (x)
 #endif
 
-#define MSEC_PER_SEC (1000)
-#define USEC_PER_SEC (1000*MSEC_PER_SEC)
-#define USEC_PER_DECISEC (100*MSEC_PER_SEC)
-#define NSEC_PER_SEC (1000*USEC_PER_SEC)
+#define MSEC_PER_SEC (1000U)
+#define USEC_PER_SEC (1000u * MSEC_PER_SEC)
+#define USEC_PER_DECISEC (100u * MSEC_PER_SEC)
+#define NSEC_PER_SEC (1000u * USEC_PER_SEC)
 
 #define for_if(expr__) if (!(expr__)) {} else
 
-- 
2.43.0

