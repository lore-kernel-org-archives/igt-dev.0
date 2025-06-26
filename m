Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E65FC77B7F
	for <igt-dev@archiver.kernel.org>; Thu, 26 Jun 2025 08:03:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC1C510E276;
	Thu, 26 Jun 2025 08:03:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZMMbPEy7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A6F510E276
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jun 2025 08:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750925018; x=1782461018;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0ddIQ1TGPFugUdcVwa5vupAvMNS+7yoR6iz6+dxR2ZE=;
 b=ZMMbPEy7vyRfztQTSEuhzs0j8swp/wQVMg2XCHyaO4BGyDMdaKY4QU2m
 +avKlaq7BdnSaN0HFMxXJbxqj72jbtcncDjgz3Qsf5IxeHJBTBKcxvfze
 clXEB9HM3TEvcwyyxRuBEQyqrulLQ7nsSei17+0i0jnxSZU7iZsdYYTUt
 +14OxWEkE1E27WnYHLJ9Ky3r4/NE74Hl9miqNQ1ts1mAzs3NMG6wx03G1
 z1PbcQLYjttv9XspWdrX7DgUmiNxwVSioyt1Sh2wBpO6bJ8jFQVjgkFS5
 mcUqmaiLoR2sN/iyrzP6mZjwjoSk7+5gmhh/joWS9hCPbeGK7wiUSQUWy g==;
X-CSE-ConnectionGUID: C9G/T8haQVGjaAWFJX4EJg==
X-CSE-MsgGUID: FKtyk4dqRxeuH5v70FFU3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="64567537"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="64567537"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 01:03:38 -0700
X-CSE-ConnectionGUID: NRf/T/Q0Ty6DMS0wc8dLUA==
X-CSE-MsgGUID: mjISrtrfRV+NbgEw+O20JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="156716481"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 01:03:35 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com, jeevan.b@intel.com,
 swati2.sharma@intel.com, pranay.samala@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_cursor_crc: optimise cursor crc on
 simulation
Date: Thu, 26 Jun 2025 13:31:07 +0530
Message-Id: <20250626080107.629395-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
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

Reduce the number of test crc iterations on simulation to avoid timeouts
on simulation.

V2: Avoid usage of extra variable to check run_in_simuation (Pranay)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_cursor_crc.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index cacd2402c..61dd4a205 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -490,9 +490,17 @@ static void test_crc_offscreen(data_t *data)
 static void test_crc_sliding(data_t *data)
 {
 	int i;
+	int max;
+
+	/* In simulation, we only run a few rounds to keep the test fast */
+	if (igt_run_in_simulation())
+		max = 4;
+	else
+		max = 16;
+
 	struct {
 		igt_crc_t crc[3];
-	} rounds[16] = {};
+	} rounds[max];
 
 	/* Make sure cursor moves smoothly and pixel-by-pixel, and that there are
 	 * no alignment issues. Horizontal, vertical and diagonal test.
@@ -526,6 +534,9 @@ static void test_crc_random(data_t *data)
 
 	/* Random cursor placement */
 
+	if (igt_run_in_simulation())
+		max = 10;
+
 	/* HW test */
 	cursor_enable(data);
 	igt_plane_set_fb(data->primary, &data->primary_fb[HWCURSORBUFFER]);
-- 
2.34.1

