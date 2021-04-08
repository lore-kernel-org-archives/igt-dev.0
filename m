Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61A76EA1F
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Apr 2021 07:27:53 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
Date: Thu,  8 Apr 2021 13:07:48 +0530
Message-Id: <20210408073748.26234-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_lowres : Added test
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
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Added test description.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_plane_lowres.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index a5af1f8a..5cfe53c8 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -301,15 +301,23 @@ igt_main
 
 	for_each_pipe_static(pipe) {
 		data.pipe = pipe;
+		igt_describe("Tests the visibility of the planes when switching between "
+			     "high and low resolution with tiling as none.");
 		igt_subtest_f("pipe-%s-tiling-none", kmstest_pipe_name(pipe))
 			test_planes_on_pipe(&data, LOCAL_DRM_FORMAT_MOD_NONE);
 
+		igt_describe("Tests the visibility of the planes when switching between "
+			     "high and low resolution with x-tiling.");
 		igt_subtest_f("pipe-%s-tiling-x", kmstest_pipe_name(pipe))
 			test_planes_on_pipe(&data, LOCAL_I915_FORMAT_MOD_X_TILED);
 
+		igt_describe("Tests the visibility of the planes when switching between "
+			     "high and low resolution with y-tiling.");
 		igt_subtest_f("pipe-%s-tiling-y", kmstest_pipe_name(pipe))
 			test_planes_on_pipe(&data, LOCAL_I915_FORMAT_MOD_Y_TILED);
 
+		igt_describe("Tests the visibility of the planes when switching between "
+			     "high and low resolution with yf-tiling.");
 		igt_subtest_f("pipe-%s-tiling-yf", kmstest_pipe_name(pipe))
 			test_planes_on_pipe(&data, LOCAL_I915_FORMAT_MOD_Yf_TILED);
 	}
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
