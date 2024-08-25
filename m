Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7026BC5320E
	for <igt-dev@archiver.kernel.org>; Sun, 25 Aug 2024 18:02:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8478010E07F;
	Sun, 25 Aug 2024 18:02:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jFmxMQuX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E3B10E05C
 for <igt-dev@lists.freedesktop.org>; Sun, 25 Aug 2024 18:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724608949; x=1756144949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3MNC2v2X6S3nFtVybNQVzqXKNImL5+xQBVrTWlWVTVw=;
 b=jFmxMQuX+5sY9i3SFk7+uHgwK9/31bHjJkIhB/skjL73jKJDGGDn6S8J
 ceNaqidKpw9qEw3RY51SL335RPtVrVU7kCoc4L8H1NKog/OfhmnwQ3O4l
 3StXfhCbbhtM/UXDPIv5uenS99Vv4JzCa44xHlr+b1fhq0hJDEd31at4m
 anyjBYQuX/Rqol1xfqGC0vWoUPJ/Un7lVG7WaLqJIKaRZak4X1cadowyM
 X0Vl9UZJSqIOrWLG8JOuB5Zq1swo/fQ6rbj6qKp9StEaPr4E19Lb8Qd8P
 ffLCgTaE9cBR8QEkv8RFIPZl0/IIDoDATh4evdnpswe8/ZGXFzBb7T8Eh w==;
X-CSE-ConnectionGUID: c775Smv8QEi/n1REhzD5Iw==
X-CSE-MsgGUID: MiZqBnFVSFmCxyvgbgzmsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="25917450"
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="25917450"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2024 11:02:29 -0700
X-CSE-ConnectionGUID: JrPeqT8USXy6gTPHkHcjzw==
X-CSE-MsgGUID: vbjINGM5T66Fhf2IiF+22Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="85488278"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 11:02:28 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 01/14] lib/igt_kms: add enum for link rate and lane count
Date: Sun, 25 Aug 2024 23:44:11 +0530
Message-Id: <20240825181424.4034541-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240825181424.4034541-1-kunal1.joshi@intel.com>
References: <20240825181424.4034541-1-kunal1.joshi@intel.com>
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
2.43.0

