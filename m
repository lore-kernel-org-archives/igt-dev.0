Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853DD6E22D
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2020 05:24:05 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Thu, 16 Apr 2020 03:56:19 +0530
Message-Id: <20200415222619.10293-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_chamelium: Capture on type-c
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
To: arkadiusz.hiler@intel.com, igt-dev@lists.freedesktop.org, imre.deak@intel.com
Cc: Kunal Joshi <kunal1.joshi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

When we try to capture from chamelium it sends hpd pulse 
when it needs fsm handling but on type-c connector we
dodn't get it when the modeset is enabled, disabling
modeset so  we get hpd pulse.

Cc: Hiler Arkadiusz <arkadiusz.hiler@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Issue: https://gitlab.freedesktop.org/drm/intel/issues/262
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_chamelium.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
index 8b20bbb..3639f5a 100644
--- a/tests/kms_chamelium.c
+++ b/tests/kms_chamelium.c
@@ -672,7 +672,6 @@ test_suspend_resume_edid_change(data_t *data, struct chamelium_port *port,
 	get_connectors_link_status_failed(data, link_status_failed[0]);
 
 	igt_flush_hotplugs(mon);
-
 	igt_system_suspend_autoresume(state, test);
 	igt_assert(igt_hotplug_detected(mon, HOTPLUG_TIMEOUT));
 	chamelium_assert_reachable(data->chamelium, ONLINE_TIMEOUT);
@@ -841,6 +840,11 @@ static void test_display_all_modes(data_t *data, struct chamelium_port *port,
 		bridge = check_analog_bridge(data, port);
 
 	for (i = 0; i < connector->count_modes; i++) {
+	        output = prepare_output(data, port, TEST_EDID_BASE);
+	        connector = chamelium_port_get_connector(data->chamelium, port, false);
+	        primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	        igt_assert(primary);
+	        igt_require(igt_plane_has_format_mod(primary, fourcc, LOCAL_DRM_FORMAT_MOD_NONE));
 		drmModeModeInfo *mode = &connector->modes[i];
 
 		if (check == CHAMELIUM_CHECK_ANALOG && bridge &&
@@ -848,6 +852,7 @@ static void test_display_all_modes(data_t *data, struct chamelium_port *port,
 			continue;
 
 		do_test_display(data, port, output, mode, fourcc, check, count);
+		reset_state(data, port);
 	}
 
 	drmModeFreeConnector(connector);
@@ -876,6 +881,10 @@ test_display_frame_dump(data_t *data, struct chamelium_port *port)
 	igt_assert(primary);
 
 	for (i = 0; i < connector->count_modes; i++) {
+		output = prepare_output(data, port, TEST_EDID_BASE);
+		connector = chamelium_port_get_connector(data->chamelium, port, false);
+		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+		igt_assert(primary);
 		mode = &connector->modes[i];
 		fb_id = igt_create_color_pattern_fb(data->drm_fd,
 						    mode->hdisplay, mode->vdisplay,
@@ -896,6 +905,7 @@ test_display_frame_dump(data_t *data, struct chamelium_port *port)
 		}
 
 		igt_remove_fb(data->drm_fd, &fb);
+		reset_state(data, port);
 	}
 
 	drmModeFreeConnector(connector);
@@ -2506,7 +2516,6 @@ test_hpd_storm_detect(data_t *data, struct chamelium_port *port, int width)
 {
 	struct udev_monitor *mon;
 	int count = 0;
-
 	igt_require_hpd_storm_ctl(data->drm_fd);
 	reset_state(data, port);
 
-- 
2.7.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
