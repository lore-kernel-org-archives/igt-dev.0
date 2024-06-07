Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF574C27C6E
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 13:59:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F7D10EC74;
	Fri,  7 Jun 2024 13:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LgdKnC3T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9DF810EC74
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 13:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717768750; x=1749304750;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=lNiXAYg9fcJo8iTDIOky1DmixG70OlZdjnwP2dzDmus=;
 b=LgdKnC3T4V3I+lxUqMVXZCjYiKAASfmGULzGpBpLGC7RqePhy52fbNFw
 N0ZauKm9VORyy9dPGkv/Ic7bn3ErrsmX2gXjGXZsZ9FKnaqoMcAXbAwiK
 BQZSHw/ajDL9BTLyYiLo9u0CUYbyF+rZ8CuLYctzpH8OQSgOPBbWunYD0
 dKj40VlJHrLJNaAt+CV4f+Wi9Z16Af7CPaCzpVwx4FO24qndfuTAauEtV
 uKd2ZYdYhhD1O8uYDFeu5mtScamw3k+BuWWqpFBMnWrstN7avOawlBdrK
 JxPviSCB01L2uCte5KW9WJn2vjQrI4n806ivyzoveTda0GbckMf1q+Jux A==;
X-CSE-ConnectionGUID: PMPRHNJ1Reyl42bcAhHq2Q==
X-CSE-MsgGUID: M4EGGl1OQPCC3RdSQZmDjQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25116830"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25116830"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 06:59:09 -0700
X-CSE-ConnectionGUID: ful6CdnnS2uF5AF+4i8+sw==
X-CSE-MsgGUID: mQAEdl01SYSqMvVvRvSqKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38323982"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 07 Jun 2024 06:59:08 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Jun 2024 16:59:06 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 24/27] tools/intel_vbt_decode: Decode block 57 (Vswing
 PreEmphasis Table)
Date: Fri,  7 Jun 2024 16:57:55 +0300
Message-ID: <20240607135758.31421-25-ville.syrjala@linux.intel.com>
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

Decode VBT block 57 (Vswing PreEmphasis Table). The colums of
the tables correspond to specific registers (mapping is platform
specific), the rows correspond to vswing/preemphasis combos, and
the individual table is supposed to selected using platform specific
logic baed on PHY type, link rate, low vswing, etc.

Example outout from TGL:
BDB block 57 (2642 bytes, min 2 bytes) - Vswing Preemph:
        0000: 39 52 0a 06 0b 0a 00 00  00 4c 00 00 00 3f 00 00
        0010: 00 00 00 00 00 00 00 00  00 98 00 00 00 06 00 00
        0020: 00 01 00 00 00 00 00 00  00 00 00 00 00 00 00 00
        0030: 00 0a 00 00 00 4c 00 00  00 3f 00 00 00 00 00 00
        ...
        0a00: 00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
        0a10: 00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
        0a20: 00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
        0a30: 00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
        0a40: 00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
        0a50: 00 00 00 00 00

        Number of vswing tables: 6
        Number of columns: 11
        Vswing Table #1:
                V0-P0:  0x0000000a 0x0000004c 0x0000003f 0x00000000 0x00000000 0x00000098 0x00000006 0x00000001 0x00000000 0x00000000 0x00000000
                V0-P1:  0x0000000a 0x0000004c 0x0000003f 0x00000000 0x00000000 0x00000098 0x00000006 0x00000001 0x00000000 0x00000000 0x00000000
                V0-P2:  0x0000000a 0x0000004c 0x0000003f 0x00000000 0x00000000 0x00000098 0x00000006 0x00000001 0x00000000 0x00000000 0x00000000
                V0-P3:  0x0000000a 0x0000004c 0x0000003f 0x00000000 0x00000000 0x00000098 0x00000006 0x00000001 0x00000000 0x00000000 0x00000000
                V1-P0:  0x0000000a 0x0000004c 0x0000003f 0x00000000 0x00000000 0x00000098 0x00000006 0x00000001 0x00000000 0x00000000 0x00000000
                V1-P1:  0x0000000a 0x0000004c 0x0000003f 0x00000000 0x00000000 0x00000098 0x00000006 0x00000001 0x00000000 0x00000000 0x00000000
                V1-P2:  0x0000000a 0x0000004c 0x0000003f 0x00000000 0x00000000 0x00000098 0x00000006 0x00000001 0x00000000 0x00000000 0x00000000
                V2-P0:  0x0000000a 0x0000004c 0x0000003f 0x00000000 0x00000000 0x00000098 0x00000006 0x00000001 0x00000000 0x00000000 0x00000000
                V2-P1:  0x0000000a 0x0000004c 0x0000003f 0x00000000 0x00000000 0x00000098 0x00000006 0x00000001 0x00000000 0x00000000 0x00000000
                V3-P0:  0x0000000a 0x0000004c 0x0000003f 0x00000000 0x00000000 0x00000098 0x00000006 0x00000001 0x00000000 0x00000000 0x00000000
        ...
        Vswing Table #6:
                V0-P0:  0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000
                V0-P1:  0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000
                V0-P2:  0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000
                V0-P3:  0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000
                V1-P0:  0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000
                V1-P1:  0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000
                V1-P2:  0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000
                V2-P0:  0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000
                V2-P1:  0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000
                V3-P0:  0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 41 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 85f31f449130..58bdba0e96d2 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -418,6 +418,8 @@ static size_t block_min_size(const struct context *context, int section_id)
 		return sizeof(struct bdb_rgb_palette);
 	case BDB_COMPRESSION_PARAMETERS:
 		return sizeof(struct bdb_compression_parameters);
+	case BDB_VSWING_PREEMPH:
+		return sizeof(struct bdb_vswing_preemph);
 	case BDB_GENERIC_DTD:
 		/* FIXME check spec */
 		return sizeof(struct bdb_generic_dtd);
@@ -3413,6 +3415,40 @@ static void dump_compression_parameters(struct context *context,
 	}
 }
 
+static const char * const vswing_preemph[10] = {
+	"V0-P0",
+	"V0-P1",
+	"V0-P2",
+	"V0-P3",
+	"V1-P0",
+	"V1-P1",
+	"V1-P2",
+	"V2-P0",
+	"V2-P1",
+	"V3-P0",
+};
+
+static void dump_vswing_preemphasis(struct context *context,
+				    const struct bdb_block *block)
+{
+	const struct bdb_vswing_preemph *vs = block_data(block);
+
+	printf("\tNumber of vswing tables: %d\n", vs->num_tables);
+	printf("\tNumber of columns: %d\n", vs->num_columns);
+
+	for (int n = 0; n < vs->num_tables; n++) {
+		printf("\tVswing Table #%d:\n", n+1);
+
+		for (int i = 0; i < 10; i++) {
+			printf("\t\t%s: ", vswing_preemph[i]);
+
+			for (int j = 0; j < vs->num_columns; j++)
+				printf(" 0x%08x", vs->tables[n * 10 * vs->num_columns + j]);
+			printf("\n");
+		}
+	}
+}
+
 static int get_panel_type_pnpid(const struct context *context,
 				const char *edid_file)
 {
@@ -3761,6 +3797,11 @@ struct dumper dumpers[] = {
 		.name = "Compression parameters block",
 		.dump = dump_compression_parameters,
 	},
+	{
+		.id = BDB_VSWING_PREEMPH,
+		.name = "Vswing Preemph",
+		.dump = dump_vswing_preemphasis,
+	},
 };
 
 static void hex_dump_block(const struct bdb_block *block)
-- 
2.44.2

