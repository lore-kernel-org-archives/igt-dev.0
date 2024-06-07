Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9606BC27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 13:58:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C7610EC6F;
	Fri,  7 Jun 2024 13:58:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h2yWWlr7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F5110EC6F
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 13:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717768704; x=1749304704;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=05a3nhgqaj+TmJFbtTrT4JVcsEuvjRphlt5o4mlYxjE=;
 b=h2yWWlr7j4FREbsTrRtr6p44JRSt92fJC548cHhZDldEw/faL6ynAYr1
 cRQgqvAXT/n9EuncxA8ITCFVqAzpMkhDWx0K/p9CILcZ07W9fYST2Hg1R
 ozVIdFptaR9QDGcGXPHM2qMAol+Mfm2A9fAkroRyn4bqEmA5Oa1iOQelC
 Ck73e1HC3RhdKX9ilyFMjKJKQMmTyeT3Y+GdgHD38wyqqQzGUMKEOECH2
 n1FZ8zRSxgzMQOg9bId3mcAX3MbtZ0g3hCyKUdfoKd0s58dL27wKp4U5b
 4QPLGkFL+pOzBYhhk5uo0r8z87ZbDAlJ3iiRIVrzIydzudSIN3hNunZv2 g==;
X-CSE-ConnectionGUID: XUZpZDLFREGMgs3AxKOE5A==
X-CSE-MsgGUID: 45vRk6ShSqS/4Qv3JFoPHw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25116780"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25116780"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 06:58:24 -0700
X-CSE-ConnectionGUID: yVJRns5KT8GNrIOYjI/E6Q==
X-CSE-MsgGUID: XCyEsKQ3T9++qT6UZUUWVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38323761"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 07 Jun 2024 06:58:22 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Jun 2024 16:58:21 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 08/27] tools/intel_vbt_decode: Decode block 10 (Mode
 Removal Table)
Date: Fri,  7 Jun 2024 16:57:39 +0300
Message-ID: <20240607135758.31421-9-ville.syrjala@linux.intel.com>
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

Decode VBT block 10 (Mode Removal Table). Early desktop
platforms have a row size of 8 in the table, early mobile
and all modern parts (hsw+ iirc) have 10 byte rows.

Example output from ALM:
BDB block 10 (153 bytes, min 1 bytes) - Mode removal table:
        0000: 0a 99 00 0a 80 04 60 03  ff ff ff ff ff ff 00 05
        0010: d0 02 ff ff ff ff ff ff  00 05 c0 03 ff ff ff ff
        0020: ff ff 40 06 84 03 ff ff  ff ff ff ff 40 07 70 05
        0030: ff ff ff ff ff ff 80 07  38 04 ff ff ff ff ff ff
        0040: 80 07 b0 04 ff ff ff ff  ff ff 80 07 a0 05 ff ff
        0050: ff ff ff ff 00 08 00 06  ff ff ff ff ff ff 00 00
        0060: 00 00 00 00 00 00 ff ff  00 00 00 00 00 00 00 00
        0070: ff ff 00 00 00 00 00 00  00 00 ff ff 00 00 00 00
        0080: 00 00 00 00 ff ff 00 00  00 00 00 00 00 00 ff ff
        0090: 00 00 00 00 00 00 00 00  ff ff 00 00

        Num entries: 15
        Row size: 10
        Entry #1:
                Resolution: 1152x864
                Bits per pixel: 0xff
                Refresh rate: 0xffff
                Removal flags: 0xff
                Panel flags: 0xffff
	...
        Entry #15:
                Resolution: 0x0
                Bits per pixel: 0x00
                Refresh rate: 0x0000
                Removal flags: 0x00
                Panel flags: 0xffff
        Terminator: 0x0000

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 3997c548d041..c5752d3161a3 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -329,6 +329,8 @@ static size_t block_min_size(const struct context *context, int section_id)
 		return sizeof(struct bdb_reg_table);
 	case BDB_PSR:
 		return sizeof(struct bdb_psr);
+	case BDB_MODE_REMOVAL_TABLE:
+		return sizeof(struct bdb_mode_removal);
 	case BDB_CHILD_DEVICE_TABLE:
 		return sizeof(struct bdb_legacy_child_devices);
 	case BDB_DRIVER_FEATURES:
@@ -1399,6 +1401,33 @@ static void dump_reg_table(struct context *context,
 	       *(const uint16_t *)end);
 }
 
+static void dump_mode_removal_table(struct context *context,
+				    const struct bdb_block *block)
+{
+	const struct bdb_mode_removal *r = block_data(block);
+	int num_entries = (block->size - sizeof(*r) - 2) / r->row_size;
+
+	printf("\tNum entries: %d\n", num_entries);
+	printf("\tRow size: %d\n", r->row_size);
+
+	for (int i = 0; i < num_entries; i++) {
+		const struct mode_removal_table *mode =
+			(const void*)&r->modes[0] + i * r->row_size;
+
+		printf("\tEntry #%d:\n", i + 1);
+		printf("\t\tResolution: %dx%d\n", mode->x_res, mode->y_res);
+		printf("\t\tBits per pixel: 0x%02x\n", mode->bpp);
+		printf("\t\tRefresh rate: 0x%04x\n", mode->refresh_rate);
+		printf("\t\tRemoval flags: 0x%02x\n", mode->removal_flags);
+
+		if (r->row_size >= 10)
+			printf("\t\tPanel flags: 0x%04x\n", mode->panel_flags);
+	}
+
+	printf("\tTerminator: 0x%04x\n",
+	       *(const u16*)(block_data(block) + block->size - 2));
+}
+
 static void dump_legacy_child_devices(struct context *context,
 				      const struct bdb_block *block)
 {
@@ -2913,6 +2942,11 @@ struct dumper dumpers[] = {
 		.name = "PSR block",
 		.dump = dump_psr,
 	},
+	{
+		.id = BDB_MODE_REMOVAL_TABLE,
+		.name = "Mode removal table",
+		.dump = dump_mode_removal_table,
+	},
 	{
 		.id = BDB_CHILD_DEVICE_TABLE,
 		.name = "Legacy child devices block",
-- 
2.44.2

