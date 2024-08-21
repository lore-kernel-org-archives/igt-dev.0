Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E12C52D7C
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 09:51:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C2E310E57B;
	Wed, 21 Aug 2024 09:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KNOjbpXi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459D810E5D5
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Aug 2024 09:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724233910; x=1755769910;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bf8SGHFL5VD7IaK5IHwkUgmtFAAerQE8U8AlxLmMNng=;
 b=KNOjbpXiLbWfzvdkmmf6NHbNwR8tOLJre/KUP1FOk/8+F4yiKtDwc43e
 NJ54kfdJWgtcON6Ov/aILvt3VG+AzEBoVng8AG5nsm1EFH0UMemBgjT49
 QpKRhNApCp2OKu34WDkWjYjQBNMNOSmZuqoxbkXBDBKgjNPlSjbaY5GVN
 pgH2xCX4sK1DUKNDgG0wuMbsaXohgQZvyN/XtHg2WdOk+D36+qZN0j7dh
 NoUD11MbgOIB/xsW2soVaRgQdsdW2iAscLWbhmw9HEb/872mO8d5O/p2F
 bCJWy8UTdz9+JFccC14tkL4aj3bs1Kblb3/xmRbzLtysHqlRJ95f8RQnO A==;
X-CSE-ConnectionGUID: 10VLPFEPR5O3YYx+aY+vyw==
X-CSE-MsgGUID: vVKWK75hSY+7c/Q7Z4o+IA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="33245225"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="33245225"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 02:51:50 -0700
X-CSE-ConnectionGUID: TWta1H00R12QciLwUyDHCg==
X-CSE-MsgGUID: AZzmwS2KSG+Q/T/9Xgmfmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="65390614"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.207])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 02:51:48 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mohammed Anas <triallax@tutanota.com>,
 Stefano Ragni <st3r4g@protonmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Reagan Bohan <xbjfk.github@gmail.com>, Yureka <yuka@yuka.dev>
Subject: [PATCH i-g-t v1 1/1] tests/intel/kms_pm_backlight: Fixed build on musl
Date: Wed, 21 Aug 2024 11:51:37 +0200
Message-ID: <20240821095137.60254-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240821095137.60254-1-kamil.konieczny@linux.intel.com>
References: <20240821095137.60254-1-kamil.konieczny@linux.intel.com>
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

Cc: Mohammed Anas <triallax@tutanota.com>
Cc: Stefano Ragni <st3r4g@protonmail.com>
Cc: Bernd Kuhls <bernd@kuhls.net>
Cc: Reagan Bohan <xbjfk.github@gmail.com>
Reported-by: Yureka <yuka@yuka.dev>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/kms_pm_backlight.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
index 8672afa7a..c2213d3b1 100644
--- a/tests/intel/kms_pm_backlight.c
+++ b/tests/intel/kms_pm_backlight.c
@@ -35,15 +35,17 @@
  * Test category: functionality test
  */
 
-#include "igt.h"
+#include <unistd.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <libgen.h> /* for POSIX basename */
 #include <limits.h>
+#include <stdio.h>
 #include <sys/types.h>
 #include <sys/stat.h>
-#include <fcntl.h>
-#include <stdio.h>
-#include <errno.h>
-#include <unistd.h>
 #include <time.h>
+
+#include "igt.h"
 #include "igt_device.h"
 #include "igt_device_scan.h"
 
-- 
2.43.0

