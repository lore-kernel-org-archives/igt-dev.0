Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6645610E718
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jan 2023 04:55:45 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 25 Jan 2023 06:55:20 +0200
Message-Id: <20230125045522.18169-8-ville.syrjala@linux.intel.com>
In-Reply-To: <20230125045522.18169-1-ville.syrjala@linux.intel.com>
References: <20230125045522.18169-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 08/10] tools/intel_watermark: Use
 intel_display_ver()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

intel_gen() is no longer useful for determining the display IP
version, switch over to intel_display_ver().

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_watermark.c | 42 ++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/tools/intel_watermark.c b/tools/intel_watermark.c
index 7e957f0c8e9a..7991e80ac876 100644
--- a/tools/intel_watermark.c
+++ b/tools/intel_watermark.c
@@ -141,12 +141,12 @@ static bool is_cursor(int plane)
 
 static int skl_num_pipes(uint32_t d)
 {
-	return intel_gen(d) >= 12 ? 4 : 3;
+	return intel_display_ver(d) >= 12 ? 4 : 3;
 }
 
 static int skl_num_planes(uint32_t d, int pipe)
 {
-	int gen = intel_gen(d);
+	int gen = intel_display_ver(d);
 
 	if (gen >= 13 || IS_ALDERLAKE_S(d) || IS_ROCKETLAKE(d))
 		return 6;
@@ -162,7 +162,7 @@ static int skl_num_planes(uint32_t d, int pipe)
 
 static int skl_max_planes(uint32_t d)
 {
-	int gen = intel_gen(d);
+	int gen = intel_display_ver(d);
 
 	if (gen >= 13 || IS_ALDERLAKE_S(d) || IS_ROCKETLAKE(d))
 		return 6;
@@ -176,7 +176,7 @@ static int skl_max_planes(uint32_t d)
 
 static bool skl_has_sagv_wm(uint32_t d)
 {
-	return intel_gen(d) >= 13;
+	return intel_display_ver(d) >= 13;
 }
 
 static int skl_num_wm_levels(uint32_t d)
@@ -339,7 +339,7 @@ static void skl_wm_dump(void)
 			plane_ctl[pipe][plane] = read_reg(addr + 0x80);
 			wm_trans[pipe][plane] = read_reg(addr + 0x00168);
 			buf_cfg[pipe][plane] = read_reg(addr + 0x0017C);
-			if (!is_cursor(plane) && intel_gen(devid) < 11)
+			if (!is_cursor(plane) && intel_display_ver(devid) < 11)
 				nv12_buf_cfg[pipe][plane] = read_reg(addr + 0x00178);
 			else
 				nv12_buf_cfg[pipe][plane] = 0;
@@ -439,7 +439,7 @@ static void skl_wm_dump(void)
 		}
 		printf("\n");
 
-		if (intel_gen(devid) >= 11)
+		if (intel_display_ver(devid) >= 11)
 			continue;
 
 		if (is_cursor(plane))
@@ -456,10 +456,10 @@ static void skl_wm_dump(void)
 	}
 	printf("\n");
 
