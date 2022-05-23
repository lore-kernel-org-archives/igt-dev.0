Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F8F10E7C3
 for <igt-dev@lists.freedesktop.org>; Mon, 23 May 2022 08:09:23 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 23 May 2022 13:39:31 +0530
Message-Id: <20220523080932.9326-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/2] tests/kms_plane_scaling: Fix
 indentation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
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
