Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C161C27C6E
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 13:59:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17CFF10EC75;
	Fri,  7 Jun 2024 13:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BEG1DX6P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 125AE10EC75
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 13:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717768758; x=1749304758;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=gyYjPD7BGkBR97/rSQlUsO4fCsREeuFoXQiEYk/exeo=;
 b=BEG1DX6PIsMCdLVyb2AM9HpYCy1VPmG6gmRMi3JNg10yGEC3ASk4xz8z
 tC1EGMkR654zni8OKMjKapDShj8+RVdk7w+wJaTNf7DBLul8z2yJr+Nh3
 Phvqt2ET7BZ+aHOjeyKhNABn+iKsLhDxNMDBtd8ACkcjNE7sJYHAlqKMU
 YmlL5go+lU/Ii09iGEvREzx2/Dy16bfeN4FQDXdRQNGnWVLvSk+IDLQzW
 mtOXDYgMhLZxWht0E9XJJQ3vBqwgICfuXrH25RfytetsBz4Fo+zNPfIVV
 SAj9e6r3yKLpvTNePwMaIhbC9aCDaAEAfPJo3ffucjaOW0vmgRGBMSl53 A==;
X-CSE-ConnectionGUID: t4HWPTaVQyuzRn79SmRK0g==
X-CSE-MsgGUID: dJjefzGoRl6GrJMilePZyg==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25116835"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25116835"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 06:59:18 -0700
X-CSE-ConnectionGUID: rSSs7hAXSP2sMvSF0KPNpw==
X-CSE-MsgGUID: nsrnw7NBS0+e+PhmI7+Inw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38324038"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 07 Jun 2024 06:59:16 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Jun 2024 16:59:15 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 27/27] tools/intel_vbt_decode: Name a few more VBT blocks
Date: Fri,  7 Jun 2024 16:57:58 +0300
Message-ID: <20240607135758.31421-28-ville.syrjala@linux.intel.com>
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

Give names to a few more known VBT blocks. Most of these are VBIOS only
junk so probably not worth the hassle to decode, and the old MIPI
block is perhaps not actually used anywhere so didn't bother with
that one either.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 9d9c96f1c264..eca9d66ca4da 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -3762,6 +3762,10 @@ struct dumper dumpers[] = {
 		.name = "Driver persistent algorithm",
 		.dump = dump_driver_persistence,
 	},
+	{
+		.id = BDB_EXT_TABLE_PTRS,
+		.name = "Ext table pointers, VBIOS only",
+	},
 	{
 		.id = BDB_DOT_CLOCK_OVERRIDE,
 		.name = "Dot clock override",
@@ -3772,6 +3776,10 @@ struct dumper dumpers[] = {
 		.name = "Toggle list block (pre-IVB)",
 		.dump = dump_display_select_old,
 	},
+	{
+		.id = BDB_SV_TEST_FUNCTIONS,
+		.name = "SV test functions",
+	},
 	{
 		.id = BDB_DRIVER_ROTATION,
 		.name = "Driver rotation",
@@ -3882,6 +3890,10 @@ struct dumper dumpers[] = {
 		.name = "Chromaticity for narrow gamut panel",
 		.dump = dump_chromaticity,
 	},
+	{
+		.id = BDB_MIPI,
+		.name = "MIPI",
+	},
 	{
 		.id = BDB_FIXED_SET_MODE,
 		.name = "Fixed set mode",
@@ -3917,11 +3929,19 @@ struct dumper dumpers[] = {
 		.name = "Generic DTD",
 		.dump = dump_generic_dtd,
 	},
+	{
+		.id = BDB_INT15_HOOK,
+		.name = "INT15h hook",
+	},
 	{
 		.id = BDB_PRD_TABLE,
 		.name = "PRD table",
 		.dump = dump_prd_table,
 	},
+	{
+		.id = BDB_SKIP,
+		.name = "VBIOS only",
+	},
 };
 
 static void hex_dump_block(const struct bdb_block *block)
-- 
2.44.2

