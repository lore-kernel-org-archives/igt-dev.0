Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8FDC27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 13:59:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C2210EC71;
	Fri,  7 Jun 2024 13:59:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DmEUixU0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B9810EC7A
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 13:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717768752; x=1749304752;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=GcHUpNaueqji3Ad/RWAfL0V8hKO8/gHHTR7xbg2hltQ=;
 b=DmEUixU04sw6HuEmAKTh5YS/1JxFmOxsWJiGZBx0sIVdaWQ+DjJvPCiZ
 0+0dPQZ8v9APdKl93sTCeL7oI5fFXkPfN4Asjf1gyaOy9Iu8K8FYxbgyR
 ryr2b+wPJRepTiLSVfvj++iwWopQh1WseeO3d6q/ryBAkD+c3+tPeu3At
 ozjD/ACc1Y4dnFvqtpXh8RauMrIAtrxVLDNai1fENQu7DtMuFt8H5cZUi
 rGMKFgq35t37x8QAc+ocMMO+lTb4TGX0Y0g/Crz8ZWTKaEW4hpIqI+Oi9
 5vxdoDYezwhuZSkhFgLWopCoMp/TW1WxTFL89jchqvFf/ZbOdB13OqMBY g==;
X-CSE-ConnectionGUID: 0NFYyWhOT9m8u5cd6CJZtw==
X-CSE-MsgGUID: NNHBn5h4QMuAqHzETcXwow==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25116831"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25116831"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 06:59:12 -0700
X-CSE-ConnectionGUID: X4Ixt8BiSOaU1Q7r5dh6qQ==
X-CSE-MsgGUID: 0MYttISATOi9IhWFTwg1cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38324001"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 07 Jun 2024 06:59:10 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Jun 2024 16:59:09 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 25/27] tools/intel_vbt_decode: Decode block 58 (Generic
 DTD Block)
Date: Fri,  7 Jun 2024 16:57:56 +0300
Message-ID: <20240607135758.31421-26-ville.syrjala@linux.intel.com>
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

Decode VBT block 58 (Generic DTD Block). Spec says this has max
24 entries (implying it can be variable?), 16 entries for LFPs,
and 8 entries for EFPs.

Example output from ADL:
BDB block 58 (674 bytes, min 2 bytes) - Generic DTD:
        0000: 3a a2 02 1c 00 ee 67 04  00 00 0a 1a 01 52 00 0c
        0010: 00 40 06 52 00 14 00 04  00 f7 00 9a 00 c0 00 00
        0020: 00 d6 6d 02 00 b0 04 8c  00 3c 00 04 00 80 07 3c
        0030: 00 22 00 02 00 88 00 d9  00 c0 00 00 00 e8 fd 00
        ...
        0270: 00 80 02 90 00 08 00 60  00 e0 01 1d 00 02 00 02
        0280: 00 00 00 00 00 c0 00 00  00 5c 62 00 00 80 02 90
        0290: 00 08 00 60 00 e0 01 1d  00 02 00 02 00 00 00 00
        02a0: 00 c0 00 00 00

        Entry size: 28
        Entry #1 (LFP #1): (LFP1)
                hdisplay: 2560
                hsync [2642, 2654] +sync
                htotal: 2842
                vdisplay: 1600
                vsync [1620, 1624] +sync
                vtotal: 1682
                clock: 2887500
        ...
        Entry #24 (EFP #8):
                hdisplay: 640
                hsync [648, 744] +sync
                htotal: 784
                vdisplay: 480
                vsync [482, 484] +sync
                vtotal: 509
                clock: 251800

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 52 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 58bdba0e96d2..83c90083e1b9 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -421,7 +421,6 @@ static size_t block_min_size(const struct context *context, int section_id)
 	case BDB_VSWING_PREEMPH:
 		return sizeof(struct bdb_vswing_preemph);
 	case BDB_GENERIC_DTD:
-		/* FIXME check spec */
 		return sizeof(struct bdb_generic_dtd);
 	default:
 		return 0;
@@ -3449,6 +3448,52 @@ static void dump_vswing_preemphasis(struct context *context,
 	}
 }
 
+static void dump_generic_dtd_entry(const struct generic_dtd_entry *dtd,
+				   const char *prefix)
+{
+	printf("%shdisplay: %d\n", prefix, dtd->hactive);
+	printf("%shsync [%d, %d] %s\n", prefix,
+	       dtd->hactive + dtd->hfront_porch,
+	       dtd->hactive + dtd->hfront_porch + dtd->hsync,
+	       dtd->hsync_positive_polarity ? "+sync" : "-sync");
+	printf("%shtotal: %d\n", prefix, dtd->hactive + dtd->hblank);
+
+	printf("%svdisplay: %d\n", prefix, dtd->vactive);
+	printf("%svsync [%d, %d] %s\n", prefix,
+	       dtd->vactive + dtd->vfront_porch,
+	       dtd->vactive + dtd->vfront_porch + dtd->vsync,
+	       dtd->vsync_positive_polarity ? "+sync" : "-sync");
+	printf("%svtotal: %d\n", prefix, dtd->vactive + dtd->vblank);
+
+	printf("%sclock: %d\n", prefix, dtd->pixel_clock * 10);
+}
+
+static void dump_generic_dtd(struct context *context,
+			     const struct bdb_block *block)
+{
+	const struct bdb_generic_dtd *gdtd = block_data(block);
+	int num_entries;
+
+	if (sizeof(gdtd->dtd[0]) != gdtd->gdtd_size) {
+		printf("\tDTD struct sizes don't match (expected %zu, got %u), skipping\n",
+		       sizeof(gdtd->dtd[0]), gdtd->gdtd_size);
+		return;
+	}
+
+	num_entries = (block->size - sizeof(*gdtd)) / gdtd->gdtd_size;
+
+	printf("\tEntry size: %d\n", gdtd->gdtd_size);
+
+	for (int i = 0; i < num_entries; i++) {
+		if (i < 16 && !dump_panel(context, i))
+			continue;
+
+		printf("\tEntry #%d (%s #%d):%s\n", i+1, i < 16 ? "LFP" : "EFP",
+		       i % 16 + 1, i < 16 ? panel_str(context, i) : "");
+		dump_generic_dtd_entry(&gdtd->dtd[i], "\t\t");
+	}
+}
+
 static int get_panel_type_pnpid(const struct context *context,
 				const char *edid_file)
 {
@@ -3802,6 +3847,11 @@ struct dumper dumpers[] = {
 		.name = "Vswing Preemph",
 		.dump = dump_vswing_preemphasis,
 	},
+	{
+		.id = BDB_GENERIC_DTD,
+		.name = "Generic DTD",
+		.dump = dump_generic_dtd,
+	},
 };
 
 static void hex_dump_block(const struct bdb_block *block)
-- 
2.44.2

