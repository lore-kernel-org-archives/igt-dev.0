Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34B1C27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 13:58:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C6210EC77;
	Fri,  7 Jun 2024 13:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jL+CVcCu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA0D10EC77
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 13:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717768712; x=1749304712;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=odHqSn7eEtUvTbfuHtlLSha4EDicVvAs3HMGClJPTPA=;
 b=jL+CVcCuc58bxqJ7wj9qNBAgqicxoN1hMuqcYlQppxCaU4D6wfrpSvAD
 j9wnnxNuLlJKbNr635CrefiwYundklu9h2rICbMygc1ypEovwKJHuyEdr
 MlPl2p/l9WzpPPs040qyh7EQ4JvkoAkEBn5nrQk3IkcUebGg2B3ZcRUsF
 t6jqcUGkrfxPAYWNb8MlsB1VWya72na3rd/Jlh3zgMj1TeYp8g9Ii2ASu
 JPmh3xWQqMQH4FvNcJsIv08HQlL5ygtBdeXXNuuh1jt/80djFapVGFQBC
 Iw7r7tXsUxAgCLvv30LJ1WKSNffpOD1+L0iEwtScD55KEFRtokOrSILpS A==;
X-CSE-ConnectionGUID: Io1VFKxdSxyQ1vjw3tiKjQ==
X-CSE-MsgGUID: NkXT1vQWRl2m3cP5niCi5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25116785"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25116785"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 06:58:32 -0700
X-CSE-ConnectionGUID: R+rbgtESTIes7E1sz7Jg4g==
X-CSE-MsgGUID: PxDROhrVQGuvWP9INIB9iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38323795"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 07 Jun 2024 06:58:31 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Jun 2024 16:58:29 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 11/27] tools/intel_vbt_decode: Decode blocks 16, 29,
 31 (Toggle List)
Date: Fri,  7 Jun 2024 16:57:42 +0300
Message-ID: <20240607135758.31421-12-ville.syrjala@linux.intel.com>
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

Decode VBT blocks 16,29,31 (Toggle List). There are three variants:
pre-IVB/IVB/HSW+ each of which define the device handle bitmasks
in slightly different ways.

Block 31 example output from HSW:
BDB block 31 (92 bytes, min 12 bytes) - Display toggle list (HSW+):
        0000: 1f 5c 00 10 00 02 01 00  09 00 08 00 02 00 05 00
        0010: 04 00 0c 00 40 00 44 00  48 00 41 00 00 00 00 00
        0020: 00 00 00 00 00 00 08 00  02 01 00 21 00 41 00 48
        0030: 00 08 00 04 00 0c 00 40  00 08 00 02 01 00 48 00
        0040: 44 00 60 00 24 00 28 00  20 00 40 00 08 00 02 01
        0050: 00 04 00 08 00 40 00 20  00 09 00 28 00 05 00

        Toggle list #1
                Num entries: 16
                Entry size: 2

                Entry #1:
                        Display select: CRT (0x0001)
                ...
                Entry #16:
                        Display select: none (0x0000)
        ...
        Toggle list #4
                Num entries: 8
                Entry size: 2

                Entry #1:
                        Display select: CRT (0x0001)
                ...
                Entry #8:
                        Display select: CRT,EFP1 (0x0005)

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 119 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 5c334c902966..bff6177e27c6 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -340,12 +340,18 @@ static size_t block_min_size(const struct context *context, int section_id)
 		return sizeof(struct bdb_driver_persistence);
 	case BDB_DOT_CLOCK_OVERRIDE:
 		return sizeof(struct bdb_dot_clock_override);
+	case BDB_DISPLAY_SELECT_OLD:
+		return sizeof(struct bdb_display_select_old);
 	case BDB_SDVO_LVDS_OPTIONS:
 		return sizeof(struct bdb_sdvo_lvds_options);
 	case BDB_SDVO_LVDS_DTD:
 		return sizeof(struct bdb_sdvo_lvds_dtd);
 	case BDB_EDP:
 		return sizeof(struct bdb_edp);
+	case BDB_DISPLAY_SELECT_IVB:
+		return sizeof(struct bdb_display_select_ivb);
+	case BDB_DISPLAY_SELECT_HSW:
+		return sizeof(struct bdb_display_select_hsw);
 	case BDB_LFP_OPTIONS:
 		return sizeof(struct bdb_lfp_options);
 	case BDB_LFP_DATA_PTRS:
@@ -2029,6 +2035,104 @@ static void dump_dot_clock_override(struct context *context,
 	_dump_dot_clock_override(d, count, true);
 }
 
