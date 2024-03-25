Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB7AC54E58
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 16:36:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD6910E9AB;
	Mon, 25 Mar 2024 16:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="menrU57P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B07A10E9AB
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 16:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711384574; x=1742920574;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RoLqxLs+ySu8RiC2r0vtBtwcRCY4m0zUL73hQxqIXuI=;
 b=menrU57PYTsBxXctyMIBsUpt5tFughbUk209UKvIo3hcK2GDP15B5lKJ
 A5Yco01szx7hOHoSex5auzbSnjbWXgrRPtB8nFUy7olPItfGyc70mgWL/
 uA/aR0mrSm4eFKOG0g9Zym31BN9gisZOqV+RQevi2/c+gOkBx1Amn6jFO
 iQqgajqBfPcZurnCLi05ovZK5ZQdVN3SE5BKkC+dGgHU/ZD4BDOWrH04y
 in9JAP2TSgY40facNBtVCxTLQdquHCT3uF9wMulHen5mWXDu5EfmNGP38
 eSAoQ9Iu+yMo7K2n5UXPpDmRqYlo/db9RBm/KLLcYWoIN/VnR1MHg0JEb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6526698"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="6526698"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 09:36:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="827784756"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="827784756"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 25 Mar 2024 09:36:11 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 25 Mar 2024 18:36:10 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v2 5/5] tools/intel_vbt_decode: Optionally determine
 panel type from EDID
Date: Mon, 25 Mar 2024 18:36:10 +0200
Message-ID: <20240325163610.22860-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240322163251.11102-6-ville.syrjala@linux.intel.com>
References: <20240322163251.11102-6-ville.syrjala@linux.intel.com>
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

VBT may declare panel type as 255, which means we should match the
EDID PnP ID against the panel entries in the VBT to determine the
correct panel type. Implemnt support for this by allowing the user
to optionally provide the EDID via a command like parameter.

v2: Drop extra ' ' and some lefover debug junk (Jani)

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 92 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 788c2903e4a1..c50f13886e96 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -84,6 +84,12 @@ struct context {
 	bool hexdump;
 };
 
+struct edid {
+	uint8_t header[8];
+	struct lvds_pnp_id pnpid;
+	/* ... */
+} __packed;
+
 static bool dump_panel(const struct context *context, int panel_type)
 {
 	return panel_type == context->panel_type ||
@@ -2513,6 +2519,66 @@ static void dump_compression_parameters(struct context *context,
 	}
 }
 
