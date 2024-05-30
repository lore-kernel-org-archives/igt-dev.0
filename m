Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9EFC27C43
	for <igt-dev@archiver.kernel.org>; Thu, 30 May 2024 15:26:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336AC10ED01;
	Thu, 30 May 2024 15:26:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d+QGX6XM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10DDD10F346
 for <igt-dev@lists.freedesktop.org>; Thu, 30 May 2024 15:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717082792; x=1748618792;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D48ygl3jaLhsDiX+jXeEPmXtAD6qzCmAQxf46OM5YYw=;
 b=d+QGX6XMtxfu5UHwy6K653Cx9JZGAkb2L2/MP3lXJCNlRfAaeLoL1sv1
 Z4Hsq4Ip3KH2333481tMYfH7RaV+KLCjCfaPnzz4BweCn764QSTMyI17t
 jjZ4dmQLZoJeyIReWNPZ/S9lEkRirgS1xZTRosFpchDmli1DTDqD9sR+1
 MgbOOQF2lPWo6qEHwxA2FiFRefp3L8mowqbqdf4/n5qIYuT3RsKv2F1Rn
 d49oV2Dt3kd4rft2wPdTKqmDvmNkgE2F/omA+KaXzTyajMBQ8y19UjbBy
 QHQEE0WPIO9YRa3b5g/7CvFaMgO16niuCnBcNGUpbTTS26QXhc2JYqAf/ Q==;
X-CSE-ConnectionGUID: RxPMvtY1SwuOgIKsu0xyQg==
X-CSE-MsgGUID: myRPBWsBSPaoYfMx54QvYA==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="17372956"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="17372956"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 08:26:32 -0700
X-CSE-ConnectionGUID: Rix0+ENrSGG90F/tm1sCVA==
X-CSE-MsgGUID: IxTSPpU4QPOoKZy6WCOjtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="35836838"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 08:26:30 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 4/5] tools/intel_vbt_decode: sync intel_vbt_defs.h with
 kernel commit 8e26690851f9
Date: Thu, 30 May 2024 18:26:07 +0300
Message-Id: <62267def0d94661ab6212345afe1c3f661e555aa.1717082630.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1717082630.git.jani.nikula@intel.com>
References: <cover.1717082630.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Synchronize intel_vbt_defs.h with kernel commit:

8e26690851f9 ("drm/i915/bios: Rename SDVO DTD blocks a bit")

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tools/intel_vbt_decode.c |  4 ++--
 tools/intel_vbt_defs.h   | 12 ++++++------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index bcec7eb54503..6b63bcf0bc7c 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -326,7 +326,7 @@ static size_t block_min_size(const struct context *context, int section_id)
 		return sizeof(struct bdb_driver_features);
 	case BDB_SDVO_LVDS_OPTIONS:
 		return sizeof(struct bdb_sdvo_lvds_options);
-	case BDB_SDVO_PANEL_DTDS:
+	case BDB_SDVO_LVDS_DTD:
 		/* FIXME? */
 		return 0;
 	case BDB_EDP:
@@ -2723,7 +2723,7 @@ struct dumper dumpers[] = {
 		.dump = dump_sdvo_lvds_options,
 	},
 	{
-		.id = BDB_SDVO_PANEL_DTDS,
+		.id = BDB_SDVO_LVDS_DTD,
 		.name = "SDVO panel dtds",
 		.dump = dump_sdvo_panel_dtds,
 	},
diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
index c02d808d9e35..038f489d034c 100644
--- a/tools/intel_vbt_defs.h
+++ b/tools/intel_vbt_defs.h
@@ -160,9 +160,9 @@ enum bdb_block_id {
 	BDB_OEM_CUSTOM			= 20,
 	BDB_EFP_LIST			= 21, /* workarounds for VGA hsync/vsync */
 	BDB_SDVO_LVDS_OPTIONS		= 22,
-	BDB_SDVO_PANEL_DTDS		= 23,
-	BDB_SDVO_LVDS_PNP_IDS		= 24,
-	BDB_SDVO_LVDS_POWER_SEQ		= 25,
+	BDB_SDVO_LVDS_DTD		= 23,
+	BDB_SDVO_LVDS_PNP_ID		= 24,
+	BDB_SDVO_LVDS_PPS		= 25,
 	BDB_TV_OPTIONS			= 26,
 	BDB_EDP				= 27,
 	BDB_LFP_OPTIONS			= 40,
@@ -686,11 +686,11 @@ struct bdb_sdvo_lvds_options {
 } __packed;
 
 /*
- * Block 23 - SDVO LVDS Panel DTDs
+ * Block 23 - SDVO LVDS DTD
  */
 
-struct bdb_sdvo_panel_dtds {
-	struct bdb_edid_dtd dtds[4];
+struct bdb_sdvo_lvds_dtd {
+	struct bdb_edid_dtd dtd[4];
 } __packed;
 
 /*
-- 
2.39.2

