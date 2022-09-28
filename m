Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC3810E290
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 06:37:43 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 28 Sep 2022 12:09:08 +0530
Message-Id: <20220928063912.2963498-2-kunal1.joshi@intel.com>
In-Reply-To: <20220928063912.2963498-1-kunal1.joshi@intel.com>
References: <20220928063912.2963498-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/5] tests/chamelium/kms_chamelium: test
 cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

v1:
Sanitize the state before starting the subtest

v2:
Corrected commit subject (Swati)
Removed comments (Swati)

Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
CC: Jeevan B <jeevan.b@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 tests/chamelium/kms_chamelium.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/chamelium/kms_chamelium.c b/tests/chamelium/kms_chamelium.c
index 1be1c41a..d3bc72ae 100644
--- a/tests/chamelium/kms_chamelium.c
+++ b/tests/chamelium/kms_chamelium.c
@@ -756,6 +756,8 @@ static void test_display_one_mode(data_t *data, struct chamelium_port *port,
 	igt_output_t *output;
 	igt_plane_t *primary;
 
+	igt_display_reset(&data->display);
+
 	igt_modeset_disable_all_outputs(&data->display);
 	chamelium_reset_state(&data->display, data->chamelium,
 			      port, data->ports, data->port_count);
@@ -792,6 +794,8 @@ static void test_display_all_modes(data_t *data, struct chamelium_port *port,
 	if (check == CHAMELIUM_CHECK_ANALOG)
 		bridge = check_analog_bridge(data, port);
 
+	igt_display_reset(&data->display);
+
 	i = 0;
 	do {
 		igt_output_t *output;
@@ -847,6 +851,8 @@ test_display_frame_dump(data_t *data, struct chamelium_port *port)
 
 	int i, count_modes;
 
+	igt_display_reset(&data->display);
+
 	i = 0;
 	do {
 		igt_output_t *output;
@@ -986,6 +992,8 @@ static void test_mode_timings(data_t *data, struct chamelium_port *port)
 {
 	int i, count_modes;
 
+	igt_display_reset(&data->display);
+
 	i = 0;
 	igt_require(chamelium_supports_get_video_params(data->chamelium));
 	do {
@@ -1104,6 +1112,7 @@ static void test_display_aspect_ratio(data_t *data, struct chamelium_port *port)
 	uint32_t aspect_ratio;
 	enum infoframe_avi_picture_aspect_ratio frame_ar;
 
+	igt_display_reset(&data->display);
 	igt_require(chamelium_supports_get_last_infoframe(data->chamelium));
 
 	igt_modeset_disable_all_outputs(&data->display);
@@ -1835,6 +1844,8 @@ test_display_audio(data_t *data, struct chamelium_port *port,
 	 * chamelium_get_audio_format support. */
 	igt_require(chamelium_has_audio_support(data->chamelium, port));
 
+	igt_display_reset(&data->display);
+
 	alsa = alsa_init();
 	igt_assert(alsa);
 
@@ -1921,6 +1932,8 @@ test_display_audio_edid(data_t *data, struct chamelium_port *port,
 
 	igt_require(eld_is_supported());
 
+	igt_display_reset(&data->display);
+
 	igt_modeset_disable_all_outputs(&data->display);
 	chamelium_reset_state(&data->display, data->chamelium,
 			      port, data->ports, data->port_count);
@@ -2348,6 +2361,8 @@ static void test_display_planes_random(data_t *data,
 	unsigned int i;
 	unsigned int fb_id;
 
+	igt_display_reset(&data->display);
+
 	switch (check) {
 	case CHAMELIUM_CHECK_CRC:
 		allow_scaling = false;
-- 
2.25.1
