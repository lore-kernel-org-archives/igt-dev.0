Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 904826E2ED
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Dec 2020 13:01:56 +0000 (UTC)
From: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Date: Thu, 17 Dec 2020 07:20:00 +0530
Message-Id: <20201217015000.2213437-1-arundhati.hagaragi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2] tests/kms_plane: Added test description
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
Cc: Sharma@freedesktop.org, Gupta@freedesktop.org, nidhi1.gupta@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Added test description for test case

Cc: Gupta, Nidhi1 <nidhi1.gupta@intel.com>
Cc: Sharma, Swati2 <swati2.sharma@intel.com>
Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>

v2: modified subtests description to be more specific. (Karthik)
---
 tests/kms_plane.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 3642d66f..d01e2404 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1051,29 +1051,37 @@ run_tests_for_pipe_plane(data_t *data, enum pipe pipe)
 	}
 
 	data->crop = 0;
+	igt_describe("verifying position of two planes fully covering each other");
 	igt_subtest_f("plane-position-covered-pipe-%s-planes",
 		      kmstest_pipe_name(pipe))
 		test_plane_position(data, pipe, 0);
 
+	igt_describe("verifying position of two planes partially covering each other");
 	igt_subtest_f("plane-position-hole-pipe-%s-planes",
 		      kmstest_pipe_name(pipe))
 		test_plane_position(data, pipe,
 				    TEST_POSITION_PARTIALLY_COVERED);
 
+	igt_describe("verifying position of two planes partially covering each other and"
+		"check for DPMS");
 	igt_subtest_f("plane-position-hole-dpms-pipe-%s-planes",
 		      kmstest_pipe_name(pipe))
 		test_plane_position(data, pipe,
 				    TEST_POSITION_PARTIALLY_COVERED |
 				    TEST_DPMS);
 
+	igt_describe("verifying panning at top left position for two planes");
 	igt_subtest_f("plane-panning-top-left-pipe-%s-planes",
 		      kmstest_pipe_name(pipe))
 		test_plane_panning(data, pipe, TEST_PANNING_TOP_LEFT);
 
+	igt_describe("verifying panning at bottom right position for two planes");
 	igt_subtest_f("plane-panning-bottom-right-pipe-%s-planes",
 		      kmstest_pipe_name(pipe))
 		test_plane_panning(data, pipe, TEST_PANNING_BOTTOM_RIGHT);
 
+	igt_describe("verifying panning at bottom right position for two planes and "
+		"executes system suspend cycles");
 	igt_subtest_f("plane-panning-bottom-right-suspend-pipe-%s-planes",
 		      kmstest_pipe_name(pipe))
 		test_plane_panning(data, pipe, TEST_PANNING_BOTTOM_RIGHT |
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
