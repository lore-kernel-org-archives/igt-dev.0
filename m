Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5A6CAC59A
	for <igt-dev@archiver.kernel.org>; Fri, 19 Sep 2025 17:05:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9A410EA61;
	Fri, 19 Sep 2025 17:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fM9tku6s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B833010EA61
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Sep 2025 17:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758301520; x=1789837520;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j9Pw4mXCQrZpV4wp9ACjoiik7pco58yuxBUm6N7vjGg=;
 b=fM9tku6sGOHBph/sQ255+Oj7acuydE60HrwzFxE+ompNhuaI5CnFdgMB
 CwTelVrqDb+62qyPjvME+Yu39d4Zt/WN9yV/dcZ8Gc4OZgaBCFEcpCA6C
 SV5WEmAubMlXF6FqJ+IFegzoPssIXs8ZweSGiNOiRxFggMhfwEZ8Gkz1i
 BzJAxx6iVw5mSBly9qBzaXuhEFLUKoYyP3lIAJ5ESP3TUzoTz0ZqYVUVO
 L4t7a6SjNqhdNWXCBvzT0ZT0TrH1KqIYRAkHXWs8tctVsTUiLRYR5wGfp
 OvEnu8Op6Q4YhR/AODb5WOwNH6jiCbH1VdwK125nnysjyvUQaO/vDIMcS w==;
X-CSE-ConnectionGUID: p6APrDliQgyIYDYr3oQK1w==
X-CSE-MsgGUID: nw8xnbC/QoOq5KfTZZ6oKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="59691330"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; d="scan'208";a="59691330"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 10:05:20 -0700
X-CSE-ConnectionGUID: +GlTtke6RGidwxPF5VN0aA==
X-CSE-MsgGUID: GhxKWjc1Rue32+pU9gajag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; d="scan'208";a="175131735"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.139])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 10:05:19 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 1/4] tests/core_getclient: Create basic subtest
Date: Fri, 19 Sep 2025 19:05:07 +0200
Message-ID: <20250919170510.154992-2-kamil.konieczny@linux.intel.com>
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

Create one basic subtest. This will allow it to have proper
end fixup. Also while at this, sort include headers.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/core_getclient.c | 49 +++++++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/tests/core_getclient.c b/tests/core_getclient.c
index 21711cc55..594c86a6f 100644
--- a/tests/core_getclient.c
+++ b/tests/core_getclient.c
@@ -25,12 +25,12 @@
  *
  */
 
-#include "igt.h"
+#include <errno.h>
 #include <limits.h>
-#include <sys/ioctl.h>
 #include <stdlib.h>
-#include <errno.h>
+#include <sys/ioctl.h>
 
+#include "igt.h"
 /**
  * TEST: core getclient
  * Description: Tests the DRM_IOCTL_GET_CLIENT ioctl.
@@ -41,35 +41,40 @@
  * Feature: core
  * Test category: GEM_Legacy
  *
- * SUBTEST:
+ * SUBTEST: basic
  * Description: Tests the DRM_IOCTL_GET_CLIENT ioctl.
  */
 
 IGT_TEST_DESCRIPTION("Tests the DRM_IOCTL_GET_CLIENT ioctl.");
 
-igt_simple_main
+igt_main
 {
 	int fd, ret;
 	drm_client_t client;
 
-	fd = drm_open_driver(DRIVER_ANY);
+	igt_fixture
+		fd = drm_open_driver(DRIVER_ANY);
 
-	/* Look for client index 0.  This should exist whether we're operating
-	 * on an otherwise unused drm device, or the X Server is running on
-	 * the device.
-	 */
-	client.idx = 0;
-	ret = ioctl(fd, DRM_IOCTL_GET_CLIENT, &client);
-	igt_assert(ret == 0);
+	igt_describe("Check GET_CLIENT ioctl of the first drm device.");
+	igt_subtest("basic") {
+		/* Look for client index 0.  This should exist whether we're operating
+		 * on an otherwise unused drm device, or the X Server is running on
+		 * the device.
+		 */
+		client.idx = 0;
+		ret = ioctl(fd, DRM_IOCTL_GET_CLIENT, &client);
+		igt_assert(ret == 0);
 
-	/* Look for some absurd client index and make sure it's invalid.
-	 * The DRM drivers currently always return data, so the user has
-	 * no real way to detect when the list has terminated.  That's bad,
-	 * and this test is XFAIL as a result.
-	 */
-	client.idx = 0x7fffffff;
-	ret = ioctl(fd, DRM_IOCTL_GET_CLIENT, &client);
-	igt_assert(ret == -1 && errno == EINVAL);
+		/* Look for some absurd client index and make sure it's invalid.
+		 * The DRM drivers currently always return data, so the user has
+		 * no real way to detect when the list has terminated.  That's bad,
+		 * and this test is XFAIL as a result.
+		 */
+		client.idx = 0x7fffffff;
+		ret = ioctl(fd, DRM_IOCTL_GET_CLIENT, &client);
+		igt_assert(ret == -1 && errno == EINVAL);
+	}
 
-	drm_close_driver(fd);
+	igt_fixture
+		drm_close_driver(fd);
 }
-- 
2.51.0

