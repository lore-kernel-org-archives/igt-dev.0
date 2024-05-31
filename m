Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2B2C27C4F
	for <igt-dev@archiver.kernel.org>; Fri, 31 May 2024 14:25:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C9FF10E645;
	Fri, 31 May 2024 14:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fpHoDxIM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A32E310E654
 for <igt-dev@lists.freedesktop.org>; Fri, 31 May 2024 14:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717165502; x=1748701502;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Hgm5uwQo7EJAZ96FQY5yl3uMSeEZk9buIogLbFnYDEw=;
 b=fpHoDxIMYjK97zvUYl1w9dFSGKwPr8/O1POgKgyKxkY55CRvRBK5p2+y
 NUD7IDauP6t6pZ7FK8IGOr3UOrQU9wPo61swHlrD+6PrJDwU4x7Aj3eqY
 AzIRa2/m9biNcL2vPeCc+oRfN6QocZPp8cPhZa9i2CmJmeg4+jwMLkGKP
 2GEECChA8ILaXNpeJdCjrpCvJm/A2Ykmocsaf7wXtDTI87abC4Ahi+2/j
 7cM0YRc0Hn/lj0JjIsMxdephtD2Ji9Bg8l65hgfjdxsQLV4tFEJLcBpgY
 q8YnLXjqh5fbbj8DJ+LSAcPOe9EyOFtPddYNcQk4CYVRsOa8W93dgSp+i g==;
X-CSE-ConnectionGUID: 92i2Tce0TK22Kkf18rgZIA==
X-CSE-MsgGUID: t87E39mDRp2P1kLX07o8lA==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="25113704"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="25113704"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 07:24:22 -0700
X-CSE-ConnectionGUID: +4l3Gb6RRq+LUWgW4ePkHQ==
X-CSE-MsgGUID: 1AoFS8x0Q+m18PZLK3qNYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="36160846"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 31 May 2024 07:24:19 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 31 May 2024 17:24:19 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 09/20] tools/intel_vbt_decode: Extract dump_pnp_id()
Date: Fri, 31 May 2024 17:23:43 +0300
Message-ID: <20240531142354.16528-10-ville.syrjala@linux.intel.com>
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

Several different VBT blocks contain PnP IDs. Extract the
helper to dump them out.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 6cf6d471b5e2..2a11490eed22 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -1394,6 +1394,18 @@ static char *decode_pnp_id(u16 mfg_name, char str[4])
 	return str;
 }
 
+static void dump_pnp_id(const struct bdb_edid_pnp_id *pnp_id)
+{
+	char mfg[4];
+
+	printf("\t\t  Mfg name: %s (0x%x)\n",
+	       decode_pnp_id(pnp_id->mfg_name, mfg), pnp_id->mfg_name);
+	printf("\t\t  Product code: %u\n", pnp_id->product_code);
+	printf("\t\t  Serial: %u\n", pnp_id->serial);
+	printf("\t\t  Mfg week: %d\n", pnp_id->mfg_week);
+	printf("\t\t  Mfg year: %d\n", 1990 + pnp_id->mfg_year);
+}
+
 static void dump_lfp_data(struct context *context,
 			  const struct bdb_block *block)
 {
@@ -1419,7 +1431,6 @@ static void dump_lfp_data(struct context *context,
 			block_data(block) + ptrs->ptr[i].panel_pnp_id.offset;
 		const struct bdb_lfp_data_tail *tail =
 			block_data(block) + ptrs->panel_name.offset;
-		char mfg[4];
 
 		if (!dump_panel(context, i))
 			continue;
@@ -1457,12 +1468,7 @@ static void dump_lfp_data(struct context *context,
 		       "BAD!" : "good");
 
 		printf("\t\tPnP ID:\n");
-		printf("\t\t  Mfg name: %s (0x%x)\n",
-		       decode_pnp_id(pnp_id->mfg_name, mfg), pnp_id->mfg_name);
-		printf("\t\t  Product code: %u\n", pnp_id->product_code);
-		printf("\t\t  Serial: %u\n", pnp_id->serial);
-		printf("\t\t  Mfg week: %d\n", pnp_id->mfg_week);
-		printf("\t\t  Mfg year: %d\n", 1990 + pnp_id->mfg_year);
+		dump_pnp_id(pnp_id);
 
 		if (!ptrs->panel_name.table_size)
 			continue;
-- 
2.44.1

