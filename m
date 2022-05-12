Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90ED710F8EA
 for <igt-dev@lists.freedesktop.org>; Thu, 12 May 2022 07:48:14 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 12 May 2022 13:17:59 +0530
Message-Id: <20220512074800.6416-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/kms_plane_scaling.c: Fix
 indentation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 301cf4e0..a1a883b3 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -279,13 +279,13 @@ static void test_scaler_with_modifier_pipe(data_t *d,
 		for (int i = 0; i < ARRAY_SIZE(modifiers); i++) {
 			uint64_t modifier = modifiers[i];
 
-				if (igt_plane_has_format_mod(plane, format, modifier))
-					check_scaling_pipe_plane_rot(d, plane,
-								     format, modifier,
-								     width, height,
-								     is_upscale,
-								     pipe, output,
-								     IGT_ROTATION_0);
+			if (igt_plane_has_format_mod(plane, format, modifier))
+				check_scaling_pipe_plane_rot(d, plane,
+							     format, modifier,
+							     width, height,
+							     is_upscale,
+							     pipe, output,
+							     IGT_ROTATION_0);
 		}
 	}
 }
@@ -312,13 +312,13 @@ static void test_scaler_with_rotation_pipe(data_t *d,
 		for (int i = 0; i < ARRAY_SIZE(rotations); i++) {
 			igt_rotation_t rot = rotations[i];
 
-				if (igt_plane_has_rotation(plane, rot))
-					check_scaling_pipe_plane_rot(d, plane,
-								     format, modifier,
-								     width, height,
-								     is_upscale,
-								     pipe, output,
-								     rot);
+			if (igt_plane_has_rotation(plane, rot))
+				check_scaling_pipe_plane_rot(d, plane,
+							     format, modifier,
+							     width, height,
+							     is_upscale,
+							     pipe, output,
+							     rot);
 		}
 	}
 }
-- 
2.25.1
