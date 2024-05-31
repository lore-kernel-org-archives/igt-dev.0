Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C27A6C41513
	for <igt-dev@archiver.kernel.org>; Fri, 31 May 2024 14:25:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9076A10E0D3;
	Fri, 31 May 2024 14:25:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KTAtpca3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C950D10E66A
 for <igt-dev@lists.freedesktop.org>; Fri, 31 May 2024 14:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717165504; x=1748701504;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=/+XO7OCvUKO2u3XnBkGxOBLHQPesDeQ4LIQ0ack1700=;
 b=KTAtpca3BDzs5TH+kgs1FZFiAVcAiqC/1Y3Mb5OfC+8mkrVtgLX+ef55
 bfdWhvhlyw940pdoLBZk1vByUNf5uQBVdATiboxkL7Dr4Wip2QMvLHjV6
 uWpVFkSGzPHIlHnipNZQmweKNUM3/r1OeME2at2d8WDgSUGE8FuU+p16N
 xXK1NYZRiZ3cHYU5DSrdeQHCJtgY9KHZTbzQt3LqJlFPY5D1y+r8Ob/t8
 KT1aCa4JSoW0FGMM0zkPuJkY4mPo8+YwVPa4WwdH53cDleZqjuf98UL1w
 H2sO/4TLvykh+A996F/ErNhASFoCN72dH8+EYypX35paBWiu4IhRSvMxN A==;
X-CSE-ConnectionGUID: FGjktU/VR5CI0tvJ8xsjwA==
X-CSE-MsgGUID: YKVkkp3KQduievPs3KKNiQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="25113711"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="25113711"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 07:24:24 -0700
X-CSE-ConnectionGUID: gLPfiBX9RBqYGDK5RmUPlQ==
X-CSE-MsgGUID: Rrs06v1gScCto+vWVHTXgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="36160851"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 31 May 2024 07:24:22 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 31 May 2024 17:24:21 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 10/20] tools/intel_vbt_decode: Reuse
 print_detail_timing_data()
Date: Fri, 31 May 2024 17:23:44 +0300
Message-ID: <20240531142354.16528-11-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240531142354.16528-1-ville.syrjala@linux.intel.com>
References: <20240531142354.16528-1-ville.syrjala@linux.intel.com>
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

We currently have two copies of code to decode the basic EDID
defined DTD. Get rid of the ad-hoc variant in dump_lfp_data()
and just reuse print_detail_timing_data() for it.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 106 ++++++++++++++-------------------------
 1 file changed, 39 insertions(+), 67 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 2a11490eed22..ed18a156c1ee 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -53,17 +53,6 @@ typedef uint64_t u64;
 #define _INTEL_BIOS_PRIVATE
 #include "intel_vbt_defs.h"
 
-/* no bother to include "edid.h" */
-#define _H_ACTIVE(x) (x[2] + ((x[4] & 0xF0) << 4))
-#define _H_SYNC_OFF(x) (x[8] + ((x[11] & 0xC0) << 2))
-#define _H_SYNC_WIDTH(x) (x[9] + ((x[11] & 0x30) << 4))
-#define _H_BLANK(x) (x[3] + ((x[4] & 0x0F) << 8))
-#define _V_ACTIVE(x) (x[5] + ((x[7] & 0xF0) << 4))
-#define _V_SYNC_OFF(x) ((x[10] >> 4) + ((x[11] & 0x0C) << 2))
-#define _V_SYNC_WIDTH(x) ((x[10] & 0x0F) + ((x[11] & 0x03) << 4))
-#define _V_BLANK(x) (x[6] + ((x[7] & 0x0F) << 8))
-#define _PIXEL_CLOCK(x) (x[0] + (x[1] << 8)) * 10000
-
 #define YESNO(val) ((val) ? "yes" : "no")
 
 /* This is not for mapping to memory layout. */
@@ -1382,6 +1371,38 @@ static void dump_lfp_data_ptrs(struct context *context,
 	}
 }
 
