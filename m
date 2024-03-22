Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE7BC47DD9
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 16:33:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF711125DE;
	Fri, 22 Mar 2024 16:33:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jHdcqaSc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33BDA1125DC
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 16:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711125186; x=1742661186;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=F3pfWkQnb42Kl7NudRKYitr01lPhz1QKtxZTsO+tAa0=;
 b=jHdcqaScYZWFBscH2+wqjNFFJujisXjHGA7HaR7t0SG4dAV9MazEmU25
 mrG+9K0IjDvdSEC2hO6rbL8DkWYumNfLv/OvYI6w7MdP85yEVgcSYDkCc
 aV9sSlDoD8WEhPgXZEBqLZLnbF9eqC7AWG5bKGN2vok/XIkcrP5utNUTB
 y2eExuC1gQtFFP+4gwglBHp8AfAHLFYQgrqCg7usxPFPgJko7mBIY/tYN
 BGVnCTKlFLE+4uzKMiInWdjSYDqGptkuQwjobVe6KGEfao2uI4FSDbYan
 q/qNTJtM62IeUgUnBeYzfphsOd1vH6BLnDKtEaq7ZTagCS/0nWbnZFi7j Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="17575028"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="17575028"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 09:33:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="827783533"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="827783533"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 22 Mar 2024 09:33:04 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Mar 2024 18:33:03 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 4/5] tools/intel_vbt_decode: Also dump the second panel
 (panel_type2)
Date: Fri, 22 Mar 2024 18:32:50 +0200
Message-ID: <20240322163251.11102-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240322163251.11102-1-ville.syrjala@linux.intel.com>
References: <20240322163251.11102-1-ville.syrjala@linux.intel.com>
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

Modern VBTs can declare two panel types in order to support
dual panel systems. Dump the panel information for the second
panel as well. Since panel_type2 could also be declared as 255
(== match pnpid to EDID) we also add a new command line knob
to select panel_type2 by hand.

Data for the second panel will be indicated by "(2)", as opposed
to "(1)" for the first panel.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 38 ++++++++++++++++++++++++++++++++------
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 98f64d0822c6..f223ce2bf5a1 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -79,7 +79,7 @@ struct context {
 	int size;
 
 	uint32_t devid;
-	int panel_type;
+	int panel_type, panel_type2;
 	bool dump_all_panel_types;
 	bool hexdump;
 };
@@ -87,12 +87,16 @@ struct context {
 static bool dump_panel(const struct context *context, int panel_type)
 {
 	return panel_type == context->panel_type ||
+		panel_type == context->panel_type2 ||
 		context->dump_all_panel_types;
 }
 
 static const char *panel_str(const struct context *context, int panel_type)
 {
-	return panel_type == context->panel_type ? " (1)" : "";
+	return panel_type == context->panel_type &&
+		panel_type == context->panel_type2 ? " (1)(2)" :
+		panel_type == context->panel_type ? " (1)" :
+		panel_type == context->panel_type2 ? " (2)" : "";
 }
 
 /* Get BDB block size given a pointer to Block ID. */
@@ -2503,18 +2507,21 @@ static void dump_compression_parameters(struct context *context,
 }
 
 /* get panel type from lvds options block, or -1 if block not found */
-static int get_panel_type(struct context *context)
+static int get_panel_type(struct context *context, bool is_panel_type2)
 {
 	struct bdb_block *block;
 	const struct bdb_lvds_options *options;
-	int panel_type;
+	int panel_type = -1;
 
 	block = find_section(context, BDB_LVDS_OPTIONS);
 	if (!block)
 		return -1;
 
 	options = block_data(block);
-	panel_type = options->panel_type;
+	if (!is_panel_type2)
+		panel_type = options->panel_type;
+	else if (context->bdb->version >= 212)
+		panel_type = options->panel_type2;
 
 	free(block);
 
@@ -2776,6 +2783,7 @@ enum opt {
 	OPT_FILE,
 	OPT_DEVID,
 	OPT_PANEL_TYPE,
+	OPT_PANEL_TYPE2,
 	OPT_ALL_PANELS,
 	OPT_HEXDUMP,
 	OPT_BLOCK,
@@ -2812,6 +2820,7 @@ int main(int argc, char **argv)
 	int size;
 	struct context context = {
 		.panel_type = -1,
+		.panel_type2 = -1,
 	};
 	char *endp;
 	int block_number = -1;
@@ -2821,6 +2830,7 @@ int main(int argc, char **argv)
 		{ "file",	required_argument,	NULL,	OPT_FILE },
 		{ "devid",	required_argument,	NULL,	OPT_DEVID },
 		{ "panel-type",	required_argument,	NULL,	OPT_PANEL_TYPE },
+		{ "panel-type2",	required_argument,	NULL,	OPT_PANEL_TYPE2 },
 		{ "all-panels",	no_argument,		NULL,	OPT_ALL_PANELS },
 		{ "hexdump",	no_argument,		NULL,	OPT_HEXDUMP },
 		{ "block",	required_argument,	NULL,	OPT_BLOCK },
@@ -2852,6 +2862,14 @@ int main(int argc, char **argv)
 				return EXIT_FAILURE;
 			}
 			break;
+		case OPT_PANEL_TYPE2:
+			context.panel_type2 = strtoul(optarg, &endp, 0);
+			if (*endp || context.panel_type2 > 15) {
+				fprintf(stderr, "invalid panel type2 '%s'\n",
+					optarg);
+				return EXIT_FAILURE;
+			}
+			break;
 		case OPT_ALL_PANELS:
 			context.dump_all_panel_types = true;
 			break;
@@ -2969,12 +2987,20 @@ int main(int argc, char **argv)
 		fprintf(stderr, "Warning: could not find PCI device ID!\n");
 
 	if (context.panel_type == -1)
-		context.panel_type = get_panel_type(&context);
+		context.panel_type = get_panel_type(&context, false);
 	if (context.panel_type == -1) {
 		fprintf(stderr, "Warning: panel type not set, using 0\n");
 		context.panel_type = 0;
 	}
 
+	if (context.panel_type2 == -1)
+		context.panel_type2 = get_panel_type(&context, true);
+	if (context.panel_type2 != -1 && context.bdb->version < 212) {
+		fprintf(stderr, "Warning: panel type2 not valid for BDB version %d\n",
+			context.bdb->version);
+		context.panel_type2 = -1;
+	}
+
 	if (describe) {
 		print_description(&context);
 	} else if (header_only) {
-- 
2.43.2

