Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 237986E415
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Jan 2021 09:23:40 +0000 (UTC)
From: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Date: Thu,  7 Jan 2021 03:41:06 +0530
Message-Id: <20210106221106.3907099-1-arundhati.hagaragi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v4] tests/kms_plane: Added test description
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

Added test description for test case

Cc: Gupta, Nidhi1 <nidhi1.gupta@intel.com>
Cc: B S, Karthik <Karthik.B.S@intel.com>
Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>

v2: modified subtests description to be more specific. (Karthik)
v3: added and modified description for subtests to be more specific. (Karthik)
v4: modified description for subtests
---
 tests/kms_plane.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 2f0c9d9d..8bd4bdb6 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1034,10 +1034,12 @@ run_tests_for_pipe_plane(data_t *data, enum pipe pipe)
 		igt_require(data->display.pipes[pipe].n_planes > 0);
 	}
 
+	igt_describe("verify the pixel formats for given plane and pipe");
 	igt_subtest_f("pixel-format-pipe-%s-planes",
 		      kmstest_pipe_name(pipe))
 		test_pixel_formats(data, pipe);
 
+	igt_describe("verify the pixel formats for given plane and pipe with clamping test");
 	igt_subtest_f("pixel-format-pipe-%s-planes-source-clamping",
 		      kmstest_pipe_name(pipe)) {
 		data->crop = 4;
@@ -1045,29 +1047,35 @@ run_tests_for_pipe_plane(data_t *data, enum pipe pipe)
 	}
 
 	data->crop = 0;
+	igt_describe("verify plane position using two planes to create a fully covered screen");
 	igt_subtest_f("plane-position-covered-pipe-%s-planes",
 		      kmstest_pipe_name(pipe))
 		test_plane_position(data, pipe, 0);
 
+	igt_describe("verify plane position using two planes to create a partially covered screen");
 	igt_subtest_f("plane-position-hole-pipe-%s-planes",
 		      kmstest_pipe_name(pipe))
 		test_plane_position(data, pipe,
 				    TEST_POSITION_PARTIALLY_COVERED);
 
+	igt_describe("verify plane position using two planes to create a partially covered screen and check for DPMS");
 	igt_subtest_f("plane-position-hole-dpms-pipe-%s-planes",
 		      kmstest_pipe_name(pipe))
 		test_plane_position(data, pipe,
 				    TEST_POSITION_PARTIALLY_COVERED |
 				    TEST_DPMS);
 
+	igt_describe("verify the panning at top-left position using a plane");
 	igt_subtest_f("plane-panning-top-left-pipe-%s-planes",
 		      kmstest_pipe_name(pipe))
 		test_plane_panning(data, pipe, TEST_PANNING_TOP_LEFT);
 
+	igt_describe("verify the panning at bottom-right position using a plane");
 	igt_subtest_f("plane-panning-bottom-right-pipe-%s-planes",
 		      kmstest_pipe_name(pipe))
 		test_plane_panning(data, pipe, TEST_PANNING_BOTTOM_RIGHT);
 
+	igt_describe("verify panning at bottom-right position using a plane and executes system suspend cycles");
 	igt_subtest_f("plane-panning-bottom-right-suspend-pipe-%s-planes",
 		      kmstest_pipe_name(pipe))
 		test_plane_panning(data, pipe, TEST_PANNING_BOTTOM_RIGHT |
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
