Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBE0C27C6E
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 13:58:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D828E10EC6F;
	Fri,  7 Jun 2024 13:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BdGBnI57";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D6F10EC6F
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 13:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717768724; x=1749304724;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=OFQtZcVRrz+1mqQVs435RuL8kq5InarXoGG49EQFN/o=;
 b=BdGBnI57nzzBBfsVZWhnyxZV3/vIGLYj7nkt91kXDQzIlr7n2x5ULu7W
 UYX6LqDLSq4VF/pGKoS68JO8li+a8x3neHk2VTClyFqkWTxHDGipPHlLg
 +suxEjHdShvoa5unb7nR9vHVjKiEBgZET5WV8alo90GUTlq9yc3UlK2iF
 L4fuXGhXaShp1SZDa4kf1h5WEIV8onl50wOSZHWhL+nCWv9rZi0XzTqjx
 6lBMD08A3Vu7Km6zWKskjvxmEFabmZidO67QdGIpy9QAD1xbY/uWzOfKf
 1s018yXvlixDNo8JaOlHjNe7tgu99tM8VV2FfiNzIh2+POLF2tYyfq967 w==;
X-CSE-ConnectionGUID: YOilhxlnR+29bBLVXAzORA==
X-CSE-MsgGUID: 6N0xZGQARCK0GzZwm7A8yA==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25116794"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25116794"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 06:58:44 -0700
X-CSE-ConnectionGUID: Uu1OYXWuTXS0Jt8eWp/fsw==
X-CSE-MsgGUID: 1FtR15v7Rxq75aPekBF9Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38323832"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 07 Jun 2024 06:58:42 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Jun 2024 16:58:41 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 15/27] tools/intel_vbt_decode: Decode block 21 (EFP List)
Date: Fri,  7 Jun 2024 16:57:46 +0300
Message-ID: <20240607135758.31421-16-ville.syrjala@linux.intel.com>
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

Decode VBT block 21 (EFP List). No specs, but real world data
suggets this just has a bunhc of partial PnP IDs in it.

Example output from ALV:
BDB block 21 (42 bytes, min 2 bytes) - EFP list:
        0000: 15 2a 00 0a 04 5a 63 04  54 5a 63 17 75 24 4d 03
        0010: 1a 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
        0020: 00 00 00 00 00 00 00 00  00 00 00 00 00

        Entry size: 4
        Num entries: 10
        EFP #1:
                Mfg name: VSC (0x635a)
                Product code: 21508
        EFP #2:
                Mfg name: VSC (0x635a)
                Product code: 29975
        EFP #3:
                Mfg name: IBM (0x4d24)
                Product code: 6659
        EFP #4:
                Mfg name: @@@ (0x0)
                Product code: 0
        ...
        EFP #10:
                Mfg name: @@@ (0x0)
                Product code: 0

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 49a5da547e7a..1bbbcf499f6e 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -348,6 +348,8 @@ static size_t block_min_size(const struct context *context, int section_id)
 		return sizeof(struct bdb_display_remove_old);
 	case BDB_OEM_CUSTOM:
 		return sizeof(struct bdb_oem_custom);
+	case BDB_EFP_LIST:
+		return sizeof(struct bdb_efp_list);
 	case BDB_SDVO_LVDS_OPTIONS:
 		return sizeof(struct bdb_sdvo_lvds_options);
 	case BDB_SDVO_LVDS_DTD:
@@ -2262,6 +2264,32 @@ static void dump_oem_custom(struct context *context,
 	}
 }
 
+static void dump_efp_list(struct context *context,
+			  const struct bdb_block *block)
+{
+	const struct bdb_efp_list *list = block_data(block);
+
+	printf("\tEntry size: %d\n", list->entry_size);
+	printf("\tNum entries: %d\n", list->num_entries);
+
+	if (sizeof(list->efp[0]) != list->entry_size) {
+		printf("\tEFP struct sizes don't match (expected %zu, got %u), skipping\n",
+		       sizeof(list->efp[0]), list->entry_size);
+		return;
+	}
+
+	for (int i = 0; i < list->num_entries; i++) {
+		char mfg[4];
+
+		printf("\tEFP #%d:\n", i + 1);
+		printf("\t\tMfg name: %s (0x%x)\n",
+		       decode_pnp_id(list->efp[i].mfg_name, mfg),
+		       list->efp[i].mfg_name);
+		printf("\t\tProduct code: %u\n",
+		       list->efp[i].product_code);
+	}
+}
+
 static void dump_edp(struct context *context,
 		     const struct bdb_block *block)
 {
@@ -3385,6 +3413,11 @@ struct dumper dumpers[] = {
 		.name = "OEM customizable modes",
 		.dump = dump_oem_custom,
 	},
+	{
+		.id = BDB_EFP_LIST,
+		.name = "EFP list",
+		.dump = dump_efp_list,
+	},
 	{
 		.id = BDB_SDVO_LVDS_OPTIONS,
 		.name = "SDVO LVDS options block",
-- 
2.44.2

