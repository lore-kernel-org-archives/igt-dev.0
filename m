Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60CBC5320E
	for <igt-dev@archiver.kernel.org>; Sun, 25 Aug 2024 19:54:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F4610E0FC;
	Sun, 25 Aug 2024 19:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d9GdDmEd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DBF510E0FC
 for <igt-dev@lists.freedesktop.org>; Sun, 25 Aug 2024 19:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724615659; x=1756151659;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KeCN+LGDoNmdrVQ44AGlGZBsCb/ZPdb/JAdEeKxvPFI=;
 b=d9GdDmEdaANlq22tQxa2Gdm86w8gOIeayn/aYYV115Fmu5kvP1vi4Xd1
 0eeejQE8LAQBGvjoPioNk3XzUXainGSLb3nq5d7obHZLv9f/OcwBG4Ify
 FVRusGttO9I4j7owqvKyIXRp673Mnbo8vi1vB14DlXi6Hy4tIVrxdb4PV
 EE8SZqHNsaLy/dLqsRSlOqnx5QMvIbj+eTOQJ2HIT9GFtVusb+RqsdBEe
 d75WvAIuLn1BsrVhBHAO2kDW48T300307hPkOZcNK0mvjn1isVwohSOer
 nHNc7LDj7mp0Kp+zZCnqcu7TG7pnILNCUp5aaYxwiTq2IDEudv9UIsffw w==;
X-CSE-ConnectionGUID: FR8Lpu4IRj+yFfSUslkpNQ==
X-CSE-MsgGUID: ggrufLKpQgWfBohj532jIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="33591448"
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="33591448"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2024 12:54:18 -0700
X-CSE-ConnectionGUID: UZuRI3ciQZq6KXKtiBoKjA==
X-CSE-MsgGUID: cNJsZPivSbyJQgOIXTMOoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="62283632"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 12:54:17 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 01/14] lib/igt_kms: add enum for link rate and lane count
Date: Mon, 26 Aug 2024 01:35:59 +0530
Message-Id: <20240825200612.4036178-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240825200612.4036178-1-kunal1.joshi@intel.com>
References: <20240825200612.4036178-1-kunal1.joshi@intel.com>
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

add enums for link rate, lane count

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 25ba50916..999921f9f 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -258,6 +258,29 @@ enum intel_broadcast_rgb_mode {
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
 struct edid;
 
 bool kmstest_force_connector(int fd, drmModeConnector *connector,
-- 
2.34.1

