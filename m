Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B757C5B572
	for <igt-dev@archiver.kernel.org>; Tue, 11 Aug 2026 14:16:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC3510E72A;
	Tue, 11 Aug 2026 14:16:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bONEYPvn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C2010E0CA
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Aug 2026 14:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786457693; x=1817993693;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R/Tjuw5/QlPu2C6oR59W7HEUj3cj7kuQVAvnHWrWGsw=;
 b=bONEYPvn/37B1RJxCRZ9YSosz/1PGCqGTJoK1e2aB1/Zz1/E9uxWeHur
 t5LATc9QAMSGhxZzJt4pySYi+uyFxOQOJtpBymFms8kYuhgV2cN1sBPTI
 7IuaXLy9ozdEodM/huD1tzWZgRa40IYHsINVAmhyJMk1rRtKXcCuQCPx+
 yQaOjVFGKXG3IGQitd4JyY/SDFRqvr2VFOBX6yiWEhc58e5CSYD0ahfH1
 Qu/UReEBJ4ePCgAuqnl0gJbUYeA0u4lmN4/VCQpDbmISqaui6DWQxtoBV
 J0xkiJxqWWLAObYYbgrz+Y8UX1Znz+IUvgCgdiN+Cq3xzxtMk0WaVtgxb Q==;
X-CSE-ConnectionGUID: SvrTx1G1TYCEcgcjRGRYeA==
X-CSE-MsgGUID: Be94X5aPRg6FMZE2O3aUag==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="104519708"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="104519708"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 07:14:53 -0700
X-CSE-ConnectionGUID: D1PKHO6uSzGTXUI6KFa9XQ==
X-CSE-MsgGUID: gqcVJVU1TDKLrgwk47v6Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="260737261"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 07:14:53 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com, raag.jadav@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v1 2/2] tests/device_reset: Add Xe healthcheck to post-reset
 validation
Date: Tue, 11 Aug 2026 16:14:26 +0200
Message-ID: <20260811141426.1642321-3-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811141426.1642321-1-lukasz.laguna@intel.com>
References: <20260811141426.1642321-1-lukasz.laguna@intel.com>
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

Extend the healthcheck for Xe devices to validate basic command
submission after reset.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/device_reset.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/tests/device_reset.c b/tests/device_reset.c
index b281f4ece..70ca511e0 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -14,6 +14,8 @@
 #include "igt_pci.h"
 #include "igt_sysfs.h"
 #include "igt_kmod.h"
+#include "xe/xe_device.h"
+
 /**
  * TEST: device reset
  * Description: Examine behavior of a driver on device sysfs reset
@@ -392,6 +394,8 @@ static bool is_i915_wedged(int i915)
  */
 static void healthcheck(struct device_fds *dev)
 {
+	int fd;
+
 	if (dev->fds.dev == -1) {
 		/* give the kernel a breath for re-creating device nodes in devtmpfs */
 		sleep(1);
@@ -400,10 +404,13 @@ static void healthcheck(struct device_fds *dev)
 		igt_debug("reopen the device\n");
 		dev->fds.dev = __drm_open_driver(DRIVER_ANY);
 	}
-	igt_assert_fd(dev->fds.dev);
+	fd = dev->fds.dev;
+	igt_assert_fd(fd);
 
-	if (is_i915_device(dev->fds.dev))
-		igt_assert(!is_i915_wedged(dev->fds.dev));
+	if (is_i915_device(fd))
+		igt_assert(!is_i915_wedged(fd));
+	else if (is_xe_device(fd))
+		xe_healthcheck(fd);
 }
 
 /**
-- 
2.43.0

