Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A24C310E275
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Jul 2022 20:25:41 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 15 Jul 2022 23:25:12 +0300
Message-Id: <20220715202520.23677-7-ville.syrjala@linux.intel.com>
In-Reply-To: <20220715202520.23677-1-ville.syrjala@linux.intel.com>
References: <20220715202520.23677-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 06/14] tools/intel_vbt_decode: Extract
 lvds_config[]
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

Extract the lvds_config string representation into an array.
Less clutter in the code this way.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 072c1d969c14..cffc385306f2 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -1337,6 +1337,13 @@ static void dump_lvds_data(struct context *context,
 	free(ptrs_block);
 }
 
+static const char * const lvds_config[] = {
+	[BDB_DRIVER_NO_LVDS] = "No LVDS",
+	[BDB_DRIVER_INT_LVDS] = "Integrated LVDS",
+	[BDB_DRIVER_SDVO_LVDS] = "SDVO LVDS",
+	[BDB_DRIVER_EDP] = "Embedded DisplayPort",
+};
+
 static void dump_driver_feature(struct context *context,
 				const struct bdb_block *block)
 {
@@ -1381,21 +1388,8 @@ static void dump_driver_feature(struct context *context,
 	printf("\tEnable SDVO device power down: %s\n",
 	       YESNO(feature->sdvo_device_power_down));
 	printf("\tCRT hotplug: %s\n", YESNO(feature->crt_hotplug));
-	printf("\tLVDS config: ");
-	switch (feature->lvds_config) {
-	case BDB_DRIVER_NO_LVDS:
-		printf("No LVDS\n");
-		break;
-	case BDB_DRIVER_INT_LVDS:
-		printf("Integrated LVDS\n");
-		break;
-	case BDB_DRIVER_SDVO_LVDS:
-		printf("SDVO LVDS\n");
-		break;
-	case BDB_DRIVER_EDP:
-		printf("Embedded DisplayPort\n");
-		break;
-	}
+	printf("\tLVDS config: %s (0x%x)\n",
+	       lvds_config[feature->lvds_config], feature->lvds_config);
 	printf("\tDefine Display statically: %s\n",
 	       YESNO(feature->static_display));
 	printf("\tLegacy CRT max X: %d\n", feature->legacy_crt_max_x);
-- 
2.35.1
