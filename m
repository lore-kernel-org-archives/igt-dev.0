Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760A9C27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 13:58:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D15F10EC73;
	Fri,  7 Jun 2024 13:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XYBhQMAQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F281B10EC73
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 13:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717768738; x=1749304738;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=l/AOVCAZgrLkRJAGIWyQXKnNMq+pyuwQ3aZnnCgYplM=;
 b=XYBhQMAQ0dufdPrHgS3JjSwfzAFyzr10v8wofdjpjVP/tL4evN192ZgE
 xrt1Nm47btIp9xrGWDFdjd7XoFHW4cb6ZcB5YlzxWO4DpLyWHHGxmT/5L
 Quu2LqSUZE84YO5xXRVhraWNUW7OG7NHc0gJzQxW6jadjI+DJwHOj3atd
 buIUCLJUJqQ8LzCVy+LmicTQRixT7E1iCo2mlQRx5IKgFF+4o0BQwy196
 mPZ6yr0aG5v+mLDgaRdRSFdeQ6Qy5qaEgPz1x92TiMPk+MYCaxG0j7/t5
 pCqCpoYjQLX1iq5JMeHPHlWOdKZxc081I9CIvPiRlkUWbQp8gZx7zbTqH Q==;
X-CSE-ConnectionGUID: naFBYT3uRo69rs8zj94hwQ==
X-CSE-MsgGUID: Du3T+q9aSIaWXq63xEDRCw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25116818"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25116818"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 06:58:58 -0700
X-CSE-ConnectionGUID: yt2Qre3vRbqLj6YjqYdcoA==
X-CSE-MsgGUID: 8W48xnXiTDOJ9vs5pXihRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38323857"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 07 Jun 2024 06:58:56 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Jun 2024 16:58:55 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 20/27] tools/intel_vbt_decode: Decode block 45 (eDP BFI)
Date: Fri,  7 Jun 2024 16:57:51 +0300
Message-ID: <20240607135758.31421-21-ville.syrjala@linux.intel.com>
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

Decode VBT block 45 (eDP BFI). Haven't actually seen any real
world VBTs with this block.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 75be36e49b3c..4cab0f0e734c 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -382,6 +382,8 @@ static size_t block_min_size(const struct context *context, int section_id)
 		return sizeof(struct bdb_lfp_backlight);
 	case BDB_LFP_POWER:
 		return sizeof(struct bdb_lfp_power);
+	case BDB_EDP_BFI:
+		return sizeof(struct bdb_edp_bfi);
 	case BDB_MIPI_CONFIG:
 		return sizeof(struct bdb_mipi_config);
 	case BDB_MIPI_SEQUENCE:
@@ -2676,6 +2678,34 @@ static void dump_sdvo_lvds_options(struct context *context,
 	printf("\tmisc[3]: %x\n", options->panel_misc_bits_4);
 }
 
+static void dump_edp_bfi(struct context *context,
+			 const struct bdb_block *block)
+{
+	const struct bdb_edp_bfi *b = block_data(block);
+
+	printf("\tBFI strucure size: %d\n", b->bfi_structure_size);
+
+	if (sizeof(b->bfi[0]) != b->bfi_structure_size) {
+		printf("\tBFI struct sizes don't match (expected %zu, got %u), skipping\n",
+		       sizeof(b->bfi[0]), b->bfi_structure_size);
+		return;
+	}
+
+	for (int i = 0; i < 16; i++) {
+		if (!dump_panel(context, i))
+			continue;
+
+		printf("\tPanel %d%s\n", i, panel_str(context, i));
+
+		printf("\t\tEnable brightness control in CUI: %s\n",
+		       YESNO(b->bfi[i].enable_brightness_control_in_cui));
+		printf("\t\tEnable BFI in driver: %s\n",
+		       YESNO(b->bfi[i].enable_bfi_in_driver));
+		printf("\t\tBrightness percentage when BFI is disabled: %d\n",
+		       b->bfi[i].brightness_percentage_when_bfi_disabled);
+	}
+}
+
 static void dump_mipi_config(struct context *context,
 			     const struct bdb_block *block)
 {
@@ -3565,6 +3595,11 @@ struct dumper dumpers[] = {
 		.name = "LFP power conservation features block",
 		.dump = dump_lfp_power,
 	},
+	{
+		.id = BDB_EDP_BFI,
+		.name = "eDP BFI",
+		.dump = dump_edp_bfi,
+	},
 	{
 		.id = BDB_MIPI_CONFIG,
 		.name = "MIPI configuration block",
-- 
2.44.2

