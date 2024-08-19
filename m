Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A40C5320E
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 09:14:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D174D10E224;
	Mon, 19 Aug 2024 09:14:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D6ncBnL+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 027DC10E096
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 09:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724058859; x=1755594859;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IsxeGYM6ARhYsG3uMbPNa0NH78ml83CfhraTadqjprc=;
 b=D6ncBnL+svbopMF7/BF0bPLNav94Xeh8XQ9C+ZgV2t9ztnpKI/JCGJX9
 FJmH8c9HZqFf6l247LSYeglCv7+Rr3JVvqIRP8LNAcKmOgUdIzoy2JgVW
 97VKXMx6ZWWYS2MeKAOc9I9tOPAwBeRS3NFfu/qdy/bF/3rJoxCEuE1sT
 vzSEg7Th+uPmgRoFEgPW/lqmiCeC84lmXYPA+HZG8a5tAjAxh2Omj7wEv
 RuAcAwIMtHie9E34yPTxUcHpHywLlC+j+gXT1PoHROlHelgn0pX85Kg7h
 tr5YfCaaHOba1V0dlbPHXYplWvCXAI7XvtHFXElFhGPXSIGmSy/OMf6xQ w==;
X-CSE-ConnectionGUID: zy0EX8N+SYiy3o/dZhsV3A==
X-CSE-MsgGUID: cexuBpSFSfusFMuVEFmgGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="44816291"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="44816291"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 02:14:19 -0700
X-CSE-ConnectionGUID: o3a3P10xTqWBi+xbxNraPw==
X-CSE-MsgGUID: ZvOjOa9eTSmbqcVaM4Rv5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="60884147"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 02:14:18 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 01/12] lib/igt_kms: add enum for link rate and lane count
Date: Mon, 19 Aug 2024 14:56:04 +0530
Message-Id: <20240819092615.3669803-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240819092615.3669803-1-kunal1.joshi@intel.com>
References: <20240819092615.3669803-1-kunal1.joshi@intel.com>
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
index e8582a45b..11d4acf4e 100644
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
2.43.0

