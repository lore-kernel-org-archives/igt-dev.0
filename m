Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2AF36EBF9
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2020 15:29:31 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Fri, 13 Mar 2020 17:29:11 +0200
Message-ID: <20200313152911.580802-2-arkadiusz.hiler@intel.com>
In-Reply-To: <20200313152911.580802-1-arkadiusz.hiler@intel.com>
References: <20200313152911.580802-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_chamelium: Get rid of
 dp-link-status subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Martin Peres <martin.peres@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

The test is making Chamelium's receiver signal a need for retraining to
the upstream, which i915 handles correctly. Then it asserts a number of
conditions that are neither a part of the DisplayPort spec, conformance
test suite or the current driver's behavior.

The test needs a complete rethinking. Let's remove it instead of letting
it bitrot further.

Fixes: https://gitlab.freedesktop.org/drm/intel/issues/1059
Cc: Martin Peres <martin.peres@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 lib/igt_chamelium.c   |  15 -----
 lib/igt_chamelium.h   |   3 -
 tests/kms_chamelium.c | 147 ------------------------------------------
 3 files changed, 165 deletions(-)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index aaf17d51..2a4930ec 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -1206,21 +1206,6 @@ void chamelium_infoframe_destroy(struct chamelium_infoframe *infoframe)
 	free(infoframe);
 }
 
