Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0016C3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 21:35:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A97010E1D1;
	Tue, 30 Jul 2024 21:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="afT5bZmU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E98410E057
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 21:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722375344; x=1753911344;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j2eKbMldcja6ocFNSkbf6CI17TNk8oEjBbASn04plOk=;
 b=afT5bZmUG23c/yg/G2gE8ftD0RYcDYR5I6irOyaIAZPIZPV10yv7CULc
 bfS6jgICTEvsBedIRYcVbFNx3CNu/b6r21M5a1irXoGeS0aws6aYA6Dhw
 VwJzgjdJcydNvVB5eCHsWlYcCgbVfq93e8ob2axZr2t1rasfJnRh0NzOK
 Hba6HrghCmT9RWJzWi1ht1zrjhhiOXygjLD6kT5VyXsluh5TKo3x/e2Ag
 OL/4eG8yVJs5Yx3638ca9RM79sSQm0iai/RgJthGZ1ZoYJl5pnEJMOlLv
 fUNs1DCXjwjPxnsT9aB7QdCgVxxdZlbqApF28EVhBIRA8hMPuor/bSNFi w==;
X-CSE-ConnectionGUID: 5T2gzOf5Ru62PAud1bCCWg==
X-CSE-MsgGUID: gm1vUYRFQSW+PjkPlP1ctA==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="37694589"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="37694589"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 14:35:44 -0700
X-CSE-ConnectionGUID: j+Ht2ANuROmIEt4xWMP8Xw==
X-CSE-MsgGUID: v/aUDUKhRCqS/gNjTmXyXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="59321712"
Received: from linux-meteor-lake-client-platform.iind.intel.com
 ([10.190.219.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 14:35:43 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 01/10] lib/igt_kms: add enum for link rate and lane count
Date: Wed, 31 Jul 2024 02:43:32 +0530
Message-ID: <20240730211343.58703-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730211343.58703-1-kunal1.joshi@intel.com>
References: <20240730211343.58703-1-kunal1.joshi@intel.com>
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
index 501d48763..b44d13bcb 100644
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