-	if (intel_gen(devid) >= 13) {
+	if (intel_display_ver(devid) >= 13) {
 		printf(" ARB_LP_CTL 0x%08x\n", arb_ctl);
 		printf(" ARB_HP_CTL 0x%08x\n", arb_ctl2);
-	} else if (intel_gen(devid) >= 12) {
+	} else if (intel_display_ver(devid) >= 12) {
 		printf("        ARB_CTL 0x%08x\n", arb_ctl);
 		printf("  ARB_CTL_ABOX1 0x%08x\n", read_reg(0x45800));
 		printf("  ARB_CTL_ABOX2 0x%08x\n", read_reg(0x45808));
@@ -575,7 +575,7 @@ static void skl_wm_dump(void)
 		}
 		printf("\n");
 
-		if (intel_gen(devid) < 11) {
+		if (intel_display_ver(devid) < 11) {
 			printf("\nNV12 DDB allocation:");
 
 			printf("\nstart");
@@ -602,7 +602,7 @@ static void skl_wm_dump(void)
 		printf("\n\n\n");
 	}
 
-	if (intel_gen(devid) < 13)
+	if (intel_display_ver(devid) < 13)
 		printf("FBC watermark: %s\n", endis(!REG_DECODE1(arb_ctl, 15, 1)));
 	printf("IPC: %s\n", endis(REG_DECODE1(arb_ctl2, 3, 1)));
 
@@ -639,7 +639,7 @@ static void ilk_wm_dump(void)
 	uint32_t wm_lp[3];
 	uint32_t wm_lp_spr[3];
 	uint32_t arb_ctl, arb_ctl2, wm_misc = 0;
-	int num_pipes = intel_gen(devid) >= 7 ? 3 : 2;
+	int num_pipes = intel_display_ver(devid) >= 7 ? 3 : 2;
 	struct ilk_plane primary[3] = {}, sprite[3] = {}, cursor[3] = {};
 	struct ilk_wm wm = {};
 
@@ -647,11 +647,11 @@ static void ilk_wm_dump(void)
 
 	for (i = 0; i < num_pipes; i++) {
 		dspcntr[i] = read_reg(0x70180 + i * 0x1000);
-		if (intel_gen(devid) >= 7)
+		if (intel_display_ver(devid) >= 7)
 			sprcntr[i] = read_reg(0x70280 + i * 0x1000);
 		else
 			sprcntr[i] = read_reg(0x72180 + i * 0x1000);
-		if (intel_gen(devid) >= 7)
+		if (intel_display_ver(devid) >= 7)
 			curcntr[i] = read_reg(0x70080 + i * 0x1000);
 		else
 			curcntr[i] = read_reg(0x70080 + i * 0x40);
@@ -673,7 +673,7 @@ static void ilk_wm_dump(void)
 	wm_lp[2] = read_reg(0x45110);
 
 	wm_lp_spr[0] = read_reg(0x45120);
-	if (intel_gen(devid) >= 7) {
+	if (intel_display_ver(devid) >= 7) {
 		wm_lp_spr[1] = read_reg(0x45124);
 		wm_lp_spr[2] = read_reg(0x45128);
 	}
@@ -699,7 +699,7 @@ static void ilk_wm_dump(void)
 	printf("       WM_LP2 = 0x%08x\n", wm_lp[1]);
 	printf("       WM_LP3 = 0x%08x\n", wm_lp[2]);
 	printf("   WM_LP1_SPR = 0x%08x\n", wm_lp_spr[0]);
-	if (intel_gen(devid) >= 7) {
+	if (intel_display_ver(devid) >= 7) {
 		printf("   WM_LP2_SPR = 0x%08x\n", wm_lp_spr[1]);
 		printf("   WM_LP3_SPR = 0x%08x\n", wm_lp_spr[2]);
 	}
@@ -744,8 +744,8 @@ static void ilk_wm_dump(void)
 		wm.lp[i].primary = REG_DECODE1(wm_lp[i], 8, 11);
 		wm.lp[i].cursor = REG_DECODE1(wm_lp[i], 0, 8);
 
-		if (i == 0 || intel_gen(devid) >= 7) {
-			if (intel_gen(devid) < 7)
+		if (i == 0 || intel_display_ver(devid) >= 7) {
+			if (intel_display_ver(devid) < 7)
 				wm.lp[i].sprite_enabled = REG_DECODE1(wm_lp_spr[i], 31, 1);
 			wm.lp[i].sprite = REG_DECODE1(wm_lp_spr[i], 0, 11);
 		}
@@ -763,7 +763,7 @@ static void ilk_wm_dump(void)
 			       wm.linetime[i].ips, wm.linetime[i].ips * 0.125f);
 		}
 	}
-	if (intel_gen(devid) >= 7) {
+	if (intel_display_ver(devid) >= 7) {
 		for (i = 0; i < 3; i++) {
 			printf("WM_LP%d: %s, latency=%d, fbc=%d, primary=%d, cursor=%d, sprite=%d\n",
 			       i + 1, endis(wm.lp[i].enabled), wm.lp[i].latency, wm.lp[i].fbc,
@@ -797,7 +797,7 @@ static void ilk_wm_dump(void)
 	if (IS_BROADWELL(devid) || IS_HASWELL(devid)) {
 		printf("DDB partitioning = %s\n",
 		       REG_DECODE1(wm_misc, 0, 1) ? "5/6" : "1/2");
-	} else if (intel_gen(devid) >= 7) {
+	} else if (intel_display_ver(devid) >= 7) {
 		printf("DDB partitioning = %s\n",
 		       REG_DECODE1(arb_ctl2, 6, 1) ? "5/6" : "1/2");
 	}
@@ -1498,12 +1498,12 @@ int main(int argc, char *argv[])
 		}
 	}
 
-	if (intel_gen(devid) >= 9) {
+	if (intel_display_ver(devid) >= 9) {
 		skl_wm_dump();
 	} else if (IS_VALLEYVIEW(devid) || IS_CHERRYVIEW(devid)) {
 		display_base = 0x180000;
 		vlv_wm_dump();
-	} else if (intel_gen(devid) >= 5) {
+	} else if (intel_display_ver(devid) >= 5) {
 		ilk_wm_dump();
 	} else if (IS_G4X(devid)) {
 		g4x_wm_dump();
-- 
2.39.1
