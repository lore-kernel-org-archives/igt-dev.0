Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9C7E98FA9
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 04:16:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D590E10E10A;
	Thu,  9 Apr 2026 04:16:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BM3CCfIC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A136710E0FF
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 04:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775708161; x=1807244161;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I51a7lGA4nyrji/stnIk2g5BT4k5wlcy5qM2YFFeofs=;
 b=BM3CCfICMui4WLwlSqL9Z2x3/3F4W4iMpS51Lp2lE98EJp9Xk/AnQxRl
 bnJ02CRdMUYBaTA8AszsdjxZqqCNJg0gq6n8k8hWnDlnlierVPF4GclxB
 9+NWVPYtBOGJYV+Y5ETyYGCeglAXAlU2cCYH9QgPFhe3x0rLBD76Ob9pq
 zfVrXyCqLdj2HgzMsAmAUEGggXSouUVeE6kTxt4L9KIh/WzAznlWw4xLd
 5Oxz2TF5zwV5aTZnoIt+09xdgVyVOljIS+y28ZvYxyQZaswWzwB5PXF/g
 oEmt4taPP/4tll25YHJ9+NoJ/qlJJLVBzNQIievjvJb2bX1+6PQWLseTS g==;
X-CSE-ConnectionGUID: RTM4LUv8R16vkhawS9kzwQ==
X-CSE-MsgGUID: tdtNRNs0Qt2yK6vpSyw4Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76608385"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="76608385"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 21:16:01 -0700
X-CSE-ConnectionGUID: L4NsbIaUTyiljgB8eykaXg==
X-CSE-MsgGUID: qsRpGJRkQuuf9ju/S+XbsQ==
X-ExtLoop1: 1
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 21:15:59 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH i-g-t 5/6] tests/kms_feature_discovery: add basic usb4 switch
 discovery
Date: Thu,  9 Apr 2026 10:07:13 +0530
Message-Id: <20260409043714.284108-6-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260409043714.284108-1-kunal1.joshi@intel.com>
References: <20260409043714.284108-1-kunal1.joshi@intel.com>
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

Add a 'usb4-switch' subtest that verifies the Microsoft USB4 Switch
3141 is reachable. The test initializes the switch library and queries
the active port to confirm communication works.

This enables CI to detect when USB4 switch hardware is available
before running the full kms_usb4_switch test suite.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 tests/kms_feature_discovery.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
index 28ec89c55..abb9bad97 100644
--- a/tests/kms_feature_discovery.c
+++ b/tests/kms_feature_discovery.c
@@ -40,6 +40,7 @@
 #include "igt_psr.h"
 #include "igt_sysfs.h"
 #include "igt_types.h"
+#include "igt_usb4_switch.h"
 
 /**
  * SUBTEST: display
@@ -63,6 +64,9 @@
  * SUBTEST: dp-mst
  * Description: Make sure that we have DP-MST configuration.
  *
+ * SUBTEST: usb4-switch
+ * Description: Verify that USB4 Switch 3141 is available and responding.
+ *
  * arg[1].values: 1, 2, 3, 4
  */
 
@@ -147,6 +151,25 @@ int igt_main() {
 		}
 #endif
 
+		igt_describe("Verify that USB4 Switch 3141 is available and responding.");
+		igt_subtest("usb4-switch") {
+			struct usb4switch *sw;
+			int port;
+
+			sw = usb4switch_init(fd);
+			igt_require_f(sw,
+				      "USB4 Switch 3141 not available\n");
+
+			/* Verify communication works by querying active port */
+			port = usb4switch_get_active_port(sw);
+			igt_assert_f(port >= 0,
+				     "Cannot communicate with USB4 switch\n");
+
+			igt_info("USB4 Switch 3141 available (active port: %d)\n",
+				 port);
+			usb4switch_deinit(sw);
+		}
+
 		igt_describe("Make sure that we have eDP panel with PSR1 support.");
 		igt_subtest("psr1") {
 			igt_require(psr_sink_support(fd, debugfs_fd, PSR_MODE_1, NULL));
-- 
2.25.1

