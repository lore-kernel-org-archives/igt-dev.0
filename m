Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C78DC531DC
	for <igt-dev@archiver.kernel.org>; Fri, 23 Aug 2024 15:58:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D0010EC5B;
	Fri, 23 Aug 2024 15:58:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TvBjWDc3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2089B10EC5B
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Aug 2024 15:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724428682; x=1755964682;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0LR8I/AtNc88bPTs//5ePZKv20RdmWZ23DzLqmFlFuM=;
 b=TvBjWDc3CDn3LgpzF2JCVnmaFclE4fuR25+BBHvK2Cc2zvFTj5kKM4Hd
 O0YjpS11uBgcrOzoy+3nsFI3w+7ZhMzYzKyBMMUSrU0XW6AjERI/LiqmU
 Njkq4VfDsFcVIRJXb5VPaIp5/Y7Sz9KsDXiCUUTExuPilq0knwxAbp11T
 Uc7tPNLU3yP8IHYBVGWWTpno4pBuGDIAjxL9CXrP8KIRNmUHOeIgY1wee
 VCU8HNMeV0AYRp3Eg518nGKdZhtxe4+Owg0gjAc4Bc3MbbY7DdEOp1Ic9
 xBB2OOWz3RtTRk7e7LL/yuRuVeMstbqeNfFE6T16BEXbljKRVwffu8lx/ g==;
X-CSE-ConnectionGUID: Dv5i2P7jTFSW3+tuxpwkIg==
X-CSE-MsgGUID: 8dHQAWkeQYe8h+MDDez3sA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="34318449"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="34318449"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 08:58:02 -0700
X-CSE-ConnectionGUID: Wp6kKAn4RiOEfDrCgKJG9Q==
X-CSE-MsgGUID: m8qa3pMPTAuDp8AtN1t2OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="99358323"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.243])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 08:58:00 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mohammed Anas <triallax@tutanota.com>,
 Stefano Ragni <st3r4g@protonmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Reagan Bohan <xbjfk.github@gmail.com>, Yureka <yuka@yuka.dev>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t v2 1/1] tests/intel/kms_pm_backlight: Fixed build on musl
Date: Fri, 23 Aug 2024 17:57:47 +0200
Message-ID: <20240823155747.69745-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240823155747.69745-1-kamil.konieczny@linux.intel.com>
References: <20240823155747.69745-1-kamil.konieczny@linux.intel.com>
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

Fix compilation on musl by including proper POSIX header for
basename. Also while at this, sort out other headers.

v2: sorting more headers (Janusz)

Cc: Mohammed Anas <triallax@tutanota.com>
Cc: Stefano Ragni <st3r4g@protonmail.com>
Cc: Bernd Kuhls <bernd@kuhls.net>
Cc: Reagan Bohan <xbjfk.github@gmail.com>
Reported-by: Yureka <yuka@yuka.dev>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/intel/kms_pm_backlight.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
index 8672afa7a..140a95bcc 100644
--- a/tests/intel/kms_pm_backlight.c
+++ b/tests/intel/kms_pm_backlight.c
@@ -35,15 +35,17 @@
  * Test category: functionality test
  */
 
-#include "igt.h"
-#include <limits.h>
-#include <sys/types.h>
-#include <sys/stat.h>
+#include <errno.h>
 #include <fcntl.h>
+#include <libgen.h> /* for POSIX basename */
+#include <limits.h>
 #include <stdio.h>
-#include <errno.h>
-#include <unistd.h>
+#include <sys/stat.h>
+#include <sys/types.h>
 #include <time.h>
+#include <unistd.h>
+
+#include "igt.h"
 #include "igt_device.h"
 #include "igt_device_scan.h"
 
-- 
2.43.0

