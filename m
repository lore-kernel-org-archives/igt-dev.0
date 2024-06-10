Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D40C27C5F
	for <igt-dev@archiver.kernel.org>; Mon, 10 Jun 2024 16:42:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB5210E4C1;
	Mon, 10 Jun 2024 16:42:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B9/Q/XUK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4447810E417
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jun 2024 16:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718037773; x=1749573773;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q0sL+AQrWg2u4WzNHdIXVP+rGrDpA/BAj8xL+RToG6o=;
 b=B9/Q/XUKHNvdB4dbHjr1t1C7t6iOi9iI6KML3gIUKnpUBwfyiLBqzYuj
 vJLv8yF2tchr4S1i9dSK4xkLwFpeAw7IfKFdtUbgL2jr5VDyHIM9phqO6
 5pY0rfAkN+I/+RqEEK5OffyuL2nywQl7pMwRW7bezb1OGr7Zc5x2Jdo6b
 y/V/A7spvZ0lWK3DS3eAnHt1Q7BIfha1pIlEj6LBfTmea6V2l+UFBV3j0
 DuSMHc2GDk8wHJdYDVoaAwX/cWsF6PJWvcptcOIDLsGPurI68MTHn4azt
 mXt1FjnzWyVPjn6jIREqB75YhTLExuTEwEa0mCD4SVT2XPP6N9Xq8uK8b Q==;
X-CSE-ConnectionGUID: 1YUXM6ZVTKq58+JbGIJTZg==
X-CSE-MsgGUID: ZW2UlyKfRbKOX9XBNQ00xQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="25819701"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="25819701"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 09:42:53 -0700
X-CSE-ConnectionGUID: 8P09D6jSTrudBh8w2OOpqg==
X-CSE-MsgGUID: S0Sz0vhHTdiG+VE1x1ZvcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="39681338"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 09:42:51 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 4/9] tests/kms_dp_aux_dev: Test cleanup
Date: Mon, 10 Jun 2024 22:04:52 +0530
Message-ID: <20240610163457.3711476-5-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240610163457.3711476-1-bhanuprakash.modem@intel.com>
References: <20240610163457.3711476-1-bhanuprakash.modem@intel.com>
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

Make sure the below points in IGT cleanup:

 - Sanitize the state before starting the subtest.
 - Clear the states before exiting the subtest.
 - Update existing libdrm APIs with IGT kms APIs.
 - Other misc (Ex: update deprecated APIs/macros/enums, FB leaks etc..)

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_dp_aux_dev.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/tests/kms_dp_aux_dev.c b/tests/kms_dp_aux_dev.c
index 3e1d8be3a..7e1d52254 100644
--- a/tests/kms_dp_aux_dev.c
+++ b/tests/kms_dp_aux_dev.c
@@ -152,15 +152,19 @@ igt_simple_main
 	drmModeRes *res;
 	int drm_fd;
 
-	drm_fd = drm_open_driver_master(DRIVER_ANY);
+	igt_fixture {
+		drm_fd = drm_open_driver_master(DRIVER_ANY);
 
-	res = drmModeGetResources(drm_fd);
-	igt_require(res);
+		res = drmModeGetResources(drm_fd);
+		igt_require(res);
+	}
 
 	for (int i = 0; i < res->count_connectors; i++)
 		valid_connectors += test(drm_fd, res->connectors[i]);
 	igt_require(valid_connectors);
 
-	drmModeFreeResources(res);
-	drm_close_driver(drm_fd);
+	igt_fixture {
+		drmModeFreeResources(res);
+		drm_close_driver(drm_fd);
+	}
 }
-- 
2.43.2

