Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F312C02180
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jan 2025 14:59:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EECC510E05B;
	Wed, 15 Jan 2025 14:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j65NmUFS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC10B10E05B
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jan 2025 14:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736953173; x=1768489173;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=//SOpV7kWesS/WmwqVFbgTtYQL3eSaMpbe7FAWdIBlw=;
 b=j65NmUFSCu9hc9g6CpWPArz9C3Ibl/8Fm6x7GM+9vmIRBsrc6Xhh5y/o
 0zRP6MRm1hG1l5LUwWrXjFsm8rvBuCCAChBstDm3pr1pbv2qUIxAyHYg3
 Is8A/cNBr9nxclqTom56nlach7uFxRx70GzuN6Zvkr+XG6Bu3mUwc/ogs
 JLf5ksmwz1y/VrJtbyGjmm+D2l7fCNwGdNA1+ezfBP2YAeSShImfY+/yK
 BgHhS4Lnnfd1M3WXjEo2Clf6l5eBEL2nKT8pEtgD6W76C+Ejhv2wSwmFC
 s6cnLCQic+u3St8B3k7iTmE1m+siyVvJstwo6b5Tlf6yp3jgyooudIF69 A==;
X-CSE-ConnectionGUID: T8d2F1aFSHGjAC8qHeKvVA==
X-CSE-MsgGUID: DMGSp8hQSguLZLDnM0m3Xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="36505899"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208";a="36505899"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 06:59:32 -0800
X-CSE-ConnectionGUID: 6O+gNLz+SgSVJA2RU4BEpg==
X-CSE-MsgGUID: H2H7fYtERnG6HBUc1ilyYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208";a="136015181"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 06:59:31 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH] tests/chamelium/kms_chamelium_color: force connector reprobe
 after plugging ports
Date: Wed, 15 Jan 2025 20:45:07 +0530
Message-Id: <20250115151507.2023293-1-kunal1.joshi@intel.com>
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

Force reprobe connector status after plugging to assure
we always have DRM_MODE_CONNECTED status for the connector
before proceding with the test.

Fixes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2371
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/chamelium/kms_chamelium_color.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index 5550cec22..7c88c022c 100644
--- a/tests/chamelium/kms_chamelium_color.c
+++ b/tests/chamelium/kms_chamelium_color.c
@@ -749,8 +749,13 @@ igt_main
 		 * discovered ports, just incase they are not plugged
 		 * we currently skip in test_setup
 		 */
-		for( i = 0; i < data.port_count; i++)
+		for (i = 0; i < data.port_count; i++) {
 			chamelium_plug(data.chamelium, data.ports[i]);
+			igt_assert_f(chamelium_reprobe_connector(&data.display,
+								 data.chamelium,
+								 data.ports[i]) == DRM_MODE_CONNECTED,
+								 "Output not connected\n");
+		}
 
 		kmstest_set_vt_graphics_mode();
 	}
-- 
2.25.1

