Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4954210E24B
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jun 2023 13:18:47 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Jun 2023 16:08:46 +0300
Message-Id: <20230601130850.26359-4-ville.syrjala@linux.intel.com>
In-Reply-To: <20230601130850.26359-1-ville.syrjala@linux.intel.com>
References: <20230601130850.26359-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 3/7] tests/kms_tiled_display: Cleanup the
 chamelium ifdefs
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

Clean up the mess around the chmelium ifdes a bit.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_tiled_display.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
index ad98462012db..75cda62db28e 100644
--- a/tests/kms_tiled_display.c
+++ b/tests/kms_tiled_display.c
@@ -61,19 +61,14 @@ typedef struct {
 	enum igt_commit_style commit;
 	struct timeval first_ts;
 
-	#ifdef HAVE_CHAMELIUM
+#ifdef HAVE_CHAMELIUM
 	struct chamelium *chamelium;
 	struct chamelium_port **ports;
 	int port_count;
 	struct chamelium_edid *edids[IGT_CUSTOM_EDID_COUNT];
-	#endif
-
+#endif
 } data_t;
 
-#ifdef HAVE_CHAMELIUM
-static void test_with_chamelium(data_t *data, igt_display_t *display);
-#endif
-
 static int drm_property_is_tile(drmModePropertyPtr prop)
 {
 	return (strcmp(prop->name, "TILE") ? 0 : 1) &&
@@ -473,9 +468,9 @@ igt_main
 		test_cleanup(&data);
 	}
 
-	#ifdef HAVE_CHAMELIUM
-        igt_describe("Make sure the Tiled CRTCs are synchronized and we get "
-                     "page flips for all tiled CRTCs in one vblank (executes on chamelium).");
+#ifdef HAVE_CHAMELIUM
+	igt_describe("Make sure the Tiled CRTCs are synchronized and we get "
+		     "page flips for all tiled CRTCs in one vblank (executes on chamelium).");
 	igt_subtest_f("basic-test-pattern-with-chamelium") {
 		int i;
 
@@ -487,7 +482,8 @@ igt_main
 					      data.ports[i], data.ports,
 					      data.port_count);
 	}
-	#endif
+#endif
+
 	igt_fixture {
 		free(data.conns);
 		kmstest_restore_vt_mode();
-- 
2.39.3
