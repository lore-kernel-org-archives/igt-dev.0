Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF1C6E145
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Dec 2020 09:54:08 +0000 (UTC)
From: arundhati.hagaragi@intel.com
Date: Wed,  9 Dec 2020 04:12:36 +0530
Message-Id: <20201208224236.1345804-1-arundhati.hagaragi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane: Added test description
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
To: igt-dev@lists.freedesktop.org, arundhati.hagaragi@intel.com, swati2.sharma@intel.com, nidhi1.gupta@intel.com
Cc: Gupta@freedesktop.org, Sharma@freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Arundhati Hagaragi <arundhati.hagaragi@intel.com>

Added test description for test case

Cc: Gupta, Nidhi1 <nidhi1.gupta@intel.com>
Cc: Sharma, Swati2 <swati2.sharma@intel.com>
Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
---
 tests/kms_plane.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 3642d66f..80f9699f 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1040,10 +1040,14 @@ run_tests_for_pipe_plane(data_t *data, enum pipe pipe)
 		igt_require(data->display.pipes[pipe].n_planes > 0);
 	}
 
+	igt_describe("Tests the supported  pixel format for each"
+		       "plane and properties.");
 	igt_subtest_f("pixel-format-pipe-%s-planes",
 		      kmstest_pipe_name(pipe))
 		test_pixel_formats(data, pipe);
 
+	igt_describe("Tests the pixel format for source clamping"
+		       "for each plane and properties.");
 	igt_subtest_f("pixel-format-pipe-%s-planes-source-clamping",
 		      kmstest_pipe_name(pipe)) {
 		data->crop = 4;
@@ -1051,29 +1055,42 @@ run_tests_for_pipe_plane(data_t *data, enum pipe pipe)
 	}
 
 	data->crop = 0;
+	igt_describe("Tests the  CRC for plane position that fully"
+		       "cover hole and compares with reference CRC.");
 	igt_subtest_f("plane-position-covered-pipe-%s-planes",
 		      kmstest_pipe_name(pipe))
 		test_plane_position(data, pipe, 0);
 
+	igt_describe("Tests the CRC for plane position that partially"
+		       "cover hole and compares with reference CRC.");
 	igt_subtest_f("plane-position-hole-pipe-%s-planes",
 		      kmstest_pipe_name(pipe))
 		test_plane_position(data, pipe,
 				    TEST_POSITION_PARTIALLY_COVERED);
 
+	igt_describe("Tests the CRC for plane position that partially"
+		       "cover hole and checks dpms");
 	igt_subtest_f("plane-position-hole-dpms-pipe-%s-planes",
 		      kmstest_pipe_name(pipe))
 		test_plane_position(data, pipe,
 				    TEST_POSITION_PARTIALLY_COVERED |
 				    TEST_DPMS);
-
+	
+	igt_describe("Tests the  position(0,0) for requested large fb"
+		       "and compares it with reference crc collected.");
 	igt_subtest_f("plane-panning-top-left-pipe-%s-planes",
 		      kmstest_pipe_name(pipe))
 		test_plane_panning(data, pipe, TEST_PANNING_TOP_LEFT);
 
+	igt_describe("Tests the position(Hdisplay,Vdisplay) for requested"
+		       "large fb and compares it with reference crc collected.");
 	igt_subtest_f("plane-panning-bottom-right-pipe-%s-planes",
 		      kmstest_pipe_name(pipe))
 		test_plane_panning(data, pipe, TEST_PANNING_BOTTOM_RIGHT);
 
+	igt_describe("Tests the position(Hdisplay,Vdisplay) for requested"
+		       "large fb and compares it with reference CRC collected"
+		       "and also executes a system suspend cycles.");
 	igt_subtest_f("plane-panning-bottom-right-suspend-pipe-%s-planes",
 		      kmstest_pipe_name(pipe))
 		test_plane_panning(data, pipe, TEST_PANNING_BOTTOM_RIGHT |
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