+static void dump_display_select_old(struct context *context,
+				    const struct bdb_block *block)
+{
+	const void *data = block_data(block);
+	int offset = 0;
+
+	for (int n = 0; n < 4; n++) {
+		const struct toggle_list_table_old *t = data + offset;
+
+		offset += sizeof(*t) + t->num_entries * t->entry_size;
+
+		printf("\tToggle list #%d\n", n+1);
+
+		printf("\t\tNum entries: %d\n", t->num_entries);
+		printf("\t\tEntry size: %d\n\n", t->entry_size);
+
+		if (sizeof(t->list[0]) != t->entry_size) {
+			printf("\t\tstruct doesn't match (expected %zu, got %u), skipping\n",
+			       sizeof(t->list[0]), t->entry_size);
+			continue;
+		}
+
+		for (int i = 0 ; i < t->num_entries; i++) {
+			printf("\t\tEntry #%d:\n", i + 1);
+			printf("\t\t\tDisplay select pipe A: %s (0x%02x)\n",
+			       child_device_handle(context, t->list[i].display_select_pipe_a),
+			       t->list[i].display_select_pipe_a);
+			printf("\t\t\tDisplay select pipe B: %s (0x%02x)\n",
+			       child_device_handle(context, t->list[i].display_select_pipe_b),
+			       t->list[i].display_select_pipe_b);
+			printf("\t\t\tCapabilities: 0x%02x\n",
+			       t->list[i].caps);
+		}
+	}
+}
+
+static void dump_display_select_ivb(struct context *context,
+				    const struct bdb_block *block)
+{
+	const void *data = block_data(block);
+	int offset = 0;
+
+	for (int n = 0; n < 4; n++) {
+		const struct toggle_list_table_ivb *t = data + offset;
+
+		offset += sizeof(*t) + t->num_entries * t->entry_size;
+
+		printf("\tToggle list #%d\n", n+1);
+
+		printf("\t\tNum entries: %d\n", t->num_entries);
+		printf("\t\tEntry size: %d\n\n", t->entry_size);
+
+		if (sizeof(t->list[0]) != t->entry_size) {
+			printf("\t\tstruct doesn't match (expected %zu, got %u), skipping\n",
+			       sizeof(t->list[0]), t->entry_size);
+			continue;
+		}
+
+		for (int i = 0 ; i < t->num_entries; i++) {
+			printf("\t\tEntry #%d:\n", i + 1);
+			printf("\t\t\tDisplay select: %s (0x%02x)\n",
+			       child_device_handle(context, t->list[i].display_select),
+			       t->list[i].display_select);
+		}
+	}
+}
+
+static void dump_display_select_hsw(struct context *context,
+				    const struct bdb_block *block)
+{
+	const void *data = block_data(block);
+	int offset = 0;
+
+	for (int n = 0; n < 4; n++) {
+		const struct toggle_list_table_hsw *t = data + offset;
+
+		offset += sizeof(*t) + t->num_entries * t->entry_size;
+
+		printf("\tToggle list #%d\n", n+1);
+
+		printf("\t\tNum entries: %d\n", t->num_entries);
+		printf("\t\tEntry size: %d\n\n", t->entry_size);
+
+		if (sizeof(t->list[0]) != t->entry_size) {
+			printf("\t\tstruct doesn't match (expected %zu, got %u), skipping\n",
+			       sizeof(t->list[0]), t->entry_size);
+			continue;
+		}
+
+		for (int i = 0 ; i < t->num_entries; i++) {
+			printf("\t\tEntry #%d:\n", i + 1);
+			printf("\t\t\tDisplay select: %s (0x%04x)\n",
+			       child_device_handle(context, t->list[i].display_select),
+			       t->list[i].display_select);
+		}
+	}
+}
+
 static void dump_edp(struct context *context,
 		     const struct bdb_block *block)
 {
@@ -3132,6 +3236,11 @@ struct dumper dumpers[] = {
 		.name = "Dot clock override",
 		.dump = dump_dot_clock_override,
 	},
+	{
+		.id = BDB_DISPLAY_SELECT_OLD,
+		.name = "Toggle list block (pre-IVB)",
+		.dump = dump_display_select_old,
+	},
 	{
 		.id = BDB_SDVO_LVDS_OPTIONS,
 		.name = "SDVO LVDS options block",
@@ -3147,6 +3256,16 @@ struct dumper dumpers[] = {
 		.name = "eDP block",
 		.dump = dump_edp,
 	},
+	{
+		.id = BDB_DISPLAY_SELECT_IVB,
+		.name = "Display toggle list (IVB)",
+		.dump = dump_display_select_ivb,
+	},
+	{
+		.id = BDB_DISPLAY_SELECT_HSW,
+		.name = "Display toggle list (HSW+)",
+		.dump = dump_display_select_hsw,
+	},
 	{
 		.id = BDB_LFP_OPTIONS,
 		.name = "LFP options block",
-- 
2.44.2

