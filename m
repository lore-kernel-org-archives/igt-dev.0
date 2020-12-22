Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161C76E0D0
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Dec 2020 05:06:48 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
Date: Tue, 22 Dec 2020 10:08:13 +0530
Message-Id: <20201222043813.15566-2-karthik.b.s@intel.com>
In-Reply-To: <20201222043813.15566-1-karthik.b.s@intel.com>
References: <20201222043813.15566-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/1] tests/kms_plane: Test optimization by
 removing redundancies
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
Cc: kunal1.joshi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

The panning sub-tests currently loop for all the planes, but only uses
primary plane for the actual verification. Removed this redundant loop.

Also, instead of grabbing reference crc's for both blue and red fb's,
made changes to grab the reference crc based on the requirement of the
particular subtest.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_plane.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 3642d66f..2f0c9d9d 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -316,9 +316,8 @@ create_fb_for_mode__panning(data_t *data, drmModeModeInfo *mode,
 static void
 test_plane_panning_with_output(data_t *data,
 			       enum pipe pipe,
-			       int plane,
 			       igt_output_t *output,
-			       igt_crc_t *red_crc, igt_crc_t *blue_crc,
+			       igt_crc_t *ref_crc,
 			       unsigned int flags)
 {
 	igt_plane_t *primary;
@@ -326,8 +325,8 @@ test_plane_panning_with_output(data_t *data,
 	drmModeModeInfo *mode;
 	igt_crc_t crc;
 
-	igt_info("Testing connector %s using pipe %s plane %d\n",
-		 igt_output_name(output), kmstest_pipe_name(pipe), plane);
+	igt_info("Testing connector %s using pipe %s\n",
+		 igt_output_name(output), kmstest_pipe_name(pipe));
 
 	igt_output_set_pipe(output, pipe);
 
@@ -350,10 +349,7 @@ test_plane_panning_with_output(data_t *data,
 
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
 
-	if (flags & TEST_PANNING_TOP_LEFT)
-		igt_assert_crc_equal(red_crc, &crc);
-	else
-		igt_assert_crc_equal(blue_crc, &crc);
+	igt_assert_crc_equal(ref_crc, &crc);
 
 	igt_plane_set_fb(primary, NULL);
 
@@ -365,22 +361,20 @@ test_plane_panning_with_output(data_t *data,
 static void
 test_plane_panning(data_t *data, enum pipe pipe, unsigned int flags)
 {
-	int n_planes = data->display.pipes[pipe].n_planes;
 	igt_output_t *output;
-	igt_crc_t red_crc;
-	igt_crc_t blue_crc;
+	igt_crc_t ref_crc;
 
 	output = igt_get_single_output_for_pipe(&data->display, pipe);
 	igt_require(output);
 
 	test_init(data, pipe);
 
-	test_grab_crc(data, output, pipe, &red, flags, &red_crc);
-	test_grab_crc(data, output, pipe, &blue, flags, &blue_crc);
+	if (flags & TEST_PANNING_TOP_LEFT)
+		test_grab_crc(data, output, pipe, &red, flags, &ref_crc);
+	else
+		test_grab_crc(data, output, pipe, &blue, flags, &ref_crc);
 
-	for (int plane = 1; plane < n_planes; plane++)
-		test_plane_panning_with_output(data, pipe, plane, output,
-					       &red_crc, &blue_crc, flags);
+	test_plane_panning_with_output(data, pipe, output, &ref_crc, flags);
 
 	test_fini(data);
 }
-- 
2.22.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
