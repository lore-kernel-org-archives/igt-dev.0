Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E548C27C5F
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 13:58:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F36610EC76;
	Fri,  7 Jun 2024 13:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G5Jda2t/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F43A10EC74
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 13:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717768729; x=1749304729;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=83fT/8qQVHPvk2+lwkmIkMgAnkOgGLrVG41wylZT/Gg=;
 b=G5Jda2t/iTL4h4u7NOKW4XixMvPsOkRHks6VxuFO+C8OyWz75mpzYeqm
 jpH7L49esouZULrSLrn+20emCUp7FzXqhj/wLO4u9PcxojJizOxUi1bIq
 WJWYKZbKHE0Vd3BGN0l/YZmjVbCRnLq6MXPwXM3wAme8GqHFwwUQ4f718
 2ra3myy/1Edz4mgziY6WX+F2YmkB17vDsCpBP/tDSbGRkG+yOzBQnf7Oa
 0lNqVX7ji2mvL95zH5Y6K2UAy0hLw+2081yq5C/IBhqet3XdT0gIyGP/E
 2oI709WUPNcab6okgLmoV3zXQjBfazGaecJlMR5YpYnbmNZGcSMSJ2NaC A==;
X-CSE-ConnectionGUID: R6bl2lgNSL+4z36Yo9KmcA==
X-CSE-MsgGUID: maYsjnu7SMqpZ4D8gXnazg==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25116802"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25116802"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 06:58:49 -0700
X-CSE-ConnectionGUID: 7BViPG3/SUyIs3N2PKQt/g==
X-CSE-MsgGUID: qVadpB5PSX+APIoSAW3XEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38323841"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 07 Jun 2024 06:58:47 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Jun 2024 16:58:46 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 17/27] tools/intel_vbt_decode: Decode block 25 (SDVO
 LVDS PPS)
Date: Fri,  7 Jun 2024 16:57:48 +0300
Message-ID: <20240607135758.31421-18-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240607135758.31421-1-ville.syrjala@linux.intel.com>
References: <20240607135758.31421-1-ville.syrjala@linux.intel.com>
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

Decode VBT block 25 (SDVO LVDS PPS). Four sets (one for each SDVO
panel type) of power sequencing delays.

Example output from CST:
BDB block 25 (40 bytes, min 40 bytes) - SDVO LVDS PPS:
        0000: 19 28 00 19 00 fa 00 fa  00 19 00 90 01 20 00 20
        0010: 00 20 00 20 00 c8 00 40  00 40 00 40 00 40 00 2c
        0020: 01 40 00 40 00 40 00 40  00 2c 01

        SDVO Panel 0
                T0: 25 ms
                T1: 250 ms
                T2: 250 ms
                T3: 25 ms
                T4: 400 ms
        ...
        SDVO Panel 3 (*)
                T0: 64 ms
                T1: 64 ms
                T2: 64 ms
                T3: 64 ms
                T4: 300 ms

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 54b25f6d2418..d5c6a225b3df 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -356,6 +356,8 @@ static size_t block_min_size(const struct context *context, int section_id)
 		return sizeof(struct bdb_sdvo_lvds_dtd);
 	case BDB_SDVO_LVDS_PNP_ID:
 		return sizeof(struct bdb_sdvo_lvds_pnp_id);
+	case BDB_SDVO_LVDS_PPS:
+		return sizeof(struct bdb_sdvo_lvds_pps);
 	case BDB_EDP:
 		return sizeof(struct bdb_edp);
 	case BDB_DISPLAY_SELECT_IVB:
@@ -2600,6 +2602,21 @@ static void dump_sdvo_lvds_pnp_id(struct context *context,
 	}
 }
 
+static void dump_sdvo_lvds_pps(struct context *context,
+			       const struct bdb_block *block)
+{
+	const struct bdb_sdvo_lvds_pps *t = block_data(block);
+
+	for (int n = 0; n < ARRAY_SIZE(t->pps); n++) {
+		printf("\tSDVO Panel %d%s\n", n, sdvo_panel_str(context, n));
+		printf("\t\tT0: %d ms\n", t->pps[n].t0);
+		printf("\t\tT1: %d ms\n", t->pps[n].t1);
+		printf("\t\tT2: %d ms\n", t->pps[n].t2);
+		printf("\t\tT3: %d ms\n", t->pps[n].t3);
+		printf("\t\tT4: %d ms\n", t->pps[n].t4);
+	}
+}
+
 static void dump_sdvo_lvds_options(struct context *context,
 				   const struct bdb_block *block)
 {
@@ -3446,6 +3463,11 @@ struct dumper dumpers[] = {
 		.name = "SDVO LVDS PnP ID",
 		.dump = dump_sdvo_lvds_pnp_id
 	},
+	{
+		.id = BDB_SDVO_LVDS_PPS,
+		.name = "SDVO LVDS PPS",
+		.dump = dump_sdvo_lvds_pps,
+	},
 	{
 		.id = BDB_EDP,
 		.name = "eDP block",
-- 
2.44.2

