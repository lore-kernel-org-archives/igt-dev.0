Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584FDC27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 13:59:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0757910EC6E;
	Fri,  7 Jun 2024 13:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HKubi+I5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F8510EC6E
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 13:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717768741; x=1749304741;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ilXxI2Ktagz/plVSGUIsPsAkSokyITWYdi1JuUBohgg=;
 b=HKubi+I5Ayd6yb1+xvcwkAuhZ9IdD1MATOPbL5KNrjDsvqIP13tkw4Wc
 VUkRRXhrLZ38iuJX8PqIyeiAt1YCmbFxrZhSb1mrvIqQKA52wPUQV5d5F
 M7SwH/NngbalcUbqACzAkJN7UjgBEqsq0y3X3rAiSPYuz78pyoY1MJhxp
 TImLMbeiR1CVBoaJm5URs7mv46XGT1fUlMGyvwI22DZ1Rc0Gt4Uyhtq2q
 DkVu86JcBwscGvarHGJk+vkzcOBYcOrYzKnoHoPrc0I1gmRdooeOebas/
 Mtvpxdb3CeYpHDSEXl19WK32wmsRsWU/XuvR5HTL1HR1L7ILaq6fH7RuC A==;
X-CSE-ConnectionGUID: Kxql3aZ/QHyQHWJ+w1pESQ==
X-CSE-MsgGUID: ZOyq42KMTAi3tLJ6IGPaEg==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25116822"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25116822"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 06:59:00 -0700
X-CSE-ConnectionGUID: t4GQ0aqGRceNkXiyf1i3AQ==
X-CSE-MsgGUID: Sr/K9wWyT7uwmSTg+kGM5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38323864"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 07 Jun 2024 06:58:59 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Jun 2024 16:58:58 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 21/27] tools/intel_vbt_decode: Decode block 46
 (Chromaticity For Narrow Gamut Panel)
Date: Fri,  7 Jun 2024 16:57:52 +0300
Message-ID: <20240607135758.31421-22-ville.syrjala@linux.intel.com>
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

Decode VBT block 46 (Chromaticity For Narrow Gamut Panel). Contains
a bunch of chromaticity coordinates. Haven't bothered to figure out
what the units are.

