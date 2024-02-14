Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D55AC48BEB
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 08:53:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D37410E637;
	Wed, 14 Feb 2024 08:53:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bOz3Nw8p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E6A10E637
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 08:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707900801; x=1739436801;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5/LnJ06PvLf0r+iwS/8QhsvdcIF/ILIxolR9hDbYOyM=;
 b=bOz3Nw8pBH5PMV0rAP1Ky7C3ou66k5TMdomxiZUThmmiARjQ4E+tNOnw
 iW/4ufUdxYeesqRJqUz+HFFn/vUOJCrBdHiKK0yQyU55WlogE9fOZj1FP
 bfHn0ppmB67r2OGKCNoLHj91a+N481zZXxZdKhVWaDkx8pAC4ScDRElsF
 /ovWw9kaqOxpKTgPwUakR4crJx6vcqbAk8uVN7PhsOGb+Tx1e97KGWshe
 79UcATC04Q/V2FTdRGt6/xrRmM8yz0ING1nqC+hFri3QdzjecuZmcNnJ+
 Ugz64REzITVeoSpGTn674vB4zT8YA6bmMy/nMlnDLrrowyLzJhJh+uDHX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="27382376"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="27382376"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 00:53:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="912053972"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="912053972"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmsmga002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 00:53:17 -0800
From: "Samala, Pranay" <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, jeevan.b@intel.com,
	pranay.samala@intel.com, Samala@freedesktop.org
Subject: [PATCH v2 1/1] tests/kms_plane: Restricting number of pixel formats
 for simulation
Date: Wed, 14 Feb 2024 14:23:28 +0530
Message-Id: <20240214085328.2024-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240214085328.2024-1-pranay.samala@intel.com>
References: <20240214085328.2024-1-pranay.samala@intel.com>
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

The pixel-format subtest runs on all pixel formats, reducing it to single
format to reduce execution time on simulation.

Cc: B S, Karthik <karthik.b.s@intel.com>
Cc: B, Jeevan <jeevan.b@intel.com>

Signed-off-by: Samala, Pranay <pranay.samala@intel.com>
---
 tests/kms_plane.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 406aecc04..fbffc3cb0 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1081,6 +1081,9 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 		    f.modifier == ref.modifier)
 			continue;
 
+		if (f.format != DRM_FORMAT_XRGB8888 && igt_run_in_simulation())
+			continue;
+
 		/* test each format "class" only once in non-extended tests */
 		if (!data->extended && f.modifier != DRM_FORMAT_MOD_LINEAR) {
 			struct format_mod rf = {
-- 
2.34.1

