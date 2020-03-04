Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EACDD89CA4
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2020 19:16:24 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Wed,  4 Mar 2020 17:48:15 +0530
Message-Id: <1583324295-22013-1-git-send-email-kunal1.joshi@intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/kms_chamelium: Add support to
 validate YUV pixel formats
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Currently, only hard coded pixel formats are validated which are not
generic for all the platforms which leads to false alarms.
Added support to validate only those pixel formats which are supported
by platform.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_chamelium.c | 70 +++++++++++++++++++++++----------------------------
 1 file changed, 32 insertions(+), 38 deletions(-)

diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
index 5c4a189..d6d63c6 100644
--- a/tests/kms_chamelium.c
+++ b/tests/kms_chamelium.c
@@ -2612,6 +2612,14 @@ static const struct edid *get_edid(enum test_edid edid)
 			if (chamelium_port_get_type(port) == \
 			    DRM_MODE_CONNECTOR_ ## type__)
 
+#define connector_subtest_start(name__, type__)              \
+	igt_subtest_with_dynamic(name__)                     \
+		for_each_port(p, port)                       \
+			if (chamelium_port_get_type(port) == \
+			    DRM_MODE_CONNECTOR_ ## type__) {
+
+#define connector_subtest_end }
+
 static data_t data;
 
 IGT_TEST_DESCRIPTION("Tests requiring a Chamelium board");
@@ -2872,44 +2880,30 @@ igt_main
 						   CHAMELIUM_CHECK_CRC);
 
 		igt_describe(test_display_one_mode_desc);
-		connector_subtest("hdmi-cmp-nv12", HDMIA)
-			test_display_one_mode(&data, port, DRM_FORMAT_NV12,
-					      CHAMELIUM_CHECK_CHECKERBOARD, 1);
-
-		igt_describe(test_display_one_mode_desc);
-		connector_subtest("hdmi-cmp-nv16", HDMIA)
-			test_display_one_mode(&data, port, DRM_FORMAT_NV16,
-					      CHAMELIUM_CHECK_CHECKERBOARD, 1);
-
-		igt_describe(test_display_one_mode_desc);
-		connector_subtest("hdmi-cmp-nv21", HDMIA)
-			test_display_one_mode(&data, port, DRM_FORMAT_NV21,
-					      CHAMELIUM_CHECK_CHECKERBOARD, 1);
-
-		igt_describe(test_display_one_mode_desc);
-		connector_subtest("hdmi-cmp-nv61", HDMIA)
-			test_display_one_mode(&data, port, DRM_FORMAT_NV61,
-					      CHAMELIUM_CHECK_CHECKERBOARD, 1);
-
-		igt_describe(test_display_one_mode_desc);
-		connector_subtest("hdmi-cmp-yu12", HDMIA)
-			test_display_one_mode(&data, port, DRM_FORMAT_YUV420,
-					      CHAMELIUM_CHECK_CHECKERBOARD, 1);
-
-		igt_describe(test_display_one_mode_desc);
-		connector_subtest("hdmi-cmp-yu16", HDMIA)
-			test_display_one_mode(&data, port, DRM_FORMAT_YUV422,
-					      CHAMELIUM_CHECK_CHECKERBOARD, 1);
-
-		igt_describe(test_display_one_mode_desc);
-		connector_subtest("hdmi-cmp-yv12", HDMIA)
-			test_display_one_mode(&data, port, DRM_FORMAT_YVU420,
-					      CHAMELIUM_CHECK_CHECKERBOARD, 1);
-
-		igt_describe(test_display_one_mode_desc);
-		connector_subtest("hdmi-cmp-yv16", HDMIA)
-			test_display_one_mode(&data, port, DRM_FORMAT_YVU422,
-					      CHAMELIUM_CHECK_CHECKERBOARD, 1);
+		connector_subtest_start("hdmi-yuv", HDMIA)
+			int k;
+			igt_output_t *output;
+			igt_plane_t *primary;
+
+			output = prepare_output(&data, port, TEST_EDID_BASE);
+			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+			igt_assert(primary);
+
+			for (k = 0; k < primary->format_mod_count; k++) {
+
+				if (!igt_fb_supported_format(primary->formats[k]))
+					continue;
+
+				if (!(igt_format_is_yuv(primary->formats[k])
+				   && primary->modifiers[k] != LOCAL_DRM_FORMAT_MOD_NONE))
+					continue;
+
+				igt_dynamic_f("%c%c%c%c", IGT_FORMAT_ARGS(primary->formats[k]))
+					test_display_one_mode(&data, port, primary->formats[k],
+							      CHAMELIUM_CHECK_CHECKERBOARD,
+							      1);
+			}
+		connector_subtest_end
 
 		igt_describe(test_display_planes_random_desc);
 		connector_subtest("hdmi-cmp-planes-random", HDMIA)
-- 
2.7.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
