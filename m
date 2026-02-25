Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2B6FD45E3
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 19:21:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C11DF10E22A;
	Wed, 25 Feb 2026 19:21:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VJ7X6YoR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E9610E80C
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 19:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772047281; x=1803583281;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EfQNmthUUN2fpJKnAVUdT1YEH/aMHrSCmgqbyWE1G4w=;
 b=VJ7X6YoR5AXUgnGSYR6iZceLrtKrODxeDcpdEnMUVV9itnlI1AYUF5I9
 GQLrA9/+PQq0zchLr8Dl7jzmDbNqtQIRV4EAZMb/sEjIEjdqbryBzqHgG
 LwFGdEOstvKtxwosUj205yRy8zkQwMKLtp7tUI83NMTFgYyIRqoM6pBwa
 YUW/tZaf4GrZMIkfLGJz1MQbBBAEfcvy355z8SP3QYGagE8+jdjga/KGK
 aKoMPubZs/Yz2mQLmniz3TJLwJzSs6BvIKspNx4PHlEQ2wUD9n4+1bF7y
 3oMeztV7Kd9UcxQHop10mbhvaLEwLLflciBwAThkyPl+8Cn+LAgDMqc6L A==;
X-CSE-ConnectionGUID: 9V7lrKxhQmetPyrrsUuYfQ==
X-CSE-MsgGUID: 7xHpC7jRReaGs6ay0pQLZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73074300"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="73074300"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 11:21:21 -0800
X-CSE-ConnectionGUID: /+pBKcYJSyu+JpdjHJzZBA==
X-CSE-MsgGUID: w7lfhNclQyujcQSk56v4yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="221314377"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 11:21:19 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 5/6] tests/kms_feature_discovery: add basic usb4 switch
 discovery
Date: Thu, 26 Feb 2026 01:12:27 +0530
Message-Id: <20260225194228.853418-6-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260225194228.853418-1-kunal1.joshi@intel.com>
References: <20260225194228.853418-1-kunal1.joshi@intel.com>
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
---
 tests/kms_feature_discovery.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
index f0216a4ce..b05055186 100644
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

