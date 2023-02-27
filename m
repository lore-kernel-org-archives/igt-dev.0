Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A784E10E20D
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Feb 2023 13:41:26 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 27 Feb 2023 19:13:45 +0530
Message-Id: <20230227134347.28053-3-swati2.sharma@intel.com>
In-Reply-To: <20230227134347.28053-1-swati2.sharma@intel.com>
References: <20230227134347.28053-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 2/4] tests/kms_plane_scaling: Minor fixes
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

Minor fixes are done in the existing test.

v2: -indentation (JP)
    -added invalid_parameter_tests() inside igt_subtest_group
     macro (JP)
v3: -moved 2x-scaler-multi-pipe test in the end

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index ecb4087f4..c384a0316 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -931,9 +931,9 @@ static void invalid_parameter_tests(data_t *d)
 		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
 		igt_create_fb(d->drm_fd, 256, 256,
-			DRM_FORMAT_XRGB8888,
-			DRM_FORMAT_MOD_NONE,
-			&fb);
+			      DRM_FORMAT_XRGB8888,
+			      DRM_FORMAT_MOD_NONE,
+			      &fb);
 	}
 
 	igt_describe("test parameters which should not be accepted");
@@ -943,14 +943,13 @@ static void invalid_parameter_tests(data_t *d)
 				igt_plane_set_position(plane, 0, 0);
 				igt_plane_set_fb(plane, &fb);
 				igt_plane_set_size(plane,
-							paramtests[i].planesize[0],
-							paramtests[i].planesize[1]);
-
+						   paramtests[i].planesize[0],
+						   paramtests[i].planesize[1]);
 
 				for (uint32_t j = 0; paramtests[i].params[j].prop != ~0; j++)
 					igt_plane_set_prop_value(plane,
-									paramtests[i].params[j].prop,
-									paramtests[i].params[j].value);
+								 paramtests[i].params[j].prop,
+								 paramtests[i].params[j].value);
 
 				rval = igt_display_try_commit2(&d->display, COMMIT_ATOMIC);
 
@@ -1124,12 +1123,13 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		}
 	}
 
+	igt_subtest_group
+		invalid_parameter_tests(&data);
+
 	igt_describe("Tests scaling with multi-pipe.");
 	igt_subtest_f("2x-scaler-multi-pipe")
 		test_scaler_with_multi_pipe_plane(&data);
 
-	invalid_parameter_tests(&data);
-
 	igt_fixture {
 		igt_display_fini(&data.display);
 		close(data.drm_fd);
-- 
2.25.1
