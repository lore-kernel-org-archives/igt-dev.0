Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3076E0BA
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Jan 2021 09:42:06 +0000 (UTC)
From: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Date: Tue, 19 Jan 2021 15:12:23 +0530
Message-Id: <20210119094223.899965-1-arundhati.hagaragi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_rotation_crc:Added subtest
 description
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
Cc: B@freedesktop.org, Gupta@freedesktop.org, S@freedesktop.org, Nidhi1 <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Added description for all subtests

Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: Gupta, Nidhi1 <nidhi1.gupta@intel.com>
Cc: B S, Karthik <Karthik.B.S@intel.com>
---
 tests/kms_rotation_crc.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 33a97cca..136e97fc 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -856,6 +856,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		igt_require(data.display.is_atomic);
 	}
 
+	igt_describe("Rotation test with 90/270 degree for primary and sprite planes of gen9+");
 	for (subtest = subtests; subtest->rot; subtest++) {
 		igt_subtest_f("%s-rotation-%s",
 			      plane_test_str(subtest->plane),
@@ -868,6 +869,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		}
 	}
 
+	igt_describe("Rotation test with 90 degree for a plane of gen9+ with given position");
 	igt_subtest_f("sprite-rotation-90-pos-100-0") {
 		igt_require(gen >= 9);
 		data.rotation = IGT_ROTATION_90;
@@ -878,6 +880,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	data.pos_x = 0,
 	data.pos_y = 0;
 
+	igt_describe("Checking unsupported pixel format for gen9+ with 90 degree of rotation");
 	igt_subtest_f("bad-pixel-format") {
 		 /* gen11 enables RGB565 rotation for 90/270 degrees.
 		  * so apart from this, any other gen11+ pixel format
@@ -890,6 +893,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	}
 	data.override_fmt = 0;
 
+	igt_describe("Checking unsupported tiling for gen9+ with 90 degree of rotation");
 	igt_subtest_f("bad-tiling") {
 		igt_require(gen >= 9);
 		data.rotation = IGT_ROTATION_90;
@@ -898,6 +902,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	}
 	data.override_tiling = 0;
 
+	igt_describe("Tiling and Rotation test for gen 10+ for primary plane");
 	for (reflect_x = reflect_x_subtests; reflect_x->tiling; reflect_x++) {
 		igt_subtest_f("primary-%s-reflect-x-%s",
 			      tiling_test_str(reflect_x->tiling),
@@ -911,6 +916,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		}
 	}
 
+	igt_describe("Rotation test on both planes by making them fully visible");
 	igt_subtest_f("multiplane-rotation") {
 		igt_require(gen >= 9);
 		cleanup_crtc(&data);
@@ -923,6 +929,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		test_multi_plane_rotation(&data, 0);
 	}
 
+	igt_describe("Rotation test on both planes by cropping left/top corner of primary plane and"
+			"right/top corner of sprite plane");
 	igt_subtest_f("multiplane-rotation-cropping-top") {
 		igt_require(gen >= 9);
 		cleanup_crtc(&data);
@@ -935,6 +943,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		test_multi_plane_rotation(&data, 0);
 	}
 
+	igt_describe("Rotation test on both planes by cropping left/bottom corner of primary plane"
+			"and right/bottom corner of sprite plane");
 	igt_subtest_f("multiplane-rotation-cropping-bottom") {
 		igt_require(gen >= 9);
 		cleanup_crtc(&data);
@@ -951,6 +961,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	 * exhaust-fences should be last test, if it fails we may OOM in
 	 * the following subtests otherwise.
 	 */
+	igt_describe("This test intends to check for fence leaks exhaustively");
 	igt_subtest_f("exhaust-fences") {
 		enum pipe pipe;
 		igt_output_t *output;
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
