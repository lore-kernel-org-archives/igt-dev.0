Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46736C27C53
	for <igt-dev@archiver.kernel.org>; Fri, 31 May 2024 14:25:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34FCC10E458;
	Fri, 31 May 2024 14:25:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rkjjrfzf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2082910E51A
 for <igt-dev@lists.freedesktop.org>; Fri, 31 May 2024 14:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717165512; x=1748701512;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=/69ye47qAPWAGtaaEUfgqkc0s8dkTnWKZYLxQbvB+Nk=;
 b=RkjjrfzfrPEPLRTAUoSCUpz4g7kEFGtpB+mlhkV/MTvgtcBI8cB1h5Nu
 KFFwLLkSgFgWrjCiMYw8+l+O9qgXGPL5IN6dh9uOWrz7oPMJTiOBAIHSs
 n7RowLsTzSJznNsa346olNg5J1sAPILlA2m1yLGb1mQBKcSqFJHzI6+7e
 DDyxpvIezcvZ8RklP/qbbJ1GzujJyfXyJLXLeIbQdd8VEebUaEzY9Fhka
 SxKYeFelP6iDouQFY437dQROVzTtHBOVSr2Py9wU2GUFAdzDrKZzImHLi
 3DhUAzYFsFpLy43qRH3m9R3dOk4CPOghCvbBmGoRJkU5btrQnuQmDl5kS A==;
X-CSE-ConnectionGUID: NjqAuKX9TBGvWY8KSj5kpw==
X-CSE-MsgGUID: OlTWek4XRmOIFEeS25W6pg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="25113735"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="25113735"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 07:24:35 -0700
X-CSE-ConnectionGUID: 4wVERn8KQDi8nfgRs0OCQw==
X-CSE-MsgGUID: smZmpMRZRJ+ZDeoirjOfzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="36160894"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 31 May 2024 07:24:33 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 31 May 2024 17:24:32 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 14/20] tools/intel_vbt_decode: Sort dumper table
Date: Fri, 31 May 2024 17:23:48 +0300
Message-ID: <20240531142354.16528-15-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240531142354.16528-1-ville.syrjala@linux.intel.com>
References: <20240531142354.16528-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Sort the block dumper table by the block ID. Makes it a
bit easier to double check which blocks we have implemented
vs. not.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 52 ++++++++++++++++++++--------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index a77c1ec3335d..95ed97c5f499 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -2666,11 +2666,37 @@ struct dumper dumpers[] = {
 		.name = "General definitions block",
 		.dump = dump_general_definitions,
 	},
+	{
+		.id = BDB_PSR,
+		.min_bdb_version = 165,
+		.name = "PSR block",
+		.dump = dump_psr,
+	},
 	{
 		.id = BDB_CHILD_DEVICE_TABLE,
 		.name = "Legacy child devices block",
 		.dump = dump_legacy_child_devices,
 	},
+	{
+		.id = BDB_DRIVER_FEATURES,
+		.name = "Driver feature data block",
+		.dump = dump_driver_feature,
+	},
+	{
+		.id = BDB_SDVO_LVDS_OPTIONS,
+		.name = "SDVO LVDS options block",
+		.dump = dump_sdvo_lvds_options,
+	},
+	{
+		.id = BDB_SDVO_LVDS_DTD,
+		.name = "SDVO LVDS DTD",
+		.dump = dump_sdvo_lvds_dtd,
+	},
+	{
+		.id = BDB_EDP,
+		.name = "eDP block",
+		.dump = dump_edp,
+	},
 	{
 		.id = BDB_LFP_OPTIONS,
 		.name = "LFP options block",
@@ -2696,32 +2722,6 @@ struct dumper dumpers[] = {
 		.name = "LFP power conservation features block",
 		.dump = dump_lfp_power,
 	},
-	{
-		.id = BDB_SDVO_LVDS_OPTIONS,
-		.name = "SDVO LVDS options block",
-		.dump = dump_sdvo_lvds_options,
-	},
-	{
-		.id = BDB_SDVO_LVDS_DTD,
-		.name = "SDVO LVDS DTD",
-		.dump = dump_sdvo_lvds_dtd,
-	},
-	{
-		.id = BDB_DRIVER_FEATURES,
-		.name = "Driver feature data block",
-		.dump = dump_driver_feature,
-	},
-	{
-		.id = BDB_EDP,
-		.name = "eDP block",
-		.dump = dump_edp,
-	},
-	{
-		.id = BDB_PSR,
-		.min_bdb_version = 165,
-		.name = "PSR block",
-		.dump = dump_psr,
-	},
 	{
 		.id = BDB_MIPI_CONFIG,
 		.name = "MIPI configuration block",
-- 
2.44.1

