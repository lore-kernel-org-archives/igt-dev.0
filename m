Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E662C27C6E
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 13:58:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D7B10EC75;
	Fri,  7 Jun 2024 13:58:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n6n9Wdb1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D2C410EC75
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 13:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717768698; x=1749304698;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=32FZ7v+pJBU8BpET7M9YfRf4G2DWmhDjvkQ3gZ6/Fmo=;
 b=n6n9Wdb1r+r9MEiJrGuIzuj4zDoejxN9Yz4RVRFy+MEjk2+3/C16gwfa
 wKLzpYAZZJsj3CU3PwbsmpGqWlwmG6WyELjuXzuPWDCP1wZSr0Mi1zwF7
 oz10ruCxV5rJ3foQIo+tL5X9d9WPLuN/lkgRmJP60EqK32dM1rWHU9uIc
 dw2nxx2iiP6izLz99UGpa4lFS8bQHIHgbTweYam4ULpOTcOPUV6LoNIRs
 SKt464dkrVZYW7K5v8JFekJsm9x20/6LkSwCWgEyqjhHI+VgFu/xqAgEV
 PxthrY6Z2o5Uq0ymmyj4vfmCnBfO2jGEji8JuliFSHttDZLjgtitUenFF Q==;
X-CSE-ConnectionGUID: +Wf5GhBUT+ud5KWMrTiD6g==
X-CSE-MsgGUID: 9qm1ykehSgi5DnRoSgwqFA==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25116777"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25116777"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 06:58:18 -0700
X-CSE-ConnectionGUID: Od8yRAjsTE6payAezf0/aw==
X-CSE-MsgGUID: yBP2JsZESV+nxxYdg9ZcBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38323752"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 07 Jun 2024 06:58:16 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Jun 2024 16:58:15 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 06/27] tools/intel_vbt_decode: Decode block 5 (Generic
 Mode Table)
Date: Fri,  7 Jun 2024 16:57:37 +0300
Message-ID: <20240607135758.31421-7-ville.syrjala@linux.intel.com>
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

Decode VBT block 5 (Generic Mode Table). Details were mostly
gleaned from some VBIOS sources.

There are apparently two variants of the block: ALM only
vs. MGM, with mostly the same contents.

Example output from ALM:
BDB block 5 (117 bytes, min 117 bytes) - Generic mode table:
        0000: 05 75 00 00 04 58 02 1e  3c 4b 55 ff 80 24 10 ff
        0010: ff 0c e8 fd 00 00 ff 03  3f 05 ff 03 3f 05 17 04
        0020: 9f 04 57 02 25 03 58 02  24 03 b9 02 c0 02 01 01
        0030: 03 01 06 01 9e 33 01 00  ff 03 1f 05 ff 03 1f 05
        0040: 0f 04 6f 04 57 02 1f 03  58 02 1e 03 b4 02 b8 02
        0050: 02 01 04 01 08 01 24 71  01 00 ff 03 5f 05 ff 03
        0060: 5f 05 2f 04 8f 04 57 02  27 03 58 02 26 03 b4 02
        0070: b8 02 03 01 04 01 09 01

        Resolution: 1024x600
        Color depths: 0x1e
        Refresh rates: 60 75 85 Hz
        Reserved: 0xff
        Text columns: 128
        Text rows: 36
        Font height: 16
        Page size: 0xffff
        Misc: 0x0c
        #1 timings:
                Dotclock: 65000 kHz
                Horizontal active: 1024
                Horizontal total: 1344
                Horizontal blank start: 1024
                Horizontal blank end: 1344
                Horizontal sync start: 1048
                Horizontal sync end: 1184
                Vertical active: 600
                Vertical total: 806
                Vertical blank start: 601
                Vertical blank end: 805
                Vertical sync start: 698
                Vertical sync end: 705
                Watermark for 8 bpp: 1 SW
                Burst length for 8 bpp: 8 SW
                Watermark for 16 bpp: 4 SW
                Burst length for 16 bpp: 8 SW
                Watermark for 32 bpp: 7 SW
                Burst length for 32 bpp: 8 SW
       ...

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 85 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 845f26828c44..829d4c560916 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -320,6 +320,9 @@ static size_t block_min_size(const struct context *context, int section_id)
 		return sizeof(struct bdb_display_toggle);
 	case BDB_MODE_SUPPORT_LIST:
 		return sizeof(struct bdb_mode_support_list);
+	case BDB_GENERIC_MODE_TABLE:
+		return max(sizeof(struct bdb_generic_mode_table_alm),
+			   sizeof(struct bdb_generic_mode_table_mgm));
 	case BDB_PSR:
 		return sizeof(struct bdb_psr);
 	case BDB_CHILD_DEVICE_TABLE:
