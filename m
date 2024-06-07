Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B73C27C5F
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 13:58:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E0AE10EC71;
	Fri,  7 Jun 2024 13:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ip4Onxr1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1FE10EC71
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 13:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717768715; x=1749304715;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=cPoq6Romx/xiFVq1/ehbgYGYmgXqHd4Z717WH+us6eY=;
 b=ip4Onxr1PtkY6jJCc4av35VZKypHE092a/x3Cv+eybFf0TeUWCp/CyOX
 hrB+0DjpRDLABKvqcD+G3IG+9m9qiC4hK7kCzkxNPLOqdXHsAzJ2uW/+q
 NXGTlYfVRguggbVCyVYCy5GU036tBW4+aJQs+nMoDgNbk+pj4ToYatOmh
 Gv/LOKGwhPuKEg0/Woljch1TMk/UR2FzEvrxoCNqpXDhEogHSem82lqo8
 ZD5jrfLIRSZLD+uc+HgrPmVfJMrjpxkaDqGqvOElQRDb9At7XhTqe4pVG
 I2PuMz7/D3fsO94K9TiZiFzPbdkTZl+xQQZvRwJeXBTpAaexELiEyAlbR g==;
X-CSE-ConnectionGUID: z83IURWaTt62BW1JjjNyIA==
X-CSE-MsgGUID: aZwoyCJTSmi61c9RUdSb7Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25116788"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25116788"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 06:58:35 -0700
X-CSE-ConnectionGUID: Cs6EyZQkTGGaQb4N+fCwbQ==
X-CSE-MsgGUID: C+39vLBASaiAYBQMW4tR6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38323802"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 07 Jun 2024 06:58:33 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Jun 2024 16:58:32 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 12/27] tools/intel_vbt_decode: Decode blocks 19, 30,
 32 (Display Configuration Removal Table)
Date: Fri,  7 Jun 2024 16:57:43 +0300
Message-ID: <20240607135758.31421-13-ville.syrjala@linux.intel.com>
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

Decode VBT blocks 19,30,32 (Display Configuration Removal Table).
There are three variants: pre-IVB/IVB/HSW+ eahc of which define
the device handle bitmasks in slightly different ways.

Unexciting block 32 example output from HSW:
BDB block 32 (32 bytes, min 2 bytes) - Display removal table (HSW+):
        0000: 20 20 00 0f 02 00 00 00  00 00 00 00 00 00 00 00
        0010: 00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
        0020: 00 00 00

        Num entries: 15
        Entry size: 2

        Entry #1:
                        Display select: none (0x0000)
        ...
        Entry #15:
                        Display select: none (0x0000)

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 93 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index bff6177e27c6..38a7343b0c3b 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -342,6 +342,8 @@ static size_t block_min_size(const struct context *context, int section_id)
 		return sizeof(struct bdb_dot_clock_override);
 	case BDB_DISPLAY_SELECT_OLD:
 		return sizeof(struct bdb_display_select_old);
+	case BDB_DISPLAY_REMOVE_OLD:
+		return sizeof(struct bdb_display_remove_old);
 	case BDB_SDVO_LVDS_OPTIONS:
 		return sizeof(struct bdb_sdvo_lvds_options);
 	case BDB_SDVO_LVDS_DTD:
@@ -350,8 +352,12 @@ static size_t block_min_size(const struct context *context, int section_id)
 		return sizeof(struct bdb_edp);
 	case BDB_DISPLAY_SELECT_IVB:
 		return sizeof(struct bdb_display_select_ivb);
+	case BDB_DISPLAY_REMOVE_IVB:
+		return sizeof(struct bdb_display_remove_ivb);
 	case BDB_DISPLAY_SELECT_HSW:
 		return sizeof(struct bdb_display_select_hsw);
+	case BDB_DISPLAY_REMOVE_HSW:
+		return sizeof(struct bdb_display_remove_hsw);
 	case BDB_LFP_OPTIONS:
 		return sizeof(struct bdb_lfp_options);
 	case BDB_LFP_DATA_PTRS:
@@ -2133,6 +2139,78 @@ static void dump_display_select_hsw(struct context *context,
 	}
 }
 
