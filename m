Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE0F610E717
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jan 2023 04:55:39 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 25 Jan 2023 06:55:18 +0200
Message-Id: <20230125045522.18169-6-ville.syrjala@linux.intel.com>
In-Reply-To: <20230125045522.18169-1-ville.syrjala@linux.intel.com>
References: <20230125045522.18169-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 06/10] tools/intel_watermark: Decode plane
 enable bits for ilk-bdw
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

Knowing which planes are actually enabled is somewhat relevant
when debugging watermarks. Dump that information.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_watermark.c | 60 ++++++++++++++++++++++++++++++-----------
 1 file changed, 45 insertions(+), 15 deletions(-)

diff --git a/tools/intel_watermark.c b/tools/intel_watermark.c
index 19372db4506b..66e76e0dd3ef 100644
--- a/tools/intel_watermark.c
+++ b/tools/intel_watermark.c
@@ -93,10 +93,13 @@ static const char * const plane_name[] = {
 	NAME(SPR_F),
 };
 
+struct ilk_plane {
+	bool enabled, trickle_feed_dis;
+};
+
 struct ilk_wm_level {
 	int primary, sprite, cursor, latency, fbc;
 	bool enabled, sprite_enabled;
-	bool primary_trickle_feed_dis, sprite_trickle_feed_dis;
 };
 
 struct ilk_wm {
@@ -604,13 +607,15 @@ static void ilk_wm_dump(void)
 	struct intel_mmio_data mmio_data;
 	int i;
 	uint32_t dspcntr[3];
-	uint32_t spcntr[3];
+	uint32_t sprcntr[3];
+	uint32_t curcntr[3];
 	uint32_t wm_pipe[3];
 	uint32_t wm_linetime[3];
 	uint32_t wm_lp[3];
 	uint32_t wm_lp_spr[3];
 	uint32_t arb_ctl, arb_ctl2, wm_misc = 0;
 	int num_pipes = intel_gen(devid) >= 7 ? 3 : 2;
+	struct ilk_plane primary[3] = {}, sprite[3] = {}, cursor[3] = {};
 	struct ilk_wm wm = {};
 
 	intel_register_access_init(&mmio_data, intel_get_pci_device(), 0, -1);
@@ -618,9 +623,13 @@ static void ilk_wm_dump(void)
 	for (i = 0; i < num_pipes; i++) {
 		dspcntr[i] = read_reg(0x70180 + i * 0x1000);
 		if (intel_gen(devid) >= 7)
-			spcntr[i] = read_reg(0x70280 + i * 0x1000);
+			sprcntr[i] = read_reg(0x70280 + i * 0x1000);
 		else
-			spcntr[i] = read_reg(0x72180 + i * 0x1000);
+			sprcntr[i] = read_reg(0x72180 + i * 0x1000);
+		if (intel_gen(devid) >= 7)
+			curcntr[i] = read_reg(0x70080 + i * 0x1000);
+		else
+			curcntr[i] = read_reg(0x70080 + i * 0x40);
 	}
 
 	wm_pipe[0] = read_reg(0x45100);
@@ -649,6 +658,12 @@ static void ilk_wm_dump(void)
 	if (IS_BROADWELL(devid) || IS_HASWELL(devid))
 		wm_misc = read_reg(0x45260);
 
+	for (i = 0; i < num_pipes; i++) {
+		printf("    DSPCNTR_%c = 0x%08x\n", pipe_name(i), dspcntr[i]);
+		printf("    SPRCNTR_%c = 0x%08x\n", pipe_name(i), sprcntr[i]);
+		printf("    CURCNTR_%c = 0x%08x\n", pipe_name(i), curcntr[i]);
+	}
+
 	for (i = 0; i < num_pipes; i++)
 		printf("    WM_PIPE_%c = 0x%08x\n", pipe_name(i), wm_pipe[i]);
 	if (IS_BROADWELL(devid) || IS_HASWELL(devid)) {
@@ -668,6 +683,21 @@ static void ilk_wm_dump(void)
 	if (IS_BROADWELL(devid) || IS_HASWELL(devid))
 		printf("      WM_MISC = 0x%08x\n", wm_misc);
 
+	for (i = 0 ; i < num_pipes; i++) {
+		primary[i].enabled = REG_DECODE1(dspcntr[i], 31, 1);
+		sprite[i].enabled = REG_DECODE1(sprcntr[i], 31, 1);
+		cursor[i].enabled = REG_DECODE1(curcntr[i], 0, 3) ||
+			REG_DECODE1(curcntr[i], 5, 1);
+
+		primary[i].trickle_feed_dis = REG_DECODE1(dspcntr[i], 14, 1);
+
+		if (IS_GEN5(devid))
+			continue;
+
+		sprite[i].trickle_feed_dis = REG_DECODE1(sprcntr[i], 14, 1);
+		cursor[i].trickle_feed_dis = REG_DECODE1(curcntr[i], 14, 1);
+	}
+
 	for (i = 0 ; i < num_pipes; i++) {
 		wm.pipe[i].primary = REG_DECODE1(wm_pipe[i], 16, 8);
 		wm.pipe[i].sprite = REG_DECODE1(wm_pipe[i], 8, 8);
@@ -677,12 +707,6 @@ static void ilk_wm_dump(void)
 			wm.linetime[i].linetime = REG_DECODE1(wm_linetime[i], 0, 9);
 			wm.linetime[i].ips = REG_DECODE1(wm_linetime[i], 16, 9);
 		}
-
-		wm.pipe[i].primary_trickle_feed_dis =
-			REG_DECODE1(dspcntr[i], 14, 1);
-		if (!IS_GEN5(devid))
-			wm.pipe[i].sprite_trickle_feed_dis =
-				REG_DECODE1(spcntr[i], 14, 1);
 	}
 
 	for (i = 0; i < 3; i++) {
@@ -733,11 +757,17 @@ static void ilk_wm_dump(void)
 		}
 	}
 	for (i = 0; i < num_pipes; i++) {
-		printf("Primary %c trickle feed = %s\n",
-		       pipe_name(i), endis(!wm.pipe[i].primary_trickle_feed_dis));
-		if (!IS_GEN5(devid))
-			printf("Sprite %c trickle feed = %s\n",
-			       pipe_name(i), endis(!wm.pipe[i].sprite_trickle_feed_dis));
+		printf("Primary %c: %s, trickle feed = %s\n",
+		       pipe_name(i), endis(primary[i].enabled),
+		       endis(!primary[i].trickle_feed_dis));
+		printf("Sprite %c: %s, trickle feed = %s\n",
+		       pipe_name(i), endis(sprite[i].enabled),
+		       IS_GEN5(devid) ? "n/a" :
+		       endis(!sprite[i].trickle_feed_dis));
+		printf("Cursor %c: %s, trickle feed = %s\n",
+		       pipe_name(i), endis(cursor[i].enabled),
+		       IS_GEN5(devid) ? "n/a" :
+		       endis(!cursor[i].trickle_feed_dis));
 	}
 	if (IS_BROADWELL(devid) || IS_HASWELL(devid)) {
 		printf("DDB partitioning = %s\n",
-- 
2.39.1
