Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B87110E491
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Apr 2023 13:01:49 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Date: Mon,  3 Apr 2023 10:01:23 -0300
Message-Id: <20230403130124.15946-4-mcanal@igalia.com>
In-Reply-To: <20230403130124.15946-1-mcanal@igalia.com>
References: <20230403130124.15946-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/4] tests/kms_rotation_crc: add tests for a
 rotated plane in a given position
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Currently, kms_rotation_crc only has one subtest testing a rotated plane
in a given position: a subtest that rotates 90 degrees the overlay plane
with a offset in the x axis. So, expand the subtest "sprite-rotation-90-pos-100-0"
by creating subtests for 90, 180 and 270 degrees rotation with different
x and y offsets. This can help us to assure that the rotation happens
correctly even with offsets in the x and y axis.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 tests/kms_rotation_crc.c | 33 +++++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index cf02306f..441a298b 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -1134,6 +1134,23 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		{ 0, 0 }
 	};
 
+	struct rot_pos_subtest {
+		igt_rotation_t rot;
+		int pos_x;
+		int pos_y;
+	} *rot_pos, rot_pos_subtests[] = {
+		{ IGT_ROTATION_90, 0, 100 },
+		{ IGT_ROTATION_90, 100, 0 },
+		{ IGT_ROTATION_90, 100, 100 },
+		{ IGT_ROTATION_180, 0, 100 },
+		{ IGT_ROTATION_180, 100, 0 },
+		{ IGT_ROTATION_180, 100, 100 },
+		{ IGT_ROTATION_270, 0, 100 },
+		{ IGT_ROTATION_270, 100, 0 },
+		{ IGT_ROTATION_270, 100, 100 },
+		{ 0, 0 }
+	};
+
 	int gen = 0;
 
 	igt_fixture {
@@ -1170,12 +1187,16 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		}
 	}
 
-	igt_describe("Rotation test with 90 degree for a plane of gen9+ with given position");
-	igt_subtest_f("sprite-rotation-90-pos-100-0") {
-		data.rotation = IGT_ROTATION_90;
-		data.pos_x = 100,
-		data.pos_y = 0;
-		test_plane_rotation(&data, DRM_PLANE_TYPE_OVERLAY, false);
+	igt_describe("Rotation test with 90/180/270 degree for a plane of gen9+ with given position");
+	for (rot_pos = rot_pos_subtests; rot_pos->rot; rot_pos++) {
+		igt_subtest_f("sprite-rotation-%s-pos-%d-%d", rot_test_str(rot_pos->rot),
+			      rot_pos->pos_x,
+			      rot_pos->pos_y) {
+			data.rotation = rot_pos->rot;
+			data.pos_x = rot_pos->pos_x;
+			data.pos_y = rot_pos->pos_y;
+			test_plane_rotation(&data, DRM_PLANE_TYPE_OVERLAY, false);
+		}
 	}
 	data.pos_x = 0,
 	data.pos_y = 0;
-- 
2.39.2
