Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50C3C27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 13:58:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67EA610EC71;
	Fri,  7 Jun 2024 13:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QwQ8HOw7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E11310EC87
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 13:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717768735; x=1749304735;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=BWrWF0HsZZUXcO4kAhCCTiZWX78eyu2LSAhFC/f/gQM=;
 b=QwQ8HOw7h2thO/yLeCPOUUQD3YoiBP4fEZTbUcqe4H6oXCx1yu5Hc48D
 nlKnd/fkILd88CQnY2Sankboiu3G8SR7oJ1fA/s+isoYzrwrR5ivxgBof
 3Q+NexA4nwCWz29jdLeHVO9U/kPOow5gMMOVBDuZrXAGmejFsvdY4KwnM
 0z+n1VtBF92w0ZfJl7VwCWt6dwT0yTohTKElwxzXXFkkL7YwUOAUa3CY7
 WuMgC6hHsXNKGPN2i1U7e7NPVI9T6hYEnLfte5meckWNTN3dGKy1i24Lj
 lTIo0Fn5uNbhGMZm0UnFco7puVuXqpsr35udLwe8shWhMU/8d5oy+5iVQ Q==;
X-CSE-ConnectionGUID: Q6It/hVGTAWgUvN+v2Egdg==
X-CSE-MsgGUID: x6lTQZSmS+2NAKVNa+0Nxw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25116813"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25116813"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 06:58:55 -0700
X-CSE-ConnectionGUID: 5K79jhc2TBiPPeTHwgvXZw==
X-CSE-MsgGUID: MD9t3DShT8CVTRj3vzPb8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38323852"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 07 Jun 2024 06:58:53 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Jun 2024 16:58:52 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 19/27] tools/intel_vbt_decode: Decode block 28 (EFP DTD)
Date: Fri,  7 Jun 2024 16:57:50 +0300
Message-ID: <20240607135758.31421-20-ville.syrjala@linux.intel.com>
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

Decode VBT block 28 (EFP DTD). Some kind of list of modes for EFPs.
These seem to be related to the "EDIDless EFP" stuff declared in
block 2.

Example output from HSW:
BDB block 28 (54 bytes, min 54 bytes) - EFP DTD:
        0000: 1c 36 00 d6 09 80 90 20  e0 1d 10 08 60 22 00 00
        0010: 00 00 00 00 1e d6 09 80  90 20 e0 1d 10 08 60 22
        0020: 00 00 00 00 00 00 1e d6  09 80 90 20 e0 1d 10 08
        0030: 60 22 00 00 00 00 00 00  1e

        EFP DTD #1:
                  hdisplay: 640
                  hsync [648, 744] -sync
                  htotal: 784
                  vdisplay: 480
                  vsync [482, 484] -sync
                  vtotal: 509
                  clock: 25180
        ...
        EFP DTD #3:
                  hdisplay: 640
                  hsync [648, 744] -sync
                  htotal: 784
                  vdisplay: 480
                  vsync [482, 484] -sync
                  vtotal: 509
                  clock: 25180

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index e88216c30a69..75be36e49b3c 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -362,6 +362,8 @@ static size_t block_min_size(const struct context *context, int section_id)
 		return sizeof(struct bdb_tv_options);
 	case BDB_EDP:
 		return sizeof(struct bdb_edp);
+	case BDB_EFP_DTD:
+		return sizeof(struct bdb_efp_dtd);
 	case BDB_DISPLAY_SELECT_IVB:
 		return sizeof(struct bdb_display_select_ivb);
 	case BDB_DISPLAY_REMOVE_IVB:
@@ -2458,6 +2460,17 @@ static void dump_edp(struct context *context,
 	}
 }
 
+static void dump_efp_dtd(struct context *context,
+			 const struct bdb_block *block)
+{
+	const struct bdb_efp_dtd *efp = block_data(block);
+
+	for (int n = 0; n < ARRAY_SIZE(efp->dtd); n++) {
+		printf("\tEFP DTD #%d:\n", n + 1);
+		print_detail_timing_data(&efp->dtd[n]);
+	}
+}
+
 static void dump_psr(struct context *context,
 		     const struct bdb_block *block)
 {
@@ -3502,6 +3515,11 @@ struct dumper dumpers[] = {
 		.name = "eDP block",
 		.dump = dump_edp,
 	},
+	{
+		.id = BDB_EFP_DTD,
+		.name = "EFP DTD",
+		.dump = dump_efp_dtd,
+	},
 	{
 		.id = BDB_DISPLAY_SELECT_IVB,
 		.name = "Display toggle list (IVB)",
-- 
2.44.2

