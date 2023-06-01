Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B725410E550
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jun 2023 13:18:34 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Jun 2023 16:08:44 +0300
Message-Id: <20230601130850.26359-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20230601130850.26359-1-ville.syrjala@linux.intel.com>
References: <20230601130850.26359-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/7] tests/kms_tiled_display: Get rid of
 DP stuff
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Manasi Navare <manasi.d.navare@intel.com>, Madhumitha Tolakanahalli Pradeep
 <madhumitha.tolakanahalli.pradeep@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

There is nothing DP specific about the tile property. So
remove any mention of DP (and port sync which is an i915
hardware feature). Let's just talk about genlocked CRTCs
and tiled connectors, which is pretty generic.

Cc: Madhumitha Tolakanahalli Pradeep <madhumitha.tolakanahalli.pradeep@intel.com>
Cc: Manasi Navare <manasi.d.navare@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>
---
 .../{kms_dp_tiled_display.c => kms_tiled_display.c} | 13 +++----------
 tests/meson.build                                   |  2 +-
 2 files changed, 4 insertions(+), 11 deletions(-)
 rename tests/{kms_dp_tiled_display.c => kms_tiled_display.c} (97%)

diff --git a/tests/kms_dp_tiled_display.c b/tests/kms_tiled_display.c
similarity index 97%
rename from tests/kms_dp_tiled_display.c
rename to tests/kms_tiled_display.c
index 07b803a50540..3bb240fd574a 100644
--- a/tests/kms_dp_tiled_display.c
+++ b/tests/kms_tiled_display.c
@@ -25,7 +25,7 @@
  *      <madhumitha.tolakanahalli.pradeep@intel.com>
  *  Manasi Navare <manasi.d.navare@intel.com>
  *
- * Display Port Tiled Display Test
+ * Tiled display genlocked CRTC test
  * This test parses the tile information of the connectors that have TILE
  * property set, sets up the framebuffer with correct offsets corresponding to
  * the tile offsets and does an atomic modeset with two CRTCs for two
@@ -42,7 +42,7 @@
 #include "drm_fourcc.h"
 #include "igt_edid.h"
 
-IGT_TEST_DESCRIPTION("Test for Transcoder Port Sync for Display Port Tiled Displays");
+IGT_TEST_DESCRIPTION("Test for genlocked CRTCs with tiled displays");
 
 typedef struct {
 	igt_output_t *output;
@@ -122,8 +122,7 @@ static void get_number_of_h_tiles(data_t *data)
 						       res->connectors[i]);
 		igt_assert(connector);
 
-		if (connector->connection == DRM_MODE_CONNECTED &&
-		    connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) {
+		if (connector->connection == DRM_MODE_CONNECTED) {
 			get_connector_tile_props(data, connector, &tile);
 
 			data->num_h_tiles = tile.num_h_tile;
@@ -147,12 +146,6 @@ static void get_connectors(data_t *data)
 
 		igt_assert(conns[count].connector);
 
-		if (conns[count].connector->connector_type !=
-		    DRM_MODE_CONNECTOR_DisplayPort) {
-			drmModeFreeConnector(conns[count].connector);
-			continue;
-		}
-
 		get_connector_tile_props(data, conns[count].connector,
 					 &conns[count].tile);
 
diff --git a/tests/meson.build b/tests/meson.build
index f71be1dbe5f9..f908ae885973 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -29,7 +29,6 @@ test_progs = [
 	'kms_dither',
 	'kms_display_modes',
 	'kms_dp_aux_dev',
-	'kms_dp_tiled_display',
 	'kms_flip',
 	'kms_flip_event_leak',
 	'kms_force_connector_basic',
@@ -57,6 +56,7 @@ test_progs = [
 	'kms_sequence',
 	'kms_setmode',
 	'kms_sysfs_edid_timing',
+	'kms_tiled_display',
 	'kms_tv_load_detect',
 	'kms_universal_plane',
 	'kms_vblank',
-- 
2.39.3
