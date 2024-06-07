Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3354AC27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 13:58:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F0210EC73;
	Fri,  7 Jun 2024 13:58:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PFK/tuQl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D1D10EC73
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 13:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717768693; x=1749304693;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=4HW2JVpc4IeMNe/BVGZ4jc0X0iRZR4edlInUL+WirPw=;
 b=PFK/tuQl0w+06p/ZjxIWkYm9n17icb2pr2qx5UVx2MYqRVVS2o+6gNqi
 Ag7Aq8/9aOdqNTKfQhRx7M4w0z5KA2bPPqVrbe7IOK9VfLt4b2z3tNb4o
 Yjo7vByDIqMk7+bz/rVRnWEYN031lZ8zfJyPdOv+vAsLWtGh7RS91EOtu
 +h0xPn25siUp+5vkpC1mnpGn+skzEe6GBmuw7Rkp+ntJOw0D9jQRXB6f7
 Zhu2XQAf6OSFWGLvdzrnciwqLzW0C2JBKVznuIGc3Zh57vQaEY85K+VE+
 Pi5RkykF9DLmJPtz+p90ZmXDCbo58741Vz4klZ6P9yhwotH+izHq7fheK w==;
X-CSE-ConnectionGUID: lHM1WT3aSB2AiPBSPrgzwg==
X-CSE-MsgGUID: 3ZxXnKQARP2ImDfQAw9wEg==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25116774"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25116774"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 06:58:13 -0700
X-CSE-ConnectionGUID: LjMVXOfCS3Gm7QBXq/ayEA==
X-CSE-MsgGUID: t6mxtfg4S5aFHNEoWjY9Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38323743"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 07 Jun 2024 06:58:11 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Jun 2024 16:58:10 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 04/27] tools/intel_vbt_decode: Decode block 3 (Display
 Toggle Option)
Date: Fri,  7 Jun 2024 16:57:35 +0300
Message-ID: <20240607135758.31421-5-ville.syrjala@linux.intel.com>
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

Decode VBT block 3 (Display Toggle Option).

On ALM the block appears to contain some kind of actual toggle
list of child devices, on all more modern machines it just has
the feature bits.

Example output from ALM:
BDB block 3 (27 bytes, min 3 bytes) - Display toggle option block:
        0000: 03 1b 00 00 0c 00 08 00  01 00 09 00 02 00 00 00
        0010: 00 00 00 00 00 00 00 00  00 00 00 00 00 00

        Feature bits: 0x00
        Num entries: 12
        Toggle list #1: LFP1 (0x0008)
        Toggle list #2: CRT (0x0001)
        Toggle list #3: CRT,LFP1 (0x0009)
        Toggle list #4: TV (0x0002)
        Toggle list #5: none (0x0000)
        Toggle list #6: none (0x0000)
        Toggle list #7: none (0x0000)
        Toggle list #8: none (0x0000)
        Toggle list #9: none (0x0000)
        Toggle list #10: none (0x0000)
        Toggle list #11: none (0x0000)
        Toggle list #12: none (0x0000)

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index cee1d5196a9a..4281bd7e520e 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -316,6 +316,8 @@ static size_t block_min_size(const struct context *context, int section_id)
 		return sizeof(struct bdb_general_features);
 	case BDB_GENERAL_DEFINITIONS:
 		return sizeof(struct bdb_general_definitions);
+	case BDB_DISPLAY_TOGGLE:
+		return sizeof(struct bdb_display_toggle);
 	case BDB_PSR:
 		return sizeof(struct bdb_psr);
 	case BDB_CHILD_DEVICE_TABLE:
@@ -1249,6 +1251,20 @@ static void dump_general_definitions(struct context *context,
 			   child_dev_num, defs->child_dev_size);
 }
 
+static void dump_display_toggle(struct context *context,
+				const struct bdb_block *block)
+{
+	const struct bdb_display_toggle *t = block_data(block);
+
+	printf("\tFeature bits: 0x%02x\n", t->feature_bits);
+	printf("\tNum entries: %d\n", t->num_entries);
+
+	for (int i = 0 ; i < t->num_entries; i++)
+		printf("\tToggle list #%d: %s (0x%04x)\n",
+		       i+1, child_device_handle(context, t->list[i]),
+		       t->list[i]);
+}
+
 static void dump_legacy_child_devices(struct context *context,
 				      const struct bdb_block *block)
 {
@@ -2727,6 +2743,11 @@ struct dumper dumpers[] = {
 		.name = "General definitions block",
 		.dump = dump_general_definitions,
 	},
+	{
+		.id = BDB_DISPLAY_TOGGLE,
+		.name = "Display toggle option block",
+		.dump = dump_display_toggle,
+	},
 	{
 		.id = BDB_PSR,
 		.min_bdb_version = 165,
-- 
2.44.2