+static void
+print_detail_timing_data(const struct bdb_edid_dtd *dvo_timing)
+{
+	int display, sync_start, sync_end, total;
+
+	display = (dvo_timing->hactive_hi << 8) | dvo_timing->hactive_lo;
+	sync_start = display +
+		((dvo_timing->hsync_off_hi << 8) | dvo_timing->hsync_off_lo);
+	sync_end = sync_start + ((dvo_timing->hsync_pulse_width_hi << 8) |
+				 dvo_timing->hsync_pulse_width_lo);
+	total = display +
+		((dvo_timing->hblank_hi << 8) | dvo_timing->hblank_lo);
+	printf("\t\t  hdisplay: %d\n", display);
+	printf("\t\t  hsync [%d, %d] %s\n", sync_start, sync_end,
+	       dvo_timing->hsync_positive ? "+sync" : "-sync");
+	printf("\t\t  htotal: %d\n", total);
+
+	display = (dvo_timing->vactive_hi << 8) | dvo_timing->vactive_lo;
+	sync_start = display + ((dvo_timing->vsync_off_hi << 8) |
+				dvo_timing->vsync_off_lo);
+	sync_end = sync_start + ((dvo_timing->vsync_pulse_width_hi << 8) |
+				 dvo_timing->vsync_pulse_width_lo);
+	total = display +
+		((dvo_timing->vblank_hi << 8) | dvo_timing->vblank_lo);
+	printf("\t\t  vdisplay: %d\n", display);
+	printf("\t\t  vsync [%d, %d] %s\n", sync_start, sync_end,
+	       dvo_timing->vsync_positive ? "+sync" : "-sync");
+	printf("\t\t  vtotal: %d\n", total);
+
+	printf("\t\t  clock: %d\n", dvo_timing->clock * 10);
+}
+
 static char *decode_pnp_id(u16 mfg_name, char str[4])
 {
 	mfg_name = ntohs(mfg_name);
@@ -1412,9 +1433,6 @@ static void dump_lfp_data(struct context *context,
 	struct bdb_block *ptrs_block;
 	const struct bdb_lfp_data_ptrs *ptrs;
 	int i;
-	int hdisplay, hsyncstart, hsyncend, htotal;
-	int vdisplay, vsyncstart, vsyncend, vtotal;
-	float clock;
 
 	ptrs_block = find_section(context, BDB_LFP_DATA_PTRS);
 	if (!ptrs_block)
@@ -1425,7 +1443,7 @@ static void dump_lfp_data(struct context *context,
 	for (i = 0; i < 16; i++) {
 		const struct fp_timing *fp_timing =
 			block_data(block) + ptrs->ptr[i].fp_timing.offset;
-		const uint8_t *timing_data =
+		const struct bdb_edid_dtd *dvo_timing =
 			block_data(block) + ptrs->ptr[i].dvo_timing.offset;
 		const struct bdb_edid_pnp_id *pnp_id =
 			block_data(block) + ptrs->ptr[i].panel_pnp_id.offset;
@@ -1435,22 +1453,10 @@ static void dump_lfp_data(struct context *context,
 		if (!dump_panel(context, i))
 			continue;
 
-		hdisplay = _H_ACTIVE(timing_data);
-		hsyncstart = hdisplay + _H_SYNC_OFF(timing_data);
-		hsyncend = hsyncstart + _H_SYNC_WIDTH(timing_data);
-		htotal = hdisplay + _H_BLANK(timing_data);
-
-		vdisplay = _V_ACTIVE(timing_data);
-		vsyncstart = vdisplay + _V_SYNC_OFF(timing_data);
-		vsyncend = vsyncstart + _V_SYNC_WIDTH(timing_data);
-		vtotal = vdisplay + _V_BLANK(timing_data);
-		clock = _PIXEL_CLOCK(timing_data) / 1000;
-
 		printf("\tPanel %d%s\n", i, panel_str(context, i));
-		printf("\t\t%dx%d clock %d\n",
-		       fp_timing->x_res, fp_timing->y_res,
-		       _PIXEL_CLOCK(timing_data));
-		printf("\t\tinfo:\n");
+		printf("\t\tResolution: %dx%d\n",
+		       fp_timing->x_res, fp_timing->y_res);
+		printf("\t\tFP timing data:\n");
 		printf("\t\t  LVDS: 0x%08lx\n",
 		       (unsigned long)fp_timing->lvds_reg_val);
 		printf("\t\t  PP_ON_DELAYS: 0x%08lx\n",
@@ -1461,11 +1467,9 @@ static void dump_lfp_data(struct context *context,
 		       (unsigned long)fp_timing->pp_cycle_reg_val);
 		printf("\t\t  PFIT: 0x%08lx\n",
 		       (unsigned long)fp_timing->pfit_reg_val);
-		printf("\t\ttimings: %d %d %d %d %d %d %d %d %.2f (%s)\n",
-		       hdisplay, hsyncstart, hsyncend, htotal,
-		       vdisplay, vsyncstart, vsyncend, vtotal, clock,
-		       (hsyncend > htotal || vsyncend > vtotal) ?
-		       "BAD!" : "good");
+
+		printf("\t\tDVO timing:\n");
+		print_detail_timing_data(dvo_timing);
 
 		printf("\t\tPnP ID:\n");
 		dump_pnp_id(pnp_id);
@@ -1926,38 +1930,6 @@ static void dump_lfp_power(struct context *context,
 	}
 }
 
-static void
-print_detail_timing_data(const struct bdb_edid_dtd *dvo_timing)
-{
-	int display, sync_start, sync_end, total;
-
-	display = (dvo_timing->hactive_hi << 8) | dvo_timing->hactive_lo;
-	sync_start = display +
-		((dvo_timing->hsync_off_hi << 8) | dvo_timing->hsync_off_lo);
-	sync_end = sync_start + ((dvo_timing->hsync_pulse_width_hi << 8) |
-				 dvo_timing->hsync_pulse_width_lo);
-	total = display +
-		((dvo_timing->hblank_hi << 8) | dvo_timing->hblank_lo);
-	printf("\thdisplay: %d\n", display);
-	printf("\thsync [%d, %d] %s\n", sync_start, sync_end,
-	       dvo_timing->hsync_positive ? "+sync" : "-sync");
-	printf("\thtotal: %d\n", total);
-
-	display = (dvo_timing->vactive_hi << 8) | dvo_timing->vactive_lo;
-	sync_start = display + ((dvo_timing->vsync_off_hi << 8) |
-				dvo_timing->vsync_off_lo);
-	sync_end = sync_start + ((dvo_timing->vsync_pulse_width_hi << 8) |
-				 dvo_timing->vsync_pulse_width_lo);
-	total = display +
-		((dvo_timing->vblank_hi << 8) | dvo_timing->vblank_lo);
-	printf("\tvdisplay: %d\n", display);
-	printf("\tvsync [%d, %d] %s\n", sync_start, sync_end,
-	       dvo_timing->vsync_positive ? "+sync" : "-sync");
-	printf("\tvtotal: %d\n", total);
-
-	printf("\tclock: %d\n", dvo_timing->clock * 10);
-}
-
 static void dump_sdvo_lvds_dtd(struct context *context,
 			       const struct bdb_block *block)
 {
-- 
2.44.1