-bool chamelium_supports_trigger_link_failure(struct chamelium *chamelium)
-{
-	return chamelium_supports_method(chamelium, "TriggerLinkFailure");
-}
-
-/**
- * chamelium_trigger_link_failure: trigger a link failure on the provided port.
- */
-void chamelium_trigger_link_failure(struct chamelium *chamelium,
-				    struct chamelium_port *port)
-{
-	xmlrpc_DECREF(chamelium_rpc(chamelium, port, "TriggerLinkFailure",
-				    "(i)", port->id));
-}
-
 bool chamelium_has_audio_support(struct chamelium *chamelium,
 				 struct chamelium_port *port)
 {
diff --git a/lib/igt_chamelium.h b/lib/igt_chamelium.h
index d03c924a..bdfdd546 100644
--- a/lib/igt_chamelium.h
+++ b/lib/igt_chamelium.h
@@ -161,9 +161,6 @@ struct chamelium_infoframe *
 chamelium_get_last_infoframe(struct chamelium *chamelium,
 			     struct chamelium_port *port,
 			     enum chamelium_infoframe_type type);
-bool chamelium_supports_trigger_link_failure(struct chamelium *chamelium);
-void chamelium_trigger_link_failure(struct chamelium *chamelium,
-				    struct chamelium_port *port);
 bool chamelium_has_audio_support(struct chamelium *chamelium,
 				 struct chamelium_port *port);
 void chamelium_get_audio_channel_mapping(struct chamelium *chamelium,
diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
index 2acac1e4..3d0b429a 100644
--- a/tests/kms_chamelium.c
+++ b/tests/kms_chamelium.c
@@ -578,149 +578,6 @@ enable_output(data_t *data,
 	drmModeFreeConnector(connector);
 }
 
-static bool find_mode(const drmModeModeInfo *list, size_t list_len,
-		      const drmModeModeInfo *mode)
-{
-	size_t i;
-
-	for (i = 0; i < list_len; i++) {
-		if (memcmp(&list[i], mode, sizeof(*mode)) == 0) {
-			return true;
-		}
-	}
-
-	return false;
-}
-
-static void check_modes_subset(const drmModeModeInfo *prev, size_t prev_len,
-			       const drmModeModeInfo *cur, size_t cur_len)
-{
-	size_t i;
-
-	for (i = 0; i < cur_len; i++) {
-		igt_assert_f(find_mode(prev, prev_len, &cur[i]),
-			     "Got new mode %s after link status failure\n",
-			     cur[i].name);
-	}
-
-	igt_assert(cur_len <= prev_len); /* safety net */
-	igt_debug("New mode list contains %zu less modes\n",
-		  prev_len - cur_len);
-}
-
-static bool are_fallback_modes(const drmModeModeInfo *modes, size_t modes_len)
-{
-	igt_assert(modes_len > 0);
-
-	return modes[0].hdisplay <= 1024 && modes[0].vdisplay <= 768;
-}
-
-static const char test_link_status_desc[] =
-	"Simulate a series of link failures, check we get a uevent each time "
-	"with the link-status property set to BAD and the list of modes "
-	"shrinks (or stays the same), until we reach fallback modes";
-static void
-test_link_status(data_t *data, struct chamelium_port *port)
-{
-	drmModeConnector *connector;
-	igt_output_t *output;
-	igt_plane_t *primary;
-	drmModeModeInfo *prev_modes;
-	size_t prev_modes_len;
-	drmModeModeInfo mode = {0};
-	uint32_t link_status_id;
-	uint64_t link_status;
-	bool has_prop;
-	unsigned int fb_id = 0;
-	struct igt_fb fb;
-	struct udev_monitor *mon;
-
-	igt_require(chamelium_supports_trigger_link_failure(data->chamelium));
-
-	reset_state(data, port);
-
-	output = prepare_output(data, port, TEST_EDID_BASE);
-	connector = chamelium_port_get_connector(data->chamelium, port, false);
-	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-	igt_assert(primary);
-
-	has_prop = kmstest_get_property(data->drm_fd, connector->connector_id,
-					DRM_MODE_OBJECT_CONNECTOR,
-					"link-status", &link_status_id,
-					&link_status, NULL);
-	igt_require(has_prop);
-	igt_assert_f(link_status == DRM_MODE_LINK_STATUS_GOOD,
-		     "Expected link status to be %d initially, got %"PRIu64"\n",
-		     DRM_MODE_LINK_STATUS_GOOD, link_status);
-
-	igt_debug("Connector has %d modes\n", connector->count_modes);
-	prev_modes_len = connector->count_modes;
-	prev_modes = malloc(prev_modes_len * sizeof(drmModeModeInfo));
-	memcpy(prev_modes, connector->modes,
-	       prev_modes_len * sizeof(drmModeModeInfo));
-
-	mon = igt_watch_hotplug();
-
-	while (1) {
-		if (link_status == DRM_MODE_LINK_STATUS_BAD) {
-			igt_output_set_prop_value(output,
-						  IGT_CONNECTOR_LINK_STATUS,
-						  DRM_MODE_LINK_STATUS_GOOD);
-		}
-
-		if (memcmp(&connector->modes[0], &mode, sizeof(mode)) != 0) {
-			igt_assert(connector->count_modes > 0);
-			mode = connector->modes[0];
-			igt_debug("Modesetting with %s\n", mode.name);
-			if (fb_id > 0)
-				igt_remove_fb(data->drm_fd, &fb);
-			fb_id = igt_create_color_pattern_fb(data->drm_fd,
-							    mode.hdisplay,
-							    mode.vdisplay,
-							    DRM_FORMAT_XRGB8888,
-							    LOCAL_DRM_FORMAT_MOD_NONE,
-							    0, 0, 0, &fb);
-			igt_assert(fb_id > 0);
-			enable_output(data, port, output, &mode, &fb);
-		} else {
-			igt_display_commit2(&data->display, COMMIT_ATOMIC);
-		}
-
-		igt_debug("Triggering link failure\n");
-		chamelium_trigger_link_failure(data->chamelium, port);
-
-		igt_assert(igt_hotplug_detected(mon, HOTPLUG_TIMEOUT));
-		igt_assert_eq(reprobe_connector(data, port),
-			      DRM_MODE_CONNECTED);
-
-		igt_flush_hotplugs(mon);
-
-		drmModeFreeConnector(connector);
-		connector = chamelium_port_get_connector(data->chamelium, port,
-							 false);
-		link_status = igt_output_get_prop(output, IGT_CONNECTOR_LINK_STATUS);
-		igt_assert_f(link_status == DRM_MODE_LINK_STATUS_BAD,
-			     "Expected link status to be %d after link failure, "
-			     "got %"PRIu64"\n",
-			     DRM_MODE_LINK_STATUS_BAD, link_status);
-		check_modes_subset(prev_modes, prev_modes_len,
-				   connector->modes, connector->count_modes);
-		prev_modes_len = connector->count_modes;
-		memcpy(prev_modes, connector->modes,
-		       connector->count_modes * sizeof(drmModeModeInfo));
-
-		if (are_fallback_modes(connector->modes, connector->count_modes)) {
-			igt_debug("Reached fallback modes\n");
-			break;
-		}
-	}
-
-	igt_cleanup_hotplug(mon);
-	igt_remove_fb(data->drm_fd, &fb);
-	free(prev_modes);
-	drmModeFreeConnector(connector);
-}
-
 static void chamelium_paint_xr24_pattern(uint32_t *data,
 					 size_t width, size_t height,
 					 size_t stride, size_t block_size)
@@ -2693,10 +2550,6 @@ igt_main
 			test_hpd_storm_disable(&data, port,
 					       HPD_STORM_PULSE_INTERVAL_DP);
 
-		igt_describe(test_link_status_desc);
-		connector_subtest("dp-link-status", DisplayPort)
-			test_link_status(&data, port);
-
 		igt_describe(test_suspend_resume_edid_change_desc);
 		connector_subtest("dp-edid-change-during-suspend", DisplayPort)
 			test_suspend_resume_edid_change(&data, port,
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
