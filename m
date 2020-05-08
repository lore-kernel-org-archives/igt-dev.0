Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467496EABF
 for <igt-dev@lists.freedesktop.org>; Fri,  8 May 2020 09:24:37 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Fri,  8 May 2020 07:56:54 +0530
Message-Id: <20200508022655.5059-2-kunal1.joshi@intel.com>
In-Reply-To: <20200508022655.5059-1-kunal1.joshi@intel.com>
References: <20200508022655.5059-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/kms_chamelium Fix DP FSM in
 dp-mode-timings
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

Receiver reset is always required after we set a new mode, so let's disable
the mode (reset_state() does that) before we switch to a new mode.
With this we will get the HPD pulses reliably for each iteration over
all the supoprted modes.

For more details
Refer commit: c8dc1fd926a550308b971ca7d83fe0a927a38152

Cc: Hiler Arkadiusz <arkadiusz.hiler@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Issue: https://gitlab.freedesktop.org/drm/intel/issues/262
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_chamelium.c | 43 ++++++++++++++++++++++++++++---------------
 1 file changed, 28 insertions(+), 15 deletions(-)

diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
index 421a9006..4fe26d61 100644
--- a/tests/kms_chamelium.c
+++ b/tests/kms_chamelium.c
@@ -1017,23 +1017,37 @@ static const char test_mode_timings_desc[] =
 	"mode detected by the Chamelium receiver matches the mode we set";
 static void test_mode_timings(data_t *data, struct chamelium_port *port)
 {
-	igt_output_t *output;
-	igt_plane_t *primary;
-	drmModeConnector *connector;
-	int fb_id, i;
-	struct igt_fb fb;
+	int i, count_modes;
 
+	i = 0;
 	igt_require(chamelium_supports_get_video_params(data->chamelium));
+	do {
+		igt_output_t *output;
+		igt_plane_t *primary;
+		drmModeConnector *connector;
+		int fb_id, i;
+		struct igt_fb fb;
 
-	reset_state(data, port);
+		/*
+		 * let's reset state each mode so we will get the
+		 * HPD pulses realibably
+		 */
+		reset_state(data, port);
 
-	output = prepare_output(data, port, TEST_EDID_BASE);
-	connector = chamelium_port_get_connector(data->chamelium, port, false);
-	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-	igt_assert(primary);
+		/*
+		 * modes may change due to mode pruining and link issues, so we
+		 * need to refresh the connector
+		 */
+		output = prepare_output(data, port, TEST_EDID_BASE);
+		connector = chamelium_port_get_connector(data->chamelium, port, false);
+		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+		igt_assert(primary);
 
-	igt_assert(connector->count_modes > 0);
-	for (i = 0; i < connector->count_modes; i++) {
+		/* we may skip some modes due to above but that's ok */
+		count_modes = connector->count_modes;
+		if (i >= count_modes)
+			break;
+		
 		drmModeModeInfo *mode = &connector->modes[i];
 
 		fb_id = igt_create_color_pattern_fb(data->drm_fd,
@@ -1051,9 +1065,8 @@ static void test_mode_timings(data_t *data, struct chamelium_port *port)
 		check_mode(data->chamelium, port, mode);
 
 		igt_remove_fb(data->drm_fd, &fb);
-	}
-
-	drmModeFreeConnector(connector);
+		drmModeFreeConnector(connector);
+	} (++i < count_modes);
 }
 
 /* Set of Video Identification Codes advertised in the EDID */
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
