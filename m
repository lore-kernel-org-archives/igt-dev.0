Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA915C27C5F
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 13:59:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56E3610EC6F;
	Fri,  7 Jun 2024 13:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SAneGqoS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C469210EC6F
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 13:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717768747; x=1749304747;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=3BJEw2xWJMJaWT0GrDKzkRVZdRBQBTLoKX9x9skyJ3E=;
 b=SAneGqoSh1OhM8eH7y4Q4z0RBbohkf7w/B1OEWUbSC42E3jp4mhUsmYh
 x/epumCjD+lajKnkAuwa/ZIZpwHG0MmfodnJ8afLKSI6S9DGPOaUU4MhD
 csabJBTMVjIgO20ICvE63ZhU9dkQuBShKvLDQc5ofWRnO1u/M6hozvOOn
 bbD0jaZyJ1dzPZXkoJ2I2tJLVWt3eNSayy0nNTXUEfTd7ogzIY1HadhAJ
 0Ay2ubc8LuYFzN/9bv6fu+sK/93DknEcsI86laCO2DO8llWWBvIYdAICl
 QCM/OGSd50TnlxsXUFwwiMUGyM1R3CCf0Yxa4rqJZI1TcxRiJmlXN2l42 A==;
X-CSE-ConnectionGUID: 01wOlNsaSz6mg1yWEeUNiA==
X-CSE-MsgGUID: JuaRkAsuSJe1+9BrEbPNUw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25116828"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25116828"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 06:59:06 -0700
X-CSE-ConnectionGUID: /tiWpQxIQ2yoGThDL6cPLA==
X-CSE-MsgGUID: 9sPb6DRjTjytBletidRaBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38323925"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 07 Jun 2024 06:59:04 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Jun 2024 16:59:03 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 23/27] tools/intel_vbt_decode: Decode block 55 (RGB
 Palette Table)
Date: Fri,  7 Jun 2024 16:57:54 +0300
Message-ID: <20240607135758.31421-24-ville.syrjala@linux.intel.com>
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

Decode VBT block 55 (RGB Palette Table). Just a 256 entry
8bpc LUT.

Thought I had a VBT with this, but can't find it now. So no example
output I'm afraid.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 64 +++++++++++++++++++++++++++-------------
 1 file changed, 43 insertions(+), 21 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index c42585e4ab18..85f31f449130 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -81,6 +81,27 @@ struct edid {
 	/* ... */
 } __packed;
 
+static void hex_dump(const void *data, uint32_t size)
+{
+	int i;
+	const uint8_t *p = data;
+
+	for (i = 0; i < size; i++) {
+		if (i % 16 == 0)
+			printf("\t%04x: ", i);
+		printf("%02x", p[i]);
+		if (i % 16 == 15) {
+			if (i + 1 < size)
+				printf("\n");
+		} else if (i % 8 == 7) {
+			printf("  ");
+		} else {
+			printf(" ");
+		}
+	}
+	printf("\n\n");
+}
+
 static bool dump_panel(const struct context *context, int panel_type)
 {
 	return panel_type == context->panel_type ||
@@ -393,6 +414,8 @@ static size_t block_min_size(const struct context *context, int section_id)
 		return sizeof(struct bdb_mipi_config);
 	case BDB_MIPI_SEQUENCE:
 		return sizeof(struct bdb_mipi_sequence);
+	case BDB_RGB_PALETTE:
+		return sizeof(struct bdb_rgb_palette);
 	case BDB_COMPRESSION_PARAMETERS:
 		return sizeof(struct bdb_compression_parameters);
 	case BDB_GENERIC_DTD:
@@ -3294,6 +3317,21 @@ static void dump_mipi_sequence(struct context *context,
 	}
 }
 
+static void dump_rgb_palette(struct context *context,
+			     const struct bdb_block *block)
+{
+	const struct bdb_rgb_palette *pal = block_data(block);
+
+	printf("\tIs enabled: %s (0x%02x)\n", YESNO(pal->is_enabled), pal->is_enabled);
+
+	printf("\tRed:\n");
+	hex_dump(pal->red, sizeof(pal->red));
+	printf("\tGreen:\n");
+	hex_dump(pal->green, sizeof(pal->green));
+	printf("\tBlue:\n");
+	hex_dump(pal->blue, sizeof(pal->blue));
+}
+
 #define KB(x) ((x) * 1024)
 
 static int dsc_buffer_block_size(u8 buffer_block_size)
@@ -3713,6 +3751,11 @@ struct dumper dumpers[] = {
 		.name = "MIPI sequence block",
 		.dump = dump_mipi_sequence,
 	},
+	{
+		.id = BDB_RGB_PALETTE,
+		.name = "RGB palette",
+		.dump = dump_rgb_palette,
+	},
 	{
 		.id = BDB_COMPRESSION_PARAMETERS,
 		.name = "Compression parameters block",
@@ -3720,27 +3763,6 @@ struct dumper dumpers[] = {
 	},
 };
 
-static void hex_dump(const void *data, uint32_t size)
-{
-	int i;
-	const uint8_t *p = data;
-
-	for (i = 0; i < size; i++) {
-		if (i % 16 == 0)
-			printf("\t%04x: ", i);
-		printf("%02x", p[i]);
-		if (i % 16 == 15) {
-			if (i + 1 < size)
-				printf("\n");
-		} else if (i % 8 == 7) {
-			printf("  ");
-		} else {
-			printf(" ");
-		}
-	}
-	printf("\n\n");
-}
-
 static void hex_dump_block(const struct bdb_block *block)
 {
 	hex_dump(block->data, 3 + block->size);
-- 
2.44.2

