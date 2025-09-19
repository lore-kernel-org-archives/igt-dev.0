Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7235CCAC592
	for <igt-dev@archiver.kernel.org>; Fri, 19 Sep 2025 17:05:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE3A10EA65;
	Fri, 19 Sep 2025 17:05:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nc5BQcpn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6700610EA65
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Sep 2025 17:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758301528; x=1789837528;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5Ov4CS2e7ouR+DIv8iZIVDiXMPRjUnVmMDC8d+z54u0=;
 b=Nc5BQcpnYohTt5NY7JEOlhZZhCwUWOiRfI86ywfmzM9phrUZegV9kKKK
 3iKHY7PnqIYh2gX7Ds4qV6EqTUasAiQXoXG7uFnuk39d+cVltzBhw4JXs
 z5QmHM+QXat8yCpEbVMwjgHELTRjUaWdfuHG7VKJwjwzEzrftyybwGH3K
 /9TIE5kp4ucPVMrlN3F4fEmhT2RIJlgLhkf+H+sVw/5dEFHk8g/7RSugi
 B5xqoR8+dR+XAflgb5tcNMN3kK6AAbb+jZe/jqH2u3fkcGwUjJO5Qh6QE
 fcTr3C+CXKrOkHbQf+kuuHofPjSbSRD25o31UcL+l4+YIH3otc44afStt A==;
X-CSE-ConnectionGUID: uNlJxU9hSoODsm66hjam2g==
X-CSE-MsgGUID: i/xnKSm4QgK9bw1p1zpfLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="59691337"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; d="scan'208";a="59691337"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 10:05:28 -0700
X-CSE-ConnectionGUID: 3TyhgHUFTnexnOVvA02a5A==
X-CSE-MsgGUID: E9U3INtVS2SBdyehKwSPOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; d="scan'208";a="175131764"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.139])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 10:05:27 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 3/4] tests/core_getstats: Create basic subtest
Date: Fri, 19 Sep 2025 19:05:09 +0200
Message-ID: <20250919170510.154992-4-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919170510.154992-1-kamil.konieczny@linux.intel.com>
References: <20250919170510.154992-1-kamil.konieczny@linux.intel.com>
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

Create one basic subtest. While at this also sort include
headers.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/core_getstats.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/tests/core_getstats.c b/tests/core_getstats.c
index 0b9138aed..76804d518 100644
--- a/tests/core_getstats.c
+++ b/tests/core_getstats.c
@@ -25,12 +25,12 @@
  *
  */
 
-#include "igt.h"
+#include <drm.h>
 #include <limits.h>
 #include <sys/ioctl.h>
 #include <sys/types.h>
 
-#include <drm.h>
+#include "igt.h"
 
 /**
  * TEST: core getstats
@@ -42,7 +42,7 @@
  * Feature: core
  * Test category: GEM_Legacy
  *
- * SUBTEST:
+ * SUBTEST: basic
  * Description: Tests the DRM_IOCTL_GET_STATS ioctl.
  */
 
@@ -55,15 +55,20 @@
 
 IGT_TEST_DESCRIPTION("Tests the DRM_IOCTL_GET_STATS ioctl.");
 
-igt_simple_main
+igt_main
 {
 	int fd, ret;
 	drm_stats_t stats;
 
-	fd = drm_open_driver(DRIVER_ANY);
+	igt_fixture
+		fd = drm_open_driver(DRIVER_ANY);
 
-	ret = ioctl(fd, DRM_IOCTL_GET_STATS, &stats);
-	igt_assert(ret == 0);
+	igt_describe("Check GET_STATS ioctl of the first drm device.");
+	igt_subtest("basic") {
+		ret = ioctl(fd, DRM_IOCTL_GET_STATS, &stats);
+		igt_assert(ret == 0);
+	}
 
-	drm_close_driver(fd);
+	igt_fixture
+		drm_close_driver(fd);
 }
-- 
2.51.0