Example output from CFL:
BDB block 46 (304 bytes, min 304 bytes) - Chromaticity for narrow gamut panel:
        0000: 2e 30 01 00 88 88 88 88  88 88 88 88 88 88 00 88
        0010: 88 88 88 88 88 88 88 88  88 00 88 88 88 88 88 88
        0020: 88 88 88 88 00 88 88 88  88 88 88 88 88 88 88 00
        0030: 88 88 88 88 88 88 88 88  88 88 00 88 88 88 88 88
        0040: 88 88 88 88 88 00 88 88  88 88 88 88 88 88 88 88
        0050: 00 88 88 88 88 88 88 88  88 88 88 00 88 88 88 88
        0060: 88 88 88 88 88 88 00 88  88 88 88 88 88 88 88 88
        0070: 88 00 88 88 88 88 88 88  88 88 88 88 00 88 88 88
        0080: 88 88 88 88 88 88 88 00  88 88 88 88 88 88 88 88
        0090: 88 88 00 88 88 88 88 88  88 88 88 88 88 00 88 88
        00a0: 88 88 88 88 88 88 88 88  00 88 88 88 88 88 88 88
        00b0: 88 88 88 00 00 00 00 00  00 00 ff 00 00 00 00 00
        00c0: 00 00 ff 00 00 00 00 00  00 00 ff 00 00 00 00 00
        00d0: 00 00 ff 00 00 00 00 00  00 00 ff 00 00 00 00 00
        00e0: 00 00 ff 00 00 00 00 00  00 00 ff 00 00 00 00 00
        00f0: 00 00 ff 00 00 00 00 00  00 00 ff 00 00 00 00 00
        0100: 00 00 ff 00 00 00 00 00  00 00 ff 00 00 00 00 00
        0110: 00 00 ff 00 00 00 00 00  00 00 ff 00 00 00 00 00
        0120: 00 00 ff 01 40 4e b0 5c  b0 5c ff 00 00 00 00 00
        0130: 00 00 ff

        Panel 0 (LFP2)
                Use chromaticity values from EDID base block: no
                Chromaticity enable: no
                Red X coordinate: 0.533203 (0x222)
                Red Y coordinate: 0.531250 (0x220)
                Green X coordinate: 0.533203 (0x222)
                Green Y coordinate: 0.531250 (0x220)
                Blue X coordinate: 0.533203 (0x222)
                Blue Y coordinate: 0.531250 (0x220)
                White X coordinate: 0.533203 (0x222)
                White Y coordinate: 0.531250 (0x220)
                Gamma enable: no
                Luminance enable: no
                Minimum luminance: 0.000000 (0x0000)
                Maximum luminance: 0.000000 (0x0000)
                1% maximum luminanace: 0.000000 (0x0000)
                Gamma: n/a (0xff)
        ...
        Panel 14
                Use chromaticity values from EDID base block: no
                Chromaticity enable: no
                Red X coordinate: 0.533203 (0x222)
                Red Y coordinate: 0.531250 (0x220)
                Green X coordinate: 0.533203 (0x222)
                Green Y coordinate: 0.531250 (0x220)
                Blue X coordinate: 0.533203 (0x222)
                Blue Y coordinate: 0.531250 (0x220)
                White X coordinate: 0.533203 (0x222)
                White Y coordinate: 0.531250 (0x220)
                Gamma enable: no
                Luminance enable: yes
                Minimum luminance: 25.000000 (0x4e40)
                Maximum luminance: 300.000000 (0x5cb0)
                1% maximum luminanace: 300.000000 (0x5cb0)
                Gamma: n/a (0xff)
        Panel 15
                Use chromaticity values from EDID base block: no
                Chromaticity enable: no
                Red X coordinate: 0.533203 (0x222)
                Red Y coordinate: 0.531250 (0x220)
                Green X coordinate: 0.533203 (0x222)
                Green Y coordinate: 0.531250 (0x220)
                Blue X coordinate: 0.533203 (0x222)
                Blue Y coordinate: 0.531250 (0x220)
                White X coordinate: 0.533203 (0x222)
                White Y coordinate: 0.531250 (0x220)
                Gamma enable: no
                Luminance enable: no
                Minimum luminance: 0.000000 (0x0000)
                Maximum luminance: 0.000000 (0x0000)
                1% maximum luminanace: 0.000000 (0x0000)
                Gamma: n/a (0xff)

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 86 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 4cab0f0e734c..cc763d25f08b 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -39,6 +39,7 @@
 #include <sys/types.h>
 
 #include "igt_aux.h"
+#include "igt_halffloat.h"
 #include "intel_io.h"
 #include "intel_chipset.h"
 #include "drmtest.h"
@@ -384,6 +385,8 @@ static size_t block_min_size(const struct context *context, int section_id)
 		return sizeof(struct bdb_lfp_power);
 	case BDB_EDP_BFI:
 		return sizeof(struct bdb_edp_bfi);
+	case BDB_CHROMATICITY:
+		return sizeof(struct bdb_chromaticity);
 	case BDB_MIPI_CONFIG:
 		return sizeof(struct bdb_mipi_config);
 	case BDB_MIPI_SEQUENCE:
@@ -2706,6 +2709,84 @@ static void dump_edp_bfi(struct context *context,
 	}
 }
 