+static void dump_display_remove_old(struct context *context,
+				    const struct bdb_block *block)
+{
+	const struct bdb_display_remove_old *r = block_data(block);
+
+	printf("\tNum entries: %d\n", r->num_entries);
+	printf("\tEntry size: %d\n\n", r->entry_size);
+
+	if (sizeof(r->table[0]) != r->entry_size) {
+		printf("\t\tstruct doesn't match (expected %zu, got %u), skipping\n",
+		       sizeof(r->table[0]), r->entry_size);
+		return;
+	}
+
+	for (int i = 0 ; i < r->num_entries; i++) {
+		printf("\tEntry #%d:\n", i + 1);
+
+		printf("\t\t\tDisplay select pipe A: %s (0x%02x)\n",
+		       child_device_handle(context, r->table[i].display_select_pipe_a),
+		       r->table[i].display_select_pipe_a);
+		printf("\t\t\tDisplay select pipe B: %s (0x%02x)\n",
+		       child_device_handle(context, r->table[i].display_select_pipe_b),
+		       r->table[i].display_select_pipe_b);
+	}
+}
+
+static void dump_display_remove_ivb(struct context *context,
+				    const struct bdb_block *block)
+{
+	const struct bdb_display_remove_ivb *r = block_data(block);
+
+	printf("\tNum entries: %d\n", r->num_entries);
+	printf("\tEntry size: %d\n\n", r->entry_size);
+
+	if (sizeof(r->table[0]) != r->entry_size) {
+		printf("\t\tstruct doesn't match (expected %zu, got %u), skipping\n",
+		       sizeof(r->table[0]), r->entry_size);
+		return;
+	}
+
+	for (int i = 0 ; i < r->num_entries; i++) {
+		printf("\tEntry #%d:\n", i + 1);
+
+		printf("\t\t\tDisplay select: %s (0x%02x)\n",
+		       child_device_handle(context, r->table[i].display_select),
+		       r->table[i].display_select);
+	}
+}
+
+static void dump_display_remove_hsw(struct context *context,
+				    const struct bdb_block *block)
+{
+	const struct bdb_display_remove_hsw *r = block_data(block);
+
+	printf("\tNum entries: %d\n", r->num_entries);
+	printf("\tEntry size: %d\n\n", r->entry_size);
+
+	if (sizeof(r->table[0]) != r->entry_size) {
+		printf("\t\tstruct doesn't match (expected %zu, got %u), skipping\n",
+		       sizeof(r->table[0]), r->entry_size);
+		return;
+	}
+
+	for (int i = 0 ; i < r->num_entries; i++) {
+		printf("\tEntry #%d:\n", i + 1);
+
+		printf("\t\t\tDisplay select: %s (0x%04x)\n",
+		       child_device_handle(context, r->table[i].display_select),
+		       r->table[i].display_select);
+	}
+}
+
 static void dump_edp(struct context *context,
 		     const struct bdb_block *block)
 {
@@ -3241,6 +3319,11 @@ struct dumper dumpers[] = {
 		.name = "Toggle list block (pre-IVB)",
 		.dump = dump_display_select_old,
 	},
+	{
+		.id = BDB_DISPLAY_REMOVE_OLD,
+		.name = "Display remove (pre-IVB)",
+		.dump = dump_display_remove_old,
+	},
 	{
 		.id = BDB_SDVO_LVDS_OPTIONS,
 		.name = "SDVO LVDS options block",
@@ -3261,11 +3344,21 @@ struct dumper dumpers[] = {
 		.name = "Display toggle list (IVB)",
 		.dump = dump_display_select_ivb,
 	},
+	{
+		.id = BDB_DISPLAY_REMOVE_IVB,
+		.name = "Display removal table (IVB)",
+		.dump = dump_display_remove_ivb,
+	},
 	{
 		.id = BDB_DISPLAY_SELECT_HSW,
 		.name = "Display toggle list (HSW+)",
 		.dump = dump_display_select_hsw,
 	},
+	{
+		.id = BDB_DISPLAY_REMOVE_HSW,
+		.name = "Display removal table (HSW+)",
+		.dump = dump_display_remove_hsw,
+	},
 	{
 		.id = BDB_LFP_OPTIONS,
 		.name = "LFP options block",
-- 
2.44.2

