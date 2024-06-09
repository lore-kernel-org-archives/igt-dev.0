Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB28C27C53
	for <igt-dev@archiver.kernel.org>; Sun,  9 Jun 2024 21:13:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB8510E2AE;
	Sun,  9 Jun 2024 21:13:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YiVRVvR5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE0F10E2B9
 for <igt-dev@lists.freedesktop.org>; Sun,  9 Jun 2024 21:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717967622; x=1749503622;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yMZ397w43+ldZvt7UHDRyr1EyOVCMB2nbSSAUbGqfQs=;
 b=YiVRVvR5FSZiTGl7zacwjPdyk/IlW9sfjRFlVmCBzC9qqmQKkpRhO+xP
 cyrLy/v1PWPC9GLDiw2jFcplAnuspAyPv/JAHT3vxTEtpvONMYvgLZ+2R
 EnRjEwBHYBe0iES3e/ba9TJdICPJAqLyQaaoxI1EBRBeb3omARLSdCLU9
 x/YV8nqDjUM+z/YuVwFMRfdmIYvEyHPUsAn8g2Qfu4c/IVs3n0X9kck2k
 WBkHm2u1uXSf1M2iyd/lZwG7NdZGW/YuDXsaCEXEfp9GjgBYd8YkE6WpM
 b1sn1HoT/FezZ6M+cRt0JLkneZgwzK/qA8w1cV74GkzmTs++TYJD6VFbg w==;
X-CSE-ConnectionGUID: D0u8UR2ZRzqUV5MsJ2G4Mg==
X-CSE-MsgGUID: sE8U9/E4SC2xSfEnY8y/ow==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="26037478"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; d="scan'208";a="26037478"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2024 14:13:42 -0700
X-CSE-ConnectionGUID: eXP3e6HQQrWPdiTL2CDX0w==
X-CSE-MsgGUID: JjZL5zGUT4W61Xi479wKTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; d="scan'208";a="38991007"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 14:13:40 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 1/9] lib/igt_kms: add data structures for link rate,
 lane count and training info
Date: Mon, 10 Jun 2024 02:55:27 +0530
Message-Id: <20240609212535.868832-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240609212535.868832-1-kunal1.joshi@intel.com>
References: <20240609212535.868832-1-kunal1.joshi@intel.com>
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

add enums for link rate, lane count and dp_link_training_info struct

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 01604dac9..12649eca9 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -258,6 +258,37 @@ enum intel_broadcast_rgb_mode {
 	BROADCAST_RGB_16_235
 };
 
+enum dp_link_rate {
+	DP_LINK_RATE_162000 = 162000,
+	DP_LINK_RATE_216000 = 216000,
+	DP_LINK_RATE_243000 = 243000,
+	DP_LINK_RATE_270000 = 270000,
+	DP_LINK_RATE_324000 = 324000,
+	DP_LINK_RATE_432000 = 432000,
+	DP_LINK_RATE_540000 = 540000,
+	DP_LINK_RATE_675000 = 675000,
+	DP_LINK_RATE_810000 = 810000,
+	DP_LINK_RATE_1000000 = 1000000,
+	DP_LINK_RATE_1350000 = 1350000,
+	DP_LINK_RATE_2000000 = 2000000
+};
+
+#define DP_MAX_LINK_RATE_COUNT 12
+
+enum dp_lane_count {
+	DP_LANE_COUNT_1 = 1,
+	DP_LANE_COUNT_2 = 2,
+	DP_LANE_COUNT_4 = 4
+};
+
+struct dp_link_training_info {
+	bool retrain_disabled;
+	int train_count;
+	int retrain_count;
+	int all_train_failures;
+	int seq_train_failures;
+};
+
 struct edid;
 
 bool kmstest_force_connector(int fd, drmModeConnector *connector,
-- 
2.43.0