@@ -1281,6 +1284,83 @@ static void dump_mode_support_list(struct context *context,
 	printf("\tMode list length: %d\n", l->mode_list_length);
 }
 
+static void dump_generic_mode_table_base(const struct generic_mode_table *t)
+{
+	printf("\tResolution: %dx%d\n", t->x_res, t->y_res);
+	printf("\tColor depths: 0x%02x\n", t->color_depths);
+	printf("\tRefresh rates: %d %d %d Hz\n",
+	       t->refresh_rate[0], t->refresh_rate[1], t->refresh_rate[2]);
+	printf("\tReserved: 0x%02x\n", t->reserved);
+	printf("\tText columns: %d\n", t->text_cols);
+	printf("\tText rows: %d\n", t->text_rows);
+	printf("\tFont height: %d\n", t->font_height);
+	printf("\tPage size: 0x%04x\n", t->page_size);
+	printf("\tMisc: 0x%02x\n", t->misc);
+}
+
+static void dump_generic_mode_timings(const struct generic_mode_timings *t)
+{
+	printf("\t\tDotclock: %d kHz\n", t->dotclock_khz);
+	printf("\t\tHorizontal active: %d\n", t->hdisplay+1);
+	printf("\t\tHorizontal total: %d\n", t->htotal+1);
+	printf("\t\tHorizontal blank start: %d\n", t->hblank_start+1);
+	printf("\t\tHorizontal blank end: %d\n", t->hblank_end+1);
+	printf("\t\tHorizontal sync start: %d\n", t->hsync_start+1);
+	printf("\t\tHorizontal sync end: %d\n", t->hsync_end+1);
+	printf("\t\tVertical active: %d\n", t->vdisplay+1);
+	printf("\t\tVertical total: %d\n", t->vtotal+1);
+	printf("\t\tVertical blank start: %d\n", t->vblank_start+1);
+	printf("\t\tVertical blank end: %d\n", t->vblank_end+1);
+	printf("\t\tVertical sync start: %d\n", t->vsync_start+1);
+	printf("\t\tVertical sync end: %d\n", t->vsync_end+1);
+}
+
+static void dump_generic_mode_table_alm(const struct bdb_block *block)
+{
+	const struct bdb_generic_mode_table_alm *t = block_data(block);
+
+	dump_generic_mode_table_base(&t->table);
+
+	for (int i = 0; i < ARRAY_SIZE(t->timings); i++) {
+		printf("\t#%d timings:\n", i+1);
+		dump_generic_mode_timings(&t->timings[i].timings);
+		printf("\t\tWatermark for 8 bpp: %d SW\n", t->timings[i].wm_8bpp);
+		printf("\t\tBurst length for 8 bpp: %d SW\n", 4*(t->timings[i].burst_8bpp+1));
+		printf("\t\tWatermark for 16 bpp: %d SW\n", t->timings[i].wm_16bpp+1);
+		printf("\t\tBurst length for 16 bpp: %d SW\n", 4*(t->timings[i].burst_16bpp+1));
+		printf("\t\tWatermark for 32 bpp: %d SW\n", t->timings[i].wm_32bpp+1);
+		printf("\t\tBurst length for 32 bpp: %d SW\n", 4*(t->timings[i].burst_32bpp+1));
+	}
+}
+
+static void dump_generic_mode_table_mgm(const struct bdb_block *block)
+{
+	const struct bdb_generic_mode_table_mgm *t = block_data(block);
+
+	printf("\tMode flag: 0x%04x\n", t->mode_flag);
+
+	dump_generic_mode_table_base(&t->table);
+
+	for (int i = 0; i < ARRAY_SIZE(t->timings); i++) {
+		printf("\t#%d timings:\n", i+1);
+		dump_generic_mode_timings(&t->timings[i]);
+	}
+}
+
+static void dump_generic_mode_table(struct context *context,
+				    const struct bdb_block *block)
+{
+	/*
+	 * FIXME ALM/105 is showing one layout, MGM/108
+	 * another. Not sure there is actual version
+	 * based cutoff.
+	 */
+	if (context->bdb->version >= 106)
+		dump_generic_mode_table_mgm(block);
+	else
+		dump_generic_mode_table_alm(block);
+}
+
 static void dump_legacy_child_devices(struct context *context,
 				      const struct bdb_block *block)
 {
@@ -2769,6 +2849,11 @@ struct dumper dumpers[] = {
 		.name = "Mode support list",
 		.dump = dump_mode_support_list,
 	},
+	{
+		.id = BDB_GENERIC_MODE_TABLE,
+		.name = "Generic mode table",
+		.dump = dump_generic_mode_table,
+	},
 	{
 		.id = BDB_PSR,
 		.min_bdb_version = 165,
-- 
2.44.2