+static float decode_coordinate(int value)
+{
+	return 1.0f * value / (1 << 10);
+}
+
+static float decode_luminance(uint16_t value)
+{
+	float f;
+
+	igt_half_to_float(&value, &f, 1);
+
+	return f;
+}
+
+static float decode_gamma(int value)
+{
+	return (value + 100) / 100.0f;
+}
+
+static void dump_chromaticity(struct context *context,
+			      const struct bdb_block *block)
+{
+	const struct bdb_chromaticity *chromaticity = block_data(block);
+
+	for (int i = 0; i < 16; i++) {
+		const struct chromaticity *c = &chromaticity->chromaticity[i];
+		const struct luminance_and_gamma *l = &chromaticity->luminance_and_gamma[i];
+		int x, y;
+
+		if (!dump_panel(context, i))
+			continue;
+
+		printf("\tPanel %d%s\n", i, panel_str(context, i));
+
+		printf("\t\tUse chromaticity values from EDID base block: %s\n",
+		       YESNO(c->chromaticity_from_edid_base_block));
+		printf("\t\tChromaticity enable: %s\n",
+		       YESNO(c->chromaticity_enable));
+
+		x = (c->red_x_hi << 2) | c->red_x_lo;
+		y = (c->red_y_hi << 2) | c->red_y_lo;
+		printf("\t\tRed X coordinate: %f (0x%03x)\n", decode_coordinate(x), x);
+		printf("\t\tRed Y coordinate: %f (0x%03x)\n", decode_coordinate(y), y);
+
+		x = (c->green_x_hi << 2) | c->green_x_lo;
+		y = (c->green_y_hi << 2) | c->green_y_lo;
+		printf("\t\tGreen X coordinate: %f (0x%03x)\n", decode_coordinate(x), x);
+		printf("\t\tGreen Y coordinate: %f (0x%03x)\n", decode_coordinate(y), y);
+
+		x = (c->blue_x_hi << 2) | c->blue_x_lo;
+		y = (c->blue_y_hi << 2) | c->blue_y_lo;
+		printf("\t\tBlue X coordinate: %f (0x%03x)\n", decode_coordinate(x), x);
+		printf("\t\tBlue Y coordinate: %f (0x%03x)\n", decode_coordinate(y), y);
+
+		x = (c->white_x_hi << 2) | c->white_x_lo;
+		y = (c->white_y_hi << 2) | c->white_y_lo;
+		printf("\t\tWhite X coordinate: %f (0x%03x)\n", decode_coordinate(x), x);
+		printf("\t\tWhite Y coordinate: %f (0x%03x)\n", decode_coordinate(y), y);
+
+		if (context->bdb->version < 211)
+			continue;
+
+		printf("\t\tGamma enable: %s\n", YESNO(l->gamma_enable));
+		printf("\t\tLuminance enable: %s\n", YESNO(l->luminance_enable));
+
+		printf("\t\tMinimum luminance: %f (0x%04x)\n",
+		       decode_luminance(l->min_luminance), l->min_luminance);
+		printf("\t\tMaximum luminance: %f (0x%04x)\n",
+		       decode_luminance(l->max_luminance), l->max_luminance);
+		printf("\t\t1%% maximum luminanace: %f (0x%04x)\n",
+		       decode_luminance(l->one_percent_max_luminance), l->one_percent_max_luminance);
+		if (l->gamma != 0xff)
+			printf("\t\tGamma: %f (0x%02x)\n", decode_gamma(l->gamma), l->gamma);
+		else
+			printf("\t\tGamma: n/a (0x%02x)\n", l->gamma);
+	}
+}
+
 static void dump_mipi_config(struct context *context,
 			     const struct bdb_block *block)
 {
@@ -3600,6 +3681,11 @@ struct dumper dumpers[] = {
 		.name = "eDP BFI",
 		.dump = dump_edp_bfi,
 	},
+	{
+		.id = BDB_CHROMATICITY,
+		.name = "Chromaticity for narrow gamut panel",
+		.dump = dump_chromaticity,
+	},
 	{
 		.id = BDB_MIPI_CONFIG,
 		.name = "MIPI configuration block",
-- 
2.44.2