+static int get_panel_type_pnpid(const struct context *context,
+				const char *edid_file)
+{
+	struct bdb_block *ptrs_block, *data_block;
+	const struct bdb_lvds_lfp_data *data;
+	const struct bdb_lvds_lfp_data_ptrs *ptrs;
+	struct lvds_pnp_id edid_id, edid_id_nodate;
+	const struct edid *edid;
+	int fd, best = -1;
+
+	fd = open(edid_file, O_RDONLY);
+	if (fd < 0) {
+		fprintf(stderr, "Unable to open EDID file %s\n", edid_file);
+		return -1;
+	}
+
+	edid = mmap(0, sizeof(*edid), PROT_READ, MAP_SHARED, fd, 0);
+	close(fd);
+	if (edid == MAP_FAILED) {
+		fprintf(stderr, "Unable to read EDID file %s\n", edid_file);
+		return -1;
+	}
+	edid_id = edid->pnpid;
+	munmap((void*)edid, sizeof(*edid));
+
+	edid_id_nodate = edid_id;
+	edid_id_nodate.mfg_week = 0;
+	edid_id_nodate.mfg_year = 0;
+
+	ptrs_block = find_section(context, BDB_LVDS_LFP_DATA_PTRS);
+	if (!ptrs_block)
+		return -1;
+
+	data_block = find_section(context, BDB_LVDS_LFP_DATA);
+	if (!data_block)
+		return -1;
+
+	ptrs = block_data(ptrs_block);
+	data = block_data(data_block);
+
+	for (int i = 0; i < 16; i++) {
+		const struct lvds_pnp_id *vbt_id =
+			(const void*)data + ptrs->ptr[i].panel_pnp_id.offset;
+
+		/* full match? */
+		if (!memcmp(vbt_id, &edid_id, sizeof(*vbt_id)))
+			return i;
+
+		/*
+		 * Accept a match w/o date if no full match is found,
+		 * and the VBT entry does not specify a date.
+		 */
+		if (best < 0 &&
+		    !memcmp(vbt_id, &edid_id_nodate, sizeof(*vbt_id)))
+			best = i;
+	}
+
+	return best;
+}
+
 /* get panel type from lvds options block, or -1 if block not found */
 static int get_panel_type(struct context *context, bool is_panel_type2)
 {
@@ -2791,6 +2857,8 @@ enum opt {
 	OPT_DEVID,
 	OPT_PANEL_TYPE,
 	OPT_PANEL_TYPE2,
+	OPT_PANEL_EDID,
+	OPT_PANEL_EDID2,
 	OPT_ALL_PANELS,
 	OPT_HEXDUMP,
 	OPT_BLOCK,
@@ -2805,6 +2873,9 @@ static void usage(const char *toolname)
 	fprintf(stderr, " --file=<rom_file>"
 			" [--devid=<device_id>]"
 			" [--panel-type=<panel_type>]"
+			" [--panel-type2=<panel_type>]"
+			" [--panel-edid=<edid file>]"
+			" [--panel-edid2=<edid file>]"
 			" [--all-panels]"
 			" [--hexdump]"
 			" [--block=<block_no>]"
@@ -2829,6 +2900,7 @@ int main(int argc, char **argv)
 		.panel_type = -1,
 		.panel_type2 = -1,
 	};
+	const char *panel_edid = NULL, *panel_edid2 = NULL;
 	char *endp;
 	int block_number = -1;
 	bool header_only = false, describe = false;
@@ -2837,7 +2909,9 @@ int main(int argc, char **argv)
 		{ "file",	required_argument,	NULL,	OPT_FILE },
 		{ "devid",	required_argument,	NULL,	OPT_DEVID },
 		{ "panel-type",	required_argument,	NULL,	OPT_PANEL_TYPE },
+		{ "panel-edid",	required_argument,	NULL,	OPT_PANEL_EDID },
 		{ "panel-type2",	required_argument,	NULL,	OPT_PANEL_TYPE2 },
+		{ "panel-edid2",	required_argument,	NULL,	OPT_PANEL_EDID2 },
 		{ "all-panels",	no_argument,		NULL,	OPT_ALL_PANELS },
 		{ "hexdump",	no_argument,		NULL,	OPT_HEXDUMP },
 		{ "block",	required_argument,	NULL,	OPT_BLOCK },
@@ -2877,6 +2951,12 @@ int main(int argc, char **argv)
 				return EXIT_FAILURE;
 			}
 			break;
+		case OPT_PANEL_EDID:
+			panel_edid = optarg;
+			break;
+		case OPT_PANEL_EDID2:
+			panel_edid2 = optarg;
+			break;
 		case OPT_ALL_PANELS:
 			context.dump_all_panel_types = true;
 			break;
@@ -2995,6 +3075,12 @@ int main(int argc, char **argv)
 
 	if (context.panel_type == -1)
 		context.panel_type = get_panel_type(&context, false);
+	if (context.panel_type == 255 && !panel_edid) {
+		fprintf(stderr, "Warning: panel type depends on EDID (use --panel-edid), ignoring\n");
+		context.panel_type = -1;
+	} else if (context.panel_type == 255) {
+		context.panel_type = get_panel_type_pnpid(&context, panel_edid);
+	}
 	if (context.panel_type == -1) {
 		fprintf(stderr, "Warning: panel type not set, using 0\n");
 		context.panel_type = 0;
@@ -3002,6 +3088,12 @@ int main(int argc, char **argv)
 
 	if (context.panel_type2 == -1)
 		context.panel_type2 = get_panel_type(&context, true);
+	if (context.panel_type2 == 255 && !panel_edid2) {
+		fprintf(stderr, "Warning: panel type2 depends on EDID (use --panel-edid2), ignoring\n");
+		context.panel_type2 = -1;
+	} else if (context.panel_type2 == 255) {
+		context.panel_type2 = get_panel_type_pnpid(&context, panel_edid2);
+	}
 	if (context.panel_type2 != -1 && context.bdb->version < 212) {
 		fprintf(stderr, "Warning: panel type2 not valid for BDB version %d\n",
 			context.bdb->version);
-- 
2.43.2

