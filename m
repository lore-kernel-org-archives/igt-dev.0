Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E69166E9CC
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Mar 2021 07:30:32 +0000 (UTC)
From: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Date: Wed, 10 Mar 2021 13:01:39 +0530
Message-Id: <20210310073139.38013-1-arundhati.hagaragi@intel.com>
In-Reply-To: <20210309112943.1398325-1-arundhati.hagaragi@intel.com>
References: <20210309112943.1398325-1-arundhati.hagaragi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v10] tests/kms_plane_scaling: Add plane
 scaling test descriptions for subtests
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
Cc: Mohammed <mohammed.khajapasha@intel.com>, Nidhi Gupta <nidhi1.gupta@intel.com>, Khajapasha@freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Nidhi Gupta <nidhi1.gupta@intel.com>

Add plane scaling test descriptions for subtests.
Plane scaling with tiling rotation, pixel formats, overlay planes and with
clipping and clamping

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
Reviewed-by: Khajapasha, Mohammed <mohammed.khajapasha@intel.com>

v1-v10 : Review Comments (Khaja)
---
 tests/kms_plane_scaling.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index c63eb428..e8bf78e7 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -695,32 +695,38 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		igt_output_t *output;
 
 		igt_subtest_with_dynamic("plane-scaling") {
+			igt_describe("Test plane scaling with overlay planes");
 			for_each_pipe_with_single_output(&data.display, pipe, output)
 				igt_dynamic_f("pipe-%s-plane-scaling", kmstest_pipe_name(pipe))
 					test_plane_scaling_on_pipe(&data, pipe, output);
 		}
 
 		igt_subtest_with_dynamic("scaler-with-pixel-format") {
+			igt_describe("Test plane scaling with pixel formats");
 			for_each_pipe_with_single_output(&data.display, pipe, output)
 				igt_dynamic_f("pipe-%s-scaler-with-pixel-format", kmstest_pipe_name(pipe))
 					test_scaler_with_pixel_format_pipe(&data, pipe, output);
 		}
 
 		igt_subtest_with_dynamic("scaler-with-rotation") {
+			igt_describe("Test plane scaling with rotation");
 			for_each_pipe_with_single_output(&data.display, pipe, output)
 				igt_dynamic_f("pipe-%s-scaler-with-rotation", kmstest_pipe_name(pipe))
 					test_scaler_with_rotation_pipe(&data, pipe, output);
 		}
 
 		igt_subtest_with_dynamic("scaler-with-clipping-clamping") {
+			igt_describe("Test plane scaling with clipping-clamping");
 			for_each_pipe_with_single_output(&data.display, pipe, output)
 				igt_dynamic_f("pipe-%s-scaler-with-clipping-clamping", kmstest_pipe_name(pipe))
 					test_scaler_with_clipping_clamping_scenario(&data, pipe, output);
 		}
 	}
 
-	igt_subtest_f("2x-scaler-multi-pipe")
+	igt_subtest_f("2x-scaler-multi-pipe") {
+		igt_describe("Test multi plane scaling with connected outputs for pipes");
 		test_scaler_with_multi_pipe_plane(&data);
+	}
 
 	igt_fixture
 		igt_display_fini(&data.display);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
