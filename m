Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8545FC27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 13:58:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 468B210EC70;
	Fri,  7 Jun 2024 13:58:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aU4mlMY9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D66A10EC70
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 13:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717768726; x=1749304726;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=vqzQ00Ett0NOX7WVdHnobaAHTna9Q2usbER7TEnTMe8=;
 b=aU4mlMY97Nv6yOcyK5FS0Va9oPNZ7lIZPGQkodM+dS9tcAteBnrT2Lr8
 eVExnsXeY/PZix8yyIhQP3ttVBBafOrNEW9KVwFPZBND4SBuPLdgT8eQO
 DTVaj9EvcGeqF3mUmULZHkzyf0Hck8bgob9jPV7SAavw7CgW3fS8xSAoc
 yclCEA88QAIJz5HdniZcJJUpsZ/f5Yf4w7wUy2NE5De2QirePa+YJgog4
 SJ4wWY9MwyBflaHN/LT+sRLxq2+awv7p3KCdLLCGeVJBxSZD/s65ApFGc
 X8NRzI5ClhdoHGHdn53mg7t1zCWBYnsQ5M3VD4gJ41mSFFA95WuXW0p4L w==;
X-CSE-ConnectionGUID: RZfZ89wSSquqK96SaG7Emg==
X-CSE-MsgGUID: abl3TcrWRcWwHQyCCouEZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25116798"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25116798"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 06:58:46 -0700
X-CSE-ConnectionGUID: 3CECR3F+Sx+dE84IWLpDhg==
X-CSE-MsgGUID: nGq2xAYORuCrxYlSLYIuAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38323835"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 07 Jun 2024 06:58:45 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Jun 2024 16:58:44 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 16/27] tools/intel_vbt_decode: Decode block 24 (SDVO
 LVDS PnP ID)
Date: Fri,  7 Jun 2024 16:57:47 +0300
Message-ID: <20240607135758.31421-17-ville.syrjala@linux.intel.com>
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

Decode VBT block 24 (SDVO LVDS PnP ID). Just a set of four
PnP IDs (one for each SDVO panel type).

Example output from CST:
BDB block 24 (40 bytes, min 40 bytes) - SDVO LVDS PnP ID:
        0000: 18 28 00 36 7f 03 00 01  00 00 00 00 0c 36 7f 05
        0010: 00 02 00 00 00 00 0c 36  7f 01 90 03 00 00 00 00
        0020: 0c 36 7f 06 00 04 00 00  00 00 0c

        SDVO Panel 0
                  Mfg name: MS_ (0x7f36)
                  Product code: 3
                  Serial: 1
                  Mfg week: 0
                  Mfg year: 2002
        ...
        SDVO Panel 3 (*)
                  Mfg name: MS_ (0x7f36)
                  Product code: 6
                  Serial: 4
                  Mfg week: 0
                  Mfg year: 2002

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 1bbbcf499f6e..54b25f6d2418 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -354,6 +354,8 @@ static size_t block_min_size(const struct context *context, int section_id)
 		return sizeof(struct bdb_sdvo_lvds_options);
 	case BDB_SDVO_LVDS_DTD:
 		return sizeof(struct bdb_sdvo_lvds_dtd);
+	case BDB_SDVO_LVDS_PNP_ID:
+		return sizeof(struct bdb_sdvo_lvds_pnp_id);
 	case BDB_EDP:
 		return sizeof(struct bdb_edp);
 	case BDB_DISPLAY_SELECT_IVB:
@@ -2587,6 +2589,17 @@ static void dump_sdvo_lvds_dtd(struct context *context,
 	}
 }
 
+static void dump_sdvo_lvds_pnp_id(struct context *context,
+				  const struct bdb_block *block)
+{
+	const struct bdb_sdvo_lvds_pnp_id *t = block_data(block);
+
+	for (int n = 0; n < ARRAY_SIZE(t->pnp_id); n++) {
+		printf("\tSDVO Panel %d%s\n", n, sdvo_panel_str(context, n));
+		dump_pnp_id(&t->pnp_id[n]);
+	}
+}
+
 static void dump_sdvo_lvds_options(struct context *context,
 				   const struct bdb_block *block)
 {
@@ -3428,6 +3441,11 @@ struct dumper dumpers[] = {
 		.name = "SDVO LVDS DTD",
 		.dump = dump_sdvo_lvds_dtd,
 	},
+	{
+		.id = BDB_SDVO_LVDS_PNP_ID,
+		.name = "SDVO LVDS PnP ID",
+		.dump = dump_sdvo_lvds_pnp_id
+	},
 	{
 		.id = BDB_EDP,
 		.name = "eDP block",
-- 
2.44.2

