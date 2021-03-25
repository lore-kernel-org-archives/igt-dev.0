Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB6D6EB5A
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Mar 2021 12:28:32 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Fri, 26 Mar 2021 01:50:13 +0530
Message-Id: <20210325202013.17313-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_color_chamelium: Fix limited
 range ctm
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Verify that the framebuffer reference with RGB_FULL & limited
colors should match with the frame dump with RGB_16_235 & full
colors.

Cc: Kunal Joshi <kunal1.joshi@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color_chamelium.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/tests/kms_color_chamelium.c b/tests/kms_color_chamelium.c
index 30b38b82e..0bc2b9c27 100644
--- a/tests/kms_color_chamelium.c
+++ b/tests/kms_color_chamelium.c
@@ -464,29 +464,28 @@ static void test_pipe_limited_range_ctm(data_t *data,
 		set_gamma(data, primary->pipe, gamma_linear);
 		set_ctm(primary->pipe, ctm);
 
-		igt_output_set_prop_value(output,
-					  IGT_CONNECTOR_BROADCAST_RGB,
-					  BROADCAST_RGB_FULL);
-		paint_rectangles(data, mode, red_green_blue_limited, &fb);
-		igt_plane_set_fb(primary, &fb);
-		igt_display_commit(&data->display);
-
 		/* Set the output into limited range. */
 		igt_output_set_prop_value(output,
 					  IGT_CONNECTOR_BROADCAST_RGB,
 					  BROADCAST_RGB_16_235);
 		paint_rectangles(data, mode, red_green_blue_full, &fb);
 
+		igt_plane_set_fb(primary, &fb);
+		igt_display_commit(&data->display);
+
+		chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
+		frame_limited =
+			chamelium_read_captured_frame(data->chamelium, 0);
+
 		/* And reset.. */
 		igt_output_set_prop_value(output,
 					  IGT_CONNECTOR_BROADCAST_RGB,
 					  BROADCAST_RGB_FULL);
+
+		paint_rectangles(data, mode, red_green_blue_limited, &fbref);
 		igt_plane_set_fb(primary, NULL);
 		igt_output_set_pipe(output, PIPE_NONE);
-		chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
-		frame_limited =
-			chamelium_read_captured_frame(data->chamelium, 0);
-
+		igt_display_commit(&data->display);
 
 		/* Verify that the framebuffer reference of the software
 		 * computed output is equal to the frame dump of the CTM
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
