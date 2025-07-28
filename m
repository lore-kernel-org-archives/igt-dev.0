Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B132C87FCE
	for <igt-dev@archiver.kernel.org>; Mon, 28 Jul 2025 07:59:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFCFA10E496;
	Mon, 28 Jul 2025 07:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZKKsppb1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8991110E496
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Jul 2025 07:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753689573; x=1785225573;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Lvdbkjd6pUEc8g/9N04GFJsSovVg4jDS0PdZnYT2fO8=;
 b=ZKKsppb1xnA5V6SYW0h/jy0i61jo7cHC3IXQWHSpd4LXGqcjmcy3sxHw
 SohZVV6s4l1L64G7ZkJNyH3iSKtE71i5ttU1WnqYYYRMx5idoLAPPewL8
 cRF21wC+DFU4ytBOuYH9qMUGkU3/CDZw4qt6d9bF0b0bhdXa1+k5SLxQA
 Hvyjm8A4qNIFVamNfIPBJLpagYfigAQ6vIRNyGLk4CK9Met5Q0wTofIT7
 p5oUM6I5bNhAlnc5ekmifbyVqzpmYT/4BmENzvYimkqs7dQ+WcBKK1bYp
 Gnyq0wSqnYMnx/Wdb/gy8jztre6cFS6D7ycJ4aXOEDTdHEdwjuDSB2e5L A==;
X-CSE-ConnectionGUID: o/hwtE+FTtGgtcYJWzkTmA==
X-CSE-MsgGUID: AIOPo1aiT9WBNmZLC6ZiSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="59733696"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="59733696"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 00:59:32 -0700
X-CSE-ConnectionGUID: Adw/8NqJQl6O+cdrOztY4A==
X-CSE-MsgGUID: 8FgjJXTQRJulzyBTDes1GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="193318248"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 00:59:31 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t] tests/chamelium/kms_chamelium_color: poll connector
 status instead of HPD uevents
Date: Mon, 28 Jul 2025 13:45:20 +0530
Message-Id: <20250728081520.1071884-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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

Stop using udev monitors and chamelium_wait_for_hotplug().
Instead, reprobe until the connector becomes DRM_MODE_CONNECTED.
Temoves HPD/udev dependency.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/chamelium/kms_chamelium_color.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index cee613233..1d4f16da4 100644
--- a/tests/chamelium/kms_chamelium_color.c
+++ b/tests/chamelium/kms_chamelium_color.c
@@ -748,13 +748,12 @@ igt_main
 		 * prevents any ports from being unintentionally skipped in test_setup.
 		 */
 		for (i = 0; i < data.port_count; i++) {
-			struct udev_monitor *mon;
-			int timeout = CHAMELIUM_HOTPLUG_TIMEOUT;
 			chamelium_unplug(data.chamelium, data.ports[i]);
-			mon = igt_watch_uevents();
 			chamelium_plug(data.chamelium, data.ports[i]);
-			igt_assert(chamelium_wait_for_hotplug(mon, &timeout));
-			igt_cleanup_uevents(mon);
+			chamelium_wait_for_conn_status_change(&data.display,
+							      data.chamelium,
+							      data.ports[i],
+							      DRM_MODE_CONNECTED);
 			igt_assert_f(chamelium_reprobe_connector(&data.display,
 								 data.chamelium,
 								 data.ports[i]) == DRM_MODE_CONNECTED,
-- 
2.25.1

